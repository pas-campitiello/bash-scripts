#!/bin/bash
echo "----------------------------------------------"
filename="$1"
#minutes_block=20
minutes_block="$2"
duration_stamp=$(ffmpeg -i "$filename" 2>&1 | grep Duration | sed 's/^.*Duration: *\([^ ,]*\),.*/\1/g')
title=$(ffmpeg -i "$filename" 2>&1  | grep "title *:" | sed 's/^.*title *: *\(.*\)/\1/g')
# get minutes as a raw integer number (rounded up)
prefix=$(basename "$filename" .mp3)
echo "Total audio duration =" $duration_stamp
echo "----------------------------------------------"
mins=$(echo "$duration_stamp" | sed 's/\([0-9]*\):\([0-9]*\):\([0-9]*\)\.\([0-9]*\)/\1*60+\2+\3\/60+\4\/60\/100/g' | bc -l | python -c "import math; print(int(math.ceil(float(input()))))")
echo "Total audio duration in minutes =" $mins
echo "----------------------------------------------"
ss="0"
count="1"
total_count=$(echo "$mins/$minutes_block"+1 | bc)
echo "Blocks to be produced =" + $total_count
echo "----------------------------------------------"

while [ "$ss" -lt "$mins" ]
do
  zcount=$(printf "%05d" $count)
  ss_hours=$(echo "$ss/60" | bc)
  ss_mins=$(echo "$ss%60" | bc)
  ss_stamp=$(printf "%02d:%02d:00" $ss_hours $ss_mins)
  ffmpeg -i "$filename" -acodec copy -t 00:$minutes_block:00 -ss $ss_stamp -metadata track="$count/$total_count" -metadata title="$title $zcount" "$prefix-$zcount.mp3" 
  echo $zcount $ss_hour $ss_mins $ss_stamp
  ss=$[$ss+$minutes_block]
  count=$[$count+1]
done
echo "----------------------------------------------" 
echo "SPLIT PROCESS COMPLETED"
echo "----------------------------------------------" 
