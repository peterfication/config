" FZF
" Use ripgrep for search
" You need to install `$ brew install rigrep` for that
let $FZF_DEFAULT_COMMAND='rg --files'

" Open files
nnoremap <Leader>e :FZF<CR>
nnoremap <Leader>E :Buffers<CR>

" Go to line
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>L :BLines<CR>

" Search marks
nnoremap <Leader>m :Marks<CR>
" Search all commands
nnoremap <Leader>c :Commands<CR>
" Search tags
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>T :BTags<CR>

" Search
nnoremap <Leader>f :Rg<CR>
" Search for word under cursor in files
nnoremap <Leader>F :Rg <C-R><C-W><CR>

" File/command/search history
nnoremap <Leader>HF :History<CR>
nnoremap <Leader>HC :History:<CR>
nnoremap <Leader>HS :History/<CR>

" Git commits
nnoremap <Leader>g :Commits<CR>
nnoremap <Leader>G :BCommits<CR>

" Snippets
nnoremap <Leader>s :Snippets<CR>
