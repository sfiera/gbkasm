; Disassembly of "saita.gbf"

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

DEF FIELD_WIDTH   EQU $14
DEF FIELD_HEIGHT  EQU $10

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_ICON | FILE_2BPP | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $67           ; owner code
.title
    dk "SAMEGAME"
.icon
    INCBIN "../out/src/samegame/icon.2bpp"
.end

History:
.points
    dw 1
.author
    dp "TOBI      ", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    xor a
    trap DrawInit
    trap LCDDisable
    callx SetupGfx
    ld a, $03
    trap LCDEnable

jump_010c:
    callx ShowTitleScreen

jump_0113:
    ld hl, varScore
    xor a
    ld [hli], a
    ld [hli], a
    ld [hli], a
    ld [hl], a
    callx call_0615

jump_0122:
    callx call_05d5
    callx call_0514
    jr c, .jr_0176
.jr_0132
    callx call_0322
    callx call_057d
.jr_0140
    trap AwaitFrame
    callx call_0684
    trap InputButtons
    callx call_04ae
    push af
    callx call_04f1
    pop af
    jr c, .jr_0132
    callx call_03b7
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
    callx call_0322
    callx call_057d
    ld a, [varField]
    or a
    jr nz, .jr_0195
    ld hl, $0505
    trap DrawAt
    ldx hl, strPerfect
    trap DrawString

.jr_0195
    ld hl, $0507
    trap DrawAt
    ldx hl, strGameOver
    trap DrawString
    callx ShowNewGame
    jx jump_0113

.jr_01ab
    ld hl, varCC67
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
    callx call_060d
    pop bc
    ld hl, varScore
    xor a
    ld [hli], a
    ld [hl], a
    ld hl, $c700
    jr .jr_01ef

.jr_01cd
    push bc
    push hl
    callx call_0322
    callx call_041f
    callx call_0486
    callx call_0445
    pop hl
    pop bc
    dec bc
    dec bc

.jr_01ef
    ld de, varCursor
    ld a, [hli]
    ld [de], a
    inc de
    ld a, [hli]
    ld [de], a
    ld a, c
    or a, b
    jr nz, .jr_01cd
    jx jump_0122

strPerfect:
    dk "PERFECT!!\0"
strGameOver:
    dk "GAME OVER\0"

ShowTitleScreen:
    ld a, $0c
    trap DrawCtrlChar
    ldx hl, strCredits
    trap DrawLayout
    callx ShowHiScore

.loop
    trap AwaitFrame
    callx call_0684
    trap InputButtons
    bit BTN_SEL_F, a
    jr nz, .exit
    and BTN_STA
    jr z, .loop
    ret

.exit
    trap ExitToMenu

ShowNewGame:
    callx ShowHiScore
    jx ShowTitleScreen.loop

ShowHiScore:
    ldx hl, strMenu
    trap DrawLayout
    ld de, varScore
    ldx hl, intHiScore
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
    trap CRAMRead
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
    ldx de, strHiScoreName
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
    trap DrawAt
    ldx hl, intHiScore
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $cc40
    push hl
    trap StrConvInt
    pop hl
    trap DrawString
    ldx hl, strHiScoreName
    ld de, $0001
    ld c, $0a
    trap TileLoadText
    xor a
    ld de, $080d
    ld hl, $0100
    ld bc, $0a01
    trap $59
    ret

strMenu:
    dk 3, 2, "SAME GAME KISS\0"
    dk 2, 12, "HIGH SCORE\0"
    dk 2, 13, "NAME: \0"
    dk $ff
strCredits:
    dk 2, 5, "ORIGINAL DESIGN\0"
    dk 3, 6, "BY KYOTO 1992\0"
    dk 2, 8, "SPECIAL THANKS\0"
    dk 4, 9, "TO MORISUKE\0"
    dk $ff

call_0322:
    ld hl, varField
    ld c, FIELD_WIDTH
.jr_0327
    ld b, FIELD_HEIGHT
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
    ld hl, varCursor.y
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
    ld hl, varField
    add hl, de
    ld a, [hl]
    and $f0
    ld c, a
    ld b, $00
    callx call_037e
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
    ld hl, varAward
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
    callx call_037e
    dec hl
    dec hl
    callx call_037e
    ld de, $ffe1
    add hl, de
    callx call_037e
    ld de, $0040
    add hl, de
    callx call_037e
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
    ld hl, varCC67
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
    ld de, varCursor
    ld a, [de]
    inc de
    ld [hli], a
    ld a, [de]
    ld [hl], a
    callx call_041f
    callx call_057d
    trap AwaitBlit
    callx call_0486
    callx call_0514
    callx call_057d
    trap AwaitBlit
    callx call_0445
    jr nc, .jr_041d
    callx call_0514
    callx call_057d
    trap AwaitBlit
.jr_041d
    scf
    ret

call_041f:
    ld hl, varField
    ld c, FIELD_WIDTH
.nextColumn
    ld b, FIELD_HEIGHT
.nextTile
    bit 7, [hl]
    jr z, .jr_042c
    ld [hl], $00
.jr_042c
    inc hl
    dec b
    jr nz, .nextTile
    ld de, $0010
    add hl, de
    dec c
    jr nz, .nextColumn
    ld hl, varAward
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
    ld hl, varField
    ld b, FIELD_WIDTH
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
    ld b, FIELD_HEIGHT
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
    ld hl, varField
    ld c, FIELD_WIDTH
.jr_048b
    push bc
    push hl
    ld b, FIELD_HEIGHT
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
    ld hl, varCursor
    ld d, [hl]
    inc hl
    ld e, [hl]
    dec hl
.left
    bit BTN_LT_F, b
    jr z, .right
    dec d
    bit 7, d
    jr z, .right
    ld d, FIELD_WIDTH - 1
.right
    bit BTN_RT_F, b
    jr z, .up
    inc d
    ld a, d
    cp FIELD_WIDTH
    jr c, .up
    ld d, $00
.up
    bit BTN_UP_F, b
    jr z, .down
    dec e
    bit 7, e
    jr z, .down
    ld e, FIELD_HEIGHT - 1
.down
    bit BTN_DN_F, b
    jr z, .done
    inc e
    ld a, e
    cp FIELD_HEIGHT
    jr c, .done
    ld e, $00
.done
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
    ld hl, varTimer
    ld a, [hl]
    inc [hl]
    bit 4, a
    pop hl
    ret nz
    ld a, [varCursor.y]
    add a
    add a
    add a
    add FIELD_WIDTH
    ld [hli], a
    ld a, [varCursor]
    add a
    add a
    add a
    add $0c
    ld [hli], a
    ret

call_0514:
    xor a
    ldh [$c0], a
    ld hl, varField
    ld c, FIELD_WIDTH
.jr_051c
    push hl
    push bc
    ld b, FIELD_HEIGHT
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
    ld c, FIELD_HEIGHT
.jr_0585
    push de
    push hl
    ld l, e
    ld h, d
    ld de, $cc40
    ld b, FIELD_WIDTH
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
    trap MemCopy
    pop hl
    ld bc, $0020
    add hl, bc
    pop bc
    pop de
    dec de
    dec c
    jr nz, .jr_0585
    ld hl, $0611
    trap DrawAt
    ld hl, varAward
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $cc40
    push hl
    trap StrConvInt
    pop hl
    trap DrawString
    ret

call_05d5:
    ld hl, $0d11
    trap DrawAt
    ld hl, varScore
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $cc40
    push hl
    trap StrConvInt
    pop hl
    trap DrawString
    ld de, $0010
    ldx hl, strStatus
    trap DrawStringList
    ret

strStatus:
    dk "SAME     GET  SCORE\0"
    dk "GAME\0"
    dk "\0"

call_060d:
    ld hl, $c3b2
    ld de, $cc6b
    jr jump_062d

call_0615:
    ldh a, [$8a]
    and $03
    jr z, call_0627
.jr_061b
    callx call_0627
    cp $55
    jr c, .jr_061b
    ret

call_0627:
    ld de, $c3b2
    ld hl, $cc6b
jump_062d:
    ld bc, $0003
    trap MemCopy
    ld hl, $cc90
    ld b, $05
    xor a
.jr_0638
    ld [hli], a
    dec b
    jr nz, .jr_0638
    ld de, varField
    ld c, FIELD_WIDTH
.jr_0641
    push de
    push bc
    ld b, FIELD_HEIGHT
.jr_0645
    callx call_0684
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

SetupGfx:
    ld a, $e4
    ldh [$9d], a
    ld hl, varCursor
    xor a
    ld [hli], a
    ld [hli], a
    ld [hl], a
    ldx hl, intHiScore
    ld de, varHiScore
    ld a, [hli]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ldx de, gfxTileset
    ld b, $c6
    trap ExtractInit
    ld de, $8000
    ld bc, $0010
    trap ExtractData
    ld b, $60
    ld c, $05
.jr_06d4
    push bc
    ld de, varC980
    push de
    ld bc, $0100
    trap ExtractData
    pop hl
    pop bc
    ld a, b
    push bc
    push af
    push hl
    ld d, a
    ld e, $00
    ld c, $10
    trap TileLoad
    pop hl
    pop af
    add $50
    ld d, a
    ld e, $01
    ld c, $10
    trap TileLoad
    pop bc
    swap b
    inc b
    swap b
    dec c
    jr nz, .jr_06d4
    ld hl, varC980
    ld bc, $02c0
    ld e, $00
    trap MemSet
    ret

intHiScore:
    dw 0
strHiScoreName:
    dk "          "

gfxTileset:
    INCBIN "../out/src/samegame/tiles.hz"


SECTION "Field", WRAM0[$c980]

varC980: ds 32
varField: ds 320

SECTION "Variables", WRAM0[$cc60]

; 0C 0C A3 E4 06 B9 00 7C 00 46 0C D8 03 ED 00 00

varCursor:
.x ds 1
.y ds 1
varTimer: ds 1
varAward: ds 2
varScore: ds 2
varCC67: ds 1
varCC68: ds 1
varHiScore: ds 2
