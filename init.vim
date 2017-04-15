set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


call plug#begin('~/.local/share/nvim/plugged')

" # Plugins

Plug 'nanotech/jellybeans.vim'

" Sensible defaults for vim
Plug 'tpope/vim-sensible'

Plug 'scrooloose/nerdtree'

" Autocompletion
" You might need to install `$ pip install neovim` for that
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --racer-completer' }

" Make Git changes visible
Plug 'airblade/vim-gitgutter'

" Edit surroundings
Plug 'tpope/vim-surround'

" Fuzzy file opener
" You might need to install `$ brew install fzf` for that (with shell extension)
Plug 'junegunn/fzf'
" You need to install `$ brew install ripgrep` for that
let $FZF_DEFAULT_COMMAND='rg --files'

Plug 'mhinz/vim-startify'
let g:startify_change_to_dir = 0
let g:startify_list_order = ['dir', 'bookmarks', 'sessions', 'commands']
let g:startify_files_number = 7

Plug 'vim-scripts/vim-auto-save'
let g:auto_save = 1  " enable AutoSave on Vim startup

Plug 'mbbill/undotree'
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Language-specific plugins
Plug 'vim-ruby/vim-ruby'
Plug 'ap/vim-css-color'
Plug 'JulesWang/css.vim'
Plug 'cespare/vim-toml'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rust-lang/rust.vim'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-haml'

" TBD
" Plug 'junegunn/vim-easy-align'
" https://github.com/SirVer/ultisnips
" https://github.com/scrooloose/nerdtree
" Plug 'terryma/vim-multiple-cursors'

call plug#end()


set termguicolors
colorscheme jellybeans


" # Configuration
set updatetime=250
set listchars=tab:▸\ ,trail:¤,nbsp:·,extends:>,precedes:<,space:·
set list
set clipboard=unnamed " share the Mac OS X clipboard
set shiftwidth=2
set expandtab " don't allow tabs at the beginning of the line but convert them into spaces
set ruler
set number
set wildmenu
set wildmode=longest:full,full

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" # Keymap
let mapleader=" "
nnoremap <Leader>q :q<CR>
nnoremap <Leader>b :b#<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>nt :NERDTree<CR>

" Go up and down visually and not by new lines (for long lines)
nnoremap j gj
nnoremap k gk

" Disable the arrow keys for training ;)
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Go to tab by number
nnoremap <Leader>t :tabe<CR>
nnoremap H gT
nnoremap L gt
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Use FZF for the buffer
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction
function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction
nnoremap <silent> <Leader>e :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
