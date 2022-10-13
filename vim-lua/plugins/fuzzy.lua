return function(use)
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
      { 'kyazdani42/nvim-web-devicons' },
    },
    config = function()
      local actions = require('telescope.actions')
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
            },
          },
        },
      }

      require('telescope').load_extension('fzf')
      require('telescope').load_extension('luasnip')

      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<Leader>e', builtin.find_files, {})
      vim.keymap.set('n', '<Leader>E', builtin.buffers, {})

      vim.keymap.set('n', '<Leader>f', builtin.live_grep, {})
      vim.keymap.set('n', '<Leader>F', builtin.grep_string, {})

      vim.keymap.set('n', '<Leader>hf', builtin.oldfiles, {})
      vim.keymap.set('n', '<Leader>he', builtin.oldfiles, {})
      vim.keymap.set('n', '<Leader>hc', builtin.command_history, {})
      vim.keymap.set('n', '<Leader>hs', builtin.search_history, {})

      vim.keymap.set('n', '<Leader>l', builtin.current_buffer_fuzzy_find, {})

      vim.keymap.set('n', '<Leader>z', builtin.help_tags, {})
      vim.keymap.set('n', '<Leader>Z', builtin.current_buffer_tags, {})

      vim.keymap.set('n', '<Leader>m', builtin.marks, {})

      vim.keymap.set('n', '<Leader>c', builtin.commands, {})

      vim.keymap.set('n', '<Leader>gh', builtin.git_status, {})

      vim.api.nvim_create_user_command('Rg', 'Telescope grep_string search=<args>', { nargs = 1 })
    end
  }
end
