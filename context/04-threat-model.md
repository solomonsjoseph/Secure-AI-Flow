# Threat Model

Threat modeling is mandatory. It is not a late-stage checklist.

Use this file to identify assets, actors, entry points, trust boundaries, abuse cases, mitigations, residual risks, and tests.

## Assets

| Asset | Classification | Why It Matters | Primary Threats |
|---|---|---|---|
| User identity | Sensitive | Account access and authorization | Account takeover, impersonation |
| Session tokens | Secret | Authentication continuity | Token theft, replay |
| API keys/secrets | Secret | External service access | Exfiltration, abuse |
| Raw uploaded files | Restricted by default | May contain sensitive/regulated data | Leakage, malicious payloads |
| Parsed file text | Restricted by default | Extracted sensitive content | Leakage, prompt injection |
| De-identified text | Sensitive/Internal | May still carry residual privacy risk | Re-identification, leakage |
| Database records | Sensitive | Core application data | Unauthorized access, injection |
| Vector index | Sensitive | Persistent retrieval memory | Sensitive leakage, deletion failure |
| LLM prompts/outputs | Sensitive | AI interaction data | Prompt leakage, model misuse |
| Audit logs | Sensitive | Security evidence | Tampering, overexposure |
| CI/CD credentials | Secret | Production deployment | Supply-chain compromise |
| Production infrastructure | High-impact | System availability/integrity | Misconfiguration, compromise |

## Actors

| Actor | Motivation | Trust Level | Notes |
|---|---|---|---|
| Anonymous attacker | Unauthorized access, abuse | Untrusted | Internet-facing risk |
| Malicious authenticated user | Access other data, abuse features | Partially trusted | Object-level auth required |
| Compromised user | Attacker with valid credentials | Untrusted in effect | Defense-in-depth required |
| Admin user | Legitimate privileged operations | Trusted but high-risk | Audit and least privilege required |
| Compromised admin | High-impact abuse | Hostile | Alerting and approval gates required |
| Malicious document author | Prompt injection/tool abuse | Untrusted | Treat document text as data, not instruction |
| Compromised dependency | Exfiltrate secrets/data | Hostile | Supply-chain controls required |
| Compromised CI job | Poison build/deploy | Hostile | Least-privilege CI required |
| External service compromise | Data/API exposure | External | Limit data shared |

## Entry Points

| Entry Point | Trust Level | Required Controls |
|---|---|---|
| Public web routes | Untrusted | Validation, rate limiting, secure headers as applicable |
| Login/session endpoints | Untrusted | Auth hardening, brute-force controls, logging |
| API endpoints | Untrusted/partially trusted | Auth, authz, validation |
| File uploads | Untrusted | Size/type/content validation, sandbox, storage controls |
| Webhooks | External | Signature verification, replay protection |
| LLM prompts | Mixed | Data classification, prompt injection defense |
| Agent tool calls | High-risk | Tool allowlist, scoped permissions, approval gates |
| CI/CD workflows | High-risk | Least privilege, pinned dependencies/actions |

## Abuse Cases

| ID | Abuse Case | Impact | Likelihood | Mitigation | Required Test |
|---|---|---|---|---|---|
| AB-001 | User accesses another user's protected object | High | Medium | Server-side object authorization | Authz integration test |
| AB-002 | User modifies another user's object | High | Medium | Ownership/role checks before mutation | Mutation authz test |
| AB-003 | Raw sensitive data appears in logs | Critical | Medium | Redaction, safe logging wrappers | Log leakage test |
| AB-004 | Raw sensitive data sent to LLM | Critical | Medium | LLM gateway allowlist | Prompt data-class test |
| AB-005 | Restricted data embedded in vector store | Critical | Medium | Embedding allowlist and sanitizer | Embedding leakage test |
| AB-006 | Uploaded file triggers path traversal | High | Medium | Safe paths, filename normalization | Path traversal test |
| AB-007 | Uploaded file is MIME spoofed | High | Medium | Content signature validation | MIME spoofing test |
| AB-008 | Uploaded archive is ZIP bomb | High | Medium | Size/depth/resource limits | Archive bomb test |
| AB-009 | Uploaded document contains prompt injection | High | High | Treat document text as untrusted data | Prompt injection test |
| AB-010 | Agent misuses shell/network/filesystem tool | Critical | Medium | Tool allowlist, sandbox, human approval | Tool abuse test |
| AB-011 | Agent memory is poisoned | High | Medium | Memory validation, isolation, expiry | Memory poisoning test |
| AB-012 | Dependency exfiltrates secrets | Critical | Medium | SCA, lockfile, review, least privilege | Dependency review evidence |
| AB-013 | CI job leaks deployment secret | Critical | Medium | Least-privilege CI, secret isolation | CI permission review |
| AB-014 | Admin action lacks audit trail | High | Medium | Structured audit log | Audit event test |
| AB-015 | Error message leaks sensitive data | Medium/High | Medium | Safe error handling | Error leakage test |
| AB-016 | Race condition bypasses business rule | Medium/High | Low/Medium | Transaction integrity, state tests | Race/state test |
| AB-017 | Security gate disabled to ship faster | Critical | Medium | Protected branch/review policy | Release gate review |

## Residual Risks

| Risk ID | Residual Risk | Severity | Owner | Treatment |
|---|---|---|---|---|
| RR-001 | TBD | TBD | TBD | TBD |

## Threat Model Update Rule

Update this file when any of the following change:

```text
- Data type
- Data classification
- Storage location
- Trust boundary
- External service
- Auth/authz model
- File handling
- Agent tools
- AI memory
- Prompt pipeline
- Dependency
- CI/CD flow
- Deployment architecture
```
