# Security Requirements

Security requirements must be concrete, testable, and traceable.

Vague statements such as "make it secure" are invalid.

## Authentication

| ID | Requirement | Verification |
|---|---|---|
| AUTHN-001 | Protected routes must require authenticated identity. | Route tests |
| AUTHN-002 | Session validation must happen server-side. | Integration test |
| AUTHN-003 | Authentication failures must be logged without secrets. | Log test |
| AUTHN-004 | Logout/session revocation must invalidate server-side session state where applicable. | Session test |

## Authorization

| ID | Requirement | Verification |
|---|---|---|
| AUTHZ-001 | Every protected object read must verify ownership or role server-side before data retrieval. | Object access test |
| AUTHZ-002 | Every protected mutation must verify permission before mutation. | Mutation authz test |
| AUTHZ-003 | Object IDs must not imply access. | IDOR test |
| AUTHZ-004 | Admin actions must require explicit privileged authorization. | Admin authz test |
| AUTHZ-005 | Authorization failures must not leak object existence unless explicitly intended. | Error behavior test |

## Input Validation

| ID | Requirement | Verification |
|---|---|---|
| VAL-001 | All external input must be schema-validated at system boundaries. | Boundary validation tests |
| VAL-002 | File uploads must validate size, extension, MIME type, and content signature. | File validation tests |
| VAL-003 | Filenames and paths must be normalized and must not permit path traversal. | Path traversal tests |
| VAL-004 | External webhook requests must verify authenticity where applicable. | Signature tests |
| VAL-005 | Input validation failures must fail closed. | Negative tests |

## Output Handling and Error Handling

| ID | Requirement | Verification |
|---|---|---|
| OUT-001 | User-controlled content must be safely encoded or rendered through safe frameworks. | XSS/render test |
| ERR-001 | Errors must not expose secrets, restricted data, stack traces, or internal config to unauthorized users. | Error leakage tests |
| ERR-002 | Security failures must be logged as redacted security events. | Audit/log tests |

## Logging and Audit

| ID | Requirement | Verification |
|---|---|---|
| LOG-001 | Logs must never contain secrets, PHI/ePHI, raw uploaded documents, tokens, passwords, private keys, or full sensitive prompts. | Log leakage tests |
| LOG-002 | Security-relevant events must include actor, action, resource, timestamp, decision, and correlation ID. | Audit schema test |
| LOG-003 | Admin actions must be auditable. | Admin audit test |
| LOG-004 | Agent tool calls must be auditable. | Agent audit test |

## Data Protection

| ID | Requirement | Verification |
|---|---|---|
| DATA-001 | Every data type must have classification before use. | Data inventory review |
| DATA-002 | Restricted data must not move to clean/AI zones without approved transformation and verification. | Data-flow test |
| DATA-003 | Data stores must define retention and deletion behavior. | Architecture review |
| DATA-004 | Sensitive data must be encrypted in transit and at rest where supported/required. | Config review |
| DATA-005 | Deletion must remove or make inaccessible relevant data from primary stores and indexes according to policy. | Deletion test |

## AI/LLM Requirements

| ID | Requirement | Verification |
|---|---|---|
| AI-001 | LLM calls may only receive approved data classes. | Prompt gateway tests |
| AI-002 | External content must be treated as untrusted data, not instructions. | Prompt injection tests |
| AI-003 | LLM output must not be trusted as authority for security decisions. | Review/design check |
| AI-004 | Prompts must not contain secrets or restricted data unless explicitly allowed by governance. | Prompt leakage tests |
| AI-005 | Retrieval must enforce data authorization before context assembly. | Retrieval authz tests |

## Agent Requirements

| ID | Requirement | Verification |
|---|---|---|
| AGENT-001 | Tools must be allowlisted per agent role. | Tool config review |
| AGENT-002 | Agents must not self-grant tools or permissions. | Agent policy test |
| AGENT-003 | High-impact actions must require human approval. | Approval workflow test |
| AGENT-004 | Tool calls must be scoped, logged, and rate-limited where applicable. | Tool-call tests |
| AGENT-005 | Agent memory must not store secrets or restricted data. | Memory leakage test |

## Supply Chain Requirements

| ID | Requirement | Verification |
|---|---|---|
| SC-001 | New dependencies require justification and review. | Dependency review evidence |
| SC-002 | Lockfiles must be committed for supported package ecosystems. | Repo check |
| SC-003 | Dependency vulnerability scanning must run before release. | CI evidence |
| SC-004 | SBOM must be generated for production releases where feasible. | Release evidence |
| SC-005 | CI/CD permissions must be least-privilege. | CI config review |

## Release Requirements

| ID | Requirement | Verification |
|---|---|---|
| REL-001 | Release requires PASS review verdict. | Review evidence |
| REL-002 | Release requires rollback path. | Release checklist |
| REL-003 | Release requires incident response path for security-impacting features. | IR checklist |
| REL-004 | Release blocks on unresolved critical/high findings unless approved exception exists. | Gate evidence |
