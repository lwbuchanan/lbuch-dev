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

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>

nnoremap ]c :cnext<CR>
nnoremap [c :cprev<CR>


" TODO: 
" Add clipboard support
" Add some plugins:
" - https://github.com/mg979/vim-visual-multi
" - https://github.com/junegunn/fzf.vim
