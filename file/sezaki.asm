; Disassembly of "sezaki.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db kFileMarkerTriangle + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db Points - @ - 1          ; length of variable parts of header
    db $65                     ; owner code

Title::
    dk "SEZAKI"
Points::
    dw 0
Author::
    dp "SEZAKI    ", 2
History::
    ds 11
    ds 11
    ds 11

Body::
    INCBIN "gfx/mogura/sezaki.2bpp.hz"

End:
