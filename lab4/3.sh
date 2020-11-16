#!/bin/bash
list="$(find $HOME/Backup* -maxdepth 0)"
cDate="$(date +%Y-%m-%d)"
#echo $cDate
sDir="$HOME/source"
for dir in $list
do
	dDate=${dir#*-}
	cDated=$(("$(date -d "$cDate" +%s)" / 86400))
	dDated=$(("$(date -d "$dDate" +%s)" / 86400))
	delta=$((cDated - dDated))
	#echo $delta $cDate $dDate
	if [[ "$delta" -le 7 ]]; then 
		for i in $(ls "$sDir")
		do
			if [[ -e "$dir/$i" ]]; then
				backSize="$(du -bs $dir/$i | cut -f1)"
				actualSize="$(du -bs $dir/$i | cut -f1)"
				#echo $i $backSize $actualSize
				if [[ "$actualSize" != "$backSize" ]]; then
					mv "$dir/$i" "$dir/$i-$cDate"
					cp -r "$sDir/$i" "$dir/$i"
					if [[ -e "$HOME/backup-report" ]]; then
						touch "$HOME/backup-report"
					fi
					echo "$dir was modified file $i changed name by $i-$cDate new file $i was copied from $cDir" >> "$HOME/backup-report"
				fi
			else
				cp -r "$sDir/$i" "$dir/$i"
			fi
		done
		exit 0
	fi
done
bDir="$HOME/Backup-$cDate"
mkdir "$bDir"
for i in $(ls "$sDir")
do
	cp -r "$sDir/$i" "$bDir/$i"
done

