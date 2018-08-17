" Set all options to their default value.
set all&

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale', { 'as': 'vim-ale' }
Plug 'itchyny/lightline.vim', { 'as': 'vim-lightline' }
Plug 'junegunn/fzf', { 'as': 'vim-fzf' }
Plug 'junegunn/fzf.vim', { 'as': 'vim-fzf.vim' }
Plug 'morhetz/gruvbox', { 'as': 'vim-gruvbox' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
call plug#end()

try
    colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

" To define a mapping which uses the "g:mapleader" variable, the special
" string "<Leader>" can be used. It is replaced with the string value of
" "g:mapleader". If "g:mapleader" is not set or empty, a backslash is used
" instead.
let mapleader = ','

" Remap commands to move between windows.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remap commands to resize windows.
nnoremap <Leader>h <C-w><
nnoremap <Leader>j <C-w>-
nnoremap <Leader>k <C-w>+
nnoremap <Leader>l <C-w>>

" Map a command to remove trailing whitespace.
nnoremap <Leader>s :%s/\s\+$//e<CR>

set background=dark
set backspace=eol,indent,start
set belloff=all
set complete-=i
set cursorline
set display+=lastline
set encoding=utf-8
set expandtab
set formatoptions+=j
set guioptions-=T
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=eol:<,tab:>-,trail:-
set nomodeline
set noshowmode
set nrformats-=octal
set number
set ruler
set scrolloff=4
set shiftround
set shiftwidth=4
set showmatch
set smartcase
set smarttab
set softtabstop=4
set tabstop=4
set textwidth=78
set updatetime=100
set wildmenu
