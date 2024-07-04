; Disassembly of "icon-edit.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

DEF ICON_WIDTH   EQU 32  ; 32px
DEF ICON_HEIGHT  EQU 24  ; 24px
DEF GFX_DEPTH    EQU 2   ; 2bpp
DEF TILE_WIDTH   EQU 8   ; 8px
DEF BYTE_BITS    EQU 8   ; 8 bits per byte
DEF ICON_BYTES   EQU (ICON_WIDTH * ICON_HEIGHT * GFX_DEPTH / BYTE_BITS)
DEF TILE_BYTES   EQU (TILE_WIDTH * TILE_WIDTH * GFX_DEPTH / BYTE_BITS)

DEF WINDOW_HEIGHT  EQU 32
DEF WINDOW_TOP     EQU SCRN_Y - WINDOW_HEIGHT
DEF EDITOR_WIDTH   EQU SCRN_X
DEF EDITOR_HEIGHT  EQU WINDOW_TOP
DEF MAX_SCROLL_X   EQU (ICON_WIDTH * TILE_WIDTH) - EDITOR_WIDTH
DEF MAX_SCROLL_Y   EQU (ICON_HEIGHT * TILE_WIDTH) - EDITOR_HEIGHT

DEF PALETTE  EQU %11_10_01_00

DEF MSG_DESC_CONTINUE      EQU $00
DEF MSG_DESC_SAVE          EQU $01
DEF MSG_DESC_NEWICON       EQU $02
DEF MSG_DESC_EXIT          EQU $03
DEF MSG_ENTER_FILE_NAME    EQU $06
DEF MSG_CONFIRM_FILE_NAME  EQU $07
DEF MSG_OUT_OF_SPACE       EQU $08
DEF MSG_SAME_FILE_EXISTS   EQU $09

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_ICON | FILE_2BPP | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $03           ; owner code
.title
    dk "ICON-EDIT"
.icon
    INCBIN "gfx/iconedit/icon.2bpp"
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
    ld sp, $e000
    ld hl, $0301
    trap $b6
    callx InitMemory
    callx LoadIcon
    jr nc, PrepMenu

    jx EditIcon


PrepMenu::
    ; Save X/Y scroll to memory and reset to (0, 0).
    ; This way, the menu is displayed without scroll,
    ; and scroll can be restored upon exiting the menu.
    ldh a, [$9b]
    ld [VarSaveScroll.x], a
    ldh a, [$9a]
    ld [VarSaveScroll.y], a
    xor a
    ldh [$9b], a
    ldh [$9a], a

    ; fall through


DoMenu::
    xor a
    trap DrawInit
    trap LCDDisable
    callx ShowMenu
    ld a, LCDCF_OBJON | LCDCF_BGON
    trap LCDEnable
    xor a

.loop
    ldx de, CursorData
    trap InputCursorMenu
    jr c, .loop

    ld l, a
    ld h, $00

    trap JumpViaTable
    db $06
    dw EditIcon - @  ; continue edit
    dw SaveIcon - @  ; save icon
    dw NewIcon - @   ; create new
    dw Quit - @      ; quit
    dw DoMenu - @


CursorData:
    db $04           ; item count
    db $04, $06      ; initial position
    db $04, $7f      ; cursor characters
    dw ShowHelp - @  ; update callback


Quit:
    trap ExitToMenu


NewIcon:
    callx ClearIcon
    jx EditIcon


SaveIcon:
    callx EnterFileName
    jr c, DoMenu

.tryAgain
    ld de, VarC791
    ld hl, VarC769
    ld c, $00

.copyTitle
    inc c
    ld a, [de]
    inc de
    ld [hl+], a
    or a
    jr nz, .copyTitle

    ld a, $83
    ld de, VarFileType
    ld [de], a
    ld hl, VarFileContent
    ld c, $00
    trap $6b
    jr c, .uniqueFileName

    ld a, MSG_SAME_FILE_EXISTS
    callx ShowTopMsg
    callx ConfirmAction
    jr c, DoMenu

    ld hl, VarFileContent
    trap $ef
    jr .tryAgain

.uniqueFileName
    ld hl, VarFileContent + 10
    xor a
    ld [hl+], a
    ld a, [hl]
    ld c, a
    ld b, $00
    add ICON_BYTES
    ld [hl+], a
    add hl, bc
    ld de, VarImage
    ld c, ICON_BYTES

.copyIcon
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, .copyIcon

    ld hl, VarFileContent
    ld de, $0000
    ld bc, $19ff
    trap $e9
    jr c, .outOfSpace

    jx DoMenu

.outOfSpace
    ld a, MSG_OUT_OF_SPACE
    callx ShowTopMsg

.awaitButton
    trap InputButtons
    or a
    jr z, .awaitButton

    jx DoMenu


EditIcon:
    xor a
    trap DrawInit
    trap LCDDisable
    callx EditInitVideo
    callx call_042e
    ld a, LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_OBJON | LCDCF_BGON
    trap LCDEnable

.loop
    trap AwaitFrame
    ld bc, $2800
    trap $c4
    trap InputButtons
    callx HandleMove
    ldh a, [$8b]
    bit BTN_STA_F, a
    jr z, .continue

    jx PrepMenu

.continue
    or a
    jr z, .loop

    callx HandleGrid
    callx HandleDraw
    jr .loop


HandleGrid:
    ldh a, [$8b]
    bit BTN_SEL_F, a
    ret z

    ld hl, VarGridOn
    inc [hl]

    ; fall through


LoadBlankTile:
    ld a, [VarGridOn]
    ldx de, TileShades
    and $01
    jr z, .load

    ldx de, TileGrid

.load
    ld hl, $9000
    ld bc, $0010
    trap MemCopy
    ret


HandleMove:
    ldh a, [$b6]
    ld b, a
    and BTN_DIR
    jr z, .blink

    bit BTN_UP_F, b
    jr z, :+
    callx MoveCursorUp
    jr .drag

:   bit BTN_DN_F, b
    jr z, :+
    callx MoveCursorDown
    jr .drag

:   bit BTN_LT_F, b
    jr z, :+
    callx MoveCursorLeft
    jr .drag

:   bit BTN_RT_F, b
    jr z, .drag
    callx MoveCursorRight

.drag
    callx UpdatePosText
    ldh a, [$8a]
    and BTN_AB
    jr z, .blink

    callx call_03fa
    ld a, [VarLastColor]
    callx SetPixel

.blink
    ld hl, VarCursor.blink
    ld a, [hl]
    ld c, a
    inc [hl]
    bit 4, c
    ret nz

    ldh a, [$9b]
    ld d, a
    ldh a, [$9a]
    ld e, a
    ld hl, $c300
    ld a, [VarCursor.y]
    inc a
    inc a
    add a
    add a
    add a
    sub e
    ld [hl+], a
    ld a, [VarCursor.x]
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


UpdatePosition:
    ld [hl], a
    add a
    add a
    add a
    ld e, a
    xor a
    ld [VarCursor.blink], a
    ret


MoveCursorUp:
    ld hl, VarCursor.y
    ld a, [hl]
    dec a
    bit 7, a
    jr z, .updateScroll

    xor a

.updateScroll
    callx UpdatePosition
    ldh a, [$9a]
    or a
    jr z, .noUpdate

    ld d, a
    sub e
    cpl
    inc a
    cp $20
    jr nc, .noUpdate

    ld a, d
    sub TILE_WIDTH
    ldh [$9a], a

.noUpdate
    ret


MoveCursorDown:
    ld hl, VarCursor.y
    ld a, [hl]
    inc a
    cp ICON_HEIGHT
    jr c, .updateScroll

    ld a, ICON_HEIGHT - 1

.updateScroll
    callx UpdatePosition
    ldh a, [$9a]
    cp MAX_SCROLL_Y
    jr nc, .noUpdate

    ld d, a
    sub e
    cpl
    inc a
    cp $50
    jr c, .noUpdate

    ld a, d
    add TILE_WIDTH
    ldh [$9a], a

.noUpdate
    ret


MoveCursorLeft:
    ld hl, VarCursor.x
    ld a, [hl]
    dec a
    bit 7, a
    jr z, .updateScroll

    xor a

.updateScroll
    callx UpdatePosition
    ldh a, [$9b]
    or a
    jr z, .noUpdate

    ld d, a
    sub e
    cpl
    inc a
    cp $20
    jr nc, .noUpdate

    ld a, d
    sub TILE_WIDTH
    ldh [$9b], a

.noUpdate
    ret


MoveCursorRight:
    ld hl, VarCursor.x
    ld a, [hl]
    inc a
    cp ICON_WIDTH
    jr c, .updateScroll

    ld a, ICON_WIDTH - 1

.updateScroll
    callx UpdatePosition
    ldh a, [$9b]
    cp MAX_SCROLL_X
    jr nc, .noUpdate

    ld d, a
    sub e
    cpl
    inc a
    cp $80
    jr c, .noUpdate

    ld a, d
    add TILE_WIDTH
    ldh [$9b], a

.noUpdate
    ret


UpdatePosText:
    ld a, [VarCursor.x]
    ld e, a
    ld d, $00
    ld hl, VarStrScratch
    trap StrConvInt
    ld hl, $0a22
    trap DrawAt
    ld hl, VarStrScratch + 4
    trap DrawString
    ld a, [VarCursor.y]
    ld e, a
    ld d, $00
    ld hl, VarStrScratch
    trap StrConvInt
    ld hl, $0a23
    trap DrawAt
    ld hl, VarStrScratch + 4
    trap DrawString
    ret


HandleDraw:
    ldh a, [$8b]
    ld e, a
    and BTN_AB
    ret z

    push de
    callx call_03fa
    pop de
    bit BTN_A_F, e
    jr z, :+
    inc a

:   bit BTN_B_F, e
    jr z, :+
    ld a, [VarLastColor]

:   and $03
    ld [VarLastColor], a

    ; fall through


SetPixel:
    ld d, a
    ld e, c
    bit 0, d
    jr nz, .jr_03b6

    ld e, $00

.jr_03b6
    ld a, [hl]
    and b
    or e
    ld [hl+], a
    ld e, c
    bit 1, d
    jr nz, .jr_03c1

    ld e, $00

.jr_03c1
    ld a, [hl]
    and b
    or e
    ld [hl-], a
    ld e, l
    ld d, h
    ld h, $91
    ld bc, $0002
    trap MemCopy
    ld a, [VarCursor.y]
    ld h, a
    ld l, $00
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld a, [VarCursor.x]
    or l
    ld l, a
    ld de, $9800
    add hl, de
    ld de, VarLastColor
    ld bc, $0001
    trap MemCopy
    ret


BitValues:
    db %10000000
    db %01000000
    db %00100000
    db %00010000
    db %00001000
    db %00000100
    db %00000010
    db %00000001


call_03fa:
    ld a, [VarCursor.x]
    and $07
    ld e, a
    ld d, $00
    ldx hl, BitValues
    add hl, de
    ld a, [hl]
    ld c, a
    cpl
    ld b, a
    ld a, [VarCursor.x]
    and $f8
    add a
    ld l, a
    add a
    add l
    ld l, a
    ld a, [VarCursor.y]
    add a
    add l
    ld l, a
    ld h, HIGH(VarImage)
    inc hl
    ld d, $00
    ld a, [hl-]
    and c
    jr z, .jr_0425

    inc d

.jr_0425
    sla d
    ld a, [hl]
    and c
    jr z, .jr_042c

    inc d

.jr_042c
    ld a, d
    ret


call_042e:
    xor a
    ld hl, VarCursor.x
    ld d, [hl]
    ld [hl+], a
    ld e, [hl]
    ld [hl-], a
    push de
    ld hl, $9800
    ld bc, $0400

.jr_043d
    push hl
    callx call_03fa
    pop hl
    ld [hl+], a
    ld de, VarCursor.x
    ld a, [de]
    inc a
    ld [de], a
    cp $20
    jr c, .jr_043d

    xor a
    ld [de], a
    ld de, VarCursor.y
    ld a, [de]
    inc a
    ld [de], a
    cp $20
    jr c, .jr_043d

    pop de
    ld hl, VarCursor.x
    ld [hl], d
    inc hl
    ld [hl], e
    ret


EnterFileName:
    trap LCDDisable
    callx ClearScreen
    callx LoadIconTiles
    ld de, $420d
    ld hl, VarC700
    trap $54
    ld a, MSG_ENTER_FILE_NAME
    callx ShowTopMsg
    ld de, $0107
    ld bc, $0605
    trap DrawBox
    ld a, $10
    ld de, $0208
    ld bc, $0403
    ld hl, $0301
    trap $59
    ld de, $0808
    ld bc, $0c03
    trap DrawBox
    ld a, $38
    ld de, $0909
    ld bc, $0a01
    ld hl, $0100
    trap $59
    ld a, LCDCF_OBJON | LCDCF_BGON
    trap LCDEnable
    ld de, VarC769
    ld hl, VarC791
    ld bc, VarC791.end - VarC791
    trap MemCopy
    ld de, $3801
    ld hl, VarC791
    ld b, $0a
    trap $56
    ld a, MSG_CONFIRM_FILE_NAME
    callx ShowTopMsg
    callx ConfirmAction
    ret c

    or a
    ret


; Loop until A or B is pressed.
;
;   A → clear carry flag
;   B → set carry flag
;
ConfirmAction:
    trap AwaitFrame
    trap InputButtons
    and BTN_AB
    jr z, ConfirmAction

    or a
    bit BTN_A_F, a
    ret nz

    scf
    ret


LoadIconData:
    ld hl, VarFileContent + 9
    ld b, [hl]
    inc hl
    inc hl
    ld a, [hl+]
    bit FILE_ICON_F, b
    jr z, .haveSize

    sub ICON_BYTES / 2
    bit FILE_2BPP_F, b
    jr z, .haveSize

    sub ICON_BYTES / 2

.haveSize
    ld c, a
    ld de, VarFileType

.copyTitle
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, .copyTitle

    xor a
    ld [de], a
    ld hl, VarFileContent
    ld de, VarImage
    trap $64
    ret


LoadIcon:
    ld hl, VarFileContent
    ld a, [hl+]
    or [hl]
    ret z

    callx LoadIconData
    scf
    ret


InitMemory:
    callx ClearIcon
    xor a
    ld [VarGridOn], a
    ld a, $03
    ld [VarLastColor], a
    ld hl, VarC700
    ld bc, VarC700.end - VarC700
    ld e, " "
    trap MemSet
    ld hl, VarC791
    ld bc, VarC791.end - VarC791
    ld e, " "
    trap MemSet
    xor a
    ld [VarC769], a
    ld de, VarC700
    trap $51
    ret


EditInitVideo:
    ld a, PALETTE
    ldh [$9d], a
    ld a, $07
    ldh [$a0], a
    ld a, WINDOW_TOP
    ldh [$9f], a
    ld a, [VarSaveScroll.x]
    ldh [$9b], a
    ld a, [VarSaveScroll.y]
    ldh [$9a], a
    callx LoadIconTiles
    callx LoadBlankTile
    ldx de, TileShades + $10
    ld hl, $9010
    ld bc, $0030
    trap MemCopy
    ldx de, TileCursor
    ld hl, $8000
    ld bc, $0010
    trap MemCopy
    ldx hl, LayoutBottomBar
    trap DrawLayout
    callx UpdatePosText
    ret


LoadIconTiles:
    ld hl, $9100
    ld de, VarImage
    ld bc, VarImage.end - VarImage
    trap MemCopy
    ret


ClearIcon:
    xor a
    ld [VarSaveScroll.x], a
    ld [VarSaveScroll.y], a
    ldh [$9b], a
    ldh [$9a], a
    ld [VarCursor.x], a
    ld [VarCursor.y], a
    ld [VarC765], a
    ld hl, VarImage
    ld bc, VarImage.end - VarImage
    ld e, $00
    trap MemSet
    ret


ShowMenu:
    callx ClearScreen
    ld h, $04
    trap $ca
    ldx de, TileMenuCursor
    ld hl, $9040
    ld bc, $0010
    trap MemCopy
    ld de, $0205
    ld bc, $1006
    trap DrawBox
    ld de, $0200
    ld bc, $1003
    trap DrawBox
    ldx hl, LayoutMenu
    ld de, $8001
    trap $5a
    ret


TileMenuCursor:
    INCBIN "gfx/iconedit/menucursor.2bpp"


ClearScreen:
    ld bc, $2800
    trap $c4
    ld hl, $9800
    ld bc, $0400
    ld e, $7f
    trap MemSet
    ret


LayoutBottomBar:
    dk $00, $20, "--------------------\n"
    db $00, $21, " psvy ICON EDIT\n"
    db $00, $22, " qtwz X =\n"
    db $00, $23, " rux｢ Y =\n"

LayoutMenu:
    dk $06, $01, "ICON EDIT\n"
    dk $05, $06, "へんしゅうする\n"
    dh $05, $07, "アイコンのセーブ\n"
    dk $05, $08, "しんきさくせい\n"
    dh $05, $09, "おわる\n"
    db $ff

TileShades:
    INCBIN "gfx/iconedit/shades.2bpp"

TileGrid:
    INCBIN "gfx/iconedit/grid.2bpp"

TileCursor:
    INCBIN "gfx/iconedit/cursor.2bpp"


ShowTopMsg:
    push af
    ld de, $0001
    ld bc, $1405
    trap DrawBox
    pop af
    ld de, $8001
    jr ShowMsg


UnusedShowMsg1:
    bit 6, c
    jr z, ShowHelp

    xor a
    callx ShowHelp
    xor a
    scf
    ret


UnusedShowMsg2:
    bit 7, c
    jr z, ShowHelp

    ld a, b
    push bc
    callx ShowHelp
    pop bc
    ld a, b
    scf
    ret


ShowHelp:
    push af
    ld de, $000d
    ld bc, $1405
    trap DrawBox
    pop af
    ld de, $2001

    ; fall through


ShowMsg:
    add a
    ld c, a
    ld b, $00
    ldx hl, MsgLayouts
    add hl, bc
    ld c, [hl]
    inc hl
    ld b, [hl]
    dec hl
    add hl, bc
    trap $5a
    or a
    ret


MsgLayouts:
    dw LayoutDescContinue - @
    dw LayoutDescSave - @
    dw LayoutDescNewIcon - @
    dw LayoutDescExit - @
    dw 0
    dw 0
    dw LayoutEnterFileName - @
    dw LayoutConfirmFileName - @
    dw LayoutOutOfSpace - @
    dw LayoutSameFileExists - @

LayoutDescContinue:
    dh $01, $0e, "アイコンパターンをへんしゅうします\n"
    db $ff

LayoutDescNewIcon:
    dk $01, $0e, "げんざいのアイコンパターンをけして\n"
    dh $01, $0f, "あたらしくへんしゅうします\n"
    db $ff

LayoutDescSave:
    dk $01, $0e, "げんざいのアイコンパターンを\n"
    dh $01, $0f, "ファイルにほぞんします\n"
    db $ff

LayoutDescExit:
    dk $01, $0e, "「ＩＣＯＮ　ＥＤＩＴ」を\n"
    dh $01, $0f, "しゅうりょうします\n"
    db $ff

LayoutEnterFileName:
    dk $01, $02, "ほぞんするなまえをにゅうりょくして\n"
    dh $01, $03, "ください\n"
    db $ff

LayoutConfirmFileName:
    dk $01, $02, "このなまえでほぞんしていいですか？\n"
    dh $01, $03, "はい：Ａ　いいえ：Ｂ\n"
    db $ff

LayoutOutOfSpace:
    dk $01, $02, "あきようりょうがたりなくてセーブ\n"
    dk $01, $03, "できませんでした\n"
    dh $01, $04, "ＯＫ：Ａ\n"
    db $ff

LayoutSameFileExists:
    dk $01, $02, "おなじなまえのファイルがあります\n"
    dh $01, $03, "うわがきしてほぞんしてもいいですか？\n"
    dh $01, $04, "はい：Ａ　いいえ：Ｂ\n"
    db $ff

    db $ff

SECTION "Variables", WRAM0[$c500]

VarFileContent:
    ds $100

VarImage:
    ds $100
.end

VarC700:
    ds $58
.end

VarStrScratch:
    ds 9
VarCursor:
.x      db
.y      db
.blink  db
VarLastColor:
    db
VarC765:
    db
VarSaveScroll:
.x  db
.y  db
VarFileType:
    db
VarC769:
    ds $28
VarC791:
    ds $28
.end
VarGridOn:
    db
