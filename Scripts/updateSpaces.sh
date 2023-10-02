#!/bin/bash

# This script is an helper to re-configure yabai to have 8 spaces
# I need 4 spaces in each screens

# PARAMS
MAX_SPACES=4

# This script needs yabai and jq 
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

# Make sure we have my 2 screens connected
NUMBER_OF_DISPLAYS=$(yabai -m query --displays | jq 'length')
if [[ $NUMBER_OF_DISPLAYS -ne 2 ]]; then

	echo "This script works when the 2 screens are connected"
	exit 1

fi

function get_last_space_index() {
	echo $(yabai -m query --displays | jq 'last | .spaces | last')
}

function create_space() {
	# First arg is display index

	yabai -m display --focus $1
	yabai -m space --create
}

function destroy_space() {
	# First arg is display index

	yabai -m display --focus $1
	yabai -m space --destroy
}

function remediate_spaces() {
	# First arg is display index
	local DISPLAY=$1
	echo ""
	echo "> Checking Display $DISPLAY spaces..."

	DISPLAY_SPACES=$(yabai -m query --displays | jq ".[$(($DISPLAY - 1))].spaces | length")

	if [[ $DISPLAY_SPACES -eq $MAX_SPACES ]]; then

		echo "	>> Display $DISPLAY already contains $MAX_SPACES spaces"

	elif [[ $DISPLAY_SPACES -gt $MAX_SPACES ]]; then

		SPACES_TO_REMOVE=$((DISPLAY_SPACES-MAX_SPACES))
		echo "	>> Removing the extra $SPACES_TO_REMOVE screens..."

		for ((c=1; c<=((SPACES_TO_REMOVE)); c++))
		do
			destroy_space $DISPLAY
		done

	elif [[ $DISPLAY_SPACES -lt $MAX_SPACES ]]; then

		SPACES_TO_ADD=$((MAX_SPACES-DISPLAY_SPACES))
		echo "	>> Adding the $SPACES_TO_ADD missing space..."

		for ((c=1; c<=((SPACES_TO_ADD)); c++))
		do
			create_space $DISPLAY
		done
	fi

	echo "	>> Done."
}

remediate_spaces 1
remediate_spaces 2

exit 0
