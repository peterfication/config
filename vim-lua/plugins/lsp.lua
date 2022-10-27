return function(use)
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require 'nvim-treesitter.configs'.setup({
        ensure_installed = {
          "graphql",
          "hcl",
          "http",
          "javascript",
          "json",
          "lua",
          "ruby",
          "rust",
          "tsx",
          "typescript",
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
      })

      require 'nvim-treesitter.configs'.setup({
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
              ['gfn'] = '@function.outer',
            },
            goto_next_end = {
            },
            goto_previous_start = {
              ['gfp'] = '@function.outer',
            },
            goto_previous_end = {
            },
          },
        },
      })
    end
  }

  -- Show treesitter capture group for textobject under cursor.
  -- TODO: https://github.com/nvim-treesitter/playground
  vim.api.nvim_set_keymap("n", "<Leader>y",
    ":lua print(vim.inspect(vim.treesitter.get_captures_at_cursor(0)))<CR>",
    { noremap = true, silent = false }
  )

  use {
    'simrat39/rust-tools.nvim',
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
          end,
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy"
            },
          },
        },
      })
    end
  }

  -- Folding
  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = function()
      require('ufo').setup()

      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      vim.keymap.set('n', '<Tab>', require('ufo').peekFoldedLinesUnderCursor)
    end
  }

  -- Set up Solargraph
  -- https://github.com/castwide/solargraph
  -- gem install solargraph
  -- https://github.com/castwide/solargraph/issues/87
  -- https://gist.github.com/castwide/28b349566a223dfb439a337aea29713e
  -- https://github.com/iftheshoefritz/solargraph-rails
  -- gem install solargraph-rails
  -- solargraph config
  -- solargraph config => plugins: - solargraph-rails
  -- TODO: https://github.com/williamboman/mason.nvim

  local nvim_lsp = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }

  local settings = {
    sumneko_lua = {
      Lua = {
        runtime = {
          version = 'LuaJIT', -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        },
        diagnostics = {
          globals = { 'vim' }, -- Get the language server to recognize the `vim` global
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true), -- Make the server aware of Neovim runtime files
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }

  local servers = {
    "graphql",
    -- "rust_analyzer", => Done via rust-tools
    "solargraph",
    "sumneko_lua",
    "terraformls",
    "tflint",
    "tsserver",
  }
  for _, lsp in ipairs(servers) do
    local on_attach = function(client, bufnr)
      vim.notify("Buffer " .. bufnr .. " attached to lsp " .. lsp, vim.log.levels.INFO)
      require 'illuminate'.on_attach(client)

      --Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local opts = { noremap = true, silent = true }
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
      -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
      -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
      -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    end


    -- Use a loop to conveniently call 'setup' on multiple servers and
    -- map buffer local keybindings when the language server attaches
    nvim_lsp[lsp].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },
      settings = settings[lsp]
    }

    local options = { noremap = true }
    vim.api.nvim_set_keymap("n", "<Leader>P", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", options)
    vim.api.nvim_set_keymap("n", "<leader>a", "<CMD>lua vim.lsp.buf.code_action()<CR>", options)
  end

  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
          null_ls.builtins.code_actions.gitsigns,
          -- Wait for https://github.com/jose-elias-alvarez/null-ls.nvim/pull/1154
          -- null_ls.builtins.diagnostics.cspell.with({
          --   disabled_filetypes = { "NvimTree" },
          --   diagnostic_config = {
          --     underline = true,
          --     virtual_text = false,
          --     signs = false,
          --     update_in_insert = false,
          --     severity_sort = false,
          --   },
          -- }),
          -- null_ls.builtins.code_actions.cspell,
          null_ls.builtins.formatting.prettier,
        },
      })
    end,
    requires = { "nvim-lua/plenary.nvim" },
  }

  -- A small Neovim plugin for previewing native LSP's goto definition,
  -- type definition, implementation, and references calls in floating windows.
  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup({
        -- https://github.com/rmagatti/goto-preview#%EF%B8%8F-mappings
        -- gpd, gpt, gpi, gpr, gP (without Leader!)
        default_mappings = true
      })
    end
  }
end
