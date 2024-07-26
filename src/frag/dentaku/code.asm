; Disassembly of "dentaku.gbf"

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

SECTION "Fragment", ROM0[$0]
LOAD "WRAM Code", WRAM0[$c800]

Main:
    ld sp, $e000
    call InitTiles
    call BtnAllClear
    ld de, $011d
    ld bc, $530c
    ld l, $1e
    ld a, $00

jr_c813:
    ld h, $03
    trap InputHiliteMenu
    bit 1, h
    jr nz, jr_c828

    push af
    push bc
    push de
    push hl
    call HandleBtn
    pop hl
    pop de
    pop bc
    pop af
    jr jr_c813

jr_c828:
    trap ExitToMenu


HandleBtn:
    ld l, a
    ld h, $00
    inc hl
    trap $03
    db 30
    dw BtnModeHex - @,  BtnModeDec - @,  BtnClear - @,     BtnAllClear - @,    BtnF - @
    dw BtnXor - @,      BtnOr - @,       BtnAnd - @,       BtnShiftLeft - @,   BtnE - @
    dw Btn7 - @,        Btn8 - @,        Btn9 - @,         BtnShiftRight - @,  BtnD - @
    dw Btn4 - @,        Btn5 - @,        Btn6 - @,         BtnMultiply - @,    BtnC - @
    dw Btn1 - @,        Btn2 - @,        Btn3 - @,         BtnDivide - @,      BtnB - @
    dw Btn0 - @,        BtnAdd - @,      BtnSubtract - @,  BtnEqual - @,       BtnA - @


InitTiles:
    ld a, $c4
    ld bc, $0201
    ld de, $0d11
    ld hl, $1791
    trap DrawInit
    ld hl, $0f05
    ld de, $7816
    ld bc, $4f1e
    trap $c2
    xor a
    ld [VarC615], a
    ld hl, $0a1f
    ld de, $1d26
    ld bc, $5fe4
    trap $c2
    ld hl, $221f
    ld de, $3526
    ld bc, $5fe4
    trap $c2
    ld hl, $3a1f
    ld de, $4d26
    ld bc, $5fe4
    trap $c2
    ld hl, $521f
    ld de, $6526
    ld bc, $5fe4
    trap $c2
    ld hl, $6a1f
    ld de, $7d26
    ld bc, $5fe4
    trap $c2
    ld hl, $0a2b
    ld de, $1d32
    ld bc, $5fe4
    trap $c2
    ld hl, $222b
    ld de, $3532
    ld bc, $5fe4
    trap $c2
    ld hl, $3a2b
    ld de, $4d32
    ld bc, $5fe4
    trap $c2
    ld hl, $522b
    ld de, $6532
    ld bc, $5fe4
    trap $c2
    ld hl, $6a2b
    ld de, $7d32
    ld bc, $5fe4
    trap $c2
    ld hl, $0a37
    ld de, $1d3e
    ld bc, $5fe4
    trap $c2
    ld hl, $2237
    ld de, $353e
    ld bc, $5fe4
    trap $c2
    ld hl, $3a37
    ld de, $4d3e
    ld bc, $5fe4
    trap $c2
    ld hl, $5237
    ld de, $653e
    ld bc, $5fe4
    trap $c2
    ld hl, $6a37
    ld de, $7d3e
    ld bc, $5fe4
    trap $c2
    ld hl, $0a43
    ld de, $1d4a
    ld bc, $5fe4
    trap $c2
    ld hl, $2243
    ld de, $354a
    ld bc, $5fe4
    trap $c2
    ld hl, $3a43
    ld de, $4d4a
    ld bc, $5fe4
    trap $c2
    ld hl, $5243
    ld de, $654a
    ld bc, $5fe4
    trap $c2
    ld hl, $6a43
    ld de, $7d4a
    ld bc, $5fe4
    trap $c2
    ld hl, $0a4f
    ld de, $1d56
    ld bc, $5fe4
    trap $c2
    ld hl, $224f
    ld de, $3556
    ld bc, $5fe4
    trap $c2
    ld hl, $3a4f
    ld de, $4d56
    ld bc, $5fe4
    trap $c2
    ld hl, $524f
    ld de, $6556
    ld bc, $5fe4
    trap $c2
    ld hl, $6a4f
    ld de, $7d56
    ld bc, $5fe4
    trap $c2
    ld hl, $0a5b
    ld de, $1d63
    ld bc, $5fe4
    trap $c2
    ld hl, $225b
    ld de, $3563
    ld bc, $5fe4
    trap $c2
    ld hl, $3a5b
    ld de, $4d63
    ld bc, $5fe4
    trap $c2
    ld hl, $525b
    ld de, $6563
    ld bc, $5fe4
    trap $c2
    ld hl, $6a5b
    ld de, $7d63
    ld bc, $5fe4
    trap $c2
    ld hl, data_c9e4

jr_c9d6:
    ld a, [hl+]
    or a
    ret z

    push hl
    ld l, a
    ld h, $01
    trap $bd
    pop hl
    trap DrawString
    jr jr_c9d6


data_c9e4:
    db $1f, $15, $31, $36, $01, $31, $30, $01, $01, $43, $01, $41, $43, $01, $01, $46, $00
    db $2b, $01, $5e, $01, $01, $7e, $01, $01, $26, $01, $01, $3c, $01, $01, $45, $00
    db $37, $01, $37, $01, $01, $38, $01, $01, $39, $01, $01, $3e, $01, $01, $44, $00
    db $43, $01, $34, $01, $01, $35, $01, $01, $36, $01, $01, $2a, $01, $01, $43, $00
    db $4f, $01, $31, $01, $01, $32, $01, $01, $33, $01, $01, $2f, $01, $01, $42, $00
    db $5b, $01, $30, $01, $01, $2b, $01, $01, $2d, $01, $01, $3d, $01, $01, $41, $14, $00
    db $00


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
    ld hl, $020e
    trap $bd
    ld hl, StrNone
    ld a, l
    ld [VarC61A], a
    ld a, h
    ld [VarC61A + 1], a
    trap DrawString

jp_caa2:
    ld hl, $0205
    trap $bd
    ld hl, StrModeDec
    ld a, [VarModeHexOn]
    or a
    jr z, jr_cab3

    ld hl, StrModeHex

jr_cab3:
    trap DrawString

call_cab5:
    ld hl, VarResult
    ld bc, $0905
    call DrawNum

jp_cabe:
    ld a, [VarC615]
    or a
    jr z, jr_cad2

    ld hl, $060e
    trap $bd
    ld hl, StrNone
    trap DrawString
    xor a
    ld [VarC615], a

jr_cad2:
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
    jr z, jr_cb4c

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
    jr nz, jr_cb49

    ld hl, $060e
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
    jr jr_cb4c

jr_cb49:
    call call_cab5

jr_cb4c:
    ld hl, $020e
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
    jr nz, jr_cbca

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

jr_cbca:
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
    jr z, jr_cc8f

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


jr_cc8f:
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
