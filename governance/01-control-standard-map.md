# Control and Standard Map

This file maps Secure-AI-Flow practices to recognized security sources.

It is not a compliance certification. It is a control-alignment map.

Before formal compliance use, verify current versions and applicability with qualified security/legal/compliance owners.

## Source Backbone

| Domain | Primary Source | Official URL | Secure-AI-Flow Use |
|---|---|---|---|
| Secure software development | NIST Secure Software Development Framework, SP 800-218 | https://csrc.nist.gov/pubs/sp/800/218/final | Secure SDLC practices, preparation, protection, production, response |
| Secure systems engineering | NIST SP 800-160 Vol. 1 Rev. 1 | https://csrc.nist.gov/pubs/sp/800/160/v1/r1/final | Secure architecture, system lifecycle, trustworthiness |
| Security/privacy controls | NIST SP 800-53 Rev. 5 | https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final | Access control, audit, configuration, incident response, risk, supply chain |
| Software security maturity | OWASP SAMM | https://owasp.org/www-project-samm/ | Governance, design, implementation, verification, operations maturity |
| Web/app security requirements | OWASP ASVS | https://owasp.org/www-project-application-security-verification-standard/ | Testable application security requirements |
| Web security risks | OWASP Top Ten | https://owasp.org/www-project-top-ten/ | Risk categories and review coverage |
| Threat modeling | OWASP Threat Modeling Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/Threat_Modeling_Cheat_Sheet.html | Structured threat modeling and abuse cases |
| Secure product design | OWASP Secure Product Design Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/Secure_Product_Design_Cheat_Sheet.html | Secure defaults, least privilege, fail secure, attack-surface reduction |
| Secure code review | OWASP Secure Code Review Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/Secure_Code_Review_Cheat_Sheet.html | Evidence-based code review |
| Web security testing | OWASP WSTG | https://owasp.org/www-project-web-security-testing-guide/ | Security testing approach |
| AI agent security | OWASP AI Agent Security Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/AI_Agent_Security_Cheat_Sheet.html | Agent tool, memory, autonomy, and prompt-injection controls |
| LLM application risk | OWASP Top 10 for LLM Applications | https://genai.owasp.org/llm-top-10/ | Prompt injection, sensitive data disclosure, supply chain, overreliance |
| Secure AI lifecycle | CISA/NCSC Guidelines for Secure AI System Development | https://www.ncsc.gov.uk/collection/guidelines-secure-ai-system-development | Secure design, development, deployment, operation for AI systems |
| Secure by design | CISA Secure by Design | https://www.cisa.gov/securebydesign | Security as core product requirement |
| Supply chain integrity | SLSA | https://slsa.dev/ | Provenance, build integrity, tamper resistance |
| Software component verification | OWASP SCVS | https://owasp.org/www-project-software-component-verification-standard/ | Component and dependency risk controls |
| SBOM | NTIA SBOM Minimum Elements | https://www.ntia.gov/report/2021/minimum-elements-software-bill-materials-sbom | SBOM components, relationships, and metadata |
| Incident response | NIST Computer Security Incident Handling guidance | https://csrc.nist.gov/pubs/sp/800/61/ | Incident preparation, detection, handling, recovery |
| ePHI/PHI safeguards | HHS HIPAA Security Rule | https://www.hhs.gov/hipaa/for-professionals/security/index.html | Administrative, physical, and technical safeguards for ePHI |

## Practice Mapping

| Secure-AI-Flow Practice | Source Alignment |
|---|---|
| Security operating contract | NIST SSDF, CISA Secure by Design, OWASP SAMM |
| Risk appetite and authority | NIST SP 800-53, OWASP SAMM |
| Data classification and privacy | NIST SP 800-53, HIPAA Security Rule where applicable |
| System context and trust boundaries | OWASP Threat Modeling Cheat Sheet, NIST SP 800-160 |
| Threat model and abuse cases | OWASP Threat Modeling Cheat Sheet, OWASP Secure Product Design |
| Secure architecture invariants | NIST SP 800-160, OWASP Secure Product Design |
| Testable security requirements | OWASP ASVS, NIST SSDF |
| Agent security model | OWASP AI Agent Security Cheat Sheet, OWASP LLM Top 10, CISA/NCSC AI guidance |
| Secure coding standards | OWASP Secure Code Review, OWASP ASVS |
| Verification and security testing | OWASP WSTG, OWASP ASVS, NIST SSDF |
| Supply-chain security | SLSA, OWASP SCVS, NTIA SBOM, NIST SSDF |
| Observability and incident response | NIST SP 800-61, NIST SP 800-53 |
| Evidence-based review | OWASP Secure Code Review, NIST SSDF |

## Control Coverage Checklist

| Control Area | Required File |
|---|---|
| Governance | `SECURITY-OPERATING-CONTRACT.md`, `governance/` |
| Data protection | `context/02-data-classification-and-privacy.md` |
| Architecture | `context/03-system-context-and-trust-boundaries.md`, `context/05-secure-architecture.md` |
| Threat modeling | `context/04-threat-model.md`, `context/15-security-stress-test-matrix.md` |
| AI/agent safety | `context/07-agent-security-model.md` |
| AppSec requirements | `context/06-security-requirements.md` |
| Secure coding | `context/09-secure-coding-standards.md` |
| Testing | `context/10-testing-and-verification.md` |
| Supply chain | `context/11-supply-chain-security.md` |
| Incident response | `context/12-observability-and-incident-response.md` |
| Review | `context/13-reviewer-playbook.md` |
| Evidence | `evidence/` |
