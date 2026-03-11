# Setup bare git repo for dotfiles
export DOTFILES_DIR="$HOME/.dotfiles"

dot() {
    # If the first arg is add and second is ., warn
    if [ "$1" = "add" ] && [ "$2" = "." ]; then
        echo -e "\nERROR: Use 'dot add -u' instead!\n"
        return 1
    fi

    # fallback to running git with the bare repo
    git --git-dir="$DOTFILES_DIR" --work-tree="$HOME" "$@"
}

# Make git ignore untracked files for bare dotfiles repo
dot config --local status.showUntrackedFiles no 2>/dev/null || true

