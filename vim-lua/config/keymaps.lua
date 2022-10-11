local map = vim.api.nvim_set_keymap

-- Leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

options = { noremap = true }
map('n', '<Leader><ESC>', ':nohlsearch<CR>', options)
map('n', '<Leader>w', ':w<CR>', options) -- Save current buffer
