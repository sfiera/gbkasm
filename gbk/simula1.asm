; Disassembly of "gbkiss.gb"

INCLUDE "charmap.inc"
INCLUDE "macro.inc"
INCLUDE "gbk/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    ; Length of entirety of file
    dw End
    ; Flags for display in menu
    db kFileHasIcon2bpp + kFileMarkerTriangle + kFileHasTransfers
    ; Must be $00 for normal files (other than Kiss Mail)
    db $00
    ; Length of variable parts of header
    db Points - @ - 1
    ; File owner code
    db $83

Title::
    db "SIMULA1"

Icon::
    INCBIN "gfx/icon/simula1.2bpp"

Points::
    dw 250
Author::
    db "          ", 00
History::
    ds 11, $00
    ds 11, $00
    ds 11, $00

End::
