; Disassembly of "Nectaris GB (Japan) (SGB Enhanced).gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "common.inc"
INCLUDE "hardware.inc"

MACRO dbw
    db \1
    dw \2
ENDM

MACRO laddr
    dbw BANK(\1), \1
ENDM

MACRO screen
    laddr \1.map
    laddr \1.tiles
ENDM

SECTION "nectaris/screens: Screens 1", ROMX

ScreenTitle::
    screen ScreenTitleData
ScreenWin::
    screen ScreenWinData

SECTION "nectaris/screens: Screens 2", ROMX

ScreenGameOver::
    screen ScreenGameOverData
ScreenWorldMap::
    screen ScreenWorldMapData
ScreenPrologue1::
    screen ScreenPrologue1Data
ScreenPrologue3::
    screen ScreenPrologue3Data
ScreenPrologue5::
    screen ScreenPrologue5Data
ScreenResults::
    screen ScreenResultsData
ScreenEpilogue1::
    screen ScreenEpilogue1Data
ScreenEpilogue2::
    screen ScreenEpilogue2Data
ScreenEpilogue3::
    screen ScreenEpilogue3Data
ScreenEpilogue4::
    screen ScreenEpilogue4Data
ScreenEpilogue5::
    screen ScreenEpilogue5Data
ScreenPrologue2::
    screen ScreenPrologue2Data
ScreenPrologue4::
    screen ScreenPrologue4Data
ScreenPrologue6::
    screen ScreenPrologue6Data
ScreenPrologue7::
    screen ScreenPrologue7Data
ScreenEpilogue6::
    screen ScreenEpilogue6Data
ScreenFactoryTaken::
    screen ScreenFactoryTakenData

SECTION "nectaris/screens: Screen Data 1", ROMX

ScreenTitleData:
.map
    INCBIN "nectaris/gfx/screens/title.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/title.2bpp"

SECTION "nectaris/screens: Screen Data 2", ROMX

ScreenGameOverData:
.map
    INCBIN "nectaris/gfx/screens/gameover.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/gameover.2bpp"

ScreenWorldMapData:
.map
    INCBIN "nectaris/gfx/screens/worldmap.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/worldmap.2bpp"

SECTION "nectaris/screens: Screen Data 3", ROMX

ScreenWinData:
.map
    INCBIN "nectaris/gfx/screens/win.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/win.2bpp"

SECTION "nectaris/screens: Screen Data 4", ROMX

ScreenFactoryTakenData:
.map
    INCBIN "nectaris/gfx/screens/factorytaken.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/factorytaken.2bpp"

SECTION "nectaris/screens: Screen Data 5", ROMX

ScreenPrologue1Data:
.map
    INCBIN "nectaris/gfx/screens/prologue/prologue1.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/prologue/prologue1.2bpp"

ScreenPrologue3Data:
.map
    INCBIN "nectaris/gfx/screens/prologue/prologue3.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/prologue/prologue3.2bpp"

    db $e0, $ff, $f8, $ff, $fc, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    db $2a, $00, $00, $7f, $00, $bf, $00, $bf, $00, $df, $80, $df, $c0, $ef, $c0, $ef

ScreenPrologue5Data:
.map
    INCBIN "nectaris/gfx/screens/prologue/prologue5.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/prologue/prologue5.2bpp"

ScreenResultsData:
.map
    INCBIN "nectaris/gfx/screens/results.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/results.2bpp"

SECTION "nectaris/screens: Screen Data 6", ROMX

ScreenEpilogue1Data:
.map
    INCBIN "nectaris/gfx/screens/epilogue/epilogue1.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/epilogue/epilogue1.2bpp"

ScreenEpilogue2Data:
.map
    INCBIN "nectaris/gfx/screens/epilogue/epilogue2.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/epilogue/epilogue2.2bpp"

ScreenEpilogue3Data:
.map
    INCBIN "nectaris/gfx/screens/epilogue/epilogue3.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/epilogue/epilogue3.2bpp"

ScreenEpilogue4Data:
.map
    INCBIN "nectaris/gfx/screens/epilogue/epilogue4.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/epilogue/epilogue4.2bpp"

ScreenEpilogue5Data:
.map
    INCBIN "nectaris/gfx/screens/epilogue/epilogue5.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/epilogue/epilogue5.2bpp"

SECTION "nectaris/screens: Screen Data 7", ROMX

ScreenPrologue2Data:
.map
    INCBIN "nectaris/gfx/screens/prologue/prologue2.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/prologue/prologue2.2bpp"

ScreenPrologue4Data:
.map
    INCBIN "nectaris/gfx/screens/prologue/prologue4.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/prologue/prologue4.2bpp"

ScreenPrologue6Data:
.map
    INCBIN "nectaris/gfx/screens/prologue/prologue6.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/prologue/prologue6.2bpp"

ScreenPrologue7Data:
.map
    INCBIN "nectaris/gfx/screens/prologue/prologue7.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/prologue/prologue7.2bpp"

ScreenEpilogue6Data:
.map
    INCBIN "nectaris/gfx/screens/epilogue/epilogue6.tilemap", 20
.tiles
    INCBIN "nectaris/gfx/screens/epilogue/epilogue6.2bpp"
