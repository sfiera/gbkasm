INCLUDE "charmap.inc"
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
    db "SEZAKI"
Points::
    dw 0
Author::
    db "SEZAKI    ", 2
History::
    ds 11, $00
    ds 11, $00
    ds 11, $00

Body::
    INCBIN "gfx/sezaki.2bpp.hz"

End:
