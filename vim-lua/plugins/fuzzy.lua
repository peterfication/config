return function(use)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-treesitter/nvim-treesitter'},
      {'kyazdani42/nvim-web-devicons'},
    },
    config = function()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<Leader>e', builtin.find_files, {})
      vim.keymap.set('n', '<Leader>f', builtin.live_grep, {})
      vim.keymap.set('n', '<Leader>E', builtin.buffers, {})
      vim.keymap.set('n', '<Leader>z', builtin.help_tags, {})
      vim.keymap.set('n', '<Leader>c', builtin.commands, {})
    end
    }
end
