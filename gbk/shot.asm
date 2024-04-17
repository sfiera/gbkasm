INCLUDE "charmap.inc"
INCLUDE "macro.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db $1d
    db $00
    db $c0 | (.end - (@ + 1))
    db $68
    db "SHOT"
.end

Icon::
    INCBIN "gfx/shot-icon.2bpp"

History::
    db $01, $00
    db "TOBI      ", $02, $00
    ds 16, $00
    ds 16, $00

Main::
    xor a
    vcall $b3
    vcall $b5
    ld hl, $1200
    vcall $b6
    ld a, $01
    vcall $b4

jr_0106:
    rpush code_010d
    rpush code_019d
    ret


code_010d:
    ld a, $0a
    ld [$cc95], a
    xor a
    ld hl, $cc96
    ld [hli], a
    ld [hl], a
    vcall $db
    rpush code_0121
    rpush code_0167
    ret


code_0121:
    rpush code_0128
    rpush code_0192
    ret


code_0128:
    vcall $da
    bit 2, l
    jr nz, jr_0159

    ld a, l
    and $03
    jr z, code_0128

    xor a
    ldh [$83], a

jr_0136:
    rpush code_013d
    rpush code_0183
    ret


code_013d:
    rpush code_0144
    rpush code_015b
    ret


code_0144:
    jr nz, jr_0136
    rpush code_014d
    rpush code_019d
    ret


code_014d:
    vcall $db

jr_014f:
    vcall $da
    bit 3, l
    jr nz, jr_0106

    bit 2, l
    jr z, jr_014f

jr_0159:
    vcall $01

code_015b:
    ldh a, [$83]
    sub $3c
    jr c, code_0167

    ldh [$83], a
    ld hl, $cc95
    dec [hl]

code_0167:
    ld hl, $0b06
    ld a, [$cc95]
    ld e, a
    ld d, $00

jr_0170:
    push de

    vcall $b8
    pop de
    ld hl, $cc40
    vcall $a3
    ld hl, $cc43
    vcall $69
    ld a, [$cc95]
    or a

jr_0182:
    ret


code_0183:
    vcall $da
    ld a, l
    and $03
    jr z, jr_0182

    ld hl, $cc96
    inc [hl]
    jr nz, code_0192
    inc hl
    inc [hl]

code_0192:
    ld hl, $cc96
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0b08
    jr jr_0170

code_019d:
    rpush gfx
    pop hl
    vcall $5c
    ld hl, $cc96
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $cc98
    ld a, e
    sub [hl]
    inc hl
    ld a, d
    sbc [hl]
    dec hl
    jr c, jr_01b7

    ld [hl], e
    inc hl
    ld [hl], d

jr_01b7:
    ld hl, $cc98
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0b0e
    jr jr_0170

gfx:
    db $03, $01, "SHOOTING MASTER\n"
    db $06, $06, "TIME:\n"
    db $06, $08, "SHOT:\n"
    db $05, $0c, "»HIGH SCORE\n"
    db $06, $0e, "SHOT:\n"
    db $ff

End:
