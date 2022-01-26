#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
# python ~/.config/polybar/scripts/spotify/launch_listener.py &
DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1) polybar ArchBar &
nm-applet &
blueman-applet &
echo "Polybar launched..."
