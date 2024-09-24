#!/bin/bash

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
	sketchybar --add item space.$sid left \
	--subscribe space.$sid aerospace_workspace_change \
	--set space.$sid \
	icon=$sid \
	label.padding_right=1 \
	label.y_offset=-1 \
	background.color=$WHITE \
	background.corner_radius=5 \
	background.height=20 \
	background.drawing=off \
	click_script="aerospace workspace $sid" \
	script="$CONFIG_DIR/plugins/aerospace.sh $sid"

done
