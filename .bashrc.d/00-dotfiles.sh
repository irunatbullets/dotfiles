# ~/.bashrc.d/00-dotfiles.sh

# Setup bare git repo alias for dotfiles
export DOTFILES_DIR="$HOME/.dotfiles"
alias dot="git --git-dir=$DOTFILES_DIR --work-tree=$HOME"

# Make git ignore untracked files for bare dotfiles repo
dot config --local status.showUntrackedFiles no 2>/dev/null || true
