" Nerdtree
" nnoremap <Leader>n :NERDTreeToggle<CR>
" nnoremap <Leader>N :NERDTreeFind<CR>

" let g:NERDTreeWinSize=60

lua << EOF
require('nvim-tree').setup {}
EOF

nnoremap <Leader>n :NvimTreeToggle<CR>
nnoremap <Leader>N :NvimTreeFindFile<CR>
