#!/bin/bash
n=$1 2000000 
k=$2 30
step=0
while [[ "$step" -lt "$k" ]]
do
	step=$(($step + 1))
	./newmem.bash "$n"&
	sleep 1s
done
