return {
  {
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
  },
  {
    "RRethy/vim-illuminate",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function()
      require("illuminate").configure({})

      require("which-key").register({
        ["<Leader>"] = {
          ["<C-m>"] = {
            ':lua require("illuminate").next_reference{wrap=true}<CR>',
            "Go to next LSP reference (via illuminate)",
          },
          ["<C-P"] = {
            ':lua require("illuminate").goto_prev_reference()<CR>',
            "Go to previous LSP reference (via illuminate)",
          },
          ["<C-n>"] = {
            "*:nohlsearch<CR>",
            "Go to next matching word (via search and clear search afterwards)",
          },
          ["<C-p>"] = {
            "*NN:nohlsearch<CR>",
            "Go to previous matching word (via search and clear search afterwards)",
          },
        },
      })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = {
          char = { "·", "|", "¦", "┆", "┊", "┊", "┊" },
          smart_indent_cap = true,
        },
        whitespace = {
          highlight = {
            "Whitespace",
            "NonText",
          },
        },
        scope = {
          highlight = {
            "Function",
            "Label",
          },
        },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "folke/which-key.nvim",
    },
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

      require("which-key").register({
        ["<C-K>"] = {
          ":bnext<CR>",
          "Go to next buffer",
        },
        ["<C-J>"] = {
          ":bprevious<CR>",
          "Go to previous buffer",
        },
        ["<C-C>"] = {
          -- See https://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window
          ":bp<bar>sp<bar>bn<bar>bd<CR>",
          "Close current buffer (but not the window)",
        },
        ["<Leader>"] = {
          ["<C-C>"] = {
            ":bd<CR>",
            "Close current buffer and window",
          },
          ["1"] = { "1gt", "Go to tab 1" },
          ["2"] = { "2gt", "Go to tab 2" },
          ["3"] = { "3gt", "Go to tab 3" },
          ["4"] = { "4gt", "Go to tab 4" },
          ["5"] = { "5gt", "Go to tab 5" },
          ["6"] = { "6gt", "Go to tab 6" },
          ["7"] = { "7gt", "Go to tab 7" },
          ["8"] = { "8gt", "Go to tab 8" },
          ["9"] = { "9gt", "Go to tab 9" },
          ["!"] = { ":tabclose<CR>", "Close current tab" },
        },
      })
    end,
  },

  -- Disabled for as it leads to a slow vim experience
  -- {
  --   "tiagovla/scope.nvim",
  --   config = function()
  --     require("scope").setup()
  --   end,
  -- },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      -- https://github.com/nvim-lualine/lualine.nvim#default-configuration
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
  },

  {
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
  },

  {
    "folke/noice.nvim",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      "folke/which-key.nvim",
    },
    event = "VimEnter",
    config = function()
      require("notify").setup({
        on_open = function(win)
          vim.api.nvim_win_set_option(win, "winblend", 80)
        end,
      })

      require("noice").setup({
        views = {
          cmdline_popup = {
            position = {
              row = "20%",
            },
          },
          notify = {
            win_options = {
              winblend = 80
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

      require("which-key").register({
        ["<Leader>"] = {
          M = {
            name = "Noice",
            M = { ":Noice<CR>", "Open Noice messages" },
            F = { ":Noice telescope<CR>", "Open Noice messages in Telescope" },
            f = { ":Noice telescope<CR>", "Open Noice messages in Telescope" },
            C = { ":lua require('notify').dismiss()<CR>", "Close all Noice messages" },
          },
        },
      })
    end,
  },

  {
    "stevearc/dressing.nvim",
    dependencies = {
      "nui.nvim",
    },
    event = "VimEnter",
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
  },

  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },

  {
    "wfxr/minimap.vim",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function()
      vim.cmd("let g:minimap_git_colors=1")
      vim.cmd("let g:minimap_highlight_search=1")

      require("which-key").register({
        ["<Leader>"] = {
          ["ö"] = { ":MinimapToggle<CR>", "Toggle the minimap" },
        },
      })
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          tailwind = true,
        },
      })
    end,
  },

  -- {
  --   "echasnovski/mini.animate",
  --   branch = "stable",
  --   config = function()
  --     local animate = require("mini.animate")
  --     animate.setup({
  --       cursor = {
  --         timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
  --       },
  --       scroll = {
  --         timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
  --       },
  --       resize = {
  --         enable = false,
  --       },
  --       open = {
  --         enable = false,
  --       },
  --       close = {
  --         enable = false,
  --       },
  --     })
  --   end,
  -- },

  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      -- "anuvyklack/animation.nvim",
      "folke/which-key.nvim",
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false

      require("windows").setup({
        -- autowidth = {
        --   enable = false,
        -- },
      })
      require("which-key").register({
        ["<C-W>z"] = { ":WindowsMaximize<CR>", "Zoom the current window" },
      })
    end,
  },
}
