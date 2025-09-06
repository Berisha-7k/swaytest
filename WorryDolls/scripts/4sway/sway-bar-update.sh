
### Date & Time
date=$(date "+%Y-%m-%d")
current_time=$(date "+%H:%M:%S")


### Multimedia
media_artist=$(playerctl --player=spotify metadata artist)
media_song=$(playerctl --player=spotify metadata title)
player_status=$(playerctl --player=spotify status)

### Update
updates=$(checkupdates 2>/dev/null | wc -l)

###Brightness
brightness=$(/etc/sway/scripts/brightness.sh)

#Volume
volume=$(/etc/sway/scripts/volume.sh)

### Greetings
greeting=$(/etc/sway/scripts/greetings.sh)

### Weather
weather=$(cat ~/.cache/weather.json | jq '.main.temp' | awk '{print int($1+0.5)}')
##
weather_loc=$(cat ~/.cache/weather.json | jq -r '.name')
###
w_icon=$(/etc/sway/scripts/weather-text-icon)

echo " $greeting |   $song_status $media_artist - $media_song |                                           | $w_icon $weather °C $weather_loc | $volume | $brightness |   $updates |  $date  $current_time "
