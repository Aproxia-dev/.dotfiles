#!/bin/sh

if [[ $(playerctl -p spotifyd status) == "Playing" ]]; then
	magick $(playerctl -p spotifyd metadata -f "{{mpris:artUrl}}") /tmp/album_art.png
elif [[ $(mpc | awk -F: 'NR == 2 {print $2}') != '' ]]; then
	if [[ $(mpc --format %file% current | sed 's/^.*\.//') == 'flac' ]]; then
		metaflac --export-picture-to=/tmp/album_art.png "$(mpc --format "$HOME/music/"%file% current)"
	else
		ffmpeg -v 0 -y -i "$(mpc --format "$HOME/music"/%file% | head -n 1)" /tmp/album_art.png
	fi
fi

