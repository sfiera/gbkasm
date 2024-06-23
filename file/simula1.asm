; Disassembly of "simula1.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db kFileHasIcon2bpp + kFileMarkerTriangle + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db Points - @ - 1          ; length of variable parts of header
    db $83                     ; owner code

Title::
    dk "SIMULA1"
Icon::
    INCBIN "gfx/icon/simula1.2bpp"

Points::
    dw 250
Author::
    dp "          ", 0
History::
    ds 11
    ds 11
    ds 11

End::
