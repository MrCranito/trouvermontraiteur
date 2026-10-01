"""Upload staged photo/video images to the craftsmans_images bucket."""

import subprocess
import time
from pathlib import Path

STAGING = Path(r"C:\Users\victo\AppData\Local\Temp\tmt-photo-video-staging")
BIN = Path(
    r"C:\Users\victo\AppData\Roaming\npm\node_modules\supabase\node_modules\@supabase\cli-windows-x64\bin\supabase.exe"
)
WORKDIR = Path(r"C:\Users\victo\AppData\Local\Temp\tmt-sb-run")


def main() -> None:
    files = sorted(path for path in STAGING.rglob("*.jpg") if path.is_file())
    print(f"upload {len(files)}", flush=True)
    failed: list[str] = []

    for index, photo in enumerate(files, start=1):
        rel = photo.relative_to(STAGING).as_posix()
        destination = f"ss:///craftsmans_images/{rel}"
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
            if "429" in output or "SlowDown" in output or "too_many_connections" in output:
                time.sleep(4 * (attempt + 1))
                continue
            print(f"FAIL {rel} {output[-400:]}", flush=True)
            break
        if ok:
            if index % 50 == 0 or index == len(files):
                print(f"{index}/{len(files)}", flush=True)
        else:
            failed.append(rel)
        time.sleep(0.12)

    print(f"failed {len(failed)}", flush=True)
    for key in failed:
        print(key, flush=True)


if __name__ == "__main__":
    main()
