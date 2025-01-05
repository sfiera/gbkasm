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

SECTION "ROM Bank $01b", ROMX[$4000], BANK[$1b]

traps2::
    dw $5267
    dw $526e
    dw $5275
    dw $527c
    dw $5283
    dw $52b3
    dw $52c8
    dw $52de
    dw $52e0
    dw $52e7
    dw $5322
    dw $537a
    dw $5384
    dw $53b4
    dw $5389
    dw $496e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $54d8
    dw $53c1
    dw $53f1
    dw $547e
    dw $559e
    dw $55d2
    dw $55df
    dw $5b8d
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $5ff2
    dw $60c5
    dw $61c0
    dw $574b
    dw $578a
    dw $58d3
    dw $605c
    dw $58f8
    dw $5901
    dw $59f5
    dw $5681
    dw $593a
    dw $4100
    dw $5914
    dw $5988
    dw $5e2e
    dw $5de2
    dw $5e08
    dw $69ee
    dw $4eaf
    dw $58c4
    dw $56c4
    dw $5730
    dw $571c
    dw $591b
    dw $5c54
    dw $5859
    dw $417f
    dw $419f
    dw $59c1
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $618c
    dw $6209
    dw $6178
    dw $60e2
    dw $60d2
    dw $417e
    dw $417e
    dw $417e
    dw $4437
    dw $4456
    dw $454a
    dw $4566
    dw $4577
    dw $45ca
    dw $45da
    dw $47b7
    dw $49de
    dw $4aa0
    dw $4b98
    dw $4c9a
    dw $4ca9
    dw $4cf1
    dw $417e
    dw $48ec
    dw $4bed
    dw $4926
    dw $4881
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $417e
    dw $41b0
    dw $4259
    dw $417e
    dw $4586
    dw $4a3c
    dw $4df6
    dw $4e7d
    dw $4e36


Jump_01b_4100:
    ld d, a
    push hl
    ld hl, $4171

jr_01b_4105:
    ld a, [hl]
    cp $ff
    jr z, jr_01b_4115

    ld a, d
    or a
    jr z, jr_01b_4118

    inc hl
    inc hl
    inc hl
    inc hl
    dec d
    jr jr_01b_4105

jr_01b_4115:
    pop hl
    scf
    ret


jr_01b_4118:
    ld d, [hl]
    inc hl
    ld a, [hl+]
    dec a
    cp e
    jr c, jr_01b_4115

    sub e
    dec b
    cp b
    jr nc, jr_01b_4125

    ld b, a

jr_01b_4125:
    inc b
    ld c, b
    ld b, $00
    jr nz, jr_01b_412c

    inc b

jr_01b_412c:
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, d
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    cp $08
    jr z, jr_01b_4156

    sla e
    rl d
    sla c
    rl b

jr_01b_4156:
    add hl, de
    ld e, l
    ld d, h
    pop hl
    cp $08
    jr z, jr_01b_4167

    push bc
    push hl
    trap $02
    pop hl
    pop bc
    add hl, bc
    or a
    ret


Call_01b_4167:
jr_01b_4167:
    ld a, [de]
    inc de
    ld [hl+], a
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_01b_4167

    ret


    ld [$8e00], sp
    ld l, a
    db $10
    inc c
    adc [hl]
    ld [hl], a
    db $10
    ld a, b
    ld e, b
    ld a, b
    rst $38
    ret


    ldh a, [rLCDC]
    bit 7, a
    ret z

jr_01b_4184:
    ldh a, [rLY]
    cp $48
    jr nc, jr_01b_4184

    ld a, $00
    ldh [rTAC], a
    ld a, l
    ldh [rTMA], a
    ld a, h
    ldh [rTAC], a
    and $04
    ld h, a
    ldh a, [rIE]
    and $fb
    or h
    ldh [rIE], a
    ret


    push bc
    push de
    push hl
    ld c, a
    trap $18
    cp c
    jr z, jr_01b_41aa

    trap $18

jr_01b_41aa:
    trap $12

Jump_01b_41ac:
    pop hl
    pop de
    pop bc
    ret


Call_01b_41b0:
    cp $2d
    scf
    ret z

    cp $2a
    jr nz, jr_01b_41bc

    ld a, $0a
    jr jr_01b_41cd

jr_01b_41bc:
    cp $23
    jr nz, jr_01b_41c4

    ld a, $0b
    jr jr_01b_41cd

jr_01b_41c4:
    cp $30
    ret c

    cp $3a
    ccf
    ret c

    sub $30

jr_01b_41cd:
    push bc
    push hl
    push af
    push de
    ld a, $80
    ldh [rNR52], a
    ld a, $66
    ldh [rNR51], a
    ld a, $77
    ldh [rNR50], a
    ld a, $80
    ldh [rNR21], a
    ld a, $f0
    ldh [rNR22], a
    ld a, $80
    ldh [rNR30], a
    ld a, $20
    ldh [rNR32], a
    ld hl, $ff30
    ld de, $4231
    ld b, $10

jr_01b_41f5:
    ld a, [de]
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_01b_41f5

    pop de
    pop af
    ld hl, $4241
    add a
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl+]
    ldh [rNR33], a
    ld a, [hl]
    ldh [rNR23], a
    ld a, $87
    ldh [rNR24], a
    ldh [rNR34], a
    ld b, $06

jr_01b_4213:
    call Call_01b_60c5
    dec b
    jr nz, jr_01b_4213

    ldh a, [rNR30]
    and $7f
    ldh [rNR30], a
    ldh a, [rNR52]
    and $7f
    ldh [rNR52], a
    ld b, $06

jr_01b_4227:
    call Call_01b_60c5
    dec b
    jr nz, jr_01b_4227

    pop hl
    pop bc
    xor a
    ret


    adc d
    rst $18
    cp $ca
    ld [hl], h
    jr nz, jr_01b_4239

    dec [hl]

jr_01b_4239:
    adc d
    rst $18
    cp $ca
    ld [hl], h
    jr nz, jr_01b_4241

    dec [hl]

jr_01b_4241:
    ld [hl], h
    sbc [hl]
    ld b, h
    sub h
    ld b, h
    sbc [hl]
    ld b, h
    xor b
    ld d, h
    sub h
    ld d, h
    sbc [hl]
    ld d, h
    xor b
    ld h, h
    sub h
    ld h, h
    sbc [hl]
    ld h, h
    xor b
    ld [hl], h
    sub h
    ld [hl], h
    xor b
    push bc
    push hl
    call Call_01b_426e
    or a
    jr z, jr_01b_426a

    ld a, [hl+]
    call Call_01b_41b0
    ld a, [hl]
    call Call_01b_41b0
    scf

jr_01b_426a:
    ccf
    pop hl
    pop bc
    ret


Call_01b_426e:
    ld b, a
    ld hl, $430a
    ld a, c
    cp $27
    jr nz, jr_01b_427a

    ld hl, $4283

jr_01b_427a:
    ld a, [hl+]
    or a
    ret z

    cp b
    ret z

    inc hl
    inc hl
    jr jr_01b_427a

    ld b, l
    ld [hl-], a
    ld [hl], $46
    ld [hl-], a
    scf
    ld b, a
    ld [hl-], a
    jr c, @+$4a

    ld [hl-], a
    add hl, sp
    ld c, c
    inc sp
    ld [hl], $4a
    inc sp
    scf
    ld c, e
    inc sp
    jr c, @+$4e

    inc sp
    add hl, sp
    ld c, l
    inc [hl]
    ld [hl], $4e
    inc [hl]
    scf
    ld c, a
    inc [hl]
    jr c, @+$52

    inc [hl]
    add hl, sp
    ld d, c
    dec [hl]
    ld [hl], $52
    dec [hl]
    scf
    ld d, e
    dec [hl]
    jr c, jr_01b_4305

    dec [hl]
    add hl, sp
    ld d, l
    ld [hl], $36
    ld d, [hl]
    ld [hl], $37
    ld d, a
    ld [hl], $38

jr_01b_42bc:
    ld e, b
    ld [hl], $39
    ld e, c
    scf
    ld [hl], $5a
    scf
    scf
    ccf
    scf
    jr c, jr_01b_42ea

    scf
    add hl, sp
    dec l
    jr nc, jr_01b_4305

    cpl
    jr nc, jr_01b_4307

    ld e, h
    jr c, @+$3b

    ld h, $30
    jr c, jr_01b_434f

    add hl, sp
    jr c, jr_01b_434f

    add hl, sp
    add hl, sp
    ld l, b
    jr c, @+$3a

    ld a, [hl+]
    jr c, jr_01b_431a

    inc hl
    jr c, @+$38

    jr nz, @+$32

    add hl, sp
    ld [hl], l

jr_01b_42ea:
    add hl, sp
    ld [hl], $64
    add hl, sp
    scf
    ld sp, $3031
    ld [hl-], a
    ld [hl-], a
    jr nc, jr_01b_4329

    inc sp
    jr nc, jr_01b_432d

    inc [hl]
    jr nc, jr_01b_4331

    dec [hl]
    jr nc, jr_01b_4335

    ld [hl], $30
    scf
    scf
    jr nc, jr_01b_433d

jr_01b_4305:
    jr c, jr_01b_4337

jr_01b_4307:
    add hl, sp
    add hl, sp
    jr nc, jr_01b_42bc

    ld sp, $b231
    ld sp, $b332
    ld sp, $b433
    ld sp, $b534
    ld sp, $b635

jr_01b_431a:
    ld [hl-], a
    ld sp, $32b7
    ld [hl-], a
    cp b
    ld [hl-], a
    inc sp
    cp c
    ld [hl-], a
    inc [hl]
    cp d
    ld [hl-], a
    dec [hl]
    cp e

jr_01b_4329:
    inc sp
    ld sp, $33bc

jr_01b_432d:
    ld [hl-], a
    cp l
    inc sp
    inc sp

jr_01b_4331:
    cp [hl]
    inc sp
    inc [hl]
    cp a

jr_01b_4335:
    inc sp
    dec [hl]

jr_01b_4337:
    ret nz

    inc [hl]
    ld sp, $34c1
    ld [hl-], a

jr_01b_433d:
    jp nz, Jump_000_3334

    jp Jump_000_3434


    call nz, Call_000_3534
    push bc
    dec [hl]
    ld sp, $35c6
    ld [hl-], a
    rst $00
    dec [hl]
    inc sp

jr_01b_434f:
    ret z

    dec [hl]
    inc [hl]
    ret


    dec [hl]
    dec [hl]
    jp z, $3136

    swap [hl]
    ld [hl-], a
    call z, $3336
    call Call_000_3436
    adc $36
    dec [hl]
    trap $37
    ld sp, $37d0
    ld [hl-], a
    pop de
    scf
    inc sp
    jp nc, $3437

    db $d3
    scf
    dec [hl]
    call nc, Call_000_3138
    jr z, jr_01b_43b0

    ld [hl-], a
    push de
    jr c, @+$35

    add hl, hl
    jr c, jr_01b_43b3

    sub $38
    dec [hl]
    pushx @ + $3139
    ret c

    add hl, sp
    ld [hl-], a
    reti


    add hl, sp
    inc sp
    jp c, Jump_000_3439

    db $db
    add hl, sp
    dec [hl]
    call c, Call_000_3130
    and [hl]
    jr nc, jr_01b_43c9

    db $dd
    jr nc, @+$35

    sbc $30
    inc [hl]
    rst $18
    jr nc, jr_01b_43d5

    ld b, c
    ld sp, $4236
    ld sp, $4337
    ld sp, $4438
    ld sp, $4539
    ld sp, $4630

jr_01b_43b0:
    ld [hl-], a
    ld [hl], $47

jr_01b_43b3:
    ld [hl-], a
    scf
    ld c, b
    ld [hl-], a
    jr c, jr_01b_4402

    ld [hl-], a
    add hl, sp
    ld c, d
    ld [hl-], a
    jr nc, jr_01b_440a

    inc sp
    ld [hl], $4c
    inc sp
    scf
    ld c, l
    inc sp
    jr c, @+$50

    inc sp

jr_01b_43c9:
    add hl, sp
    ld c, a
    inc sp
    jr nc, jr_01b_441e

    inc [hl]
    ld [hl], $51
    inc [hl]
    scf
    ld d, d
    inc [hl]

jr_01b_43d5:
    jr c, jr_01b_442a

    inc [hl]
    add hl, sp
    ld d, h
    inc [hl]
    jr nc, @+$57

    dec [hl]
    ld [hl], $56
    dec [hl]
    scf
    ld d, a
    dec [hl]
    jr c, jr_01b_443e

    dec [hl]
    add hl, sp
    ld e, c
    dec [hl]
    jr nc, jr_01b_4446

    ld [hl], $36
    ccf
    ld [hl], $37
    ld hl, $3836
    dec l
    ld [hl], $39
    cpl
    ld [hl], $30
    ld e, h
    scf
    ld [hl], $26
    scf
    scf
    ld [hl], a
    scf

jr_01b_4402:
    jr c, @+$76

    scf
    add hl, sp
    ld h, e
    scf
    jr nc, @+$2c

jr_01b_440a:
    jr c, jr_01b_4442

    inc hl
    jr c, jr_01b_4446

    jr nz, @+$3a

    jr c, jr_01b_447b

    jr c, jr_01b_444e

    jr nz, jr_01b_444f

    jr nc, @+$33

    add hl, sp
    ld [hl], $32
    add hl, sp
    scf

jr_01b_441e:
    inc sp
    add hl, sp
    jr c, jr_01b_4456

    add hl, sp
    add hl, sp
    dec [hl]
    add hl, sp
    jr nc, jr_01b_445e

    jr nc, @+$38

jr_01b_442a:
    scf
    jr nc, jr_01b_4464

    jr c, jr_01b_445f

    jr c, jr_01b_446a

    jr nc, jr_01b_446c

    jr nc, @+$32

    jr nc, jr_01b_4437

jr_01b_4437:
    ldh a, [$81]
    push af
    call Call_01b_44e9

Jump_01b_443d:
    pop af

jr_01b_443e:
    or a
    call Call_01b_4475

Call_01b_4442:
jr_01b_4442:
    xor a
    ld [$0000], a

jr_01b_4446:
    ret


Jump_01b_4447:
    pop af
    call Call_01b_4475
    call Call_01b_4442

jr_01b_444e:
    scf

jr_01b_444f:
    ret


Call_01b_4450:
    ld a, $0a
    ld [$0000], a
    ret


jr_01b_4456:
    ldh a, [$81]
    push af
    call Call_01b_447b
    jr c, jr_01b_4466

Jump_01b_445e:
jr_01b_445e:
    pop af

jr_01b_445f:
    call Call_01b_4475
    xor a
    ret


Jump_01b_4464:
jr_01b_4464:
    add sp, $02

Jump_01b_4466:
jr_01b_4466:
    pop af
    call Call_01b_4475

jr_01b_446a:
    scf
    ret


Call_01b_446c:
jr_01b_446c:
    ld hl, $0016
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [$0015]

Call_01b_4475:
Jump_01b_4475:
    ldh [$81], a
    ld [$4000], a
    ret


Call_01b_447b:
jr_01b_447b:
    call Call_01b_446c
    ld de, $53ac
    ld a, [hl+]
    cp d
    jr nz, jr_01b_44e5

    ld a, [hl+]
    cp e
    jr nz, jr_01b_44e5

    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, [bc]
    cp d
    jr nz, jr_01b_44e5

    inc bc
    ld a, [bc]
    cp e
    jr nz, jr_01b_44e5

    ld de, $c000
    dec bc
    jr jr_01b_44a4

jr_01b_449b:
    inc hl
    cpl
    cp [hl]
    jr nz, jr_01b_44e5

    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]

jr_01b_44a4:
    inc hl
    ld a, [hl+]
    cp e
    jr nz, jr_01b_44e5

    ld a, [hl]
    cp d
    jr nz, jr_01b_44e5

    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    ld e, l
    ld d, h
    ld l, c
    ld h, b
    ld a, h
    cp $a0
    jr c, jr_01b_44e7

    cp d
    jr c, jr_01b_44d0

    jr nz, jr_01b_44c4

    ld a, l
    cp e
    jr c, jr_01b_44d0

jr_01b_44c4:
    ldh a, [$81]
    or a
    jr z, jr_01b_44e5

    dec a
    call Call_01b_4475
    ld de, $c000

jr_01b_44d0:
    ld a, [hl]
    cp $46
    jr z, jr_01b_449b

    cp $5a
    jr z, jr_01b_449b

    cp $52
    jr z, jr_01b_449b

    cp $44
    jr z, jr_01b_449b

    cp $53
    jr z, jr_01b_449b

jr_01b_44e5:
    scf
    ret


jr_01b_44e7:
    xor a
    ret


Call_01b_44e9:
    call Call_01b_446c
    call Call_01b_4450
    push hl
    ld bc, $fe1a
    add hl, bc
    push hl
    xor a
    ld b, $f6
    call Call_01b_4545
    ld b, $f0
    call Call_01b_4545
    ld b, $46
    call Call_01b_4545
    ld a, $20
    ld b, $3a
    call Call_01b_4545
    pop bc
    pop hl
    ld de, $c000
    call Call_01b_4534
    ld bc, $a002
    call Call_01b_4534

jr_01b_451a:
    ldh a, [$81]
    or a
    jr nz, jr_01b_4522

    ld bc, $4000

jr_01b_4522:
    ld a, $46
    call Call_01b_4536
    ld de, $c000
    ldh a, [$81]
    or a
    ret z

    dec a
    call Call_01b_4475
    jr jr_01b_451a

Call_01b_4534:
    ld a, $53

Call_01b_4536:
    push hl
    ld [hl+], a
    cpl
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld [hl], d
    pop de
    ld l, c
    ld h, b
    ret


Call_01b_4545:
jr_01b_4545:
    ld [hl+], a
    dec b
    jr nz, jr_01b_4545

    ret


    ldh a, [$81]
    push af
    call Call_01b_4556
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp Jump_01b_445e


Call_01b_4556:
    call Call_01b_446c
    ld a, e
    and $1f
    add a
    ld e, a
    ld d, $00
    add hl, de
    ld de, $0006
    add hl, de
    ret


    ldh a, [$81]
    push af
    push hl
    call Call_01b_4556
    call Call_01b_4450
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    jp Jump_01b_443d


Call_01b_4577:
    ldh a, [$81]
    push af
    push hl
    call Call_01b_4586
    ld e, l
    ld d, h
    pop hl
    trap $02
    jp Jump_01b_445e


Call_01b_4586:
    ld a, d
    cp $ff
    jr z, jr_01b_45a8

    cp $fe
    jr z, jr_01b_45af

    ld h, d
    ld l, e

Call_01b_4591:
    ld a, h
    and $60
    rlca
    rlca
    rlca
    push af
    ld a, h
    and $1f
    or $a0
    ld h, a
    pop af
    push hl
    ld hl, $ff97
    or [hl]
    pop hl
    jp Jump_01b_4475


Call_01b_45a8:
jr_01b_45a8:
    call Call_01b_446c
    ld d, $00
    add hl, de
    ret


jr_01b_45af:
    call Call_01b_446c
    ld a, $77
    sub e
    jr nc, jr_01b_45b9

    ld a, $77

jr_01b_45b9:
    inc a
    push af
    ld e, l
    ld d, h
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    pop af
    ret


Call_01b_45ca:
    ldh a, [$81]
    push af
    push hl
    call Call_01b_4586
    call Call_01b_4450
    pop de
    trap $02
    jp Jump_01b_443d


Call_01b_45da:
    ld a, h
    or l
    jr nz, jr_01b_45e1

    ld hl, $1fff

jr_01b_45e1:
    ldh a, [$81]
    push af
    push hl
    call Call_01b_446c
    pop bc
    ld de, $0000
    push de
    ld a, b
    ld e, a
    and $1f
    ld b, a
    ld a, e
    and $e0
    ld e, $44
    jr z, jr_01b_4606

    ld e, $52
    cp $20
    jr z, jr_01b_4606

    ld e, $5a
    cp $40
    jp nz, Jump_01b_4464

jr_01b_4606:
    push bc
    ld d, $46
    call Call_01b_471e
    pop bc
    jp c, Jump_01b_46ee

    ld a, e
    cp $5a
    jr nz, jr_01b_461f

    ld a, h
    cp $a0
    jr nz, jr_01b_4606

    ld a, l
    cp $02
    jr nz, jr_01b_4606

jr_01b_461f:
    push hl
    push de
    inc hl
    inc hl
    inc hl
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld d, a
    ld a, e
    sub c
    ld a, d
    sbc b
    jr nc, jr_01b_4649

    push bc
    ld hl, sp+$06
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, c
    sub e
    ld a, b
    sbc d
    jr nc, jr_01b_4644

    ld [hl], d
    dec hl
    ld [hl], e

jr_01b_4644:
    pop bc
    pop de
    pop hl
    jr jr_01b_4606

jr_01b_4649:
    pop de
    pop hl
    push hl
    call Call_01b_4450
    ld a, e
    cp $5a
    jr z, jr_01b_467f

    push de
    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    ld a, l
    sub c
    ld e, a
    ld a, h
    sbc b
    ld d, a
    ld a, e
    sub $06
    ld e, a
    ld a, d
    sbc $00
    ld d, a
    jr c, jr_01b_467d

    ld c, e
    ld b, d
    pop hl
    pop de
    ld a, e
    ld e, $46
    jr jr_01b_4681

jr_01b_467d:
    pop hl
    pop de

jr_01b_467f:
    ld a, $46

jr_01b_4681:
    push af
    ld a, e
    ld [hl+], a
    cpl
    ld [hl+], a
    inc hl
    inc hl
    push hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld a, c
    add l
    ld c, a
    ld a, b
    adc h
    ld b, a
    push bc
    ld a, e
    sub c
    ld c, a
    ld a, d
    sbc b
    ld b, a
    jr nz, jr_01b_46a7

    ld a, c
    cp $07
    jr nc, jr_01b_46a7

    pop bc
    pop hl
    pop af
    pop hl
    jr jr_01b_46e2

jr_01b_46a7:
    pop bc
    pop hl
    pop af
    ld [hl], c
    inc hl
    ld [hl], b
    ld l, c
    ld h, b
    pop bc
    push hl
    ld [hl+], a
    cpl
    ld [hl+], a
    ld [hl], c
    inc hl
    ld [hl], b
    inc hl
    ld [hl], e
    inc hl
    ld [hl], d
    ld l, c
    ld h, b
    pop bc
    cpl
    cp $46
    jr z, jr_01b_46c5

    ld l, c
    ld h, b

jr_01b_46c5:
    ld a, d
    sub $c0
    or e
    jr nz, jr_01b_46df

    ld de, $a002
    ldh a, [$81]
    inc a
    call Call_01b_4475
    call Call_01b_4877
    ldh a, [$81]
    dec a
    call Call_01b_4475
    jr jr_01b_46e2

jr_01b_46df:
    call Call_01b_4877

jr_01b_46e2:
    ld de, $0006
    add hl, de
    call Call_01b_470a
    add sp, $02
    jp Jump_01b_443d


Jump_01b_46ee:
    pop hl
    set 7, h
    jp Jump_01b_445e


Call_01b_46f4:
Jump_01b_46f4:
    ldh a, [$81]
    push af

jr_01b_46f7:
    call Call_01b_446c
    ld d, $44
    call Call_01b_471e
    jp c, Jump_01b_4466

    call Call_01b_470a
    call Call_01b_47c5
    jr jr_01b_46f7

Call_01b_470a:
    ld a, h
    and $1f
    ld h, a
    ldh a, [$81]
    and $fc
    ldh [$97], a
    ldh a, [$81]
    and $03
    rrca
    rrca
    rrca
    or h
    ld h, a
    ret


Call_01b_471e:
jr_01b_471e:
    ld a, [hl]
    inc hl
    cpl
    cp [hl]
    jr nz, jr_01b_475b

    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    dec hl
    dec hl
    dec hl
    ld a, b
    cp $a0
    jr c, jr_01b_475b

    cp h
    jr c, jr_01b_4742

    jr nz, jr_01b_4739

    ld a, c
    cp l
    jr c, jr_01b_4742

jr_01b_4739:
    ldh a, [$81]
    or a
    jr z, jr_01b_475b

    dec a
    call Call_01b_4475

jr_01b_4742:
    ld l, c
    ld h, b
    ld a, [hl]
    cp d
    ret z

    cp $46
    jr z, jr_01b_471e

    cp $5a
    jr z, jr_01b_471e

    cp $52
    jr z, jr_01b_471e

    cp $44
    jr z, jr_01b_471e

    cp $53
    jr z, jr_01b_471e

jr_01b_475b:
    scf
    ret


Call_01b_475d:
    ld a, b
    cp $a0
    jr c, jr_01b_476d

    cp h
    jr c, jr_01b_476b

    jr nz, jr_01b_4770

    ld a, c
    cp l
    jr nc, jr_01b_4770

jr_01b_476b:
    xor a
    ret


jr_01b_476d:
    xor a
    scf
    ret


jr_01b_4770:
    xor a
    inc a
    ret


Call_01b_4773:
    call Call_01b_475d
    ret c

    jp z, Jump_01b_483d

    ldh a, [$81]
    dec a
    call Call_01b_4475
    push hl
    ld hl, $c000
    call Call_01b_483d
    pop hl
    push af
    ldh a, [$81]
    inc a
    call Call_01b_4475
    pop af
    ret


Call_01b_4791:
    ld a, d
    sub $c0
    or e
    jp nz, Jump_01b_4856

    ldh a, [$81]
    inc a
    call Call_01b_4475
    push de
    ld de, $a002
    call Call_01b_4856
    pop de
    push af
    ldh a, [$81]
    dec a
    call Call_01b_4475
    pop af
    ret


Call_01b_47af:
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ret


    ld a, h
    or l
    jp z, Jump_01b_46f4

    ld de, $fffa
    add hl, de
    ccf
    ret c

    ld a, h
    rlca
    ret c

Call_01b_47c5:
    ld e, l
    ld d, h
    ldh a, [$81]
    push af
    call Call_01b_4586
    push hl
    ld a, [hl+]
    cp $53
    jp z, Jump_01b_4838

    cpl
    cp [hl]
    jp nz, Jump_01b_4838

    inc hl
    call Call_01b_47af
    pop hl
    call Call_01b_4773
    jp nz, Jump_01b_4466

    call Call_01b_4791
    jp nz, Jump_01b_4466

    call Call_01b_4450
    ld a, $46
    ld [hl+], a
    cpl
    ld [hl-], a
    call Call_01b_475d
    jr c, jr_01b_4808

    jp nz, Jump_01b_4808

    ld a, [bc]
    cp $46
    jr nz, jr_01b_4808

jr_01b_47ff:
    ld hl, $0004
    add hl, bc
    ld [hl], e
    inc hl
    ld [hl], d
    ld l, c
    ld h, b

Jump_01b_4808:
jr_01b_4808:
    ld b, h
    ld c, l
    ld a, d
    sub $c0
    or e
    jr nz, jr_01b_4824

    ldh a, [$81]
    inc a
    call Call_01b_4475
    ld de, $a002
    call Call_01b_4877
    ldh a, [$81]
    dec a
    call Call_01b_4475
    jr jr_01b_4835

jr_01b_4824:
    ld a, [de]
    cp $46
    jr nz, jr_01b_4832

    ld hl, $0004
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    jr jr_01b_47ff

jr_01b_4832:
    call Call_01b_4877

jr_01b_4835:
    jp Jump_01b_443d


Jump_01b_4838:
    add sp, $02
    jp Jump_01b_4466


Call_01b_483d:
Jump_01b_483d:
    push bc
    push de
    push hl
    ld a, [bc]
    ld d, a
    inc bc
    ld a, [bc]
    cpl
    cp d
    jr nz, jr_01b_4852

    inc bc
    inc bc
    inc bc
    ld a, [bc]
    cp l
    jr nz, jr_01b_4852

    inc bc
    ld a, [bc]
    cp h

jr_01b_4852:
    pop hl
    pop de
    pop bc
    ret


Call_01b_4856:
Jump_01b_4856:
    push bc
    push de
    push hl
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    cpl
    cp b
    jr nz, jr_01b_4852

    inc de
    ld a, [de]
    cp l
    jr nz, jr_01b_4852

    inc de
    ld a, [de]
    cp h
    jr jr_01b_4852

    push bc
    inc bc
    inc bc
    inc bc
    inc bc
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    pop bc
    ret


Call_01b_4877:
    push de
    inc de
    inc de
    ld a, c
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    pop de
    ret


    push hl
    call Call_01b_4889
    ld e, l
    ld d, h
    pop hl
    ret


Call_01b_4889:
    call Call_01b_48dc
    ret c

    ld e, l
    ld d, h
    ldh a, [$81]
    push af
    call Call_01b_4586
    push hl
    ld a, [hl+]
    cpl
    cp [hl]
    jp nz, Jump_01b_4838

    inc hl
    call Call_01b_47af
    pop hl
    call Call_01b_4773
    jp nz, Jump_01b_4466

    call Call_01b_4791
    jp nz, Jump_01b_4466

    call Call_01b_475d
    jr c, jr_01b_48ba

    jp nz, Jump_01b_48ba

    ld a, [bc]
    cp $46
    jr z, jr_01b_48bc

Jump_01b_48ba:
jr_01b_48ba:
    ld c, l
    ld b, h

jr_01b_48bc:
    ld a, d
    sub $c0
    or e
    jr z, jr_01b_48ce

    ld a, [de]
    cp $46
    jr nz, jr_01b_48ce

    ld hl, $0004
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]

jr_01b_48ce:
    ld a, e
    sub c
    ld l, a
    ld a, d
    sbc b
    ld h, a
    ld de, $fffa
    add hl, de
    xor a
    jp Jump_01b_445e


Call_01b_48dc:
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ldh [$97], a
    ld hl, $fffa
    add hl, de
    ccf
    ret c

    ld a, h
    rlca
    ret


Call_01b_48ec:
    call Call_01b_48dc
    ret c

    push de
    call Call_01b_47c5
    pop de
    ldh a, [$81]
    push af
    push de
    ld de, $fe00
    call Call_01b_4450
    call Call_01b_4586
    ld b, a
    pop de

jr_01b_4904:
    ld a, [hl+]
    cp e
    jr nz, jr_01b_491d

    ld a, [hl+]
    cp d
    jr nz, jr_01b_491e

    ldh a, [$97]
    cp [hl]
    jr nz, jr_01b_491e

    xor a
    ld [hl-], a
    ld [hl-], a
    ld [hl], a
    ld a, $78
    sub b
    ldh [$b7], a
    jp Jump_01b_443d


jr_01b_491d:
    inc hl

jr_01b_491e:
    inc hl
    inc hl
    dec b
    jr nz, jr_01b_4904

    jp Jump_01b_443d


    or a
    ldh a, [$81]
    push af
    push af
    ld de, $fe00
    call Call_01b_4586
    ld b, a
    ld c, $00

jr_01b_4934:
    ld a, [hl+]
    or [hl]
    jr z, jr_01b_4939

    inc c

jr_01b_4939:
    inc hl
    inc hl
    inc hl
    dec b
    jr nz, jr_01b_4934

    ld a, $78
    sub c
    ld b, a
    pop af
    jp z, Jump_01b_445e

    push bc
    ld hl, $0000

jr_01b_494b:
    push hl
    ld hl, $1ff8
    call Call_01b_45da
    bit 7, h
    jr nz, jr_01b_495d

    pop hl
    ld de, $001f
    add hl, de
    jr jr_01b_494b

jr_01b_495d:
    ld a, h
    and $1f
    ld e, a
    ld d, $00
    pop hl
    add hl, de
    push hl
    call Call_01b_46f4
    pop de
    pop bc
    jp Jump_01b_445e


    push hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    cp $ff
    jp z, Jump_01b_49dc

    ldh [$97], a
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl+]
    bit 0, a
    jr z, jr_01b_49dc

    ld hl, $fffa
    add hl, de
    jr nc, jr_01b_49dc

    ld a, h
    rlca
    jr c, jr_01b_49dc

    push bc
    ldh a, [$81]
    push af
    call Call_01b_4591
    ld bc, $000a
    add hl, bc
    ld c, [hl]
    inc hl
    add hl, bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    pop af
    call Call_01b_4475
    pop bc
    ld a, c
    ld bc, $0000
    dec a
    jr z, jr_01b_49ba

    ld a, e
    or d
    jr z, jr_01b_49ba

    dec b
    dec c
    ld a, e
    cpl
    ld e, a
    ld a, d
    cpl
    ld d, a
    inc de

jr_01b_49ba:
    ldh a, [$81]
    push af
    push de
    push bc
    ld e, $40
    call Call_01b_45a8
    call Call_01b_4450
    pop bc
    pop de
    ld a, [hl]
    add e
    ld [hl+], a
    ld a, [hl]
    adc d
    ld [hl+], a
    ld a, [hl]
    adc c
    ld [hl+], a
    ld a, [hl]
    adc b
    ld [hl], a
    pop af
    call Call_01b_4475
    call Call_01b_4442

Jump_01b_49dc:
jr_01b_49dc:
    pop hl
    ret


    ld c, l
    ld b, h
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    or e
    jr z, jr_01b_4a05

    ld a, [hl]
    ldh [$97], a
    ld hl, $fffa
    add hl, de
    jr nc, jr_01b_49fc

    ld a, h
    rlca
    jr c, jr_01b_49fc

    ldh a, [$81]
    push af
    call Call_01b_4591
    jr jr_01b_4a0b

jr_01b_49fc:
    ld l, c
    ld h, b
    scf
    ret


jr_01b_4a00:
    ld l, c
    ld h, b
    jp Jump_01b_4466


jr_01b_4a05:
    ldh a, [$81]
    push af
    call Call_01b_446c

jr_01b_4a0b:
    ld e, l
    ld d, h
    ld a, [hl+]
    cpl
    cp [hl]
    jr nz, jr_01b_4a00

    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, h
    cp $a0
    jr c, jr_01b_4a00

    cp d
    jr c, jr_01b_4a2d

    jr nz, jr_01b_4a24

    ld a, l
    cp e
    jr c, jr_01b_4a2d

jr_01b_4a24:
    ldh a, [$81]
    or a
    jr z, jr_01b_4a00

    dec a
    call Call_01b_4475

jr_01b_4a2d:
    ld a, [hl]
    cp $52
    jr z, jr_01b_4a36

    cp $5a
    jr nz, jr_01b_4a0b

jr_01b_4a36:
    call Call_01b_4a4b
    jp Jump_01b_445e


    ld a, e
    ldh [$97], a
    ldh a, [$81]
    push af
    call Call_01b_4591
    call Call_01b_4a4f
    jp Jump_01b_445e


Call_01b_4a4b:
    ld de, $0006
    add hl, de

Call_01b_4a4f:
    ld e, l
    ld d, h
    call Call_01b_470a
    push bc
    ld a, l
    ld [bc], a
    inc bc
    ld a, h
    ld [bc], a
    inc bc
    ldh a, [$97]
    ld [bc], a
    inc bc
    ld l, c
    ld h, b
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
    or a
    jr z, jr_01b_4a82

    push bc

jr_01b_4a7b:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_01b_4a7b

    pop bc

jr_01b_4a82:
    pop hl
    call Call_01b_4a88
    pop hl
    ret


Call_01b_4a88:
    ld de, $002e
    bit 0, b
    jr nz, jr_01b_4a90

    ld e, d

jr_01b_4a90:
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
    ret


    ld a, c
    cp $ff
    jr nz, jr_01b_4aa8

    ldh a, [$b7]
    ld c, a

jr_01b_4aa8:
    push bc
    push hl
    ld a, $0b
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ld c, [hl]
    ld hl, $002e
    bit 0, b
    jr nz, jr_01b_4abb

    ld l, h

jr_01b_4abb:
    ld a, $05
    add c
    add l
    ld l, a
    ld a, h
    adc a
    ld h, a
    add hl, de
    ld e, l
    ld d, h
    pop hl
    pop bc
    push bc
    push hl
    ld a, $07
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    ld [hl], b
    ld a, $20
    bit 1, b
    jr z, jr_01b_4adf

    ld a, $40

jr_01b_4adf:
    or d
    ld h, a
    ld l, e
    call Call_01b_45da
    ld d, h
    ld e, l
    pop hl
    pop bc
    ld a, d
    rlca
    ret c

    push bc
    push hl
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    ldh a, [$97]
    ld [hl], a
    inc hl
    push hl
    ld bc, $0006
    add hl, bc
    ld b, [hl]
    inc hl
    inc hl
    ld c, [hl]
    pop hl
    push de
    call Call_01b_4a88
    pop de
    pop hl
    push hl
    push de
    push bc
    ld b, $00
    ld a, $07
    add l
    ld l, a
    ld a, b
    adc h
    ld h, a
    call Call_01b_45ca
    pop bc
    pop hl
    pop de
    push de
    bit 0, b
    jr z, jr_01b_4b5c

    ld b, $00
    add hl, bc
    add sp, -$2e
    push hl
    ld hl, $0007
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $000a
    trap $8a
    ld de, $000a
    trap $89
    ld e, l
    ld d, h
    ld hl, sp+$02
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    push hl
    ld de, $ff46
    ld bc, $000a
    push bc
    call Call_01b_4577
    pop bc
    pop hl
    add hl, bc
    xor a
    ld b, $22

jr_01b_4b4d:
    ld [hl+], a
    dec b
    jr nz, jr_01b_4b4d

    ld hl, sp+$02
    pop de
    ld bc, $002e
    call Call_01b_45ca
    add sp, $2e

jr_01b_4b5c:
    pop hl
    pop de
    ldh a, [$81]
    push af
    push hl
    push hl
    ld d, $fe
    call Call_01b_4450
    call Call_01b_4586
    ld b, a

jr_01b_4b6c:
    ld a, [hl+]
    or [hl]
    jr z, jr_01b_4b7e

    inc hl
    inc hl
    inc hl
    dec b
    jr nz, jr_01b_4b6c

    pop hl
    call Call_01b_48ec
    pop hl
    jp Jump_01b_4447


jr_01b_4b7e:
    dec hl
    pop de
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    inc de
    inc de
    inc de
    inc de
    inc de
    inc de
    inc de
    inc de
    inc de
    ld a, [de]
    ld [hl], a
    pop hl
    jp Jump_01b_443d


Call_01b_4b98:
    push hl
    inc hl
    inc hl
    inc hl
    push hl
    ld a, b
    call Call_01b_4bb9
    pop hl
    push af
    jr c, jr_01b_4ba9

    ld [hl], e
    inc hl
    ld [hl], d
    dec hl

jr_01b_4ba9:
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld d, a
    pop af
    pop hl
    ret


Call_01b_4bb9:
    or a
    jr z, jr_01b_4bc4

    dec a
    jr z, jr_01b_4bdc

    dec a
    jr z, jr_01b_4be3

    scf
    ret


jr_01b_4bc4:
    inc hl
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]

jr_01b_4bc9:
    inc hl

jr_01b_4bca:
    ld a, e
    add c
    ld e, a
    ld a, d
    adc b
    ld d, a
    cp $20
    ccf
    ret c

    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, c
    sub e
    ld a, b
    sbc d
    ret


jr_01b_4bdc:
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc hl
    inc hl
    jr jr_01b_4bc9

jr_01b_4be3:
    inc hl
    inc hl
    inc hl
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    dec hl
    jr jr_01b_4bca

    add sp, -$0a
    push hl
    push de
    ld de, $ffd2
    ld b, $00
    call Call_01b_4b98
    pop de
    push de
    ld bc, $002e
    call Call_01b_4c9a
    pop de
    push bc
    push de
    jr c, jr_01b_4c7e

    ld a, c
    cp $2e
    jr c, jr_01b_4c7e

    ld hl, sp+$06
    ld de, $ff46
    ld bc, $000a
    call Call_01b_4577
    pop hl
    push hl
    ld a, [hl+]
    ld d, [hl]
    ld e, a
    or d
    jr z, jr_01b_4c29

    srl d
    rr e
    jr nc, jr_01b_4c25

    inc de

jr_01b_4c25:
    ld [hl], d
    dec hl
    ld [hl], e
    inc hl

jr_01b_4c29:
    inc hl
    ld b, $04

jr_01b_4c2c:
    ld e, l
    ld d, h
    ld a, [de]
    or a
    jr z, jr_01b_4c5c

    ld hl, sp+$06
    push bc
    push de
    ld bc, $000a
    trap $67
    ld a, h
    or l
    pop de
    pop bc
    jr z, jr_01b_4c6a

    ld hl, $000b
    add hl, de
    dec b
    jr nz, jr_01b_4c2c

    pop de
    push de
    ld hl, $000d
    add hl, de
    ld e, l
    ld d, h
    ld hl, $000b
    add hl, de
    ld b, $16

jr_01b_4c56:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_01b_4c56

jr_01b_4c5c:
    ld hl, sp+$06
    push de
    ld b, $0a

jr_01b_4c61:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_01b_4c61

    xor a
    ld [de], a
    pop de

jr_01b_4c6a:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jr z, jr_01b_4c74

    inc [hl]

jr_01b_4c74:
    pop de
    pop bc
    pop hl
    push hl
    push bc
    push de
    call Call_01b_4c8b
    xor a

jr_01b_4c7e:
    pop de
    pop bc
    pop hl
    jr c, jr_01b_4c87

    add sp, $0a
    xor a
    ret


jr_01b_4c87:
    add sp, $0a
    scf
    ret


Call_01b_4c8b:
    push de
    push bc
    ld de, $ffd2
    ld b, $00
    call Call_01b_4b98
    pop bc
    pop de
    jp Jump_01b_4ca9


Call_01b_4c9a:
    push hl
    push de
    call Call_01b_4cb8
    pop hl
    push bc
    ldh [$97], a
    call Call_01b_4577
    pop bc
    pop hl
    ret


Jump_01b_4ca9:
    push hl
    push de
    call Call_01b_4cb8
    pop hl
    push bc
    ldh [$97], a
    call Call_01b_45ca
    pop bc
    pop hl
    ret


Call_01b_4cb8:
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld a, [hl]
    inc hl
    push af
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl]
    adc d
    ld d, a
    push de
    push hl
    push bc
    ld d, [hl]
    dec hl
    ld e, [hl]
    inc hl
    inc hl
    inc hl
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, c
    sub e
    ld e, a
    ld a, b
    sbc d
    ld d, a
    pop bc
    pop hl
    ld a, e
    sub c
    ld a, d
    sbc b
    jr nc, jr_01b_4ce2

    ld c, e
    ld b, d

jr_01b_4ce2:
    ld d, [hl]
    dec hl
    ld e, [hl]
    ld a, e
    add c
    ld e, a
    ld a, d
    adc b
    ld d, a
    ld [hl], e
    inc hl
    ld [hl], d
    pop de
    pop af
    ret


    push de
    push hl
    ld a, [hl+]
    or [hl]
    ld a, $ff
    jr z, jr_01b_4d4c

    ld bc, $0008
    add hl, bc
    ld c, [hl]
    inc hl
    inc hl
    ld b, [hl]
    inc hl
    ld a, l
    ld l, e
    ld e, a
    ld a, h
    ld h, d
    ld d, a
    ld a, b
    bit 4, c
    jp z, Jump_01b_4d44

    or a
    push af
    bit 3, c
    jp nz, Jump_01b_4d26

    sub $61
    add e
    ld e, a
    ld a, $00
    adc d
    ld d, a
    inc de
    ld bc, $0060
    call Call_01b_4167
    jr jr_01b_4d37

Jump_01b_4d26:
    sub $c1
    add e
    ld e, a
    ld a, $00
    adc d
    ld d, a
    inc de
    ld b, $04

jr_01b_4d31:
    call Call_01b_4d3b
    dec b
    jr nz, jr_01b_4d31

Jump_01b_4d37:
jr_01b_4d37:
    pop af
    pop hl
    pop de
    ret


Call_01b_4d3b:
    ld c, $30

jr_01b_4d3d:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_01b_4d3d

    ret


Jump_01b_4d44:
    ld c, a
    ld a, [de]
    inc de
    or a
    jr z, jr_01b_4d6f

    ld d, h
    ld e, l

jr_01b_4d4c:
    ld b, a
    ld c, $00
    ld hl, $784e

jr_01b_4d52:
    ld a, [hl+]
    cp b
    jr z, jr_01b_4d5c

    inc c
    or a
    jr nz, jr_01b_4d52

    dec c
    scf

jr_01b_4d5c:
    push af
    ld l, e
    ld h, d
    ld a, c
    add a
    add a
    ld e, a
    add a
    add e
    ld e, a
    ld d, $a2
    ld b, $0c
    trap $1b
    jp Jump_01b_4d37


jr_01b_4d6f:
    ld a, c
    dec a
    ld bc, $2020
    push bc
    push bc
    push bc
    push bc
    push bc
    push bc
    push hl
    ld c, e
    ld b, d
    ld d, a
    ld e, $00
    ld h, $00

jr_01b_4d82:
    ld a, [bc]
    inc bc
    cp $0e
    jr z, jr_01b_4da7

    cp $0f
    jr z, jr_01b_4da7

    push de
    ld e, a
    ld a, [bc]
    ld d, a
    call Call_01b_5b8d
    pop de
    jr nc, jr_01b_4d9a

    inc bc
    dec d
    jr z, jr_01b_4dc6

jr_01b_4d9a:
    cp $60
    jr c, jr_01b_4db3

    cp $b0
    jr nc, jr_01b_4da4

    add $50

jr_01b_4da4:
    sub h
    jr jr_01b_4db3

jr_01b_4da7:
    sub $0e
    jr z, jr_01b_4dad

    ld a, $50

jr_01b_4dad:
    ld h, a
    dec d
    jr z, jr_01b_4dc6

    jr jr_01b_4d82

jr_01b_4db3:
    push de
    push hl
    ld d, $00
    ld hl, sp+$06
    add hl, de
    ld [hl], a
    pop hl
    pop de
    dec d
    jr z, jr_01b_4dc6

    inc e
    ld a, e
    cp $0c
    jr nz, jr_01b_4d82

jr_01b_4dc6:
    ld hl, sp+$02
    ld e, l
    ld d, h
    pop hl
    ld b, $04

jr_01b_4dcd:
    push bc
    push de
    call Call_01b_4de4
    call Call_01b_4de4
    call Call_01b_4dee
    pop de
    pop bc
    inc de
    dec b
    jr nz, jr_01b_4dcd

    add sp, $0c
    pop hl
    pop de
    xor a
    ret


Call_01b_4de4:
    push de
    call Call_01b_4dee
    pop de
    inc de
    inc de
    inc de
    inc de
    ret


Call_01b_4dee:
    ld a, [de]
    ld e, a
    ld c, $03
    jp Jump_01b_5681


jr_01b_4df5:
    halt
    ldh a, [$89]
    ld b, a
    ld a, $c8
    sub b
    sub $12
    jr c, jr_01b_4df5

    push hl
    push bc
    add $04
    ld l, a
    add hl, hl
    add hl, hl
    ld c, $05
    call Call_01b_525a
    ld a, l
    pop bc
    pop hl
    ld b, $40
    cp b
    ret nc

    ld b, a
    ret


jr_01b_4e15:
    halt

Call_01b_4e16:
    ldh a, [$89]
    ld b, a
    ld a, $c8
    sub b
    sub $15
    jr c, jr_01b_4e15

    push hl
    push bc
    add $05
    ld l, a
    add hl, hl
    add hl, hl
    ld c, $06
    call Call_01b_525a
    ld a, l
    pop bc
    pop hl
    ld b, $40
    cp b
    ret nc

    ld b, a
    ret


jr_01b_4e35:
    halt
    ldh a, [$88]
    ld b, a
    ldh a, [$87]
    sub b
    add c
    jr c, jr_01b_4e35

    cp $f0
    jr nc, jr_01b_4e35

    ld a, c
    srl a
    srl a
    inc a
    add c
    add $12
    ld b, a
    jr jr_01b_4e50

jr_01b_4e4f:
    halt

jr_01b_4e50:
    ldh a, [$89]
    add b
    jr c, jr_01b_4e4f

    cp $c8
    jr nc, jr_01b_4e4f

    push bc
    push hl
    ldh a, [$87]
    ld l, a
    ld h, $c2
    ld [hl], $02
    inc l
    ld [hl], b
    inc l
    ld a, $40
    sub c
    ld b, a
    add a
    add b
    ld bc, $511d
    add c
    ld [hl], a
    ld a, $00
    adc b
    inc l
    ld [hl], a
    inc l
    pop bc
    ld [hl], c
    inc l
    ld [hl], b
    inc l
    pop bc
    ret


    ld a, b
    or a

jr_01b_4e7f:
    push af
    call Call_01b_4e16
    pop af
    push af
    jr nz, jr_01b_4e8b

    ld a, b
    cp c
    jr nc, jr_01b_4eab

jr_01b_4e8b:
    push bc
    push hl
    push de
    ld c, b
    ld b, $00
    push bc
    call Call_01b_4eb8
    pop bc
    pop hl
    add hl, bc
    ld e, l
    ld d, h
    pop hl
    add hl, bc
    pop bc
    pop af
    push hl
    ld l, b
    ld b, a
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc $00
    ld b, a
    pop hl
    jr jr_01b_4e7f

jr_01b_4eab:
    pop af
    call Call_01b_4eb8

Call_01b_4eaf:
jr_01b_4eaf:
    ei
    halt
    ldh a, [$89]
    or a
    jr nz, jr_01b_4eaf

    ret


jr_01b_4eb7:
    halt

Call_01b_4eb8:
    ldh a, [$88]
    ld b, a
    ldh a, [$87]
    sub b
    cp $f0
    jr nc, jr_01b_4eb7

    ld a, c
    srl a
    inc a
    add c
    add $15
    ld b, a
    jr jr_01b_4ecd

jr_01b_4ecc:
    halt

jr_01b_4ecd:
    ldh a, [$89]
    add b
    jr c, jr_01b_4ecc

    cp $c8
    jr nc, jr_01b_4ecc

    push hl
    push de
    ldh a, [$87]
    ld l, a
    ld h, $c2
    ld [hl], $03
    inc l
    ld [hl], b
    inc l
    ld a, $40
    sub c
    ld e, a
    add a
    add e
    ld de, $4fcf
    add e
    ld [hl], a
    ld a, $00
    adc d
    inc l
    ld [hl], a
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    di
    ld a, l
    ldh [$87], a
    ldh a, [$89]
    add b
    ldh [$89], a
    ei
    ret


    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, b
    ldh [$89], a
    ld a, c
    ldh [$88], a
    ret


    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, b
    ldh [$89], a
    ld a, c
    ldh [$88], a
    ret


    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld a, b
    ldh [$89], a
    ld a, c
    ldh [$88], a
    ret


    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, e
    ldh [$88], a
    ld a, b
    ldh [$89], a
    ret


Call_01b_51e4:
    ldh a, [$88]
    ld l, a
    ldh a, [$87]
    sub l
    ret z

    ldh a, [rLY]
    cp $90
    ret c

    ld e, a
    ld h, $c2
    ld c, [hl]
    inc l
    ld b, [hl]
    inc l
    ld a, $99
    sub e
    ret z

    ld e, a
    add a
    ld d, a
    add a
    add a
    ld h, a
    add a
    add h
    add d
    add e
    sub $07
    cp b
    ret c

    ld h, $c2
    ld de, $51e4
    push de
    ldh a, [$89]
    sub b
    ld b, a
    ld e, [hl]
    inc l
    ld d, [hl]
    inc l
    push de
    ld a, c
    cp $02
    jr z, jr_01b_523a

    cp $01
    jr z, jr_01b_5243

    cp $03
    jr z, jr_01b_524d

    cp $04
    jr z, jr_01b_5233

    pop af
    pop af
    xor a
    ldh [$87], a
    ldh [$88], a
    ldh [$89], a
    ret


jr_01b_5233:
    ld a, [hl]
    inc l
    ld h, [hl]
    inc l
    ld c, l
    ld l, a
    ret


jr_01b_523a:
    ld c, [hl]
    inc l
    ld a, [hl]
    inc l
    ld e, l
    ld d, h
    ld l, c
    ld h, a
    ret


jr_01b_5243:
    ld e, [hl]
    inc l
    ld d, [hl]
    inc l
    ld a, [hl]
    inc l
    ld c, l
    ld l, e
    ld h, d
    ret


jr_01b_524d:
    ld c, [hl]
    inc l
    ld a, [hl]
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    inc l
    ld h, a
    ld a, l
    ld l, c
    ld c, a
    ret


Call_01b_525a:
    ld b, $08

jr_01b_525c:
    add hl, hl
    ld a, h
    sub c
    jr c, jr_01b_5263

    ld h, a
    inc l

jr_01b_5263:
    dec b
    jr nz, jr_01b_525c

    ret


    ld a, h
    xor d
    ld h, a
    ld a, l
    xor e
    ld l, a
    ret


    ld a, h
    or d
    ld h, a
    ld a, l
    or e
    ld l, a
    ret


    ld a, h
    and d
    ld h, a
    ld a, l
    and e
    ld l, a
    ret


    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    ld l, a
    ret


    ld a, d
    xor h
    rlca
    ld a, d
    jr c, jr_01b_5295

    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    ld b, $01
    or l
    jr z, jr_01b_529c

    ld a, h

jr_01b_5295:
    ld b, $02
    rlca
    jr c, jr_01b_529c

    ld b, $04

jr_01b_529c:
    ld a, b
    ld b, $00
    ld hl, $52aa
    add hl, bc
    and [hl]
    jr z, jr_01b_52da

    ld hl, $ffff
    ret


    ld b, $06
    dec b
    dec b
    inc bc
    inc bc
    inc b
    ld [bc], a
    ld bc, $b77c
    jr nz, jr_01b_52da

    ld a, l
    cp $10
    jr nc, jr_01b_52da

    ld l, e
    ld h, d
    or a
    ret z

jr_01b_52c0:
    srl h
    rr l
    dec a
    jr nz, jr_01b_52c0

    ret


    ld a, h
    or a
    jr nz, jr_01b_52da

    ld a, l
    cp $10
    jr nc, jr_01b_52da

    ld l, e
    ld h, d
    or a
    ret z

jr_01b_52d5:
    add hl, hl
    dec a
    jr nz, jr_01b_52d5

    ret


jr_01b_52da:
    ld hl, $0000
    ret


    add hl, de
    ret


    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    ret


    ld a, h
    or l
    ret z

    ld a, d
    or e
    jr z, jr_01b_52da

    ld a, h
    xor d
    rlca
    push af
    ld a, d
    rlca
    jr nc, jr_01b_52fd

    ld a, d
    cpl
    ld d, a
    ld a, e
    cpl
    ld e, a
    inc de

jr_01b_52fd:
    ld a, h
    rlca
    jr nc, jr_01b_5308

    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    ld l, a
    inc hl

jr_01b_5308:
    ld b, h
    ld c, l
    ld hl, $0000
    ld a, $10

jr_01b_530f:
    add hl, hl
    rl c
    rl b
    jr nc, jr_01b_531d

    add hl, de
    jr nc, jr_01b_531d

    inc c
    jr nz, jr_01b_531d

    inc b

jr_01b_531d:
    dec a
    jr nz, jr_01b_530f

    jr jr_01b_5378

    ld a, h
    or l
    jr nz, jr_01b_532e

    xor a
    ld [$c3b0], a
    ld [$c3b1], a
    ret


jr_01b_532e:
    ld a, d
    xor h
    rlca
    push af
    ld a, d
    rlca
    push af
    jr nc, jr_01b_533e

    ld a, d
    cpl
    ld d, a
    ld a, e
    cpl
    ld e, a
    inc de

jr_01b_533e:
    ld a, h
    rlca
    jr nc, jr_01b_5349

    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    ld l, a
    inc hl

jr_01b_5349:
    ld b, h
    ld c, l
    ld hl, $0000
    ld a, $10

jr_01b_5350:
    push af
    sla e
    rl d
    rl l
    rl h
    ld a, l
    sub c
    ld a, h
    sbc b
    jr c, jr_01b_5364

    ld h, a
    ld a, l
    sub c
    ld l, a
    inc e

jr_01b_5364:
    pop af
    dec a
    jr nz, jr_01b_5350

    pop af
    jr nc, jr_01b_536e

    call Call_01b_537a

jr_01b_536e:
    ld a, l
    ld [$c3b0], a
    ld a, h
    ld [$c3b1], a
    ld l, e
    ld h, d

jr_01b_5378:
    pop af
    ret nc

Call_01b_537a:
jr_01b_537a:
    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    ld l, a
    inc l
    ret nz

    inc h
    ret


    bit 7, h
    ret z

    jr jr_01b_537a

    ld hl, $c3b2
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, h
    rlca
    rlca
    rlca
    xor l
    rrca
    push af
    ld a, h
    xor l
    ld h, a
    ld a, [$c3b4]
    inc a
    ld [$c3b4], a
    xor l
    ld l, a
    pop af
    rl l
    rl h
    ld a, l
    ld [$c3b2], a
    ld a, h
    ld [$c3b3], a
    xor l
    ld l, a
    ld h, $00
    ret


    ld a, l
    ld [$c3b2], a
    ld a, h
    ld [$c3b3], a
    xor a
    ld [$c3b4], a
    ret


jr_01b_53c1:
    call Call_01b_53c8
    ret c

    ld [hl+], a
    jr jr_01b_53c1

Call_01b_53c8:
    ld c, $00
    ld a, [de]
    call Call_01b_53df
    ret c

    ld c, a
    inc de
    ld a, [de]
    call Call_01b_53df
    ret c

    inc de
    ld b, a
    ld a, c
    rlca
    rlca
    rlca
    rlca
    or b
    ret


Call_01b_53df:
    or $20
    sub $30
    ret c

    cp $0a
    ccf
    ret nc

    sub $27
    cp $0a
    ret c

    cp $10
    ccf
    ret


    ld e, l
    ld d, h

jr_01b_53f3:
    ld a, [de]
    inc de
    cp $20
    jr z, jr_01b_53f3

    cp $27
    jr z, jr_01b_5425

    cp $24
    jr z, jr_01b_541d

    cp $2b
    jr z, jr_01b_540a

    cp $2d
    jr z, jr_01b_5412

    dec de

Call_01b_540a:
jr_01b_540a:
    call Call_01b_5433
    ret nc

    ld hl, $0000
    ret


jr_01b_5412:
    call Call_01b_540a
    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    ld l, a
    inc hl
    ret


jr_01b_541d:
    call Call_01b_5456
    ret nc

    ld hl, $0000
    ret


jr_01b_5425:
    ld hl, $0000

jr_01b_5428:
    ld a, [de]
    or a
    ret z

    cp $27
    ret z

    ld h, l
    ld l, a
    inc de
    jr jr_01b_5428

Call_01b_5433:
    ld hl, $0000

jr_01b_5436:
    ld a, [de]
    or a
    ret z

    cp $30
    ccf
    ret nc

    cp $3a
    ret nc

    inc de
    sub $30
    ld c, l
    ld b, h
    add hl, hl
    ret c

    add hl, hl
    ret c

    add hl, bc
    ret c

    add hl, hl
    ret c

    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    jr nc, jr_01b_5436

    ret


Call_01b_5456:
    ld hl, $0000

jr_01b_5459:
    ld a, [de]
    or a
    ret z

    sub $30
    ccf
    ret nc

    cp $0a
    jr c, jr_01b_5471

    add $30
    and $df
    sub $37
    cp $0a
    ccf
    ret nc

    cp $10
    ret nc

jr_01b_5471:
    add hl, hl
    ret c

    add hl, hl
    ret c

    add hl, hl
    ret c

    add hl, hl
    ret c

    add l
    ld l, a
    inc de
    jr jr_01b_5459

    ld [hl], $20
    inc hl
    ld a, l
    ld l, e
    ld e, a
    ld a, h
    ld h, d
    ld d, a
    ld a, $20
    bit 7, h
    jr z, jr_01b_5496

    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    ld l, a
    inc hl

Call_01b_5494:
    ld a, $2d

jr_01b_5496:
    push af
    push de
    ld bc, $d8f0
    call Call_01b_54c9
    ld bc, $fc18
    call Call_01b_54c9
    ld bc, $ff9c
    call Call_01b_54c9
    ld bc, $fff6
    call Call_01b_54c9
    ld a, l
    add $30
    ld [de], a
    inc de
    xor a
    ld [de], a
    pop hl
    ld b, $04

jr_01b_54ba:
    ld a, [hl]
    cp $30
    jr nz, jr_01b_54c5

    ld [hl], $20
    inc hl
    dec b
    jr nz, jr_01b_54ba

jr_01b_54c5:
    dec hl
    pop af
    ld [hl], a
    ret


Call_01b_54c9:
    ld a, $2f

jr_01b_54cb:
    inc a
    add hl, bc
    jr c, jr_01b_54cb

    ld [de], a
    inc de
    ld a, l
    sub c
    ld l, a
    ld a, h
    sbc b
    ld h, a
    ret


    ld [hl], $20
    inc hl
    ld a, l
    ld l, e
    ld e, a
    ld a, h
    ld h, d
    ld d, a
    ld a, $20
    bit 7, b
    jr z, jr_01b_5503

    ld a, b
    cpl
    ld b, a
    ld a, c
    cpl
    ld c, a
    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    add $01
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ld a, $00
    adc c
    ld c, a
    ld a, $00
    adc b
    ld b, a
    ld a, $2d

jr_01b_5503:
    push af
    push de
    push bc
    push hl
    push de
    ld de, $c465
    ld bc, $3600
    call Call_01b_556c
    ld de, $fa0a
    ld bc, $1f00
    call Call_01b_556c
    ld de, $ff67
    ld bc, $6980
    call Call_01b_556c
    ld de, $fff0
    ld bc, $bdc0
    call Call_01b_556c
    ld de, $fffe
    ld bc, $7960
    call Call_01b_556c
    ld de, $ffff
    ld bc, $d8f0
    call Call_01b_556c
    pop de
    pop hl
    pop bc
    ld bc, $fc18
    call Call_01b_54c9
    ld bc, $ff9c
    call Call_01b_54c9
    ld bc, $fff6
    call Call_01b_54c9
    ld a, l
    add $30
    ld [de], a
    inc de
    xor a
    ld [de], a
    pop hl
    ld b, $09

jr_01b_555d:
    ld a, [hl]
    cp $30
    jr nz, jr_01b_5568

    ld [hl], $20
    inc hl
    dec b
    jr nz, jr_01b_555d

jr_01b_5568:
    dec hl
    pop af
    ld [hl], a
    ret


Call_01b_556c:
    ld a, $2f
    push af

jr_01b_556f:
    ld hl, sp+$01
    inc [hl]
    ld hl, sp+$06
    ld a, [hl]
    add c
    ld [hl+], a
    ld a, [hl]
    adc b
    ld [hl+], a
    ld a, [hl]
    adc e
    ld [hl+], a
    ld a, [hl]
    adc d
    ld [hl], a
    jr c, jr_01b_556f

    pop af
    ld hl, sp+$02
    push de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld [de], a
    inc de
    ld [hl], d
    dec hl
    ld [hl], e
    pop de
    ld hl, sp+$04
    ld a, [hl]
    sub c
    ld [hl+], a
    ld a, [hl]
    sbc b
    ld [hl+], a
    ld a, [hl]
    sbc e
    ld [hl+], a
    ld a, [hl]
    sbc d
    ld [hl], a
    ret


    ld a, l
    ld l, e
    ld e, a
    ld a, h
    ld h, d
    ld d, a
    push de
    ld a, h
    call Call_01b_55b3
    ld a, l
    call Call_01b_55b3
    xor a
    ld [de], a
    pop hl
    inc hl
    inc hl
    ret


Call_01b_55b3:
    push af
    and $f0
    rrca
    rrca
    rrca
    rrca
    call Call_01b_55c8
    ld [de], a
    inc de
    pop af
    and $0f
    call Call_01b_55c8
    ld [de], a
    inc de
    ret


Call_01b_55c8:
    cp $0a
    jr nc, jr_01b_55cf

    add $30
    ret


jr_01b_55cf:
    add $37
    ret


    push hl
    ld a, d
    or a
    jr z, jr_01b_55d9

    ld [hl], d
    inc hl

jr_01b_55d9:
    ld [hl], e
    inc hl
    ld [hl], $00
    pop hl
    ret


Call_01b_55df:
Jump_01b_55df:
    ld a, b
    or c
    ret z

    ldh a, [$86]
    or a
    jr z, jr_01b_55ee

    ld a, h
    and $e0
    cp $80
    jr z, jr_01b_55f6

jr_01b_55ee:
    ld [hl], e
    inc hl
    dec bc
    ld a, b
    or c
    jr nz, jr_01b_55ee

    ret


jr_01b_55f6:
    ld a, b
    or a

jr_01b_55f8:
    push af
    call Call_01b_566e
    pop af
    push af
    jr nz, jr_01b_5607

    ld a, b
    cp c
    jr c, jr_01b_5607

    pop af
    jr jr_01b_5623

jr_01b_5607:
    push bc
    push hl
    ld c, b
    ld b, $00
    push bc
    call Call_01b_5623
    pop bc
    pop hl
    add hl, bc
    pop bc
    pop af
    push hl
    ld l, b
    ld b, a
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc $00
    ld b, a
    pop hl
    jr jr_01b_55f8

jr_01b_5622:
    halt

Call_01b_5623:
jr_01b_5623:
    ldh a, [$88]
    ld b, a
    ldh a, [$87]
    sub b
    cp $f0
    jr nc, jr_01b_5622

    ld a, c
    srl a
    inc a
    add $13
    ld b, a
    jr jr_01b_5637

jr_01b_5636:
    halt

jr_01b_5637:
    ldh a, [$89]
    add b
    jr c, jr_01b_5636

    cp $c8
    jr nc, jr_01b_5636

    push de
    push hl
    ldh a, [$87]
    ld l, a
    ld h, $c2
    ld [hl], $01
    inc l
    ld [hl], b
    inc l
    ld a, $80
    sub c
    ld de, $5096
    add e
    ld [hl], a
    ld a, $00
    adc d
    inc l
    ld [hl], a
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    di
    ld a, l
    ldh [$87], a
    ldh a, [$89]
    add b
    ldh [$89], a
    ei
    ret


jr_01b_566d:
    halt

Call_01b_566e:
    ldh a, [$89]
    ld b, a
    ld a, $c8
    sub b
    sub $13
    jr c, jr_01b_566d

    ld b, $80
    inc a
    add a
    ret c

    cp b
    ret nc

    ld b, a
    ret


Call_01b_5681:
Jump_01b_5681:
    push bc
    push de
    push hl
    ld l, e
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld de, $6f8e
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld b, $08

jr_01b_5693:
    ld a, $ff
    bit 4, c
    jr nz, jr_01b_56a1

    inc a
    bit 0, c
    jr z, jr_01b_56a7

    ld a, [de]
    jr jr_01b_56a7

jr_01b_56a1:
    bit 0, c
    jr nz, jr_01b_56a7

    ld a, [de]
    cpl

jr_01b_56a7:
    ld [hl+], a
    ld a, $ff
    bit 5, c
    jr nz, jr_01b_56b6

    inc a
    bit 1, c
    jr z, jr_01b_56bc

    ld a, [de]
    jr jr_01b_56bc

jr_01b_56b6:
    bit 0, c
    jr nz, jr_01b_56bc

    ld a, [de]
    cpl

jr_01b_56bc:
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_01b_5693

    pop de
    pop bc
    ret


    push bc
    push hl
    push de
    ld d, c
    push de
    push af
    ld l, b
    ld h, $00
    ld d, h
    ld e, c
    trap $89
    ld b, l
    pop af
    call Call_01b_5730
    jp c, Jump_01b_5715

    ldh [$a1], a
    ld e, l
    ld d, h
    ldh a, [rLCDC]
    and $04
    rrca
    rrca
    inc a
    ld c, a

jr_01b_56e5:
    ld hl, sp+$02
    ld a, [hl]
    ld [de], a
    ld a, c
    add a
    add a
    add a
    add [hl]
    ld [hl+], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    inc de
    add c
    ld [hl+], a
    ld a, [hl+]
    ld [de], a
    inc de
    dec [hl]
    ld a, [hl]
    or a
    jr nz, jr_01b_56e5

    push hl
    ld hl, sp+$02
    ld a, [hl+]
    ld b, [hl]
    ld hl, sp+$04
    ld [hl], a
    inc hl
    ld a, [hl]
    add $08
    ld [hl], a
    pop hl
    ld a, b
    ld [hl+], a
    dec [hl]
    ld a, [hl]
    or a
    jr nz, jr_01b_56e5

Jump_01b_5715:
    pop de
    pop de
    pop hl
    pop bc
    ldh a, [$a1]
    ret


    call Call_01b_5730
    jr c, jr_01b_572d

jr_01b_5721:
    ld a, [hl]
    add e
    ld [hl+], a
    ld a, [hl]
    add d
    ld [hl+], a
    inc hl
    inc hl
    dec b
    jr nz, jr_01b_5721

    or a

jr_01b_572d:
    ldh a, [$a1]
    ret


Call_01b_5730:
    cp $ff
    jr nz, jr_01b_5736

    ldh a, [$a1]

jr_01b_5736:
    ld l, a
    add b
    cp $41
    ccf
    ret c

    push af
    ld a, l
    add a
    add a
    ld hl, $c300
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    pop af
    ret


    push af
    push bc
    push de
    push hl
    di
    call Call_01b_5ff2
    ld hl, $9800
    call Call_01b_58f8
    xor a
    ldh [$8e], a
    ldh [$8f], a
    call Call_01b_58e1
    call Call_01b_5831
    call Call_01b_5843
    call Call_01b_58c1
    call Call_01b_60e2
    ldh a, [rIE]
    or $01
    ldh [rIE], a
    ei
    pop hl
    pop de
    pop bc
    pop af
    push af
    and $cc
    or $03
    call Call_01b_5798
    xor a
    call $66aa
    pop af
    and $20
    ret nz

    ld a, $07
    or $80
    ldh [$86], a
    ldh [rLCDC], a
    xor a
    ldh [rBGP], a
    ldh [rOBP0], a
    ldh [rOBP1], a
    ret


Call_01b_5798:
    bit 7, a
    jr nz, jr_01b_57cb

    ld a, $03
    ldh [$92], a
    ld e, $20
    call Call_01b_5850
    ld hl, $8800
    ld e, $80
    ld bc, $0003

jr_01b_57ad:
    push bc
    push de
    push hl
    ld hl, $c3e0
    push hl
    call Call_01b_5681
    pop de
    pop hl
    push hl
    ld bc, $0010
    trap $02
    pop hl
    ld bc, $0010
    add hl, bc
    pop de
    pop bc
    inc e
    dec b
    jr nz, jr_01b_57ad

    ret


jr_01b_57cb:
    bit 2, a
    jr nz, jr_01b_57d1

    ld h, $04

jr_01b_57d1:
    push af
    push bc
    push de
    push hl
    push bc
    push de
    and $83
    or $08
    ldh [$92], a
    ld e, $7f
    call Call_01b_5850
    pop de
    pop bc
    ld a, $80
    call Call_01b_5c54
    pop bc
    push bc
    call Call_01b_5d7b
    pop hl
    pop de
    pop bc
    pop af
    bit 6, a
    jr z, jr_01b_5801

    push hl
    dec b
    dec c
    inc d
    inc d
    inc e
    inc e
    call Call_01b_5cb6
    pop hl

jr_01b_5801:
    call Call_01b_5859
    ld a, [$c3bb]
    add $80
    cp $b5
    ret nc

    ld hl, $9340
    ld e, $21
    ld bc, $3f03

jr_01b_5814:
    push bc
    push de
    push hl
    ld hl, $c3e0
    push hl
    call Call_01b_5681
    pop de
    pop hl
    push hl
    ld bc, $0010
    push bc
    trap $02
    pop bc
    pop hl
    add hl, bc
    pop de
    pop bc
    inc e
    dec b
    jr nz, jr_01b_5814

    ret


Call_01b_5831:
    xor a
    ldh [rSCY], a
    ldh [rSCX], a
    ldh [rWY], a
    ldh [rWX], a
    ldh [$9a], a
    ldh [$9b], a
    ldh [$9f], a
    ldh [$a0], a
    ret


Call_01b_5843:
    ld a, $e4
    ldh [$9c], a
    ld a, $d8
    ldh [$9d], a
    ld a, $9c
    ldh [$9e], a
    ret


Call_01b_5850:
    ld hl, $9800
    ld bc, $0800
    jp Jump_01b_55df


Call_01b_5859:
    ld a, h
    or a
    jr z, jr_01b_589c

    cp $02
    jr z, jr_01b_58a8

    cp $04
    jr z, jr_01b_5891

    ld b, h
    ld c, l
    ld hl, $9730
    call Call_01b_67aa
    call Call_01b_67f8
    call Call_01b_6846
    call Call_01b_6857
    call Call_01b_6868
    call Call_01b_6890
    call Call_01b_68b8
    call Call_01b_68db
    call Call_01b_6903
    call Call_01b_692b
    call Call_01b_694e
    call Call_01b_697a
    jp Jump_01b_69a6


jr_01b_5891:
    ld hl, $9730
    ld de, $778e
    ld bc, $00c0
    trap $02

jr_01b_589c:
    ld hl, $97f0
    ld e, $00
    ld bc, $0010
    call Call_01b_55df
    ret


jr_01b_58a8:
    ld hl, $97c0
    ld de, $781e
    ld bc, $0010
    trap $02
    ld hl, $97d0
    ld bc, $0000
    call Call_01b_694e
    call Call_01b_697a
    jr jr_01b_589c

Call_01b_58c1:
    ld bc, $2800
    ld a, c
    ldh [$a1], a
    call Call_01b_5730
    xor a

jr_01b_58cb:
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec b
    jr nz, jr_01b_58cb

    ret


    ldh a, [rLCDC]
    and $80
    ret z

    ei
    call Call_01b_4eaf
    call Call_01b_58e1
    ei
    ret


Call_01b_58e1:
    di
    ldh a, [rLCDC]
    and $80
    jr z, jr_01b_58f4

jr_01b_58e8:
    ldh a, [rLY]
    cp $91
    jr nz, jr_01b_58e8

    ldh a, [rLCDC]
    and $7f
    ldh [rLCDC], a

jr_01b_58f4:
    xor a
    ldh [$86], a
    ret


Call_01b_58f8:
    ld a, l
    ld [$c3c8], a
    ld a, h
    ld [$c3c9], a
    ret


    ldh a, [$92]
    bit 3, a
    jr nz, jr_01b_590e

    ld a, h
    ldh [$8e], a
    ld a, l
    ldh [$8f], a
    ret


jr_01b_590e:
    ld a, l
    add a
    add a
    add a
    add l
    ld l, a
    ld a, h
    ldh [$90], a
    ld a, l
    ldh [$91], a
    ret


    push bc
    ld c, a
    ldh a, [$92]
    bit 3, a
    ldh a, [$90]
    jr nz, jr_01b_5927

    ldh a, [$8e]

jr_01b_5927:
    ld b, a
    ld a, c
    sub b
    jr c, jr_01b_5937

    jr z, jr_01b_5937

    ld b, a

jr_01b_592f:
    ld a, $20
    call Call_01b_593a
    dec b
    jr nz, jr_01b_592f

jr_01b_5937:
    xor a
    pop bc
    ret


Call_01b_593a:
    push bc
    push de
    push hl
    ld e, a
    ldh a, [$92]
    bit 3, a
    jr nz, jr_01b_594e

    call Call_01b_5970
    call Call_01b_5b39
    pop hl
    pop de
    pop bc
    ret


jr_01b_594e:
    call Call_01b_597f
    call Call_01b_5b6b
    pop hl
    pop de
    pop bc
    ret


Call_01b_5958:
Jump_01b_5958:
    push bc
    push de
    push hl
    ld e, a
    ldh a, [$92]
    bit 3, a
    jr nz, jr_01b_5969

    call Call_01b_5970
    pop hl
    pop de
    pop bc
    ret


jr_01b_5969:
    call Call_01b_597f
    pop hl
    pop de
    pop bc
    ret


Call_01b_5970:
    ldh a, [$8e]
    ld h, a
    ldh a, [$8f]
    ld l, a
    call Call_01b_59dc
    ld bc, $0001
    jp Jump_01b_55df


Call_01b_597f:
    ld c, a
    ld hl, $c3e0
    push hl
    call Call_01b_5681
    pop hl
    push hl
    ldh a, [$90]
    ld h, a
    ldh a, [$91]
    ld l, a
    call Call_01b_5999
    pop de
    ld bc, $0010
    trap $02
    ret


Call_01b_5999:
    push de
    push bc
    ld a, l
    ld c, h
    push af
    ld b, $05
    ld hl, $c3bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl

jr_01b_59a7:
    rr c
    jr nc, jr_01b_59b3

    ld a, e
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    dec hl

jr_01b_59b3:
    inc hl
    inc hl
    dec b
    jr nz, jr_01b_59a7

    pop af
    pop bc
    ld l, a
    ld h, $00
    add hl, hl
    add hl, de
    pop de
    ret


    push af
    push bc
    push de
    push hl
    ld h, d
    ld l, e
    ld e, a
    call Call_01b_59dc
    ld bc, $0001
    call Call_01b_55df
    pop hl
    pop de
    pop bc
    ld a, d
    add b
    ld d, a
    ld a, e
    add c
    ld e, a
    pop af
    ret


Call_01b_59dc:
    ld a, h
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ld a, [$c3c8]
    add l
    ld l, a
    ld a, [$c3c9]
    adc h
    ld h, a
    ret


Call_01b_59f5:
    push bc
    push de
    push hl
    call Call_01b_59ff
    pop hl
    pop de
    pop bc
    ret


Call_01b_59ff:
    ld hl, $ff92
    bit 7, [hl]
    jr z, jr_01b_5a15

    bit 3, [hl]
    jr z, jr_01b_5a19

    ld de, $5a5c
    ld bc, $ff90
    cp $18
    jr c, jr_01b_5a23

    ret


jr_01b_5a15:
    cp $07
    jr z, jr_01b_5a3d

jr_01b_5a19:
    ld de, $5a3e
    ld bc, $ff8e
    cp $10
    jr nc, jr_01b_5a3d

jr_01b_5a23:
    sub $01
    jr c, jr_01b_5a3d

    cp $0d
    push af
    add a
    add e
    ld l, a
    ld a, $00
    adc d
    ld h, a
    ld a, [hl+]
    ld d, [hl]
    ld e, a
    pop af
    push de
    ld l, c
    ld h, b
    jr c, jr_01b_5a3d

    ld hl, $ff92

jr_01b_5a3d:
    ret


    inc a
    ld e, e
    ld c, h
    ld e, e
    ld b, e
    ld e, e
    ld e, l
    ld e, e
    ret nc

    ld e, d
    adc d
    ld e, d
    sub b
    ld e, d
    add hl, bc
    ld e, e
    and $5a
    dec a
    ld e, d
    dec [hl]
    ld e, e
    ld de, $415b
    ld e, e
    sub [hl]
    ld e, d
    sbc c
    ld e, d
    ld l, [hl]
    ld e, e
    ld a, l
    ld e, e
    ld [hl], a
    ld e, e
    add [hl]
    ld e, e
    dec a
    ld e, d
    adc d
    ld e, d
    sub b
    ld e, d
    ld h, e
    ld e, e
    dec a
    ld e, d
    dec a
    ld e, d
    dec [hl]
    ld e, e
    ld a, b
    ld e, l
    ld [hl], l
    ld e, e
    sub [hl]
    ld e, d
    sbc c
    ld e, d
    sbc h
    ld e, d
    and c
    ld e, d
    xor b
    ld e, d
    xor a
    ld e, d
    or [hl]
    ld e, d
    cp e
    ld e, d
    jp nz, $c95a

    ld e, d
    ld hl, $ff92
    res 3, [hl]
    ret


    ld hl, $ff92
    set 3, [hl]
    ret


    res 2, [hl]
    ret


    set 2, [hl]
    ret


    ld a, [hl]
    and $fc
    ld [hl], a
    ret


    ld a, [hl]
    and $fc
    or $01
    ld [hl], a
    ret


    ld a, [hl]
    and $fc
    or $02
    ld [hl], a
    ret


    ld a, [hl]
    and $fc
    or $03
    ld [hl], a
    ret


    ld a, [hl]
    and $cf
    ld [hl], a
    ret


    ld a, [hl]
    and $cf
    or $10
    ld [hl], a
    ret


    ld a, [hl]
    and $cf
    or $20
    ld [hl], a
    ret


    ld a, [hl]
    and $cf
    or $30
    ld [hl], a
    ret


    push bc
    push de
    ld e, $20
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld a, $14
    sub h
    ld c, a
    ld b, $00
    call Call_01b_59dc
    call Call_01b_55df
    pop de
    pop bc
    ret


    push bc
    push de
    ld e, $20
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    and $03
    ld d, a
    ld a, $04
    sub d
    ld c, a
    ld b, $00
    push af
    call Call_01b_59dc
    call Call_01b_55df
    pop af
    ld hl, $ff8e
    add [hl]
    ld [hl], a
    call Call_01b_5b3e
    pop de
    pop bc
    ret


    call Call_01b_5b4c
    ld a, $20
    jp Jump_01b_5958


    push bc
    push de
    ld a, [$c3c8]
    ld l, a
    ld a, [$c3c9]
    ld h, a
    ld e, $20
    ld d, $12

jr_01b_5b1f:
    push de
    push hl
    ld bc, $0014
    call Call_01b_55df
    pop hl
    pop de
    ld bc, $0020
    add hl, bc
    dec d
    jr nz, jr_01b_5b1f

    pop de
    pop bc
    ld hl, $ff8e
    xor a
    ld [hl+], a
    ld [hl], a
    ret


Call_01b_5b39:
    ld hl, $ff8e
    inc [hl]
    ld a, [hl]

Call_01b_5b3e:
    cp $14
    ret c

    ld [hl], $00
    inc hl
    inc [hl]
    ld a, [hl]
    cp $12
    ret c

    ld [hl], $00
    ret


Call_01b_5b4c:
    ld a, [hl]
    dec [hl]
    or a
    jr nz, jr_01b_5b5c

    ld [hl], $13
    inc hl
    ld a, [hl]
    dec [hl]
    or a
    jr nz, jr_01b_5b5b

    ld [hl], $11

jr_01b_5b5b:
    dec hl

jr_01b_5b5c:
    ret


    inc hl
    ld a, [hl]
    or a
    ret z

    dec [hl]
    ret


    call Call_01b_5b7d
    ld a, $20
    jp Jump_01b_5958


Call_01b_5b6b:
    ld hl, $ff90
    inc [hl]
    ld a, [$c3b9]
    dec a
    cp [hl]
    ret nc

    ld [hl], $00
    inc hl
    ld a, [hl]
    add $09
    ld [hl], a
    ret


Call_01b_5b7d:
    ld a, [hl]
    dec [hl]
    or a
    ret nz

    ld a, [$c3b9]
    dec a
    ld [hl], a
    inc hl
    ld a, [hl]
    sub $09
    ret c

    ld [hl], a
    ret


Call_01b_5b8d:
    ldh a, [$92]
    bit 6, a
    jr nz, jr_01b_5bb4

    bit 7, a
    jr z, jr_01b_5bca

    bit 3, a
    jr nz, jr_01b_5bb7

    ld a, e
    cp $21
    jr c, jr_01b_5bb0

    cp $7b
    jr nc, jr_01b_5bb0

    cp $60
    jr z, jr_01b_5bb0

    jr c, jr_01b_5bac

    sub $20

jr_01b_5bac:
    add $13
    or a
    ret


jr_01b_5bb0:
    ld a, $7f
    or a
    ret


jr_01b_5bb4:
    ld a, e
    or a
    ret


jr_01b_5bb7:
    ld a, e
    cp $80
    jr c, jr_01b_5bca

    cp $a0
    jr c, jr_01b_5bc4

    cp $e0
    jr c, jr_01b_5bca

jr_01b_5bc4:
    ld a, d
    or a
    ret z

    xor a
    scf
    ret


jr_01b_5bca:
    ld a, e
    cp $20
    jr c, jr_01b_5c3d

    cp $60
    jr c, jr_01b_5c4f

    cp $80
    jr c, jr_01b_5c51

    cp $a1
    jr z, jr_01b_5c41

    cp $a2
    jr z, jr_01b_5c4a

    cp $a3
    jr z, jr_01b_5c47

    cp $a4
    jr z, jr_01b_5c44

    cp $a5
    jr z, jr_01b_5c41

    cp $a6
    jr z, jr_01b_5c2b

    cp $b0
    jr z, jr_01b_5c4d

    jr c, jr_01b_5c2f

    cp $b6
    jr c, jr_01b_5c31

    cp $c5
    jr c, jr_01b_5c23

    cp $ca
    jr c, jr_01b_5c31

    cp $de
    jr z, jr_01b_5c3d

    cp $df
    jr z, jr_01b_5c3d

    cp $cf
    jr nc, jr_01b_5c31

    ld a, d
    cp $de
    jr z, jr_01b_5c1b

    cp $df
    jr nz, jr_01b_5c28

jr_01b_5c16:
    ld a, e
    add $28
    jr jr_01b_5c1e

jr_01b_5c1b:
    ld a, e
    add $23

jr_01b_5c1e:
    call Call_01b_5c31
    scf
    ret


jr_01b_5c23:
    ld a, d
    cp $de
    jr z, jr_01b_5c16

jr_01b_5c28:
    ld a, e
    jr jr_01b_5c31

jr_01b_5c2b:
    ld a, $b0
    jr jr_01b_5c31

jr_01b_5c2f:
    add $50

Call_01b_5c31:
jr_01b_5c31:
    push hl
    ld hl, $ff92
    or a
    bit 2, [hl]
    pop hl
    ret z

    sub $50
    ret


jr_01b_5c3d:
    ld a, $20
    or a
    ret


jr_01b_5c41:
    ld a, $2e
    ret


jr_01b_5c44:
    ld a, $2c
    ret


jr_01b_5c47:
    ld a, $1d
    ret


jr_01b_5c4a:
    ld a, $1b
    ret


jr_01b_5c4d:
    ld a, $2d

jr_01b_5c4f:
    or a
    ret


jr_01b_5c51:
    and $1f
    ret


Call_01b_5c54:
    ld hl, $c3b5
    ld [hl+], a
    ld [hl], d
    inc hl
    ld [hl], c
    inc hl
    ld [hl], b
    inc hl
    ld [hl], e
    inc hl
    ld [hl], d
    ld h, c
    ld l, b
    call Call_01b_59dc
    ld a, [$c3b5]
    ld c, a

jr_01b_5c6a:
    push hl
    ld b, d

jr_01b_5c6c:
    ld [hl], c
    inc c
    ld a, $20
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    dec b
    jr nz, jr_01b_5c6c

    pop hl
    inc hl
    dec e
    jr nz, jr_01b_5c6a

    ld a, c
    ld [$c3bb], a
    ld a, [$c3b5]
    call Call_01b_5ca9
    ld [$c3bd], a
    ld a, l
    ld [$c3bc], a
    ld a, [$c3b6]
    add a
    add a
    add a
    ld e, a
    ld d, $00
    ld b, $05
    ld hl, $c3be

jr_01b_5c9d:
    sla e
    rl d
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    dec b
    jr nz, jr_01b_5c9d

    ret


Call_01b_5ca9:
    sub $80
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld a, $88
    add h
    ret


Call_01b_5cb6:
    ld a, e
    cp $03
    ret c

    ld a, d
    cp $03
    ret c

    push hl
    ld h, c
    ld l, b
    call Call_01b_59dc
    pop bc
    push bc
    push de
    push hl
    ld hl, $c3e0
    ld d, b
    ld c, e
    ld b, e
    ld a, $77
    call Call_01b_5d55
    ld [hl+], a
    dec b
    dec b
    ld a, $79
    call Call_01b_5d55

jr_01b_5cdb:
    ld [hl+], a
    dec b
    jr nz, jr_01b_5cdb

    ld a, $78
    call Call_01b_5d55
    ld [hl+], a
    pop hl
    push hl
    ld de, $c3e0
    trap $02
    pop hl
    pop de
    pop bc
    ld a, $20
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    push bc
    ld a, $75
    call Call_01b_5d55
    ld b, a
    ld a, $76
    call Call_01b_5d55
    ld c, a
    dec d
    dec d

jr_01b_5d06:
    push bc
    push hl
    push de
    push hl
    ld e, b
    push bc
    ld bc, $0001
    call Call_01b_55df
    pop bc
    pop hl
    pop de
    push de
    dec e
    ld d, $00
    add hl, de
    ld e, c
    ld bc, $0001
    call Call_01b_55df
    pop de
    pop hl
    pop bc
    ld a, $20
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    dec d
    jr nz, jr_01b_5d06

    pop bc
    push hl
    ld d, b
    ld hl, $c3e0
    ld c, e
    ld b, e
    ld a, $7a
    call Call_01b_5d55
    ld [hl+], a
    dec b
    dec b
    ld a, $7c
    call Call_01b_5d55

jr_01b_5d44:
    ld [hl+], a
    dec b
    jr nz, jr_01b_5d44

    ld a, $7b
    call Call_01b_5d55
    ld [hl+], a
    pop hl
    ld de, $c3e0
    trap $02
    ret


Call_01b_5d55:
    push hl
    ld l, a
    ld a, [$c3bb]
    cp $7c
    jr z, jr_01b_5d67

    cp $7f
    jr nz, jr_01b_5d64

jr_01b_5d62:
    ld l, $7f

jr_01b_5d64:
    ld a, l
    pop hl
    ret


jr_01b_5d67:
    ld a, l
    cp $75
    jr c, jr_01b_5d74

    cp $77
    jr c, jr_01b_5d62

    cp $7c
    jr nc, jr_01b_5d64

jr_01b_5d74:
    ld l, $7c
    jr jr_01b_5d64

    ldh a, [$92]
    ld b, a

Call_01b_5d7b:
    ld a, b
    and $30
    ld e, a
    jr z, jr_01b_5dc1

    dec e
    cp $30
    jr z, jr_01b_5dc1

    add sp, -$10
    ld hl, sp+$00
    call Call_01b_69df
    ld e, l
    ld d, h
    ld hl, sp+$00
    ld b, $0e
    call Call_01b_69c9
    xor a
    ldh [$90], a
    ldh [$91], a
    ld a, [$c3bc]
    ld l, a
    ld a, [$c3bd]
    ld h, a
    ld a, [$c3bb]
    add $80
    ld b, a

jr_01b_5da9:
    push bc
    push hl
    push hl
    ld hl, sp+$06
    ld e, l
    ld d, h
    pop hl
    ld bc, $0010
    push bc
    trap $02
    pop bc
    pop hl
    add hl, bc
    pop bc
    dec b
    jr nz, jr_01b_5da9

    add sp, $10
    ret


jr_01b_5dc1:
    push de
    xor a
    ldh [$90], a
    ldh [$91], a
    ld a, [$c3bc]
    ld e, a
    ld a, [$c3bd]
    ld d, a
    ld a, [$c3bb]
    call Call_01b_5ca9
    ld h, a
    ld a, l
    sub e
    ld c, a
    ld a, h
    sbc d
    ld b, a
    ld l, e
    ld h, d
    pop de
    jp Jump_01b_55df


    push hl
    ld l, e
    ld h, d
    call Call_01b_5999
    pop de
    sla c

jr_01b_5deb:
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
    ld a, [$c3be]
    add l
    ld l, a
    ld a, [$c3bf]
    adc h
    ld h, a
    pop bc
    dec b
    jr nz, jr_01b_5deb

    ret


    push hl
    ld l, e
    ld h, d
    call Call_01b_5999
    ld e, l
    ld d, h
    pop hl
    sla c

jr_01b_5e13:
    push bc
    push de
    push hl
    ld b, $00
    push bc
    trap $02
    pop bc
    pop hl
    add hl, bc
    pop de
    ld a, [$c3be]
    add e
    ld e, a
    ld a, [$c3bf]
    adc d
    ld d, a
    pop bc
    dec b
    jr nz, jr_01b_5e13

    ret


    push hl
    push af
    push bc
    push de
    ld hl, sp+$00
    call Call_01b_5f2e

jr_01b_5e37:
    call Call_01b_60c5
    call Call_01b_618c
    or a
    jr z, jr_01b_5e37

    ld c, a
    and $0f
    jr nz, jr_01b_5e80

    ld a, c
    bit 4, a
    jr nz, jr_01b_5e71

    bit 5, a
    jr nz, jr_01b_5e68

    bit 6, a
    jr nz, jr_01b_5e5f

    bit 7, a
    jr z, jr_01b_5e37

    push bc
    call Call_01b_5f2e
    call Call_01b_5f0b
    jr jr_01b_5e78

jr_01b_5e5f:
    push bc
    call Call_01b_5f2e
    call Call_01b_5eea
    jr jr_01b_5e78

jr_01b_5e68:
    push bc
    call Call_01b_5f2e
    call Call_01b_5ec3
    jr jr_01b_5e78

jr_01b_5e71:
    push bc
    call Call_01b_5f2e
    call Call_01b_5e96

jr_01b_5e78:
    push af
    call Call_01b_5f2e
    pop af
    pop bc
    jr nc, jr_01b_5e37

jr_01b_5e80:
    ld hl, sp+$07
    ld b, [hl]
    ld a, b
    and c
    jr nz, jr_01b_5e8b

    ld hl, sp+$00
    jr jr_01b_5e37

jr_01b_5e8b:
    ld [hl], c
    ld hl, sp+$00
    call Call_01b_5f2e
    pop de
    pop bc
    pop af
    pop hl
    ret


Call_01b_5e96:
    push hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    inc hl
    ld a, [hl+]
    ld b, a
    and $0f
    ld c, a
    srl b
    srl b
    srl b
    srl b
    inc hl
    ld a, [hl+]
    inc a
    cp [hl]
    jr nc, jr_01b_5ec0

jr_01b_5eaf:
    sub b
    jr z, jr_01b_5ec0

    jr nc, jr_01b_5eaf

    dec hl
    inc [hl]
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, d
    add c
    ld [hl], a

jr_01b_5ebd:
    pop hl
    or a
    ret


jr_01b_5ec0:
    pop hl
    scf

Jump_01b_5ec2:
    ret


Call_01b_5ec3:
    push hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    inc hl
    ld a, [hl+]
    ld b, a
    and $0f
    ld c, a
    srl b
    srl b
    srl b
    srl b
    inc hl
    ld a, [hl]
    or a
    jr z, jr_01b_5ec0

jr_01b_5edb:
    sub b
    jr z, jr_01b_5ec0

    jr nc, jr_01b_5edb

    dec [hl]
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, d
    sub c
    ld [hl], a
    jr jr_01b_5ebd

Call_01b_5eea:
    push hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    srl b
    srl b
    srl b
    srl b
    inc hl
    inc hl
    ld a, [hl]
    sub b
    jr c, jr_01b_5ec0

    ld [hl], a
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, e
    sub c
    ld [hl], a
    jr jr_01b_5ebd

Call_01b_5f0b:
    push hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    srl b
    srl b
    srl b
    srl b
    inc hl
    inc hl
    ld a, [hl+]
    add b
    cp [hl]
    jr nc, jr_01b_5ec0

    dec hl
    ld [hl], a
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, e
    add c
    ld [hl], a
    jr jr_01b_5ebd

Call_01b_5f2e:
    push hl
    ld a, [hl+]
    ld d, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld l, a
    ld h, d
    ld a, b
    and $0f
    ld b, a
    call Call_01b_5999
    sla c
    ld a, [$c3be]
    ld e, a
    ld a, [$c3bf]
    ld d, a

jr_01b_5f48:
    push bc
    push de
    push hl
    ld b, $00
    call Call_01b_5f79
    pop hl
    pop de
    pop bc
    add hl, de
    dec b
    jr nz, jr_01b_5f48

    pop hl
    ret


jr_01b_5f59:
    halt

Call_01b_5f5a:
    ldh a, [$89]
    ld b, a
    ld a, $c8
    sub b
    sub $14
    jr c, jr_01b_5f59

    push hl
    push bc
    add $04
    ld l, a
    add hl, hl
    add hl, hl
    ld c, $05
    call Call_01b_525a
    ld a, l
    pop bc
    pop hl
    ld b, $40
    cp b
    ret nc

    ld b, a
    ret


Call_01b_5f79:
    ld a, b
    or a

jr_01b_5f7b:
    push af
    call Call_01b_5f5a
    pop af
    push af
    jr nz, jr_01b_5f8a

    ld a, b
    cp c
    jr c, jr_01b_5f8a

    pop af
    jr jr_01b_5fa6

jr_01b_5f8a:
    push bc
    push hl
    ld c, b
    ld b, $00
    push bc
    call Call_01b_5fa6
    pop bc
    pop hl
    add hl, bc
    pop bc
    pop af
    push hl
    ld l, b
    ld b, a
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc $00
    ld b, a
    pop hl
    jr jr_01b_5f7b

jr_01b_5fa5:
    halt

Call_01b_5fa6:
jr_01b_5fa6:
    ldh a, [$88]
    ld b, a
    ldh a, [$87]
    sub b
    cp $f0
    jr nc, jr_01b_5fa5

    ld a, c
    srl a
    srl a
    inc a
    add c
    add $14
    ld b, a
    jr jr_01b_5fbd

jr_01b_5fbc:
    halt

jr_01b_5fbd:
    ldh a, [$89]
    add b
    jr c, jr_01b_5fbc

    cp $c8
    jr nc, jr_01b_5fbc

    push hl
    ldh a, [$87]
    ld l, a
    ld h, $c2
    ld [hl], $04
    inc l
    ld [hl], b
    inc l
    ld a, $40
    sub c
    ld d, a
    add a
    add d
    ld de, $4f08
    add e
    ld [hl], a
    ld a, $00
    adc d
    inc l
    ld [hl], a
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    di
    ld a, l
    ldh [$87], a
    ldh a, [$89]
    add b
    ldh [$89], a
    ei
    ret


Call_01b_5ff2:
    di
    ld de, $6036
    ld hl, $c000
    ld bc, $001c
    trap $02
    ld a, [$000f]
    ld [$c00b], a
    ld de, $6052
    ld hl, $fff5
    ld bc, $000a
    trap $02
    xor a
    ldh [$82], a
    ldh [$83], a
    ldh [$84], a
    ldh [$85], a
    ldh [$86], a
    ldh [$87], a
    ldh [$88], a
    ldh [$89], a
    ldh [$8b], a
    ldh [$8c], a
    ldh [$8d], a
    ldh [$93], a
    ldh [$94], a
    ldh [$95], a
    ldh [$96], a
    cpl
    ldh [$8a], a
    ldh [$98], a
    ldh [$99], a
    ret


    jp Jump_000_0053


    reti


    nop
    nop
    push af
    ldh a, [$80]
    push af
    ld a, $03
    ldh [$80], a
    ld [$2000], a
    call Call_01b_6068
    pop af
    ldh [$80], a
    ld [$2000], a
    pop af
    reti


    ld a, $c3
    ldh [rDMA], a
    ld a, $28

jr_01b_6058:
    dec a
    jr nz, jr_01b_6058

    ret


    ld a, l
    and h
    ld l, a
    ldh a, [$99]
    cpl
    or h
    cpl
    or l
    ldh [$99], a
    ret


Call_01b_6068:
    push bc
    push de
    push hl
    ldh a, [rLY]
    cp $90
    jr c, jr_01b_608f

    ld hl, $ff9a
    ld a, [hl+]
    ldh [rSCY], a
    ld a, [hl+]
    ldh [rSCX], a
    ld de, $ff47
    ld b, $05

jr_01b_607f:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_01b_607f

    ldh a, [$99]
    bit 0, a
    call nz, $fff5
    call Call_01b_51e4

jr_01b_608f:
    ldh a, [$99]
    bit 1, a
    call nz, Call_01b_60fa
    ldh a, [rIE]
    bit 2, a
    call z, Call_000_0053
    ld hl, $ff83
    inc [hl]
    ld hl, $ff84
    inc [hl]
    ldh a, [$99]
    bit 3, a
    call z, Call_01b_60b4
    ld a, $01
    ldh [$82], a
    pop hl
    pop de
    pop bc
    ret


Call_01b_60b4:
    ld a, $3b
    cp [hl]
    ret nc

    ld [hl], $00
    inc hl
    inc [hl]
    ld a, $3b
    cp [hl]
    ret nc

    ld [hl], $00
    jp Jump_01b_61cc


Call_01b_60c5:
    xor a
    ldh [$82], a
    ei

jr_01b_60c9:
    halt
    ldh a, [$82]
    dec a
    jr nz, jr_01b_60c9

    ldh [$82], a
    ret


    push bc
    ld b, a

jr_01b_60d4:
    call Call_01b_60c5
    call Call_01b_618c
    or a
    jr nz, jr_01b_60e0

    dec b
    jr nz, jr_01b_60d4

jr_01b_60e0:
    pop bc
    ret


Call_01b_60e2:
    push bc
    push de
    push hl
    xor a
    ldh [$8c], a
    ldh [$8d], a
    ldh [$8b], a
    ldh [$b6], a
    cpl
    ldh [$8a], a
    ldh [$b5], a
    call Call_01b_60fa
    pop hl
    pop de
    pop bc
    ret


Call_01b_60fa:
    ld a, $20
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    swap a
    ld b, a
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    or b
    ld b, a
    ldh [$8a], a
    ld a, $30
    ldh [rP1], a
    ldh a, [$b5]
    xor b
    and b
    ld c, a
    ldh [$8b], a
    ldh [$b6], a
    ld a, b
    ldh [$b5], a
    jr nz, jr_01b_614b

    and $f0
    ret z

    ldh a, [$98]
    ld b, a
    ldh a, [$84]
    cp b
    jr c, jr_01b_6147

    ldh a, [$8a]
    and $f0
    ld c, a
    ldh [$b6], a
    ld a, $06
    jr jr_01b_6152

jr_01b_6147:
    xor a
    ldh [$b6], a
    ret


jr_01b_614b:
    ld a, c
    and $f0
    jr z, jr_01b_6157

    ld a, $18

jr_01b_6152:
    ldh [$98], a
    xor a
    ldh [$84], a

jr_01b_6157:
    ldh [$85], a
    ldh a, [$99]
    and $10
    ret z

    ldh a, [$8d]
    ld l, a
    ldh a, [$8c]
    ld e, a
    ld h, $0f
    sub l
    and h
    cp h
    ret z

    ld d, $00
    ld hl, $c3a0
    add hl, de
    ld [hl], c
    ld a, e
    inc a
    and $0f
    ldh [$8c], a
    ret


Call_01b_6178:
    push bc
    push de
    ldh a, [$99]
    bit 1, a
    call z, Call_01b_60fa
    ldh a, [$b6]
    ld h, a
    ldh a, [$8b]
    ld l, a
    ldh a, [$8a]
    pop de
    pop bc
    ret


Call_01b_618c:
    push hl
    call Call_01b_6178
    bit 3, a
    jr z, jr_01b_619d

    ld a, l
    bit 2, a
    jr z, jr_01b_619d

    di
    jp Boot


jr_01b_619d:
    pop hl
    ldh a, [$99]
    and $10
    ldh a, [$b6]
    ret z

    push de
    push hl
    ldh a, [$8d]
    ld e, a
    ldh a, [$8c]
    sub e
    jr z, jr_01b_61bd

    ld a, e
    inc a
    and $0f
    ldh [$8d], a
    ld d, $00
    ld hl, $c3a0
    add hl, de
    ld a, [hl]
    or a

jr_01b_61bd:
    pop hl
    pop de
    ret


    di

jr_01b_61c1:
    ldh a, [rLY]
    cp $91
    jr nz, jr_01b_61c1

    call Call_01b_61cc
    ei
    ret


Call_01b_61cc:
Jump_01b_61cc:
    ldh a, [rLCDC]
    and $7f
    ldh [rLCDC], a

jr_01b_61d2:
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    jr nz, jr_01b_61d2

    stop
    ldh a, [rLCDC]
    or $80
    ldh [rLCDC], a

jr_01b_61ef:
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    jr nz, jr_01b_61ef

    ld a, $30
    ldh [rP1], a
    ret


    call Call_01b_62c8
    ld b, l
    ld c, l
    ld l, e
    ld h, d

jr_01b_6210:
    ld a, c
    or a
    jr z, jr_01b_6231

    ld a, [hl]
    or a
    jr z, jr_01b_6231

    dec c
    inc hl
    cp $20
    jr c, jr_01b_622c

    ld e, a
    ld d, [hl]
    call Call_01b_5b8d
    jr nc, jr_01b_6227

    dec c
    inc hl

jr_01b_6227:
    call Call_01b_593a
    jr jr_01b_6210

jr_01b_622c:
    call Call_01b_59f5
    jr jr_01b_6210

jr_01b_6231:
    ld e, l
    ld d, h
    ld h, b
    ld l, c
    ld a, l
    or a
    jr z, jr_01b_624b

jr_01b_6239:
    call Call_01b_6350
    cp $0d
    jr z, jr_01b_62a6

    cp $08
    jr z, jr_01b_625d

    call Call_01b_6303
    ld a, l
    or a
    jr nz, jr_01b_6239

jr_01b_624b:
    call Call_01b_6350
    cp $0d
    jr z, jr_01b_62ae

    cp $08
    jr nz, jr_01b_624b

    xor a
    ldh [$94], a
    ldh [$95], a
    jr jr_01b_6269

jr_01b_625d:
    ldh a, [$95]
    or a
    jr z, jr_01b_6269

    xor a
    ldh [$94], a
    ldh [$95], a
    jr jr_01b_6239

jr_01b_6269:
    ld a, h
    cp l
    jr z, jr_01b_6239

    dec de
    inc l
    ld a, [de]
    cp $0e
    jr z, jr_01b_6287

    cp $0f
    jr z, jr_01b_628c

    cp $de
    jr z, jr_01b_6291

    cp $df
    jr z, jr_01b_6291

    ld a, $08
    call Call_01b_59f5
    jr jr_01b_6239

jr_01b_6287:
    call Call_01b_62ee
    jr jr_01b_6239

jr_01b_628c:
    call Call_01b_62d5
    jr jr_01b_6239

jr_01b_6291:
    ld a, $08
    call Call_01b_59f5
    dec de
    ld a, [de]
    inc de
    push de
    ld e, a
    ld d, $00
    call Call_01b_5b8d
    call Call_01b_593a
    pop de
    jr jr_01b_6239

jr_01b_62a6:
    ldh a, [$95]
    or a
    jr z, jr_01b_62ae

    call Call_01b_6303

jr_01b_62ae:
    bit 2, c
    jr z, jr_01b_62b6

    ld a, $0e
    ld [de], a
    inc de

jr_01b_62b6:
    xor a
    ldh [$94], a
    ldh [$95], a
    ld [de], a
    ldh a, [$92]
    and $fb
    ldh [$92], a
    ld a, h
    sub l
    ld l, a
    ld h, $00
    ret


Call_01b_62c8:
    ldh a, [$96]
    and $f8
    or h
    ldh [$96], a
    and $07
    cp $04
    jr z, jr_01b_62ee

Call_01b_62d5:
    ld bc, $0000
    ldh a, [$92]
    and $fb
    ldh [$92], a
    ldh a, [$96]
    and $07
    cp $04
    jr nz, jr_01b_62eb

    ldh a, [$96]
    dec a
    ldh [$96], a

jr_01b_62eb:
    jp $66aa


Call_01b_62ee:
jr_01b_62ee:
    ld bc, $0404
    ldh a, [$92]
    and $fb
    or b
    ldh [$92], a
    ldh a, [$96]
    and $f8
    or $04
    ldh [$96], a
    jp $66aa


Call_01b_6303:
    ld [de], a
    cp $a0
    jr c, jr_01b_6325

    cp $de
    jr z, jr_01b_6335

    cp $df
    jr z, jr_01b_6335

    ld a, b
    cp c
    ld a, [de]
    jr z, jr_01b_6325

    ld c, a
    ld a, $0e
    bit 2, b
    jr z, jr_01b_631d

    inc a

jr_01b_631d:
    ld [de], a
    inc de
    dec l
    jr z, jr_01b_6333

    ld a, c
    ld [de], a
    ld c, b

jr_01b_6325:
    push de
    ld e, a
    ld d, $00
    call Call_01b_5b8d

jr_01b_632c:
    call Call_01b_593a
    pop de
    inc de
    dec l
    ret


jr_01b_6333:
    ld c, b
    ret


jr_01b_6335:
    push de
    push af
    ld a, h
    sub l
    jr z, jr_01b_633d

    dec de
    ld a, [de]

jr_01b_633d:
    ld e, a
    pop af
    ld d, a
    call Call_01b_5b8d
    jr nc, jr_01b_634e

    ld d, a
    ld a, $08
    call Call_01b_59f5
    ld a, d
    jr jr_01b_632c

jr_01b_634e:
    pop de
    ret


Call_01b_6350:
jr_01b_6350:
    push de
    ldh a, [$95]
    ld e, a
    ld d, $00
    or a
    jr nz, jr_01b_635b

    ld e, $60

jr_01b_635b:
    call Call_01b_5b8d
    call Call_01b_5958

jr_01b_6361:
    call Call_01b_63cc
    jr nz, jr_01b_636c

    or a
    jr z, jr_01b_6361

    pop de
    jr jr_01b_6350

jr_01b_636c:
    push af
    ld a, $20
    call Call_01b_5958
    pop af
    pop de
    cp $20
    ret nc

    cp $1b
    ret c

    push hl
    sub $1b
    ld l, a
    ldh a, [$96]
    and $f8
    or l
    ldh [$96], a
    ld a, l
    ld h, $04
    cp h
    jr z, jr_01b_638d

    ld h, $00

jr_01b_638d:
    ld b, h
    ld hl, $ff92
    ld a, [hl]
    and $fb
    or b
    ld [hl], a
    pop hl
    ldh a, [$96]
    call $66aa
    jr jr_01b_6350

Call_01b_639e:
    ld de, $1058
    ldh a, [$96]
    and $40
    jr z, jr_01b_63a9

    ld d, $60

jr_01b_63a9:
    ld bc, $2800
    ld hl, $c300

jr_01b_63af:
    ld a, d
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    inc c
    inc c
    ld a, e
    add $08
    ld e, a
    cp $a8
    jr nz, jr_01b_63c8

    ld e, $58
    ld a, d
    add $10
    ld d, a

jr_01b_63c8:
    dec b
    jr nz, jr_01b_63af

    ret


Call_01b_63cc:
    call Call_01b_618c
    bit 1, a
    jr nz, jr_01b_641b

    bit 0, a
    jr nz, jr_01b_641f

    bit 3, a
    jr nz, jr_01b_6417

    bit 2, a
    jp z, Jump_01b_6483

    ldh a, [$96]
    xor $80
    ldh [$96], a
    rlca
    jr c, jr_01b_63f2

    push bc
    push hl
    call Call_01b_58c1
    pop hl
    pop bc
    jr jr_01b_640d

jr_01b_63f2:
    push bc
    push de
    push hl
    ldh a, [$96]
    xor $40
    ldh [$96], a
    call Call_01b_639e
    xor a
    ldh [$95], a
    ldh [$94], a
    ldh a, [$93]
    ld c, $10
    call Call_01b_662b
    pop hl
    pop de
    pop bc

Call_01b_640d:
jr_01b_640d:
    push hl
    ld hl, $ff95
    ld a, [hl]
    ld [hl], $00
    or a
    pop hl
    ret


jr_01b_6417:
    ld a, $0d
    or a
    ret


jr_01b_641b:
    ld a, $08
    or a
    ret


jr_01b_641f:
    ldh a, [$96]
    bit 7, a
    jr z, jr_01b_6417

    and $07
    jr nz, jr_01b_643c

    push de
    push hl
    xor a
    ldh [$95], a
    ldh a, [$93]
    ld e, a
    ld d, $00
    ld hl, $64d7
    add hl, de
    ld a, [hl]
    or a
    pop hl
    pop de
    ret


jr_01b_643c:
    push de
    push hl
    ld e, a
    ld d, $03
    ldh a, [$93]
    ld l, a
    add a
    add l
    ld hl, $64eb
    dec e
    jr z, jr_01b_6462

    ld hl, $6527
    dec e
    jr z, jr_01b_6462

    ld l, a
    ldh a, [$93]
    add a
    add l
    ld hl, $6563
    ld d, $05
    dec e
    jr z, jr_01b_6462

    ld hl, $65c7

jr_01b_6462:
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ldh a, [$94]
    ld e, a
    inc a
    cp d
    jr c, jr_01b_6470

    xor a

jr_01b_6470:
    ldh [$94], a
    ld d, $00
    add hl, de
    ld a, [hl]
    cp $21
    jr c, jr_01b_647c

    ld d, a
    cp a

jr_01b_647c:
    ld hl, $ff95
    ld [hl], d
    pop hl
    pop de
    ret


Jump_01b_6483:
    push bc
    push de
    push hl
    ld b, a
    ldh a, [$93]
    ld c, a
    bit 7, b
    call nz, Call_01b_64bb
    bit 6, b
    call nz, Call_01b_64c3
    bit 5, b
    call nz, Call_01b_64c9
    bit 4, b
    call nz, Call_01b_64cf
    ldh [$93], a
    ld b, a
    ld a, c
    sub b
    jr z, jr_01b_64b7

    ld a, c
    ld c, $00
    call Call_01b_662b
    ld a, b
    ld c, $10
    call Call_01b_662b
    xor a
    ldh [$94], a
    call Call_01b_640d

jr_01b_64b7:
    pop hl
    pop de
    pop bc
    ret


Call_01b_64bb:
    add $05
    cp $14
    ret c

    sub $14
    ret


Call_01b_64c3:
    sub $05
    ret nc

    add $14
    ret


Call_01b_64c9:
    sub $01
    ret nc

    add $14
    ret


Call_01b_64cf:
    add $01
    cp $14
    ret c

    sub $14
    ret


    scf
    jr c, jr_01b_6513

    cpl
    inc e
    inc [hl]
    dec [hl]
    ld [hl], $2a
    dec e
    ld sp, $3332
    dec l
    ld e, $30
    inc hl
    dec a
    dec hl
    rra
    ld b, c
    ld b, d
    ld b, e
    ld b, h
    ld b, l
    ld b, [hl]
    ld b, a
    ld c, b
    ld c, c
    jr z, jr_01b_6532

    ld e, e
    dec e
    dec e
    dec e
    ld c, d
    ld c, e
    ld c, h
    ld c, l
    ld c, [hl]
    ld c, a
    ld d, b
    ld d, c
    ld d, d
    add hl, hl
    ld a, $5d
    ld e, $1e
    ld e, $53
    ld d, h
    ld d, l
    ld d, [hl]
    ld d, a
    ld e, b
    ld e, c
    ld e, d
    ld b, b
    ld a, [hl-]

jr_01b_6513:
    dec sp
    ld a, [hl]
    rra
    rra
    rra
    ld l, $21
    ccf
    jr nz, jr_01b_653d

    jr nz, jr_01b_654b

    ld [hl+], a
    daa
    ld e, a
    ld a, [hl]
    ld e, [hl]
    dec de
    dec de
    dec de
    ld h, c
    ld h, d
    ld h, e
    ld h, h
    ld h, l
    ld h, [hl]
    ld h, a
    ld l, b
    ld l, c
    inc hl
    dec h

jr_01b_6532:
    ld h, $1e
    ld e, $1e
    ld l, d
    ld l, e
    ld l, h
    ld l, l
    ld l, [hl]
    ld l, a
    ld [hl], b

jr_01b_653d:
    ld [hl], c
    ld [hl], d
    inc h
    ld e, h
    ld a, h
    rra
    rra
    rra
    ld [hl], e
    ld [hl], h
    ld [hl], l
    halt
    ld [hl], a
    ld a, b

jr_01b_654b:
    ld a, c
    ld a, d
    ld h, b
    ld a, [hl-]
    dec sp
    ld a, [hl]
    dec de
    dec de
    dec de
    ld l, $21
    ccf
    jr nz, jr_01b_6579

    jr nz, @+$2e

    ld [hl+], a
    daa
    ld e, a
    ld a, [hl]
    ld e, [hl]
    inc e
    inc e
    inc e
    or c
    or d
    or e
    or h
    or l
    or [hl]
    or a
    cp b
    cp c
    cp d
    cp e
    cp h
    cp l
    cp [hl]
    cp a
    and a
    xor b
    xor c
    xor d
    xor e
    rra
    rra

jr_01b_6579:
    rra
    rra
    rra
    ret nz

    pop bc
    jp nz, $c4c3

    push bc
    add $c7
    ret z

    ret


    jp z, $cccb

    call $acce
    xor l
    xor [hl]
    xor a
    dec l
    dec de
    dec de
    dec de
    dec de
    dec de
    trap $d0
    pop de
    jp nc, $d4d3

    push de
    sub $a2
    and e
    pushx @ + $d9d8
    jp c, $a4db

    inc l
    dec sp
    jr z, jr_01b_65d2

    inc e
    inc e
    inc e
    inc e
    inc e
    call c, $dda6
    ld e, e
    ld e, l
    sbc $22
    daa
    inc h
    ld e, h
    rst $18
    ld hl, $263f
    ld a, [hl]
    and c
    ld l, $3a
    inc a
    ld a, $1d
    dec e
    dec e
    dec e
    dec e
    or c
    or d
    or e
    or h
    or l
    or [hl]
    or a
    cp b
    cp c
    cp d
    cp e

jr_01b_65d2:
    cp h
    cp l
    cp [hl]
    cp a
    and a
    xor b
    xor c
    xor d
    xor e
    dec de
    dec de
    dec de
    dec de
    dec de
    ret nz

    pop bc
    jp nz, $c4c3

    push bc
    add $c7
    ret z

    ret


    jp z, $cccb

    call $acce
    xor l
    xor [hl]
    xor a
    dec l
    inc e
    inc e
    inc e
    inc e
    inc e
    trap $d0
    pop de
    jp nc, $d4d3

    push de
    sub $a2
    and e
    pushx @ + $d9d8
    jp c, $a4db

    inc l
    dec sp
    jr z, jr_01b_6636

    dec e
    dec e
    dec e
    dec e
    dec e
    call c, $dda6
    ld e, e
    ld e, l
    sbc $22
    daa
    inc h
    ld e, h
    rst $18
    ld hl, $263f
    ld a, [hl]
    and c
    ld l, $3a
    inc a
    ld a, $1e
    ld e, $1e
    ld e, $1e

Call_01b_662b:
    add a
    add a
    add a
    ld l, a
    ld h, $00
    ld de, $c303
    add hl, de
    ld [hl], c

jr_01b_6636:
    inc hl
    inc hl
    inc hl
    inc hl
    ld [hl], c
    ret


    ld b, [hl]
    ld h, [hl]
    ld e, d
    ld h, [hl]
    ld l, [hl]
    ld h, [hl]
    add d
    ld h, [hl]
    sub [hl]
    ld h, [hl]
    scf
    jr c, jr_01b_6682

    cpl
    ld b, c
    inc [hl]
    dec [hl]
    ld [hl], $2a
    ld h, c
    ld sp, $3332
    dec l
    ld bc, $2330
    dec a
    dec hl
    nop
    ld b, c
    ld b, h

jr_01b_665c:
    ld b, a
    jr z, jr_01b_66c0

    ld c, d
    ld c, l
    ld d, b
    add hl, hl
    ld bc, $5653
    ld e, c
    ld a, [hl-]
    nop
    ld l, $20
    inc l
    ld e, a
    jr nc, @+$63

    ld h, h
    ld h, a
    inc hl
    ld bc, $6d6a
    ld [hl], b
    inc h
    nop
    ld [hl], e
    halt
    ld a, c
    ld a, [hl-]
    jr nc, jr_01b_66ac

    jr nz, jr_01b_66ac

    ld e, a
    ld b, c

jr_01b_6682:
    or c
    or [hl]
    cp e
    and a
    nop
    ret nz

    push bc
    jp z, Jump_000_30ac

    trap $d4
    pushx @ + $41a4
    call c, $dfde
    and c
    ld h, c
    or c
    or [hl]
    cp e
    and a
    jr nc, jr_01b_665c

    push bc
    jp z, Jump_01b_41ac

    trap $d4
    pushx @ + $61a4
    call c, $dfde
    and c
    ld bc, $d5c5

jr_01b_66ac:
    push hl
    and $07
    add a
    ld l, a
    ld h, $00
    ld de, $663c
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $8000
    ld c, $14

jr_01b_66bf:
    push bc

jr_01b_66c0:
    push de
    push hl
    ld a, [de]
    or a
    jr z, jr_01b_66e1

    cp $01
    jr z, jr_01b_66dd

    ld d, a
    ld e, $ca
    cp $de
    jr z, jr_01b_66d8

    cp $df
    jr z, jr_01b_66d8

    ld e, a
    ld d, $00

jr_01b_66d8:
    call Call_01b_5b8d
    jr jr_01b_66e3

jr_01b_66dd:
    ld a, $b1
    jr jr_01b_66e3

jr_01b_66e1:
    ld a, $61

jr_01b_66e3:
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld de, $6f8e
    add hl, de
    ld e, l
    ld d, h
    pop hl
    push de
    push hl
    call Call_01b_6720
    ld de, $c3e0
    pop hl
    push hl
    ld bc, $0020
    push bc
    trap $02
    pop bc
    pop hl
    add hl, bc
    pop de
    push hl
    call Call_01b_6765
    ld de, $c3e0
    pop hl
    push hl
    ld bc, $0020
    push bc
    trap $02
    pop bc
    pop hl
    add hl, bc
    pop de
    pop bc
    inc de
    dec c
    jr nz, jr_01b_66bf

    pop hl
    pop de
    pop bc
    ret


Call_01b_6720:
    ld hl, $c3e0
    ld [hl], $00
    inc hl
    ld [hl], $ff
    inc hl
    ld [hl], $00
    inc hl
    ld [hl], $ff
    inc hl
    ld b, $02

jr_01b_6731:
    ld [hl], $3f
    inc hl
    ld [hl], $c0
    inc hl
    dec b
    jr nz, jr_01b_6731

    ld b, $08

jr_01b_673c:
    ld [hl], $3f
    inc hl
    ld a, [de]
    inc de
    rrca
    rrca
    rrca
    rrca
    and $0f
    or $c0
    ld [hl], a
    inc hl
    dec b
    jr nz, jr_01b_673c

    ld b, $02

jr_01b_6750:
    ld [hl], $3f
    inc hl
    ld [hl], $c0
    inc hl
    dec b
    jr nz, jr_01b_6750

    ld [hl], $7f
    inc hl
    ld [hl], $ff
    inc hl
    ld [hl], $ff
    inc hl
    ld [hl], $ff
    ret


Call_01b_6765:
    ld hl, $c3e0
    ld [hl], $00
    inc hl
    ld [hl], $ff
    inc hl
    ld [hl], $01
    inc hl
    ld [hl], $ff
    inc hl
    ld b, $02

jr_01b_6776:
    ld [hl], $ff
    inc hl
    ld [hl], $03
    inc hl
    dec b
    jr nz, jr_01b_6776

    ld b, $08

jr_01b_6781:
    ld [hl], $ff
    inc hl
    ld a, [de]
    inc de
    rlca
    rlca
    rlca
    rlca
    and $f0
    or $03
    ld [hl], a
    inc hl
    dec b
    jr nz, jr_01b_6781

    ld b, $02

jr_01b_6795:
    ld [hl], $ff
    inc hl
    ld [hl], $03
    inc hl
    dec b
    jr nz, jr_01b_6795

    ld [hl], $ff
    inc hl
    ld [hl], $ff
    inc hl
    ld [hl], $ff
    inc hl
    ld [hl], $ff
    ret


Call_01b_67aa:
    push bc
    push hl
    ld hl, $c3e0
    call Call_01b_69df
    call Call_01b_69df
    call Call_01b_69df
    call Call_01b_69df
    call Call_01b_69df
    ld hl, $c3ea
    call Call_01b_6b8d
    ld hl, $c3ee
    call Call_01b_69d0
    ld hl, $c3e0
    ld a, [hl]
    or $08
    ld [hl+], a
    ld a, [hl]
    or $08
    ld [hl+], a
    ld a, [hl]
    or $0c
    ld [hl+], a
    ld a, [hl]
    or $0c
    ld [hl+], a
    ld a, [hl]
    or $0e
    ld [hl+], a
    ld a, [hl]
    or $0e
    ld [hl+], a
    ld a, [hl]
    or $0c
    ld [hl+], a
    ld a, [hl]
    or $0c
    ld [hl+], a
    ld a, [hl]
    or $08
    ld [hl+], a
    ld a, [hl]
    or $08
    ld [hl+], a
    jp Jump_01b_69b1


Call_01b_67f8:
    push bc
    push hl
    ld hl, $c3e0
    call Call_01b_69df
    call Call_01b_69df
    call Call_01b_69df
    call Call_01b_69df
    call Call_01b_69df
    ld hl, $c3ea
    call Call_01b_6b8d
    ld hl, $c3ee
    call Call_01b_69d0
    ld hl, $c3e0
    ld a, [hl]
    or $10
    ld [hl+], a
    ld a, [hl]
    or $10
    ld [hl+], a
    ld a, [hl]
    or $30
    ld [hl+], a
    ld a, [hl]
    or $30
    ld [hl+], a
    ld a, [hl]
    or $70
    ld [hl+], a
    ld a, [hl]
    or $70
    ld [hl+], a
    ld a, [hl]
    or $30
    ld [hl+], a
    ld a, [hl]
    or $30
    ld [hl+], a
    ld a, [hl]
    or $10
    ld [hl+], a
    ld a, [hl]
    or $10
    ld [hl+], a
    jp Jump_01b_69b1


Call_01b_6846:
    push bc
    push hl
    ld hl, $c3e0
    ld de, $f010
    call Call_01b_6c61
    call Call_01b_69c1
    jp Jump_01b_69b1


Call_01b_6857:
    push bc
    push hl
    ld hl, $c3e0
    ld de, $f808
    call Call_01b_6e7c
    call Call_01b_69c1
    jp Jump_01b_69b1


Call_01b_6868:
    push bc
    push hl
    ld hl, $c3e0
    call Call_01b_69d0
    ld hl, $c3e2
    ld de, $f010
    call Call_01b_6bc2
    ld hl, $c3e6
    ld de, $f010
    call Call_01b_6c61
    ld hl, $c3e6
    ld de, $c3e8
    ld b, $08
    call Call_01b_69c9
    jp Jump_01b_69b1


Call_01b_6890:
    push bc
    push hl
    ld hl, $c3e0
    call Call_01b_69d0
    ld hl, $c3e2
    ld de, $f808
    call Call_01b_6d9f
    ld hl, $c3e6
    ld de, $f808
    call Call_01b_6e7c
    ld hl, $c3e6
    ld de, $c3e8
    ld b, $08
    call Call_01b_69c9
    jp Jump_01b_69b1


Call_01b_68b8:
    push bc
    push hl
    ld hl, $c3e0
    call Call_01b_69d0
    ld hl, $c3e2
    call Call_01b_6b3a
    ld hl, $c3e6
    call Call_01b_69df
    call Call_01b_69df
    call Call_01b_69df
    call Call_01b_69df
    call Call_01b_69df
    jp Jump_01b_69b1


Call_01b_68db:
    push bc
    push hl
    ld hl, $c3ee
    call Call_01b_69d0
    ld de, $f010
    ld hl, $c3ea
    call Call_01b_6cde
    ld hl, $c3e0
    ld de, $f010
    call Call_01b_6c61
    ld hl, $c3e0
    ld de, $c3e2
    ld b, $08
    call Call_01b_69c9
    jp Jump_01b_69b1


Call_01b_6903:
    push bc
    push hl
    ld hl, $c3ee
    call Call_01b_69d0
    ld hl, $c3ea
    ld de, $f808
    call Call_01b_6eef
    ld hl, $c3e0
    ld de, $f808
    call Call_01b_6e7c
    ld hl, $c3e0
    ld de, $c3e2
    ld b, $08
    call Call_01b_69c9
    jp Jump_01b_69b1


Call_01b_692b:
    push bc
    push hl
    ld hl, $c3e0
    call Call_01b_69df
    call Call_01b_69df
    call Call_01b_69df
    call Call_01b_69df
    call Call_01b_69df
    ld hl, $c3ea
    call Call_01b_6b8d
    ld hl, $c3ee
    call Call_01b_69d0
    jp Jump_01b_69b1


Call_01b_694e:
    push bc
    push hl
    ld hl, $c3e0
    ld de, $f808
    call Call_01b_6e7c
    call Call_01b_69c1
    ld hl, $c3e4
    ld a, [hl]
    or $20
    ld [hl+], a
    ld a, [hl]
    or $20
    ld [hl+], a
    ld a, [hl]
    or $70
    ld [hl+], a
    ld a, [hl]
    or $70
    ld [hl+], a
    ld a, [hl]
    or $f8
    ld [hl+], a
    ld a, [hl]
    or $f8
    ld [hl+], a
    jp Jump_01b_69b1


Call_01b_697a:
    push bc
    push hl
    ld hl, $c3e0
    ld de, $f808
    call Call_01b_6e7c
    call Call_01b_69c1
    ld hl, $c3e6
    ld a, [hl]
    or $f8
    ld [hl+], a
    ld a, [hl]
    or $f8
    ld [hl+], a
    ld a, [hl]
    or $70
    ld [hl+], a
    ld a, [hl]
    or $70
    ld [hl+], a
    ld a, [hl]
    or $20
    ld [hl+], a
    ld a, [hl]
    or $20
    ld [hl+], a
    jp Jump_01b_69b1


Jump_01b_69a6:
    push bc
    push hl
    ld hl, $c3e0
    call Call_01b_69d0
    call Call_01b_69c1

Jump_01b_69b1:
    pop hl
    ld de, $c3e0
    ld bc, $0010
    push bc
    push hl
    trap $02
    pop hl
    pop bc
    add hl, bc
    pop bc
    ret


Call_01b_69c1:
    ld hl, $c3e0
    ld de, $c3e2
    ld b, $0e

Call_01b_69c9:
jr_01b_69c9:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_01b_69c9

    ret


Call_01b_69d0:
    xor a
    bit 6, b
    jr z, jr_01b_69d6

    dec a

jr_01b_69d6:
    ld [hl+], a
    xor a
    bit 7, b
    jr z, jr_01b_69dd

    dec a

jr_01b_69dd:
    ld [hl+], a
    ret


Call_01b_69df:
    xor a
    bit 4, b
    jr z, jr_01b_69e5

    dec a

jr_01b_69e5:
    ld [hl+], a
    xor a
    bit 5, b
    jr z, jr_01b_69ec

    dec a

jr_01b_69ec:
    ld [hl+], a
    ret


    ld a, h
    cp d
    jr c, jr_01b_69f4

    ld h, d
    ld d, a

jr_01b_69f4:
    ld a, l
    cp e
    jr c, jr_01b_69fa

    ld l, e
    ld e, a

jr_01b_69fa:
    push bc
    ld c, $02
    bit 2, b
    jr nz, jr_01b_6a07

    dec c
    bit 1, b
    jr nz, jr_01b_6a07

    dec c

jr_01b_6a07:
    ld a, d
    sub h
    cp $08
    jr c, jr_01b_6a43

    ld a, h
    and $07
    cp c
    jr c, jr_01b_6a43

    ld a, l
    cp c
    jr c, jr_01b_6a43

    ld a, [$c3b9]
    add a
    add a
    add a
    dec a
    ld c, a
    ld a, [$c3ba]
    add a
    add a
    add a
    dec a
    bit 1, b
    jr z, jr_01b_6a32

    dec c
    dec a
    bit 2, b
    jr z, jr_01b_6a32

    dec c
    dec a

jr_01b_6a32:
    cp e
    jr c, jr_01b_6a43

    ld a, c
    cp d
    jr c, jr_01b_6a43

    and $07
    inc a
    ld c, a
    ld a, d
    and $07
    cp c
    jr c, jr_01b_6a45

jr_01b_6a43:
    pop bc
    ret


jr_01b_6a45:
    pop bc
    push de
    push hl
    ld a, e
    inc a
    sub l
    ld e, a
    srl d
    srl d
    srl d
    srl h
    srl h
    srl h
    ld a, d
    inc a
    sub h
    bit 1, b
    jr z, jr_01b_6a61

    sub $02

jr_01b_6a61:
    ld d, a
    call Call_01b_5999
    push hl
    push de
    push bc
    bit 1, b
    call nz, Call_01b_6aa3
    pop bc
    pop de
    push de
    push bc
    ld a, d
    or a
    jr z, jr_01b_6a96

    call Call_01b_6b5f
    push bc
    ld de, $c400
    ld a, l
    sub e
    ld c, a
    ld a, h
    sbc d
    ld b, a
    ld hl, sp+$05
    ld h, [hl]
    pop af
    ld l, a

jr_01b_6a87:
    push hl
    push bc
    push de
    ld a, l
    ld hl, sp+$0a
    call Call_01b_6ae2
    pop de
    pop bc
    pop hl
    dec h
    jr nz, jr_01b_6a87

jr_01b_6a96:
    pop bc
    push bc
    bit 1, b
    call nz, Call_01b_6b1d
    pop bc
    pop de
    pop hl
    pop hl
    pop de
    ret


Call_01b_6aa3:
    ld hl, sp+$09
    call Call_01b_6bb2
    ld hl, $c400
    call Call_01b_6bc2
    push hl
    ld hl, sp+$06
    ld a, [hl]
    pop hl

jr_01b_6ab3:
    push af
    call Call_01b_6c61
    pop af
    dec a
    jr nz, jr_01b_6ab3

    call Call_01b_6cde

jr_01b_6abe:
    push bc
    ld de, $c400
    ld a, l
    sub e
    ld c, a
    ld a, h
    sbc d
    ld b, a
    pop af
    ld hl, sp+$06

jr_01b_6acb:
    push hl
    push af
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop af
    call Call_01b_6b10

jr_01b_6ad4:
    trap $02
    pop hl
    ld a, [$c3be]
    add [hl]
    ld [hl+], a
    ld a, [$c3bf]
    adc [hl]
    ld [hl], a
    ret


Call_01b_6ae2:
    bit 0, a
    jr nz, jr_01b_6acb

    push hl
    push af
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop af
    push hl
    call Call_01b_6b10
    pop bc
    push bc
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    push bc
    push de
    trap $02
    pop hl
    pop bc
    add hl, bc
    pop de
    ld a, e
    add [hl]
    ld e, a
    inc hl
    ld a, d
    adc [hl]
    ld d, a
    inc hl
    ld a, d
    ld d, h
    ld h, a
    ld a, e
    ld e, l
    ld l, a
    jr jr_01b_6ad4

Call_01b_6b10:
    bit 1, a
    jr z, jr_01b_6b16

    dec hl
    dec hl

jr_01b_6b16:
    bit 2, a
    jr z, jr_01b_6b1c

    dec hl
    dec hl

jr_01b_6b1c:
    ret


Call_01b_6b1d:
    ld hl, sp+$0b
    call Call_01b_6bb2
    ld hl, $c400
    call Call_01b_6d9f
    push hl
    ld hl, sp+$06
    ld a, [hl]
    pop hl

jr_01b_6b2d:
    push af
    call Call_01b_6e7c
    pop af
    dec a
    jr nz, jr_01b_6b2d

    call Call_01b_6eef
    jr jr_01b_6abe

Call_01b_6b3a:
    bit 2, b
    jr z, jr_01b_6b4c

    xor a
    bit 2, c
    jr z, jr_01b_6b44

    dec a

jr_01b_6b44:
    ld [hl+], a
    xor a
    bit 3, c
    jr z, jr_01b_6b4b

    dec a

jr_01b_6b4b:
    ld [hl+], a

jr_01b_6b4c:
    bit 1, b
    jr z, jr_01b_6b5e

    xor a
    bit 0, c
    jr z, jr_01b_6b56

    dec a

jr_01b_6b56:
    ld [hl+], a
    xor a
    bit 1, c
    jr z, jr_01b_6b5d

    dec a

jr_01b_6b5d:
    ld [hl+], a

jr_01b_6b5e:
    ret


Call_01b_6b5f:
    ld hl, $c400
    call Call_01b_6b3a
    bit 0, b
    jr z, jr_01b_6b83

    ld d, b
    push bc
    ld c, $00
    bit 4, d
    jr z, jr_01b_6b72

    dec c

jr_01b_6b72:
    ld b, $00
    bit 5, d
    jr z, jr_01b_6b79

    dec b

jr_01b_6b79:
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    dec e
    jr nz, jr_01b_6b79

    pop bc
    jr jr_01b_6b8d

jr_01b_6b83:
    ld d, $00
    sla e
    rl d
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a

Call_01b_6b8d:
jr_01b_6b8d:
    bit 1, b
    jr z, jr_01b_6b9f

    xor a
    bit 4, c
    jr z, jr_01b_6b97

    dec a

jr_01b_6b97:
    ld [hl+], a
    xor a
    bit 5, c
    jr z, jr_01b_6b9e

    dec a

jr_01b_6b9e:
    ld [hl+], a

jr_01b_6b9f:
    bit 2, b
    jr z, jr_01b_6bb1

    xor a
    bit 6, c
    jr z, jr_01b_6ba9

    dec a

jr_01b_6ba9:
    ld [hl+], a
    xor a
    bit 7, c
    jr z, jr_01b_6bb0

    dec a

jr_01b_6bb0:
    ld [hl+], a

jr_01b_6bb1:
    ret


Call_01b_6bb2:
    ld a, [hl]
    ld de, $8080
    and $07
    ret z

jr_01b_6bb9:
    scf
    rr d
    srl e
    dec a
    jr nz, jr_01b_6bb9

    ret


Call_01b_6bc2:
    bit 2, b
    jr z, jr_01b_6bfe

    xor a
    bit 2, c
    jr z, jr_01b_6bd3

    ld a, d
    sla a
    sla a
    sla a
    cpl

jr_01b_6bd3:
    ld [hl], a
    xor a
    bit 6, b
    jr z, jr_01b_6be0

    ld a, d
    sla a
    sla a
    sla a

jr_01b_6be0:
    or [hl]
    ld [hl+], a
    xor a
    bit 3, c
    jr z, jr_01b_6bef

    ld a, d
    sla a
    sla a
    sla a
    cpl

jr_01b_6bef:
    ld [hl], a
    xor a
    bit 7, b
    jr z, jr_01b_6bfc

    ld a, d
    sla a
    sla a
    sla a

jr_01b_6bfc:
    or [hl]
    ld [hl+], a

jr_01b_6bfe:
    bit 1, b
    jr z, jr_01b_6c60

    ld a, $ff
    bit 0, c
    jr z, jr_01b_6c0d

    ld a, d
    sla a
    sla a

jr_01b_6c0d:
    cpl
    ld [hl], a
    bit 2, b
    jr z, jr_01b_6c1d

    xor a
    bit 2, c
    jr z, jr_01b_6c1d

    ld a, e
    sla a
    sla a

jr_01b_6c1d:
    or [hl]
    ld [hl], a
    xor a
    bit 6, b
    jr z, jr_01b_6c2f

    ld a, d
    sla a
    sla a
    bit 2, b
    jr z, jr_01b_6c2f

    sla a

jr_01b_6c2f:
    or [hl]
    ld [hl+], a
    ld a, $ff
    bit 1, c
    jr z, jr_01b_6c3c

    ld a, d
    sla a
    sla a

jr_01b_6c3c:
    cpl
    ld [hl], a
    bit 2, b
    jr z, jr_01b_6c4c

    xor a
    bit 3, c
    jr z, jr_01b_6c4c

    ld a, e
    sla a
    sla a

jr_01b_6c4c:
    or [hl]
    ld [hl], a
    xor a
    bit 7, b
    jr z, jr_01b_6c5e

    ld a, d
    sla a
    sla a
    bit 2, b
    jr z, jr_01b_6c5e

    sla a

jr_01b_6c5e:
    or [hl]
    ld [hl+], a

jr_01b_6c60:
    ret


Call_01b_6c61:
    xor a
    bit 4, b
    jr z, jr_01b_6c6a

    ld a, d
    sla a
    cpl

jr_01b_6c6a:
    ld [hl], a
    ld a, d
    sla a
    bit 1, b
    jr z, jr_01b_6c98

    xor a
    bit 0, c
    jr z, jr_01b_6c7a

    ld a, e
    sla a

jr_01b_6c7a:
    or [hl]
    ld [hl], a
    ld a, d
    sla a
    sla a
    bit 2, b
    jr z, jr_01b_6c98

    xor a
    bit 2, c
    jr z, jr_01b_6c8f

    ld a, e
    sla a
    sla a

jr_01b_6c8f:
    or [hl]
    ld [hl], a
    ld a, d
    sla a
    sla a
    sla a

jr_01b_6c98:
    bit 6, b
    jr nz, jr_01b_6c9d

    xor a

jr_01b_6c9d:
    or [hl]
    ld [hl+], a
    xor a
    bit 5, b
    jr z, jr_01b_6ca8

    ld a, d
    sla a
    cpl

jr_01b_6ca8:
    ld [hl], a
    ld a, d
    srl a
    bit 1, b
    jr z, jr_01b_6cd6

    xor a
    bit 1, c
    jr z, jr_01b_6cb8

    ld a, e
    sla a

jr_01b_6cb8:
    or [hl]
    ld [hl], a
    ld a, d
    sla a
    sla a
    bit 2, b
    jr z, jr_01b_6cd6

    xor a
    bit 3, c
    jr z, jr_01b_6ccd

    ld a, e
    sla a
    sla a

jr_01b_6ccd:
    or [hl]
    ld [hl], a
    ld a, d
    sla a
    sla a
    sla a

jr_01b_6cd6:
    bit 7, b
    jr nz, jr_01b_6cdb

    xor a

jr_01b_6cdb:
    or [hl]
    ld [hl+], a
    ret


Call_01b_6cde:
    bit 1, b
    jr z, jr_01b_6d3e

    xor a
    bit 4, c
    jr z, jr_01b_6ced

    ld a, d
    sla a
    sla a
    cpl

jr_01b_6ced:
    ld [hl], a
    bit 2, b
    jr z, jr_01b_6cfe

    xor a
    bit 2, c
    jr z, jr_01b_6cfc

    ld a, e
    sla a
    sla a

jr_01b_6cfc:
    or [hl]
    ld [hl], a

jr_01b_6cfe:
    xor a
    bit 6, b
    jr z, jr_01b_6d0e

    ld a, d
    sla a
    sla a
    bit 2, b
    jr z, jr_01b_6d0e

    sla a

jr_01b_6d0e:
    or [hl]
    ld [hl+], a
    xor a
    bit 5, c
    jr z, jr_01b_6d1b

    ld a, d
    sla a
    sla a
    cpl

jr_01b_6d1b:
    ld [hl], a
    bit 2, b
    jr z, jr_01b_6d2c

    xor a
    bit 3, c
    jr z, jr_01b_6d2a

    ld a, e
    sla a
    sla a

jr_01b_6d2a:
    or [hl]
    ld [hl], a

jr_01b_6d2c:
    xor a
    bit 7, b
    jr z, jr_01b_6d3c

    ld a, d
    sla a
    sla a
    bit 2, b
    jr z, jr_01b_6d3c

    sla a

jr_01b_6d3c:
    or [hl]
    ld [hl+], a

jr_01b_6d3e:
    bit 2, b
    jr z, jr_01b_6d9e

    ld a, $ff
    bit 6, c
    jr z, jr_01b_6d4b

    ld a, d
    sla a

jr_01b_6d4b:
    cpl
    ld [hl], a
    xor a
    bit 3, b
    jr z, jr_01b_6d56

    bit 6, c
    jr jr_01b_6d58

jr_01b_6d56:
    bit 6, b

jr_01b_6d58:
    jr z, jr_01b_6d60

    ld a, e
    sla a
    or e
    sla a

jr_01b_6d60:
    or [hl]
    ld [hl], a
    xor a
    bit 6, b
    jr z, jr_01b_6d6e

    ld a, d
    sla a
    sla a
    sla a

jr_01b_6d6e:
    or [hl]
    ld [hl+], a
    ld a, $ff
    bit 7, c
    jr z, jr_01b_6d79

    ld a, d
    sla a

jr_01b_6d79:
    cpl
    ld [hl], a
    xor a
    bit 3, b
    jr z, jr_01b_6d84

    bit 7, c
    jr jr_01b_6d86

jr_01b_6d84:
    bit 7, b

jr_01b_6d86:
    jr z, jr_01b_6d8e

    ld a, e
    sla a
    or e
    sla a

jr_01b_6d8e:
    or [hl]
    ld [hl], a
    xor a
    bit 7, b
    jr z, jr_01b_6d9c

    ld a, d
    sla a
    sla a
    sla a

jr_01b_6d9c:
    or [hl]
    ld [hl+], a

jr_01b_6d9e:
    ret


Call_01b_6d9f:
    bit 2, b
    jr z, jr_01b_6dfd

    xor a
    bit 2, c
    jr z, jr_01b_6dac

    ld a, d
    scf
    rr a

jr_01b_6dac:
    ld [hl], a
    xor a
    bit 3, b
    jr nz, jr_01b_6db6

    bit 6, b
    jr jr_01b_6db8

jr_01b_6db6:
    bit 6, c

jr_01b_6db8:
    jr z, jr_01b_6dbf

    ld a, e
    srl a
    srl a

jr_01b_6dbf:
    or [hl]
    ld [hl], a
    xor a
    bit 6, b
    jr z, jr_01b_6dce

    ld a, d
    srl a
    srl a
    or $c0
    cpl

jr_01b_6dce:
    or [hl]
    ld [hl+], a
    xor a
    bit 3, c
    jr z, jr_01b_6dd9

    ld a, d
    scf
    rr a

jr_01b_6dd9:
    ld [hl], a
    xor a
    bit 3, b
    jr nz, jr_01b_6de3

    bit 7, b
    jr jr_01b_6de5

jr_01b_6de3:
    bit 7, c

jr_01b_6de5:
    jr z, jr_01b_6dec

    ld a, e
    srl a
    srl a

jr_01b_6dec:
    or [hl]
    ld [hl], a
    xor a
    bit 7, b
    jr z, jr_01b_6dfb

    ld a, d
    srl a
    srl a
    or $c0
    cpl

jr_01b_6dfb:
    or [hl]
    ld [hl+], a

jr_01b_6dfd:
    bit 1, b
    jr z, jr_01b_6e7b

    xor a
    bit 0, c
    jr z, jr_01b_6e07

    ld a, d

jr_01b_6e07:
    ld [hl], a
    xor a
    bit 4, c
    jr z, jr_01b_6e10

    ld a, e
    srl a

jr_01b_6e10:
    or [hl]
    ld [hl], a
    bit 2, b
    jr z, jr_01b_6e28

    xor a
    bit 3, b
    jr nz, jr_01b_6e1f

    bit 6, b
    jr jr_01b_6e21

jr_01b_6e1f:
    bit 6, c

jr_01b_6e21:
    jr z, jr_01b_6e28

    ld a, e
    srl a
    srl a

jr_01b_6e28:
    or [hl]
    ld [hl], a
    ld a, $ff
    bit 6, b
    jr z, jr_01b_6e3b

    ld a, d
    scf
    rr a
    bit 2, b
    jr z, jr_01b_6e3b

    scf
    rr a

jr_01b_6e3b:
    cpl
    or [hl]
    ld [hl+], a
    xor a
    bit 1, c
    jr z, jr_01b_6e44

    ld a, d

jr_01b_6e44:
    ld [hl], a
    xor a
    bit 5, c
    jr z, jr_01b_6e4d

    ld a, e
    srl a

jr_01b_6e4d:
    or [hl]
    ld [hl], a
    bit 2, b
    jr z, jr_01b_6e65

    xor a
    bit 3, b
    jr nz, jr_01b_6e5c

    bit 7, b
    jr jr_01b_6e5e

jr_01b_6e5c:
    bit 7, c

jr_01b_6e5e:
    jr z, jr_01b_6e65

    ld a, e
    srl a
    srl a

jr_01b_6e65:
    or [hl]
    ld [hl], a
    ld a, $ff
    bit 7, b
    jr z, jr_01b_6e78

    ld a, d
    scf
    rr a
    bit 2, b
    jr z, jr_01b_6e78

    scf
    rr a

jr_01b_6e78:
    cpl
    or [hl]
    ld [hl+], a

jr_01b_6e7b:
    ret


Call_01b_6e7c:
    xor a
    bit 4, b
    jr z, jr_01b_6e82

    ld a, d

jr_01b_6e82:
    ld [hl], a
    ld a, d
    bit 1, b
    jr z, jr_01b_6ead

    xor a
    bit 4, c
    jr z, jr_01b_6e90

    ld a, e
    srl a

jr_01b_6e90:
    or [hl]
    ld [hl], a
    ld a, d
    scf
    rr a
    bit 2, b
    jr z, jr_01b_6ead

    xor a
    bit 6, c
    jr z, jr_01b_6ea4

    ld a, e
    srl a
    srl a

jr_01b_6ea4:
    or [hl]
    ld [hl], a
    ld a, d
    srl a
    srl a
    or $c0

jr_01b_6ead:
    cpl
    bit 6, b
    jr nz, jr_01b_6eb3

    xor a

jr_01b_6eb3:
    or [hl]
    ld [hl+], a
    xor a
    bit 5, b
    jr z, jr_01b_6ebb

    ld a, d

jr_01b_6ebb:
    ld [hl], a
    ld a, d
    bit 1, b
    jr z, jr_01b_6ee6

    xor a
    bit 5, c
    jr z, jr_01b_6ec9

    ld a, e
    srl a

jr_01b_6ec9:
    or [hl]
    ld [hl], a
    ld a, d
    scf
    rr a
    bit 2, b
    jr z, jr_01b_6ee6

    xor a
    bit 7, c
    jr z, jr_01b_6edd

    ld a, e
    srl a
    srl a

jr_01b_6edd:
    or [hl]
    ld [hl], a
    ld a, d
    srl a
    srl a
    or $c0

jr_01b_6ee6:
    cpl
    bit 7, b
    jr nz, jr_01b_6eec

    xor a

jr_01b_6eec:
    or [hl]
    ld [hl+], a
    ret


Call_01b_6eef:
    bit 1, b
    jr z, jr_01b_6f51

    xor a
    bit 4, c
    jr z, jr_01b_6efc

    ld a, d
    scf
    rr a

jr_01b_6efc:
    ld [hl], a
    xor a
    bit 2, b
    jr z, jr_01b_6f0e

    xor a
    bit 6, c
    jr z, jr_01b_6f0c

    ld a, e
    srl a
    srl a

jr_01b_6f0c:
    or [hl]
    ld [hl], a

jr_01b_6f0e:
    ld a, $ff
    bit 6, b
    jr z, jr_01b_6f1f

    ld a, d
    scf
    rr a
    bit 2, b
    jr z, jr_01b_6f1f

    scf
    rr a

jr_01b_6f1f:
    cpl
    or [hl]
    ld [hl+], a
    xor a
    bit 5, c
    jr z, jr_01b_6f2b

    ld a, d
    scf
    rr a

jr_01b_6f2b:
    ld [hl], a
    xor a
    bit 2, b
    jr z, jr_01b_6f3d

    xor a
    bit 7, c
    jr z, jr_01b_6f3b

    ld a, e
    srl a
    srl a

jr_01b_6f3b:
    or [hl]
    ld [hl], a

jr_01b_6f3d:
    ld a, $ff
    bit 7, b
    jr z, jr_01b_6f4e

    ld a, d
    scf
    rr a
    bit 2, b
    jr z, jr_01b_6f4e

    scf
    rr a

jr_01b_6f4e:
    cpl
    or [hl]
    ld [hl+], a

jr_01b_6f51:
    bit 2, b
    jr z, jr_01b_6f8d

    xor a
    bit 6, c
    jr z, jr_01b_6f61

    ld a, d
    srl a
    srl a
    or $c0

jr_01b_6f61:
    ld [hl], a
    xor a
    bit 6, b
    jr z, jr_01b_6f6f

    ld a, d
    srl a
    srl a
    or $c0
    cpl

jr_01b_6f6f:
    or [hl]
    ld [hl+], a
    xor a
    bit 7, c
    jr z, jr_01b_6f7d

    ld a, d
    srl a
    srl a
    or $c0

jr_01b_6f7d:
    ld [hl], a
    xor a
    bit 7, b
    jr z, jr_01b_6f8b

    ld a, d
    srl a
    srl a
    or $c0
    cpl

jr_01b_6f8b:
    or [hl]
    ld [hl+], a

jr_01b_6f8d:
    ret


    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    jr c, jr_01b_6f9f

    inc a
    ld b, h
    ld a, $00

jr_01b_6f9f:
    ld b, b
    ld b, b
    ld b, b
    ld a, b
    ld b, h
    ld b, h
    ld a, b
    nop
    nop
    nop
    jr c, jr_01b_6fef

    ld b, b
    ld b, h
    jr c, jr_01b_6faf

jr_01b_6faf:
    inc b
    inc b
    inc b
    inc a
    ld b, h
    ld b, h
    inc a
    nop
    nop
    nop
    jr c, jr_01b_6fff

    ld a, h
    ld b, b
    inc a
    nop
    inc c
    ld [de], a
    db $10
    ld a, [hl]
    db $10
    db $10
    stop
    nop
    jr c, @+$46

    ld b, h
    inc a
    inc b
    jr c, jr_01b_6fcf

jr_01b_6fcf:
    ld b, b
    ld b, b
    ld b, b
    ld a, b
    ld b, h
    ld b, h
    ld b, h
    nop
    nop
    nop
    stop
    db $10
    db $10
    stop
    nop
    inc b
    nop
    inc b
    inc b
    ld b, h
    jr c, jr_01b_6fe7

jr_01b_6fe7:
    ld b, b
    ld b, b
    ld b, h
    ld c, b
    ld [hl], b
    ld c, b
    ld b, h
    nop

jr_01b_6fef:
    jr nc, jr_01b_7001

    db $10
    db $10
    db $10
    db $10
    jr c, jr_01b_6ff7

jr_01b_6ff7:
    nop
    nop
    db $ec
    sub d
    sub d
    sub d
    sub d
    nop

jr_01b_6fff:
    nop
    nop

jr_01b_7001:
    ld e, b
    ld h, h
    ld b, h
    ld b, h
    ld b, h
    nop
    nop
    nop
    jr c, jr_01b_704f

    ld b, h
    ld b, h
    jr c, jr_01b_700f

jr_01b_700f:
    nop
    nop
    ld a, b
    ld b, h
    ld b, h
    ld a, b
    ld b, b
    nop
    nop
    nop
    inc a
    ld b, h
    ld b, h
    inc a
    inc b
    nop
    nop
    nop
    ld e, b
    ld h, h
    ld h, b
    ld b, b
    ld b, b
    nop
    nop
    nop
    inc a
    ld b, b
    inc a
    ld [bc], a
    ld a, h
    nop
    jr nz, jr_01b_7051

    ld a, b
    jr nz, @+$22

    inc h
    jr jr_01b_7037

jr_01b_7037:
    nop
    nop
    ld b, h
    ld b, h
    ld b, h
    ld c, h
    inc [hl]
    nop
    nop
    nop
    ld b, h
    ld b, h
    ld b, h
    jr z, @+$12

    nop
    nop
    nop
    add d
    add d
    ld d, h
    ld d, h
    jr z, jr_01b_704f

jr_01b_704f:
    nop
    nop

jr_01b_7051:
    ld b, d
    inc h
    jr jr_01b_7079

    jp nz, RST_00

    nop
    ld b, d
    inc h
    jr jr_01b_706d

    ld h, b
    nop
    nop
    nop
    ld a, $04
    ld [$3e10], sp
    nop
    ld e, $10
    db $10
    stop
    nop

jr_01b_706d:
    nop
    nop
    nop
    db $10
    db $10
    db $10
    db $10
    db $10
    stop
    nop
    nop

jr_01b_7079:
    nop
    db $10
    db $10
    db $10
    ldh a, [$78]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
    jr nz, jr_01b_709b

    ld [$0204], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $10
    jr c, @+$3a

    jr c, jr_01b_70ab

jr_01b_709b:
    stop
    stop
    ret c

    ret c

    ld c, b
    sub b
    nop
    nop
    nop
    nop
    ld c, b
    db $fc
    ld c, b
    ld c, b

jr_01b_70ab:
    ld c, b
    db $fc
    ld c, b
    nop
    db $10
    ld a, h
    ret nc

    ld a, b
    inc d
    sub h
    ld a, b
    nop
    call nz, Call_000_10c8
    jr nz, jr_01b_7108

    adc h
    nop
    nop
    ld h, b
    sub b
    sub b
    ld h, h
    sub h
    adc b
    ld [hl], h
    nop
    jr nc, jr_01b_70f9

    db $10
    jr nz, jr_01b_70cc

jr_01b_70cc:
    nop
    nop
    nop
    inc b
    ld [$1010], sp
    db $10
    ld [$0004], sp
    ld b, b
    jr nz, jr_01b_70ea

    db $10
    db $10
    jr nz, jr_01b_711e

    nop
    db $10
    ld d, h
    jr c, jr_01b_70f3

    jr c, jr_01b_7139

    stop
    db $10
    db $10
    db $10

jr_01b_70ea:
    cp $10
    db $10
    stop
    nop
    nop
    nop
    nop

jr_01b_70f3:
    nop
    jr nz, jr_01b_7106

    nop
    nop
    nop

jr_01b_70f9:
    nop
    db $fc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nc, jr_01b_7106

jr_01b_7106:
    nop
    nop

jr_01b_7108:
    ld [bc], a
    inc b
    ld [$2010], sp
    ld b, b
    nop
    jr c, jr_01b_7155

    ld b, h
    ld b, h
    ld b, h
    ld b, h
    jr c, jr_01b_7117

jr_01b_7117:
    db $10
    jr nc, @+$12

    db $10
    db $10
    db $10
    ld a, h

jr_01b_711e:
    nop
    jr c, jr_01b_7165

    ld b, h
    ld [$2010], sp
    ld a, h
    nop
    ld a, h
    ld [$0810], sp
    inc b
    ld b, h
    jr c, jr_01b_712f

jr_01b_712f:
    inc c
    inc d
    inc h
    ld b, h
    ld a, [hl]
    inc b
    inc b
    nop
    ld a, h
    ld b, b

jr_01b_7139:
    ld a, b
    ld b, h
    inc b
    ld b, h
    jr c, jr_01b_713f

jr_01b_713f:
    jr jr_01b_7161

    ld b, b
    ld a, b
    ld b, h
    ld b, h
    jr c, jr_01b_7147

jr_01b_7147:
    ld a, h
    ld b, h
    ld [$1010], sp
    db $10
    stop
    jr c, jr_01b_7195

    ld b, h
    jr c, @+$46

    ld b, h

jr_01b_7155:
    jr c, jr_01b_7157

jr_01b_7157:
    jr c, jr_01b_719d

    ld b, h
    inc a
    inc b
    ld [$0030], sp
    jr jr_01b_7179

jr_01b_7161:
    nop
    jr jr_01b_717c

    nop

jr_01b_7165:
    nop
    nop
    jr jr_01b_7181

    nop
    jr @+$1a

    ld [$0010], sp
    nop
    ld b, $18
    ld h, b
    jr jr_01b_717b

    nop
    nop
    nop
    nop

jr_01b_7179:
    ld a, [hl]
    nop

jr_01b_717b:
    ld a, [hl]

jr_01b_717c:
    nop
    nop
    nop
    nop
    ld h, b

jr_01b_7181:
    jr jr_01b_7189

    jr jr_01b_71e5

    nop
    ld a, h
    add $c6

jr_01b_7189:
    inc e
    db $10
    stop
    stop
    jr c, jr_01b_71d5

    sbc d
    xor d
    xor h
    ld d, d

jr_01b_7195:
    inc a
    nop
    jr jr_01b_71bd

    ld b, d
    ld b, d
    ld a, [hl]
    ld b, d

jr_01b_719d:
    ld b, d
    nop
    ld a, h
    ld b, d
    ld b, d
    ld a, h
    ld b, d
    ld b, d
    ld a, h
    nop
    inc e
    ld [hl+], a
    ld b, b
    ld b, b
    ld b, b
    ld [hl+], a
    inc e
    nop
    ld a, b
    ld b, h
    ld b, d
    ld b, d
    ld b, d
    ld b, h
    ld a, b
    nop
    ld a, [hl]
    ld b, b
    ld b, b
    ld a, h
    ld b, b
    ld b, b

jr_01b_71bd:
    ld a, [hl]
    nop
    ld a, [hl]
    ld b, b
    ld b, b
    ld a, h
    ld b, b
    ld b, b
    ld b, b
    nop
    ld e, $20
    ld b, b
    ld e, [hl]
    ld b, d
    ld [hl+], a
    ld e, $00
    ld b, d
    ld b, d
    ld b, d
    ld a, [hl]
    ld b, d
    ld b, d

jr_01b_71d5:
    ld b, d
    nop
    ld a, $08
    ld [$0808], sp
    ld [$003e], sp
    ld e, $04
    inc b
    inc b
    ld b, h
    ld b, h

jr_01b_71e5:
    jr c, jr_01b_71e7

jr_01b_71e7:
    ld b, h
    ld c, b
    ld d, b
    ld h, b
    ld d, b
    ld c, b
    ld b, h
    nop
    ld b, b
    ld b, b
    ld b, b
    ld b, b
    ld b, b
    ld b, b
    ld a, h
    nop
    add d
    add $aa
    sub d
    add d
    add d
    add d
    nop
    ld b, d
    ld h, d
    ld d, d
    ld c, d
    ld b, [hl]
    ld b, d
    ld b, d
    nop
    inc a
    ld b, d
    ld b, d
    ld b, d
    ld b, d
    ld b, d
    inc a
    nop
    ld a, h
    ld b, d
    ld b, d
    ld b, d
    ld a, h
    ld b, b
    ld b, b
    nop
    inc a
    ld b, d
    ld b, d
    ld b, d
    ld e, d
    ld b, h
    ld a, [hl-]
    nop
    ld a, h
    ld b, d
    ld b, d
    ld b, d
    ld a, h
    ld b, d
    ld b, d
    nop
    jr c, jr_01b_726d

    ld b, b
    inc a
    ld [bc], a
    ld b, d
    inc a
    nop
    ld a, $08
    ld [$0808], sp
    ld [$0008], sp
    ld b, d
    ld b, d
    ld b, d
    ld b, d
    ld b, d
    ld b, d
    inc a
    nop
    add d
    add d
    ld b, h
    ld b, h
    jr z, jr_01b_726d

    stop
    add d
    add d
    add d
    sub d
    xor d
    add $82
    nop
    add d
    ld b, h
    jr z, @+$12

    jr z, jr_01b_7299

    add d
    nop
    add d
    add d
    ld b, h
    jr z, jr_01b_726c

    db $10
    stop
    ld a, [hl]
    inc b
    ld [$2010], sp
    ld b, b
    ld a, [hl]
    nop
    inc e
    db $10
    db $10
    db $10
    db $10

jr_01b_726c:
    db $10

jr_01b_726d:
    inc e
    nop
    ld [hl+], a
    inc d
    ld a, $08
    ld a, $08
    ld [$e000], sp
    jr nz, jr_01b_729a

    jr nz, jr_01b_729c

    jr nz, @-$1e

    nop
    db $10
    jr z, jr_01b_7282

jr_01b_7282:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $fc
    nop
    ld b, b
    ld hl, sp+$40
    xor h
    jr nc, jr_01b_72d5

jr_01b_7295:
    inc a
    nop
    jr nz, jr_01b_7295

jr_01b_7299:
    inc h

jr_01b_729a:
    ld a, h
    xor d

jr_01b_729c:
    or d
    ld h, h
    nop
    nop
    add h
    add d
    add d
    add d
    and b
    ld b, b
    nop
    ld a, b
    nop
    ld a, b
    add h
    inc b
    ld [$0030], sp
    ld [hl], b
    nop
    ld hl, sp+$10
    jr nc, jr_01b_7307

    adc h
    nop
    inc h
    ld a, [$7c20]
    and d
    and d
    ld h, h
    nop
    ld b, b
    db $f4

jr_01b_72c1:
    ld c, d
    ld c, d
    ld c, b
    adc b
    sub b
    nop
    jr nz, jr_01b_72c1

    db $10
    ld a, h
    ld [$7880], sp
    nop
    ld [$2010], sp
    ld b, b
    jr nz, jr_01b_72e5

jr_01b_72d5:
    ld [$0800], sp
    adc b
    cp [hl]
    adc b
    adc b
    adc b
    ld d, b
    nop
    ld a, b
    inc b
    ld [$4000], sp
    ld b, b

jr_01b_72e5:
    inc a
    nop
    jr nz, jr_01b_72e5

    db $10
    ld [$8080], sp
    ld a, b
    nop
    ld b, b
    ld b, b
    ld b, b
    ld b, b
    ld b, b
    ld b, h
    jr c, jr_01b_72f7

jr_01b_72f7:
    db $10
    db $fc
    jr nc, jr_01b_734b

    ld d, b
    jr nc, jr_01b_735e

    nop
    inc h
    inc h
    cp $24
    inc h
    jr nz, jr_01b_7324

    nop

jr_01b_7307:
    ld a, b
    db $10
    jr nz, jr_01b_7307

    jr nc, jr_01b_734d

    inc a
    nop
    ld b, b
    ld hl, sp+$40
    ld c, [hl]
    add b
    sub b
    adc [hl]
    nop
    ld b, b
    ld hl, sp+$40
    ld a, b
    add h
    inc b
    ld a, b
    nop
    nop
    inc a
    jp nz, $0202

jr_01b_7324:
    inc b
    jr c, jr_01b_7327

jr_01b_7327:
    db $fc
    db $10
    jr nz, jr_01b_734b

    jr nz, jr_01b_733d

    inc c
    nop
    add b
    ld c, h
    jr nc, jr_01b_7373

    add b
    add b
    ld a, h
    nop
    inc h
    ld a, [c]
    ld c, b
    adc b
    inc a
    ld c, d

jr_01b_733d:
    jr c, jr_01b_733f

jr_01b_733f:
    add b
    cp h
    add b
    add b
    add b
    and b
    ld e, h
    nop
    ld c, b
    ld a, h
    ld c, d
    xor d

jr_01b_734b:
    sub [hl]
    xor d

jr_01b_734d:
    ld b, h
    nop
    jr nz, jr_01b_733d

    ld [hl-], a
    ld [hl+], a
    ld h, [hl]
    xor d
    inc h
    nop
    jr c, @+$66

    sub d
    sub d
    sub d
    sub d
    ld h, h

jr_01b_735e:
    nop
    adc b
    cp [hl]
    adc b
    adc b
    sbc h
    xor d
    ld e, b
    nop
    jr nz, jr_01b_73d1

    xor h
    ld c, d
    ld c, b
    ld c, b
    jr nc, jr_01b_736f

jr_01b_736f:
    jr nz, jr_01b_7381

    jr nz, jr_01b_7393

jr_01b_7373:
    sub h
    sub d
    jr nz, jr_01b_7377

jr_01b_7377:
    nop
    nop
    ld h, b
    sub b
    ld [$0006], sp
    nop
    cp [hl]
    adc b

jr_01b_7381:
    cp [hl]
    adc b
    sbc h
    xor d
    ld e, b
    db $10
    db $fc
    db $10
    db $fc
    db $10
    ld a, b
    sub h
    ld [hl], b
    nop
    ldh [rNR50], a
    inc h
    ld a, h

jr_01b_7393:
    and [hl]
    and h
    ld c, b
    nop
    inc h
    ld a, [$6020]
    and d
    ld h, d
    inc e
    nop
    ld c, b
    ld a, h

jr_01b_73a1:
    ld c, d
    xor d

jr_01b_73a3:
    sub d
    or d
    ld b, h
    nop
    jr nz, jr_01b_73a1

    jr nz, jr_01b_73a3

    jr nz, jr_01b_73d1

jr_01b_73ad:
    jr jr_01b_73af

jr_01b_73af:
    jr z, jr_01b_73ad

    ld [hl+], a
    ld [hl+], a
    inc h
    db $10
    stop
    db $10
    cp b
    call nc, Call_01b_5494
    jr jr_01b_73de

    nop
    db $10
    db $10
    inc e
    db $10
    ld [hl], b
    sbc b
    ld h, h
    nop
    db $10
    ld c, b
    ld b, b
    ld a, b
    add h
    inc b
    ld a, b
    nop
    ld b, h
    ld b, h

jr_01b_73d1:
    ld h, h
    ld b, h
    inc b
    ld [$0030], sp
    ld hl, sp+$10
    ld a, b
    add h
    ld b, h
    and h

jr_01b_73dd:
    ld a, b

jr_01b_73de:
    nop
    jr nz, jr_01b_7409

    db $f4
    inc h
    ld h, h
    and h
    ld [hl+], a
    nop
    ld hl, sp+$10
    ld a, b
    add h
    inc b
    add h
    ld a, b
    nop
    jr nz, jr_01b_73dd

    ld [hl-], a
    ld [hl+], a
    ld h, d
    and d
    inc h
    nop
    jr nz, jr_01b_7419

    ld b, b
    ld h, b
    sub d
    sub d
    adc h
    ld a, [bc]
    ld b, b
    db $f4

jr_01b_7401:
    ld c, d
    ld c, d
    ld c, b
    adc b
    sub b
    ld a, [bc]
    jr nz, jr_01b_7401

jr_01b_7409:
    db $10
    ld a, h
    ld [$7880], sp
    nop
    db $10
    jr nz, jr_01b_745c

    add b
    ld b, b
    jr nz, jr_01b_7426

    ld a, [bc]
    nop
    adc b

jr_01b_7419:
    cp [hl]
    adc b
    adc b
    adc b
    ld d, b
    ld a, [bc]
    nop
    ld a, b
    inc b
    nop
    ld b, b
    ld b, b

jr_01b_7425:
    inc a

jr_01b_7426:
    ld a, [bc]
    jr nz, jr_01b_7425

    db $10
    ld [$8080], sp
    ld a, b
    nop
    ld b, b
    ld b, b
    ld c, d
    ld b, b
    ld b, b
    ld b, h
    jr c, jr_01b_743c

    db $10
    db $fc
    jr nc, jr_01b_748b

    ld d, b

jr_01b_743c:
    jr nc, jr_01b_749e

    dec b
    jr nz, jr_01b_7465

    cp $24
    inc h
    jr nz, jr_01b_7464

    nop

jr_01b_7447:
    ld a, b
    dec d
    jr nz, jr_01b_7447

    jr nc, jr_01b_748d

    inc a
    ld a, [bc]
    ld b, b
    ld hl, sp+$40
    ld c, [hl]
    add b
    sub b
    adc [hl]
    ld a, [bc]
    ld b, b
    ld hl, sp+$40
    ld a, b
    add h

jr_01b_745c:
    inc b
    ld a, b
    ld a, [bc]
    nop
    inc a
    jp nz, $0202

jr_01b_7464:
    inc b

jr_01b_7465:
    jr c, jr_01b_7467

jr_01b_7467:
    db $fc
    db $10
    dec h
    jr nz, jr_01b_748c

    db $10
    inc c
    ld a, [bc]
    add b
    ld c, h
    jr nc, jr_01b_74b3

    add b
    add b
    ld a, h
    dec b
    adc b
    cp [hl]
    adc b
    adc b
    sbc h
    xor d
    ld e, b
    ld a, [bc]
    jr nz, @+$6a

    xor h
    ld c, d
    ld c, b
    ld c, b
    jr nc, jr_01b_7491

    jr nz, jr_01b_7499

    jr nz, jr_01b_74ab

jr_01b_748b:
    sub h

jr_01b_748c:
    sub d

jr_01b_748d:
    jr nz, jr_01b_748f

jr_01b_748f:
    nop
    ld a, [bc]

jr_01b_7491:
    ld h, b
    sub b
    ld [$0006], sp
    dec b
    cp b
    adc b

jr_01b_7499:
    cp [hl]
    adc b
    sbc h
    xor d
    ld e, b

jr_01b_749e:
    ld [bc], a
    adc l
    cp d
    adc b
    adc b
    sbc h
    xor d
    ld e, b
    ld [bc], a
    dec h
    ld l, d
    xor h
    ld c, d

jr_01b_74ab:
    ld c, b
    ld c, b
    jr nc, jr_01b_74b3

    ld a, [hl+]
    inc d
    jr nz, jr_01b_74d3

jr_01b_74b3:
    sub h
    sub d
    jr nz, jr_01b_74b7

jr_01b_74b7:
    inc b
    ld a, [bc]
    ld h, h
    sub b
    ld [$0006], sp
    ld [bc], a
    cp l
    adc d
    cp h

jr_01b_74c2:
    adc b
    sbc h
    xor d
    ld e, b
    nop
    nop
    jr nz, jr_01b_74c2

    jr z, jr_01b_7544

    or h
    ld h, h
    nop
    nop
    nop
    adc b
    add h

jr_01b_74d3:
    add h
    ld b, b
    nop
    nop
    nop
    jr c, jr_01b_74da

jr_01b_74da:
    ld a, b
    inc b
    inc b
    jr c, jr_01b_74df

jr_01b_74df:
    nop
    jr nc, jr_01b_74e2

jr_01b_74e2:
    ld a, b
    db $10
    jr nc, jr_01b_7532

    nop
    nop
    jr z, @-$0a

    jr nz, jr_01b_7564

    and h
    ld l, b
    nop
    nop
    ld d, b
    ld hl, sp+$54
    ld b, h
    jr z, jr_01b_7516

    nop
    nop
    jr nz, @-$46

    db $e4
    and h
    jr z, jr_01b_753e

    nop
    nop
    db $10
    inc e
    db $10
    ld a, b
    sub h
    ld [hl], b
    nop
    nop
    nop
    nop
    jr c, jr_01b_7550

    inc b
    jr jr_01b_750f

jr_01b_750f:
    db $fc
    inc b
    db $fc
    inc b
    inc b
    jr jr_01b_7576

jr_01b_7516:
    nop
    cp $02
    inc d
    jr jr_01b_752c

    db $10
    jr nz, jr_01b_751f

jr_01b_751f:
    inc b
    ld [$3010], sp
    ld d, b
    sub b
    stop
    db $10
    cp $82
    add d
    ld [bc], a

jr_01b_752c:
    inc b
    jr c, jr_01b_752f

jr_01b_752f:
    ld a, h
    db $10
    db $10

jr_01b_7532:
    db $10
    db $10
    db $10
    cp $00
    ld [$08fe], sp
    jr jr_01b_7564

    ld c, b
    adc b

jr_01b_753e:
    nop
    db $10
    cp $12
    ld [de], a
    ld [hl+], a

jr_01b_7544:
    ld [hl+], a
    ld c, h
    nop
    jr nz, @+$22

    db $fc
    db $10
    db $fc
    db $10
    stop
    ld a, h

jr_01b_7550:
    ld b, h
    add h
    inc b
    ld [$3008], sp
    nop
    ld b, b
    ld a, [hl]
    ld c, b
    adc b
    ld [$6010], sp
    nop
    nop
    db $fc
    inc b
    inc b
    inc b

jr_01b_7564:
    inc b
    db $fc
    nop
    inc h
    cp $24
    inc h
    inc b
    inc b
    jr jr_01b_756f

jr_01b_756f:
    add b
    ld b, b
    add h
    ld b, h
    ld [$e010], sp

jr_01b_7576:
    nop
    db $fc
    inc b
    ld [$2810], sp
    ld b, h
    add d
    nop
    ld b, b
    db $fc
    ld b, h
    ld c, b
    ld b, b
    ld b, b
    inc a
    nop
    add d
    add d
    ld b, d
    inc b
    inc b
    ld [$0030], sp
    ld a, h
    ld b, h
    ld h, h
    sbc h
    inc b
    ld [$0070], sp
    inc c
    ld [hl], b
    db $10
    cp $10
    db $10
    ld h, b
    nop
    and h
    and h
    inc b
    ld [$1008], sp
    ld h, b
    nop
    ld a, h
    nop
    nop
    cp $10
    db $10
    ld h, b
    nop
    ld b, b
    ld b, b
    ld b, b
    ld [hl], b
    ld c, h
    ld b, b
    ld b, b
    nop
    ld [$fe08], sp
    ld [$1008], sp
    ld h, b
    nop
    nop
    ld a, h
    nop
    nop
    nop
    cp $00
    nop
    db $fc
    inc b
    ld b, h
    jr z, jr_01b_75e4

    inc [hl]
    ret nz

    nop
    db $10
    cp $02
    inc c
    inc [hl]
    jp nc, RST_10

    inc b
    inc b
    inc b
    ld [$1008], sp
    ld h, b
    nop
    ld c, b
    ld c, b
    ld c, b
    ld c, b
    ld b, h

jr_01b_75e4:
    add h
    add d
    nop
    add b
    add b
    db $fc
    add b
    add b
    add b
    ld a, h
    nop
    nop
    db $fc
    inc b
    inc b
    ld [$6010], sp
    nop
    nop
    jr nc, jr_01b_7642

    add h
    ld [bc], a
    nop
    nop
    nop
    db $10
    db $10
    cp $10
    ld d, h
    sub d
    stop
    db $fc
    inc b
    inc b
    ld c, b
    jr nc, @+$12

    ld [$3000], sp
    inc c
    jr nc, jr_01b_761f

    nop
    ld h, b
    inc e
    nop
    db $10
    db $10
    jr nz, jr_01b_763f

    ld b, h
    cp $82
    nop

jr_01b_761f:
    ld [bc], a
    ld [bc], a
    inc h
    inc d
    ld [$6014], sp
    nop
    db $fc
    jr nz, jr_01b_764a

    cp $20
    jr nz, jr_01b_766a

    nop

jr_01b_762f:
    jr nz, jr_01b_762f

    ld [hl+], a
    inc h
    jr z, @+$22

    jr nz, jr_01b_7637

jr_01b_7637:
    nop
    ld a, b
    ld [$0808], sp
    cp $00
    nop

jr_01b_763f:
    db $fc
    inc b
    inc b

jr_01b_7642:
    db $fc
    inc b
    inc b
    db $fc
    nop
    ld a, b
    nop
    db $fc

jr_01b_764a:
    inc b
    inc b
    ld [$0070], sp
    ld b, h
    ld b, h
    ld b, h
    ld b, h
    inc b
    ld [$0030], sp
    ld d, b
    ld d, b
    ld d, b
    ld d, b
    ld d, d
    ld d, h
    sbc b
    nop
    ld b, b
    ld b, b
    ld b, b
    ld b, h
    ld b, h
    ld c, b
    ld [hl], b
    nop
    db $fc
    add h
    add h

jr_01b_766a:
    add h
    add h
    db $fc
    add h
    nop
    db $fc
    add h
    add h
    inc b
    inc b
    jr @+$62

    nop
    add b
    ld b, b
    inc b
    inc b
    ld [$e010], sp
    ld a, [bc]
    db $10
    cp $12
    ld [de], a
    ld [hl+], a
    ld [hl+], a
    ld c, h
    ld a, [bc]
    jr nz, jr_01b_76a9

    db $fc
    db $10
    db $fc
    db $10
    db $10
    ld a, [bc]
    nop
    ld a, h
    ld b, h
    add h
    inc b
    ld [$0a30], sp
    ld b, b
    ld a, [hl]
    ld c, b
    adc b
    ld [$6010], sp
    ld a, [bc]
    nop
    db $fc
    inc b
    inc b
    inc b
    inc b
    db $fc
    ld a, [bc]
    nop
    inc h

jr_01b_76a9:
    cp $24
    inc h
    inc b
    jr @+$0c

    add b
    ld b, b
    add h
    ld b, h
    ld [$e010], sp
    ld a, [bc]
    nop
    ld hl, sp+$08
    db $10
    jr nz, @+$52

    adc b
    ld a, [bc]
    ld b, b
    db $fc
    ld b, h
    ld c, b
    ld d, b
    ld b, b
    inc a
    ld a, [bc]
    nop
    add d
    add d
    ld b, d
    inc b
    ld [$0a30], sp
    nop
    inc a
    ld h, h
    sub h
    inc c
    ld [$0a70], sp
    db $10
    ldh a, [rNR41]
    db $fc
    jr nz, jr_01b_76fd

    ret nz

    ld a, [bc]
    nop
    and h
    and h
    inc b
    ld [$6010], sp
    ld a, [bc]
    nop
    ld a, h
    nop
    cp $10
    db $10
    ld h, b
    nop
    ld c, d
    ld b, b
    ld b, b
    ld [hl], b
    ld c, h
    ld b, b
    ld b, b
    ld a, [bc]
    nop
    ld c, b
    ld c, b
    ld c, b
    ld b, h
    add h

jr_01b_76fd:
    add d
    ld a, [bc]
    ld b, b
    ld b, b
    ld a, [hl]
    ld b, b
    ld b, b
    ld b, b
    ld a, $0a
    nop
    db $fc
    inc b
    inc b
    ld [$6010], sp
    nop
    ld a, [bc]
    jr nc, @+$4a

    add h
    ld [bc], a
    nop
    nop
    ld a, [bc]
    db $10
    db $10
    cp $10
    ld d, h
    sub d
    db $10
    inc b
    ld a, [bc]
    ld b, h
    ld c, b
    ld c, b
    ld b, h
    add h
    add d
    inc b
    ld c, d
    ld b, h
    ld a, [hl]
    ld b, b
    ld b, b
    ld b, b
    ld a, $04
    ld a, [bc]
    db $fc
    inc b
    inc b
    ld [$6010], sp
    inc b
    ld a, [bc]
    inc [hl]
    ld c, b
    add h
    ld [bc], a
    nop
    nop
    inc b
    ld a, [de]
    inc d
    cp $10
    ld d, h
    sub d
    stop
    nop
    nop
    ld hl, sp+$28
    jr nc, jr_01b_776d

    ld b, b
    nop
    nop
    nop
    db $10
    jr nz, jr_01b_77b4

    and b
    jr nz, jr_01b_7757

jr_01b_7757:
    nop
    nop
    jr nz, @-$06

    adc b
    ld [$0070], sp
    nop
    nop
    nop
    ld [hl], b
    jr nz, jr_01b_7785

    ld hl, sp+$00
    nop
    nop
    db $10
    ld hl, sp+$30
    ld d, b

jr_01b_776d:
    sub b
    nop
    nop
    nop
    ld b, b
    ld hl, sp+$48
    ld d, b
    ld b, b
    nop
    nop
    nop
    nop
    ld [hl], b
    db $10
    db $10
    ld hl, sp+$00
    nop
    nop
    ldh a, [rNR10]
    ldh a, [rNR10]

jr_01b_7785:
    ldh a, [rP1]
    nop
    nop
    nop
    xor b
    xor b
    ld [$5e70], sp
    ld e, [hl]
    ld b, e
    ld b, e
    sbc b
    sbc b
    xor l
    and l
    cp l
    and l
    sbc c
    sbc c
    ld b, e
    ld b, d
    ld e, [hl]
    ld e, h
    ld a, d
    ld a, d
    jp nz, $19c2

    add hl, de
    xor l
    and l
    cp l
    and l
    sbc c
    sbc c
    jp nz, Jump_01b_7a42

    ld a, [hl-]
    ld e, b
    ld d, b
    ld e, b
    ld d, b
    ld e, b
    ld d, b

jr_01b_77b4:
    ld e, b
    ld d, b
    ld e, b
    ld d, b
    ld e, b
    ld d, b
    ld e, b
    ld d, b
    ld e, b
    ld d, b
    ld a, [de]
    ld a, [bc]
    ld a, [de]
    ld a, [bc]
    ld a, [de]
    ld a, [bc]
    ld a, [de]
    ld a, [bc]
    ld a, [de]
    ld a, [bc]
    ld a, [de]
    ld a, [bc]
    ld a, [de]
    ld a, [bc]
    ld a, [de]
    ld a, [bc]
    ld c, $0e
    dec bc
    dec bc
    jr c, jr_01b_780c

    dec l
    dec h
    db $fd
    push hl
    sbc c
    sbc c
    jp Jump_01b_5ec2


    ld e, h
    ld [hl], b
    ld [hl], b
    ret nc

    ret nc

    inc e
    inc e
    xor h
    and h
    cp a
    and a
    sbc c
    sbc c
    jp Jump_01b_7a43


    ld a, [hl-]
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld e, [hl]
    ld e, h
    jp $99c2


    sbc c
    db $ed
    push hl
    dec a
    dec h
    jr c, @+$3a

    dec bc
    dec bc

jr_01b_780c:
    ld c, $0e
    ld a, d
    ld a, [hl-]
    jp $9943


    sbc c
    xor a
    and a
    cp h
    and h
    inc e
    inc e
    ret nc

    ret nc

    ld [hl], b
    ld [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    ld e, [hl]
    ld e, h
    jp $99c2


    sbc c
    xor l
    and l
    cp l
    and l
    jr jr_01b_7852

    jp $3ec3


    ld a, $3e
    ld a, $c3
    jp Jump_000_1818


    xor l
    and l
    cp l
    and l
    sbc c
    sbc c
    jp Jump_01b_5ec2


    ld e, h
    ld bc, $4081
    ld b, c

jr_01b_7852:
    ld b, d
    ld b, e
    ld b, h
    ld b, l
    rst $38
    nop
    rst $38
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add c
    ld bc, $0181
    add a
    rlca
    add l
    inc b
    cp [hl]
    ld a, $b2
    ld [hl+], a
    and c
    add hl, hl
    sub c
    dec d
    sub b
    ld [de], a
    adc b
    add hl, bc
    adc b
    ld [$0484], sp
    add h
    inc b
    add d
    ld [bc], a
    add e
    inc bc
    add b
    nop
    add b
    nop
    add b
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    add c
    cp [hl]
    add b
    add b
    ret nz

    ld e, a
    ld b, b
    ld b, b
    ld h, b
    cpl
    and b
    and b
    or b
    sub a
    ret nc

    ld d, b
    ld e, b
    ld c, e
    jr z, jr_01b_78d2

    inc l
    inc h
    rst $30
    rst $30
    db $10
    db $10
    rra
    rrca
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld hl, sp-$08
    inc b
    inc b
    inc b
    inc b
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    ld [$01f2], sp
    inc b
    ld [de], a
    jp hl


    dec b
    inc de

jr_01b_78d2:
    ld a, [hl+]
    sub $1c
    inc l
    ld a, b
    or b
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    cp $01
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld a, [bc]
    ld sp, $4912
    ld a, [hl+]
    sbc c
    ld d, d
    ld sp, $61a2
    ld b, d
    pop bc
    add d
    add c
    add d
    add c
    ld b, d
    ld b, c
    ld b, d
    ld b, c
    ld [hl+], a
    ld hl, $2122
    ld [de], a
    ld de, $f1f2
    ld b, d
    ld b, c
    jp nz, Jump_000_02c1

    ld bc, $01fe
    nop
    rst $38
    rst $38
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    sbc a
    rrca
    sub b
    jr @-$66

    ld d, $8c
    add hl, bc
    adc h
    ld [$0486], sp
    add [hl]
    inc b
    add e
    ld [bc], a
    add e
    ld [bc], a
    add c
    ld bc, $0181
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    ld h, b
    inc bc
    dec de
    inc bc
    rlca
    nop
    ld bc, $0000
    add b
    nop
    rst $38
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $fe
    ld bc, $0103
    dec b
    nop
    ld [$1000], sp
    add b
    and b
    add b
    ret nz

    nop
    add b
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    cp $01
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    add d
    add c
    add d
    add c
    ld b, d
    ld b, c
    ld b, d
    ld b, c
    ld [hl+], a
    ld hl, $2122
    ld [de], a
    ld de, $11f2
    ld [c], a
    pop hl
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    cp $01
    nop
    rst $38
    rst $38
    nop
    add l
    inc bc
    or [hl]
    ld c, $bd
    inc bc
    cp [hl]
    inc bc
    cp e
    inc b
    cp a
    nop
    cp a
    nop
    or a
    ld c, $a5
    inc de
    or a
    ld c, $bf
    nop
    cp a
    nop
    cp a
    nop
    cp l
    inc bc
    cp c
    inc b
    cp l
    inc bc
    cp a
    nop
    cp a
    nop
    cp a
    nop
    cp a
    nop
    cp a
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    db $10
    ld h, b
    scf
    jr c, jr_01b_7a6e

    ld h, b
    cp a
    ldh [$ef], a
    sub b
    ld a, a
    add b
    rst $38
    nop
    rst $38

jr_01b_7a19:
    rlca
    cp c
    ld e, b
    ldh [rNR41], a
    rst $38
    jr nz, jr_01b_7a19

    rra
    rst $38
    rlca
    rst $38
    add b
    ld l, a
    ret nc

    ei
    add h
    rst $18
    inc h
    push af
    rra
    ld [$b11b], a
    ld [hl], c
    ld [$ff1b], a
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop

Jump_01b_7a42:
    rst $38

Jump_01b_7a43:
    ld bc, $72fe
    xor l
    sbc h
    ld b, l
    inc a
    ld hl, sp-$01
    rlca
    nop
    add e
    ld a, h
    adc d
    add a
    adc e
    add a
    bit 0, [hl]
    rst $38
    ccf
    xor $22
    ld a, a
    sbc a
    rst $38
    nop
    rst $38
    nop
    cp a
    ret nz

    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    cp $01
    ld [bc], a
    ld bc, $01fa

jr_01b_7a6e:
    ld a, [$fa01]
    ld bc, $01fa
    ld a, [$fa81]
    add c
    jp z, $aaf1

    reti


    sub $cd
    cp d
    ret


    jp z, $faf1

    add c
    ld a, [$fa01]
    ld bc, $81fa
    ld a, [$fa01]
    ld bc, $01fa
    ld a, [$fa01]
    ld bc, $01fe
    nop
    rst $38
    rst $38
    nop
    add b
    nop
    add b
    nop
    adc a
    rrca
    sub d
    db $10
    sub b
    db $10
    sub h
    db $10
    adc a
    rrca
    sbc a
    db $10
    sbc a
    db $10
    sbc a
    db $10
    sbc a
    db $10
    sbc a
    ld de, $119f
    sbc a
    ld de, $0f8f
    sbc d
    db $10
    sbc d
    db $10
    sbc d
    db $10
    adc a
    rrca
    add b
    nop
    add b
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    cp $fe
    ld de, $8501
    ld bc, $0121
    rst $38
    rst $38
    ei
    ld de, $11fb
    ei
    ld de, $f1fb
    xor e
    ld bc, $01ab
    xor e
    ld bc, $0faf
    cp a
    db $10
    cp a
    db $10
    cp a
    db $10
    rst $28
    rst $28
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    rst $28
    rst $28
    ld a, [de]
    db $10
    ld a, [de]
    db $10
    ld a, [de]
    db $10
    rra
    rra
    ld bc, $0101
    ld bc, $0101
    pop af
    pop af
    ldh a, [rNR10]
    ldh a, [rNR10]
    ldh a, [rNR10]
    rst $38
    rra
    rst $38
    ld bc, $01ff
    rst $38
    ld bc, $fefe
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    cp $01
    ld [bc], a
    ld bc, $0102
    ld [c], a
    pop hl
    or d
    ld de, $11b2
    or d
    ld de, $11b2
    or d
    ld de, $11b2
    or d
    ld de, $e1e2
    ld [de], a
    ld de, $1112
    ld [de], a
    ld de, $1112
    ld [de], a
    ld de, $1112
    ld [de], a
    ld de, $e1e2
    ld [bc], a
    ld bc, $0102
    cp $01
    nop
    rst $38
    rst $38
    nop
    add b
    nop
    add c
    ld bc, $0181
    add c
    ld bc, $0181
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add e
    inc bc
    add h
    inc b
    add l
    dec b
    add e
    inc bc
    add b
    nop
    add c
    ld bc, $0282
    add l
    inc b
    adc d
    add hl, bc
    adc l
    dec bc
    add [hl]
    ld b, $ff
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    ldh [$e0], a
    db $10
    db $10
    ld c, b
    ld [$2404], sp
    add d
    sub d
    ld b, c
    ld c, c
    jr nz, jr_01b_7bbe

    db $10
    ld [de], a
    ld [$1c09], sp
    inc d
    xor d
    and [hl]
    ld e, a
    ld c, c
    halt
    ld d, d
    cp h
    and h
    ld a, b
    ld e, b
    and h
    ld h, h
    ld e, d
    jp c, $9292

    inc c
    inc c
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    rrca
    rrca

jr_01b_7bbe:
    ld de, $2511
    ld hl, $4941
    add d
    sub d
    add h
    inc h
    adc b
    ret z

    ld [hl], b
    ld d, b
    jr nz, jr_01b_7bee

    ld de, $0a91
    ld c, d
    dec h
    dec h
    sub l
    sub l
    ld c, d
    ld c, d
    dec a
    dec [hl]
    ld c, d
    ld c, h
    or l
    or [hl]
    sub d
    sub e
    ld h, c
    ld h, c
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    cp $01
    ld [bc], a
    ld bc, $0102

jr_01b_7bee:
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    add d
    add c
    ld b, d
    ld b, c
    ld b, d
    ld b, c
    add d
    add c
    ld [bc], a
    ld bc, $0102
    add d
    add c
    ld b, d
    ld b, c
    and d
    ld hl, $a162
    jp nz, $fec1

    ld bc, $ff00
    rst $38
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add c
    ld bc, $0282
    add [hl]
    ld [bc], a
    add l
    dec b
    adc l
    dec b
    sbc [hl]
    ld a, [bc]
    sub d
    ld d, $91
    rla
    adc e
    add hl, bc
    add l
    inc b
    add d
    ld [bc], a
    add c
    ld bc, $0080
    add b
    nop
    add b
    nop
    add b
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    rra
    db $f4
    ld [hl], h
    cp [hl]
    sbc [hl]
    ld [hl], h
    ld d, h
    ret nc

    ldh a, [rSVBK]
    ld d, b
    ld sp, $b311
    sub e
    or c
    sub c
    ld [hl], d
    ld d, d
    halt
    ld d, d
    or a
    or c
    or e
    or b
    pop de
    ld d, b
    rst $18
    trap $74
    ld a, b
    ld [$0030], sp
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38

jr_01b_7c79:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh a, [$f0]
    dec bc
    dec bc
    inc c
    inc c
    ld a, [bc]
    ld a, [bc]
    inc de
    inc de
    and b
    and b
    call z, $8ccc
    adc h
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    sbc c
    sbc c
    jp z, $e44a

    db $e4
    jr c, jr_01b_7cb8

    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    cp $01
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $8182
    ld b, d
    ld b, c

jr_01b_7cb8:
    ld [hl+], a
    ld hl, $1112
    ld a, [bc]
    add hl, bc
    ld a, [bc]
    add hl, bc
    ld [de], a
    ld de, $2122
    ld b, d
    ld b, c
    add d
    add c
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    cp $01
    nop
    rst $38
    rst $38
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    adc a
    rra
    adc h
    ld [$0484], sp
    sbc h
    jr jr_01b_7c79

    db $10
    adc b
    ld [$1198], sp
    sub b
    db $10

jr_01b_7cf0:
    sbc b
    db $10
    adc c
    ld [$1090], sp
    sub c
    ld de, $0c88
    sbc b
    ld [$1197], sp
    sbc a
    ld e, $80
    nop
    add b
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld hl, sp-$10
    rrca
    rrca
    nop
    nop
    nop
    jr jr_01b_7d19

jr_01b_7d19:
    ccf
    db $10
    rst $38
    nop
    db $fc
    nop
    add hl, sp
    nop
    sbc a
    nop
    cp a
    add h
    cp [hl]
    ret nz

    rst $18
    nop
    add a
    nop
    nop
    db $fc
    ld hl, sp-$01
    rlca
    rra
    nop
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    ld bc, $0301
    ld [bc], a
    ld b, $04
    db $e4
    call nz, Call_000_3c3c
    inc b
    inc b
    inc b
    inc b
    dec b
    call c, $fc05
    add hl, hl
    ld hl, sp+$09
    ld hl, sp+$29
    jr jr_01b_7cf0

    ld [hl], b
    inc d
    di
    rra
    rla
    dec c
    add hl, de
    rla
    rrca
    rst $38
    ret nz

    rst $38
    ccf
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    cp $01
    ld [bc], a
    ld bc, $c1e2
    ld [hl], d
    ld hl, $1172
    ld d, d
    ld sp, $31d2
    jp nc, $9231

    ld [hl], c
    or d
    ld h, c
    and d

jr_01b_7d7d:
    ld h, c
    and d
    ld h, c
    and d
    ld h, c
    and d
    ld h, c
    and d
    ld h, c
    and d
    ld h, c
    and d
    pop hl
    ld h, d
    pop hl
    and d
    ld h, c
    ld b, d
    pop bc
    add d
    add c
    ld [bc], a
    ld bc, $01fe
    nop
    rst $38
    rst $38
    nop
    add b
    nop
    add b
    nop
    add [hl]
    rrca
    adc e
    add hl, bc
    adc c
    rrca
    adc a
    add hl, bc
    adc c
    rrca
    adc [hl]
    dec bc
    adc h
    ld c, $88
    dec c
    sub b
    dec de
    and d
    dec [hl]
    cp h
    jr c, @-$72

    ld [$088c], sp
    adc h
    ld [$088c], sp
    cp h
    ld [$1faf], sp
    or b
    rrca
    cp a
    nop
    cp a
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    jr jr_01b_7de8

    inc h
    inc a
    ld b, d
    ld h, [hl]
    add c
    db $db
    jr jr_01b_7d7d

    inc h
    ld b, d
    nop
    and l
    ld b, c
    inc h
    add d
    inc h
    nop
    rst $20
    nop
    nop
    inc a
    jr jr_01b_7e65

    inc h

jr_01b_7de8:
    ld h, [hl]
    ld b, d
    ld a, [hl]
    ld h, d
    ld a, [hl]
    ld b, d
    rst $38
    rst $38
    inc h
    jp $00c3


    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $8200
    add c
    ld b, e
    rst $00
    ld hl, $1260
    or c
    dec c
    db $db
    ld b, a
    xor a
    dec a
    inc e
    ld [hl-], a
    ld de, $1335
    dec sp
    rla
    jr nc, @+$12

    ccf
    db $10
    db $f4
    ei
    ld c, $f1
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    cp $01
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $4142
    ld [c], a
    ld b, c
    ld d, d
    pop hl
    ld [$faf1], a
    ld sp, hl
    ld d, d
    pop hl
    ld [$f2f1], a
    ld sp, hl
    ld a, [$f2f9]
    pop hl
    ld [$f2f1], a
    ld sp, hl
    ld a, [$e2f9]
    ld b, c
    ld a, [$ea41]
    pop af
    ld a, [de]
    pop hl
    ld a, [$fe01]
    ld bc, $ff00
    rst $38
    nop
    add b
    nop
    add b
    nop
    add b
    nop

Jump_01b_7e60:
    add b
    nop
    add b
    nop
    add b

jr_01b_7e65:
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $ff00
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_01b_7ecb:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    cp $01
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $01fe
    nop
    rst $38
    rst $38
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add d
    ld [bc], a
    add l
    dec b
    adc l
    add hl, bc
    adc c
    add hl, bc
    sub b
    jr jr_01b_7ecb

    db $10
    sbc b
    db $10
    sbc h
    db $10
    adc [hl]
    ld [$0c8b], sp
    add h
    rlca
    cp a
    inc bc
    sbc [hl]
    ld bc, $0080
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    inc c
    add hl, bc
    ld de, $1810
    jr jr_01b_7f84

    jr z, jr_01b_7f80

    ld hl, $c6c3
    ld b, c
    ld b, c
    ld b, b
    ld b, b
    ld [hl], l
    ld [hl], b
    add hl, de
    db $10
    rra
    db $10
    sbc a
    inc e
    di
    rrca
    rlca
    db $fc
    rst $38
    ld hl, sp+$00
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_01b_7f80:
    nop
    nop
    ret nz

    ret nz

jr_01b_7f84:
    ld h, b
    jr nz, @+$12

    db $10
    jr nc, jr_01b_7fba

    add hl, hl
    add hl, hl
    adc c
    add hl, bc
    add a
    rst $00
    inc b
    inc b
    inc b
    inc b
    ld e, h
    inc e
    jr nc, jr_01b_7fa8

    ldh a, [rNR10]
    di
    ld [hl], b
    sbc [hl]
    pop hl
    pop bc
    ld a, a
    rst $38
    ld a, $00
    nop
    rst $38
    nop
    nop
    rst $38

jr_01b_7fa8:
    cp $01
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $8182

jr_01b_7fba:
    ld b, d
    ld b, c
    ld h, d
    ld hl, $2122
    ld [hl-], a
    ld de, $1132
    ld [hl-], a
    ld de, $1172
    ld [c], a
    ld hl, $61a2
    ld b, d
    pop bc
    ld a, [$f281]
    ld bc, $0102
    cp $01
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
