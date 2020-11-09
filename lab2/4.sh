#!/bin/bash
allPid=$(ps -eo pid --no-headers)
touch task4.txt
for i in $allPid
do
	num="[0-9]+$"
	pid=$i
	PPid=$(grep -s PPid /proc/$pid/status | awk ' {print $2} ')
	sum=$(grep -s sum_exec_runtime /proc/$pid/sched | awk ' {print $3} ')
	nr=$(grep -s nr_switches /proc/$pid/sched | awk ' {print $3} ')
	if ! [[ "$pid" =~ $num && "$PPid" =~ $num && "$sum" =~ $num && "$nr" =~ $num ]]; then
		continue
	fi
	echo -n "$pid $PPid "
	echo " $sum / $nr " | bc -l
	
done | sort -gk2 | awk '{ printf("ProcessID=%s : Parent_ProcessID=%s : Average_Running_Time=%s\n", $1, $2, $3) }' > task4.txt


