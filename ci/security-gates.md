# Security Gates

These gates should be enforced by CI/CD and release review.

## Merge Gates

Block merge if:

```text
- Required tests fail.
- Secret scan fails.
- Static analysis has unapproved high/critical findings.
- Dependency scan has unapproved high/critical findings.
- Auth/authz regression tests fail.
- Security invariant tests fail.
- New dependency lacks review.
- Threat model update is missing for relevant change.
- Data classification update is missing for relevant change.
- Reviewer verdict is not PASS or approved PASS WITH MINOR NOTES.
```

## Release Gates

Block release if:

```text
- Merge gates did not pass.
- Release reviewer verdict is not RELEASE PASS.
- Critical/high vulnerabilities remain unresolved without approved exception.
- SBOM is missing when required.
- Rollback plan is missing.
- Incident response path is missing.
- Human approvals are missing for high-impact actions.
```

## Suggested Baseline Checks

```text
- Lint
- Type check
- Unit tests
- Integration tests
- Authorization tests
- Abuse-case tests
- Secret scan
- Dependency scan
- Static analysis
- Container scan, if containers exist
- SBOM generation, if release-bound
- Log leakage tests, if sensitive data exists
- Prompt-injection tests, if LLM features exist
- Agent tool-abuse tests, if agent tools exist
```

## CI Implementation Notes

The exact tools depend on the stack.

Examples:

```text
- Secret scanning: GitHub secret scanning, gitleaks, trufflehog, or equivalent.
- Dependency scanning: Dependabot, npm audit, pip-audit, osv-scanner, Safety, or equivalent.
- SAST: CodeQL, Semgrep, Bandit, ESLint security plugins, or equivalent.
- SBOM: Syft, CycloneDX tools, or equivalent.
- Container scan: Trivy, Grype, or equivalent.
```

Do not install tools blindly. Choose tools based on project stack, risk, and operating environment.
