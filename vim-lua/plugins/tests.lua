return function(use)
  use {
    'nvim-neotest/neotest',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'olimorris/neotest-rspec',
      'haydenmeade/neotest-jest',
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-rspec'),
          require('neotest-jest')({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
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

      vim.cmd("sign define neotest_ text=.")

      map('n', '<Leader>T', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', options)
      map('n', '<Leader>tt', ':lua require("neotest").run.run()<CR>', options)
      map('n', '<Leader>to', ':lua require("neotest").output.open({ enter = true })<CR>', options)
      map('n', '<Leader>ta', ':lua require("neotest").run.attach()<CR>', options)
      map('n', '<Leader>ts', ':lua require("neotest").summary.toggle()<CR>', options)

      -- TODO: map only for Ruby files
      map('n', '<Leader>te', ':vsplit <C-R>=expand("%:r")<CR>_spec.rb<S-Left><DEL><DEL><DEL>spec<CR>', options)
      map('n', '<Leader>tl', ':vsplit <C-R>=expand("%:r")<CR>_spec.rb<S-Left>spec/<CR>', options)
    end
  }
end
