; Disassembly of "gbkiss.gb"

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
    db $00

Title::
    db "ICON-SEND"

Main::
    rpush strings
    pop hl
    push hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    add hl, de
    ld e, l
    ld d, h
    ld b, $c6
    trap $62
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
    trap $01

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
    trap $6b
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
    trap $63
    ld hl, $c500
    ld de, $0000
    ld bc, $1900
    trap $e9
    pop hl
    jr nc, jr0

    trap $01

strings:
    dw content - @
    db "SIMULA1\n"
    db "JYANKEN0\n"
    db "IE2\n"
    db "BOAD0\n"
    db "HATA\n"
    db "GOLF\n"
    db "HIKOU0\n"
    db "ACTION1\n"
    db "SIMULA0\n"
    db "MAP\n"
    db "CARD0\n"
    db "CAT\n"
    db "GUN\n"
    db "ACTION0\n"
    db "PUZZLE0\n"
    db "KEN0\n"
    db "DOG\n"
    db "TUKI\n"
    db "TAIYO\n"
    db "ADDRESS\n"
    db "MAIL\n"
    db "LETTER2\n"
    db "DENTAKU\n"
    db "LETTER1\n"
    db "KING\n"
    db "TOKEI\n"
    db "IE\n"
    db "LETTER\n"
    db "KAERU\n"
    db "FUNE\n"
    db "ICON\n"
    db "SAKANA\n"
    db "YAKYU\n"
    db "BATTLE0\n"
    db "JISYAKU\n"
    db "OYAJI\n"
    db "HIKOU\n"
    db "KAERU2\n"
    db "HEART\n"
    db "MEMO\n"
    db "PUZZLE1\n"
    db "CURSORS\n"
    db $00

content:
    INCBIN "gfx/icons.2bpp.hz"

End::
