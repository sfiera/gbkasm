#!/bin/sh

find src -name '*.asm' -or -name '*.inc' \
    | xargs grep -o '^\s*trap \$..\|call trap_..' \
    | sort \
    | uniq -c \
    | sed -E 's/^ *([0-9]*) ([^:]*):.*(trap \$|call trap_)(.*)/$\4\t\2\t\1/'
