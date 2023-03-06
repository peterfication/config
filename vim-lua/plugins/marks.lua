return function(use)
  use({
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup({})

      vim.api.nvim_create_user_command("DeleteAllMarks ", "delm! | delm A-Z0-9", {})
    end,
  })
end
