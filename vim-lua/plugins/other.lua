return function(use)
  use { 'editorconfig/editorconfig-vim' }
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-abolish' }
  use { 'tpope/vim-repeat' }
  use { 'mg979/vim-visual-multi' }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }
  use { 'windwp/nvim-ts-autotag' }
  use { 'p00f/nvim-ts-rainbow' }
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
  use {
    'rcarriga/nvim-notify',
    config = function ()
      require('notify').setup()
    end
  }
end
