#!/bin/sh
#
# Shell helpers 
# -----------------------------------------------------------------------------
# Bundle: Sylver's dotfiles
# Repository: https://github.com/sylver/dotfiles
# Author: Richard (Sylver) Kemp
# -----------------------------------------------------------------------------

case "$OSTYPE" in
  solaris*) OS="solaris" ;;
  darwin*) OS="macos" ;; 
  linux*) OS="linux" ;;
  bsd*) OS="bsd" ;;
  msys*) OS="windows" ;;
  *) OS= ;;
esac

export OS
