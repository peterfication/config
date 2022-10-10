local map = vim.api.nvim_set_keymap

-- Leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

options = { noremap = true }
map('n', '<Leader><ESC>', ':nohlsearch<CR>', options)

-- Reload the vim-lua configuration
map('n', '<Leader>ü', ':source ~/config/vim-lua/init.lua<CR>', options)
