return function(use)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
      { 'kyazdani42/nvim-web-devicons' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'AckslD/nvim-neoclip.lua' },
    },
    config = function()
      local actions = require('telescope.actions')
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
              ['<C-d>'] = actions.delete_buffer
            },
            n = {
              ['d'] = actions.delete_buffer
            },
          },
        },
      }

      require('telescope').load_extension('fzf')
      require('telescope').load_extension('luasnip')
      require("telescope").load_extension("neoclip")

      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<Leader>e', builtin.find_files, {})
      vim.keymap.set('n', '<Leader>E', builtin.buffers, {})

      -- vim.keymap.set('n', '<Leader>f', builtin.live_grep, {})
      vim.keymap.set('n', '<Leader>f', ":Search ", {})
      vim.keymap.set('n', '<Leader>F', builtin.grep_string, {})

      vim.keymap.set('n', '<Leader>he', builtin.oldfiles, {})
      vim.keymap.set('n', '<Leader>hc', builtin.command_history, {})
      vim.keymap.set('n', '<Leader>hf', builtin.search_history, {})

      vim.keymap.set('n', '<Leader>l', builtin.current_buffer_fuzzy_find, {})

      vim.keymap.set('n', '<Leader>z', builtin.help_tags, {})
      -- vim.keymap.set('n', '<Leader>Z', builtin.current_buffer_tags, {})
      vim.keymap.set('n', '<Leader>Z', builtin.treesitter, {})
      vim.keymap.set('n', '<Leader>d', builtin.diagnostics, {})

      vim.keymap.set('n', '<Leader>m', builtin.marks, {})
      vim.keymap.set('n', '<Leader>j', builtin.jumplist, {})

      vim.keymap.set('n', '<Leader>c', builtin.commands, {})
      vim.keymap.set('n', '<Leader>C', builtin.builtin, {})

      vim.keymap.set('n', '<Leader>gs', builtin.git_status, {})

      vim.api.nvim_create_user_command('Search', 'Telescope grep_string search=<args>', { nargs = 1 })
      vim.api.nvim_create_user_command('Rg', 'Telescope grep_string search=<args>', { nargs = 1 })

      require('neoclip').setup({
        history = 1000,
        default_register = { '+', '"', '*' },
        preview = true,
        on_paste = {
          set_reg = true,
        },
      })
      vim.keymap.set('n', '<Leader>p', ":Telescope neoclip<CR> ", {})
    end
  }
end
