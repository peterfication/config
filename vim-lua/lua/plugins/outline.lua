return {
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function()
      require("aerial").setup({
        close_on_select = true,
        float = {
          relative = "editor",
        },
      })

      require("which-key").add({
        { "<Leader>zo", ":AerialToggle float<CR>", desc = "Toggle Aerial to select (LSP) tags" },
        { "<Leader>zz", ":Telescope aerial<CR>", desc = "Open Aerial (LSP) tags in Telescope" },
      })
    end,
  },
}
