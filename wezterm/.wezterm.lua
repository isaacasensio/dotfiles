-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 19

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- Then you'll be able to set your terminal to `xterm-kitty` as seen below
config.term = "xterm-kitty"

-- To enable kitty graphics
-- https://github.com/wez/wezterm/issues/986
-- It seems that kitty graphics is not enabled by default according to this
-- Not sure, so I'm enabling it just in case
-- https://github.com/wez/wezterm/issues/1406#issuecomment-996253377
config.enable_kitty_graphics = true

-- config.default_prog = { '/usr/local/bin/zellij', '-l', 'welcome' }

config.color_scheme = "Catppuccin Macchiato"


config.keys = {
	{
	  key = 'f',
	  mods = 'SHIFT|CTRL',
	  action = wezterm.action.ToggleFullScreen,
	},
  }

-- and finally, return the configuration to wezterm
return config
