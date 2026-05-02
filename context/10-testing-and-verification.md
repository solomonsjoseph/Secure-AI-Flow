# Testing and Verification

A feature is not complete because it works on the happy path.

A feature is complete only when it has evidence that it works, fails safely, and does not violate security requirements.

## Required Test Types

| Test Type | Required When | Evidence Location |
|---|---|---|
| Unit tests | Core logic exists | `evidence/test-runs/` |
| Integration tests | Components interact | `evidence/test-runs/` |
| Authorization tests | Protected resources/actions exist | `evidence/test-runs/` |
| Abuse-case tests | Feature has security-relevant misuse cases | `evidence/test-runs/` |
| Regression tests | Bug/security issue fixed | `evidence/test-runs/` |
| Log leakage tests | Sensitive data may touch logs/errors | `evidence/test-runs/` |
| Prompt-injection tests | LLM or agent consumes external content | `evidence/test-runs/` |
| Tool-abuse tests | Agents use tools | `evidence/test-runs/` |
| Memory-poisoning tests | Agent memory exists | `evidence/test-runs/` |
| Secret scanning | Every merge/release | CI evidence |
| Dependency vulnerability scanning | Dependencies exist | CI evidence |
| Static analysis | Code exists | CI evidence |
| Dynamic testing | Web/API surface exists | CI/review evidence |
| Container scanning | Containers exist | CI evidence |
| SBOM generation | Production release | `evidence/release-gates/` |

## Feature Completion Rule

A feature is not complete until:

1. Functional tests pass.
2. Security tests pass.
3. Abuse-case tests pass or documented as not applicable.
4. Threat model is updated or explicitly marked no-impact.
5. Data classification is updated or explicitly marked no-impact.
6. Dependency review is complete if dependencies changed.
7. Evidence is stored under `evidence/`.
8. Independent reviewer returns `PASS`.

## Evidence Template

```markdown
# Test Evidence

## Feature
-

## Spec
-

## Date
-

## Test Commands
-

## Results
-

## Security Requirements Covered
-

## Abuse Cases Covered
-

## Gaps
-

## Reviewer Notes
-
```

## Minimum Abuse Tests by Feature Type

| Feature Type | Minimum Abuse Tests |
|---|---|
| Protected endpoint | Unauthenticated, unauthorized, wrong owner, malformed input |
| File upload | Oversize, invalid MIME, MIME spoofing, path traversal, archive bomb if archives allowed |
| LLM feature | Prompt injection, sensitive prompt leakage, retrieval authorization |
| Agent feature | Tool misuse, permission boundary, human approval, memory leakage |
| Admin feature | Non-admin denial, audit event, destructive confirmation |
| External API/webhook | Signature/auth verification, replay, malformed payload |
| Data export | Authorization, scope limit, audit event, sensitive leakage |

## Test Quality Rules

Bad tests:

```text
- Only prove the happy path.
- Mock away authorization.
- Do not assert security outcomes.
- Do not check logs/errors.
- Do not run in CI.
```

Acceptable tests:

```text
- Prove expected success.
- Prove expected denial.
- Prove failure is safe.
- Prove sensitive data is not exposed.
- Map to explicit security requirement IDs.
```
