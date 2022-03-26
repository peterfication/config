lua << EOF
require('telescope').setup {}
-- require('telescope').load_extension('fzf')

require("telescope").load_extension("neoclip")
require('neoclip').setup({
  history = 1000,
  preview = true,
})
EOF

nnoremap <silent> <leader><space> :Telescope builtin<CR>
nnoremap <silent> <leader>p :Telescope neoclip<CR>
