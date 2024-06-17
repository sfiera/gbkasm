; Disassembly of "delete-all.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db kFileMarkerCircle
    db CartridgeCodeUniversal  ; where file can run
    db Main - @ - 1            ; length of variable parts of header
    db $43                     ; owner code

Title::
    dk "DEL_ALL"

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
    trap ExitToMenu

End:
