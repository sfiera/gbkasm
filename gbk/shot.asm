INCLUDE "charmap.asm"

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
    rst $08
    db $b3

    rst $08
    db $b5

    ld hl, $1200
    rst $08
    db $b6

    ld a, $01
    rst $08
    db $b4

jr4:
    rst $10
    dw $0006
    rst $10
    dw $0093
    ret


    ld a, $0a
    ld [$cc95], a
    xor a
    ld hl, $cc96
    ld [hli], a
    ld [hl], a
    rst $08
    db $db

    rst $10
    dw $0006
    rst $10
    dw $0049
    ret


    rst $10
    dw $0006
    rst $10
    dw $006d
    ret


jr2:
    rst $08
    db $da

    bit 2, l
    jr nz, jr1

    ld a, l
    and $03
    jr z, jr2

    xor a
    ldh [$83], a

jr3:
    rst $10
    dw $0006
    rst $10
    dw $0049
    ret


    rst $10
    dw $0006
    rst $10
    dw $001a
    ret

    jr nz, jr3

    rst $10
    dw $0006
    rst $10
    dw $0053
    ret


    rst $08
    db $db

jr5:
    rst $08
    db $da

    bit 3, l
    jr nz, jr4

    bit 2, l
    jr z, jr5

jr1:
    rst $08
    db $01

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

    rst $08
    db $b8

    pop de
    ld hl, $cc40
    rst $08
    db $a3

    ld hl, $cc43
    rst $08
    db $69

    ld a, [$cc95]
    or a
jr7:
    ret

code2:
    rst $08
    db $da

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
    dw $0024

    pop hl
    rst $08
    db $5c

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

    db $03, $01
    db "SHOOTING MASTER\n"
    db $06, $06
    db "TIME:\n"
    db $06, $08
    db "SHOT:\n"
    db $05, $0c
    db "»HIGH SCORE\n"
    db $06, $0e
    db "SHOT:\n"
    db $ff

End:
