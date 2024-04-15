; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $003", ROMX[$4000], BANK[$3]

    jp Jump_003_4006


    jp Jump_003_4053


Jump_003_4006:
    add a
    ld c, a
    ld b, $00
    ld a, [$c0f4]
    or a
    jr z, jr_003_4013

    call Call_003_421a

jr_003_4013:
    ld a, $01
    ld [$c0f4], a
    ld hl, table_03_4231
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]
    ld [$c02d], a
    ld [$c0f5], a
    ld de, $c0ec
    ld c, $00

jr_003_402b:
    ld a, [$c0f5]
    rrca
    ld [$c0f5], a
    jr nc, jr_003_404a

    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    push hl
    ld hl, $c0d0
    add hl, bc
    ld [hl], $00
    ld hl, $c0d4
    add hl, bc
    ld [hl], $01
    pop hl
    jr jr_003_404c

jr_003_404a:
    inc de
    inc de

jr_003_404c:
    inc c
    ld a, $04
    cp c
    jr nz, jr_003_402b

    ret


Jump_003_4053:
    ld a, [$c02d]
    or a
    jr nz, jr_003_405d

    call Call_003_420d
    ret


jr_003_405d:
    xor a
    ld b, a
    ld c, a
    ld a, [$c02d]
    ld [$c0f5], a

jr_003_4066:
    ld hl, $c0f5
    ld a, [hl]
    rrca
    ld [hl], a
    jr nc, jr_003_4087

    ld hl, $c0d4
    add hl, bc
    ld a, [hl]
    dec a
    jr z, jr_003_407c

    ld [hl], a
    call Call_003_4168
    jr jr_003_4087

jr_003_407c:
    ld hl, $c0ec
    add hl, bc
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call Call_003_408e

jr_003_4087:
    inc c
    ld a, c
    cp $04
    jr nz, jr_003_4066

    ret


Call_003_408e:
Jump_003_408e:
    ld a, [hl]
    and $f0
    swap a
    add a
    ld e, a
    ld d, $00
    ld a, [hl+]
    push hl
    and $0f
    ld hl, data_03_40a5
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld h, d
    ld l, e
    jp hl


data_03_40a5::
    ret z

    ld b, b
    di
    ld b, b
    inc c
    ld b, c
    dec e
    ld b, c
    ld [hl-], a
    ld b, c
    ld c, e
    ld b, c
    ld d, a
    ld b, c
    and e
    ld b, c
    adc $41
    push bc
    ld b, b
    push bc
    ld b, b
    push bc
    ld b, b
    push bc
    ld b, b
    push bc
    ld b, b
    push bc
    ld b, b
    ld [$c341], a
    adc [hl]
    ld b, b
    ld d, a
    pop hl
    ld a, [hl+]
    ld e, a
    push hl
    ld hl, $c0d8
    add hl, bc
    add hl, bc
    ld [hl+], a
    ld [hl], d
    ld hl, $c0cc
    add hl, bc
    ld a, [hl]
    ld [hl], $00
    or d
    ld d, a
    ld hl, $ff13
    ld a, c
    add a
    add a
    add c
    add l
    ld l, a
    ld a, e
    ld [hl+], a
    ld [hl], d
    pop de

Jump_003_40ea:
    ld hl, $c0ec
    add hl, bc
    add hl, bc
    ld [hl], e
    inc hl
    ld [hl], d
    ret


    ld hl, $c0cc
    add hl, bc
    ld a, $80
    ld [hl], a
    pop hl
    ld a, [hl+]
    ld e, a
    push hl
    ld hl, $ff12
    ld a, c
    add a
    add a
    add c
    add l
    ld l, a
    ld [hl], e
    pop hl
    jp Jump_003_408e


    swap a
    ld e, a
    ld hl, $ff11
    ld a, c
    add a
    add a
    add c
    add l
    ld l, a
    ld [hl], e
    pop hl
    jp Jump_003_408e


    ld hl, $c0e4
    add hl, bc
    add hl, bc
    pop de
    ld a, [de]
    inc de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c0e0
    add hl, bc
    ld [hl], a
    ld l, e
    ld h, d
    jp Jump_003_408e


    ld hl, $c0e0
    add hl, bc
    ld a, [hl]
    dec a
    jr z, jr_003_4147

    ld [hl], a
    ld hl, $c0e4
    add hl, bc
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    jp Jump_003_408e


jr_003_4147:
    pop hl
    jp Jump_003_408e


    ld hl, $c0d0
    add hl, bc
    ld e, l
    ld d, h
    pop hl
    ld a, [hl+]
    ld [de], a
    jp Jump_003_408e


    call Call_003_4168
    ld hl, $c0d4
    add hl, bc
    ld e, l
    ld d, h
    pop hl
    ld a, [hl+]
    ld [de], a
    ld e, l
    ld d, h
    jp Jump_003_40ea


Call_003_4168:
    ld hl, $c0d0
    add hl, bc
    ld a, [hl]
    or a
    jr z, jr_003_41a2

    ld hl, $c0d8
    add hl, bc
    add hl, bc
    bit 7, a
    jr z, jr_003_4185

    xor $ff
    inc a
    ld d, a
    ld a, [hl]
    sub d
    ld [hl+], a
    ld e, a
    ld a, [hl]
    sbc b
    jr jr_003_418c

jr_003_4185:
    ld d, a
    ld a, [hl]
    add d
    ld [hl+], a
    ld e, a
    ld a, [hl]
    adc b

jr_003_418c:
    ld [hl], a
    ld hl, $c0cc
    add hl, bc
    ld d, [hl]
    ld [hl], $00
    or d
    ld d, a
    ld hl, $ff13
    ld a, c
    add a
    add a
    add c
    add l
    ld l, a
    ld a, e
    ld [hl+], a
    ld [hl], d

jr_003_41a2:
    ret


    add a
    ld d, $00
    ld e, a
    ld hl, data_03_434c
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, $00
    ldh [rNR30], a
    ld b, d
    ld de, $ff30

jr_003_41b6:
    ld a, [hl+]
    ld [de], a
    inc de
    inc b
    ld a, b
    cp $10
    jr nz, jr_003_41b6

    ld a, $01
    ld [$c02b], a
    ld a, $80
    ldh [rNR30], a
    ld b, $00
    pop hl
    jp Jump_003_408e


    pop hl
    ld a, [hl+]
    push hl
    push bc
    inc c
    ld e, $ee

jr_003_41d5:
    dec c
    jr z, jr_003_41dd

    rlca
    sla e
    jr jr_003_41d5

jr_003_41dd:
    ld d, a
    ld hl, $c025
    ld a, [hl]
    and e
    or d
    ld [hl], a
    pop bc
    pop hl
    jp Jump_003_408e


    ld e, c
    inc e
    ld a, $7f

jr_003_41ee:
    rlca
    dec e
    jr nz, jr_003_41ee

    ld e, a
    ld a, [$c02d]
    and e
    ld [$c02d], a
    ld a, c
    rlca
    rlca
    add c
    ld e, a
    ld d, b
    ld hl, $ff12
    add hl, de
    ld a, $08
    ld [hl+], a
    inc hl
    swap a
    ld [hl], a
    pop hl
    ret


Call_003_420d:
    xor a
    ld [$c0f4], a
    ld [$c023], a
    ld a, $80
    ld [$c022], a
    ret


Call_003_421a:
    ld a, $08
    ldh a, [rNR12]
    ldh a, [rNR22]
    ldh a, [rNR32]
    ldh a, [rNR42]
    ld a, $80
    ldh a, [rNR14]
    ldh a, [rNR24]
    ldh a, [rNR44]
    xor a
    ld [$c02d], a
    ret


table_03_4231::
    dw data_03_42a3
    dw data_03_42a4
    dw data_03_42a7
    dw data_03_42aa
    dw data_03_42ad
    dw data_03_42b0
    dw data_03_42b3
    dw data_03_42b6
    dw data_03_42b9
    dw data_03_42bc
    dw data_03_42bf
    dw data_03_42c2
    dw data_03_42c5
    dw data_03_42c8
    dw data_03_42cb
    dw data_03_42ce
    dw data_03_42d1
    dw data_03_42d4
    dw data_03_42d7
    dw data_03_42da
    dw data_03_42dd
    dw data_03_42e0
    dw data_03_42e3
    dw data_03_42e6
    dw data_03_42e9
    dw data_03_42ec
    dw data_03_42ef
    dw data_03_42f2
    dw data_03_42f5
    dw data_03_42f8
    dw data_03_42fb
    dw data_03_42fe
    dw data_03_4301
    dw data_03_4304
    dw data_03_4307
    dw data_03_430a
    dw data_03_430d
    dw data_03_4310
    dw data_03_4313
    dw data_03_4316
    dw data_03_4319
    dw data_03_431c
    dw data_03_431f
    dw data_03_4322
    dw data_03_4325
    dw data_03_4328
    dw data_03_432b
    dw data_03_432e
    dw data_03_4331
    dw data_03_4334
    dw data_03_4337
    dw data_03_433a
    dw data_03_433d
    dw data_03_4340
    dw data_03_4343
    dw data_03_4346
    dw data_03_4349

data_03_42a3::
    db $00

data_03_42a4::
    db $02, $44, $45

data_03_42a7::
    db $02, $50, $45

data_03_42aa::
    db $02, $75, $45

data_03_42ad::
    db $02, $8c, $45

data_03_42b0::
    db $08, $ec, $45

data_03_42b3::
    db $08, $18, $46

data_03_42b6::
    db $02, $41, $46

data_03_42b9::
    db $02, $57, $46

data_03_42bc::
    db $08, $9d, $46

data_03_42bf::
    db $08, $c9, $46

data_03_42c2::
    db $08, $23, $47

data_03_42c5::
    db $08, $75, $47

data_03_42c8::
    db $08, $99, $47

data_03_42cb::
    db $08, $e9, $47

data_03_42ce::
    db $08, $23, $48

data_03_42d1::
    db $08, $4d, $48

data_03_42d4::
    db $08, $77, $48

data_03_42d7::
    db $02, $a5, $48

data_03_42da::
    db $02, $ed, $48

data_03_42dd::
    db $02, $53, $49

data_03_42e0::
    db $02, $fb, $49

data_03_42e3::
    db $02, $61, $4a

data_03_42e6::
    db $02, $c7, $4a

data_03_42e9::
    db $02, $2d, $4b

data_03_42ec::
    db $02, $93, $4b

data_03_42ef::
    db $02, $f9, $4b

data_03_42f2::
    db $02, $5f, $4c

data_03_42f5::
    db $02, $c5, $4c

data_03_42f8::
    db $02, $2b, $4d

data_03_42fb::
    db $02, $3a, $4d

data_03_42fe::
    db $02, $9a, $4d

data_03_4301::
    db $02, $25, $4e

data_03_4304::
    db $08, $54, $4e

data_03_4307::
    db $08, $7e, $4e

data_03_430a::
    db $02, $98, $4e

data_03_430d::
    db $08, $ce, $4e

data_03_4310::
    db $02, $de, $4e

data_03_4313::
    db $02, $ea, $4e

data_03_4316::
    db $02, $21, $4f

data_03_4319::
    db $08, $4c, $4f

data_03_431c::
    db $08, $72, $4f

data_03_431f::
    db $08, $9a, $4f

data_03_4322::
    db $02, $a8, $4f

data_03_4325::
    db $02, $b4, $4f

data_03_4328::
    db $08, $2e, $50

data_03_432b::
    db $02, $64, $50

data_03_432e::
    db $02, $8f, $50

data_03_4331::
    db $08, $c1, $50

data_03_4334::
    db $02, $e7, $50

data_03_4337::
    db $02, $05, $51

data_03_433a::
    db $02, $25, $51

data_03_433d::
    db $08, $44, $51

data_03_4340::
    db $02, $6e, $51

data_03_4343::
    db $02, $8a, $51

data_03_4346::
    db $02, $b3, $51

data_03_4349::
    db $08, $e9, $51

data_03_434c::
    dw data_03_4384
    dw data_03_4394
    dw data_03_43a4
    dw data_03_43b4
    dw data_03_43c4
    dw data_03_43d4
    dw data_03_43e4
    dw data_03_43f4
    dw data_03_4504
    dw data_03_4514
    dw data_03_4524
    dw data_03_4534
    dw data_03_44c4
    dw data_03_44d4
    dw data_03_44e4
    dw data_03_44f4
    dw data_03_4484
    dw data_03_4494
    dw data_03_44a4
    dw data_03_44b4
    dw data_03_4444
    dw data_03_4454
    dw data_03_4464
    dw data_03_4474
    dw data_03_4404
    dw data_03_4414
    dw data_03_4424
    dw data_03_4434

data_03_4384::
    db $79, $bd, $ff, $ff, $ff, $ff, $fd, $b9, $75, $31, $00, $00, $00, $00, $01, $35

data_03_4394::
    db $01, $12, $23, $34, $45, $56, $67, $77, $88, $99, $aa, $bb, $cc, $dd, $ee, $ff

data_03_43a4::
    db $12, $23, $33, $44, $55, $66, $77, $77, $78, $89, $9a, $ab, $bb, $cc, $dd, $ee

data_03_43b4::
    db $22, $33, $34, $45, $55, $66, $77, $77, $78, $89, $99, $aa, $bb, $bc, $cd, $dd

data_03_43c4::
    db $33, $34, $44, $55, $56, $66, $77, $77, $78, $88, $99, $9a, $aa, $bb, $bc, $cc

data_03_43d4::
    db $7b, $ff, $ff, $fb, $73, $00, $00, $03, $7b, $ff, $ff, $fb, $73, $00, $00, $03

data_03_43e4::
    db $7b, $ef, $ff, $eb, $73, $00, $00, $03, $7b, $ef, $ff, $eb, $73, $00, $00, $03

data_03_43f4::
    db $7a, $df, $ff, $da, $74, $10, $00, $14, $7a, $df, $ff, $da, $74, $10, $00, $14

data_03_4404::
    db $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $00, $00

data_03_4414::
    db $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $11, $11

data_03_4424::
    db $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $22, $22

data_03_4434::
    db $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $33, $33

data_03_4444::
    db $ee, $ee, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

data_03_4454::
    db $dd, $dd, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11

data_03_4464::
    db $cc, $cc, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22

data_03_4474::
    db $bb, $bb, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33

data_03_4484::
    db $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $00, $00, $00, $00

data_03_4494::
    db $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $11, $11, $11, $11

data_03_44a4::
    db $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $22, $22, $22, $22

data_03_44b4::
    db $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $33, $33, $33, $33

data_03_44c4::
    db $ee, $ee, $ee, $ee, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

data_03_44d4::
    db $dd, $dd, $dd, $dd, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11

data_03_44e4::
    db $cc, $cc, $cc, $cc, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22

data_03_44f4::
    db $bb, $bb, $bb, $bb, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33

data_03_4504::
    db $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $00, $00, $00, $00, $00, $00, $00, $00

data_03_4514::
    db $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $11, $11, $11, $11, $11, $11, $11, $11

data_03_4524::
    db $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $22, $22, $22, $22, $22, $22, $22, $22

data_03_4534::
    db $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $33, $33, $33, $33, $33, $33, $33, $33

data_03_4544::
    db $10, $d2, $24, $80, $11, $07, $83, $07, $9d, $07, $59, $f0

data_03_4550::
    db $10, $e2, $28, $80, $11, $50, $ce, $07, $83, $07, $83, $07, $ac, $07, $ac, $07
    db $9d, $07, $9d, $07, $ac, $07, $ac, $07, $c1, $07, $c1, $07, $ac, $07, $ac, $30
    db $0f, $07, $c1, $40, $f0

data_03_4575::
    db $10, $d0, $20, $80, $11, $07, $59, $50, $00, $60, $01, $50, $b0, $60, $05, $30
    db $03, $05, $cd, $05, $ed, $40, $f0

data_03_458c::
    db $28, $80, $11, $10, $f2, $07, $7b, $07, $7b, $07, $90, $07, $90, $07, $a7, $07
    db $a7, $07, $ac, $07, $ac, $30, $03, $07, $ac, $40, $10, $83, $07, $7b, $07, $7b
    db $07, $90, $07, $90, $07, $a7, $07, $a7, $07, $ac, $07, $ac, $30, $03, $07, $ac
    db $40, $10, $45, $07, $7b, $07, $7b, $07, $90, $07, $90, $07, $a7, $07, $a7, $07
    db $ac, $07, $ac, $30, $03, $07, $ac, $40, $10, $26, $07, $7b, $07, $7b, $07, $90
    db $07, $90, $07, $a7, $07, $a7, $07, $ac, $07, $ac, $30, $03, $07, $ac, $40, $f0

data_03_45ec::
    db $80, $11, $10, $f1, $00, $8d, $00, $25, $00, $f1, $00, $60, $10, $00, $50, $00
    db $60, $01, $50, $ff, $10, $f1, $10, $f1, $10, $f1, $00, $17, $00, $14, $00, $07
    db $00, $04, $00, $02, $30, $05, $00, $01, $00, $00, $40, $f0

data_03_4618::
    db $80, $11, $10, $f1, $00, $8d, $00, $25, $00, $f1, $00, $60, $10, $00, $50, $00
    db $60, $01, $50, $ff, $10, $f1, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f1
    db $10, $f1, $00, $06, $50, $02, $60, $07, $f0

data_03_4641::
    db $10, $f0, $28, $80, $11, $07, $39, $10, $00, $50, $00, $60, $01, $50, $ff, $10
    db $f0, $07, $59, $07, $9d, $f0

data_03_4657::
    db $10, $f0, $20, $80, $11, $07, $b1, $50, $0a, $60, $03, $10, $00, $50, $00, $60
    db $01, $50, $0a, $10, $f0, $10, $00, $50, $00, $60, $01, $50, $0a, $10, $f0, $10
    db $00, $50, $00, $60, $01, $50, $0a, $10, $f0, $10, $00, $50, $00, $60, $01, $50
    db $0a, $10, $f0, $10, $00, $50, $00, $60, $01, $50, $0a, $10, $f0, $07, $83, $07
    db $a7, $50, $0a, $60, $03, $f0

data_03_469d::
    db $80, $11, $10, $d1, $00, $1f, $50, $ff, $60, $05, $10, $59, $00, $18, $50, $01
    db $60, $06, $10, $d0, $00, $1f, $00, $2c, $00, $1f, $00, $1f, $00, $1e, $00, $1f
    db $00, $1d, $00, $1e, $30, $0a, $00, $1d, $00, $1c, $40, $f0

data_03_46c9::
    db $80, $11, $10, $f0, $00, $8d, $00, $38, $00, $3a, $00, $3f, $10, $00, $50, $00
    db $60, $01, $50, $ff, $10, $f0, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f0
    db $10, $f2, $30, $03, $00, $14, $00, $16, $40, $00, $15, $00, $17, $00, $16, $00
    db $24, $00, $17, $00, $25, $00, $24, $00, $26, $00, $25, $00, $27, $00, $26, $00
    db $34, $00, $27, $00, $35, $00, $34, $00, $36, $00, $35, $00, $37, $00, $36, $00
    db $44, $00, $37, $00, $45, $00, $44, $00, $46, $f0

data_03_4723::
    db $80, $11, $10, $f0, $00, $8d, $00, $38, $00, $3a, $00, $3f, $10, $00, $50, $00
    db $60, $01, $50, $ff, $10, $f0, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f0
    db $10, $f2, $30, $03, $00, $18, $00, $16, $40, $00, $21, $00, $19, $00, $22, $00
    db $1a, $00, $23, $00, $1b, $00, $24, $00, $1c, $00, $25, $00, $1d, $00, $17, $00
    db $1c, $00, $15, $00, $0f, $00, $14, $00, $0d, $00, $07, $00, $0b, $00, $05, $00
    db $09, $f0

data_03_4775::
    db $80, $11, $10, $d1, $00, $18, $50, $01, $60, $06, $10, $59, $00, $1f, $00, $1e
    db $00, $1d, $00, $1c, $00, $0f, $50, $ff, $60, $07, $10, $f0, $30, $0a, $00, $09
    db $00, $0a, $40, $f0

data_03_4799::
    db $80, $11, $10, $f0, $00, $8d, $00, $38, $00, $3a, $00, $3f, $10, $00, $50, $00
    db $60, $01, $50, $ff, $10, $f0, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f0
    db $10, $f2, $00, $3a, $00, $1f, $00, $05, $00, $1f, $00, $1e, $00, $06, $00, $1d
    db $00, $05, $00, $1c, $00, $04, $00, $0f, $00, $03, $00, $0e, $00, $02, $00, $0d
    db $00, $01, $00, $0c, $00, $00, $00, $0b, $30, $05, $00, $02, $00, $0a, $40, $f0

data_03_47e9::
    db $80, $11, $10, $f0, $00, $8d, $00, $38, $00, $3a, $00, $3f, $10, $00, $50, $00
    db $60, $01, $50, $ff, $10, $f0, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f0
    db $10, $f1, $00, $3a, $00, $1f, $00, $1f, $00, $1e, $00, $06, $00, $1d, $00, $04
    db $00, $0f, $30, $04, $00, $02, $00, $0d, $40, $f0

data_03_4823::
    db $10, $e2, $80, $11, $00, $57, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $e2
    db $10, $00, $50, $00, $60, $01, $50, $ff, $10, $e2, $10, $00, $50, $00, $60, $01
    db $50, $ff, $10, $e2, $30, $1a, $00, $36, $40, $f0

data_03_484d::
    db $10, $e3, $80, $11, $00, $57, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $e3
    db $10, $00, $50, $00, $60, $01, $50, $ff, $10, $e3, $10, $00, $50, $00, $60, $01
    db $50, $ff, $10, $e3, $30, $28, $00, $36, $40, $f0

data_03_4877::
    db $10, $e0, $80, $11, $00, $77, $00, $37, $10, $00, $50, $00, $60, $01, $50, $ff
    db $10, $e0, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $e0, $10, $00, $50, $00
    db $60, $01, $50, $ff, $10, $e0, $10, $e4, $30, $32, $00, $37, $40, $f0

data_03_48a5::
    db $20, $80, $11, $10, $f0, $06, $a4, $50, $14, $60, $02, $10, $00, $50, $00, $60
    db $01, $50, $14, $10, $f0, $06, $2c, $50, $fb, $60, $02, $06, $22, $50, $0a, $60
    db $02, $10, $f1, $06, $36, $50, $fb, $60, $02, $06, $2c, $50, $1e, $60, $02, $06
    db $68, $50, $f1, $60, $02, $06, $4a, $50, $1e, $60, $02, $06, $86, $50, $f1, $60
    db $02, $06, $68, $50, $1e, $60, $03, $f0

data_03_48ed::
    db $20, $80, $11, $10, $f0, $06, $a4, $50, $14, $60, $03, $10, $00, $50, $00, $60
    db $01, $50, $14, $10, $f0, $06, $0e, $50, $0a, $60, $02, $06, $22, $50, $fb, $60
    db $02, $06, $18, $50, $0a, $60, $02, $06, $2c, $50, $fb, $60, $02, $06, $22, $50
    db $0a, $60, $02, $06, $36, $50, $fb, $60, $02, $10, $f1, $06, $2c, $50, $14, $60
    db $02, $06, $54, $50, $f6, $60, $02, $06, $40, $50, $1e, $60, $02, $06, $7c, $50
    db $f1, $60, $02, $06, $5e, $50, $1e, $60, $02, $06, $9a, $50, $f1, $60, $02, $06
    db $7c, $50, $28, $60, $02, $f0

data_03_4953::
    db $20, $80, $11, $10, $f0, $06, $a4, $50, $14, $60, $03, $10, $00, $50, $00, $60
    db $01, $50, $14, $10, $f0, $10, $00, $50, $00, $60, $01, $50, $14, $10, $f0, $10
    db $00, $50, $00, $60, $01, $50, $14, $10, $f0, $10, $00, $50, $00, $60, $01, $50
    db $14, $10, $f0, $06, $0e, $50, $0a, $60, $02, $06, $22, $50, $fb, $60, $02, $06
    db $18, $50, $0a, $60, $02, $06, $2c, $50, $fb, $60, $02, $06, $22, $50, $0a, $60
    db $02, $06, $36, $50, $fb, $60, $02, $06, $2c, $50, $0a, $60, $02, $06, $40, $50
    db $fb, $60, $02, $06, $36, $50, $0a, $60, $02, $06, $4a, $50, $fb, $60, $02, $06
    db $40, $50, $14, $60, $02, $06, $68, $50, $f6, $60, $02, $10, $f1, $06, $54, $50
    db $1e, $60, $02, $06, $90, $50, $f1, $60, $02, $06, $72, $50, $1e, $60, $02, $06
    db $ae, $50, $f1, $60, $02, $06, $90, $50, $1e, $60, $02, $06, $cc, $50, $f1, $60
    db $02, $06, $ae, $50, $1e, $60, $04, $f0

data_03_49fb::
    db $20, $80, $11, $10, $f0, $03, $84, $50, $28, $60, $03, $10, $00, $50, $00, $60
    db $01, $50, $28, $10, $f0, $01, $c2, $50, $1e, $60, $02, $01, $fe, $50, $f6, $60
    db $02, $01, $ea, $50, $1e, $60, $02, $02, $26, $50, $f6, $60, $02, $02, $12, $50
    db $28, $60, $02, $02, $62, $50, $f6, $60, $02, $10, $f1, $02, $4e, $50, $32, $60
    db $02, $02, $b2, $50, $f1, $60, $02, $02, $94, $50, $32, $60, $02, $02, $f8, $50
    db $f1, $60, $02, $02, $da, $50, $32, $60, $02, $03, $3e, $50, $f1, $60, $02, $03
    db $20, $50, $3c, $60, $03, $f0

data_03_4a61::
    db $20, $80, $11, $10, $f0, $04, $b0, $50, $14, $60, $03, $10, $00, $50, $00, $60
    db $01, $50, $14, $10, $f0, $04, $1a, $50, $0a, $60, $02, $04, $2e, $50, $fb, $60
    db $02, $04, $24, $50, $0a, $60, $02, $04, $38, $50, $fb, $60, $02, $04, $2e, $50
    db $0a, $60, $02, $04, $42, $50, $fb, $60, $02, $10, $f1, $04, $38, $50, $14, $60
    db $02, $04, $60, $50, $f6, $60, $02, $04, $4c, $50, $1e, $60, $02, $04, $88, $50
    db $f1, $60, $02, $04, $6a, $50, $1e, $60, $02, $04, $a6, $50, $f1, $60, $02, $04
    db $88, $50, $28, $60, $02, $f0

data_03_4ac7::
    db $20, $80, $11, $10, $f0, $05, $14, $50, $14, $60, $03, $10, $00, $50, $00, $60
    db $01, $50, $14, $10, $f0, $04, $7e, $50, $0a, $60, $02, $04, $92, $50, $fb, $60
    db $02, $04, $88, $50, $0a, $60, $02, $04, $9c, $50, $fb, $60, $02, $04, $92, $50
    db $0a, $60, $02, $04, $a6, $50, $fb, $60, $02, $10, $f1, $04, $9c, $50, $14, $60
    db $02, $04, $c4, $50, $f6, $60, $02, $04, $b0, $50, $1e, $60, $02, $04, $ec, $50
    db $f1, $60, $02, $04, $ce, $50, $1e, $60, $02, $05, $0a, $50, $f1, $60, $02, $04
    db $ec, $50, $28, $60, $02, $f0

data_03_4b2d::
    db $20, $80, $11, $10, $f0, $06, $40, $50, $14, $60, $03, $10, $00, $50, $00, $60
    db $01, $50, $14, $10, $f0, $05, $aa, $50, $0a, $60, $02, $05, $be, $50, $fb, $60
    db $02, $05, $b4, $50, $0a, $60, $02, $05, $c8, $50, $fb, $60, $02, $05, $be, $50
    db $0a, $60, $02, $05, $d2, $50, $fb, $60, $02, $10, $f1, $05, $c8, $50, $14, $60
    db $02, $05, $f0, $50, $f6, $60, $02, $05, $dc, $50, $1e, $60, $02, $06, $18, $50
    db $f1, $60, $02, $05, $fa, $50, $1e, $60, $02, $06, $36, $50, $f1, $60, $02, $06
    db $18, $50, $28, $60, $02, $f0

data_03_4b93::
    db $20, $80, $11, $10, $f0, $06, $a4, $50, $0f, $60, $03, $10, $00, $50, $00, $60
    db $01, $50, $0f, $10, $f0, $06, $0e, $50, $0a, $60, $02, $06, $22, $50, $fb, $60
    db $02, $06, $18, $50, $0a, $60, $02, $06, $2c, $50, $fb, $60, $02, $06, $22, $50
    db $0a, $60, $02, $06, $36, $50, $fb, $60, $02, $10, $f1, $06, $2c, $50, $14, $60
    db $02, $06, $54, $50, $f6, $60, $02, $06, $40, $50, $1e, $60, $02, $06, $7c, $50
    db $f1, $60, $02, $06, $5e, $50, $1e, $60, $02, $06, $9a, $50, $f1, $60, $02, $06
    db $7c, $50, $28, $60, $02, $f0

data_03_4bf9::
    db $20, $80, $11, $10, $f0, $07, $08, $50, $0a, $60, $03, $10, $00, $50, $00, $60
    db $01, $50, $0a, $10, $f0, $06, $72, $50, $0a, $60, $02, $06, $86, $50, $fb, $60
    db $02, $06, $7c, $50, $0a, $60, $02, $06, $90, $50, $fb, $60, $02, $06, $86, $50
    db $0a, $60, $02, $06, $9a, $50, $fb, $60, $02, $10, $f1, $06, $90, $50, $14, $60
    db $02, $06, $b8, $50, $f6, $60, $02, $06, $a4, $50, $1e, $60, $02, $06, $e0, $50
    db $f1, $60, $02, $06, $c2, $50, $1e, $60, $02, $06, $fe, $50, $f1, $60, $02, $06
    db $e0, $50, $28, $60, $02, $f0

data_03_4c5f::
    db $20, $80, $11, $10, $f0, $07, $3a, $50, $0a, $60, $03, $10, $00, $50, $00, $60
    db $01, $50, $0a, $10, $f0, $06, $d6, $50, $0a, $60, $02, $06, $ea, $50, $fb, $60
    db $02, $06, $e0, $50, $0a, $60, $02, $06, $f4, $50, $fb, $60, $02, $06, $ea, $50
    db $0a, $60, $02, $06, $fe, $50, $fb, $60, $02, $10, $f1, $06, $f4, $50, $14, $60
    db $02, $07, $1c, $50, $f6, $60, $02, $07, $08, $50, $1e, $60, $02, $07, $44, $50
    db $f1, $60, $02, $07, $26, $50, $1e, $60, $02, $07, $62, $50, $f1, $60, $02, $07
    db $44, $50, $28, $60, $02, $f0

data_03_4cc5::
    db $20, $80, $11, $10, $f0, $07, $6c, $50, $07, $60, $03, $10, $00, $50, $00, $60
    db $01, $50, $07, $10, $f0, $07, $3a, $50, $0a, $60, $02, $07, $4e, $50, $fb, $60
    db $02, $07, $44, $50, $0a, $60, $02, $07, $58, $50, $fb, $60, $02, $07, $4e, $50
    db $0a, $60, $02, $07, $62, $50, $fb, $60, $02, $10, $f1, $07, $58, $50, $0f, $60
    db $02, $07, $76, $50, $f6, $60, $02, $07, $62, $50, $0f, $60, $02, $07, $80, $50
    db $f6, $60, $02, $07, $6c, $50, $14, $60, $02, $07, $94, $50, $f6, $60, $02, $07
    db $80, $50, $14, $60, $03, $f0

data_03_4d2b::
    db $24, $80, $11, $30, $12, $10, $d0, $07, $d1, $10, $80, $07, $d4, $40, $f0

data_03_4d3a::
    db $24, $80, $11, $30, $02, $10, $d0, $07, $d1, $10, $80, $07, $d4, $40, $10, $00
    db $50, $00, $60, $01, $50, $ff, $10, $80, $10, $00, $50, $00, $60, $01, $50, $ff
    db $10, $80, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $80, $10, $00, $50, $00
    db $60, $01, $50, $ff, $10, $80, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $80
    db $10, $00, $50, $00, $60, $01, $50, $ff, $10, $80, $10, $00, $50, $00, $60, $01
    db $50, $ff, $10, $80, $30, $12, $10, $d0, $07, $d1, $10, $80, $07, $d4, $40, $f0

data_03_4d9a::
    db $28, $80, $11, $30, $02, $10, $8b, $07, $c1, $50, $02, $60, $0a, $10, $00, $50
    db $00, $60, $01, $50, $02, $10, $8b, $10, $00, $50, $00, $60, $01, $50, $02, $10
    db $8b, $10, $00, $50, $00, $60, $01, $50, $02, $10, $8b, $10, $00, $50, $00, $60
    db $01, $50, $02, $10, $8b, $10, $3b, $07, $c1, $50, $02, $60, $0a, $10, $00, $50
    db $00, $60, $01, $50, $02, $10, $3b, $10, $00, $50, $00, $60, $01, $50, $02, $10
    db $3b, $10, $00, $50, $00, $60, $01, $50, $02, $10, $3b, $10, $0b, $07, $c1, $50
    db $02, $60, $0a, $10, $00, $50, $00, $60, $01, $50, $02, $10, $0b, $10, $00, $50
    db $00, $60, $01, $50, $02, $10, $0b, $10, $00, $50, $00, $60, $01, $50, $02, $10
    db $0b, $40, $10, $0d, $07, $c1, $50, $02, $60, $0a, $f0

data_03_4e25::
    db $28, $80, $11, $10, $e1, $07, $d1, $10, $00, $50, $00, $60, $01, $50, $ff, $10
    db $e1, $07, $d1, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $e1, $10, $00, $50
    db $00, $60, $01, $50, $ff, $10, $e1, $10, $f3, $30, $1e, $07, $e1, $40, $f0

data_03_4e54::
    db $80, $11, $10, $d0, $00, $67, $00, $78, $00, $38, $00, $48, $10, $00, $50, $00
    db $60, $01, $50, $ff, $10, $d0, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $d0
    db $10, $d2, $30, $0d, $00, $1a, $00, $2d, $40, $f0

data_03_4e7e::
    db $80, $11, $10, $b1, $00, $10, $50, $02, $60, $03, $10, $f2, $00, $88, $50, $f0
    db $60, $05, $30, $0c, $00, $18, $00, $26, $40, $f0

data_03_4e98::
    db $20, $80, $11, $10, $d3, $05, $ac, $50, $19, $60, $05, $06, $0b, $50, $19, $60
    db $05, $06, $5b, $50, $19, $60, $05, $06, $9e, $50, $19, $60, $05, $06, $d6, $50
    db $19, $60, $05, $07, $05, $50, $19, $60, $05, $07, $2d, $50, $19, $60, $05, $07
    db $4f, $50, $19, $60, $05, $f0

data_03_4ece::
    db $80, $11, $10, $e0, $30, $0f, $00, $2a, $00, $08, $00, $0a, $00, $b8, $40, $f0

data_03_4ede::
    db $28, $80, $11, $10, $f3, $07, $e1, $50, $ff, $60, $96, $f0

data_03_4eea::
    db $2c, $80, $11, $10, $e1, $30, $02, $04, $16, $50, $14, $60, $03, $40, $10, $89
    db $04, $83, $50, $23, $60, $04, $10, $99, $05, $3c, $50, $23, $60, $04, $10, $a9
    db $05, $cd, $50, $23, $60, $04, $10, $b9, $06, $42, $50, $23, $60, $04, $10, $c9
    db $06, $9e, $50, $23, $60, $04, $f0

data_03_4f21::
    db $24, $80, $11, $30, $04, $10, $9a, $07, $c1, $50, $04, $60, $04, $10, $00, $50
    db $00, $60, $01, $50, $04, $10, $9a, $10, $00, $50, $00, $60, $01, $50, $04, $10
    db $9a, $10, $d1, $07, $c1, $50, $f6, $60, $0a, $40, $f0

data_03_4f4c::
    db $80, $11, $10, $f1, $00, $00, $00, $27, $00, $00, $00, $27, $00, $60, $10, $f0
    db $00, $08, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f0, $10, $f2, $30, $0c
    db $00, $18, $00, $19, $40, $f0

data_03_4f72::
    db $80, $11, $10, $89, $30, $02, $00, $10, $00, $03, $00, $08, $00, $01, $40, $10
    db $f0, $30, $0a, $00, $10, $00, $03, $00, $01, $40, $10, $f1, $30, $04, $00, $10
    db $00, $03, $00, $08, $00, $01, $40, $f0

data_03_4f9a::
    db $80, $11, $30, $12, $10, $f1, $00, $09, $00, $04, $00, $07, $40, $f0

data_03_4fa8::
    db $28, $80, $11, $10, $f0, $07, $c1, $50, $00, $60, $01, $f0

data_03_4fb4::
    db $24, $80, $11, $10, $99, $07, $05, $50, $14, $60, $06, $10, $00, $50, $00, $60
    db $01, $50, $14, $10, $99, $10, $00, $50, $00, $60, $01, $50, $14, $10, $99, $10
    db $00, $50, $00, $60, $01, $50, $14, $10, $99, $10, $00, $50, $00, $60, $01, $50
    db $14, $10, $99, $10, $00, $50, $00, $60, $01, $50, $14, $10, $99, $10, $00, $50
    db $00, $60, $01, $50, $14, $10, $99, $10, $00, $50, $00, $60, $01, $50, $14, $10
    db $99, $07, $21, $10, $00, $50, $00, $60, $01, $50, $14, $10, $99, $10, $00, $50
    db $00, $60, $01, $50, $14, $10, $99, $10, $00, $50, $00, $60, $01, $50, $14, $10
    db $99, $10, $e2, $07, $21, $50, $f1, $60, $14, $f0

data_03_502e::
    db $80, $11, $10, $f0, $00, $04, $00, $02, $10, $00, $50, $00, $60, $01, $50, $ff
    db $10, $f0, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f0, $10, $00, $50, $00
    db $60, $01, $50, $ff, $10, $f0, $30, $0a, $10, $f1, $00, $00, $00, $01, $00, $02
    db $00, $00, $00, $01, $40, $f0

data_03_5064::
    db $28, $80, $11, $10, $e1, $07, $d6, $10, $00, $50, $00, $60, $01, $50, $ff, $10
    db $e1, $07, $d6, $50, $00, $60, $09, $10, $e2, $07, $c8, $10, $00, $50, $00, $60
    db $01, $50, $00, $10, $e2, $30, $1e, $07, $c8, $40, $f0

data_03_508f::
    db $20, $80, $11, $10, $f0, $30, $03, $04, $16, $04, $4e, $40, $10, $00, $50, $00
    db $60, $01, $50, $ff, $10, $f0, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f0
    db $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f0, $30, $0a, $04, $16, $04, $4e
    db $40, $f0

data_03_50c1::
    db $80, $11, $10, $f1, $00, $2f, $00, $1f, $00, $2f, $10, $00, $50, $00, $60, $01
    db $50, $ff, $10, $f1, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f1, $10, $f2
    db $30, $1c, $00, $0c, $40, $f0

data_03_50e7::
    db $28, $80, $11, $10, $e1, $04, $16, $50, $9c, $60, $05, $10, $00, $50, $00, $60
    db $01, $50, $9c, $10, $e1, $10, $f1, $01, $6b, $50, $7f, $60, $0f, $f0

data_03_5105::
    db $2c, $80, $11, $10, $f1, $06, $0b, $10, $00, $50, $00, $60, $01, $50, $ff, $10
    db $f1, $10, $f1, $04, $16, $50, $0a, $60, $03, $04, $e5, $50, $ec, $60, $0a, $f0

data_03_5125::
    db $20, $80, $11, $10, $f2, $30, $0f, $10, $f1, $01, $5e, $00, $0a, $10, $f1, $01
    db $18, $00, $0a, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f1, $40, $f0

data_03_5144::
    db $80, $11, $10, $39, $00, $54, $50, $01, $60, $03, $10, $00, $50, $00, $60, $01
    db $50, $01, $10, $39, $10, $99, $30, $04, $00, $55, $40, $10, $e0, $30, $1e, $00
    db $55, $40, $10, $e1, $30, $0f, $00, $55, $40, $f0

data_03_516e::
    db $28, $80, $11, $10, $f1, $04, $16, $50, $7f, $60, $03, $10, $89, $04, $16, $50
    db $7d, $60, $04, $10, $f1, $07, $83, $50, $b0, $60, $0f, $f0

data_03_518a::
    db $2c, $80, $11, $10, $f0, $30, $0a, $07, $ac, $10, $00, $50, $00, $60, $01, $50
    db $ff, $10, $f0, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f0, $10, $00, $50
    db $00, $60, $01, $50, $ff, $10, $f0, $40, $f0

data_03_51b3::
    db $28, $80, $11, $10, $89, $07, $c1, $50, $04, $60, $05, $10, $e2, $30, $03, $07
    db $d6, $50, $01, $60, $02, $40, $07, $d6, $50, $fa, $60, $04, $10, $89, $07, $c1
    db $50, $04, $60, $05, $10, $e2, $30, $05, $07, $d6, $50, $01, $60, $02, $40, $07
    db $d6, $50, $fb, $60, $0a, $f0

data_03_51e9::
    db $80, $11, $10, $e9, $00, $1c, $00, $03, $10, $00, $50, $00, $60, $01, $50, $ff
    db $10, $e9, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $e9, $10, $f0, $00, $0e
    db $00, $0a, $00, $0a, $00, $08, $f0
