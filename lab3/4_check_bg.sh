#!/bin/bash
old="$(pgrep '^4_bg.sh$' -o)"
cpulimit -p "$old" -l 10 &
new="$(pgrep '^4_bg.sh$' -n)"
kill "$new"
