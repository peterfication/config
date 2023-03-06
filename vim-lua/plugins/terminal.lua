return function(use)
  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-t>]],
        direction = "float",
      })

      -- Terminal key mappings
      -- Go from Insert mode (default in Terminal) back to Normal mode
      -- NOTE: <Leader><ESC> would be a nice mapping but this will mess with spaces that
      -- that you want to enter.
      vim.keymap.set("t", "<C-e>", [[<C-\><C-n>]], { noremap = true })
      vim.keymap.set("t", "<C-Space>", [[<C-\><C-n>]], { noremap = true })
      vim.keymap.set("n", "<Leader>t1", "<CMD>ToggleTerm 1<CR>", { noremap = true })
      vim.keymap.set("n", "<Leader>t2", "<CMD>ToggleTerm 2<CR>", { noremap = true })
      vim.keymap.set("n", "<Leader>t4", "<CMD>ToggleTerm 3<CR>", { noremap = true })
      vim.keymap.set("n", "<Leader>t5", "<CMD>ToggleTerm 3<CR>", { noremap = true })
      vim.keymap.set("n", "<Leader>t6", "<CMD>ToggleTerm 3<CR>", { noremap = true })
      vim.keymap.set("n", "<Leader>t7", "<CMD>ToggleTerm 3<CR>", { noremap = true })
      vim.keymap.set("n", "<Leader>t8", "<CMD>ToggleTerm 3<CR>", { noremap = true })
      vim.keymap.set("n", "<Leader>t9", "<CMD>ToggleTerm 3<CR>", { noremap = true })
    end,
  })
end
