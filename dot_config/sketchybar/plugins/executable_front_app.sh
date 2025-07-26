#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

is_stack=$(yabai -m query --windows --window | jq -r 'if ."stack-index" > 0 then "true" else "false" end')
is_floating=$(yabai -m query --windows --window | jq -r '."is-floating"')
is_zoomed=$(yabai -m query --windows --window | jq -r '."has-fullscreen-zoom"')
app=$(yabai -m query --windows --window | jq -r '.app')


message=""

if [ "$is_stack" == "true" ]; then
  stack_index=$(yabai -m query --windows --window | jq -r '."stack-index"')
  message="[Stack] $stack_index"
elif [ "$is_zoomed" == "true" ]; then
  message="[Fullscreen]"
elif [ "$is_floating" == "true" ]; then
  message="[Floating]"
else 
  message="[BSP]"
fi

if [ "$app" == "" ]; then
  app="Finder"
fi

sketchybar --set "$NAME" label="$app | $message"
