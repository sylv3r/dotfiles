#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

. ~/.xsession

xbanish &
exec i3 -V >> ~/.i3logs/i3log-$(date +'%F-%k-%M-%S') 2>&1

