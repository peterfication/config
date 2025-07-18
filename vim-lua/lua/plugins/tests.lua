return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-python",
      "olimorris/neotest-rspec",
      "haydenmeade/neotest-jest",
      "jfpedroza/neotest-elixir",
      "rouge8/neotest-rust",
      "folke/which-key.nvim",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python"),
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
            jestCommand = "npm run test --",
            jestConfigFile = "jest.config.js",
            env = { CI = true, DEBUG = "true" },
            cwd = function(_path)
              return vim.fn.getcwd()
            end,
          }),
          require("neotest-elixir"),
          require("neotest-rust"),
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

      require("which-key").add({
        { "<Leader>T", group = "Tests 2" },
        { "<Leader>TO", ':lua require("neotest").output_panel.toggle()<CR>', desc = "[Neotest] Open output panel" },
        {
          "<Leader>TT",
          ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
          desc = "[Neotest] Run tests for the current file",
        },
        { "<Leader>t", group = "Tests" },
        { "<Leader>ta", ':lua require("neotest").run.attach()<CR>', desc = "[Neotest] Attach to the current test run" },
        {
          "<Leader>to",
          ':lua require("neotest").output.open({ enter = true })<CR>',
          desc = "[Neotest] Open output of closest test from the cursor",
        },
        {
          "<Leader>ts",
          ':lua require("neotest").summary.toggle()<CR>',
          desc = "[Neotest] Toggle test summary sidebar",
        },
        {
          "<Leader>tt",
          ':lua require("neotest").run.run()<CR>',
          desc = "[Neotest] Run tests for the closest test from the cursor",
        },
        {
          "<leader>td",
          function()
            require("neotest").run.run({ strategy = "dap" })
          end,
          desc = "Debug Nearest",
        },
      })

      -- neotest-plenary has the problem that it will load all files in other
      -- folders even if the project is not a Neovim plugin. This will slow all
      -- other projects down a lot.
      -- TODO: find out why this is happening with neotest-plenary
      vim.api.nvim_create_user_command("NeotestPlenaryEnable", function()
        require("neotest").setup({
          adapters = {
            require("neotest-plenary"),
          },
        })
      end, {})

      -- TODO: map only for Ruby files
      -- map("n", "<Leader>te", ':vsplit <C-R>=expand("%:r")<CR>_spec.rb<S-Left><DEL><DEL><DEL>spec<CR>', options)
      -- map("n", "<Leader>tl", ':vsplit <C-R>=expand("%:r")<CR>_spec.rb<S-Left>spec/<CR>', options)
    end,
  },
}
