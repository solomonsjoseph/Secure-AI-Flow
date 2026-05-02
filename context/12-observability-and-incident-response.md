# Observability and Incident Response

Security-first systems must be observable and recoverable.

## Security Events to Log

| Event | Required Fields | Sensitive Data Allowed? |
|---|---|---:|
| Login success/failure | actor, timestamp, source, decision, correlation ID | No |
| Authorization denial | actor, resource type, action, decision, correlation ID | No raw sensitive data |
| Admin action | actor, target, action, timestamp, reason, correlation ID | Redacted only |
| Data export | actor, scope, timestamp, count/summary, correlation ID | No raw export content |
| File upload | actor, file metadata, validation result, timestamp | No raw file content |
| LLM call | actor/system, data class, model route, timestamp | No raw sensitive prompt |
| Agent tool call | agent, tool, scope, decision, timestamp | Redacted inputs/outputs |
| Dependency scan failure | package, severity, finding ID, timestamp | No secrets |
| Security gate override | approver, reason, scope, expiration | No secrets |

## Logging Rules

```text
- Redact secrets.
- Redact restricted data.
- Include actor, action, resource, timestamp, decision, and correlation ID.
- Do not log raw prompts containing sensitive data.
- Do not log raw uploaded documents.
- Do not log auth headers or cookies.
```

## Incident Playbooks

Create playbooks for:

```text
- Credential leak
- Sensitive data/PHI leakage
- Unauthorized access
- Prompt injection compromise
- Agent tool abuse
- Malicious dependency
- CI/CD compromise
- Production rollback
- Audit log integrity issue
```

## Incident Record Template

```markdown
# Incident Record

## Incident ID
INC-YYYYMMDD-NNN

## Summary
-

## Detection Time
-

## Severity
-

## Affected Systems/Data
-

## Initial Containment
-

## Root Cause
-

## Customer/User Impact
-

## Regulatory Impact
-

## Evidence
-

## Remediation
-

## Follow-Up Actions
-

## Owner
-
```

## Rollback Requirements

Every production release should define:

```text
- How to roll back code.
- How to roll back data migrations, if possible.
- What cannot be rolled back.
- How to disable risky features.
- How to revoke agent/tool permissions.
- How to notify owners.
```

## Detection Gaps

Track known detection gaps here.

| Gap | Risk | Owner | Plan |
|---|---|---|---|
| TBD | TBD | TBD | TBD |
