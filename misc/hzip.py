#!/usr/bin/env python3

import itertools
import sys


def read_byte(infile):
    b = infile.read(1)
    return b[0] if b else None


class Cursor:
    def __init__(self, count):
        self.count = count
        self.index = None


def write_flag(flag, output, cursor):
    if cursor.count == 8:
        cursor.index = len(output)
        cursor.count = 0
        output.append(0)
    output[cursor.index] |= ((flag << 7) & 0xFF) >> cursor.count
    cursor.count += 1


def write_run(run, output, cursor):
    if cursor.count == 2:
        cursor.index = len(output)
        cursor.count = 0
        output.append(0)
    output[cursor.index] |= ((run << 4) & 0xFF) >> (4 * cursor.count)
    cursor.count += 1


def write_lit(lit, output):
    output.append(lit)


def write_src(src, output):
    output.append(src)


def flush_until(pos, output, queue, flush_idx, flag_cursor):
    while flush_idx < pos:
        write_flag(1, output, flag_cursor)
        write_lit(queue.pop(0), output)
        flush_idx += 1
    return flush_idx


def zip(infile, outfile):
    buffer = bytearray(0x100)
    dst = 0xEF
    queue = []
    history = []

    flag_cursor = Cursor(8)
    run_cursor = Cursor(2)
    flush_idx = -1

    output = bytearray()

    for idx in itertools.count():
        byte = read_byte(infile)
        queue.append(byte)

        if history:
            prev = history[-1]
        else:
            prev = {}
        history.append({})
        this = history[-1]

        for off in range(1, 0x100):
            src = (0x100 + dst - off) & 0xFF
            if buffer[src] == byte:
                this[off] = prev.get(off, 0) + 1

        this_off, this_max = max(this.items(), key=lambda kv: (kv[1], kv[0]), default=(0, 0))
        prev_off, prev_max = max(prev.items(), key=lambda kv: (kv[1], kv[0]), default=(0, 0))

        if this_max == 17:
            # Maximum size run.
            # Flush now and restart.
            flush_idx = flush_until(idx - this_max, output, queue, flush_idx, flag_cursor)
            write_flag(0, output, flag_cursor)
            write_src((0x1F0 + idx - this_off - this_max) & 0xFF, output)
            write_run(this_max - 2, output, run_cursor)
            queue[:] = []
            history[:] = []
            flush_idx = idx
        elif (this_max <= prev_max) and prev_max >= 2:
            # Previous run ended.
            # Flush it and continue from here.
            flush_idx = flush_until(idx - prev_max - 1, output, queue, flush_idx, flag_cursor)
            write_flag(0, output, flag_cursor)
            write_src((0x1EF + idx - prev_off - prev_max) & 0xFF, output)
            write_run(prev_max - 2, output, run_cursor)
            queue[:-1] = []
            history[:] = [{k: 1 for k in this}]
            flush_idx = idx - 1
        elif this_max == prev_max:
            # Equal to previous run.
            # Flush start of previous run and try to continue current run.
            flush_idx = flush_until(idx - this_max - 1, output, queue, flush_idx, flag_cursor)
        elif this_max == None:
            flush_idx = flush_until(idx, output, queue, flush_idx, flag_cursor)

        if byte is None:
            break

        buffer[dst] = byte
        dst = (dst + 1) & 0xFF

    outfile.write(output)


if __name__ == "__main__":
    zip(sys.stdin.buffer, sys.stdout.buffer)
