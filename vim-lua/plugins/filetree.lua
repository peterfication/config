return function(use)
  use({
    "kyazdani42/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local M = {}
      local api = require("nvim-tree.api")

      function M.on_attach(bufnr)
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
        -- vim.keymap.set("n", "p", M.print_node_path, opts("Print node path"))
        vim.keymap.set("n", "<Leader>n", ":NvimTreeClose<CR>", opts("Close NvimTree"))
      end

      function M.print_node_path()
        local node = api.tree.get_node_under_cursor()
        if node then
          print(node.absolute_path)
        end
      end

      local WIDTH_RATIO = 0.3

      require("nvim-tree").setup({
        on_attach = M.on_attach,
        view = {

          width = function()
            return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
          end,
          -- With float and noice, you can't C-f when renaming a file because
          -- noice will close nvim-tree as well when opening the standard command line
          -- float = {
          --   enable = true,
          --   open_win_config = {
          --     relative = "editor",
          --     border = "rounded",
          --     width = 100,
          --     height = 60,
          --     row = 1,
          --     col = 75,
          --   },
          -- },
          -- indent_markers = {
          --   enable = true,
          -- },
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      })

      local options = { noremap = true, silent = true }
      vim.keymap.set("n", "<Leader>n", ":NvimTreeFocus<CR>", options)
      vim.keymap.set("n", "<Leader>N", ":NvimTreeFindFile<CR>", options)
    end,
  })

  use({
    "antosha417/nvim-lsp-file-operations",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "kyazdani42/nvim-tree.lua" },
    },
  })
end
