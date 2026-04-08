---
name: agents
description: Compose, coordinate, and spawn AI agents for specialized perspectives and parallel work. USE WHEN create agent, spin up agent, specialized agent, agent personality, available agents, compose agent, debate, council, multi-agent, parallel agents, delegate to agent, what agents do I have, @researcher, @thinker, @coder.
metadata:
  author: pai
  version: 2.0.0
---

# Agents Skill

Compose and coordinate AI agents for specialized work.

---

## Built-in OPAI Agents

OPAI ships with 3 specialist subagents. Invoke them with `@agentname` or let the AI delegate automatically.

### @researcher
**Purpose:** Web research, fact-finding, source synthesis, content retrieval.
**Best for:** Any task requiring current information from the web.
**Permissions:** webfetch (allow), bash curl/grep/cat (allow), edit (deny).
**Temperature:** 0.3 (factual, consistent)

```
@researcher: "Research [topic]. Find [specific information]. 
Return: findings as bullet points, sources, confidence level."
```

### @thinker
**Purpose:** First principles, red teaming, premortem, council debates, deep analysis.
**Best for:** Strategic decisions, challenging assumptions, stress-testing plans.
**Permissions:** webfetch (deny), edit (deny), bash (deny) — pure reasoning.
**Temperature:** 0.7 (creative, exploratory)

```
@thinker: "Apply [first-principles/red-team/premortem/council] to: [topic].
Surface non-obvious insights. Be rigorous, not diplomatic."
```

### @coder
**Purpose:** Writing, debugging, reviewing, and refactoring code.
**Best for:** Implementation tasks, code review, debugging, testing.
**Permissions:** edit (allow), bash git/test/build commands (allow), webfetch (deny).
**Temperature:** 0.2 (precise, deterministic)

```
@coder: "Read [file]. [Implement/Fix/Review] [specific task].
Report: what changed, evidence it works."
```

---

## Workflow Routing

| Pattern | Use When |
|---------|----------|
| Single Expert | One specialized perspective needed |
| Parallel Research | Multiple independent angles simultaneously |
| Council Debate | Decision requires multiple expert viewpoints |
| Pipeline | Output of one agent feeds the next |
| Validation | One agent builds, another validates |

---

## SINGLE EXPERT AGENT
*Get a response from a specific built-in agent.*

**Invoke:** Just use `@agentname:` followed by the task.

```
@researcher: "What are the latest developments in [topic]?"

@thinker: "Challenge this plan: [plan]. Be adversarial."

@coder: "Review this code for security vulnerabilities: [code]"
```

---

## PARALLEL RESEARCH
*Multiple agents investigating different angles simultaneously.*

**Invoke:** `agents parallel: [topic]` or spawn multiple agents in one response.

**Procedure:**
Decompose the topic into N independent angles. Delegate each to @researcher simultaneously.

```
Parallel research on [topic]:

@researcher (angle 1 — breadth):
"Research the overall landscape of [topic]. What are the main categories, players, and trends?"

@researcher (angle 2 — technical):
"Research the technical details of [topic]. How does it work? What are the key mechanisms?"

@researcher (angle 3 — criticism):
"Research criticisms and failure modes of [topic]. What do skeptics say? What has gone wrong?"
```

After all return: synthesize into a unified view.

---

## COUNCIL DEBATE
*N expert personas debate a topic. Best for consequential decisions.*

**Invoke:** `agents council: [topic]` or specify personas explicitly.

**Procedure:**
Define 3-5 expert personas relevant to the topic. Each gets the same question from their distinct perspective. Synthesize after all respond.

**Example council for a technical architecture decision:**
```
Council on: [architecture decision]

@thinker [as "experienced systems architect"]:
"Argue from a systems architect's perspective: [decision]. What are the long-term technical tradeoffs?"

@thinker [as "startup CTO focused on shipping"]:
"Argue from a pragmatist perspective: [decision]. What gets us to market fastest with acceptable risk?"

@thinker [as "security engineer"]:
"Argue from a security-first perspective: [decision]. What are the attack surface and compliance implications?"
```

**Synthesis format:**
```
COUNCIL SYNTHESIS: [topic]
CONSENSUS: [where all personas agreed]
CORE CONFLICT: [where they fundamentally disagreed]
VERDICT: [most defensible position]
DISSENTING VIEW: [what the minority view gets right]
```

---

## PIPELINE
*Output of one agent feeds the next.*

**Invoke:** Describe the chain explicitly.

**Common pipelines:**

**Research → Analysis:**
```
Step 1 — @researcher: "Research [topic]. Return raw findings."
Step 2 — @thinker: "Given these research findings: [step1 output]. 
  Apply first principles analysis. What does this actually mean?"
```

**Analysis → Implementation:**
```
Step 1 — @thinker: "Design the approach for [problem]. 
  Return: approach, key decisions, potential issues."
Step 2 — @coder: "Implement [step1 approach]. 
  Read existing code first. Make minimal changes."
```

**Build → Validate:**
```
Step 1 — @coder: "Implement [feature]."
Step 2 — @coder: "Review the implementation from step 1 for: correctness, edge cases, security. Red-team your own code."
```

---

## VALIDATION PATTERN
*One agent builds, another independently validates.*

**Best for:** Code review, fact-checking, plan stress-testing.

```
@coder: "Implement [feature]."

--- wait for implementation ---

@coder [separate instance]: "You are a code reviewer, not the author. Review [implementation] for:
  - Correctness (does it do what it claims?)
  - Edge cases (what inputs would break it?)
  - Security (what could an attacker do?)
  - Performance (any obvious bottlenecks?)
  Be skeptical. The author thought it was correct."
```

---

## CUSTOM PERSONA AGENT
*Create a one-off custom expert persona for a specific task.*

**Invoke:** `agents create: [persona description] — ask: [question]`

**Format:**
```
@thinker [as "[detailed persona — expertise, background, worldview, biases]"]:
"[Question or task from this persona's perspective]"
```

**Example:**
```
@thinker [as "a former NSA analyst who now works in private sector threat intelligence, 
  deeply skeptical of corporate security claims, focused on nation-state TTPs"]:
"Review this incident response report and tell me what's being downplayed."
```

---

## WHEN TO USE EACH AGENT

| Task Type | Best Agent(s) |
|-----------|---------------|
| Current events, facts, news | @researcher |
| Technical documentation lookup | @researcher |
| Strategic decisions | @thinker (council mode) |
| Challenging your own plan | @thinker (red team) |
| Writing or fixing code | @coder |
| Code review | @coder (validation pattern) |
| Complex research + analysis | @researcher → @thinker pipeline |
| Feature implementation with review | @coder → @coder (validate) |
| Multi-angle decision | @thinker council |
