# PAI on OpenCode (OPAI) v1.0.0 — Model-Agnostic Personal AI Infrastructure

> **Note:** This is a v1.0.0 release — an early but functional scaffold. Expect iterative improvements.

**[PAI](https://github.com/danielmiessler/Personal_AI_Infrastructure)** (Personal AI Infrastructure) is a methodology and toolkit for building your own AI assistant. The primary PAI releases run on [Claude Code](https://docs.anthropic.com/en/docs/claude-code). This release targets **[opencode](https://opencode.ai)** — an open-source, multi-provider terminal AI agent — giving you PAI's core methodology on any model, including your **ChatGPT Plus/Pro subscription**.

The `opai` command launches opencode with your PAI configuration isolated from other opencode projects.

## Why OPAI (PAI on OpenCode)?

| Feature | Claude Code (PAI Default) | OPAI (This Scaffold) |
|---------|--------------------------|----------------------|
| Model lock-in | Anthropic only | Any provider |
| ChatGPT subscription | No | **Yes — `opencode auth login`** |
| Local models | No | Yes (Ollama, LM Studio, etc.) |
| Cost | Subscription required | Free tool + your chosen provider |
| PAI methodology | Full (63+ skills, 21 hooks) | Core (9 skills, config-driven) |
| Open source | Yes | Yes |

## What's Included

```
Releases/OpenCode/
├── README.md
├── INSTALL.md
├── install.sh                  # One-command setup
├── config/
│   ├── opencode.json           # opencode runtime config
│   └── AGENTS.md               # PAI identity + Algorithm + your personal context
├── skills/                     # 9 PAI skill categories
│   ├── research.md             # Multi-mode research methodology
│   ├── thinking.md             # First principles, red team, council
│   ├── agents.md               # Compose and coordinate AI agents
│   ├── investigation.md        # OSINT and structured investigation
│   ├── security.md             # Security assessment and code review
│   ├── telos.md                # Life OS — goals, projects, wisdom
│   ├── content-analysis.md     # Extract insights from any content
│   ├── media.md                # Diagrams, visuals, image prompts
│   └── scraping.md             # Web scraping and data extraction
└── memory/
    ├── learning/               # Session logs and improvement signals
    ├── state/                  # Current work state
    └── work/                   # PRD files for Algorithm sessions
```

## The opai Command

```bash
opai              # Launch PAI on opencode
opai --help       # opencode help
```

`opai` sets `XDG_CONFIG_HOME=~/.config/opai` and launches opencode. This redirects opencode's global config to `~/.config/opai/opencode/`, keeping your PAI setup fully isolated from any other opencode projects.

## Quick Start

```bash
# 1. Install opencode
npm install -g opencode-ai

# 2. Run the PAI installer
bash install.sh

# 3. Customize your identity
edit ~/.config/opai/opencode/AGENTS.md   # Replace {{YOUR_NAME}} and {{YOUR_AI_NAME}}

# 4. Connect a model
opencode auth login              # ChatGPT Plus/Pro subscription
# OR set an API key:
# export OPENAI_API_KEY=sk-...
# export ANTHROPIC_API_KEY=sk-ant-...

# 5. Launch
opai
```

See **[INSTALL.md](INSTALL.md)** for the full guide including subscription setup.

## The PAI Algorithm

The core of PAI is the **7-phase Algorithm** — a structured methodology for complex work that works with any model:

1. **OBSERVE** — Reverse-engineer the request. Generate testable success criteria (ISC).
2. **THINK** — Identify risks, run a premortem, check prerequisites.
3. **PLAN** — Design the approach.
4. **BUILD** — Prepare artifacts, invoke capabilities.
5. **EXECUTE** — Do the work. Mark criteria as they pass.
6. **VERIFY** — Test every criterion with evidence.
7. **LEARN** — Reflect on what worked and what didn't.

> *"Scaffolding is more important than the model."* — Daniel Miessler

This methodology is the scaffold. It makes a $20/mo ChatGPT subscription surprisingly powerful.

## Architecture

```
┌──────────────────────────────────────────┐
│  opai command                            │
│  XDG_CONFIG_HOME=$HOME/.config/opai      │
│  exec opencode                           │
├──────────────────────────────────────────┤
│  opencode agent runtime                  │
│  (multi-provider, subscription-auth)     │
├──────────────────────────────────────────┤
│  ~/.config/opai/opencode/AGENTS.md       │
│  (PAI identity + Algorithm + your rules) │
│  auto-loaded as global instructions      │
├───────────────────┬──────────────────────┤
│  Skills (9)       │  Memory              │
│  ~/.config/opai/  │  learning/           │
│  opencode/skills/ │  state/ / work/      │
├───────────────────┴──────────────────────┤
│  Your Model Provider                     │
│  ChatGPT Plus/Pro  │  OpenAI API         │
│  Anthropic API     │  Ollama (local)     │
│  OpenRouter        │  Any compatible     │
└──────────────────────────────────────────┘
```

## Relationship to Other PAI Releases

This scaffold derives from and is compatible with the PAI methodology across all releases:

- **[PAI v4.0.3](../v4.0.3/)** — Full PAI on Claude Code. 63+ skills, 21 hooks, 338 workflows.
- **[Pi](../Pi/)** — PAI on Pi (`@mariozechner/pi-coding-agent`). 9 skills, local-model focused.
- **OPAI (this)** — PAI on opencode. 9 skills, ChatGPT subscription support.

The Algorithm, memory structure, and skill format are compatible across all releases. Your `memory/` directory transfers between them.

**To upgrade to full PAI:** Install [PAI v4.0.3](../v4.0.3/) on Claude Code. Your memory and workflow patterns transfer directly.

## Contributing

Issues and PRs welcome. This is part of the [PAI open-source project](https://github.com/danielmiessler/Personal_AI_Infrastructure).

## License

Same as the PAI project — see [LICENSE](../../LICENSE).
