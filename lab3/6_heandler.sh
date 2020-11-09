#!/bin/bash
echo $$ > .pid
ans=1
mode=""
usr1()
{
	mode="add"
}

usr2()
{
	mode="multiply"
}
sigterm()
{
	mode="end"
}
trap 'usr1' USR1
trap 'usr2' USR2
trap 'sigterm' SIGTERM
while true; do
	case $mode in
		"add")
			let ans=$ans+2
			echo $ans
			;;
		"multiply")
			let ans=$ans*2
			echo $ans
			;;
		"end")
			echo "Stopped by SIGTERM"
			exit
			;;
	esac
	sleep 1
done
