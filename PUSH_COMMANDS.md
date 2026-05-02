# Push Commands for Secure-AI-Flow

Use these commands to push this package into the GitHub repository.

## Terminal Method

Assume the downloaded zip is named `Secure-AI-Flow-security-first-methodology.zip`.

```bash
mkdir -p /tmp/secure-ai-flow-template
unzip Secure-AI-Flow-security-first-methodology.zip -d /tmp/secure-ai-flow-template

git clone git@github.com:solomonsjoseph/Secure-AI-Flow.git /tmp/Secure-AI-Flow-repo
rsync -a --exclude='.git' /tmp/secure-ai-flow-template/Secure-AI-Flow/ /tmp/Secure-AI-Flow-repo/

cd /tmp/Secure-AI-Flow-repo
bash scripts/verify-methodology.sh
git add .
git commit -m "Add Secure-AI-Flow security-first methodology"
git branch -M main
git push -u origin main
```

## HTTPS with GitHub CLI

```bash
mkdir -p /tmp/secure-ai-flow-template
unzip Secure-AI-Flow-security-first-methodology.zip -d /tmp/secure-ai-flow-template

gh repo clone solomonsjoseph/Secure-AI-Flow /tmp/Secure-AI-Flow-repo
rsync -a --exclude='.git' /tmp/secure-ai-flow-template/Secure-AI-Flow/ /tmp/Secure-AI-Flow-repo/

cd /tmp/Secure-AI-Flow-repo
bash scripts/verify-methodology.sh
git add .
git commit -m "Add Secure-AI-Flow security-first methodology"
git branch -M main
git push -u origin main
```

## Manual GitHub Web Upload

Manual upload works, but it is worse because hidden files like `.github/workflows/security-methodology-guard.yml` and `.gitignore` are easy to miss. Terminal push is cleaner.
