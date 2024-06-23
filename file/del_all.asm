; Disassembly of "delete-all.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db kFileMarkerCircle
    db CartridgeCodeUniversal  ; where file can run
    db .end - @ - 1            ; length of variable parts of header
    db $43                     ; owner code
.title
    dk "DEL_ALL"
.icon
.end

History:
.end

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
