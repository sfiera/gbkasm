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

UnknownTileMap2::
    db $81, $82, $83, $84, $85, $86, $87, $88, $89, $8a, $8b, $8c, $8d, $8e, $8f, $90
    db $91, $92, $93, $94, $95, $96, $97, $98, $99, $9a, $9b, $9c, $9d, $9e, $9f, $a0
    db $a1, $a2, $a3, $a4, $a5, $a6, $a7, $a8, $a9, $aa, $ab, $ac, $ad, $ae, $af, $b0
    db $b1, $b2, $b3, $b4, $b5, $b6, $b7, $b8, $b9, $ba, $bb, $bc, $bd, $be, $bf, $c0
    db $c1, $c2, $80, $c3, $c4, $80, $80, $c5, $c6, $80, $c7, $c8, $c9, $ca, $80, $cb
    db $cc, $cd, $ce, $cf, $d0, $d1, $d2, $d3, $d4, $d5, $d6, $d6, $d6, $d6, $d6, $d6
    db $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6
    db $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6

UnknownTileMap9::
    db $d7, $d8, $d8, $d8, $d8, $d8, $d8, $d8
    db $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d9, $d6, $d6, $d6, $d6
    db $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6
    db $da, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80
    db $80, $80, $80, $db, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc
    db $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $da, $80, $80, $80, $80, $80, $80, $80
    db $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $db, $d6, $d6, $d6, $d6
    db $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6
    db $dd, $de, $de, $de, $de, $de, $de, $de, $de, $de, $de, $de, $de, $de, $de, $de
    db $de, $de, $de, $df, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6
    db $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6

UnknownTileMap8::
    db $d7, $d8, $d8, $d8, $d8, $d8, $d8, $d8
    db $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d9, $e0, $e0, $e0, $e0
    db $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0
    db $e1, $e2, $e3, $80, $80, $80, $80, $80, $80, $e4, $e5, $e6, $80, $e7, $e2, $e3
    db $80, $80, $80, $db, $e8, $e9, $e8, $e9, $e8, $e9, $e8, $e9, $ea, $d6, $d6, $eb
    db $e8, $e9, $e8, $e9, $e8, $e9, $e8, $e9, $ec, $ed, $ee, $80, $80, $80, $80, $80
    db $80, $ef, $80, $80, $ef, $f0, $ed, $ee, $80, $80, $80, $db, $f1, $f2, $f1, $f2
    db $f1, $f2, $f1, $f2, $f3, $d6, $d6, $f4, $f1, $f2, $f1, $f2, $f1, $f2, $f1, $f2
    db $f5, $de, $de, $de, $de, $de, $de, $de, $de, $de, $de, $de, $de, $de, $de, $de
    db $de, $de, $de, $f6, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc
    db $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc

UnknownTileMap3::
    db $d7, $d8, $d8, $d8, $d8, $d8, $d8, $d8
    db $d8, $f7, $f8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d8, $d9, $f9, $fa, $d6, $d6
    db $f9, $fa, $d6, $f9, $fa, $d6, $d6, $f9, $fa, $d6, $d6, $f9, $fa, $d6, $f9, $fa
    db $e1, $e2, $e3, $80, $80, $80, $80, $80, $fb, $fc, $fd, $fe, $80, $e7, $e2, $e3
    db $80, $80, $80, $db, $ff, $00, $d6, $d6, $ff, $00, $d6, $ff, $00, $d6, $d6, $ff
    db $00, $d6, $d6, $ff, $00, $d6, $ff, $00, $ec, $ed, $ee, $80, $80, $80, $80, $80
    db $01, $02, $03, $04, $80, $f0, $ed, $ee, $80, $80, $80, $db, $dc, $dc, $dc, $dc
    db $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc
    db $f5, $de, $de, $de, $de, $de, $de, $de, $de, $05, $06, $de, $de, $de, $de, $de
    db $de, $de, $de, $f6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6
    db $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6

UnknownTileMap6::
    db $d7, $d8, $d8, $d8, $d8, $d8, $d8, $f7
    db $f8, $d8, $d8, $f7, $f8, $d8, $d8, $d8, $d8, $d8, $d8, $d9, $d6, $d6, $d6, $d6
    db $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6, $d6
    db $e1, $e2, $e3, $80, $80, $80, $fb, $fc, $fd, $fe, $fb, $fc, $fd, $07, $e2, $e3
    db $80, $80, $80, $db, $08, $09, $08, $09, $08, $09, $08, $08, $09, $08, $09, $08
    db $09, $08, $09, $08, $09, $08, $08, $09, $ec, $ed, $ee, $80, $80, $80, $01, $02
    db $03, $04, $01, $02, $03, $0a, $ed, $ee, $80, $80, $80, $db, $0b, $0c, $0d, $d6
    db $d6, $0b, $0c, $0d, $d6, $d6, $d6, $0b, $0c, $0d, $d6, $d6, $0b, $0c, $0d, $d6
    db $f5, $de, $de, $de, $de, $de, $de, $05, $06, $de, $de, $05, $06, $de, $de, $de
    db $de, $de, $de, $f6, $0e, $0f, $10, $11, $d6, $0e, $0f, $10, $11, $d6, $d6, $0e
    db $0f, $10, $11, $d6, $0e, $0f, $10, $11

UnknownTileMap7::
    db $80, $80, $80, $80, $80, $80, $80, $80
    db $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $dc, $dc, $dc, $dc
    db $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc, $dc
    db $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80
    db $80, $80, $80, $80, $12, $13, $14, $12, $13, $14, $12, $13, $14, $d6, $d6, $12
    db $13, $14, $12, $13, $14, $12, $13, $14, $80, $80, $80, $80, $80, $80, $80, $80
    db $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $15, $16, $17, $15
    db $16, $17, $15, $16, $17, $d6, $d6, $15, $16, $17, $15, $16, $17, $15, $16, $17
    db $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80
    db $80, $80, $80, $80, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0
    db $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $80, $80, $80, $80, $80, $80, $80, $80
    db $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $18, $19, $1a, $18
    db $19, $1a, $18, $19, $1a, $d6, $d6, $1b, $1c, $1d, $1b, $1c, $1d, $1b, $1c, $1d
    db $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80
    db $80, $80, $80, $80, $1e, $1f, $20, $1e, $1f, $20, $1e, $1f, $20, $d6, $d6, $21
    db $22, $23, $21, $22, $23, $21, $22, $23, $24, $24, $24, $24, $24, $24, $24, $24
    db $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $e0, $e0, $e0, $e0
    db $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0
    db $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25
    db $25, $25, $25, $25, $18, $19, $1a, $18, $19, $1a, $18, $19, $1a, $d6, $d6, $1b
    db $1c, $1d, $1b, $1c, $1d, $1b, $1c, $1d, $25, $25, $25, $25, $25, $25, $25, $25
    db $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $26, $27, $28, $26
    db $27, $28, $26, $27, $28, $d6, $d6, $29, $2a, $2b, $29, $2a, $2b, $29, $2a, $2b
    db $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25
    db $25, $25, $25, $25, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0
    db $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0

Black::
    ds 16, $ff

Unknown::
    INCBIN "gfx/nectaris/unknown.2bpp"

Text::
    INCBIN "gfx/nectaris/text.2bpp"

UnitCount::
    INCBIN "gfx/nectaris/unitcount.2bpp"

Explosion::
    INCBIN "gfx/nectaris/explosion.2bpp", 16

Gray::
    ds 16, $ff, $00

Unknown2::
    INCBIN "gfx/nectaris/unknown2.2bpp"

Messages::
    INCBIN "gfx/nectaris/messages.2bpp"

ScreenTitleData:
.map::
    INCBIN "gfx/nectaris/title.map", 20
.tiles::
    INCBIN "gfx/nectaris/title.2bpp"

UnknownTileMap4::
    db $81, $82, $83, $84, $85, $86, $87, $88, $89, $8a, $8b, $8c, $8d, $8e, $80, $8f
    db $90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9a, $9b, $9c, $9d, $9e, $9f
    db $a0, $a1, $a2, $a3, $a4, $a5, $a6, $a7, $a8, $a9, $aa, $ab, $ac, $ad, $ae, $af
    db $b0, $b1, $b2, $b3, $b4, $b5, $b6, $b7, $b8, $b9, $ba, $bb, $80, $bc, $bd, $be
    db $bf, $c0, $c1, $c2, $c3, $c4, $c5, $c6, $c7, $c8, $c9, $ca, $cb, $cc, $cd, $ce
    db $cf, $d0, $d1, $d2, $d3, $d4, $d5, $d6, $d7, $d8, $d9, $da, $db, $dc, $dd, $de
    db $df, $e0, $e1, $e2, $e3, $e4, $e5, $e6, $e7, $e8, $e9, $ea, $eb, $ec, $ed, $ee
    db $ef, $f0, $f1, $f2, $f3, $f4, $f5, $f6

UnknownTileMap5::
    db $8b, $8c, $8c, $8c, $8c, $8c, $8c, $8c
    db $8c, $8c, $8c, $8c, $8c, $8c, $8c, $8c, $8c, $8c, $8c, $8d, $8e, $80, $80, $80
    db $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $8f
    db $8e, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $f6, $80, $80, $80, $80
    db $80, $80, $80, $8f, $90, $91, $91, $91, $91, $91, $91, $91, $91, $91, $91, $91
    db $91, $91, $91, $91, $91, $91, $91, $92, $8b, $8c, $8c, $8c, $8c, $8c, $8c, $8c
    db $8c, $8c, $8c, $8c, $8c, $8c, $8c, $8c, $8c, $8c, $8c, $8d, $8e, $80, $80, $80
    db $b5, $a3, $9f, $ae, $ad, $ac, $80, $a2, $9f, $b2, $9f, $80, $80, $80, $80, $8f
    db $8e, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80
    db $80, $80, $80, $8f, $8e, $80, $80, $80, $80, $f7, $f8, $f9, $fa, $fb, $fc, $80
    db $80, $80, $80, $80, $80, $80, $80, $8f, $8e, $fd, $fe, $ff, $80, $80, $80, $80
    db $80, $80, $80, $00, $01, $02, $80, $80, $80, $80, $80, $8f, $8e, $fd, $fe, $03
    db $80, $80, $80, $80, $80, $80, $80, $04, $05, $06, $80, $80, $80, $80, $80, $8f
    db $90, $91, $91, $91, $91, $91, $91, $91, $91, $91, $91, $91, $91, $91, $91, $91
    db $91, $91, $91, $92, $8b, $8c, $8c, $8c, $8c, $8c, $8c, $8c, $8c, $8c, $8c, $8c
    db $8c, $8c, $8c, $8c, $8c, $8c, $8c, $8d, $8e, $80, $a5, $9f, $ab, $a3, $80, $a7
    db $ac, $a4, $ad, $b0, $ab, $9f, $b2, $a7, $ad, $ac, $80, $8f, $8e, $80, $80, $80
    db $b2, $b3, $b0, $ac, $80, $80, $80, $80, $b9, $80, $80, $80, $80, $80, $80, $8f
    db $8e, $80, $80, $80, $b3, $ac, $a7, $ad, $ac, $80, $80, $80, $80, $80, $80, $80
    db $80, $80, $80, $8f, $8e, $80, $80, $80, $a5, $b3, $a7, $a1, $b7, $80, $80, $80
    db $80, $80, $80, $80, $80, $80, $80, $8f, $8e, $80, $ae, $9f, $b1, $b1, $b5, $ad
    db $b0, $a2, $80, $07, $80, $80, $80, $80, $80, $80, $08, $8f, $90, $91, $91, $91
    db $91, $91, $91, $91, $91, $91, $91, $91, $91, $91, $91, $91, $91, $91, $91, $92

Font6::
    INCBIN "gfx/nectaris/font6.2bpp"
