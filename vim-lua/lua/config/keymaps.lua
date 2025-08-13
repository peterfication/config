local map = vim.api.nvim_set_keymap

-- Leader key
map("n", "<Space>", "", {})
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local options = { noremap = true }

map("n", "<Leader><ESC>", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear search highlight" })
map("n", "<Leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save current buffer" })

-- Get back old Y behavior
-- https://www.reddit.com/r/neovim/comments/petq61/neovim_060_y_not_yanking_line_but_to_end_of_line/
map("n", "Y", "Y", options)

-- Go up and down visually and not by new lines (for long lines)
map("n", "j", "gj", options)
map("n", "k", "gk", options)

-- From https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
map("x", "@", ":<C-u>lua ExecuteMacroOverVisualRange()<CR>", options)
function _G.ExecuteMacroOverVisualRange()
  vim.cmd([[echo "@".getcmdline()]])
  vim.cmd([[execute ":'<,'>normal @".nr2char(getchar())]])
end

-- Buffer navigation
map("n", "<Leader>b", ":b#<CR>", { noremap = true, silent = true, desc = "Go back to last buffer" })
map("n", "<Leader>B", ":enew<CR>", { noremap = true, silent = true, desc = "Open new empty buffer" })

vim.api.nvim_create_user_command("CloseAllBuffers", "bufdo! bd", {})
vim.api.nvim_create_user_command("CloseAllBuffersExceptCurrent ", "%bd|e#", {})

-- For https://exercism.org/
vim.api.nvim_create_user_command("ExercismSubmit  ", "!exercism submit %", {})

-- Close certain windows with "q"
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "startuptime",
    "qf",
    "lspinfo",
    "neotest-output",
    "neotest-attach",
  },
  command = [[nnoremap <buffer><silent> q :close<CR>]],
})
vim.api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

function CloseAllFloatingWindows()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= '' then
      vim.api.nvim_win_close(win, true)
    end
  end
end
vim.api.nvim_create_user_command('CloseFloatingWindows', CloseAllFloatingWindows, { nargs = 0 })
vim.keymap.set('n', '<Leader>cw', ':CloseFloatingWindows<CR>', { desc = 'Close all floating windows' })
