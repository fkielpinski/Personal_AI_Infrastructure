---
name: thinking
description: Multi-mode analytical and creative thinking. First principles decomposition, iterative depth, red teaming, premortem, council debates, steelmanning, and Socratic chains. USE WHEN think deeply, first principles, analyze, red team, challenge assumptions, brainstorm, debate, steelman, break down, root cause, strategic analysis, premortem, council, critique plan.
metadata:
  author: pai
  version: 2.0.0
---

# Thinking Skill

## Workflow Routing

Select the mode that matches the nature of the problem.

| Trigger | Mode | Best For |
|---------|------|----------|
| "first principles", "why does X work" | First Principles | Rebuilding understanding from scratch |
| "red team", "attack my plan" | Red Team | Finding flaws before they bite |
| "premortem", "assume it failed" | Premortem | Project/plan risk identification |
| "council", "debate", "perspectives" | Council | Multi-viewpoint decisions |
| "iterate", "go deeper" | Iterative Depth | Unknown problem structure |
| "steelman", "strongest case for" | Steelman | Stress-testing your own opposition |
| "socratic", "keep questioning" | Socratic | Drilling to bedrock assumptions |

---

## FIRST PRINCIPLES
*Decompose any concept to its irreducible foundations. Challenge every assumption. Rebuild from axioms only.*

**Invoke:** `thinking first-principles: [concept/problem]`

**Procedure:**
1. Delegate to @thinker: "Apply first principles analysis to [concept]. Strip it to its irreducible foundations. For each component: Is this actually fundamental or is it a convention that could be different? Rebuild the concept from axioms only. List every assumption that people typically take for granted and examine each one."

**Format:**
```
FIRST PRINCIPLES: [concept]
COMMON ASSUMPTIONS:
  - [assumption 1] → [is this actually necessary? why/why not]
  - [assumption 2] → [...]
IRREDUCIBLE FOUNDATIONS:
  1. [axiom] — [why this is actually fundamental]
  2. [axiom] — [...]
REBUILT UNDERSTANDING:
  [The concept, rebuilt from axioms up — what changes when you do this]
KEY INSIGHT: [what most people miss because they never do this]
IMPLICATIONS: [what this changes about how you'd approach the problem]
```

---

## RED TEAM
*Adversarially attack a plan, idea, or claim. Find every flaw, edge case, and failure mode.*

**Invoke:** `thinking red-team: [plan/idea/claim]`

**Procedure:**
1. Spawn 2 parallel @thinker agents:
   - Agent A (temperature 0.8): "You are an adversarial critic. Find every flaw, edge case, and failure mode in: [plan]. Do not be nice. Do not hedge. List the 5 most likely ways this fails and 3 most catastrophic edge cases."
   - Agent B (temperature 0.6): "Examine the hidden assumptions in: [plan]. Which assumptions, if wrong, would cause total failure? Which risks are being ignored? What do people typically miss about this type of plan?"
2. Merge both attacks into a unified threat map, removing duplicates, ranked by severity.

**Format:**
```
RED TEAM: [target]
MOST LIKELY FAILURES:
  1. [failure mode] — [how likely] — [impact]
  2. [...]
CRITICAL ASSUMPTIONS (if wrong = total failure):
  - [assumption] — [probability it's wrong] — [consequence]
IGNORED RISKS:
  - [...]
CATASTROPHIC EDGE CASES:
  - [case] — [trigger condition] — [outcome]
VERDICT: [overall assessment — is this plan safe to proceed with?]
HARDENING: [top 3 changes that would most reduce risk]
```

---

## PREMORTEM
*Assume the project has already failed. Work backwards to understand why.*

**Invoke:** `thinking premortem: [project/plan]`

**Procedure:**
1. Delegate to @thinker: "Conduct a premortem on [project]. It is now 12 months from now. The project has failed. It was a complete failure. Work backwards: What caused it? What were the warning signs that were ignored in the early weeks? What decisions made in the planning stage sealed the fate? What did the team think was going well but was actually going wrong? Be specific — not generic failure modes, but the specific ways THIS project would fail."

**Format:**
```
PREMORTEM: [project]
FAILURE SCENARIO: [what exactly happened — be specific]
ROOT CAUSES:
  1. [cause] — [how it started] — [when it became fatal]
  2. [...]
EARLY WARNING SIGNS (that will be ignored):
  - [sign] — [week it appears] — [why it gets dismissed]
CRITICAL DECISION POINTS:
  - [decision] — [wrong choice] — [better alternative]
WHAT LOOKED FINE (but wasn't):
  - [false positive] — [actual problem underneath]
SURVIVAL MOVES: [changes that would have prevented failure]
```

---

## COUNCIL
*Simulate N expert personas debating the topic. Each argues their strongest case. Synthesize.*

**Invoke:** `thinking council: [topic/decision]` or `thinking council [PersonaA] vs [PersonaB]: [topic]`

**Procedure:**
1. Define 3-5 relevant expert personas (or use user-specified ones).
2. Spawn one @thinker per persona in parallel, each with a distinct instruction:
   - "You are [Persona A — e.g., 'a skeptical experienced engineer']. Argue your strongest position on: [topic]. Do not hedge. Argue from your expertise and worldview. 200-300 words."
   - "You are [Persona B — e.g., 'an optimistic startup founder']. Argue your strongest position on: [topic]..."
   - [repeat for each persona]
3. After all return: synthesize — where do they agree? Where do they fundamentally disagree and why? What does the aggregate of these perspectives reveal?

**Format:**
```
COUNCIL ON: [topic]
PERSONAS: [list]

[Persona A]:
  POSITION: [their core stance]
  ARGUMENT: [strongest case — 3-5 bullets]
  BLIND SPOT: [what they can't see from their viewpoint]

[Persona B]:
  POSITION: [...]
  ARGUMENT: [...]
  BLIND SPOT: [...]

[repeat for each]

SYNTHESIS:
  CONSENSUS: [where all or most agree]
  CORE CONFLICT: [where they fundamentally disagree and why]
  WHAT AGGREGATE REVEALS: [insight that emerges from having all perspectives]
VERDICT: [most defensible position given all inputs]
```

---

## ITERATIVE DEPTH
*Start broad, go one level deeper each iteration. For problems where the right question isn't yet known.*

**Invoke:** `thinking iterate: [topic]` or `thinking deep: [topic]`

**Procedure:**
1. **Iteration 1 — Broad landscape:** Delegate to @thinker: "Give me a broad map of [topic]. What are the 4-6 main dimensions or sub-problems? Don't go deep — go wide. Identify which dimension seems most important or most confused."
2. **Iteration 2 — First depth:** Pick the most important dimension from iteration 1. Delegate to @thinker: "Go one level deeper on [dimension] from [topic]. Identify the 3-4 key sub-questions within this dimension."
3. **Iterate until:** Sufficient depth reached, user signals stop, or bedrock assumption found.

**Format per iteration:**
```
ITERATIVE DEPTH: [topic] — Iteration [N]
CURRENT FOCUS: [what's being examined]
MAP:
  [structured decomposition of this level]
KEY FINDING: [most important thing from this iteration]
DEEPEST THREAD: [which sub-problem merits iteration N+1]
NEXT ITERATION: [what to examine next]
```

---

## STEELMAN
*Construct the strongest possible version of an argument you disagree with.*

**Invoke:** `thinking steelman: [position/claim]`

**Procedure:**
1. Delegate to @thinker: "Steelman the following position: [position]. Build the most rigorous, most charitable, most intellectually serious version of this argument. Do not use strawmen. Assume the smartest possible version of this view. Find the actual evidence and reasoning that its best proponents use. After steelmanning: identify what's genuinely compelling about this view even from an opposing perspective."

**Format:**
```
STEELMAN: [original position]
STRONGEST VERSION:
  CORE CLAIM: [what it's really claiming at its best]
  BEST EVIDENCE: [...]
  STRONGEST REASONING: [logical chain, not caricature]
  WHAT PROPONENTS KNOW THAT CRITICS MISS: [...]
WHAT'S GENUINELY COMPELLING:
  [Even if you disagree, what's actually right here?]
WHAT STILL FAILS:
  [After steelmanning — what remains genuinely weak?]
```

---

## SOCRATIC
*Question-chain drilling. Keep asking "why" until bedrock assumptions surface.*

**Invoke:** `thinking socratic: [claim/belief]`

**Procedure:**
1. @thinker: "Apply Socratic method to: [claim]. Ask 'why is this true?' for each answer. Go 5-7 levels deep. At each level: state the claim, ask the next probing question, identify what assumption is being relied upon. Stop when you hit a bedrock assumption that can't be further reduced — or when you find a claim that doesn't hold under questioning."

**Format:**
```
SOCRATIC: [initial claim]
Level 1: [claim] → Why? → [assumption exposed]
Level 2: [new claim] → Why? → [assumption exposed]
Level 3: [new claim] → Why? → [assumption exposed]
...
BEDROCK: [the irreducible assumption the whole chain rests on]
VERDICT: [is the bedrock defensible? Does the original claim survive?]
```
