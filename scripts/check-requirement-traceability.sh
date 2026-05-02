#!/usr/bin/env bash
set -euo pipefail

python3 - <<'PY'
from pathlib import Path
import re
import sys

requirements_path = Path("context/06-security-requirements.md")
specs_dir = Path("specs")
id_pattern = re.compile(r"\b[A-Z][A-Z0-9]+-\d{3}\b")

valid_ids = set(id_pattern.findall(requirements_path.read_text(encoding="utf-8")))

invalid_refs = []
for spec_path in sorted(specs_dir.glob("*.md")):
    lines = spec_path.read_text(encoding="utf-8").splitlines()
    in_security_requirements = False

    for line in lines:
        if line.startswith("## "):
            in_security_requirements = line.strip() == "## Security Requirements"
            continue

        if not in_security_requirements:
            continue

        for requirement_id in id_pattern.findall(line):
            if requirement_id not in valid_ids:
                invalid_refs.append((spec_path, requirement_id))

if invalid_refs:
    for spec_path, requirement_id in invalid_refs:
        print("Invalid security requirement ID reference:", file=sys.stderr)
        print(f"  file: {spec_path}", file=sys.stderr)
        print(f"  invalid ID: {requirement_id}", file=sys.stderr)
        print(f"  valid IDs source: {requirements_path}", file=sys.stderr)
    sys.exit(1)

print("Requirement traceability check passed.")
PY
