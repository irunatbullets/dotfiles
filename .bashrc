# Source system-wide bashrc if it exists
[[ -f /etc/bashrc ]] && source /etc/bashrc

# Basic PATH additions
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Editor defaults
export EDITOR=vim
export VISUAL=vim

# Source additional user scripts
if [[ -d "$HOME/.bashrc.d" ]]; then
    for rc in "$HOME/.bashrc.d"/*; do
        [[ -f "$rc" ]] && source "$rc"
    done
fi

