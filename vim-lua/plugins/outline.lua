return function(use)
  use({
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup({
        close_on_select = true,
        float = {
          relative = "editor",
        },
      })
      vim.keymap.set("n", "<Leader>zo", ":AerialToggle float<CR>", {})
      vim.keymap.set("n", "<Leader>zz", ":Telescope aerial<CR>", {})
    end,
  })
end
