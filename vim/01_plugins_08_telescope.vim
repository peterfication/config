lua << EOF
require('telescope').setup {}

require("telescope").load_extension("neoclip")
require('neoclip').setup({
  history = 1000,
  preview = true,
})
EOF

nnoremap <silent> <leader>p :Telescope neoclip<CR>
