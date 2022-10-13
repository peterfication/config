return function(use)
  -- Better quickfix features
  use { 'kevinhwang91/nvim-bqf' }
  -- Prettier quickfix window
  use {
    'https://gitlab.com/yorickpeterse/nvim-pqf.git',
    config = function()
      require('pqf').setup()
    end
  }

  local map = vim.api.nvim_set_keymap
  local options = { noremap = true }

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
