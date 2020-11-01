#!/bin/sh
#
# zsh configuration
# -----------------------------------------------------------------------------
# Bundle: Sylver's dotfiles
# Repository: https://github.com/sylver/dotfiles
# Author: Richard (Sylver) Kemp
# -----------------------------------------------------------------------------

source ~/.dotfiles/lib/helper.sh

ZDOTDIR=~/.zsh

# OPTIONS
#
setopt appendhistory
setopt extendedhistory
setopt autocd
setopt extendedglob
setopt nomatch
setopt notify
unsetopt beep
unsetopt share_history

# INCLUDES
#
source ~/.aliases
source ~/.exports

# FPATH
#
fpath=(/usr/local/share/zsh/site-functions $fpath)

# Powerlevel9k Configuration
#
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\UE0BC'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir vcs newline status)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs command_execution_time time)
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0

POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND='yellow'
POWERLEVEL9K_DIR_NOT_WRITABLE_BACKGROUND='red'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_with_package_name"
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_with_folder_marker"
#POWERLEVEL9K_SHORTEN_FOLDER_MARKER=".git"
#POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true
#POWERLEVEL9K_DIR_PATH_SEPARATOR=" $(print_icon "LEFT_SUBSEGMENT_SEPARATOR") "

# Addons
#
source <(antibody init)
antibody bundle < ~/.zshplugins

bindkey -v

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# nvm
#export NVM_DIR="$HOME/.nvm"
#. "/usr/local/opt/nvm/nvm.sh"

# gcloud sdk
if [ $OS = 'macos' ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi

# Python
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

which archey && archey
which archey3 && archey3
