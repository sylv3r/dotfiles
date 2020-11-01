#!/bin/sh
#
# xinitrc - x environment setup
# -----------------------------------------------------------------------------
# Bundle: Sylver's dotfiles
# Repository: https://github.com/sylver/dotfiles
# Author: Richard (Sylver) Kemp
# -----------------------------------------------------------------------------


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

. ~/.xsession

xrandr \
  --output eDP1 --mode 3200x1800 \ # Touchscreen display
  --output DP2 --mode 3840x2160 --right-of eDP1 # Samsung UHD monitor
xbanish &
exec i3 -V >> ~/.i3logs/i3log-$(date +'%F-%k-%M-%S') 2>&1
