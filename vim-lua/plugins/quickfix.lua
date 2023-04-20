return function(use)
  -- Better quickfix features
  use({ "kevinhwang91/nvim-bqf" })
  -- Prettier quickfix window
  use({
    "https://gitlab.com/yorickpeterse/nvim-pqf.git",
    config = function()
      require("pqf").setup()
    end,
  })

  use({
    "folke/trouble.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "folke/which-key.nvim",
    },
    config = function()
      require("trouble").setup({})

      require("which-key").register({
        ["<Leader>"] = {
          x = {
            name = "Trouble",
            x = { "<CMD>TroubleToggle document_diagnostics<CR>", "Toggle document diagnostics" },
            w = { "<CMD>TroubleToggle workspace_diagnostics<CR>", "Toggle workspace diagnostics" },
            l = { "<CMD>TroubleToggle loclist<CR>", "Toggle loclist" },
            q = { "<CMD>TroubleToggle quickfix<CR>", "Toggle quickfix" },
          },
          q = {
            name = "Quickfix",
            o = { ":copen<CR>", "Open quickfix list" },
            c = { ":cclose<CR>", "Close quickfix list" },
            t = { ":cg quickfix.out | cwindow<CR>", "Load quickfix from rspec-quickfix tests" },
          },
        },
        ["C-l"] = { ":cnext<CR>", "Next quickfix item" },
        ["C-h"] = { ":cprevious<CR>", "Previous quickfix item" },
        -- ["A-j"] = { ":cnext<CR>", "Next quickfix item" },
        -- ["A-k"] = { ":cprevious<CR>", "Previous quickfix item" },
      })
    end,
  })

  use({ "Olical/vim-enmasse" })
end
