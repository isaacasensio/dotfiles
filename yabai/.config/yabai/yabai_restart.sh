#!/usr/bin/env bash

# Filename: ~/.config/yabai/yabai_restart.sh
# ~/.config/yabai/yabai_restart.sh

source "$HOME/.config/yabai/yabai_env.sh"

# This script is executed from karabiner, but in karabiner docs:
# https://karabiner-elements.pqrs.org/docs/json/complex-modifications-manipulator-definition/to/shell-command/
# The very limited environment variables are passed to the command, $HOME, $UID, $USER, etc.
# Export environment variables in shell_command if your commands depend them.
#
# If you don't do this, the script won't find yabai or jq or any other apps in
# the /opt/homebrew/bin dir
export PATH="/opt/homebrew/bin:$PATH"

yabai --restart-service

# Wait a few seconds after restarting yabai, or the apps will restart too early
# I think this causes the apps not to show with my transparent apps
# sleep 1

# Restart the apps in apps_transp_ignore to apply the settings
# Convert the string to an array, properly handling spaces in app names
# Remove parentheses and split on |
IFS='|' read -ra apps <<<"$(echo "$apps_transp_ignore" | tr -d '()')"

# Iterate through the array
for app in "${apps[@]}"; do
  # Trim leading/trailing whitespace
  app=$(echo "$app" | xargs)
  pkill "$app"
  sleep 0.3
  open -a "$app"
  sleep 0.3
done
