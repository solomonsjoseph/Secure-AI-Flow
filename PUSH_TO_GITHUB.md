# Push This Methodology to GitHub

Repository:

```text
https://github.com/solomonsjoseph/Secure-AI-Flow.git
```

## Option A: GitHub CLI

```bash
gh auth login
cd Secure-AI-Flow
git init
git branch -M main
git add .
git commit -m "Initialize Security-First AI Flow methodology"
git remote add origin https://github.com/solomonsjoseph/Secure-AI-Flow.git
git push -u origin main
```

## Option B: SSH

```bash
cd Secure-AI-Flow
git init
git branch -M main
git add .
git commit -m "Initialize Security-First AI Flow methodology"
git remote add origin git@github.com:solomonsjoseph/Secure-AI-Flow.git
git push -u origin main
```

## Option C: GitHub Web UI

1. Open the empty repository.
2. Upload all files and folders from this package.
3. Commit to `main`.
4. Confirm `.github/workflows/security-baseline.yml` runs.
5. Configure branch protection for `main`.

## Recommended Branch Protection

In GitHub repository settings, configure:

```text
- Require pull request before merging.
- Require status checks to pass.
- Require the Security Baseline workflow.
- Require review from CODEOWNERS.
- Restrict who can dismiss reviews.
- Block force pushes.
- Block deletion of main.
```

Do not paste access tokens into chat. Use GitHub CLI, SSH keys, or the official GitHub app/connector permissions.
