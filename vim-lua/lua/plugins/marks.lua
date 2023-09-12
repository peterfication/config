return {
  {
    "chentoast/marks.nvim",
    dependencies = {
      "mrjones2014/legendary.nvim",
    },
    config = function()
      require("marks").setup({})

      require("legendary").command({
        ":DeleteAllMarks",
        "delm! | delm A-Z0-9",
        description = "Delete all marks",
      })
    end,
  },
}
