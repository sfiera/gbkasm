; Disassembly of "koura-3.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db kFileMarkerTriangle | kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db .end - @ - 1            ; length of variable parts of header
    db $64                     ; owner code
.title
    dk "KOURA3"
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
    INCBIN "gfx/puzzle/koura-3.2bpp.hz"
