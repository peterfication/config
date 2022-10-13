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
  use {
    'ggandor/leap.nvim',
    requires = {
      { 'ggandor/flit.nvim' }
    },
    config = function()
      require('leap').add_default_mappings()
      require('flit').setup {}
    end
  }
end
