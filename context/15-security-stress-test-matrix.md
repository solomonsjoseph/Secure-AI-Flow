# Security Stress-Test Matrix

This matrix is used by Designers, Implementers, Reviewers, and Release Reviewers to attack the design before attackers do.

| Attack / Failure Mode | What Can Go Wrong | Required Defense | Block Condition |
|---|---|---|---|
| Ambiguous scope | AI builds extra features or unsafe shortcuts | Approved spec with explicit scope | Spec missing or vague |
| Broken access control | User accesses another user's data | Server-side object authorization | No authz test |
| Client-side trust | UI hides button but API allows action | Backend permission enforcement | Client-only control |
| Injection | SQL/NoSQL/command/template injection | Boundary validation and safe APIs | Raw input reaches dangerous sink |
| Prompt injection | Untrusted text overrides agent behavior | Treat external text as untrusted | Agent follows untrusted instruction |
| Sensitive data leakage | PHI/secrets appear in prompts/logs/telemetry | Data classification, redaction, leak tests | No leakage test |
| Vector-store leakage | Restricted data embedded permanently | Embedding allowlist and sanitizer gate | Raw restricted data can embed |
| File upload abuse | ZIP bomb, MIME spoofing, malware, path traversal | Size/type/content validation and sandboxing | File processed unsafely |
| Agent tool misuse | Agent calls destructive or privileged tools | Tool allowlist, per-tool auth, human approval | Broad tool access |
| Agent memory poisoning | Malicious memory changes future behavior | Memory validation, isolation, expiry, audit | Memory blindly trusted |
| Excessive autonomy | Agent loops, spends money, deletes data | Autonomy boundaries, rate/cost limits, interrupt | No kill switch |
| Supply-chain compromise | Malicious package or build step | SCA, SBOM, lockfiles, provenance where feasible | Unreviewed dependency |
| CI/CD compromise | Build steals secrets or deploys poisoned artifact | Least-privilege CI, pinned actions, secret isolation | CI has broad secrets |
| Logging failure | No audit trail or overlogging sensitive data | Structured security events and redaction | Missing audit or unsafe logs |
| Business logic bypass | Race condition, workflow skip, invalid state | State-machine and abuse-case tests | Only happy-path tests |
| Cryptographic misuse | Weak crypto, hardcoded keys, bad storage | Approved libraries, key management | Custom crypto or hardcoded keys |
| Error handling leak | Stack traces or sensitive data exposed | Centralized safe errors | Raw error exposed |
| Security misconfiguration | Debug mode, public buckets, weak headers | Config baseline and environment checks | Unsafe default |
| Reviewer rubber-stamping | AI says “looks good” without proof | Evidence-based review format | No cited evidence |
| Release failure | No rollback or incident playbook | Release checklist and IR plan | No recovery plan |

## Use Rule

Every feature spec must identify which rows apply. Every reviewer must check those rows before verdict.
