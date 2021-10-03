#!/bin/sh

source ~/.profile

# load authentication agent
lxsession -e i3 &>/tmp/lxsession &

# load X resources
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -f ~/.xbindkeysrc ]] && xbindkeys

sleep 2

# load screen layout automatically
srandrd autorandr --change
autorandr --change || . $HOME/.screenlayout/home.sh

# start terminal daemon
urxvtd -f -o &> /tmp/urxvtd

# ibus daemon
ibus-daemon -dr

# reload background
{ sleep 1 ; nitrogen --restore; } &> /tmp/nitrogen &

# load polybar
{ sleep 1; start-polybar; } &

# start megasync
# megasync &>/tmp/megasync

# nm-applet
{ sudo NetworkManager; nm-applet; } &>/tmp/nm-applet &

# languagetool
languagetool --http --port 5555 --allow-origin '*' --public &> /tmp/languagetool &

# redshift
# redshift -l 52.3:4.6 &
