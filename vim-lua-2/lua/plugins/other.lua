return {

  { "tpope/vim-commentary" },
  { "tpope/vim-abolish" },
  { "tpope/vim-repeat" },
  {
    "simnalamburt/vim-mundo",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function()
      require("which-key").register({
        ["<Leader>"] = {
          u = { ":MundoToggle<CR>", "Open undo tree with Mundo" },
        },
      })
    end,
  },
  { "mg979/vim-visual-multi" },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  { "windwp/nvim-ts-autotag" },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "ggandor/leap.nvim",
    dependencies = {
      { "ggandor/flit.nvim" },
    },
    config = function()
      require("leap").add_default_mappings()
      require("flit").setup({})
    end,
  },
  {
    "yorickpeterse/nvim-window",
    dependencies = {
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
  },

  -- Global search and replace
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
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
  },
  -- Highlight Search Lens
  -- {
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

  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
