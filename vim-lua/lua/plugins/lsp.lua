return {
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
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
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
              ["glfn"] = "@function.outer",
              ["glcn"] = "@class.outer",
              ["glkn"] = "@conditional.outer",
              ["glln"] = "@loop.outer",
              ["glbn"] = "@block.outer",
              ["glhn"] = "@call.outer",
              ["gljn"] = "@comment.outer",
            },
            goto_next_end = {
              ["glfe"] = "@function.outer",
              ["glce"] = "@class.outer",
              ["glke"] = "@conditional.outer",
              ["glle"] = "@loop.outer",
              ["glbe"] = "@block.outer",
              ["glhe"] = "@call.outer",
              ["glje"] = "@comment.outer",
            },
            goto_previous_start = {
              ["glfp"] = "@function.outer",
              ["glcp"] = "@class.outer",
              ["glkp"] = "@conditional.outer",
              ["gllp"] = "@loop.outer",
              ["glbp"] = "@block.outer",
              ["glhp"] = "@call.outer",
              ["gljp"] = "@comment.outer",
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

      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_previous)

      require("which-key").add({
        -- TODO: https://github.com/nvim-treesitter/playground
        {
          "<leader>y",
          ":lua print(vim.inspect(vim.treesitter.get_captures_at_cursor(0)))<CR>",
          desc = "Show treesitter capture group for text-object under cursor",
        },
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
      local treesitter_context = require("treesitter-context")
      local go_to_parent = function()
        treesitter_context.go_to_context(vim.v.count1)
      end
      local go_to_parent_repeat, _go_to_parent_repeat =
        ts_repeat_move.make_repeatable_move_pair(go_to_parent, go_to_parent)
      vim.keymap.set("n", "gltc", go_to_parent_repeat, { silent = true })
    end,
  },

  {
    "aaronik/treewalker.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      -- movement: Alt + j/k/h/l
      vim.keymap.set({ "n", "v" }, "∆", "<cmd>Treewalker Up<cr>", { silent = true })
      vim.keymap.set({ "n", "v" }, "º", "<cmd>Treewalker Down<cr>", { silent = true })
      vim.keymap.set({ "n", "v" }, "ª", "<cmd>Treewalker Left<cr>", { silent = true })
      vim.keymap.set({ "n", "v" }, "@", "<cmd>Treewalker Right<cr>", { silent = true })

      -- swapping: Alt + Shift + j/k/h/l
      vim.keymap.set("n", "ˆ", "<cmd>Treewalker SwapUp<cr>", { silent = true })
      vim.keymap.set("n", "ı", "<cmd>Treewalker SwapDown<cr>", { silent = true })
      vim.keymap.set("n", "Ó", "<cmd>Treewalker SwapLeft<cr>", { silent = true })
      vim.keymap.set("n", "ﬂ", "<cmd>Treewalker SwapRight<cr>", { silent = true })
    end,
  },

  -- E.g. for Terraform comments
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
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
      local ufo = require("ufo")
      ufo.setup()

      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      require("which-key").add({
        -- TODO: https://github.com/nvim-treesitter/playground
        { "zM", ufo.openAllFolds, desc = "Close all folds" },
        { "zR", ufo.closeAllFolds, desc = "Open all folds" },

        {
          "<Tab>",
          ufo.peekFoldedLinesUnderCursor,
          desc = "Peek in folded lines under cursor (<Tab> again to jump in the preview)",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      "SmiteshP/nvim-navic",
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
      local navic = require("nvim-navic")

      local util = require("lspconfig/util")
      local path = util.path

      local settings = {
        lua_ls = {
          Lua = {
            runtime = {
              version = "LuaJIT", -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            },
            diagnostics = {
              globals = {
                "vim",
                "describe",
                "it",
              },
            },
            workspace = {
              checkThirdParty = false,
              -- library = vim.api.nvim_get_runtime_file("", true), -- Make the server aware of Neovim runtime files
              library = {
                vim.env.VIMRUNTIME,
                "${3rd}/luv/library",
                "${3rd}/busted/library",
                "${3rd}/plenary.nvim/lua",
                "${3rd}/luassert/library",
              },
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
          ruby_ls = {
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
      local root_dir = {
        pylsp = function(fname)
          return nvim_lsp.util.root_pattern(".git")(fname) or util.path.dirname(fname)
        end,
      }
      local before_init = {
        jedi_language_server = function(_, config)
          local match = vim.fn.glob(path.join(config.root_dir, "poetry.lock"))
          if match ~= "" then
            local venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
            vim.env.VIRTUAL_ENV = venv

            python_path = path.join(venv, "bin", "python")
            config.cmd = { python_path, "-m", "jedi_language_server" }
            config.init_options = {
              extra_paths = {
                path.join(venv, "lib", "python3.12", "site-packages"),
              },
            }
          end
        end,
        pylsp = function(_, config)
          local match = vim.fn.glob(path.join(config.root_dir, "poetry.lock"))
          if match ~= "" then
            local venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
            vim.env.VIRTUAL_ENV = venv
            config.cmd = { path.join(venv, "bin", "pylsp") }
            config.init_options = {
              extra_paths = {
                path.join(venv, "lib", "python3.12", "site-packages"),
              },
            }
          end
        end,
      }

      -- Command to set install Python neovim:
      -- uv run pip install neovim
      vim.g.python3_host_prog = vim.fn.expand("$HOME/.venv/bin/python3")

      local servers = {
        "bashls",
        "elixirls",
        "eslint",
        "graphql",
        "jsonls",
        "lua_ls",
        -- "pyright",
        -- "jedi_language_server",
        "pylsp",
        -- "ruby_ls",
        "solargraph",
        "tailwindcss",
        "terraformls",
        "tflint",
        "ts_ls",
        "ruff",
      }

      -- Mappings for LSP
      --
      -- Define the keymaps outside of on_attach so they are only defined and registered once.
      -- They will be registered for all buffers, also the ones without an LSP attached
      -- but that's ok.

      local function dump(o)
        if type(o) == "table" then
          local s = "{ "
          for k, v in pairs(o) do
            if type(k) ~= "number" then
              k = '"' .. k .. '"'
            end
            s = s .. "[" .. k .. "] = " .. dump(v) .. ","
          end
          return s .. "} "
        else
          return tostring(o)
        end
      end

      local function show_line_diagnostics()
        local line_diags = vim.lsp.diagnostic.get_line_diagnostics()
        local Popup = require("nui.popup")
        local event = require("nui.utils.autocmd").event

        local popup = Popup({
          enter = true,
          border = {
            style = "rounded",
          },
          focusable = true,
          position = "50%",
          size = {
            width = "80%",
            height = "60%",
          },
        })

        -- mount/open the component
        popup:mount()

        -- unmount component when cursor leaves buffer
        popup:on(event.BufLeave, function()
          popup:unmount()
        end)

        local bufferLines = {}
        for _, diag in ipairs(line_diags) do
          table.insert(bufferLines, diag.code)
          table.insert(bufferLines, diag.codeDescription.href)
          table.insert(bufferLines, diag.message)
          table.insert(bufferLines, "")
          table.insert(bufferLines, dump(diag))

          table.insert(bufferLines, "")
        end

        -- set content
        vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, bufferLines)
        vim.keymap.set("n", "q", "ZZ", { buffer = popup.bufnr })
      end
      local wk = require("which-key")
      wk.add({
        -- TODO: https://github.com/lukas-reineke/lsp-format.nvim
        { "<Leader>P", "<CMD>lua vim.lsp.buf.format({ async = true })<CR>", desc = "[LSP] format" },

        { "<Leader>a", "<CMD>lua vim.lsp.buf.code_action()<CR>", desc = "[LSP] Code action" },

        { "<Leader>z", group = "LSP" },
        { "<Leader>za", "<CMD>lua vim.lsp.buf.code_action()<CR>", desc = "[LSP] Code action" },
        { "<Leader>zr", "<CMD>lua vim.lsp.buf.rename()<CR>", desc = "[LSP] Rename" },

        { "K", "<CMD>lua vim.lsp.buf.hover()<CR>", desc = "[LSP] Show documentation" },
        { "<Leader>K", show_line_diagnostics, desc = "[LSP] Show line diagnostics" },
        { "<Leader>K", "<CMD>lua vim.diagnostic.open_float()<CR>", desc = "[LSP] Show line diagnostics" },
        -- { "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", desc = "[LSP] Go to definition " },
        -- { "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", desc = "[LSP] Go to implementation" },
        -- { "gr", "<CMD>lua vim.lsp.buf.references()<CR>", desc = "[LSP] Find references" },
        { "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", desc = "[LSP] Go to declaration" },
        { "<Leader>tgd", "<CMD>tab split | lua vim.lsp.buf.definition()<CR>", desc = "[LSP] Go to definition " },
        { "gd", "<CMD>Telescope lsp_definitions<CR>", desc = "[LSP] Find definitions with Telescope" },
        { "gr", "<CMD>Telescope lsp_references<CR>", desc = "[LSP] Find references with Telescope" },
        { "gi", "<CMD>Telescope lsp_implementations<CR>", desc = "[LSP] Find implementations with Telescope" },
      })

      for _, lsp in ipairs(servers) do
        local on_attach = function(client, bufnr)
          vim.notify("Buffer " .. bufnr .. " attached to lsp " .. lsp, vim.log.levels.INFO)
          require("illuminate").on_attach(client)

          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
          end

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

          -- if client.name == "jedi_language_server" then
          --   -- Use these things from pylsp
          --   client.server_capabilities.definitionProvider = false
          --   client.server_capabilities.documentSymbolProvider = false
          --   client.server_capabilities.hoverProvider = false
          --   client.server_capabilities.implementationProvider = false
          --   client.server_capabilities.referencesProvider = false
          --   client.server_capabilities.renameProvider = false
          --
          --   -- codeActionProvider = true,
          --   -- codeLensProvider = { resolveProvider = false },
          --   -- completionProvider = { resolveProvider = true, triggerCharacters = { "." } },
          --   -- documentFormattingProvider = true,
          --   -- documentHighlightProvider = true,
          --   -- documentRangeFormattingProvider = true,
          --   -- executeCommandProvider = { commands = {} },
          --   -- foldingRangeProvider = true,
          --   -- signatureHelpProvider = { triggerCharacters = { "(", ",", "=" } },
          -- end
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
          before_init = before_init[lsp],
          root_dir = root_dir[lsp],
        })

        -- local options = { noremap = true }
        -- vim.api.nvim_set_keymap("n", "<Leader>P", "<CMD>lua vim.lsp.buf.format({ async = true })<CR>", options)
        -- vim.api.nvim_set_keymap("n", "<Leader>a", "<CMD>lua vim.lsp.buf.code_action()<CR>", options)

        -- vim.cmd("autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx")
      end

      vim.api.nvim_create_user_command("LspDiagnoticsVirtualTextDisable", function()
        vim.diagnostic.config({ virtual_text = false })
      end, {})
      vim.api.nvim_create_user_command("LspDiagnoticsVirtualTextEnable", function()
        vim.diagnostic.config({ virtual_text = true })
      end, {})
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
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

  -- {
  --   "chrisgrieser/nvim-various-textobjs",
  --   config = function()
  --     require("various-textobjs").setup({ useDefaultKeymaps = true })
  --   end,
  -- },

  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mrjones2014/legendary.nvim",
      "neovim/nvim-lspconfig",
      "davidmh/cspell.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      local cspell = require("cspell")

      null_ls.setup({
        -- debug = true,
        sources = {
          -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
          null_ls.builtins.code_actions.gitsigns,

          null_ls.builtins.diagnostics.credo,
          null_ls.builtins.diagnostics.haml_lint,
          null_ls.builtins.diagnostics.mypy.with({
            command = "mypy",
            args = function(params)
              return {
                "--hide-error-codes",
                "--hide-error-context",
                "--no-color-output",
                "--show-absolute-path",
                "--show-column-numbers",
                "--show-error-codes",
                "--no-error-summary",
                "--no-pretty",
                "--shadow-file",
                params.bufname,
                params.temp_path,
                params.bufname,
              }
            end,
          }),

          cspell.diagnostics.with({
            config_file_preferred_name = ".cspell.json",
            disabled_filetypes = { "NvimTree" },
            diagnostics_postprocess = function(diagnostic)
              diagnostic.severity = vim.diagnostic.severity["WARN"]
            end,
          }),
          cspell.code_actions,

          null_ls.builtins.formatting.prettier.with({
            extra_filetypes = {
              "haml",
              "ruby",
            },
          }),
          -- prettierd does not work at the moment
          -- null_ls.builtins.formatting.prettierd.with({
          --   extra_filetypes = {
          --     "haml",
          --     "ruby",
          --   },
          -- }),
          null_ls.builtins.formatting.rubocop,
          null_ls.builtins.formatting.rubyfmt,
          null_ls.builtins.formatting.erb_format,
          null_ls.builtins.formatting.stylua,
        },
      })

      require("legendary").commands({
        {
          ":NullLsCspellEnable",
          function()
            null_ls.enable({ name = "cspell" })
          end,
          description = "[NullLS] Enable cspell",
        },
        {
          ":NullLsCspellDisable",
          function()
            null_ls.disable({ name = "cspell" })
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
    -- dir = "~/coding/lua/text-case.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "folke/which-key.nvim",
    },
    config = function()
      require("textcase").setup({})

      require("telescope").load_extension("textcase")

      vim.api.nvim_set_keymap("n", "ga.", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
      vim.api.nvim_set_keymap("v", "ga.", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })

      vim.api.nvim_set_keymap(
        "n",
        "gar",
        "<cmd>lua require('textcase').start_replacing_command_with_part({ parts_count = 1 })<CR>",
        { desc = "Run Subs command for first part of text under cursor" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "ga2r",
        "<cmd>lua require('textcase').start_replacing_command_with_part({ parts_count = 2 })<CR>",
        { desc = "Run Subs command for first part of text under cursor" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "gaR",
        "<cmd>TextCaseStartReplacingCommand<CR>",
        { desc = "Run Subs command for text under cursor" }
      )
      vim.api.nvim_set_keymap(
        "v",
        "gaR",
        "<cmd>TextCaseStartReplacingCommand<CR>",
        { desc = "Run Subs command for text under cursor" }
      )
    end,
  },

  -- Treesitter does not support slim templates
  { "slim-template/vim-slim" },
}
