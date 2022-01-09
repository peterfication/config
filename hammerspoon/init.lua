hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
hs.alert.show("Config loaded")

hs.loadSpoon("Caffeine")
spoon.Caffeine:start()
spoon.Caffeine:setState(true)

local SkyRocket = hs.loadSpoon("SkyRocket")
sky = SkyRocket:new({
  moveModifiers = {'cmd', 'shift'},
  resizeModifiers = {'ctrl', 'shift'},
})

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show("Hello World!")
end)
