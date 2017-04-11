call plug#begin('~/.local/share/nvim/plugged')

filetype plugin indent on
syntax on


" # Plugins

" Sensible defaults for vim
Plug 'tpope/vim-sensible'

" Autocompletion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --racer-completer' }

" Make Git changes visible
Plug 'airblade/vim-gitgutter'

" Edit surroundings
Plug 'tpope/vim-surround'

" Fuzzy file opener
Plug 'junegunn/fzf'
let $FZF_DEFAULT_COMMAND='rg --files'

" TBD
" Plug 'junegunn/vim-easy-align'
" https://github.com/SirVer/ultisnips
" https://github.com/scrooloose/nerdtree

call plug#end()


" # Configuration
set updatetime=250
set listchars=tab:▸\ ,trail:¤,nbsp:·,extends:>,precedes:<,space:·
set list
set clipboard=unnamed " share the Mac OS X clipboard
set shiftwidth=2
set expandtab " don't allow tabs at the beginning of the line but convert them into spaces


" # Keymap
let mapleader=" "
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>f :FZF<CR>
