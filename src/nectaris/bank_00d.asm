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

SECTION "ROM Bank $00d", ROMX[$4000], BANK[$d]

Splash1:
.map::
    INCBIN "gfx/nectaris/splash1.map", 20
.tiles::
    INCBIN "gfx/nectaris/splash1.2bpp"

Splash2:
.map::
    INCBIN "gfx/nectaris/splash2.map", 20
.tiles::
    INCBIN "gfx/nectaris/splash2.2bpp"

Splash3:
.map::
    INCBIN "gfx/nectaris/splash3.map", 20
.tiles::
    INCBIN "gfx/nectaris/splash3.2bpp"

Splash4:
.map::
    INCBIN "gfx/nectaris/splash4.map", 20
.tiles::
    INCBIN "gfx/nectaris/splash4.2bpp"

Splash5:
.map::
    INCBIN "gfx/nectaris/splash5.map", 20
.tiles::
    INCBIN "gfx/nectaris/splash5.2bpp"
