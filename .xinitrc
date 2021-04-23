#!/bin/sh

source ~/.profile

# load authentication agent
lxsession -e i3 &>/tmp/lxsession &

# load X resources
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -f ~/.xbindkeysrc ]] && xbindkeys

# load screen layout automatically
srandrd autorandr --change
autorandr --change || . $HOME/.screenlayout/home.sh

# start terminal daemon
urxvtd -f -o &> /tmp/urxvtd

# reload background
nitrogen --restore &> /tmp/nitrogen

# load polybar
start-polybar

# start megasync
# megasync &>/tmp/megasync

# nm-applet
{ sudo NetworkManager; nm-applet; } &>/tmp/nm-applet &

# redshift
redshift -l 52.3:4.6 &
