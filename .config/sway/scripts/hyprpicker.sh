#!/bin/bash

# Use hyprpicker to pick a color and store it in a variable
COLOR=$(hyprpicker)

# Send a notification with the picked color
notify-send "Picked Color" "Color code: $COLOR"
