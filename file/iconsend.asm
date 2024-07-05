; Disassembly of "icon-send.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

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
    ldx hl, strings
    push hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    add hl, de
    ld e, l
    ld d, h
    ld b, $c6
    trap ExtractInit
    pop hl
    inc hl
    inc hl

jr0:
    ld de, $cae4
    ld a, $83
    ld [de], a
    inc de
    ld a, [hl]
    or a
    jr nz, jr1
    trap ExitToMenu

jr1:
    ld a, [hli]
    ld [de], a
    inc de
    or a
    jr nz, jr1
    push hl

jr2:
    ld de, $cae4
    ld hl, $c500
    ld c, $00
    trap FileSearch
    jr c, jr3
    trap $ef
    jr jr2

jr3:
    ld hl, $c50a
    ld [hl], $00
    inc hl
    ld a, [hl]
    ld c, a
    ld b, $00
    add $c0
    ld [hli], a
    add hl, bc
    ld e, l
    ld d, h
    ld bc, $00c0
    trap ExtractData
    ld hl, $c500
    ld de, $0000
    ld bc, $1900
    trap FileWrite
    pop hl
    jr nc, jr0

    trap ExitToMenu

strings:
    dw content - @
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
    dk $00

content:
    INCBIN "gfx/iconsend/icons.2bpp.hz"

End::
