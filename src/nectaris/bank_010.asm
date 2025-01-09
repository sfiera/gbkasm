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

ScreenPrologue2Data:
.map::
    INCBIN "gfx/nectaris/prologue2.map", 20
.tiles::
    INCBIN "gfx/nectaris/prologue2.2bpp"

ScreenPrologue4Data:
.map::
    INCBIN "gfx/nectaris/prologue4.map", 20
.tiles::
    INCBIN "gfx/nectaris/prologue4.2bpp"

ScreenPrologue6Data:
.map::
    INCBIN "gfx/nectaris/prologue6.map", 20
.tiles::
    INCBIN "gfx/nectaris/prologue6.2bpp"

ScreenPrologue7Data:
.map::
    INCBIN "gfx/nectaris/prologue7.map", 20
.tiles::
    INCBIN "gfx/nectaris/prologue7.2bpp"

ScreenEpilogue6Data:
.map::
    INCBIN "gfx/nectaris/epilogue6.map", 20
.tiles::
    INCBIN "gfx/nectaris/epilogue6.2bpp"
