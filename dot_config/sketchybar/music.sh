#!/bin/bash

sketchybar --add item music right \
    --set music \
    update_freq=10 \
    icon= \
    icon.padding_left=12 \
    icon.padding_right=8 \
    icon.color=$WHITE_COLOR \
    label.padding_right=12 \
    label.color=$WHITE_COLOR \
    background.color=$FOREGROUND_COLOR \
    background.height=$BAR_HEIGHT \
    background.corner_radius=$BAR_RADIUS \
    script="$PLUGIN_DIR/cider.sh" \
