#!/usr/bin/zsh

function notify {
	dunstify \
		-h string:x-dunst-stack-tag:ibus \
		-A 'ibus,default' \
		-a "IBUS" \
		-i "/usr/share/icons/Paper/512x512@2x/devices/input-keyboard.png" \
		-t 750 \
		"$@" &>/dev/null &
}

function set_engine {
	local engine="${1:?No engine given}"
	ibus engine "$engine"
	polybar-msg hook ibus
	notify "$engine"
}


current="$(ibus engine)"

USENG="xkb:us::eng"
PINYIN="pinyin"

if [[ "$current" == "$USENG" ]]; then
	set_engine "$PINYIN"
else
	set_engine "$USENG"
fi
