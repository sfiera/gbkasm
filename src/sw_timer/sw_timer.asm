; Disassembly of "watch-and-timer.gbf"

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
    db $6a           ; owner code
.title
    dk "WATCH&TIMER"
.icon
    INCBIN "../out/src/iconsend/tokei.2bpp"
.end

History:
.points
    dw 1000
.author
    dp "Y.MOTOSAKO", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    callx SetUpGfx
jr_0106:
    callx call_011a
    db $20, $09
    callx call_01e8
    jr z, jr_0106
    trap ExitToMenu

call_011a:
    ld bc, $0700
    trap $c4
    callx call_01a0
jr_0126:
    ld h, $01
    ld de, $060a
    ld bc, $0000
    callx call_0778
    trap InputButtons
    ldh [$c4], a
    bit 1, a
    jr z, jr_0166
    ldh a, [$c3]
    bit 7, a
    jr z, jr_015f
    cp $86
    jr nc, jr_014a
    inc a
    ldh [$c3], a
jr_014a:
    and $7f
    inc a
    ld hl, $ffc7
    callx call_06ac
    ldh a, [$cc]
    add $30
    trap DrawChar
    jr jr_0166
jr_015f:
    callx call_01a0
jr_0166:
    callx call_07d3
    jx jr_0126

data_0171:
    dk "STOP WATCH\0"
data_017c:
    dk "[B]:Lap/Clear   \0"
data_018d:
    dk "[START] :Timer    \0"

call_01a0:
    ldx hl, data_0171
    callx call_0671
    xor a
    ldh [$c7], a
    ldh [$c8], a
    ldh [$c9], a
    ldh [$ca], a
    ldh [$cc], a
jp_01b6:
    ldh [$c3], a
    xor a
    ldh [$c1], a
    ldh [$c2], a
    callx call_05af
    callx call_05b5
    callx call_05d9
    callx call_05bb
    callx call_05c1
    callx call_059d
    ret

call_01e8:
    xor a
    ldh [$c5], a
    inc a
    ldh [$c6], a
    callx call_03c2
jp_01f5:
    ld h, $ff
    ld de, $ffff
    ld bc, $0509
    callx call_0778
    ldh a, [$c3]
    and $80
    jr z, jr_022b
    ld hl, $ffc7
    ld b, $04
    xor a
jr_0210:
    or [hl]
    inc hl
    dec b
    jr nz, jr_0210
    or a
    jr nz, jr_022b
    ldh [$cc], a
    callx call_059d
    callx call_032a
    xor a
    ldh [$c3], a
jr_022b:
    trap InputButtons
    ldh [$c4], a
    bit 1, a
    jr z, jr_024e
    ldh a, [$c3]
    bit 7, a
    jr nz, jr_0247
    ldh a, [$c5]
    inc a
    cp $06
    jr c, jr_0241
    xor a
jr_0241:
    ldh [$c5], a
    ld a, $01
    ldh [$c6], a
jr_0247:
    callx call_03cd
jr_024e:
    ldh a, [$c4]
    bit 0, a
    jr z, jr_0260
    ldh a, [$c3]
    or a
    jr nz, jr_0260
    callx call_03cd
jr_0260:
    callx call_07d3
    ldh a, [$c4]
    bit 4, a
    jr z, jr_027e
    ldh a, [$c6]
    inc a
    cp $05
    jr c, jr_0275
    xor a
jr_0275:
    ldh [$c6], a
    callx call_0418
jr_027e:
    ldh a, [$c4]
    bit 5, a
    jr z, jr_0295
    ldh a, [$c6]
    sub $01
    jr nc, jr_028c
    ld a, $04
jr_028c:
    ldh [$c6], a
    callx call_0418
jr_0295:
    ldh a, [$c4]
    bit 6, a
    jr z, jr_02a2
    callx call_02b8
jr_02a2:
    ldh a, [$c4]
    bit 7, a
    jr z, jr_02af
    callx call_02c8
jr_02af:
    jx jp_01f5

call_02b3:
    add hl, bc
    add hl, bc
    dec b
    add hl, bc
    inc b
call_02b8:
    callx call_030e
    inc [hl]
    ld a, b
    cp [hl]
    jr nc, jr_02c6
    ld [hl], $00
jr_02c6:
    jr jr_02d6

call_02c8:
    callx call_030e
    ld a, [hl]
    sub $01
    jr nc, jr_02d5
    ld a, b
jr_02d5:
    ld [hl], a
jr_02d6:
    xor a
    ld [$0000], a
    ld a, [hl]
    add $30
    push af
    ld hl, $ffc7
    ld bc, $0005
    trap MemCopy
    ldh a, [$c5]
    add $02
    callx call_0698
    ldh a, [$c6]
    or a
    jr z, jr_0305
    inc h
    dec a
    jr z, jr_0305
    inc h
    inc h
    dec a
    jr z, jr_0305
    inc h
    dec a
    jr z, jr_0305
    inc h
    inc h
jr_0305:
    trap DrawAt
    pop af
    trap DrawChar
    xor a
    ldh [$c3], a
    ret

call_030e:
    ldh a, [$c6]
    ld c, a
    ld b, $00
    callx call_0407
    ldx hl, call_02b3
    add hl, bc
    ld a, [hl]
    ld l, e
    ld h, d
    add hl, bc
    ld b, a
    ld a, $0a
    ld [$0000], a
    ret

call_032a:
    ldh a, [$cb]
    dec a
    jr z, jr_0339
    dec a
    jr z, jr_033d
    dec a
    jr z, jr_0349
    dec a
    jr z, jr_0360
    ret

jr_0339:
    ld a, $1d
    jr jr_033f

jr_033d:
    ld a, $36
jr_033f:
    trap AudioPlaySound
jr_0341:
    trap AwaitFrame
    trap AudioGetSound
    or a
    jr nz, jr_0341
    ret

jr_0349:
    ld c, $04
jr_034b:
    ld b, $04
jr_034d:
    ld a, $2b
    trap AudioPlaySound
    ld a, $05
    trap AwaitButton
    dec b
    jr nz, jr_034d
    ld a, $19
    trap AwaitButton
    dec c
    jr nz, jr_034b
    ret

jr_0360:
    ld b, $04
jr_0362:
    ld a, $2e
    trap AudioPlaySound
    callx jr_0341
    ld a, $0a
    trap AwaitButton
    dec b
    jr nz, jr_0362
    ret

data_0375:
    db 0, 1, 0, 0, $01  ; 01:00, alarm 1
    db 0, 2, 0, 0, $02  ; 02:00, alarm 2
    db 0, 3, 0, 0, $03  ; 03:00, alarm 3
    db 0, 4, 0, 0, $04  ; 04:00, alarm 4
    db 0, 5, 0, 0, $03  ; 05:00, alarm 3
    db 6, 0, 0, 0, $04  ; 60:00, alarm 4

data_0393:
    dk "  TIMER   \0"
    dk "[B]:Rec.No/Clear\0"
    dk "[START] :StopWatch\0"

call_03c2:
    ldx hl, data_0393
    callx call_0671
call_03cd:
    ldx hl, data_0375
    ld bc, $0602
jr_03d4:
    push bc
    ld a, c
    callx call_06ac
    ld a, [hli]
    add "0"
    trap DrawChar
    pop bc
    inc c
    dec b
    jr nz, jr_03d4
    callx call_0418
    callx call_0407
    ld hl, $ffc7
    ld bc, $0005
    trap MemCopy
    ld a, $0a
    ldh [$cc], a
    ld a, $01
    jx jp_01b6

call_0407:
    ldx de, data_0375
    ldh a, [$c5]
    ld l, a
    add a
    add a
    add l
    add e
    ld e, a
    ld a, $00
    adc d
    ld d, a
    ret

call_0418:
    ldh a, [$c5]
    add $02
    callx call_0698
    ld a, h
    add a
    add a
    add a
    add $08
    ld d, a
    ld a, l
    add a
    add a
    add a
    add $10
    ld e, a
    ld h, $00
    ld l, $00
    callx call_046d
    ld l, $01
    callx call_046b
    ld l, $ff
    callx call_046b
    ld l, $02
    callx call_046b
    ld l, $03
    callx call_046b
    ld l, $ff
    callx call_046b
    ld l, $04
call_046b:
    ld h, $ff
call_046d:
    ldh a, [$c6]
    sub l
    jr z, jr_0474
    ld a, $02
jr_0474:
    ld l, a
    ld a, h
    ld h, $80
    ld bc, $0101
    push de
    trap $c5
    pop de
    ld a, d
    add $08
    ld d, a
    ret

data_0484:
    db $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
    db $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

PUSHC
NEWCHARMAP TimerDigits
CHARMAP "数", $00
CHARMAP "　", $20
data_04c4:
    db "数数数"
    db "数　数"
    db "数　数"
    db "数　数"
    db "数　数"
    db "数　数"
    db "数数数"

    db "　数　"
    db "　数　"
    db "　数　"
    db "　数　"
    db "　数　"
    db "　数　"
    db "　数　"

    db "数数数"
    db "数　数"
    db "　　数"
    db "数数数"
    db "数　　"
    db "数　　"
    db "数数数"

    db "数数数"
    db "数　数"
    db "　　数"
    db "　数数"
    db "　　数"
    db "数　数"
    db "数数数"

    db "数　数"
    db "数　数"
    db "数　数"
    db "数数数"
    db "　　数"
    db "　　数"
    db "　　数"

    db "数数数"
    db "数　　"
    db "数　　"
    db "数数数"
    db "　　数"
    db "数　数"
    db "数数数"

    db "数数数"
    db "数　数"
    db "数　　"
    db "数数数"
    db "数　数"
    db "数　数"
    db "数数数"

    db "数数数"
    db "　　数"
    db "　　数"
    db "　　数"
    db "　　数"
    db "　　数"
    db "　　数"

    db "数数数"
    db "数　数"
    db "数　数"
    db "数数数"
    db "数　数"
    db "数　数"
    db "数数数"

    db "数数数"
    db "数　数"
    db "数　数"
    db "数数数"
    db "　　数"
    db "数　数"
    db "数数数"

    db "　"
    db "数"
    db "　"
    db "　"
    db "　"
    db "数"
    db "　"
POPC

call_059d:
    ld hl, $120c
    trap DrawAt
    ldh a, [$cc]
    add "0"
    cp $3a
    jr nz, jr_05ac
    ld a, $20
jr_05ac:
    trap DrawChar
    ret

call_05af:
    ldh a, [$c7]
    ld h, $01
    jr jr_05c5

call_05b5:
    ldh a, [$c8]
    ld h, $05
    jr jr_05c5

call_05bb:
    ldh a, [$c9]
    ld h, $0b
    jr jr_05c5

call_05c1:
    ldh a, [$ca]
    ld h, $0f
jr_05c5:
    ld e, a
    add a
    add a
    add e
    add a
    add a
    add e
    ld de, $c613
    add e
    ld e, a
    ld a, $00
    adc d
    ld d, a
    ld a, $03
    jr jr_05e0

call_05d9:
    ld h, $09
    ld de, $c6e5
    ld a, $01
jr_05e0:
    push bc
    ld c, h
    ld hl, $0006
    ld b, h
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, bc
    ld bc, $9800
    add hl, bc
    ld c, a
    ld b, $07
jr_05f3:
    push bc
    push de
    push hl
    ld b, $00
    trap MemCopy
    pop hl
    ld bc, $0020
    add hl, bc
    pop de
    pop bc
    ld a, c
    add e
    ld e, a
    ld a, $00
    adc d
    ld d, a
    dec b
    jr nz, jr_05f3
    pop bc
    ret

data_060d:
    dk "1=         2=       "
    dk "3=         4=       "
    dk "5=         6=       \r"
    dk "\r"
    dk "\r"
    dk "\r"
    dk "\r"
    dk "\r"
    dk "\r"
    dk "\r"
    dk "\r"
    dk "[A]:Start/Stop\r"
    dk "\r"
    dk "\r"
    dk "[SELECT]:Exit\0"

call_0671:
    push hl
    ld hl, $0500
    trap DrawAt
    pop hl
    trap DrawString
    push hl
    ld hl, $000f
    trap DrawAt
    pop hl
    trap DrawString
    push hl
    ld hl, $0010
    trap DrawAt
    pop hl
    trap DrawString
    ld hl, $0002
    trap DrawAt
    ldx hl, data_060d
    trap DrawString
    ret

call_0698:
    ld l, a
    and $01
    ld h, a
    add a
    add a
    add h
    add a
    add h
    add $02
    ld h, a
    ld a, l
    and $fe
    rrca
    add $01
    ld l, a
    ret

call_06ac:
    push hl
    callx call_0698
    trap DrawAt
    pop hl
    ld a, [hli]
    add "0"
    trap DrawChar
    ld a, [hli]
    add "0"
    trap DrawChar
    ld a, ":"
    trap DrawChar
    ld a, [hli]
    add "0"
    trap DrawChar
    ld a, [hli]
    add "0"
    trap DrawChar
    ld a, "."
    trap DrawChar
    ret

call_06d4:
    call $0100
    ldh a, [$c0]
    inc a
    ldh [$c0], a
    sub $e1
    ret c
    ldh [$c0], a
    ldh a, [$83]
    inc a
    ldh [$83], a
    ret

SetUpGfx:
    ld a, $20
    trap DrawInit
    ld hl, $c500
    ld a, [hli]
    or [hl]
    jr z, jr_072c

    dec hl
    ld de, $0000
    ld b, $00
    push hl
    trap $ea
    pop hl
    ld de, $c613
    ld bc, $00d9
    push hl
    trap $eb
    ld hl, $ff27
    add hl, bc
    ld a, h
    or l
    pop hl
    jr nz, jr_072c
    ld de, $c6ec
    ld bc, $0800
    trap $eb
    ld a, b
    or c
    jr z, jr_0738
    ld de, $c6ec
    ld bc, $c400
    trap ExtractInit
    ld de, $8800
    ld bc, $0800
    trap ExtractData
    jr jr_0738

jr_072c:
    ld hl, $c613
    ldx de, data_04c4
    ld bc, $00d9
    trap MemCopy

jr_0738:
    ld hl, $0791
    trap $ca
    ld hl, $8000
    ldx de, data_0484
    ld bc, $0040
    trap MemCopy
    ld de, $0005
    ld bc, $1409
    trap DrawBox
    ld a, $07
    trap LCDEnable
    ld hl, $c600
    ldx de, call_06d4
    ld bc, $0013
    trap MemCopy
    di
    ld hl, $c012
    ld bc, $c600
    ld e, [hl]
    ld [hl], c
    inc hl
    ld d, [hl]
    ld [hl], b
    inc bc
    ld l, c
    ld h, b
    ld [hl], e
    inc hl
    ld [hl], d
    xor a
    ldh [$c0], a
    ei
    ret

call_0778:
    trap AwaitFrame
    ldh a, [$c3]
    and $80
    ret z
    ldh a, [$83]
    sub $06
    ret c
    ldh [$83], a
    ldh a, [$cc]
    add h
    cp e
    jr nz, jr_07cd
    ldh a, [$ca]
    add h
    cp e
    jr nz, jr_07c3
    ldh a, [$c9]
    add h
    cp d
    jr nz, jr_07b9
    ldh a, [$c8]
    add h
    cp e
    jr nz, jr_07af
    ldh a, [$c7]
    add h
    cp e
    jr nz, jr_07a5
    ld a, c
jr_07a5:
    ldh [$c7], a
    callx call_05af
    ld a, c
jr_07af:
    ldh [$c8], a
    callx call_05b5
    ld a, b
jr_07b9:
    ldh [$c9], a
    callx call_05bb
    ld a, c
jr_07c3:
    ldh [$ca], a
    callx call_05c1
    ld a, c
jr_07cd:
    ldh [$cc], a
    jx call_059d

call_07d3:
    ldh a, [$c4]
    bit 2, a
    jr z, jr_07dd
    pop af
    or $01
    ret

jr_07dd:
    bit 3, a
    jr z, jr_07e4
    pop af
    xor a
    ret

jr_07e4:
    bit 0, a
    ret z
    ldh a, [$c3]
    bit 7, a
    jr z, jr_07fa
    and $7f
    ldh [$c3], a
    ldh a, [$83]
    ldh [$c1], a
    ldh a, [$c0]
    ldh [$c2], a
    ret

jr_07fa:
    or $80
    ldh [$c3], a
    ldh a, [$c1]
    ldh [$83], a
    ldh a, [$c2]
    ldh [$c0], a
    ret
