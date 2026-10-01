"""Upload traiteur photos that are not yet in the craftsmans_images bucket."""

import json
import subprocess
import time
from pathlib import Path

STAGING = Path(r"C:\Users\victo\AppData\Local\Temp\tmt-image-staging")
EXISTING = Path(r"C:\Users\victo\AppData\Local\Temp\tmt-storage-names.json")
BIN = Path(
    r"C:\Users\victo\AppData\Roaming\npm\node_modules\supabase\node_modules\@supabase\cli-windows-x64\bin\supabase.exe"
)
WORKDIR = Path(r"C:\Users\victo\AppData\Local\Temp\tmt-sb-run")
PREFIX = "tmt-image-staging"


def main() -> None:
    payload = json.loads(EXISTING.read_text(encoding="utf-8-sig"))
    present = {row["name"] for row in payload["rows"]}
    missing: list[tuple[str, str]] = []

    for folder in sorted(path for path in STAGING.iterdir() if path.is_dir()):
        for photo in sorted(folder.glob("*.jpg"), key=lambda item: int(item.stem)):
            key = f"{PREFIX}/{folder.name}/{photo.name}"
            if key not in present:
                missing.append((f"{folder.name}/{photo.name}", key))

    print(f"missing {len(missing)}", flush=True)
    failed: list[str] = []

    for index, (rel, key) in enumerate(missing, start=1):
        destination = f"ss:///craftsmans_images/{key}"
        ok = False
        for attempt in range(6):
            result = subprocess.run(
                [
                    str(BIN),
                    "--experimental",
                    "storage",
                    "cp",
                    "--linked",
                    "--workdir",
                    str(WORKDIR),
                    "--content-type",
                    "image/jpeg",
                    rel,
                    destination,
                ],
                cwd=STAGING,
                capture_output=True,
                text=True,
                encoding="utf-8",
                errors="replace",
            )
            output = f"{result.stdout}\n{result.stderr}"
            if result.returncode == 0:
                ok = True
                break
            if "429" in output or "SlowDown" in output:
                time.sleep(4 * (attempt + 1))
                continue
            print(f"FAIL {key} {output[-400:]}", flush=True)
            break
        if ok:
            if index % 25 == 0 or index == len(missing):
                print(f"{index}/{len(missing)}", flush=True)
        else:
            failed.append(key)
        time.sleep(0.15)

    print(f"failed {len(failed)}", flush=True)
    for key in failed:
        print(key, flush=True)


if __name__ == "__main__":
    main()
