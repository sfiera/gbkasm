SECTION "ROM Bank $000", ROM0[$0]
LOAD "CRAM Code", WRAMX[$dc40]

call_dc40:
    di
    ldh a, [$ff81]
    push af
    ld hl, $c000
    ld bc, $1c00

jr_dc4a:
    xor a
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_dc4a

    ld a, $03
    ld [$cfb9], a
    call $1ca6
    di
    rst $28
    ld d, [hl]
    rlca
    nop
    rst $28
    or $35
    nop
    call $06ac
    ei
    rst $28
    inc c
    ld e, b
    rlca
    call $1ca6
    call $2575
    call $0f5a
    call $0f39
    call $0f48
    call $1580
    call $0efa
    rst $28
    dec c
    ld e, l
    dec b
    rst $20
    nop
    ld b, b
    nop
    adc b
    inc d
    rst $20
    adc $79
    nop

jr_dc8d:
    sbc b
    inc c
    call call_dda3
    call $0ed3
    ld hl, data_dcdd
    call call_dd1d
    ld b, $cb
    ld h, $da
    ld de, $dd12
    ld c, $23
    call $27e3
    ld de, $2086
    rst $28
    ld l, [hl]
    ld a, [hl]
    inc b
    ld l, $02
    ld [hl], $05
    ld b, $40

jr_dcb4:
    call call_dd03
    dec b
    jr nz, jr_dcb4

    call call_dd6b
    call $2944
    ld hl, $dcee
    call call_dd1d
    ld b, $40

jr_dcc8:
    call call_dd03
    dec b
    jr nz, jr_dcc8

    call $1013
    pop af
    call $1ca8
    pop hl
    jp hl


data_dcd7:
    db $80, $09, $ba, $9a, $25, $5f

data_dcdd:
    db $02, $52, $64, $09, $03, $7c, $64, $09, $05, $68, $88, $00, $04, $80, $88, $00
    db $ff, $00, $20, $70, $00, $01, $38, $70, $00, $0c, $10, $90, $00, $09, $30, $90
    db $00, $08, $50, $88, $00, $ff


call_dd03:
    push bc
    call $252d
    call $26a8
    call $27a6
    call $10ab
    pop bc
    ret


data_dd12:
    db $2e, $2a, $36, $01, $ff, $2e, $04, $36, $00, $18, $f9


call_dd1d:
    ld c, $00

jr_dd1f:
    ld a, [hl+]
    cp $ff
    ret z

    push bc
    push de
    ld de, $c13f
    rst $28
    jp $047c


call_dd2c:
    ld b, a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    inc b
    jr z, jr_dd66

    dec b
    push hl
    push af
    push bc
    push de
    ld a, c
    add $cd
    ld h, a
    ld de, data_dd12
    ld c, $23
    call $27e3
    pop de
    rst $28
    ld l, [hl]
    ld a, [hl]
    inc b
    pop bc
    pop af
    ld l, $02
    ld [hl], a
    ld de, data_dcd7
    ld l, $00
    ld b, $06

jr_dd57:
    ld a, [de]
    cp [hl]
    jr z, jr_dd61

    inc de
    dec b
    jr nz, jr_dd57

    jr jr_dd65

jr_dd61:
    ld l, $02
    ld [hl], $00

jr_dd65:
    pop hl

jr_dd66:
    pop de
    pop bc
    inc c
    jr jr_dd1f


call_dd6b:
    call $0efa
    ld hl, $8000
    ld bc, $c900
    ld a, $28

jr_dd76:
    push af
    push bc
    push de
    ld a, [bc]
    and a
    jr z, jr_dd95

    sub $10
    ld d, a
    inc bc
    ld a, [bc]
    sub $08
    ld e, a
    inc bc
    ld a, [bc]
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld a, h
    add $80
    ld h, a
    call call_ddda

jr_dd95:
    pop de
    pop bc
    ld a, c
    add $04
    ld c, a
    pop af
    dec a
    jr nz, jr_dd76

    call $0ed3
    ret


call_dda3:
    ld a, $c0
    ld [$d4eb], a
    ld hl, $bf00
    xor a

jr_ddac:
    ld [hl+], a
    dec b
    jr nz, jr_ddac

    ld h, $bf
    ld de, $9800
    ld c, $20

jr_ddb7:
    ld b, $20

jr_ddb9:
    ld a, [de]
    ld l, a
    ld a, [hl]
    add $01
    sbc $00
    ld [hl], a
    inc de
    dec b
    jr nz, jr_ddb9

    dec c
    jr nz, jr_ddb7

    ld hl, $bf00
    ld b, $00

jr_ddcd:
    ld a, [hl]
    ld [hl], $00
    cp $01
    jr nz, jr_ddd5

    ld [hl], b

jr_ddd5:
    inc hl
    inc b
    jr nz, jr_ddcd

    ret


call_ddda:
    push bc
    push de
    ld c, $10

jr_ddde:
    ld b, $08
    push de

jr_dde1:
    push bc
    push de
    ld c, $00
    ld a, [hl]
    rlca
    ld [hl+], a
    ld a, c
    adc a
    ld c, a
    ld a, [hl]
    rlca
    ld [hl-], a
    ld a, c
    adc a
    ld c, a
    call nz, call_de04
    pop de
    pop bc
    inc e
    dec b
    jr nz, jr_dde1

    pop de
    inc hl
    inc hl
    inc d
    dec c
    jr nz, jr_ddde

    pop de
    pop bc
    ret


call_de04:
    push bc
    push de
    push hl
    push af
    call call_deac
    call call_de51
    xor $80
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld bc, $8800
    add hl, bc
    ld a, d
    and $07
    add a
    add l
    ld l, a
    ld a, e
    and $07
    ld bc, data_de49
    add c
    ld c, a
    ld a, b
    adc $00
    ld b, a
    ld a, [bc]
    ld c, a
    cpl
    ld b, a
    pop af
    ld d, a
    rrca
    sbc a
    and b
    ld e, a
    ld a, d
    rrca
    rrca
    sbc a
    and b
    ld d, a
    ld a, c
    and [hl]
    or d
    ld [hl+], a
    ld a, c
    and [hl]
    or e
    ld [hl], a
    pop hl
    pop de
    pop bc
    ret


data_de49:
    db %01111111
    db %10111111
    db %11011111
    db %11101111
    db %11110111
    db %11111011
    db %11111101
    db %11111110


call_de51:
    ld c, [hl]
    ld b, $bf
    ld a, [bc]
    and a
    ld a, c
    ret nz

    push bc
    push de
    push hl
    ld a, [$d4eb]
    xor $80
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld de, $8800
    add hl, de
    ld e, l
    ld d, h
    ld a, c
    xor $80
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld bc, $8800
    add hl, bc
    ld bc, $0010
    call $0eb2
    pop hl
    pop de
    pop bc
    ld a, [$d4eb]
    ld [hl], a
    ld c, a
    ld [bc], a
    inc a
    ld [$d4eb], a
    ld a, c
    ret


call_de90:
    ld a, [hl]
    ld a, [$d4eb]
    ld [hl], a
    inc a
    ld [$d4eb], a
    dec a
    ret


call_de9b:
    ld c, [hl]
    ld b, $bf
    ld a, [bc]
    and a
    ret nz

    ld a, [$d4eb]
    ld [bc], a
    inc a
    ld [$d4eb], a
    ld [hl], c
    dec a
    ret


call_deac:
    push bc
    ld a, d
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    ld a, e
    srl a
    srl a
    srl a
    ld c, a
    ld b, $00
    add hl, bc
    ld bc, $9800
    add hl, bc
    pop bc
    ret

ENDL
