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

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})

      local options = { noremap = true }
      vim.api.nvim_set_keymap("n", "<Leader>xx", "<CMD>TroubleToggle document_diagnostics<CR>", options)
      vim.api.nvim_set_keymap("n", "<Leader>xw", "<CMD>TroubleToggle workspace_diagnostics<CR>", options)
      vim.api.nvim_set_keymap("n", "<Leader>xl", "<CMD>TroubleToggle loclist<CR>", options)
      vim.api.nvim_set_keymap("n", "<Leader>xq", "<CMD>TroubleToggle quickfix<CR>", options)
    end
  }
  use { 'Olical/vim-enmasse' }

  local map = vim.api.nvim_set_keymap
  local options = { noremap = true }

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
