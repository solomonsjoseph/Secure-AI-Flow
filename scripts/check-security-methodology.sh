#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "README.md"
  "CLAUDE.md"
  "SECURITY-OPERATING-CONTRACT.md"
  "governance/00-risk-appetite-and-authority.md"
  "governance/01-control-standard-map.md"
  "governance/02-human-approval-policy.md"
  "governance/03-regulatory-obligations.md"
  "context/01-product-charter.md"
  "context/02-data-classification-and-privacy.md"
  "context/03-system-context-and-trust-boundaries.md"
  "context/04-threat-model.md"
  "context/05-secure-architecture.md"
  "context/06-security-requirements.md"
  "context/07-agent-security-model.md"
  "context/08-design-system-and-ux-rules.md"
  "context/09-secure-coding-standards.md"
  "context/10-testing-and-verification.md"
  "context/11-supply-chain-security.md"
  "context/12-observability-and-incident-response.md"
  "context/13-reviewer-playbook.md"
  "context/14-progress-risk-and-evidence-register.md"
  "adr/ADR-0001-example.md"
  "specs/000-build-roadmap.md"
  "specs/001-secure-file-upload.md"
  "ci/security-gates.md"
  ".github/pull_request_template.md"
  "scripts/check-requirement-traceability.sh"
)

missing=0
for f in "${required_files[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "Missing required file: $f" >&2
    missing=1
  fi
done

required_dirs=(
  "evidence/reviews"
  "evidence/test-runs"
  "evidence/threat-model-updates"
  "evidence/dependency-reviews"
  "evidence/release-gates"
)

for d in "${required_dirs[@]}"; do
  if [[ ! -d "$d" ]]; then
    echo "Missing required directory: $d" >&2
    missing=1
  fi
done

if [[ "$missing" -ne 0 ]]; then
  echo "Security methodology structure check failed." >&2
  exit 1
fi

grep -q "Security before features" SECURITY-OPERATING-CONTRACT.md || { echo "Operating contract missing priority rule" >&2; exit 1; }
grep -q "Non-Negotiable Blockers" SECURITY-OPERATING-CONTRACT.md || { echo "Operating contract missing blockers" >&2; exit 1; }
grep -q "Data Classification" context/02-data-classification-and-privacy.md || { echo "Data classification file missing expected heading" >&2; exit 1; }
grep -q "Threat Model" context/04-threat-model.md || { echo "Threat model file missing expected heading" >&2; exit 1; }
grep -q "PASS WITH MINOR NOTES" context/13-reviewer-playbook.md || { echo "Reviewer playbook missing verdict protocol" >&2; exit 1; }

echo "Security methodology structure check passed."
