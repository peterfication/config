return function(use)
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true

      require("bufferline").setup{
        options = {
          offsets = {
            {
                filetype = "nerdtree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            }
          }
        }
      }

      local map = vim.api.nvim_set_keymap

      -- Cycle through open buffers
      map('n', '<C-K>', ':bnext<CR>', options)
      map('n', '<C-J>', ':bprevious<CR>', options)

      -- Close current buffer
      map('n', '<C-C>', ':bd<CR>', options)

      -- Tab navigation
      map('n', '<Leader>1', '1gt', options)
      map('n', '<Leader>2', '2gt', options)
      map('n', '<Leader>3', '3gt', options)
      map('n', '<Leader>4', '4gt', options)
      map('n', '<Leader>5', '5gt', options)
    end
  }

  use {
    'vim-airline/vim-airline',
    requires = 'vim-airline/vim-airline-themes',
    config = function()
      vim.g.airline_powerline_fonts = 1
      vim.g.airline_theme = 'molokai'
    end
  }

  use {
    'petertriho/nvim-scrollbar',
    config = function()
      require("scrollbar").setup()
    end
  }
end
