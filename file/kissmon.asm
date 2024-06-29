; Disassembly of "kiss-mon.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db kFileHasIcon2bpp + kFileMarkerCircle + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db .end - @ - 1            ; length of variable parts of header
    db $6e                     ; owner code
.title
    dk "KISS-MON"
.icon
    INCBIN "gfx/kissmon/icon.2bpp"
.end

History:
.points
    dw 1
.author
    db "TOBI      ", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    trap StopAudio
    ld hl, $04bc
    trap TimerSet

.jr_0103
    callx call_0b27
    callx call_084e
    ld a, $20
    trap DrawInit
    ld a, $e4
    ldh [$9d], a
    ldx hl, layout_01a9
    trap DrawLayout
    callx call_0177
    ld a, [$cca3]
    ld hl, $8000
    callx call_0cf8
    ld a, $03
    trap LCDEnable
    xor a
    ld hl, $0000
    ld de, $1840
    ld bc, $0303
    trap $c5
    trap AwaitFrame
    trap $c3
    trap StopAudio
    callx call_07cc
    jr c, .jr_0161

    callx call_02f5

.jr_0159
    trap AwaitFrame
    trap $d8
    and $0f
    jr z, .jr_0159

.jr_0161
    callx call_0245
    jr c, .jr_0103

    jr nz, .jr_0173

    ld a, $01
    ld [$ccbf], a
    jr .jr_0103

.jr_0173
    trap StopAudio
    trap ExitToMenu

call_0177:
    ld a, $00
    ld de, $0b04
    ld hl, $0100
    ld bc, $0501
    trap $59
    ld hl, $cc9e
    ld de, $0001
    ld c, $05
    trap $5d
    ld bc, $0b05
    ld hl, $cca4

.jr_0194
    ld a, [hl+]
    callx call_02db
    inc c
    ld a, c
    cp $0a
    jr nz, .jr_01a4

    inc c
    ld a, c

.jr_01a4
    cp $0e
    jr c, .jr_0194

    ret


layout_01a9:
    dk $04, $00, "ＫＩＳＳ　ＭＯＮＳＴＥＲ\n"
    dk $09, $02, "ＨＵＤＳＯＮ　ＳＯＦＴ\n"
    dk $06, $04, "なまえ\n"
    dh $06, $05, "こうげき\n"
    dh $06, $06, "ぼうぎょ\n"
    dh $06, $07, "すばやさ\n"
    dh $06, $08, "うんのよさ\n"
    dh $06, $09, "ＨＰ\n"
    dh $06, $0b, "かち\n"
    dh $06, $0c, "まけ\n"
    dh $06, $0d, "ひきわけ\n"
    dh $02, $0f, "ゲームボーイを　むかいあわせて\n"
    dh $02, $10, "ひとりだけ　»Ｂボタンを　おすと\n"
    dh $02, $11, "バトルがスタートします\n"
    db $ff


call_0245:
    ld a, $20
    trap DrawInit
    ld a, $e4
    ldh [$9d], a
    ld a, [$cca3]
    ld hl, $8000
    callx call_0cf8
    ld hl, $cc9e
    ld de, $c007
    callx call_0739
    ldx hl, layout_02a8
    trap DrawLayout
    ldx hl, data_0b8b
    ld bc, $0b0b
    ld e, $03

.jr_0276
    ld a, [hl+]
    callx call_02db
    inc c
    dec e
    jr nz, .jr_0276

    ld a, $03
    trap LCDEnable
    xor a
    ld hl, $0000
    ld de, $4840
    ld bc, $0303
    trap $c5

.jr_0292
    trap AwaitFrame
    trap $d8
    bit BtnSel, a
    jr nz, .jr_02a4

    bit BtnA, a
    jr nz, .jr_02a6

    bit BtnB, a
    jr z, .jr_0292

    or a
    ret


.jr_02a4
    xor a
    ret


.jr_02a6
    scf
    ret


layout_02a8:
    dk $06, $0b, "かち\n"
    dh $06, $0c, "まけ\n"
    dh $06, $0d, "ひきわけ\n"
    dh $03, $10, "Ａ：つづける　　Ｂ：おわる\n"
    dh $04, $11, "ＳＥＬＥＣＴ：しゅうせい\n"
    db $ff


call_02db:
    push hl
    push de
    push bc
    push af
    ld l, c
    ld h, b
    trap MoveCursor
    pop af
    ld e, a
    ld d, $00
    ld hl, $cc40
    trap IntToString
    ld hl, $cc43
    trap DrawString
    pop bc
    pop de
    pop hl
    ret


call_02f5:
    ld a, $1d
    callx call_0cdf
    callx call_0c29
    ld de, $000d
    ld bc, $1405
    trap DrawBox
    callx call_07a9
    ld hl, $8800
    ld e, $00
    ld bc, $0800
    trap MemSet
    callx call_0c38
    ld hl, $cca8
    ld a, [hl+]
    ld [hl], a
    ld hl, $ccb6
    ld a, [hl+]
    ld [hl], a
    ld a, $03
    trap LCDEnable
    ld hl, $cc60
    ld [hl], $05
    inc hl
    ld [hl], $0f
    ldx hl, data_0402
    callx call_0785
    ld c, $78

.jr_0348
    trap AwaitFrame
    dec c
    jr nz, .jr_0348

    callx call_07a9
    ld a, $07
    callx call_0cd5
    xor a
    ld [$ccbb], a
    callx call_0417
    jr nc, .jr_0393

    callx call_06ed
    callx call_0750
    ldx hl, data_05ef
    callx call_0785
    callx call_07c4
    callx call_04a6
    jr c, .jr_03da

.jr_0393
    callx call_0447
    callx call_0486
    jr c, .jr_03da

    ld hl, $ccbc
    ld a, [hl]
    xor $01
    ld [hl], a
    callx call_0486
    jr c, .jr_03da

    ld hl, $ccbb
    inc [hl]
    ld a, [hl]
    cp $0a
    jr c, .jr_0393

    ld a, $0a
    ld [$0000], a
    ldx hl, data_0650
    callx call_0785
    ldx hl, data_0b8d
    inc [hl]
    jr nz, .jr_03d5

    ld [hl], $ff

.jr_03d5
    xor a
    ld [$0000], a
    ret


.jr_03da
    ld a, $0a
    ld [$0000], a
    ld c, $1b
    ldx hl, data_0b8b
    ld a, [$cca8]
    or a
    jr nz, .jr_03ee

    ld c, $19
    inc hl

.jr_03ee
    push hl
    ld a, c
    callx call_0cd5
    pop hl
    inc [hl]
    jr nz, .jr_03fd

    ld [hl], $ff

.jr_03fd
    xor a
    ld [$0000], a
    ret


data_0402:
    dh "バトル　スタート！！\n"
    dk "START!!\n"


call_0417:
    ld a, [$ccbd]
    ld hl, $ccbc
    ld [hl], a
    ld a, $09
    callx call_06d7
    callx call_0bf2
    jr c, .jr_0445

    ld a, $09
    callx call_06ce
    callx call_0bf2
    ret nc

    ld a, [hl]
    xor $01
    ld [hl], a

.jr_0445
    scf
    ret


call_0447:
    ld a, [$ccbd]
    ld [$ccbc], a
    ld a, $08
    callx call_06ce
    callx call_0c0e
    ld d, a
    ld a, $08
    callx call_06d7
    callx call_0c0e
    ld e, a
    add d
    jr nc, .jr_0474

    ld a, $ff

.jr_0474
    callx call_0bfc
    cp d
    jr nc, .jr_0485

    ld hl, $ccbc
    ld a, [hl]
    xor $01
    ld [hl], a

.jr_0485
    ret


call_0486:
    callx call_06ed
    callx call_0750
    ldx hl, data_061a
    callx call_0785
    callx call_07c4

call_04a6:
    xor a
    ld [$ccbe], a
    callx call_0b8e
    jr c, .jr_04dc

    callx call_06f9
    callx call_0750
    ldx hl, data_05fd
    callx call_0785
    callx call_066c
    callx call_07a9
    or a
    ret


.jr_04dc
    ld a, $09
    callx call_06ce
    srl a
    callx call_0bfc
    ld d, a
    ld a, $08
    callx call_06ce
    srl a
    add d
    ld d, a
    ld a, $07
    callx call_06ce
    add d
    ld d, a
    ld a, $09
    callx call_06d7
    srl a
    callx call_0bfc
    ld e, a
    ld a, $08
    callx call_06d7
    srl a
    add e
    ld e, a
    ld a, $06
    callx call_06d7
    add e
    ld e, a
    srl e
    srl e
    srl e
    sub e
    callx call_0c0e
    ld e, a
    xor a
    ld [$ccc0], a
    ld a, $09
    callx call_06d7
    callx call_0bf2
    jr nc, .jr_057a

    srl d
    push de
    ld a, e
    sub d
    jr c, .jr_0579

    cp $05
    jr c, .jr_0579

    ldx hl, data_060d
    callx call_0785
    callx call_07c4
    ld a, $01
    ld [$ccc0], a

.jr_0579
    pop de

.jr_057a
    ld a, e
    sub d
    jr z, .jr_0580

    jr nc, .jr_0584

.jr_0580
    trap RandNext
    and $03

.jr_0584
    ld [$ccbe], a
    push af
    or a
    jr nz, .jr_0591

    ldx hl, data_0634
    jr .jr_059c

.jr_0591
    callx call_077a
    ldx hl, data_0624

.jr_059c
    callx call_0785
    callx call_07c4
    pop af
    callx call_0705
    push af
    callx call_0720
    callx call_066c
    pop af
    jr z, .jr_05cd

    callx call_07a9
    or a
    ret


.jr_05cd
    callx call_07a9
    callx call_06f9
    callx call_0750
    ldx hl, data_0646
    callx call_0785
    scf
    ret


data_05ef:
    dk "の　せんせいこうげき！\n"
data_05fd:
    dk "は　すばやく　みをかわした\n"
data_060d:
    dk "かいしんのいちげき！\n"
data_061a:
    dk "の　こうげき！\n"
data_0624:
    dh "ポイントのダメージ\n"
data_0634:
    dh "ダメージを　あたえられない\n"
data_0646:
    dk "は　ちからつきた\n"
data_0650:
    dk "じかんぎれ　ひきわけです\n"

layout_0661:
    dk $01, $0b, "ＨＰ\n"
    dk $0b, $0b, "ＨＰ\n"
    db $ff


call_066c:
    ld a, [$ccbe]
    or a
    jr z, .jr_068d

    ld bc, $0510
    ld a, [$ccbc]
    or a
    jr z, .jr_067e

    ld bc, $0331

.jr_067e
    ld a, [$ccc0]
    or a
    jr z, .jr_0685

    ld b, c

.jr_0685
    ld a, b
    callx call_0cdf

.jr_068d
    ld c, $5a

.jr_068f
    push bc
    trap AwaitFrame
    trap $d8
    callx call_06a0
    pop bc
    dec c
    jr nz, .jr_068f

    ret


call_06a0:
    ld a, [$ccbe]
    or a
    ret z

    ld a, c
    cp $32
    jr nc, .jr_06b3

    xor a
    ldh [$9b], a
    ldh [$9a], a
    jx call_0c8e


.jr_06b3
    and $07
    ret nz

    callx call_0ca1
    ld a, [$ccbc]
    or a
    jr nz, .jr_06c7

    jx call_0c91


.jr_06c7
    ld a, d
    ldh [$9b], a
    ld a, e
    ldh [$9a], a
    ret


call_06ce:
    push bc
    ld c, a
    ld a, [$ccbc]
    xor $01
    jr call_06d7.jr_06dc


call_06d7:
    push bc
    ld c, a
    ld a, [$ccbc]

.jr_06dc
    ld b, $00
    push hl
    ld hl, $cc9e
    or a
    jr z, .jr_06e8

    ld hl, $ccac

.jr_06e8
    add hl, bc
    ld a, [hl]
    pop hl
    pop bc
    ret


call_06ed:
    ld hl, $cc9e
    ld a, [$ccbc]
    or a
    ret z

    ld hl, $ccac
    ret


call_06f9:
    ld hl, $ccac
    ld a, [$ccbc]
    or a
    ret z

    ld hl, $cc9e
    ret


call_0705:
    push hl
    push af
    ld hl, $cca8
    ld a, [$ccbc]
    or a
    jr nz, .jr_0713

    ld hl, $ccb6

.jr_0713
    pop af
    cpl
    inc a
    add [hl]
    bit 7, a
    jr z, .jr_071c

    xor a

.jr_071c
    ld [hl], a
    pop hl
    or a
    ret


call_0720:
    ld hl, $cca8
    ld d, $04
    callx call_0731
    ld hl, $ccb6
    ld d, $0e

call_0731:
    ld a, [hl]
    ld b, d
    ld c, $0b
    jx call_02db


call_0739:
    push hl
    push de
    ld a, d
    ld d, e
    ld e, $02
    ld bc, $0501
    ld hl, $0100
    trap $59
    pop de
    pop hl
    ld e, $01
    ld c, $05
    trap $5d
    ret


call_0750:
    push hl
    ld hl, $cc60
    ld d, [hl]
    inc hl
    ld e, [hl]
    ld bc, $0501
    ld hl, $0100
    ld a, [$ccba]
    push af
    trap $59
    pop af
    pop hl
    ld d, a
    ld e, $01
    ld c, $05
    trap $5d
    ld a, d
    add $05
    ld [$ccba], a
    ld hl, $cc60
    ld a, $05
    add [hl]
    ld [hl], a
    ret


call_077a:
    ld e, a
    ld d, $00
    ld hl, $cc40
    trap IntToString
    ld hl, $cc43

call_0785:
    push hl
    ld hl, $cc60
    ld d, [hl]
    inc hl
    ld e, [hl]
    trap $57
    ld c, l
    ld b, h
    pop hl
    ld a, [$ccba]
    ld d, a
    ld e, $01
    trap $5b
    ld a, [$ccba]
    sub d
    cpl
    inc a
    ld hl, $cc60
    add [hl]
    ld [hl], a
    ld a, d
    ld [$ccba], a
    ret


call_07a9:
    ld a, $7f
    ld de, $010e
    ld bc, $1203
    ld hl, $0000
    trap $59
    ld a, $ca
    ld [$ccba], a
    ld hl, $cc60
    ld [hl], $01
    inc hl
    ld [hl], $0e
    ret


call_07c4:
    ld hl, $cc60
    ld [hl], $01
    inc hl
    inc [hl]
    ret


call_07cc:
    ld de, $c3b2
    ld hl, $cca9
    ld bc, $0003
    trap MemCopy
    xor a
    ld [$ccbd], a
    ld hl, $cc9c
    ld [hl], $4d
    inc hl
    ld [hl], $54
    xor a
    ld [$cc96], a

.jr_07e7
    ld hl, $cc96
    inc [hl]
    ld a, [hl]
    cp $03
    jr nc, .jr_0844

    trap $72
    jr nc, .jr_0831

.jr_07f4
    trap AwaitFrame
    ldh a, [$8a]
    and $02
    jr nz, .jr_07f4

    ld hl, $cc9c
    ld de, $c600
    push de
    ld c, $02
    trap $7c
    pop hl
    jr c, .jr_07e7

    ld a, [hl+]
    cp $4d
    jr nz, .jr_0844

    ld a, [hl]
    cp $54
    jr nz, .jr_0844

    ld hl, $cc9e
    ld de, $ccac
    ld c, $0e
    push hl
    push de
    trap $7c
    pop de
    pop hl
    jr c, .jr_07e7

    ld c, $0e
    trap $7f
    jr c, .jr_07e7

    trap $73
    jr c, .jr_07e7

    or a
    jr .jr_0845

.jr_0831
    ld de, $ccb7
    ld hl, $c3b2
    ld bc, $0003
    trap MemCopy
    ld a, $01
    ld [$ccbd], a
    or a
    jr .jr_0845

.jr_0844
    scf

.jr_0845
    push af
    ld hl, $cc9c
    xor a
    ld [hl+], a
    ld [hl], a
    pop af
    ret


call_084e::
    ldx hl, data_0b7f
    ld a, [hl+]
    or a
    jr z, .jr_0877

    ld de, $cc9e
    ld c, $0e

.jr_085b
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, .jr_085b

    ld a, [$ccbf]
    or a
    jr nz, .jr_086e

    ldh a, [$8a]
    and $04
    cp $04
    ret nz

.jr_086e
    xor a
    ld [$ccbf], a
    ld [$cca9], a
    jr .jr_088e

.jr_0877
    ld a, $64
    ld [$cca9], a
    callx call_08c8
    ld hl, $cc9e
    ld c, $05
    ld a, $20

.jr_088a
    ld [hl+], a
    dec c
    jr nz, .jr_088a

.jr_088e::
    ld a, $06
    callx call_0cd5

.jr_0897::
    callx call_08e9
    callx call_095d
    jr c, .jr_0897

    ld a, $0a
    ld [$0000], a
    ldx hl, data_0b7f
    ld de, $cc9e
    ld [hl], $01
    inc hl
    ld c, $0b

.jr_08b8
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, .jr_08b8

    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    xor a
    ld [$0000], a
    jr call_084e


call_08c8::
    ld hl, $cca4
    ld c, $04
    ld b, $00

.jr_08cf
    ld a, $14
    callx call_0c0e
    ld [hl+], a
    add b
    ld b, a
    dec c
    jr nz, .jr_08cf

    ld a, $64
    sub b
    jr z, call_08c8

    jr c, call_08c8

    ld [hl+], a
    ld [hl], $00
    ret


call_08e9:
    callx call_0c29
    ld de, $c600
    trap $51
    ld de, $420d
    ld hl, $c600
    trap $54
    ldx hl, data_092e
    ld de, $8001
    trap $5a
    ld de, $0706
    ld bc, $0703
    trap DrawBox
    ld a, $3d
    ld de, $0807
    ld bc, $0501
    ld hl, $0100
    trap $59
    ld a, $03
    trap LCDEnable
    ld de, $3d01
    ld b, $05
    ld hl, $cc9e
    ld a, b
    trap $4d
    ld c, a
    trap $55
    ret


data_092e:
    dh $04, $02, "モンスターの　なまえを\n"
    dk $04, $03, "にゅうりょくしてください\n"
    dh $05, $0b, "ＳＴＡＲＴ：けってい\n"
    db $ff


call_095d:
    ld a, $20
    trap DrawInit
    xor a
    ld de, $0401
    ld bc, $0501
    ld hl, $0100
    trap $59
    ld hl, $cc9e
    ld de, $0001
    ld c, $05
    trap $5d
    ldx hl, layout_0a7b
    trap DrawLayout
    ld a, $03
    trap LCDEnable
    xor a
    ld [$cc61], a
    callx call_0a6a
    callx call_09d6

.jr_0993
    trap AwaitFrame
    trap $d8
    callx call_09eb
    ldh a, [$8b]
    and $08
    jr z, .jr_0993

    ld a, [$cca9]
    or a
    jr nz, .jr_0993

    ld a, [$cca8]
    or a
    jr z, .jr_0993

    ldx hl, layout_0b0a
    trap DrawLayout

.jr_09b6
    trap AwaitFrame
    trap $d8
    bit 0, a
    jr nz, .jr_09c4

    bit 1, a
    jr z, .jr_09b6

    scf
    ret


.jr_09c4
    ld hl, $cc9e
    xor a
    ld b, $05

.jr_09ca
    add [hl]
    inc hl
    dec b
    jr nz, .jr_09ca

    and $0f
    ld [$cca3], a
    or a
    ret


call_09d6:
    ld bc, $0c04
    ld hl, $cca4

.jr_09dc
    ld a, [hl+]
    callx call_02db
    inc c
    ld a, c
    cp $0a
    jr c, .jr_09dc

    ret


call_09eb:
    ldh a, [$b6]
    ld b, a
    and $c0
    jr z, .jr_0a19

    callx call_0a66
    ld hl, $cc61
    ld a, [hl]
    bit 6, b
    jr z, .jr_0a0a

    dec a
    bit 7, a
    jr z, .jr_0a14

    ld a, $04
    jr .jr_0a14

.jr_0a0a
    bit 7, b
    jr z, .jr_0a19

    inc a
    cp $05
    jr c, .jr_0a14

    xor a

.jr_0a14
    ld [hl], a
    xor a
    ld [$cc62], a

.jr_0a19
    ldh a, [$b6]
    ld b, a
    and $33
    jr z, .jr_0a5a

    ld a, $01
    callx call_0cdf
    ld hl, $cca4
    ld a, [$cc61]
    ld e, a
    ld d, $00
    add hl, de
    ld e, [hl]
    ld a, [$cca9]
    ld d, a
    ld a, b
    and $11
    jr z, .jr_0a43

    inc d
    dec d
    jr z, .jr_0a43

    dec d
    inc e

.jr_0a43
    ld a, b
    and $22
    jr z, .jr_0a4e

    inc e
    dec e
    jr z, .jr_0a4e

    inc d
    dec e

.jr_0a4e
    ld [hl], e
    ld a, d
    ld [$cca9], a
    callx call_09d6

.jr_0a5a
    ld hl, $cc62
    ld a, [hl]
    inc [hl]
    and $0f
    ret nz

    bit 4, [hl]
    jr z, call_0a6a

call_0a66:
    ld a, $20
    jr call_0a6a.jr_0a6c

call_0a6a::
    ld a, $3e

.jr_0a6c
    push af
    ld a, [$cc61]
    add $04
    ld l, a
    ld h, $04
    trap MoveCursor
    pop af
    trap DrawChar
    ret


layout_0a7b:
    dk $09, $01, "の　とくちょうを\n"
    dh $04, $02, "せっていしてください\n"
    dh $06, $04, "こうげき\n"
    dh $06, $05, "ぼうぎょ\n"
    dh $06, $06, "すばやさ\n"
    dh $06, $07, "うんのよさ\n"
    dh $06, $08, "ＨＰ\n"
    dh $06, $09, "あまり\n"
    dk $00, $0e, "あまりが０になるように　じゅうじキーを\n"
    dh $00, $0f, "つかって　すうちを　けっていしてください\n"
    dh $02, $11, "ＳＴＡＲＴ：せってい　しゅうりょう\n"
    db $ff


layout_0b0a:
    dk $04, $0b, "これでいいですか？\n"
    dh $04, $0c, "Ａ：はい　Ｂ：いいえ\n"
    db $ff


call_0b27:
    ld hl, $cc40
    push hl
    ld de, $ff46
    ld bc, $000a
    trap $e4
    pop hl
    ldx de, data_0b75
    ld b, $0a

.jr_0b3a
    ld a, [de]
    inc de
    cp [hl]
    inc hl
    jr nz, .jr_0b45

    dec b
    jr nz, .jr_0b3a

    or a
    ret


.jr_0b45
    ld a, $0a
    ld [$0000], a
    ld hl, $cc40
    ldx de, data_0b75
    ld b, $0a

.jr_0b53
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, .jr_0b53

    ldx hl, data_0b7f
    ld [hl], $00
    inc hl
    ld a, $20
    ld b, $05

.jr_0b64
    ld [hl+], a
    dec b
    jr nz, .jr_0b64

    ld b, $09
    xor a

.jr_0b6b
    ld [hl+], a
    dec b
    jr nz, .jr_0b6b

    xor a
    ld [$0000], a
    scf
    ret


data_0b75:
    ds 10, $00  ; player name
data_0b7f:      ;
    db $00      ; initialized?
    ds 5, $20   ; monster name
    db $00      ; unknown
    db $00      ; attack
    db $00      ; defense
    db $00      ; speed
    db $00      ; luck
    db $00      ; hp
data_0b8b:      ;
    db $00      ; wins
    db $00      ; losses
data_0b8d:      ;
    db $00      ; ties


call_0b8e:
    ld a, $09
    callx call_06ce
    callx call_0bf2
    jr c, .jr_0bbb

    callx call_0bbd
    ld d, a
    callx call_0bbd
    ld e, a
    sub d
    jr c, .jr_0bb9

    ld e, a
    trap RandNext
    cp e
    jr c, .jr_0bbb

.jr_0bb9
    scf
    ret


.jr_0bbb
    or a
    ret


call_0bbd:
    push hl
    ld a, $0b
    callx call_06d7
    ld h, a
    ld a, $08
    callx call_06d7
    ld l, a
    ld a, $09
    callx call_06d7
    add l
    callx call_0c0e
    sub h
    jr nc, .jr_0be7

    xor a

.jr_0be7
    push af
    ld hl, $ccbc
    ld a, [hl]
    xor $01
    ld [hl], a
    pop af
    pop hl
    ret


call_0bf2:
    push hl
    push de
    add a
    ld e, a
    trap RandNext
    cp e
    pop de
    pop hl
    ret


call_0bfc:
    push hl
    push de
    push bc
    ld e, a
    ld d, $00
    trap RandNext
    ld l, a
    ld h, $00
    trap $89
    ld a, h
    pop bc
    pop de
    pop hl
    ret


call_0c0e:
    push hl
    push de
    push bc
    ld e, a
    ld d, $00
    trap RandNext
    ld l, a
    trap RandNext
    add l
    rra
    ld l, a
    ld h, $00
    ld bc, $0080
    add hl, bc
    trap $89
    ld a, h
    pop bc
    pop de
    pop hl
    ret


call_0c29:
    ld a, $20
    trap DrawInit
    ld h, $04
    trap $ca
    ld a, $e4
    ldh [$9c], a
    ldh [$9d], a
    ret


call_0c38:
    ld hl, $cc9e
    ld de, $c004
    callx call_0739
    ld de, $c50e
    ld hl, $ccac
    callx call_0739
    ldx hl, layout_0661
    trap DrawLayout
    callx call_0720
    ld a, [$cca3]
    ld hl, $8800
    callx call_0cf8
    ld a, [$ccb1]
    ld hl, $8890
    callx call_0cf8
    ld a, $80
    ld hl, $0301
    ld bc, $0303
    ld de, $0406
    trap $59
    callx call_0c8e
    ret


call_0c8e:
    ld de, $0000

call_0c91:
    ld a, $78
    add d
    ld d, a
    ld a, $40
    add e
    ld e, a
    xor a
    ldx hl, data_0cb0
    trap $60
    ret


call_0ca1:
    trap RandNext
    and $02
    sub $01
    ld d, a
    trap RandNext
    and $02
    sub $01
    ld e, a
    ret


data_0cb0:
    db $09
    db $00, $00, $8f, $20
    db $08, $00, $90, $20
    db $10, $00, $91, $20
    db $00, $08, $8c, $20
    db $08, $08, $8d, $20
    db $10, $08, $8e, $20
    db $00, $10, $89, $20
    db $08, $10, $8a, $20
    db $10, $10, $8b, $20


call_0cd5:
    callx call_0cd9
    trap PlayMusic
    ret


call_0cdf:
    callx call_0cd9
    trap PlaySound
    ret


call_0cd9:
    push af
    ld a, [$0014]
    cp $01
    jr z, .jr_0cf6

    cp $fe
    jr z, .jr_0cf6

    pop af

.jr_0cf6
    pop af
    ret


call_0cf8:
    push hl
    ld e, a
    ld d, $00
    ld hl, $0090
    trap $89
    ldx de, data_0d0f
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld bc, $0090
    trap MemCopy
    ret


data_0d0f:
    INCBIN "gfx/kissmon/moncroc.2bpp"
    INCBIN "gfx/kissmon/monwolf1.2bpp"
    INCBIN "gfx/kissmon/monpig.2bpp"
    INCBIN "gfx/kissmon/monrodent.2bpp"
    INCBIN "gfx/kissmon/monplant.2bpp"
    INCBIN "gfx/kissmon/monrobo1.2bpp"
    INCBIN "gfx/kissmon/monknight.2bpp"
    INCBIN "gfx/kissmon/monocto.2bpp"
    INCBIN "gfx/kissmon/monbird1.2bpp"
    INCBIN "gfx/kissmon/monfly.2bpp"
    INCBIN "gfx/kissmon/monslug.2bpp"
    INCBIN "gfx/kissmon/mondevil.2bpp"
    INCBIN "gfx/kissmon/monseal.2bpp"
    INCBIN "gfx/kissmon/mondora.2bpp"
    INCBIN "gfx/kissmon/monrobo2.2bpp"
    INCBIN "gfx/kissmon/monfish1.2bpp"
