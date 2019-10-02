" plugins
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'tpope/vim-vinegar'
Plug 'vimwiki/vimwiki'
call plug#end()

" plugins configuration
"
" prevent nerdtree from hijacking vinegear
let NERDTreeHijackNetrw = 0

" ale eslinter
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \}

let g:ale_javascript_eslint_executable='npx eslint'

" ignore folder(s) configuration for ctrlp plugin
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules',
  \ }

" ignore gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" various vim settings
syntax enable
set encoding=utf-8
set relativenumber
set number
set nowrap
set ignorecase
set smartcase
set showmatch
set hlsearch
set incsearch
set noswapfile
set nobackup
set nowritebackup
set ruler
set tabstop=2
set shiftwidth=2
set expandtab
set splitbelow
set splitright
set backspace=2
set belloff=all

" vim wiki required settings
set nocompatible
filetype plugin on
syntax on

" set syntax highlighting for .cshtml files
autocmd BufNewFile,BufRead *.cshtml set syntax=html

" source vimrc on save
autocmd BufWritePost _vimrc source %

" space is leader key
let mapleader="\<Space>"

nnoremap <leader>v :e ~/_vimrc<CR>
nnoremap <leader>n :noh<CR>
nnoremap <leader>t :NERDTreeToggle<CR>

" moving line(s) up or down 
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" change between splits
map <S-h> <C-W>h
map <S-l> <C-W>l
map <leader>j <C-W>j
map <leader>k <C-W>k

" copy paste in windows style
nnoremap <C-V> "+gP
vnoremap <C-V> "+gP
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" todo: if it has gui running..., put colors and gvim options there...
" colors
colorscheme base16-default-dark

" gvim options
set guifont=Consolas:h16
set guioptions-=T
set guioptions-=r
set guioptions-=m
au GUIEnter * simalt ~x


" automatic closing the brackets
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
