" Reload the vim configuration
nnoremap <Leader>ü :source ~/config/vim/main.vim<CR>

" Go up and down visually and not by new lines (for long lines)
nnoremap j gj
nnoremap k gk

" Bugger navigation
" Go back to last buffer
nnoremap <Leader>b :b#<CR>
" Cycle through open buffers and close them
nnoremap <C-K> :bnext<CR>
nnoremap <C-J> :bprevious<CR>
" Close current buffer
nnoremap <C-C> :bd<CR>

:command CloseAllBuffers bufdo! bd

" Save current buffer
nnoremap <Leader>w :w<CR>

" Quicklist
" Cycle through the quicklist
noremap <A-j> :cnext<CR>
noremap <A-k> :cprevious<CR>

" Location list
" Cycle through the location list
noremap <A-J> :lnext<CR>
noremap <A-K> :lprevious<CR>

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
