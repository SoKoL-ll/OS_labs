#!/bin/bash

echo "" > fres.log
./run.sh
while [[ $(pgrep -c "mem.bash") -ne 0 || $(pgrep -c "mem.bash") -ne 0 ]] 
do
	rs=$(top -b | head -n 12)
	mln=$(grep -ws "Mem :"  <<< "$rs")
	sln=$(grep -ws "Swap:" <<< "$rs")
	epl=$(tail -n 5 <<< "$rs")
	ms=$(grep -ws "mem.bash" <<< "$rs")
	m2s=$(grep -ws "mem2.bash" <<< "$rs")
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> fres.log
	date >> fres.log
	echo "---------------------------------------------------" >> fres.log
	echo "Memory status $mln" >> fres.log
	echo "Swap status $sln" >> fres.log
	echo "status of folowed processes" >> fres.log
	echo "$ms" >> fres.log
	echo "$m2s" >> fres.log
	echo "top 5 processes:" >> fres.log
	awk '{print $12}' <<< "$epl" >> fres.log

	echo "*******************************" >> fres.log
	sleep 10
done

