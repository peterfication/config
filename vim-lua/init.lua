local modules = {
  "config.reload",
  "config.settings",
  "config.keymaps",
  "plugins.packer-config",
}

for k, v in pairs(modules) do
  package.loaded[v] = nil
  require(v)
end
