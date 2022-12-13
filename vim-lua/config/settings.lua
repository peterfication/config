local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- global options
o.clipboard = 'unnamed' -- Share the system clipboard
o.grepprg = [[rg\ --vimgrep]] -- Use Ripgrep for vimgrep
o.updatetime = 300
o.termguicolors = true
o.spelllang = "en,de"
o.spell = false
o.splitright = true
o.splitbelow = true
o.swapfile = false
o.undofile = true

-- window-local options
wo.number = true
wo.wrap = true
wo.cursorline = true -- Highlights the current line of the cursor
wo.cursorcolumn = true -- Highlights the current column of the cursor
wo.list = true
wo.scrolloff = 5 -- The number of screen lines to keep above and below the cursor while scrolling
vim.opt.listchars = {
  trail    = '¤',
  nbsp     = '·',
  extends  = '>',
  precedes = '<',
  space    = '·',
  eol      = '↵',
  -- tab = '»', -- tab does not work
}
vim.cmd([[set listchars+=tab:»\ ]])

-- buffer-local options
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]]) -- Remove trailing whitespaces on save
-- bo.expandtab = true -- Don't allow tabs at the beginning of the line but convert them into spaces

-- From https://github.com/nvim-lua/kickstart.nvim/blob/c8a140577832ed4f958f4964400b2591abea3825/init.lua#L112
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
