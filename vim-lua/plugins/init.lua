local m = {}

-- Load the plugins in a way that if the init.lua file
-- is sourced again, it will reload the modules.
function m.config(use)
  local modules = {
    'plugins.ui',
    'plugins.lsp',
    'plugins.git',
    'plugins.filetree',
    'plugins.quickfix',
    'plugins.other',
    'plugins.snippets',
    'plugins.auto-completion',
    'plugins.fuzzy',
  }

  for _, v in pairs(modules) do
    package.loaded[v] = nil
    require(v)(use)
  end
end

return m

-- From old setup. To be deleted eventually.

-- local vim = vim
-- local execute = vim.api.nvim_command
-- local fn = vim.fn
--
-- -- ensure that packer is installed
-- local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
--
-- if fn.empty(fn.glob(install_path)) > 0 then
--     execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
--     execute 'packadd packer.nvim'
-- end
--
-- vim.cmd('packadd packer.nvim')
--
-- local packer = require'packer'
-- local util = require'packer.util'
--
-- packer.init({
--   package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
-- })
--
-- -- packer startup and plugin configuration
-- packer.startup(function(use)
--   use { 'wbthomason/packer.nvim' }
--
--   -- Syntax highlighting
--   use { 'base16-project/base16-vim', config = [[require('config.base16-vim')]] }
--   use { 'nvim-treesitter/nvim-treesitter', config = [[require('config.nvim-treesitter')]] }
--   -- use { 'sheerun/vim-polyglot' }
-- end)
