#!/bin/sh

grep -o 'trap \$..' file/*.asm \
    | sort \
    | uniq -c \
    | sed 's/^ *\([0-9]*\) \([^:]*\):trap \(.*\)/\3\t\2\t\1/'
