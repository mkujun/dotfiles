call plug#begin("~/.vim/plugged")
  Plug 'preservim/nerdtree'
  Plug 'chriskempson/base16-vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'vimwiki/vimwiki'
  Plug 'junegunn/fzf', { 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  "Plug 'Yggdroot/indentLine'
  Plug 'tpope/vim-vinegar'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'blueyed/vim-diminactive/'
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" color
"set termguicolors
"set t_Co=256
colorscheme base16-bright
"colorscheme onehalfdark

" folding
set foldmethod=indent
set foldlevel=1
set fillchars=fold:\ 
set foldtext=CustomFoldText()

" {} motion won't open fold even if it has empty lines in it
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

" jump to the first char in a line
nnoremap <leader>l ^

nnoremap <leader>> >i{
nnoremap <leader>< <i}

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

"statusline setup without plugin, maybe return to this later...
"function! ActiveStatus()
  "let statusline="" "begining of the statusline
  "let statusline.="%1*" "set statusline group"
  "let statusline.="\ "  "blank space"
  "let statusline.="\ "  "blank space"
  "let statusline.="\ "  "blank space"
  "let statusline.="%2*" "set statusline group 2 for arrow symbol
  "let statusline.=""
  "let statusline.="%*" "reset statusline group"
  "let statusline.="\ "  "blank space"
  "let statusline.="%f"
  "let statusline.="\ "  "blank space"
  "let statusline.="%m" "modifier, indicates '+' sign if file changed "
  "let statusline.="%y"
  "let statusline.="%"
  "return statusline
"endfunction

"function! InactiveStatus()
  "let statusline="" "begining of the statusline
  "let statusline.="\ "  "blank space"
  "let statusline.="\ "  "blank space"
  "let statusline.="\ "  "blank space"
  "let statusline.="\ "  "blank space"
  "let statusline.="\ "  "blank space"
  "let statusline.="%f"
  "let statusline.="\ "  "blank space"
  "let statusline.="%m" "modifier, indicates '+' sign if file changed "
  "let statusline.="%y"
  "let statusline.="%="
  "return statusline
"endfunction

set laststatus=2
"set statusline=%!ActiveStatus()
"hi User1 guibg=white guifg=black
"hi User2 guibg=#373b41 guifg=white

augroup status
  autocmd!
  "autocmd WinEnter * setlocal statusline=%!ActiveStatus()
  "autocmd WinLeave * setlocal statusline=%!InactiveStatus()
augroup END

set noshowmode

" brief blinking in word under the cursor when using '/' search option ('n'
" and N)
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>

function! HLNext (blinktime)
   let target_pat = '\c\%#'.@/
   let ring = matchadd('ErrorMsg', target_pat, 101)
   redraw
   exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
   call matchdelete(ring)
   redraw
endfunction

"lightline configuration
let g:lightline = { 
  \ 'colorscheme': 'wombat',
       \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
       \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
 \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
 \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ],
\ },
\ 'component_function' : {
\   'gitbranch': 'FugitiveHead'
\}
\ }

set clipboard=unnamedplus " yank also works with system clipboard

" adds blinking when yanking lines (visual or normal mode)
" this is neovim 0.5 feature
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END


" function that closes all buffers except the currently open one
function! CloseAllBuffersButCurrent()
  let curr = bufnr("%")
  let last = bufnr("$")

  if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
  if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction

" mapping for the function above
nmap <Leader>ca :call CloseAllBuffersButCurrent()<CR>


" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" custom function for folding text markers look
" https://essais.co/better-folding-in-neovim/
function! CustomFoldText()
  let indentation = indent(v:foldstart - 1)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines " . "--+"
  let foldLevelStr = "+--"
  let expansionString = repeat(" ", indentation)
  return expansionString . foldLevelStr . foldSizeStr
endfunction
