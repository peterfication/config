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
      })
      require("which-key").register({
        ["<Leader>"] = {
          n = {
            ":Neotree toggle float<CR>",
            "Open NeoTree in last state",
          },
          N = {
            ":Neotree filesystem reveal float<CR>",
            "Open NeoTree with the current file selected",
          },
        },
      })
    end,
  },
}
