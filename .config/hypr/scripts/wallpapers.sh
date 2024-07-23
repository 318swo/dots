#!/bin/bash

# Directory where wallpapers are stored
WALLPAPERS_DIR="$HOME/Wallpapers"

# Directory where cached wallpapers will be stored
CACHE_DIR="$HOME/cached_wallpapers"

# Ensure the cached wallpapers directory exists
mkdir -p "$CACHE_DIR"

# Function to pick a random image file from $WALLPAPERS_DIR
pick_random_wallpaper() {
    local random_file
    local wallpaper_file

    # Check if the directory exists and has files
    if [ -d "$WALLPAPERS_DIR" ] && [ "$(ls -A "$WALLPAPERS_DIR")" ]; then
        # Pick a random file from the directory
        random_file=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)
        # Get the filename without the path
        wallpaper_file=$(basename "$random_file")

        # Set the wallpaper using wal -i
        wal -i "$random_file"

        # Cache the wallpaper to CACHE_DIR, replacing existing files if necessary
        cp -f "$random_file" "$CACHE_DIR/cached_wallpaper.png"

        # Output confirmation
        echo "Set random wallpaper: $wallpaper_file"
    else
        echo "Error: No files found in $WALLPAPERS_DIR or directory does not exist."
        exit 1
    fi
}

# Call the function to set a random wallpaper
pick_random_wallpaper

