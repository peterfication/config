return {
  {
    "nathom/filetype.nvim",
    config = function()
      require("filetype").setup({
        overrides = {
          extensions = {
            -- Somehow html is not working in my setup
            html = "html",
          },
        },
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "folke/which-key.nvim",
      "RRethy/nvim-treesitter-textsubjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        modules = {},
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        ensure_installed = {
          "bash",
          "elixir",
          "erlang",
          "graphql",
          "gitcommit",
          "hcl",
          "heex", -- Elixir HTML templates
          "html",
          "http",
          "javascript",
          "json",
          "lua",
          "markdown_inline",
          "python",
          "regex",
          "ruby",
          "rust",
          "tsx",
          "typescript",
          "xml",
          "yaml",
        },
        highlight = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          -- keymaps = {
          --   init_selection = 'gnn',
          --   scope_incremental = '<CR>',
          --   node_incremental = '<TAB>',
          --   node_decremental = '<S-TAB>',
          -- },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["aj"] = "@comment.outer",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",
              ["ah"] = "@call.outer",
              ["ih"] = "@call.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["ak"] = "@conditional.outer",
              ["ik"] = "@conditional.inner",
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["gfn"] = "@function.outer",
            },
            goto_next_end = {},
            goto_previous_start = {
              ["gfp"] = "@function.outer",
            },
            goto_previous_end = {},
          },
        },
        textsubjects = {
          enable = true,
          prev_selection = ",", -- (Optional) keymap to select the previous selection
          keymaps = {
            ["."] = "textsubjects-smart",
            [";"] = "textsubjects-container-outer",
            ["i;"] = "textsubjects-container-inner",
          },
        },
      })

      require("which-key").register({
        ["<leader>"] = {
          -- TODO: https://github.com/nvim-treesitter/playground
          y = {
            ":lua print(vim.inspect(vim.treesitter.get_captures_at_cursor(0)))<CR>",
            "Show treesitter capture group for text-object under cursor",
            { noremap = true, silent = false },
          },
        },
      })
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },

  -- Folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "folke/which-key.nvim",
    },
    config = function()
      require("ufo").setup()

      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      require("which-key").register({
        z = {
          -- TODO: https://github.com/nvim-treesitter/playground
          R = { require("ufo").openAllFolds, "Open all folds" },
          M = { require("ufo").closeAllFolds, "Close all folds" },
        },
        ["<Tab>"] = {
          require("ufo").peekFoldedLinesUnderCursor,
          "Peek in folded lines under cursor (<Tab> again to jump in the preview)",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim", opts = {} },
      "simrat39/rust-tools.nvim",
    },
    config = function()
      local plugin = require("lazy.core.config").spec.plugins["neoconf.nvim"]
      require("neoconf").setup(require("lazy.core.plugin").values(plugin, "opts", false))

      local nvim_lsp = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local settings = {
        lua_ls = {
          Lua = {
            runtime = {
              version = "LuaJIT", -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            },
            diagnostics = {
              globals = { "vim" }, -- Get the language server to recognize the `vim` global
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true), -- Make the server aware of Neovim runtime files
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
            format = {
              enable = false,
              -- Put format options here
              -- NOTE: the value should be STRING!!
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
              },
            },
          },
        },
        jsonls = {
          settings = {
            json = {
              format = {
                enable = true,
              },
              -- schemas = require("schemastore").json.schemas(),
              -- validate = { enable = true },
            },
          },
        },
        settings = {
          solargraph = {
            autoformat = true,
            completion = true,
            diagnostic = true,
            folding = true,
            references = true,
            rename = true,
            symbols = true,
          },
        },
      }
      local cmd = {
        elixirls = { "elixir-ls" },
      }

      local servers = {
        "elixirls",
        "eslint",
        "graphql",
        "jsonls",
        "pyright",
        "solargraph",
        "lua_ls",
        "tailwindcss",
        "terraformls",
        "tflint",
        "tsserver",
        -- "rust_analyzer", => Done via rust-tools
      }

      -- Mappings for LSP
      --
      -- Define the keymaps outside of on_attach so they are only defined and registered once.
      -- They will be registered for all buffers, also the ones without an LSP attached
      -- but that's ok.
      local wk = require("which-key")
      local options = { noremap = true }
      wk.register({
        g = {
          D = { "<CMD>lua vim.lsp.buf.declaration()<CR>", "[LSP] Go to declaration", options },
          d = { "<CMD>lua vim.lsp.buf.definition()<CR>", "[LSP] Go to definition ", options },
          i = { "<CMD>lua vim.lsp.buf.implementation()<CR>", "[LSP] Go to implementation", options },
          r = { "<CMD>lua vim.lsp.buf.references()<CR>", "[LSP] Find references", options },
        },

        K = { "<CMD>lua vim.lsp.buf.hover()<CR>", "[LSP] Show documentation", options },

        ["<leader>"] = {
          a = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "[LSP] Code action", options },
          -- TODO: https://github.com/lukas-reineke/lsp-format.nvim
          P = { "<CMD>lua vim.lsp.buf.format({ async = true })<CR>", "[LSP] format", options },
          z = {
            name = "+LSP",
            a = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "[LSP] Code action", options },
            r = { "<CMD>lua vim.lsp.buf.rename()<CR>", "[LSP] Rename", options },
          },
        },
      })

      for _, lsp in ipairs(servers) do
        local on_attach = function(client, bufnr)
          vim.notify("Buffer " .. bufnr .. " attached to lsp " .. lsp, vim.log.levels.INFO)
          require("illuminate").on_attach(client)

          --Enable completion triggered by <c-x><c-o>
          vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

          -- Mappings.
          -- wk.register({
          --   g = {
          --     D = { "<CMD>lua vim.lsp.buf.declaration()<CR>", "LSP go to declaration", noremap = true, buffer = bufnr },
          --     d = {
          --       "<CMD>lua vim.lsp.buf.definition()<CR>",
          --       "LSP go to definition " .. bufnr,
          --       noremap = true,
          --       buffer = bufnr,
          --     },
          --     i = {
          --       "<CMD>lua vim.lsp.buf.implementation()<CR>",
          --       "LSP go to implementation",
          --       noremap = true,
          --       buffer = bufnr,
          --     },
          --     r = { "<CMD>lua vim.lsp.buf.references()<CR>", "LSP find references", noremap = true, buffer = bufnr },
          --   },

          --   K = { "<CMD>lua vim.lsp.buf.hover()<CR>", "LSP Show documentation", noremap = true, buffer = bufnr },

          --   ["<leader>"] = {
          --     z = {
          --       r = { "<CMD>lua vim.lsp.buf.rename()<CR>", "LSP rename", noremap = true, buffer = bufnr },
          --     },
          --   },
          -- })
          -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
          -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
          -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
          -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
          -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
          -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
          -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
          -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
          -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
          -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
        end

        -- Use a loop to conveniently call 'setup' on multiple servers and
        -- map buffer local keybindings when the language server attaches
        nvim_lsp[lsp].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          flags = {
            debounce_text_changes = 150,
          },
          settings = settings[lsp],
          cmd = cmd[lsp],
        })

        -- local options = { noremap = true }
        -- vim.api.nvim_set_keymap("n", "<Leader>P", "<CMD>lua vim.lsp.buf.format({ async = true })<CR>", options)
        -- vim.api.nvim_set_keymap("n", "<Leader>a", "<CMD>lua vim.lsp.buf.code_action()<CR>", options)

        -- vim.cmd("autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx")
      end
    end,
  },

  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local elixir = require("elixir")

      elixir.setup({
        nextls = {
          enable = true,
        },
        credo = {
          enable = true,
        },
        elixirls = {
          enable = true,
        },
      })
    end,
  },

  {
    "chrisgrieser/nvim-various-textobjs",
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true })
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mrjones2014/legendary.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        -- debug = true,
        sources = {
          -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
          null_ls.builtins.code_actions.gitsigns,

          null_ls.builtins.diagnostics.credo,
          null_ls.builtins.diagnostics.haml_lint,
          null_ls.builtins.formatting.stylua,

          null_ls.builtins.diagnostics.cspell.with({
            disabled_filetypes = { "NvimTree" },
            diagnostic_config = {
              underline = true,
              virtual_text = false,
              signs = false,
              update_in_insert = false,
              severity_sort = false,
            },
          }),
          null_ls.builtins.code_actions.cspell,
          null_ls.builtins.code_actions.eslint_d,

          null_ls.builtins.formatting.eslint_d,
          null_ls.builtins.formatting.autopep8,
          null_ls.builtins.formatting.prettier.with({
            extra_filetypes = {
              "haml",
              "ruby",
            },
          }),
        },
      })

      require("legendary").commands({
        {
          ":NullLsCspellEnable",
          function()
            require("null-ls").enable({ name = "cspell" })
          end,
          description = "[NullLS] Enable cspell",
        },
        {
          ":NullLsCspellDisable",
          function()
            require("null-ls").disable({ name = "cspell" })
          end,
          description = "[NullLS] Disable cspell",
        },
      })
    end,
  },

  -- A small Neovim plugin for previewing native LSP's goto definition,
  -- type definition, implementation, and references calls in floating windows.
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup({
        -- https://github.com/rmagatti/goto-preview#%EF%B8%8F-mappings
        -- gpd, gpt, gpi, gpr, gP (without Leader!)
        default_mappings = true,
      })
    end,
  },

  {
    "johmsalas/text-case.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "folke/which-key.nvim",
    },
    config = function()
      require("textcase").setup({})

      require("telescope").load_extension("textcase")

      vim.api.nvim_set_keymap("n", "ga.", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
      vim.api.nvim_set_keymap("v", "ga.", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })

      vim.api.nvim_set_keymap("n", "gau", ":lua require('textcase').operator('to_upper_case')<CR>", {})
      vim.api.nvim_set_keymap("n", "gal", ":lua require('textcase').operator('to_lower_case')<CR>", {})
      vim.api.nvim_set_keymap("n", "gas", ":lua require('textcase').operator('to_snake_case')<CR>", {})
      vim.api.nvim_set_keymap("n", "gad", ":lua require('textcase').operator('to_dash_case')<CR>", {})
      vim.api.nvim_set_keymap("n", "gan", ":lua require('textcase').operator('to_constant_case')<CR>", {})
      vim.api.nvim_set_keymap("n", "gad", ":lua require('textcase').operator('to_dot_case')<CR>", {})
      vim.api.nvim_set_keymap("n", "gaa", ":lua require('textcase').operator('to_phrase_case')<CR>", {})
      vim.api.nvim_set_keymap("n", "gac", ":lua require('textcase').operator('to_camel_case')<CR>", {})
      vim.api.nvim_set_keymap("n", "gap", ":lua require('textcase').operator('to_pascal_case')<CR>", {})
      vim.api.nvim_set_keymap("n", "gat", ":lua require('textcase').operator('to_title_case')<CR>", {})
      vim.api.nvim_set_keymap("n", "gaf", ":lua require('textcase').operator('to_path_case')<CR>", {})
    end,
  },

  -- LSP breadcrumbs
  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-web-devicons",
    },
    config = function()
      require("barbecue").setup({
        attach_navic = false,
        exclude_filetypes = { "netrw", "toggleterm", "graphql" },
      })
    end,
  },
  -- Treesitter does not support slim templates
  { "slim-template/vim-slim" },
}
