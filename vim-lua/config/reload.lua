-- This works together with the way of unloading and loading
-- packages in the init.lua files.
function _G.ReloadConfig()
  -- Load the most recent config files
  vim.cmd("luafile " .. os.getenv("HOME") .. "/config/vim-lua/init.lua")
  -- Compile the most recent  config files
  vim.cmd("PackerCompile")
  -- Load the freshly compiled config
  vim.cmd("luafile " .. os.getenv("HOME") .. "/.config/nvim/plugin/packer_compiled.lua")

  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end
