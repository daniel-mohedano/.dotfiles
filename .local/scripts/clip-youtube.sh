#!/bin/bash

readarray -t urls <<< "$(yt-dlp --youtube-skip-dash-manifest -g "$1")"
ffmpeg -ss $2 -i "${urls[0]}" -ss $2 -i "${urls[1]}" -ss 5 -map 0:v -map 1:a -c:v libx264 -c:a aac -t $3 $4
