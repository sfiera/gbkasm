; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $001", ROMX[$4000], BANK[$1]

    db "Z", $a5, $00, $00, $00, $a0, $1e, $00, $06, $00, $0a, $01, "KISS MAIL", $c3, $9d, "^", $00, $00, "GB KISS MENU ", $00, $00, $00, $82, $82, "DD((", $10, $10, "((DD", $82, $82, $00, $00, $10, $10, "8(8(|D|D", $fe, $82, $fe, $fe, $00, $00, "88|D", $fe, $82, $fe, $82, $fe, $82, "|D88", $00, $00, $10, $10, "8(|D", $fe, $82, "|D8(", $10, $10, $00, $00, "88|D", $fe, $92, $fe, $aa, $fe, $92, "|D88", $10, $10, $18, $18, $fc, $fc, $fe, $fe, $fc, $fc, $18, $18, $10, $10, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

jt01::
    dw jt01_7dcc
    dw jt01_7f2f
    dw jt01_7e77
    dw jt01_7f04
    dw jt01_7e90
    dw jt01_7260
    dw jt01_665c
    dw jt01_7730
    dw jt01_784d
    dw jt01_7863
    dw jt01_793f
    dw jt01_78f0
    dw jt01_7df1
    dw jt01_7e03
    dw jt01_7e43
    dw jt01_7d47
    dw jt01_7d60
    dw jt01_776c
    dw jt01_7daf
    dw jt01_77ae
    dw jt01_777b
    dw jt01_6d2f
    dw jt01_7222
    dw jt01_6d53
    dw jt01_6d72
    dw jt01_6de4
    dw jt01_6e2e
    dw jt01_6f66
    dw jt01_6f7a
    dw jt01_6f8f
    dw jt01_6f9b
    dw jt01_6fda
    dw jt01_6feb
    dw jt01_714d
    dw jt01_70ba
    dw jt01_71e6
    dw jt01_7138
    dw jt01_6e8b
    dw jt01_6e63
    dw jt01_6a93
    dw jt01_6c1b
    dw jt01_6c28
    dw jt01_6c2f
    dw jt01_6c3c
    dw jt01_6c5b
    dw jt01_6c38
    dw jt01_6c67
    dw jt01_6cc3
    dw jt01_6c8e
    dw jt01_6c92
    dw jt01_6cd8
    dw jt01_6ca5
    dw jt01_6ca9

j01_4100::
    ld sp, $e000
    ld hl, j01_4100
    vcall $6f
    xor a
    ldh [$b7], a
    call Call_001_498a

Jump_001_410e:
    call Call_001_4b33
    ld hl, $ffc0
    ld de, $ff44
    ld bc, $0001
    vcall $e4
    ld a, $ff
    ldh [$c2], a
    xor a
    ldh [$c3], a
    ldh [$c1], a

jr_001_4125:
    call Call_001_47eb
    jp c, Jump_000_0303

    and $01
    jp z, Jump_001_42a6

    call Call_001_490e
    ldh a, [$8a]
    bit 2, a
    jp nz, Jump_001_4290

Jump_001_413a:
    call Call_001_4acb
    and $02
    jr nz, jr_001_4154

    ld h, a
    ld l, c
    vcall $06
    ld b, $13
    nop
    push de
    ld [bc], a
    ld a, [de]
    nop
    ld b, h
    ld bc, $0168
    ld l, [hl]
    ld [bc], a
    ld [bc], a
    nop

jr_001_4154:
    call Call_001_4b36
    jr jr_001_4125

    ld hl, $c500
    vcall $6d
    ld hl, data_01_4fb1
    jp Jump_001_43b4


    ldh a, [$c0]
    ldh [$c2], a
    ldh a, [$c1]
    ldh [$c3], a
    call Call_001_4990
    push af

jr_001_4170:
    call Call_001_47eb
    jr c, jr_001_419b

    bit 0, a
    jr z, jr_001_4170

    call Call_001_4990
    pop de
    ld e, a
    call Call_001_4235
    push de
    jr nz, jr_001_419b

    ld a, d
    cp e
    jr nz, jr_001_419b

    ld hl, data_01_4fc1
    call Call_001_4bd2
    ld de, $0b10
    call Call_001_43e2
    jr nz, jr_001_419b

    pop de
    call Call_001_41a9
    push af

jr_001_419b:
    pop af
    ld a, $ff
    ldh [$c2], a
    jp Jump_001_410e


Call_001_41a3:
    ld hl, $c500
    vcall $ef
    ret


Call_001_41a9:
    ld e, $00

Jump_001_41ab:
    ld a, e
    cp d
    jp z, Jump_001_422d

    push de
    ld hl, $c500
    vcall $71
    pop de
    ld hl, $c500
    ld a, [hl+]
    or [hl]
    jr z, jr_001_422d

    inc hl
    ld a, [hl]
    cp $ff
    jr z, jr_001_422d

    push de
    call Call_001_426d
    vcall $6b
    pop de
    jr c, jr_001_422d

    push de
    call Call_001_478a
    pop hl
    push hl
    ld c, h
    ld a, [$c50a]
    ld [$c70a], a
    ld hl, $c700
    vcall $e9
    jr c, jr_001_422c

    ld a, [$c509]
    bit 0, a
    jr z, jr_001_41f1

    call Call_001_4929
    ld hl, $c700
    call Call_001_492c

jr_001_41f1:
    ld hl, $c500
    ld de, $c400
    ld bc, $0100
    vcall $eb
    ld a, b
    or c
    jr z, jr_001_420a

    ld hl, $c700
    ld de, $c400
    vcall $ec
    jr jr_001_41f1

jr_001_420a:
    ld de, $c702
    ld hl, $c502
    ld b, $03

jr_001_4212:
    ld a, [de]
    cp [hl]
    jr c, jr_001_421d

    jr nz, jr_001_4224

    dec de
    dec hl
    dec b
    jr nz, jr_001_4212

jr_001_421d:
    ld hl, $c700
    vcall $ef
    jr jr_001_422c

jr_001_4224:
    pop de
    push de
    call Call_001_4235
    call Call_001_41a3

jr_001_422c:
    pop de

Jump_001_422d:
jr_001_422d:
    inc e
    ld a, e
    cp $78
    jp c, Jump_001_41ab

    ret


Call_001_4235:
    add sp, -$08
    ld hl, sp+$00
    push de
    ld d, $fe
    ld bc, $0004
    vcall $e4
    pop de
    ld hl, sp+$04
    push de
    ld e, d
    ld d, $fe
    ld bc, $0004
    vcall $e4
    pop de
    ld hl, sp+$04
    push de
    ld d, $fe
    ld bc, $0004
    vcall $e5
    pop de
    ld hl, sp+$00
    push de
    ld e, d
    ld d, $fe
    ld bc, $0004
    vcall $e5
    pop de
    ld hl, sp+$00
    ld a, [hl+]
    or [hl]
    add sp, $08
    or a
    ret


Call_001_426d:
    ld hl, $c700
    ld de, $c50c
    ld a, [$c50b]
    ld c, a
    ret


Call_001_4278:
    ld hl, $c500
    ld a, [hl+]
    or [hl]
    ret z

    inc hl
    ld a, [hl]
    cp $ff
    ret


Jump_001_4283:
    ld hl, data_01_4f76
    call Call_001_4bd2
    ld a, $b4
    vcall $dc
    jp Jump_001_413a

Jump_001_4290:
    call Call_001_4278
    jp z, Jump_001_4283

    call Call_001_4632
    jp c, Jump_001_410e

    ld hl, $c500
    ld c, $01
    vcall $8f
    jp Jump_001_410e


Jump_001_42a6:
    ld hl, data_01_4ca0
    call Call_001_5033
    call Call_001_4b5e
    xor a
    call Call_001_42f5
    jp Jump_001_410e


    ld hl, $c500
    ld a, [hl+]
    or [hl]
    jr z, jr_001_42d7

    ld hl, data_01_4f85
    call Call_001_4bd2
    ld de, $0710
    call Call_001_43e2
    jp nz, Jump_001_43d4

    ld a, [$c502]
    cp $ff
    jp z, Jump_001_43b1

    call Call_001_41a3

jr_001_42d7:
    ld hl, data_01_4cbe
    call Call_001_5033
    call Call_001_4b5e
    call Call_001_501f
    jp nz, Jump_001_4491

    call Call_001_4b5e
    call Call_001_4990
    call Call_001_42f5
    jp nz, Jump_001_4491

    jp Jump_001_410e


Call_001_42f5:
    ld [$ce0f], a
    ld hl, $ce00
    ld de, $4018
    ld bc, $000f
    vcall $02
    vcall $8e
    ld [$ce01], a
    xor a
    ld [$c500], a
    ld [$c501], a
    call Call_001_4764
    call Call_001_435f
    jr c, jr_001_433d

    cp $01
    jr nz, jr_001_433d

    ld de, data_01_5a8f
    ld hl, data_01_4d06
    call Call_001_508f
    call Call_001_435f
    jr c, jr_001_433d

    cp $02
    jr nz, jr_001_433d

    ld hl, $c500
    ld c, $ff
    vcall $8f
    ld de, data_01_5b4f
    ld hl, data_01_4d1e
    xor a
    jr jr_001_434f

jr_001_433d:
    ld de, data_01_5c0f
    ld hl, data_01_4d5f
    ld a, [$ce00]
    cp $04
    jr nz, jr_001_434f

    ld hl, data_01_4dfe
    or $01

jr_001_434f:
    push af
    call Call_001_508f
    call Call_001_475c
    pop af
    ret


Call_001_4358:
jr_001_4358:
    vcall $da
    and $02
    jr nz, jr_001_4358

    ret


Call_001_435f:
    vcall $c3
    vcall $72
    ld a, [$ce00]
    push af
    cp $05
    call z, Call_001_41a3
    vcall $db
    pop af
    ret


Call_001_4370:
    vcall $c3
    vcall $7c
    jr jr_001_43ac

Call_001_4376:
    ld hl, $ce00
    ld [hl], a
    ld d, h
    ld e, l
    ld c, $01
    vcall $c3
    vcall $7f
    jr jr_001_43ac

Call_001_4384:
    vcall $c3
    vcall $73
    jr jr_001_43ac

Call_001_438a:
    ld hl, $c700
    vcall $c3
    vcall $79
    jr jr_001_43ac

Call_001_4393:
    ld de, $c600

Jump_001_4396:
    vcall $c3
    vcall $7d
    jr jr_001_43ac

Call_001_439c:
    vcall $c3
    vcall $77
    jr jr_001_43ac

Call_001_43a2:
    vcall $c3
    vcall $76
    jr jr_001_43ac

Call_001_43a8:
    vcall $c3
    vcall $75

jr_001_43ac:
    push af
    vcall $db
    pop af
    ret


Jump_001_43b1:
jr_001_43b1:
    ld hl, data_01_4f66

Jump_001_43b4:
    call Call_001_4bd2
    ld a, $b4
    vcall $dc
    jp Jump_001_413a


    call Call_001_4278
    jr z, jr_001_43b1

    call Call_001_43f1
    ld hl, data_01_4f0f
    call Call_001_43dc
    jr nz, jr_001_43d4

    call Call_001_41a3
    jp Jump_001_410e


Jump_001_43d4:
jr_001_43d4:
    ldh a, [$c1]
    call Call_001_4a36
    jp Jump_001_413a


Call_001_43dc:
    call Call_001_4bd2
    ld de, $0710

Call_001_43e2:
    ld a, $01
    ld bc, $2308
    ld hl, $0302
    vcall $bf
    or a
    ret nz

    bit 1, h
    ret


Call_001_43f1:
    call Call_001_4b52
    ret c

    push af
    ld hl, $0068
    vcall $bd
    ld hl, $c500
    vcall $f2
    ld e, d
    pop af
    cp e
    ret nc

    call Call_001_4b45
    ld hl, data_01_440d
    vcall $69
    ret


data_01_440d::
    db $b4, $d8, $b1, $0f, $c9, $b1, $b7, $b6, $de, $c3, $de, $b7

    vcall $bd
    ld c, $00
    ld a, $c4
    ld h, $04
    ld bc, $0301
    ld de, $0d12
    vcall $b3
    ld de, $0000
    ld hl, data_01_44a6
    vcall $6a
    call Call_001_4526
    ld bc, $000a
    ld hl, $c500
    call Call_001_4965
    ld hl, $0753
    ld de, $8865
    ld bc, $0791
    vcall $c2
    ld hl, $0153
    vcall $bd
    ld hl, data_01_4510
    vcall $69
    ld hl, $c400
    ld de, $ff46
    ld bc, $000a
    vcall $e4
    xor a
    ld [$c40a], a
    ld hl, $c400
    call Call_001_45dd
    ld hl, $015c
    vcall $bd
    ld hl, data_01_4518
    vcall $69
    add sp, -$04
    ld hl, sp+$00
    ld de, $ff40
    ld bc, $0004
    vcall $e4
    pop de
    pop bc
    ld hl, $c400
    vcall $a0
    ld hl, $c404
    vcall $69

jr_001_4489:
    vcall $b1
    vcall $d8
    and $03
    jr z, jr_001_4489

Jump_001_4491:
    call Call_001_4997
    call Call_001_479d
    ld a, h
    call Call_001_4a36
    call Call_001_490e
    jp Jump_001_413a


Call_001_44a1:
    ld a, $32
    vcall $dc
    ret


data_01_44a6::
    db $0f, $c5, $cf, $b4, $0e, $3a, $00, $20, $20, $20, $20, $20, $20, $b4, $d8, $b1
    db $20, $0f, $bd, $b3, $0e, $3a, $00, $20, $20, $20, $20, $20, $20, $ce, $df, $b2
    db $dd, $c4, $0f, $b6, $c1, $0e, $3a, $00, $20, $20, $20, $20, $20, $20, $cc, $a7
    db $b2, $d9, $0f, $bc, $de, $af, $ba, $b3, $3a, $0e, $00, $0f, $20, $2d, $2d, $2d
    db $20, $c2, $b3, $bc, $dd, $20, $d8, $da, $b7, $20, $2d, $2d, $2d, $0e, $00, $0f
    db $bb, $b8, $bc, $ac, $3a, $0e, $00, $4e, $6f, $2e, $31, $3a, $00, $4e, $6f, $2e
    db $32, $3a, $00, $4e, $6f, $2e, $33, $3a, $00, $00

data_01_4510::
    db $d5, $b0, $bb, $de, $b0, $20, $3a, $00

data_01_4518::
    db $ce, $df, $b2, $dd, $c4, $0f, $ba, $de, $b3, $b9, $b2, $3a, $0e, $00

Call_001_4526:
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
    jr z, jr_001_453a

    inc de

jr_001_453a:
    ld hl, $c400
    vcall $a3
    ld hl, $0d01
    vcall $b8
    ld hl, $c401
    vcall $69
    pop hl
    ld a, [$c502]
    ld bc, $111b
    call Call_001_45ec
    push de
    ld a, [hl+]
    dec a
    inc hl
    bit 4, d
    jr z, jr_001_4563

    bit 3, d
    jr z, jr_001_4561

    sub $60

jr_001_4561:
    sub $60

jr_001_4563:
    ld c, a
    ld b, $00
    ld e, l
    ld d, h
    ld hl, $c400
    push hl
    push bc
    vcall $02
    pop bc
    pop hl
    add hl, bc
    ld [hl], $00
    ld hl, $0400
    vcall $b8
    ld hl, $c400
    vcall $69
    pop de
    bit 0, d
    ret z

    call Call_001_4934
    ld hl, $0d02
    vcall $b8
    ld hl, $c400
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push hl
    ld hl, $c42e
    ld bc, $0000
    vcall $a0
    ld hl, $c434
    vcall $69
    pop de
    ld hl, $0505

jr_001_45a3:
    push hl
    push de
    vcall $b8
    ld hl, $c42e
    ld bc, $000a
    vcall $02
    xor a
    ld [$c438], a
    ld hl, $c42e
    call Call_001_45dd
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
    vcall $b8
    ld hl, $c42e
    vcall $a3
    ld hl, $c431
    vcall $69
    pop de
    pop hl
    inc l
    ld a, l
    cp $09
    jr c, jr_001_45a3

    ret


Call_001_45dd:
    ldh a, [$92]
    push af
    or $40
    ldh [$92], a
    vcall $69
    pop af
    and $fb
    ldh [$92], a
    ret


Call_001_45ec:
    cp $ff
    ld d, [hl]
    inc hl
    ld a, [hl]
    inc hl
    push hl
    push de
    push bc
    jr z, jr_001_4617

    or a
    jr z, jr_001_4605

    ld hl, $0014
    cp [hl]
    jr z, jr_001_4605

    ld de, $4028
    jr jr_001_461f

jr_001_4605:
    bit 2, d
    jr z, jr_001_461c

    bit 1, d
    jr z, jr_001_4612

    ld de, $4058
    jr jr_001_461f

jr_001_4612:
    ld de, $4048
    jr jr_001_461f

jr_001_4617:
    ld de, $4068
    jr jr_001_461f

jr_001_461c:
    ld de, $4038

jr_001_461f:
    ld hl, $c400
    ld bc, $0010
    push hl
    vcall $02
    pop hl
    ld bc, $0108
    pop de
    vcall $c0
    pop de
    pop hl
    ret


Call_001_4632:
    call Call_001_5019
    scf
    ret nz

    call Call_001_4764
    ld hl, $ce00
    ld de, $ce00
    ld c, $10
    call Call_001_4370
    ld a, $03
    jp c, Jump_001_471b

    ld hl, $401a
    ld de, $ce02
    ld bc, $000d
    vcall $67
    ld a, h
    or l
    ld hl, data_01_4d8d
    ld a, $06
    jp nz, Jump_001_4741

    ld a, [$ce00]
    or a
    jp nz, Jump_001_4741

    ld a, [$ce0f]
    push af
    ld a, $01
    call Call_001_4376
    call Call_001_4384

jr_001_4672:
    ld hl, data_01_4cd8
    ld de, data_01_5a8f
    call Call_001_508f
    call Call_001_426d
    call Call_001_43a8
    pop bc
    jp c, Jump_001_469a

    push bc
    ld hl, data_01_4dc6
    call Call_001_4bd2
    ld de, $0c10
    call Call_001_43e2
    jp nz, Jump_001_4737

    call Call_001_438a
    jr jr_001_4672

Jump_001_469a:
    cp $ff
    jp z, Jump_001_471b

    push bc
    ld a, $05
    call Call_001_4376
    call Call_001_478a
    pop af
    ld c, a
    ld a, $ff
    ld [$c70a], a
    ld hl, $c700
    call Call_001_43a2
    jr nc, jr_001_46c2

    cp $ff
    jr z, jr_001_4719

    ld hl, data_01_4d36
    ld a, $04
    jr jr_001_4740

jr_001_46c2:
    push hl
    ld hl, sp+$00
    ld d, h
    ld e, l
    ld hl, $ce00
    ld c, $02
    push hl
    call Call_001_4370
    pop hl
    pop bc
    ld a, [hl+]
    cp c
    jr nz, jr_001_4719

    ld a, [hl]
    cp b
    jr nz, jr_001_4719

    ld a, [$c509]
    bit 0, a
    jr z, jr_001_4700

    ld hl, $c500
    ld de, $c600
    vcall $f0
    jr c, jr_001_4721
    ld a, b
    or c
    jr z, jr_001_4721

    push bc
    ld de, $ffd2
    ld b, $00
    call Call_001_439c
    pop bc
    jr c, jr_001_4719

    call Call_001_4393
    jr c, jr_001_4719

jr_001_4700:
    ld hl, $c500
    ld de, $c600
    ld bc, $0100
    vcall $eb
    jr c, jr_001_4721

data_01_470d::
    ld a, b
    or c
    jr z, jr_001_4721

    call Call_001_4393
    jr nc, jr_001_4700

    call Call_001_438a

jr_001_4719:
    ld a, $05

Jump_001_471b:
    ld hl, data_01_4d5f
    scf
    jr jr_001_4741

jr_001_4721:
    call Call_001_4769
    jr c, jr_001_4719

    ld a, $02
    call Call_001_4376
    ld hl, data_01_4cef
    ld de, data_01_5b4f
    xor a
    call Call_001_4752
    xor a
    ret


Jump_001_4737:
    call Call_001_4358
    ld hl, data_01_4dfa
    ld a, $07
    pop bc

jr_001_4740:
    or a

Jump_001_4741:
jr_001_4741:
    push af
    jr c, jr_001_4749

    push hl
    call Call_001_4376
    pop hl

jr_001_4749:
    ld de, data_01_5c0f
    pop af
    call Call_001_4752
    scf
    ret


Call_001_4752:
    push af
    call Call_001_508f
    pop af
    jr c, jr_001_475c

    call Call_001_4384

Call_001_475c:
jr_001_475c:
    xor a
    vcall $cc
    db $3e

    or h
    vcall $dc
    db $c9

Call_001_4764:
    ld a, $01
    vcall $cc
    db $c9

Call_001_4769:
    ld hl, $c509
    ld a, [hl+]
    push hl
    inc hl
    ld b, $00
    bit 0, a
    ld a, $fe
    jr z, jr_001_4779

    sub $2e

jr_001_4779:
    sub [hl]
    ld e, a
    ld a, $ff
    sbc b
    ld d, a
    call Call_001_439c
    pop de
    ret c

    ld bc, $0001
    jp Jump_001_4396


Call_001_478a:
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


Call_001_479d:
    ld hl, $c800
    ld bc, $0020
    ldh a, [$c0]
    ld e, a

jr_001_47a6:
    push bc
    push de
    push hl
    vcall $71
    pop hl
    pop de
    pop bc
    call Call_001_4965
    jr nc, jr_001_47b7

    inc e
    inc h
    jr jr_001_47a6

jr_001_47b7:
    ldh a, [$c1]

Call_001_47b9:
    ld de, $0c3c
    ld h, a
    ld bc, $0000
    cp $03
    jr c, jr_001_47ca

    ld c, $01
    ld e, $5c
    sub $03

jr_001_47ca:
    or a
    ret z

    dec a
    jr z, jr_001_47d4

    inc b
    ld a, d
    add $28
    ld d, a

jr_001_47d4:
    inc b
    ld a, d
    add $28
    ld d, a
    ret


data_01_47da::
    db $04, $00, $00, $00, $00, $10, $00, $02, $00, $00, $20, $10, $00, $10, $20, $12
    db $00

Call_001_47eb:
Jump_001_47eb:
    ld hl, $ffc0
    ld de, $ff44
    ld bc, $0001
    vcall $e5
    ldh a, [$c2]
    ld c, a
    ldh a, [$c0]
    cp c
    jr nz, jr_001_480c

    ldh a, [$c3]
    call Call_001_47b9
    ld hl, data_01_47da
    ld a, $1c
    vcall $60
    jr @+$07

jr_001_480c:
    ld bc, $041c
    vcall $c4
    call Call_001_479d

Jump_001_4814:
jr_001_4814:
    call Call_001_4fec
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
    jr nz, jr_001_4877

    bit 6, l
    jp nz, Jump_001_48d7

    bit 7, l
    jp nz, Jump_001_48f2

    bit 5, l
    jr z, jr_001_4814

    ld l, $e2
    bit 2, a
    jr nz, jr_001_48af

    ld a, b
    or a
    jr z, jr_001_484f

    dec b
    dec h
    ld a, d
    sub $28
    ld d, a
    jp Jump_001_4814


jr_001_484f:
    ld a, c
    or a
    jr z, jr_001_485e

    ld b, $02
    ld c, $00
    dec h
    ld de, data_01_5c3c
    jp Jump_001_4814


jr_001_485e:
    ld l, $05

Jump_001_4860:
    ldh a, [$c0]
    or a
    jp z, Jump_001_4814

    ldh a, [$c1]
    add l
    ldh [$c1], a
    ldh a, [$c0]
    sub $06
    jr nc, jr_001_4872

    xor a

jr_001_4872:
    ldh [$c0], a
    jp Jump_001_47eb


jr_001_4877:
    ld l, $1e
    bit 2, a
    jr nz, jr_001_48af

    ld a, b
    cp $02
    jr z, jr_001_488b

    inc h
    inc b
    ld a, d
    add $28
    ld d, a
    jp Jump_001_4814


jr_001_488b:
    ld a, c
    or a
    jr nz, jr_001_489a

    ld b, $00
    ld c, $01
    inc h
    ld de, $0c5c
    jp Jump_001_4814


jr_001_489a:
    ld l, $05

Jump_001_489c:
    ldh a, [$c0]
    add $06
    cp $78
    jp nc, Jump_001_47eb

    ldh [$c0], a
    ldh a, [$c1]
    sub l
    ldh [$c1], a
    jp Jump_001_47eb


jr_001_48af:
    push hl
    ldh a, [$c0]
    ld e, a
    ld d, $00
    ld hl, $001e
    push hl
    vcall $8a
    pop de
    vcall $89
    ld a, l
    pop hl
    jr jr_001_48c4

jr_001_48c2:
    ldh a, [$c0]

jr_001_48c4:
    add l
    cp $c4
    jr nc, jr_001_48d0

    cp $78
    jr c, jr_001_48d2

    xor a
    jr jr_001_48d2

jr_001_48d0:
    sub $88

jr_001_48d2:
    ldh [$c0], a
    jp Jump_001_47eb


Jump_001_48d7:
    ld l, $fa
    bit 2, a
    jr nz, jr_001_48c2

    ld a, c
    or a
    jr nz, jr_001_48e6

    ld l, $03
    jp Jump_001_4860


jr_001_48e6:
    dec c
    ld a, h
    sub $03
    ld h, a
    ld a, e
    sub $20
    ld e, a
    jp Jump_001_4814


Jump_001_48f2:
    ld l, $06
    bit 2, a
    jr nz, jr_001_48c2

    ld a, c
    cp $01
    jr nz, jr_001_4902

    ld l, $03
    jp Jump_001_489c


jr_001_4902:
    ld a, h
    add $03
    ld h, a
    inc c
    ld a, e
    add $20
    ld e, a
    jp Jump_001_4814


Call_001_490e:
    push de
    ld a, h
    ld de, $c800
    add d
    ld d, a
    ld hl, $c500
    ld bc, $0100
    vcall $02
    pop de
    ld a, $00
    ld hl, $0000
    ld bc, $0502
    vcall $c5
    ret


Call_001_4929:
    ld hl, $c500

Call_001_492c:
    ld de, $ffd2
    ld b, $00
    vcall $ea
    db $c9

Call_001_4934:
    ld a, [$c502]
    cp $ff
    jr z, jr_001_494a

    call Call_001_4929
    ld hl, $c500
    ld de, $c400
    ld bc, $002e
    vcall $eb
    ret


jr_001_494a:
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
    vcall $02
    ret


Call_001_4965:
    push hl
    push de
    push bc
    ld de, $c600
    vcall $64
    ld hl, $c600
    pop de
    push de
    ld bc, $0418
    vcall $c0
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


Call_001_498a:
    vcall $e1
    ret nc

    jp Jump_001_66ee


Call_001_4990:
    ldh a, [$c0]
    ld c, a
    ldh a, [$c1]
    add c
    ret


Call_001_4997:
    ld a, $a4
    ld h, $04
    ld bc, $0101
    ld de, $0e0e
    vcall $b3
    ld hl, $1200
    vcall $b6
    ld a, $e4
    ldh [$9d], a
    ld a, $1b
    ldh [$9e], a
    ld de, $0000
    ld bc, $1005
    vcall $58
    ld a, $80
    ld hl, $0e01
    ld de, $0101
    ld bc, $0e03
    vcall $59
    ld a, $83
    ld hl, $0e01
    ld de, $0105
    ld bc, $0e09
    vcall $59
    ld de, $000e
    ld bc, $1004
    vcall $58
    ld a, $8c
    ld hl, $0e01
    ld de, $010f
    ld bc, $0e02
    vcall $59
    ld de, data_01_5d33
    ld bc, $c400
    vcall $62
    ld de, $8000
    ld bc, $0380
    vcall $63
    ld a, $07
    vcall $b4
    ld h, $0a
    ld d, $8c
    ld e, $14
    ld l, $14
    call Call_001_4a28
    ld e, $2c
    ld l, $1a
    call Call_001_4a26
    ld e, $44
    ld l, $20
    call Call_001_4a26
    ld e, $5c
    ld l, $26
    call Call_001_4a26
    ld e, $74
    ld l, $2c
    call Call_001_4a26
    ld e, $8c
    ld l, $32

Call_001_4a26:
    ld h, $ff

Call_001_4a28:
    ld b, $00

Call_001_4a2a:
    push de
    push hl
    ld a, h
    ld h, b
    ld bc, $0301
    vcall $c5
    pop hl
    pop de
    ret


Call_001_4a36:
    push bc
    push de
    push hl
    push af
    push af
    ld hl, $c400
    ld e, $00
    ld bc, $0011
    vcall $a6
    ld hl, $0060
    vcall $bd
    pop af
    ld hl, $c800
    add h
    ld h, a
    push hl
    ld a, [hl+]
    or [hl]
    jr z, jr_001_4a7c

    ld de, $0008
    add hl, de
    ld b, [hl]
    inc hl
    inc hl
    ld a, [hl]
    inc hl
    inc hl
    bit 4, b
    jr z, jr_001_4a6b

    sub $60
    bit 3, b
    jr z, jr_001_4a6b

    sub $60

jr_001_4a6b:
    dec a
    cp $10
    jr c, jr_001_4a72

    ld a, $10

jr_001_4a72:
    ld c, a
    ld b, $00
    ld e, l
    ld d, h
    ld hl, $c400
    vcall $02

jr_001_4a7c:
    ld hl, $c400
    vcall $69
    ld a, $0e
    vcall $b9
    ld a, $0e
    vcall $c8
    ld hl, $0068
    vcall $bd
    pop hl
    ld a, [hl+]
    or [hl]
    jr z, jr_001_4aa3

    push af
    push hl
    inc hl
    ld a, [hl]
    ld de, $0007
    add hl, de
    ld bc, $0d60
    call Call_001_45ec
    pop hl
    pop af

jr_001_4aa3:
    ld bc, $0007
    add hl, bc
    ld e, [hl]
    inc e
    or a
    jr nz, jr_001_4aad

    ld e, a

jr_001_4aad:
    call Call_001_4b45
    ld hl, data_01_4ac2
    vcall $69
    ldh a, [$c0]
    pop de
    add d
    ld e, a
    inc e
    call Call_001_4b45
    pop hl
    pop de
    pop bc
    ret


data_01_4ac2::
    db $b4, $d8, $b1, $20, $20, $4e, $6f, $2e, $00

Call_001_4acb:
Jump_001_4acb:
    ld de, $8c14
    ld hl, $0a14
    ld c, $00

Jump_001_4ad3:
    ld a, c
    call Call_001_4b88

jr_001_4ad7:
    push bc
    ld b, $10
    call Call_001_4a2a
    call Call_001_44a1
    jr nz, jr_001_4aec

    call Call_001_4a28
    call Call_001_44a1
    pop bc
    jr z, jr_001_4ad7

    push bc

jr_001_4aec:
    push af
    call Call_001_4a28
    pop af
    pop bc
    ld b, a
    and $03
    ret nz

    bit 6, b
    jr nz, jr_001_4b1f

    bit 7, b
    jr z, jr_001_4ad7

    ld a, c
    cp $05
    jp z, Jump_001_4acb

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
    jp Jump_001_4ad3


jr_001_4b14:
    ld c, $05
    ld de, $8c8c
    ld hl, $1932
    jp Jump_001_4ad3


jr_001_4b1f:
    ld a, c
    or a
    jr z, jr_001_4b14

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
    jp Jump_001_4ad3


Call_001_4b33:
    call Call_001_4997

Call_001_4b36:
    ld hl, data_01_4f3b
    call Call_001_4bd2
    ld hl, $090e
    vcall $bd
    xor a
    vcall $f1
    ld e, c

Call_001_4b45:
    ld d, $00
    ld hl, $c400
    vcall $a3
    ld hl, $c403
    vcall $69
    ret


Call_001_4b52:
    ld a, $01
    vcall $f1
    ld a, b
    or a
    ret z

    ld a, e
    cp $20
    ccf
    ret


Call_001_4b5e:
    ld hl, $0000
    vcall $bd
    call Call_001_4b52
    jr nc, jr_001_4b6d

    ld a, $10
    vcall $c8
    ret


jr_001_4b6d:
    ld e, a
    ld d, $00
    push af
    ld hl, $c400
    vcall $a3
    pop af
    ld hl, data_01_4c8a
    or a
    jr z, jr_001_4b85

    ld hl, $c404
    vcall $69
    ld hl, data_01_4c77

jr_001_4b85:
    vcall $69
    ret


Call_001_4b88:
    push bc
    push de
    push hl
    ld l, a
    ld h, $00
    add hl, hl
    ld de, data_01_4bf6
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call Call_001_4bd2
    pop hl
    pop de
    pop bc
    ret


Call_001_4b9d:
    push hl
    ld h, $00
    ld l, a
    vcall $bd
    pop hl
    ret


jr_001_4ba5:
    push hl
    ld hl, data_01_4c15
    call Call_001_4bd2
    ld a, $10
    call Call_001_4b9d
    ld a, $20
    vcall $bb
    vcall $69
    pop hl
    jr jr_001_4be1

jr_001_4bba:
    ld a, [hl+]
    push hl
    ld h, [hl]
    ld l, a
    vcall $69
    pop hl
    inc hl
    jr jr_001_4be1

jr_001_4bc4:
    push hl
    ld hl, data_01_4c02
    call Call_001_4bd2
    pop hl
    jr jr_001_4bd2

jr_001_4bce:
    ld a, $0e
    vcall $b9

Call_001_4bd2:
jr_001_4bd2:
    ld a, [hl+]
    cp $ff
    ret z

    cp $fe
    jr z, jr_001_4bc4

    cp $fd
    jr z, jr_001_4ba5

    call Call_001_4b9d

jr_001_4be1:
    ld a, [hl+]
    or a
    jr z, jr_001_4bce

    cp $fc
    jr z, jr_001_4bba

    sub $e0
    jr c, jr_001_4bf1

    vcall $c8
    jr jr_001_4be1

jr_001_4bf1:
    dec hl
    vcall $69
    jr jr_001_4be1

data_01_4bf6::
    db $28, $4e, $44, $4e, $65, $4e, $9b, $4e, $b9, $4e, $ef, $4e

data_01_4c02::
    db $00, $20, $20, $20, $0f, $ba, $c9, $00, $fc, $26, $4c, $ca, $00, $ee, $00, $08
    db $ee, $00, $ff

data_01_4c15::
    db $08, $0f, $20, $20, $20, $be, $dd, $c0, $b8, $bc, $c3, $b2, $d9, $00, $ee, $00
    db $ff, $0e, $cc, $a7, $b2, $d9, $0f, $00, $c3, $de, $b7, $cf, $be, $dd, $00, $0f
    db $ca, $b2, $20, $b2, $b2, $b4, $00, $0e, $b9, $de, $b0, $d1, $ce, $de, $b0, $b2
    db $0f, $00, $ce, $de, $c0, $dd, $0f, $a6, $20, $b5, $bc, $c3, $b8, $c0, $de, $bb
    db $b2, $00, $0f, $b1, $b7, $0e, $b4, $d8, $b1, $0f, $bd, $b3, $b6, $de, $c0, $d8
    db $cf, $be, $dd, $00, $0f, $b1, $b7, $0e, $b4, $d8, $b1, $0f, $a6, $20, $b6, $b8
    db $ce, $00

data_01_4c77::
    db $b4, $d8, $b1, $0f, $cf, $c3, $de, $bc, $de, $ad, $bc, $dd, $b6, $c9, $b3, $c3
    db $de, $bd, $00

data_01_4c8a::
    db $0f, $bc, $de, $ad, $bc, $dd, $0e, $b4, $d8, $b1, $0f, $b6, $de, $20, $b1, $b2
    db $c3, $b2, $cf, $be, $dd, $00

data_01_4ca0::
    db $08, $0f, $c2, $b3, $bc, $dd, $a6, $20, $c1, $ad, $b3, $bc, $bd, $d9, $ca, $de
    db $b1, $b2, $ca, $00, $00, $10, $42, $00, $fc, $47, $4c, $f0, $00, $ff

data_01_4cbe::
    db $08, $fc, $3c, $4c, $c4, $de, $b3, $bc, $a6, $20, $b8, $af, $c2, $b9, $c3, $00
    db $00, $10, $41, $00, $fc, $47, $4c, $f0, $00, $ff

data_01_4cd8::
    db $00, $f0, $00, $08, $fc, $26, $4c, $a6, $20, $b5, $b8, $af, $c3, $b2, $cf, $bd
    db $00, $f0, $00, $10, $f0, $00, $ff

data_01_4cef::
    db $00, $f0, $00, $08, $fc, $26, $4c, $a6, $20, $b5, $b8, $d8, $cf, $bc, $c0, $21
    db $00, $f0, $00, $10, $f0, $00, $ff

data_01_4d06::
    db $00, $f0, $00, $08, $fc, $26, $4c, $a6, $20, $b3, $b9, $c4, $af, $c3, $b2, $cf
    db $bd, $00, $f0, $00, $10, $f0, $00, $ff

data_01_4d1e::
    db $00, $f0, $00, $08, $fc, $26, $4c, $a6, $20, $b3, $b9, $c4, $d8, $cf, $bc, $c0
    db $21, $00, $f0, $00, $10, $f0, $00, $ff

data_01_4d36::
    db $00, $0f, $b1, $b2, $c3, $c9, $00, $fc, $3c, $4c, $c9, $00, $f0, $00, $08, $fc
    db $57, $4c, $f0, $00, $10, $0f, $b6, $b8, $ce, $bc, $c3, $20, $d3, $d7, $af, $c3
    db $b8, $c0, $de, $bb, $b2, $00, $f0, $00, $ff

data_01_4d5f::
    db $00, $0f, $c2, $b3, $bc, $dd, $a6, $20, $bc, $af, $ca, $df, $b2, $bc, $cf, $bc
    db $c0, $00, $f0, $00, $08, $f0, $00, $10, $0f, $d3, $b3, $b2, $c1, $c4, $de, $d4
    db $d8, $c5, $b5, $bc, $c3, $b8, $c0, $de, $bb, $b2, $20, $00, $00, $ff

data_01_4d8d::
    db $00, $0f, $b1, $b2, $c3, $c9, $00, $fc, $3c, $4c, $b6, $de, $00, $f0, $00, $08
    db $47, $42, $20, $4b, $49, $53, $53, $20, $d2, $c6, $ad, $b0, $0f, $c9, $00, $f0
    db $00, $10, $0f, $bc, $de, $ad, $bc, $dd, $bc, $de, $ae, $b3, $c0, $b2, $c3, $de
    db $b1, $d8, $cf, $be, $dd, $20, $00, $00, $ff

data_01_4dc6::
    db $00, $0f, $b1, $b2, $c3, $c6, $20, $b5, $c5, $bc, $de, $00, $fc, $26, $4c, $b6
    db $de, $00, $f0, $00, $08, $0f, $bf, $dd, $bb, $de, $b2, $bc, $cf, $bd, $00, $f0
    db $00, $10, $0f, $b3, $dc, $b6, $de, $b7, $bc, $cf, $bd, $b6, $3f, $00, $fc, $34
    db $4c, $f0, $00, $ff

data_01_4dfa::
    db $10, $f0, $00, $ff

data_01_4dfe::
    db $00, $fc, $57, $4c, $f0, $00, $08, $0f, $b2, $b8, $c2, $b6, $00, $fc, $26, $4c
    db $0f, $a6, $bb, $b8, $bc, $de, $ae, $bc, $c3, $00, $f0, $00, $10, $fc, $69, $4c
    db $bc, $c3, $b8, $c0, $de, $bb, $b2, $00, $00, $ff, $00, $e3, $3c, $20, $bd, $c0
    db $b0, $c4, $20, $3e, $00, $ee, $00, $fd, $a6, $bc, $de, $af, $ba, $b3, $bc, $cf
    db $bd, $20, $0e, $00, $00, $ff, $00, $20, $3c, $00, $fc, $26, $4c, $20, $bc, $de
    db $ae, $b3, $ce, $b3, $3e, $20, $00, $00, $fd, $c9, $bc, $de, $ae, $b3, $ce, $b3
    db $c3, $de, $bd, $20, $00, $00, $ff, $00, $20, $3c, $20, $00, $fc, $26, $4c, $b2
    db $da, $b6, $b4, $20, $3e, $20, $00, $00, $08, $0f, $20, $be, $dd, $c0, $b8, $bc
    db $c0, $20, $00, $fc, $26, $4c, $c4, $20, $00, $00, $10, $0f, $20, $20, $ca, $de
    db $bc, $ae, $a6, $b2, $da, $b6, $b4, $cf, $bd, $00, $ee, $00, $ff, $00, $20, $3c
    db $20, $00, $fc, $26, $4c, $bf, $b3, $bc, $dd, $20, $3e, $20, $00, $00, $fd, $a6
    db $bf, $b3, $bc, $dd, $bc, $cf, $bd, $20, $00, $00, $ff, $00, $20, $3c, $20, $00
    db $fc, $26, $4c, $bc, $de, $ad, $bc, $dd, $20, $3e, $20, $00, $00, $08, $0f, $20
    db $20, $20, $be, $dd, $c0, $b8, $cc, $de, $cc, $de, $dd, $c6, $00, $ee, $00, $10
    db $20, $00, $fc, $26, $4c, $a6, $20, $b3, $b9, $c4, $d8, $cf, $bd, $20, $00, $00
    db $ff, $00, $20, $3c, $20, $00, $fc, $26, $4c, $bb, $b8, $bc, $de, $ae, $20, $3e
    db $20, $00, $00, $fd, $a6, $bb, $b8, $bc, $de, $ae, $bc, $cf, $bd, $20, $00, $00
    db $ff

data_01_4f0f::
    db $00, $0f, $20, $ce, $dd, $c4, $b3, $c6, $bb, $b8, $bc, $de, $ae, $bc, $c3, $00
    db $ee, $00, $08, $fc, $2f, $4f, $ee, $00, $10, $e4, $fc, $34, $4c, $ee, $00, $ff
    db $20, $0f, $d6, $db, $bc, $b2, $c3, $de, $bd, $b6, $3f, $00

data_01_4f3b::
    db $00, $ee, $00, $08, $ee, $00, $10, $ee, $00, $02, $20, $47, $42, $20, $4b, $49
    db $53, $53, $20, $d2, $c6, $ad, $b0, $00, $00, $0e, $0f, $20, $c4, $b3, $db, $b8
    db $00, $fc, $26, $4c, $20, $20, $20, $ba, $00, $00, $ff

data_01_4f66::
    db $fe, $10, $e2, $0f, $bb, $b8, $bc, $de, $ae, $00, $fc, $2d, $4c, $ee, $00, $ff

data_01_4f76::
    db $fe, $10, $e2, $0f, $bf, $b3, $bc, $dd, $00, $fc, $2d, $4c, $ee, $00, $ff

data_01_4f85::
    db $00, $0f, $20, $20, $ba, $c9, $00, $fc, $26, $4c, $a6, $b9, $bc, $c3, $00, $ee
    db $00, $08, $0f, $20, $ba, $ba, $c6, $bc, $de, $ad, $bc, $dd, $bc, $cf, $bd, $b6
    db $3f, $00, $ee, $00, $10, $e4, $fc, $34, $4c, $ee, $00, $ff

data_01_4fb1::
    db $fe, $10, $e2, $0f, $bc, $de, $af, $ba, $b3, $00, $fc, $2d, $4c, $ee, $00, $ff

data_01_4fc1::
    db $00, $0f, $c5, $b2, $cc, $de, $0e, $c3, $de, $b0, $c0, $0f, $c9, $20, $c5, $d7
    db $cd, $de, $b6, $b4, $c3, $de, $00, $00, $08, $fc, $69, $4c, $bc, $cf, $bd, $20
    db $00, $00, $10, $fc, $30, $4f, $fc, $34, $4c, $00, $ff

Call_001_4fec:
    push bc
    push de
    push hl
    ld a, h
    call Call_001_4a36

jr_001_4ff3:
    ld h, $00
    push de
    push hl
    ld a, $00
    ld l, $00
    ld bc, $0502
    vcall $c5
    call Call_001_44a1
    jr nz, jr_001_5013

    ld bc, $0a00
    vcall $c4
    call Call_001_44a1
    jr nz, jr_001_5013

    pop hl
    pop de
    jr jr_001_4ff3

jr_001_5013:
    pop hl
    pop de
    pop hl
    pop de
    pop bc
    ret


Call_001_5019:
    ld hl, data_01_4cbe
    call Call_001_5033

Call_001_501f:
jr_001_501f:
    vcall $b1
    vcall $d8
    and $03
    jr z, jr_001_501f

    and $02
    ret nz

    push af
    ld hl, data_01_4ca0
    call Call_001_4bd2
    pop af
    ret


Call_001_5033:
    push hl
    ld a, $a4
    ld h, $00
    ld bc, $0e02
    ld de, $0310
    vcall $b3
    ld hl, $9800
    ld bc, $0240
    ld e, $04
    vcall $a6
    ld a, $ca
    ld bc, $0e02
    ld de, $0310
    vcall $c9


    ld de, data_01_50b2
    ld bc, $c400
    vcall $62
    ld de, $9000
    ld bc, $0800
    vcall $63
    ld de, $8800
    ld bc, $0470
    vcall $63
    ld hl, $8c70
    ld bc, $0390
    ld e, $00
    vcall $a6
    ld hl, $99a0
    ld de, data_01_5ccf
    ld b, $05
    ld c, $14
    call Call_001_509b
    pop hl
    ld de, data_01_59cf
    call Call_001_508f
    ld a, $01
    vcall $b4
    ret


Call_001_508f:
    push de
    call Call_001_4bd2
    pop de
    ld hl, $9802
    ld b, $0c
    ld c, $10

Call_001_509b:
jr_001_509b:
    push bc
    push hl
    push de
    ld b, $00
    push bc
    vcall $02
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
    jr nz, jr_001_509b

    ret


data_01_50b2::
    db $7f, $ee, $44, $1f, $00, $30, $00, $28, $07, $23, $e8, $0f, $24, $0c, $ee, $ff
    db $01, $30, $0a, $ed, $60, $ff, $f8, $00, $04, $0c, $34, $cc, $c4, $ec, $c3, $04
    db $2c, $fd, $1f, $cf, $de, $ee, $10, $23, $21, $ff, $07, $06, $01, $01, $27, $27
    db $64, $64, $3f, $49, $ee, $22, $c0, $e0, $20, $20, $60, $40, $fd, $e1, $f0, $91
    db $91, $f1, $f1, $ee, $44, $ef, $44, $c4, $44, $0a, $00, $80, $80, $bf, $bf, $36
    db $69, $ee, $20, $02, $02, $47, $c4, $c4, $73, $00, $1f, $69, $47, $02, $ee, $28
    db $28, $7f, $7f, $c8, $f9, $c8, $7e, $7e, $48, $48, $89, $02, $ee, $04, $ff, $04
    db $05, $07, $0c, $08, $0b, $0b, $19, $3c, $9b, $12, $ee, $90, $90, $fc, $fc, $a3
    db $20, $ee, $8f, $fc, $15, $03, $70, $73, $01, $7f, $5f, $72, $62, $9e, $42, $bb
    db $ed, $62, $f1, $e1, $30, $10, $ca, $7f, $ee, $44, $3f, $1f, $f7, $e3, $1e, $0c
    db $3a, $ed, $12, $61, $21, $0d, $c7, $c7, $6e, $00, $81, $e0, $80, $43, $41, $73
    db $0d, $20, $ca, $0a, $00, $ca, $fc, $f8, $f0, $3c, $18, $1c, $14, $1d, $0c, $ff
    db $c7, $24, $24, $49, $00, $0f, $0f, $04, $38, $30, $5f, $b6, $4f, $9f, $f0, $f0
    db $a3, $00, $a0, $b0, $bf, $08, $21, $02, $bf, $6b, $20, $6b, $a0, $35, $10, $6b
    db $bf, $20, $ff, $83, $82, $06, $04, $00, $80, $87, $87, $0c, $69, $6d, $40, $8b
    db $85, $00, $20, $20, $67, $53, $00, $0a, $53, $bf, $20, $99, $99, $01, $0d, $63
    db $09, $67, $12, $0c, $bf, $0f, $00, $a5, $6f, $42, $28, $2c, $bf, $bb, $00, $60
    db $51, $02, $42, $b3, $26, $ed, $29, $15, $ce, $bf, $21, $df, $60, $40, $a0, $60
    db $39, $30, $1f, $0f, $7b, $bf, $40, $03, $02, $01, $01, $97, $c0, $c0, $3f, $4a
    db $31, $97, $34, $24, $ec, $c4, $08, $08, $f7, $30, $10, $60, $60, $97, $40, $24
    db $0c, $28, $f9, $07, $28, $00, $20, $1f, $d6, $95, $72, $ff, $0f, $df, $55, $04
    db $97, $0d, $16, $cc, $04, $1c, $0c, $ef, $fc, $f8, $f8, $97, $38, $38, $44, $44
    db $3c, $7f, $00, $7f, $39, $39, $07, $07, $b1, $20, $97, $f0, $1c, $1c, $63, $63
    db $47, $26, $47, $97, $20, $47, $3f, $a0, $06, $57, $0e, $0e, $11, $11, $21, $21
    db $cf, $46, $46, $f7, $04, $1d, $03, $03, $04, $04, $71, $67, $01, $12, $12, $14
    db $4b, $b1, $00, $af, $06, $ff, $05, $0e, $09, $0c, $0b, $18, $17, $19, $ef, $17
    db $31, $2f, $17, $08, $e0, $60, $78, $98, $ff, $1c, $e4, $4f, $f3, $b3, $bc, $0c
    db $0f, $cf, $02, $03, $95, $b5, $08, $f0, $30, $38, $c8, $33, $95, $41, $20, $0f
    db $0c, $f9, $b1, $00, $07, $06, $ff, $1e, $19, $78, $67, $f3, $8f, $cc, $3c, $df
    db $30, $f0, $b5, $e0, $20, $f0, $10, $30, $ff, $d0, $18, $e8, $98, $e8, $8c, $f4
    db $4c, $bf, $74, $27, $22, $a0, $a0, $90, $90, $7e, $7e, $fc, $10, $10, $08, $08
    db $0f, $0f, $2b, $29, $02, $7e, $29, $22, $22, $49, $49, $85, $85, $43, $00, $cf
    db $0c, $0c, $b9, $2b, $20, $28, $28, $27, $27, $03, $37, $79, $00, $2b, $b9, $00
    db $b9, $35, $00, $e1, $e1, $ff, $13, $12, $17, $14, $32, $2e, $62, $5e, $ff, $e4
    db $9c, $c8, $b8, $89, $79, $93, $73, $f3, $16, $f6, $2c, $ec, $4f, $83, $00, $3c
    db $3c, $fa, $e2, $e2, $82, $82, $02, $52, $06, $45, $00, $ff, $9e, $e6, $67, $79
    db $19, $1e, $04, $07, $07, $43, $83, $20, $d1, $83, $02, $5f, $70, $90, $3c, $fe
    db $cc, $ce, $f2, $26, $3a, $4e, $72, $83, $22, $33, $91, $55, $00, $1c, $13, $5d
    db $5d, $00, $3c, $33, $ff, $79, $47, $e6, $9e, $98, $78, $60, $e0, $03, $79, $75
    db $40, $07, $0d, $00, $0d, $bb, $00, $18, $18, $ff, $38, $38, $6c, $6c, $66, $7a
    db $27, $39, $fc, $13, $1d, $11, $1e, $09, $0e, $bc, $15, $00, $cf, $02, $03, $bc
    db $6f, $20, $90, $9f, $a0, $bf, $ff, $e1, $7f, $e1, $3f, $62, $be, $45, $c5, $30
    db $7f, $cd, $00, $89, $89, $07, $19, $20, $19, $b9, $00, $c3, $1c, $1c, $b9, $bd
    db $02, $69, $17, $20, $e6, $e5, $ff, $2c, $2b, $7e, $79, $ff, $f0, $3f, $e0, $ff
    db $7f, $e0, $ff, $c0, $7f, $43, $28, $e8, $bf, $42, $e0, $e2, $12, $f0, $cc, $3c
    db $f3, $f9, $0f, $fc, $03, $fe, $01, $d1, $00, $57, $98, $fb, $18, $10, $90, $a0
    db $00, $dd, $00, $d8, $d8, $ff, $66, $c6, $14, $14, $24, $24, $4d, $4d, $ff, $49
    db $49, $9a, $9b, $12, $13, $34, $37, $ff, $28, $2f, $8c, $f4, $98, $e8, $18, $e8
    db $df, $30, $d0, $e5, $60, $a0, $e0, $20, $c0, $fe, $40, $19, $17, $18, $17, $0c
    db $0b, $f3, $00, $fc, $06, $05, $07, $04, $03, $02, $33, $5b, $00, $ff, $8f, $8f
    db $86, $86, $42, $c2, $43, $c3, $ff, $21, $e1, $30, $f0, $90, $70, $44, $44, $e7
    db $06, $06, $02, $fc, $31, $10, $80, $80, $88, $e7, $88, $31, $31, $6d, $33, $00
    db $41, $01, $02, $fd, $43, $0c, $0f, $33, $3c, $cf, $a6, $c0, $ef, $74, $9c, $78
    db $45, $00, $88, $f8, $08, $fc, $ec, $04, $fe, $02, $39, $ff, $71, $8a, $20, $21
    db $06, $fb, $00, $fb, $f9, $00, $f9, $72, $01, $ff, $8f, $4f, $fa, $07, $ff, $06
    db $ff, $00, $57, $71, $80, $61, $7e, $58, $70, $e4, $54, $fe, $3e, $f9, $07, $bb
    db $7f, $57, $51, $e0, $09, $0e, $11, $1e, $f3, $fd, $f7, $63, $fd, $0e, $f2, $39
    db $06, $fa, $0e, $01, $19, $00, $19, $3f, $26, $93, $21, $0a, $93, $3f, $00, $88
    db $ff, $78, $c8, $b8, $c4, $bc, $65, $5d, $73, $ff, $4f, $70, $6f, $5b, $74, $5f
    db $70, $06, $fe, $07, $19, $1e, $67, $78, $9f, $e0, $2d, $61, $57, $34, $60, $7f
    db $64, $76, $02, $d6, $58, $25, $71, $c3, $ff, $70, $5f, $64, $30, $3f, $8f, $26
    db $c0, $40, $63, $f5, $07, $06, $9f, $a0, $21, $57, $31, $c0, $7f, $ff, $70, $4f
    db $7c, $87, $fe, $89, $f9, $08, $bc, $f8, $61, $40, $ff, $10, $ff, $4e, $03, $5e
    db $f1, $7f, $60, $ff, $e7, $2f, $10, $54, $58, $70, $fb, $ff, $0f, $f5, $1d, $f9
    db $19, $e4, $24, $f9, $fe, $39, $d0, $50, $88, $88, $87, $87, $9b, $f7, $fc, $fc
    db $02, $02, $01, $00, $c1, $c1, $21, $e7, $21, $22, $22, $51, $9b, $00, $3f, $3f
    db $40, $bf, $40, $f2, $83, $83, $84, $84, $44, $44, $7f, $61, $00, $cf, $f8, $af
    db $b8, $9f, $9c, $0f, $ff, $0c, $9f, $9e, $09, $09, $11, $11, $e0, $f7, $e0, $ff
    db $78, $ff, $1e, $f0, $ff, $30, $10, $35, $52, $ea, $0e, $01, $02, $25, $24, $02
    db $36, $0e, $40, $ff, $01, $fe, $06, $fa, $0e, $f1, $3f, $d1, $e1, $df, $10, $1f
    db $f5, $f2, $08, $03, $b1, $41, $07, $f4, $07, $08, $08, $10, $c7, $20, $cb, $10
    db $01, $7f, $55, $20, $37, $37, $0c, $0c, $04, $04, $03, $b7, $03, $08, $10, $f0
    db $df, $20, $d0, $f0, $30, $b7, $30, $c5, $28, $28, $c7, $00, $1f, $18, $17, $e3
    db $1c, $0b, $0f, $f3, $d7, $00, $c7, $14, $14, $13, $c5, $01, $a3, $94, $00, $07
    db $51, $c9, $24, $c0, $c0, $00, $b7, $7d, $00, $c7, $c5, $00, $c5, $d9, $00, $d9
    db $8d, $00, $f1, $7f, $40, $ff, $c0, $61, $d7, $60, $a5, $f8, $ec, $18, $f0, $70
    db $e5, $82, $08, $0f, $3f, $f5, $80, $30, $bd, $65, $20, $ec, $ec, $e7, $09, $42
    db $cb, $cb, $28, $c8, $1f, $1f, $b3, $b7, $20, $ff, $99, $b7, $34, $15, $60, $c5
    db $04, $f8, $f8, $b7, $c5, $41, $ed, $68, $52, $1b, $0f, $1b, $26, $87, $79, $40
    db $cb, $2f, $27, $7c, $78, $f7, $27, $23, $2e, $2c, $79, $40, $01, $01, $e1, $bd
    db $e1, $db, $e1, $c1, $21, $21, $79, $40, $05, $f7, $05, $7f, $3f, $e0, $24, $1e
    db $71, $61, $21, $99, $60, $28, $0c, $81, $36, $6c, $e9, $00, $28, $06, $4c, $fa
    db $06, $02, $6c, $97, $44, $0f, $0f, $79, $50, $00, $37, $87, $4f, $26, $f0, $f0
    db $6c, $c7, $c5, $07, $e3, $06, $84, $84, $a3, $04, $b1, $64, $00, $ff, $fe, $8f
    db $23, $cd, $3a, $10, $64, $60, $20, $6c, $44, $fd, $48, $48, $4c, $48, $4f, $47
    db $79, $22, $61, $fb, $41, $03, $01, $03, $02, $54, $e2, $e2, $0f, $79, $20, $53
    db $79, $00, $41, $40, $40, $60, $40, $01, $d7, $04, $8b, $8f, $04, $f7, $c9, $02
    db $f1, $54, $32, $02, $3f, $19, $aa, $84, $1f, $0f, $18, $10, $19, $11, $cb, $1f
    db $0e, $11, $15, $00, $c0, $1c, $e0, $b8, $98, $18, $f1, $40, $2b, $07, $07, $ae
    db $02, $19, $87, $40, $71, $3a, $ff, $ff, $20, $3e, $12, $33, $f1, $21, $18, $11
    db $cf, $89, $80, $f1, $c6, $df, $1a, $d3, $20, $53, $01, $27, $20, $7a, $21, $fc
    db $fb, $f6, $00, $e1, $00, $1a, $dd, $00, $06, $de, $02, $22, $00, $6a, $00, $c0
    db $7b, $9e, $00, $87, $00, $58, $62, $05, $00, $63, $c2, $40, $44, $d8, $88, $40
    db $12, $7e, $00, $12, $2f, $ad, $00, $32, $06, $10, $89, $40, $48, $3f, $00, $00
    db $5f, $42, $08, $89, $60, $32, $2e, $62, $5e, $e4, $ff, $9c, $c8, $b8, $88, $78
    db $90, $70, $10, $fa, $f0, $20, $e0, $01, $01, $c5, $10, $63, $12, $ff, $08, $08
    db $0c, $0c, $0e, $0e, $1b, $1b, $ff, $9e, $e6, $67, $79, $19, $1e, $04, $07, $9f
    db $03, $fc, $ec, $78, $9c, $9c, $a3, $bf, $c3, $fb, $7f, $ec, $3c, $70, $b0, $ec
    db $c0, $c0, $6f, $c5, $00, $70, $70, $5d, $40, $c0, $21, $e0, $ff, $10, $f1, $cc
    db $3c, $f3, $0f, $fc, $03, $fd, $fe, $01, $11, $11, $30, $30, $c5, $01, $40, $3d
    db $3d, $d8, $00, $c8, $c8, $26, $e6, $6b, $78, $ff, $78, $31, $31, $21, $21, $62
    db $63, $c2, $ff, $c3, $84, $87, $08, $0f, $74, $94, $78, $ff, $98, $78, $88, $fb
    db $0b, $fe, $06, $fe, $fa, $02, $ff, $03, $ff, $71, $67, $07, $04, $e1, $6f, $67
    db $00, $f0, $f0, $d2, $e6, $1e, $f9, $07, $6f, $ab, $03, $ff, $00, $f7, $e0, $09
    db $0e, $11, $ff, $1e, $93, $9d, $63, $fd, $0f, $f3, $fe, $fd, $03, $fc, $07, $f8
    db $0f, $80, $0f, $10, $33, $ff, $33, $4c, $4c, $90, $90, $a1, $a1, $a0, $e1, $a0
    db $88, $88, $5f, $97, $20, $b1, $67, $00, $05, $e3, $05, $86, $87, $2b, $57, $00
    db $55, $c4, $bc, $ff, $e5, $dd, $f3, $cf, $30, $ef, $3b, $f4, $ef, $3f, $f0, $fc
    db $07, $00, $13, $f0, $10, $e0, $77, $9f, $20, $c0, $40, $0f, $20, $54, $d4, $d3
    db $b6, $d3, $b1, $10, $10, $27, $02, $06, $06, $1f, $3f, $2b, $00, $29, $89, $89
    db $75, $75, $0a, $0a, $f7, $1c, $1c, $e0, $e0, $92, $00, $4f, $c8, $8f, $ec, $88
    db $07, $04, $73, $03, $02, $1f, $02, $1f, $7b, $92, $40, $07, $05, $c7, $c6, $29
    db $84, $84, $36, $7e, $40, $b3, $fe, $ff, $1f, $09, $fd, $fd, $7b, $e6, $03, $1e
    db $1c, $7d, $62, $7e, $f0, $f8, $27, $04, $fd, $18, $10, $70, $60, $40, $40, $7e
    db $02, $d7, $06, $0e, $59, $00, $0e, $ca, $0c, $0e, $87, $ba, $87, $20, $00, $01
    db $81, $83, $d4, $82, $d8, $02, $6b, $7e, $ff, $ff, $17, $00, $90, $55, $10, $1b
    db $ee, $11, $1f, $0e, $a9, $a3, $07, $06, $03, $7c, $33, $bd, $06, $ff, $80, $c0
    db $7e, $20, $cc, $08, $0c, $4f, $7e, $21, $18, $17, $7e, $21, $3c, $33, $79, $47
    db $fe, $e6, $9e, $98, $78, $60, $e0, $c0, $0a, $1e, $17, $00, $29, $4c, $00, $1e
    db $1e, $23, $23, $93, $3f, $93, $02, $53, $66, $7a, $27, $39, $13, $1d, $ff, $91
    db $9e, $c9, $ce, $68, $6f, $34, $37, $ff, $1a, $1b, $14, $14, $92, $92, $99, $99
    db $ff, $49, $c9, $4c, $cc, $24, $e4, $36, $f6, $cf, $92, $72, $17, $00, $b7, $0c
    db $0c, $04, $04, $ff, $82, $80, $42, $42, $0d, $0d, $33, $31, $ef, $0a, $0b, $21
    db $d3, $00, $21, $22, $83, $8c, $ff, $0f, $33, $3c, $cf, $f0, $3f, $c0, $13, $fe
    db $15, $1f, $1e, $67, $78, $9f, $e0, $7d, $97, $ff, $de, $00, $de, $60, $ad, $40
    db $01, $01, $c1, $b1, $c1, $95, $81, $81, $95, $0a, $eb, $28, $04, $7c, $90, $38
    db $ef, $f9, $01, $0f, $ea, $f9, $00, $81, $ef, $42, $d9, $f0, $f0, $ef, $fc, $f8
    db $64, $06, $ef, $1f, $ef, $0f, $78, $70, $ef, $60, $50, $50, $28, $28, $57, $28
    db $60, $37, $24, $20, $a2, $02, $02, $22, $50, $f7, $10, $62, $fa, $42, $9b, $21
    db $9a, $04, $32, $a2, $c6, $0f, $06, $b5, $0a, $9f, $a1, $82, $03, $03, $a2, $6f
    db $65, $00, $0c, $08, $60, $38, $10, $f0, $60, $cf, $c0, $80, $a1, $80, $9e, $07
    db $03, $0e, $0c, $3a, $a2, $20, $e9, $60, $40, $c0, $52, $06, $80, $3a, $a3, $42
    db $5f, $10, $c3, $62, $04, $29, $3a, $10, $10, $cf, $b0, $20, $ab, $02, $a2, $32
    db $2e, $62, $5e, $ff, $e4, $9c, $c8, $b8, $88, $78, $91, $71, $f3, $12, $f2, $24
    db $e4, $02, $00, $56, $90, $90, $f7, $a0, $a0, $c1, $c1, $04, $40, $9e, $e6, $67
    db $f3, $79, $19, $1e, $04, $47, $2a, $10, $18, $18, $7f, $ea, $3c, $33, $79, $47
    db $e6, $9e, $98, $dc, $78, $60, $e7, $00, $c0, $0c, $0c, $f5, $b9, $00, $1d, $56
    db $2f, $00, $f5, $41, $41, $40, $c9, $30, $66, $ff, $7a, $a7, $b9, $93, $9d, $91
    db $9e, $89, $fe, $8e, $c8, $cf, $a4, $a7, $92, $93, $78, $df, $78, $f8, $8d, $03
    db $14, $f4, $cf, $3f, $f3, $f7, $0f, $fc, $03, $fe, $03, $07, $07, $09, $bf, $09
    db $97, $00, $21, $21, $e0, $e0, $3e, $fe, $1f, $b9, $43, $11, $03, $02, $03, $42
    db $03, $54, $e1, $87, $18, $2f, $8f, $20, $56, $52, $20, $fa, $35, $e7, $f0, $94
    db $72, $b9, $00, $c9, $70, $70, $48, $9f, $48, $c7, $00, $61, $02, $82, $3d, $3d
    db $82, $ff, $83, $8f, $8f, $11, $11, $12, $13, $ec, $ff, $ef, $33, $3c, $cf, $f0
    db $3f, $c0, $99, $fb, $79, $e7, $1f, $f9, $07, $eb, $03, $ff, $00, $7f, $47, $e0
    db $46, $47, $59, $5e, $67, $78, $c8, $9f, $e0, $3d, $03, $47, $60

data_01_59cf::
    db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02
    db $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f, $10, $04, $11
    db $03, $04, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $04, $11
    db $1e, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $20
    db $04, $04, $04, $21, $04, $04, $04, $04, $21, $04, $04, $04, $22, $23, $24, $04
    db $04, $25, $04, $04, $26, $27, $28, $04, $04, $29, $2a, $2b, $2c, $2d, $04, $04
    db $04, $04, $2e, $2f, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $04, $04
    db $04, $04, $3a, $3b, $3c, $3d, $3e, $3f, $40, $41, $42, $43, $44, $04, $04, $04
    db $04, $04, $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f, $50, $04, $04
    db $04, $04, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $04, $04
    db $04, $5d, $5e, $5f, $60, $61, $62, $04, $04, $5d, $63, $64, $65, $66, $62, $04
    db $04, $67, $68, $69, $6a, $68, $6b, $04, $04, $67, $68, $69, $6a, $68, $6b, $04

data_01_5a8f::
    db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02
    db $03, $6c, $6d, $6e, $6f, $70, $71, $72, $05, $06, $07, $73, $74, $04, $04, $11
    db $03, $75, $76, $77, $78, $79, $7a, $7b, $12, $13, $14, $7c, $7d, $7e, $7f, $11
    db $1e, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $20
    db $04, $04, $04, $04, $04, $04, $80, $81, $82, $83, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $26, $27, $28, $84, $85, $29, $2a, $2b, $04, $04, $04, $04
    db $04, $04, $2e, $2f, $86, $87, $88, $33, $34, $35, $36, $37, $89, $8a, $04, $04
    db $04, $04, $3a, $3b, $8b, $8c, $8d, $3f, $40, $41, $42, $43, $8e, $8f, $04, $04
    db $04, $04, $45, $46, $47, $90, $91, $92, $93, $94, $4d, $4e, $4f, $50, $04, $04
    db $04, $04, $51, $52, $53, $54, $95, $96, $97, $98, $59, $5a, $5b, $5c, $04, $04
    db $04, $5d, $5e, $5f, $60, $61, $62, $04, $04, $5d, $63, $64, $65, $66, $62, $04
    db $04, $67, $68, $69, $6a, $68, $6b, $04, $04, $67, $68, $69, $6a, $68, $6b, $04

data_01_5b4f::
    db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02
    db $03, $04, $04, $04, $05, $06, $07, $99, $9a, $9b, $9c, $9d, $04, $04, $04, $11
    db $03, $04, $04, $04, $12, $13, $14, $9e, $9f, $a0, $a1, $a2, $04, $04, $04, $11
    db $1e, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $20
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $04, $04, $04, $04, $26, $27, $28, $04, $04, $29, $2a, $2b, $04, $04, $04, $04
    db $04, $04, $2e, $2f, $30, $31, $32, $33, $34, $a3, $a4, $a5, $89, $8a, $04, $04
    db $04, $04, $3a, $3b, $3c, $3d, $3e, $3f, $40, $a6, $a7, $a8, $8e, $8f, $04, $04
    db $04, $04, $45, $46, $47, $48, $91, $92, $93, $94, $a9, $4e, $4f, $50, $04, $04
    db $04, $04, $51, $52, $53, $54, $95, $96, $97, $98, $59, $5a, $5b, $5c, $04, $04
    db $04, $5d, $5e, $5f, $60, $61, $62, $04, $04, $5d, $63, $64, $65, $66, $62, $04
    db $04, $67, $68, $69, $6a, $68, $6b, $04, $04, $67, $68, $69, $6a, $68, $6b, $04

data_01_5c0f::
    db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02
    db $03, $04, $05, $06, $07, $aa, $ab, $ac, $ad, $ae, $af, $b0, $04, $9d, $04, $11
    db $03, $04, $12, $13, $14, $b1, $b2, $b3, $b4, $b5, $b6, $b7, $b8

data_01_5c3c::
    db $a2, $04, $11, $1e, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f
    db $1f, $1f, $20, $04, $04, $04, $21, $04, $04, $04, $04, $04, $04, $04, $04, $22
    db $23, $04, $04, $04, $04, $04, $04, $26, $27, $28, $04, $04, $29, $2a, $2b, $2c
    db $2d, $04, $04, $04, $04, $2e, $2f, $b9, $ba, $bb, $33, $34, $bc, $bd, $be, $38
    db $39, $04, $04, $04, $04, $3a, $3b, $bf, $c0, $c1, $3f, $40, $c2, $c3, $c4, $44
    db $04, $04, $04, $04, $04, $45, $46, $47, $c5, $49, $4a, $4b, $4c, $c6, $4e, $4f
    db $50, $04, $04, $04, $04, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b
    db $5c, $04, $04, $04, $5d, $5e, $5f, $60, $61, $62, $04, $04, $5d, $63, $64, $65
    db $66, $62, $04, $04, $67, $68, $69, $6a, $68, $6b, $04, $04, $67, $68, $69, $6a
    db $68, $6b, $04

data_01_5ccf::
    db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
    db $01, $01, $01, $02, $03, $04, $ca, $cd, $d0, $d3, $d6, $d9, $dc, $df, $e2, $e5
    db $e8, $eb, $ee, $f1, $f4, $f7, $04, $11, $03, $04, $cb, $ce, $d1, $d4, $d7, $da
    db $dd, $e0, $e3, $e6, $e9, $ec, $ef, $f2, $f5, $f8, $04, $11, $03, $04, $cc, $cf
    db $d2, $d5, $d8, $db, $de, $e1, $e4, $e7, $ea, $ed, $f0, $f3, $f6, $f9, $04, $11
    db $1e, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f
    db $1f, $1f, $1f, $20

data_01_5d33::
    db $bc, $ff, $ee, $1f, $c0, $3f, $c0, $20, $f5, $06, $fe, $30, $17, $ef, $00, $80
    db $7f, $2c, $ef, $22, $30, $36, $ff, $00, $47, $df, $f1, $ed, $6c, $1f, $30, $80
    db $ff, $91, $63, $ff, $0f, $74, $c4, $ff, $d5, $a7, $60, $fc, $00, $fa, $06, $e0
    db $0a, $f6, $0a, $f2, $f6, $ff, $07, $18, $d0, $f1, $df, $02, $fe, $2c, $01, $3f
    db $3f, $7f, $40, $ff, $fe, $80, $ff, $81, $ff, $97, $ff, $99, $37, $ef, $91, $ff
    db $87, $35, $10, $9f, $ff, $82, $ff, $87, $8c, $33, $31, $00, $2f, $ad, $41, $ff
    db $02, $ff, $ff, $e4, $ff, $11, $ff, $d2, $ff, $16, $ff, $a9, $ca, $55, $f2, $45
    db $13, $62, $51, $ee, $00, $fc, $b8, $fe, $56, $01, $ff, $f9, $73, $12, $74, $5a
    db $04, $21, $7e, $3e, $00, $61, $73, $71, $00, $6f, $2f, $51, $88, $ce, $ff, $8b
    db $39, $44, $01, $9b, $ff, $9e, $9d, $87, $8a, $97, $10, $a4, $4a, $a0, $46, $ef
    db $ff, $c2, $74, $ec, $11, $e5, $ff, $25, $b7, $22, $c1, $3a, $6a, $ff, $51, $ff
    db $e9, $ff, $49, $ff, $d1, $ff, $e0, $59, $ff, $69, $d7, $10, $d6, $dc, $00, $e0
    db $8a, $a1, $bb, $84, $43, $8e, $ff, $95, $f9, $31, $8f, $ff, $87, $85, $03, $44
    db $0a, $4a, $34, $01, $f7, $ff, $a2, $7f, $19, $67, $ff, $92, $ff, $e2, $ff, $c7
    db $54, $51, $1b, $f1, $69, $b1, $d7, $11, $a9, $7b, $3a, $25, $8a, $21, $3f, $8a
    db $a0, $a4, $81, $97, $11, $98, $01, $5c, $96, $01, $89, $a3, $8c, $ff, $93, $a9
    db $b0, $c4, $ff, $43, $ff, $e4, $ff, $8d, $ff, $f4, $ff, $e8, $c5, $ff, $24, $bf
    db $11, $15, $bd, $2a, $a3, $46, $23, $97, $70, $28, $09, $47, $d0, $16, $02, $21
    db $9e, $ff, $ef, $91, $ff, $96, $15, $86, $ff, $83, $ff, $8f, $9c, $09, $b0, $22
    db $78, $23, $1d, $ff, $94, $ff, $e8, $55, $ff, $44, $03, $75, $89, $ff, $9a, $ab
    db $91, $94, $95, $b9, $c0, $01, $99, $bd, $9f, $1d, $5c, $68, $90, $16, $df, $10
    db $e0, $56, $3b, $12, $38, $e0, $00, $36, $ba, $64, $e9, $b1, $71, $ff, $89, $a7
    db $a9, $f5, $30, $00, $f6, $5c, $02, $64, $aa, $30, $3e, $20, $cf, $b3, $cd, $27
    db $66, $cd, $d3, $64

Jump_001_5ea7:
    call Call_001_657f
    ld a, $01
    call Call_001_66c2
    ld de, data_01_470d
    ld hl, $c699
    vcall $54
    ld a, $03
    vcall $b4

jr_001_5ebb:
    vcall $b1
    vcall $d8
    ld c, a
    and $06
    jp nz, Jump_001_5f61

    ld a, c
    and $09
    jr nz, jr_001_5ef2

    bit 6, c
    jr nz, jr_001_5ed7

    bit 7, c
    jr nz, jr_001_5edf

    call Call_001_5f2d
    jr jr_001_5ebb

jr_001_5ed7:
    call Call_001_5ee7
    call Call_001_5f21
    jr jr_001_5ebb

jr_001_5edf:
    call Call_001_5ee7
    call Call_001_5f15
    jr jr_001_5ebb

Call_001_5ee7:
    xor a
    ldh [$c1], a
    call Call_001_6181
    ld c, $11
    vcall $5d
    ret


jr_001_5ef2:
    xor a
    call Call_001_66c2
    call Call_001_6181
    vcall $55
    jr c, jr_001_5f0e

    ld a, $01
    ldh [$c2], a
    ldh a, [$8a]
    bit 2, a
    jp nz, Jump_001_5f61

    call Call_001_5f15
    xor a
    ldh [$c1], a

jr_001_5f0e:
    ld a, $01
    call Call_001_66c2
    jr jr_001_5ebb

Call_001_5f15:
    ldh a, [$c0]
    inc a
    cp $09
    jr c, jr_001_5f1e

    ld a, $01

jr_001_5f1e:
    ldh [$c0], a
    ret


Call_001_5f21:
    ldh a, [$c0]
    dec a
    bit 7, a
    jr z, jr_001_5f2a

    ld a, $08

jr_001_5f2a:
    ldh [$c0], a
    ret


Call_001_5f2d:
    ld hl, $ffc1
    ld a, [hl]
    inc [hl]
    and $0f
    ret z

    bit 4, [hl]
    push af
    call Call_001_6181
    ld c, $11
    pop af
    jr z, jr_001_5f44

    vcall $5d
    jr jr_001_5f60

jr_001_5f44:
    ld b, e

jr_001_5f45:
    push hl
    push de
    push bc
    ld e, [hl]
    vcall $4b
    push hl
    ld hl, $c3ee
    ld a, $ff
    ld [hl+], a
    ld [hl], a
    pop hl
    vcall $02
    pop bc
    pop de
    pop hl
    inc hl
    ld a, b
    add d
    ld d, a
    dec c
    jr nz, jr_001_5f45

jr_001_5f60:
    ret


Jump_001_5f61:
    call Call_001_5ee7
    call Call_001_6501

Jump_001_5f67:
jr_001_5f67:
    xor a
    ld de, data_01_5f82
    vcall $5f
    jp c, Jump_001_5ea7

    ld l, a
    ld h, $00
    vcall $06

data_01_5f75::
    db $06, $31, $ff, $a7, $00, $f7, $00, $3e, $01, $39, $00, $24, $00

data_01_5f82::
    db $06, $04, $05, $70, $7f, $02, $00

Call_001_5f89:
    push af
    call Call_001_652c
    pop af
    add a
    ld c, a
    ld b, $00
    ld hl, data_01_61a1
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld d, $30
    ld e, $01
    vcall $5a
    ld a, d
    ldh [$c4], a
    or a
    ret


    ldh a, [$c2]
    or a
    jr z, jr_001_5fb5

    ld a, $08
    call Call_001_5f89
    call Call_001_6169
    jr nc, jr_001_5fb5

    jr jr_001_5f67

Jump_001_5fb5:
jr_001_5fb5:
    vcall $01
    call Call_001_657f
    ldh a, [$c0]
    push af
    ld a, $01
    ldh [$c0], a
    ld a, $07
    call Call_001_5f89
    ld a, $03
    vcall $b4

jr_001_5fca:
    vcall $b1
    vcall $d8
    bit 6, a
    jr nz, jr_001_5fed

    bit 7, a
    jr nz, jr_001_5ffa

    bit 0, a
    jr nz, jr_001_6002

    bit 4, a
    jr nz, jr_001_6002

    and $06
    jr nz, jr_001_5fe7

jr_001_5fe2:
    call Call_001_5f2d
    jr jr_001_5fca

jr_001_5fe7:
    pop af
    ldh [$c0], a
    jp Jump_001_5f61


jr_001_5fed:
    call Call_001_5ee7

jr_001_5ff0:
    call Call_001_5f21
    ldh a, [$c0]
    or a
    jr z, jr_001_5ff0

    jr jr_001_5fe2

jr_001_5ffa:
    call Call_001_5ee7
    call Call_001_5f15
    jr jr_001_5fe2

jr_001_6002:
    call Call_001_5ee7
    vcall $11
    ld hl, $0400
    vcall $b6
    call Call_001_614f
    vcall $70
    call Call_001_5f15
    ld hl, $0404
    vcall $b6
    vcall $11
    vcall $db
    jr jr_001_5fca

    ldh a, [$c0]
    push af
    xor a
    ldh [$c0], a

jr_001_6025:
    call Call_001_614f
    or a
    jr nz, jr_001_6037

    ld a, $09
    call Call_001_5f89
    call Call_001_6173
    pop af
    jp Jump_001_5ea7


jr_001_6037:
    inc a
    ld c, a
    ld de, $c6df
    ld a, $81
    ld [de], a
    ld hl, $c500
    ld c, $00
    vcall $6b
    jr c, jr_001_6059

    ld a, $0a
    call Call_001_5f89
    call Call_001_6169
    jr c, jr_001_606b

    ld hl, $c500
    vcall $ef
    jr jr_001_6025

jr_001_6059:
    call Call_001_66ab
    ld a, $06
    jr c, jr_001_6065

    xor a
    ldh [$c2], a
    ld a, $0b

jr_001_6065:
    call Call_001_5f89
    call Call_001_6173

jr_001_606b:
    pop af
    ldh [$c0], a
    jp Jump_001_5f67


    call Call_001_657f
    ld a, $0c
    call Call_001_5f89
    ld a, $03
    vcall $b4
    call Call_001_6169
    jp c, Jump_001_5f61

    ld a, $0d
    call Call_001_5f89
    ld a, $01
    vcall $cc
    vcall $c3
    call Call_001_611d
    jr c, jr_001_60b0

    ld hl, $c600
    ld e, l
    ld d, h
    ld c, $99
    vcall $7f
    jr c, jr_001_60b5

    vcall $73
    jr c, jr_001_60b5

    ld a, $0e
    call Call_001_5f89

jr_001_60a7:
    xor a
    vcall $cc
    call Call_001_6173
    jp Jump_001_5f61


jr_001_60b0:
    call Call_001_6114
    jr jr_001_60a7

jr_001_60b5:
    call Call_001_6112
    jr jr_001_60a7

    ldh a, [$c2]
    or a
    jr z, jr_001_60c9

    ld a, $12
    call Call_001_5f89
    call Call_001_6169
    jr c, jr_001_6103

jr_001_60c9:
    ld a, $11
    call Call_001_5f89
    vcall $c3
    ld de, data_01_661d
    ld hl, $c6d5
    ld bc, $000a
    vcall $02
    ld a, $01
    vcall $cc
    vcall $72
    push af
    xor a
    vcall $cc
    pop af
    jr c, jr_001_610d
    ld a, [$c6d5]
    or a
    jr z, jr_001_6106

    xor a
    ldh [$c0], a
    call Call_001_5ee7
    call Call_001_5f15
    ld a, $0e
    call Call_001_5f89
    ld a, $01
    ldh [$c2], a

jr_001_6100:
    call Call_001_6173

jr_001_6103:
    jp Jump_001_5f67


jr_001_6106:
    ld a, $0f
    call Call_001_5f89
    jr jr_001_6100

jr_001_610d:
    call Call_001_6112
    jr jr_001_6100

Call_001_6112:
    ld a, $10

Call_001_6114:
    call Call_001_5f89

jr_001_6117:
    vcall $d8
    or a
    jr nz, jr_001_6117

    ret


Call_001_611d:
    ld hl, $c6d5
    ld de, $c400
    ld bc, $000a
    vcall $7c
    jr c, jr_001_6146

    ld hl, $c400
    ld de, data_01_661d
    ld bc, $000a
    vcall $67
    or a
    jr nz, jr_001_6149

    inc a
    ld hl, $c400
    ld [hl], a
    ld de, $c6d5
    ld bc, $000a
    vcall $7f
    ret nc

jr_001_6146:
    ld a, $10
    ret


jr_001_6149:
    vcall $73
    ld a, $0f
    scf
    ret


Call_001_614f:
    call Call_001_6181
    ld de, $c708
    push de
    inc c
    dec c
    jr z, jr_001_6160

jr_001_615a:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_001_615a

jr_001_6160:
    xor a
    ld [de], a
    pop de
    ld hl, $c6e0
    vcall $4f
    ret


Call_001_6169:
    ldh a, [$c4]
    ld d, a
    ld e, $01
    ld hl, data_01_64c5
    vcall $5a

Call_001_6173:
jr_001_6173:
    vcall $b1
    vcall $d8
    and $03
    jr z, jr_001_6173

    or a
    bit 1, a
    ret z

    scf
    ret


Call_001_6181:
    ld b, $11
    ldh a, [$c0]
    or a
    jr nz, jr_001_618a

    ld b, $0c

jr_001_618a:
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
    vcall $4d
    ld c, a
    ret


data_01_61a1::
    db $c9, $61, $de, $61, $f4, $61, $16, $62, $39, $62, $52, $62, $6f, $62, $9c, $62
    db $c9, $62, $ef, $62, $2d, $63, $5e, $63, $73, $63, $99, $63, $b5, $63, $d1, $63
    db $0b, $64, $3c, $64, $65, $64, $90, $64, $01, $0e, $0f, $cd, $dd, $bc, $ad, $b3
    db $b6, $de, $d2, $dd, $c6, $d3, $c4, $de, $d8, $cf, $bd, $00, $ff, $01, $0e, $0f
    db $b2, $cf, $c9, $cc, $de, $dd, $bc, $ae, $b3, $a6, $ce, $bf, $de, $dd, $bc, $cf
    db $bd, $00, $ff, $01, $0e, $0f, $ce, $b6, $c9, $0e, $b9, $de, $b0, $d1, $ce, $de
    db $b0, $b2, $0f, $c6, $cc, $de, $dd, $bc, $ae, $b3, $a6, $00, $01, $0f, $b5, $b8
    db $d8, $cf, $bd, $00, $ff, $01, $0e, $0f, $ce, $b6, $c9, $0e, $b9, $de, $b0, $d1
    db $ce, $de, $b0, $b2, $0f, $b6, $d7, $cc, $de, $dd, $bc, $ae, $b3, $a6, $00, $01
    db $0f, $d3, $d7, $b2, $cf, $bd, $00, $ff, $01, $0e, $0e, $ce, $df, $b9, $cd, $de
    db $d9, $0f, $c6, $cc, $de, $dd, $bc, $ae, $b3, $a6, $b5, $b8, $d8, $cf, $bd, $00
    db $ff, $01, $0e, $a2, $4b, $49, $53, $53, $20, $4d, $41, $49, $4c, $a3, $0f, $a6
    db $00, $01, $0f, $bc, $ad, $b3, $d8, $ae, $b3, $bc, $cf, $bd, $00, $ff, $01, $0e
    db $0f, $b1, $b7, $d6, $b3, $d8, $ae, $b3, $b6, $de, $c0, $d8, $c5, $b8, $c3, $0e
    db $be, $b0, $cc, $de, $00, $01, $0f, $0f, $c3, $de, $b7, $cf, $be, $dd, $c3, $de
    db $bc, $c0, $00, $01, $10, $4f, $4b, $3a, $41, $00, $ff, $01, $0e, $0e, $41, $ce
    db $de, $c0, $dd, $0f, $a6, $b5, $bd, $c4, $31, $b7, $de, $ae, $b3, $ba, $de, $c4
    db $c6, $00, $01, $0f, $ca, $af, $bc, $dd, $bc, $cf, $bd, $00, $01, $10, $bc, $ad
    db $b3, $d8, $ae, $b3, $3a, $42, $00, $ff, $01, $0e, $0e, $be, $b0, $cc, $de, $0f
    db $bb, $da, $c3, $b2, $cf, $be, $dd, $b6, $de, $00, $01, $0f, $bc, $ad, $b3, $d8
    db $ae, $b3, $bc, $c3, $d3, $b2, $b2, $c3, $de, $bd, $b6, $3f, $00, $ff, $01, $0e
    db $0e, $c0, $b2, $c4, $d9, $0f, $b6, $de, $c6, $ad, $b3, $d8, $ae, $b8, $bb, $da
    db $c3, $b2, $cf, $be, $dd, $00, $01, $0f, $c6, $ad, $b3, $d8, $ae, $b8, $bc, $c0
    db $b1, $c4, $c3, $de, $d3, $b3, $b2, $c1, $c4, $de, $00, $01, $10, $0e, $be, $b0
    db $cc, $de, $0f, $bc, $c3, $b8, $c0, $de, $bb, $b2, $00, $ff, $01, $0e, $0f, $b5
    db $c5, $bc, $de, $c5, $cf, $b4, $c9, $cc, $de, $dd, $bc, $ae, $b3, $b6, $de, $b1
    db $d8, $cf, $bd, $00, $01, $0f, $b3, $dc, $b6, $de, $b7, $bc, $c3, $ce, $bf, $de
    db $dd, $bc, $c3, $d3, $b2, $b2, $c3, $de, $bd, $b6, $3f, $00, $ff, $01, $0e, $0e
    db $be, $b0, $cc, $de, $0f, $bc, $cf, $bc, $c0, $00, $01, $0f, $4f, $4b, $3a, $41
    db $00, $ff, $01, $0e, $0f, $ba, $c9, $cc, $de, $dd, $bc, $ae, $b3, $a6, $bf, $b3
    db $bc, $dd, $bc, $cf, $bd, $00, $01, $0f, $bc, $de, $ad, $dd, $cb, $de, $ca, $b2
    db $b2, $c3, $de, $bd, $b6, $3f, $00, $ff, $01, $0e, $0f, $c2, $b3, $bc, $dd, $c1
    db $ad, $b3, $c3, $de, $bd, $00, $01, $0f, $c1, $ad, $b3, $c0, $de, $dd, $bd, $d9
    db $3a, $42, $00, $ff, $01, $0e, $0f, $c2, $b3, $bc, $dd, $b6, $de, $bc, $ad, $b3
    db $d8, $ae, $b3, $bc, $cf, $bc, $c0, $00, $01, $0f, $4f, $4b, $3a, $41, $00, $ff
    db $01, $0e, $a2, $4b, $49, $53, $53, $20, $4d, $41, $49, $4c, $a3, $0f, $c4, $de
    db $b3, $bc, $c3, $de, $c5, $b2, $c4, $00, $01, $0f, $c2, $b3, $bc, $dd, $c3, $de
    db $b7, $cf, $be, $dd, $00, $01, $10, $d3, $b3, $b2, $c1, $c4, $de, $d4, $d8, $c5
    db $b5, $bc, $c3, $b8, $c0, $de, $bb, $b2, $00, $ff, $01, $0e, $0f, $c2, $b3, $bc
    db $dd, $b6, $de, $c1, $ad, $b3, $c0, $de, $dd, $bb, $da, $cf, $bc, $c0, $00, $01
    db $0f, $d3, $b3, $b2, $c1, $c4, $de, $d4, $d8, $c5, $b5, $bc, $c3, $b8, $c0, $de
    db $bb, $b2, $00, $01, $10, $4f, $4b, $3a, $41, $00, $ff, $01, $0e, $0f, $bc, $de
    db $ad, $bc, $dd, $c0, $b2, $b7, $c1, $ad, $b3, $c3, $de, $bd, $00, $01, $0f, $b1
    db $b2, $c3, $c9, $bf, $b3, $bc, $dd, $a6, $b6, $b2, $bc, $bc, $c3, $b8, $c0, $de
    db $bb, $b2, $00, $ff, $01, $0e, $0f, $cd, $dd, $bc, $ad, $b3, $c1, $ad, $b3, $c9
    db $cc, $de, $dd, $bc, $ae, $b3, $b6, $de, $00, $01, $0f, $b7, $b4, $c3, $bc, $cf
    db $b2, $cf, $bd, $b6, $de, $a4, $b2, $b2, $c3, $de, $bd, $b6, $3f, $00, $ff, $06
    db $00, $4b, $49, $53, $53, $20, $4d, $41, $49, $4c, $00, $01, $0e, $0e, $be, $b0
    db $cc, $de, $0f, $c3, $de, $b7, $d9, $d6, $b3, $d8, $ae, $b3, $b6, $de, $c0, $d8
    db $cf, $be, $dd, $00, $01, $0f, $bf, $da, $c3, $de, $d3, $b2, $b2, $c3, $de, $bd
    db $b6, $3f, $00, $ff

data_01_64c5::
    db $01, $10, $ca, $b2, $3a, $41, $20, $b2, $b2, $b4, $3a, $42, $00, $ff

code_01_64d3::
    ld hl, $c500
    ld a, [hl+]
    or [hl]
    jp nz, Jump_001_6678

    ld hl, $00d2
    vcall $e6
    bit 7, h
    jr nz, jr_001_64ec

    vcall $e7
    xor a
    vcall $f1
    inc b
    dec b
    ret nz

jr_001_64ec:
    call Call_001_66dc
    ld a, $03
    vcall $b4
    ld a, $13
    call Call_001_5f89
    call Call_001_6169
    jp c, Jump_001_5fb5

    vcall $b5
    ret


Call_001_6501:
    vcall $b5
    call Call_001_66dc
    ld de, $4078
    ld hl, $9700
    ld bc, $0010
    vcall $02
    call Call_001_65db
    ld de, $0204
    ld bc, $1109
    vcall $58
    ld hl, data_01_6535
    ld de, $9101
    vcall $5a
    call Call_001_652c
    ld a, $03
    vcall $b4
    ret


Call_001_652c:
    ld de, $000d
    ld bc, $1405
    vcall $58
    ret


data_01_6535::
    db $05, $05, $0f, $c2, $c2, $de, $b9, $d9, $00, $05, $06, $0e, $be, $b0, $cc, $de
    db $0f, $bd, $d9, $00, $05, $07, $bf, $b3, $bc, $dd, $bd, $d9, $00, $05, $08, $bc
    db $de, $ad, $bc, $dd, $bd, $d9, $00, $05, $09, $0e, $ce, $df, $b9, $cd, $de, $d9
    db $0f, $c6, $b5, $b8, $d9, $00, $05, $0a, $4b, $49, $53, $53, $0e, $d2, $c6, $ad
    db $b0, $0f, $c6, $d3, $c4, $de, $d9, $0e, $00, $ff

Call_001_657f:
    vcall $b5
    call Call_001_66dc
    ld a, $e4
    ldh [$9d], a
    call Call_001_65c6
    call Call_001_65db
    ld de, $0103
    ld bc, $130a
    vcall $58
    ld a, $73
    ld de, $0103
    vcall $cd
    inc a
    ld d, $13
    vcall $cd
    ld a, $91
    ld hl, $0111
    ld de, $0204
    ld bc, $1108
    vcall $59
    ldh a, [$c0]
    push af
    xor a
    ldh [$c0], a
    ld c, $09

jr_001_65b7:
    push bc
    call Call_001_5ee7
    call Call_001_5f15
    pop bc
    dec c
    jr nz, jr_001_65b7

    pop af
    ldh [$c0], a
    ret


Call_001_65c6:
    ld hl, $8800
    ld bc, $0f30
    ld e, $00
    vcall $a6
    ld hl, $9800
    ld bc, $0400
    ld e, $7f
    vcall $a6
    ret


Call_001_65db:
    ld hl, $9800
    ld bc, $0400

jr_001_65e1:
    ld a, $7f
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_001_65e1

    ld de, $0101
    ld bc, $1303
    vcall $58
    ld a, $80
    ld hl, $0111
    ld de, $0702
    ld bc, $0c01
    vcall $59
    ld hl, data_01_6607
    ld de, $2001
    vcall $5a
    ret


data_01_6607::
    db $06, $00, $4b, $49, $53, $53, $20, $4d, $41, $49, $4c, $00, $02, $02, $0e, $c0
    db $b2, $c4, $d9, $3a, $00, $ff

data_01_661d::
    db $00, $4b, $49, $53, $53, $2d, $4d, $41, $49, $4c

Call_001_6627:
    call Call_001_6651
    ld de, $c500
    ld hl, $c400
    ld bc, $0100
    vcall $02
    ld de, $c699
    call jt01_665c
    call Call_001_6651
    ld de, $c400
    ld hl, $c500
    ld bc, $0100
    vcall $02
    xor a
    ldh [$c0], a
    ldh [$c1], a
    ldh [$c2], a
    ret


Call_001_6651:
    ld hl, $c600
    ld bc, $0099
    ld e, $20
    vcall $a6
    ret


jt01_665c::
    ld l, e
    ld h, d
    push hl
    call Call_001_66e1
    pop hl
    ld de, $0039
    add hl, de
    ld e, l
    ld d, h
    inc hl
    inc hl
    ld c, $30

jr_001_666d:
    ld a, [de]
    dec de
    ld [hl-], a
    dec c
    jr nz, jr_001_666d

    ld a, $20
    ld [hl-], a
    ld [hl], a
    ret


Jump_001_6678:
    call Call_001_6651
    ld hl, $c500
    ld de, $c611
    ld bc, $0088
    vcall $eb
    ld hl, $c509
    ld b, [hl]
    inc hl
    inc hl
    ld a, [hl]
    bit 4, b
    jr z, jr_001_6699

    sub $60
    bit 3, b
    jr z, jr_001_6699

    sub $60

jr_001_6699:
    ld c, a
    ld b, $00
    ld hl, $c50c
    add hl, bc
    ld [hl], $00
    ld hl, $c50d
    ld de, $c600
    vcall $4e
    ret


Call_001_66ab:
    xor a
    ld [$c50a], a
    ld bc, $01ff
    ld de, $0088
    vcall $e9
    ret c

    ld de, $c611
    ld bc, $0088
    vcall $ec
    or a
    ret


Call_001_66c2:
    push af
    ld a, $30
    ld hl, $0102
    ld de, $0003
    ld bc, $0202
    vcall $59
    pop af
    ld e, a
    ld d, $30
    ld hl, data_01_7f70
    ld c, $04
    vcall $4c
    ret


Call_001_66dc:
    ld h, $04
    vcall $ca
    db $c9

Call_001_66e1:
    ld de, $ff46
    ld bc, $003a
    push hl
    push bc
    vcall $e4
    pop bc
    pop hl
    ret


Jump_001_66ee:
    ld a, $20
    vcall $b3
    call Call_001_65c6
    call Call_001_6627
    call Call_001_66dc
    ld de, $0000
    ld bc, $140d
    vcall $58
    ld hl, data_01_67c2
    ld de, $8001
    vcall $5a
    ld hl, data_01_67fe

jr_001_670e:
    call Call_001_67b5
    jr nz, jr_001_671f

    push hl
    ld a, c
    ld c, $01
    ld hl, $0100
    vcall $59
    pop hl
    jr jr_001_670e

jr_001_671f:
    xor a
    ldh [$c3], a
    vcall $e1
    jr nc, jr_001_6731

    ld a, $01
    ldh [$c3], a
    vcall $65
    ld de, $c699
    vcall $51

jr_001_6731:
    ld hl, $c600
    call Call_001_66e1
    ld de, $0001
    vcall $5d
    ld a, $03
    vcall $b4
    ldh a, [$c3]
    or a
    jr nz, jr_001_6757

    call Call_001_652c
    ld hl, data_01_6824
    ld de, $b001
    vcall $5a
    ld a, $10
    call Call_001_685d
    jr c, jr_001_67b3

jr_001_6757:
    ld de, data_01_470d
    ld hl, $c699
    vcall $54

jr_001_675f:
    ld hl, data_01_67fe

jr_001_6762:
    call Call_001_67b5
    jr nz, jr_001_677b

    push hl
    ld hl, $c600
    ld e, c
    ld d, $00
    add hl, de
    ld d, c
    ld e, $01
    ld a, b
    vcall $4d
    ld c, a
    vcall $55
    pop hl
    jr jr_001_6762

jr_001_677b:
    ld hl, data_01_680e
    ld de, $b001
    vcall $5a
    ld a, $0b
    call Call_001_685d
    jr nc, jr_001_6799

jr_001_678a:
    ld a, $7f
    ld de, $030a
    ld bc, $0e02
    ld hl, $0000
    vcall $59
    jr jr_001_675f

jr_001_6799:
    ld hl, $c600
    ld c, $3b

jr_001_679e:
    dec c
    jr z, jr_001_678a

    ld a, [hl+]
    cp $20
    jr z, jr_001_679e

    vcall $65
    ld hl, $c600
    ld de, $ff46
    ld bc, $003a
    vcall $e5

jr_001_67b3:
    vcall $01

Call_001_67b5:
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


data_01_67c2::
    db $04, $01, $0f, $ba, $c9, $0e, $b6, $b0, $c4, $d8, $af, $bc, $de, $0f, $c6, $b1
    db $c5, $c0, $c9, $00, $04, $02, $bc, $de, $ae, $b3, $ce, $b3, $a6, $c4, $b3, $db
    db $b8, $bc, $cf, $bd, $00, $02, $04, $c5, $cf, $b4, $3a, $00, $02, $05, $c3, $de
    db $dd, $dc, $3a, $00, $03, $06, $0e, $d2, $d3, $3a, $00, $ff

data_01_67fe::
    db $04, $00, $0a, $05, $0a, $0c, $06, $16, $0c, $07, $22, $0c, $08, $2e, $0c, $ff

data_01_680e::
    db $03, $0a, $0f, $ba, $c9, $bc, $de, $ae, $b3, $ce, $b3, $c3, $de, $b2, $b2, $c3
    db $de, $bd, $b6, $3f, $00, $ff

data_01_6824::
    db $01, $0e, $0f, $ba, $c9, $bc, $de, $ae, $b3, $ce, $b3, $a6, $b6, $b4, $d9, $c4
    db $2c, $bd, $cd, $de, $c3, $c9, $00, $01, $0f, $0e, $cc, $a7, $b2, $d9, $0f, $b6
    db $de, $b7, $b4, $cf, $bd, $b6, $de, $a4, $b2, $b2, $c3, $de, $bd, $b6, $3f, $00
    db $ff

data_01_6855::
    db $ca, $b2, $20, $00, $b2, $b2, $b4, $00

Call_001_685d:
    ldh [$91], a
    ld a, $03

jr_001_6861:
    ldh [$90], a
    ld a, $0f
    vcall $b9
    ldh a, [$91]
    ld e, a
    ld d, $07
    vcall $57
    ld c, l
    ld b, h
    ld hl, data_01_6855
    ld de, $d301
    ldh a, [$90]
    ldh [$b4], a
    vcall $5b
    inc bc
    inc bc
    inc bc
    ldh a, [$90]
    swap a
    ldh [$b4], a
    vcall $5b
    ld a, $03
    ldh [$b4], a

jr_001_688b:
    vcall $b1
    vcall $d8
    ld b, a
    ld a, $03
    bit 4, b
    jr nz, jr_001_6861

    swap a
    bit 5, b
    jr nz, jr_001_6861

    scf
    bit 1, b
    ret nz

    bit 0, b
    jr z, jr_001_688b

    ldh a, [$90]
    cp $30
    ret


Call_001_68a9:
Jump_001_68a9:
    ldh [hRAMBank], a
    ld [$4000], a
    ret


Call_001_68af:
    dec c
    jr z, jr_001_68b6

    or a
    bit 0, [hl]
    ret


jr_001_68b6:
    scf
    ret


Call_001_68b8:
    ld c, $08

jr_001_68ba:
    rla
    jr c, jr_001_68c1

    ld b, $0a
    jr jr_001_68c4

jr_001_68c1:
    ld b, [hl]
    ld b, $12

jr_001_68c4:
    call Call_001_6991
    dec c
    jr nz, jr_001_68ba

    push bc
    pop bc
    ld b, $23
    call Call_001_6991
    ld b, $0a
    call Call_001_6991
    ret


Call_001_68d7:
    ld b, $00

jr_001_68d9:
    call Call_001_69a0
    jr c, jr_001_68fa

    cp $1a
    jr nc, jr_001_68e8

    cp $0f
    rl d
    jr jr_001_68d9

jr_001_68e8:
    ldh a, [rP1]
    bit 1, a
    jr z, jr_001_68fa

    bit 0, [hl]
    jr nz, jr_001_68e8

    ld a, $0a

jr_001_68f4:
    dec a
    jr nz, jr_001_68f4

    ld a, d
    cpl
    ret


jr_001_68fa:
    xor a
    ret


Call_001_68fc:
    push hl
    push de
    push bc
    ld hl, $a000
    ld d, a
    ld [hl], $01
    ld c, $00

jr_001_6907:
    call Call_001_68af
    jr c, jr_001_6987

    jr z, jr_001_6907

    push bc
    pop bc
    push bc
    pop bc
    ld [hl], $00
    ld c, $00

jr_001_6916:
    call Call_001_68af
    jr c, jr_001_6987

    jr nz, jr_001_6916

    ld a, d
    ld c, $08

jr_001_6920:
    rla
    jr c, jr_001_6927

    ld b, $0a
    jr jr_001_692a

jr_001_6927:
    ld b, [hl]
    ld b, $12

jr_001_692a:
    call Call_001_6991
    dec c
    jr nz, jr_001_6920

    push bc
    pop bc
    ld b, $0a
    call Call_001_6991
    xor a
    pop bc
    pop de
    pop hl
    ret


Call_001_693c:
    push hl
    push de
    push bc
    ld hl, $a000
    ld c, $00
    ld [hl], $00

jr_001_6946:
    call Call_001_68af
    jr c, jr_001_6987

    jr z, jr_001_6946

    ld [hl], $01
    ld c, $00

jr_001_6951:
    call Call_001_68af
    jr c, jr_001_6987

    jr nz, jr_001_6951

    push bc
    pop bc
    push bc
    pop bc
    ld [hl], $00
    ld c, $08
    ld b, $00

jr_001_6962:
    inc b
    jr z, jr_001_6987

    bit 0, [hl]
    jr z, jr_001_6962

    ld c, $08

jr_001_696b:
    call Call_001_69a0
    jr c, jr_001_6987

    cp $0f
    rl d
    dec c
    jr nz, jr_001_696b

    ld c, $00

jr_001_6979:
    call Call_001_68af
    jr c, jr_001_6987

    jr nz, jr_001_6979

    ld a, d
    cpl
    pop bc
    pop de
    pop hl
    or a
    ret


jr_001_6987:
    ld [hl], $00
    pop bc
    pop de
    pop hl

Call_001_698c:
Jump_001_698c:
jr_001_698c:
    ld a, $ff
    or a
    scf
    ret


Call_001_6991:
    push af
    ld a, b
    ld [hl], $01

jr_001_6995:
    dec a
    jr nz, jr_001_6995

    ld a, b
    ld [hl], $00

jr_001_699b:
    dec a
    jr nz, jr_001_699b

    pop af
    ret


Call_001_69a0:
    ld b, $00

jr_001_69a2:
    inc b
    jr z, jr_001_698c

    bit 0, [hl]
    jr z, jr_001_69a2

    ld b, $00

jr_001_69ab:
    inc b
    jr z, jr_001_698c

    bit 0, [hl]
    jr nz, jr_001_69ab

jr_001_69b2:
    inc b
    jr z, jr_001_698c

    bit 0, [hl]
    jr z, jr_001_69b2

    or a
    ld a, b
    ret


Call_001_69bc:
    ld hl, $a000

jr_001_69bf:
    ldh a, [rP1]
    bit 1, a
    jr z, jr_001_698c

    ld a, $aa
    call Call_001_68b8
    call Call_001_68d7
    cp $55
    jr nz, jr_001_69bf

    ldh a, [rP1]
    bit 1, a
    jr z, jr_001_698c

    ld a, $c3
    call Call_001_68b8
    call Call_001_68d7
    cp $3c
    jr nz, jr_001_69bf

    xor a
    ret


Call_001_69e5:
    ld hl, $a000

jr_001_69e8:
    ldh a, [rP1]
    bit 1, a
    jr z, jr_001_698c

    call Call_001_68d7
    cp $aa
    jr nz, jr_001_69e8

    ld a, $55
    call Call_001_68b8
    ldh a, [rP1]
    bit 1, a
    jr z, jr_001_698c

    call Call_001_68d7
    cp $c3
    jr nz, jr_001_69e8

    ld a, $3c
    call Call_001_68b8
    xor a
    ret


jr_001_6a0e:
    jp Jump_001_698c


Call_001_6a11:
    call Call_001_69bc
    jr c, jr_001_6a0e

    ld a, $48
    call Call_001_68fc
    ld a, $75
    call Call_001_68fc
    ld hl, $c0f8
    ld c, $08
    jp Jump_001_6a43


Call_001_6a28:
jr_001_6a28:
    call Call_001_69e5
    jr c, jr_001_6a0e

    call Call_001_693c
    cp $48
    jr nz, jr_001_6a28

    call Call_001_693c
    cp $75
    jr nz, jr_001_6a28

    ld hl, $c0f8
    ld c, $08
    jp Jump_001_6a58


Call_001_6a43:
Jump_001_6a43:
    ld b, $00

jr_001_6a45:
    ld a, b
    add [hl]
    ld b, a
    ld a, [hl+]
    call Call_001_68fc
    jr c, jr_001_6a57

    dec c
    jr nz, jr_001_6a45

    ld a, b
    cpl
    inc a
    call Call_001_68fc

jr_001_6a57:
    ret


Call_001_6a58:
Jump_001_6a58:
    ld b, $00

jr_001_6a5a:
    call Call_001_693c
    jr c, jr_001_6a0e

    ld [hl+], a
    add b
    ld b, a
    dec c
    jr nz, jr_001_6a5a

    call Call_001_693c
    add b
    or a
    jr nz, jr_001_6a0e

    ret


Call_001_6a6d:
    di
    ld a, $10
    ldh [rP1], a
    call Call_001_6a8b
    xor a
    ld [$a000], a
    ret


Call_001_6a7a:
    xor a
    ld [$a000], a
    call Call_001_6a87
    ld a, $30
    ldh [rP1], a
    ei
    ret


Call_001_6a87:
Jump_001_6a87:
    push af
    xor a
    jr jr_001_6a8e

Call_001_6a8b:
    push af
    ld a, $0e

jr_001_6a8e:
    ld [$0000], a
    pop af
    ret


jt01_6a93::
    call Call_001_6a6d

jr_001_6a96:
    call Call_001_6a28
    jr c, jr_001_6aad

    jr nz, jr_001_6a96

    ld hl, $c0f9
    ld a, [hl]
    ld hl, data_01_6abe
    cp $0d
    jr nc, jr_001_6a96

    call Call_001_6ab3
    jr jr_001_6a96

jr_001_6aad:
    call Call_001_6a7a
    xor a
    scf
    ret


Call_001_6ab3:
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


data_01_6abe::
    db $e7, $6a, $ed, $6a, $f8, $6a, $1f, $6b, $2f, $6b, $27, $6b, $7c, $6b, $40, $6b
    db $9c, $6b, $a6, $6b, $67, $6b, $cd, $6b, $dc, $6b

Call_001_6ad8:
Jump_001_6ad8:
    call Call_001_6cff
    call Call_001_69bc
    ret c

    ld hl, $c0f8
    ld c, $08
    jp Jump_001_6a43


code_01_6ae7::
    call Call_001_6a7a
    pop hl
    or a
    ret


code_01_6aed::
    ld hl, $0000
    vcall $e6
    ld a, [$0014]
    jp Jump_001_6ad8


code_01_6af8::
    call Call_001_6d18
    ld hl, $c400
    call Call_001_6a58
    ret c

    call Call_001_6a87
    call Call_001_6d18
    ld hl, $c500
    ld de, $c400
    vcall $6b

jr_001_6b10:
    call Call_001_6a8b
    call Call_001_6ad8
    ret c

    ld hl, $c500
    ld c, $00
    jp Jump_001_6a43


code_01_6b1f::
    call Call_001_6b88
    ret c

    vcall $e9
    jr jr_001_6b10

code_01_6b27::
    call Call_001_6b88
    ret c

    vcall $e8
    jr jr_001_6b10

code_01_6b2f::
    call Call_001_6a87
    call Call_001_6d18
    ld hl, $c500
    vcall $ea
    call Call_001_6a8b
    jp Jump_001_6ad8


code_01_6b40::
    call Call_001_6b54
    push bc
    vcall $eb
    call Call_001_6a8b
    call Call_001_6ad8
    pop bc
    ret c

    ld hl, $c400
    jp Jump_001_6a43


Call_001_6b54:
    call Call_001_6d18
    ld b, $00
    inc c
    dec c
    jr nz, jr_001_6b5e

    inc b

jr_001_6b5e:
    ld hl, $c500
    ld de, $c400
    jp Jump_001_6a87


code_01_6b67::
    call Call_001_6d18
    ld hl, $c400
    call Call_001_6a58
    ret c

    call Call_001_6b54
    vcall $ec
    call Call_001_6a8b
    jp Jump_001_6ad8


code_01_6b7c::
    call Call_001_6b88
    ret c

    vcall $ef
    call Call_001_6a8b
    jp Jump_001_6ad8


Call_001_6b88:
    ld hl, $c500
    ld c, $00
    call Call_001_6a58
    ret c

    call Call_001_6a87
    call Call_001_6d18
    ld hl, $c500
    or a
    ret


code_01_6b9c::
    call Call_001_69bc
    ret c

    call Call_001_6d18
    jp Jump_001_6a43


code_01_6ba6::
    ldh a, [hRAMBank]
    push af
    call Call_001_6d18
    call Call_001_6c05
    ld de, $c400
    call Call_001_6a87
    push de
    push bc

jr_001_6bb7:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_001_6bb7

    call Call_001_6a8b
    call Call_001_69bc
    ret c

    pop bc
    pop hl
    call Call_001_6a43
    pop af
    jp Jump_001_68a9


code_01_6bcd::
    call Call_001_6d18
    ld l, e
    ld h, d

Call_001_6bd2:
    call Call_001_6a58
    jr c, jr_001_6bdb

    sub b
    call Call_001_68fc

jr_001_6bdb:
    ret


code_01_6bdc::
    ldh a, [hRAMBank]
    push af
    call Call_001_6d18
    ld hl, $c400
    push hl
    push de
    push bc
    call Call_001_6bd2
    pop bc
    pop hl
    pop de
    jr c, jr_001_6c01

    call Call_001_6c05
    ld a, $0a
    ld [$0000], a

jr_001_6bf8:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_001_6bf8

    call Call_001_6a8b

jr_001_6c01:
    pop af
    jp Jump_001_68a9


Call_001_6c05:
    push hl
    ld a, b
    rl h
    rla
    rl h
    rla
    rl h
    rla
    call Call_001_68a9
    pop hl
    ld a, h
    and $1f
    or $a0
    ld h, a
    ret


jt01_6c1b::
    call Call_001_6a6d
    ld a, $00
    ld [$c0f9], a
    call Call_001_6a11
    jr jr_001_6c7b

jt01_6c28::
    call Call_001_6c81
    jr c, jr_001_6c7b

    jr jr_001_6c78

jt01_6c2f::
    ld a, $02
    call Call_001_6ceb
    ld l, e
    ld h, d
    jr jr_001_6c43

jt01_6c38::
    ld a, $05
    jr jr_001_6c3e

jt01_6c3c::
    ld a, $03

jr_001_6c3e:
    call Call_001_6ceb
    ld c, $00

jr_001_6c43:
    call Call_001_6a43
    jr c, jr_001_6c7b

    call Call_001_6d18
    push hl
    call Call_001_6c81
    pop hl
    jr c, jr_001_6c7b

    ld c, $00
    call Call_001_6a58
    jr c, jr_001_6c7b

    jr jr_001_6c78

jt01_6c5b::
    ld a, $04
    call Call_001_6ceb
    call Call_001_6c81
    jr c, jr_001_6c7b

    jr jr_001_6c78

jt01_6c67::
    ld a, $06
    call Call_001_6ceb
    ld c, $00
    call Call_001_6a43
    jr c, jr_001_6c7b

    call Call_001_6c81
    jr c, jr_001_6c7b

jr_001_6c78:
    call Call_001_6d18

jr_001_6c7b:
    push af
    call Call_001_6a7a
    pop af
    ret


Call_001_6c81:
    call Call_001_69e5
    jr c, jr_001_6c7b

    ld hl, $c0f8
    ld c, $08
    jp Jump_001_6a58


jt01_6c8e::
    ld a, $09
    jr jr_001_6c94

jt01_6c92::
    ld a, $08

jr_001_6c94:
    call Call_001_6ceb
    push de
    push bc
    call Call_001_69e5
    pop bc
    pop hl
    jr c, jr_001_6c7b

    call Call_001_6a58
    jr jr_001_6c7b

jt01_6ca5::
    ld a, $0c
    jr jr_001_6cab

jt01_6ca9::
    ld a, $0b

jr_001_6cab:
    call Call_001_6ceb
    call Call_001_6a43
    jr c, jr_001_6c7b

    call Call_001_693c
    jr c, jr_001_6c7b

    add b
    jr nz, jr_001_6cbe

    xor a
    jr jr_001_6c7b

jr_001_6cbe:
    call Call_001_698c

jr_001_6cc1:
    jr jr_001_6c7b

jt01_6cc3::
    ld a, $07
    call Call_001_6ceb
    push de
    push bc
    call Call_001_6c81
    pop bc
    pop hl
    jr c, jr_001_6c7b

    call Call_001_6a58
    jr c, jr_001_6c7b

    jr jr_001_6c78

jt01_6cd8::
    ld a, $0a
    call Call_001_6ceb
    ld l, e
    ld h, d
    call Call_001_6a43
    jr c, jr_001_6c7b

    call Call_001_6c81
    jr c, jr_001_6c7b

    jr jr_001_6c78

Call_001_6ceb:
    push hl
    push de
    push bc
    call Call_001_6cff
    call Call_001_6a6d
    call Call_001_6a11
    pop bc
    pop de
    pop hl
    ret nc

    inc sp
    inc sp
    jr jr_001_6cc1

Call_001_6cff:
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


Call_001_6d18:
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


jt01_6d2f::
    ld b, [hl]
    inc hl
    push hl
    vcall $c6
    jp c, Jump_001_6d4f
    ldh [$a1], a
    ld a, b
    pop bc

jr_001_6d3b:
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
    jr nz, jr_001_6d3b

    push hl

Jump_001_6d4f::
    pop hl
    ldh a, [$a1]
    ret


jt01_6d53::
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

jr_001_6d6d:
    ld [hl], a
    inc l
    jr nz, jr_001_6d6d

    ret


jt01_6d72::
    push hl
    push de

jr_001_6d74:
    push bc
    call Call_001_6d83
    ld [de], a
    inc de
    pop bc
    dec bc
    ld a, c
    or b
    jr nz, jr_001_6d74

    pop de
    pop hl
    ret


Call_001_6d83:
    ld hl, $c3d0
    ld a, [hl]
    or a
    jr z, jr_001_6d96

    dec [hl]
    inc hl

jr_001_6d8c:
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


jr_001_6d96:
    ld hl, $c3ca
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc hl
    dec [hl]
    inc hl
    jr nz, jr_001_6da8

    dec hl
    ld [hl], $08
    inc hl
    ld a, [bc]
    inc bc
    ld [hl], a

jr_001_6da8:
    rl [hl]
    ld a, [bc]
    inc bc
    jr nc, jr_001_6dbe

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


jr_001_6dbe:
    ld [$c3d2], a
    ld hl, $c3ce
    bit 0, [hl]
    jr nz, jr_001_6dde

    set 0, [hl]
    inc hl
    ld a, [bc]
    inc bc
    ld [hl+], a
    swap a

jr_001_6dd0:
    and $0f
    inc a
    ld [hl+], a
    push hl
    ld hl, $c3ca
    ld [hl], c
    inc hl
    ld [hl], b
    pop hl
    jr jr_001_6d8c

jr_001_6dde:
    res 0, [hl]
    inc hl
    ld a, [hl+]
    jr jr_001_6dd0

jt01_6de4::
    vcall $ed
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

jr_001_6df4:
    push bc
    call jt01_714d
    pop bc
    jr c, jr_001_6e2b

    ld a, [$c409]
    ld b, a
    bit 4, b
    jr z, jr_001_6df4

    ld a, [$c40c]
    cp c
    jr nz, jr_001_6df4

    ld de, $000d
    add hl, de
    ld a, [$c40b]
    sub $61
    bit 3, b
    jr z, jr_001_6e18

    sub $60

jr_001_6e18:
    ld e, a
    add hl, de
    pop de
    push de
    ld c, $60

jr_001_6e1e:
    ld a, [hl+]
    ld [de], a
    inc de
    bit 3, b
    jr z, jr_001_6e26

    ld a, [hl+]

jr_001_6e26:
    ld [de], a
    inc de
    dec c
    jr nz, jr_001_6e1e

jr_001_6e2b:
    pop de
    pop hl
    ret


jt01_6e2e::
    vcall $e0
    ld hl, $4000
    ld de, $fe00

jr_001_6e36:
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
    vcall $e5
    pop hl
    pop bc
    pop de
    pop hl
    inc e
    ld a, l
    or h
    jr nz, jr_001_6e36

    vcall $09
    ret


jt01_6e63::
    add sp, -$04
    push hl
    ld hl, sp+$02
    ld d, $fe
    ld bc, $0004
    vcall $e4
    pop bc
    pop hl
    pop de
    ld a, l
    or h
    jr z, jr_001_6e7f

    ld a, e
    cp $ff
    jp z, Jump_001_71a1

    vcall $fc
    ret


jr_001_6e7f:
    ld l, c
    ld h, b
    xor a
    ld [hl+], a
    ld [hl-], a
    scf
    ret


jr_001_6e86:
    cp c
    ld c, a
    ld b, a
    jr nz, jr_001_6e8e

jt01_6e8b::
    ld c, $00
    ld b, c

jr_001_6e8e:
    ld a, [hl+]
    or a
    ret z

    cp $22
    jr z, jr_001_6e86

    cp $27
    jr z, jr_001_6e86

    inc b
    dec b
    jr nz, jr_001_6ea1

    vcall $f8
    jr jr_001_6e8e

jr_001_6ea1:
    cp $40
    jr z, jr_001_6ec5

    cp $25
    jr z, jr_001_6ed2

    cp $3b
    jr z, jr_001_6eda

    cp $2b
    jr z, jr_001_6ee4

    cp $5b
    jr z, jr_001_6eea

    cp $5d
    jr z, jr_001_6ef0

    inc c
    dec c
    jr z, jr_001_6ec1

    vcall $f9
    jr jr_001_6e8e

jr_001_6ec1:
    vcall $f8
    jr jr_001_6e8e


jr_001_6ec5:
    ld a, $30
    call Call_001_6efc
    ld a, $35
    vcall $f8
    ld c, $00
    jr jr_001_6e8e

jr_001_6ed2:
    ld a, $32
    call Call_001_6ef7
    ld c, b
    jr jr_001_6e8e

jr_001_6eda:
    ld a, $23
    vcall $f8
    ld a, $23
    vcall $f8
    jr jr_001_6e8e

jr_001_6ee4:
    ld c, $00
    ld a, $38
    jr jr_001_6ef2

jr_001_6eea:
    ld c, $00
    ld a, $34
    jr jr_001_6ef2

jr_001_6ef0:
    ld a, $36

jr_001_6ef2:
    call Call_001_6efc
    jr jr_001_6e8e

Call_001_6ef7:
    push af
    call Call_001_6efc
    pop af

Call_001_6efc:
    push af
    ld a, $2a
    vcall $f8
    pop af
    vcall $f8
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
    jr nz, jr_001_6f34

    pop af

jr_001_6f34:
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
    jr z, jr_001_6f62

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


jr_001_6f62:
    pop hl
    add sp, $08
    jp hl


jt01_6f66::
    push bc

jr_001_6f67:
    dec bc
    ld a, [hl+]
    cp e
    jr z, jr_001_6f72

    ld a, b
    or c
    jr nz, jr_001_6f67

    pop bc
    push bc

jr_001_6f72:
    pop hl
    ld a, l
    sub c
    ld l, a
    ld a, h
    sbc b
    ld h, a
    ret


jt01_6f7a::
    ld a, [de]
    cp [hl]
    jr nz, jr_001_6f89

    inc de
    inc hl
    dec bc
    ld a, b
    or c
    jr nz, jt01_6f7a

    ld hl, $0000
    ret


jr_001_6f89:
    sbc a
    ld h, a
    add a
    inc a
    ld l, a
    ret


jt01_6f8f::
    ld d, h
    ld e, l
    ld hl, $0000

jr_001_6f94:
    ld a, [de]
    or a
    ret z

    inc de
    inc hl
    jr jr_001_6f94

jt01_6f9b::
    ldh a, [$92]
    ld e, a
    ld a, [hl+]
    or a
    ret z

    bit 6, e
    jr nz, jr_001_6fb3

    cp $20
    jr c, jr_001_6fd6

    ld e, a
    ld d, [hl]
    vcall $a7
    jr nc, jr_001_6fb3

    inc hl
    or a
    jr z, jr_001_6fba

jr_001_6fb3:
    vcall $bb
    jr jt01_6f9b

jr_001_6fb7:
    xor a
    jr jr_001_6fb3

jr_001_6fba:
    ldh a, [$92]
    bit 3, a
    jr z, jr_001_6fb7

    push bc
    push hl
    ld c, a
    ld a, d
    ld d, e
    ld e, a
    ld b, $01
    ld hl, $c3e0
    vcall $1b
    ld hl, $c3e0
    vcall $be
    pop hl
    pop bc
    ld a, $01

jr_001_6fd6:
    vcall $b9
    jr jt01_6f9b

jt01_6fda::
    ld a, [hl]
    or a
    ret z

    push hl
    ld l, e
    ld h, d
    vcall $b8
    pop hl
    push de
    call jt01_6f9b
    pop de
    inc e
    jr jt01_6fda

jt01_6feb::
    xor a
    ld b, a
    ld [hl+], a
    ld [hl-], a
    ld a, c
    or a
    jr nz, jr_001_6ffc

    inc b
    push de

jr_001_6ff5:
    inc de
    inc c
    ld a, [de]
    or a
    jr nz, jr_001_6ff5

    pop de

jr_001_6ffc:
    push de
    push bc
    call jt01_714d
    pop bc
    pop de
    jr c, jr_001_700c

    call Call_001_7029
    jr nz, jr_001_6ffc

    xor a
    ret


jr_001_700c:
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

jr_001_701f:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_001_701f

    pop hl
    xor a
    scf
    ret


Call_001_7029:
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
    jr z, jr_001_704a

    ld b, [hl]
    bit 4, b
    jr z, jr_001_704a

    inc hl
    inc hl
    ld a, [hl+]
    sub $60
    bit 3, b
    jr z, jr_001_704d

    sub $60
    jr jr_001_704d

jr_001_704a:
    inc hl
    inc hl
    ld a, [hl+]

jr_001_704d:
    cp c
    jr nz, jr_001_7057

    ld b, $00
    call jt01_6f7a
    ld a, h
    or l

jr_001_7057:
    pop bc
    pop de
    pop hl
    ret


Jump_001_705b:
    pop de
    push de
    ld hl, $c500
    ld bc, $00ff
    vcall $02
    ld hl, $c400
    xor a
    ld [hl+], a
    ld [hl-], a

jr_001_706b:
    call jt01_714d
    jr c, jr_001_70af

    ld a, [$c409]
    and $04
    jr z, jr_001_706b

    ld a, [$c40c]
    and $7f
    ld b, a
    ld a, [$c50c]
    and $7f
    cp b
    jr nz, jr_001_706b

    ld a, [$c40a]
    or a
    jr z, jr_001_7092

    ld b, a
    ld a, [$0014]
    cp b
    jr nz, jr_001_706b

jr_001_7092:
    ld a, [$c402]
    cp $ff
    jr z, jr_001_70aa

    ld hl, $c400
    call Call_001_7118
    vcall $fb
    ld d, h
    ld e, l

jr_001_70a3:
    pop bc
    ld sp, $e000
    push de
    jr jr_001_70fc

jr_001_70aa:
    call Call_001_7129
    jr jr_001_70a3

jr_001_70af:
    pop hl
    ld de, $c500
    ld bc, $00ff
    vcall $02
    scf
    ret


jt01_70ba::
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
    jr z, jr_001_70eb

    call Call_001_7118
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    or a
    jr z, jr_001_70de

    ld a, [$0014]
    cp [hl]
    jr z, jr_001_70de

    pop hl
    scf
    ret


jr_001_70de:
    dec hl
    ld a, [hl]
    and $04
    jp z, Jump_001_705b

    vcall $fb
    ld d, h
    ld e, l
    jr jr_001_70ee

jr_001_70eb:
    call Call_001_7129

jr_001_70ee:
    pop bc
    ld sp, $e000
    push de
    call Call_001_710d
    ld hl, $c500
    xor a
    ld [hl+], a
    ld [hl], a

jr_001_70fc:
    ld hl, $c600
    ld e, $00
    ld bc, $df00
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    vcall $a6
    ret


Call_001_710d:
    ld hl, $c400
    ld d, b
    ld e, c
    ld bc, $00ff
    vcall $02
    ret


Call_001_7118:
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


Call_001_7129:
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


jt01_7138::
    ldh a, [hROMBank]
    ld e, a
    ldh a, [hRAMBank]
    ld d, a
    push de
    push hl
    ld hl, sp+$00
    ld de, $ff3c
    ld bc, $0004
    vcall $e5
    pop hl
    pop de
    ret


jt01_714d::
    ld a, [hl+]
    or [hl]
    jr z, jr_001_7158

    inc hl
    ld a, [hl]
    dec hl
    cp $ff
    jr z, jr_001_715f

jr_001_7158:
    dec hl
    vcall $e8
    ret nc
    xor a
    ld [hl+], a
    ld [hl], a

jr_001_715f:
    dec hl
    ld c, l
    ld b, h
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, h
    or l
    jr z, jr_001_719a

    ld de, $fffa
    add hl, de
    jr nc, jr_001_7173

    ld a, h
    rlca
    jr nc, jr_001_7177

jr_001_7173:
    ld l, c
    ld h, b
    scf
    ret


jr_001_7177:
    ld e, l
    ld d, h
    ld a, [hl+]
    cpl
    cp [hl]
    jr nz, jr_001_7173

    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    or h
    jr z, jr_001_7173

    ld a, h
    cp d
    jr c, jr_001_718f

    jr nz, jr_001_7173

    ld a, l
    cp e
    jr nc, jr_001_7173

jr_001_718f:
    ld a, [hl]
    cp $52
    jr z, jr_001_719d

    cp $5a
    jr nz, jr_001_7177

    jr jr_001_719d

jr_001_719a:
    ld hl, $4000

jr_001_719d:
    ld de, $0006
    add hl, de

Jump_001_71a1:
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

jr_001_71c4:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_001_71c4

    pop bc
    pop hl
    ld de, $002e
    bit 0, b
    jr nz, jr_001_71d4

    ld e, d

jr_001_71d4:
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


jt01_71e6::
    vcall $e1
    ret c

    push hl
    ld de, $ff45
    ld bc, $0001
    ld hl, sp+$00
    vcall $e4
    pop hl
    bit 0, l
    ret z

    call Call_001_7227
    bit 0, a
    ret nz

    bit 1, a
    jr nz, jr_001_7225

    add sp, -$04
    ld hl, sp+$00
    ld de, $ff3c
    ld bc, $0004
    vcall $e4
    pop de
    pop bc
    ld a, d
    or e
    jr z, jr_001_7225

    ld a, c
    ldh [hROMBank], a
    ld [$2000], a
    ld a, b
    ldh [hRAMBank], a
    ld [$4000], a
    push de
    ret


jt01_7222::
    call Call_001_7227

jr_001_7225:
    vcall $01

Call_001_7227:
    vcall $11
    vcall $53
    ld a, $a4
    ld bc, $0102
    ld de, $0f10
    ld h, $00
    vcall $b3
    ld de, data_01_72e7
    ld bc, $c400
    vcall $62
    ld de, $c600
    ld bc, $08f0
    vcall $63
    ld de, $020c
    ld hl, $c600
    ld bc, $0b68
    vcall $c0
    ld a, $01
    vcall $b4
    ld a, $f0
    vcall $dc
    db $cb

    ld d, a
    jp nz, Jump_001_66ee

    ret


jt01_7260::
    ld d, a
    push hl
    ld hl, data_01_72d2

jr_001_7265:
    ld a, [hl]
    cp $ff
    jr z, jr_001_7275

    ld a, d
    or a
    jr z, jr_001_7278

    inc hl
    inc hl
    inc hl
    inc hl
    dec d
    jr jr_001_7265

jr_001_7275:
    pop hl
    scf
    ret


jr_001_7278:
    ld d, [hl]
    inc hl
    ld a, [hl+]
    dec a
    cp e
    jr c, jr_001_7275

    sub e
    dec b
    cp b
    jr nc, jr_001_7285

    ld b, a

jr_001_7285:
    inc b
    ld c, b
    ld b, $00
    jr nz, jr_001_728c

    inc b

jr_001_728c:
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, d
    ld d, $00
    or a
    jr z, jr_001_72af

    ld a, $04

jr_001_7297:
    sla e
    rl d
    sla c
    rl b
    dec a
    jr nz, jr_001_7297

    add hl, de
    ld e, l
    ld d, h
    pop hl
    push bc
    push hl
    vcall $02
    pop hl
    pop bc
    add hl, bc
    or a
    ret


jr_001_72af:
    ld b, e
    push bc
    ld e, l
    ld d, h
    ld bc, $c400
    vcall $62
    pop bc
    pop hl

jr_001_72ba:
    push hl
    push bc
    ld d, h
    ld e, l
    ld bc, $0010
    push bc
    vcall $63
    pop de
    pop bc
    pop hl
    ld a, b
    dec b
    or a
    jr nz, jr_001_72ba

    inc b
    add hl, de
    dec c

Call_001_72cf:
    jr nz, jr_001_72ba

    ret


data_01_72d2::
    db $00, $c7, $b2, $50, $00, $38, $33, $5d, $00, $8f, $e7, $72, $10, $06, $28, $40
    db $10, $09, $70, $7f, $ff

data_01_72e7::
    db $ab, $1f, $ef, $11, $1b, $f3, $18, $f7, $80, $1e, $1e, $8b, $1f, $03, $01, $01
    db $f7, $1c, $0b, $02, $19, $18, $de, $1b, $19, $f3, $1f, $19, $1f, $1c, $04, $10
    db $40, $f3, $19, $0f, $0f, $22, $33, $ff, $44, $55, $ff, $66, $0d, $77, $f4, $f7
    db $ef, $27, $e6, $01, $03, $9d, $00, $07, $c4, $0f, $07, $a0, $a4, $a1, $a3, $07
    db $9f, $00, $9d, $2e, $9b, $02, $eb, $ff, $bf, $11, $cf, $8f, $9f, $ef, $dd, $0d
    db $0d, $98, $30, $00, $03, $01, $b4, $0f, $ff, $06, $1e, $0c, $3c, $18, $78, $30
    db $f0, $fe, $60, $e0, $c0, $c0, $80, $80, $00, $e3, $00, $1f, $e1, $df, $00, $dd
    db $f8, $30, $fc, $98, $fe, $fd, $cc, $ff, $66, $7f, $33, $3f, $18, $00, $0c, $20
    db $d5, $b6, $13, $01, $ba, $05, $ff, $16, $27, $ff, $38, $19, $49, $f6, $bb, $96
    db $42, $be, $7f, $bf, $bf, $00, $e7, $56, $70, $c3, $e0, $05, $c7, $77, $c3, $c3
    db $73, $00, $36, $71, $6b, $44, $bd, $7e, $bd, $8f, $86, $7e, $11, $ff, $c1, $bf
    db $9c, $7f, $3e, $f7, $63, $e3, $c1, $c1, $c1, $e2, $a4, $f9, $b0, $01, $00, $ff
    db $87, $ec, $03, $cf, $86, $f1, $00, $fc, $78, $ed, $a1, $00, $18, $9f, $9d, $00
    db $9b, $3e, $1c, $b0, $ff, $e9, $fa, $ff, $1a, $0b, $1c, $f9, $5e, $87, $07, $77
    db $02, $e7, $3d, $da, $c7, $47, $39, $07, $07, $f7, $47, $e7, $50, $00, $31, $41
    db $41, $01, $c7, $07, $44, $2d, $60, $a3, $c0, $fb, $80, $e0, $c0, $f0, $60, $cd
    db $00, $fc, $98, $7f, $c9, $ff, $66, $7f, $33, $3f, $19, $1f, $f8, $0c, $0f, $06
    db $07, $03, $c3, $00, $80, $c3, $00, $3f, $7d, $7b, $00, $1e, $0c, $3c, $18, $78
    db $30, $dc, $f1, $60, $d1, $c7, $83, $8f, $88, $50, $6b, $fd, $e5, $c3, $ff, $bf
    db $bd, $3e, $25, $89, $05, $f6, $03, $3f, $3f, $3d, $a4, $06, $01, $b1, $00, $40
    db $b1, $01, $5d, $01, $80, $c8, $6f, $1e, $e3, $ff, $25, $67, $2c, $12, $fc, $fe
    db $2f, $60, $00, $ef, $df, $cf, $8c, $cf, $11, $0b, $4c, $0f, $fd, $fe, $fd, $aa
    db $34, $7f, $65, $87, $bc, $98, $9e, $8c, $8e, $86, $8e, $7f, $96, $f8, $d8, $d8
    db $98, $98, $18, $38, $ff, $18, $10, $38, $38, $30, $20, $70, $60, $4f, $49, $01
    db $c0, $44, $c8, $01, $03, $03, $07, $07, $ff, $0e, $3f, $1c, $ff, $79, $e7, $f3
    db $ae, $ff, $c7, $0e, $0e, $0c, $1c, $3d, $18, $11, $ff, $3b, $77, $3f, $fd, $7e
    db $f4, $f8, $d0, $b6, $e0, $6e, $c0, $81, $95, $14, $c1, $81, $9c, $0a, $34, $ff
    db $b3, $f5, $f1, $06, $0f, $d9, $10, $8f, $dd, $55, $13, $01, $cf, $df, $8f, $dc
    db $10, $0f, $e2, $ef, $00, $13, $12, $f0, $14, $00, $13, $dc, $00, $d9, $2d, $ff
    db $0d, $4f, $1e, $e3, $18, $2f, $65, $40, $70, $30, $60, $70, $7f, $5d, $c2, $e1
    db $cb, $c7, $ce, $9f, $f8, $ff, $3d, $fb, $71, $e3, $e3, $87, $c7, $07, $ff, $8e
    db $0e, $1c, $1f, $39, $7f, $73, $fe, $fc, $e7, $fc, $ce, $38, $9c, $30, $39, $10
    db $3f, $bd, $60, $92, $1a, $c1, $c0, $80, $c1, $9b, $01, $f4, $00, $03, $01, $03
    db $7b, $20, $01, $77, $82, $ff, $3e, $c4, $2b, $20, $e7, $e3, $e7, $e7, $ef, $ac
    db $c8, $ef, $ff, $b0, $02, $cf, $fe, $b3, $32, $cf, $f0, $20, $10, $ab, $ab, $00
    db $4b, $e3, $fd, $ff, $dd, $1f, $f5, $30, $7f, $35, $41, $77, $3f, $ff, $7f, $f6
    db $f8, $c0, $6f, $64, $80, $c0, $68, $01, $00, $80, $0b, $07, $f8, $5f, $3f, $7a
    db $fc, $f0, $15, $99, $40, $1d, $ff, $0f, $1f, $3a, $3c, $60, $70, $40, $e0, $7f
    db $67, $02, $83, $c1, $c7, $83, $8f, $86, $9e, $ff, $8c, $bc, $98, $78, $30, $f1
    db $60, $e3, $7f, $3a, $06, $9e, $0c, $dc, $8c, $fe, $cc, $ff, $ff, $66, $7f, $33
    db $3f, $19, $1f, $0c, $e6, $0f, $06, $07, $7e, $f6, $cf, $01, $03, $aa, $10

data_01_7576::
    db $bf, $c7, $7c, $c3, $87, $81, $83, $87, $07, $3a, $84, $40, $83, $87, $87, $c7
    db $8e, $00, $c7, $7b, $40, $ab, $00, $f7, $96, $99, $1f, $cd, $ad, $ff, $be, $cc
    db $b0, $01, $18, $18, $0f, $d1, $28, $30, $61, $5f, $00, $5d, $cf, $fb, $c6, $de
    db $cc, $3c, $18, $43, $82, $1e, $0c, $76, $01, $f0, $60, $e0, $ef, $09, $80, $80
    db $cc, $0f, $19, $00, $17, $15, $00, $13, $f8, $30, $fc, $98, $28, $51, $c6, $9f
    db $80, $ef, $02, $e0, $4a, $49, $00, $47, $e8, $e1, $e0, $e1, $79, $01, $e3, $79
    db $5a, $10, $79, $20, $55, $00, $53, $e2, $5c, $5f, $9d, $7d, $ff, $8e, $9f, $ff
    db $11, $b0, $f2, $31, $29, $e0, $2d, $00, $01, $0d, $00, $7f, $fe, $06, $ff, $73
    db $ff, $f9, $df, $8c, $0b, $00, $3d, $00, $f9, $f7, $0f, $e0, $c2, $10, $df, $dd
    db $00, $3d, $1b, $3b, $00, $cf, $cd, $00, $78, $30, $2b, $e6, $c6, $fc, $cf, $8f
    db $8f, $0f, $07, $07, $09, $0f, $6f, $7b, $c2, $10, $7e, $fc, $fe, $fe, $24, $e8
    db $dc, $f3, $e0, $f0, $fc, $f8, $26, $01, $24, $fe, $3e, $78, $23, $1f, $f8, $fc
    db $e8, $f0, $6d, $4d, $ff, $5e, $1e, $6f, $ff, $80, $91, $f1, $80, $00, $c0, $80
    db $c7, $bf, $60, $cb, $00, $fc, $98, $fe, $cc, $ff, $66, $fd, $7f, $33, $3f, $19
    db $1f, $0c, $fb, $0e, $77, $fc, $40, $31, $f0, $61, $a7, $c0, $83, $83, $45, $f9
    db $00, $07, $f6, $9d, $40, $c6, $e0, $d7, $1f, $ce, $e7, $c6, $fe, $ee, $3f, $9e
    db $10, $2f, $1f, $3f, $f8, $7f, $ff, $7f, $7d, $fb, $24, $e0, $00, $f6, $7b, $f5
    db $02, $3f, $1f, $47, $ef, $fd, $3d, $7e, $50, $3d, $01, $f8, $0f, $18, $13, $ff
    db $24, $35, $ff, $46, $1f, $57, $ff, $68, $72, $70, $98, $18, $d8, $98, $f8, $fd
    db $d8, $f8, $78, $78, $38, $38, $72, $d8, $04, $88, $00, $88, $84, $03, $80, $83
    db $00, $18, $8d, $8b, $00, $03, $89, $0f, $12, $96, $72, $12, $0f, $e3, $e1, $c0
    db $80, $b0, $c0, $c3, $00, $80, $0d, $00, $ca, $c3, $01, $c4, $00, $d2, $14, $c7
    db $0d, $00

code_01_76d8::
    pop de
    ld a, [de]
    inc de
    inc h
    dec h
    jr nz, jr_001_76e2

    cp l
    jr nc, jr_001_76e3

jr_001_76e2:
    ld l, a

jr_001_76e3:
    ld a, l
    add a
    add e
    ld l, a
    ld a, $00
    adc d
    ld h, a

jr_001_76eb:
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    add hl, de
    jp hl


code_01_76f1::
    ld e, l
    ld d, h
    pop hl
    inc d
    dec d
    jr nz, jr_001_7703

jr_001_76f8:
    ld a, [hl+]
    cp e
    jr z, jr_001_7709

    ld a, [hl+]
    or [hl]
    inc hl
    jr nz, jr_001_76f8

    jr jr_001_76eb

jr_001_7703:
    inc hl
    ld a, [hl+]
    or [hl]
    inc hl
    jr nz, jr_001_7703

jr_001_7709:
    ld a, [hl+]
    or [hl]
    inc hl
    jr z, jr_001_7709

    dec hl
    dec hl
    jr jr_001_76eb

    ld e, l
    ld d, h
    pop hl

jr_001_7715:
    ld a, [hl+]
    cp e
    jr nz, jr_001_771e

    ld a, [hl+]
    cp d
    jr z, jr_001_7709

    dec hl

jr_001_771e:
    inc hl
    ld a, [hl+]
    or [hl]
    inc hl
    jr nz, jr_001_7715

    jr jr_001_76eb

jr_001_7726:
    ld b, $a0
    bit 7, d
    jr z, jr_001_7753

    ld b, $41
    jr jr_001_7753

jt01_7730::
    ld a, d
    xor h
    rla
    jr c, jr_001_7726

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
    jr nz, jr_001_7747

    set 4, b
    jr jr_001_7753

jr_001_7747:
    bit 7, h
    jr nz, jr_001_774d

    set 5, b

jr_001_774d:
    bit 7, b
    jr nz, jr_001_7753

    set 0, b

jr_001_7753:
    ld a, b
    ld b, $00
    ld hl, data_01_7762
    add hl, bc
    and [hl]
    ld hl, $0000
    ret z

    inc hl
    scf
    ret


data_01_7762::
    db $10, $60, $80, $90, $01, $11, $40, $50, $20, $30

jt01_776c::
    ld a, [hl+]
    bit 7, a
    ret nz

    push hl
    ld l, [hl]
    ld h, a
    vcall $b8
    pop hl
    inc hl
    vcall $69
    jr jt01_776c

jt01_777b::
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
    dec de
    ld h, a
    or l
    jr z, jr_001_77a2

    add hl, de

jr_001_77a2:
    ld e, l
    ld d, h
    ld hl, sp+$08
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, sp+$00
    ld e, [hl]
    jr jr_001_77f9

jt01_77ae::
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

jr_001_77c0:
    vcall $b1
    vcall $d8
    ld hl, sp+$03
    ld [hl], a
    ld c, a
    and $09
    jr nz, jr_001_7818

    ld a, c
    and $06
    jr nz, jr_001_7822

    ld hl, sp+$02
    ld b, [hl]
    ld hl, sp+$00
    ld a, [hl]
    bit 6, c
    jr nz, jr_001_77e4

    bit 7, c
    jr nz, jr_001_77ed

    call Call_001_782c
    jr jr_001_77c0

jr_001_77e4:
    dec a
    bit 7, a
    jr z, jr_001_77f2

    ld a, b
    dec a
    jr jr_001_77f2

jr_001_77ed:
    inc a
    cp b
    jr c, jr_001_77f2

    xor a

jr_001_77f2:
    ld e, a
    call Call_001_7837
    ld hl, sp+$00
    ld [hl], e

jr_001_77f9:
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
    jr z, jr_001_7813

    ld a, e
    ld de, code_01_780e
    push de
    jp hl


code_01_780e::
    jr nc, jr_001_7813

    ld hl, sp+$00
    ld [hl], a

jr_001_7813:
    call Call_001_782c
    jr jr_001_77c0

jr_001_7818:
    call Call_001_7837
    ld hl, sp+$00
    ld a, [hl]
    add sp, $0a
    or a
    ret


jr_001_7822:
    call Call_001_7837
    ld hl, sp+$00
    ld a, [hl]
    add sp, $0a
    scf
    ret


Call_001_782c:
    ld hl, sp+$03
    ld a, [hl]
    inc [hl]
    and $0f
    ret nz

    bit 4, [hl]
    jr z, jr_001_783b

Call_001_7837:
    ld hl, sp+$09
    jr jr_001_783d

jr_001_783b:
    ld hl, sp+$08

jr_001_783d:
    ld c, [hl]
    ld hl, sp+$02
    ld b, [hl]
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    add b
    ld l, a
    vcall $b8
    ld a, c
    vcall $bb
    ret


jt01_784d::
    ld hl, $ffab
    xor a
    ld [hl+], a
    ld [hl], a
    ldh [$ae], a
    ld c, $05
    ld hl, $ffaf

jr_001_785a:
    ld [hl+], a
    dec c
    jr nz, jr_001_785a

    ld a, $03
    ldh [$b4], a
    ret


jt01_7863::
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
    jr nz, jr_001_787d

    ld de, $ffae
    ld a, [de]
    cp $04
    jr nz, jr_001_787d

    xor a
    ld [de], a

jr_001_787d:
    pop de
    push de
    ld d, $01
    ld bc, $1305
    vcall $58
    pop de
    push de
    ld a, d
    inc e
    ld d, $02
    ld hl, $010c
    ld bc, $0c03
    vcall $59
    pop de
    push de
    inc e
    inc e
    ld bc, $0001
    ld d, $00
    ld a, $7f
    vcall $cd
    vcall $cd
    vcall $cd
    pop de
    push de
    ld bc, $0001
    ld d, $0e
    ld a, $7e
    vcall $cd
    ld a, $75
    vcall $cd
    vcall $cd
    vcall $cd
    ld a, $7d
    vcall $cd
    pop de
    push de
    inc e
    inc e
    ld a, d
    add $24
    ld d, $0f
    ld hl, HeaderLogo
    ld bc, $0401
    vcall $59
    pop de
    push de
    ld a, d
    add $28
    ld d, $00
    ld hl, $0102
    ld bc, $0202
    vcall $59
    xor a
    call Call_001_7f24
    pop de
    call Call_001_7b0e
    ld de, data_01_7ff0
    ld hl, $87f0
    ld bc, $0010
    vcall $02
    ret


jt01_78f0::
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
    call jt01_7f04
    push af
    ld c, a
    jr jr_001_790a

jr_001_7905:
    ld a, $20
    ld [de], a
    inc de
    inc c

jr_001_790a:
    ld a, b
    cp c
    jr nz, jr_001_7905

    pop af
    ld c, a
    cp b
    jr nz, jr_001_7914

    dec c

jr_001_7914:
    ld hl, sp+$3d
    ld b, [hl]
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$00
    vcall $55
    ld hl, sp+$3d
    ld a, [hl]
    ld hl, sp+$00
    call jt01_7e77
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
    call jt01_7e90
    add sp, $3c
    pop bc
    pop de
    pop hl
    ret


jt01_793f::
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
    call jt01_7daf
    ldh a, [$a5]
    ld c, a
    or a
    ld a, d
    jr z, jr_001_795e

jr_001_795e:
    add e
    dec c
    jr nz, jr_001_795e

    ldh [$a2], a
    ld a, $01
    call Call_001_7f24

jr_001_7969:
    vcall $b1
    vcall $d8
    ld b, a
    and $0c
    jr nz, jr_001_7988

    ldh a, [$ab]
    cp $0c
    jr z, jr_001_7980

    bit 0, b
    jr nz, jr_001_7993

    bit 1, b
    jr nz, jr_001_79c5

Jump_001_7980:
jr_001_7980:
    call Call_001_79fe
    call Call_001_7a89
    jr jr_001_7969

jr_001_7988:
    call Call_001_7a85
    xor a
    call Call_001_7f24
    ldh a, [$a5]
    or a
    ret


jr_001_7993:
    ldh a, [$ab]
    cp $0c
    jr z, jr_001_7980

    ld hl, $ffa5
    ld a, [hl-]
    cp [hl]
    jr nc, jr_001_79c3

    ldh a, [$ae]
    call Call_001_7ba9
    ld e, a
    ldh a, [$a2]
    ld d, a
    call Call_001_7dc0
    call Call_001_7b07
    ldh a, [$a5]
    ld c, a
    ld b, $00
    add hl, bc
    ld [hl], e
    ld hl, $ffa4
    cp [hl]
    jr nc, jr_001_79c3

    inc hl
    inc [hl]
    ldh a, [$a3]
    add d
    ldh [$a2], a

jr_001_79c3:
    jr jr_001_7980

jr_001_79c5:
    ldh a, [$a2]
    ld d, a
    ld hl, $ffa5
    ld a, [hl-]
    ld c, a
    or a
    jr z, jr_001_7980

    cp [hl]
    jr nc, jr_001_79d8

    ld e, $20
    call Call_001_7dc0

jr_001_79d8:
    dec hl
    ld a, d
    sub [hl]
    ldh [$a2], a
    ld d, a
    ld e, $20
    call Call_001_7dc0
    ld hl, $ffa5
    ld a, [hl]
    dec [hl]
    dec hl
    cp [hl]
    jr c, jr_001_79ed

    dec a

jr_001_79ed:
    push af
    ld c, a
    ld b, $00
    call Call_001_7b07
    add hl, bc
    ld [hl], e
    pop af
    jr nc, jr_001_79fb

    dec hl
    ld [hl], e

jr_001_79fb:
    jp Jump_001_7980


Call_001_79fe:
    ldh a, [$b6]
    ld b, a
    ld hl, $ffab
    ld a, [hl+]
    cp $0c
    jr z, jr_001_7a1f

    ld a, [hl]
    bit 6, b
    jr nz, jr_001_7a65

    bit 7, b
    jr nz, jr_001_7a73

jr_001_7a12:
    ld hl, $ffab
    ld a, [hl]
    bit 5, b
    jr nz, jr_001_7a53

    bit 4, b
    jr nz, jr_001_7a5c

    ret


jr_001_7a1f:
    ld c, $05
    ld hl, $ffa8
    ld a, [hl+]
    or [hl]
    jr nz, jr_001_7a2a

    ld c, $04

jr_001_7a2a:
    ld hl, $ffae
    ld a, [hl]
    bit 6, b
    jr nz, jr_001_7a41

    bit 7, b
    jr nz, jr_001_7a4a

    ld a, b
    and $30
    ret z

    push bc
    call Call_001_7a85
    pop bc
    jr jr_001_7a12

jr_001_7a41:
    dec a
    bit 7, a
    jr z, jr_001_7a4f

    ld a, c
    dec a
    jr jr_001_7a4f

jr_001_7a4a:
    inc a
    cp c
    jr c, jr_001_7a4f

    xor a

jr_001_7a4f:
    ld [hl], a
    jp Jump_001_7b0e


jr_001_7a53:
    dec a
    bit 7, a
    jr z, jr_001_7a62

    ld a, $0c
    jr jr_001_7a62

jr_001_7a5c:
    inc a
    cp $0d
    jr c, jr_001_7a62

    xor a

jr_001_7a62:
    ld [hl], a
    jr jr_001_7a81

jr_001_7a65:
    or a
    jr nz, jr_001_7a70

    call Call_001_7b5b
    call Call_001_7b0e
    jr jr_001_7a81

jr_001_7a70:
    dec a
    jr jr_001_7a80

jr_001_7a73:
    cp $02
    jr c, jr_001_7a7f

    call Call_001_7b6b
    call Call_001_7b0e
    jr jr_001_7a81

jr_001_7a7f:
    inc a

jr_001_7a80:
    ld [hl], a

jr_001_7a81:
    xor a
    ldh [$ad], a
    ret


Call_001_7a85:
    ld a, $10
    ldh [$ad], a

Call_001_7a89:
    ldh a, [$ad]
    and $0f
    jr nz, jr_001_7ac1

    ldh a, [$a2]
    ld d, a
    ld hl, $ffa5
    ld a, [hl-]
    ld c, a
    cp [hl]
    jr c, jr_001_7a9f

    dec hl
    ld a, d
    sub [hl]
    ld d, a
    dec c

jr_001_7a9f:
    ldh a, [$ad]
    bit 4, a
    jr z, jr_001_7ab1

    ld b, $00
    call Call_001_7b07
    add hl, bc
    ld e, [hl]
    call jt01_7dcc
    jr jr_001_7abf

jr_001_7ab1:
    ld e, $20
    call jt01_7dcc
    push hl
    ld hl, $c3ee
    ld a, $ff
    ld [hl+], a
    ld [hl], a
    pop hl

jr_001_7abf:
    vcall $02

jr_001_7ac1:
    ld hl, $c39c
    push hl
    xor a
    ld [hl+], a
    ld [hl-], a
    pop de
    ld hl, $ffad
    ldh a, [$ab]
    cp $0c
    jr z, jr_001_7af2

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


jr_001_7af2:
    ld a, [hl]
    inc [hl]
    and $0f
    ret nz

    bit 4, [hl]
    jr nz, jr_001_7aff

    ld a, $30
    ldh [$b4], a

jr_001_7aff:
    call Call_001_7b2f
    ld a, $03
    ldh [$b4], a
    ret


Call_001_7b07:
    ld hl, $ffa6
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ret


Call_001_7b0e:
Jump_001_7b0e:
    ld c, $03
    call Call_001_7b77
    push af
    ldh a, [$aa]
    ld d, a

jr_001_7b17:
    ld b, $0c

jr_001_7b19:
    ld a, [hl+]
    ld e, a
    call Call_001_7dc0
    inc d
    dec b
    jr nz, jr_001_7b19

    push de
    call Call_001_7b6b
    pop de
    dec c
    jr nz, jr_001_7b17

    call Call_001_7b77
    pop af
    ld [de], a

Call_001_7b2f:
    ldh a, [$aa]
    add $24
    ld d, a
    ldh a, [$ae]
    add a
    add a
    ld c, a
    ld b, $00
    ld hl, data_01_7b47
    add hl, bc
    ld c, $04
    ld e, $01
    call jt01_7daf
    ret


data_01_7b47::
    db $7b, $87, $8e, $75, $b6, $c0, $b6, $c5, $31, $32, $33, $34, $41, $42, $43, $44
    db $d2, $d3, $20, $20

Call_001_7b5b:
    push de
    call Call_001_7b90
    ld a, [de]
    dec a
    bit 7, a
    jr z, jr_001_7b67

    ld a, [hl]
    dec a

jr_001_7b67:
    ld [de], a
    pop de
    jr jr_001_7b77

Call_001_7b6b:
    push de
    call Call_001_7b90
    ld a, [de]
    inc a
    cp [hl]
    jr c, jr_001_7b75

    xor a

jr_001_7b75:
    ld [de], a
    pop de

Call_001_7b77:
jr_001_7b77:
    push bc
    call Call_001_7b90
    inc hl
    ld a, [de]
    call Call_001_7bd2
    ldh a, [$ae]
    cp $04
    jr nz, jr_001_7b8c

    ld hl, $ffa8
    ld a, [hl+]
    ld h, [hl]
    ld l, a

jr_001_7b8c:
    add hl, bc
    ld a, [de]
    pop bc
    ret


Call_001_7b90:
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
    ld hl, data_01_7bdc
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    pop bc
    ret


Call_001_7ba9:
    push hl
    push de
    push bc
    call Call_001_7bc5
    ldh a, [$ae]
    cp $04
    jr nz, jr_001_7bbb

    ld hl, $ffa8
    ld a, [hl+]
    ld h, [hl]
    ld l, a

jr_001_7bbb:
    add hl, bc
    ldh a, [$ab]
    ld c, a
    add hl, bc
    ld a, [hl]
    pop bc
    pop de
    pop hl
    ret


Call_001_7bc5:
    call Call_001_7b90
    ldh a, [$ac]
    ld c, a
    ld a, [de]
    add c
    cp [hl]
    jr c, jr_001_7bd1

    sub [hl]

jr_001_7bd1:
    inc hl

Call_001_7bd2:
    ld c, a
    add a
    add a
    ld c, a
    add a
    add c
    ld c, a
    ld b, $00
    ret


data_01_7bdc::
    dw data_01_7c6d
    dw data_01_7cda
    dw data_01_7be7
    dw data_01_7c24
    dw data_01_7be6

data_01_7be6::
    db $05

data_01_7be7::
    db $05, $30, $31, $32, $33, $34, $20, $35, $36, $37, $38, $39, $20, $20, $28, $29, $3c, $3e, $20, $1b, $1d, $5b, $5d, $40, $20, $21, $3f, $22, $27, $23, $20, $2b, $2d, $2a, $2f, $25, $20, $2c, $2e, $5c, $24, $3d, $20, $3a, $3b, $5e, $26, $1c, $20, $1e, $1f, $5f, $20, $41, $20, $42, $43, $44, $45, $46, $20

data_01_7c24::
    db $06, $41, $42, $43, $44, $45, $20, $46, $47, $48, $49, $4a, $20, $4b, $4c, $4d, $4e, $4f, $20, $50, $51, $52, $53, $54, $20, $55, $56, $57, $58, $59, $20, $5a, $20, $2e, $21, $3f, $20, $01, $02, $03, $04, $05, $20, $06, $07, $08, $09, $0a, $20, $0b, $0c, $0d, $0e, $0f, $20, $10, $11, $12, $13, $14, $20, $15, $16, $17, $18, $19, $20, $1a, $2d, $27, $28, $29, $20

data_01_7c6d::
    db $09, $61, $62, $63, $64, $65, $20, $66, $67, $68, $69, $6a, $20, $6b, $6c, $6d, $6e, $6f, $20, $70, $71, $72, $73, $74, $20, $75, $76, $77, $78, $79, $20, $7a, $7b, $7c, $7d, $7e, $20, $7f, $80, $81, $82, $83, $20, $84, $20, $85, $20, $86, $20, $87, $88, $89, $8a, $8b, $20, $8c, $20, $60, $20, $8d, $20, $8e, $8f, $90, $91, $92, $20, $93, $94, $95, $96, $97, $20, $98, $99, $9a, $9b, $9c, $20, $9d, $9e, $9f, $a0, $a1, $20, $a2, $a3, $a4, $a5, $a6, $20, $a7, $a8, $a9, $aa, $ab, $20, $ac, $ad, $ae, $af, $20, $20, $2d, $2c, $2e, $21, $3f, $20

data_01_7cda::
    db $09, $b1, $b2, $b3, $b4, $b5, $20, $b6, $b7, $b8, $b9, $ba, $20, $bb, $bc, $bd, $be, $bf, $20, $c0, $c1, $c2, $c3, $c4, $20, $c5, $c6, $c7, $c8, $c9, $20, $ca, $cb, $cc, $cd, $ce, $20, $cf, $d0, $d1, $d2, $d3, $20, $d4, $20, $d5, $20, $d6, $20, $d7, $d8, $d9, $da, $db, $20, $dc, $20, $b0, $20, $dd, $20, $de, $df, $e0, $e1, $e2, $20, $e3, $e4, $e5, $e6, $e7, $20, $e8, $e9, $ea, $eb, $ec, $20, $ed, $ee, $ef, $f0, $f1, $20, $f2, $f3, $f4, $f5, $f6, $20, $f7, $f8, $f9, $fa, $fb, $20, $fc, $fd, $fe, $ff, $20, $20, $2d, $2c, $2e, $21, $3f, $20

jt01_7d47::
    push bc

jr_001_7d48:
    ld a, [hl+]
    bit 7, a
    jr nz, jr_001_7d5e

    push de
    ld d, a
    ld e, [hl]
    inc hl
    push hl
    call jt01_7df1
    ld c, l
    ld b, h
    pop hl
    pop de
    call jt01_7d60
    jr jr_001_7d48

jr_001_7d5e:
    pop bc
    ret


jt01_7d60::
    push hl

jr_001_7d61:
    push bc
    add sp, -$20
    ld hl, sp+$00
    ld c, l
    ld b, h
    ld hl, sp+$22
    ld a, [hl+]
    ld h, [hl]
    ld l, a

jr_001_7d6d:
    ld a, [hl+]
    or a
    jr z, jr_001_7d90

    cp $20
    jr nc, jr_001_7d79

    vcall $b9
    jr jr_001_7d6d

jr_001_7d79:
    push de
    ld e, a
    ld d, [hl]
    vcall $a7
    jr nc, jr_001_7d81

    inc hl

jr_001_7d81:
    pop de
    push de
    ld e, a
    call Call_001_7dc0
    pop de
    ld a, d
    ld [bc], a
    inc bc
    ld a, d
    add e
    ld d, a
    jr jr_001_7d6d

jr_001_7d90:
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
    vcall $02
    pop de
    add sp, $20
    pop bc
    pop hl
    ret


jt01_7daf::
    push de
    push bc
    ld b, e

jr_001_7db2:
    ld e, [hl]
    inc hl
    call Call_001_7dc0
    ld a, b
    add d
    ld d, a
    dec c
    jr nz, jr_001_7db2

    pop bc
    pop de
    ret


Call_001_7dc0:
    push hl
    push de
    push bc
    call jt01_7dcc
    vcall $02
    pop bc
    pop de
    pop hl
    ret


jt01_7dcc::
    ld b, d
    ld hl, $c3e0
    push hl
    ldh a, [$b4]
    ld c, a
    vcall $ba
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


jt01_7df1::
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


jt01_7e03::
    call jt01_7df1
    ld a, $79
    ld de, $7778
    call Call_001_7e20
    dec c
    dec c

jr_001_7e10:
    ld a, $7f
    ld de, data_01_7576
    call Call_001_7e20
    dec c
    jr nz, jr_001_7e10

    ld a, $7c
    ld de, $7a7b

Call_001_7e20:
    add sp, -$20
    push hl
    push bc
    ld hl, sp+$04
    dec b
    dec b
    push hl
    ld [hl], d
    inc hl

jr_001_7e2b:
    ld [hl+], a
    dec b
    jr nz, jr_001_7e2b

    ld [hl], e
    pop de
    pop bc
    pop hl
    push hl
    push bc
    ld c, b
    ld b, $00
    vcall $02
    pop bc
    pop de
    ld hl, $0020
    add hl, de
    add sp, $20
    ret


jt01_7e43::
    push af
    push hl
    add sp, -$20
    call jt01_7df1

jr_001_7e4a:
    push hl
    push bc
    ld hl, sp+$25
    ld d, [hl]
    ld hl, sp+$27
    ld a, [hl]
    ld hl, sp+$04
    push hl

jr_001_7e55:
    ld [hl+], a
    add d
    dec b
    jr nz, jr_001_7e55

    pop de
    pop bc
    pop hl
    push hl
    push bc
    ld c, b
    ld b, $00
    vcall $02
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
    jr nz, jr_001_7e4a

    add sp, $24
    ret


jt01_7e77::
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

jr_001_7e82:
    scf
    dec c
    jr z, jr_001_7e8b

    ld a, [hl-]
    cp $20
    jr z, jr_001_7e82

jr_001_7e8b:
    ld a, c
    pop bc
    pop de
    pop hl
    ret


jt01_7e90::
    push hl
    push bc
    ld c, $00
    ld b, $80

jr_001_7e96:
    ld a, [de]
    inc de
    cp $20
    jr c, jr_001_7ea8

    cp $b0
    jr nc, jr_001_7ec6

    cp $60
    jr nc, jr_001_7eb4

jr_001_7ea4:
    ld [hl+], a
    inc c
    jr jr_001_7e96

jr_001_7ea8:
    add $60
    cp $60
    jr nz, jr_001_7ea4

    ld [hl], $00
    ld a, c
    pop bc
    pop hl
    ret


jr_001_7eb4:
    bit 7, b
    jr z, jr_001_7ebe

jr_001_7eb8:
    ld b, $01
    ld [hl], $0f
    inc hl
    inc c

jr_001_7ebe:
    bit 0, b
    jr z, jr_001_7eb8

    add $50
    jr jr_001_7ed4

jr_001_7ec6:
    bit 7, b
    jr z, jr_001_7ed0

jr_001_7eca:
    ld b, $00
    ld [hl], $0e
    inc hl
    inc c

jr_001_7ed0:
    bit 0, b
    jr nz, jr_001_7eca

jr_001_7ed4:
    cp $f7
    jr nc, jr_001_7ee4

    cp $de
    jr nc, jr_001_7ee8

    cp $b0
    jr nz, jr_001_7ea4

    ld a, $a6
    jr jr_001_7ea4

jr_001_7ee4:
    add $b0
    jr jr_001_7ea4

jr_001_7ee8:
    cp $ed
    jr nc, jr_001_7ef4

    add $d8

jr_001_7eee:
    ld [hl+], a
    inc c
    ld a, $de
    jr jr_001_7ea4

jr_001_7ef4:
    cp $f2
    jr nc, jr_001_7efc

    add $dd
    jr jr_001_7eee

jr_001_7efc:
    add $d8
    ld [hl+], a
    inc c
    ld a, $df
    jr jr_001_7ea4

jt01_7f04::
    push bc
    ld c, $00

jr_001_7f07:
    ld a, [hl+]
    or a
    jr z, jr_001_7f21

    cp $20
    jr nc, jr_001_7f13

    vcall $b9
    jr jr_001_7f07

jr_001_7f13:
    push de
    ld e, a
    ld d, [hl]
    vcall $a7
    jr nc, jr_001_7f1b

    inc hl

jr_001_7f1b:
    pop de
    ld [de], a
    inc de
    inc c
    jr jr_001_7f07

jr_001_7f21:
    ld a, c
    pop bc
    ret


Call_001_7f24:
    ld e, a
    ldh a, [$aa]
    add $28
    ld d, a
    ld c, $04
    ld hl, data_01_7fb0

jt01_7f2f::
    ld a, e
    push af
    push hl
    push bc
    ld e, d
    call jt01_7dcc
    pop bc
    pop de
    pop af
    or a
    jr nz, jr_001_7f4b

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
    vcall $02
    ret


jr_001_7f4b:
    push bc
    push hl
    ld hl, $c3e0
    ld b, $10

jr_001_7f52:
    ld a, [de]
    inc de
    xor $ff
    ld [hl+], a
    dec b
    jr nz, jr_001_7f52

    pop hl
    push de
    push hl
    ld de, $c3e0
    ld bc, $0010
    vcall $02
    pop hl
    ld de, $0010
    add hl, de
    pop de
    pop bc
    dec c
    jr nz, jr_001_7f4b

    ret


data_01_7f70::
    db $ff, $7f, $80, $80, $9f, $8f, $90, $90, $90, $90, $90, $90, $94, $93, $90, $90
    db $ff, $ff, $01, $01, $f9, $f1, $09, $09, $09, $09, $09, $09, $29, $c9, $09, $09
    db $94, $93, $90, $90, $90, $90, $94, $93, $90, $90, $9f, $8f, $80, $80, $7f, $ff
    db $29, $c9, $09, $09, $09, $09, $29, $c9, $09, $09, $f9, $f1, $01, $01, $ff, $fe

data_01_7fb0::
    db $ff, $7f, $80, $80, $81, $80, $83, $81, $87, $82, $8f, $84, $9f, $89, $9e, $9e
    db $fe, $fe, $01, $01, $f1, $e1, $f9, $31, $cd, $49, $8d, $8d, $15

data_01_7fcd::
    db $1d, $25, $3d, $92, $92, $91, $91, $90, $90, $b8, $98, $9f, $bf, $88, $b0, $80
    db $80, $7f, $ff, $49, $79, $91, $f1, $b1, $e1, $e1, $c1, $81, $c1, $01, $01, $01
    db $01, $ff, $fe

data_01_7ff0::
    db $c3, $c3, $81, $81, $00, $00, $00, $00, $00, $00, $00, $00, $81, $81, $c3, $c3
