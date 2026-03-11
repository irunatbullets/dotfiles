" ============================================================================
" Plugins (vim-plug)
" ============================================================================
" Auto-install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob('~/.vim-plugged'))
  silent !mkdir ~/.vim-plugged
endif

call plug#begin('~/.vim-plugged')

Plug 'ghifarit53/tokyonight-vim'

call plug#end()
