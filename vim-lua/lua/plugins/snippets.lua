return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      { "rafamadriz/friendly-snippets" },
      { "saadparwaiz1/cmp_luasnip" },
      {
        "benfowler/telescope-luasnip.nvim",
        module = "telescope._extensions.luasnip",
      },
      "folke/which-key.nvim",
    },
    config = function()
      require("luasnip").filetype_extend("ruby", { "rails" })
      require("luasnip.loaders.from_vscode").lazy_load()

      require("which-key").add({
        { "<Leader>s", ":Telescope luasnip<CR>", desc = "Open snippets in Telescope" },
      })
    end,
  },
}
