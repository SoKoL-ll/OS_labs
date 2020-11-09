#!/bin/bash
touch .first
for pid in $(ps -eo pid --no-headers)
do
	if [ ! -f "/proc/$pid/io" ]; then
		continue
	fi
	mem="$(awk -s '/read_bytes/{ print $2 }' /proc/$pid/io)"
	echo "$pid $mem" >> .first
done
sleep 60 

touch .list
while read i || [ -n "$i" ]; do
	pid="$(awk '{ print $1 }' <<< $i)"
	if [ -f "/proc/$pid/io" ]; then
		mem="$(awk '/read_bytes/{ print $2 }' /proc/$pid/io)"
		prevmem="$(awk '{ print $2}' <<< $i)"
		let delta="$mem - $prevmem"
		cmd="nocmd"
		if [ -s "/proc/$pid/cmline" ]; then
			cmd="$(cat /proc/$pid/cmdline)"
		fi
		echo "$pid $delta $cmd" >> .list
	fi
done < .first
sort -rnk2 .list | head -n 3 | awk '{ print $1 ":" $2 ":" $3 }'
rm -rf .first
rm -rf .list
