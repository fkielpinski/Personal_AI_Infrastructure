---
name: investigation
description: OSINT and structured investigation — company intel, due diligence, background research, competitive intelligence, technical infrastructure recon. USE WHEN OSINT, due diligence, company intel, background check, find person, locate, people search, investigate company, competitive intelligence, public records, who owns, infrastructure recon, vetting.
metadata:
  author: pai
  version: 2.0.0
---

# Investigation Skill

## Scope

Ethical OSINT using publicly available information only:
- Company background research and due diligence
- Public figure and executive research
- Competitive intelligence
- Technical infrastructure reconnaissance (authorized systems only)

**Not in scope:** Private individuals without legitimate purpose, non-public data sources, doxxing.

---

## Workflow Routing

| Trigger | Workflow |
|---------|----------|
| "investigate company", "due diligence", "company background" | Company Due Diligence |
| "investigate person", "background on", "who is" | Person Background |
| "technical recon", "infrastructure", "attack surface" | Technical Infrastructure |
| "competitive intelligence", "compare companies" | Competitive Intelligence |

---

## COMPANY DUE DILIGENCE
*Comprehensive background on a company — ownership, financials, people, reputation.*

**Invoke:** `investigation company: [company name/domain]`

**Procedure:**
1. Spawn 3 parallel @researcher agents:
   - Corporate structure: "Research [company]. Find: legal name, registration jurisdiction, founding date, ownership structure, parent company, subsidiaries, key executives (LinkedIn). Sources: company website, Crunchbase, LinkedIn, corporate registry."
   - Financials and funding: "Research [company] financials. Find: funding rounds (amounts, investors, dates), revenue estimates, valuation, recent financial news, any SEC filings. Sources: Crunchbase, PitchBook summaries, news, SEC EDGAR if public."
   - Reputation and news: "Research [company] reputation. Find: news coverage (last 12 months), lawsuits, regulatory actions, employee reviews (Glassdoor), customer complaints, security incidents. Sources: news search, court records, BBB, Glassdoor."
2. Synthesize: cross-reference across sources, flag inconsistencies.

**Output:**
```
INVESTIGATION: [company]
CORPORATE:
  Legal name: [...]  Jurisdiction: [...]
  Founded: [...]  Type: [public/private/subsidiary]
  Ownership: [...]  Parent: [...]
FINANCIALS:
  Funding: [total raised, last round, key investors]
  Revenue: [estimate if available]
  Valuation: [last known]
KEY PEOPLE:
  [Name — Role — Background]
REPUTATION:
  [News highlights, any red flags, employee sentiment]
RED FLAGS: [anything that warrants deeper investigation]
CONFIDENCE: [per section]
GAPS: [what couldn't be found]
SOURCES: [list]
```

---

## PERSON BACKGROUND
*Public figure or executive research using public records.*

**Invoke:** `investigation person: [name, affiliation]`

**Procedure:**
1. Spawn 2 parallel @researcher agents:
   - Professional background: "Research [name] professional history. Find: current role and company, past roles and companies, education, publications or patents, conference appearances, professional network (mutual connections with notable people). Sources: LinkedIn, company bio pages, conference talks, Google Scholar."
   - Public presence and reputation: "Research [name] public presence. Find: social media (Twitter/X, GitHub, etc.), news mentions, interviews, any controversies or legal issues, public writings. Sources: news search, social platforms, personal website, interview archives."

**Output:**
```
INVESTIGATION: [person]
IDENTITY: [name, current role, company]
PROFESSIONAL:
  Career path: [timeline]
  Education: [...]
  Notable work: [...]
PUBLIC PRESENCE:
  Social: [platforms, handles]
  Writing/speaking: [...]
  News: [key mentions]
NETWORK: [notable associations]
FLAGS: [anything worth noting]
CONFIDENCE: [per section]
GAPS: [what's missing]
SOURCES: [list]
```

---

## TECHNICAL INFRASTRUCTURE RECON
*Map technical footprint of a domain or organization (authorized systems only).*

**Invoke:** `investigation technical: [domain/organization]`

**Authorization required:** Confirm this is for systems you own or are authorized to assess.

**Procedure:**
1. @researcher: "Perform passive technical recon on [domain]. Using only public sources: find DNS records (MX, NS, TXT, subdomains via certificate transparency), WHOIS/RDAP data, IP ranges (ASN lookup), technology stack (Wappalyzer, BuiltWith), open ports visible via Shodan (search shodan.io for [domain])."
2. @coder: "Given this technical profile of [domain], identify: infrastructure stack, cloud providers, CDN/WAF in use, email security posture (SPF/DKIM/DMARC), exposed services, and any publicly known vulnerabilities in identified software versions."

**Output:**
```
TECHNICAL RECON: [target]
DOMAINS/IPs:
  Primary: [...]  Subdomains: [list]
  IP range/ASN: [...]
DNS:
  MX: [...]  NS: [...]  TXT: [SPF/DKIM/DMARC status]
INFRASTRUCTURE:
  Cloud: [AWS/GCP/Azure/etc]  CDN/WAF: [...]
  Tech stack: [languages, frameworks, CMS, etc]
EXPOSED SERVICES: [ports/services visible publicly]
CERTIFICATE DATA: [issuer, SANs, expiry]
KNOWN VULNS: [CVEs in identified software, if any]
ATTACK SURFACE SUMMARY: [top 3 areas of concern]
```

---

## COMPETITIVE INTELLIGENCE
*Compare companies, map a competitive landscape, understand market positioning.*

**Invoke:** `investigation competitive: [company] vs [market/competitors]`

**Procedure:**
1. @researcher: "Map the competitive landscape for [market/product category]. Identify: top 5-8 competitors, their market positioning, pricing (if public), target customers, key differentiators, funding/size."
2. @researcher (focused): "Research [specific company] competitive position. How do they position themselves vs. [competitors]? What do customers say about them vs. alternatives? What are their strengths and weaknesses according to public reviews and analyst coverage?"
3. @thinker: "Given this competitive map, what are the key strategic dynamics? Who is winning and why? What are the critical battlegrounds? What would disrupt this landscape?"

**Output:**
```
COMPETITIVE INTEL: [market]
LANDSCAPE OVERVIEW: [brief]
PLAYERS:
  [Company] — [Positioning] — [Size/Stage] — [Key strength]
COMPETITIVE DYNAMICS:
  Who's winning: [...]
  Key differentiators: [...]
  Customer switching factors: [...]
[Focus Company] POSITION:
  Strengths: [...]
  Weaknesses: [...]
  Opportunity: [...]
  Threat: [...]
STRATEGIC DYNAMICS: [what @thinker surfaced]
```
