#!/bin/bash
DIR=$HOME/Pictures/Wallpaper
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

swww query || swww-daemon

swww img ${DIR}/${RANDOMPICS} --transition-fps 60 --transition-type grow --transition-duration 1.3 --transition-pos 1487,1057 
