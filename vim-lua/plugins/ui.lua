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
      require("scrollbar").setup({
          marks = {
            GitAdd = {
              text = { "█" },
              priority = 5,
              color = "#89982E",
              cterm = nil,
              highlight = "CursorColumn",
            },
            GitDelete = {
              text = { "█" },
              priority = 5,
              color = "#CB4239",
              cterm = nil,
              highlight = "CursorColumn",
            },
            GitChange = {
              text = { "█" },
              priority = 5,
              color = "#869396",
              cterm = nil,
              highlight = "CursorColumn",
            },
          }
        })

      -- From https://github.com/petertriho/nvim-scrollbar/issues/53#issuecomment-1211225976
      local gitsign = require('gitsigns')
      local gitsign_hunks = require('gitsigns.hunks')

      require('scrollbar.handlers').register('git', function(bufnr)
        local nb_lines = vim.api.nvim_buf_line_count(bufnr)
        local colors_type = {
          add = 'GitAdd',
          delete = 'GitDelete',
          change = 'GitChange',
          changedelete = 'GitChange'
        }

        local lines = {}
        local hunks = gitsign.get_hunks(bufnr)
        if hunks then
          for _, hunk in ipairs(hunks) do
            hunk.vend = math.min(hunk.added.start, hunk.removed.start) + hunk.added.count + hunk.removed.count
            local signs = gitsign_hunks.calc_signs(hunk, 0, nb_lines)
            for _, sign in ipairs(signs) do
              table.insert(lines, {
                  line = sign.lnum,
                  type = colors_type[sign.type]
                })
            end
          end
        end
        return lines
      end)
    end
  }
end
