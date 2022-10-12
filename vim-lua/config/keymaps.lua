local map = vim.api.nvim_set_keymap

-- Leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

local options = { noremap = true }

map('n', '<Leader><ESC>', ':nohlsearch<CR>', options)
map('n', '<Leader>w', ':w<CR>', options) -- Save current buffer
map('n', '<Leader>ü', ':lua ReloadConfig()<CR>', options)

-- Get back old Y behavior
-- https://www.reddit.com/r/neovim/comments/petq61/neovim_060_y_not_yanking_line_but_to_end_of_line/
map('n', 'Y', 'Y', options)

-- Buffer navigation
-- Go back to last buffer
map('n', '<Leader>b', ':b#<CR>', options)
