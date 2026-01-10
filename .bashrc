[[ -f /etc/bashrc ]] && source /etc/bashrc

PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Linuxbrew (Homebrew) integration
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

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

# Container prompt (icon + color)

RED=$'\e[1;31m'
YELLOW=$'\e[1;33m'
RESET=$'\e[0m'

if [[ -n "$CONTAINER_ID" ]]; then
    case "$CONTAINER_ID" in
        debian)
            export CONTAINER_PROMPT="${RED} debian${RESET}"
            ;;
        *)
            export CONTAINER_PROMPT="${YELLOW}📦 ${CONTAINER_ID}${RESET}"
            ;;
    esac
fi

# Initialize Starship prompt
eval "$(starship init bash)"

