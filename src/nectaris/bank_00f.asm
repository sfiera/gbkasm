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
INCLUDE "nectaris/audio.inc"
INCLUDE "nectaris/map.inc"
INCLUDE "nectaris/text.inc"
INCLUDE "nectaris/units.inc"

DEF JP_U16 EQU $c3

SECTION "ROM Bank $00f", ROMX

Call_00f_4000::
    ld a, $00
    ld [$d86d], a

    ld hl, WRAMTimerOverflowInterrupt
    ld de, LCDCInterrupt
    ld a, JP_U16
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a

    ; hl = WRAMSerialTransferInterrupt
    ld a, JP_U16
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a

    ; hl = WRAMVBlankInterrupt
    ld de, Call_000_05e3
    ld a, JP_U16
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a

    call Call_000_07cd
    ld a, $0a
    ld [$0000], a
    ld a, $03
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $00
    ld [$d6d4], a
    ld [$d6d5], a
    ld [$d7a6], a
    ld a, $00
    ldh [rSCX], a
    ld a, $00
    ldh [rSCY], a
    ld a, $01
    ldh [rIE], a
    ld a, %00011011
    ldh [rBGP], a
    ld a, %01101111
    ldh [rOBP0], a
    ldh [rOBP1], a
    ld a, $00
    ld [$db1b], a
    ld a, $01
    ld [$d6d3], a
    xor a
    ld [$d79a], a
    ld [$d79f], a
    ld [$d7a0], a
    ld [$d7a2], a
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    ld [$d7a8], a
    ld [$db18], a
    ld [$d878], a
    ld [$d879], a
    ld a, $ff
    ld [$db08], a
    call Call_000_0927
    call Call_000_0933
    ret


Call_00f_408c::
    ld a, $b4
    ld hl, $c1a0
    ld bc, $0b40
    call Call_000_080f
    ld de, $ccf0
    ld hl, $c1a0
    ld a, [$d79c]
    ld b, $0a
    cp $0f
    jr c, jr_00f_40a8

    ld b, $14

jr_00f_40a8:
    ld a, b

Jump_00f_40a9:
    push af
    push de
    push hl
    ld a, [$d79b]

jr_00f_40af:
    push af
    ld a, [de]
    call Call_00f_40df
    pop af
    push af
    and $01
    jr z, jr_00f_40c1

    ld a, $3e
    call SubAFromHL
    jr jr_00f_40c6

jr_00f_40c1:
    ld a, $42
    call AddAToHL

jr_00f_40c6:
    pop af
    inc de
    inc de
    inc de
    dec a
    jr nz, jr_00f_40af

    pop hl
    ld a, $80
    call AddAToHL
    pop de
    ld a, $60
    call AddAToDE
    pop af
    dec a
    jp nz, Jump_00f_40a9

    ret


Call_00f_40df:
    push af
    push bc
    push hl
    ld c, a
    and $0f
    cp $07
    jr c, jr_00f_40ef

    dec a
    cp $08
    jr c, jr_00f_40ef

    dec a

jr_00f_40ef:
    sla a
    sla a
    inc a
    xor $80
    ld [hl+], a
    inc a
    ld [hl-], a
    inc a
    push af
    ld a, $40
    call AddAToHL
    pop af
    ld [hl+], a
    inc a
    ld [hl], a
    ld a, c
    bit 5, a
    jr z, jr_00f_4111

    ld a, $b2
    ld b, a
    ld a, [$db1b]
    add b
    ld [hl], a

jr_00f_4111:
    pop hl
    pop bc
    pop af
    ret


Call_00f_4115::
    call Call_000_15b0
    call Call_000_346f
    ld a, b
    cp c
    jr c, jr_00f_4177

    ld e, $00
    ld a, [$d7bf]
    cp $00
    jr z, jr_00f_4130

    call Call_000_346f
    ld a, c
    cp $01
    jr nz, jr_00f_4148

jr_00f_4130:
    call Call_000_346f
    ld a, c
    cp $00
    jr z, jr_00f_4148

    ld a, [$d7c3]
    call Call_000_099b
    call Call_000_1330
    call Call_000_15f0
    call Call_000_1d35
    ld e, a

jr_00f_4148:
    push de
    ld a, [$d7bf]
    cp $00
    jr z, jr_00f_415a

    call Call_000_346f
    ld a, b
    cp $01
    ld a, $00
    jr nz, jr_00f_4173

jr_00f_415a:
    call Call_000_346f
    ld a, b
    cp $00
    ld a, $00
    jr z, jr_00f_4173

    ld a, [$d7c3]
    call Call_000_099b
    call Call_000_1350
    call Call_000_15f0
    call Call_000_1d55

jr_00f_4173:
    pop de
    jp Jump_00f_41cf


jr_00f_4177:
    ld e, $00
    ld a, [$d7bf]
    cp $00
    jr z, jr_00f_4188

    call Call_000_346f
    ld a, b
    cp $01
    jr nz, jr_00f_41a0

jr_00f_4188:
    call Call_000_346f
    ld a, b
    cp $00
    jr z, jr_00f_41a0

    ld a, [$d7c3]
    call Call_000_099b
    call Call_000_1350
    call Call_000_15f0
    call Call_000_1d55
    ld e, a

jr_00f_41a0:
    push de
    ld a, [$d7bf]
    cp $00
    jr z, jr_00f_41b2

    call Call_000_346f
    ld a, c
    cp $01
    ld a, $00
    jr nz, jr_00f_41cb

jr_00f_41b2:
    call Call_000_346f
    ld a, c
    cp $00
    ld a, $00
    jr z, jr_00f_41cb

    ld a, [$d7c3]
    call Call_000_099b
    call Call_000_1330
    call Call_000_15f0
    call Call_000_1d35

jr_00f_41cb:
    pop de
    jp Jump_00f_41cf


Jump_00f_41cf:
    add e
    cp $00
    jr z, jr_00f_41d7

    ld a, $01
    ret


jr_00f_41d7:
    ld a, $00
    ret


Call_00f_41da::
    ld a, [hl]
    push hl
    and $1f
    call GetUnit
    ld a, UNIT_AIR_RANGE
    call AddAToHL
    ld a, [hl]
    inc a
    ld [$d874], a
    ld a, $01
    ld [$d7be], a
    pop hl
    jp Jump_00f_420e


Call_00f_41f4::
    ld a, [hl]
    push hl
    and $1f
    call GetUnit
    ld a, UNIT_GND_RANGE
    call AddAToHL
    ld a, [hl]
    inc a
    ld [$d874], a
    ld a, $00
    ld [$d7be], a
    pop hl
    jp Jump_00f_420e


Jump_00f_420e:
    ld a, [hl+]
    ld [$d7b9], a
    ld a, [hl+]
    and $1f
    ld b, a
    ld a, [hl+]
    and $1f
    ld c, a
    ld a, [hl+]
    ld [$d7bb], a
    inc hl
    ld a, [hl]
    ld [$d7ba], a
    push af
    push bc
    push de
    push hl
    call Call_000_1630
    call Call_000_1570
    ld a, $fc
    call Call_000_1670
    pop hl
    pop de
    pop bc
    pop af
    call Call_000_0969
    inc hl
    ld a, [$d874]
    ld [hl], a
    ld e, a
    jp Jump_000_15d0


Call_00f_4242::
    ld hl, $ccf0
    ld bc, $02c0

jr_00f_4248:
    ld a, [hl]
    cp $ff
    jr z, jr_00f_4254

    inc hl
    inc hl
    ld a, $01
    ld [hl+], a
    jr jr_00f_4257

jr_00f_4254:
    inc hl
    inc hl
    inc hl

jr_00f_4257:
    dec bc
    ld a, c
    or b
    jr nz, jr_00f_4248

    ret


Call_00f_425d::
    ld a, $02
    ld [$d86f], a
    jr jr_00f_426b


Call_00f_4264::
    ld a, $01
    ld [$d86f], a
    jr jr_00f_426b

jr_00f_426b:
    ld a, [$d90f]
    ld d, a
    ld e, $00
    ld b, $38
    ld hl, $d572

Jump_00f_4276:
    ld a, [hl]
    cp $ff
    jp z, Jump_00f_430f

    and $80
    cp d
    jp z, Jump_00f_430f

    inc hl
    ld a, [hl]
    dec hl
    and $e0
    cp $00
    jp nz, Jump_00f_430f

    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    bit 6, a
    jp nz, Jump_00f_430f

    push bc
    push de
    push hl
    inc hl
    ld a, [hl+]
    and $1f
    ld b, a
    ld a, [hl+]
    and $1f
    ld c, a
    call Call_000_0969
    ld a, [hl]
    bit 5, a
    jr z, jr_00f_430c

    pop hl
    pop de
    pop bc
    push bc
    push de
    push hl
    ld a, [hl]
    and $3f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    bit UNIT_IS_AIR_F, a
    jr nz, jr_00f_42c9

    ld a, [$d86f]
    bit 0, a
    jr z, jr_00f_430c

    jr jr_00f_42d2

jr_00f_42c9:
    ld a, [$d86f]
    bit 1, a
    jr z, jr_00f_430c

    jr jr_00f_42d2

jr_00f_42d2:
    ld a, [$d874]
    cp $03
    jr c, jr_00f_42fc

    dec a
    ld b, a
    pop hl
    push hl
    push bc
    inc hl
    ld a, [hl+]
    and $1f
    ld b, a
    ld a, [hl+]
    and $1f
    ld c, a
    call Call_000_0969
    pop bc
    inc hl
    ld a, [hl]
    cp $fc
    jr z, jr_00f_430c

    cp $fd
    jr z, jr_00f_430c

    cp $ff
    jr z, jr_00f_430c

    cp b
    jr nc, jr_00f_430c

jr_00f_42fc:
    pop hl
    pop de
    pop bc
    ld a, [hl]
    or $20
    ld [hl], a
    inc e
    ld a, $38
    sub b
    ld [$d875], a
    jr jr_00f_430f

jr_00f_430c:
    pop hl
    pop de
    pop bc

Jump_00f_430f:
jr_00f_430f:
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    dec b
    jp nz, Jump_00f_4276

    ld a, e
    ret


Call_00f_431b::
    ld b, $38
    ld hl, $d572

jr_00f_4320:
    ld a, [hl]
    cp $ff
    jr z, jr_00f_4329

    ld a, [hl]
    and $df
    ld [hl], a

jr_00f_4329:
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    dec b
    jr nz, jr_00f_4320

    ret


Call_00f_4333::
    call Call_000_13f0
    ld a, [$d7c3]
    ld [$d99d], a
    ld a, [$d7c4]
    ld [$d9a2], a
    ld a, [$d99d]
    ld b, a
    ld a, [$d9a2]
    ld c, a
    ld a, [$da11]
    call Call_000_13d0
    ld a, [$d99d]
    call Call_000_099b
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    ld [$d8b6], a
    ld a, $00
    ld [$d8b7], a
    ld a, [$d9a2]
    call Call_000_099b
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    ld [$d8b8], a
    ld a, $00
    ld [$d8b9], a
    ld a, [$da88]
    ld b, a
    ld hl, $0000
    ld de, $0064
    ld a, b
    cp $00
    jr z, jr_00f_4389

jr_00f_4383:
    call AddDEToHL
    dec b
    jr nz, jr_00f_4383

jr_00f_4389:
    ld a, [$da70]
    ld e, a
    ld a, [$da71]
    ld d, a
    call SubDEFromHL
    ld de, $0000
    ld a, [$da88]
    cp $01
    jr z, jr_00f_43a1

    ld de, $0032

jr_00f_43a1:
    call AddDEToHL
    ld bc, $0000
    ld de, $0064

jr_00f_43aa:
    call SubDEFromHL
    jr c, jr_00f_43b2

    inc bc
    jr jr_00f_43aa

jr_00f_43b2:
    ld a, c
    cp $09
    jr c, jr_00f_43b9

    ld c, $00

jr_00f_43b9:
    ld a, c
    ld [$d8ba], a
    ld a, [$da89]
    ld b, a
    ld hl, $0000
    ld de, $0064
    ld a, b
    cp $00
    jr z, jr_00f_43d2

jr_00f_43cc:
    call AddDEToHL
    dec b
    jr nz, jr_00f_43cc

jr_00f_43d2:
    ld a, [$da6e]
    ld e, a
    ld a, [$da6f]
    ld d, a
    call SubDEFromHL
    ld de, $0000
    ld a, [$da89]
    cp $01
    jr z, jr_00f_43ea

    ld de, $0032

jr_00f_43ea:
    call AddDEToHL
    ld bc, $0000
    ld de, $0064

jr_00f_43f3:
    call SubDEFromHL
    jr c, jr_00f_43fb

    inc bc
    jr jr_00f_43f3

jr_00f_43fb:
    ld a, c
    cp $09
    jr c, jr_00f_4402

    ld c, $00

jr_00f_4402:
    ld a, c
    ld [$d8bb], a
    ret


    ld a, [$d6d2]
    push af
    push bc
    ld b, a
    sla a
    add b
    inc a
    ld [$d6d2], a
    pop bc
    pop af
    and $ef
    ld b, $0c
    cp $14
    jr c, jr_00f_4424

    cp $19
    jr nc, jr_00f_4424

    jr jr_00f_4453

jr_00f_4424:
    ld b, $14
    cp $3c
    jr c, jr_00f_4430

    cp $41
    jr nc, jr_00f_4430

    jr jr_00f_4453

jr_00f_4430:
    ld b, $02
    cp $50
    jr c, jr_00f_443c

    cp $53
    jr nc, jr_00f_443c

    jr jr_00f_4453

jr_00f_443c:
    ld b, $28
    cp $62
    jr c, jr_00f_4448

    cp $64
    jr nc, jr_00f_4448

    jr jr_00f_4453

jr_00f_4448:
    ld b, a
    ld a, $96
    sub b
    srl a
    srl a
    srl a
    ld b, a

jr_00f_4453:
    ld b, $0a
    ret


Call_00f_4456::
    ld a, [$d8ba]
    cp $00
    jr z, jr_00f_447c

    ld b, $04
    ld a, [$da89]
    ld c, a
    ld a, [$d8bb]
    cp c
    jr z, jr_00f_447c

    cp $00
    jr nz, jr_00f_446f

    ld b, $08

jr_00f_446f:
    ld a, b
    ld [$d9aa], a
    ld a, [$d99d]
    ld [$d9a8], a
    call Call_00f_449f

jr_00f_447c:
    ld a, [$d8bb]
    cp $00
    jr z, jr_00f_449e

    ld b, $04
    ld a, [$da89]
    ld c, a
    ld a, [$d8bb]
    cp c
    jr nz, jr_00f_4491

    ld b, $08

jr_00f_4491:
    ld a, b
    ld [$d9aa], a
    ld a, [$d9a2]
    ld [$d9a8], a
    call Call_00f_449f

jr_00f_449e:
    ret


Call_00f_449f:
    ld a, [$d9a8]
    call Call_000_099b
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    cp $1f
    jr z, jr_00f_44b8

    ld b, a
    ld a, [$d9aa]
    add b
    cp $20
    jr c, jr_00f_44b8

    ld a, $1f

jr_00f_44b8:
    ld [hl], a
    ret


data_00f_44ba:
    db $20, $00, $40, $00, $80, $00, $00, $01, $00, $02

Call_00f_44c4::
    ld a, [$d99d]
    ld b, a
    ld a, [$d9a2]
    and $3f
    ld c, a
    ld a, [$da11]
    call Call_000_13d0
    ld c, $00
    ld a, [$da6e]
    ld l, a
    ld a, [$da71]
    ld h, a
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
    srl h
    rr l
    ld a, h
    cp $00
    jr nz, jr_00f_4500

    ld a, l
    cp $00
    jr z, jr_00f_4516

jr_00f_4500:
    inc c
    srl h
    rr l
    ld a, h
    cp $00
    jr nz, jr_00f_4500

    ld a, l
    cp $00
    jr nz, jr_00f_4500

    ld a, c
    cp $05
    jr c, jr_00f_4516

    ld c, $04

jr_00f_4516:
    ld a, c
    ld [$d9ac], a
    ld de, data_00f_44ba
    ld a, c
    sla a
    call AddAToDE
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld a, [$da6e]
    ld e, a
    ld a, [$da6f]
    ld d, a
    call AddDEToHL
    ld a, l
    ld [$d9a8], a
    ld a, h
    ld [$d9a9], a
    ld a, [$da70]
    ld e, a
    ld a, [$da71]
    ld d, a
    call SubDEFromHL
    ld a, l
    ld [$d9a8], a
    ld a, h
    ld [$d9a9], a
    ld a, h
    cp $80
    jr c, jr_00f_455e

    ld hl, $0000
    ld a, $00
    ld [$d9a8], a
    ld [$d9a9], a

jr_00f_455e:
    ld a, [$d9a8]
    ld l, a
    ld a, [$d9a9]
    ld h, a
    ld b, c
    inc b

jr_00f_4568:
    srl h
    rr l
    dec b
    jr nz, jr_00f_4568

    ld a, l
    ld [$d9a8], a
    ld a, h
    ld [$d9a9], a
    ld a, [$d9a8]
    ld l, a
    ld a, [$d9a9]
    ld h, a
    ld a, h
    cp $00
    jr nz, jr_00f_4589

    ld a, l
    cp $40
    jr c, jr_00f_458b

jr_00f_4589:
    ld a, $3f

jr_00f_458b:
    ld [$da72], a
    ld a, $00
    ld [$da73], a
    ret


ExpCurve:
    db 10, 11, 11, 12, 13, 14, 16, 20


Call_00f_459c::
    ld [$da7c], a
    ld a, b
    ld [$da7d], a
    ld a, c
    ld [$da7e], a
    ld a, [$da7d]
    call Call_000_099b
    ld a, [hl]
    and $1f
    ld [$da74], a
    ld a, [$da7e]
    call Call_000_099b
    ld a, [hl]
    and $1f
    ld [$da76], a
    ld a, [$da7d]
    call Call_000_099b
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    ld [$da88], a
    ld a, [$da7e]
    call Call_000_099b
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    ld [$da89], a
    ld a, [$da76]
    call GetUnit
    ld a, UNIT_SHIFT_KIND
    call AddAToHL
    ld a, [hl]
    cp $04
    jr nz, .jr_00f_45fe

    ld a, [$da74]
    call GetUnit
    ld a, UNIT_AIR_RANGE
    call AddAToHL
    ld a, [hl]
    ld [$da78], a
    jr .jr_00f_460d

.jr_00f_45fe
    ld a, [$da74]
    call GetUnit
    ld a, UNIT_GND_RANGE
    call AddAToHL
    ld a, [hl]
    ld [$da78], a

.jr_00f_460d
    ld a, [$da74]
    call GetUnit
    ld a, UNIT_SHIFT_KIND
    call AddAToHL
    ld a, [hl]
    cp $04
    jr nz, .jr_00f_462e

    ld a, [$da76]
    call GetUnit
    ld a, UNIT_AIR_RANGE
    call AddAToHL
    ld a, [hl]
    ld [$da7a], a
    jr .jr_00f_463d

.jr_00f_462e
    ld a, [$da76]
    call GetUnit
    ld a, UNIT_GND_RANGE
    call AddAToHL
    ld a, [hl]
    ld [$da7a], a

.jr_00f_463d
    ld a, [$da7c]
    cp $00
    jr z, .jr_00f_4674

    ld a, [$da78]
    cp $01
    jr z, .jr_00f_4662

    jr c, .jr_00f_4662

    ld a, [$da7d]
    ld b, a
    ld a, [$da7e]
    ld c, a
    call Call_00f_4a7d
    ld a, l
    ld [$da8e], a
    ld a, h
    ld [$da8f], a
    jr .jr_00f_466a

.jr_00f_4662
    ld a, $00
    ld [$da8e], a
    ld [$da8f], a

.jr_00f_466a
    ld a, $00
    ld [$da90], a
    ld [$da91], a
    jr .jr_00f_46be

.jr_00f_4674:
    ld a, [$da78]
    cp $01
    jr z, .jr_00f_4687

    jr c, .jr_00f_4687

    ld a, $00
    ld [$da8e], a
    ld [$da8f], a
    jr .jr_00f_469a

.jr_00f_4687
    ld a, [$da7d]
    ld b, a
    ld a, [$da7e]
    ld c, a
    call Call_00f_4a7d
    ld a, l
    ld [$da8e], a
    ld a, h
    ld [$da8f], a

.jr_00f_469a
    ld a, [$da7a]
    cp $01
    jr nz, .jr_00f_46b6

    ld a, [$da7e]
    ld b, a
    ld a, [$da7d]
    ld c, a
    call Call_00f_4a7d
    ld a, l
    ld [$da90], a
    ld a, h
    ld [$da91], a
    jr .jr_00f_46be

.jr_00f_46b6
    ld a, $00
    ld [$da90], a
    ld [$da91], a

.jr_00f_46be
    ld a, [$da7d]
    call Call_00f_4ac9
    ld a, l
    ld [$da92], a
    ld a, h
    ld [$da93], a
    ld a, [$da7e]
    call Call_00f_4ac9
    ld a, l
    ld [$da94], a
    ld a, h
    ld [$da95], a
    ld a, [$da7d]
    call Call_00f_4ae0
    ld a, l
    ld [$da8a], a
    ld a, h
    ld [$da8b], a
    ld a, [$da7e]
    call Call_00f_4ae0
    ld a, l
    ld [$da8c], a
    ld a, h
    ld [$da8d], a
    ld a, $00
    ld [$da96], a
    ld [$da97], a
    ld [$da9a], a
    ld [$da9b], a
    ld a, [$da7c]
    cp $00
    jp nz, .Jump_00f_47c1

    ld a, $00
    ld [$d86f], a

.jr_00f_4711
    ld a, [$da7e]
    ld b, a
    ld a, [$d86f]
    ld c, a
    call Call_00f_4b1e
    cp $ff
    jr z, .jr_00f_4783

    ld b, a
    and $80
    ld c, a
    ld a, [$d90f]
    cp c
    jr nz, .jr_00f_4783

    ld a, b
    and $3f
    ld b, a
    ld a, [$da7d]
    cp b
    jr z, .jr_00f_4783

    ld a, b
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $e0
    cp $00
    jr nz, .jr_00f_4783

    ld a, [hl+]
    and $40
    cp $00
    jr nz, .jr_00f_4783

    inc hl
    inc hl
    ld a, [hl]
    push af
    ld b, b
    ld a, [$da7e]
    ld c, a
    call Call_00f_4a7d
    pop af
    ld c, a
    push hl
    pop de
    ld a, [$da96]
    ld l, a
    ld a, [$da97]
    ld h, a

.jr_00f_475f
    call AddDEToHL
    dec c
    jr nz, .jr_00f_475f

    ld a, l
    ld [$da96], a
    ld a, h
    ld [$da97], a
    ld c, $01
    ld a, [$d86f]
    cp $00
    jr z, .jr_00f_477c

    ld b, a

.jr_00f_4777
    sla c
    dec b
    jr nz, .jr_00f_4777

.jr_00f_477c
    ld a, [$da9a]
    or c
    ld [$da9a], a

.jr_00f_4783
    ld a, [$d86f]
    inc a
    ld [$d86f], a
    cp $06
    jr nz, .jr_00f_4711

    ld a, [$da88]
    ld b, a
    ld hl, $0000
    cp $00
    jr z, .jr_00f_47a2

    ld de, $0002

.jr_00f_479c
    call AddDEToHL
    dec b
    jr nz, .jr_00f_479c

.jr_00f_47a2
    push hl
    pop de
    ld a, [$da96]
    ld l, a
    ld a, [$da97]
    ld h, a
    ld bc, $0000

.jr_00f_47af
    call SubDEFromHL
    jr c, .jr_00f_47b7

    inc bc
    jr .jr_00f_47af

.jr_00f_47b7
    push bc
    pop hl
    ld a, l
    ld [$da96], a
    ld a, h
    ld [$da97], a

.Jump_00f_47c1
    ld a, $00
    ld [$da98], a
    ld [$da99], a
    ld [$da9c], a
    ld [$da9d], a
    ld a, [$da7c]
    cp $00
    jp nz, .Jump_00f_4888

    ld a, $00
    ld [$d86f], a

.jr_00f_47dc
    ld a, [$da7d]
    ld b, a
    ld a, [$d86f]
    ld c, a
    call Call_00f_4b1e
    cp $ff
    jr z, .jr_00f_484a

    ld b, a
    and $80
    ld c, a
    ld a, [$d90f]
    cp c
    jr z, .jr_00f_484a

    ld a, b
    and $3f
    ld b, a
    ld a, [$da7e]
    cp b
    jr z, .jr_00f_484a

    ld a, b
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $e0
    cp $00
    jr nz, .jr_00f_484a

    ld a, [hl+]
    and $40
    cp $00
    jr nz, .jr_00f_484a

    inc hl
    inc hl
    ld a, [hl]
    push af
    ld a, b
    call Call_00f_4ac9
    pop af
    ld c, a
    push hl
    pop de
    ld a, [$da98]
    ld l, a
    ld a, [$da99]
    ld h, a

.jr_00f_4826
    call AddDEToHL
    dec c
    jr nz, .jr_00f_4826

    ld a, l
    ld [$da98], a
    ld a, h
    ld [$da99], a
    ld c, $01
    ld a, [$d86f]
    cp $00
    jr z, .jr_00f_4843

    ld b, a

.jr_00f_483e
    sla c
    dec b
    jr nz, .jr_00f_483e

.jr_00f_4843
    ld a, [$da9c]
    or c
    ld [$da9c], a

.jr_00f_484a
    ld a, [$d86f]
    inc a
    ld [$d86f], a
    cp $06
    jr nz, .jr_00f_47dc

    ld a, [$da88]
    ld b, a
    ld hl, $0000
    cp $00
    jr z, .jr_00f_4869

    ld de, $0002

.jr_00f_4863
    call AddDEToHL
    dec b
    jr nz, .jr_00f_4863

.jr_00f_4869
    push hl
    pop de
    ld a, [$da98]
    ld l, a
    ld a, [$da99]
    ld h, a
    ld bc, $0000

.jr_00f_4876
    call SubDEFromHL
    jr c, .jr_00f_487e

    inc bc
    jr .jr_00f_4876

.jr_00f_487e
    push bc
    pop hl
    ld a, l
    ld [$da98], a
    ld a, h
    ld [$da99], a

.Jump_00f_4888
    ld a, $00
    ld [$da9e], a
    ld a, [$da7c]
    cp $00
    jr nz, .jr_00f_48c3

    ld a, $00
    ld [$d86f], a

.jr_00f_4899
    ld a, [$da9e]
    srl a
    ld [$da9e], a
    ld a, [$da7e]
    ld b, a
    ld a, [$d86f]
    ld c, a
    call Call_00f_4b5c
    and $40
    jr z, .jr_00f_48b8

    ld a, [$da9e]
    or $20
    ld [$da9e], a

.jr_00f_48b8
    ld a, [$d86f]
    inc a
    ld [$d86f], a
    cp $06
    jr nz, .jr_00f_4899

.jr_00f_48c3
    ld a, [$da8e]
    ld l, a
    ld a, [$da8f]
    ld h, a
    ld a, [$da96]
    ld e, a
    ld a, [$da97]
    ld d, a
    call AddDEToHL
    ld a, h
    cp $00
    jr nz, .jr_00f_48e0

    ld a, l
    cp 100
    jr c, .jr_00f_48e3

.jr_00f_48e0
    ld hl, 100

.jr_00f_48e3
    push hl
    ld a, [$da94]
    ld l, a
    ld a, [$da95]
    ld h, a
    ld a, [$da8c]
    ld e, a
    ld a, [$da8d]
    ld d, a
    call AddDEToHL
    ld a, [$da98]
    ld e, a
    ld a, [$da99]
    ld d, a
    call AddDEToHL
    ld a, [$da9e]
    cp $3f
    jr nz, .jr_00f_490d

    srl h
    rr l

.jr_00f_490d
    ld a, h
    cp $00
    jr nz, .jr_00f_4917

    ld a, l
    cp $64
    jr c, .jr_00f_491a

.jr_00f_4917
    ld hl, 100

.jr_00f_491a
    pop bc
    ld a, 100
    sub l
    ld e, a
    ld d, $00
    ld hl, $0000
    ld a, c
    cp 0
    jr z, .jr_00f_492f

.jr_00f_4929
    call AddDEToHL
    dec c
    jr nz, .jr_00f_4929

.jr_00f_492f
    ld bc, $0000

.jr_00f_4932
    ld de, $0064
    call SubDEFromHL
    jr c, .jr_00f_493d

    inc bc
    jr .jr_00f_4932

.jr_00f_493d
    push bc
    ld a, [$da7d]
    call Call_000_099b
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    srl a
    srl a
    and $07
    ld hl, ExpCurve
    call AddAToHL
    ld a, [hl]
    ld b, a
    pop de
    ld hl, $0000
    cp $00
    jr z, .jr_00f_4964

.jr_00f_495e
    call AddDEToHL
    dec b
    jr nz, .jr_00f_495e

.jr_00f_4964
    ld bc, $0000
    ld de, $000a

.jr_00f_496a
    call SubDEFromHL
    jr c, .jr_00f_4972

    inc bc
    jr .jr_00f_496a

.jr_00f_4972
    push bc
    pop hl
    ld a, l
    ld [$da6e], a
    ld a, h
    ld [$da6f], a
    ld a, [$da7c]
    cp $00
    jr z, .jr_00f_4991

    ld hl, $0000
    ld a, l
    ld [$da70], a
    ld a, h
    ld [$da71], a
    jp .Jump_00f_4a36


.jr_00f_4991
    ld a, [$da92]
    ld l, a
    ld a, [$da93]
    ld h, a
    ld a, [$da8a]
    ld e, a
    ld a, [$da8b]
    ld d, a
    call AddDEToHL
    ld a, h
    cp 0
    jr nz, .jr_00f_49ae

    ld a, l
    cp 100
    jr c, .jr_00f_49b1

.jr_00f_49ae
    ld hl, 100

.jr_00f_49b1
    push hl
    ld a, [$da90]
    ld l, a
    ld a, [$da91]
    ld h, a
    ld a, [$da9e]
    cp $3f
    jr nz, .jr_00f_49c5

    srl h
    rr l

.jr_00f_49c5
    ld a, h
    cp 0
    jr nz, .jr_00f_49cf

    ld a, l
    cp 100
    jr c, .jr_00f_49d2

.jr_00f_49cf
    ld hl, $0064

.jr_00f_49d2
    push hl
    pop bc
    pop hl
    ld a, $64
    sub l
    ld e, a
    ld d, $00
    ld hl, $0000
    ld a, c
    cp 0
    jr z, .jr_00f_49e9

.jr_00f_49e3
    call AddDEToHL
    dec c
    jr nz, .jr_00f_49e3

.jr_00f_49e9
    ld bc, 0
    ld de, 100

.jr_00f_49ef
    call SubDEFromHL
    jr c, .jr_00f_49f7

    inc bc
    jr .jr_00f_49ef

.jr_00f_49f7
    push bc
    ld a, [$da7e]
    call Call_000_099b
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    srl a
    srl a
    and $07
    ld hl, ExpCurve
    call AddAToHL
    ld a, [hl]
    ld b, a
    pop de
    ld hl, $0000
    cp $00
    jr z, .jr_00f_4a1e

.jr_00f_4a18
    call AddDEToHL
    dec b
    jr nz, .jr_00f_4a18

.jr_00f_4a1e
    ld bc, $0000
    ld de, $000a

.jr_00f_4a24
    call SubDEFromHL
    jr c, .jr_00f_4a2c

    inc bc
    jr .jr_00f_4a24

.jr_00f_4a2c
    push bc
    pop hl
    ld a, l
    ld [$da70], a
    ld a, h
    ld [$da71], a

.Jump_00f_4a36
    ld a, [$da88]
    ld b, a
    ld hl, $0000
    push af
    ld a, [$da6e]
    ld e, a
    ld a, [$da6f]
    ld d, a
    pop af
    cp $00
    jr z, .jr_00f_4a51

.jr_00f_4a4b
    call AddDEToHL
    dec b
    jr nz, .jr_00f_4a4b

.jr_00f_4a51
    ld a, l
    ld [$da6e], a
    ld a, h
    ld [$da6f], a
    ld a, [$da89]
    ld b, a
    ld hl, $0000
    push af
    ld a, [$da70]
    ld e, a
    ld a, [$da71]
    ld d, a
    pop af
    cp $00
    jr z, .jr_00f_4a74

.jr_00f_4a6e
    call AddDEToHL
    dec b
    jr nz, .jr_00f_4a6e

.jr_00f_4a74
    ld a, l
    ld [$da70], a
    ld a, h
    ld [$da71], a
    ret


Call_00f_4a7d:
    push bc
    push de
    ld a, b
    ld [$da7f], a
    ld a, c
    ld [$da80], a
    ld a, [$da80]
    call Call_000_099b
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_SHIFT_KIND
    call AddAToHL
    ld a, [hl]
    cp $04
    jr z, jr_00f_4ab1

    ld a, [$da7f]
    call Call_000_099b
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_GND_POWER
    call AddAToHL
    ld a, [hl]
    jr jr_00f_4ac3

jr_00f_4ab1:
    ld a, [$da7f]
    call Call_000_099b
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_AIR_POWER
    call AddAToHL
    ld a, [hl]

jr_00f_4ac3:
    ld h, $00
    ld l, a
    pop de
    pop bc
    ret


Call_00f_4ac9:
    push bc
    push de
    call Call_000_099b
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_DEF
    call AddAToHL
    ld a, [hl]
    ld l, a
    ld h, $00
    pop de
    pop bc
    ret


Call_00f_4ae0:
    push bc
    push de
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
    jr z, jr_00f_4afc

    ld c, $00
    jr jr_00f_4b17

jr_00f_4afc:
    ld a, b
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $1f
    ld b, a
    ld a, [hl]
    and $1f
    ld c, a
    call Call_000_0969
    ld a, [hl]
    and $0f
    ld hl, TerrainDefense
    call AddAToHL
    ld a, [hl]
    ld c, a

jr_00f_4b17:
    ld a, c
    ld l, a
    ld h, $00
    pop de
    pop bc
    ret


Call_00f_4b1e:
    push bc
    push de
    push hl
    ld a, b
    ld [$da81], a
    ld a, c
    ld [$da82], a
    ld a, [$da81]
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $1f
    ld b, a
    ld a, [hl]
    and $1f
    ld c, a
    ld a, [$da82]
    call Call_000_0d85
    ld a, [$d90d]
    ld d, a
    ld a, b
    cp d
    jr nc, jr_00f_4b56

    ld a, [$d90e]
    ld d, a
    ld a, c
    cp d
    jr nc, jr_00f_4b56

    call Call_000_0969
    inc hl
    inc hl
    ld a, [hl]
    jr jr_00f_4b58

jr_00f_4b56:
    ld a, $ff

jr_00f_4b58:
    pop hl
    pop de
    pop bc
    ret


Call_00f_4b5c:
    push bc
    push de
    push hl
    ld a, b
    ld [$da81], a
    ld a, c
    ld [$da82], a
    ld a, [$da81]
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $1f
    ld b, a
    ld a, [hl]
    and $1f
    ld c, a
    ld a, [$da82]
    call Call_000_0d85
    ld a, [$d90d]
    ld d, a
    ld a, b
    cp d
    jr nc, jr_00f_4b92

    ld a, [$d90e]
    ld d, a
    ld a, c
    cp d
    jr nc, jr_00f_4b92

    call Call_000_0969
    ld a, [hl]
    jr jr_00f_4b94

jr_00f_4b92:
    ld a, $00

jr_00f_4b94:
    pop hl
    pop de
    pop bc
    ret


Call_00f_4b98::
    ld a, $00
    ld [$db17], a
    ld b, $38
    ld hl, $d572

Jump_00f_4ba2:
    ld a, [hl]
    cp $ff
    jp z, Jump_00f_4c6b

    inc hl
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld e, a
    dec hl
    dec hl
    dec hl
    ld a, d
    and $e0
    cp $00
    jp nz, Jump_00f_4c6b

    ld a, e
    bit 5, a
    jp nz, Jump_00f_4c65

    bit 6, a
    jp nz, Jump_00f_4c6b

    ld a, [hl]
    and $80
    ld e, a
    ld a, [$d90f]
    cp e
    jp nz, Jump_00f_4c65

    ld a, [hl]
    and $1f
    cp $15
    jr z, jr_00f_4bdc

    cp $16
    jr z, jr_00f_4bdc

    jp Jump_00f_4c65


jr_00f_4bdc:
    push bc
    push hl
    inc hl
    ld a, [hl+]
    and $1f
    ld b, a
    ld a, [hl+]
    and $1f
    ld c, a
    call Call_000_0969
    ld a, [hl]
    pop hl
    pop bc
    bit 5, a
    jp z, Jump_00f_4c65

    ld a, [hl]
    and $1f
    cp $15
    jr z, jr_00f_4bfd

    cp $16
    jr z, jr_00f_4c27

jr_00f_4bfd:
    push hl
    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    bit 6, a
    jr nz, jr_00f_4c64

    bit 5, a
    jr nz, jr_00f_4c64

    ld a, [hl]
    and $1f
    pop hl
    cp $00
    jr z, jr_00f_4c57

    cp $12
    jr z, jr_00f_4c57

    cp $13
    jr z, jr_00f_4c57

    cp $11
    jr z, jr_00f_4c57

    jr jr_00f_4c65

jr_00f_4c27:
    push hl
    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    bit 6, a
    jr nz, jr_00f_4c64

    bit 5, a
    jr nz, jr_00f_4c64

    ld a, [hl]
    and $1f
    cp $00
    jr z, jr_00f_4c56

    cp $11
    jr z, jr_00f_4c56

    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    pop hl
    bit UNIT_IS_AIR_F, a
    jr z, jr_00f_4c57

    jr jr_00f_4c65

jr_00f_4c56:
    pop hl

jr_00f_4c57:
    ld a, [$db1b]
    cp $01
    jr z, jr_00f_4c65

    call Call_00f_4cd5
    jp Jump_00f_4c6b


jr_00f_4c64:
    pop hl

Jump_00f_4c65:
jr_00f_4c65:
    call Call_00f_4c76
    jp Jump_00f_4c6b


Jump_00f_4c6b:
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    dec b
    jp nz, Jump_00f_4ba2

    ret


Call_00f_4c76:
    push af
    push bc
    push de
    push hl
    ld a, [hl+]
    ld b, a
    push bc
    bit 7, a
    jr z, jr_00f_4c85

    ld b, $40
    jr jr_00f_4c87

jr_00f_4c85:
    ld b, $a0

jr_00f_4c87:
    and $1f
    sla a
    sla a
    add b
    push af
    ld a, [hl+]
    and $1f
    sla a
    ld b, a
    ld a, [hl+]
    and $1f
    sla a
    inc a
    ld c, a
    ld a, b
    rrca
    and $01
    xor $01
    ld d, a
    ld a, c
    sub d
    ld c, a
    push hl
    call Call_000_093f
    ld d, h
    ld e, l
    pop hl
    pop af
    xor $80
    ld [de], a
    inc de
    inc a
    ld [de], a
    inc a
    push af
    ld a, $3f
    call AddAToDE
    pop af
    ld [de], a
    inc de
    inc a
    ld b, a
    pop bc
    bit 6, b
    jr z, jr_00f_4cc9

    ld a, $b1
    jr jr_00f_4ccf

jr_00f_4cc9:
    bit 5, b
    jr z, jr_00f_4ccf

    ld a, $b3

jr_00f_4ccf:
    ld [de], a
    pop hl
    pop de
    pop bc
    pop af
    ret


Call_00f_4cd5:
    push af
    push bc
    push de
    push hl
    ld a, [hl+]
    ld b, a
    push bc
    bit 7, a
    jr z, jr_00f_4ce4

    ld b, $40
    jr jr_00f_4ce6

jr_00f_4ce4:
    ld b, $a0

jr_00f_4ce6:
    and $1f
    sla a
    sla a
    add b
    push af
    ld a, [hl+]
    and $1f
    sla a
    ld b, a
    ld a, [hl+]
    and $1f
    sla a
    inc a
    ld c, a
    ld a, b
    rrca
    and $01
    xor $01
    ld d, a
    ld a, c
    sub d
    ld c, a
    push hl
    call Call_000_093f
    ld d, h
    ld e, l
    pop hl
    pop af
    xor $80
    ld [de], a
    inc de
    inc a
    ld [de], a
    inc a
    push af
    ld a, $3f
    call AddAToDE
    pop af
    ld [de], a
    pop bc
    bit 6, b
    jr z, jr_00f_4d25

    ld a, $b1
    jr jr_00f_4d2b

jr_00f_4d25:
    bit 5, b
    jr z, jr_00f_4d2b

    ld a, $b3

jr_00f_4d2b:
    ld [de], a
    inc de
    inc a
    ld a, $b2
    ld [de], a
    push af
    ld a, $01
    ld [$db17], a
    pop af
    pop hl
    pop de
    pop bc
    pop af
    ret


Call_004_4d3d::
    ld a, [$d79f]
    ld d, a
    ld a, [$d7a0]
    ld e, a
    ld b, $38
    ld hl, $d572

jr_00f_4d4a:
    push bc
    push hl
    ld a, [hl+]
    cp $ff
    jr z, jr_00f_4d79

    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld c, a
    dec hl
    dec hl
    ld a, b
    and $e0
    cp $00
    jr nz, jr_00f_4d79

    ld a, c
    bit 5, a
    jr nz, jr_00f_4d67

    bit 6, a
    jr nz, jr_00f_4d79

jr_00f_4d67:
    ld a, b
    and $1f
    cp d
    jr nz, jr_00f_4d79

    ld a, c
    and $1f
    cp e
    jr nz, jr_00f_4d79

    pop hl
    pop bc
    ld a, $38
    sub b
    ret


jr_00f_4d79:
    pop hl
    pop bc
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    dec b
    jr nz, jr_00f_4d4a

    ld a, $ff
    ret


Call_004_4d87::
    ld b, $38
    ld hl, $d572

Jump_00f_4d8c:
    ld a, [hl]
    cp $ff
    jr z, jr_00f_4d94

    and $bf
    ld [hl], a

jr_00f_4d94:
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    dec b
    jp nz, Jump_00f_4d8c

    ret


Call_00f_4d9f::
    ld c, a
    ld d, $00
    ld b, $38
    ld hl, $d572

jr_00f_4da7:
    ld a, [hl]
    cp $ff
    jr z, jr_00f_4e03

    ld e, a
    inc hl
    ld a, [hl-]
    and $e0
    cp $00
    jr z, jr_00f_4df0

    push bc
    push hl
    srl a
    srl a
    srl a
    srl a
    srl a
    dec a
    sla a
    ld hl, $d918
    call AddAToHL
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    pop hl
    pop bc
    and $0f
    cp $0b
    jr z, jr_00f_4de0

    cp $0d
    jr z, jr_00f_4de8

    jr jr_00f_4e03

jr_00f_4de0:
    ld a, c
    cp $00
    jr nz, jr_00f_4e03

    inc d
    jr jr_00f_4e03

jr_00f_4de8:
    ld a, c
    cp $01
    jr nz, jr_00f_4e03

    inc d
    jr jr_00f_4e03

jr_00f_4df0:
    ld a, e
    srl a
    srl a
    srl a
    srl a
    srl a
    srl a
    srl a
    cp c
    jr nz, jr_00f_4e03

    inc d

jr_00f_4e03:
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    dec b
    jr nz, jr_00f_4da7

    ld a, d
    ret


Call_00f_4e0e::
    ld a, [$d6d2]
    and $0f
    cp $08
    jr nc, jr_00f_4e72

    ld a, [$d79e]
    ld c, a
    ld a, [$d7a0]
    sla a
    inc a
    ld b, a
    ld a, [$d79f]
    and $01
    xor $01
    ld e, a
    ld a, b
    sub e
    sub c
    sla a
    sla a
    sla a
    add $0c
    ld e, a
    ld a, [$d79d]
    ld c, a
    ld a, [$d79f]
    sla a
    sub c
    sla a
    sla a
    sla a
    add $04
    ld d, a
    dec d
    dec d
    dec e
    dec e
    ld c, $00
    ld a, $00
    push de
    call Call_000_08ff
    ld a, d
    add $0c
    ld d, a
    ld c, $01
    call Call_000_091a
    pop de
    ld a, e
    add $14
    ld e, a
    ld c, $02
    call Call_000_091a
    ld a, d
    add $0c
    ld d, a
    ld c, $03
    call Call_000_091a
    ret


Call_00f_4e72:
jr_00f_4e72:
    ld a, $00
    ld c, $00
    ld d, $00
    ld e, $00
    call Call_000_08ff
    ld c, $00
    call Call_000_091a
    ld c, $00
    call Call_000_091a
    ld c, $00
    call Call_000_091a
    ret


Call_00f_4e8d::
    push de
    ld a, [$d79d]
    add b
    ld b, a
    ld a, [$d79e]
    add c
    ld c, a
    call Call_000_093f
    pop de
    push hl
    ld a, $b8
    ld [hl+], a
    ld b, d
    ld a, $b9

jr_00f_4ea3:
    ld [hl+], a
    dec b
    jr nz, jr_00f_4ea3

    ld a, $ba
    ld [hl+], a
    pop hl
    ld a, $40
    call AddAToHL
    ld c, e

jr_00f_4eb1:
    push hl
    ld a, $bb
    ld [hl+], a
    ld b, d
    ld a, $80

jr_00f_4eb8:
    ld [hl+], a
    dec b
    jr nz, jr_00f_4eb8

    ld a, $bc
    ld [hl+], a
    pop hl
    ld a, $40
    call AddAToHL
    dec c
    jr nz, jr_00f_4eb1

    ld a, $bd
    ld [hl+], a
    ld b, d
    ld a, $be

jr_00f_4ece:
    ld [hl+], a
    dec b
    jr nz, jr_00f_4ece

    ld a, $bf
    ld [hl+], a
    ret


Call_00f_4ed6::
    ld hl, $c100
    sla a
    sla a
    call AddAToHL

jr_00f_4ee0:
    push hl
    ld a, [$d7c1]
    ld l, a
    ld a, [$d7c2]
    ld h, a
    ld a, [hl+]
    ld c, a
    ld a, l
    ld [$d7c1], a
    ld a, h
    ld [$d7c2], a
    push bc
    ld b, $00
    ld hl, data_000_0323

jr_00f_4ef9:
    ld a, [hl+]
    cp c
    jr z, jr_00f_4f07

    inc b
    ld a, b
    cp $80
    jr nz, jr_00f_4ef9

    ld a, $20
    jr jr_00f_4f08

jr_00f_4f07:
    ld a, b

jr_00f_4f08:
    pop bc
    ld c, a
    pop hl
    push af
    cp $59
    jr z, jr_00f_4f14

    cp $5a
    jr nz, jr_00f_4f18

jr_00f_4f14:
    ld a, d
    sub $08
    ld d, a

jr_00f_4f18:
    pop af
    call Call_000_091a
    dec b
    jr nz, jr_00f_4ee0

    ret


Call_00f_4f20::
    ld hl, $c100
    sla a
    sla a
    call AddAToHL

jr_00f_4f2a:
    push hl
    ld a, b
    ld h, $64
    cp $03
    jr z, jr_00f_4f3a

    ld h, $0a
    cp $02
    jr z, jr_00f_4f3a

    ld h, $01

jr_00f_4f3a:
    ld l, $00

jr_00f_4f3c:
    ld a, c
    cp h
    jr c, jr_00f_4f45

    sub h
    ld c, a
    inc l
    jr jr_00f_4f3c

jr_00f_4f45:
    ld a, l
    pop hl
    push bc
    add $04
    ld c, a
    call Call_000_091a
    pop bc
    dec b
    jr nz, jr_00f_4f2a

    ret


Call_00f_4f53::
    call Call_00f_4e72
    ld a, SND_ACTION_OPEN
    call PlaySound
    ld a, $00
    ld [$d86f], a
    call Call_000_0db5
    ld a, $00
    call Call_000_09f9
    jr jr_00f_4f81


Call_00f_4f6a::
    call Call_00f_4e72
    ld a, SND_ACTION_OPEN
    call PlaySound
    ld a, $01
    ld [$d86f], a
    call Call_000_0db5
    ld a, $02
    call Call_000_09f9
    jr jr_00f_4f81

jr_00f_4f81:
    ld a, $0e
    ld [$d90b], a
    ld a, [$d79d]
    ld c, a
    ld a, [$d79f]
    sla a
    sub c
    sla a
    sla a
    sla a
    add $04
    cp $50
    jr c, jr_00f_4fa1

    ld a, $00
    ld [$d90b], a

jr_00f_4fa1:
    call Call_00f_50e0
    ld a, $00
    ld [$d7c2], a
    call Call_00f_5356
    call Call_000_085d
    call Call_000_085d

Jump_00f_4fb2:
jr_00f_4fb2:
    ld a, [$d86f]
    cp $00
    jr nz, jr_00f_4fc3

    ld a, $01
    ld [$d879], a
    call Call_000_0abb
    jr jr_00f_4fc6

jr_00f_4fc3:
    call Call_000_085d

jr_00f_4fc6:
    call Call_000_079c
    call Call_00f_5356
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_00f_4fe4

    bit 1, a
    jp nz, Jump_00f_4ffa

    bit 6, a
    jp nz, Jump_00f_5010

    bit 7, a
    jp nz, Jump_00f_5057

    jr jr_00f_4fb2

Jump_00f_4fe4:
    ld a, SND_ACTION_ACCEPT
    call PlaySound

jr_00f_4fe9:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jr nz, jr_00f_4fe9

    ld a, $00
    jp Jump_00f_509e


Jump_00f_4ffa:
    ld a, SND_MENU_CANCEL
    call PlaySound

jr_00f_4fff:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 1, a
    jr nz, jr_00f_4fff

    ld a, $01
    jp Jump_00f_509e


Jump_00f_5010:
    ld a, [$d7c2]
    cp $00
    jr nz, jr_00f_5036

    ld b, $03
    ld a, [$d86f]
    cp $00
    jr z, jr_00f_5022

    ld b, $02

jr_00f_5022:
    ld a, b
    ld [$d7c2], a
    ld a, SND_ACTION_NAV
    call PlaySound
    call Call_00f_5356
    call Call_000_085d
    call Call_000_085d
    jr jr_00f_5048

jr_00f_5036:
    dec a
    ld [$d7c2], a
    ld a, SND_ACTION_NAV
    call PlaySound
    call Call_00f_5356
    call Call_000_085d
    call Call_000_085d

jr_00f_5048:
    call Call_00f_50d0
    call Call_000_079c
    ldh a, [$8c]
    bit 6, a
    jr nz, jr_00f_5048

    jp Jump_00f_4fb2


Jump_00f_5057:
    ld b, $03
    ld a, [$d86f]
    cp $00
    jr z, jr_00f_5062

    ld b, $02

jr_00f_5062:
    ld a, [$d7c2]
    cp b
    jr nz, jr_00f_507d

    ld a, $00
    ld [$d7c2], a
    ld a, SND_ACTION_NAV
    call PlaySound
    call Call_00f_5356
    call Call_000_085d
    call Call_000_085d
    jr jr_00f_508f

jr_00f_507d:
    inc a
    ld [$d7c2], a
    ld a, SND_ACTION_NAV
    call PlaySound
    call Call_00f_5356
    call Call_000_085d
    call Call_000_085d

jr_00f_508f:
    call Call_00f_50d0
    call Call_000_079c
    ldh a, [$8c]
    bit 7, a
    jr nz, jr_00f_508f

    jp Jump_00f_4fb2


Jump_00f_509e:
    push af
    ld a, $00
    ld [$d879], a
    ld a, $32
    ld [$d7b8], a
    ld a, [$d6d2]
    and $f0
    ld [$d6d2], a
    xor a
    ld [$d7a2], a
    ld a, $00
    ld hl, $c100
    ld bc, $00a0
    call Call_000_080f
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    ld a, $01
    call Call_000_09f9
    pop af
    ret


Call_00f_50d0:
    ld a, [$d86f]
    cp $00
    jr nz, jr_00f_50df

    ld a, $01
    ld [$d879], a
    call Call_000_0abb

jr_00f_50df:
    ret


Call_00f_50e0:
    ld a, $01
    ld [$d7a6], a
    ld a, $06
    push af
    ld a, [$d90b]
    add $02
    sla a
    sla a
    sla a
    add $02
    ld d, a
    pop af
    ld e, $18
    ld c, $20
    call Call_00f_5389
    ld a, $0e
    push af
    ld a, [$d90b]
    add $02
    sla a
    sla a
    sla a
    add $02
    ld d, a
    pop af
    ld e, $28
    ld c, $28
    call Call_00f_5389
    ld a, $16
    push af
    ld a, [$d90b]
    add $02
    sla a
    sla a
    sla a
    add $02
    ld d, a
    pop af
    ld e, $38
    ld c, $30
    call Call_00f_5389
    ld a, [$d86f]
    cp $00
    jr nz, jr_00f_5150

    ld a, $1e
    push af
    ld a, [$d90b]
    add $02
    sla a
    sla a
    sla a
    add $02
    ld d, a
    pop af
    ld e, $48
    ld c, $38
    call Call_00f_5389

jr_00f_5150:
    ld a, [$d86f]
    cp $00
    jp nz, Jump_00f_527b

    push af
    ld a, [$d90b]
    ld b, a
    pop af
    ld c, $00
    ld d, $04
    ld e, $08
    call Call_000_14d0
    ld a, $00
    call Call_00f_4d9f
    ld b, $00

jr_00f_516e:
    cp $0a
    jr c, jr_00f_5177

    sub $0a
    inc b
    jr jr_00f_516e

jr_00f_5177:
    push af
    ld a, b
    add $04
    ld c, a
    ld a, $00
    push af
    ld a, [$d90b]
    add $04
    sla a
    sla a
    sla a
    dec a
    dec a
    ld d, a
    pop af
    ld e, $80
    call Call_000_08ff
    pop af
    add $04
    ld c, a
    ld a, $01
    push af
    ld a, [$d90b]
    add $05
    sla a
    sla a
    sla a
    dec a
    dec a
    ld d, a
    pop af
    ld e, $80
    call Call_000_08ff
    ld a, $01
    call Call_00f_4d9f
    ld b, $00

jr_00f_51b5:
    cp $0a
    jr c, jr_00f_51be

    sub $0a
    inc b
    jr jr_00f_51b5

jr_00f_51be:
    push af
    ld a, b
    add $04
    ld c, a
    ld a, $02
    push af
    ld a, [$d90b]
    add $04
    sla a
    sla a
    sla a
    dec a
    dec a
    ld d, a
    pop af
    ld e, $88
    call Call_000_08ff
    pop af
    add $04
    ld c, a
    ld a, $03
    push af
    ld a, [$d90b]
    add $05
    sla a
    sla a
    sla a
    dec a
    dec a
    ld d, a
    pop af
    ld e, $88
    call Call_000_08ff
    ld a, [$d7a5]
    inc a
    ld b, $00

jr_00f_51fb:
    cp $0a
    jr c, jr_00f_5204

    sub $0a
    inc b
    jr jr_00f_51fb

jr_00f_5204:
    push af
    ld a, b
    add $04
    ld c, a
    ld a, $26
    push af
    ld a, [$d90b]
    add $04
    sla a
    sla a
    sla a
    dec a
    dec a
    ld d, a
    pop af
    ld e, $90
    call Call_000_08ff
    pop af
    add $04
    ld c, a
    ld a, $27
    push af
    ld a, [$d90b]
    add $05
    sla a
    sla a
    sla a
    dec a
    dec a
    ld d, a
    pop af
    ld e, $90
    call Call_000_08ff
    push af
    ld a, [$d90b]
    ld b, a
    pop af
    ld c, $0d
    ld d, $04
    ld e, $03
    call Call_000_14d0
    ld a, [$d79d]
    ld b, a
    ld a, [$d90b]
    inc a
    add b
    ld b, a
    ld a, [$d79e]
    add $0e
    ld c, a
    push bc
    call Call_000_093f
    ld a, $1c
    ld [hl], a
    pop bc
    inc c
    push bc
    call Call_000_093f
    ld a, $1d
    ld [hl], a
    pop bc
    inc c
    call Call_000_093f
    ld a, $1e
    ld [hl], a
    call Call_000_0abb
    ld a, $00
    ld [$d7a6], a
    ret


Jump_00f_527b:
    ld a, $01
    ld [$d7a6], a
    push af
    ld a, [$d90b]
    ld b, a
    pop af
    ld c, $00
    ld d, $04
    ld e, $06
    call Call_000_14d0
    ld a, $00
    call Call_00f_4d9f
    ld b, $00

jr_00f_5296:
    cp $0a
    jr c, jr_00f_529f

    sub $0a
    inc b
    jr jr_00f_5296

jr_00f_529f:
    push af
    ld a, b
    add $04
    ld c, a
    ld a, $00
    push af
    ld a, [$d90b]
    add $04
    sla a
    sla a
    sla a
    dec a
    dec a
    ld d, a
    pop af
    ld e, $88
    call Call_000_08ff
    pop af
    add $04
    ld c, a
    ld a, $01
    push af
    ld a, [$d90b]
    add $05
    sla a
    sla a
    sla a
    dec a
    dec a
    ld d, a
    pop af
    ld e, $88
    call Call_000_08ff
    ld a, $01
    call Call_00f_4d9f
    ld b, $00

jr_00f_52dd:
    cp $0a
    jr c, jr_00f_52e6

    sub $0a
    inc b
    jr jr_00f_52dd

jr_00f_52e6:
    push af
    ld a, b
    add $04
    ld c, a
    ld a, $02
    push af
    ld a, [$d90b]
    add $04
    sla a
    sla a
    sla a
    dec a
    dec a
    ld d, a
    pop af
    ld e, $90
    call Call_000_08ff
    pop af
    add $04
    ld c, a
    ld a, $03
    push af
    ld a, [$d90b]
    add $05
    sla a
    sla a
    sla a
    dec a
    dec a
    ld d, a
    pop af
    ld e, $90
    call Call_000_08ff
    push af
    ld a, [$d90b]
    ld b, a
    pop af
    ld c, $0e
    ld d, $04
    ld e, $02
    call Call_000_14d0
    ld a, [$d79d]
    ld b, a
    ld a, [$d90b]
    inc a
    add b
    ld b, a
    ld a, [$d79e]
    add $0f
    ld c, a
    push bc
    call Call_000_093f
    ld a, $1c
    ld [hl], a
    pop bc
    inc c
    push bc
    call Call_000_093f
    ld a, $1d
    ld [hl], a
    pop bc
    call Call_000_0abb
    ld a, $00
    ld [$d7a6], a
    ret


Call_00f_5356:
    push af
    ld a, [$d90b]
    inc a
    sla a
    sla a
    sla a
    add $06
    ld d, a
    pop af
    ld e, $18
    ld a, [$d7c2]
    sla a
    sla a
    sla a
    sla a
    add e
    ld e, a
    ld c, $1e
    ld a, $04
    push de
    call Call_000_08ff
    pop de
    ld a, e
    add $08
    ld e, a
    ld c, $1f
    ld a, $05
    call Call_000_08ff
    ret


Call_00f_5389:
    ld hl, $c100
    sla a
    sla a
    call AddAToHL
    push de
    call Call_000_091a
    inc c
    call Call_000_091a
    inc c
    pop de
    push de
    ld a, e
    add $08
    ld e, a
    call Call_000_091a
    inc c
    call Call_000_091a
    inc c
    pop de
    ld a, d
    add $10
    ld d, a
    push de
    call Call_000_091a
    inc c
    call Call_000_091a
    inc c
    pop de
    push de
    ld a, e
    add $08
    ld e, a
    call Call_000_091a
    inc c
    call Call_000_091a
    inc c
    pop de
    ret


Call_00f_53c8::
    ld a, [$d79f]
    ld d, a
    ld a, [$d7a0]
    ld e, a
    push de
    ld a, [$d914]
    ld [$d79f], a
    ld a, [$d915]
    ld [$d7a0], a
    call Call_000_1490
    cp $ff
    jp z, Jump_00f_5402

    call Call_000_099b
    ld a, [hl]
    bit 7, a
    jr z, jr_00f_5402

    ld a, [hl]
    and $3f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_ABCD
    cp UNIT_INFANTRY
    ld b, $01
    jp z, Jump_00f_54ab

Jump_00f_5402:
jr_00f_5402:
    ld a, [$d916]
    ld [$d79f], a
    ld a, [$d917]
    ld [$d7a0], a
    call Call_000_1490
    cp $ff
    jp z, Jump_00f_5433

    call Call_000_099b
    ld a, [hl]
    bit 7, a
    jr nz, jr_00f_5433

    ld a, [hl]
    and $3f
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_ABCD
    cp UNIT_INFANTRY
    ld b, $02
    jp z, Jump_00f_54ab

Jump_00f_5433:
jr_00f_5433:
    ld hl, $d572
    ld c, $00
    ld de, $0000

jr_00f_543b:
    ld a, [hl]
    cp $ff
    jr z, jr_00f_5487

    ld a, [hl]
    and $3f
    cp $00
    jr z, jr_00f_5487

    inc hl
    ld a, [hl-]
    and $e0
    cp $00
    jr nz, jr_00f_5458

    ld a, [hl]
    and $80
    cp $00
    jr nz, jr_00f_5486

    jr jr_00f_5483

jr_00f_5458:
    push bc
    push hl
    srl a
    srl a
    srl a
    srl a
    srl a
    dec a
    sla a
    ld hl, $d918
    call AddAToHL
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    pop hl
    pop bc
    and $0f
    cp $0b
    jr z, jr_00f_5483

    cp $0d
    jr z, jr_00f_5486

    jr jr_00f_5487

jr_00f_5483:
    inc d
    jr jr_00f_5487

jr_00f_5486:
    inc e

jr_00f_5487:
    ld a, $06
    call AddAToHL
    inc c
    ld a, c
    cp $38
    jr nz, jr_00f_543b

    ld b, $03
    ld a, d
    cp $00
    jr z, jr_00f_54ab

    ld b, $04
    ld a, e
    cp $00
    jr z, jr_00f_54ab

    ld a, [$d7a5]
    cp $32
    ld b, $05
    jr nc, jr_00f_54ab

    ld b, $00

Jump_00f_54ab:
jr_00f_54ab:
    pop de
    ld a, d
    ld [$d79f], a
    ld a, e
    ld [$d7a0], a
    ld a, b
    ret


Call_00f_54b6::
    ld a, $00
    ld [$d86f], a
    ld hl, $ccf0
    inc hl
    ld c, $00

Jump_00f_54c1:
    ld b, $00
    push hl

Jump_00f_54c4:
    ld a, [hl]
    cp e
    jp nz, Jump_00f_5564

    ld a, b
    cp $00
    jr z, jr_00f_54d6

    push hl
    dec hl
    dec hl
    dec hl
    call Call_00f_558a
    pop hl

jr_00f_54d6:
    ld a, [$d90d]
    dec a
    cp b
    jr z, jr_00f_54e7

    jr c, jr_00f_54e7

    push hl
    inc hl
    inc hl
    inc hl
    call Call_00f_558a
    pop hl

jr_00f_54e7:
    ld a, c
    cp $00
    jr z, jr_00f_54f6

    push hl
    ld a, $60
    call SubAFromHL
    call Call_00f_558a
    pop hl

jr_00f_54f6:
    ld a, [$d90e]
    dec a
    cp c
    jr z, jr_00f_5509

    jr c, jr_00f_5509

    push hl
    ld a, $60
    call AddAToHL
    call Call_00f_558a
    pop hl

jr_00f_5509:
    ld a, b
    and $01
    cp $00
    jr z, jr_00f_553d

    ld a, [$d90e]
    dec a
    cp c
    jr z, jr_00f_553b

    jr c, jr_00f_553b

    ld a, b
    cp $00
    jr z, jr_00f_5528

    push hl
    ld a, $5d
    call AddAToHL
    call Call_00f_558a
    pop hl

jr_00f_5528:
    ld a, [$d90d]
    dec a
    cp b
    jr z, jr_00f_553b

    jr c, jr_00f_553b

    push hl
    ld a, $63
    call AddAToHL
    call Call_00f_558a
    pop hl

jr_00f_553b:
    jr jr_00f_5564

jr_00f_553d:
    ld a, c
    cp $00
    jr z, jr_00f_5564

    ld a, b
    cp $00
    jr z, jr_00f_5551

    push hl
    ld a, $63
    call SubAFromHL
    call Call_00f_558a
    pop hl

jr_00f_5551:
    ld a, [$d90d]
    dec a
    cp b
    jr z, jr_00f_5564

    jr c, jr_00f_5564

    push hl
    ld a, $5d
    call SubAFromHL
    call Call_00f_558a
    pop hl

Jump_00f_5564:
jr_00f_5564:
    inc hl
    inc hl
    inc hl
    inc b
    ld a, b
    cp $20
    jp nz, Jump_00f_54c4

    pop hl
    ld a, $60
    call AddAToHL
    inc c
    ld a, c
    cp $16
    jp nz, Jump_00f_54c1

    dec e
    ld a, e
    cp $00
    jr z, jr_00f_5589

    ld a, [$d86f]
    cp $00
    jp nz, Call_00f_54b6

jr_00f_5589:
    ret


Call_00f_558a:
    ld a, [hl]
    cp $fd
    jr z, jr_00f_55a0

    cp $fc
    ret nz

    inc hl
    ld a, [hl]
    dec hl
    ld d, a
    ld a, e
    sub d
    ret z

    ld [hl], a
    ld a, $01
    ld [$d86f], a
    ret


jr_00f_55a0:
    ld d, a
    ld a, e
    sub d

jr_00f_55a3:
    ret z

    ld a, $00
    ld [hl], a
    ld a, $01
    ld [$d86f], a
    ret


Call_00f_55ad::
    ld a, $00
    ld [$db16], a
    ld hl, $ccf0
    inc hl
    ld bc, $02c0

jr_00f_55b9:
    ld a, [hl]
    cp $fc
    jr nc, jr_00f_55d2

    dec hl
    ld a, [hl]
    or $20
    ld [hl], a
    inc hl
    inc hl
    ld a, [hl]
    dec hl
    cp $ff
    jr nz, jr_00f_55d8

    ld a, $01
    ld [$db16], a
    jr jr_00f_55d8

jr_00f_55d2:
    dec hl
    ld a, [hl]
    and $df
    ld [hl], a
    inc hl

jr_00f_55d8:
    inc hl
    inc hl
    inc hl
    dec bc
    ld a, c
    or b
    jr nz, jr_00f_55b9

    ret


data_00f_55e1:
    db "ｻｲｶｲ ｼﾏｽｶ "

data_00f_55eb:
    db "YES-A NO-B"


Call_00f_55f5::
    ld a, [$db18]
    cp $00
    jp z, Jump_00f_568e

    ld a, $00
    ld [$db18], a
    ld a, SND_MENU_NAV
    call PlaySound
    call Call_000_0927
    ld b, $00
    ld c, $0c
    ld d, $12
    ld e, $04
    call Call_000_14d0
    ld hl, data_00f_55e1
    ld a, l
    ld [$d7c1], a
    ld a, h
    ld [$d7c2], a
    ld a, $00
    ld d, $30
    ld e, $7a
    ld b, $0c
    call Call_000_14f0
    ld hl, data_00f_55eb
    ld a, l
    ld [$d7c1], a
    ld a, h
    ld [$d7c2], a
    ld a, $0c
    ld d, $30
    ld e, $86
    ld b, $0c
    call Call_000_14f0
    call Call_000_0abb
    call Call_000_085d

jr_00f_5647:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_00f_565e

    bit 1, a
    jp nz, Jump_00f_5676

    call Call_000_085d
    jr jr_00f_5647

Jump_00f_565e:
    ld a, SND_MENU_ACCEPT
    call PlaySound
    call Call_000_0927

Jump_00f_5666:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_00f_5666

    ld a, $fe
    ret


Jump_00f_5676:
    ld a, SND_MENU_CANCEL
    call PlaySound
    call Call_000_0927

Jump_00f_567e:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 1, a
    jp nz, Jump_00f_567e

    ld a, $ff
    ret


Jump_00f_568e:
jr_00f_568e:
    ld a, [$d879]
    cp $00
    jr z, jr_00f_56af

    cp $02
    jr z, jr_00f_56b4

    call Call_000_1490
    cp $ff
    jr z, jr_00f_56b1

    ld b, a
    call Call_000_099b
    ld a, [hl]
    and $80
    ld c, a
    ld a, [$d90f]
    cp c
    ld a, b
    jr z, jr_00f_56b1

jr_00f_56af:
    ld a, $ff

jr_00f_56b1:
    ld [$d878], a

jr_00f_56b4:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_00f_56f4

    bit 1, a
    jp nz, Jump_00f_5709

    bit 3, a
    jp nz, Jump_00f_5726

    bit 2, a
    jp nz, Jump_00f_571e

    bit 4, a
    jp nz, Jump_00f_5814

    bit 5, a
    jp nz, Jump_00f_57d6

    bit 6, a
    jp nz, Jump_00f_572e

    bit 7, a
    jp nz, Jump_00f_5775

    call Call_000_1a97
    call Call_000_0abb
    jr jr_00f_568e

Jump_00f_56ec:
    call Call_000_14b0
    call Call_000_0abb
    jr jr_00f_568e

Jump_00f_56f4:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_00f_56f4

    ld a, $00
    ld [$d879], a
    ld a, $00
    ret


Jump_00f_5709:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 1, a
    jp nz, Jump_00f_5709

    ld a, $00
    ld [$d879], a
    ld a, $01
    ret


Jump_00f_571e:
    ld a, $00
    ld [$d879], a
    ld a, $02
    ret


Jump_00f_5726:
    ld a, $00
    ld [$d879], a
    ld a, $03
    ret


Jump_00f_572e:
    call Call_000_0db5
    ld a, [$d7a0]
    cp $00
    jp z, Jump_00f_56ec

    dec a
    ld [$d7a0], a
    ld a, SND_MAP_NAV
    call PlaySound
    ld a, [$d79e]
    add $03
    ld c, a
    ld a, [$d7a0]
    sla a
    ld b, a
    ld a, [$d79f]
    and $01
    xor $01
    add b
    sub c
    jp nc, Jump_00f_56ec

    ld a, [$d79e]
    cp $00
    jp z, Jump_00f_56ec

    dec a
    ld [$d79e], a
    ld a, [$d79e]
    cp $00
    jp z, Jump_00f_56ec

    dec a
    ld [$d79e], a
    jp Jump_00f_56ec


Jump_00f_5775:
    call Call_000_0db5
    ld a, [$d90e]
    dec a
    ld b, a
    ld a, [$d7a0]
    cp b
    jp nc, Jump_00f_56ec

    inc a
    ld [$d7a0], a
    ld a, SND_MAP_NAV
    call PlaySound
    ld a, [$d79e]
    add $0d
    ld c, a
    ld a, [$d7a0]
    sla a
    ld b, a
    ld a, [$d79f]
    and $01
    xor $01
    add b
    sub c
    jp c, Jump_00f_56ec

    ld a, [$d90e]
    sla a
    inc a
    ld b, a
    ld a, [$d79e]
    add $12
    sub b
    jp nc, Jump_00f_56ec

    ld a, [$d79e]
    inc a
    ld [$d79e], a
    ld a, [$d90e]
    sla a
    inc a
    ld b, a
    ld a, [$d79e]
    add $12
    sub b
    jp nc, Jump_00f_56ec

    ld a, [$d79e]
    inc a
    ld [$d79e], a
    jp Jump_00f_56ec


Jump_00f_57d6:
    call Call_000_0db5
    ld a, [$d79f]
    cp $00
    jp z, Jump_00f_56ec

    dec a
    ld [$d79f], a
    ld a, SND_MAP_NAV
    call PlaySound
    ld a, [$d79d]
    add $04
    ld c, a
    ld a, [$d79f]
    sla a
    sub c
    jp nc, Jump_00f_56ec

    ld a, [$d79d]
    cp $00
    jp z, Jump_00f_56ec

    dec a
    ld [$d79d], a
    ld a, [$d79d]
    cp $00
    jp z, Jump_00f_56ec

    dec a
    ld [$d79d], a
    jp Jump_00f_56ec


Jump_00f_5814:
    call Call_000_0db5
    ld a, [$d90d]
    dec a
    ld b, a
    ld a, [$d79f]
    cp b
    jp nc, Jump_00f_56ec

    inc a
    ld [$d79f], a
    ld a, SND_MAP_NAV
    call PlaySound
    ld a, [$d79d]
    add $0f
    ld c, a
    ld a, [$d79f]
    sla a
    sub c
    jp c, Jump_00f_56ec

    ld a, [$d90d]
    sla a
    ld b, a
    ld a, [$d79d]
    add $14
    sub b
    jp nc, Jump_00f_56ec

    ld a, [$d79d]
    inc a
    ld [$d79d], a
    ld a, [$d90d]
    sla a
    ld b, a
    ld a, [$d79d]
    add $14
    sub b
    jp nc, Jump_00f_56ec

    ld a, [$d79d]
    inc a
    ld [$d79d], a
    jp Jump_00f_56ec


Call_005_586a::
    ld a, [$daff]
    and $1f
    ld [$daff], a
    ld a, [$db00]
    and $1f
    ld [$db00], a
    ld b, $05

jr_00f_587c:
    push bc
    call Call_000_14b0
    call Call_000_14b0
    call Call_000_085d
    pop bc
    dec b
    jr nz, jr_00f_587c

jr_00f_588a:
    ld a, [$daff]
    ld b, a
    ld a, [$d79f]
    cp b
    jr z, jr_00f_589a

    jp c, Jump_00f_5a12

    jp Jump_00f_59bc


jr_00f_589a:
    ld a, [$db00]
    ld b, a
    ld a, [$d7a0]
    cp b
    jr z, jr_00f_58aa

    jp c, Jump_00f_592a

    jp Jump_00f_58c8


jr_00f_58aa:
    ld b, $0a

jr_00f_58ac:
    push bc
    call Call_000_14b0
    call Call_000_085d
    pop bc
    dec b
    jr nz, jr_00f_58ac

    ret


Jump_00f_58b8:
    call Call_000_14b0
    call Call_000_0abb
    call Call_000_085d
    jr jr_00f_588a

Jump_00f_58c3:
    call Call_000_14b0
    jr jr_00f_588a

Jump_00f_58c8:
    call Call_000_0db5
    ld a, [$d7a0]
    cp $00
    jp z, Jump_00f_58c3

    dec a
    ld [$d7a0], a
    ld a, SND_MAP_NAV
    call PlaySound
    ld a, [$d79e]
    add $03
    ld c, a
    ld a, [$d7a0]
    sla a
    ld b, a
    ld a, [$d79f]
    and $01
    xor $01
    add b
    sub c
    jp nc, Jump_00f_58c3

    ld a, [$d79e]
    cp $00
    jp z, Jump_00f_58b8

    dec a
    ld [$d79e], a
    ld a, [$d79e]
    cp $00
    jp z, Jump_00f_58b8

    dec a
    ld [$d79e], a
    ld a, [$d79e]
    cp $00
    jp z, Jump_00f_58b8

    dec a
    ld [$d79e], a
    jp Jump_00f_58b8


    ld a, [$d79e]
    cp $00
    jp z, Jump_00f_58b8

    dec a
    ld [$d79e], a
    jp Jump_00f_58b8


Jump_00f_592a:
    call Call_000_0db5
    ld a, [$d90e]
    dec a
    ld b, a
    ld a, [$d7a0]
    cp b
    jp nc, Jump_00f_58c3

    inc a
    ld [$d7a0], a
    ld a, SND_MAP_NAV
    call PlaySound
    ld a, [$d79e]
    add $0d
    ld c, a
    ld a, [$d7a0]
    sla a
    ld b, a
    ld a, [$d79f]
    and $01
    xor $01
    add b
    sub c
    jp c, Jump_00f_58c3

    ld a, [$d90e]
    sla a
    inc a
    ld b, a
    ld a, [$d79e]
    add $12
    sub b
    jp nc, Jump_00f_58b8

    ld a, [$d79e]
    inc a
    ld [$d79e], a
    ld a, [$d90e]
    sla a
    inc a
    ld b, a
    ld a, [$d79e]
    add $12
    sub b
    jp nc, Jump_00f_58b8

    ld a, [$d79e]
    inc a
    ld [$d79e], a
    ld a, [$d90e]
    sla a
    inc a
    ld b, a
    ld a, [$d79e]
    add $12
    sub b
    jp nc, Jump_00f_58b8

    ld a, [$d79e]
    inc a
    ld [$d79e], a
    jp Jump_00f_58b8


    ld a, [$d90e]
    sla a
    inc a
    ld b, a
    ld a, [$d79e]
    add $12
    sub b
    jp nc, Jump_00f_58b8

    ld a, [$d79e]
    inc a
    ld [$d79e], a
    jp Jump_00f_58b8


Jump_00f_59bc:
    call Call_000_0db5
    ld a, [$d79f]
    cp $00
    jp z, Jump_00f_58c3

    dec a
    ld [$d79f], a
    ld a, SND_MAP_NAV
    call PlaySound
    ld a, [$d79d]
    add $04
    ld c, a
    ld a, [$d79f]
    sla a
    sub c
    jp nc, Jump_00f_58c3

    ld a, [$d79d]
    cp $00
    jp z, Jump_00f_58b8

    dec a
    ld [$d79d], a
    ld a, [$d79d]
    cp $00
    jp z, Jump_00f_58b8

    dec a
    ld [$d79d], a
    ld a, [$d79d]
    cp $00
    jp z, Jump_00f_58b8

    dec a
    ld [$d79d], a
    ld a, [$d79d]
    cp $00
    jp z, Jump_00f_58b8

    dec a
    ld [$d79d], a
    jp Jump_00f_58b8


Jump_00f_5a12:
    call Call_000_0db5
    ld a, [$d90d]
    dec a
    ld b, a
    ld a, [$d79f]
    cp b
    jp nc, Jump_00f_58c3

    inc a
    ld [$d79f], a
    ld a, SND_MAP_NAV
    call PlaySound
    ld a, [$d79d]
    add $0f
    ld c, a
    ld a, [$d79f]
    sla a
    sub c
    jp c, Jump_00f_58c3

    ld a, [$d90d]
    sla a
    ld b, a
    ld a, [$d79d]
    add $14
    sub b
    jp nc, Jump_00f_58b8

    ld a, [$d79d]
    inc a
    ld [$d79d], a
    ld a, [$d90d]
    sla a
    ld b, a
    ld a, [$d79d]
    add $14
    sub b
    jp nc, Jump_00f_58b8

    ld a, [$d79d]
    inc a
    ld [$d79d], a
    ld a, [$d90d]
    sla a
    ld b, a
    ld a, [$d79d]
    add $14
    sub b
    jp nc, Jump_00f_58b8

    ld a, [$d79d]
    inc a
    ld [$d79d], a
    ld a, [$d90d]
    sla a
    ld b, a
    ld a, [$d79d]
    add $14
    sub b
    jp nc, Jump_00f_58b8

    ld a, [$d79d]
    inc a
    ld [$d79d], a
    jp Jump_00f_58b8


Call_00f_5a94::
    ld hl, $ccf0
    ld bc, $02c0

jr_00f_5a9a:
    ld a, [hl]
    cp $ff
    jr z, jr_00f_5aa2

    and $df
    ld [hl], a

jr_00f_5aa2:
    inc hl
    inc hl
    inc hl
    dec bc
    ld a, c
    or b
    jr nz, jr_00f_5a9a

    ret


Call_00f_5aab::
    push af
    ld a, $00
    jr jr_00f_5ab8


Call_00f_5ab0::
    push af
    ld a, $01
    jr jr_00f_5ab8


Call_00f_5ab5::
    push af
    ld a, $02

jr_00f_5ab8:
    ld hl, $ccf0
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld bc, $02c0
    pop af
    ld d, a

jr_00f_5ac6:
    ld a, [hl]
    cp $ff
    jr z, jr_00f_5acd

    ld a, d
    ld [hl], a

jr_00f_5acd:
    inc hl
    inc hl
    inc hl
    dec bc
    ld a, c
    or b
    jr nz, jr_00f_5ac6

    ret


Call_00f_5ad6::
    ld a, $00
    ld [$db16], a
    ld hl, $ccf0
    ld bc, $02c0

jr_00f_5ae1:
    ld a, [hl]
    cp $ff
    jr z, jr_00f_5b4d

    inc hl
    ld a, [hl]
    dec hl
    cp $00
    jr z, jr_00f_5b4d

    ld a, [hl]
    and $0f
    ld d, a
    ld a, [$d911]
    cp d
    jp nz, Jump_00f_5b11

    push hl
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    and $1f
    pop hl
    cp $12
    jr z, jr_00f_5b35

    cp $13
    jr z, jr_00f_5b35

    cp $14
    jr z, jr_00f_5b35

    jr jr_00f_5b4d

Jump_00f_5b11:
    ld a, [$d910]
    cp d
    jr z, jr_00f_5b35

    ld a, d
    cp $0c
    jr nz, jr_00f_5b35

    push hl
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    and $1f
    pop hl
    cp $12
    jr z, jr_00f_5b35

    cp $13
    jr z, jr_00f_5b35

    cp $14
    jr z, jr_00f_5b35

    jr jr_00f_5b4d

jr_00f_5b35:
    ld a, [hl]
    or $20
    ld [hl], a
    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    cp $ff
    jr nz, jr_00f_5b4d

    ld a, [$db16]
    cp $02
    jr z, jr_00f_5b4d

    inc a
    ld [$db16], a

jr_00f_5b4d:
    inc hl
    inc hl
    inc hl
    dec bc
    ld a, c
    or b
    jr nz, jr_00f_5ae1

    ret


Call_00f_5b56::
    call Call_000_1490
    cp $ff
    jp z, Jump_00f_5c21

    ld b, a
    call Call_000_099b
    ld a, [hl]
    cp $ff
    jp z, Jump_00f_5c4c

    and $80
    ld c, a
    ld a, [$d90f]
    cp c
    jp nz, Jump_00f_5c4c

    inc hl
    ld a, [hl]
    and $e0
    cp $00
    jp nz, Jump_00f_5c4c

    inc hl
    ld a, [hl]
    bit 5, a
    jp nz, Jump_00f_5c4c

    bit 6, a
    jp nz, Jump_00f_5c4c

    dec hl
    dec hl
    ld a, [hl]
    and $1f
    cp $15
    jp nz, Jump_00f_5bbb

    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    and $1f
    cp $00
    jp z, Jump_00f_5be5

    cp $11
    jp z, Jump_00f_5be5

    cp $14
    jp z, Jump_00f_5c4c

    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_ABCD
    cp UNIT_INFANTRY
    jp nz, Jump_00f_5c4c

    jr jr_00f_5be5

Jump_00f_5bbb:
    cp $16
    jp nz, Jump_00f_5c4c

    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    and $1f
    cp $00
    jp z, Jump_00f_5be5

    cp $11
    jp z, Jump_00f_5be5

    cp $15
    jp z, Jump_00f_5be5

    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    bit UNIT_IS_AIR_F, a
    jr nz, jr_00f_5c4c

Jump_00f_5be5:
jr_00f_5be5:
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
    and $c0
    or $40
    ld [hl+], a
    inc hl
    ld a, b
    ld [hl], a
    ld a, $00
    ret


Jump_00f_5c21:
    ld a, [$d87b]
    ld hl, $d87e
    call AddAToHL
    ld a, [hl]
    call Call_000_099b
    ld a, [$d90f]
    ld b, a
    ld a, [hl]
    and $1f
    or b
    or $40
    ld [hl+], a
    ld a, [$d79f]
    ld [hl+], a
    ld a, [hl]
    and $e0
    ld b, a
    ld a, [$d7a0]
    or b
    ld [hl], a
    call Call_000_1630
    ld a, $00
    ret


Jump_00f_5c4c:
jr_00f_5c4c:
    ld a, $01
    ret


Call_00f_5c4f::
    ld b, a
    call Call_000_099b
    ld a, [hl]
    cp $ff
    jp z, Jump_00f_5ddc

    and $80
    ld c, a
    ld a, [$d90f]
    cp c
    jp nz, Jump_00f_5ddc

    inc hl
    ld a, [hl]
    and $e0
    cp $00
    jp nz, Jump_00f_5ddc

    inc hl
    ld a, [hl]
    bit 6, a
    jp nz, Jump_00f_5ddc

    bit 5, a
    jp nz, Jump_00f_5ddc

    dec hl
    dec hl
    ld a, [hl]
    and $1f
    cp $15
    jp nz, Jump_00f_5cb6

    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    bit 5, a
    jp nz, Jump_00f_5ddc

    ld a, [hl]
    and $1f
    cp $00
    jp z, Jump_00f_5ceb

    cp $11
    jp z, Jump_00f_5ceb

    cp $14
    jp z, Jump_00f_5ddc

    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_ABCD
    cp UNIT_INFANTRY
    jp nz, Jump_00f_5ddc

    jr jr_00f_5ceb

Jump_00f_5cb6:
    cp $16
    jp nz, Jump_00f_5ddc

    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    bit 5, a
    jp nz, Jump_00f_5ddc

    ld a, [hl]
    and $1f
    cp $00
    jp z, Jump_00f_5ceb

    cp $11
    jp z, Jump_00f_5ceb

    cp $15
    jp z, Jump_00f_5ceb

    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    bit UNIT_IS_AIR_F, a
    jp nz, Jump_00f_5ddc

Jump_00f_5ceb:
jr_00f_5ceb:
    ld a, b
    ld [$d870], a
    ld a, SND_ACTION_OPEN
    call PlaySound
    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    ld a, [hl]
    ld b, a
    ld a, [$d79f]
    ld [hl+], a
    ld a, [hl]
    ld c, a
    and $e0
    ld d, a
    ld a, [$d7a0]
    or d
    ld [hl+], a
    push bc
    call Call_000_12f0
    call Call_000_1430
    ld a, $02
    ld [$d879], a
    ld a, [$d7b5]
    ld [$d878], a

jr_00f_5d1d:
    call Call_000_0abb
    call Call_000_14b0
    call Call_000_085d
    call Call_000_14b0
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_00f_5d3a

    bit 1, a
    jp nz, Jump_00f_5d63

    jr jr_00f_5d1d

Jump_00f_5d3a:
    ld a, $00
    ld [$d879], a
    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    pop bc
    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl+], a

Jump_00f_5d4b:
    call Call_000_0abb
    call Call_000_14b0
    call Call_000_085d
    call Call_000_14b0
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_00f_5d4b

    jr jr_00f_5dad

Jump_00f_5d63:
    ld a, $00
    ld [$d879], a
    ld a, SND_PASS_MISMATCH
    call PlaySound
    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    pop bc
    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl+], a

Jump_00f_5d79:
    call Call_000_0abb
    call Call_000_14b0
    call Call_000_085d
    call Call_000_14b0
    call Call_000_079c
    ldh a, [$8c]
    bit 1, a
    jp nz, Jump_00f_5d79

    ld a, SND_MENU_CANCEL
    call PlaySound
    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    ld a, [$d7b6]
    ld [hl+], a
    ld a, [hl]
    and $e0
    ld b, a
    ld a, [$d7b7]
    and $1f
    or b
    ld [hl+], a
    ld a, $00
    ret


jr_00f_5dad:
    ld a, [$d870]
    ld b, a
    ld a, SND_ACTION_OPEN
    call PlaySound
    ld a, b
    call Call_000_099b
    inc hl
    inc hl
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
    inc hl
    ld a, [hl]
    and $80
    or $40
    ld [hl+], a
    inc hl
    ld a, b
    ld [hl+], a
    ld a, $00
    ret


Jump_00f_5ddc:
    ld a, $01
    ret


FlagLocations:
    db $0b, $0b, $09, $0a, $07, $0a, $05, $09, $03, $09, $06, $07, $08, $07, $0a, $06
    db $0c, $06, $0d, $07, $0f, $07, $0f, $05, $0e, $04, $0d, $03, $0b, $02, $09, $01

DrawFlags::
    ld a, [$d86f]
    inc a
    ld [$d86f], a
    ld a, [$d79a]
    ld [$d871], a
    cp MAP_END_B
    jr c, .basic  ; not advanced

    sub MAP_BEGIN_C

.basic
    ld [$d871], a
    cp MAP_END_A
    jr c, .story  ; not legend

    sub MAP_BEGIN_B
    ld [$d871], a

.story
    ld b, $00

.next
    push bc
    ld a, b
    sla a
    ld hl, FlagLocations
    call AddAToHL
    ld a, [hl+]
    sla a
    sla a
    sla a
    add $08
    ld d, a
    ld a, [hl]
    sla a
    sla a
    sla a
    add $10
    ld e, a
    ld a, [$d86f]
    srl a
    srl a
    and $03
    sla a
    add $18
    ld c, a
    ld a, b
    sla a
    push af
    push bc
    push de
    call Call_000_08ff
    pop de
    ld a, e
    add $08
    ld e, a
    pop bc
    inc c
    pop af
    inc a
    call Call_000_08ff
    pop bc
    inc b
    ld a, [$d871]
    inc a
    ld c, a
    ld a, b
    cp c
    jp c, .next

    call Call_000_11e8
    ld hl, $d7a9
    ld a, l
    ld [$d7c1], a
    ld a, h
    ld [$d7c2], a
    ld a, $20
    ld d, $10
    ld e, $86
    ld b, $06
    call Call_000_14f0
    ret


Call_00f_5e87::
    call Call_000_1490
    cp $ff
    ret z

    ld [$d86f], a

jr_00f_5e90:
    ld a, [$d86f]
    inc a
    cp $38
    jr nz, jr_00f_5e9a

    ld a, $00

jr_00f_5e9a:
    ld [$d86f], a
    push af
    ld a, [$d7b5]
    ld b, a
    pop af
    cp b
    jr z, jr_00f_5eb2

    call Call_000_099b
    ld a, [hl]
    cp $ff
    jr z, jr_00f_5e90

    bit 5, a
    jr z, jr_00f_5e90

jr_00f_5eb2:
    ld a, [$d86f]
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $1f
    ld [$daff], a
    ld a, [hl+]
    and $1f
    ld [$db00], a
    call Call_000_1710
    ret


Call_00f_5ec9::
    call Call_000_1490
    cp $ff
    ret z

    ld [$d86f], a

jr_00f_5ed2:
    ld a, [$d86f]
    dec a
    cp $ff
    jr nz, jr_00f_5edc

    ld a, $37

jr_00f_5edc:
    ld [$d86f], a
    push af
    ld a, [$d7b5]
    ld b, a
    pop af
    cp b
    jr z, jr_00f_5ef4

    call Call_000_099b
    ld a, [hl]
    cp $ff
    jr z, jr_00f_5ed2

    bit 5, a
    jr z, jr_00f_5ed2

jr_00f_5ef4:
    ld a, [$d86f]
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $1f
    ld [$daff], a
    ld a, [hl+]
    and $1f
    ld [$db00], a
    call Call_000_1710
    ret


Call_00f_5f0b::
    ld a, $00
    ld [$d82d], a
    call Call_00f_5f88
    call SetStdPalette

Jump_00f_5f16:
jr_00f_5f16:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_00f_5f3a

    bit 1, a
    jp nz, Jump_00f_5f3a

    bit 4, a
    jp nz, Jump_00f_5f40

    bit 5, a
    jp nz, Jump_00f_5f64

    call Call_000_085d
    call Call_00f_5f88
    jr jr_00f_5f16

Jump_00f_5f3a:
    ld a, SND_ACTION_ACCEPT
    call PlaySound
    ret


Jump_00f_5f40:
    ld a, [$d82d]
    cp $2d
    jp nc, Jump_00f_5f16

    inc a
    ld [$d82d], a
    ld a, SND_ACTION_NAV
    call PlaySound

Jump_00f_5f51:
    call Call_00f_5f88
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 4, a
    jp nz, Jump_00f_5f51

    jp Jump_00f_5f16


Jump_00f_5f64:
    ld a, [$d82d]
    cp $00
    jp z, Jump_00f_5f16

    dec a
    ld [$d82d], a
    ld a, SND_ACTION_NAV
    call PlaySound

Jump_00f_5f75:
    call Call_00f_5f88
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 5, a
    jp nz, Jump_00f_5f75

    jp Jump_00f_5f16


Call_00f_5f88:
    ld a, [$d86f]
    inc a
    ld [$d86f], a
    ld d, $4c
    ld e, $94
    ld b, $00

Jump_00f_5f95:
    push bc
    push de
    ld a, [$d82d]
    inc a
    add b
    ld h, $00

jr_00f_5f9e:
    sub $0a
    jr c, jr_00f_5fa5

    inc h
    jr jr_00f_5f9e

jr_00f_5fa5:
    ld a, h
    add $04
    ld c, a
    ld a, b
    sla a
    call Call_000_08ff
    pop de
    pop bc
    ld a, d
    add $08
    ld d, a
    push bc
    push de
    ld a, [$d82d]
    inc a
    add b
    ld h, $00

jr_00f_5fbe:
    sub $0a
    jr c, jr_00f_5fc5

    inc h
    jr jr_00f_5fbe

jr_00f_5fc5:
    add $0a
    add $04
    ld c, a
    ld a, b
    sla a
    inc a
    call Call_000_08ff
    pop de
    pop bc
    ld a, d
    add $0a
    ld d, a
    inc b
    ld a, b
    cp $05
    jp nz, Jump_00f_5f95

    ld d, $54
    ld a, [$d82d]
    sla a
    ld hl, $d7c5
    call AddAToHL
    ld b, $00

Jump_00f_5fed:
    ld a, [hl+]
    ld c, a
    cp $1c
    jr c, jr_00f_5ffd

    ld e, $00
    cp $ff
    jr z, jr_00f_6007

    ld e, $2f
    jr jr_00f_6007

jr_00f_5ffd:
    sla a
    add c
    ld c, a
    ld a, $7a
    sub c
    add $10
    ld e, a

jr_00f_6007:
    ld a, [$d86f]
    srl a
    srl a
    and $01
    add $7c
    ld c, a
    ld a, b
    sla a
    add $0c
    push bc
    push de
    push hl
    call Call_000_08ff
    pop hl
    pop de
    pop bc
    ld a, [hl+]
    ld c, a
    cp $1c
    jr c, jr_00f_6031

    ld e, $00
    cp $ff
    jr z, jr_00f_603b

    ld e, $2f
    jr jr_00f_603b

jr_00f_6031:
    sla a
    add c
    ld c, a
    ld a, $7a
    sub c
    add $10
    ld e, a

jr_00f_603b:
    ld a, [$d86f]
    srl a
    srl a
    and $01
    add $7e
    ld c, a
    ld a, b
    sla a
    add $0d
    push bc
    push de
    push hl
    call Call_000_08ff
    pop hl
    pop de
    pop bc
    ld a, d
    add $10
    ld d, a
    inc b
    ld a, b
    cp $05
    jp nz, Jump_00f_5fed

    ret


Call_00f_6061::
    push af
    call Call_000_099b
    ld a, [hl+]
    ld [$d86f], a
    bit 7, a
    jr nz, jr_00f_608a

    pop af
    ld [$d82e], a
    ld de, $d832
    push de
    ld de, $d842
    push de
    ld de, $d844
    push de
    ld de, $d848
    push de
    ld de, $d830
    push de
    ld de, $d846
    jr jr_00f_60a5

jr_00f_608a:
    pop af
    ld [$d82f], a
    ld de, $d83a
    push de
    ld de, $d843
    push de
    ld de, $d845
    push de
    ld de, $d849
    push de
    ld de, $d831
    push de
    ld de, $d847

jr_00f_60a5:
    ld a, [hl+]
    and $1f
    ld b, a
    ld a, [hl+]
    and $1f
    ld c, a
    inc hl
    inc hl
    ld a, [hl]
    ld [de], a
    ld [$d871], a
    pop de
    call Call_000_0969
    ld a, [hl]
    and $0f
    ld [de], a
    ld a, [$d86f]
    and $1f
    call GetUnit
    ld a, UNIT_SHIFT_KIND
    call AddAToHL
    pop de
    ld a, [hl+]
    ld [de], a
    pop de
    ld a, [hl+]
    ld [de], a
    pop de
    ld a, [hl+]
    cp $00
    jr nz, jr_00f_60d7

    inc hl
    ld a, [hl]

jr_00f_60d7:
    ld [de], a
    pop hl
    ld a, [$d871]
    ld b, a
    cp $00
    jr z, jr_00f_60e7

jr_00f_60e1:
    ld a, $01
    ld [hl], a
    dec b
    jr nz, jr_00f_60e1

jr_00f_60e7:
    ld a, [$d871]
    ld b, a
    ld a, $08
    sub b
    ld b, a
    cp $00
    jr z, jr_00f_60f9

jr_00f_60f3:
    ld a, $00
    ld [hl], a
    dec b
    jr nz, jr_00f_60f3

jr_00f_60f9:
    ret


Call_00f_60fa::
    ld hl, $d832
    ld de, $d83a
    ld b, $08

jr_00f_6102:
    ld a, $00
    ld [hl+], a
    ld [de], a
    inc de
    dec b
    jr nz, jr_00f_6102

    ld hl, $d832
    ld a, [$d846]
    ld b, a
    cp $00
    jr z, jr_00f_611b

jr_00f_6115:
    ld a, $01
    ld [hl+], a
    dec b
    jr nz, jr_00f_6115

jr_00f_611b:
    ld hl, $d83a
    ld a, [$d847]
    ld b, a
    cp $00
    jr z, jr_00f_612c

jr_00f_6126:
    ld a, $01
    ld [hl+], a
    dec b
    jr nz, jr_00f_6126

jr_00f_612c:
    ret


Call_00f_612d::
    ld hl, $d832
    ld a, [$d846]
    call Call_00f_6168
    ld hl, $d83a
    ld a, [$d847]
    call Call_00f_6168
    ld hl, $d832
    ld c, $00
    ld b, $08

jr_00f_6146:
    ld a, [hl+]
    cp $00
    jr z, jr_00f_614c

    inc c

jr_00f_614c:
    dec b
    jr nz, jr_00f_6146

    ld a, c
    ld [$d846], a
    ld hl, $d83a
    ld c, $00
    ld b, $08

jr_00f_615a:
    ld a, [hl+]
    cp $00
    jr z, jr_00f_6160

    inc c

jr_00f_6160:
    dec b
    jr nz, jr_00f_615a

    ld a, c
    ld [$d847], a
    ret


Call_00f_6168:
    cp $00
    ret z

    ld b, a

jr_00f_616c:
    ld a, [hl]
    cp $00
    jr z, jr_00f_617e

    cp $01
    jr z, jr_00f_617e

    cp $0d
    jr z, jr_00f_617c

    inc a
    jr jr_00f_617e

jr_00f_617c:
    ld a, $00

jr_00f_617e:
    ld [hl+], a
    dec b
    jr nz, jr_00f_616c

    ret


Call_00f_6183::
    ld b, $07
    ld c, $01
    call Call_000_093f
    ld a, [$d846]
    call Call_00f_619e
    ld b, $0b
    ld c, $01
    call Call_000_093f
    ld a, [$d847]
    call Call_00f_619e
    ret


Call_00f_619e:
    sla a
    sla a
    add $1f
    xor $80
    ld [hl+], a
    inc a
    ld [hl], a
    inc a
    push af
    ld a, $3f
    call AddAToHL
    pop af
    ld [hl+], a
    inc a
    ld [hl], a
    ret


Call_00f_61b5::
    call Call_000_1c3e
    ld b, $03
    ld c, $0f
    call Call_000_093f
    push hl
    ld a, [$d84a]
    ld e, a
    ld a, [$d84b]
    ld d, a
    call Call_000_1b9e
    pop hl
    ld a, $40
    call AddAToHL
    ld a, [$d84e]
    ld e, a
    ld a, [$d84f]
    ld d, a
    call Call_000_1b9e
    ld b, $10
    ld c, $0f
    call Call_000_093f
    push hl
    ld a, [$d84c]
    ld e, a
    ld a, [$d84d]
    ld d, a
    call Call_000_1b9e
    pop hl
    ld a, $40
    call AddAToHL
    ld a, [$d850]
    ld e, a
    ld a, [$d851]
    ld d, a
    call Call_000_1b9e
    ret


Call_00f_6201::
    ld a, [$d830]
    ld hl, TerrainDefense
    call AddAToHL
    ld a, [hl]
    ld e, a
    ld d, $00
    ld b, $07
    ld c, $10
    call Call_000_093f
    call Call_00f_624a
    ld a, [$d831]
    ld hl, TerrainDefense
    call AddAToHL
    ld a, [hl]
    ld e, a
    ld d, $00
    ld b, $0a
    ld c, $10
    call Call_000_093f
    call Call_00f_624a
    ret


Call_00f_6230::
    ld a, d
    cp $03
    jr c, jr_00f_623f

    jr nz, jr_00f_623c

    ld a, e
    cp $e7
    jr c, jr_00f_623f

jr_00f_623c:
    ld de, $03e7

jr_00f_623f:
    ld b, $64
    call Call_00f_625c
    ld a, c
    add $15
    xor $80
    ld [hl+], a

Call_00f_624a::
    ld b, $0a
    call Call_00f_625c
    ld a, c
    add $15
    xor $80
    ld [hl+], a

Call_00f_6255::
    ld a, e
    add $15
    xor $80
    ld [hl+], a
    ret


Call_00f_625c:
    ld c, $00

jr_00f_625e:
    ld a, d
    cp $00
    jr nz, jr_00f_626b

    ld a, e
    cp b
    ret c

jr_00f_6266:
    sub b
    ld e, a
    inc c
    jr jr_00f_625e

jr_00f_626b:
    ld a, e
    cp b
    jr nc, jr_00f_6266

    sub b
    ld e, a
    dec d
    inc c
    jr jr_00f_625e


Call_00f_6275::
    ld a, [$d7a4]
    and $01
    cp $00
    jr nz, jr_00f_6288

    ld a, [$d8ba]
    ld b, a
    ld a, [$d8bb]
    ld c, a
    jr jr_00f_6290

jr_00f_6288:
    ld a, [$d8ba]
    ld c, a
    ld a, [$d8bb]
    ld b, a

jr_00f_6290:
    push bc
    ld hl, $d832
    ld a, [$d846]
    sub b
    ld b, a
    cp $00
    jr z, jr_00f_62a9

jr_00f_629d:
    ld a, [hl]
    cp $01
    jr nz, jr_00f_62a5

    ld a, $02
    ld [hl], a

jr_00f_62a5:
    inc hl
    dec b
    jr nz, jr_00f_629d

jr_00f_62a9:
    pop bc
    ld hl, $d83a
    ld a, [$d847]
    sub c
    ld b, a
    cp $00
    jr z, jr_00f_62c2

jr_00f_62b6:
    ld a, [hl]
    cp $01
    jr nz, jr_00f_62be

    ld a, $02
    ld [hl], a

jr_00f_62be:
    inc hl
    dec b
    jr nz, jr_00f_62b6

jr_00f_62c2:
    ret


Call_00f_62c3::
    ld a, [$d82e]
    call Call_000_099b
    ld a, [$d846]
    ld [$d86f], a
    call Call_00f_62e2
    ld a, [$d82f]
    call Call_000_099b
    ld a, [$d847]
    ld [$d86f], a
    call Call_00f_62e2
    ret


Call_00f_62e2:
    ld a, [$d86f]
    cp $00
    jr nz, jr_00f_62fa

    ld a, $ff
    ld [hl+], a
    inc hl
    ld a, [hl+]
    bit 5, a
    ret z

    inc hl
    ld a, [hl]
    call Call_000_099b
    ld a, $ff
    ld [hl], a
    ret


jr_00f_62fa:
    inc hl
    inc hl
    push hl
    inc hl
    ld a, [hl]
    cp $0a
    jr nz, jr_00f_6304

    inc a

jr_00f_6304:
    ld [hl], a
    inc hl
    inc hl
    ld a, [$d86f]
    ld [hl], a
    pop hl
    ld a, [hl+]
    bit 5, a
    ret z

    inc hl
    ld a, [hl]
    call Call_000_099b
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    ld b, a
    ld a, [$d86f]
    cp b
    ret nc

    ld [hl], a
    ret


Call_00f_6323::
    ld [$d86f], a
    ld a, [$da8e]
    ld e, a
    ld a, [$da8f]
    ld d, a
    ld hl, ExpCurve
    ld a, [$d8b6]
    srl a
    srl a
    and $07
    call AddAToHL
    ld a, [hl]
    ld l, a
    ld h, $00
    call MulHLByDE
    call DivHLBy10
    ld e, l
    ld d, h
    ld a, [$d86f]
    cp $02
    jr c, .jr_00f_635d

    ld a, [$da96]
    ld l, a
    ld a, [$da97]
    ld h, a
    call AddDEToHL
    ld e, l
    ld d, h

.jr_00f_635d
    ld a, [$da88]
    ld l, a
    ld h, $00
    call MulHLByDE
    ld a, l
    ld [$d852], a
    ld a, h
    ld [$d853], a
    ld a, [$da94]
    ld e, a
    ld a, [$da95]
    ld d, a
    ld hl, ExpCurve
    ld a, [$d8b8]
    srl a
    srl a
    and $07
    call AddAToHL
    ld a, [hl]
    ld l, a
    ld h, $00
    call MulHLByDE
    call DivHLBy10
    ld e, l
    ld d, h
    ld a, [$d86f]
    cp $01
    jr c, .jr_00f_63a3

    ld a, [$da9e]
    cp $3f
    jr nz, .jr_00f_63a3

    srl d
    rr e

.jr_00f_63a3
    ld a, [$d86f]
    cp $02
    jr c, .jr_00f_63b7

    ld a, [$da98]
    ld l, a
    ld a, [$da99]
    ld h, a
    call AddDEToHL
    ld e, l
    ld d, h

.jr_00f_63b7
    ld a, [$d86f]
    cp $03
    jr c, .jr_00f_640b

    ld a, [$da8c]
    cp $05
    jp z, .Jump_00f_63ef

    ld a, [$da8c]
    ld l, a
    ld a, [$da8d]
    ld h, a
    ld a, $64
    call AddAToHL
    push de
    ld de, $000a
    ld bc, $0000

.jr_00f_63da
    call SubDEFromHL
    jr c, .jr_00f_63e2

    inc bc
    jr .jr_00f_63da

.jr_00f_63e2
    ld h, b
    ld l, c
    pop de
    call MulHLByDE
    call DivHLBy10
    ld e, l
    ld d, h
    jr .jr_00f_640b

.Jump_00f_63ef
    ld h, d
    ld l, e
    ld a, 50
    call AddAToHL
    call DivHLBy100
    push de
    ld a, [$da8c]
    ld e, a
    ld a, [$da8d]
    ld d, a
    call MulHLByDE
    pop de
    call AddDEToHL
    ld d, h
    ld e, l

.jr_00f_640b
    ld a, [$da89]
    ld l, a
    ld h, $00
    call MulHLByDE
    ld e, l
    ld d, h
    push de
    pop hl
    ld a, l
    ld [$d858], a
    ld a, h
    ld [$d859], a
    ld a, [$da90]
    ld e, a
    ld a, [$da91]
    ld d, a
    ld hl, ExpCurve
    ld a, [$d8b8]
    srl a
    srl a
    call AddAToHL
    ld a, [hl]
    ld l, a
    ld h, $00
    call MulHLByDE
    call DivHLBy10
    ld e, l
    ld d, h
    ld a, [$d86f]
    cp $01
    jr c, .jr_00f_6453

    ld a, [$da9e]
    cp $3f
    jr nz, .jr_00f_6453

    srl d
    rr e

.jr_00f_6453
    ld a, [$da89]
    ld l, a
    ld h, $00
    call MulHLByDE
    ld a, l
    ld [$d854], a
    ld a, h
    ld [$d855], a
    ld a, [$da92]
    ld e, a
    ld a, [$da93]
    ld d, a
    ld hl, ExpCurve
    ld a, [$d8b6]
    srl a
    srl a
    call AddAToHL
    ld a, [hl]
    ld l, a
    ld h, $00
    call MulHLByDE
    call DivHLBy10
    ld e, l
    ld d, h
    ld a, [$d86f]
    cp $03
    jr c, .jr_00f_64d8

    ld a, [$da8a]
    cp $05
    jr z, .jr_00f_64bc

    ld a, [$da8a]
    ld l, a
    ld a, [$da8b]
    ld h, a
    ld a, $64
    call AddAToHL
    push de
    ld de, $000a
    ld bc, $0000

.jr_00f_64a7
    call SubDEFromHL
    jr c, .jr_00f_64af

    inc bc
    jr .jr_00f_64a7

.jr_00f_64af
    ld h, b
    ld l, c
    pop de
    call MulHLByDE
    call DivHLBy10
    ld e, l
    ld d, h
    jr .jr_00f_64d8

.jr_00f_64bc
    ld h, d
    ld l, e
    ld a, 50
    call AddAToHL
    call DivHLBy100
    push de
    ld a, [$da8a]
    ld e, a
    ld a, [$da8b]
    ld d, a
    call MulHLByDE
    pop de
    call AddDEToHL
    ld d, h
    ld e, l

.jr_00f_64d8
    ld a, [$da88]
    ld l, a
    ld h, $00
    call MulHLByDE
    ld e, l
    ld d, h
    ld a, l
    ld [$d856], a
    ld a, h
    ld [$d857], a
    call Call_00f_64ef
    ret


Call_00f_64ef:
    ld a, [$d7a4]
    and $01
    cp $00
    jp nz, Jump_00f_652a

    ld a, [$d852]
    ld [$d84a], a
    ld a, [$d853]
    ld [$d84b], a
    ld a, [$d856]
    ld [$d84e], a
    ld a, [$d857]
    ld [$d84f], a
    ld a, [$d854]
    ld [$d84c], a
    ld a, [$d855]
    ld [$d84d], a
    ld a, [$d858]
    ld [$d850], a
    ld a, [$d859]
    ld [$d851], a
    ret


Jump_00f_652a:
    ld a, [$d852]
    ld [$d84c], a
    ld a, [$d853]
    ld [$d84d], a
    ld a, [$d856]
    ld [$d850], a
    ld a, [$d857]
    ld [$d851], a
    ld a, [$d854]
    ld [$d84a], a
    ld a, [$d855]
    ld [$d84b], a
    ld a, [$d858]
    ld [$d84e], a
    ld a, [$d859]
    ld [$d84f], a
    ret


data_00f_655b:
    db $4e, $78
    db $54, $7b
    db $54, $81
    db $4e, $84
    db $48, $81
    db $48, $7b

Call_00f_6567::
    ld a, [$da9e]
    ld c, a
    ld hl, data_00f_655b
    ld a, $00
    ld [$d86f], a
    call Call_00f_6577
    ret


Call_00f_6577:
    ld b, $00

jr_00f_6579:
    push bc
    push hl
    ld a, c
    and $01
    cp $00
    jr z, jr_00f_6599

    ld a, b
    sla a
    call AddAToHL
    ld a, [hl+]
    add $06
    ld d, a
    ld a, [hl]
    add $0e
    ld e, a
    ld a, [$d86f]
    add b
    ld c, $10
    call Call_000_08ff

jr_00f_6599:
    pop hl
    pop bc
    srl c
    inc b
    ld a, b
    cp $06
    jr nz, jr_00f_6579

    ret


data_00f_65a4:
    db $3e, $78
    db $44, $7b
    db $44, $81
    db $3e, $84
    db $38, $81
    db $38, $7b

data_00f_65b0:
    db $5e, $78
    db $64, $7b
    db $64, $81
    db $5e, $84
    db $58, $81
    db $58, $7b


Call_00f_65bc::
    ld a, [$da9a]
    ld c, a
    ld a, [$d90f]
    cp $00
    jr z, jr_00f_65cb

    ld a, [$da9c]
    ld c, a

jr_00f_65cb:
    ld hl, data_00f_65a4
    ld a, $00
    ld [$d86f], a
    call Call_00f_6577
    ld a, [$da9a]
    ld c, a
    ld a, [$d90f]
    cp $00
    jr nz, jr_00f_65e5

    ld a, [$da9c]
    ld c, a

jr_00f_65e5:
    ld hl, data_00f_65b0
    ld a, $08
    ld [$d86f], a
    call Call_00f_6577
    ret


data_00f_65f1:
    db $00, $08, "  NECTARIS STAFFS", $ff
    db $ff

data_00f_6606:
    db $00, $08, " Executive Producer", $ff
    db $00, $0a, " Shinichi Nakamoto", $ff
    db $ff

data_00f_6632:
    db $00, $08, "      Director", $ff
    db $00, $0a, "    Mikio Ueyama", $ff
    db $ff

data_00f_6657:
    db $00, $08, "  Project Manager", $ff
    db $00, $0a, " Yasutaka Kakiseko", $ff
    db $ff

data_00f_6681:
    db $00, $08, "  Quality Control", $ff
    db $00, $0a, "  Takashi Miyauchi", $ff
    db $ff

data_00f_66ab:
    db $00, $07, "       Staffs", $ff
    db $00, $09, "  Shin(Four)Sasaki", $ff
    db $00, $0a, "  Misuzu Kobayashi", $ff
    db $00, $0b, "   Naoki Yamashita", $ff
    db $ff

data_00f_66fb:
    db $00, $08, "   MUSIC COMPOSER", $ff
    db $00, $0a, " JUN CHIKI CHIKUMA", $ff
    db $ff

data_00f_6725:
    db $00, $07, "    SOUND STAFFS", $ff
    db $00, $09, "HIROMICHI FURUYA", $ff
    db $00, $0a, " HIROYUKI TSUBOGUCHI", $ff
    db $00, $0b, "      AYA TANAKA", $ff
    db $ff

data_00f_6776:
    db $00, $07, "    PROGRAMMERS", $ff
    db $00, $09, "   ATSHSHI KANAO", $ff
    db $00, $0a, "MICHIKATSU NOHARA", $ff
    db $ff

data_00f_67b0:
    db $00, $07, "     GRAPHICERS", $ff
    db $00, $09, "    KUNIKO KOIZUMI", $ff
    db $00, $0a, "     ASUKA FUJITA", $ff
    db $00, $0b, " HIROMITSU SUGA", $ff
    db $ff

data_00f_67fe:
    db $00, $08, " First Prize Winner", $ff
    db $00, $0a, "   Sadao Tsutsui", $ff
    db $ff

data_00f_6828:
    db $00, $08, "Second Prize Winners", $ff
    db $00, $0a, "     Tai Suzuki", $ff
    db $00, $0b, " Tetsuya Haraguchi", $ff
    db $ff

data_00f_6867:
    db $00, $04, "      Winners", $ff
    db $00, $06, " Tsuyoshi Ikebe", $ff
    db $00, $07, "  Kouichi Inoue", $ff
    db $00, $08, "  Keisuke Iwamoto", $ff
    db $00, $09, "  Yousuke Ura", $ff
    db $00, $0a, "    Naoya Oikawa", $ff
    db $00, $0b, "    Junya Kamezima", $ff
    db $00, $0c, " Shinichi Shinohara", $ff
    db $ff

data_00f_68fe:
    db $00, $04, "      Winners", $ff
    db $00, $06, " Masayuki Sezaki", $ff
    db $00, $07, "Yoshinori Daikou", $ff
    db $00, $08, "  Hiroaki Takagi", $ff
    db $00, $09, "    Sadao Tsutsui", $ff
    db $00, $0a, " Takahiro Nagano", $ff
    db $00, $0b, "    Takao Yamamoto", $ff
    db $00, $0c, "      Ken Yoshida", $ff
    db $ff

data_00f_6998:
    db $00, $08, "   Special Thanks", $ff
    db $00, $0a, "   Kenichi Sakai", $ff
    db $ff

data_00f_69c0:
    db $00, $07, "   Special Thanks", $ff
    db $00, $09, "  Hirokazu Hamamura", $ff
    db $00, $0a, " Yoshinobu Takahashi", $ff
    db $00, $0b, "    Weekly FAMITSU", $ff
    db $00, $0c, "     LOGIN Magazine", $ff
    db $ff


Call_00f_6a2d::
    call Call_000_1c9e
    ld a, $ff
    ld [$db08], a
    ld a, MUSIC_EPILOGUE
    call PlayMusic

jr_00f_6a3a:
    ld hl, data_00f_65f1
    call Call_00f_6b8b
    ld a, $04
    call Call_000_0c65
    ld hl, data_00f_6606
    call Call_00f_6b8b
    ld a, $04
    call Call_000_0c65
    ld hl, data_00f_6632
    call Call_00f_6b8b
    ld a, $04
    call Call_000_0c65
    ld hl, data_00f_6657
    call Call_00f_6b8b
    ld a, $04
    call Call_000_0c65
    ld hl, data_00f_6681
    call Call_00f_6b8b
    ld a, $04
    call Call_000_0c65

jr_00f_6a71:
    ld hl, data_00f_66ab
    call Call_00f_6b8b
    ld a, $04
    call Call_000_0c65
    ld hl, data_00f_66fb
    call Call_00f_6b8b
    ld a, $04
    call Call_000_0c65
    ld hl, data_00f_6725
    call Call_00f_6b8b
    ld a, $04
    call Call_000_0c65
    ld hl, data_00f_6776
    call Call_00f_6b8b
    ld a, $04
    call Call_000_0c65
    ld hl, data_00f_67b0
    call Call_00f_6b8b
    ld a, $04
    call Call_000_0c65
    ld hl, data_00f_67fe
    call Call_00f_6b8b
    ld a, $04
    call Call_000_0c65
    ld hl, data_00f_6828
    call Call_00f_6b8b
    ld a, $04
    call Call_000_0c65
    ld hl, data_00f_6867
    call Call_00f_6b8b
    ld a, $04
    call Call_000_0c65
    ld hl, data_00f_68fe
    call Call_00f_6b8b
    ld a, $04
    call Call_000_0c65

jr_00f_6ad4:
    ld hl, data_00f_6998
    call Call_00f_6b8b
    ld a, $04
    call Call_000_0c65
    ld hl, data_00f_69c0
    call Call_00f_6b8b
    ld a, $19
    call Call_000_0c65
    ret


data_00f_6aeb:
    db " 0123456789=####################"
    db "ABCDEFGHIJKLMNOPQRSTUVWXYZ[]    "
    db " ｧｨｩｪｫｬｭｮｯｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆ"
    db "ﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜｦﾝｰﾟﾞ_    "
    db "abcdefghijklmnopqrstuvwxyz()    "

Call_00f_6b8b:
jr_00f_6b8b:
    push hl
    call Call_000_0933
    pop hl

jr_00f_6b90:
    ld a, [hl+]
    cp $ff
    jr z, jr_00f_6b9d

    ld b, a
    ld a, [hl+]
    ld c, a
    call Call_00f_6b9e
    jr jr_00f_6b90

jr_00f_6b9d:
    ret


Call_00f_6b9e:
    ld a, l
    ld [$d7c1], a
    ld a, h
    ld [$d7c2], a
    call Call_000_093f

jr_00f_6ba9:
    ld a, [$d7c1]
    ld e, a
    ld a, [$d7c2]

jr_00f_6bb0:
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, e
    ld [$d7c1], a
    ld a, d
    ld [$d7c2], a
    ld a, c
    cp $ff
    jr z, jr_00f_6bed

    ld b, $00
    ld de, data_00f_6aeb

jr_00f_6bc6:
    ld a, [de]
    inc de
    cp c
    jr z, jr_00f_6bd3

    inc b
    ld a, b
    cp $a0
    jr nz, jr_00f_6bc6

    ld b, $00

jr_00f_6bd3:
    ld a, b
    xor $80
    ld [hl+], a
    push af
    push bc
    push de
    push hl
    cp $80
    jr z, jr_00f_6be4

    ld a, SND_18
    call PlaySound

jr_00f_6be4:
    call Call_000_0abb
    pop hl
    pop de
    pop bc
    pop af
    jr jr_00f_6ba9

jr_00f_6bed:
    call Call_000_0abb
    call Call_000_0abb
    call Call_000_0abb
    call Call_000_0abb
    call Call_000_0abb
    call Call_000_0abb
    call Call_000_0abb
    call Call_000_0abb
    call Call_000_0abb
    call Call_000_0abb
    ld a, [$d7c1]
    ld l, a
    ld a, [$d7c2]
    ld h, a
    ret


Call_00f_6c14::
    call Call_000_0927
    call Call_00f_6d28
    call Call_00f_6d7b

Jump_00f_6c1d:
jr_00f_6c1d:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_00f_6c4b

    bit 1, a
    jp nz, Jump_00f_6c86

    bit 4, a
    jp nz, Jump_00f_6ce6

    bit 5, a
    jp nz, Jump_00f_6d07

    bit 6, a
    jp nz, Jump_00f_6c9e

    bit 7, a
    jp nz, Jump_00f_6cc2

    call Call_00f_6d7b
    call Call_000_085d
    jr jr_00f_6c1d

Jump_00f_6c4b:
    ld a, SND_MENU_ACCEPT
    call PlaySound
    call Call_000_0927

Jump_00f_6c53:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_00f_6c53

    ld a, [$d8e7]
    ld b, a
    ld a, [$d8e6]
    add b
    ld d, $00
    cp $18
    jr c, jr_00f_6c72

    ld d, $80
    sub $18

jr_00f_6c72:
    cp $00
    jr nz, jr_00f_6c7e

    ld a, $ff
    ld [$d7b4], a
    ld a, $00
    ret


jr_00f_6c7e:
    dec a
    or d
    ld [$d7b4], a
    ld a, $00
    ret


Jump_00f_6c86:
    ld a, SND_MENU_CANCEL
    call PlaySound
    call Call_000_0927

Jump_00f_6c8e:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 1, a
    jp nz, Jump_00f_6c8e

    ld a, $ff
    ret


Jump_00f_6c9e:
    ld a, [$d8e7]
    cp $00
    jp z, Jump_00f_6c1d

    sub $08
    ld [$d8e7], a
    ld a, SND_MENU_NAV
    call PlaySound
    call Call_00f_6d28

jr_00f_6cb3:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 6, a
    jr nz, jr_00f_6cb3

    jp Jump_00f_6c1d


Jump_00f_6cc2:
    ld a, [$d8e7]
    cp $28
    jp z, Jump_00f_6c1d

    add $08
    ld [$d8e7], a
    ld a, SND_MENU_NAV
    call PlaySound
    call Call_00f_6d28

jr_00f_6cd7:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 7, a
    jr nz, jr_00f_6cd7

    jp Jump_00f_6c1d


Jump_00f_6ce6:
    ld a, [$d8e6]
    cp $07
    jp z, Jump_00f_6c1d

    inc a
    ld [$d8e6], a
    ld a, SND_MENU_NAV
    call PlaySound

Jump_00f_6cf7:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 4, a
    jp nz, Jump_00f_6cf7

    jp Jump_00f_6c1d


Jump_00f_6d07:
    ld a, [$d8e6]
    cp $00
    jp z, Jump_00f_6c1d

    dec a
    ld [$d8e6], a
    ld a, SND_MENU_NAV
    call PlaySound

Jump_00f_6d18:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 5, a
    jp nz, Jump_00f_6d18

    jp Jump_00f_6c1d


Call_00f_6d28:
    ld b, $01
    ld c, $0e
    ld d, $10
    ld e, $02
    call Call_000_14d0
    ld a, [$d79d]
    add $02
    ld b, a
    ld a, [$d79e]
    add $0f
    ld c, a
    call Call_000_093f
    ld a, [$d8e7]
    ld c, a
    ld b, $08

jr_00f_6d48:
    push bc
    push hl
    ld b, $a0
    ld a, c
    cp $18
    jr c, jr_00f_6d55

    ld b, $40
    sub $18

jr_00f_6d55:
    cp $00
    jr z, jr_00f_6d6f

    dec a
    sla a
    sla a
    add b
    xor $80
    ld [hl+], a
    inc a
    ld [hl], a
    inc a
    push af
    ld a, $3f
    call AddAToHL
    pop af
    ld [hl+], a
    inc a
    ld [hl], a

jr_00f_6d6f:
    pop hl
    inc hl
    inc hl
    pop bc
    inc c
    dec b
    jr nz, jr_00f_6d48

    call Call_000_0abb
    ret


Call_00f_6d7b:
    ld a, [$d6d2]
    and $0f
    cp $08
    jr nc, jr_00f_6db9

    ld a, [$d8e6]
    sla a
    sla a
    sla a
    sla a
    add $13
    ld d, a
    ld e, $84
    ld c, $00
    ld a, $00
    push de
    call Call_000_08ff
    ld a, d
    add $08
    ld d, a
    ld c, $01
    call Call_000_091a
    pop de
    ld a, e
    add $10
    ld e, a
    ld c, $02
    call Call_000_091a
    ld a, d
    add $08
    ld d, a
    ld c, $03
    call Call_000_091a
    ret


jr_00f_6db9:
    ld a, $00
    ld c, $00
    ld d, $00
    ld e, $00
    call Call_000_08ff
    ld c, $00
    call Call_000_091a
    ld c, $00
    call Call_000_091a
    ld c, $00
    call Call_000_091a
    ret


Call_00f_6dd4::
    ld hl, $d572
    ld c, $38

jr_00f_6dd9:
    ld a, [hl]
    cp $ff
    jr nz, jr_00f_6de2

    ld a, $38
    sub c
    ret


jr_00f_6de2:
    ld a, $06
    call AddAToHL
    dec c
    jr nz, jr_00f_6dd9

    ld a, $ff
    ret


Call_00f_6ded::
    ld [$d86f], a
    ld a, $03
    call Call_000_05c8
    ld [$4000], a
    ei
    ld hl, $d572
    ld de, $a000
    ld bc, $0150
    call Call_000_081a
    ld hl, $d572
    ld bc, $0150
    ld a, $ff
    call Call_000_080f
    ld hl, $a000
    ld de, $d572
    ld c, $00

jr_00f_6e18:
    ld a, [$d86f]
    cp c
    jr nz, jr_00f_6e26

    inc de
    inc de
    inc de
    inc de
    inc de
    inc de
    jr jr_00f_6e32

jr_00f_6e26:
    ld a, [hl]
    cp $ff
    jr nz, jr_00f_6e32

    ld a, $06
    call AddAToHL
    jr jr_00f_6e46

jr_00f_6e32:
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
    jr jr_00f_6e46

jr_00f_6e46:
    inc c
    ld a, c
    cp $38
    jr nz, jr_00f_6e18

    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ret


Call_00f_6e56::
    call Call_000_0927
    call Call_000_1dd5
    call Call_000_1df5

Jump_00f_6e5f:
jr_00f_6e5f:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_00f_6e8d

    bit 1, a
    jp nz, Jump_00f_6ec5

    bit 4, a
    jp nz, Jump_00f_6f22

    bit 5, a
    jp nz, Jump_00f_6f43

    bit 6, a
    jp nz, Jump_00f_6eda

    bit 7, a
    jp nz, Jump_00f_6efe

    call Call_000_1df5
    call Call_000_085d
    jr jr_00f_6e5f

Jump_00f_6e8d:
    ld a, SND_MENU_ACCEPT
    call PlaySound

Jump_00f_6e92:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_00f_6e92

    ld a, [$d8e7]
    ld b, a
    ld a, [$d8e6]
    add b
    ld d, $00
    cp $18
    jr c, jr_00f_6eb1

    ld d, $80
    sub $18

jr_00f_6eb1:
    cp $00
    jr nz, jr_00f_6ebd

    ld a, $ff
    ld [$d7b4], a
    ld a, $00
    ret


jr_00f_6ebd:
    dec a
    or d
    ld [$d7b4], a
    ld a, $00
    ret


Jump_00f_6ec5:
    ld a, SND_MENU_CANCEL
    call PlaySound

Jump_00f_6eca:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 1, a
    jp nz, Jump_00f_6eca

    ld a, $ff
    ret


Jump_00f_6eda:
    ld a, [$d8e7]
    cp $00
    jp z, Jump_00f_6e5f

    sub $08
    ld [$d8e7], a
    ld a, SND_MENU_NAV
    call PlaySound
    call Call_000_1dd5

jr_00f_6eef:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 6, a
    jr nz, jr_00f_6eef

    jp Jump_00f_6e5f


Jump_00f_6efe:
    ld a, [$d8e7]
    cp $10
    jp z, Jump_00f_6e5f

    add $08
    ld [$d8e7], a
    ld a, SND_MENU_NAV
    call PlaySound
    call Call_000_1dd5

jr_00f_6f13:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 7, a
    jr nz, jr_00f_6f13

    jp Jump_00f_6e5f


Jump_00f_6f22:
    ld a, [$d8e6]
    cp $07
    jp z, Jump_00f_6e5f

    inc a
    ld [$d8e6], a
    ld a, SND_MENU_NAV
    call PlaySound

Jump_00f_6f33:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 4, a
    jp nz, Jump_00f_6f33

    jp Jump_00f_6e5f


Jump_00f_6f43:
    ld a, [$d8e6]
    cp $00
    jp z, Jump_00f_6e5f

    dec a
    ld [$d8e6], a
    ld a, SND_MENU_NAV
    call PlaySound

Jump_00f_6f54:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 5, a
    jp nz, Jump_00f_6f54

    jp Jump_00f_6e5f


Call_00f_6f64::
    ld a, [$d79f]
    ld [$db04], a
    ld a, [$d7a0]
    ld [$db05], a
    ld a, [$d79d]
    ld [$db06], a
    ld a, [$d79e]
    ld [$db07], a
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    call Call_000_1a64
    ld b, $02
    ld c, $0e
    call Call_000_093f
    ld a, [$d8e7]
    ld c, a
    ld b, $08

jr_00f_6f94:
    push bc
    push hl
    ld b, $a0
    ld a, c
    cp $18
    jr c, jr_00f_6fa1

    ld b, $40
    sub $18

jr_00f_6fa1:
    cp $00
    jr z, jr_00f_6fbb

    dec a
    sla a
    sla a
    add b
    xor $80
    ld [hl+], a
    inc a
    ld [hl], a
    inc a
    push af
    ld a, $3f
    call AddAToHL
    pop af
    ld [hl+], a
    inc a
    ld [hl], a

jr_00f_6fbb:
    pop hl
    inc hl
    inc hl
    pop bc
    inc c
    dec b
    jr nz, jr_00f_6f94

    call Call_000_0abb
    ld a, [$db04]
    ld [$d79f], a
    ld a, [$db05]
    ld [$d7a0], a
    ld a, [$db06]
    ld [$d79d], a
    ld a, [$db07]
    ld [$d79e], a
    ret


Call_00f_6fdf::
    ld a, [$d6d2]
    and $0f
    cp $08
    jr nc, jr_00f_701d

    ld a, [$d8e6]
    sla a
    sla a
    sla a
    sla a
    add $13
    ld d, a
    ld e, $7c
    ld c, $00
    ld a, $00
    push de
    call Call_000_08ff
    ld a, d
    add $08
    ld d, a
    ld c, $01
    call Call_000_091a
    pop de
    ld a, e
    add $10
    ld e, a
    ld c, $02
    call Call_000_091a
    ld a, d
    add $08
    ld d, a
    ld c, $03
    call Call_000_091a
    ret


jr_00f_701d:
    ld a, $00
    ld c, $00
    ld d, $00
    ld e, $00
    call Call_000_08ff
    ld c, $00
    call Call_000_091a
    ld c, $00
    call Call_000_091a
    ld c, $00
    call Call_000_091a
    ret


Call_00f_7038::
    ld a, SND_ACTION_OPEN
    call PlaySound
    ld a, [$d8e7]
    cp $18
    jr c, jr_00f_7049

    sub $18
    ld [$d8e7], a

jr_00f_7049:
    ld a, $ff
    call Call_000_1d95
    call Call_000_1818

Jump_00f_7051:
jr_00f_7051:
    ld a, $ff
    call Call_000_1d95
    call Call_000_1838
    cp $01
    jp nz, Jump_00f_7079

    ld a, [$d87b]
    cp $ff
    jr z, jr_00f_7051

    ld hl, $d87e
    call AddAToHL
    ld a, [hl]
    call Call_000_099b
    ld a, $ff
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    jr jr_00f_7051

Jump_00f_7079:
    cp $02
    jp nz, Jump_00f_7083

    call Call_000_1db5
    jr jr_00f_7051

Jump_00f_7083:
    cp $03
    jp nz, Jump_00f_708e

    call Call_000_1224
    jp Jump_000_34c1


Jump_00f_708e:
    ld a, [$d7b4]
    cp $ff
    jr z, jr_00f_70d7

    call Call_000_1d75
    cp $ff
    jr z, jr_00f_70ef

    ld a, [$d87b]
    cp $ff
    jr z, jr_00f_70aa

    ld hl, $d87e
    call AddAToHL
    ld a, [hl]

jr_00f_70aa:
    call Call_000_1d95
    call Call_000_1d75
    ld a, [$d7b4]
    ld [hl+], a
    ld a, [$d79f]
    ld b, a
    ld a, [$d87a]
    sla a
    sla a
    sla a
    sla a
    sla a
    or b
    ld [hl+], a
    ld a, [$d7a0]
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $ff
    ld [hl+], a
    ld a, $08
    ld [hl], a
    jp Jump_00f_7051


jr_00f_70d7:
    ld a, [$d87b]
    ld hl, $d87e
    call AddAToHL
    ld a, [hl]
    call Call_000_099b
    ld a, $ff
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    jp Jump_00f_7051


jr_00f_70ef:
    ld a, SND_PASS_MISMATCH
    call PlaySound
    jp Jump_00f_7051


Call_00f_70f7::
    call Call_000_1490
    cp $ff
    ret z

    ld [$d7b5], a
    ld a, [$d7b5]
    call Call_000_1630
    ld a, [$d7b5]
    ld [$d99d], a
    call Call_000_13f0
    call Call_000_1e75
    ld a, [$d910]
    ld b, a
    ld a, [$d911]
    ld c, a
    ld [$d910], a
    ld a, b
    ld [$d911], a
    push bc
    call Call_000_16b0
    pop bc
    ld a, b
    ld [$d910], a
    ld a, c
    ld [$d911], a
    call Call_000_12f0
    ld a, [$d90f]
    push af
    xor $80
    ld [$d90f], a
    call Call_000_1430
    pop af
    ld [$d90f], a
    ld a, $00
    ld [$d7a1], a
    ld a, $01
    ld [$d7b8], a
    call Call_000_0db5
    ld a, $fa
    ld [$d7b8], a
    ld a, [$db17]
    cp $00
    jp nz, Jump_00f_7163

    ld a, [$db16]
    cp $01
    jp c, Jump_00f_7175

Jump_00f_7163:
jr_00f_7163:
    call Call_000_1610
    cp $00
    jr nz, jr_00f_7171

    ld a, SND_ACTION_OPEN
    call PlaySound
    jr jr_00f_717a

jr_00f_7171:
    cp $01
    jr nz, jr_00f_7163

Jump_00f_7175:
    ld a, SND_PASS_MISMATCH
    call PlaySound

jr_00f_717a:
    call Call_000_13f0
    call Call_000_1630
    call Call_000_0927
    ret


Call_00f_7184::
    call Call_000_1490
    cp $ff
    ret z

    ld [$d7b5], a
    ld [$d7c3], a
    call Call_000_346f
    ld a, b
    cp c
    jr c, jr_00f_71bc

    jr jr_00f_7199

jr_00f_7199:
    ld a, [$d7b5]
    call Call_000_099b
    call Call_000_1350
    ld a, $01
    ld [$db1b], a
    call Call_000_15f0
    ld a, [$d90f]
    push af
    xor $80
    ld [$d90f], a
    call Call_000_1d55
    pop af
    ld [$d90f], a
    jr jr_00f_71dd

jr_00f_71bc:
    ld a, [$d7b5]
    call Call_000_099b
    call Call_000_1330
    ld a, $01
    ld [$db1b], a
    call Call_000_15f0
    ld a, [$d90f]
    push af
    xor $80
    ld [$d90f], a
    call Call_000_1d35
    pop af
    ld [$d90f], a

jr_00f_71dd:
    call Call_000_346f
    ld a, b
    cp c
    jr nc, jr_00f_71e5

    ld a, c

jr_00f_71e5:
    cp $02
    jr c, jr_00f_71ec

    call Call_000_1e95

jr_00f_71ec:
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    ld a, $01
    ld [$d7b8], a
    ld a, $00
    ld [$d7a1], a

jr_00f_71ff:
    call Call_000_1610
    cp $00
    jr z, jr_00f_720c

    cp $01
    jr z, jr_00f_720c

    jr jr_00f_71ff

jr_00f_720c:
    ld a, $00
    ld [$db1b], a
    ld a, SND_ACTION_OPEN
    call PlaySound

Jump_00f_7216:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_00f_7216

    call Call_000_0927
    call Call_000_1630
    call Call_000_15b0
    call Call_000_0db5
    ret


Call_00f_7230::
    ld a, [$d7c3]
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $1f
    ld b, a
    ld a, [hl]
    and $1f
    ld c, a
    dec hl
    dec hl
    call Call_00f_7279
    dec b
    call Call_00f_7279
    dec c
    ld a, b
    bit 0, a
    jr z, jr_00f_7251

    call Call_00f_7279

jr_00f_7251:
    inc b
    call Call_00f_7279
    inc b
    ld a, b
    bit 0, a
    jr z, jr_00f_725e

    call Call_00f_7279

jr_00f_725e:
    inc c
    call Call_00f_7279
    inc c
    ld a, b
    bit 0, a
    jr nz, jr_00f_726b

    call Call_00f_7279

jr_00f_726b:
    dec b
    call Call_00f_7279
    dec b
    ld a, b
    bit 0, a
    jr nz, jr_00f_7278

    call Call_00f_7279

jr_00f_7278:
    ret


Call_00f_7279:
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
    ld a, [hl]
    and $cf
    ld [hl], a
    pop bc
    pop hl
    ret


Call_00f_7293::
    call Call_000_1818
    call Call_000_1838
    ret


Call_00f_729a::
    ld a, [$d79f]
    ld [$db04], a
    ld a, [$d7a0]
    ld [$db05], a
    ld a, [$d79d]
    ld [$db06], a
    ld a, [$d79e]
    ld [$db07], a
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    call SetWhitePalette
    call Call_000_1878
    call Call_000_1858
    ld a, $00
    ld [$d87c], a
    ld a, $ff
    ld [$d87b], a
    ld a, $60
    ld [$db03], a
    ld a, [$d87a]
    dec a
    sla a
    ld hl, $d918
    call AddAToHL
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    and $0f
    cp $0b
    jr z, jr_00f_72f5

    cp $0c
    jr z, jr_00f_72f5

    ld a, $00
    ld [$db03], a

jr_00f_72f5:
    call Call_000_0927
    call Call_000_1a0a
    call Call_000_1898
    call Call_000_085d
    call Call_000_085d
    call Call_000_0abb
    call Call_000_085d
    call Call_000_085d
    call SetStdPalette
    ld a, $00
    ld [$d87b], a
    ld a, [$db04]
    ld [$d79f], a
    ld a, [$db05]
    ld [$d7a0], a
    ld a, [$db06]
    ld [$d79d], a
    ld a, [$db07]
    ld [$d79e], a
    ret


Call_00f_732e::
    ld a, [$d79f]
    ld [$db04], a
    ld a, [$d7a0]
    ld [$db05], a
    ld a, [$d79d]
    ld [$db06], a
    ld a, [$d79e]
    ld [$db07], a
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    call Call_000_0927
    call Call_000_1878
    call Call_000_1858
    call Call_000_1898
    call Call_000_1934
    call Call_000_0abb
    ld a, [$d7a7]
    cp $01
    jr z, jr_00f_736f

    ld a, [$d87d]
    cp $00
    jp z, Jump_00f_7507

Jump_00f_736f:
jr_00f_736f:
    call Call_000_1934
    call Call_000_0abb
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_00f_73a7

    bit 1, a
    jp nz, Jump_00f_73e0

    bit 2, a
    jp nz, Jump_00f_73f9

    bit 3, a
    jp nz, Jump_00f_7418

    bit 4, a
    jp nz, Jump_00f_7437

    bit 5, a
    jp nz, Jump_00f_7466

    bit 6, a
    jp nz, Jump_00f_7492

    bit 7, a
    jp nz, Jump_00f_74c9

    jr jr_00f_736f

Jump_00f_73a7:
    ld a, [$d7a7]
    cp $01
    jr z, jr_00f_73c7

    ld a, [$d87b]
    ld hl, $d87e
    call AddAToHL
    ld a, [hl]
    call Call_000_099b
    ld a, [hl]
    bit 6, a
    jr z, jr_00f_73c7

    ld a, SND_MENU_CANCEL
    call PlaySound
    jr jr_00f_736f

jr_00f_73c7:
    ld a, SND_MENU_ACCEPT
    call PlaySound
    call Call_000_0927

jr_00f_73cf:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jr nz, jr_00f_73cf

    ld a, $00
    jp Jump_00f_7514


Jump_00f_73e0:
    ld a, SND_MENU_CANCEL
    call PlaySound
    call Call_000_0927

jr_00f_73e8:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 1, a
    jr nz, jr_00f_73e8

    ld a, $01
    jp Jump_00f_7514


Jump_00f_73f9:
    ld a, [$d7a7]
    cp $00
    jp z, Jump_00f_736f

    ld a, SND_MENU_ACCEPT
    call PlaySound

Jump_00f_7406:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 2, a
    jp nz, Jump_00f_7406

    ld a, $02
    jp Jump_00f_7514


Jump_00f_7418:
    ld a, [$d7a7]
    cp $00
    jp z, Jump_00f_736f

    ld a, SND_MENU_ACCEPT
    call PlaySound

Jump_00f_7425:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 3, a
    jp nz, Jump_00f_7425

    ld a, $03
    jp Jump_00f_7514


Jump_00f_7437:
    ld a, [$d87d]
    ld b, a
    ld a, [$d87b]
    inc a
    cp b
    jp nc, Jump_00f_736f

    ld c, a
    and $03
    cp $00
    jp z, Jump_00f_736f

    ld a, c
    ld [$d87b], a
    ld a, SND_MENU_NAV
    call PlaySound
    call Call_000_1898

jr_00f_7457:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 4, a
    jr nz, jr_00f_7457

    jp Jump_00f_736f


Jump_00f_7466:
    ld a, [$d87b]
    cp $00
    jp z, Jump_00f_736f

    ld c, a
    and $03
    cp $00
    jp z, Jump_00f_736f

    ld a, c
    dec a
    ld [$d87b], a
    ld a, SND_MENU_NAV
    call PlaySound
    call Call_000_1898

jr_00f_7483:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 5, a
    jr nz, jr_00f_7483

    jp Jump_00f_736f


Jump_00f_7492:
    ld a, [$d87b]
    cp $04
    jp c, Jump_00f_736f

    sub $04
    ld [$d87b], a
    push af
    ld a, SND_MENU_NAV
    call PlaySound
    ld a, [$d87c]
    ld b, a
    pop af
    cp b
    jp nc, Jump_00f_74b4

    ld a, b
    sub $04
    ld [$d87c], a

Jump_00f_74b4:
    call Call_000_1898

jr_00f_74b7:
    call Call_000_0abb
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 6, a
    jr nz, jr_00f_74b7

    jp Jump_00f_736f


Jump_00f_74c9:
    ld a, [$d87d]
    ld b, a
    ld a, [$d87b]
    add $04
    cp b
    jp nc, Jump_00f_736f

    ld [$d87b], a
    push af
    ld a, SND_MENU_NAV
    call PlaySound
    ld a, [$d87c]
    add $0c
    ld b, a
    pop af
    cp b
    jp c, Jump_00f_74f2

    ld a, [$d87c]
    add $04
    ld [$d87c], a

Jump_00f_74f2:
    call Call_000_1898

jr_00f_74f5:
    call Call_000_0abb
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 7, a
    jr nz, jr_00f_74f5

    jp Jump_00f_736f


Jump_00f_7507:
    call Call_000_0c3c
    ld a, SND_MENU_CANCEL
    call PlaySound
    ld a, $ff
    ld [$d87b], a

Jump_00f_7514:
    push af
    call Call_000_0927
    ld a, [$db04]
    ld [$d79f], a
    ld a, [$db05]
    ld [$d7a0], a
    ld a, [$db06]
    ld [$d79d], a
    ld a, [$db07]
    ld [$d79e], a
    ld a, [$d7a7]
    cp $01
    jr z, jr_00f_753a

    call Call_000_1224

jr_00f_753a:
    pop af
    ret


Call_00f_753c::
    ld hl, $d87e
    ld bc, $0038
    ld a, $ff
    call Call_000_080f
    ld hl, $d572
    ld c, $00
    ld de, $d87e
    ld b, $00

jr_00f_7551:
    push hl
    ld a, [hl]
    cp $ff
    jr z, jr_00f_7581

    inc hl
    inc hl
    ld a, [hl]
    bit 5, a
    jr nz, jr_00f_7562

    bit 6, a
    jr nz, jr_00f_7581

jr_00f_7562:
    dec hl
    ld a, [hl]
    and $e0
    cp $00
    jr z, jr_00f_7581

    srl a
    srl a
    srl a
    srl a
    srl a
    push af
    ld a, [$d87a]
    ld h, a
    pop af
    cp h
    jr nz, jr_00f_7581

    ld a, c
    ld [de], a
    inc de
    inc b

jr_00f_7581:
    pop hl
    ld a, $06
    call AddAToHL
    inc c
    ld a, c
    cp $38
    jr nz, jr_00f_7551

    ld a, b
    ld [$d87d], a
    ld a, [$d7a7]
    cp $00
    ret z

    ld a, [$d87d]
    inc a
    ld [$d87d], a
    ret


Call_00f_759f::
    ld a, [$d79f]
    ld b, a
    ld a, [$d7a0]
    ld c, a
    ld hl, $d918
    ld d, $00

jr_00f_75ac:
    ld a, [hl]
    cp $ff
    jr z, jr_00f_75c0

    cp b
    jr nz, jr_00f_75c0

    inc hl
    ld a, [hl]
    dec hl
    cp c
    jr nz, jr_00f_75c0

    ld a, d
    inc a
    ld [$d87a], a
    ret


jr_00f_75c0:
    inc d
    inc hl
    inc hl
    ld a, d
    cp $07
    jr nz, jr_00f_75ac

    ld a, $ff
    ld [$d87a], a
    ret


Call_00f_75ce::
    call Call_000_1974
    call Call_000_19a7
    ld a, [$d87c]
    ld b, a
    ld a, [$d87d]
    sub b
    ld b, a
    cp $00
    jp z, Jump_00f_7671

    cp $0c
    jr c, jr_00f_75e8

    ld b, $0c

jr_00f_75e8:
    ld c, $00
    ld e, $00

Jump_00f_75ec:
    ld d, $00

Jump_00f_75ee:
    push de
    push bc
    ld a, d
    sla a
    sla a
    add d
    inc a
    ld b, a
    ld a, e
    sla a
    sla a
    inc a
    ld c, a
    call Call_000_093f
    pop bc
    push bc
    push de
    push hl
    ld a, [$d87c]
    add c
    ld hl, $d87e
    call AddAToHL
    ld a, [hl]
    cp $ff
    jr nz, jr_00f_7619

    pop hl
    pop de
    jr jr_00f_765c

jr_00f_7619:
    call Call_000_099b
    ld a, [hl]
    and $1f
    sla a
    sla a
    ld b, a
    pop hl
    pop de
    ld a, b
    add $a0
    add $80
    ld [hl+], a
    inc a
    ld [hl-], a
    inc a
    ld b, a
    ld a, $40
    call AddAToHL
    ld a, b
    ld [hl+], a
    inc a
    push af
    push de
    push hl
    ld a, [$d87c]
    add c
    ld hl, $d87e
    call AddAToHL
    ld a, [hl]
    call Call_000_099b
    ld a, [hl]
    bit 6, a
    jr z, jr_00f_7658

    pop hl
    pop de
    ld a, $91
    ld [hl-], a
    pop af
    inc a
    ld c, a
    jr jr_00f_765c

jr_00f_7658:
    pop hl
    pop de
    pop af
    ld [hl-], a

jr_00f_765c:
    pop bc
    inc c
    pop de
    dec b
    jp z, Jump_00f_7671

    inc d
    ld a, d
    cp $04
    jp nz, Jump_00f_75ee

    inc e
    ld a, e
    cp $03
    jp nz, Jump_00f_75ec

Jump_00f_7671:
    ret


Call_00f_7672::
    ld hl, $d572
    ld c, $00

jr_00f_7677:
    ld a, [hl]
    cp $ff
    jr z, jr_00f_7697

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
    jr z, jr_00f_7697

    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, $08
    ld [hl], a
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl

jr_00f_7697:
    ld a, $06
    call AddAToHL
    inc c
    ld a, c
    cp $38
    jr nz, jr_00f_7677

    ret


Call_00f_76a3::
    ld a, [$d87b]
    push af
    ld a, [$d87d]
    ld b, a
    pop af
    cp b
    jp nc, Jump_00f_7776

    ld hl, $d87e
    call AddAToHL
    ld a, [hl]
    cp $ff
    jp z, Jump_00f_7776

    call Call_000_099b
    ld a, [hl+]
    ld [$d7b9], a
    inc hl
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld [$d7bb], a
    ld a, [hl+]
    ld [$d7bc], a
    ld a, [hl]
    ld [$d7ba], a
    ld a, b
    bit 5, a
    jr nz, jr_00f_76dc

    ld a, $ff
    ld [$d7bc], a

jr_00f_76dc:
    ld a, [$d7b9]
    and $1f
    call GetUnit
    ld a, UNIT_NAME
    call AddAToHL
    ld a, l
    ld [$d7c1], a
    ld a, h
    ld [$d7c2], a
    ld a, $04
    ld d, $10
    ld e, $7c
    ld b, $07
    call Call_000_14f0
    ld a, [$d7b9]
    and $1f
    call GetUnit
    ld a, UNIT_SHIFT_RANGE
    call AddAToHL
    ld a, [hl]
    push hl
    ld c, a
    ld a, $0b
    ld b, $02
    ld d, $88
    ld e, $88
    call Call_000_1510
    pop hl
    inc hl
    inc hl
    ld a, [hl]
    push hl
    ld c, a
    ld a, $0d
    ld b, $03
    ld d, $80
    ld e, $90
    call Call_000_1510
    pop hl
    inc hl
    ld a, [hl]
    push hl
    ld c, a
    ld a, $10
    ld b, $03
    ld d, $38
    ld e, $90
    call Call_000_1510
    pop hl
    ld a, [hl+]
    ld b, a
    cp $00
    jr z, jr_00f_7741

    ld a, [hl]
    ld b, a

jr_00f_7741:
    push hl
    ld c, b
    ld a, $13
    ld b, $02
    ld d, $58
    ld e, $90
    call Call_000_1510
    pop hl
    inc hl
    ld a, [hl]
    push hl
    ld c, a
    ld a, $15
    ld b, $03
    ld d, $38
    ld e, $88
    call Call_000_1510
    pop hl
    ld a, [hl+]
    ld b, a
    cp $00
    jr z, jr_00f_7767

    ld a, [hl]
    ld b, a

jr_00f_7767:
    push hl
    ld c, b
    ld a, $18
    ld b, $02
    ld d, $58
    ld e, $88
    call Call_000_1510
    pop hl
    ret


Jump_00f_7776:
    call Call_000_0927
    ret


Call_00f_777a::
    call Call_000_1630
    call Call_000_1570
    ld a, $fc
    call Call_000_1670
    ld a, [$d79f]
    ld b, a
    ld a, [$d7a0]
    ld c, a
    call Call_000_0969
    inc hl
    ld a, $02
    ld [hl], a
    push hl
    ld e, a
    call Call_000_15d0
    pop hl
    ld a, $fc
    ld [hl], a
    ld hl, $ccf0
    inc hl
    ld bc, $02c0

jr_00f_77a4:
    ld a, [hl]
    cp $fc
    jr nc, jr_00f_77b5

    dec hl
    ld a, [hl]
    inc hl
    and $0f
    cp $02
    jr c, jr_00f_77b5

    ld a, $fc
    ld [hl], a

jr_00f_77b5:
    inc hl
    inc hl
    inc hl
    dec bc
    ld a, c
    or b
    jr nz, jr_00f_77a4

    ret


Call_00f_77be::
    ld a, [$d7b8]
    cp $00
    jr z, jr_00f_77cd

    dec a
    ld [$d7b8], a
    call Call_000_14b0
    ret


jr_00f_77cd:
    ld a, [$d7a1]
    cp $00
    jr z, jr_00f_77d8

    call Call_000_14b0
    ret


jr_00f_77d8:
    call Call_000_14b0
    ld a, [$d7a2]
    cp $00
    ret nz

    ld a, $01
    ld [$d7a2], a
    ld a, [$d79e]
    ld c, a
    ld a, [$d7a0]
    sla a
    inc a
    ld b, a
    ld a, [$d79f]
    and $01
    xor $01
    ld e, a
    ld a, b
    sub e
    sub c
    sla a
    sla a
    sla a
    add $0c
    cp $50
    jr c, jr_00f_7814

    ld a, $00
    ld [$d7b1], a
    ld a, $18
    ld [$d7b2], a
    jr jr_00f_781e

jr_00f_7814:
    ld a, $0c
    ld [$d7b1], a
    ld a, $78
    ld [$d7b2], a

jr_00f_781e:
    call Call_000_0927
    ld b, $00
    ld a, [$d7b1]
    ld c, a
    ld d, $12
    ld e, $04
    call Call_000_14d0
    ld a, $01
    ld [$d7a6], a
    call Call_00f_7849
    call Call_00f_78dd

jr_00f_7839:
    ld a, [$d6d4]
    cp $00
    jr nz, jr_00f_7839

    call Call_000_0abb
    ld a, $00
    ld [$d7a6], a
    ret


Call_00f_7849:
    ld a, [$d79f]
    ld b, a
    ld a, [$d7a0]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    and $0f
    ld [$d7bd], a
    and $0f
    cp $07
    jr c, jr_00f_7866

    dec a
    cp $08
    jr c, jr_00f_7866

    dec a

jr_00f_7866:
    sla a
    sla a
    inc a
    push af
    ld a, [$d79d]
    add $0c
    ld b, a
    ld a, [$d79e]
    ld c, a
    ld a, [$d7b1]
    add c
    add $02
    ld c, a
    call Call_000_093f
    pop af
    push af
    ld a, $b7
    ld [hl+], a
    ld a, $b6
    ld [hl+], a
    ld [hl], a
    ld a, $3e
    call AddAToHL
    ld a, $b5
    ld [hl+], a
    pop af
    xor $80
    ld [hl+], a
    inc a
    ld [hl], a
    inc a
    push af
    ld a, $3e
    call AddAToHL
    ld a, $b5
    ld [hl+], a
    pop af
    ld [hl+], a
    inc a
    ld [hl], a
    ld a, $19
    ld c, $1a
    ld d, $88
    push af
    ld a, [$d7b2]
    add $10
    ld e, a
    pop af
    call Call_000_08ff
    ld c, $1b
    call Call_000_091a
    ld a, [$d7bd]
    ld hl, TerrainDefense
    call AddAToHL
    ld a, [hl]
    ld c, a
    ld a, $1b
    ld b, $02
    ld d, $88
    push af
    ld a, [$d7b2]
    add $18
    ld e, a
    pop af
    call Call_000_1510
    ld c, $0e
    call Call_000_091a
    ret


Call_00f_78dd:
    call Call_000_1490
    cp $ff
    jp z, Jump_00f_7a98

    ld a, [hl+]
    ld [$d7b9], a
    push af
    inc hl
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld [$d7bb], a
    ld a, [hl+]
    ld [$d7bc], a
    ld a, [hl]
    ld [$d7ba], a
    ld a, b
    bit 5, a
    jr nz, jr_00f_7903

    ld a, $ff
    ld [$d7bc], a

jr_00f_7903:
    pop af
    bit 7, a
    jr z, jr_00f_790c

    ld b, $40
    jr jr_00f_790e

jr_00f_790c:
    ld b, $a0

jr_00f_790e:
    and $1f
    sla a
    sla a
    add b
    push af
    ld a, [$d79d]
    add $01
    ld b, a
    ld a, [$d79e]
    ld c, a
    ld a, [$d7b1]
    add c
    add $02
    ld c, a
    call Call_000_093f
    pop af
    push af
    ld a, $b7
    ld [hl+], a
    ld a, $b6
    ld [hl+], a
    ld [hl], a
    ld a, $3e
    call AddAToHL
    ld a, $b5
    ld [hl+], a
    pop af
    xor $80
    ld [hl+], a
    inc a
    ld [hl], a
    inc a
    push af
    ld a, $3e
    call AddAToHL
    ld a, $b5
    ld [hl+], a
    pop af
    ld [hl+], a
    inc a
    ld [hl], a
    ld a, $04
    ld c, $0f
    ld d, $2c
    push af
    ld a, [$d7b2]
    add $18
    ld e, a
    pop af
    call Call_000_08ff
    ld a, [$d7ba]
    add $04
    ld c, a
    call Call_000_091a
    ld a, [$d7b9]
    and $1f
    ld l, a
    ld h, $00
    sla l
    rl h
    sla l
    rl h
    sla l
    rl h
    sla l
    rl h
    sla a
    sla a
    call AddAToHL
    ld bc, UnitStats
    ld a, l
    add c
    ld l, a
    ld a, h
    adc b
    ld h, a
    push hl
    ld a, l
    ld [$d7c1], a
    ld a, h
    ld [$d7c2], a
    ld a, $06
    ld d, $10
    push af
    ld a, [$d7b2]
    sub $02
    ld e, a
    pop af
    ld b, $05
    call Call_000_14f0
    pop hl
    ld a, $05
    call AddAToHL
    ld a, l
    ld [$d7c1], a
    ld a, h
    ld [$d7c2], a
    ld a, $0b
    ld d, $10
    push af
    ld a, [$d7b2]
    add $06
    ld e, a
    pop af
    ld b, $07
    call Call_000_14f0
    ld a, [$d7bb]
    inc a
    srl a
    srl a
    ld b, a
    cp $00
    jr z, jr_00f_7a22

    cp $08
    jr nz, jr_00f_79f4

    ld a, $12
    ld c, $1c
    ld d, $3c
    push af
    ld a, [$d7b2]
    add $10
    ld e, a
    pop af
    call Call_000_08ff
    ld c, $1d
    call Call_000_091a
    jp Jump_00f_7a22


jr_00f_79f4:
    ld c, $00

jr_00f_79f6:
    push bc
    ld a, c
    and $01
    ld d, a
    sla a
    sla a
    add d
    add d
    add $3c
    ld d, a
    ld a, c
    srl a
    ld e, a
    sla a
    sla a
    add e
    ld e, a
    ld a, [$d7b2]
    add e
    add $0d
    ld e, a
    ld a, c
    add $12
    ld c, $10
    call Call_000_08ff
    pop bc
    inc c
    dec b
    jr nz, jr_00f_79f6

Jump_00f_7a22:
jr_00f_7a22:
    ld a, [$d7bc]
    cp $ff
    ret z

    ld a, $26
    ld c, $5c
    ld d, $50
    push af
    ld a, [$d7b2]
    add $05
    ld e, a
    pop af
    call Call_000_08ff
    ld c, $5d
    call Call_000_091a
    ld a, [$d7bc]
    call Call_000_099b
    ld a, [hl]
    bit 7, a
    jr z, jr_00f_7a4d

    ld b, $40
    jr jr_00f_7a4f

jr_00f_7a4d:
    ld b, $a0

jr_00f_7a4f:
    ld a, [$d7bc]
    call Call_000_099b
    ld a, [hl]
    and $1f
    sla a
    sla a
    add b
    push af
    ld a, [$d79d]
    add $08
    ld b, a
    ld a, [$d79e]
    ld c, a
    ld a, [$d7b1]
    add c
    add $02
    ld c, a
    call Call_000_093f
    pop af
    push af
    ld a, $b7
    ld [hl+], a
    ld a, $b6
    ld [hl+], a
    ld [hl], a
    ld a, $3e
    call AddAToHL
    ld a, $b5
    ld [hl+], a
    pop af
    xor $80
    ld [hl+], a
    inc a
    ld [hl], a
    inc a
    push af
    ld a, $3e
    call AddAToHL
    ld a, $b5
    ld [hl+], a
    pop af
    ld [hl+], a
    inc a
    ld [hl], a
    ret


Jump_00f_7a98:
    call Call_000_11e8
    ld hl, $d7a9
    ld a, l
    ld [$d7c1], a
    ld a, h
    ld [$d7c2], a
    ld a, $0b
    ld d, $10
    push af
    ld a, [$d7b2]
    add $16
    ld e, a
    pop af
    ld b, $06
    call Call_000_14f0
    ret
