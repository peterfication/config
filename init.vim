set nocompatible " We're running Vim, not Vi!
filetype plugin indent on

call plug#begin('~/.local/share/nvim/plugged')

" # Plugins

Plug 'nanotech/jellybeans.vim'

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-abolish'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Run commands asynchronously
Plug 'benekastah/neomake'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1

" Smart motions with s
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1
let g:sneak#s_next = 1

" Plug 'fntlnz/atags.vim'
" let g:atags_build_commands_list = [
"     \ 'ri -g "" | ctags -L - --fields=+l -f tags.tmp',
"     \ 'awk "length($0) < 400" tags.tmp > tags',
"     \ 'rm tags.tmp'
"     \ ]
" " Generate tags everytime a file is being written
" autocmd BufWritePost * call atags#generate()
" command! UpdateTags :call atags#generate()<cr>

" Auto completion
" You might need to install `$ pip install neovim` for that
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --racer-completer' }
Plug 'ajh17/VimCompletesMe'

" Make Git changes visible
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Plug 'jreybert/vimagit'

" Edit surroundings
Plug 'tpope/vim-surround'

" Make Vim play nicely with iTerm 2 and tmux.
Plug 'sjl/vitality.vim'

" Fuzzy file opener
" You might need to install `$ brew install fzf` for that (with shell extension)
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" You need to install `$ brew install ripgrep` for that
let $FZF_DEFAULT_COMMAND='rg --files'
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

Plug 'mhinz/vim-startify'
let g:startify_change_to_dir = 0
let g:startify_list_order = ['dir', 'bookmarks', 'sessions', 'commands']
let g:startify_files_number = 7

" Plug 'mbbill/undotree'
" if has("persistent_undo")
"     set undodir=~/.undodir/
"     set undofile
" endif

Plug 'junegunn/vim-emoji'

" Clipboard history
" Plug 'vim-scripts/YankRing.vim'

" Auto complete brackets
Plug 'jiangmiao/auto-pairs'
" Comment out code with gcc
Plug 'tpope/vim-commentary'

" Repeat plugin commands with .
Plug 'tpope/vim-repeat'

" Language-specific plugins
Plug 'vim-ruby/vim-ruby'
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1
runtime macros/matchit.vim
Plug 'JulesWang/css.vim'
Plug 'cespare/vim-toml'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rust-lang/rust.vim'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-haml'

" JS
let g:jsx_ext_required = 0
" This needs eslint and all the plugins to be installed globally
" yarn global add eslint eslint-config-airbnb eslint-config-airbnb-base ...
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_jsx_enabled_makers = ['eslint']
autocmd! BufWritePost *.js Neomake

" TBD
" Plug 'junegunn/vim-easy-align'
" https://github.com/SirVer/ultisnips
" https://github.com/scrooloose/nerdtree
" Plug 'terryma/vim-multiple-cursors'

call plug#end()

" Change the git-gutter signs to emojis
" (Has to be after `call plug#end()`)
" let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
" let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
" let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
" let g:gitgutter_sign_modified_removed = emoji#for('collision')


set termguicolors
colorscheme jellybeans


" # Configuration
set noswapfile
set spell spelllang=en_us
set spellfile=~/config/vim/en.utf-8.add
set updatetime=250
set listchars=tab:▸\ ,trail:¤,nbsp:·,extends:>,precedes:<,space:·
set list
set clipboard=unnamed " share the Mac OS X clipboard
set shiftwidth=2
set expandtab " don't allow tabs at the beginning of the line but convert them into spaces
set number
" set relativenumber
set cursorline " Highlights the current line of the cursor
set showcmd " Show (partial) command in the last line of the screen.
set hidden " Make it possible to open another buffer without saving the current one
set splitright
set splitbelow


" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e
" Save on escaping from insert mode
" inoremap <Esc> <Esc>:w<CR>
" Save all buffers on focus lost and don't display errors
au FocusLost * silent! wa

" # Key map
let mapleader=" "
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>b :b#<CR>
nnoremap <Leader>B :bd<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>F :Find<CR>
" Search for word under cursor in files
nnoremap <Leader>G :Find <C-R><C-W><CR>
nnoremap <Leader>s :Startify<CR>
nnoremap <Leader>ü :source $MYVIMRC<CR>
nnoremap <Leader>ö :tabe $MYVIMRC<CR>
" Cycle through open buffers and close them
nnoremap <C-K> :bnext<CR>
nnoremap <C-J> :bprevious<CR>
nnoremap <C-C> :bd<CR>

" Toggle nerdtree with F10
map <F12> :NERDTreeToggle<CR>
" Current file in nerdtree
map <F11> :NERDTreeFind<CR>

" Show YankRing
nnoremap <Leader>p :YRShow<CR>

" Go up and down visually and not by new lines (for long lines)
nnoremap j gj
nnoremap k gk

" Disable the arrow keys for training ;)
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

" Go to tab by number
nnoremap <Leader>t :tabe<CR>
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

" Replace emoji strings to emojis (eg. :beers: => 🍻)
noremap <Leader>m :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<CR>

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


" Change a comma separated line in one line for each entry
noremap <Leader>, $a,<Esc>:s/,,/,/e<CR>:s/, /,\r      /ge<CR>

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <Leader>n :call NumberToggle()<cr>


" ## Ruby ##
autocmd! BufWritePost *.rb Neomake rubocop
autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead *.thor set filetype=ruby
autocmd FileType ruby compiler ruby
noremap <Leader>o o<CR>end<Esc>-cc

" Add `, :focus` to an rspec it statement
noremap <Leader>rr $bba, :focus<Esc>
noremap <Leader>rt gg/ do<CR>i, :focus<Esc>
" Remove `, :focus` from an rspec it statement
noremap <Leader>RR :s/, :focus//<CR>
noremap <Leader>RT :%s/, :focus//g<CR>

" Create the parent directory on save if it does not exist
" See http://stackoverflow.com/a/4294176
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Move lines up and down
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> Ü :call <SID>swap_up()<CR>
noremap <silent> Ä :call <SID>swap_down()<CR>
