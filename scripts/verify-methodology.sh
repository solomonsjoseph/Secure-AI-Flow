#!/usr/bin/env bash
set -euo pipefail

required=(
  "CLAUDE.md"
  "SECURITY-OPERATING-CONTRACT.md"
  "governance/00-risk-appetite-and-authority.md"
  "governance/01-control-standard-map.md"
  "governance/02-human-approval-policy.md"
  "governance/03-regulatory-obligations.md"
  "governance/04-maturity-model.md"
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
  "context/15-security-stress-test-matrix.md"
  "ci/security-gates.md"
  "references/official-source-map.md"
  "scripts/check-requirement-traceability.sh"
)

missing=0
for f in "${required[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "Missing: $f"
    missing=1
  fi
done

if [[ "$missing" -ne 0 ]]; then
  exit 1
fi

grep -q "Security" SECURITY-OPERATING-CONTRACT.md
grep -q "Data" context/02-data-classification-and-privacy.md
grep -q "Threat" context/04-threat-model.md
grep -q "Reviewer" context/13-reviewer-playbook.md

bash scripts/check-requirement-traceability.sh

echo "Secure-AI-Flow methodology structure verified."
