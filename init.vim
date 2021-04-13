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
set foldmethod=indent
set foldlevel=1

" {} motion wont open fold even if it has empty lines in it
" also blank lines will be skipped altogether
nnoremap <expr> } foldclosed(search('^$', 'Wn')) == -1 ? "}" : "}j}"
nnoremap <expr> { foldclosed(search('^$', 'Wnb')) == -1 ? "{" : "{k{"

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
nnoremap <leader>p :GFiles<CR>
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

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function Highlight_Statusline()
  hi StatusLineNC guibg=bg
endfunction

autocmd BufEnter * call Highlight_Statusline()

" vertical split splitting line is the same color as background
"hi VertSplit guibg=bg

" window position stays the same after changing buffers
autocmd! BufWinLeave * let b:winview = winsaveview()
autocmd! BufWinEnter * if exists('b:winview') | call winrestview(b:winview) | unlet b:winview

" only show cursorline in active buffer
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline

set colorcolumn=80
let &colorcolumn=join(range(81, 999),",")     " 80+ columns are indicated differently

"highlight link EndOfBuffer ColorColumn

function! ActiveStatus()
  let statusline="" "begining of the statusline
  let statusline.="%1*" "set statusline group"
  let statusline.="\ "  "blank space"
  let statusline.="\ "  "blank space"
  let statusline.="\ "  "blank space"
  let statusline.="%2*" "set statusline group 2 for arrow symbol
  let statusline.=""
  let statusline.="%*" "reset statusline group"
  let statusline.="\ "  "blank space"
  let statusline.="%f"
  let statusline.="\ "  "blank space"
  let statusline.="%m" "modifier, indicates '+' sign if file changed "
  let statusline.="%y"
  let statusline.="%="
  return statusline
endfunction

function! InactiveStatus()
  let statusline="" "begining of the statusline
  let statusline.="\ "  "blank space"
  let statusline.="\ "  "blank space"
  let statusline.="\ "  "blank space"
  let statusline.="\ "  "blank space"
  let statusline.="\ "  "blank space"
  let statusline.="%f"
  let statusline.="\ "  "blank space"
  let statusline.="%m" "modifier, indicates '+' sign if file changed "
  let statusline.="%y"
  let statusline.="%="
  return statusline
endfunction

set laststatus=2
set statusline=%!ActiveStatus()
hi User1 guibg=white guifg=black
hi User2 guibg=#373b41 guifg=white

augroup status
  autocmd!
  autocmd WinEnter * setlocal statusline=%!ActiveStatus()
  autocmd WinLeave * setlocal statusline=%!InactiveStatus()
augroup END
