# Design System and UX Rules

Design comes after security. UX must not make unsafe behavior easy.

## UX Security Principles

1. Dangerous actions must be visibly distinct.
2. Destructive actions require confirmation.
3. Sensitive data is redacted by default.
4. Secrets are never displayed.
5. Authorization state must be enforced server-side, not only hidden in UI.
6. Admin actions must show target, scope, and consequence.
7. Error messages must be useful without leaking sensitive detail.
8. Audit-relevant actions must produce audit events.
9. Secure defaults beat convenience.
10. The UI must not imply a user has access before backend authorization confirms it.

## Sensitive UI Treatment

| Data Type | UI Treatment |
|---|---|
| Secret | Never display |
| API token | Show only once at creation if required; otherwise masked |
| PHI/ePHI | Redacted by default; role-gated reveal if approved |
| Personal data | Minimum necessary display |
| Audit event | Admin/reviewer only |
| Raw uploaded document | Restricted view only; no public preview |
| LLM prompt/output | Treat as sensitive until classified |

## Visual System

Fill for the actual product.

| Token | Value |
|---|---|
| Typography | TBD |
| Color palette | TBD |
| Spacing scale | TBD |
| Border radius | TBD |
| Component library | TBD |
| Icons | TBD |
| Accessibility target | TBD |

## Secure Interaction Patterns

### Destructive Action Confirmation

A destructive action must show:

```text
- What will happen.
- What data/resource is affected.
- Whether it can be undone.
- Who is performing the action.
- Required confirmation.
```

### Sensitive Data Reveal

A sensitive-data reveal must:

```text
- Require authorization.
- Be auditable.
- Be time-bounded where feasible.
- Avoid showing more than necessary.
```

### Admin Action Review

Admin action screens must show:

```text
- Actor
- Target
- Scope
- Reason
- Risk level
- Confirmation
- Audit event ID after action
```

## Design Review Checklist

| Question | Answer |
|---|---|
| Does the UI expose sensitive data by default? | TBD |
| Can UI-only restrictions be bypassed through API calls? | TBD |
| Are destructive actions clearly confirmed? | TBD |
| Are errors safe? | TBD |
| Are admin actions auditable? | TBD |
| Does the UI make risky behavior easier than safe behavior? | TBD |
