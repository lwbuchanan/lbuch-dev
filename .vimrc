set nocompatible
set noswapfile
set undofile 
set autoread
set hidden
set mouse=a
set switchbuf=usetab
set spelloptions=camel
set virtualedit=block
set belloff=all
set clipboard=unnamed,unnamedplus
set history=1000
set nolangremap

" Nicer UI
set number
set cursorline
set cursorlineopt=both
set signcolumn=yes
set splitbelow
set splitright
set splitkeep=screen
set wrap
set linebreak
set breakindent
set hlsearch
set scrolloff=5
set laststatus=2
set showmode
set showcmd
set guioptions-=m
set guioptions-=T
set guifont=JetBrains\ Mono\ 14

" Colors
set background=dark
colorscheme habamax
syntax on

" Text formatting
set autoindent
set cindent
set smarttab
set tabstop=2
set expandtab
set shiftwidth=2

" Search
set ignorecase
set smartcase
set incsearch

let mapleader=" "
let maplocalleader=","

nnoremap <Leader>e <Cmd>Explore<CR>

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Plugins
filetype plugin indent on

runtime! macros/matchit.vim
runtime ftplugin/man.vim

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-sensible'
call plug#end()
