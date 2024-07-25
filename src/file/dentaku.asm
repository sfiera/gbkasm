; Disassembly of "calculator.gbf"

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_ICON | FILE_2BPP | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $04           ; owner code
.title
    dk "DEN TAKU"
.icon
    INCBIN "gfx/iconsend/dentaku.2bpp"
.end

History:
.points
    dw 1980
.author
    dp "Y.MOTOSAKO", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    ldx de, Compressed
    ld bc, $c400
    trap ExtractInit
    ld de, $c800
    ld bc, $1000
    trap ExtractData
    jp $c800

Compressed:
    INCBIN "frag/dentaku/code.hz"
