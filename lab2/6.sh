#!/bin/bash
ansTop=$(top -b -o %MEM | tail -n +8 | head -n 1 | awk ' { print $1} ')
list=''
for i in $(ps -eo pid --no-headers)
do
	if [ ! -f "/proc/$i/statm" ]; then
		continue
	fi
	mem="$(awk '{print $1}' /proc/$i/statm)"
	list="$list"$'\n'"$pid $mem"
done

stat="$(sort -nrk2 <<< "$list" | head -n 1| awk '{ print $1 }')"
if [ "$ansTop" != "$stat" ]; then
	echo "Not equal top: $ansTop statm: $stat"
else
	echo "Equal $stat"
fi
