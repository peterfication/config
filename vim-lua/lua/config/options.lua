local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- global options
o.clipboard = "unnamed" -- Share the system clipboard
o.grepprg = [[rg\ --vimgrep]] -- Use Ripgrep for vimgrep
o.updatetime = 300
o.termguicolors = true
o.spelllang = "en,de"
o.spell = false
o.splitright = true
o.splitbelow = true
o.swapfile = false
o.undofile = true
o.scrolloff = 10 -- The number of screen lines to keep above and below the cursor while scrolling
o.colorcolumn = "100"
-- o.pumblend = 50

o.tabstop=2
o.shiftwidth=2
o.expandtab = true
o.smartindent = true
o.autoindent = true

-- window-local options
wo.number = true
wo.relativenumber = false
wo.wrap = true
wo.cursorline = true -- Highlights the current line of the cursor
wo.cursorcolumn = true -- Highlights the current column of the cursor
wo.signcolumn = "yes:1" -- Show the sign column
wo.list = true
vim.opt.listchars = {
  trail = "¤",
  nbsp = "·",
  extends = ">",
  precedes = "<",
  space = "·",
  eol = "↵",
  -- tab = '»', -- tab does not work
}
vim.cmd([[set listchars+=tab:»\ ]])

-- buffer-local options
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]]) -- Remove trailing whitespaces on save
-- bo.expandtab = true -- Don't allow tabs at the beginning of the line but convert them into spaces

-- From https://github.com/nvim-lua/kickstart.nvim/blob/c8a140577832ed4f958f4964400b2591abea3825/init.lua#L112
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
