local o = vim.o
local wo = vim.wo
-- local bo = vim.bo

-- global options
o.clipboard = 'unnamed' -- Share the system clipboard
o.grepprg = [[rg\ --vimgrep]] -- Use Ripgrep for vimgrep
o.updatetime = 300
o.termguicolors = true

-- window-local options
wo.number = true
wo.wrap = true
wo.cursorline = true -- Highlights the current line of the cursor
wo.cursorcolumn = true -- Highlights the current column of the cursor
wo.list = true
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
