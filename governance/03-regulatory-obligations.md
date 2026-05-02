# Regulatory Obligations

This file records regulatory, contractual, and policy obligations that may apply to the system.

This is a placeholder. Fill it before building regulated or customer-facing functionality.

## Compliance Boundary

This repository does not certify compliance. It provides a structure for capturing requirements and evidence.

Qualified legal/compliance/security review is required for formal compliance claims.

## Applicability Matrix

| Regime / Obligation | Applies? | Scope | Owner | Evidence Required |
|---|---:|---|---|---|
| HIPAA Security Rule | Unknown | ePHI systems only | Compliance owner | Risk analysis, safeguards, access controls, audit logs |
| SOC 2 | Unknown | Customer trust controls | Compliance owner | Control matrix, evidence, audits |
| ISO 27001 | Unknown | ISMS | Compliance owner | ISMS controls, audit evidence |
| GDPR | Unknown | EU personal data | Legal/privacy owner | Lawful basis, data rights, DPIA if needed |
| PCI DSS | Unknown | Payment card data | Compliance owner | PCI-scoped controls |
| FedRAMP | Unknown | US federal cloud systems | Compliance owner | FedRAMP package and controls |
| Contractual DPA | Unknown | Customer-specific | Legal owner | Contract mapping |

## PHI/ePHI Rule

If the system handles PHI/ePHI:

```text
- Raw PHI/ePHI is classified as Restricted.
- Raw PHI/ePHI must not be sent to LLMs, embeddings, telemetry, analytics, or logs unless explicitly authorized by compliant architecture and legal review.
- Access must be controlled and audited.
- Retention and deletion must be defined.
- Incident response must include breach assessment path.
```

## Personal Data Rule

If the system handles personal data:

```text
- Identify data subject category.
- Identify lawful basis or contractual basis.
- Define retention.
- Define deletion/export rights if applicable.
- Define cross-border transfer handling if applicable.
- Define processor/subprocessor obligations if applicable.
```

## Regulatory Requirement Template

```markdown
# Regulatory Requirement

## ID
REG-001

## Source
-

## Requirement
-

## Applies To
-

## Implementation Control
-

## Evidence
-

## Owner
-

## Review Date
-
```
