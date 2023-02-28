return function(use)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
      { 'kyazdani42/nvim-web-devicons' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'AckslD/nvim-neoclip.lua' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'nvim-telescope/telescope-github.nvim' },
      -- { 'ptethng/telescope-makefile' },
    },
    config = function()
      local actions = require('telescope.actions')
      local trouble = require("trouble.providers.telescope")

      require('telescope').setup {
        defaults = {
          cache_picker = {
            num_pickers = 100,
          },
          mappings = {
            i = {
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
              ['<C-d>'] = actions.delete_buffer,
              ["<c-x>"] = trouble.open_with_trouble,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
            },
            n = {
              ['d'] = actions.delete_buffer,
              ["<c-x>"] = trouble.open_with_trouble,
            },
          },
        },
      }

      require('telescope').load_extension('aerial')
      require('telescope').load_extension('file_browser')
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('gh')
      require('telescope').load_extension('luasnip')
      require("telescope").load_extension("neoclip")

      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<Leader>ee', builtin.find_files, {})
      vim.keymap.set('n', '<Leader>eb', ":Telescope file_browser hidden=true<CR>", {})
      vim.keymap.set('n', '<Leader>eh', builtin.oldfiles, {})
      vim.keymap.set('n', '<Leader>EE', builtin.buffers, {})
      vim.keymap.set('n', '<Leader>EB', ":Telescope file_browser path=%:p:h<CR>", {})

      -- Use <C-Space> to refine the search
      vim.keymap.set('n', '<Leader>ff', builtin.live_grep, {})
      vim.keymap.set('n', '<Leader>fw', ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>", {})
      vim.keymap.set('n', '<Leader>F', builtin.grep_string, {})

      vim.keymap.set('n', '<Leader>H', builtin.pickers, {})
      vim.keymap.set('n', '<Leader>/', builtin.search_history, {})

      vim.keymap.set('n', '<Leader>l', builtin.current_buffer_fuzzy_find, {})

      vim.keymap.set('n', '<Leader>?', builtin.help_tags, {})
      -- vim.keymap.set('n', '<Leader>Z', builtin.current_buffer_tags, {})
      -- vim.keymap.set('n', '<Leader>Z', builtin.treesitter, {})
      vim.keymap.set('n', '<Leader>d', builtin.diagnostics, {})

      vim.keymap.set('n', '<Leader>m', builtin.marks, {})
      vim.keymap.set('n', '<Leader>j', builtin.jumplist, {})

      vim.keymap.set('n', '<Leader>cc', builtin.commands, {})
      vim.keymap.set('n', '<Leader>ch', builtin.command_history, {})
      vim.keymap.set('n', '<Leader>C', builtin.builtin, {})

      vim.keymap.set('n', '<Leader>qq', ':Telescope quickfix<CR>', {})
      vim.keymap.set('n', '<Leader>qh', ':Telescope quickfixhistory<CR>', {})

      vim.keymap.set('n', '<Leader>oi', ':Telescope gh issues<CR>', {})
      vim.keymap.set('n', '<Leader>op', ':Telescope gh pull_request<CR>', {})

      vim.keymap.set('n', '<Leader>GS', builtin.git_status, {})

      require('neoclip').setup({
        history = 1000,
        default_register = { '+', '"', '*' },
        preview = true,
        on_paste = {
          set_reg = true,
        },
      })
      vim.keymap.set('n', '<Leader>p', ":Telescope neoclip<CR> ", {})

      -- require('telescope-makefile').setup({})
      -- vim.keymap.set('n', '<Leader>R', ':Telescope make<CR>', {})
      -- require("telescope").load_extension("make")
    end
  }

  use {
    'axkirillov/easypick.nvim',
    requires = 'nvim-telescope/telescope.nvim',
    config = function()
      local easypick = require("easypick")

      easypick.setup({
        pickers = {
          {
            name = "git_hunks",
            command = "ruby ~/config/vim-lua/plugins/ruby/git.rb",
            previewer = require("telescope.previewers").vim_buffer_vimgrep.new({}),
            opts = {
              prompt_title = "Git hunks",
              initial_mode = 'insert',
            },
            entry_maker = function(entry)
              local filename, lnum_string = entry:match("([^:]+):(%d+).*")
              local lnum = tonumber(lnum_string)

              return {
                value = filename,
                display = entry,
                ordinal = entry,
                filename = filename,
                lnum = lnum,
              }
            end,
          }
        },
      })

      vim.keymap.set('n', '<Leader>gs', ":Easypick git_hunks<CR> ", {})
    end
  }
end
