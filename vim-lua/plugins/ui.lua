return function(use)
  use {
    'tinted-theming/base16-vim',
    config = function()
      local vim = vim

      -- Telescope colorscheme with live preview:
      -- :Telescope colorscheme enable_preview=true
      vim.cmd('colorscheme base16-solarized-dark')

      vim.cmd('hi Comment gui=italic cterm=italic')
      vim.cmd('hi! link @symbol SpecialChar')
    end
  }
  use {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure({})
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      vim.cmd [[highlight IndentBlanklineIndent1 guifg=#4a4a4a gui=nocombine]]

      require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = true,
        char_list = { '·', '|', '¦', '┆', '┊', '┊', '┊' },
        char_highlight_list = {
          "IndentBlanklineIndent1",
        },
        -- show_trailing_blankline_indent = true,
      })
    end
  }
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require("bufferline").setup {
        options = {
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
              highlight = "Directory",
            }
          }
        }
      }

      local map = vim.api.nvim_set_keymap
      local options = { noremap = true }

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
      map('n', '<Leader>!', ':tabclose<CR>', options)
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'solarized_dark',
        },
        sections = {
          lualine_b = {
            {
              'branch',
            },
            {
              'diff',
              colored = false,
            },
            {
              'diagnostics',
              colored = false,
            }
          },
          lualine_c = {
            {
              'filename',
              path = 1,
            }
          },
        },
        inactive_sections = {
          lualine_c = {
            {
              'filename',
              path = 1,
            }
          },
        },
      })
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
            hunk.vend = math.min(hunk.added.start, hunk.removed.start) +
                hunk.added.count + hunk.removed.count
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

  use {
    "folke/noice.nvim",
    event = "VimEnter",
    config = function()
      require("noice").setup({
        views = {
          cmdline_popup = {
            position = {
              row = "20%",
            }
          }
        }
      })

      require('lualine').setup({
        sections = {
          lualine_x = {
            'encoding', 'fileformat', 'filetype',
            {
              require("noice").api.statusline.mode.get,
              cond = require("noice").api.statusline.mode.has,
              color = { fg = "#ff9e64" },
            }
          },
        },
      })

      local options = { noremap = true }
      vim.keymap.set('n', '<Leader>MM', ':Noice<CR>', options)
      vim.keymap.set('n', '<Leader>Mf', ':Noice telescope<CR>', options)
      vim.keymap.set('n', '<Leader>MF', ':Noice telescope<CR>', options)
      vim.keymap.set('n', '<Leader>MC', ":lua require('notify').dismiss()<CR>", options)
    end,
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  }

  use {
    'stevearc/dressing.nvim',
    event = 'VimEnter',
    after = 'nui.nvim',
    config = function()
      require("dressing").setup({
        input = {
          get_config = function()
            if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
              return { enabled = false }
            end
          end,
        },
      })
    end
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
end
