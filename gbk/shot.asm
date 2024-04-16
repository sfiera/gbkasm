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

Body::
    xor a
    vcall $b3
    vcall $b5
    ld hl, $1200
    vcall $b6
    ld a, $01
    vcall $b4

jr4:
    rst $10
    dw code5 - @

    rst $10
    dw code4 - @

    ret


code5:
    ld a, $0a
    ld [$cc95], a
    xor a
    ld hl, $cc96
    ld [hli], a
    ld [hl], a
    vcall $db
    rst $10
    dw code6 - @

    rst $10
    dw jr6 - @

    ret


code6:
    rst $10
    dw jr2 - @

    rst $10
    dw jr8 - @

    ret


jr2:
    vcall $da
    bit 2, l
    jr nz, jr1

    ld a, l
    and $03
    jr z, jr2

    xor a
    ldh [$83], a

jr3:
    rst $10
    dw code7 - @

    rst $10
    dw code2 - @

    ret


code7:
    rst $10
    dw code8 - @

    rst $10
    dw code1 - @

    ret

code8:
    jr nz, jr3
    rst $10
    dw code9 - @

    rst $10
    dw code4 - @

    ret


code9:
    vcall $db

jr5:
    vcall $da
    bit 3, l
    jr nz, jr4

    bit 2, l
    jr z, jr5

jr1:
    vcall $01

code1:
    ldh a, [$83]
    sub $3c
    jr c, jr6

    ldh [$83], a
    ld hl, $cc95
    dec [hl]

jr6:
    ld hl, $0b06
    ld a, [$cc95]
    ld e, a
    ld d, $00

jr9:
    push de

    vcall $b8
    pop de
    ld hl, $cc40
    vcall $a3
    ld hl, $cc43
    vcall $69
    ld a, [$cc95]
    or a
jr7:
    ret

code2:
    vcall $da
    ld a, l
    and $03
    jr z, jr7

code3:
    ld hl, $cc96
    inc [hl]
    jr nz, jr8
    inc hl
    inc [hl]

jr8:
    ld hl, $cc96
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0b08
    jr jr9

code4:
    rst $10
    dw data1 - @

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
    jr c, jr10

    ld [hl], e
    inc hl
    ld [hl], d

jr10:
    ld hl, $cc98
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0b0e
    jr jr9

data1:
    db $03, $01, "SHOOTING MASTER\n"
    db $06, $06, "TIME:\n"
    db $06, $08, "SHOT:\n"
    db $05, $0c, "»HIGH SCORE\n"
    db $06, $0e, "SHOT:\n"
    db $ff

End:
