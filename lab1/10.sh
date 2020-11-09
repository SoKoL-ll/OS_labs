#!/bin/bash
man bash | grep -Eo "\w{4,}" | sort | uniq -c | sort -rnk1 | awk '{print $2}' | sed -n '1,3 p'
