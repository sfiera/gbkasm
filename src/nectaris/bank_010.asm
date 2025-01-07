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

SECTION "ROM Bank $010", ROMX[$4000], BANK[$10]

screen_10_4000:
.map::
    INCBIN "gfx/nectaris/prologue1.map", 20
.tiles::
    INCBIN "gfx/nectaris/prologue1.2bpp"

screen_10_4b58:
.map::
    INCBIN "gfx/nectaris/prologue2.map", 20
.tiles::
    INCBIN "gfx/nectaris/prologue2.2bpp"

screen_10_5490:
.map::
    INCBIN "gfx/nectaris/prologue3.map", 20
.tiles::
    INCBIN "gfx/nectaris/prologue3.2bpp"

screen_10_5b68:
.map::
    INCBIN "gfx/nectaris/prologue4.map", 20
.tiles::
    INCBIN "gfx/nectaris/prologue4.2bpp"

screen_10_6230:
.map::
    INCBIN "gfx/nectaris/prologue5.map", 20
.tiles::
    INCBIN "gfx/nectaris/prologue5.2bpp"
