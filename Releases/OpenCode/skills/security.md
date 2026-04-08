---
name: security
description: Security assessment and analysis — code review, vulnerability assessment, threat modeling, CTF challenges, and defensive security. USE WHEN security review, vulnerability, threat model, CVE, exploit, CTF, penetration test, audit, hardening, OWASP, secure code review, red team, blue team.
metadata:
  author: pai
  version: 1.0.0
---

# Security Skill

## Scope

Authorized security work only:
- Secure code review and vulnerability analysis
- Threat modeling for systems you own or are authorized to assess
- CTF challenges and security research
- Defensive security hardening
- Security architecture review

## Workflows

### Secure Code Review
1. Identify the attack surface (inputs, outputs, trust boundaries)
2. Check OWASP Top 10 systematically
3. Look for logic flaws, not just syntax issues
4. Check authentication, authorization, and session management
5. Review cryptography usage
6. Check for injection points (SQL, command, XSS, etc.)

### Threat Modeling
Framework: STRIDE (Spoofing, Tampering, Repudiation, Information Disclosure, DoS, Elevation of Privilege)
1. Define system boundaries
2. Enumerate assets and data flows
3. Apply STRIDE to each component
4. Prioritize by risk (likelihood × impact)
5. Map mitigations

### CTF / Research Mode
- Clearly state this is a CTF or authorized research context
- Approach methodically: recon → enumeration → exploitation → post-exploitation
- Document steps for writeup

## Output Format

```
SECURITY REVIEW: [target]
SCOPE: [what was reviewed]
CRITICAL: [findings requiring immediate action]
HIGH: [significant findings]
MEDIUM: [moderate findings]
LOW/INFO: [minor findings]
RECOMMENDATIONS: [prioritized action items]
```
