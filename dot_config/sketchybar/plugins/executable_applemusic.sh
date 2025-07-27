#!/bin/sh
is_music_open=$(osascript -e 'tell application "System Events" to (name of processes) contains "Music"')

if [ "$is_music_open" = "true" ]; then
  label=$(osascript -e 'tell application "Music" to get {name, artist, album} of current track' || echo "")

  if [ "$label" != "" ]; then
    sketchybar --set "$NAME" icon="" label="$label" drawing=on
  else
    sketchybar --set "$NAME" drawing=off
  fi
else
  sketchybar --set "$NAME" drawing=off
fi
