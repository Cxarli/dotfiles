#!/bin/sh

blacker=00000077
black=000000cc
grey=cccccccc
white=ffffffcc

red=ff0000cc
yellow=ffff00cc
green=00ff00cc
cyan=00ffffcc
blue=0000ffcc
magenta=ff00ffcc

trans=00000000

left=1
center=0
right=2


/usr/bin/i3lock \
	\
	$(: general options) \
	--image ~/lock.png \
	--ignore-empty-password \
	--show-failed-attempts \
	--nofork \
	--pointer=default \
	\
	$(: --indicator) \
	--composite \
	--color=$black \
	\
	$(: clock) \
	--force-clock \
	--time-pos="x+w/2:y+h/2-r*(3/2)" \
		--time-color=$white \
		--time-font=monospace \
		--time-size=40 \
		--time-align=$center \
	\
	--date-pos="tx:ty-40" \
		--date-color=$grey \
		--date-font=monospace \
		--date-size=20 \
		--date-align=$center \
	\
	$(: pass all keys) \
	--pass-media-keys \
	--pass-screen-keys \
	--pass-power-keys \
	--pass-volume-keys \
	\
	$(: inside colors) \
	--insidever-color=$black \
	--insidewrong-color=330000cc \
	--inside-color=$black \
	\
	$(: ring colors) \
	--ringver-color=$cyan \
	--ringwrong-color=$red \
	--ring-color=$blacker \
	\
	$(: misc colors) \
	--line-color=$trans \
	--keyhl-color=$cyan \
	--bshl-color=$magenta \
	--separator-color=$black \
	--verif-color=$white \
	--wrong-color=$red \
	--layout-color=$white \
	\
	$(: greeter) \
	--greeter-text="Welcome back" \
	--greeter-color=$white \
	--greeter-pos="x+w/2:y+3*h/4" \
	--greeter-font=monospace \
	--greeter-size=30 \
	\
	$(: ring) \
	--radius=100 \
	--ring-width=5.0 \
	\
	$(: texts) \
	--verif-text="" \
	--wrong-text="wrong" \
	--noinput-text="" \
	--lock-text="locking..." \
	--lockfailed-text="! LOCK FAILED !" \
	\
	"$@"

