; Disassembly of "num0-data.gbf"

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_DATA
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $6a           ; owner code
.title
    dk "NUM0_DATA"
.icon
.end

History:
.end

Body::
Tilemap0:
    db $89, $89, $89
    db $80, $81, $82
    db $8c, $8d, $8e
    db $8f, $89, $92
    db $8f, $89, $92
    db $a2, $a3, $a4
    db $aa, $ab, $ac

Tilemap1:
    db $89, $89, $89
    db $83, $84, $85
    db $89, $8f, $85
    db $89, $8f, $85
    db $89, $8f, $85
    db $89, $8f, $85
    db $89, $ad, $ae

Tilemap2:
    db $89, $89, $89
    db $86, $87, $88
    db $90, $91, $92
    db $89, $95, $96
    db $9c, $9d, $9e
    db $a5, $a6, $a7
    db $af, $b0, $b1

Tilemap3:
    db $89, $89, $89
    db $86, $87, $88
    db $90, $91, $92
    db $97, $98, $99
    db $9f, $a0, $a1
    db $a8, $a9, $92
    db $b2, $b3, $b4

Tilemap4:
    db $89, $89, $89
    db $89, $8a, $8b
    db $93, $94, $8b
    db $9a, $9b, $8b
    db $84, $94, $92
    db $89, $83, $8b
    db $89, $b5, $b6

Tilemap5:
    db $89, $89, $89
    db $84, $b7, $92
    db $84, $a7, $89
    db $af, $c3, $c4
    db $89, $cd, $92
    db $a8, $a9, $92
    db $b2, $b3, $b4

Tilemap6:
    db $89, $89, $89
    db $b8, $b9, $ba
    db $84, $bd, $be
    db $84, $c5, $c6
    db $84, $ce, $a1
    db $84, $d5, $a4
    db $d9, $da, $db

Tilemap7:
    db $89, $89, $89
    db $bb, $b7, $92
    db $89, $bf, $c0
    db $89, $c7, $c8
    db $89, $cf, $d0
    db $89, $d6, $d7
    db $89, $dc, $dd

Tilemap8:
    db $89, $89, $89
    db $bc, $b7, $88
    db $8f, $c1, $92
    db $c9, $ca, $99
    db $d1, $d2, $a1
    db $8f, $d8, $92
    db $de, $b0, $b4

Tilemap9:
    db $89, $89, $89
    db $86, $87, $88
    db $c2, $91, $92
    db $cb, $cc, $92
    db $d3, $d4, $92
    db $a8, $a9, $92
    db $b2, $b3, $b4

TilemapColon:
    db $89
    db $89
    db $e0
    db $df
    db $e0
    db $df
    db $89

Tileset:
    INCBIN "frag/sw_timer/digits.hz"
