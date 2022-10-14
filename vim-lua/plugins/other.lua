return function(use)
  use { 'editorconfig/editorconfig-vim' }
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-abolish' }
  use { 'tpope/vim-repeat' }
  use { 'mg979/vim-visual-multi' }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }
  use { 'windwp/nvim-ts-autotag' }
  use { 'p00f/nvim-ts-rainbow' }
  use {
    'kylechui/nvim-surround',
    tag = "*",
    config = function()
      require("nvim-surround").setup({})
    end
  }
  use {
    'ggandor/leap.nvim',
    requires = {
      { 'ggandor/flit.nvim' }
    },
    config = function()
      require('leap').add_default_mappings()
      require('flit').setup {}
    end
  }
  -- Highlight Search Lens
  -- use {
  --   'kevinhwang91/nvim-hlslens',
  --   config = function()
  --     local kopts = { noremap = true, silent = true }

  --     vim.api.nvim_set_keymap('n', 'n',
  --       [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
  --       kopts)
  --     vim.api.nvim_set_keymap('n', 'N',
  --       [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
  --       kopts)
  --     vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  --     vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
  --     vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  --     vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

  --     vim.api.nvim_set_keymap('n', '<Leader>l', ':noh<CR>', kopts)
  --   end
  -- }
end
