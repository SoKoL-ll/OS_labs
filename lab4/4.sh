#!/bin/bash
list="$(find $HOME/Backup* -maxdepth 0)"
cDate="$(date +%Y-%m-%d)"
#echo $cDate
rDir="$HOME/restore"
if [[ -e "$rDir" ]]; then
	rm -r "$rDir"
fi
mkdir "$rDir"
sDir="$HOME/source"
for dir in $List
do
	dDate=${dir#*-}
	cDated=$(("$(date -d "$cDate" +%s)" / 86400))
	dDated=$(("$(date -d "$dDate" +%s)" / 86400))
	delta=$((cDated - dDated))
	#echo $delta $cDate $dDate
	if [[ "$delta" -le 7 ]]; then
		breg=".+-[0-9]{4}-[0-9]{2}-[0-9]{2}"
		for i in $(ls "$dir")
		do
			if ! [[ "$i" =~ $breg ]]; then
				cp -r "$dir/$i" "$rDir/$i"
			fi
		done
		exit 0
	fi
done

echo "No actual Backups"
