#!/bin/bash
array=()
step=0
echo "" > report.log
while true
do
	array+=(1 2 3 4 5 6 7 8 9 10)
	step=$(($step + 1))
	if [[ $(($step*10)) -ge "$1" ]]
	then
		exit 0
	fi
done
