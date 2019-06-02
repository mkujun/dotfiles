"plugins (vim plug)
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'tomasiser/vim-code-dark'
call plug#end()

"ale plugin
"runs eslint
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_javascript_eslint_executable='npx eslint'

"ctrlp plugin
"ignore folder(s) configuration for ctrlp plugin
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules',
  \ }
  
"leader key is space
let mapleader=" "

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
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

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
set tabstop=4
set shiftwidth=4
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
