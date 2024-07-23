#!/usr/bin/env python3

import sys


def read(infile, queue, bits):
    mask = (1 << bits) - 1
    if not queue:
        b = infile.read(1)
        if not b:
            raise EOFError
        shift = 8 - bits
        for i in range(8 // bits):
            queue.append((b[0] >> shift) & mask)
            shift -= bits
    return queue.pop(0)


def write(outfile, byte):
    outfile.write(bytearray([byte]))


def unzip(infile, outfile):
    lits, srcs, flags, runs = [], [], [], []
    buffer = bytearray(0x100)
    dst = 0xEF
    try:
        while True:
            if read(infile, flags, 1):
                buffer[dst] = read(infile, lits, 8)
                write(outfile, buffer[dst])
                dst = (dst + 1) & 0xFF
            else:
                src = read(infile, srcs, 8)
                for i in range(2 + read(infile, runs, 4)):
                    buffer[dst] = buffer[src]
                    write(outfile, buffer[dst])
                    src = (src + 1) & 0xFF
                    dst = (dst + 1) & 0xFF
    except EOFError:
        pass


if __name__ == "__main__":
    unzip(sys.stdin.buffer, sys.stdout.buffer)
