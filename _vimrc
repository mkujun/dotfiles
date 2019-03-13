set relativenumber
syntax enable
set nowrap

colorscheme slate

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

"font for gvim
set guifont=Consolas:h12

"copy paste windows style
nnoremap <C-V> "+gP
vnoremap <C-V> "+gP