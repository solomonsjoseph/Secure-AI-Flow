# Product Charter

This file defines what the system does, who uses it, what success means, and what outcomes are explicitly forbidden.

Do not build features until this file is filled for the actual product.

## Product Purpose

Describe the problem the system solves.

```text
TBD
```

## Users

| User Type | Description | Trust Level | Sensitive Capabilities? |
|---|---|---|---:|
| Anonymous user | TBD | Untrusted | No |
| Authenticated user | TBD | Partially trusted | TBD |
| Admin user | TBD | Privileged | Yes |
| Service account | TBD | Machine identity | Yes |
| External system | TBD | External trust boundary | TBD |

## Core Workflows

1. TBD
2. TBD
3. TBD

## Security-Critical Workflows

List workflows where failure creates security, privacy, legal, financial, or safety impact.

1. Authentication
2. Authorization and data access
3. Sensitive data processing
4. Admin actions
5. Agent/tool execution
6. File upload and parsing
7. External API calls
8. Production deployment

## In Scope

- TBD

## Out of Scope

- TBD

## Explicitly Forbidden Outcomes

These outcomes make the product unsafe:

```text
- A user can access another user's protected data.
- Raw restricted data can enter logs, prompts, telemetry, analytics, embeddings, or unauthorized external services.
- Secrets can appear in source code, logs, prompts, test artifacts, or evidence artifacts.
- AI agents can self-grant tools or permissions.
- AI agents can execute destructive actions without approval.
- Uploaded files can be executed or served directly from public storage.
- The system can release without security evidence and independent review.
```

## Success Criteria

Functional success:

```text
- TBD
```

Security success:

```text
- All protected access is authenticated and authorized server-side.
- All sensitive data flows are classified and enforced.
- Threat model is current.
- Security requirements are testable and covered by evidence.
- Independent review returns PASS.
```

## Failure Criteria

The product is considered unsafe if:

```text
- Security invariants are violated.
- Required evidence is missing.
- Sensitive data leakage is possible without approved exception.
- Auth/authz coverage is incomplete.
- AI tool permissions exceed least privilege.
- Security gates are disabled to ship faster.
```

## Open Questions

| Question | Owner | Decision Needed By |
|---|---|---|
| TBD | TBD | TBD |
