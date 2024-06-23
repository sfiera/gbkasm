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
INCLUDE "trap.inc"
INCLUDE "charmap.inc"
INCLUDE "hram.inc"
INCLUDE "bank_000.inc"
INCLUDE "bank_001.inc"
INCLUDE "bank_002.inc"
INCLUDE "bank_003.inc"
INCLUDE "bank_004.inc"
INCLUDE "bank_005.inc"

INCLUDE "group/caravan.inc"
INCLUDE "group/kissmon.inc"
INCLUDE "group/cannon.inc"
INCLUDE "group/binary.inc"
INCLUDE "group/gamedata.inc"
INCLUDE "group/kisstool.inc"
