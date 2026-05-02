# Secure Architecture

This file defines secure architecture, security zones, invariants, and architecture decisions.

It is not enough to list folders or frameworks. Architecture must define what is allowed, what is forbidden, and what is enforced.

## Architecture Overview

TBD for the actual product.

## Security Zones

| Zone | Contains | Can Access | Cannot Access | Required Controls |
|---|---|---|---|---|
| Public Zone | Static UI, public routes | Public APIs | Secrets, restricted data | No secrets, no trusted authz decisions |
| Client Zone | Browser app | User-visible data | Server secrets, raw restricted data unless authorized | Treat as untrusted |
| API Zone | Backend routes/services | DB, auth provider, allowed storage | Unrestricted shell, raw secrets | Auth, authz, validation |
| Restricted Data Zone | Raw sensitive uploads, raw PHI/ePHI if applicable | Sanitizer, authorized backend | LLM, logs, telemetry, embeddings | Strong access, encryption, no logging |
| Clean Data Zone | De-identified or approved data | Retrieval, approved LLM path | Raw restricted identifiers | Classification proof |
| AI Zone | LLM gateway, retrieval pipeline | Approved clean data | Secrets, restricted data by default | Prompt controls, data allowlist |
| Agent Sandbox Zone | Tool execution | Allowlisted tools/files only | Secrets, unrestricted network/filesystem | Sandbox, audit, limits |
| Audit Zone | Security logs/events | Authorized reviewers/admins | Public UI by default | Tamper resistance, redaction |
| Build Zone | CI/CD, artifacts | Source, build dependencies | Production data | Least privilege, scanning |
| Production Zone | Running services | Runtime secrets via approved path | Build-time broad credentials | Monitoring, rollback |

## Security Invariants

These rules must not be violated.

1. Raw restricted data must not reach LLMs, embeddings, telemetry, analytics, or logs unless explicitly allowed by governance and architecture.
2. Secrets must never appear in source code, logs, prompts, telemetry, test artifacts, or evidence artifacts.
3. Protected reads and writes must enforce authentication and server-side authorization.
4. Authorization must be checked before data retrieval or mutation.
5. Object IDs must never imply access.
6. File uploads must be validated, stored outside public paths, and processed in sandboxed contexts.
7. AI agents must operate with least-privilege tools and must not self-grant permissions.
8. Agent tool calls must be auditable.
9. High-impact or irreversible actions require human approval.
10. New dependencies require review before use.
11. CI/CD must not have broader permissions than required.
12. Security gates must not be weakened to make a build pass.
13. Security-relevant architecture changes require ADRs.

## Architecture Decision Record Rule

Create an ADR under `adr/` when changing:

```text
- Auth/authz model
- Data zone design
- LLM data handling
- Agent permissions
- Sandbox design
- Storage/encryption strategy
- CI/CD release architecture
- External service integration
- Logging/audit model
- Dependency/security gate policy
```

## Secure Architecture Review Checklist

For every new feature, answer:

| Question | Answer |
|---|---|
| Does it create a new data flow? | TBD |
| Does it cross a trust boundary? | TBD |
| Does it touch sensitive/restricted/secret data? | TBD |
| Does it change auth/authz? | TBD |
| Does it add agent tools or permissions? | TBD |
| Does it add external services? | TBD |
| Does it add dependencies? | TBD |
| Does it affect logs/telemetry? | TBD |
| Does it need an ADR? | TBD |
| How does it fail safely? | TBD |
