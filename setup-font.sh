#!/usr/bin/env bash
set -euo pipefail

FONT_CASK="font-caskaydia-cove-nerd-font"
FONT_DISPLAY_NAME="Caskaydia Cove Nerd Font"

# Check brew
if ! command -v brew >/dev/null 2>&1; then
  echo "❌ Homebrew is not installed."
  echo "👉 Install it first: https://brew.sh"
  exit 1
fi

# Install font
echo "📦 Installing $FONT_CASK..."
brew install --cask "$FONT_CASK"

echo "✅ Font installed"

# Refresh font cache (safe no-op on some systems)
if command -v fc-cache >/dev/null 2>&1; then
  echo "🔄 Refreshing font cache..."
  fc-cache -f
fi

cat <<EOF

🧾 Manual font setup

Terminal (Ptyxis / GNOME Terminal):
Appearance → Font → "$FONT_DISPLAY_NAME"

VSCodium:
vscodium://settings/editor.fontFamily
'CaskaydiaCove Nerd Font', monospace

EOF

