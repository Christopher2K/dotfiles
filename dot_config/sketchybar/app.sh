#!/bin/bash

sketchybar --add item front_app left \
    --set front_app \
    padding_left=8 \
    icon= \
    icon.padding_left=8 \
    icon.padding_right=12 \
    icon.drawing=on \
    label.padding_right=8 \
    label.color=$WHITE_COLOR \
    icon.color=$WHITE_COLOR \
    background.color=$FOREGROUND_COLOR \
    background.height=$BAR_HEIGHT \
    background.corner_radius=$BAR_RADIUS \
    script="$PLUGIN_DIR/front_app.sh" \
    --subscribe front_app front_app_switched \
    --subscribe front_app yabai_window_update
