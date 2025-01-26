; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "system/consts.inc"

DEF XFER_STARTED EQU $01
DEF XFER_SUCCESS EQU $02
DEF XFER_FAILURE EQU $03
DEF XFER_NOSPACE EQU $04
DEF XFER_IGNORE EQU $05

SECTION "system/menu: Kiss Menu", ROMX

KissMenu::
    ld sp, $e000
    ld hl, KissMenu
    trap $6f
    xor a
    ldh [$b7], a
    call InitKissUserIfNeeded
    ; fall through


; Get the current file, show info, then run the menu
UpdateKissMenu:
    call Call_001_4b33
    ld hl, $ffc0
    ld de, $ff44
    ld bc, $0001
    trap CRAMRead
    ld a, $ff
    ldh [$c2], a
    xor a
    ldh [$c3], a
    ldh [$c1], a

jr_001_4125:
    call SelectFile
    jp c, ExitKissMenu

    and BTN_A
    jp z, MenuQuickRecv

    call Call_001_490e
    ldh a, [$8a]
    bit BTN_SEL_F, a
    jp nz, MenuSend

ContinueActionMenu:
    call Call_001_4acb
    and BTN_B
    jr nz, MenuBack

    ld h, a
    ld l, c
    trap JumpViaTable
    db $06
    dw MenuRun - @
    dw MenuInfo - @
    dw MenuSort - @
    dw MenuSend - @
    dw MenuRecv - @
    dw MenuErase - @
    dw MenuBack - @

MenuBack:
    call Call_001_4b36
    jr jr_001_4125

MenuRun:
    ld hl, $c500
    trap $6d
    ld hl, data_01_4fb1
    jp ShowError


MenuSort:
    ldh a, [$c0]
    ldh [$c2], a
    ldh a, [$c1]
    ldh [$c3], a
    call Call_001_4990
    push af

.again
    call SelectFile
    jr c, .done

    bit BTN_A_F, a
    jr z, .again

    call Call_001_4990
    pop de
    ld e, a
    call MoveFile
    push de
    jr nz, .done

    ld a, d
    cp e
    jr nz, .done

    ld hl, data_01_4fc1
    call DrawTplStr
    ld de, $0b10
    call ConfirmYesNo
    jr nz, .done

    pop de
    call Call_001_41a9
    push af

.done
    pop af
    ld a, $ff
    ldh [$c2], a
    jp UpdateKissMenu


DeleteSelectedFile:
    ld hl, $c500
    trap FileDelete
    ret


Call_001_41a9:
    ld e, $00

Jump_001_41ab:
    ld a, e
    cp d
    jp z, .Jump_001_422d

    push de
    ld hl, $c500
    trap FileGetHeader
    pop de
    ld hl, $c500
    ld a, [hl+]
    or [hl]
    jr z, .Jump_001_422d

    inc hl
    ld a, [hl]
    cp $ff
    jr z, .Jump_001_422d

    push de
    call Call_001_426d
    trap FileSearch
    pop de
    jr c, .Jump_001_422d

    push de
    call Call_001_478a
    pop hl
    push hl
    ld c, h
    ld a, [$c50a]
    ld [$c70a], a
    ld hl, $c700
    trap FileWrite
    jr c, .jr_001_422c

    ld a, [$c509]
    bit 0, a
    jr z, .jr_001_41f1

    call Call_001_4929
    ld hl, $c700
    call Call_001_492c

.jr_001_41f1
    ld hl, $c500
    ld de, $c400
    ld bc, $0100
    trap $eb
    ld a, b
    or c
    jr z, .jr_001_420a

    ld hl, $c700
    ld de, $c400
    trap $ec
    jr .jr_001_41f1

.jr_001_420a
    ld de, $c702
    ld hl, $c502
    ld b, $03

.jr_001_4212
    ld a, [de]
    cp [hl]
    jr c, .jr_001_421d

    jr nz, .jr_001_4224

    dec de
    dec hl
    dec b
    jr nz, .jr_001_4212

.jr_001_421d
    ld hl, $c700
    trap FileDelete
    jr .jr_001_422c

.jr_001_4224
    pop de
    push de
    call MoveFile
    call DeleteSelectedFile

.jr_001_422c
    pop de

.Jump_001_422d
    inc e
    ld a, e
    cp 120
    jp c, Jump_001_41ab

    ret


; Swap positions of files at indexes d and e
MoveFile:
    add sp, -$08

    ld hl, sp+$00
    push de
    ld d, $fe
    ld bc, $0004
    trap CRAMRead
    pop de

    ld hl, sp+$04
    push de
    ld e, d
    ld d, $fe
    ld bc, $0004
    trap CRAMRead
    pop de

    ld hl, sp+$04
    push de
    ld d, $fe
    ld bc, $0004
    trap CRAMWrite
    pop de

    ld hl, sp+$00
    push de
    ld e, d
    ld d, $fe
    ld bc, $0004
    trap CRAMWrite
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


; nz → file exists and is not special
; Kiss Mail cannot be transferred or deleted
DoesNonSpecialFileExist:
    ld hl, $c500
    ld a, [hl+]
    or [hl]
    ret z

    inc hl
    ld a, [hl]
    cp $ff
    ret


CannotSendFile:
    ld hl, data_01_4f76
    call DrawTplStr
    ld a, $b4
    trap AwaitButton
    jp ContinueActionMenu


MenuSend:
    call DoesNonSpecialFileExist
    jp z, CannotSendFile

    call SendFile
    jp c, UpdateKissMenu

    ld hl, $c500
    ld c, $01
    trap $8f
    jp UpdateKissMenu


MenuQuickRecv:
    ld hl, data_01_4ca0
    call ShowTransferScreen
    call Call_001_4b5e
    xor a
    call RecvFile
    jp UpdateKissMenu


MenuRecv:
    ld hl, $c500
    ld a, [hl+]
    or [hl]
    jr z, .empty

    ld hl, data_01_4f85
    call DrawTplStr
    ld de, $0710
    call ConfirmYesNo
    jp nz, Jump_001_43d4

    ld a, [$c502]
    cp $ff
    jp z, CannotDeleteFile

    call DeleteSelectedFile

.empty
    ld hl, data_01_4cbe
    call ShowTransferScreen
    call Call_001_4b5e
    call WaitForUserToStartTransfer
    jp nz, Jump_001_4491

    call Call_001_4b5e
    call Call_001_4990
    call RecvFile
    jp nz, Jump_001_4491

    jp UpdateKissMenu


RecvFile:
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
    call RecvConn
    jr c, .error

    cp XFER_STARTED
    jr nz, .error

    ld de, TransferringTileMap
    ld hl, data_01_4d06
    call UpdateTransferScreen
    call RecvConn
    jr c, .error

    cp XFER_SUCCESS
    jr nz, .error

    ld hl, $c500
    ld c, $ff
    trap $8f
    ld de, TransferDoneTileMap
    ld hl, data_01_4d1e
    xor a
    jr .done

.error
    ld de, TransferErrorTileMap
    ld hl, data_01_4d5f
    ld a, [$ce00]
    cp XFER_NOSPACE
    jr nz, .done

    ld hl, data_01_4dfe
    or $01

.done
    push af
    call UpdateTransferScreen
    call Call_001_475c
    pop af
    ret


Call_001_4358:
    trap $da
    and $02
    jr nz, Call_001_4358

    ret


; Results:
; a == 1 → connection established
; a == 2 → received successfully
; a == 3 → general error
; a == 4 → insufficient space
; a == 5 →
RecvConn:
    trap AwaitBlit
    trap IRListen
    ld a, [$ce00]
    push af
    cp XFER_IGNORE
    call z, DeleteSelectedFile
    trap $db
    pop af
    ret


BlitIRRead:
    trap AwaitBlit
    trap IRRead
    jr jr_001_43ac


SendStatus:
    ld hl, $ce00
    ld [hl], a
    ld d, h
    ld e, l
    ld c, $01
    trap AwaitBlit
    trap IRWrite
    jr jr_001_43ac


BlitIRClose:
    trap AwaitBlit
    trap IRClose
    jr jr_001_43ac


BlitIR06:
    ld hl, $c700
    trap AwaitBlit
    trap IR06
    jr jr_001_43ac


Call_001_4393:
    ld de, $c600

BlitIR08:
    trap AwaitBlit
    trap IR0A
    jr jr_001_43ac


BlitIR04:
    trap AwaitBlit
    trap IR04
    jr jr_001_43ac


BlitIRFileWrite:
    trap AwaitBlit
    trap IRFileWrite
    jr jr_001_43ac


BlitIRFileSearch:
    trap AwaitBlit
    trap IRFileSearch
    ; fall through


jr_001_43ac:
    push af
    trap $db
    pop af
    ret


CannotDeleteFile:
    ld hl, data_01_4f66
    ; fall through


ShowError:
    call DrawTplStr
    ld a, $b4
    trap AwaitButton
    jp ContinueActionMenu


MenuErase:
    call DoesNonSpecialFileExist
    jr z, CannotDeleteFile

    call Call_001_43f1
    ld hl, data_01_4f0f
    call DrawTplAndAskYesNo
    jr nz, Jump_001_43d4

    call DeleteSelectedFile
    jp UpdateKissMenu


Jump_001_43d4:
    ldh a, [$c1]
    call Call_001_4a36
    jp ContinueActionMenu


DrawTplAndAskYesNo:
    call DrawTplStr
    ld de, $0710
    ; fall through


ConfirmYesNo:
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


data_01_440d:
    dk "エリアのあきができます»\0"


MenuInfo:
    ld a, $c4
    ld h, $04
    ld bc, $0301
    ld de, $0d12
    trap DrawInit
    ld de, $0000
    ld hl, data_01_44a6
    trap DrawStringList
    call DrawFileInfo
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
    trap CRAMRead
    xor a
    ld [$c40a], a
    ld hl, $c400
    call DrawPlainString
    ld hl, $015c
    trap $bd
    ld hl, data_01_4518
    trap DrawString

    add sp, -$04
    ld hl, sp+$00
    ld de, $ff40
    ld bc, $0004
    trap CRAMRead
    pop de
    pop bc
    ld hl, $c400
    trap $a0
    ld hl, $c404
    trap DrawString

.wait
    trap AwaitFrame
    trap InputButtons
    and BTN_AB
    jr z, .wait
    ; fall through


Jump_001_4491:
    call DrawMenu
    call Call_001_479d
    ld a, h
    call Call_001_4a36
    call Call_001_490e
    jp ContinueActionMenu


Call_001_44a1:
    ld a, $32
    trap AwaitButton
    ret


data_01_44a6:
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

data_01_4510:
    dk "ユーザー　:\0"

data_01_4518:
    dk "ポイントごうけい:»\0"


DrawFileInfo:
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
    jr z, .jr_001_453a

    inc de

.jr_001_453a
    ld hl, $c400
    trap StrConvInt
    ld hl, $0d01
    trap DrawAt
    ld hl, $c401
    trap DrawString  ; File block count
    pop hl

    ld a, [$c502]
    ld bc, $111b
    call DrawAttrIcon
    push de
    ld a, [hl+]
    dec a
    inc hl
    bit FILE_ICON_F, d
    jr z, .noIcon

    bit FILE_2BPP_F, d
    jr z, .1bpp

    sub $60

.1bpp
    sub $60

.noIcon
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
    trap DrawString  ; File title
    pop de
    bit FILE_HIST_F, d
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
    trap DrawString  ; Point value
    pop de
    ld hl, $0505

.nextHistory
    push hl
    push de
    trap DrawAt
    ld hl, $c42e
    ld bc, $000a
    trap MemCopy
    xor a
    ld [$c438], a
    ld hl, $c42e
    call DrawPlainString  ; History name
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
    trap DrawString  ; History points
    pop de
    pop hl

    inc l
    ld a, l
    cp $09
    jr c, .nextHistory

    ret


DrawPlainString:
    ldh a, [hDrawMode]
    push af
    or (1 << DrawMode_Bit6)
    ldh [hDrawMode], a
    trap DrawString
    pop af
    and ~(1 << DrawMode_Bit2)
    ldh [hDrawMode], a
    ret


DrawAttrIcon:
    cp $ff
    ld d, [hl]
    inc hl
    ld a, [hl]
    inc hl
    push hl
    push de
    push bc
    jr z, .bullseye

    or a
    jr z, .regular

    ld hl, KissCartridgeCode
    cp [hl]
    jr z, .regular

    ld de, AttrCross
    jr .draw

.regular
    bit FILE_EXEC_F, d
    jr z, .triangle

    bit FILE_A008_F, d
    jr z, .circle

    ld de, AttrDiamond
    jr .draw

.circle
    ld de, AttrCircle
    jr .draw

.bullseye
    ld de, AttrBullseye
    jr .draw

.triangle
    ld de, AttrTriangle

.draw
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


SendFile:
    call Call_001_5019
    scf
    ret nz

    call Call_001_4764
    ld hl, $ce00
    ld de, $ce00
    ld c, $10
    call BlitIRRead
    ld a, $03
    jp c, .Jump_001_471b

    ld hl, data_01_401a
    ld de, $ce02
    ld bc, $000d
    trap MemCmp
    ld a, h
    or l
    ld hl, data_01_4d8d
    ld a, $06
    jp nz, .Jump_001_4741

    ld a, [$ce00]
    or a
    jp nz, .Jump_001_4741

    ld a, [$ce0f]
    push af
    ld a, XFER_STARTED
    call SendStatus
    call BlitIRClose

.jr_001_4672
    ld hl, data_01_4cd8
    ld de, TransferringTileMap
    call UpdateTransferScreen
    call Call_001_426d
    call BlitIRFileSearch
    pop bc
    jp c, .Jump_001_469a

    push bc
    ld hl, data_01_4dc6
    call DrawTplStr
    ld de, $0c10
    call ConfirmYesNo
    jp nz, .Jump_001_4737

    call BlitIR06
    jr .jr_001_4672

.Jump_001_469a
    cp $ff
    jp z, .Jump_001_471b

    push bc
    ld a, XFER_IGNORE
    call SendStatus
    call Call_001_478a
    pop af
    ld c, a
    ld a, $ff
    ld [$c70a], a
    ld hl, $c700
    call BlitIRFileWrite
    jr nc, .jr_001_46c2

    cp $ff
    jr z, .jr_001_4719

    ld hl, data_01_4d36
    ld a, $04
    jr .jr_001_4740

.jr_001_46c2
    push hl
    ld hl, sp+$00
    ld d, h
    ld e, l
    ld hl, $ce00
    ld c, $02
    push hl
    call BlitIRRead
    pop hl
    pop bc
    ld a, [hl+]
    cp c
    jr nz, .jr_001_4719

    ld a, [hl]
    cp b
    jr nz, .jr_001_4719

    ld a, [$c509]
    bit 0, a
    jr z, .jr_001_4700

    ld hl, $c500
    ld de, $c600
    trap $f0
    jr c, .jr_001_4721
    ld a, b
    or c
    jr z, .jr_001_4721

    push bc
    ld de, $ffd2
    ld b, $00
    call BlitIR04
    pop bc
    jr c, .jr_001_4719

    call Call_001_4393
    jr c, .jr_001_4719

.jr_001_4700
    ld hl, $c500
    ld de, $c600
    ld bc, $0100
    trap $eb
    jr c, .jr_001_4721

    ld a, b
    or c
    jr z, .jr_001_4721

    call Call_001_4393
    jr nc, .jr_001_4700

    call BlitIR06

.jr_001_4719
    ld a, $05

.Jump_001_471b
    ld hl, data_01_4d5f
    scf
    jr .Jump_001_4741

.jr_001_4721
    call Call_001_4769
    jr c, .jr_001_4719

    ld a, XFER_SUCCESS
    call SendStatus
    ld hl, data_01_4cef
    ld de, TransferDoneTileMap
    xor a
    call Call_001_4752
    xor a
    ret


.Jump_001_4737
    call Call_001_4358
    ld hl, data_01_4dfa
    ld a, $07
    pop bc

.jr_001_4740
    or a

.Jump_001_4741
    push af
    jr c, .error

    push hl
    call SendStatus
    pop hl

.error
    ld de, TransferErrorTileMap
    pop af
    call Call_001_4752
    scf
    ret


Call_001_4752:
    push af
    call UpdateTransferScreen
    pop af
    jr c, jr_001_475c

    call BlitIRClose

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
    jr z, .jr_001_4779

    sub $2e

.jr_001_4779
    sub [hl]
    ld e, a
    ld a, $ff
    sbc b
    ld d, a
    call BlitIR04
    pop de
    ret c

    ld bc, $0001
    jp BlitIR08


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

.jr_001_47a6
    push bc
    push de
    push hl
    trap FileGetHeader
    pop hl
    pop de
    pop bc
    call Call_001_4965
    jr nc, .jr_001_47b7

    inc e
    inc h
    jr .jr_001_47a6

.jr_001_47b7
    ldh a, [$c1]

Call_001_47b9:
    ld de, $0c3c
    ld h, a
    ld bc, $0000
    cp $03
    jr c, .jr_001_47ca

    ld c, $01
    ld e, $5c
    sub $03

.jr_001_47ca
    or a
    ret z

    dec a
    jr z, .jr_001_47d4

    inc b
    ld a, d
    add $28
    ld d, a

.jr_001_47d4
    inc b
    ld a, d
    add $28
    ld d, a
    ret


data_01_47da:
    db 4
    db  0,  0, $00, 0
    db 16,  0, $02, 0
    db  0, 32, $10, 0
    db 16, 32, $12, 0


SelectFile:
    ld hl, $ffc0
    ld de, $ff44
    ld bc, $0001
    trap CRAMWrite
    ldh a, [$c2]
    ld c, a
    ldh a, [$c0]
    cp c
    jr nz, .jr_001_480c

    ldh a, [$c3]
    call Call_001_47b9
    ld hl, data_01_47da
    ld a, $1c
    trap $60
    jr .jr_001_4811

.jr_001_480c
    ld bc, $041c
    trap $c4

.jr_001_4811
    call Call_001_479d

.next
    call Call_001_4fec
    push af
    ld a, h
    ldh [$c1], a
    pop af
    or a
    bit BTN_A_F, a
    ret nz

    bit BTN_STA_F, a
    ret nz

    bit BTN_B_F, a
    scf
    ret nz

    ld l, a
    ldh a, [$8a]
    bit BTN_RT_F, l
    jr nz, .right

    bit BTN_UP_F, l
    jp nz, .up

    bit BTN_DN_F, l
    jp nz, .down

    bit BTN_LT_F, l
    jr z, .next

.left
    ld l, -30
    bit BTN_SEL_F, a
    jr nz, .moveBy30

    ld a, b
    or a
    jr z, .jr_001_484f

    dec b
    dec h
    ld a, d
    sub 40
    ld d, a
    jp .next


.jr_001_484f
    ld a, c
    or a
    jr z, .jr_001_485e

    ld b, 2
    ld c, 0
    dec h
    ld de, $5c3c
    jp .next


.jr_001_485e
    ld l, 5

.Jump_001_4860
    ldh a, [$c0]
    or a
    jp z, .next

    ldh a, [$c1]
    add l
    ldh [$c1], a
    ldh a, [$c0]
    sub 6
    jr nc, .jr_001_4872

    xor a

.jr_001_4872
    ldh [$c0], a
    jp SelectFile


.right
    ld l, 30
    bit BTN_SEL_F, a
    jr nz, .moveBy30

    ld a, b
    cp 2
    jr z, .jr_001_488b

    inc h
    inc b
    ld a, d
    add 40
    ld d, a
    jp .next


.jr_001_488b
    ld a, c
    or a
    jr nz, .jr_001_489a

    ld b, 0
    ld c, 1
    inc h
    ld de, $0c5c
    jp .next


.jr_001_489a
    ld l, 5

.Jump_001_489c
    ldh a, [$c0]
    add 6
    cp 120
    jp nc, SelectFile

    ldh [$c0], a
    ldh a, [$c1]
    sub l
    ldh [$c1], a
    jp SelectFile


.moveBy30
    push hl
    ldh a, [$c0]
    ld e, a
    ld d, 0
    ld hl, 30
    push hl
    trap MathDiv16
    pop de
    trap MathMul16
    ld a, l
    pop hl
    jr .jr_001_48c4

.jr_001_48c2
    ldh a, [$c0]

.jr_001_48c4
    add l
    cp -60
    jr nc, .underflow

    cp 120
    jr c, .moveBy30Done

    xor a
    jr .moveBy30Done

.underflow
    sub -120

.moveBy30Done
    ldh [$c0], a
    jp SelectFile


.up
    ld l, -6
    bit BTN_SEL_F, a
    jr nz, .jr_001_48c2

    ld a, c
    or a
    jr nz, .jr_001_48e6

    ld l, 3
    jp .Jump_001_4860


.jr_001_48e6
    dec c
    ld a, h
    sub 3
    ld h, a
    ld a, e
    sub 32
    ld e, a
    jp .next


.down
    ld l, 6
    bit BTN_SEL_F, a
    jr nz, .jr_001_48c2

    ld a, c
    cp 1
    jr nz, .jr_001_4902

    ld l, 3
    jp .Jump_001_489c


.jr_001_4902
    ld a, h
    add 3
    ld h, a
    inc c
    ld a, e
    add 32
    ld e, a
    jp .next


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
    jr z, .jr_001_494a

    call Call_001_4929
    ld hl, $c500
    ld de, $c400
    ld bc, $002e
    trap $eb
    ret


.jr_001_494a
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


InitKissUserIfNeeded:
    trap $e1
    ret nc

    jp InitKissUser


Call_001_4990:
    ldh a, [$c0]
    ld c, a
    ldh a, [$c1]
    add c
    ret


DrawMenu:
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
    ld de, MenuActionTileData
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
    jr z, .jr_001_4a7c

    ld de, $0008
    add hl, de
    ld b, [hl]
    inc hl
    inc hl
    ld a, [hl]
    inc hl
    inc hl
    bit 4, b
    jr z, .jr_001_4a6b

    sub $60
    bit 3, b
    jr z, .jr_001_4a6b

    sub $60

.jr_001_4a6b
    dec a
    cp $10
    jr c, .jr_001_4a72

    ld a, $10

.jr_001_4a72
    ld c, a
    ld b, $00
    ld e, l
    ld d, h
    ld hl, $c400
    trap MemCopy

.jr_001_4a7c
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
    jr z, .jr_001_4aa3

    push af
    push hl
    inc hl
    ld a, [hl]
    ld de, $0007
    add hl, de
    ld bc, $0d60
    call DrawAttrIcon
    pop hl
    pop af

.jr_001_4aa3
    ld bc, $0007
    add hl, bc
    ld e, [hl]
    inc e
    or a
    jr nz, .jr_001_4aad

    ld e, a

.jr_001_4aad
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


data_01_4ac2:
    dk "エリア  No.\0"


Call_001_4acb:
    ld de, $8c14
    ld hl, $0a14
    ld c, $00

.Jump_001_4ad3
    ld a, c
    call Call_001_4b88

.jr_001_4ad7
    push bc
    ld b, $10
    call Call_001_4a2a
    call Call_001_44a1
    jr nz, .jr_001_4aec

    call Call_001_4a28
    call Call_001_44a1
    pop bc
    jr z, .jr_001_4ad7

    push bc

.jr_001_4aec
    push af
    call Call_001_4a28
    pop af
    pop bc
    ld b, a
    and $03
    ret nz

    bit 6, b
    jr nz, .jr_001_4b1f

    bit 7, b
    jr z, .jr_001_4ad7

    ld a, c
    cp $05
    jp z, Call_001_4acb

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
    jp .Jump_001_4ad3


.jr_001_4b14
    ld c, $05
    ld de, $8c8c
    ld hl, $1932
    jp .Jump_001_4ad3


.jr_001_4b1f
    ld a, c
    or a
    jr z, .jr_001_4b14

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
    jp .Jump_001_4ad3


Call_001_4b33:
    call DrawMenu

Call_001_4b36:
    ld hl, data_01_4f3b
    call DrawTplStr
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
    jr nc, .jr_001_4b6d

    ld a, $10
    trap $c8
    ret


.jr_001_4b6d
    ld e, a
    ld d, $00
    push af
    ld hl, $c400
    trap StrConvInt
    pop af
    ld hl, StrJushinAreaAitemasen
    or a
    jr z, .jr_sys_4b85

    ld hl, $c404
    trap DrawString
    ld hl, StrAreaMadeJushin

.jr_sys_4b85
    trap DrawString
    ret


DEF TPL_EXTSTR EQU $fc
DEF TPL_FD EQU $fd
DEF TPL_FE EQU $fe
DEF TPL_END EQU $ff

MACRO extstr
    db TPL_EXTSTR
    dw Str\1
ENDM


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
    call DrawTplStr
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
    call DrawTplStr
    ld a, $10
    call Call_001_4b9d
    ld a, " "
    trap DrawChar
    trap DrawString
    pop hl
    jr DrawTplStr.next

DrawExtStr:
    ld a, [hl+]
    push hl
    ld h, [hl]
    ld l, a
    trap DrawString
    pop hl
    inc hl
    jr DrawTplStr.next


jr_001_4bc4:
    push hl
    ld hl, data_01_4c02
    call DrawTplStr
    pop hl
    jr DrawTplStr


jr_001_4bce:
    ld a, $0e
    trap DrawCtrlChar
    ; fall through


DrawTplStr:
    ld a, [hl+]
    cp TPL_END
    ret z

    cp TPL_FE
    jr z, jr_001_4bc4

    cp TPL_FD
    jr z, jr_001_4ba5

    call Call_001_4b9d

.next
    ld a, [hl+]
    or a
    jr z, jr_001_4bce

    cp TPL_EXTSTR
    jr z, DrawExtStr

    sub $e0
    jr c, .drawInlineStr

    trap $c8
    jr .next

.drawInlineStr
    dec hl
    trap DrawString
    jr .next

data_01_4bf6:
    dw data_01_4e28
    dw data_01_4e44
    dw data_01_4e65
    dw data_01_4e9b
    dw data_01_4eb9
    dw data_01_4eef

data_01_4c02:
    dk "\0"
    dk "   この\0"
    extstr File
    dh "は\0"
    db $ee, $00, $08
    db $ee, $00
    db TPL_END

data_01_4c15:
    db $08
    dk "«　　　せんたくしている\0"
    db $ee, $00
    db TPL_END

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
StrAreaMadeJushin:
    dk "エリアまでじゅしんかのうです\0"
StrJushinAreaAitemasen:
    dk "じゅしんエリアが　あいていません\0"

data_01_4ca0:
    dk $08, "つうしんを　ちゅうしするばあいは\0"
    dk "\0"
    dk $10, "Ｂ\0"
    extstr ButtonOshite
    db $f0, $00
    db TPL_END

data_01_4cbe:
    db $08
    extstr GameBoy
    dh "どうしを　くっつけて\0"
    dk "\0"
    db $10, "Ａ\0"
    extstr ButtonOshite
    db $f0, $00
    db TPL_END

data_01_4cd8:
    db $00
    db $f0, $00
    db $08
    extstr File
    dh "を　おくっています\0"
    db $f0, $00
    db $10
    db $f0, $00
    db TPL_END

data_01_4cef:
    db $00
    db $f0, $00
    db $08
    extstr File
    dh "を　おくりました！\0"
    db $f0, $00
    db $10
    db $f0, $00
    db TPL_END

data_01_4d06:
    db $00
    db $f0, $00
    db $08
    extstr File
    dh "を　うけとっています\0"
    db $f0, $00
    db $10
    db $f0, $00
    db TPL_END

data_01_4d1e:
    db $00
    db $f0, $00
    db $08
    extstr File
    dh "を　うけとりました！\0"
    db $f0, $00
    db $10
    db $f0, $00
    db TPL_END

data_01_4d36:
    db $00
    dk "あいての\0"
    extstr GameBoy
    dh "の\0"
    db $f0, $00
    db $08
    extstr AreaTarimasen
    db $f0, $00
    dk $10, "かくほして　もらってください\0"
    db $f0, $00
    db TPL_END

data_01_4d5f:
    db $00
    dk "つうしんを　しっぱいしました\0"
    db $f0, $00
    db $08
    db $f0, $00
    db $10
    dk "もういちどやりなおしてください　\0"
    dk "\0"
    db TPL_END

data_01_4d8d:
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
    db TPL_END

data_01_4dc6:
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
    db TPL_END

data_01_4dfa:
    db $10
    db $f0, $00
    db TPL_END

data_01_4dfe:
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
    db TPL_END

data_01_4e28:
    db $00, $e3, "＜　スタート　＞\0", $ee, $00
    db TPL_FD
    dh "をじっこうします　»\0"
    dk "\0"
    db TPL_END

data_01_4e44:
    db $00
    db "　＜\0"
    extstr File
    dh "　じょうほう＞　\0"
    dk "\0"
    db TPL_FD
    dh "のじょうほうです　\0"
    dk "\0"
    db TPL_END

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
    db $ee, $00
    db TPL_END

data_01_4e9b:
    db $00
    dh "　＜　\0"
    extstr File
    dh "そうしん　＞　\0"
    dh "\0"
    db TPL_FD
    dh "をそうしんします　\0"
    dk "\0"
    db TPL_END

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
    db TPL_END

data_01_4eef:
    db $00
    dh "　＜　\0"
    extstr File
    dh "さくじょ　＞　\0"
    dk "\0"
    db TPL_FD
    dh "をさくじょします　\0"
    dk "\0"
    db TPL_END

data_01_4f0f:
    db $00
    dk "«　ほんとうにさくじょして\0"
    db $ee, $00, $08
    extstr SpaceYorishiiDesuKau
    db $ee, $00, $10
    db $e4
    extstr HaiIie
    db $ee, $00
    db TPL_END

StrSpaceYorishiiDesuKau:
    dk "　"
StrYoroshiiDesuKa:
    dk "よろしいですか？\0"

data_01_4f3b:
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
    db TPL_END

data_01_4f66:
    db TPL_FE, $10, $e2
    dk "さくじょ\0"
    extstr Dekimasen
    db $ee, $00
    db TPL_END

data_01_4f76:
    db TPL_FE, $10, $e2
    dk "そうしん\0"
    extstr Dekimasen
    db $ee, $00
    db TPL_END

data_01_4f85:
    db $00
    dk "«　　この\0"
    extstr File
    dh "をけして\0"
    db $ee, $00, $08
    dk "«　ここにじゅしんしますか？\0"
    db $ee, $00, $10
    db $e4
    extstr HaiIie
    db $ee, $00
    db TPL_END

data_01_4fb1:
    db TPL_FE, $10, $e2
    dk "じっこう\0"
    extstr Dekimasen
    db $ee, $00
    db TPL_END

data_01_4fc1:
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
    db "\0"
    db TPL_END

Call_001_4fec:
    push bc
    push de
    push hl
    ld a, h
    call Call_001_4a36

.jr_001_4ff3
    ld h, $00
    push de
    push hl
    ld a, $00
    ld l, $00
    ld bc, $0502
    trap $c5
    call Call_001_44a1
    jr nz, .jr_001_5013

    ld bc, $0a00
    trap $c4
    call Call_001_44a1
    jr nz, .jr_001_5013

    pop hl
    pop de
    jr .jr_001_4ff3

.jr_001_5013
    pop hl
    pop de
    pop hl
    pop de
    pop bc
    ret


Call_001_5019:
    ld hl, data_01_4cbe
    call ShowTransferScreen
    ; fall through


WaitForUserToStartTransfer:
    trap AwaitFrame
    trap InputButtons
    and BTN_AB
    jr z, WaitForUserToStartTransfer

    and BTN_B
    ret nz

    push af
    ld hl, data_01_4ca0
    call DrawTplStr
    pop af
    ret


ShowTransferScreen:
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

    ld de, TransferTileSet
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
    ld de, TransferMessageBoxTileMap
    ld b, $05
    ld c, $14
    call Call_001_509b
    pop hl
    ld de, TransferPrepTileMap
    call UpdateTransferScreen
    ld a, $01
    trap LCDEnable
    ret


UpdateTransferScreen:
    push de
    call DrawTplStr
    pop de
    ld hl, $9802
    ld b, $0c
    ld c, $10
    ; fall through


Call_001_509b:
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
    jr nz, Call_001_509b

    ret


TransferTileSet:
    INCBIN "../out/src/system/frag/transfer.hz"

TransferPrepTileMap:
    INCBIN "../out/src/system/gfx/transfer.tilemap", 0, 192

TransferringTileMap:
    INCBIN "../out/src/system/gfx/transfer.tilemap", 192, 192

TransferDoneTileMap:
    INCBIN "../out/src/system/gfx/transfer.tilemap", 384, 192

TransferErrorTileMap:
    INCBIN "../out/src/system/gfx/transfer.tilemap", 576, 192

TransferMessageBoxTileMap:
    db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02
    db $03, $04, $ca, $cd, $d0, $d3, $d6, $d9, $dc, $df, $e2, $e5, $e8, $eb, $ee, $f1, $f4, $f7, $04, $11
    db $03, $04, $cb, $ce, $d1, $d4, $d7, $da, $dd, $e0, $e3, $e6, $e9, $ec, $ef, $f2, $f5, $f8, $04, $11
    db $03, $04, $cc, $cf, $d2, $d5, $d8, $db, $de, $e1, $e4, $e7, $ea, $ed, $f0, $f3, $f6, $f9, $04, $11
    db $1e, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $20

MenuActionTileData:
    INCBIN "../out/src/system/frag/actions.hz"
