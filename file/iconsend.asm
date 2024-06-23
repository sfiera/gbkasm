; Disassembly of "icon-send.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db kFileMarkerCircle
    db CartridgeCodeUniversal  ; where file can run
    db Main - @ - 1            ; length of variable parts of header
    db $00                     ; owner code

Title::
    dk "ICON-SEND"

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
    trap InitDecompress
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
    trap RunDecompress
    ld hl, $c500
    ld de, $0000
    ld bc, $1900
    trap $e9
    pop hl
    jr nc, jr0

    trap ExitToMenu

strings:
    dw content - @
    dk "SIMULA1\n"
    dk "JYANKEN0\n"
    dk "IE2\n"
    dk "BOAD0\n"
    dk "HATA\n"
    dk "GOLF\n"
    dk "HIKOU0\n"
    dk "ACTION1\n"
    dk "SIMULA0\n"
    dk "MAP\n"
    dk "CARD0\n"
    dk "CAT\n"
    dk "GUN\n"
    dk "ACTION0\n"
    dk "PUZZLE0\n"
    dk "KEN0\n"
    dk "DOG\n"
    dk "TUKI\n"
    dk "TAIYO\n"
    dk "ADDRESS\n"
    dk "MAIL\n"
    dk "LETTER2\n"
    dk "DENTAKU\n"
    dk "LETTER1\n"
    dk "KING\n"
    dk "TOKEI\n"
    dk "IE\n"
    dk "LETTER\n"
    dk "KAERU\n"
    dk "FUNE\n"
    dk "ICON\n"
    dk "SAKANA\n"
    dk "YAKYU\n"
    dk "BATTLE0\n"
    dk "JISYAKU\n"
    dk "OYAJI\n"
    dk "HIKOU\n"
    dk "KAERU2\n"
    dk "HEART\n"
    dk "MEMO\n"
    dk "PUZZLE1\n"
    dk "CURSORS\n"
    dk $00

content:
    INCBIN "gfx/iconsend/icons.2bpp.hz"

End::
