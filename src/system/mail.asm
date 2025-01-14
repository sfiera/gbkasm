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

DEF TITLE_LEN   EQU 12
DEF BODY_LEN    EQU 17
DEF LINE_COUNT  EQU 9

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
    call DrawMailWindow
    ld a, 1
    call LoadPageTiles
    ld de, $470d
    ld hl, $c699
    trap KbdInit
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

    call UpdateMailUnderline
    jr KissMailHandle

.up
    call RedrawMailLine
    call PrevMailLine
    jr KissMailHandle

.down
    call RedrawMailLine
    call NextMailLine
    jr KissMailHandle


RedrawMailLine:
    xor a
    ldh [$c1], a
    call GetMailLineMetrics
    ld c, BODY_LEN
    trap TileLoadText
    ret


KissMailEditLine:
    xor a
    call LoadPageTiles
    call GetMailLineMetrics
    trap KbdEdit
    jr c, .done

    ld a, $01
    ldh [$c2], a
    ldh a, [$8a]
    bit BTN_SEL_F, a
    jp nz, SetUpAndDoKissMailMenu

    call NextMailLine
    xor a
    ldh [$c1], a

.done
    ld a, 1
    call LoadPageTiles
    jr KissMailHandle


NextMailLine:
    ldh a, [$c0]
    inc a
    cp LINE_COUNT
    jr c, .noWrap

    ld a, 1

.noWrap
    ldh [$c0], a
    ret


PrevMailLine:
    ldh a, [$c0]
    dec a
    bit 7, a
    jr z, .noWrap

    ld a, LINE_COUNT - 1

.noWrap
    ldh [$c0], a
    ret


UpdateMailUnderline:
    ld hl, $ffc1
    ld a, [hl]
    inc [hl]
    and $0f
    ret z

    bit 4, [hl]
    push af
    call GetMailLineMetrics
    ld c, BODY_LEN
    pop af
    jr z, .underline

    trap TileLoadText
    jr .done

.underline
    ld b, e

.next
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
    jr nz, .next

.done
    ret


SetUpAndDoKissMailMenu:
    call RedrawMailLine
    call DrawMailMenu
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
    call DrawHelpBox
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
    call PromptAB
    jr nc, .exit

    jr DoKissMailMenu

.exit
    ; fall through


Exit:
    trap ExitToMenu


KissMailPager:
    call DrawMailWindow
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

.update
    call UpdateMailUnderline
    jr .next

.menu
    pop af
    ldh [$c0], a
    jp SetUpAndDoKissMailMenu

.up
    call RedrawMailLine

.upAgain
    ; In pager mode, the title line is skipped.
    ; So if the line became 0, then go up again.
    call PrevMailLine
    ldh a, [$c0]
    or a
    jr z, .upAgain

    jr .update

.down
    call RedrawMailLine
    call NextMailLine
    jr .update

.action
    call RedrawMailLine
    trap AudioStop
    ld hl, $0400
    trap $b6
    call Call_001_614f
    trap $70
    call NextMailLine
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

.retry
    call Call_001_614f
    or a
    jr nz, .hasTitle

    ld a, LAYOUT_NO_TITLE_ERROR
    call ShowMailLayout
    call AwaitAB
    pop af
    jp KissMailContinue

.hasTitle
    inc a
    ld c, a
    ld de, $c6df
    ld a, $81
    ld [de], a
    ld hl, $c500
    ld c, $00
    trap FileSearch
    jr c, .noSpace

    ld a, LAYOUT_OVERWRITE_CONFIRM
    call ShowMailLayout
    call PromptAB
    jr c, .done

    ld hl, $c500
    trap FileDelete
    jr .retry

.noSpace
    call Call_001_66ab
    ld a, LAYOUT_NO_SPACE_ERROR
    jr c, .wait

    xor a
    ldh [$c2], a
    ld a, LAYOUT_SAVE_DONE

.wait
    call ShowMailLayout
    call AwaitAB

.done
    pop af
    ldh [$c0], a
    jp DoKissMailMenu


KissMailSend:
    call DrawMailWindow
    ld a, LAYOUT_SEND_CONFIRM
    call ShowMailLayout
    ld a, $03
    trap LCDEnable
    call PromptAB
    jp c, SetUpAndDoKissMailMenu

    ld a, LAYOUT_SENDING
    call ShowMailLayout
    ld a, $01
    trap $cc
    trap AwaitBlit
    call SendMail
    jr c, .prompt

    ld hl, $c600
    ld e, l
    ld d, h
    ld c, $99
    trap IRWrite
    jr c, .cancel

    trap IRClose
    jr c, .cancel

    ld a, LAYOUT_XFER_DONE
    call ShowMailLayout

.wait
    xor a
    trap $cc
    call AwaitAB
    jp SetUpAndDoKissMailMenu


.prompt
    call PromptAny
    jr .wait

.cancel
    call ShowCancel
    jr .wait


KissMailRecv:
    ldh a, [$c2]
    or a
    jr z, .ready

    ld a, LAYOUT_ERASE_CONFIRM
    call ShowMailLayout
    call PromptAB
    jr c, .done

.ready
    ld a, LAYOUT_RECEIVING
    call ShowMailLayout
    trap AwaitBlit
    ld de, IRIdentifier
    ld hl, $c6d5
    ld bc, IRIdentifier.end - IRIdentifier
    trap MemCopy
    ld a, $01
    trap $cc
    trap IRListen
    push af
    xor a
    trap $cc
    pop af
    jr c, .cancel
    ld a, [$c6d5]
    or a
    jr z, .error

    xor a
    ldh [$c0], a
    call RedrawMailLine
    call NextMailLine
    ld a, LAYOUT_XFER_DONE
    call ShowMailLayout
    ld a, $01
    ldh [$c2], a

.wait
    call AwaitAB

.done
    jp DoKissMailMenu

.error
    ld a, LAYOUT_XFER_FAIL
    call ShowMailLayout
    jr .wait

.cancel
    call ShowCancel
    jr .wait


ShowCancel:
    ld a, LAYOUT_XFER_CANCEL
    ; fall through


PromptAny:
    call ShowMailLayout

.wait
    trap InputButtons
    or a
    jr nz, .wait

    ret


SendMail:
    ld hl, $c6d5
    ld de, $c400
    ld bc, $000a
    trap IRRead
    jr c, .cancel

    ld hl, $c400
    ld de, IRIdentifier
    ld bc, IRIdentifier.end - IRIdentifier
    trap MemCmp
    or a
    jr nz, .mismatch

    inc a
    ld hl, $c400
    ld [hl], a
    ld de, $c6d5
    ld bc, $000a
    trap IRWrite
    ret nc

.cancel
    ld a, $10
    ret

.mismatch
    trap IRClose
    ld a, $0f
    scf
    ret


Call_001_614f:
    call GetMailLineMetrics
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


PromptAB:
    ldh a, [$c4]
    ld d, a
    ld e, $01
    ld hl, LayoutYesNo
    trap $5a
    ; fall through


AwaitAB:
    trap AwaitFrame
    trap InputButtons
    and BTN_AB
    jr z, AwaitAB

    or a
    bit 1, a
    ret z

    scf
    ret


; Sets:
;   hl: address of current line in memory
;   d: tile index of first tile in line (e.g. $91 for $8910)
;   e: 1
;   c: insertion point of line (i.e. 1 after last non-space)
;
; These values are suitable for calling trap KbdEdit
GetMailLineMetrics:
    ld b, BODY_LEN
    ldh a, [$c0]
    or a
    jr nz, .calc

    ld b, TITLE_LEN

.calc
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
    trap StrTrim
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
    jr nz, .noSpace

    trap $e7
    xor a
    trap $f1
    inc b
    dec b
    ret nz

.noSpace
    call Call_001_66dc
    ld a, $03
    trap LCDEnable
    ld a, LAYOUT_NO_SPACE_CONFIRM
    call ShowMailLayout
    call PromptAB
    jp c, Exit

    trap LCDDisable
    ret


DrawMailMenu:
    trap LCDDisable
    call Call_001_66dc
    ld de, ArrowIcon
    ld hl, $9700
    ld bc, $0010
    trap MemCopy
    call DrawMailHeader
    ld de, $0204
    ld bc, $1109
    trap DrawBox
    ld hl, LayoutMenu
    ld de, $9101
    trap $5a
    call DrawHelpBox
    ld a, $03
    trap LCDEnable
    ret


DrawHelpBox::
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


DrawMailWindow:
    trap LCDDisable
    call Call_001_66dc
    ld a, $e4
    ldh [$9d], a
    call KissClearScreen
    call DrawMailHeader

    ; Draw text entry box and change the upper corners to T tiles
    ld de, $0103
    ld bc, $130a
    trap DrawBox
    ld a, $73
    ld de, $0103
    trap DrawTile
    inc a
    ld d, $13
    trap DrawTile

    ld a, $91
    ld hl, $0111
    ld de, $0204
    ld bc, $1108
    trap $59
    ldh a, [$c0]
    push af
    xor a
    ldh [$c0], a
    ld c, LINE_COUNT

.next
    push bc
    call RedrawMailLine
    call NextMailLine
    pop bc
    dec c
    jr nz, .next

    pop af
    ldh [$c0], a
    ret


KissClearScreen::
    ld hl, $8800
    ld bc, $0f30
    ld e, $00
    trap MemSet
    ld hl, $9800
    ld bc, $0400
    ld e, $7f
    trap MemSet
    ret


DrawMailHeader:
    ld hl, $9800
    ld bc, $0400

.next
    ld a, $7f
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, .next

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
.end
