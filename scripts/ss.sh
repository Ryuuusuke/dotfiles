#!/bin/sh

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
FILENAME="$DIR/shot_$(date +'%Y%m%d-%H%M%S').png"

#hyprpicker -r -z &
#PICKER_PID=$!

sleep 0.2
GEOM=$(slurp)

#kill $PICKER_PID

if [ -z "$GEOM" ]; then
    exit 1
fi

grim -g "$GEOM" "$FILENAME"

wl-copy < "$FILENAME"
notify-send "Screenshot Saved" "Path: $FILENAME" -i "$FILENAME"
