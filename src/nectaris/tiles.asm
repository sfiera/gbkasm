; Disassembly of "Nectaris GB (Japan) (SGB Enhanced).gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "common.inc"
INCLUDE "hardware.inc"

SECTION "nectaris/tiles: Tiles 1", ROMX

MapTiles::
    INCBIN "nectaris/gfx/maptiles.2bpp"

Font1::
    INCBIN "nectaris/gfx/font1.2bpp"
Font2::
    INCBIN "nectaris/gfx/font2.2bpp"
Font3::
    INCBIN "nectaris/gfx/font3.2bpp"
Font4::
    INCBIN "nectaris/gfx/font4.2bpp"

    INCBIN "nectaris/gfx/unused.2bpp"

UnitNameTiles::
    INCBIN "nectaris/gfx/unitnames.2bpp"

    ds 160, $00
    ds 16, $ff

SECTION "nectaris/tiles: Tiles 2", ROMX

UnitsGuicy::
    INCBIN "nectaris/gfx/units-guicy.2bpp"
UnitsUnion::
    INCBIN "nectaris/gfx/units-union.2bpp"

BattleTileMap1::
    INCBIN "nectaris/gfx/ui/battle.tilemap", 40, 100
BattleTileMap2::
    INCBIN "nectaris/gfx/ui/battle.tilemap", 140, 10
BattleTileMap3::
    INCBIN "nectaris/gfx/ui/battle.tilemap", 150, 10
BattleTileMap4::
    INCBIN "nectaris/gfx/ui/battle.tilemap", 160, 160
BattleTileMap5::
    INCBIN "nectaris/gfx/ui/battle.tilemap", 320, 160
BattleTileMap6::
    INCBIN "nectaris/gfx/ui/battle.tilemap", 480, 160
BattleTileMap7::
    INCBIN "nectaris/gfx/ui/battle.tilemap", 640, 160
BattleTileMap8::
    INCBIN "nectaris/gfx/ui/battle.tilemap", 800
BattleTileData::
    INCBIN "nectaris/gfx/ui/battle.2bpp", 0, 304
    ds 32, $ff  ; tiles $94 and $95 must be blanked out
    INCBIN "nectaris/gfx/ui/battle.2bpp", 336, 2304
    ds 16, $ff  ; tile $25 must be blanked out
    INCBIN "nectaris/gfx/ui/battle.2bpp", 2656, 96

MessageTurn::
    INCBIN "nectaris/gfx/message/turn.2bpp"
MessageChange::
    INCBIN "nectaris/gfx/message/change.2bpp"
MessagePlayer1::
    INCBIN "nectaris/gfx/message/player1.2bpp"
MessagePlayer2::
    INCBIN "nectaris/gfx/message/player2.2bpp"
MessageComputer::
    INCBIN "nectaris/gfx/message/computer.2bpp"

SECTION "nectaris/tiles: Tiles 3", ROMX

TileMapWeaponDataUnused::
    ; This part of the source image ensures that all ASCII is in the tileset.
    ; It is never itself displayed within the game.
    INCBIN "nectaris/gfx/ui/weapondata.tilemap", 20, 120
TileMapWeaponData::
    INCBIN "nectaris/gfx/ui/weapondata.tilemap", 140
WeaponDataTiles::
    INCBIN "nectaris/gfx/ui/weapondata.2bpp"

SECTION "nectaris/tiles: Tiles 4", ROMX

FactoryTileMap1::
    INCBIN "nectaris/gfx/ui/factory.tilemap", 40, 80
FactoryTileMap2::
    INCBIN "nectaris/gfx/ui/factory.tilemap", 120, 20
FactoryTileMap3::
    INCBIN "nectaris/gfx/ui/factory.tilemap", 140, 480
FactoryTileMap4::
    INCBIN "nectaris/gfx/ui/factory.tilemap", 620, 220
FactoryTileData::
    INCBIN "nectaris/gfx/ui/factory.2bpp"

Font7::
    INCBIN "nectaris/gfx/font7.2bpp"

SECTION "nectaris/tiles: Tiles 5", ROMX

Font8::
    INCBIN "nectaris/gfx/font8.2bpp"
