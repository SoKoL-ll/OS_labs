#!/bin/bash
ans=$(sed 's/INFO/Information/g' /var/log/anaconda/syslog | sed 's/WARNING/Warning/g')
grep -w Warning <<< $ans > full.log
grep -w Information <<< $ans >> full.log
