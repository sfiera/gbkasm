; Disassembly of "magnets-data.gbf"

INCLUDE "src/charmap.inc"
INCLUDE "src/common.inc"
INCLUDE "src/hardware.inc"
INCLUDE "src/macro.inc"
INCLUDE "src/trap.inc"

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
    INCBIN "out/src/mag_data/symbols.2bpp"
    ds 16

Compressed:
    INCBIN "out/src/mag_data/bin1.hz"

Compressed2:
    INCBIN "out/src/mag_data/bin2.hz"

Compressed3:
    INCBIN "out/src/mag_data/bin3.hz"
