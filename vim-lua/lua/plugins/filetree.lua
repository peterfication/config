return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "folke/which-key.nvim",
    },
    config = function()
      require("neo-tree").setup({
        use_popups_for_input = true,
        filesystem = {
          window = {
            mappings = {
              ["o"] = "system_open",
              ["ä"] = "copy_file_path",
            },
          },
          commands = {
            system_open = function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              path = vim.fn.shellescape(path)
              -- macOs: open file in default application in the background.
              vim.api.nvim_command("silent !open " .. path)
              -- Linux: open file in default application
              -- vim.api.nvim_command("silent !xdg-open " .. path)
            end,
            copy_file_path = function(state)
              local node = state.tree:get_node()
              local content = node.path
              -- relative
              -- local content = node.path:gsub(state.path, ""):sub(2)
              vim.fn.setreg('"', content)
              vim.fn.setreg("1", content)
              vim.fn.setreg("+", content)
            end,
          },
        },
        event_handlers = {
          {
            event = "neo_tree_popup_input_ready",
            handler = function()
              -- enter input popup with normal mode by default.
              vim.cmd("stopinsert")
            end,
          },
          {
            event = "neo_tree_popup_input_ready",
            ---@param args { bufnr: integer, winid: integer }
            handler = function(args)
              -- map <esc> to enter normal mode (by default closes prompt)
              -- don't forget `opts.buffer` to specify the buffer of the popup.
              vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
            end,
          },
        },
      })
      require("which-key").register({
        ["<Leader>"] = {
          n = {
            n = {
              ":Neotree toggle float<CR>",
              "Open NeoTree files",
            },
            b = {
              ":Neotree buffers toggle float<CR>",
              "Open NeoTree buffers",
            },
            g = {
              ":Neotree git_status toggle float<CR>",
              "Open NeoTree git_status",
            },
          },
          N = {
            ":Neotree filesystem reveal float<CR>",
            "Open NeoTree with the current file selected",
          },
        },
      })
      require("which-key").register({
        ["<Leader>"] = {
          -- Fallback when "n" is pressed only once
          n = {
            ":Neotree toggle float<CR>",
            "Open NeoTree files",
          },
        },
      })
    end,
  },
}
