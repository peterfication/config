return {
  -- { "github/copilot.vim" },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = false,
        },
        panel = {
          enabled = false,
        },
      })
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      "copilot.lua",
    },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("legendary").command({
        ":ChatGPTInit",
        function()
          require("chatgpt").setup({
            api_key_cmd = "op read op://Freelancing/6ej4zcr22njqjyjfwcofva7sru/api_key",
            keymaps = {
              close = { "<C-c>" },
              submit = "<C-g>",
              yank_last = "<C-y>",
              yank_last_code = "<C-k>",
              scroll_up = "<C-u>",
              scroll_down = "<C-d>",
              toggle_settings = "<C-o>",
              new_session = "<C-n>",
              cycle_windows = "<Tab>",
              -- in the Sessions pane
              select_session = "<Space>",
              rename_session = "r",
              delete_session = "d",
            },
          })
        end,
        description = "Initialize ChatGPT",
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "mrjones2014/legendary.nvim",
    },
  },
}
