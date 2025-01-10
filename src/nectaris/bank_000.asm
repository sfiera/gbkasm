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
INCLUDE "nectaris/map.inc"
INCLUDE "nectaris/text.inc"
INCLUDE "nectaris/units.inc"

SECTION "ROM Bank $000", ROM0

trap_0f_0000::
    jp Jump_000_07e5


    nop
    ld a, b
    add b
    ld c, e
    nop

RST_08::
    jp Jump_000_0068


Config0::
    db BANK(jsys_4100)
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


Call_000_0053::
Jump_000_0053::
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

trap_0e_00b9:
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

Jump_000_00e4::
    ld [hl], e

Call_000_00e5::
Jump_000_00e5::
    pop hl
    pop de
    pop af
    ret


trap_00_00e9:
    xor a

Call_000_00ea::
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
    jp trap_10_02e7


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


trap_01_0150:
    ld a, [$000b]
    ldh [$80], a
    ld [$2000], a
    jp jsys_4100


trap_02_015b:
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

trap_noop:
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
    dw trap_00_00e9
    dw trap_01_0150
    dw trap_02_015b
    dw trap_03_6f05
    dw trap_04_6f35
    dw trap_05_6f3e
    dw TrapJumpViaTable
    dw trap_07_76f1
    dw trap_08_7712
    dw trap_09_02fd
    dw trap_noop
    dw trap_noop
    dw trap_noop
    dw trap_noop
    dw trap_0e_00b9
    dw trap_0f_0000
    dw trap_10_02e7
    dw trap_021c
    dw trap_021c
    dw trap_021c
    dw trap_021c
    dw trap_021c
    dw trap_021c
    dw trap_021c
    dw trap_021c
    dw trap_021c

    jr jr_000_0218

    ld l, d
    ld [bc], a

jr_000_0218:
    ld de, $0000
    ret


trap_021c:
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

Jump_000_026f::
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
    trap MemCopy

Call_000_02df::
    pop bc
    pop hl
    add hl, bc
    pop af
    or a
    jp RST_20


trap_10_02e7:
    di

Call_000_02e8::
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

trap_09_02fd:
    ret


    nop
    nop
    jp Jump_000_030a


Jump_000_0303::
    jp Jump_000_030e


Call_000_0306:
    jp Jump_000_0312


    ret


Jump_000_030a:
    di
    jp trap_10_02e7


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


data_000_0323::
    db "####0123456789%*################"
    db " ｧｨｩｪｫｬｭｮｯｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆ"
    db "ﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜｦﾝ-ﾟﾞ     "
    db "ABCDEFGHIJKLMNOPQRSTUVWXYZ      "

TerrainCost::
    ;  TREAD BUGGY WHEEL BOOTS
    db 1,    1,    2,    1         ; open
    db 1,    1,    1,    1         ; road
    db 2,    2,    4,    1         ; hill
    db 3,    3,    X,    2         ; desert
    db X,    X,    X,    END_MOVE  ; valley
    db X,    X,    X,    2         ; mountain
    db 1,    1,    1,    1         ; bridge
    db X,    X,    X,    X
    db 1,    1,    1,    1         ; own base
    db X,    X,    X,    X
    db 1,    1,    1,    1         ; foe base
    db 1,    1,    1,    1         ; own factory
    db 1,    1,    1,    1         ; factory
    db 1,    1,    1,    1         ; foe factory
    db X,    X,    X,    X
    db X,    X,    X,    X

TerrainDefense:
    db 5   ; open
    db 0   ; road
    db 20  ; hill
    db 30  ; desert
    db 0   ; valley
    db 40  ; mountain
    db 0   ; bridge
    db 0
    db 35  ; own base
    db 0
    db 35  ; foe base
    db 0   ; own factory
    db 0   ; factory
    db 0   ; foe factory
    db 0
    db 0

UnitStats:
    ;  UNIT--------------  SHIFT---------  DEF -AIR-  -GND-  --FLAGS--
    ;  CODE     NAME       R   KIND            PWR R  PWR R
    db "M-77 ", "ﾔﾏｱﾗｼ  ", 0,  MOVE_TREAD, 80, 0,  1, 0,  1, UNIT_IMMOBILE
    db "FX-1 ", "ﾌｧﾙｺ   ", 12, MOVE_WINGS, 30, 90, 1, 0,  1, UNIT_REGULAR | UNIT_IS_AIR | UNIT_ANTI_AIR
    db "AX-87", "ｼﾞｬﾋﾞｲ ", 10, MOVE_WINGS, 30, 20, 1, 70, 1, UNIT_REGULAR | UNIT_IS_AIR | UNIT_0
    db "EF-88", "ﾊﾝﾀ-   ", 11, MOVE_WINGS, 50, 70, 1, 70, 1, UNIT_REGULAR | UNIT_IS_AIR | UNIT_ANTI_AIR | UNIT_0
    db "T-79 ", "ｸﾞﾘｽﾞﾘ-", 4,  MOVE_TREAD, 50, 0,  1, 70, 1, UNIT_REGULAR | UNIT_0
    db "PT-6 ", "ｱﾙﾏｼﾞﾛ ", 4,  MOVE_TREAD, 60, 0,  1, 60, 1, UNIT_REGULAR | UNIT_0
    db "S-61 ", "ﾊﾞｲｿﾝ  ", 6,  MOVE_TREAD, 40, 0,  1, 50, 1, UNIT_REGULAR | UNIT_0
    db "GS-81", "ｽﾗｯｶﾞ- ", 7,  MOVE_TREAD, 50, 0,  1, 50, 1, UNIT_REGULAR | UNIT_0
    db "GT-86", "ﾓﾝｽﾀ-  ", 5,  MOVE_TREAD, 50, 0,  1, 60, 1, UNIT_REGULAR | UNIT_0
    db "HMB-2", "ｷﾞｶﾞﾝﾄ ", 2,  MOVE_TREAD, 80, 40, 1, 90, 1, UNIT_REGULAR | UNIT_0
    db "TT-1 ", "ﾚﾈｯﾄ   ", 5,  MOVE_TREAD, 30, 0,  1, 45, 1, UNIT_REGULAR | UNIT_0
    db "SG-4 ", "ﾅｽﾎﾙﾝ  ", 4,  MOVE_TREAD, 30, 0,  1, 45, 5, UNIT_REGULAR | UNIT_HAS_INDIR | UNIT_0
    db "MR-22", "ｴｽﾄ-ﾙ  ", 4,  MOVE_TREAD, 30, 0,  1, 60, 4, UNIT_REGULAR | UNIT_HAS_INDIR | UNIT_0
    db "MB-5 ", "ﾗﾋﾞｯﾄ  ", 8,  MOVE_BUGGY, 20, 10, 1, 70, 1, UNIT_REGULAR | UNIT_IS_MOBILE | UNIT_0
    db "MB-4 ", "ﾘﾝｸｽ   ", 6,  MOVE_BUGGY, 20, 10, 1, 40, 2, UNIT_REGULAR | UNIT_HAS_INDIR | UNIT_IS_MOBILE | UNIT_0
    db "AAG-4", "ｼ-ｶ-   ", 6,  MOVE_TREAD, 30, 65, 1, 30, 1, UNIT_REGULAR | UNIT_ANTI_AIR | UNIT_0
    db "MM107", "ﾎ-ｸｱｲ  ", 5,  MOVE_TREAD, 30, 85, 5, 0,  1, UNIT_REGULAR | UNIT_HAS_INDIR | UNIT_ANTI_AIR
    db "SS-80", "ﾓﾉｹﾛｽ  ", 0,  MOVE_TREAD, 20, 0,  1, 90, 6, UNIT_IMMOBILE | UNIT_HAS_INDIR | UNIT_0
    db "GX-77", "ﾑﾝｸｽ   ", 3,  MOVE_BOOTS, 4,  10, 1, 10, 1, UNIT_INFANTRY | UNIT_0
    db "GX-87", "ﾀﾞ-ﾍﾞｯｸ", 2,  MOVE_BOOTS, 10, 10, 1, 40, 1, UNIT_INFANTRY | UNIT_0
    db "CBX-1", "ﾄﾞﾚｲﾊﾟ-", 9,  MOVE_WHEEL, 8,  10, 1, 10, 1, UNIT_INFANTRY
    db "NC-1 ", "ﾐｭ-ﾙ   ", 6,  MOVE_WHEEL, 10, 10, 1, 10, 1, UNIT_TRANSPORT | UNIT_CAN_CARRY
    db "C-61 ", "ﾍﾟﾘｶﾝ  ", 9,  MOVE_WINGS, 10, 0,  1, 0,  1, UNIT_TRANSPORT | UNIT_CAN_CARRY | UNIT_IS_AIR | UNIT_0


SetROMBank:
    di
    ld [$2000], a
    ld [$d799], a
    ei
    ret


Call_000_05c8::
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

    ld a, BANK(Call_01c_4003)
    ld [$2000], a
    call Call_01c_4003

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
    call AddAToHL
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
    call AddAToHL
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


Call_000_079c::
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


Call_000_07cd::
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


Call_000_080f::
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


Call_000_081a::
jr_000_081a:
    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_000_081a

    ret


Call_000_0823::
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


Call_000_085d::
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

AddAToHL::
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ret


SubAFromHL::
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


AddAToDE::
    add e
    ld e, a
    ld a, d
    adc $00
    ld d, a
    ret


SubAFromDE::
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


SubDEFromHL::
    ld a, l
    sub e
    ld l, a
    ld a, h
    sbc d
    ld h, a
    ret


AddDEToHL::
    ld a, e
    add l
    ld l, a
    ld a, h
    adc d
    ld h, a
    ret


MulHLByDE::
    push bc
    ld b, h
    ld c, l
    ld hl, 0
    ld a, b
    or c
    jr z, .done

.loop
    call AddDEToHL
    dec bc
    ld a, b
    or c
    jr nz, .loop

.done
    pop bc
    ret


DivHLBy100::
    push bc
    push de
    ld bc, 0
    ld de, 100

.loop
    call SubDEFromHL
    jr c, .done

    inc bc
    jr .loop

.done
    ld h, b
    ld l, c
    pop de
    pop bc
    ret


DivHLBy10::
    push bc
    push de
    ld bc, 0
    ld de, 10

.loop
    call SubDEFromHL
    jr c, .done

    inc bc
    jr .loop

.done
    ld h, b
    ld l, c
    pop de
    pop bc
    ret


Call_000_08ff::
    push af
    ld hl, $c100
    sla a
    sla a
    call AddAToHL
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


Call_000_091a::
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


Call_000_0927::
    ld a, $00
    ld hl, $c100
    ld bc, $00a0
    call Call_000_080f
    ret


Call_000_0933::
    ld a, $80
    ld hl, $c1a0
    ld bc, $0b40
    call Call_000_080f
    ret


Call_000_093f::
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
    call AddAToHL
    ld bc, $c1a0
    ld a, c
    add l
    ld l, a
    ld a, b
    adc h
    ld h, a
    ret


Call_000_0969::
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
    call AddAToHL
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


Call_000_099b::
    push bc
    ld h, $00
    ld l, a
    sla l
    rl h
    sla l
    rl h
    sla a
    call AddAToHL
    ld bc, $d572
    ld a, l
    add c
    ld l, a
    ld a, h
    adc b
    ld h, a
    pop bc
    ret


; hl = UnitStats[a]
GetUnit::
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
    call AddAToHL
    ld bc, UnitStats
    ld a, l
    add c
    ld l, a
    ld a, h
    adc b
    ld h, a
    pop bc
    ret


Call_000_09df::
    call Call_000_085d
    ld a, $ff
    ldh [rBGP], a
    ldh [rOBP0], a
    ldh [rOBP1], a
    ret


Call_000_09eb::
    call Call_000_085d
    ld a, $1b
    ldh [rBGP], a
    ld a, $2f
    ldh [rOBP0], a
    ldh [rOBP1], a
    ret


Call_000_09f9::
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
    ld a, BANK(Font1)
    call SetROMBank
    ld hl, Font1
    pop af
    cp $00
    jr z, jr_000_0a2d

    ld hl, Font2
    cp $01
    jr z, jr_000_0a2d

    ld hl, Font3
    cp $02
    jr z, jr_000_0a2d

    ld hl, Font4

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
    call AddAToHL
    ld a, $40
    call AddAToDE
    pop bc
    dec b
    jp z, Jump_000_0a73

    push bc
    ld bc, $0040
    call Call_000_0764
    ld a, $40
    call AddAToHL
    ld a, $40
    call AddAToDE
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
    call AddAToHL
    ld a, $10
    call AddAToDE

jr_000_0a97:
    ld bc, $0010
    call Call_000_0764
    ld a, $10
    call AddAToHL
    ld a, $10
    call AddAToDE

jr_000_0aa7:
    ld bc, $0010
    call Call_000_0764
    ld a, $10
    call AddAToHL
    ld a, $10
    call AddAToDE

jr_000_0ab7:
    call Call_000_075c
    ret


Call_000_0abb::
    ld a, [$d6d3]
    cp $00
    jr z, jr_000_0b29

Call_000_0ac2:
Jump_000_0ac2:
    ld hl, $c1a0
    ld a, [$d79d]
    call AddAToHL
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

Call_000_0adf::
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
    call AddAToHL
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
    call AddAToHL
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
    call AddAToHL
    ld a, $40
    call AddAToDE
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
    call SetROMBank
    ret


Call_000_0c3c::
jr_000_0c3c:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 0, a
    ld b, $00

Call_000_0c48::
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


Call_000_0c65::
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
    ld a, BANK(Call_01c_4000)
    call SetROMBank
    call Call_01c_4000
    pop af
    ld [$2000], a
    ld a, $01
    ld [$d86d], a
    ld a, $00
    ld [$db09], a
    ret


Call_000_0cbf::
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
    ld a, BANK(Call_01c_4012)
    call SetROMBank
    call Call_01c_4012
    cp $01
    jr z, jr_000_0cce

    ld a, [$db09]
    cp $00

Call_000_0cea::
    jr z, jr_000_0cef

    call Call_000_0d30

jr_000_0cef:
    ld a, BANK(Call_01c_4006)
    call SetROMBank
    ld a, [$db08]
    call Call_01c_4006
    ld a, $01
    ld [$db09], a
    pop af
    ld [$2000], a
    ld [$d799], a
    ret


Call_000_0d07::
    ld [$db0a], a
    ld a, [$db0c]
    cp $00
    ret nz

Jump_000_0d10::
    inc a
    ld [$db0c], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_01c_4009)
    call SetROMBank
    ld a, [$db0a]
    call Call_01c_4009
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

    ld a, BANK(Call_01c_4015)
    call SetROMBank
    call Call_01c_4015

jr_000_0d43:
    pop af
    ld [$2000], a
    ld [$d799], a
    ret


Call_000_0d4b::
    ld a, [$d799]
    push af
    ld a, BANK(Call_01c_401b)
    call SetROMBank
    call Call_01c_401b
    pop af
    ld [$2000], a
    ld [$d799], a
    ret


Call_000_0d5f:
    ld a, [$d799]
    push af
    ld a, BANK(Call_01c_401e)
    call SetROMBank
    call Call_01c_401e
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

Call_000_0d85::
    push de
    push hl
    push af
    ld de, $0d73
    call AddAToDE
    pop af
    ld hl, $0d79
    call AddAToHL
    bit 0, b
    jr z, jr_000_0d9e

    ld a, $06
    call AddAToHL

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


Call_000_0db5::
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


Call_000_0de7::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07
    call SetROMBank
    ld a, [$d872]
    call Call_000_09df
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    ld a, BANK(Font7)
    call SetROMBank
    ld hl, Font7
    ld de, $8800
    ld b, $00
    call Call_000_0a36
    ld a, $01
    call Call_000_09f9
    ld a, $01
    call SetROMBank
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


RunMenu:
    push hl
    call Call_000_0927
    call Call_000_085d
    pop hl
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_007_44a5)
    call SetROMBank
    ld a, [$d872]
    call Call_007_44a5
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_0e66::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_007_454b)
    call SetROMBank
    ld a, [$d872]
    call Call_007_454b
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
    ld a, BANK(Call_007_5ff4)
    call SetROMBank
    ld a, [$d872]
    call Call_007_5ff4
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
    ld a, BANK(Call_007_6017)
    call SetROMBank
    ld a, [$d872]
    call Call_007_6017
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
    ld a, BANK(Call_007_45bf)
    call SetROMBank
    ld a, [$d872]
    call Call_007_45bf
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_0eee::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_007_47c2)
    call SetROMBank
    ld a, [$d872]
    call Call_007_47c2
    ld [$d872], a

Jump_000_0f03::
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
    ld a, BANK(Call_007_49c9)
    call SetROMBank
    ld a, [$d872]
    call Call_007_49c9
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_0f36::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_007_4bb8)
    call SetROMBank
    ld a, [$d872]
    call Call_007_4bb8
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
    ld a, BANK(Call_007_4d81)
    call SetROMBank
    ld a, [$d872]
    call Call_007_4d81
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_0f7e::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Passwords)
    call SetROMBank
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
    ld hl, Passwords

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
    call AddAToHL
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
    ld a, BANK(Call_007_4f3a)
    call SetROMBank
    ld a, [$d872]

Call_000_0fd9:
    call Call_007_4f3a
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
    ld a, BANK(Call_007_5125)
    call SetROMBank
    ld a, [$d872]
    call Call_007_5125
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
    ld a, BANK(Call_007_6177)
    call SetROMBank
    ld a, [$d872]
    call Call_007_6177
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
    ld a, BANK(Call_007_6391)
    call SetROMBank
    ld a, [$d872]

Call_000_103a:
    call Call_007_6391
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
    ld a, BANK(Call_007_65a0)
    call SetROMBank
    ld a, [$d872]
    call Call_007_65a0
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
    ld a, BANK(Call_007_6747)

Jump_000_1074::
    call SetROMBank
    ld a, [$d872]
    call Call_007_6747
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_108b:
    inc a
    push af
    ld a, BANK(Call_007_6958)
    call SetROMBank
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    call Call_007_6958
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    call SetROMBank
    ret


Call_000_10ae:
    inc a
    push af
    ld a, BANK(Call_007_6a12)
    call SetROMBank
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    call Call_007_6a12
    push af
    ld a, $00
    call Call_000_05c8

Call_000_10c8:
    ld [$4000], a
    ei
    ld a, $01
    call SetROMBank
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
    ld a, BANK(Call_007_6b98)
    call SetROMBank
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    call Call_007_6b98
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    call SetROMBank
    ret


Call_000_110e:
    ret


Call_000_110f:
    ld a, BANK(Call_007_6bcf)
    call SetROMBank
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    call Call_007_6bcf
    push af

Call_000_1121::
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    call SetROMBank
    pop af
    ret


Call_000_1131:
    di
    inc a
    push af
    ld a, BANK(Call_007_6b3a)
    call SetROMBank
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    call Call_007_6b3a
    push af
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    call SetROMBank
    pop af
    ei
    ret


Call_000_1158:
    inc a
    push af
    ld a, BANK(Call_007_6b69)
    call SetROMBank
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    call Call_007_6b69
    push af
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    call SetROMBank
    pop af
    ret


Call_000_117d:
    inc a
    push af
    ld a, BANK(Call_007_6ac0)
    call SetROMBank
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    call Call_007_6ac0
    push af
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    call SetROMBank
    pop af
    ret


IsQuickStartEnabled:
    ld a, BANK(AreBothCampaignsComplete)
    call SetROMBank
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    call AreBothCampaignsComplete
    push af
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    call SetROMBank
    pop af
    ret


RecordCompletion:
    push af
    ld a, BANK(SetCampaignComplete)
    call SetROMBank
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    call SetCampaignComplete

Jump_000_11d7::
    push af
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    call SetROMBank
    pop af
    ret


Call_000_11e8::
    call Call_000_11f1
    ld a, $0f
    call SetROMBank
    ret


Call_000_11f1:
    ld a, BANK(Passwords)
    call SetROMBank
    ld a, [$d79a]
    ld e, a
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    ld hl, Passwords
    call AddDEToHL
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
    call SetROMBank
    ret


Call_000_1224::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $01
    call SetROMBank
    ld a, [$d872]
    call Call_000_3394
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1244::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $01
    call SetROMBank
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
    call AddDEToHL
    ld de, Maps
    call AddDEToHL
    ld a, BANK(Maps)
    call SetROMBank
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
    call AddAToHL
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


Call_000_12f0::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_408c)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_408c
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
    ld a, BANK(Call_00f_4115)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_4115
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1330::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_41da)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_41da
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1350::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_41f4)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_41f4
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
    ld a, BANK(Call_00f_4333)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_4333
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
    ld a, BANK(Call_00f_4456)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_4456
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_13b0::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_44c4)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_44c4
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_13d0::
    ld [$d872], a
    ld a, [$d799]
    push af

Jump_000_13d7::
    ld a, BANK(Call_00f_459c)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_459c
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_13f0::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_001_4804)
    call SetROMBank
    ld a, [$d872]
    call Call_001_4804
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1410::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_001_480b)
    call SetROMBank
    ld a, [$d872]
    call Call_001_480b
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1430::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_4b98)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_4b98
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
    ld a, BANK(Call_00f_4d9f)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_4d9f
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
    ld a, BANK(Call_004_4d87)
    call SetROMBank
    ld a, [$d872]
    call Call_004_4d87
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1490::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_004_4d3d)
    call SetROMBank
    ld a, [$d872]
    call Call_004_4d3d
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_14b0::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_4e0e)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_4e0e
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_14d0::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_4e8d)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_4e8d
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_14f0::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_4ed6)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_4ed6
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1510::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_4f20)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_4f20
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
    ld a, BANK(Call_00f_4f53)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_4f53
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
    ld a, BANK(Call_00f_4f6a)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_4f6a
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1570::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_4242)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_4242
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1590::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_53c8)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_53c8
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_15b0::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_431b)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_431b
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_15d0::
Jump_000_15d0::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_54b6)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_54b6
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_15f0::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_55ad)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_55ad
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1610::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_55f5)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_55f5
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1630::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_5a94)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_5a94
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_5aab)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_5aab
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1670::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_5ab0)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_5ab0
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_5ab5)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_5ab5
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_16b0::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_5ad6)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_5ad6
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_16d0::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_5e87)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_5e87
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
    ld a, BANK(Call_00f_5ec9)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_5ec9
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1710::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_005_586a)
    call SetROMBank
    ld a, [$d872]
    call Call_005_586a
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
    trap AudioStop
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


ReadIRData:
    call Call_000_1730
    ld e, l
    ld d, h
    ld c, $00
    trap IRRead
    jr c, .jr_000_1770

    ld a, $00
    jr z, .jr_000_1772

.jr_000_1770
    ld a, $01

.jr_000_1772
    call Call_000_174a
    ret


CloseIRConn:
    call Call_000_1730
    trap IRClose
    jr c, .jr_000_1781

    ld a, $00
    jr z, .jr_000_1783

.jr_000_1781
    ld a, $01

.jr_000_1783
    call Call_000_174a
    ret


ListenIR:
    call Call_000_1730
    trap IRListen
    jr c, .jr_000_1792

    ld a, $00
    jr .jr_000_1794

.jr_000_1792
    ld a, $01

.jr_000_1794
    call Call_000_174a
    ret


Call_000_1798:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_5b56)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_5b56
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
    ld a, BANK(Call_00f_5c4f)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_5c4f
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
    ld a, BANK(Call_00f_5dff)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_5dff
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
    ld a, BANK(Call_00f_7293)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_7293
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1818::
Jump_000_1818:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_729a)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_729a
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1838::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_732e)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_732e
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1858::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_753c)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_753c
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1878::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_759f)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_759f
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1898::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_75ce)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_75ce
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_18b8::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call SetROMBank
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
    ld a, BANK(ScreenFactoryTaken)
    call SetROMBank
    ld hl, ScreenFactoryTaken
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
    ld a, BANK(Call_00f_7672)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_7672
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1934::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_76a3)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_76a3
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
    ld a, BANK(Call_00f_777a)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_777a
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1974::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call SetROMBank
    ld a, [$d872]
    call Call_000_1994
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1994:
    ld a, BANK(FactoryTileMap2)
    call SetROMBank
    ld hl, FactoryTileMap2
    ld de, $c1a0
    ld b, $14
    ld c, $12
    call ShowTileMap
    ret


Call_000_19a7::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call SetROMBank
    ld a, [$d872]
    call Call_000_19c7
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_19c7:
    ld a, BANK(FactoryTileMap3)
    call SetROMBank
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
    ld hl, FactoryTileMap3
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
    call AddAToHL
    ld a, $40
    call AddAToDE
    dec c
    jr nz, jr_000_19f0

jr_000_1a09:
    ret


Call_000_1a0a::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call SetROMBank
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
    ld a, BANK(FactoryTileData)
    call SetROMBank
    ld hl, FactoryTileData
    ld de, $8800
    ld bc, $00a0
    call Call_000_0a36
    ld a, BANK(UnitsUnion)
    call SetROMBank
    ld a, [$db03]
    cp $00
    jr z, jr_000_1a52

    ld hl, UnitsUnion
    jr jr_000_1a55

jr_000_1a52:
    ld hl, UnitsGuicy

jr_000_1a55:
    ld de, $9200
    ld bc, $0060
    call Call_000_0a36
    ld a, $01
    call Call_000_09f9
    ret


Call_000_1a64::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $0f
    call SetROMBank
    ld a, [$d872]
    call Call_000_1a84
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1a84:
    ld a, BANK(FactoryTileMap4)
    call SetROMBank
    ld hl, FactoryTileMap4
    ld de, $c4a0
    ld b, $14
    ld c, $06
    call ShowTileMap
    ret


Call_000_1a97::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_77be)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_77be
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
    ld a, BANK(ScreenResults)
    call SetROMBank
    ld hl, ScreenResults
    call Call_000_0bcf
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_5f0b)
    call SetROMBank
    call Call_00f_5f0b
    pop af
    ld [$d799], a
    ld [$2000], a
    ret


Call_000_1ade:
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_6061)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_6061
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
    ld a, BANK(Call_00f_60fa)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_60fa
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
    ld a, BANK(Call_00f_612d)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_612d
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
    ld a, BANK(Call_00f_6183)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_6183
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
    ld a, BANK(Call_00f_61b5)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_61b5
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
    ld a, BANK(Call_00f_6201)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_6201
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1b9e::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_6230)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_6230
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
    ld a, BANK(Call_00f_624a)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_624a
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_6255)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_6255
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
    ld a, BANK(Call_00f_6275)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_6275
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
    ld a, BANK(Call_00f_62c3)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_62c3
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1c3e::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_6323)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_6323
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
    ld a, BANK(Call_00f_6567)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_6567
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
    ld a, BANK(Call_00f_65bc)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_65bc
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1c9e::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, $07
    call SetROMBank
    ld a, [$d872]
    call Call_000_09df
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    ld a, BANK(Font8)
    call SetROMBank
    ld hl, Font8
    ld de, $8800
    ld b, $00
    call Call_000_0a36
    ld a, $01
    call Call_000_09f9
    ld a, $01
    call SetROMBank
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
    ld a, BANK(Call_00f_6a2d)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_6a2d
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
    ld a, BANK(Call_00f_6c14)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_6c14
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1d35::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_425d)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_425d
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1d55::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_4264)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_4264
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1d75::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_6dd4)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_6dd4
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1d95::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_6ded)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_6ded
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1db5::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_6e56)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_6e56
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1dd5::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_6f64)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_6f64
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1df5::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_6fdf)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_6fdf
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
    ld a, BANK(Call_00f_7038)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_7038
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
    ld a, BANK(Call_00f_70f7)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_70f7
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
    ld a, BANK(Call_00f_7184)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_7184
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1e75::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_001_4750)
    call SetROMBank
    ld a, [$d872]
    call Call_001_4750
    ld [$d872], a
    pop af
    ld [$d799], a
    ld [$2000], a
    ld a, [$d872]
    ret


Call_000_1e95::
    ld [$d872], a
    ld a, [$d799]
    push af
    ld a, BANK(Call_00f_7230)
    call SetROMBank
    ld a, [$d872]
    call Call_00f_7230
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
    ld a, BANK(Call_00f_4000)
    call SetROMBank
    call Call_00f_4000
    ld a, BANK(Call_001_4000)
    call SetROMBank
    ldh [$94], a
    ei
    ld a, [$db1e]
    cp $00
    jr nz, jr_000_1f24

    di
    ld a, BANK(Call_00e_4000)
    ld [$2000], a
    ld [$d799], a
    call Call_00e_4000
    ld a, $01
    call SetROMBank
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

    jp DoTitleScreen


Jump_000_1f4c:
    call Call_000_110f
    cp $88
    jr nz, DoTitleScreen

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
    jp z, DoTitleScreen

    jp Jump_000_28c9


DoTitleScreen:
    call Call_000_09df
    ld a, BANK(ScreenTitle)
    call SetROMBank
    ld hl, ScreenTitle
    call Call_000_0bcf
    ld a, $01
    call Call_000_0cbf
    call Call_000_09eb

.loop
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 3, a
    jp z, .loop

    ld a, $01
    call Call_000_0d07

    ; fall through


ExitLevel:
    call Call_000_110e
    call Call_000_0de7
    ld a, $02
    call Call_000_0cbf


DoMenuMain:
    ld a, $00
    ld [$d8df], a

.again
    ld a, [$d7b3]
    cp $00
    jr nz, .noKiss

    call IsQuickStartEnabled
    ld hl, WindowMainMenuKiss
    cp $00
    jr z, .runKissMenu

    ld hl, WindowMainMenuKissQuickStart

.runKissMenu
    call RunMenu
    cp $00
    jr nz, DoMenuMain.again

    ld a, [$d8df]
    cp $00
    jp z, DoMenuContinue

    cp $01
    jp z, DoMenuPlayNewGame

    cp $02
    jp z, DoMenuConstruction

    cp $03
    jp z, DoMenuGBKiss

    cp $04
    jp z, DoMenuQuickStart

    jp DoMenuMain.again


.noKiss
    call IsQuickStartEnabled
    ld hl, WindowMainMenu
    cp $00
    jr z, .runNoKissMenu

    ld hl, WindowMainMenuQuickStart

.runNoKissMenu
    call RunMenu
    cp $00
    jr nz, DoMenuMain.again

    ld a, [$d8df]
    cp $00
    jp z, DoMenuContinue

    cp $01
    jp z, DoMenuPlayNewGame

    cp $02
    jp z, DoMenuConstruction

    cp $03
    jp z, DoMenuQuickStart

    jp DoMenuMain.again


DoMenuContinue:
    ld a, $00
    ld [$d8df], a

.again
    ld hl, WindowContinue
    call RunMenu
    cp $00
    jp nz, DoMenuMain

    ld a, [$d8df]
    cp $00
    jp z, DoLoadData

    cp $01
    jp z, DoPassword

    jr .again


DoLoadData:
    ld a, $00
    ld [$d8e8], a
    ld a, MAP_STORY
    ld [$d7a8], a
    call Call_000_0ec6
    cp $00
    jp nz, DoMenuContinue

    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    jp Jump_000_27fb


DoPassword:
    call Call_000_0f56
    cp $00
    jp z, .matched

    ld a, $02
    call Call_000_0cbf
    jp DoMenuContinue

.matched
    ld a, [$d79a]
    ld b, MAP_STORY
    cp MAP_END_A
    jr c, .campaign

    ld b, MAP_LEGEND
    cp MAP_END_B
    jr c, .campaign

    ld b, MAP_WINNER
    cp MAP_END_E
    jr c, .winner

    ld b, MAP_STORY
    cp MAP_END_C
    jr c, .campaign

    ld b, MAP_LEGEND
    jr .campaign

.winner
    ld a, b
    ld [$d7a8], a
    jp EnterLevel

.campaign
    ld a, b
    ld [$d7a8], a
    call ShowWorldMap
    jp EnterLevel


DoMenuPlayNewGame:
    ld a, $00
    ld [$d8df], a

.again
    ld hl, WindowNewGame
    call RunMenu
    cp $00
    jp nz, DoMenuMain

    ld a, [$d8df]
    cp $00
    jp z, DoStoryMap

    cp $01
    jp z, DoLegendMap

    cp $02
    jp z, DoCampaignMap

    cp $03
    jp z, Jump_000_2142

    jr .again


DoStoryMap:
    ld a, MAP_STORY
    ld [$d7a8], a
    ld a, MAP_BEGIN_A
    ld [$d79a], a
    call ShowPrologue
    call ShowWorldMap
    jp EnterLevel


DoLegendMap:
    ld a, MAP_LEGEND
    ld [$d7a8], a
    ld a, MAP_BEGIN_B
    ld [$d79a], a
    call ShowPrologue
    call ShowWorldMap
    jp EnterLevel


DoCampaignMap:
    ld a, $00
    ld [$d8df], a

.again
    ld hl, WindowCampaign
    call RunMenu
    cp $00
    jp nz, DoMenuMain

    ld a, [$d8df]
    cp $00
    jp z, DoWinners

    cp $01
    jp z, DoSPWinners

    jr .again


DoWinners:
    call Call_000_102b
    cp $00
    jp nz, DoCampaignMap

    ld a, MAP_WINNER
    ld [$d7a8], a
    jp EnterLevel


DoSPWinners:
    call Call_000_104b
    cp $00
    jp nz, DoCampaignMap

    ld a, MAP_WINNER
    ld [$d7a8], a
    jp EnterLevel


Jump_000_2142:
    jp Jump_000_2869


DoMenuConstruction:
    ld a, $00
    ld [$d8df], a

.again
    ld hl, WindowConstruction
    call RunMenu
    cp $00
    jp nz, DoMenuMain

    ld a, [$d8df]
    cp $00
    jp z, DoNewEditMap

    cp $01
    jp z, DoLoadEditMap

    cp $02
    jp z, DoPlayEditMap

    jp DoMenuMain.again


DoNewEditMap:
    call Call_000_100b
    cp $00
    jp nz, DoMenuConstruction.again

    ld a, MAP_EDIT
    ld [$d7a8], a
    jp Jump_000_2828


DoLoadEditMap:
    ld a, $00
    ld [$d8e8], a
    ld a, MAP_EDIT
    ld [$d7a8], a
    call Call_000_0f0e
    cp $00
    jp nz, DoMenuConstruction.again

    ld a, MAP_EDIT
    ld [$d7a8], a
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    add $06
    jp Jump_000_2847


DoPlayEditMap:
    ld a, $00
    ld [$d8e8], a
    ld a, MAP_EDIT
    ld [$d7a8], a
    call Call_000_0f0e
    cp $00
    jp nz, DoMenuConstruction

    ld a, MAP_PLAYEDIT
    ld [$d7a8], a
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    add $06
    jp Jump_000_2869


DoSendDataToPC:
    ld a, $00
    ld [$d8e9], a
    ld [$d8ea], a
    call Call_000_0f36
    call Call_000_0e86
    call Call_000_0927
    call Call_000_0c3c
    ld a, $00
    ld [$d8e8], a
    ld a, MAP_EDIT
    ld [$d7a8], a
    call Call_000_0f0e
    push af
    call Call_000_0de7
    call Call_000_0927
    pop af
    cp $00
    jp nz, DoMenuGBKiss.again

    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    add $06
    inc a
    ld [$d86e], a
    ld hl, $d000
    ld hl, WindowTransferToPC
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0c3c
    ld a, b
    cp $00
    jr z, .jr_000_221f

    ld a, $0d
    call Call_000_0d07
    jp DoMenuGBKiss.again


.jr_000_221f
    call Call_000_0927
    ld a, $0a
    call Call_000_0d07
    ld hl, WindowSending
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
    ld a, "T"
    ld [hl+], a
    ld a, "R"
    ld [hl+], a
    ld a, "A"
    ld [hl+], a
    ld a, "N"
    ld [hl+], a
    ld a, "C"
    ld [hl+], a
    ld a, "E"
    ld [hl+], a
    ld a, [$d86e]
    ld [hl], a
    call ListenIR
    cp $00
    jr nz, .failure

    ld a, $0a
    call Call_000_0d07
    ld hl, WindowCommSuccess
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
    jp DoMenuGBKiss


.failure
    ld hl, WindowCommFailed
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
    jp DoMenuGBKiss


DoRecvDataFromPC:
    ld a, $00
    ld [$d8e9], a
    ld [$d8ea], a
    call Call_000_0f36
    call Call_000_0ea6
    call Call_000_0927
    call Call_000_0c3c
    ld a, $01
    ld [$d8e8], a
    ld a, MAP_EDIT
    ld [$d7a8], a
    call Call_000_0f0e
    push af
    call Call_000_0de7
    call Call_000_0927
    pop af
    cp $00
    jp nz, DoMenuGBKiss.again

    ld hl, WindowTransferToPC
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0c3c
    ld a, b
    cp $00
    jr z, .jr_000_22f1

    ld a, $0d
    call Call_000_0d07
    jp DoMenuGBKiss.again


.jr_000_22f1
    call Call_000_0927
    ld a, $0a
    call Call_000_0d07
    ld hl, WindowReceiving
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
    ld a, "R"
    ld [hl+], a
    ld a, "E"
    ld [hl+], a
    ld a, "C"
    ld [hl+], a
    ld a, "E"
    ld [hl+], a
    ld a, "I"
    ld [hl+], a
    ld a, "V"
    ld [hl+], a
    ld a, "E"
    ld [hl+], a
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    add $06
    inc a
    ld [hl], a
    call ListenIR
    cp $00
    jr nz, .failure

    ld hl, $d000
    ld a, [hl+]
    cp "N"
    jr nz, .failure

    ld a, [hl+]
    cp "E"
    jr nz, .failure

    ld a, [hl+]
    cp "C"
    jr nz, .failure

    ld a, [hl+]
    cp "T"
    jr nz, .failure

    ld a, [hl+]
    cp "A"
    jr nz, .failure

    ld a, [hl+]
    cp "R"
    jr nz, .failure

    ld hl, $d000
    ld bc, $01fe
    ld d, $00

.loop
    ld a, [hl+]
    add d
    ld d, a
    dec bc
    ld a, b
    or c
    jr nz, .loop

    ld a, d
    push af
    ld hl, $d000
    ld de, $01ff
    call AddDEToHL
    pop af
    ld b, a
    ld a, [hl]
    cp b
    jr nz, .failure

    ld a, $0a
    call Call_000_0d07
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    add $06
    ld hl, $d000
    call Call_000_1158
    ld hl, WindowCommSuccess
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
    jp DoMenuGBKiss.again

.failure
    ld a, $0d
    call Call_000_0d07
    ld hl, WindowCommFailed
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
    jp DoMenuGBKiss.again


DoMenuGBKiss:
    ld a, $00
    ld [$d8df], a

.again
    ld hl, WindowKiss
    call RunMenu
    cp $00
    jp nz, DoMenuMain

    ld a, [$d8df]
    cp $00
    jp z, DoSendDataToGB

    cp $01
    jp z, DoRecvDataFromGB

    cp $02
    jp z, DoSendDataToPC

    cp $03
    jp z, DoRecvDataFromPC

    cp $04
    jp z, DoKissMenu

    jp DoMenuGBKiss.again


DoSendDataToGB:
    ld a, $00
    ld [$d8e9], a
    ld [$d8ea], a
    call Call_000_0f36
    call Call_000_0e86
    call Call_000_0927
    call Call_000_0c3c
    ld a, $00
    ld [$d8e8], a
    ld a, MAP_EDIT
    ld [$d7a8], a
    call Call_000_0f0e
    push af
    call Call_000_0de7
    call Call_000_0927
    pop af
    cp $00
    jp nz, DoMenuGBKiss.again

    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    add $06
    ld hl, $d000
    call Call_000_1131
    ld hl, WindowTransferToGB
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0c3c
    ld a, b
    cp $00
    jr z, .jr_000_2464

    ld a, $0d
    call Call_000_0d07
    jp DoMenuGBKiss.again


.jr_000_2464
    ld a, $0a
    call Call_000_0d07
    ld hl, WindowSending
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
    call ListenIR
    cp $00
    jr nz, .failure

    ld a, $0a
    call Call_000_0d07
    ld hl, WindowCommSuccess
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
    jp DoMenuGBKiss

.failure
    ld hl, WindowCommFailed
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
    jp DoMenuGBKiss


DoRecvDataFromGB:
    ld a, $00
    ld [$d8e9], a
    ld [$d8ea], a
    call Call_000_0f36
    call Call_000_0ea6
    call Call_000_0927
    call Call_000_0c3c
    ld a, $01
    ld [$d8e8], a
    ld a, MAP_EDIT
    ld [$d7a8], a
    call Call_000_0f0e
    push af
    call Call_000_0de7
    call Call_000_0927
    pop af
    cp $00
    jp nz, DoMenuGBKiss.again

    ld hl, WindowTransferToGB
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call Call_000_0e66
    call Call_000_0c3c
    ld a, b
    cp $00
    jr z, .jr_000_251a

    ld a, $0d
    call Call_000_0d07
    jp DoMenuGBKiss.again

.jr_000_251a
    ld a, $0a
    call Call_000_0d07
    ld hl, WindowReceiving
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
    call ReadIRData
    cp $00
    jr nz, jr_000_25a5

    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 1, a
    jp nz, Jump_000_25a5

    ld hl, $d100
    call ReadIRData
    cp $00
    jr nz, jr_000_25a5

    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit 1, a
    jp nz, Jump_000_25a5

    call CloseIRConn
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
    ld hl, WindowCommSuccess
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
    jp DoMenuGBKiss.again


Jump_000_25a5:
jr_000_25a5:
    ld a, $0d
    call Call_000_0d07
    ld hl, WindowCommFailed
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
    jp DoMenuGBKiss.again


DoKissMenu:
    call Call_000_0ca4
    di
    trap $00
    trap AudioStop
    trap $61


DoMenuQuickStart:
    ld a, $00
    ld [$d8df], a

.again
    ld hl, WindowQuickStart
    call RunMenu
    cp $00
    jp nz, DoMenuMain

    ld a, [$d8df]
    cp $00
    jp z, Do1PlayMode

    cp $01
    jp z, Do2PlayMode

    cp $02
    jp z, DoGuicyMode

    ; This is unreachable due as the menu only has 3 entries.
    ; It may be left in from an in-development version of the game.
    cp $03
    jp z, DoDemoMode

    jr .again


Do1PlayMode:
    call Call_000_106b
    cp $00
    jp nz, DoMenuQuickStart.again

    ld b, MAP_STORY
    ld a, [$d79a]
    cp MAP_END_A
    jr c, jr_000_260e

    ld b, MAP_LEGEND

jr_000_260e:
    ld a, b
    ld [$d7a8], a
    jp EnterLevel


Do2PlayMode:
    call Call_000_106b
    cp $00
    jp nz, DoMenuQuickStart.again

    ld a, MAP_2PLAY
    ld [$d7a8], a
    jp EnterLevel


DoGuicyMode:
    call Call_000_106b
    cp $00
    jp nz, DoMenuQuickStart.again

    ld a, MAP_GUICY
    ld [$d7a8], a
    jp EnterLevel


DoDemoMode:
    call Call_000_106b
    cp $00
    jp nz, DoMenuQuickStart.again

    ld a, MAP_DEMO
    ld [$d7a8], a
    jp EnterLevel


ShowPrologue:
    call Call_000_09df
    call Call_000_0d30
    call Call_000_0927
    ld a, BANK(ScreenPrologue1)
    call SetROMBank
    ld hl, ScreenPrologue1
    call Call_000_0bcf
    ld a, $03
    call Call_000_0cbf
    call Call_000_09eb
    ld a, $06
    call Call_000_0c65
    ld a, b
    cp $02
    jp nz, .skip

    call Call_000_09df
    ld a, BANK(ScreenPrologue2)
    call SetROMBank
    ld hl, ScreenPrologue2
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $08
    call Call_000_0c65
    ld a, b
    cp $02
    jp nz, .skip

    call Call_000_09df
    ld a, BANK(ScreenPrologue3)
    call SetROMBank
    ld hl, ScreenPrologue3
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $06
    call Call_000_0c65
    ld a, b
    cp $02
    jp nz, .skip

    call Call_000_09df
    ld a, BANK(ScreenPrologue4)
    call SetROMBank
    ld hl, ScreenPrologue4
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $08
    call Call_000_0c65
    ld a, b
    cp $02
    jp nz, .skip

    call Call_000_09df
    ld a, BANK(ScreenPrologue5)
    call SetROMBank
    ld hl, ScreenPrologue5
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $06
    call Call_000_0c65
    ld a, b
    cp $02
    jr nz, .skip

    call Call_000_09df
    ld a, BANK(ScreenPrologue6)
    call SetROMBank
    ld hl, ScreenPrologue6
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $08
    call Call_000_0c65
    ld a, b
    cp $02
    jr nz, .skip

    call Call_000_09df
    ld a, BANK(ScreenPrologue7)
    call SetROMBank
    ld hl, ScreenPrologue7
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $08
    call Call_000_0c65
    ld a, b
    cp $02
    jr nz, .skip

.skip
    call Call_000_09df
    ret


ShowWorldMap:
    call Call_000_09df
    call Call_000_0d30
    ld a, BANK(ScreenWorldMap)
    call SetROMBank
    ld hl, ScreenWorldMap
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


ShowEpilogue:
    call Call_000_09df
    call Call_000_0d30
    call Call_000_0927
    ld a, BANK(ScreenEpilogue1)
    call SetROMBank
    ld hl, ScreenEpilogue1
    call Call_000_0bcf
    ld a, $12
    call Call_000_0cbf
    call Call_000_09eb
    ld a, $0a
    call Call_000_0c65
    call Call_000_09df
    ld a, BANK(ScreenEpilogue2)
    call SetROMBank
    ld hl, ScreenEpilogue2
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $0b
    call Call_000_0c65
    call Call_000_09df
    ld a, BANK(ScreenEpilogue3)
    call SetROMBank
    ld hl, ScreenEpilogue3
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $0b
    call Call_000_0c65
    call Call_000_09df
    ld a, BANK(ScreenEpilogue4)
    call SetROMBank
    ld hl, ScreenEpilogue4
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $0b
    call Call_000_0c65
    call Call_000_09df
    ld a, BANK(ScreenEpilogue5)
    call SetROMBank
    ld hl, ScreenEpilogue5
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $0b
    call Call_000_0c65
    call Call_000_09df
    ld a, BANK(ScreenEpilogue6)
    call SetROMBank
    ld hl, ScreenEpilogue6
    call Call_000_0bcf
    call Call_000_09eb
    ld a, $0b
    call Call_000_0c65
    call Call_000_0d30
    ret


EnterLevel:
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
    ld a, MAP_PLAYEDIT
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


Jump_000_28c9::
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
    cp MAP_DEMO
    jr nz, jr_000_28f4

    jp $4000


jr_000_28f4:
    ld a, [$d7a8]
    cp MAP_2PLAY
    jr z, jr_000_2919

    cp MAP_GUICY
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
    call AddAToHL
    ld a, [hl]
    ld [$d7b5], a
    call Call_000_1954
    call Call_001_47b8
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
    cp MAP_GUICY
    jr c, .normal

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

.againNoSave
    ld hl, WindowInGameNoSave
    call RunMenu
    cp $00
    jp nz, .returnGame

    ld a, [$d8df]
    cp $00
    jr z, .giveUp

    cp $01
    jr z, .returnGame

    jr .againNoSave

.normal
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

.jr_000_2af3
    call Call_000_0de7
    ld a, $00
    ld [$d8df], a

.againWithSave
    ld hl, WindowInGame
    call RunMenu
    cp $00
    jp nz, .returnGame

    ld a, [$d8df]
    cp $00
    jr z, .dataSave

    cp $01
    jr z, .giveUp

    cp $02
    jr z, .returnGame

    cp $03
    jr z, .skipLevel

    jr .againWithSave

.dataSave
    ld a, $01
    ld [$d8e8], a
    call Call_000_0ec6
    cp $00
    jr nz, .jr_000_2af3

    call Call_000_11f1
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    call Call_000_108b
    call Call_000_0eee
    call Call_000_0c3c
    jr .returnGame

.giveUp
    jp LoseLevel

.skipLevel
    jp WinLevel

.returnGame:
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


Jump_000_2c26::
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
    call GetUnit
    ld a, UNIT_SHIFT_RANGE
    call AddAToHL
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
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_ABCD
    cp UNIT_INFANTRY
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
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld a, [hl]
    and UNIT_ABCD
    cp UNIT_INFANTRY
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
    call GetUnit
    ld a, UNIT_SHIFT_RANGE
    call AddAToHL
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
    call GetUnit
    ld a, UNIT_FLAGS
    call AddAToHL
    ld d, $00
    ld a, [hl]
    and UNIT_IS_AIR
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
    call Call_001_477f
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


Jump_000_3272::
    call Call_000_1590
    cp $00
    jp z, Jump_000_28c9

    cp $03
    jr c, jr_000_32a6

    cp $05
    jr z, jr_000_32c1

    ld b, a
    ld a, [$d7a8]
    cp MAP_GUICY
    jr z, jr_000_3298

    ld a, b
    cp $03
    jp z, LoseLevel

    cp $04
    jp z, WinLevel

    jp Jump_000_28c9


jr_000_3298:
    ld a, b
    cp $03
    jp z, WinLevel

    cp $04
    jp z, LoseLevel

    jp Jump_000_28c9


jr_000_32a6:
    ld a, [$d7a8]
    cp MAP_GUICY
    jr z, jr_000_32b7

    ld a, [$d7a4]
    bit 0, a
    jr z, WinLevel

    jp LoseLevel


jr_000_32b7:
    ld a, [$d7a4]
    bit 0, a
    jr nz, WinLevel

    jp LoseLevel


jr_000_32c1:
    ld a, [$d7a8]
    cp MAP_GUICY
    jr z, jr_000_32d2

    ld a, [$d7a4]
    bit 0, a
    jr nz, WinLevel

    jp LoseLevel


jr_000_32d2:
    ld a, [$d7a4]
    bit 0, a
    jr z, WinLevel

    jp LoseLevel


WinLevel:
    call Call_000_09df
    call Call_000_0d30
    call Call_000_0927
    ld a, BANK(ScreenWin)
    call SetROMBank
    ld hl, ScreenWin
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
    cp MAP_STORY
    jr z, .story

    cp MAP_LEGEND
    jp z, .legend

    jp ExitLevel


.story
    ld a, $11
    call Call_000_0cbf
    ld a, [$d79a]
    inc a
    ld [$d79a], a
    cp MAP_END_A  ; Completed A16 Zonect
    jp z, .storyDone

    cp MAP_END_C  ; Completed C16 Tcenoz
    jp z, .storyDone

    call ShowWorldMap
    jp EnterLevel


.storyDone
    ld a, MAP_STORY
    call RecordCompletion
    call ShowEpilogue
    call Call_000_1cf5
    jp ExitLevel


.legend
    ld a, $11
    call Call_000_0cbf
    ld a, [$d79a]
    inc a
    ld [$d79a], a
    cp MAP_END_B  ; Completed B16 Nector
    jr z, .legendDone

    cp MAP_END_D  ; Completed D16 Rotcen
    jr z, .legendDone

    call ShowWorldMap
    jp EnterLevel


.legendDone
    ld a, MAP_LEGEND
    call RecordCompletion
    call ShowEpilogue
    call Call_000_1cf5
    jp ExitLevel


LoseLevel:
    call Call_000_09df
    call Call_000_0d30
    call Call_000_0927
    ld a, BANK(ScreenGameOver)
    call SetROMBank
    ld hl, ScreenGameOver
    call Call_000_0bcf
    ld a, $10
    call Call_000_0cbf
    call Call_000_09eb
    ld a, $09
    call Call_000_0c65
    jp ExitLevel


Call_000_3394:
    call Call_000_09df
    ld a, BANK(MapTiles)
    call SetROMBank
    ld hl, MapTiles
    ld de, $8800
    ld bc, $0000
    call Call_000_0a36
    ld a, BANK(Call_001_5fae)
    call SetROMBank
    call Call_000_12f0
    call Call_000_1430
    call Call_000_0abb
    call Call_000_14b0
    call Call_001_5fae
    call Call_000_3dd4
    ld a, $01
    call Call_000_09f9
    ld a, $01
    call SetROMBank
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
    cp MAP_END_A - 1
    jr z, jr_000_3413

    cp MAP_END_B - 1
    jr z, jr_000_3413

    cp MAP_END_C - 1
    jr z, jr_000_3413

    cp MAP_END_D - 1
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
    cp MAP_END_A - 1
    jr z, jr_000_344a

    cp MAP_END_B - 1
    jr z, jr_000_344a

    cp MAP_END_C - 1
    jr z, jr_000_344a

    cp MAP_END_D - 1
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


Call_000_346f::
    ld a, [$d7c3]
    call Call_000_099b
    ld a, [hl]
    and $1f
    call GetUnit
    ld a, UNIT_AIR_POWER
    call AddAToHL
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
    call AddAToHL
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

Jump_000_34c1::
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
    jp ExitLevel


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
    ld a, MAP_EDIT
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
    ld a, BANK(WeaponDataTiles)
    call SetROMBank
    ld hl, WeaponDataTiles
    ld de, $8800
    ld bc, $0000
    call Call_000_0a36
    ld a, BANK(TileMapWeaponData)
    call SetROMBank
    ld hl, TileMapWeaponData
    ld de, $c1a0
    ld b, $12

jr_000_36bf:
    push de

Jump_000_36c0::
    call Call_000_083e
    call Call_000_083e
    pop de
    ld a, $40
    call AddAToDE
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
    call AddAToHL
    pop af
    ld [hl+], a
    inc a
    ld [hl], a
    ld a, $01
    call SetROMBank
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
    call GetUnit
    ld a, UNIT_SHIFT_RANGE
    call AddAToHL
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


Call_000_3828::
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
    ld a, BANK(BattleTileMap6)
    call SetROMBank
    ld hl, BattleTileMap6
    ld de, $c520
    ld b, $14
    ld c, $04
    call ShowTileMap
    call Call_000_1b3e
    ld a, $00
    call Call_000_1b5e
    call Call_000_0abb
    call Call_000_1c5e
    call Call_000_09eb
    call Call_000_39b3
    call Call_000_0927
    ld a, BANK(BattleTileMap6)
    call SetROMBank
    ld hl, BattleTileMap6
    ld de, $c520
    ld b, $14
    ld c, $04
    call ShowTileMap
    call Call_000_1b3e
    ld a, $01
    call Call_000_1b5e
    call Call_000_0abb
    call Call_000_1c5e
    call Call_000_09eb
    call Call_000_39b3
    call Call_000_0927
    ld a, BANK(BattleTileMap7)
    call SetROMBank
    ld hl, BattleTileMap7
    ld de, $c520
    ld b, $14
    ld c, $04
    call ShowTileMap
    ld a, $01
    call SetROMBank
    call Call_000_1b3e
    ld a, $02
    call Call_000_1b5e
    call Call_000_0abb
    call Call_000_1c7e
    call Call_000_39b3
    call Call_000_0927
    ld a, BANK(BattleTileMap5)
    call SetROMBank
    ld hl, BattleTileMap5
    ld de, $c520
    ld b, $14
    ld c, $04
    call ShowTileMap
    ld a, $01
    call SetROMBank
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
    ld a, BANK(BattleTileData)
    call SetROMBank
    ld hl, BattleTileData
    ld de, $8800
    ld bc, $0000
    call Call_000_0a36
    ld a, BANK(BattleTileMap4)
    call SetROMBank
    ld hl, BattleTileMap4
    ld de, $c1a0
    ld b, $14
    ld c, $04
    call ShowTileMap
    ld hl, BattleTileMap2
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
    call AddAToHL
    dec b
    jr nz, jr_000_3a07

jr_000_3a0f:
    ld de, $c2a0
    ld b, $0a
    ld c, BANK(BattleTileMap3)
    call ShowTileMap
    ld hl, BattleTileMap3
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
    call AddAToHL
    dec b
    jr nz, jr_000_3a3e

jr_000_3a46:
    ld de, $c2aa
    ld b, $0a
    ld c, BANK(BattleTileMap8)
    call ShowTileMap
    ld hl, BattleTileMap8
    ld de, $c360
    ld b, $14
    ld c, $07
    call ShowTileMap
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
    call SetROMBank
    ret


Call_000_3aac:
    push af
    push bc
    push de
    ld a, BANK(UnitNameTiles)
    call SetROMBank
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
    ld hl, UnitNameTiles

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
    ld a, BANK(UnitsUnion)
    call SetROMBank
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
    ld hl, UnitsGuicy
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


ShowTileMap:
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
    call AddAToHL
    ld a, $40
    call AddAToDE
    dec c
    jr nz, ShowTileMap

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
    call AddAToDE
    dec c
    jr nz, jr_000_3b55

    ret


data_000_3b68:
    db $06, $09, $07, $07, $07, $0b, $04, $07, $04, $0b, $03, $09, $01, $0b, $01, $07

data_000_3b78:
    db $0d, $09, $0b, $07, $0b, $0b, $0e, $07, $0e, $0b, $10, $09, $11, $0b, $11, $07

Call_000_3b88:
    ld a, BANK(BattleTileMap8)
    call SetROMBank
    ld hl, BattleTileMap8
    ld de, $c360
    ld b, $14
    ld c, $07
    call ShowTileMap
    ld a, [$da11]
    cp $00
    jr z, jr_000_3bc6

    ld a, [$d7a4]
    and $01
    cp $00
    jr nz, jr_000_3bb9

    ld hl, BattleTileMap2
    ld de, $c2a9
    ld b, $01
    ld c, $0a
    call Call_000_3b55
    jr jr_000_3bc6

jr_000_3bb9:
    ld hl, BattleTileMap2
    ld de, $c2aa
    ld b, $01
    ld c, $0a
    call Call_000_3b55

jr_000_3bc6:
    ld a, $01
    call SetROMBank
    ld a, $81
    ld [$d86f], a
    ld hl, data_000_3b68
    ld de, $d832
    call Call_000_3be8
    ld a, $85
    ld [$d86f], a
    ld hl, data_000_3b78
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
    call AddAToHL
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
    ld de, BattleTileMap1
    call AddAToDE
    ld a, BANK(BattleTileMap1)
    call SetROMBank
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
    call AddAToHL
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
    call SetROMBank
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


Call_000_3c96::
    di
    call Call_000_0d30
    call Call_000_0ca4
    ei
    call Call_000_0db5
    ld a, $0f
    call Call_000_0d07
    call Call_000_0927
    call Call_000_085d
    ld a, BANK(MessageTurn)
    call SetROMBank
    ld hl, MessageTurn
    ld de, $8000
    ld b, $28
    call Call_000_0a36
    ld a, $01
    call SetROMBank
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
    call AddAToHL
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
    ld a, BANK(MessageTurn)
    call SetROMBank
    ld a, [$d7a8]
    cp MAP_GUICY
    jr nz, jr_000_3d47

    ld a, [$d7a4]
    ld hl, MessagePlayer1
    cp $00
    jr nz, jr_000_3d5e

    ld hl, MessageComputer
    jr jr_000_3d5e

jr_000_3d47:
    ld a, [$d7a4]
    ld hl, MessagePlayer1
    cp $00
    jr z, jr_000_3d5e

    ld hl, MessageComputer
    ld a, [$d7a8]
    cp MAP_2PLAY
    jr nz, jr_000_3d5e

    ld hl, MessagePlayer2

jr_000_3d5e:
    ld de, $8000
    ld b, $14
    call Call_000_0a36
    ld a, $01
    call SetROMBank
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
    call SetROMBank
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
    ld a, BANK(MessageTurn)
    call SetROMBank
    ld hl, MessagePlayer1
    ld a, [$d7a8]
    cp MAP_GUICY
    jr nz, jr_000_3e68

    ld hl, MessageComputer

jr_000_3e68:
    ld de, $8000
    ld b, $14
    call Call_000_0a36
    ld a, $01
    call SetROMBank
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
    call SetROMBank
    ret


Jump_000_3e96:
    call Call_000_1954
    call Call_001_47b8
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

Call_000_3f80::
    push af
    ld a, $1d
    ldh [$80], a
    ld [$2000], a
    pop af
    ld bc, Call_000_3f8e
    push bc
    jp hl


Call_000_3f8e:
    ld a, $1c
    ldh [$80], a
    ld [$2000], a
    ret
