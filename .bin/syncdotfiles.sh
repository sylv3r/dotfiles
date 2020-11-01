#!/bin/sh
#
# syncing dotfiles
# -----------------------------------------------------------------------------
# Bundle: Sylver's dotfiles
# Repository: https://github.com/sylver/dotfiles
# Author: Richard (Sylver) Kemp
# -----------------------------------------------------------------------------

find ~/.dotfiles -name '.*' \
  -not -path '.' \
  -not -path '.git' \
  -exec ln -sf {} ~/ \;
