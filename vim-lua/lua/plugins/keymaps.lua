return {
  {
    "folke/which-key.nvim",
    dependencies = {
      "mrjones2014/legendary.nvim",
    },
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      require("legendary").setup({
        extensions = {
          nvim_tree = true,
          diffview = true,
          which_key = {
            auto_register = true,
          },
        },
      })

      local wk = require("which-key")
      wk.setup({
        -- triggers = { "<leader>" },
      })

      wk.add({
        -- { "<Leader>", group = "Leader" },
        -- { "<Leader>K", ":WhichKey<CR>", desc = "Open WhichKey" },
        -- { "<Leader>k", ":Legendary<CR>", desc = "Open Legendary" },
        { "g", group = "go to" },
        { "z", group = "folds" },
      })
    end,
  },

  {
    "chrisgrieser/nvim-spider",
    config = function()
      -- Only set it for normal mode, so that when changing a word, it doesn't
      -- interfere with the normal mode keybindings. Alternatively, it could be set to
      -- { "n", "o", "x" } but then changing some.thing to other.thing wouldn't be possible
      -- with cw anymore.
      vim.keymap.set({ "n" }, "w", function()
        require("spider").motion("w")
      end, { desc = "Spider-w" })
      vim.keymap.set({ "n" }, "e", function()
        require("spider").motion("e")
      end, { desc = "Spider-e" })
      vim.keymap.set({ "n" }, "b", function()
        require("spider").motion("b")
      end, { desc = "Spider-b" })
      vim.keymap.set({ "n" }, "ge", function()
        require("spider").motion("ge")
      end, { desc = "Spider-ge" })
    end,
  },
}
