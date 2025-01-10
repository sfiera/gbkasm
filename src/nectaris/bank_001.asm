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
INCLUDE "nectaris/units.inc"

SECTION "ROM Bank $001", ROMX

Call_001_4000::
    call Call_001_5616

Jump_001_4003:
jr_001_4003:
    call Call_001_450a
    call Call_000_1590
    cp $00
    jp nz, Jump_000_3272

    call Call_000_13f0
    ld a, [$d99a]
    cp $14
    jp nc, Jump_001_44eb

    call Call_001_4538
    ld a, [$d99d]
    cp $ff
    jr z, jr_001_4003

    ld a, [$da41]
    cp $ff
    jr z, jr_001_4003

    ld c, $00
    ld a, $0b
    ld d, $00
    ld e, $00
    call Call_000_08ff
    ld hl, $da41
    ld a, [hl]
    cp $ff
    jr z, jr_001_4003

Jump_001_403d:
    ld a, [hl+]
    cp $ff
    jp z, Jump_001_44d2

    cp $00
    jp z, Jump_001_4078

    cp $01
    jp z, Jump_001_4275

    cp $02
    jp z, Jump_001_42e2

    cp $03
    jp z, Jump_001_4300

    cp $05
    jp z, Jump_001_4325

    cp $06
    jp z, Jump_001_432d

    cp $07
    jp z, Jump_001_445b

    cp $08
    jp z, Jump_001_4463

    cp $09
    jp z, Jump_001_446b

    cp $0a
    jp z, Jump_001_4473

    jp Jump_001_42e2


Jump_001_4078:
    call Call_001_44f1
    push hl
    call Call_000_1630
    ld a, [$d99d]
    ld [$d7b5], a
    call Call_000_13f0
    call Call_000_1e75
    call Call_000_16b0
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    pop hl
    ld a, [hl+]
    ld [$daff], a
    ld a, [hl+]
    ld [$db00], a
    push hl
    call Call_000_1710
    ld a, [$d99d]
    ld [$d7b5], a
    call Call_000_1490
    cp $ff
    jp z, Jump_001_4170

    ld b, a
    call Call_000_099b
    ld a, [hl]
    cp $ff
    jp z, Jump_001_4170

    and $80
    ld c, a
    ld a, [$d90f]
    cp c
    jp nz, Jump_001_4170

    inc hl
    ld a, [hl]
    and $e0
    cp $00
    jp nz, Jump_001_4170

    inc hl
    ld a, [hl]
    bit 5, a
    jp nz, Jump_001_4170

    bit 6, a
    jp nz, Jump_001_4170

    dec hl
    dec hl
    ld a, [hl]
    and $1f
    cp $15
    jp nz, Jump_001_410a

    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    and $1f
    cp $00
    jp z, Jump_001_412f

    cp $11
    jp z, Jump_001_412f

    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_ABCD
    cp UNIT_INFANTRY
    jp nz, Jump_001_4170

    jr jr_001_412f

Jump_001_410a:
    cp $16
    jp nz, Jump_001_4170

    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    and $1f
    cp $00
    jp z, Jump_001_412f

    cp $11
    jp z, Jump_001_412f

    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    bit UNIT_IS_AIR_F, a
    jr nz, jr_001_4170

Jump_001_412f:
jr_001_412f:
    ld a, $08
    call Call_000_0d07
    ld a, b
    call Call_000_099b
    ld a, [hl]
    ld [hl+], a
    ld a, [hl]
    and $1f
    ld [hl+], a
    ld a, [hl]
    or $20
    ld [hl+], a
    inc hl
    ld a, [$d7b5]
    ld [hl], a
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl+], a
    ld a, [hl]
    and $1f
    ld [hl+], a
    ld a, [hl]
    and $c0
    or $40
    ld [hl+], a
    inc hl
    ld a, b
    ld [hl], a
    call Call_000_15b0
    call Call_000_1630
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    jp Jump_001_425b


Jump_001_4170:
jr_001_4170:
    ld a, [$d79f]
    ld b, a
    ld a, [$d7a0]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    and $0f
    cp $0c
    jr z, jr_001_418d

    push af
    ld a, [$d911]
    ld b, a
    pop af
    cp b
    jr z, jr_001_418d

    jr jr_001_41df

jr_001_418d:
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_ABCD
    cp UNIT_INFANTRY
    jp nz, Jump_001_4242

    call Call_000_1878
    ld a, [$d87a]
    cp $ff
    jp z, Jump_000_2c26

    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl+], a
    ld a, [$d79f]
    and $1f
    ld b, a
    ld a, [$d87a]
    sla a
    sla a
    sla a
    sla a
    sla a
    or b
    ld [hl+], a
    ld a, [hl]
    push af
    ld a, [$d7a0]
    ld [hl], a
    pop af
    call Call_000_1630
    call Call_000_18b8
    jr jr_001_4242

jr_001_41df:
    push af
    ld a, [$d910]
    ld b, a
    pop af
    cp b
    jp nz, Jump_001_4242

    call Call_000_1878
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl], a
    inc hl
    ld a, [$d87a]
    sla a
    sla a
    sla a
    sla a
    sla a
    ld b, a
    ld a, [$d79f]
    and $1f
    or b
    ld [hl+], a
    ld a, [hl]
    push af
    ld a, [$d7a0]
    ld [hl], a
    pop af
    bit 5, a
    jr z, jr_001_4242

    inc hl
    inc hl
    ld a, [hl]
    push af
    ld a, $ff
    ld [hl], a
    pop af
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl], a
    inc hl
    ld a, [$d87a]
    sla a
    sla a
    sla a
    sla a
    sla a
    ld b, a
    ld a, [$d79f]
    and $1f
    or b
    ld [hl+], a
    ld a, [$d7a0]
    and $1f
    ld [hl], a

Jump_001_4242:
jr_001_4242:
    ld a, [$d99d]
    call Call_000_099b
    inc hl
    ld a, [$d79f]
    ld b, a
    ld a, [hl]
    and $e0
    or b
    ld [hl+], a
    ld a, [$d7a0]
    ld b, a
    ld a, [hl]
    and $e0
    or b
    ld [hl], a

Jump_001_425b:
    call Call_000_1630
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    pop hl
    push hl
    call Call_000_1590
    pop hl
    cp $00
    jp nz, Jump_000_3272

    jp Jump_001_44ca


Jump_001_4275:
    call Call_001_44f1
    ld a, [hl+]
    ld [$daff], a
    ld a, [hl+]
    ld [$db00], a
    push hl
    call Call_000_1710
    ld a, [$d99d]
    ld [$d7b5], a
    ld [$d7c3], a
    call Call_000_1490
    cp $ff
    jp z, Jump_001_42d2

    ld [$d7c4], a
    call Call_000_346f
    ld a, [$d7c4]
    call Call_000_099b
    ld a, [hl]
    and $3f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld d, $00
    ld a, [hl]
    and UNIT_IS_AIR
    jr nz, jr_001_42bc

    ld a, b
    cp $01
    jr z, jr_001_42c5

    ld d, $01
    jr jr_001_42c5

jr_001_42bc:
    ld a, c
    cp $01
    jr z, jr_001_42c5

    ld d, $01
    jr jr_001_42c5

jr_001_42c5:
    ld a, d
    ld [$da11], a
    call Call_000_3828
    call Call_000_15b0
    call Call_000_1630

Jump_001_42d2:
    call Call_000_1630
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    pop hl
    jp Jump_001_44ca


Jump_001_42e2:
    call Call_001_44f1
    push hl
    ld a, [$d99d]
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl], a
    call Call_000_1630
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    pop hl
    jp Jump_001_44ca


Jump_001_4300:
    call Call_001_44f1
    push hl
    ld a, [$d99d]
    call Call_000_099b
    ld a, [hl]
    and $7f
    ld b, a
    ld a, [$d90f]
    or b
    or $40
    ld [hl], a
    call Call_000_1630
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    pop hl
    jp Jump_001_44ca


Jump_001_4325:
    call Call_001_44f1
    push hl
    pop hl
    jp Jump_001_44ca


Jump_001_432d:
    ld a, [hl+]
    ld [$daff], a
    ld a, [hl+]
    ld [$db00], a
    push hl
    call Call_000_1710
    pop hl
    ld a, [hl+]
    ld de, $dac0
    call Call_000_08a1
    ld a, [de]
    ld [$d99d], a
    ld [$d7b5], a
    ld a, [hl+]
    and $1f
    ld [$daff], a
    ld a, [hl+]
    ld [$db00], a
    push hl
    call Call_000_1710
    call Call_000_1490
    cp $ff
    jp z, Jump_001_442b

    ld b, a
    call Call_000_099b
    ld a, [hl]
    cp $ff
    jp z, Jump_001_442b

    and $80
    ld c, a
    ld a, [$d90f]
    cp c
    jp nz, Jump_001_441f

    inc hl
    ld a, [hl]
    and $e0
    cp $00
    jp nz, Jump_001_441f

    inc hl
    ld a, [hl]
    bit 5, a
    jp nz, Jump_001_441f

    bit 6, a
    jp nz, Jump_001_441f

    dec hl
    dec hl
    ld a, [hl]
    and $1f
    cp $15
    jp nz, Jump_001_43b6

    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    and $1f
    cp $00
    jp z, Jump_001_43db

    cp $11
    jp z, Jump_001_43db

    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_ABCD
    cp UNIT_INFANTRY
    jp nz, Jump_001_441f

    jr jr_001_43db

Jump_001_43b6:
    cp $16
    jp nz, Jump_001_441f

    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    and $1f
    cp $00
    jp z, Jump_001_43db

    cp $11
    jp z, Jump_001_43db

    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    bit UNIT_IS_AIR_F, a
    jr nz, jr_001_441f

Jump_001_43db:
jr_001_43db:
    ld a, $08
    call Call_000_0d07
    ld a, b
    call Call_000_099b
    ld a, [hl]
    and $7f
    ld c, a
    ld a, [$d90f]
    or c
    ld [hl], a
    inc hl
    ld a, [hl]
    and $1f
    ld [hl+], a
    ld a, [hl]
    or $20
    ld [hl+], a
    inc hl
    ld a, [$d7b5]
    ld [hl], a
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    or $40
    and $7f
    ld c, a
    ld a, [$d90f]
    or c
    ld [hl+], a
    ld a, [hl]
    and $1f
    ld [hl+], a
    ld a, [hl]
    and $80
    or $40
    ld [hl+], a
    inc hl
    ld a, b
    ld [hl+], a
    call Call_000_15b0
    jp Jump_001_4449


Jump_001_441f:
jr_001_441f:
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl+], a
    jr jr_001_4449

Jump_001_442b:
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    and $7f
    ld b, a
    ld a, [$d90f]
    or b
    or $40
    ld [hl+], a
    ld a, [$d79f]
    ld [hl+], a
    ld a, [$d7a0]
    ld b, a
    ld a, [hl]
    and $e0
    or b
    ld [hl], a

Jump_001_4449:
jr_001_4449:
    pop hl
    push hl
    call Call_000_1630
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    pop hl
    jp Jump_001_44ca


Jump_001_445b:
    call Call_001_44f1
    push hl
    pop hl
    jp Jump_001_44ca


Jump_001_4463:
    call Call_001_44f1
    push hl
    pop hl
    jp Jump_001_44ca


Jump_001_446b:
    call Call_001_44f1
    push hl
    pop hl
    jp Jump_001_44ca


Jump_001_4473:
    call Call_001_44f1
    ld a, [hl+]
    ld [$daff], a
    ld a, [hl+]
    ld [$db00], a
    push hl
    call Call_000_1710
    ld a, [$d99d]
    call Call_000_099b
    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    pop hl
    ld [$d86f], a
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    push af
    ld a, $ff
    ld [hl], a
    dec hl
    dec hl
    ld a, [hl]
    and $1f
    ld [hl], a
    dec hl
    dec hl
    ld a, [hl]
    or $40
    ld b, a
    ld a, [$d90f]
    or b
    ld [hl], a
    pop af
    call Call_000_099b
    ld a, [hl]
    or $40
    ld b, a
    ld a, [$d90f]
    or b
    ld [hl+], a
    ld a, [$d79f]
    ld [hl+], a
    ld a, [$d7a0]
    ld [hl+], a
    inc hl
    ld a, $ff
    ld [hl+], a
    pop hl
    jp Jump_001_44ca


Jump_001_44ca:
    push hl
    call Call_001_450a
    pop hl
    jp Jump_001_403d


Jump_001_44d2:
    ld a, [$d99d]
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl], a
    call Call_000_1630
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    jp Jump_001_4003


Jump_001_44eb:
    call Call_000_3c96
    jp Jump_000_28c9


Call_001_44f1:
    push hl
    ld a, [$d99d]
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $1f
    ld [$daff], a
    ld a, [hl+]
    and $1f
    ld [$db00], a
    call Call_000_1710
    pop hl
    ret


Call_001_450a:
    push af
    push bc
    push de
    push hl
    ld a, [$d99a]
    ld b, $00

jr_001_4513:
    cp $0a
    jr c, jr_001_451c

    sub $0a
    inc b
    jr jr_001_4513

jr_001_451c:
    ld a, [$db1f]
    inc a
    ld [$db1f], a
    and $01
    xor $01
    add $10
    ld c, a
    ld a, $0b
    ld d, $a0
    ld e, $18
    call Call_000_08ff
    pop hl
    pop de
    pop bc
    pop af
    ret


Call_001_4538:
    ld a, [$d99a]
    cp $00
    jp z, Jump_001_60c6

    cp $01
    jp z, Jump_001_6182

    cp $02
    jp z, Jump_001_6e39

    cp $03
    jp z, Jump_001_6e3d

    cp $04
    jp z, Jump_001_7254

    cp $05
    jp z, Jump_001_7373

    cp $06
    jp z, Jump_001_6c4b

    cp $07
    jp z, Jump_001_6e35

    cp $08
    jp z, Jump_001_6e3d

    cp $09
    jp z, Jump_001_7947

    cp $0a
    jp z, Jump_001_7373

    cp $0b
    jp z, Jump_001_7646

    cp $0c
    jp z, Jump_001_75b8

    cp $0d
    jp z, Jump_001_6e31

    cp $0e
    jp z, Jump_001_6482

    cp $0f
    jp z, Jump_001_6206

    cp $10
    jp z, Jump_001_60c6

    cp $11
    jp z, Jump_001_6187

    cp $12
    jp z, Jump_001_7a0a

    cp $13
    jp z, Jump_001_6482

    ret


Call_001_45a0:
    push bc
    push hl
    ld a, [hl]
    cp $ff
    jr z, jr_001_45bd

    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jr nz, jr_001_45bd

    inc hl
    ld a, [hl]
    and $e0
    cp $00
    jr nz, jr_001_45bd

    pop hl
    pop bc
    ld a, $00
    ret


jr_001_45bd:
    pop hl
    pop bc
    ld a, $01
    ret


Call_001_45c2:
    push bc
    push de
    push hl
    ld a, $00
    ld [$d9b2], a
    ld a, [$d99e]
    cp b
    jr z, jr_001_4619

    ld a, [$d99e]
    ld d, a
    ld a, b
    cp d
    jr c, jr_001_45f7

    ld a, [$d99e]
    bit 0, a
    jr nz, jr_001_45eb

    ld a, [$d99f]
    ld d, a
    ld a, c
    sub d
    bit 7, a
    jr z, jr_001_4619

    jr jr_001_4612

jr_001_45eb:
    ld a, [$d99f]
    ld d, a
    ld a, c
    sub d
    bit 7, a
    jr nz, jr_001_4619

    jr jr_001_4612

jr_001_45f7:
    ld a, b
    bit 0, a
    jr nz, jr_001_4608

    ld a, [$d99f]
    ld d, a
    ld a, c
    sub d
    bit 7, a
    jr nz, jr_001_4619

    jr jr_001_4612

jr_001_4608:
    ld a, [$d99f]
    ld d, a
    ld a, c
    sub d
    bit 7, a
    jr z, jr_001_4619

jr_001_4612:
    ld a, [$d9b2]
    inc a
    ld [$d9b2], a

jr_001_4619:
    ld a, [$d99e]
    ld d, a
    ld a, [$d99f]
    ld e, a
    ld a, b
    sub d
    jr nc, jr_001_4627

    ld a, d
    sub b

jr_001_4627:
    ld [$d9a8], a
    ld h, a
    ld a, [$d9b2]
    add h
    srl a
    ld [$d9b2], a
    ld a, c
    sub e
    jr nc, jr_001_463a

    ld a, e
    sub c

jr_001_463a:
    push af
    ld a, [$d9b2]
    ld h, a
    pop af
    sub h
    bit 7, a
    jr nz, jr_001_464d

    ld h, a
    ld a, [$d9a8]
    add h
    ld [$d9a8], a

jr_001_464d:
    pop hl
    pop de
    pop bc
    ld a, [$d9a8]
    ret


Call_001_4654:
    ld hl, $ccf1
    ld b, $16

jr_001_4659:
    ld c, $20

jr_001_465b:
    xor a
    ld [hl+], a
    inc hl
    inc hl
    dec c
    jr nz, jr_001_465b

    dec b
    jr nz, jr_001_4659

    jr jr_001_4667

jr_001_4667:
    ld a, $80
    ld [$d9bb], a
    ld a, [$d99d]
    call Call_000_099b
    ld a, [hl]
    and $80
    ld [$d9bc], a
    ld b, a
    ld a, [$d90f]
    cp b
    jr z, jr_001_4684

    ld a, $40
    ld [$d9bb], a

jr_001_4684:
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_SHIFT_KIND
    call AddAToHL
    ld a, [hl]
    ld [$d9bd], a
    dec hl
    ld a, [hl]
    inc a
    ld [$d9be], a
    ld a, [$d9b6]
    cp $00
    jr z, jr_001_46a7

    ld a, [$d9b6]
    inc a
    ld [$d9be], a

jr_001_46a7:
    ld a, [$d99e]
    ld [$d9b7], a
    ld a, [$d99f]
    ld [$d9b8], a
    ld a, $80
    ld [$d9b9], a
    ld a, [$d9b4]
    sla a
    sla a
    sla a
    sla a
    ld b, a
    ld a, [$d9be]
    and $0f
    or b
    ld [$d9ba], a
    call Call_001_46d1
    ret


Call_001_46d1:
    jp Jump_001_52be


data_001_46d4:
    db $ff, $ff, $00, $01, $00, $ff, $ff, $00, $01, $01, $01, $00

data_001_46e0:
    db $00, $01, $01, $00, $ff, $ff

Call_001_46e6:
    push bc
    push hl
    push af
    ld b, $00
    ld a, [$da0c]
    bit 0, a
    jr z, jr_001_46f4

    ld b, $06

jr_001_46f4:
    pop af
    push af
    add b
    ld hl, data_001_46d4
    call AddAToHL
    ld a, [hl]
    ld b, a
    ld a, [$da0d]
    add b
    ld [$da0d], a
    pop af
    ld hl, data_001_46e0
    call AddAToHL
    ld a, [hl]
    ld b, a
    ld a, [$da0c]
    add b
    ld [$da0c], a
    pop hl
    pop bc
    ret


Call_001_4719:
    ld a, [$d99d]
    call Call_000_099b
    ld a, [hl+]
    and $1f
    ld [$d9a1], a
    ld a, [hl+]
    and $1f
    ld [$da0c], a
    ld [$d99e], a
    ld a, [hl+]
    and $1f
    ld [$da0d], a
    ld [$d99f], a
    ld a, [$d9a1]
    ld hl, data_001_55f9
    call AddAToHL
    ld a, [hl]
    ld [$d9b4], a
    ld a, $00
    ld [$d9b6], a
    ld [$d9b5], a
    call Call_001_4654
    ret


Call_001_4750::
    ld a, [$d99d]
    call Call_000_099b
    ld a, [hl+]
    and $1f
    ld [$d9a1], a
    ld a, [hl+]
    and $1f
    ld [$da0c], a
    ld [$d99e], a
    ld a, [hl+]
    and $1f
    ld [$da0d], a
    ld [$d99f], a
    ld a, $01
    ld [$d9b4], a
    ld a, $00
    ld [$d9b6], a
    ld [$d9b5], a
    call Call_001_4654
    ret


Call_001_477f::
    ld a, [$d99d]
    call Call_000_099b
    ld a, [hl+]
    and $1f
    ld [$d9a1], a
    ld a, [hl+]
    and $1f
    ld [$da0c], a
    ld [$d99e], a
    ld a, [hl+]
    and $1f
    ld [$da0d], a
    ld [$d99f], a
    ld a, $01
    ld [$d9b4], a
    ld a, $00
    ld [$d9b5], a
    ld a, [$d877]
    and $0f
    cp $00
    jr z, jr_001_47b1

    dec a

jr_001_47b1:
    ld [$d9b6], a
    call Call_001_4654
    ret


Call_001_47b8::
    ld hl, $ccf2
    ld c, $16

jr_001_47bd:
    ld b, $20

jr_001_47bf:
    ld a, $ff
    ld [hl], a
    inc hl
    inc hl
    inc hl
    dec b
    jr nz, jr_001_47bf

    dec c
    jr nz, jr_001_47bd

    ld d, $00
    ld hl, $d572

jr_001_47d0:
    push hl
    ld a, [hl+]
    cp $ff
    jr z, jr_001_47f6

    ld e, a
    ld a, [hl]
    and $e0
    cp $00
    jr nz, jr_001_47f6

    ld a, [hl+]
    and $1f
    ld b, a
    ld a, [hl+]
    bit 6, a
    jr nz, jr_001_47f6

    and $1f
    ld c, a
    push hl
    call Call_000_0969
    inc hl
    inc hl
    ld a, e
    and $80
    or d
    ld [hl], a
    pop hl

jr_001_47f6:
    pop hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc d
    ld a, d
    cp $38
    jr nz, jr_001_47d0

    ret


Call_001_4804::
    call Call_001_47b8
    call Call_000_1410
    ret


Call_001_480b::
    ld hl, $ccf0
    ld c, $16

jr_001_4810:
    ld b, $20

jr_001_4812:
    ld a, [hl]
    and $3f
    ld [hl], a
    inc hl
    inc hl
    inc hl
    dec b
    jr nz, jr_001_4812

    dec c
    jr nz, jr_001_4810

    ld hl, $d6bc
    ld c, $37

Jump_001_4824:
    ld a, [hl]
    cp $ff
    jr z, jr_001_4892

    inc hl
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ld e, a
    dec hl
    dec hl
    ld a, d
    and $e0
    cp $00
    jr nz, jr_001_4892

    ld a, e
    bit 6, a
    jr nz, jr_001_4892

    ld a, [hl]
    and $80
    ld b, a
    ld a, [$d90f]
    ld d, $40
    cp b
    jr z, jr_001_484a

    ld d, $80

jr_001_484a:
    ld a, d
    ld [$d9a8], a
    push bc
    inc hl
    ld a, [hl+]
    and $1f
    ld b, a
    ld a, [hl]
    and $1f
    ld c, a
    dec hl
    dec hl
    call Call_001_489f
    dec b
    call Call_001_489f
    dec c
    ld a, b
    bit 0, a
    jr z, jr_001_486a

    call Call_001_489f

jr_001_486a:
    inc b
    call Call_001_489f
    inc b
    ld a, b
    bit 0, a
    jr z, jr_001_4877

    call Call_001_489f

jr_001_4877:
    inc c
    call Call_001_489f
    inc c
    ld a, b
    bit 0, a
    jr nz, jr_001_4884

    call Call_001_489f

jr_001_4884:
    dec b
    call Call_001_489f
    dec b
    ld a, b
    bit 0, a
    jr nz, jr_001_4891

    call Call_001_489f

jr_001_4891:
    pop bc

jr_001_4892:
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jp nz, Jump_001_4824

    ret


Call_001_489f:
    ld a, [$d90d]
    ld d, a
    ld a, b
    cp d
    ret nc

    ld a, [$d90e]
    ld d, a
    ld a, c
    cp d
    ret nc

    push hl
    push bc
    call Call_000_0969
    ld a, [$d9a8]
    ld d, a
    ld a, [hl]
    or d
    ld [hl], a
    pop bc
    pop hl
    ret


Call_001_48bc:
    ld a, $00
    ld [$da3e], a
    ld a, [$d9a2]
    push af
    ld a, [$d9a3]
    push af
    ld a, [$d9a4]
    push af
    ld a, [$d99d]
    ld [$d9a2], a
    push af
    ld a, [$d99e]
    push af
    ld a, [$d99f]
    push af
    ld a, [$d9a5]
    push af
    ld a, [$d9a1]
    ld a, [$d99d]
    call Call_000_099b
    ld a, [hl+]
    and $1f
    ld [$d9a5], a
    push af
    ld a, [$da0c]
    ld [$d9a3], a
    push af
    ld a, [$da0d]
    ld [$d9a4], a
    push af
    ld a, [$d9b4]
    push af
    ld a, $00
    ld [$d9b5], a
    ld [$d9b6], a
    ld a, $01
    ld [$d9b4], a
    ld hl, $d6bc
    ld c, $37

Jump_001_4914:
    ld a, c
    ld [$d9a6], a
    ld a, [hl]
    cp $ff
    jr z, jr_001_492a

    bit 6, a
    jr nz, jr_001_492a

    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    bit 6, a
    jr z, jr_001_492d

Jump_001_492a:
jr_001_492a:
    jp Jump_001_4afc


jr_001_492d:
    ld a, [hl]
    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jr z, jr_001_492a

    inc hl
    ld a, [hl]
    dec hl
    and $e0
    cp $00
    jr nz, jr_001_492a

    ld a, c
    ld [$d99d], a
    call Call_000_099b
    ld a, [hl]
    and $1f
    ld [$d9a1], a
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    bit UNIT_4_F, a
    jp z, Jump_001_492a

    ld b, a
    ld a, [$d9a5]
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    bit UNIT_IS_AIR_F, a
    jr nz, jr_001_4975

    ld a, b
    bit 0, a
    jp z, Jump_001_492a

    jp Jump_001_497e


jr_001_4975:
    ld a, b
    bit 1, a
    jp z, Jump_001_492a

    jp Jump_001_497e


Jump_001_497e:
    ld a, [$d99d]
    ld c, a
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $1f
    ld [$d99e], a
    ld a, [hl]
    and $1f
    ld [$d99f], a
    dec hl
    dec hl
    ld a, [$d9a1]
    call GetUnit
    push hl
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    pop hl
    bit UNIT_HAS_INDIR_F, a
    jr nz, jr_001_4a1c

    ld a, [$da11]
    cp $01
    jp z, Jump_001_492a

    ld a, [$d9a3]
    ld b, a
    ld a, [$d9a4]
    ld c, a
    call Call_001_45c2
    dec a
    push af
    ld a, $0c
    call AddAToHL
    ld a, [hl]
    ld b, a
    pop af
    cp b
    jr z, jr_001_49c9

    jp nc, Jump_001_492a

jr_001_49c9:
    ld a, $00
    ld [$d9b5], a
    ld [$d9b6], a
    ld a, $01
    ld [$d9b4], a
    call Call_001_4b3c
    ld a, [$d9a3]
    ld [$da0c], a
    ld a, [$d9a4]
    ld [$da0d], a
    call Call_001_525e
    ld a, $06
    ld [$da39], a

jr_001_49ed:
    call Call_001_526e
    cp $01
    jr z, jr_001_4a05

    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    cp $00
    jr nz, jr_001_4a16

jr_001_4a05:
    ld a, [$da39]
    dec a
    ld [$da39], a
    cp $00
    jr nz, jr_001_49ed

    call Call_001_4b43
    jp Jump_001_4afc


jr_001_4a16:
    call Call_001_4b43
    jp Jump_001_4a66


jr_001_4a1c:
    ld a, [$da11]
    cp $80
    jp nc, Jump_001_4afc

    ld a, [$d9a3]
    ld b, a
    ld a, [$d9a4]
    ld c, a
    call Call_001_45c2
    ld a, [$d9a8]
    cp $01
    jp z, Jump_001_4afc

    ld a, [$d9a5]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    bit UNIT_IS_AIR_F, a
    jr nz, jr_001_4a59

    ld a, [$d9a1]
    and $1f
    call GetUnit
    ld a, UNIT_GND_RANGE
    call AddAToHL
    ld a, [hl]
    jr jr_001_4a5c

jr_001_4a59:
    dec hl
    dec hl
    ld a, [hl]

jr_001_4a5c:
    push af
    ld a, [$d9a8]
    ld b, a
    pop af
    cp b
    jp c, Jump_001_4afc

Jump_001_4a66:
    ld a, [$d9a5]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    bit UNIT_IS_AIR_F, a
    jr nz, jr_001_4a88

    ld a, [$d9a1]
    and $1f
    call GetUnit
    ld a, UNIT_GND_POWER
    call AddAToHL
    ld a, [hl]
    jr jr_001_4a96

jr_001_4a88:
    ld a, [$d9a1]
    and $1f
    call GetUnit
    ld a, UNIT_GND_POWER
    call AddAToHL
    ld a, [hl]

jr_001_4a96:
    ld b, a
    ld a, [$d99d]
    call Call_000_099b
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    ld c, a
    ld a, b
    ld e, a
    ld d, $00
    ld hl, $0000
    ld a, c
    cp $00
    jr z, jr_001_4ab6

jr_001_4ab0:
    call Call_000_08ba
    dec c
    jr nz, jr_001_4ab0

jr_001_4ab6:
    ld a, l
    ld [$d9aa], a
    ld a, h
    ld [$d9ab], a
    ld b, $05
    ld a, [$d9a1]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_HAS_INDIR
    cp $00
    jr z, jr_001_4ad5

    dec b

jr_001_4ad5:
    ld a, [$d9aa]
    ld l, a
    ld a, [$d9ab]
    ld h, a
    ld a, b
    cp $00
    jr z, jr_001_4ae9

jr_001_4ae2:
    srl h
    rr l
    dec b
    jr nz, jr_001_4ae2

jr_001_4ae9:
    ld a, h
    cp $00
    jr nz, jr_001_4af7

    ld a, [$da3e]
    add l
    ld [$da3e], a
    jr nc, jr_001_4afc

jr_001_4af7:
    ld a, $ff
    ld [$da3e], a

Jump_001_4afc:
jr_001_4afc:
    ld a, [$d9a6]
    ld c, a
    call Call_000_099b
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jp nz, Jump_001_4914

    pop af
    ld [$d9b4], a
    pop af
    ld [$da0d], a
    pop af
    ld [$da0c], a
    pop af
    ld [$d9a1], a
    pop af
    ld [$d9a5], a
    pop af
    ld [$d99f], a
    pop af
    ld [$d99e], a
    pop af
    ld [$d99d], a
    pop af
    ld [$d9a4], a
    pop af
    ld [$d9a3], a
    pop af
    ld [$d9a2], a
    ret


Call_001_4b3c:
    call Call_001_4b4a
    call Call_001_4654
    ret


Call_001_4b43:
    call Call_001_4b72
    call Call_001_47b8
    ret


Call_001_4b4a:
    ld a, $03
    call Call_000_05c8
    ld [$4000], a
    ei
    ld hl, $ccf1
    ld de, $a000
    ld b, $16

jr_001_4b5b:
    ld c, $20

jr_001_4b5d:
    ld a, [hl+]
    ld [de], a
    inc hl
    inc hl
    inc de
    dec c
    jr nz, jr_001_4b5d

    dec b
    jr nz, jr_001_4b5b

    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ret


Call_001_4b72:
    ld a, $03
    call Call_000_05c8
    ld [$4000], a
    ei
    ld hl, $ccf1
    ld de, $a000
    ld b, $16

jr_001_4b83:
    ld c, $20

jr_001_4b85:
    ld a, [de]
    ld [hl+], a
    inc hl
    inc hl
    inc de
    dec c
    jr nz, jr_001_4b85

    dec b
    jr nz, jr_001_4b83

    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ret


Call_001_4b9a:
    call Call_001_4c0e
    ld a, [$da12]
    cp $00
    jr z, jr_001_4c0b

    ld a, [$d99f]
    ld [$da0d], a
    ld a, [$d99e]
    ld [$da0c], a
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    and $f0
    ld [$da13], a
    ld c, $00
    ld de, $da14

jr_001_4bc7:
    ld a, [$da0c]
    ld [$da38], a
    ld a, [$da0d]
    ld [$da39], a
    ld a, [de]
    call Call_001_46e6
    push bc
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    pop bc
    inc hl
    ld a, [hl]
    and $f0
    push af
    ld a, [$da13]
    ld b, a
    pop af
    cp b
    jr nz, jr_001_4bfc

    inc de
    inc c
    ld a, [$da12]
    cp c
    jr nz, jr_001_4bc7

    jp Jump_001_4c0b


jr_001_4bfc:
    ld a, [$da38]
    ld [$da0c], a
    ld a, [$da39]
    ld [$da0d], a
    ld a, $01
    ret


Jump_001_4c0b:
jr_001_4c0b:
    ld a, $00
    ret


Call_001_4c0e:
    ld a, [$d9a3]
    ld [$da0c], a
    ld [$da38], a
    ld a, [$d9a4]
    ld [$da0d], a
    ld [$da39], a
    ld a, $00

Jump_001_4c22:
    push af
    ld a, [$d99e]
    ld b, a
    ld a, [$da38]
    cp b
    jr nz, jr_001_4c38

    ld a, [$d99f]
    ld b, a
    ld a, [$da39]
    cp b
    jp z, Jump_001_4d3a

jr_001_4c38:
    ld a, [$da38]
    ld b, a
    ld a, [$da39]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    and $f0
    ld [$da3c], a
    ld a, [hl]
    and $0f
    ld [$da3d], a
    ld a, $00
    ld [$da3a], a
    ld a, $ff
    ld [$da3b], a

Jump_001_4c5a:
    ld a, [$da38]
    ld [$da0c], a
    ld a, [$da39]
    ld [$da0d], a
    ld a, [$da3a]
    call Call_001_46e6
    ld a, [$d90d]
    ld b, a
    ld a, [$da0c]
    cp b
    jr nc, jr_001_4cf3

    ld a, [$d90e]
    ld b, a
    ld a, [$da0d]
    cp b
    jr nc, jr_001_4cf3

    ld a, [$d99e]
    ld b, a
    ld a, [$da0c]
    cp b
    jr nz, jr_001_4c9d

    ld a, [$d99f]
    ld b, a
    ld a, [$da0d]
    cp b
    jr nz, jr_001_4c9d

    ld a, [$da3a]
    ld [$da3b], a
    jp Jump_001_4cff


jr_001_4c9d:
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    ld [$d9aa], a
    cp $00
    jr z, jr_001_4cf3

    and $f0
    push af
    ld a, [$da3c]
    ld b, a
    pop af
    cp b
    jr z, jr_001_4cc1

    jr nc, jr_001_4cdd

    jp Jump_001_4cf3


jr_001_4cc1:
    ld a, [$da3d]
    ld b, a
    ld a, [$d9aa]
    and $0f
    cp b
    jr c, jr_001_4cf3

    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    bit 7, a
    jr nz, jr_001_4cf3

jr_001_4cdd:
    ld a, [$d9aa]
    and $f0
    ld [$da3c], a
    ld a, [$d9aa]
    and $0f
    ld [$da3d], a
    ld a, [$da3a]
    ld [$da3b], a

Jump_001_4cf3:
jr_001_4cf3:
    ld a, [$da3a]
    inc a
    ld [$da3a], a
    cp $06
    jp nz, Jump_001_4c5a

Jump_001_4cff:
    ld a, [$da38]
    ld [$da0c], a
    ld a, [$da39]
    ld [$da0d], a
    ld a, [$da3b]
    call Call_001_46e6
    ld a, [$da0c]
    ld [$da38], a
    ld a, [$da0d]
    ld [$da39], a
    ld a, [$da3b]
    ld hl, data_001_5610
    call AddAToHL
    pop af
    push af
    ld de, $da14
    call Call_000_08a1
    ld a, [hl]
    ld [de], a
    pop af
    inc a
    cp $20
    jp nz, Jump_001_4c22

    ld a, $00
    push af

Jump_001_4d3a:
    pop af
    ld [$da12], a
    cp $00
    ret z

    ld b, $00
    ld de, $da14
    ld a, [$da12]
    dec a
    ld c, a
    ld hl, $da14
    call AddAToHL

jr_001_4d51:
    ld a, b
    cp c
    jr nc, jr_001_4d61

    ld a, [de]
    push af
    ld a, [hl]
    ld [de], a
    pop af
    ld [hl], a
    inc b
    inc de
    dec c
    dec hl
    jr jr_001_4d51

jr_001_4d61:
    ret


Call_001_4d62:
    ld a, $00
    ld [$da3e], a
    ld a, [$d90e]
    ld b, a
    ld a, [$da0d]
    cp b
    jp nc, Jump_001_4e25

    ld a, [$d90d]
    ld b, a
    ld a, [$da0c]
    cp b
    jp nc, Jump_001_4e25

    push bc
    push hl
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    inc hl
    ld a, [hl]
    pop hl
    pop bc
    cp $ff
    jr z, jr_001_4d9d

    push af
    ld a, [$d99d]
    ld b, a
    pop af
    cp b
    jp nz, Jump_001_4e25

jr_001_4d9d:
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    and $0f
    ld c, a
    push af
    ld a, [$d910]
    ld b, a
    pop af
    cp b
    jr nz, jr_001_4dc0

    ld a, [$da0e]
    cp $00
    jr z, jr_001_4e25

    cp $ff
    jr z, jr_001_4e25

jr_001_4dc0:
    ld a, c
    cp $0c
    jr z, jr_001_4dce

    push af
    ld a, [$d911]
    ld b, a
    pop af
    cp b
    jr nz, jr_001_4dd9

jr_001_4dce:
    ld a, [$da0e]
    cp $00
    jr z, jr_001_4e25

    cp $ff
    jr nz, jr_001_4e25

jr_001_4dd9:
    ld a, [$d999]
    bit 7, a
    jr nz, jr_001_4dea

    ld a, c
    push af
    ld a, [$d913]
    ld b, a
    pop af
    cp b
    jr z, jr_001_4e25

jr_001_4dea:
    ld a, [$d999]
    bit 0, a
    jr z, jr_001_4dfb

    ld a, c
    push af
    ld a, [$d912]
    ld b, a
    pop af
    cp b
    jr z, jr_001_4e25

jr_001_4dfb:
    inc hl
    ld a, [hl]
    srl a
    srl a
    srl a
    srl a
    push af
    ld a, [$d9b4]
    ld b, a
    pop af
    cp b
    jr nz, jr_001_4e25

    ld a, [$da40]
    cp $00
    jr z, jr_001_4e22

    call Call_001_48bc
    ld a, [$da40]
    ld b, a
    ld a, [$da3e]
    sub b
    jr nc, jr_001_4e25

jr_001_4e22:
    ld a, $00
    ret


Jump_001_4e25:
jr_001_4e25:
    ld a, $01
    ret


Call_001_4e28:
    ld a, $00
    ld [$da0f], a
    ld de, $d914
    ld a, [$d90f]
    cp $00
    jr nz, jr_001_4e3a

    ld de, $d916

jr_001_4e3a:
    ld a, [de]
    ld b, a
    ld a, [$d9a3]
    cp b
    jr nz, jr_001_4e52

    inc de
    ld a, [de]
    ld b, a
    ld a, [$d9a4]
    cp b
    jr nz, jr_001_4e52

    ld a, [$da0f]
    inc a
    ld [$da0f], a

jr_001_4e52:
    ld a, $01
    ld [$da10], a
    ld a, [$d9a3]
    ld b, a
    ld a, [$d9a4]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    cp $00
    jr nz, jr_001_4ec3

    ld a, $00
    ld [$da10], a
    ld a, [$d9a3]
    ld [$da0c], a
    ld a, [$d9a4]
    ld [$da0d], a
    call Call_001_525e
    ld a, $06
    ld [$da60], a

jr_001_4e81:
    ld a, $78
    ld [$da39], a

jr_001_4e86:
    call Call_001_526e
    cp $01
    jr z, jr_001_4e9e

    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    cp $00
    jr nz, jr_001_4eb7

jr_001_4e9e:
    ld a, [$da39]
    dec a
    ld [$da39], a
    cp $00
    jr nz, jr_001_4e86

    ld a, [$da60]
    dec a
    ld [$da60], a
    cp $00
    jr nz, jr_001_4e81

    jp Jump_001_524b


jr_001_4eb7:
    ld a, [$da0c]
    ld [$d9a3], a
    ld a, [$da0d]
    ld [$d9a4], a

jr_001_4ec3:
    call Call_001_4b9a
    cp $00
    jr nz, jr_001_4f13

    ld a, [$da10]
    cp $00
    jr z, jr_001_4f13

    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    inc hl
    ld a, [hl]
    cp $ff
    jr nz, jr_001_4efa

    ld a, $00
    ld [$da40], a
    ld a, [$da0f]
    cp $00
    jr z, jr_001_4ef7

    ld a, [$d999]
    or $80
    ld [$d999], a

jr_001_4ef7:
    jp Jump_001_50b7


jr_001_4efa:
    ld a, [hl]
    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jr nz, jr_001_4f13

    ld a, [$da0f]
    cp $00
    jr z, jr_001_4f13

    ld a, [$d999]
    or $80
    ld [$d999], a

jr_001_4f13:
    ld a, [$d9a1]
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_CAN_CARRY
    cp $00
    jr z, jr_001_4f28

jr_001_4f25:
    jp Jump_001_50b7


jr_001_4f28:
    ld a, [$d9a3]
    ld b, a
    ld a, [$d9a4]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    srl a
    srl a
    srl a
    srl a
    ld b, a
    ld a, [$d9b4]
    sub b
    cp $03
    jr c, jr_001_4f25

    ld [$da08], a
    call Call_001_62d9
    cp $00
    jr z, jr_001_4f53

jr_001_4f50:
    jp Jump_001_5090


jr_001_4f53:
    ld a, [$dab3]
    ld b, a
    ld a, [$dab4]
    ld c, a
    call Call_000_0969
    inc hl
    push hl
    inc hl
    ld a, [hl]
    and $3f
    call Call_000_099b
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    pop hl
    and UNIT_IS_AIR
    cp $00
    jr z, jr_001_4f81

    ld a, [$da08]
    cp $04
    jr c, jr_001_4f25

jr_001_4f81:
    ld a, [$dab3]
    ld [$db1c], a
    ld b, a
    ld a, [$dab4]
    ld [$db1d], a
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    srl a
    srl a
    srl a
    srl a
    ld b, a
    ld a, [$d9b4]
    cp b
    jr nz, jr_001_4f50

    ld a, [$d99d]
    push af
    ld a, [$d99e]
    push af
    ld a, [$d99f]
    push af
    ld a, [$d9b4]
    push af
    inc hl
    ld a, [hl]
    and $3f
    ld [$d99d], a
    ld a, [$d99d]
    call Call_000_099b
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    and $1f
    ld [$d99e], a
    ld a, [hl+]
    and $1f
    ld [$d99f], a
    ld a, b
    and $1f
    ld de, data_001_55f9
    call Call_000_08a1
    ld a, [de]
    ld [$d9b4], a
    ld a, $00
    ld [$d9b5], a
    ld [$d9b6], a
    call Call_001_4b3c
    ld a, [$d9a3]
    ld b, a
    ld a, [$d9a4]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    ld [$d9a8], a
    ld a, [$d9a8]
    srl a
    srl a
    srl a
    srl a
    ld b, a
    ld a, [$d9b4]
    sub b
    ld [$d9aa], a
    pop af
    ld [$d9b4], a
    pop af
    ld [$d99f], a
    pop af
    ld [$d99e], a
    pop af
    ld [$d99d], a
    call Call_001_4b43
    ld a, [$d9a8]
    cp $00
    jr z, jr_001_5090

    ld a, [$d9a3]
    ld b, a
    ld a, [$d9a4]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    srl a
    srl a
    srl a
    srl a
    push af
    ld a, [$d9b4]
    ld d, a
    pop af
    sub d
    push af
    ld a, [$d9aa]
    ld b, a
    pop af
    cp b
    jr z, jr_001_5090

    jr c, jr_001_5090

    ld a, [$db1c]
    ld [$da0c], a
    ld b, a
    ld a, [$db1d]
    ld [$da0d], a
    ld c, a
    call Call_000_0969
    inc hl
    inc hl
    ld a, [hl]
    and $3f
    ld c, a
    call Call_000_099b
    ld a, [hl]
    bit 6, a
    jr nz, jr_001_508d

    ld a, c
    ld hl, $d928
    call AddAToHL
    ld a, [$d99d]
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    ld [hl], a
    ld a, c
    ld hl, $d960
    call AddAToHL
    ld a, [$d99d]
    ld de, $d960
    call Call_000_08a1
    ld a, [de]
    ld [hl], a

jr_001_508d:
    jp Jump_001_51ac


Jump_001_5090:
jr_001_5090:
    ld a, [$d99d]
    ld hl, $d960
    call AddAToHL
    ld a, [hl]
    and $08
    cp $00
    jp nz, Jump_001_50b7

    ld a, [hl]
    or $08
    ld [hl], a
    ld a, [$d99e]
    ld [$da04], a
    ld a, [$d99f]
    ld [$da05], a
    call Call_001_63be
    jp Jump_001_525d


Jump_001_50b7:
    ld b, $ff
    ld a, [$d99d]
    call Call_000_099b
    inc hl
    inc hl
    ld a, [hl]
    and $60
    cp $20
    jr nz, jr_001_50ca

    ld b, $00

jr_001_50ca:
    ld a, b
    ld [$da0e], a
    ld a, $00
    ld [$da11], a
    call Call_001_4d62
    cp $00
    jp z, Jump_001_51ac

    ld a, [$d99a]
    cp $01
    jp z, Jump_001_523c

    ld a, $00
    ld [$da3f], a
    ld a, [$da40]
    cp $00
    jr z, jr_001_5114

    ld a, [$da0c]
    push af
    ld a, [$da0d]
    push af
    ld a, [$d99e]
    ld [$da0c], a
    ld a, [$d99f]
    ld [$da0d], a
    call Call_001_48bc
    ld a, [$da3e]
    ld [$da3f], a
    pop af
    ld [$da0d], a
    pop af
    ld [$da0c], a

jr_001_5114:
    ld a, $01
    ld [$da0a], a
    ld a, $00
    ld [$da08], a

jr_001_511e:
    ld a, $04
    call Call_001_46e6
    ld a, $00
    ld [$da0b], a

jr_001_5128:
    ld a, [$da0a]
    ld [$da09], a

Jump_001_512e:
    call Call_001_4d62
    cp $00
    jr z, jr_001_5147

    ld a, [$da3e]
    cp $00
    jr z, jr_001_516e

    push af
    ld a, [$da3f]
    ld b, a
    pop af
    cp b
    jr c, jr_001_5147

    jr nz, jr_001_516e

jr_001_5147:
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    and $0f
    push af
    ld a, [$da08]
    ld b, a
    pop af
    cp b
    jr c, jr_001_516e

    ld [$da08], a
    ld a, [$da0c]
    ld [$da61], a
    ld a, [$da0d]
    ld [$da62], a

jr_001_516e:
    ld a, [$da0b]
    call Call_001_46e6
    ld a, [$da09]
    dec a
    ld [$da09], a
    cp $00
    jp nz, Jump_001_512e

    ld a, [$da0b]
    inc a
    ld [$da0b], a
    cp $06
    jr nz, jr_001_5128

    ld a, [$da08]
    cp $00
    jr nz, jr_001_51a0

    ld a, [$da0a]
    inc a
    ld [$da0a], a
    cp $04
    jr c, jr_001_511e

    jp Jump_001_524b


jr_001_51a0:
    ld a, [$da61]
    ld [$da0c], a
    ld a, [$da62]
    ld [$da0d], a

Jump_001_51ac:
    ld a, $00
    ld [$da0e], a
    call Call_001_6ccb
    cp $01
    jr z, jr_001_51fa

    ld a, $00
    ld [$da41], a
    ld a, [$da0c]
    ld [$da42], a
    ld a, [$da0d]
    ld [$da43], a
    ld a, $0a
    ld [$da44], a
    ld a, [$dab3]
    ld [$da45], a
    ld a, [$dab4]
    ld [$da46], a
    ld a, $ff
    ld [$da47], a
    ld a, [$d99d]
    ld hl, $d928
    call AddAToHL
    ld a, [$d9a2]
    ld de, $d928
    call Call_000_08a1
    ld a, [hl]
    or $08
    ld [de], a
    ld a, $08
    ld [hl], a
    jr jr_001_525d

jr_001_51fa:
    ld b, $00
    ld a, [$da0c]
    ld c, a
    ld a, [$d99e]
    cp c
    jr nz, jr_001_5210

    ld a, [$da0d]
    ld c, a
    ld a, [$d99f]
    cp c
    jr z, jr_001_5223

jr_001_5210:
    ld a, $00
    ld [$da41], a
    ld a, [$da0c]
    ld [$da42], a
    ld a, [$da0d]
    ld [$da43], a
    ld b, $03

jr_001_5223:
    ld a, b
    ld de, $da41
    call Call_000_08a1
    ld a, $ff
    ld [de], a
    ld a, [$d99d]
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    or $08
    ld [de], a
    jr jr_001_525d

Jump_001_523c:
    ld a, [$d99d]
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    or $80
    ld [de], a
    jr jr_001_5258

Jump_001_524b:
    ld a, [$d99d]
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    or $80
    ld [de], a

jr_001_5258:
    ld a, $ff
    ld [$da41], a

Jump_001_525d:
jr_001_525d:
    ret


Call_001_525e:
    ld a, $05
    ld [$da5d], a
    ld a, $01
    ld [$da5e], a
    ld a, $00
    ld [$da5f], a
    ret


Call_001_526e:
    ld a, [$da5e]
    dec a
    ld [$da5e], a
    cp $00
    jr nz, jr_001_529e

    ld a, [$da5f]
    ld [$da5e], a
    ld a, [$da5d]
    inc a
    ld [$da5d], a
    cp $06
    jr c, jr_001_529e

    ld a, $00
    ld [$da5d], a
    ld a, [$da5f]
    inc a
    ld [$da5f], a
    ld [$da5e], a
    ld a, $04
    call Call_001_46e6

jr_001_529e:
    ld a, [$da5d]
    call Call_001_46e6
    ld a, [$d90e]
    ld b, a
    ld a, [$da0d]
    cp b
    jr nc, jr_001_52bb

    ld a, [$d90d]
    ld b, a
    ld a, [$da0c]
    cp b
    jr nc, jr_001_52bb

    ld a, $00
    ret


jr_001_52bb:
    ld a, $01
    ret


Jump_001_52be:
    ld a, [$d9b7]
    ld b, a
    ld [$db11], a
    ld [$db13], a
    ld a, [$d9b8]
    ld c, a
    ld [$db12], a
    ld [$db14], a
    call Call_000_0969
    inc hl
    ld a, [$d9ba]
    ld [hl], a
    ld a, $00
    ld [$db15], a
    ld a, [$d9ba]
    ld d, a
    ld a, [$d9bc]
    ld e, a

Jump_001_52e7:
    ld a, [$db11]
    ld [$db0d], a
    ld a, [$db13]
    ld [$db0f], a
    ld a, [$db12]
    ld [$db0e], a
    ld a, [$db14]
    ld [$db10], a
    ld a, [$db0d]
    ld b, a
    ld a, [$db0e]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [$db0e]
    ld c, a

Jump_001_530f:
    ld a, [$db0d]
    ld b, a
    push hl

Jump_001_5314:
    ld a, [hl]
    cp d
    jp nz, Jump_001_54e8

    ld a, [$db15]
    cp $00
    jp z, Jump_001_5527

    push hl
    dec hl
    ld a, [hl]
    ld h, a
    ld a, [$d9bb]
    and h
    cp $00
    pop hl
    jr nz, jr_001_5336

    ld a, d
    and $0f
    cp $02
    ld a, d
    jr nc, jr_001_5347

jr_001_5336:
    ld a, d
    and $f0
    sub $10
    cp $00
    jp z, Jump_001_54e8

    push hl
    ld h, a
    ld a, [$d9be]
    or h
    pop hl

Jump_001_5347:
jr_001_5347:
    ld [$d86f], a
    ld a, b
    cp $00
    jr z, jr_001_5369

    push hl
    dec hl
    dec hl
    dec hl
    call Call_001_5530
    pop hl
    cp $00
    jr z, jr_001_5369

    ld a, [$db0d]
    cp $00
    jr z, jr_001_5369

    cp b
    jr nz, jr_001_5369

    dec a
    ld [$db11], a

jr_001_5369:
    ld a, [$d79b]
    dec a
    cp b
    jr z, jr_001_5394

    jr c, jr_001_5394

    push hl
    inc hl
    inc hl
    inc hl
    call Call_001_5530
    pop hl
    cp $00
    jr z, jr_001_5394

    ld a, [$db0f]
    cp b
    jr nz, jr_001_5394

    push de
    ld d, a
    ld a, [$d90d]
    dec a
    ld e, a
    ld a, d
    cp e
    pop de
    jr z, jr_001_5394

    inc a
    ld [$db13], a

jr_001_5394:
    ld a, c
    cp $00
    jr z, jr_001_53b5

    push hl
    ld a, $60
    call Call_000_0896
    call Call_001_5530
    pop hl
    cp $00
    jr z, jr_001_53b5

    ld a, [$db0e]
    cp $00
    jr z, jr_001_53b5

    cp c
    jr nz, jr_001_53b5

    dec a
    ld [$db12], a

jr_001_53b5:
    ld a, [$d79c]
    dec a
    dec a
    cp c
    jr z, jr_001_53e3

    jr c, jr_001_53e3

    push hl
    ld a, $60
    call AddAToHL
    call Call_001_5530
    pop hl
    cp $00
    jr z, jr_001_53e3

    ld a, [$db10]
    cp c
    jr nz, jr_001_53e3

    push de
    ld d, a
    ld a, [$d90e]
    dec a
    ld e, a
    ld a, d
    cp e
    pop de
    jr z, jr_001_53e3

    inc a
    ld [$db14], a

jr_001_53e3:
    ld a, b
    and $01
    cp $00
    jp z, Jump_001_5479

    ld a, b
    cp $00
    jp z, Jump_001_5477

    ld a, [$d79c]
    dec a
    dec a
    cp c
    jp z, Jump_001_5477

    jp c, Jump_001_5477

    ld a, b
    cp $00
    jr z, jr_001_5434

    push hl
    ld a, $5d
    call AddAToHL
    call Call_001_5530
    pop hl
    cp $00
    jr z, jr_001_5434

    ld a, [$db0d]
    cp $00
    jr z, jr_001_541e

    cp b
    jr nz, jr_001_541e

    dec a
    ld [$db11], a

jr_001_541e:
    ld a, [$db10]
    cp c
    jr nz, jr_001_5434

    push de
    ld d, a
    ld a, [$d90e]
    dec a
    ld e, a
    ld a, d
    cp e
    pop de
    jr z, jr_001_5434

    inc a
    ld [$db14], a

jr_001_5434:
    ld a, [$d79b]
    dec a
    cp b
    jr z, jr_001_5477

    jr c, jr_001_5477

    push hl
    ld a, $63
    call AddAToHL
    call Call_001_5530
    pop hl
    cp $00
    jr z, jr_001_5477

    ld a, [$db0f]
    cp b
    jr nz, jr_001_5461

    push de
    ld d, a
    ld a, [$d90d]
    dec a
    ld e, a
    ld a, d
    cp e
    pop de
    jr z, jr_001_5461

    inc a
    ld [$db13], a

jr_001_5461:
    ld a, [$db10]
    cp c
    jr nz, jr_001_5477

    push de
    ld d, a
    ld a, [$d90e]
    dec a
    ld e, a
    ld a, d
    cp e
    pop de
    jr z, jr_001_5477

    inc a
    ld [$db14], a

Jump_001_5477:
jr_001_5477:
    jr jr_001_54e8

Jump_001_5479:
    ld a, c
    cp $00
    jr z, jr_001_54e8

    ld a, b
    cp $00
    jr z, jr_001_54ad

    push hl
    ld a, $63
    call Call_000_0896
    call Call_001_5530
    pop hl
    cp $00
    jr z, jr_001_54ad

    ld a, [$db0d]
    cp $00
    jr z, jr_001_549f

    cp b
    jr nz, jr_001_549f

    dec a
    ld [$db11], a

jr_001_549f:
    ld a, [$db0e]
    cp $00
    jr z, jr_001_54ad

    cp c
    jr nz, jr_001_54ad

    dec a
    ld [$db12], a

jr_001_54ad:
    ld a, [$d79b]
    dec a
    cp b
    jr z, jr_001_54e8

    jr c, jr_001_54e8

    push hl
    ld a, $5d
    call Call_000_0896
    call Call_001_5530
    pop hl
    cp $00
    jr z, jr_001_54e8

    ld a, [$db0f]
    cp b
    jr nz, jr_001_54da

    push de
    ld d, a
    ld a, [$d90d]
    dec a
    ld e, a
    ld a, d
    cp e
    pop de
    jr z, jr_001_54da

    inc a
    ld [$db13], a

jr_001_54da:
    ld a, [$db0e]
    cp $00
    jr z, jr_001_54e8

    cp c
    jr nz, jr_001_54e8

    dec a
    ld [$db12], a

Jump_001_54e8:
jr_001_54e8:
    inc hl
    inc hl
    inc hl
    inc b
    ld a, [$db0f]
    inc a
    cp b
    jp nz, Jump_001_5314

    pop hl
    ld a, $60
    call AddAToHL
    inc c
    ld a, [$db10]
    inc a
    cp c
    jp nz, Jump_001_530f

    push bc
    ld a, d
    and $f0
    ld b, a
    ld a, d
    and $0f
    dec a
    jr z, jr_001_5514

    or b
    ld d, a
    pop bc
    jp Jump_001_52e7


jr_001_5514:
    ld a, b
    and $f0
    sub $10
    jr z, jr_001_5525

    ld b, a
    ld a, [$d9be]
    or b
    ld d, a
    pop bc
    jp Jump_001_52e7


jr_001_5525:
    pop bc
    ret


Jump_001_5527:
    ld a, $01
    ld [$db15], a
    ld a, d
    jp Jump_001_5347


Call_001_5530:
    inc hl
    ld a, [hl-]
    cp $ff
    jr z, jr_001_554f

    and $80
    cp e
    jr z, jr_001_554f

    push hl
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $e0
    jr nz, jr_001_554e

    ld a, [hl]
    bit 6, a
    jr nz, jr_001_554e

    pop hl

jr_001_554b:
    ld a, $00
    ret


jr_001_554e:
    pop hl

jr_001_554f:
    ld a, [$d9bd]
    cp MOVE_WINGS
    ld a, $01
    jr nc, jr_001_557a

    push hl
    dec hl
    ld a, [hl]
    and $0f
    sla a
    sla a
    ld h, a
    ld a, [$d9bd]
    add h
    ld hl, TerrainCost
    call AddAToHL
    ld a, [hl]
    pop hl
    cp CANNOT_MOVE
    jr z, jr_001_554b

    cp END_MOVE
    jr nz, jr_001_557a

    ld a, [$d9be]
    dec a

jr_001_557a:
    ld [$d9a8], a
    push bc
    ld b, a
    ld a, [$d86f]
    and $0f
    sub b
    jr c, jr_001_55a5

    cp $01
    jr c, jr_001_55a5

    ld b, a
    ld a, [$d86f]
    and $f0
    or b
    ld b, a
    ld a, [hl]
    cp $00
    jr z, jr_001_559b

    cp b
    jr nc, jr_001_55a1

jr_001_559b:
    ld a, b
    ld [hl], a
    ld a, $01
    pop bc
    ret


jr_001_55a1:
    pop bc
    ld a, $00
    ret


jr_001_55a5:
    ld a, [$d86f]
    and $f0
    sub $10
    jr c, jr_001_55d1

    cp $00
    jr z, jr_001_55d1

    ld b, a
    ld a, [$d9a8]
    ld c, a
    ld a, [$d9be]
    sub c
    jr c, jr_001_55d1

    cp $00
    jr z, jr_001_55d1

    or b
    ld b, a
    ld a, [hl]
    cp $00
    jr z, jr_001_55cb

    cp b
    jr nc, jr_001_55d1

jr_001_55cb:
    ld a, b
    ld [hl], a
    ld a, $01
    pop bc
    ret


jr_001_55d1:
    pop bc
    ld a, $00
    ret


    ld a, [$d86f]
    and $f0
    ld b, $10
    sub b
    cp $00
    jr z, jr_001_55f5

    ld b, a
    ld a, [$d9be]
    or b
    ld b, a
    ld a, [hl]
    cp $00
    jr z, jr_001_55ef

    cp b
    jr nc, jr_001_55f5

jr_001_55ef:
    ld a, b
    ld [hl], a
    ld a, $01
    pop bc
    ret


jr_001_55f5:
    pop bc
    ld a, $00
    ret


data_001_55f9:
    db $01, $02, $02, $02, $06, $06, $04
    db $04, $05, $0c, $05, $06, $06, $03, $04, $04, $05, $01, $0a, $0a, $03, $05, $03

data_001_5610:
    db $03, $04, $05, $00, $01, $02


Call_001_5616::
    ld hl, $d928
    ld de, $d960
    ld b, $38

jr_001_561e:
    xor a
    ld [hl+], a
    ld [de], a
    inc de
    dec b
    jr nz, jr_001_561e

    ld a, $00
    ld [$d998], a
    ld [$d999], a
    ld [$d99b], a
    ld [$d99a], a
    ld [$d99c], a
    call Call_001_564e
    call Call_001_58c1
    call Call_001_5e4b
    call Call_001_5f73
    ld a, [$d998]
    cp $00
    ret z

    ld a, $01
    ld [$d999], a
    ret


Call_001_564e:
    ld hl, $d9c0
    ld b, $40

jr_001_5653:
    xor a
    ld [hl+], a
    dec b
    jr nz, jr_001_5653

    ld hl, $d918
    ld de, $d9c0
    ld c, $00

jr_001_5660:
    push bc
    push hl
    ld a, [hl+]
    cp $ff
    jr z, jr_001_569c

    ld b, a
    ld a, [hl+]
    ld c, a
    call Call_000_0969
    ld a, [$d911]
    ld b, a
    ld a, [hl]
    and $0f
    cp b
    jr z, jr_001_567b

    cp $0c
    jr nz, jr_001_5690

jr_001_567b:
    pop hl
    pop bc
    push bc
    push hl
    push af
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    pop af
    ld [de], a
    inc de
    ld a, c
    ld [de], a
    ld a, $05
    call Call_000_08a1

jr_001_5690:
    pop hl
    pop bc
    inc hl
    inc hl
    inc c
    ld a, c
    cp $08
    jr nz, jr_001_5660

    jr jr_001_569e

jr_001_569c:
    pop hl
    pop bc

jr_001_569e:
    ld hl, $d914
    ld a, [$d90f]
    cp $00
    jr nz, jr_001_56ab

    ld hl, $d916

jr_001_56ab:
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [$d913]
    ld [de], a
    inc de
    ld a, $07
    ld [de], a

Jump_001_56b9:
    ld hl, $d9c4
    ld b, $08

jr_001_56be:
    ld a, $ff
    ld [hl], a
    ld a, $08
    call AddAToHL
    dec b
    jr nz, jr_001_56be

    ld hl, $d572
    ld c, $00

Jump_001_56ce:
    call Call_001_45a0
    cp $00
    jp nz, Jump_001_56f6

    ld de, $d928
    ld a, c
    call Call_000_08a1
    ld a, [de]
    cp $00
    jr nz, jr_001_56f6

    push hl
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    pop hl
    and UNIT_ABCD
    cp UNIT_INFANTRY
    jr z, jr_001_56f9

Jump_001_56f6:
jr_001_56f6:
    jp Jump_001_5812


jr_001_56f9:
    ld a, c
    ld [$d9a2], a
    ld [$d9a6], a
    push hl
    inc hl
    inc hl
    ld a, [hl+]
    bit 6, a
    jr z, jr_001_570f

    inc hl
    ld a, [hl]
    and $3f
    ld [$d9a6], a

jr_001_570f:
    pop hl
    push hl
    ld a, [$d9a6]
    ld [$d99d], a
    call Call_000_099b
    ld a, [hl+]
    and $1f
    ld [$d9a1], a
    ld a, [hl+]
    and $1f
    ld [$d99e], a
    ld a, [hl+]
    and $1f
    ld [$d99f], a
    pop hl
    ld a, $00
    ld [$da00], a
    ld de, $d9c0
    ld b, $00

jr_001_5737:
    inc de
    inc de
    ld a, [de]
    dec de
    dec de
    cp $00
    jr z, jr_001_5758

    push bc
    ld a, [de]
    inc de
    ld b, a
    ld a, [de]
    dec de
    ld c, a
    call Call_001_45c2
    pop bc
    cp $18
    jr nc, jr_001_5758

    ld a, [$da00]
    inc a
    ld [$da00], a
    jr jr_001_5763

jr_001_5758:
    ld a, $08
    call Call_000_08a1
    inc b
    ld a, b
    cp $08
    jr nz, jr_001_5737

jr_001_5763:
    ld a, [$da00]
    cp $00
    jp z, Jump_001_5812

    ld a, $18
    ld [$d9b0], a
    ld a, $00
    ld [$d9b2], a
    ld de, data_001_55f9
    ld a, [$d9a1]
    call Call_000_08a1
    ld a, [de]
    ld [$d9b4], a
    ld a, $00
    ld [$d9b5], a
    ld [$d9b6], a
    push bc
    push hl
    call Call_001_4654
    call Call_001_450a
    pop hl
    pop bc
    ld de, $d9c0
    ld b, $00

Jump_001_5799:
    inc de
    inc de
    ld a, [de]
    dec de
    dec de
    cp $00
    jr z, jr_001_5806

    ld a, [$da00]
    cp $00
    jr z, jr_001_57dd

    push bc
    push de
    push hl
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    pop hl
    pop de
    pop bc
    cp $00
    jr z, jr_001_57dd

    push bc
    srl a
    srl a
    srl a
    srl a
    ld [$d9a8], a
    ld c, a
    ld a, [$d9b4]
    ld b, a
    push hl
    inc hl
    inc hl
    ld a, [hl]
    pop hl
    bit 5, a
    jr z, jr_001_57d8

    inc b

jr_001_57d8:
    ld a, b
    sub c
    pop bc
    jr jr_001_57ea

jr_001_57dd:
    push bc
    ld a, [de]
    inc de
    ld b, a
    ld [de], a
    ld c, a
    dec de
    call Call_001_45c2
    pop bc
    add $40

jr_001_57ea:
    push bc
    push de
    push af
    inc de
    inc de
    inc de
    inc de
    ld a, [de]
    ld b, a
    pop af
    cp b
    jr z, jr_001_57f9

    jr nc, jr_001_5804

jr_001_57f9:
    ld [de], a
    inc de
    ld a, [$d99d]
    ld [de], a
    inc de
    ld a, [$d9a2]
    ld [de], a

jr_001_5804:
    pop de
    pop bc

jr_001_5806:
    ld a, $08
    call Call_000_08a1
    inc b
    ld a, b
    cp $08
    jp nz, Jump_001_5799

Jump_001_5812:
    ld a, $06
    call AddAToHL
    inc c
    ld a, c
    cp $38
    jp nz, Jump_001_56ce

    ld de, $d9c0
    ld c, $00
    ld a, $ff
    ld [$d9b0], a

jr_001_5828:
    push de
    inc de
    inc de
    ld a, [de]
    ld h, a
    inc de
    inc de
    ld a, [de]
    ld l, a
    pop de
    ld a, h
    cp $00
    jr z, jr_001_5856

    ld a, l
    cp $ff
    jr z, jr_001_5856

    ld a, [$d9b0]
    ld b, a
    ld a, l
    cp b
    jr c, jr_001_584e

    jr nz, jr_001_5856

    ld a, [$d913]
    ld b, a
    ld a, h
    cp b
    jr nz, jr_001_5856

jr_001_584e:
    ld a, l
    ld [$d9b0], a
    ld a, c
    ld [$d9b2], a

jr_001_5856:
    ld a, $08
    call Call_000_08a1
    inc c
    ld a, c
    cp $08
    jr nz, jr_001_5828

    ld a, [$d9b0]
    cp $ff
    jr z, jr_001_58ba

    ld a, [$d9b2]
    sla a
    sla a
    sla a
    ld de, $d9c0
    call Call_000_08a1
    inc de
    inc de
    ld a, $00
    ld [de], a
    inc de
    ld a, [de]
    ld b, a
    inc de
    inc de
    ld a, [$d9b0]
    cp $10
    jr c, jr_001_588a

    ld a, $0f

jr_001_588a:
    ld c, a
    ld a, [de]
    ld hl, $d960
    call AddAToHL
    ld a, c
    sla a
    sla a
    sla a
    sla a
    or b
    ld [hl], a
    ld a, [de]
    ld hl, $d928
    call AddAToHL
    ld a, $01
    ld [hl], a
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    cp b
    jr z, jr_001_58b7

    ld hl, $d928
    call AddAToHL
    ld a, $08
    ld [hl], a

jr_001_58b7:
    jp Jump_001_56b9


jr_001_58ba:
    ret


data_001_58bb:
    db $04, $03, $02, $01, $00, $04

Call_001_58c1:
    ld a, $00
    ld [$daf8], a
    ld hl, $d6bc
    ld c, $37

Jump_001_58cb:
    call Call_001_45a0
    cp $00
    jr nz, jr_001_58f8

    ld a, [hl]
    push hl
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    pop hl
    and UNIT_IS_AIR
    cp $00
    jr z, jr_001_58f8

    ld a, [hl]
    cp $ff
    jp z, Jump_001_7311

    bit 6, a
    jp nz, Jump_001_7311

    ld a, [$daf8]
    inc a
    ld [$daf8], a

jr_001_58f8:
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jp nz, Jump_001_58cb

    ld hl, $d6bc
    ld c, $37

Jump_001_5909:
    ld a, c
    ld [$d9a7], a
    ld [$dafc], a
    ld a, [hl]
    cp $ff
    jr nz, jr_001_5918

Jump_001_5915:
jr_001_5915:
    jp Jump_001_5d59


jr_001_5918:
    ld a, [hl]
    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jp z, Jump_001_5915

    inc hl
    ld a, [hl-]
    and $e0
    cp $00
    jr nz, jr_001_5915

    ld a, $00
    ld [$da83], a
    ld a, c
    ld [$d99d], a
    ld a, [hl+]
    and $1f
    ld [$d9a1], a
    push af
    ld a, [hl+]
    and $1f
    ld [$d99e], a
    ld a, [hl]
    and $1f
    ld [$d99f], a
    pop af
    push hl
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    ld b, a
    pop hl
    and UNIT_ABCD
    cp UNIT_INFANTRY
    jp z, Jump_001_5c7b

    ld a, [hl]
    bit 6, a
    jp nz, Jump_001_5d47

    ld a, b
    bit 5, a
    jp nz, Jump_001_5ae7

    bit 3, a
    jp nz, Jump_001_5a41

    and $03
    cp $02
    jr nz, jr_001_597a

    ld a, [$daf8]
    cp $00
    jp z, Jump_001_5d47

jr_001_597a:
    dec hl
    dec hl
    ld a, [hl]
    and $1f
    cp $00
    jp z, Jump_001_5d47

    ld a, c
    ld [$d99d], a
    inc hl
    ld a, [hl+]
    and $1f
    ld [$d99e], a
    ld a, [hl]
    and $1f
    ld [$d99f], a
    ld a, $00
    ld [$d9b5], a
    ld [$d9b6], a
    ld a, $01
    ld [$d9b4], a
    call Call_001_4654
    call Call_001_450a
    ld a, [$d99d]
    call Call_001_5dbb
    ld hl, $ccf1
    ld a, [$d90e]
    ld c, a
    ld a, $00
    ld [$da39], a

Jump_001_59ba:
    ld a, [$d90d]
    dec a
    ld [$da38], a

jr_001_59c1:
    push hl
    ld a, [$da38]
    ld b, a
    sla a
    add b
    call AddAToHL
    ld a, [hl]
    pop hl
    cp $00
    jr z, jr_001_5a1f

    ld a, [$da38]
    ld [$da0c], a
    ld a, [$da39]
    ld [$da0d], a
    ld a, $05
    ld [$d9a6], a

jr_001_59e3:
    ld de, data_001_58bb
    call Call_000_08a1
    ld a, [de]
    push bc
    push hl
    call Call_001_46e6
    pop hl
    pop bc
    ld a, [$d90e]
    ld d, a
    ld a, [$da0d]
    cp d
    jr nc, jr_001_5a14

    ld a, [$d90d]
    ld d, a
    ld a, [$da0c]
    cp d
    jr nc, jr_001_5a14

    push bc
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    push hl
    call Call_001_5de4
    pop hl
    pop bc

jr_001_5a14:
    ld a, [$d9a6]
    dec a
    ld [$d9a6], a
    cp $ff
    jr nz, jr_001_59e3

jr_001_5a1f:
    ld a, [$da38]
    dec a
    ld [$da38], a
    cp $ff
    jr nz, jr_001_59c1

    ld de, $0060
    call Call_000_08ba
    ld a, [$da39]
    inc a
    ld [$da39], a
    dec c
    ld a, c
    cp $00
    jp nz, Jump_001_59ba

    jp Jump_001_5d47


Jump_001_5a41:
    and $03
    cp $02
    jr nz, jr_001_5a4f

    ld a, [$daf8]
    cp $00
    jp z, Jump_001_5d47

jr_001_5a4f:
    ld a, c
    push bc
    push hl
    call Call_001_5dbb
    pop hl
    pop bc
    dec hl
    dec hl
    ld a, [hl]
    push hl
    and $1f
    call GetUnit
    ld a, UNIT_GND_RANGE
    call AddAToHL
    ld a, [hl]
    cp $02
    jr nc, jr_001_5a6d

    dec hl
    dec hl
    ld a, [hl]

jr_001_5a6d:
    inc a
    ld [$daf9], a
    pop hl
    inc hl
    ld a, [hl+]
    and $1f
    ld [$da0c], a
    ld a, [hl]
    and $1f
    ld [$da0d], a
    ld a, $04
    call Call_001_46e6
    ld a, $02
    ld [$dafa], a

jr_001_5a89:
    ld a, $04
    call Call_001_46e6
    ld a, $00
    ld [$da3a], a

jr_001_5a93:
    ld a, [$dafa]
    ld [$dafb], a

jr_001_5a99:
    ld a, [$d90e]
    ld b, a
    ld a, [$da0d]
    cp b
    jr nc, jr_001_5ab8

    ld a, [$d90d]
    ld b, a
    ld a, [$da0c]
    cp b
    jr nc, jr_001_5ab8

    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_001_5de4

jr_001_5ab8:
    ld a, [$da3a]
    call Call_001_46e6
    ld a, [$dafb]
    dec a
    ld [$dafb], a
    cp $00
    jr nz, jr_001_5a99

    ld a, [$da3a]
    inc a
    ld [$da3a], a
    cp $06
    jr c, jr_001_5a93

    ld a, [$dafa]
    inc a
    ld [$dafa], a
    push af
    ld a, [$daf9]
    ld b, a
    pop af
    cp b
    jr c, jr_001_5a89

    jp Jump_001_5d47


Jump_001_5ae7:
    ld de, $d914
    ld a, [$d90f]
    cp $00
    jr z, jr_001_5af4

    ld de, $d916

jr_001_5af4:
    ld a, [de]
    ld [$da0c], a
    ld b, a
    inc de
    ld a, [de]
    ld [$da0d], a
    ld c, a
    call Call_001_45c2
    ld a, [$d9a1]
    call GetUnit
    ld a, UNIT_SHIFT_RANGE
    call AddAToHL
    ld a, [hl]
    add $04
    push af
    ld a, [$d9a8]
    ld b, a
    pop af
    cp b
    jp c, Jump_001_5c3b

    ld a, $00
    ld [$d9b6], a
    ld [$d9b5], a
    ld a, $01
    ld [$d9b4], a
    call Call_001_4654
    call Call_001_450a
    call Call_001_525e
    ld c, $3c

jr_001_5b32:
    push bc
    call Call_001_526e
    pop bc
    cp $01
    jp z, Jump_001_5b4f

    push bc
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    pop bc
    ld a, [hl]
    cp $00
    jr nz, jr_001_5b58

Jump_001_5b4f:
    dec c
    ld a, c
    cp $00
    jr nz, jr_001_5b32

    jp Jump_001_5c3b


jr_001_5b58:
    ld a, [$d99e]
    ld [$da0c], a
    ld a, [$d99f]
    ld [$da0d], a
    call Call_001_525e
    ld c, $06

jr_001_5b69:
    push bc
    call Call_001_526e
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    pop bc
    ld a, [hl]
    and $0f
    push af
    ld a, [$d910]
    ld b, a
    pop af
    cp b
    jr z, jr_001_5b8e

    dec c
    ld a, c
    cp $00
    jr nz, jr_001_5b69

    jp Jump_001_5bdb


jr_001_5b8e:
    ld a, [$d99e]
    ld [$dafd], a
    ld a, [$d99f]
    ld [$dafe], a
    ld a, [$da0c]
    ld [$d99e], a
    ld a, [$da0d]
    ld [$d99f], a
    call Call_001_7d7c
    ld a, [$dafd]
    ld [$d99e], a
    ld a, [$dafe]
    ld [$d99f], a
    ld c, $00

jr_001_5bb7:
    ld a, c
    ld de, $dac0
    call Call_000_08a1
    ld a, [de]
    cp $ff
    jr z, jr_001_5bdb

    call Call_000_099b
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_ABCD
    cp UNIT_INFANTRY
    jr z, jr_001_5c36

    inc c
    jr jr_001_5bb7

Jump_001_5bdb:
jr_001_5bdb:
    ld a, [$d99e]
    ld [$da0c], a
    ld a, [$d99f]
    ld [$da0d], a
    call Call_001_525e
    ld c, $24

jr_001_5bec:
    push bc
    call Call_001_526e
    pop bc
    cp $01
    jp z, Jump_001_5c2d

    push bc
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    inc hl
    pop bc
    ld a, [hl]
    cp $ff
    jr z, jr_001_5c2d

    and $80
    push af
    ld a, [$d90f]
    ld b, a
    pop af
    cp b
    jr z, jr_001_5c2d

    ld a, [hl]
    and $3f
    call Call_000_099b
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_ABCD
    cp UNIT_INFANTRY
    jr z, jr_001_5c36

Jump_001_5c2d:
jr_001_5c2d:
    dec c
    ld a, c
    cp $00
    jr nz, jr_001_5bec

    jp Jump_001_5c3b


jr_001_5c36:
    ld a, $03
    ld [$d998], a

Jump_001_5c3b:
    ld a, [$d99d]
    call Call_000_099b
    inc hl
    inc hl
    ld a, [hl]
    bit 5, a
    jp z, Jump_001_5d47

    ld a, [$d99d]
    call Call_000_099b
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    and $3f
    call Call_000_099b
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_ABCD
    cp UNIT_INFANTRY
    jr nz, jr_001_5c73

    ld a, $30
    call Call_001_5e3c
    jp Jump_001_5c78


jr_001_5c73:
    ld a, $20
    call Call_001_5e3c

Jump_001_5c78:
    jp Jump_001_5d47


Jump_001_5c7b:
    ld a, [hl]
    bit 6, a
    jr z, jr_001_5c8c

    inc hl
    inc hl
    ld a, [hl]
    dec hl
    ld [$dafc], a
    ld c, a
    ld a, $02
    jr jr_001_5c8e

jr_001_5c8c:
    ld a, $03

jr_001_5c8e:
    ld [$d9b4], a
    ld a, c
    ld [$d99d], a
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $1f
    ld [$d99e], a
    ld a, [hl]
    and $1f
    ld [$d99f], a
    ld a, $00
    ld [$d9b5], a
    ld [$d9b6], a
    call Call_001_4654
    call Call_001_450a
    ld de, $d914
    ld a, [$d90f]
    cp $00
    jr z, jr_001_5cc0

    ld de, $d916

jr_001_5cc0:
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    dec de
    call Call_000_0969
    inc hl
    ld a, [hl]
    cp $00
    jr z, jr_001_5ced

    ld a, $ff
    push hl
    push de
    call Call_001_5e3c
    pop de
    pop hl
    ld a, [hl]
    srl a
    srl a
    srl a
    srl a
    ld b, a
    ld a, [$d9b4]
    sub b
    inc a
    ld [$d998], a
    jp Jump_001_5d47


jr_001_5ced:
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    call Call_001_45c2
    srl a
    srl a
    cp $02
    jr nc, jr_001_5d09

    inc a
    ld [$d998], a
    ld a, $ff
    call Call_001_5e3c
    jp Jump_001_5d47


jr_001_5d09:
    ld de, $da0e
    ld a, $08
    ld [$da60], a

jr_001_5d11:
    ld a, [de]
    cp $ff
    jr z, jr_001_5d47

    ld b, a
    inc de
    ld a, [de]
    ld c, a
    dec de
    call Call_000_0969
    inc hl
    ld a, [hl]
    cp $00
    jr z, jr_001_5d3a

    dec hl
    ld a, [hl]
    and $0f
    cp $0c
    jr z, jr_001_5d35

    push af
    ld a, [$d910]
    ld b, a
    pop af
    cp b
    jr nz, jr_001_5d3a

jr_001_5d35:
    ld a, $64
    call Call_001_5e3c

jr_001_5d3a:
    inc de
    inc de
    ld a, [$da60]
    dec a
    ld [$da60], a
    cp $00
    jr nz, jr_001_5d11

Jump_001_5d47:
jr_001_5d47:
    ld a, [$dafc]
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    ld b, a
    ld a, [$da83]
    cp b
    jr c, jr_001_5d59

    ld [de], a

Jump_001_5d59:
jr_001_5d59:
    ld a, [$d9a7]
    dec a
    ld c, a
    call Call_000_099b
    ld a, c
    cp $ff
    jp nz, Jump_001_5909

    ld a, [$d7a5]
    srl a
    cp $00
    jr nz, jr_001_5d80

    ld a, [$d79a]
    cp $10
    jr c, jr_001_5d80

    cp $13
    jr nc, jr_001_5d80

    ld a, $00
    ld [$d998], a

jr_001_5d80:
    ld a, [$d998]
    cp $00
    jr z, jr_001_5dba

    ld de, $d914
    ld a, [$d90f]
    cp $00
    jr z, jr_001_5d94

    ld de, $d916

jr_001_5d94:
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    call Call_000_0969
    inc hl
    inc hl
    ld a, [hl]
    cp $ff
    jr z, jr_001_5dba

    and $80
    push af
    ld a, [$d90f]
    ld b, a
    pop af
    cp b
    jr z, jr_001_5dba

    ld a, [hl]
    and $3f
    ld de, $d928
    call Call_000_08a1
    ld a, $ff
    ld [de], a

jr_001_5dba:
    ret


Call_001_5dbb:
    push bc
    push hl
    call Call_000_099b
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    bit UNIT_ANTI_AIR_F, a
    jr nz, jr_001_5dd4

    ld a, $00
    jr jr_001_5dde

jr_001_5dd4:
    bit 0, a
    jr nz, jr_001_5ddc

    ld a, $40
    jr jr_001_5dde

jr_001_5ddc:
    ld a, $ff

jr_001_5dde:
    ld [$da03], a
    pop hl
    pop bc
    ret


Call_001_5de4:
    push bc
    push de
    push hl
    call Call_000_0969
    inc hl
    inc hl
    ld a, [hl]
    cp $ff
    jr z, jr_001_5e38

    and $80
    push af
    ld a, [$d90f]
    ld b, a
    pop af
    cp b
    jr nz, jr_001_5e38

    ld a, [hl]
    and $3f
    ld b, a
    ld a, [$da03]
    cp $ff
    jr z, jr_001_5e22

    ld a, b
    call Call_000_099b
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_IS_AIR
    push af
    ld a, [$da03]
    ld c, a
    pop af
    cp c
    jr nz, jr_001_5e38

jr_001_5e22:
    ld a, $01
    call Call_001_5e3c
    ld a, b
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    cp $01
    jr nz, jr_001_5e38

    ld a, $20
    call Call_001_5e3c

jr_001_5e38:
    pop hl
    pop de
    pop bc
    ret


Call_001_5e3c:
    push bc
    ld b, a
    ld a, [$da83]
    add b
    jr nc, jr_001_5e46

    ld a, $ff

jr_001_5e46:
    ld [$da83], a
    pop bc
    ret


Call_001_5e4b:
    ld a, [$d998]
    cp $00
    jp z, Jump_001_5f72

    ld de, $d914
    ld a, [$d90f]
    cp $00
    jr z, jr_001_5e60

    ld de, $d916

jr_001_5e60:
    ld a, [de]
    ld [$da63], a
    inc de
    ld a, [de]
    ld [$da64], a
    ld a, $ff
    ld [$da67], a
    ld a, $00
    ld [$d9b5], a
    ld [$d9b6], a
    ld a, $01
    ld [$d9b4], a
    ld a, $ff
    ld [$da66], a
    ld hl, $d6bc
    ld c, $37

Jump_001_5e85:
    ld a, c
    ld [$d99d], a
    call Call_001_45a0
    cp $00
    jp nz, Jump_001_5f4b

    inc hl
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ld e, a
    dec hl
    dec hl
    ld a, e
    bit 6, a
    jp nz, Jump_001_5f4b

    ld a, d
    and $1f
    ld [$d99e], a
    ld a, e
    and $1f
    ld [$d99f], a
    push bc
    ld a, [$da63]
    ld b, a
    ld a, [$da64]
    ld c, a
    call Call_001_45c2
    pop bc
    ld a, [hl]
    and $1f
    push hl
    call GetUnit
    ld a, UNIT_SHIFT_RANGE
    call AddAToHL
    ld a, [hl]
    ld d, a
    pop hl
    ld a, [$d9a8]
    cp d
    jr z, jr_001_5ecf

    jp nc, Jump_001_5f4b

jr_001_5ecf:
    ld a, [hl]
    and $1f
    push hl
    call GetUnit
    ld a, UNIT_DEF
    call AddAToHL
    ld a, [hl]
    ld e, a
    pop hl
    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    dec a
    ld d, a
    ld hl, $0000
    ld a, d
    cp $00
    jr z, jr_001_5ef6

jr_001_5eef:
    ld a, e
    call AddAToHL
    dec d
    jr nz, jr_001_5eef

jr_001_5ef6:
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld a, l
    ld [$da65], a
    ld b, a
    pop hl
    ld a, [$da66]
    cp $ff
    jr z, jr_001_5f1a

    cp b
    jr nc, jr_001_5f4b

jr_001_5f1a:
    push bc
    push hl
    ld a, $00
    ld [$d9b5], a
    ld [$d9b6], a
    ld a, $01
    ld [$d9b4], a
    call Call_001_4654
    ld a, [$da63]
    ld b, a
    ld a, [$da64]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    pop hl
    pop bc
    cp $00
    jr z, jr_001_5f4b

    ld a, [$da65]
    ld [$da66], a
    ld a, [$d99d]
    ld [$da67], a

Jump_001_5f4b:
jr_001_5f4b:
    ld a, [$d99d]
    ld c, a
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jp nz, Jump_001_5e85

    ld a, [$da67]
    ld c, a
    cp $ff
    jp z, Jump_001_5f72

    ld hl, $d928
    call AddAToHL
    ld a, $02
    ld [hl], a
    ld a, $01
    ld [$da5c], a

Jump_001_5f72:
    ret


Call_001_5f73:
    ld hl, $d572
    ld c, $00

jr_001_5f78:
    ld a, [hl+]
    cp $ff
    jr z, jr_001_5fa2

    and $80
    ld e, a
    ld a, [$d90f]
    cp e
    jr nc, jr_001_5fa2

    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ld e, a
    ld a, e
    and $c0
    cp $00
    jr nz, jr_001_5f98

    ld a, d
    and $e0
    cp $00
    jr z, jr_001_5fa2

jr_001_5f98:
    ld a, c
    ld de, $d928
    call Call_000_08a1
    ld a, $08
    ld [de], a

jr_001_5fa2:
    ld a, $06
    call AddAToHL
    inc c
    ld a, c
    cp $38
    jr nz, jr_001_5f78

    ret


Call_001_5fae::
    ld de, $d918
    ld b, $10

jr_001_5fb3:
    ld a, $ff
    ld [de], a
    inc de
    dec b
    jr nz, jr_001_5fb3

    ld c, $00

jr_001_5fbc:
    ld a, c
    call Call_000_099b
    ld a, [hl]
    cp $ff
    jr z, jr_001_5fe9

    inc hl
    ld a, [hl]
    and $e0
    cp $00
    jr z, jr_001_5fe9

    srl a
    srl a
    srl a
    srl a
    srl a
    dec a
    sla a
    ld de, $d918
    call Call_000_08a1
    ld a, [hl+]
    and $1f
    ld [de], a
    inc de
    ld a, [hl]
    and $1f
    ld [de], a

jr_001_5fe9:
    inc c
    ld a, c
    cp $38
    jr nz, jr_001_5fbc

    ld a, $ff
    ld [$d914], a
    ld [$d915], a
    ld [$d916], a
    ld [$d917], a
    ld hl, $ccf0
    ld c, $00

jr_001_6002:
    push hl
    ld b, $00

jr_001_6005:
    ld a, [hl]
    and $0f
    cp $08
    jr nz, jr_001_6016

    ld a, b
    ld [$d914], a
    ld a, c
    ld [$d915], a
    jr jr_001_6064

jr_001_6016:
    cp $0a
    jr nz, jr_001_6024

    ld a, b
    ld [$d916], a
    ld a, c
    ld [$d917], a
    jr jr_001_6064

jr_001_6024:
    cp $0b
    jr z, jr_001_6030

    cp $0c
    jr z, jr_001_6030

    cp $0d
    jr nz, jr_001_6064

jr_001_6030:
    ld de, $d918
    ld a, $07

jr_001_6035:
    push af
    ld a, [de]
    cp b
    jr nz, jr_001_6044

    inc de
    ld a, [de]
    dec de
    cp c
    jr nz, jr_001_6044

    pop af
    jp Jump_001_6064


jr_001_6044:
    inc de
    inc de
    pop af
    dec a
    jr nz, jr_001_6035

    ld de, $d918
    ld a, $07

jr_001_604f:
    push af
    ld a, [de]
    cp $ff
    jr z, jr_001_605d

    inc de
    inc de
    pop af
    dec a
    jr nz, jr_001_604f

    jr jr_001_6064

jr_001_605d:
    pop af
    ld a, b
    ld [de], a
    inc de
    ld a, c
    ld [de], a
    inc de

Jump_001_6064:
jr_001_6064:
    inc hl
    inc hl
    inc hl
    inc b
    ld a, [$d79b]
    dec a
    cp b
    jr nz, jr_001_6005

    pop hl
    ld a, $60
    call AddAToHL
    inc c
    ld a, [$d79c]
    dec a
    cp c
    jr nz, jr_001_6002

    ret


Call_001_607e:
    ld a, [$d99a]
    inc a
    ld [$d99a], a
    call Call_001_6089
    ret


Call_001_6089:
    ld hl, $d6bc
    ld c, $37

Jump_001_608e:
    ld a, [hl]
    cp $ff
    jr z, jr_001_60b9

    bit 6, a
    jr nz, jr_001_60b9

    ld a, [hl]
    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jr nz, jr_001_60ae

    ld a, c
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    and $7f
    ld [de], a
    jr jr_001_60b9

jr_001_60ae:
    ld a, c
    ld de, $d960
    call Call_000_08a1
    ld a, [de]
    and $7f
    ld [de], a

jr_001_60b9:
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jp nz, Jump_001_608e

    ret


Jump_001_60c6:
    ld a, [$d998]
    cp $00
    jp z, Jump_001_6179

    ld hl, $d6bc
    ld c, $37

jr_001_60d3:
    ld a, [hl]
    cp $ff
    jr z, jr_001_60fb

    bit 6, a
    jr nz, jr_001_60fb

    ld a, [hl]
    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jr nz, jr_001_60fb

    inc hl
    ld a, [hl]
    dec hl
    and $e0
    cp $00
    jr nz, jr_001_60fb

    ld a, c
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    cp $02
    jr z, jr_001_6109

jr_001_60fb:
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jr nz, jr_001_60d3

    jp Jump_001_6179


jr_001_6109:
    ld a, c
    ld [$d99d], a
    ld de, $d914
    ld a, [$d90f]
    cp $00
    jr z, jr_001_611a

    ld de, $d916

jr_001_611a:
    ld a, [de]
    ld [$d9a3], a
    inc de
    ld a, [de]
    ld [$d9a4], a
    push bc
    ld a, [$d9a3]
    ld b, a
    ld a, [$d9a4]
    ld c, a
    call Call_000_0969
    pop bc
    inc hl
    inc hl
    ld a, [hl]
    cp $ff
    jr z, jr_001_6144

    and $3f
    push af
    ld a, [$d99d]
    ld b, a
    pop af
    cp b
    jr z, jr_001_616d

    jr jr_001_6179

jr_001_6144:
    ld a, $00
    ld [$da41], a
    ld a, [$d9a3]
    and $1f
    ld [$da42], a
    ld a, [$d9a4]
    and $1f
    ld [$da43], a
    ld a, $ff
    ld [$da44], a
    ld a, [$d99d]
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    or $08
    ld [de], a
    jr jr_001_6181

jr_001_616d:
    ld a, [$d99d]
    ld de, $d928
    call Call_000_08a1
    ld a, $03
    ld [de], a

Jump_001_6179:
jr_001_6179:
    call Call_001_607e
    ld a, $ff
    ld [$da41], a

jr_001_6181:
    ret


Jump_001_6182:
    ld a, $01
    jp Jump_001_618c


Jump_001_6187:
    ld a, $0b
    jp Jump_001_618c


Jump_001_618c:
    ld [$da40], a
    ld hl, $d6bc
    ld c, $37

jr_001_6194:
    call Call_001_45a0
    cp $00
    jr nz, jr_001_61a7

    ld a, c
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    cp $01
    jr z, jr_001_61bb

jr_001_61a7:
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jr nz, jr_001_6194

    call Call_001_607e
    ld a, $ff
    ld [$da41], a
    ret


jr_001_61bb:
    ld a, c
    ld [$d99d], a
    call Call_001_4719
    ld a, [$d99d]
    ld de, $d960
    call Call_000_08a1
    ld a, [de]
    and $07
    cp $07
    jr z, jr_001_61e7

    sla a
    ld de, $d918
    call Call_000_08a1
    ld a, [de]
    ld [$d9a3], a
    inc de
    ld a, [de]
    ld [$d9a4], a
    call Call_001_4e28
    ret


jr_001_61e7:
    ld b, $00
    ld a, [$d90f]
    cp $00
    jr nz, jr_001_61f2

    ld b, $02

jr_001_61f2:
    ld a, b
    ld de, $d914
    call Call_000_08a1
    ld a, [de]
    ld [$d9a3], a
    inc de
    ld a, [de]
    ld [$d9a4], a
    call Call_001_4e28
    ret


Jump_001_6206:
    ld a, $00
    ld [$da40], a
    ld hl, $d6bc
    ld c, $37

jr_001_6210:
    call Call_001_45a0
    cp $00
    jr nz, jr_001_6245

    ld a, c
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    cp $00
    jr nz, jr_001_6245

    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    bit 6, a
    jr nz, jr_001_6245

    ld a, [hl]
    bit 6, a
    jr nz, jr_001_6245

    push hl
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    pop hl
    and UNIT_ABCD
    cp UNIT_INFANTRY
    jr z, jr_001_6259

jr_001_6245:
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jr nz, jr_001_6210

    call Call_001_607e
    ld a, $ff
    ld [$da41], a
    ret


jr_001_6259:
    ld a, c
    ld [$d99d], a
    call Call_001_4719
    ld de, $d914
    ld a, [$d90f]
    cp $00
    jr nz, jr_001_626d

    ld de, $d916

jr_001_626d:
    ld a, [de]
    ld [$d9a3], a
    ld b, a
    inc de
    ld a, [de]
    ld [$d9a4], a
    ld c, a
    call Call_001_45c2
    ld [$da08], a
    ld de, $d918
    ld a, $08
    ld [$da60], a

jr_001_6286:
    ld a, [de]
    cp $ff
    jr z, jr_001_62cd

    ld b, a
    inc de
    ld a, [de]
    ld c, a
    dec de
    call Call_000_0969
    ld a, [hl]
    push af
    ld a, [$d911]
    ld b, a
    pop af
    cp b
    jr z, jr_001_62a1

    cp $0c
    jr nz, jr_001_62c0

jr_001_62a1:
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    dec de
    call Call_001_45c2
    push af
    ld a, [$da08]
    ld b, a
    pop af
    cp b
    jr c, jr_001_62c0

    ld [$da08], a
    ld a, [de]
    ld [$d9a3], a
    inc de
    ld a, [de]
    ld [$d9a4], a
    dec de

jr_001_62c0:
    inc de
    inc de
    ld a, [$da60]
    dec a
    ld [$da60], a
    cp $ff
    jr nz, jr_001_6286

jr_001_62cd:
    call Call_001_4e28
    ret


data_001_62d1:
    db $06, $12, $24, $3c, $5a, $7e, $a8, $d8

Call_001_62d9:
    ld a, [$da0c]
    ld [$da55], a
    ld a, [$da0d]
    ld [$da56], a
    ld a, [$d99e]
    ld [$da0c], a
    ld a, [$d99f]
    ld [$da0d], a
    ld a, [$d9a1]
    call GetUnit
    ld a, UNIT_SHIFT_RANGE
    call AddAToHL
    ld a, [hl]
    dec a
    cp $08
    jp nc, Jump_001_63a0

    ld hl, data_001_62d1
    call AddAToHL
    ld a, [hl]
    ld [$da60], a
    call Call_001_525e
    jp Jump_001_631b


Jump_001_6313:
    call Call_001_526e
    cp $01
    jp z, Jump_001_6394

Jump_001_631b:
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    inc hl
    ld a, [hl]
    cp $ff
    jp z, Jump_001_6394

    and $3f
    call Call_000_099b
    ld a, [hl]
    and $80
    push af
    ld a, [$d90f]
    ld b, a
    pop af
    cp b
    jp nz, Jump_001_6394

    push hl
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    pop hl
    ld b, a
    and UNIT_CAN_CARRY
    cp $00
    jp z, Jump_001_6394

    inc hl
    inc hl
    ld a, [hl]
    and $20
    cp $00
    jp nz, Jump_001_6394

    ld a, [$d9a1]
    ld c, a
    ld a, b
    and $01
    cp $00
    jp nz, Jump_001_6380

    ld a, c
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_INFANTRY
    cp $00
    jp nz, Jump_001_63af

    jp Jump_001_6394


Jump_001_6380:
    ld a, c
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_IS_AIR
    cp $00
    jp z, Jump_001_63af

    jp Jump_001_6394


Jump_001_6394:
    ld a, [$da60]
    dec a
    ld [$da60], a
    cp $00
    jp nz, Jump_001_6313

Jump_001_63a0:
    ld a, [$da55]
    ld [$da0c], a
    ld a, [$da56]
    ld [$da0d], a
    ld a, $01
    ret


Jump_001_63af:
    ld a, [$da0c]
    ld [$dab3], a
    ld a, [$da0d]
    ld [$dab4], a
    ld a, $00
    ret


Call_001_63be:
    ld a, [$da04]
    ld [$d9a3], a
    ld [$d99e], a
    ld a, [$da05]
    ld [$d9a4], a
    ld [$d99f], a
    ld a, $ff
    ld [$dab3], a
    ld hl, $d6bc
    ld c, $37

jr_001_63da:
    ld a, [hl]
    cp $ff
    jp nz, Jump_001_643e

    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    and $e0
    cp $00
    jp nz, Jump_001_643e

    ld a, [hl]
    and $40
    cp $00
    jr nz, jr_001_643e

    ld a, [hl]
    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jp nz, Jump_001_643e

    ld a, c
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    cp $00
    jp nz, Jump_001_643e

    ld a, [hl]
    and $1f
    push hl
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    pop hl
    and UNIT_CAN_CARRY
    cp $00
    jp z, Jump_001_643e

    inc hl
    ld a, [hl+]
    and $1f
    ld b, a
    ld a, [hl-]
    and $1f
    ld c, a
    dec hl
    call Call_001_45c2
    push af
    ld a, [$dab3]
    ld b, a
    pop af
    cp b
    jp nc, Jump_001_643e

    ld [$dab3], a
    ld a, c
    ld [$dab4], a

Jump_001_643e:
jr_001_643e:
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jr nz, jr_001_63da

    ld a, [$dab3]
    cp $ff
    jp z, Jump_001_647a

    ld a, [$dab4]
    ld [$d99d], a
    ld [$d9a7], a
    call Call_001_4719
    ld a, [$da04]
    ld b, a
    ld a, [$da05]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    cp $00
    jp z, Jump_001_647a

    ld a, $ff
    ld [$da01], a
    call Call_001_67fe
    cp $00
    ret z

Jump_001_647a:
    ld a, $ff
    ld [$da41], a
    ld a, $01
    ret


Jump_001_6482:
    ld hl, $d6bc
    ld c, $37

jr_001_6487:
    ld a, [hl]
    cp $ff
    jr z, jr_001_64ce

    bit 6, a
    jr nz, jr_001_64ce

    inc hl
    ld a, [hl]
    dec hl
    and $e0
    cp $00
    jp nz, Jump_001_64ce

    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    bit 6, a
    jp nz, Jump_001_64ce

    ld a, [hl]
    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jr nz, jr_001_64ce

    push hl
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    pop hl
    and UNIT_ABCD
    cp UNIT_INFANTRY
    jr z, jr_001_64ce

    ld a, c
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    cp $00
    jr z, jr_001_64df

Jump_001_64ce:
jr_001_64ce:
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jr nz, jr_001_6487

    call Call_001_607e
    jp Jump_001_6660


jr_001_64df:
    ld a, c
    ld [$d99d], a
    ld [$d9a7], a
    push bc
    push hl
    call Call_001_4719
    pop hl
    pop bc
    ld a, $ff
    ld [$da01], a
    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    and $60
    cp $20
    jr nz, jr_001_6546

    ld hl, $d6bc
    ld c, $37

jr_001_6502:
    ld a, [hl]
    cp $ff
    jr z, jr_001_6520

    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    bit 6, a
    jr z, jr_001_6520

    ld a, [$d9a7]
    ld b, a
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    dec hl
    dec hl
    cp b
    jr z, jr_001_652b

jr_001_6520:
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jr nz, jr_001_6502

jr_001_652b:
    ld a, c
    ld [$da01], a
    ld [$d99d], a
    ld a, [hl]
    and $1f
    ld [$d9a1], a
    cp $00
    jr nz, jr_001_6546

    push bc
    push hl
    call Call_001_6a1a
    pop hl
    pop bc
    jp Jump_001_654d


jr_001_6546:
    push bc
    push hl
    call Call_001_6666
    pop hl
    pop bc

Jump_001_654d:
    ld a, [$da04]
    cp $ff
    jp z, Jump_001_6653

    push bc
    push hl
    call Call_001_67fe
    pop hl
    pop bc
    cp $01
    jp z, Jump_001_6653

    ld a, [hl]
    and $1f
    cp $0e
    jr z, jr_001_656b

jr_001_6568:
    jp Jump_001_6665


jr_001_656b:
    ld a, [$da01]
    cp $ff
    jp z, Jump_001_6665

    ld a, [$da41]
    cp $00
    jr nz, jr_001_6568

    ld a, [$da44]
    cp $ff
    jr nz, jr_001_6568

    ld a, [$da42]
    ld [$da0c], a
    ld a, [$da43]
    ld [$da0d], a
    ld a, $04
    call Call_001_46e6
    ld a, $04
    call Call_001_46e6
    ld a, $00
    ld [$da06], a
    ld a, $ff
    ld [$da04], a
    ld a, $00
    ld [$da0b], a

Jump_001_65a6:
    ld a, $02
    ld [$da09], a

Jump_001_65ab:
    ld a, [$da0b]
    call Call_001_46e6
    ld a, [$d90e]
    ld b, a
    ld a, [$da0d]
    cp b
    jp nc, Jump_001_661d

    ld a, [$d90d]
    ld b, a
    ld a, [$da0c]
    cp b
    jp nc, Jump_001_661d

    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    inc hl
    ld a, [hl]
    cp $ff
    jp z, Jump_001_661d

    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jp z, Jump_001_661d

    ld a, [hl]
    and $3f
    ld b, a
    call Call_000_099b
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_IS_AIR
    cp $00
    jr nz, jr_001_661d

    ld a, b
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    push af
    ld a, [$da06]
    ld c, a
    pop af
    cp c
    jr c, jr_001_661d

    ld [$da06], a
    ld a, [$da0c]
    ld [$da04], a
    ld a, [$da0d]
    ld [$da05], a

Jump_001_661d:
jr_001_661d:
    ld a, [$da09]
    dec a
    ld [$da09], a
    cp $00
    jp nz, Jump_001_65ab

    ld a, [$da0b]
    inc a
    ld [$da0b], a
    cp $06
    jp c, Jump_001_65a6

    ld a, [$da04]
    cp $80
    jp nc, Jump_001_6665

    ld [$da45], a
    ld a, [$da05]
    ld [$da46], a
    ld a, $ff
    ld [$da47], a
    ld a, $01
    ld [$da44], a
    jp Jump_001_6665


Jump_001_6653:
    ld a, [$d9a7]
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    or $80
    ld [de], a

Jump_001_6660:
    ld a, $ff
    ld [$da41], a

Jump_001_6665:
    ret


Call_001_6666:
    ld a, [$d9a1]
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    bit UNIT_4_F, a
    jr z, jr_001_667a

    bit UNIT_HAS_INDIR_F, a
    jr nz, jr_001_669e

jr_001_667a:
    ld a, $02
    ld [$da02], a
    ld b, $00
    dec hl
    dec hl
    ld a, [hl]
    cp $00
    jr z, jr_001_6693

    dec hl
    dec hl
    ld a, [hl]
    cp $00
    jr z, jr_001_66b6

    ld b, $ff
    jr jr_001_66b6

jr_001_6693:
    dec hl
    dec hl
    ld a, [hl]
    cp $00
    jr z, jr_001_66b6

    ld b, $40
    jr jr_001_66b6

jr_001_669e:
    ld b, $00
    dec hl
    dec hl
    ld a, [hl]
    cp $00
    jr z, jr_001_66ad

    dec hl
    ld a, [hl]
    cp $02
    jr nc, jr_001_66b2

jr_001_66ad:
    dec hl
    dec hl
    ld a, [hl]
    ld b, $40

jr_001_66b2:
    inc a
    ld [$da02], a

jr_001_66b6:
    ld a, b
    ld [$da03], a
    call Call_001_66c9
    ld a, [$da04]
    ld a, $ff
    ld [$da03], a
    call Call_001_66c9
    ret


Call_001_66c9:
    ld a, $ff
    ld [$da04], a
    ld a, $00
    ld [$da06], a
    ld hl, $d6bc
    ld c, $37

Jump_001_66d8:
    ld a, [hl]
    ld d, a
    cp $ff
    jr z, jr_001_672a

    inc hl
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    dec hl
    dec hl
    and $c0
    cp $00
    jr nz, jr_001_672a

    ld a, d
    and $80
    ld d, a
    ld a, [$d90f]
    cp d
    jr z, jr_001_672a

    ld a, e
    and $e0
    cp $00
    jr nz, jr_001_672a

    ld a, [$da03]
    cp $ff
    jr z, jr_001_6719

    push hl
    ld a, [hl]
    and $3f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    pop hl
    and UNIT_IS_AIR
    ld b, a
    ld a, [$da03]
    cp b
    jr nz, jr_001_672a

jr_001_6719:
    push hl
    ld a, [$da06]
    ld b, a
    ld a, c
    ld hl, $d928
    call AddAToHL
    ld a, [hl]
    pop hl
    sub b
    jr nc, jr_001_672d

jr_001_672a:
    jp Jump_001_67f1


jr_001_672d:
    ld a, c
    ld [$d9a2], a
    inc hl
    ld a, [hl+]
    and $1f
    ld [$da0c], a
    ld [$d9a3], a
    ld a, [hl]
    and $1f
    ld [$da0d], a
    ld [$d9a4], a
    dec hl
    dec hl
    ld a, $00
    ld [$da07], a
    ld [$da08], a
    ld a, $01
    ld [$da0a], a

Jump_001_6753:
    ld a, $04
    call Call_001_46e6
    ld a, $00
    ld [$da0b], a

jr_001_675d:
    ld a, [$da0a]
    ld [$da09], a

jr_001_6763:
    ld a, [$d90e]
    ld b, a
    ld a, [$da0d]
    cp b
    jr nc, jr_001_67b2

    ld a, [$d90d]
    ld b, a
    ld a, [$da0c]
    cp b
    jr nc, jr_001_67b2

    push bc
    push hl
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    pop hl
    pop bc
    cp $00
    jr z, jr_001_67b2

    ld d, a
    and $f0
    push af
    ld a, [$da07]
    ld b, a
    pop af
    cp b
    jr c, jr_001_67b2

    jr z, jr_001_67b2

    ld a, d
    and $f0
    ld [$da07], a
    ld a, d
    and $0f
    ld [$da08], a
    ld a, [$da0c]
    ld [$da04], a
    ld a, [$da0d]
    ld [$da05], a

jr_001_67b2:
    ld a, [$da0b]
    call Call_001_46e6
    ld a, [$da09]
    dec a
    ld [$da09], a
    cp $00
    jr nz, jr_001_6763

    ld a, [$da0b]
    inc a
    ld [$da0b], a
    cp $06
    jr c, jr_001_675d

    ld a, [$da02]
    ld b, a
    ld a, [$da0a]
    inc a
    ld [$da0a], a
    cp b
    jp c, Jump_001_6753

    ld a, [$da07]
    cp $00
    jr z, jr_001_67f1

    ld a, [$d9a2]
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    ld [$da06], a

Jump_001_67f1:
jr_001_67f1:
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jp nz, Jump_001_66d8

    ret


Call_001_67fe:
    ld a, [$d9a7]
    ld [$d99d], a
    ld a, [$da04]
    ld [$d9a3], a
    ld a, [$da05]
    ld [$d9a4], a
    call Call_001_4b9a
    ld a, [$da0c]
    ld [$da04], a
    ld a, [$da0d]
    ld [$da05], a
    ld a, [$da01]
    cp $80
    jp nc, Jump_001_6881

    ld a, [$d9a3]
    ld b, a
    ld a, [$da04]
    cp b
    jr nz, jr_001_6881

    ld a, [$d9a4]
    ld b, a
    ld a, [$da05]
    cp b
    jr nz, jr_001_6881

    ld a, [$da12]
    cp $00
    jr z, jr_001_6881

    dec a
    cp $00
    jr nz, jr_001_6855

    ld a, [$d99e]
    ld [$da04], a
    ld a, [$d99f]
    ld [$da05], a
    jr jr_001_6881

jr_001_6855:
    ld b, a
    ld a, [$d99e]
    ld [$da0c], a
    ld a, [$d99f]
    ld [$da0d], a
    ld c, $00

jr_001_6864:
    ld a, c
    ld hl, $da14
    call AddAToHL
    ld a, [hl]
    inc c
    push bc
    call Call_001_46e6
    pop bc
    dec b
    jr nz, jr_001_6864

    ld a, [$da0c]
    ld [$da04], a
    ld a, [$da0d]
    ld [$da05], a

Jump_001_6881:
jr_001_6881:
    ld a, $00
    ld [$da0e], a
    ld a, $00
    ld [$da40], a
    ld a, $01
    ld [$da11], a
    call Call_001_4d62
    cp $00
    jp z, Jump_001_696a

    ld a, [$da04]
    ld [$d9a3], a
    ld a, [$da05]
    ld [$d9a4], a
    call Call_001_4c0e
    ld a, [$d99e]
    ld [$da0c], a
    ld a, [$d99f]
    ld [$da0d], a
    ld c, $00
    ld a, [$da12]
    cp $03
    jp c, Jump_001_68d1

    jp z, Jump_001_68d1

    sub $03
    ld b, a

jr_001_68c3:
    ld a, c
    inc c
    push bc
    call Call_001_46e6
    pop bc
    dec b
    jr nz, jr_001_68c3

    ld a, $03
    jr jr_001_68d4

Jump_001_68d1:
    ld a, [$da12]

jr_001_68d4:
    ld [$da09], a
    ld a, $00
    ld [$da08], a

Jump_001_68dc:
    ld a, c
    inc c
    push bc
    call Call_001_46e6
    call Call_001_4d62
    pop bc
    cp $01
    jp z, Jump_001_68fe

    ld a, [$da0c]
    ld [$da04], a
    ld a, [$da0d]
    ld [$da05], a
    ld a, [$da08]
    inc a
    ld [$da08], a

Jump_001_68fe:
    ld a, [$da09]
    dec a
    ld [$da09], a
    cp $00
    jp nz, Jump_001_68dc

    ld a, [$da08]
    cp $00
    jp nz, Jump_001_696a

    ld a, [$da04]
    ld [$d9a3], a
    ld a, [$da05]
    ld [$d9a4], a
    call Call_001_4c0e
    ld a, [$d99e]
    ld [$da0c], a
    ld a, [$d99f]
    ld [$da0d], a
    ld a, $ff
    ld [$da04], a
    ld c, $00

Jump_001_6934:
    ld a, c
    ld hl, $da14
    call AddAToHL
    ld a, [hl]
    push bc
    call Call_001_46e6
    call Call_001_4d62
    pop bc
    cp $01
    jp z, Jump_001_6955

    ld a, [$da0c]
    ld [$da04], a
    ld a, [$da0d]
    ld [$da05], a

Jump_001_6955:
    inc c
    ld a, [$da12]
    ld b, a
    ld a, c
    cp b
    jp c, Jump_001_6934

    ld a, [$da04]
    cp $80
    jp c, Jump_001_696a

    jp Jump_001_6a17


Jump_001_696a:
    ld a, [$da01]
    cp $80
    jr nc, jr_001_69dd

    ld a, [$d9a7]
    ld [$d99d], a
    ld a, $00
    ld [$da0e], a
    ld a, [$da04]
    ld [$da0c], a
    ld a, [$da05]
    ld [$da0d], a
    call Call_001_6ccb
    cp $01
    jr z, jr_001_69dd

    ld a, $00
    ld [$da41], a
    ld a, [$da04]
    ld [$da42], a
    ld a, [$da05]
    ld [$da43], a
    ld a, $0a
    ld [$da44], a
    ld a, [$dab3]
    ld [$da45], a
    ld a, [$dab4]
    ld [$da46], a
    ld a, $ff
    ld [$da47], a
    ld a, [$d9a7]
    ld hl, $d928
    call AddAToHL
    ld a, [hl]
    or $08
    ld b, a
    ld a, [$da01]
    ld hl, $d928
    call AddAToHL
    ld a, b
    ld [hl], a
    ld a, [$d9a7]
    ld hl, $d928
    call AddAToHL
    ld a, $08
    ld [hl], a
    ld a, $00
    ret


jr_001_69dd:
    ld a, [$d99e]
    ld b, a
    ld a, [$da04]
    cp b
    jr nz, jr_001_69f1

    ld a, [$d99f]
    ld b, a
    ld a, [$da05]
    cp b
    jr z, jr_001_6a17

jr_001_69f1:
    ld a, $00
    ld [$da41], a
    ld a, [$da04]
    ld [$da42], a
    ld a, [$da05]
    ld [$da43], a
    ld a, $ff
    ld [$da44], a
    ld a, [$d9a7]
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    or $08
    ld [de], a
    ld a, $00
    ret


Jump_001_6a17:
jr_001_6a17:
    ld a, $01
    ret


Call_001_6a1a:
    ld a, $ff
    ld [$da04], a
    ld a, [$d99e]
    ld [$da0c], a
    ld a, [$d99f]
    ld [$da0d], a
    call Call_001_525e
    ld a, $03
    ld [$da38], a
    ld a, $00
    ld [$da39], a

Jump_001_6a38:
    call Call_001_526e
    cp $01
    jr z, jr_001_6a6f

    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    cp $00
    jr z, jr_001_6a6f

    ld a, [$da38]
    push af
    ld a, [$da39]
    push af
    call Call_001_6a9c
    ld b, a
    pop af
    ld [$da39], a
    pop af
    ld [$da38], a
    ld a, b
    cp $01
    jr z, jr_001_6a6f

    inc hl
    ld a, [hl]
    cp $ff
    jr z, jr_001_6a89

jr_001_6a6f:
    ld a, [$da39]
    dec a
    ld [$da39], a
    cp $00
    jp nz, Jump_001_6a38

    ld a, [$da38]
    dec a
    ld [$da38], a
    cp $00
    jp nz, Jump_001_6a38

    jr jr_001_6a95

jr_001_6a89:
    ld a, [$da0c]
    ld [$da04], a
    ld a, [$da0d]
    ld [$da05], a

jr_001_6a95:
    ret


data_001_6a96:
    db $00, $01, $02

data_001_6a99:
    db $03, $04, $05

Call_001_6a9c:
    ld a, [$da0c]
    ld [$da55], a
    ld [$dab3], a
    ld a, [$da0d]
    ld [$da56], a
    ld [$dab4], a
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    inc hl
    ld a, [hl]
    cp $ff
    jr z, jr_001_6ad6

    and $3f
    call Call_000_099b
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_SHIFT_RANGE
    call AddAToHL
    ld a, [hl]
    cp $00
    jp z, Jump_001_6bc9

jr_001_6ad6:
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    and $0f
    cp $02
    jr c, jr_001_6aed

    cp $06
    jp nz, Jump_001_6bc9

jr_001_6aed:
    ld a, $02
    ld [$da38], a
    ld a, $00
    ld [$da59], a
    ld [$da58], a

Jump_001_6afa:
    ld a, [$da38]
    ld hl, data_001_6a96
    call AddAToHL
    ld a, [hl]
    call Call_001_6bd8
    cp $00
    jr z, jr_001_6b2d

    cp $80
    jr c, jr_001_6b45

    ld a, [$da38]
    ld hl, data_001_6a99
    call AddAToHL
    ld a, [hl]
    call Call_001_6bd8
    cp $00
    jr z, jr_001_6b45

    cp $80
    jr c, jr_001_6b45

    ld a, [$da59]
    inc a
    ld [$da59], a
    jr jr_001_6b45

jr_001_6b2d:
    ld a, [$da38]
    ld hl, data_001_6a99
    call AddAToHL
    ld a, [hl]
    call Call_001_6bd8
    cp $00
    jr nz, jr_001_6b45

    ld a, [$da58]
    inc a
    ld [$da58], a

jr_001_6b45:
    ld a, [$da38]
    dec a
    ld [$da38], a
    cp $80
    jp c, Jump_001_6afa

    ld a, [$da59]
    cp $00
    jp z, Jump_001_6bc9

    ld a, [$da58]
    cp $00
    jp z, Jump_001_6bc9

    ld a, [$dab3]
    ld [$da0c], a
    ld a, [$dab4]
    ld [$da0d], a
    call Call_001_525e
    ld a, $5a
    ld [$dab5], a
    ld a, $00
    ld [$da5a], a

Jump_001_6b7a:
    call Call_001_526e
    cp $01
    jp z, Jump_001_6ba6

    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    inc hl
    ld a, [hl]
    cp $ff
    jp z, Jump_001_6ba6

    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jp z, Jump_001_6ba6

    ld a, [$da5a]
    inc a
    ld [$da5a], a

Jump_001_6ba6:
    ld a, [$dab5]
    dec a
    ld [$dab5], a
    cp $00
    jp nz, Jump_001_6b7a

    ld a, [$da5a]
    cp $00
    jp z, Jump_001_6bc9

    ld a, [$da56]
    ld [$da0d], a
    ld a, [$da55]
    ld [$da0c], a
    ld a, $00
    ret


Jump_001_6bc9:
    ld a, [$da56]
    ld [$da0d], a
    ld a, [$da55]
    ld [$da0c], a
    ld a, $01
    ret


Call_001_6bd8:
    push af
    ld a, [$dab3]
    ld [$da0c], a
    ld a, [$dab4]
    ld [$da0d], a
    pop af
    ld b, a
    push bc
    call Call_001_6c0d
    pop bc
    cp $00
    jr z, jr_001_6c0a

    cp $80
    jr nc, jr_001_6bff

    ld a, b
    call Call_001_6c0d
    cp $00
    jr z, jr_001_6c0a

    ld a, $01
    ret


jr_001_6bff:
    ld a, b
    call Call_001_6c0d
    cp $00
    jr z, jr_001_6c0a

    ld a, $01
    ret


jr_001_6c0a:
    ld a, $00
    ret


Call_001_6c0d:
    call Call_001_46e6
    ld a, [$d90e]
    ld b, a
    ld a, [$da0d]
    cp b
    jr nc, jr_001_6c42

    ld a, [$d90d]
    ld b, a
    ld a, [$da0c]
    cp b
    jr nc, jr_001_6c42

    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    and $0f
    cp $02
    jr c, jr_001_6c48

    cp $06
    jr z, jr_001_6c48

    cp $05
    jr z, jr_001_6c45

    cp $04
    jr z, jr_001_6c45

jr_001_6c42:
    ld a, $01
    ret


jr_001_6c45:
    ld a, $00
    ret


jr_001_6c48:
    ld a, $ff
    ret


Jump_001_6c4b:
    ld a, [$d998]
    cp $00
    jr z, jr_001_6ca1

    ld a, [$da5c]
    cp $00
    jr nz, jr_001_6ca1

    ld a, $00
    ld [$da40], a
    ld hl, $d6bc
    ld c, $37

Jump_001_6c63:
    ld a, [hl]
    cp $ff
    jr z, jr_001_6c95

    bit 6, a
    jr nz, jr_001_6c95

    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jr nz, jr_001_6c95

    inc hl
    ld a, [hl]
    dec hl
    and $e0
    cp $00
    jp nz, Jump_001_6c95

    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    bit 6, a
    jp nz, Jump_001_6c95

    ld a, c
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    cp $00
    jr z, jr_001_6caa

Jump_001_6c95:
jr_001_6c95:
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jp nz, Jump_001_6c63

jr_001_6ca1:
    call Call_001_607e
    ld a, $ff
    ld [$da41], a
    ret


jr_001_6caa:
    ld a, c
    ld [$d99d], a
    call Call_001_4719
    ld de, $d914
    ld a, [$d90f]
    cp $00
    jr z, jr_001_6cbe

    ld de, $d916

jr_001_6cbe:
    ld a, [de]
    ld [$d9a3], a
    inc de
    ld a, [de]
    ld [$d9a4], a
    call Call_001_4e28
    ret


Call_001_6ccb:
    ld a, [$da0c]
    ld [$da55], a
    ld a, [$da0d]
    ld [$da56], a
    ld a, [$d99d]
    call Call_000_099b
    inc hl
    inc hl
    ld a, [hl]
    and $60
    cp $20
    jp nz, Jump_001_6cf8

    ld a, [$d99d]
    call Call_000_099b
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    ld c, a
    call Call_000_099b
    jr jr_001_6cfb

Jump_001_6cf8:
    jp Jump_001_6e12


jr_001_6cfb:
    ld a, c
    call Call_000_099b
    ld a, [hl]
    and $40
    cp $00
    jp nz, Jump_001_6cf8

    ld a, c
    ld [$d9a2], a
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_SHIFT_RANGE
    call AddAToHL
    ld a, [hl]
    cp $00
    jr nz, jr_001_6d3c

    ld bc, $02c0
    ld hl, $ccf1

jr_001_6d21:
    ld a, $00
    ld [hl+], a
    inc hl
    inc hl
    dec bc
    ld a, b
    or c
    jr nz, jr_001_6d21

    ld a, [$d9a3]
    ld b, a
    ld a, [$d9a4]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, $01
    ld [hl], a
    jr jr_001_6d88

jr_001_6d3c:
    ld a, [$d99d]
    push af
    ld a, [$d99e]
    push af
    ld a, [$d99f]
    push af
    ld a, [$da38]
    ld [$d99d], a
    push af
    ld a, [$d9a3]
    ld [$d99e], a
    push af
    ld a, [$d9a4]
    ld [$d99f], a
    push af
    ld a, $00
    ld [$d9b5], a
    ld [$d9b6], a
    ld a, $01
    ld [$d9b4], a
    call Call_001_4654
    call Call_001_450a
    pop af
    ld [$d9a4], a
    pop af
    ld [$d9a3], a
    pop af
    ld [$da38], a
    pop af
    ld [$d99f], a
    pop af
    ld [$d99e], a
    pop af
    ld [$d99d], a

jr_001_6d88:
    call Call_001_525e
    ld a, $00
    ld [$da5b], a
    ld a, $06
    ld [$da38], a

Jump_001_6d95:
    call Call_001_526e
    cp $01
    jr z, jr_001_6def

    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    cp $00
    jr z, jr_001_6def

    ld [$d9aa], a
    inc hl
    ld a, [hl]
    cp $ff
    jr nz, jr_001_6def

    dec hl
    dec hl
    ld a, [hl]
    and $0f
    cp $06
    jr z, jr_001_6dd2

    cp $02
    jr c, jr_001_6dd2

    ld b, a
    ld a, [$da0e]
    cp $01
    jr nz, jr_001_6def

    ld a, [$d910]
    cp b
    jr nz, jr_001_6def

    ld a, b

jr_001_6dd2:
    ld a, [$d9aa]
    and $0f
    push af
    ld a, [$da5b]
    ld b, a
    pop af
    cp b
    jr c, jr_001_6def

    ld [$da5b], a
    ld a, [$da0c]
    ld [$dab3], a
    ld a, [$da0d]
    ld [$dab4], a

jr_001_6def:
    ld a, [$da38]
    dec a
    ld [$da38], a
    cp $00
    jp nz, Jump_001_6d95

    ld a, [$da5b]
    cp $00
    jp z, Jump_001_6e12

    ld a, [$da55]
    ld [$da0c], a
    ld a, [$da56]
    ld [$da0d], a
    ld a, $00
    ret


Jump_001_6e12:
    ld a, [$da55]
    ld [$da0c], a
    ld a, [$da56]
    ld [$da0d], a
    ld a, $01
    ret


data_001_6e21:
    db $01, $01, $00, $00

data_001_6e25:
    db $14, $20, $20, $00

data_001_6e29:
    db $00, $03, $00, $00

data_001_6e2d:
    db $00, $00, $10, $0a

Jump_001_6e31:
    ld a, $03
    jr jr_001_6e41

Jump_001_6e35:
    ld a, $02
    jr jr_001_6e41

Jump_001_6e39:
    ld a, $01
    jr jr_001_6e41

Jump_001_6e3d:
    ld a, $00
    jr jr_001_6e41

jr_001_6e41:
    ld b, a
    ld hl, data_001_6e21
    call AddAToHL

jr_001_6e48:
    ld a, [hl]
    ld [$da83], a
    ld [$da69], a
    ld a, b
    ld hl, data_001_6e25
    call AddAToHL
    ld a, [hl]
    ld [$da6a], a
    ld a, b
    ld hl, data_001_6e29
    call AddAToHL
    ld a, [hl]
    ld [$da68], a
    ld a, b
    ld hl, data_001_6e2d
    call AddAToHL
    ld a, [hl]
    ld [$da40], a
    ld a, $ff
    ld [$d9a2], a
    ld hl, $d6bc
    ld c, $37

Jump_001_6e7a:
    ld a, [hl]
    cp $ff
    jr z, jr_001_6ebf

    ld a, [hl]
    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jr z, jr_001_6ebf

    ld a, c
    ld de, $d960
    call Call_000_08a1
    ld a, [de]
    cp $00
    jr nz, jr_001_6ebf

    inc hl
    ld a, [hl]
    dec hl
    and $e0
    cp $00
    jr nz, jr_001_6ebf

    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    bit 6, a
    jr nz, jr_001_6ebf

    ld a, c
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    push af
    ld a, [$da83]
    ld b, a
    pop af
    cp b
    jr c, jr_001_6ebf

    ld [$da83], a
    ld a, c
    ld [$d9a2], a

jr_001_6ebf:
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jp nz, Jump_001_6e7a

    ld a, [$d9a2]
    cp $80
    jr c, jr_001_6ed8

    call Call_001_607e
    jp Jump_001_704f


jr_001_6ed8:
    ld a, [$d9a2]
    ld c, a
    call Call_000_099b
    ld a, [hl+]
    and $1f
    ld [$d9a5], a
    ld a, [hl+]
    and $1f
    ld [$d9a3], a
    ld a, [hl]
    and $1f
    ld [$d9a4], a
    dec hl
    dec hl
    push hl
    ld a, [$d9a5]
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    pop hl
    and UNIT_IS_AIR
    ld b, $00
    cp $00
    jr z, jr_001_6f0b

    ld b, $01

jr_001_6f0b:
    ld a, b
    ld [$da03], a
    ld a, [$da6a]
    ld [$da83], a
    ld a, $ff
    ld [$da6b], a
    ld a, $00
    ld [$d9b5], a
    ld [$d9b6], a
    ld a, $01
    ld [$d9b4], a
    ld hl, $d6bc
    ld c, $37

Jump_001_6f2c:
    ld a, c
    ld [$d9a6], a
    call Call_001_45a0
    cp $00
    jp nz, Jump_001_6fd2

    ld a, [hl]
    cp $ff
    jp z, Jump_001_6fd2

    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    and $60
    cp $00
    jp nz, Jump_001_6fd2

    ld a, c
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    ld b, a
    ld a, [$da68]
    cp b
    jp nz, Jump_001_6fd2

    ld a, [hl]
    and $1f
    ld b, a
    ld a, [$da03]
    cp $00
    jr nz, jr_001_6f78

    push hl
    ld a, b
    call GetUnit
    ld a, UNIT_GND_POWER
    call AddAToHL
    ld a, [hl]
    pop hl
    cp $00
    jp z, Jump_001_6fd2

    jr jr_001_6f89

jr_001_6f78:
    push hl
    ld a, b
    call GetUnit
    ld a, UNIT_AIR_POWER
    call AddAToHL
    ld a, [hl]
    pop hl
    cp $00
    jp z, Jump_001_6fd2

jr_001_6f89:
    ld a, c
    ld [$d99d], a
    ld a, b
    ld [$d9a1], a
    inc hl
    ld a, [hl+]
    and $1f
    ld [$d99e], a
    ld a, [hl]
    and $1f
    ld [$d99f], a
    dec hl
    dec hl
    ld a, [$da03]
    cp $00
    jr nz, jr_001_6fb7

    push hl
    ld a, [$d9a1]
    call GetUnit
    ld a, UNIT_GND_RANGE
    call AddAToHL
    ld a, [hl]
    pop hl
    jr jr_001_6fc5

jr_001_6fb7:
    push hl
    ld a, [$d9a1]
    call GetUnit
    ld a, UNIT_AIR_RANGE
    call AddAToHL
    ld a, [hl]
    pop hl

jr_001_6fc5:
    cp $02
    jr nc, jr_001_6fcf

    call Call_001_7055
    jp Jump_001_6fd2


jr_001_6fcf:
    call Call_001_71d3

Jump_001_6fd2:
    ld a, [$d9a6]
    ld c, a
    call Call_000_099b
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jp nz, Jump_001_6f2c

    ld a, [$da6b]
    cp $80
    jr c, jr_001_6ffc

    ld a, [$d9a2]
    ld de, $d960
    call Call_000_08a1
    ld a, [de]
    or $80
    ld [de], a
    jp Jump_001_704f


jr_001_6ffc:
    ld a, [$da6b]
    ld [$d99d], a
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    or $08
    ld [de], a
    ld de, $da41
    ld a, [$d99d]
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $1f
    ld b, a
    ld a, [$da6c]
    cp b
    jr nz, jr_001_702a

    ld a, [hl]
    and $1f
    ld b, a
    ld a, [$da6d]
    cp b
    jr z, jr_001_7038

jr_001_702a:
    ld a, $00
    ld [de], a
    inc de
    ld a, [$da6c]
    ld [de], a
    inc de
    ld a, [$da6d]
    ld [de], a
    inc de

jr_001_7038:
    ld a, $01
    ld [de], a
    inc de
    ld a, [$d9a3]
    and $1f
    ld [de], a
    inc de
    ld a, [$d9a4]
    and $1f
    ld [de], a
    inc de
    ld a, $ff
    ld [de], a
    jr jr_001_7054

Jump_001_704f:
    ld a, $ff
    ld [$da41], a

jr_001_7054:
    ret


Call_001_7055:
    ld a, [$d9a3]
    ld b, a
    ld a, [$d9a4]
    ld c, a
    call Call_001_45c2
    dec a
    push af
    ld a, [$d9a1]
    call GetUnit
    ld a, UNIT_SHIFT_RANGE
    call AddAToHL
    ld a, [hl]
    ld b, a
    pop af
    cp b
    jr z, jr_001_7076

    jp nc, Jump_001_71d2

jr_001_7076:
    ld a, [$d99e]
    ld b, a
    ld a, [$d99f]
    ld c, a
    call Call_000_0969
    inc hl
    push hl
    inc hl
    ld a, [hl]
    ld [$da85], a
    ld a, $ff
    ld [hl], a
    ld a, [$d99d]
    call Call_000_099b
    inc hl
    ld a, [hl+]
    ld [$da86], a
    ld a, [hl]
    ld [$da87], a
    pop hl
    ld a, [$da68]
    cp $03
    jr nz, jr_001_70bb

    push hl
    ld hl, $ccf1
    ld b, $16

jr_001_70a8:
    ld c, $20

jr_001_70aa:
    xor a
    ld [hl+], a
    inc hl
    inc hl
    dec c
    jr nz, jr_001_70aa

    dec b
    jr nz, jr_001_70a8

    pop hl
    ld a, $01
    ld [hl], a
    jp Jump_001_70ce


jr_001_70bb:
    ld a, $00
    ld [$d9b5], a
    ld [$d9b6], a
    ld a, $01
    ld [$d9b4], a
    call Call_001_4654
    call Call_001_450a

Jump_001_70ce:
    ld a, [$d9a3]
    ld [$da0c], a
    ld a, [$d9a4]
    ld [$da0d], a
    ld a, $04
    call Call_001_46e6
    ld a, $00
    ld [$da0b], a

Jump_001_70e4:
    ld a, [$d90d]
    ld b, a
    ld a, [$da0c]
    cp b
    jp nc, Jump_001_7198

    ld a, [$d90e]
    ld b, a
    ld a, [$da0d]
    cp b
    jp nc, Jump_001_7198

    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    cp $00
    jp z, Jump_001_7198

    dec hl
    ld a, [hl]
    inc hl
    and $0f
    cp $0b
    jr c, jr_001_7119

    cp $0e
    jr c, jr_001_7198

jr_001_7119:
    inc hl
    ld a, [hl]
    dec hl
    cp $ff
    jr nz, jr_001_7198

    inc hl
    ld a, [$d99d]
    ld b, a
    ld a, [$d90f]
    or b
    ld [hl], a
    dec hl
    ld a, [$d99d]
    ld c, a
    call Call_000_099b
    inc hl
    ld a, [$da0c]
    ld [hl+], a
    ld a, [$da0d]
    ld [hl], a
    call Call_000_1410
    ld a, [$da40]
    cp $00
    jr z, jr_001_715f

    ld a, $01
    ld [$da11], a
    ld a, [$d9a6]
    push af
    call Call_001_48bc
    pop af
    ld [$d9a6], a
    ld a, [$da40]
    ld b, a
    ld a, [$da3e]
    cp b
    jr nc, jr_001_7188

jr_001_715f:
    ld a, $00
    ld [$da11], a
    call Call_000_13b0
    ld a, [$da72]
    push af
    ld a, [$da83]
    ld b, a
    pop af
    cp b
    jr c, jr_001_7188

    ld [$da83], a
    ld a, [$da0c]
    ld [$da6c], a
    ld a, [$da0d]
    ld [$da6d], a
    ld a, [$d99d]
    ld [$da6b], a

jr_001_7188:
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    inc hl
    ld a, $ff
    ld [hl], a

Jump_001_7198:
jr_001_7198:
    ld a, [$da0b]
    cp $06
    jr nc, jr_001_71af

    ld a, [$da0b]
    call Call_001_46e6
    ld a, [$da0b]
    inc a
    ld [$da0b], a
    jp Jump_001_70e4


jr_001_71af:
    ld a, [$d99e]
    ld b, a
    ld a, [$d99f]
    ld c, a
    call Call_000_0969
    inc hl
    inc hl
    ld a, [$da85]
    ld [hl], a
    ld a, [$d99d]
    call Call_000_099b
    inc hl
    ld a, [$da86]
    ld [hl+], a
    ld a, [$da87]
    ld [hl], a
    call Call_000_1410

Jump_001_71d2:
    ret


Call_001_71d3:
    ld a, [$d9a3]
    ld b, a
    ld a, [$d9a4]
    ld c, a
    call Call_001_45c2
    cp $02
    jr c, jr_001_7253

    ld a, [$d9a5]
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_IS_AIR
    jr nz, jr_001_7209

    ld a, [$d9a1]
    call GetUnit
    ld a, UNIT_GND_RANGE
    call AddAToHL
    ld a, [hl]
    ld b, a
    dec hl
    ld a, [hl]
    cp $00
    jr nz, jr_001_721e

    ld b, $00
    jr jr_001_721e

jr_001_7209:
    ld a, [$d9a1]
    call GetUnit
    ld a, UNIT_AIR_RANGE
    call AddAToHL
    ld a, [hl]
    ld b, a
    dec hl
    ld a, [hl]
    cp $00
    jr nz, jr_001_721e

    ld b, $00

jr_001_721e:
    ld a, b
    push af
    ld a, [$d9a8]
    ld b, a
    pop af
    cp b
    jr c, jr_001_7253

    ld a, $01
    ld [$da11], a
    call Call_000_13b0
    ld a, [$da72]
    push af
    ld a, [$da83]
    ld b, a
    pop af
    cp b
    jr c, jr_001_7253

    jr z, jr_001_7253

    ld [$da83], a
    ld a, [$d99d]
    ld [$da6b], a
    ld a, [$d99e]
    ld [$da6c], a
    ld a, [$d99f]
    ld [$da6d], a

jr_001_7253:
    ret


Jump_001_7254:
    ld a, $00
    ld [$daa1], a
    ld [$da9f], a
    ld a, $08
    ld [$daa0], a

Jump_001_7261:
    ld a, [$daa1]
    ld c, a
    ld de, $d918
    call Call_000_08a1
    ld a, [de]
    cp $ff
    jp z, Jump_001_7356

    push bc
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    dec de
    call Call_000_0969
    pop bc
    ld a, [hl]
    and $0f
    push af
    ld a, [$d910]
    ld d, a
    pop af
    cp d
    jr z, jr_001_728b

    jp Jump_001_7342


jr_001_728b:
    ld a, $00
    ld [$d9b6], a
    ld [$d9b5], a
    ld a, $01
    ld [$d9b4], a
    ld hl, $d6bc
    ld c, $37

Jump_001_729d:
    ld a, c
    ld [$d99d], a
    call Call_000_099b
    ld a, [hl]
    cp $ff
    jr z, jr_001_7311

    bit 6, a
    jr nz, jr_001_7311

    inc hl
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ld e, a
    dec hl
    dec hl
    ld a, d
    and $e0
    cp $00
    jr nz, jr_001_7311

    ld a, [hl]
    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jr z, jr_001_7311

    ld a, [hl]
    and $1f
    push hl
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    pop hl
    and UNIT_ABCD
    cp UNIT_INFANTRY
    jr nz, jr_001_7311

    inc hl
    ld a, [hl+]
    and $1f
    ld [$d99e], a
    ld a, [hl+]
    and $1f
    ld [$d99f], a
    ld a, $00
    ld [$d9b6], a
    ld [$d9b5], a
    ld a, $01
    ld [$d9b4], a
    call Call_001_4654
    call Call_001_450a
    ld a, [$daa1]
    ld de, $d918
    call Call_000_08a1
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    dec de
    call Call_000_0969
    inc hl
    ld a, [hl]
    cp $00
    jr nz, jr_001_7342

Jump_001_7311:
jr_001_7311:
    ld a, [$d99d]
    ld c, a
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jp nz, Jump_001_729d

    ld a, [$da9f]
    sla a
    ld hl, $daa2
    call AddAToHL
    ld a, [$daa1]
    ld de, $d918
    call Call_000_08a1
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [$da9f]
    inc a
    ld [$da9f], a

Jump_001_7342:
jr_001_7342:
    ld a, [$daa1]
    inc a
    inc a
    ld [$daa1], a
    ld a, [$daa0]
    dec a
    ld [$daa0], a
    cp $00
    jp nz, Jump_001_7261

Jump_001_7356:
    ld a, [$da9f]
    sla a
    ld hl, $daa2
    call AddAToHL
    ld a, $ff
    ld [hl], a
    ld [$da41], a
    call Call_001_607e
    ret


data_001_736b:
    db $10, $10, $01, $00, $00, $00, $00, $00

Jump_001_7373:
    ld hl, $d6bc
    ld c, $37

Jump_001_7378:
    ld a, c
    call Call_000_099b
    ld a, [hl]
    cp $ff
    jr z, jr_001_73b0

    bit 6, a
    jr nz, jr_001_73b0

    ld a, [hl]
    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jr nz, jr_001_73b0

    inc hl
    ld a, [hl]
    dec hl
    and $e0
    jp Jump_001_7df5


    nop

Jump_001_7398:
    push hl
    ld a, c
    ld hl, $d928
    call AddAToHL
    ld a, [hl]
    pop hl
    cp $00
    jr nz, jr_001_73b0

    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    cp $06
    jr c, jr_001_73c2

Jump_001_73b0:
jr_001_73b0:
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jp nz, Jump_001_7378

    call Call_001_607e
    jp Jump_001_75b2


jr_001_73c2:
    ld a, c
    ld [$d99d], a
    call Call_000_099b
    ld a, [hl+]
    and $1f
    ld [$d9a1], a
    ld a, [hl+]
    and $1f
    ld [$d99e], a
    ld a, [hl]
    and $1f
    ld [$d99f], a
    ld a, $ff
    ld [$dab3], a
    ld c, $00

jr_001_73e2:
    ld a, c
    sla a
    ld hl, $daa2
    call AddAToHL
    ld a, [hl]
    cp $ff
    jr z, jr_001_7430

    push bc
    ld a, [hl+]
    ld b, a
    ld a, [hl-]
    ld c, a
    push hl
    call Call_000_0969
    ld a, [hl]
    pop hl
    pop bc
    and $0f
    push af
    ld a, [$d910]
    ld b, a
    pop af
    cp b
    jr nz, jr_001_742a

    push bc
    ld a, [hl+]
    ld b, a
    ld a, [hl-]
    ld c, a
    push hl
    call Call_001_45c2
    pop hl
    pop bc
    push af
    ld a, [$dab3]
    ld b, a
    pop af
    cp b
    jr nc, jr_001_742a

    ld [$dab3], a
    ld a, c
    ld [$dab4], a
    ld a, [hl+]
    ld [$da04], a
    ld a, [hl-]
    ld [$da05], a

jr_001_742a:
    inc c
    ld a, c
    cp $08
    jr nz, jr_001_73e2

jr_001_7430:
    ld a, [$dab3]
    cp $ff
    jr nz, jr_001_743a

jr_001_7437:
    jp Jump_001_75a5


jr_001_743a:
    ld a, [$d99d]
    call Call_000_099b
    ld a, [hl+]
    ld b, a
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    cp $04
    jr c, jr_001_7460

    ld a, b
    and $1f
    call GetUnit
    ld a, UNIT_SHIFT_RANGE
    call AddAToHL
    ld a, [hl]
    push af
    ld a, [$dab3]
    ld b, a
    pop af
    cp b
    jr c, jr_001_7437

jr_001_7460:
    call Call_001_4719
    ld a, [$da04]
    ld b, a
    ld a, [$da05]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    cp $00
    jr z, jr_001_7437

    srl a
    srl a
    srl a
    srl a
    ld b, a
    ld a, [$d9b4]
    sub b
    ld [$d9a8], a
    cp $00
    jp z, Jump_001_7580

    ld de, data_001_736b
    ld a, [$d99d]
    call Call_000_099b
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    dec a
    call Call_000_08a1
    ld a, [de]
    push af
    ld a, [$d9a8]
    ld b, a
    pop af
    cp b
    jr c, jr_001_7437

    ld a, [$da04]
    ld [$d9a3], a
    ld a, [$da05]
    ld [$d9a4], a
    call Call_001_4b9a
    ld a, [$da0c]
    ld [$da04], a
    ld a, [$da0d]
    ld [$da05], a
    ld a, $01
    ld [$da0e], a
    ld a, $0a
    ld [$da40], a
    ld a, $00
    ld [$da11], a
    call Call_001_4d62
    cp $00
    jp z, Jump_001_7580

    ld a, $01
    ld [$da0a], a

Jump_001_74dd:
    ld a, $04
    call Call_001_46e6
    ld a, $00
    ld [$da0b], a
    ld a, $ff
    ld [$da08], a
    ld a, $f0
    ld [$da07], a

jr_001_74f1:
    ld a, [$da0a]
    ld [$da09], a

jr_001_74f7:
    ld a, [$d90e]
    ld b, a
    ld a, [$da0d]
    cp b
    jr nc, jr_001_754f

    ld a, [$d90d]
    ld b, a
    ld a, [$da0c]
    cp b
    jr nc, jr_001_754f

    call Call_001_4d62
    cp $01
    jr z, jr_001_754f

    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    and $f0
    push af
    ld a, [$da07]
    ld b, a
    pop af
    cp b
    jr z, jr_001_7531

    jr nc, jr_001_754f

    ld [$da07], a
    jr jr_001_753d

jr_001_7531:
    ld a, [hl]
    and $0f
    push af
    ld a, [$da08]
    ld b, a
    pop af
    cp b
    jr nc, jr_001_754f

jr_001_753d:
    ld a, [hl]
    and $0f
    ld [$da08], a
    ld a, [$da0c]
    ld [$da04], a
    ld a, [$da0d]
    ld [$da05], a

jr_001_754f:
    ld a, [$da0b]
    call Call_001_46e6
    ld a, [$da09]
    dec a
    ld [$da09], a
    cp $00
    jr nz, jr_001_74f7

    ld a, [$da0b]
    inc a
    ld [$da0b], a
    cp $06
    jr c, jr_001_74f1

    ld a, [$da08]
    cp $80
    jr c, jr_001_7580

    ld a, [$da0a]
    inc a
    ld [$da0a], a
    cp $09
    jp c, Jump_001_74dd

    jr jr_001_75a5

Jump_001_7580:
jr_001_7580:
    ld a, $00
    ld [$da41], a
    ld a, [$da04]
    ld [$da42], a
    ld a, [$da05]
    ld [$da43], a
    ld a, $ff
    ld [$da44], a
    ld a, [$d99d]
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    or $08
    ld [de], a
    jr jr_001_75b7

Jump_001_75a5:
jr_001_75a5:
    ld a, [$d99d]
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    or $80
    ld [de], a

Jump_001_75b2:
    ld a, $ff
    ld [$da41], a

jr_001_75b7:
    ret


Jump_001_75b8:
    ld a, $00
    ld [$da83], a
    ld hl, $d6bc
    ld c, $37

Jump_001_75c2:
    ld a, [hl]
    cp $ff
    jr z, jr_001_762b

    bit 6, a
    jr nz, jr_001_762b

    inc hl
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ld e, a
    dec hl
    dec hl
    ld a, d
    and $e0
    cp $00
    jr nz, jr_001_762b

    ld a, [hl]
    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jr nz, jr_001_762b

    ld a, [hl]
    and $1f
    push hl
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    pop hl
    bit UNIT_0_F, a
    jr z, jr_001_762b

    bit UNIT_HAS_INDIR_F, a
    jr z, jr_001_762b

    ld a, c
    ld [$d99d], a
    inc hl
    ld a, [hl+]
    and $1f
    ld [$da0c], a
    ld a, [hl]
    and $1f
    ld [$da0d], a
    dec hl
    dec hl
    ld a, $80
    ld [$da11], a
    push bc
    push hl
    call Call_001_48bc
    pop hl
    pop bc
    ld a, [$da3e]
    push af
    ld a, [$da83]
    ld b, a
    pop af
    cp b
    jr c, jr_001_762b

    ld [$da83], a
    ld a, c
    ld [$dab6], a

jr_001_762b:
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jp nz, Jump_001_75c2

    ld a, [$da83]
    cp $00
    jr nz, jr_001_7642

    call Call_001_793e
    ret


jr_001_7642:
    call Call_001_76db
    ret


Jump_001_7646:
    ld a, $ff
    ld [$dab7], a
    ld hl, $d6bc
    ld c, $37

Jump_001_7650:
    ld a, [hl]
    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jr nz, jr_001_76c0

    ld a, [hl]
    cp $ff
    jr z, jr_001_76c0

    ld a, c
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    and $07
    cp $01
    jr nz, jr_001_76c0

    ld a, c
    ld [$d99d], a
    inc hl
    ld a, [hl+]
    and $1f
    ld [$da0c], a
    ld a, [hl]
    and $1f
    ld [$da0d], a
    dec hl
    dec hl
    ld a, $80
    ld [$da11], a
    push bc
    push hl
    call Call_001_48bc
    pop hl
    pop bc
    ld a, [$da3e]
    cp $0b
    jr nc, jr_001_76a0

    ld a, c
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    or $80
    ld [de], a
    jr jr_001_76c0

jr_001_76a0:
    ld a, c
    ld de, $d960
    call Call_000_08a1
    ld a, [de]
    srl a
    srl a
    srl a
    srl a
    push af
    ld a, [$dab7]
    ld b, a
    pop af
    cp b
    jr nc, jr_001_76c0

    ld [$dab7], a
    ld a, c
    ld [$dab6], a

jr_001_76c0:
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jp nz, Jump_001_7650

    ld a, [$dab7]
    cp $ff
    jr nz, jr_001_76d7

    call Call_001_793e
    ret


jr_001_76d7:
    call Call_001_76db
    ret


Call_001_76db:
    ld a, [$dab6]
    call Call_000_099b
    inc hl
    ld a, [hl+]
    ld [$dab8], a
    ld a, [hl]
    ld [$dab9], a
    ld a, $ff
    ld [$dab3], a
    ld hl, $d6bc
    ld c, $37

Jump_001_76f4:
    ld a, [hl]
    cp $ff
    jr z, jr_001_775d

    bit 6, a
    jr nz, jr_001_775d

    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    bit 6, a
    jr nz, jr_001_775d

    bit 5, a
    jr nz, jr_001_775d

    inc hl
    ld a, [hl]
    dec hl
    and $e0
    cp $00
    jr nz, jr_001_775d

    ld a, [hl]
    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jr nz, jr_001_775d

    ld a, c
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    cp $00
    jr nz, jr_001_775d

    ld a, [$dab6]
    cp c
    jr z, jr_001_775d

    inc hl
    ld a, [hl+]
    and $1f
    ld [$d99e], a
    ld a, [hl]
    and $1f
    ld [$d99f], a
    dec hl
    dec hl
    push bc
    push hl
    ld a, [$dab8]
    ld b, a
    ld a, [$dab9]
    ld c, a
    call Call_001_45c2
    pop hl
    pop bc
    push af
    ld a, [$dab3]
    ld b, a
    pop af
    cp b
    jr nc, jr_001_775d

    ld [$dab3], a
    ld a, c
    ld [$dab4], a

jr_001_775d:
    ld a, $06
    call Call_000_0896
    dec c
    ld a, c
    cp $ff
    jp nz, Jump_001_76f4

    ld a, [$dab3]
    cp $ff
    jr nz, jr_001_7774

    call Call_001_793e
    ret


jr_001_7774:
    ld a, $ff
    ld [$da3e], a
    ld a, [$dab4]
    ld [$d99d], a
    ld [$daba], a
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $1f
    ld [$d99e], a
    ld [$dabb], a
    ld a, [hl]
    and $1f
    ld [$d99f], a
    ld [$dabc], a
    ld a, $00
    ld [$d9b5], a
    ld [$d9b6], a
    ld a, $01
    ld [$d9b4], a
    call Call_001_4654
    call Call_001_450a
    ld a, [$dabb]
    ld b, a
    ld a, [$dabc]
    ld c, a
    call Call_000_0969
    inc hl
    inc hl
    ld a, $ff
    ld [hl], a
    ld a, [$dab8]
    ld [$da0c], a
    ld a, [$dab9]
    ld [$da0d], a
    ld a, [$dab6]
    ld [$d99d], a
    ld a, $ff
    ld [$da3f], a
    ld a, $01
    ld [$da0a], a

Jump_001_77d7:
    ld a, $04
    call Call_001_46e6
    ld a, $00
    ld [$da0b], a

Jump_001_77e1:
    ld a, [$da0a]
    ld [$da09], a

Jump_001_77e7:
    ld a, [$daba]
    ld c, a
    call Call_000_099b
    ld a, [$d90e]
    ld b, a
    ld a, [$da0d]
    cp b
    jp nc, Jump_001_7893

    inc hl
    inc hl
    ld a, [$da0d]
    ld [hl], a
    dec hl
    dec hl
    ld a, [$d90d]
    ld b, a
    ld a, [$da0c]
    cp b
    jp nc, Jump_001_7893

    inc hl
    ld a, [$da0c]
    ld [hl], a
    dec hl
    push bc
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    pop bc
    ld a, [hl]
    cp $00
    jr z, jr_001_7893

    dec hl
    ld a, [hl]
    and $0f
    cp $0b
    jr c, jr_001_7831

    cp $0e
    jr c, jr_001_7893

jr_001_7831:
    inc hl
    inc hl
    ld a, [hl]
    cp $ff
    jr nz, jr_001_7893

    ld a, [$d90f]
    ld b, a
    ld a, [$daba]
    or b
    ld [hl], a
    call Call_000_1410
    ld a, [$da0c]
    push af
    ld a, [$da0d]
    push af
    ld a, [$dab8]
    ld [$da0c], a
    ld a, [$dab9]
    ld [$da0d], a
    ld a, $80
    ld [$da11], a
    call Call_001_48bc
    pop af
    ld [$da0d], a
    pop af
    ld [$da0c], a
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    inc hl
    ld a, $ff
    ld [hl], a
    ld a, [$da3e]
    push af
    ld a, [$da3f]
    ld b, a
    pop af
    cp b
    jr nc, jr_001_7893

    ld [$da3f], a
    ld a, [$da0c]
    ld [$da04], a
    ld a, [$da0d]
    ld [$da05], a

Jump_001_7893:
jr_001_7893:
    ld a, [$da0b]
    call Call_001_46e6
    ld a, [$da09]
    dec a
    ld [$da09], a
    cp $00
    jp nz, Jump_001_77e7

    ld a, [$da0b]
    inc a
    ld [$da0b], a
    cp $06
    jp c, Jump_001_77e1

    ld a, [$da0a]
    inc a
    ld [$da0a], a
    cp $04
    jp c, Jump_001_77d7

    ld a, [$daba]
    call Call_000_099b
    inc hl
    ld a, [$dabb]
    ld [hl+], a
    ld a, [$dabc]
    ld [hl], a
    ld a, [$dabb]
    ld b, a
    ld a, [$dabc]
    ld c, a
    call Call_000_0969
    inc hl
    inc hl
    ld a, [$daba]
    ld b, a
    ld a, [$d90f]
    or b
    ld [hl], a
    call Call_000_1410
    ld a, [$da3f]
    cp $ff
    jr nz, jr_001_7900

    ld a, [$daba]
    ld de, $d928
    call Call_000_08a1
    ld a, [de]
    or $80
    ld [de], a
    ld a, $ff
    ld [$da41], a
    jr jr_001_793d

jr_001_7900:
    ld de, $da41
    ld a, [$daba]
    ld [$d99d], a
    ld a, [$da04]
    ld b, a
    ld a, [$dabb]
    cp b
    jr nz, jr_001_791d

    ld a, [$da05]
    ld b, a
    ld a, [$dabc]
    cp b
    jr z, jr_001_792b

jr_001_791d:
    ld a, $00
    ld [de], a
    inc de
    ld a, [$da04]
    ld [de], a
    inc de
    ld a, [$da05]
    ld [de], a
    inc de

jr_001_792b:
    ld a, $ff
    ld [de], a
    ld a, [$d99d]
    ld hl, $d928
    call AddAToHL
    ld a, [hl]
    or $08
    ld [hl], a
    jr jr_001_793d

jr_001_793d:
    ret


Call_001_793e:
    call Call_001_607e
    ld a, $ff
    ld [$da41], a
    ret


Jump_001_7947:
    ld a, [$d999]
    bit 7, a
    jr nz, jr_001_7951

jr_001_794e:
    jp Jump_001_7a01


jr_001_7951:
    ld de, $d914
    ld a, [$d90f]
    cp $00
    jr nz, jr_001_795e

    ld de, $d916

jr_001_795e:
    ld a, [de]
    ld [$d99e], a
    ld b, a
    inc de
    ld a, [de]
    ld [$d99f], a
    ld c, a
    call Call_000_0969
    inc hl
    inc hl
    ld a, [hl]
    cp $ff
    jr z, jr_001_794e

    and $3f
    ld [$d99d], a
    call Call_000_099b
    ld a, [hl]
    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jr nz, jr_001_7a01

    ld a, [hl]
    bit 6, a
    jr nz, jr_001_7a01

    ld a, $00
    ld [$d9b6], a
    ld [$d9b5], a
    ld a, $01
    ld [$d9b4], a
    call Call_001_4654
    call Call_001_450a
    ld a, [$d99e]
    ld [$da0c], a
    ld a, [$d99f]
    ld [$da0d], a
    call Call_001_525e
    ld a, $06
    ld [$da60], a

jr_001_79b1:
    call Call_001_526e
    cp $01
    jr z, jr_001_79cf

    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    cp $00
    jr z, jr_001_79cf

    inc hl
    ld a, [hl]
    cp $ff
    jr z, jr_001_79dc

jr_001_79cf:
    ld a, [$da60]
    dec a
    ld [$da60], a
    cp $00
    jr nz, jr_001_79b1

    jr jr_001_7a01

jr_001_79dc:
    ld a, $00
    ld [$da41], a
    ld a, [$da0c]
    ld [$da42], a
    ld a, [$da0d]
    ld [$da43], a
    ld a, $ff
    ld [$da44], a
    ld a, [$d99d]
    ld hl, $d928
    call AddAToHL
    ld a, [hl]
    or $08
    ld [hl], a
    jr jr_001_7a09

Jump_001_7a01:
jr_001_7a01:
    call Call_001_607e
    ld a, $ff
    ld [$da41], a

jr_001_7a09:
    ret


Jump_001_7a0a:
    ld a, [$d99b]
    sla a
    ld de, $d918
    call Call_000_08a1
    ld a, [de]
    cp $ff
    jp z, Jump_001_7d70

    ld [$daa2], a
    ld b, a
    inc de
    ld a, [de]
    ld [$dab2], a
    ld c, a
    call Call_000_0969
    ld a, [hl]
    and $0f
    push af
    ld a, [$d910]
    ld b, a
    pop af
    cp b
    jp nz, Jump_001_7d62

    ld a, [$d99b]
    inc a
    ld [$dab3], a
    call Call_001_7d8e
    ld a, [$dac0]
    cp $80
    jr c, jr_001_7a49

jr_001_7a46:
    jp Jump_001_7d62


Jump_001_7a49:
jr_001_7a49:
    ld de, $dac0
    ld c, $00

jr_001_7a4e:
    ld a, [de]
    ld b, a
    cp $ff
    jr z, jr_001_7a46

    call Call_000_099b
    ld a, [hl]
    bit 6, a
    jr nz, jr_001_7a68

    ld a, b
    ld hl, $d928
    call AddAToHL
    ld a, [hl]
    cp $80
    jr c, jr_001_7a6c

jr_001_7a68:
    inc c
    inc de
    jr jr_001_7a4e

jr_001_7a6c:
    ld a, c
    ld [$dabe], a
    ld a, [de]
    ld b, a
    ld [$d99d], a
    call Call_000_099b
    ld a, [hl]
    and $1f
    ld [$d9a1], a
    ld a, $00
    ld [$dabf], a
    ld a, [$daa2]
    ld [$da0c], a
    ld a, [$dab2]
    ld [$da0d], a
    ld a, $04
    call Call_001_46e6
    ld a, $00
    ld [$da0b], a

Jump_001_7a99:
    ld a, [$d90e]
    ld b, a
    ld a, [$da0d]
    cp b
    jr nc, jr_001_7aad

    ld a, [$d90d]
    ld b, a
    ld a, [$da0c]
    cp b
    jr c, jr_001_7ab0

jr_001_7aad:
    jp Jump_001_7b2f


jr_001_7ab0:
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    and $0f
    cp $02
    jr nc, jr_001_7b2f

    inc hl
    inc hl
    ld a, [hl]
    cp $ff
    jr z, jr_001_7b47

    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jr nz, jr_001_7b2f

    ld a, [hl]
    and $3f
    ld c, a
    call Call_000_099b
    inc hl
    inc hl
    ld a, [hl]
    and $60
    cp $20
    jr z, jr_001_7b2f

    dec hl
    dec hl
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_CAN_CARRY
    cp $00
    jr z, jr_001_7b2f

    ld a, [$d9a1]
    ld b, a
    ld a, [hl]
    and $01
    cp $00
    jr nz, jr_001_7b18

    ld a, b
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_INFANTRY
    cp $00
    jr z, jr_001_7b2f

    ld a, $01
    ld [$dabf], a
    jr jr_001_7b47

jr_001_7b18:
    ld a, b
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_IS_AIR
    cp $00
    jr nz, jr_001_7b2f

    ld a, $01
    ld [$dabf], a
    jr jr_001_7b47

Jump_001_7b2f:
jr_001_7b2f:
    ld a, [$da0b]
    cp $06
    jp nc, Jump_001_7d52

    ld a, [$da0b]
    call Call_001_46e6
    ld a, [$da0b]
    inc a
    ld [$da0b], a
    jp Jump_001_7a99


jr_001_7b47:
    ld a, [$da0c]
    ld [$da04], a
    ld a, [$da0d]
    ld [$da05], a
    jp Jump_001_7d1b


    ld a, [$d9a1]
    call GetUnit
    ld a, UNIT_SHIFT_RANGE
    call AddAToHL
    ld a, [hl]
    cp $00
    jr z, jr_001_7b69

Jump_001_7b66:
jr_001_7b66:
    jp Jump_001_7d1b


jr_001_7b69:
    ld a, [$dabf]
    cp $00
    jr nz, jr_001_7b66

    ld a, [$d9a1]
    cp $11
    jp nz, Jump_001_7bfa

    ld a, [$da04]
    ld [$da0c], a
    ld a, [$da05]
    ld [$da0d], a
    call Call_001_525e
    ld c, $06

jr_001_7b89:
    call Call_001_526e
    dec c
    jr nz, jr_001_7b89

    ld c, $78
    ld a, $00
    ld [$da60], a

jr_001_7b96:
    call Call_001_526e
    cp $01
    jr z, jr_001_7bbd

    push bc
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    pop bc
    inc hl
    inc hl
    ld a, [hl]
    and $80
    ld d, a
    ld a, [$d90f]
    cp d
    jr z, jr_001_7bbd

    ld a, [$da60]
    inc a
    ld [$da60], a

jr_001_7bbd:
    dec c
    ld a, c
    cp $00
    jr nz, jr_001_7b96

    ld a, [$da60]
    cp $04
    jr nc, jr_001_7b66

    ld a, [$d998]
    cp $00
    jr z, jr_001_7c15

    ld de, $d914
    ld a, [$d90f]
    cp $00
    jr z, jr_001_7bde

    ld de, $d916

jr_001_7bde:
    ld a, [de]
    ld [$d99e], a
    inc de
    ld a, [de]
    ld [$d99f], a
    ld a, [$daa2]
    ld b, a
    ld a, [$dab2]
    ld c, a
    call Call_001_45c2
    cp $09
    jp c, Jump_001_7b66

    jp Jump_001_7c15


Jump_001_7bfa:
    ld a, [$d9a1]
    cp $00
    jr nz, jr_001_7c15

    ld a, [$da04]
    ld [$da0c], a
    ld a, [$da05]
    ld [$da0d], a
    call Call_001_6a9c
    cp $00
    jp z, Jump_001_7d1b

Jump_001_7c15:
jr_001_7c15:
    ld c, $00
    ld de, $dac0

Jump_001_7c1a:
    ld a, [de]
    ld b, a
    cp $ff
    jr z, jr_001_7c58

    ld hl, $d928
    call AddAToHL
    ld a, [hl]
    cp $80
    jr nc, jr_001_7c48

    ld a, b
    call Call_000_099b
    ld a, [hl]
    and $40
    cp $00
    jr nz, jr_001_7c48

    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_CAN_CARRY
    cp $00
    jr nz, jr_001_7c4d

jr_001_7c48:
    inc c
    inc de
    jp Jump_001_7c1a


jr_001_7c4d:
    ld a, c
    ld [$dabe], a
    ld a, [de]
    ld [$d99d], a
    jp Jump_001_7d1b


jr_001_7c58:
    ld a, [$daa2]
    ld [$da0c], a
    ld a, [$dab2]
    ld [$da0d], a
    call Call_001_525e
    ld a, $06
    ld [$dab5], a
    ld c, $ff

Jump_001_7c6e:
    push bc
    call Call_001_526e
    pop bc
    cp $01
    jr z, jr_001_7cec

    push bc
    ld a, [$da0c]
    ld b, a
    ld a, [$da0d]
    ld c, a
    call Call_000_0969
    pop bc
    ld a, [hl]
    and $0f
    cp $02
    jr nc, jr_001_7cec

    inc hl
    inc hl
    ld a, [hl]
    and $3f
    ld c, a
    call Call_000_099b
    ld a, [hl]
    and $80
    ld b, a
    ld a, [$d90f]
    cp b
    jr nz, jr_001_7cec

    inc hl
    inc hl
    ld a, [hl]
    and $20
    cp $00
    jr nz, jr_001_7cec

    dec hl
    dec hl
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_CAN_CARRY
    cp $00
    jr z, jr_001_7cec

    ld a, [hl]
    and $01
    cp $00
    jr nz, jr_001_7cd7

    ld a, [$d9a1]
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_INFANTRY
    cp $00
    jr z, jr_001_7cec

    jp Jump_001_7cfb


jr_001_7cd7:
    ld a, [$d9a1]
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_IS_AIR
    cp $00
    jr nz, jr_001_7cec

    jp Jump_001_7cfb


jr_001_7cec:
    ld a, [$dab5]
    dec a
    ld [$dab5], a
    cp $00
    jp nz, Jump_001_7c6e

    jp Jump_001_7d0a


Jump_001_7cfb:
    ld a, [$da0c]
    ld [$da04], a
    ld a, [$da0d]
    ld [$da05], a
    jp Jump_001_7d1b


Jump_001_7d0a:
    ld a, c
    cp $ff
    jr z, jr_001_7d7b

    ld hl, $d928
    call AddAToHL
    ld a, [hl]
    or $80
    ld [hl], a
    jr jr_001_7d7b

Jump_001_7d1b:
    ld a, [$d99d]
    ld hl, $d928
    call AddAToHL
    ld a, [hl]
    or $08
    ld [hl], a
    ld a, $06
    ld [$da41], a
    ld a, [$daa2]
    ld [$da42], a
    ld a, [$dab2]
    ld [$da43], a
    ld a, [$dabe]
    ld [$da44], a
    ld a, [$da04]
    ld [$da45], a
    ld a, [$da05]
    ld [$da46], a
    ld a, $ff
    ld [$da47], a
    jr jr_001_7d7b

Jump_001_7d52:
    ld a, [$d99d]
    ld hl, $d928
    call AddAToHL
    ld a, [hl]
    or $80
    ld [hl], a
    jp Jump_001_7a49


Jump_001_7d62:
    ld a, [$d99b]
    inc a
    ld [$d99b], a
    cp $08
    jr nc, jr_001_7d70

    jp Jump_001_7a0a


Jump_001_7d70:
jr_001_7d70:
    call Call_001_607e
    ld a, $ff
    ld [$da41], a
    ld [$d99d], a

jr_001_7d7b:
    ret


Call_001_7d7c:
    ld a, $ff
    ld [$dac0], a
    call Call_001_7dcf
    ld [$dab3], a
    cp $ff
    ret z

    call Call_001_7d8e
    ret


Call_001_7d8e:
    ld b, $00
    ld hl, $d572
    ld c, $00
    ld de, $dac0

Jump_001_7d98:
    ld a, [hl]
    cp $ff
    jr z, jr_001_7dbf

    inc hl
    ld a, [hl]
    dec hl
    and $e0
    cp $00
    jr z, jr_001_7dbf

    srl a
    srl a
    srl a
    srl a
    srl a
    push bc
    push af
    ld a, [$dab3]
    ld b, a
    pop af
    cp b
    pop bc
    jr nz, jr_001_7dbf

    ld a, b
    ld [de], a
    inc de
    inc c

jr_001_7dbf:
    ld a, $06
    call AddAToHL
    inc b
    ld a, b
    cp $38
    jp c, Jump_001_7d98

    ld a, $ff
    ld [de], a
    ret


Call_001_7dcf:
    ld hl, $d918
    ld c, $00

jr_001_7dd4:
    ld a, [$d99e]
    ld b, a
    ld a, [hl]
    cp b
    jr nz, jr_001_7de6

    ld a, [$d99f]
    ld b, a
    inc hl
    ld a, [hl]
    dec hl
    cp b
    jr z, jr_001_7df0

jr_001_7de6:
    inc hl
    inc hl
    inc c
    ld a, c
    cp $07
    jr nz, jr_001_7dd4

    jr jr_001_7df2

jr_001_7df0:
    ld a, c
    ret


jr_001_7df2:
    ld a, $ff
    ret


Jump_001_7df5:
    cp $00
    jp nz, Jump_001_73b0

    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    bit 6, a
    jp nz, Jump_001_73b0

    jp Jump_001_7398


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
