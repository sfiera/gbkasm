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

SECTION "ROM Bank $01d", ROMX

    jp Jump_01d_4088


    jp Jump_01d_40f4


    jp Jump_01d_4021


    jp Jump_01d_4038


    jp Jump_01d_4059


    jp Jump_01d_405d


    jp Jump_01d_4067


    jp Jump_01d_4071


    jp Jump_01d_407a


    jp Jump_01d_49b9


    jp Jump_01d_49c3


Jump_01d_4021:
    push hl
    ld hl, $511a
    cp [hl]
    jr nc, jr_01d_4036

    ld [$de90], a
    xor a
    ld [$de9b], a
    ld [$deff], a
    dec a
    ld [$de94], a

jr_01d_4036:
    pop hl
    ret


Jump_01d_4038:
    push bc
    push hl
    ld b, $00
    ld c, a
    or a
    jr z, jr_01d_404e

    ld hl, $518b
    add hl, bc
    ld b, [hl]
    ld a, [$de93]
    or a
    jr z, jr_01d_404e

    cp b
    jr c, jr_01d_4056

jr_01d_404e:
    ld a, c
    ld [$de92], a
    ld a, b
    ld [$de93], a

jr_01d_4056:
    pop hl
    pop bc
    ret


Jump_01d_4059:
    ld [$df00], a
    ret


Jump_01d_405d:
    ld a, [$de90]
    cp $80
    ld a, $01
    ret nz

    xor a
    ret


Jump_01d_4067:
    ld a, [$de92]
    cp $80
    ld a, $01
    ret nz

    xor a
    ret


Jump_01d_4071:
    ld a, [$df02]
    xor $01
    ld [$df02], a
    ret


Jump_01d_407a:
    push bc
    push af
    and $07
    ld b, a
    swap b
    or b
    ld [$df01], a
    pop af
    pop bc
    ret


Jump_01d_4088:
    xor a
    ldh [rNR52], a
    ld a, $80
    ldh [rNR52], a
    ld a, $77
    ldh [rNR50], a
    ld a, $ff
    ldh [rNR51], a
    ld a, $1c
    ld [$de91], a
    ld a, $80
    ld [$de90], a
    ld [$de92], a
    ld a, $77
    ld [$df01], a
    xor a
    ld [$de9c], a
    ld [$df63], a
    ld [$de9b], a
    ld [$deff], a
    ld [$df00], a
    ld [$df02], a
    dec a
    ld [$de94], a
    ld de, $0001
    ld bc, $0000

jr_01d_40c6:
    ld hl, $de9d
    add hl, bc
    ld [hl], d
    ld hl, $dea1
    add hl, bc
    ld [hl], d
    ld hl, $dec3
    add hl, bc
    ld [hl], d
    ld hl, $dedb
    add hl, bc
    ld [hl], d
    ld hl, $decf
    add hl, bc
    ld [hl], d
    inc c
    ld a, c
    cp $04
    jr nz, jr_01d_40c6

    ld hl, $4c11
    ld bc, $df03
    ld d, $08

jr_01d_40ed:
    ld a, [hl+]
    ld [bc], a
    inc bc
    dec d
    jr nz, jr_01d_40ed

    ret


Jump_01d_40f4:
    call Call_01d_42af
    call Call_01d_4127
    ld hl, $6c03
    call Call_000_3f80
    ld a, [$de91]
    ldh [$80], a
    ld [$2000], a
    ld a, [$df02]
    cp $00
    jr z, jr_01d_4114

    call Call_01d_4975
    jr jr_01d_4120

jr_01d_4114:
    call Call_01d_42b0
    call Call_01d_4315
    call Call_01d_437a
    call Call_01d_43d9

jr_01d_4120:
    call Call_01d_486e
    call Call_01d_49a6
    ret


Call_01d_4127:
    ld a, [$de90]
    rla
    jr c, jr_01d_413e

    call Call_01d_4156
    ld a, [$de90]
    call Call_01d_4197
    ld a, [$de90]
    or $80
    ld [$de90], a

jr_01d_413e:
    ld a, [$de92]
    rla
    jr c, jr_01d_4155

    ld a, [$de92]
    ld hl, $6c00
    call Call_000_3f80
    ld a, [$de92]
    or $80
    ld [$de92], a

jr_01d_4155:
    ret


Call_01d_4156:
    ld a, [$de9c]
    ld d, a
    xor a
    ld [$de9d], a
    bit 0, d
    jr nz, jr_01d_416a

    ld a, $08
    ldh [rNR12], a
    swap a
    ldh [rNR14], a

jr_01d_416a:
    xor a
    ld [$de9e], a
    bit 1, d
    jr nz, jr_01d_417a

    ld a, $08
    ldh [rNR22], a
    swap a
    ldh [rNR24], a

jr_01d_417a:
    xor a
    ld [$dea0], a
    bit 3, d
    jr nz, jr_01d_418a

    ld a, $08
    ldh [rNR42], a
    swap a
    ldh [rNR44], a

jr_01d_418a:
    xor a
    ld [$de9f], a
    bit 2, d
    jr nz, jr_01d_4196

    ld a, $00
    ldh [rNR32], a

jr_01d_4196:
    ret


Call_01d_4197:
    push af
    ld c, a
    ld b, $00
    ld hl, $511b
    add hl, bc
    ld a, [hl]
    ld [$de91], a
    ldh [$80], a
    ld [$2000], a
    pop af
    add a
    ld c, a
    ld b, $00
    ld hl, $512e
    add hl, bc
    ld e, [hl]
    inc hl
    ld h, [hl]
    ld l, e
    ld e, [hl]
    inc hl
    ld b, h
    ld c, l
    rr e
    jr nc, jr_01d_41f6

    ld a, [bc]
    inc bc
    ld [$dea5], a
    ld [$dead], a
    ld a, [bc]
    inc bc
    ld [$dea6], a
    ld [$deae], a
    ld a, $01
    ld [$decb], a
    ld [$de9d], a
    xor a
    ld [$dea1], a
    ld [$defa], a
    ld [$decf], a
    ld [$deef], a
    ld [$dedb], a
    ld a, [$4c11]
    ld [$df03], a
    ld a, [$4c12]
    ld [$df04], a
    ld a, $08
    ld [$ded7], a

jr_01d_41f6:
    rr e
    jr nc, jr_01d_4233

    ld a, [bc]
    inc bc
    ld [$dea7], a
    ld [$deaf], a
    ld a, [bc]
    inc bc
    ld [$dea8], a
    ld [$deb0], a
    ld a, $01
    ld [$decc], a
    ld [$de9e], a
    xor a
    ld [$dea2], a
    ld [$defb], a
    ld [$ded0], a
    ld [$def0], a
    ld [$dedc], a
    ld a, [$4c13]
    ld [$df05], a
    ld a, [$4c14]
    ld [$df06], a
    ld a, $08
    ld [$ded8], a

jr_01d_4233:
    rr e
    jr nc, jr_01d_4270

    ld a, [bc]
    inc bc
    ld [$dea9], a
    ld [$deb1], a
    ld a, [bc]
    inc bc
    ld [$deaa], a
    ld [$deb2], a
    ld a, $01
    ld [$decd], a
    ld [$de9f], a
    xor a
    ld [$dea3], a
    ld [$defc], a
    ld [$ded1], a
    ld [$def1], a
    ld [$dedd], a
    ld a, [$4c15]
    ld [$df07], a
    ld a, [$4c16]
    ld [$df08], a
    ld a, $40
    ld [$ded9], a

jr_01d_4270:
    rr e
    jr nc, jr_01d_42aa

    ld a, [bc]
    inc bc
    ld [$deab], a
    ld [$deb3], a
    ld a, [bc]
    inc bc
    ld [$deac], a
    ld [$deb4], a
    ld a, $01
    ld [$dece], a
    ld [$dea0], a
    xor a
    ld [$dea4], a
    ld [$ded2], a
    ld [$def2], a
    ld [$dede], a
    ld a, [$4c17]
    ld [$df09], a
    ld a, [$4c18]
    ld [$df0a], a
    ld a, $40
    ld [$deda], a

jr_01d_42aa:
    xor a
    ld [$df02], a
    ret


Call_01d_42af:
    ret


Call_01d_42b0:
    ld a, [$de9d]
    or a
    jr z, jr_01d_4305

    ld a, [$dec7]
    cp $00
    jr z, jr_01d_42df

    ld a, [$ded3]
    dec a
    ld [$ded3], a
    jr nz, jr_01d_42df

    ld a, [$decb]
    cp $01
    jr z, jr_01d_42df

    ld a, [$de9c]
    bit 0, a
    jr nz, jr_01d_42df

    ld hl, $ff12
    ld a, [$ded7]
    ld [hl+], a
    inc hl
    ld a, $80
    ld [hl], a

jr_01d_42df:
    ld a, [$decb]
    dec a
    ld [$decb], a
    jr nz, jr_01d_42ff

    ld a, [$dea6]
    ld h, a
    ld a, [$dea5]
    ld l, a
    ld bc, $0000
    call Call_01d_441f
    ld a, [$de9d]
    or a
    jr z, jr_01d_4305

    call Call_01d_471c

jr_01d_42ff:
    ld a, $00
    call Call_01d_4862
    ret


jr_01d_4305:
    ld a, [$de9c]
    bit 0, a
    jr nz, jr_01d_4314

    ld a, $08
    ldh [rNR12], a
    swap a
    ldh [rNR14], a

jr_01d_4314:
    ret


Call_01d_4315:
    ld a, [$de9e]
    or a
    jr z, jr_01d_436a

    ld a, [$dec8]
    cp $00
    jr z, jr_01d_4344

    ld a, [$ded4]
    dec a
    ld [$ded4], a
    jr nz, jr_01d_4344

    ld a, [$decc]
    cp $01
    jr z, jr_01d_4344

    ld a, [$de9c]
    bit 1, a
    jr nz, jr_01d_4344

    ld hl, $ff17
    ld a, [$ded8]
    ld [hl+], a
    inc hl
    ld a, $80
    ld [hl], a

jr_01d_4344:
    ld a, [$decc]
    dec a
    ld [$decc], a
    jr nz, jr_01d_4364

    ld a, [$dea8]
    ld h, a
    ld a, [$dea7]
    ld l, a
    ld bc, $0001
    call Call_01d_441f
    ld a, [$de9e]
    or a
    jr z, jr_01d_436a

    call Call_01d_4762

jr_01d_4364:
    ld a, $01
    call Call_01d_4862
    ret


jr_01d_436a:
    ld a, [$de9c]
    bit 1, a
    jr nz, jr_01d_4379

    ld a, $08
    ldh [rNR22], a
    swap a
    ldh [rNR24], a

jr_01d_4379:
    ret


Call_01d_437a:
    ld a, [$de9f]
    or a
    jr z, jr_01d_43c9

    ld a, [$dec9]
    cp $00
    jr z, jr_01d_43a3

    ld a, [$ded5]
    dec a
    ld [$ded5], a
    jr nz, jr_01d_43a3

    ld a, [$de9c]
    bit 2, a
    jr nz, jr_01d_43a3

    ld a, [$decd]
    cp $01
    jr z, jr_01d_43a3

    ld a, [$ded9]
    ldh [rNR32], a

jr_01d_43a3:
    ld a, [$decd]
    dec a
    ld [$decd], a
    jr nz, jr_01d_43c3

    ld a, [$deaa]
    ld h, a
    ld a, [$dea9]
    ld l, a
    ld bc, $0002
    call Call_01d_441f
    ld a, [$de9f]
    or a
    jr z, jr_01d_43c9

    call Call_01d_47a4

jr_01d_43c3:
    ld a, $02
    call Call_01d_4862
    ret


jr_01d_43c9:
    ld a, [$de9c]
    bit 2, a
    jr nz, jr_01d_43d8

    ld a, $00
    ldh [rNR32], a
    ld a, $80
    ldh [rNR34], a

jr_01d_43d8:
    ret


Call_01d_43d9:
    ld a, [$dea0]
    or a
    jr z, jr_01d_440b

    ld a, [$dece]
    dec a
    ld [$dece], a
    jr nz, jr_01d_4401

    ld a, [$deac]
    ld h, a
    ld a, [$deab]
    ld l, a
    ld bc, $0003
    call Call_01d_441f
    ld a, [$dea0]
    or a
    jr z, jr_01d_440b

    call Call_01d_4812
    jr jr_01d_441e

jr_01d_4401:
    ld a, [$deff]
    or a
    jr z, jr_01d_441e

    call Call_01d_4841
    ret


jr_01d_440b:
    ld a, [$de9c]
    bit 3, a
    jr nz, jr_01d_441e

    xor a
    ld [$deff], a
    ld a, $08
    ldh [rNR42], a
    swap a
    ldh [rNR44], a

jr_01d_441e:
    ret


Call_01d_441f:
Jump_01d_441f:
    ld a, [hl+]
    push hl
    push af
    cp $d0
    jr c, jr_01d_4497

    sub $d0
    add a
    ld e, a
    ld d, $00
    ld hl, $4437
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld h, d
    ld l, e
    pop af
    jp hl


    and d
    ld b, l
    xor l
    ld b, l
    xor l
    ld b, l
    xor l
    ld b, l
    xor l
    ld b, l
    xor l
    ld b, l
    xor l
    ld b, l
    push bc
    ld b, l
    call $d545
    ld b, l
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    sbc $45
    ld sp, hl
    ld b, l
    rlca
    ld b, [hl]
    inc de
    ld b, [hl]
    jr z, jr_01d_449f

    ld b, d
    ld b, [hl]
    ld c, c
    ld b, [hl]
    ld h, b
    ld b, [hl]
    ld [hl], c
    ld b, [hl]
    ld a, [hl]
    ld b, [hl]
    adc e
    ld b, [hl]
    sbc b
    ld b, [hl]
    xor b
    ld b, [hl]
    or l
    ld b, [hl]
    jp nz, $d446

    ld b, [hl]
    pop hl
    ld b, [hl]
    xor $46
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]
    db $fc
    ld b, [hl]

jr_01d_4497:
    push af
    ld a, [hl]
    ld e, a
    ld hl, $dea1
    add hl, bc
    ld a, [hl]

jr_01d_449f:
    cp $80
    jr z, jr_01d_44ba

    ld [hl], $01
    xor a
    ld hl, $deeb
    add hl, bc
    ld [hl], a
    ld hl, $def3
    add hl, bc
    ld [hl], a
    ld hl, $dee7
    add hl, bc
    ld a, [hl]
    ld hl, $dee3
    add hl, bc
    ld [hl], a

jr_01d_44ba:
    pop af
    push de
    ld hl, $dedf
    add hl, bc
    ld d, [hl]
    and $0f
    inc a
    cp d
    jr nc, jr_01d_44ca

    ld e, a
    ld a, d
    ld d, e

jr_01d_44ca:
    ld e, a

jr_01d_44cb:
    dec d
    jr z, jr_01d_44d1

    add e
    jr jr_01d_44cb

jr_01d_44d1:
    ld hl, $decb
    add hl, bc
    ld [hl], a
    pop de
    ld d, a
    ld a, e
    cp $d9
    ld a, d
    jr z, jr_01d_4505

    ld e, a
    ld hl, $decf
    add hl, bc
    ld a, [hl]
    cp $08
    ld d, a
    ld a, e
    jr z, jr_01d_4505

    push hl
    push bc
    ld b, $00
    ld c, a
    ld hl, $0000

jr_01d_44f2:
    add hl, bc
    dec d
    jr nz, jr_01d_44f2

    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld a, l
    pop bc
    pop hl

jr_01d_4505:
    ld hl, $ded3
    add hl, bc
    ld [hl], a
    pop af
    and $f0
    ld hl, $dec7
    add hl, bc
    ld [hl], a
    or a
    jr nz, jr_01d_4518

    jp Jump_01d_4598


jr_01d_4518:
    swap a
    dec a
    ld h, a
    ld a, $03
    cp c
    ld a, h
    jr z, jr_01d_4524

    jr jr_01d_456e

jr_01d_4524:
    push af
    ld hl, $debf
    add hl, bc
    ld a, [hl]
    ld d, a
    sla a
    add d
    sla a
    sla a
    sla a
    ld e, a
    pop af
    ld hl, $4d6d
    add a
    ld d, c
    ld c, a
    add hl, bc
    ld c, e
    add hl, bc
    ld c, d
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]
    ld d, a
    ld a, [$de94]
    and $77
    or d
    ld [$de94], a
    ld de, $debb
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld b, [hl]
    inc hl
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    ld b, $00
    ld a, l
    ld d, h
    ld hl, $defd
    ld [hl+], a
    ld [hl], d
    ld a, $01
    ld [$deff], a
    jr jr_01d_4598

jr_01d_456e:
    ld hl, $deb5
    add hl, bc
    add hl, bc
    push hl
    ld hl, $debf
    add hl, bc
    ld e, [hl]
    ld d, $00
    ld hl, $4c19
    add hl, de
    add a
    ld e, [hl]
    add e
    ld hl, $dedb
    add hl, bc
    ld e, [hl]
    add e
    add e
    ld e, a
    ld hl, $4c21
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    call Call_01d_495c
    pop hl
    ld a, e
    ld [hl+], a
    ld [hl], d

Jump_01d_4598:
jr_01d_4598:
    pop de
    ld hl, $dea5
    add hl, bc
    add hl, bc
    ld [hl], e
    inc hl
    ld [hl], d
    ret


    pop hl
    ld a, [hl+]
    push hl
    ld hl, $dedf
    add hl, bc
    ld [hl], a
    jp Jump_01d_4718


    and $07
    dec a
    ld hl, $debf
    add hl, bc
    push af
    ld a, c
    cp $02
    jr nz, jr_01d_45c0

    pop af
    inc a
    ld [hl], a
    jp Jump_01d_4718


jr_01d_45c0:
    pop af
    ld [hl], a
    jp Jump_01d_4718


    ld hl, $debf
    add hl, bc
    inc [hl]
    jp Jump_01d_4718


    ld hl, $debf
    add hl, bc
    dec [hl]
    jp Jump_01d_4718


    ld hl, $dea1
    add hl, bc
    ld [hl], $80
    jp Jump_01d_4718


    pop hl
    ld a, [hl+]
    push hl
    push bc
    inc c
    ld e, $ee

jr_01d_45e5:
    dec c
    jr z, jr_01d_45ed

    rlca
    rlc e
    jr jr_01d_45e5

jr_01d_45ed:
    ld d, a
    ld hl, $de94
    ld a, [hl]
    and e
    or d
    ld [hl], a
    pop bc
    jp Jump_01d_4718


    pop de
    push de
    dec de
    ld hl, $dead
    add hl, bc
    add hl, bc
    ld [hl], e
    inc hl
    ld [hl], d
    jp Jump_01d_4718


    pop hl
    ld hl, $dead
    add hl, bc
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp Jump_01d_441f


    pop de
    ld a, [de]
    inc de
    push af
    call Call_01d_4704
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    pop af
    ld [hl], a
    inc hl
    push de
    call Call_01d_470d
    jp Jump_01d_4718


    call Call_01d_4704
    dec hl
    ld a, [hl]
    dec a
    jr z, jr_01d_463a

    ld [hl-], a
    ld d, [hl]
    dec hl
    ld e, [hl]
    pop hl
    ld h, d
    ld l, e
    jp Jump_01d_441f


jr_01d_463a:
    dec hl
    dec hl
    call Call_01d_470d
    jp Jump_01d_4718


    pop hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp Jump_01d_441f


    call Call_01d_4704
    pop de
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld d, a
    ld e, b
    ld b, $00
    push de
    call Call_01d_470d
    jp Jump_01d_4718


    pop de
    call Call_01d_4704
    dec hl
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    inc de
    inc de
    push de
    call Call_01d_470d
    jp Jump_01d_4718


    pop de
    ld a, [de]
    inc de
    ld hl, $defa
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01d_441f


    pop de
    ld a, [de]
    inc de
    ld hl, $de96
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01d_441f


    pop de
    ld a, [de]
    inc de
    ld hl, $def7
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01d_441f


    pop de
    ld a, [de]
    inc de
    ld [$de9a], a
    ld a, $01
    ld [$de9b], a
    ld h, d
    ld l, e
    jp Jump_01d_441f


    pop de
    ld a, [de]
    inc de
    ld hl, $decf
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01d_441f


    pop de
    ld a, [de]
    inc de
    ld hl, $ded7
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01d_441f


    pop de
    ld a, [de]
    inc de
    ld hl, $dee3
    add hl, bc
    ld [hl], a
    ld hl, $dee7
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01d_441f


    pop de
    ld a, [de]
    inc de
    ld hl, $deef
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01d_441f


    pop de
    ld a, [de]
    inc de
    ld hl, $dedb
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01d_441f


    pop de
    ld a, [de]
    inc de
    ld hl, $dedb
    add hl, bc
    add [hl]
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01d_441f


    ld hl, $de9d
    add hl, bc
    ld [hl], $00
    pop hl
    ret


Call_01d_4704:
    ld hl, $df03
    add hl, bc
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ret


Call_01d_470d:
    ld d, h
    ld e, l
    ld hl, $df03
    add hl, bc
    add hl, bc
    ld [hl], e
    inc hl
    ld [hl], d
    ret


Jump_01d_4718:
    pop hl
    jp Jump_01d_441f


Call_01d_471c:
    ld a, [$de9c]
    bit 0, a
    jr nz, jr_01d_4751

    ld a, [$dec7]
    cp $00
    jr z, jr_01d_4752

    ld d, $00
    ld hl, $dea1
    ld a, [hl]
    cp $80
    jr z, jr_01d_473b

    ld a, [$def7]
    ldh [rNR12], a
    ld d, $80

jr_01d_473b:
    ld [hl], $02
    ld a, $08
    ldh [rNR10], a
    ld a, [$de96]
    ldh [rNR11], a
    ld a, [$deb5]
    ldh [rNR13], a
    ld a, [$deb6]
    or d
    ldh [rNR14], a

jr_01d_4751:
    ret


jr_01d_4752:
    ld hl, $dea1
    ld [hl], $00
    ld hl, $ff12
    ld a, $08
    ld [hl+], a
    inc hl
    swap a
    ld [hl], a
    ret


Call_01d_4762:
    ld a, [$de9c]
    bit 1, a
    jr nz, jr_01d_4793

    ld a, [$dec8]
    cp $00
    jr z, jr_01d_4794

    ld d, $00
    ld hl, $dea2
    ld a, [hl]
    cp $80
    jr z, jr_01d_4781

    ld a, [$def8]
    ldh [rNR22], a
    ld d, $80

jr_01d_4781:
    ld [hl], $02
    ld a, [$de97]
    ldh [rNR21], a
    ld a, [$deb7]
    ldh [rNR23], a
    ld a, [$deb8]
    or d
    ldh [rNR24], a

jr_01d_4793:
    ret


jr_01d_4794:
    ld hl, $dea2
    ld [hl], $00
    ld hl, $ff17
    ld a, $08
    ld [hl+], a
    inc hl
    swap a
    ld [hl], a
    ret


Call_01d_47a4:
    ld a, [$de9c]
    bit 2, a
    jr nz, jr_01d_47e8

    ld d, $00
    ld a, [$de9b]
    or a
    jr z, jr_01d_47bb

    xor a
    ldh [rNR30], a
    call Call_01d_47f2
    ld d, $80

jr_01d_47bb:
    ld a, [$dec9]
    cp $00
    jr z, jr_01d_47e9

    ld hl, $dea3
    ld a, [hl]
    cp $80
    jr z, jr_01d_47d4

    ld a, [$def9]
    ldh [rNR32], a
    xor a
    ldh [rNR30], a
    ld d, $80

jr_01d_47d4:
    ld [hl], $02
    xor a
    ldh [rNR31], a
    ld a, [$deb9]
    ldh [rNR33], a
    ld a, $80
    ldh [rNR30], a
    ld a, [$deba]
    or d
    ldh [rNR34], a

jr_01d_47e8:
    ret


jr_01d_47e9:
    ld hl, $dea1
    ld [hl], $00
    xor a
    ldh [rNR30], a
    ret


Call_01d_47f2:
    ld a, [$de9a]
    add a
    ld d, $00
    ld e, a
    ld hl, $4ccb
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld b, d
    ld de, $ff30

jr_01d_4804:
    ld a, [hl+]
    ld [de], a
    inc de
    inc b
    ld a, b
    cp $10
    jr nz, jr_01d_4804

    xor a
    ld [$de9b], a
    ret


Call_01d_4812:
    ld a, [$de9c]
    bit 3, a
    jr nz, jr_01d_4831

    ld a, [$deca]
    cp $00
    jr z, jr_01d_4832

    ld de, $ff20
    ld hl, $debb
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, [hl+]
    ld [de], a

jr_01d_4831:
    ret


jr_01d_4832:
    xor a
    ld [$deff], a
    ld hl, $ff21
    ld a, $08
    ld [hl+], a
    inc hl
    swap a
    ld [hl], a
    ret


Call_01d_4841:
    ld a, [$de9c]
    bit 3, a
    jr z, jr_01d_484e

    xor a
    ld [$deff], a
    jr jr_01d_4861

jr_01d_484e:
    ld hl, $defd
    ld a, [hl+]
    ld d, [hl]
    ld e, a
    ld a, [de]
    cp $ff
    jr nz, jr_01d_485b

    jr jr_01d_4832

jr_01d_485b:
    ldh [rNR43], a
    inc de
    ld a, d
    ld [hl-], a
    ld [hl], e

jr_01d_4861:
    ret


Call_01d_4862:
    push af
    ld b, $00
    ld c, a
    call Call_01d_48a0
    pop af
    call Call_01d_4913
    ret


Call_01d_486e:
    ld a, [$df01]
    ldh [rNR50], a
    ld a, [$de9c]
    or a
    ld hl, $de94
    ld a, [hl+]
    jr z, jr_01d_4890

    ld a, [$de9c]
    and $0f
    ld d, a
    swap d
    or d
    ld d, a
    xor $ff
    ld e, a
    ld a, [hl-]
    and d
    ld d, a
    ld a, [hl]
    and e
    or d

jr_01d_4890:
    ld d, a
    ld a, [$df00]
    xor $ff
    and $0f
    ld e, a
    swap e
    or e
    and d
    ldh [rNR51], a
    ret


Call_01d_48a0:
    ld hl, $deef
    add hl, bc
    ld a, [hl]
    cp $00
    jr z, jr_01d_490a

    ld hl, $def3
    add hl, bc
    cp [hl]
    jr z, jr_01d_48b3

    inc [hl]
    jr jr_01d_490a

jr_01d_48b3:
    ld hl, $dee3
    add hl, bc
    ld e, [hl]
    ld d, $00
    ld hl, $502b
    add hl, de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $deeb
    add hl, bc
    ld d, $00
    ld e, [hl]
    inc [hl]
    pop hl
    add hl, de
    ld a, [hl+]
    cp $80
    jr z, jr_01d_48f6

    ld hl, $deb5
    add hl, bc
    add hl, bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    bit 7, a
    jr nz, jr_01d_48e7

    add e
    ld e, a
    ld a, $00
    adc d
    and $07
    ld d, a
    ret


jr_01d_48e7:
    xor $ff
    inc a
    push bc
    ld c, a
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    and $07
    ld d, a
    pop bc
    ret


jr_01d_48f6:
    push hl
    ld hl, $deeb
    add hl, bc
    ld [hl], $00
    pop hl
    ld a, [hl]
    cp $80
    jr z, jr_01d_48b3

    ld hl, $dee3
    add hl, bc
    ld [hl], a
    jr jr_01d_48b3

jr_01d_490a:
    ld hl, $deb5
    add hl, bc
    add hl, bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    ret


Call_01d_4913:
    cp $00
    jr nz, jr_01d_492b

    ld a, [$deef]
    cp $00
    jr z, jr_01d_492b

    ld a, [$de9c]
    bit 0, a
    jr nz, jr_01d_495b

    ld a, e
    ldh [rNR13], a
    ld a, d
    ldh [rNR14], a

jr_01d_492b:
    cp $01
    jr nz, jr_01d_4943

    ld a, [$def0]
    cp $00
    jr z, jr_01d_4943

    ld a, [$de9c]
    bit 1, a
    jr nz, jr_01d_495b

    ld a, e
    ldh [rNR23], a
    ld a, d
    ldh [rNR24], a

jr_01d_4943:
    cp $02
    jr nz, jr_01d_495b

    ld a, [$def1]
    cp $00
    jr z, jr_01d_495b

    ld a, [$de9c]
    bit 2, a
    jr nz, jr_01d_495b

    ld a, e
    ldh [rNR33], a
    ld a, d
    ldh [rNR34], a

jr_01d_495b:
    ret


Call_01d_495c:
    ld hl, $defa
    add hl, bc
    ld a, [hl]
    bit 7, a
    jr nz, jr_01d_496b

    add e
    ld e, a
    ld a, d
    adc b
    ld d, a
    ret


jr_01d_496b:
    xor $ff
    ld h, a
    ld a, e
    sub h
    ld e, a
    ld a, d
    sbc b
    ld d, a
    ret


Call_01d_4975:
    ld a, [$de9c]
    ld d, a
    bit 0, d
    jr nz, jr_01d_4985

    ld a, $08
    ldh [rNR12], a
    swap a
    ldh [rNR14], a

jr_01d_4985:
    bit 1, d
    jr nz, jr_01d_4991

    swap a
    ldh [rNR22], a
    swap a
    ldh [rNR24], a

jr_01d_4991:
    bit 3, d
    jr nz, jr_01d_499d

    swap a
    ldh [rNR42], a
    swap a
    ldh [rNR44], a

jr_01d_499d:
    bit 2, d
    jr nz, jr_01d_49a5

    ld a, $00
    ldh [rNR32], a

jr_01d_49a5:
    ret


Call_01d_49a6:
    ld hl, $de9d
    xor a
    add [hl]
    inc hl
    add [hl]
    inc hl
    add [hl]
    inc hl
    add [hl]
    or a
    ret nz

    ld a, $80
    ld [$de90], a
    ret


Jump_01d_49b9:
    call Call_01d_4975
    call Call_01d_49cd
    call Call_01d_4156
    ret


Jump_01d_49c3:
    call Call_01d_4975
    call Call_01d_4156
    call Call_01d_4af2
    ret


Call_01d_49cd:
    ld a, [$de90]
    ld [$df65], a
    ld a, [$de91]
    ld [$df66], a
    ld a, [$de94]
    ld [$df67], a
    ld hl, $de96
    ld de, $df68
    ld a, $04
    call Call_01d_4c09
    ld a, [$de9a]
    ld [$df6c], a
    ld a, [$de9b]
    ld [$df6d], a
    ld hl, $de9d
    ld de, $df6e
    ld a, $04
    call Call_01d_4c09
    ld hl, $dea1
    ld de, $df72
    ld a, $04
    call Call_01d_4c09
    ld hl, $dea5
    ld de, $df76
    ld a, $08
    call Call_01d_4c09
    ld hl, $dead
    ld de, $df7e
    ld a, $08
    call Call_01d_4c09
    ld a, [$debb]
    ld [$df86], a
    ld a, [$debc]
    ld [$df87], a
    ld hl, $debf
    ld de, $df88
    ld a, $04
    call Call_01d_4c09
    ld hl, $dec3
    ld de, $df8c
    ld a, $04
    call Call_01d_4c09
    ld hl, $dec7
    ld de, $df90
    ld a, $04
    call Call_01d_4c09
    ld hl, $decb
    ld de, $df94
    ld a, $04
    call Call_01d_4c09
    ld hl, $decf
    ld de, $df98
    ld a, $04
    call Call_01d_4c09
    ld hl, $ded3
    ld de, $df9c
    ld a, $04
    call Call_01d_4c09
    ld hl, $ded7
    ld de, $dfa0
    ld a, $04
    call Call_01d_4c09
    ld hl, $dedb
    ld de, $dfa4
    ld a, $04
    call Call_01d_4c09
    ld hl, $dedf
    ld de, $dfa8
    ld a, $04
    call Call_01d_4c09
    ld hl, $dee7
    ld de, $dfac
    ld a, $04
    call Call_01d_4c09
    ld hl, $deef
    ld de, $dfb0
    ld a, $04
    call Call_01d_4c09
    ld a, $00
    ld [$deeb], a
    ld [$deec], a
    ld [$deed], a
    ld [$deee], a
    ld hl, $def7
    ld de, $dfb4
    ld a, $03
    call Call_01d_4c09
    ld hl, $defa
    ld de, $dfb7
    ld a, $03
    call Call_01d_4c09
    ld hl, $defd
    ld de, $dfba
    ld a, $02
    call Call_01d_4c09
    ld a, $00
    ld [$dfbc], a
    ld hl, $df03
    ld de, $dfbd
    ld a, $08
    call Call_01d_4c09
    ld hl, $df0b
    ld de, $dfc5
    ld a, $30
    call Call_01d_4c09
    ret


Call_01d_4af2:
    ld a, [$df65]
    ld [$de90], a
    ld a, [$df66]
    ld [$de91], a
    ld a, [$df67]
    ld [$de94], a
    ld hl, $df68
    ld de, $de96
    ld a, $04
    call Call_01d_4c09
    ld a, [$df6c]
    ld [$de9a], a
    ld a, $01
    ld [$de9b], a
    ld hl, $df6e
    ld de, $de9d
    ld a, $04
    call Call_01d_4c09
    ld hl, $df72
    ld de, $dea1
    ld a, $04
    call Call_01d_4c09
    ld hl, $df76
    ld de, $dea5
    ld a, $08
    call Call_01d_4c09
    ld hl, $df7e
    ld de, $dead
    ld a, $08
    call Call_01d_4c09
    ld a, [$df86]
    ld [$debb], a
    ld a, [$df87]
    ld [$debc], a
    ld hl, $df88
    ld de, $debf
    ld a, $04
    call Call_01d_4c09
    ld hl, $df8c
    ld de, $dec3
    ld a, $04
    call Call_01d_4c09
    ld hl, $df90
    ld de, $dec7
    ld a, $04
    call Call_01d_4c09
    ld hl, $df94
    ld de, $decb
    ld a, $04
    call Call_01d_4c09
    ld hl, $df98
    ld de, $decf
    ld a, $04
    call Call_01d_4c09
    ld hl, $df9c
    ld de, $ded3
    ld a, $04
    call Call_01d_4c09
    ld hl, $dfa0
    ld de, $ded7
    ld a, $04
    call Call_01d_4c09
    ld hl, $dfa4
    ld de, $dedb
    ld a, $04
    call Call_01d_4c09
    ld hl, $dfa8
    ld de, $dedf
    ld a, $04
    call Call_01d_4c09
    ld hl, $dfac
    ld de, $dee7
    ld a, $04
    call Call_01d_4c09
    ld hl, $dfb0
    ld de, $deef
    ld a, $04
    call Call_01d_4c09
    ld hl, $dfb4
    ld de, $def7
    ld a, $03
    call Call_01d_4c09
    ld hl, $dfb7
    ld de, $defa
    ld a, $03
    call Call_01d_4c09
    ld hl, $dfba
    ld de, $defd
    ld a, $02
    call Call_01d_4c09
    ld a, [$dfbc]
    ld [$deff], a
    ld hl, $dfbd
    ld de, $df03
    ld a, $08
    call Call_01d_4c09
    ld hl, $dfc5
    ld de, $df0b
    ld a, $30
    call Call_01d_4c09
    ret


Call_01d_4c09:
    ld c, a

jr_01d_4c0a:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_01d_4c0a

    ret


    dec bc
    rst $18
    rla
    rst $18
    inc hl
    rst $18
    cpl
    rst $18
    nop
    jr jr_01d_4c4c

    ld c, b
    ld h, b
    ld a, b
    sub b
    xor b
    inc l
    nop
    sbc h
    nop
    ld b, $01
    ld l, e
    ld bc, $01c9
    ld [hl+], a
    ld [bc], a
    ld a, b
    ld [bc], a
    add $02
    ld [de], a
    inc bc
    ld e, b
    inc bc
    sbc e
    inc bc
    jp c, $1603

    inc b
    ld c, [hl]
    inc b
    add e
    inc b
    or l
    inc b
    push hl
    inc b
    ld de, $3c05
    dec b
    ld h, e
    dec b
    adc c
    dec b
    xor h

jr_01d_4c4c:
    dec b
    call $ed05
    dec b
    dec bc
    ld b, $28
    ld b, $42
    ld b, $5b
    ld b, $72
    ld b, $89
    ld b, $9e
    ld b, $b2
    ld b, $c4
    ld b, $d6
    ld b, $e7
    ld b, $f6
    ld b, $05
    rlca
    inc d
    rlca
    ld hl, $2d07
    rlca
    add hl, sp
    rlca
    ld b, h
    rlca
    ld c, a
    rlca
    ld e, c
    rlca
    ld h, d
    rlca
    ld l, e
    rlca
    ld [hl], e
    rlca
    ld a, e
    rlca
    add e
    rlca
    adc d
    rlca
    sub b
    rlca
    sub a
    rlca
    sbc l
    rlca
    and d
    rlca
    and a
    rlca
    xor h
    rlca
    or c
    rlca
    or [hl]
    rlca
    cp d
    rlca
    cp [hl]
    rlca
    pop bc
    rlca
    push bc
    rlca
    ret z

    rlca
    rlc a
    adc $07
    pop de
    rlca
    call nc, $d607
    rlca
    reti


    rlca
    db $db
    rlca
    db $dd
    rlca
    rst $18
    rlca
    pop hl
    rlca
    db $e3
    rlca
    db $e4
    rlca
    push hl
    rlca
    rst $20
    rlca
    add sp, $07
    ld [$eb07], a
    rlca
    db $ec
    rlca
    db $ed
    rlca
    xor $07
    rst $28
    rlca
    ldh a, [rTAC]
    db $dd
    ld c, h
    db $ed
    ld c, h
    db $fd
    ld c, h
    dec c
    ld c, l
    dec e
    ld c, l
    dec l
    ld c, l
    dec a
    ld c, l
    ld c, l
    ld c, l
    ld e, l
    ld c, l
    ld a, d
    rst $18
    rst $38
    jp c, Jump_000_1074

    nop
    inc d
    ld a, d
    rst $18
    rst $38
    jp c, Jump_000_1074

    nop
    inc d
    ld [de], a
    inc hl
    inc sp
    ld b, h
    ld d, l
    ld h, [hl]
    ld [hl], a
    ld [hl], a
    ld a, b
    adc c
    sbc d
    xor e
    cp e
    call z, $eedd
    cp e
    cp e
    cp e
    db $dd
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
    ld a, c
    cp l
    rst $38
    rst $38
    rst $38
    rst $38
    db $fd
    cp c
    ld [hl], l
    ld sp, $0000
    nop
    nop
    ld bc, $7935
    adc $ee
    ret


    ld [hl], h
    ld hl, $2411
    ld a, c
    adc $ee
    ret


    ld [hl], h
    ld hl, $2411
    xor d
    xor d
    xor d
    call z, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $aaaa
    xor d
    call z, $2222
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
    ld a, c
    cp l
    db $dd
    cp c
    ld [hl], l
    ld [hl-], a
    ld de, $7935
    cp l
    db $dd
    cp c
    ld [hl], l
    ld [hl-], a
    ld de, $9935
    sbc c
    sbc c
    cp e
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    or l
    ld c, l
    cp l
    ld c, l
    call nz, $ce4d
    ld c, l
    pushx @ + $e04d
    ld c, l
    add sp, $4d
    rst $28
    ld c, l
    or $4d
    db $fd
    ld c, l
    rra
    ld c, [hl]
    ld b, c
    ld c, [hl]
    ld h, e
    ld c, [hl]
    adc l
    ld c, [hl]
    and b
    ld c, [hl]
    xor d
    ld c, [hl]
    call z, $d34e
    ld c, [hl]
    jp c, $f54e

    ld c, [hl]
    dec c
    ld c, a
    jr z, jr_01d_4de8

    ld b, b
    ld c, a
    ld e, b
    ld c, a
    ld l, [hl]
    ld c, a
    ld [hl], l
    ld c, a
    ld a, h
    ld c, a
    add d
    ld c, a
    adc c
    ld c, a
    sub b
    ld c, a
    sub a
    ld c, a
    or d
    ld c, a
    jp z, $e54f

    ld c, a
    db $fd
    ld c, a
    dec d
    ld d, b
    adc b
    ld [hl-], a
    jp nc, Jump_000_36c0

    ld b, a
    ld h, a
    rst $38
    adc b
    ld [hl-], a
    add c
    ret nz

    ld [hl], $47
    rst $38
    adc b
    inc h
    and c
    add b
    ld b, a
    inc sp
    ld [hl+], a
    ld de, $ff06
    adc b
    ld e, $82
    add b
    ld b, a
    inc sp
    ld b, $04
    rst $38
    adc b
    ld e, $72
    add b
    ld b, a
    inc sp
    ld b, $04
    rst $38
    adc b
    rst $30
    pop de
    add b
    ld [$0808], sp
    rst $38

jr_01d_4de8:
    adc b
    ld [hl-], a
    pop hl
    add b
    nop
    ld bc, $88ff
    ld [hl-], a
    pop af
    add b
    nop
    ld bc, $88ff
    ld [hl-], a
    and c
    ret nz

    nop
    ld bc, $88ff
    nop
    db $d3
    add b
    ld [bc], a
    nop
    ld bc, $0100
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    rst $38
    adc b
    nop
    and d
    add b
    ld [bc], a
    nop
    ld bc, $0100
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
    rst $38
    adc b
    nop
    add d
    add b
    ld [bc], a
    nop
    ld bc, $0100
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
    rst $38
    adc b
    ld [hl-], a
    ld [hl], l
    add b
    dec h
    inc d
    dec h
    inc d
    dec h
    inc h
    ld b, d
    inc h
    ld b, d
    inc h
    ld b, d
    inc h
    ld b, d
    inc h
    ld b, e
    inc h
    ld b, e
    inc h
    ld b, e
    inc [hl]
    ld b, e
    inc [hl]
    ld b, e
    inc [hl]
    ld b, e
    inc [hl]
    ld b, e
    inc [hl]
    ld b, e
    inc [hl]
    ld b, h
    inc [hl]
    ld b, h
    inc [hl]
    ld b, h
    inc [hl]
    ld b, h
    rst $38
    adc b
    ld a, [bc]
    add c
    add b
    add hl, hl
    ld a, [de]
    inc e
    dec e
    inc e
    ld e, $1c
    dec e
    inc e
    ld e, $1c
    dec e
    inc e
    ld e, $ff
    adc b
    ld [hl-], a
    ld h, c
    ret nz

    nop
    ld bc, $0100
    nop
    rst $38
    adc b
    nop
    jp nz, $0280

    nop
    ld bc, $0100
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
    rst $38
    adc b
    ld [hl-], a
    pop bc
    ret nz

    ld [hl], $47
    rst $38
    adc b
    ld [hl-], a
    pop bc
    ret nz

    ld [hl], $47
    rst $38
    adc b
    ld a, [bc]
    ld [hl], d
    add b
    add hl, hl
    ld a, [hl+]
    inc l
    dec l
    inc l
    ld l, $2c
    dec l
    inc l
    ld l, $2c
    dec l
    inc l
    ld l, $2c
    dec l
    inc l
    ld l, $2c
    dec l
    inc l
    ld l, $ff
    adc b
    ld bc, $8091
    inc h
    dec h
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $ff
    adc b
    ld a, [bc]
    ld h, d
    add b
    add hl, hl
    ld a, [de]
    inc e
    dec e
    inc e
    ld e, $1c
    dec e
    inc e
    ld e, $1c
    dec e
    inc e
    ld e, $1c
    dec e
    inc e
    ld e, $1c
    dec e
    inc e
    ld e, $ff
    adc b
    ld bc, $8091
    inc h
    dec h
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $ff
    adc b
    ld a, [bc]
    ld h, d
    add b
    jr z, jr_01d_4f5f

    ld a, [de]
    add hl, de
    dec de
    add hl, de
    ld a, [de]
    add hl, de
    dec de
    add hl, de
    ld a, [de]
    add hl, de
    dec de
    add hl, de
    ld a, [de]
    add hl, de
    dec de
    add hl, de
    ld a, [de]
    rst $38
    adc b
    ld bc, $8081
    ld hl, $2423

jr_01d_4f5f:
    inc hl
    inc h
    inc hl
    inc h
    inc hl
    inc h
    inc hl
    inc h
    inc hl
    inc h
    inc hl
    inc h
    inc hl
    inc h
    rst $38
    adc b
    ld [hl-], a
    ld [hl], l
    add b
    dec h
    inc d
    rst $38
    adc b
    ld a, [bc]
    add c
    add b
    add hl, hl
    ld a, [de]
    rst $38
    adc b
    ld [hl-], a
    ld h, c
    ret nz

    nop
    rst $38
    adc b
    nop
    jp nz, $0280

    nop
    rst $38
    adc b
    ld [hl-], a
    pop bc
    ret nz

    ld [hl], $47
    rst $38
    adc b
    ld [hl-], a
    pop bc
    ret nz

    ld [hl], $47
    rst $38
    adc b
    ld a, [bc]
    ld [hl], d
    add b
    add hl, hl
    ld a, [hl+]
    inc l
    dec l
    inc l
    ld l, $2c
    dec l
    inc l
    ld l, $2c
    dec l
    inc l
    ld l, $2c
    dec l
    inc l
    ld l, $2c
    dec l
    inc l
    ld l, $ff
    adc b
    ld bc, $80b1
    inc h
    dec h
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $ff
    adc b
    ld a, [bc]
    ld h, d
    add b
    add hl, hl
    ld a, [de]
    inc e
    dec e
    inc e
    ld e, $1c
    dec e
    inc e
    ld e, $1c
    dec e
    inc e
    ld e, $1c
    dec e
    inc e
    ld e, $1c
    dec e
    inc e
    ld e, $ff
    adc b
    ld bc, $80b1
    inc h
    dec h
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $25
    ld h, $ff
    adc b
    ld a, [bc]
    ld h, d
    add b
    jr z, jr_01d_501c

    ld a, [de]
    add hl, de
    dec de
    add hl, de
    ld a, [de]
    add hl, de
    dec de
    add hl, de
    ld a, [de]
    add hl, de
    dec de
    add hl, de
    ld a, [de]
    add hl, de
    dec de
    add hl, de
    ld a, [de]
    rst $38
    adc b
    ld bc, $80b1
    ld hl, $2423

jr_01d_501c:
    inc hl
    inc h
    inc hl
    inc h
    inc hl
    inc h
    inc hl
    inc h
    inc hl
    inc h
    inc hl
    inc h
    inc hl
    inc h
    rst $38
    ld c, e
    ld d, b
    ld c, [hl]
    ld d, b
    ld d, h
    ld d, b
    ld a, [hl]
    ld d, b
    sub d
    ld d, b
    sbc d
    ld d, b
    and [hl]
    ld d, b
    or b
    ld d, b
    call nz, $cc50
    ld d, b
    reti


    ld d, b
    ldh [$50], a
    ldh a, [$50]
    db $f4
    ld d, b
    ld [bc], a
    ld d, c
    db $10
    ld d, c
    nop
    add b
    add b
    inc bc
    nop
    db $fd
    nop
    add b
    add b
    ld bc, $0101
    ld bc, $0202
    ld [bc], a
    ld [bc], a
    ld bc, $0101
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    cp $fe
    cp $fe
    rst $38
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
    nop
    add b
    add b
    ld bc, $0402
    rlca
    inc b
    ld [bc], a
    ld bc, $0000
    rst $38
    cp $fd
    db $fc
    db $fd
    cp $ff
    nop
    nop
    add b
    add b
    ld bc, $0000
    rst $38
    nop
    nop
    add b
    add b
    ld bc, $0000
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    add b
    add b
    ld bc, $0102
    nop
    rst $38
    cp $ff
    nop
    add b
    add b
    ld bc, $0302
    ld [bc], a
    ld bc, $0000
    nop
    nop
    rst $38
    cp $fd
    cp $ff
    nop
    nop
    nop
    nop
    add b
    add b
    ei
    cp $08
    dec b
    ld [bc], a
    nop
    add b
    nop
    ld bc, $0302
    ld [bc], a
    ld bc, $0000
    cp $ff
    nop
    nop
    add b
    add b
    db $fd
    rlca
    inc bc
    ld bc, $8000
    nop
    inc b
    ld [bc], a
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    add hl, bc
    ld [bc], a
    nop
    add b
    nop
    ld [bc], a
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
    add b
    add hl, bc
    db $fd
    cp $ff
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    inc b
    rst $38
    nop
    nop
    nop
    ld bc, $0000
    nop
    add b
    add b
    inc de
    inc e
    inc e
    inc e
    inc e
    inc e
    inc e
    inc e
    inc e
    inc e
    inc e
    inc e
    inc e
    inc e
    dec e
    dec e
    dec e
    dec e
    dec e
    dec e
    ld d, h
    ld d, c
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
    ld d, l
    ld d, c
    ld e, [hl]
    ld d, c
    ld h, a
    ld d, c
    ld [hl], b
    ld d, c
    ld a, c
    ld d, c
    add d
    ld d, c
    nop
    rrca
    cp e
    ld d, c
    add d
    ld d, d
    ld l, $54
    ret


    ld d, l
    rrca
    ld b, a
    ld d, [hl]
    sbc b
    ld d, [hl]
    add sp, $56
    xor c
    ld d, a
    rrca
    db $ec
    ld d, a
    ld e, c
    ld e, b
    or e
    ld e, b
    ld a, [c]
    ld e, b
    rrca
    inc h
    ld e, c
    pushx @ + $6359
    ld e, d
    or h
    ld e, d
    rrca
    call z, $f65a
    ld e, e
    xor d
    ld e, h
    ld [de], a
    ld e, l
    rrca
    adc a
    ld e, l
    inc c
    ld h, b
    ld a, b
    ld h, d
    xor [hl]
    ld h, e
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    call c, $dd11
    ret nc

    ld [$40e5], sp
    ld [$d400], a
    rst $18
    ld [bc], a
    and $85
    and c
    ld d, c
    ret c

    and c
    ld d, c
    and c
    pushx @ + $e651
    add l
    and c
    and $20
    and c
    ldh [$e6], a
    add l
    pop bc
    ld [hl], c
    ret c

    pop bc
    ld [hl], c
    pop bc
    pushx @ + $b171
    jp Jump_000_11d7


    ret c

    add c
    ld de, $c1d8
    pushx @ + $8311
    rst $18
    ld [bc], a
    and $85
    and c
    ld d, c
    ret c

    and c
    ld d, c
    and c
    pushx @ + $e651
    add l
    and c
    and $20
    and c
    ldh [$e6], a
    add l
    pop bc
    ld [hl], c
    ret c

    pop bc
    ld [hl], c
    pop bc
    pushx @ + $c171
    pushx @ + $d833
    and c
    ld hl, $d831
    and c
    ld sp, $3021
    and b
    pushx @ + $06ea
    db $eb
    inc d
    push hl
    nop
    and $b7
    ld [hl+], a
    ret c

    or d
    pushx @ + $e679
    ld h, a
    ld [hl+], a
    ret c

    or d
    pushx @ + $e679
    or a
    ld [hl-], a
    ld b, d
    cp c
    and $67
    ld [hl-], a
    ld b, d
    cp c
    ret c

    and $b7
    jp nz, $12d7

    ld a, c
    ret c

    and $67
    jp nz, $12d7

    ld a, c
    and $b7
    ld d, d
    ld [hl-], a
    ret c

    xor c
    pushx @ + $67e6
    ld d, d
    ld [hl-], a
    ret c

    xor c
    pushx @ + $b7e6
    ld [hl+], a
    ret c

    or d
    pushx @ + $e679
    ld h, a
    ld [hl+], a
    ret c

    or d
    pushx @ + $e679
    or a
    ld [hl-], a
    ld b, d
    cp c
    and $67
    ld [hl-], a
    ld b, d
    cp c
    ret c

    and $b7
    jp nz, $12d7

    ld a, c
    ret c

    and $67
    jp nz, $12d7

    ld a, c
    and $b7
    ld d, d
    ld [hl-], a
    ret c

    xor c
    sbc a
    sbc $ff
    call c, $dd11
    ret nc

    ld [$e5d2], sp
    nop
    and $a4
    ld d, c
    ld de, $1151
    ld d, c
    ld de, $1151
    ld h, c
    ld hl, $2161
    ld h, c
    ld hl, $2161
    ld [hl], c
    ld sp, $3171
    ld [hl], c
    ld sp, $3171
    add c
    ld b, c
    add c
    ld b, c
    add c
    ld b, c
    add c
    ld b, c
    ld d, c
    ld de, $1151
    ld d, c
    ld de, $1151
    ld h, c
    ld hl, $2161
    ld h, c
    ld hl, $2161
    ld [hl], c
    ld sp, $3171
    ld [hl], c
    ld sp, $3171
    and c
    ld h, c
    and c
    ld h, c
    and c
    ld h, c
    and c
    ld h, c
    db $d3
    push hl
    ld b, b
    and $93
    ld [hl], b
    ret c

    add b
    or b
    add b
    pushx @ + $d820
    add b
    pushx @ + $d870
    add b
    or b
    add b
    pushx @ + $d820
    add b
    pushx @ + $d870
    add b
    or b
    add b
    pushx @ + $d820
    add b
    pushx @ + $d870
    add b
    or b
    add b
    pushx @ + $d820
    add b
    pushx @ + $d870
    add b
    or b
    add b
    pushx @ + $d820
    add b
    pushx @ + $d870
    add b
    pushx @ + $d830
    ld b, b
    ld [hl], b
    ld b, b
    or b
    ld b, b
    pushx @ + $d830
    ld b, b
    ld [hl], b
    ld b, b
    or b
    ld b, b
    pushx @ + $d830
    ld b, b
    ld [hl], b
    ld b, b
    or b
    ld b, b
    pushx @ + $d830
    ld b, b
    ld [hl], b
    ld b, b
    or b
    ld b, b
    pushx @ + $d830
    ld b, b
    ld [hl], b
    ld b, b
    or b
    ld b, b
    pushx @ + $d830
    ld b, b
    ret nz

    db $10
    ld d, b
    db $10
    ld [hl], b
    db $10
    ret nz

    db $10
    ld d, b
    db $10
    ld [hl], b
    db $10
    ret nz

    db $10
    ld d, b
    db $10
    ld [hl], b
    db $10
    ret nz

    db $10
    ld d, b
    db $10
    ld [hl], b
    db $10
    ret nz

    db $10
    ld d, b
    db $10
    ld [hl], b
    db $10
    ret nz

    db $10
    pushx @ + $d850
    ld h, b
    and b
    ld h, b
    ret nz

    ld h, b
    pushx @ + $d850
    ld h, b
    and b
    ld h, b
    ret nz

    ld h, b
    pushx @ + $d850
    ld h, b
    and b
    ld h, b
    ret nz

    ld h, b
    pushx @ + $d850
    ld h, b
    and b
    ld h, b
    ret nz

    ld h, b
    pushx @ + $d850
    ld h, b
    and b
    ld h, b
    ret nz

    ld h, b
    pushx @ + $d850
    ld h, b
    pushx @ + $d870
    add b
    or b
    add b
    pushx @ + $d820
    add b
    pushx @ + $d870
    add b
    or b
    add b
    pushx @ + $d820
    add b
    pushx @ + $d870
    add b
    or b
    add b
    pushx @ + $d820
    add b
    pushx @ + $d870
    add b
    or b
    add b
    pushx @ + $d820
    add b
    pushx @ + $d870
    add b
    or b
    add b
    pushx @ + $d820
    add b
    pushx @ + $d870
    add b
    pushx @ + $d830
    ld b, b
    ld [hl], b
    ld b, b
    or b
    ld b, b
    pushx @ + $d830
    ld b, b
    ld [hl], b
    ld b, b
    or b
    ld b, b
    pushx @ + $d830
    ld b, b
    ld [hl], b
    ld b, b
    or b
    ld b, b
    pushx @ + $d830
    ld b, b
    ld [hl], b
    ld b, b
    or b
    ld b, b
    pushx @ + $d830
    ld b, b
    ld [hl], b
    ld b, b
    or b
    ld b, b
    pushx @ + $d830
    ld b, b
    ret nz

    db $10
    ld d, b
    db $10
    ld [hl], b
    db $10
    ret nz

    db $10
    ld d, b
    db $10
    ld [hl], b
    db $10
    ret nz

    db $10
    ld d, b
    db $10
    ld [hl], b
    db $10
    ret nz

    db $10
    ld d, b
    db $10
    ld [hl], b
    db $10
    ret nz

    db $10
    ld d, b
    db $10
    ld [hl], b
    db $10
    ret nz

    db $10
    pushx @ + $d850
    ld h, b
    and b
    ld h, b
    ret nz

    ld h, b
    pushx @ + $d850
    ld h, b
    and b
    ld h, b
    ret nz

    ld h, b
    pushx @ + $d850
    ld h, b
    and b
    ld h, b
    or b
    ld d, b
    pushx @ + $d840
    ld d, b
    sub b
    ld d, b
    or b
    ld d, b
    pushx @ + $d840
    ld d, b
    sub b
    ld d, b
    or b
    ld d, b
    pushx @ + $d840
    ld d, b
    sbc $ff
    call c, $dd11
    ret nc

    ld [$08e8], sp
    rst $20
    ld [bc], a
    jp hl


    ld h, b
    and $20
    pop de
    add sp, $06
    and b
    add sp, $08
    and b
    nop
    and b
    ld bc, $06e8
    and b
    add sp, $08
    and b
    ld bc, $00a0
    and b
    ld [bc], a
    add sp, $06
    or b
    add sp, $08
    or b
    nop
    add sp, $06
    or b
    add sp, $08
    or b
    nop
    add sp, $06
    or b
    add sp, $08
    or b
    ld bc, $00b0
    or b
    ld [bc], a
    rst $18
    inc bc
    add sp, $06
    ret nz

    add sp, $08
    ret nz

    nop
    ldh [rP1], a
    add sp, $06
    ret nz

    ret nz

    ret nz

    add sp, $08
    ret nz

    nop
    ret nz

    pushx @ + $06e8
    db $10
    add sp, $08
    stop
    db $10
    ret c

    stop
    add sp, $06
    db $10
    add sp, $08
    db $10
    ld bc, $d710
    db $10
    ret c

    db $10
    pushx @ + $d810
    stop
    add sp, $06
    and b
    add sp, $08
    and b
    nop
    and b
    ld bc, $06e8
    and b
    add sp, $08
    and b
    ld bc, $04a0
    add sp, $06
    or b
    add sp, $08
    or b
    nop
    or b
    ld bc, $06e8
    or b
    add sp, $08
    or b

jr_01d_54bc:
    ld bc, $04b0

jr_01d_54bf:
    add sp, $06

jr_01d_54c1:
    ret nz

    add sp, $08
    ret nz

    nop
    ret nz

    ld bc, $06e8
    ret nz

    add sp, $08
    ret nz

    ld bc, $06e8
    ret nz

    ret nz

    add sp, $08
    ret nz

    ld [bc], a
    pushx @ + $0530
    ret c

    add sp, $06
    rst $18
    dec b
    jr nc, jr_01d_54c1

    add sp, $08
    jr nc, jr_01d_54bc

    jr nc, jr_01d_54bf

    jr nc, jr_01d_54e9

jr_01d_54e9:
    rst $18
    ld [bc], a
    ret nc

    ld bc, $0086
    ret nc

    ld [$0380], sp
    ret nc

    ld bc, $0086
    ret nc

    ld [$0780], sp
    ldh [$d0], a
    ld bc, $0046
    ret nc

jr_01d_5501:
    ld [$0340], sp
    ret nc

    ld bc, $0046
    ret nc

    ld [$0740], sp
    ret nc

    ld bc, $0046
    ret nc

    ld [$0340], sp
    ret nc

    ld bc, $0046
    ret nc

    ld [$0440], sp
    pushx @ + $d840
    ld b, b
    jr nz, jr_01d_5501

    ld [bc], a
    ret nc

    ld bc, $0016
    ret nc

    ld [$0310], sp
    ret nc

    ld bc, $0016
    ret nc

    ld [$0710], sp
    ldh [$d0], a
    ld bc, $0066
    ret nc

    ld [$0360], sp
    ret nc

    ld bc, $0066
    ret nc

    ld [$0760], sp
    ret nc

    ld bc, $0066
    ret nc

    ld [$0360], sp
    ret nc

    ld bc, $0066
    ret nc

    ld [$0460], sp
    db $10
    ld h, b
    ld [hl], b
    rst $18
    ld [bc], a
    ret nc

    ld bc, $0086
    ret nc

    ld [$0380], sp
    ret nc

    ld bc, $0086
    ret nc

    ld [$0780], sp
    ldh [$d0], a
    ld bc, $0046
    ret nc

jr_01d_556f:
    ld [$0340], sp
    ret nc

    ld bc, $0046
    ret nc

    ld [$0740], sp
    ret nc

    ld bc, $0046
    ret nc

    ld [$0340], sp
    ret nc

    ld bc, $0046
    ret nc

    ld [$0440], sp
    pushx @ + $d840
    ld b, b
    jr nz, jr_01d_556f

    ld [bc], a
    ret nc

    ld bc, $0016
    ret nc

    ld [$0310], sp
    ret nc

    ld bc, $0016
    ret nc

    ld [$0710], sp
    ldh [$d0], a
    ld bc, $0066
    ret nc

    ld [$0360], sp
    ret nc

    ld bc, $0066
    ret nc

    ld [$0760], sp
    ret nc

    ld bc, $0056
    ret nc

    ld [$0350], sp
    ret nc

    ld bc, $0056
    ret nc

    ld [$0450], sp
    ret nz

    pushx @ + $d850
    ld d, b
    sbc $ff
    db $dd
    ret nc

    ld [$e8d1], sp
    ld [$02df], sp
    db $10
    stop
    db $10
    jr nc, jr_01d_55d7

jr_01d_55d7:
    db $10
    db $10
    ld [hl], b
    nop
    stop
    jr nc, jr_01d_55df

jr_01d_55df:
    sub b
    nop
    ldh [rNR10], a
    db $10
    ld [hl], b
    db $10
    jr nc, jr_01d_5658

    db $10
    db $10
    ld [hl], b
    ld [hl], b
    db $10
    db $10
    jr nc, jr_01d_5620

    ld [hl], b
    db $10
    db $10
    db $10
    ld [hl], b
    db $10
    jr nc, @+$72

    db $10
    db $10
    pushx @ + $d8c0
    ld [hl], b
    pushx @ + $c0c0
    and b
    and b
    add b
    ret c

    nop
    rst $18
    ld [bc], a
    db $10
    stop
    db $10
    jr nc, jr_01d_560e

jr_01d_560e:
    db $10
    db $10
    ld [hl], b
    nop
    stop
    jr nc, jr_01d_5616

jr_01d_5616:
    sub b
    nop
    ldh [rNR10], a
    db $10
    ld [hl], b
    db $10
    jr nc, @+$72

    db $10

jr_01d_5620:
    db $10
    ld [hl], b
    ld [hl], b
    db $10
    db $10
    jr nc, @+$72

    sub b
    ld [hl], b
    db $10
    ld [hl], b
    ld [hl], b
    ld [hl], b
    jr nc, jr_01d_569f

    ld [hl], b
    db $10
    pushx @ + $c0c0
    and b
    and b
    add b
    add b
    ret c

    and c
    rst $18
    db $10
    or c
    pop bc
    or c
    pop bc
    or c
    pop bc
    or c
    pop bc
    ldh [$de], a
    rst $38
    db $dd
    ret nc

    dec bc
    push hl
    ld b, b
    and $96
    db $d3
    ld [$eb03], a
    db $10
    rst $18
    ld [bc], a
    rst $18
    ld [bc], a
    or c

jr_01d_5658:
    ld [hl], c
    ld de, $b1d8
    pop bc
    pushx @ + $2311
    ldh [$b1], a
    ld [hl], c
    ld de, $b1d8
    pop bc
    pushx @ + $2111
    jp $a181


    ld h, c
    ld hl, $d841
    and e
    pushx @ + $d0e0
    dec bc
    db $d3
    push hl
    ld b, b
    and $a7
    ld [$eb03], a
    ld e, $df
    inc bc
    inc bc
    adc e
    ldh [rHDMA1], a
    ld b, c
    ld sp, $1123
    inc hl
    rst $18
    inc bc
    inc bc
    adc e
    ldh [$d7], a
    ld d, c
    ld b, c
    ld sp, $1123
    inc hl
    sbc $ff
    db $dd
    ret nc

    dec bc
    push hl
    ld b, b
    and $b5

jr_01d_569f:
    db $d3
    rst $18
    ld [bc], a
    rst $18
    ld [bc], a
    ld sp, $b1d8
    ld d, c
    ld sp, $5141
    ld h, e
    pushx @ + $31e0
    ret c

    or c
    ld d, c
    ld sp, $5141
    ld h, c
    pushx @ + $d843
    pop bc
    pushx @ + $d821
    and c
    ld h, c
    add c
    inc hl
    pushx @ + $d0e0
    dec bc
    add sp, $07
    push hl
    ld b, b
    and $a7
    db $d3
    rst $18
    inc bc
    inc bc
    ld c, e
    ldh [rNR11], a
    ret c

    pop bc
    or c
    and e
    sub c
    and e
    pushx @ + $03df
    inc bc
    ld c, e
    ldh [$d7], a
    ld de, $c1d8
    or c
    and e
    sub c
    and e
    sbc $ff
    db $dd
    ret nc

    dec bc
    pop de
    add sp, $07
    rst $20
    ld [bc], a
    jp hl


    ld h, b
    and $20
    rst $18
    ld [bc], a
    rst $18
    ld [bc], a
    and $20
    inc bc
    ld de, $e611
    ld h, b
    inc de
    and $20
    ld h, c
    and $60
    ld h, c
    ldh [$e6], a
    jr nz, jr_01d_570d

    ld de, $e611

jr_01d_570d:
    ld h, b
    inc de
    and $20
    ld h, c
    ld [hl], e
    pushx @ + $5131
    ld de, $91d8
    or c
    ld d, c
    and $60
    ld d, c
    ldh [$e6], a
    jr nz, @+$13

    and $60
    ld de, $20e6
    ld hl, $4131
    ld d, c
    and $60
    ld d, c
    pushx @ + $20e6
    ld de, $11d8
    ld hl, $4131
    and $60
    ld b, c
    pushx @ + $20e6
    ld de, $b1d8
    and $60
    or c
    and $20
    ld de, $60e6
    ld de, $20e6
    ld hl, $4131
    ld d, c
    and $60
    ld d, c
    pushx @ + $20e6
    ld de, $c1d8
    ld [hl], c
    ld b, c
    ld d, c
    and $60
    ld d, c
    and $20
    ld b, c
    ld d, c
    and $60
    ld d, c
    and $20
    ld de, $60e6
    ld de, $20e6
    ld hl, $4131
    ld d, c
    and $60
    ld d, c
    pushx @ + $20e6
    ld de, $11d8
    ld hl, $4131
    and $60
    ld b, c
    pushx @ + $20e6
    ld de, $b1d8
    and $60
    or c
    and $20
    ld de, $60e6
    ld de, $20e6
    ld hl, $4131
    ld d, c
    and $60
    ld d, c
    pushx @ + $20e6
    ld de, $c1d8
    ld [hl], c
    ld d, c
    ld b, c
    ld hl, $3111
    and $60
    ld sp, $ffde
    db $dd
    ret nc

    dec bc
    pop de
    rst $18
    ld [bc], a
    rst $18
    inc bc
    ld de, $d711
    ld hl, $11d8
    ld de, $21d7
    ret c

    ld de, $e001
    ld bc, $d711
    ld hl, $11d8
    pushx @ + $d821
    ld de, $23d7
    ret c

    ldh [$df], a
    ld c, $11
    pushx @ + $b0b0
    ret c

    ld [hl], c
    pushx @ + $b0b0
    ret c

    ldh [rNR11], a
    pushx @ + $b0b0
    ret c

    ld [hl], c
    pushx @ + $b0b0
    ret c

    ld de, $b0d7
    or b
    ret nz

    and b
    add c

jr_01d_57ea:
    sbc $ff
    ret nc

    rlca
    push hl
    nop
    add sp, $08
    call nc, Call_000_02df
    and $b5
    ret nc

    ld bc, $0035
    inc [hl]
    ld bc, $d0d8
    rlca
    and $d5
    jr nc, @-$27

    and $b5
    ret nc

    ld bc, $0025
    inc h
    ld bc, $d0d8
    rlca
    and $d5
    jr nz, jr_01d_57ea

    and $b5
    ret nc

    ld bc, $0035
    inc [hl]
    ld bc, $d0d8
    rlca
    and $d5
    jr nc, @-$27

    and $b5
    ret nc

    ld bc, $0025
    inc h
    ld bc, $d0d8
    rlca
    and $d5
    jr nz, @-$18

    or l
    ret nc

    ld bc, $b5e6
    or l
    and $20
    or b
    and $b5
    push bc
    and $20
    ret nz

    pushx @ + $b5e6
    dec d
    and $20
    db $10
    and $b5
    dec h
    and $20
    jr nz, @-$1e

    ret nc

    rlca
    and $10
    inc hl
    and $b6
    ld a, e
    reti


    ld a, a
    rst $38
    ret nc

    rlca
    push hl
    nop
    add sp, $08
    db $d3
    rst $18
    ld [bc], a
    and $b5
    ret nc

    ld bc, $00a5
    ret nc

    rlca
    and b
    ret c

    and b
    pushx @ + $01d0
    sub l
    nop
    ret nc

    rlca
    sub b
    ret c

    sub b
    pushx @ + $01d0
    and l
    nop
    ret nc

    rlca
    and b
    ret c

    and b
    pushx @ + $01d0
    sub l
    nop
    ret nc

    rlca
    sub b
    ret c

    sub b
    pushx @ + $01d0
    and $b5
    ld h, h
    and $20
    pop bc
    and $b5
    ld [hl], h
    and $20
    ld [hl], c
    and $b5
    add h
    and $20
    add c
    and $b5
    sub h

jr_01d_58a3:
    and $20
    sub c
    ldh [$d0], a
    rlca
    and $10
    sub e
    pushx @ + $b6e6
    dec sp
    reti


    ccf
    rst $38
    ret nc

    rlca
    pop de
    add sp, $08
    rst $20
    ld [bc], a
    jp hl


    jr nz, jr_01d_58a3

    jr nz, @-$1f

    ld [bc], a
    ret nc

    ld bc, $0184
    ret nc

    rlca
    add b
    nop
    ret nc

    ld bc, $0174
    ret nc

    rlca
    ld [hl], b
    nop
    ret nc

    ld bc, $0184
    ret nc

    rlca
    add b
    nop
    ret nc

    ld bc, $0174
    ret nc

    rlca
    ld [hl], b
    nop
    ret nc

    ld bc, HeaderNewLicenseeCode
    ld d, h
    ld bc, $0164
    ld [hl], h
    ld bc, $d0e0
    rlca
    inc bc
    ld e, c
    ld bc, $ff0f
    ret nc

    rlca
    pop de
    jr nc, jr_01d_5927

    sub b
    jr nc, jr_01d_592a

    sub b
    jr nc, @+$32

    sub b
    jr nc, jr_01d_5930

    sub b
    pushx @ + $c0c0
    and b
    and b
    ret c

    jr nc, jr_01d_5939

    sub b
    jr nc, jr_01d_593c

    sub b
    jr nc, jr_01d_593f

    sub b
    jr nc, jr_01d_5942

    sub b
    jr nc, jr_01d_5945

    jr nc, jr_01d_5947

    ret nc

    ld bc, $c3d7
    and d
    add e
    add d
    ret c

    ret nc

    rlca
    ld bc, $ffab
    ret nc

    add hl, bc
    push hl

jr_01d_5927:
    ret nz

    and $b0

jr_01d_592a:
    add sp, $08
    ld [$eb03], a
    inc l

jr_01d_5930:
    db $d3
    ld d, l
    ld c, c
    reti


    ld b, a
    inc hl
    ld b, e
    ld d, e
    ld [hl], c

jr_01d_5939:
    ld c, c
    reti


    ld b, a

jr_01d_593c:
    inc hl
    ld b, e
    ld d, l

jr_01d_593f:
    ld c, c
    reti


    ld b, a

jr_01d_5942:
    inc hl
    ld b, e
    ld d, e

jr_01d_5945:
    ld [hl], c
    ld c, c

jr_01d_5947:
    reti


    ld b, a
    ld d, e
    ld [hl], e
    call nc, Call_000_00e5
    and $5b
    add sp, $08
    ld [$8100], a
    ret c

    or c
    pushx @ + $7131
    ret c

    and c
    pushx @ + $7121
    ret c

    and c
    pushx @ + $7121
    ret c

    and c
    pushx @ + $5121
    ret c

    add c
    pushx @ + $d871
    and c
    pushx @ + $d881
    or c
    pushx @ + $71a1
    ret c

    and c
    pushx @ + $7121
    ret c

    and c
    pushx @ + $7121
    ret c

    and c
    pushx @ + $8121
    ret c

    or c
    pushx @ + $11a1
    pop bc
    ret c

    pop bc
    ret c

    pop bc
    pushx @ + $d7c1
    pop bc
    ret c

    pop bc
    ret c

    pop bc
    pushx @ + $d7c1
    pop bc
    ret c

    pop bc
    ld de, $d7c1
    pop bc
    ret c

    pop bc
    ld de, $d7c1
    sub c
    ret c

    sub c
    ret c

    sub c
    pushx @ + $d791
    sub c
    ret c

    sub c
    ret c

    sub c
    pushx @ + $d791
    sub c
    ret c

    sub c
    ret c

    and c
    pushx @ + $d791
    sub c
    ret c

    sub c
    ret c

    and c
    pushx @ + $5291
    add d
    pushx @ + $6222
    add d
    pushx @ + $d920
    ld hl, $e655
    sub b
    adc c
    and $97
    add l
    rst $38
    ret nc

    add hl, bc
    push hl
    ret nz

    and $b0
    jp nc, Jump_000_08e8

    add l
    ld a, c
    reti


    ld [hl], a
    ld d, e
    ld [hl], e
    add e
    and c
    ld a, c
    reti


    ld [hl], a
    ld d, e
    ld [hl], e
    add l
    ld a, c
    reti


    ld [hl], a
    ld d, e
    ld [hl], e
    add e
    and c
    ld a, c
    reti


    ld [hl], a
    add e
    and e
    jp nc, Jump_000_00e5

    and $6c
    add sp, $08
    or c
    add c
    ld sp, $71a1
    ld hl, $71a1
    ld hl, $71a1
    ld hl, $5181
    and c
    ld [hl], c
    or c
    add c
    pushx @ + $d811
    and c
    ld [hl], c
    ld hl, $71a1
    ld hl, $71a1
    ld hl, $81b1
    pushx @ + $d811
    and c
    db $d3
    push hl
    nop
    and $6c
    add sp, $08
    pop bc
    sub c
    ld d, c
    sub c
    pop bc
    sub c
    ld d, c
    sub c
    pop bc
    ld [hl], c
    ld b, c
    ld [hl], c
    pop bc
    ld [hl], c
    ld b, c
    ld [hl], c
    sub c
    ld h, c
    ld hl, $9161
    ld h, c
    ld hl, $9161
    ld b, c
    ld de, $9141
    ld b, c
    ld de, $e641
    ld [hl], b
    db $e4
    rst $38
    ld bc, $8222
    pushx @ + $6222
    add c
    reti


    add b
    pushx @ + $5522
    and $70
    add a
    and $77
    add l
    rst $38
    ret nc

    add hl, bc
    add sp, $08
    rst $20
    ld [bc], a
    jp hl


    jr nz, @-$18

    jr nz, @-$2d

    ld d, e
    ld d, c
    ld b, l
    ld b, e
    ld b, e
    ld b, e
    inc hl
    ld b, e
    ld d, e
    ld [hl], c
    ld b, l
    ld b, e
    ld b, e
    ld b, e
    inc hl
    ld b, e
    ld d, e
    ld d, c
    ld b, l
    ld b, e
    ld b, e
    ld b, e
    inc hl
    ld b, e
    ld d, e
    ld [hl], c
    ld b, l
    ld b, e
    ld b, e
    ld b, e
    ld d, e
    ld [hl], e
    add e
    add c
    ld [hl], l
    ld [hl], e
    ld [hl], e
    ld [hl], e
    ld d, e
    ld [hl], e
    add e
    and c
    ld [hl], l
    ld [hl], e
    ld [hl], e
    ld [hl], e
    add e
    and e
    and e
    and e
    and e
    and e
    ld [hl], e
    ld [hl], e
    ld [hl], e
    ld [hl], e
    ld [hl], e
    ld [hl], e
    ld [hl], e
    ld [hl], e
    ld b, e
    ld b, e
    ld b, e
    ld b, e
    ld e, a
    reti


    ld e, a
    reti


    ld d, l
    rst $38
    ret nc

    add hl, bc
    pop de
    rst $18
    inc c
    ld de, $8111
    ld [hl], c
    add c
    ld [hl], c
    add c
    ld [hl], c
    ldh [$d2], a
    rst $18
    inc b
    ld b, e
    ld b, e
    ld b, e
    ld b, e
    ldh [rBGP], a
    rst $38
    call c, $d011
    ld bc, $00e5
    db $d3
    add sp, $08
    ld [$eb0c], a
    ld bc, $b5e6
    ld b, h
    ld bc, $a5e6
    ld b, [hl]
    push hl
    ld b, b
    and $70
    call nc, Call_000_00ea
    ld b, e
    sub d
    pushx @ + $7223
    push hl
    nop
    db $d3
    ld [$e60c], a
    or l
    sub h
    ld bc, $a5e6
    sub [hl]
    push hl
    ld b, b
    and $70
    call nc, Call_000_00ea
    ld b, e
    sub d
    pushx @ + $7223
    push hl
    nop
    call nc, Call_000_0cea
    and $b5
    inc h
    ld bc, $a5e6
    ld h, $e5
    ld b, b
    and $70
    call nc, Call_000_00ea
    sub e
    pushx @ + $7322
    jp nz, Jump_000_00e5

    call nc, Call_000_0cea
    and $b5
    ld [hl], h
    ld bc, $a5e6
    halt
    push hl
    ld b, b
    and $70
    call nc, Call_000_00ea
    sub e
    pushx @ + $7322
    jp nz, $07d0

    push hl
    nop
    call nc, $a5e6
    add sp, $07
    ld b, b
    ld h, b
    ld [hl], b
    ld h, b
    ld b, b
    jr nz, @+$62

    and $20
    add sp, $08
    ld h, d
    and $a5
    add sp, $07
    ld b, b
    ld h, b
    jr nz, @+$12

    sub b
    and $10
    add sp, $08
    sbc b
    ret nc

    rlca
    push hl
    ld b, b
    and $70
    call nc, Call_000_08e8
    ld [$d000], a
    ld bc, $9273
    or e
    ret c

    or d
    pushx @ + $d8b3
    or d
    pushx @ + $d8b3
    or d
    pushx @ + $d8b3
    or d
    pushx @ + $d8b3
    or d

jr_01d_5b79:
    pushx @ + $d8b3
    or d
    pushx @ + $d8b3
    or d
    ret nc

    rlca
    db $dd
    push de
    and $a1
    jr nc, @-$26

    jr nc, jr_01d_5bbb

    ret c

    jr nc, @-$27

    jr nc, jr_01d_5bc0

    pushx @ + $d830
    jr nc, @+$32

    ret c

    jr nc, @-$27

    jr nc, @+$32

    pushx @ + $d830

jr_01d_5b9d:
    jr nc, @+$32

    ret c

    jr nc, jr_01d_5b79

    pushx @ + $d810
    db $10
    db $10

jr_01d_5ba7:
    ret c

    db $10
    pushx @ + $1010
    pushx @ + $d810
    db $10
    db $10
    ret c

    db $10
    pushx @ + $1010
    pushx @ + $d810
    db $10
    db $10

jr_01d_5bbb:
    ret c

    db $10
    pushx @ + $30d7

jr_01d_5bc0:
    ret c

    jr nc, @+$32

    ret c

jr_01d_5bc4:
    jr nc, jr_01d_5b9d

    jr nc, @+$32

    pushx @ + $d830
    jr nc, @+$32

    ret c

    jr nc, jr_01d_5ba7

    jr nc, jr_01d_5c02

    pushx @ + $d830
    jr nc, jr_01d_5c07

    pushx @ + $d830
    ld h, b
    ret c

    ld h, b
    pushx @ + $6060
    pushx @ + $d860
    ld h, b
    ld h, b
    ret c

    ld h, b
    pushx @ + $6060
    pushx @ + $d860
    ld h, b
    ld h, b
    ret c

    ld h, b
    pushx @ + $4050
    sbc $ff
    ret nc

    ld bc, $40e5
    and $a4
    jp nc, Jump_000_08e8

    and $a4
    or h

jr_01d_5c02:
    ld bc, $e6b6
    jr nc, jr_01d_5bc4

jr_01d_5c07:
    pushx @ + $a4e6
    ld b, h
    ld bc, $e646
    jr nc, @+$4f

    and $a4
    sub h
    ld bc, $e696
    jr nc, @-$61

    pushx @ + $a4e6
    inc h

jr_01d_5c1c:
    ld bc, $e626
    jr nc, jr_01d_5c4e

    rst $18
    inc bc
    and $94
    inc d
    and $20
    ld de, $e6e0
    and h
    ld d, $d8
    or h
    ld bc, $d7b6
    ret nc

    rlca
    jr nz, jr_01d_5c1c

    jr nz, jr_01d_5c5a

    and $a4
    ret nc

    ld bc, $0114
    ld d, $d8
    or [hl]
    sub [hl]
    pushx @ + $e666
    jr nz, @+$68

    ret nc

    rlca

jr_01d_5c49:
    call nc, $a4e6
    rlca
    ret nc

jr_01d_5c4e:
    ld bc, $6243
    ret nc

    rlca
    halt
    db $dd
    ret nc

    rlca
    call nc, $80e5

jr_01d_5c5a:
    and $53
    add sp, $08
    add b
    ld d, b
    db $10
    add b
    ld d, b
    db $10
    add b
    ld d, b
    db $10
    add b
    ld d, b
    db $10
    add b
    ld d, b
    db $10
    add b
    ld h, b
    jr nc, jr_01d_5c49

    or b
    pushx @ + $3060
    ret c

    or b
    pushx @ + $3060
    ret c

    or b
    pushx @ + $3060
    ret c

    or b
    pushx @ + $3060
    ret c

    or b
    pushx @ + $8010
    ld d, b
    db $10
    add b
    ld d, b
    db $10
    add b
    ld d, b
    db $10
    add b
    ld d, b
    db $10
    add b
    ld d, b
    db $10
    add b
    or b
    add b
    ld b, b
    or b
    add b
    ld b, b
    or b
    add b
    ld b, b
    or b
    add b
    ld b, b
    or b
    add b
    and b
    sub b
    sbc $ff
    ret nc

    rlca
    add sp, $06
    rst $20
    ld [bc], a
    jp hl


    ld h, b
    and $20
    pop de
    ld b, b
    ld b, b
    ld bc, $4040
    ld bc, $40d7
    ld b, b
    ld bc, $4040
    ld bc, $40d8
    ld b, b
    ld b, b
    ld b, b
    pushx @ + $4040
    ret c

    ld b, b
    ld [bc], a
    ld b, b
    ld b, b
    pushx @ + $4040
    ret c

    ld b, b
    nop
    rlca
    pushx @ + $01d0
    ld b, e
    ld h, d
    ret nc

    rlca
    halt
    ret c

    db $dd
    pop de
    jr nc, jr_01d_5d13

    inc bc
    jr nc, @+$32

    ld bc, $0230
    db $10
    jr nc, jr_01d_5cfc

    db $10
    inc bc
    db $10
    db $10
    ld bc, $0210
    or b
    pushx @ + $d810
    jr nc, jr_01d_5d29

    inc bc
    jr nc, @+$32

jr_01d_5cfc:
    ld bc, $0230
    pushx @ + $d830
    jr nc, jr_01d_5d64

    ld h, b
    nop
    ld h, b
    ld bc, $6060
    ld bc, $0160
    ld h, b
    ld d, b
    ld b, b
    sbc $ff
    ret nc

jr_01d_5d13:
    rlca
    pop de
    add sp, $08
    db $10
    db $10
    ld [hl], b
    ld [hl], b
    db $10
    db $10
    ld [hl], b
    ld [hl], b
    db $10
    db $10
    ld [hl], b
    ld [hl], b
    db $10
    db $10
    ld [hl], b
    ld [hl], b
    jr nc, jr_01d_5d59

jr_01d_5d29:
    jr nc, jr_01d_5d5b

    jr nc, jr_01d_5d5d

    jr nc, jr_01d_5d9f

    sub b
    ld [hl], b
    jr nc, jr_01d_5d63

    db $10
    db $10
    jr nc, jr_01d_5da7

    ret nc

    ld bc, $d7d7
    jp $c3c2


    jp nz, $07d0

    ret nz

    ret nz

    and b
    and b
    add c
    ret c

    ret c

    and c
    ld de, $1111
    db $dd
    db $10
    db $10
    ld [hl], b
    ld [hl], b
    jr nc, jr_01d_5dc3

    db $10
    db $10
    ld [hl], b
    ld [hl], b
    db $10
    ld [hl], b

jr_01d_5d59:
    jr nc, @+$72

jr_01d_5d5b:
    ld [hl], b
    ld [hl], b

jr_01d_5d5d:
    db $10
    db $10
    ld [hl], b
    ld [hl], b
    jr nc, jr_01d_5dd3

jr_01d_5d63:
    db $10

jr_01d_5d64:
    db $10
    ld [hl], b
    ld [hl], b
    db $10
    ld [hl], b
    jr nc, @+$72

    ld [hl], b
    ld [hl], b
    db $10
    db $10
    ld [hl], b
    ld [hl], b
    jr nc, jr_01d_5de3

    db $10
    db $10
    ld [hl], b
    ld [hl], b
    db $10
    ld [hl], b
    jr nc, jr_01d_5deb

    ld [hl], b
    ld [hl], b
    db $10
    db $10
    ld [hl], b
    db $10
    jr nc, @+$72

    db $10
    db $10
    ld [hl], b
    ld [hl], b
    db $10
    db $10
    jr nc, jr_01d_5dfb

    jr nc, @+$32

    sbc $ff
    ret nc

    dec b
    add sp, $08
    ld [$eb0d], a
    ld bc, $e5d3
    nop
    and $97
    inc de
    and e
    ld d, e

jr_01d_5d9f:
    ld [hl], e
    pushx @ + $d823
    sub e
    jp Jump_01d_73d7


jr_01d_5da7:
    inc hl
    inc sp
    ret c

    add e
    pushx @ + $e653
    add b
    cp a
    and $87
    or a
    and $80
    trap $e6
    add a
    rst $00
    db $dd
    ret nc

    dec b
    ld [$eb0d], a
    ld bc, $e5d3
    nop

jr_01d_5dc3:
    and $97
    db $d3
    dec d
    dec [hl]
    ld h, l
    and e
    and $80
    add l
    and $87
    adc c
    pushx @ + $97e6

jr_01d_5dd3:
    ld de, $20e6
    ld de, $97e6
    ld de, $20e6
    ld de, $97e6
    ld de, $15d8
    dec [hl]

jr_01d_5de3:
    ld h, l
    and c
    or c
    and $90
    add l
    and $97

jr_01d_5deb:
    adc c
    pushx @ + $97e6
    ld de, $20e6
    ld de, $97e6
    ld de, $20e6
    ld de, $97e6

jr_01d_5dfb:
    ld de, $d4d8
    and $97
    ld b, a
    and $20
    ld b, c
    and $97
    ld b, c
    scf
    and $20
    ld sp, $97e6
    ld sp, $c5d8
    pushx @ + $70e6
    dec d

jr_01d_5e14:
    and $77
    dec de

jr_01d_5e17:
    and $97
    ret c

jr_01d_5e1a:
    cp e
    xor c
    and $20
    and c
    and $97
    ld [hl], l
    add a
    pushx @ + $97e6
    db $10
    and $50
    db $10
    and $97
    jr nz, jr_01d_5e14

    ld d, b
    jr nz, jr_01d_5e17

    sub a
    jr nc, jr_01d_5e1a

    ld d, b
    jr nc, @-$18

    sub a
    ld b, b
    and $50
    ld b, b
    and $97
    ld d, b
    and $50
    ld d, b
    ret c

    and $97
    dec d
    dec [hl]
    ld h, l
    and e
    and $90
    add l
    and $97
    adc c
    pushx @ + $97e6
    ld de, $20e6
    ld de, $97e6
    ld de, $20e6
    ld de, $97e6
    ld de, $15d8
    dec [hl]
    ld h, l
    and c
    or c
    and $90
    add l
    and $97
    adc c
    pushx @ + $97e6
    ld de, $20e6
    ld de, $97e6
    ld de, $20e6
    ld de, $97e6
    ld de, $97e6
    ld b, a
    and $20
    ld b, c
    and $97
    ld b, c
    and $97
    scf
    and $20
    ld sp, $97e6
    ld sp, $c5d8

jr_01d_5e8f:
    pushx @ + $70e6

jr_01d_5e92:
    dec d
    and $77

jr_01d_5e95:
    dec de
    and $97

jr_01d_5e98:
    ret c

    cp e
    xor c
    ld bc, $8775
    pushx @ + $97e6
    db $10
    and $50
    db $10
    and $97
    jr nz, jr_01d_5e8f

jr_01d_5ea9:
    ld d, b
    jr nz, jr_01d_5e92

jr_01d_5eac:
    sub a
    jr nc, jr_01d_5e95

    ld d, b
    jr nc, jr_01d_5e98

    sub a
    ld b, b
    and $50
    ld b, b
    and $97
    ld d, b
    and $50
    ld d, b
    push hl
    nop
    and $97
    jr nc, jr_01d_5ea9

jr_01d_5ec3:
    ld d, b
    jr nc, jr_01d_5eac

jr_01d_5ec6:
    sub a
    db $10
    and $50
    db $10
    ret c

    and $97
    ret nz

    and $50
    ret nz

    and $90
    and l
    and $97
    and l
    pushx @ + $97e6
    jr nc, jr_01d_5ec3

    ld d, b
    jr nc, jr_01d_5ec6

    sub a

jr_01d_5ee1:
    db $10
    and $50

jr_01d_5ee4:
    db $10
    ret c

    and $97
    ret nz

    and $50
    ret nz

    and $97
    and l
    add e
    and $90
    rst $00
    and $97
    push bc
    pushx @ + $97e6
    jr nc, jr_01d_5ee1

jr_01d_5efb:
    ld d, b
    jr nc, jr_01d_5ee4

jr_01d_5efe:
    sub a
    db $10
    and $50
    db $10
    ret c

    and $97
    ret nz

    and $50
    ret nz

    and $90
    and l
    and $97
    and l
    pushx @ + $97e6
    jr nc, jr_01d_5efb

    ld d, b
    jr nc, jr_01d_5efe

    sub a
    db $10
    and $50
    db $10
    ret c

    and $97
    ret nz

    and $50
    ret nz

    and $97
    and l
    or e
    pushx @ + $90e6
    ld h, c

jr_01d_5f2c:
    and $97
    ld h, a
    ret nc

    ld bc, $92e6
    ld h, [hl]
    and $20
    ld h, d
    and $92
    ld h, [hl]
    and $20
    ld h, d
    ret nc

    dec b
    and $97
    jr nc, @-$18

jr_01d_5f43:
    ld d, b
    jr nc, jr_01d_5f2c

jr_01d_5f46:
    sub a
    db $10
    and $50
    db $10
    ret c

    and $97
    ret nz

    and $50
    ret nz

    and $90
    and l
    and $97
    and l
    pushx @ + $97e6
    jr nc, jr_01d_5f43

    ld d, b
    jr nc, jr_01d_5f46

    sub a

jr_01d_5f61:
    db $10
    and $50

jr_01d_5f64:
    db $10
    ret c

    and $97
    ret nz

    and $50
    ret nz

    and $97
    and l
    add e
    and $90
    rst $00
    and $97
    push bc
    pushx @ + $97e6
    jr nc, jr_01d_5f61

jr_01d_5f7b:
    ld d, b
    jr nc, jr_01d_5f64

jr_01d_5f7e:
    sub a
    db $10
    and $50
    db $10
    ret c

    and $97
    ret nz

    and $50
    ret nz

    and $90
    and l
    and $97
    and l
    pushx @ + $97e6
    jr nc, jr_01d_5f7b

    ld d, b
    jr nc, jr_01d_5f7e

    sub a
    db $10
    and $50
    db $10
    ret c

    and $97
    ret nz

    and $50
    ret nz

    and $97
    and l
    or e
    pushx @ + $90e6
    ld h, c
    and $97
    ld h, a
    ret nc

    ld bc, $92e6
    ld h, [hl]
    and $20
    ld h, d
    and $92
    ld h, [hl]
    and $20
    ld h, d
    ret nc

    dec b
    ld [$eb09], a
    dec bc
    push hl
    ld b, b
    and $86
    call nc, $d315
    ld h, l
    db $d3
    push bc
    db $d3
    ld h, l
    call nc, $d315
    ld h, l
    db $d3
    push bc
    db $d3
    ld h, l
    call nc, $d335
    add l
    call nc, $d325
    add l
    call nc, $d335
    add l
    call nc, $d325
    add l
    call nc, $d315
    ld h, l
    db $d3
    push bc
    db $d3
    ld h, l
    call nc, $d315
    ld h, l
    db $d3
    push bc
    db $d3
    ld h, l
    call nc, $d335
    add l
    call nc, $d325
    add l
    call nc, $d335
    add l
    call nc, Call_000_1121
    ld hl, $10e6
    dec h
    sbc $ff
    ret nc

    dec b
    add sp, $08
    jp nc, $80e5

    and $87
    add e
    pushx @ + $d853
    jp $23d7


    sub e
    ld b, e
    ld [hl], e
    pushx @ + $d823
    sub e
    and e
    inc sp
    jp $e6d7


    ld [hl], b
    ld l, a
    and $67
    ld h, a
    and $70
    ld a, a
    and $67
    ld [hl], a
    db $dd
    ret nc

    dec b
    push hl
    nop
    and $87
    jp nc, $c5a5

    pushx @ + $6335
    and $80
    ld d, l
    and $87
    ld e, c
    and $87
    add c
    and $20
    add c
    and $87
    add c
    and $20
    add c
    and $87
    add c
    ret c

    and $87
    and l
    push bc
    pushx @ + $6135
    ld h, c
    and $80
    ld d, l
    and $87
    ld e, c
    and $87
    add c
    and $20
    add c
    and $87
    add c
    and $20
    add c
    and $87
    add c
    pushx @ + $87e6
    rla
    and $20
    ld de, $87e6
    ld de, $c7d8
    and $20
    pop bc
    and $87
    pop bc
    sub l
    and $70
    and l
    and $77
    xor e
    and $87
    adc e

jr_01d_608f:
    ld a, c
    and $20
    ld [hl], c
    and $87
    ld b, l
    ld d, a
    and $87
    and b

jr_01d_609a:
    and $50
    and b
    and $87
    or b
    and $50
    or b
    and $87
    ret nz

    and $50
    ret nz

    pushx @ + $87e6
    db $10
    and $50
    db $10
    and $87
    jr nz, jr_01d_609a

    ld d, b
    jr nz, jr_01d_608f

    ret c

    and $87
    and l
    push bc
    pushx @ + $6335
    and $80
    ld d, l
    and $87
    ld e, c
    and $87
    add c
    and $20
    add c
    and $87
    add c
    and $20
    add c
    and $87
    add c
    ret c

    and l
    push bc
    pushx @ + $6135
    ld h, c
    and $80
    ld d, l
    and $87
    ld e, c
    and $87
    add c
    and $20
    add c
    and $87
    add c
    and $20
    add c
    and $87
    add c
    pushx @ + $87e6
    rla
    and $20
    ld de, $87e6
    ld de, $e6d8
    add a
    rst $00
    and $20
    pop bc
    and $87
    pop bc
    sub l
    and $70
    and l
    and $77
    xor e
    and $87
    adc e
    and $87

jr_01d_6110:
    ld a, c
    and $20
    ld [hl], c
    and $87
    ld b, l
    ld d, a
    and $87
    and b

jr_01d_611b:
    and $50
    and b
    and $87
    or b
    and $50
    or b
    and $87
    ret nz

    and $50
    ret nz

    pushx @ + $87e6
    db $10
    and $50
    db $10
    and $87
    jr nz, jr_01d_611b

    ld d, b
    jr nz, jr_01d_6110

    and $97
    ret nz

    and $50
    ret nz

    and $97
    and b
    and $50
    and b
    and $97
    sub b
    and $50
    sub b
    and $80
    ld [hl], l
    and $87
    ld [hl], l
    and $97
    ret nz

    and $50
    ret nz

    and $97
    and b
    and $50
    and b
    and $97
    sub b
    and $50
    sub b
    and $87
    ld [hl], l
    ld d, e
    and $80
    sub a
    and $87
    sub l
    and $97
    ret nz

    and $50
    ret nz

    and $97
    and b
    and $50
    and b
    and $97
    sub b
    and $50
    sub b
    and $80
    ld [hl], l
    and $87
    ld [hl], l
    and $97
    ret nz

    and $50
    ret nz

    and $97
    and b
    and $50
    and b
    and $97
    sub b
    and $50
    sub b
    and $87
    ld [hl], l
    add e
    pushx @ + $80e6
    ld sp, $87e6
    scf
    ret nc

    ld bc, $82e6
    ld [hl], $e6
    jr nz, jr_01d_61db

    and $82
    ld [hl], $e6
    jr nz, @+$34

    ret nc

    dec b
    ret c

    and $97
    ret nz

    and $50
    ret nz

    and $97
    and b
    and $50
    and b
    and $97
    sub b
    and $50
    sub b
    and $80
    ld [hl], l
    and $87
    ld [hl], l
    and $97
    ret nz

    and $50
    ret nz

    and $97
    and b
    and $50
    and b
    and $97
    sub b
    and $50

jr_01d_61db:
    sub b
    and $87
    ld [hl], l
    ld d, e
    and $80
    sub a
    and $87
    sub l
    and $97
    ret nz

    and $50
    ret nz

    and $97
    and b
    and $50
    and b
    and $97
    sub b
    and $50
    sub b
    and $80
    ld [hl], l
    and $87
    ld [hl], l
    and $97
    ret nz

    and $50
    ret nz

    and $97
    and b
    and $50
    and b
    and $97
    sub b
    and $50
    sub b
    and $87
    ld [hl], l
    add e
    pushx @ + $80e6
    ld sp, $87e6
    scf
    ret nc

    ld bc, $82e6
    ld [hl], $e6
    jr nz, jr_01d_6255

    and $82
    ld [hl], $e6
    jr nz, jr_01d_625b

    ret nc

    dec b
    ret nc

    dec b
    call nc, $80e5
    and $77
    dec b
    and $67
    ld d, l
    dec [hl]
    add l
    ld d, l
    dec [hl]
    ret c

    and a
    and $20
    and e
    and $10
    and l
    pushx @ + $67e6
    ld [hl], l
    ld d, l
    and l
    ld [hl], l
    ld d, l
    ret c

    and l
    rst $00
    and $20
    jp $e6d7


    ld h, a
    ld d, l
    dec [hl]

jr_01d_6255:
    add l
    ld d, l
    dec [hl]
    ret c

    and l
    add a

jr_01d_625b:
    and $20
    add e
    pushx @ + $67e6
    ld [hl], l
    ld d, l
    and e
    pop bc
    ld [hl], c
    and $20
    ld [hl], e
    and $67
    ld d, c
    ret c

    pop bc
    pushx @ + $7151
    ld h, c
    ld [hl], c
    and $10
    ld [hl], l
    sbc $ff
    ret nc

    dec b
    add sp, $07
    rst $20
    ld [bc], a
    jp hl


    ld h, b
    and $20
    pop de
    add sp, $08
    inc sp
    jp $9373


    pushx @ + $d843
    or e
    pushx @ + $9323
    ld b, e
    ld d, e
    ret c

    and e
    pushx @ + $d773
    rst $20
    dec b
    and $20
    rra
    reti


    ld de, $02e7
    and $40
    dec d
    rst $20
    dec b
    and $20
    cpl
    reti


    ld hl, $02e7
    and $40
    dec h
    db $dd
    rst $20
    ld [bc], a
    pop de
    and $20
    add sp, $08
    rst $18
    ld [bc], a
    rst $18
    inc b
    add c
    and $60
    add c
    and $20
    add c
    ldh [$df], a
    inc b
    ld de, $60e6
    ld de, $20e6
    ld de, $e0e0
    add sp, $07
    rst $18
    inc bc
    ld de, $11d7
    ret c

    ld de, $1111
    ld de, $d711
    ld de, $11d8
    ld de, $1111
    ldh [rNR11], a
    pushx @ + $d811
    ld de, $1111
    ld de, $8181
    add c
    add c
    add c
    add c
    add sp, $08
    rst $18
    ld [bc], a
    rst $18
    inc b
    add c
    and $60
    add c
    and $20
    add c
    ldh [$df], a
    inc b
    ld de, $60e6
    ld de, $20e6
    ld de, $e0e0
    add sp, $07
    rst $18
    inc bc
    ld de, $11d7
    ret c

    ld de, $1111
    ld de, $d711
    ld de, $11d8
    ld de, $1111
    ldh [rNR11], a
    pushx @ + $d811
    ld de, $1111
    ld de, $8181
    add c
    add c
    add c
    add c
    rst $18
    rlca
    and c
    and c
    and c
    and c
    and c
    and c
    and c
    and c
    and c
    and c
    and c
    and c
    ldh [$a1], a
    and c
    and c
    and c
    and c
    ld de, $11d7
    ret c

    ld de, $11d7
    ret c

    ld de, $11d7
    ret c

    ld de, $3131
    ld sp, $5131
    ld h, c
    add c
    add c
    add c
    add c
    ld h, c
    ld d, c
    ld sp, $3131
    ld sp, $6151
    add c
    add c
    add c
    add c
    ld h, c
    ld sp, $5151
    ld d, c
    ld d, c
    ld [hl], c
    add c
    and c
    and c
    and c
    and c
    add c
    ld [hl], c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld [hl], c
    add c
    and c
    and c
    and c
    and c
    add c
    ld d, c
    ld sp, $3131
    ld sp, $6151
    add c
    add c
    add c
    add c
    ld h, c
    ld d, c
    ld sp, $3131
    ld sp, $6151
    add c
    add c
    add c
    add c
    ld h, c
    ld sp, $5151
    ld d, c
    ld d, c
    ld [hl], c
    add c
    and c
    and c
    and c
    and c
    add c
    ld [hl], c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld [hl], c
    add c
    and c
    sub c
    and c
    dec b
    sbc $ff
    ret nc

    dec b
    pop de
    rst $18
    inc c
    pushx @ + $d821
    ld [hl], c
    ldh [$a5], a
    ld de, $1103
    inc bc
    ld de, $1103
    inc bc
    ld de, $d703
    pop bc
    ret nz

    ret nz

    pop bc
    and c
    add c
    add c
    ret c

    db $dd
    pop de
    ld de, $1171
    ld sp, $1171
    ld de, $1171
    ld sp, $1171
    ld de, $1171
    ld sp, $1171
    ld de, $7191
    sub c
    ld [hl], c
    sub c
    ld de, $1171
    ld sp, $1171
    ld de, $1171
    ld sp, $1171
    ld de, $1171
    ld sp, $1171
    ld de, $1131
    pushx @ + $a1c1
    add c
    ret c

    ld sp, $3171
    ld sp, $9131
    ld sp, $3171
    ld sp, $9131
    ld sp, $3171
    ld sp, $9131
    ld sp, $3131
    ld sp, $3191
    ld sp, $3191
    ld sp, $9131
    ld sp, $3191
    ld sp, $9131
    ld sp, $3191
    ld sp, $9131
    pushx @ + $c0c1
    ret nz

    pop bc
    and c
    add c
    add c
    ret c

    ld de, $1171
    ld sp, $1171
    ld de, $1171
    ld sp, $1171
    ld de, $1171
    ld sp, $1171
    ld de, $7191
    sub c
    ld [hl], c
    sub c
    ld de, $1171
    ld sp, $1171
    ld de, $1171
    ld sp, $1171
    ld de, $1171
    ld sp, $1171
    ld de, $1131
    pushx @ + $a1c1
    add c
    ret c

    ld sp, $3171
    ld sp, $9131
    ld sp, $3171
    ld sp, $9131
    ld sp, $3171
    ld sp, $9131
    ld sp, $3131
    ld sp, $3191
    ld sp, $3191
    ld sp, $9131
    ld sp, $3191
    ld sp, $9131
    ld sp, $3191
    ld sp, $9131
    pushx @ + $c0c1
    ret nz

    pop bc
    and c
    add c
    add c
    ret c

    ld de, $1171
    ld sp, $1171
    ld de, $1171
    ld sp, $1171
    ld de, $1171
    ld sp, $1171
    ld de, $7131
    ld sp, $9131
    ld de, $1171
    ld sp, $1171
    ld de, $1171
    ld sp, $1171
    ld de, $1171
    ld sp, $1171
    ld de, $7131
    ld sp, $3131
    ld de, $1171
    ld sp, $1171
    ld de, $1171
    ld sp, $1171
    ld de, $1171
    ld sp, $1171
    ld de, $7131
    ld sp, $9131
    ld de, $1171
    ld sp, $1171
    ld de, $1171
    ld sp, $1171
    ld de, $1171
    ld sp, $1171
    ld de, $7131
    ld sp, $3131
    ld de, $1171
    ld sp, $9111
    ld de, $1171
    ld sp, $9111
    ld de, $1171
    ld sp, $9111
    ld de, $1171
    ld sp, $9111
    ld de, $1171
    ld sp, $7111
    ld de, $7131
    ld de, $1131
    sub c
    ld de, $1171
    ld sp, $9111
    ld de, $7131
    ld sp, $1171
    ld [hl], c
    ld de, $1131
    sub c
    ld de, $1171
    ld sp, $9111
    ld de, $1171
    ld sp, $9111
    ld de, $1171
    ld sp, $1131
    ld de, $1171
    ld sp, $9111
    ld de, $1171
    ld sp, $9111
    ld de, $1171
    ld sp, $9111
    ld sp, $3131
    pushx @ + $c0c0
    and b
    and b
    add b
    add b
    ret c

    sbc $ff
    ld de, $3191
    ld sp, $d731
    ret nz

    ret nz

    and b
    and b
    add b
    add b
    ret c

    sbc $ff
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
    nop
    nop
    jp Jump_01d_6c06


    jp Jump_01d_6c53


Jump_01d_6c06:
    add a
    ld c, a
    ld b, $00
    ld a, [$df63]
    or a
    jr z, jr_01d_6c13

    call Call_01d_6e1a

jr_01d_6c13:
    ld a, $01
    ld [$df63], a
    ld hl, $6e31
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]
    ld [$de9c], a
    ld [$df64], a
    ld de, $df5b
    ld c, $00

jr_01d_6c2b:
    ld a, [$df64]
    rrca
    ld [$df64], a
    jr nc, jr_01d_6c4a

    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    push hl
    ld hl, $df3f
    add hl, bc
    ld [hl], $00
    ld hl, $df43
    add hl, bc
    ld [hl], $01
    pop hl
    jr jr_01d_6c4c

jr_01d_6c4a:
    inc de
    inc de

jr_01d_6c4c:
    inc c
    ld a, $04
    cp c
    jr nz, jr_01d_6c2b

    ret


Jump_01d_6c53:
    ld a, [$de9c]
    or a
    jr nz, jr_01d_6c5d

    call Call_01d_6e0d
    ret


jr_01d_6c5d:
    xor a
    ld b, a
    ld c, a
    ld a, [$de9c]
    ld [$df64], a

jr_01d_6c66:
    ld hl, $df64
    ld a, [hl]
    rrca
    ld [hl], a
    jr nc, jr_01d_6c87

    ld hl, $df43
    add hl, bc
    ld a, [hl]
    dec a
    jr z, jr_01d_6c7c

    ld [hl], a
    call Call_01d_6d68
    jr jr_01d_6c87

jr_01d_6c7c:
    ld hl, $df5b
    add hl, bc
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call Call_01d_6c8e

jr_01d_6c87:
    inc c
    ld a, c
    cp $04
    jr nz, jr_01d_6c66

    ret


Call_01d_6c8e:
Jump_01d_6c8e:
    ld a, [hl]
    and $f0
    swap a
    add a
    ld e, a
    ld d, $00
    ld a, [hl+]
    push hl
    and $0f
    ld hl, $6ca5
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld h, d
    ld l, e
    jp hl


    ret z

    ld l, h
    di
    ld l, h
    inc c
    ld l, l
    dec e
    ld l, l
    ld [hl-], a
    ld l, l
    ld c, e
    ld l, l
    ld d, a
    ld l, l
    and e
    ld l, l
    adc $6d
    push bc
    ld l, h
    push bc
    ld l, h
    push bc
    ld l, h
    push bc
    ld l, h
    push bc
    ld l, h
    push bc
    ld l, h
    ld [$c36d], a
    adc [hl]
    ld l, h
    ld d, a
    pop hl
    ld a, [hl+]
    ld e, a
    push hl
    ld hl, $df47
    add hl, bc
    add hl, bc
    ld [hl+], a
    ld [hl], d
    ld hl, $df3b
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

Jump_01d_6cea:
    ld hl, $df5b
    add hl, bc
    add hl, bc
    ld [hl], e
    inc hl
    ld [hl], d
    ret


    ld hl, $df3b
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
    jp Jump_01d_6c8e


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
    jp Jump_01d_6c8e


    ld hl, $df53
    add hl, bc
    add hl, bc
    pop de
    ld a, [de]
    inc de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $df4f
    add hl, bc
    ld [hl], a
    ld l, e
    ld h, d
    jp Jump_01d_6c8e


    ld hl, $df4f
    add hl, bc
    ld a, [hl]
    dec a
    jr z, jr_01d_6d47

    ld [hl], a
    ld hl, $df53
    add hl, bc
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    jp Jump_01d_6c8e


jr_01d_6d47:
    pop hl
    jp Jump_01d_6c8e


    ld hl, $df3f
    add hl, bc
    ld e, l
    ld d, h
    pop hl
    ld a, [hl+]
    ld [de], a
    jp Jump_01d_6c8e


    call Call_01d_6d68
    ld hl, $df43
    add hl, bc
    ld e, l
    ld d, h
    pop hl
    ld a, [hl+]
    ld [de], a
    ld e, l
    ld d, h
    jp Jump_01d_6cea


Call_01d_6d68:
    ld hl, $df3f
    add hl, bc
    ld a, [hl]
    or a
    jr z, jr_01d_6da2

    ld hl, $df47
    add hl, bc
    add hl, bc
    bit 7, a
    jr z, jr_01d_6d85

    xor $ff
    inc a
    ld d, a
    ld a, [hl]
    sub d
    ld [hl+], a
    ld e, a
    ld a, [hl]
    sbc b
    jr jr_01d_6d8c

jr_01d_6d85:
    ld d, a
    ld a, [hl]
    add d
    ld [hl+], a
    ld e, a
    ld a, [hl]
    adc b

jr_01d_6d8c:
    ld [hl], a
    ld hl, $df3b
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

jr_01d_6da2:
    ret


    add a
    ld d, $00
    ld e, a
    ld hl, $6ec6
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, $00
    ldh [rNR30], a
    ld b, d
    ld de, $ff30

jr_01d_6db6:
    ld a, [hl+]
    ld [de], a
    inc de
    inc b
    ld a, b
    cp $10
    jr nz, jr_01d_6db6

    ld a, $01
    ld [$de9b], a
    ld a, $80
    ldh [rNR30], a
    ld b, $00
    pop hl
    jp Jump_01d_6c8e


    pop hl
    ld a, [hl+]
    push hl
    push bc
    inc c
    ld e, $ee

jr_01d_6dd5:
    dec c
    jr z, jr_01d_6ddd

    rlca
    rlc e
    jr jr_01d_6dd5

jr_01d_6ddd:
    ld d, a
    ld hl, $de95
    ld a, [hl]
    and e
    or d
    ld [hl], a
    pop bc
    pop hl
    jp Jump_01d_6c8e


    ld e, c
    inc e
    ld a, $7f

jr_01d_6dee:
    rlca
    dec e
    jr nz, jr_01d_6dee

    ld e, a
    ld a, [$de9c]
    and e
    ld [$de9c], a
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


Call_01d_6e0d:
    xor a
    ld [$df63], a
    ld [$de93], a
    ld a, $80
    ld [$de92], a
    ret


Call_01d_6e1a:
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
    ld [$de9c], a
    ret


    ld l, e
    ld l, [hl]
    ld l, h
    ld l, [hl]
    ld l, a
    ld l, [hl]
    ld [hl], d
    ld l, [hl]
    ld [hl], l
    ld l, [hl]
    ld a, b
    ld l, [hl]
    ld a, e
    ld l, [hl]
    add b
    ld l, [hl]
    add e
    ld l, [hl]
    add [hl]
    ld l, [hl]
    adc c
    ld l, [hl]
    adc h
    ld l, [hl]
    adc a
    ld l, [hl]
    sub d
    ld l, [hl]
    sub l
    ld l, [hl]
    sbc b
    ld l, [hl]
    sbc a
    ld l, [hl]
    and d
    ld l, [hl]
    and l
    ld l, [hl]
    xor b
    ld l, [hl]
    xor e
    ld l, [hl]
    xor [hl]
    ld l, [hl]
    or c
    ld l, [hl]
    or h
    ld l, [hl]
    or a
    ld l, [hl]
    cp d
    ld l, [hl]
    cp l
    ld l, [hl]
    ret nz

    ld l, [hl]
    jp $006e


    ld [bc], a
    ld l, b
    ld l, a
    ld [bc], a
    adc l
    ld l, a
    ld [bc], a
    sbc l
    ld l, a
    ld [bc], a
    jp Jump_000_026f


    rst $20
    ld l, a
    ld a, [bc]
    rst $38
    ld l, a
    jr c, jr_01d_6ef0

    ld [bc], a
    ld b, h
    ld [hl], b
    ld [bc], a
    and b
    ld [hl], b
    ld [bc], a
    ret nz

    ld [hl], b
    ld [bc], a
    and $70
    ld [bc], a
    ld a, [bc]
    ld [hl], c
    ld [bc], a
    ld [hl+], a
    ld [hl], c
    ld [bc], a
    ld b, [hl]
    ld [hl], c
    ld [bc], a
    ld h, h
    ld [hl], c
    rlca
    sub [hl]
    ld [hl], c
    db $ec
    ld [hl], c
    ld [hl], h
    ld [hl], d
    ld [$72de], sp
    ld [bc], a
    inc h
    ld [hl], e
    ld [$7396], sp
    ld [$73be], sp
    ld [bc], a
    and $73
    ld [bc], a
    dec l
    ld [hl], h
    ld [$7476], sp
    ld [$749e], sp
    ld [$74be], sp
    ld [$7519], sp
    ld [bc], a
    ld l, $75
    ld [$771e], sp
    ld [$7741], sp
    ret c

    ld l, [hl]
    add sp, $6e
    ld hl, sp+$6e
    ld [$186f], sp
    ld l, a
    jr z, jr_01d_6f41

    jr c, jr_01d_6f43

    ld c, b
    ld l, a
    ld e, b
    ld l, a
    ld a, d
    rst $18
    rst $38
    jp c, Jump_000_1074

    nop
    inc d
    ld a, d
    rst $18
    rst $38
    jp c, Jump_000_1074

    nop
    inc d
    ld [de], a
    inc hl
    inc sp
    ld b, h
    ld d, l
    ld h, [hl]
    ld [hl], a
    ld [hl], a

jr_01d_6ef0:
    ld a, b
    adc c
    sbc d
    xor e
    cp e
    call z, $eedd
    cp e
    cp e
    cp e
    db $dd
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
    ld a, c
    cp l
    rst $38
    rst $38
    rst $38
    rst $38
    db $fd
    cp c
    ld [hl], l
    ld sp, $0000
    nop
    nop
    ld bc, $7935
    adc $ee
    ret


    ld [hl], h
    ld hl, $2411
    ld a, c
    adc $ee
    ret


    ld [hl], h
    ld hl, $2411
    xor d
    xor d
    xor d
    call z, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $aaaa
    xor d
    call z, $2222
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a

jr_01d_6f41:
    ld [hl+], a
    ld [hl+], a

jr_01d_6f43:
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld a, c
    cp l
    db $dd
    cp c
    ld [hl], l
    ld [hl-], a
    ld de, $7935
    cp l
    db $dd
    cp c
    ld [hl], l
    ld [hl-], a
    ld de, $9935
    sbc c
    sbc c
    cp e
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    add b
    ld de, $1024
    cp b
    ld b, $72
    rlca
    and d
    dec b
    db $ed
    jr z, jr_01d_6f85

    or b
    rlca
    add hl, sp
    rlca
    add e
    rlca
    sub $10
    add b
    rlca
    add hl, sp
    rlca
    add e
    rlca
    sub $10

jr_01d_6f85:
    jr nz, jr_01d_6f8e

    add hl, sp
    rlca
    add e
    rlca
    sub $f0
    add b

jr_01d_6f8e:
    ld de, $1028
    ret nc

    rlca
    dec b
    db $10
    ldh a, [rTAC]
    ld b, h
    db $10
    and b
    rlca
    sub a
    ldh a, [$80]
    ld de, $1028
    ldh a, [rTAC]
    ld e, c
    rlca
    add hl, sp
    rlca
    or [hl]
    rlca
    xor h
    db $10
    and b
    rlca
    ld e, c
    rlca
    ld e, c
    rlca
    or [hl]
    rlca
    xor h
    db $10
    add b
    rlca
    ld e, c
    rlca
    add hl, sp
    rlca
    xor h
    db $10
    ld b, b
    rlca
    ld e, c
    rlca
    xor h
    ldh a, [$80]
    ld de, $1028
    ldh a, [rTAC]
    add e
    rlca
    xor h
    rlca
    add e
    db $10
    ret nz

    rlca
    xor h
    rlca
    ret z

    rlca
    xor h
    db $10
    ld [hl], b
    rlca
    sub b
    rlca
    or [hl]
    rlca
    sub b
    db $10
    and b
    rlca
    or [hl]
    rlca
    adc $07
    or [hl]
    ldh a, [$80]
    ld de, $1028
    ldh a, [rTAC]
    cp [hl]
    ld d, b
    adc $60
    inc bc
    db $10
    pop af
    rlca
    pop bc
    rlca
    ret z

    rlca
    sub $07
    pop bc
    rlca
    adc $f0
    add b
    ld de, $1028
    adc $07
    cp [hl]
    rlca
    cp d
    rlca
    or [hl]
    rlca
    or c
    rlca
    xor h
    rlca
    and a
    rlca
    and d
    rlca
    sbc l
    db $10
    ldh a, [rNR41]
    rlca
    cp [hl]
    rlca
    sub b
    rlca
    or [hl]
    db $10
    ldh a, [rTAC]
    ld e, c
    rlca
    add hl, sp
    rlca
    pop de
    rlca
    sub $10
    or b
    rlca
    ld e, c
    rlca
    add hl, sp
    rlca
    pop de
    rlca
    sub $10
    ld [hl], b
    rlca
    ld e, c
    rlca
    pop de
    ldh a, [$80]
    ld de, $6e10
    jr nc, jr_01d_7042

    nop
    rlca
    nop
    rlca

jr_01d_7042:
    ld b, b
    ldh a, [$80]
    ld de, $1028
    ldh a, [rTAC]
    add e
    ld d, b
    and [hl]
    ld h, b
    inc bc
    db $10
    ldh a, [rTMA]
    or d
    ld b, $0b
    ld b, $72
    db $10
    ret nc

    rlca
    or [hl]
    rlca
    sub b
    rlca
    and a
    db $10
    sub b
    ld b, $f6
    ld b, $72
    ld b, $c4
    db $10
    add b
    rlca
    pop bc
    rlca
    and d
    rlca
    or [hl]
    db $10
    ld [hl], b
    rlca
    ld hl, $b206
    ld b, $f6
    db $10
    ld h, b
    rlca
    adc $07
    or [hl]
    rlca
    push bc
    db $10
    ld d, b
    rlca
    ld c, a
    ld b, $f6
    rlca
    dec l
    db $10
    ld b, b
    rlca
    sub $07
    pop bc
    rlca
    ret z

    db $10
    jr nc, @+$09

    ld l, e
    rlca
    ld hl, $4f07
    db $10
    jr nz, jr_01d_70a1

    rst $18
    rlca
    adc $07
    reti


    ldh a, [$80]

jr_01d_70a1:
    ld de, $102c
    ldh a, [rTAC]
    sub b
    rlca
    cp [hl]
    rlca
    ld hl, $7b07
    db $10
    ret nc

    rlca
    sub b
    rlca
    cp [hl]
    db $10
    or b
    rlca
    ld hl, $7b07
    db $10
    ld h, b
    rlca
    sub b
    rlca
    cp [hl]
    ldh a, [$80]
    ld de, $1028
    ldh a, [rTAC]
    ld e, c
    rlca
    ld b, h
    rlca
    add e
    rlca
    dec b
    rlca
    ld e, c
    rlca
    ld a, e
    db $10
    ld b, b
    rlca
    ld e, c
    rlca
    ld b, h
    rlca
    add e
    rlca
    dec b
    rlca
    ld e, c
    rlca
    ld a, e
    db $10
    jr nz, @+$09

    ld e, c
    rlca
    ld b, h
    ldh a, [$80]
    ld de, $102c
    ldh a, [rTAC]
    ld b, h
    rlca
    ld h, d
    rlca
    pop bc
    rlca
    db $db
    db $10
    ret nz

    rlca
    ld b, h
    rlca
    ld h, d
    rlca
    pop bc
    rlca
    db $db
    db $10
    ld h, b
    rlca
    ld h, d
    rlca
    db $db
    db $10
    ld h, b
    rlca
    ld h, d
    rlca
    db $db
    ldh a, [$80]
    ld de, $1024
    ldh a, [rTMA]
    or $06
    sub $07
    xor h
    db $10
    or b
    rlca
    ret z

    rlca
    pop bc
    rlca
    db $dd
    db $10
    add b
    rlca
    pop de
    ldh a, [$80]
    ld de, $1020
    ldh a, [rTAC]
    pop bc
    rlca
    add e
    rlca
    adc $07
    sbc l
    db $10
    ret nc

    rlca
    pop bc
    rlca
    pop bc
    rlca
    adc $07
    adc $10
    or b
    rlca
    pop bc
    rlca
    adc $10
    add b
    rlca
    pop bc
    rlca
    adc $f0
    add b
    ld de, $1028
    ldh a, [rTAC]
    ld a, e
    rlca
    ld hl, $e706
    db $10
    ldh [rTMA], a
    call nz, $9e06
    db $10
    or b
    ld b, $72
    ld b, $42
    db $10
    add b
    ld b, $0b
    dec b
    call $80f0
    ld de, $1028
    add b
    rlca
    pop bc
    rlca
    adc d
    db $10
    ldh a, [rTAC]
    pop bc
    rlca
    push bc
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ldh a, [rNR10]
    pop af
    rlca
    or [hl]
    rlca
    ld [hl], e
    db $10
    or c
    rlca
    or [hl]
    rlca
    ld [hl], e
    db $10
    add c
    rlca
    or [hl]
    rlca
    cp d
    db $10
    ld b, c
    rlca
    or [hl]
    rlca
    cp d
    ldh a, [$80]
    ld de, $1024
    di
    ld b, $0b
    ld d, b
    nop
    ld h, b
    ld bc, $4206
    ld b, $5b
    ld b, $72
    ld h, b
    ld [bc], a
    ld b, $89
    rlca
    dec b
    ld h, b
    add hl, bc
    db $10
    add e
    ld b, $0b
    ld h, b
    ld bc, $4206
    ld b, $5b
    ld b, $72
    ld h, b
    ld [bc], a
    ld b, $89
    rlca
    dec b
    ld h, b
    ld a, [bc]
    db $10
    ld b, l
    ld b, $0b
    ld h, b
    ld bc, $4206
    ld b, $5b
    ld b, $72
    ld h, b
    ld [bc], a
    ld b, $89
    rlca
    dec b
    ld h, b
    ld a, [bc]
    db $10
    ld h, $06
    dec bc
    ld h, b
    ld bc, $4206
    ld b, $5b
    ld b, $72
    ld h, b
    ld [bc], a
    ld b, $89
    rlca
    dec b
    ld h, b
    ld a, [bc]
    ldh a, [$80]
    ld de, $1024
    di
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    di
    rlca
    ld [bc], a
    rlca
    ld [bc], a
    rlca
    ld e, $07
    ld a, [hl+]
    rlca
    dec [hl]
    rlca
    dec [hl]
    rlca
    dec [hl]
    rlca
    ld b, b
    jr nc, @+$0d

    rlca
    ld a, a
    ld b, b
    db $10
    add e
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    add e
    rlca
    ld [bc], a
    rlca
    ld [bc], a
    rlca
    ld e, $07
    ld a, [hl+]
    rlca
    dec [hl]
    rlca
    dec [hl]
    rlca
    dec [hl]
    rlca
    ld b, b
    jr nc, @+$0d

    rlca
    ld a, a
    ld b, b
    db $10
    dec [hl]
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    dec [hl]
    rlca
    ld [bc], a
    rlca
    ld [bc], a
    rlca
    ld e, $07
    ld a, [hl+]
    rlca
    dec [hl]
    rlca
    dec [hl]
    rlca
    dec [hl]
    rlca
    ld b, b
    jr nc, @+$0d

    rlca
    ld a, a
    ld b, b
    db $10
    ld d, $10
    nop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld d, $07
    ld [bc], a
    rlca
    ld [bc], a
    rlca
    ld e, $07
    ld a, [hl+]
    rlca
    dec [hl]
    rlca
    dec [hl]
    rlca
    dec [hl]
    rlca
    ld b, b
    jr nc, jr_01d_727b

    rlca
    ld a, a
    ld b, b
    ldh a, [$80]
    ld de, $1072
    nop
    ld d, b
    nop

jr_01d_727b:
    ld h, b
    ld bc, $ff50
    db $10
    ld bc, $0010
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld bc, $2010
    rlca
    dec b
    ld d, b
    nop
    ld h, b
    ld bc, $2107
    rlca
    dec l
    rlca
    add hl, sp
    ld h, b
    ld [bc], a
    rlca
    ld b, h
    rlca
    add e
    ld h, b
    add hl, bc
    db $10
    jr nz, jr_01d_72ab

    dec b
    ld h, b
    ld bc, $2107
    rlca
    dec l

jr_01d_72ab:
    rlca
    add hl, sp
    ld h, b
    ld [bc], a
    rlca
    ld b, h
    rlca
    add e
    ld h, b
    ld a, [bc]
    db $10
    ld b, b
    rlca
    dec b
    ld h, b
    ld bc, $2107
    rlca
    dec l
    rlca
    add hl, sp
    ld h, b
    ld [bc], a
    rlca
    ld b, h
    rlca
    add e
    ld h, b
    add hl, bc
    db $10
    ld h, b
    rlca
    dec b
    ld h, b
    ld bc, $2107
    rlca
    dec l
    rlca
    add hl, sp
    ld h, b
    ld [bc], a
    rlca
    ld b, h
    rlca
    add e
    ld h, b
    ld a, [bc]
    ldh a, [$80]
    ld de, $f210
    nop
    dec h
    nop
    ld h, $00
    daa
    nop
    dec h
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld a, [c]
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld a, [c]
    db $10
    db $f4
    nop
    ld d, $00
    ld [de], a
    nop
    inc h
    ld d, b
    ld a, [bc]
    ld h, b
    ld [bc], a
    nop
    ld [hl], $00
    inc sp
    jr nc, jr_01d_731a

    nop
    dec d
    ld d, b
    ld a, [bc]
    ld h, b
    ld [bc], a
    nop
    ld h, $00
    ld [bc], a

jr_01d_731a:
    ld b, b
    nop
    inc d
    ld d, b
    ld a, [bc]
    ld h, b
    ld [bc], a
    nop
    ld [bc], a
    ldh a, [$80]
    ld de, $f010
    jr z, jr_01d_7330

    ld [hl], d
    dec b
    ld h, e
    ld b, $42
    rlca

jr_01d_7330:
    dec b
    rlca
    ld a, e
    inc b
    add e
    dec b
    ld h, e
    ld b, $d6
    db $10
    ret nc

    inc h
    ld b, $72
    dec b
    ld h, e
    ld b, $42
    rlca
    dec b
    rlca
    ld a, e
    inc b
    add e
    dec b
    ld h, e
    ld b, $d6
    db $10
    and b
    jr nz, jr_01d_7356

    ld [hl], d
    dec b
    ld h, e
    ld b, $42
    rlca

jr_01d_7356:
    dec b
    rlca
    ld a, e
    inc b
    add e
    dec b
    ld h, e
    ld b, $d6
    db $10
    add b
    ld b, $72
    dec b
    ld h, e
    ld b, $42
    rlca
    dec b
    rlca
    ld a, e
    inc b
    add e
    dec b
    ld h, e
    ld b, $d6
    db $10
    ld b, b
    ld b, $72
    dec b
    ld h, e
    ld b, $42
    rlca
    dec b
    rlca
    ld a, e
    inc b
    add e
    dec b
    ld h, e
    ld b, $d6
    db $10
    jr nz, jr_01d_738c

    ld [hl], d
    dec b
    ld h, e
    ld b, $42
    rlca

jr_01d_738c:
    dec b
    rlca
    ld a, e
    inc b
    add e
    dec b
    ld h, e
    ld b, $d6
    ldh a, [$80]
    ld de, $f110
    nop
    daa
    nop
    dec d
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    pop af
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    pop af
    nop
    dec hl
    nop
    and l
    jr nc, @+$08

    nop
    rlca
    nop
    ld [hl], $40
    ldh a, [$80]
    ld de, $f010
    nop
    ld h, e
    nop
    ld h, b
    nop
    ld h, d
    nop
    ld h, e
    nop
    ld h, b
    nop
    ld h, d
    db $10
    rst $30
    jr nc, jr_01d_73e6

    nop
    ld sp, $0250
    ld h, b

Jump_01d_73d7:
    ld bc, $2100
    ld d, b
    ld [bc], a
    ld h, b
    inc bc
    nop
    ld b, c
    ld d, b
    ld [bc], a
    ld h, b
    ld bc, $f040

jr_01d_73e6:
    add b
    ld de, $1020
    di
    rlca
    and d
    rlca
    sub b
    rlca
    add e
    jr nc, @+$05

    rlca
    ld hl, $0507
    ld b, b
    rlca
    ld hl, $0507
    rlca
    add hl, sp
    rlca
    ld hl, $4f07
    rlca
    add hl, sp
    rlca
    ld h, d
    rlca
    ld c, a
    rlca
    ld [hl], e
    rlca
    ld h, d
    rlca
    add e
    rlca
    ld [hl], e
    rlca
    sub b
    rlca
    add e
    rlca
    sbc l
    rlca
    sub b
    rlca
    and a
    rlca
    sbc l
    rlca
    or c
    rlca
    and a
    rlca
    cp d
    rlca
    or c
    rlca
    pop bc
    rlca
    cp d
    rlca
    ret z

    rlca
    pop bc
    ldh a, [$80]
    ld de, $1020
    adc [hl]
    jr nc, jr_01d_7437

    rlca
    pop bc
    rlca

jr_01d_7437:
    and d
    ld b, b
    db $10
    pop af
    rlca
    pop bc
    rlca
    and d
    db $10
    pop af
    rlca
    pop bc
    rlca
    and d
    db $10
    pop de
    rlca
    pop bc
    rlca
    and d
    db $10
    pop de
    rlca
    pop bc
    rlca
    and d
    db $10
    or c
    rlca
    pop bc
    rlca
    and d
    db $10
    sub c
    rlca
    pop bc
    rlca
    and d
    db $10
    sub c
    rlca
    pop bc
    rlca
    and d
    db $10
    ld [hl], c
    rlca
    pop bc
    rlca
    and d
    db $10
    ld d, c
    rlca
    push bc
    rlca
    and a
    db $10
    ld b, c
    rlca
    ret z

    rlca
    xor h
    ldh a, [$80]
    ld de, $8d10
    jr nc, jr_01d_7481

    nop
    inc de
    nop
    inc bc
    ld b, b

jr_01d_7481:
    db $10
    ldh a, [rP1]
    rlca
    nop
    ld [bc], a
    nop
    ld d, l
    nop
    ld sp, $d010
    jr nc, jr_01d_7491

    nop
    add l

jr_01d_7491:
    nop
    dec d
    ld b, b
    db $10
    sub d
    jr nc, jr_01d_74a2

    nop
    ld b, h
    nop
    inc d
    ld b, b
    ldh a, [$80]
    ld de, $102c

jr_01d_74a2:
    ldh a, [rP1]
    db $db
    nop
    dec d
    nop
    dec [hl]
    db $10
    ret nc

    nop
    db $db
    nop
    dec d
    nop
    dec [hl]
    db $10
    or b
    nop
    add l
    nop
    dec d
    db $10
    add c
    nop
    add l
    nop
    dec d
    ldh a, [$80]
    ld de, $f010
    nop
    ld h, [hl]
    nop
    dec l
    nop
    ld h, [hl]
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ldh a, [rNR10]
    nop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ldh a, [rNR10]
    ret nc

    nop
    ld h, [hl]
    nop
    dec l
    nop
    ld h, [hl]
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ret nc

    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ret nc

    db $10
    add b
    nop
    ld h, [hl]
    nop
    dec l
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    add b
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    add b
    db $10
    ld b, b
    nop
    ld h, [hl]
    nop
    dec l
    ldh a, [$80]
    ld de, $1028
    rst $30
    jr nc, jr_01d_7534

    nop
    ld [hl], c
    nop
    ld [hl], e
    nop
    ld [hl], c
    nop
    ld d, d
    nop
    ld d, l
    nop
    ld d, d
    ld b, b
    ldh a, [$80]
    ld de, $1020
    ld a, [c]
    inc b

jr_01d_7534:
    ld d, $06
    jr z, jr_01d_753c

    ld d, $06
    jr z, jr_01d_754c

jr_01d_753c:
    nop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld a, [c]
    inc b
    add e
    ld b, $5b
    stop
    ld d, b

jr_01d_754c:
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld a, [c]
    inc b
    push hl
    ld b, $89
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld a, [c]
    dec b
    inc a
    ld b, $b2
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld a, [c]
    dec b
    adc c
    ld b, $d6
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld a, [c]
    dec b
    call $f606
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld a, [c]
    dec b
    call $f606
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld a, [c]
    dec b
    call $d606
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld a, [c]
    dec b
    inc a
    ld b, $b2
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld a, [c]
    inc b
    push hl
    ld b, $89
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld a, [c]
    inc b
    add e
    ld b, $5b
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld a, [c]
    inc b
    ld d, $06
    jr z, @+$12

    or d
    inc b
    ld d, $06
    jr z, jr_01d_75e0

    ld d, $06
    jr z, jr_01d_75f0

jr_01d_75e0:
    nop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    or d
    inc b
    add e
    ld b, $5b
    stop
    ld d, b

jr_01d_75f0:
    nop
    ld h, b
    ld bc, $ff50
    db $10
    or d
    inc b
    push hl
    ld b, $89
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    or d
    dec b
    inc a
    ld b, $b2
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    or d
    dec b
    adc c
    ld b, $d6
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    or d
    dec b
    call $f606
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    or d
    dec b
    call $f606
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    or d
    dec b
    call $d606
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    or d
    dec b
    inc a
    ld b, $b2
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    or d
    inc b
    push hl
    ld b, $89
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    or d
    inc b
    add e
    ld b, $5b
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    or d
    inc b
    ld d, $06
    jr z, @+$12

    ld h, d
    inc b
    ld d, $06
    jr z, jr_01d_7684

    ld d, $06
    jr z, jr_01d_7694

jr_01d_7684:
    nop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld h, d
    inc b
    add e
    ld b, $5b
    stop
    ld d, b

jr_01d_7694:
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld h, d
    inc b
    push hl
    ld b, $89
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld h, d
    dec b
    inc a
    ld b, $b2
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld h, d
    dec b
    adc c
    ld b, $d6
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld h, d
    dec b
    call $f606
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld h, d
    dec b
    call $f606
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld h, d
    dec b
    call $d606
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld h, d
    dec b
    inc a
    ld b, $b2
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld h, d
    inc b
    push hl
    ld b, $89
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld h, d
    inc b
    add e
    ld b, $5b
    stop
    ld d, b
    nop
    ld h, b
    ld bc, $ff50
    db $10
    ld h, d
    inc b
    ld d, $06
    jr z, @-$0e

    add b
    ld de, $1028
    ld c, [hl]
    jr nc, jr_01d_7728

    nop
    dec d
    nop

jr_01d_7728:
    dec d
    ld b, b
    db $10
    push af
    jr nc, jr_01d_7731

    nop
    ld [hl+], a
    ld d, b

jr_01d_7731:
    ld [bc], a
    ld h, b
    ld [bc], a
    ld b, b
    nop
    ld [hl+], a
    nop
    ld [hl+], a
    jr nc, $7777

    nop
    ld [hl-], a
    nop
    inc [hl]
    ld b, b
    ldh a, [$80]
    ld de, $d210
    nop
    dec [hl]
    ld d, b
    ld [bc], a
    ld h, b
    ld [bc], a
    ldh a, [$f0]
    add b
    ld de, $d210
    nop
    dec [hl]
    ld d, b
    ld [bc], a
    ld h, b
    ld [bc], a
    ldh a, [rP1]
