#!/usr/bin/env python3

import os
import re
import sys

pattern = re.compile(r'^\s*INC(?:LUDE|BIN)\s*"([^"]*)"', re.I)

for path in sys.argv[1:]:
    path, _ = os.path.splitext(path)
    obj = path + ".o"
    asm = path + ".asm"
    print("%s: %s" % (obj, asm), end=" ")
    with open(asm) as f:
        for line in f.readlines():
            m = pattern.match(line)
            if not m:
                continue
            print(os.path.relpath(os.path.realpath(os.path.join("src", m[1])), "."), end=" ")
    print()
