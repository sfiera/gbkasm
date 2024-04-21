INCLUDE "charmap.inc"
INCLUDE "macro.inc"
INCLUDE "gbk/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    ; Length of entirety of file
    dw End
    ; Flags for display in menu
    db kFileMarkerTriangle + kFileHasTransfers
    ; Must be $00 for normal files (other than Kiss Mail)
    db $00
    ; Length of variable parts of header
    db Points - @ - 1
    ; File owner code
    db $64

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
