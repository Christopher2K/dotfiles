#!/bin/sh

now_playing=$(curl -s http://localhost:10767/api/v1/playback/now-playing)

echo $now_playing

if [ "$now_playing" != "" ]; then
    artist_name=$(echo "$now_playing" | jq -r '.info.artistName')
    name=$(echo "$now_playing" | jq -r '.info.name')

    if [ "$name" != "" ] && [ "$name" != "null" ]; then
        sketchybar --set "$NAME" label="$name | $artist_name" drawing=on
    else
        sketchybar --set "$NAME" drawing=off
    fi
else
    sketchybar --set "$NAME" drawing=off
fi
