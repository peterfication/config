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

      require("which-key").register({
        ["<Leader>"] = {
          x = {
            name = "Trouble",
            x = { "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", "Toggle document diagnostics" },
            w = { "<CMD>Trouble diagnostics toggle<CR>", "Toggle workspace diagnostics" },
            l = { "<CMD>Trouble loclist toggle<CR>", "Toggle loclist" },
            q = { "<CMD>Trouble qflist toggle<CR>", "Toggle quickfix" },
            n = { "<CMD>Trouble diagnostics next<CR><CMD>Trouble diagnostics jump<CR>", "Next" },
          },
          q = {
            name = "Quickfix",
            o = { ":copen<CR>", "Open quickfix list" },
            c = { ":cclose<CR>", "Close quickfix list" },
            t = { ":cg quickfix.out | cwindow<CR>", "Load quickfix from rspec-quickfix tests" },
          },
        },
        ["<C-l>"] = { ":cnext<CR>", "Next quickfix item" },
        ["<C-h>"] = { ":cprevious<CR>", "Previous quickfix item" },
        -- ["A-j"] = { ":cnext<CR>", "Next quickfix item" },
        -- ["A-k"] = { ":cprevious<CR>", "Previous quickfix item" },
      })
    end,
  },

  { "Olical/vim-enmasse" },
}
