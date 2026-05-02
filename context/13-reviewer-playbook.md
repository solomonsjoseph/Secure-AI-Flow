# Reviewer Playbook

The reviewer is not here to be polite. The reviewer is here to block unsafe work.

The implementer must not approve its own output.

## Reviewer Verdicts

Return one of:

```text
PASS
PASS WITH MINOR NOTES
BLOCKED
```

## Verdict Definitions

| Verdict | Meaning |
|---|---|
| PASS | Implementation matches spec, security requirements are covered, evidence is sufficient, no blockers remain |
| PASS WITH MINOR NOTES | No security or correctness blockers; minor non-blocking issues documented |
| BLOCKED | Security, correctness, evidence, scope, architecture, or governance blocker exists |

## Mandatory Review Inputs

The reviewer must read:

```text
- SECURITY-OPERATING-CONTRACT.md
- Relevant spec under specs/
- Data classification file
- Threat model
- Secure architecture
- Security requirements
- Testing/verification file
- Supply-chain file if dependencies changed
- Changed files
- Evidence files
```

## Review Checklist

| Area | Questions |
|---|---|
| Scope | Did implementation stay within approved spec? |
| Architecture | Did it violate zones, boundaries, or invariants? |
| Data | Are new/changed data flows classified? |
| Authn/Authz | Are protected reads/writes authenticated and authorized server-side? |
| Input validation | Are all external inputs validated? |
| File handling | Are files validated, safely stored, and sandboxed as needed? |
| AI/LLM | Are prompt/data classes controlled? Is external content treated as untrusted? |
| Agent tools | Are tools least-privilege, scoped, logged, and approval-gated? |
| Logging | Can logs expose secrets or restricted data? |
| Errors | Can errors leak sensitive details? |
| Dependencies | Were dependencies reviewed and scanned? |
| Tests | Are functional, negative, and abuse-case tests meaningful? |
| Evidence | Is evidence complete and stored? |
| Fail-safe | Does the feature fail closed? |

## Review Result Template

```markdown
# Review Result

## Verdict
PASS / PASS WITH MINOR NOTES / BLOCKED

## Scope Reviewed
- Spec:
- Files changed:
- Evidence reviewed:

## Security Findings
| Severity | Finding | Evidence | Required Fix |
|---|---|---|---|

## Requirement Coverage
| Requirement ID | Covered? | Evidence |
|---|---:|---|

## Abuse Case Coverage
| Abuse Case ID | Covered? | Evidence |
|---|---:|---|

## Data Flow Impact
-

## Threat Model Impact
-

## Dependency Impact
-

## Logging/Telemetry Review
-

## Final Decision
-
```

## Automatic Blockers

Block if:

```text
- Evidence is missing.
- Security tests are missing for security-relevant feature.
- Threat model impact is missing.
- Data classification impact is missing.
- New dependency lacks review.
- Authz is client-side only.
- Logs can expose secrets/restricted data.
- AI agent has broad tools without approval.
- Implementation changes security gates to pass.
- Implementation expands scope beyond spec.
```

## Reviewer Standard

Do not say:

```text
Looks good.
```

Say:

```text
PASS because requirement IDs X, Y, Z are covered by tests A, B, C;
threat model was updated; no data-classification changes were introduced;
and no dependencies changed.
```

Or:

```text
BLOCKED because AUTHZ-001 is not tested and object access can occur before ownership check.
```
