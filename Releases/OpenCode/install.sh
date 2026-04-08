#!/usr/bin/env bash
# OPAI — Open Personal AI Infrastructure
# Install script for the OpenCode release
# Usage: bash install.sh

set -e

# opencode reads global config from $XDG_CONFIG_HOME/opencode/
# opai sets XDG_CONFIG_HOME=~/.config/opai, so our config lives at:
OPAI_CONFIG="$HOME/.config/opai/opencode"
OPAI_BIN="$HOME/.local/bin/opai"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "═══════════════════════════════════════════"
echo "  OPAI — Installing PAI on OpenCode"
echo "═══════════════════════════════════════════"
echo ""

# ── 1. Check opencode is installed ──────────────────────────
if ! command -v opencode &>/dev/null; then
  echo "✗ opencode not found. Install it first:"
  echo ""
  echo "  npm install -g opencode-ai"
  echo "  # or: bun install -g opencode-ai"
  echo ""
  exit 1
fi
echo "✓ opencode found: $(opencode --version 2>/dev/null || echo 'version unknown')"

# ── 2. Create config directory ──────────────────────────────
echo ""
echo "Creating config directory at $OPAI_CONFIG ..."
mkdir -p "$OPAI_CONFIG/memory/learning"
mkdir -p "$OPAI_CONFIG/memory/state"
mkdir -p "$OPAI_CONFIG/memory/work"
mkdir -p "$OPAI_CONFIG/skills"
echo "✓ Directories created"

# ── 3. Copy config files ─────────────────────────────────────
echo ""
echo "Copying PAI config files ..."
cp "$SCRIPT_DIR/config/opencode.json" "$OPAI_CONFIG/opencode.json"
cp "$SCRIPT_DIR/config/AGENTS.md"     "$OPAI_CONFIG/AGENTS.md"
echo "✓ Config files installed"

# ── 4. Copy skills ────────────────────────────────────────────
echo ""
echo "Copying PAI skills ..."
cp "$SCRIPT_DIR/skills/"*.md "$OPAI_CONFIG/skills/"
echo "✓ Skills installed ($(ls "$OPAI_CONFIG/skills/" | wc -l | tr -d ' ') skill files)"

# ── 5. Create opai command ────────────────────────────────────
# opai sets XDG_CONFIG_HOME so opencode reads its global config
# from ~/.config/opai/opencode/ instead of ~/.config/opencode/
echo ""
echo "Creating opai command at $OPAI_BIN ..."
mkdir -p "$HOME/.local/bin"
cat > "$OPAI_BIN" << 'OPAI_SCRIPT'
#!/usr/bin/env bash
# opai — Open Personal AI Infrastructure
# XDG_CONFIG_HOME redirects opencode to ~/.config/opai/opencode/
exec env XDG_CONFIG_HOME="$HOME/.config/opai" opencode "$@"
OPAI_SCRIPT
chmod +x "$OPAI_BIN"
echo "✓ opai command installed"

# ── 6. PATH check ─────────────────────────────────────────────
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  echo ""
  echo "⚠  ~/.local/bin is not in your PATH. Add this to your shell profile:"
  echo ""
  echo '   export PATH="$HOME/.local/bin:$PATH"'
  echo ""
  echo "   Then reload: source ~/.zshrc  (or ~/.bashrc)"
fi

# ── 7. Done ───────────────────────────────────────────────────
echo ""
echo "═══════════════════════════════════════════"
echo "  Installation complete!"
echo "═══════════════════════════════════════════"
echo ""
echo "Next steps:"
echo ""
echo "  1. Customize your identity:"
echo "     edit $OPAI_CONFIG/AGENTS.md"
echo "     Replace {{YOUR_NAME}} and {{YOUR_AI_NAME}}"
echo ""
echo "  2. Connect a model provider:"
echo "     opencode auth login          # ChatGPT Plus/Pro subscription"
echo "     # OR: export OPENAI_API_KEY=sk-..."
echo ""
echo "  3. Launch:"
echo "     opai"
echo ""
echo "  See INSTALL.md for the full setup guide."
echo ""
