" --gvim based .vimrc file for windows machine--

colorscheme slate

set relativenumber

set backup
set backupdir=C:\Users\markok\VimTemp
set backupskip=C:\Users\markok\VimTemp
set directory=C:\Users\markok\VimTemp
set undodir=C:\Users\markok\VimTemp
set writebackup

" moving line up or down (only in normal mode)
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==