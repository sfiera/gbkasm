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

SECTION "ROM Bank $00d", ROMX

ScreenEpilogue1Data:
.map::
    INCBIN "gfx/nectaris/epilogue1.map", 20
.tiles::
    INCBIN "gfx/nectaris/epilogue1.2bpp"

ScreenEpilogue2Data:
.map::
    INCBIN "gfx/nectaris/epilogue2.map", 20
.tiles::
    INCBIN "gfx/nectaris/epilogue2.2bpp"

ScreenEpilogue3Data:
.map::
    INCBIN "gfx/nectaris/epilogue3.map", 20
.tiles::
    INCBIN "gfx/nectaris/epilogue3.2bpp"

ScreenEpilogue4Data:
.map::
    INCBIN "gfx/nectaris/epilogue4.map", 20
.tiles::
    INCBIN "gfx/nectaris/epilogue4.2bpp"

ScreenEpilogue5Data:
.map::
    INCBIN "gfx/nectaris/epilogue5.map", 20
.tiles::
    INCBIN "gfx/nectaris/epilogue5.2bpp"
