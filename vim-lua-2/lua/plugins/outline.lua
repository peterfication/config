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

      require("which-key").register({
        ["<Leader>"] = {
          z = {
            name = "Tags",
            o = { ":AerialToggle float<CR>", "Toggle Aerial to select (LSP) tags" },
            z = { ":Telescope aerial<CR>", "Open Aerial (LSP) tags in Telescope" },
          },
        },
      })
    end,
  },
}
