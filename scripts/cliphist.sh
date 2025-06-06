#!/bin/bash
#   ____ _ _       _     _     _    
#  / ___| (_)_ __ | |__ (_)___| |_  
# | |   | | | '_ \| '_ \| / __| __| 
# | |___| | | |_) | | | | \__ \ |_  
#  \____|_|_| .__/|_| |_|_|___/\__| 
#           |_|                     
#  
# by Stephan Raabe (2023) 
# ----------------------------------------------------- 

case $1 in
    d) cliphist list | rofi -dmenu -replace -config ~/dotfiles/rofi/config-cliphist.rasi | cliphist delete
       ;;

    w) if [ `echo -e "Cancel\nClear cliphist" | rofi -dmenu -replace -config ~/dotfiles/rofi/config-short.rasi` == "Clear cliphist" ] ; then
            cliphist wipe
       fi
       ;;

    *) cliphist list | rofi -dmenu -replace -config ~/dotfiles/rofi/config-cliphist.rasi | cliphist decode | wl-copy
       ;;
    # *) cliphist list | rofi -dmenu -replace -config ~/dotfiles/rofi/config-cliphist.rasi | cliphist decode | wl-copy
    #    ;;
esac
