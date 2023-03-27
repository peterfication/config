return function(use)
  use({
    "mrjones2014/legendary.nvim",
    config = function()
      require("legendary").setup({
        keymaps = {
          { "<leader>k", ":Legendary<CR>", description = "Open legendary" },
        },
      })
    end,
  })

  use({
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({})
    end,
  })
end
