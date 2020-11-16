#!/bin/bash
file="$(realpath $1)"

if ! [[ -d ~/.trash ]]; then
	mkdir ~/.trash
fi

if ! [[ -f "$file" ]]; then
	echo "incorrect filename $file"
	exit 1
fi

unique="$(date +"%m_%d_%Y_%T").lnk"
ln "$file" "$HOME/.trash/$unique" && rm "$file"

echo "$file $unique" >> $HOME/.trash.log
