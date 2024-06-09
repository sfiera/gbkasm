; Disassembly of "gbkiss.gb"

INCLUDE "charmap.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

MACRO rcall
    rpush @+6
    rpush \1
    ret
ENDM

SECTION "ROM Bank $000", ROM0[$0]

Header::
    ; Length of entirety of file
    dw End
    ; Flags for display in menu
    db kFileHasIcon2bpp + kFileMarkerCircle + kFileHasTransfers
    ; Must be $00 for normal files (other than Kiss Mail)
    db $00
    ; Length of variable parts of header
    db Points - @ - 1
    ; File owner code
    db $67

Title::
    db "SAMEGAME"
Icon::
    db $ff, $00, $80, $00, $80, $00, $80, $00, $80, $00, $9f, $0f, $90, $18, $97, $17
    db $98, $10, $9f, $1f, $98, $10, $9f, $0f, $8f, $00, $9f, $0f, $90, $18, $97, $17
    db $96, $14, $97, $17, $90, $18, $9f, $0f, $8f, $00, $80, $00, $ff, $00, $00, $ff
    db $ff, $00, $00, $00, $00, $00, $7f, $3e, $41, $63, $c9, $dd, $c1, $41, $dd, $dd
    db $ff, $5d, $7f, $7f, $7f, $c1, $c1, $80, $80, $00, $ff, $be, $c1, $63, $c9, $dd
    db $41, $41, $5d, $5d, $7f, $dd, $ff, $be, $be, $00, $00, $00, $ff, $00, $00, $ff
    db $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $fb, $06, $ae, $8e, $06
    db $06, $56, $56, $56, $fe, $56, $ff, $fb, $fb, $00, $ff, $fb, $06, $ae, $8e, $06
    db $06, $56, $56, $56, $fe, $56, $ff, $fb, $fb, $00, $00, $00, $ff, $00, $00, $ff
    db $fe, $01, $02, $01, $02, $01, $02, $01, $02, $01, $f2, $e1, $12, $11, $f2, $f1
    db $32, $31, $f2, $f1, $12, $11, $f2, $e1, $e2, $01, $f2, $e1, $12, $11, $f2, $f1
    db $32, $31, $f2, $f1, $12, $11, $f2, $e1, $e2, $01, $02, $01, $fe, $01, $00, $ff

Points::
    dw 1
Author::
    db "TOBI      ", 2
History::
    ds 11
    ds 11
    ds 11

Main::
    xor a
    trap DrawBox
    trap $b5
    rcall call_06d9
    ld a, $03
    trap $b4

jump_010c:
    rcall call_0213

jump_0113:
    ld hl, $cc65
    xor a
    ld [hli], a
    ld [hli], a
    ld [hli], a
    ld [hl], a
    rcall call_0615

jump_0122:
    rcall call_05d5
    rcall call_0514
    jr c, .jr_0176
.jr_0132
    rcall call_0322
    rcall call_057d
.jr_0140
    trap AwaitFrame
    rcall call_0684
    trap $d8
    rcall call_04ae
    push af
    rcall call_04f1
    pop af
    jr c, .jr_0132
    rcall call_03b7
    jr c, jump_0122
    ldh a, [$8b]
    bit 3, a
    jr nz, jump_0113
    bit 1, a
    jr nz, .jr_01ab
    bit 2, a
    jr nz, jump_010c
    jr .jr_0140

.jr_0176
    rcall call_0322
    rcall call_057d
    ld a, [$c9a0]
    or a
    jr nz, .jr_0195
    ld hl, $0505
    trap MoveCursor
    rpush strPerfect
    pop hl
    trap DrawString

.jr_0195
    ld hl, $0507
    trap MoveCursor
    rpush strGameOver
    pop hl
    trap DrawString
    rcall call_023a
    rpush jump_0113
    ret

.jr_01ab
    ld hl, $cc67
    ld a, [hli]
    ld b, [hl]
    ld c, a
    or a, b
    jr z, .jr_0140
    dec bc
    dec bc
    ld [hl], b
    dec hl
    ld [hl], c
    push bc
    rcall call_060d
    pop bc
    ld hl, $cc65
    xor a
    ld [hli], a
    ld [hl], a
    ld hl, $c700
    jr .jr_01ef

.jr_01cd
    push bc
    push hl
    rcall call_0322
    rcall call_041f
    rcall call_0486
    rcall call_0445
    pop hl
    pop bc
    dec bc
    dec bc

.jr_01ef
    ld de, $cc60
    ld a, [hli]
    ld [de], a
    inc de
    ld a, [hli]
    ld [de], a
    ld a, c
    or a, b
    jr nz, .jr_01cd
    rpush jump_0122
    ret

strPerfect:
    db "PERFECT!!\n"
strGameOver:
    db "GAME OVER\n"

call_0213:
    ld a, $0c
    trap $b9
    rpush strCredits
    pop hl
    trap DrawLayout
    rcall call_0245

jump_0224:
    trap AwaitFrame
    rcall call_0684
    trap $d8
    bit BtnSel, a
    jr nz, .jr_0238
    and $08
    jr z, jump_0224
    ret

.jr_0238
    trap ExitToMenu

call_023a:
    rcall call_0245
    rpush jump_0224
    ret

call_0245:
    rpush strMenu
    pop hl
    trap DrawLayout
    ld de, $cc65
    rpush data_070a
    pop hl
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    jr c, .jr_0286
    push hl
    push de
    ld hl, $cc40
    ld de, $ff46
    ld bc, $000a
    trap $e4
    pop de
    pop hl
    ld a, $0a
    ld [$0000], a
    ld a, [de]
    ld [hld], a
    dec de
    ld a, [de]
    ld [hl], a
    ld hl, $cc40
    rpush data_070c
    pop de
    ld b, $0a

.jr_027c
    ld a, [hli]
    ld [de], a
    inc de
    dec b
    jr nz, .jr_027c
    xor a
    ld [$0000], a

.jr_0286
    ld hl, $c300
    xor a
    ld [hl], a
    ld hl, $0c0c
    trap MoveCursor
    rpush data_070a
    pop hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $cc40
    push hl
    trap IntToString
    pop hl
    trap DrawString
    rpush data_070c
    pop hl
    ld de, $0001
    ld c, $0a
    trap $5d
    xor a
    ld de, $080d
    ld hl, $0100
    ld bc, $0a01
    trap $59
    ret

strMenu:
    db 3, 2, "SAME GAME KISS\n"
    db 2, 12, "HIGH SCORE\n"
    db 2, 13, "NAME: \n"
    db $ff
strCredits:
    db 2, 5, "ORIGINAL DESIGN\n"
    db 3, 6, "BY KYOTO 1992\n"
    db 2, 8, "SPECIAL THANKS\n"
    db 4, 9, "TO MORISUKE\n"
    db $ff

call_0322:
    ld hl, $c9a0
    ld c, $14
.jr_0327
    ld b, $10
.jr_0329
    res 7, [hl]
    inc hl
    dec b
    jr nz, .jr_0329
    ld de, $0010
    add hl, de
    dec c
    jr nz, .jr_0327
    ld a, $0f
    ld hl, $cc61
    sub [hl]
    ld e, a
    dec hl
    ld d, [hl]
    inc hl
    xor a
    srl d
    rra
    srl d
    rra
    srl d
    rra
    or a, e
    ld e, a
    ld hl, $c9a0
    add hl, de
    ld a, [hl]
    and $f0
    ld c, a
    ld b, $00
    rcall call_037e
    ld a, b
    ldh [$c1], a
    sub $02
    jr nc, .jr_0365
    xor a
.jr_0365
    ld e, a
    ld d, $00
    ld l, d
    ld h, d
.jr_036a
    rra
    jr nc, .jr_036e
    add hl, de
.jr_036e
    sla e
    rl d
    or a
    jr nz, .jr_036a
    ld e, l
    ld d, h
    ld hl, $cc63
    ld [hl], e
    inc hl
    ld [hl], d
    ret

call_037e:
    ld a, [hl]
    or a
    ret z
    bit 7, a
    ret nz
    and $f0
    cp c
    ret nz
    set 7, [hl]
    inc b
    inc hl
    rcall call_037e
    dec hl
    dec hl
    rcall call_037e
    ld de, $ffe1
    add hl, de
    rcall call_037e
    ld de, $0040
    add hl, de
    rcall call_037e
    ld de, $ffe0
    add hl, de
    ret

call_03b7:
    ldh a, [$8b]
    and $01
    ret z
    ldh a, [$c1]
    cp $02
    ccf
    ret nc
    ld hl, $cc67
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc de
    inc de
    ld [hl], d
    dec hl
    ld [hl], e
    dec de
    dec de
    ld l, e
    ld h, d
    ld de, $c700
    add hl, de
    ld de, $cc60
    ld a, [de]
    inc de
    ld [hli], a
    ld a, [de]
    ld [hl], a
    rcall call_041f
    rcall call_057d
    trap $c3
    rcall call_0486
    rcall call_0514
    rcall call_057d
    trap $c3
    rcall call_0445
    jr nc, .jr_041d
    rcall call_0514
    rcall call_057d
    trap $c3
.jr_041d
    scf
    ret

call_041f:
    ld hl, $c9a0
    ld c, $14
.jr_0424
    ld b, $10
.jr_0426
    bit 7, [hl]
    jr z, .jr_042c
    ld [hl], $00
.jr_042c
    inc hl
    dec b
    jr nz, .jr_0426
    ld de, $0010
    add hl, de
    dec c
    jr nz, .jr_0424
    ld hl, $cc63
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld a, [hl]
    add e
    ld [hli], a
    ld a, [hl]
    adc d
    ld [hl], a
    ret

call_0445:
    ld hl, $c9a0
    ld b, $14
.jr_044a
    ld a, [hl]
    or a
    jr z, .jr_0457
    ld de, $0020
    add hl, de
    dec b
    jr nz, .jr_044a
    or a
    ret

.jr_0457
    inc b
    ld c, b
    ld e, l
    ld d, h
.jr_045b
    push hl
    ld l, e
    ld h, d
.jr_045e
    dec c
    jr z, .jr_046b
    ld de, $0020
    add hl, de
    ld a, [hl]
    or a
    jr nz, .jr_046c
    jr .jr_045e

.jr_046b
    inc c
.jr_046c
    ld e, l
    ld d, h
    pop hl
    push de
    push bc
    push hl
    ld b, $10
.jr_0474
    ld a, [de]
    inc de
    ld [hli], a
    dec b
    jr nz, .jr_0474
    pop hl
    ld bc, $0020
    add hl, bc
    pop bc
    pop de
    dec b
    jr nz, .jr_045b
    scf
    ret

call_0486:
    ld hl, $c9a0
    ld c, $14
.jr_048b
    push bc
    push hl
    ld b, $10
    ld c, b
    inc c
    ld e, l
    ld d, h
.jr_0493
    dec c
    jr z, .jr_049c
    ld a, [hli]
    or a
    jr nz, .jr_049f
    jr .jr_0493

.jr_049c
    dec hl
    inc c
    xor a
.jr_049f
    ld [de], a
    inc de
    dec b
    jr nz, .jr_0493
    pop hl
    ld bc, $0020
    add hl, bc
    pop bc
    dec c
    jr nz, .jr_048b
    ret

call_04ae:
    ldh a, [$b6]
    ld b, a
    and $f0
    ret z
    ld hl, $cc60
    ld d, [hl]
    inc hl
    ld e, [hl]
    dec hl
    bit 5, b
    jr z, .jr_04c6
    dec d
    bit 7, d
    jr z, .jr_04c6
    ld d, $13
.jr_04c6
    bit 4, b
    jr z, .jr_04d2
    inc d
    ld a, d
    cp $14
    jr c, .jr_04d2
    ld d, $00
.jr_04d2
    bit 6, b
    jr z, .jr_04dd
    dec e
    bit 7, e
    jr z, .jr_04dd
    ld e, $0f
.jr_04dd
    bit 7, b
    jr z, .jr_04e9
    inc e
    ld a, e
    cp $10
    jr c, .jr_04e9
    ld e, $00
.jr_04e9
    ld [hl], d
    inc hl
    ld [hl], e
    inc hl
    ld [hl], $00
    scf
    ret

call_04f1:
    ld hl, $c300
    xor a
    ld [hli], a
    ld [hld], a
    push hl
    ld hl, $cc62
    ld a, [hl]
    inc [hl]
    bit 4, a
    pop hl
    ret nz
    ld a, [$cc61]
    add a
    add a
    add a
    add $14
    ld [hli], a
    ld a, [$cc60]
    add a
    add a
    add a
    add $0c
    ld [hli], a
    ret

call_0514:
    xor a
    ldh [$c0], a
    ld hl, $c9a0
    ld c, $14
.jr_051c
    push hl
    push bc
    ld b, $10
.jr_0520
    push bc
    push hl
    ld b, $00
    ld a, [hl]
    and $f0
    jr z, .jr_055b
    ld c, a
    ld de, $0020
    add hl, de
    ld a, [hl]
    and $f0
    cp c
    jr nz, .jr_0535
    inc b
.jr_0535
    ld de, $ffc0
    add hl, de
    ld a, [hl]
    sla b
    and $f0
    cp c
    jr nz, .jr_0542
    inc b
.jr_0542
    ld de, $001f
    add hl, de
    ld a, [hli]
    sla b
    and $f0
    cp c
    jr nz, .jr_054f
    inc b
.jr_054f
    inc hl
    ld a, [hl]
    sla b
    and $f0
    cp c
    jr nz, .jr_0559
    inc b
.jr_0559
    ld a, b
    add c
.jr_055b
    pop hl
    ld [hl], a
    and $0f
    ld c, a
    ldh a, [$c0]
    or c
    ldh [$c0], a
    pop bc
    inc hl
    dec b
    jr nz, .jr_0520
    pop bc
    pop hl
    ld de, $0020
    add hl, de
    ld a, [hl]
    or a
    jr z, .jr_0577
    dec c
    jr nz, .jr_051c
.jr_0577
    ldh a, [$c0]
    or a
    ret nz
    scf
    ret

call_057d:
    ld hl, $9800
    ld de, $c9af
    ld c, $10
.jr_0585
    push de
    push hl
    ld l, e
    ld h, d
    ld de, $cc40
    ld b, $14
.jr_058e
    push bc
    ld a, [hl]
    ld c, $a0
    bit 7, a
    jr nz, .jr_059d
    ld c, $50
    or a
    jr nz, .jr_059d
    ld c, $20
.jr_059d
    and $7f
    add c
    ld [de], a
    inc de
    ld bc, $0020
    add hl, bc
    pop bc
    dec b
    jr nz, .jr_058e
    pop hl
    push bc
    push hl
    ld de, $cc40
    ld bc, $0014
    trap $02
    pop hl
    ld bc, $0020
    add hl, bc
    pop bc
    pop de
    dec de
    dec c
    jr nz, .jr_0585
    ld hl, $0611
    trap MoveCursor
    ld hl, $cc63
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $cc40
    push hl
    trap IntToString
    pop hl
    trap DrawString
    ret

call_05d5:
    ld hl, $0d11
    trap MoveCursor
    ld hl, $cc65
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $cc40
    push hl
    trap IntToString
    pop hl
    trap DrawString
    ld de, $0010
    rpush strStatus
    pop hl
    trap DrawStringList
    ret

strStatus:
    db "SAME     GET  SCORE\n"
    db "GAME\n"
    db "\n"

call_060d:
    ld hl, $c3b2
    ld de, $cc6b
    jr jump_062d

call_0615:
    ldh a, [$8a]
    and $03
    jr z, call_0627
.jr_061b
    rcall call_0627
    cp $55
    jr c, .jr_061b
    ret

call_0627:
    ld de, $c3b2
    ld hl, $cc6b
jump_062d:
    ld bc, $0003
    trap $02
    ld hl, $cc90
    ld b, $05
    xor a
.jr_0638
    ld [hli], a
    dec b
    jr nz, .jr_0638
    ld de, $c9a0
    ld c, $14
.jr_0641
    push de
    push bc
    ld b, $10
.jr_0645
    rcall call_0684
    add hl, hl
    add hl, hl
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    push hl
    push bc
    ld hl, $cc90
    ld c, a
    ld b, $00
    add hl, bc
    inc [hl]
    pop bc
    pop hl
    inc a
    swap a
    ld [de], a
    inc de
    dec b
    jr nz, .jr_0645
    pop bc
    pop de
    ld hl, $0020
    add hl, de
    ld e, l
    ld d, h
    dec c
    jr nz, .jr_0641
    ld hl, $cc90
    ld c, $00
    ld b, $05
.jr_067a
    ld a, [hli]
    cp c
    jr c, .jr_067f
    ld c, a
.jr_067f
    dec b
    jr nz, .jr_067a
    ld a, c
    ret

call_0684:
    push de
    ld hl, $c3b2
    ld a, [hli]
    ld d, [hl]
    inc hl
    ld e, a
    ld a, d
    rlca
    rlca
    xor e
    rra
    push af
    ld a, d
    xor e
    ld d, a
    ld a, [hl]
    xor e
    ld e, a
    pop af
    rl e
    rl d
    ld a, d
    xor a, e
    inc [hl]
    dec hl
    ld [hl], d
    dec hl
    ld [hl], e
    pop de
    ld l, a
    ld h, $00
    ret

call_06d9:
    ld a, $e4
    ldh [$9d], a
    ld hl, $cc60
    xor a
    ld [hli], a
    ld [hli], a
    ld [hl], a
    rpush data_070a
    pop hl
    ld de, $cc69
    ld a, [hli]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    rpush data_0716
    pop de
    ld b, $c6
    trap $62
    ld de, $8000
    ld bc, $0010
    trap $63
    ld b, $60
    ld c, $05
.jr_06d4
    push bc
    ld de, $c980
    push de
    ld bc, $0100
    trap $63
    pop hl
    pop bc
    ld a, b
    push bc
    push af
    push hl
    ld d, a
    ld e, $00
    ld c, $10
    trap $4c
    pop hl
    pop af
    add $50
    ld d, a
    ld e, $01
    ld c, $10
    trap $4c
    pop bc
    swap b
    inc b
    swap b
    dec c
    jr nz, .jr_06d4
    ld hl, $c980
    ld bc, $02c0
    ld e, $00
    trap $a6
    ret

data_070a:
    dw 0
data_070c:
    db "          "

data_0716:
    db $ff, $c0, $c0, $e0, $a0, $f0
    db $90, $f8, $88, $ff, $fc, $84, $fe, $9a, $e7, $a5, $c3, $c3, $50, $ed, $01, $18
    db $01, $7e, $05, $12, $01, $ff, $44, $0f, $08, $e3, $a8, $0f, $2e, $e4, $e9, $f8
    db $45, $1a, $1f, $45, $88, $08, $3f, $2e, $a8, $65, $e9, $41, $1f, $85, $1f, $a8
    db $85, $08, $7f, $8a, $2e, $a5, $84, $e9, $ff, $c5, $1a, $1f, $c5, $88, $0e, $bf
    db $2e, $a8, $e5, $a3, $05, $3c, $3c, $42, $03, $00, $01, $00, $a3, $03, $66, $07
    db $ff, $af, $2a, $03, $10, $a3, $e3, $fc, $fc, $02, $43, $50, $41, $0d, $2a, $c2
    db $c2, $01, $43, $3f, $a0, $51, $2e, $28, $51, $6b, $20, $a3, $3f, $c6, $3f, $40
    db $83, $50, $81, $0d, $2a, $43, $43, $83, $00, $7f, $a0, $91, $2e, $28, $91, $ab
    db $22, $e3, $dd, $82, $0d, $c0, $c3, $c3, $c3, $aa, $bf, $d1, $02, $2e, $d1, $82
    db $eb, $7e, $20, $01, $00, $24, $00, $e7, $00, $81, $05, $10, $04, $00, $02, $00
    db $01, $66, $01, $12, $20, $10, $fe, $03, $80, $7e, $c6, $1c, $00, $fe, $10, $a6
    db $10, $16, $40, $c9, $f8, $8e, $00, $fa, $00, $02, $45, $10, $44, $42, $01, $7e
    db $8d, $00, $e6, $00, $64, $00, $04, $55, $13, $e0, $7c, $00, $c0, $c6, $5c, $00
    db $5a, $56, $20, $54, $07, $52, $00, $fe, $50, $84, $6a, $c9, $01, $71, $00, $5f
    db $c3, $00, $40, $85, $84, $00, $82, $4e, $21, $67, $00, $ee, $26, $00, $20, $95
    db $3e, $00, $03, $c6, $30, $00, $9c, $9a, $02, $96, $94, $00, $92, $6e, $26, $92
    db $aa, $41, $00, $e9, $1b, $72, $f2, $fe, $00, $04, $10, $08, $c6, $c0, $80, $02
    db $10, $04, $02, $6e, $d2, $64, $ea, $c0, $01, $3c, $c9, $00, $04, $40, $02, $20
    db $28, $10, $0c, $2a, $00, $2a, $f3, $e3, $e0, $fc, $00, $fe, $43, $50, $42, $c8
    db $26, $44, $4a, $4a, $03, $40, $44, $02, $04, $52, $82, $6c, $c0, $05, $3f, $00
    db $80, $7f, $83, $82, $02, $c8, $84, $64, $8a, $80, $a0, $84, $08, $04, $28, $92
    db $ac, $20, $e0, $ff, $c1, $92, $8e, $c2, $cc, $1f, $c0, $04, $2c, $e2, $80, $40
    db $01, $3c, $03, $78, $03, $46, $02, $7d, $01, $fe, $03, $07, $6a, $ff, $1d, $29
    db $f1, $10, $cd, $14, $01, $fc, $03, $43, $02, $a0, $fd, $0d, $25, $7c, $44, $49
    db $4a, $3f, $03, $6a, $63, $0e, $1f, $11, $a1, $83, $41, $b1, $ff, $3c, $00, $8f
    db $0a, $20, $83, $7f, $a4, $3e, $02, $82, $75, $3b, $d5, $81, $f4, $00, $4f, $2a
    db $c3, $bf, $a6, $03, $e3, $a0

End:
