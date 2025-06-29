#!/bin/zsh

# Check if the image path is provided as an argument
if [[ $# -eq 0 ]]; then
  echo "Error: No image path provided."
  echo "Usage: ./blur_image.zsh <image_path>"
  exit 1
fi

image_path=$1

# Check if the file exists
if [[ -f "$image_path" ]]; then
  # Apply blur using ffmpeg and save the output as 'background.jpg' in the current directory
  ffmpeg -i "$image_path" -vf "gblur=sigma=10" background.jpg
  echo "Blurred image saved as 'background.jpg' in the current directory."
else
  echo "Error: File not found. Please provide a valid image path."
fi
