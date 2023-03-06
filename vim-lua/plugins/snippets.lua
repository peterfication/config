return function(use)
  use({
    "L3MON4D3/LuaSnip",
    tag = "v1.*",
    requires = {
      { "rafamadriz/friendly-snippets" },
      { "saadparwaiz1/cmp_luasnip" },
      {
        "benfowler/telescope-luasnip.nvim",
        module = "telescope._extensions.luasnip",
      },
    },
    config = function()
      require("luasnip").filetype_extend("ruby", { "rails" })
      require("luasnip.loaders.from_vscode").lazy_load()

      vim.api.nvim_set_keymap("n", "<Leader>s", ":Telescope luasnip<CR>", { noremap = true })
    end,
  })
end
