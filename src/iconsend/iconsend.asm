; Disassembly of "icon-send.gbf"

INCLUDE "src/charmap.inc"
INCLUDE "src/common.inc"
INCLUDE "src/hardware.inc"
INCLUDE "src/macro.inc"
INCLUDE "src/trap.inc"

DEF OWNER_CODE_ICON  EQU $83
DEF ICON_SIZE        EQU $c0

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $00           ; owner code
.title
    dk "ICON-SEND"
.icon
.end

History:
.end

Main::
    ldx hl, IconData
    push hl

    ; load offset from string list to compressed data
    ; and prepare to decompress it
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    add hl, de
    ld e, l
    ld d, h
    ld b, $c6
    trap ExtractInit

    ; advance hl to start of string list
    pop hl
    inc hl
    inc hl

.nextIcon
    ld de, $cae4
    ld a, OWNER_CODE_ICON
    ld [de], a
    inc de

    ; empty string terminates list of file names
    ; so if string is empty, extraction is complete
    ld a, [hl]
    or a
    jr nz, .copyTitle

    trap ExitToMenu

.copyTitle
    ld a, [hl+]
    ld [de], a
    inc de
    or a
    jr nz, .copyTitle

    push hl

.searchFile
    ld de, $cae4
    ld hl, $c500
    ld c, $00
    trap FileSearch
    jr c, .readyToWrite

    trap FileDelete
    jr .searchFile

.readyToWrite
    ld hl, $c50a
    ld [hl], 0
    inc hl
    ld a, [hl]
    ld c, a
    ld b, $00
    add ICON_SIZE
    ld [hl+], a

    add hl, bc
    ld e, l
    ld d, h
    ld bc, ICON_SIZE
    trap ExtractData

    ld hl, $c500
    ld de, $0000  ; icon body is empty
    ld bc, (FILE_ICON | FILE_2BPP | FILE_HIST) << 8
    trap FileWrite

    pop hl
    jr nc, .nextIcon

    trap ExitToMenu


IconData:
    dw IconGfx - @

    dk "SIMULA1\0"
    dk "JYANKEN0\0"
    dk "IE2\0"
    dk "BOAD0\0"
    dk "HATA\0"
    dk "GOLF\0"
    dk "HIKOU0\0"
    dk "ACTION1\0"
    dk "SIMULA0\0"
    dk "MAP\0"
    dk "CARD0\0"
    dk "CAT\0"
    dk "GUN\0"
    dk "ACTION0\0"
    dk "PUZZLE0\0"
    dk "KEN0\0"
    dk "DOG\0"
    dk "TUKI\0"
    dk "TAIYO\0"
    dk "ADDRESS\0"
    dk "MAIL\0"
    dk "LETTER2\0"
    dk "DENTAKU\0"
    dk "LETTER1\0"
    dk "KING\0"
    dk "TOKEI\0"
    dk "IE\0"
    dk "LETTER\0"
    dk "KAERU\0"
    dk "FUNE\0"
    dk "ICON\0"
    dk "SAKANA\0"
    dk "YAKYU\0"
    dk "BATTLE0\0"
    dk "JISYAKU\0"
    dk "OYAJI\0"
    dk "HIKOU\0"
    dk "KAERU2\0"
    dk "HEART\0"
    dk "MEMO\0"
    dk "PUZZLE1\0"
    dk "CURSORS\0"
    db 0

IconGfx:
    INCBIN "out/src/iconsend/icons.hz"
