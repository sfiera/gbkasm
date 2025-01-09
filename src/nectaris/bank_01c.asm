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

SECTION "ROM Bank $01c", ROMX[$4000], BANK[$1c]

Call_01c_4000::
    jp Jump_01c_4088


Call_01c_4003::
    jp Jump_01c_40f4


Call_01c_4006::
    jp Jump_01c_4021


Call_01c_4009::
    jp Jump_01c_4038


Call_01c_400c::
    jp Jump_01c_4059


Call_01c_400f::
    jp Jump_01c_405d


Call_01c_4012::
    jp Jump_01c_4067


Call_01c_4015::
    jp Jump_01c_4071


Call_01c_4018::
    jp Jump_01c_407a


Call_01c_401b::
    jp Jump_01c_49b9


Call_01c_401e::
    jp Jump_01c_49c3


Jump_01c_4021:
    push hl
    ld hl, $511a
    cp [hl]
    jr nc, jr_01c_4036

    ld [$de90], a
    xor a
    ld [$de9b], a
    ld [$deff], a
    dec a
    ld [$de94], a

jr_01c_4036:
    pop hl
    ret


Jump_01c_4038:
    push bc
    push hl
    ld b, $00
    ld c, a
    or a
    jr z, jr_01c_404e

    ld hl, $51bf
    add hl, bc
    ld b, [hl]
    ld a, [$de93]
    or a
    jr z, jr_01c_404e

    cp b
    jr c, jr_01c_4056

jr_01c_404e:
    ld a, c
    ld [$de92], a
    ld a, b
    ld [$de93], a

jr_01c_4056:
    pop hl
    pop bc
    ret


Jump_01c_4059:
    ld [$df00], a
    ret


Jump_01c_405d:
    ld a, [$de90]
    cp $80
    ld a, $01
    ret nz

    xor a
    ret


Jump_01c_4067:
    ld a, [$de92]
    cp $80
    ld a, $01
    ret nz

    xor a
    ret


Jump_01c_4071:
    ld a, [$df02]
    xor $01
    ld [$df02], a
    ret


Jump_01c_407a:
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


Jump_01c_4088:
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

jr_01c_40c6:
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
    jr nz, jr_01c_40c6

Jump_01c_40e5:
    ld hl, $4c11
    ld bc, $df03
    ld d, $08

jr_01c_40ed:
    ld a, [hl+]
    ld [bc], a
    inc bc
    dec d
    jr nz, jr_01c_40ed

    ret


Jump_01c_40f4:
    call Call_01c_42af
    call Call_01c_4127
    ld hl, $6c03
    call Call_000_3f80
    ld a, [$de91]
    ldh [$80], a
    ld [$2000], a
    ld a, [$df02]
    cp $00
    jr z, jr_01c_4114

    call Call_01c_4975
    jr jr_01c_4120

jr_01c_4114:
    call Call_01c_42b0
    call Call_01c_4315
    call Call_01c_437a
    call Call_01c_43d9

jr_01c_4120:
    call Call_01c_486e
    call Call_01c_49a6
    ret


Call_01c_4127:
    ld a, [$de90]
    rla
    jr c, jr_01c_413e

    call Call_01c_4156
    ld a, [$de90]
    call Call_01c_4197
    ld a, [$de90]
    or $80
    ld [$de90], a

jr_01c_413e:
    ld a, [$de92]
    rla
    jr c, jr_01c_4155

    ld a, [$de92]
    ld hl, $6c00
    call Call_000_3f80
    ld a, [$de92]
    or $80
    ld [$de92], a

jr_01c_4155:
    ret


Call_01c_4156:
    ld a, [$de9c]
    ld d, a
    xor a
    ld [$de9d], a
    bit 0, d
    jr nz, jr_01c_416a

    ld a, $08
    ldh [rNR12], a
    swap a
    ldh [rNR14], a

jr_01c_416a:
    xor a
    ld [$de9e], a
    bit 1, d
    jr nz, jr_01c_417a

    ld a, $08
    ldh [rNR22], a
    swap a
    ldh [rNR24], a

jr_01c_417a:
    xor a
    ld [$dea0], a
    bit 3, d
    jr nz, jr_01c_418a

    ld a, $08
    ldh [rNR42], a
    swap a
    ldh [rNR44], a

jr_01c_418a:
    xor a
    ld [$de9f], a
    bit 2, d
    jr nz, jr_01c_4196

    ld a, $00
    ldh [rNR32], a

jr_01c_4196:
    ret


Call_01c_4197:
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
    jr nc, jr_01c_41f6

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

jr_01c_41f6:
    rr e
    jr nc, jr_01c_4233

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

jr_01c_4233:
    rr e
    jr nc, jr_01c_4270

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

jr_01c_4270:
    rr e
    jr nc, jr_01c_42aa

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

jr_01c_42aa:
    xor a
    ld [$df02], a
    ret


Call_01c_42af:
    ret


Call_01c_42b0:
    ld a, [$de9d]
    or a
    jr z, jr_01c_4305

    ld a, [$dec7]
    cp $00
    jr z, jr_01c_42df

    ld a, [$ded3]
    dec a
    ld [$ded3], a
    jr nz, jr_01c_42df

    ld a, [$decb]
    cp $01
    jr z, jr_01c_42df

    ld a, [$de9c]
    bit 0, a
    jr nz, jr_01c_42df

    ld hl, $ff12
    ld a, [$ded7]
    ld [hl+], a
    inc hl
    ld a, $80
    ld [hl], a

jr_01c_42df:
    ld a, [$decb]
    dec a
    ld [$decb], a
    jr nz, jr_01c_42ff

    ld a, [$dea6]
    ld h, a
    ld a, [$dea5]
    ld l, a
    ld bc, $0000
    call Call_01c_441f
    ld a, [$de9d]
    or a
    jr z, jr_01c_4305

    call Call_01c_471c

jr_01c_42ff:
    ld a, $00
    call Call_01c_4862
    ret


jr_01c_4305:
    ld a, [$de9c]
    bit 0, a
    jr nz, jr_01c_4314

    ld a, $08
    ldh [rNR12], a
    swap a
    ldh [rNR14], a

jr_01c_4314:
    ret


Call_01c_4315:
    ld a, [$de9e]
    or a
    jr z, jr_01c_436a

    ld a, [$dec8]
    cp $00
    jr z, jr_01c_4344

    ld a, [$ded4]
    dec a
    ld [$ded4], a
    jr nz, jr_01c_4344

    ld a, [$decc]
    cp $01
    jr z, jr_01c_4344

    ld a, [$de9c]
    bit 1, a
    jr nz, jr_01c_4344

    ld hl, $ff17
    ld a, [$ded8]
    ld [hl+], a
    inc hl
    ld a, $80
    ld [hl], a

jr_01c_4344:
    ld a, [$decc]
    dec a
    ld [$decc], a
    jr nz, jr_01c_4364

    ld a, [$dea8]
    ld h, a
    ld a, [$dea7]
    ld l, a
    ld bc, $0001
    call Call_01c_441f
    ld a, [$de9e]
    or a
    jr z, jr_01c_436a

    call Call_01c_4762

jr_01c_4364:
    ld a, $01
    call Call_01c_4862
    ret


jr_01c_436a:
    ld a, [$de9c]
    bit 1, a
    jr nz, jr_01c_4379

    ld a, $08
    ldh [rNR22], a
    swap a
    ldh [rNR24], a

jr_01c_4379:
    ret


Call_01c_437a:
    ld a, [$de9f]
    or a
    jr z, jr_01c_43c9

    ld a, [$dec9]
    cp $00
    jr z, jr_01c_43a3

    ld a, [$ded5]
    dec a
    ld [$ded5], a
    jr nz, jr_01c_43a3

    ld a, [$de9c]
    bit 2, a
    jr nz, jr_01c_43a3

    ld a, [$decd]
    cp $01
    jr z, jr_01c_43a3

    ld a, [$ded9]
    ldh [rNR32], a

jr_01c_43a3:
    ld a, [$decd]
    dec a
    ld [$decd], a
    jr nz, jr_01c_43c3

    ld a, [$deaa]
    ld h, a
    ld a, [$dea9]
    ld l, a
    ld bc, $0002
    call Call_01c_441f
    ld a, [$de9f]
    or a
    jr z, jr_01c_43c9

    call Call_01c_47a4

jr_01c_43c3:
    ld a, $02
    call Call_01c_4862
    ret


jr_01c_43c9:
    ld a, [$de9c]
    bit 2, a
    jr nz, jr_01c_43d8

    ld a, $00
    ldh [rNR32], a
    ld a, $80
    ldh [rNR34], a

jr_01c_43d8:
    ret


Call_01c_43d9:
    ld a, [$dea0]
    or a
    jr z, jr_01c_440b

    ld a, [$dece]
    dec a
    ld [$dece], a
    jr nz, jr_01c_4401

    ld a, [$deac]
    ld h, a
    ld a, [$deab]
    ld l, a
    ld bc, $0003
    call Call_01c_441f
    ld a, [$dea0]
    or a
    jr z, jr_01c_440b

    call Call_01c_4812
    jr jr_01c_441e

jr_01c_4401:
    ld a, [$deff]
    or a
    jr z, jr_01c_441e

    call Call_01c_4841
    ret


jr_01c_440b:
    ld a, [$de9c]
    bit 3, a
    jr nz, jr_01c_441e

    xor a
    ld [$deff], a
    ld a, $08
    ldh [rNR42], a
    swap a
    ldh [rNR44], a

jr_01c_441e:
    ret


Call_01c_441f:
Jump_01c_441f:
    ld a, [hl+]
    push hl
    push af
    cp $d0
    jr c, jr_01c_4497

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
    jr z, jr_01c_449f

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

jr_01c_4497:
    push af
    ld a, [hl]
    ld e, a
    ld hl, $dea1
    add hl, bc
    ld a, [hl]

jr_01c_449f:
    cp $80
    jr z, jr_01c_44ba

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

jr_01c_44ba:
    pop af
    push de
    ld hl, $dedf
    add hl, bc
    ld d, [hl]
    and $0f
    inc a
    cp d
    jr nc, jr_01c_44ca

    ld e, a
    ld a, d
    ld d, e

jr_01c_44ca:
    ld e, a

jr_01c_44cb:
    dec d
    jr z, jr_01c_44d1

    add e
    jr jr_01c_44cb

jr_01c_44d1:
    ld hl, $decb
    add hl, bc
    ld [hl], a
    pop de
    ld d, a
    ld a, e
    cp $d9
    ld a, d
    jr z, jr_01c_4505

    ld e, a
    ld hl, $decf
    add hl, bc
    ld a, [hl]
    cp $08
    ld d, a
    ld a, e
    jr z, jr_01c_4505

    push hl
    push bc
    ld b, $00
    ld c, a
    ld hl, $0000

jr_01c_44f2:
    add hl, bc
    dec d
    jr nz, jr_01c_44f2

    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld a, l
    pop bc
    pop hl

jr_01c_4505:
    ld hl, $ded3
    add hl, bc
    ld [hl], a
    pop af
    and $f0
    ld hl, $dec7
    add hl, bc
    ld [hl], a
    or a
    jr nz, jr_01c_4518

    jp Jump_01c_4598


jr_01c_4518:
    swap a
    dec a
    ld h, a
    ld a, $03
    cp c
    ld a, h
    jr z, jr_01c_4524

    jr jr_01c_456e

jr_01c_4524:
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
    jr jr_01c_4598

jr_01c_456e:
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
    call Call_01c_495c
    pop hl
    ld a, e
    ld [hl+], a
    ld [hl], d

Jump_01c_4598:
jr_01c_4598:
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
    jp Jump_01c_4718


    and $07
    dec a
    ld hl, $debf
    add hl, bc
    push af
    ld a, c
    cp $02
    jr nz, jr_01c_45c0

    pop af
    inc a
    ld [hl], a
    jp Jump_01c_4718


jr_01c_45c0:
    pop af
    ld [hl], a
    jp Jump_01c_4718


    ld hl, $debf
    add hl, bc
    inc [hl]
    jp Jump_01c_4718


    ld hl, $debf
    add hl, bc
    dec [hl]
    jp Jump_01c_4718


    ld hl, $dea1
    add hl, bc
    ld [hl], $80
    jp Jump_01c_4718


    pop hl
    ld a, [hl+]
    push hl
    push bc
    inc c
    ld e, $ee

jr_01c_45e5:
    dec c
    jr z, jr_01c_45ed

    rlca
    rlc e
    jr jr_01c_45e5

jr_01c_45ed:
    ld d, a
    ld hl, $de94
    ld a, [hl]
    and e
    or d
    ld [hl], a
    pop bc
    jp Jump_01c_4718


    pop de
    push de
    dec de
    ld hl, $dead
    add hl, bc
    add hl, bc
    ld [hl], e
    inc hl
    ld [hl], d
    jp Jump_01c_4718


    pop hl
    ld hl, $dead
    add hl, bc
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp Jump_01c_441f


    pop de
    ld a, [de]
    inc de
    push af
    call Call_01c_4704
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    pop af
    ld [hl], a
    inc hl
    push de
    call Call_01c_470d
    jp Jump_01c_4718


    call Call_01c_4704
    dec hl
    ld a, [hl]
    dec a
    jr z, jr_01c_463a

    ld [hl-], a
    ld d, [hl]
    dec hl
    ld e, [hl]
    pop hl
    ld h, d
    ld l, e
    jp Jump_01c_441f


jr_01c_463a:
    dec hl
    dec hl
    call Call_01c_470d
    jp Jump_01c_4718


    pop hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp Jump_01c_441f


    call Call_01c_4704
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
    call Call_01c_470d
    jp Jump_01c_4718


    pop de
    call Call_01c_4704
    dec hl
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    inc de
    inc de
    push de
    call Call_01c_470d
    jp Jump_01c_4718


    pop de
    ld a, [de]
    inc de
    ld hl, $defa
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


    pop de
    ld a, [de]
    inc de
    ld hl, $de96
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


    pop de
    ld a, [de]
    inc de
    ld hl, $def7
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


    pop de
    ld a, [de]
    inc de
    ld [$de9a], a
    ld a, $01
    ld [$de9b], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


    pop de
    ld a, [de]
    inc de
    ld hl, $decf
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


    pop de
    ld a, [de]
    inc de
    ld hl, $ded7
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


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
    jp Jump_01c_441f


    pop de
    ld a, [de]
    inc de
    ld hl, $deef
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


    pop de
    ld a, [de]
    inc de
    ld hl, $dedb
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


    pop de
    ld a, [de]
    inc de
    ld hl, $dedb
    add hl, bc
    add [hl]
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


    ld hl, $de9d
    add hl, bc
    ld [hl], $00
    pop hl
    ret


Call_01c_4704:
    ld hl, $df03
    add hl, bc
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ret


Call_01c_470d:
    ld d, h
    ld e, l
    ld hl, $df03
    add hl, bc
    add hl, bc
    ld [hl], e
    inc hl
    ld [hl], d
    ret


Jump_01c_4718:
    pop hl
    jp Jump_01c_441f


Call_01c_471c:
    ld a, [$de9c]
    bit 0, a
    jr nz, jr_01c_4751

    ld a, [$dec7]
    cp $00
    jr z, jr_01c_4752

    ld d, $00
    ld hl, $dea1
    ld a, [hl]
    cp $80
    jr z, jr_01c_473b

    ld a, [$def7]
    ldh [rNR12], a
    ld d, $80

jr_01c_473b:
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

jr_01c_4751:
    ret


jr_01c_4752:
    ld hl, $dea1
    ld [hl], $00
    ld hl, $ff12
    ld a, $08
    ld [hl+], a
    inc hl
    swap a
    ld [hl], a
    ret


Call_01c_4762:
    ld a, [$de9c]
    bit 1, a
    jr nz, jr_01c_4793

    ld a, [$dec8]
    cp $00
    jr z, jr_01c_4794

    ld d, $00
    ld hl, $dea2
    ld a, [hl]
    cp $80
    jr z, jr_01c_4781

    ld a, [$def8]
    ldh [rNR22], a
    ld d, $80

jr_01c_4781:
    ld [hl], $02
    ld a, [$de97]
    ldh [rNR21], a
    ld a, [$deb7]
    ldh [rNR23], a
    ld a, [$deb8]
    or d
    ldh [rNR24], a

jr_01c_4793:
    ret


jr_01c_4794:
    ld hl, $dea2
    ld [hl], $00
    ld hl, $ff17
    ld a, $08
    ld [hl+], a
    inc hl
    swap a
    ld [hl], a
    ret


Call_01c_47a4:
    ld a, [$de9c]
    bit 2, a
    jr nz, jr_01c_47e8

    ld d, $00
    ld a, [$de9b]
    or a
    jr z, jr_01c_47bb

    xor a
    ldh [rNR30], a
    call Call_01c_47f2
    ld d, $80

jr_01c_47bb:
    ld a, [$dec9]
    cp $00
    jr z, jr_01c_47e9

    ld hl, $dea3
    ld a, [hl]
    cp $80
    jr z, jr_01c_47d4

    ld a, [$def9]
    ldh [rNR32], a
    xor a
    ldh [rNR30], a
    ld d, $80

jr_01c_47d4:
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

jr_01c_47e8:
    ret


jr_01c_47e9:
    ld hl, $dea1
    ld [hl], $00
    xor a
    ldh [rNR30], a
    ret


Call_01c_47f2:
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

jr_01c_4804:
    ld a, [hl+]
    ld [de], a
    inc de
    inc b
    ld a, b
    cp $10
    jr nz, jr_01c_4804

    xor a
    ld [$de9b], a
    ret


Call_01c_4812:
    ld a, [$de9c]
    bit 3, a
    jr nz, jr_01c_4831

    ld a, [$deca]
    cp $00
    jr z, jr_01c_4832

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

jr_01c_4831:
    ret


jr_01c_4832:
    xor a
    ld [$deff], a
    ld hl, $ff21
    ld a, $08
    ld [hl+], a
    inc hl
    swap a
    ld [hl], a
    ret


Call_01c_4841:
    ld a, [$de9c]
    bit 3, a
    jr z, jr_01c_484e

    xor a
    ld [$deff], a
    jr jr_01c_4861

jr_01c_484e:
    ld hl, $defd
    ld a, [hl+]
    ld d, [hl]
    ld e, a
    ld a, [de]
    cp $ff
    jr nz, jr_01c_485b

    jr jr_01c_4832

jr_01c_485b:
    ldh [rNR43], a
    inc de
    ld a, d
    ld [hl-], a
    ld [hl], e

jr_01c_4861:
    ret


Call_01c_4862:
    push af
    ld b, $00
    ld c, a
    call Call_01c_48a0
    pop af
    call Call_01c_4913
    ret


Call_01c_486e:
    ld a, [$df01]
    ldh [rNR50], a
    ld a, [$de9c]
    or a
    ld hl, $de94
    ld a, [hl+]
    jr z, jr_01c_4890

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

jr_01c_4890:
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


Call_01c_48a0:
    ld hl, $deef
    add hl, bc
    ld a, [hl]
    cp $00
    jr z, jr_01c_490a

    ld hl, $def3
    add hl, bc
    cp [hl]
    jr z, jr_01c_48b3

    inc [hl]
    jr jr_01c_490a

jr_01c_48b3:
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
    jr z, jr_01c_48f6

    ld hl, $deb5
    add hl, bc
    add hl, bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    bit 7, a
    jr nz, jr_01c_48e7

    add e
    ld e, a
    ld a, $00
    adc d
    and $07
    ld d, a
    ret


jr_01c_48e7:
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


jr_01c_48f6:
    push hl
    ld hl, $deeb
    add hl, bc
    ld [hl], $00
    pop hl
    ld a, [hl]
    cp $80
    jr z, jr_01c_48b3

    ld hl, $dee3
    add hl, bc
    ld [hl], a
    jr jr_01c_48b3

jr_01c_490a:
    ld hl, $deb5
    add hl, bc
    add hl, bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    ret


Call_01c_4913:
    cp $00
    jr nz, jr_01c_492b

    ld a, [$deef]
    cp $00
    jr z, jr_01c_492b

    ld a, [$de9c]
    bit 0, a
    jr nz, jr_01c_495b

    ld a, e
    ldh [rNR13], a
    ld a, d
    ldh [rNR14], a

jr_01c_492b:
    cp $01
    jr nz, jr_01c_4943

    ld a, [$def0]
    cp $00
    jr z, jr_01c_4943

    ld a, [$de9c]
    bit 1, a
    jr nz, jr_01c_495b

    ld a, e
    ldh [rNR23], a
    ld a, d
    ldh [rNR24], a

jr_01c_4943:
    cp $02
    jr nz, jr_01c_495b

    ld a, [$def1]
    cp $00
    jr z, jr_01c_495b

    ld a, [$de9c]
    bit 2, a
    jr nz, jr_01c_495b

    ld a, e
    ldh [rNR33], a
    ld a, d
    ldh [rNR34], a

jr_01c_495b:
    ret


Call_01c_495c:
    ld hl, $defa
    add hl, bc
    ld a, [hl]
    bit 7, a
    jr nz, jr_01c_496b

    add e
    ld e, a
    ld a, d
    adc b
    ld d, a
    ret


jr_01c_496b:
    xor $ff
    ld h, a
    ld a, e
    sub h
    ld e, a
    ld a, d
    sbc b
    ld d, a
    ret


Call_01c_4975:
    ld a, [$de9c]
    ld d, a
    bit 0, d
    jr nz, jr_01c_4985

    ld a, $08
    ldh [rNR12], a
    swap a
    ldh [rNR14], a

jr_01c_4985:
    bit 1, d
    jr nz, jr_01c_4991

    swap a
    ldh [rNR22], a
    swap a
    ldh [rNR24], a

jr_01c_4991:
    bit 3, d
    jr nz, jr_01c_499d

    swap a
    ldh [rNR42], a
    swap a
    ldh [rNR44], a

jr_01c_499d:
    bit 2, d
    jr nz, jr_01c_49a5

    ld a, $00
    ldh [rNR32], a

jr_01c_49a5:
    ret


Call_01c_49a6:
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


Jump_01c_49b9:
    call Call_01c_4975
    call Call_01c_49cd
    call Call_01c_4156
    ret


Jump_01c_49c3:
    call Call_01c_4975
    call Call_01c_4156
    call Call_01c_4af2
    ret


Call_01c_49cd:
    ld a, [$de90]
    ld [$df65], a
    ld a, [$de91]
    ld [$df66], a
    ld a, [$de94]
    ld [$df67], a
    ld hl, $de96
    ld de, $df68
    ld a, $04
    call Call_01c_4c09
    ld a, [$de9a]
    ld [$df6c], a
    ld a, [$de9b]
    ld [$df6d], a
    ld hl, $de9d
    ld de, $df6e
    ld a, $04
    call Call_01c_4c09
    ld hl, $dea1
    ld de, $df72
    ld a, $04
    call Call_01c_4c09
    ld hl, $dea5
    ld de, $df76
    ld a, $08
    call Call_01c_4c09
    ld hl, $dead
    ld de, $df7e
    ld a, $08
    call Call_01c_4c09
    ld a, [$debb]
    ld [$df86], a
    ld a, [$debc]
    ld [$df87], a
    ld hl, $debf
    ld de, $df88
    ld a, $04
    call Call_01c_4c09
    ld hl, $dec3
    ld de, $df8c
    ld a, $04
    call Call_01c_4c09
    ld hl, $dec7
    ld de, $df90
    ld a, $04
    call Call_01c_4c09
    ld hl, $decb
    ld de, $df94
    ld a, $04
    call Call_01c_4c09
    ld hl, $decf
    ld de, $df98
    ld a, $04
    call Call_01c_4c09
    ld hl, $ded3
    ld de, $df9c
    ld a, $04
    call Call_01c_4c09
    ld hl, $ded7
    ld de, $dfa0
    ld a, $04
    call Call_01c_4c09
    ld hl, $dedb
    ld de, $dfa4
    ld a, $04
    call Call_01c_4c09
    ld hl, $dedf
    ld de, $dfa8
    ld a, $04
    call Call_01c_4c09
    ld hl, $dee7
    ld de, $dfac
    ld a, $04
    call Call_01c_4c09
    ld hl, $deef
    ld de, $dfb0
    ld a, $04
    call Call_01c_4c09
    ld a, $00
    ld [$deeb], a
    ld [$deec], a
    ld [$deed], a
    ld [$deee], a
    ld hl, $def7
    ld de, $dfb4
    ld a, $03
    call Call_01c_4c09
    ld hl, $defa
    ld de, $dfb7
    ld a, $03
    call Call_01c_4c09
    ld hl, $defd
    ld de, $dfba
    ld a, $02
    call Call_01c_4c09
    ld a, $00
    ld [$dfbc], a
    ld hl, $df03
    ld de, $dfbd
    ld a, $08
    call Call_01c_4c09
    ld hl, $df0b
    ld de, $dfc5
    ld a, $30
    call Call_01c_4c09
    ret


Call_01c_4af2:
    ld a, [$df65]
    ld [$de90], a
    ld a, [$df66]
    ld [$de91], a
    ld a, [$df67]
    ld [$de94], a
    ld hl, $df68
    ld de, $de96
    ld a, $04
    call Call_01c_4c09
    ld a, [$df6c]
    ld [$de9a], a
    ld a, $01
    ld [$de9b], a
    ld hl, $df6e
    ld de, $de9d
    ld a, $04
    call Call_01c_4c09
    ld hl, $df72
    ld de, $dea1
    ld a, $04
    call Call_01c_4c09
    ld hl, $df76
    ld de, $dea5
    ld a, $08
    call Call_01c_4c09
    ld hl, $df7e
    ld de, $dead
    ld a, $08
    call Call_01c_4c09
    ld a, [$df86]
    ld [$debb], a
    ld a, [$df87]
    ld [$debc], a
    ld hl, $df88
    ld de, $debf
    ld a, $04
    call Call_01c_4c09
    ld hl, $df8c
    ld de, $dec3
    ld a, $04
    call Call_01c_4c09
    ld hl, $df90
    ld de, $dec7
    ld a, $04
    call Call_01c_4c09
    ld hl, $df94
    ld de, $decb
    ld a, $04
    call Call_01c_4c09
    ld hl, $df98
    ld de, $decf
    ld a, $04
    call Call_01c_4c09
    ld hl, $df9c
    ld de, $ded3
    ld a, $04
    call Call_01c_4c09
    ld hl, $dfa0
    ld de, $ded7
    ld a, $04
    call Call_01c_4c09
    ld hl, $dfa4
    ld de, $dedb
    ld a, $04
    call Call_01c_4c09
    ld hl, $dfa8
    ld de, $dedf
    ld a, $04
    call Call_01c_4c09
    ld hl, $dfac
    ld de, $dee7
    ld a, $04
    call Call_01c_4c09
    ld hl, $dfb0
    ld de, $deef
    ld a, $04
    call Call_01c_4c09
    ld hl, $dfb4
    ld de, $def7
    ld a, $03
    call Call_01c_4c09
    ld hl, $dfb7
    ld de, $defa
    ld a, $03
    call Call_01c_4c09
    ld hl, $dfba
    ld de, $defd
    ld a, $02
    call Call_01c_4c09
    ld a, [$dfbc]
    ld [$deff], a
    ld hl, $dfbd
    ld de, $df03
    ld a, $08
    call Call_01c_4c09
    ld hl, $dfc5
    ld de, $df0b
    ld a, $30
    call Call_01c_4c09
    ret


Call_01c_4c09:
    ld c, a

jr_01c_4c0a:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_01c_4c0a

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
    jr jr_01c_4c4c

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

jr_01c_4c4c:
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
    call z, Call_000_1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $aaaa
    xor d
    call z, Call_000_2222
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
    jr z, jr_01c_4de8

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

jr_01c_4de8:
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
    jr z, jr_01c_4f5f

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

jr_01c_4f5f:
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
    jr z, jr_01c_501c

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

jr_01c_501c:
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

Call_01c_5103:
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
    adc c
    ld d, c
    sub d
    ld d, c
    sbc e
    ld d, c
    and h
    ld d, c
    xor l
    ld d, c
    or [hl]
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
    rrca
    rst $28
    ld d, c
    ld e, [hl]
    ld d, d
    ld b, [hl]
    ld d, e
    ret


    ld d, e
    rrca
    and $53
    inc c
    ld d, h
    adc c
    ld d, h
    ret


    ld d, h
    rrca
    db $dd
    ld d, h
    ld h, c
    ld d, [hl]
    pop bc
    ld d, a
    ret


    ld e, b
    rrca
    adc d
    ld e, c
    reti


    ld e, c
    ld de, $7c5a
    ld e, d
    rrca
    sub a
    ld e, d
    adc [hl]
    ld e, e
    ld b, d
    ld e, h
    cp e
    ld e, h
    rlca
    push hl
    ld e, h
    rra
    ld e, l
    ld d, [hl]
    ld e, l
    rrca
    add [hl]
    ld e, l
    adc a
    ld e, a
    sbc l
    ld h, c
    ld sp, hl
    ld h, c
    rrca
    adc [hl]
    ld h, d
    xor e
    ld h, h
    ld c, e
    ld h, [hl]
    and l
    ld h, a
    rrca
    add c
    ld l, b
    ld c, [hl]
    ld l, d
    rst $38
    ld l, e
    ld d, [hl]
    ld l, l
    rrca
    ld c, a
    ld l, [hl]
    dec sp
    ld [hl], b
    ld [hl], $73
    cp l
    ld [hl], h
    rrca
    ld c, d
    ld [hl], l
    dec e
    halt
    jp nz, $0976

    ld [hl], a
    rrca
    ld h, b
    ld [hl], a
    ld b, e
    ld a, c
    or h
    ld a, d
    ld c, d
    ld a, e
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
    ret nc

    ld b, $ea
    add hl, bc
    db $eb
    dec d
    db $d3
    push hl
    ld b, b
    and $70
    and l
    sbc c
    reti


    sub a
    ld [hl], e
    sub e
    and e
    pop bc
    sbc c
    reti


    sub a
    and $5d
    and e
    and $5c
    jp Jump_000_00e5


    and $b0
    inc de
    ld sp, $c3d8
    pushx @ + $7be6
    ld de, $4131
    and $b0
    ld h, e
    ld [hl], c
    and $b6
    ld b, e
    and $8c
    ld h, c
    ld [hl], c
    and $9b
    sub c
    and $90
    xor a
    pushx @ + $80e5
    and $50
    ret nc

    ld bc, $8272
    sub d
    and d
    ret nc

    ld b, $01
    db $dd
    ret nc

    ld b, $ea
    rlca
    db $eb
    rrca
    jp nc, $c0e5

    and $c7
    ld [hl], a
    pushx @ + $d817
    ld [hl], a
    pushx @ + $d817
    ld h, a
    rst $00
    ld h, a
    rst $00
    ld [hl], a
    pushx @ + $d817
    ld [hl], a
    pushx @ + $d817
    ld h, a
    rst $00
    ld h, a
    rst $00
    sbc $ff
    ret nc

    ld b, $d3
    push hl
    ld b, b
    and $70
    ld d, l
    ld c, c
    reti


    ld b, a
    inc hl
    ld b, e
    ld d, e
    ld [hl], c

jr_01c_526d:
    ld c, c
    reti


    ld b, a
    ld d, e
    ld [hl], e
    ret nc

    ld b, $d4
    push hl
    ld b, b

jr_01c_5277:
    and $64
    db $10
    ld b, b
    add b
    ret nz

    pushx @ + $d830
    ret nz

    add b
    ld b, b
    db $10
    ld b, b
    add b
    ret nz

    pushx @ + $d830
    ret nz

    add b
    ld b, b
    ld b, b
    ld [hl], b
    or b
    pushx @ + $6030
    jr nc, jr_01c_526d

    or b
    ld [hl], b
    ld b, b
    ld [hl], b
    or b
    pushx @ + $6030
    jr nc, jr_01c_5277

    or b
    ld [hl], b
    pushx @ + $40a0
    ret c

    ld [hl], b
    ret c

    ld h, b
    pushx @ + $d770
    ld b, b
    and b
    ld b, b
    and b
    ld b, b
    ret c

    ld [hl], b
    ret c

    ld h, b
    pushx @ + $d770
    ld b, b
    and b
    ld b, b
    ret c

    push hl
    add b
    and $50
    ret nc

    ld bc, $42a2
    ld [hl], d
    pushx @ + $d0a2
    ld b, $01
    db $dd
    ret nc

    ld bc, $40e5
    call nc, Call_000_08e8
    rst $18
    ld a, [bc]
    and $67
    jp $20e6


    pop bc
    and $67
    call nz, $20e6
    add $e0
    and $67
    jp $20e6


    pop bc
    and $67
    call nz, $20e6
    ret nz

    rst $18
    ld a, [bc]
    and $67
    or e
    and $20
    or c
    and $67
    or h
    and $20
    or [hl]
    ldh [$e6], a
    ld h, a
    or e
    and $20
    or c
    and $67
    or h
    and $20
    or b
    rst $18
    inc b
    and $67
    jp $20e6


    pop bc
    and $67
    call nz, $20e6
    add $e0
    rst $18
    dec b
    and $67
    jp $20e6


    pop bc
    and $67
    call nz, $20e6
    add $e0
    and $67
    jp $20e6


    pop bc
    ret nc

    ld b, $e6
    ld b, [hl]
    jp Jump_01c_65e6


    or c
    ret nc

    ld bc, $0adf
    and $67
    or e
    and $20
    or c
    and $67
    or h
    and $20
    or [hl]
    ldh [$de], a
    rst $38
    ret nc

    ld b, $e8
    rlca
    rst $20
    ld [bc], a
    jp hl


    ld h, b
    and $20
    pop de
    and c
    and c
    and c
    sub c
    sub c
    sub c
    sub c
    sub c
    sub c
    sub c
    sub c
    sub c
    ld [hl], c
    ld [hl], c
    sub c
    sub c
    and c
    and c
    pop bc
    sub c
    sub c
    sub c
    sub c
    sub c
    sub c
    sub c
    sub c
    sub c
    and c
    and c
    pop bc
    pop bc
    pushx @ + $08df
    ld de, $dfe0
    ld [$e041], sp
    rst $18
    ld [$e061], sp
    add sp, $08
    ret nc

    ld bc, $4232
    ld d, d
    ld h, d
    ret nc

    ld b, $e9
    ld h, b
    and $60
    ld h, c
    db $dd
    ret nc

    ld b, $d1
    add sp, $07
    jp hl


    ld h, b
    and $20
    ld sp, $3131
    ld sp, $3131
    rst $18
    ld [$e031], sp
    ld sp, $2131
    ld hl, $2121
    ld hl, $df21
    ld [$e021], sp
    ld hl, $3121
    ld sp, $3131
    ld sp, $df31
    ld [$e031], sp
    ld sp, $2131
    ld hl, $2121
    ld hl, $df21
    ld [$e021], sp
    ld hl, $de21
    rst $38
    ret nc

    ld b, $d1
    rst $18
    inc e
    db $10
    ld [hl], b
    ld [hl], b
    ld [hl], b
    ldh [$a1], a
    ld bc, $dfdd
    inc bc
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    ldh [$df], a
    dec e
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    ldh [$de], a
    rst $38
    db $dd
    ret nc

    ld b, $ea
    rlca
    db $eb
    rrca
    jp nc, $c0e5

    and $c7
    ld [hl], a
    pushx @ + $d817
    ld [hl], a
    pushx @ + $d817
    ld h, a
    rst $00
    ld h, a
    rst $00
    ld [hl], a
    pushx @ + $d817
    ld [hl], a
    pushx @ + $d817
    ld h, a
    rst $00
    ld h, a
    rst $00
    sbc $ff
    db $dd
    ret nc

    ld bc, $40e5
    add sp, $08
    call nc, Call_000_0adf
    and $67
    jp $20e6


    pop bc
    and $67
    call nz, $20e6
    add $e0
    and $67
    jp $20e6


    pop bc
    and $67
    call nz, $20e6
    ret nz

    rst $18
    ld a, [bc]
    and $67
    or e
    and $20
    or c
    and $67
    or h
    and $20
    or [hl]
    ldh [$e6], a
    ld h, a
    or e
    and $20
    or c
    and $67
    or h
    and $20
    or b
    rst $18
    inc b
    and $67
    jp $20e6


    pop bc
    and $67
    call nz, $20e6
    add $e0
    rst $18
    dec b
    and $67
    jp $20e6


    pop bc
    and $67
    call nz, $20e6
    add $e0
    and $67
    jp $20e6


    pop bc
    ret nc

    ld b, $e6
    ld b, [hl]
    jp Jump_01c_65e6


    or c
    ret nc

    ld bc, $0adf
    and $67
    or e
    and $20
    or c
    and $67
    or h
    and $20
    or [hl]
    ldh [$de], a
    rst $38
    ret nc

    ld b, $e8
    rlca
    rst $20
    ld [bc], a
    jp hl


    ld h, b
    and $20
    pop de
    db $dd
    ret nc

    ld b, $31
    ld sp, $3131
    ld sp, $df31
    ld [$e031], sp
    ld sp, $2131
    ld hl, $2121
    ld hl, $df21
    ld [$e021], sp
    ld hl, $3121
    ld sp, $3131
    ld sp, $df31
    ld [$e031], sp
    ld sp, $2131
    ld hl, $2121
    ld hl, $df21
    ld [$e021], sp
    ld hl, $de21
    rst $38
    ret nc

    ld b, $d1
    db $dd
    rst $18
    inc bc
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    ldh [$df], a
    dec e
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    ldh [$de], a
    rst $38
    ret nc

    ld [$06ea], sp
    db $eb
    ld bc, $e5d4
    add b
    add sp, $08
    and $70
    ld hl, $60e6
    daa
    and $50
    ld hl, $47e6
    inc hl
    and $10
    ld hl, $90e6
    add sp, $07
    ld hl, $2121
    and $20
    add sp, $08
    inc h
    and $10
    add sp, $08
    ld [hl+], a
    ret nc

    ld [$0cea], sp
    db $eb
    ld bc, $c0e5
    and $a7
    add sp, $08
    jp nc, $df01

    inc b
    and $a7
    add c
    pushx @ + $e631
    jr nc, jr_01c_5551

    ret c

    ldh [$d0], a
    ld [bc], a
    push hl
    ld b, b
    and $50
    pop de
    db $e4
    rst $38
    rra
    or a
    pushx @ + $d817
    ret nc

    ld [$00e4], sp
    ld [$eb0c], a
    ld bc, $c0e5
    and $a7
    add sp, $08
    jp nc, $04df

    and $a7
    pop bc
    pushx @ + $e671
    jr nc, @+$73

    ret c

    ldh [$d0], a
    ld [bc], a
    push hl
    ld b, b
    and $50

jr_01c_5551:
    pop de
    db $e4
    rst $38
    ld e, e
    pushx @ + $70e6
    scf
    ld d, e
    ret c

    ret nc

    ld [$0cea], sp
    db $eb
    ld bc, $c0e5
    and $a7
    add sp, $08
    jp nc, $df01

    inc b
    and $a7
    add c
    pushx @ + $e631
    jr nc, jr_01c_55a4

    ret c

    ldh [$d0], a
    ld [bc], a
    push hl
    ld b, b
    and $50
    pop de
    db $e4
    rst $38
    rra
    or a
    pushx @ + $d817
    ret nc

    ld [$00e4], sp
    ld [$eb0c], a
    ld bc, $c0e5
    and $a7
    add sp, $08
    jp nc, $04df

    and $a7
    pop bc
    pushx @ + $e671
    jr nc, jr_01c_560d

    ret c

    ldh [$d0], a
    ld [$40e5], sp
    and $30

jr_01c_55a4:
    jp nc, $ffe4

    nop
    ld b, c
    ret c

    or c
    ld h, b
    ret nc

    ld [$00e4], sp
    ld [$eb0e], a
    ld bc, $e5d2
    add b
    and $97
    and $96
    and c
    pop bc
    pushx @ + $e611
    sub a
    jp Jump_000_13d7


    ret c

    jp $c3a3


    pushx @ + $96e6
    ld de, $c1d8
    and c
    and $90
    ld d, e
    and $97
    ld d, a
    and $96
    and c
    and $90
    inc sp
    and $97
    add hl, sp
    and $96
    ld de, $90e6
    inc sp
    and $97
    add hl, sp
    and $96
    add c
    and $90
    inc de
    and $97
    rla
    ret c

    and $96
    and c
    pushx @ + $d811
    and $97
    or e
    and e
    pushx @ + $e665
    sub b
    ld d, e
    and $97
    ld d, a
    and $96
    ld sp, $e651
    db $10
    ld d, e
    ret c

    and $96

jr_01c_560d:
    and c
    pop bc
    pushx @ + $e611
    sub a
    jp Jump_000_13d7


    ret c

    jp $c3a3


    pushx @ + $96e6
    ld de, $c1d8
    and c
    and $90
    ld d, e
    and $97
    ld d, l
    and $96
    and c
    and $20
    and c
    pushx @ + $90e6
    inc sp
    and $97
    scf
    and $96
    ld de, $e631
    sub a
    ld d, e
    inc de
    ret c

    and l
    and $96
    ld h, c
    ld d, c
    and $10
    ld d, e
    ret c

    and $97
    ld d, l
    pushx @ + $96e6
    ld h, c
    or c
    pushx @ + $e631
    db $10
    inc sp
    ld [$eb00], a
    ld bc, $60e6
    ld d, l
    and $50
    ld d, l
    and $47
    ld d, a
    rst $38
    ret nc

    ld [$80e5], sp
    db $d3
    add sp, $08
    and $70
    ld h, a
    and $60
    ld h, c
    and $50
    ld h, c
    and $47
    ld h, e
    and $10
    ld h, c
    and $96
    add sp, $07
    ld h, c
    ld h, c
    ld h, c
    and $20
    add sp, $08
    ld h, h
    and $10
    add sp, $08
    ld h, d
    push hl
    nop
    and $94
    jp nc, $df01

    inc b
    and $94
    ld b, c
    or c
    and $30
    or c
    ldh [$e5], a
    ld b, b
    and $80
    pop de
    db $e4
    db $fc
    ld de, $d7b1
    ld de, $51d8
    push hl
    nop
    and $94
    jp nc, Jump_000_00e4

    rst $18
    inc b
    and $94
    add c
    pushx @ + $e631
    jr nc, jr_01c_56e7

    ret c

    ldh [$e5], a
    ld b, b
    and $80
    pop de
    db $e4
    db $fd
    ld d, c
    pushx @ + $70e6
    ld sp, $d851
    db $d3
    push hl
    add b
    and $95
    db $e4
    nop
    ld de, $e5d2
    nop
    and $94
    ld b, c
    or c
    db $d3
    push hl
    add b
    and $95
    ld de, $e5d2
    nop
    and $94
    ld b, c
    or c
    jp nc, $80e5

    and $95

jr_01c_56e7:
    or c
    jp nc, Jump_000_00e5

    and $94
    ld b, c
    or c
    jp nc, $80e5

    and $95
    ld h, c
    jp nc, Jump_000_00e5

    and $94
    ld b, c
    or c
    db $d3
    push hl
    nop
    and $a3
    ld de, $11d8
    or c
    pushx @ + $d311
    push hl
    add b
    and $95
    ld d, c
    jp nc, Jump_000_00e5

    and $94
    add c
    pushx @ + $d331
    push hl
    add b
    and $95
    ld d, c
    jp nc, Jump_000_00e5

    and $94
    add c
    pushx @ + $d331
    push hl
    add b
    and $95
    ld sp, $e5d2
    nop
    and $94
    add c
    pushx @ + $d231
    push hl
    add b
    and $95
    ld d, c
    jp nc, Jump_000_00e5

    and $94
    add c
    pushx @ + $d331
    push hl
    add b
    and $a3
    ld b, c
    ret c

    or c
    ld h, c
    ld d, c
    db $d3
    push hl
    nop
    and $74
    rst $18
    inc bc
    ld d, c
    ld de, $1151
    ld d, c
    ld de, $1151
    ldh [rHDMA1], a
    ret c

    and c
    pushx @ + $d851
    and c
    pushx @ + $d851
    and c
    pushx @ + $d851
    and c
    pushx @ + $02df
    ld de, $81d8
    pushx @ + $d811
    add c
    pushx @ + $d811
    add c
    pushx @ + $d811
    add c
    pushx @ + $31e0
    ret c

    ld h, c
    pushx @ + $d831
    ld h, c
    pushx @ + $d831
    ld h, c
    ld hl, $a1d8
    pushx @ + $d821
    and c
    pushx @ + $d821
    and c
    sub c
    pop bc
    and $20
    jp Jump_01c_74e6


    db $d3
    rst $18
    inc bc
    ld d, c
    ld de, $1151
    ld d, c
    ld de, $1151
    ldh [$d8], a
    and c

jr_01c_57a7:
    ld [hl], c
    and c
    ld [hl], c
    and c
    and c
    and c
    pushx @ + $d813
    and e
    ld h, l
    ld de, $c1d8
    inc bc
    pushx @ + $6155
    or c
    pushx @ + $0331
    dec sp
    reti


    scf
    rst $38
    ret nc

    ld [$07e8], sp
    rst $20
    ld [bc], a
    jp hl


    ld h, b
    and $20
    pop de
    adc a
    jp hl


    ld h, b
    and $60
    add c
    jp hl


    jr nz, @-$18

    jr nz, jr_01c_57a7

    ld bc, $018d
    adc l
    ld bc, $018d
    ret nc

    ld [$60e9], sp
    and $60
    add e
    jp hl


    ld h, b
    and $20
    ld [hl], c
    ld hl, $08e8
    ld de, $d701
    ld de, $11d8
    or c
    pushx @ + $0111
    ret c

    ld de, $1105
    pushx @ + $d811
    ld de, $d7b1
    ld de, $51d8
    ld bc, $51d7
    ret c

    ld d, c
    pushx @ + $5131
    ld bc, $51d8
    dec b
    ld d, c
    pushx @ + $d851
    ld d, c
    pushx @ + $5131
    ret c

    ld de, $d701
    ld de, $11d8
    or c
    pushx @ + $0111
    ret c

    ld de, $1105
    pushx @ + $d811
    ld de, $d7b1
    ld de, $51d8
    ld bc, $51d7
    ret c

    ld d, c
    pushx @ + $5131
    ld bc, $51d8
    dec b
    pushx @ + $4151
    ret c

    or c
    ld h, c
    ld d, c
    and c
    ld bc, $01a1
    and c
    ld d, c
    and c
    ld d, c
    sub c
    ld bc, $0191
    sub c
    ld d, c
    sub c
    ld d, c
    add c
    ld bc, $0181
    add c
    ld d, c
    add c
    ld d, c
    ld [hl], c
    ld bc, $0171
    ld [hl], c
    ld sp, $3171
    ld h, c
    ld bc, $0161
    ld h, c
    ld de, $1161
    ld d, c
    ld bc, $0151
    ld d, c
    ld de, $1151
    or c
    pushx @ + $07e8
    ld h, c
    add sp, $08
    ld h, c
    ret c

    or l
    set 2, a
    add sp, $07
    ld d, c
    add sp, $08
    ld d, c
    inc bc
    pop de
    and c
    ld bc, $01a1
    and c
    ld d, c
    and c
    ld d, c
    sub c
    ld bc, $0191
    sub c
    ld d, c
    sub c
    ld d, c
    add c
    ld bc, $0181
    add c
    ld d, c
    add c
    ld d, c
    ld [hl], c
    ld bc, $0171
    ld [hl], c
    ld sp, $3171
    ld h, c
    ld bc, $0161
    ld h, c
    ld de, $1161
    inc bc
    ld d, l
    ld h, c
    or c
    pushx @ + $d831
    inc bc
    add sp, $08
    jp hl


    jr nz, @-$18

    jr nz, @+$59

    jp hl


    ld b, b
    and $40
    ld e, c
    jp hl


    ld h, b
    and $60
    ld d, c
    rst $38
    ret nc

    ld [$dfd1], sp
    inc b
    db $10
    ld [hl], b
    ld [hl], b
    ld [hl], b
    ldh [$91], a
    ld sp, $3131
    ld [hl], c
    pushx @ + $d815
    ld de, $4171
    ld de, $4111
    ld [hl], c
    ld de, $1171
    ld b, c
    ld de, $7111
    ld b, c
    ld de, $7111
    ld b, c
    ld de, $4111
    ld [hl], c
    ld de, $1171
    ld b, c
    ld de, $1010
    ld de, $1141
    ld de, $4171
    ld de, $4111
    ld [hl], c
    ld de, $1171
    ld b, c
    ld de, $1111
    ld b, c
    ld [hl], c
    ld de, $4171
    ld de, $4111
    ld [hl], c
    ld de, $1171
    ld b, c
    ld de, $1010
    ld de, $3031
    jr nc, @-$1f

    ld [bc], a
    ld de, $1171
    ld [hl], c
    ld de, $3111
    ld [hl], c
    ldh [rNR11], a

jr_01c_592a:
    ld [hl], c
    ld de, $1171
    ld de, $1131
    rst $18
    ld [bc], a
    ld [hl], c
    ld [hl], c
    ld de, $1171
    ld de, $1131
    ldh [$71], a
    ld [hl], c
    ld de, $7171
    ld de, $1131
    ld [hl], c
    ld de, $1171
    ld [hl], c
    ld [hl], c
    ld sp, $1171
    ld [hl], c
    ld de, $1171
    ret nc

    ld bc, $371e
    scf
    ccf
    reti


    jr nc, jr_01c_592a

    ld [$02df], sp
    ld de, $1171
    ld [hl], c
    ld de, $3111
    ld [hl], c
    ldh [rNR11], a
    ld [hl], c
    ld de, $1171
    ld de, $1131
    ld [hl], c
    ld [hl], c
    ld de, $1171
    ld de, $9131
    ld [hl], c
    sub c
    ld de, $1191
    ld de, $3131
    sub e
    pushx @ + $d813
    ld de, $3131
    ld sp, $d793
    rla
    rst $38
    db $dd
    ret nc

    add hl, bc
    ld [$eb03], a
    dec bc
    jp nc, $c0e5

    and $77
    rst $18
    ld [bc], a
    jp $d7b1


    inc hl
    inc sp
    ret c

    jp $d7b1


    inc hl
    inc sp
    ret c

    ldh [$df], a
    ld [bc], a
    and e
    sub c
    jp Jump_000_13d7


    ret c

    and e
    sub c
    jp Jump_000_13d7


    ret c

    ldh [$d7], a
    push hl
    add b
    and $a4
    db $eb
    rlca
    rst $18
    inc b
    ld sp, $b1d8
    pushx @ + $5121
    ld de, $2161
    ldh [$df], a
    inc b
    ld de, $91d8
    pop bc
    pushx @ + $d831
    or c
    pushx @ + $d841
    pop bc
    pushx @ + $dee0
    rst $38
    db $dd
    ret nc

    add hl, bc
    pop de
    push hl
    ret nz

    and $d7
    rst $18
    ld [bc], a
    ld d, e
    ld b, c
    ld [hl], e
    add e
    ld d, e
    ld b, c
    ld [hl], e
    add e
    ldh [$df], a

jr_01c_59ed:
    ld [bc], a
    inc sp
    ld hl, $6353
    inc sp
    ld hl, $6353
    ldh [$e6], a
    pushx @ + $02df
    add e
    ld [hl], c
    and e
    or e

jr_01c_59ff:
    add e
    ld [hl], c
    and e
    or e
    ldh [$df], a
    ld [bc], a
    ld h, e
    ld d, c
    add e
    sub e
    ld h, e
    ld d, c
    add e
    sub e
    ldh [$de], a
    rst $38
    db $dd
    ret nc

    add hl, bc
    rst $20
    ld b, $e9
    jr nz, jr_01c_59ff

    jr nz, jr_01c_59ed

    add sp, $08
    rst $18
    ld [bc], a
    add e
    ld [hl], c
    and e
    or e
    add e
    ld [hl], c
    and e
    or e
    ldh [$df], a
    ld [bc], a
    ld h, e
    ld d, c
    add e
    sub e
    ld h, e
    ld d, c
    add e
    sub e
    ldh [$e7], a
    nop
    jp hl


    ld b, b
    and $20
    call nc, Call_000_02e8
    rst $18
    ld [bc], a
    add c
    ret c

    add c
    pushx @ + $d871
    and c
    pushx @ + $d8a1
    or c
    pushx @ + $d8b1
    add c
    pushx @ + $d881
    ld [hl], c
    pushx @ + $d8a1
    and c
    pushx @ + $d8b1
    or c
    pushx @ + $dfe0
    ld [bc], a
    ld h, c
    ret c

    ld h, c
    pushx @ + $d851
    add c
    pushx @ + $d881
    sub c
    pushx @ + $d891

jr_01c_5a6b:
    ld h, c
    pushx @ + $d861
    ld d, c
    pushx @ + $d881
    add c
    pushx @ + $d891
    sub c
    pushx @ + $dee0
    rst $38
    db $dd
    ret nc

    add hl, bc
    pop de
    rst $18
    ld [$1111], sp
    ld [hl], e
    ld [hl], e
    ld [hl], c
    ld de, $7111
    ld [hl], b
    pushx @ + $d830
    ld bc, $d770
    jr nc, jr_01c_5a6b

    ld bc, $dee0
    rst $38
    db $dd
    ret nc

    rrca
    ld [$eb06], a
    dec bc
    db $d3
    push hl

jr_01c_5aa0:
    add b
    and $75
    rst $18
    inc b
    and $74
    ld d, b
    and $65
    ld d, b
    pushx @ + $74e6
    ld d, b
    and $65
    ld d, b
    and $74
    ld b, b
    and $65
    ld b, b
    ret c

    and $74
    ld d, b
    and $65
    ld d, b
    ldh [$df], a
    inc b
    and $74
    jr nz, @-$18

    ld h, l
    jr nz, jr_01c_5aa0

    and $74
    jr nz, @-$18

    ld h, l
    jr nz, @-$18

    ld [hl], h
    db $10
    and $65
    db $10
    ret c

    and $74
    jr nz, @-$18

    ld h, l
    jr nz, @-$1e

    ret c

    rst $18
    inc b
    and $74
    and b
    and $65
    and b
    pushx @ + $74e6
    and b
    and $65
    and b
    and $74
    sub b
    and $65
    sub b
    ret c

    and $74
    and b
    and $65
    and b
    ldh [$df], a
    inc b
    and $74
    ld [hl], b
    and $65
    ld [hl], b
    pushx @ + $74e6
    ld [hl], b
    and $65
    ld [hl], b
    and $74
    ld h, b
    and $65
    ld h, b
    ret c

    and $74
    ld [hl], b
    and $65
    ld [hl], b
    ldh [$df], a
    inc b
    and $74
    ret nz

    and $65
    ret nz

    pushx @ + $74e6
    ret nz

    and $65
    ret nz

    and $74
    or b
    and $65
    or b
    ret c

    and $74
    ret nz

    and $65
    ret nz

    ldh [$df], a
    inc b
    and $74
    sub b
    and $65
    sub b
    pushx @ + $74e6
    sub b
    and $65
    sub b
    and $74
    add b
    and $65
    add b
    ret c

    and $74
    sub b
    and $65
    sub b
    ldh [$df], a
    inc b
    and $74
    ld d, b
    and $65
    ld d, b
    pushx @ + $74e6
    ld d, b
    and $65
    ld d, b
    and $74
    ld b, b
    and $65
    ld b, b
    ret c

    and $74
    ld d, b
    and $65
    ld d, b
    ldh [$df], a
    inc b
    and $74
    jr nz, @-$18

    ld h, l
    jr nz, @-$27

    and $74
    jr nz, @-$18

    ld h, l
    jr nz, @-$18

    ld [hl], h
    db $10
    and $65
    db $10
    ret c

    and $74
    jr nz, @-$18

    ld h, l
    jr nz, @-$1e

    sbc $ff
    db $dd
    ret nc

    rrca
    jp nc, $80e5

    and $70
    and $70
    rst $00
    and $60
    pop bc
    and $50
    pop bc
    and $40
    pop bc
    and $30
    pop bc
    and $70
    ld d, a
    and $60
    ld d, c
    and $50
    ld d, c
    and $40
    ld d, c
    and $30
    ld d, c
    and $70
    sub a
    and $60
    sub c
    and $50
    sub c
    and $40
    sub c
    and $30
    sub c
    and $70
    daa
    and $60
    ld hl, $50e6
    ld hl, $40e6
    ld hl, $30e6
    ld hl, $70e6
    ld d, a
    and $60
    ld d, c
    and $50
    ld d, c
    and $40
    ld d, c
    and $30
    ld d, c
    ret c

    and $70
    and a
    and $60
    and c
    and $50
    and c
    and $40
    and c
    and $30
    and c
    pushx @ + $80e6
    rla
    and $70
    ld de, $60e6
    ld de, $50e6
    ld de, $40e6
    ld de, $e6d8
    ld [hl], b
    ld [hl], a
    and $60
    ld [hl], c
    and $50
    ld [hl], c
    and $40
    ld [hl], c
    and $30
    ld [hl], c
    ret nc

    rrca
    pop de
    push hl
    add b
    and $90
    rst $18
    inc b
    pop bc
    pushx @ + $72c0
    ld d, b
    ld [hl], b
    ret c

    ldh [$df], a
    inc b
    sub c
    pushx @ + $4290
    jr nz, @+$42

    ret c

    ldh [$df], a
    inc b
    ld d, c
    pushx @ + $d850
    jp nz, $c0a0

    ldh [$df], a
    inc b
    ld hl, $20d7
    ret c

    sub d
    ld h, b
    add b
    ldh [$de], a
    rst $38
    db $dd
    ret nc

    rrca
    add sp, $08
    rst $20
    ld b, $e9
    ld h, b
    and $20
    jp nc, $06e7

    and $20
    sub a
    rst $20
    ld [$20e6], sp
    sub a
    rst $20
    ld [bc], a
    and $40
    sub a
    rst $20
    ld b, $e6
    ld b, b
    sub a
    rst $20
    ld b, $e6
    jr nz, jr_01c_5cce

    rst $20
    ld [$20e6], sp
    ld h, a
    rst $20
    ld [bc], a
    and $40
    ld h, a
    rst $20
    ld b, $e6
    ld b, b
    ld h, a
    rst $20
    ld [bc], a
    and $40
    rla
    rst $20
    ld [bc], a
    and $40
    rla
    rst $20
    ld [bc], a
    and $40
    rla
    rst $20
    ld b, $e6
    ld b, b
    rla
    ret c

    rst $20
    dec b
    and $40
    or a
    rst $20
    dec b
    and $40
    or a
    rst $20
    dec b
    and $40
    or a
    rst $20
    ld b, $e6
    ld b, b
    or a
    ret nc

    rrca
    add sp, $08
    rst $20
    ld [bc], a
    jp hl


    ld h, b
    and $40
    db $d3
    ld [hl], a
    ld b, a
    ret c

    trap $d7
    ld b, a
    rla
    ret c

    sbc a
    rst $00
    add a
    ld e, a
    add a
    ld h, a
    cpl
    sbc $ff
    ret nc

    rrca
    pop de
    add sp, $08
    db $dd
    rst $18
    jr nz, @-$6d

    pushx @ + $d831
    ldh [$df], a
    rlca
    sub c
    ld [hl], b
    ld [hl], b
    sub c

jr_01c_5cce:
    ld [hl], b
    ld [hl], b
    sub c
    ld [hl], b
    ld [hl], b
    sub c
    ld [hl], b
    ld [hl], b
    ldh [$91], a
    ld [hl], b
    ld [hl], b
    sub c
    ld [hl], b
    ld [hl], b
    sub c
    ld [hl], b
    ld [hl], b
    ld [hl], b
    ld [hl], b
    sub c
    sbc $ff
    db $dd
    ret nc

    ld c, $ea
    dec b
    db $eb
    rlca
    db $d3
    push hl
    ld b, b
    db $e4
    ld bc, $02df
    and $75
    and c
    pushx @ + $e631
    ld h, l
    sub c
    and $75
    ld [hl], c
    ld sp, $91d8
    pushx @ + $e631
    ld h, l
    sub c
    and $75
    ld [hl], c
    ld sp, $e0d8
    rst $18
    ld [bc], a
    add c
    pushx @ + $7111
    ld d, c
    ld de, $71d8
    pushx @ + $7111
    ld d, c
    ld de, $e0d8
    sbc $ff
    ret nc

    ld c, $00
    db $dd
    db $d3
    push hl
    add b
    db $e4
    rst $38
    rst $18
    ld [bc], a
    and $40
    and c
    pushx @ + $e631
    jr nc, @-$6d

    and $40
    ld [hl], c
    ld sp, $91d8
    pushx @ + $e631
    jr nc, jr_01c_5cce

    and $40
    ld [hl], c
    ld sp, $e0d8
    rst $18
    ld [bc], a
    add c
    pushx @ + $7111
    ld d, c
    ld de, $71d8
    pushx @ + $7111
    ld d, c
    ld de, $e0d8
    sbc $ff
    db $dd
    ret nc

    ld c, $e7
    ld [bc], a
    jp hl


    ld b, b
    pop de
    add sp, $08
    rst $20
    ld [bc], a
    and $20
    add hl, sp
    rst $20
    ld [$e739], sp
    ld [bc], a
    and $40
    add hl, sp
    rst $20
    ld [$40e6], sp
    add hl, sp
    rst $20
    ld [bc], a
    and $20
    add hl, de
    rst $20
    ld [$e719], sp
    ld [bc], a
    and $40
    add hl, de
    rst $20
    ld [$40e6], sp
    add hl, de
    sbc $ff
    db $dd
    ret nc

    rlca
    db $d3
    push hl
    ld b, b
    and $87
    and c
    ld d, c
    and c
    pop bc
    ld d, c
    pop bc
    pushx @ + $d811
    ld d, c
    pushx @ + $3111
    ret c

    ld d, c
    pushx @ + $5331
    ld de, $a1d8
    ld [hl], c
    ld hl, $9171
    ld hl, $a191
    ld hl, $c1a1
    ld hl, $d7c1
    inc hl
    ret c

    and c
    ld [hl], c
    ld b, c
    ret c

    or c
    pushx @ + $6141
    ret c

    or c
    pushx @ + $7161
    ret c

    or c
    pushx @ + $9171
    ret c

    or c
    pushx @ + $b391
    ld [hl], c
    ld b, c
    ld de, $81d8
    pushx @ + $3111
    ret c

    add c
    pushx @ + $4131
    ret c

    add c
    pushx @ + $6141
    ret c

    add c
    pushx @ + $8161
    ld [hl], c
    ld b, c
    ld d, c
    db $d3
    and $87
    and c
    and $a7
    ld d, c
    and $87
    and c
    pop bc
    and $a7
    ld d, c
    and $87
    pop bc
    pushx @ + $d811
    and $a7
    ld d, c
    pushx @ + $87e6
    ld de, $d831
    and $a7
    ld d, c
    pushx @ + $87e6
    ld sp, $1153
    ret c

    and c
    and $87
    ld [hl], c
    and $a7
    ld hl, $87e6
    ld [hl], c
    sub c
    and $a7
    ld hl, $87e6
    sub c
    and c
    and $a7
    ld hl, $87e6
    and c
    pop bc
    and $a7
    ld hl, $87e6
    pop bc
    pushx @ + $d823
    and c
    ld [hl], c
    and $87
    ld b, c
    ret c

    and $a7
    or c
    pushx @ + $87e6
    ld b, c
    ld h, c
    ret c

    and $a7
    or c
    pushx @ + $87e6
    ld h, c
    ld [hl], c
    ret c

    and $a7
    or c
    pushx @ + $87e6
    ld [hl], c
    sub c
    ret c

    and $a7
    or c
    pushx @ + $87e6
    sub c
    or e
    ld [hl], c
    ld b, c
    and $87
    ld de, $e6d8
    and a
    add c
    pushx @ + $87e6
    ld de, $d831
    and $a7
    add c
    pushx @ + $87e6
    ld sp, $d841
    and $a7
    add c
    pushx @ + $87e6
    ld b, c
    ld h, c
    ret c

    and $a7
    add c
    pushx @ + $87e6
    ld h, c
    add c
    ld [hl], c
    ld b, c
    ld d, c
    db $d3
    push hl
    ld b, b
    and $75
    and c
    and $20
    and c
    and $75
    and c
    and $75
    sub c
    and $20
    sub c
    and $75
    ld d, c
    ret c

    and c
    pushx @ + $75e6
    and c
    and $20
    and c
    and $75
    sub c
    ld d, c
    ret c

    and c
    pushx @ + $75e6
    ld h, c
    and $20
    ld h, c
    and $75
    ld h, c
    and $75
    ld d, c
    and $20
    ld d, c
    and $75
    ld de, $61d8
    pushx @ + $75e6
    ld h, c
    and $20
    ld h, c
    and $75
    ld d, c
    ld de, $61d8
    pushx @ + $75e6
    ld sp, $20e6
    ld sp, $75e6
    ld sp, $75e6
    ld hl, $20e6
    ld hl, $75e6
    ret c

    and c
    ld sp, $e6d7
    ld [hl], l
    ld sp, $20e6
    ld sp, $75e6
    ld hl, $a1d8
    ld sp, $e6d7
    ld [hl], l
    ld sp, $20e6
    ld sp, $75e6
    ld sp, $75e6
    ld hl, $20e6

jr_01c_5ef8:
    ld hl, $75e6
    ret c

    and c
    ld sp, $e6d7

jr_01c_5f00:
    ld [hl], l
    ld sp, $20e6

jr_01c_5f04:
    ld sp, $75e6
    ld hl, $a1d8

jr_01c_5f0a:
    ld sp, $c0e5
    and $54
    push de

jr_01c_5f10:
    add sp, $08
    ld d, b
    ret c

    and b
    sub b

jr_01c_5f16:
    and b
    pushx @ + $d850

jr_01c_5f1a:
    and b
    pushx @ + $d840
    and b
    pushx @ + $d820

jr_01c_5f22:
    and b
    pushx @ + $d840

jr_01c_5f26:
    and b
    pushx @ + $d850
    and b
    sub b
    and b
    pushx @ + $d850
    and b
    pushx @ + $d840
    and b
    pushx @ + $d820
    and b
    pushx @ + $d840
    and b
    pushx @ + $d810
    ld h, b
    ld d, b
    ld h, b
    pushx @ + $d810
    ld h, b
    ret nz

    ld h, b
    and b
    ld h, b
    ret nz

    ld h, b
    pushx @ + $d810
    ld h, b
    ld d, b
    ld h, b
    pushx @ + $d810
    ld h, b
    ret nz

    ld h, b
    and b
    ld h, b
    ret nz

    ld h, b
    and b
    jr nc, jr_01c_5f80

    jr nc, @-$5e

    jr nc, @-$6e

    jr nc, jr_01c_5fd6

    jr nc, jr_01c_5ef8

    jr nc, jr_01c_5f0a

    jr nc, jr_01c_5f8c

jr_01c_5f6c:
    jr nc, @-$5e

    jr nc, jr_01c_5f00

    jr nc, jr_01c_5fe2

    jr nc, jr_01c_5f04

    jr nc, jr_01c_5f16

    jr nc, @+$22

    jr nc, jr_01c_5f1a

    jr nc, @-$6e

    jr nc, jr_01c_5fee

    jr nc, jr_01c_5f10

jr_01c_5f80:
    jr nc, jr_01c_5f22

    jr nc, jr_01c_5fa4

    jr nc, jr_01c_5f26

    jr nc, @-$6e

    jr nc, jr_01c_5ffa

    jr nc, @-$6e

jr_01c_5f8c:
    jr nc, jr_01c_5f6c

    rst $38
    db $dd
    ret nc

    rlca
    push hl
    add b
    and $37
    call nc, Call_000_08e8
    db $e4
    cp $d0
    ld [bc], a
    xor c
    ret nc

    rlca
    ld d, c
    and c
    pop bc
    ld d, c

jr_01c_5fa4:
    pop bc
    pushx @ + $d811
    ld d, c
    pushx @ + $3111
    ret c

    ld d, c
    pushx @ + $5331
    ld de, $a1d8
    ld [hl], c
    ld hl, $9171
    ld hl, $a191
    ld hl, $c1a1
    ld hl, $d7c1
    inc hl
    ret c

    and c
    ld [hl], c
    ld b, c
    ret c

    or c
    pushx @ + $6141
    ret c

    or c
    pushx @ + $7161
    ret c

    or c
    pushx @ + $9171
    ret c

jr_01c_5fd6:
    or c
    pushx @ + $b391
    ld [hl], c
    ld b, c
    ld de, $81d8
    pushx @ + $3111

jr_01c_5fe2:
    ret c

    add c
    pushx @ + $4131
    ret c

    add c
    pushx @ + $6141
    ret c

    add c

jr_01c_5fee:
    pushx @ + $8161
    ld [hl], c
    ld b, c
    ret nc

    ld [bc], a
    ld d, e
    ret nc

    rlca
    db $d3
    push hl

jr_01c_5ffa:
    ld b, b
    add sp, $08
    db $e4
    rst $38
    and $86
    ld de, $e6d8
    and [hl]
    and c
    pushx @ + $86e6
    ld de, $d831
    and $a6
    and c
    pushx @ + $86e6
    ld sp, $d851
    and $a6
    and c
    pushx @ + $86e6
    ld d, c
    ld h, c
    ret c

    and $a6
    and c
    pushx @ + $86e6
    ld h, c
    add e
    ld d, c
    ret c

    and c
    and $86
    and c
    and $a6
    ld [hl], c
    and $86
    and c
    pop bc
    and $a6
    ld [hl], c
    and $86
    pop bc
    pushx @ + $d821
    and $a6
    ld [hl], c
    pushx @ + $86e6
    ld hl, $d831
    and $a6
    ld [hl], c
    pushx @ + $86e6
    ld sp, $2153
    ret c

    ld [hl], c
    and $86
    ld [hl], c
    and $a6
    ld b, c
    and $86
    ld [hl], c
    sub c
    and $a6
    ld b, c
    and $86
    sub c
    or c
    and $a6
    ld b, c
    and $86
    or c
    pop bc
    and $a6
    ld b, c
    and $86
    pop bc
    pushx @ + $d823
    or c
    ld b, c
    and $86
    ld b, c
    and $a6
    ld de, $86e6
    ld b, c
    ld h, c
    and $a6
    ld de, $86e6
    ld h, c
    add c
    and $a6
    ld de, $86e6
    add c
    sub c
    and $a6
    ld de, $86e6
    sub c
    pop bc
    or c
    ld [hl], c
    add c
    jp nc, Jump_000_00e5

    add sp, $08
    db $e4
    rst $38
    and $76
    and c
    and $20
    and c
    and $76
    and c
    sub c
    and $20
    sub c
    and $76
    ld d, c
    ret c

    and c
    pushx @ + $e6a1
    jr nz, @-$5d

    and $76
    sub c
    ld d, c
    ret c

    and c
    pushx @ + $e661
    jr nz, jr_01c_611f

    and $76
    ld h, c
    ld d, c
    and $20
    ld d, c
    and $76
    ld de, $61d8
    pushx @ + $e661
    jr nz, @+$63

    and $76
    ld d, c
    ld de, $61d8
    pushx @ + $e631
    jr nz, @+$33

    and $76
    ld sp, $e621
    jr nz, @+$23

    ret c

    and $76
    and c
    ld sp, $31d7
    and $20
    ld sp, $76e6
    ld hl, $a1d8
    ld sp, $31d7
    and $20
    ld sp, $76e6
    ld sp, $e621
    jr nz, @+$23

    ret c

    and $76
    and c
    ld sp, $31d7
    and $20
    ld sp, $76e6
    ld hl, $a1d8
    ld sp, $07d0
    jp nc, $80e5

    db $e4
    rst $38
    and $a5
    and c
    and $30
    and c
    and $a5
    and c
    and $a5

jr_01c_611f:
    sub c
    and $30
    sub c
    and $a5
    ld d, c
    ret c

    and c
    pushx @ + $a5e6
    and c
    and $30
    and c
    and $a5
    sub c
    ld d, c
    ret c

    and c
    pushx @ + $a5e6
    ld h, c
    and $30
    ld h, c
    and $a5
    ld h, c
    and $a5
    ld d, c
    and $30
    ld d, c
    and $a5
    ld de, $61d8
    pushx @ + $a5e6
    ld h, c
    and $30
    ld h, c
    and $a5
    ld d, c
    ld de, $61d8
    pushx @ + $a5e6
    ld sp, $30e6
    ld sp, $a5e6
    ld sp, $a5e6
    ld hl, $30e6
    ld hl, $a5e6
    ret c

    and c
    ld sp, $e6d7
    and l
    ld sp, $30e6
    ld sp, $a5e6
    ld hl, $a1d8
    ld sp, $e6d7
    and l
    ld sp, $30e6
    ld sp, $a5e6
    ld sp, $a5e6
    ld hl, $30e6
    ld hl, $a5e6
    ret c

    and c
    ld sp, $e6d7
    and l
    ld sp, $30e6
    ld sp, $a5e6
    ld hl, $a1d8
    ld sp, $ffde
    db $dd
    pop de
    rst $20
    ld [bc], a
    jp hl


    ld h, b
    and $20
    ret nc

    ld bc, $07e8
    rst $18
    ld [bc], a
    rst $18
    db $10
    xor l
    ldh [$df], a
    db $10
    ld a, l
    ldh [$df], a
    db $10
    ld c, l
    ldh [$df], a
    ld [$e01d], sp
    rst $18
    inc b
    dec e
    ldh [$5d], a
    ld c, l
    cp l
    call $dfe0
    ld [bc], a
    xor l
    dec c
    xor l
    sbc l
    dec c
    ld e, l
    xor l
    xor l
    dec c
    sbc l
    ld e, l
    xor l
    ld l, l
    dec c
    ld l, l
    ld e, l
    dec c
    dec e
    ld l, l
    ld l, l
    dec c
    ld e, l
    dec e
    ld l, l
    dec a
    dec c
    dec a
    dec l
    dec c
    xor l
    dec a
    dec a
    dec c
    dec l
    xor l
    dec a
    dec a
    dec c
    dec a
    dec l
    dec c
    xor l
    dec a
    dec a
    dec c
    dec l
    xor l
    dec a
    ldh [$de], a
    rst $38
    db $dd
    ret nc

    rlca
    pop de
    ld de, $7111
    ld bc, $0171
    ld [hl], c
    ld bc, $07df
    ld [hl], c
    ld bc, $0171
    ld [hl], c
    ld bc, $0171
    ld de, $7111
    ld bc, $0171
    ld [hl], c
    ld bc, $71e0
    ld bc, $0171
    ld [hl], c
    ld bc, $0171
    ld de, $1171
    ld de, $1131
    ld de, $7131
    ld de, $1111
    ld de, $1171
    ld de, $1131
    ld de, $7131
    ld de, $1111
    ld de, $1171
    ld de, $1131
    ld de, $7131
    ld de, $1111
    ld de, $1171
    ld de, $1131
    ld de, $7131
    ret nc

    ld bc, $363c
    ld [hl], $36
    rlca
    ret nc

    rlca
    ld de, $1171
    ld de, $1131
    ld de, $7131
    ld de, $1111
    ld de, $1171
    ld de, $1131
    ld de, $7131
    ld de, $1111
    ld de, $1171
    ld de, $1131
    ld de, $7131
    ld de, $1111
    ld de, $1171
    ld de, $1131
    ld de, $7131
    ret nc

    ld bc, $363c
    ld [hl], $36
    scf
    ret nc

    rlca
    sbc $ff
    ret nc

    inc b
    call c, $dd11
    add sp, $08
    db $d3
    push hl
    nop
    and $97
    adc e
    and $30
    add a
    inc de
    and $97
    xor e
    and $30
    and a
    inc sp
    and $97
    set 4, [hl]
    jr nc, @-$37

    ld d, e
    and $97
    pushx @ + $e61b
    jr nc, jr_01c_62cb

    ret c

    ld h, e
    and $97
    adc e
    and $30
    add a
    inc de
    and $97
    xor e
    and $30
    and a
    inc sp
    and $97
    set 4, [hl]
    jr nc, @-$37

    ld d, e

jr_01c_62cb:
    and $97
    pushx @ + $e61b
    jr nc, jr_01c_62e9

    ret c

    ld h, e
    ld [$eb0b], a
    ld bc, $e5d4
    nop
    and $80
    db $e4
    nop
    rra
    reti


    inc de
    ret c

    or c
    pushx @ + $e611
    add b
    ld h, c

jr_01c_62e9:
    and $30
    ld h, c
    and $80
    ld h, c
    and $80
    rra
    and $30
    ld de, $80e6
    rra
    reti


    inc de
    ret c

    or c
    pushx @ + $e611
    add b
    ld h, c
    and $30
    ld h, c
    and $80
    ld h, c
    and $80
    rra
    and $30
    ld de, $80e6
    rra
    reti


    inc de
    ret c

    or c
    pushx @ + $e611
    add b
    ld h, c
    and $30
    ld h, c
    and $80
    ld h, c
    and $80
    rra
    and $30
    ld de, $80e6
    ccf
    reti


    inc sp
    ld de, $ea31
    inc c
    and $80
    sub c
    and $30
    sub c
    and $80
    sub c
    ld b, c
    sub c
    ld b, c
    ret c

    and $80
    or b
    and $30
    or b
    and $80
    ld b, b
    ld b, b
    and $80
    or b
    and $30
    or b
    and $80
    pushx @ + $80e6
    ld b, b
    and $40
    ld b, b
    and $80
    and $80
    sub b
    and $40
    sub b
    and $80
    pushx @ + $80e6
    ld b, b
    and $40
    ld b, b
    and $80
    db $d3
    add sp, $08
    push hl
    nop
    and $85
    ld [$eb00], a
    ld bc, $1515
    dec d
    dec d
    ret c

    add l
    add l
    add l
    add l
    pushx @ + $3535
    dec [hl]
    dec [hl]
    ret c

    and l
    and l
    and l
    and l
    pushx @ + $15d7
    dec d
    dec d
    dec d
    ret c

    add l
    add l
    add l
    add l
    pushx @ + $3535
    dec [hl]
    dec [hl]
    ret c

    and l
    and l
    and c
    add hl, bc
    add sp, $08
    ld [$eb0b], a
    ld bc, $e5d3
    nop
    rst $18
    ld [bc], a
    and $87
    ld h, b
    and $50
    ld h, b
    and $87
    and b
    and $50
    and b
    and $87
    ld h, b
    and $50
    ld h, b
    pushx @ + $87e6
    db $10
    and $30
    inc d
    ret c

    ldh [$df], a
    ld [bc], a
    and $87
    db $10
    and $50
    db $10
    and $87
    ld d, b
    and $50
    ld d, b
    and $87
    db $10
    and $50
    db $10
    and $87
    add b
    and $30
    add h
    pushx @ + $d3e0
    rst $18
    ld [bc], a
    and $87
    add b
    and $50

jr_01c_63e4:
    add b
    and $87

jr_01c_63e7:
    ret nz

    and $50
    ret nz

    and $87
    add b
    and $50

jr_01c_63f0:
    add b
    pushx @ + $87e6
    jr nc, @-$18

    jr nc, @+$36

    ret c

    ldh [$e6], a
    add a
    jr nc, jr_01c_63e4

    ld d, b
    jr nc, jr_01c_63e7

    add a
    ld [hl], b
    and $50
    ld [hl], b
    and $87
    jr nc, jr_01c_63f0

    ld d, b
    jr nc, @-$18

    add a
    and b
    and $30
    and h
    pushx @ + $87e6
    jr nc, @-$18

    ld b, b
    jr nc, @-$18

    add a
    ld [hl], b
    and $40
    ld [hl], b
    ret c

    and $87
    and b
    and $30
    and [hl]
    rst $18
    ld [bc], a
    and $87
    ld h, b
    and $50
    ld h, b
    and $87
    and b
    and $50
    and b
    and $87
    ld h, b
    and $50
    ld h, b
    pushx @ + $87e6
    db $10
    and $30
    inc d
    ret c

    ldh [$df], a
    ld [bc], a
    and $87
    db $10
    and $50
    db $10
    and $87
    ld d, b
    and $50
    ld d, b
    and $87
    db $10
    and $50
    db $10
    and $87
    add b
    and $30
    add h
    pushx @ + $d3e0
    rst $18
    ld [bc], a
    and $87
    add b
    and $50

jr_01c_6467:
    add b
    and $87

jr_01c_646a:
    ret nz

    and $50
    ret nz

    and $87
    add b
    and $50

jr_01c_6473:
    add b
    pushx @ + $87e6
    jr nc, @-$18

    jr nc, jr_01c_64af

    ret c

    ldh [$e6], a
    add a
    jr nc, jr_01c_6467

    ld d, b
    jr nc, jr_01c_646a

    add a
    ld [hl], b
    and $50
    ld [hl], b
    and $87
    jr nc, jr_01c_6473

    ld d, b
    jr nc, @-$18

    add a
    and b
    and $30
    and h
    pushx @ + $87e6
    jr nc, @-$18

    ld d, b
    jr nc, @-$18

    add a
    ld [hl], b
    and $50
    ld [hl], b
    ret c

    and $87
    and b
    and $20
    and [hl]
    sbc $ff
    call c, $dd11
    ret nc

jr_01c_64af:
    inc b
    add sp, $08
    db $d3
    push hl
    nop
    and $85
    ld d, e
    and $87
    dec de
    and $30
    ld d, a
    and $85
    ld [hl], e
    and $87
    dec sp
    and $30
    ld [hl], a
    and $85
    sub e
    and $87
    ld e, e
    and $30
    sub a
    and $85
    and e
    and $87
    ld l, e
    and $30
    and a
    and $85
    ld d, e
    and $87
    dec de
    and $30
    ld d, a
    and $85
    ld [hl], e
    and $87
    dec sp
    and $30
    ld [hl], a
    and $85
    sub e
    and $87
    ld e, e
    and $30
    sub a
    and $85
    and e
    and $87
    ld l, e
    and $30
    and a
    ret nc

    inc b
    add sp, $08
    pop de
    push hl
    ld b, b
    and $e7
    rst $18
    inc bc
    ld h, c
    ld bc, $d761
    ld h, c
    ret c

    ret nc

    ld bc, $0165
    ld h, h
    ld [bc], a
    ret nc

    inc b
    ld h, c
    ld bc, $d761
    ld h, c
    ret c

    ret nc

    ld bc, $0165
    ld h, h
    ld [bc], a
    ret nc

    inc b
    ldh [$61], a
    ld bc, $d761
    ld h, c
    ret c

    ret nc

    ld bc, $0066
    ld h, l
    ld bc, $04d0
    ld h, c
    pushx @ + $d861
    ld h, c
    pushx @ + $d861
    ret nc

    ld bc, $0066
    ld h, l
    ld bc, $04d0
    rst $18
    inc bc
    ld h, c
    ld bc, $d761
    ld h, c
    ret c

    ret nc

    ld bc, $0066
    ld h, l
    ld bc, $04d0
    ld h, c
    ld bc, $d761
    ld h, c
    ret c

    ret nc

    ld bc, $0066
    ld h, l
    ld bc, $04d0
    ldh [$91], a
    ld bc, $d791
    sub c
    ret c

    ret nc

    ld bc, $0195
    sub h
    ld [bc], a
    ret nc

    inc b
    sub c
    pushx @ + $d891
    sub c
    pushx @ + $d891
    sub c
    pushx @ + $d891
    rst $18
    ld [bc], a
    rst $18
    inc bc
    and $e7
    add c
    ld bc, $01d0
    and $a7
    add [hl]
    nop
    ret nc

    inc b
    ldh [$e6], a
    rst $20
    ret nc

    ld bc, $0185
    add l
    ld bc, $04d0
    add c
    rst $18
    inc bc
    and $e7
    ld sp, $d001
    ld bc, $a7e6
    ld [hl], $00
    ret nc

    inc b
    ldh [$e6], a
    rst $20
    ret nc

    ld bc, $0135
    dec [hl]
    ld bc, $04d0
    ld sp, $03df
    and $e7
    and c
    ld bc, $01d0
    and $a7
    and [hl]
    nop
    ret nc

    inc b
    ldh [$e6], a
    rst $20
    ret nc

    ld bc, $01a5
    and l
    ld bc, $04d0
    and c
    rst $18
    inc bc
    and $e7
    ld d, c
    ld bc, $01d0
    and $a7
    ld d, [hl]
    nop
    ret nc

    inc b
    ldh [$e6], a
    rst $20
    ret nc

    ld bc, $0155
    ld d, l
    ld bc, $04d0
    ld d, c

Jump_01c_65e6:
    rst $18
    inc bc
    and $e7
    add c
    ld bc, $01d0
    and $a7
    add [hl]
    nop
    ret nc

    inc b
    ldh [$e6], a
    rst $20
    ret nc

    ld bc, $0185
    add l
    ld bc, $04d0
    add c
    rst $18
    inc bc
    and $e7
    ld sp, $d001
    ld bc, $a7e6
    ld [hl], $00
    ret nc

    inc b
    ldh [$e6], a
    rst $20
    ret nc

    ld bc, $0135
    dec [hl]
    ld bc, $04d0
    ld sp, $03df
    and $e7
    and c
    ld bc, $01d0
    and $a7
    and [hl]
    nop
    ret nc

    inc b
    ldh [$e6], a
    rst $20
    ret nc

    ld bc, $01a5
    and l
    ld bc, $04d0
    and c
    ld d, c
    ld bc, $01d0
    ld d, [hl]
    nop
    ret nc

    inc b
    ld d, c
    ld bc, $d751
    ld d, c
    ret c

    ld d, c
    pushx @ + $0151
    ret c

    ld d, e
    ldh [$de], a
    rst $38
    call c, $dd11
    ret nc

    inc b
    add sp, $08
    rst $20
    ld [bc], a
    jp hl


    ld b, b
    and $20
    pop de
    rst $18
    ld [bc], a
    rst $18
    inc bc
    ld sp, $3101
    pushx @ + $d831
    ret nc

    ld bc, $0135
    inc [hl]
    ld [bc], a
    ret nc

    inc b
    ld sp, $3101
    pushx @ + $d831
    ret nc

    ld bc, $0135
    inc [hl]
    ld [bc], a
    ret nc

    inc b
    ldh [$31], a
    ld bc, $d731
    ld sp, $d0d8
    ld bc, $0135
    inc [hl]
    ld [bc], a
    ret nc

    inc b
    ld sp, $31d7
    ret c

    ld sp, $31d7
    ret c

    ret nc

    ld bc, $0135
    ret nc

    inc b
    ld sp, $d3e0
    add sp, $08
    rst $20
    inc b
    jp hl


    ld h, b
    and $40
    or l
    add l
    ld c, e
    pushx @ + $d815
    and l
    ld l, e
    pushx @ + $d835
    push bc
    adc e
    pushx @ + $1545
    ret c

    sbc e
    or l
    add l
    ld c, e
    pushx @ + $d815
    and l
    ld l, e
    pushx @ + $d835
    push bc
    adc e
    pushx @ + $4575
    ret c

    cp e
    db $d3
    add sp, $07
    rst $20
    ld [bc], a
    jp hl


    ld h, b
    and $40
    and c
    ld h, e
    and c
    ld h, e
    and c
    ld h, e
    and c
    ld h, e
    ld d, c
    inc de
    ld d, c
    inc de
    ld d, c
    inc de
    ld d, c
    inc de
    pop bc
    add e
    pop bc
    add e
    pop bc
    add e
    pop bc
    add e
    ld [hl], c
    inc sp
    ld [hl], c
    inc sp
    ld [hl], c
    inc sp
    ld [hl], c
    inc sp
    pushx @ + $63a1
    and c
    ld h, e
    and c
    ld h, e
    and c
    ld h, e
    ld d, c
    inc de
    ld d, c
    inc de
    ld d, c
    inc de
    ld d, c
    inc de
    pop bc
    add e
    pop bc
    add e
    pop bc
    add e
    pop bc
    add e
    ld [hl], c
    inc sp
    ld [hl], c
    dec [hl]
    ld [hl], e
    inc sp
    ld bc, $e8d3
    rlca
    rst $20
    ld [bc], a
    jp hl


    ld h, b
    and $40
    pushx @ + $d811
    and c
    ld h, c
    pushx @ + $d811
    and c
    ld h, c
    pushx @ + $d811
    and c
    ld h, c
    pushx @ + $d811
    and c
    ld h, c
    add c
    ld d, c
    ld de, $5181
    ld de, $5181
    ld de, $5181
    ld de, $31d7
    ret c

    pop bc
    add c
    pushx @ + $d831
    pop bc
    add c
    pushx @ + $d831
    pop bc
    add c
    pushx @ + $d831
    pop bc
    add c
    and c
    ld [hl], c
    ld sp, $71a1
    ld sp, $71a1
    ld sp, $71a1
    ld sp, $11d7
    ret c

    and c
    ld h, c
    pushx @ + $d811
    and c
    ld h, c
    pushx @ + $d811
    and c
    ld h, c
    pushx @ + $d811
    and c
    ld h, c
    add c
    ld d, c
    ld de, $5181
    ld de, $5181
    ld de, $5181
    ld de, $31d7
    ret c

    pop bc
    add c
    pushx @ + $d831
    pop bc
    add c
    pushx @ + $d831
    pop bc
    add c
    pushx @ + $d831
    pop bc
    add c
    and c
    ld [hl], c
    ld sp, $71a1
    ld sp, $40e6
    and c
    and $60
    and c
    and $40
    ld [hl], c
    and $60
    ld [hl], c
    and $40
    ld sp, $60e6
    ld sp, $ffde
    db $dd
    ret nc

    inc b
    pop de
    add sp, $08
    rst $18
    inc bc
    ld de, $7171
    ld sp, $7171
    ld de, $7171
    ld sp, $7171
    ldh [rNR11], a
    ld [hl], c
    ld [hl], c
    ld sp, $7171
    ld de, $7171
    ld sp, $3131
    rst $18
    inc bc
    ld de, $7171
    ld sp, $7171
    ld de, $7171
    ld sp, $7171
    ldh [rNR11], a
    ld [hl], c
    ld [hl], c
    ld sp, $7171
    ld sp, $3171
    ld sp, $9131
    ld de, $7171
    ld sp, $7171
    ld de, $7171
    ld sp, $1171
    ld de, $7171
    ld sp, $7171
    ld de, $7171
    ld sp, $1111
    ld de, $7171
    ld sp, $7171
    ld de, $7171
    ld sp, $1171
    ld de, $7171
    ld sp, $7171
    ld de, $1171
    ld sp, $3131
    ld de, $7171
    ld sp, $7171
    ld de, $7171
    ld sp, $1171
    ld de, $7171
    ld sp, $7171
    ld de, $1171
    ld sp, $1111
    ld de, $7171
    ld sp, $7171
    ld de, $7171
    ld sp, $1171
    ld de, $1191
    ld sp, $3030
    ld sp, $d711
    jp $81a3


    ret c

    rst $18
    ld [bc], a
    rst $18
    inc bc
    ld de, $1191
    ld de, $1191
    ld de, $1191
    ld de, $1191
    ldh [rNR11], a
    sub c
    ld de, $7031
    ld [hl], b
    sub c
    ld de, $9393
    sub c
    rst $18
    inc bc
    ld de, $1191
    ld de, $1191
    ld de, $1191
    ld de, $1191
    ldh [rNR11], a
    sub c
    ld de, $9111
    ld de, $3131
    ld sp, $01d0
    halt
    xor a
    reti


    and b
    ret nc

    inc b
    ldh [$de], a
    rst $38
    db $dd
    ret nc

    ld b, $e5
    nop
    and $96
    call nc, Call_000_00ea
    db $eb
    ld bc, $d813
    add c
    pushx @ + $3311
    ret c

    add c
    pushx @ + $d031
    ld bc, $004a
    ret nc

    ld b, $41
    ld h, c
    and $96
    add c
    and $20
    add c
    and $96
    ld b, c
    ld de, $c1d8
    or e
    ld h, c
    or c
    pushx @ + $d813
    ld h, c
    pushx @ + $d011
    ld bc, $002a
    ret nc

    ld b, $21
    ld b, c
    and $96
    ld h, c
    and $20
    ld h, c
    and $96
    ld hl, $b1d8
    and c
    sub e
    ld b, c
    sub c
    or e
    ld b, c
    or c
    ret nc

    ld bc, $00ca
    ret nc

    ld b, $c1
    pushx @ + $e621
    sub [hl]
    ld b, c
    and $20
    ld b, c
    and $96
    ret c

    pop bc
    sub c
    add c
    ret nc

    ld bc, $03df
    ld a, d
    nop
    ldh [$d0], a
    ld b, $e6
    sub [hl]
    ld [hl], c
    and $20
    ld [hl], c
    and $96
    ld h, c
    ld [hl], c
    add l
    and $96
    ld sp, $20e6
    inc sp
    and $96
    and $96
    add b
    and $20
    add b
    and $96
    add b
    sub b
    and $96
    add b
    and $20
    add b
    and $96
    pushx @ + $d813
    add c
    pushx @ + $3311
    ret c

    add c
    pushx @ + $d031
    ld bc, $004a
    ret nc

    ld b, $41
    ld h, c
    and $96
    add c
    and $20
    add c
    and $96
    ld b, c
    ld de, $c1d8
    or e
    ld h, c
    or c
    pushx @ + $d813
    ld h, c
    pushx @ + $d011
    ld bc, $002a
    ret nc

    ld b, $21
    ld b, c
    and $96
    ld h, c
    and $20
    ld h, c
    and $96
    ld hl, $b1d8
    and c
    sub e
    ld b, c
    sub c
    or e
    ld b, c
    or c
    ret nc

    ld bc, $00ca
    ret nc

    ld b, $c1
    pushx @ + $e621
    sub [hl]
    ld b, c
    and $20
    ld b, c
    and $96

jr_01c_6964:
    ret c

    pop bc
    sub c
    add c
    ret nc

    ld bc, $03df
    ld a, d
    nop
    ldh [$d0], a
    ld b, $e6
    sub [hl]
    ld [hl], c
    and $20
    ld [hl], c
    and $96
    ld h, c
    ld [hl], c
    add l
    and $96
    ld sp, $20e6
    ld sp, $96e6
    and $96
    ld h, b
    and $20
    ld h, b
    and $96
    ld b, e
    db $10
    jr nc, jr_01c_6964

    push hl
    nop
    and $85
    add sp, $08
    ld [hl], c
    ld de, $1151
    ld [hl], c
    ld de, $1151
    ld [hl], c
    ld de, $e651
    add l
    ld [hl], c
    and $20
    ld [hl], c
    and $85
    and $85
    ld [hl], c
    and $20
    ld [hl], e
    and $85
    sub c
    ld sp, $3171
    sub c
    ld sp, $3171
    sub c
    ld sp, $e671
    add l
    sub c
    and $20
    sub c
    and $85
    and $85
    sub c
    and $20
    sub e
    and $85
    or c
    ld d, c
    sub c
    ld d, c
    or c
    ld d, c
    sub c
    ld d, c
    or c
    ld d, c
    sub c
    and $85
    or c
    and $20
    or c
    and $85
    and $85
    or c
    and $20
    or e
    and $85
    pushx @ + $d821
    add c
    pop bc
    add c
    pushx @ + $d821
    add c
    pop bc
    add c
    pushx @ + $d821
    add c
    pop bc
    pushx @ + $85e6
    ld hl, $20e6
    ld hl, $85e6
    ret c

    pop bc
    and c
    add c
    ret nc

    ld b, $e5
    ld b, b
    and $87
    add sp, $08
    ld [$eb06], a
    dec d
    call nc, Call_01c_5103
    ld [hl], c
    pushx @ + $d851
    push bc
    ld d, c
    ld [hl], c
    pushx @ + $d851
    ret


    inc bc
    ld [hl], c
    sub c
    pushx @ + $2571
    ret c

    ld [hl], c
    sub c
    pushx @ + $2371
    ret c

    sub c
    ld hl, $9175
    or c
    pushx @ + $4591
    ret c

    sub c
    or c
    sub c
    or e
    pushx @ + $4191
    ret c

    sub l
    pop bc
    pushx @ + $c121
    ld [hl], e
    ret c

    pop bc
    pushx @ + $d871
    ld [hl], c
    pushx @ + $7951
    sbc $ff
    db $dd
    ret nc

    ld b, $e5
    nop
    and $76
    add sp, $08
    db $e4
    rst $38
    db $d3
    inc de
    ret c

    add c
    pushx @ + $3311
    ret c

    add c
    pushx @ + $4131
    ld b, c
    ld h, c
    and $76
    add c
    and $20
    add c
    and $76
    ld b, c
    ld de, $c1d8
    or e
    ld h, c
    or c
    pushx @ + $d813
    ld h, c
    pushx @ + $2111
    ld hl, $e641
    halt
    ld h, c
    and $20
    ld h, c
    and $76
    ld hl, $b1d8
    and c
    sub e
    ld b, c
    sub c
    or e
    ld b, c
    or c
    pop bc
    pop bc
    pushx @ + $e621
    halt
    ld b, c
    and $20
    ld b, c
    and $76
    ret c

    pop bc
    sub c
    add c
    ld [hl], c
    ld [hl], c
    ld [hl], c
    and $76
    ld [hl], c
    and $20
    ld [hl], c
    and $76
    ld h, c
    ld [hl], c
    add c
    reti


    add e
    and $76
    ld sp, $20e6
    inc sp
    and $76
    and $76
    add b
    and $20
    add b
    and $76
    add b
    sub b
    and $76
    add b
    and $20
    add b
    and $76
    and $86
    db $e4
    nop
    pushx @ + $1143
    ld b, c
    ld h, e
    ld de, $8161
    add c
    sub c
    and $86
    or c
    and $30
    or c
    and $86
    add c
    ld b, c
    ld sp, $d823
    or c
    pushx @ + $4321
    ret c

    or c
    pushx @ + $6141
    ld h, c
    ld [hl], c
    and $86
    sub c
    and $30
    sub c
    and $86
    ld h, c
    ld hl, $d811
    jp $c191


    pushx @ + $d823
    sub c
    pushx @ + $4121
    ld b, c
    ld d, c
    and $86
    ld [hl], c
    and $30
    ld [hl], c
    and $86
    ld b, c
    ret c

    pop bc
    or c
    pushx @ + $3131
    ld sp, $86e6
    ld sp, $30e6
    ld sp, $86e6
    ret c

    and c
    pushx @ + $d831
    pop bc
    reti


    jp $86e6


    add c
    and $30
    add c
    and $86
    and $86
    ld h, b
    and $30
    ld h, b
    and $86
    ld b, e
    db $10
    jr nc, @-$2e

    ld b, $e5
    ld b, b
    and $64
    add sp, $08
    db $e4
    nop
    db $d3
    nop
    ld [hl], c
    ld de, $1151
    ld [hl], c
    ld de, $1151
    ld [hl], c
    ld de, $7151
    ld bc, $0074
    sub c
    ld sp, $3171
    sub c
    ld sp, $3171
    sub c
    ld sp, $9171
    ld bc, $0094
    or c
    ld d, c
    sub c
    ld d, c
    or c
    ld d, c
    sub c
    ld d, c
    or c
    ld d, c
    sub c
    or c
    ld bc, $00b4
    pushx @ + $d821
    add c
    pop bc
    add c
    pushx @ + $d821
    add c
    pop bc
    add c
    pushx @ + $d821
    add c
    pop bc
    pushx @ + $0121
    ret c

    pop bc
    and c
    add b
    call nc, $80e5
    and $54
    add sp, $08
    ld [hl], c
    ld de, $1151
    ret c

    pop bc
    pushx @ + $5111
    ld de, $1171
    ld d, c
    and $54
    ld [hl], c
    and $10
    ld [hl], c
    and $54
    and $54
    ld [hl], c
    and $10
    ld [hl], e
    and $54
    sub c
    ld sp, $3171
    sub c
    ld sp, $3171
    sub c
    ld sp, $e671
    ld d, h
    sub c
    and $10
    sub c
    and $54
    and $54
    sub c
    and $10
    sub e
    and $54
    or c
    ld d, c
    sub c
    ld d, c
    or c
    ld d, c
    sub c
    ld d, c
    or c
    ld d, c
    sub c
    and $54
    or c
    and $10
    or c
    and $54
    and $54
    or c
    and $10
    or e
    and $54
    pushx @ + $d821
    add c
    pop bc
    add c
    pushx @ + $d821
    add c
    pop bc
    add c
    pushx @ + $d821
    add c
    pop bc
    pushx @ + $e621
    db $10
    daa
    sbc $ff
    call c, $dd11
    ret nc

    ld b, $e8
    rlca
    rst $20
    ld [bc], a
    jp hl


    ld b, b
    and $20
    pop de
    ret nc

    ld bc, $001a
    ret nc

    ld b, $11
    pushx @ + $d811
    rst $18
    ld [bc], a
    ret nc

    ld bc, $001a
    add hl, de
    ld bc, $06d0
    ld de, $11d7
    ret c

    ldh [rNR11], a
    ld bc, $d711
    ld de, $11d8
    rst $18
    dec bc
    ret nc

    ld bc, $00ba
    ldh [$d0], a
    ld b, $b1
    ld bc, $01d0
    cp d
    nop
    cp d
    nop
    ret nc

    ld b, $b1
    rst $18
    dec bc
    ret nc

    ld bc, $009a
    ldh [$d0], a
    ld b, $91
    ld bc, $01d0
    sbc d
    nop
    sbc d
    nop
    ret nc

    ld b, $91
    ret nc

    ld bc, $003a
    ret nc

    ld b, $31
    pushx @ + $d831
    ret nc

    ld bc, $003a
    ld a, [hl-]
    nop
    ret nc

    ld b, $31
    pushx @ + $d831
    ld sp, $01d0
    adc d
    nop
    adc d
    nop
    adc d
    nop
    ret nc

    ld b, $81
    ld bc, $0080
    add b
    sub b
    add b
    nop
    ret nc

    ld bc, $001a
    ret nc

    ld b, $11
    pushx @ + $d811
    rst $18
    ld [bc], a
    ret nc

    ld bc, $001a
    add hl, de
    ld bc, $06d0
    ld de, $11d7
    ret c

    ldh [rNR11], a
    ld bc, $d711
    ld de, $11d8
    rst $18
    dec bc
    ret nc

    ld bc, $00ba
    ldh [$d0], a
    ld b, $b1
    ld bc, $01d0
    cp d
    nop
    cp d
    nop
    ret nc

    ld b, $b1
    rst $18
    dec bc
    ret nc

    ld bc, $009a
    ldh [$d0], a
    ld b, $91
    ld bc, $01d0
    sbc d
    nop
    sbc d
    nop
    ret nc

    ld b, $91
    ret nc

    ld bc, $003a
    ret nc

    ld b, $31

jr_01c_6ccd:
    pushx @ + $d831
    ret nc

    ld bc, $003a
    ld a, [hl-]
    nop
    ret nc

    ld b, $31
    pushx @ + $d831
    ld sp, $01d0
    adc d
    nop
    adc d
    nop
    adc d
    nop
    ret nc

    ld b, $81
    ld h, b
    nop
    ld b, e
    db $10
    jr nc, jr_01c_6ccd

    dec bc
    ret nc

    ld bc, $001a
    ldh [$d0], a
    ld b, $11
    ld bc, $0311
    rst $18
    dec bc
    ret nc

    ld bc, $003a
    ldh [$d0], a
    ld b, $31
    ld bc, $0331
    rst $18
    dec bc
    ret nc

    ld bc, $005a
    ldh [$d0], a
    ld b, $51
    ld bc, $0351
    rst $18
    dec bc
    ret nc

    ld bc, $008a
    ldh [$d0], a
    ld b, $81
    ld bc, $4161
    ld hl, $0bdf
    ret nc

    ld bc, $001a
    ldh [$d0], a
    ld b, $11
    ld bc, $0311
    rst $18
    dec bc
    ret nc

    ld bc, $003a
    ldh [$d0], a
    ld b, $31
    ld bc, $0331
    rst $18
    dec bc
    ret nc

    ld bc, $005a
    ldh [$d0], a
    ld b, $51
    ld bc, $0351
    rst $18
    dec bc
    ret nc

    ld bc, $008a
    ldh [$d0], a
    ld b, $81
    rlca
    sbc $ff
    db $dd
    ret nc

    ld b, $d1
    rst $18

jr_01c_6d5b:
    inc bc
    ld de, $3171
    ld [hl], c
    ld de, $3111

jr_01c_6d63:
    ld [hl], c
    ldh [rNR11], a
    ld [hl], c
    ld sp, $7111
    ld de, $9131
    rst $18
    ld [bc], a
    ld de, $3171
    ld [hl], c
    ld de, $3111
    ld [hl], c
    ldh [rNR11], a
    ld [hl], c
    ld sp, $1171

jr_01c_6d7d:
    ld de, $1131
    ld de, $3171
    ld [hl], c
    db $10

jr_01c_6d85:
    db $10
    ret nc

    ld bc, $0435
    dec [hl]
    dec [hl]
    dec [hl]

jr_01c_6d8d:
    ld b, $d0
    ld b, $df
    inc bc
    ld de, $3171

jr_01c_6d95:
    ld [hl], c
    ld de, $3111
    ld [hl], c
    ldh [rNR11], a
    ld [hl], c
    ld sp, $7111
    ld de, $9131
    rst $18
    ld [bc], a
    ld de, $3171
    ld [hl], c
    ld de, $3111
    ld [hl], c
    ldh [rNR11], a
    ld [hl], c
    ld sp, $1171
    ld de, $1131
    ld de, $3171
    ld [hl], c
    ld sp, $d031
    ld bc, $353a

jr_01c_6dc0:
    ld [hl], $d0
    ld b, $df
    inc bc
    db $10
    sub b
    ld [hl], b

jr_01c_6dc8:
    sub b
    jr nc, jr_01c_6d5b

    ld [hl], b
    sub b
    db $10
    sub b
    ld [hl], b

jr_01c_6dd0:
    sub b
    jr nc, jr_01c_6d63

    ld [hl], b
    sub b
    db $10
    sub b
    ld [hl], b
    sub b
    jr nc, @-$6e

    db $10
    sub b
    ld [hl], b
    sub b
    jr nc, @-$6e

    ld [hl], b
    sub b
    pushx @ + $d831
    ldh [rNR10], a
    sub b
    ld [hl], b
    sub b
    jr nc, jr_01c_6d7d

    ld [hl], b
    sub b
    db $10
    sub b
    ld [hl], b
    sub b
    jr nc, jr_01c_6d85

    ld [hl], b
    sub b
    db $10
    sub b
    ld [hl], b
    sub b
    jr nc, jr_01c_6d8d

    db $10
    sub b
    ld [hl], b
    sub b
    jr nc, @-$6e

    jr nc, jr_01c_6d95

    ld sp, $03df
    db $10
    sub b
    ld [hl], b
    sub b
    jr nc, @-$6e

    ld [hl], b
    sub b
    db $10
    sub b
    ld [hl], b
    sub b
    jr nc, @-$6e

jr_01c_6e16:
    ld [hl], b
    sub b
    db $10
    sub b
    ld [hl], b
    sub b
    jr nc, @-$6e

    db $10
    sub b
    ld [hl], b
    sub b
    jr nc, @-$6e

    ld [hl], b
    sub b
    pushx @ + $d831
    ldh [rNR10], a
    sub b
    ld [hl], b
    sub b
    jr nc, jr_01c_6dc0

    ld [hl], b
    sub b
    db $10
    sub b
    ld [hl], b
    sub b
    jr nc, jr_01c_6dc8

    ld [hl], b
    sub b
    db $10
    sub b
    ld [hl], b
    sub b
    jr nc, jr_01c_6dd0

    db $10
    sub b
    ld [hl], b
    nop
    jr nc, jr_01c_6e16

    ld bc, $3594
    dec [hl]
    inc a
    ret nc

    ld b, $de
    rst $38
    db $dd
    ret nc

jr_01c_6e51:
    ld bc, $00e5
    add sp, $08
    ld [$eb0a], a

jr_01c_6e59:
    ld bc, $e6d3
    and l
    ld b, [hl]
    ld bc, $e648

jr_01c_6e61:
    jr nc, jr_01c_6eab

    and $75
    ld b, [hl]
    ld bc, $e648

jr_01c_6e69:
    jr nc, jr_01c_6eb3

    and $65
    ld b, [hl]
    ld bc, $e648
    jr nz, jr_01c_6ebb

    and $55
    ld b, [hl]
    ld bc, $e648
    jr nz, jr_01c_6ec3

    and $45
    ld b, [hl]
    ld bc, $e648
    db $10
    ld c, b
    and $35
    ld b, [hl]
    ld bc, $e648
    db $10
    ld c, b
    and $25
    ld b, [hl]
    ld bc, $d848
    and $a5
    or [hl]
    ld bc, $e6b8
    jr nc, jr_01c_6e51

    and $75
    or [hl]
    ld bc, $e6b8
    jr nc, jr_01c_6e59

    and $65
    or [hl]
    ld bc, $e6b8
    jr nz, jr_01c_6e61

    and $55

jr_01c_6eab:
    or [hl]
    ld bc, $e6b8
    jr nz, jr_01c_6e69

    and $45

jr_01c_6eb3:
    or [hl]
    ld bc, $e6b8
    db $10
    cp b
    and $35

jr_01c_6ebb:
    or [hl]
    ld bc, $e6b8
    db $10
    cp b
    and $25

jr_01c_6ec3:
    or [hl]
    ld bc, $d7b8
    and $a5
    ld b, [hl]
    ld bc, $e648
    jr nc, @+$4a

    and $75
    ld b, [hl]
    ld bc, $e648
    jr nc, @+$4a

    and $65
    ld b, [hl]
    ld bc, $e648
    jr nz, @+$4a

    and $55
    ld b, [hl]
    ld bc, $e648
    jr nz, @+$4a

    and $45
    ld b, [hl]
    ld bc, $e648
    db $10
    ld c, b
    and $35
    ld b, [hl]
    ld bc, $e648
    db $10
    ld c, b
    and $25
    ld b, [hl]
    ld bc, $e648
    and l
    ld h, $01

jr_01c_6f00:
    jr z, @-$18

jr_01c_6f02:
    jr nc, @+$2a

    and $75
    ld h, $01

jr_01c_6f08:
    jr z, @-$18

    jr nc, jr_01c_6f34

    and $65
    ld h, $01

jr_01c_6f10:
    jr z, @-$18

    jr nz, jr_01c_6f3c

    and $55
    ld h, $01
    jr z, jr_01c_6f00

    jr nz, jr_01c_6f44

    and $45
    ld h, $01
    jr z, jr_01c_6f08

    db $10
    jr z, @-$18

    dec [hl]
    ld h, $01
    jr z, jr_01c_6f10

    db $10
    jr z, @-$18

    dec h
    ld h, $01
    jr z, jr_01c_6f02

    add hl, bc
    push hl

jr_01c_6f34:
    add b
    and $65
    add sp, $08
    ld [$eb00], a

jr_01c_6f3c:
    ld bc, $61d3
    pushx @ + $2141
    ret c

    ld h, c

jr_01c_6f44:
    pushx @ + $2141
    ret c

    ld h, c
    pushx @ + $2141
    ret c

    ld h, c
    ld de, $41d7
    ret c

    or c
    ld h, c
    pushx @ + $d841
    or c
    ld h, c
    pushx @ + $d841
    or c
    ld h, c
    ld d, c
    pushx @ + $2141
    ret c

    ld d, c
    pushx @ + $2141
    ret c

    ld d, c
    pushx @ + $2141
    ret c

    ld d, c
    pushx @ + $2141
    ret c

    ld d, c
    pushx @ + $2141
    ret c

jr_01c_6f77:
    ld d, c
    pushx @ + $2141
    ret c

    ld d, c
    pushx @ + $d041
    add hl, bc
    jp nc, Jump_000_00e5

jr_01c_6f84:
    rst $18
    ld [bc], a
    and $a5
    ld h, b
    add b
    pushx @ + $d810
    and $a5
    jr nz, jr_01c_6f77

    jr nc, @+$22

    and $a5
    ld h, b
    add b
    pushx @ + $d810
    and $a5
    jr nz, jr_01c_6f84

    jr nc, jr_01c_6fc0

    and $a5
    add b
    ld h, b
    jr nz, @-$18

    and l
    add b
    and $30
    add b
    and $a5
    ld h, b
    pushx @ + $a5e6
    db $10
    and $30
    db $10
    and $a5
    ret c

    and $a5
    db $10
    and $30
    db $10
    and $a5

jr_01c_6fc0:
    ldh [$df], a
    ld [bc], a
    ld d, b
    ld [hl], b
    ret nz

    and $a5
    db $10
    and $30
    db $10
    and $a5
    ld d, b
    ld [hl], b
    ret nz

    and $a5
    db $10
    and $30
    db $10
    and $a5
    ld [hl], b
    ld d, b
    db $10
    and $a5
    ld [hl], b

jr_01c_6fdf:
    and $30
    ld [hl], b
    and $a5
    ld d, b
    and $a5
    ret nz

    and $30
    ret nz

    and $a5
    ret c

    and $a5
    ret nz

    and $30
    ret nz

    and $a5
    pushx @ + $d0e0
    add hl, bc
    ld [$eb06], a
    dec bc
    push de
    push hl
    nop

jr_01c_7001:
    and $85
    rst $18
    ld [bc], a
    jr nz, jr_01c_6fdf

    sub b
    ld hl, $d790
    ld hl, $90d8
    ld hl, $d790

jr_01c_7011:
    inc hl
    ret nc

    ld bc, $3344
    ret nc

    add hl, bc
    jr nz, @-$26

    sub b
    ld hl, $e0d7
    rst $18
    ld [bc], a
    db $10
    ret c

    add b
    ld de, $d780
    ld de, $80d8
    ld de, $d780
    inc de
    ret nc

    ld bc, $2334
    ret nc

    add hl, bc
    db $10
    ret c

    add b
    ld de, $e0d7
    sbc $ff
    db $dd
    ret nc

    ld bc, $e5d2
    nop
    and $a5
    or [hl]
    ld bc, $e6b8
    jr nc, jr_01c_7001

    and $75
    or [hl]
    ld bc, $e6b8
    jr nc, @-$46

    and $65
    or [hl]
    ld bc, $e6b8
    jr nz, jr_01c_7011

    and $55
    or [hl]
    ld bc, $e6b8
    jr nz, @-$46

    and $45
    or [hl]
    ld bc, $e6b8
    db $10
    cp b
    and $35

jr_01c_706b:
    or [hl]
    ld bc, $e6b8
    db $10
    cp b
    and $25

jr_01c_7073:
    or [hl]
    ld bc, $e6b8
    and l
    halt
    ld bc, $e678
    jr nc, jr_01c_70f6

    and $75
    halt
    ld bc, $e678
    jr nc, jr_01c_70fe

    and $65
    halt
    ld bc, $e678
    jr nz, jr_01c_7106

    and $55

jr_01c_7090:
    halt
    ld bc, $e678
    jr nz, jr_01c_710e

    and $45

jr_01c_7098:
    halt
    ld bc, $e678
    db $10
    ld a, b
    and $35

jr_01c_70a0:
    halt
    ld bc, $e678
    db $10
    ld a, b
    and $25

jr_01c_70a8:
    halt
    ld bc, $e678
    and l
    or [hl]
    ld bc, $e6b8
    jr nc, jr_01c_706b

    and $75
    or [hl]
    ld bc, $e6b8
    jr nc, jr_01c_7073

    and $65
    or [hl]
    ld bc, $e6b8
    jr nz, @-$46

    and $55
    or [hl]
    ld bc, $e6b8
    jr nz, @-$46

    and $45
    or [hl]
    ld bc, $e6b8
    db $10
    cp b
    and $35
    or [hl]
    ld bc, $e6b8
    db $10
    cp b
    and $25
    or [hl]
    ld bc, $e6b8
    and l
    and [hl]
    ld bc, $e6a8
    jr nc, jr_01c_7090

    and $75
    and [hl]
    ld bc, $e6a8
    jr nc, jr_01c_7098

    and $65
    and [hl]
    ld bc, $e6a8

jr_01c_70f6:
    jr nz, jr_01c_70a0

    and $55
    and [hl]
    ld bc, $e6a8

jr_01c_70fe:
    jr nz, jr_01c_70a8

    and $45
    and [hl]
    ld bc, $e6a8

jr_01c_7106:
    db $10
    xor b
    and $35
    and [hl]
    ld bc, $e6a8

jr_01c_710e:
    db $10
    xor b

jr_01c_7110:
    and $25
    and [hl]
    ld bc, $d0a8
    ld bc, $e5d3
    ld b, b
    and $a5
    ld b, [hl]
    ld bc, $e648

jr_01c_7120:
    jr nc, jr_01c_716a

    and $85
    ld b, [hl]
    ld bc, $e648

jr_01c_7128:
    jr nc, jr_01c_7172

    and $75
    ld b, [hl]
    ld bc, $e648
    jr nz, jr_01c_717a

    and $65
    ld b, [hl]
    ld bc, $e648
    jr nz, jr_01c_7182

    and $55
    ld b, [hl]
    ld bc, $e648
    db $10
    ld c, b
    and $45
    ld b, [hl]
    ld bc, $e648
    db $10
    ld c, b
    and $35
    ld b, [hl]
    ld bc, $d848
    and $a5
    or [hl]
    ld bc, $e6b8
    jr nc, jr_01c_7110

    and $85
    or [hl]
    ld bc, $e6b8
    jr nc, @-$46

    and $75
    or [hl]
    ld bc, $e6b8
    jr nz, jr_01c_7120

    and $65

jr_01c_716a:
    or [hl]
    ld bc, $e6b8
    jr nz, jr_01c_7128

    and $55

jr_01c_7172:
    or [hl]
    ld bc, $e6b8
    db $10

jr_01c_7177:
    cp b
    and $45

jr_01c_717a:
    or [hl]
    ld bc, $e6b8
    db $10
    cp b
    and $35

jr_01c_7182:
    or [hl]
    ld bc, $d7b8
    and $a5
    ld b, [hl]
    ld bc, $e648
    jr nc, @+$4a

    and $85
    ld b, [hl]
    ld bc, $e648
    jr nc, jr_01c_71de

    and $75
    ld b, [hl]
    ld bc, $e648
    jr nz, jr_01c_71e6

    and $65

jr_01c_71a0:
    ld b, [hl]
    ld bc, $e648
    jr nz, @+$4a

    and $55
    ld b, [hl]

jr_01c_71a9:
    ld bc, $e648

jr_01c_71ac:
    db $10
    ld c, b
    and $45
    ld b, [hl]
    ld bc, $e648
    db $10
    ld c, b
    and $35
    ld b, [hl]
    ld bc, $e848
    rlca
    rst $18
    ld b, $e6
    and b
    jr z, jr_01c_71a9

    ld d, b
    jr z, jr_01c_71ac

    jr nc, @+$2a

    ldh [$e6], a

jr_01c_71ca:
    and b
    jr z, @-$18

    ld d, b
    jr z, jr_01c_71a0

    add hl, bc
    push hl
    nop
    and $73

jr_01c_71d5:
    add sp, $08
    jp nc, $df01

    ld [bc], a
    and $73
    ld h, b

jr_01c_71de:
    add b
    pushx @ + $d810
    jr nz, jr_01c_71ca

    jr nz, jr_01c_7206

jr_01c_71e6:
    and $73
    ld h, b
    add b
    pushx @ + $d810
    jr nz, jr_01c_71d5

    jr nz, @+$22

    and $73
    add b
    ld h, b
    jr nz, jr_01c_7177

    and $20
    add b
    and $73
    ld h, b
    pushx @ + $e610
    jr nz, jr_01c_7212

    ret c

    and $73
    db $10

jr_01c_7206:
    and $20
    db $10
    ldh [$e6], a
    ld [hl], e
    ld d, b
    ld [hl], b
    ret nz

    db $10
    and $20

jr_01c_7212:
    db $10
    and $73
    ld d, b
    ld [hl], b
    ret nz

    db $10
    and $20
    db $10
    and $73
    ld [hl], b
    ld d, b
    db $10
    ld [hl], b
    and $20
    ld [hl], b
    and $73
    ld d, b
    ret nz

    and $20
    ret nz

    ret c

    and $73
    ret nz

    and $20
    ret nz

    pushx @ + $73e6
    ld d, b
    ld [hl], b
    ret nz

    db $10
    and $20
    db $10
    and $73
    ld d, b
    ld [hl], b
    ret nz

    db $10
    and $20
    db $10
    and $73
    ld [hl], b
    ld d, b
    db $10
    ld [hl], b

jr_01c_724c:
    and $20
    ld [hl], b
    and $73
    ld d, b
    ret nz

    and $20
    ret nz

    ret nc

    add hl, bc
    jp nc, Jump_000_00e5

    and $93
    ld h, b
    add b
    pushx @ + $d810
    and $93
    jr nz, jr_01c_724c

    jr nc, @+$22

    and $93
    ld h, b
    add b
    pushx @ + $d810
    and $93
    jr nz, @-$18

    jr nc, jr_01c_7295

    and $93
    add b
    ld h, b
    jr nz, @-$18

    sub e
    add b
    and $30
    add b
    and $93
    ld h, b
    pushx @ + $93e6
    db $10
    and $30
    db $10
    and $93
    ret c

    and $93
    db $10
    and $30
    db $10
    and $93

jr_01c_7295:
    ld h, b
    add b
    pushx @ + $d810
    and $93
    jr nz, @-$18

    jr nc, @+$22

    and $93
    ld h, b
    add b
    pushx @ + $d810
    and $93
    jr nz, @-$18

    jr nc, jr_01c_72cd

    and $93
    add b
    ld h, b
    jr nz, @-$18

    sub e
    add b
    and $30
    add b
    and $93
    ld h, b
    pushx @ + $93e6
    db $10
    and $30
    db $10
    and $93
    ret c

    and $93
    db $10
    and $30
    db $10
    and $93

jr_01c_72cd:
    ld d, b
    ld [hl], b
    ret nz

    and $93
    db $10
    and $30
    db $10
    and $93
    ld d, b
    ld [hl], b
    ret nz

    and $93
    db $10
    and $30
    db $10
    and $93
    ld [hl], b
    ld d, b
    db $10
    and $93
    ld [hl], b
    and $30
    ld [hl], b
    and $93
    ld d, b
    and $93
    ret nz

    and $30
    ret nz

    and $93
    ret c

    and $93
    ret nz

    and $30
    ret nz

    and $93
    pushx @ + $7050
    ret nz

    and $93
    db $10
    and $30
    db $10
    and $93
    ld d, b
    ld [hl], b
    ret nz

    and $93
    db $10
    and $30
    db $10
    and $93
    ld [hl], b
    ld d, b
    db $10
    and $93
    ld [hl], b
    and $30
    ld [hl], b
    and $93
    ld d, b
    and $93
    ret nz

    and $30
    ret nz

    and $93
    ret c

    and $93
    ret nz

    and $30
    ret nz

    and $93
    sbc $ff
    db $dd
    ret nc

    add hl, bc
    add sp, $08
    rst $20
    ld [bc], a
    jp hl


    ld h, b
    and $20
    rst $18
    ld [bc], a
    jp nc, $d160

    stop
    ldh [$e6], a
    ld b, b
    rst $18
    inc b
    jp nc, $d160

    stop
    ldh [$d2], a
    ld h, b
    nop
    and $20
    rst $18
    ld [bc], a
    jp nc, $d110

    ld b, b
    nop
    ldh [$e6], a
    ld b, b
    rst $18
    inc b
    jp nc, $d110

    ld b, b
    nop
    ldh [$d2], a
    stop
    and $20
    rst $18
    ld [bc], a
    jp nc, $d150

    ld d, b
    nop
    ldh [$e6], a
    ld b, b
    rst $18
    inc b
    jp nc, $d150

    ld d, b
    nop
    ldh [$d2], a
    ld d, b
    nop
    and $20
    pop de
    ld d, c
    and b
    pushx @ + $9050
    ld [hl], c
    ld d, b
    ret c

jr_01c_738f:
    and e
    ld d, a
    jp hl


    ld h, b
    and $20
    rst $18
    inc bc
    jp nc, $d1b0

    stop
    ldh [$e6], a
    ld b, b
    rst $18
    inc bc
    jp nc, $d1b0

jr_01c_73a4:
    stop
    ldh [$d2], a
    or b
    nop
    and $20
    rst $18
    inc bc
    jp nc, $d170

    ld b, b
    nop
    ldh [$e6], a
    ld b, b
    rst $18
    inc bc
    jp nc, $d170

    ld b, b
    nop
    ldh [$d2], a
    ld [hl], b
    nop
    and $20
    rst $18
    inc bc
    jp nc, $d1b0

    ld d, b
    nop
    ldh [$e6], a
    ld b, b
    rst $18
    inc bc
    jp nc, $d1b0

    ld d, b
    nop
    ldh [$d2], a
    or b
    nop
    and $20
    pop de
    ld d, c
    and b
    pushx @ + $9050
    ld [hl], c
    ld d, b
    ret c

    and [hl]
    ret nc

    ld bc, $6374
    ret nc

    add hl, bc
    ld d, b
    ld [hl], b
    ld d, c
    ret nc

    add hl, bc
    add sp, $08
    db $e4
    db $fc
    rst $20
    ld [bc], a
    jp hl


    ld h, b
    and $60
    jp nc, $03d0

    ld h, l
    ret nc

    add hl, bc
    add b
    pushx @ + $d810
    ld hl, $8060
    pushx @ + $d810
    ld hl, $6080
    jr nz, jr_01c_738f

    ld h, b
    pushx @ + $d811
    ld de, $8060
    pushx @ + $d810
    ld hl, $8060
    pushx @ + $d810
    ld hl, $6080
    jr nz, jr_01c_73a4

    ld h, b
    pushx @ + $d811
    ld de, $7050
    ret nz

    ld de, $7050
    ret nz

    ld de, $5070
    db $10
    ld [hl], c
    ld d, b
    pop bc
    ret c

    pop bc
    pushx @ + $7050
    ret nz

    ld de, $7050
    ret nz

    ld de, $5070
    db $10
    ld [hl], c
    ld d, b
    pop bc
    ret c

    ret nc

jr_01c_7449:
    inc bc
    jp nz, $09d0

    pushx @ + $02e7
    jp hl


    ld h, b
    and $20
    pop de
    add sp, $07
    db $e4
    nop
    ret nc

    add hl, bc
    pushx @ + $d820
    sub b
    ld hl, $d790
    ld hl, $90d8
    ld hl, $d790
    inc hl
    ret nc

    ld bc, $3344
    ret nc

    add hl, bc
    jr nz, jr_01c_7449

    sub b
    ld hl, $20d7
    ret c

    sub b
    ld hl, $d790
    ld hl, $90d8
    ld hl, $d790
    inc hl
    ret nc

    ld bc, $3344
    ret nc

    add hl, bc
    jr nz, @-$26

    sub b
    ld hl, $10d7
    ret c

    add b
    ld de, $d780
    ld de, $80d8
    ld de, $d780
    inc de
    ret nc

    ld bc, $2334
    ret nc

    add hl, bc
    db $10
    ret c

    add b
    ld de, $10d7
    ret c

    add b
    ld de, $d780
    ld de, $80d8
    ld de, $d780
    inc de
    ret nc

    ld bc, $2334
    ret nc

    add hl, bc
    db $10
    ret c

    add b
    ld de, $ffde
    db $dd
    ret nc

    add hl, bc
    pop de
    rst $18
    inc bc
    ld [hl], b
    sub b
    pushx @ + $7070
    sub b
    sub b
    or b
    ret c

    ld [hl], b
    ld b, b
    sub b
    ld [hl], b
    ld b, b
    ld [hl], b
    sub b
    ld b, b
    sub b
    ld [hl], b
    ld [hl], b
    sub c
    ldh [rSVBK], a
    sub b
    pushx @ + $7070
    sub b
    sub b
    or b
    ret c

    sub b
    ld b, b
    sub b
    ld [hl], b

Jump_01c_74e6:
    ld b, b
    pushx @ + $d8a0
    sub b
    ld [hl], b
    and b
    ld [hl], b
    sub b
    ld h, c
    rst $18
    inc b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    ld [hl], b
    ld [hl], b
    sub c
    ldh [rNR10], a
    db $10
    sub b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    sub b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    sub b
    ld [hl], b
    sub b
    sub b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    rst $18
    inc bc
    db $10
    db $10
    sub b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    sub b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    sub b
    ld [hl], b
    sub b
    sub b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    ldh [$df], a
    inc b
    ld [hl], b
    sub b
    sub b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    sub b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    sub b
    ld [hl], b
    sub b
    ld [hl], b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    ldh [$de], a
    rst $38
    call c, $dd11
    ret nc

    ld a, [bc]
    push hl
    ld b, b
    db $d3
    add sp, $08
    ld [$eb06], a
    add hl, bc
    rst $18
    ld [bc], a
    and $c5
    ld d, c
    ret c

    and c
    sub c
    ld sp, $5141
    pushx @ + $e641
    jr nz, jr_01c_75a9

    ldh [$e6], a
    push bc
    ld d, c
    ret c

    and c
    sub c
    ld sp, $5141
    pushx @ + $7141
    ld h, c
    ret c

    pop bc
    pushx @ + $d811
    pop bc
    ld [hl], c
    add c
    ld hl, $20e6
    ld hl, $c5e6
    ld d, c
    and c
    sub c
    ld sp, $5141
    pushx @ + $e641
    jr nz, jr_01c_75d0

    and $c5
    ld d, c
    ret c

    and c
    sub c
    ld sp, $5141
    pushx @ + $e641
    jr nz, jr_01c_75de

    and $c5
    ld d, c
    ret c

    and c
    sub c
    ld sp, $5141
    pushx @ + $7141

jr_01c_75a9:
    and $20
    ld [hl], c
    ret c

    and $c5
    pop bc
    pushx @ + $d811
    pop bc
    and $d2
    add sp, $07
    ld [hl], b
    and $b3
    add sp, $08
    ld [hl], b
    and $d2
    add sp, $07
    add b
    and $b3
    add sp, $08
    add b
    ret nc

    ld bc, $d3e6
    jr z, jr_01c_75ce

jr_01c_75ce:
    and $b3

jr_01c_75d0:
    jr z, jr_01c_75d2

jr_01c_75d2:
    and $93
    jr z, jr_01c_75d6

jr_01c_75d6:
    and $85
    add hl, hl
    ret nc

    ld a, [bc]
    jp nc, $80e5

jr_01c_75de:
    and $96
    add sp, $08
    ld [$eb06], a
    dec c
    and $97
    rst $18
    inc b
    and e
    ldh [$df], a
    inc b
    jp $d7e0


    rst $18
    inc b
    inc hl
    ldh [rSCX], a
    ld b, e
    and $94
    ld b, c
    and $97
    ld b, c
    and $10
    ld b, e
    ret c

    and $97
    rst $18
    inc b
    and e
    ldh [$df], a
    inc b
    jp $d7e0


    rst $18
    inc b
    inc hl
    ldh [rHDMA3], a
    ld d, e
    and $94
    ld d, c
    and $97
    ld d, c
    and $10
    ld d, e
    sbc $ff
    db $dd
    ret nc

    ld a, [bc]
    db $d3
    add sp, $08
    db $e4
    db $fd
    push hl
    ld b, b
    and $67
    ret nc

    ld bc, $d00e
    ld a, [bc]
    ld d, c
    ret c

    and c
    sub c
    ld sp, $5141
    pushx @ + $5143
    ret c

    and c
    sub c
    ld sp, $5141
    pushx @ + $5143
    ret c

    and c
    sub c
    ld sp, $5141
    pushx @ + $7141
    ld h, c
    ret c

    pop bc
    pushx @ + $d811
    pop bc
    ld [hl], c
    add c
    inc hl
    ld d, c
    and c
    sub c
    ld sp, $5141
    pushx @ + $5143
    ret c

    and c
    sub c
    ld sp, $5141
    pushx @ + $5143
    ret c

    and c
    sub c
    ld sp, $5141
    pushx @ + $7341
    ret c

    pop bc
    pushx @ + $d811
    pop bc
    and $57
    ld [hl], b
    and $37
    ld [hl], b
    and $57
    add b
    and $37
    add b
    and $57
    jr nz, @-$18

    scf
    jr nz, @-$18

    daa
    ret nc

    ld bc, $d024
    ld a, [bc]
    ret nc

    ld a, [bc]
    push hl
    ld b, b
    and $c7
    add sp, $08
    db $e4
    nop
    jp nc, $08df

    add e
    ldh [$df], a
    ld b, $c3
    ldh [$e6], a
    call nz, $e6c1
    rst $00
    pop bc
    and $10
    jp $c7e6


    rst $18
    ld [$e083], sp
    rst $18
    inc b
    jp $d7e0


    inc de
    inc de
    and $c4
    ld de, $c7e6
    ld de, $10e6
    inc de
    sbc $ff
    db $dd
    ret nc

    ld a, [bc]
    add sp, $07
    rst $20
    ld [bc], a
    jp hl


    ld b, b
    and $20
    pop de
    ld e, a
    ld c, l
    jr nc, jr_01c_7712

    ld e, l
    ld h, b
    ld d, b
    daa
    dec d
    jr nz, jr_01c_7709

    ld e, a
    ld c, l
    ld b, b
    and b
    ld e, l
    ld h, b
    ld b, b
    inc hl
    inc hl
    rla
    rst $20
    dec b
    rst $18
    ld c, $83
    ldh [$e7], a
    ld [bc], a
    add c
    add c
    jp hl


    ld h, b
    and $60
    add e
    rst $20
    dec b
    jp hl


    ld b, b
    and $20
    rst $18
    inc c
    add e
    ldh [$93], a
    sub e
    rst $20
    ld [bc], a
    sub c
    sub c
    jp hl


    ld h, b
    and $60
    sub e
    sbc $ff

jr_01c_7709:
    db $dd
    ret nc

    ld a, [bc]
    pop de
    rst $18
    inc b
    sub e
    sub e
    sub e

jr_01c_7712:
    sub e
    ldh [$93], a
    sub e
    sub c
    ld [hl], b
    ld [hl], b
    pushx @ + $d883
    sub e
    sub e
    sub c
    ld [hl], b
    ld [hl], b
    pushx @ + $d883
    sub e
    sub e
    sub e
    sub c
    ld [hl], b
    ld [hl], b
    sub c
    ld [hl], b
    ld [hl], b
    sub c
    ld [hl], b
    ld [hl], b
    sub b
    sub b
    ld [hl], b
    ld [hl], b
    pushx @ + $8080
    add b
    add b
    ret c

    rst $18
    inc bc
    ld de, $1101
    ld bc, $0111
    ld de, $e001
    ld de, $1101
    ld bc, $1111
    inc bc
    rst $18
    inc bc
    or c
    or c
    ld de, $b1b1
    or c
    ld de, $e0b1
    or c
    or c
    ld de, $11b1
    ld de, $de03
    rst $38
    call c, $dd11
    ret nc

    dec b
    add sp, $08
    ld [$eb0c], a
    ld bc, $00e5
    rst $18
    ld [bc], a
    call nc, $04df
    and $a7
    ld hl, $30e6
    ld hl, $e6e0
    jr nc, jr_01c_779f

    and $20
    inc hl
    rst $18
    inc bc
    and $a7
    ld hl, $30e6
    ld hl, $d8e0
    and $a7
    and c
    and $30
    and c
    and $30
    and e
    and $20
    and e
    ldh [$d0], a
    dec b
    db $d3
    push hl
    ld b, b
    and $93
    ld d, c
    add c

jr_01c_779f:
    ld d, c
    pushx @ + $d821
    ld d, c
    add c
    ld d, c
    add c
    ld d, c
    pushx @ + $d821
    ld d, c
    add c
    ld d, c
    add c
    ld d, c
    pushx @ + $d821
    ld d, c
    add c
    ld b, c
    and c
    pushx @ + $a141
    ld b, c
    ret c

    and c
    ld d, c
    add c
    ld d, c
    pushx @ + $d821
    ld d, c
    add c
    ld d, c
    add c
    ld d, c
    pushx @ + $d821
    ld d, c
    add c
    ld d, c
    pushx @ + $d821
    ld d, c
    or c
    ld d, c
    add c
    ld b, c
    and c
    pushx @ + $a141
    ld b, c
    ret c

    and c
    ld [$eb0f], a
    inc bc
    call nc, Call_000_02df
    push hl
    nop
    and $b4
    add d
    push hl
    ld b, b
    and $56
    add d
    push hl
    nop
    and $b4
    ld b, d
    push hl
    ld b, b
    and $56
    ld b, d
    ret c

    push hl
    nop
    and $b4
    jp nz, Jump_01c_40e5

    and $56
    jp nz, Jump_000_00e5

    and $b4
    add d
    push hl
    ld b, b
    and $56
    add d
    pushx @ + $00e5
    and $b4
    ld [de], a
    push hl
    ld b, b
    and $56
    ld [de], a
    push hl
    nop
    and $b4
    ld b, d
    push hl
    ld b, b
    and $56
    ld b, d
    push hl
    nop
    and $b4
    or d
    push hl
    ld b, b
    and $56
    or d
    pushx @ + $00e5
    and $b4
    ld [de], a
    push hl
    ld b, b
    and $56
    ld [de], a
    ret c

    ldh [$e5], a
    nop
    and $b5
    ld [hl], d
    push hl
    ld b, b
    and $67
    ld [hl], d
    push hl
    nop
    and $b5
    ld h, d
    push hl
    ld b, b
    and $67
    ld h, d
    push hl
    nop
    and $b5
    ld [hl+], a
    push hl
    ld b, b
    and $67
    ld [hl+], a
    ret c

    push hl
    nop
    and $b5
    ld h, d
    push hl
    ld b, b
    and $67
    ld h, d
    push hl
    nop
    and $b5
    ld [hl], d
    push hl
    ld b, b
    and $67
    ld [hl], d
    push hl
    nop
    and $b5
    and d
    push hl
    ld b, b
    and $67
    and d
    pushx @ + $e5d7
    nop
    and $b5
    ld d, d
    push hl
    ld b, b
    and $67
    ld d, d
    push hl
    nop
    and $b5
    ld [hl], d
    push hl
    ld b, b
    and $67
    ld [hl], d
    ret c

    push hl
    nop
    and $b5
    sub d
    push hl
    ld b, b
    and $67
    jp nz, Jump_000_00e5

    and $b5
    ld h, d
    push hl
    ld b, b
    and $67
    ld h, d
    push hl
    nop
    and $b5
    ld [hl], d
    push hl
    ld b, b
    and $67
    ld [hl], d
    push hl
    nop
    and $b5
    ld [hl+], a
    push hl
    ld b, b
    and $67
    ld [hl+], a
    ret c

    push hl
    nop
    and $b5
    sub d
    push hl
    ld b, b
    and $67
    sub d
    push hl
    nop
    and $b5
    and d
    push hl
    ld b, b
    and $67
    and d
    pushx @ + $e5d7
    nop
    and $b5
    ld d, d
    push hl
    ld b, b
    and $67
    ld d, d
    push hl
    nop
    and $b5
    ld [hl], d
    push hl
    ld b, b
    and $67
    ld [hl], d
    ret c

    push hl
    nop
    and $b5
    ld [$eb0c], a
    ld bc, $02df
    ld h, c
    ret c

    ld h, c
    pushx @ + $2161
    ret c

    ld hl, $21d7
    ret c

    and c
    ret c

    and c
    pushx @ + $61a1
    ret c

    ld h, c
    pushx @ + $b161
    ret c

    or c
    pushx @ + $d7b1
    ld hl, $21d8
    pushx @ + $9121
    ret c

    sub c

jr_01c_790e:
    pushx @ + $b191
    ret c

    or c
    pushx @ + $e0b1
    rst $18
    ld [bc], a
    ld d, c
    ret c

    ld d, c
    pushx @ + $7151
    ret c

    ld [hl], c
    pushx @ + $8171
    ret c

    add c
    pushx @ + $4181
    ret c

    ld b, c
    pushx @ + $5141
    ret c

    ld d, c
    pushx @ + $c151
    ret c

    pop bc
    pushx @ + $31c1
    ret c

    ld sp, $31d7
    ld hl, $21d8
    pushx @ + $e021
    sbc $ff
    db $dd
    ret nc

    dec b
    push hl
    ld b, b
    add sp, $08
    db $e4
    nop
    db $d3
    rst $18
    ld [bc], a
    rst $18
    inc b
    and $a7
    or c
    and $30
    or c
    ldh [$e6], a
    jr nz, jr_01c_790e

    and $10
    or e
    rst $18
    inc bc
    and $a7
    or c
    and $30
    or c
    ldh [$e6], a
    and a
    add c
    and $30
    add c
    and $20
    add e
    and $10
    add e
    ldh [$e5], a
    nop
    add sp, $08
    rst $18
    ld [bc], a
    call nc, $04df
    and $d3
    ld hl, $e6d8
    ld d, h
    or c
    pushx @ + $e6e0
    jr nc, jr_01c_79aa

    ret c

    or c
    pushx @ + $20e6
    ld hl, $b1d8
    call nc, $03df
    and $d3
    ld hl, $e6d8
    ld d, h
    or c
    pushx @ + $d3e0
    and $d3
    and c
    and $54
    add c
    and $30
    and c
    add c
    and $20

jr_01c_79aa:
    and c
    add c
    ldh [$d4], a
    push hl
    add b
    and $54
    rst $18
    ld [bc], a
    ld de, $8141
    or c
    add c
    ld b, c
    ld de, $8141
    pop bc
    add c
    ld b, c
    ld de, $c181
    pushx @ + $d831
    pop bc
    add c
    pushx @ + $d821
    or c
    ld [hl], c
    pushx @ + $1141
    ret c

    sub c
    ldh [$df], a
    ld [bc], a
    ld [hl], c
    and c
    pushx @ + $6121
    ld hl, $a1d8
    ld [hl], c
    and c
    pushx @ + $6121
    ld hl, $a1d8
    ld [hl], c
    pushx @ + $6121
    sub c
    ld h, c
    ld hl, $5181
    ld de, $71a1
    ld sp, $e0d8
    ret nc

    dec b
    push hl
    ld b, b
    and $63
    add sp, $08
    db $e4
    rst $38
    push de
    nop
    ld h, c
    ret c

    ld h, c
    pushx @ + $2161
    ret c

    ld hl, $21d7
    ret c

    and c
    ret c

    and c
    pushx @ + $61a1
    ret c

    ld h, c
    pushx @ + $d960
    ld h, b
    or c
    ret c

    or c
    pushx @ + $d7b1
    ld hl, $21d8
    pushx @ + $9121
    ret c

    sub c
    pushx @ + $b191
    ret c

    or c
    pushx @ + $d9b0
    or b
    ld h, c
    ret c

    ld h, c
    pushx @ + $2161
    ret c

    ld hl, $21d7
    ret c

    and c
    ret c

    and c
    pushx @ + $61a1
    ret c

    ld h, c
    pushx @ + $d960
    ld h, b
    or c
    ret c

    or c
    pushx @ + $d7b1
    ld hl, $21d8
    pushx @ + $9121
    ret c

    sub c
    pushx @ + $b191
    ret c

    or c
    pushx @ + $d9b0
    or b
    ld d, c
    ret c

    ld d, c
    pushx @ + $7151
    ret c

    ld [hl], c
    pushx @ + $8171
    ret c

    add c
    pushx @ + $4181
    ret c

    ld b, c
    pushx @ + $d940
    ld b, b
    ld d, c
    ret c

    ld d, c
    pushx @ + $c151
    ret c

    pop bc
    pushx @ + $31c1
    ret c

    ld sp, $31d7
    ld hl, $21d8
    pushx @ + $d920
    jr nz, jr_01c_7ada

    ret c

    ld d, c
    pushx @ + $7151
    ret c

    ld [hl], c
    pushx @ + $8171
    ret c

    add c
    pushx @ + $4181
    ret c

    ld b, c
    pushx @ + $d940
    ld b, b
    ld d, c
    ret c

    ld d, c
    pushx @ + $c151
    ret c

    pop bc
    pushx @ + $31c1
    ret c

    ld sp, $31d7
    ld hl, $21d8
    pushx @ + $de20
    rst $38
    call c, $dd11
    ret nc

    dec b
    rst $20
    ld bc, $60e9
    and $20
    pop de
    add sp, $07
    rst $18
    inc b
    and $20
    ld d, c
    and $60
    ld d, c
    rst $18
    ld [bc], a
    and $20
    ld d, c
    or c
    ld d, c
    ld hl, $e651
    ld h, b
    ld d, c
    ldh [$e6], a
    jr nz, jr_01c_7b2b

jr_01c_7ada:
    or c
    ld d, c
    ld hl, $8535
    ldh [$e8], a
    rlca
    rst $18
    ld [bc], a
    dec d
    dec d
    dec d
    dec d
    dec d
    dec d
    sub l
    or l
    ldh [$df], a
    ld [bc], a
    ld [hl], l
    ld [hl], l
    ld [hl], l
    ld [hl], l
    ld [hl], l
    ld [hl], l
    pushx @ + $5535
    ret c

    ldh [$e8], a
    ld [$02df], sp
    and $20
    or c
    ld h, c
    or c
    pushx @ + $e621
    ld h, b
    ld hl, $dfd8
    ld [bc], a
    and $20
    or c
    or c
    ld h, c
    or c
    pushx @ + $e621
    ld h, b
    ld hl, $e0d8
    and $20
    or c
    ld [hl], c
    ld [hl], c
    ld [hl], c
    sub c
    sub c
    sub c
    ldh [$df], a
    ld [bc], a
    and $20
    ld d, c
    pop bc
    pushx @ + $8151

jr_01c_7b2b:
    and $60
    add c
    rst $18
    ld [bc], a
    and $20
    ld d, c
    ret c

    ld d, c
    pop bc
    pushx @ + $8151
    and $60
    add c
    ldh [$e6], a
    jr nz, @+$53

    ld de, $1111
    ld sp, $3131
    ret c

    ldh [$de], a
    rst $38
    db $dd
    ret nc

    dec b
    pop de
    rst $18
    inc bc
    ld de, $1171
    ld sp, $7111
    ld de, $1171
    ld sp, $7111
    ld de, $1171
    ld sp, $7111
    ld de, $7131
    ld sp, $9111
    ldh [rNR11], a
    ld [hl], c
    ld de, $1131
    ld [hl], c
    ld de, $1171
    ld sp, $7111
    ld de, $1171
    ld sp, $7111
    ld [hl], c
    pushx @ + $a3c3
    add c
    ret c

    rst $18
    inc bc
    ld de, $7171
    sub c
    ld [hl], c
    ld [hl], c
    ld de, $7171
    sub c
    ld [hl], c
    ld [hl], c
    ld de, $7171
    sub c
    ld [hl], c
    ld [hl], c
    ld de, $7111
    ld sp, $3131
    ldh [rNR11], a
    ld [hl], c
    ld [hl], c
    sub c
    ld [hl], c
    ld [hl], c
    ld de, $7171
    sub c
    ld [hl], c
    ld [hl], c
    ld de, $7171
    sub c
    ld [hl], c
    ld [hl], c
    ld sp, $d711
    ret nz

    ret nz

    pop bc
    and c
    add c
    ret c

    rst $18
    inc bc
    ld de, $7171
    sub c
    ld [hl], c
    ld [hl], c
    ld de, $7171
    sub c
    ld [hl], c
    ld [hl], c
    ld de, $7171
    sub c
    ld [hl], c
    ld [hl], c
    ld de, $7111
    ld sp, $3131
    ldh [rNR11], a
    ld [hl], c
    ld [hl], c
    sub c
    ld [hl], c
    ld [hl], c
    ld de, $7171
    sub c
    ld [hl], c
    ld [hl], c
    ld de, $7171
    sub c
    ld [hl], c
    ld [hl], c
    ld de, $9131
    ld sp, $3191
    sbc $ff
    sub c
    ld sp, $ffde
    ld de, $7171
    sub c
    ld [hl], c
    ld [hl], c
    ld de, $7171
    sub c
    ld [hl], c
    ld [hl], c
    ld de, $9131
    ld sp, $0000
