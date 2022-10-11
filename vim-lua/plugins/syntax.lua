return function(use)
  use {
    'base16-project/base16-vim',
    config = function()
      local vim = vim

      vim.cmd('set termguicolors')
      vim.cmd('colorscheme base16-solarized-dark')
      vim.cmd('hi Comment gui=italic cterm=italic')
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local configs = require'nvim-treesitter.configs'

      configs.setup {
       highlight = {
         enable = true,
       }
     }
    end
  }
end
