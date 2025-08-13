return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      lazygit = {
        -- See https://github.com/folke/snacks.nvim/blob/main/docs/lazygit.md
      },
    },
    keys = {
      {
        "<Leader>gg",
        function()
          require("snacks").lazygit()
        end,
        desc = "Open LazyGit",
      },
    },
  },
}
