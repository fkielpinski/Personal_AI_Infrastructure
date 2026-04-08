---
name: telos
description: Life OS — goals, projects, beliefs, wisdom, habits, and personal strategy. USE WHEN goals, life goals, projects, priorities, beliefs, wisdom, habits, what should I focus on, life review, career, telos, personal strategy, north star, OKRs, life plan, decision framework.
metadata:
  author: pai
  version: 2.0.0
---

# Telos Skill

Telos is your Life OS — a structured system for thinking about goals, priorities, beliefs, and personal strategy.

## Core Concepts

- **Telos** — your ultimate aim: what you're optimizing for at the deepest level
- **Goals** — specific outcomes that serve the telos
- **Projects** — active work items that move goals forward
- **Beliefs** — the mental models you operate with
- **Wisdom** — hard-won insights worth keeping permanently

---

## Workflow Routing

| Trigger | Workflow |
|---------|----------|
| "life review", "where am I", "assess my goals" | Life Review |
| "decompose goal", "break down", "milestones for" | Goal Decomposition |
| "challenge my beliefs", "audit assumptions" | Belief Audit |
| "capture this insight", "remember this wisdom" | Wisdom Capture |
| "what should I prioritize", "priority stack" | Priority Stack |
| "decision", "should I", "choose between" | Decision Framework |

---

## LIFE REVIEW
*Periodic assessment of goal progress, priorities, and alignment with telos.*

**Invoke:** `telos review` or `life review`

**Procedure:**
1. @thinker (iterative depth): "Conduct a life review with the following structure: (1) What are the active goals and projects? What's the progress on each? (2) Which are most aligned with the ultimate telos? (3) What's consuming time but not serving the telos? (4) What's being neglected that matters? (5) What's the most important thing to focus on next?"

Note: This workflow works best when you provide your current goals and projects as context.

**Output:**
```
LIFE REVIEW: [date]
ACTIVE GOALS:
  [Goal] — [Progress: /10] — [Telos alignment: High/Med/Low] — [Blockers]
ACTIVE PROJECTS:
  [Project] — [Status] — [Moves which goal]
TIME AUDIT:
  Well spent: [...]
  Misallocated: [...]
  Neglected: [...]
PRIORITY SHIFTS: [what should change]
NEXT FOCUS: [single most important thing]
NORTH STAR CHECK: [are you moving toward your telos?]
```

---

## GOAL DECOMPOSITION
*Break a goal into concrete milestones, each with a clear success criterion.*

**Invoke:** `telos decompose: [goal]`

**Procedure:**
1. @thinker (first principles): "Decompose this goal: [goal]. First, what does success actually look like — be specific and measurable. Then break it into the minimum necessary milestones (3-7). For each milestone: what's the concrete deliverable, what's the success criterion, what's blocking it, and what's the next physical action."
2. @thinker (premortem): "Premortem on goal: [goal]. Assume it failed in 12 months. Why? What warning signs will appear early?"

**Output:**
```
GOAL: [goal]
SUCCESS DEFINITION: [specific, measurable outcome]
MILESTONES:
  M1: [deliverable] — [success criterion] — [estimated timeline]
  M2: [...]
DEPENDENCIES: [what must be true / done first]
BLOCKERS: [what's in the way right now]
NEXT ACTION: [single, physical, specific next step]
PREMORTEM: [top 2 ways this fails]
```

---

## BELIEF AUDIT
*Surface and challenge the assumptions underlying your current approach.*

**Invoke:** `telos audit beliefs: [domain]` or `challenge my beliefs about: [X]`

**Procedure:**
1. @thinker (Socratic): "Conduct a belief audit on [person's] beliefs about [domain]. Identify: the 5 core beliefs operating in this domain. For each: Is this belief based on evidence, on received wisdom, or on a single experience? Has it been tested? What would have to be true for this belief to be wrong? What's the cost of holding this belief if it's false?"

**Output:**
```
BELIEF AUDIT: [domain]
BELIEFS IDENTIFIED:
  B1: "[belief]"
    Source: [where this came from]
    Evidence: [what supports it]
    Challenge: [what would falsify it]
    Cost if wrong: [consequence of a false belief]
    Verdict: [Keep/Update/Discard/Investigate further]
RECOMMENDED UPDATES:
  [Belief to update] → [Better version]
```

---

## WISDOM CAPTURE
*Store a hard-won insight in a form that survives across contexts.*

**Invoke:** `telos capture: [insight]`

**Procedure:**
1. @thinker: "Refine and structure this wisdom for long-term retention: [insight]. Produce: (1) a crisp, portable one-sentence version — specific enough to be actionable, general enough to apply beyond the original context; (2) the underlying principle it points to; (3) a concrete example of how to apply it; (4) what to watch for (the signal that this wisdom is relevant)."
2. Save to `~/.config/opai/memory/learning/wisdom.md` in this format:

```
[date] — [one-sentence wisdom]
  Principle: [underlying principle]
  Apply when: [signal that triggers this]
  Example: [concrete application]
  Source: [context that generated this]
```

---

## PRIORITY STACK
*Cut through noise to identify what actually matters most right now.*

**Invoke:** `telos priorities` or `what should I focus on`

**Procedure:**
1. Collect all active goals, projects, and obligations (ask user to list them if not in context).
2. @thinker (council): "Evaluate this list of priorities from three perspectives: (A) Impact — which items, if completed, would most advance my ultimate goals? (B) Urgency — which items have real time pressure vs. artificial urgency? (C) Energy — which items require the kind of focus I have most vs. least? Produce a reordered priority stack: Tier 1 (do now, highest impact), Tier 2 (schedule deliberately), Tier 3 (batch/delegate/drop)."

**Output:**
```
PRIORITY STACK: [date]
TIER 1 — DO NOW:
  1. [item] — [why this is most important]
TIER 2 — SCHEDULE:
  2. [item] — [when to tackle this]
TIER 3 — BATCH/DELEGATE/DROP:
  3. [item] — [what to do with it]
WHAT TO STOP: [things consuming time without return]
THIS WEEK'S FOCUS: [single most important thing]
```

---

## DECISION FRAMEWORK
*Structured approach to a significant decision.*

**Invoke:** `telos decide: [decision]` or `should I [X or Y]`

**Procedure:**
1. @thinker (first principles): "Clarify the decision: [decision]. What exactly is being decided? What are all the real options (not just A vs B — are there C, D, or reframings)? What does success look like 1 year out?"
2. @thinker (red team on each option): "Red team option A: [A]. Then red team option B: [B]. What does each look like at its worst?"
3. @thinker (premortem): "Premortem both choices. Assume each failed."
4. Synthesize into a recommendation.

**Output:**
```
DECISION: [question]
OPTIONS: [A, B, C — including non-obvious alternatives]
CRITERIA: [what matters most in this decision]
ANALYSIS:
  Option A: [strengths] / [risks] / [premortem]
  Option B: [strengths] / [risks] / [premortem]
RECOMMENDATION: [best choice] — [why]
REVERSIBILITY: [how hard is it to undo this choice]
NEXT STEP: [what to do right now to move forward]
```
