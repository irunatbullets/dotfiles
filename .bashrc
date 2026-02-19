[[ -f /etc/bashrc ]] && source /etc/bashrc

PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Only load Linuxbrew and Starship if NOT in Alpine
if [[ -z "$DISTROBOX_NAME" ]] || [[ "$(cat /etc/os-release 2>/dev/null | grep -i '^ID=')" != "ID=alpine" ]]; then
    # Linuxbrew (Homebrew) integration
    if [[ -x "$HOME/.linuxbrew/bin/brew" ]]; then
        export PATH="$HOME/.linuxbrew/bin:$PATH"
        eval "$($HOME/.linuxbrew/bin/brew shellenv)"
    fi

    # Initialize Starship prompt (only if installed)
    if command -v starship >/dev/null 2>&1; then
        eval "$(starship init bash)"
    fi
fi

# Editor
export EDITOR=vim
export VISUAL=vim

# Enable colors for default bash in distroboxes
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# Distrobox tweaks
if [[ -n "$DISTROBOX_NAME" ]]; then
    alias open='distrobox-host-exec xdg-open'
fi

# Source additional user scripts
if [[ -d "$HOME/.bashrc.d" ]]; then
    for rc in "$HOME/.bashrc.d"/*; do
        [[ -f "$rc" ]] && source "$rc"
    done
fi

