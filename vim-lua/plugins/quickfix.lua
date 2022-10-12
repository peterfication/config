return function(use)
  -- Better quickfix
  use { 'kevinhwang91/nvim-bqf' }

  local map = vim.api.nvim_set_keymap
  options = { noremap = true }

  map('n', '<Leader>Q', ':Telescope quickfix<CR>', options)

  -- Open/close the quickfix list
  map('n', '<Leader>qo', ':copen<CR>', options)
  map('n', '<Leader>qc', ':cclose<CR>', options)

  -- Cycle through the quicklist
  map('n', '<A-j>', ':cnext<CR>', options)
  map('n', '<A-k>', ':cprevious<CR>', options)
  map('n', '<C-l>', ':cnext<CR>', options)
  map('n', '<C-h>', ':cprevious<CR>', options)

  -- Load quickfix from rspec-quickfix tests
  map('n', '<Leader>qt', ':cg quickfix.out | cwindow<CR>', options)
end
