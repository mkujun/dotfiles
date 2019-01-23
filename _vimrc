set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/plugin/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"mapping for nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

colorscheme gruvbox
set relativenumber
syntax enable
set nowrap

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