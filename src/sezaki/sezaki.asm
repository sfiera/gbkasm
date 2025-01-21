; Disassembly of "sezaki.gbf"

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
    db $65           ; owner code
.title
    dk "SEZAKI"
.icon
.end

History:
.points
    dw 0
.author
    dp "SEZAKI    ", 2
.history
    ds 11
    ds 11
    ds 11
.end

Body::
    INCBIN "sezaki/data.hz"
