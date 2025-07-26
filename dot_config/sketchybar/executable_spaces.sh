#!/bin/bash

source './theme.sh'

sketchybar --add event yabai_space_update
sketchybar --add event yabai_display_update
sketchybar --add event yabai_window_update

space_data=$(yabai -m query --spaces)

for row in $(echo ${space_data} | jq -r '.[] | @base64'); do
    row_data=$(echo ${row} | base64 --decode | jq -r '.')
    space_id=$(echo ${row_data} | jq -r '.index')

    sketchybar --add item space.$space_id left \
        --subscribe space.$space_id yabai_space_update \
        --subscribe space.$space_id yabai_display_update \
        --subscribe space.$space_id yabai_window_update \
        --set space.$space_id \
        background.color=$ACCENT_COLOR \
        background.corner_radius=5 \
        background.height=28 \
        background.drawing=off \
        label.padding_left=8 \
        label.padding_right=9 \
        label="$space_id" \
        click_script="yabai -m space --focus $space_id" \
        script="$CONFIG_DIR/plugins/yabai.sh $space_id"
done

space_items=$(echo ${space_data} | jq -r '.[].index' | sed 's/^/space./' | tr '\n' ' ')

sketchybar --add bracket spaces \
    $space_items \
    --set spaces \
    background.height=$BAR_HEIGHT \
    background.color=$BACKGROUND_COLOR \
    background.corner_radius=$BAR_RADIUS \
