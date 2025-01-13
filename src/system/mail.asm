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

SECTION "Kiss Mail Stub", ROMX

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
    jp KissMailStart


SECTION "Kiss Mail Code", ROMX

KissMailStart:
    ld a, $20
    trap DrawInit
    call Call_001_6627
    call Call_001_64d3
    ; fall through


KissMailContinue:
    call Call_001_657f
    ld a, $01
    call Call_001_66c2
    ld de, $470d
    ld hl, $c699
    trap $54
    ld a, $03
    trap LCDEnable
    ; fall through


KissMailHandle:
    trap AwaitFrame
    trap InputButtons
    ld c, a
    and BTN_B | BTN_SEL
    jp nz, DoKissMailMenu

    ld a, c
    and BTN_A | BTN_STA
    jr nz, KissMailEditLine

    bit BTN_UP_F, c
    jr nz, .up

    bit BTN_DN_F, c
    jr nz, .down

    call Call_001_5f2d
    jr KissMailHandle

.up
    call Call_001_5ee7
    call Call_001_5f21
    jr KissMailHandle

.down
    call Call_001_5ee7
    call Call_001_5f15
    jr KissMailHandle


Call_001_5ee7:
    xor a
    ldh [$c1], a
    call Call_001_6181
    ld c, $11
    trap TileLoadText
    ret


KissMailEditLine:
    xor a
    call Call_001_66c2
    call Call_001_6181
    trap $55
    jr c, .done

    ld a, $01
    ldh [$c2], a
    ldh a, [$8a]
    bit BTN_SEL_F, a
    jp nz, DoKissMailMenu

    call Call_001_5f15
    xor a
    ldh [$c1], a

.done
    ld a, $01
    call Call_001_66c2
    jr KissMailHandle


Call_001_5f15:
    ldh a, [$c0]
    inc a
    cp $09
    jr c, .jr_001_5f1e

    ld a, $01

.jr_001_5f1e
    ldh [$c0], a
    ret


Call_001_5f21:
    ldh a, [$c0]
    dec a
    bit 7, a
    jr z, .jr_001_5f2a

    ld a, $08

.jr_001_5f2a
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


DoKissMailMenu:
    call Call_001_5ee7
    call Call_001_6501

.again
    xor a
    ld de, KissMailMenu
    trap InputCursorMenu
    jp c, KissMailContinue

    ld l, a
    ld h, $00
    trap JumpViaTable
    db $06
    dw KissMailContinue - @
    dw KissMailSave - @
    dw KissMailSend - @
    dw KissMailRecv - @
    dw KissMailPager - @
    dw KissMailExit - @

KissMailMenu:
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


KissMailExit:
    ldh a, [$c2]
    or a
    jr z, .exit

    ld a, $08
    call Call_001_5f89
    call Call_001_6169
    jr nc, .exit

    jr DoKissMailMenu.again

.exit
    ; fall through


Exit:
    trap ExitToMenu


KissMailPager:
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
    bit BTN_UP_F, a
    jr nz, jr_001_5fed

    bit BTN_DN_F, a
    jr nz, jr_001_5ffa

    bit BTN_A_F, a
    jr nz, jr_sys_6002

    bit BTN_RT_F, a
    jr nz, jr_sys_6002

    and BTN_B | BTN_SEL
    jr nz, jr_001_5fe7

jr_001_5fe2:
    call Call_001_5f2d
    jr jr_001_5fca

jr_001_5fe7:
    pop af
    ldh [$c0], a
    jp DoKissMailMenu


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

jr_sys_6002:
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


KissMailSave:
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
    jp KissMailContinue


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
    jp DoKissMailMenu.again


KissMailSend:
    call Call_001_657f
    ld a, $0c
    call Call_001_5f89
    ld a, $03
    trap LCDEnable
    call Call_001_6169
    jp c, DoKissMailMenu

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
    jp DoKissMailMenu


jr_001_60b0:
    call Call_001_6114
    jr jr_001_60a7

jr_001_60b5:
    call Call_001_6112
    jr jr_001_60a7


KissMailRecv:
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
    jp DoKissMailMenu.again


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
    and BTN_AB
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

data_01_64c5:
    dh $01, $10, "はい:A いいえ:B\0"
    db $ff

Call_001_64d3:
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
    jp c, Exit

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


Call_001_652c::
    ld de, $000d
    ld bc, $1405
    trap DrawBox
    ret


data_01_6535:
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


Call_001_65c6::
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


data_01_6607:
    dk $06, $00, "KISS MAIL\0"
    dh $02, $02, "タイトル:\0"
    db $ff

data_01_661d:
    dk $00, "KISS-MAIL"
