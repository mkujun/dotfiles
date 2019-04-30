"plugins
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'chriskempson/base16-vim'

Plug 'scrooloose/nerdtree'
call plug#end()

"ctrlp plugin
"ignore folder(s) configuration for ctrlp plugin
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules',
  \ }
  
"leader key is space
let mapleader=" "

"nerdtree plugin
"nerdtree toggle
map <leader>n :NERDTreeToggle<CR>

set relativenumber
syntax enable
set nowrap

colorscheme base16-default-dark

"search
set ignorecase
set hlsearch
set incsearch

"no swap file
set noswapfile
set nobackup
set nowritebackup

"moving line(s) up or down 
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

"font for gvim
set guifont=Consolas:h12

"gvim gui setting
set guioptions-=T
set guioptions-=r

"paste in windows style
nnoremap <C-V> "+gP
vnoremap <C-V> "+gP

"tabs
set tabstop=4
set shiftwidth=4
set expandtab

"change between vertical splits
map <S-h> <C-W>h
map <S-l> <C-W>l

"backspace in insert mode
set backspace=2

"disable bells
set belloff=all
