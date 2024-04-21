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
    db $65

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
    INCBIN "gfx/sezaki.icon.hz"

End:
