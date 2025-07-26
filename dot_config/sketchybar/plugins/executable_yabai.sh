#!/bin/bash

source './theme.sh'

focused_workspace_id=$(echo $(yabai -m query --spaces --space) | jq '.index')

if [ "$1" = "$focused_workspace_id" ]; then
    sketchybar --set $NAME background.drawing=on label.color=$WHITE_COLOR
else
    sketchybar --set $NAME background.drawing=off label.color=$FOREGROUND_COLOR
fi
