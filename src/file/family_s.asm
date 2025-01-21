; Disassembly of "family-shot.gbf"

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_HIST
    db CART_POKEFAM  ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $00           ; owner code
.title
    dk "ファミリショット"
.icon
.end

History:
.points
    dw 1
.author
    dp "HORI&KUMA ", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    ld sp, $e000
    xor a
    trap DrawInit
    ldx hl, data_00e9
    trap DrawString
    ld hl, $0106
    trap DrawAt
    callx call_0188
    ld hl, $c6a6
    trap DrawString
    ldx hl, data_0183
    trap DrawString
    ldx de, data_0491
    ld bc, $c400
    trap ExtractInit
    ld de, $dc40
    ld bc, $02c0
    trap ExtractData

jr_0070:
    trap AwaitFrame
    trap InputButtons
    bit 2, a
    jr nz, jr_00e7
    and $03
    jr z, jr_0070
    ld [$dc3f], a
    call $dc40
    di
    ld sp, $e000

jr_0086:
    ldh a, [rLY & $FF] ; =$44
    cp $91
    jr nz, jr_0086
    ldh a, [rLCDC & $FF] ; =$40
    and $7f
    ldh [rLCDC & $FF], a ; =$40
    ld hl, $c6a0
    ld a, $01
    ld [hli], a
    ld a, $01
    ld [hli], a
    ldh a, [rBGP & $FF] ; =$47
    ld [hli], a
    ld a, $80
    ld [hli], a
    ld de, $fe00
    ld hl, $c600
    ld b, $a0

jr_00a9:
    ld a, [de]
    inc e
    ld [hli], a
    dec b
    jr nz, jr_00a9
    ld a, [$dc3f]
    bit 0, a
    jr z, jr_00c4
    callx call_0188
    callx call_03ab

jr_00c4:
    ld hl, $9c00
    ld bc, $0400
    ld a, $ff

jr_00cc:
    ld [hli], a
    dec c
    jr nz, jr_00cc
    dec b
    jr nz, jr_00cc
    ld a, $a0
    ldh [rWX & $FF], a ; =$4b
    xor a
    ldh [rWY & $FF], a ; =$4a
    ldh a, [rLCDC & $FF] ; =$40
    or $e0
    ldh [rLCDC & $FF], a ; =$40
    callx call_01f9

jr_00e7:
    trap ExitToMenu

data_00e9:
    dk "　　ＰＯＫＥＴ　ＦＡＭＩＬＹ ＧＢ\r"
    dk "\r"
    dk "　ＦＡＭＩＬＹ　ＰＨＯＴＯ　ＰＲＩＮＴ\r"
    dk "\r"
    dk "\r"
    dk "\r"
    dk "\r"
    dk "\r"
    dk "« さつえいされた　ファミリーぜんいんの\r"
    dh "\r"
    dh "　しゅうごうしゃしんが　できています。\r"
    dh "\r"
    dh "　　Ａ．．ひづけつきで　いんさつする\r"
    dh "\r"
    dh "　　Ｂ．．ひづけなしで　いんさつする\r"
    dh "\r"
    dh "　　ＳＥＬＥＣＴ．．．．やめる»\0"

data_0183:
    dk "« に»\0"

call_0188:
    add sp, -$04
    ld de, $525f
    ld hl, sp+$00
    ld bc, $0004
    trap CRAMRead
    pop de
    pop hl
    xor a
    ld bc, $ffc0
    trap $96
    ld hl, $ffc0
    ld a, [hli]
    ld d, [hl]
    ld e, a
    ld hl, $c6a4
    trap StrConvInt
    ld hl, $c6aa
    ld a, $2f
    ld [hli], a
    callx call_01e6
    ld a, $2f
    ld [hli], a
    callx call_01ea
    ld a, $20
    ld [hli], a
    callx call_01d9
    ld a, $3a
    ld [hli], a
    callx call_01d5
    xor a
    ld [hl], a
    ret

call_01d5:
    ldh a, [$c7]
    jr jr_01ec
call_01d9:
    ldh a, [$c6]
    ld c, a
    ldh a, [$c5]
    or a
    jr z, jr_01e3
    ld a, $0c
jr_01e3:
    add c
    jr jr_01ec
call_01e6:
    ldh a, [$c2]
    jr jr_01ec
call_01ea:
    ldh a, [$c3]
jr_01ec:
    ld c, $2f
jr_01ee:
    inc c
    sub $0a
    jr nc, jr_01ee
    add $3a
    ld [hl], c
    inc hl
    ld [hli], a
    ret

call_01f9:
    ld b, $09
    ldh a, [rSCY & $FF] ; =$42
    and $f8
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    ldh a, [rSCX & $FF] ; =$43
    rrca
    rrca
    rrca
    and $1f
    ld e, a
    ld d, $98
    add hl, de
    ld de, $c700

jr_0212:
    push hl
    push bc
    push de
    callx call_0356
    callx call_0356
    pop hl
    pop bc
    push bc
    push hl
    ld a, $09
    sub b
    swap a
    add $10
    ld d, a
    ld e, $08
    callx call_0289
    pop de
    ld hl, $0280
    add hl, de
    ld e, l
    ld d, h
    pop bc
    pop hl
    ld a, l
    add $40
    ld l, a
    ld a, h
    adc $00
    ld h, a
    dec b
    jr nz, jr_0212
    ld de, $0100
    ld bc, $0000
    trap $ad
    or a
    ret nz
    ld b, $09
    ld hl, $c700
jr_025b:
    push bc
    push hl
    ld de, $0400
    ld bc, $0280
    trap $ad
    pop hl
    ld bc, $0280
    add hl, bc
    pop bc
    ld a, $09
    sub b
    swap a
    ldh [rWY & $FF], a ; =$4a
    dec b
    jr nz, jr_025b
    ld de, $0400
    ld bc, $0000
    trap $ad
    ld de, $0200
    ld bc, $0004
    ld hl, $c6a0
    trap $ad
    ret

call_0289:
    ld b, $02
jr_028b:
    ld c, $14
    push de
jr_028e:
    callx call_02ad
    ld a, l
    add $10
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, e
    add $08
    ld e, a
    dec c
    jr nz, jr_028e
    pop de
    ld a, d
    add $08
    ld d, a
    dec b
    jr nz, jr_028b
    ret

call_02ad:
    push bc
    push de
    push hl
    ld hl, $c600
    ld b, $28
jr_02b5:
    ld c, $00
    ld a, [hli]
    dec a
    cp d
    jr nc, jr_02f4
    add $08
    cp d
    jr nc, jr_02c7
    add $08
    cp d
    jr c, jr_02f4
    inc c
jr_02c7:
    ld a, [hli]
    cp e
    jr c, jr_02f5
    sub $08
    cp e
    jr nc, jr_02f5
    ld a, [hli]
    add c
    push bc
    push de
    push hl
    ld c, [hl]
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld de, $8000
    add hl, de
    ld d, h
    ld e, l
    ld hl, sp+$06
    ld a, [hli]
    ld h, [hl]
    ld l, a
    callx call_02fe
    pop hl
    pop de
    pop bc
    jr jr_02f6
jr_02f4:
    inc hl
jr_02f5:
    inc hl
jr_02f6:
    inc hl
    dec b
    jr nz, jr_02b5
    pop hl
    pop de
    pop bc
    ret

call_02fe:
    ld b, $08
jr_0300:
    ld a, c
    push bc
    push af
jr_0303:
    ldh a, [rSTAT & $FF] ; =$41
    bit 1, a
    jr nz, jr_0303
    ld a, [de]
    ld c, a
    ldh a, [rSTAT & $FF] ; =$41
    bit 1, a
    jr nz, jr_0303
    inc de
jr_0312:
    ldh a, [rSTAT & $FF] ; =$41
    bit 1, a
    jr nz, jr_0312
    ld a, [de]
    ld b, a
    ldh a, [rSTAT & $FF] ; =$41
    bit 1, a
    jr nz, jr_0312
    inc de
    pop af
    push de
    bit 5, a
    jr z, jr_0336
    ld a, $08
jr_0329:
    rlc c
    rr e
    rlc b
    rr d
    dec a
    jr nz, jr_0329
    ld c, e
    ld b, d
jr_0336:
    ld e, $08
jr_0338:
    rlc b
    rla
    rlc c
    rla
    and $03
    jr nz, jr_0343
    scf
jr_0343:
    rl d
    dec e
    jr nz, jr_0338
    ld a, [hl]
    and d
    or c
    ld [hli], a
    ld a, [hl]
    and d
    or b
    ld [hli], a
    pop de
    pop bc
    dec b
    jr nz, jr_0300
    ret

call_0356:
    push hl
    ld b, $14
jr_0359:
    callx call_039b
    callx call_037b
    dec hl
    ld a, l
    inc a
    and $1f
    ld c, a
    ld a, l
    and $e0
    or c
    ld l, a
    dec b
    jr nz, jr_0359
    pop hl
    ld bc, $0020
    add hl, bc
    ret

call_037b:
    push hl
    push bc
    xor $80
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld bc, $8800
    add hl, bc
    ld b, $10
jr_038c:
    callx call_039b
    ld [de], a
    inc de
    dec b
    jr nz, jr_038c
    pop bc
    pop hl
    ret

call_039b:
    ldh a, [rSTAT & $FF] ; =$41
    bit 1, a
    jr nz, call_039b
    ld c, [hl]
    ldh a, [rSTAT & $FF] ; =$41
    bit 1, a
    jr nz, call_039b
    inc hl
    ld a, c
    ret

call_03ab:
    ld hl, $c400
    ld b, $00
    xor a
jr_03b1:
    ld [hli], a
    dec b
    jr nz, jr_03b1
    ld de, $c6a6
    ld hl, $0010
jr_03bb:
    ld a, [de]
    inc de
    or a
    jr z, call_03e7
    ld c, $0a
    cp $3a
    jr z, jr_03d3
    inc c
    cp $2f
    jr z, jr_03d3
    inc c
    cp $20
    jr z, jr_03d3
    sub $30
    ld c, a
jr_03d3:
    ld a, c
    callx call_040b
    ld a, h
    xor $01
    ld h, a
    jr nz, jr_03bb
    ld a, l
    add $08
    ld l, a
    jr jr_03bb

call_03e7:
    ld de, $c400
    ld bc, $9a29
jr_03ed:
    ld a, [bc]
    inc bc
    or a
    ret z
    xor $80
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    push bc
    ld bc, $8800
    add hl, bc
    ld b, $10
jr_0401:
    ld a, [de]
    cpl
    inc de
    ld [hli], a
    dec b
    jr nz, jr_0401
    pop bc
    jr jr_03ed

call_040b:
    push bc
    push de
    push hl
    ld e, a
    add a
    add a
    add a
    sub e
    ldx de, data_0436
    add e
    ld e, a
    ld a, $00
    adc d
    ld d, a
    ld b, $07
    sla l
    ld c, h
    ld h, $c4
jr_0424:
    ld a, [de]
    bit 0, c
    jr nz, jr_042b
    swap a
jr_042b:
    or [hl]
    ld [hli], a
    inc hl
    inc de
    dec b
    jr nz, jr_0424
    pop hl
    pop de
    pop bc
    ret

data_0436:
    db $0e, $0a, $0a, $0a, $0a, $0a, $0e
    db $04, $04, $04, $04, $04, $04, $04
    db $0e, $02, $02, $0e, $08, $08, $0e
    db $0e, $02, $02, $0e, $02, $02, $0e
    db $0a, $0a, $0a, $0e, $02, $02, $02
    db $0e, $08, $08, $0e, $02, $02, $0e
    db $0e, $08, $08, $0e, $0a, $0a, $0e
    db $0e, $0a, $0a, $02, $02, $02, $02
    db $0e, $0a, $0a, $0e, $0a, $0a, $0e
    db $0e, $0a, $0a, $0e, $02, $02, $0e
    db $00, $04, $04, $00, $04, $04, $00
    db $02, $02, $04, $04, $04, $08, $08
    db $00, $00, $00, $00, $00, $00, $00

data_0491:
    INCBIN "family_s/code.hz"
