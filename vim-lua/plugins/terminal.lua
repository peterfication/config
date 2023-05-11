return function(use)
  use({
    "akinsho/toggleterm.nvim",
    -- tag = "*",
    requires = {
      "folke/which-key.nvim",
    },
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-t>]],
        direction = "float",
      })

      require("which-key").register({
        ["<Leader>"] = {
          ["t1"] = { "<CMD>ToggleTerm 1<CR>", "Open terminal 1" },
          ["t2"] = { "<CMD>ToggleTerm 2<CR>", "Open terminal 2" },
          ["t3"] = { "<CMD>ToggleTerm 3<CR>", "Open terminal 3" },
          ["t4"] = { "<CMD>ToggleTerm 4<CR>", "Open terminal 4" },
          ["t5"] = { "<CMD>ToggleTerm 5<CR>", "Open terminal 5" },
          ["t6"] = { "<CMD>ToggleTerm 6<CR>", "Open terminal 6" },
          ["t7"] = { "<CMD>ToggleTerm 7<CR>", "Open terminal 7" },
          ["t8"] = { "<CMD>ToggleTerm 8<CR>", "Open terminal 8" },
          ["t9"] = { "<CMD>ToggleTerm 9<CR>", "Open terminal 9" },
        },
      })

      require("which-key").register({
        -- NOTE: <Leader><ESC> would be a nice mapping but this will mess with spaces that
        -- that you want to enter.
        ["<C-Space>"] = { [[<C-\><C-n>]], "In terminal, go from INSERT to NORMAL mode" },
      }, { mode = "t" })
    end,
  })
end
