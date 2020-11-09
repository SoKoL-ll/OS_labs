#!/bin/bash
awk -F[=:] ' BEGIN {
	curr=-1
	sum=0
	cnt=0
} 
{
	if ($4 == curr) {
		cnt += 1
		sum += $6
		print $0
	} else {
		if (curr == -1) {
			curr = $4
			cnt = 1
			sum = $6
			print $0
		}
		M=sum/cnt
		print "Average_Sleeping_Children_of_ParentID= " curr "is " M
		sum = $6
		cnt = 1
		curr = $4
		print $0
	}
} END {
	M=sum/cnt
	print "Average_Sleeping_Children_of_parentID= " curr "is " M
}' < task4.txt > task5.txt

