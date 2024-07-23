#!/bin/bash

# Directory where JPEG files are stored
JPEG_DIR="$HOME/Wallpapers"

# Check if the directory exists
if [ ! -d "$JPEG_DIR" ]; then
    echo "Error: Directory $JPEG_DIR does not exist."
    exit 1
fi

# Convert JPEG files to PNG format
for jpg_file in "$JPEG_DIR"/*.jpg "$JPEG_DIR"/*.jpeg; do
    if [ -f "$jpg_file" ]; then
        # Get the base filename without extension
        base_name=$(basename "$jpg_file")
        base_name="${base_name%.*}"

        # Convert JPEG to PNG using ImageMagick's convert command
        convert "$jpg_file" "$JPEG_DIR/$base_name.png"

        # Check if conversion was successful
        if [ $? -eq 0 ]; then
            echo "Converted: $jpg_file to $JPEG_DIR/$base_name.png"
            # Remove the original JPEG file after conversion
            rm "$jpg_file"
        else
            echo "Error converting: $jpg_file"
        fi
    fi
done
