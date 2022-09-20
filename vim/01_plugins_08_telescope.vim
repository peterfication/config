lua << EOF
require('telescope').setup {}
-- require('telescope').load_extension('fzf')

-- require("telescope").load_extension("neoclip")

require('fzf-lua').setup {}
require('neoclip').setup({
  history = 1000,
  default_register = {'"', '+', '*'},
  preview = true,
  keys = {
    fzf = {
      select = 'default',
      paste = 'ctrl-p',
      paste_behind = 'ctrl-l',
      custom = {},
    },
  },
})
EOF

nnoremap <silent> <leader><space> :Telescope builtin<CR>
" nnoremap <silent> <leader>p :Telescope neoclip<CR>
nnoremap <silent> <leader>p :lua require('neoclip.fzf')()<CR>
