" --gvim based .vimrc file for windows machine--

colorscheme slate

set relativenumber

set backup
set backupdir=C:\Users\markok\VimTemp
set backupskip=C:\Users\markok\VimTemp
set directory=C:\Users\markok\VimTemp
set undodir=C:\Users\markok\VimTemp
set writebackup

nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
inoremap <S-j> <ESC>:m .+1<CR>==gi
inoremap <S-k> <ESC>:m .-2<CR>==gi
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv