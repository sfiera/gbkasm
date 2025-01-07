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

screen_0c_4000:
.map::
    INCBIN "gfx/nectaris/begin.map", 20
.tiles::
    INCBIN "gfx/nectaris/begin.2bpp"

screen_0c_4d28:
.map::
    INCBIN "gfx/nectaris/splash6.map", 20
.tiles::
    INCBIN "gfx/nectaris/splash6.2bpp"

    db $e0, $ff, $f8, $ff, $fc, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    db $2a, $00, $00, $7f, $00, $bf, $00, $bf, $00, $df, $80, $df, $c0, $ef, $c0, $ef

screen_0c_5eb0:
.map::
    INCBIN "gfx/nectaris/splash7.map", 20
.tiles::
    INCBIN "gfx/nectaris/splash7.2bpp"

screen_0c_6e68:
.map::
    INCBIN "gfx/nectaris/results.map", 20
.tiles::
    INCBIN "gfx/nectaris/results.2bpp"
