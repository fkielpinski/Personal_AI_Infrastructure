---
name: content-analysis
description: Extract wisdom, insights, and knowledge from any content — videos, podcasts, articles, papers, books, transcripts. USE WHEN extract wisdom, content analysis, analyze content, insight report, analyze video, analyze podcast, extract insights, key takeaways, summarize, what did I learn, distill, deep analysis, compare content, extract knowledge.
metadata:
  author: pai
  version: 2.0.0
---

# Content Analysis Skill

Extract maximum signal from any content format.

---

## Workflow Routing

| Trigger | Workflow |
|---------|----------|
| "extract wisdom", "what's valuable in", "highest-value insights" | Extract Wisdom |
| "summarize", "compress", "TL;DR" | Summarize |
| "analyze deeply", "critique", "check evidence" | Deep Analysis |
| "compare", "A vs B" | Comparative Analysis |
| "extract knowledge", "what can I learn", "teach me from" | Extract Knowledge |
| "extract action items", "what should I do" | Action Extraction |

---

## EXTRACT WISDOM
*Pull the most valuable, non-obvious insights. Focus on what changes how you think.*

**Invoke:** `content-analysis extract-wisdom: [content/URL]`

**Procedure:**
1. If URL: use @researcher to fetch the content first.
2. @thinker (iterative depth): "Extract the highest-value wisdom from this content: [content]. Focus on: (1) Ideas that change how you think — not obvious, not already widely known; (2) Frameworks and mental models that can be reused; (3) Surprising facts, reversals, or counterintuitive findings; (4) Actionable insights. Ignore: summaries of what the author thinks, conventional wisdom, anything you already knew. Go 3 levels deep — the first layer is what the author says, the second is what it implies, the third is what it means for how to act."

**Output:**
```
WISDOM EXTRACTION: [source]
CORE THESIS: [one sentence — what the content is fundamentally arguing]
ALPHA INSIGHTS: [the non-obvious, high-value findings]
  1. [insight] — [why non-obvious] — [implication]
  2. [insight] — [why non-obvious] — [implication]
  3. [...]
MENTAL MODELS: [reusable frameworks introduced or implied]
BEST QUOTE: "[most insightful or memorable line]"
WHAT TO DO: [specific actionable takeaways]
WHAT IT MISSES: [what the content doesn't address but should]
```

---

## SUMMARIZE
*Compress content to its essential points without losing meaning.*

**Invoke:** `content-analysis summarize: [content/URL]` or "summarize this: [content]"

**Procedure:**
Compress the content to three levels of abstraction:
1. One sentence (core claim)
2. One paragraph (5-7 sentences, main points)
3. Bullet list (key supporting points, 5-10 items)

**Output:**
```
SUMMARY: [source]
ONE SENTENCE: [core claim]
PARAGRAPH:
  [5-7 sentence summary of the full content]
KEY POINTS:
  • [point]
  • [point]
  • [...]
OMITTED: [what was left out that some readers may care about]
```

---

## DEEP ANALYSIS
*Go beyond summarization — critique the argument, check the evidence, find gaps.*

**Invoke:** `content-analysis analyze: [content/URL]`

**Procedure:**
1. @thinker (red team): "Analyze the reasoning and evidence in this content: [content]. Identify: (1) What are the core claims? (2) What evidence supports each claim? (3) Where is the reasoning weak, circular, or based on assumptions? (4) What counterevidence exists? (5) What is the author's perspective/bias and how does it shape the argument? (6) What would a rigorous skeptic say?"
2. @researcher (if claims are verifiable): "Fact-check the 3 most important empirical claims in [content] against independent sources."

**Output:**
```
DEEP ANALYSIS: [source]
CORE CLAIMS:
  C1: [claim] — Evidence: [strong/weak/missing] — Status: [supported/contested/false]
  C2: [...]
REASONING QUALITY:
  Strong: [where the argument holds up]
  Weak: [where it doesn't, and why]
  Circular: [any circular reasoning identified]
AUTHOR BIAS: [perspective/agenda shaping the framing]
MISSING EVIDENCE: [what would make this more convincing]
VERDICT: [is the core argument defensible? What's the honest assessment?]
```

---

## COMPARATIVE ANALYSIS
*Compare two or more pieces of content on the same topic.*

**Invoke:** `content-analysis compare: [source A] vs [source B]`

**Procedure:**
1. Process each source separately (summarize + extract core claims).
2. @thinker (council mode with each source as a "persona"): "Compare [source A] and [source B] on [topic]. Where do they agree? Where do they fundamentally disagree? What does each get right that the other misses? What does the disagreement reveal about the underlying complexity of the topic?"

**Output:**
```
COMPARATIVE ANALYSIS: [A] vs [B]
SHARED GROUND: [what both agree on]
CORE CONFLICT:
  [A's position]: [...]
  [B's position]: [...]
  [Why they disagree]: [underlying tension]
WHAT A GETS RIGHT: [...]
WHAT B GETS RIGHT: [...]
WHAT NEITHER ADDRESSES: [...]
SYNTHESIS: [what a more complete view looks like given both]
VERDICT: [which is more right, and on what basis]
```

---

## EXTRACT KNOWLEDGE
*Structured knowledge extraction — convert content into reusable, teachable form.*

**Invoke:** `content-analysis extract-knowledge: [content/URL]`

**Procedure:**
1. @thinker: "Extract structured knowledge from this content: [content]. For each knowledge unit: (1) What concept is this? (2) How does it work? (3) When does it apply? (4) What's a concrete example? (5) What does it connect to? Format as a structured knowledge base entry."

**Output:**
```
KNOWLEDGE EXTRACTION: [source]
CONCEPTS:
  [Concept Name]
    Definition: [precise definition]
    Mechanism: [how it works]
    Applies when: [conditions for relevance]
    Example: [concrete illustration]
    Connects to: [related concepts]
    Source quote: "[relevant quote]"
  [Next concept...]
MENTAL MODELS: [reusable thinking frameworks identified]
VOCABULARY: [key terms and precise definitions]
KNOWLEDGE MAP: [how the concepts relate to each other]
```

---

## ACTION EXTRACTION
*Extract concrete next steps and action items from any content.*

**Invoke:** `content-analysis actions: [content/URL]` or "what should I do based on this"

**Procedure:**
1. @thinker: "Read this content and extract every concrete action implied or recommended: [content]. For each: (1) What exactly should be done? (2) Who should do it? (3) By when? (4) What's the expected outcome? (5) What's the cost of not doing it? Separate: immediate actions (this week), medium-term (this month), strategic (this quarter+)."

**Output:**
```
ACTION EXTRACTION: [source]
IMMEDIATE (this week):
  □ [action] — [expected outcome] — [effort: Low/Med/High]
MEDIUM-TERM (this month):
  □ [action] — [expected outcome] — [effort]
STRATEGIC (this quarter+):
  □ [action] — [expected outcome] — [effort]
HIGH-ROI: [single most important action]
SKIP: [what the content recommends that doesn't apply to your situation]
```
