require "airpods"
require "terminal"

--
-- Hotkeys
--

local cmd = {"⌘"}
local mash = {"⌘", "⌥", "⌃"}
local alt = {"⌥"}

hs.hotkey.bind(cmd,  "\\", toggleAirpods)
hs.hotkey.bind(mash, "t", toggleTerminal)


