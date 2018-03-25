#--------------------------------------------------------------------
# file:     ~/.bashrc
# author:   Richard Kemp
#--------------------------------------------------------------------

# bash options ------------------------------------
#set -o vi                  # vi input mode
#shopt -s cdable_vars        # if cd arg is not valid, assumes its a var defining a dir
shopt -s cdspell            # autocorrects cd misspellings
shopt -s checkwinsize       # update the value of LINES and COLUMNS after each command if altered
shopt -s cmdhist            # save multi-line commands in history as single line
shopt -s dotglob            # include dotfiles in pathname expansion
shopt -s expand_aliases     # expand aliases
shopt -s extglob            # enable extended pattern-matching features
shopt -s histappend         # append to (not overwrite) the history file
#shopt -s hostcomplete       # attempt hostname expansion when @ is at the beginning of a word
shopt -s nocaseglob         # pathname expansion will be treated as case-insensitive
#eval "`dircolors -b`"


# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#[ -z "$PS1" ] && return

#Style
#0 – default
#1 – bold
#4 – underline
#7 – inverse
#9 – strikeout
#
#Foreground Colors
#30 – foreground Black
#31 – foreground Red
#32 – foreground Green
#33 – foreground Yellow
#34 – foreground Blue
#35 – foreground Magenta
#36 – foreground Cyan
#37 – foreground White
#
#Background Colors
#40 – background Black
#41 – background Red
#42 – background Green
#43 – background Yellow
#44 – background Blue
#45 – background Magenta
#46 – background Cyan
#47 – background White

#Custom prompt
COff='\[\e[0m\]'
CBG='\[\e[40m\]'
CF='\[\e[1;36m\]'
CB='\[\e[0;36m\]'
#CBracket1='\[\e[1;32;40m\]'
#CBracket2='\[\e[1;32m\]'
#CTime='\[\e[1;36m\]'
#CPwd='\[\e[1;36m\]'
#CHistory='\[\e[1;36m\]'
#CUser='\[\e[1;36m\]'
#CUID='\[\e[1;36m\]'
git_branch () {
    branch=$(git status -s --branch 2> /dev/null | head -1 | cut -d' ' -f2)
    status=$(git status -s 2> /dev/null)
    [[ $branch ]] && echo "$CB($CF$([[ -n $status ]] && echo "*")$branch$CB) "
}
#export OLDPATH=$(pwd)
#auto_ls() {
#    if [[ $OLDPATH != $(pwd) ]] ; then
#        $OLDPATH=$(pwd)
#        ls -l
#        echo $oldpath
#    fi
#}
#prompt_command () {
    #let FILLSIZE=$COLUMNS-${#PWD}-14-${#LOGNAME}-${#HOSTNAME}
    #FILL=$(perl -e 'print " " x '$FILLSIZE',"\n"')
    #LINE1="$CBracket1[$CBracket1$CTime\t$CBracket1] $CPwd$PWD$FILL"
    #LINE2="$CBracket2[$CUser\u$CBracket2@$CUser\h$CBracket2"']'"$CUID"' \$'"$CBracket2>$COff"
    #PS1="${LINE1}$COff\n${LINE2} "
    #PS1="$CB[$CF\!$CB][$CF\t$CB][$CF\u$CB@$CF\H$CB::$CF\l$CB] $CF$PWD\n$CF\\\$$CB>$COff "
#    PS1="$CB[$CF\t$CB][$CF\u$CB@$CF\h$CB] $CF$PWD\n$(git_branch)$CF\\\$$CB>$COff "
    #PS1=$CBracket1'┌['$CTime'\t'$CBracket1']['$CPwd$PWD$CBracket1']'$FILL$COff'\n'$CBracket2'└['$CUser'\u'$CBracket2'@'$CUser'\h'$CBracket2']'$CUID'\$'$CBracket2'─╼'$COff' '
#}
#PROMPT_COMMAND=prompt_command
PS1='[\u@\h \W]\$ '

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# redefine aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# export
if [ -f ~/.exports ]; then
    . ~/.exports
fi

# ssh agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent > ~/.ssh-agent.lock &> /dev/null
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
  eval "$(<~/.ssh-agent.lock)" &> /dev/null
fi

archey
