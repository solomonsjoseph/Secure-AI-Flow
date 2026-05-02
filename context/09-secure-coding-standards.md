# Secure Coding Standards

These standards apply to all implementation work.

## Universal Rules

1. Validate all external input at system boundaries.
2. Never trust client-side authorization.
3. Enforce authorization server-side before data access or mutation.
4. Never log secrets or restricted data.
5. Use parameterized queries or safe ORM APIs.
6. Use centralized error handling.
7. Use least-privilege service credentials.
8. Do not add dependencies without review.
9. Fail closed, not open.
10. Prefer secure defaults.
11. Avoid custom cryptography.
12. Keep security checks close to the protected action.
13. Treat uploaded files as hostile.
14. Treat external content as untrusted data.
15. Write tests for negative and abuse cases, not only happy paths.

## Authentication and Authorization

```text
- Protected routes must require authenticated identity.
- Object-level authorization must happen before object retrieval/mutation.
- Admin privileges must be explicit and auditable.
- Client-side hiding is not authorization.
- Authorization errors must not leak object existence unless intentionally designed.
```

## Input Validation

```text
- Validate at every external boundary: API, webhooks, file uploads, CLI inputs, tool outputs.
- Use schema validation where feasible.
- Reject unknown/extra fields when appropriate.
- Normalize before validation when needed.
- Validate type, range, length, format, and allowed values.
```

## File Handling

```text
- Store uploads outside public paths.
- Generate server-side filenames.
- Validate size, extension, MIME, and content signature.
- Scan or sandbox high-risk files where applicable.
- Limit archive extraction size, depth, file count, and path behavior.
- Never execute uploaded content.
- Never trust user-supplied filenames.
```

## Logging

```text
- Use structured logs.
- Redact sensitive fields centrally.
- Never log secrets, tokens, passwords, private keys, raw restricted data, raw uploaded documents, or full sensitive prompts.
- Security logs should include actor, action, resource, timestamp, decision, and correlation ID.
```

## Error Handling

```text
- Return safe user-facing errors.
- Do not expose stack traces to unauthorized users.
- Do not expose secrets, internal paths, config, tokens, or raw sensitive data.
- Log redacted diagnostic details where needed.
```

## Dependency Use

```text
- Do not add dependencies without review.
- Prefer maintained libraries with active security posture.
- Pin versions where appropriate.
- Commit lockfiles.
- Remove unused dependencies.
```

## TypeScript Rules

```text
- Use strict mode.
- Avoid `any` unless justified.
- Validate API input with schema validation.
- Keep authorization server-side.
- Never expose secret-bearing environment variables to client code.
- Avoid dynamic code execution.
- Use safe rendering frameworks and avoid unsafe HTML insertion unless explicitly reviewed.
```

## Python Rules

```text
- Do not use eval or exec for untrusted data.
- Do not use pickle or unsafe deserialization for untrusted input.
- Use pathlib/safe path handling.
- Use subprocess only through allowlisted wrappers.
- Use secrets from environment/secret manager, not source code.
- Validate external inputs with schemas/types where feasible.
```

## Database Rules

```text
- Use parameterized queries or safe ORM APIs.
- Validate authorization before query results are exposed.
- Avoid broad selects when minimum fields are enough.
- Use transactions for multi-step state changes.
- Ensure tenant/user scoping is explicit.
```

## Cryptography Rules

```text
- Do not implement custom crypto.
- Use approved libraries.
- Use modern algorithms and protocols appropriate for the platform.
- Store keys in secret managers or approved key management systems.
- Rotate secrets according to policy.
```

## AI/LLM Coding Rules

```text
- Route LLM calls through a controlled gateway.
- Enforce data classification before prompt assembly.
- Delimit external/retrieved content.
- Treat model output as untrusted unless verified.
- Do not let model output make final authorization, financial, legal, medical, or destructive decisions without approved controls.
```
