; Disassembly of "roulette.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

MACRO wtrap
    ld a, \1
    call code_c600
ENDM

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_ICON | FILE_2BPP | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $72           ; owner code
.title
    dk "ルーレット"
.icon
    INCBIN "gfx/roulette/icon.2bpp"
.end

History:
.points
    dw 100
.author
    dp "つもり\n\n\n\n\n\n\n", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    ldx de, code_0109
    ld hl, code_c600
    ld bc, data_013d.end - code_0109
    trap MemCopy
    jx jp_07a7


code_0109:
LOAD "WRAM Code", WRAM0[$c600]
code_c600:
    ld [code_c611 + 1], a
code_c603:
    ld hl, $0000
    push hl
    pop af
code_c608:
    ld hl, $0000
    ld de, $0000
    ld bc, $0000
code_c611:
    trap $00

    push hl
    push de
    push hl
    push af
    ld hl, code_c603 + 1
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, code_c608 + 1
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    inc hl
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    inc hl
    ld [hl], c
    inc hl
    ld [hl], b
    pop hl
    ret
ENDL

data_013b:
    dw 100
data_013d:
    db $ff, $3c
.end

data_013f:
    db $3c
    db $5a, $66, $bd, $c3, $fd, $83, $fc, $f9, $87, $b1, $cf, $42, $7e, $ef, $04, $ed
    db $ff, $ff, $99, $db, $e7, $bd, $ff, $52, $6e, $3f, $fd, $2c, $e1, $01, $01, $03
    db $03, $07, $06, $ff, $0f, $08, $1f, $10, $3f, $30, $7f, $7f, $b7, $40, $2c, $10
    db $80, $ff, $31, $81, $ff, $82, $3f, $32, $10, $31, $42, $7f, $41, $7f, $60, $7f
    db $ff, $30, $3f, $10, $1f, $08, $0f, $06, $07, $1e, $21, $00, $1f, $e7, $61, $07
    db $07, $1f, $1c, $29, $a7, $60, $32, $19, $00, $61, $61, $53, $c0, $ff, $20, $12
    db $74, $77, $26, $62, $3f, $6d, $00, $75, $80, $40, $00, $0f, $29, $59, $00, $57
    db $17, $83, $0f, $0e, $3f, $38, $72, $7e, $44, $ff, $cc, $a9, $12, $ae, $ee, $61
    db $30, $ef, $03, $fe, $07, $6d, $08, $ff, $18, $ff, $8e, $10, $c2, $50, $c1, $bf
    db $00, $0c, $ff, $06, $b9, $48, $61, $10, $7f, $6d, $60, $61, $01, $e1, $73, $10
    db $a3, $0d, $a1, $08, $4d, $53, $20, $21, $3c, $3f, $8c, $03, $e0, $e3, $ff, $fc
    db $1f, $d2, $62, $40, $ba, $0f, $f8, $c5, $3f, $e0, $30, $18, $62, $d3, $00, $fc
    db $00, $7f, $05, $13, $00, $11, $d2, $10, $01, $c3, $21, $f0, $76, $40, $41, $e5
    db $30, $3c, $fb, $ef, $ac, $f3, $19, $60, $da, $f0, $21, $d7, $00, $2c, $0f, $67
    db $0a, $17, $19, $40, $bc, $f8, $06, $5c, $b1, $2b, $e4, $21, $e0, $bb, $00, $f8
    db $1f, $01, $16, $5b, $00, $fd, $41, $e0, $0f, $6c, $ff, $04, $ce, $10, $29, $b9
    db $bd, $21, $0e, $e1, $1e, $00, $10, $5b, $38, $02, $80, $18, $19, $94, $00, $23
    db $bb, $00, $83, $18, $31, $11, $fe, $18, $f7, $1c, $fb, $0e, $f9, $0f, $03, $be
    db $e1, $70, $fb, $e3, $ff, $fe, $1f, $e1, $6e, $1e, $36, $00, $b5, $4d, $84, $1f
    db $1f, $e3, $fe, $94, $04, $d1, $40, $92, $15, $08, $d1, $9f, $01, $1c, $dc, $c7
    db $01, $8f, $70, $64, $71, $e1, $8b, $7f, $f0, $8f, $7e, $c9, $f1, $1f, $26, $32
    db $dd, $30, $a0, $15, $11, $ff, $fa, $7c, $ff, $40, $ff, $78, $b8, $11, $44, $cc
    db $07, $9f, $00, $23, $af, $65, $34, $5f, $00, $c0, $3f, $e0, $dc, $1f, $f0, $ef
    db $e4, $ff, $02, $c4, $18, $d1, $16, $ef, $00, $c9, $d7, $41, $06, $84, $61, $fe
    db $71, $02, $ff, $86, $ff, $87, $78, $c0, $7f, $60, $df, $f0, $38, $d7, $06, $fd
    db $27, $9e, $01, $86, $4e, $d1, $2b, $87, $dc, $b3, $f1, $16, $01, $27, $05, $fe
    db $ff, $e0, $07, $ff, $08, $05, $04, $00, $5d, $dc, $50, $71, $e3, $20, $ff, $10
    db $05, $16, $d9, $d6, $20, $06, $fb, $79, $71, $83, $7d, $0c, $fb, $1d, $00, $35
    db $ec, $fb, $df, $c3, $3f, $03, $fe, $cf, $02, $f0, $2f, $c0, $3f, $e4, $dd, $0f
    db $40, $67, $a5, $00, $a5, $81, $00, $00, $81, $1f, $20, $9f, $9d, $00, $9d, $9b
    db $00, $99, $65, $10, $41, $98, $fe, $ff, $14, $d9, $66, $24, $66, $da, $d1, $3f
    db $34, $18, $25, $61, $0c, $f7, $27, $e4, $41, $06, $dd, $8f, $f0, $fa, $00, $4e
    db $6c, $01, $fe, $c0, $bf, $7f, $90, $92, $17, $8f, $1d, $bf, $da, $20, $30, $97
    db $4f, $22, $00, $55, $57, $02, $cc, $35, $20, $37, $1b, $04, $e8, $e7, $37, $bb
    db $40, $f4, $fc, $ff, $03, $82, $30, $f8, $ff, $ae, $07, $9a, $fb, $05, $16, $97
    db $0f, $f2, $83, $6f, $ad, $02, $f1, $fe, $66, $03, $fd, $fe, $49, $40, $d0, $01
    db $03, $ff, $ff, $04, $d8, $51, $20, $6e, $6e, $2e, $50, $be, $80, $76, $01, $7f
    db $82, $01, $00, $dc, $ad, $01, $84, $08, $5b, $09, $09, $82, $d4, $07, $06, $3d
    db $07, $20, $de, $30, $ef, $d0, $c3, $7f, $31, $de, $5c, $23, $ff, $30, $ff, $ce
    db $f7, $86, $f9, $c0, $7f, $f0, $0f, $f4, $fc, $27, $c9, $97, $3c, $c1, $1f, $20
    db $18, $1f, $8f, $00, $8f, $e0, $3f, $b7, $00, $51, $4f, $01, $f0, $00, $00, $f0
    db $f0, $1a, $9d, $42, $1f, $19, $00, $9c, $f9, $09, $5c, $03, $10, $ff, $60, $cd
    db $03, $64, $2d, $c8, $d9, $01, $1c, $6e, $83, $7f, $39, $02, $c1, $ff, $fe, $e3
    db $1e, $06, $fb, $1c, $eb, $60, $a1, $bf, $ce, $07, $e3, $10, $e3, $d9, $00, $d7
    db $0c, $0e, $55, $14, $9d, $d3, $00, $e3, $09, $ff, $1a, $86, $10, $70, $1d, $0a
    db $ff, $0b, $59, $10, $c1, $bf, $02, $2d, $af, $f8, $e3, $10, $fe, $05, $0f, $f0
    db $1f, $e0, $0f, $bc, $01, $9c, $c2, $86, $9d, $8f, $ff, $78, $ff, $9f, $0e, $6c
    db $10, $03, $01, $fe, $0f, $f1, $7f, $c9, $8f, $f8, $3e, $36, $9d, $c0, $88, $10
    db $c4, $f7, $92, $fe, $f5, $00, $cc, $40, $7e, $12, $ce, $c7, $e2, $04, $82, $f8
    db $2d, $2d, $20, $c1, $c4, $20, $f5, $02, $9a, $30, $47, $9d, $81, $56, $14, $e5
    db $f5, $07, $1e, $ff, $e0, $17, $c5, $73, $20, $d7, $19, $58, $10, $18, $ef, $38
    db $f8, $df, $70, $9f, $f0, $3f, $73, $eb, $0e, $43, $4f, $a9, $00, $7f, $34, $3f
    db $20, $80, $7f, $e0, $1f, $87, $f8, $36, $7b, $08, $29, $8b, $61, $c0, $c0, $3c
    db $f0, $fc, $c3, $ff, $20, $bc, $0d, $02, $0d, $b9, $2d, $f8, $71, $ff, $1f, $fe
    db $e1, $46, $47, $20, $32, $3b, $21, $e0, $7d, $7c, $ff, $03, $ac, $30, $0f, $fe
    db $b8, $7f, $d3, $83, $ff, $04, $34, $10, $49, $56, $02, $70, $a9, $03, $fc, $3c
    db $07, $0c, $f9, $01, $82, $49, $35, $23, $20, $49, $3f, $fc, $14, $30, $c0, $51
    db $1f, $8d, $fc, $f1, $2a, $23, $f3, $00, $06, $ff, $8a, $7e, $52, $32, $05, $c1
    db $40, $40, $b5, $12, $e8, $c3, $63, $e0, $fe, $80, $80, $70, $f0, $1c, $fc, $3f
    db $32, $0c, $15, $2a, $9b, $4d, $00, $90, $e0, $3f, $92, $00, $92, $af, $f8, $32
    db $03, $08, $f4, $18, $ff, $10, $ff, $e1, $30, $ff, $60, $d7, $90, $52, $4e, $06
    db $80, $fc, $e7, $1c, $f0, $70, $cf, $06, $71, $e0, $e0, $f8, $f7, $38, $fc, $0c
    db $fe, $a7, $01, $61, $ff, $a0, $43, $31, $20, $0c, $10, $36, $99, $65, $98, $26
    db $ff, $eb, $69, $ff, $29, $4e, $37, $76, $9e, $86, $fe, $c3, $fc, $7c, $29, $00
    db $27, $c7, $80, $c1, $e0, $60, $f6, $f0, $10, $f8, $08, $2b, $20, $fe, $02, $7d
    db $07, $a4, $13, $e5, $e6, $21, $7e, $7b, $10, $0c, $fc, $08, $f9, $f8, $10, $f0
    db $60, $e0, $c1, $1d, $60, $07, $e7, $07, $1f, $18, $a5, $c9, $45, $1c, $1c, $ff
    db $a0, $e3, $d9, $e3, $b1, $04, $6b, $1b, $00, $2b, $1b, $a0, $65, $a5, $18, $1f
    db $a9, $87, $b4, $ff, $bd, $60, $70, $87, $f0, $93, $f5, $02, $9d, $9d, $01, $80
    db $8e, $94, $ff, $9a, $a1, $a8, $af, $b6, $bd, $c4, $cb, $f7, $d2, $d8, $df, $e6
    db $ff, $80, $84, $89, $ff, $8f, $95, $9b, $a2, $a9, $b0, $b7, $be, $ff, $c5, $cc
    db $d3, $d9, $e0, $e7, $ec, $f1, $ff, $80, $81, $85, $8a, $90, $96, $9c, $a3, $ff
    db $aa, $b1, $b8, $bf, $c6, $cd, $d4, $da, $ff, $e1, $e8, $ed, $f2, $f6, $82, $86
    db $8b, $ff, $b7, $b7, $9d, $a4, $ab, $b2, $b9, $c0, $ff, $c7, $ce, $a4, $db, $e2
    db $e2, $ee, $f3, $ff, $f7, $83, $87, $8c, $91, $97, $9e, $a5, $ff, $ac, $b3, $ba
    db $c1, $c8, $cf, $d5, $dc, $ff, $e3, $e9, $ef, $f4, $f8, $80, $88, $8d, $ff, $92
    db $98, $9f, $a6, $ad, $b4, $bb, $c2, $ff, $c9, $d0, $d6, $dd, $e4, $ea, $f0, $f5
    db $7f, $10, $21, $93, $99, $a0, $a7, $ae, $b5, $bc, $fe, $c3, $ca, $d1, $d7, $de
    db $e5, $eb, $ff, $0e, $c2, $02, $8b, $aa, $00, $aa, $3f, $00, $38, $96, $12, $ee
    db $f8, $01, $c0, $9c, $0f, $00, $0e, $a3, $12, $7d, $8a, $00, $49, $02, $01, $00
    db $af, $01, $09, $dd, $00, $08, $b4, $48, $00, $40, $ba, $21, $02, $86, $00, $c0
    db $ad, $02, $a9, $fe, $00, $03, $00, $cd, $ee, $1b, $00, $18, $d2, $12, $d8, $00
    db $c0, $d8, $cd, $06, $00, $de, $23, $a8, $92, $04, $c0, $21, $12, $d6, $00, $10
    db $f0, $90, $8b, $41, $04, $00, $fc, $1d, $e9, $04, $c7, $de, $21, $36, $00, $30
    db $0e, $b0, $dc, $01, $80, $14, $21, $0d, $00, $0c, $1b, $a8, $32, $dc, $24, $09
    db $fc, $24, $00, $20, $2c, $22, $af, $06, $b1, $50, $25, $8b, $fe, $9c, $8a, $16
    db $95, $0a, $63, $60, $43, $06, $6a, $05, $6f, $5b, $6f, $7f, $5c, $50

data_06ae:
    db $00, $06, $08, $04, $0a, $02, $0c, $07, $05, $09, $03, $0b, $01

data_06bb:
    db $4e, $5d, $6e, $7f, $81, $75, $63, $52, $41, $30, $26, $29, $3c

data_06c8:
    db $17, $17, $19, $20, $2b, $31, $35, $36, $34, $30, $27, $1e, $19

data_06d5:
    db $0c, $0d, $0d, $0d, $0d, $0d, $0d, $0d
    db $20, $20, $2b, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $0d
    db $20, $20, $7c, $20, $7c, $20, $31, $7c, $20, $34, $7c, $20, $37, $7c, $31, $30, $7c, $0d
    db $20, $20, $7c, $20, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $0d
    db $20, $20, $7c, $30, $7c, $20, $32, $7c, $20, $35, $7c, $20, $38, $7c, $31, $31, $7c, $0d
    db $20, $20, $7c, $20, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $0d
    db $20, $20, $7c, $20, $7c, $20, $33, $7c, $20, $36, $7c, $20, $39, $7c, $31, $32, $7c, $0d
    db $20, $20, $2b, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $0d
    db $20, $20, $20, $20, $7c, $20, $fc, $fd, $fe, $20, $7c, $20, $f9, $fa, $fb, $20, $7c, $0d
    db $20, $20, $20, $20, $2b, $2d, $2d, $2d, $2d, $2d, $2b, $2d, $2d, $2d, $2d, $2d, $2b, $0d
    db $20, $20, $20, $4d, $4f, $4e, $45, $59, $3a, $0d

data_0789:
    db $20, $20, $20, $42, $45, $54, $20, $20, $3a, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $00

data_079d:
    db $01, $00, $00, $00, $00

data_07a2:
    db $01, $00, $00, $01, $00


jp_07a7:
    callx call_0b04
    ld hl, $0000
    push hl
    ld hl, $c64c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld l, e
    ld h, d
    push hl
    ld hl, $c64a
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0000
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0000
    push hl
    ld hl, $c655
    pop de
    ld [hl], e
    ld hl, $0000
    push hl
    ld hl, $c65a
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0000
    push hl
    ld hl, $c65d
    pop de
    ld [hl], e
    jx jp_0afa


jp_07ef:
    wtrap AwaitFrame
    ld hl, $c65a
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    inc de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap InputButtons
    ld hl, $c605
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0004
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_081d

    jx jp_0821


jr_000_081d::
    jx jp_0afe


jp_0821:
    ld hl, $c655
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0000
    pop de
    ld c, $06
    trap $84
    ld a, l
    or h
    jr nz, jr_000_0838

    jx jp_094e


jr_000_0838:
    ld hl, $c64c
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0014
    push hl
    ld hl, $c655
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0001
    pop de
    trap $85
    pop de
    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    pop de
    ld c, $06
    trap $84
    ld a, l
    or h
    jr nz, jr_000_0864

    jx jp_093f


jr_000_0864::
    ldx hl, data_079d
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, data_06c8
    push hl
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    ldx hl, data_06bb
    push hl
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c60d
    pop de
    ld [hl], e
    ld hl, $0000
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap $60
    ld hl, $002b
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap AudioPlaySound
    ld hl, $0000
    push hl
    ld hl, $c64c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c655
    ld e, [hl]
    ld d, $00
    dec de
    ld [hl], e
    ld hl, $c655
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_08d9

    inc hl

jr_000_08d9::
    ld a, l
    or h
    jr nz, jr_000_08e1

    jx jp_090a


jr_000_08e1::
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c646
    pop de
    ld [hl], e
    callx call_0f30
    ld hl, $0000
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    callx call_0d53
    jx jp_0afa


jp_090a:
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $000b
    pop de
    ld c, $06
    trap $84
    ld a, l
    or h
    jr nz, jr_000_0921

    jx jp_0930


jr_000_0921::
    ld hl, $0000

Call_000_0924::
    push hl
    ld hl, $c64a
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    jx jp_093b


jp_0930:
    ld hl, $c64a
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    inc de
    ld [hl], e
    inc hl
    ld [hl], d

jp_093b:
    jx jp_094a


jp_093f:
    ld hl, $c64c
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    inc de
    ld [hl], e
    inc hl
    ld [hl], d

jp_094a:
    jx jp_0afa


jp_094e:
    ld hl, $c605
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0001
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_0967

    jx jp_0a0a


jr_000_0967::
    ld hl, $c7f2
    push hl
    ld hl, $c645
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    trap $89
    push hl
    ld hl, $c644
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    push hl
    ld hl, $0002
    pop de
    trap $89
    push hl
    ld hl, $0001
    pop de
    add hl, de
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0080
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_09a6

    inc hl

jr_000_09a6::
    ld a, l
    or h
    jr nz, jr_000_09ae

    jx jp_0a06


jr_000_09ae::
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ldx hl, data_013b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    ld c, $07
    trap $84
    ld a, l
    or h
    jr nz, jr_000_09c9

    jx jp_0a06


jr_000_09c9::
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_09d7

    inc hl

jr_000_09d7::
    ld a, l
    or h
    jr nz, jr_000_09df

    jx jp_09e6


jr_000_09df::
    callx call_11e8

jp_09e6:
    ld hl, $c652
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    inc de
    ld [hl], e
    inc hl
    ld [hl], d
    callx call_0d53
    ld hl, $0002
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap AudioPlaySound

jp_0a06:
    jx jp_0afa


jp_0a0a:
    ld hl, $c605
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0002
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_0a23

    jx jp_0a47


jr_000_0a23::
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    jr nz, jr_000_0a31

    jx jp_0a43


jr_000_0a31::
    ld hl, $0000
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    callx call_0d53

jp_0a43:
    jx jp_0afa


jp_0a47:
    ld hl, $c605
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0008
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_0a60

    jx jp_0ae7


jr_000_0a60::
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    jr nz, jr_000_0a6e

    jx jp_0ae3


jr_000_0a6e::
    ld hl, $000a
    push hl
    ld hl, $0000
    pop de
    ld [hl], e
    ldx hl, data_013b
    push hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    ld e, l
    ld d, h
    pop hl
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0000
    push hl
    ld hl, $0000
    pop de
    ld [hl], e
    callx call_0d53
    ld hl, $c65a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap RandInit
    wtrap RandNext
    ld hl, $c609
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    push hl
    ld hl, $c655
    pop de
    ld [hl], e
    ld hl, $c655
    push hl
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $003c
    pop de
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld [hl], e

jp_0ae3:
    jx jp_0afa


jp_0ae7:
    ld hl, $c605
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c649
    pop de
    ld [hl], e
    callx call_12dc

jp_0afa:
    jx jp_07ef


jp_0afe:
    wtrap ExitToMenu
    ret


call_0b04:
    ld hl, $0100
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c400
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c666
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap MemCopy
    ld hl, $c400
    push hl
    ld hl, $0000
    add hl, hl
    pop de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $1fff
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    push hl
    ld hl, $a000
    pop de
    add hl, de
    push hl
    ld hl, $c64a
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0002
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c64c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c64c
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0001
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_0b80

    jx jp_0baa


jr_000_0b80::
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0004
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    push hl
    ld hl, $0005
    pop de
    add hl, de
    push hl
    ld hl, $f59b
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    jx jp_0baf


jp_0baa:
    wtrap ExitToMenu


jp_0baf:
    ld hl, $0020
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap DrawInit
    ld hl, $c400
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, data_013d
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap ExtractInit
    ld hl, $0020
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $8000
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap ExtractData
    ld hl, $07f0
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $8800
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap ExtractData
    ld hl, $008c
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c766
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap ExtractData
    ld hl, $010e
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c7f2
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap ExtractData
    ld hl, $0003
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap LCDEnable
    ld hl, $0001
    push hl
    ld hl, $c645
    pop de
    ld [hl], e
    ld l, e
    ld h, $00
    push hl
    ld hl, $c644
    pop de
    ld [hl], e
    ldx hl, data_06d5
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap DrawString
    ld hl, $0000
    push hl
    ld hl, $c658
    pop de
    ld [hl], e

jp_0c7f:
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0007
    pop de
    ld c, $07
    trap $84
    ld a, l
    or h
    jr nz, jr_000_0c96

    jx jp_0d04


jr_000_0c96::
    ld hl, $9800
    push hl
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0020
    pop de
    trap $89
    pop de
    add hl, de
    push hl
    ld hl, $c65e
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c766
    push hl
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0014
    pop de
    trap $89
    pop de
    add hl, de
    push hl
    ld hl, $c660
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0014
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c660
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c65e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap MemCopy
    ld hl, $c658
    ld e, [hl]
    ld d, $00
    inc de
    ld [hl], e
    jx jp_0c7f


jp_0d04:
    ldx hl, data_079d
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, data_06c8
    push hl
    ld hl, $0000
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    ldx hl, data_06bb
    push hl
    ld hl, $0000
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c60d
    pop de
    ld [hl], e
    ld hl, $0000
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap $60
    callx call_0ec3
    callx call_0d53
    ret


call_0d53:
    ld hl, $0010
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0009
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    wtrap DrawAt
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, data_013b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap StrConvInt
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap DrawString
    ld hl, $c65c
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    jr nz, jr_000_0da7

    jx jp_0dbc


jr_000_0da7::
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    jr nz, jr_000_0db5

    jx jp_0dbc


jr_000_0db5::
    ld hl, $0001
    jx jp_0dbf


jp_0dbc:
    ld hl, $0000
jp_0dbf:
    ld a, l
    or h
    jr nz, jr_000_0dc7

    jx jp_0e3e


jr_000_0dc7::
    ld hl, $0011
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $000d
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    wtrap DrawAt
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c65c
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap StrConvInt
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap DrawString
    ld hl, $0011
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0010
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    wtrap DrawAt
    ld hl, $0058
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap DrawChar
    ld hl, $0001
    push hl
    ld hl, $c65d
    pop de
    ld [hl], e
    jx jp_0e7d


jp_0e3e:
    ld hl, $c65d
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    jr nz, jr_000_0e4c

    jx jp_0e7d


jr_000_0e4c::
    ld hl, $0011
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0000
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    wtrap DrawAt
    ldx hl, data_0789
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap DrawString
    ld hl, $0000
    push hl
    ld hl, $c65d
    pop de
    ld [hl], e

jp_0e7d:
    ld hl, $0011
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0009
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    wtrap DrawAt
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap StrConvInt
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap DrawString
    ret


call_0ec3:
    ldx hl, data_07a2
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c645
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0003
    pop de
    trap $86
    push hl
    ld hl, $0048
    pop de
    add hl, de
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    ld hl, $c644
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0003
    pop de
    trap $86
    push hl
    ld hl, $0018
    pop de
    add hl, de
    push hl
    ld hl, $c60d
    pop de
    ld [hl], e
    ld hl, $0001
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap $60
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    jr nz, jr_000_0f1d

    jx jp_0f2f


jr_000_0f1d::
    ld hl, $0000
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    callx call_0d53

jp_0f2f:
    ret


call_0f30:
    ld hl, $0000
    push hl
    ld hl, $c657
    pop de
    ld [hl], e
    ld hl, $c662
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_0f47

    inc hl

jr_000_0f47::
    ld a, l
    or h
    jr nz, jr_000_0f4f

    jx jp_0f6b


jr_000_0f4f::
    ld hl, $0000
    push hl
    ld hl, $c647
    pop de
    ld [hl], e
    ld hl, $c646
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c646
    pop de
    ld [hl], e
    callx call_11ba

jp_0f6b:
    ld hl, $0001
    push hl
    ld hl, $c658
    pop de
    ld [hl], e

jp_0f74:
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000d
    pop de
    ld c, $07
    trap $84
    ld a, l
    or h
    jr nz, jr_000_0f8b

    jx jp_0fe4


jr_000_0f8b::
    ld hl, $c662
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0001
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_0fa4

    jx jp_0fc3


jr_000_0fa4::
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c647
    pop de
    ld [hl], e
    ld hl, $c646
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c646
    pop de
    ld [hl], e
    callx call_11ba

jp_0fc3:
    ld hl, $c662
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0001
    pop de
    trap $85
    push hl
    ld hl, $c662
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c658
    ld e, [hl]
    ld d, $00
    inc de
    ld [hl], e
    jx jp_0f74


jp_0fe4:
    ld hl, $c657
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    jr nz, jr_000_0ff2

    jx jp_10b1


jr_000_0ff2::
    ld hl, $000a
    push hl
    ld hl, $0000
    pop de
    ld [hl], e
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c65c
    ld l, [hl]
    ld h, $00
    pop de
    trap $89
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0000
    push hl
    ld hl, $c65c
    pop de
    ld [hl], e
    callx call_0d53
    ld hl, $003c
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx call_12bc
    jx jp_1096


jp_1037:
    ldx hl, data_013b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $752f
    pop de
    ld c, $02
    trap $84
    ld a, l
    or h
    jr nz, jr_000_104f

    jx jp_105a


jr_000_104f::
    ld hl, $0001
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d

jp_105a:
    ld hl, $c652
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    dec de
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, data_013b
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    inc de
    ld [hl], e
    inc hl
    ld [hl], d
    callx call_0d53
    ld hl, $0020
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap AudioPlaySound
    ld hl, $0005
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx call_12bc

jp_1096:
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    jr z, jr_000_10a4

    jx jp_1037


jr_000_10a4::
    ld hl, $0000
    push hl
    ld hl, $0000
    pop de
    ld [hl], e
    jx jp_11b9


jp_10b1:
    ldx hl, data_013b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_10c0

    inc hl

jr_000_10c0::
    ld a, l
    or h
    jr nz, jr_000_10c8

    jx jp_11b9


jr_000_10c8::
    ld hl, $0000
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    callx call_0d53
    ld hl, $00f0
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx call_12bc
    ld hl, $c666
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap $ef
    ld hl, $0000
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap DrawInit
    ld hl, $0007
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0003
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    wtrap DrawAt
    ldx hl, data_1450
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap DrawString
    ld hl, $0009
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0001
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    wtrap DrawAt
    ldx hl, data_1438
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap DrawString
    jx jp_117b


jp_115c:
    wtrap AwaitFrame
    ld hl, $ff90
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_116f

    inc hl

jr_000_116f::
    ld a, l
    or h
    jr nz, jr_000_1177

    jx jp_117b


jr_000_1177::
    jx jp_117f


jp_117b:
    jx jp_115c


jp_117f:
    wtrap $db
    ld hl, $00f0
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx call_12bc
    ld hl, $00f0
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx call_12bc
    ld hl, $00f0
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx call_12bc
    wtrap ExitToMenu

jp_11b9:
    ret


call_11ba:
    ldx hl, data_06ae
    push hl
    ld hl, $c646
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c647
    ld l, [hl]
    ld h, $00
    pop de
    ld c, $08
    trap $84
    ld a, l
    or h
    jr nz, jr_000_11de

    jx jp_11e7


jr_000_11de::
    ld hl, $0001
    push hl
    ld hl, $c657
    pop de
    ld [hl], e

jp_11e7:
    ret


call_11e8:
    ld hl, $0000
    push hl
    ld hl, $c656
    pop de
    ld [hl], e
    ld hl, $c7f2
    push hl
    ld hl, $c645
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    trap $89
    push hl
    ld hl, $c644
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    add hl, hl
    pop de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c662
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c662
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c664
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c664
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_1235

    inc hl

jr_000_1235::
    ld a, l
    or h
    jr nz, jr_000_123d

    jx jp_1246


jr_000_123d::
    ld hl, $0001
    push hl
    ld hl, $c656
    pop de
    ld [hl], e

jp_1246:
    ld hl, $0001
    push hl
    ld hl, $c658
    pop de
    ld [hl], e

jp_124f:
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000d
    pop de
    ld c, $07
    trap $84
    ld a, l
    or h
    jr nz, jr_000_1266

    jx jp_12a8


jr_000_1266::
    ld hl, $c664
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0001
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_127f

    jx jp_1287


jr_000_127f::
    ld hl, $c656
    ld e, [hl]
    ld d, $00
    inc de
    ld [hl], e

jp_1287:
    ld hl, $c664
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0001
    pop de
    trap $85
    push hl
    ld hl, $c664
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c658
    ld e, [hl]
    ld d, $00
    inc de
    ld [hl], e
    jx jp_124f


jp_12a8:
    ld hl, $000c
    push hl
    ld hl, $c656
    ld l, [hl]
    ld h, $00
    pop de
    trap $8a
    push hl
    ld hl, $c65c
    pop de
    ld [hl], e
    ret


call_12bc:
    jx jp_12cd


jp_12c0:
    ld hl, $c648
    ld e, [hl]
    ld d, $00
    dec de
    ld [hl], e
    wtrap AwaitFrame

jp_12cd:
    ld hl, $c648
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    jr z, jr_000_12db

    jx jp_12c0


jr_000_12db::
    ret


call_12dc:
    ld hl, $0000
    push hl
    ld hl, $c659
    pop de
    ld [hl], e
    ld l, e
    ld h, $00
    push hl
    ld hl, $c658
    pop de
    ld [hl], e
    ld hl, $c649
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0040
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_1307

    jx jp_1310


jr_000_1307::
    ld hl, $ffff
    push hl
    ld hl, $c659
    pop de
    ld [hl], e

jp_1310:
    ld hl, $c649
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0080
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_1329

    jx jp_1332


jr_000_1329::
    ld hl, $0001
    push hl
    ld hl, $c659
    pop de
    ld [hl], e

jp_1332:
    ld hl, $c649
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0010
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_134b

    jx jp_1354


jr_000_134b::
    ld hl, $0001
    push hl
    ld hl, $c658
    pop de
    ld [hl], e

jp_1354:
    ld hl, $c649
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0020
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_136d

    jx jp_1376


jr_000_136d::
    ld hl, $ffff
    push hl
    ld hl, $c658
    pop de
    ld [hl], e

jp_1376:
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c659
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    ld a, l
    or h
    jr nz, jp_138d

    jx jp_1437


jp_138d::
    ld hl, $c644
    push hl
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    add hl, de
    pop de
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld [hl], e
    ld hl, $c645
    push hl
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c659
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0009
    pop de
    add hl, de
    pop de
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld [hl], e
    ld hl, $c644
    push hl
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    trap $8a
    ld hl, $c3b0
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld e, l
    ld d, h
    pop hl
    ld [hl], e
    ld hl, $c645
    push hl
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0009
    pop de
    trap $8a
    ld hl, $c3b0
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld e, l
    ld d, h
    pop hl
    ld [hl], e
    ld hl, $c7f2
    push hl
    ld hl, $c645
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    trap $89
    push hl
    ld hl, $c644
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    push hl
    ld hl, $0002
    pop de
    trap $89
    push hl
    ld hl, $0001
    pop de
    add hl, de
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0080
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr z, jr_000_1430

    jx jp_138d


jr_000_1430::
    callx call_0ec3

jp_1437:
    ret


data_1438:
    db $0f, $ba, $c9, $0e, $cc, $df, $db, $b8
    db $de, $d7, $d1, $0f, $ca, $bb, $b8, $bc
    db $de, $ae, $bb, $da, $cf, $bc, $c0, $00


data_1450:
    db $0f, $b5, $b6, $c8, $b6, $de, $c5, $b8, $c5, $d8, $cf, $bc, $c0, $c9, $c3, $de, $00
