#!/bin/bash
ans=1
nowOper="+"
check='^[0-9]+$'
(tail -f pipe) |
	while true; do
		read LINE
		if [[ "$LINE" = "QUIT" ]] ; then
			echo "ans = $ans"
			echo "exit"
			killall 5_generator.sh
			exit
		fi
		if [[ $LINE =~ $check ]] ; then
			if [[ "$nowOper" = "+" ]] ; then
				let ans=$ans+$LINE
			else
				let ans=$ans*$LINE
			fi
		else
			if [[ "$LINE" = "+" || "$LINE" = '*' ]] ; then
				nowOper="$LINE"
			else
				echo "Error input file"
				killall 5_generator.sh
				exit
			fi
		fi
		echo $ans
	done			




