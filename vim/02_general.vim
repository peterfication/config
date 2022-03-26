" Share the system clipboard
set clipboard=unnamed

" Set colors
set termguicolors
colorscheme base16-solarized-dark

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Use Ripgrep for vimgrep
set grepprg=rg\ --vimgrep

" Don't allow tabs at the beginning of the line but convert them into spaces
set expandtab

" Make it possible to open another buffer without saving the current one
set hidden

" Show line numbers
set number
" Highlights the current line of the cursor
set cursorline
" Highlights the current column of the cursor
set cursorcolumn

" Give more space for displaying messages.
set cmdheight=2

" No folding by default
set nofoldenable
" set foldenable
set foldmethod=syntax

" set noswapfile
" set list
" set shiftwidth=2
" Show (partial) command in the last line of the screen.
" set showcmd

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

set list
set listchars=tab:▸\ ,trail:¤,nbsp:·,extends:>,precedes:<,space:·,eol:⏎
set splitright
set splitbelow

" Remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e
