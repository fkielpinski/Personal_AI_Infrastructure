---
name: security
description: Security assessment and analysis — code review, vulnerability assessment, threat modeling, CTF challenges, malware analysis, eBPF security, and defensive hardening. USE WHEN security review, vulnerability, threat model, CVE, exploit, CTF, penetration test, audit, hardening, OWASP, secure code review, red team, blue team, malware, eBPF, kernel security, rootkit, incident response.
metadata:
  author: pai
  version: 2.0.0
---

# Security Skill

## Scope

Authorized security work only:
- Secure code review and vulnerability analysis
- Threat modeling for systems you own or are authorized to assess
- CTF challenges and security research
- Defensive security hardening and architecture review
- Malware analysis and detection engineering
- eBPF/kernel security research

**Not in scope:** Attacks on systems without authorization, DoS, mass targeting, supply chain compromise.

---

## Workflow Routing

| Trigger | Workflow |
|---------|----------|
| "review code", "audit this", "check for vulns" | Secure Code Review |
| "threat model", "STRIDE" | Threat Modeling |
| "CTF", "challenge", "capture the flag" | CTF / Research |
| "malware", "reverse engineer", "rootkit", "eBPF" | Malware / Kernel Analysis |
| "incident", "responding to", "IOC" | Incident Response |
| "harden", "security posture", "best practices" | Hardening Review |

---

## SECURE CODE REVIEW
*Systematic vulnerability analysis of source code.*

**Invoke:** `security review: [code/repo/file]`

**Procedure:**
1. Spawn 2 parallel @coder agents:
   - Agent A: "Security code review — OWASP Top 10 sweep. Review: [code]. Check systematically for: injection (SQL, command, XSS, XXE, SSRF), broken authentication, sensitive data exposure, broken access control, security misconfiguration, insecure deserialization, components with known vulns. List every finding with: file/line, vulnerability class, exploitability, and recommended fix."
   - Agent B: "Security code review — logic and architecture. Review: [code]. Look for: privilege escalation paths, race conditions, improper error handling that leaks info, trust boundary violations, business logic flaws, insecure cryptography, hardcoded secrets. Go beyond syntax — think about what an attacker could do."
2. Merge findings, deduplicate, rank by CVSS-style severity: Critical/High/Medium/Low/Info.

**Output:**
```
SECURITY REVIEW: [target]
SCOPE: [files/components reviewed]
CRITICAL: [findings requiring immediate action — exploitation likely]
HIGH: [significant findings — significant risk]
MEDIUM: [moderate findings — context-dependent risk]
LOW/INFO: [minor findings, defense-in-depth]
ATTACK SURFACE: [what an attacker would focus on first]
RECOMMENDATIONS: [prioritized action items, 1 = most urgent]
```

---

## THREAT MODELING
*Structured threat identification using STRIDE framework.*

**Invoke:** `security threat-model: [system/component]`

**Procedure:**
1. @coder: "Read the system description and produce a data flow diagram. Identify: components, data flows, trust boundaries, entry points, assets worth protecting."
2. @thinker (red team mode): "Apply STRIDE to each component and data flow in [system]. For each: Spoofing — can identity be faked? Tampering — can data be modified? Repudiation — can actions be denied? Information Disclosure — what can leak? DoS — what can be overwhelmed? Elevation of Privilege — can an attacker gain more access than intended? For each threat: rate likelihood (1-5) and impact (1-5). Prioritize the top 5 by likelihood × impact."
3. Merge into a prioritized threat register.

**Output:**
```
THREAT MODEL: [system]
ASSETS: [what's being protected]
TRUST BOUNDARIES: [where trust changes]
THREAT REGISTER:
  T1: [threat] — [STRIDE category] — Likelihood: [/5] — Impact: [/5] — Score: [/25]
  T2: [...]
MITIGATIONS:
  T1: [control] — [effectiveness] — [implementation cost]
  T2: [...]
RESIDUAL RISK: [what remains after mitigations]
```

---

## CTF / RESEARCH MODE
*Structured approach for CTF challenges and authorized security research.*

**Invoke:** `security CTF: [challenge description]` or "CTF: [details]"

**Context required:** State this is a CTF competition or authorized research context.

**Procedure:**
1. @coder (recon phase): "This is a CTF challenge. Perform initial enumeration: [challenge]. Identify: service type, visible attack surface, obvious entry points, what information is already given. Do NOT attempt exploitation — map first."
2. @thinker: "Given this enumeration of CTF challenge [X], identify the most likely vulnerability categories and attack path. What technique does this challenge seem designed to test? What's the typical kill chain for this category?"
3. @coder (exploitation): "Execute the attack plan: [plan]. Step by step. Document each step for the writeup."

**Output:**
```
CTF: [challenge name]
CATEGORY: [web/pwn/crypto/forensics/reverse/misc]
RECON:
  [findings from initial enumeration]
HYPOTHESIS: [what vuln this is testing]
ATTACK PATH:
  Step 1: [action] → [result]
  Step 2: [...]
FLAG: [if found]
WRITEUP NOTES: [key technique for the writeup]
```

---

## MALWARE / KERNEL ANALYSIS
*Static/dynamic analysis of malicious code, rootkits, and eBPF-based threats.*

**Invoke:** `security analyze: [malware/sample/eBPF program]`

**Procedure:**
1. @coder (static): "Perform static analysis of [sample]. Identify: file type, strings, imports/exports, suspicious patterns, code structure. For eBPF: identify map types, helper calls, attach points, and what kernel events are being hooked. Do not execute."
2. @coder (behavioral): "Describe the behavioral profile: what would this code do at runtime? What system calls? What network activity? What persistence mechanisms? What artifacts would it leave?"
3. @thinker: "Given this analysis, classify the threat: What is its purpose? Who is the likely target? What detection strategies would work? What MITRE ATT&CK techniques apply?"

**Output:**
```
MALWARE ANALYSIS: [sample]
TYPE: [dropper/loader/backdoor/rootkit/eBPF hook/etc]
STATIC FINDINGS:
  [Strings, imports, structure]
BEHAVIORAL PROFILE:
  Syscalls: [...]
  Network: [...]
  Persistence: [...]
  Evasion: [...]
MITRE ATT&CK:
  [Technique IDs and names]
DETECTION:
  [YARA rules / eBPF hook signatures / behavioral indicators]
SEVERITY: [Critical/High/Medium/Low]
```

---

## INCIDENT RESPONSE
*Structured triage and investigation for active or recent security incidents.*

**Invoke:** `security incident: [description/IOCs]`

**Procedure:**
1. @thinker: "Given these IOCs/incident details: [details]. Identify: likely attack vector, attacker TTPs, what was accessed/exfiltrated, timeline of compromise, blast radius."
2. @coder: "Generate investigation commands for [incident on Linux/Windows/container]. What to run to: confirm IOCs, find persistence mechanisms, identify lateral movement, collect forensic artifacts."
3. Produce containment and remediation plan.

**Output:**
```
INCIDENT RESPONSE: [incident]
TRIAGE:
  Confirmed: [what's certain]
  Suspected: [what's likely]
  Unknown: [what needs investigation]
ATTACK VECTOR: [how they got in]
BLAST RADIUS: [what was affected]
INVESTIGATION COMMANDS:
  [Runbook — specific commands with purpose]
CONTAINMENT: [immediate steps]
REMEDIATION: [longer-term fixes]
IOCs: [hashes, IPs, domains, file paths]
```

---

## HARDENING REVIEW
*Assess and improve security posture of a system, service, or configuration.*

**Invoke:** `security harden: [system/config/service]`

**Procedure:**
1. @coder: "Review [system] configuration against security best practices. Check: unnecessary services/ports open, default credentials, excessive permissions, logging coverage, encryption in transit and at rest, input validation, dependency security."
2. @thinker: "Given this system's purpose and current posture, what are the 5 highest-ROI hardening changes? Rank by: (risk reduction × implementation cost^-1)."

**Output:**
```
HARDENING REVIEW: [system]
CURRENT POSTURE: [brief assessment]
HARDENING ACTIONS (ranked by ROI):
  1. [action] — [risk reduced] — [effort: Low/Med/High]
  2. [...]
QUICK WINS: [changes completable in <1 hour]
COMPLIANCE NOTES: [relevant standards — CIS, NIST, etc.]
```
