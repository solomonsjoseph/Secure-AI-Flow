# Secure-AI-Flow

Security-first AI system delivery methodology for designing, implementing, reviewing, and releasing software with AI assistance.

This repository is not a generic prompt pack. It is an operating system for controlled AI-assisted software delivery.

## Core Position

AI-assisted delivery must not begin with code.

It must begin with:

1. Governance
2. Data classification
3. Threat modeling
4. Secure architecture
5. Testable security requirements
6. Design
7. Controlled implementation
8. Verification
9. Independent review
10. Release evidence

The old pattern is weak:

```text
Give the AI context, then let it build.
```

This repository enforces a stronger pattern:

```text
Force the AI through governance, threat modeling, security requirements,
secure design, constrained implementation, verification, and independent review.
```

## Five Non-Negotiable Principles

```text
1. Security before features.
2. Design before implementation.
3. Evidence before approval.
4. Least privilege before automation.
5. Independent review before merge.
```

## Role Model

Secure-AI-Flow separates the AI delivery process into four roles.

| Role | May Do | Must Not Do |
|---|---|---|
| Designer | Create specs, system design, threat-model updates, acceptance criteria | Write production code or approve implementation |
| Implementer | Write code, tests, migration notes, evidence updates | Approve its own work or override policy |
| Reviewer | Review implementation against spec, architecture, tests, and evidence | Silently change code or rubber-stamp missing evidence |
| Release Reviewer | Validate release gates, evidence, rollback, and incident readiness | Release when blockers remain |

## Repository Structure

```text
/
  CLAUDE.md
  SECURITY-OPERATING-CONTRACT.md

  governance/
    00-risk-appetite-and-authority.md
    01-control-standard-map.md
    02-human-approval-policy.md
    03-regulatory-obligations.md
    04-maturity-model.md

  context/
    01-product-charter.md
    02-data-classification-and-privacy.md
    03-system-context-and-trust-boundaries.md
    04-threat-model.md
    05-secure-architecture.md
    06-security-requirements.md
    07-agent-security-model.md
    08-design-system-and-ux-rules.md
    09-secure-coding-standards.md
    10-testing-and-verification.md
    11-supply-chain-security.md
    12-observability-and-incident-response.md
    13-reviewer-playbook.md
    14-progress-risk-and-evidence-register.md
    15-security-stress-test-matrix.md

  adr/
    ADR-0001-template.md

  specs/
    000-build-roadmap.md
    001-example-feature-spec.md

  prompts/
    DESIGNER.md
    IMPLEMENTER.md
    REVIEWER.md
    RELEASE-REVIEWER.md

  evidence/
    reviews/
    test-runs/
    threat-model-updates/
    dependency-reviews/
    release-gates/

  ci/
    security-gates.md

  references/
    official-source-map.md

  scripts/
    verify-methodology.sh
```

## How to Use This Methodology

### Step 1: Fill Governance First

Start with:

```text
governance/00-risk-appetite-and-authority.md
governance/01-control-standard-map.md
governance/02-human-approval-policy.md
governance/03-regulatory-obligations.md
```

Do not write feature specs until the authority model, risk limits, approval rules, and regulatory obligations are explicit.

### Step 2: Classify Data

Fill:

```text
context/02-data-classification-and-privacy.md
```

Every meaningful data type must have:

```text
classification, source, storage location, allowed flows, log policy, LLM policy,
embedding policy, retention, deletion, encryption, and owner.
```

### Step 3: Threat Model Before Architecture Hardens

Fill:

```text
context/03-system-context-and-trust-boundaries.md
context/04-threat-model.md
context/15-security-stress-test-matrix.md
```

Every feature spec must update the threat model when it changes data flows, trust boundaries, agents, storage, auth, dependencies, or external services.

### Step 4: Define Secure Architecture

Fill:

```text
context/05-secure-architecture.md
```

Architecture must define security zones and invariants. If a feature conflicts with an invariant, the feature loses.

### Step 5: Convert Security Into Requirements

Fill:

```text
context/06-security-requirements.md
```

Security requirements must be testable. Vague requirements are invalid.

Bad:

```text
The system should be secure.
```

Acceptable:

```text
AUTHZ-001: Every protected object read must verify ownership or role server-side before data retrieval.
```

### Step 6: Design Next

Fill:

```text
context/08-design-system-and-ux-rules.md
```

Design is important, but it must follow data classification and secure architecture. Design must not make sensitive data exposure easier.

### Step 7: Write Feature Specs

Use:

```text
specs/001-example-feature-spec.md
```

Each spec must include:

```text
Goal, user value, data classification, threat-model impact, security requirements,
UX requirements, implementation plan, tests, abuse-case tests, acceptance criteria,
blockers, and evidence requirements.
```

### Step 8: Implement Only Against Approved Specs

Use:

```text
prompts/IMPLEMENTER.md
```

The implementer must not expand scope, weaken invariants, approve its own work, add unreviewed dependencies, or skip evidence.

### Step 9: Review With Evidence

Use:

```text
context/13-reviewer-playbook.md
prompts/REVIEWER.md
```

The reviewer returns only:

```text
PASS
PASS WITH MINOR NOTES
BLOCKED
```

No vague “looks good.” No approval without evidence.

### Step 10: Release Only With Gates

Use:

```text
ci/security-gates.md
prompts/RELEASE-REVIEWER.md
```

Release is blocked if security evidence is missing, critical/high vulnerabilities remain unresolved, secrets are found, threat model updates are missing, or rollback/incident plans are absent.

## Source Integrity Note

This repository cites official security sources in `references/official-source-map.md` and maps them into `governance/01-control-standard-map.md`.

Important limitation: these templates are not a certification, audit opinion, or legal compliance determination. Before using this for regulated production work, verify the latest version of every cited standard and have the final system reviewed by qualified security/legal/compliance owners.
