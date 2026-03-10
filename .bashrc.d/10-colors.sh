# ~/.bashrc.d/10-colors.sh
# -------------------------
# Enable terminal colors and basic aliases

# Enable color support for ls and grep
if command -v dircolors >/dev/null 2>&1; then
    if [ -r ~/.dircolors ]; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi
fi

# Aliases for colored output
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Colored prompt: green username@host, blue current directory
if [[ -n "$PS1" ]]; then
    PS1='\[\e[1;32m\]\u@\h:\[\e[1;34m\]\w\[\e[0m\]\$ '
fi
