#!/bin/bash

# Define directories for each time of day
MORNING="$HOME/Pictures/Timepaper/Morning/"
DAY="$HOME/Pictures/Timepaper/Day/"
EVENING="$HOME/Pictures/Timepaper/Evening/"
NIGHT="$HOME/Pictures/Timepaper/Night/"

# Function to change the wallpaper based on time of day
change_wallpaper() {
    # Fetch time
    HOUR=$(date +'%H')

    # Determine directory to use based on time
    if [ $HOUR -ge 6 ] && [ $HOUR -lt 10 ] || [ $HOUR -ge 17 ] && [ $HOUR -lt 20 ]; then
    	# is Morning and Evening
        DIR1="$MORNING"
        DIR2="$EVENING"
        DIR3="$NIGHT"
    elif [ $HOUR -ge 10 ] && [ $HOUR -lt 17 ]; then
    	# is Day
        DIR1="$DAY"
        DIR2="$EVENING"
        DIR3="$MORNING"
    else
    	# is Night
        DIR1="$NIGHT"
        DIR2="$MORNING"
        DIR3=""
    fi

    # Set the wallpaper for workspaces 3-6
    for WORKSPACE in {0..6}; do
    
    	WALLPAPERS=$(find "$DIR1" "$DIR2" "$DIR3" -type f | shuf -n 1)
    	echo $WALLPAPERS
    	
        xfconf-query -c xfce4-desktop -p "/backdrop/screen0/monitoreDP-1/workspace${WORKSPACE}/last-image" -s "$WALLPAPERS"
    done
}

# Infinite loop to change wallpaper by selected time (seconds/60)
while true; do
    change_wallpaper
    sleep 900
done
