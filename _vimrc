" plugins
if has("gui_running")
  call plug#begin('~/.vim/plugged')
  Plug 'chriskempson/base16-vim'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-vinegar'
  Plug 'vimwiki/vimwiki'
  Plug 'ctrlpvim/ctrlp.vim/'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'bling/vim-bufferline'
  Plug 'dreadnaut/vim-bargreybars'
  call plug#end()
endif

" prevent nerdtree from hijacking vinegear
let NERDTreeHijackNetrw = 0

" ctrlp search only current directory
let g:ctrlp_working_path_mode = 'ra'

" airline customization
let g:airline_theme='minimalist'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_a=''

" bufferline customization
let g:bufferline_echo = 0

" various vim settings
syntax enable
set encoding=utf-8
set relativenumber
set number
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
set showbreak=>>>
set foldmethod=indent
set cursorline
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

" colors
if has("gui_running")
  colorscheme base16-default-dark
endif

" gvim options
"set guifont=Consolas:h16
set guifont=Source_Code_Pro:h14
set guioptions-=T
set guioptions-=r
set guioptions-=m
set guicursor+=n-v-c:blinkon0
au GUIEnter * simalt ~x


" automatic closing the brackets
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" todo: monthly snippet with inserted days, clear work week separation
" todo: bufferline at the top

" Dim inactive windows using 'colorcolumn' setting
function! s:DimInactiveWindows()
  for i in range(1, tabpagewinnr(tabpagenr(), '$'))
    let l:range = ""
    if i != winnr()
      if &wrap
        let l:width=256 " max
      else
        let l:width=winwidth(i)
      endif
      let l:range = join(range(1, l:width), ',')
    endif
    call setwinvar(i, '&colorcolumn', l:range)
  endfor
endfunction
augroup DimInactiveWindows
  au!
  au WinEnter * call s:DimInactiveWindows()
augroup END
