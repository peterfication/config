return function(use)
  use {
    'hkupty/iron.nvim',
    config = function()
      local iron = require("iron.core")

      iron.setup {
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          repl_definition = {
            ruby = {
              -- command = { 'export PATH="$HOME/.rvm/bin:$PATH" bundle exec rails console' },
              command = { 'bundle', 'exec', 'rails', 'console' },
            },
            sh = {
              command = { "zsh" },
            },
          },
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = require('iron.view').bottom(40),
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        keymaps = {
          send_motion = "<Leader>sc",
          visual_send = "<Leader>sc",
          send_file = "<Leader>sf",
          send_line = "<Leader>sl",
          send_mark = "<Leader>sm",
          mark_motion = "<Leader>mc",
          mark_visual = "<Leader>mc",
          remove_mark = "<Leader>md",
          cr = "<Leader>s<cr>",
          interrupt = "<Leader>s<Leader>",
          exit = "<Leader>sq",
          clear = "<Leader>cl",
        },
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = {
          italic = true
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      }

      vim.keymap.set('n', '<Leader>xs', '<cmd>IronRepl<cr>')
      vim.keymap.set('n', '<Leader>xr', '<cmd>IronRestart<cr>')
      vim.keymap.set('n', '<Leader>xf', '<cmd>IronFocus<cr>')
      vim.keymap.set('n', '<Leader>xh', '<cmd>IronHide<cr>')
    end,
  }
end
