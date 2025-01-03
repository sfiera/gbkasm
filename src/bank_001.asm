; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "consts.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

SECTION "ROM Bank $001", ROMX[$4000], BANK[$1]

KissMailRegionHeader:
    db REGION_TYPE_ZEROFILE
    db REGION_TYPE_ZEROFILE ^ $ff
    dw $0000
    dw $a000

KissMailFileHeader:
    dw $001e
    db FILE_EXEC | FILE_A008
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $01           ; owner code
.title
    dp "KISS MAIL"
.end

KissMailMain:
    jp Jump_001_5e9d

data_01_4018:
    db "\0\0"

data_01_401a:
    dp "GB KISS MENU \0"

data_01_4028:
    INCBIN "gfx/system/attrs.2bpp"

    ds 14

traps1::
    dw trap_4b_7dcc         ; $4b
    dw TrapTileLoad         ; $4c
    dw trap_4d_7e77         ; $4d
    dw trap_4e_7f04         ; $4e
    dw trap_4f_7e90         ; $4f
    dw trap_50_7260         ; $50
    dw trap_51_665c         ; $51
    dw trap_52_7730         ; $52
    dw trap_53_784d         ; $53
    dw trap_54_7863         ; $54
    dw trap_55_793f         ; $55
    dw trap_56_78f0         ; $56
    dw trap_57_7df1         ; $57
    dw TrapDrawBox          ; $58
    dw trap_59_7e43         ; $59
    dw trap_5a_7d47         ; $5a
    dw trap_5b_7d60         ; $5b
    dw TrapDrawLayout       ; $5c
    dw TrapTileLoadText     ; $5d
    dw trap_5e_77ae         ; $5e
    dw TrapInputCursorMenu  ; $5f
    dw trap_60_6d2f         ; $60
    dw trap_61_7222         ; $61
    dw TrapExtractInit      ; $62
    dw TrapExtractData      ; $63
    dw trap_64_6de4         ; $64
    dw trap_65_6e2e         ; $65
    dw trap_66_6f66         ; $66
    dw trap_67_6f7a         ; $67
    dw trap_68_6f8f         ; $68
    dw TrapDrawString       ; $69
    dw TrapDrawStringList   ; $6a
    dw TrapFileSearch       ; $6b
    dw trap_6c_714d         ; $6c
    dw trap_6d_70ba         ; $6d
    dw trap_6e_71e6         ; $6e
    dw trap_6f_7138         ; $6f
    dw trap_70_6e8b         ; $70
    dw trap_71_6e63         ; $71
    dw TrapIRListen         ; $72
    dw TrapIRClose          ; $73
    dw trap_74_6c28         ; $74
    dw TrapIRFileSearch     ; $75
    dw TrapIRFileWrite      ; $76
    dw TrapIR04             ; $77
    dw TrapIRFileNext       ; $78
    dw TrapIRFileDelete     ; $79
    dw TrapIR07             ; $7a
    dw TrapIRReadSRAM       ; $7b
    dw TrapIRRead           ; $7c
    dw TrapIR0A             ; $7d
    dw TrapIRWriteSRAM      ; $7e
    dw TrapIRWrite          ; $7f

j01_4100::
    ld sp, $e000
    ld hl, j01_4100
    trap $6f
    xor a
    ldh [$b7], a
    call Call_001_498a

Jump_001_410e:
    call Call_001_4b33
    ld hl, $ffc0
    ld de, $ff44
    ld bc, $0001
    trap FileRead
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
    jr nz, Jump_001_4154

    ld h, a
    ld l, c
    trap JumpViaTable
    db $06
    dw Jump_001_4159 - @
    dw Jump_001_441d - @
    dw Jump_001_4164 - @
    dw Jump_001_4290 - @
    dw Jump_001_42b6 - @
    dw Jump_001_43be - @
    dw Jump_001_4154 - @

Jump_001_4154:
    call Call_001_4b36
    jr jr_001_4125

Jump_001_4159:
    ld hl, $c500
    trap $6d
    ld hl, data_01_4fb1
    jp Jump_001_43b4


Jump_001_4164:
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
    trap FileDelete
    ret


Call_001_41a9:
    ld e, $00

Jump_001_41ab:
    ld a, e
    cp d
    jp z, Jump_001_422d

    push de
    ld hl, $c500
    trap FileGetHeader
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
    trap FileSearch
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
    trap FileWrite
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
    trap $eb
    ld a, b
    or c
    jr z, jr_001_420a

    ld hl, $c700
    ld de, $c400
    trap $ec
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
    trap FileDelete
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
    trap FileRead
    pop de
    ld hl, sp+$04
    push de
    ld e, d
    ld d, $fe
    ld bc, $0004
    trap FileRead
    pop de
    ld hl, sp+$04
    push de
    ld d, $fe
    ld bc, $0004
    trap $e5
    pop de
    ld hl, sp+$00
    push de
    ld e, d
    ld d, $fe
    ld bc, $0004
    trap $e5
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
    trap AwaitButton
    jp Jump_001_413a

Jump_001_4290:
    call Call_001_4278
    jp z, Jump_001_4283

    call Call_001_4632
    jp c, Jump_001_410e

    ld hl, $c500
    ld c, $01
    trap $8f
    jp Jump_001_410e


Jump_001_42a6:
    ld hl, data_01_4ca0
    call Call_001_5033
    call Call_001_4b5e
    xor a
    call Call_001_42f5
    jp Jump_001_410e


Jump_001_42b6:
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
    ld de, data_01_4018
    ld bc, $000f
    trap MemCopy
    trap RandNext
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
    trap $8f
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
    trap $da
    and $02
    jr nz, jr_001_4358

    ret


Call_001_435f:
    trap AwaitBlit
    trap IRListen
    ld a, [$ce00]
    push af
    cp $05
    call z, Call_001_41a3
    trap $db
    pop af
    ret


Call_001_4370:
    trap AwaitBlit
    trap IRRead
    jr jr_001_43ac

Call_001_4376:
    ld hl, $ce00
    ld [hl], a
    ld d, h
    ld e, l
    ld c, $01
    trap AwaitBlit
    trap IRWrite
    jr jr_001_43ac

Call_001_4384:
    trap AwaitBlit
    trap IRClose
    jr jr_001_43ac

Call_001_438a:
    ld hl, $c700
    trap AwaitBlit
    trap IR06
    jr jr_001_43ac

Call_001_4393:
    ld de, $c600

Jump_001_4396:
    trap AwaitBlit
    trap IR0A
    jr jr_001_43ac

Call_001_439c:
    trap AwaitBlit
    trap IR04
    jr jr_001_43ac

Call_001_43a2:
    trap AwaitBlit
    trap IRFileWrite
    jr jr_001_43ac

Call_001_43a8:
    trap AwaitBlit
    trap IRFileSearch

jr_001_43ac:
    push af
    trap $db
    pop af
    ret


Jump_001_43b1:
jr_001_43b1:
    ld hl, data_01_4f66

Jump_001_43b4:
    call Call_001_4bd2
    ld a, $b4
    trap AwaitButton
    jp Jump_001_413a


Jump_001_43be:
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
    trap InputHiliteMenu
    or a
    ret nz

    bit 1, h
    ret


Call_001_43f1:
    call Call_001_4b52
    ret c

    push af
    ld hl, $0068
    trap $bd
    ld hl, $c500
    trap $f2
    ld e, d
    pop af
    cp e
    ret nc

    call Call_001_4b45
    ld hl, data_01_440d
    trap DrawString
    ret


data_01_440d::
    dk "エリアのあきができます»\0"


Jump_001_441d:
    ld a, $c4
    ld h, $04
    ld bc, $0301
    ld de, $0d12
    trap DrawInit
    ld de, $0000
    ld hl, data_01_44a6
    trap DrawStringList
    call Call_001_4526
    ld bc, $000a
    ld hl, $c500
    call Call_001_4965
    ld hl, $0753
    ld de, $8865
    ld bc, $0791
    trap $c2
    ld hl, $0153
    trap $bd
    ld hl, data_01_4510
    trap DrawString
    ld hl, $c400
    ld de, $ff46
    ld bc, $000a
    trap FileRead
    xor a
    ld [$c40a], a
    ld hl, $c400
    call Call_001_45dd
    ld hl, $015c
    trap $bd
    ld hl, data_01_4518
    trap DrawString
    add sp, -$04
    ld hl, sp+$00
    ld de, $ff40
    ld bc, $0004
    trap FileRead
    pop de
    pop bc
    ld hl, $c400
    trap $a0
    ld hl, $c404
    trap DrawString

jr_001_4489:
    trap AwaitFrame
    trap InputButtons
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
    trap AwaitButton
    ret


data_01_44a6::
    dk "なまえ»:\0"
    dk "      エリア すう»:\0"
    dk "      ポイントかち»:\0"
    dk "      ファイルじっこう:»\0"
    dk "« --- つうしん　りれき ---»\0"
    dk "さくしゃ:»\0"
    dk "No.1:\0"
    dk "No.2:\0"
    dk "No.3:\0"
    dk "\0"

data_01_4510::
    dk "ユーザー　:\0"

data_01_4518::
    dk "ポイントごうけい:»\0"

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
    trap StrConvInt
    ld hl, $0d01
    trap DrawAt
    ld hl, $c401
    trap DrawString
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
    trap MemCopy
    pop bc
    pop hl
    add hl, bc
    ld [hl], $00
    ld hl, $0400
    trap DrawAt
    ld hl, $c400
    trap DrawString
    pop de
    bit 0, d
    ret z

    call Call_001_4934
    ld hl, $0d02
    trap DrawAt
    ld hl, $c400
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push hl
    ld hl, $c42e
    ld bc, $0000
    trap $a0
    ld hl, $c434
    trap DrawString
    pop de
    ld hl, $0505

jr_001_45a3:
    push hl
    push de
    trap DrawAt
    ld hl, $c42e
    ld bc, $000a
    trap MemCopy
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
    trap DrawAt
    ld hl, $c42e
    trap StrConvInt
    ld hl, $c431
    trap DrawString
    pop de
    pop hl
    inc l
    ld a, l
    cp $09
    jr c, jr_001_45a3

    ret


Call_001_45dd:
    ldh a, [hDrawMode]
    push af
    or (1 << DrawMode_Bit6)
    ldh [hDrawMode], a
    trap DrawString
    pop af
    and ~(1 << DrawMode_Bit2)
    ldh [hDrawMode], a
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

    ld hl, KissCartridgeCode
    cp [hl]
    jr z, jr_001_4605

    ld de, data_01_4028
    jr jr_001_461f

jr_001_4605:
    bit 2, d
    jr z, jr_001_461c

    bit 1, d
    jr z, jr_001_4612

    ld de, data_01_4028 + $30
    jr jr_001_461f

jr_001_4612:
    ld de, data_01_4028 + $20
    jr jr_001_461f

jr_001_4617:
    ld de, data_01_4028 + $40
    jr jr_001_461f

jr_001_461c:
    ld de, data_01_4028 + $10

jr_001_461f:
    ld hl, $c400
    ld bc, $0010
    push hl
    trap MemCopy
    pop hl
    ld bc, $0108
    pop de
    trap $c0
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

    ld hl, data_01_401a
    ld de, $ce02
    ld bc, $000d
    trap $67
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
    trap $f0
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
    trap $eb
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
    trap $cc
    ld a, $b4
    trap AwaitButton
    ret

Call_001_4764:
    ld a, $01
    trap $cc
    ret

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
    trap FileGetHeader
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
    db 4
    db  0,  0, $00, 0
    db 16,  0, $02, 0
    db  0, 32, $10, 0
    db 16, 32, $12, 0

Call_001_47eb:
Jump_001_47eb:
    ld hl, $ffc0
    ld de, $ff44
    ld bc, $0001
    trap $e5
    ldh a, [$c2]
    ld c, a
    ldh a, [$c0]
    cp c
    jr nz, jr_001_480c

    ldh a, [$c3]
    call Call_001_47b9
    ld hl, data_01_47da
    ld a, $1c
    trap $60
    jr jr_001_4811

jr_001_480c:
    ld bc, $041c
    trap $c4

jr_001_4811:
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
    ld de, $5c3c
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
    trap MathDiv16
    pop de
    trap MathMul16
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
    trap MemCopy
    pop de
    ld a, $00
    ld hl, $0000
    ld bc, $0502
    trap $c5
    ret


Call_001_4929:
    ld hl, $c500

Call_001_492c:
    ld de, $ffd2
    ld b, $00
    trap $ea
    ret

Call_001_4934:
    ld a, [$c502]
    cp $ff
    jr z, jr_001_494a

    call Call_001_4929
    ld hl, $c500
    ld de, $c400
    ld bc, $002e
    trap $eb
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
    trap MemCopy
    ret


Call_001_4965:
    push hl
    push de
    push bc
    ld de, $c600
    trap $64
    ld hl, $c600
    pop de
    push de
    ld bc, $0418
    trap $c0
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
    trap $e1
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
    trap DrawInit
    ld hl, $1200
    trap $b6
    ld a, $e4
    ldh [$9d], a
    ld a, $1b
    ldh [$9e], a
    ld de, $0000
    ld bc, $1005
    trap DrawBox
    ld a, $80
    ld hl, $0e01
    ld de, $0101
    ld bc, $0e03
    trap $59
    ld a, $83
    ld hl, $0e01
    ld de, $0105
    ld bc, $0e09
    trap $59
    ld de, $000e
    ld bc, $1004
    trap DrawBox
    ld a, $8c
    ld hl, $0e01
    ld de, $010f
    ld bc, $0e02
    trap $59
    ld de, data_01_5d33
    ld bc, $c400
    trap ExtractInit
    ld de, $8000
    ld bc, $0380
    trap ExtractData
    ld a, $07
    trap LCDEnable
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
    trap $c5
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
    trap MemSet
    ld hl, $0060
    trap $bd
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
    trap MemCopy

jr_001_4a7c:
    ld hl, $c400
    trap DrawString
    ld a, $0e
    trap DrawCtrlChar
    ld a, $0e
    trap $c8
    ld hl, $0068
    trap $bd
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
    trap DrawString
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
    dk "エリア  No.\0"

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
    trap $bd
    xor a
    trap $f1
    ld e, c

Call_001_4b45:
    ld d, $00
    ld hl, $c400
    trap StrConvInt
    ld hl, $c403
    trap DrawString
    ret


Call_001_4b52:
    ld a, $01
    trap $f1
    ld a, b
    or a
    ret z

    ld a, e
    cp $20
    ccf
    ret


Call_001_4b5e:
    ld hl, $0000
    trap $bd
    call Call_001_4b52
    jr nc, jr_001_4b6d

    ld a, $10
    trap $c8
    ret


jr_001_4b6d:
    ld e, a
    ld d, $00
    push af
    ld hl, $c400
    trap StrConvInt
    pop af
    ld hl, StrJushinAreaAitemasen
    or a
    jr z, jr_001_4b85

    ld hl, $c404
    trap DrawString
    ld hl, StrAreaMadeJushin

jr_001_4b85:
    trap DrawString
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
    trap $bd
    pop hl
    ret


jr_001_4ba5:
    push hl
    ld hl, data_01_4c15
    call Call_001_4bd2
    ld a, $10
    call Call_001_4b9d
    ld a, " "
    trap DrawChar
    trap DrawString
    pop hl
    jr jr_001_4be1

jr_001_4bba:
    ld a, [hl+]
    push hl
    ld h, [hl]
    ld l, a
    trap DrawString
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
    trap DrawCtrlChar

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

    trap $c8
    jr jr_001_4be1

jr_001_4bf1:
    dec hl
    trap DrawString
    jr jr_001_4be1

MACRO extstr
    db $fc
    dw Str\1
ENDM

data_01_4bf6::
    dw data_01_4e28
    dw data_01_4e44
    dw data_01_4e65
    dw data_01_4e9b
    dw data_01_4eb9
    dw data_01_4eef

data_01_4c02::
    dk "\0"
    dk "   この\0"
    extstr File
    dh "は\0"
    db $ee, $00, $08
    db $ee, $00, $ff

data_01_4c15::
    db $08
    dk "«　　　せんたくしている\0"
    db $ee, $00, $ff

StrFile:
    dh "ファイル«\0"
StrDekimasen:
    dk "デキマセン\0"
StrHaiIie:
    dk "はい　いいえ\0"
StrGameBoy:
    dh "ゲームボーイ«\0"
StrButtonOshite:
    dk "ボタンを　おしてください\0"
StrAreaTarimasen:
    dk "あきエリアすうがたりません\0"
StrAreaKakuho:
    dk "あきエリアを　かくほ\0"
StrAreaMadeJushin::
    dk "エリアまでじゅしんかのうです\0"
StrJushinAreaAitemasen::
    dk "じゅしんエリアが　あいていません\0"

data_01_4ca0::
    dk $08, "つうしんを　ちゅうしするばあいは\0"
    dk "\0"
    dk $10, "Ｂ\0"
    extstr ButtonOshite
    db $f0, $00, $ff

data_01_4cbe::
    db $08
    extstr GameBoy
    dh "どうしを　くっつけて\0"
    dk "\0"
    db $10, "Ａ\0"
    extstr ButtonOshite
    db $f0, $00
    db $ff

data_01_4cd8::
    db $00
    db $f0, $00
    db $08
    extstr File
    dh "を　おくっています\0"
    db $f0, $00
    db $10
    db $f0, $00
    db $ff

data_01_4cef::
    db $00
    db $f0, $00
    db $08
    extstr File
    dh "を　おくりました！\0"
    db $f0, $00
    db $10
    db $f0, $00
    db $ff

data_01_4d06::
    db $00
    db $f0, $00
    db $08
    extstr File
    dh "を　うけとっています\0"
    db $f0, $00
    db $10
    db $f0, $00
    db $ff

data_01_4d1e::
    db $00
    db $f0, $00
    db $08
    extstr File
    dh "を　うけとりました！\0"
    db $f0, $00
    db $10
    db $f0, $00
    db $ff

data_01_4d36::
    db $00
    dk "あいての\0"
    extstr GameBoy
    dh "の\0"
    db $f0, $00
    db $08
    extstr AreaTarimasen
    db $f0, $00
    dk $10, "かくほして　もらってください\0"
    db $f0, $00, $ff

data_01_4d5f::
    db $00
    dk "つうしんを　しっぱいしました\0"
    db $f0, $00
    db $08
    db $f0, $00
    db $10
    dk "もういちどやりなおしてください　\0"
    dk "\0"
    db $ff

data_01_4d8d::
    db $00
    dk "あいての\0"
    extstr GameBoy
    dh "が\0"
    db $f0, $00
    db $08
    dk "GB KISS メニューの\0"
    db $f0, $00
    db $10
    dk "じゅしんじょうたいでありません　\0"
    dk "\0"
    db $ff

data_01_4dc6::
    db $00
    dk "あいてに　おなじ\0"
    extstr File
    dh "が\0"
    db $f0, $00
    dk $08, "そんざいします\0"
    db $f0, $00
    dk $10, "うわがきしますか？\0"
    extstr HaiIie
    db $f0, $00
    db $ff

data_01_4dfa::
    db $10
    db $f0, $00
    db $ff

data_01_4dfe::
    db $00
    extstr AreaTarimasen
    db $f0, $00
    db $08
    dk "いくつか\0"
    extstr File
    dk "をさくじょして\0"
    db $f0, $00
    db $10
    extstr AreaKakuho
    dh "してください\0"
    dh "\0"
    db $ff

data_01_4e28:
    db $00, $e3
    dk "＜　スタート　＞\0"
    db $ee, $00, $fd
    dh "をじっこうします　»\0"
    dk "\0"
    db $ff

data_01_4e44:
    db $00
    db "　＜\0"
    extstr File
    dh "　じょうほう＞　\0"
    dk "\0"
    db $fd
    dh "のじょうほうです　\0"
    dk "\0"
    db $ff

data_01_4e65:
    db $00
    dh "　＜　\0"
    extstr File
    dh "いれかえ　＞　\0"
    dk "\0"
    db $08
    dk "«　せんたくした　\0"
    extstr File
    dh "と　\0"
    dk "\0"
    dk $10, "«　　ばしょをいれかえます\0"
    db $ee, $00, $ff

data_01_4e9b:
    db $00
    dh "　＜　\0"
    extstr File
    dh "そうしん　＞　\0"
    dh "\0"
    db $fd
    dh "をそうしんします　\0"
    dk "\0"
    db $ff

data_01_4eb9:
    db $00
    dh "　＜　\0"
    extstr File
    dh "じゅしん　＞　\0"
    dk "\0"
    dk $08, "«　　　せんたくぶぶんに\0"
    db $ee, $00
    dh $10, "　\0"
    extstr File
    dh "を　うけとります　\0"
    dk "\0"
    db $ff

data_01_4eef:
    db $00
    dh "　＜　\0"
    extstr File
    dh "さくじょ　＞　\0"
    dk "\0"
    db $fd
    dh "をさくじょします　\0"
    dk "\0"
    db $ff

data_01_4f0f::
    db $00
    dk "«　ほんとうにさくじょして\0"
    db $ee, $00, $08
    extstr SpaceYorishiiDesuKau
    db $ee, $00, $10
    db $e4
    extstr HaiIie
    db $ee, $00, $ff

StrSpaceYorishiiDesuKau:
    dk "　"
StrYoroshiiDesuKa:
    dk "よろしいですか？\0"

data_01_4f3b::
    db $00
    db $ee, $00, $08
    db $ee, $00, $10
    db $ee, $00, $02
    dk " GB KISS メニュー\0"
    dk "\0"
    dk "»« とうろく\0"
    extstr File
    dh "　　　こ\0"
    dk "\0"
    db $ff

data_01_4f66::
    db $fe, $10, $e2
    dk "さくじょ\0"
    extstr Dekimasen
    db $ee, $00, $ff

data_01_4f76::
    db $fe, $10, $e2
    dk "そうしん\0"
    extstr Dekimasen
    db $ee, $00, $ff

data_01_4f85::
    db $00
    dk "«　　この\0"
    extstr File
    dh "をけして\0"
    db $ee, $00, $08
    dk "«　ここにじゅしんしますか？\0"
    db $ee, $00, $10
    db $e4
    extstr HaiIie
    db $ee, $00, $ff

data_01_4fb1::
    db $fe, $10, $e2
    dk "じっこう\0"
    extstr Dekimasen
    db $ee, $00, $ff

data_01_4fc1::
    db $00
    dk "ないぶデータの　ならべかえで\0"
    dk "\0"
    db $08
    extstr AreaKakuho
    dh "します　\0"
    dk "\0"
    db $10
    extstr YoroshiiDesuKa
    extstr HaiIie
    db $00, $ff

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
    trap $c5
    call Call_001_44a1
    jr nz, jr_001_5013

    ld bc, $0a00
    trap $c4
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
    trap AwaitFrame
    trap InputButtons
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
    trap DrawInit
    ld hl, $9800
    ld bc, $0240
    ld e, $04
    trap MemSet
    ld a, $ca
    ld bc, $0e02
    ld de, $0310
    trap $c9


    ld de, data_01_50b2
    ld bc, $c400
    trap ExtractInit
    ld de, $9000
    ld bc, $0800
    trap ExtractData
    ld de, $8800
    ld bc, $0470
    trap ExtractData
    ld hl, $8c70
    ld bc, $0390
    ld e, $00
    trap MemSet
    ld hl, $99a0
    ld de, data_01_5ccf
    ld b, $05
    ld c, $14
    call Call_001_509b
    pop hl
    ld de, data_01_59cf
    call Call_001_508f
    ld a, $01
    trap LCDEnable
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
    trap MemCopy
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
    INCBIN "frag/system/transfer.hz"

data_01_59cf:
    INCBIN "gfx/system/transfer.map", 0, 192

data_01_5a8f::
    INCBIN "gfx/system/transfer.map", 192, 192

data_01_5b4f::
    INCBIN "gfx/system/transfer.map", 384, 192

data_01_5c0f::
    INCBIN "gfx/system/transfer.map", 576, 192

data_01_5ccf::
    db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02
    db $03, $04, $ca, $cd, $d0, $d3, $d6, $d9, $dc, $df, $e2, $e5, $e8, $eb, $ee, $f1, $f4, $f7, $04, $11
    db $03, $04, $cb, $ce, $d1, $d4, $d7, $da, $dd, $e0, $e3, $e6, $e9, $ec, $ef, $f2, $f5, $f8, $04, $11
    db $03, $04, $cc, $cf, $d2, $d5, $d8, $db, $de, $e1, $e4, $e7, $ea, $ed, $f0, $f3, $f6, $f9, $04, $11
    db $1e, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $20

data_01_5d33::
    INCBIN "frag/system/actions.hz"

Jump_001_5e9d::
    ld a, $20
    trap DrawInit
    call Call_001_6627
    call Call_001_64d3

Jump_001_5ea7:
    call Call_001_657f
    ld a, $01
    call Call_001_66c2
    ld de, data_01_470d
    ld hl, $c699
    trap $54
    ld a, $03
    trap LCDEnable

jr_001_5ebb:
    trap AwaitFrame
    trap InputButtons
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
    trap TileLoadText
    ret


jr_001_5ef2:
    xor a
    call Call_001_66c2
    call Call_001_6181
    trap $55
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

    trap TileLoadText
    jr jr_001_5f60

jr_001_5f44:
    ld b, e

jr_001_5f45:
    push hl
    push de
    push bc
    ld e, [hl]
    trap $4b
    push hl
    ld hl, $c3ee
    ld a, $ff
    ld [hl+], a
    ld [hl], a
    pop hl
    trap MemCopy
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
    trap InputCursorMenu
    jp c, Jump_001_5ea7

    ld l, a
    ld h, $00
    trap JumpViaTable
    db $06
    dw Jump_001_5ea7 - @
    dw Jump_001_601f - @
    dw Jump_001_6071 - @
    dw Jump_001_60ba - @
    dw Jump_001_5fb7 - @
    dw Jump_001_5fa4 - @

data_01_5f82::
    db $06
    db $04, $05
    db $70, $7f
    dw Call_001_5f89 - @

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
    trap $5a
    ld a, d
    ldh [$c4], a
    or a
    ret


Jump_001_5fa4:
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
    trap $01

Jump_001_5fb7:
    call Call_001_657f
    ldh a, [$c0]
    push af
    ld a, $01
    ldh [$c0], a
    ld a, $07
    call Call_001_5f89
    ld a, $03
    trap LCDEnable

jr_001_5fca:
    trap AwaitFrame
    trap InputButtons
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
    trap AudioStop
    ld hl, $0400
    trap $b6
    call Call_001_614f
    trap $70
    call Call_001_5f15
    ld hl, $0404
    trap $b6
    trap AudioStop
    trap $db
    jr jr_001_5fca


Jump_001_601f:
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
    trap FileSearch
    jr c, jr_001_6059

    ld a, $0a
    call Call_001_5f89
    call Call_001_6169
    jr c, jr_001_606b

    ld hl, $c500
    trap FileDelete
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


Jump_001_6071:
    call Call_001_657f
    ld a, $0c
    call Call_001_5f89
    ld a, $03
    trap LCDEnable
    call Call_001_6169
    jp c, Jump_001_5f61

    ld a, $0d
    call Call_001_5f89
    ld a, $01
    trap $cc
    trap AwaitBlit
    call Call_001_611d
    jr c, jr_001_60b0

    ld hl, $c600
    ld e, l
    ld d, h
    ld c, $99
    trap IRWrite
    jr c, jr_001_60b5

    trap IRClose
    jr c, jr_001_60b5

    ld a, $0e
    call Call_001_5f89

jr_001_60a7:
    xor a
    trap $cc
    call Call_001_6173
    jp Jump_001_5f61


jr_001_60b0:
    call Call_001_6114
    jr jr_001_60a7

jr_001_60b5:
    call Call_001_6112
    jr jr_001_60a7


Jump_001_60ba:
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
    trap AwaitBlit
    ld de, data_01_661d
    ld hl, $c6d5
    ld bc, $000a
    trap MemCopy
    ld a, $01
    trap $cc
    trap IRListen
    push af
    xor a
    trap $cc
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
    trap InputButtons
    or a
    jr nz, jr_001_6117

    ret


Call_001_611d:
    ld hl, $c6d5
    ld de, $c400
    ld bc, $000a
    trap IRRead
    jr c, jr_001_6146

    ld hl, $c400
    ld de, data_01_661d
    ld bc, $000a
    trap $67
    or a
    jr nz, jr_001_6149

    inc a
    ld hl, $c400
    ld [hl], a
    ld de, $c6d5
    ld bc, $000a
    trap IRWrite
    ret nc

jr_001_6146:
    ld a, $10
    ret


jr_001_6149:
    trap IRClose
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
    trap $4f
    ret


Call_001_6169:
    ldh a, [$c4]
    ld d, a
    ld e, $01
    ld hl, data_01_64c5
    trap $5a

Call_001_6173:
jr_001_6173:
    trap AwaitFrame
    trap InputButtons
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
    trap $4d
    ld c, a
    ret


data_01_61a1:
    dw .61c9
    dw .61de
    dw .61f4
    dw .6216
    dw .6239
    dw .6252
    dw .626f
    dw .629c
    dw .62c9
    dw .62ef
    dw .632d
    dw .635e
    dw .6373
    dw .6399
    dw .63b5
    dw .63d1
    dw .640b
    dw .643c
    dw .6465
    dw .6490

.61c9
    dk $01, $0e, "へんしゅうがめんにもどります\0"
    db $ff

.61de
    dk $01, $0e, "いまのぶんしょうをほぞんします\0"
    db $ff

.61f4
    dk $01, $0e, "ほかのゲームボーイにぶんしょうを\0"
    dh $01, $0f, "おくります\0"
    db $ff

.6216
    dk $01, $0e, "ほかのゲームボーイからぶんしょうを\0"
    dh $01, $0f, "もらいます\0"
    db $ff

.6239
    dh $01, $0e, "ポケベルにぶんしょうをおくります\0"
    db $ff

.6252
    dk $01, $0e, "「ＫＩＳＳ　ＭＡＩＬ」を\0"
    dh $01, $0f, "しゅうりょうします\0"
    db $ff

.626f
    dk $01, $0e, "あきようりょうがたりなくてセーブ\0"
    dk $01, $0f, "できませんでした\0"
    dh $01, $10, "ＯＫ：Ａ\0"
    db $ff

.629c
    dh $01, $0e, "»Ａボタンをおすと１ぎょうごとに\0"
    dh $01, $0f, "はっしんします\0"
    dh $01, $10, "しゅうりょう：Ｂ\0"
    db $ff

.62c9
    dh $01, $0e, "セーブされていませんが\0"
    dh $01, $0f, "しゅうりょうしてもいいですか？\0"
    db $ff

.62ef
    dh $01, $0e, "タイトルがにゅうりょくされていません\0"
    dh $01, $0f, "にゅうりょくしたあとでもういちど\0"
    dh $01, $10, "セーブしてください\0"
    db $ff

.632d
    dk $01, $0e, "おなじなまえのぶんしょうがあります\0"
    dh $01, $0f, "うわがきしてほぞんしてもいいですか？\0"
    db $ff

.635e
    dh $01, $0e, "セーブしました\0"
    dh $01, $0f, "ＯＫ：Ａ\0"
    db $ff

.6373
    dk $01, $0e, "このぶんしょうをそうしんします\0"
    dh $01, $0f, "じゅんびはいいですか？\0"
    db $ff

.6399
    dk $01, $0e, "つうしんちゅうです\0"
    dh $01, $0f, "ちゅうだんする：Ｂ\0"
    db $ff

.63b5
    dk $01, $0e, "つうしんがしゅうりょうしました\0"
    dh $01, $0f, "ＯＫ：Ａ\0"
    db $ff

.63d1
    dk $01, $0e, "「ＫＩＳＳ　ＭＡＩＬ」どうしでないと\0"
    dh $01, $0f, "つうしんできません\0"
    dh $01, $10, "もういちどやりなおしてください\0"
    db $ff

.640b
    dk $01, $0e, "つうしんがちゅうだんされました\0"
    dh $01, $0f, "もういちどやりなおしてください\0"
    dh $01, $10, "ＯＫ：Ａ\0"
    db $ff

.643c
    dk $01, $0e, "じゅしんたいきちゅうです\0"
    dh $01, $0f, "あいてのそうしんをかいししてください\0"
    db $ff

.6465
    dk $01, $0e, "へんしゅうちゅうのぶんしょうが\0"
    dh $01, $0f, "きえてしまいますが、いいですか？\0"
    db $ff

.6490
    dk $06, $00, "ＫＩＳＳ　ＭＡＩＬ\0"
    dh $01, $0e, "セーブできるようりょうがたりません\0"
    dh $01, $0f, "それでもいいですか？\0"
    db $ff

data_01_64c5::
    dh $01, $10, "はい:A いいえ:B\0"
    db $ff

Call_001_64d3::
    ld hl, $c500
    ld a, [hl+]
    or [hl]
    jp nz, Jump_001_6678

    ld hl, $00d2
    trap $e6
    bit 7, h
    jr nz, jr_001_64ec

    trap $e7
    xor a
    trap $f1
    inc b
    dec b
    ret nz

jr_001_64ec:
    call Call_001_66dc
    ld a, $03
    trap LCDEnable
    ld a, $13
    call Call_001_5f89
    call Call_001_6169
    jp c, Jump_001_5fb5

    trap LCDDisable
    ret


Call_001_6501:
    trap LCDDisable
    call Call_001_66dc
    ld de, data_01_4028 + $50
    ld hl, $9700
    ld bc, $0010
    trap MemCopy
    call Call_001_65db
    ld de, $0204
    ld bc, $1109
    trap DrawBox
    ld hl, data_01_6535
    ld de, $9101
    trap $5a
    call Call_001_652c
    ld a, $03
    trap LCDEnable
    ret


Call_001_652c:
    ld de, $000d
    ld bc, $1405
    trap DrawBox
    ret


data_01_6535::
    dk $05, $05, "つづける\0"
    dh $05, $06, "セーブする\0"
    dh $05, $07, "そうしんする\0"
    dh $05, $08, "じゅしんする\0"
    dh $05, $09, "ポケベルにおくる\0"
    dh $05, $0a, "KISSメニューにもどる»\0"
    db $ff

Call_001_657f:
    trap LCDDisable
    call Call_001_66dc
    ld a, $e4
    ldh [$9d], a
    call Call_001_65c6
    call Call_001_65db
    ld de, $0103
    ld bc, $130a
    trap DrawBox
    ld a, $73
    ld de, $0103
    trap $cd
    inc a
    ld d, $13
    trap $cd
    ld a, $91
    ld hl, $0111
    ld de, $0204
    ld bc, $1108
    trap $59
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
    trap MemSet
    ld hl, $9800
    ld bc, $0400
    ld e, $7f
    trap MemSet
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
    trap DrawBox
    ld a, $80
    ld hl, $0111
    ld de, $0702
    ld bc, $0c01
    trap $59
    ld hl, data_01_6607
    ld de, $2001
    trap $5a
    ret


data_01_6607::
    dk $06, $00, "KISS MAIL\0"
    dh $02, $02, "タイトル:\0"
    db $ff

data_01_661d::
    dk $00, "KISS-MAIL"

Call_001_6627:
    call Call_001_6651
    ld de, $c500
    ld hl, $c400
    ld bc, $0100
    trap MemCopy
    ld de, $c699
    call trap_51_665c
    call Call_001_6651
    ld de, $c400
    ld hl, $c500
    ld bc, $0100
    trap MemCopy
    xor a
    ldh [$c0], a
    ldh [$c1], a
    ldh [$c2], a
    ret


Call_001_6651:
    ld hl, $c600
    ld bc, $0099
    ld e, $20
    trap MemSet
    ret


trap_51_665c::
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
    trap $eb
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
    trap $4e
    ret


Call_001_66ab:
    xor a
    ld [$c50a], a
    ld bc, $01ff
    ld de, $0088
    trap FileWrite
    ret c

    ld de, $c611
    ld bc, $0088
    trap $ec
    or a
    ret


Call_001_66c2:
    push af
    ld a, $30
    ld hl, $0102
    ld de, $0003
    ld bc, $0202
    trap $59
    pop af
    ld e, a
    ld d, $30
    ld hl, data_01_7f70
    ld c, $04
    trap TileLoad
    ret


Call_001_66dc:
    ld h, $04
    trap $ca
    ret

Call_001_66e1:
    ld de, $ff46
    ld bc, $003a
    push hl
    push bc
    trap FileRead
    pop bc
    pop hl
    ret


Jump_001_66ee:
    ld a, $20
    trap DrawInit
    call Call_001_65c6
    call Call_001_6627
    call Call_001_66dc
    ld de, $0000
    ld bc, $140d
    trap DrawBox
    ld hl, data_01_67c2
    ld de, $8001
    trap $5a
    ld hl, data_01_67fe

jr_001_670e:
    call Call_001_67b5
    jr nz, jr_001_671f

    push hl
    ld a, c
    ld c, $01
    ld hl, $0100
    trap $59
    pop hl
    jr jr_001_670e

jr_001_671f:
    xor a
    ldh [$c3], a
    trap $e1
    jr nc, jr_001_6731

    ld a, $01
    ldh [$c3], a
    trap $65
    ld de, $c699
    trap $51

jr_001_6731:
    ld hl, $c600
    call Call_001_66e1
    ld de, $0001
    trap TileLoadText
    ld a, $03
    trap LCDEnable
    ldh a, [$c3]
    or a
    jr nz, jr_001_6757

    call Call_001_652c
    ld hl, data_01_6824
    ld de, $b001
    trap $5a
    ld a, $10
    call Call_001_685d
    jr c, jr_001_67b3

jr_001_6757:
    ld de, data_01_470d
    ld hl, $c699
    trap $54

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
    trap $4d
    ld c, a
    trap $55
    pop hl
    jr jr_001_6762

jr_001_677b:
    ld hl, data_01_680e
    ld de, $b001
    trap $5a
    ld a, $0b
    call Call_001_685d
    jr nc, jr_001_6799

jr_001_678a:
    ld a, $7f
    ld de, $030a
    ld bc, $0e02
    ld hl, $0000
    trap $59
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

    trap $65
    ld hl, $c600
    ld de, $ff46
    ld bc, $003a
    trap $e5

jr_001_67b3:
    trap $01

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
    dk $04, $01, "このカートリッジにあなたの\0"
    dh $04, $02, "じょうほうをとうろくします\0"
    dh $02, $04, "なまえ:\0"
    dh $02, $05, "でんわ:\0"
    dh $03, $06, "メモ:\0"
    db $ff

data_01_67fe::
    db $04, $00, $0a
    db $05, $0a, $0c
    db $06, $16, $0c
    db $07, $22, $0c
    db $08, $2e, $0c
    db $ff

data_01_680e::
    dk $03, $0a, "このじょうほうでいいですか？\0"
    db $ff

data_01_6824::
    dk $01, $0e, "このじょうほうをかえると,すべての\0"
    dh $01, $0f, "ファイルがきえますが、いいですか？\0"
    db $ff

data_01_6855::
    dh "はい　\0"
    dh "いいえ\0"

Call_001_685d:
    ldh [hDraw91], a
    ld a, $03

jr_001_6861:
    ldh [hDraw90], a
    ld a, $0f
    trap DrawCtrlChar
    ldh a, [hDraw91]
    ld e, a
    ld d, $07
    trap $57
    ld c, l
    ld b, h
    ld hl, data_01_6855
    ld de, $d301
    ldh a, [hDraw90]
    ldh [$b4], a
    trap $5b
    inc bc
    inc bc
    inc bc
    ldh a, [hDraw90]
    swap a
    ldh [$b4], a
    trap $5b
    ld a, $03
    ldh [$b4], a

jr_001_688b:
    trap AwaitFrame
    trap InputButtons
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

    ldh a, [hDraw90]
    cp $30
    ret


SECTION "ROM Bank $001-B", ROMX[$6d2f], BANK[$1]

trap_60_6d2f::
    ld b, [hl]
    inc hl
    push hl
    trap $c6
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


TrapExtractInit::
    ld hl, VarExtractAddr
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


TrapExtractData::
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
    ld hl, VarExtractAddr
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

    ld hl, VarExtractAddr
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
    ld hl, VarExtractAddr
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

trap_64_6de4::
    trap $ed
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
    call trap_6c_714d
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


trap_65_6e2e::
    trap KissClearAll
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
    trap $e5
    pop hl
    pop bc
    pop de
    pop hl
    inc e
    ld a, l
    or h
    jr nz, jr_001_6e36

    trap $09
    ret


trap_71_6e63::
    ; Create 4 bytes of scratch space on the stack.
    ; Save hl and set it to the scratch space addr.
    add sp, -$04
    push hl
    ld hl, sp+$02

    ; Read (e)th index entry to scratch space.
    ld d, $fe
    ld bc, $0004
    trap FileRead

    ; Pop saved hl and index entry. After this:
    ; * bc contains original value of hl.
    ; * hl contains CRAM address of file.
    ; * d contains owner code of file.
    ; * e contains cartridge code of file.
    pop bc
    pop hl
    pop de

    ; Check if there is a file at this index (hl != 0).
    ld a, l
    or h
    jr z, .noFile

    ; Check if this is Kiss Mail (not an installed file).
    ld a, e
    cp $ff
    jp z, KissMail

    trap $fc
    ret


.noFile::
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

trap_70_6e8b::
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

    trap $f8
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

    trap $f9
    jr jr_001_6e8e

jr_001_6ec1:
    trap $f8
    jr jr_001_6e8e


jr_001_6ec5:
    ld a, $30
    call Call_001_6efc
    ld a, $35
    trap $f8
    ld c, $00
    jr jr_001_6e8e

jr_001_6ed2:
    ld a, $32
    call Call_001_6ef7
    ld c, b
    jr jr_001_6e8e

jr_001_6eda:
    ld a, $23
    trap $f8
    ld a, $23
    trap $f8
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
    trap $f8
    pop af
    trap $f8
    ret


trap_03_6f05::
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


trap_04_6f35::
    push bc
    push de
    push hl
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


trap_05_6f3e::
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


trap_66_6f66::
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


trap_67_6f7a::
    ld a, [de]
    cp [hl]
    jr nz, jr_001_6f89

    inc de
    inc hl
    dec bc
    ld a, b
    or c
    jr nz, trap_67_6f7a

    ld hl, $0000
    ret


jr_001_6f89:
    sbc a
    ld h, a
    add a
    inc a
    ld l, a
    ret


trap_68_6f8f::
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

TrapDrawString::
.next
    ldh a, [hDrawMode]
    ld e, a
    ld a, [hl+]
    or a
    ret z

    bit DrawMode_Bit6, e
    jr nz, .jr_001_6fb3

    cp $20
    jr c, .ctrlChar

    ld e, a
    ld d, [hl]
    trap $a7
    jr nc, .jr_001_6fb3

    inc hl
    or a
    jr z, .jr_001_6fba

.jr_001_6fb3
    trap DrawChar
    jr .next

.jr_001_6fb7
    xor a
    jr .jr_001_6fb3

.jr_001_6fba
    ldh a, [hDrawMode]
    bit DrawMode_Bit3, a
    jr z, .jr_001_6fb7

    push bc
    push hl
    ld c, a
    ld a, d
    ld d, e
    ld e, a
    ld b, $01
    ld hl, $c3e0
    trap $1b
    ld hl, $c3e0
    trap $be
    pop hl
    pop bc
    ld a, $01

.ctrlChar
    trap DrawCtrlChar
    jr .next

TrapDrawStringList::
    ld a, [hl]
    or a
    ret z

    push hl
    ld l, e
    ld h, d
    trap DrawAt
    pop hl
    push de
    call TrapDrawString
    pop de
    inc e
    jr TrapDrawStringList

TrapFileSearch::
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
    call trap_6c_714d
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
    ld a, [KissCartridgeCode]
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
    call trap_67_6f7a
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
    trap MemCopy
    ld hl, $c400
    xor a
    ld [hl+], a
    ld [hl-], a

jr_001_706b:
    call trap_6c_714d
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
    ld a, [KissCartridgeCode]
    cp b
    jr nz, jr_001_706b

jr_001_7092:
    ld a, [$c402]
    cp $ff
    jr z, jr_001_70aa

    ld hl, $c400
    call Call_001_7118
    trap AddrGBToCRAM
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
    trap MemCopy
    scf
    ret


trap_6d_70ba::
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

    ld a, [KissCartridgeCode]
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

    trap AddrGBToCRAM
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
    trap MemSet
    ret


Call_001_710d:
    ld hl, $c400
    ld d, b
    ld e, c
    ld bc, $00ff
    trap MemCopy
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


trap_6f_7138::
    ldh a, [hROMBank]
    ld e, a
    ldh a, [hRAMBank]
    ld d, a
    push de
    push hl
    ld hl, sp+$00
    ld de, $ff3c
    ld bc, $0004
    trap $e5
    pop hl
    pop de
    ret


trap_6c_714d::
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
    trap FileNext
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

KissMail:
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


trap_6e_71e6::
    trap $e1
    ret c

    push hl
    ld de, $ff45
    ld bc, $0001
    ld hl, sp+$00
    trap FileRead
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
    trap FileRead
    pop de
    pop bc
    ld a, d
    or e
    jr z, jr_001_7225

    ld a, c
    ldh [hROMBank], a
    ld [rROMBank], a
    ld a, b
    ldh [hRAMBank], a
    ld [rRAMBank], a
    push de
    ret


trap_61_7222::
    call Call_001_7227

jr_001_7225:
    trap $01

Call_001_7227:
    trap AudioStop
    trap $53
    ld a, $a4
    ld bc, $0102
    ld de, $0f10
    ld h, $00
    trap DrawInit
    ld de, gfxGBKissLogo
    ld bc, $c400
    trap ExtractInit
    ld de, $c600
    ld bc, $08f0
    trap ExtractData
    ld de, $020c
    ld hl, $c600
    ld bc, $0b68
    trap $c0
    ld a, $01
    trap LCDEnable
    ld a, $f0
    trap AwaitButton
    bit 2, a
    jp nz, Jump_001_66ee

    ret


trap_50_7260::
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
    trap MemCopy
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
    trap ExtractInit
    pop bc
    pop hl

jr_001_72ba:
    push hl
    push bc
    ld d, h
    ld e, l
    ld bc, $0010
    push bc
    trap ExtractData
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

gfxGBKissLogo::
    INCBIN "frag/system/logo.hz"

TrapJumpViaTable::
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


trap_07_76f1::
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

trap_08_7712::
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

trap_52_7730::
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

TrapDrawLayout::
    ld a, [hl+]
    bit 7, a
    ret nz

    push hl
    ld l, [hl]
    ld h, a
    trap DrawAt
    pop hl
    inc hl
    trap DrawString
    jr TrapDrawLayout

TrapInputCursorMenu::
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

trap_5e_77ae::
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
    trap AwaitFrame
    trap InputButtons
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
    trap DrawAt
    ld a, c
    trap DrawChar
    ret


trap_53_784d::
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


trap_54_7863::
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
    trap DrawBox
    pop de
    push de
    ld a, d
    inc e
    ld d, $02
    ld hl, $010c
    ld bc, $0c03
    trap $59
    pop de
    push de
    inc e
    inc e
    ld bc, $0001
    ld d, $00
    ld a, $7f
    trap $cd
    trap $cd
    trap $cd
    pop de
    push de
    ld bc, $0001
    ld d, $0e
    ld a, $7e
    trap $cd
    ld a, $75
    trap $cd
    trap $cd
    trap $cd
    ld a, $7d
    trap $cd
    pop de
    push de
    inc e
    inc e
    ld a, d
    add $24
    ld d, $0f
    ld hl, HeaderLogo
    ld bc, $0401
    trap $59
    pop de
    push de
    ld a, d
    add $28
    ld d, $00
    ld hl, $0102
    ld bc, $0202
    trap $59
    xor a
    call Call_001_7f24
    pop de
    call Call_001_7b0e
    ld de, data_01_7ff0
    ld hl, $87f0
    ld bc, $0010
    trap MemCopy
    ret


trap_56_78f0::
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
    call trap_4e_7f04
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
    trap $55
    ld hl, sp+$3d
    ld a, [hl]
    ld hl, sp+$00
    call trap_4d_7e77
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
    call trap_4f_7e90
    add sp, $3c
    pop bc
    pop de
    pop hl
    ret


trap_55_793f::
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
    call TrapTileLoadText
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
    trap AwaitFrame
    trap InputButtons
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
    call trap_4b_7dcc
    jr jr_001_7abf

jr_001_7ab1:
    ld e, $20
    call trap_4b_7dcc
    push hl
    ld hl, $c3ee
    ld a, $ff
    ld [hl+], a
    ld [hl], a
    pop hl

jr_001_7abf:
    trap MemCopy

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
    ld hl, KeyboardNames
    add hl, bc
    ld c, $04
    ld e, $01
    call TrapTileLoadText
    ret


KeyboardNames:
    dp "ひらがな"
    dp "カタカナ"
    dp "１２３４"
    dp "ＡＢＣＤ"
    dp "メモ　　"

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
    ld hl, kbdTable
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


kbdTable::
    dw kbdHiragana
    dw kbdKatakana
    dw kbdNumeric
    dw kbdAlpha
    dw kbdMemo

kbdMemo::
    dp $05

kbdNumeric::
    dp $05
    dp "01234 56789 "
    dp " ()<> ｢｣[]@ "
    dp "!?\"'# +-*/% "
    dp ",.¥$= :;^&| "
    dp "¯\\_ A BCDEF "

kbdAlpha::
    dp $06
    dp "ABCDE FGHIJ "
    dp "KLMNO PQRST "
    dp "UVWXY Z .!? "
    dp "abcde fghij "
    dp "klmno pqrst "
    dp "uvwxy z-'() "

kbdHiragana::
    dp $09
    dp "あいうえお　かきくけこ　"
    dp "さしすせそ　たちつてと　"
    dp "なにぬねの　はひふへほ　"
    dp "まみむめも　や　ゆ　よ　"
    dp "らりるれろ　わ　を　ん　"
    dp "がぎぐげご　ざじずぜぞ　"
    dp "だぢづでど　ばびぶべぼ　"
    dp "ぱぴぷぺぽ　ぁぃぅぇぉ　"
    dp "ゃゅょっ　　ー、。！？　"

kbdKatakana::
    dp $09
    dp "アイウエオ　カキクケコ　"
    dp "サシスセソ　タチツテト　"
    dp "ナニヌネノ　ハヒフヘホ　"
    dp "マミムメモ　ヤ　ユ　ヨ　"
    dp "ラリルレロ　ワ　ヲ　ン　"
    dp "ガギグゲゴ　ザジズゼゾ　"
    dp "ダヂヅデド　バビブベボ　"
    dp "パピプペポ　ァィゥェォ　"
    dp "ャュョッ　　ー、。！？　"

trap_5a_7d47::
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
    call trap_57_7df1
    ld c, l
    ld b, h
    pop hl
    pop de
    call trap_5b_7d60
    jr jr_001_7d48

jr_001_7d5e:
    pop bc
    ret


trap_5b_7d60::
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

    trap DrawCtrlChar
    jr jr_001_7d6d

jr_001_7d79:
    push de
    ld e, a
    ld d, [hl]
    trap $a7
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
    trap MemCopy
    pop de
    add sp, $20
    pop bc
    pop hl
    ret


TrapTileLoadText::
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
    call trap_4b_7dcc
    trap MemCopy
    pop bc
    pop de
    pop hl
    ret


trap_4b_7dcc::
    ld b, d
    ld hl, $c3e0
    push hl
    ldh a, [$b4]
    ld c, a
    trap $ba
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


trap_57_7df1::
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


TrapDrawBox::
    call trap_57_7df1
    ld a, $79
    ld de, $7778
    call DrawRow
    dec c
    dec c

.nextRow
    ld a, $7f
    ld de, $7576
    call DrawRow
    dec c
    jr nz, .nextRow

    ld a, $7c
    ld de, $7a7b

    ; fall through

DrawRow:
    add sp, -$20
    push hl
    push bc
    ld hl, sp+$04
    dec b
    dec b
    push hl
    ld [hl], d
    inc hl

.nextCol
    ld [hl+], a
    dec b
    jr nz, .nextCol

    ld [hl], e
    pop de
    pop bc
    pop hl
    push hl
    push bc
    ld c, b
    ld b, $00
    trap MemCopy
    pop bc
    pop de
    ld hl, $0020
    add hl, de
    add sp, $20
    ret


trap_59_7e43::
    push af
    push hl
    add sp, -$20
    call trap_57_7df1

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
    trap MemCopy
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


trap_4d_7e77::
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


trap_4f_7e90::
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

trap_4e_7f04::
    push bc
    ld c, $00

jr_001_7f07:
    ld a, [hl+]
    or a
    jr z, jr_001_7f21

    cp $20
    jr nc, jr_001_7f13

    trap DrawCtrlChar
    jr jr_001_7f07

jr_001_7f13:
    push de
    ld e, a
    ld d, [hl]
    trap $a7
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

TrapTileLoad::
    ld a, e
    push af
    push hl
    push bc
    ld e, d
    call trap_4b_7dcc
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
    trap MemCopy
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
    trap MemCopy
    pop hl
    ld de, $0010
    add hl, de
    pop de
    pop bc
    dec c
    jr nz, jr_001_7f4b

    ret


data_01_7f70::
    INCBIN "gfx/system/page.2bpp"

data_01_7fb0::
    INCBIN "gfx/system/pencil.2bpp"

data_01_7ff0::
    INCBIN "gfx/system/reticle.2bpp"
