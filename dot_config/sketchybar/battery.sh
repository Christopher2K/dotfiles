#!/bin/bash

sketchybar --add item battery right \
    --set battery \
    update_freq=120 \
    icon.padding_left=12 \
    icon.padding_right=8 \
    label.padding_right=12 \
    background.color=$BACKGROUND_COLOR \
    background.height=$BAR_HEIGHT \
    background.corner_radius=$BAR_RADIUS \
    script="$PLUGIN_DIR/battery.sh" \
    --subscribe battery system_woke power_source_change
