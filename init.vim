call plug#begin("~/.vim/plugged")
  Plug 'preservim/nerdtree'
  Plug 'chriskempson/base16-vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'vimwiki/vimwiki'
  Plug 'junegunn/fzf', { 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'tpope/vim-vinegar'
call plug#end()

" color
set termguicolors
set t_Co=256
colorscheme base16-default-dark

" folding
" {} motion will jump over folds
set foldopen=block
set foldmethod=indent
set foldlevel=1

syntax on
syntax enable
set encoding=utf-8
set number
set relativenumber

" searching is not case sensitive
set ignorecase
" if pattern contains uppercase then is case sensitive
set smartcase
" move cursor to the matched string while typing
set incsearch
" highlight all search matches
set hlsearch
" show matching parenthesis
set showmatch

" convert tabs to spaces
set expandtab

" << >> movement
set shiftwidth=2
" tabs are two spaces
set tabstop=2

" splits position
set splitbelow
set splitright

"no swap file and backup
set nobackup
set nowritebackup
set noswapfile

set cursorline

" change between splits
map <S-h> <C-W>h
map <S-l> <C-W>l
map <S-j> <C-W>j
map <S-k> <C-W>k

" same line, no wrapping
set nowrap

" allowing opening new buffers without saving current one
set hidden

" leader key
let mapleader="\<Space>"
map <leader>t :NERDTreeToggle<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>p :Files<CR>
nnoremap <leader>f :Ag<CR>

" make backspace work like most other programs
set backspace=2
" clear highlighted text
nnoremap <leader>n : noh<CR>

"coc settings
set updatetime=300

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~#'\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

"highlight statusline
hi StatusLine guibg=darkred

"statusline
set statusline=
set statusline+=%f "path to file"
set statusline+=\  "blank space"
set statusline+=%m "modifier, indicates '+' sign if file changed "

" vertical split splitting line is thinner
hi VertSplit guibg=none

" window position stays the same after changing buffers
autocmd! BufWinLeave * let b:winview = winsaveview()
autocmd! BufWinEnter * if exists('b:winview') | call winrestview(b:winview) | unlet b:winview
