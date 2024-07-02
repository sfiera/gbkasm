; Disassembly of "shot.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db kFileHasIcon2bpp | kFileMarkerCircle | kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db .end - @ - 1            ; length of variable parts of header
    db $68                     ; owner code
.title
    dk "SHOT"
.icon
    INCBIN "gfx/shot/icon.2bpp"
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

jr_0106:
    callx code_019d
    ld a, $0a
    ld [wramTime], a
    xor a
    ld hl, wramShot
    ld [hli], a
    ld [hl], a
    trap $db
    callx code_0167
    callx code_0192

code_0128:
    trap $da
    bit 2, l
    jr nz, jr_0159

    ld a, l
    and $03
    jr z, code_0128

    xor a
    ldh [$83], a

jr_0136:
    callx code_0183
    callx code_015b
    jr nz, jr_0136
    callx code_019d
    trap $db

jr_014f:
    trap $da
    bit 3, l
    jr nz, jr_0106

    bit 2, l
    jr z, jr_014f

jr_0159:
    trap ExitToMenu

code_015b:
    ldh a, [$83]
    sub $3c
    jr c, code_0167

    ldh [$83], a
    ld hl, wramTime
    dec [hl]

code_0167:
    ld hl, $0b06
    ld a, [wramTime]
    ld e, a
    ld d, $00

jr_0170:
    push de
    trap MovePen
    pop de
    ld hl, wramAtoiScratch
    trap IntToString
    ld hl, wramAtoiScratch + 3
    trap DrawString
    ld a, [wramTime]
    or a

jr_0182:
    ret


code_0183:
    trap $da
    ld a, l
    and $03
    jr z, jr_0182

    ld hl, wramShot
    inc [hl]
    jr nz, code_0192
    inc hl
    inc [hl]

code_0192:
    ld hl, wramShot
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0b08
    jr jr_0170


code_019d:
    ldx hl, gfx
    trap DrawLayout
    ld hl, wramShot
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, wramHighScore
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
    ld hl, wramHighScore
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0b0e
    jr jr_0170


gfx:
    dk $03, $01, "SHOOTING MASTER\n"
    dk $06, $06, "TIME:\n"
    dk $06, $08, "SHOT:\n"
    dk $05, $0c, "»HIGH SCORE\n"
    dk $06, $0e, "SHOT:\n"
    dk $ff


SECTION "WRAM 0", WRAM0[$cc40]

wramAtoiScratch:
    ds 6


SECTION "WRAM 1", WRAM0[$cc95]

wramTime:
    ds 1
wramShot:
    ds 2
wramHighScore:
    ds 2
