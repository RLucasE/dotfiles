#!/bin/bash

CONFIG_FILE="$HOME/.config/hypr/hyprland.conf"
OVERRIDE_LINE="source = ~/.config/hypr/overrides.conf"

# Check if config file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Hyprland config file not found: $CONFIG_FILE"
    exit 1
fi

# Check if the source line already exists
if grep -qF "$OVERRIDE_LINE" "$CONFIG_FILE"; then
    echo "Source line already exists in $CONFIG_FILE"
else
    echo "Adding source line to $CONFIG_FILE"
    echo "$OVERRIDE_LINE" >> "$CONFIG_FILE"
    echo "Added: $OVERRIDE_LINE"
fi