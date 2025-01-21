; Disassembly of "magnets-data.gbf"

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
    db $66           ; owner code
.title
    dk "MAGNETS DATA"
.icon
.end

History:
.points
    dw 1
.author
    dp "<TEAM MAG>", 2
.history
    ds 11
    ds 11
    ds 11
.end

Body::
    INCBIN "gfx/magnets/symbols.2bpp"
    ds 16

Compressed:
    INCBIN "magnets/bin1.hz"

Compressed2:
    INCBIN "magnets/bin2.hz"

Compressed3:
    INCBIN "magnets/bin3.hz"
