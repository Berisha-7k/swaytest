
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
brightness=$(/home/x3ck/Documents/scripts/brightness.sh)

#Volume
volume=$(/home/x3ck/Documents/scripts/volume.sh)

### Greetings
greeting=$(hour=`date +%H`
if [ $hour -lt 12 ] # if hour is less than 12
then
echo "GOOD MORNING $USER"
elif [ $hour -le 16 ] # if hour is less than equal to 16
then
echo "GOOD AFTERNOON $USER"
elif [ $hour -le 20 ] # if hour is less than equal to 20
then
echo "GOOD EVENING $USER"
else
echo "GOOD NIGHT $USER"
fi
)


### Weather
weather=$(cat ~/.cache/weather.json | jq '.main.temp' | awk '{print int($1+0.5)}')
##
weather_loc=$(cat ~/.cache/weather.json | jq -r '.name')
###
w_icon=$(/home/x3ck/Documents/scripts/Capella/scripts/weather-text-icon)

echo " $greeting |   $song_status $media_artist - $media_song |                                           | $w_icon $weather °C $weather_loc | $volume | $brightness |   $updates |  $date  $current_time "
