; Disassembly of "Nectaris GB (Japan) (SGB Enhanced).gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "common.inc"
INCLUDE "hardware.inc"

SECTION "nectaris/audio2: Audio 2", ROMX

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


data_01d_4c11:
    db $0b
data_01d_4c12:
    db $df
data_01d_4c13:
    db $17
data_01d_4c14:
    db $df
data_01d_4c15:
    db $23
data_01d_4c16:
    db $df
data_01d_4c17:
    db $2f
data_01d_4c18:
    db $df
data_01d_4c19:
    db $00, $18, $30, $48, $60, $78, $90, $a8

data_01d_4c21:
    dw $002c
    dw $009c
    dw $0106
    dw $016b
    dw $01c9
    dw $0222
    dw $0278
    dw $02c6
    dw $0312
    dw $0358
    dw $039b
    dw $03da
    dw $0416
    dw $044e
    dw $0483
    dw $04b5
    dw $04e5
    dw $0511
    dw $053c
    dw $0563
    dw $0589
    dw $05ac
    dw $05cd
    dw $05ed
    dw $060b
    dw $0628
    dw $0642
    dw $065b
    dw $0672
    dw $0689
    dw $069e
    dw $06b2
    dw $06c4
    dw $06d6
    dw $06e7
    dw $06f6
    dw $0705
    dw $0714
    dw $0721
    dw $072d
    dw $0739
    dw $0744
    dw $074f
    dw $0759
    dw $0762
    dw $076b
    dw $0773
    dw $077b
    dw $0783
    dw $078a
    dw $0790
    dw $0797
    dw $079d
    dw $07a2
    dw $07a7
    dw $07ac
    dw $07b1
    dw $07b6
    dw $07ba
    dw $07be
    dw $07c1
    dw $07c5
    dw $07c8
    dw $07cb
    dw $07ce
    dw $07d1
    dw $07d4
    dw $07d6
    dw $07d9
    dw $07db
    dw $07dd
    dw $07df
    dw $07e1
    dw $07e3
    dw $07e4
    dw $07e5
    dw $07e7
    dw $07e8
    dw $07ea
    dw $07eb
    dw $07ec
    dw $07ed
    dw $07ee
    dw $07ef
    dw $07f0

data_01d_4ccb:
    dw data_01d_4cdd
    dw data_01d_4ced
    dw data_01d_4cfd
    dw data_01d_4d0d
    dw data_01d_4d1d
    dw data_01d_4d2d
    dw data_01d_4d3d
    dw data_01d_4d4d
    dw data_01d_4d5d

data_01d_4cdd:
    db $7a, $df, $ff, $da, $74, $10, $00, $14, $7a, $df, $ff, $da, $74, $10, $00, $14
data_01d_4ced:
    db $12, $23, $33, $44, $55, $66, $77, $77, $78, $89, $9a, $ab, $bb, $cc, $dd, $ee
data_01d_4cfd:
    db $bb, $bb, $bb, $dd, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
data_01d_4d0d:
    db $79, $bd, $ff, $ff, $ff, $ff, $fd, $b9, $75, $31, $00, $00, $00, $00, $01, $35
data_01d_4d1d:
    db $79, $ce, $ee, $c9, $74, $21, $11, $24, $79, $ce, $ee, $c9, $74, $21, $11, $24
data_01d_4d2d:
    db $aa, $aa, $aa, $cc, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11
data_01d_4d3d:
    db $aa, $aa, $aa, $cc, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22
data_01d_4d4d:
    db $79, $bd, $dd, $b9, $75, $32, $11, $35, $79, $bd, $dd, $b9, $75, $32, $11, $35
data_01d_4d5d:
    db $99, $99, $99, $bb, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33

data_01d_4d6d:
    dw data_01d_4db5
    dw data_01d_4dbd
    dw data_01d_4dc4
    dw data_01d_4dce
    dw data_01d_4dd7
    dw data_01d_4de0
    dw data_01d_4de8
    dw data_01d_4def
    dw data_01d_4df6
    dw data_01d_4dfd
    dw data_01d_4e1f
    dw data_01d_4e41
    dw data_01d_4e63
    dw data_01d_4e8d
    dw data_01d_4ea0
    dw data_01d_4eaa
    dw data_01d_4ecc
    dw data_01d_4ed3
    dw data_01d_4eda
    dw data_01d_4ef5
    dw data_01d_4f0d
    dw data_01d_4f28
    dw data_01d_4f40
    dw data_01d_4f58
    dw data_01d_4f6e
    dw data_01d_4f75
    dw data_01d_4f7c
    dw data_01d_4f82
    dw data_01d_4f89
    dw data_01d_4f90
    dw data_01d_4f97
    dw data_01d_4fb2
    dw data_01d_4fca
    dw data_01d_4fe5
    dw data_01d_4ffd
    dw data_01d_5015

data_01d_4db5:
    db $88, $32, $d2, $c0, $36, $47, $67, $ff
data_01d_4dbd:
    db $88, $32, $81, $c0, $36, $47, $ff
data_01d_4dc4:
    db $88, $24, $a1, $80, $47, $33, $22, $11, $06, $ff
data_01d_4dce:
    db $88, $1e, $82, $80, $47, $33, $06, $04, $ff
data_01d_4dd7:
    db $88, $1e, $72, $80, $47, $33, $06, $04, $ff
data_01d_4de0:
    db $88, $f7, $d1, $80, $08, $08, $08, $ff
data_01d_4de8:
    db $88, $32, $e1, $80, $00, $01, $ff
data_01d_4def:
    db $88, $32, $f1, $80, $00, $01, $ff
data_01d_4df6:
    db $88, $32, $a1, $c0, $00, $01, $ff
data_01d_4dfd:
    db $88, $00, $d3
    db $80, $02, $00, $01, $00, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01
    db $02, $01, $02, $03, $02, $03, $02, $03, $02, $03, $02, $03, $02, $03, $ff
data_01d_4e1f:
    db $88
    db $00, $a2, $80, $02, $00, $01, $00, $01, $02, $01, $02, $01, $02, $01, $02, $01
    db $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01
    db $ff
data_01d_4e41:
    db $88, $00, $82, $80, $02, $00, $01, $00, $01, $02, $01, $02, $01, $02, $01
    db $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01
    db $02, $01, $ff
data_01d_4e63:
    db $88, $32, $75, $80, $25, $14, $25, $14, $25, $24, $42, $24, $42
    db $24, $42, $24, $42, $24, $43, $24, $43, $24, $43, $34, $43, $34, $43, $34, $43
    db $34, $43, $34, $43, $34, $44, $34, $44, $34, $44, $34, $44, $ff
data_01d_4e8d:
    db $88, $0a, $81
    db $80, $29, $1a, $1c, $1d, $1c, $1e, $1c, $1d, $1c, $1e, $1c, $1d, $1c, $1e, $ff
data_01d_4ea0:
    db $88, $32, $61, $c0, $00, $01, $00, $01, $00, $ff
data_01d_4eaa:
    db $88, $00, $c2, $80, $02, $00
    db $01, $00, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02
    db $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $ff
data_01d_4ecc:
    db $88, $32, $c1, $c0, $36, $47, $ff
data_01d_4ed3:
    db $88, $32, $c1, $c0, $36, $47, $ff
data_01d_4eda:
    db $88, $0a, $72, $80, $29, $2a
    db $2c, $2d, $2c, $2e, $2c, $2d, $2c, $2e, $2c, $2d, $2c, $2e, $2c, $2d, $2c, $2e
    db $2c, $2d, $2c, $2e, $ff
data_01d_4ef5:
    db $88, $01, $91, $80, $24, $25, $26, $25, $26, $25, $26
    db $25, $26, $25, $26, $25, $26, $25, $26, $25, $26, $25, $26, $ff
data_01d_4f0d:
    db $88, $0a, $62
    db $80, $29, $1a, $1c, $1d, $1c, $1e, $1c, $1d, $1c, $1e, $1c, $1d, $1c, $1e, $1c
    db $1d, $1c, $1e, $1c, $1d, $1c, $1e, $ff
data_01d_4f28:
    db $88, $01, $91, $80, $24, $25, $26, $25
    db $26, $25, $26, $25, $26, $25, $26, $25, $26, $25, $26, $25, $26, $25, $26, $ff
data_01d_4f40:
    db $88, $0a, $62, $80, $28, $19, $1a, $19, $1b, $19, $1a, $19, $1b, $19, $1a, $19
    db $1b, $19, $1a, $19, $1b, $19, $1a, $ff
data_01d_4f58:
    db $88, $01, $81, $80, $21, $23, $24, $23
    db $24, $23, $24, $23, $24, $23, $24, $23, $24, $23, $24, $23, $24, $ff
data_01d_4f6e:
    db $88, $32, $75, $80, $25, $14, $ff
data_01d_4f75:
    db $88, $0a, $81, $80, $29, $1a, $ff
data_01d_4f7c:
    db $88, $32, $61, $c0, $00, $ff
data_01d_4f82:
    db $88, $00, $c2, $80, $02, $00, $ff
data_01d_4f89:
    db $88, $32, $c1, $c0, $36, $47, $ff
data_01d_4f90:
    db $88, $32, $c1, $c0, $36, $47, $ff
data_01d_4f97:
    db $88, $0a, $72, $80, $29, $2a, $2c, $2d, $2c
    db $2e, $2c, $2d, $2c, $2e, $2c, $2d, $2c, $2e, $2c, $2d, $2c, $2e, $2c, $2d, $2c
    db $2e, $ff
data_01d_4fb2:
    db $88, $01, $b1, $80, $24, $25, $26, $25, $26, $25, $26, $25, $26, $25
    db $26, $25, $26, $25, $26, $25, $26, $25, $26, $ff
data_01d_4fca:
    db $88, $0a, $62, $80, $29, $1a
    db $1c, $1d, $1c, $1e, $1c, $1d, $1c, $1e, $1c, $1d, $1c, $1e, $1c, $1d, $1c, $1e
    db $1c, $1d, $1c, $1e, $ff
data_01d_4fe5:
    db $88, $01, $b1, $80, $24, $25, $26, $25, $26, $25, $26
    db $25, $26, $25, $26, $25, $26, $25, $26, $25, $26, $25, $26, $ff
data_01d_4ffd:
    db $88, $0a, $62
    db $80, $28, $19, $1a, $19, $1b, $19, $1a, $19, $1b, $19, $1a, $19, $1b, $19, $1a
    db $19, $1b, $19, $1a, $ff
data_01d_5015:
    db $88, $01, $b1, $80, $21, $23, $24, $23, $24, $23, $24
    db $23, $24, $23, $24, $23, $24, $23, $24, $23, $24, $ff

data_01d_502b:
    dw data_01d_504b
    dw data_01d_504e
    dw data_01d_5054
    dw data_01d_507e
    dw data_01d_5092
    dw data_01d_509a
    dw data_01d_50a6
    dw data_01d_50b0
    dw data_01d_50c4
    dw data_01d_50cc
    dw data_01d_50d9
    dw data_01d_50e0
    dw data_01d_50f0
    dw data_01d_50f4
    dw data_01d_5102
    dw data_01d_5110

data_01d_504b:
    db $00, $80, $80
data_01d_504e:
    db $03, $00, $fd, $00, $80, $80
data_01d_5054:
    db $01, $01, $01, $01, $02, $02, $02, $02, $01, $01, $01, $01
    db $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $fe, $fe, $fe, $fe
    db $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $80, $80
data_01d_507e:
    db $01, $02
    db $04, $07, $04, $02, $01, $00, $00, $ff, $fe, $fd, $fc, $fd, $fe, $ff, $00, $00
    db $80, $80
data_01d_5092:
    db $01, $00, $00, $ff, $00, $00, $80, $80
data_01d_509a:
    db $01, $00, $00, $00, $00, $ff, $00, $00, $00, $00, $80, $80
data_01d_50a6:
    db $01, $02, $01, $00, $ff, $fe, $ff, $00, $80, $80
data_01d_50b0:
    db $01, $02, $03, $02, $01, $00, $00, $00, $00, $ff, $fe, $fd, $fe, $ff, $00, $00
    db $00, $00, $80, $80
data_01d_50c4:
    db $fb, $fe, $08, $05, $02, $00, $80, $00
data_01d_50cc:
    db $01, $02, $03, $02, $01, $00, $00, $fe, $ff, $00, $00, $80, $80
data_01d_50d9:
    db $fd, $07, $03, $01, $00, $80, $00
data_01d_50e0:
    db $04, $02, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $09
data_01d_50f0:
    db $02, $00, $80, $00
data_01d_50f4:
    db $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $09
data_01d_5102:
    db $fd, $fe, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $04
data_01d_5110:
    db $ff, $00, $00, $00, $01, $00, $00, $00, $80, $80

MusicTable_01d:
.size
    db $13
.banks
    db BANK(data_01c_5154)
    db BANK(data_01c_5155)
    db BANK(data_01c_515e)
    db BANK(data_01c_5167)
    db BANK(data_01c_5170)
    db BANK(data_01c_5179)
    db BANK(data_01c_5182)
    db BANK(data_01c_5189)
    db BANK(data_01c_5192)
    db BANK(data_01c_519b)
    db BANK(data_01c_51a4)
    db BANK(data_01c_51ad)
    db BANK(data_01c_51b6)
    db BANK(data_01d_5155)
    db BANK(data_01d_515e)
    db BANK(data_01d_5167)
    db BANK(data_01d_5170)
    db BANK(data_01d_5179)
    db BANK(data_01d_5182)
.addrs
    dw data_01d_5154
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw data_01d_5155
    dw data_01d_515e
    dw data_01d_5167
    dw data_01d_5170
    dw data_01d_5179
    dw data_01d_5182

data_01d_5154::
    db $00
data_01d_5155::
    db $0f
    dw $51bb
    dw $5282
    dw $542e
    dw $55c9

data_01d_515e::
    db $0f
    dw $5647
    dw $5698
    dw $56e8
    dw $57a9

data_01d_5167::
    db $0f
    dw $57ec
    dw $5859
    dw $58b3
    dw $58f2

data_01d_5170::
    db $0f
    dw $5924
    dw $59d7
    dw $5a63
    dw $5ab4

data_01d_5179::
    db $0f
    dw $5acc
    dw $5bf6
    dw $5caa
    dw $5d12

data_01d_5182::
    db $0f
    dw $5d8f
    dw $600c
    dw $6278
    dw $63ae

data_01d_518b::
    db $3c, $3c, $3c, $3c, $3c
    db $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c
    db $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c
    db $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $dc, $11, $dd, $d0, $08
    db $e5, $40, $ea, $00, $d4, $df, $02, $e6, $85, $a1, $51, $d8, $a1, $51, $a1, $d7
    db $51, $e6, $85, $a1, $e6, $20, $a1, $e0, $e6, $85, $c1, $71, $d8, $c1, $71, $c1
    db $d7, $71, $b1, $c3, $d7, $11, $d8, $81, $11, $d8, $c1, $d7, $11, $83, $df, $02
    db $e6, $85, $a1, $51, $d8, $a1, $51, $a1, $d7, $51, $e6, $85, $a1, $e6, $20, $a1
    db $e0, $e6, $85, $c1, $71, $d8, $c1, $71, $c1, $d7, $71, $c1, $d7, $33, $d8, $a1
    db $21, $31, $d8, $a1, $31, $21, $30, $a0, $d7, $ea, $06, $eb, $14, $e5, $00, $e6
    db $b7, $22, $d8, $b2, $d7, $79, $e6, $67, $22, $d8, $b2, $d7, $79, $e6, $b7, $32
    db $42, $b9, $e6, $67, $32, $42, $b9, $d8, $e6, $b7, $c2, $d7, $12, $79, $d8, $e6
    db $67, $c2, $d7, $12, $79, $e6, $b7, $52, $32, $d8, $a9, $d7, $e6, $67, $52, $32
    db $d8, $a9, $d7, $e6, $b7, $22, $d8, $b2, $d7, $79, $e6, $67, $22, $d8, $b2, $d7
    db $79, $e6, $b7, $32, $42, $b9, $e6, $67, $32, $42, $b9, $d8, $e6, $b7, $c2, $d7
    db $12, $79, $d8, $e6, $67, $c2, $d7, $12, $79, $e6, $b7, $52, $32, $d8, $a9, $9f
    db $de, $ff, $dc, $11, $dd, $d0, $08, $d2, $e5, $00, $e6, $a4, $51, $11, $51, $11
    db $51, $11, $51, $11, $61, $21, $61, $21, $61, $21, $61, $21, $71, $31, $71, $31
    db $71, $31, $71, $31, $81, $41, $81, $41, $81, $41, $81, $41, $51, $11, $51, $11
    db $51, $11, $51, $11, $61, $21, $61, $21, $61, $21, $61, $21, $71, $31, $71, $31
    db $71, $31, $71, $31, $a1, $61, $a1, $61, $a1, $61, $a1, $61, $d3, $e5, $40, $e6
    db $93, $70, $d8, $80, $b0, $80, $d7, $20, $d8, $80, $d7, $70, $d8, $80, $b0, $80
    db $d7, $20, $d8, $80, $d7, $70, $d8, $80, $b0, $80, $d7, $20, $d8, $80, $d7, $70
    db $d8, $80, $b0, $80, $d7, $20, $d8, $80, $d7, $70, $d8, $80, $b0, $80, $d7, $20
    db $d8, $80, $d7, $70, $d8, $80, $d7, $30, $d8, $40, $70, $40, $b0, $40, $d7, $30
    db $d8, $40, $70, $40, $b0, $40, $d7, $30, $d8, $40, $70, $40, $b0, $40, $d7, $30
    db $d8, $40, $70, $40, $b0, $40, $d7, $30, $d8, $40, $70, $40, $b0, $40, $d7, $30
    db $d8, $40, $c0, $10, $50, $10, $70, $10, $c0, $10, $50, $10, $70, $10, $c0, $10
    db $50, $10, $70, $10, $c0, $10, $50, $10, $70, $10, $c0, $10, $50, $10, $70, $10
    db $c0, $10, $d7, $50, $d8, $60, $a0, $60, $c0, $60, $d7, $50, $d8, $60, $a0, $60
    db $c0, $60, $d7, $50, $d8, $60, $a0, $60, $c0, $60, $d7, $50, $d8, $60, $a0, $60
    db $c0, $60, $d7, $50, $d8, $60, $a0, $60, $c0, $60, $d7, $50, $d8, $60, $d7, $70
    db $d8, $80, $b0, $80, $d7, $20, $d8, $80, $d7, $70, $d8, $80, $b0, $80, $d7, $20
    db $d8, $80, $d7, $70, $d8, $80, $b0, $80, $d7, $20, $d8, $80, $d7, $70, $d8, $80
    db $b0, $80, $d7, $20, $d8, $80, $d7, $70, $d8, $80, $b0, $80, $d7, $20, $d8, $80
    db $d7, $70, $d8, $80, $d7, $30, $d8, $40, $70, $40, $b0, $40, $d7, $30, $d8, $40
    db $70, $40, $b0, $40, $d7, $30, $d8, $40, $70, $40, $b0, $40, $d7, $30, $d8, $40
    db $70, $40, $b0, $40, $d7, $30, $d8, $40, $70, $40, $b0, $40, $d7, $30, $d8, $40
    db $c0, $10, $50, $10, $70, $10, $c0, $10, $50, $10, $70, $10, $c0, $10, $50, $10
    db $70, $10, $c0, $10, $50, $10, $70, $10, $c0, $10, $50, $10, $70, $10, $c0, $10
    db $d7, $50, $d8, $60, $a0, $60, $c0, $60, $d7, $50, $d8, $60, $a0, $60, $c0, $60
    db $d7, $50, $d8, $60, $a0, $60, $b0, $50, $d7, $40, $d8, $50, $90, $50, $b0, $50
    db $d7, $40, $d8, $50, $90, $50, $b0, $50, $d7, $40, $d8, $50, $de, $ff, $dc, $11
    db $dd, $d0, $08, $e8, $08, $e7, $02, $e9, $60, $e6, $20, $d1, $e8, $06, $a0, $e8
    db $08, $a0, $00, $a0, $01, $e8, $06, $a0, $e8, $08, $a0, $01, $a0, $00, $a0, $02
    db $e8, $06, $b0, $e8, $08, $b0, $00, $e8, $06, $b0, $e8, $08, $b0, $00, $e8, $06
    db $b0, $e8, $08, $b0, $01, $b0, $00, $b0, $02, $df, $03, $e8, $06, $c0, $e8, $08
    db $c0, $00, $e0, $00, $e8, $06, $c0, $c0, $c0, $e8, $08, $c0, $00, $c0, $d7, $e8
    db $06, $10, $e8, $08, $10, $00, $10, $d8, $10, $00, $e8, $06, $10, $e8, $08, $10
    db $01, $10, $d7, $10, $d8, $10, $d7, $10, $d8, $10, $00, $e8, $06, $a0, $e8, $08
    db $a0, $00, $a0, $01, $e8, $06, $a0, $e8, $08, $a0, $01, $a0, $04, $e8, $06, $b0
    db $e8, $08, $b0, $00, $b0, $01, $e8, $06, $b0, $e8, $08, $b0, $01, $b0, $04, $e8
    db $06, $c0, $e8, $08, $c0, $00, $c0, $01, $e8, $06, $c0, $e8, $08, $c0, $01, $e8
    db $06, $c0, $c0, $e8, $08, $c0, $02, $d7, $30, $05, $d8, $e8, $06, $df, $05, $30
    db $e0, $e8, $08, $30, $d7, $30, $d8, $30, $00, $df, $02, $d0, $01, $86, $00, $d0
    db $08, $80, $03, $d0, $01, $86, $00, $d0, $08, $80, $07, $e0, $d0, $01, $46, $00
    db $d0, $08, $40, $03, $d0, $01, $46, $00, $d0, $08, $40, $07, $d0, $01, $46, $00
    db $d0, $08, $40, $03, $d0, $01, $46, $00, $d0, $08, $40, $04, $d7, $40, $d8, $40
    db $20, $df, $02, $d0, $01, $16, $00, $d0, $08, $10, $03, $d0, $01, $16, $00, $d0
    db $08, $10, $07, $e0, $d0, $01, $66, $00, $d0, $08, $60, $03, $d0, $01, $66, $00
    db $d0, $08, $60, $07, $d0, $01, $66, $00, $d0, $08, $60, $03, $d0, $01, $66, $00
    db $d0, $08, $60, $04, $10, $60, $70, $df, $02, $d0, $01, $86, $00, $d0, $08, $80
    db $03, $d0, $01, $86, $00, $d0, $08, $80, $07, $e0, $d0, $01, $46, $00, $d0, $08
    db $40, $03, $d0, $01, $46, $00, $d0, $08, $40, $07, $d0, $01, $46, $00, $d0, $08
    db $40, $03, $d0, $01, $46, $00, $d0, $08, $40, $04, $d7, $40, $d8, $40, $20, $df
    db $02, $d0, $01, $16, $00, $d0, $08, $10, $03, $d0, $01, $16, $00, $d0, $08, $10
    db $07, $e0, $d0, $01, $66, $00, $d0, $08, $60, $03, $d0, $01, $66, $00, $d0, $08
    db $60, $07, $d0, $01, $56, $00, $d0, $08, $50, $03, $d0, $01, $56, $00, $d0, $08
    db $50, $04, $c0, $d7, $50, $d8, $50, $de, $ff, $dd, $d0, $08, $d1, $e8, $08, $df
    db $02, $10, $10, $00, $10, $30, $00, $10, $10, $70, $00, $10, $00, $30, $00, $90
    db $00, $e0, $10, $10, $70, $10, $30, $70, $10, $10, $70, $70, $10, $10, $30, $30
    db $70, $10, $10, $10, $70, $10, $30, $70, $10, $10, $d7, $c0, $d8, $70, $d7, $c0
    db $c0, $a0, $a0, $80, $d8, $00, $df, $02, $10, $10, $00, $10, $30, $00, $10, $10
    db $70, $00, $10, $00, $30, $00, $90, $00, $e0, $10, $10, $70, $10, $30, $70, $10
    db $10, $70, $70, $10, $10, $30, $70, $90, $70, $10, $70, $70, $70, $30, $70, $70
    db $10, $d7, $c0, $c0, $a0, $a0, $80, $80, $d8, $a1, $df, $10, $b1, $c1, $b1, $c1
    db $b1, $c1, $b1, $c1, $e0, $de, $ff, $dd, $d0, $0b, $e5, $40, $e6, $96, $d3, $ea
    db $03, $eb, $10, $df, $02, $df, $02, $b1, $71, $11, $d8, $b1, $c1, $d7, $11, $23
    db $e0, $b1, $71, $11, $d8, $b1, $c1, $d7, $11, $21, $c3, $81, $a1, $61, $21, $41
    db $d8, $a3, $d7, $e0, $d0, $0b, $d3, $e5, $40, $e6, $a7, $ea, $03, $eb, $1e, $df
    db $03, $03, $8b, $e0, $51, $41, $31, $23, $11, $23, $df, $03, $03, $8b, $e0, $d7
    db $51, $41, $31, $23, $11, $23, $de, $ff, $dd, $d0, $0b, $e5, $40, $e6, $b5, $d3
    db $df, $02, $df, $02, $31, $d8, $b1, $51, $31, $41, $51, $63, $d7, $e0, $31, $d8
    db $b1, $51, $31, $41, $51, $61, $d7, $43, $d8, $c1, $d7, $21, $d8, $a1, $61, $81
    db $23, $d7, $e0, $d0, $0b, $e8, $07, $e5, $40, $e6, $a7, $d3, $df, $03, $03, $4b
    db $e0, $11, $d8, $c1, $b1, $a3, $91, $a3, $d7, $df, $03, $03, $4b, $e0, $d7, $11
    db $d8, $c1, $b1, $a3, $91, $a3, $de, $ff, $dd, $d0, $0b, $d1, $e8, $07, $e7, $02
    db $e9, $60, $e6, $20, $df, $02, $df, $02, $e6, $20, $03, $11, $11, $e6, $60, $13
    db $e6, $20, $61, $e6, $60, $61, $e0, $e6, $20, $03, $11, $11, $e6, $60, $13, $e6
    db $20, $61, $73, $d7, $31, $51, $11, $d8, $91, $b1, $51, $e6, $60, $51, $e0, $e6
    db $20, $11, $e6, $60, $11, $e6, $20, $21, $31, $41, $51, $e6, $60, $51, $d7, $e6
    db $20, $11, $d8, $11, $21, $31, $41, $e6, $60, $41, $d7, $e6, $20, $11, $d8, $b1
    db $e6, $60, $b1, $e6, $20, $11, $e6, $60, $11, $e6, $20, $21, $31, $41, $51, $e6
    db $60, $51, $d7, $e6, $20, $11, $d8, $c1, $71, $41, $51, $e6, $60, $51, $e6, $20
    db $41, $51, $e6, $60, $51, $e6, $20, $11, $e6, $60, $11, $e6, $20, $21, $31, $41
    db $51, $e6, $60, $51, $d7, $e6, $20, $11, $d8, $11, $21, $31, $41, $e6, $60, $41
    db $d7, $e6, $20, $11, $d8, $b1, $e6, $60, $b1, $e6, $20, $11, $e6, $60, $11, $e6
    db $20, $21, $31, $41, $51, $e6, $60, $51, $d7, $e6, $20, $11, $d8, $c1, $71, $51
    db $41, $21, $11, $31, $e6, $60, $31, $de, $ff, $dd, $d0, $0b, $d1, $df, $02, $df
    db $03, $11, $11, $d7, $21, $d8, $11, $11, $d7, $21, $d8, $11, $01, $e0, $01, $11
    db $d7, $21, $d8, $11, $d7, $21, $d8, $11, $d7, $23, $d8, $e0, $df, $0e, $11, $d7
    db $b0, $b0, $d8, $71, $d7, $b0, $b0, $d8, $e0, $11, $d7, $b0, $b0, $d8, $71, $d7
    db $b0, $b0, $d8, $11, $d7, $b0, $b0, $c0, $a0, $81, $de, $ff, $d0, $07, $e5, $00
    db $e8, $08, $d4, $df, $02, $e6, $b5, $d0, $01, $35, $00, $34, $01, $d8, $d0, $07
    db $e6, $d5, $30, $d7, $e6, $b5, $d0, $01, $25, $00, $24, $01, $d8, $d0, $07, $e6
    db $d5, $20, $d7, $e6, $b5, $d0, $01, $35, $00, $34, $01, $d8, $d0, $07, $e6, $d5
    db $30, $d7, $e6, $b5, $d0, $01, $25, $00, $24, $01, $d8, $d0, $07, $e6, $d5, $20
    db $e6, $b5, $d0, $01, $e6, $b5, $b5, $e6, $20, $b0, $e6, $b5, $c5, $e6, $20, $c0
    db $d7, $e6, $b5, $15, $e6, $20, $10, $e6, $b5, $25, $e6, $20, $20, $e0, $d0, $07
    db $e6, $10, $23, $e6, $b6, $7b, $d9, $7f, $ff, $d0, $07, $e5, $00, $e8, $08, $d3
    db $df, $02, $e6, $b5, $d0, $01, $a5, $00, $d0, $07, $a0, $d8, $a0, $d7, $d0, $01
    db $95, $00, $d0, $07, $90, $d8, $90, $d7, $d0, $01, $a5, $00, $d0, $07, $a0, $d8
    db $a0, $d7, $d0, $01, $95, $00, $d0, $07, $90, $d8, $90, $d7, $d0, $01, $e6, $b5
    db $64, $e6, $20, $c1, $e6, $b5, $74, $e6, $20, $71, $e6, $b5, $84, $e6, $20, $81
    db $e6, $b5, $94, $e6, $20, $91, $e0, $d0, $07, $e6, $10, $93, $d7, $e6, $b6, $3b
    db $d9, $3f, $ff, $d0, $07, $d1, $e8, $08, $e7, $02, $e9, $20, $e6, $20, $df, $02
    db $d0, $01, $84, $01, $d0, $07, $80, $00, $d0, $01, $74, $01, $d0, $07, $70, $00
    db $d0, $01, $84, $01, $d0, $07, $80, $00, $d0, $01, $74, $01, $d0, $07, $70, $00
    db $d0, $01, $44, $01, $54, $01, $64, $01, $74, $01, $e0, $d0, $07, $03, $59, $01
    db $0f, $ff, $d0, $07, $d1, $30, $30, $90, $30, $30, $90, $30, $30, $90, $30, $30
    db $90, $d7, $c0, $c0, $a0, $a0, $d8, $30, $30, $90, $30, $30, $90, $30, $30, $90
    db $30, $30, $90, $30, $30, $30, $30, $d0, $01, $d7, $c3, $a2, $83, $82, $d8, $d0
    db $07, $01, $ab, $ff, $d0, $09, $e5, $c0, $e6, $b0, $e8, $08, $ea, $03, $eb, $2c
    db $d3, $55, $49, $d9, $47, $23, $43, $53, $71, $49, $d9, $47, $23, $43, $55, $49
    db $d9, $47, $23, $43, $53, $71, $49, $d9, $47, $53, $73, $d4, $e5, $00, $e6, $5b
    db $e8, $08, $ea, $00, $81, $d8, $b1, $d7, $31, $71, $d8, $a1, $d7, $21, $71, $d8
    db $a1, $d7, $21, $71, $d8, $a1, $d7, $21, $51, $d8, $81, $d7, $71, $d8, $a1, $d7
    db $81, $d8, $b1, $d7, $a1, $71, $d8, $a1, $d7, $21, $71, $d8, $a1, $d7, $21, $71
    db $d8, $a1, $d7, $21, $81, $d8, $b1, $d7, $a1, $11, $c1, $d8, $c1, $d8, $c1, $d7
    db $c1, $d7, $c1, $d8, $c1, $d8, $c1, $d7, $c1, $d7, $c1, $d8, $c1, $11, $c1, $d7
    db $c1, $d8, $c1, $11, $c1, $d7, $91, $d8, $91, $d8, $91, $d7, $91, $d7, $91, $d8
    db $91, $d8, $91, $d7, $91, $d7, $91, $d8, $91, $d8, $a1, $d7, $91, $d7, $91, $d8
    db $91, $d8, $a1, $d7, $91, $52, $82, $d7, $22, $62, $82, $d7, $20, $d9, $21, $55
    db $e6, $90, $89, $e6, $97, $85, $ff, $d0, $09, $e5, $c0, $e6, $b0, $d2, $e8, $08
    db $85, $79, $d9, $77, $53, $73, $83, $a1, $79, $d9, $77, $53, $73, $85, $79, $d9
    db $77, $53, $73, $83, $a1, $79, $d9, $77, $83, $a3, $d2, $e5, $00, $e6, $6c, $e8
    db $08, $b1, $81, $31, $a1, $71, $21, $a1, $71, $21, $a1, $71, $21, $81, $51, $a1
    db $71, $b1, $81, $d7, $11, $d8, $a1, $71, $21, $a1, $71, $21, $a1, $71, $21, $b1
    db $81, $d7, $11, $d8, $a1, $d3, $e5, $00, $e6, $6c, $e8, $08, $c1, $91, $51, $91
    db $c1, $91, $51, $91, $c1, $71, $41, $71, $c1, $71, $41, $71, $91, $61, $21, $61
    db $91, $61, $21, $61, $91, $41, $11, $41, $91, $41, $11, $41, $e6, $70, $e4, $ff
    db $01, $22, $82, $d7, $22, $62, $81, $d9, $80, $d7, $22, $55, $e6, $70, $87, $e6
    db $77, $85, $ff, $d0, $09, $e8, $08, $e7, $02, $e9, $20, $e6, $20, $d1, $53, $51
    db $45, $43, $43, $43, $23, $43, $53, $71, $45, $43, $43, $43, $23, $43, $53, $51
    db $45, $43, $43, $43, $23, $43, $53, $71, $45, $43, $43, $43, $53, $73, $83, $81
    db $75, $73, $73, $73, $53, $73, $83, $a1, $75, $73, $73, $73, $83, $a3, $a3, $a3
    db $a3, $a3, $73, $73, $73, $73, $73, $73, $73, $73, $43, $43, $43, $43, $5f, $d9
    db $5f, $d9, $55, $ff, $d0, $09, $d1, $df, $0c, $11, $11, $81, $71, $81, $71, $81
    db $71, $e0, $d2, $df, $04, $43, $43, $43, $43, $e0, $47, $ff, $dc, $11, $d0, $01
    db $e5, $00, $d3, $e8, $08, $ea, $0c, $eb, $01, $e6, $b5, $44, $01, $e6, $a5, $46
    db $e5, $40, $e6, $70, $d4, $ea, $00, $43, $92, $d7, $23, $72, $e5, $00, $d3, $ea
    db $0c, $e6, $b5, $94, $01, $e6, $a5, $96, $e5, $40, $e6, $70, $d4, $ea, $00, $43
    db $92, $d7, $23, $72, $e5, $00, $d4, $ea, $0c, $e6, $b5, $24, $01, $e6, $a5, $26
    db $e5, $40, $e6, $70, $d4, $ea, $00, $93, $d7, $22, $73, $c2, $e5, $00, $d4, $ea
    db $0c, $e6, $b5, $74, $01, $e6, $a5, $76, $e5, $40, $e6, $70, $d4, $ea, $00, $93
    db $d7, $22, $73, $c2, $d0, $07, $e5, $00, $d4, $e6, $a5, $e8, $07, $40, $60, $70
    db $60, $40, $20, $60, $e6, $20, $e8, $08, $62, $e6, $a5, $e8, $07, $40, $60, $20
    db $10, $90, $e6, $10, $e8, $08, $98, $d0, $07, $e5, $40, $e6, $70, $d4, $e8, $08
    db $ea, $00, $d0, $01, $73, $92, $b3, $d8, $b2, $d7, $b3, $d8, $b2, $d7, $b3, $d8
    db $b2, $d7, $b3, $d8, $b2, $d7, $b3, $d8, $b2, $d7, $b3, $d8, $b2, $d7, $b3, $d8
    db $b2, $d0, $07, $dd, $d5, $e6, $a1, $30, $d8, $30, $30, $d8, $30, $d7, $30, $30
    db $d7, $30, $d8, $30, $30, $d8, $30, $d7, $30, $30, $d7, $30, $d8, $30, $30, $d8
    db $30, $d7, $d7, $10, $d8, $10, $10, $d8, $10, $d7, $10, $10, $d7, $10, $d8, $10
    db $10, $d8, $10, $d7, $10, $10, $d7, $10, $d8, $10, $10, $d8, $10, $d7, $d7, $30
    db $d8, $30, $30, $d8, $30, $d7, $30, $30, $d7, $30, $d8, $30, $30, $d8, $30, $d7
    db $30, $30, $d7, $30, $d8, $30, $30, $d7, $30, $d8, $60, $d8, $60, $d7, $60, $60
    db $d7, $60, $d8, $60, $60, $d8, $60, $d7, $60, $60, $d7, $60, $d8, $60, $60, $d8
    db $60, $d7, $50, $40, $de, $ff, $d0, $01, $e5, $40, $e6, $a4, $d2, $e8, $08, $e6
    db $a4, $b4, $01, $b6, $e6, $30, $bd, $d7, $e6, $a4, $44, $01, $46, $e6, $30, $4d
    db $e6, $a4, $94, $01, $96, $e6, $30, $9d, $d7, $e6, $a4, $24, $01, $26, $e6, $30
    db $2d, $df, $03, $e6, $94, $14, $e6, $20, $11, $e0, $e6, $a4, $16, $d8, $b4, $01
    db $b6, $d7, $d0, $07, $20, $e6, $20, $22, $e6, $a4, $d0, $01, $14, $01, $16, $d8
    db $b6, $96, $d7, $66, $e6, $20, $66, $d0, $07, $d4, $e6, $a4, $07, $d0, $01, $43
    db $62, $d0, $07, $76, $dd, $d0, $07, $d4, $e5, $80, $e6, $53, $e8, $08, $80, $50
    db $10, $80, $50, $10, $80, $50, $10, $80, $50, $10, $80, $50, $10, $80, $60, $30
    db $d8, $b0, $d7, $60, $30, $d8, $b0, $d7, $60, $30, $d8, $b0, $d7, $60, $30, $d8
    db $b0, $d7, $60, $30, $d8, $b0, $d7, $10, $80, $50, $10, $80, $50, $10, $80, $50
    db $10, $80, $50, $10, $80, $50, $10, $80, $b0, $80, $40, $b0, $80, $40, $b0, $80
    db $40, $b0, $80, $40, $b0, $80, $a0, $90, $de, $ff, $d0, $07, $e8, $06, $e7, $02
    db $e9, $60, $e6, $20, $d1, $40, $40, $01, $40, $40, $01, $d7, $40, $40, $01, $40
    db $40, $01, $d8, $40, $40, $40, $40, $d7, $40, $40, $d8, $40, $02, $40, $40, $d7
    db $40, $40, $d8, $40, $00, $07, $d7, $d0, $01, $43, $62, $d0, $07, $76, $d8, $dd
    db $d1, $30, $30, $03, $30, $30, $01, $30, $02, $10, $30, $10, $10, $03, $10, $10
    db $01, $10, $02, $b0, $d7, $10, $d8, $30, $30, $03, $30, $30, $01, $30, $02, $d7
    db $30, $d8, $30, $60, $60, $00, $60, $01, $60, $60, $01, $60, $01, $60, $50, $40
    db $de, $ff, $d0, $07, $d1, $e8, $08, $10, $10, $70, $70, $10, $10, $70, $70, $10
    db $10, $70, $70, $10, $10, $70, $70, $30, $30, $30, $30, $30, $30, $30, $70, $90
    db $70, $30, $30, $10, $10, $30, $70, $d0, $01, $d7, $d7, $c3, $c2, $c3, $c2, $d0
    db $07, $c0, $c0, $a0, $a0, $81, $d8, $d8, $a1, $11, $11, $11, $dd, $10, $10, $70
    db $70, $30, $70, $10, $10, $70, $70, $10, $70, $30, $70, $70, $70, $10, $10, $70
    db $70, $30, $70, $10, $10, $70, $70, $10, $70, $30, $70, $70, $70, $10, $10, $70
    db $70, $30, $70, $10, $10, $70, $70, $10, $70, $30, $70, $70, $70, $10, $10, $70
    db $10, $30, $70, $10, $10, $70, $70, $10, $10, $30, $70, $30, $30, $de, $ff, $d0
    db $05, $e8, $08, $ea, $0d, $eb, $01, $d3, $e5, $00, $e6, $97, $13, $a3, $53, $73
    db $d7, $23, $d8, $93, $c3, $d7, $73, $23, $33, $d8, $83, $d7, $53, $e6, $80, $bf
    db $e6, $87, $b7, $e6, $80, $cf, $e6, $87, $c7, $dd, $d0, $05, $ea, $0d, $eb, $01
    db $d3, $e5, $00, $e6, $97, $d3, $15, $35, $65, $a3, $e6, $80, $85, $e6, $87, $89
    db $d7, $e6, $97, $11, $e6, $20, $11, $e6, $97, $11, $e6, $20, $11, $e6, $97, $11
    db $d8, $15, $35, $65, $a1, $b1, $e6, $90, $85, $e6, $97, $89, $d7, $e6, $97, $11
    db $e6, $20, $11, $e6, $97, $11, $e6, $20, $11, $e6, $97, $11, $d8, $d4, $e6, $97
    db $47, $e6, $20, $41, $e6, $97, $41, $37, $e6, $20, $31, $e6, $97, $31, $d8, $c5
    db $d7, $e6, $70, $15, $e6, $77, $1b, $e6, $97, $d8, $bb, $a9, $e6, $20, $a1, $e6
    db $97, $75, $87, $d7, $e6, $97, $10, $e6, $50, $10, $e6, $97, $20, $e6, $50, $20
    db $e6, $97, $30, $e6, $50, $30, $e6, $97, $40, $e6, $50, $40, $e6, $97, $50, $e6
    db $50, $50, $d8, $e6, $97, $15, $35, $65, $a3, $e6, $90, $85, $e6, $97, $89, $d7
    db $e6, $97, $11, $e6, $20, $11, $e6, $97, $11, $e6, $20, $11, $e6, $97, $11, $d8
    db $15, $35, $65, $a1, $b1, $e6, $90, $85, $e6, $97, $89, $d7, $e6, $97, $11, $e6
    db $20, $11, $e6, $97, $11, $e6, $20, $11, $e6, $97, $11, $e6, $97, $47, $e6, $20
    db $41, $e6, $97, $41, $e6, $97, $37, $e6, $20, $31, $e6, $97, $31, $d8, $c5, $d7
    db $e6, $70, $15, $e6, $77, $1b, $e6, $97, $d8, $bb, $a9, $01, $75, $87, $d7, $e6
    db $97, $10, $e6, $50, $10, $e6, $97, $20, $e6, $50, $20, $e6, $97, $30, $e6, $50
    db $30, $e6, $97, $40, $e6, $50, $40, $e6, $97, $50, $e6, $50, $50, $e5, $00, $e6
    db $97, $30, $e6, $50, $30, $e6, $97, $10, $e6, $50, $10, $d8, $e6, $97, $c0, $e6
    db $50, $c0, $e6, $90, $a5, $e6, $97, $a5, $d7, $e6, $97, $30, $e6, $50, $30, $e6
    db $97, $10, $e6, $50, $10, $d8, $e6, $97, $c0, $e6, $50, $c0, $e6, $97, $a5, $83
    db $e6, $90, $c7, $e6, $97, $c5, $d7, $e6, $97, $30, $e6, $50, $30, $e6, $97, $10
    db $e6, $50, $10, $d8, $e6, $97, $c0, $e6, $50, $c0, $e6, $90, $a5, $e6, $97, $a5
    db $d7, $e6, $97, $30, $e6, $50, $30, $e6, $97, $10, $e6, $50, $10, $d8, $e6, $97
    db $c0, $e6, $50, $c0, $e6, $97, $a5, $b3, $d7, $e6, $90, $61, $e6, $97, $67, $d0
    db $01, $e6, $92, $66, $e6, $20, $62, $e6, $92, $66, $e6, $20, $62, $d0, $05, $e6
    db $97, $30, $e6, $50, $30, $e6, $97, $10, $e6, $50, $10, $d8, $e6, $97, $c0, $e6
    db $50, $c0, $e6, $90, $a5, $e6, $97, $a5, $d7, $e6, $97, $30, $e6, $50, $30, $e6
    db $97, $10, $e6, $50, $10, $d8, $e6, $97, $c0, $e6, $50, $c0, $e6, $97, $a5, $83
    db $e6, $90, $c7, $e6, $97, $c5, $d7, $e6, $97, $30, $e6, $50, $30, $e6, $97, $10
    db $e6, $50, $10, $d8, $e6, $97, $c0, $e6, $50, $c0, $e6, $90, $a5, $e6, $97, $a5
    db $d7, $e6, $97, $30, $e6, $50, $30, $e6, $97, $10, $e6, $50, $10, $d8, $e6, $97
    db $c0, $e6, $50, $c0, $e6, $97, $a5, $b3, $d7, $e6, $90, $61, $e6, $97, $67, $d0
    db $01, $e6, $92, $66, $e6, $20, $62, $e6, $92, $66, $e6, $20, $62, $d0, $05, $ea
    db $09, $eb, $0b, $e5, $40, $e6, $86, $d4, $15, $d3, $65, $d3, $c5, $d3, $65, $d4
    db $15, $d3, $65, $d3, $c5, $d3, $65, $d4, $35, $d3, $85, $d4, $25, $d3, $85, $d4
    db $35, $d3, $85, $d4, $25, $d3, $85, $d4, $15, $d3, $65, $d3, $c5, $d3, $65, $d4
    db $15, $d3, $65, $d3, $c5, $d3, $65, $d4, $35, $d3, $85, $d4, $25, $d3, $85, $d4
    db $35, $d3, $85, $d4, $21, $11, $21, $e6, $10, $25, $de, $ff, $d0, $05, $e8, $08
    db $d2, $e5, $80, $e6, $87, $83, $d7, $53, $d8, $c3, $d7, $23, $93, $43, $73, $d7
    db $23, $d8, $93, $a3, $33, $c3, $d7, $e6, $70, $6f, $e6, $67, $67, $e6, $70, $7f
    db $e6, $67, $77, $dd, $d0, $05, $e5, $00, $e6, $87, $d2, $a5, $c5, $d7, $35, $63
    db $e6, $80, $55, $e6, $87, $59, $e6, $87, $81, $e6, $20, $81, $e6, $87, $81, $e6
    db $20, $81, $e6, $87, $81, $d8, $e6, $87, $a5, $c5, $d7, $35, $61, $61, $e6, $80
    db $55, $e6, $87, $59, $e6, $87, $81, $e6, $20, $81, $e6, $87, $81, $e6, $20, $81
    db $e6, $87, $81, $d7, $e6, $87, $17, $e6, $20, $11, $e6, $87, $11, $d8, $c7, $e6
    db $20, $c1, $e6, $87, $c1, $95, $e6, $70, $a5, $e6, $77, $ab, $e6, $87, $8b, $79
    db $e6, $20, $71, $e6, $87, $45, $57, $e6, $87, $a0, $e6, $50, $a0, $e6, $87, $b0
    db $e6, $50, $b0, $e6, $87, $c0, $e6, $50, $c0, $d7, $e6, $87, $10, $e6, $50, $10
    db $e6, $87, $20, $e6, $50, $20, $d8, $d8, $e6, $87, $a5, $c5, $d7, $35, $63, $e6
    db $80, $55, $e6, $87, $59, $e6, $87, $81, $e6, $20, $81, $e6, $87, $81, $e6, $20
    db $81, $e6, $87, $81, $d8, $a5, $c5, $d7, $35, $61, $61, $e6, $80, $55, $e6, $87
    db $59, $e6, $87, $81, $e6, $20, $81, $e6, $87, $81, $e6, $20, $81, $e6, $87, $81
    db $d7, $e6, $87, $17, $e6, $20, $11, $e6, $87, $11, $d8, $e6, $87, $c7, $e6, $20
    db $c1, $e6, $87, $c1, $95, $e6, $70, $a5, $e6, $77, $ab, $e6, $87, $8b, $e6, $87
    db $79, $e6, $20, $71, $e6, $87, $45, $57, $e6, $87, $a0, $e6, $50, $a0, $e6, $87
    db $b0, $e6, $50, $b0, $e6, $87, $c0, $e6, $50, $c0, $d7, $e6, $87, $10, $e6, $50
    db $10, $e6, $87, $20, $e6, $50, $20, $d8, $e6, $97, $c0, $e6, $50, $c0, $e6, $97
    db $a0, $e6, $50, $a0, $e6, $97, $90, $e6, $50, $90, $e6, $80, $75, $e6, $87, $75
    db $e6, $97, $c0, $e6, $50, $c0, $e6, $97, $a0, $e6, $50, $a0, $e6, $97, $90, $e6
    db $50, $90, $e6, $87, $75, $53, $e6, $80, $97, $e6, $87, $95, $e6, $97, $c0, $e6
    db $50, $c0, $e6, $97, $a0, $e6, $50, $a0, $e6, $97, $90, $e6, $50, $90, $e6, $80
    db $75, $e6, $87, $75, $e6, $97, $c0, $e6, $50, $c0, $e6, $97, $a0, $e6, $50, $a0
    db $e6, $97, $90, $e6, $50, $90, $e6, $87, $75, $83, $d7, $e6, $80, $31, $e6, $87
    db $37, $d0, $01, $e6, $82, $36, $e6, $20, $32, $e6, $82, $36, $e6, $20, $32, $d0
    db $05, $d8, $e6, $97, $c0, $e6, $50, $c0, $e6, $97, $a0, $e6, $50, $a0, $e6, $97
    db $90, $e6, $50, $90, $e6, $80, $75, $e6, $87, $75, $e6, $97, $c0, $e6, $50, $c0
    db $e6, $97, $a0, $e6, $50, $a0, $e6, $97, $90, $e6, $50, $90, $e6, $87, $75, $53
    db $e6, $80, $97, $e6, $87, $95, $e6, $97, $c0, $e6, $50, $c0, $e6, $97, $a0, $e6
    db $50, $a0, $e6, $97, $90, $e6, $50, $90, $e6, $80, $75, $e6, $87, $75, $e6, $97
    db $c0, $e6, $50, $c0, $e6, $97, $a0, $e6, $50, $a0, $e6, $97, $90, $e6, $50, $90
    db $e6, $87, $75, $83, $d7, $e6, $80, $31, $e6, $87, $37, $d0, $01, $e6, $82, $36
    db $e6, $20, $32, $e6, $82, $36, $e6, $20, $32, $d0, $05, $d0, $05, $d4, $e5, $80
    db $e6, $77, $05, $e6, $67, $55, $35, $85, $55, $35, $d8, $a7, $e6, $20, $a3, $e6
    db $10, $a5, $d7, $e6, $67, $75, $55, $a5, $75, $55, $d8, $a5, $c7, $e6, $20, $c3
    db $d7, $e6, $67, $55, $35, $85, $55, $35, $d8, $a5, $87, $e6, $20, $83, $d7, $e6
    db $67, $75, $55, $a3, $c1, $71, $e6, $20, $73, $e6, $67, $51, $d8, $c1, $d7, $51
    db $71, $61, $71, $e6, $10, $75, $de, $ff, $d0, $05, $e8, $07, $e7, $02, $e9, $60
    db $e6, $20, $d1, $e8, $08, $33, $c3, $73, $93, $d7, $43, $d8, $b3, $d7, $23, $93
    db $43, $53, $d8, $a3, $d7, $73, $d7, $e7, $05, $e6, $20, $1f, $d9, $11, $e7, $02
    db $e6, $40, $15, $e7, $05, $e6, $20, $2f, $d9, $21, $e7, $02, $e6, $40, $25, $dd
    db $e7, $02, $d1, $e6, $20, $e8, $08, $df, $02, $df, $04, $81, $e6, $60, $81, $e6
    db $20, $81, $e0, $df, $04, $11, $e6, $60, $11, $e6, $20, $11, $e0, $e0, $e8, $07
    db $df, $03, $11, $d7, $11, $d8, $11, $11, $11, $11, $11, $d7, $11, $d8, $11, $11
    db $11, $11, $e0, $11, $d7, $11, $d8, $11, $11, $11, $11, $81, $81, $81, $81, $81
    db $81, $e8, $08, $df, $02, $df, $04, $81, $e6, $60, $81, $e6, $20, $81, $e0, $df
    db $04, $11, $e6, $60, $11, $e6, $20, $11, $e0, $e0, $e8, $07, $df, $03, $11, $d7
    db $11, $d8, $11, $11, $11, $11, $11, $d7, $11, $d8, $11, $11, $11, $11, $e0, $11
    db $d7, $11, $d8, $11, $11, $11, $11, $81, $81, $81, $81, $81, $81, $df, $07, $a1
    db $a1, $a1, $a1, $a1, $a1, $a1, $a1, $a1, $a1, $a1, $a1, $e0, $a1, $a1, $a1, $a1
    db $a1, $11, $d7, $11, $d8, $11, $d7, $11, $d8, $11, $d7, $11, $d8, $11, $31, $31
    db $31, $31, $51, $61, $81, $81, $81, $81, $61, $51, $31, $31, $31, $31, $51, $61
    db $81, $81, $81, $81, $61, $31, $51, $51, $51, $51, $71, $81, $a1, $a1, $a1, $a1
    db $81, $71, $51, $51, $51, $51, $71, $81, $a1, $a1, $a1, $a1, $81, $51, $31, $31
    db $31, $31, $51, $61, $81, $81, $81, $81, $61, $51, $31, $31, $31, $31, $51, $61
    db $81, $81, $81, $81, $61, $31, $51, $51, $51, $51, $71, $81, $a1, $a1, $a1, $a1
    db $81, $71, $51, $51, $51, $51, $71, $81, $a1, $91, $a1, $05, $de, $ff, $d0, $05
    db $d1, $df, $0c, $d7, $21, $d8, $71, $e0, $a5, $11, $03, $11, $03, $11, $03, $11
    db $03, $11, $03, $d7, $c1, $c0, $c0, $c1, $a1, $81, $81, $d8, $dd, $d1, $11, $71
    db $11, $31, $71, $11, $11, $71, $11, $31, $71, $11, $11, $71, $11, $31, $71, $11
    db $11, $91, $71, $91, $71, $91, $11, $71, $11, $31, $71, $11, $11, $71, $11, $31
    db $71, $11, $11, $71, $11, $31, $71, $11, $11, $31, $11, $d7, $c1, $a1, $81, $d8
    db $31, $71, $31, $31, $31, $91, $31, $71, $31, $31, $31, $91, $31, $71, $31, $31
    db $31, $91, $31, $31, $31, $31, $91, $31, $31, $91, $31, $31, $31, $91, $31, $91
    db $31, $31, $31, $91, $31, $91, $31, $31, $31, $91, $d7, $c1, $c0, $c0, $c1, $a1
    db $81, $81, $d8, $11, $71, $11, $31, $71, $11, $11, $71, $11, $31, $71, $11, $11
    db $71, $11, $31, $71, $11, $11, $91, $71, $91, $71, $91, $11, $71, $11, $31, $71
    db $11, $11, $71, $11, $31, $71, $11, $11, $71, $11, $31, $71, $11, $11, $31, $11
    db $d7, $c1, $a1, $81, $d8, $31, $71, $31, $31, $31, $91, $31, $71, $31, $31, $31
    db $91, $31, $71, $31, $31, $31, $91, $31, $31, $31, $31, $91, $31, $31, $91, $31
    db $31, $31, $91, $31, $91, $31, $31, $31, $91, $31, $91, $31, $31, $31, $91, $d7
    db $c1, $c0, $c0, $c1, $a1, $81, $81, $d8, $11, $71, $11, $31, $71, $11, $11, $71
    db $11, $31, $71, $11, $11, $71, $11, $31, $71, $11, $11, $31, $71, $31, $31, $91
    db $11, $71, $11, $31, $71, $11, $11, $71, $11, $31, $71, $11, $11, $71, $11, $31
    db $71, $11, $11, $31, $71, $31, $31, $31, $11, $71, $11, $31, $71, $11, $11, $71
    db $11, $31, $71, $11, $11, $71, $11, $31, $71, $11, $11, $31, $71, $31, $31, $91
    db $11, $71, $11, $31, $71, $11, $11, $71, $11, $31, $71, $11, $11, $71, $11, $31
    db $71, $11, $11, $31, $71, $31, $31, $31, $11, $71, $11, $31, $11, $91, $11, $71
    db $11, $31, $11, $91, $11, $71, $11, $31, $11, $91, $11, $71, $11, $31, $11, $91
    db $11, $71, $11, $31, $11, $71, $11, $31, $71, $11, $31, $11, $91, $11, $71, $11
    db $31, $11, $91, $11, $31, $71, $31, $71, $11, $71, $11, $31, $11, $91, $11, $71
    db $11, $31, $11, $91, $11, $71, $11, $31, $11, $91, $11, $71, $11, $31, $31, $11
    db $11, $71, $11, $31, $11, $91, $11, $71, $11, $31, $11, $91, $11, $71, $11, $31
    db $11, $91, $31, $31, $31, $d7, $c0, $c0, $a0, $a0, $80, $80, $d8, $de, $ff, $11
    db $91, $31, $31, $31, $d7, $c0, $c0, $a0, $a0, $80, $80, $d8, $de, $ff, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $c3, $06, $6c, $c3, $53, $6c, $87, $4f, $06, $00, $fa, $63, $df, $b7, $28, $03
    db $cd, $1a, $6e, $3e, $01, $ea, $63, $df, $21, $31, $6e, $09, $2a, $66, $6f, $2a
    db $ea, $9c, $de, $ea, $64, $df, $11, $5b, $df, $0e, $00, $fa, $64, $df, $0f, $ea
    db $64, $df, $30, $16, $2a, $12, $13, $2a, $12, $13, $e5, $21, $3f, $df, $09, $36
    db $00, $21, $43, $df, $09, $36, $01, $e1, $18, $02, $13, $13, $0c, $3e, $04, $b9
    db $20, $d9, $c9, $fa, $9c, $de, $b7, $20, $04, $cd, $0d, $6e, $c9, $af, $47, $4f
    db $fa, $9c, $de, $ea, $64, $df, $21, $64, $df, $7e, $0f, $77, $30, $19, $21, $43
    db $df, $09, $7e, $3d, $28, $06, $77, $cd, $68, $6d, $18, $0b, $21, $5b, $df, $09
    db $09, $2a, $66, $6f, $cd, $8e, $6c, $0c, $79, $fe, $04, $20, $d9, $c9, $7e, $e6
    db $f0, $cb, $37, $87, $5f, $16, $00, $2a, $e5, $e6, $0f, $21, $a5, $6c, $19, $5e
    db $23, $56, $62, $6b, $e9, $c8, $6c, $f3, $6c, $0c, $6d, $1d, $6d, $32, $6d, $4b
    db $6d, $57, $6d, $a3, $6d, $ce, $6d, $c5, $6c, $c5, $6c, $c5, $6c, $c5, $6c, $c5
    db $6c, $c5, $6c, $ea, $6d, $c3, $8e, $6c, $57, $e1, $2a, $5f, $e5, $21, $47, $df
    db $09, $09, $22, $72, $21, $3b, $df, $09, $7e, $36, $00, $b2, $57, $21, $13, $ff
    db $79, $87, $87, $81, $85, $6f, $7b, $22, $72, $d1, $21, $5b, $df, $09, $09, $73
    db $23, $72, $c9, $21, $3b, $df, $09, $3e, $80, $77, $e1, $2a, $5f, $e5, $21, $12
    db $ff, $79, $87, $87, $81, $85, $6f, $73, $e1, $c3, $8e, $6c, $cb, $37, $5f, $21
    db $11, $ff, $79, $87, $87, $81, $85, $6f, $73, $e1, $c3, $8e, $6c, $21, $53, $df
    db $09, $09, $d1, $1a, $13, $73, $23, $72, $21, $4f, $df, $09, $77, $6b, $62, $c3
    db $8e, $6c, $21, $4f, $df, $09, $7e, $3d, $28, $0d, $77, $21, $53, $df, $09, $09
    db $2a, $66, $6f, $d1, $c3, $8e, $6c, $e1, $c3, $8e, $6c, $21, $3f, $df, $09, $5d
    db $54, $e1, $2a, $12, $c3, $8e, $6c, $cd, $68, $6d, $21, $43, $df, $09, $5d, $54
    db $e1, $2a, $12, $5d, $54, $c3, $ea, $6c, $21, $3f, $df, $09, $7e, $b7, $28, $32
    db $21, $47, $df, $09, $09, $cb, $7f, $28, $0c, $ee, $ff, $3c, $57, $7e, $92, $22
    db $5f, $7e, $98, $18, $07, $57, $7e, $82, $22, $5f, $7e, $88, $77, $21, $3b, $df
    db $09, $56, $36, $00, $b2, $57, $21, $13, $ff, $79, $87, $87, $81, $85, $6f, $7b
    db $22, $72, $c9, $87, $16, $00, $5f, $21, $c6, $6e, $19, $2a, $66, $6f, $3e, $00
    db $e0, $1a, $42, $11, $30, $ff, $2a, $12, $13, $04, $78, $fe, $10, $20, $f7, $3e
    db $01, $ea, $9b, $de, $3e, $80, $e0, $1a, $06, $00, $e1, $c3, $8e, $6c, $e1, $2a
    db $e5, $c5, $0c, $1e, $ee, $0d, $28, $05, $07, $cb, $03, $18, $f8, $57, $21, $95
    db $de, $7e, $a3, $b2, $77, $c1, $e1, $c3, $8e, $6c, $59, $1c, $3e, $7f, $07, $1d
    db $20, $fc, $5f, $fa, $9c, $de, $a3, $ea, $9c, $de, $79, $07, $07, $81, $5f, $50
    db $21, $12, $ff, $19, $3e, $08, $22, $23, $cb, $37, $77, $e1, $c9, $af, $ea, $63
    db $df, $ea, $93, $de, $3e, $80, $ea, $92, $de, $c9, $3e, $08, $f0, $12, $f0, $17
    db $f0, $1c, $f0, $21, $3e, $80, $f0, $14, $f0, $19, $f0, $23, $af, $ea, $9c, $de
    db $c9, $6b, $6e, $6c, $6e, $6f, $6e, $72, $6e, $75, $6e, $78, $6e, $7b, $6e, $80
    db $6e, $83, $6e, $86, $6e, $89, $6e, $8c, $6e, $8f, $6e, $92, $6e, $95, $6e, $98
    db $6e, $9f, $6e, $a2, $6e, $a5, $6e, $a8, $6e, $ab, $6e, $ae, $6e, $b1, $6e, $b4
    db $6e, $b7, $6e, $ba, $6e, $bd, $6e, $c0, $6e, $c3, $6e, $00, $02, $68, $6f, $02
    db $8d, $6f, $02, $9d, $6f, $02, $c3, $6f, $02, $e7, $6f, $0a, $ff, $6f, $38, $70
    db $02, $44, $70, $02, $a0, $70, $02, $c0, $70, $02, $e6, $70, $02, $0a, $71, $02
    db $22, $71, $02, $46, $71, $02, $64, $71, $07, $96, $71, $ec, $71, $74, $72, $08
    db $de, $72, $02, $24, $73, $08, $96, $73, $08, $be, $73, $02, $e6, $73, $02, $2d
    db $74, $08, $76, $74, $08, $9e, $74, $08, $be, $74, $08, $19, $75, $02, $2e, $75
    db $08, $1e, $77, $08, $41, $77, $d8, $6e, $e8, $6e, $f8, $6e, $08, $6f, $18, $6f
    db $28, $6f, $38, $6f, $48, $6f, $58, $6f, $7a, $df, $ff, $da, $74, $10, $00, $14
    db $7a, $df, $ff, $da, $74, $10, $00, $14, $12, $23, $33, $44, $55, $66, $77, $77
    db $78, $89, $9a, $ab, $bb, $cc, $dd, $ee, $bb, $bb, $bb, $dd, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $79, $bd, $ff, $ff, $ff, $ff, $fd, $b9
    db $75, $31, $00, $00, $00, $00, $01, $35, $79, $ce, $ee, $c9, $74, $21, $11, $24
    db $79, $ce, $ee, $c9, $74, $21, $11, $24, $aa, $aa, $aa, $cc, $11, $11, $11, $11
    db $11, $11, $11, $11, $11, $11, $11, $11, $aa, $aa, $aa, $cc, $22, $22, $22, $22
    db $22, $22, $22, $22, $22, $22, $22, $22, $79, $bd, $dd, $b9, $75, $32, $11, $35
    db $79, $bd, $dd, $b9, $75, $32, $11, $35, $99, $99, $99, $bb, $33, $33, $33, $33
    db $33, $33, $33, $33, $33, $33, $33, $33, $80, $11, $24, $10, $b8, $06, $72, $07
    db $a2, $05, $ed, $28, $10, $b0, $07, $39, $07, $83, $07, $d6, $10, $80, $07, $39
    db $07, $83, $07, $d6, $10, $20, $07, $39, $07, $83, $07, $d6, $f0, $80, $11, $28
    db $10, $d0, $07, $05, $10, $f0, $07, $44, $10, $a0, $07, $97, $f0, $80, $11, $28
    db $10, $f0, $07, $59, $07, $39, $07, $b6, $07, $ac, $10, $a0, $07, $59, $07, $59
    db $07, $b6, $07, $ac, $10, $80, $07, $59, $07, $39, $07, $ac, $10, $40, $07, $59
    db $07, $ac, $f0, $80, $11, $28, $10, $f0, $07, $83, $07, $ac, $07, $83, $10, $c0
    db $07, $ac, $07, $c8, $07, $ac, $10, $70, $07, $90, $07, $b6, $07, $90, $10, $a0
    db $07, $b6, $07, $ce, $07, $b6, $f0, $80, $11, $28, $10, $f0, $07, $be, $50, $ce
    db $60, $03, $10, $f1, $07, $c1, $07, $c8, $07, $d6, $07, $c1, $07, $ce, $f0, $80
    db $11, $28, $10, $ce, $07, $be, $07, $ba, $07, $b6, $07, $b1, $07, $ac, $07, $a7
    db $07, $a2, $07, $9d, $10, $f0, $20, $07, $be, $07, $90, $07, $b6, $10, $f0, $07
    db $59, $07, $39, $07, $d1, $07, $d6, $10, $b0, $07, $59, $07, $39, $07, $d1, $07
    db $d6, $10, $70, $07, $59, $07, $d1, $f0, $80, $11, $10, $6e, $30, $04, $00, $07
    db $00, $07, $40, $f0, $80, $11, $28, $10, $f0, $07, $83, $50, $a6, $60, $03, $10
    db $f0, $06, $b2, $06, $0b, $06, $72, $10, $d0, $07, $b6, $07, $90, $07, $a7, $10
    db $90, $06, $f6, $06, $72, $06, $c4, $10, $80, $07, $c1, $07, $a2, $07, $b6, $10
    db $70, $07, $21, $06, $b2, $06, $f6, $10, $60, $07, $ce, $07, $b6, $07, $c5, $10
    db $50, $07, $4f, $06, $f6, $07, $2d, $10, $40, $07, $d6, $07, $c1, $07, $c8, $10
    db $30, $07, $6b, $07, $21, $07, $4f, $10, $20, $07, $df, $07, $ce, $07, $d9, $f0
    db $80, $11, $2c, $10, $f0, $07, $90, $07, $be, $07, $21, $07, $7b, $10, $d0, $07
    db $90, $07, $be, $10, $b0, $07, $21, $07, $7b, $10, $60, $07, $90, $07, $be, $f0
    db $80, $11, $28, $10, $f0, $07, $59, $07, $44, $07, $83, $07, $05, $07, $59, $07
    db $7b, $10, $40, $07, $59, $07, $44, $07, $83, $07, $05, $07, $59, $07, $7b, $10
    db $20, $07, $59, $07, $44, $f0, $80, $11, $2c, $10, $f0, $07, $44, $07, $62, $07
    db $c1, $07, $db, $10, $c0, $07, $44, $07, $62, $07, $c1, $07, $db, $10, $60, $07
    db $62, $07, $db, $10, $60, $07, $62, $07, $db, $f0, $80, $11, $24, $10, $f0, $06
    db $f6, $06, $d6, $07, $ac, $10, $b0, $07, $c8, $07, $c1, $07, $dd, $10, $80, $07
    db $d1, $f0, $80, $11, $20, $10, $f0, $07, $c1, $07, $83, $07, $ce, $07, $9d, $10
    db $d0, $07, $c1, $07, $c1, $07, $ce, $07, $ce, $10, $b0, $07, $c1, $07, $ce, $10
    db $80, $07, $c1, $07, $ce, $f0, $80, $11, $28, $10, $f0, $07, $7b, $07, $21, $06
    db $e7, $10, $e0, $06, $c4, $06, $9e, $10, $b0, $06, $72, $06, $42, $10, $80, $06
    db $0b, $05, $cd, $f0, $80, $11, $28, $10, $80, $07, $c1, $07, $8a, $10, $f0, $07
    db $c1, $07, $c5, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f0, $10, $f1, $07
    db $b6, $07, $73, $10, $b1, $07, $b6, $07, $73, $10, $81, $07, $b6, $07, $ba, $10
    db $41, $07, $b6, $07, $ba, $f0, $80, $11, $24, $10, $f3, $06, $0b, $50, $00, $60
    db $01, $06, $42, $06, $5b, $06, $72, $60, $02, $06, $89, $07, $05, $60, $09, $10
    db $83, $06, $0b, $60, $01, $06, $42, $06, $5b, $06, $72, $60, $02, $06, $89, $07
    db $05, $60, $0a, $10, $45, $06, $0b, $60, $01, $06, $42, $06, $5b, $06, $72, $60
    db $02, $06, $89, $07, $05, $60, $0a, $10, $26, $06, $0b, $60, $01, $06, $42, $06
    db $5b, $06, $72, $60, $02, $06, $89, $07, $05, $60, $0a, $f0, $80, $11, $24, $10
    db $f3, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f3, $07, $02, $07, $02, $07
    db $1e, $07, $2a, $07, $35, $07, $35, $07, $35, $07, $40, $30, $0b, $07, $7f, $40
    db $10, $83, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $83, $07, $02, $07, $02
    db $07, $1e, $07, $2a, $07, $35, $07, $35, $07, $35, $07, $40, $30, $0b, $07, $7f
    db $40, $10, $35, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $35, $07, $02, $07
    db $02, $07, $1e, $07, $2a, $07, $35, $07, $35, $07, $35, $07, $40, $30, $0b, $07
    db $7f, $40, $10, $16, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $16, $07, $02
    db $07, $02, $07, $1e, $07, $2a, $07, $35, $07, $35, $07, $35, $07, $40, $30, $0b
    db $07, $7f, $40, $f0, $80, $11, $72, $10, $00, $50, $00, $60, $01, $50, $ff, $10
    db $01, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $01, $10, $20, $07, $05, $50
    db $00, $60, $01, $07, $21, $07, $2d, $07, $39, $60, $02, $07, $44, $07, $83, $60
    db $09, $10, $20, $07, $05, $60, $01, $07, $21, $07, $2d, $07, $39, $60, $02, $07
    db $44, $07, $83, $60, $0a, $10, $40, $07, $05, $60, $01, $07, $21, $07, $2d, $07
    db $39, $60, $02, $07, $44, $07, $83, $60, $09, $10, $60, $07, $05, $60, $01, $07
    db $21, $07, $2d, $07, $39, $60, $02, $07, $44, $07, $83, $60, $0a, $f0, $80, $11
    db $10, $f2, $00, $25, $00, $26, $00, $27, $00, $25, $10, $00, $50, $00, $60, $01
    db $50, $ff, $10, $f2, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f2, $10, $f4
    db $00, $16, $00, $12, $00, $24, $50, $0a, $60, $02, $00, $36, $00, $33, $30, $0a
    db $00, $15, $50, $0a, $60, $02, $00, $26, $00, $02, $40, $00, $14, $50, $0a, $60
    db $02, $00, $02, $f0, $80, $11, $10, $f0, $28, $06, $72, $05, $63, $06, $42, $07
    db $05, $07, $7b, $04, $83, $05, $63, $06, $d6, $10, $d0, $24, $06, $72, $05, $63
    db $06, $42, $07, $05, $07, $7b, $04, $83, $05, $63, $06, $d6, $10, $a0, $20, $06
    db $72, $05, $63, $06, $42, $07, $05, $07, $7b, $04, $83, $05, $63, $06, $d6, $10
    db $80, $06, $72, $05, $63, $06, $42, $07, $05, $07, $7b, $04, $83, $05, $63, $06
    db $d6, $10, $40, $06, $72, $05, $63, $06, $42, $07, $05, $07, $7b, $04, $83, $05
    db $63, $06, $d6, $10, $20, $06, $72, $05, $63, $06, $42, $07, $05, $07, $7b, $04
    db $83, $05, $63, $06, $d6, $f0, $80, $11, $10, $f1, $00, $27, $00, $15, $10, $00
    db $50, $00, $60, $01, $50, $ff, $10, $f1, $10, $00, $50, $00, $60, $01, $50, $ff
    db $10, $f1, $00, $2b, $00, $a5, $30, $06, $00, $07, $00, $36, $40, $f0, $80, $11
    db $10, $f0, $00, $63, $00, $60, $00, $62, $00, $63, $00, $60, $00, $62, $10, $f7
    db $30, $14, $00, $31, $50, $02, $60, $01, $00, $21, $50, $02, $60, $03, $00, $41
    db $50, $02, $60, $01, $40, $f0, $80, $11, $20, $10, $f3, $07, $a2, $07, $90, $07
    db $83, $30, $03, $07, $21, $07, $05, $40, $07, $21, $07, $05, $07, $39, $07, $21
    db $07, $4f, $07, $39, $07, $62, $07, $4f, $07, $73, $07, $62, $07, $83, $07, $73
    db $07, $90, $07, $83, $07, $9d, $07, $90, $07, $a7, $07, $9d, $07, $b1, $07, $a7
    db $07, $ba, $07, $b1, $07, $c1, $07, $ba, $07, $c8, $07, $c1, $f0, $80, $11, $20
    db $10, $8e, $30, $03, $07, $c1, $07, $a2, $40, $10, $f1, $07, $c1, $07, $a2, $10
    db $f1, $07, $c1, $07, $a2, $10, $d1, $07, $c1, $07, $a2, $10, $d1, $07, $c1, $07
    db $a2, $10, $b1, $07, $c1, $07, $a2, $10, $91, $07, $c1, $07, $a2, $10, $91, $07
    db $c1, $07, $a2, $10, $71, $07, $c1, $07, $a2, $10, $51, $07, $c5, $07, $a7, $10
    db $41, $07, $c8, $07, $ac, $f0, $80, $11, $10, $8d, $30, $05, $00, $13, $00, $03
    db $40, $10, $f0, $00, $07, $00, $02, $00, $55, $00, $31, $10, $d0, $30, $02, $00
    db $85, $00, $15, $40, $10, $92, $30, $0a, $00, $44, $00, $14, $40, $f0, $80, $11
    db $2c, $10, $f0, $00, $db, $00, $15, $00, $35, $10, $d0, $00, $db, $00, $15, $00
    db $35, $10, $b0, $00, $85, $00, $15, $10, $81, $00, $85, $00, $15, $f0, $80, $11
    db $10, $f0, $00, $66, $00, $2d, $00, $66, $10, $00, $50, $00, $60, $01, $50, $ff
    db $10, $f0, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f0, $10, $d0, $00, $66
    db $00, $2d, $00, $66, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $d0, $10, $00
    db $50, $00, $60, $01, $50, $ff, $10, $d0, $10, $80, $00, $66, $00, $2d, $10, $00
    db $50, $00, $60, $01, $50, $ff, $10, $80, $10, $00, $50, $00, $60, $01, $50, $ff
    db $10, $80, $10, $40, $00, $66, $00, $2d, $f0, $80, $11, $28, $10, $f7, $30, $14
    db $00, $71, $00, $73, $00, $71, $00, $52, $00, $55, $00, $52, $40, $f0, $80, $11
    db $20, $10, $f2, $04, $16, $06, $28, $04, $16, $06, $28, $10, $00, $50, $00, $60
    db $01, $50, $ff, $10, $f2, $04, $83, $06, $5b, $10, $00, $50, $00, $60, $01, $50
    db $ff, $10, $f2, $04, $e5, $06, $89, $10, $00, $50, $00, $60, $01, $50, $ff, $10
    db $f2, $05, $3c, $06, $b2, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f2, $05
    db $89, $06, $d6, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f2, $05, $cd, $06
    db $f6, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $f2, $05, $cd, $06, $f6, $10
    db $00, $50, $00, $60, $01, $50, $ff, $10, $f2, $05, $cd, $06, $d6, $10, $00, $50
    db $00, $60, $01, $50, $ff, $10, $f2, $05, $3c, $06, $b2, $10, $00, $50, $00, $60
    db $01, $50, $ff, $10, $f2, $04, $e5, $06, $89, $10, $00, $50, $00, $60, $01, $50
    db $ff, $10, $f2, $04, $83, $06, $5b, $10, $00, $50, $00, $60, $01, $50, $ff, $10
    db $f2, $04, $16, $06, $28, $10, $b2, $04, $16, $06, $28, $04, $16, $06, $28, $10
    db $00, $50, $00, $60, $01, $50, $ff, $10, $b2, $04, $83, $06, $5b, $10, $00, $50
    db $00, $60, $01, $50, $ff, $10, $b2, $04, $e5, $06, $89, $10, $00, $50, $00, $60
    db $01, $50, $ff, $10, $b2, $05, $3c, $06, $b2, $10, $00, $50, $00, $60, $01, $50
    db $ff, $10, $b2, $05, $89, $06, $d6, $10, $00, $50, $00, $60, $01, $50, $ff, $10
    db $b2, $05, $cd, $06, $f6, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $b2, $05
    db $cd, $06, $f6, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $b2, $05, $cd, $06
    db $d6, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $b2, $05, $3c, $06, $b2, $10
    db $00, $50, $00, $60, $01, $50, $ff, $10, $b2, $04, $e5, $06, $89, $10, $00, $50
    db $00, $60, $01, $50, $ff, $10, $b2, $04, $83, $06, $5b, $10, $00, $50, $00, $60
    db $01, $50, $ff, $10, $b2, $04, $16, $06, $28, $10, $62, $04, $16, $06, $28, $04
    db $16, $06, $28, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $62, $04, $83, $06
    db $5b, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $62, $04, $e5, $06, $89, $10
    db $00, $50, $00, $60, $01, $50, $ff, $10, $62, $05, $3c, $06, $b2, $10, $00, $50
    db $00, $60, $01, $50, $ff, $10, $62, $05, $89, $06, $d6, $10, $00, $50, $00, $60
    db $01, $50, $ff, $10, $62, $05, $cd, $06, $f6, $10, $00, $50, $00, $60, $01, $50
    db $ff, $10, $62, $05, $cd, $06, $f6, $10, $00, $50, $00, $60, $01, $50, $ff, $10
    db $62, $05, $cd, $06, $d6, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $62, $05
    db $3c, $06, $b2, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $62, $04, $e5, $06
    db $89, $10, $00, $50, $00, $60, $01, $50, $ff, $10, $62, $04, $83, $06, $5b, $10
    db $00, $50, $00, $60, $01, $50, $ff, $10, $62, $04, $16, $06, $28, $f0, $80, $11
    db $28, $10, $4e, $30, $03, $00, $15, $00, $15, $40, $10, $f5, $30, $03, $00, $22
    db $50, $02, $60, $02, $40, $00, $22, $00, $22, $30, $3c, $00, $32, $00, $34, $40
    db $f0, $80, $11, $10, $d2, $00, $35, $50, $02, $60, $02, $f0, $f0, $80, $11, $10
    db $d2, $00, $35, $50, $02, $60, $02, $f0
