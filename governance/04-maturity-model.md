# Maturity Model

Use this to avoid lying to yourself about security maturity.

## Level 0 — Unsafe

- No threat model.
- No data classification.
- No security requirements.
- AI writes and reviews its own work.
- No security gates.
- No evidence.

This is not acceptable for sensitive data, PHI/ePHI, agentic tools, file processing, production infrastructure, or customer-facing systems.

## Level 1 — Controlled

- Product charter exists.
- Data classification exists.
- Basic threat model exists.
- Secure coding rules exist.
- Reviewer playbook exists.
- Basic CI/security gates exist.

Minimum acceptable level for non-sensitive prototypes.

## Level 2 — Security-First

- Abuse-case specs are required.
- Security requirements are mapped to standards.
- Agent security model exists.
- Supply-chain controls exist.
- Evidence-based review is mandatory.
- Incident-response and rollback plans exist.

Minimum acceptable level for serious applications.

## Level 3 — High-Assurance

- Full control mapping.
- Formal risk register.
- Advanced SAST/DAST where applicable.
- SBOM and provenance where feasible.
- Red-team or adversarial testing.
- Fuzzing for parsers/file handlers.
- Production monitoring and incident drills.
- Vulnerability disclosure workflow.

Target level for PHI/ePHI, regulated workloads, high-impact agentic systems, and security-sensitive production systems.

## Promotion Rule

Do not claim a maturity level unless all controls for that level have evidence.
