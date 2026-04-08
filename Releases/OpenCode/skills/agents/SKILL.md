---
name: agents
description: Compose and coordinate custom AI agents for specialized perspectives and parallel work. USE WHEN create agent, spin up agent, specialized agent, agent personality, available agents, compose agent, debate, council, multi-agent, parallel agents, delegate to agent.
metadata:
  author: pai
  version: 1.0.0
---

# Agents Skill

## Concept

Create custom AI agents with specific personas, expertise domains, and voices. Use them for:
- Specialized analysis from a domain expert perspective
- Council debates between multiple viewpoints
- Parallel investigation of independent sub-problems

## Agent Composition

An agent has three components:
1. **Persona** — who they are (e.g., "senior security researcher", "skeptical CFO")
2. **Domain** — their expertise area
3. **Stance** — their default orientation (curious, adversarial, conservative, etc.)

## Patterns

### Single Expert Agent
```
Create an agent who is a [persona] and ask them: [question]
```

### Council Debate
```
Convene a council of [N] agents: [Agent A], [Agent B], [Agent C]
Topic: [topic]
Have them debate until consensus or clear disagreement is mapped.
```

### Parallel Investigation
```
Spawn [N] agents to investigate [topic] from different angles simultaneously:
- Agent 1: [angle 1]
- Agent 2: [angle 2]
- Agent N: [angle N]
Synthesize results.
```

## Output Format

Each agent response should be prefixed with their persona name.
Final synthesis clearly identifies where agents agreed and disagreed.
