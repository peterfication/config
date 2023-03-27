return function(use)
  use({
    "tinted-theming/base16-vim",
    config = function()
      local vim = vim

      -- Telescope colorscheme with live preview:
      -- :Telescope colorscheme enable_preview=true
      vim.cmd("colorscheme base16-solarized-dark")

      vim.cmd("hi Comment gui=italic cterm=italic")
      vim.cmd("hi! link @symbol SpecialChar")

      vim.cmd("hi ErrorHighlight gui=undercurl cterm=undercurl")
      vim.cmd("hi WarningHighlight gui=undercurl cterm=undercurl")
      vim.cmd("hi InfoHighlight gui=undercurl cterm=undercurl")
      vim.cmd("hi HintHighlight gui=undercurl cterm=undercurl")
      vim.cmd("hi OkHighlight gui=undercurl cterm=undercurl")
    end,
  })
  use({
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({})

      local map = vim.api.nvim_set_keymap
      local options = { noremap = true, silent = true }
      map("n", "<Leader><C-m>", ':lua require"illuminate".next_reference{wrap=true}<CR>', options)
      map("n", "<Leader><C-P>", ':lua require"illuminate".goto_prev_reference()<CR>', options)
      map("n", "<Leader><C-n>", "*:nohlsearch<CR>", options)
      map("n", "<Leader><C-p>", "*NN:nohlsearch<CR>", options)
    end,
  })

  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      vim.cmd([[highlight IndentBlanklineIndent1 guifg=#4a4a4a gui=nocombine]])

      require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = true,
        char_list = { "·", "|", "¦", "┆", "┊", "┊", "┊" },
        char_highlight_list = {
          "IndentBlanklineIndent1",
        },
        -- show_trailing_blankline_indent = true,
      })
    end,
  })
  use({
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level, _diagnostics_dict, _context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
              highlight = "Directory",
            },
          },
        },
      })

      local map = vim.api.nvim_set_keymap
      local options = { noremap = true, silent = true }

      -- Cycle through open buffers
      map("n", "<C-K>", ":bnext<CR>", options)
      map("n", "<C-J>", ":bprevious<CR>", options)

      -- Close current buffer
      -- See https://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window
      map("n", "<C-C>", ":bp<bar>sp<bar>bn<bar>bd<CR>", options)
      map("n", "<Leader><C-C>", ":bd<CR>", options)

      -- Tab navigation
      map("n", "<Leader>1", "1gt", options)
      map("n", "<Leader>2", "2gt", options)
      map("n", "<Leader>3", "3gt", options)
      map("n", "<Leader>4", "4gt", options)
      map("n", "<Leader>5", "5gt", options)
      map("n", "<Leader>6", "6gt", options)
      map("n", "<Leader>7", "7gt", options)
      map("n", "<Leader>8", "8gt", options)
      map("n", "<Leader>9", "9gt", options)
      map("n", "<Leader>!", ":tabclose<CR>", options)
    end,
  })

  use({
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
    end,
  })

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "solarized_dark",
        },
        sections = {
          lualine_b = {
            {
              "branch",
            },
            {
              "diff",
              colored = false,
            },
          },
          lualine_c = {
            {
              "filename",
              path = 1,
            },
          },
          lualine_x = {
            "diagnostics",
            "encoding",
            "fileformat",
            "filetype",
          },
        },
        inactive_sections = {
          lualine_c = {
            {
              "filename",
              path = 1,
            },
          },
        },
      })
    end,
  })

  use({
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup({
        marks = {
          -- The default GitSigns hightlight settings in nvim-scrollbar are not up to date anymore
          GitAdd = {
            highlight = "GitAddSign",
          },
          GitChange = {
            highlight = "GitChangeSign",
          },
          GitDelete = {
            highlight = "GitChangeSign",
          },
        },
      })
    end,
  })

  use({
    "folke/noice.nvim",
    event = "VimEnter",
    config = function()
      require("noice").setup({
        views = {
          cmdline_popup = {
            position = {
              row = "20%",
            },
          },
        },
      })

      require("lualine").setup({
        sections = {
          lualine_x = {
            "encoding",
            "fileformat",
            "filetype",
            {
              require("noice").api.statusline.mode.get,
              cond = require("noice").api.statusline.mode.has,
              color = { fg = "#ff9e64" },
            },
          },
        },
      })

      local options = { noremap = true, silent = true }
      vim.keymap.set("n", "<Leader>MM", ":Noice<CR>", options)
      vim.keymap.set("n", "<Leader>Mf", ":Noice telescope<CR>", options)
      vim.keymap.set("n", "<Leader>MF", ":Noice telescope<CR>", options)
      vim.keymap.set("n", "<Leader>MC", ":lua require('notify').dismiss()<CR>", options)
    end,
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  })

  use({
    "stevearc/dressing.nvim",
    event = "VimEnter",
    after = "nui.nvim",
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
    end,
  })

  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })

  use({
    "wfxr/minimap.vim",
    config = function()
      vim.cmd("let g:minimap_git_colors=1")
      vim.cmd("let g:minimap_highlight_search=1")

      local options = { noremap = true, silent = true }
      vim.keymap.set("n", "<Leader>ö", ":MinimapToggle<CR>", options)
    end,
  })

  use({
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          tailwind = true,
        },
      })
    end,
  })
end
