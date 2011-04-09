#!/bin/sh
# $Id$
#
# Author: Charles Mauch (charles@mauch.name)
# Description: Neat Colorized Bash Prompt
# Created : Sun 02 Oct 2005 11:01:50 PM PDT
# Legal: (c) 2005 Charles Mauch, released under the terms of the GPLv2
#

DOMAIN=`dnsdomainname`

ResetColours="\[\033[0m\]"
Black="\[\033[0;30m\]"
BlackBG="\[\033[0;40m\]"
DarkGrey="\[\033[1;30m\]"
LightGrey="\[\033[0;37m\]"
LightGreyBG="\[\033[0;47m\]"
White="\[\033[1;37m\]"

Red="\[\033[0;31m\]"
RedBG="\[\033[0;41m\]"
LightRed="\[\033[1;31m\]"

Green="\[\033[0;32m\]"
GreenBG="\[\033[0;42m\]"
LightGreen="\[\033[1;32m\]"

Brown="\[\033[0;33m\]"
BrownBG="\[\033[0;43m\]"
Yellow="\[\033[1;33m\]"

Blue="\[\033[0;34m\]"
BlueBG="\[\033[0;44m\]"
BrightBlue="\\033[1;34m\]"

Purple="\[\033[0;35m\]"
PurpleBG="\[\033[0;45m\]"
Pink="\[\033[1;35m\]"

Cyan="\[\033[0;36m\]"
CyanBG="\[\033[0;46m\]"
BrightCyan="\[\033[1;36m\]"

smiley() {
  err=$?
  if [ $err == 0 ]
  then echo ")"
  else echo "( $err"
  fi
}

function promptcmd {
case "$TERM" in
xterm*|rxvt*|Eterm*|screen*)
    if [ -f ~/bin/termtitle ]; then
     local TitleBar="\033]0;`~/bin/termtitle`\007"
    else
     local TitleBar="\033]0;:: terminal \l on host \H in ${PWD} ::\007"
    fi
    ;;
*)
   local TitleBar=""
    ;;
esac

pwd_length=25

DIR=`pwd`

echo $DIR | grep "^$HOME" >> /dev/null

if [ $? -eq 0 ]
then
  CURRDIR=`echo $DIR | awk -F$HOME '{print $2}'`
  newPWD="~$CURRDIR"

  if [ $(echo -n $newPWD | wc -c | tr -d " ") -gt $pwd_length ]
  then
    newPWD="~/..$(echo -n $PWD | sed -e "s/.*\(.\{$pwd_length\}\)/\1/")"
  fi
elif [ "$DIR" = "$HOME" ]
then
  newPWD="~"
elif [ $(echo -n $PWD | wc -c | tr -d " ") -gt $pwd_length ]
then
  newPWD="${DarkGrey}<${Pink}<${Pink}<  $(echo -n $PWD | sed -e "s/.*\(.\{$pwd_length\}\)/\1/")"
else
  newPWD="$(echo -n $PWD)"
fi

PS1="\n${TitleBar}${DarkGrey}>${Green}>${LightGreen}>${Green}:/${LightGreen}\u${Green}@\h.${DOMAIN}${DarkGrey}(${LightGreen}\!${DarkGrey})\n${Cyan}[${BrightCyan}\D{%H}${Cyan}:${BrightCyan}\D{%M}${Cyan}:${BrightCyan}\D{%S}${Cyan}] ${LightGrey}\$: ${Pink}${newPWD} ${DarkGrey}>${LightGrey}:${White}\$(smiley) ${ResetColours}"
PS2="${DarkGrey}>${Purple}>${Pink}> ${ResetColours}"

}
PROMPT_COMMAND="promptcmd"
