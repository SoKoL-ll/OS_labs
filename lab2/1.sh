#!/bin/bash

x="$(ps u $user --no-headers)"
wc -l <<< $x
awk ' { print $1 ":" $11 } ' <<< $x
