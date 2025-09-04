return {
  {
    "s1n7ax/nvim-window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        hint = "floating-big-letter",
        show_prompt = false,
        filter_func = function(window_ids, _filters)
          -- Filter out floating windows (e.g. Telescope preview)
          -- The Telescope preview can't be targeted by a certain filetype because it's
          -- just a normal buffer.
          local filtered_window_ids = {}
          for _, window_id in ipairs(window_ids) do
            local is_floating = vim.api.nvim_win_get_config(window_id).relative ~= ""
            if not is_floating then
              table.insert(filtered_window_ids, window_id)
            end
          end

          return filtered_window_ids
        end,
        filter_rules = {
          bo = {
            filetype = {
              "TelescopePrompt",
              "TelescopeResults",
              "NvimTree",
              "neo-tree",
              "notify",
              "snacks_notif",
            },
          },
        },
      })
    end,
  },
  -- {
  --   "tinted-theming/base16-vim",
  --   config = function()
  --     local vim = vim

  --     -- Telescope colorscheme with live preview:
  --     -- :Telescope colorscheme enable_preview=true
  --     vim.cmd("colorscheme base16-solarized-dark")

  --     -- "Fix" missing Neovim 0.10 colors
  --     vim.cmd("hi! link WinSeparator VertSplit")
  --     vim.cmd([[ call Base16hi("NormalFloat", g:base16_gui05, g:base16_gui00, g:base16_cterm05, g:base16_gui00, "bold,italic", "") ]])

  --     vim.cmd("hi Comment gui=italic cterm=italic")
  --     vim.cmd("hi! link @symbol SpecialChar")

  --     vim.cmd("hi ErrorHighlight gui=undercurl cterm=undercurl")
  --     vim.cmd("hi WarningHighlight gui=undercurl cterm=undercurl")
  --     vim.cmd("hi InfoHighlight gui=undercurl cterm=undercurl")
  --     vim.cmd("hi HintHighlight gui=undercurl cterm=undercurl")
  --     vim.cmd("hi OkHighlight gui=undercurl cterm=undercurl")
  --   end,
  -- },
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark" -- or 'light'

      require("solarized").setup({
        palette = "solarized", -- solarized or selenized
        -- variant = 'winter', -- "spring" | "summer" | "autumn" | "winter" (default)
        -- theme = "neo", -- default or neo

        on_colors = function(colors, _colorhelper)
          return {
            magenta = "#6c70be",
          }
        end,

        highlights = function(colors, _colorhelper)
          -- colors, see https://github.com/maxmx03/solarized.nvim/blob/main/lua/solarized/palette.lua
          -- dark = {
          --   base03 = '#002b36', -- background tone dark (main)
          --   base02 = '#073642', -- background tone (highlight/menu/LineNr)
          --   base01 = '#586e75', -- content tone (comment)
          --   base00 = '#657b83', -- content tone (winseparator)
          --   base0 = '#839496', -- content tone (foreground)
          --   base1 = '#93a1a1', -- content tone (statusline/tabline)
          --   base2 = '#eee8d5', -- background tone light (highlight)
          --   base3 = '#fdf6e3', -- background tone lighter (main)
          --   -- accent
          --   yellow = '#b58900',
          --   orange = '#cb4b16',
          --   red = '#dc322f',
          --   magenta = '#d33682',
          --   violet = '#6c71c4',
          --   blue = '#268bd2',
          --   cyan = '#2aa198',
          --   green = '#859900',
          --   -- git
          --   add = '#859900',
          --   change = '#b58900',
          --   delete = '#dc322f',
          --   -- diagnostic
          --   info = '#268bd2',
          --   hint = '#859900',
          --   warning = '#b58900',
          --   error = '#dc322f',
          -- },
          -- colorhelper see https://github.com/maxmx03/solarized.nvim/blob/main/lua/solarized/utils/colors.lua
          -- local darken = colorhelper.darken
          -- local lighten = colorhelper.lighten
          -- local blend = colorhelper.blend

          return {
            SpecialKey = { fg = colors.yellow },
            Title = { fg = colors.base0 },
            DiagnosticUnderlineError = { fg = "none", undercurl = true },
            DiagnosticUnderlineWarn = { fg = "none", undercurl = true },
            DiagnosticUnderlineInfo = { fg = "none", undercurl = true },
            DiagnosticUnderlineHint = { fg = "none", undercurl = true },
            DiagnosticUnderlineOk = { fg = "none", undercurl = true },
          }
        end,
      })

      vim.cmd.colorscheme("solarized")

      -- Commands to change background between dark to light
      vim.api.nvim_create_user_command("ColorschemeDark", function()
        vim.o.background = "dark"
      end, {})
      vim.api.nvim_create_user_command("ColorschemeLight", function()
        vim.o.background = "light"
      end, {})
      vim.api.nvim_create_user_command("ColorschemeToggle", function()
        if vim.o.background == "dark" then
          vim.o.background = "light"
        else
          vim.o.background = "dark"
        end
      end, {})
    end,
  },
  {
    "RRethy/vim-illuminate",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function()
      require("illuminate").configure({})

      require("which-key").add({
        {
          "<C-p>",
          ':lua require("illuminate").goto_prev_reference()<CR>',
          desc = "Go to previous LSP reference (via illuminate)",
        },
        {
          "<C-n>",
          ':lua require("illuminate").next_reference{wrap=true}<CR>',
          desc = "Go to next LSP reference (via illuminate)",
        },
        {
          "<Leader><C-n>",
          "*:nohlsearch<CR>",
          desc = "Go to next matching word (via search and clear search afterwards)",
        },
        {
          "<Leader><C-p>",
          "*NN:nohlsearch<CR>",
          desc = "Go to previous matching word (via search and clear search afterwards)",
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

      require("which-key").add({
        -- See https://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window
        { "<C-C>", ":bp<bar>sp<bar>bn<bar>bd<CR>", desc = "Close current buffer (but not the window)" },
        { "<Leader><C-C>", ":bd<CR>", desc = "Close current buffer and window" },

        { "<C-J>", ":bprevious<CR>", desc = "Go to previous buffer" },
        { "<C-K>", ":bnext<CR>", desc = "Go to next buffer" },

        { "<Leader>!", ":tabclose<CR>", desc = "Close current tab" },
        { "<Leader>1", "1gt", desc = "Go to tab 1" },
        { "<Leader>2", "2gt", desc = "Go to tab 2" },
        { "<Leader>3", "3gt", desc = "Go to tab 3" },
        { "<Leader>4", "4gt", desc = "Go to tab 4" },
        { "<Leader>5", "5gt", desc = "Go to tab 5" },
        { "<Leader>6", "6gt", desc = "Go to tab 6" },
        { "<Leader>7", "7gt", desc = "Go to tab 7" },
        { "<Leader>8", "8gt", desc = "Go to tab 8" },
        { "<Leader>9", "9gt", desc = "Go to tab 9" },
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
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "SmiteshP/nvim-navic",
    },
    config = function()
      -- https://github.com/nvim-lualine/lualine.nvim#default-configuration

      local file_status_symbol = {
        modified = "",
        readonly = "",
        new = "",
        unnamed = "󰽤",
      }

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
        winbar = {
          lualine_a = {
            { "filename", path = 1, symbols = file_status_symbol },
          },
          lualine_c = {
            {
              "navic"
            },
          },
          lualine_x = {
            function()
              return " "
            end,
            -- this is to avoid annoying highlight (high contrast color)
            -- when no winbar_symbol, diagnostics and diff is available.
            { "diagnostics", sources = { "nvim_diagnostic" } },
            "diff",
          },
        },
        inactive_winbar = {
          lualine_a = {
            { "filetype", icon_only = true },
            { "filename", path = 0, symbols = file_status_symbol },
          },
          lualine_x = {
            { "diagnostics", sources = { "nvim_diagnostic" } },
            "diff",
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
          -- The default GitSigns highlight settings in nvim-scrollbar are not up to date anymore
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
        top_down = false,
        on_open = function(win)
          -- vim.api.nvim_win_set_option(win, "winblend", 80)
        end,
      })

      require("noice").setup({
        views = {
          cmdline_popup = {
            position = {
              row = "20%",
            },
          },
          -- notify = {
          --   win_options = {
          --     winblend = 80
          --   },
          -- },
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

      require("which-key").add({
        { "<Leader>M", group = "Noice" },
        { "<Leader>MC", ":lua require('notify').dismiss()<CR>", desc = "Close all Noice messages" },
        { "<Leader>MF", ":Noice telescope<CR>", desc = "Open Noice messages in Telescope" },
        { "<Leader>MM", ":Noice<CR>", desc = "Open Noice messages" },
        { "<Leader>Mf", ":Noice telescope<CR>", desc = "Open Noice messages in Telescope" },
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

      require("which-key").add({
        { "<Leader>ö", ":MinimapToggle<CR>", desc = "Toggle the minimap" },
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
      require("which-key").add({
        { "<C-W>z", ":WindowsMaximize<CR>", desc = "Zoom the current window" },
      })
    end,
  },
}
