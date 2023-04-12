return function(use)
  -- use({ "github/copilot.vim" })
  use({
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
  })

  use({
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  })

  use({
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
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
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  })
end
