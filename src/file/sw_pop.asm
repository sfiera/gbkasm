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
    dk "NUM0_POP"
.icon
.end

History:
.end

Body::
DEF _OFFSET = 0
FOR _BLOCK, 0, 3

    DEF _BLOCK_OFFSET = _OFFSET + 3*5*7*_BLOCK
    IF _BLOCK == 2
        DEF _DIGITS = 1
        DEF _SIZE = 1
    ELSE
        DEF _DIGITS = 5
        DEF _SIZE = 3
    ENDC

    FOR _DIGIT, 0, _DIGITS
        DEF _DIGIT_OFFSET = _BLOCK_OFFSET + _SIZE*_DIGIT
        FOR _ROW, 0, 7
            DEF _ROW_OFFSET = _DIGIT_OFFSET + 3*5*_ROW
            INCBIN "gfx/sw_timer/pop.map", _ROW_OFFSET % (3*5*7*3), _SIZE
        ENDR
    ENDR
ENDR

Tileset:
    INCBIN "frag/sw_timer/pop.hz"
