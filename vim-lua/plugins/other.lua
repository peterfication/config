return function(use)
  use { 'editorconfig/editorconfig-vim' }
  use { 'tpope/vim-commentary' }
  use {
    'kylechui/nvim-surround',
    tag = "*",
    config = function()
      require("nvim-surround").setup({})
    end
  }
end
