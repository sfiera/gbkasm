; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

def rIRMode       EQU $0000
def kIRReadOnly   EQU $00
def kIRReadWrite  EQU $0a
def kIRModeOn     EQU $0e
def rROMBank      EQU $2000
def rRAMBank      EQU $4000
def rIgnored      EQU $6000
def rIR           EQU $a000
