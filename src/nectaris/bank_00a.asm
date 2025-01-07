; Disassembly of "Nectaris GB (Japan) (SGB Enhanced).gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "consts.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

SECTION "ROM Bank $00a", ROMX[$4000], BANK[$a]

FactoryTaken:
.map::
    INCBIN "gfx/nectaris/factory.map"
.tiles::
    INCBIN "gfx/nectaris/factory.2bpp"
