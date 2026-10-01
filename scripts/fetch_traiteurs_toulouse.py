import os
import re
import sys
import json
import time
import requests
from pathlib import Path

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
if hasattr(sys.stderr, "reconfigure"):
    sys.stderr.reconfigure(encoding="utf-8", errors="replace")


# ============================================================
# CONFIGURATION
# ============================================================

API_KEY = os.getenv("GOOGLE_PLACES_API_KEY")

if not API_KEY:
    raise RuntimeError(
        "La variable d'environnement GOOGLE_PLACES_API_KEY n'est pas définie."
    )

OUTPUT_DIR = Path("animation_toulouse")

# Plafond après déduplication, réparti entre les métiers Animation.
MAX_PER_CATEGORY = {
    "Animateur": 30,
    "Jeux & quiz": 20,
    "Spectacles": 25,
    "Magicien": 20,
    "Activités": 20,
}

# Toulouse centre
LATITUDE = 43.6047
LONGITUDE = 1.4442

# Rayon autour de Toulouse
RADIUS_METERS = 30000

# Nombre maximum de photos par établissement
MAX_PHOTOS = 10

# Taille max des images téléchargées
MAX_WIDTH_PX = 1600
MAX_HEIGHT_PX = 1600


# ============================================================
# URLS GOOGLE PLACES API NEW
# ============================================================

TEXT_SEARCH_URL = (
    "https://places.googleapis.com/v1/places:searchText"
)

PHOTO_URL = (
    "https://places.googleapis.com/v1/{photo_name}/media"
)


# ============================================================
# UTILITAIRES
# ============================================================

def sanitize_filename(name: str) -> str:
    """
    Transforme un nom d'établissement en nom de dossier sûr.
    """

    name = name.strip()

    # Supprime les caractères interdits Windows/Linux
    name = re.sub(r'[<>:"/\\|?*]', '', name)

    # Remplace les espaces multiples
    name = re.sub(r'\s+', ' ', name)

    # Évite les noms vides
    if not name:
        name = "animation_sans_nom"

    return name[:150]


def unique_folder(base_dir: Path, name: str) -> Path:
    """
    Évite les collisions de dossiers.
    """

    folder = base_dir / sanitize_filename(name)

    if not folder.exists():
        return folder

    counter = 2

    while True:
        candidate = base_dir / f"{sanitize_filename(name)} ({counter})"

        if not candidate.exists():
            return candidate

        counter += 1


# ============================================================
# RECHERCHE GOOGLE PLACES
# ============================================================

def search_places(query: str, page_token: str | None = None):
    """
    Recherche des établissements avec Text Search (New).
    """

    headers = {
        "Content-Type": "application/json",
        "X-Goog-Api-Key": API_KEY,
        "X-Goog-FieldMask": (
            "places.id,"
            "places.displayName,"
            "places.formattedAddress,"
            "places.location,"
            "places.nationalPhoneNumber,"
            "places.internationalPhoneNumber,"
            "places.websiteUri,"
            "places.googleMapsUri,"
            "places.rating,"
            "places.userRatingCount,"
            "places.photos,"
            "places.primaryType,"
            "nextPageToken"
        ),
    }

    body = {
        "textQuery": query,
        "languageCode": "fr",
        "regionCode": "FR",

        "locationBias": {
            "circle": {
                "center": {
                    "latitude": LATITUDE,
                    "longitude": LONGITUDE
                },
                "radius": RADIUS_METERS
            }
        },

        "pageSize": 20
    }

    if page_token:
        body["pageToken"] = page_token

    response = requests.post(
        TEXT_SEARCH_URL,
        headers=headers,
        json=body,
        timeout=30
    )

    if response.status_code != 200:
        print("Erreur Google Places:")
        print(response.status_code)
        print(response.text)
        return [], None

    data = response.json()

    return data.get("places", []), data.get("nextPageToken")


# ============================================================
# TELECHARGEMENT PHOTO
# ============================================================

def download_photo(photo_name: str, output_file: Path):
    """
    Récupère une photo Google Places.

    skipHttpRedirect=true permet d'obtenir la photoUri,
    puis on télécharge réellement l'image.
    """

    params = {
        "key": API_KEY,
        "maxWidthPx": MAX_WIDTH_PX,
        "maxHeightPx": MAX_HEIGHT_PX,
        "skipHttpRedirect": "true"
    }

    url = PHOTO_URL.format(
        photo_name=photo_name
    )

    try:

        response = requests.get(
            url,
            params=params,
            timeout=30
        )

        if response.status_code != 200:
            print(
                f"    ❌ Erreur photo "
                f"{response.status_code}"
            )
            return False

        data = response.json()

        photo_uri = data.get("photoUri")

        if not photo_uri:
            print("    ❌ photoUri introuvable")
            return False

        image_response = requests.get(
            photo_uri,
            timeout=60
        )

        if image_response.status_code != 200:
            print(
                f"    ❌ Impossible de télécharger "
                f"l'image ({image_response.status_code})"
            )
            return False

        output_file.write_bytes(
            image_response.content
        )

        return True

    except requests.RequestException as e:

        print(f"    ❌ Erreur réseau: {e}")

        return False


# ============================================================
# TRAITEMENT D'UN TRAITEUR
# ============================================================

SKIP_PRIMARY_TYPES = {
    "department_store",
    "shopping_mall",
    "supermarket",
    "grocery_store",
    "hardware_store",
    "restaurant",
    "cafe",
    "bar",
    "meal_delivery",
    "meal_takeaway",
    "lodging",
    "school",
    "university",
    "book_store",
    "furniture_store",
    "home_goods_store",
    "bakery",
    "florist",
    "photographer",
    "gym",
    "church",
    "place_of_worship",
}

VENUE_PRIMARY_TYPES = {
    "night_club",
    "event_venue",
    "concert_hall",
    "performing_arts_theater",
    "banquet_hall",
    "convention_center",
    "movie_theater",
    "amusement_center",
    "tourist_attraction",
    "community_center",
    "cultural_center",
    "live_music_venue",
    "auditorium",
    "educational_institution",
}

SKIP_NAME_MARKERS = (
    "photobooth",
    "photo booth",
    "wedding planner",
    "traiteur",
    "fleuriste",
    "pâtiss",
    "patiss",
    "cake design",
    "photographe",
    "école",
    "ecole",
    "cfa",
    "formation",
    "pharmacie",
    "ongle",
    "nail",
    "leclerc",
    "carrefour",
    "auchan",
    "school",
    "cocktail",
    "production audiovisuelle",
    "communication audiovisuelle",
    "team building",
    "association",
    "film",
    "filmmaking",
    "réalisateur",
    "realisateur",
    "barnum",
    "tente",
    "mobilier",
    "vaisselle",
    "lampe",
    "officiant",
    "cérémonies",
    "ceremonies",
    "faire-part",
    "décoration",
    "decoration",
    "maquillage",
    "strip",
    "disco",
    "château gonflable",
    "chateau gonflable",
    "structure gonflable",
    "structures gonflables",
    "wedding designer",
    "musicale",
    "église",
    "eglise",
    "éducation",
    "education",
    "citoyen",
)


def animation_categories(name: str) -> list[str]:
    found: list[str] = []
    if any(
        token in name
        for token in ("magicien", "magicienne", "magie", "mentaliste", "illusion")
    ):
        found.append("Magicien")
    if any(
        token in name
        for token in (
            "quiz",
            "blind test",
            "blindtest",
            "karaoke",
            "karaok",
            "murder",
            "casino",
            "jeux",
            "jeu ",
        )
    ):
        found.append("Jeux & quiz")
    if any(
        token in name
        for token in (
            "spectacle",
            "cirque",
            "cracheur",
            "danseur",
            "danseuse",
            "échassier",
            "echassier",
            "jongleur",
            "clown",
            "chorégraph",
            "choregraph",
            "comédien",
            "comedien",
            "déambul",
            "deambul",
            "savants",
        )
    ):
        found.append("Spectacles")
    if any(
        token in name
        for token in (
            "chasse au trésor",
            "chasse au tresor",
            "olympiade",
            "enfants",
            "ludique",
            "loisirs",
        )
    ):
        found.append("Activités")
    if any(
        token in name
        for token in (
            "animateur",
            "animatrice",
            "animation",
            "animations",
            "anims",
            "maître de cérémonie",
            "maitre de ceremonie",
            "maitre de cérémonie",
        )
    ):
        found.append("Animateur")
    return found


def is_unrelated_place(place: dict) -> bool:
    name = place.get("displayName", {}).get("text", "").lower()
    primary_type = place.get("primaryType") or ""
    categories = animation_categories(name)
    if any(marker in name for marker in SKIP_NAME_MARKERS):
        return True
    if re.search(r"\bdj\b", name) or "vidéaste" in name or "videaste" in name:
        return True
    if "restaurant" in name or primary_type.endswith("_restaurant"):
        return True
    if "location" in name and "animation" not in name and "animateur" not in name:
        return True
    if "agence" in name and not categories:
        return True
    address = (place.get("formattedAddress") or "").lower()
    far_cities = ("montpellier", "perpignan", "narbonne", "bordeaux", "lyon", "marseille")
    if (
        any(city in name for city in far_cities)
        and "toulouse" not in name
        and "toulouse" not in address
    ):
        return True
    if primary_type in VENUE_PRIMARY_TYPES or primary_type in {
        "non_profit_organization",
        "warehouse_store",
        "sports_activity_location",
        "sports_complex",
        "museum",
        "planetarium",
        "indoor_playground",
        "amusement_park",
        "clothing_store",
        "cosmetics_store",
        "tailor",
        "sports_school",
        "store",
        "park",
    }:
        return True
    if primary_type == "association_or_organization":
        if not categories:
            return True
        if categories == ["Jeux & quiz"] and not any(
            token in name
            for token in ("animation", "mariage", "événement", "evenement", "murder", "quiz")
        ):
            return True
    return not categories


def refine_sub_category(place: dict) -> str:
    """
    Garde le métier de la requête quand le nom correspond,
    sinon le métier d'animation indiqué par le nom.
    """

    name = place.get("displayName", {}).get("text", "").lower()
    category = place.get("_sub_category") or "Animateur"
    found = animation_categories(name)
    specific = [item for item in found if item != "Animateur"]

    if category in specific:
        return category
    if specific:
        return specific[0]
    if "Animateur" in found or category == "Animateur":
        return "Animateur"
    return category


def process_place(place: dict, index: int):

    display_name = place.get(
        "displayName",
        {}
    ).get(
        "text",
        f"Animateur {index}"
    )

    print()
    print("=" * 70)
    print(f"[{index}] {display_name}")
    print("=" * 70)

    folder = unique_folder(
        OUTPUT_DIR,
        display_name
    )

    folder.mkdir(
        parents=True,
        exist_ok=True
    )

    # --------------------------------------------------------
    # Informations
    # --------------------------------------------------------

    location = place.get(
        "location",
        {}
    )

    info = {
        "name": display_name,

        "place_id": place.get("id"),

        "address": place.get(
            "formattedAddress"
        ),

        "latitude": location.get(
            "latitude"
        ),

        "longitude": location.get(
            "longitude"
        ),

        "phone": place.get(
            "nationalPhoneNumber"
        ) or place.get(
            "internationalPhoneNumber"
        ),

        "website": place.get(
            "websiteUri"
        ),

        "google_maps": place.get(
            "googleMapsUri"
        ),

        "rating": place.get(
            "rating"
        ),

        "review_count": place.get(
            "userRatingCount"
        ),

        "primary_type": place.get(
            "primaryType"
        ),

        "sub_category": refine_sub_category(place),

        "photos": []
    }

    # --------------------------------------------------------
    # Photos
    # --------------------------------------------------------

    photos = place.get(
        "photos",
        []
    )

    photos = photos[:MAX_PHOTOS]

    print(
        f"Photos disponibles : {len(photos)}"
    )

    for photo_index, photo in enumerate(
        photos,
        start=1
    ):

        photo_name = photo.get("name")

        if not photo_name:
            continue

        filename = (
            folder /
            f"photo_{photo_index:02d}.jpg"
        )

        print(
            f"    📷 Téléchargement "
            f"{photo_index}/{len(photos)}..."
        )

        success = download_photo(
            photo_name,
            filename
        )

        if success:

            info["photos"].append({
                "filename": filename.name,
                "width": photo.get("widthPx"),
                "height": photo.get("heightPx"),
                "author_attributions": photo.get(
                    "authorAttributions",
                    []
                )
            })

            print(
                f"    ✓ {filename.name}"
            )

        # Petite pause pour éviter
        # d'enchaîner trop rapidement
        time.sleep(0.1)

    # --------------------------------------------------------
    # Sauvegarde JSON
    # --------------------------------------------------------

    info_file = folder / "info.json"

    with open(
        info_file,
        "w",
        encoding="utf-8"
    ) as f:

        json.dump(
            info,
            f,
            ensure_ascii=False,
            indent=2
        )

    print(
        f"✓ Sauvegardé : {folder}"
    )


# ============================================================
# MAIN
# ============================================================

def main():

    OUTPUT_DIR.mkdir(
        parents=True,
        exist_ok=True
    )

    print()
    print("==============================================")
    print(" GOOGLE PLACES - ANIMATION TOULOUSE")
    print("==============================================")
    print()

    # Animateurs, jeux, spectacles, magiciens et activités pour mariages et événements.
    queries = [
        ("Animateur", "animateur mariage Toulouse"),
        ("Animateur", "animation événementielle Toulouse"),
        ("Animateur", "animation enfants Toulouse"),
        ("Animateur", "animation anniversaire Toulouse"),
        ("Jeux & quiz", "murder party mariage Toulouse"),
        ("Jeux & quiz", "quiz animation mariage Toulouse"),
        ("Jeux & quiz", "jeux interactifs événement Toulouse"),
        ("Jeux & quiz", "animation ludique Toulouse"),
        ("Spectacles", "spectacle mariage Toulouse"),
        ("Spectacles", "cracheur de feu Toulouse"),
        ("Spectacles", "échassier spectacle Toulouse"),
        ("Spectacles", "echassier art de rue Toulouse"),
        ("Spectacles", "jongleur mariage Toulouse"),
        ("Spectacles", "clown mariage Toulouse"),
        ("Spectacles", "danseuse mariage Toulouse"),
        ("Spectacles", "spectacle de rue mariage Toulouse"),
        ("Magicien", "magicien mariage Toulouse"),
        ("Magicien", "magicien close-up Toulouse"),
        ("Magicien", "mentaliste événement Toulouse"),
        ("Magicien", "magie enfants mariage Toulouse"),
        ("Activités", "animation enfants mariage Toulouse"),
        ("Activités", "chasse au trésor mariage Toulouse"),
        ("Activités", "spectacle scientifique enfants Toulouse"),
        ("Activités", "animation anniversaire enfants Toulouse"),
    ]

    places = {}

    for category, query in queries:

        print()
        print(f"🔎 Recherche : {query} [{category}]")

        page_token = None
        query_count = 0

        for page in range(3):
            results, page_token = search_places(query, page_token)
            query_count += len(results)

            for place in results:

                place_id = place.get("id")

                if not place_id:
                    continue

                primary_type = place.get("primaryType")
                if primary_type in SKIP_PRIMARY_TYPES:
                    continue

                if is_unrelated_place(place):
                    continue

                if place_id not in places:
                    place["_sub_category"] = category
                    places[place_id] = place

            if not page_token:
                break

            time.sleep(2)

        print(
            f"   → {query_count} résultats"
        )

        print(
            f"   Total unique : {len(places)}"
        )

        time.sleep(0.5)

    grouped = {category: [] for category in MAX_PER_CATEGORY}

    for place in places.values():
        category = refine_sub_category(place)
        place["_sub_category"] = category
        grouped[category].append(place)

    selected_places = []

    for category, bucket in grouped.items():
        def rank(item: dict) -> tuple[int, int]:
            name = item.get("displayName", {}).get("text", "").lower()
            wedding = any(
                token in name
                for token in (
                    "mariage",
                    "événement",
                    "evenement",
                    "animation",
                    "spectacle",
                    "magie",
                    "magicien",
                )
            )
            return (1 if wedding else 0, item.get("userRatingCount") or 0)

        bucket.sort(key=rank, reverse=True)
        kept = bucket[: MAX_PER_CATEGORY[category]]
        selected_places.extend(kept)
        print(
            f"{category}: {len(bucket)} trouvés, {len(kept)} retenus"
        )

    preview = OUTPUT_DIR / "_selection.json"
    preview.write_text(
        json.dumps(
            [
                {
                    "name": place.get("displayName", {}).get("text"),
                    "primary_type": place.get("primaryType"),
                    "sub_category": place.get("_sub_category"),
                    "reviews": place.get("userRatingCount"),
                }
                for place in selected_places
            ],
            ensure_ascii=False,
            indent=2,
        ),
        encoding="utf-8",
    )

    print()
    print("==============================================")
    print(
        f" {len(selected_places)} PROFESSIONNELS ANIMATION"
    )
    print("==============================================")

    if os.getenv("SKIP_PHOTOS") == "1":
        print(f"Sélection écrite : {preview}")
        return

    # --------------------------------------------------------
    # Téléchargement
    # --------------------------------------------------------

    for index, place in enumerate(
        selected_places,
        start=1
    ):

        try:

            process_place(
                place,
                index
            )

        except Exception as e:

            print(
                f"❌ Erreur avec le professionnel "
                f"{index}: {e}"
            )

    print()
    print("==============================================")
    print(" TERMINÉ")
    print("==============================================")
    print()
    print(
        f"Dossier : {OUTPUT_DIR.absolute()}"
    )


if __name__ == "__main__":
    main()
