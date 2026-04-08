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
| PAI methodology | Full (63+ skills, 21 hooks) | Deep (9 skills × multi-workflow + 3 subagents) |
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
├── agents/                     # 3 specialist subagents (opencode agent format)
│   ├── researcher.md           # Web research + source synthesis
│   ├── thinker.md              # First principles, red team, premortem
│   └── coder.md                # Implementation, debugging, code review
├── skills/                     # 9 PAI skills (opencode skill format)
│   ├── research/SKILL.md       # Multi-mode research methodology
│   ├── thinking/SKILL.md       # Analytical thinking modes
│   ├── agents/SKILL.md         # Agent composition and coordination
│   ├── investigation/SKILL.md  # OSINT and structured investigation
│   ├── security/SKILL.md       # Security assessment and code review
│   ├── telos/SKILL.md          # Life OS — goals, projects, wisdom
│   ├── content-analysis/SKILL.md # Extract insights from any content
│   ├── media/SKILL.md          # Diagrams, visuals, image prompts
│   └── scraping/SKILL.md       # Web scraping and data extraction
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
├──────────────┬────────────┬─────────────┤
│  Skills (9)  │ Agents (3) │  Memory     │
│  invoked via │ @researcher│ learning/   │
│  skill() tool│ @thinker   │ state/work/ │
│              │ @coder     │             │
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

## Updating OPAI

When a new version of OPAI is released, update your local installation without losing your customizations.

### What's preserved vs. overwritten

| File/Directory | On Update |
|----------------|-----------|
| `AGENTS.md` | **Preserved** — your identity customizations stay |
| `opencode.json` | **Overwritten** — re-apply any custom settings after |
| `skills/*/SKILL.md` | **Overwritten** — gets new workflow improvements |
| `agents/*.md` | **Overwritten** — gets new agent definitions |
| `memory/` | **Never touched** — your session logs and state are safe |

### Update procedure

```bash
# 1. Pull the latest version of the PAI repository
cd /path/to/Personal_AI_Infrastructure
git pull

# 2. Re-run the installer — it overwrites skills/agents/config, preserves memory
cd Releases/OpenCode
bash install.sh

# 3. Check if your AGENTS.md customizations survived
# (install.sh skips AGENTS.md if it already exists — your identity is safe)
cat ~/.config/opai/opencode/AGENTS.md | grep -A2 "Your Name\|YOUR_NAME"

# 4. Re-apply any opencode.json settings if you had customized it
# (the default config is minimal — most users won't need to do anything here)
```

### Manual skill update only

If you only want to update skills without reinstalling everything:

```bash
# Update skills from a cloned PAI repo
cp -r Releases/OpenCode/skills/*/ ~/.config/opai/opencode/skills/

# Update agents
cp Releases/OpenCode/agents/*.md ~/.config/opai/opencode/agents/
```

### Check your installed version

```bash
# View version of any installed skill
head -10 ~/.config/opai/opencode/skills/research/SKILL.md
```

---

## Contributing

Issues and PRs welcome. This is part of the [PAI open-source project](https://github.com/danielmiessler/Personal_AI_Infrastructure).

## License

Same as the PAI project — see [LICENSE](../../LICENSE).
