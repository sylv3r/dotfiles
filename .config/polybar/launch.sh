#!/bin/sh
#
# Polybar launchs script - Basic script to kill all old bars and launch new.
# -----------------------------------------------------------------------------
# Bundle: Sylver's dotfiles
# Repository: https://github.com/sylver/dotfiles
# Author: Richard (Sylver) Kemp
# -----------------------------------------------------------------------------

# Terminate already running bad instances
killall -q polybar

# Wait until the processes have been shut down
while grep -x polybar >/dev/null; do sleep 1; done

# Launch the bars
MONITOR=DP2 polybar main_bar &
MONITOR=eDP1 polybar main_bar &
