; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

DEF IR_ID0 EQU "H"
DEF IR_ID1 EQU "u"

DEF REGION_TYPE_FREE      EQU "F" ; Available to use
DEF REGION_TYPE_ZEROFILE  EQU "Z" ; Must be located at $a002 (diamond)
DEF REGION_TYPE_REGFILE   EQU "R" ; Regular file; may be located anywhere (circle, triangle)
DEF REGION_TYPE_UNKNOWN   EQU "D" ; Unknown use
DEF REGION_TYPE_SPECIAL   EQU "S" ; Must be located at end of Kiss space

DEF HEADER_SIZE  EQU 6

DEF DrawMode_Bit0 EQU 0
DEF DrawMode_Bit1 EQU 1
DEF DrawMode_Bit2 EQU 2
DEF DrawMode_Bit3 EQU 3
DEF DrawMode_Bit4 EQU 4
DEF DrawMode_Bit5 EQU 5
DEF DrawMode_Bit6 EQU 6
DEF DrawMode_Bit7 EQU 7

def REGION_BEGIN EQU $a002
def REGION_END   EQU $c000
