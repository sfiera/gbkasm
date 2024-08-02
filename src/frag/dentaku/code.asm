; Disassembly of "dentaku.gbf"

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

DEF BTN_CNT  EQU 30
DEF BTN_W    EQU 24
DEF BTN_H    EQU 12
DEF BTN_X0   EQU 1
DEF BTN_Y0   EQU 29
DEF BTN_X1   EQU BTN_X0 + BTN_W
DEF BTN_X2   EQU BTN_X1 + BTN_W
DEF BTN_X3   EQU BTN_X2 + BTN_W
DEF BTN_X4   EQU BTN_X3 + BTN_W
DEF BTN_Y1   EQU BTN_Y0 + BTN_H
DEF BTN_Y2   EQU BTN_Y1 + BTN_H
DEF BTN_Y3   EQU BTN_Y2 + BTN_H
DEF BTN_Y4   EQU BTN_Y3 + BTN_H
DEF BTN_Y5   EQU BTN_Y4 + BTN_H

MACRO ld2
    ld \1, ((\2) << 8) | (\3)
ENDM

SECTION "Fragment", ROM0[$0]
LOAD "WRAM Code", WRAM0[$c800]

Main:
    ld sp, $e000
    call InitTiles
    call BtnAllClear

    ld2 de, BTN_X0, BTN_Y0
    ld2 bc, $53, BTN_H
    ld l, BTN_CNT
    ld a, 0

.nextInput
    ld h, $03
    trap InputHiliteMenu
    bit 1, h
    jr nz, .exit

    push af
    push bc
    push de
    push hl
    call HandleBtn
    pop hl
    pop de
    pop bc
    pop af
    jr .nextInput

.exit
    trap ExitToMenu


HandleBtn:
    ld l, a
    ld h, $00
    inc hl
    trap $03
    db BTN_CNT
    dw BtnModeHex - @,  BtnModeDec - @,  BtnClear - @,     BtnAllClear - @,    BtnF - @
    dw BtnXor - @,      BtnOr - @,       BtnAnd - @,       BtnShiftLeft - @,   BtnE - @
    dw Btn7 - @,        Btn8 - @,        Btn9 - @,         BtnShiftRight - @,  BtnD - @
    dw Btn4 - @,        Btn5 - @,        Btn6 - @,         BtnMultiply - @,    BtnC - @
    dw Btn1 - @,        Btn2 - @,        Btn3 - @,         BtnDivide - @,      BtnB - @
    dw Btn0 - @,        BtnAdd - @,      BtnSubtract - @,  BtnEqual - @,       BtnA - @


MACRO box
    ld2 hl, \1 + 9, \2 + 2
    ld2 de, \1 + \3 + 4, \2 + \4 - 3
    ld2 bc, \5, \6
    trap $c2
ENDM

InitTiles:
    ld a, $c4
    ld bc, $0201
    ld2 de, 13, 17
    ld hl, $1791
    trap DrawInit

    box 6, 3, 110, 22, $4f, $1e

    xor a
    ld [VarC615], a

    box BTN_X0, BTN_Y0, BTN_W, BTN_H, $5f, $e4
    box BTN_X1, BTN_Y0, BTN_W, BTN_H, $5f, $e4
    box BTN_X2, BTN_Y0, BTN_W, BTN_H, $5f, $e4
    box BTN_X3, BTN_Y0, BTN_W, BTN_H, $5f, $e4
    box BTN_X4, BTN_Y0, BTN_W, BTN_H, $5f, $e4
                      
    box BTN_X0, BTN_Y1, BTN_W, BTN_H, $5f, $e4
    box BTN_X1, BTN_Y1, BTN_W, BTN_H, $5f, $e4
    box BTN_X2, BTN_Y1, BTN_W, BTN_H, $5f, $e4
    box BTN_X3, BTN_Y1, BTN_W, BTN_H, $5f, $e4
    box BTN_X4, BTN_Y1, BTN_W, BTN_H, $5f, $e4
                      
    box BTN_X0, BTN_Y2, BTN_W, BTN_H, $5f, $e4
    box BTN_X1, BTN_Y2, BTN_W, BTN_H, $5f, $e4
    box BTN_X2, BTN_Y2, BTN_W, BTN_H, $5f, $e4
    box BTN_X3, BTN_Y2, BTN_W, BTN_H, $5f, $e4
    box BTN_X4, BTN_Y2, BTN_W, BTN_H, $5f, $e4
                      
    box BTN_X0, BTN_Y3, BTN_W, BTN_H, $5f, $e4
    box BTN_X1, BTN_Y3, BTN_W, BTN_H, $5f, $e4
    box BTN_X2, BTN_Y3, BTN_W, BTN_H, $5f, $e4
    box BTN_X3, BTN_Y3, BTN_W, BTN_H, $5f, $e4
    box BTN_X4, BTN_Y3, BTN_W, BTN_H, $5f, $e4
                      
    box BTN_X0, BTN_Y4, BTN_W, BTN_H, $5f, $e4
    box BTN_X1, BTN_Y4, BTN_W, BTN_H, $5f, $e4
    box BTN_X2, BTN_Y4, BTN_W, BTN_H, $5f, $e4
    box BTN_X3, BTN_Y4, BTN_W, BTN_H, $5f, $e4
    box BTN_X4, BTN_Y4, BTN_W, BTN_H, $5f, $e4
                      
    box BTN_X0, BTN_Y5, BTN_W, BTN_H + 1, $5f, $e4
    box BTN_X1, BTN_Y5, BTN_W, BTN_H + 1, $5f, $e4
    box BTN_X2, BTN_Y5, BTN_W, BTN_H + 1, $5f, $e4
    box BTN_X3, BTN_Y5, BTN_W, BTN_H + 1, $5f, $e4
    box BTN_X4, BTN_Y5, BTN_W, BTN_H + 1, $5f, $e4

    ld hl, CalculatorText

.nextLine
    ld a, [hl+]
    or a
    ret z

    push hl
    ld l, a
    ld h, BTN_X0
    trap $bd
    pop hl
    trap DrawString
    jr .nextLine


CalculatorText:
    dh BTN_Y0 + 2, BG1, "16→10→→C→AC→→F\0"
    dh BTN_Y1 + 2, "→^→→¯→→&→→<→→E\0"
    dh BTN_Y2 + 2, "→7→→8→→9→→>→→D\0"
    dh BTN_Y3 + 2, "→4→→5→→6→→*→→C\0"
    dh BTN_Y4 + 2, "→1→→2→→3→→/→→B\0"
    dh BTN_Y5 + 2, "→0→→+→→-→→=→→A", BG0, "\0"
    db 0


StrModeDec:
    dk "Dec\0"


StrModeHex:
    dk "Hex\0"


BtnModeHex:
    ld a, $01
    ld [VarModeHexOn], a
    jp jp_caa2


BtnModeDec:
    xor a
    ld [VarModeHexOn], a
    jp jp_caa2


BtnClear:
    xor a
    ld [VarC616], a
    ld [VarOperand], a
    ld [VarOperand + 1], a
    jp jp_caa2


data_ca6b:
.rst
    trap MathAdd16
.ret
    ret


BtnAllClear:
    ld a, [data_ca6b.rst]
    ld [VarOpFunc.rst], a
    ld a, [data_ca6b.ret]
    ld [VarOpFunc.ret], a
    xor a
    ld [VarC616], a
    ld [VarOpFunc.trap], a
    ld [VarModeHexOn], a
    ld [VarOperand], a
    ld [VarOperand + 1], a
    ld [VarResult], a
    ld [VarResult + 1], a
    ld2 hl, 2, 14
    trap $bd
    ld hl, StrNone
    ld a, l
    ld [VarC61A], a
    ld a, h
    ld [VarC61A + 1], a
    trap DrawString

jp_caa2:
    ld2 hl, 2, 5
    trap $bd
    ld hl, StrModeDec
    ld a, [VarModeHexOn]
    or a
    jr z, .jr_cab3

    ld hl, StrModeHex

.jr_cab3
    trap DrawString

call_cab5:
    ld hl, VarResult
    ld bc, $0905
    call DrawNum

jp_cabe:
    ld a, [VarC615]
    or a
    jr z, .jr_cad2

    ld2 hl, 6, 14
    trap $bd
    ld hl, StrNone
    trap DrawString
    xor a
    ld [VarC615], a

.jr_cad2
    ld hl, VarOperand
    ld bc, $090e
    call DrawNum
    ret


BtnF:
    ld c, $0f
    jp BtnHexDigit


StrXor:
    dk "XOR\0"


BtnXor:
    ld a, MathXor16
    ld hl, StrXor

BtnOperator:
    push hl
    push af
    ld a, l
    ld [VarC61A], a
    ld a, h
    ld [VarC61A + 1], a
    ld a, [VarC616]
    or a
    jr z, .jr_cb4c

    ld hl, VarResult
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, VarOperand
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [VarOpFunc.trap]
    or a
    call nz, VarOpFunc
    ld a, l
    ld [VarResult], a
    ld a, h
    ld [VarResult + 1], a
    xor a
    ld [VarOperand], a
    ld [VarOperand + 1], a
    ld [VarC616], a
    ld a, [VarOpFunc.trap]
    cp $8a
    jr nz, .jr_cb49

    ld2 hl, 6, 14
    trap $bd
    ld hl, data_cb59
    trap DrawString
    ld a, $01
    ld [VarC615], a
    ld hl, $c3b0
    ld bc, $090e
    call DrawNum
    ld hl, VarResult
    ld bc, $0905
    call DrawNum
    jr .jr_cb4c

.jr_cb49
    call call_cab5

.jr_cb4c
    ld2 hl, 2, 14
    trap $bd
    pop af
    pop hl
    ld [VarOpFunc.trap], a
    trap DrawString
    ret


data_cb59:
    dk "«あまり»\0"


BtnOr:
    ld a, MathOr16
    ld hl, StrOr
    jp BtnOperator


StrOr:
    dk "OR \0"


BtnAnd:
    ld a, MathAnd16
    ld hl, StrAnd
    jp BtnOperator


StrAnd:
    dk "AND\0"


BtnShiftLeft:
    ld a, MathSla16
    ld hl, StrShiftLeft
    jp BtnOperator


StrShiftLeft:
    dk "SLA\0"


BtnE:
    ld c, $0e
    jp BtnHexDigit


Btn7:
    ld c, $07

BtnDecDigit:
    ld a, [VarC616]
    inc a
    ld [VarC616], a
    ld a, [VarModeHexOn]
    or a
    jr nz, AppendHex

    ld hl, VarOperand
    ld e, [hl]
    inc hl
    ld d, [hl]
    sla e
    rl d
    push de
    sla e
    rl d
    sla e
    rl d
    ld a, c
    add e
    ld e, a
    ld a, $00
    adc d
    ld d, a
    pop bc
    ld a, c
    add e
    ld e, a
    ld a, b
    adc d
    ld d, a
    ld [hl], d
    dec hl
    ld [hl], e
    jp jp_cabe


BtnHexDigit:
    ld a, [VarModeHexOn]
    or a
    ret z

    ld a, [VarC616]
    inc a
    ld [VarC616], a
    ; fall through


AppendHex:
    ld hl, VarOperand
    ld e, [hl]
    inc hl
    ld d, [hl]
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    ld [hl], d
    dec hl
    ld a, e
    or c
    ld [hl], a
    jp jp_cabe


Btn8:
    ld c, $08
    jp BtnDecDigit


Btn9:
    ld c, $09
    jp BtnDecDigit


BtnShiftRight:
    ld a, MathSrl16
    ld hl, StrShiftRight
    jp BtnOperator


StrShiftRight:
    dk "SRL\0"


BtnD:
    ld c, $0d
    jp BtnHexDigit


Btn4:
    ld c, $04
    jp BtnDecDigit


Btn5:
    ld c, $05
    jp BtnDecDigit


Btn6:
    ld c, $06
    jp BtnDecDigit


BtnMultiply:
    ld a, MathMul16
    ld hl, StrMultiply
    jp BtnOperator


StrMultiply:
    dk "*  \0"


BtnC:
    ld c, $0c
    jp BtnHexDigit


Btn1:
    ld c, $01
    jp BtnDecDigit


Btn2:
    ld c, $02
    jp BtnDecDigit


Btn3:
    ld c, $03
    jp BtnDecDigit


BtnDivide:
    ld a, MathDiv16
    ld hl, StrDivide
    jp BtnOperator


StrDivide:
    dk "/  \0"


BtnB:
    ld c, $0b
    jp BtnHexDigit


Btn0:
    ld c, $00
    jp BtnDecDigit


BtnAdd:
    ld a, MathAdd16
    ld hl, StrAdd
    jp BtnOperator


StrAdd:
    dk "+  \0"


BtnSubtract:
    ld a, MathSub16
    ld hl, StrSubtract
    jp BtnOperator


StrSubtract:
    dk "-  \0"


BtnEqual:
    ld a, $00
    ld hl, StrNone
    jp BtnOperator


StrNone:
    dk "   \0"


jp_cc6c:
    ret


BtnA:
    ld c, $0a
    jp BtnHexDigit


DrawNum:
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push hl
    push bc
    ld a, [VarModeHexOn]
    or a
    jr z, .jr_cc8f

    trap StrConvHex
    pop hl
    trap $bd
    ld a, " "
    trap DrawChar
    ld a, " "
    trap DrawChar
    pop hl
    trap DrawString
    ret


.jr_cc8f
    trap StrConvInt
    pop hl
    trap $bd
    pop hl
    trap DrawString
    ret

ENDL

SECTION "Variables", WRAM0[$c600]

VarOperand:
    dw
VarOperandStr:
    ds 8
VarResult:
    dw
VarResultStr:
    ds 8

VarModeHexOn:
    db
VarC615:
    db
VarC616:
    db

VarOpFunc:
.rst   db
.trap  db
.ret   db

VarC61A:
    dw
