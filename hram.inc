; Disassembly of "gbkiss.gb"

SECTION "HRAM Banking", HRAM[$ff80]

hROMBank:: ds 1
hRAMBank:: ds 1

SECTION "HRAM Text", HRAM[$ff8e]

hCursorX:: ds 1
hCursorY:: ds 1
hDraw90:: ds 1
hDraw91:: ds 1
hDrawMode:: ds 1

DEF DrawMode_Bit0 EQU 0
DEF DrawMode_Bit1 EQU 1
DEF DrawMode_Bit2 EQU 2
DEF DrawMode_Bit3 EQU 3
DEF DrawMode_Bit4 EQU 4
DEF DrawMode_Bit5 EQU 5
DEF DrawMode_Bit6 EQU 6
DEF DrawMode_Bit7 EQU 7
