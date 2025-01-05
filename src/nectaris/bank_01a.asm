; Disassembly of "Nectaris GB (Japan) (SGB Enhanced).gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "consts.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

SECTION "ROM Bank $01a", ROMX[$4000], BANK[$1a]

    ld e, d
    and l
    nop
    nop
    nop
    and b
    ld e, $00
    ld b, $00
    ld a, [bc]
    ld bc, $494b
    ld d, e
    ld d, e
    jr nz, jr_01a_405f

    ld b, c
    ld c, c
    ld c, h
    jp $5e9d


    nop
    nop
    ld b, a
    ld b, d
    jr nz, jr_01a_4069

    ld c, c
    ld d, e
    ld d, e
    jr nz, jr_01a_4070

    ld b, l
    ld c, [hl]
    ld d, l
    jr nz, jr_01a_4028

jr_01a_4028:
    nop
    nop
    add d
    add d
    ld b, h
    ld b, h
    jr z, jr_01a_4058

    db $10
    db $10
    jr z, jr_01a_405c

    ld b, h
    ld b, h
    add d
    add d
    nop
    nop
    db $10
    db $10
    jr c, jr_01a_4066

    jr c, @+$2a

    ld a, h
    ld b, h
    ld a, h
    ld b, h
    cp $82
    cp $fe
    nop
    nop
    jr c, jr_01a_4084

    ld a, h
    ld b, h
    cp $82
    cp $82
    cp $82
    ld a, h
    ld b, h
    jr c, jr_01a_4090

jr_01a_4058:
    nop
    nop
    db $10
    db $10

jr_01a_405c:
    jr c, @+$2a

    ld a, h

jr_01a_405f:
    ld b, h
    cp $82
    ld a, h
    ld b, h
    jr c, jr_01a_408e

jr_01a_4066:
    db $10
    stop

jr_01a_4069:
    nop
    jr c, jr_01a_40a4

    ld a, h
    ld b, h
    cp $92

jr_01a_4070:
    cp $aa
    cp $92
    ld a, h
    ld b, h
    jr c, jr_01a_40b0

    db $10
    db $10
    jr jr_01a_4094

    db $fc
    db $fc
    cp $fe
    db $fc
    db $fc
    jr jr_01a_409c

jr_01a_4084:
    db $10
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_01a_408e:
    nop
    nop

jr_01a_4090:
    nop
    nop
    nop
    nop

jr_01a_4094:
    nop
    nop
    call z, $2f7d
    ld a, a
    ld [hl], a
    ld a, [hl]

jr_01a_409c:
    inc b
    ld a, a
    sub b
    ld a, [hl]
    ld h, b
    ld [hl], d
    ld e, h
    ld h, [hl]

jr_01a_40a4:
    jr nc, @+$79

    ld c, l
    ld a, b
    ld h, e
    ld a, b
    ccf
    ld a, c
    ldh a, [$78]
    pop af
    ld a, l

jr_01a_40b0:
    inc bc
    ld a, [hl]
    ld b, e
    ld a, [hl]
    ld b, a
    ld a, l
    ld h, b
    ld a, l
    ld l, h
    ld [hl], a
    xor a
    ld a, l
    xor [hl]
    ld [hl], a
    ld a, e
    ld [hl], a
    cpl
    ld l, l
    ld [hl+], a
    ld [hl], d
    ld d, e
    ld l, l
    ld [hl], d
    ld l, l
    db $e4
    ld l, l
    ld l, $6e
    ld h, [hl]
    ld l, a
    ld a, d
    ld l, a
    adc a
    ld l, a
    sbc e
    ld l, a
    jp c, $eb6f

    ld l, a
    ld c, l
    ld [hl], c
    cp d
    ld [hl], b
    and $71
    jr c, jr_01a_4151

    adc e
    ld l, [hl]
    ld h, e
    ld l, [hl]
    sub e
    ld l, d
    dec de
    ld l, h
    jr z, @+$6e

    cpl
    ld l, h
    inc a
    ld l, h
    ld e, e
    ld l, h
    jr c, jr_01a_415e

    ld h, a
    ld l, h
    jp $8e6c


    ld l, h
    sub d
    ld l, h
    ret c

    ld l, h
    and l
    ld l, h
    xor c
    ld l, h
    ld sp, $e000
    ld hl, $4100
    trap $6f
    xor a
    ldh [$b7], a
    call Call_01a_498a

Jump_01a_410e:
    call Call_01a_4b33
    ld hl, $ffc0
    ld de, $ff44
    ld bc, $0001
    trap $e4
    ld a, $ff
    ldh [$c2], a
    xor a
    ldh [$c3], a
    ldh [$c1], a

jr_01a_4125:
    call Call_01a_47eb
    jp c, Jump_000_0303

    and $01
    jp z, Jump_01a_42a6

    call Call_01a_490e
    ldh a, [$8a]
    bit 2, a
    jp nz, Jump_01a_4290

Jump_01a_413a:
    call Call_01a_4acb
    and $02
    jr nz, jr_01a_4154

    ld h, a
    ld l, c
    trap $06
    ld b, $13
    nop
    push de
    ld [bc], a
    ld a, [de]
    nop
    ld b, h
    ld bc, $0168
    ld l, [hl]

jr_01a_4151:
    ld [bc], a
    ld [bc], a
    nop

jr_01a_4154:
    call Call_01a_4b36
    jr jr_01a_4125

    ld hl, $c500
    trap $6d

jr_01a_415e:
    ld hl, $4fb1
    jp Jump_01a_43b4


    ldh a, [$c0]
    ldh [$c2], a
    ldh a, [$c1]
    ldh [$c3], a
    call Call_01a_4990
    push af

jr_01a_4170:
    call Call_01a_47eb
    jr c, jr_01a_419b

    bit 0, a
    jr z, jr_01a_4170

    call Call_01a_4990
    pop de
    ld e, a
    call Call_01a_4235
    push de
    jr nz, jr_01a_419b

    ld a, d
    cp e
    jr nz, jr_01a_419b

    ld hl, $4fc1
    call Call_01a_4bd2
    ld de, $0b10
    call Call_01a_43e2
    jr nz, jr_01a_419b

    pop de
    call Call_01a_41a9
    push af

jr_01a_419b:
    pop af
    ld a, $ff
    ldh [$c2], a
    jp Jump_01a_410e


Call_01a_41a3:
    ld hl, $c500
    trap $ef
    ret


Call_01a_41a9:
    ld e, $00

Jump_01a_41ab:
    ld a, e
    cp d
    jp z, Jump_01a_422d

    push de
    ld hl, $c500
    trap $71
    pop de
    ld hl, $c500
    ld a, [hl+]
    or [hl]
    jr z, jr_01a_422d

    inc hl
    ld a, [hl]
    cp $ff
    jr z, jr_01a_422d

    push de
    call Call_01a_426d
    trap $6b
    pop de
    jr c, jr_01a_422d

    push de
    call Call_01a_478a
    pop hl
    push hl
    ld c, h
    ld a, [$c50a]
    ld [$c70a], a
    ld hl, $c700
    trap $e9
    jr c, jr_01a_422c

    ld a, [$c509]
    bit 0, a
    jr z, jr_01a_41f1

    call Call_01a_4929
    ld hl, $c700
    call Call_01a_492c

jr_01a_41f1:
    ld hl, $c500
    ld de, $c400
    ld bc, $0100
    trap $eb
    ld a, b
    or c
    jr z, jr_01a_420a

    ld hl, $c700
    ld de, $c400
    trap $ec
    jr jr_01a_41f1

jr_01a_420a:
    ld de, $c702
    ld hl, $c502
    ld b, $03

jr_01a_4212:
    ld a, [de]
    cp [hl]
    jr c, jr_01a_421d

    jr nz, jr_01a_4224

    dec de
    dec hl
    dec b
    jr nz, jr_01a_4212

jr_01a_421d:
    ld hl, $c700
    trap $ef
    jr jr_01a_422c

jr_01a_4224:
    pop de
    push de
    call Call_01a_4235
    call Call_01a_41a3

jr_01a_422c:
    pop de

Jump_01a_422d:
jr_01a_422d:
    inc e
    ld a, e
    cp $78
    jp c, Jump_01a_41ab

    ret


Call_01a_4235:
    add sp, -$08
    ld hl, sp+$00
    push de
    ld d, $fe
    ld bc, $0004
    trap $e4
    pop de
    ld hl, sp+$04
    push de
    ld e, d
    ld d, $fe
    ld bc, $0004
    trap $e4
    pop de
    ld hl, sp+$04
    push de
    ld d, $fe
    ld bc, $0004
    trap $e5
    pop de
    ld hl, sp+$00
    push de
    ld e, d
    ld d, $fe
    ld bc, $0004
    trap $e5
    pop de
    ld hl, sp+$00
    ld a, [hl+]
    or [hl]
    add sp, $08
    or a
    ret


Call_01a_426d:
    ld hl, $c700
    ld de, $c50c
    ld a, [$c50b]
    ld c, a
    ret


Call_01a_4278:
    ld hl, $c500
    ld a, [hl+]
    or [hl]
    ret z

    inc hl
    ld a, [hl]
    cp $ff
    ret


Jump_01a_4283:
    ld hl, $4f76
    call Call_01a_4bd2
    ld a, $b4
    trap $dc
    jp Jump_01a_413a


Jump_01a_4290:
    call Call_01a_4278
    jp z, Jump_01a_4283

    call Call_01a_4632
    jp c, Jump_01a_410e

    ld hl, $c500
    ld c, $01
    trap $8f
    jp Jump_01a_410e


Jump_01a_42a6:
    ld hl, $4ca0
    call Call_01a_5033
    call Call_01a_4b5e
    xor a
    call Call_01a_42f5
    jp Jump_01a_410e


    ld hl, $c500
    ld a, [hl+]
    or [hl]
    jr z, jr_01a_42d7

    ld hl, $4f85
    call Call_01a_4bd2
    ld de, $0710
    call Call_01a_43e2
    jp nz, Jump_01a_43d4

    ld a, [$c502]
    cp $ff
    jp z, Jump_01a_43b1

    call Call_01a_41a3

jr_01a_42d7:
    ld hl, $4cbe
    call Call_01a_5033
    call Call_01a_4b5e
    call Call_01a_501f
    jp nz, Jump_01a_4491

    call Call_01a_4b5e
    call Call_01a_4990
    call Call_01a_42f5
    jp nz, Jump_01a_4491

    jp Jump_01a_410e


Call_01a_42f5:
    ld [$ce0f], a
    ld hl, $ce00
    ld de, $4018
    ld bc, $000f
    trap $02
    trap $8e
    ld [$ce01], a
    xor a
    ld [$c500], a
    ld [$c501], a
    call Call_01a_4764
    call Call_01a_435f
    jr c, jr_01a_433d

    cp $01
    jr nz, jr_01a_433d

    ld de, $5a8f
    ld hl, $4d06
    call Call_01a_508f
    call Call_01a_435f
    jr c, jr_01a_433d

    cp $02
    jr nz, jr_01a_433d

    ld hl, $c500
    ld c, $ff
    trap $8f
    ld de, $5b4f
    ld hl, $4d1e
    xor a
    jr jr_01a_434f

jr_01a_433d:
    ld de, $5c0f
    ld hl, $4d5f
    ld a, [$ce00]
    cp $04
    jr nz, jr_01a_434f

    ld hl, $4dfe
    or $01

jr_01a_434f:
    push af
    call Call_01a_508f
    call Call_01a_475c
    pop af
    ret


Call_01a_4358:
jr_01a_4358:
    trap $da
    and $02
    jr nz, jr_01a_4358

    ret


Call_01a_435f:
    trap $c3
    trap $72
    ld a, [$ce00]
    push af
    cp $05
    call z, Call_01a_41a3
    trap $db
    pop af
    ret


Call_01a_4370:
    trap $c3
    trap $7c
    jr jr_01a_43ac

Call_01a_4376:
    ld hl, $ce00
    ld [hl], a
    ld d, h
    ld e, l
    ld c, $01
    trap $c3
    trap $7f
    jr jr_01a_43ac

Call_01a_4384:
    trap $c3
    trap $73
    jr jr_01a_43ac

Call_01a_438a:
    ld hl, $c700
    trap $c3
    trap $79
    jr jr_01a_43ac

Call_01a_4393:
    ld de, $c600

Jump_01a_4396:
    trap $c3
    trap $7d
    jr jr_01a_43ac

Call_01a_439c:
    trap $c3
    trap $77
    jr jr_01a_43ac

Call_01a_43a2:
    trap $c3
    trap $76
    jr jr_01a_43ac

Call_01a_43a8:
    trap $c3
    trap $75

jr_01a_43ac:
    push af
    trap $db
    pop af
    ret


Jump_01a_43b1:
jr_01a_43b1:
    ld hl, $4f66

Jump_01a_43b4:
    call Call_01a_4bd2
    ld a, $b4
    trap $dc
    jp Jump_01a_413a


    call Call_01a_4278
    jr z, jr_01a_43b1

    call Call_01a_43f1
    ld hl, $4f0f
    call Call_01a_43dc
    jr nz, jr_01a_43d4

    call Call_01a_41a3
    jp Jump_01a_410e


Jump_01a_43d4:
jr_01a_43d4:
    ldh a, [$c1]
    call Call_01a_4a36
    jp Jump_01a_413a


Call_01a_43dc:
    call Call_01a_4bd2
    ld de, $0710

Call_01a_43e2:
    ld a, $01
    ld bc, $2308
    ld hl, $0302
    trap $bf
    or a
    ret nz

    bit 1, h
    ret


Call_01a_43f1:
    call Call_01a_4b52
    ret c

    push af
    ld hl, $0068
    trap $bd
    ld hl, $c500
    trap $f2
    ld e, d
    pop af
    cp e
    ret nc

    call Call_01a_4b45
    ld hl, $440d
    trap $69
    ret


    or h
    ret c

    or c
    rrca
    ret


    or c
    or a
    or [hl]
    sbc $c3
    sbc $b7
    trap $bd
    ld c, $00
    ld a, $c4
    ld h, $04
    ld bc, $0301
    ld de, $0d12
    trap $b3
    ld de, $0000
    ld hl, $44a6
    trap $6a
    call Call_01a_4526
    ld bc, $000a
    ld hl, $c500
    call Call_01a_4965
    ld hl, $0753

Jump_01a_4440:
    ld de, $8865
    ld bc, $0791
    trap $c2
    ld hl, $0153
    trap $bd
    ld hl, $4510
    trap $69
    ld hl, $c400
    ld de, $ff46
    ld bc, $000a
    trap $e4
    xor a
    ld [$c40a], a
    ld hl, $c400
    call Call_01a_45dd
    ld hl, $015c
    trap $bd
    ld hl, $4518
    trap $69
    add sp, -$04
    ld hl, sp+$00
    ld de, $ff40
    ld bc, $0004
    trap $e4
    pop de
    pop bc
    ld hl, $c400
    trap $a0
    ld hl, $c404
    trap $69

jr_01a_4489:
    trap $b1
    trap $d8
    and $03
    jr z, jr_01a_4489

Jump_01a_4491:
    call Call_01a_4997
    call Call_01a_479d
    ld a, h
    call Call_01a_4a36
    call Call_01a_490e
    jp Jump_01a_413a


Call_01a_44a1:
    ld a, $32
    trap $dc
    ret


    rrca
    push bc
    trap $b4

jr_01a_44aa:
    ld c, $3a
    nop
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    or h
    ret c

    or c
    jr nz, jr_01a_44c7

    cp l
    or e
    ld c, $3a
    nop
    jr nz, jr_01a_44df

    jr nz, jr_01a_44e1

    jr nz, @+$22

    adc $df

jr_01a_44c5:
    or d
    db $dd

jr_01a_44c7:
    call nz, $b60f
    pop bc
    ld c, $3a
    nop
    jr nz, jr_01a_44f0

    jr nz, jr_01a_44f2

    jr nz, @+$22

    call z, $b2a7
    reti


    rrca
    cp h
    sbc $af
    cp d
    or e
    ld a, [hl-]

jr_01a_44df:
    ld c, $00

jr_01a_44e1:
    rrca
    jr nz, jr_01a_4511

    dec l
    dec l
    jr nz, jr_01a_44aa

    or e
    cp h
    db $dd
    jr nz, jr_01a_44c5

    jp c, $20b7

jr_01a_44f0:
    dec l
    dec l

jr_01a_44f2:
    dec l
    ld c, $00
    rrca
    cp e
    cp b
    cp h
    xor h
    ld a, [hl-]
    ld c, $00
    ld c, [hl]
    ld l, a
    ld l, $31
    ld a, [hl-]
    nop
    ld c, [hl]
    ld l, a
    ld l, $32
    ld a, [hl-]
    nop
    ld c, [hl]
    ld l, a
    ld l, $33
    ld a, [hl-]
    nop
    nop
    push de

jr_01a_4511:
    or b
    cp e
    sbc $b0
    jr nz, @+$3c

    nop
    adc $df
    or d
    db $dd
    call nz, $ba0f
    sbc $b3
    cp c
    or d
    ld a, [hl-]
    ld c, $00

Call_01a_4526:
    ld hl, $c500
    ld a, [hl+]
    or [hl]
    ret z

    ld hl, $c507
    ld a, [hl]
    inc hl
    ld e, [hl]
    inc hl
    push hl
    ld d, $00
    or a
    jr z, jr_01a_453a

    inc de

jr_01a_453a:
    ld hl, $c400
    trap $a3
    ld hl, $0d01
    trap $b8
    ld hl, $c401
    trap $69
    pop hl
    ld a, [$c502]
    ld bc, $111b
    call Call_01a_45ec
    push de
    ld a, [hl+]
    dec a
    inc hl
    bit 4, d
    jr z, jr_01a_4563

    bit 3, d
    jr z, jr_01a_4561

    sub $60

jr_01a_4561:
    sub $60

jr_01a_4563:
    ld c, a
    ld b, $00
    ld e, l
    ld d, h
    ld hl, $c400
    push hl
    push bc
    trap $02
    pop bc
    pop hl
    add hl, bc
    ld [hl], $00
    ld hl, $0400
    trap $b8
    ld hl, $c400
    trap $69
    pop de
    bit 0, d
    ret z

    call Call_01a_4934
    ld hl, $0d02
    trap $b8
    ld hl, $c400
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push hl
    ld hl, $c42e
    ld bc, $0000
    trap $a0
    ld hl, $c434
    trap $69
    pop de
    ld hl, $0505

jr_01a_45a3:
    push hl
    push de
    trap $b8
    ld hl, $c42e
    ld bc, $000a
    trap $02
    xor a
    ld [$c438], a
    ld hl, $c42e
    call Call_01a_45dd
    pop hl
    ld bc, $000a
    add hl, bc
    ld a, [hl+]
    pop de
    push de
    push hl
    ld l, e
    ld h, $0f
    ld e, a
    ld d, $00
    trap $b8
    ld hl, $c42e
    trap $a3
    ld hl, $c431
    trap $69
    pop de
    pop hl
    inc l
    ld a, l
    cp $09
    jr c, jr_01a_45a3

    ret


Call_01a_45dd:
    ldh a, [$92]
    push af
    or $40
    ldh [$92], a
    trap $69
    pop af
    and $fb
    ldh [$92], a
    ret


Call_01a_45ec:
    cp $ff
    ld d, [hl]
    inc hl
    ld a, [hl]
    inc hl
    push hl
    push de
    push bc
    jr z, jr_01a_4617

    or a
    jr z, jr_01a_4605

    ld hl, $0014
    cp [hl]
    jr z, jr_01a_4605

    ld de, $4028
    jr jr_01a_461f

jr_01a_4605:
    bit 2, d
    jr z, jr_01a_461c

    bit 1, d
    jr z, jr_01a_4612

    ld de, $4058
    jr jr_01a_461f

jr_01a_4612:
    ld de, $4048
    jr jr_01a_461f

jr_01a_4617:
    ld de, $4068
    jr jr_01a_461f

jr_01a_461c:
    ld de, $4038

jr_01a_461f:
    ld hl, $c400
    ld bc, $0010
    push hl
    trap $02
    pop hl
    ld bc, $0108
    pop de
    trap $c0
    pop de
    pop hl
    ret


Call_01a_4632:
    call Call_01a_5019
    scf
    ret nz

    call Call_01a_4764
    ld hl, $ce00
    ld de, $ce00
    ld c, $10
    call Call_01a_4370
    ld a, $03
    jp c, Jump_01a_471b

    ld hl, $401a
    ld de, $ce02
    ld bc, $000d
    trap $67
    ld a, h
    or l
    ld hl, $4d8d
    ld a, $06
    jp nz, Jump_01a_4741

    ld a, [$ce00]
    or a
    jp nz, Jump_01a_4741

    ld a, [$ce0f]
    push af
    ld a, $01
    call Call_01a_4376
    call Call_01a_4384

jr_01a_4672:
    ld hl, $4cd8
    ld de, $5a8f
    call Call_01a_508f
    call Call_01a_426d
    call Call_01a_43a8
    pop bc
    jp c, Jump_01a_469a

    push bc
    ld hl, $4dc6
    call Call_01a_4bd2
    ld de, $0c10
    call Call_01a_43e2
    jp nz, Jump_01a_4737

    call Call_01a_438a
    jr jr_01a_4672

Jump_01a_469a:
    cp $ff
    jp z, Jump_01a_471b

    push bc
    ld a, $05
    call Call_01a_4376
    call Call_01a_478a
    pop af
    ld c, a
    ld a, $ff
    ld [$c70a], a
    ld hl, $c700
    call Call_01a_43a2
    jr nc, jr_01a_46c2

    cp $ff
    jr z, jr_01a_4719

    ld hl, $4d36
    ld a, $04
    jr jr_01a_4740

jr_01a_46c2:
    push hl
    ld hl, sp+$00
    ld d, h
    ld e, l
    ld hl, $ce00
    ld c, $02
    push hl
    call Call_01a_4370
    pop hl
    pop bc
    ld a, [hl+]
    cp c
    jr nz, jr_01a_4719

    ld a, [hl]
    cp b
    jr nz, jr_01a_4719

    ld a, [$c509]
    bit 0, a
    jr z, jr_01a_4700

    ld hl, $c500
    ld de, $c600
    trap $f0
    jr c, jr_01a_4721

    ld a, b
    or c
    jr z, jr_01a_4721

    push bc
    ld de, $ffd2
    ld b, $00
    call Call_01a_439c
    pop bc
    jr c, jr_01a_4719

    call Call_01a_4393
    jr c, jr_01a_4719

jr_01a_4700:
    ld hl, $c500
    ld de, $c600
    ld bc, $0100
    trap $eb
    jr c, jr_01a_4721

    ld a, b
    or c
    jr z, jr_01a_4721

    call Call_01a_4393
    jr nc, jr_01a_4700

    call Call_01a_438a

jr_01a_4719:
    ld a, $05

Jump_01a_471b:
    ld hl, $4d5f
    scf
    jr jr_01a_4741

jr_01a_4721:
    call Call_01a_4769
    jr c, jr_01a_4719

    ld a, $02
    call Call_01a_4376
    ld hl, $4cef
    ld de, $5b4f
    xor a
    call Call_01a_4752
    xor a
    ret


Jump_01a_4737:
    call Call_01a_4358
    ld hl, $4dfa
    ld a, $07
    pop bc

jr_01a_4740:
    or a

Jump_01a_4741:
jr_01a_4741:
    push af
    jr c, jr_01a_4749

    push hl
    call Call_01a_4376
    pop hl

jr_01a_4749:
    ld de, $5c0f
    pop af
    call Call_01a_4752
    scf
    ret


Call_01a_4752:
    push af
    call Call_01a_508f
    pop af
    jr c, jr_01a_475c

    call Call_01a_4384

Call_01a_475c:
jr_01a_475c:
    xor a
    trap $cc
    ld a, $b4
    trap $dc
    ret


Call_01a_4764:
    ld a, $01
    trap $cc
    ret


Call_01a_4769:
    ld hl, $c509
    ld a, [hl+]
    push hl
    inc hl
    ld b, $00
    bit 0, a
    ld a, $fe
    jr z, jr_01a_4779

    sub $2e

jr_01a_4779:
    sub [hl]
    ld e, a
    ld a, $ff
    sbc b
    ld d, a
    call Call_01a_439c
    pop de
    ret c

    ld bc, $0001
    jp Jump_01a_4396


Call_01a_478a:
    ld hl, $c505
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld d, a
    inc hl
    ld b, [hl]
    ret


Call_01a_479d:
    ld hl, $c800
    ld bc, $0020
    ldh a, [$c0]
    ld e, a

jr_01a_47a6:
    push bc
    push de
    push hl
    trap $71
    pop hl
    pop de
    pop bc
    call Call_01a_4965
    jr nc, jr_01a_47b7

    inc e
    inc h
    jr jr_01a_47a6

jr_01a_47b7:
    ldh a, [$c1]

Call_01a_47b9:
    ld de, $0c3c
    ld h, a
    ld bc, $0000
    cp $03
    jr c, jr_01a_47ca

    ld c, $01
    ld e, $5c
    sub $03

jr_01a_47ca:
    or a
    ret z

    dec a
    jr z, jr_01a_47d4

    inc b
    ld a, d
    add $28
    ld d, a

jr_01a_47d4:
    inc b
    ld a, d
    add $28
    ld d, a
    ret


    inc b
    nop
    nop
    nop
    nop
    stop
    ld [bc], a
    nop
    nop
    jr nz, jr_01a_47f6

    nop
    db $10
    jr nz, jr_01a_47fc

    nop

Call_01a_47eb:
Jump_01a_47eb:
    ld hl, $ffc0
    ld de, $ff44
    ld bc, $0001
    trap $e5

jr_01a_47f6:
    ldh a, [$c2]
    ld c, a
    ldh a, [$c0]
    cp c

jr_01a_47fc:
    jr nz, jr_01a_480c

    ldh a, [$c3]
    call Call_01a_47b9
    ld hl, $47da
    ld a, $1c
    trap $60
    jr jr_01a_4811

jr_01a_480c:
    ld bc, $041c
    trap $c4

jr_01a_4811:
    call Call_01a_479d

Jump_01a_4814:
jr_01a_4814:
    call Call_01a_4fec
    push af
    ld a, h
    ldh [$c1], a
    pop af
    or a
    bit 0, a
    ret nz

    bit 3, a
    ret nz

    bit 1, a
    scf
    ret nz

    ld l, a
    ldh a, [$8a]
    bit 4, l
    jr nz, jr_01a_4877

    bit 6, l
    jp nz, Jump_01a_48d7

    bit 7, l
    jp nz, Jump_01a_48f2

    bit 5, l
    jr z, jr_01a_4814

    ld l, $e2
    bit 2, a
    jr nz, jr_01a_48af

    ld a, b
    or a
    jr z, jr_01a_484f

    dec b
    dec h
    ld a, d
    sub $28
    ld d, a
    jp Jump_01a_4814


jr_01a_484f:
    ld a, c
    or a
    jr z, jr_01a_485e

    ld b, $02
    ld c, $00
    dec h
    ld de, $5c3c
    jp Jump_01a_4814


jr_01a_485e:
    ld l, $05

Jump_01a_4860:
    ldh a, [$c0]
    or a
    jp z, Jump_01a_4814

    ldh a, [$c1]
    add l
    ldh [$c1], a
    ldh a, [$c0]
    sub $06
    jr nc, jr_01a_4872

    xor a

jr_01a_4872:
    ldh [$c0], a
    jp Jump_01a_47eb


jr_01a_4877:
    ld l, $1e
    bit 2, a
    jr nz, jr_01a_48af

    ld a, b
    cp $02
    jr z, jr_01a_488b

    inc h
    inc b
    ld a, d
    add $28
    ld d, a
    jp Jump_01a_4814


jr_01a_488b:
    ld a, c
    or a
    jr nz, jr_01a_489a

    ld b, $00
    ld c, $01
    inc h
    ld de, $0c5c
    jp Jump_01a_4814


jr_01a_489a:
    ld l, $05

Jump_01a_489c:
    ldh a, [$c0]
    add $06
    cp $78
    jp nc, Jump_01a_47eb

    ldh [$c0], a
    ldh a, [$c1]
    sub l
    ldh [$c1], a
    jp Jump_01a_47eb


jr_01a_48af:
    push hl
    ldh a, [$c0]
    ld e, a
    ld d, $00
    ld hl, $001e
    push hl
    trap $8a
    pop de
    trap $89
    ld a, l
    pop hl
    jr jr_01a_48c4

jr_01a_48c2:
    ldh a, [$c0]

jr_01a_48c4:
    add l
    cp $c4
    jr nc, jr_01a_48d0

    cp $78
    jr c, jr_01a_48d2

    xor a
    jr jr_01a_48d2

jr_01a_48d0:
    sub $88

jr_01a_48d2:
    ldh [$c0], a
    jp Jump_01a_47eb


Jump_01a_48d7:
    ld l, $fa
    bit 2, a
    jr nz, jr_01a_48c2

    ld a, c
    or a
    jr nz, jr_01a_48e6

    ld l, $03
    jp Jump_01a_4860


jr_01a_48e6:
    dec c
    ld a, h
    sub $03
    ld h, a
    ld a, e
    sub $20
    ld e, a
    jp Jump_01a_4814


Jump_01a_48f2:
    ld l, $06
    bit 2, a
    jr nz, jr_01a_48c2

    ld a, c
    cp $01
    jr nz, jr_01a_4902

    ld l, $03
    jp Jump_01a_489c


jr_01a_4902:
    ld a, h
    add $03
    ld h, a
    inc c
    ld a, e
    add $20
    ld e, a
    jp Jump_01a_4814


Call_01a_490e:
    push de
    ld a, h
    ld de, $c800
    add d
    ld d, a
    ld hl, $c500
    ld bc, $0100
    trap $02
    pop de
    ld a, $00
    ld hl, $0000
    ld bc, $0502
    trap $c5
    ret


Call_01a_4929:
    ld hl, $c500

Call_01a_492c:
    ld de, $ffd2
    ld b, $00
    trap $ea
    ret


Call_01a_4934:
    ld a, [$c502]
    cp $ff
    jr z, jr_01a_494a

    call Call_01a_4929
    ld hl, $c500
    ld de, $c400
    ld bc, $002e
    trap $eb
    ret


jr_01a_494a:
    ld hl, $c500
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld de, $ffd2
    add hl, de
    ld d, h
    ld e, l
    ld hl, $c400
    ld bc, $002e
    trap $02
    ret


Call_01a_4965:
    push hl
    push de
    push bc
    ld de, $c600
    trap $64
    ld hl, $c600
    pop de
    push de
    ld bc, $0418
    trap $c0
    pop bc
    pop de
    pop hl
    ld a, b
    add $05
    ld b, a
    cp $0f
    ret c

    ld b, $00
    ld a, c
    add $20
    ld c, a
    cp $60
    ret


Call_01a_498a:
    trap $e1
    ret nc

    jp Jump_01a_66ee


Call_01a_4990:
    ldh a, [$c0]
    ld c, a
    ldh a, [$c1]
    add c
    ret


Call_01a_4997:
    ld a, $a4
    ld h, $04
    ld bc, $0101
    ld de, $0e0e
    trap $b3
    ld hl, $1200
    trap $b6
    ld a, $e4
    ldh [$9d], a
    ld a, $1b
    ldh [$9e], a
    ld de, $0000
    ld bc, $1005
    trap $58
    ld a, $80
    ld hl, $0e01
    ld de, $0101
    ld bc, $0e03
    trap $59
    ld a, $83
    ld hl, $0e01
    ld de, $0105
    ld bc, $0e09
    trap $59
    ld de, $000e
    ld bc, $1004
    trap $58
    ld a, $8c
    ld hl, $0e01
    ld de, $010f
    ld bc, $0e02
    trap $59
    ld de, $5d33
    ld bc, $c400
    trap $62
    ld de, $8000
    ld bc, $0380
    trap $63
    ld a, $07
    trap $b4
    ld h, $0a
    ld d, $8c
    ld e, $14
    ld l, $14
    call Call_01a_4a28
    ld e, $2c
    ld l, $1a
    call Call_01a_4a26
    ld e, $44
    ld l, $20
    call Call_01a_4a26
    ld e, $5c
    ld l, $26
    call Call_01a_4a26
    ld e, $74
    ld l, $2c
    call Call_01a_4a26
    ld e, $8c
    ld l, $32

Call_01a_4a26:
    ld h, $ff

Call_01a_4a28:
    ld b, $00

Call_01a_4a2a:
    push de
    push hl
    ld a, h
    ld h, b
    ld bc, $0301
    trap $c5
    pop hl
    pop de
    ret


Call_01a_4a36:
    push bc
    push de
    push hl
    push af
    push af
    ld hl, $c400
    ld e, $00
    ld bc, $0011
    trap $a6
    ld hl, $0060
    trap $bd
    pop af
    ld hl, $c800
    add h
    ld h, a
    push hl
    ld a, [hl+]
    or [hl]
    jr z, jr_01a_4a7c

    ld de, $0008
    add hl, de
    ld b, [hl]
    inc hl
    inc hl
    ld a, [hl]
    inc hl
    inc hl
    bit 4, b
    jr z, jr_01a_4a6b

    sub $60
    bit 3, b
    jr z, jr_01a_4a6b

    sub $60

jr_01a_4a6b:
    dec a
    cp $10
    jr c, jr_01a_4a72

    ld a, $10

jr_01a_4a72:
    ld c, a
    ld b, $00
    ld e, l
    ld d, h
    ld hl, $c400
    trap $02

jr_01a_4a7c:
    ld hl, $c400
    trap $69
    ld a, $0e
    trap $b9
    ld a, $0e
    trap $c8
    ld hl, $0068
    trap $bd
    pop hl
    ld a, [hl+]
    or [hl]
    jr z, jr_01a_4aa3

    push af
    push hl
    inc hl
    ld a, [hl]
    ld de, $0007
    add hl, de
    ld bc, $0d60
    call Call_01a_45ec
    pop hl
    pop af

jr_01a_4aa3:
    ld bc, $0007
    add hl, bc
    ld e, [hl]
    inc e
    or a
    jr nz, jr_01a_4aad

    ld e, a

jr_01a_4aad:
    call Call_01a_4b45
    ld hl, $4ac2
    trap $69
    ldh a, [$c0]
    pop de
    add d
    ld e, a
    inc e
    call Call_01a_4b45
    pop hl
    pop de
    pop bc
    ret


    or h
    ret c

    or c
    jr nz, @+$22

    ld c, [hl]
    ld l, a
    ld l, $00

Call_01a_4acb:
Jump_01a_4acb:
    ld de, $8c14
    ld hl, $0a14
    ld c, $00

Jump_01a_4ad3:
    ld a, c
    call Call_01a_4b88

jr_01a_4ad7:
    push bc
    ld b, $10
    call Call_01a_4a2a
    call Call_01a_44a1
    jr nz, jr_01a_4aec

    call Call_01a_4a28
    call Call_01a_44a1
    pop bc
    jr z, jr_01a_4ad7

    push bc

jr_01a_4aec:
    push af
    call Call_01a_4a28
    pop af
    pop bc
    ld b, a
    and $03
    ret nz

    bit 6, b
    jr nz, jr_01a_4b1f

    bit 7, b
    jr z, jr_01a_4ad7

    ld a, c
    cp $05
    jp z, Jump_01a_4acb

    inc c
    ld a, e
    add $18
    ld e, a
    ld a, h
    add $03
    ld h, a
    ld a, l
    add $06
    ld l, a
    jp Jump_01a_4ad3


jr_01a_4b14:
    ld c, $05
    ld de, $8c8c
    ld hl, $1932
    jp Jump_01a_4ad3


jr_01a_4b1f:
    ld a, c
    or a
    jr z, jr_01a_4b14

    dec c
    ld a, e
    sub $18
    ld e, a
    ld a, h
    sub $03
    ld h, a
    ld a, l
    sub $06
    ld l, a
    jp Jump_01a_4ad3


Call_01a_4b33:
    call Call_01a_4997

Call_01a_4b36:
    ld hl, $4f3b
    call Call_01a_4bd2
    ld hl, $090e
    trap $bd
    xor a
    trap $f1
    ld e, c

Call_01a_4b45:
    ld d, $00
    ld hl, $c400
    trap $a3
    ld hl, $c403
    trap $69
    ret


Call_01a_4b52:
    ld a, $01
    trap $f1
    ld a, b
    or a
    ret z

    ld a, e
    cp $20
    ccf
    ret


Call_01a_4b5e:
    ld hl, $0000
    trap $bd
    call Call_01a_4b52
    jr nc, jr_01a_4b6d

    ld a, $10
    trap $c8
    ret


jr_01a_4b6d:
    ld e, a
    ld d, $00
    push af
    ld hl, $c400
    trap $a3
    pop af
    ld hl, $4c8a
    or a
    jr z, jr_01a_4b85

    ld hl, $c404
    trap $69
    ld hl, $4c77

jr_01a_4b85:
    trap $69
    ret


Call_01a_4b88:
    push bc
    push de
    push hl
    ld l, a
    ld h, $00
    add hl, hl
    ld de, $4bf6
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call Call_01a_4bd2
    pop hl
    pop de
    pop bc
    ret


Call_01a_4b9d:
    push hl
    ld h, $00
    ld l, a
    trap $bd
    pop hl
    ret


jr_01a_4ba5:
    push hl
    ld hl, $4c15
    call Call_01a_4bd2
    ld a, $10
    call Call_01a_4b9d
    ld a, $20
    trap $bb
    trap $69
    pop hl
    jr jr_01a_4be1

jr_01a_4bba:
    ld a, [hl+]
    push hl
    ld h, [hl]
    ld l, a
    trap $69
    pop hl
    inc hl
    jr jr_01a_4be1

jr_01a_4bc4:
    push hl
    ld hl, $4c02
    call Call_01a_4bd2
    pop hl
    jr jr_01a_4bd2

jr_01a_4bce:
    ld a, $0e
    trap $b9

Call_01a_4bd2:
jr_01a_4bd2:
    ld a, [hl+]
    cp $ff
    ret z

    cp $fe
    jr z, jr_01a_4bc4

    cp $fd
    jr z, jr_01a_4ba5

    call Call_01a_4b9d

jr_01a_4be1:
    ld a, [hl+]
    or a
    jr z, jr_01a_4bce

    cp $fc
    jr z, jr_01a_4bba

    sub $e0
    jr c, jr_01a_4bf1

    trap $c8
    jr jr_01a_4be1

jr_01a_4bf1:
    dec hl
    trap $69
    jr jr_01a_4be1

    jr z, jr_01a_4c46

    ld b, h
    ld c, [hl]
    ld h, l
    ld c, [hl]
    sbc e
    ld c, [hl]
    cp c
    ld c, [hl]
    rst $28
    ld c, [hl]
    nop
    jr nz, jr_01a_4c25

    jr nz, @+$11

    cp d
    ret


    nop
    db $fc
    ld h, $4c
    jp z, $ee00

    nop
    ld [$00ee], sp
    rst $38
    ld [$200f], sp
    jr nz, jr_01a_4c3a

    cp [hl]
    db $dd
    ret nz

    cp b
    cp h
    jp $d9b2


    nop
    xor $00

jr_01a_4c25:
    rst $38
    ld c, $cc
    and a
    or d

jr_01a_4c2a:
    reti


    rrca
    nop
    jp $b7de


    trap $be
    db $dd
    nop
    rrca
    jp z, $20b2

    or d
    or d

jr_01a_4c3a:
    or h
    nop
    ld c, $b9
    sbc $b0
    pop de
    adc $de
    or b
    or d
    rrca

jr_01a_4c46:
    nop
    adc $de
    ret nz

    db $dd
    rrca
    and [hl]
    jr nz, @-$49

    cp h
    jp $c0b8


    sbc $bb
    or d
    nop
    rrca
    or c
    or a
    ld c, $b4
    ret c

    or c
    rrca
    cp l
    or e
    or [hl]
    sbc $c0
    ret c

    trap $be
    db $dd
    nop
    rrca

jr_01a_4c6a:
    or c
    or a
    ld c, $b4
    ret c

    or c
    rrca
    and [hl]
    jr nz, jr_01a_4c2a

    cp b
    adc $00
    or h
    ret c

    or c
    rrca
    trap $c3
    sbc $bc
    sbc $ad

jr_01a_4c81:
    cp h
    db $dd
    or [hl]
    ret


    or e
    jp $bdde


    nop
    rrca
    cp h
    sbc $ad
    cp h
    db $dd
    ld c, $b4
    ret c

    or c
    rrca
    or [hl]
    sbc $20
    or c
    or d
    jp $cfb2


    cp [hl]
    db $dd
    nop
    ld [$c20f], sp
    or e
    cp h
    db $dd
    and [hl]
    jr nz, jr_01a_4c6a

    xor l
    or e
    cp h
    cp l
    reti


jr_01a_4cae:
    jp z, $b1de

    or d
    jp z, RST_00

    db $10
    ld b, d
    nop
    db $fc
    ld b, a
    ld c, h
    ldh a, [rP1]
    rst $38
    ld [$3cfc], sp
    ld c, h
    call nz, $b3de
    cp h
    and [hl]
    jr nz, jr_01a_4c81

    xor a
    jp nz, $c3b9

    nop
    nop
    db $10
    ld b, c
    nop
    db $fc
    ld b, a
    ld c, h
    ldh a, [rP1]
    rst $38
    nop
    ldh a, [rP1]

jr_01a_4cdb:
    ld [$26fc], sp
    ld c, h
    and [hl]
    jr nz, @-$49

    cp b
    xor a
    jp $cfb2


    cp l
    nop
    ldh a, [rP1]
    db $10
    ldh a, [rP1]
    rst $38
    nop
    ldh a, [rP1]
    ld [$26fc], sp
    ld c, h
    and [hl]
    jr nz, jr_01a_4cae

    cp b
    ret c

    trap $bc
    ret nz

    ld hl, $f000
    nop
    db $10
    ldh a, [rP1]
    rst $38
    nop
    ldh a, [rP1]
    ld [$26fc], sp
    ld c, h
    and [hl]
    jr nz, @-$4b

    cp c
    call nz, $c3af
    or d
    trap $bd
    nop
    ldh a, [rP1]
    db $10
    ldh a, [rP1]
    rst $38
    nop
    ldh a, [rP1]
    ld [$26fc], sp

jr_01a_4d24:
    ld c, h
    and [hl]
    jr nz, jr_01a_4cdb

    cp c
    call nz, $cfd8
    cp h
    ret nz

    ld hl, $f000
    nop
    db $10
    ldh a, [rP1]
    rst $38
    nop
    rrca
    or c
    or d
    jp Jump_000_00c9


    db $fc
    inc a
    ld c, h
    ret


    nop
    ldh a, [rP1]
    ld [$57fc], sp
    ld c, h
    ldh a, [rP1]
    db $10
    rrca
    or [hl]
    cp b
    adc $bc
    jp $d320


    pushx @ + $c3af
    cp b
    ret nz

    sbc $bb
    or d
    nop
    ldh a, [rP1]
    rst $38
    nop
    rrca
    jp nz, $bcb3

    db $dd
    and [hl]
    jr nz, jr_01a_4d24

    xor a
    jp z, $b2df

    cp h
    trap $bc
    ret nz

    nop
    ldh a, [rP1]
    ld [$00f0], sp
    db $10
    rrca

jr_01a_4d78:
    db $d3
    or e
    or d
    pop bc
    call nz, $d4de
    ret c

    push bc
    or l
    cp h
    jp $c0b8


    sbc $bb
    or d
    jr nz, jr_01a_4d8b

jr_01a_4d8b:
    nop
    rst $38
    nop
    rrca
    or c
    or d
    jp Jump_000_00c9


    db $fc
    inc a
    ld c, h
    or [hl]
    sbc $00
    ldh a, [rP1]
    ld [$4247], sp
    jr nz, @+$4d

    ld c, c
    ld d, e
    ld d, e
    jr nz, jr_01a_4d78

    add $ad
    or b
    rrca
    ret


    nop
    ldh a, [rP1]
    db $10
    rrca
    cp h
    sbc $ad
    cp h
    db $dd
    cp h
    sbc $ae
    or e
    ret nz

    or d
    jp $b1de


    ret c

    trap $be
    db $dd
    jr nz, jr_01a_4dc4

jr_01a_4dc4:
    nop
    rst $38
    nop
    rrca
    or c
    or d
    jp $20c6


    or l
    push bc
    cp h
    sbc $00
    db $fc
    ld h, $4c
    or [hl]
    sbc $00
    ldh a, [rP1]
    ld [$bf0f], sp
    db $dd
    cp e
    sbc $b2
    cp h
    trap $bd
    nop
    ldh a, [rP1]
    db $10
    rrca
    or e

jr_01a_4dea:
    call c, $deb6
    or a
    cp h
    trap $bd
    or [hl]
    ccf
    nop
    db $fc
    inc [hl]
    ld c, h
    ldh a, [rP1]
    rst $38
    db $10
    ldh a, [rP1]
    rst $38
    nop
    db $fc
    ld d, a
    ld c, h
    ldh a, [rP1]
    ld [$b20f], sp
    cp b
    jp nz, Jump_000_00b6

    db $fc
    ld h, $4c
    rrca
    and [hl]
    cp e
    cp b
    cp h
    sbc $ae
    cp h
    jp $f000


    nop
    db $10
    db $fc
    ld l, c
    ld c, h
    cp h
    jp $c0b8


    sbc $bb
    or d
    nop
    nop
    rst $38
    nop
    db $e3
    inc a
    jr nz, jr_01a_4dea

    ret nz

    or b
    call nz, $3e20
    nop
    xor $00
    db $fd
    and [hl]
    cp h
    sbc $af
    cp d
    or e
    cp h
    trap $bd
    jr nz, jr_01a_4e4f

    nop
    nop
    rst $38
    nop
    jr nz, @+$3e

    nop
    db $fc
    ld h, $4c
    jr nz, @-$42

    sbc $ae

jr_01a_4e4f:
    or e
    adc $b3
    ld a, $20
    nop
    nop
    db $fd
    ret


    cp h
    sbc $ae
    or e
    adc $b3
    jp $bdde


    jr nz, jr_01a_4e63

jr_01a_4e63:
    nop
    rst $38
    nop
    jr nz, jr_01a_4ea4

    jr nz, jr_01a_4e6a

jr_01a_4e6a:
    db $fc
    ld h, $4c
    or d
    jp c, $b4b6

    jr nz, jr_01a_4eb1

    jr nz, jr_01a_4e75

jr_01a_4e75:
    nop
    ld [$200f], sp
    cp [hl]
    db $dd
    ret nz

    cp b
    cp h
    ret nz

    jr nz, jr_01a_4e81

jr_01a_4e81:
    db $fc
    ld h, $4c
    call nz, RST_20
    nop
    db $10
    rrca
    jr nz, jr_01a_4eac

    jp z, $bcde

    xor [hl]
    and [hl]
    or d
    jp c, $b4b6

    trap $bd
    nop
    xor $00
    rst $38
    nop
    jr nz, @+$3e

    jr nz, jr_01a_4ea0

jr_01a_4ea0:
    db $fc
    ld h, $4c
    cp a

jr_01a_4ea4:
    or e
    cp h
    db $dd
    jr nz, jr_01a_4ee7

    jr nz, jr_01a_4eab

jr_01a_4eab:
    nop

jr_01a_4eac:
    db $fd
    and [hl]
    cp a
    or e
    cp h

jr_01a_4eb1:
    db $dd
    cp h
    trap $bd
    jr nz, jr_01a_4eb7

jr_01a_4eb7:
    nop
    rst $38
    nop
    jr nz, jr_01a_4ef8

    jr nz, jr_01a_4ebe

jr_01a_4ebe:
    db $fc
    ld h, $4c
    cp h
    sbc $ad
    cp h
    db $dd
    jr nz, jr_01a_4f06

    jr nz, jr_01a_4eca

jr_01a_4eca:
    nop
    ld [$200f], sp
    jr nz, jr_01a_4ef0

    cp [hl]
    db $dd
    ret nz

    cp b
    call z, $ccde
    sbc $dd
    add $00
    xor $00
    db $10
    jr nz, jr_01a_4ee0

jr_01a_4ee0:
    db $fc

jr_01a_4ee1:
    ld h, $4c
    and [hl]
    jr nz, @-$4b

    cp c

jr_01a_4ee7:
    call nz, $cfd8
    cp l
    jr nz, jr_01a_4eed

jr_01a_4eed:
    nop
    rst $38
    nop

jr_01a_4ef0:
    jr nz, jr_01a_4f2e

    jr nz, jr_01a_4ef4

jr_01a_4ef4:
    db $fc
    ld h, $4c
    cp e

jr_01a_4ef8:
    cp b
    cp h
    sbc $ae
    jr nz, jr_01a_4f3c

    jr nz, jr_01a_4f00

jr_01a_4f00:
    nop
    db $fd
    and [hl]
    cp e
    cp b
    cp h

jr_01a_4f06:
    sbc $ae
    cp h
    trap $bd
    jr nz, jr_01a_4f0d

jr_01a_4f0d:
    nop
    rst $38
    nop
    rrca
    jr nz, jr_01a_4ee1

    db $dd
    call nz, $c6b3
    cp e
    cp b
    cp h
    sbc $ae

jr_01a_4f1c:
    cp h

jr_01a_4f1d:
    jp $ee00


    nop

jr_01a_4f21:
    ld [$2ffc], sp
    ld c, a
    xor $00
    db $10
    db $e4
    db $fc
    inc [hl]
    ld c, h
    xor $00

jr_01a_4f2e:
    rst $38
    jr nz, @+$11

    sub $db
    cp h
    or d
    jp $bdde


    or [hl]
    ccf
    nop
    nop

jr_01a_4f3c:
    xor $00
    ld [$00ee], sp
    db $10
    xor $00
    ld [bc], a
    jr nz, @+$49

    ld b, d
    jr nz, jr_01a_4f95

    ld c, c
    ld d, e
    ld d, e
    jr nz, jr_01a_4f21

    add $ad
    or b
    nop
    nop
    ld c, $0f
    jr nz, jr_01a_4f1c

    or e
    db $db
    cp b
    nop
    db $fc
    ld h, $4c
    jr nz, jr_01a_4f81

    jr nz, jr_01a_4f1d

    nop
    nop
    rst $38
    cp $10
    ld [c], a
    rrca
    cp e
    cp b
    cp h
    sbc $ae
    nop
    db $fc
    dec l
    ld c, h
    xor $00
    rst $38
    cp $10
    ld [c], a
    rrca
    cp a
    or e
    cp h
    db $dd
    nop
    db $fc
    dec l

jr_01a_4f81:
    ld c, h
    xor $00
    rst $38
    nop
    rrca
    jr nz, jr_01a_4fa9

    cp d
    ret


    nop
    db $fc
    ld h, $4c
    and [hl]
    cp c
    cp h
    jp $ee00


jr_01a_4f95:
    nop
    ld [$200f], sp
    cp d
    cp d
    add $bc
    sbc $ad
    cp h
    db $dd
    cp h
    trap $bd
    or [hl]
    ccf
    nop
    xor $00

jr_01a_4fa9:
    db $10
    db $e4
    db $fc
    inc [hl]
    ld c, h
    xor $00
    rst $38
    cp $10
    ld [c], a
    rrca
    cp h
    sbc $af
    cp d
    or e
    nop
    db $fc
    dec l
    ld c, h
    xor $00
    rst $38
    nop
    rrca
    push bc
    or d
    call z, $0ede
    jp $b0de


    ret nz

    rrca
    ret


    jr nz, jr_01a_4f95

    pushx @ + $decd
    or [hl]
    or h
    jp Jump_000_00de


    nop
    ld [$69fc], sp
    ld c, h
    cp h
    trap $bd
    jr nz, jr_01a_4fe2

jr_01a_4fe2:
    nop
    db $10
    db $fc
    jr nc, jr_01a_5036

    db $fc
    inc [hl]
    ld c, h
    nop
    rst $38

Call_01a_4fec:
    push bc
    push de
    push hl
    ld a, h
    call Call_01a_4a36

jr_01a_4ff3:
    ld h, $00
    push de
    push hl
    ld a, $00
    ld l, $00
    ld bc, $0502
    trap $c5
    call Call_01a_44a1
    jr nz, jr_01a_5013

    ld bc, $0a00
    trap $c4
    call Call_01a_44a1
    jr nz, jr_01a_5013

    pop hl
    pop de
    jr jr_01a_4ff3

jr_01a_5013:
    pop hl
    pop de
    pop hl
    pop de
    pop bc
    ret


Call_01a_5019:
    ld hl, $4cbe
    call Call_01a_5033

Call_01a_501f:
jr_01a_501f:
    trap $b1
    trap $d8
    and $03
    jr z, jr_01a_501f

    and $02
    ret nz

    push af
    ld hl, $4ca0
    call Call_01a_4bd2
    pop af
    ret


Call_01a_5033:
    push hl
    ld a, $a4

jr_01a_5036:
    ld h, $00
    ld bc, $0e02
    ld de, $0310
    trap $b3
    ld hl, $9800
    ld bc, $0240
    ld e, $04
    trap $a6
    ld a, $ca
    ld bc, $0e02
    ld de, $0310
    trap $c9
    ld de, $50b2
    ld bc, $c400
    trap $62
    ld de, $9000
    ld bc, $0800
    trap $63
    ld de, $8800
    ld bc, $0470
    trap $63
    ld hl, $8c70
    ld bc, $0390
    ld e, $00
    trap $a6
    ld hl, $99a0
    ld de, $5ccf
    ld b, $05
    ld c, $14
    call Call_01a_509b
    pop hl
    ld de, $59cf
    call Call_01a_508f
    ld a, $01
    trap $b4
    ret


Call_01a_508f:
    push de
    call Call_01a_4bd2
    pop de
    ld hl, $9802
    ld b, $0c
    ld c, $10

Call_01a_509b:
jr_01a_509b:
    push bc
    push hl
    push de
    ld b, $00
    push bc
    trap $02
    pop bc
    pop hl
    add hl, bc
    ld e, l
    ld d, h
    pop hl
    ld bc, $0020
    add hl, bc
    pop bc
    dec b
    jr nz, jr_01a_509b

    ret


    ld a, a
    xor $44
    rra
    nop
    jr nc, jr_01a_50b9

jr_01a_50b9:
    jr z, jr_01a_50c2

    inc hl
    add sp, $0f
    inc h
    inc c
    xor $ff

jr_01a_50c2:
    ld bc, $0a30
    db $ed
    ld h, b
    rst $38
    ld hl, sp+$00
    inc b
    inc c
    inc [hl]
    call z, $ecc4
    jp Jump_000_2c04


    db $fd
    rra
    trap $de
    xor $10
    inc hl
    ld hl, $07ff
    ld b, $01
    ld bc, $2727
    ld h, h
    ld h, h
    ccf
    ld c, c
    xor $22
    ret nz

    ldh [rNR41], a
    jr nz, jr_01a_514d

    ld b, b
    db $fd
    pop hl
    ldh a, [$91]
    sub c
    pop af
    pop af
    xor $44
    rst $28
    ld b, h
    call nz, Call_000_0a44
    nop
    add b
    add b
    cp a
    cp a
    ld [hl], $69
    xor $20
    ld [bc], a
    ld [bc], a
    ld b, a
    call nz, Call_01a_73c4
    nop
    rra
    ld l, c
    ld b, a
    ld [bc], a
    xor $28
    jr z, jr_01a_5193

    ld a, a
    ret z

    ld sp, hl
    ret z

    ld a, [hl]
    ld a, [hl]
    ld c, b
    ld c, b
    adc c
    ld [bc], a
    xor $04
    rst $38
    inc b

jr_01a_5122:
    dec b
    rlca
    inc c
    ld [$0b0b], sp
    add hl, de
    inc a
    sbc e
    ld [de], a
    xor $90
    sub b

jr_01a_512f:
    db $fc
    db $fc
    and e
    jr nz, jr_01a_5122

    adc a
    db $fc
    dec d
    inc bc
    ld [hl], b
    ld [hl], e
    ld bc, $5f7f
    ld [hl], d
    ld h, d
    sbc [hl]
    ld b, d
    cp e
    db $ed
    ld h, d
    pop af
    pop hl
    jr nc, @+$12

    jp z, $ee7f

    ld b, h
    ccf

jr_01a_514d:
    rra
    rst $30
    db $e3
    ld e, $0c
    ld a, [hl-]
    db $ed
    ld [de], a
    ld h, c
    ld hl, $c70d
    rst $00
    ld l, [hl]
    nop
    add c
    ldh [$80], a
    ld b, e
    ld b, c
    ld [hl], e
    dec c
    jr nz, jr_01a_512f

    ld a, [bc]
    nop
    jp z, $f8fc

    ldh a, [$3c]
    jr jr_01a_518a

    inc d
    dec e
    inc c
    rst $38
    rst $00
    inc h
    inc h
    ld c, c
    nop
    rrca
    rrca
    inc b
    jr c, jr_01a_51ac

    ld e, a
    or [hl]
    ld c, a
    sbc a
    ldh a, [$f0]
    and e
    nop
    and b
    or b
    cp a
    ld [$0221], sp

jr_01a_518a:
    cp a
    ld l, e
    jr nz, @+$6d

    and b
    dec [hl]
    db $10
    ld l, e
    cp a

jr_01a_5193:
    jr nz, @+$01

    add e
    add d
    ld b, $04
    nop
    add b
    add a
    add a
    inc c
    ld l, c
    ld l, l
    ld b, b
    adc e
    add l
    nop
    jr nz, jr_01a_51c6

    ld h, a
    ld d, e
    nop
    ld a, [bc]
    ld d, e
    cp a

jr_01a_51ac:
    jr nz, @-$65

    sbc c
    ld bc, $630d
    add hl, bc
    ld h, a

jr_01a_51b4:
    ld [de], a
    inc c
    cp a
    rrca
    nop
    and l
    ld l, a
    ld b, d
    jr z, jr_01a_51ea

    cp a
    cp e
    nop
    ld h, b
    ld d, c
    ld [bc], a
    ld b, d
    or e

jr_01a_51c6:
    ld h, $ed
    add hl, hl
    dec d
    adc $bf
    ld hl, $60df
    ld b, b
    and b
    ld h, b
    add hl, sp
    jr nc, @+$21

    rrca
    ld a, e
    cp a
    ld b, b
    inc bc
    ld [bc], a
    ld bc, $9701
    ret nz

    ret nz

    ccf
    ld c, d
    ld sp, $3497
    inc h
    db $ec
    call nz, Call_000_0808

jr_01a_51ea:
    rst $30
    jr nc, jr_01a_51fd

    ld h, b

jr_01a_51ee:
    ld h, b
    sub a
    ld b, b
    inc h
    inc c
    jr z, jr_01a_51ee

    rlca
    jr z, jr_01a_51f8

jr_01a_51f8:
    jr nz, jr_01a_5219

    sub $95
    ld [hl], d

jr_01a_51fd:
    rst $38
    rrca
    rst $18
    ld d, l
    inc b
    sub a
    dec c
    ld d, $cc
    inc b
    inc e
    inc c
    rst $28
    db $fc
    ld hl, sp-$08
    sub a
    jr c, jr_01a_5248

    ld b, h
    ld b, h
    inc a
    ld a, a
    nop
    ld a, a
    add hl, sp
    add hl, sp
    rlca

jr_01a_5219:
    rlca
    or c
    jr nz, jr_01a_51b4

    ldh a, [rNR32]
    inc e
    ld h, e
    ld h, e
    ld b, a
    ld h, $47
    sub a
    jr nz, jr_01a_526f

    ccf
    and b
    ld b, $57
    ld c, $0e
    ld de, $2111
    ld hl, $46cf
    ld b, [hl]

jr_01a_5235:
    rst $30
    inc b
    dec e
    inc bc
    inc bc
    inc b
    inc b
    ld [hl], c
    ld h, a
    ld bc, $1212
    inc d
    ld c, e
    or c
    nop
    xor a
    ld b, $ff

jr_01a_5248:
    dec b
    ld c, $09
    inc c
    dec bc
    jr jr_01a_5266

    add hl, de
    rst $28
    rla
    ld sp, $172f
    ld [$60e0], sp
    ld a, b
    sbc b
    rst $38
    inc e
    db $e4
    ld c, a
    di
    or e
    cp h
    inc c
    rrca
    trap $02
    inc bc

jr_01a_5266:
    sub l

Jump_01a_5267:
    or l
    ld [$30f0], sp
    jr c, jr_01a_5235

    inc sp
    sub l

jr_01a_526f:
    ld b, c
    jr nz, @+$11

    inc c
    ld sp, hl

jr_01a_5274:
    or c
    nop

jr_01a_5276:
    rlca
    ld b, $ff
    ld e, $19
    ld a, b
    ld h, a
    di
    adc a
    call z, $df3c
    jr nc, jr_01a_5274

    or l
    ldh [rNR41], a
    ldh a, [rNR10]
    jr nc, @+$01

    ret nc

    jr jr_01a_5276

    sbc b
    add sp, -$74
    db $f4
    ld c, h
    cp a
    ld [hl], h
    daa
    ld [hl+], a
    and b
    and b
    sub b
    sub b
    ld a, [hl]
    ld a, [hl]
    db $fc
    db $10
    db $10
    ld [$0f08], sp
    rrca
    dec hl
    add hl, hl
    ld [bc], a
    ld a, [hl]
    add hl, hl
    ld [hl+], a
    ld [hl+], a
    ld c, c
    ld c, c
    add l
    add l
    ld b, e
    nop
    trap $0c
    inc c
    cp c
    dec hl
    jr nz, jr_01a_52e0

    jr z, jr_01a_52e1

    daa
    inc bc
    scf
    ld a, c
    nop
    dec hl
    cp c
    nop
    cp c
    dec [hl]
    nop
    pop hl
    pop hl
    rst $38
    inc de
    ld [de], a
    rla
    inc d

jr_01a_52cc:
    ld [hl-], a
    ld l, $62
    ld e, [hl]
    rst $38
    db $e4
    sbc h
    ret z

    cp b

jr_01a_52d5:
    adc c
    ld a, c
    sub e
    ld [hl], e
    di
    ld d, $f6
    inc l
    db $ec
    ld c, a
    add e

jr_01a_52e0:
    nop

jr_01a_52e1:
    inc a
    inc a
    ld a, [$e2e2]
    add d
    add d
    ld [bc], a
    ld d, d
    ld b, $45
    nop
    rst $38
    sbc [hl]
    and $67
    ld a, c
    add hl, de
    ld e, $04
    rlca
    rlca
    ld b, e
    add e
    jr nz, jr_01a_52cc

    add e
    ld [bc], a
    ld e, a
    ld [hl], b
    sub b
    inc a
    cp $cc
    adc $f2
    ld h, $3a
    ld c, [hl]
    ld [hl], d
    add e
    ld [hl+], a
    inc sp
    sub c
    ld d, l
    nop
    inc e
    inc de
    ld e, l
    ld e, l
    nop
    inc a
    inc sp
    rst $38
    ld a, c
    ld b, a
    and $9e
    sbc b
    ld a, b
    ld h, b
    ldh [$03], a
    ld a, c
    ld [hl], l
    ld b, b
    rlca
    dec c
    nop
    dec c
    cp e
    nop
    jr jr_01a_5343

    rst $38
    jr c, @+$3a

    ld l, h
    ld l, h
    ld h, [hl]
    ld a, d
    daa
    add hl, sp
    db $fc
    inc de
    dec e
    ld de, $091e
    ld c, $bc
    dec d
    nop
    trap $02
    inc bc
    cp h
    ld l, a

jr_01a_5343:
    jr nz, jr_01a_52d5

    sbc a
    and b
    cp a
    rst $38
    pop hl
    ld a, a
    pop hl
    ccf

jr_01a_534d:
    ld h, d
    cp [hl]
    ld b, l
    push bc
    jr nc, jr_01a_53d2

    call $8900
    adc c
    rlca
    add hl, de
    jr nz, @+$1b

    cp c
    nop
    jp $1c1c


    cp c
    cp l

jr_01a_5362:
    ld [bc], a
    ld l, c
    rla
    jr nz, jr_01a_534d

    push hl
    rst $38
    inc l
    dec hl
    ld a, [hl]
    ld a, c
    rst $38
    ldh a, [$3f]
    ldh [rIE], a
    ld a, a
    ldh [rIE], a
    ret nz

    ld a, a
    ld b, e
    jr z, jr_01a_5362

    cp a
    ld b, d
    ldh [$e2], a
    ld [de], a
    ldh a, [$cc]
    inc a
    di
    ld sp, hl
    rrca

jr_01a_5385:
    db $fc
    inc bc
    cp $01
    pop de
    nop
    ld d, a
    sbc b
    ei
    jr jr_01a_53a0

    sub b
    and b
    nop
    db $dd
    nop
    ret c

    ret c

    rst $38
    ld h, [hl]
    add $14
    inc d
    inc h
    inc h
    ld c, l
    ld c, l

jr_01a_53a0:
    rst $38
    ld c, c
    ld c, c
    sbc d
    sbc e
    ld [de], a
    inc de
    inc [hl]
    scf
    rst $38
    jr z, @+$31

    adc h
    db $f4
    sbc b
    add sp, $18
    add sp, -$21
    jr nc, jr_01a_5385

    push hl
    ld h, b
    and b
    ldh [rNR41], a
    ret nz

    cp $40
    add hl, de
    rla
    jr jr_01a_53d8

    inc c
    dec bc
    di
    nop
    db $fc
    ld b, $05
    rlca
    inc b
    inc bc
    ld [bc], a
    inc sp
    ld e, e
    nop
    rst $38
    adc a
    adc a

jr_01a_53d2:
    add [hl]
    add [hl]
    ld b, d
    jp nz, $c343

jr_01a_53d8:
    rst $38
    ld hl, $30e1
    ldh a, [$90]
    ld [hl], b
    ld b, h
    ld b, h
    rst $20
    ld b, $06
    ld [bc], a
    db $fc
    ld sp, $8010
    add b
    adc b
    rst $20
    adc b
    ld sp, $6d31
    inc sp
    nop
    ld b, c
    ld bc, $fd02
    ld b, e
    inc c
    rrca
    inc sp
    inc a
    trap $a6
    ret nz

    rst $28
    ld [hl], h
    sbc h
    ld a, b
    ld b, l
    nop
    adc b
    ld hl, sp+$08
    db $fc
    db $ec
    inc b
    cp $02
    add hl, sp
    rst $38
    ld [hl], c
    adc d
    jr nz, jr_01a_5433

    ld b, $fb
    nop
    ei
    ld sp, hl
    nop
    ld sp, hl
    ld [hl], d
    ld bc, $8fff
    ld c, a
    ld a, [$ff07]
    ld b, $ff
    nop
    ld d, a
    ld [hl], c
    add b
    ld h, c
    ld a, [hl]
    ld e, b
    ld [hl], b
    db $e4
    ld d, h
    cp $3e
    ld sp, hl
    rlca
    cp e
    ld a, a

jr_01a_5433:
    ld d, a
    ld d, c
    ldh [$09], a
    ld c, $11
    ld e, $f3
    db $fd
    rst $30
    ld h, e
    db $fd
    ld c, $f2
    add hl, sp
    ld b, $fa
    ld c, $01
    add hl, de
    nop
    add hl, de
    ccf
    ld h, $93
    ld hl, $930a
    ccf
    nop
    adc b
    rst $38
    ld a, b
    ret z

    cp b
    call nz, $65bc
    ld e, l
    ld [hl], e
    rst $38
    ld c, a
    ld [hl], b
    ld l, a
    ld e, e
    ld [hl], h
    ld e, a
    ld [hl], b
    ld b, $fe
    rlca
    add hl, de
    ld e, $67
    ld a, b
    sbc a
    ldh [$2d], a
    ld h, c
    ld d, a
    inc [hl]
    ld h, b
    ld a, a
    ld h, h
    halt
    ld [bc], a
    sub $58
    dec h
    ld [hl], c
    jp Jump_01a_70ff


    ld e, a
    ld h, h
    jr nc, jr_01a_54bf

    adc a
    ld h, $c0
    ld b, b
    ld h, e
    push af
    rlca
    ld b, $9f
    and b
    ld hl, $3157
    ret nz

    ld a, a
    rst $38
    ld [hl], b
    ld c, a
    ld a, h
    add a
    cp $89
    ld sp, hl
    ld [$f8bc], sp
    ld h, c
    ld b, b
    rst $38
    db $10
    rst $38
    ld c, [hl]
    inc bc
    ld e, [hl]
    pop af
    ld a, a
    ld h, b
    rst $38
    rst $20
    cpl
    db $10
    ld d, h
    ld e, b
    ld [hl], b
    ei
    rst $38
    rrca
    push af
    dec e
    ld sp, hl
    add hl, de
    db $e4
    inc h
    ld sp, hl
    cp $39
    ret nc

    ld d, b
    adc b
    adc b
    add a
    add a
    sbc e

jr_01a_54bf:
    rst $30
    db $fc
    db $fc
    ld [bc], a
    ld [bc], a
    ld bc, $c100
    pop bc
    ld hl, $21e7
    ld [hl+], a
    ld [hl+], a
    ld d, c
    sbc e
    nop
    ccf
    ccf
    ld b, b
    cp a
    ld b, b
    ld a, [c]
    add e
    add e
    add h
    add h
    ld b, h
    ld b, h
    ld a, a
    ld h, c
    nop
    trap $f8
    xor a
    cp b
    sbc a
    sbc h
    rrca
    rst $38
    inc c
    sbc a
    sbc [hl]
    add hl, bc
    add hl, bc

jr_01a_54ec:
    ld de, $e011
    rst $30
    ldh [rIE], a
    ld a, b
    rst $38
    ld e, $f0
    rst $38
    jr nc, jr_01a_5509

    dec [hl]
    ld d, d
    ld [$010e], a
    ld [bc], a

jr_01a_54ff:
    dec h
    inc h
    ld [bc], a
    ld [hl], $0e
    ld b, b

jr_01a_5505:
    rst $38
    ld bc, $06fe

jr_01a_5509:
    ld a, [$f10e]
    ccf
    pop de
    pop hl
    rst $18
    db $10
    rra
    push af
    ld a, [c]
    ld [$b103], sp
    ld b, c
    rlca
    db $f4
    rlca
    ld [$1008], sp
    rst $00
    jr nz, jr_01a_54ec

    db $10
    ld bc, $557f
    jr nz, jr_01a_555e

    scf
    inc c
    inc c
    inc b
    inc b
    inc bc
    or a
    inc bc
    ld [$f010], sp
    rst $18
    jr nz, jr_01a_5505

    ldh a, [$30]
    or a

jr_01a_5538:
    jr nc, jr_01a_54ff

    jr z, jr_01a_5564

    rst $00
    nop
    rra
    jr jr_01a_5558

    db $e3
    inc e
    dec bc
    rrca
    di
    pushx @ + $c700
    inc d
    inc d
    inc de
    push bc
    ld bc, $94a3
    nop
    rlca
    ld d, c
    ret


    inc h
    ret nz

    ret nz

    nop

jr_01a_5558:
    or a
    ld a, l
    nop
    rst $00
    push bc
    nop

jr_01a_555e:
    push bc
    reti


    nop

jr_01a_5561:
    reti


    adc l
    nop

jr_01a_5564:
    pop af
    ld a, a
    ld b, b
    rst $38
    ret nz

    ld h, c

jr_01a_556a:
    pushx @ + $a560
    ld hl, sp-$14
    jr jr_01a_5561

    ld [hl], b
    push hl
    add d
    ld [$3f0f], sp
    push af
    add b
    jr nc, jr_01a_5538

    ld h, l
    jr nz, jr_01a_556a

    db $ec
    rst $20
    add hl, bc
    ld b, d
    set 1, e
    jr z, @-$36

    rra
    rra
    or e
    or a
    jr nz, @+$01

    sbc c
    or a
    inc [hl]
    dec d
    ld h, b
    push bc
    inc b
    ld hl, sp-$08
    or a
    push bc
    ld b, c
    db $ed
    ld l, b
    ld d, d
    dec de
    rrca
    dec de
    ld h, $87
    ld a, c
    ld b, b
    sra a
    daa
    ld a, h
    ld a, b
    rst $30
    daa
    inc hl
    ld l, $2c
    ld a, c
    ld b, b
    ld bc, $e101
    cp l
    pop hl
    db $db
    pop hl
    pop bc
    ld hl, $7921
    ld b, b
    dec b
    rst $30
    dec b
    ld a, a
    ccf
    ldh [rNR50], a
    ld e, $71
    ld h, c
    ld hl, $6099
    jr z, jr_01a_55d5

    add c
    ld [hl], $6c
    jp hl


    nop
    jr z, jr_01a_55d6

    ld c, h
    ld a, [$0206]
    ld l, h

jr_01a_55d5:
    sub a

jr_01a_55d6:
    ld b, h
    rrca
    rrca
    ld a, c
    ld d, b
    nop
    scf
    add a
    ld c, a
    ld h, $f0
    ldh a, [$6c]
    rst $00
    push bc
    rlca
    db $e3
    ld b, $84
    add h
    and e
    inc b
    or c
    ld h, h
    nop
    rst $38
    cp $8f
    inc hl
    call Call_000_103a
    ld h, h
    ld h, b
    jr nz, jr_01a_5666

    ld b, h
    db $fd
    ld c, b
    ld c, b
    ld c, h
    ld c, b
    ld c, a
    ld b, a
    ld a, c
    ld [hl+], a
    ld h, c
    ei
    ld b, c
    inc bc
    ld bc, $0203
    ld d, h
    ld [c], a
    ld [c], a
    rrca
    ld a, c
    jr nz, jr_01a_5665

    ld a, c
    nop
    ld b, c
    ld b, b
    ld b, b
    ld h, b
    ld b, b
    ld bc, $04d7
    adc e
    adc a
    inc b
    rst $30
    ret


    ld [bc], a
    pop af
    ld d, h
    ld [hl-], a
    ld [bc], a
    ccf
    add hl, de
    xor d
    add h
    rra
    rrca
    jr jr_01a_563e

jr_01a_562e:
    add hl, de
    ld de, $1fcb
    ld c, $11
    dec d
    nop
    ret nz

    inc e
    ldh [$b8], a
    sbc b
    jr jr_01a_562e

    ld b, b

jr_01a_563e:
    dec hl
    rlca
    rlca
    xor [hl]
    ld [bc], a
    add hl, de
    add a
    ld b, b
    ld [hl], c
    ld a, [hl-]
    rst $38
    rst $38
    jr nz, jr_01a_568a

    ld [de], a
    inc sp
    pop af
    ld hl, $1118
    trap $89
    add b
    pop af
    add $df
    ld a, [de]
    db $d3
    jr nz, jr_01a_56af

    ld bc, $2027
    ld a, d
    ld hl, $fbfc
    or $00

jr_01a_5665:
    pop hl

jr_01a_5666:
    nop
    ld a, [de]
    db $dd
    nop
    ld b, $de
    ld [bc], a
    ld [hl+], a
    nop
    ld l, d
    nop
    ret nz

    ld a, e
    sbc [hl]
    nop
    add a
    nop
    ld e, b
    ld h, d
    dec b
    nop
    ld h, e
    jp nz, Jump_01a_4440

    ret c

    adc b
    ld b, b
    ld [de], a
    ld a, [hl]
    nop
    ld [de], a
    cpl
    xor l
    nop
    ld [hl-], a

jr_01a_568a:
    ld b, $10
    adc c
    ld b, b
    ld c, b
    ccf
    nop
    nop
    ld e, a
    ld b, d
    ld [$6089], sp
    ld [hl-], a
    ld l, $62
    ld e, [hl]
    db $e4
    rst $38
    sbc h
    ret z

    cp b
    adc b
    ld a, b
    sub b
    ld [hl], b
    db $10
    ld a, [$20f0]
    ldh [rSB], a
    ld bc, $10c5
    ld h, e
    ld [de], a

jr_01a_56af:
    rst $38
    ld [$0c08], sp
    inc c

jr_01a_56b4:
    ld c, $0e
    dec de
    dec de
    rst $38
    sbc [hl]
    and $67
    ld a, c
    add hl, de
    ld e, $04
    rlca
    sbc a
    inc bc
    db $fc
    db $ec
    ld a, b
    sbc h
    sbc h
    and e
    cp a
    jp Jump_01a_7ffb


    db $ec
    inc a
    ld [hl], b
    or b
    db $ec
    ret nz

    ret nz

    ld l, a
    push bc
    nop
    ld [hl], b
    ld [hl], b
    ld e, l
    ld b, b
    ret nz

    ld hl, $ffe0
    db $10
    pop af
    call z, $f33c
    rrca
    db $fc
    inc bc
    db $fd
    cp $01
    ld de, $3011
    jr nc, jr_01a_56b4

    ld bc, $3d40
    dec a
    ret c

    nop
    ret z

    ret z

    ld h, $e6
    ld l, e
    ld a, b
    rst $38
    ld a, b
    ld sp, $2131
    ld hl, $6362
    jp nz, $c3ff

    add h
    add a
    ld [$740f], sp
    sub h
    ld a, b
    rst $38
    sbc b
    ld a, b
    adc b
    ei
    dec bc
    cp $06
    cp $fa
    ld [bc], a
    rst $38
    inc bc
    rst $38
    ld [hl], c
    ld h, a
    rlca
    inc b
    pop hl
    ld l, a
    ld h, a
    nop
    ldh a, [$f0]
    jp nc, Jump_000_1ee6

    ld sp, hl
    rlca
    ld l, a
    xor e
    inc bc
    rst $38
    nop
    rst $30
    ldh [$09], a
    ld c, $11
    rst $38
    ld e, $93
    sbc l
    ld h, e
    db $fd
    rrca
    di

jr_01a_573c:
    cp $fd
    inc bc
    db $fc
    rlca
    ld hl, sp+$0f
    add b
    rrca
    db $10
    inc sp
    rst $38
    inc sp
    ld c, h
    ld c, h
    sub b
    sub b
    and c
    and c
    and b
    pop hl
    and b
    adc b
    adc b
    ld e, a
    sub a
    jr nz, @-$4d

    ld h, a
    nop
    dec b
    db $e3
    dec b
    add [hl]
    add a
    dec hl
    ld d, a
    nop
    ld d, l
    call nz, $ffbc
    push hl
    db $dd
    di
    trap $30
    rst $28
    dec sp
    db $f4
    rst $28
    ccf
    ldh a, [$fc]
    rlca
    nop
    inc de
    ldh a, [rNR10]
    ldh [rPCM34], a
    sbc a
    jr nz, jr_01a_573c

    ld b, b
    rrca
    jr nz, @+$56

    call nc, $b6d3
    db $d3
    or c
    db $10
    db $10
    daa
    ld [bc], a
    ld b, $06
    rra
    ccf
    dec hl
    nop
    add hl, hl
    adc c
    adc c
    ld [hl], l
    ld [hl], l
    ld a, [bc]
    ld a, [bc]
    rst $30
    inc e
    inc e
    ldh [$e0], a
    sub d
    nop
    ld c, a
    ret z

    adc a
    db $ec
    adc b
    rlca
    inc b
    ld [hl], e
    inc bc
    ld [bc], a
    rra
    ld [bc], a
    rra
    ld a, e
    sub d
    ld b, b
    rlca
    dec b
    rst $00
    add $29
    add h
    add h
    ld [hl], $7e
    ld b, b
    or e
    cp $ff
    rra
    add hl, bc
    db $fd
    db $fd
    ld a, e
    and $03
    ld e, $1c
    ld a, l
    ld h, d
    ld a, [hl]
    ldh a, [$f8]
    daa
    inc b
    db $fd
    jr jr_01a_57dd

    ld [hl], b
    ld h, b
    ld b, b
    ld b, b

jr_01a_57d1:
    ld a, [hl]
    ld [bc], a
    pushx @ + $0e06
    ld e, c
    nop
    ld c, $ca
    inc c
    ld c, $87

jr_01a_57dd:
    cp d
    add a
    jr nz, jr_01a_57e1

jr_01a_57e1:
    ld bc, $8381
    call nc, $d882
    ld [bc], a
    ld l, e
    ld a, [hl]
    rst $38
    rst $38
    rla
    nop
    sub b
    ld d, l
    db $10
    dec de
    xor $11
    rra
    ld c, $a9
    and e
    rlca
    ld b, $03
    ld a, h
    inc sp
    cp l
    ld b, $ff
    add b
    ret nz

    ld a, [hl]
    jr nz, jr_01a_57d1

    ld [$4f0c], sp
    ld a, [hl]
    ld hl, $1718
    ld a, [hl]
    ld hl, $333c
    ld a, c
    ld b, a
    cp $e6
    sbc [hl]
    sbc b
    ld a, b
    ld h, b
    ldh [$c0], a
    ld a, [bc]
    ld e, $17
    nop
    add hl, hl
    ld c, h
    nop
    ld e, $1e
    inc hl
    inc hl
    sub e
    ccf
    sub e
    ld [bc], a
    ld d, e
    ld h, [hl]
    ld a, d
    daa
    add hl, sp
    inc de
    dec e
    rst $38
    sub c
    sbc [hl]
    ret


    adc $68
    ld l, a
    inc [hl]
    scf
    rst $38
    ld a, [de]
    dec de
    inc d
    inc d
    sub d
    sub d
    sbc c
    sbc c
    rst $38
    ld c, c
    ret


    ld c, h
    call z, $e424
    ld [hl], $f6
    trap $92
    ld [hl], d
    rla
    nop
    or a
    inc c
    inc c
    inc b
    inc b
    rst $38
    add d
    add b
    ld b, d

jr_01a_5859:
    ld b, d
    dec c
    dec c
    inc sp
    ld sp, $0aef
    dec bc
    ld hl, $00d3
    ld hl, $8322
    adc h
    rst $38
    rrca
    inc sp
    inc a
    trap $f0
    ccf
    ret nz

    inc de
    cp $15
    rra
    ld e, $67
    ld a, b
    sbc a
    ldh [$7d], a
    sub a
    rst $38
    sbc $00
    sbc $60
    xor l
    ld b, b

jr_01a_5882:
    ld bc, $c101
    or c
    pop bc
    sub l
    add c
    add c
    sub l
    ld a, [bc]
    db $eb
    jr z, jr_01a_5893

    ld a, h
    sub b
    jr c, jr_01a_5882

jr_01a_5893:
    ld sp, hl
    ld bc, $ea0f
    ld sp, hl
    nop
    add c
    rst $28
    ld b, d
    reti


    ldh a, [$f0]
    rst $28
    db $fc
    ld hl, sp+$64
    ld b, $ef
    rra
    rst $28
    rrca
    ld a, b
    ld [hl], b

jr_01a_58aa:
    rst $28
    ld h, b
    ld d, b
    ld d, b
    jr z, jr_01a_58d8

    ld d, a
    jr z, jr_01a_5913

    scf
    inc h
    jr nz, jr_01a_5859

    ld [bc], a
    ld [bc], a
    ld [hl+], a
    ld d, b
    rst $30
    db $10
    ld h, d
    ld a, [$9b42]
    ld hl, $049a
    ld [hl-], a
    and d
    add $0f
    ld b, $b5
    ld a, [bc]
    sbc a
    and c
    add d
    inc bc
    inc bc
    and d
    ld l, a

jr_01a_58d2:
    ld h, l
    nop
    inc c
    ld [$3860], sp

jr_01a_58d8:
    db $10
    ldh a, [$60]
    trap $c0
    add b
    and c
    add b
    sbc [hl]
    rlca
    inc bc
    ld c, $0c
    ld a, [hl-]
    and d
    jr nz, jr_01a_58d2

    ld h, b
    ld b, b
    ret nz

    ld d, d
    ld b, $80
    ld a, [hl-]
    and e
    ld b, d
    ld e, a
    db $10
    jp Jump_000_0462


    add hl, hl
    ld a, [hl-]
    db $10
    db $10
    trap $b0
    jr nz, jr_01a_58aa

    ld [bc], a
    and d
    ld [hl-], a
    ld l, $62
    ld e, [hl]
    rst $38
    db $e4
    sbc h
    ret z

    cp b
    adc b
    ld a, b
    sub c
    ld [hl], c
    di
    ld [de], a
    ld a, [c]
    inc h
    db $e4

jr_01a_5913:
    ld [bc], a
    nop
    ld d, [hl]
    sub b
    sub b
    rst $30
    and b
    and b
    pop bc
    pop bc
    inc b
    ld b, b
    sbc [hl]
    and $67
    di
    ld a, c
    add hl, de
    ld e, $04
    ld b, a
    ld a, [hl+]
    db $10
    jr jr_01a_5944

    ld a, a
    ld [$333c], a
    ld a, c
    ld b, a
    and $9e
    sbc b
    call c, $6078
    rst $20
    nop
    ret nz

    inc c
    inc c
    push af
    cp c
    nop
    dec e
    ld d, [hl]
    cpl
    nop

jr_01a_5944:
    push af
    ld b, c
    ld b, c
    ld b, b
    ret


    jr nc, @+$68

    rst $38
    ld a, d
    and a
    cp c
    sub e
    sbc l
    sub c
    sbc [hl]
    adc c
    cp $8e
    ret z

    trap $a4
    and a
    sub d
    sub e
    ld a, b
    rst $18
    ld a, b
    ld hl, sp-$73
    inc bc
    inc d
    db $f4
    trap $3f
    di
    rst $30
    rrca
    db $fc
    inc bc
    cp $03
    rlca
    rlca
    add hl, bc
    cp a
    add hl, bc
    sub a
    nop
    ld hl, $e021
    ldh [$3e], a
    cp $1f
    cp c
    ld b, e
    ld de, $0203
    inc bc
    ld b, d
    inc bc
    ld d, h
    pop hl
    add a
    jr jr_01a_59b7

jr_01a_5988:
    adc a
    jr nz, jr_01a_59e1

    ld d, d
    jr nz, jr_01a_5988

    dec [hl]
    rst $20
    ldh a, [$94]
    ld [hl], d
    cp c
    nop
    ret


    ld [hl], b
    ld [hl], b
    ld c, b
    sbc a
    ld c, b
    rst $00
    nop
    ld h, c
    ld [bc], a
    add d
    dec a
    dec a
    add d
    rst $38
    add e
    adc a
    adc a
    ld de, $1211
    inc de
    db $ec
    rst $38
    rst $28
    inc sp
    inc a
    trap $f0
    ccf
    ret nz

    sbc c
    ei
    ld a, c

jr_01a_59b7:
    rst $20
    rra
    ld sp, hl
    rlca
    db $eb
    inc bc
    rst $38
    nop
    ld a, a
    ld b, a
    ldh [rDMA], a
    ld b, a
    ld e, c
    ld e, [hl]
    ld h, a
    ld a, b
    ret z

    sbc a
    ldh [$3d], a
    inc bc
    ld b, a
    ld h, b
    nop
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0201
    inc bc
    inc b

jr_01a_59e1:
    dec b
    ld b, $07
    ld [$0a09], sp
    dec bc
    inc c
    dec c
    ld c, $0f
    db $10
    inc b
    ld de, $0403
    ld [de], a
    inc de
    inc d
    dec d
    ld d, $17
    jr jr_01a_5a12

    ld a, [de]
    dec de
    inc e
    dec e
    inc b
    ld de, $1f1e
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    jr nz, @+$06

    inc b
    inc b

jr_01a_5a12:
    ld hl, $0404
    inc b
    inc b
    ld hl, $0404
    inc b
    ld [hl+], a
    inc hl
    inc h
    inc b
    inc b
    dec h
    inc b
    inc b
    ld h, $27
    jr z, jr_01a_5a2b

    inc b
    add hl, hl
    ld a, [hl+]
    dec hl

jr_01a_5a2b:
    inc l
    dec l
    inc b
    inc b
    inc b
    inc b
    ld l, $2f
    jr nc, jr_01a_5a66

    ld [hl-], a
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $37
    jr c, jr_01a_5a76

    inc b
    inc b
    inc b
    inc b
    ld a, [hl-]
    dec sp
    inc a
    dec a
    ld a, $3f
    ld b, b
    ld b, c
    ld b, d
    ld b, e
    ld b, h
    inc b
    inc b
    inc b
    inc b
    inc b
    ld b, l
    ld b, [hl]
    ld b, a
    ld c, b
    ld c, c
    ld c, d
    ld c, e
    ld c, h
    ld c, l
    ld c, [hl]
    ld c, a
    ld d, b
    inc b
    inc b
    inc b
    inc b
    ld d, c
    ld d, d
    ld d, e
    ld d, h
    ld d, l

jr_01a_5a66:
    ld d, [hl]
    ld d, a
    ld e, b
    ld e, c
    ld e, d

jr_01a_5a6b:
    ld e, e
    ld e, h
    inc b
    inc b
    inc b
    ld e, l
    ld e, [hl]
    ld e, a
    ld h, b
    ld h, c
    ld h, d

jr_01a_5a76:
    inc b
    inc b
    ld e, l
    ld h, e
    ld h, h
    ld h, l
    ld h, [hl]
    ld h, d
    inc b
    inc b
    ld h, a
    ld l, b
    ld l, c
    ld l, d
    ld l, b
    ld l, e
    inc b
    inc b
    ld h, a
    ld l, b
    ld l, c
    ld l, d
    ld l, b
    ld l, e
    inc b
    nop
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0201
    inc bc
    ld l, h
    ld l, l
    ld l, [hl]
    ld l, a
    ld [hl], b
    ld [hl], c
    ld [hl], d
    dec b
    ld b, $07
    ld [hl], e
    ld [hl], h
    inc b
    inc b
    ld de, $7503
    halt
    ld [hl], a
    ld a, b
    ld a, c
    ld a, d
    ld a, e
    ld [de], a
    inc de
    inc d
    ld a, h
    ld a, l
    ld a, [hl]
    ld a, a
    ld de, $1f1e
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    jr nz, jr_01a_5ad4

    inc b
    inc b
    inc b
    inc b

jr_01a_5ad4:
    inc b
    add b
    add c
    add d
    add e
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    ld h, $27
    jr z, jr_01a_5a6b

    add l
    add hl, hl
    ld a, [hl+]
    dec hl
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    ld l, $2f
    add [hl]
    add a
    adc b
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $37
    adc c
    adc d
    inc b
    inc b
    inc b
    inc b
    ld a, [hl-]
    dec sp
    adc e
    adc h
    adc l
    ccf
    ld b, b
    ld b, c
    ld b, d
    ld b, e
    adc [hl]
    adc a
    inc b
    inc b
    inc b
    inc b
    ld b, l
    ld b, [hl]
    ld b, a
    sub b
    sub c
    sub d
    sub e
    sub h
    ld c, l
    ld c, [hl]
    ld c, a
    ld d, b
    inc b
    inc b
    inc b
    inc b
    ld d, c
    ld d, d
    ld d, e
    ld d, h
    sub l
    sub [hl]
    sub a
    sbc b
    ld e, c
    ld e, d
    ld e, e
    ld e, h
    inc b
    inc b
    inc b
    ld e, l
    ld e, [hl]
    ld e, a
    ld h, b
    ld h, c
    ld h, d
    inc b
    inc b
    ld e, l
    ld h, e
    ld h, h
    ld h, l
    ld h, [hl]
    ld h, d
    inc b
    inc b
    ld h, a
    ld l, b
    ld l, c
    ld l, d
    ld l, b
    ld l, e
    inc b
    inc b
    ld h, a
    ld l, b
    ld l, c
    ld l, d
    ld l, b
    ld l, e
    inc b
    nop
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0201
    inc bc
    inc b
    inc b
    inc b
    dec b
    ld b, $07
    sbc c
    sbc d
    sbc e
    sbc h
    sbc l
    inc b
    inc b
    inc b
    ld de, $0403
    inc b
    inc b
    ld [de], a
    inc de
    inc d
    sbc [hl]
    sbc a
    and b
    and c
    and d
    inc b
    inc b
    inc b
    ld de, $1f1e
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    jr nz, jr_01a_5b94

    inc b
    inc b
    inc b
    inc b

jr_01a_5b94:
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    ld h, $27
    jr z, jr_01a_5bab

    inc b
    add hl, hl
    ld a, [hl+]
    dec hl

jr_01a_5bab:
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    ld l, $2f
    jr nc, jr_01a_5be6

    ld [hl-], a
    inc sp
    inc [hl]
    and e
    and h
    and l
    adc c
    adc d
    inc b
    inc b
    inc b
    inc b
    ld a, [hl-]
    dec sp
    inc a
    dec a
    ld a, $3f
    ld b, b
    and [hl]
    and a
    xor b
    adc [hl]
    adc a
    inc b
    inc b
    inc b
    inc b
    ld b, l
    ld b, [hl]
    ld b, a
    ld c, b
    sub c
    sub d
    sub e
    sub h
    xor c
    ld c, [hl]
    ld c, a
    ld d, b
    inc b
    inc b
    inc b
    inc b
    ld d, c
    ld d, d
    ld d, e
    ld d, h
    sub l

jr_01a_5be6:
    sub [hl]
    sub a
    sbc b
    ld e, c
    ld e, d
    ld e, e
    ld e, h
    inc b
    inc b
    inc b
    ld e, l
    ld e, [hl]
    ld e, a
    ld h, b
    ld h, c
    ld h, d
    inc b
    inc b
    ld e, l
    ld h, e
    ld h, h
    ld h, l
    ld h, [hl]
    ld h, d
    inc b
    inc b
    ld h, a
    ld l, b
    ld l, c
    ld l, d
    ld l, b
    ld l, e
    inc b
    inc b
    ld h, a
    ld l, b
    ld l, c
    ld l, d
    ld l, b
    ld l, e
    inc b
    nop
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0201
    inc bc
    inc b
    dec b
    ld b, $07
    xor d
    xor e
    xor h
    xor l
    xor [hl]
    xor a
    or b
    inc b
    sbc l
    inc b
    ld de, $0403
    ld [de], a
    inc de
    inc d
    or c
    or d
    or e
    or h
    or l
    or [hl]
    or a
    cp b
    and d
    inc b
    ld de, $1f1e
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    jr nz, @+$06

    inc b
    inc b
    ld hl, $0404
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    ld [hl+], a
    inc hl
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    ld h, $27
    jr z, jr_01a_5c6b

    inc b
    add hl, hl
    ld a, [hl+]
    dec hl

jr_01a_5c6b:
    inc l
    dec l
    inc b
    inc b
    inc b
    inc b
    ld l, $2f
    cp c
    cp d
    cp e
    inc sp
    inc [hl]
    cp h
    cp l
    cp [hl]
    jr c, jr_01a_5cb6

    inc b
    inc b
    inc b
    inc b
    ld a, [hl-]
    dec sp
    cp a
    ret nz

    pop bc
    ccf
    ld b, b
    jp nz, $c4c3

    ld b, h
    inc b
    inc b
    inc b
    inc b
    inc b
    ld b, l
    ld b, [hl]
    ld b, a
    push bc
    ld c, c
    ld c, d
    ld c, e
    ld c, h
    add $4e
    ld c, a
    ld d, b
    inc b
    inc b
    inc b
    inc b
    ld d, c
    ld d, d
    ld d, e
    ld d, h
    ld d, l
    ld d, [hl]
    ld d, a
    ld e, b
    ld e, c
    ld e, d
    ld e, e
    ld e, h
    inc b
    inc b
    inc b
    ld e, l
    ld e, [hl]
    ld e, a
    ld h, b
    ld h, c
    ld h, d

jr_01a_5cb6:
    inc b
    inc b
    ld e, l
    ld h, e
    ld h, h
    ld h, l
    ld h, [hl]
    ld h, d
    inc b
    inc b
    ld h, a
    ld l, b
    ld l, c
    ld l, d
    ld l, b
    ld l, e
    inc b
    inc b
    ld h, a
    ld l, b
    ld l, c
    ld l, d
    ld l, b
    ld l, e
    inc b
    nop
    ld bc, $0101

jr_01a_5cd3:
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld [bc], a
    inc bc
    inc b
    jp z, $d0cd

    db $d3
    sub $d9
    call c, $e2df
    push hl
    add sp, -$15
    xor $f1
    db $f4
    rst $30
    inc b
    ld de, $0403
    set 1, [hl]
    pop de
    call nc, $dad7
    db $dd
    ldh [$e3], a
    and $e9
    db $ec
    rst $28
    ld a, [c]
    push af
    ld hl, sp+$04
    ld de, $0403
    call z, $d2cf
    push de
    ret c

    db $db
    sbc $e1
    db $e4
    rst $20
    ld [$f0ed], a
    di
    or $f9
    inc b
    ld de, $1f1e
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra

jr_01a_5d31:
    rra
    jr nz, @-$42

    rst $38
    xor $1f
    ret nz

    ccf
    ret nz

    jr nz, jr_01a_5d31

jr_01a_5d3c:
    ld b, $fe
    jr nc, jr_01a_5d57

    rst $28
    nop
    add b
    ld a, a
    inc l
    rst $28
    ld [hl+], a
    jr nc, jr_01a_5d7f

    rst $38
    nop
    ld b, a
    rst $18
    pop af
    db $ed
    ld l, h
    rra
    jr nc, jr_01a_5cd3

    rst $38
    sub c
    ld h, e
    rst $38

jr_01a_5d57:
    rrca
    ld [hl], h
    call nz, $d5ff
    and a
    ld h, b
    db $fc
    nop
    ld a, [$e006]
    ld a, [bc]
    or $0a
    ld a, [c]
    or $ff
    rlca
    jr jr_01a_5d3c

    pop af
    rst $18
    ld [bc], a
    cp $2c
    ld bc, $3f3f
    ld a, a
    ld b, b
    rst $38
    cp $80
    rst $38
    add c
    rst $38
    sub a
    rst $38
    sbc c

jr_01a_5d7f:
    scf
    rst $28
    sub c
    rst $38
    add a
    dec [hl]
    db $10
    sbc a
    rst $38
    add d
    rst $38
    add a
    adc h
    inc sp
    ld sp, $2f00
    xor l
    ld b, c
    rst $38
    ld [bc], a
    rst $38
    rst $38
    db $e4
    rst $38
    ld de, $d2ff
    rst $38
    ld d, $ff
    xor c
    jp z, $f255

    ld b, l
    inc de
    ld h, d
    ld d, c
    xor $00
    db $fc
    cp b
    cp $56
    ld bc, $f9ff
    ld [hl], e
    ld [de], a
    ld [hl], h
    ld e, d
    inc b
    ld hl, $3e7e
    nop
    ld h, c
    ld [hl], e
    ld [hl], c
    nop
    ld l, a
    cpl
    ld d, c
    adc b
    adc $ff
    adc e
    add hl, sp
    ld b, h
    ld bc, $ff9b
    sbc [hl]
    sbc l
    add a
    adc d
    sub a
    db $10
    and h
    ld c, d
    and b
    ld b, [hl]
    rst $28
    rst $38
    jp nz, $ec74

    ld de, $ffe5
    dec h
    or a
    ld [hl+], a
    pop bc
    ld a, [hl-]
    ld l, d
    rst $38
    ld d, c
    rst $38
    jp hl


    rst $38
    ld c, c
    rst $38
    pop de
    rst $38
    ldh [$59], a
    rst $38
    ld l, c
    pushx @ + $d610
    call c, $e000
    adc d
    and c
    cp e
    add h
    ld b, e
    adc [hl]
    rst $38
    sub l
    ld sp, hl
    ld sp, $ff8f
    add a
    add l
    inc bc
    ld b, h
    ld a, [bc]
    ld c, d
    inc [hl]
    ld bc, $fff7
    and d
    ld a, a
    add hl, de
    ld h, a
    rst $38
    sub d
    rst $38
    ld [c], a
    rst $38
    rst $00
    ld d, h
    ld d, c
    dec de
    pop af
    ld l, c
    or c
    pushx @ + $a911
    ld a, e
    ld a, [hl-]
    dec h
    adc d
    ld hl, $8a3f
    and b
    and h
    add c
    sub a
    ld de, $0198
    ld e, h
    sub [hl]
    ld bc, $a389
    adc h
    rst $38
    sub e
    xor c
    or b
    call nz, $43ff
    rst $38
    db $e4
    rst $38
    adc l
    rst $38
    db $f4
    rst $38
    add sp, -$3b
    rst $38
    inc h
    cp a
    ld de, $bd15
    ld a, [hl+]
    and e
    ld b, [hl]
    inc hl
    sub a
    ld [hl], b
    jr z, jr_01a_5e57

    ld b, a
    ret nc

    ld d, $02
    ld hl, $ff9e
    rst $28
    sub c

jr_01a_5e57:
    rst $38
    sub [hl]
    dec d
    add [hl]
    rst $38
    add e
    rst $38
    adc a
    sbc h
    add hl, bc
    or b
    ld [hl+], a
    ld a, b
    inc hl
    dec e
    rst $38
    sub h
    rst $38

jr_01a_5e69:
    add sp, $55
    rst $38
    ld b, h
    inc bc
    ld [hl], l

jr_01a_5e6f:
    adc c
    rst $38
    sbc d
    xor e
    sub c
    sub h
    sub l
    cp c
    ret nz

    ld bc, $bd99
    sbc a
    dec e
    ld e, h
    ld l, b
    sub b
    ld d, $df
    db $10
    ldh [rRP], a
    dec sp
    ld [de], a
    jr c, jr_01a_5e69

    nop
    ld [hl], $ba
    ld h, h
    jp hl


    or c
    ld [hl], c
    rst $38
    adc c
    and a
    xor c
    push af
    jr nc, jr_01a_5e97

jr_01a_5e97:
    or $5c
    ld [bc], a
    ld h, h
    xor d
    jr nc, @+$40

    jr nz, jr_01a_5e6f

    or e
    call Call_01a_6627
    call Call_01a_64d3

Jump_01a_5ea7:
    call Call_01a_657f
    ld a, $01
    call Call_01a_66c2
    ld de, $470d
    ld hl, $c699
    trap $54
    ld a, $03
    trap $b4

jr_01a_5ebb:
    trap $b1
    trap $d8
    ld c, a
    and $06
    jp nz, Jump_01a_5f61

    ld a, c
    and $09
    jr nz, jr_01a_5ef2

    bit 6, c
    jr nz, jr_01a_5ed7

    bit 7, c
    jr nz, jr_01a_5edf

    call Call_01a_5f2d
    jr jr_01a_5ebb

jr_01a_5ed7:
    call Call_01a_5ee7
    call Call_01a_5f21
    jr jr_01a_5ebb

jr_01a_5edf:
    call Call_01a_5ee7
    call Call_01a_5f15
    jr jr_01a_5ebb

Call_01a_5ee7:
    xor a
    ldh [$c1], a
    call Call_01a_6181
    ld c, $11
    trap $5d
    ret


jr_01a_5ef2:
    xor a
    call Call_01a_66c2
    call Call_01a_6181
    trap $55
    jr c, jr_01a_5f0e

    ld a, $01
    ldh [$c2], a
    ldh a, [$8a]
    bit 2, a
    jp nz, Jump_01a_5f61

    call Call_01a_5f15
    xor a
    ldh [$c1], a

jr_01a_5f0e:
    ld a, $01
    call Call_01a_66c2
    jr jr_01a_5ebb

Call_01a_5f15:
    ldh a, [$c0]
    inc a
    cp $09
    jr c, jr_01a_5f1e

    ld a, $01

jr_01a_5f1e:
    ldh [$c0], a
    ret


Call_01a_5f21:
    ldh a, [$c0]
    dec a
    bit 7, a
    jr z, jr_01a_5f2a

    ld a, $08

jr_01a_5f2a:
    ldh [$c0], a
    ret


Call_01a_5f2d:
    ld hl, $ffc1
    ld a, [hl]
    inc [hl]
    and $0f
    ret z

    bit 4, [hl]
    push af
    call Call_01a_6181
    ld c, $11
    pop af
    jr z, jr_01a_5f44

    trap $5d
    jr jr_01a_5f60

jr_01a_5f44:
    ld b, e

jr_01a_5f45:
    push hl
    push de
    push bc
    ld e, [hl]
    trap $4b
    push hl
    ld hl, $c3ee
    ld a, $ff
    ld [hl+], a
    ld [hl], a
    pop hl
    trap $02
    pop bc
    pop de
    pop hl
    inc hl
    ld a, b
    add d
    ld d, a
    dec c
    jr nz, jr_01a_5f45

jr_01a_5f60:
    ret


Jump_01a_5f61:
    call Call_01a_5ee7
    call Call_01a_6501

Jump_01a_5f67:
jr_01a_5f67:
    xor a
    ld de, $5f82
    trap $5f
    jp c, Jump_01a_5ea7

    ld l, a
    ld h, $00
    trap $06
    ld b, $31
    rst $38
    and a
    nop
    rst $30
    nop
    ld a, $01
    add hl, sp
    nop
    inc h
    nop
    ld b, $04
    dec b
    ld [hl], b
    ld a, a
    ld [bc], a
    nop

Call_01a_5f89:
    push af
    call Call_01a_652c
    pop af
    add a
    ld c, a
    ld b, $00
    ld hl, $61a1
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld d, $30
    ld e, $01
    trap $5a
    ld a, d
    ldh [$c4], a
    or a
    ret


    ldh a, [$c2]
    or a
    jr z, jr_01a_5fb5

    ld a, $08
    call Call_01a_5f89
    call Call_01a_6169
    jr nc, jr_01a_5fb5

    jr jr_01a_5f67

Jump_01a_5fb5:
jr_01a_5fb5:
    trap $01
    call Call_01a_657f
    ldh a, [$c0]
    push af
    ld a, $01
    ldh [$c0], a
    ld a, $07
    call Call_01a_5f89
    ld a, $03
    trap $b4

jr_01a_5fca:
    trap $b1
    trap $d8
    bit 6, a
    jr nz, jr_01a_5fed

    bit 7, a
    jr nz, jr_01a_5ffa

    bit 0, a
    jr nz, jr_01a_6002

    bit 4, a
    jr nz, jr_01a_6002

    and $06
    jr nz, jr_01a_5fe7

jr_01a_5fe2:
    call Call_01a_5f2d
    jr jr_01a_5fca

jr_01a_5fe7:
    pop af
    ldh [$c0], a
    jp Jump_01a_5f61


jr_01a_5fed:
    call Call_01a_5ee7

jr_01a_5ff0:
    call Call_01a_5f21
    ldh a, [$c0]
    or a
    jr z, jr_01a_5ff0

    jr jr_01a_5fe2

jr_01a_5ffa:
    call Call_01a_5ee7
    call Call_01a_5f15
    jr jr_01a_5fe2

jr_01a_6002:
    call Call_01a_5ee7
    trap $11
    ld hl, $0400
    trap $b6
    call Call_01a_614f
    trap $70
    call Call_01a_5f15
    ld hl, $0404
    trap $b6
    trap $11
    trap $db
    jr jr_01a_5fca

    ldh a, [$c0]
    push af
    xor a
    ldh [$c0], a

jr_01a_6025:
    call Call_01a_614f
    or a
    jr nz, jr_01a_6037

    ld a, $09
    call Call_01a_5f89
    call Call_01a_6173
    pop af
    jp Jump_01a_5ea7


jr_01a_6037:
    inc a
    ld c, a
    ld de, $c6df
    ld a, $81
    ld [de], a
    ld hl, $c500
    ld c, $00
    trap $6b
    jr c, jr_01a_6059

    ld a, $0a
    call Call_01a_5f89
    call Call_01a_6169
    jr c, jr_01a_606b

    ld hl, $c500
    trap $ef
    jr jr_01a_6025

jr_01a_6059:
    call Call_01a_66ab
    ld a, $06
    jr c, jr_01a_6065

    xor a
    ldh [$c2], a
    ld a, $0b

jr_01a_6065:
    call Call_01a_5f89
    call Call_01a_6173

jr_01a_606b:
    pop af
    ldh [$c0], a
    jp Jump_01a_5f67


    call Call_01a_657f
    ld a, $0c
    call Call_01a_5f89
    ld a, $03
    trap $b4
    call Call_01a_6169
    jp c, Jump_01a_5f61

    ld a, $0d
    call Call_01a_5f89
    ld a, $01
    trap $cc
    trap $c3
    call Call_01a_611d
    jr c, jr_01a_60b0

    ld hl, $c600
    ld e, l
    ld d, h
    ld c, $99
    trap $7f
    jr c, jr_01a_60b5

    trap $73
    jr c, jr_01a_60b5

    ld a, $0e
    call Call_01a_5f89

jr_01a_60a7:
    xor a
    trap $cc
    call Call_01a_6173
    jp Jump_01a_5f61


jr_01a_60b0:
    call Call_01a_6114
    jr jr_01a_60a7

jr_01a_60b5:
    call Call_01a_6112
    jr jr_01a_60a7

    ldh a, [$c2]
    or a
    jr z, jr_01a_60c9

    ld a, $12
    call Call_01a_5f89
    call Call_01a_6169
    jr c, jr_01a_6103

jr_01a_60c9:
    ld a, $11
    call Call_01a_5f89
    trap $c3
    ld de, $661d
    ld hl, $c6d5
    ld bc, $000a
    trap $02
    ld a, $01
    trap $cc
    trap $72
    push af
    xor a
    trap $cc
    pop af
    jr c, jr_01a_610d

    ld a, [$c6d5]
    or a
    jr z, jr_01a_6106

    xor a
    ldh [$c0], a
    call Call_01a_5ee7
    call Call_01a_5f15
    ld a, $0e
    call Call_01a_5f89
    ld a, $01
    ldh [$c2], a

jr_01a_6100:
    call Call_01a_6173

jr_01a_6103:
    jp Jump_01a_5f67


jr_01a_6106:
    ld a, $0f
    call Call_01a_5f89
    jr jr_01a_6100

jr_01a_610d:
    call Call_01a_6112
    jr jr_01a_6100

Call_01a_6112:
    ld a, $10

Call_01a_6114:
    call Call_01a_5f89

jr_01a_6117:
    trap $d8
    or a
    jr nz, jr_01a_6117

    ret


Call_01a_611d:
    ld hl, $c6d5
    ld de, $c400
    ld bc, $000a
    trap $7c
    jr c, jr_01a_6146

    ld hl, $c400
    ld de, $661d
    ld bc, $000a
    trap $67
    or a
    jr nz, jr_01a_6149

    inc a
    ld hl, $c400
    ld [hl], a
    ld de, $c6d5
    ld bc, $000a
    trap $7f
    ret nc

jr_01a_6146:
    ld a, $10
    ret


jr_01a_6149:
    trap $73
    ld a, $0f
    scf
    ret


Call_01a_614f:
    call Call_01a_6181
    ld de, $c708
    push de
    inc c
    dec c
    jr z, jr_01a_6160

jr_01a_615a:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_01a_615a

jr_01a_6160:
    xor a
    ld [de], a
    pop de
    ld hl, $c6e0
    trap $4f
    ret


Call_01a_6169:
    ldh a, [$c4]
    ld d, a
    ld e, $01
    ld hl, $64c5
    trap $5a

Call_01a_6173:
jr_01a_6173:
    trap $b1
    trap $d8
    and $03
    jr z, jr_01a_6173

    or a
    bit 1, a
    ret z

    scf
    ret


Call_01a_6181:
    ld b, $11
    ldh a, [$c0]
    or a
    jr nz, jr_01a_618a

    ld b, $0c

jr_01a_618a:
    ld e, a
    add a
    add a
    add a
    add a
    add e
    ld e, a
    ld d, $00
    ld hl, $c600
    add hl, de
    add $80
    ld d, a
    ld e, $01
    ld a, b
    trap $4d
    ld c, a
    ret


    ret


    ld h, c
    sbc $61
    db $f4
    ld h, c
    ld d, $62
    add hl, sp
    ld h, d
    ld d, d
    ld h, d
    ld l, a
    ld h, d
    sbc h
    ld h, d
    ret


    ld h, d
    rst $28
    ld h, d
    dec l
    ld h, e
    ld e, [hl]
    ld h, e
    ld [hl], e
    ld h, e
    sbc c
    ld h, e
    or l
    ld h, e
    pop de
    ld h, e
    dec bc
    ld h, h
    inc a
    ld h, h
    ld h, l
    ld h, h
    sub b
    ld h, h
    ld bc, $0f0e
    call $bcdd
    xor l
    or e
    or [hl]
    sbc $d2
    db $dd
    add $d3
    call nz, $d8de
    trap $bd
    nop
    rst $38
    ld bc, $0f0e
    or d
    trap $c9
    call z, $ddde
    cp h
    xor [hl]
    or e
    and [hl]
    adc $bf
    sbc $dd
    cp h
    trap $bd
    nop
    rst $38
    ld bc, $0f0e
    adc $b6
    ret


    ld c, $b9
    sbc $b0
    pop de
    adc $de
    or b
    or d
    rrca
    add $cc
    sbc $dd
    cp h
    xor [hl]
    or e
    and [hl]
    nop
    ld bc, $b50f
    cp b
    ret c

    trap $bd
    nop
    rst $38
    ld bc, $0f0e
    adc $b6
    ret


    ld c, $b9
    sbc $b0
    pop de
    adc $de
    or b
    or d
    rrca
    or [hl]
    pushx @ + $decc
    db $dd
    cp h
    xor [hl]
    or e
    and [hl]
    nop
    ld bc, $d30f
    pushx @ + $cfb2
    cp l
    nop
    rst $38
    ld bc, $0e0e
    adc $df
    cp c
    call $d9de
    rrca
    add $cc
    sbc $dd
    cp h
    xor [hl]
    or e
    and [hl]
    or l
    cp b
    ret c

    trap $bd
    nop
    rst $38
    ld bc, $a20e
    ld c, e
    ld c, c
    ld d, e
    ld d, e
    jr nz, jr_01a_62a8

    ld b, c
    ld c, c
    ld c, h
    and e
    rrca
    and [hl]
    nop
    ld bc, $bc0f
    xor l
    or e
    ret c

    xor [hl]
    or e
    cp h
    trap $bd
    nop
    rst $38
    ld bc, $0f0e
    or c
    or a
    sub $b3
    ret c

    xor [hl]
    or e
    or [hl]
    sbc $c0
    ret c

    push bc
    cp b
    jp $be0e


    or b
    call z, Call_000_00de
    ld bc, $0f0f
    jp $b7de


    trap $be
    db $dd
    jp $bcde


    ret nz

    nop
    ld bc, $4f10
    ld c, e
    ld a, [hl-]
    ld b, c
    nop
    rst $38
    ld bc, $0e0e
    ld b, c
    adc $de
    ret nz

    db $dd
    rrca
    and [hl]
    or l
    cp l

jr_01a_62a8:
    call nz, $b731
    sbc $ae
    or e
    cp d
    sbc $c4
    add $00
    ld bc, $ca0f
    xor a
    cp h
    db $dd
    cp h
    trap $bd
    nop
    ld bc, $bc10
    xor l
    or e
    ret c

    xor [hl]
    or e
    ld a, [hl-]
    ld b, d
    nop
    rst $38
    ld bc, $0e0e
    cp [hl]
    or b
    call z, $0fde
    cp e
    jp c, $b2c3

    trap $be
    db $dd
    or [hl]
    sbc $00
    ld bc, $bc0f
    xor l
    or e
    ret c

    xor [hl]
    or e
    cp h
    jp $b2d3


    or d
    jp $bdde


    or [hl]
    ccf
    nop
    rst $38
    ld bc, $0e0e
    ret nz

    or d
    call nz, Call_000_0fd9
    or [hl]
    sbc $c6
    xor l
    or e
    ret c

    xor [hl]
    cp b
    cp e
    jp c, $b2c3

    trap $be
    db $dd
    nop
    ld bc, $c60f
    xor l
    or e
    ret c

    xor [hl]
    cp b
    cp h
    ret nz

    or c
    call nz, $dec3
    db $d3
    or e
    or d
    pop bc
    call nz, Call_000_00de
    ld bc, $0e10
    cp [hl]
    or b
    call z, $0fde
    cp h
    jp $c0b8


    sbc $bb
    or d
    nop
    rst $38
    ld bc, $0f0e
    or l
    push bc
    cp h
    sbc $c5
    trap $b4
    ret


    call z, $ddde
    cp h
    xor [hl]
    or e
    or [hl]
    sbc $b1
    ret c

    trap $bd
    nop
    ld bc, $b30f
    call c, $deb6
    or a
    cp h
    jp $bfce


    sbc $dd
    cp h
    jp $b2d3


    or d
    jp $bdde


    or [hl]
    ccf
    nop
    rst $38
    ld bc, $0e0e
    cp [hl]
    or b
    call z, $0fde
    cp h
    trap $bc
    ret nz

    nop
    ld bc, $4f0f
    ld c, e
    ld a, [hl-]
    ld b, c
    nop
    rst $38
    ld bc, $0f0e
    cp d
    ret


    call z, $ddde
    cp h
    xor [hl]
    or e
    and [hl]
    cp a
    or e
    cp h
    db $dd
    cp h
    trap $bd
    nop
    ld bc, $bc0f
    sbc $ad
    db $dd
    set 3, [hl]
    jp z, $b2b2

    jp $bdde


    or [hl]
    ccf
    nop
    rst $38
    ld bc, $0f0e
    jp nz, $bcb3

    db $dd
    pop bc
    xor l
    or e
    jp $bdde


    nop
    ld bc, $c10f
    xor l
    or e
    ret nz

    sbc $dd
    cp l
    reti


    ld a, [hl-]
    ld b, d
    nop
    rst $38
    ld bc, $0f0e
    jp nz, $bcb3

    db $dd
    or [hl]
    sbc $bc
    xor l
    or e
    ret c

    xor [hl]
    or e
    cp h
    trap $bc
    ret nz

    nop
    ld bc, $4f0f
    ld c, e
    ld a, [hl-]
    ld b, c
    nop
    rst $38
    ld bc, $a20e
    ld c, e
    ld c, c
    ld d, e
    ld d, e
    jr nz, @+$4f

    ld b, c
    ld c, c
    ld c, h
    and e
    rrca
    call nz, $b3de
    cp h
    jp $c5de


    or d
    call nz, Boot
    rrca
    jp nz, $bcb3

    db $dd
    jp $b7de


    trap $be
    db $dd
    nop
    ld bc, $d310
    or e
    or d
    pop bc
    call nz, $d4de
    ret c

    push bc
    or l
    cp h
    jp $c0b8


    sbc $bb
    or d
    nop
    rst $38
    ld bc, $0f0e
    jp nz, $bcb3

    db $dd
    or [hl]
    sbc $c1
    xor l
    or e
    ret nz

    sbc $dd
    cp e
    jp c, $bccf

    ret nz

    nop
    ld bc, $d30f
    or e
    or d
    pop bc
    call nz, $d4de
    ret c

    push bc
    or l
    cp h
    jp $c0b8


    sbc $bb
    or d
    nop
    ld bc, $4f10
    ld c, e
    ld a, [hl-]
    ld b, c
    nop
    rst $38
    ld bc, $0f0e
    cp h
    sbc $ad
    cp h
    db $dd
    ret nz

    or d
    or a
    pop bc
    xor l
    or e
    jp $bdde


    nop
    ld bc, $b10f
    or d
    jp $bfc9


    or e
    cp h
    db $dd
    and [hl]
    or [hl]
    or d
    cp h
    cp h
    jp $c0b8


    sbc $bb
    or d
    nop
    rst $38
    ld bc, $0f0e
    call $bcdd
    xor l
    or e
    pop bc
    xor l
    or e
    ret


    call z, $ddde
    cp h
    xor [hl]
    or e
    or [hl]
    sbc $00
    ld bc, $b70f
    or h
    jp $cfbc


    or d
    trap $bd
    or [hl]
    sbc $a4
    or d
    or d
    jp $bdde


    or [hl]
    ccf
    nop
    rst $38
    ld b, $00
    ld c, e
    ld c, c
    ld d, e
    ld d, e
    jr nz, @+$4f

    ld b, c
    ld c, c
    ld c, h
    nop
    ld bc, $0e0e
    cp [hl]
    or b
    call z, $0fde
    jp $b7de


    reti


    sub $b3
    ret c

    xor [hl]
    or e
    or [hl]
    sbc $c0
    ret c

    trap $be
    db $dd
    nop
    ld bc, $bf0f
    jp c, $dec3

    db $d3
    or d
    or d
    jp $bdde


    or [hl]
    ccf
    nop
    rst $38
    ld bc, $ca10
    or d
    ld a, [hl-]
    ld b, c
    jr nz, @-$4c

    or d
    or h
    ld a, [hl-]
    ld b, d
    nop
    rst $38

Call_01a_64d3:
    ld hl, $c500
    ld a, [hl+]
    or [hl]
    jp nz, Jump_01a_6678

    ld hl, $00d2
    trap $e6
    bit 7, h
    jr nz, jr_01a_64ec

    trap $e7
    xor a
    trap $f1
    inc b
    dec b
    ret nz

jr_01a_64ec:
    call Call_01a_66dc
    ld a, $03
    trap $b4
    ld a, $13
    call Call_01a_5f89
    call Call_01a_6169
    jp c, Jump_01a_5fb5

    trap $b5
    ret


Call_01a_6501:
    trap $b5
    call Call_01a_66dc
    ld de, $4078
    ld hl, $9700
    ld bc, $0010
    trap $02
    call Call_01a_65db
    ld de, $0204
    ld bc, $1109
    trap $58
    ld hl, $6535
    ld de, $9101
    trap $5a
    call Call_01a_652c
    ld a, $03
    trap $b4
    ret


Call_01a_652c:
    ld de, $000d
    ld bc, $1405
    trap $58
    ret


    dec b
    dec b
    rrca
    jp nz, $dec2

    cp c
    reti


    nop
    dec b
    ld b, $0e
    cp [hl]
    or b
    call z, $0fde
    cp l
    reti


    nop
    dec b
    rlca
    cp a
    or e
    cp h
    db $dd
    cp l
    reti


    nop
    dec b
    ld [$debc], sp
    xor l
    cp h
    db $dd
    cp l
    reti


    nop
    dec b
    add hl, bc
    ld c, $ce
    rst $18
    cp c
    call $d9de
    rrca
    add $b5
    cp b
    reti


    nop
    dec b
    ld a, [bc]
    ld c, e
    ld c, c
    ld d, e
    ld d, e
    ld c, $d2
    add $ad
    or b
    rrca
    add $d3
    call nz, $d9de
    ld c, $00
    rst $38

Call_01a_657f:
    trap $b5
    call Call_01a_66dc
    ld a, $e4
    ldh [$9d], a
    call Call_01a_65c6
    call Call_01a_65db
    ld de, $0103
    ld bc, $130a
    trap $58
    ld a, $73
    ld de, $0103
    trap $cd
    inc a
    ld d, $13
    trap $cd
    ld a, $91
    ld hl, $0111
    ld de, $0204
    ld bc, $1108
    trap $59
    ldh a, [$c0]
    push af
    xor a
    ldh [$c0], a
    ld c, $09

jr_01a_65b7:
    push bc
    call Call_01a_5ee7
    call Call_01a_5f15
    pop bc
    dec c
    jr nz, jr_01a_65b7

    pop af
    ldh [$c0], a
    ret


Call_01a_65c6:
    ld hl, $8800
    ld bc, $0f30
    ld e, $00
    trap $a6
    ld hl, $9800
    ld bc, $0400
    ld e, $7f
    trap $a6
    ret


Call_01a_65db:
    ld hl, $9800
    ld bc, $0400

jr_01a_65e1:
    ld a, $7f
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_01a_65e1

    ld de, $0101
    ld bc, $1303
    trap $58
    ld a, $80
    ld hl, $0111
    ld de, $0702
    ld bc, $0c01
    trap $59
    ld hl, $6607
    ld de, $2001
    trap $5a
    ret


    ld b, $00
    ld c, e
    ld c, c
    ld d, e
    ld d, e
    jr nz, jr_01a_665c

    ld b, c
    ld c, c
    ld c, h
    nop
    ld [bc], a
    ld [bc], a
    ld c, $c0
    or d
    call nz, Call_000_3ad9
    nop
    rst $38
    nop
    ld c, e
    ld c, c
    ld d, e
    ld d, e
    dec l
    ld c, l
    ld b, c
    ld c, c
    ld c, h

Call_01a_6627:
    call Call_01a_6651
    ld de, $c500
    ld hl, $c400
    ld bc, $0100
    trap $02
    ld de, $c699
    call Call_01a_665c
    call Call_01a_6651
    ld de, $c400
    ld hl, $c500
    ld bc, $0100
    trap $02
    xor a
    ldh [$c0], a
    ldh [$c1], a
    ldh [$c2], a
    ret


Call_01a_6651:
    ld hl, $c600
    ld bc, $0099
    ld e, $20
    trap $a6
    ret


Call_01a_665c:
jr_01a_665c:
    ld l, e
    ld h, d
    push hl
    call Call_01a_66e1
    pop hl
    ld de, $0039
    add hl, de
    ld e, l
    ld d, h
    inc hl
    inc hl
    ld c, $30

jr_01a_666d:
    ld a, [de]
    dec de
    ld [hl-], a
    dec c
    jr nz, jr_01a_666d

    ld a, $20
    ld [hl-], a
    ld [hl], a
    ret


Jump_01a_6678:
    call Call_01a_6651
    ld hl, $c500
    ld de, $c611
    ld bc, $0088
    trap $eb
    ld hl, $c509
    ld b, [hl]
    inc hl
    inc hl
    ld a, [hl]
    bit 4, b
    jr z, jr_01a_6699

    sub $60
    bit 3, b
    jr z, jr_01a_6699

    sub $60

jr_01a_6699:
    ld c, a
    ld b, $00
    ld hl, $c50c
    add hl, bc
    ld [hl], $00
    ld hl, $c50d
    ld de, $c600
    trap $4e
    ret


Call_01a_66ab:
    xor a
    ld [$c50a], a
    ld bc, $01ff
    ld de, $0088
    trap $e9
    ret c

    ld de, $c611
    ld bc, $0088
    trap $ec
    or a
    ret


Call_01a_66c2:
    push af
    ld a, $30
    ld hl, $0102
    ld de, $0003
    ld bc, $0202
    trap $59
    pop af
    ld e, a
    ld d, $30
    ld hl, $7f70
    ld c, $04
    trap $4c
    ret


Call_01a_66dc:
    ld h, $04
    trap $ca
    ret


Call_01a_66e1:
    ld de, $ff46
    ld bc, $003a
    push hl
    push bc
    trap $e4
    pop bc
    pop hl
    ret


Jump_01a_66ee:
    ld a, $20
    trap $b3
    call Call_01a_65c6
    call Call_01a_6627
    call Call_01a_66dc
    ld de, $0000
    ld bc, $140d
    trap $58
    ld hl, $67c2
    ld de, $8001
    trap $5a
    ld hl, $67fe

jr_01a_670e:
    call Call_01a_67b5
    jr nz, jr_01a_671f

    push hl
    ld a, c
    ld c, $01
    ld hl, $0100
    trap $59
    pop hl
    jr jr_01a_670e

jr_01a_671f:
    xor a
    ldh [$c3], a
    trap $e1
    jr nc, jr_01a_6731

    ld a, $01
    ldh [$c3], a
    trap $65
    ld de, $c699
    trap $51

jr_01a_6731:
    ld hl, $c600
    call Call_01a_66e1
    ld de, $0001
    trap $5d
    ld a, $03
    trap $b4
    ldh a, [$c3]
    or a
    jr nz, jr_01a_6757

    call Call_01a_652c
    ld hl, $6824
    ld de, $b001
    trap $5a
    ld a, $10
    call Call_01a_685d
    jr c, jr_01a_67b3

jr_01a_6757:
    ld de, $470d
    ld hl, $c699
    trap $54

jr_01a_675f:
    ld hl, $67fe

jr_01a_6762:
    call Call_01a_67b5
    jr nz, jr_01a_677b

    push hl
    ld hl, $c600
    ld e, c
    ld d, $00
    add hl, de
    ld d, c
    ld e, $01
    ld a, b
    trap $4d
    ld c, a
    trap $55
    pop hl
    jr jr_01a_6762

jr_01a_677b:
    ld hl, $680e
    ld de, $b001
    trap $5a
    ld a, $0b
    call Call_01a_685d
    jr nc, jr_01a_6799

jr_01a_678a:
    ld a, $7f
    ld de, $030a
    ld bc, $0e02
    ld hl, $0000
    trap $59
    jr jr_01a_675f

jr_01a_6799:
    ld hl, $c600
    ld c, $3b

jr_01a_679e:
    dec c
    jr z, jr_01a_678a

    ld a, [hl+]
    cp $20
    jr z, jr_01a_679e

    trap $65
    ld hl, $c600
    ld de, $ff46
    ld bc, $003a
    trap $e5

jr_01a_67b3:
    trap $01

Call_01a_67b5:
    ld d, $06
    ld e, [hl]
    bit 7, e
    ret nz

    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc hl
    xor a
    ret


    inc b

Jump_01a_67c3:
    ld bc, $ba0f
    ret


    ld c, $b6
    or b
    call nz, $afd8
    cp h
    sbc $0f
    add $b1
    push bc
    ret nz

    ret


    nop
    inc b
    ld [bc], a
    cp h
    sbc $ae
    or e
    adc $b3
    and [hl]
    call nz, $dbb3
    cp b
    cp h
    trap $bd
    nop
    ld [bc], a
    inc b
    push bc
    trap $b4
    ld a, [hl-]
    nop
    ld [bc], a
    dec b
    jp $ddde


    call c, $003a
    inc bc
    ld b, $0e
    jp nc, Jump_000_3ad3

    nop
    rst $38
    inc b
    nop
    ld a, [bc]
    dec b
    ld a, [bc]
    inc c
    ld b, $16
    inc c
    rlca
    ld [hl+], a
    inc c
    ld [$0c2e], sp
    rst $38
    inc bc
    ld a, [bc]
    rrca
    cp d
    ret


    cp h
    sbc $ae
    or e
    adc $b3
    jp $b2de


    or d
    jp $bdde


    or [hl]
    ccf
    nop
    rst $38
    ld bc, $0f0e
    cp d
    ret


    cp h
    sbc $ae
    or e
    adc $b3
    and [hl]
    or [hl]
    or h
    reti


    call nz, $bd2c
    call $c3de
    ret


    nop
    ld bc, $0e0f
    call z, $b2a7
    reti


    rrca
    or [hl]
    sbc $b7
    or h
    trap $bd
    or [hl]
    sbc $a4
    or d
    or d
    jp $bdde


    or [hl]
    ccf
    nop
    rst $38
    jp z, $20b2

    nop
    or d
    or d
    or h
    nop

Call_01a_685d:
    ldh [$91], a
    ld a, $03

jr_01a_6861:
    ldh [$90], a
    ld a, $0f
    trap $b9
    ldh a, [$91]
    ld e, a
    ld d, $07
    trap $57
    ld c, l
    ld b, h
    ld hl, $6855
    ld de, $d301
    ldh a, [$90]
    ldh [$b4], a
    trap $5b
    inc bc
    inc bc
    inc bc
    ldh a, [$90]
    swap a
    ldh [$b4], a
    trap $5b
    ld a, $03
    ldh [$b4], a

jr_01a_688b:
    trap $b1
    trap $d8
    ld b, a
    ld a, $03
    bit 4, b
    jr nz, jr_01a_6861

    swap a
    bit 5, b
    jr nz, jr_01a_6861

    scf
    bit 1, b
    ret nz

    bit 0, b
    jr z, jr_01a_688b

    ldh a, [$90]
    cp $30
    ret


Call_01a_68a9:
Jump_01a_68a9:
    ldh [$81], a
    ld [$4000], a
    ret


Call_01a_68af:
    dec c
    jr z, jr_01a_68b6

    or a
    bit 0, [hl]
    ret


jr_01a_68b6:
    scf
    ret


Call_01a_68b8:
    ld c, $08

jr_01a_68ba:
    rla
    jr c, jr_01a_68c1

    ld b, $0a
    jr jr_01a_68c4

jr_01a_68c1:
    ld b, [hl]
    ld b, $12

jr_01a_68c4:
    call Call_01a_6991
    dec c
    jr nz, jr_01a_68ba

    push bc
    pop bc
    ld b, $23
    call Call_01a_6991
    ld b, $0a
    call Call_01a_6991
    ret


Call_01a_68d7:
    ld b, $00

jr_01a_68d9:
    call Call_01a_69a0
    jr c, jr_01a_68fa

    cp $1a
    jr nc, jr_01a_68e8

    cp $0f
    rl d
    jr jr_01a_68d9

jr_01a_68e8:
    ldh a, [rP1]
    bit 1, a
    jr z, jr_01a_68fa

    bit 0, [hl]
    jr nz, jr_01a_68e8

    ld a, $0a

jr_01a_68f4:
    dec a
    jr nz, jr_01a_68f4

    ld a, d
    cpl
    ret


jr_01a_68fa:
    xor a
    ret


Call_01a_68fc:
    push hl
    push de
    push bc
    ld hl, $a000
    ld d, a
    ld [hl], $01
    ld c, $00

jr_01a_6907:
    call Call_01a_68af
    jr c, jr_01a_6987

    jr z, jr_01a_6907

    push bc
    pop bc
    push bc
    pop bc
    ld [hl], $00
    ld c, $00

jr_01a_6916:
    call Call_01a_68af
    jr c, jr_01a_6987

    jr nz, jr_01a_6916

    ld a, d
    ld c, $08

jr_01a_6920:
    rla
    jr c, jr_01a_6927

    ld b, $0a
    jr jr_01a_692a

jr_01a_6927:
    ld b, [hl]
    ld b, $12

jr_01a_692a:
    call Call_01a_6991
    dec c
    jr nz, jr_01a_6920

    push bc
    pop bc
    ld b, $0a
    call Call_01a_6991
    xor a
    pop bc
    pop de
    pop hl
    ret


Call_01a_693c:
    push hl
    push de
    push bc
    ld hl, $a000
    ld c, $00
    ld [hl], $00

jr_01a_6946:
    call Call_01a_68af
    jr c, jr_01a_6987

    jr z, jr_01a_6946

    ld [hl], $01
    ld c, $00

jr_01a_6951:
    call Call_01a_68af
    jr c, jr_01a_6987

    jr nz, jr_01a_6951

    push bc
    pop bc
    push bc
    pop bc
    ld [hl], $00
    ld c, $08
    ld b, $00

jr_01a_6962:
    inc b
    jr z, jr_01a_6987

    bit 0, [hl]
    jr z, jr_01a_6962

    ld c, $08

jr_01a_696b:
    call Call_01a_69a0
    jr c, jr_01a_6987

    cp $0f
    rl d
    dec c
    jr nz, jr_01a_696b

    ld c, $00

jr_01a_6979:
    call Call_01a_68af
    jr c, jr_01a_6987

    jr nz, jr_01a_6979

    ld a, d
    cpl
    pop bc
    pop de
    pop hl
    or a
    ret


jr_01a_6987:
    ld [hl], $00
    pop bc
    pop de
    pop hl

Call_01a_698c:
Jump_01a_698c:
jr_01a_698c:
    ld a, $ff
    or a
    scf
    ret


Call_01a_6991:
    push af
    ld a, b
    ld [hl], $01

jr_01a_6995:
    dec a
    jr nz, jr_01a_6995

    ld a, b
    ld [hl], $00

jr_01a_699b:
    dec a
    jr nz, jr_01a_699b

    pop af
    ret


Call_01a_69a0:
    ld b, $00

jr_01a_69a2:
    inc b
    jr z, jr_01a_698c

    bit 0, [hl]
    jr z, jr_01a_69a2

    ld b, $00

jr_01a_69ab:
    inc b
    jr z, jr_01a_698c

    bit 0, [hl]
    jr nz, jr_01a_69ab

jr_01a_69b2:
    inc b
    jr z, jr_01a_698c

    bit 0, [hl]
    jr z, jr_01a_69b2

    or a
    ld a, b
    ret


Call_01a_69bc:
    ld hl, $a000

jr_01a_69bf:
    ldh a, [rP1]
    bit 1, a
    jr z, jr_01a_698c

    ld a, $aa
    call Call_01a_68b8
    call Call_01a_68d7
    cp $55
    jr nz, jr_01a_69bf

    ldh a, [rP1]
    bit 1, a
    jr z, jr_01a_698c

    ld a, $c3
    call Call_01a_68b8
    call Call_01a_68d7
    cp $3c
    jr nz, jr_01a_69bf

    xor a
    ret


Call_01a_69e5:
    ld hl, $a000

jr_01a_69e8:
    ldh a, [rP1]
    bit 1, a
    jr z, jr_01a_698c

    call Call_01a_68d7
    cp $aa
    jr nz, jr_01a_69e8

    ld a, $55
    call Call_01a_68b8
    ldh a, [rP1]
    bit 1, a
    jr z, jr_01a_698c

    call Call_01a_68d7
    cp $c3
    jr nz, jr_01a_69e8

    ld a, $3c
    call Call_01a_68b8
    xor a
    ret


jr_01a_6a0e:
    jp Jump_01a_698c


Call_01a_6a11:
    call Call_01a_69bc
    jr c, jr_01a_6a0e

    ld a, $48
    call Call_01a_68fc
    ld a, $75
    call Call_01a_68fc
    ld hl, $c0f8
    ld c, $08
    jp Jump_01a_6a43


Call_01a_6a28:
jr_01a_6a28:
    call Call_01a_69e5
    jr c, jr_01a_6a0e

    call Call_01a_693c
    cp $48
    jr nz, jr_01a_6a28

    call Call_01a_693c
    cp $75
    jr nz, jr_01a_6a28

    ld hl, $c0f8
    ld c, $08
    jp Jump_01a_6a58


Call_01a_6a43:
Jump_01a_6a43:
    ld b, $00

jr_01a_6a45:
    ld a, b
    add [hl]
    ld b, a
    ld a, [hl+]
    call Call_01a_68fc
    jr c, jr_01a_6a57

    dec c
    jr nz, jr_01a_6a45

    ld a, b
    cpl
    inc a
    call Call_01a_68fc

jr_01a_6a57:
    ret


Call_01a_6a58:
Jump_01a_6a58:
    ld b, $00

jr_01a_6a5a:
    call Call_01a_693c
    jr c, jr_01a_6a0e

    ld [hl+], a
    add b
    ld b, a
    dec c
    jr nz, jr_01a_6a5a

    call Call_01a_693c
    add b
    or a
    jr nz, jr_01a_6a0e

    ret


Call_01a_6a6d:
    di
    ld a, $10
    ldh [rP1], a
    call Call_01a_6a8b
    xor a
    ld [$a000], a
    ret


Call_01a_6a7a:
    xor a
    ld [$a000], a
    call Call_01a_6a87
    ld a, $30
    ldh [rP1], a
    ei
    ret


Call_01a_6a87:
Jump_01a_6a87:
    push af
    xor a
    jr jr_01a_6a8e

Call_01a_6a8b:
    push af
    ld a, $0e

jr_01a_6a8e:
    ld [$0000], a
    pop af
    ret


    call Call_01a_6a6d

jr_01a_6a96:
    call Call_01a_6a28
    jr c, jr_01a_6aad

    jr nz, jr_01a_6a96

    ld hl, $c0f9
    ld a, [hl]
    ld hl, $6abe
    cp $0d
    jr nc, jr_01a_6a96

    call Call_01a_6ab3
    jr jr_01a_6a96

jr_01a_6aad:
    call Call_01a_6a7a
    xor a
    scf
    ret


Call_01a_6ab3:
    add a
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    rst $20
    ld l, d
    db $ed
    ld l, d
    ld hl, sp+$6a
    rra
    ld l, e
    cpl
    ld l, e
    daa
    ld l, e
    ld a, h
    ld l, e
    ld b, b
    ld l, e
    sbc h
    ld l, e
    and [hl]
    ld l, e
    ld h, a
    ld l, e
    call $dc6b
    ld l, e

Call_01a_6ad8:
Jump_01a_6ad8:
    call Call_01a_6cff
    call Call_01a_69bc
    ret c

    ld hl, $c0f8
    ld c, $08
    jp Jump_01a_6a43


    call Call_01a_6a7a
    pop hl
    or a
    ret


    ld hl, $0000
    trap $e6
    ld a, [$0014]
    jp Jump_01a_6ad8


    call Call_01a_6d18
    ld hl, $c400
    call Call_01a_6a58
    ret c

    call Call_01a_6a87
    call Call_01a_6d18
    ld hl, $c500
    ld de, $c400
    trap $6b

jr_01a_6b10:
    call Call_01a_6a8b
    call Call_01a_6ad8
    ret c

    ld hl, $c500
    ld c, $00
    jp Jump_01a_6a43


    call Call_01a_6b88
    ret c

    trap $e9
    jr jr_01a_6b10

    call Call_01a_6b88
    ret c

    trap $e8
    jr jr_01a_6b10

    call Call_01a_6a87
    call Call_01a_6d18
    ld hl, $c500
    trap $ea
    call Call_01a_6a8b
    jp Jump_01a_6ad8


    call Call_01a_6b54
    push bc
    trap $eb
    call Call_01a_6a8b
    call Call_01a_6ad8
    pop bc
    ret c

    ld hl, $c400
    jp Jump_01a_6a43


Call_01a_6b54:
    call Call_01a_6d18
    ld b, $00
    inc c
    dec c
    jr nz, jr_01a_6b5e

    inc b

jr_01a_6b5e:
    ld hl, $c500
    ld de, $c400
    jp Jump_01a_6a87


    call Call_01a_6d18
    ld hl, $c400
    call Call_01a_6a58
    ret c

    call Call_01a_6b54
    trap $ec
    call Call_01a_6a8b
    jp Jump_01a_6ad8


    call Call_01a_6b88
    ret c

    trap $ef
    call Call_01a_6a8b
    jp Jump_01a_6ad8


Call_01a_6b88:
    ld hl, $c500
    ld c, $00
    call Call_01a_6a58
    ret c

    call Call_01a_6a87
    call Call_01a_6d18
    ld hl, $c500
    or a
    ret


    call Call_01a_69bc
    ret c

    call Call_01a_6d18
    jp Jump_01a_6a43


    ldh a, [$81]
    push af
    call Call_01a_6d18
    call Call_01a_6c05
    ld de, $c400
    call Call_01a_6a87
    push de
    push bc

jr_01a_6bb7:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_01a_6bb7

    call Call_01a_6a8b
    call Call_01a_69bc
    ret c

    pop bc
    pop hl
    call Call_01a_6a43
    pop af
    jp Jump_01a_68a9


    call Call_01a_6d18
    ld l, e
    ld h, d

Call_01a_6bd2:
    call Call_01a_6a58
    jr c, jr_01a_6bdb

    sub b
    call Call_01a_68fc

jr_01a_6bdb:
    ret


    ldh a, [$81]
    push af
    call Call_01a_6d18
    ld hl, $c400
    push hl
    push de
    push bc
    call Call_01a_6bd2
    pop bc
    pop hl
    pop de
    jr c, jr_01a_6c01

    call Call_01a_6c05
    ld a, $0a
    ld [$0000], a

jr_01a_6bf8:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_01a_6bf8

    call Call_01a_6a8b

jr_01a_6c01:
    pop af
    jp Jump_01a_68a9


Call_01a_6c05:
    push hl
    ld a, b
    rl h
    rla
    rl h
    rla
    rl h
    rla
    call Call_01a_68a9
    pop hl
    ld a, h
    and $1f
    or $a0
    ld h, a
    ret


    call Call_01a_6a6d
    ld a, $00
    ld [$c0f9], a
    call Call_01a_6a11
    jr jr_01a_6c7b

    call Call_01a_6c81
    jr c, jr_01a_6c7b

    jr jr_01a_6c78

    ld a, $02
    call Call_01a_6ceb
    ld l, e
    ld h, d
    jr jr_01a_6c43

    ld a, $05
    jr jr_01a_6c3e

    ld a, $03

jr_01a_6c3e:
    call Call_01a_6ceb
    ld c, $00

jr_01a_6c43:
    call Call_01a_6a43
    jr c, jr_01a_6c7b

    call Call_01a_6d18
    push hl
    call Call_01a_6c81
    pop hl
    jr c, jr_01a_6c7b

    ld c, $00
    call Call_01a_6a58
    jr c, jr_01a_6c7b

    jr jr_01a_6c78

    ld a, $04
    call Call_01a_6ceb
    call Call_01a_6c81
    jr c, jr_01a_6c7b

    jr jr_01a_6c78

    ld a, $06
    call Call_01a_6ceb
    ld c, $00
    call Call_01a_6a43
    jr c, jr_01a_6c7b

    call Call_01a_6c81
    jr c, jr_01a_6c7b

jr_01a_6c78:
    call Call_01a_6d18

jr_01a_6c7b:
    push af
    call Call_01a_6a7a
    pop af
    ret


Call_01a_6c81:
    call Call_01a_69e5
    jr c, jr_01a_6c7b

    ld hl, $c0f8
    ld c, $08
    jp Jump_01a_6a58


    ld a, $09
    jr jr_01a_6c94

    ld a, $08

jr_01a_6c94:
    call Call_01a_6ceb
    push de
    push bc
    call Call_01a_69e5
    pop bc
    pop hl
    jr c, jr_01a_6c7b

    call Call_01a_6a58
    jr jr_01a_6c7b

    ld a, $0c
    jr jr_01a_6cab

    ld a, $0b

jr_01a_6cab:
    call Call_01a_6ceb
    call Call_01a_6a43
    jr c, jr_01a_6c7b

    call Call_01a_693c
    jr c, jr_01a_6c7b

    add b
    jr nz, jr_01a_6cbe

    xor a
    jr jr_01a_6c7b

jr_01a_6cbe:
    call Call_01a_698c

jr_01a_6cc1:
    jr jr_01a_6c7b

    ld a, $07
    call Call_01a_6ceb
    push de
    push bc
    call Call_01a_6c81
    pop bc
    pop hl
    jr c, jr_01a_6c7b

    call Call_01a_6a58
    jr c, jr_01a_6c7b

    jr jr_01a_6c78

    ld a, $0a
    call Call_01a_6ceb
    ld l, e
    ld h, d
    call Call_01a_6a43
    jr c, jr_01a_6c7b

    call Call_01a_6c81
    jr c, jr_01a_6c7b

    jr jr_01a_6c78

Call_01a_6ceb:
    push hl
    push de
    push bc
    call Call_01a_6cff
    call Call_01a_6a6d
    call Call_01a_6a11
    pop bc
    pop de
    pop hl
    ret nc

    inc sp
    inc sp
    jr jr_01a_6cc1

Call_01a_6cff:
    push de
    push hl
    push af
    ld hl, $c0f8
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    ld [hl], c
    inc hl
    ld [hl], b
    ret


Call_01a_6d18:
    ld hl, $c0f8
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push de
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push de
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    pop hl
    pop af
    ret


    ld b, [hl]
    inc hl
    push hl
    trap $c6
    jp c, Jump_01a_6d4f

    ldh [$a1], a
    ld a, b
    pop bc

jr_01a_6d3b:
    push af
    ld a, [bc]
    inc bc
    add e
    ld [hl+], a
    ld a, [bc]
    inc bc
    add d
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    pop af
    dec a
    jr nz, jr_01a_6d3b

    push hl

Jump_01a_6d4f:
    pop hl
    ldh a, [$a1]
    ret


    ld hl, $c3ca
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c3cc
    ld [hl], $01
    inc hl
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], b
    inc hl
    ld [hl+], a
    ld [hl], $ef
    ld h, b
    ld l, $00
    xor a

jr_01a_6d6d:
    ld [hl], a
    inc l
    jr nz, jr_01a_6d6d

    ret


    push hl
    push de

jr_01a_6d74:
    push bc
    call Call_01a_6d83
    ld [de], a
    inc de
    pop bc
    dec bc
    ld a, c
    or b
    jr nz, jr_01a_6d74

    pop de
    pop hl
    ret


Call_01a_6d83:
    ld hl, $c3d0
    ld a, [hl]
    or a
    jr z, jr_01a_6d96

    dec [hl]
    inc hl

jr_01a_6d8c:
    ld b, [hl]
    inc hl
    ld c, [hl]
    inc [hl]
    inc hl
    ld a, [bc]
    ld c, [hl]
    inc [hl]
    ld [bc], a
    ret


jr_01a_6d96:
    ld hl, $c3ca
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc hl
    dec [hl]
    inc hl
    jr nz, jr_01a_6da8

    dec hl
    ld [hl], $08
    inc hl
    ld a, [bc]
    inc bc
    ld [hl], a

jr_01a_6da8:
    rl [hl]
    ld a, [bc]
    inc bc
    jr nc, jr_01a_6dbe

    ld hl, $c3ca
    ld [hl], c
    inc hl
    ld [hl], b
    ld hl, $c3d1
    ld b, [hl]
    inc hl
    inc hl
    ld c, [hl]
    inc [hl]
    ld [bc], a
    ret


jr_01a_6dbe:
    ld [$c3d2], a
    ld hl, $c3ce
    bit 0, [hl]
    jr nz, jr_01a_6dde

    set 0, [hl]
    inc hl
    ld a, [bc]
    inc bc
    ld [hl+], a
    swap a

jr_01a_6dd0:
    and $0f
    inc a
    ld [hl+], a
    push hl
    ld hl, $c3ca
    ld [hl], c
    inc hl
    ld [hl], b
    pop hl
    jr jr_01a_6d8c

jr_01a_6dde:
    res 0, [hl]
    inc hl
    ld a, [hl+]
    jr jr_01a_6dd0

    trap $ed
    ret nc

    push hl
    push de
    ld bc, $000c
    add hl, bc
    ld c, [hl]
    ld hl, $c400
    xor a
    ld [hl+], a
    ld [hl-], a

jr_01a_6df4:
    push bc
    call Call_01a_714d
    pop bc
    jr c, jr_01a_6e2b

    ld a, [$c409]
    ld b, a
    bit 4, b
    jr z, jr_01a_6df4

    ld a, [$c40c]
    cp c
    jr nz, jr_01a_6df4

    ld de, $000d
    add hl, de
    ld a, [$c40b]
    sub $61
    bit 3, b
    jr z, jr_01a_6e18

    sub $60

jr_01a_6e18:
    ld e, a
    add hl, de
    pop de
    push de
    ld c, $60

jr_01a_6e1e:
    ld a, [hl+]
    ld [de], a
    inc de
    bit 3, b
    jr z, jr_01a_6e26

    ld a, [hl+]

jr_01a_6e26:
    ld [de], a
    inc de
    dec c
    jr nz, jr_01a_6e1e

jr_01a_6e2b:
    pop de
    pop hl
    ret


    trap $e0
    ld hl, $4000
    ld de, $fe00

jr_01a_6e36:
    inc hl
    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push hl
    ld a, $08
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ld a, [hl]
    pop hl
    inc hl
    inc hl
    inc hl
    push bc
    push de
    ld b, a
    ld c, $ff
    push bc
    push hl
    ld hl, sp+$00
    ld bc, $0004
    trap $e5
    pop hl
    pop bc
    pop de
    pop hl
    inc e
    ld a, l
    or h
    jr nz, jr_01a_6e36

    trap $09
    ret


    add sp, -$04
    push hl
    ld hl, sp+$02
    ld d, $fe
    ld bc, $0004
    trap $e4
    pop bc
    pop hl
    pop de
    ld a, l
    or h
    jr z, jr_01a_6e7f

    ld a, e
    cp $ff
    jp z, Jump_01a_71a1

    trap $fc
    ret


jr_01a_6e7f:
    ld l, c
    ld h, b
    xor a
    ld [hl+], a
    ld [hl-], a
    scf
    ret


jr_01a_6e86:
    cp c
    ld c, a
    ld b, a
    jr nz, jr_01a_6e8e

    ld c, $00
    ld b, c

jr_01a_6e8e:
    ld a, [hl+]
    or a
    ret z

    cp $22
    jr z, jr_01a_6e86

    cp $27
    jr z, jr_01a_6e86

    inc b
    dec b
    jr nz, jr_01a_6ea1

    trap $f8
    jr jr_01a_6e8e

jr_01a_6ea1:
    cp $40
    jr z, jr_01a_6ec5

    cp $25
    jr z, jr_01a_6ed2

    cp $3b
    jr z, jr_01a_6eda

    cp $2b
    jr z, jr_01a_6ee4

    cp $5b
    jr z, jr_01a_6eea

    cp $5d
    jr z, jr_01a_6ef0

    inc c
    dec c
    jr z, jr_01a_6ec1

    trap $f9
    jr jr_01a_6e8e

jr_01a_6ec1:
    trap $f8
    jr jr_01a_6e8e

jr_01a_6ec5:
    ld a, $30
    call Call_01a_6efc
    ld a, $35
    trap $f8
    ld c, $00
    jr jr_01a_6e8e

jr_01a_6ed2:
    ld a, $32
    call Call_01a_6ef7
    ld c, b
    jr jr_01a_6e8e

jr_01a_6eda:
    ld a, $23
    trap $f8
    ld a, $23
    trap $f8
    jr jr_01a_6e8e

jr_01a_6ee4:
    ld c, $00
    ld a, $38
    jr jr_01a_6ef2

jr_01a_6eea:
    ld c, $00
    ld a, $34
    jr jr_01a_6ef2

jr_01a_6ef0:
    ld a, $36

jr_01a_6ef2:
    call Call_01a_6efc
    jr jr_01a_6e8e

Call_01a_6ef7:
    push af
    call Call_01a_6efc
    pop af

Call_01a_6efc:
    push af
    ld a, $2a
    trap $f8
    pop af
    trap $f8
    ret


    ld c, l
    ld b, h
    ld hl, sp+$00
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    inc de
    push af
    push de
    push bc
    and $7f
    ld c, a
    ld b, $00
    add a
    add e
    ld e, a
    ld a, b
    adc d
    ld d, a
    ld [hl], d
    dec hl
    ld [hl], e
    pop hl
    dec hl
    ld a, l
    sub c
    ld a, h
    sbc b
    pop de
    pop bc
    ret nc

    add hl, hl
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    add hl, de
    bit 7, b
    jr nz, jr_01a_6f34

    pop af

jr_01a_6f34:
    jp hl


    push bc
    push de
    push hl
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ld hl, sp+$07
    ld b, [hl]
    dec hl
    ld c, [hl]
    dec hl
    ld d, [hl]
    dec hl
    ld e, [hl]
    dec hl
    ld a, [hl]
    dec hl
    ld l, [hl]
    ld h, a
    ld a, [hl+]
    sub e
    ld a, [hl]
    sbc d
    dec hl
    jr z, jr_01a_6f62

    ld a, [hl]
    add c
    ld [hl], a
    inc hl
    ld a, [hl]
    adc b
    ld [hl], a
    ld hl, sp+$08
    add sp, $02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


jr_01a_6f62:
    pop hl
    add sp, $08
    jp hl


    push bc

jr_01a_6f67:
    dec bc
    ld a, [hl+]
    cp e
    jr z, jr_01a_6f72

    ld a, b
    or c
    jr nz, jr_01a_6f67

    pop bc
    push bc

jr_01a_6f72:
    pop hl
    ld a, l
    sub c
    ld l, a
    ld a, h
    sbc b
    ld h, a
    ret


Call_01a_6f7a:
jr_01a_6f7a:
    ld a, [de]
    cp [hl]
    jr nz, jr_01a_6f89

    inc de
    inc hl
    dec bc
    ld a, b
    or c
    jr nz, jr_01a_6f7a

    ld hl, $0000
    ret


jr_01a_6f89:
    sbc a
    ld h, a
    add a
    inc a
    ld l, a
    ret


    ld d, h
    ld e, l
    ld hl, $0000

jr_01a_6f94:
    ld a, [de]
    or a
    ret z

    inc de
    inc hl
    jr jr_01a_6f94

Call_01a_6f9b:
jr_01a_6f9b:
    ldh a, [$92]
    ld e, a
    ld a, [hl+]
    or a
    ret z

    bit 6, e
    jr nz, jr_01a_6fb3

    cp $20
    jr c, jr_01a_6fd6

    ld e, a
    ld d, [hl]
    trap $a7
    jr nc, jr_01a_6fb3

    inc hl
    or a
    jr z, jr_01a_6fba

jr_01a_6fb3:
    trap $bb
    jr jr_01a_6f9b

jr_01a_6fb7:
    xor a
    jr jr_01a_6fb3

jr_01a_6fba:
    ldh a, [$92]
    bit 3, a
    jr z, jr_01a_6fb7

    push bc
    push hl
    ld c, a
    ld a, d
    ld d, e
    ld e, a
    ld b, $01
    ld hl, $c3e0
    trap $1b
    ld hl, $c3e0
    trap $be
    pop hl
    pop bc
    ld a, $01

jr_01a_6fd6:
    trap $b9
    jr jr_01a_6f9b

jr_01a_6fda:
    ld a, [hl]
    or a
    ret z

    push hl
    ld l, e
    ld h, d
    trap $b8
    pop hl
    push de
    call Call_01a_6f9b
    pop de
    inc e
    jr jr_01a_6fda

    xor a
    ld b, a
    ld [hl+], a
    ld [hl-], a
    ld a, c
    or a
    jr nz, jr_01a_6ffc

    inc b
    push de

jr_01a_6ff5:
    inc de
    inc c
    ld a, [de]
    or a
    jr nz, jr_01a_6ff5

    pop de

jr_01a_6ffc:
    push de
    push bc
    call Call_01a_714d
    pop bc
    pop de
    jr c, jr_01a_700c

    call Call_01a_7029
    jr nz, jr_01a_6ffc

    xor a
    ret


jr_01a_700c:
    push hl
    xor a
    ld [hl+], a
    ld [hl+], a
    ld b, $00
    ld a, $08
    add l
    ld l, a
    ld a, b
    adc h
    ld h, a
    ld a, [$0014]
    ld [hl+], a
    ld [hl], c
    inc hl

jr_01a_701f:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_01a_701f

    pop hl
    xor a
    scf
    ret


Call_01a_7029:
    push hl
    push de
    push bc
    ld a, $09
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ld a, b
    or a
    jr z, jr_01a_704a

    ld b, [hl]
    bit 4, b
    jr z, jr_01a_704a

    inc hl
    inc hl
    ld a, [hl+]
    sub $60
    bit 3, b
    jr z, jr_01a_704d

    sub $60
    jr jr_01a_704d

jr_01a_704a:
    inc hl
    inc hl
    ld a, [hl+]

jr_01a_704d:
    cp c
    jr nz, jr_01a_7057

    ld b, $00
    call Call_01a_6f7a
    ld a, h
    or l

jr_01a_7057:
    pop bc
    pop de
    pop hl
    ret


Jump_01a_705b:
    pop de
    push de
    ld hl, $c500
    ld bc, $00ff
    trap $02
    ld hl, $c400
    xor a
    ld [hl+], a
    ld [hl-], a

jr_01a_706b:
    call Call_01a_714d
    jr c, jr_01a_70af

    ld a, [$c409]
    and $04
    jr z, jr_01a_706b

    ld a, [$c40c]
    and $7f
    ld b, a
    ld a, [$c50c]
    and $7f
    cp b
    jr nz, jr_01a_706b

    ld a, [$c40a]
    or a
    jr z, jr_01a_7092

    ld b, a
    ld a, [$0014]
    cp b
    jr nz, jr_01a_706b

jr_01a_7092:
    ld a, [$c402]
    cp $ff
    jr z, jr_01a_70aa

    ld hl, $c400
    call Call_01a_7118
    trap $fb
    ld d, h
    ld e, l

jr_01a_70a3:
    pop bc
    ld sp, $e000
    push de
    jr jr_01a_70fc

jr_01a_70aa:
    call Call_01a_7129
    jr jr_01a_70a3

jr_01a_70af:
    pop hl
    ld de, $c500
    ld bc, $00ff
    trap $02
    scf
    ret


    ld a, [hl+]
    or [hl]
    dec hl
    ret z

    xor a
    ldh [$b7], a
    push hl
    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    cp $ff
    jr z, jr_01a_70eb

    call Call_01a_7118
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    or a
    jr z, jr_01a_70de

    ld a, [$0014]
    cp [hl]
    jr z, jr_01a_70de

    pop hl
    scf
    ret


jr_01a_70de:
    dec hl
    ld a, [hl]
    and $04
    jp z, Jump_01a_705b

    trap $fb
    ld d, h
    ld e, l
    jr jr_01a_70ee

jr_01a_70eb:
    call Call_01a_7129

jr_01a_70ee:
    pop bc
    ld sp, $e000
    push de
    call Call_01a_710d
    ld hl, $c500
    xor a
    ld [hl+], a
    ld [hl], a

jr_01a_70fc:
    ld hl, $c600

Jump_01a_70ff:
    ld e, $00
    ld bc, $df00
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    trap $a6
    ret


Call_01a_710d:
    ld hl, $c400
    ld d, b
    ld e, c
    ld bc, $00ff
    trap $02
    ret


Call_01a_7118:
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld a, [hl]
    inc hl
    ldh [$97], a
    inc hl
    inc hl
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl+]
    adc d
    ld d, a
    ret


Call_01a_7129:
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld a, [hl]
    inc hl
    inc hl
    inc hl
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl+]
    adc d
    ld d, a
    ret


    ldh a, [$80]
    ld e, a
    ldh a, [$81]
    ld d, a
    push de
    push hl
    ld hl, sp+$00
    ld de, $ff3c
    ld bc, $0004
    trap $e5
    pop hl
    pop de
    ret


Call_01a_714d:
    ld a, [hl+]
    or [hl]
    jr z, jr_01a_7158

    inc hl
    ld a, [hl]
    dec hl
    cp $ff
    jr z, jr_01a_715f

jr_01a_7158:
    dec hl
    trap $e8
    ret nc

    xor a
    ld [hl+], a
    ld [hl], a

jr_01a_715f:
    dec hl
    ld c, l
    ld b, h
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, h
    or l
    jr z, jr_01a_719a

    ld de, $fffa
    add hl, de
    jr nc, jr_01a_7173

    ld a, h
    rlca
    jr nc, jr_01a_7177

jr_01a_7173:
    ld l, c
    ld h, b
    scf
    ret


jr_01a_7177:
    ld e, l
    ld d, h
    ld a, [hl+]
    cpl
    cp [hl]
    jr nz, jr_01a_7173

    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    or h
    jr z, jr_01a_7173

    ld a, h
    cp d
    jr c, jr_01a_718f

    jr nz, jr_01a_7173

    ld a, l
    cp e
    jr nc, jr_01a_7173

jr_01a_718f:
    ld a, [hl]
    cp $52
    jr z, jr_01a_719d

    cp $5a
    jr nz, jr_01a_7177

    jr jr_01a_719d

jr_01a_719a:
    ld hl, $4000

jr_01a_719d:
    ld de, $0006
    add hl, de

Jump_01a_71a1:
    ld e, l
    ld d, h
    push bc
    ld l, c
    ld h, b
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $ff
    ld [hl+], a
    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld b, a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld c, a
    push bc

jr_01a_71c4:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_01a_71c4

    pop bc
    pop hl
    ld de, $002e
    bit 0, b
    jr nz, jr_01a_71d4

    ld e, d

jr_01a_71d4:
    ld a, $05
    add c
    ld c, a
    add e
    ld e, a
    ld a, d
    adc a
    ld [hl], e
    inc hl
    ld [hl], a
    inc hl
    ld [hl], e
    inc hl
    ld [hl], a
    pop hl
    xor a
    ret


    trap $e1
    ret c

    push hl
    ld de, $ff45
    ld bc, $0001
    ld hl, sp+$00
    trap $e4
    pop hl
    bit 0, l
    ret z

    call Call_01a_7227
    bit 0, a
    ret nz

    bit 1, a
    jr nz, jr_01a_7225

    add sp, -$04
    ld hl, sp+$00
    ld de, $ff3c
    ld bc, $0004
    trap $e4
    pop de
    pop bc
    ld a, d
    or e
    jr z, jr_01a_7225

    ld a, c
    ldh [$80], a
    ld [$2000], a
    ld a, b
    ldh [$81], a
    ld [$4000], a
    push de
    ret


    call Call_01a_7227

jr_01a_7225:
    trap $01

Call_01a_7227:
    trap $11
    trap $53
    ld a, $a4
    ld bc, $0102
    ld de, $0f10
    ld h, $00
    trap $b3
    ld de, $72e7
    ld bc, $c400
    trap $62
    ld de, $c600
    ld bc, $08f0
    trap $63
    ld de, $020c
    ld hl, $c600
    ld bc, $0b68
    trap $c0
    ld a, $01
    trap $b4
    ld a, $f0
    trap $dc
    bit 2, a
    jp nz, Jump_01a_66ee

    ret


    ld d, a
    push hl
    ld hl, $72d2

jr_01a_7265:
    ld a, [hl]
    cp $ff
    jr z, jr_01a_7275

    ld a, d
    or a
    jr z, jr_01a_7278

    inc hl
    inc hl
    inc hl
    inc hl
    dec d
    jr jr_01a_7265

jr_01a_7275:
    pop hl
    scf
    ret


jr_01a_7278:
    ld d, [hl]
    inc hl
    ld a, [hl+]
    dec a
    cp e
    jr c, jr_01a_7275

    sub e
    dec b
    cp b
    jr nc, jr_01a_7285

    ld b, a

jr_01a_7285:
    inc b
    ld c, b
    ld b, $00
    jr nz, jr_01a_728c

    inc b

jr_01a_728c:
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, d
    ld d, $00
    or a
    jr z, jr_01a_72af

    ld a, $04

jr_01a_7297:
    sla e
    rl d
    sla c
    rl b
    dec a
    jr nz, jr_01a_7297

    add hl, de
    ld e, l
    ld d, h
    pop hl
    push bc
    push hl
    trap $02
    pop hl
    pop bc
    add hl, bc
    or a
    ret


jr_01a_72af:
    ld b, e
    push bc
    ld e, l
    ld d, h
    ld bc, $c400
    trap $62
    pop bc
    pop hl

jr_01a_72ba:
    push hl
    push bc
    ld d, h
    ld e, l
    ld bc, $0010
    push bc
    trap $63
    pop de
    pop bc
    pop hl
    ld a, b
    dec b
    or a
    jr nz, jr_01a_72ba

    inc b
    add hl, de
    dec c
    jr nz, jr_01a_72ba

    ret


    nop
    rst $00
    or d
    ld d, b
    nop
    jr c, jr_01a_730c

    ld e, l
    nop
    adc a

jr_01a_72dc:
    rst $20
    ld [hl], d
    db $10
    ld b, $28
    ld b, b
    db $10
    add hl, bc
    ld [hl], b
    ld a, a

jr_01a_72e6:
    rst $38
    xor e
    rra
    rst $28
    ld de, $f31b
    jr jr_01a_72e6

    add b
    ld e, $1e
    adc e
    rra
    inc bc
    ld bc, $f701
    inc e
    dec bc
    ld [bc], a
    add hl, de
    jr jr_01a_72dc

    dec de
    add hl, de
    di
    rra
    add hl, de
    rra
    inc e
    inc b
    db $10
    ld b, b
    di
    add hl, de
    rrca
    rrca

jr_01a_730c:
    ld [hl+], a
    inc sp
    rst $38
    ld b, h
    ld d, l
    rst $38
    ld h, [hl]
    dec c
    ld [hl], a
    db $f4
    rst $30
    rst $28
    daa
    and $01
    inc bc
    sbc l
    nop
    rlca
    call nz, $070f
    and b
    and h
    and c
    and e
    rlca
    sbc a
    nop
    sbc l
    ld l, $9b
    ld [bc], a
    db $eb
    rst $38
    cp a
    ld de, $8fcf
    sbc a
    rst $28
    db $dd
    dec c
    dec c

jr_01a_7338:
    sbc b
    jr nc, jr_01a_733b

jr_01a_733b:
    inc bc
    ld bc, $0fb4
    rst $38
    ld b, $1e
    inc c
    inc a
    jr @+$7a

    jr nc, jr_01a_7338

    cp $60
    ldh [$c0], a
    ret nz

    add b
    add b
    nop
    db $e3
    nop
    rra
    pop hl

jr_01a_7354:
    rst $18
    nop
    db $dd
    ld hl, sp+$30
    db $fc
    sbc b
    cp $fd
    call z, $66ff
    ld a, a
    inc sp
    ccf
    jr jr_01a_7365

jr_01a_7365:
    inc c
    jr nz, @-$29

    or [hl]
    inc de
    ld bc, $05ba
    rst $38
    ld d, $27
    rst $38
    jr c, jr_01a_738c

    ld c, c
    or $bb
    sub [hl]
    ld b, d
    cp [hl]
    ld a, a
    cp a
    cp a
    nop
    rst $20
    ld d, [hl]
    ld [hl], b
    jp $05e0


    rst $00
    ld [hl], a
    jp Jump_01a_73c3


    nop
    ld [hl], $71
    ld l, e

jr_01a_738c:
    ld b, h
    cp l
    ld a, [hl]
    cp l
    adc a
    add [hl]
    ld a, [hl]
    ld de, $c1ff
    cp a
    sbc h
    ld a, a
    ld a, $f7
    ld h, e
    db $e3
    pop bc
    pop bc
    pop bc
    ld [c], a
    and h
    ld sp, hl
    or b
    ld bc, $ff00
    add a
    db $ec
    inc bc
    trap $86
    pop af
    nop
    db $fc
    ld a, b
    db $ed
    and c
    nop
    jr jr_01a_7354

    sbc l
    nop
    sbc e
    ld a, $1c
    or b
    rst $38
    jp hl


    ld a, [$1aff]
    dec bc
    inc e
    ld sp, hl

Jump_01a_73c3:
    ld e, [hl]

Call_01a_73c4:
    add a
    rlca
    ld [hl], a
    ld [bc], a
    rst $20
    dec a
    jp c, $47c7

    add hl, sp
    rlca
    rlca
    rst $30
    ld b, a
    rst $20
    ld d, b
    nop
    ld sp, $4141
    ld bc, $07c7
    ld b, h
    dec l
    ld h, b
    and e
    ret nz

    ei
    add b
    ldh [$c0], a
    ldh a, [$60]
    call $fc00
    sbc b
    ld a, a
    ret


    rst $38
    ld h, [hl]
    ld a, a
    inc sp
    ccf
    add hl, de
    rra
    ld hl, sp+$0c
    rrca
    ld b, $07
    inc bc
    jp $8000


    jp Jump_000_3f00


    ld a, l
    ld a, e
    nop
    ld e, $0c
    inc a
    jr jr_01a_747f

    jr nc, @-$22

    pop af
    ld h, b
    pop de
    rst $00
    add e
    adc a
    adc b
    ld d, b
    ld l, e
    db $fd
    push hl
    jp $bfff


    cp l
    ld a, $25
    adc c
    dec b
    or $03
    ccf
    ccf
    dec a
    and h
    ld b, $01
    or c
    nop
    ld b, b
    or c
    ld bc, $015d
    add b
    ret z

    ld l, a
    ld e, $e3
    rst $38
    dec h
    ld h, a
    inc l
    ld [de], a
    db $fc
    cp $2f
    ld h, b
    nop
    rst $28
    rst $18
    trap $8c
    trap $11
    dec bc
    ld c, h
    rrca
    db $fd
    cp $fd
    xor d
    inc [hl]
    ld a, a
    ld h, l
    add a
    cp h
    sbc b
    sbc [hl]
    adc h
    adc [hl]
    add [hl]
    adc [hl]
    ld a, a
    sub [hl]
    ld hl, sp-$28
    ret c

    sbc b
    sbc b
    jr jr_01a_7493

    rst $38
    jr jr_01a_746e

    jr c, jr_01a_7498

    jr nc, jr_01a_7482

    ld [hl], b
    ld h, b
    ld c, a
    ld c, c
    ld bc, $44c0
    ret z

    ld bc, $0303
    rlca

jr_01a_746e:
    rlca
    rst $38
    ld c, $3f
    inc e
    rst $38
    ld a, c
    rst $20
    di
    xor [hl]
    rst $38
    rst $00
    ld c, $0e
    inc c
    inc e
    dec a

jr_01a_747f:
    jr jr_01a_7492

    rst $38

jr_01a_7482:
    dec sp
    ld [hl], a
    ccf
    db $fd
    ld a, [hl]
    db $f4
    ld hl, sp-$30
    or [hl]
    ldh [$6e], a
    ret nz

    add c
    sub l
    inc d
    pop bc

jr_01a_7492:
    add c

jr_01a_7493:
    sbc h
    ld a, [bc]
    inc [hl]
    rst $38
    or e

jr_01a_7498:
    push af
    pop af
    ld b, $0f
    reti


    db $10
    adc a
    db $dd
    ld d, l
    inc de
    ld bc, $dfcf
    adc a
    call c, $0f10
    ld [c], a
    rst $28
    nop
    inc de
    ld [de], a
    ldh a, [rNR14]
    nop
    inc de
    call c, $d900
    dec l
    rst $38
    dec c
    ld c, a
    ld e, $e3
    jr jr_01a_74ec

    ld h, l
    ld b, b
    ld [hl], b
    jr nc, jr_01a_7522

    ld [hl], b
    ld a, a
    ld e, l
    jp nz, $cbe1

    rst $00
    adc $9f
    ld hl, sp-$01
    dec a
    ei
    ld [hl], c
    db $e3
    db $e3
    add a
    rst $00
    rlca
    rst $38
    adc [hl]
    ld c, $1c
    rra
    add hl, sp
    ld a, a
    ld [hl], e
    cp $fc
    rst $20
    db $fc
    adc $38
    sbc h
    jr nc, @+$3b

    db $10
    ccf
    cp l

jr_01a_74e9:
    ld h, b
    sub d
    ld a, [de]

jr_01a_74ec:
    pop bc
    ret nz

    add b
    pop bc
    sbc e
    ld bc, $00f4
    inc bc
    ld bc, $7b03
    jr nz, jr_01a_74fb

    ld [hl], a

jr_01a_74fb:
    add d
    rst $38
    ld a, $c4
    dec hl
    jr nz, jr_01a_74e9

    db $e3
    rst $20
    rst $20
    rst $28
    xor h
    ret z

    rst $28
    rst $38
    or b
    ld [bc], a
    trap $fe
    or e
    ld [hl-], a
    trap $f0
    jr nz, jr_01a_7524

    xor e
    xor e
    nop
    ld c, e
    db $e3
    db $fd
    rst $38
    db $dd
    rra
    push af
    jr nc, jr_01a_759f

    dec [hl]
    ld b, c

jr_01a_7522:
    ld [hl], a
    ccf

jr_01a_7524:
    rst $38
    ld a, a
    or $f8
    ret nz

    ld l, a
    ld h, h
    add b
    ret nz

    ld l, b
    ld bc, $8000
    dec bc
    rlca
    ld hl, sp+$5f
    ccf
    ld a, d
    db $fc
    ldh a, [$15]
    sbc c
    ld b, b
    dec e
    rst $38
    rrca
    rra
    ld a, [hl-]
    inc a
    ld h, b
    ld [hl], b
    ld b, b
    ldh [$7f], a
    ld h, a

jr_01a_7548:
    ld [bc], a
    add e
    pop bc
    rst $00
    add e
    adc a
    add [hl]
    sbc [hl]
    rst $38
    adc h
    cp h
    sbc b
    ld a, b
    jr nc, jr_01a_7548

    ld h, b
    db $e3
    ld a, a
    ld a, [hl-]
    ld b, $9e
    inc c
    call c, $fe8c
    call z, $ffff
    ld h, [hl]
    ld a, a
    inc sp
    ccf
    add hl, de
    rra
    inc c
    and $0f
    ld b, $07
    ld a, [hl]
    or $cf
    ld bc, $aa03
    db $10
    cp a
    rst $00
    ld a, h
    jp $8187


    add e
    add a
    rlca
    ld a, [hl-]
    add h
    ld b, b
    add e
    add a
    add a
    rst $00
    adc [hl]
    nop
    rst $00
    ld a, e
    ld b, b
    xor e
    nop
    rst $30
    sub [hl]
    sbc c
    rra
    call $ffad
    cp [hl]
    call z, Call_000_01b0
    jr @+$1a

    rrca
    pop de
    jr z, jr_01a_75ce

    ld h, c

jr_01a_759f:
    ld e, a
    nop
    ld e, l
    trap $fb
    add $de
    call z, $183c
    ld b, e
    add d
    ld e, $0c
    halt
    ld bc, $60f0
    ldh [$ef], a
    add hl, bc
    add b
    add b
    call z, $190f
    nop
    rla
    dec d
    nop
    inc de
    ld hl, sp+$30
    db $fc
    sbc b
    jr z, @+$53

    add $9f
    add b
    rst $28
    ld [bc], a
    ldh [rWY], a
    ld c, c
    nop
    ld b, a

jr_01a_75ce:
    add sp, -$1f
    ldh [$e1], a
    ld a, c
    ld bc, $79e3
    ld e, d
    db $10
    ld a, c
    jr nz, jr_01a_7630

    nop
    ld d, e
    ld [c], a
    ld e, h
    ld e, a
    sbc l
    ld a, l
    rst $38
    adc [hl]
    sbc a
    rst $38
    ld de, $f2b0
    ld sp, $e029
    dec l
    nop
    ld bc, $000d
    ld a, a
    cp $06
    rst $38
    ld [hl], e
    rst $38
    ld sp, hl
    rst $18
    adc h
    dec bc
    nop
    dec a
    nop
    ld sp, hl
    rst $30
    rrca
    ldh [$c2], a
    db $10
    rst $18
    db $dd
    nop
    dec a
    dec de
    dec sp
    nop
    trap $cd
    nop
    ld a, b
    jr nc, jr_01a_763c

    and $c6
    db $fc
    trap $8f
    adc a
    rrca
    rlca
    rlca
    add hl, bc
    rrca
    ld l, a
    ld a, e
    jp nz, Jump_01a_7e10

    db $fc
    cp $fe
    inc h
    add sp, -$24
    di
    ldh [$f0], a
    db $fc
    ld hl, sp+$26
    ld bc, $fe24

jr_01a_7630:
    ld a, $78
    inc hl
    rra
    ld hl, sp-$04
    add sp, -$10
    ld l, l
    ld c, l
    rst $38
    ld e, [hl]

jr_01a_763c:
    ld e, $6f
    rst $38
    add b
    sub c
    pop af
    add b
    nop
    ret nz

    add b

jr_01a_7646:
    rst $00
    cp a
    ld h, b
    rlc b
    db $fc
    sbc b
    cp $cc
    rst $38
    ld h, [hl]
    db $fd
    ld a, a
    inc sp
    ccf
    add hl, de
    rra
    inc c
    ei
    ld c, $77
    db $fc
    ld b, b
    ld sp, $61f0
    and a
    ret nz

    add e
    add e
    ld b, l
    ld sp, hl
    nop
    rlca
    or $9d
    ld b, b
    add $e0
    pushx @ + $ce1f
    rst $20
    add $fe
    xor $3f
    sbc [hl]
    db $10
    cpl
    rra
    ccf
    ld hl, sp+$7f
    rst $38
    ld a, a
    ld a, l
    ei
    inc h
    ldh [rP1], a
    or $7b
    push af
    ld [bc], a
    ccf
    rra
    ld b, a
    rst $28
    db $fd
    dec a
    ld a, [hl]
    ld d, b
    dec a
    ld bc, $0ff8
    jr @+$15

    rst $38
    inc h
    dec [hl]
    rst $38
    ld b, [hl]
    rra
    ld d, a
    rst $38
    ld l, b
    ld [hl], d
    ld [hl], b
    sbc b
    jr @-$26

    sbc b
    ld hl, sp-$03
    ret c

    ld hl, sp+$78
    ld a, b
    jr c, jr_01a_76e4

    ld [hl], d
    ret c

    inc b
    adc b
    nop
    adc b
    add h
    inc bc
    add b
    add e
    nop
    jr jr_01a_7646

    adc e
    nop
    inc bc
    adc c
    rrca
    ld [de], a
    sub [hl]
    ld [hl], d
    ld [de], a
    rrca
    db $e3
    pop hl
    ret nz

    add b
    or b
    ret nz

    jp $8000


    dec c
    nop
    jp z, Jump_000_01c3

    call nz, $d200
    inc d
    rst $00
    dec c
    nop
    pop de
    ld a, [de]
    inc de
    inc h
    dec h
    jr nz, jr_01a_76e2

    cp l
    jr nc, jr_01a_76e3

jr_01a_76e2:
    ld l, a

jr_01a_76e3:
    ld a, l

jr_01a_76e4:
    add a
    add e
    ld l, a
    ld a, $00
    adc d
    ld h, a

jr_01a_76eb:
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    add hl, de
    jp hl


    ld e, l
    ld d, h
    pop hl
    inc d
    dec d
    jr nz, jr_01a_7703

jr_01a_76f8:
    ld a, [hl+]
    cp e
    jr z, jr_01a_7709

    ld a, [hl+]
    or [hl]
    inc hl
    jr nz, jr_01a_76f8

    jr jr_01a_76eb

jr_01a_7703:
    inc hl
    ld a, [hl+]
    or [hl]
    inc hl
    jr nz, jr_01a_7703

jr_01a_7709:
    ld a, [hl+]
    or [hl]
    inc hl
    jr z, jr_01a_7709

    dec hl
    dec hl
    jr jr_01a_76eb

    ld e, l
    ld d, h
    pop hl

jr_01a_7715:
    ld a, [hl+]
    cp e
    jr nz, jr_01a_771e

    ld a, [hl+]
    cp d
    jr z, jr_01a_7709

    dec hl

jr_01a_771e:
    inc hl
    ld a, [hl+]
    or [hl]
    inc hl
    jr nz, jr_01a_7715

    jr jr_01a_76eb

jr_01a_7726:
    ld b, $a0
    bit 7, d
    jr z, jr_01a_7753

    ld b, $41
    jr jr_01a_7753

    ld a, d
    xor h
    rla
    jr c, jr_01a_7726

    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    rra
    and $c0
    ld b, a
    ld a, l
    or h
    jr nz, jr_01a_7747

    set 4, b
    jr jr_01a_7753

jr_01a_7747:
    bit 7, h
    jr nz, jr_01a_774d

    set 5, b

jr_01a_774d:
    bit 7, b
    jr nz, jr_01a_7753

    set 0, b

jr_01a_7753:
    ld a, b
    ld b, $00
    ld hl, $7762
    add hl, bc
    and [hl]
    ld hl, $0000
    ret z

    inc hl
    scf
    ret


    db $10
    ld h, b
    add b
    sub b
    ld bc, $4011
    ld d, b
    jr nz, jr_01a_779c

jr_01a_776c:
    ld a, [hl+]
    bit 7, a
    ret nz

    push hl
    ld l, [hl]
    ld h, a
    trap $b8
    pop hl
    inc hl
    trap $69
    jr jr_01a_776c

    add sp, -$0a
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], $00
    inc hl
    ld a, [de]
    inc de
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$05
    ld a, [de]
    inc de
    ld [hl-], a
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, sp+$06
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld l, a
    ld a, [de]

jr_01a_779c:
    dec de
    ld h, a
    or l
    jr z, jr_01a_77a2

    add hl, de

jr_01a_77a2:
    ld e, l
    ld d, h
    ld hl, sp+$08
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, sp+$00
    ld e, [hl]
    jr jr_01a_77f9

    push hl
    push de
    push hl
    add sp, -$04
    ld hl, sp+$00
    ld [hl], c
    inc hl
    ld [hl], $00
    inc hl
    ld [hl], b
    ld hl, sp+$08
    xor a
    ld [hl+], a
    ld [hl], a

jr_01a_77c0:
    trap $b1
    trap $d8
    ld hl, sp+$03
    ld [hl], a
    ld c, a
    and $09
    jr nz, jr_01a_7818

    ld a, c
    and $06
    jr nz, jr_01a_7822

    ld hl, sp+$02
    ld b, [hl]
    ld hl, sp+$00
    ld a, [hl]
    bit 6, c
    jr nz, jr_01a_77e4

    bit 7, c
    jr nz, jr_01a_77ed

    call Call_01a_782c
    jr jr_01a_77c0

jr_01a_77e4:
    dec a
    bit 7, a
    jr z, jr_01a_77f2

    ld a, b
    dec a
    jr jr_01a_77f2

jr_01a_77ed:
    inc a
    cp b
    jr c, jr_01a_77f2

    xor a

jr_01a_77f2:
    ld e, a
    call Call_01a_7837
    ld hl, sp+$00
    ld [hl], e

jr_01a_77f9:
    inc hl
    ld [hl], $00
    inc hl
    ld b, [hl]
    inc hl
    ld c, [hl]
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    or h
    jr z, jr_01a_7813

    ld a, e
    ld de, $780e
    push de
    jp hl


    jr nc, jr_01a_7813

    ld hl, sp+$00
    ld [hl], a

jr_01a_7813:
    call Call_01a_782c
    jr jr_01a_77c0

jr_01a_7818:
    call Call_01a_7837
    ld hl, sp+$00
    ld a, [hl]
    add sp, $0a
    or a
    ret


jr_01a_7822:
    call Call_01a_7837
    ld hl, sp+$00
    ld a, [hl]
    add sp, $0a
    scf
    ret


Call_01a_782c:
    ld hl, sp+$03
    ld a, [hl]
    inc [hl]
    and $0f
    ret nz

    bit 4, [hl]
    jr z, jr_01a_783b

Call_01a_7837:
    ld hl, sp+$09
    jr jr_01a_783d

jr_01a_783b:
    ld hl, sp+$08

jr_01a_783d:
    ld c, [hl]
    ld hl, sp+$02
    ld b, [hl]
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    add b
    ld l, a
    trap $b8
    ld a, c
    trap $bb
    ret


    ld hl, $ffab
    xor a
    ld [hl+], a
    ld [hl], a
    ldh [$ae], a
    ld c, $05
    ld hl, $ffaf

jr_01a_785a:
    ld [hl+], a
    dec c
    jr nz, jr_01a_785a

    ld a, $03
    ldh [$b4], a
    ret


    ld a, d
    ldh [$aa], a
    push de
    ld e, l
    ld d, h
    ld hl, $ffa8
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, e
    or d
    jr nz, jr_01a_787d

    ld de, $ffae
    ld a, [de]
    cp $04
    jr nz, jr_01a_787d

    xor a
    ld [de], a

jr_01a_787d:
    pop de
    push de
    ld d, $01
    ld bc, $1305
    trap $58
    pop de
    push de
    ld a, d
    inc e
    ld d, $02
    ld hl, $010c
    ld bc, $0c03
    trap $59
    pop de
    push de
    inc e
    inc e
    ld bc, $0001
    ld d, $00
    ld a, $7f
    trap $cd
    trap $cd
    trap $cd
    pop de
    push de
    ld bc, $0001
    ld d, $0e
    ld a, $7e
    trap $cd
    ld a, $75
    trap $cd
    trap $cd
    trap $cd
    ld a, $7d
    trap $cd
    pop de
    push de
    inc e
    inc e
    ld a, d
    add $24
    ld d, $0f
    ld hl, HeaderLogo
    ld bc, $0401
    trap $59
    pop de
    push de
    ld a, d
    add $28
    ld d, $00
    ld hl, $0102
    ld bc, $0202
    trap $59
    xor a
    call Call_01a_7f24
    pop de
    call Call_01a_7b0e
    ld de, $7ff0
    ld hl, $87f0
    ld bc, $0010
    trap $02
    ret


    push hl
    push de
    push bc
    add sp, -$3c
    ld hl, sp+$00
    ld e, l
    ld d, h
    ld hl, sp+$40
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call Call_01a_7f04
    push af
    ld c, a
    jr jr_01a_790a

jr_01a_7905:
    ld a, $20
    ld [de], a
    inc de
    inc c

jr_01a_790a:
    ld a, b
    cp c
    jr nz, jr_01a_7905

    pop af
    ld c, a
    cp b
    jr nz, jr_01a_7914

    dec c

jr_01a_7914:
    ld hl, sp+$3d
    ld b, [hl]
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$00
    trap $55
    ld hl, sp+$3d
    ld a, [hl]
    ld hl, sp+$00
    call Call_01a_7e77
    ld c, a
    ld b, $00
    add hl, bc
    ld [hl], $00
    ld hl, sp+$00
    ld e, l
    ld d, h
    ld hl, sp+$40
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call Call_01a_7e90
    add sp, $3c
    pop bc
    pop de
    pop hl
    ret


    push hl
    ld hl, $ffa2
    ld [hl], d
    inc hl
    ld [hl], e
    inc hl
    ld [hl], b
    inc hl
    ld [hl], c
    inc hl
    pop bc
    push bc
    ld [hl], c
    inc hl
    ld [hl], b
    pop hl
    ldh a, [$a4]
    ld c, a
    call Call_01a_7daf
    ldh a, [$a5]
    ld c, a
    or a
    ld a, d
    jr z, jr_01a_795e

jr_01a_795e:
    add e
    dec c
    jr nz, jr_01a_795e

    ldh [$a2], a
    ld a, $01
    call Call_01a_7f24

jr_01a_7969:
    trap $b1
    trap $d8
    ld b, a
    and $0c
    jr nz, jr_01a_7988

    ldh a, [$ab]
    cp $0c
    jr z, jr_01a_7980

    bit 0, b
    jr nz, jr_01a_7993

    bit 1, b
    jr nz, jr_01a_79c5

Jump_01a_7980:
jr_01a_7980:
    call Call_01a_79fe
    call Call_01a_7a89
    jr jr_01a_7969

jr_01a_7988:
    call Call_01a_7a85
    xor a
    call Call_01a_7f24
    ldh a, [$a5]
    or a
    ret


jr_01a_7993:
    ldh a, [$ab]
    cp $0c
    jr z, jr_01a_7980

    ld hl, $ffa5
    ld a, [hl-]
    cp [hl]
    jr nc, jr_01a_79c3

    ldh a, [$ae]
    call Call_01a_7ba9
    ld e, a
    ldh a, [$a2]
    ld d, a
    call Call_01a_7dc0
    call Call_01a_7b07
    ldh a, [$a5]
    ld c, a
    ld b, $00
    add hl, bc
    ld [hl], e
    ld hl, $ffa4
    cp [hl]
    jr nc, jr_01a_79c3

    inc hl
    inc [hl]
    ldh a, [$a3]
    add d
    ldh [$a2], a

jr_01a_79c3:
    jr jr_01a_7980

jr_01a_79c5:
    ldh a, [$a2]
    ld d, a
    ld hl, $ffa5
    ld a, [hl-]
    ld c, a
    or a
    jr z, jr_01a_7980

    cp [hl]
    jr nc, jr_01a_79d8

    ld e, $20
    call Call_01a_7dc0

jr_01a_79d8:
    dec hl
    ld a, d
    sub [hl]
    ldh [$a2], a
    ld d, a
    ld e, $20
    call Call_01a_7dc0
    ld hl, $ffa5
    ld a, [hl]
    dec [hl]
    dec hl
    cp [hl]
    jr c, jr_01a_79ed

    dec a

jr_01a_79ed:
    push af
    ld c, a
    ld b, $00
    call Call_01a_7b07
    add hl, bc
    ld [hl], e
    pop af
    jr nc, jr_01a_79fb

    dec hl
    ld [hl], e

jr_01a_79fb:
    jp Jump_01a_7980


Call_01a_79fe:
    ldh a, [$b6]
    ld b, a
    ld hl, $ffab
    ld a, [hl+]
    cp $0c
    jr z, jr_01a_7a1f

    ld a, [hl]
    bit 6, b
    jr nz, jr_01a_7a65

    bit 7, b
    jr nz, jr_01a_7a73

jr_01a_7a12:
    ld hl, $ffab
    ld a, [hl]
    bit 5, b
    jr nz, jr_01a_7a53

    bit 4, b
    jr nz, jr_01a_7a5c

    ret


jr_01a_7a1f:
    ld c, $05
    ld hl, $ffa8
    ld a, [hl+]
    or [hl]
    jr nz, jr_01a_7a2a

    ld c, $04

jr_01a_7a2a:
    ld hl, $ffae
    ld a, [hl]
    bit 6, b
    jr nz, jr_01a_7a41

    bit 7, b
    jr nz, jr_01a_7a4a

    ld a, b
    and $30
    ret z

    push bc
    call Call_01a_7a85
    pop bc
    jr jr_01a_7a12

jr_01a_7a41:
    dec a
    bit 7, a
    jr z, jr_01a_7a4f

    ld a, c
    dec a
    jr jr_01a_7a4f

jr_01a_7a4a:
    inc a
    cp c
    jr c, jr_01a_7a4f

    xor a

jr_01a_7a4f:
    ld [hl], a
    jp Jump_01a_7b0e


jr_01a_7a53:
    dec a
    bit 7, a
    jr z, jr_01a_7a62

    ld a, $0c
    jr jr_01a_7a62

jr_01a_7a5c:
    inc a
    cp $0d
    jr c, jr_01a_7a62

    xor a

jr_01a_7a62:
    ld [hl], a
    jr jr_01a_7a81

jr_01a_7a65:
    or a
    jr nz, jr_01a_7a70

    call $7b5b
    call Call_01a_7b0e
    jr jr_01a_7a81

jr_01a_7a70:
    dec a
    jr jr_01a_7a80

jr_01a_7a73:
    cp $02
    jr c, jr_01a_7a7f

    call Call_01a_7b6b
    call Call_01a_7b0e
    jr jr_01a_7a81

jr_01a_7a7f:
    inc a

jr_01a_7a80:
    ld [hl], a

jr_01a_7a81:
    xor a
    ldh [$ad], a
    ret


Call_01a_7a85:
    ld a, $10
    ldh [$ad], a

Call_01a_7a89:
    ldh a, [$ad]
    and $0f
    jr nz, jr_01a_7ac1

    ldh a, [$a2]
    ld d, a
    ld hl, $ffa5
    ld a, [hl-]
    ld c, a
    cp [hl]
    jr c, jr_01a_7a9f

    dec hl
    ld a, d
    sub [hl]
    ld d, a
    dec c

jr_01a_7a9f:
    ldh a, [$ad]
    bit 4, a
    jr z, jr_01a_7ab1

    ld b, $00
    call Call_01a_7b07
    add hl, bc
    ld e, [hl]
    call Call_01a_7dcc
    jr jr_01a_7abf

jr_01a_7ab1:
    ld e, $20
    call Call_01a_7dcc
    push hl
    ld hl, $c3ee
    ld a, $ff
    ld [hl+], a
    ld [hl], a
    pop hl

jr_01a_7abf:
    trap $02

jr_01a_7ac1:
    ld hl, $c39c
    push hl
    xor a
    ld [hl+], a
    ld [hl-], a
    pop de
    ld hl, $ffad
    ldh a, [$ab]
    cp $0c
    jr z, jr_01a_7af2

    ld a, [hl]
    inc [hl]
    and $10
    ret nz

    ld hl, $ffac
    ld a, [hl-]
    add a
    add a
    add a
    add $80
    ld [de], a
    inc de
    ld a, [hl]
    add a
    add a
    add a
    add $18
    ld [de], a
    inc de
    ld a, $7f
    ld [de], a
    inc de
    ld a, $00
    ld [de], a
    ret


jr_01a_7af2:
    ld a, [hl]
    inc [hl]
    and $0f
    ret nz

    bit 4, [hl]
    jr nz, jr_01a_7aff

    ld a, $30
    ldh [$b4], a

jr_01a_7aff:
    call Call_01a_7b2f
    ld a, $03
    ldh [$b4], a
    ret


Call_01a_7b07:
    ld hl, $ffa6
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ret


Call_01a_7b0e:
Jump_01a_7b0e:
    ld c, $03
    call Call_01a_7b77
    push af
    ldh a, [$aa]
    ld d, a

jr_01a_7b17:
    ld b, $0c

jr_01a_7b19:
    ld a, [hl+]
    ld e, a
    call Call_01a_7dc0
    inc d
    dec b
    jr nz, jr_01a_7b19

    push de
    call Call_01a_7b6b
    pop de
    dec c
    jr nz, jr_01a_7b17

    call Call_01a_7b77
    pop af
    ld [de], a

Call_01a_7b2f:
    ldh a, [$aa]

jr_01a_7b31:
    add $24
    ld d, a
    ldh a, [$ae]
    add a
    add a
    ld c, a
    ld b, $00
    ld hl, $7b47
    add hl, bc
    ld c, $04
    ld e, $01
    call Call_01a_7daf
    ret


    ld a, e
    add a
    adc [hl]
    ld [hl], l
    or [hl]
    ret nz

    or [hl]
    push bc
    ld sp, $3332
    inc [hl]
    ld b, c
    ld b, d
    ld b, e
    ld b, h
    jp nc, Jump_000_20d3

    jr nz, jr_01a_7b31

    call Call_01a_7b90
    ld a, [de]
    dec a
    bit 7, a
    jr z, jr_01a_7b67

    ld a, [hl]
    dec a

jr_01a_7b67:
    ld [de], a
    pop de
    jr jr_01a_7b77

Call_01a_7b6b:
    push de
    call Call_01a_7b90
    ld a, [de]
    inc a
    cp [hl]
    jr c, jr_01a_7b75

    xor a

jr_01a_7b75:
    ld [de], a
    pop de

Call_01a_7b77:
jr_01a_7b77:
    push bc
    call Call_01a_7b90
    inc hl
    ld a, [de]
    call Call_01a_7bd2
    ldh a, [$ae]
    cp $04
    jr nz, jr_01a_7b8c

    ld hl, $ffa8
    ld a, [hl+]
    ld h, [hl]
    ld l, a

jr_01a_7b8c:
    add hl, bc
    ld a, [de]
    pop bc
    ret


Call_01a_7b90:
    push bc
    ldh a, [$ae]
    ld c, a
    ld b, $00
    ld hl, $ffaf
    add hl, bc
    push hl
    add a
    ld e, a
    ld d, $00
    ld hl, $7bdc
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    pop bc
    ret


Call_01a_7ba9:
    push hl
    push de
    push bc
    call Call_01a_7bc5
    ldh a, [$ae]
    cp $04
    jr nz, jr_01a_7bbb

    ld hl, $ffa8
    ld a, [hl+]
    ld h, [hl]
    ld l, a

jr_01a_7bbb:
    add hl, bc
    ldh a, [$ab]
    ld c, a
    add hl, bc
    ld a, [hl]
    pop bc
    pop de
    pop hl
    ret


Call_01a_7bc5:
    call Call_01a_7b90
    ldh a, [$ac]
    ld c, a
    ld a, [de]
    add c
    cp [hl]
    jr c, jr_01a_7bd1

    sub [hl]

jr_01a_7bd1:
    inc hl

Call_01a_7bd2:
    ld c, a
    add a
    add a
    ld c, a
    add a
    add c
    ld c, a
    ld b, $00
    ret


    ld l, l
    ld a, h
    jp c, $e77c

    ld a, e
    inc h
    ld a, h
    and $7b
    dec b
    dec b
    jr nc, jr_01a_7c1b

    ld [hl-], a
    inc sp
    inc [hl]
    jr nz, @+$37

    ld [hl], $37
    jr c, jr_01a_7c2c

    jr nz, jr_01a_7c15

    jr z, jr_01a_7c20

    inc a
    ld a, $20
    dec de
    dec e
    ld e, e
    ld e, l
    ld b, b
    jr nz, jr_01a_7c22

    ccf
    ld [hl+], a
    daa
    inc hl
    jr nz, jr_01a_7c32

    dec l
    ld a, [hl+]
    cpl
    dec h
    jr nz, jr_01a_7c39

    ld l, $5c
    inc h
    dec a
    jr nz, jr_01a_7c4d

    dec sp
    ld e, [hl]

jr_01a_7c15:
    ld h, $1c
    jr nz, @+$20

    rra
    ld e, a

jr_01a_7c1b:
    jr nz, @+$43

jr_01a_7c1d:
    jr nz, @+$44

    ld b, e

jr_01a_7c20:
    ld b, h
    ld b, l

jr_01a_7c22:
    ld b, [hl]

jr_01a_7c23:
    jr nz, @+$08

    ld b, c

jr_01a_7c26:
    ld b, d
    ld b, e
    ld b, h
    ld b, l
    jr nz, jr_01a_7c72

jr_01a_7c2c:
    ld b, a
    ld c, b
    ld c, c
    ld c, d
    jr nz, jr_01a_7c7d

jr_01a_7c32:
    ld c, h
    ld c, l
    ld c, [hl]
    ld c, a

jr_01a_7c36:
    jr nz, jr_01a_7c88

    ld d, c

jr_01a_7c39:
    ld d, d
    ld d, e
    ld d, h
    jr nz, jr_01a_7c93

    ld d, [hl]
    ld d, a
    ld e, b
    ld e, c
    jr nz, @+$5c

jr_01a_7c44:
    jr nz, @+$30

    ld hl, $203f
    ld bc, $0302
    inc b

jr_01a_7c4d:
    dec b
    jr nz, jr_01a_7c56

    rlca
    ld [$0a09], sp
    jr nz, @+$0d

jr_01a_7c56:
    inc c
    dec c
    ld c, $0f

jr_01a_7c5a:
    jr nz, jr_01a_7c6c

    ld de, $1312
    inc d
    jr nz, jr_01a_7c77

    ld d, $17
    jr jr_01a_7c7f

    jr nz, jr_01a_7c82

    dec l
    daa
    jr z, jr_01a_7c95

jr_01a_7c6c:
    jr nz, jr_01a_7c77

    ld h, c
    ld h, d

jr_01a_7c70:
    ld h, e
    ld h, h

jr_01a_7c72:
    ld h, l
    jr nz, jr_01a_7cdb

    ld h, a
    ld l, b

jr_01a_7c77:
    ld l, c
    ld l, d
    jr nz, jr_01a_7ce6

jr_01a_7c7b:
    ld l, h
    ld l, l

jr_01a_7c7d:
    ld l, [hl]
    ld l, a

jr_01a_7c7f:
    jr nz, @+$72

    ld [hl], c

jr_01a_7c82:
    ld [hl], d
    ld [hl], e
    ld [hl], h
    jr nz, jr_01a_7cfc

    halt

jr_01a_7c88:
    ld [hl], a
    ld a, b
    ld a, c
    jr nz, @+$7c

    ld a, e
    ld a, h
    ld a, l
    ld a, [hl]
    jr nz, @+$81

jr_01a_7c93:
    add b
    add c

jr_01a_7c95:
    add d
    add e
    jr nz, jr_01a_7c1d

    jr nz, jr_01a_7c20

    jr nz, jr_01a_7c23

    jr nz, jr_01a_7c26

    adc b
    adc c
    adc d
    adc e

jr_01a_7ca3:
    jr nz, @-$72

    jr nz, @+$62

    jr nz, jr_01a_7c36

    jr nz, jr_01a_7c39

    adc a
    sub b
    sub c

jr_01a_7cae:
    sub d
    jr nz, jr_01a_7c44

    sub h
    sub l
    sub [hl]
    sub a
    jr nz, @-$66

    sbc c
    sbc d

jr_01a_7cb9:
    sbc e
    sbc h
    jr nz, jr_01a_7c5a

    sbc [hl]
    sbc a
    and b
    and c
    jr nz, @-$5c

    and e

jr_01a_7cc4:
    and h
    and l
    and [hl]
    jr nz, jr_01a_7c70

    xor b
    xor c
    xor d
    xor e
    jr nz, jr_01a_7c7b

    xor l
    xor [hl]
    xor a
    jr nz, jr_01a_7cf4

    dec l
    inc l
    ld l, $21
    ccf
    jr nz, jr_01a_7ce4

jr_01a_7cdb:
    or c
    or d
    or e
    or h
    or l

jr_01a_7ce0:
    jr nz, @-$48

    or a

jr_01a_7ce3:
    cp b

jr_01a_7ce4:
    cp c
    cp d

jr_01a_7ce6:
    jr nz, jr_01a_7ca3

    cp h
    cp l
    cp [hl]
    cp a
    jr nz, jr_01a_7cae

    pop bc
    jp nz, $c4c3

    jr nz, jr_01a_7cb9

jr_01a_7cf4:
    add $c7

jr_01a_7cf6:
    ret z

    ret


    jr nz, jr_01a_7cc4

    set 1, h

jr_01a_7cfc:
    call Call_000_20ce
    trap $d0

jr_01a_7d01:
    pop de
    jp nc, Jump_000_20d3

    call nc, $d520
    jr nz, jr_01a_7ce0

    jr nz, jr_01a_7ce3

jr_01a_7d0c:
    ret c

jr_01a_7d0d:
    reti


    jp c, Jump_000_20db

    call c, $b020
    jr nz, @-$21

    jr nz, jr_01a_7cf6

    rst $18
    ldh [$e1], a
    ld [c], a
    jr nz, jr_01a_7d01

    db $e4
    push hl
    and $e7

jr_01a_7d22:
    jr nz, jr_01a_7d0c

    jp hl


    ld [$eceb], a
    jr nz, @-$11

    xor $ef
    ldh a, [$f1]
    jr nz, jr_01a_7d22

    di
    db $f4
    push af
    or $20
    rst $30
    ld hl, sp-$07
    ld a, [$20fb]
    db $fc
    db $fd
    cp $ff
    jr nz, jr_01a_7d61

    dec l
    inc l
    ld l, $21
    ccf
    jr nz, jr_01a_7d0d

jr_01a_7d48:
    ld a, [hl+]
    bit 7, a
    jr nz, jr_01a_7d5e

    push de
    ld d, a
    ld e, [hl]
    inc hl
    push hl
    call Call_01a_7df1
    ld c, l
    ld b, h
    pop hl
    pop de
    call Call_01a_7d60
    jr jr_01a_7d48

jr_01a_7d5e:
    pop bc
    ret


Call_01a_7d60:
    push hl

jr_01a_7d61:
    push bc
    add sp, -$20
    ld hl, sp+$00
    ld c, l
    ld b, h
    ld hl, sp+$22
    ld a, [hl+]
    ld h, [hl]
    ld l, a

jr_01a_7d6d:
    ld a, [hl+]
    or a
    jr z, jr_01a_7d90

    cp $20
    jr nc, jr_01a_7d79

    trap $b9
    jr jr_01a_7d6d

jr_01a_7d79:
    push de
    ld e, a
    ld d, [hl]
    trap $a7
    jr nc, jr_01a_7d81

    inc hl

jr_01a_7d81:
    pop de
    push de
    ld e, a
    call Call_01a_7dc0
    pop de
    ld a, d
    ld [bc], a
    inc bc
    ld a, d
    add e
    ld d, a
    jr jr_01a_7d6d

jr_01a_7d90:
    push de
    ld e, l
    ld d, h
    ld hl, sp+$24
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, sp+$02
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    ld e, l
    ld d, h
    ld hl, sp+$22
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    trap $02
    pop de
    add sp, $20
    pop bc
    pop hl
    ret


Call_01a_7daf:
    push de
    push bc
    ld b, e

jr_01a_7db2:
    ld e, [hl]
    inc hl
    call Call_01a_7dc0
    ld a, b
    add d
    ld d, a
    dec c
    jr nz, jr_01a_7db2

    pop bc
    pop de
    ret


Call_01a_7dc0:
    push hl
    push de
    push bc
    call Call_01a_7dcc
    trap $02
    pop bc
    pop de
    pop hl
    ret


Call_01a_7dcc:
    ld b, d
    ld hl, $c3e0
    push hl
    ldh a, [$b4]
    ld c, a
    trap $ba
    ld a, b
    xor $80
    ld h, $00
    add a
    rl h
    add a
    rl h
    add a
    rl h
    add a
    rl h
    ld l, a
    ld bc, $8800
    add hl, bc
    pop de
    ld bc, $0010
    ret


Call_01a_7df1:
    ld h, e
    xor a
    srl h
    rra
    srl h
    rra
    srl h
    rra
    add d
    ld l, a
    ld a, h
    adc $98
    ld h, a
    ret


    call Call_01a_7df1
    ld a, $79
    ld de, $7778
    call Call_01a_7e20
    dec c
    dec c

Jump_01a_7e10:
jr_01a_7e10:
    ld a, $7f
    ld de, $7576
    call Call_01a_7e20
    dec c
    jr nz, jr_01a_7e10

    ld a, $7c
    ld de, $7a7b

Call_01a_7e20:
    add sp, -$20
    push hl
    push bc
    ld hl, sp+$04
    dec b
    dec b
    push hl
    ld [hl], d
    inc hl

jr_01a_7e2b:
    ld [hl+], a
    dec b
    jr nz, jr_01a_7e2b

    ld [hl], e
    pop de
    pop bc
    pop hl
    push hl
    push bc
    ld c, b
    ld b, $00
    trap $02
    pop bc
    pop de
    ld hl, $0020
    add hl, de
    add sp, $20
    ret


    push af
    push hl
    add sp, -$20
    call Call_01a_7df1

jr_01a_7e4a:
    push hl
    push bc
    ld hl, sp+$25
    ld d, [hl]
    ld hl, sp+$27
    ld a, [hl]
    ld hl, sp+$04
    push hl

jr_01a_7e55:
    ld [hl+], a
    add d
    dec b
    jr nz, jr_01a_7e55

    pop de
    pop bc
    pop hl
    push hl
    push bc
    ld c, b
    ld b, $00
    trap $02
    ld hl, sp+$24
    ld a, [hl]
    ld hl, sp+$27
    add [hl]
    ld [hl], a
    pop bc
    pop de
    ld hl, $0020
    add hl, de
    dec c
    jr nz, jr_01a_7e4a

    add sp, $24
    ret


Call_01a_7e77:
    push hl
    push de
    push bc
    ld b, a
    ld c, b
    ld e, b
    ld d, $00
    add hl, de
    dec hl
    inc c

jr_01a_7e82:
    scf
    dec c
    jr z, jr_01a_7e8b

    ld a, [hl-]
    cp $20
    jr z, jr_01a_7e82

jr_01a_7e8b:
    ld a, c
    pop bc
    pop de
    pop hl
    ret


Call_01a_7e90:
    push hl
    push bc
    ld c, $00
    ld b, $80

jr_01a_7e96:
    ld a, [de]
    inc de
    cp $20
    jr c, jr_01a_7ea8

    cp $b0
    jr nc, jr_01a_7ec6

    cp $60
    jr nc, jr_01a_7eb4

jr_01a_7ea4:
    ld [hl+], a
    inc c
    jr jr_01a_7e96

jr_01a_7ea8:
    add $60
    cp $60
    jr nz, jr_01a_7ea4

    ld [hl], $00
    ld a, c
    pop bc
    pop hl
    ret


jr_01a_7eb4:
    bit 7, b
    jr z, jr_01a_7ebe

jr_01a_7eb8:
    ld b, $01
    ld [hl], $0f
    inc hl
    inc c

jr_01a_7ebe:
    bit 0, b
    jr z, jr_01a_7eb8

    add $50
    jr jr_01a_7ed4

jr_01a_7ec6:
    bit 7, b
    jr z, jr_01a_7ed0

jr_01a_7eca:
    ld b, $00
    ld [hl], $0e
    inc hl
    inc c

jr_01a_7ed0:
    bit 0, b
    jr nz, jr_01a_7eca

jr_01a_7ed4:
    cp $f7
    jr nc, jr_01a_7ee4

    cp $de
    jr nc, jr_01a_7ee8

    cp $b0
    jr nz, jr_01a_7ea4

    ld a, $a6
    jr jr_01a_7ea4

jr_01a_7ee4:
    add $b0
    jr jr_01a_7ea4

jr_01a_7ee8:
    cp $ed
    jr nc, jr_01a_7ef4

    add $d8

jr_01a_7eee:
    ld [hl+], a
    inc c
    ld a, $de
    jr jr_01a_7ea4

jr_01a_7ef4:
    cp $f2
    jr nc, jr_01a_7efc

    add $dd
    jr jr_01a_7eee

jr_01a_7efc:
    add $d8
    ld [hl+], a
    inc c
    ld a, $df
    jr jr_01a_7ea4

Call_01a_7f04:
    push bc
    ld c, $00

jr_01a_7f07:
    ld a, [hl+]
    or a
    jr z, jr_01a_7f21

    cp $20
    jr nc, jr_01a_7f13

    trap $b9
    jr jr_01a_7f07

jr_01a_7f13:
    push de
    ld e, a
    ld d, [hl]
    trap $a7
    jr nc, jr_01a_7f1b

    inc hl

jr_01a_7f1b:
    pop de
    ld [de], a
    inc de
    inc c
    jr jr_01a_7f07

jr_01a_7f21:
    ld a, c
    pop bc
    ret


Call_01a_7f24:
    ld e, a
    ldh a, [$aa]
    add $28
    ld d, a
    ld c, $04
    ld hl, $7fb0
    ld a, e
    push af
    push hl
    push bc
    ld e, d
    call Call_01a_7dcc
    pop bc
    pop de
    pop af
    or a
    jr nz, jr_01a_7f4b

    push hl
    ld l, c
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    pop hl
    trap $02
    ret


jr_01a_7f4b:
    push bc
    push hl
    ld hl, $c3e0
    ld b, $10

jr_01a_7f52:
    ld a, [de]
    inc de
    xor $ff
    ld [hl+], a
    dec b
    jr nz, jr_01a_7f52

    pop hl
    push de
    push hl
    ld de, $c3e0
    ld bc, $0010
    trap $02
    pop hl
    ld de, $0010
    add hl, de
    pop de
    pop bc
    dec c
    jr nz, jr_01a_7f4b

    ret


    rst $38
    ld a, a
    add b
    add b
    sbc a
    adc a
    sub b
    sub b
    sub b
    sub b
    sub b
    sub b
    sub h
    sub e
    sub b
    sub b
    rst $38
    rst $38
    ld bc, $f901
    pop af
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, hl
    ret


    add hl, bc
    add hl, bc
    sub h
    sub e
    sub b
    sub b
    sub b
    sub b
    sub h
    sub e
    sub b
    sub b
    sbc a
    adc a
    add b
    add b
    ld a, a
    rst $38
    add hl, hl
    ret


    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, hl
    ret


    add hl, bc
    add hl, bc
    ld sp, hl
    pop af
    ld bc, $ff01
    cp $ff
    ld a, a
    add b
    add b
    add c
    add b
    add e
    add c
    add a
    add d
    adc a
    add h
    sbc a
    adc c
    sbc [hl]
    sbc [hl]
    cp $fe
    ld bc, $f101
    pop hl
    ld sp, hl
    ld sp, $49cd
    adc l
    adc l
    dec d
    dec e
    dec h
    dec a
    sub d
    sub d
    sub c
    sub c
    sub b
    sub b
    cp b
    sbc b
    sbc a
    cp a
    adc b
    or b
    add b
    add b
    ld a, a
    rst $38
    ld c, c
    ld a, c
    sub c
    pop af
    or c
    pop hl
    pop hl
    pop bc
    add c
    pop bc
    ld bc, $0101
    ld bc, $feff
    jp $81c3


    add c
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_01a_7ffb:
    nop
    add c
    add c
    db $c3
    db $c3
