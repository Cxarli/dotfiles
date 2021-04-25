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
	--timepos="x+w/2:y+h/2-r*(3/2)" \
		--timecolor=$white \
		--time-font=monospace \
		--timesize=40 \
		--time-align=$center \
	\
	--datepos="tx:ty-40" \
		--datecolor=$grey \
		--date-font=monospace \
		--datesize=20 \
		--date-align=$center \
	\
	$(: pass all keys) \
	--pass-media-keys \
	--pass-screen-keys \
	--pass-power-keys \
	--pass-volume-keys \
	\
	$(: inside colors) \
	--insidevercolor=$black \
	--insidewrongcolor=330000cc \
	--insidecolor=$black \
	\
	$(: ring colors) \
	--ringvercolor=$cyan \
	--ringwrongcolor=$red \
	--ringcolor=$blacker \
	\
	$(: misc colors) \
	--linecolor=$trans \
	--keyhlcolor=$cyan \
	--bshlcolor=$magenta \
	--separatorcolor=$black \
	--verifcolor=$white \
	--wrongcolor=$red \
	--layoutcolor=$white \
	\
	$(: greeter) \
	--greetertext="Welcome back" \
	--greetercolor=$white \
	--greeterpos="x+w/2:y+3*h/4" \
	--greeter-font=monospace \
	--greetersize=30 \
	\
	$(: ring) \
	--radius=100 \
	--ring-width=5.0 \
	\
	$(: texts) \
	--veriftext="" \
	--wrongtext="wrong" \
	--noinputtext="" \
	--locktext="locking..." \
	--lockfailedtext="! LOCK FAILED !" \
	\
	"$@"

