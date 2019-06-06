"plugins (vim plug)
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'tomasiser/vim-code-dark'
Plug 'Valloric/MatchTagAlways'
Plug 'Valloric/YouCompleteMe'
call plug#end()

"ale plugin
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_javascript_eslint_executable='npx eslint'

"ctrlp plugin
"ignore folder(s) configuration for ctrlp plugin
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules',
  \ }

let g:mta_filetypes = {
\ 'javascript.jsx': 1,
\ 'html' : 1,
\ 'xhtml' : 1,
\ 'xml' : 1,
\ 'jinja' : 1,
\ }

set encoding=utf-8

"leader key is space
let mapleader=" "

"source out vimrc
map <leader>s :source ~/_vimrc<CR>

"nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

"no highlighting
map <leader>n :noh<CR>

"numbers
set relativenumber
set number

syntax enable
set nowrap

colorscheme base16-default-dark
"colorscheme codedark

"search
set ignorecase
set smartcase
set hlsearch
set incsearch

"no swap file
set noswapfile
set nobackup
set nowritebackup

"moving line(s) up or down 
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"font for gvim
set guifont=Consolas:h12

"gvim gui setting
set guioptions-=T
set guioptions-=r
set guioptions-=m

"copy paste in windows style
nnoremap <C-V> "+gP
vnoremap <C-V> "+gP
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

"tabs
set tabstop=2
set shiftwidth=2
set expandtab

"change between splits
map <S-h> <C-W>h
map <S-l> <C-W>l
map <S-j> <C-W>j
map <S-k> <C-W>k

"new blank splits
set splitbelow
set splitright

"backspace in insert mode
set backspace=2

"disable bells
set belloff=all

"start gvim fullscreen
au GUIEnter * simalt ~x
