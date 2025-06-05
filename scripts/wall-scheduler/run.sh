#!/bin/bash
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
export WAYLAND_DISPLAY=wayland-1
export DISPLAY=:1

exec /home/nilo/dotfiles/scripts/wall-scheduler/target/release/wall-scheduler

