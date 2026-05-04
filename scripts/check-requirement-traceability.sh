#!/usr/bin/env bash
set -euo pipefail

python3 - <<'PY'
from pathlib import Path
import re
import sys

requirements_path = Path("context/06-security-requirements.md")
specs_dir = Path("specs")
valid_id_pattern = re.compile(r"^[A-Z][A-Z0-9]+-[0-9]{3}$")
source_id_pattern = re.compile(r"\b[A-Z][A-Z0-9]+-\d{3}\b")

valid_ids = set(source_id_pattern.findall(requirements_path.read_text(encoding="utf-8")))

errors = []
for spec_path in sorted(specs_dir.glob("*.md")):
    lines = spec_path.read_text(encoding="utf-8").splitlines()
    in_security_requirements = False

    for line_number, line in enumerate(lines, start=1):
        if line.startswith("## "):
            in_security_requirements = line.strip() == "## Security Requirements"
            continue

        if not in_security_requirements:
            continue

        stripped = line.strip()
        if not stripped or not stripped.startswith("-"):
            continue

        bullet = stripped[1:].strip()
        if bullet == "":
            continue

        first_token = bullet.split()[0]
        if not valid_id_pattern.fullmatch(first_token):
            issue = "malformed ID" if ("-" in first_token or any(c.isdigit() for c in first_token)) else "missing ID"
            value = first_token if issue == "malformed ID" else bullet
            errors.append((spec_path, line_number, value, issue))
            continue

        if first_token not in valid_ids:
            errors.append((spec_path, line_number, first_token, "unknown ID"))

if errors:
    for spec_path, line_number, value, issue in errors:
        print("Invalid security requirement ID reference:", file=sys.stderr)
        print(f"  file: {spec_path}", file=sys.stderr)
        print(f"  line: {line_number}", file=sys.stderr)
        print(f"  issue: {issue}", file=sys.stderr)
        print(f"  value: {value}", file=sys.stderr)
        print(f"  valid IDs source: {requirements_path}", file=sys.stderr)
    sys.exit(1)

print("Requirement traceability check passed.")
PY
