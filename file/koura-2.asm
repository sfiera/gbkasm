; Disassembly of "gbkiss.gb"

INCLUDE "charmap.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db kFileMarkerTriangle + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db Points - @ - 1          ; length of variable parts of header
    db $64                     ; owner code

Title::
    db "KOURA2"
Points::
    dw 100
Author::
    db "NONCHAN   ", 2
History::
    ds 11, $00
    ds 11, $00
    ds 11, $00

Body::
    INCBIN "gfx/koura-2.2bpp.hz"

End:
