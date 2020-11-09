#!/bin/bash
printf "1 - nano\n2 - vi\n3 - links\n4 - exit\n"
read num
case $num in
	1) 
		nano
		;;
	2)
		vi
		;;
	3)
		links
		;;
	4)
		exit 0
		;;
	*)
		echo error input
		exit 1
		;;
esac


