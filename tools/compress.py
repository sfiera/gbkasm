#!/usr/bin/env python3

import io
import hunzip
import hzip
import os.path
import sys


def main():
    _, dst, src, orig = sys.argv
    with open(src, "rb") as f:
        uncompressed = f.read()

    # If no orig data exists, just compress the source data.
    # Otherwise, decompress the expected compressed data
    # and verify that it is equal to the source data.
    if os.path.exists(orig):
        with open(orig, "rb") as f:
            compressed = f.read()
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
