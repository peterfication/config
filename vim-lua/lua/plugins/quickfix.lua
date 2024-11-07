return {
  -- Better quickfix features
  { "kevinhwang91/nvim-bqf" },
  -- Prettier quickfix window
  {
    "https://gitlab.com/yorickpeterse/nvim-pqf.git",
    config = function()
      require("pqf").setup()
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "folke/which-key.nvim",
    },
    config = function()
      require("trouble").setup({
        {
          win = {
            wo = {
              wrap = true,
            },
          },
        },
      })

      require("which-key").add({
        { "<C-h>", ":cprevious<CR>", desc = "Previous quickfix item" },
        { "<C-l>", ":cnext<CR>", desc = "Next quickfix item" },
        -- ["A-j"] = { ":cnext<CR>", "Next quickfix item" },
        -- ["A-k"] = { ":cprevious<CR>", "Previous quickfix item" },

        { "<Leader>q", group = "Quickfix" },
        { "<Leader>qc", ":cclose<CR>", desc = "Close quickfix list" },
        { "<Leader>qo", ":copen<CR>", desc = "Open quickfix list" },
        { "<Leader>qt", ":cg quickfix.out | cwindow<CR>", desc = "Load quickfix from rspec-quickfix tests" },

        { "<Leader>x", group = "Trouble" },
        { "<Leader>xl", "<CMD>Trouble loclist toggle<CR>", desc = "Toggle loclist" },
        { "<Leader>xn", "<CMD>Trouble diagnostics next<CR><CMD>Trouble diagnostics jump<CR>", desc = "Next" },
        { "<Leader>xq", "<CMD>Trouble qflist toggle<CR>", desc = "Toggle quickfix" },
        { "<Leader>xw", "<CMD>Trouble diagnostics toggle<CR>", desc = "Toggle workspace diagnostics" },
        { "<Leader>xx", "<CMD>Trouble diagnostics toggle filter.buf=0 filter.severity=vim.diagnostic.severity.ERROR<CR>", desc = "Toggle document diagnostics" },
        { "<Leader>xe", "<CMD><CR>", desc = "Telescope document diagnostics" },
      })
    end,
  },

  { "Olical/vim-enmasse" },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    config = function()
      vim.diagnostic.config({
        underline = true,
        virtual_text = false,
        severity_sort = true,
        update_in_insert = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
          },
        },
      })

      require("tiny-inline-diagnostic").setup()
    end,
  },
}
