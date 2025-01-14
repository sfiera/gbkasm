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

DEF LAYOUT_CONTINUE_HELP      EQU $00
DEF LAYOUT_SAVE_HELP          EQU $01
DEF LAYOUT_SEND_HELP          EQU $02
DEF LAYOUT_RECV_HELP          EQU $03
DEF LAYOUT_PAGER_HELP         EQU $04
DEF LAYOUT_EXIT_HELP          EQU $05
DEF LAYOUT_NO_SPACE_ERROR     EQU $06
DEF LAYOUT_PAGER_EDIT_HELP    EQU $07
DEF LAYOUT_NOT_SAVED_CONFIRM  EQU $08
DEF LAYOUT_NO_TITLE_ERROR     EQU $09
DEF LAYOUT_OVERWRITE_CONFIRM  EQU $0a
DEF LAYOUT_SAVE_DONE          EQU $0b
DEF LAYOUT_SEND_CONFIRM       EQU $0c
DEF LAYOUT_SENDING            EQU $0d
DEF LAYOUT_XFER_DONE          EQU $0e
DEF LAYOUT_XFER_FAIL          EQU $0f
DEF LAYOUT_XFER_CANCEL        EQU $10
DEF LAYOUT_RECEIVING          EQU $11
DEF LAYOUT_ERASE_CONFIRM      EQU $12
DEF LAYOUT_NO_SPACE_CONFIRM   EQU $13

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
    jp nz, SetUpAndDoKissMailMenu

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
    jp nz, SetUpAndDoKissMailMenu

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
    jr z, .jr_001_5f44

    trap TileLoadText
    jr .jr_001_5f60

.jr_001_5f44
    ld b, e

.jr_001_5f45
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
    jr nz, .jr_001_5f45

.jr_001_5f60
    ret


SetUpAndDoKissMailMenu:
    call Call_001_5ee7
    call Call_001_6501
    ; fall through


DoKissMailMenu:
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
    dw ShowMailLayout - @


ShowMailLayout:
    push af
    call Call_001_652c
    pop af
    add a
    ld c, a
    ld b, $00
    ld hl, MailLayouts
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

    ld a, LAYOUT_NOT_SAVED_CONFIRM
    call ShowMailLayout
    call Call_001_6169
    jr nc, .exit

    jr DoKissMailMenu

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
    ld a, LAYOUT_PAGER_EDIT_HELP
    call ShowMailLayout
    ld a, $03
    trap LCDEnable

.next
    trap AwaitFrame
    trap InputButtons
    bit BTN_UP_F, a
    jr nz, .up

    bit BTN_DN_F, a
    jr nz, .down

    bit BTN_A_F, a
    jr nz, .action

    bit BTN_RT_F, a
    jr nz, .action

    and BTN_B | BTN_SEL
    jr nz, .menu

.jr_001_5fe2
    call Call_001_5f2d
    jr .next

.menu
    pop af
    ldh [$c0], a
    jp SetUpAndDoKissMailMenu


.up
    call Call_001_5ee7

.jr_001_5ff0
    call Call_001_5f21
    ldh a, [$c0]
    or a
    jr z, .jr_001_5ff0

    jr .jr_001_5fe2

.down
    call Call_001_5ee7
    call Call_001_5f15
    jr .jr_001_5fe2

.action
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
    jr .next


KissMailSave:
    ldh a, [$c0]
    push af
    xor a
    ldh [$c0], a

.jr_001_6025
    call Call_001_614f
    or a
    jr nz, .jr_001_6037

    ld a, LAYOUT_NO_TITLE_ERROR
    call ShowMailLayout
    call Call_001_6173
    pop af
    jp KissMailContinue

.jr_001_6037
    inc a
    ld c, a
    ld de, $c6df
    ld a, $81
    ld [de], a
    ld hl, $c500
    ld c, $00
    trap FileSearch
    jr c, .jr_001_6059

    ld a, LAYOUT_OVERWRITE_CONFIRM
    call ShowMailLayout
    call Call_001_6169
    jr c, .jr_001_606b

    ld hl, $c500
    trap FileDelete
    jr .jr_001_6025

.jr_001_6059
    call Call_001_66ab
    ld a, LAYOUT_NO_SPACE_ERROR
    jr c, .jr_001_6065

    xor a
    ldh [$c2], a
    ld a, LAYOUT_SAVE_DONE

.jr_001_6065
    call ShowMailLayout
    call Call_001_6173

.jr_001_606b
    pop af
    ldh [$c0], a
    jp DoKissMailMenu


KissMailSend:
    call Call_001_657f
    ld a, LAYOUT_SEND_CONFIRM
    call ShowMailLayout
    ld a, $03
    trap LCDEnable
    call Call_001_6169
    jp c, SetUpAndDoKissMailMenu

    ld a, LAYOUT_SENDING
    call ShowMailLayout
    ld a, $01
    trap $cc
    trap AwaitBlit
    call Call_001_611d
    jr c, .jr_001_60b0

    ld hl, $c600
    ld e, l
    ld d, h
    ld c, $99
    trap IRWrite
    jr c, .jr_001_60b5

    trap IRClose
    jr c, .jr_001_60b5

    ld a, LAYOUT_XFER_DONE
    call ShowMailLayout

.jr_001_60a7
    xor a
    trap $cc
    call Call_001_6173
    jp SetUpAndDoKissMailMenu


.jr_001_60b0
    call Call_001_6114
    jr .jr_001_60a7

.jr_001_60b5
    call Call_001_6112
    jr .jr_001_60a7


KissMailRecv:
    ldh a, [$c2]
    or a
    jr z, .jr_001_60c9

    ld a, LAYOUT_ERASE_CONFIRM
    call ShowMailLayout
    call Call_001_6169
    jr c, .jr_001_6103

.jr_001_60c9
    ld a, LAYOUT_RECEIVING
    call ShowMailLayout
    trap AwaitBlit
    ld de, IRIdentifier
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
    jr c, .jr_001_610d
    ld a, [$c6d5]
    or a
    jr z, .jr_001_6106

    xor a
    ldh [$c0], a
    call Call_001_5ee7
    call Call_001_5f15
    ld a, LAYOUT_XFER_DONE
    call ShowMailLayout
    ld a, $01
    ldh [$c2], a

.jr_001_6100
    call Call_001_6173

.jr_001_6103
    jp DoKissMailMenu

.jr_001_6106
    ld a, LAYOUT_XFER_FAIL
    call ShowMailLayout
    jr .jr_001_6100

.jr_001_610d
    call Call_001_6112
    jr .jr_001_6100


Call_001_6112:
    ld a, LAYOUT_XFER_CANCEL
    ; fall through

Call_001_6114:
    call ShowMailLayout

.jr_001_6117
    trap InputButtons
    or a
    jr nz, .jr_001_6117

    ret


Call_001_611d:
    ld hl, $c6d5
    ld de, $c400
    ld bc, $000a
    trap IRRead
    jr c, .jr_001_6146

    ld hl, $c400
    ld de, IRIdentifier
    ld bc, $000a
    trap $67  ; strcmp?
    or a
    jr nz, .jr_001_6149

    inc a
    ld hl, $c400
    ld [hl], a
    ld de, $c6d5
    ld bc, $000a
    trap IRWrite
    ret nc

.jr_001_6146
    ld a, $10
    ret

.jr_001_6149
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
    jr z, .jr_001_6160

.jr_001_615a
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, .jr_001_615a

.jr_001_6160
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
    ld hl, LayoutYesNo
    trap $5a
    ; fall through


Call_001_6173:
    trap AwaitFrame
    trap InputButtons
    and BTN_AB
    jr z, Call_001_6173

    or a
    bit 1, a
    ret z

    scf
    ret


Call_001_6181:
    ld b, $11
    ldh a, [$c0]
    or a
    jr nz, .jr_001_618a

    ld b, $0c

.jr_001_618a
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


MailLayouts:
    dw .continueHelp
    dw .saveHelp
    dw .sendHelp
    dw .recvHelp
    dw .pagerHelp
    dw .exitHelp
    dw .noSpaceError
    dw .pagerEditHelp
    dw .notSavedConfirm
    dw .noTitleError
    dw .overwriteConfirm
    dw .saveDone
    dw .sendConfirm
    dw .sending
    dw .xferDone
    dw .xferFail
    dw .xferCancel
    dw .receiving
    dw .eraseConfirm
    dw .noSpaceConfirm

.continueHelp
    dk $01, $0e, "へんしゅうがめんにもどります\0"
    db $ff

.saveHelp
    dk $01, $0e, "いまのぶんしょうをほぞんします\0"
    db $ff

.sendHelp
    dk $01, $0e, "ほかのゲームボーイにぶんしょうを\0"
    dh $01, $0f, "おくります\0"
    db $ff

.recvHelp
    dk $01, $0e, "ほかのゲームボーイからぶんしょうを\0"
    dh $01, $0f, "もらいます\0"
    db $ff

.pagerHelp
    dh $01, $0e, "ポケベルにぶんしょうをおくります\0"
    db $ff

.exitHelp
    dk $01, $0e, "「ＫＩＳＳ　ＭＡＩＬ」を\0"
    dh $01, $0f, "しゅうりょうします\0"
    db $ff

.noSpaceError
    dk $01, $0e, "あきようりょうがたりなくてセーブ\0"
    dk $01, $0f, "できませんでした\0"
    dh $01, $10, "ＯＫ：Ａ\0"
    db $ff

.pagerEditHelp
    dh $01, $0e, "»Ａボタンをおすと１ぎょうごとに\0"
    dh $01, $0f, "はっしんします\0"
    dh $01, $10, "しゅうりょう：Ｂ\0"
    db $ff

.notSavedConfirm
    dh $01, $0e, "セーブされていませんが\0"
    dh $01, $0f, "しゅうりょうしてもいいですか？\0"
    db $ff

.noTitleError
    dh $01, $0e, "タイトルがにゅうりょくされていません\0"
    dh $01, $0f, "にゅうりょくしたあとでもういちど\0"
    dh $01, $10, "セーブしてください\0"
    db $ff

.overwriteConfirm
    dk $01, $0e, "おなじなまえのぶんしょうがあります\0"
    dh $01, $0f, "うわがきしてほぞんしてもいいですか？\0"
    db $ff

.saveDone
    dh $01, $0e, "セーブしました\0"
    dh $01, $0f, "ＯＫ：Ａ\0"
    db $ff

.sendConfirm
    dk $01, $0e, "このぶんしょうをそうしんします\0"
    dh $01, $0f, "じゅんびはいいですか？\0"
    db $ff

.sending
    dk $01, $0e, "つうしんちゅうです\0"
    dh $01, $0f, "ちゅうだんする：Ｂ\0"
    db $ff

.xferDone
    dk $01, $0e, "つうしんがしゅうりょうしました\0"
    dh $01, $0f, "ＯＫ：Ａ\0"
    db $ff

.xferFail
    dk $01, $0e, "「ＫＩＳＳ　ＭＡＩＬ」どうしでないと\0"
    dh $01, $0f, "つうしんできません\0"
    dh $01, $10, "もういちどやりなおしてください\0"
    db $ff

.xferCancel
    dk $01, $0e, "つうしんがちゅうだんされました\0"
    dh $01, $0f, "もういちどやりなおしてください\0"
    dh $01, $10, "ＯＫ：Ａ\0"
    db $ff

.receiving
    dk $01, $0e, "じゅしんたいきちゅうです\0"
    dh $01, $0f, "あいてのそうしんをかいししてください\0"
    db $ff

.eraseConfirm
    dk $01, $0e, "へんしゅうちゅうのぶんしょうが\0"
    dh $01, $0f, "きえてしまいますが、いいですか？\0"
    db $ff

.noSpaceConfirm
    dk $06, $00, "ＫＩＳＳ　ＭＡＩＬ\0"
    dh $01, $0e, "セーブできるようりょうがたりません\0"
    dh $01, $0f, "それでもいいですか？\0"
    db $ff


LayoutYesNo:
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
    jr nz, .jr_001_64ec

    trap $e7
    xor a
    trap $f1
    inc b
    dec b
    ret nz

.jr_001_64ec
    call Call_001_66dc
    ld a, $03
    trap LCDEnable
    ld a, LAYOUT_NO_SPACE_CONFIRM
    call ShowMailLayout
    call Call_001_6169
    jp c, Exit

    trap LCDDisable
    ret


Call_001_6501:
    trap LCDDisable
    call Call_001_66dc
    ld de, ArrowIcon
    ld hl, $9700
    ld bc, $0010
    trap MemCopy
    call Call_001_65db
    ld de, $0204
    ld bc, $1109
    trap DrawBox
    ld hl, LayoutMenu
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


LayoutMenu:
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

.jr_001_65b7
    push bc
    call Call_001_5ee7
    call Call_001_5f15
    pop bc
    dec c
    jr nz, .jr_001_65b7

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

.jr_001_65e1
    ld a, $7f
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, .jr_001_65e1

    ld de, $0101
    ld bc, $1303
    trap DrawBox
    ld a, $80
    ld hl, $0111
    ld de, $0702
    ld bc, $0c01
    trap $59
    ld hl, LayoutEditor
    ld de, $2001
    trap $5a
    ret


LayoutEditor:
    dk $06, $00, "KISS MAIL\0"
    dh $02, $02, "タイトル:\0"
    db $ff


IRIdentifier:
    dk $00, "KISS-MAIL"
