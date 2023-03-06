-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  vim.cmd([[packadd packer.nvim]])
end

-- During bootstrap, only install the plugins
if is_bootstrap then
  require("plugins.packer-config")
  require("packer").sync()

  print("==================================")
  print("    Plugins are being installed")
  print("    Wait until Packer completes,")
  print("       then restart nvim")
  print("==================================")

  return
end

local modules = {
  "config.reload",
  "config.settings",
  "config.keymaps",
  "plugins.packer-config",
}

for _, v in pairs(modules) do
  package.loaded[v] = nil
  require(v)
end

vim.cmd("source ~/config/vim-lua/config/folding.vim")
