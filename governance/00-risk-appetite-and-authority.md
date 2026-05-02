# Risk Appetite and Authority

This file defines what risk the project will accept, what it will block, and who can approve exceptions.

## Risk Posture

Default posture:

```text
Security-first. Fail closed. Least privilege. Evidence required.
```

## Risk Appetite Table

| Risk Area | Default Position | Exception Allowed? | Required Approver | Evidence Required |
|---|---|---:|---|---|
| Raw PHI or regulated data to LLM | Forbidden | No | N/A | N/A |
| Secrets in logs/prompts/source/test artifacts | Forbidden | No | N/A | N/A |
| Critical vulnerability in release path | Block release | Yes | Security owner + product owner | Risk acceptance record |
| High vulnerability in release path | Block release by default | Yes | Security owner | Risk acceptance record + mitigation plan |
| Missing authentication on protected route | Forbidden | No | N/A | Auth test evidence |
| Missing object-level authorization | Forbidden | No | N/A | Authorization test evidence |
| Agent unrestricted shell access | Forbidden | Yes | Security owner + human approver | Tool-risk review |
| Agent unrestricted network access | Forbidden | Yes | Security owner + human approver | Tool-risk review |
| Agent access to secrets | Forbidden | No | N/A | N/A |
| Public file upload | Restricted | Yes | Security owner | File handling threat model + tests |
| New third-party dependency | Denied until reviewed | Yes | Technical owner | Dependency review evidence |
| New external API | Denied until reviewed | Yes | Security owner | Data-flow review |
| Telemetry containing sensitive data | Forbidden | No | N/A | Leak test evidence |
| Admin action without audit log | Forbidden | No | N/A | Audit test evidence |

## Severity Policy

| Severity | Merge Policy | Release Policy | Required Action |
|---|---|---|---|
| Critical | Block | Block | Fix or formally reject feature |
| High | Block by default | Block by default | Fix or approved exception |
| Medium | May merge with plan | May release with owner-approved mitigation plan | Track to closure |
| Low | May merge | May release | Track if relevant |

## Approval Authority

| Decision | Required Authority |
|---|---|
| Security invariant change | Security owner + architecture owner |
| Data classification change | Data owner + security owner |
| Tool permission expansion | Security owner + human approver |
| Dependency exception | Security owner |
| Regulatory interpretation | Legal/compliance owner |
| Release with residual high risk | Security owner + product owner |

## Exception Record Template

Every exception must be recorded under `evidence/release-gates/` or `evidence/reviews/`.

```markdown
# Exception Record

## Exception ID
EXC-YYYYMMDD-NNN

## Requested Exception
-

## Policy Violated
-

## Business Justification
-

## Risk Assessment
-

## Compensating Controls
-

## Expiration Date
-

## Approvers
-

## Evidence Links
-
```

## Default Deny Rule

If no authority is defined for a risky action, the action is denied until governance is updated.
