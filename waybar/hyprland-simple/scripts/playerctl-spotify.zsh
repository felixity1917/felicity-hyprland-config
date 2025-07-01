#!/bin/zsh

# Get the metadata for Spotify using playerctl
metadata=$(playerctl --player spotify metadata 2>&1)

# Check if playerctl returned "No players found"
if [[ "$metadata" == *"No players found"* ]]; then
    echo "{\"text\":\" Offline\", \"tooltip\":\"Spotify\"}"
else
    # Extract artist and title using grep and sed to handle the format, and escape special characters in the title
    artist=$(echo "$metadata" | grep "xesam:artist" | sed 's/spotify xesam:artist *//')
    title=$(echo "$metadata" | grep "xesam:title" | sed 's/spotify xesam:title *//' | sed 's/&/\&amp;/g')

    # Echo the formatted output in JSON
    echo "{\"text\":\"󰠃  $artist -   $title\", \"tooltip\":\"Spotify\"}"
fi
