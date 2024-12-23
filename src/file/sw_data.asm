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
    INCBIN "gfx/sw_timer/digits.map", 0, 3
    INCBIN "gfx/sw_timer/digits.map", 15, 3
    INCBIN "gfx/sw_timer/digits.map", 30, 3
    INCBIN "gfx/sw_timer/digits.map", 45, 3
    INCBIN "gfx/sw_timer/digits.map", 60, 3
    INCBIN "gfx/sw_timer/digits.map", 75, 3

Tilemap1:
    db $89, $89, $89
    INCBIN "gfx/sw_timer/digits.map", 3, 3
    INCBIN "gfx/sw_timer/digits.map", 18, 3
    INCBIN "gfx/sw_timer/digits.map", 33, 3
    INCBIN "gfx/sw_timer/digits.map", 48, 3
    INCBIN "gfx/sw_timer/digits.map", 63, 3
    INCBIN "gfx/sw_timer/digits.map", 78, 3

Tilemap2:
    db $89, $89, $89
    INCBIN "gfx/sw_timer/digits.map", 6, 3
    INCBIN "gfx/sw_timer/digits.map", 21, 3
    INCBIN "gfx/sw_timer/digits.map", 36, 3
    INCBIN "gfx/sw_timer/digits.map", 51, 3
    INCBIN "gfx/sw_timer/digits.map", 66, 3
    INCBIN "gfx/sw_timer/digits.map", 81, 3

Tilemap3:
    db $89, $89, $89
    INCBIN "gfx/sw_timer/digits.map", 9, 3
    INCBIN "gfx/sw_timer/digits.map", 24, 3
    INCBIN "gfx/sw_timer/digits.map", 39, 3
    INCBIN "gfx/sw_timer/digits.map", 54, 3
    INCBIN "gfx/sw_timer/digits.map", 69, 3
    INCBIN "gfx/sw_timer/digits.map", 84, 3

Tilemap4:
    db $89, $89, $89
    INCBIN "gfx/sw_timer/digits.map", 12, 3
    INCBIN "gfx/sw_timer/digits.map", 27, 3
    INCBIN "gfx/sw_timer/digits.map", 42, 3
    INCBIN "gfx/sw_timer/digits.map", 57, 3
    INCBIN "gfx/sw_timer/digits.map", 72, 3
    INCBIN "gfx/sw_timer/digits.map", 87, 3

Tilemap5:
    db $89, $89, $89
    INCBIN "gfx/sw_timer/digits.map", 90, 3
    INCBIN "gfx/sw_timer/digits.map", 105, 3
    INCBIN "gfx/sw_timer/digits.map", 120, 3
    INCBIN "gfx/sw_timer/digits.map", 135, 3
    INCBIN "gfx/sw_timer/digits.map", 150, 3
    INCBIN "gfx/sw_timer/digits.map", 165, 3

Tilemap6:
    db $89, $89, $89
    INCBIN "gfx/sw_timer/digits.map", 93, 3
    INCBIN "gfx/sw_timer/digits.map", 108, 3
    INCBIN "gfx/sw_timer/digits.map", 123, 3
    INCBIN "gfx/sw_timer/digits.map", 138, 3
    INCBIN "gfx/sw_timer/digits.map", 153, 3
    INCBIN "gfx/sw_timer/digits.map", 168, 3

Tilemap7:
    db $89, $89, $89
    INCBIN "gfx/sw_timer/digits.map", 96, 3
    INCBIN "gfx/sw_timer/digits.map", 111, 3
    INCBIN "gfx/sw_timer/digits.map", 126, 3
    INCBIN "gfx/sw_timer/digits.map", 141, 3
    INCBIN "gfx/sw_timer/digits.map", 156, 3
    INCBIN "gfx/sw_timer/digits.map", 171, 3

Tilemap8:
    db $89, $89, $89
    INCBIN "gfx/sw_timer/digits.map", 99, 3
    INCBIN "gfx/sw_timer/digits.map", 114, 3
    INCBIN "gfx/sw_timer/digits.map", 129, 3
    INCBIN "gfx/sw_timer/digits.map", 144, 3
    INCBIN "gfx/sw_timer/digits.map", 159, 3
    INCBIN "gfx/sw_timer/digits.map", 174, 3

Tilemap9:
    db $89, $89, $89
    INCBIN "gfx/sw_timer/digits.map", 102, 3
    INCBIN "gfx/sw_timer/digits.map", 117, 3
    INCBIN "gfx/sw_timer/digits.map", 132, 3
    INCBIN "gfx/sw_timer/digits.map", 147, 3
    INCBIN "gfx/sw_timer/digits.map", 162, 3
    INCBIN "gfx/sw_timer/digits.map", 177, 3

TilemapColon:
    db $89
    INCBIN "gfx/sw_timer/digits.map", 180, 1
    INCBIN "gfx/sw_timer/digits.map", 195, 1
    INCBIN "gfx/sw_timer/digits.map", 210, 1
    INCBIN "gfx/sw_timer/digits.map", 225, 1
    INCBIN "gfx/sw_timer/digits.map", 240, 1
    INCBIN "gfx/sw_timer/digits.map", 255, 1

Tileset:
    INCBIN "frag/sw_timer/digits.hz"
