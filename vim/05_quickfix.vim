nnoremap <silent> <leader>Q :Telescope quickfix<CR>

" Open/close the quickfix list
nnoremap <Leader>qo :copen<CR>
nnoremap <Leader>qc :cclose<CR>

" Cycle through the quicklist
noremap <A-j> :cnext<CR>
noremap <A-k> :cprevious<CR>
noremap <C-l> :cnext<CR>
noremap <C-h> :cprevious<CR>

" Cycle through the location list
noremap <A-J> :lnext<CR>
noremap <A-K> :lprevious<CR>

nnoremap <leader>qt :cg quickfix.out \| cwindow<CR>
