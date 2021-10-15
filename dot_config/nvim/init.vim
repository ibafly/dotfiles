set nocompatible
filetype indent off
set shell=bash

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" change vim colorscheme using base16-vim
Plug 'chriskempson/base16-vim'

Plug 'airblade/vim-gitgutter'
" Plug 'editorconfig/editorconfig.vim'
Plug 'ctrlpvim/ctrlp.vim'

" add liquid syntax highlighting
Plug 'tpope/vim-liquid'

" static analysis for shell script
Plug 'neomake/neomake'

" git intergration
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

source ~/.config/nvim/colorscheme.vim
set encoding=utf-8

set softtabstop=4 " softtabstop
set tabstop=4 " tabstop
set shiftwidth=4
set noexpandtab " expandtab
set smarttab
set autoindent
set cindent
set magic " unbreak vim regex implementation

set number
set cc=80
set nowrap

set ignorecase
set smartcase

" search as you type, highlight results
set incsearch
set showmatch
set hlsearch

" resize windows and move tabs, so with the mouse
set mouse=a

" not litter swp files everywhere
set  backupdir=~/.cache
set directory=~/.cache

set tags=./tags;

syntax on

set list
set wrap
set linebreak
set breakindent " ?
" eol:¬
set listchars=tab:▸\ ,trail:·
let &showbreak='↳ '

highlight ExtraWhitespace ctermbg=blue guibg=red
match ExtraWhitespace /\s\+$/

set hidden
set notimeout

set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)
set title

set clipboard+=unnamedplus

" Opens file in new tab when using ctrlp
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Set scripts to be executable from the shell
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod a+x <afile>" | endif | endif
