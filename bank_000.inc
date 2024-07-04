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
    db BANK(traps1)

Config2::
    db ((traps1 - $4000) / 2) - 1

Config3::
    db BANK(traps1)

Config4::
    db BANK(traps2)

RST_10::
    jp code_00_00c9

    db $00
KissBanks:
    db $fe    ; Unknown constant, related to bank capacity?
KissIndexBank:
    db $03    ; CRAM block of GBKiss file index
KissIndexAddr:
    dw $bf00  ; CRAM address of GBKiss file index

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

trap_0e_00b9::
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


trap_00_00e9::
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
    dp "GBKISS MINIGAME", $00

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

trap_01_0150::
    ld a, [Config0]
    ldh [hROMBank], a
    ld [rROMBank], a
    jp j01_4100


trap_02_015b::
    ld a, b
    or c
    ret z

    ldh a, [$86]
    or a
    jr z, .copyNonVRAM

    ld a, h
    and $e0
    cp HIGH(_VRAM)
    jr z, .copyVRAM

    ld a, d
    and $e0
    cp HIGH(_VRAM)
    jr nz, .copyNonVRAM

    trap $fe
    ret

.copyNonVRAM
    ld a, [de]
    inc de
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, .copyNonVRAM

    ret


.copyVRAM
    ld a, b
    or a

.jr_000_017f
    push af
    trap $fd
    pop af
    push af
    jr nz, .jr_000_018a

    ld a, b
    cp c
    jr nc, .jr_000_01a5

.jr_000_018a
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
    jr .jr_000_017f

.jr_000_01a5
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
    ld a, l
    ldh [$87], a
    ldh a, [$89]
    add b
    ldh [$89], a
    ei

trap_none_0::
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

traps0::
    dw trap_00_00e9  ; $00
    dw trap_01_0150  ; $01
    dw trap_02_015b  ; $02
    dw trap_03_6f05  ; $03 (bank 1)
    dw trap_04_6f35  ; $04 (bank 1)
    dw trap_05_6f3e  ; $05 (bank 1)
    dw trap_06_76d8  ; $06 (bank 1)
    dw trap_07_76f1  ; $07 (bank 1)
    dw trap_08_7712  ; $08 (bank 1)
    dw trap_08_02fd  ; $09
    dw trap_none_0   ; $0a
    dw trap_none_0   ; $0b
    dw trap_none_0   ; $0c
    dw trap_none_0   ; $0d
    dw trap_0e_00b9  ; $0e
    dw 0            ; $0f
    dw trap_10_02ed  ; $10
    dw trap_11_022c  ; $11
    dw trap_12_0230  ; $12
    dw trap_13_0234  ; $13
    dw trap_14_0239  ; $14
    dw trap_15_023d  ; $15
    dw trap_16_0241  ; $16
    dw trap_17_0245  ; $17
    dw trap_18_0249  ; $18
    dw trap_19_024d  ; $19
    dw trap_1a_0218  ; $1a
    dw trap_1b_0268  ; $1b

trap_1a_0218::
    ld de, $0038
    ret

Jump_000_021c:
    push af
    push bc
    push de
    push hl
    ldh a, [$99]
    bit 2, a
    call nz, trap_12_0230
    pop hl
    pop de
    pop bc
    pop af
    reti

trap_11_022c::
    ld l, $00
    jr jr_000_024f

trap_12_0230::
    ld l, $03
    jr jr_000_024f

trap_13_0234::
    xor a
    ld l, $06
    jr jr_000_024f

trap_14_0239::
    ld l, $09
    jr jr_000_024f

trap_15_023d::
    ld l, $0c
    jr jr_000_024f

trap_16_0241::
    ld l, $0f
    jr jr_000_024f

trap_17_0245::
    ld l, $12
    jr jr_000_024f

trap_18_0249::
    ld l, $15
    jr jr_000_024f

trap_19_024d::
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

trap_1b_0268::
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
    trap $50
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
    trap MemCopy
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
    trap $00
    trap $6e

trap_10_02ed::
    ld hl, trap_10_02ed
    trap $6f
    jp Jump_000_0300


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

trap_08_02fd::
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
    trap $8d
    trap $8e
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
    trap $8a
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
    trap MemCopy
    pop bc
    push bc
    ld de, $c400
    ld hl, $c500
    trap $ec
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
    trap MemCopy
    pop de
    pop bc
    ld hl, $c500
    push bc
    push de
    trap FileSearch
    pop de
    pop bc
    jr c, jr_000_03ae

    push bc
    push de
    trap $ef
    pop de
    pop bc
    ld hl, $c500
    trap FileSearch

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
    trap FileWrite
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
    trap $ea
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
    trap $00
    trap $11
    trap $61

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
    trap $00
    ld de, $0000
    ld hl, $c654
    ld bc, $0002
    trap $e4
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
    trap $e5

jr_000_053a:
    ld a, $20
    trap $b3
    ld hl, $0400
    trap $ca

Jump_000_0543:
    call Call_000_07e6
    ld de, $0204
    trap $57
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
    trap $b4
    ld c, $00

jr_000_0581:
    ld a, [$c654]
    ld b, a
    ld hl, HeaderLogo
    ld d, $20
    ld e, $3e
    trap $5e
    jr c, Jump_000_05b2

    ld c, a
    inc a
    call Call_000_076e
    ld h, a
    ld a, [$c655]
    and h
    jr z, jr_000_0581

    ld l, c
    ld h, $00
    trap JumpViaTable
    db $08
    dw Jump_000_06b9 - @
    dw Jump_000_07a4 - @
    dw Jump_000_07af - @
    dw Jump_000_07ba - @
    dw Jump_000_07c5 - @
    dw Jump_000_07d0 - @
    dw Jump_000_07db - @
    dw Jump_000_05b2 - @


Jump_000_05b2:
    trap $01

Call_000_05b4:
    jr nc, jr_000_05b9

    trap $5b
    ret


jr_000_05b9:
    ld a, [hl+]
    or a
    jr nz, jr_000_05b9

    ld a, $0d
    trap $b9
    ld a, $01
    trap $b9
    ret


strPasswordMenu::
    dk "　PASSWORD INPUT»\r", $01, "\n"
    dk "　キャラバンバージョン　5ゲーム\r", $01, "\n"
    dk "　キスモン&バケちゅリレーほか4»\r", $01, "\n"
    dk "　15パズル&キャノン«　ほか4こ»\r", $01, "\n"
    dk "　バイナリーランド«&BJほか2こ»\r", $01, "\n"
    dk "　ミニゲームがぞういれかえデータ\r", $01, "\n"
    dk "　GB KISS TOOLS\r", $01, "\n"

strPasswords::
    dp "KISSMON "
    dp "CANNON  "
    dp "BINARY  "
    dp "GAMEDATA"
    dp "KISSTOOL"

strPasswordMenuMessage::
    dk "　　メニューを　せんたくして»\n"
    dk "　\n"
    dk "«START/Aを　おしてください»\n"
    dk "\n"

strPasswordDashes::
    dp "--------\n"


Jump_000_06b9::
    call Call_000_07e6
    ld a, $20
    ld de, $0204
    ld bc, $1004
    ld hl, $0000
    trap $59
    ld a, $f0
    ld de, $0208
    ld bc, $1003
    ld hl, $0301
    trap $59
    ld hl, $0204
    trap $b8
    ld hl, strPasswordMenu
    trap $69
    ld hl, $0607
    trap $b8
    ld hl, strPasswordDashes
    trap $69
    ld hl, strEnterPassword
    ld bc, $9902
    call Call_000_0882
    ld a, $03
    ldh [$ae], a
    ld de, $900d
    ld hl, $0000
    trap $54
    ld a, $80
    ld de, $0606
    ld bc, $0801
    ld hl, $0100
    trap $59
    ld a, $03
    trap $b4
    ld hl, $c656
    ld e, $20
    ld bc, $0008
    trap MemSet
    ld de, $8001
    ld b, $08
    ld hl, $c656
    ld c, $00
    trap $55
    jp c, Jump_000_0543

    ld hl, strPasswords
    ld bc, $0502

jr_000_072f:
    push bc
    push hl
    ld de, $c656
    ld bc, $0008
    push bc
    trap $67
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
    trap $e5
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
    dk "　\n"
    dk "パスワードを　にゅうりょくして　»\n"
    dk "«STARTを　おしてください　　»\n"
    dk "\n"


Jump_000_07a4::
    ld de, $4000
    ld a, $07
    call Call_000_089a
    jp Jump_000_0543


Jump_000_07af::
    ld de, $4000
    ld a, $09
    call Call_000_089a
    jp Jump_000_0543


Jump_000_07ba::
    ld de, $4000
    ld a, $0b
    call Call_000_089a
    jp Jump_000_0543


Jump_000_07c5::
    ld de, $4000
    ld a, $0d
    call Call_000_089a
    jp Jump_000_0543


Jump_000_07d0::
    ld de, $4000
    ld a, $0e
    call Call_000_089a
    jp Jump_000_0543


Jump_000_07db::
    ld de, $4000
    ld a, $0f
    call Call_000_089a
    jp Jump_000_0543


Call_000_07e6:
    trap $b5
    ld a, $0c
    trap $b9
    ld hl, $8800
    ld e, $00
    ld bc, $0a00
    trap MemSet
    ld de, $0003
    ld bc, $1409
    trap DrawBox
    ld a, $80
    ld de, $0204
    ld bc, $1007
    ld hl, $0701
    trap $59
    ld de, $000d
    ld bc, $1405
    trap DrawBox
    ld a, $f0
    ld de, $020e
    ld bc, $1003
    ld hl, $0301
    trap $59
    ld hl, $0101
    trap $b8
    ld hl, strPasswordMenuTitle
    trap $69
    ret


strPasswordMenuTitle::
    dk "GB KISS  MINI GAME\n"

strLoadMenuMessage::
    dk "していのデータを　てんそうします»\n"
    dk "«　　AでGBKISSてんそう　　»\n"
    dk "«STARTで　じぶんのSRAMへ»\n"
    dk "\n"

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
    trap $5b
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
    ld [rROMBank], a
    ld hl, $c604
    ld bc, $0028
    trap MemCopy
    pop af
    ldh [hROMBank], a
    ld [rROMBank], a
    ld de, $0304
    trap $57
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
    ld [rROMBank], a
    ld a, d
    cp $80
    jr c, jr_000_08f3

    sub $40
    ld d, a

jr_000_08f3:
    push bc
    ld hl, $c634
    ld bc, $0020
    trap MemCopy
    pop bc
    pop af
    ldh [hROMBank], a
    ld [rROMBank], a
    ld d, c
    ld e, $07
    pop hl
    pop bc
    push bc
    push hl
    ld hl, $c638
    trap $5b
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
    trap $b4
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
    trap $5e
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

    trap $01
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
    ld [rROMBank], a
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
    ld [rROMBank], a
    push bc
    push de
    ld a, $04
    add c
    ld l, a
    ld h, $01
    trap $b8
    ld a, $2a
    trap $bb
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
    ld [rROMBank], a
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
    ld [rROMBank], a
    ld a, $04
    add c
    push de
    push bc
    ld e, a
    ld d, $02
    trap $57
    ld c, l
    ld b, h
    pop de
    ld a, $80
    add e
    ld d, a
    ld e, $07
    pop hl
    trap $5b
    ld hl, strLoadMenuMessage
    call Call_000_087f
    xor a
    ret


jr_000_09e6:
    pop af
    ldh [hROMBank], a
    ld [rROMBank], a
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
    trap MemCopy
    pop bc
    push bc
    ld de, $c900
    ld hl, $c500
    trap $ec
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
    trap MemCopy
    pop de
    pop bc
    ld hl, $c500
    push bc
    push de
    trap FileSearch
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
    trap FileWrite
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
    trap $ea
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
    trap MemCopy
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
    trap MemCopy
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
    dk "つうしんじゅんびちゅう　にして　　»\n"
    dk "ゲームボーイどうしを　くっつけ　»\n"
    dk "Aボタンを　おしてください　　　»\n"
    dk "\n"

strBeamFileStarted::
    dk "つうしんを　ちゅうしするばあいは　»\n"
    dk "                \n"
    dk "Bボタンを　おしてください　　　»\n"
    dk "\n"

Call_000_0c95:
    ld hl, strBeamFilePrep
    call Call_000_087f

jr_000_0c9b:
    trap InputButtons
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

    pushx strGBKissMenu
    pop hl
    ld de, $c802
    ld bc, $000d
    trap $67
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
    dp "GB KISS MENU "

Call_000_0cff:
    trap $c3
    trap IROpen
    jr jr_000_0d3b

Call_000_0d05:
    ld [$c800], a
    ld de, $ce00
    ld hl, $c800
    ld c, $01
    trap $c3
    trap IRSend
    jr jr_000_0d3b

Call_000_0d16:
    trap $c3
    trap IRClose
    jr jr_000_0d3b

    ld hl, $c700
    trap $c3
    trap $79
    jr jr_000_0d3b

Call_000_0d25:
Jump_000_0d25:
    trap $c3
    trap $7d
    jr jr_000_0d3b

Call_000_0d2b:
    trap $c3
    trap $77
    jr jr_000_0d3b

Call_000_0d31:
    trap $c3
    trap $76
    jr jr_000_0d3b

Call_000_0d37:
    trap $c3
    trap $75

jr_000_0d3b:
    push af
    trap $db
    pop af
    ret


strLoadSuccess::
    dk "«- <てんそう　されました> -»\n"

strLoadFailure::
    dk "«- てんそうできませんでした -»\n"

strLoadOverwrite::
    dk "«- おなじファイルがあります -»\n"

SECTION "ROM Bank $3fe0", ROM0[$3fe0]

Call_000_3fe0::
    push af
    ld a, BANK(Jump_003_4006_Origin)
    rst $20
    pop af
    ld bc, code_00_3fea
    push bc
    jp hl


code_00_3fea::
    ld a, $04
    rst $20
    ret
