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

SECTION "ROM Bank $00c", ROMX[$4000], BANK[$c]

ScreenPrologue1Data:
.map::
    INCBIN "gfx/nectaris/prologue1.map", 20
.tiles::
    INCBIN "gfx/nectaris/prologue1.2bpp"

ScreenPrologue3Data:
.map::
    INCBIN "gfx/nectaris/prologue3.map", 20
.tiles::
    INCBIN "gfx/nectaris/prologue3.2bpp"

    db $e0, $ff, $f8, $ff, $fc, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    db $2a, $00, $00, $7f, $00, $bf, $00, $bf, $00, $df, $80, $df, $c0, $ef, $c0, $ef

ScreenPrologue5Data:
.map::
    INCBIN "gfx/nectaris/prologue5.map", 20
.tiles::
    INCBIN "gfx/nectaris/prologue5.2bpp"

ScreenResultsData:
.map::
    INCBIN "gfx/nectaris/results.map", 20
.tiles::
    INCBIN "gfx/nectaris/results.2bpp"
