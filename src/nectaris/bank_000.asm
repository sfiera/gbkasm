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

SECTION "ROM Bank $000", ROM0[$0]

RST_00::
    jp Jump_000_07e5


    nop
    ld a, b
    add b
    ld c, e
    nop

RST_08::
    jp Jump_000_0068


Config0::
    db BANK(j1a_4100)
Config1::
    db BANK(traps1)
Config2::
    db ((traps1 - $4000) / 2) - 1
Config3::
    db BANK(traps1)
Config4::
    db BANK(traps2)


RST_10::
    jp Jump_000_00c9


    nop

KissCartridgeCode::
    db $03

KissIndexBank::
    db $01

KissIndexAddr::
    db $80, $bf

RST_18::
    nop
    nop
    dec b
    ld bc, $08f0
    nop
    nop

RST_20::
    ldh [$80], a
    ld [$2000], a
    ret


    dec b
    db $01

RST_28::
    ld e, [hl]
    ld de, $0000
    dec b
    ld bc, $1136

RST_30::
    nop
    nop
    dec b
    ld bc, $101a
    nop
    nop

RST_38::
    dec b
    ld bc, $116a
    nop
    nop
    dec b
    db $01

VBlankInterrupt::
    jp $c006


    nop
    dec b
    ld bc, $1036

LCDCInterrupt::
    reti


    nop
    dec b
    ld bc, $0ff2
    nop
    nop

TimerOverflowInterrupt::
    jp $c000


Call_000_0053:
Jump_000_0053:
    reti


    nop
    nop
    dec b
    db $01

SerialTransferCompleteInterrupt::
    jp $c003


    nop
    dec b
    ld bc, $0ffe

JoypadTransitionInterrupt::
    reti


    nop
    dec b
    ld bc, $0ff6
    nop
    nop

Jump_000_0068:
    add sp, -$05
    push af
    push de
    push hl
    ld hl, sp+$0b
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    inc de
    ld [hl], d
    dec hl
    ld [hl], e
    ld e, a
    ld a, [$000d]
    cp e
    jr c, jr_000_0093

    ld d, $00
    ld hl, traps0
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$09
    ld [hl], e
    inc hl
    ld [hl], d
    pop hl
    pop de
    pop af
    add sp, $03
    ret


jr_000_0093:
    ld d, e
    dec hl
    ldh a, [$80]
    ld [hl-], a
    ld [hl], $00
    dec hl
    ld [hl], $bd
    sla e
    ld a, d
    rlca
    and $01
    add $0e
    ld l, a
    ld h, $00
    ld a, [hl]
    call Call_000_00f7
    ld hl, $4000
    ld d, l
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$06

Jump_000_00b6:
    ld [hl], e
    inc hl
    ld [hl], d
    pop hl
    pop de
    pop af
    ret


    push af
    push hl
    ld hl, sp+$04
    ld a, [hl]
    call Call_000_00f7
    pop hl
    pop af
    inc sp
    ret


Jump_000_00c9:
    push af
    push af
    push de
    push hl
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld e, [hl]
    inc hl
    ld d, [hl]
    push hl
    dec hl
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$0b
    ld [hl], d
    dec hl

Call_000_00de:
Jump_000_00de:
    ld [hl], e
    pop de
    inc de
    dec hl
    ld [hl], d
    dec hl

Jump_000_00e4:
    ld [hl], e

Call_000_00e5:
Jump_000_00e5:
    pop hl
    pop de
    pop af
    ret


    xor a

Call_000_00ea:
    ldh [$81], a
    inc a
    ld [$6000], a
    xor a
    ld [$0000], a
    ld a, [$000c]

Call_000_00f7:
    ldh [$80], a
    ld [$2000], a
    ret


    nop
    nop
    nop

Boot::
    nop
    jp Jump_000_02e7


HeaderLogo::
    db $ce, $ed, $66, $66, $cc, $0d, $00, $0b, $03, $73, $00, $83, $00, $0c, $00, $0d
    db $00, $08, $11, $1f, $88, $89, $00, $0e, $dc, $cc, $6e, $e6, $dd, $dd, $d9, $99
    db $bb, $bb, $67, $63, $6e, $0e, $ec, $cc, $dd, $dc, $99, $9f, $bb, $b9, $33, $3e

HeaderTitle::
    db "NECTARIS GB", $00, $00, $00, $00, $00

HeaderNewLicenseeCode::
    db $31, $38

HeaderSGBFlag::
    db $03

HeaderCartridgeType::
    db $ff

HeaderROMSize::
    db $04

HeaderRAMSize::
    db $03

HeaderDestinationCode::
    db $00

HeaderOldLicenseeCode::
    db $33

HeaderMaskROMVersion::
    db $00

HeaderComplementCheck::
    db $40

HeaderGlobalChecksum::
    db $d2, $51

    ld a, [$000b]
    ldh [$80], a
    ld [$2000], a
    jp $4100


    ld a, b
    or c
    ret z

    ldh a, [$86]
    or a
    jr z, jr_000_0174

    ld a, h
    and $e0
    cp $80
    jr z, jr_000_017d

    ld a, d
    and $e0
    cp $80
    jr nz, jr_000_0174

    trap $fe
    ret


jr_000_0174:
    ld a, [de]
    inc de
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_000_0174

    ret


jr_000_017d:
    ld a, b
    or a

jr_000_017f:
    push af
    trap $fd
    pop af
    push af
    jr nz, jr_000_018a

    ld a, b
    cp c
    jr nc, jr_000_01a5

jr_000_018a:
    push bc
    push hl
    ld c, b
    ld b, $00
    push bc
    call Call_000_01a6
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
    jr jr_000_017f

jr_000_01a5:
    pop af

Call_000_01a6:
    trap $ff

jr_000_01a8:
    ld a, [de]
    inc de
    ld [hl], a
    inc l
    dec c
    jr nz, jr_000_01a8

    di

Call_000_01b0:
    ld a, l
    ldh [$87], a
    ldh a, [$89]
    add b
    ldh [$89], a
    ei
    ret


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_000_01c3:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

traps0::
    dw $00e9
    dw $0150
    dw $015b
    dw $6f05
    dw $6f35
    dw $6f3e
    dw $76d8
    dw $76f1
    dw $7712
    dw $02fd
    dw $01b9
    dw $01b9
    dw $01b9
    dw $01b9
    dw $00b9
    dw $0000
    dw $02e7
    dw $021c
    dw $021c
    dw $021c
    dw $021c
    dw $021c
    dw $021c
    dw $021c
    dw $021c
    dw $021c

    jr jr_000_0218

    ld l, d
    ld [bc], a

jr_000_0218:
    ld de, $0000
    ret


    xor a
    ret


    push af
    push bc

Call_000_0220:
    push de
    push hl
    ldh a, [$99]
    bit 2, a
    call nz, Call_000_0232
    pop hl
    pop de
    pop bc
    pop af
    reti


    ld l, $00
    jr jr_000_0251

Call_000_0232:
    ld l, $03
    jr jr_000_0251

    xor a
    ld l, $06
    jr jr_000_0251

    ld l, $09
    jr jr_000_0251

    ld l, $0c
    jr jr_000_0251

    ld l, $0f
    jr jr_000_0251

    ld l, $12
    jr jr_000_0251

    ld l, $15
    jr jr_000_0251

    ld l, $18

jr_000_0251:
    ld h, $40
    push af
    call Call_000_025c
    pop hl
    push af
    ld a, h
    jr jr_000_0265

Call_000_025c:
    push hl
    push af
    ldh a, [$80]
    ld hl, sp+$07
    ld [hl], a
    ld a, $1c

jr_000_0265:
    call RST_20
    pop af
    ret


    ld a, d
    cp $80
    jr c, jr_000_0292

Jump_000_026f:
    cp $a0
    jp c, Jump_000_0314

    cp $c0
    jr c, jr_000_0285

    cp $e0
    jp nc, Jump_000_0314

    sub $c0
    trap $50
    jp c, Jump_000_0314

    ret


jr_000_0285:
    sub $a0
    trap $bc
    jp c, Jump_000_0314

    ret


jr_000_028d:
    pop de
    pop bc
    pop hl
    scf
    ret


jr_000_0292:
    push hl
    push bc
    push de
    call Call_000_0306
    jr c, jr_000_028d

    ld a, b
    pop bc
    ld b, a
    push bc
    ld a, l
    sub c
    ld c, a
    ld a, h
    sbc $00
    ld b, a
    jr c, jr_000_028d

    or c
    jr z, jr_000_028d

    pop hl
    ldh a, [$80]
    ld b, a
    ld a, h
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, de
    ld e, l
    ld d, h
    call RST_20
    pop af
    pop hl
    push bc
    dec a
    dec c
    cp c

Jump_000_02c1:
    jr c, jr_000_02c4

    ld a, c

jr_000_02c4:
    inc a
    ld c, a
    ld b, $00
    jr nz, jr_000_02cb

    inc b

jr_000_02cb:
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    push hl
    push bc
    trap $02

Call_000_02df:
    pop bc
    pop hl
    add hl, bc
    pop af
    or a
    jp RST_20


Jump_000_02e7:
    di

Call_000_02e8:
    jp Jump_000_0320


    nop

jr_000_02ec:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret


    nop
    nop
    jp Jump_000_030a


Jump_000_0303:
    jp Jump_000_030e


Call_000_0306:
    jp Jump_000_0312


    ret


Jump_000_030a:
    di
    jp Jump_000_02e7


Jump_000_030e:
    di
    jp Jump_000_1ebf


Jump_000_0312:
    scf
    ret


Jump_000_0314:
    scf
    ret


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_000_0320:
    jp Jump_000_1eb5


    inc hl
    inc hl
    inc hl
    inc hl
    jr nc, jr_000_035a

    ld [hl-], a
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $37
    jr c, @+$3b

    dec h
    ld a, [hl+]
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    jr nz, jr_000_02ec

    xor b
    xor c
    xor d
    xor e
    xor h
    xor l
    xor [hl]
    xor a
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

jr_000_035a:
    cp [hl]
    cp a
    ret nz

    pop bc
    jp nz, $c4c3

    push bc
    add $c7
    ret z

    ret


    jp z, $cccb

    call $cfce
    ret nc

    pop de
    jp nc, $d4d3

    push de
    sub $d7
    ret c

    reti


    jp c, $dcdb

    and [hl]
    db $dd
    dec l
    rst $18
    sbc $20
    jr nz, jr_000_03a1

    jr nz, jr_000_03a3

    ld b, c
    ld b, d
    ld b, e
    ld b, h
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
    jr nz, @+$22

    jr nz, jr_000_03c1

jr_000_03a1:
    jr nz, jr_000_03c3

jr_000_03a3:
    ld bc, $0201
    ld bc, $0101
    ld bc, $0201
    ld [bc], a
    inc b
    ld bc, $0303
    cp $02
    cp $fe
    cp $7f
    cp $fe
    cp $02
    ld bc, $0101
    ld bc, $fefe

jr_000_03c1:
    cp $fe

jr_000_03c3:
    ld bc, $0101
    ld bc, $fefe
    cp $fe
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $fefe
    cp $fe

Call_000_03df:
    cp $fe
    cp $fe
    dec b
    nop
    inc d
    ld e, $00
    jr z, jr_000_03ea

jr_000_03ea:
    nop
    inc hl
    nop
    inc hl
    nop
    nop
    nop
    nop
    nop
    ld c, l
    dec l
    scf
    scf
    jr nz, @-$2a

    trap $b1
    pushx @ + $20bc
    jr nz, jr_000_0400

jr_000_0400:
    nop

jr_000_0401:
    ld d, b
    nop
    ld bc, $0100
    sub b
    ld b, [hl]
    ld e, b
    dec l
    ld sp, $cc20
    and a
    reti


    cp d
    jr nz, jr_000_0432

    jr nz, jr_000_0420

    inc b
    ld e, $5a
    ld bc, $0100
    ld d, d
    ld b, c
    ld e, b
    dec l
    jr c, @+$39

jr_000_0420:
    cp h
    sbc $ac
    set 3, [hl]
    or d
    jr nz, jr_000_0432

    inc b
    ld e, $14
    ld bc, HeaderSGBFlag
    ld d, c
    ld b, l
    ld b, [hl]
    dec l

jr_000_0432:
    jr c, @+$3a

    jp z, $c0dd

    dec l
    jr nz, jr_000_045a

    jr nz, jr_000_0447

    inc b
    ld [hl-], a
    ld b, [hl]
    ld bc, HeaderSGBFlag
    ld d, e
    ld d, h
    dec l
    scf
    add hl, sp

jr_000_0447:
    jr nz, jr_000_0401

    sbc $d8
    cp l
    sbc $d8
    dec l
    inc b
    nop
    ld [hl-], a
    nop
    ld bc, HeaderSGBFlag
    ld de, $5450
    dec l

jr_000_045a:
    ld [hl], $20
    or c
    reti


    trap $bc
    sbc $db

Jump_000_0462:
    jr nz, @+$06

    nop
    inc a
    nop
    ld bc, $013c
    ld de, $2d53
    ld [hl], $31
    jr nz, @-$34

    sbc $b2
    cp a
    db $dd
    jr nz, @+$22

    ld b, $00
    jr z, jr_000_047b

jr_000_047b:
    ld bc, $0132
    ld de, $5347
    dec l
    jr c, jr_000_04b5

    cp l
    pushx @ + $b6af
    sbc $2d
    jr nz, @+$09

    nop
    ld [hl-], a
    nop
    ld bc, $0132
    ld de, $5447
    dec l
    jr c, jr_000_04ce

    db $d3
    db $dd

jr_000_049a:
    cp l
    ret nz

    dec l
    jr nz, @+$22

    dec b
    nop
    ld [hl-], a
    nop
    ld bc, $013c
    ld de, $4d48
    ld b, d
    dec l
    ld [hl-], a
    or a
    sbc $b6
    sbc $dd
    call nz, Call_000_0220
    nop

jr_000_04b5:
    ld d, b
    jr z, jr_000_04b9

    ld e, d

jr_000_04b9:
    ld bc, $5411
    ld d, h
    dec l
    ld sp, $da20
    ret z

    xor a
    call nz, $2020
    jr nz, @+$07

    nop
    ld e, $00
    ld bc, $012d

jr_000_04ce:
    ld de, $4753
    dec l
    inc [hl]
    jr nz, jr_000_049a

    cp l
    adc $d9
    db $dd
    jr nz, jr_000_04fb

    inc b
    nop
    ld e, $00

Call_000_04df:
Jump_000_04df:
    ld bc, $052d
    add hl, de
    ld c, l
    ld d, d
    dec l
    ld [hl-], a
    ld [hl-], a
    or h

jr_000_04e9:
    cp l
    call nz, $d92d
    jr nz, jr_000_050f

    inc b
    nop
    ld e, $00
    ld bc, $043c
    add hl, de
    ld c, l
    ld b, d
    dec l
    dec [hl]

jr_000_04fb:
    jr nz, @-$27

    set 3, [hl]
    xor a
    call nz, $2020
    ld [$1401], sp
    ld a, [bc]
    ld bc, HeaderSGBFlag
    dec d
    ld c, l
    ld b, d
    dec l
    inc [hl]

jr_000_050f:
    jr nz, jr_000_04e9

    db $dd
    cp b
    cp l
    jr nz, @+$22

    jr nz, jr_000_051e

    ld bc, $0a14
    ld bc, $0228

jr_000_051e:
    dec e
    ld b, c
    ld b, c
    ld b, a
    dec l
    inc [hl]
    cp h
    dec l
    or [hl]
    dec l
    jr nz, jr_000_054a

    jr nz, jr_000_0532

    nop
    ld e, $41
    ld bc, $011e

jr_000_0532:
    inc de
    ld c, l
    ld c, l
    ld sp, $3730
    adc $2d
    cp b
    or c
    or d
    jr nz, jr_000_055f

    dec b
    nop
    ld e, $55
    dec b
    nop
    ld bc, $531a
    ld d, e
    dec l

jr_000_054a:
    jr c, jr_000_057c

    db $d3
    ret


    cp c
    db $db
    cp l
    jr nz, @+$22

    nop
    nop
    inc d
    nop
    ld bc, $065a
    sbc c
    ld b, a
    ld e, b
    dec l
    scf

jr_000_055f:
    scf
    pop de
    db $dd
    cp b
    cp l
    jr nz, jr_000_0586

    jr nz, jr_000_056b

    inc bc
    inc b
    ld a, [bc]

jr_000_056b:
    ld bc, $010a
    add c
    ld b, a
    ld e, b
    dec l
    jr c, @+$39

    ret nz

    sbc $2d
    call $afde
    cp b
    ld [bc], a

jr_000_057c:
    inc bc
    ld a, [bc]

jr_000_057e:
    ld a, [bc]
    ld bc, $0128
    add c
    ld b, e
    ld b, d
    ld e, b

jr_000_0586:
    dec l
    ld sp, $dec4
    jp c, $cab2

    rst $18
    dec l
    add hl, bc
    ld [bc], a
    ld [$010a], sp
    ld a, [bc]
    ld bc, $4e80
    ld b, e
    dec l
    ld sp, $d020
    xor l
    dec l
    reti


    jr nz, @+$22

    jr nz, jr_000_05aa

    ld [bc], a
    ld a, [bc]
    ld a, [bc]
    ld bc, $010a

jr_000_05aa:
    jr nz, @+$45

    dec l
    ld [hl], $31
    jr nz, jr_000_057e

    rst $18
    ret c

    or [hl]
    db $dd
    jr nz, jr_000_05d7

    add hl, bc
    inc b
    ld a, [bc]
    nop
    ld bc, $0100
    ld h, c

Call_000_05bf:
    di
    ld [$2000], a
    ld [$d799], a
    ei
    ret


Call_000_05c8:
    push af
    di
    ld a, $01
    ld [$6000], a
    pop af
    push af
    cp $00
    jr nz, jr_000_05dc

    ld a, $00

jr_000_05d7:
    ld [$0000], a
    pop af
    ret


jr_000_05dc:
    ld a, $0a
    ld [$0000], a
    pop af
    ret


    push af
    push bc
    push de
    push hl
    ld a, [$d7a6]
    cp $00
    jr nz, jr_000_05f8

    ld a, [$d6d4]
    cp $00
    jr nz, jr_000_05f8

    call $fff5

jr_000_05f8:
    ld a, $01
    ldh [$92], a
    ld a, [$d6d2]
    inc a
    ld [$d6d2], a
    ld a, [$db1a]
    inc a
    ld [$db1a], a
    cp $3c
    jr nz, jr_000_061e

    ld a, $00
    ld [$db1a], a
    ld a, [$db19]
    cp $00
    jr z, jr_000_061e

    dec a
    ld [$db19], a

jr_000_061e:
    ld a, [$d799]
    push af
    ld a, $1c
    ld [$2000], a
    ld a, [$db0b]
    cp $02
    jr nc, jr_000_0634

    inc a
    ld [$db0b], a
    jr jr_000_063d

jr_000_0634:
    ld a, [$d799]
    ld [$2000], a
    call Call_000_065d

jr_000_063d:
    ld a, [$d86d]
    cp $00
    jr z, jr_000_064c

    ld a, $1c
    ld [$2000], a
    call $4003

jr_000_064c:
    pop af
    ld [$2000], a
    ld [$d799], a
    ld a, $00
    ld [$db0c], a
    pop hl
    pop de
    pop bc
    pop af
    reti


Call_000_065d:
    ld a, [$d6d4]
    cp $00
    ret z

    ld a, $00
    ld [$d6d6], a

Jump_000_0668:
    ld a, [$d6d4]
    dec a
    sla a
    ld b, a
    sla a
    add b
    ld hl, $d6d7
    call Call_000_088f
    ld a, l
    ld [$d797], a
    ld a, h
    ld [$d798], a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    push bc
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    pop hl
    ld a, b
    cp $00
    jr nz, jr_000_06c2

    ld a, c
    cp $14
    jr c, jr_000_0710

    cp $20
    jr c, jr_000_06f8

    cp $28
    jr c, jr_000_06e0

    cp $40
    jr c, jr_000_06c2

    ld a, [$d6d6]
    cp $11
    ret nc

    call Call_000_082c
    call Call_000_082c
    call Call_000_082c
    call Call_000_082c
    ld a, c
    sub $40
    ld c, a
    ld a, b
    sbc $00
    ld b, a
    ld a, $40
    jr jr_000_0722

jr_000_06c2:
    ld a, [$d6d6]
    cp $19
    ret nc

    call Call_000_083e
    call Call_000_083e
    call Call_000_083e
    call Call_000_083e
    ld a, c
    sub $28
    ld c, a
    ld a, b
    sbc $00
    ld b, a
    ld a, $28
    jr jr_000_0722

jr_000_06e0:
    ld a, [$d6d6]
    cp $21
    ret nc

    call Call_000_082c
    call Call_000_082c
    ld a, c
    sub $20
    ld c, a
    ld a, b
    sbc $00
    ld b, a
    ld a, $20
    jr jr_000_0722

jr_000_06f8:
    ld a, [$d6d6]
    cp $2d
    ret nc

    call Call_000_083e
    call Call_000_083e
    ld a, c
    sub $14
    ld c, a
    ld a, b
    sbc $00
    ld b, a
    ld a, $14
    jr jr_000_0722

jr_000_0710:
    ld a, [$d6d6]
    cp $37
    ret nc

    push bc

jr_000_0717:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_000_0717

    pop bc
    ld a, c
    ld bc, $0000

jr_000_0722:
    push bc
    ld b, a
    ld a, [$d6d6]
    add b
    ld [$d6d6], a
    pop bc
    ld a, b
    or c
    jr nz, jr_000_0743

    ld a, [$d6d4]
    dec a
    ld [$d6d4], a
    cp $00
    ret z

    ld a, [$d6d6]
    cp $40
    jp c, Jump_000_0668

    ret


jr_000_0743:
    push bc
    push hl
    pop bc
    ld a, [$d797]
    ld l, a
    ld a, [$d798]
    ld h, a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    pop bc
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ret


Call_000_075c:
jr_000_075c:
    ld a, [$d6d4]
    cp $00
    jr nz, jr_000_075c

    ret


Call_000_0764:
    di
    push hl
    push bc
    push hl
    ld a, [$d6d4]
    sla a
    ld b, a
    sla a
    add b
    ld hl, $d6d7
    call Call_000_088f
    pop bc
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    pop bc
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    pop hl
    ld a, [$d6d4]
    inc a
    ld [$d6d4], a
    ei
    push bc
    ld b, a
    ld a, [$d6d5]
    ld c, a
    ld a, b
    cp c
    pop bc
    ret c

    ld [$d6d5], a
    ret


Call_000_079c:
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
    ld c, a
    ldh a, [$8c]
    xor c
    and c
    ldh [$8d], a
    ld a, c
    ldh [$8c], a
    ld a, $30
    ldh [rP1], a
    ret


Call_000_07cd:
    ld c, $f5
    ld b, $0a
    ld hl, $07db

jr_000_07d4:
    ld a, [hl+]
    ld [c], a
    inc c
    dec b
    jr nz, jr_000_07d4

    ret


    ld a, $c1
    ldh [rDMA], a
    ld a, $28

jr_000_07e1:
    dec a
    jr nz, jr_000_07e1

    ret


Jump_000_07e5:
    add a
    pop hl
    ld e, a
    ld d, $00
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    pop hl
    jp hl


Call_000_07f1:
    ldh a, [rIE]
    ldh [$93], a
    res 0, a

jr_000_07f7:
    ldh a, [rLY]
    cp $91
    jr nz, jr_000_07f7

    ldh a, [rLCDC]
    and $7f
    ldh [rLCDC], a
    ldh a, [$93]
    ldh [rIE], a
    ret


Call_000_0808:
    ldh a, [rLCDC]
    or $80
    ldh [rLCDC], a
    ret


Call_000_080f:
    push af

jr_000_0810:
    pop af
    ld [hl+], a
    push af
    dec bc
    ld a, c
    or b
    jr nz, jr_000_0810

    pop af
    ret


Call_000_081a:
jr_000_081a:
    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_000_081a

    ret


jr_000_0823:
    ld a, [de]
    ld [hl+], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_000_0823

    ret


Call_000_082c:
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

Call_000_083e:
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
    ret


Call_000_085d:
    halt

jr_000_085e:
    ldh a, [$92]
    and a
    jr z, jr_000_085e

    xor a
    ldh [$92], a
    ret


jr_000_0867:
    ldh a, [rLY]
    cp $91
    jr nc, jr_000_0867

jr_000_086d:
    ldh a, [rLY]
    cp $91
    jr nz, jr_000_086d

    ret


Call_000_0874:
jr_000_0874:
    ld a, [$d6d3]
    cp $00
    jr z, jr_000_0880

    ld a, $83
    ldh [rLCDC], a
    ret


jr_000_0880:
    ld a, $8b
    ldh [rLCDC], a
    ret


Call_000_0885:
    ld a, [$d6d3]
    xor $01
    ld [$d6d3], a
    jr jr_000_0874

Call_000_088f:
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ret


Call_000_0896:
    push bc
    ld b, a
    ld a, l
    sub b
    ld l, a
    ld a, h
    sbc $00
    ld h, a
    pop bc
    ret


Call_000_08a1:
    add e
    ld e, a
    ld a, d
    adc $00
    ld d, a
    ret


    push bc
    ld b, a
    ld a, e
    sub b
    ld e, a
    ld a, d
    sbc $00
    ld d, a
    pop bc
    ret


Call_000_08b3:
    ld a, l
    sub e
    ld l, a
    ld a, h
    sbc d
    ld h, a
    ret


Call_000_08ba:
    ld a, e
    add l
    ld l, a
    ld a, h
    adc d
    ld h, a
    ret


Call_000_08c1:
    push bc
    ld b, h
    ld c, l
    ld hl, $0000
    ld a, b
    or c
    jr z, jr_000_08d3

jr_000_08cb:
    call Call_000_08ba
    dec bc
    ld a, b
    or c
    jr nz, jr_000_08cb

jr_000_08d3:
    pop bc
    ret


Call_000_08d5:
    push bc
    push de
    ld bc, $0000
    ld de, $0064

jr_000_08dd:
    call Call_000_08b3
    jr c, jr_000_08e5

    inc bc
    jr jr_000_08dd

jr_000_08e5:
    ld h, b
    ld l, c
    pop de

Call_000_08e8:
Jump_000_08e8:
    pop bc
    ret


Call_000_08ea:
    push bc
    push de
    ld bc, $0000
    ld de, $000a

jr_000_08f2:
    call Call_000_08b3
    jr c, jr_000_08fa

    inc bc
    jr jr_000_08f2

jr_000_08fa:
    ld h, b
    ld l, c
    pop de
    pop bc
    ret


Call_000_08ff:
    push af
    ld hl, $c100
    sla a
    sla a
    call Call_000_088f
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, d
    add $08
    ld d, a
    pop af
    inc a
    inc c
    ret


Call_000_091a:
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, d
    add $08
    ld d, a
    ret


Call_000_0927:
    ld a, $00
    ld hl, $c100
    ld bc, $00a0
    call Call_000_080f
    ret


Call_000_0933:
    ld a, $80
    ld hl, $c1a0
    ld bc, $0b40
    call Call_000_080f
    ret


Call_000_093f:
    ld a, c
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
    sla l
    rl h
    sla l
    rl h
    ld a, b
    call Call_000_088f
    ld bc, $c1a0
    ld a, c
    add l
    ld l, a
    ld a, b
    adc h
    ld h, a
    ret


Call_000_0969:
    ld a, c
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
    sla l
    rl h
    ld a, b
    call Call_000_088f
    push hl
    pop bc
    sla l
    rl h
    ld a, l
    add c
    ld l, a
    ld a, h
    adc b
    ld h, a
    ld bc, $ccf0
    ld a, l
    add c
    ld l, a
    ld a, h
    adc b
    ld h, a
    ret


Call_000_099b:
    push bc
    ld h, $00
    ld l, a
    sla l
    rl h
    sla l
    rl h
    sla a
    call Call_000_088f
    ld bc, $d572
    ld a, l
    add c
    ld l, a
    ld a, h
    adc b
    ld h, a
    pop bc
    ret


Call_000_09b7:
    push bc
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
    call Call_000_088f
    ld bc, $03f3
    ld a, l
    add c
    ld l, a
    ld a, h
    adc b
    ld h, a
    pop bc
    ret


Call_000_09df:
    call Call_000_085d
    ld a, $ff
    ldh [rBGP], a
    ldh [rOBP0], a
    ldh [rOBP1], a
    ret


Call_000_09eb:
    call Call_000_085d
    ld a, $1b
    ldh [rBGP], a
    ld a, $2f
    ldh [rOBP0], a
    ldh [rOBP1], a
    ret


Call_000_09f9:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, [$d872]
    call Call_000_0a0e
    pop af
    ld [$d799], a
    ld [$2000], a
    ret


Call_000_0a0e:
    push af
    ld a, $02
    call Call_000_05bf
    ld hl, $5000
    pop af
    cp $00
    jr z, jr_000_0a2d

    ld hl, $5800
    cp $01
    jr z, jr_000_0a2d

    ld hl, $6000
    cp $02
    jr z, jr_000_0a2d

    ld hl, $6800

jr_000_0a2d:
    ld de, $8000
    ld b, $80
    call Call_000_0a36
    ret


Call_000_0a36:
    ld a, b
    push af
    cp $00
    jr nz, jr_000_0a40

    ld b, $40
    jr jr_000_0a44

jr_000_0a40:
    srl b
    srl b

Call_000_0a44:
Jump_000_0a44:
jr_000_0a44:
    call Call_000_075c
    push bc
    ld bc, $0040
    call Call_000_0764
    ld a, $40
    call Call_000_088f
    ld a, $40
    call Call_000_08a1
    pop bc
    dec b
    jp z, Jump_000_0a73

    push bc
    ld bc, $0040
    call Call_000_0764
    ld a, $40
    call Call_000_088f
    ld a, $40
    call Call_000_08a1
    pop bc
    dec b
    jp nz, Jump_000_0a44

Jump_000_0a73:
    call Call_000_075c
    pop af
    and $03
    cp $01
    jr z, jr_000_0aa7

    cp $02
    jr z, jr_000_0a97

    cp $03
    jr z, jr_000_0a87

    jr jr_000_0ab7

jr_000_0a87:
    ld bc, $0010
    call Call_000_0764
    ld a, $10
    call Call_000_088f
    ld a, $10
    call Call_000_08a1

jr_000_0a97:
    ld bc, $0010
    call Call_000_0764
    ld a, $10
    call Call_000_088f
    ld a, $10
    call Call_000_08a1

jr_000_0aa7:
    ld bc, $0010
    call Call_000_0764
    ld a, $10
    call Call_000_088f
    ld a, $10
    call Call_000_08a1

jr_000_0ab7:
    call Call_000_075c
    ret


Call_000_0abb:
    ld a, [$d6d3]
    cp $00
    jr z, jr_000_0b29

Call_000_0ac2:
Jump_000_0ac2:
    ld hl, $c1a0
    ld a, [$d79d]
    call Call_000_088f
    ld b, $00
    ld a, [$d79e]
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c

Call_000_0adf:
    rl b
    sla c
    rl b
    sla c
    rl b
    ld a, c
    add l
    ld l, a
    ld a, b
    adc h
    ld h, a
    ld de, $9800
    ld a, [$d6d3]
    cp $00
    jr z, jr_000_0afc

    ld de, $9c00

jr_000_0afc:
    call Call_000_075c
    ld b, $05

Jump_000_0b01:
    ld c, $04

jr_000_0b03:
    push bc
    ld bc, $0014
    call Call_000_0764
    pop bc
    ld a, $40
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, $20
    add e
    ld e, a
    ld a, d
    adc $00
    ld d, a
    dec c
    jr nz, jr_000_0b03

    dec b
    jp nz, Jump_000_0b01

    call Call_000_075c
    call Call_000_0885
    ret


jr_000_0b29:
    ld a, [$d879]
    cp $00
    jp z, Jump_000_0ac2

    ld a, [$d878]
    cp $ff
    jp z, Jump_000_0ac2

    call Call_000_099b
    ld a, [hl]
    cp $ff
    jp z, Jump_000_0ac2

    bit 6, a
    jp nz, Jump_000_0ac2

    inc hl
    ld a, [hl]
    and $e0
    cp $00
    jp nz, Jump_000_0ac2

    ld a, [hl]
    and $1f
    ld b, a
    inc hl
    ld a, [hl]
    bit 6, a
    jp nz, Jump_000_0ac2

    and $1f
    ld c, a
    dec hl
    push hl
    call Call_000_0969
    ld a, [hl]
    and $0f
    cp $07
    jr c, jr_000_0b70

    dec a
    cp $08
    jr c, jr_000_0b70

    dec a

jr_000_0b70:
    sla a
    sla a
    inc a
    xor $80
    ld [$d873], a
    pop hl
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
    call Call_000_093f
    push hl
    ld a, [hl]
    ld b, a
    ld a, [$d873]
    ld [hl+], a
    ld a, [hl]
    ld c, a
    ld a, [$d873]
    inc a
    ld [hl], a
    ld a, $3f
    call Call_000_088f
    ld a, [hl]
    ld d, a
    ld a, [$d873]
    inc a
    inc a
    ld [hl+], a
    ld a, [hl]
    ld e, a
    ld a, [$d873]
    inc a
    inc a
    inc a
    ld [hl], a
    push bc
    push de
    call Call_000_0ac2
    pop de
    pop bc
    pop hl
    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl], a
    ld a, $3f
    call Call_000_088f
    ld a, d
    ld [hl+], a
    ld a, e
    ld [hl], a
    ret


Call_000_0bcf:
    ld a, $00
    ld [$d878], a
    ld [$d879], a
    ld a, [hl+]
    push af
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push de
    ld a, [hl+]
    push af
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push de
    pop hl
    pop af
    ld [$2000], a
    ld [$d799], a
    ld de, $8800
    ld b, $00
    call Call_000_0a36
    pop hl
    pop af
    ld [$2000], a
    ld [$d799], a
    ld de, $c1a0
    ld c, $16

jr_000_0c02:
    push hl
    push de
    call Call_000_083e
    call Call_000_083e
    pop de
    pop hl
    ld a, $14
    call Call_000_088f
    ld a, $40
    call Call_000_08a1
    dec c
    jr nz, jr_000_0c02

    ld a, [$d79d]
    ld b, a
    ld a, [$d79e]
    ld c, a
    push bc
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    call Call_000_0abb
    pop bc
    ld a, b
    ld [$d79d], a
    ld a, c
    ld [$d79e], a
    ld a, $01
    call Call_000_05bf
    ret


Call_000_0c3c:
jr_000_0c3c:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    ld b, $00

Call_000_0c48:
    jr nz, jr_000_0c52

    ld b, $01
    bit 1, a
    jr nz, jr_000_0c52

    jr jr_000_0c3c

jr_000_0c52:
    push bc
    call Call_000_085d
    call Call_000_079c
    pop bc
    ldh a, [$8c]
    bit 0, a
    jr nz, jr_000_0c52

    bit 1, a
    jr nz, jr_000_0c52

    ret


Call_000_0c65:
    ld [$db19], a
    ld a, $00
    ld [$db1a], a

jr_000_0c6d:
    ld b, $02
    ld a, [$db19]
    cp $00
    ret z

    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    ld b, $00
    jr nz, jr_000_0c8b

    ld b, $01
    bit 1, a
    jr nz, jr_000_0c8b

    jr jr_000_0c6d

jr_000_0c8b:
    ld a, [$db19]
    cp $00
    ret z

    push bc
    call Call_000_085d
    call Call_000_079c
    pop bc
    ldh a, [$8c]
    bit 0, a
    jr nz, jr_000_0c8b

    bit 1, a
    jr nz, jr_000_0c8b

    ret


Call_000_0ca4:
    ld a, [$d799]
    push af
    ld a, $1c
    call Call_000_05bf
    call $4000
    pop af
    ld [$2000], a
    ld a, $01
    ld [$d86d], a
    ld a, $00
    ld [$db09], a
    ret


Call_000_0cbf:
    push af
    ld a, [$db08]
    ld b, a
    pop af
    cp b
    ret z

    ld [$db08], a
    ld a, [$d799]
    push af

jr_000_0cce:
    ld a, [$db0c]
    cp $00
    jr nz, jr_000_0cce

    inc a
    ld [$db0c], a
    ld a, $1c
    call Call_000_05bf
    call $4012
    cp $01
    jr z, jr_000_0cce

    ld a, [$db09]
    cp $00

Call_000_0cea:
    jr z, jr_000_0cef

    call Call_000_0d30

jr_000_0cef:
    ld a, $1c
    call Call_000_05bf
    ld a, [$db08]
    call $4006
    ld a, $01
    ld [$db09], a
    pop af
    ld [$2000], a
    ld [$d799], a
    ret


Call_000_0d07:
    ld [$db0a], a
    ld a, [$db0c]
    cp $00
    ret nz

Jump_000_0d10:
    inc a
    ld [$db0c], a
    ld a, [$d799]
    push af
    ld a, $1c
    call Call_000_05bf
    ld a, [$db0a]
    call $4009
    ld a, $00
    ld [$db0b], a
    pop af
    ld [$2000], a
    ld [$d799], a
    ret


Call_000_0d30:
    ld a, [$d799]
    push af
    ld a, [$db09]
    cp $00
    jr z, jr_000_0d43

    ld a, $1c
    call Call_000_05bf
    call $4015

jr_000_0d43:
    pop af
    ld [$2000], a
    ld [$d799], a
    ret


Call_000_0d4b:
    ld a, [$d799]
    push af
    ld a, $1c
    call Call_000_05bf
    call $401b
    pop af
    ld [$2000], a
    ld [$d799], a
    ret


Call_000_0d5f:
    ld a, [$d799]
    push af
    ld a, $1c
    call Call_000_05bf
    call $401e
    pop af
    ld [$2000], a
    ld [$d799], a
    ret


    nop
    ld bc, $0001
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    ld bc, $ff00
    rst $38
    nop
    ld bc, $0101
    nop

Call_000_0d85:
    push de
    push hl
    push af
    ld de, $0d73
    call Call_000_08a1
    pop af
    ld hl, $0d79
    call Call_000_088f
    bit 0, b
    jr z, jr_000_0d9e

    ld a, $06
    call Call_000_088f

jr_000_0d9e:
    ld a, [de]
    cp $ff
    jr z, jr_000_0da7

    add b
    ld b, a
    jr jr_000_0da8

jr_000_0da7:
    dec b

jr_000_0da8:
    ld a, [hl]
    cp $ff
    jr z, jr_000_0db1

    add c
    ld c, a
    jr jr_000_0db2

jr_000_0db1:
    dec c

jr_000_0db2:
    pop hl
    pop de
    ret


Call_000_0db5:
    ld a, [$d7a2]
    cp $00
    ret z

    ld a, $64
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
    call Call_000_0abb
    call Call_000_14b0
    ret


Call_000_0de7:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07
    call Call_000_05bf
    ld a, [$d872]
    call Call_000_09df
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    ld a, $04
    call Call_000_05bf
    ld hl, $6250
    ld de, $8800
    ld b, $00
    call Call_000_0a36
    ld a, $01
    call Call_000_09f9
    ld a, $01
    call Call_000_05bf
    call Call_000_0927
    call Call_000_0933
    call Call_000_0abb
    call Call_000_085d
    call Call_000_0abb
    call Call_000_085d
    call Call_000_09eb
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_0e3e:
    push hl
    call Call_000_0927
    call Call_000_085d
    pop hl
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07
    call Call_000_05bf
    ld a, [$d872]
    call $44a5
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_0e66:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07
    call Call_000_05bf
    ld a, [$d872]
    call $454b
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_0e86:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07
    call Call_000_05bf
    ld a, [$d872]
    call $5ff4
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_0ea6:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07
    call Call_000_05bf
    ld a, [$d872]
    call $6017
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_0ec6:
    push hl
    call Call_000_0927
    call Call_000_085d
    ld [$d872], a
    ld a, [$d799]
    pop hl
    push af
    ld a, $07
    call Call_000_05bf
    ld a, [$d872]
    call $45bf
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_0eee:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07
    call Call_000_05bf
    ld a, [$d872]
    call $47c2
    ld [$d872], a

Jump_000_0f03:
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_0f0e:
    push hl
    call Call_000_0927
    call Call_000_085d
    ld [$d872], a
    ld a, [$d799]
    pop hl
    push af
    ld a, $07
    call Call_000_05bf
    ld a, [$d872]
    call $49c9
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_0f36:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07
    call Call_000_05bf
    ld a, [$d872]
    call $4bb8
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_0f56:
    push hl
    call Call_000_0927
    call Call_000_085d
    pop hl
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07
    call Call_000_05bf
    ld a, [$d872]
    call $4d81
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $05
    call Call_000_05bf
    ld a, [$d872]
    call Call_000_0f9e
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_0f9e:
    ld b, $00
    ld hl, $50ae

jr_000_0fa3:
    push hl
    ld de, $d901
    ld c, $06

jr_000_0fa9:
    push bc
    ld a, [hl+]
    ld b, a
    ld a, [de]
    inc de
    cp b
    pop bc
    jr nz, jr_000_0fb8

    dec c
    jr nz, jr_000_0fa9

    pop hl
    jr jr_000_0fc7

jr_000_0fb8:
    pop hl
    ld a, $08
    call Call_000_088f
    inc b
    ld a, b
    cp $6c
    jr nz, jr_000_0fa3

    ld a, $01
    ret


jr_000_0fc7:
    ld a, $00
    ret


    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07
    call Call_000_05bf
    ld a, [$d872]

Call_000_0fd9:
    call $4f3a
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


    ret


    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07
    call Call_000_05bf
    ld a, [$d872]
    call $5125
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_100b:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07
    call Call_000_05bf
    ld a, [$d872]
    call $6177
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_102b:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07
    call Call_000_05bf
    ld a, [$d872]

Call_000_103a:
    call $6391
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_104b:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07
    call Call_000_05bf
    ld a, [$d872]
    call $65a0
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_106b:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07

Jump_000_1074:
    call Call_000_05bf
    ld a, [$d872]
    call $6747
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_108b:
    inc a
    push af
    ld a, $07
    call Call_000_05bf
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    call $6958
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    call Call_000_05bf
    ret


Call_000_10ae:
    inc a
    push af
    ld a, $07
    call Call_000_05bf
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    call $6a12
    push af
    ld a, $00
    call Call_000_05c8

Call_000_10c8:
    ld [$4000], a
    ei
    ld a, $01
    call Call_000_05bf
    pop af
    ret


Call_000_10d3:
    call Call_000_11f1
    ld a, [$d79f]
    ld [$db04], a
    ld a, [$d7a0]
    ld [$db05], a
    ld a, [$d79d]
    ld [$db06], a
    ld a, [$d79e]
    ld [$db07], a
    ld a, $07
    call Call_000_05bf
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    call $6b98
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    call Call_000_05bf
    ret


Call_000_110e:
    ret


Call_000_110f:
    ld a, $07

Call_000_1111:
    call Call_000_05bf
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    call $6bcf
    push af

Call_000_1121:
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    call Call_000_05bf
    pop af
    ret


Call_000_1131:
    di
    inc a
    push af
    ld a, $07
    call Call_000_05bf
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    call $6b3a
    push af
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    call Call_000_05bf
    pop af
    ei
    ret


Call_000_1158:
    inc a
    push af
    ld a, $07
    call Call_000_05bf
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    call $6b69
    push af
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    call Call_000_05bf
    pop af
    ret


Call_000_117d:
    inc a
    push af
    ld a, $07
    call Call_000_05bf
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    call $6ac0
    push af
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    call Call_000_05bf
    pop af
    ret


Call_000_11a2:
    ld a, $07
    call Call_000_05bf
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    call $6be8
    push af
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    call Call_000_05bf
    pop af
    ret


Call_000_11c4:
    push af
    ld a, $07
    call Call_000_05bf
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    call $6c0f

Jump_000_11d7:
    push af
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    call Call_000_05bf
    pop af
    ret


Call_000_11e8:
    call Call_000_11f1
    ld a, $0f
    call Call_000_05bf
    ret


Call_000_11f1:
    ld a, $05
    call Call_000_05bf
    ld a, [$d79a]
    ld e, a
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    ld hl, $50ae
    call Call_000_08ba
    ld de, $d7a9
    ld b, $06

jr_000_1213:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_1213

    ld a, $ff
    ld [de], a
    inc de
    ld [de], a
    ld a, $01
    call Call_000_05bf
    ret


Call_000_1224:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $01
    call Call_000_05bf
    ld a, [$d872]
    call Call_000_3394
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1244:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $01
    call Call_000_05bf
    ld a, [$d872]
    call Call_000_1264
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1264:
    ld hl, $ccf0
    ld bc, $02c0
    ld a, $ff

jr_000_126c:
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec bc
    ld a, c
    or b
    jr nz, jr_000_126c

    ld a, [$d79a]
    ld l, a
    ld h, $00
    ld e, a
    ld d, $00
    sla e
    rl d
    call Call_000_08ba
    ld de, $4f6a
    call Call_000_08ba
    ld a, $05
    call Call_000_05bf
    ld a, [hl+]
    push af
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    pop af
    ld [$2000], a
    ld [$d799], a
    ld a, [de]
    ld [$d79b], a
    inc de
    ld a, [de]
    ld [$d79c], a
    inc de
    ld hl, $ccf0
    ld a, [$d79c]
    ld b, a

jr_000_12ad:
    push hl
    ld a, [$d79b]
    ld c, a

jr_000_12b2:
    ld a, [de]
    inc de
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl+], a
    dec c
    jr nz, jr_000_12b2

    pop hl
    ld a, $60
    call Call_000_088f
    dec b
    jr nz, jr_000_12ad

    ld hl, $d572
    ld bc, $0156
    ld a, $ff
    call Call_000_080f
    ld b, $00
    ld hl, $d572

jr_000_12d4:
    ld a, [de]
    inc de
    cp $ff
    jr z, jr_000_12ef

    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, $ff
    ld [hl+], a
    ld a, $08
    ld [hl+], a
    inc b
    ld a, b
    cp $38
    jr nz, jr_000_12d4

jr_000_12ef:
    ret


Call_000_12f0:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $408c
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1310:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $4115
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1330:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $41da
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1350:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $41f4
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1370:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $4333
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1390:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $4456
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_13b0:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $44c4
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_13d0:
    ld [$d872], a
    ld a, [$d799]
    push af

Jump_000_13d7:
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $459c
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_13f0:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $01
    call Call_000_05bf
    ld a, [$d872]
    call $4804
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1410:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $01
    call Call_000_05bf
    ld a, [$d872]
    call $480b
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1430:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $4b98
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1450:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $4d9f
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1470:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $4d87
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1490:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $4d3d
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_14b0:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $4e0e
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_14d0:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $4e8d
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_14f0:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $4ed6
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1510:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $4f20
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1530:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $4f53
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1550:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $4f6a
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1570:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $4242
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1590:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $53c8
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_15b0:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $431b
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_15d0:
Jump_000_15d0:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $54b6
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_15f0:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $55ad
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1610:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $55f5
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1630:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $5a94
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $5aab
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1670:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $5ab0
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $5ab5
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_16b0:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $5ad6
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_16d0:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $5e87
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_16f0:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $5ec9
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1710:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $586a
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1730:
    di
    push hl
    ld hl, $c006
    ld de, $0048
    ld a, $c3
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ldh a, [$80]
    ld [$2000], a
    trap $11
    trap $00
    pop hl
    ret


Call_000_174a:
    push af
    ld hl, $c006
    ld de, $05e3
    ld a, $c3
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, [$d799]
    ld [$2000], a
    pop af
    ei
    ret


Call_000_1761:
    call Call_000_1730
    ld e, l
    ld d, h
    ld c, $00
    trap $7c
    jr c, jr_000_1770

    ld a, $00
    jr z, jr_000_1772

jr_000_1770:
    ld a, $01

jr_000_1772:
    call Call_000_174a
    ret


Call_000_1776:
    call Call_000_1730
    trap $73
    jr c, jr_000_1781

    ld a, $00
    jr z, jr_000_1783

jr_000_1781:
    ld a, $01

jr_000_1783:
    call Call_000_174a
    ret


Call_000_1787:
    call Call_000_1730
    trap $72
    jr c, jr_000_1792

    ld a, $00
    jr jr_000_1794

jr_000_1792:
    ld a, $01

jr_000_1794:
    call Call_000_174a
    ret


Call_000_1798:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $5b56
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_17b8:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $5c4f
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_17d8:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $5dff
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_17f8:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $7293
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1818:
Jump_000_1818:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $729a
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1838:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $732e
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1858:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $753c
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1878:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $759f
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1898:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $75ce
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_18b8:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call Call_000_18d8
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_18d8:
    ld a, [$d79f]
    ld b, a
    ld a, [$d7a0]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    and $f0
    ld b, a
    ld a, [$d910]
    or b
    ld [hl], a
    call Call_000_09df
    call Call_000_0927
    ld a, $05
    call Call_000_05bf
    ld hl, $4f64
    call Call_000_0bcf
    ld a, $0f
    call Call_000_0cbf
    call Call_000_09eb
    ld a, $08
    call Call_000_0c65
    call Call_000_0d30
    call Call_000_1224
    call Call_000_33d9
    ret


Call_000_1914:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $7672
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1934:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $76a3
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1954:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $777a
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1974:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call Call_000_1994
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1994:
    ld a, $04
    call Call_000_05bf
    ld hl, $5b80
    ld de, $c1a0
    ld b, $14
    ld c, $12
    call Call_000_3b36
    ret


Call_000_19a7:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call Call_000_19c7
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_19c7:
    ld a, $04
    call Call_000_05bf
    ld a, [$d87c]
    ld b, a
    ld a, [$d87b]
    cp $ff
    jr z, jr_000_1a09

    sub b
    push af
    and $03
    ld b, a
    sla a
    sla a
    add b
    ld b, a
    pop af
    and $fc
    ld c, a
    call Call_000_093f
    push hl
    pop de
    ld hl, $5b94
    ld c, $04

jr_000_19f0:
    push hl
    push de
    ld b, $05

jr_000_19f4:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_19f4

    pop de
    pop hl
    ld a, $28
    call Call_000_088f
    ld a, $40
    call Call_000_08a1
    dec c
    jr nz, jr_000_19f0

jr_000_1a09:
    ret


Call_000_1a0a:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call Call_000_1a2a
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1a2a:
    call Call_000_09df
    call Call_000_0927
    ld a, $04
    call Call_000_05bf
    ld hl, $5e50
    ld de, $8800
    ld bc, $00a0
    call Call_000_0a36
    ld a, $03
    call Call_000_05bf
    ld a, [$db03]
    cp $00
    jr z, jr_000_1a52

    ld hl, $4600
    jr jr_000_1a55

jr_000_1a52:
    ld hl, $4000

jr_000_1a55:
    ld de, $9200
    ld bc, $0060
    call Call_000_0a36
    ld a, $01
    call Call_000_09f9
    ret


Call_000_1a64:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call Call_000_1a84
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1a84:
    ld a, $04
    call Call_000_05bf
    ld hl, $5d74
    ld de, $c4a0
    ld b, $14
    ld c, $06
    call Call_000_3b36
    ret


Call_000_1a97:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $77be
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1ab7:
    call Call_000_09df
    ld a, $00
    call Call_000_09f9
    ld a, $05
    call Call_000_05bf
    ld hl, $4f22
    call Call_000_0bcf
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    call $5f0b
    pop af
    ld [$d799], a
    ld [$2000], a
    ret


Call_000_1ade:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $6061
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1afe:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $60fa
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1b1e:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $612d
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1b3e:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $6183
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1b5e:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $61b5
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1b7e:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $6201
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1b9e:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $6230
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1bbe:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $624a
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $6255
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1bfe:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $6275
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1c1e:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $62c3
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1c3e:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $6323
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1c5e:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $6567
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1c7e:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $65bc
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1c9e:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07
    call Call_000_05bf
    ld a, [$d872]
    call Call_000_09df
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    ld a, $12
    call Call_000_05bf
    ld hl, $4000
    ld de, $8800
    ld b, $00
    call Call_000_0a36
    ld a, $01
    call Call_000_09f9
    ld a, $01
    call Call_000_05bf
    call Call_000_0927
    call Call_000_0933
    call Call_000_0abb
    call Call_000_085d
    call Call_000_0abb
    call Call_000_085d
    call Call_000_09eb
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1cf5:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $6a2d
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1d15:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $6c14
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1d35:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $425d
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1d55:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $4264
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1d75:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $6dd4
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1d95:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $6ded
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1db5:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $6e56
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1dd5:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $6f64
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1df5:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $6fdf
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Jump_000_1e15:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $7038
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1e35:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $70f7
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1e55:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $7184
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1e75:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $01
    call Call_000_05bf
    ld a, [$d872]
    call $4750
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1e95:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call Call_000_05bf
    ld a, [$d872]
    call $7230
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Jump_000_1eb5:
    call Call_000_07f1
    ld a, $00
    ld [$db1e], a
    jr jr_000_1ec4

Jump_000_1ebf:
    ld a, $01
    ld [$db1e], a

jr_000_1ec4:
    ld a, $00
    ld [$d86d], a
    ld hl, $c000
    ld de, $0048
    ld a, $c3
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $c3
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld de, $05e3
    ld a, $c3
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, d

Jump_000_1ee6:
    ld [hl+], a
    ldh a, [rLCDC]
    and $7f
    ldh [rLCDC], a
    di
    ld sp, $ddff
    ld a, $00
    ld [$d7a6], a
    ld a, $0a
    ld [$0000], a
    ld a, $0f
    call Call_000_05bf
    call $4000
    ld a, $01
    call Call_000_05bf
    ldh [$94], a
    ei
    ld a, [$db1e]
    cp $00
    jr nz, jr_000_1f24

    di
    ld a, $0e
    ld [$2000], a
    ld [$d799], a
    call $4000
    ld a, $01
    call Call_000_05bf
    ei

jr_000_1f24:
    call Call_000_0808
    call Call_000_0874
    call Call_000_0ca4
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp z, Jump_000_1f4c

    bit 1, a
    jp z, Jump_000_1f4c

    bit 3, a
    jp z, Jump_000_1f4c

    bit 2, a
    jp z, Jump_000_1f4c

    jp Jump_000_1f98


Jump_000_1f4c:
    call Call_000_110f
    cp $88
    jr nz, jr_000_1f98

    ld a, $0c
    push af
    call Call_000_117d
    ld a, [$d8f1]
    ld [$d79a], a
    call Call_000_0927
    call Call_000_1244
    pop af
    call Call_000_10ae
    ld a, $00
    ld [$d7a2], a
    ld [$d8e6], a
    ld [$d8e7], a
    call Call_000_1224
    call Call_000_33d9
    ld a, $01
    ld [$db18], a
    ld a, $00
    ld [$d7a7], a
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    call Call_000_1610
    cp $ff
    jp z, Jump_000_1f98

    jp Jump_000_28c9


Jump_000_1f98:
jr_000_1f98:
    call Call_000_09df
    ld a, $05
    call Call_000_05bf
    ld hl, $4000
    call Call_000_0bcf
    ld a, $01
    call Call_000_0cbf
    call Call_000_09eb

Jump_000_1fae:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 3, a
    jp z, Jump_000_1fae

    ld a, $01
    call Call_000_0d07

Jump_000_1fc0:
    call Call_000_110e
    call Call_000_0de7
    ld a, $02
    call Call_000_0cbf

Jump_000_1fcb:
    ld a, $00
    ld [$d8df], a

Jump_000_1fd0:
jr_000_1fd0:
    ld a, [$d7b3]
    cp $00
    jr nz, jr_000_200a

    call Call_000_11a2
    ld hl, $4080
    cp $00
    jr z, jr_000_1fe4

    ld hl, $4105

jr_000_1fe4:
    call Call_000_0e3e
    cp $00
    jr nz, jr_000_1fd0

    ld a, [$d8df]
    cp $00
    jp z, Jump_000_2038

    cp $01
    jp z, Jump_000_20b4

    cp $02
    jp z, Jump_000_2145

    cp $03
    jp z, Jump_000_23d9

    cp $04
    jp z, Jump_000_25d2

    jp Jump_000_1fd0


jr_000_200a:
    call Call_000_11a2
    ld hl, $40c8
    cp $00
    jr z, jr_000_2017

    ld hl, $415c

jr_000_2017:
    call Call_000_0e3e
    cp $00
    jr nz, jr_000_1fd0

    ld a, [$d8df]
    cp $00
    jp z, Jump_000_2038

    cp $01
    jp z, Jump_000_20b4

    cp $02
    jp z, Jump_000_2145

    cp $03
    jp z, Jump_000_25d2

    jp Jump_000_1fd0


Jump_000_2038:
    ld a, $00
    ld [$d8df], a

jr_000_203d:
    ld hl, $41a8
    call Call_000_0e3e
    cp $00
    jp nz, Jump_000_1fcb

    ld a, [$d8df]
    cp $00
    jp z, Jump_000_2057

    cp $01
    jp z, Jump_000_2074

    jr jr_000_203d

Jump_000_2057:
    ld a, $00
    ld [$d8e8], a
    ld a, $00
    ld [$d7a8], a
    call Call_000_0ec6
    cp $00
    jp nz, Jump_000_2038

    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    jp Jump_000_27fb


Jump_000_2074:
    call Call_000_0f56
    cp $00
    jp z, Jump_000_2084

    ld a, $02
    call Call_000_0cbf
    jp Jump_000_2038


Jump_000_2084:
    ld a, [$d79a]
    ld b, $00
    cp $10
    jr c, jr_000_20aa

    ld b, $01
    cp $20
    jr c, jr_000_20aa

    ld b, $02
    cp $4c
    jr c, jr_000_20a3

    ld b, $00
    cp $5c
    jr c, jr_000_20aa

    ld b, $01
    jr jr_000_20aa

jr_000_20a3:
    ld a, b
    ld [$d7a8], a
    jp Jump_000_27de


jr_000_20aa:
    ld a, b
    ld [$d7a8], a
    call Call_000_2715
    jp Jump_000_27de


Jump_000_20b4:
    ld a, $00
    ld [$d8df], a

jr_000_20b9:
    ld hl, $41d1
    call Call_000_0e3e
    cp $00
    jp nz, Jump_000_1fcb

    ld a, [$d8df]
    cp $00
    jp z, Jump_000_20dd

    cp $01

Call_000_20ce:
    jp z, Jump_000_20f0

    cp $02

Jump_000_20d3:
    jp z, Jump_000_2103

    cp $03
    jp z, Jump_000_2142

Jump_000_20db:
    jr jr_000_20b9

Jump_000_20dd:
    ld a, $00
    ld [$d7a8], a
    ld a, $00
    ld [$d79a], a
    call Call_000_2645
    call Call_000_2715
    jp Jump_000_27de


Jump_000_20f0:
    ld a, $01
    ld [$d7a8], a
    ld a, $10
    ld [$d79a], a
    call Call_000_2645
    call Call_000_2715
    jp Jump_000_27de


Jump_000_2103:
    ld a, $00
    ld [$d8df], a

jr_000_2108:
    ld hl, $42e4
    call Call_000_0e3e
    cp $00
    jp nz, Jump_000_1fcb

    ld a, [$d8df]
    cp $00
    jp z, Jump_000_2122

    cp $01
    jp z, Jump_000_2132

    jr jr_000_2108

Jump_000_2122:
    call Call_000_102b
    cp $00
    jp nz, Jump_000_2103

    ld a, $02
    ld [$d7a8], a
    jp Jump_000_27de


Jump_000_2132:
    call Call_000_104b
    cp $00
    jp nz, Jump_000_2103

    ld a, $02
    ld [$d7a8], a
    jp Jump_000_27de


Jump_000_2142:
    jp Jump_000_2869


Jump_000_2145:
    ld a, $00
    ld [$d8df], a

Jump_000_214a:
    ld hl, $4261
    call Call_000_0e3e
    cp $00
    jp nz, Jump_000_1fcb

    ld a, [$d8df]
    cp $00
    jp z, Jump_000_216a

    cp $01
    jp z, Jump_000_217a

    cp $02
    jp z, Jump_000_219e

    jp Jump_000_1fd0


Jump_000_216a:
    call Call_000_100b
    cp $00
    jp nz, Jump_000_214a

    ld a, $04
    ld [$d7a8], a
    jp Jump_000_2828


Jump_000_217a:
    ld a, $00
    ld [$d8e8], a
    ld a, $04
    ld [$d7a8], a
    call Call_000_0f0e
    cp $00
    jp nz, Jump_000_214a

    ld a, $04
    ld [$d7a8], a
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    add $06
    jp Jump_000_2847


Jump_000_219e:
    ld a, $00
    ld [$d8e8], a
    ld a, $04
    ld [$d7a8], a
    call Call_000_0f0e
    cp $00
    jp nz, Jump_000_2145

    ld a, $03
    ld [$d7a8], a
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    add $06
    jp Jump_000_2869


Jump_000_21c2:
    ld a, $00
    ld [$d8e9], a
    ld [$d8ea], a
    call Call_000_0f36
    call Call_000_0e86
    call Call_000_0927
    call Call_000_0c3c
    ld a, $00
    ld [$d8e8], a
    ld a, $04
    ld [$d7a8], a
    call Call_000_0f0e
    push af
    call Call_000_0de7
    call Call_000_0927
    pop af
    cp $00
    jp nz, Jump_000_23de

    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    add $06
    inc a
    ld [$d86e], a
    ld hl, $d000
    ld hl, $43a2
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0c3c
    ld a, b
    cp $00
    jr z, jr_000_221f

    ld a, $0d
    call Call_000_0d07
    jp Jump_000_23de


jr_000_221f:
    call Call_000_0927

Call_000_2222:
    ld a, $0a
    call Call_000_0d07
    ld hl, $43ee
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0d30
    call Call_000_085d
    call Call_000_085d
    call Call_000_085d
    call Call_000_085d
    ld hl, $d000
    ld a, $54
    ld [hl+], a
    ld a, $52
    ld [hl+], a
    ld a, $41
    ld [hl+], a
    ld a, $4e
    ld [hl+], a
    ld a, $43
    ld [hl+], a
    ld a, $45
    ld [hl+], a
    ld a, [$d86e]
    ld [hl], a
    call Call_000_1787
    cp $00
    jr nz, jr_000_2287

    ld a, $0a
    call Call_000_0d07
    ld hl, $445d
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0c3c
    ld a, $ff
    ld [$db08], a
    ld a, $02
    call Call_000_0cbf
    jp Jump_000_23d9


jr_000_2287:
    ld hl, $4475
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0c3c
    ld a, $ff
    ld [$db08], a
    ld a, $02
    call Call_000_0cbf
    jp Jump_000_23d9


Jump_000_22a5:
    ld a, $00
    ld [$d8e9], a
    ld [$d8ea], a
    call Call_000_0f36
    call Call_000_0ea6
    call Call_000_0927
    call Call_000_0c3c
    ld a, $01
    ld [$d8e8], a
    ld a, $04
    ld [$d7a8], a

Jump_000_22c3:
    call Call_000_0f0e
    push af
    call Call_000_0de7
    call Call_000_0927
    pop af
    cp $00
    jp nz, Jump_000_23de

    ld hl, $43a2
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0c3c
    ld a, b
    cp $00
    jr z, jr_000_22f1

    ld a, $0d
    call Call_000_0d07
    jp Jump_000_23de


jr_000_22f1:
    call Call_000_0927
    ld a, $0a
    call Call_000_0d07
    ld hl, $4425
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0d30
    call Call_000_085d
    call Call_000_085d
    call Call_000_085d
    call Call_000_085d
    ld hl, $d000
    ld a, $52
    ld [hl+], a
    ld a, $45
    ld [hl+], a
    ld a, $43
    ld [hl+], a
    ld a, $45
    ld [hl+], a
    ld a, $49
    ld [hl+], a
    ld a, $56
    ld [hl+], a
    ld a, $45
    ld [hl+], a
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    add $06
    inc a
    ld [hl], a
    call Call_000_1787
    cp $00
    jr nz, jr_000_23b6

    ld hl, $d000
    ld a, [hl+]
    cp $4e
    jr nz, jr_000_23b6

    ld a, [hl+]
    cp $45
    jr nz, jr_000_23b6

    ld a, [hl+]
    cp $43
    jr nz, jr_000_23b6

    ld a, [hl+]
    cp $54
    jr nz, jr_000_23b6

    ld a, [hl+]
    cp $41
    jr nz, jr_000_23b6

    ld a, [hl+]
    cp $52
    jr nz, jr_000_23b6

    ld hl, $d000
    ld bc, $01fe
    ld d, $00

jr_000_236a:
    ld a, [hl+]
    add d
    ld d, a
    dec bc
    ld a, b
    or c
    jr nz, jr_000_236a

    ld a, d
    push af
    ld hl, $d000
    ld de, $01ff
    call Call_000_08ba
    pop af
    ld b, a
    ld a, [hl]
    cp b
    jr nz, jr_000_23b6

    ld a, $0a
    call Call_000_0d07
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    add $06
    ld hl, $d000
    call Call_000_1158
    ld hl, $445d
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0c3c
    ld a, $ff
    ld [$db08], a
    ld a, $02
    call Call_000_0cbf
    jp Jump_000_23de


jr_000_23b6:
    ld a, $0d
    call Call_000_0d07
    ld hl, $4475
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0c3c
    ld a, $ff
    ld [$db08], a
    ld a, $02
    call Call_000_0cbf
    jp Jump_000_23de


Jump_000_23d9:
    ld a, $00
    ld [$d8df], a

Jump_000_23de:
    ld hl, $4210
    call Call_000_0e3e
    cp $00
    jp nz, Jump_000_1fcb

    ld a, [$d8df]
    cp $00
    jp z, Jump_000_2408

    cp $01
    jp z, Jump_000_24ce

    cp $02
    jp z, Jump_000_21c2

    cp $03
    jp z, Jump_000_22a5

    cp $04
    jp z, Jump_000_25c8

    jp Jump_000_23de


Jump_000_2408:
    ld a, $00
    ld [$d8e9], a
    ld [$d8ea], a
    call Call_000_0f36
    call Call_000_0e86
    call Call_000_0927
    call Call_000_0c3c
    ld a, $00
    ld [$d8e8], a
    ld a, $04
    ld [$d7a8], a
    call Call_000_0f0e
    push af
    call Call_000_0de7
    call Call_000_0927
    pop af
    cp $00
    jp nz, Jump_000_23de

    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    add $06
    ld hl, $d000
    call Call_000_1131
    ld hl, $435d
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0c3c
    ld a, b
    cp $00
    jr z, jr_000_2464

    ld a, $0d
    call Call_000_0d07
    jp Jump_000_23de


jr_000_2464:
    ld a, $0a
    call Call_000_0d07
    ld hl, $43ee
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0d30
    call Call_000_085d
    call Call_000_085d
    call Call_000_085d
    call Call_000_085d
    call Call_000_1787
    cp $00
    jr nz, jr_000_24b0

    ld a, $0a
    call Call_000_0d07
    ld hl, $445d
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0c3c
    ld a, $ff
    ld [$db08], a
    ld a, $02
    call Call_000_0cbf
    jp Jump_000_23d9


jr_000_24b0:
    ld hl, $4475
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0c3c
    ld a, $ff
    ld [$db08], a
    ld a, $02
    call Call_000_0cbf
    jp Jump_000_23d9


Jump_000_24ce:
    ld a, $00
    ld [$d8e9], a
    ld [$d8ea], a
    call Call_000_0f36
    call Call_000_0ea6
    call Call_000_0927
    call Call_000_0c3c
    ld a, $01
    ld [$d8e8], a
    ld a, $04
    ld [$d7a8], a
    call Call_000_0f0e
    push af
    call Call_000_0de7
    call Call_000_0927
    pop af
    cp $00
    jp nz, Jump_000_23de

    ld hl, $435d
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0c3c
    ld a, b
    cp $00
    jr z, jr_000_251a

    ld a, $0d
    call Call_000_0d07
    jp Jump_000_23de


jr_000_251a:
    ld a, $0a
    call Call_000_0d07
    ld hl, $4425
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0d30
    call Call_000_085d
    call Call_000_085d
    call Call_000_085d
    call Call_000_085d
    ld hl, $d000
    call Call_000_1761
    cp $00
    jr nz, jr_000_25a5

    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 1, a
    jp nz, Jump_000_25a5

    ld hl, $d100
    call Call_000_1761
    cp $00
    jr nz, jr_000_25a5

    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 1, a
    jp nz, Jump_000_25a5

    call Call_000_1776
    cp $00
    jp nz, Jump_000_25a5

    ld a, $0a
    call Call_000_0d07
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    add $06
    ld hl, $d000
    call Call_000_1158
    ld hl, $445d
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0c3c
    ld a, $ff
    ld [$db08], a
    ld a, $02
    call Call_000_0cbf
    jp Jump_000_23de


Jump_000_25a5:
jr_000_25a5:
    ld a, $0d
    call Call_000_0d07
    ld hl, $4475
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0c3c
    ld a, $ff
    ld [$db08], a
    ld a, $02
    call Call_000_0cbf
    jp Jump_000_23de


Jump_000_25c8:
    call Call_000_0ca4
    di
    trap $00
    trap $11
    trap $61

Jump_000_25d2:
    ld a, $00
    ld [$d8df], a

Jump_000_25d7:
jr_000_25d7:
    ld hl, $42a7
    call Call_000_0e3e
    cp $00
    jp nz, Jump_000_1fcb

    ld a, [$d8df]
    cp $00
    jp z, Jump_000_25fb

    cp $01
    jp z, Jump_000_2615

    cp $02
    jp z, Jump_000_2625

    cp $03
    jp z, Jump_000_2635

    jr jr_000_25d7

Jump_000_25fb:
    call Call_000_106b
    cp $00
    jp nz, Jump_000_25d7

    ld b, $00
    ld a, [$d79a]
    cp $10
    jr c, jr_000_260e

    ld b, $01

jr_000_260e:
    ld a, b
    ld [$d7a8], a
    jp Jump_000_27de


Jump_000_2615:
    call Call_000_106b
    cp $00
    jp nz, Jump_000_25d7

    ld a, $14
    ld [$d7a8], a
    jp Jump_000_27de


Jump_000_2625:
    call Call_000_106b
    cp $00
    jp nz, Jump_000_25d7

    ld a, $0a
    ld [$d7a8], a
    jp Jump_000_27de


Jump_000_2635:
    call Call_000_106b
    cp $00
    jp nz, Jump_000_25d7

    ld a, $1e
    ld [$d7a8], a
    jp Jump_000_27de


Call_000_2645:
    call Call_000_09df
    call Call_000_0d30
    call Call_000_0927
    ld a, $05
    call Call_000_05bf
    ld hl, $4f10
    call Call_000_0bcf
    ld a, $03
    call Call_000_0cbf
    call Call_000_09eb
    ld a, $06
    call Call_000_0c65
    ld a, b
    cp $02
    jp nz, Jump_000_2711

    call Call_000_09df
    ld a, $05
    call Call_000_05bf
    ld hl, $4f46
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $08
    call Call_000_0c65
    ld a, b
    cp $02
    jp nz, Jump_000_2711

    call Call_000_09df
    ld a, $05
    call Call_000_05bf
    ld hl, $4f16
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $06
    call Call_000_0c65
    ld a, b
    cp $02
    jp nz, Jump_000_2711

    call Call_000_09df
    ld a, $05
    call Call_000_05bf
    ld hl, $4f4c
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $08
    call Call_000_0c65
    ld a, b
    cp $02
    jp nz, Jump_000_2711

    call Call_000_09df
    ld a, $05
    call Call_000_05bf
    ld hl, $4f1c
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $06
    call Call_000_0c65
    ld a, b
    cp $02
    jr nz, jr_000_2711

    call Call_000_09df
    ld a, $05
    call Call_000_05bf
    ld hl, $4f52
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $08
    call Call_000_0c65
    ld a, b
    cp $02
    jr nz, jr_000_2711

    call Call_000_09df
    ld a, $05
    call Call_000_05bf
    ld hl, $4f58
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $08
    call Call_000_0c65
    ld a, b
    cp $02
    jr nz, jr_000_2711

Jump_000_2711:
jr_000_2711:
    call Call_000_09df
    ret


Call_000_2715:
    call Call_000_09df
    call Call_000_0d30
    ld a, $05
    call Call_000_05bf
    ld hl, $4f0a
    call Call_000_0bcf
    ld a, $06
    call Call_000_0cbf
    call Call_000_0927
    ld a, $03
    call Call_000_09f9
    call Call_000_09eb

jr_000_2736:
    call Call_000_17d8
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jr z, jr_000_2736

    ld a, $08
    call Call_000_0d07
    ret


Call_000_274b:
    call Call_000_09df
    call Call_000_0d30
    call Call_000_0927
    ld a, $05
    call Call_000_05bf
    ld hl, $4f28
    call Call_000_0bcf
    ld a, $12
    call Call_000_0cbf
    call Call_000_09eb
    ld a, $0a
    call Call_000_0c65
    call Call_000_09df
    ld a, $05
    call Call_000_05bf
    ld hl, $4f2e
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $0b
    call Call_000_0c65
    call Call_000_09df
    ld a, $05
    call Call_000_05bf
    ld hl, $4f34
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $0b
    call Call_000_0c65
    call Call_000_09df
    ld a, $05
    call Call_000_05bf
    ld hl, $4f3a
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $0b
    call Call_000_0c65
    call Call_000_09df
    ld a, $05
    call Call_000_05bf
    ld hl, $4f40
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $0b
    call Call_000_0c65
    call Call_000_09df
    ld a, $05
    call Call_000_05bf
    ld hl, $4f5e
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $0b
    call Call_000_0c65
    call Call_000_0d30
    ret


Jump_000_27de:
    call Call_000_2899
    call Call_000_0927
    call Call_000_1244
    call Call_000_1224
    call Call_000_33d9
    call Call_000_3e3f
    call Call_000_3493
    ld a, $01
    ld [$d86c], a
    jp Jump_000_28c9


Jump_000_27fb:
    push af
    call Call_000_117d
    ld a, [$d8f1]
    ld [$d79a], a
    call Call_000_0927
    call Call_000_1244
    pop af
    call Call_000_10ae
    ld a, $00
    ld [$d7a2], a
    ld [$d8e6], a
    ld [$d8e7], a
    call Call_000_1224
    call Call_000_33d9
    ld a, $01
    ld [$d86c], a
    jp Jump_000_28c9


Jump_000_2828:
    call Call_000_0927
    call Call_000_1244
    ld hl, $d572
    ld bc, $0150
    ld a, $ff
    call Call_000_080f
    call Call_000_2899
    call Call_000_1224
    ld a, $05
    call Call_000_0cbf
    jp Jump_000_34af


Jump_000_2847:
    push af
    call Call_000_117d
    ld a, [$d8f1]
    ld [$d79a], a
    call Call_000_0927
    call Call_000_1244
    pop af
    call Call_000_10ae
    call Call_000_2899
    call Call_000_1224
    ld a, $05
    call Call_000_0cbf
    jp Jump_000_34af


Jump_000_2869:
    push af
    call Call_000_117d
    ld a, [$d8f1]
    ld [$d79a], a
    call Call_000_0927
    call Call_000_1244
    pop af
    call Call_000_10ae
    call Call_000_2899
    ld a, $03
    ld [$d7a8], a
    call Call_000_1224
    call Call_000_3493
    call Call_000_33d9
    call Call_000_3e3f
    ld a, $01
    ld [$d86c], a
    jp Jump_000_28c9


Call_000_2899:
    ld a, $00
    ld [$d7a3], a
    ld [$d7a4], a
    ld [$d7a5], a
    ld a, $05
    ld [$d79f], a
    ld [$d7a0], a
    ld a, $00
    ld [$d7a2], a
    ld [$d79d], a
    ld [$d79e], a
    ld [$d8e6], a
    ld [$d8e7], a
    ld hl, $d7c5
    ld bc, $0064
    ld a, $ff
    call Call_000_080f
    ret


Jump_000_28c9:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_000_28c9

    ld a, $00
    ld [$d7a7], a
    call Call_000_0927
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    call Call_000_14b0
    ld a, [$d7a8]
    cp $1e
    jr nz, jr_000_28f4

    jp $4000


jr_000_28f4:
    ld a, [$d7a8]
    cp $14
    jr z, jr_000_2919

    cp $0a
    jr z, jr_000_290c

    ld a, [$d7a4]
    and $01
    cp $00
    jp z, Jump_000_2919

    jp $4000


jr_000_290c:
    ld a, [$d7a4]
    and $01
    cp $00
    jp nz, Jump_000_2919

    jp $4000


Jump_000_2919:
jr_000_2919:
    ld a, [$d86c]
    cp $00
    jr z, jr_000_2927

    xor a
    ld [$d86c], a
    call Call_000_10d3

Jump_000_2927:
jr_000_2927:
    call Call_000_33d9
    call Call_000_1590
    cp $00
    jp nz, Jump_000_3272

    ld a, $00
    ld [$d7a1], a
    ld a, $01
    ld [$d879], a
    call Call_000_1610
    cp $00
    jp nz, Jump_000_2a60

    ld a, [$d79f]
    ld b, a
    ld a, [$d7a0]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    and $0f
    cp $0b
    jp c, Jump_000_2a3b

    cp $0e
    jp nc, Jump_000_2a3b

    call Call_000_1878
    ld a, [$d87a]
    cp $ff
    jp z, Jump_000_2a3b

    ld a, $08
    call Call_000_0d07
    call Call_000_17f8
    cp $00
    jp nz, Jump_000_2927

    ld a, [$d79f]
    ld b, a
    ld a, [$d7a0]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    and $0f
    push af
    ld a, [$d910]
    ld b, a
    pop af
    cp b
    jp nz, Jump_000_28c9

    ld a, [$d87b]
    ld hl, $d87e
    call Call_000_088f
    ld a, [hl]
    ld [$d7b5], a
    call Call_000_1954
    call $47b8
    call Call_000_15f0
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    ld a, [$db17]
    cp $00
    jr nz, jr_000_29c4

    ld a, [$db16]
    cp $00
    jr nz, jr_000_29c4

    ld a, $0d
    call Call_000_0d07
    call Call_000_1630
    jp Jump_000_28c9


Jump_000_29c4:
jr_000_29c4:
    ld a, $00
    ld [$d7a1], a
    call Call_000_1610
    cp $00
    jp nz, Jump_000_2a29

    ld a, [$d79f]
    ld b, a
    ld a, [$d7a0]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    bit 5, a
    jp z, Jump_000_2a14

    ld a, $08
    call Call_000_0d07

Jump_000_29e7:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_000_29e7

    call Call_000_1798
    cp $00
    jp nz, Jump_000_2a14

    call Call_000_0927
    call Call_000_15b0
    call Call_000_1630
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    call Call_000_1630
    jp Jump_000_28c9


Jump_000_2a14:
    ld a, $0e
    call Call_000_0d07

Jump_000_2a19:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_000_2a19

    jp Jump_000_29c4


Jump_000_2a29:
    cp $01
    jr nz, jr_000_2a38

    ld a, $0d
    call Call_000_0d07
    call Call_000_1630
    jp Jump_000_28c9


jr_000_2a38:
    jp Jump_000_29c4


Jump_000_2a3b:
    call Call_000_0db5
    call Call_000_1530
    cp $00
    jp nz, Jump_000_2927

    ld a, [$d7c2]
    cp $00
    jp z, Jump_000_2b88

    cp $01
    jp z, Jump_000_2fa8

    cp $02
    jp z, Jump_000_3250

    cp $03
    jp z, Jump_000_326c

    jp Jump_000_2927


Jump_000_2a60:
    cp $01
    jp nz, Jump_000_2a75

    ld a, [$d7b8]
    cp $00
    jp z, Jump_000_2927

    ld a, $01
    ld [$d7b8], a
    jp Jump_000_2927


Jump_000_2a75:
    cp $03
    jp nz, Jump_000_2b64

    ld a, [$d7a8]
    cp $0a
    jr c, jr_000_2aca

    call Call_000_0db5
    ld a, $08
    call Call_000_0d07
    call Call_000_0d4b
    ld a, [$d79f]
    ld [$db04], a
    ld a, [$d7a0]
    ld [$db05], a
    ld a, [$d79d]
    ld [$db06], a
    ld a, [$d79e]
    ld [$db07], a
    push bc
    call Call_000_0de7
    ld a, $05
    call Call_000_0cbf
    ld a, $00
    ld [$d8df], a

jr_000_2ab2:
    ld hl, $433b
    call Call_000_0e3e
    cp $00
    jp nz, Jump_000_2b43

    ld a, [$d8df]
    cp $00
    jr z, jr_000_2b3d

    cp $01
    jr z, jr_000_2b43

    jr jr_000_2ab2

jr_000_2aca:
    call Call_000_0db5
    ld a, $08
    call Call_000_0d07
    call Call_000_0d4b
    ld a, [$d79f]
    ld [$db04], a
    ld a, [$d7a0]
    ld [$db05], a
    ld a, [$d79d]
    ld [$db06], a
    ld a, [$d79e]
    ld [$db07], a
    push bc
    ld a, $05
    call Call_000_0cbf

jr_000_2af3:
    call Call_000_0de7
    ld a, $00
    ld [$d8df], a

jr_000_2afb:
    ld hl, $430c
    call Call_000_0e3e
    cp $00
    jp nz, Jump_000_2b43

    ld a, [$d8df]
    cp $00
    jr z, jr_000_2b1b

    cp $01
    jr z, jr_000_2b3d

    cp $02
    jr z, jr_000_2b43

    cp $03
    jr z, jr_000_2b40

    jr jr_000_2afb

jr_000_2b1b:
    ld a, $01
    ld [$d8e8], a
    call Call_000_0ec6
    cp $00
    jr nz, jr_000_2af3

    call Call_000_11f1
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    call Call_000_108b
    call Call_000_0eee
    call Call_000_0c3c
    jr jr_000_2b43

jr_000_2b3d:
    jp Jump_000_3370


jr_000_2b40:
    jp Jump_000_32dc


Jump_000_2b43:
jr_000_2b43:
    ld a, [$db04]
    ld [$d79f], a
    ld a, [$db05]
    ld [$d7a0], a
    ld a, [$db06]
    ld [$d79d], a
    ld a, [$db07]
    ld [$d79e], a
    call Call_000_1224
    call Call_000_0d5f
    jp Jump_000_2927


Jump_000_2b64:
    cp $02
    jp nz, Jump_000_2b85

    call Call_000_1490
    cp $ff
    jp z, Jump_000_28c9

    ld [$d7b5], a
    ld a, $08
    call Call_000_0d07
    call Call_000_0d4b
    call Call_000_368a
    call Call_000_0d5f
    jp Jump_000_28c9


Jump_000_2b85:
    jp Jump_000_2927


Jump_000_2b88:
    call Call_000_1490
    cp $ff
    jp z, Jump_000_28c9

    ld c, a
    ld a, [hl]
    and $1f
    cp $00
    jp z, Jump_000_2ba0

    cp $11
    jp z, Jump_000_2ba0

    jr jr_000_2ba8

Jump_000_2ba0:
    ld a, $08
    call Call_000_0d07
    jp Jump_000_28c9


jr_000_2ba8:
    ld b, $01
    cp $0d
    jr z, jr_000_2bb4

    cp $0e
    jr z, jr_000_2bb4

    ld b, $00

jr_000_2bb4:
    ld [$d876], a
    ld a, [hl]
    bit 6, a
    jp nz, Jump_000_28c9

    and $80
    ld b, a
    ld a, [$d7a4]
    rl a
    rl a
    rl a
    rl a
    rl a
    rl a
    rl a
    and $80
    cp b
    jp nz, Jump_000_3244

    ld a, c
    ld [$d7b5], a
    ld a, [$d7b5]
    call Call_000_099b
    push hl
    inc hl
    ld a, [hl+]
    ld [$d7b6], a
    ld a, [hl+]
    ld [$d7b7], a
    pop hl
    call Call_000_1630
    ld a, [$d7b5]
    ld [$d99d], a
    call Call_000_13f0
    call Call_000_1e75
    call Call_000_16b0
    call Call_000_12f0
    call Call_000_1430

Jump_000_2c04:
    call Call_000_0abb
    ld a, $00
    ld [$d876], a
    ld a, [$db17]
    cp $00
    jr nz, jr_000_2c26

    ld a, [$db16]
    cp $01
    jp nc, Jump_000_2c26

    ld a, $08
    call Call_000_0d07
    call Call_000_1630
    jp Jump_000_28c9


Jump_000_2c26:
jr_000_2c26:
    ld a, $01
    ld [$d7a1], a
    ld a, $02
    ld [$d879], a
    ld a, [$d7b5]
    ld [$d878], a
    call Call_000_1610
    cp $00
    jp nz, Jump_000_2f85

    ld a, $01
    ld [$d7bf], a
    ld [$d7c0], a
    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $1f
    ld b, a
    ld a, [hl+]
    and $1f
    ld c, a
    ld a, [$d79f]
    cp b
    jr nz, jr_000_2c9f

    ld a, [$d7a0]
    cp c
    jr nz, jr_000_2c9f

    ld a, $08
    call Call_000_0d07
    ld a, [$d876]
    cp $01
    jp z, Jump_000_2db1

    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    and $1f
    cp $0d
    jr z, jr_000_2c82

    cp $0e
    jr z, jr_000_2c82

    jp Jump_000_2f0b


jr_000_2c82:
    ld a, [hl]
    and $1f
    call Call_000_09b7
    ld a, $0c
    call Call_000_088f
    ld a, [hl]
    inc a
    ld [$d877], a
    ld a, $01
    ld [$d876], a
    ld a, $00
    ld [$d7bf], a
    jp Jump_000_301b


jr_000_2c9f:
    ld a, [$d79f]
    ld b, a
    ld a, [$d7a0]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    bit 5, a
    jp z, Jump_000_2da9

    call Call_000_1490
    cp $ff
    jp nz, Jump_000_2d84

    ld a, $08
    call Call_000_0d07
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

jr_000_2ce6:
    call Call_000_0abb
    call Call_000_14b0
    call Call_000_085d
    call Call_000_14b0
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_000_2d03

    bit 1, a
    jp nz, Jump_000_2d2c

    jr jr_000_2ce6

Jump_000_2d03:
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

Jump_000_2d14:
    call Call_000_0abb
    call Call_000_14b0
    call Call_000_085d
    call Call_000_14b0
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_000_2d14

    jr jr_000_2d84

Jump_000_2d2c:
    ld a, $00
    ld [$d879], a
    ld a, $0e
    call Call_000_0d07
    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    pop bc
    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl+], a

Jump_000_2d42:
    call Call_000_0abb
    call Call_000_14b0
    call Call_000_085d
    call Call_000_14b0
    call Call_000_079c
    ldh a, [$8c]
    bit 1, a
    jp nz, Jump_000_2d42

    ld a, $0d
    call Call_000_0d07
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
    ld a, [$d876]
    cp $00
    jp z, Jump_000_323b

    call Call_000_12f0
    call Call_000_1430
    jp Jump_000_2c26


Jump_000_2d84:
jr_000_2d84:
    call Call_000_1490
    cp $ff
    jp z, Jump_000_2db1

    call Call_000_17b8
    cp $00
    jp nz, Jump_000_2da9

    call Call_000_0db5
    call Call_000_15b0
    call Call_000_1630
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    jp Jump_000_28c9


Jump_000_2da9:
    ld a, $0e
    call Call_000_0d07
    jp Jump_000_2c26


Jump_000_2db1:
    ld a, $08
    call Call_000_0d07
    ld a, [$d79f]
    ld b, a
    ld a, [$d7a0]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    and $0f
    cp $0c
    jr z, jr_000_2dd3

    push af
    ld a, [$d911]
    ld b, a
    pop af
    cp b
    jr z, jr_000_2dd3

    jr jr_000_2e35

jr_000_2dd3:
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    and $1f
    call Call_000_09b7
    ld a, $13
    call Call_000_088f
    ld a, [hl]
    and $90
    cp $80
    jp nz, Jump_000_2c26

    call Call_000_1878
    ld a, [$d87a]
    cp $ff
    jp z, Jump_000_2c26

    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl], a
    inc hl
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
    ld a, [$d7a0]
    and $1f
    ld [hl], a
    call Call_000_0927
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    call Call_000_14b0
    call Call_000_18b8
    call Call_000_1630
    jp Jump_000_28c9


jr_000_2e35:
    push af
    ld a, [$d910]
    ld b, a
    pop af
    cp b
    jp nz, Jump_000_2ead

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
    jr z, jr_000_2e9b

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
    ld a, [$d7a0]
    and $1f
    ld [hl+], a
    inc hl
    ld a, $ff
    ld [hl], a

jr_000_2e9b:
    call Call_000_15b0
    call Call_000_1630
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    jp Jump_000_28c9


Jump_000_2ead:
    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    ld a, [$d79f]
    ld [hl+], a
    ld a, [hl]
    and $e0
    ld b, a
    ld a, [$d7a0]
    or b
    ld [hl+], a
    ld a, [$d79f]
    ld b, a
    ld a, [$d7a0]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    and $0f
    push af
    ld a, [$d913]
    ld b, a
    pop af
    cp b
    jr nz, jr_000_2ef1

    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    and $1f
    call Call_000_09b7
    ld a, $13
    call Call_000_088f
    ld a, [hl]
    and $90
    cp $80
    jp z, Jump_000_3272

jr_000_2ef1:
    ld a, [$d876]
    cp $00
    jr z, jr_000_2f0b

    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl], a
    call Call_000_15b0
    call Call_000_1630
    jp Jump_000_28c9


Jump_000_2f0b:
jr_000_2f0b:
    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    inc hl
    ld a, [hl]
    bit 5, a
    jr z, jr_000_2f2a

    call Call_000_345c
    cp $ff
    jr z, jr_000_2f2a

    call Call_000_099b
    ld a, [hl]
    bit 6, a
    jr nz, jr_000_2f2a

    jp Jump_000_3e96


jr_000_2f2a:
    ld a, [$d7b5]
    ld [$d7c3], a
    call Call_000_346f
    ld a, b
    cp $01
    jr z, jr_000_2f3e

    ld a, c
    cp $01
    jp nz, Jump_000_2f72

jr_000_2f3e:
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    and $1f
    cp $0d
    jr z, jr_000_2f52

    cp $0e
    jr z, jr_000_2f52

    jp Jump_000_301b


jr_000_2f52:
    inc hl
    ld a, [hl+]
    and $1f
    ld b, a
    ld a, [hl+]
    and $1f
    ld c, a
    call Call_000_0969
    inc hl
    ld a, [hl]
    and $0f
    ld [$d877], a
    ld a, $01
    ld [$d876], a
    ld a, $00
    ld [$d7bf], a
    jp Jump_000_301b


Jump_000_2f72:
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl], a
    call Call_000_15b0
    call Call_000_1630
    jp Jump_000_28c9


Jump_000_2f85:
    cp $01
    jr nz, jr_000_2fa5

    ld a, $0d
    call Call_000_0d07
    call Call_000_1630
    ld a, [$d876]
    cp $00
    jr z, jr_000_2fa2

    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl], a

jr_000_2fa2:
    jp Jump_000_28c9


jr_000_2fa5:
    jp Jump_000_2c26


Jump_000_2fa8:
    call Call_000_1490
    cp $ff
    jp z, Jump_000_28c9

    ld c, a
    ld a, [hl]
    and $1f
    cp $00
    jp z, Jump_000_28c9

    ld a, [hl]
    bit 6, a
    jp nz, Jump_000_28c9

    and $80
    ld b, a
    ld a, [$d7a4]
    rl a
    rl a
    rl a
    rl a
    rl a
    rl a
    rl a
    and $80
    cp b
    jp nz, Jump_000_324a

    ld a, c
    ld [$d7b5], a
    inc hl
    ld a, [hl+]
    ld [$d7b6], a
    ld a, [hl+]
    ld [$d7b7], a
    ld a, $00
    ld [$d7bf], a
    ld [$d7c0], a
    ld a, $00
    ld [$d876], a
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    and $1f
    cp $0d
    jr z, jr_000_3006

    cp $0e
    jr z, jr_000_3006

    jr jr_000_301b

jr_000_3006:
    ld a, [hl]
    and $1f
    call Call_000_09b7
    ld a, $0c
    call Call_000_088f
    ld a, [hl]
    inc a
    ld [$d877], a
    ld a, $01
    ld [$d876], a

Jump_000_301b:
jr_000_301b:
    ld a, [$d7b5]
    ld [$d7c3], a
    call Call_000_099b
    inc hl
    inc hl
    ld a, [hl]
    bit 5, a
    jp nz, Jump_000_3033

    call Call_000_1310
    cp $00
    jr nz, jr_000_304f

Jump_000_3033:
    ld a, [$d7c0]
    cp $00
    jr nz, jr_000_3042

    ld a, $0d
    call Call_000_0d07
    jp Jump_000_323b


jr_000_3042:
    ld a, [$d7c3]
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl], a
    jp Jump_000_323b


jr_000_304f:
    call Call_000_1630
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    call Call_000_0abb
    ld a, [$d875]
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $1f
    ld [$daff], a
    ld a, [hl+]
    and $1f
    ld [$db00], a
    call Call_000_1710

Jump_000_3074:
jr_000_3074:
    ld a, $00
    ld [$d7a1], a
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_000_3116

    bit 1, a
    jp nz, Jump_000_3217

    bit 4, a
    jp nz, Jump_000_30aa

    bit 5, a
    jp nz, Jump_000_30e0

    bit 6, a
    jp nz, Jump_000_30c5

    bit 7, a
    jp nz, Jump_000_30fb

    call Call_000_085d
    call Call_000_085d
    call Call_000_1a97
    jr jr_000_3074

Jump_000_30aa:
    ld a, $03

Jump_000_30ac:
    call Call_000_0d07
    call Call_000_0db5
    call Call_000_16d0

Jump_000_30b5:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 4, a
    jp nz, Jump_000_30b5

    jp Jump_000_3074


Jump_000_30c5:
    ld a, $03
    call Call_000_0d07
    call Call_000_0db5
    call Call_000_16d0

Jump_000_30d0:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 6, a
    jp nz, Jump_000_30d0

    jp Jump_000_3074


Jump_000_30e0:
    ld a, $03
    call Call_000_0d07
    call Call_000_0db5
    call Call_000_16f0

Jump_000_30eb:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 5, a
    jp nz, Jump_000_30eb

    jp Jump_000_3074


Jump_000_30fb:
    ld a, $03
    call Call_000_0d07
    call Call_000_0db5
    call Call_000_16f0

Jump_000_3106:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 7, a
    jp nz, Jump_000_3106

    jp Jump_000_3074


Jump_000_3116:
    call Call_000_1490
    cp $ff
    jp nz, Jump_000_3126

    ld a, $0e
    call Call_000_0d07
    jp Jump_000_3074


Jump_000_3126:
    ld [$d7c4], a
    ld b, a
    ld a, [$d7c3]
    cp b
    jr nz, jr_000_3138

Call_000_3130:
    ld a, $0b
    call Call_000_0d07
    jp Jump_000_320a


Call_000_3138:
jr_000_3138:
    ld a, [hl]
    cp $ff
    jp z, Jump_000_3074

    bit 5, a
    jp z, Jump_000_3074

    and $80
    ld d, a
    ld a, [$d7a4]
    rl a
    rl a
    rl a
    rl a
    rl a
    rl a
    rl a
    and $80
    cp d
    jp z, Jump_000_3074

    ld a, $08
    call Call_000_0d07
    call Call_000_346f
    ld a, [$d7c4]
    call Call_000_099b
    ld a, [hl]
    and $3f
    call Call_000_09b7
    ld a, $13
    call Call_000_088f
    ld d, $00
    ld a, [hl]
    and $40
    jr nz, jr_000_3186

    ld a, b
    cp $01
    jr z, jr_000_318f

    ld d, $01
    jr jr_000_318f

jr_000_3186:
    ld a, c
    cp $01
    jr z, jr_000_318f

    ld d, $01
    jr jr_000_318f

jr_000_318f:
    ld a, d
    ld [$da11], a

Jump_000_3193:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jp nz, Jump_000_3193

    call Call_000_3828
    call Call_000_1590
    cp $00
    jp nz, Jump_000_3272

    call Call_000_33d9
    ld a, [$d876]
    cp $00
    jr z, jr_000_320a

    call Call_000_15b0
    call Call_000_1630
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    cp $ff
    jr z, jr_000_320a

    ld a, [$d877]
    cp $02
    jr c, jr_000_320a

    ld a, [$d7b5]
    ld [$d99d], a
    call Call_000_13f0
    call $477f
    call Call_000_16b0
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    ld a, [hl+]
    and $1f
    ld [$d7b6], a
    ld a, [hl+]
    and $1f
    ld [$d7b7], a
    ld a, [$db17]
    cp $00
    jp nz, Jump_000_2c26

    ld a, [$db16]
    cp $01
    jr c, jr_000_320a

    jp Jump_000_2c26


Jump_000_320a:
jr_000_320a:
    ld a, [$d7c3]
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl], a
    jp Jump_000_323b


Jump_000_3217:
    ld a, $0d
    call Call_000_0d07
    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    ld a, [$d7b6]
    ld [hl+], a
    ld a, [$d7b7]
    ld [hl+], a
    jp Jump_000_323b


    jp Jump_000_3074


    ld a, [$d7c3]
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl], a

Jump_000_323b:
    call Call_000_15b0
    call Call_000_1630
    jp Jump_000_28c9


Jump_000_3244:
    call Call_000_1e35
    jp Jump_000_28c9


Jump_000_324a:
    call Call_000_1e55
    jp Jump_000_28c9


Jump_000_3250:
    call Call_000_1490
    cp $ff
    jp z, Jump_000_28c9

    ld [$d7b5], a
    ld a, $08
    call Call_000_0d07
    call Call_000_0d4b
    call Call_000_368a
    call Call_000_0d5f
    jp Jump_000_28c9


Jump_000_326c:
    call Call_000_3c96
    jp Jump_000_28c9


Jump_000_3272:
    call Call_000_1590
    cp $00
    jp z, Jump_000_28c9

    cp $03
    jr c, jr_000_32a6

    cp $05
    jr z, jr_000_32c1

    ld b, a
    ld a, [$d7a8]
    cp $0a
    jr z, jr_000_3298

    ld a, b
    cp $03
    jp z, Jump_000_3370

    cp $04
    jp z, Jump_000_32dc

    jp Jump_000_28c9


jr_000_3298:
    ld a, b
    cp $03
    jp z, Jump_000_32dc

    cp $04
    jp z, Jump_000_3370

    jp Jump_000_28c9


jr_000_32a6:
    ld a, [$d7a8]
    cp $0a
    jr z, jr_000_32b7

    ld a, [$d7a4]
    bit 0, a
    jr z, jr_000_32dc

    jp Jump_000_3370


jr_000_32b7:
    ld a, [$d7a4]
    bit 0, a
    jr nz, jr_000_32dc

    jp Jump_000_3370


jr_000_32c1:
    ld a, [$d7a8]
    cp $0a
    jr z, jr_000_32d2

    ld a, [$d7a4]
    bit 0, a
    jr nz, jr_000_32dc

    jp Jump_000_3370


jr_000_32d2:
    ld a, [$d7a4]
    bit 0, a
    jr z, jr_000_32dc

    jp Jump_000_3370


Jump_000_32dc:
jr_000_32dc:
    call Call_000_09df
    call Call_000_0d30
    call Call_000_0927
    ld a, $05
    call Call_000_05bf
    ld hl, $4006
    call Call_000_0bcf
    ld a, $0f
    call Call_000_0cbf
    call Call_000_09eb
    ld a, $09
    call Call_000_0c65
    ld a, [$d7a5]
    inc a
    ld [$d7a5], a
    call Call_000_3493
    ld a, $11
    call Call_000_0cbf
    call Call_000_1ab7
    ld a, [$d7a8]
    cp $00
    jr z, jr_000_331e

    cp $01
    jp z, Jump_000_3348

    jp Jump_000_1fc0


jr_000_331e:
    ld a, $11
    call Call_000_0cbf
    ld a, [$d79a]
    inc a
    ld [$d79a], a
    cp $10
    jp z, Jump_000_333a

    cp $5c
    jp z, Jump_000_333a

Jump_000_3334:
    call Call_000_2715
    jp Jump_000_27de


Jump_000_333a:
    ld a, $00
    call Call_000_11c4
    call Call_000_274b
    call Call_000_1cf5
    jp Jump_000_1fc0


Jump_000_3348:
    ld a, $11
    call Call_000_0cbf
    ld a, [$d79a]
    inc a
    ld [$d79a], a
    cp $20
    jr z, jr_000_3362

    cp $6c
    jr z, jr_000_3362

    call Call_000_2715
    jp Jump_000_27de


jr_000_3362:
    ld a, $01
    call Call_000_11c4
    call Call_000_274b
    call Call_000_1cf5
    jp Jump_000_1fc0


Jump_000_3370:
    call Call_000_09df
    call Call_000_0d30
    call Call_000_0927
    ld a, $05
    call Call_000_05bf
    ld hl, $4f04
    call Call_000_0bcf
    ld a, $10
    call Call_000_0cbf
    call Call_000_09eb
    ld a, $09
    call Call_000_0c65
    jp Jump_000_1fc0


Call_000_3394:
    call Call_000_09df
    ld a, $02
    call Call_000_05bf
    ld hl, $4000
    ld de, $8800
    ld bc, $0000
    call Call_000_0a36
    ld a, $01
    call Call_000_05bf
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    call Call_000_14b0
    call $5fae
    call Call_000_3dd4
    ld a, $01
    call Call_000_09f9
    ld a, $01
    call Call_000_05bf
    call Call_000_085d
    call Call_000_085d
    call Call_000_085d
    call Call_000_085d
    call Call_000_09eb
    ret


Call_000_33d9:
    ld a, $00
    call Call_000_1450
    ld b, a
    push bc
    ld a, $01
    call Call_000_1450
    pop bc
    ld c, a
    ld a, [$d7a4]
    bit 0, a
    jr nz, jr_000_3425

    ld a, [$d79a]
    cp $0f
    jr z, jr_000_3413

    cp $1f
    jr z, jr_000_3413

    cp $5b
    jr z, jr_000_3413

    cp $6b
    jr z, jr_000_3413

    ld a, c
    srl a
    cp b
    jr nc, jr_000_3419

    ld a, b
    srl a
    cp c
    jr nc, jr_000_341f

    ld a, $07
    call Call_000_0cbf
    ret


jr_000_3413:
    ld a, $08
    call Call_000_0cbf
    ret


jr_000_3419:
    ld a, $0a
    call Call_000_0cbf
    ret


jr_000_341f:
    ld a, $09
    call Call_000_0cbf
    ret


jr_000_3425:
    ld a, [$d79a]
    cp $0f
    jr z, jr_000_344a

    cp $1f
    jr z, jr_000_344a

    cp $5b
    jr z, jr_000_344a

Jump_000_3434:
    cp $6b

Call_000_3436:
    jr z, jr_000_344a

    ld a, b

Jump_000_3439:
    srl a
    cp c
    jr nc, jr_000_3450

    ld a, c
    srl a
    cp b
    jr nc, jr_000_3456

    ld a, $0b
    call Call_000_0cbf
    ret


jr_000_344a:
    ld a, $0c
    call Call_000_0cbf
    ret


jr_000_3450:
    ld a, $0e
    call Call_000_0cbf
    ret


jr_000_3456:
    ld a, $0d
    call Call_000_0cbf
    ret


Call_000_345c:
    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    inc hl
    ld a, [hl+]
    bit 5, a
    jr z, jr_000_346c

    inc hl
    ld a, [hl]
    ret


jr_000_346c:
    ld a, $ff
    ret


Call_000_346f:
    ld a, [$d7c3]
    call Call_000_099b
    ld a, [hl]
    and $1f
    call Call_000_09b7
    ld a, $0f
    call Call_000_088f
    ld a, [hl]
    cp $00
    jr z, jr_000_3487

    inc hl
    ld a, [hl-]

jr_000_3487:
    ld c, a
    inc hl
    inc hl
    ld a, [hl]
    cp $00
    jr z, jr_000_3491

    inc hl
    ld a, [hl-]

jr_000_3491:
    ld b, a
    ret


Call_000_3493:
    ld a, [$d7a5]
    sla a
    ld hl, $d7c5
    call Call_000_088f
    push hl
    ld a, $00
    call Call_000_1450
    pop hl
    ld [hl+], a
    push hl
    ld a, $01
    call Call_000_1450
    pop hl
    ld [hl+], a
    ret


Jump_000_34af:
    ld a, $01
    ld [$d7a7], a
    ld a, $00
    ld [$d8e7], a
    ld [$d7b4], a
    ld a, $01
    ld [$d8e6], a

Jump_000_34c1:
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    call Call_000_14b0

Jump_000_34cd:
jr_000_34cd:
    ld a, $00
    ld [$d7a1], a
    call Call_000_1610
    cp $00
    jp z, Jump_000_34ee

    cp $01
    jp z, Jump_000_35a0

    cp $02
    jp z, Jump_000_3670

    cp $03
    jp z, Jump_000_35f2

    call Call_000_085d
    jr jr_000_34cd

Jump_000_34ee:
    call Call_000_1878
    ld a, [$d87a]
    cp $ff
    jp nz, Jump_000_1e15

    ld a, [$d7b4]
    cp $ff
    jp z, Jump_000_35a0

    call Call_000_1490
    cp $ff
    jp nz, Jump_000_358c

    ld a, [$d7b4]
    and $1f
    cp $12
    jr z, jr_000_351d

    cp $13
    jr z, jr_000_351d

    cp $14
    jr z, jr_000_351d

    jp Jump_000_354f


jr_000_351d:
    push bc
    push de
    push hl
    ld a, [$d7b4]
    and $80
    ld d, a
    ld a, [$d79f]
    ld b, a
    ld a, [$d7a0]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    and $0f

Call_000_3534:
    ld e, $00
    cp $08
    jr z, jr_000_3542

    ld e, $80
    cp $0a
    jr z, jr_000_3542

    jr jr_000_354f

jr_000_3542:
    ld a, d
    cp e
    jr z, jr_000_354c

    pop hl
    pop de
    pop bc
    jp Jump_000_358c


jr_000_354c:
    pop hl
    pop de
    pop bc

Jump_000_354f:
jr_000_354f:
    call Call_000_1d75
    cp $ff
    jp z, Jump_000_358c

    ld a, [$d7b4]
    ld [hl+], a
    ld a, [$d79f]
    ld [hl+], a
    ld a, [$d7a0]
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $ff
    ld [hl+], a
    ld a, $08
    ld [hl], a
    ld a, $08
    call Call_000_0d07
    call Call_000_0927
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb

jr_000_357d:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jr nz, jr_000_357d

    jp Jump_000_34c1


Jump_000_358c:
    ld a, $0e
    call Call_000_0d07

jr_000_3591:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jr nz, jr_000_3591

    jp Jump_000_34cd


Jump_000_35a0:
    call Call_000_1490
    cp $ff
    jr z, jr_000_35d2

    ld a, $ff
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld a, $08
    call Call_000_0d07
    call Call_000_0927
    call Call_000_0db5
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb

jr_000_35c3:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 1, a
    jr nz, jr_000_35c3

    jp Jump_000_34c1


jr_000_35d2:
    ld a, $0e
    call Call_000_0d07

jr_000_35d7:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 1, a
    jr nz, jr_000_35d7

jr_000_35e3:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    jr nz, jr_000_35e3

    jp Jump_000_34cd


Jump_000_35f2:
    call Call_000_0db5
    call Call_000_1550
    cp $00
    jp nz, Jump_000_34c1

    ld a, [$d7c2]
    cp $00
    jp z, Jump_000_360f

    cp $01
    jp z, Jump_000_3615

    cp $02
    jp z, Jump_000_3612

Jump_000_360f:
    jp Jump_000_34c1


Jump_000_3612:
    jp Jump_000_1fc0


Jump_000_3615:
    ld a, [$d79f]
    ld [$db04], a
    ld a, [$d7a0]
    ld [$db05], a
    ld a, [$d79d]
    ld [$db06], a
    ld a, [$d79e]
    ld [$db07], a
    call Call_000_0de7
    ld a, $01
    ld [$d8e8], a
    ld a, $04
    ld [$d7a8], a
    call Call_000_0f0e
    cp $00
    jp nz, Jump_000_3652

    call Call_000_11f1
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    add $06
    call Call_000_108b

Jump_000_3652:
    ld a, [$db04]
    ld [$d79f], a
    ld a, [$db05]
    ld [$d7a0], a
    ld a, [$db06]
    ld [$d79d], a
    ld a, [$db07]
    ld [$d79e], a
    call Call_000_1224
    jp Jump_000_34c1


Jump_000_3670:
    ld a, $08
    call Call_000_0d07
    call Call_000_0db5
    call Call_000_1d15
    call Call_000_14b0
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    jp Jump_000_34c1


Call_000_368a:
    ld a, [$d79d]
    ld b, a
    ld a, [$d79e]
    ld c, a
    push bc
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    call Call_000_09df
    call Call_000_0927
    ld a, $03
    call Call_000_05bf
    ld hl, $7210
    ld de, $8800
    ld bc, $0000
    call Call_000_0a36
    ld a, $03
    call Call_000_05bf
    ld hl, $70a8
    ld de, $c1a0
    ld b, $12

jr_000_36bf:
    push de

Jump_000_36c0:
    call Call_000_083e
    call Call_000_083e
    pop de
    ld a, $40
    call Call_000_08a1
    dec b
    jr nz, jr_000_36bf

    ld a, [$d7b5]
    call Call_000_099b
    ld de, $8850
    ld b, $02
    ld c, $01
    ld a, $85
    call Call_000_3aac
    ld a, [$d7b5]
    call Call_000_099b
    ld a, $60
    ld [$d86f], a
    ld de, $8810
    call Call_000_3aee
    ld b, $09
    ld c, $01
    call Call_000_093f
    ld a, $81
    ld [hl+], a
    inc a
    ld [hl], a
    inc a
    push af
    ld a, $3f
    call Call_000_088f
    pop af
    ld [hl+], a
    inc a
    ld [hl], a
    ld a, $01
    call Call_000_05bf
    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    ld e, a
    ld d, $00
    ld b, $0c
    ld c, $02
    call Call_000_093f
    call Call_000_1bbe
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    and $1f
    call Call_000_09b7
    ld a, $0c
    call Call_000_088f
    ld a, [hl+]
    push hl
    ld e, a
    ld d, $00
    ld b, $10
    ld c, $08
    call Call_000_093f
    call Call_000_1bbe
    pop hl
    inc hl
    ld a, [hl+]
    push hl
    ld e, a
    ld d, $00
    ld b, $0f
    ld c, $09
    call Call_000_093f
    call Call_000_1b9e
    pop hl
    ld a, [hl+]
    push af
    push hl
    ld e, a
    ld d, $00
    ld b, $05
    ld c, $09
    call Call_000_093f
    call Call_000_1b9e
    pop hl
    pop af
    ld b, a
    ld a, [hl+]
    push hl
    ld e, a
    ld a, b
    cp $00
    jr nz, jr_000_3776

    ld e, $00

jr_000_3776:
    ld d, $00
    ld b, $09
    ld c, $09
    call Call_000_093f
    call Call_000_1bbe
    pop hl
    ld a, [hl+]
    push af
    push hl
    ld e, a
    ld d, $00
    ld b, $05
    ld c, $08
    call Call_000_093f
    call Call_000_1b9e
    pop hl
    pop af
    ld b, a
    ld a, [hl+]
    push hl
    ld e, a
    ld a, b
    cp $00
    jr nz, jr_000_37a0

    ld e, $00

jr_000_37a0:
    ld d, $00
    ld b, $09
    ld c, $08
    call Call_000_093f
    call Call_000_1bbe
    pop hl
    ld a, $32
    ld e, a
    ld d, $00
    ld b, $0d
    ld c, $0d
    call Call_000_093f
    call Call_000_1bbe
    ld a, [$d7a5]
    inc a
    ld e, a
    ld d, $00
    ld b, $0a
    ld c, $0d
    call Call_000_093f
    call Call_000_1bbe
    ld a, $00
    call Call_000_1450
    ld e, a
    ld d, $00
    ld b, $0a
    ld c, $0e
    call Call_000_093f
    call Call_000_1bbe
    ld a, $01
    call Call_000_1450
    ld e, a
    ld d, $00
    ld b, $0a
    ld c, $0f
    call Call_000_093f
    call Call_000_1bbe
    call Call_000_11f1
    ld hl, $d7a9
    ld a, l
    ld [$d7c1], a
    ld a, h
    ld [$d7c2], a
    ld a, $06
    ld d, $68
    ld e, $90
    ld b, $06
    call Call_000_14f0
    call Call_000_0abb
    ld a, $05
    call Call_000_0cbf
    call Call_000_09eb
    call Call_000_0c3c
    call Call_000_0927
    pop bc
    ld a, b
    ld [$d79d], a
    ld a, c
    ld [$d79e], a
    call Call_000_1224
    ret


Call_000_3828:
    call Call_000_3b23
    ld a, [$d79d]
    ld b, a
    ld a, [$d79e]
    ld c, a
    push bc
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    call Call_000_09df
    call Call_000_39bc
    ld a, $03
    call Call_000_05bf
    ld hl, $4db8
    ld de, $c520
    ld b, $14
    ld c, $04
    call Call_000_3b36
    call Call_000_1b3e
    ld a, $00
    call Call_000_1b5e
    call Call_000_0abb
    call Call_000_1c5e
    call Call_000_09eb
    call Call_000_39b3
    call Call_000_0927
    ld a, $03
    call Call_000_05bf
    ld hl, $4db8
    ld de, $c520
    ld b, $14
    ld c, $04
    call Call_000_3b36
    call Call_000_1b3e
    ld a, $01
    call Call_000_1b5e
    call Call_000_0abb
    call Call_000_1c5e
    call Call_000_09eb
    call Call_000_39b3
    call Call_000_0927
    ld a, $03
    call Call_000_05bf
    ld hl, $4e58
    ld de, $c520
    ld b, $14
    ld c, $04
    call Call_000_3b36
    ld a, $01
    call Call_000_05bf
    call Call_000_1b3e
    ld a, $02
    call Call_000_1b5e
    call Call_000_0abb
    call Call_000_1c7e
    call Call_000_39b3
    call Call_000_0927
    ld a, $03
    call Call_000_05bf
    ld hl, $4d18
    ld de, $c520
    ld b, $14
    ld c, $04
    call Call_000_3b36
    ld a, $01
    call Call_000_05bf
    call Call_000_1b3e
    ld a, $03
    call Call_000_1b5e
    call Call_000_1b7e
    call Call_000_0abb
    call Call_000_39b3
    call Call_000_0927
    call Call_000_1bfe
    ld a, $16
    call Call_000_0d07
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_39b3
    ld a, [$d8ba]
    ld b, a
    ld a, [$da88]
    cp b
    jr nz, jr_000_391d

    ld a, [$d8bb]
    ld b, a
    ld a, [$da89]
    cp b
    jr nz, jr_000_391d

    jr jr_000_3922

jr_000_391d:
    ld a, $13
    call Call_000_0d07

jr_000_3922:
    call Call_000_1b1e
    call Call_000_3b88
    call Call_000_1b3e
    call Call_000_0abb
    call Call_000_39b3
    call Call_000_1b1e
    call Call_000_1b1e
    call Call_000_1b1e
    call Call_000_1b1e
    call Call_000_1b3e
    call Call_000_3b88
    call Call_000_0abb
    call Call_000_39b3
    call Call_000_1b1e
    call Call_000_1b1e
    call Call_000_1b1e
    call Call_000_1b1e
    call Call_000_1b3e
    call Call_000_3b88
    call Call_000_0abb
    call Call_000_39b3
    call Call_000_1b1e
    call Call_000_1b1e
    call Call_000_1b1e
    call Call_000_1b1e
    call Call_000_1b3e
    call Call_000_3b88
    call Call_000_0abb
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_39b3
    call Call_000_1390
    call Call_000_1c1e
    pop bc
    ld a, b
    ld [$d79d], a
    ld a, c
    ld [$d79e], a
    call Call_000_1630
    call Call_000_1224
    ret


Call_000_39b3:
    ld b, $06

jr_000_39b5:
    call Call_000_085d
    dec b
    jr nz, jr_000_39b5

    ret


Call_000_39bc:
    call Call_000_0927
    ld a, $03
    call Call_000_05bf
    ld hl, $5088
    ld de, $8800
    ld bc, $0000
    call Call_000_0a36
    ld a, $03
    call Call_000_05bf
    ld hl, $4c78
    ld de, $c1a0
    ld b, $14
    ld c, $04
    call Call_000_3b36
    ld hl, $4c64
    ld a, [$d830]
    ld b, $00
    cp $00
    jr z, jr_000_3a0f

    cp $07
    jr z, jr_000_3a0f

    cp $09
    jr z, jr_000_3a0f

    ld b, $07
    cp $08
    jr z, jr_000_3a07

    cp $0a
    jr z, jr_000_3a07

    ld b, $08
    cp $0b
    jr nc, jr_000_3a07

    ld b, a

jr_000_3a07:
    ld a, $78
    call Call_000_088f
    dec b
    jr nz, jr_000_3a07

jr_000_3a0f:
    ld de, $c2a0
    ld b, $0a
    ld c, $03
    call Call_000_3b36
    ld hl, $4c6e
    ld a, [$d831]
    ld b, $00
    cp $00
    jr z, jr_000_3a46

    cp $07
    jr z, jr_000_3a46

    cp $09
    jr z, jr_000_3a46

    ld b, $07
    cp $08
    jr z, jr_000_3a3e

    cp $0a
    jr z, jr_000_3a3e

    ld b, $08
    cp $0b
    jr nc, jr_000_3a3e

    ld b, a

jr_000_3a3e:
    ld a, $78
    call Call_000_088f
    dec b
    jr nz, jr_000_3a3e

jr_000_3a46:
    ld de, $c2aa
    ld b, $0a
    ld c, $03
    call Call_000_3b36
    ld hl, $4ef8
    ld de, $c360
    ld b, $14
    ld c, $07
    call Call_000_3b36
    ld a, [$d82e]
    call Call_000_099b
    ld de, $8890
    ld b, $01
    ld c, $01
    ld a, $89
    call Call_000_3aac
    ld a, [$d82f]
    call Call_000_099b
    ld de, $88e0
    ld b, $0e
    ld c, $01
    ld a, $8e
    call Call_000_3aac
    ld a, [$d82e]
    call Call_000_099b
    ld a, $60
    ld [$d86f], a
    ld de, $8810
    call Call_000_3aee
    ld a, [$d82f]
    call Call_000_099b
    ld a, $00
    ld [$d86f], a
    ld de, $8850
    call Call_000_3aee
    call Call_000_3b88
    ld a, $01
    call Call_000_05bf
    ret


Call_000_3aac:
    push af
    push bc
    push de
    ld a, $02
    call Call_000_05bf
    ld a, [hl]
    and $1f
    ld b, a
    sla a
    sla a
    add b
    ld e, a
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    ld hl, $7400

Jump_000_3ad3:
    ld a, d
    add h
    ld h, a
    ld a, e
    add l
    ld l, a

Call_000_3ad9:
    pop de
    ld b, $05
    call Call_000_0a36
    pop bc
    call Call_000_093f
    pop af
    ld [hl+], a
    inc a
    ld [hl+], a
    inc a
    ld [hl+], a
    inc a
    ld [hl+], a
    inc a
    ld [hl+], a
    ret


Call_000_3aee:
    push de
    ld a, $03
    call Call_000_05bf
    ld a, [$d86f]
    ld b, a
    ld a, [hl]
    and $1f
    sla a
    sla a
    add b
    ld e, a
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    ld hl, $4000
    ld a, d
    add h
    ld h, a
    ld a, e
    add l
    ld l, a
    pop de
    ld b, $04
    call Call_000_0a36
    ret


Call_000_3b23:
    ld a, [$d7c3]
    call Call_000_1ade
    ld a, [$d7c4]
    call Call_000_1ade
    call Call_000_1370
    call Call_000_1afe
    ret


Call_000_3b36:
jr_000_3b36:
    push bc
    push de
    push hl
    call Call_000_083e
    ld a, b
    cp $0a
    jr z, jr_000_3b44

    call Call_000_083e

jr_000_3b44:
    pop hl
    pop de
    pop bc
    ld a, $28
    call Call_000_088f
    ld a, $40
    call Call_000_08a1
    dec c
    jr nz, jr_000_3b36

    ret


Call_000_3b55:
jr_000_3b55:
    push bc
    push de
    push hl
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    pop hl
    pop de
    pop bc
    ld a, $40
    call Call_000_08a1
    dec c
    jr nz, jr_000_3b55

    ret


    ld b, $09
    rlca
    rlca
    rlca
    dec bc
    inc b
    rlca
    inc b
    dec bc
    inc bc
    add hl, bc
    ld bc, $010b
    rlca
    dec c
    add hl, bc
    dec bc
    rlca
    dec bc
    dec bc
    ld c, $07
    ld c, $0b
    db $10
    add hl, bc
    ld de, $110b
    rlca

Call_000_3b88:
    ld a, $03
    call Call_000_05bf
    ld hl, $4ef8
    ld de, $c360
    ld b, $14
    ld c, $07
    call Call_000_3b36
    ld a, [$da11]
    cp $00
    jr z, jr_000_3bc6

    ld a, [$d7a4]
    and $01
    cp $00
    jr nz, jr_000_3bb9

    ld hl, $4c64
    ld de, $c2a9
    ld b, $01
    ld c, $0a
    call Call_000_3b55
    jr jr_000_3bc6

jr_000_3bb9:
    ld hl, $4c64
    ld de, $c2aa
    ld b, $01
    ld c, $0a
    call Call_000_3b55

jr_000_3bc6:
    ld a, $01
    call Call_000_05bf
    ld a, $81
    ld [$d86f], a
    ld hl, $3b68
    ld de, $d832
    call Call_000_3be8
    ld a, $85
    ld [$d86f], a
    ld hl, $3b78
    ld de, $d83a
    call Call_000_3be8
    ret


Call_000_3be8:
    ld b, $08

jr_000_3bea:
    push bc
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    push hl
    call Call_000_093f
    ld a, [de]
    inc de
    push de
    cp $00
    jr z, jr_000_3c06

    cp $01
    jr nz, jr_000_3c03

    call Call_000_3c0d
    jr jr_000_3c06

jr_000_3c03:
    call Call_000_3c1f

jr_000_3c06:
    pop de
    pop hl
    pop bc
    dec b
    jr nz, jr_000_3bea

    ret


Call_000_3c0d:
    ld a, [$d86f]
    ld [hl+], a
    inc a
    ld [hl], a
    inc a
    push af
    ld a, $3f
    call Call_000_088f
    pop af
    ld [hl+], a
    inc a
    ld [hl], a
    ret


Call_000_3c1f:
    push de
    sub $02
    srl a
    srl a
    sla a
    sla a
    sla a
    add $42
    ld de, $4c00
    call Call_000_08a1
    ld a, $03
    call Call_000_05bf
    dec hl
    ld a, [de]
    inc de

Call_000_3c3c:
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    ld a, $3d
    call Call_000_088f
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl], a
    pop de
    ld a, $01
    call Call_000_05bf
    ret


    ld a, [$d7a4]
    rl a
    rl a
    rl a
    rl a
    rl a
    rl a
    rl a
    and $80
    ld d, a
    ld b, $38
    ld hl, $d572

jr_000_3c77:
    push hl
    ld a, [hl+]
    cp $ff
    jr z, jr_000_3c88

    bit 6, a
    jr nz, jr_000_3c88

    and $80
    cp d
    jr nz, jr_000_3c88

    pop hl
    ret


jr_000_3c88:
    pop hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    dec b
    jr nz, jr_000_3c77

    call Call_000_3c96
    ret


Call_000_3c96:
    di
    call Call_000_0d30
    call Call_000_0ca4
    ei
    call Call_000_0db5
    ld a, $0f
    call Call_000_0d07
    call Call_000_0927
    call Call_000_085d
    ld a, $03
    call Call_000_05bf
    ld hl, $5b48
    ld de, $8000
    ld b, $28
    call Call_000_0a36
    ld a, $01
    call Call_000_05bf
    ld a, $20
    ld [$d86f], a
    ld d, $a8
    ld e, $48
    ld a, $00
    ld c, $00
    call Call_000_3d8f
    ld a, $48
    ld [$d86f], a
    ld d, $a8
    ld e, $58
    ld a, $14
    ld c, $14
    call Call_000_3d8f
    ld a, [$d7a4]
    xor $01
    ld [$d7a4], a
    cp $00
    jr nz, jr_000_3cf4

    ld a, [$d7a5]
    inc a
    ld [$d7a5], a

jr_000_3cf4:
    call Call_000_3dd4
    ld a, [$d7a5]
    sla a
    ld hl, $d7c5
    call Call_000_088f
    push hl
    ld a, $00
    call Call_000_1450
    pop hl
    ld [hl+], a
    push hl
    ld a, $01
    call Call_000_1450
    pop hl
    ld [hl+], a
    call Call_000_1470
    call Call_000_1630
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    ld a, $01
    ld [$d86c], a
    call Call_000_0927
    call Call_000_085d
    ld a, $03
    call Call_000_05bf
    ld a, [$d7a8]
    cp $0a
    jr nz, jr_000_3d47

    ld a, [$d7a4]
    ld hl, $5dc8
    cp $00
    jr nz, jr_000_3d5e

    ld hl, $6048
    jr jr_000_3d5e

jr_000_3d47:
    ld a, [$d7a4]
    ld hl, $5dc8
    cp $00
    jr z, jr_000_3d5e

    ld hl, $6048
    ld a, [$d7a8]
    cp $14
    jr nz, jr_000_3d5e

    ld hl, $5f08

jr_000_3d5e:
    ld de, $8000
    ld b, $14
    call Call_000_0a36
    ld a, $01
    call Call_000_05bf
    ld a, $30
    ld [$d86f], a
    ld d, $a8
    ld e, $58
    ld a, $00
    ld c, $00
    call Call_000_3d8f
    call Call_000_0927
    call Call_000_085d
    ld a, $01
    call Call_000_09f9
    ld a, $01
    call Call_000_05bf
    call Call_000_33d9
    ret


Call_000_3d8f:
    ld b, a

jr_000_3d90:
    push bc
    push de
    ld a, b
    call Call_000_08ff
    ld b, $09

jr_000_3d98:
    call Call_000_091a
    ld a, d
    inc c
    dec b
    jr nz, jr_000_3d98

    pop de
    pop bc
    push bc
    push de
    ld a, e
    add $08
    ld e, a
    ld a, c
    add $0a
    ld c, a
    ld a, b
    add $0a
    call Call_000_08ff
    ld b, $09

jr_000_3db4:
    call Call_000_091a
    ld a, d
    inc c
    dec b
    jr nz, jr_000_3db4

    pop de
    pop bc
    call Call_000_085d
    dec d
    dec d
    dec d
    dec d
    ld a, [$d86f]
    cp d
    jr c, jr_000_3d90

    ld b, $1e

jr_000_3dcd:
    call Call_000_085d
    dec b
    jr nz, jr_000_3dcd

    ret


Call_000_3dd4:
    ld a, [$d79a]
    ld [$d90c], a
    ld a, [$d79b]
    ld b, $0f
    cp $11
    jr c, jr_000_3de5

    ld b, $1e

jr_000_3de5:
    ld a, b
    ld [$d90d], a
    ld a, [$d79c]
    ld b, $0a
    cp $0f
    jr c, jr_000_3df4

    ld b, $14

jr_000_3df4:
    ld a, b
    ld [$d90e], a
    ld b, $00
    ld a, [$d7a4]
    bit 0, a
    jr z, jr_000_3e03

    ld b, $80

jr_000_3e03:
    ld a, b
    ld [$d90f], a
    ld a, [$d90f]
    cp $00
    jr nz, jr_000_3e24

    ld a, $0d
    ld [$d911], a
    ld a, $0a
    ld [$d913], a
    ld a, $0b
    ld [$d910], a
    ld a, $08
    ld [$d912], a
    jr jr_000_3e38

jr_000_3e24:
    ld a, $0b
    ld [$d911], a
    ld a, $08
    ld [$d913], a
    ld a, $0d
    ld [$d910], a
    ld a, $0a
    ld [$d912], a

jr_000_3e38:
    call Call_000_13f0
    call Call_000_1914
    ret


Call_000_3e3f:
    ld a, $00
    ld [$d7a7], a
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    call Call_000_14b0
    call Call_000_0927
    call Call_000_085d
    ld a, $03
    call Call_000_05bf
    ld hl, $5dc8
    ld a, [$d7a8]
    cp $0a
    jr nz, jr_000_3e68

    ld hl, $6048

jr_000_3e68:
    ld de, $8000
    ld b, $14
    call Call_000_0a36
    ld a, $01
    call Call_000_05bf
    ld a, $30
    ld [$d86f], a
    ld d, $a8
    ld e, $58
    ld a, $00
    ld c, $00
    call Call_000_3d8f
    call Call_000_0927
    call Call_000_085d
    ld a, $01
    call Call_000_09f9
    ld a, $01
    call Call_000_05bf
    ret


Jump_000_3e96:
    call Call_000_1954
    call $47b8
    call Call_000_15f0
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    ld a, [$db16]
    cp $00
    jr nz, jr_000_3ec4

    ld a, $0d
    call Call_000_0d07
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl], a
    call Call_000_1630
    jp Jump_000_28c9


Jump_000_3ec4:
jr_000_3ec4:
    ld a, $00
    ld [$d7a1], a
    call Call_000_1610
    cp $00
    jp nz, Jump_000_3f5e

    ld a, [$d79f]
    ld b, a
    ld a, [$d7a0]
    ld c, a
    call Call_000_0969
    ld a, [hl]
    bit 5, a
    jp z, Jump_000_3f56

    call Call_000_1490
    cp $ff
    jp nz, Jump_000_3f56

    ld a, $08
    call Call_000_0d07
    call Call_000_345c
    cp $ff
    jp z, Jump_000_3f56

    push af
    call Call_000_099b
    ld a, [hl]
    and $1f
    or $40

Jump_000_3f00:
    ld b, a
    ld a, [$d90f]
    or b
    ld [hl+], a
    ld a, [$d79f]
    and $1f
    ld [hl+], a
    ld a, [$d7a0]
    and $1f
    ld [hl+], a
    inc hl
    ld a, $ff
    ld [hl+], a
    ld a, [$d7b5]
    call Call_000_099b
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl+], a
    inc hl
    ld a, [hl]
    and $1f
    ld [hl+], a
    inc hl
    ld a, $ff
    ld [hl+], a
    call Call_000_1630
    pop af
    ld [$d7b5], a
    call Call_000_15b0
    call Call_000_1630
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    call Call_000_1590
    cp $00
    jp nz, Jump_000_3272

    jp Jump_000_28c9


Jump_000_3f56:
    ld a, $0e
    call Call_000_0d07
    jp Jump_000_3ec4


Jump_000_3f5e:
    cp $01
    jr nz, jr_000_3f77

    ld a, $0d
    call Call_000_0d07
    ld a, [$d7b5]
    call Call_000_099b
    ld a, [hl]
    or $40
    ld [hl], a
    call Call_000_1630
    jp Jump_000_28c9


jr_000_3f77:
    jp Jump_000_3ec4


    nop
    nop
    nop
    nop
    nop
    nop

Call_000_3f80:
    push af
    ld a, $1d
    ldh [$80], a
    ld [$2000], a
    pop af
    ld bc, $3f8e
    push bc
    jp hl


    ld a, $1c
    ldh [$80], a
    ld [$2000], a
    ret


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop