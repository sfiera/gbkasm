#!/usr/bin/env python3

import glob
import os
import re
import sys

pattern = re.compile(r'^\s*INC(?:LUDE|BIN)\s*"([^"]*)"', re.I)
extensions = {}


def main():
    if sys.argv[1:]:
        paths = sys.argv[1:]
    else:
        paths = []
        for root, dirs, files in os.walk("."):
            for file in files:
                name, ext = os.path.splitext(file)
                if ext in extensions:
                    paths.append(os.path.join(root, file))

    for path in paths:
        _, ext = os.path.splitext(path)
        if ext not in extensions:
            print(f"{path}: unknown file type", file=sys.stderr)
            sys.exit(1)
        extensions[ext](path)


def asm_deps(path):
    name, ext = os.path.splitext(path)
    obj = path_for(name + ".o")
    asm = path_for(name + ".asm")
    print("%s: %s" % (obj, asm), end=" ")
    with open(path) as f:
        for line in f.readlines():
            m = pattern.match(line)
            if not m:
                continue
            print(path_for(os.path.join("src", m[1])), end=" ")
    print()


def link_deps(path):
    name, _ = os.path.splitext(path)
    name = os.path.basename(name)
    rom = path_for(name + ".gb")
    print("%s:" % rom, end=" ")
    srcs = glob.glob("src/system/*.asm")
    srcs += glob.glob(f"src/{name}/*.asm")
    for src in srcs:
        name, _ = os.path.splitext(src)
        obj = path_for(name + ".o")
        print(obj, end=" ")
    print()


extensions[".asm"] = asm_deps
extensions[".link"] = link_deps


def path_for(target):
    return os.path.relpath(os.path.realpath(target), ".")


if __name__ == "__main__":
    main()
