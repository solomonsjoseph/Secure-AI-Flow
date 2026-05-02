# Human Approval Policy

AI may assist, but it must not silently make high-impact decisions.

## Actions Requiring Human Approval

| Action | Human Approval Required? | Required Approver |
|---|---:|---|
| Production deployment | Yes | Release owner |
| Database destructive migration | Yes | Architecture owner + data owner |
| Deleting user/customer data | Yes | Data owner |
| Changing auth/authz policy | Yes | Security owner |
| Changing data classification | Yes | Data owner + security owner |
| Sending sensitive data to external service | Yes | Security owner + data owner |
| Expanding AI agent tool permissions | Yes | Security owner |
| Granting shell/network/filesystem access to agent | Yes | Security owner |
| Adding high-risk dependency | Yes | Security owner |
| Accepting critical/high vulnerability | Yes | Security owner + product owner |
| Disabling CI/security gate | Yes | Security owner + architecture owner |
| Updating incident response policy | Yes | Security owner |

## Human Approval Record

Use this template and save under `evidence/reviews/` or `evidence/release-gates/`.

```markdown
# Human Approval Record

## Approval ID
APR-YYYYMMDD-NNN

## Action Approved
-

## Scope
-

## Risk Summary
-

## Evidence Reviewed
-

## Conditions
-

## Expiration
-

## Approver
Name:
Role:
Date:
```

## Approval Rules

1. Approval must be explicit.
2. Approval must be scoped.
3. Approval must expire when risk changes.
4. Approval must reference evidence.
5. Approval must not be inferred from silence.
6. AI agents cannot approve high-impact actions.

## Emergency Override

Emergency override is allowed only when:

```text
- A production-impacting incident is active.
- Delay increases harm.
- A human owner explicitly approves.
- The override is recorded after action.
- A post-incident review is created.
```

Emergency override cannot be used to bypass legal, regulatory, or hard security prohibitions such as exposing secrets or knowingly leaking restricted data.
