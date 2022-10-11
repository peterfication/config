return function(use)
  use {
    'kdheepak/lazygit.nvim',
    config = function()
      vim.keymap.set('n', '<Leader>gg', ":LazyGit<CR>", { noremap = true })
    end
  }
  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function()
      require("toggleterm").setup()

      vim.keymap.set('n', '<Leader>GG', ':TermExec cmd="tig %; exit" direction=float<CR>', { noremap = true })
      vim.keymap.set('n', '<Leader>GB', ':TermExec cmd="tig blame %; exit" direction=float<CR>', { noremap = true })
    end
  }
end
