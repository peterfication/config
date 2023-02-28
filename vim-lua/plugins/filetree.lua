return function(use)
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          float = {
            enable = true,
            open_win_config = {
              relative = "editor",
              border = "rounded",
              width = 100,
              height = 60,
              row = 1,
              col = 75,
            },
          },
        },
      })

      local options = { noremap = true, silent = true }
      vim.keymap.set('n', '<Leader>n', ":NvimTreeToggle<CR>", options)
      vim.keymap.set('n', '<Leader>N', ":NvimTreeFindFile<CR>", options)
    end
  }
end
