#!/usr/bin/env python3

import io
import hunzip
import hzip
import sys


def main():
    _, dst, src = sys.argv
    comments, deps = [], []

    # input is a specially-formatted Makefile deps file.
    # Non-empty lines are either dependencies or comments.
    with open(src) as f:
        for line in f.readlines():
            line = line.strip()
            if line.startswith("#"):
                comments.append(line[1:])
            elif line:
                deps.append(line)

    # There must be at least one dependency in the file.
    # All targets on the left must equal the destination.
    # The sources are read in order to get the source data.
    assert deps
    uncompressed = bytearray()
    for dep in deps:
        target, sources = dep.split(":")
        assert target == dst
        for source in sources.split():
            with open(source, "rb") as f:
                uncompressed.extend(f.read())

    # If there are comments, the comments contain a hexdump.
    # The hexdump is the “expected” result of compression.
    # In this mode, decompress the expected compressed data
    # and verify that it is equal to the source data.
    # If there are no comments, just compress the source data.
    if comments:
        compressed = bytearray()
        for line in comments:
            while line:
                line = line.lstrip()
                compressed.append(int(line[:2], 16))
                line = line[2:]
        result = io.BytesIO()
        hunzip.unzip(io.BytesIO(compressed), result)
        assert result.getvalue() == uncompressed
    else:
        result = io.BytesIO()
        hzip.zip(io.BytesIO(uncompressed), result)
        compressed = result.getvalue()

    with open(dst, "wb") as f:
        f.write(compressed)


if __name__ == "__main__":
    main()
