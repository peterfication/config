return function(use)
  use({
    "sindrets/diffview.nvim",
    config = function()
      vim.keymap.set("n", "<Leader>GG", ":DiffviewFileHistory %<CR>", { noremap = true, silent = true })
    end,
  })

  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "petertriho/nvim-scrollbar",
    },
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "ghn", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          map("n", "ghp", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          -- Actions
          -- map({'n', 'v'}, '<Leader>hs', ':Gitsigns stage_hunk<CR>')
          -- map({'n', 'v'}, '<Leader>hr', ':Gitsigns reset_hunk<CR>')
          -- map('n', '<Leader>hS', gs.stage_buffer)
          -- map('n', '<Leader>hu', gs.undo_stage_hunk)
          -- map('n', '<Leader>hR', gs.reset_buffer)
          map("n", "<Leader>ghs", gs.preview_hunk)
          map("n", "<Leader>ghr", gs.reset_hunk)
          -- map('n', '<Leader>hb', function() gs.blame_line{full=true} end)
          map("n", "<Leader>gb", gs.toggle_current_line_blame)
          map("n", "<Leader>ghd", gs.diffthis)
          map("n", "<Leader>ghD", function()
            gs.diffthis("~")
          end)
          -- map('n', '<Leader>td', gs.toggle_deleted)
        end,
      })

      vim.keymap.set("n", "<Leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { noremap = true })
      require("scrollbar.handlers.gitsigns").setup()
    end,
  })

  use({
    "kdheepak/lazygit.nvim",
    config = function()
      vim.keymap.set("n", "<Leader>gg", ":LazyGit<CR>", { noremap = true })
      vim.keymap.set("n", "<Leader>gg", ":LazyGit<CR>", { noremap = true })
    end,
  })

  use({
    "rbong/vim-flog",
    requires = {
      "tpope/vim-fugitive",
    },
  })

  use({
    "ruifm/gitlinker.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("gitlinker").setup()
    end,
  })

  -- tig setup with toggleterm
  -- Important keys:
  -- - Go to parent commit: ,
  -- - Go back: <
  -- - Show commit: <CR>
  -- - Close commit: q
  -- - Close tig: q
  -- vim.keymap.set('n', '<Leader>GG', ':TermExec cmd="tig %; exit" direction=float<CR>', { noremap = true })
  vim.keymap.set("n", "<Leader>GB", ':TermExec cmd="tig blame %; exit" direction=float<CR>', { noremap = true })
end
