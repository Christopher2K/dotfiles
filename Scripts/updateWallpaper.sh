#!/bin/bash

# Update all spaces wallpaper

#PARAMS
WALLPAPER=$WALLPAPER

if [[ -z $(which yabai) ]];
then

	echo "This script needs yabai. It can be installed by this script"
	exit 1

fi

if [[ -z $(which jq) ]];
then
	echo "This script needs jq. It can be installed by this script"
	if [[ -z $(which brew) ]];
	then
		exit 1
	fi

	echo "Installing jq with hombrew..."
	brew install jq
	
fi

if [[ -n $1 ]];
then
	WALLPAPER=$1
fi

if [[ -z $WALLPAPER ]];
then
	echo "This script needs WALLPAPER env variable or a path as an argument"
fi

SPACES=$(yabai -m query --spaces | jq 'length')
FOCUSED_SPACE=$(yabai -m query --spaces --space | jq '.index')

echo "Updated all spaces wallpaper with \"$WALLPAPER\""
for ((c=1; c<=((SPACES)); c++))
do
	echo $c
	yabai -m space --focus $c
	osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$WALLPAPER\""
done

yabai -m space --focus $FOCUSED_SPACE
