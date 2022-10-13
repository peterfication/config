return function(use)
  use {
    'nvim-neotest/neotest',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'olimorris/neotest-rspec',
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-rspec'),
        },
        icons = {
          child_indent = "│",
          child_prefix = "├",
          collapsed = "─",
          expanded = "╮",
          failed = "✗",
          final_child_indent = " ",
          final_child_prefix = "╰",
          non_collapsible = "─",
          passed = "✓",
          running = "★",
          running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
          skipped = "★",
          unknown = "★"
        },
      })

      local map = vim.api.nvim_set_keymap
      local options = { noremap = true }

      map('n', '<Leader>T', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', options)
      map('n', '<Leader>tt', ':lua require("neotest").run.run()<CR>', options)
      map('n', '<Leader>to', ':lua require("neotest").output.open()<CR>', options)
      map('n', '<Leader>ta', ':lua require("neotest").run.attach()<CR>', options)

      -- TODO: map only for Ruby files
      map('n', '<Leader>te', ':vsplit <C-R>=expand("%:r")<CR>_spec.rb<S-Left><DEL><DEL><DEL>spec<CR>', options)
      map('n', '<Leader>tl', ':vsplit <C-R>=expand("%:r")<CR>_spec.rb<S-Left>spec/<CR>', options)
    end
  }
end
