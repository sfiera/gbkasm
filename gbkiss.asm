; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "hardware.inc"

def rIRMode     equ $0000
def kIRModeOff  equ $00
def kIRModeOn   equ $0a
def rROMBank    equ $2000
def rRAMBank    equ $4000
def rIgnored    equ $6000
def rIR         equ $a000

INCLUDE "macro.inc"
INCLUDE "charmap.inc"
INCLUDE "hram.asm"
INCLUDE "bank_000.asm"
INCLUDE "bank_001.asm"
INCLUDE "bank_002.asm"
INCLUDE "bank_003.asm"
INCLUDE "bank_004.asm"
INCLUDE "bank_005.asm"

INCLUDE "coll1.asm"
INCLUDE "coll2.asm"
INCLUDE "coll3.asm"
INCLUDE "coll4.asm"
INCLUDE "coll5.asm"
INCLUDE "coll6.asm"
