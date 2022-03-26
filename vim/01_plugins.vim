" https://github.com/junegunn/vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'

" Load the base16 colorschemes
Plug 'chriskempson/base16-vim'
Plug 'RRethy/vim-illuminate'

" Respect the .editorconfig files
Plug 'editorconfig/editorconfig-vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" File tree plugin
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kyazdani42/nvim-tree.lua'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'akinsho/bufferline.nvim'
" Plug 'mkitt/tabline.vim'

" FZF
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Multi cursor
Plug 'mg979/vim-visual-multi'

" Register view
" Plug 'gennaro-tedesco/nvim-peekup'
" Plug 'tversteeg/registers.nvim'
Plug 'AckslD/nvim-neoclip.lua'
Plug 'milkypostman/vim-togglelist'
Plug 'kevinhwang91/nvim-bqf'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'kdheepak/lazygit.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
" Plug 'jreybert/vimagit'
" Plug 'TimUntersberger/neogit'

" Smart motions with s
" Plug 'justinmk/vim-sneak'
Plug 'ggandor/lightspeed.nvim'

" Language server integration
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
" coc-spell-checker:
" - https://github.com/iamcco/coc-spell-checker#add-on-dictionaries
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-go',
  \ 'coc-graphql',
  \ 'coc-solargraph',
  \ 'coc-spell-checker',
  \ 'coc-cspell-dicts',
  \ 'coc-emoji',
  \ 'coc-xml',
  \ 'coc-yaml'
\ ]
Plug 'AndrewRadev/tagalong.vim'
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
" See https://github.com/neoclide/coc.nvim/issues/39
" Plug 'liuchengxu/vista.vim'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': [
    \ 'javascript',
    \ 'javascriptreact',
    \ 'typescript',
    \ 'typescriptreact',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'ruby',
    \ 'xml',
    \ 'markdown'
  \ ]
\ }

" Snippets
" Snippet engine
Plug 'SirVer/ultisnips'
" The actual snippets
Plug 'honza/vim-snippets'

" Comment out code with gcc
Plug 'tomtom/tcomment_vim'
" vim-commentary uses /* ... */ for Typescript. I don't like.
" Plug 'tpope/vim-commentary'

" Repeat plugin commands with .
Plug 'tpope/vim-repeat'

" Edit surroundings, e.g. quotes
Plug 'tpope/vim-surround'

" Improve the `ga` command for showing what the character under the cursor is.
Plug 'tpope/vim-characterize'

" Needed for vim-markdown
Plug 'godlygeek/tabular'

" Language plugins
Plug 'sheerun/vim-polyglot'

" TODO Add test support
" Plug 'vim-test/vim-test'

" Plug 'jparise/vim-graphql'
" Plug 'plasticboy/vim-markdown'
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'mxw/vim-jsx'
" Plug 'ianks/vim-tsx'
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-haml'
" Plug 'stephpy/vim-yaml'
" Plug 'rust-lang/rust.vim'
" Plug 'cespare/vim-toml'
" Plug 'JulesWang/css.vim'

" Auto generate tags
" This runs ctags. And it's super resource heavy.
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'

" Awesome substitutions
Plug 'tpope/vim-abolish'

" Auto complete brackets
Plug 'jiangmiao/auto-pairs'
" TODO This one does not work somehow with quotes
" Plug 'townk/vim-autoclose'

" PDF commands
" Plug 'vim-pandoc/vim-pandoc'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Telescope
" [Why Telescope?](https://www.youtube.com/watch?v=8SqFt5h2Lsg)
" [Vim Telescope: The Ultimate Fuzzy Finder](https://www.youtube.com/watch?v=2tO2sT7xX2k)
" Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" https://github.com/sudormrfbin/cheatsheet.nvim

" https://github.com/ibhagwan/fzf-lua

" Run commands asynchronously
" Plug 'benekastah/neomake'

" Plug 'mbbill/undotree'
" if has("persistent_undo")
"     set undodir=~/.undodir/
"     set undofile
" endif

" Clipboard history
" Plug 'vim-scripts/YankRing.vim'

" For tmux styles generation
" Plug 'edkolev/tmuxline.vim'

Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

source ~/config/vim/01_plugins_01_nerdtree.vim
source ~/config/vim/01_plugins_02_fzf.vim
source ~/config/vim/01_plugins_03_coc.vim
source ~/config/vim/01_plugins_04_snippets.vim
source ~/config/vim/01_plugins_05_tags.vim
source ~/config/vim/01_plugins_06_statusline.vim
source ~/config/vim/01_plugins_07_lazygit.vim
source ~/config/vim/01_plugins_08_telescope.vim
