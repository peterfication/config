hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
hs.alert.show("Config loaded")

-- Vim movements
hs.loadSpoon("FnMate")

hs.loadSpoon("Caffeine")
spoon.Caffeine:start()
spoon.Caffeine:setState(true)

local SkyRocket = hs.loadSpoon("SkyRocket")
sky = SkyRocket:new({
  moveModifiers = {'cmd', 'shift'},
  resizeModifiers = {'ctrl', 'shift'},
})

local ClipboardTool = hs.loadSpoon("ClipboardTool")
ClipboardTool.show_in_menubar = false
ClipboardTool.paste_on_select = true
ClipboardTool:start()
ClipboardTool:bindHotkeys({
  toggle_clipboard = {{'cmd', 'shift'}, 'V'},
})

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show("Hello World!")
end)

-- # TODO
-- https://zzamboni.org/post/my-hammerspoon-configuration-with-commentary/
