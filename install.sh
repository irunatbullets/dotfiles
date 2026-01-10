#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ensure ~/.config exists
mkdir -p "$HOME/.config"

# Symlink Starship config
ln -sf "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"
echo "✓ Starship config installed"

# Backup existing .bashrc if it's a regular file (not a symlink)
if [[ -f "$HOME/.bashrc" && ! -L "$HOME/.bashrc" ]]; then
    echo "Backing up existing ~/.bashrc to ~/.bashrc.backup"
    mv "$HOME/.bashrc" "$HOME/.bashrc.backup"
fi

# Symlink main .bashrc from dotfiles
ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
echo "✓ .bashrc installed"

# Ensure ~/.bashrc.d exists
mkdir -p "$HOME/.bashrc.d"

# Symlink all scripts in dotfiles/.bashrc.d to ~/.bashrc.d
if [[ -d "$DOTFILES_DIR/.bashrc.d" ]]; then
    for script in "$DOTFILES_DIR/.bashrc.d"/*; do
        [[ -f "$script" ]] || continue
        ln -sf "$script" "$HOME/.bashrc.d/$(basename "$script")"
        echo "✓ $(basename "$script") installed in ~/.bashrc.d"
    done
fi

