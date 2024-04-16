; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $000", ROM0[$0]

RST_00::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

RST_08::
    jp Jump_000_0068


Config0::
    db BANK(j01_4100)

Config1::
    db BANK(jt01)

Config2::
    db $4a

Config3::
    db BANK(jt01)

Config4::
    db BANK(jt02)

RST_10::
    jp code_00_00c9

    db $00, $fe, $03, $00, $bf

RST_18::
    db $00, $00, $00, $00, $00, $00, $00, $00

RST_20::
    ldh [hROMBank], a
    ld [rROMBank], a
    ret


    nop
    nop

RST_28::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

RST_30::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

RST_38::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

VBlankInterrupt::
    jp $c006


    nop
    nop
    nop
    nop
    nop

LCDCInterrupt::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

TimerOverflowInterrupt::
    jp $c000


Call_000_0053:
Jump_000_0053:
    jp Jump_000_021c


    nop
    nop

SerialTransferCompleteInterrupt::
    jp $c003


    nop
    nop
    nop
    nop
    nop

JoypadTransitionInterrupt::
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld a, [Config2]
    cp e
    jr c, jr_000_0093

    ld d, $00
    ld hl, jt00
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
    ldh a, [hROMBank]
    ld [hl-], a
    ld [hl], HIGH(code_00_00bd)
    dec hl
    ld [hl], LOW(code_00_00bd)
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
    ld [hl], e
    inc hl
    ld [hl], d

jt00_00b9::
    pop hl
    pop de
    pop af
    ret


code_00_00bd::
    push af
    push hl
    ld hl, sp+$04
    ld a, [hl]
    call Call_000_00f7
    pop hl
    pop af
    inc sp
    ret


code_00_00c9::
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
    ld [hl], e
    pop de
    inc de
    dec hl
    ld [hl], d
    dec hl
    ld [hl], e
    pop hl
    pop de
    pop af
    ret


jt00_00e9::
    xor a
    ldh [hRAMBank], a
    inc a
    ld [rIgnored], a
    xor a
    ld [rIRMode], a
    ld a, [Config1]

Call_000_00f7:
    ldh [hROMBank], a
    ld [rROMBank], a
    ret


    nop
    nop
    nop

Boot::
    di
    jp Jump_000_02e5


HeaderLogo::
    db $ce, $ed, $66, $66, $cc, $0d, $00, $0b, $03, $73, $00, $83, $00, $0c, $00, $0d
    db $00, $08, $11, $1f, $88, $89, $00, $0e, $dc, $cc, $6e, $e6, $dd, $dd, $d9, $99
    db $bb, $bb, $67, $63, $6e, $0e, $ec, $cc, $dd, $dc, $99, $9f, $bb, $b9, $33, $3e

HeaderTitle::
    db "GBKISS MINIGAME", $00

HeaderNewLicenseeCode::
    db $31, $38

HeaderSGBFlag::
    db $00

HeaderCartridgeType::
    db $ff

HeaderROMSize::
    db $03

HeaderRAMSize::
    db $03

HeaderDestinationCode::
    db $00

HeaderOldLicenseeCode::
    db $33

HeaderMaskROMVersion::
    db $00

HeaderComplementCheck::
    db $1c

HeaderGlobalChecksum::
    db $75, $09

jt00_0150::
    ld a, [Config0]
    ldh [hROMBank], a
    ld [rROMBank], a
    jp j01_4100


jt00_015b::
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

    vcall $fe
    db $c9

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
    vcall $fd
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
    vcall $ff

jr_000_01a8:
    ld a, [de]
    inc de
    ld [hl], a
    inc l
    dec c
    jr nz, jr_000_01a8

    di
    ld a, l
    ldh [$87], a
    ldh a, [$89]
    add b
    ldh [$89], a
    ei

jt00_01b9::
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

jt00::
    dw jt00_00e9
    dw jt00_0150
    dw jt00_015b
    dw $6f05
    dw $6f35
    dw $6f3e
    dw $76d8
    dw $76f1
    dw $7712
    dw jt00_02fd
    dw jt00_01b9
    dw jt00_01b9
    dw jt00_01b9
    dw jt00_01b9
    dw jt00_00b9
    dw 0
    dw jt00_02ed
    dw jt00_022c
    dw jt00_0230
    dw jt00_0234
    dw jt00_0239
    dw jt00_023d
    dw jt00_0241
    dw jt00_0245
    dw jt00_0249
    dw jt00_024d
    dw jt00_0218
    dw jt00_0268

jt00_0218::
    ld de, $0038
    ret

Jump_000_021c:
    push af
    push bc
    push de
    push hl
    ldh a, [$99]
    bit 2, a
    call nz, jt00_0230
    pop hl
    pop de
    pop bc
    pop af
    reti

jt00_022c::
    ld l, $00
    jr jr_000_024f

jt00_0230::
    ld l, $03
    jr jr_000_024f

jt00_0234::
    xor a
    ld l, $06
    jr jr_000_024f

jt00_0239::
    ld l, $09
    jr jr_000_024f

jt00_023d::
    ld l, $0c
    jr jr_000_024f

jt00_0241::
    ld l, $0f
    jr jr_000_024f

jt00_0245::
    ld l, $12
    jr jr_000_024f

jt00_0249::
    ld l, $15
    jr jr_000_024f

jt00_024d::
    ld l, $18

jr_000_024f:
    ld h, $40
    push af
    call Call_000_025a
    pop hl
    push af
    ld a, h
    jr jr_000_0263

Call_000_025a:
    push hl
    push af
    ldh a, [hROMBank]
    ld hl, sp+$07
    ld [hl], a
    ld a, BANK(j04_4000)

jr_000_0263:
    call RST_20
    pop af
    ret

jt00_0268::
    ld a, d
    cp $80
    jr c, jr_000_0290

    cp $a0
    jp c, Jump_000_0407

    cp $c0
    jr c, jr_000_0283

    cp $e0
    jp nc, Jump_000_0407

    sub $c0
    vcall $50
    jp c, Jump_000_0407

    ret


jr_000_0283:
    sub $a0

    db $cf

    cp h
    jp c, Jump_000_0407

    ret


jr_000_028b:
    pop de
    pop bc
    pop hl
    scf
    ret


jr_000_0290:
    push hl
    push bc
    push de
    call Call_000_0306
    jr c, jr_000_028b

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
    jr c, jr_000_028b

    or c
    jr z, jr_000_028b

    pop hl
    ldh a, [hROMBank]
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
    jr c, jr_000_02c2

    ld a, c

jr_000_02c2:
    inc a
    ld c, a
    ld b, $00
    jr nz, jr_000_02c9

    inc b

jr_000_02c9:
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
    vcall $02
    pop bc
    pop hl
    add hl, bc
    pop af
    or a
    jp RST_20


Jump_000_02e5:
    di

Jump_000_02e6:
    ld sp, $e000
    vcall $00
    vcall $6e

jt00_02ed::
    ld hl, jt00_02ed
    vcall $6f
    jp Jump_000_0300


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jt00_02fd::
    jp Jump_000_0309


Jump_000_0300:
    jp Jump_000_03f8


Jump_000_0303:
    jp Jump_000_0402


Call_000_0306:
    jp Jump_000_0405


Jump_000_0309:
    ld hl, $ff83
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    vcall $8d
    vcall $8e
    ld d, h
    ld e, l
    ldh a, [hROMBank]
    push af
    ld a, $06
    ldh [hROMBank], a
    ld [rROMBank], a
    ld hl, rRAMBank
    ld l, [hl]
    ld h, d
    push hl
    vcall $8a
    pop hl
    ld a, [$c3b0]
    ld h, a
    push hl
    call Call_000_033e
    pop hl
    ld a, h
    inc a
    cp l
    jr c, jr_000_0337

    xor a

jr_000_0337:
    pop af
    ldh [hROMBank], a
    ld [rROMBank], a
    ret


Call_000_033e:
    add a
    ld e, a
    ld d, $00
    ld hl, $4001
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call Call_000_037f
    pop hl
    ret c

    ld b, $00
    add hl, bc
    ld c, e
    ld b, d
    ld e, l
    ld d, h

jr_000_0356:
    push bc
    ld a, b
    or a
    jr z, jr_000_035e

    ld bc, $0100

jr_000_035e:
    push de
    push bc
    ld hl, $c400
    vcall $02
    pop bc
    push bc
    ld de, $c400
    ld hl, $c500
    vcall $ec
    pop bc
    pop hl
    add hl, bc
    ld d, h
    ld e, l
    pop hl
    ld a, l
    sub c
    ld c, a
    ld a, h
    sbc b
    ld b, a
    or c
    jr nz, jr_000_0356

    ret


Call_000_037f:
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push de
    ld b, [hl]
    inc hl
    ld a, [hl+]
    ld c, [hl]
    inc hl
    push bc
    push af
    ld e, l
    ld d, h
    push bc
    ld hl, $c400
    ld b, $00
    push hl
    vcall $02
    pop de
    pop bc
    ld hl, $c500
    push bc
    push de
    vcall $6b
    pop de
    pop bc
    jr c, jr_000_03ae

    push bc
    push de
    vcall $ef
    pop de
    pop bc
    ld hl, $c500
    vcall $6b

jr_000_03ae:
    pop hl
    pop bc
    pop de
    ccf
    ret c

    ld a, $2e
    bit 0, b
    jr nz, jr_000_03ba

    xor a

jr_000_03ba:
    add $05
    add c
    ld c, a
    push bc
    push bc
    ld a, $00
    adc a
    ld b, a
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld d, a
    pop bc
    ld c, $00
    ld a, h
    ld hl, $c50a
    ld [hl], a
    ld hl, $c500
    push de
    vcall $e9
    pop de
    pop bc
    ret c

    bit 0, b
    ret z

    push bc
    push de
    ld b, $00
    ld de, $ffd2
    ld hl, $c500
    vcall $ea
    pop de
    ld hl, $002e
    add hl, de
    ld e, l
    ld d, h
    pop bc
    ld a, c
    sub $2e
    ld c, a
    xor a
    ret


Jump_000_03f8:
    di
    ld sp, $e000
    vcall $00
    vcall $11
    vcall $61

Jump_000_0402:
    jp Jump_000_0500


Jump_000_0405:
    scf
    ret


Jump_000_0407:
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_000_0500:
    ld sp, $e000
    di
    vcall $00
    ld de, $0000
    ld hl, $c654
    ld bc, $0002
    vcall $e4
    ld a, [$c654]
    cp $02
    jr c, jr_000_0525

    cp $08
    jr nc, jr_000_0525

    ld a, [$c655]
    and $03
    cp $03
    jr z, jr_000_053a

jr_000_0525:
    ld a, $02
    ld [$c654], a
    ld a, $03
    ld [$c655], a
    ld de, $0000
    ld hl, $c654
    ld bc, $0002
    vcall $e5

jr_000_053a:
    ld a, $20
    vcall $b3
    ld hl, $0400
    vcall $ca

Jump_000_0543:
    call Call_000_07e6
    ld de, $0204
    vcall $57
    ld c, $80
    ld de, strPasswordMenu
    ld a, [$c654]
    ld b, a
    ld a, [$c655]

jr_000_0557:
    push bc
    push hl
    push af
    ld a, c
    ld c, l
    ld b, h
    ld l, e
    ld h, d
    ld d, a
    ld e, $07
    pop af
    rrca
    push af
    call Call_000_05b4
    pop af
    ld e, l
    ld d, h
    pop hl
    ld bc, $0020
    add hl, bc
    pop bc
    inc c
    dec b
    jr nz, jr_000_0557

    ld hl, strPasswordMenuMessage
    call Call_000_087f
    ld a, $01
    vcall $b4
    ld c, $00

jr_000_0581:
    ld a, [$c654]
    ld b, a
    ld hl, HeaderLogo
    ld d, $20
    ld e, $3e
    vcall $5e
    jr c, jr_000_05b2

    ld c, a
    inc a
    call Call_000_076e
    ld h, a
    ld a, [$c655]
    and h
    jr z, jr_000_0581

    ld l, c
    ld h, $00
    vcall $06
    ld [$0117], sp
    nop
    ld [bc], a
    add hl, bc
    ld [bc], a
    ld [de], a
    ld [bc], a
    dec de
    ld [bc], a
    inc h
    ld [bc], a
    dec l
    ld [bc], a
    ld [bc], a
    nop

jr_000_05b2:
    vcall $01

Call_000_05b4:
    jr nc, jr_000_05b9

    vcall $5b
    ret


jr_000_05b9:
    ld a, [hl+]
    or a
    jr nz, jr_000_05b9

    ld a, $0d
    vcall $b9
    ld a, $01
    vcall $b9
    ret


strPasswordMenu::
    db " PASSWORD INPUT»", $0d, "\r\n"
    db " ｷｬﾗﾊﾞﾝﾊﾞｰｼﾞｮﾝ 5ｹﾞｰﾑ", $0d, "\r\n"
    db " ｷｽﾓﾝ&ﾊﾞｹ«ﾁｭ»ﾘﾚｰ«ﾎｶ4»", $0d, "\r\n"
    db " 15ﾊﾟｽﾞﾙ&ｷｬﾉﾝ« ﾎｶ4ｺ»", $0d, "\r\n"
    db " ﾊﾞｲﾅﾘｰﾗﾝﾄﾞ«&BJﾎｶ2ｺ»", $0d, "\r\n"
    db " ﾐﾆｹﾞｰﾑ«ｶﾞｿﾞｳｲﾚｶｴ»ﾃﾞｰﾀ", $0d, "\r\n"
    db " GB KISS TOOLS", $0d, "\r\n"

strPasswords::
    db "KISSMON "
    db "CANNON  "
    db "BINARY  "
    db "GAMEDATA"
    db "KISSTOOL"

strPasswordMenuMessage::
    db "  ﾒﾆｭｰ«ｦ ｾﾝﾀｸｼﾃ»\n"
    db " \n"
    db "«START/Aｦ ｵｼﾃｸﾀﾞｻｲ»\n"
    db "\n"

strPasswordDashes::
    db "--------\n"

code_00_06b9::
    call Call_000_07e6
    ld a, $20
    ld de, $0204
    ld bc, $1004
    ld hl, $0000
    vcall $59
    ld a, $f0
    ld de, $0208
    ld bc, $1003
    ld hl, $0301
    vcall $59
    ld hl, $0204
    vcall $b8
    ld hl, strPasswordMenu
    vcall $69
    ld hl, $0607
    vcall $b8
    ld hl, strPasswordDashes
    vcall $69
    ld hl, strEnterPassword
    ld bc, $9902
    call Call_000_0882
    ld a, $03
    ldh [$ae], a
    ld de, $900d
    ld hl, $0000
    vcall $54
    ld a, $80
    ld de, $0606
    ld bc, $0801
    ld hl, $0100
    vcall $59
    ld a, $03
    vcall $b4
    ld hl, $c656
    ld e, $20
    ld bc, $0008
    vcall $a6
    ld de, $8001
    ld b, $08
    ld hl, $c656
    ld c, $00
    vcall $55
    jp c, Jump_000_0543

    ld hl, strPasswords
    ld bc, $0502

jr_000_072f:
    push bc
    push hl
    ld de, $c656
    ld bc, $0008
    push bc
    vcall $67
    pop bc
    ld a, h
    or l
    pop hl
    add hl, bc
    pop bc
    inc c
    or a
    jr z, jr_000_074a

    dec b
    jr nz, jr_000_072f

    jp Jump_000_0543


jr_000_074a:
    ld a, [$c654]
    cp c
    ld a, c
    jp nc, Jump_000_0755

    ld [$c654], a

Jump_000_0755:
    call Call_000_076e
    ld d, a
    ld a, [$c655]
    or d
    ld [$c655], a
    ld de, $0000
    ld hl, $c654
    ld bc, $0002
    vcall $e5
    jp Jump_000_0543


Call_000_076e:
    push bc
    ld c, a
    ld a, $80

jr_000_0772:
    rlca
    dec c
    jr nz, jr_000_0772

    pop bc
    ret


strEnterPassword::
    db " \n"
    db "ﾊﾟｽﾜｰﾄﾞ«ｦ ﾆｭｳﾘｮｸｼﾃ »\n"
    db "«STARTｦ ｵｼﾃｸﾀﾞｻｲ  »\n"
    db "\n"

code_00_07a4::
    ld de, $4000
    ld a, $07
    call Call_000_089a
    jp Jump_000_0543


code_00_07af::
    ld de, $4000
    ld a, $09
    call Call_000_089a
    jp Jump_000_0543


code_00_07ba::
    ld de, $4000
    ld a, $0b
    call Call_000_089a
    jp Jump_000_0543


code_00_07c5::
    ld de, $4000
    ld a, $0d
    call Call_000_089a
    jp Jump_000_0543


code_00_07d0::
    ld de, $4000
    ld a, $0e
    call Call_000_089a
    jp Jump_000_0543


code_00_07db::
    ld de, $4000
    ld a, $0f
    call Call_000_089a
    jp Jump_000_0543


Call_000_07e6:
    vcall $b5
    ld a, $0c
    vcall $b9
    ld hl, $8800
    ld e, $00
    ld bc, $0a00
    vcall $a6
    ld de, $0003
    ld bc, $1409
    vcall $58
    ld a, $80
    ld de, $0204
    ld bc, $1007
    ld hl, $0701
    vcall $59
    ld de, $000d
    ld bc, $1405
    vcall $58
    ld a, $f0
    ld de, $020e
    ld bc, $1003
    ld hl, $0301
    vcall $59
    ld hl, $0101
    vcall $b8
    ld hl, strPasswordMenuTitle
    vcall $69
    ret


strPasswordMenuTitle::
    db "GB KISS  MINI GAME\n"

strLoadMenuMessage::
    db "«ｼﾃｲﾉ»ﾃﾞｰﾀ«ｦ ﾃﾝｿｳｼﾏｽ»\n"
    db "«  AﾃﾞGBKISSﾃﾝｿｳ  »\n"
    db "«STARTﾃﾞ ｼﾞﾌﾞﾝﾉSRAMﾍ»\n"
    db "\n"

Call_000_087f:
    ld bc, $99c2

Call_000_0882:
    ld d, $f0
    ld e, $03

jr_000_0886:
    ld a, [hl]
    or a
    ret z

    push de
    push bc
    vcall $5b
    pop bc
    ld a, $20
    add c
    ld c, a
    ld a, $00
    adc b
    ld b, a
    pop de
    inc d
    jr jr_000_0886

Call_000_089a:
    ld hl, $c600
    ld [hl+], a
    ld [hl], e
    inc hl
    ld [hl], d

Jump_000_08a1:
    call Call_000_07e6
    ld hl, strLoadMenuMessage
    call Call_000_087f
    ldh a, [hROMBank]
    push af
    ld hl, $c600
    ld a, [hl+]
    ld e, [hl]
    inc hl
    ld d, [hl]
    ldh [hROMBank], a
    ld [$2000], a
    ld hl, $c604
    ld bc, $0028
    vcall $02
    pop af
    ldh [hROMBank], a
    ld [$2000], a
    ld de, $0304
    vcall $57
    ld b, $07
    ld c, $87
    ld de, $c604

Jump_000_08d3:
    push bc
    push hl
    ld l, e
    ld h, d
    ld a, [hl+]
    ld b, [hl]
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push hl
    or a
    jr z, jr_000_091e

    ldh a, [hROMBank]
    push af
    ld a, b
    ldh [hROMBank], a
    ld [$2000], a
    ld a, d
    cp $80
    jr c, jr_000_08f3

    sub $40
    ld d, a

jr_000_08f3:
    push bc
    ld hl, $c634
    ld bc, $0020
    vcall $02
    pop bc
    pop af
    ldh [hROMBank], a
    ld [$2000], a
    ld d, c
    ld e, $07
    pop hl
    pop bc
    push bc
    push hl
    ld hl, $c638
    vcall $5b
    pop de
    pop hl
    ld bc, $0020
    add hl, bc
    pop bc
    inc c
    dec b
    jp nz, Jump_000_08d3

    push bc
    push hl
    push de

jr_000_091e:
    ld a, $01
    vcall $b4
    pop de
    pop hl
    pop bc
    ld a, $07
    sub b
    ld b, a
    ld c, $00

jr_000_092b:
    ld hl, HeaderLogo
    ld d, $20
    ld e, $3e
    push bc
    vcall $5e
    pop bc
    jr c, jr_000_0943

    ld c, a
    push bc
    call $094a
    pop bc
    jr nc, jr_000_092b

    jp Jump_000_08a1


jr_000_0943:
    ldh a, [$8a]
    and $04
    ret z

    vcall $01
    ld hl, $c604
    add a
    add a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl+]
    or a
    scf
    ret z

    ldh a, [$8a]
    ld [$c660], a
    ldh a, [hROMBank]
    ld [$c65f], a
    push af
    ld a, [hl+]
    ldh [hROMBank], a
    ld [$2000], a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, h
    cp $80
    jr c, jr_000_0973

    sub $40
    ld h, a

jr_000_0973:
    ld a, [hl+]
    ld b, [hl]
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    cp $44
    jr z, jr_000_09e6

    pop af
    ldh [hROMBank], a
    ld [$2000], a
    push bc
    push de
    ld a, $04
    add c
    ld l, a
    ld h, $01
    vcall $b8
    ld a, $2a
    vcall $bb
    ld a, [$c660]
    and $01
    call nz, Call_000_0c95
    pop de
    pop bc
    ret c

    ldh a, [hROMBank]
    push af
    ld a, b
    ld [$c65e], a
    ldh [hROMBank], a
    ld [$2000], a
    ld l, e
    ld h, d
    push bc
    call Call_000_0a06
    pop bc
    jr c, jr_000_09b6

    ld de, strLoadSuccess
    jr jr_000_09c2

jr_000_09b6:
    ld de, strLoadFailure
    ld a, [$c664]
    or a
    jr z, jr_000_09c2

    ld de, strLoadOverwrite

jr_000_09c2:
    pop af
    ldh [hROMBank], a
    ld [$2000], a
    ld a, $04
    add c
    push de
    push bc
    ld e, a
    ld d, $02
    vcall $57
    ld c, l
    ld b, h
    pop de
    ld a, $80
    add e
    ld d, a
    ld e, $07
    pop hl
    vcall $5b
    ld hl, strLoadMenuMessage
    call Call_000_087f
    xor a
    ret


jr_000_09e6:
    pop af
    ldh [hROMBank], a
    ld [$2000], a
    ld c, b
    ld hl, $c600
    ld b, [hl]
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push bc
    push hl
    ld a, c
    call Call_000_089a
    pop de
    pop af
    ld hl, $c600
    ld [hl+], a
    ld [hl], e
    inc hl
    ld [hl], d
    scf
    ret


Call_000_0a06:
    xor a
    ld [$c664], a
    ld a, [$c660]
    bit 0, a
    jp nz, Jump_000_0ad5

    bit 7, h
    jr nz, jr_000_0a4b

    push hl
    call Call_000_0a5c
    pop hl
    ret c

    ld b, $00
    add hl, bc
    ld c, e
    ld b, d

jr_000_0a21:
    push bc
    ld a, b
    cp $08
    jr c, jr_000_0a2a

    ld bc, $0800

jr_000_0a2a:
    ld e, l
    ld d, h
    push de
    push bc
    ld hl, $c900
    vcall $02
    pop bc
    push bc
    ld de, $c900
    ld hl, $c500
    vcall $ec
    pop de
    pop hl
    add hl, de
    pop bc
    ld a, c
    sub e
    ld c, a
    ld a, b
    sbc d
    ld b, a
    or c
    jr nz, jr_000_0a21

    ret


jr_000_0a4b:
    ld de, $c000
    add hl, de
    push hl
    call Call_000_0a5c
    pop hl
    ret c

    ld b, $00
    add hl, bc
    ld c, e
    ld b, d
    jr jr_000_0a21

Call_000_0a5c:
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push de
    ld b, [hl]
    inc hl
    ld a, [hl+]
    ld c, [hl]
    inc hl
    push bc
    push af
    ld e, l
    ld d, h
    push bc
    ld hl, $c400
    ld b, $00
    push hl
    vcall $02
    pop de
    pop bc
    ld hl, $c500
    push bc
    push de
    vcall $6b
    pop de
    pop bc
    jr nc, jr_000_0ac9

    pop hl
    pop bc
    pop de
    ld a, $2e
    bit 0, b
    jr nz, jr_000_0a8a

    xor a

jr_000_0a8a:
    add $05
    add c
    ld c, a
    push bc
    push bc
    ld a, $00
    adc a
    ld b, a
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld d, a
    pop bc
    ld c, $00
    ld a, h
    ld hl, $c50a
    ld [hl], a
    ld hl, $c500
    push de
    vcall $e9
    pop de
    pop bc
    jr c, jr_000_0ad1

    bit 0, b
    ret z

    push bc
    push de
    ld b, $00
    ld de, $ffd2
    ld hl, $c500
    vcall $ea
    pop de
    ld hl, $002e
    add hl, de
    ld e, l
    ld d, h
    pop bc
    ld a, c
    sub $2e
    ld c, a
    xor a
    ret


jr_000_0ac9:
    ld a, $01
    ld [$c664], a
    pop hl
    pop bc
    pop de

jr_000_0ad1:
    or $01
    scf
    ret


Jump_000_0ad5:
    bit 7, h
    jr nz, jr_000_0b21

    push hl
    call Call_000_0b32
    pop hl
    ret c

    ld b, $00
    add hl, bc
    ld c, e
    ld b, d

jr_000_0ae4:
    push bc
    ld a, b
    or a
    jr z, jr_000_0aec

    ld bc, $0100

jr_000_0aec:
    ld e, l
    ld d, h
    push de
    push bc
    ld hl, $c900
    vcall $02
    pop bc
    push bc
    ld de, $c900
    call Call_000_0d25
    pop de
    pop hl
    push af
    add hl, de
    pop af
    pop bc
    jr c, jr_000_0b1f

    ld a, c
    sub e
    ld c, a
    ld a, b
    sbc d
    ld b, a
    or c
    jr nz, jr_000_0ae4

    call Call_000_0bf2
    jr c, jr_000_0b1f

    ld a, $02
    call Call_000_0d05
    jr c, jr_000_0b1f

    call Call_000_0d16
    xor a
    ret


jr_000_0b1f:
    scf
    ret


jr_000_0b21:
    ld de, $c000
    add hl, de
    push hl
    call Call_000_0b32
    pop hl
    ret c

    ld b, $00
    add hl, bc
    ld c, e
    ld b, d
    jr jr_000_0ae4

Call_000_0b32:
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push de
    ld b, [hl]
    inc hl
    ld a, [hl+]
    ld c, [hl]
    inc hl
    push bc
    ld [$c661], a
    ld e, l
    ld d, h
    push bc
    ld hl, $c400
    ld b, $00
    push hl
    vcall $02
    pop de
    pop bc
    ld hl, $c700
    push bc
    push de
    call Call_000_0d37
    pop de
    pop bc
    jp nc, Jump_000_0bdb

    pop bc
    pop de
    cp $ff
    jp z, Jump_000_0bee

    ld a, $2e
    bit 0, b
    jr nz, jr_000_0b68

    xor a

jr_000_0b68:
    add $05
    add c
    ld c, a
    push bc
    push bc
    ld a, $00
    adc a
    ld b, a
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld d, a
    pop bc
    ld a, [$c662]
    ld c, a
    ld a, $ff
    ld hl, $c70a
    ld [hl], a
    push de
    push bc
    ld a, $05
    call Call_000_0d05
    pop bc
    pop de
    push de
    ld hl, $c700
    call Call_000_0d31
    pop de
    pop bc
    jr nc, jr_000_0b9f

    cp $ff
    jr z, jr_000_0bee

    ld a, $04
    jr jr_000_0be8

jr_000_0b9f:
    push bc
    push de
    push hl
    ld hl, sp+$00
    ld d, h
    ld e, l
    ld hl, $ce00
    ld c, $02
    call Call_000_0cff
    pop hl
    pop de
    pop bc
    ld a, [$c663]
    cp h
    jr nz, jr_000_0be6

    ld a, $05
    cp l
    jr nz, jr_000_0be6

    xor a
    bit 0, b
    ret z

    push bc
    push de
    ld b, $00
    ld de, $ffd2
    ld hl, $c700
    call Call_000_0d2b
    pop de
    ld hl, $002e
    add hl, de
    ld e, l
    ld d, h
    pop bc
    ld a, c
    sub $2e
    ld c, a
    xor a
    ret


Jump_000_0bdb:
    ld a, $01
    ld [$c664], a
    pop bc
    pop de
    ld a, $07
    jr jr_000_0be8

jr_000_0be6:
    ld a, $05

jr_000_0be8:
    call Call_000_0d05
    call Call_000_0d16

Jump_000_0bee:
jr_000_0bee:
    or $01
    scf
    ret


Call_000_0bf2:
    ld hl, $c709
    ld a, [hl+]
    push hl
    inc hl
    ld b, $00
    bit 0, a
    ld a, $fe
    jr z, jr_000_0c02

    sub $2e

jr_000_0c02:
    sub [hl]
    ld e, a
    ld a, $ff
    sbc b
    ld d, a
    call Call_000_0d2b
    pop de
    ret c

    ld a, [$c661]
    ld [de], a
    ld bc, $0001
    jp Jump_000_0d25


strBeamFilePrep::
    db "«ﾂｳｼﾝｼﾞｭﾝﾋﾞﾁｭｳ ﾆｼﾃ  »\n"
    db "ｹﾞｰﾑﾎﾞｰｲ«ﾄﾞｳｼｦ ｸｯﾂｹ »\n"
    db "Aﾎﾞﾀﾝ«ｦ ｵｼﾃｸﾀﾞｻｲ   »\n"
    db "\n"

strBeamFileStarted::
    db "«ﾂｳｼﾝｦ ﾁｭｳｼｽﾙﾊﾞｱｲﾊ »\n"
    db "                \n"
    db "Bﾎﾞﾀﾝ«ｦ ｵｼﾃｸﾀﾞｻｲ   »\n"
    db "\n"

Call_000_0c95:
    ld hl, strBeamFilePrep
    call Call_000_087f

jr_000_0c9b:
    vcall $d8
    bit 1, a
    jr nz, jr_000_0ce8

    and $01
    jr z, jr_000_0c9b

    ld hl, strBeamFileStarted
    call Call_000_087f
    ld hl, $ce00
    ld de, $c800
    ld c, $10
    call Call_000_0cff
    jr c, jr_000_0ce8

    rst $10
    add hl, sp
    nop
    pop hl
    ld de, $c802
    ld bc, $000d
    vcall $67
    ld a, h
    or l
    ld a, $06
    jr nz, jr_000_0cea

    ld a, [$c800]
    or a
    jr nz, jr_000_0cea

    ld a, [$c801]
    ld [$c663], a
    ld a, [$c80f]
    ld [$c662], a
    ld a, $01
    call Call_000_0d05
    jr c, jr_000_0ce8

    call Call_000_0d16
    xor a
    ret


jr_000_0ce8:
    scf
    ret


jr_000_0cea:
    call Call_000_0d05
    call Call_000_0d16
    scf
    ret


strGBKissMenu:
    db "GB KISS MENU "

Call_000_0cff:
    vcall $c3
    vcall $7c
    jr jr_000_0d3b

Call_000_0d05:
    ld [$c800], a
    ld de, $ce00
    ld hl, $c800
    ld c, $01
    vcall $c3
    vcall $7f
    jr jr_000_0d3b

Call_000_0d16:
    vcall $c3
    vcall $73
    jr jr_000_0d3b

    ld hl, $c700
    vcall $c3
    vcall $79
    jr jr_000_0d3b

Call_000_0d25:
Jump_000_0d25:
    vcall $c3
    vcall $7d
    jr jr_000_0d3b

Call_000_0d2b:
    vcall $c3
    vcall $77
    jr jr_000_0d3b

Call_000_0d31:
    vcall $c3
    vcall $76
    jr jr_000_0d3b

Call_000_0d37:
    vcall $c3
    vcall $75

jr_000_0d3b:
    push af
    vcall $db
    pop af
    ret


strLoadSuccess::
    db "«- <ﾃﾝｿｳ ｻﾚﾏｼﾀ> -»\n"

strLoadFailure::
    db "«- ﾃﾝｿｳﾃﾞｷﾏｾﾝﾃﾞｼﾀ -»\n"

strLoadOverwrite::
    db "«- ｵﾅｼﾞ»ﾌｧｲﾙ«ｶﾞｱﾘﾏｽ -»\n"

SECTION "ROM Bank $3fe0", ROM0[$3fe0]

code_00_3fe0::
    push af
    ld a, BANK(j03_4000)
    rst $20
    pop af
    ld bc, data_00_3fe0
    push bc
    jp hl


data_00_3fe0::
    db $3e, $04, $e7, $c9
