return function(use)
  use({ "tpope/vim-commentary" })
  use({ "tpope/vim-abolish" })
  use({ "tpope/vim-repeat" })
  use({
    "simnalamburt/vim-mundo",
    requires = {
      "folke/which-key.nvim",
    },
    config = function()
      require("which-key").register({
        ["<Leader>"] = {
          u = { ":MundoToggle<CR>", "Open undo tree with Mundo" },
        },
      })
    end,
  })
  use({ "mg979/vim-visual-multi" })
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })
  use({ "windwp/nvim-ts-autotag" })
  use({
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
      require("nvim-surround").setup({})
    end,
  })
  use({
    "ggandor/leap.nvim",
    requires = {
      { "ggandor/flit.nvim" },
    },
    config = function()
      require("leap").add_default_mappings()
      require("flit").setup({})
    end,
  })
  use({
    "yorickpeterse/nvim-window",
    requires = {
      "folke/which-key.nvim",
    },

    config = function()
      require("nvim-window").setup({
        border = "double",
      })

      require("which-key").register({
        ["<Leader>"] = {
          W = { ":lua require('nvim-window').pick()<CR>", "Select window via a letter" },
        },
      })
    end,
  })

  -- Global search and replace
  use({
    "nvim-pack/nvim-spectre",
    requires = {
      "folke/which-key.nvim",
    },
    config = function()
      require("spectre").setup({
        open_cmd = "tabnew",
      })

      require("which-key").register({
        ["<Leader>"] = {
          R = {
            ":Spectre<CR>",
            "Search and replace with spectre",
          },
        },
      })
    end,
  })
  -- Highlight Search Lens
  -- use {
  --   'kevinhwang91/nvim-hlslens',
  --   config = function()
  --     local kopts = { noremap = true, silent = true }

  --     vim.api.nvim_set_keymap('n', 'n',
  --       [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
  --       kopts)
  --     vim.api.nvim_set_keymap('n', 'N',
  --       [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
  --       kopts)
  --     vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  --     vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
  --     vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  --     vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

  --     vim.api.nvim_set_keymap('n', '<Leader>l', ':noh<CR>', kopts)
  --   end
  -- }

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })
end
