; Disassembly of "family-shot.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db kFileMarkerCircle + kFileHasTransfers
    db CartridgeCodePocketFamily  ; where file can run
    db Points - @ - 1             ; length of variable parts of header
    db $00                        ; owner code

Title::
    dk "ファミリショット"

Points::
    dw 1
Author::
    dp "HORI&KUMA ", 2
History::
    ds 11
    ds 11
    ds 11

Main::
    ld sp, $e000
    xor a
    trap DrawInit
    ldx hl, data_00e9
    trap DrawString
    ld hl, $0106
    trap MoveCursor
    callx call_0188
    ld hl, $c6a6
    trap DrawString
    ldx hl, data_0183
    trap DrawString
    ldx de, data_0491
    ld bc, $c400
    trap InitDecompress
    ld de, $dc40
    ld bc, $02c0
    trap RunDecompress

jr_0070:
    trap AwaitFrame
    trap $d8
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
    dh "　　ＳＥＬＥＣＴ．．．．やめる»\n"

data_0183:
    dk "« に»\n"

call_0188:
    add sp, -$04
    ld de, $525f
    ld hl, sp+$00
    ld bc, $0004
    trap $e4
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
    trap IntToString
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
    db $0e, $0a, $0a, $0a, $0a, $0a, $0e, $04, $04, $04, $04, $04, $04, $04, $0e, $02
    db $02, $0e, $08, $08, $0e, $0e, $02, $02, $0e, $02, $02, $0e, $0a, $0a, $0a, $0e
    db $02, $02, $02, $0e, $08, $08, $0e, $02, $02, $0e, $0e, $08, $08, $0e, $0a, $0a
    db $0e, $0e, $0a, $0a, $02, $02, $02, $02, $0e, $0a, $0a, $0e, $0a, $0a, $0e, $0e
    db $0a, $0a, $0e, $02, $02, $0e, $00, $04, $04, $00, $04, $04, $00, $02, $02, $04
    db $04, $04, $08, $08, $00, $00, $00, $00, $00, $00, $00

data_0491:
    db $ff, $f3, $f0, $81, $f5, $21, $00, $c0, $01, $ff, $00, $1c, $af, $22
    db $0b, $78, $b1, $20, $ff, $f9, $3e, $03, $ea, $b9, $cf, $cd, $a6, $ff, $1c, $f3
    db $ef, $56, $07, $00, $ef, $f6, $ff, $35, $00, $cd, $ac, $06, $fb, $ef, $0c, $df
    db $58, $07, $05, $10, $cd, $75, $25, $cd, $5a, $eb, $0f, $cd, $39, $21, $48, $21
    db $00, $80, $15, $ff, $cd, $fa, $0e, $ef, $0d, $5d, $05, $e7, $ff, $00, $40, $00
    db $88, $14, $e7, $ce, $79, $ff, $00, $98, $0c, $cd, $a3, $dd, $cd, $d3, $ff, $0e
    db $21, $dd, $dc, $cd, $1d, $dd, $06, $ff, $cb, $26, $da, $11, $12, $dd, $0e, $23
    db $ff, $cd, $e3, $27, $11, $86, $20, $ef, $6e, $ff, $7e, $04, $2e, $02, $36, $05
    db $06, $40, $ff, $cd, $03, $dd, $05, $20, $fa, $cd, $6b, $79, $40, $44, $29, $21
    db $ee, $46, $36, $62, $13, $ff, $10, $f1, $cd, $a8, $1c, $e1, $e9, $80, $ff, $09
    db $ba, $9a, $25, $5f, $02, $52, $64, $ef, $09, $03, $7c, $8e, $00, $05, $68, $88
    db $00, $df, $04, $80, $96, $ff, $00, $20, $70, $00, $df, $01, $38, $9f, $00, $0c
    db $10, $90, $00, $09, $b7, $30, $a7, $08, $50, $9a, $10, $c5, $cd, $2d, $6f, $1e
    db $a8, $26, $05, $00, $27, $cd, $ab, $10, $ff, $c1, $c9, $2e, $2a, $36, $01, $ff
    db $2e, $ff, $04, $36, $00, $18, $f9, $0e, $00, $2a, $ff, $fe, $ff, $c8, $c5, $d5
    db $11, $3f, $c1, $ff, $ef, $c3, $7c, $04, $47, $2a, $5f, $2a, $ff, $57, $2a, $04
    db $28, $31, $05, $e5, $f5, $7a, $d2, $79, $c6, $cd, $67, $4e, $62, $d1, $59, $df
    db $c1, $f1, $5d, $00, $77, $11, $d7, $dc, $2e, $ff, $00, $06, $06, $1a, $be, $28
    db $06, $13, $6f, $66, $f8, $18, $5c, $21, $00, $e1, $d1, $c1, $ef, $0c, $18, $b4
    db $2b, $21, $00, $80, $01, $f7, $00, $c9, $3e, $28, $e6, $10, $0a, $a7, $28, $ff
    db $18, $d6, $10, $57, $03, $0a, $d6, $08, $bd, $5f, $2f, $6f, $26, $00, $29, $39
    db $10, $7c, $fc, $c6, $80, $67, $cd, $da, $dd, $15, $e9, $00, $ff, $04, $4f, $f1
    db $3d, $20, $d7, $cd, $d3, $bd, $0e, $22, $c0, $ea, $eb, $d4, $1d, $00, $bf, $df
    db $af, $22, $7a, $fc, $26, $bf, $11, $00, $ff, $98, $0e, $20, $06, $20, $1a, $6f
    db $7e, $fb, $c6, $01, $de, $00, $77, $0a, $11, $f4, $0d, $dd, $20, $ef, $57, $06
    db $00, $7e, $c8, $00, $fe, $fd, $01, $20, $01, $70, $23, $04, $72, $c9, $7c, $d2
    db $01, $0e, $10, $06, $08, $d5, $89, $7b, $00, $fa, $07, $22, $79, $8f, $4f, $94
    db $32, $97, $10, $eb, $c4, $04, $de, $15, $1c, $0b, $00, $e7, $d1, $e1, $23, $23
    db $14, $74, $43, $11, $88, $e5, $05, $cd, $fe, $ac, $de, $cd, $51, $de, $ee, $80
    db $36, $7f, $20, $00, $88, $09, $7a, $e6, $07, $87, $85, $df, $6f, $7b, $cb, $01
    db $49, $de, $81, $4f, $ff, $78, $ce, $00, $47, $0a, $4f, $2f, $47, $ff, $f1, $57
    db $0f, $9f, $a0, $5f, $7a, $0f, $7b, $e2, $10, $57, $79, $a6, $b2, $96, $a6, $b3
    db $bf, $77, $14, $10, $c9, $7f, $bf, $df, $ef, $f7, $fd, $fb, $fd, $fe, $4e, $06
    db $bf, $28, $79, $a3, $c0, $b3, $10, $fa, $55, $bd, $70, $61, $88, $19, $ef, $5d
    db $54, $79, $bd, $b1, $01, $10, $00, $cd, $cf, $b2, $0e, $f4, $0a, $11, $77, $4f
    db $02, $3c, $73, $54, $79, $c9, $7e, $33, $22, $39, $3d, $c9, $4a, $00, $31, $c0
    db $0a, $38, $30, $71, $48, $c5, $ca, $03, $bb, $f8, $0f, $7b, $cb, $3f, $65, $20
    db $4f, $06, $b8, $00, $29, $00, $98, $09, $b1, $00

End:
