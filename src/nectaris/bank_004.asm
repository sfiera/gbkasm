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

SECTION "ROM Bank $004", ROMX[$4000], BANK[$4]

ScreenGameOverData:
.map::
    INCBIN "gfx/nectaris/gameover.map", 20
.tiles::
    INCBIN "gfx/nectaris/gameover.2bpp"

ScreenWorldMapData:
.map::
    INCBIN "gfx/nectaris/worldmap.map", 20
.tiles::
    INCBIN "gfx/nectaris/worldmap.2bpp"

FactoryTileMap1::
    INCBIN "gfx/nectaris/factory.map", 40, 80
FactoryTileMap2::
    INCBIN "gfx/nectaris/factory.map", 120, 20
FactoryTileMap3::
    INCBIN "gfx/nectaris/factory.map", 140, 480
FactoryTileMap4::
    INCBIN "gfx/nectaris/factory.map", 620, 220
FactoryTileData::
    INCBIN "gfx/nectaris/factory.2bpp"

Font7::
    INCBIN "gfx/nectaris/font7.2bpp"
