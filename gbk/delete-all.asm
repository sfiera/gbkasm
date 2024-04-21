INCLUDE "charmap.inc"
INCLUDE "macro.inc"
INCLUDE "gbk/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    ; Length of entirety of file
    dw End
    ; Flags for display in menu
    db kFileMarkerCircle
    ; Must be $00 for normal files (other than Kiss Mail)
    db $00
    ; Length of variable parts of header
    db Main - @ - 1
    ; File owner code
    db $43

Title::
    db "DEL_ALL"

Main::
    ld hl, $c500
    xor a
    ld [hli], a
    ld [hld], a

jr1:
    push hl
    trap $e8
    jr c, jr2

    trap $ef
    pop hl
    jr jr1

jr2:
    trap $01

End:
