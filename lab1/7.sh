#!/bin/bash
grep -Ewoa '[[:alnum:]\-_]+\@[[:alnum:]\-]+\.[[:alpha:]]{2,3}' -r /etc -h > emails.lst
