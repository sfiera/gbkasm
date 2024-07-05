; Disassembly of "simula1.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_DATA | FILE_ICON | FILE_2BPP | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $83           ; owner code
.title
    dk "SIMULA1"
.icon
    INCBIN "gfx/system/simula1.2bpp"
.end

History:
.points
    dw 250
.author
    dp "          ", 0
.history
    ds 11
    ds 11
    ds 11
.end
