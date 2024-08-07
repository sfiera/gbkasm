; Disassembly of "koura-1.gbf"

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_DATA | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $64           ; owner code
.title
    dk "KOURA1"
.icon
.end

History:
.points
    dw 100
.author
    dp "NONCHAN   ", 2
.history
    ds 11
    ds 11
    ds 11
.end

Body::
    INCBIN "frag/puzzle/koura-1.hz"
