; N5UNLOCK -- unlocks Quick Play mode in Nectaris GB

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

DEF SetROMBank           EQU $05bf
DEF PlayMusic            EQU $0cbf
DEF PlaySound            EQU $0d07
DEF IsQuickStartEnabled  EQU $11a2

SECTION "GBKiss File", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC
    db CART_NECTARIS  ; where file can run
    db .end - @ - 1   ; length of variable parts of header
    db $00            ; owner code
.title
    dk "N5UNLOCK"
.icon
.end

Main::
    ldx de, Compressed
    ld bc, $c400
    trap ExtractInit
    ld de, $c600
    ld bc, $400
    trap ExtractData
    jp $c600


Compressed:
    INCBIN "../out/src/n5unlock/code.hz"


SECTION "Variables", WRAM0[$cc00]

VarCode:
    ds 2
