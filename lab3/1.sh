#!/bin/bash
mkdir ~/test && {
	echo "catalog test was created successfully" > ~/report.txt
	touch ~/test/$(date | awk '{print $1 "_" $2 "_" $3 "_" $4}')
}
ping www.net_nikogo.ru || echo "$(date) Host unreachable."
