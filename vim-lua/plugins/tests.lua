return function(use)
  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
      "haydenmeade/neotest-jest",
      "jfpedroza/neotest-elixir",
      "folke/which-key.nvim",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rspec")({
            rspec_cmd = function()
              return vim.tbl_flatten({
                "bundle",
                "exec",
                "rspec",
              })
            end,
          }),
          require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(_path)
              return vim.fn.getcwd()
            end,
          }),
          require("neotest-elixir"),
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
          unknown = "★",
        },
        quickfix = {
          enabled = true,
          open = false,
        },
      })

      vim.cmd("sign define neotest_ text=.")

      require("which-key").register({
        ["<Leader>"] = {
          t = {
            name = "Tests",
            t = {
              ':lua require("neotest").run.run()<CR>',
              "[Neotest] Run tests for the closest test from the cursor",
            },
            o = {
              ':lua require("neotest").output.open({ enter = true })<CR>',
              "[Neotest] Open output of closest test from the cursor",
            },
            a = {
              ':lua require("neotest").run.attach()<CR>',
              "[Neotest] Attach to the current test run",
            },
            s = {
              ':lua require("neotest").summary.toggle()<CR>',
              "[Neotest] Toggle test summary sidebar",
            },
          },
          T = {
            name = "Tests 2",
            T = {
              ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
              "[Neotest] Run tests for the current file",
            },
            O = {
              ':lua require("neotest").output_panel.toggle()<CR>',
              "[Neotest] Open output panel",
            },
          },
        },
      })

      -- TODO: map only for Ruby files
      -- map("n", "<Leader>te", ':vsplit <C-R>=expand("%:r")<CR>_spec.rb<S-Left><DEL><DEL><DEL>spec<CR>', options)
      -- map("n", "<Leader>tl", ':vsplit <C-R>=expand("%:r")<CR>_spec.rb<S-Left>spec/<CR>', options)
    end,
  })
end
