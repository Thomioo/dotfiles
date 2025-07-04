#!/bin/bash

STATE_FILE="$HOME/.config/waybar/.brightness_state"
MONITOR_BUS=4
STEP=10

# Define icons array
ICONS=("" "" "" "" "" "" "" "" "")

# Initialize brightness state if missing or invalid
if [ ! -f "$STATE_FILE" ]; then
  echo 50 > "$STATE_FILE"
fi

brightness=$(cat "$STATE_FILE" 2>/dev/null | tr -cd '0-9')
brightness=${brightness:-50}

# Function to get icon based on brightness value
get_icon() {
  val=$1
  if [ "$val" -le 10 ]; then
    echo "${ICONS[0]}"
  elif [ "$val" -le 20 ]; then
    echo "${ICONS[1]}"
  elif [ "$val" -le 30 ]; then
    echo "${ICONS[2]}"
  elif [ "$val" -le 40 ]; then
    echo "${ICONS[3]}"
  elif [ "$val" -le 50 ]; then
    echo "${ICONS[4]}"
  elif [ "$val" -le 60 ]; then
    echo "${ICONS[5]}"
  elif [ "$val" -le 70 ]; then
    echo "${ICONS[6]}"
  elif [ "$val" -le 85 ]; then
    echo "${ICONS[7]}"
  else
    echo "${ICONS[8]}"
  fi
}

case "$1" in
  up)
    new=$((brightness + STEP))
    [ "$new" -gt 100 ] && new=100
    echo $new > "$STATE_FILE"
    ddcutil setvcp 10 $new --bus=$MONITOR_BUS
    ;;
  down)
    new=$((brightness - STEP))
    [ "$new" -lt 0 ] && new=0
    echo $new > "$STATE_FILE"
    ddcutil setvcp 10 $new --bus=$MONITOR_BUS
    ;;
  *)
    icon=$(get_icon "$brightness")
    echo "$brightness% $icon"   ;;
esac

