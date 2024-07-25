; Disassembly of "shot.gbf"

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_ICON | FILE_2BPP | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $68           ; owner code
.title
    dk "SHOT"
.icon
    INCBIN "gfx/iconsend/gun.2bpp"
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
    ld hl, $1200
    trap $b6
    ld a, $01
    trap LCDEnable

.reset
    callx DrawScreen
    ld a, $0a
    ld [VarTime], a
    xor a
    ld hl, VarCount
    ld [hli], a
    ld [hl], a
    trap $db
    callx DrawTime
    callx DrawCount

.waitStart
    trap $da
    bit BTN_SEL_F, l
    jr nz, .exit

    ld a, l
    and BTN_AB
    jr z, .waitStart

    xor a
    ldh [$83], a

.play
    callx CheckCount
    callx CheckTime
    jr nz, .play
    callx DrawScreen
    trap $db

.waitDone
    trap $da
    bit BTN_STA_F, l
    jr nz, .reset

    bit BTN_SEL_F, l
    jr z, .waitDone

.exit
    trap ExitToMenu

CheckTime:
    ldh a, [$83]
    sub 60
    jr c, DrawTime

    ldh [$83], a
    ld hl, VarTime
    dec [hl]

DrawTime:
    ld hl, $0b06
    ld a, [VarTime]
    ld e, a
    ld d, $00

DrawInt:
    push de
    trap DrawAt
    pop de
    ld hl, VarAtoiScratch
    trap StrConvInt
    ld hl, VarAtoiScratch + 3
    trap DrawString
    ld a, [VarTime]
    or a

.ret
    ret


CheckCount:
    trap $da
    ld a, l
    and BTN_AB
    jr z, DrawInt.ret

    ld hl, VarCount
    inc [hl]
    jr nz, DrawCount
    inc hl
    inc [hl]

DrawCount:
    ld hl, VarCount
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0b08
    jr DrawInt


DrawScreen:
    ldx hl, Layout
    trap DrawLayout
    ld hl, VarCount
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, VarHighScore
    ld a, e
    sub [hl]
    inc hl
    ld a, d
    sbc [hl]
    dec hl
    jr c, .highScoreUnchanged

    ld [hl], e
    inc hl
    ld [hl], d

.highScoreUnchanged
    ld hl, VarHighScore
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0b0e
    jr DrawInt


Layout:
    dk $03, $01, "SHOOTING MASTER\0"
    dk $06, $06, "TIME:\0"
    dk $06, $08, "SHOT:\0"
    dk $05, $0c, "»HIGH SCORE\0"
    dk $06, $0e, "SHOT:\0"
    dk $ff


SECTION "WRAM 0", WRAM0[$cc40]

VarAtoiScratch:
    ds 6


SECTION "WRAM 1", WRAM0[$cc95]

VarTime:
    ds 1
VarCount:
    ds 2
VarHighScore:
    ds 2
