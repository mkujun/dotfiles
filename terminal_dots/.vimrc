call plug#begin('~/.vim/plugged')
  Plug 'chriskempson/base16-vim'
	Plug 'vimwiki/vimwiki'
  Plug 'junegunn/fzf', { 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'preservim/nerdtree'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'
call plug#end()

set nocompatible
syntax on
syntax enable
set encoding=utf-8
set relativenumber
set number
set ignorecase
set smartcase
set showmatch
set hlsearch
set incsearch
set tabstop=2
set expandtab
set shiftwidth=2
set splitbelow
set splitright
set nobackup
set nowritebackup
set noswapfile
set backspace=2
set showbreak=>>>
set foldmethod=manual
set nofoldenable
filetype plugin on

hi CursorLine cterm=none ctermbg=237
set cursorline

"cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set ttimeoutlen=5

"color
set termguicolors
set t_Co=256
colorscheme base16-oceanicnext

"leader key
let mapleader="\<Space>"
nnoremap <leader>v :e ~/.vimrc<CR>
nnoremap <leader>n :noh<CR>

" fzf mappings
nnoremap <leader>b :Buffers<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <leader>f :Ag<CR>

" change between splits
map <S-h> <C-W>h
map <S-l> <C-W>l
map <S-j> <C-W>j
map <S-k> <C-W>k

" source vimrc on save
autocmd BufWritePost _vimrc source %

" moving line(s) up or down, replace it with alt key
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

map <leader>t :NERDTreeToggle<CR>
"let g:vimwiki_list = [{'path': '~/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]
"todo
"status line koji ima samo ime filea
