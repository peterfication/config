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
  moveModifiers = { "cmd", "shift" },
  resizeModifiers = { "ctrl", "shift" },
})

-- local VimMode = hs.loadSpoon('VimMode')
-- local vim = VimMode:new()

-- vim
--   :disableForApp('iTerm2')
--   :enterWithSequence('jk')

-- Move window to next screen
hs.hotkey.bind({ "alt", "ctrl", "cmd", "shift" }, "n", function()
  -- get the focused window
  local win = hs.window.focusedWindow()
  -- get the screen where the focused window is displayed, a.k.a. current screen
  local nextScreen = win:screen():next()
  -- compute the unitRect of the focused window relative to the current screen
  -- and move the window to the next screen setting the same unitRect
  -- win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)

  win:moveToScreen(nextScreen, false)
end)

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
