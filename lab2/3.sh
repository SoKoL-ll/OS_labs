#!/bin/bash
ps -eo pid,ppid,time --no-headers | sort -k10 -r | awk -v pid=$$ ' $2 != pid {print $1}' | head -n 1
