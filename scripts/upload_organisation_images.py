"""Upload organisation photos that are not yet in storage."""

import subprocess
import time
import urllib.request
from pathlib import Path

STAGING = Path(r"C:\Users\victo\AppData\Local\Temp\tmt-organisation-staging")
PREFIX = "organisation"
BIN = Path(
    r"C:\Users\victo\AppData\Roaming\npm\node_modules\supabase\node_modules\@supabase\cli-windows-x64\bin\supabase.exe"
)
WORKDIR = Path(r"C:\Users\victo\AppData\Local\Temp\tmt-sb-run")
BASE = (
    "https://hiyvhwosjkbfcxdsbmcy.supabase.co/storage/v1/object/public/"
    "craftsmans_images/organisation/"
)


def exists(rel: str) -> bool:
    request = urllib.request.Request(BASE + rel, method="HEAD")
    try:
        with urllib.request.urlopen(request, timeout=20) as response:
            return response.status == 200
    except Exception:
        return False


def main() -> None:
    root = STAGING / PREFIX
    missing = []
    for photo in sorted(root.rglob("*.jpg")):
        rel = photo.relative_to(root).as_posix()
        if not exists(rel):
            missing.append(rel)
    print(f"missing {len(missing)}", flush=True)
    failed: list[str] = []

    for index, rel in enumerate(missing, start=1):
        source = f"{PREFIX}/{rel}"
        destination = f"ss:///craftsmans_images/{PREFIX}/{rel}"
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
                    source,
                    destination,
                ],
                cwd=STAGING,
                capture_output=True,
                text=True,
                encoding="utf-8",
                errors="replace",
            )
            output = f"{result.stdout}\n{result.stderr}"
            if "KeyAlreadyExists" in output or "Duplicate" in output or (
                result.returncode == 0 and exists(rel)
            ):
                ok = True
                break
            if "429" in output or "SlowDown" in output or "too_many_connections" in output:
                time.sleep(5 * (attempt + 1))
                continue
            print(f"FAIL {rel} {output[-300:]}", flush=True)
            break
        if ok:
            if index % 25 == 0 or index == len(missing):
                print(f"{index}/{len(missing)}", flush=True)
        else:
            failed.append(rel)
        time.sleep(0.25)

    print(f"failed {len(failed)}", flush=True)
    for key in failed:
        print(key, flush=True)


if __name__ == "__main__":
    main()
