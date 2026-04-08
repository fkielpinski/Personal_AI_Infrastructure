---
name: media
description: Visual and written content creation — diagrams, flowcharts, infographics, image prompts, and structured documents. USE WHEN diagram, flowchart, mermaid, visualization, infographic, create image, design, visual, chart, draw, illustrate.
metadata:
  author: pai
  version: 1.0.0
---

# Media Skill

Create visual and structured content.

## Diagram Types

### Mermaid Diagrams
Generate valid Mermaid syntax for:
- Flowcharts (`flowchart TD`)
- Sequence diagrams (`sequenceDiagram`)
- Entity-relationship diagrams (`erDiagram`)
- Gantt charts (`gantt`)
- State diagrams (`stateDiagram-v2`)
- Mindmaps (`mindmap`)

Always wrap in a code block with `mermaid` language tag.

### Architecture Diagrams
Describe system architecture as:
1. Component boxes with clear labels
2. Directed arrows with labeled relationships
3. Boundary boxes for grouping
4. Rendered as Mermaid or ASCII art depending on complexity

### ASCII Art Diagrams
For terminal-friendly diagrams using box-drawing characters:
```
┌─────────┐     ┌─────────┐
│ Service │────▶│   DB    │
└─────────┘     └─────────┘
```

## Image Prompts

When generating image generation prompts (for DALL-E, Midjourney, Flux, etc.):
1. State the subject clearly
2. Specify style, lighting, and composition
3. Add negative prompts where helpful
4. Format for the target model's syntax

## Invocation Examples

- `media mermaid: draw a flowchart of the authentication process`
- `media diagram: show the architecture of my microservices`
- `media image-prompt: create a header image for a blog post about AI agents`
