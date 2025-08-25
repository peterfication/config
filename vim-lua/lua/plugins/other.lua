return {
  { "tpope/vim-abolish" },
  { "tpope/vim-repeat" },
  {
    "simnalamburt/vim-mundo",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function()
      require("which-key").add({
        { "<Leader>u", ":MundoToggle<CR>", desc = "Open undo tree with Mundo" },
      })
    end,
  },
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      set({ "n", "x" }, "<Leader>kn", function()
        mc.matchAddCursor(1)
      end, { desc = "Go into visual mode and select the current word under the cursor and go to the next" })
      set({ "n", "x" }, "<Leader>kp", function()
        mc.matchAddCursor(-1)
      end, { desc = "Go into visual mode and select the current word under the cursor and go to the previous" })
      set({ "n", "x" }, "<Leader>kj", function()
        mc.lineAddCursor(1)
      end, { desc = "Go into visual mode and select the current line/cursor position and go down" })
      set({ "n", "x" }, "<Leader>kk", function()
        mc.lineAddCursor(1)
      end, { desc = "Go into visual mode and select the current line/cursor position and go up" })

      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        layerSet({ "n", "x" }, "<C-n>", function() mc.matchAddCursor(1) end)
        layerSet({ "n", "x" }, "<C-p>", mc.deleteCursor)
        layerSet({ "n", "x" }, "<C-j>", function() mc.lineAddCursor(1) end)
        layerSet({ "n", "x" }, "<C-k>", mc.deleteCursor)
        layerSet({ "n", "x" }, "<C-h>", mc.prevCursor)
        layerSet({ "n", "x" }, "<C-l>", mc.nextCursor)
        layerSet({ "n", "x" }, "<C-d>", mc.deleteCursor)

        -- Enable and clear cursors using escape.
        layerSet("n", "<esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)
    end,
  },
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

      require("which-key").add({
        { "<Leader>W", ":lua require('nvim-window').pick()<CR>", desc = "Select window via a letter" },
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

      require("which-key").add({
        { "<Leader>R", ":Spectre<CR>", desc = "Search and replace with spectre" },
      })
    end,
  },
  -- Other global search and replace
  {
    "MagicDuck/grug-far.nvim",
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    -- config = function()
    --   -- optional setup call to override plugin options
    --   -- alternatively you can set options with vim.g.grug_far = { ... }
    --   require('grug-far').setup({
    --     -- options, see Configuration section below
    --     -- there are no required options atm
    --   });
    -- end
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
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
