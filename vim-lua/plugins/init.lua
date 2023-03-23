local m = {}

-- Load the plugins in a way that if the init.lua file
-- is sourced again, it will reload the modules.
function m.config(use)
  local modules = {
    "plugins.terminal",
    "plugins.lsp",
    "plugins.git",
    "plugins.filetree",
    "plugins.quickfix",
    "plugins.marks",
    "plugins.other",
    "plugins.snippets",
    "plugins.auto-completion",
    "plugins.fuzzy",
    "plugins.tests",
    -- "plugins.repl", -- I actually don't use this
    "plugins.http",
    "plugins.outline",
    "plugins.ui",
    -- 'plugins.keymaps',
    -- 'plugins.zoom', -- Disabled because it messes with the command line in vim mode and enter
    "plugins.ai",
  }

  for _, v in pairs(modules) do
    package.loaded[v] = nil
    require(v)(use)
  end
end

return m
