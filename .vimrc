" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Python
Plug 'python-mode/python-mode', { 'branch': 'develop' }

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set noswapfile

