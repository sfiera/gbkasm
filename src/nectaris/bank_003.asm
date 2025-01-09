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

SECTION "ROM Bank $003", ROMX[$4000], BANK[$3]

Units::
    INCBIN "gfx/nectaris/units.2bpp"

BattleTileMap1::
    INCBIN "gfx/nectaris/battle.map", 40, 100
BattleTileMap2::
    INCBIN "gfx/nectaris/battle.map", 140, 10
BattleTileMap3::
    INCBIN "gfx/nectaris/battle.map", 150, 10
BattleTileMap4::
    INCBIN "gfx/nectaris/battle.map", 160, 160
BattleTileMap5::
    INCBIN "gfx/nectaris/battle.map", 320, 160
BattleTileMap6::
    INCBIN "gfx/nectaris/battle.map", 480, 160
BattleTileMap7::
    INCBIN "gfx/nectaris/battle.map", 640, 160
BattleTileMap8::
    INCBIN "gfx/nectaris/battle.map", 800
BattleTileData::
    INCBIN "gfx/nectaris/battle.2bpp", 0, 304
    ds 32, $ff  ; tiles $94 and $95 must be blanked out
    INCBIN "gfx/nectaris/battle.2bpp", 336, 2304
    ds 16, $ff  ; tile $25 must be blanked out
    INCBIN "gfx/nectaris/battle.2bpp", 2656, 96

Messages::
    INCBIN "gfx/nectaris/messages.2bpp"

ScreenTitleData:
.map::
    INCBIN "gfx/nectaris/title.map", 20
.tiles::
    INCBIN "gfx/nectaris/title.2bpp"

TileMapWeaponDataUnused::
    ; This part of the source image ensures that all ASCII is in the tileset.
    ; It is never itself displayed within the game.
    INCBIN "gfx/nectaris/weapondata.map", 20, 120
TileMapWeaponData::
    INCBIN "gfx/nectaris/weapondata.map", 140
Font6::
    INCBIN "gfx/nectaris/weapondata.2bpp"
