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
