" plugins
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
Plug 'tpope/vim-vinegar'
call plug#end()

" plugins configuration
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

" matchTagAlways settings
let g:mta_filetypes = {
  \ 'javascript.jsx': 1,
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'jinja' : 1,
  \ }

" you complete me ignore enter
let g:ycm_key_list_stop_completion = [ '<C-y>', '<Enter>' ]

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

" mappings
map <C-n> :NERDTreeToggle<CR>

" leader key
let mapleader=" "
map <leader>s :source ~/_vimrc<CR>
map <leader>n :noh<CR>

" moving line(s) up or down 
nnoremap <S-d> :m .+1<CR>==
nnoremap <S-u> :m .-2<CR>==
vnoremap <S-d> :m '>+1<CR>gv=gv
vnoremap <S-u> :m '<-2<CR>gv=gv

" change between splits
map <S-h> <C-W>h
map <S-l> <C-W>l
map <S-j> <C-W>j
map <S-k> <C-W>k

" copy paste in windows style
nnoremap <C-V> "+gP
vnoremap <C-V> "+gP
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" colors
colorscheme base16-default-dark

" gvim options
set guifont=Consolas:h12
set guioptions-=T
set guioptions-=r
set guioptions-=m
au GUIEnter * simalt ~x

" automatic closing the brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
