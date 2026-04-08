---
name: research
description: Comprehensive research and content extraction. Quick, standard, extensive, and deep modes with multi-source parallel investigation, content retrieval, and analysis. USE WHEN research, investigate, find information, analyze content, retrieve content, extract knowledge, web scraping, standard research, map landscape, competitive analysis, deep investigation, interview prep, YouTube extraction, content enhancement.
metadata:
  author: pai
  version: 2.0.0
---

# Research Skill

## Workflow Routing

Select the workflow that matches the request depth. When in doubt, default to **Standard**.

| Trigger | Workflow | Speed |
|---------|----------|-------|
| "quick research", "minor research" | Quick | ~1 min |
| "research" (default), "do research" | Standard | ~3-5 min |
| "extensive research", "thorough research" | Extensive | ~8-12 min |
| "deep investigation", "investigate X", "map the landscape" | Deep Investigation | ~15-45 min |
| "extract alpha", "highest-value insights" | Extract Alpha | ~5 min |
| "get this content", "retrieve", "blocked URL" | Retrieve | ~2 min |
| "YouTube", youtube.com URL | YouTube Extraction | ~1 min |
| "interview prep", "prepare questions for" | Interview Research | ~5 min |

---

## QUICK RESEARCH
*1 agent, 2-3 sources, surface-level fact check or single question.*

**Invoke:** `research quick: [question]`

**Procedure:**
1. Delegate to @researcher: "Quick research — 1-2 sources only. Question: [question]. Return top 3 findings, confidence level, and any key gaps."
2. Return findings verbatim with source count noted.

**Output:**
```
QUICK RESEARCH: [question]
ANSWER: [direct answer]
SOURCES: [N checked]
CONFIDENCE: High/Medium/Low — [reason]
GAPS: [what's unconfirmed]
```

---

## STANDARD RESEARCH
*3 parallel agents, 4-8 sources, balanced multi-angle coverage. Default mode.*

**Invoke:** `research: [topic]` or `research standard: [topic]`

**Procedure:**
1. Decompose topic into 3 independent research angles.
2. Spawn 3 parallel @researcher agents, one per angle:
   - Agent 1: [angle 1 — breadth, overview, context]
   - Agent 2: [angle 2 — technical details, mechanisms]
   - Agent 3: [angle 3 — critiques, alternatives, edge cases]
3. Wait for all 3 to return.
4. Synthesize: find where they agree, where they diverge, fill gaps from crossover.

**Output:**
```
RESEARCH: [topic]
SOURCES: [total across agents]
FINDINGS:
  [Bullet-point findings by sub-topic, most important first]
KEY INSIGHT: [single most important non-obvious finding]
CONFIDENCE: High/Medium/Low — [reason]
GAPS: [what couldn't be confirmed]
```

---

## EXTENSIVE RESEARCH
*6-9 parallel agents, 15+ sources, broad comprehensive sweep.*

**Invoke:** `extensive research: [topic]` or `research extensive: [topic]`

**Procedure:**
1. Decompose topic into 6-9 independent sub-questions covering:
   - Background and history
   - Current state of the art
   - Technical mechanisms
   - Key players and stakeholders
   - Critiques and failure modes
   - Future directions
   - Practical applications
2. Spawn one @researcher per sub-question in parallel.
3. After all return: merge findings, resolve conflicts, identify consensus vs. contested claims.
4. Use @thinker to synthesize: "Given these findings from 9 research angles on [topic], identify the 3 most important non-obvious insights and the 2 biggest uncertainties."

**Output:**
```
EXTENSIVE RESEARCH: [topic]
SOURCES: [total]
ANGLES COVERED: [N]
FINDINGS:
  Background: [...]
  Current State: [...]
  Mechanisms: [...]
  Key Players: [...]
  Critiques: [...]
  Future: [...]
  Applications: [...]
SYNTHESIS: [what the aggregate picture shows]
KEY INSIGHTS: [top 3 non-obvious]
UNCERTAINTIES: [top 2 contested or unconfirmed]
CONFIDENCE: [overall]
```

---

## DEEP INVESTIGATION
*Iterative progressive research. Builds a knowledge vault. For landscape mapping.*

**Invoke:** `deep investigation: [topic]` or `investigate: [topic]` or `map the [X] landscape`

**Procedure:**

**Iteration 1 — Landscape Sweep:**
1. Spawn 3 @researcher agents in parallel:
   - Broad landscape overview: What are the main categories, entities, and forces?
   - Key players identification: Who are the top 10 most important actors/companies/tools?
   - Trend analysis: What's changing, what's stable, what's emerging?
2. Synthesize into an entity list scored by importance (HIGH/MEDIUM/LOW) and research effort needed.
3. Save to memory: `~/.config/opai/memory/work/investigation_[topic].md`

**Iteration 2+ — Entity Deep Dives:**
For each HIGH-priority entity (in order):
1. Spawn @researcher: "Deep dive on [entity] within the context of [topic]. Cover: what it is, why it matters, strengths, weaknesses, recent developments, key data points. 3-5 sources minimum."
2. Add findings to the vault.
3. Update entity scores based on new information (some may be downgraded).

**Exit when:** All HIGH entities researched AND at least 50% of MEDIUM entities covered OR user signals sufficient.

**Output per iteration:**
```
INVESTIGATION: [topic] — Iteration [N]
ENTITIES MAPPED: [count]
THIS ITERATION: [what was researched]
NEW FINDINGS: [key new information]
VAULT UPDATED: [yes/no]
NEXT: [what iteration N+1 will cover]
```

**Final synthesis:**
```
INVESTIGATION COMPLETE: [topic]
TOTAL SOURCES: [count]
ITERATIONS: [N]
LANDSCAPE SUMMARY: [3-5 bullet overview]
KEY PLAYERS: [top 5 with one-line summary each]
CRITICAL INSIGHTS: [top 3]
OPEN QUESTIONS: [what remains unknown]
```

---

## EXTRACT ALPHA
*Maximum signal extraction from existing content. For dense material where depth > breadth.*

**Invoke:** `extract alpha: [content/URL/topic]` or `highest-value insights from: [X]`

**Procedure:**
1. If URL: fetch content first via @researcher: "Retrieve and return full text of [URL]."
2. Pass full content to @thinker: "Apply iterative depth analysis to this content. Find the highest-value, non-obvious insights — things that are surprising, counterintuitive, or that change how you'd think about the topic. Ignore surface summaries. Go 3 levels deep."
3. Separately, pass to @researcher: "Cross-reference these claims from [source] against other sources. Which are well-supported, which are contested, which are novel?"
4. Merge thinker's depth analysis with researcher's validation.

**Output:**
```
EXTRACT ALPHA: [source]
CORE THESIS: [one sentence]
ALPHA INSIGHTS:
  1. [insight] — [why non-obvious] — [confidence]
  2. [insight] — [why non-obvious] — [confidence]
  3. [insight] — [why non-obvious] — [confidence]
BEST QUOTE: "[quote]"
WHAT IT GETS WRONG: [honest critique]
ACTIONABLE: [what to actually do with this]
```

---

## RETRIEVE
*For URLs that are blocked, CAPTCHA-protected, or otherwise inaccessible.*

**Invoke:** `retrieve: [URL]` or "I can't access [URL]"

**Procedure:**
1. Attempt direct fetch via @researcher: "Fetch and return the full text content of [URL]. If blocked, try alternate access methods."
2. If blocked: try searching for the content indirectly — "Search for [page title or topic] from [domain] and find the same information from accessible sources."
3. If a PDF or document: request @researcher to look for the document on archive.org or similar.

---

## YOUTUBE EXTRACTION
*For YouTube URLs — extract transcript and analyze.*

**Invoke:** Any youtube.com URL or "analyze this video: [URL]"

**Procedure:**
1. Fetch transcript via @researcher: "Retrieve the transcript for [YouTube URL]. If transcript unavailable via direct API, search for '[video title] transcript' or similar to find it."
2. Once transcript retrieved, route to Content Analysis skill for full processing.

---

## INTERVIEW RESEARCH
*Prepare for an interview — as interviewee or interviewer.*

**Invoke:** `interview prep: [person/company/role]` or `prepare questions for [topic]`

**Procedure:**
1. Spawn 2 parallel @researcher agents:
   - Background research: "Research [person/company]. Focus on: recent work, stated views, notable achievements, controversies, areas of expertise. 3-5 sources."
   - Question generation context: "Find recent interviews or talks by [person/company]. What topics do they return to? What questions have they NOT been asked that would be revealing?"
2. Use @thinker with council mode: "Given this background on [person], generate 10 sharp interview questions a Tyler Cowen-style interviewer would ask — unexpected angles, reveal character, not softballs."

**Output:**
```
INTERVIEW PREP: [subject]
BACKGROUND:
  [Key facts about subject]
THEIR VIEWS:
  [Key stances, frameworks, beliefs]
QUESTIONS:
  Opener: [...]
  Probing: [...]
  Unexpected: [...]
  Character: [...]
CAUTION: [topics to handle carefully]
```

---

## Output Format (default if not specified by workflow)

```
RESEARCH: [topic]
SOURCES: [N sources consulted]
FINDINGS:
  [Bullet-point findings organized by sub-topic]
CONFIDENCE: [High/Medium/Low] — [reason]
GAPS: [What couldn't be confirmed]
```
