#!/usr/bin/env bash

# Filename: ~/.config/yabai/yabai_env.sh
# ~/.config/yabai/yabai_env.sh

# To get the names of all the running applications
# yabai -m query --windows | jq -r '.[].app'

# apps_transparent="(Spotify|kitty|Neovide|Google Chrome|Code|WezTerm|Ghostty)"
apps_transparent="(Neovide|Code|WezTerm|Ghostty)"

# Apps that I want to always show, even when I have a transparent app focused
apps_transp_ignore="(kitty)"
# apps_transp_ignore="(kitty|CleanShot X)"

# Apps excluded from window management, so you can resize them and move them around
# This is basically the ignore list

# I had to move them away from normal, because all these apps would stay on top
# of other apps
# apps_mgoff_normal="()"

# This keeps apps always below, seems to be working fine when I switch to other
# apps
apps_mgoff_below="(Calculator|iStat Menus|Hammerspoon|GIMP|Notes|Activity Monitor|App StoreSoftware Update|Stickies|Photo Booth|VLC)"

# This keeps apps always on the top
apps_mgoff_above="()"
