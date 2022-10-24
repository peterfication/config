hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
hs.alert.show("Config loaded")

-- Use Alfred for this
-- hs.loadSpoon("EjectMenu")
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "E", function()
--   spoon.EjectMenu:ejectVolumes()
-- end)

-- Vim movements
hs.loadSpoon("FnMate")

hs.loadSpoon("Caffeine")
spoon.Caffeine:start()

local SkyRocket = hs.loadSpoon("SkyRocket")
sky = SkyRocket:new({
  moveModifiers = {'cmd', 'shift'},
  resizeModifiers = {'ctrl', 'shift'},
})

-- Use Alfred for this
-- local ClipboardTool = hs.loadSpoon("ClipboardTool")
-- ClipboardTool.show_in_menubar = false
-- ClipboardTool.show_copied_alert = false
-- ClipboardTool.paste_on_select = true
-- ClipboardTool:start()
-- ClipboardTool:bindHotkeys({
--   toggle_clipboard = {{'cmd', 'alt', 'ctrl'}, 'V'},
-- })

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
--   hs.alert.show("Hello World!")
-- end)

-- # TODO
-- https://www.hammerspoon.org/Spoons/Commander.html
-- https://www.hammerspoon.org/Spoons/DeepLTranslate.html
-- https://www.hammerspoon.org/Spoons/Emojis.html
-- https://www.hammerspoon.org/Spoons/MiroWindowsManager.html
-- https://www.hammerspoon.org/Spoons/Shade.html
-- https://github.com/ashfinal/awesome-hammerspoon
-- https://zzamboni.org/post/my-hammerspoon-configuration-with-commentary/
