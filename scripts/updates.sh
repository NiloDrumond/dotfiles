#!/bin/bash
#  _   _           _       _             
# | | | |_ __   __| | __ _| |_ ___  ___  
# | | | | '_ \ / _` |/ _` | __/ _ \/ __| 
# | |_| | |_) | (_| | (_| | ||  __/\__ \ 
#  \___/| .__/ \__,_|\__,_|\__\___||___/ 
#       |_|                              
#  
# by Stephan Raabe (2023) 
# ----------------------------------------------------- 
# Requires pacman-contrib trizen

# ----------------------------------------------------- 
# Define tresholds for color indicators
# ----------------------------------------------------- 

treshold_green=0
treshold_yellow=25
treshold_red=100

# ----------------------------------------------------- 
# Calculate available updates pacman and aur (with trizen)
# ----------------------------------------------------- 

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(yay -Quaq | wc -l); then
    updates_aur=0
fi

updates=$(("$updates_arch" + "$updates_aur"))

# ----------------------------------------------------- 
# Testing
# ----------------------------------------------------- 

# Overwrite updates with numbers for testing
# updates=100

# test JSON output
# printf '{"text": "0", "alt": "0", "tooltip": "0 Updates", "class": "red"}'
# exit

# ----------------------------------------------------- 
# Output in JSON format for Waybar Module custom-updates
# ----------------------------------------------------- 

css_class="green"

if [ "$updates" -gt $treshold_yellow ]; then
    css_class="yellow"
fi

if [ "$updates" -gt $treshold_red ]; then
    css_class="red"
fi

if [ "$updates" -gt $treshold_green ]; then
    printf '{"text": "%s", "alt": "%s", "tooltip": "%s Updates", "class": "%s"}' "$updates" "$updates" "$updates" "$css_class"
else
    printf '{"text": "0", "alt": "0", "tooltip": "0 Updates", "class": "empty"}'
fi
