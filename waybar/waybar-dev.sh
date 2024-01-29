#!/bin/bash

CONFIG_FILES="$HOME/dotfiles/waybar/config.jsonc $HOME/dotfiles/waybar/style.css $HOME/dotfiles/waybar/modules.jsonc"

trap "killall waybar" EXIT

while true; do
    waybar &
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done
