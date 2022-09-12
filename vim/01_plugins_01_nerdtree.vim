" Nerdtree
" nnoremap <Leader>n :NERDTreeToggle<CR>
" nnoremap <Leader>N :NERDTreeFind<CR>

" let g:NERDTreeWinSize=60

lua << EOF
require('nvim-tree').setup({
  -- actions = {
  --   open_file = {
  --     quit_on_open = true
  --   }
  -- },
  -- view = {
  --   float = {
  --     enable = true,
  --     open_win_config = {
  --       relative = "editor",
  --       border = "rounded",
  --       width = 100,
  --       height = 30,
  --       row = 1,
  --       col = 1,
  --     }
  --   }
  -- }
})

EOF

nnoremap <Leader>n :NvimTreeToggle<CR>
nnoremap <Leader>N :NvimTreeFindFile<CR>
