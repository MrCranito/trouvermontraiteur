import re
from pathlib import Path

path = Path("supabase/migrations/20260930183000_link_toulouse_traiteur_images.sql")
sql = path.read_text(encoding="utf-8")
updated, count = re.subn(
    r"(\$p\d+\$)(?!tmt-image-staging/)([0-9a-f-]{36}/\d+\.jpg)",
    r"\1tmt-image-staging/\2",
    sql,
)
path.write_text(updated, encoding="utf-8")
print(count)
