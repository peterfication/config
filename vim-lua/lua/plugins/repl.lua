if true then
  return {}
end

return {
  {
    "hkupty/iron.nvim",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function()
      local iron = require("iron.core")

      iron.setup({
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          repl_definition = {
            ruby = {
              -- command = { 'export PATH="$HOME/.rvm/bin:$PATH" bundle exec rails console' },
              command = { "bundle", "exec", "rails", "console" },
            },
            sh = {
              command = { "zsh" },
            },
          },
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = require("iron.view").bottom(40),
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
          italic = true,
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      })

      require("which-key").add({
        { "<Leader>x", group = "REPL" },
        { "<Leader>xs", "<CMD>IronRepl<CR>", "Open Iron REPL" },
        { "<Leader>xr", "<CMD>IronRestart<CR>", "Restart Iron REPL" },
        { "<Leader>xf", "<CMD>IronFocus<CR>", "Focus Iron REPL" },
        { "<Leader>xh", "<CMD>IronHide<CR>", "Hide Iron REPL" },
      })
    end,
  },
}
