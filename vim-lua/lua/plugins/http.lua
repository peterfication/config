return {
  -- For examples, see https://github.com/rest-nvim/rest.nvim/tree/main/tests
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  -- Disable for now as it is not maintained anymore
  -- {
  --   "rest-nvim/rest.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "folke/which-key.nvim",
  --     "luarocks.nvim",
  --   },
  --   ft = "http",
  --   config = function()
  --     require("rest-nvim").setup({
  --       -- Highlight request on run
  --       -- result = {
  --       --   behavior = {
  --       --     formatters = {
  --       --       vnd = "jq",
  --       --     },
  --       --   },
  --       -- },
  --     })
  --
  --     require("which-key").add({
  --       { "<Leader>r", group = "REST client" },
  --       { "<Leader>rr", "<Plug>RestNvim", "Run the REST request under the cursor" },
  --       { "<Leader>rp", "<Plug>RestPreviewNvim", "Preview the REST request under the cursor" },
  --     })
  --
  --     -- vim.cmd("command! RestNvim lua require('rest-nvim').run()")
  --     -- vim.cmd("command! RestNvimPreview lua require('rest-nvim').run(true)")
  --   end,
  -- },
}
