; Disassembly of "Nectaris GB (Japan) (SGB Enhanced).gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

SECTION "nectaris/audio1: Audio 1", ROMX

AudioTraps::
.stop::
    jp TrapAudioStop
.unknown::
    jp TrapAudioUnknown
.playMusic::
    jp TrapAudioPlayMusic
.playSound::
    jp TrapAudioPlaySound
.silence::
    jp TrapAudioSilence
.getMusic::
    jp TrapAudioGetMusic
.getSound::
    jp TrapAudioGetSound
.pause::
    jp TrapAudioPause
.setVolume::
    jp TrapAudioSetVolume
.unknown2::
    jp TrapAudioUnknown2
.unknown3::
    jp TrapAudioUnknown3


TrapAudioPlayMusic:
    push hl
    ld hl, MusicTable.size
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


TrapAudioPlaySound:
    push bc
    push hl
    ld b, $00
    ld c, a
    or a
    jr z, jr_01c_404e

    ld hl, data_01c_51bf
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


TrapAudioSilence:
    ld [$df00], a
    ret


TrapAudioGetMusic:
    ld a, [$de90]
    cp $80
    ld a, $01
    ret nz

    xor a
    ret


TrapAudioGetSound:
    ld a, [$de92]
    cp $80
    ld a, $01
    ret nz

    xor a
    ret


TrapAudioPause:
    ld a, [$df02]
    xor $01
    ld [$df02], a
    ret


TrapAudioSetVolume:
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


TrapAudioStop:
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
    ld hl, data_01c_4c11
    ld bc, $df03
    ld d, $08

jr_01c_40ed:
    ld a, [hl+]
    ld [bc], a
    inc bc
    dec d
    jr nz, jr_01c_40ed

    ret


TrapAudioUnknown:
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
    ld hl, MusicTable.banks
    add hl, bc
    ld a, [hl]
    ld [$de91], a
    ldh [$80], a
    ld [$2000], a
    pop af
    add a
    ld c, a
    ld b, $00
    ld hl, MusicTable.addrs
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
    ld a, [data_01c_4c11]
    ld [$df03], a
    ld a, [data_01c_4c12]
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
    ld a, [data_01c_4c13]
    ld [$df05], a
    ld a, [data_01c_4c14]
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
    ld a, [data_01c_4c15]
    ld [$df07], a
    ld a, [data_01c_4c16]
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
    ld a, [data_01c_4c17]
    ld [$df09], a
    ld a, [data_01c_4c18]
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
    ld hl, data_01c_4437
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld h, d
    ld l, e
    pop af
    jp hl


data_01c_4437:
    dw Jump_01c_45a2
    dw Jump_01c_45ad
    dw Jump_01c_45ad
    dw Jump_01c_45ad
    dw Jump_01c_45ad
    dw Jump_01c_45ad
    dw Jump_01c_45ad
    dw Jump_01c_45c5
    dw Jump_01c_45cd
    dw Jump_01c_45d5
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_45de
    dw Jump_01c_45f9
    dw Jump_01c_4607
    dw Jump_01c_4613
    dw Jump_01c_4628
    dw Jump_01c_4642
    dw Jump_01c_4649
    dw Jump_01c_4660
    dw Jump_01c_4671
    dw Jump_01c_467e
    dw Jump_01c_468b
    dw Jump_01c_4698
    dw Jump_01c_46a8
    dw Jump_01c_46b5
    dw Jump_01c_46c2
    dw Jump_01c_46d4
    dw Jump_01c_46e1
    dw Jump_01c_46ee
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_46fc
    dw Jump_01c_46fc


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
    ld hl, data_01c_4d6d
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
    ld hl, data_01c_4c19
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
    ld hl, data_01c_4c21
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


Jump_01c_45a2:
    pop hl
    ld a, [hl+]
    push hl
    ld hl, $dedf
    add hl, bc
    ld [hl], a
    jp Jump_01c_4718


Jump_01c_45ad:
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


Jump_01c_45c5:
    ld hl, $debf
    add hl, bc
    inc [hl]
    jp Jump_01c_4718


Jump_01c_45cd:
    ld hl, $debf
    add hl, bc
    dec [hl]
    jp Jump_01c_4718


Jump_01c_45d5:
    ld hl, $dea1
    add hl, bc
    ld [hl], $80
    jp Jump_01c_4718


Jump_01c_45de:
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


Jump_01c_45f9:
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


Jump_01c_4607:
    pop hl
    ld hl, $dead
    add hl, bc
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp Jump_01c_441f


Jump_01c_4613:
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


Jump_01c_4628:
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


Jump_01c_4642:
    pop hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp Jump_01c_441f


Jump_01c_4649:
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


Jump_01c_4660:
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


Jump_01c_4671:
    pop de
    ld a, [de]
    inc de
    ld hl, $defa
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


Jump_01c_467e:
    pop de
    ld a, [de]
    inc de
    ld hl, $de96
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


Jump_01c_468b:
    pop de
    ld a, [de]
    inc de
    ld hl, $def7
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


Jump_01c_4698:
    pop de
    ld a, [de]
    inc de
    ld [$de9a], a
    ld a, $01
    ld [$de9b], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


Jump_01c_46a8:
    pop de
    ld a, [de]
    inc de
    ld hl, $decf
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


Jump_01c_46b5:
    pop de
    ld a, [de]
    inc de
    ld hl, $ded7
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


Jump_01c_46c2:
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


Jump_01c_46d4:
    pop de
    ld a, [de]
    inc de
    ld hl, $deef
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


Jump_01c_46e1:
    pop de
    ld a, [de]
    inc de
    ld hl, $dedb
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_01c_441f


Jump_01c_46ee:
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


Jump_01c_46fc:
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
    ld hl, data_01c_4ccb
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
    ld hl, data_01c_502b
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


TrapAudioUnknown2:
    call Call_01c_4975
    call Call_01c_49cd
    call Call_01c_4156
    ret


TrapAudioUnknown3:
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


data_01c_4c11:
    db $0b
data_01c_4c12:
    db $df
data_01c_4c13:
    db $17
data_01c_4c14:
    db $df
data_01c_4c15:
    db $23
data_01c_4c16:
    db $df
data_01c_4c17:
    db $2f
data_01c_4c18:
    db $df
data_01c_4c19:
    db $00, $18, $30, $48, $60, $78, $90, $a8

data_01c_4c21:
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

data_01c_4ccb:
    dw data_01c_4cdd
    dw data_01c_4ced
    dw data_01c_4cfd
    dw data_01c_4d0d
    dw data_01c_4d1d
    dw data_01c_4d2d
    dw data_01c_4d3d
    dw data_01c_4d4d
    dw data_01c_4d5d

data_01c_4cdd:
    db $7a, $df, $ff, $da, $74, $10, $00, $14, $7a, $df, $ff, $da, $74, $10, $00, $14
data_01c_4ced:
    db $12, $23, $33, $44, $55, $66, $77, $77, $78, $89, $9a, $ab, $bb, $cc, $dd, $ee
data_01c_4cfd:
    db $bb, $bb, $bb, $dd, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
data_01c_4d0d:
    db $79, $bd, $ff, $ff, $ff, $ff, $fd, $b9, $75, $31, $00, $00, $00, $00, $01, $35
data_01c_4d1d:
    db $79, $ce, $ee, $c9, $74, $21, $11, $24, $79, $ce, $ee, $c9, $74, $21, $11, $24
data_01c_4d2d:
    db $aa, $aa, $aa, $cc, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11
data_01c_4d3d:
    db $aa, $aa, $aa, $cc, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22
data_01c_4d4d:
    db $79, $bd, $dd, $b9, $75, $32, $11, $35, $79, $bd, $dd, $b9, $75, $32, $11, $35
data_01c_4d5d:
    db $99, $99, $99, $bb, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33

data_01c_4d6d:
    dw data_01c_4db5
    dw data_01c_4dbd
    dw data_01c_4dc4
    dw data_01c_4dce
    dw data_01c_4dd7
    dw data_01c_4de0
    dw data_01c_4de8
    dw data_01c_4def
    dw data_01c_4df6
    dw data_01c_4dfd
    dw data_01c_4e1f
    dw data_01c_4e41
    dw data_01c_4e63
    dw data_01c_4e8d
    dw data_01c_4ea0
    dw data_01c_4eaa
    dw data_01c_4ecc
    dw data_01c_4ed3
    dw data_01c_4eda
    dw data_01c_4ef5
    dw data_01c_4f0d
    dw data_01c_4f28
    dw data_01c_4f40
    dw data_01c_4f58
    dw data_01c_4f6e
    dw data_01c_4f75
    dw data_01c_4f7c
    dw data_01c_4f82
    dw data_01c_4f89
    dw data_01c_4f90
    dw data_01c_4f97
    dw data_01c_4fb2
    dw data_01c_4fca
    dw data_01c_4fe5
    dw data_01c_4ffd
    dw data_01c_5015

data_01c_4db5:
    db $88, $32, $d2, $c0, $36, $47, $67, $ff
data_01c_4dbd:
    db $88, $32, $81, $c0, $36, $47, $ff
data_01c_4dc4:
    db $88, $24, $a1, $80, $47, $33, $22, $11, $06, $ff
data_01c_4dce:
    db $88, $1e, $82, $80, $47, $33, $06, $04, $ff
data_01c_4dd7:
    db $88, $1e, $72, $80, $47, $33, $06, $04, $ff
data_01c_4de0:
    db $88, $f7, $d1, $80, $08, $08, $08, $ff
data_01c_4de8:
    db $88, $32, $e1, $80, $00, $01, $ff
data_01c_4def:
    db $88, $32, $f1, $80, $00, $01, $ff
data_01c_4df6:
    db $88, $32, $a1, $c0, $00, $01, $ff
data_01c_4dfd:
    db $88, $00, $d3
    db $80, $02, $00, $01, $00, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01
    db $02, $01, $02, $03, $02, $03, $02, $03, $02, $03, $02, $03, $02, $03, $ff
data_01c_4e1f:
    db $88
    db $00, $a2, $80, $02, $00, $01, $00, $01, $02, $01, $02, $01, $02, $01, $02, $01
    db $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01
    db $ff
data_01c_4e41:
    db $88, $00, $82, $80, $02, $00, $01, $00, $01, $02, $01, $02, $01, $02, $01
    db $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01
    db $02, $01, $ff
data_01c_4e63:
    db $88, $32, $75, $80, $25, $14, $25, $14, $25, $24, $42, $24, $42
    db $24, $42, $24, $42, $24, $43, $24, $43, $24, $43, $34, $43, $34, $43, $34, $43
    db $34, $43, $34, $43, $34, $44, $34, $44, $34, $44, $34, $44, $ff
data_01c_4e8d:
    db $88, $0a, $81
    db $80, $29, $1a, $1c, $1d, $1c, $1e, $1c, $1d, $1c, $1e, $1c, $1d, $1c, $1e, $ff
data_01c_4ea0:
    db $88, $32, $61, $c0, $00, $01, $00, $01, $00, $ff
data_01c_4eaa:
    db $88, $00, $c2, $80, $02, $00
    db $01, $00, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02
    db $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $ff
data_01c_4ecc:
    db $88, $32, $c1, $c0, $36, $47, $ff
data_01c_4ed3:
    db $88, $32, $c1, $c0, $36, $47, $ff
data_01c_4eda:
    db $88, $0a, $72, $80, $29, $2a
    db $2c, $2d, $2c, $2e, $2c, $2d, $2c, $2e, $2c, $2d, $2c, $2e, $2c, $2d, $2c, $2e
    db $2c, $2d, $2c, $2e, $ff
data_01c_4ef5:
    db $88, $01, $91, $80, $24, $25, $26, $25, $26, $25, $26
    db $25, $26, $25, $26, $25, $26, $25, $26, $25, $26, $25, $26, $ff
data_01c_4f0d:
    db $88, $0a, $62
    db $80, $29, $1a, $1c, $1d, $1c, $1e, $1c, $1d, $1c, $1e, $1c, $1d, $1c, $1e, $1c
    db $1d, $1c, $1e, $1c, $1d, $1c, $1e, $ff
data_01c_4f28:
    db $88, $01, $91, $80, $24, $25, $26, $25
    db $26, $25, $26, $25, $26, $25, $26, $25, $26, $25, $26, $25, $26, $25, $26, $ff
data_01c_4f40:
    db $88, $0a, $62, $80, $28, $19, $1a, $19, $1b, $19, $1a, $19, $1b, $19, $1a, $19
    db $1b, $19, $1a, $19, $1b, $19, $1a, $ff
data_01c_4f58:
    db $88, $01, $81, $80, $21, $23, $24, $23
    db $24, $23, $24, $23, $24, $23, $24, $23, $24, $23, $24, $23, $24, $ff
data_01c_4f6e:
    db $88, $32, $75, $80, $25, $14, $ff
data_01c_4f75:
    db $88, $0a, $81, $80, $29, $1a, $ff
data_01c_4f7c:
    db $88, $32, $61, $c0, $00, $ff
data_01c_4f82:
    db $88, $00, $c2, $80, $02, $00, $ff
data_01c_4f89:
    db $88, $32, $c1, $c0, $36, $47, $ff
data_01c_4f90:
    db $88, $32, $c1, $c0, $36, $47, $ff
data_01c_4f97:
    db $88, $0a, $72, $80, $29, $2a, $2c, $2d, $2c
    db $2e, $2c, $2d, $2c, $2e, $2c, $2d, $2c, $2e, $2c, $2d, $2c, $2e, $2c, $2d, $2c
    db $2e, $ff
data_01c_4fb2:
    db $88, $01, $b1, $80, $24, $25, $26, $25, $26, $25, $26, $25, $26, $25
    db $26, $25, $26, $25, $26, $25, $26, $25, $26, $ff
data_01c_4fca:
    db $88, $0a, $62, $80, $29, $1a
    db $1c, $1d, $1c, $1e, $1c, $1d, $1c, $1e, $1c, $1d, $1c, $1e, $1c, $1d, $1c, $1e
    db $1c, $1d, $1c, $1e, $ff
data_01c_4fe5:
    db $88, $01, $b1, $80, $24, $25, $26, $25, $26, $25, $26
    db $25, $26, $25, $26, $25, $26, $25, $26, $25, $26, $25, $26, $ff
data_01c_4ffd:
    db $88, $0a, $62
    db $80, $28, $19, $1a, $19, $1b, $19, $1a, $19, $1b, $19, $1a, $19, $1b, $19, $1a
    db $19, $1b, $19, $1a, $ff
data_01c_5015:
    db $88, $01, $b1, $80, $21, $23, $24, $23, $24, $23, $24
    db $23, $24, $23, $24, $23, $24, $23, $24, $23, $24, $ff

data_01c_502b:
    dw data_01c_504b
    dw data_01c_504e
    dw data_01c_5054
    dw data_01c_507e
    dw data_01c_5092
    dw data_01c_509a
    dw data_01c_50a6
    dw data_01c_50b0
    dw data_01c_50c4
    dw data_01c_50cc
    dw data_01c_50d9
    dw data_01c_50e0
    dw data_01c_50f0
    dw data_01c_50f4
    dw data_01c_5102
    dw data_01c_5110

data_01c_504b:
    db $00, $80, $80
data_01c_504e:
    db $03, $00, $fd, $00, $80, $80
data_01c_5054:
    db $01, $01, $01, $01, $02, $02, $02, $02, $01, $01, $01, $01
    db $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $fe, $fe, $fe, $fe
    db $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $80, $80
data_01c_507e:
    db $01, $02
    db $04, $07, $04, $02, $01, $00, $00, $ff, $fe, $fd, $fc, $fd, $fe, $ff, $00, $00
    db $80, $80
data_01c_5092:
    db $01, $00, $00, $ff, $00, $00, $80, $80
data_01c_509a:
    db $01, $00, $00, $00, $00, $ff, $00, $00, $00, $00, $80, $80
data_01c_50a6:
    db $01, $02, $01, $00, $ff, $fe, $ff, $00, $80, $80
data_01c_50b0:
    db $01, $02, $03, $02, $01, $00, $00, $00, $00, $ff, $fe, $fd, $fe, $ff, $00, $00
    db $00, $00, $80, $80
data_01c_50c4:
    db $fb, $fe, $08, $05, $02, $00, $80, $00
data_01c_50cc:
    db $01, $02, $03, $02, $01, $00, $00, $fe, $ff, $00, $00, $80, $80
data_01c_50d9:
    db $fd, $07, $03, $01, $00, $80, $00
data_01c_50e0:
    db $04, $02, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $09
data_01c_50f0:
    db $02, $00, $80, $00
data_01c_50f4:
    db $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $09
data_01c_5102:
    db $fd, $fe, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $04
data_01c_5110:
    db $ff, $00, $00, $00, $01, $00, $00, $00, $80, $80

MusicTable:
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
    dw data_01c_5154
    dw data_01c_5155
    dw data_01c_515e
    dw data_01c_5167
    dw data_01c_5170
    dw data_01c_5179
    dw data_01c_5182
    dw data_01c_5189
    dw data_01c_5192
    dw data_01c_519b
    dw data_01c_51a4
    dw data_01c_51ad
    dw data_01c_51b6
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0

data_01c_5154::
    db $00

data_01c_5155::
    db $0f
    dw data_01c_51ef
    dw data_01c_525e
    dw data_01c_5346
    dw data_01c_53c9

data_01c_515e::
    db $0f
    dw data_01c_53e6
    dw data_01c_540c
    dw data_01c_5489
    dw data_01c_54c9

data_01c_5167::
    db $0f
    dw data_01c_54dd
    dw data_01c_5661
    dw data_01c_57c1
    dw data_01c_58c9

data_01c_5170::
    db $0f
    dw data_01c_598a
    dw data_01c_59d9
    dw data_01c_5a11
    dw data_01c_5a7c

data_01c_5179::
    db $0f
    dw data_01c_5a97
    dw data_01c_5b8e
    dw data_01c_5c42
    dw data_01c_5cbb

data_01c_5182::
    db $07
    dw data_01c_5ce5
    dw data_01c_5d1f
    dw data_01c_5d56

data_01c_5189::
    db $0f
    dw data_01c_5d86
    dw data_01c_5f8f
    dw data_01c_619d
    dw data_01c_61f9

data_01c_5192::
    db $0f
    dw data_01c_628e
    dw data_01c_64ab
    dw data_01c_664b
    dw data_01c_67a5

data_01c_519b::
    db $0f
    dw data_01c_6881
    dw data_01c_6a4e
    dw data_01c_6bff
    dw data_01c_6d56

data_01c_51a4::
    db $0f
    dw data_01c_6e4f
    dw data_01c_703b
    dw data_01c_7336
    dw data_01c_74bd

data_01c_51ad::
    db $0f
    dw data_01c_754a
    dw data_01c_761d
    dw data_01c_76c2
    dw data_01c_7709

data_01c_51b6::
    db $0f
    dw data_01c_7760
    dw data_01c_7943
    dw data_01c_7ab4
    dw data_01c_7b4a

data_01c_51bf:
    db $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c
    db $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c
    db $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c, $3c

data_01c_51ef:
    db $d0
    db $06, $ea, $09, $eb, $15, $d3, $e5, $40, $e6, $70, $a5, $99, $d9, $97, $73, $93
    db $a3, $c1, $99, $d9, $97, $e6, $5d, $a3, $e6, $5c, $c3, $e5, $00, $e6, $b0, $13
    db $31, $d8, $c3, $d7, $e6, $7b, $11, $31, $41, $e6, $b0, $63, $71, $e6, $b6, $43
    db $e6, $8c, $61, $71, $e6, $9b, $91, $e6, $90, $af, $d7, $e5, $80, $e6, $50, $d0
    db $01, $72, $82, $92, $a2, $d0, $06, $01, $dd, $d0, $06, $ea, $07, $eb, $0f, $d2
    db $e5, $c0, $e6, $c7, $77, $d7, $17, $d8, $77, $d7, $17, $d8, $67, $c7, $67, $c7
    db $77, $d7, $17, $d8, $77, $d7, $17, $d8, $67, $c7, $67, $c7, $de, $ff

data_01c_525e:
    db $d0, $06
    db $d3, $e5, $40, $e6, $70, $55, $49, $d9, $47, $23, $43, $53, $71, $49, $d9, $47
    db $53, $73, $d0, $06, $d4, $e5, $40, $e6, $64, $10, $40, $80, $c0, $d7, $30, $d8
    db $c0, $80, $40, $10, $40, $80, $c0, $d7, $30, $d8, $c0, $80, $40, $40, $70, $b0
    db $d7, $30, $60, $30, $d8, $b0, $70, $40, $70, $b0, $d7, $30, $60, $30, $d8, $b0
    db $70, $d7, $a0, $40, $d8, $70, $d8, $60, $d7, $70, $d7, $40, $a0, $40, $a0, $40
    db $d8, $70, $d8, $60, $d7, $70, $d7, $40, $a0, $40, $d8, $e5, $80, $e6, $50, $d0
    db $01, $a2, $42, $72, $d7, $a2, $d0, $06, $01, $dd, $d0, $01, $e5, $40, $d4, $e8
    db $08, $df, $0a, $e6, $67, $c3, $e6, $20, $c1, $e6, $67, $c4, $e6, $20, $c6, $e0
    db $e6, $67, $c3, $e6, $20, $c1, $e6, $67, $c4, $e6, $20, $c0, $df, $0a, $e6, $67
    db $b3, $e6, $20, $b1, $e6, $67, $b4, $e6, $20, $b6, $e0, $e6, $67, $b3, $e6, $20
    db $b1, $e6, $67, $b4, $e6, $20, $b0, $df, $04, $e6, $67, $c3, $e6, $20, $c1, $e6
    db $67, $c4, $e6, $20, $c6, $e0, $df, $05, $e6, $67, $c3, $e6, $20, $c1, $e6, $67
    db $c4, $e6, $20, $c6, $e0, $e6, $67, $c3, $e6, $20, $c1, $d0, $06, $e6, $46, $c3
    db $e6, $65, $b1, $d0, $01, $df, $0a, $e6, $67, $b3, $e6, $20, $b1, $e6, $67, $b4
    db $e6, $20, $b6, $e0, $de, $ff

data_01c_5346:
    db $d0, $06, $e8, $07, $e7, $02, $e9, $60, $e6, $20
    db $d1, $a1, $a1, $a1, $91, $91, $91, $91, $91, $91, $91, $91, $91, $71, $71, $91
    db $91, $a1, $a1, $c1, $91, $91, $91, $91, $91, $91, $91, $91, $91, $a1, $a1, $c1
    db $c1, $d7, $df, $08, $11, $e0, $df, $08, $41, $e0, $df, $08, $61, $e0, $e8, $08
    db $d0, $01, $32, $42, $52, $62, $d0, $06, $e9, $60, $e6, $60, $61, $dd, $d0, $06
    db $d1, $e8, $07, $e9, $60, $e6, $20, $31, $31, $31, $31, $31, $31, $df, $08, $31
    db $e0, $31, $31, $21, $21, $21, $21, $21, $21, $df, $08, $21, $e0, $21, $21, $31
    db $31, $31, $31, $31, $31, $df, $08, $31, $e0, $31, $31, $21, $21, $21, $21, $21
    db $21, $df, $08, $21, $e0, $21, $21, $de, $ff

data_01c_53c9:
    db $d0, $06, $d1, $df, $1c, $10, $70
    db $70, $70, $e0, $a1, $01, $dd, $df, $03, $70, $90, $70, $90, $e0, $df, $1d, $70
    db $90, $70, $90, $e0, $de, $ff

data_01c_53e6:
    db $dd, $d0, $06, $ea, $07, $eb, $0f, $d2, $e5, $c0
    db $e6, $c7, $77, $d7, $17, $d8, $77, $d7, $17, $d8, $67, $c7, $67, $c7, $77, $d7
    db $17, $d8, $77, $d7, $17, $d8, $67, $c7, $67, $c7, $de, $ff

data_01c_540c:
    db $dd, $d0, $01, $e5
    db $40, $e8, $08, $d4, $df, $0a, $e6, $67, $c3, $e6, $20, $c1, $e6, $67, $c4, $e6
    db $20, $c6, $e0, $e6, $67, $c3, $e6, $20, $c1, $e6, $67, $c4, $e6, $20, $c0, $df
    db $0a, $e6, $67, $b3, $e6, $20, $b1, $e6, $67, $b4, $e6, $20, $b6, $e0, $e6, $67
    db $b3, $e6, $20, $b1, $e6, $67, $b4, $e6, $20, $b0, $df, $04, $e6, $67, $c3, $e6
    db $20, $c1, $e6, $67, $c4, $e6, $20, $c6, $e0, $df, $05, $e6, $67, $c3, $e6, $20
    db $c1, $e6, $67, $c4, $e6, $20, $c6, $e0, $e6, $67, $c3, $e6, $20, $c1, $d0, $06
    db $e6, $46, $c3, $e6, $65, $b1, $d0, $01, $df, $0a, $e6, $67, $b3, $e6, $20, $b1
    db $e6, $67, $b4, $e6, $20, $b6, $e0, $de, $ff

data_01c_5489:
    db $d0, $06, $e8, $07, $e7, $02, $e9
    db $60, $e6, $20, $d1, $dd, $d0, $06, $31, $31, $31, $31, $31, $31, $df, $08, $31
    db $e0, $31, $31, $21, $21, $21, $21, $21, $21, $df, $08, $21, $e0, $21, $21, $31
    db $31, $31, $31, $31, $31, $df, $08, $31, $e0, $31, $31, $21, $21, $21, $21, $21
    db $21, $df, $08, $21, $e0, $21, $21, $de, $ff

data_01c_54c9:
    db $d0, $06, $d1, $dd, $df, $03, $70
    db $90, $70, $90, $e0, $df, $1d, $70, $90, $70, $90, $e0, $de, $ff

data_01c_54dd:
    db $d0, $08, $ea
    db $06, $eb, $01, $d4, $e5, $80, $e8, $08, $e6, $70, $21, $e6, $60, $27, $e6, $50
    db $21, $e6, $47, $23, $e6, $10, $21, $e6, $90, $e8, $07, $21, $21, $21, $e6, $20
    db $e8, $08, $24, $e6, $10, $e8, $08, $22, $d0, $08, $ea, $0c, $eb, $01, $e5, $c0
    db $e6, $a7, $e8, $08, $d2, $01, $df, $04, $e6, $a7, $81, $d7, $31, $e6, $30, $31
    db $d8, $e0, $d0, $02, $e5, $40, $e6, $50, $d1, $e4, $ff

    db $1f, $b7, $d7, $17, $d8
    db $d0, $08, $e4, $00, $ea, $0c, $eb, $01, $e5, $c0, $e6, $a7, $e8, $08, $d2, $df
    db $04, $e6, $a7, $c1, $d7, $71, $e6, $30, $71, $d8, $e0, $d0, $02, $e5, $40, $e6
    db $50, $d1, $e4, $ff

    db $5b, $d7, $e6, $70, $37, $53, $d8, $d0, $08, $ea, $0c, $eb
    db $01, $e5, $c0, $e6, $a7, $e8, $08, $d2, $01, $df, $04, $e6, $a7, $81, $d7, $31
    db $e6, $30, $31, $d8, $e0, $d0, $02, $e5, $40, $e6, $50, $d1, $e4, $ff

    db $1f, $b7
    db $d7, $17, $d8, $d0, $08, $e4, $00, $ea, $0c, $eb, $01, $e5, $c0, $e6, $a7, $e8
    db $08, $d2, $df, $04, $e6, $a7, $c1, $d7, $71, $e6, $30, $71, $d8, $e0, $d0, $08
    db $e5, $40, $e6, $30, $d2, $e4, $ff

    db $00, $41, $d8, $b1, $60, $d0, $08, $e4, $00
    db $ea, $0e, $eb, $01, $d2, $e5, $80, $e6, $97, $e6, $96, $a1, $c1, $d7, $11, $e6
    db $97, $c3, $d7, $13, $d8, $c3, $a3, $c3, $d7, $e6, $96, $11, $d8, $c1, $a1, $e6
    db $90, $53, $e6, $97, $57, $e6, $96, $a1, $e6, $90, $33, $e6, $97, $39, $e6, $96
    db $11, $e6, $90, $33, $e6, $97, $39, $e6, $96, $81, $e6, $90, $13, $e6, $97, $17
    db $d8, $e6, $96, $a1, $d7, $11, $d8, $e6, $97, $b3, $a3, $d7, $65, $e6, $90, $53
    db $e6, $97, $57, $e6, $96, $31, $51, $e6, $10, $53, $d8, $e6, $96, $a1, $c1, $d7
    db $11, $e6, $97, $c3, $d7, $13, $d8, $c3, $a3, $c3, $d7, $e6, $96, $11, $d8, $c1
    db $a1, $e6, $90, $53, $e6, $97, $55, $e6, $96, $a1, $e6, $20, $a1, $d7, $e6, $90
    db $33, $e6, $97, $37, $e6, $96, $11, $31, $e6, $97, $53, $13, $d8, $a5, $e6, $96
    db $61, $51, $e6, $10, $53, $d8, $e6, $97, $55, $d7, $e6, $96, $61, $b1, $d7, $31
    db $e6, $10, $33, $ea, $00, $eb, $01, $e6, $60, $55, $e6, $50, $55, $e6, $47, $57
    db $ff

data_01c_5661:
    db $d0, $08, $e5, $80, $d3, $e8, $08, $e6, $70, $67, $e6, $60, $61, $e6, $50
    db $61, $e6, $47, $63, $e6, $10, $61, $e6, $96, $e8, $07, $61, $61, $61, $e6, $20
    db $e8, $08, $64, $e6, $10, $e8, $08, $62, $e5, $00, $e6, $94, $d2, $01, $df, $04
    db $e6, $94, $41, $b1, $e6, $30, $b1, $e0, $e5, $40, $e6, $80, $d1, $e4, $fc, $11
    db $b1, $d7, $11, $d8, $51, $e5, $00, $e6, $94, $d2, $e4, $00, $df, $04, $e6, $94
    db $81, $d7, $31, $e6, $30, $31, $d8, $e0, $e5, $40, $e6, $80, $d1, $e4, $fd, $51
    db $d7, $e6, $70, $31, $51, $d8, $d3, $e5, $80, $e6, $95, $e4, $00, $11, $d2, $e5
    db $00, $e6, $94, $41, $b1, $d3, $e5, $80, $e6, $95, $11, $d2, $e5, $00, $e6, $94
    db $41, $b1, $d2, $e5, $80, $e6, $95, $b1, $d2, $e5, $00, $e6, $94, $41, $b1, $d2
    db $e5, $80, $e6, $95, $61, $d2, $e5, $00, $e6, $94, $41, $b1, $d3, $e5, $00, $e6
    db $a3, $11, $d8, $11, $b1, $d7, $11, $d3, $e5, $80, $e6, $95, $51, $d2, $e5, $00
    db $e6, $94, $81, $d7, $31, $d3, $e5, $80, $e6, $95, $51, $d2, $e5, $00, $e6, $94
    db $81, $d7, $31, $d3, $e5, $80, $e6, $95, $31, $d2, $e5, $00, $e6, $94, $81, $d7
    db $31, $d2, $e5, $80, $e6, $95, $51, $d2, $e5, $00, $e6, $94, $81, $d7, $31, $d3
    db $e5, $80, $e6, $a3, $41, $d8, $b1, $61, $51, $d3, $e5, $00, $e6, $74, $df, $03
    db $51, $11, $51, $11, $51, $11, $51, $11, $e0, $51, $d8, $a1, $d7, $51, $d8, $a1
    db $d7, $51, $d8, $a1, $d7, $51, $d8, $a1, $d7, $df, $02, $11, $d8, $81, $d7, $11
    db $d8, $81, $d7, $11, $d8, $81, $d7, $11, $d8, $81, $d7, $e0, $31, $d8, $61, $d7
    db $31, $d8, $61, $d7, $31, $d8, $61, $21, $d8, $a1, $d7, $21, $d8, $a1, $d7, $21
    db $d8, $a1, $91, $c1, $e6, $20, $c3, $e6, $74, $d3, $df, $03, $51, $11, $51, $11
    db $51, $11, $51, $11, $e0, $d8, $a1, $71, $a1, $71, $a1, $a1, $a1, $d7, $13, $d8
    db $a3, $65, $11, $d8, $c1, $03, $d7, $55, $61, $b1, $d7, $31, $03, $3b, $d9, $37
    db $ff

data_01c_57c1:
    db $d0, $08, $e8, $07, $e7, $02, $e9, $60, $e6, $20, $d1, $8f, $e9, $60, $e6
    db $60, $81, $e9, $20, $e6, $20, $d0, $01, $8d, $01, $8d, $01, $8d, $01, $d0, $08
    db $e9, $60, $e6, $60, $83, $e9, $60, $e6, $20, $71, $21, $e8, $08, $11, $01, $d7
    db $11, $d8, $11, $b1, $d7, $11, $01, $d8, $11, $05, $11, $d7, $11, $d8, $11, $b1
    db $d7, $11, $d8, $51, $01, $d7, $51, $d8, $51, $d7, $31, $51, $01, $d8, $51, $05
    db $51, $d7, $51, $d8, $51, $d7, $31, $51, $d8, $11, $01, $d7, $11, $d8, $11, $b1
    db $d7, $11, $01, $d8, $11, $05, $11, $d7, $11, $d8, $11, $b1, $d7, $11, $d8, $51
    db $01, $d7, $51, $d8, $51, $d7, $31, $51, $01, $d8, $51, $05, $d7, $51, $41, $d8
    db $b1, $61, $51, $a1, $01, $a1, $01, $a1, $51, $a1, $51, $91, $01, $91, $01, $91
    db $51, $91, $51, $81, $01, $81, $01, $81, $51, $81, $51, $71, $01, $71, $01, $71
    db $31, $71, $31, $61, $01, $61, $01, $61, $11, $61, $11, $51, $01, $51, $01, $51
    db $11, $51, $11, $b1, $d7, $e8, $07, $61, $e8, $08, $61, $d8, $b5, $cb, $d7, $e8
    db $07, $51, $e8, $08, $51, $03, $d1, $a1, $01, $a1, $01, $a1, $51, $a1, $51, $91
    db $01, $91, $01, $91, $51, $91, $51, $81, $01, $81, $01, $81, $51, $81, $51, $71
    db $01, $71, $01, $71, $31, $71, $31, $61, $01, $61, $01, $61, $11, $61, $11, $03
    db $55, $61, $b1, $d7, $31, $d8, $03, $e8, $08, $e9, $20, $e6, $20, $57, $e9, $40
    db $e6, $40, $59, $e9, $60, $e6, $60, $51, $ff

data_01c_58c9:
    db $d0, $08, $d1, $df, $04, $10, $70
    db $70, $70, $e0, $91, $31, $31, $31, $71, $d7, $15, $d8, $11, $71, $41, $11, $11
    db $41, $71, $11, $71, $11, $41, $11, $11, $71, $41, $11, $11, $71, $41, $11, $11
    db $41, $71, $11, $71, $11, $41, $11, $10, $10, $11, $41, $11, $11, $71, $41, $11
    db $11, $41, $71, $11, $71, $11, $41, $11, $11, $11, $41, $71, $11, $71, $41, $11
    db $11, $41, $71, $11, $71, $11, $41, $11, $10, $10, $11, $31, $30, $30, $df, $02
    db $11, $71, $11, $71, $11, $11, $31, $71, $e0, $11, $71, $11, $71, $11, $11, $31
    db $11, $df, $02, $71, $71, $11, $71, $11, $11, $31, $11, $e0, $71, $71, $11, $71
    db $71, $11, $31, $11, $71, $11, $71, $11, $71, $71, $31, $71, $11, $71, $11, $71
    db $11, $d0, $01, $1e, $37, $37, $3f, $d9, $30, $d0, $08, $df, $02, $11, $71, $11
    db $71, $11, $11, $31, $71, $e0, $11, $71, $11, $71, $11, $11, $31, $11, $71, $71
    db $11, $71, $11, $11, $31, $91, $71, $91, $11, $91, $11, $11, $31, $31, $93, $d7
    db $13, $d8, $11, $31, $31, $31, $93, $d7, $17, $ff

data_01c_598a:
    db $dd, $d0, $09, $ea, $03, $eb
    db $0b, $d2, $e5, $c0, $e6, $77, $df, $02, $c3, $b1, $d7, $23, $33, $d8, $c3, $b1
    db $d7, $23, $33, $d8, $e0, $df, $02, $a3, $91, $c3, $d7, $13, $d8, $a3, $91, $c3
    db $d7, $13, $d8, $e0, $d7, $e5, $80, $e6, $a4, $eb, $07, $df, $04, $31, $d8, $b1
    db $d7, $21, $51, $11, $61, $21, $e0, $df, $04, $11, $d8, $91, $c1, $d7, $31, $d8
    db $b1, $d7, $41, $d8, $c1, $d7, $e0, $de, $ff

data_01c_59d9:
    db $dd, $d0, $09, $d1, $e5, $c0, $e6
    db $d7, $df, $02, $53, $41, $73, $83, $53, $41, $73, $83, $e0, $df, $02, $33, $21
    db $53, $63, $33, $21, $53, $63, $e0, $e6, $d7, $df, $02, $83, $71, $a3, $b3, $83
    db $71, $a3, $b3, $e0, $df, $02, $63, $51, $83, $93, $63, $51, $83, $93, $e0, $de
    db $ff

data_01c_5a11:
    db $dd, $d0, $09, $e7, $06, $e9, $20, $e6, $20, $d2, $e8, $08, $df, $02, $83
    db $71, $a3, $b3, $83, $71, $a3, $b3, $e0, $df, $02, $63, $51, $83, $93, $63, $51
    db $83, $93, $e0, $e7, $00, $e9, $40, $e6, $20, $d4, $e8, $02, $df, $02, $81, $d8
    db $81, $d7, $71, $d8, $a1, $d7, $a1, $d8, $b1, $d7, $b1, $d8, $81, $d7, $81, $d8
    db $71, $d7, $a1, $d8, $a1, $d7, $b1, $d8, $b1, $d7, $e0, $df, $02, $61, $d8, $61
    db $d7, $51, $d8, $81, $d7, $81, $d8, $91, $d7, $91, $d8, $61, $d7, $61, $d8, $51
    db $d7, $81, $d8, $81, $d7, $91, $d8, $91, $d7, $e0, $de, $ff

data_01c_5a7c:
    db $dd, $d0, $09, $d1
    db $df, $08, $11, $11, $73, $73, $71, $11, $11, $71, $70, $d7, $30, $d8, $01, $70
    db $d7, $30, $d8, $01, $e0, $de, $ff

data_01c_5a97:
    db $dd, $d0, $0f, $ea, $06, $eb, $0b, $d3, $e5
    db $80, $e6, $75, $df, $04, $e6, $74, $50, $e6, $65, $50, $d7, $e6, $74, $50, $e6
    db $65, $50, $e6, $74, $40, $e6, $65, $40, $d8, $e6, $74, $50, $e6, $65, $50, $e0
    db $df, $04, $e6, $74, $20, $e6, $65, $20, $d7, $e6, $74, $20, $e6, $65, $20, $e6
    db $74, $10, $e6, $65, $10, $d8, $e6, $74, $20, $e6, $65, $20, $e0, $d8, $df, $04
    db $e6, $74, $a0, $e6, $65, $a0, $d7, $e6, $74, $a0, $e6, $65, $a0, $e6, $74, $90
    db $e6, $65, $90, $d8, $e6, $74, $a0, $e6, $65, $a0, $e0, $df, $04, $e6, $74, $70
    db $e6, $65, $70, $d7, $e6, $74, $70, $e6, $65, $70, $e6, $74, $60, $e6, $65, $60
    db $d8, $e6, $74, $70, $e6, $65, $70, $e0, $df, $04, $e6, $74, $c0, $e6, $65, $c0
    db $d7, $e6, $74, $c0, $e6, $65, $c0, $e6, $74, $b0, $e6, $65, $b0, $d8, $e6, $74
    db $c0, $e6, $65, $c0, $e0, $df, $04, $e6, $74, $90, $e6, $65, $90, $d7, $e6, $74
    db $90, $e6, $65, $90, $e6, $74, $80, $e6, $65, $80, $d8, $e6, $74, $90, $e6, $65
    db $90, $e0, $df, $04, $e6, $74, $50, $e6, $65, $50, $d7, $e6, $74, $50, $e6, $65
    db $50, $e6, $74, $40, $e6, $65, $40, $d8, $e6, $74, $50, $e6, $65, $50, $e0, $df
    db $04, $e6, $74, $20, $e6, $65, $20, $d7, $e6, $74, $20, $e6, $65, $20, $e6, $74
    db $10, $e6, $65, $10, $d8, $e6, $74, $20, $e6, $65, $20, $e0, $de, $ff

data_01c_5b8e:
    db $dd, $d0
    db $0f, $d2, $e5, $80, $e6, $70, $e6, $70, $c7, $e6, $60, $c1, $e6, $50, $c1, $e6
    db $40, $c1, $e6, $30, $c1, $e6, $70, $57, $e6, $60, $51, $e6, $50, $51, $e6, $40
    db $51, $e6, $30, $51, $e6, $70, $97, $e6, $60, $91, $e6, $50, $91, $e6, $40, $91
    db $e6, $30, $91, $e6, $70, $27, $e6, $60, $21, $e6, $50, $21, $e6, $40, $21, $e6
    db $30, $21, $e6, $70, $57, $e6, $60, $51, $e6, $50, $51, $e6, $40, $51, $e6, $30
    db $51, $d8, $e6, $70, $a7, $e6, $60, $a1, $e6, $50, $a1, $e6, $40, $a1, $e6, $30
    db $a1, $d7, $e6, $80, $17, $e6, $70, $11, $e6, $60, $11, $e6, $50, $11, $e6, $40
    db $11, $d8, $e6, $70, $77, $e6, $60, $71, $e6, $50, $71, $e6, $40, $71, $e6, $30
    db $71, $d0, $0f, $d1, $e5, $80, $e6, $90, $df, $04, $c1, $d7, $c0, $72, $50, $70
    db $d8, $e0, $df, $04, $91, $d7, $90, $42, $20, $40, $d8, $e0, $df, $04, $51, $d7
    db $50, $d8, $c2, $a0, $c0, $e0, $df, $04, $21, $d7, $20, $d8, $92, $60, $80, $e0
    db $de, $ff

data_01c_5c42:
    db $dd, $d0, $0f, $e8, $08, $e7, $06, $e9, $60, $e6, $20, $d2, $e7, $06
    db $e6, $20, $97, $e7, $08, $e6, $20, $97, $e7, $02, $e6, $40, $97, $e7, $06, $e6
    db $40, $97, $e7, $06, $e6, $20, $67, $e7, $08, $e6, $20, $67, $e7, $02, $e6, $40
    db $67, $e7, $06, $e6, $40, $67, $e7, $02, $e6, $40, $17, $e7, $02, $e6, $40, $17
    db $e7, $02, $e6, $40, $17, $e7, $06, $e6, $40, $17, $d8, $e7, $05, $e6, $40, $b7
    db $e7, $05, $e6, $40, $b7, $e7, $05, $e6, $40, $b7, $e7, $06, $e6, $40, $b7, $d0
    db $0f, $e8, $08, $e7, $02, $e9, $60, $e6, $40, $d3, $77, $47, $d8, $cf, $d7, $47
    db $17, $d8, $9f, $c7, $87, $5f, $87, $67, $2f, $de, $ff

data_01c_5cbb:
    db $d0, $0f, $d1, $e8, $08
    db $dd, $df, $20, $91, $d7, $31, $d8, $e0, $df, $07, $91, $70, $70, $91, $70, $70
    db $91, $70, $70, $91, $70, $70, $e0, $91, $70, $70, $91, $70, $70, $91, $70, $70
    db $70, $70, $91, $de, $ff

data_01c_5ce5:
    db $dd, $d0, $0e, $ea, $05, $eb, $07, $d3, $e5, $40, $e4
    db $01, $df, $02, $e6, $75, $a1, $d7, $31, $e6, $65, $91, $e6, $75, $71, $31, $d8
    db $91, $d7, $31, $e6, $65, $91, $e6, $75, $71, $31, $d8, $e0, $df, $02, $81, $d7
    db $11, $71, $51, $11, $d8, $71, $d7, $11, $71, $51, $11, $d8, $e0, $de, $ff

data_01c_5d1f:
    db $d0
    db $0e, $00, $dd, $d3, $e5, $80, $e4, $ff, $df, $02, $e6, $40, $a1, $d7, $31, $e6
    db $30, $91, $e6, $40, $71, $31, $d8, $91, $d7, $31, $e6, $30, $91, $e6, $40, $71
    db $31, $d8, $e0, $df, $02, $81, $d7, $11, $71, $51, $11, $d8, $71, $d7, $11, $71
    db $51, $11, $d8, $e0, $de, $ff

data_01c_5d56:
    db $dd, $d0, $0e, $e7, $02, $e9, $40, $d1, $e8, $08
    db $e7, $02, $e6, $20, $39, $e7, $08, $39, $e7, $02, $e6, $40, $39, $e7, $08, $e6
    db $40, $39, $e7, $02, $e6, $20, $19, $e7, $08, $19, $e7, $02, $e6, $40, $19, $e7
    db $08, $e6, $40, $19, $de, $ff

data_01c_5d86:
    db $dd, $d0, $07, $d3, $e5, $40, $e6, $87, $a1, $51
    db $a1, $c1, $51, $c1, $d7, $11, $d8, $51, $d7, $11, $31, $d8, $51, $d7, $31, $53
    db $11, $d8, $a1, $71, $21, $71, $91, $21, $91, $a1, $21, $a1, $c1, $21, $c1, $d7
    db $23, $d8, $a1, $71, $41, $d8, $b1, $d7, $41, $61, $d8, $b1, $d7, $61, $71, $d8
    db $b1, $d7, $71, $91, $d8, $b1, $d7, $91, $b3, $71, $41, $11, $d8, $81, $d7, $11
    db $31, $d8, $81, $d7, $31, $41, $d8, $81, $d7, $41, $61, $d8, $81, $d7, $61, $81
    db $71, $41, $51, $d3, $e6, $87, $a1, $e6, $a7, $51, $e6, $87, $a1, $c1, $e6, $a7
    db $51, $e6, $87, $c1, $d7, $11, $d8, $e6, $a7, $51, $d7, $e6, $87, $11, $31, $d8
    db $e6, $a7, $51, $d7, $e6, $87, $31, $53, $11, $d8, $a1, $e6, $87, $71, $e6, $a7
    db $21, $e6, $87, $71, $91, $e6, $a7, $21, $e6, $87, $91, $a1, $e6, $a7, $21, $e6
    db $87, $a1, $c1, $e6, $a7, $21, $e6, $87, $c1, $d7, $23, $d8, $a1, $71, $e6, $87
    db $41, $d8, $e6, $a7, $b1, $d7, $e6, $87, $41, $61, $d8, $e6, $a7, $b1, $d7, $e6
    db $87, $61, $71, $d8, $e6, $a7, $b1, $d7, $e6, $87, $71, $91, $d8, $e6, $a7, $b1
    db $d7, $e6, $87, $91, $b3, $71, $41, $e6, $87, $11, $d8, $e6, $a7, $81, $d7, $e6
    db $87, $11, $31, $d8, $e6, $a7, $81, $d7, $e6, $87, $31, $41, $d8, $e6, $a7, $81
    db $d7, $e6, $87, $41, $61, $d8, $e6, $a7, $81, $d7, $e6, $87, $61, $81, $71, $41
    db $51, $d3, $e5, $40, $e6, $75, $a1, $e6, $20, $a1, $e6, $75, $a1, $e6, $75, $91
    db $e6, $20, $91, $e6, $75, $51, $d8, $a1, $d7, $e6, $75, $a1, $e6, $20, $a1, $e6
    db $75, $91, $51, $d8, $a1, $d7, $e6, $75, $61, $e6, $20, $61, $e6, $75, $61, $e6
    db $75, $51, $e6, $20, $51, $e6, $75, $11, $d8, $61, $d7, $e6, $75, $61, $e6, $20
    db $61, $e6, $75, $51, $11, $d8, $61, $d7, $e6, $75, $31, $e6, $20, $31, $e6, $75
    db $31, $e6, $75, $21, $e6, $20, $21, $e6, $75, $d8, $a1, $31, $d7, $e6, $75, $31
    db $e6, $20, $31, $e6, $75, $21, $d8, $a1, $31, $d7, $e6, $75, $31, $e6, $20, $31
    db $e6, $75, $31, $e6, $75, $21, $e6, $20, $21, $e6, $75, $d8, $a1, $31, $d7, $e6
    db $75, $31, $e6, $20, $31, $e6, $75, $21, $d8, $a1, $31, $e5, $c0, $e6, $54, $d5
    db $e8, $08, $50, $d8, $a0, $90, $a0, $d7, $50, $d8, $a0, $d7, $40, $d8, $a0, $d7
    db $20, $d8, $a0, $d7, $40, $d8, $a0, $d7, $50, $d8, $a0, $90, $a0, $d7, $50, $d8
    db $a0, $d7, $40, $d8, $a0, $d7, $20, $d8, $a0, $d7, $40, $d8, $a0, $d7, $10, $d8
    db $60, $50, $60, $d7, $10, $d8, $60, $c0, $60, $a0, $60, $c0, $60, $d7, $10, $d8
    db $60, $50, $60, $d7, $10, $d8, $60, $c0, $60, $a0, $60, $c0, $60, $a0, $30, $20
    db $30, $a0, $30, $90, $30, $70, $30, $90, $30, $a0, $30, $20, $30, $a0, $30, $90
    db $30, $70, $30, $90, $30, $a0, $30, $20, $30, $a0, $30, $90, $30, $70, $30, $90
    db $30, $a0, $30, $20, $30, $a0, $30, $90, $30, $70, $30, $90, $30, $de, $ff

data_01c_5f8f:
    db $dd
    db $d0, $07, $e5, $80, $e6, $37, $d4, $e8, $08, $e4, $fe, $d0, $02, $a9, $d0, $07
    db $51, $a1, $c1, $51, $c1, $d7, $11, $d8, $51, $d7, $11, $31, $d8, $51, $d7, $31
    db $53, $11, $d8, $a1, $71, $21, $71, $91, $21, $91, $a1, $21, $a1, $c1, $21, $c1
    db $d7, $23, $d8, $a1, $71, $41, $d8, $b1, $d7, $41, $61, $d8, $b1, $d7, $61, $71
    db $d8, $b1, $d7, $71, $91, $d8, $b1, $d7, $91, $b3, $71, $41, $11, $d8, $81, $d7
    db $11, $31, $d8, $81, $d7, $31, $41, $d8, $81, $d7, $41, $61, $d8, $81, $d7, $61
    db $81, $71, $41, $d0, $02, $53, $d0, $07, $d3, $e5, $40, $e8, $08, $e4, $ff

    db $e6
    db $86, $11, $d8, $e6, $a6, $a1, $d7, $e6, $86, $11, $31, $d8, $e6, $a6, $a1, $d7
    db $e6, $86, $31, $51, $d8, $e6, $a6, $a1, $d7, $e6, $86, $51, $61, $d8, $e6, $a6
    db $a1, $d7, $e6, $86, $61, $83, $51, $d8, $a1, $e6, $86, $a1, $e6, $a6, $71, $e6
    db $86, $a1, $c1, $e6, $a6, $71, $e6, $86, $c1, $d7, $21, $d8, $e6, $a6, $71, $d7
    db $e6, $86, $21, $31, $d8, $e6, $a6, $71, $d7, $e6, $86, $31, $53, $21, $d8, $71
    db $e6, $86, $71, $e6, $a6, $41, $e6, $86, $71, $91, $e6, $a6, $41, $e6, $86, $91
    db $b1, $e6, $a6, $41, $e6, $86, $b1, $c1, $e6, $a6, $41, $e6, $86, $c1, $d7, $23
    db $d8, $b1, $41, $e6, $86, $41, $e6, $a6, $11, $e6, $86, $41, $61, $e6, $a6, $11
    db $e6, $86, $61, $81, $e6, $a6, $11, $e6, $86, $81, $91, $e6, $a6, $11, $e6, $86
    db $91, $c1, $b1, $71, $81, $d2, $e5, $00, $e8, $08, $e4, $ff

    db $e6, $76, $a1, $e6
    db $20, $a1, $e6, $76, $a1, $91, $e6, $20, $91, $e6, $76, $51, $d8, $a1, $d7, $a1
    db $e6, $20, $a1, $e6, $76, $91, $51, $d8, $a1, $d7, $61, $e6, $20, $61, $e6, $76
    db $61, $51, $e6, $20, $51, $e6, $76, $11, $d8, $61, $d7, $61, $e6, $20, $61, $e6
    db $76, $51, $11, $d8, $61, $d7, $31, $e6, $20, $31, $e6, $76, $31, $21, $e6, $20
    db $21, $d8, $e6, $76, $a1, $31, $d7, $31, $e6, $20, $31, $e6, $76, $21, $d8, $a1
    db $31, $d7, $31, $e6, $20, $31, $e6, $76, $31, $21, $e6, $20, $21, $d8, $e6, $76
    db $a1, $31, $d7, $31, $e6, $20, $31, $e6, $76, $21, $d8, $a1, $31, $d0, $07, $d2
    db $e5, $80, $e4, $ff

    db $e6, $a5, $a1, $e6, $30, $a1, $e6, $a5, $a1, $e6, $a5, $91
    db $e6, $30, $91, $e6, $a5, $51, $d8, $a1, $d7, $e6, $a5, $a1, $e6, $30, $a1, $e6
    db $a5, $91, $51, $d8, $a1, $d7, $e6, $a5, $61, $e6, $30, $61, $e6, $a5, $61, $e6
    db $a5, $51, $e6, $30, $51, $e6, $a5, $11, $d8, $61, $d7, $e6, $a5, $61, $e6, $30
    db $61, $e6, $a5, $51, $11, $d8, $61, $d7, $e6, $a5, $31, $e6, $30, $31, $e6, $a5
    db $31, $e6, $a5, $21, $e6, $30, $21, $e6, $a5, $d8, $a1, $31, $d7, $e6, $a5, $31
    db $e6, $30, $31, $e6, $a5, $21, $d8, $a1, $31, $d7, $e6, $a5, $31, $e6, $30, $31
    db $e6, $a5, $31, $e6, $a5, $21, $e6, $30, $21, $e6, $a5, $d8, $a1, $31, $d7, $e6
    db $a5, $31, $e6, $30, $31, $e6, $a5, $21, $d8, $a1, $31, $de, $ff

data_01c_619d:
    db $dd, $d1, $e7
    db $02, $e9, $60, $e6, $20, $d0, $01, $e8, $07, $df, $02, $df, $10, $ad, $e0, $df
    db $10, $7d, $e0, $df, $10, $4d, $e0, $df, $08, $1d, $e0, $df, $04, $1d, $e0, $5d
    db $4d, $bd, $cd, $e0, $df, $02, $ad, $0d, $ad, $9d, $0d, $5d, $ad, $ad, $0d, $9d
    db $5d, $ad, $6d, $0d, $6d, $5d, $0d, $1d, $6d, $6d, $0d, $5d, $1d, $6d, $3d, $0d
    db $3d, $2d, $0d, $ad, $3d, $3d, $0d, $2d, $ad, $3d, $3d, $0d, $3d, $2d, $0d, $ad
    db $3d, $3d, $0d, $2d, $ad, $3d, $e0, $de, $ff

data_01c_61f9:
    db $dd, $d0, $07, $d1, $11, $11, $71
    db $01, $71, $01, $71, $01, $df, $07, $71, $01, $71, $01, $71, $01, $71, $01, $11
    db $11, $71, $01, $71, $01, $71, $01, $e0, $71, $01, $71, $01, $71, $01, $71, $01
    db $11, $71, $11, $11, $31, $11, $11, $31, $71, $11, $11, $11, $11, $71, $11, $11
    db $31, $11, $11, $31, $71, $11, $11, $11, $11, $71, $11, $11, $31, $11, $11, $31
    db $71, $11, $11, $11, $11, $71, $11, $11, $31, $11, $11, $31, $71, $d0, $01, $3c
    db $36, $36, $36, $07, $d0, $07, $11, $71, $11, $11, $31, $11, $11, $31, $71, $11
    db $11, $11, $11, $71, $11, $11, $31, $11, $11, $31, $71, $11, $11, $11, $11, $71
    db $11, $11, $31, $11, $11, $31, $71, $11, $11, $11, $11, $71, $11, $11, $31, $11
    db $11, $31, $71, $d0, $01, $3c, $36, $36, $36, $37, $d0, $07, $de, $ff

data_01c_628e:
    db $d0, $04
    db $dc, $11, $dd, $e8, $08, $d3, $e5, $00, $e6, $97, $8b, $e6, $30, $87, $13, $e6
    db $97, $ab, $e6, $30, $a7, $33, $e6, $97, $cb, $e6, $30, $c7, $53, $e6, $97, $d7
    db $1b, $e6, $30, $17, $d8, $63, $e6, $97, $8b, $e6, $30, $87, $13, $e6, $97, $ab
    db $e6, $30, $a7, $33, $e6, $97, $cb, $e6, $30, $c7, $53, $e6, $97, $d7, $1b, $e6
    db $30, $17, $d8, $63, $ea, $0b, $eb, $01, $d4, $e5, $00, $e6, $80, $e4, $00, $1f
    db $d9, $13, $d8, $b1, $d7, $11, $e6, $80, $61, $e6, $30, $61, $e6, $80, $61, $e6
    db $80, $1f, $e6, $30, $11, $e6, $80, $1f, $d9, $13, $d8, $b1, $d7, $11, $e6, $80
    db $61, $e6, $30, $61, $e6, $80, $61, $e6, $80, $1f, $e6, $30, $11, $e6, $80, $1f
    db $d9, $13, $d8, $b1, $d7, $11, $e6, $80, $61, $e6, $30, $61, $e6, $80, $61, $e6
    db $80, $1f, $e6, $30, $11, $e6, $80, $3f, $d9, $33, $11, $31, $ea, $0c, $e6, $80
    db $91, $e6, $30, $91, $e6, $80, $91, $41, $91, $41, $d8, $e6, $80, $b0, $e6, $30
    db $b0, $e6, $80, $40, $40, $e6, $80, $b0, $e6, $30, $b0, $e6, $80, $d7, $e6, $80
    db $40, $e6, $40, $40, $e6, $80, $e6, $80, $90, $e6, $40, $90, $e6, $80, $d7, $e6
    db $80, $40, $e6, $40, $40, $e6, $80, $d3, $e8, $08, $e5, $00, $e6, $85, $ea, $00
    db $eb, $01, $15, $15, $15, $15, $d8, $85, $85, $85, $85, $d7, $35, $35, $35, $35
    db $d8, $a5, $a5, $a5, $a5, $d7, $d7, $15, $15, $15, $15, $d8, $85, $85, $85, $85
    db $d7, $35, $35, $35, $35, $d8, $a5, $a5, $a1, $09, $e8, $08, $ea, $0b, $eb, $01
    db $d3, $e5, $00, $df, $02, $e6, $87, $60, $e6, $50, $60, $e6, $87, $a0, $e6, $50
    db $a0, $e6, $87, $60, $e6, $50, $60, $d7, $e6, $87, $10, $e6, $30, $14, $d8, $e0
    db $df, $02, $e6, $87, $10, $e6, $50, $10, $e6, $87, $50, $e6, $50, $50, $e6, $87
    db $10, $e6, $50, $10, $e6, $87, $80, $e6, $30, $84, $d7, $e0, $d3, $df, $02, $e6
    db $87, $80, $e6, $50, $80, $e6, $87, $c0, $e6, $50, $c0, $e6, $87, $80, $e6, $50
    db $80, $d7, $e6, $87, $30, $e6, $30, $34, $d8, $e0, $e6, $87, $30, $e6, $50, $30
    db $e6, $87, $70, $e6, $50, $70, $e6, $87, $30, $e6, $50, $30, $e6, $87, $a0, $e6
    db $30, $a4, $d7, $e6, $87, $30, $e6, $40, $30, $e6, $87, $70, $e6, $40, $70, $d8
    db $e6, $87, $a0, $e6, $30, $a6, $df, $02, $e6, $87, $60, $e6, $50, $60, $e6, $87
    db $a0, $e6, $50, $a0, $e6, $87, $60, $e6, $50, $60, $d7, $e6, $87, $10, $e6, $30
    db $14, $d8, $e0, $df, $02, $e6, $87, $10, $e6, $50, $10, $e6, $87, $50, $e6, $50
    db $50, $e6, $87, $10, $e6, $50, $10, $e6, $87, $80, $e6, $30, $84, $d7, $e0, $d3
    db $df, $02, $e6, $87, $80, $e6, $50, $80, $e6, $87, $c0, $e6, $50, $c0, $e6, $87
    db $80, $e6, $50, $80, $d7, $e6, $87, $30, $e6, $30, $34, $d8, $e0, $e6, $87, $30
    db $e6, $50, $30, $e6, $87, $70, $e6, $50, $70, $e6, $87, $30, $e6, $50, $30, $e6
    db $87, $a0, $e6, $30, $a4, $d7, $e6, $87, $30, $e6, $50, $30, $e6, $87, $70, $e6
    db $50, $70, $d8, $e6, $87, $a0, $e6, $20, $a6, $de, $ff

data_01c_64ab:
    db $dc, $11, $dd, $d0, $04
    db $e8, $08, $d3, $e5, $00, $e6, $85, $53, $e6, $87, $1b, $e6, $30, $57, $e6, $85
    db $73, $e6, $87, $3b, $e6, $30, $77, $e6, $85, $93, $e6, $87, $5b, $e6, $30, $97
    db $e6, $85, $a3, $e6, $87, $6b, $e6, $30, $a7, $e6, $85, $53, $e6, $87, $1b, $e6
    db $30, $57, $e6, $85, $73, $e6, $87, $3b, $e6, $30, $77, $e6, $85, $93, $e6, $87
    db $5b, $e6, $30, $97, $e6, $85, $a3, $e6, $87, $6b, $e6, $30, $a7, $d0, $04, $e8
    db $08, $d1, $e5, $40, $e6, $e7, $df, $03, $61, $01, $61, $d7, $61, $d8, $d0, $01
    db $65, $01, $64, $02, $d0, $04, $61, $01, $61, $d7, $61, $d8, $d0, $01, $65, $01
    db $64, $02, $d0, $04, $e0, $61, $01, $61, $d7, $61, $d8, $d0, $01, $66, $00, $65
    db $01, $d0, $04, $61, $d7, $61, $d8, $61, $d7, $61, $d8, $d0, $01, $66, $00, $65
    db $01, $d0, $04, $df, $03, $61, $01, $61, $d7, $61, $d8, $d0, $01, $66, $00, $65
    db $01, $d0, $04, $61, $01, $61, $d7, $61, $d8, $d0, $01, $66, $00, $65, $01, $d0
    db $04, $e0, $91, $01, $91, $d7, $91, $d8, $d0, $01, $95, $01, $94, $02, $d0, $04
    db $91, $d7, $91, $d8, $91, $d7, $91, $d8, $91, $d7, $91, $d8, $df, $02, $df, $03
    db $e6, $e7, $81, $01, $d0, $01, $e6, $a7, $86, $00, $d0, $04, $e0, $e6, $e7, $d0
    db $01, $85, $01, $85, $01, $d0, $04, $81, $df, $03, $e6, $e7, $31, $01, $d0, $01
    db $e6, $a7, $36, $00, $d0, $04, $e0, $e6, $e7, $d0, $01, $35, $01, $35, $01, $d0
    db $04, $31, $df, $03, $e6, $e7, $a1, $01, $d0, $01, $e6, $a7, $a6, $00, $d0, $04
    db $e0, $e6, $e7, $d0, $01, $a5, $01, $a5, $01, $d0, $04, $a1, $df, $03, $e6, $e7
    db $51, $01, $d0, $01, $e6, $a7, $56, $00, $d0, $04, $e0, $e6, $e7, $d0, $01, $55
    db $01, $55, $01, $d0, $04, $51, $df, $03, $e6, $e7, $81, $01, $d0, $01, $e6, $a7
    db $86, $00, $d0, $04, $e0, $e6, $e7, $d0, $01, $85, $01, $85, $01, $d0, $04, $81
    db $df, $03, $e6, $e7, $31, $01, $d0, $01, $e6, $a7, $36, $00, $d0, $04, $e0, $e6
    db $e7, $d0, $01, $35, $01, $35, $01, $d0, $04, $31, $df, $03, $e6, $e7, $a1, $01
    db $d0, $01, $e6, $a7, $a6, $00, $d0, $04, $e0, $e6, $e7, $d0, $01, $a5, $01, $a5
    db $01, $d0, $04, $a1, $51, $01, $d0, $01, $56, $00, $d0, $04, $51, $01, $51, $d7
    db $51, $d8, $51, $d7, $51, $01, $d8, $53, $e0, $de, $ff

data_01c_664b:
    db $dc, $11, $dd, $d0, $04
    db $e8, $08, $e7, $02, $e9, $40, $e6, $20, $d1, $df, $02, $df, $03, $31, $01, $31
    db $d7, $31, $d8, $d0, $01, $35, $01, $34, $02, $d0, $04, $31, $01, $31, $d7, $31
    db $d8, $d0, $01, $35, $01, $34, $02, $d0, $04, $e0, $31, $01, $31, $d7, $31, $d8
    db $d0, $01, $35, $01, $34, $02, $d0, $04, $31, $d7, $31, $d8, $31, $d7, $31, $d8
    db $d0, $01, $35, $01, $d0, $04, $31, $e0, $d3, $e8, $08, $e7, $04, $e9, $60, $e6
    db $40, $b5, $85, $4b, $d7, $15, $d8, $a5, $6b, $d7, $35, $d8, $c5, $8b, $d7, $45
    db $15, $d8, $9b, $b5, $85, $4b, $d7, $15, $d8, $a5, $6b, $d7, $35, $d8, $c5, $8b
    db $d7, $75, $45, $d8, $bb, $d3, $e8, $07, $e7, $02, $e9, $60, $e6, $40, $a1, $63
    db $a1, $63, $a1, $63, $a1, $63, $51, $13, $51, $13, $51, $13, $51, $13, $c1, $83
    db $c1, $83, $c1, $83, $c1, $83, $71, $33, $71, $33, $71, $33, $71, $33, $d7, $a1
    db $63, $a1, $63, $a1, $63, $a1, $63, $51, $13, $51, $13, $51, $13, $51, $13, $c1
    db $83, $c1, $83, $c1, $83, $c1, $83, $71, $33, $71, $35, $73, $33, $01, $d3, $e8
    db $07, $e7, $02, $e9, $60, $e6, $40, $d7, $11, $d8, $a1, $61, $d7, $11, $d8, $a1
    db $61, $d7, $11, $d8, $a1, $61, $d7, $11, $d8, $a1, $61, $81, $51, $11, $81, $51
    db $11, $81, $51, $11, $81, $51, $11, $d7, $31, $d8, $c1, $81, $d7, $31, $d8, $c1
    db $81, $d7, $31, $d8, $c1, $81, $d7, $31, $d8, $c1, $81, $a1, $71, $31, $a1, $71
    db $31, $a1, $71, $31, $a1, $71, $31, $d7, $11, $d8, $a1, $61, $d7, $11, $d8, $a1
    db $61, $d7, $11, $d8, $a1, $61, $d7, $11, $d8, $a1, $61, $81, $51, $11, $81, $51
    db $11, $81, $51, $11, $81, $51, $11, $d7, $31, $d8, $c1, $81, $d7, $31, $d8, $c1
    db $81, $d7, $31, $d8, $c1, $81, $d7, $31, $d8, $c1, $81, $a1, $71, $31, $a1, $71
    db $31, $e6, $40, $a1, $e6, $60, $a1, $e6, $40, $71, $e6, $60, $71, $e6, $40, $31
    db $e6, $60, $31, $de, $ff

data_01c_67a5:
    db $dd, $d0, $04, $d1, $e8, $08, $df, $03, $11, $71, $71
    db $31, $71, $71, $11, $71, $71, $31, $71, $71, $e0, $11, $71, $71, $31, $71, $71
    db $11, $71, $71, $31, $31, $31, $df, $03, $11, $71, $71, $31, $71, $71, $11, $71
    db $71, $31, $71, $71, $e0, $11, $71, $71, $31, $71, $71, $31, $71, $31, $31, $31
    db $91, $11, $71, $71, $31, $71, $71, $11, $71, $71, $31, $71, $11, $11, $71, $71
    db $31, $71, $71, $11, $71, $71, $31, $11, $11, $11, $71, $71, $31, $71, $71, $11
    db $71, $71, $31, $71, $11, $11, $71, $71, $31, $71, $71, $11, $71, $11, $31, $31
    db $31, $11, $71, $71, $31, $71, $71, $11, $71, $71, $31, $71, $11, $11, $71, $71
    db $31, $71, $71, $11, $71, $11, $31, $11, $11, $11, $71, $71, $31, $71, $71, $11
    db $71, $71, $31, $71, $11, $11, $91, $11, $31, $30, $30, $31, $11, $d7, $c3, $a3
    db $81, $d8, $df, $02, $df, $03, $11, $91, $11, $11, $91, $11, $11, $91, $11, $11
    db $91, $11, $e0, $11, $91, $11, $31, $70, $70, $91, $11, $93, $93, $91, $df, $03
    db $11, $91, $11, $11, $91, $11, $11, $91, $11, $11, $91, $11, $e0, $11, $91, $11
    db $11, $91, $11, $31, $31, $31, $d0, $01, $76, $af, $d9, $a0, $d0, $04, $e0, $de
    db $ff

data_01c_6881:
    db $dd, $d0, $06, $e5, $00, $e6, $96, $d4, $ea, $00, $eb, $01, $13, $d8, $81
    db $d7, $11, $33, $d8, $81, $d7, $31, $d0, $01, $4a, $00, $d0, $06, $41, $61, $e6
    db $96, $81, $e6, $20, $81, $e6, $96, $41, $11, $d8, $c1, $b3, $61, $b1, $d7, $13
    db $d8, $61, $d7, $11, $d0, $01, $2a, $00, $d0, $06, $21, $41, $e6, $96, $61, $e6
    db $20, $61, $e6, $96, $21, $d8, $b1, $a1, $93, $41, $91, $b3, $41, $b1, $d0, $01
    db $ca, $00, $d0, $06, $c1, $d7, $21, $e6, $96, $41, $e6, $20, $41, $e6, $96, $d8
    db $c1, $91, $81, $d0, $01, $df, $03, $7a, $00, $e0, $d0, $06, $e6, $96, $71, $e6
    db $20, $71, $e6, $96, $61, $71, $85, $e6, $96, $31, $e6, $20, $33, $e6, $96, $e6
    db $96, $80, $e6, $20, $80, $e6, $96, $80, $90, $e6, $96, $80, $e6, $20, $80, $e6
    db $96, $d7, $13, $d8, $81, $d7, $11, $33, $d8, $81, $d7, $31, $d0, $01, $4a, $00
    db $d0, $06, $41, $61, $e6, $96, $81, $e6, $20, $81, $e6, $96, $41, $11, $d8, $c1
    db $b3, $61, $b1, $d7, $13, $d8, $61, $d7, $11, $d0, $01, $2a, $00, $d0, $06, $21
    db $41, $e6, $96, $61, $e6, $20, $61, $e6, $96, $21, $d8, $b1, $a1, $93, $41, $91
    db $b3, $41, $b1, $d0, $01, $ca, $00, $d0, $06, $c1, $d7, $21, $e6, $96, $41, $e6
    db $20, $41, $e6, $96, $d8, $c1, $91, $81, $d0, $01, $df, $03, $7a, $00, $e0, $d0
    db $06, $e6, $96, $71, $e6, $20, $71, $e6, $96, $61, $71, $85, $e6, $96, $31, $e6
    db $20, $31, $e6, $96, $e6, $96, $60, $e6, $20, $60, $e6, $96, $43, $10, $30, $d4
    db $e5, $00, $e6, $85, $e8, $08, $71, $11, $51, $11, $71, $11, $51, $11, $71, $11
    db $51, $e6, $85, $71, $e6, $20, $71, $e6, $85, $e6, $85, $71, $e6, $20, $73, $e6
    db $85, $91, $31, $71, $31, $91, $31, $71, $31, $91, $31, $71, $e6, $85, $91, $e6
    db $20, $91, $e6, $85, $e6, $85, $91, $e6, $20, $93, $e6, $85, $b1, $51, $91, $51
    db $b1, $51, $91, $51, $b1, $51, $91, $e6, $85, $b1, $e6, $20, $b1, $e6, $85, $e6
    db $85, $b1, $e6, $20, $b3, $e6, $85, $d7, $21, $d8, $81, $c1, $81, $d7, $21, $d8
    db $81, $c1, $81, $d7, $21, $d8, $81, $c1, $d7, $e6, $85, $21, $e6, $20, $21, $e6
    db $85, $d8, $c1, $a1, $81, $d0, $06, $e5, $40, $e6, $87, $e8, $08, $ea, $06, $eb
    db $15, $d4, $03, $51, $71, $d7, $51, $d8, $c5, $51, $71, $d7, $51, $d8, $c9, $03
    db $71, $91, $d7, $71, $25, $d8, $71, $91, $d7, $71, $23, $d8, $91, $21, $75, $91
    db $b1, $d7, $91, $45, $d8, $91, $b1, $91, $b3, $d7, $91, $41, $d8, $95, $c1, $d7
    db $21, $c1, $73, $d8, $c1, $d7, $71, $d8, $71, $d7, $51, $79, $de, $ff

data_01c_6a4e:
    db $dd, $d0
    db $06, $e5, $00, $e6, $76, $e8, $08, $e4, $ff

    db $d3, $13, $d8, $81, $d7, $11, $33
    db $d8, $81, $d7, $31, $41, $41, $61, $e6, $76, $81, $e6, $20, $81, $e6, $76, $41
    db $11, $d8, $c1, $b3, $61, $b1, $d7, $13, $d8, $61, $d7, $11, $21, $21, $41, $e6
    db $76, $61, $e6, $20, $61, $e6, $76, $21, $d8, $b1, $a1, $93, $41, $91, $b3, $41
    db $b1, $c1, $c1, $d7, $21, $e6, $76, $41, $e6, $20, $41, $e6, $76, $d8, $c1, $91
    db $81, $71, $71, $71, $e6, $76, $71, $e6, $20, $71, $e6, $76, $61, $71, $81, $d9
    db $83, $e6, $76, $31, $e6, $20, $33, $e6, $76, $e6, $76, $80, $e6, $20, $80, $e6
    db $76, $80, $90, $e6, $76, $80, $e6, $20, $80, $e6, $76, $e6, $86, $e4, $00, $d7
    db $43, $11, $41, $63, $11, $61, $81, $81, $91, $e6, $86, $b1, $e6, $30, $b1, $e6
    db $86, $81, $41, $31, $23, $d8, $b1, $d7, $21, $43, $d8, $b1, $d7, $41, $61, $61
    db $71, $e6, $86, $91, $e6, $30, $91, $e6, $86, $61, $21, $11, $d8, $c3, $91, $c1
    db $d7, $23, $d8, $91, $d7, $21, $41, $41, $51, $e6, $86, $71, $e6, $30, $71, $e6
    db $86, $41, $d8, $c1, $b1, $d7, $31, $31, $31, $e6, $86, $31, $e6, $30, $31, $e6
    db $86, $d8, $a1, $d7, $31, $d8, $c1, $d9, $c3, $e6, $86, $81, $e6, $30, $81, $e6
    db $86, $e6, $86, $60, $e6, $30, $60, $e6, $86, $43, $10, $30, $d0, $06, $e5, $40
    db $e6, $64, $e8, $08, $e4, $00, $d3, $00, $71, $11, $51, $11, $71, $11, $51, $11
    db $71, $11, $51, $71, $01, $74, $00, $91, $31, $71, $31, $91, $31, $71, $31, $91
    db $31, $71, $91, $01, $94, $00, $b1, $51, $91, $51, $b1, $51, $91, $51, $b1, $51
    db $91, $b1, $01, $b4, $00, $d7, $21, $d8, $81, $c1, $81, $d7, $21, $d8, $81, $c1
    db $81, $d7, $21, $d8, $81, $c1, $d7, $21, $01, $d8, $c1, $a1, $80, $d4, $e5, $80
    db $e6, $54, $e8, $08, $71, $11, $51, $11, $d8, $c1, $d7, $11, $51, $11, $71, $11
    db $51, $e6, $54, $71, $e6, $10, $71, $e6, $54, $e6, $54, $71, $e6, $10, $73, $e6
    db $54, $91, $31, $71, $31, $91, $31, $71, $31, $91, $31, $71, $e6, $54, $91, $e6
    db $10, $91, $e6, $54, $e6, $54, $91, $e6, $10, $93, $e6, $54, $b1, $51, $91, $51
    db $b1, $51, $91, $51, $b1, $51, $91, $e6, $54, $b1, $e6, $10, $b1, $e6, $54, $e6
    db $54, $b1, $e6, $10, $b3, $e6, $54, $d7, $21, $d8, $81, $c1, $81, $d7, $21, $d8
    db $81, $c1, $81, $d7, $21, $d8, $81, $c1, $d7, $21, $e6, $10, $27, $de, $ff

data_01c_6bff:
    db $dc
    db $11, $dd, $d0, $06, $e8, $07, $e7, $02, $e9, $40, $e6, $20, $d1, $d0, $01, $1a
    db $00, $d0, $06, $11, $d7, $11, $d8, $df, $02, $d0, $01, $1a, $00, $19, $01, $d0
    db $06, $11, $d7, $11, $d8, $e0, $11, $01, $11, $d7, $11, $d8, $11, $df, $0b, $d0
    db $01, $ba, $00, $e0, $d0, $06, $b1, $01, $d0, $01, $ba, $00, $ba, $00, $d0, $06
    db $b1, $df, $0b, $d0, $01, $9a, $00, $e0, $d0, $06, $91, $01, $d0, $01, $9a, $00
    db $9a, $00, $d0, $06, $91, $d0, $01, $3a, $00, $d0, $06, $31, $d7, $31, $d8, $d0
    db $01, $3a, $00, $3a, $00, $d0, $06, $31, $d7, $31, $d8, $31, $d0, $01, $8a, $00
    db $8a, $00, $8a, $00, $d0, $06, $81, $01, $80, $00, $80, $90, $80, $00, $d0, $01
    db $1a, $00, $d0, $06, $11, $d7, $11, $d8, $df, $02, $d0, $01, $1a, $00, $19, $01
    db $d0, $06, $11, $d7, $11, $d8, $e0, $11, $01, $11, $d7, $11, $d8, $11, $df, $0b
    db $d0, $01, $ba, $00, $e0, $d0, $06, $b1, $01, $d0, $01, $ba, $00, $ba, $00, $d0
    db $06, $b1, $df, $0b, $d0, $01, $9a, $00, $e0, $d0, $06, $91, $01, $d0, $01, $9a
    db $00, $9a, $00, $d0, $06, $91, $d0, $01, $3a, $00, $d0, $06, $31, $d7, $31, $d8
    db $d0, $01, $3a, $00, $3a, $00, $d0, $06, $31, $d7, $31, $d8, $31, $d0, $01, $8a
    db $00, $8a, $00, $8a, $00, $d0, $06, $81, $60, $00, $43, $10, $30, $df, $0b, $d0
    db $01, $1a, $00, $e0, $d0, $06, $11, $01, $11, $03, $df, $0b, $d0, $01, $3a, $00
    db $e0, $d0, $06, $31, $01, $31, $03, $df, $0b, $d0, $01, $5a, $00, $e0, $d0, $06
    db $51, $01, $51, $03, $df, $0b, $d0, $01, $8a, $00, $e0, $d0, $06, $81, $01, $61
    db $41, $21, $df, $0b, $d0, $01, $1a, $00, $e0, $d0, $06, $11, $01, $11, $03, $df
    db $0b, $d0, $01, $3a, $00, $e0, $d0, $06, $31, $01, $31, $03, $df, $0b, $d0, $01
    db $5a, $00, $e0, $d0, $06, $51, $01, $51, $03, $df, $0b, $d0, $01, $8a, $00, $e0
    db $d0, $06, $81, $07, $de, $ff

data_01c_6d56:
    db $dd, $d0, $06, $d1, $df, $03, $11, $71, $31, $71
    db $11, $11, $31, $71, $e0, $11, $71, $31, $11, $71, $11, $31, $91, $df, $02, $11
    db $71, $31, $71, $11, $11, $31, $71, $e0, $11, $71, $31, $71, $11, $11, $31, $11
    db $11, $71, $31, $71, $10, $10, $d0, $01, $35, $04, $35, $35, $35, $06, $d0, $06
    db $df, $03, $11, $71, $31, $71, $11, $11, $31, $71, $e0, $11, $71, $31, $11, $71
    db $11, $31, $91, $df, $02, $11, $71, $31, $71, $11, $11, $31, $71, $e0, $11, $71
    db $31, $71, $11, $11, $31, $11, $11, $71, $31, $71, $31, $31, $d0, $01, $3a, $35
    db $36, $d0, $06, $df, $03, $10, $90, $70, $90, $30, $90, $70, $90, $10, $90, $70
    db $90, $30, $90, $70, $90, $10, $90, $70, $90, $30, $90, $10, $90, $70, $90, $30
    db $90, $70, $90, $d7, $31, $d8, $e0, $10, $90, $70, $90, $30, $90, $70, $90, $10
    db $90, $70, $90, $30, $90, $70, $90, $10, $90, $70, $90, $30, $90, $10, $90, $70
    db $90, $30, $90, $30, $90, $31, $df, $03, $10, $90, $70, $90, $30, $90, $70, $90
    db $10, $90, $70, $90, $30, $90, $70, $90, $10, $90, $70, $90, $30, $90, $10, $90
    db $70, $90, $30, $90, $70, $90, $d7, $31, $d8, $e0, $10, $90, $70, $90, $30, $90
    db $70, $90, $10, $90, $70, $90, $30, $90, $70, $90, $10, $90, $70, $90, $30, $90
    db $10, $90, $70, $00, $30, $d0, $01, $94, $35, $35, $3c, $d0, $06, $de, $ff

data_01c_6e4f:
    db $dd
    db $d0, $01, $e5, $00, $e8, $08, $ea, $0a, $eb, $01, $d3, $e6, $a5, $46, $01, $48
    db $e6, $30, $48, $e6, $75, $46, $01, $48, $e6, $30, $48, $e6, $65, $46, $01, $48
    db $e6, $20, $48, $e6, $55, $46, $01, $48, $e6, $20, $48, $e6, $45, $46, $01, $48
    db $e6, $10, $48, $e6, $35, $46, $01, $48, $e6, $10, $48, $e6, $25, $46, $01, $48
    db $d8, $e6, $a5, $b6, $01, $b8, $e6, $30, $b8, $e6, $75, $b6, $01, $b8, $e6, $30
    db $b8, $e6, $65, $b6, $01, $b8, $e6, $20, $b8, $e6, $55, $b6, $01, $b8, $e6, $20
    db $b8, $e6, $45, $b6, $01, $b8, $e6, $10, $b8, $e6, $35, $b6, $01, $b8, $e6, $10
    db $b8, $e6, $25, $b6, $01, $b8, $d7, $e6, $a5, $46, $01, $48, $e6, $30, $48, $e6
    db $75, $46, $01, $48, $e6, $30, $48, $e6, $65, $46, $01, $48, $e6, $20, $48, $e6
    db $55, $46, $01, $48, $e6, $20, $48, $e6, $45, $46, $01, $48, $e6, $10, $48, $e6
    db $35, $46, $01, $48, $e6, $10, $48, $e6, $25, $46, $01, $48, $e6, $a5, $26, $01
    db $28, $e6, $30, $28, $e6, $75, $26, $01, $28, $e6, $30, $28, $e6, $65, $26, $01
    db $28, $e6, $20, $28, $e6, $55, $26, $01, $28, $e6, $20, $28, $e6, $45, $26, $01
    db $28, $e6, $10, $28, $e6, $35, $26, $01, $28, $e6, $10, $28, $e6, $25, $26, $01
    db $28, $d0, $09, $e5, $80, $e6, $65, $e8, $08, $ea, $00, $eb, $01, $d3, $61, $d7
    db $41, $21, $d8, $61, $d7, $41, $21, $d8, $61, $d7, $41, $21, $d8, $61, $11, $d7
    db $41, $d8, $b1, $61, $d7, $41, $d8, $b1, $61, $d7, $41, $d8, $b1, $61, $51, $d7
    db $41, $21, $d8, $51, $d7, $41, $21, $d8, $51, $d7, $41, $21, $d8, $51, $d7, $41
    db $21, $d8, $51, $d7, $41, $21, $d8, $51, $d7, $41, $21, $d8, $51, $d7, $41, $d0
    db $09, $d2, $e5, $00, $df, $02, $e6, $a5, $60, $80, $d7, $10, $d8, $e6, $a5, $20
    db $e6, $30, $20, $e6, $a5, $60, $80, $d7, $10, $d8, $e6, $a5, $20, $e6, $30, $20
    db $e6, $a5, $80, $60, $20, $e6, $a5, $80, $e6, $30, $80, $e6, $a5, $60, $d7, $e6
    db $a5, $10, $e6, $30, $10, $e6, $a5, $d8, $e6, $a5, $10, $e6, $30, $10, $e6, $a5
    db $e0, $df, $02, $50, $70, $c0, $e6, $a5, $10, $e6, $30, $10, $e6, $a5, $50, $70
    db $c0, $e6, $a5, $10, $e6, $30, $10, $e6, $a5, $70, $50, $10, $e6, $a5, $70, $e6
    db $30, $70, $e6, $a5, $50, $e6, $a5, $c0, $e6, $30, $c0, $e6, $a5, $d8, $e6, $a5
    db $c0, $e6, $30, $c0, $e6, $a5, $d7, $e0, $d0, $09, $ea, $06, $eb, $0b, $d5, $e5
    db $00, $e6, $85, $df, $02, $20, $d8, $90, $21, $90, $d7, $21, $d8, $90, $21, $90
    db $d7, $23, $d0, $01, $44, $33, $d0, $09, $20, $d8, $90, $21, $d7, $e0, $df, $02
    db $10, $d8, $80, $11, $80, $d7, $11, $d8, $80, $11, $80, $d7, $13, $d0, $01, $34
    db $23, $d0, $09, $10, $d8, $80, $11, $d7, $e0, $de, $ff

data_01c_703b:
    db $dd, $d0, $01, $d2, $e5
    db $00, $e6, $a5, $b6, $01, $b8, $e6, $30, $b8, $e6, $75, $b6, $01, $b8, $e6, $30
    db $b8, $e6, $65, $b6, $01, $b8, $e6, $20, $b8, $e6, $55, $b6, $01, $b8, $e6, $20
    db $b8, $e6, $45, $b6, $01, $b8, $e6, $10, $b8, $e6, $35, $b6, $01, $b8, $e6, $10
    db $b8, $e6, $25, $b6, $01, $b8, $e6, $a5, $76, $01, $78, $e6, $30, $78, $e6, $75
    db $76, $01, $78, $e6, $30, $78, $e6, $65, $76, $01, $78, $e6, $20, $78, $e6, $55
    db $76, $01, $78, $e6, $20, $78, $e6, $45, $76, $01, $78, $e6, $10, $78, $e6, $35
    db $76, $01, $78, $e6, $10, $78, $e6, $25, $76, $01, $78, $e6, $a5, $b6, $01, $b8
    db $e6, $30, $b8, $e6, $75, $b6, $01, $b8, $e6, $30, $b8, $e6, $65, $b6, $01, $b8
    db $e6, $20, $b8, $e6, $55, $b6, $01, $b8, $e6, $20, $b8, $e6, $45, $b6, $01, $b8
    db $e6, $10, $b8, $e6, $35, $b6, $01, $b8, $e6, $10, $b8, $e6, $25, $b6, $01, $b8
    db $e6, $a5, $a6, $01, $a8, $e6, $30, $a8, $e6, $75, $a6, $01, $a8, $e6, $30, $a8
    db $e6, $65, $a6, $01, $a8, $e6, $20, $a8, $e6, $55, $a6, $01, $a8, $e6, $20, $a8
    db $e6, $45, $a6, $01, $a8, $e6, $10, $a8, $e6, $35, $a6, $01, $a8, $e6, $10, $a8
    db $e6, $25, $a6, $01, $a8, $d0, $01, $d3, $e5, $40, $e6, $a5, $46, $01, $48, $e6
    db $30, $48, $e6, $85, $46, $01, $48, $e6, $30, $48, $e6, $75, $46, $01, $48, $e6
    db $20, $48, $e6, $65, $46, $01, $48, $e6, $20, $48, $e6, $55, $46, $01, $48, $e6
    db $10, $48, $e6, $45, $46, $01, $48, $e6, $10, $48, $e6, $35, $46, $01, $48, $d8
    db $e6, $a5, $b6, $01, $b8, $e6, $30, $b8, $e6, $85, $b6, $01, $b8, $e6, $30, $b8
    db $e6, $75, $b6, $01, $b8, $e6, $20, $b8, $e6, $65, $b6, $01, $b8, $e6, $20, $b8
    db $e6, $55, $b6, $01, $b8, $e6, $10, $b8, $e6, $45, $b6, $01, $b8, $e6, $10, $b8
    db $e6, $35, $b6, $01, $b8, $d7, $e6, $a5, $46, $01, $48, $e6, $30, $48, $e6, $85
    db $46, $01, $48, $e6, $30, $48, $e6, $75, $46, $01, $48, $e6, $20, $48, $e6, $65
    db $46, $01, $48, $e6, $20, $48, $e6, $55, $46, $01, $48, $e6, $10, $48, $e6, $45
    db $46, $01, $48, $e6, $10, $48, $e6, $35, $46, $01, $48, $e8, $07, $df, $06, $e6
    db $a0, $28, $e6, $50, $28, $e6, $30, $28, $e0, $e6, $a0, $28, $e6, $50, $28, $d0
    db $09, $e5, $00, $e6, $73, $e8, $08, $d2, $01, $df, $02, $e6, $73, $60, $80, $d7
    db $10, $d8, $20, $e6, $20, $20, $e6, $73, $60, $80, $d7, $10, $d8, $20, $e6, $20
    db $20, $e6, $73, $80, $60, $20, $80, $e6, $20, $80, $e6, $73, $60, $d7, $10, $e6
    db $20, $10, $d8, $e6, $73, $10, $e6, $20, $10, $e0, $e6, $73, $50, $70, $c0, $10
    db $e6, $20, $10, $e6, $73, $50, $70, $c0, $10, $e6, $20, $10, $e6, $73, $70, $50
    db $10, $70, $e6, $20, $70, $e6, $73, $50, $c0, $e6, $20, $c0, $d8, $e6, $73, $c0
    db $e6, $20, $c0, $d7, $e6, $73, $50, $70, $c0, $10, $e6, $20, $10, $e6, $73, $50
    db $70, $c0, $10, $e6, $20, $10, $e6, $73, $70, $50, $10, $70, $e6, $20, $70, $e6
    db $73, $50, $c0, $e6, $20, $c0, $d0, $09, $d2, $e5, $00, $e6, $93, $60, $80, $d7
    db $10, $d8, $e6, $93, $20, $e6, $30, $20, $e6, $93, $60, $80, $d7, $10, $d8, $e6
    db $93, $20, $e6, $30, $20, $e6, $93, $80, $60, $20, $e6, $93, $80, $e6, $30, $80
    db $e6, $93, $60, $d7, $e6, $93, $10, $e6, $30, $10, $e6, $93, $d8, $e6, $93, $10
    db $e6, $30, $10, $e6, $93, $60, $80, $d7, $10, $d8, $e6, $93, $20, $e6, $30, $20
    db $e6, $93, $60, $80, $d7, $10, $d8, $e6, $93, $20, $e6, $30, $20, $e6, $93, $80
    db $60, $20, $e6, $93, $80, $e6, $30, $80, $e6, $93, $60, $d7, $e6, $93, $10, $e6
    db $30, $10, $e6, $93, $d8, $e6, $93, $10, $e6, $30, $10, $e6, $93, $50, $70, $c0
    db $e6, $93, $10, $e6, $30, $10, $e6, $93, $50, $70, $c0, $e6, $93, $10, $e6, $30
    db $10, $e6, $93, $70, $50, $10, $e6, $93, $70, $e6, $30, $70, $e6, $93, $50, $e6
    db $93, $c0, $e6, $30, $c0, $e6, $93, $d8, $e6, $93, $c0, $e6, $30, $c0, $e6, $93
    db $d7, $50, $70, $c0, $e6, $93, $10, $e6, $30, $10, $e6, $93, $50, $70, $c0, $e6
    db $93, $10, $e6, $30, $10, $e6, $93, $70, $50, $10, $e6, $93, $70, $e6, $30, $70
    db $e6, $93, $50, $e6, $93, $c0, $e6, $30, $c0, $e6, $93, $d8, $e6, $93, $c0, $e6
    db $30, $c0, $e6, $93, $de, $ff

data_01c_7336:
    db $dd, $d0, $09, $e8, $08, $e7, $02, $e9, $60, $e6
    db $20, $df, $02, $d2, $60, $d1, $10, $00, $e0, $e6, $40, $df, $04, $d2, $60, $d1
    db $10, $00, $e0, $d2, $60, $00, $e6, $20, $df, $02, $d2, $10, $d1, $40, $00, $e0
    db $e6, $40, $df, $04, $d2, $10, $d1, $40, $00, $e0, $d2, $10, $00, $e6, $20, $df
    db $02, $d2, $50, $d1, $50, $00, $e0, $e6, $40, $df, $04, $d2, $50, $d1, $50, $00
    db $e0, $d2, $50, $00, $e6, $20, $d1, $51, $a0, $d7, $50, $90, $71, $50, $d8, $a3
    db $57, $e9, $60, $e6, $20, $df, $03, $d2, $b0, $d1, $10, $00, $e0, $e6, $40, $df
    db $03, $d2, $b0, $d1, $10, $00, $e0, $d2, $b0, $00, $e6, $20, $df, $03, $d2, $70
    db $d1, $40, $00, $e0, $e6, $40, $df, $03, $d2, $70, $d1, $40, $00, $e0, $d2, $70
    db $00, $e6, $20, $df, $03, $d2, $b0, $d1, $50, $00, $e0, $e6, $40, $df, $03, $d2
    db $b0, $d1, $50, $00, $e0, $d2, $b0, $00, $e6, $20, $d1, $51, $a0, $d7, $50, $90
    db $71, $50, $d8, $a6, $d0, $01, $74, $63, $d0, $09, $50, $70, $51, $d0, $09, $e8
    db $08, $e4, $fc, $e7, $02, $e9, $60, $e6, $60, $d2, $d0, $03, $65, $d0, $09, $80
    db $d7, $10, $d8, $21, $60, $80, $d7, $10, $d8, $21, $80, $60, $20, $81, $60, $d7
    db $11, $d8, $11, $60, $80, $d7, $10, $d8, $21, $60, $80, $d7, $10, $d8, $21, $80
    db $60, $20, $81, $60, $d7, $11, $d8, $11, $50, $70, $c0, $11, $50, $70, $c0, $11
    db $70, $50, $10, $71, $50, $c1, $d8, $c1, $d7, $50, $70, $c0, $11, $50, $70, $c0
    db $11, $70, $50, $10, $71, $50, $c1, $d8, $d0, $03, $c2, $d0, $09, $d7, $e7, $02
    db $e9, $60, $e6, $20, $d1, $e8, $07, $e4, $00, $d0, $09, $d7, $20, $d8, $90, $21
    db $90, $d7, $21, $d8, $90, $21, $90, $d7, $23, $d0, $01, $44, $33, $d0, $09, $20
    db $d8, $90, $21, $d7, $20, $d8, $90, $21, $90, $d7, $21, $d8, $90, $21, $90, $d7
    db $23, $d0, $01, $44, $33, $d0, $09, $20, $d8, $90, $21, $d7, $10, $d8, $80, $11
    db $80, $d7, $11, $d8, $80, $11, $80, $d7, $13, $d0, $01, $34, $23, $d0, $09, $10
    db $d8, $80, $11, $d7, $10, $d8, $80, $11, $80, $d7, $11, $d8, $80, $11, $80, $d7
    db $13, $d0, $01, $34, $23, $d0, $09, $10, $d8, $80, $11, $de, $ff

data_01c_74bd:
    db $dd, $d0, $09
    db $d1, $df, $03, $70, $90, $d7, $70, $70, $90, $90, $b0, $d8, $70, $40, $90, $70
    db $40, $70, $90, $40, $90, $70, $70, $91, $e0, $70, $90, $d7, $70, $70, $90, $90
    db $b0, $d8, $90, $40, $90, $70, $40, $d7, $a0, $d8, $90, $70, $a0, $70, $90, $61
    db $df, $04, $70, $90, $70, $90, $70, $90, $70, $90, $70, $90, $70, $90, $70, $90
    db $70, $90, $70, $70, $91, $e0, $10, $10, $90, $70, $90, $70, $90, $90, $70, $90
    db $70, $90, $90, $70, $90, $90, $70, $90, $70, $90, $df, $03, $10, $10, $90, $70
    db $90, $70, $90, $90, $70, $90, $70, $90, $90, $70, $90, $90, $70, $90, $70, $90
    db $e0, $df, $04, $70, $90, $90, $70, $90, $70, $90, $90, $70, $90, $70, $90, $90
    db $70, $90, $70, $70, $90, $70, $90, $e0, $de, $ff

data_01c_754a:
    db $dc, $11, $dd, $d0, $0a, $e5
    db $40, $d3, $e8, $08, $ea, $06, $eb, $09, $df, $02, $e6, $c5, $51, $d8, $a1, $91
    db $31, $41, $51, $d7, $41, $e6, $20, $41, $e0, $e6, $c5, $51, $d8, $a1, $91, $31
    db $41, $51, $d7, $41, $71, $61, $d8, $c1, $d7, $11, $d8, $c1, $71, $81, $21, $e6
    db $20, $21, $e6, $c5, $51, $a1, $91, $31, $41, $51, $d7, $41, $e6, $20, $41, $e6
    db $c5, $51, $d8, $a1, $91, $31, $41, $51, $d7, $41, $e6, $20, $41, $e6, $c5, $51
    db $d8, $a1, $91, $31, $41, $51, $d7, $41, $71, $e6, $20, $71, $d8, $e6, $c5, $c1
    db $d7, $11, $d8, $c1, $e6, $d2, $e8, $07, $70, $e6, $b3, $e8, $08, $70, $e6, $d2
    db $e8, $07, $80, $e6, $b3, $e8, $08, $80, $d0, $01, $e6, $d3, $28, $00, $e6, $b3
    db $28, $00, $e6, $93, $28, $00, $e6, $85, $29, $d0, $0a, $d2, $e5, $80, $e6, $96
    db $e8, $08, $ea, $06, $eb, $0d, $e6, $97, $df, $04, $a3, $e0, $df, $04, $c3, $e0
    db $d7, $df, $04, $23, $e0, $43, $43, $e6, $94, $41, $e6, $97, $41, $e6, $10, $43
    db $d8, $e6, $97, $df, $04, $a3, $e0, $df, $04, $c3, $e0, $d7, $df, $04, $23, $e0
    db $53, $53, $e6, $94, $51, $e6, $97, $51, $e6, $10, $53, $de, $ff

data_01c_761d:
    db $dd, $d0, $0a
    db $d3, $e8, $08, $e4, $fd, $e5, $40, $e6, $67, $d0, $01, $0e, $d0, $0a, $51, $d8
    db $a1, $91, $31, $41, $51, $d7, $43, $51, $d8, $a1, $91, $31, $41, $51, $d7, $43
    db $51, $d8, $a1, $91, $31, $41, $51, $d7, $41, $71, $61, $d8, $c1, $d7, $11, $d8
    db $c1, $71, $81, $23, $51, $a1, $91, $31, $41, $51, $d7, $43, $51, $d8, $a1, $91
    db $31, $41, $51, $d7, $43, $51, $d8, $a1, $91, $31, $41, $51, $d7, $41, $73, $d8
    db $c1, $d7, $11, $d8, $c1, $e6, $57, $70, $e6, $37, $70, $e6, $57, $80, $e6, $37
    db $80, $e6, $57, $20, $e6, $37, $20, $e6, $27, $d0, $01, $24, $d0, $0a, $d0, $0a
    db $e5, $40, $e6, $c7, $e8, $08, $e4, $00, $d2, $df, $08, $83, $e0, $df, $06, $c3
    db $e0, $e6, $c4, $c1, $e6, $c7, $c1, $e6, $10, $c3, $e6, $c7, $df, $08, $83, $e0
    db $df, $04, $c3, $e0, $d7, $13, $13, $e6, $c4, $11, $e6, $c7, $11, $e6, $10, $13
    db $de, $ff

data_01c_76c2:
    db $dd, $d0, $0a, $e8, $07, $e7, $02, $e9, $40, $e6, $20, $d1, $5f, $4d
    db $30, $40, $5d, $60, $50, $27, $15, $20, $30, $5f, $4d, $40, $a0, $5d, $60, $40
    db $23, $23, $17, $e7, $05, $df, $0e, $83, $e0, $e7, $02, $81, $81, $e9, $60, $e6
    db $60, $83, $e7, $05, $e9, $40, $e6, $20, $df, $0c, $83, $e0, $93, $93, $e7, $02
    db $91, $91, $e9, $60, $e6, $60, $93, $de, $ff

data_01c_7709:
    db $dd, $d0, $0a, $d1, $df, $04, $93
    db $93, $93, $93, $e0, $93, $93, $91, $70, $70, $d7, $83, $d8, $93, $93, $91, $70
    db $70, $d7, $83, $d8, $93, $93, $93, $91, $70, $70, $91, $70, $70, $91, $70, $70
    db $90, $90, $70, $70, $d7, $80, $80, $80, $80, $d8, $df, $03, $11, $01, $11, $01
    db $11, $01, $11, $01, $e0, $11, $01, $11, $01, $11, $11, $03, $df, $03, $b1, $b1
    db $11, $b1, $b1, $b1, $11, $b1, $e0, $b1, $b1, $11, $b1, $11, $11, $03, $de, $ff

data_01c_7760:
    db $dc, $11, $dd, $d0, $05, $e8, $08, $ea, $0c, $eb, $01, $e5, $00, $df, $02, $d4
    db $df, $04, $e6, $a7, $21, $e6, $30, $21, $e0, $e6, $30, $23, $e6, $20, $23, $df
    db $03, $e6, $a7, $21, $e6, $30, $21, $e0, $d8, $e6, $a7, $a1, $e6, $30, $a1, $e6
    db $30, $a3, $e6, $20, $a3, $e0, $d0, $05, $d3, $e5, $40, $e6, $93, $51, $81, $51
    db $d7, $21, $d8, $51, $81, $51, $81, $51, $d7, $21, $d8, $51, $81, $51, $81, $51
    db $d7, $21, $d8, $51, $81, $41, $a1, $d7, $41, $a1, $41, $d8, $a1, $51, $81, $51
    db $d7, $21, $d8, $51, $81, $51, $81, $51, $d7, $21, $d8, $51, $81, $51, $d7, $21
    db $d8, $51, $b1, $51, $81, $41, $a1, $d7, $41, $a1, $41, $d8, $a1, $ea, $0f, $eb
    db $03, $d4, $df, $02, $e5, $00, $e6, $b4, $82, $e5, $40, $e6, $56, $82, $e5, $00
    db $e6, $b4, $42, $e5, $40, $e6, $56, $42, $d8, $e5, $00, $e6, $b4, $c2, $e5, $40
    db $e6, $56, $c2, $e5, $00, $e6, $b4, $82, $e5, $40, $e6, $56, $82, $d7, $e5, $00
    db $e6, $b4, $12, $e5, $40, $e6, $56, $12, $e5, $00, $e6, $b4, $42, $e5, $40, $e6
    db $56, $42, $e5, $00, $e6, $b4, $b2, $e5, $40, $e6, $56, $b2, $d7, $e5, $00, $e6
    db $b4, $12, $e5, $40, $e6, $56, $12, $d8, $e0, $e5, $00, $e6, $b5, $72, $e5, $40
    db $e6, $67, $72, $e5, $00, $e6, $b5, $62, $e5, $40, $e6, $67, $62, $e5, $00, $e6
    db $b5, $22, $e5, $40, $e6, $67, $22, $d8, $e5, $00, $e6, $b5, $62, $e5, $40, $e6
    db $67, $62, $e5, $00, $e6, $b5, $72, $e5, $40, $e6, $67, $72, $e5, $00, $e6, $b5
    db $a2, $e5, $40, $e6, $67, $a2, $d7, $d7, $e5, $00, $e6, $b5, $52, $e5, $40, $e6
    db $67, $52, $e5, $00, $e6, $b5, $72, $e5, $40, $e6, $67, $72, $d8, $e5, $00, $e6
    db $b5, $92, $e5, $40, $e6, $67, $c2, $e5, $00, $e6, $b5, $62, $e5, $40, $e6, $67
    db $62, $e5, $00, $e6, $b5, $72, $e5, $40, $e6, $67, $72, $e5, $00, $e6, $b5, $22
    db $e5, $40, $e6, $67, $22, $d8, $e5, $00, $e6, $b5, $92, $e5, $40, $e6, $67, $92
    db $e5, $00, $e6, $b5, $a2, $e5, $40, $e6, $67, $a2, $d7, $d7, $e5, $00, $e6, $b5
    db $52, $e5, $40, $e6, $67, $52, $e5, $00, $e6, $b5, $72, $e5, $40, $e6, $67, $72
    db $d8, $e5, $00, $e6, $b5, $ea, $0c, $eb, $01, $df, $02, $61, $d8, $61, $d7, $61
    db $21, $d8, $21, $d7, $21, $d8, $a1, $d8, $a1, $d7, $a1, $61, $d8, $61, $d7, $61
    db $b1, $d8, $b1, $d7, $b1, $d7, $21, $d8, $21, $d7, $21, $91, $d8, $91, $d7, $91
    db $b1, $d8, $b1, $d7, $b1, $e0, $df, $02, $51, $d8, $51, $d7, $51, $71, $d8, $71
    db $d7, $71, $81, $d8, $81, $d7, $81, $41, $d8, $41, $d7, $41, $51, $d8, $51, $d7
    db $51, $c1, $d8, $c1, $d7, $c1, $31, $d8, $31, $d7, $31, $21, $d8, $21, $d7, $21
    db $e0, $de, $ff

data_01c_7943:
    db $dd, $d0, $05, $e5, $40, $e8, $08, $e4, $00, $d3, $df, $02, $df
    db $04, $e6, $a7, $b1, $e6, $30, $b1, $e0, $e6, $20, $b3, $e6, $10, $b3, $df, $03
    db $e6, $a7, $b1, $e6, $30, $b1, $e0, $e6, $a7, $81, $e6, $30, $81, $e6, $20, $83
    db $e6, $10, $83, $e0, $e5, $00, $e8, $08, $df, $02, $d4, $df, $04, $e6, $d3, $21
    db $d8, $e6, $54, $b1, $d7, $e0, $e6, $30, $21, $d8, $b1, $d7, $e6, $20, $21, $d8
    db $b1, $d4, $df, $03, $e6, $d3, $21, $d8, $e6, $54, $b1, $d7, $e0, $d3, $e6, $d3
    db $a1, $e6, $54, $81, $e6, $30, $a1, $81, $e6, $20, $a1, $81, $e0, $d4, $e5, $80
    db $e6, $54, $df, $02, $11, $41, $81, $b1, $81, $41, $11, $41, $81, $c1, $81, $41
    db $11, $81, $c1, $d7, $31, $d8, $c1, $81, $d7, $21, $d8, $b1, $71, $d7, $41, $11
    db $d8, $91, $e0, $df, $02, $71, $a1, $d7, $21, $61, $21, $d8, $a1, $71, $a1, $d7
    db $21, $61, $21, $d8, $a1, $71, $d7, $21, $61, $91, $61, $21, $81, $51, $11, $a1
    db $71, $31, $d8, $e0, $d0, $05, $e5, $40, $e6, $63, $e8, $08, $e4, $ff

    db $d5, $00
    db $61, $d8, $61, $d7, $61, $21, $d8, $21, $d7, $21, $d8, $a1, $d8, $a1, $d7, $a1
    db $61, $d8, $61, $d7, $60, $d9, $60, $b1, $d8, $b1, $d7, $b1, $d7, $21, $d8, $21
    db $d7, $21, $91, $d8, $91, $d7, $91, $b1, $d8, $b1, $d7, $b0, $d9, $b0, $61, $d8
    db $61, $d7, $61, $21, $d8, $21, $d7, $21, $d8, $a1, $d8, $a1, $d7, $a1, $61, $d8
    db $61, $d7, $60, $d9, $60, $b1, $d8, $b1, $d7, $b1, $d7, $21, $d8, $21, $d7, $21
    db $91, $d8, $91, $d7, $91, $b1, $d8, $b1, $d7, $b0, $d9, $b0, $51, $d8, $51, $d7
    db $51, $71, $d8, $71, $d7, $71, $81, $d8, $81, $d7, $81, $41, $d8, $41, $d7, $40
    db $d9, $40, $51, $d8, $51, $d7, $51, $c1, $d8, $c1, $d7, $c1, $31, $d8, $31, $d7
    db $31, $21, $d8, $21, $d7, $20, $d9, $20, $51, $d8, $51, $d7, $51, $71, $d8, $71
    db $d7, $71, $81, $d8, $81, $d7, $81, $41, $d8, $41, $d7, $40, $d9, $40, $51, $d8
    db $51, $d7, $51, $c1, $d8, $c1, $d7, $c1, $31, $d8, $31, $d7, $31, $21, $d8, $21
    db $d7, $20, $de, $ff

data_01c_7ab4:
    db $dc, $11, $dd, $d0, $05, $e7, $01, $e9, $60, $e6, $20, $d1
    db $e8, $07, $df, $04, $e6, $20, $51, $e6, $60, $51, $df, $02, $e6, $20, $51, $b1
    db $51, $21, $51, $e6, $60, $51, $e0, $e6, $20, $51, $b1, $51, $21, $35, $85, $e0
    db $e8, $07, $df, $02, $15, $15, $15, $15, $15, $15, $95, $b5, $e0, $df, $02, $75
    db $75, $75, $75, $75, $75, $d7, $35, $55, $d8, $e0, $e8, $08, $df, $02, $e6, $20
    db $b1, $61, $b1, $d7, $21, $e6, $60, $21, $d8, $df, $02, $e6, $20, $b1, $b1, $61
    db $b1, $d7, $21, $e6, $60, $21, $d8, $e0, $e6, $20, $b1, $71, $71, $71, $91, $91
    db $91, $e0, $df, $02, $e6, $20, $51, $c1, $d7, $51, $81, $e6, $60, $81, $df, $02
    db $e6, $20, $51, $d8, $51, $c1, $d7, $51, $81, $e6, $60, $81, $e0, $e6, $20, $51
    db $11, $11, $11, $31, $31, $31, $d8, $e0, $de, $ff

data_01c_7b4a:
    db $dd, $d0, $05, $d1, $df, $03
    db $11, $71, $11, $31, $11, $71, $11, $71, $11, $31, $11, $71, $11, $71, $11, $31
    db $11, $71, $11, $31, $71, $31, $11, $91, $e0, $11, $71, $11, $31, $11, $71, $11
    db $71, $11, $31, $11, $71, $11, $71, $11, $31, $11, $71, $71, $d7, $c3, $a3, $81
    db $d8, $df, $03, $11, $71, $71, $91, $71, $71, $11, $71, $71, $91, $71, $71, $11
    db $71, $71, $91, $71, $71, $11, $11, $71, $31, $31, $31, $e0, $11, $71, $71, $91
    db $71, $71, $11, $71, $71, $91, $71, $71, $11, $71, $71, $91, $71, $71, $31, $11
    db $d7, $c0, $c0, $c1, $a1, $81, $d8, $df, $03, $11, $71, $71, $91, $71, $71, $11
    db $71, $71, $91, $71, $71, $11, $71, $71, $91, $71, $71, $11, $11, $71, $31, $31
    db $31, $e0, $11, $71, $71, $91, $71, $71, $11, $71, $71, $91, $71, $71, $11, $71
    db $71, $91, $71, $71, $11, $31, $91, $31, $91, $31, $de, $ff

    db $91, $31, $de, $ff

    db $11, $71, $71, $91, $71, $71, $11, $71, $71, $91, $71, $71, $11, $31, $91, $31
