; Disassembly of "Nectaris GB (Japan) (SGB Enhanced).gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "src/common.inc"
INCLUDE "src/hardware.inc"

SECTION "nectaris/tiles: Tiles 1", ROMX

MapTiles::
    INCBIN "out/src/nectaris/gfx/maptiles.2bpp"

Font1::
    INCBIN "out/src/nectaris/gfx/font1.2bpp"
Font2::
    INCBIN "out/src/nectaris/gfx/font2.2bpp"
Font3::
    INCBIN "out/src/nectaris/gfx/font3.2bpp"
Font4::
    INCBIN "out/src/nectaris/gfx/font4.2bpp"

    INCBIN "out/src/nectaris/gfx/unused.2bpp"

UnitNameTiles::
    INCBIN "out/src/nectaris/gfx/unitnames.2bpp"

    ds 160, $00
    ds 16, $ff

SECTION "nectaris/tiles: Tiles 2", ROMX

UnitsGuicy::
    INCBIN "out/src/nectaris/gfx/units-guicy.2bpp"
UnitsUnion::
    INCBIN "out/src/nectaris/gfx/units-union.2bpp"

BattleTileMap1::
    INCBIN "out/src/nectaris/gfx/ui/battle.tilemap", 40, 100
BattleTileMap2::
    INCBIN "out/src/nectaris/gfx/ui/battle.tilemap", 140, 10
BattleTileMap3::
    INCBIN "out/src/nectaris/gfx/ui/battle.tilemap", 150, 10
BattleTileMap4::
    INCBIN "out/src/nectaris/gfx/ui/battle.tilemap", 160, 160
BattleTileMap5::
    INCBIN "out/src/nectaris/gfx/ui/battle.tilemap", 320, 160
BattleTileMap6::
    INCBIN "out/src/nectaris/gfx/ui/battle.tilemap", 480, 160
BattleTileMap7::
    INCBIN "out/src/nectaris/gfx/ui/battle.tilemap", 640, 160
BattleTileMap8::
    INCBIN "out/src/nectaris/gfx/ui/battle.tilemap", 800
BattleTileData::
    INCBIN "out/src/nectaris/gfx/ui/battle.2bpp", 0, 304
    ds 32, $ff  ; tiles $94 and $95 must be blanked out
    INCBIN "out/src/nectaris/gfx/ui/battle.2bpp", 336, 2304
    ds 16, $ff  ; tile $25 must be blanked out
    INCBIN "out/src/nectaris/gfx/ui/battle.2bpp", 2656, 96

MessageTurn::
    INCBIN "out/src/nectaris/gfx/message/turn.2bpp"
MessageChange::
    INCBIN "out/src/nectaris/gfx/message/change.2bpp"
MessagePlayer1::
    INCBIN "out/src/nectaris/gfx/message/player1.2bpp"
MessagePlayer2::
    INCBIN "out/src/nectaris/gfx/message/player2.2bpp"
MessageComputer::
    INCBIN "out/src/nectaris/gfx/message/computer.2bpp"

SECTION "nectaris/tiles: Tiles 3", ROMX

TileMapWeaponDataUnused::
    ; This part of the source image ensures that all ASCII is in the tileset.
    ; It is never itself displayed within the game.
    INCBIN "out/src/nectaris/gfx/ui/weapondata.tilemap", 20, 120
TileMapWeaponData::
    INCBIN "out/src/nectaris/gfx/ui/weapondata.tilemap", 140
WeaponDataTiles::
    INCBIN "out/src/nectaris/gfx/ui/weapondata.2bpp"

SECTION "nectaris/tiles: Tiles 4", ROMX

FactoryTileMap1::
    INCBIN "out/src/nectaris/gfx/ui/factory.tilemap", 40, 80
FactoryTileMap2::
    INCBIN "out/src/nectaris/gfx/ui/factory.tilemap", 120, 20
FactoryTileMap3::
    INCBIN "out/src/nectaris/gfx/ui/factory.tilemap", 140, 480
FactoryTileMap4::
    INCBIN "out/src/nectaris/gfx/ui/factory.tilemap", 620, 220
FactoryTileData::
    INCBIN "out/src/nectaris/gfx/ui/factory.2bpp"

Font7::
    INCBIN "out/src/nectaris/gfx/font7.2bpp"

SECTION "nectaris/tiles: Tiles 5", ROMX

Font8::
    INCBIN "out/src/nectaris/gfx/font8.2bpp"
