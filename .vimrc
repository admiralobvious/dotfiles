call plug#begin('~/.vim/plugged')

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

call plug#end()

filetype plugin indent on    " required
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab
" disable .swp files
set noswapfile
