return function(use)
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "folke/which-key.nvim",
    },
    config = function()
      require("which-key").register({
        ["<Leader>"] = {
          n = {
            ":Neotree toggle<CR>",
            "Open NvimTree in last state",
          },
          N = {
            ":Neotree filesystem reveal<CR>",
            "Open NvimTree with the current file selected",
          },
        },
      })
    end,
  })
end
