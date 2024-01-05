if [ $1 = "up" ]; then
  brightnessctl set +10%
elif [ $1 = "down" ]; then
  brightnessctl set 10%-
fi
CURRENT_BRIGHTNESS=$(brightnessctl | grep Current | awk '{print $4}' | sed 's/(//g' | sed 's/)//g')
notify-send "Brightness: $CURRENT_BRIGHTNESS" -t 200
