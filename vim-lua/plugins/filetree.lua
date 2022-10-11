return function(use)
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("nvim-tree").setup()

      vim.keymap.set('n', '<Leader>n', ":NvimTreeToggle<CR>", { noremap = true })
      vim.keymap.set('n', '<Leader>N', ":NvimTreeFindFile<CR>", { noremap = true })
    end
  }
end
