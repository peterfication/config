return function(use)
  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-t>]],
        direction = "float",
      })

      -- Terminal key mappings
      -- Go from Insert mode (default in Terminal) back to Normal mode
      -- NOTE: <Leader><ESC> would be a nice mapping but this will mess with spaces that
      -- that you want to enter.
      vim.keymap.set('t', '<C-e>', [[<C-\><C-n>]], { noremap = true })
    end
  }
end
