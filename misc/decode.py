#!/usr/bin/env python3

import sys

charmap = {}
for base, chars in {
    0x00: "\n\r",
    0x0E: "»«",
    0x20: " !\"#$%&'()*+,-./",
    0x30: "0123456789",
    0x3A: ":;<=>?@",
    0x41: "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
    0x5B: "[\\]^_`",
    0x61: "abcdefghijklmnopqrstuvwxyz",
    0x7B: "{|}",
    0xA6: "ｦｧｨｩｪｫｬｭｮｯｰ",
    0xB1: "ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜﾝﾞﾟ",
}.items():
    for i, ch in enumerate(chars):
        charmap[base + i] = ch

data = sys.stdin.read().split("$")
print('    db "', end="", flush=True)
for part in data[1:]:
    byte = int(part[:2], base=16)
    char = charmap[byte]
    if char < " ":
        char = repr(char)[1:-1]
    print(char, end="", flush=True)
    if byte == 0:
        print('"\n    db "', end="", flush=True)
print('"')
