; Disassembly of "kissmon2.gbf"

INCLUDE "src/charmap.inc"
INCLUDE "src/common.inc"
INCLUDE "src/hardware.inc"
INCLUDE "src/macro.inc"
INCLUDE "src/trap.inc"

DEF IR_ID0 EQU "k"
DEF IR_ID1 EQU "2"

SECTION "ROM Bank $000", ROM0[$0]
LOAD "CRAM Code", SRAM[$a008]

Header:
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_A008 | FILE_ICON | FILE_2BPP | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $6e           ; owner code
.title
    dk "KISS-MON2"
.icon
    INCBIN "out/kissmon/icon2.2bpp"
.end

History:
.points
    dw 1
.author
    db "TOBI      ", 3
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    trap AudioStop
    ld hl, $04bc
    trap TimerSet
    trap LCDDisable
    call call_b187

.jr_a111
    call call_ad9a
    call call_a93d
    ld a, $20
    trap DrawInit
    ld a, $e4
    ldh [$ff9d], a
    ld hl, layout_a19f
    trap DrawLayout
    call call_a16d
    ld a, [$c867]
    ld hl, $8000
    call call_b2a6
    ld a, $03
    trap LCDEnable
    xor a
    ld hl, $0000
    ld de, $4c48
    ld bc, $0303
    trap $c5
    trap AwaitFrame
    trap AwaitBlit
    trap AudioStop
    call call_a8bb
    jr c, .jr_a15b

    call call_a464

.jr_a14e
    trap AwaitFrame
    trap InputButtons
    and $0f
    jr z, .jr_a14e

    call call_a6fa
    jr c, .jr_a111

.jr_a15b
    call call_a21f
    jr c, .jr_a111

    jr nz, .jp_a169

    ld a, $01
    ld [$c9ac], a
    jr .jr_a111

.jp_a169
    trap AudioStop
    trap ExitToMenu


call_a16d:
    ld a, $00
    ld de, $0b03
    ld hl, $0100
    ld bc, $0501
    trap $59
    ld hl, $c862
    ld de, $0001
    ld c, $05
    trap TileLoadText
    ld bc, $0b04
    ld hl, $c868

.jr_a18a
    ld a, [hl+]
    call call_a320
    inc c
    ld a, c
    cp $05
    jr nz, .jr_a19a

    ld a, $0b
    ld c, a
    ld hl, $c86f

.jr_a19a
    cp $0e
    jr c, .jr_a18a

    ret


layout_a19f:
    dk $03, $00, "ＫＩＳＳ　ＭＯＮＳＴＥＲ２\0"
    dk $09, $01, "ＨＵＤＳＯＮ　ＳＯＦＴ\0"
    dk $06, $03, "なまえ\0"
    dh $06, $04, "レベル\0"
    dk $06, $0b, "かち\0"
    dh $06, $0c, "まけ\0"
    dh $06, $0d, "ひきわけ\0"
    dh $02, $0f, "ゲームボーイを　むかいあわせて\0"
    dh $02, $10, "ひとりだけ　»Ｂボタンを　おすと\0"
    dh $02, $11, "バトルがスタートします\0"
    db $ff


call_a21f:
    ld a, $20
    trap DrawInit
    ld a, $e4
    ldh [$ff9d], a
    ld a, [$c867]
    ld hl, $8100
    call call_b2a6
    ld de, $c912
    ld hl, $8000
    ld bc, $0090
    trap MemCopy
    ld a, $00
    ld de, $0b03
    ld hl, $0100
    ld bc, $0501
    trap $59
    ld hl, $c862
    ld de, $0001
    ld c, $05
    trap TileLoadText
    ld hl, layout_a2a4
    trap DrawLayout
    ld bc, $0b04
    ld hl, data_adee

.jr_a25d
    ld a, [hl+]
    call call_a320
    inc c
    ld a, c
    cp $0a
    jr nz, .jr_a26a

    inc hl
    inc c
    ld a, c

.jr_a26a
    cp $0e
    jr c, .jr_a25d

    ld de, $8848
    call call_aee0
    ld a, $09
    ld hl, $0010
    ld de, $1048
    ld bc, $0303
    trap $c5
    ld a, $03
    trap LCDEnable

.jr_a285
    trap AwaitFrame
    trap InputButtons
    bit 2, a
    jr nz, .jr_a29b

    bit 0, a
    jr nz, .jr_a29d

    bit 3, a
    jr nz, .jr_a29f

    bit 1, a
    jr z, .jr_a285

    or a
    ret


.jr_a29b
    xor a
    ret


.jr_a29d
    scf
    ret


.jr_a29f
    call call_a33a
    scf
    ret


layout_a2a4:
    dk $06, $03, "なまえ\0"
    dh $06, $04, "レベル\0"
    dk $06, $05, "こうげき\0"
    dh $06, $06, "ぼうぎょ\0"
    dh $06, $07, "すばやさ\0"
    dh $06, $08, "うんのよさ\0"
    dh $06, $09, "ＨＰ\0"
    dh $06, $0b, "かち\0"
    dh $06, $0c, "まけ\0"
    dh $06, $0d, "ひきわけ\0"
    dh $03, $0f, "Ａ：つづける　　Ｂ：おわる\0"
    dh $04, $10, "ＳＥＬＥＣＴ：しゅうせい\0"
    dh $02, $11, "ＳＴＡＲＴ：モンスターこうかん\0"
    db $ff


call_a320:
    push hl
    push de
    push bc
    push af
    ld l, c
    ld h, b
    trap DrawAt
    pop af
    ld e, a
    ld d, $00
    ld hl, $c83c
    trap StrConvInt
    ld hl, $c83f
    trap DrawString
    pop bc
    pop de
    pop hl
    ret


call_a33a:
    ld a, $04
    call call_af25
    ld a, $20
    trap DrawInit
    ld hl, layout_a3c6
    trap DrawLayout
    ld de, $c912
    ld hl, $9000
    ld bc, $0090
    trap MemCopy
    ld a, [$c867]
    dec a
    and $0f
    ld [$c85f], a
    ld hl, $9100
    call call_b2a6
    ld de, $0d00
    call call_a3ba
    ld de, $0310
    call call_a3ba
    ld a, $03
    trap LCDEnable

.jr_a372
    trap AwaitFrame
    trap InputButtons
    or a
    jr z, .jr_a372

    ld b, a
    bit 1, b
    jr nz, .jr_a3b4

    bit 2, b
    jr nz, .jr_a39d

    ld hl, $c85f
    ld a, [hl]
    bit 4, b
    jr nz, .jr_a391

    bit 5, b
    jr z, .jr_a372

    dec a
    jr .jr_a392

.jr_a391
    inc a

.jr_a392
    and $0f
    ld [hl], a
    ld hl, $9100
    call call_b2a6
    jr .jr_a372

.jr_a39d
    ld a, [$c85f]
    call call_b2b1
    ld a, $0a
    ld [$0000], a
    ld de, $c912
    ld bc, $0090
    trap MemCopy
    xor a
    ld [$0000], a

.jr_a3b4
    ldh a, [$ff8a]
    or a
    jr nz, .jr_a3b4

    ret


call_a3ba:
    ld a, e
    ld e, $05
    ld hl, $0301
    ld bc, $0303
    trap $59
    ret


layout_a3c6:
    dh $06, $00, "モンスターこうかん\0"
    dh $01, $02, "こうかんする　　　　　　もらう\0"
    dh $02, $03, "モンスター　　　　　モンスター\0"
    dk $00, $09, "じゅうじキーで　こうかんするモンスターを\0"
    dh $00, $0a, "えらんでください\0"
    dh $00, $0b, "えらばれた　モンスターは　きえてしまうの\0"
    dh $00, $0c, "で　ちゅういしましょう\0"
    dh $01, $0f, "ＳＥＬＥＣＴ：けってい　Ｂ：ちゅうし\0"
    db $ff


call_a464:
    ld a, $1d
    call call_af4c
    call call_ae89
    ld de, $000d
    ld bc, $1405
    trap DrawBox
    call call_a898
    ld hl, $8800
    ld e, $00
    ld bc, $0800
    trap MemSet
    call call_ae98
    ld hl, $c86d
    ld a, [hl+]
    inc hl
    ld [hl], a
    ld hl, $c90d
    ld a, [hl+]
    inc hl
    ld [hl], a
    ld a, $03
    trap LCDEnable
    ld hl, $c85c
    ld [hl], $05
    inc hl
    ld [hl], $0f
    ld hl, data_a528
    call call_a874
    ld c, $78

.jr_a4a4
    trap AwaitFrame
    dec c
    jr nz, .jr_a4a4

    call call_a898
    ld a, $00
    call call_af25
    xor a
    ld [$c9a8], a
    call call_a53d
    jr nc, .jr_a4ce

    call call_a7e1
    call call_a83f
    ld hl, data_a67d
    call call_a874
    call call_a8b3
    call call_a597
    jr c, .jr_a503

.jr_a4ce
    call call_a55d
    call call_a588
    jr c, .jr_a503

    ld hl, $c9a9
    ld a, [hl]
    xor $01
    ld [hl], a
    call call_a588
    jr c, .jr_a503

    ld hl, $c9a8
    inc [hl]
    ld a, [hl]
    cp $0a
    jr c, .jr_a4ce

    ld a, $0a
    ld [$0000], a
    ld hl, data_a6de
    call call_a874
    ld hl, data_adf7
    inc [hl]
    jr nz, .jr_a4fe

    ld [hl], $ff

.jr_a4fe
    xor a
    ld [$0000], a
    ret


.jr_a503
    ld c, $02
    ld hl, data_adf5
    ld a, [$c86d]
    or a
    jr nz, .jr_a511

    ld c, $03
    inc hl

.jr_a511
    push hl
    trap AwaitFrame
    ld a, c
    call call_af25
    pop hl
    ld a, $0a
    ld [$0000], a
    inc [hl]
    jr nz, .jr_a523

    ld [hl], $ff

.jr_a523
    xor a
    ld [$0000], a
    ret


data_a528:
    dh "バトル　スタート！！\0"
    dk "START!!\0"


call_a53d:
    ld a, [$c9aa]
    ld hl, $c9a9
    ld [hl], a
    ld a, $0a
    call call_a7cb
    call call_ae53
    jr c, .jr_a55b

    ld a, $0a
    call call_a7c2
    call call_ae53
    ret nc

    ld a, [hl]
    xor $01
    ld [hl], a

.jr_a55b
    scf
    ret


call_a55d:
    ld a, [$c9aa]
    ld [$c9a9], a
    ld a, $09
    call call_a7c2
    call call_ae6e
    ld d, a
    ld a, $09
    call call_a7cb
    call call_ae6e
    ld e, a
    add d
    jr nc, .jr_a57a

    ld a, $ff

.jr_a57a
    call call_ae5c
    cp d
    jr nc, .jr_a587

    ld hl, $c9a9
    ld a, [hl]
    xor $01
    ld [hl], a

.jr_a587
    ret


call_a588:
    call call_a7e1
    call call_a83f
    ld hl, data_a6a8
    call call_a874
    call call_a8b3

call_a597:
    xor a
    ld [$c9ab], a
    call call_adfd
    jr c, .jr_a5b4

    call call_a7ed
    call call_a83f
    ld hl, data_a68b
    call call_a874
    call call_a76e
    call call_a898
    or a
    ret


.jr_a5b4
    ld a, $0a
    call call_a7c2
    srl a
    srl a
    call call_ae5c
    ld d, a
    ld a, $09
    call call_a7c2
    srl a
    add d
    ld d, a
    ld a, $08
    call call_a7c2
    add d
    ld d, a
    ld a, $0a
    call call_a7cb
    srl a
    srl a
    call call_ae5c
    ld e, a
    ld a, $09
    call call_a7cb
    srl a
    srl a
    add e
    ld e, a
    ld a, $07
    call call_a7cb
    add e
    jr nc, .jr_a5f3

    ld a, $ff

.jr_a5f3
    ld e, a
    srl e
    srl e
    srl e
    sub e
    call call_ae6e
    ld e, a
    xor a
    ld [$c9ad], a
    ld a, $0a
    call call_a7cb
    srl a
    call call_ae5c
    ld c, a
    ld a, $09
    call call_a7cb
    srl a
    srl a
    add c
    call call_ae53
    jr nc, .jr_a637

    srl d
    push de
    ld a, e
    sub d
    jr c, .jr_a636

    cp $05
    jr c, .jr_a636

    ld hl, data_a69b
    call call_a874
    call call_a8b3
    ld a, $01
    ld [$c9ad], a

.jr_a636
    pop de

.jr_a637
    ld a, e
    sub d
    jr z, .jr_a63d

    jr nc, .jr_a641

.jr_a63d
    trap RandNext

.jr_a63f
    and $03

.jr_a641
    ld [$c9ab], a
    push af
    or a
    jr nz, .jr_a64d

    ld hl, data_a6c2
    jr .jr_a653

.jr_a64d
    call call_a869
    ld hl, data_a6b2

.jr_a653
    call call_a874
    call call_a8b3
    pop af
    call call_a7f9
    push af
    call call_a814
    call call_a76e
    pop af

.jr_a665
    jr z, .jr_a66c

    call call_a898
    or a
    ret


.jr_a66c
    call call_a898
    call call_a7ed
    call call_a83f
    ld hl, data_a6d4
    call call_a874
    scf
    ret


data_a67d:
    dk "の　せんせいこうげき！\0"
data_a68b:
    dk "は　すばやく　みをかわした\0"
data_a69b:
    dk "かいしんのいちげき！\0"
data_a6a8:
    dk "の　こうげき！\0"
data_a6b2:
    dh "ポイントのダメージ\0"
data_a6c2:
    dh "ダメージを　あたえられない\0"
data_a6d4:
    dk "は　ちからつきた\0"
data_a6de:
    dk "じかんぎれ　ひきわけです\0"


layout_a6ef:
    dk $01, $0b, "ＨＰ\0"
    dk $0b, $0b, "ＨＰ\0"
    db $ff


call_a6fa:
    ld hl, data_adee
    ld c, [hl]
    ld hl, $0002

.jr_a701
    add hl, hl
    dec c
    jr nz, .jr_a701

    push hl
    ld bc, data_adf5
    ld a, [bc]
    inc bc
    ld l, a
    ld h, $00
    add hl, hl
    ld a, [bc]
    inc bc
    ld e, a
    ld d, h
    add hl, de
    ld a, [bc]
    ld e, a
    add hl, de
    pop de
    ld a, h
    cp d
    jr nz, .jr_a71e

    ld a, l
    cp e

.jr_a71e
    jr nc, .jr_a722

    or a
    ret


.jr_a722
    call call_a898
    ld hl, $c862
    call call_a83f
    ld hl, data_a75f
    call call_a874
    ld a, $37
    call call_af4c

.jr_a736
    trap AwaitFrame
    trap InputButtons
    and $0f
    jr z, .jr_a736

    call call_a93d
    ld hl, $c86e
    ld a, $05
    add [hl]
    ld [hl], a
    ld a, $01
    call call_af25
    call call_a99c
    ld a, $0a
    ld [$0000], a
    ld hl, data_adee
    inc [hl]
    xor a
    ld [$0000], a
    scf
    ret


data_a75f:
    dk "は　レベルアップ！！\0"


call_a76e:
    ld a, [$c9ab]
    or a
    jr z, .jr_a78b

    ld bc, $0510
    ld a, [$c9a9]
    or a
    jr z, .jr_a780

    ld bc, $0331

.jr_a780
    ld a, [$c9ad]
    or a
    jr z, .jr_a787

    ld b, c

.jr_a787
    ld a, b
    call call_af4c

.jr_a78b
    ld c, $5a

.jr_a78d
    push bc
    trap AwaitFrame
    trap InputButtons
    call call_a79a
    pop bc
    dec c
    jr nz, .jr_a78d

    ret


call_a79a:
    ld a, [$c9ab]
    or a
    ret z

    ld a, c
    cp $32
    jr nc, .jr_a7ac

    xor a
    ldh [$ff9b], a
    ldh [$ff9a], a
    jp jp_aed5


.jr_a7ac
    and $07
    ret nz

    call call_aee7
    ld a, [$c9a9]
    or a
    jr nz, .jr_a7bb

    jp jp_aed8


.jr_a7bb
    ld a, d
    ldh [$ff9b], a
    ld a, e
    ldh [$ff9a], a
    ret


call_a7c2:
    push bc
    ld c, a
    ld a, [$c9a9]
    xor $01
    jr call_a7cb.jr_a7d0


call_a7cb:
    push bc
    ld c, a
    ld a, [$c9a9]

.jr_a7d0
    ld b, $00
    push hl
    ld hl, $c862
    or a
    jr z, .jr_a7dc

    ld hl, $c902

.jr_a7dc
    add hl, bc
    ld a, [hl]
    pop hl
    pop bc
    ret


call_a7e1:
    ld hl, $c862
    ld a, [$c9a9]
    or a
    ret z

    ld hl, $c902
    ret


call_a7ed:
    ld hl, $c902
    ld a, [$c9a9]
    or a
    ret z

    ld hl, $c862
    ret


call_a7f9:
    push hl
    push af
    ld hl, $c86d
    ld a, [$c9a9]
    or a
    jr nz, .jr_a807

    ld hl, $c90d

.jr_a807
    pop af
    cpl
    inc a
    add [hl]
    bit 7, a
    jr z, .jr_a810

    xor a

.jr_a810
    ld [hl], a
    pop hl
    or a
    ret


call_a814:
    ld hl, $c86d
    ld d, $04
    call call_a821
    ld hl, $c90d
    ld d, $0e
call_a821:
    ld a, [hl]
    ld b, d
    ld c, $0b
    jp call_a320


call_a828:
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
    trap TileLoadText
    ret


call_a83f:
    push hl
    ld hl, $c85c
    ld d, [hl]
    inc hl
    ld e, [hl]
    ld bc, $0501
    ld hl, $0100
    ld a, [$c9a7]
    push af
    trap $59
    pop af
    pop hl
    ld d, a
    ld e, $01
    ld c, $05
    trap TileLoadText
    ld a, d
    add $05
    ld [$c9a7], a
    ld hl, $c85c
    ld a, $05
    add [hl]
    ld [hl], a
    ret


call_a869:
    ld e, a
    ld d, $00
    ld hl, $c83c
    trap StrConvInt
    ld hl, $c83f

call_a874:
    push hl
    ld hl, $c85c
    ld d, [hl]
    inc hl
    ld e, [hl]
    trap $57
    ld c, l
    ld b, h
    pop hl
    ld a, [$c9a7]
    ld d, a
    ld e, $01
    trap $5b
    ld a, [$c9a7]
    sub d
    cpl
    inc a
    ld hl, $c85c
    add [hl]
    ld [hl], a
    ld a, d
    ld [$c9a7], a
    ret


call_a898:
    ld a, $7f
    ld de, $010e
    ld bc, $1203
    ld hl, $0000
    trap $59
    ld a, $ca
    ld [$c9a7], a
    ld hl, $c85c
    ld [hl], $01
    inc hl
    ld [hl], $0e
    ret


call_a8b3:
    ld hl, $c85c
    ld [hl], $01
    inc hl
    inc [hl]
    ret


call_a8bb:
    ld de, $c3b2
    ld hl, $c86f
    ld bc, $0003
    trap MemCopy
    xor a
    ld [$c9aa], a
    ld hl, $c860
    ld [hl], IR_ID0
    inc hl
    ld [hl], IR_ID1
    xor a
    ld [$c85f], a

.jr_a8d6
    ld hl, $c85f
    inc [hl]
    ld a, [hl]
    cp $03
    jr nc, .jr_a933

    trap IRListen
    jr nc, .jr_a920

.jr_a8e3
    trap AwaitFrame
    ldh a, [$ff8a]
    and $02
    jr nz, .jr_a8e3

    ld hl, $c860
    ld de, $c600
    push de
    ld c, $02
    trap IRRead
    pop hl
    jr c, .jr_a8d6

    ld a, [hl+]
    cp IR_ID0
    jr nz, .jr_a933

    ld a, [hl]
    cp IR_ID1
    jr nz, .jr_a933

    ld hl, $c862
    ld de, $c902
    ld c, $a0
    push hl
    push de
    trap IRRead
    pop de
    pop hl
    jr c, .jr_a8d6

    ld c, $a0
    trap IRWrite
    jr c, .jr_a8d6

    trap IRClose
    jr c, .jr_a8d6

    or a
    jr .jr_a934

.jr_a920
    ld de, $c90f
    ld hl, $c3b2
    ld bc, $0003
    trap MemCopy
    ld a, $01
    ld [$c9aa], a
    or a
    jr .jr_a934

.jr_a933
    scf

.jr_a934
    push af
    ld hl, $c860
    xor a
    ld [hl+], a
    ld [hl], a
    pop af
    ret


call_a93d:
    ld hl, data_ade7
    ld a, [hl+]
    or a
    jr z, .jr_a986

    ld de, $c862
    ld c, $10

.jr_a949
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, .jr_a949

    ld hl, data_adf8
    ld de, $c9a2
    ld c, $05

.jr_a957
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, .jr_a957

    ld a, [$c9ac]
    or a
    jr nz, .jr_a97b

    ld a, [$c867]
    call call_b2b1
    ld hl, $c872
    ld c, $90

.jr_a96e
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, .jr_a96e

    ldh a, [$ff8a]
    and $04
    cp $04
    ret nz

.jr_a97b
    xor a
    ld [$c9ac], a
    ld a, $01
    call call_af25
    jr call_a99c

.jr_a986
    ld hl, $c862
    ld c, $05
    ld a, $20

.jr_a98d
    ld [hl+], a
    dec c
    jr nz, .jr_a98d

    ld a, $01
    call call_af25

.jr_a996
    call call_aa58
    call call_a9cc

call_a99c:
    call call_ab98
    jr c, call_a93d.jr_a996

    ld a, $0a
    ld [$0000], a
    ld hl, data_ade7
    ld de, $c862
    ld [hl], $01
    inc hl
    ld c, $0d

.jr_a9b1
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, .jr_a9b1

    inc hl
    inc hl
    inc hl
    ld de, $c9a2
    ld c, $05

.jr_a9bf
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, .jr_a9bf

    xor a
    ld [$0000], a
    jp call_a93d


call_a9cc:
    ld hl, data_ade8
    ld de, $c862
    ld c, $05

.jr_a9d4
    ld a, [de]
    inc de
    cp [hl]
    inc hl
    jr nz, .jr_a9de

    dec c
    jr nz, .jr_a9d4

    ret


.jr_a9de
    ld a, $0a
    ld [$0000], a
    ld hl, data_adf5
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld hl, data_ade8
    ld de, $c862
    ld c, $05

.jr_a9f2
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, .jr_a9f2

    xor a
    ld [$0000], a
    ld a, $01
    ld [$c868], a
    ld hl, $c862
    ld de, $c3b2
    ld a, [hl+]
    add [hl]
    inc hl
    ld [de], a
    inc de
    ld a, [hl+]
    add [hl]
    inc hl
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    trap RandNext
    and $0f
    ld [$c867], a

.jr_aa1a
    ld hl, $c9a2
    ld c, $04
    ld b, $00

.jr_aa21
    ld a, $0a
    call call_ae6e
    ld [hl+], a
    add b
    ld b, a
    dec c
    jr nz, .jr_aa21

    ld a, $32
    sub b
    jr z, .jr_aa1a

    jr c, .jr_aa1a

    ld [hl], a

.jr_aa34
    ld hl, $c9a2
    ld de, $c869
    ld c, $04
    ld b, $00

.jr_aa3e
    ld a, $0a
    call call_ae6e
    add [hl]
    inc hl
    ld [de], a
    inc de
    add b
    ld b, a
    dec c
    jr nz, .jr_aa3e

    ld a, $64
    sub b
    jr z, .jr_aa34

    jr c, .jr_aa34

    ld [de], a
    inc de
    xor a
    ld [de], a
    ret


call_aa58:
    call call_ae89
    ld de, $c800
    trap $51
    ld de, $420d
    ld hl, $c600
    trap KbdInit
    ld hl, data_aa9f
    ld de, $8001
    trap $5a
    ld de, $0705
    ld bc, $0703
    trap DrawBox
    ld a, $3d
    ld de, $0806
    ld bc, $0501

.jr_aa80
    ld hl, $0100
    trap $59
    ld a, $03
    trap LCDEnable
    ld de, $3d01
    ld b, $05
    ld hl, $c862
    ld a, b
    trap StrTrim
    ld c, a
    trap KbdEdit
    ldh a, [$ff8a]
    and $04
    ret z

    jp Main.jp_a169


data_aa9f:
    dh $03, $00, "ＫＩＳＳ　ＭＯＮＳＴＥＲ２\0"
    dh $04, $02, "モンスターの　なまえを\0"
    dk $04, $03, "にゅうりょくしてください\0"
    dh $04, $09, "なまえを　へんこうすると\0"
    dh $04, $0a, "きろくは　クリアされます\0"
    dh $03, $0b, "ＳＴＡＲＴ：なまえのけってい\0"
    dh $02, $0c, "»ＳＥＬＥＣＴ：メニューへもどる\0"
    db $ff


call_ab17:
    trap LCDDisable
    ld a, [$c867]
    call call_b2b1
    ld hl, $c700
    ld bc, $0090
    push hl
    push de
    trap MemCopy
    call call_af4f
    pop de
    pop hl
    push hl
    push de
    ld c, $90

.jr_ab32
    ld a, [de]
    inc de
    cp [hl]
    jr nz, .jr_ab40

    inc hl
    dec c
    jr nz, .jr_ab32

    pop de
    pop hl
    jp call_ab98


.jr_ab40
    pop hl
    pop de
    ld a, $0a
    ld [$0000], a
    ld bc, $0090
    trap MemCopy
    xor a
    ld [$0000], a
    ld hl, $c700
    ld c, $30

.jr_ab55
    push hl
    push bc
    push hl
    ld de, $0030
    ld b, [hl]
    add hl, de
    ld c, [hl]
    push bc
    add hl, de
    ld b, [hl]
    ld c, $00
    pop de
    ld a, $04

.jr_ab66
    srl d
    rr e
    rr b
    rr c
    dec a
    jr nz, .jr_ab66

    pop hl
    push bc
    ld bc, $0030
    ld [hl], d
    add hl, bc
    ld [hl], e
    pop de
    add hl, bc
    ld [hl], d
    add hl, bc
    ld [hl], e
    pop bc
    pop hl
    inc hl
    dec c
    jr nz, .jr_ab55

    ld a, $0a
    ld [$0000], a
    ld de, $c700
    ld hl, Header.icon
    ld bc, Header.end - Header.icon
    trap MemCopy
    xor a
    ld [$0000], a

call_ab98:
    ld a, $20
    trap DrawInit
    xor a
    ld de, $0400
    ld bc, $0501
    ld hl, $0100
    trap $59
    ld hl, $c862
    ld de, $0001
    ld c, $05
    trap TileLoadText
    ld hl, layout_accf
    trap DrawLayout
    call call_abef
    ld a, $03
    trap LCDEnable
    xor a
    ld [$c85d], a
    call call_acbe
    call call_ac06

.jr_abc8
    trap AwaitFrame
    trap InputButtons
    call call_ac27
    ldh a, [$ff8b]
    bit 2, a
    jr z, .jr_abd8

    jp call_ab17


.jr_abd8
    bit 1, a
    jr nz, .jr_abed

    and $09
    jr z, .jr_abc8

    ld a, [$c86e]
    or a
    jr nz, .jr_abc8

    ld a, [$c86d]
    or a
    jr z, .jr_abc8

    ret


.jr_abed
    scf
    ret


call_abef:
    ld a, [$c867]
    ld hl, $9100
    call call_b2a6
    ld a, $10
    ld hl, $0301
    ld bc, $0303
    ld de, $0000
    trap $59
    ret


call_ac06:
    ld bc, $0f05
    ld hl, $c869
    ld de, $c9a2

.jr_ac0f
    ld a, [de]
    inc de
    ld b, $0a
    call call_a320
    ld b, $0f
    ld a, [hl+]
    call call_a320
    inc c
    ld a, c
    cp $0a
    jr c, .jr_ac0f

    ld a, [hl+]
    call call_a320
    ret


call_ac27:
    ldh a, [$ffb6]
    ld b, a
    and $c0
    jr z, .jr_ac51

    call call_acba
    ld hl, $c85d
    ld a, [hl]
    bit 6, b
    jr z, .jr_ac42

    dec a
    bit 7, a
    jr z, .jr_ac4c

    ld a, $05
    jr .jr_ac4c

.jr_ac42
    bit 7, b
    jr z, .jr_ac51

    inc a
    cp $06
    jr c, .jr_ac4c

    xor a

.jr_ac4c
    ld [hl], a
    xor a
    ld [$c85e], a

.jr_ac51
    ldh a, [$ffb6]
    ld b, a
    and $30
    jr z, .jr_acae

    ld a, $01
    call call_af4c
    ld a, [$c85d]
    or a
    jr z, .jr_ac95

    dec a
    ld e, a
    ld d, $00
    ld hl, $c9a2
    add hl, de
    ld c, [hl]
    ld hl, $c869
    add hl, de
    ld e, [hl]
    ld a, [$c86e]
    ld d, a
    ld a, b
    and $10
    jr z, .jr_ac80

    inc d
    dec d
    jr z, .jr_ac80

    dec d
    inc e

.jr_ac80
    ld a, b
    and $20
    jr z, .jr_ac8b

    ld a, e
    cp c
    jr z, .jr_ac8b

    inc d
    dec e

.jr_ac8b
    ld [hl], e
    ld a, d
    ld [$c86e], a
    call call_ac06
    jr .jr_acae

.jr_ac95
    ld hl, $c867
    ld c, [hl]

.jr_ac99
    ld a, b
    and $11
    jr z, .jr_aca1

    inc c
    jr .jr_aca7

.jr_aca1
    ld a, b
    and $22
    jr z, .jr_acae

    dec c

.jr_aca7
    ld a, c
    and $0f

.jr_acaa
    ld [hl], a
    call call_abef

.jr_acae
    ld hl, $c85e
    ld a, [hl]
    inc [hl]
    and $0f
    ret nz

    bit 4, [hl]
    jr z, call_acbe

call_acba:
    ld a, $20
    jr call_acbe.jr_acc0

call_acbe:
    ld a, $3e

.jr_acc0
    push af
    ld a, [$c85d]
    add $04
    ld l, a
    ld h, $01
    trap DrawAt
    pop af
    trap DrawChar
    ret


layout_accf:
    dk $09, $00, "の　とくちょうを\0"
    dh $04, $01, "せっていしてください\0"
    dh $0a, $03, "きほん　ごうけい\0"
    dh $03, $04, "しゅるい\0"
    dh $03, $05, "こうげき\0"
    dh $03, $06, "ぼうぎょ\0"
    dh $03, $07, "すばやさ\0"
    dh $03, $08, "うんのよさ\0"
    dh $03, $09, "ＨＰ\0"
    dh $03, $0a, "あまり\0"
    dh $0b, $0a, "－－\0"
    dk $00, $0c, "あまりが０になるように　じゅうじキーを\0"
    dh $00, $0d, "つかって　すうちを　けっていしてください\0"
    dh $00, $0f, "ＳＴＡＲＴ，Ａ：せってい　しゅうりょう\0"
    dh $06, $10, "Ｂ：なまえへんこう\0"
    dh $01, $11, "ＳＥＬＥＣＴ：モンスターデザイン\0"
    db $ff


call_ad9a:
    ld hl, $c83c
    push hl
    ld de, $ff46
    ld bc, $000a
    trap CRAMRead
    pop hl
    ld de, data_addd
    ld b, $0a

.jr_adac
    ld a, [de]
    inc de
    cp [hl]
    inc hl
    jr nz, .jr_adb7

    dec b
    jr nz, .jr_adac

    or a
    ret


.jr_adb7
    ld a, $0a
    ld [$0000], a
    ld hl, $c83c
    ld de, data_addd
    ld b, $0a

.jr_adc4
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, .jr_adc4

    ld hl, data_ade7
    ld [hl], $00
    inc hl
    xor a
    ld b, $10

.jr_add3
    ld [hl+], a
    dec b
    jr nz, .jr_add3

    xor a
    ld [$0000], a
    scf
    ret


data_addd:
    ds 10, $00  ; player name
data_ade7:      ;
    db $00      ; initialized?
data_ade8:      ;
    ds 5, $00   ; monster name
    db $00      ; unknown
data_adee:      ;
    db $00      ; level
    db $00      ; attack
    db $00      ; defense
    db $00      ; speed
    db $00      ; luck
    db $00      ; hp
    db $00      ; unknown
data_adf5:      ;
    db $00      ; wins
    db $00      ; losses
data_adf7:      ;
    db $00      ; ties
data_adf8:      ;
    ds 5, $00   ; unknown


call_adfd:
    ld a, $0a
    call call_a7cb
    add a
    call call_ae53
    jr c, .jr_ae24

    ld a, $0a
    call call_a7c2
    add a
    call call_ae53
    jr c, .jr_ae26

    call call_ae28
    ld d, a
    call call_ae28
    ld e, a
    sub d
    jr c, .jr_ae24

    ld e, a
    trap RandNext
    cp e
    jr c, .jr_ae26

.jr_ae24
    scf
    ret


.jr_ae26
    or a
    ret


call_ae28:
    push hl
    ld a, $0d
    call call_a7cb
    ld h, a
    ld a, $09
    call call_a7cb
    ld l, a
    ld a, $0a
    call call_a7cb
    srl a
    add l
    jr nc, .jr_ae41

    ld a, $ff

.jr_ae41
    call call_ae6e
    sub h
    jr nc, .jr_ae48

    xor a

.jr_ae48
    push af
    ld hl, $c9a9
    ld a, [hl]
    xor $01
    ld [hl], a
    pop af
    pop hl
    ret


call_ae53:
    push hl
    push de
    ld e, a
    trap RandNext
    cp e
    pop de
    pop hl
    ret


call_ae5c:
    push hl
    push de
    push bc
    ld e, a
    ld d, $00
    trap RandNext
    ld l, a
    ld h, $00
    trap MathMul16
    ld a, h
    pop bc
    pop de
    pop hl
    ret


call_ae6e:
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
    trap MathMul16
    ld a, h
    pop bc
    pop de
    pop hl
    ret


call_ae89:
    ld a, $20
    trap DrawInit
    ld h, $04
    trap $ca
    ld a, $e4
    ldh [$ff9c], a
    ldh [$ff9d], a
    ret


call_ae98:
    ld hl, $c862
    ld de, $c004
    call call_a828
    ld de, $c50e
    ld hl, $c902
    call call_a828
    ld hl, layout_a6ef
    trap DrawLayout
    call call_a814
    ld de, $c872
    ld hl, $8800
    ld bc, $0090
    trap MemCopy
    ld de, $c912
    ld hl, $8000
    ld bc, $0090
    trap MemCopy
    ld a, $80
    ld hl, $0301
    ld bc, $0303
    ld de, $0406
    trap $59

jp_aed5:
    ld de, $0000

jp_aed8:
    ld a, $78
    add d
    ld d, a
    ld a, $40
    add e
    ld e, a

call_aee0:
    xor a
    ld hl, data_aef6
    trap $60
    ret


call_aee7:
    trap RandNext
    and $02
    sub $01
    ld d, a
    trap RandNext
    and $02
    sub $01
    ld e, a
    ret


data_aef6:
    db 9
    db  0,  0, $06, OAMF_XFLIP
    db  8,  0, $07, OAMF_XFLIP
    db 16,  0, $08, OAMF_XFLIP
    db  0,  8, $03, OAMF_XFLIP
    db  8,  8, $04, OAMF_XFLIP
    db 16,  8, $05, OAMF_XFLIP
    db  0, 16, $00, OAMF_XFLIP
    db  8, 16, $01, OAMF_XFLIP
    db 16, 16, $02, OAMF_XFLIP

data_af1b:
    db $07, $06, $1b, $19, $03
data_af20:
    db $07, $02, $0f, $0e, $12

call_af25:
    push hl
    push de
    push bc
    ld e, a
    ld d, $00
    ld a, [CartridgeCodeAddr]
    ld hl, data_af1b
    cp CART_BDAMAN
    jr z, .jr_af44

    cp CART_MINIGAME
    jr z, .jr_af44

    ld hl, data_af20
    cp CART_POKEBOM
    jr z, .jr_af44

    pop bc
    pop de
    pop hl
    ret


.jr_af44
    add hl, de
    ld a, [hl]
    trap AudioPlayMusic
    pop bc
    pop de
    pop hl
    ret


call_af4c:
    trap AudioPlaySound
    ret


call_af4f:
    ld a, $20
    trap DrawInit
    ld hl, $0301
    trap $b6
    call call_b1a8
    call call_b154
    ld a, $63
    trap LCDEnable

.jr_af62
    trap AwaitFrame
    ld bc, $2800
    trap $c4
    trap InputButtons
    call call_afa6
    ldh a, [$ff8b]
    bit 2, a
    jr nz, .jr_af7c

    call call_af87
    call call_b0b9
    jr .jr_af62

.jr_af7c
    ldh a, [$ff9b]
    ld [$c9ba], a
    ldh a, [$ff9a]
    ld [$c9bb], a
    ret


call_af87:
    ldh a, [$ff8b]
    bit 3, a
    ret z

    ld hl, $c9bc
    inc [hl]

call_af90:
    ld a, [$c9bc]
    ld de, data_b246
    and $01
    jr z, .jr_af9d

    ld de, data_b286

.jr_af9d
    ld hl, $9000
    ld bc, $0010
    trap MemCopy
    ret


call_afa6:
    ldh a, [$ffb6]
    ld b, a
    and $f0
    jr z, .jr_afe1

    bit 6, b
    jr z, .jr_afb6

    call call_b014
    jr .jr_afcf

.jr_afb6
    bit 7, b
    jr z, .jr_afbf

    call call_b034
    jr .jr_afcf

.jr_afbf
    bit 5, b
    jr z, .jr_afc8

    call call_b056
    jr .jr_afcf

.jr_afc8
    bit 4, b
    jr z, .jr_afcf

    call call_b076

.jr_afcf
    call call_b098
    ldh a, [$ff8a]
    and $03
    jr z, .jr_afe1

    call call_b121
    ld a, [$c9b9]
    call call_b0d5

.jr_afe1
    ld hl, $c9b8
    ld a, [hl]
    ld c, a
    inc [hl]
    bit 4, c
    ret nz

    ldh a, [$ff9b]
    ld d, a
    ldh a, [$ff9a]
    ld e, a
    ld hl, $c300
    ld a, [$c9b7]
    inc a
    inc a
    add a
    add a
    add a
    sub e
    ld [hl+], a
    ld a, [$c9b6]
    inc a
    add a
    add a
    add a
    sub d
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl], a
    ret


call_b00a:
    ld [hl], a
    add a
    add a
    add a
    ld e, a
    xor a
    ld [$c9b8], a
    ret


call_b014:
    ld hl, $c9b7
    ld a, [hl]
    dec a
    bit 7, a
    jr z, .jr_b01e

    xor a

.jr_b01e
    call call_b00a
    ldh a, [$ff9a]
    or a
    jr z, .jr_b033

    ld d, a
    sub e
    cpl
    inc a
    cp $20
    jr nc, .jr_b033

    ld a, d
    sub $08
    ldh [$ff9a], a

.jr_b033
    ret


call_b034:
    ld hl, $c9b7
    ld a, [hl]
    inc a
    cp $18
    jr c, .jr_b03f

    ld a, $17

.jr_b03f
    call call_b00a
    ldh a, [$ff9a]
    cp $50
    jr nc, .jr_b055

    ld d, a
    sub e
    cpl
    inc a
    cp $50
    jr c, .jr_b055

    ld a, d
    add $08
    ldh [$ff9a], a

.jr_b055
    ret


call_b056:
    ld hl, $c9b6
    ld a, [hl]
    dec a
    bit 7, a
    jr z, .jr_b060

    xor a

.jr_b060
    call call_b00a
    ldh a, [$ff9b]
    or a
    jr z, .jr_b075

    ld d, a
    sub e
    cpl
    inc a
    cp $20
    jr nc, .jr_b075

    ld a, d
    sub $08
    ldh [$ff9b], a

.jr_b075
    ret


call_b076:
    ld hl, $c9b6
    ld a, [hl]
    inc a
    cp $18
    jr c, .jr_b081

    ld a, $17

.jr_b081
    call call_b00a
    ldh a, [$ff9b]
    cp $20
    jr nc, .jr_b097

    ld d, a
    sub e
    cpl
    inc a
    cp $80
    jr c, .jr_b097

    ld a, d
    add $08
    ldh [$ff9b], a

.jr_b097
    ret


call_b098:
    ld a, [$c9b6]
    ld l, $22
    call call_b0a5
    ld a, [$c9b7]
    ld l, $23

call_b0a5:
    push hl
    ld e, a
    ld d, $00
    ld hl, $c9ae
    trap StrConvInt
    pop hl
    ld h, $08
    trap DrawAt
    ld hl, $c9b2
    trap DrawString
    ret


call_b0b9:
    ldh a, [$ff8b]
    ld e, a
    and $03
    ret z

    push de
    call call_b121
    pop de
    bit 0, e
    jr z, .jr_b0c9

    inc a

.jr_b0c9
    bit 1, e
    jr z, .jr_b0d0

    ld a, [$c9b9]

.jr_b0d0
    and $03
    ld [$c9b9], a

call_b0d5:
    ld d, a
    ld e, c
    bit 0, d
    jr nz, .jr_b0dd

    ld e, $00

.jr_b0dd
    ld a, [hl]
    and b
    or e
    ld [hl+], a
    ld e, c
    bit 1, d
    jr nz, .jr_b0e8

    ld e, $00

.jr_b0e8
    ld a, [hl]
    and b
    or e
    ld [hl-], a
    ld e, l
    ld d, h
    ld h, $91
    ld bc, $0002
    trap MemCopy
    ld a, [$c9b7]
    ld h, a
    ld l, $00
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld a, [$c9b6]
    or l
    ld l, a
    ld de, $9800
    add hl, de
    ld de, $c9b9
    ld bc, $0001
    trap MemCopy
    ret


data_b119:
    db $80, $40, $20, $10, $08, $04, $02, $01


call_b121:
    ld a, [$c9b6]
    and $07
    ld e, a
    ld d, $00
    ld hl, data_b119
    add hl, de

.jr_b12d
    ld a, [hl]
    ld c, a
    cpl
    ld b, a
    ld a, [$c9b6]
    and $f8
    add a
    ld l, a
    add a
    add l
    ld l, a
    ld a, [$c9b7]
    add a
    add l
    ld l, a
    ld h, $c7
    inc hl
    ld d, $00
    ld a, [hl-]
    and c
    jr z, .jr_b14b

    inc d

.jr_b14b
    sla d
    ld a, [hl]
    and c
    jr z, .jr_b152

    inc d

.jr_b152
    ld a, d
    ret


call_b154:
    xor a
    ld hl, $c9b6
    ld d, [hl]
    ld [hl+], a
    ld e, [hl]
    ld [hl-], a
    push de
    ld hl, $9800
    ld bc, $0400

.jr_b163
    push hl
    call call_b121
    pop hl
    ld [hl+], a
    ld de, $c9b6
    ld a, [de]
    inc a
    ld [de], a
    cp $20
    jr c, .jr_b163

    xor a
    ld [de], a
    ld de, $c9b7
    ld a, [de]
    inc a
    ld [de], a
    cp $20
    jr c, .jr_b163

    pop de
    ld hl, $c9b6
    ld [hl], d
    inc hl
    ld [hl], e
    ret


call_b187:
    xor a
    ld [$c9ba], a
    ld [$c9bb], a
    ld [$c9b6], a
    ld [$c9b7], a
    ld hl, $c700
    ld bc, $0100
    ld e, $00
    trap MemSet
    xor a
    ld [$c9bc], a
    ld a, $03
    ld [$c9b9], a
    ret


call_b1a8:
    ld a, $e4
    ldh [$ff9d], a
    ld a, $07
    ldh [$ffa0], a
    ld a, $70
    ldh [$ff9f], a
    ld a, [$c9ba]
    ldh [$ff9b], a
    ld a, [$c9bb]
    ldh [$ff9a], a
    call call_b1e3
    call call_af90
    ld de, data_b246 + $10
    ld hl, $9010
    ld bc, $0030
    trap MemCopy
    ld de, data_b296
    ld hl, $8000
    ld bc, $0010
    trap MemCopy
    ld hl, data_b1ef
    trap DrawLayout
    call call_b098
    ret


call_b1e3:
    ld hl, $9100
    ld de, $c700
    ld bc, $0100
    trap MemCopy
    ret


data_b1ef:
    dk $00, $20, "--------------------\0"
    dk $00, $21, " psv  MONSTER EDIT\0"
    dk $00, $22, " qtw  X=   A  :SET\0"
    dk $00, $23, " rux  Y=   SEL:EXIT\0"

data_b246:
    INCBIN "out/iconedit/shades.2bpp"

data_b286:
    INCBIN "out/iconedit/grid.2bpp"

data_b296:
    INCBIN "out/iconedit/cursor.2bpp"


call_b2a6:
    push hl
    call call_b2b1
    pop hl
    ld bc, $0090
    trap MemCopy
    ret


call_b2b1:
    ld e, a
    ld d, $00
    ld hl, $0090
    trap MathMul16
    ld de, data_b2c0
    add hl, de
    ld e, l
    ld d, h
    ret


data_b2c0:
    INCBIN "out/kissmon/moncroc.2bpp"
    INCBIN "out/kissmon/monocto.2bpp"
    INCBIN "out/kissmon/monmouse.2bpp"
    INCBIN "out/kissmon/monrobo3.2bpp"
    INCBIN "out/kissmon/monrobo2.2bpp"
    INCBIN "out/kissmon/mondora.2bpp"
    INCBIN "out/kissmon/monbird1.2bpp"
    INCBIN "out/kissmon/monfly.2bpp"
    INCBIN "out/kissmon/monpoop.2bpp"
    INCBIN "out/kissmon/monfish2.2bpp"
    INCBIN "out/kissmon/monghost.2bpp"
    INCBIN "out/kissmon/monwolf2.2bpp"
    INCBIN "out/kissmon/monbird2.2bpp"
    INCBIN "out/kissmon/monbird3.2bpp"
    INCBIN "out/kissmon/monwhale.2bpp"
    INCBIN "out/kissmon/monpig.2bpp"

ENDL
