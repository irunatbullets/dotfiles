#!/usr/bin/env bash
set -euo pipefail

FONT_CASK="font-caskaydia-cove-nerd-font"
FONT_DISPLAY_NAME="Caskaydia Cove Nerd Font"

# ---- Check brew ----
if ! command -v brew >/dev/null 2>&1; then
  echo "❌ Homebrew is not installed."
  echo "👉 Install it first: https://brew.sh"
  exit 1
fi

echo "✅ Homebrew found"

# ---- Install font ----
echo "📦 Installing $FONT_CASK..."
brew install --cask "$FONT_CASK"

echo "✅ Font installed"

# ---- Refresh font cache (safe no-op on some systems) ----
if command -v fc-cache >/dev/null 2>&1; then
  echo "🔄 Refreshing font cache..."
  fc-cache -f
fi

echo
echo "⚠️  Manual step required:"
echo "----------------------------------------"
echo "• Terminal (Ptyxis / GNOME Terminal):"
echo "  Preferences → Font → select:"
echo "  \"$FONT_DISPLAY_NAME\""
echo
echo "• VSCodium:"
echo "  Settings → Font Family"
echo "  Set to something like:"
echo "  'CaskaydiaCove Nerd Font, monospace'"
echo "----------------------------------------"
echo
echo "🎉 Done"

