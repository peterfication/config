local m = {}

-- Load the plugins in a way that if the init.lua file
-- is sourced again, it will reload the modules.
function m.config(use)
  local modules = {
    'plugins.terminal',
    'plugins.lsp',
    'plugins.git',
    'plugins.filetree',
    'plugins.quickfix',
    'plugins.marks',
    'plugins.other',
    'plugins.snippets',
    'plugins.auto-completion',
    'plugins.fuzzy',
    'plugins.tests',
    'plugins.http',
    'plugins.outline',
    'plugins.ui',
    -- Disabled because it messes with the commandline in vim mode and enter
    -- 'plugins.zoom',
  }

  for _, v in pairs(modules) do
    package.loaded[v] = nil
    require(v)(use)
  end
end

return m
