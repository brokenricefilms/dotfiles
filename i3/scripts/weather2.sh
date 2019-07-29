#!/usr/bin/env bash

################################
# Shows info about the weather (in Cincinnati) from accuweather.com
################################

full=""
short=""
color=""
status=0


URL='https://www.accuweather.com/de/de/berlin/10178/weather-forecast/178087'
SITE="$(curl -s "$URL")"

weather="$(echo "$SITE" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $14 }'| head -1)"
temp="$(echo "$SITE" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $12"°" }'| head -1)"


if [[ $weather == *thunder* || $weather == *Thunder* ]]; then
    icon="Berlin  "
else
    if [[ $weather == *rain* || $weather == *Rain* ]]; then
        icon="Berlin  "
    else
        if [[ $weather == *cloud* || $weather == *Cloud* ]]; then
            icon="Berlin  "
        else
            icon="Berlin  "
        fi
    fi
fi


full="$icon $temp"
short="$temp"


echo $full
echo $short
echo $color
exit $status
