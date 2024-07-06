; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

DEF IR_ID0 EQU "H"
DEF IR_ID1 EQU "u"

DEF REGION_FREE      EQU "F" ; Available to use
DEF REGION_ZEROFILE  EQU "Z" ; Must be located at $a002 (diamond)
DEF REGION_REGFILE   EQU "R" ; Regular file; may be located anywhere (circle, triangle)
DEF REGION_UNKNOWN   EQU "D" ; Unknown use
DEF REGION_SPECIAL   EQU "S" ; Must be located at end of Kiss space

DEF DrawMode_Bit0 EQU 0
DEF DrawMode_Bit1 EQU 1
DEF DrawMode_Bit2 EQU 2
DEF DrawMode_Bit3 EQU 3
DEF DrawMode_Bit4 EQU 4
DEF DrawMode_Bit5 EQU 5
DEF DrawMode_Bit6 EQU 6
DEF DrawMode_Bit7 EQU 7

def rIRMode     equ $0000
def kIRModeOff  equ $00
def kIRModeOn   equ $0a
def rROMBank    equ $2000
def rRAMBank    equ $4000
def rIgnored    equ $6000
def rIR         equ $a000
