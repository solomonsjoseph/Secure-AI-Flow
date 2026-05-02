# Data Classification and Privacy Model

This file defines every meaningful data type, its sensitivity, allowed flows, storage rules, retention, deletion, and LLM/agent handling rules.

No feature spec is valid until affected data types are classified.

## Classification Levels

| Class | Meaning | Default Handling |
|---|---|---|
| Public | Safe for public disclosure | May be shown/logged if accurate |
| Internal | Business/internal data | Access controlled, limited logging |
| Sensitive | Personal, business-sensitive, operationally sensitive, or security-relevant data | Strong access control, redaction, retention limits |
| Restricted | PHI/ePHI, secrets, credentials, high-risk personal data, regulated data, raw sensitive uploads | Strict access, no logs, no LLM/embedding by default |
| Secret | API keys, tokens, passwords, private keys, signing keys | Never log, never prompt, never store outside secret manager |

## Data Inventory

| Data Type | Classification | Source | Storage Location | Encryption | Can Log? | Can Send to LLM? | Can Embed? | Retention | Deletion Rule | Owner |
|---|---|---|---|---|---:|---:|---:|---|---|---|
| User identity | Sensitive | Identity provider | Auth system/database | At rest + in transit | Limited/redacted | No | No | Account lifetime | Account deletion policy | TBD |
| Session token | Secret | Auth system | Secure session store | Strong | No | No | No | Session lifetime | Destroy on logout/expiry | TBD |
| API key | Secret | Secret manager | Secret manager only | Strong | No | No | No | Rotated | Destroy on revoke | TBD |
| Raw uploaded file | Restricted by default | User upload | Restricted data zone | Strong | No | No | No | TBD | Secure deletion | TBD |
| Parsed file text | Restricted until classified | Parser/sandbox | Restricted data zone | Strong | No | No | No by default | TBD | Secure deletion | TBD |
| De-identified text | Sensitive/Internal | Sanitizer | Clean data zone | At rest + in transit | Limited | Yes, only if verified | Yes, only if verified | TBD | User/project deletion | TBD |
| Prompt | Sensitive by default | Application | Prompt pipeline | In transit | No raw sensitive content | Only allowed classes | N/A | Minimal | Purge if possible | TBD |
| LLM output | Sensitive until reviewed | LLM provider/application | Application store | At rest + in transit | Limited | N/A | Maybe, if approved | TBD | Project deletion | TBD |
| Vector embedding | Sensitive | Embedding model | Vector store | At rest + in transit | No | N/A | N/A | TBD | Index deletion | TBD |
| Audit event | Sensitive | System | Audit store | Strong | Yes, redacted | No | No | TBD | Controlled retention | TBD |
| Error log | Internal/Sensitive | System | Log platform | At rest + in transit | Redacted only | No | No | TBD | Log retention | TBD |
| Telemetry event | Internal/Sensitive | System | Telemetry platform | At rest + in transit | Redacted only | No | No | TBD | Telemetry retention | TBD |

## Data Flow Rules

1. Restricted data cannot cross into LLM, embedding, telemetry, analytics, logs, or external API paths unless explicitly approved by governance and architecture.
2. Secret data cannot be sent to LLMs, logs, telemetry, analytics, test artifacts, or evidence artifacts.
3. Every new data flow must update this file and `context/03-system-context-and-trust-boundaries.md`.
4. Every new storage location must define encryption, access control, retention, deletion, owner, and monitoring.
5. De-identification must be verified before data is reclassified from Restricted to Sensitive/Internal.
6. Redaction is not classification. Redaction must be tested.
7. AI memory must not store Restricted or Secret data.
8. Vector stores must be treated as data stores, not harmless indexes.

## LLM Handling Policy

| Classification | Prompt Allowed? | Embedding Allowed? | Memory Allowed? |
|---|---:|---:|---:|
| Public | Yes | Yes | Yes |
| Internal | Yes, if approved | Yes, if approved | Limited |
| Sensitive | Case-by-case | Case-by-case | No by default |
| Restricted | No by default | No by default | No |
| Secret | No | No | No |

## Logging Policy

Logs must never contain:

```text
- Secrets
- API keys
- Tokens
- Passwords
- Private keys
- Raw PHI/ePHI
- Raw uploaded documents
- Full prompts containing sensitive data
- Full LLM responses containing sensitive data
- Authorization headers
- Session cookies
```

## Data Classification Change Request

```markdown
# Data Classification Change Request

## Data Type
-

## Current Classification
-

## Proposed Classification
-

## Reason
-

## New Allowed Flows
-

## Risk Assessment
-

## Required Tests
-

## Approvers
-
```
