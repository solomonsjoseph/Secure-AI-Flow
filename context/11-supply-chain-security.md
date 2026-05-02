# Supply Chain Security

Dependencies, build systems, and release artifacts are part of the attack surface.

## Dependency Rules

1. No new dependency without justification.
2. Prefer maintained packages with clear ownership and recent maintenance.
3. Pin versions where appropriate.
4. Commit lockfiles for package ecosystems that use them.
5. Run vulnerability scans.
6. Review licenses.
7. Remove unused dependencies.
8. Avoid packages with unnecessary install scripts or broad permissions unless justified.
9. Do not suppress vulnerability findings without approved exception.
10. Record dependency decisions under `evidence/dependency-reviews/`.

## Dependency Review Template

```markdown
# Dependency Review

## Dependency
-

## Version
-

## Purpose
-

## Alternatives Considered
-

## Maintainer/Source
-

## License
-

## Vulnerability Scan Result
-

## Risk Assessment
-

## Decision
APPROVED / REJECTED / APPROVED WITH CONDITIONS

## Reviewer
-
```

## CI/CD Rules

```text
- Use least-privilege CI permissions.
- Avoid long-lived secrets.
- Do not expose production secrets to untrusted jobs.
- Pin third-party CI actions where feasible.
- Separate build, test, and deploy permissions.
- Do not allow pull requests from untrusted sources to access privileged secrets.
- Store deployment approvals as evidence.
```

## Release Artifact Rules

```text
- Release artifacts must be traceable to source commit.
- Generate SBOM for production releases where feasible.
- Attach security gate evidence.
- Attach dependency review evidence if dependencies changed.
- Attach rollback plan.
```

## Block Conditions

Block merge/release if:

```text
- New dependency lacks review.
- Critical/high dependency vulnerability is unresolved without exception.
- Lockfile is missing or inconsistent.
- Secret scan fails.
- CI permission model is broader than required for the job.
- Release lacks SBOM when SBOM is required.
```
