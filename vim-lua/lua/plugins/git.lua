return {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function()
      require("which-key").add({
        { "<Leader>GG", ":DiffviewFileHistory %<CR>", desc = "Open DiffView with the Git history of the current file" },
      })
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "petertriho/nvim-scrollbar",
      "folke/which-key.nvim",
    },
    config = function()
      require("gitsigns").setup({
        numhl = true,
        current_line_blame_opts = {
          delay = 100,
        },

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

      require("scrollbar.handlers.gitsigns").setup()

      require("which-key").add({
        {
          "<Leader>GB",
          ':9TermExec cmd="tig blame %; exit" direction=float<CR>',
          desc = "Open tig blame for the current file",
        },
        { "<Leader>gb", ":Gitsigns toggle_current_line_blame<CR>", desc = "Toogle Git blame current line" },
      })

      -- tig setup with toggleterm
      -- Important keys:
      -- - Go to parent commit: ,
      -- - Go back: <
      -- - Show commit: <CR>
      -- - Close commit: q
      -- - Close tig: q
      -- vim.keymap.set('n', '<Leader>GG', ':TermExec cmd="tig %; exit" direction=float<CR>', { noremap = true })
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function()
      require("which-key").add({
        { "<Leader>gg", ":LazyGit<CR>", desc = "Open LazyGit" },
      })
    end,
  },

  {
    "rbong/vim-flog",
    dependencies = {
      "tpope/vim-fugitive",
    },
    config = function()
      require("which-key").add({
        { "<Leader>GV", ":Git blame<CR>", desc = "Open Git blame with fugitive" },
        { "<Leader>gl", ":Flog<CR>", desc = "Open Git Flog (Git log)" },
      })
    end,
  },

  -- Get links to the current line on GitHub, GitLab, Bitbucket, etc.
  {
    "ruifm/gitlinker.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/which-key.nvim",
    },
    config = function()
      require("gitlinker").setup({
        mappings = nil,
      })

      require("which-key").add({
        {
          "<Leader>gy",
          '<CMD>lua require"gitlinker".get_buf_range_url("n")<CR>',
          desc = "Copy the link for current line on Github",
          mode = "n"
        },
        {
          "<Leader>gy",
          '<CMD>lua require"gitlinker".get_buf_range_url("v")<CR>',
          desc = "Copy the link for current line on Github",
          mode = "v"
        },
      })
    end,
  },
}
