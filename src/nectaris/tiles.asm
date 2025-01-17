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

SECTION "Tiles 1", ROMX

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

    INCBIN "gfx/nectaris/unused.2bpp"

UnitNameTiles::
    INCBIN "gfx/nectaris/unitnames.2bpp"

    ds 160, $00
    ds 16, $ff

SECTION "Tiles 2", ROMX

UnitsGuicy::
    INCBIN "gfx/nectaris/units-guicy.2bpp"
UnitsUnion::
    INCBIN "gfx/nectaris/units-union.2bpp"

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

MessageTurn::
    INCBIN "gfx/nectaris/message-turn.2bpp"
MessageChange::
    INCBIN "gfx/nectaris/message-change.2bpp"
MessagePlayer1::
    INCBIN "gfx/nectaris/message-player1.2bpp"
MessagePlayer2::
    INCBIN "gfx/nectaris/message-player2.2bpp"
MessageComputer::
    INCBIN "gfx/nectaris/message-computer.2bpp"

SECTION "Tiles 3", ROMX

TileMapWeaponDataUnused::
    ; This part of the source image ensures that all ASCII is in the tileset.
    ; It is never itself displayed within the game.
    INCBIN "gfx/nectaris/weapondata.map", 20, 120
TileMapWeaponData::
    INCBIN "gfx/nectaris/weapondata.map", 140
WeaponDataTiles::
    INCBIN "gfx/nectaris/weapondata.2bpp"

SECTION "Tiles 4", ROMX

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

SECTION "Tiles 5", ROMX

Font8::
    INCBIN "gfx/nectaris/font8.2bpp"
