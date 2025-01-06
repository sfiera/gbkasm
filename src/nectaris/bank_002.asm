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

SECTION "ROM Bank $002", ROMX[$4000], BANK[$2]

MapTiles::
    INCBIN "gfx/nectaris/maptiles.2bpp"
Font1::
    INCBIN "gfx/nectaris/font1.2bpp"
Font2::
    INCBIN "gfx/nectaris/font2.2bpp"
Font3::
    INCBIN "gfx/nectaris/font3.2bpp"
Font4::
    INCBIN "gfx/nectaris/font4.2bpp"
Font5::
    INCBIN "gfx/nectaris/font5.2bpp"
