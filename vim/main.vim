" We're running Vim, not Vi!
set nocompatible

" Has to be here so plugins can use it
let mapleader=" "

" Enable filetype plugins
filetype plugin indent on

source $HOME/config/vim/01_plugins.vim
source $HOME/config/vim/02_general.vim
source $HOME/config/vim/03_mappings.vim
source $HOME/config/vim/04_filetypes.vim

" TODO
" https://github.com/amix/vimrc
" https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/
" https://github.com/weirongxu/coc-explorer
