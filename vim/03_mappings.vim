" Reload the vim configuration
nnoremap <Leader>ü :source ~/config/vim/main.vim<CR>

" Go up and down visually and not by new lines (for long lines)
nnoremap j gj
nnoremap k gk

" Buffer navigation
" Go back to last buffer
nnoremap <Leader>b :b#<CR>
" Open new empty buffer
nnoremap <Leader>B :enew<CR>
" Cycle through open buffers and close them
nnoremap <C-K> :bnext<CR>
nnoremap <C-J> :bprevious<CR>
" Close current buffer
nnoremap <C-C> :bd<CR>

" Tab navigation
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt

:command! CloseAllBuffers bufdo! bd

" Save current buffer
nnoremap <Leader>w :w<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Github
:command! GithubRepoViewWeb !gh repo view --web
:command! GithubPrView !gh pr view

" Testing
nnoremap <Leader>rg :GoTest<CR>
let g:go_term_enabled = 1
  let g:go_term_reuse = 1

" For https://exercism.org/
:command! ExercismSubmit !exercism submit %
