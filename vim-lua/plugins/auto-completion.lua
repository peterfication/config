return function(use)
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
    },
    after = "LuaSnip",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      if not cmp then
        return
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            if not luasnip then
              return
            end

            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        -- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
          { name = "path" },
          -- { name = 'cmdline' },
        }),
      })

      -- Set configuration for specific filetype.
      -- cmp.setup.filetype('gitcommit', {
      --         sources = cmp.config.sources({
      --                 { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you installed it.
      --             }, {
      --                 { name = 'buffer' },
      --             })
      --     })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  })
end
