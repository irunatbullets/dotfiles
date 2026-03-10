# ~/.bashrc.d/00-dotfiles.sh

# Setup bare git repo alias for dotfiles
export DOTFILES_DIR="$HOME/.dotfiles"
alias dotfiles="git --git-dir=$DOTFILES_DIR --work-tree=$HOME"

# Make git ignore untracked files for bare dotfiles repo
dotfiles config --local status.showUntrackedFiles no 2>/dev/null || true
