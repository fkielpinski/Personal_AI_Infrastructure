---
name: investigation
description: OSINT and structured investigation — company intel, due diligence, background research, people search across public records and social media. USE WHEN OSINT, due diligence, company intel, background check, find person, locate, people search, investigate company, competitive intelligence, public records.
metadata:
  author: pai
  version: 1.0.0
---

# Investigation Skill

## Scope

Ethical OSINT using publicly available information only. This skill is for:
- Company background research and due diligence
- Public figure research
- Competitive intelligence
- Technical infrastructure reconnaissance (authorized only)

## Workflow

1. **Define target** — name, domain, or identifier
2. **Identify sources** — which public records, social platforms, registries apply
3. **Collect systematically** — work through source list, noting gaps
4. **Cross-reference** — verify findings across multiple independent sources
5. **Synthesize** — structured report with confidence levels per finding

## Source Categories

- **Corporate**: Company registries, SEC filings, LinkedIn, Crunchbase
- **Technical**: WHOIS, DNS records, certificate transparency, Shodan
- **Social**: Public social media, news archives, conference appearances
- **Academic**: Papers, patents, citations

## Output Format

```
INVESTIGATION: [target]
SUMMARY: [2-3 sentence overview]
FINDINGS:
  Corporate: [...]
  Technical: [...]
  Social: [...]
CONFIDENCE: [per finding]
GAPS: [what couldn't be found]
SOURCES: [list]
```

## Ethics

Always disclose that this is public-record research. Do not attempt to access private information. Do not aggregate into profiles of private individuals without legitimate purpose.
