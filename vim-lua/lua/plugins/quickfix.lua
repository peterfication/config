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
      require("trouble").setup({})

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
        { "<Leader>xx", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Toggle document diagnostics" },
      })
    end,
  },

  { "Olical/vim-enmasse" },
}
