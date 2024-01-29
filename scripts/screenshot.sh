#!/bin/bash

output_file="$HOME/media/screenshot_$(date +'%Y-%m-%d-%H%M%S').png"
grim -g "$(slurp)" $output_file && wl-copy < $output_file
