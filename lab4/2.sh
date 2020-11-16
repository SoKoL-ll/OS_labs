#!/bin/bash
file="$1"
if [[ "$file" =~ .*/.* ]]; then
	echo "Incorrect input file"
	exit 1
fi

awk -v text=$file '{
	regex="/.*"text"$/"
	print regex
	print $1
	if ($1 ~ /.*zzz$/) print $0
	}' < $HOME/.trash.log
exit 0
