#!/bin/sh

grep -o '^\s*trap \$..\|call trap_..' file/*.asm bank_*.inc \
    | sort \
    | uniq -c \
    | sed -E 's/^ *([0-9]*) ([^:]*):.*(trap \$|call trap_)(.*)/$\4\t\2\t\1/'
