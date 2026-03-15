" ============================================================================
" Main vimrc file
" https://github.com/andersix/dotfiles/blob/main/.vimrc
" ============================================================================

" Create necessary directories if they don't exist
if !isdirectory(expand("~/.vim/plugin_configs"))
  call mkdir(expand("~/.vim/plugin_configs"), "p")
endif

if !isdirectory(expand("~/.vim/modules"))
  call mkdir(expand("~/.vim/modules"), "p")
endif

" Load plugins
if filereadable(expand("~/.vim/plugins.vim"))
  source $HOME/.vim/plugins.vim
endif

" ============================================================================
" Basic Settings
" ============================================================================
set nocompatible              " Use Vim settings, rather than Vi settings
set encoding=utf-8            " Set default encoding
set fileformats=unix,dos,mac  " Use Unix as the standard file type

" Indentation and tabs
set autoindent                " Copy indent from current line when starting a new line
set expandtab                 " Use spaces instead of tabs
set smarttab                  " Be smart when using tabs
set smartindent               " Whatever this is ...
set shiftwidth=4              " Number of spaces to use for each step of (auto)indent
set softtabstop=4             " Number of spaces that a <Tab> counts for while editing
set tabstop=4                 " Number of spaces that a <Tab> in the file counts for

" UI Configuration
set cursorline                " Highlight the current line
set laststatus=2              " Always show the status line
set cmdheight=1               " Command bar height
" set showcmd                   " Show incomplete commands
set showmatch                 " Show matching brackets
set number                    " Show line numbers
set ruler                     " Show current position
set relativenumber            " Show relative line numbers
set wildmenu                  " Enhanced command line completion
set wildmode=list:longest     " Complete files like a shell
set scrolloff=7               " Minimum number of lines to keep above/below cursor
set noshowmode                " Don't show mode (using lightline instead)
set title                     " Set terminal title
set hidden                    " Allow buffer switching without saving
set virtualedit=block         " Allow cursor to move where there is no text in visual block mode

" ============================================================================
" Search Settings {{{
" ============================================================================
set hlsearch                  " Highlight search results
set incsearch                 " Incremental search
set ignorecase                " Case-insensitive search
set smartcase                 " Override ignorecase when search pattern has uppercase
" Clear search highlighting with Enter
nnoremap <CR> :nohlsearch<CR>/<BS><CR>

" ============================================================================
" Syntax and Colors
" ============================================================================
syntax on                     " Enable syntax highlighting
set background=dark           " Use dark background

if &term ==# 'linux'
  colorscheme default
else
  set termguicolors
  colorscheme tokyonight
  highlight Comment ctermfg=DarkGrey guifg=#565f89
  highlight LineNr guifg=#565f89
endif

" Enable italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic gui=italic

" Highlight redundant whitespaces and tabs
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

" Add an empty newline at the end of the file
autocmd BufWritePre * if getline('$') != '' | call append('$', '') | endif

