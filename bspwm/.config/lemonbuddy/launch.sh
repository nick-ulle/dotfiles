#!/usr/bin/env sh

# Terminate already running bar instances.
killall -q lemonbuddy

# Wait until the processes have been shut down.
while pgrep -x lemonbuddy > /dev/null; do sleep 1; done

# Launch bar.
lemonbuddy master &

echo "Bar launched..."
