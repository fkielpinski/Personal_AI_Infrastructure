# Installing OPAI — Step by Step

Full guide from zero to a working PAI system on opencode. Total time: ~10 minutes.

## Prerequisites

- **Node.js 18+** — [nodejs.org](https://nodejs.org/) or via your package manager
- **A model provider** — at least one of:
  - ChatGPT Plus or Pro subscription ($20–200/mo) — the easiest path
  - API key from OpenAI, Anthropic, or OpenRouter
  - Ollama for fully local, free models

## Step 1: Install opencode

```bash
npm install -g opencode-ai
```

Verify:

```bash
opencode --version
```

## Step 2: Run the OPAI Installer

From the `Releases/OpenCode/` directory:

```bash
bash install.sh
```

This creates `~/.config/opai/` with all config files, skills, and memory directories, then installs the `opai` command at `~/.local/bin/opai`.

If `~/.local/bin` isn't in your PATH, add this to `~/.zshrc` or `~/.bashrc`:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Then reload:

```bash
source ~/.zshrc   # or source ~/.bashrc
```

## Step 3: Connect a Model Provider

### Option A: ChatGPT Plus/Pro Subscription (Recommended)

This uses your existing ChatGPT subscription — no separate API key needed:

```bash
opencode auth login
```

Select **OpenAI**, then **ChatGPT Plus/Pro (Codex Subscription)**. Your browser will open for ChatGPT login. After authentication, opencode uses your subscription quota.

> **Note:** This requires a ChatGPT Plus ($20/mo) or Pro ($200/mo) subscription.
> ChatGPT Free tier does not include Codex access.

### Option B: OpenAI API Key

```bash
export OPENAI_API_KEY="sk-..."
```

Add to your shell profile to make it permanent. Pay-per-token billing from platform.openai.com.

### Option C: Anthropic API Key

```bash
export ANTHROPIC_API_KEY="sk-ant-..."
```

Same PAI methodology, Anthropic models. Good if you already have Anthropic credits.

### Option D: OpenRouter (Access Many Models)

```bash
export OPENROUTER_API_KEY="sk-or-..."
```

One key, access to GPT-5.3-codex, Claude, Gemini, Llama, and hundreds more. Switch models without changing config.

### Option E: Ollama (Local, Free)

```bash
# Install Ollama
curl -fsSL https://ollama.ai/install.sh | sh

# Pull a model
ollama pull llama3.1:8b      # Fast, good for simple tasks
ollama pull qwen2.5:32b      # Strong balance of speed and quality
```

Ollama runs at `http://localhost:11434` automatically. opencode detects it.

## Step 4: Customize Your Identity

Edit `~/.config/opai/SYSTEM.md` and replace:

- `{{YOUR_NAME}}` → Your name (e.g., "Alex")
- `{{YOUR_AI_NAME}}` → What to call your AI (e.g., "Nova", "Atlas")

Also update:
- The **Projects** table with your actual projects
- The **Environment** section with your setup
- Add any additional **Behavioral Rules** you want enforced

Edit `~/.config/opai/AGENTS.md` with your professional context, areas of expertise, and preferences.

## Step 5: Launch

```bash
opai
```

## Step 6: Test the Algorithm

Try a complex task:

```
Build me a Python script that monitors a directory for changes and logs them to a file
```

Your AI should enter **Algorithm mode**, generate ISC criteria, and work through all 7 phases.

## Step 7: Optional — Voice Notifications

For TTS voice announcements during Algorithm phase transitions:

1. Set up a TTS server (ElevenLabs, Coqui, or any HTTP-based TTS)
2. Set environment variables before launching opai:

```bash
export PAI_VOICE_ENABLED=true
export PAI_VOICE_ENDPOINT=http://localhost:8888/notify
export PAI_VOICE_ID=your-voice-id
opai
```

Or add to your shell profile to make permanent.

## Adding Skills

Create a new `.md` file in `~/.config/opai/skills/`:

```markdown
---
name: my-skill
description: What this skill does. USE WHEN trigger words here.
metadata:
  author: you
  version: 1.0.0
---

# My Skill

Instructions for the AI when this skill is invoked.
```

The skill is available immediately on next `opai` launch.

## Updating PAI

To pull the latest OPAI release:

```bash
# From your fork or the upstream repo
git pull
cd Releases/OpenCode
bash install.sh   # Re-runs installer, updates config files
```

Your `SYSTEM.md` and `AGENTS.md` personalizations are preserved — the installer only overwrites `opencode.json` and skill files.

## Troubleshooting

### `opai: command not found`

```bash
echo $PATH | grep -o "$HOME/.local/bin"
```

If empty, add `export PATH="$HOME/.local/bin:$PATH"` to your shell profile and reload.

### opencode can't find skills

Skills should be at `~/.config/opai/skills/*.md`. Check:

```bash
ls ~/.config/opai/skills/
```

### ChatGPT subscription auth fails

Make sure you have an active ChatGPT Plus or Pro subscription at chat.openai.com. Free tier doesn't include Codex access. Re-run `opencode auth login` if the token expired.

### Switching between opencode projects

`opai` always uses `~/.config/opai/`. Regular `opencode` uses `~/.config/opencode/`. They're fully isolated — use whichever is appropriate for the task.
