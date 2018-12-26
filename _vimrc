"--gvim based .vimrc file for windows machine--

colorscheme slate
set relativenumber
syntax enable
set nowrap

set ignorecase
set hlsearch
set incsearch

set backup
set backupdir=C:\Users\markok\VimTemp
set backupskip=C:\Users\markok\VimTemp
set directory=C:\Users\markok\VimTemp
set undodir=C:\Users\markok\VimTemp
set writebackup

"moving line(s) up or down 
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv