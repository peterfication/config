return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "folke/which-key.nvim",
      "s1n7ax/nvim-window-picker",
    },
    config = function()
      require("neo-tree").setup({
        use_popups_for_input = true,
        filesystem = {
          window = {
            mappings = {
              ["o"] = "system_open",
              ["YY"] = "copy_file_name",
              ["YP"] = "copy_file_path",
              ["YR"] = "copy_relative_file_path",
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
            copy_file_name = function(state)
              local node = state.tree:get_node()
              local content = node.name
              vim.fn.setreg('"', content)
              vim.fn.setreg("1", content)
              vim.fn.setreg("+", content)
            end,
            copy_file_path = function(state)
              local node = state.tree:get_node()
              local content = node.path
              vim.fn.setreg('"', content)
              vim.fn.setreg("1", content)
              vim.fn.setreg("+", content)
            end,
            copy_relative_file_path = function(state)
              local node = state.tree:get_node()
              local content = node.path:gsub(state.path, ""):sub(2)
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
      require("which-key").add({
        { "<Leader>n", group = "Neotree" },
        -- Fallback when "n" is pressed only once
        -- { "<Leader>n", ":Neotree toggle float<CR>", desc = "Open NeoTree files" },
        { "<Leader>N", ":Neotree filesystem reveal float<CR>", desc = "Open NeoTree with the current file selected" },
        { "<Leader>nb", ":Neotree buffers toggle float<CR>", desc = "Open NeoTree buffers" },
        { "<Leader>ng", ":Neotree git_status toggle float<CR>", desc = "Open NeoTree git_status" },
        { "<Leader>nn", ":Neotree toggle float<CR>", desc = "Open NeoTree files" },
      })
    end,
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = {
      { "<leader>no", "<CMD>Oil --float<CR>", desc = "Open Oil for the project" },
      { "<leader>NO", "<CMD>Oil --float .<CR>", desc = "Open Oil for the project" },
    },
  },
  {
    "mikavilpas/yazi.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      {
        "<leader>NY",
        mode = { "n", "v" },
        "<CMD>Yazi<CR>",
        desc = "Open yazi at the current file",
      },
      {
        "<leader>ny",
        "<CMD>Yazi cwd<CR>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<leader>nY",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = "g?",
      },
    },
  },
}
