#!/bin/bash

#check if user runs XFCE
if ! [ "$(pgrep -l xfce4)" ]; then
	echo "This script is intended for XFCE!"
	exit 1
fi

#Directories used
INSTALL="$HOME/"
SCRIPT="timepaper.sh"
SCRIPT_PATH="$INSTALL/$SCRIPT"

if [ ! -f "$SCRIPT" ]; then
	echo "$SCRIPT is missing from the current directory"
	exit 1
fi

mkdir "$HOME/Pictures/Timepaper/"
TP="$HOME/Pictures/Timepaper/"
mkdir "$TP/Morning" "$TP/Day" "$TP/Evening" "$TP/Night"
cp "$SCRIPT" "$INSTALL"
chmod +x "$SCRIPT_PATH"
echo "$SCRIPT has been copied to $INSTALL and made executable."

AUTODIR="$HOME/.config/autostart"
AUTOFILE="$AUTODIR/timepaper.desktop"

mkdir -p "$AUTODIR"

echo "[Desktop Entry]
Type=Application
Name= Timepaper (XFCE)
Exec=bash -c "$SCRIPT_PATH"
NoDisplay=false
Comment=Changes wallpaper based on time of day" > "$AUTOFILE"

echo "Autostart entry created at "$AUTOFILE""

echo "Installation complete. Script should run at login"
