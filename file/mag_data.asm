; Disassembly of "magnets-data.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db kFileMarkerTriangle + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db Points - @ - 1          ; length of variable parts of header
    db $66                     ; owner code

Title::
    dk "MAGNETS DATA"

Points::
    dw $0001
Author::
    dp "<TEAM MAG>", $02
History::
    ds 11
    ds 11
    ds 11

Body::
    db $00, $00, $3e, $3e, $79, $79, $3c, $3c, $1e, $1e, $4f, $4f, $3e, $3e, $00, $00
    db $00, $00, $3e, $3e, $7b, $7b, $70, $70, $70, $70, $7b, $7b, $3e, $3e, $00, $00
    db $00, $00, $18, $18, $1c, $1c, $1e, $1e, $1e, $1e, $1c, $1c, $18, $18, $00, $00
    db $00, $00, $77, $77, $55, $55, $55, $77, $49, $7f, $41, $7f, $3e, $3e, $00, $00
    db $00, $00, $00, $00, $36, $36, $1c, $1c, $1c, $1c, $36, $36, $00, $00, $00, $00
    db $00, $00, $38, $38, $54, $54, $92, $92, $9a, $9a, $82, $82, $44, $44, $38, $38
    db $00, $00, $3e, $3e, $7f, $7f, $63, $63, $63, $63, $7f, $7f, $3e, $3e, $00, $00
    db $00, $00, $1c, $1c, $3c, $3c, $7c, $7c, $1c, $1c, $1c, $1c, $7f, $7f, $00, $00
    db $00, $00, $3e, $3e, $67, $67, $4f, $4f, $1e, $1e, $3c, $3c, $7f, $7f, $00, $00
    db $00, $00, $3e, $3e, $47, $47, $1e, $1e, $07, $07, $47, $47, $3e, $3e, $00, $00
    db $00, $00, $1e, $1e, $2e, $2e, $4e, $4e, $7f, $7f, $7f, $7f, $0e, $0e, $00, $00
    db $00, $00, $7f, $7f, $70, $70, $7e, $7e, $7f, $7f, $07, $07, $7e, $7e, $00, $00
    db $00, $00, $3e, $3e, $70, $70, $7e, $7e, $7f, $7f, $63, $63, $3e, $3e, $00, $00
    db $00, $00, $7f, $7f, $7f, $7f, $66, $66, $0e, $0e, $1c, $1c, $1c, $1c, $00, $00
    db $00, $00, $3e, $3e, $67, $67, $3e, $3e, $63, $63, $7f, $7f, $3e, $3e, $00, $00
    db $00, $00, $3e, $3e, $63, $63, $7f, $7f, $3f, $3f, $03, $03, $3e, $3e, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $7e, $ee, $84, $03, $03, $07, $05, $0f, $09, $ee, $ff, $7e, $7e, $fd, $83, $e4
    db $3f, $a4, $7f, $df, $00, $ff, $ee, $8f, $c0, $c0, $a0, $e0, $90, $87, $f0, $ef
    db $00, $ff, $11, $28, $58, $0f, $08, $17, $ef, $1c, $13, $1f, $35, $c3, $ff, $fc
    db $3f, $de, $f1, $8f, $15, $80, $10, $f0, $38, $f8, $7c, $7e, $ee, $21, $01, $01
    db $03, $02, $07, $04, $2b, $e7, $0d, $1c, $17, $ee, $20, $7c, $fc, $04, $02, $f3
    db $fe, $03, $ff, $02, $9a, $1a, $ed, $80, $80, $c7, $40, $c0, $ee, $42, $83, $85
    db $12, $06, $0e, $0b, $7f, $ee, $fc, $fc, $fe, $02, $81, $7f, $81, $ad, $ff, $c9
    db $0b, $01, $3e, $20, $e0, $79, $11, $38, $cf, $7c, $44, $e1, $e1, $10, $42, $7e
    db $41, $7f, $df, $40, $7f, $59, $1f, $1c, $3f, $3f, $5f, $ff, $7f, $bf, $df, $ff
    db $9c, $ff, $9d, $e7, $af, $bf, $69, $42, $ff, $05, $7f, $ff, $6f, $ff, $bf, $6e
    db $79, $01, $3c, $fc, $fa, $fe, $fe, $fa, $f5, $fd, $fb, $ff, $f9, $19, $7d, $59
    db $23, $17, $9c, $1f, $23, $8d, $0f, $1d, $27, $3f, $ff, $7a, $36, $77, $42, $fc
    db $7c, $13, $26, $78, $2f, $3e, $2f, $ef, $3d, $2f, $3c, $05, $ff, $e3, $ff, $ef
    db $1f, $0d, $08, $45, $c3, $00, $fc, $dc, $fc, $3c, $1f, $e7, $13, $3f, $38, $f3
    db $83, $10, $2f, $7f, $6c, $f8, $7f, $67, $7f, $6f, $fc, $ce, $05, $32, $05, $ff
    db $f3, $ff, $e7, $b9, $40, $c0, $a0, $e0, $3f, $db, $00, $41, $44, $fc, $84, $fc
    db $9e, $e2, $fe, $3e, $c2, $1f, $11, $1f, $18, $1f, $b3, $20, $5a, $23, $16, $7f
    db $10, $37, $fe, $30, $03, $92, $50, $3f, $64, $05, $03, $df, $18, $f8, $28, $f8
    db $e8, $f7, $f8, $88, $f8, $c8, $d4, $8c, $fc, $42, $ee, $7f, $22, $3f, $b2, $00
    db $07, $07, $00, $e7, $5f, $b3, $00, $3f, $e9, $fb, $a6, $bd, $c3, $9e, $ff, $e3
    db $cf, $f4, $e1, $fe, $fc, $7f, $7f, $5f, $b3, $02, $07, $69, $3c, $ef, $bb, $7c
    db $d7, $f3, $38, $7e, $91, $3c, $2f, $00, $9c, $fd, $dd, $ff, $e3, $b9, $c7, $77
    db $cf, $8f, $7f, $3f, $d7, $fe, $fe, $74, $04, $e0, $59, $3f, $7f, $df, $78, $6b
    db $14, $f3, $7f, $7c, $1f, $69, $92, $70, $c0, $7f, $7a, $30, $fc, $fe, $fb, $ff
    db $f7, $ff, $cf, $fb, $fe, $3e, $f8, $27, $3f, $b8, $0f, $0f, $c8, $03, $07, $7e
    db $00, $18, $3f, $52, $00, $fe, $92, $74, $1f, $91, $40, $00, $1c, $f0, $f0, $c0
    db $e0, $3c, $9f, $f8, $f8, $00, $70, $f0, $e0, $7f, $6c, $92, $ff, $ff, $80, $ff
    db $8d, $f2, $9f, $e0, $bf, $ef, $c0, $ff, $60, $fb, $01, $2c, $f3, $1d, $f2, $75
    db $68, $01, $cf, $71, $f3, $01, $be, $0c, $7e, $ff, $82, $ef, $11, $df, $e1, $1f
    db $e1, $7f, $bf, $81, $a7, $00, $ff, $0e, $fc, $f0, $3f, $36, $26, $5a, $5a, $05
    db $bf, $26, $57, $08, $ff, $3f, $35, $7b, $65, $20, $e4, $fc, $c4, $fc, $cf, $c5
    db $fe, $9e, $eb, $48, $30, $77, $1c, $1c, $3e, $22, $e1, $17, $ff, $3e, $26, $3a
    db $42, $7e, $86, $fa, $06, $d7, $fa, $00, $ef, $03, $55, $04, $05, $0f, $09, $7f
    db $ef, $7e, $7e, $fd, $83, $c0, $3f, $80, $9f, $7f, $69, $08, $ef, $c0, $c0, $a0
    db $e0, $90, $87, $f0, $ef, $ff, $00, $11, $f5, $28, $0f, $08, $17, $e7, $1c, $13
    db $1f, $35, $80, $9c, $fc, $3f, $f1, $bc, $8f, $15, $80, $10, $f0, $38, $f8, $7c
    db $1f, $80, $7b, $1f, $01, $01, $02, $03, $1f, $21, $1f, $1f, $fe, $3f, $20, $40
    db $7f, $c0, $ff, $40, $9a, $7f, $1f, $2a, $80, $80, $c0, $40, $e0, $20, $e0, $fb
    db $a0, $f0, $b0, $38, $e8, $1f, $04, $07, $df, $08, $0f, $1f, $20, $3f, $3f, $7f
    db $40, $81, $e8, $fe, $81, $ff, $c9, $80, $3e, $52, $a3, $a5, $11, $ff, $60, $70
    db $d0, $46, $fa, $44, $fc, $18, $e4, $f8, $e0, $e0, $1f, $7c, $00, $fc, $e9, $59
    db $24, $ff, $33, $3f, $53, $7f, $93, $ff, $dd, $bf, $f7, $ea, $9d, $f7, $99, $69
    db $ff, $ff, $cf, $fe, $ff, $b7, $cf, $ba, $c7, $7a, $c7, $79, $00, $f7, $3c, $fc
    db $fa, $fe, $13, $f5, $fb, $2f, $fa, $f1, $df, $31, $ef, $19, $59, $45, $10, $24
    db $d4, $30, $3f, $69, $40, $7f, $05, $ff, $35, $44, $79, $6b, $42, $66, $fc, $fc
    db $25, $20, $95, $01, $3f, $21, $07, $58, $35, $84, $68, $45, $84, $77, $02, $03
    db $05, $bb, $07, $bb, $01, $1c, $1f, $22, $5a, $79, $47, $e4, $7c, $43, $3f, $ce
    db $04, $68, $fe, $97, $00, $07, $fd, $e7, $9f, $f8, $c8, $fc, $1c, $77, $30, $3c
    db $ff, $fe, $ae, $fe, $a6, $fe, $6e, $18, $1f, $fc, $14, $1f, $17, $1f, $11, $1f
    db $23, $b5, $21, $b6, $31, $5e, $3f, $c0, $6a, $41, $ff, $fa, $97, $f2, $fd, $f8
    db $88, $f8, $e3, $04, $42, $d8, $d9, $01, $fc, $fc, $cc, $1c, $1c, $3e, $22, $e1
    db $e1, $12, $3f, $5b, $87, $00, $ee, $b3, $9d, $e6, $9e, $e3, $ff, $cf, $f0, $e1
    db $fe, $fc, $7f, $7f, $3f, $ff, $1f, $0f, $fd, $07, $fa, $0d, $fb, $0c, $dd, $f7
    db $08, $90, $7e, $81, $3c, $2f, $00, $ff, $ff, $ef, $99, $75, $cf, $b9, $47, $f7
    db $0f, $6d, $34, $3f, $fe, $f8, $04, $f8, $f0, $59, $a1, $ff, $7f, $d0, $ff, $ee
    db $ff, $f3, $7f, $3c, $8f, $1f, $68, $57, $64, $77, $40, $fd, $fe, $fb, $ff, $fd
    db $f7, $ff, $cf, $fe, $3c, $f8, $e9, $10, $f8, $1f, $0e, $0f, $03, $07, $2d, $00
    db $fb, $fc, $18, $87, $07, $35, $91, $40, $a3, $d3, $00, $f0, $f0, $c0, $8f, $e0
    db $4d, $f8, $01, $1c, $e0, $7e, $41, $f7, $fe, $88, $fb, $87, $f8, $87, $fe, $81
    db $87, $01, $ff, $ff, $70, $3f, $0f, $34, $cf, $b8, $4f, $7e, $68, $80, $f3, $8e
    db $79, $c7, $7d, $0c, $10, $ff, $fe, $ee, $49, $ff, $01, $ff, $b1, $4f, $ff, $f9
    db $07, $fd, $03, $ff, $06, $fe, $f8, $f7, $27, $3f, $23, $3f, $af, $a3, $7f, $d7
    db $24, $0e, $01, $2a, $7c, $2e, $00, $47, $f8, $2f, $81, $3d, $95, $dc, $cf, $19
    db $44, $22, $50, $10, $0c, $54, $03, $bb, $00, $e7, $00, $0f, $0f, $1f, $e9, $01
    db $01, $ff, $03, $02, $07, $04, $0f, $0d, $17, $1d, $fd, $14, $1f, $3b, $3f, $3c
    db $3f, $71, $00, $fc, $ea, $04, $02, $fe, $aa, $03, $04, $00, $fe, $3e, $cf, $3f
    db $c1, $e7, $11, $e7, $80, $80, $c0, $40, $fe, $e0, $20, $e0, $60, $a0, $e0, $7f
    db $59, $10, $70, $5a, $ff, $5f, $e7, $c1, $21, $1f, $c3, $84, $69, $ff, $98, $f8
    db $10, $f0, $70, $f0, $ce, $fc, $c7, $3e, $fe, $48, $11, $7b, $e3, $01, $08, $0f
    db $09, $68, $50, $19, $1f, $e1, $01, $13, $58, $2a, $11, $9d, $05, $63, $12, $c9
    db $64, $13, $6e, $47, $01, $b6, $75, $72, $f5, $fe, $f6, $fe, $36, $e7, $00, $09
    db $e7, $04, $ff, $10, $02, $47, $0a, $0c, $26, $0a, $1c, $be, $48, $0f, $20, $24
    db $24, $a5, $c3, $a5, $94, $2f, $0f, $40, $e7, $90, $e7, $00, $20, $08, $40, $e2
    db $fe, $50, $30, $64, $50, $38, $12, $00, $8d, $33, $8b, $00, $89, $46, $0b, $85
    db $00, $83, $08, $01, $1e, $99, $60, $94, $95, $00, $a4, $a5, $01, $24, $e7, $02
    db $ad, $00, $ab, $a9, $00, $a7, $a5, $00, $a3, $10, $c1, $11, $f7, $38, $38, $7c
    db $44, $e1, $7c, $4c, $74, $fc, $84, $fc, $0c, $f4, $4c, $f4, $2c, $01, $ef, $fa
    db $5f, $7f, $59, $7f, $4f, $f3, $10, $58, $2c, $0d, $62, $25, $30, $fe, $10, $2a
    db $30, $f0, $41, $01, $90, $39, $10, $3f, $01, $08, $f8, $c8, $18, $be, $40, $01
    db $ff, $01, $03, $02, $07, $04, $07, $06, $05, $ff, $07, $1f, $1f, $3f, $20, $40
    db $7f, $c0, $cf, $ff, $c0, $34, $fe, $02, $3f, $fc, $83, $80, $ff, $80, $c0, $40
    db $e0, $20, $f0, $b0, $e8, $ff, $b8, $28, $f8, $dc, $fc, $3c, $fc, $19, $ff, $1f
    db $08, $0f, $0d, $0f, $73, $3f, $7c, $72, $ef, $3f, $1f, $0f, $02, $60, $0d, $00
    db $05, $31, $ef, $fe, $fe, $fc, $71, $fb, $fe, $e7, $ff, $bf, $1f, $6d, $32, $18
    db $38, $10, $08, $20, $70, $01, $c1, $83, $00, $81, $7f, $00, $ed, $19, $00, $0f
    db $c0, $b7, $c0, $c1, $10, $f0, $f0, $1e, $f0, $18, $1c, $f0, $08, $10, $04, $0e
    db $c1, $20, $a3, $a1, $00, $9f, $ff, $07, $07, $18, $18, $23, $20, $4f, $40, $ff
    db $5f, $50, $9f, $90, $bf, $81, $bf, $80, $ff, $e0, $e0, $78, $18, $f4, $0c, $fa
    db $06, $ff, $fa, $0e, $fd, $0b, $fd, $83, $fd, $03, $1c, $ef, $ff, $00, $11, $50
    db $40, $9f, $80, $1d, $1d, $90, $83, $06, $0d, $49, $2f, $2f, $40, $f5, $11, $52
    db $9f, $a3, $92, $5b, $1f, $8c, $5f, $70, $fc, $81, $7f, $7f, $bf, $ff, $b1, $54
    db $fd, $e3, $fe, $f9, $ff, $d4, $5f, $b1, $bf, $c4, $00, $df, $df, $ff, $df, $ef
    db $cf, $6f, $fe, $ce, $b1, $60, $8f, $f7, $9f, $7f, $ff, $3b, $ef, $df, $f0, $df
    db $f9, $cf, $ff, $b9, $f0, $e3, $c0, $ff, $e0, $b1, $00, $af, $6f, $ff, $60, $1f
    db $1f, $03, $0a, $01, $11, $60, $ff, $60, $e0, $e7, $47, $4f, $00, $07, $f6, $ff
    db $0e, $f8, $f8, $42, $d2, $87, $8f, $06, $d3, $06, $00, $1f, $00, $f0, $09, $ef
    db $20, $43, $4a, $cd, $e1, $f1, $f7, $fd, $04, $07, $0f, $fd, $40, $ef, $d0, $80
    db $88, $07, $04, $07, $e7, $e2, $f2, $00, $0d, $f3, $ff, $04, $15, $ff, $26, $37
    db $ff, $48, $59, $f3, $7e, $6a, $df, $f6, $df, $f7, $df, $f8, $e3, $00, $0f, $ea
    db $ae, $00, $b3, $df, $00, $fe, $7f, $ae, $7d, $7f, $d4, $bd, $ff, $5f, $b8, $ef
    db $10, $ff, $fd, $66, $ff, $e7, $7b, $ef, $fb, $d0, $00, $1f, $ff, $f3, $ff, $07
    db $ff, $83, $7f, $db, $3f, $f3, $cb, $3f, $7f, $7f, $c3, $e1, $40, $fd, $e3, $ff
    db $fe, $f9, $df, $f4, $2f, $0f, $93, $1c, $ff, $55, $1e, $38, $27, $7a, $a7, $19
    db $1f, $ff, $04, $07, $32, $33, $e8, $e0, $92, $70, $ff, $54, $f0, $38, $c8, $be
    db $c8, $30, $f0, $ff, $40, $c0, $9c, $9c, $17, $07, $49, $0e, $ff, $2a, $0f, $1c
    db $13, $7d, $13, $0c, $0f, $ff, $02, $03, $39, $39, $f4, $f0, $c9, $38, $ff, $aa
    db $78, $1c, $e4, $5e, $e5, $98, $f8, $f7, $20, $e0, $4c, $cc, $ef, $97, $18, $53
    db $fe, $1c, $23, $3c, $61, $be, $18, $1f, $68, $02, $7e, $fd, $d2, $30, $94, $70
    db $88, $78, $80, $00, $5f, $09, $c0, $0c, $30, $4b, $0c, $29, $0e, $11, $eb, $1e
    db $70, $1f, $19, $03, $1c, $31, $e9, $18, $ff, $ca, $38, $c4, $3c, $86, $7d, $18
    db $f8, $9f, $60, $2c, $9a, $00, $1f, $18, $20, $3f, $48, $ff, $7f, $98, $e7, $b8
    db $e7, $5d, $5f, $05, $ff, $07, $80, $80, $c0, $58, $e0, $20, $60, $bf, $bc, $2b
    db $c0, $d0, $00, $0c, $00, $00, $7f, $6f, $f1, $88, $c0, $50, $e0, $24, $60, $b8
    db $77, $87, $d4, $00, $08, $8d, $02, $db, $e7, $bd, $dc, $c3, $7e, $b1, $5a, $ff
    db $3c, $e1, $20, $dd, $d5, $db, $bf, $d5, $01, $03, $d8, $07, $e1, $10, $fe, $ff
    db $fe, $df, $f6, $df, $f7, $df, $f8, $cf, $fd, $ff, $e0, $ff, $ee, $df, $d9, $ce
    db $f1, $f7, $fe, $7f, $ae, $7d, $bc, $00, $bd, $ff, $5f, $ff, $b8, $cf, $30, $ff
    db $66, $ff, $e7, $4a, $ff, $7b, $fa, $8b, $dc, $a7, $fe, $ab, $5f, $ff, $51, $1b
    db $14, $1a, $15, $0f, $0f, $a6, $ff, $ba, $af, $b1, $6b, $d5, $fb, $ad, $f7, $f7
    db $15, $b2, $52, $b0, $a2, $e0, $65, $5d, $ff, $f5, $8d, $d6, $ab, $df, $b5, $ef
    db $a8, $f7, $4d, $4a, $0d, $0a, $8f, $09, $52, $de, $5f, $ff, $d1, $3b, $e5, $7f
    db $d5, $fa, $8a, $d8, $ff, $28, $58, $a8, $f0, $f0, $4b, $7b, $fb, $fd, $8a, $df
    db $a4, $fe, $a9, $5e, $f8, $eb, $ef, $55, $fb, $2d, $07, $a6, $d7, $aa, $df, $b4
    db $7f, $17, $d2, $de, $df, $51, $fb, $25, $7f, $cf, $95, $7a, $28, $50, $9d, $0e
    db $0b, $1d, $16, $df, $3a, $2d, $75, $00, $37, $29, $37, $28, $1f, $bf, $1f, $0d
    db $30, $d0, $fa, $1a, $9d, $77, $ff, $dd, $33, $f7, $a9, $f6, $4a, $fc, $fc, $7f
    db $6f, $e0, $c2, $c2, $75, $b7, $fd, $2b, $fe, $fe, $12, $b2, $5e, $bc, $d4, $f8
    db $58, $0d, $3f, $ca, $13, $af, $bf, $df, $df, $ff, $df, $ef, $cf, $6f, $fe, $be
    db $06, $af, $8f, $f7, $9f, $7f, $ff, $3b, $ef, $df, $fb, $ee, $df, $f0, $cf, $fd
    db $ff, $c1, $fe, $c5, $ff, $e2, $b5, $02, $7f, $f7, $7f, $99, $e7, $3c, $af, $7e
    db $ff, $81, $f7, $7f, $fe, $8f, $70, $b5, $01, $03, $03, $0d, $ff, $0f, $19, $17
    db $3c, $23, $3e, $25, $7e, $ff, $65, $bf, $d0, $df, $a8, $80, $80, $60, $7f, $80
    db $78, $88, $fc, $4c, $fa, $4e, $f5, $ff, $1b, $eb, $35, $01, $01, $06, $07, $0c
    db $ff, $0b, $1e, $11, $3f, $32, $5f, $72, $af, $ff, $d8, $d7, $ac, $c0, $c0, $b0
    db $f0, $98, $ff, $e8, $3c, $c4, $7c, $a4, $7e, $a6, $fd, $ef, $0b, $fb, $15, $0f
    db $44, $1a, $15, $2b, $35, $fd, $55, $6a, $ab, $d5, $d5, $aa, $1f, $2c, $ff, $d4
    db $d4, $ac, $aa, $56, $d5, $ab, $ab, $b3, $55, $ef, $46, $34, $2b, $37, $ff, $48
    db $58, $a8, $7d, $47, $04, $07, $0b, $0d, $1f, $16, $04, $20, $ff, $7f, $40, $ff
    db $a1, $fe, $83, $f0, $f0, $ff, $08, $f8, $c4, $3c, $ec, $1c, $f2, $0e, $fd, $ae
    db $d6, $56, $aa, $ae, $56, $6f, $7f, $fb, $71, $ff, $80, $ff, $a0, $97, $09, $7e
    db $41, $77, $7f, $56, $56, $ea, $89, $00, $7b, $ef, $fb, $7f, $b0, $1f, $f3, $ff
    db $07, $ff, $f3, $7f, $f1, $9b, $7f, $eb, $9f, $dd, $02, $e2, $e2, $26, $e1, $fb
    db $ff, $fc, $fb, $de, $f5, $c1, $bf, $df, $fc, $df, $ff, $df, $ef, $6f, $fe, $de
    db $06, $c1, $db, $8f, $f7, $be, $00, $3b, $ef, $1b, $df, $a8, $ff, $af, $da, $ff
    db $b4, $eb, $ef, $ad, $aa, $ff, $1b, $17, $1c, $1c, $f5, $2b, $eb, $3d, $ff, $fd
    db $af, $d7, $77, $b5, $d5, $50, $b0, $ff, $d8, $e8, $38, $38, $af, $d4, $d7, $bc
    db $ff, $bf, $f5, $eb, $ee, $ad, $ab, $0a, $0d, $7f, $fb, $32, $1b, $fb, $15, $f5
    db $5b, $ff, $2d, $f7, $d7, $f7, $b5, $55, $0b, $ae, $d5, $dd, $ff, $aa, $bb, $f5
    db $ed, $eb, $aa, $af, $0d, $be, $0a, $fb, $20, $55, $ab, $bb, $d5, $55, $b1, $d7
    db $5d, $57, $28, $50, $aa, $30, $ab, $aa, $df, $eb, $f7, $ba, $ea, $f8, $50, $75
    db $40, $55, $dd, $fe, $af, $b7, $d7, $55, $f5, $b0, $50, $0b, $20, $df, $7d, $7e
    db $19, $15, $1a, $6a, $75, $37, $ef, $2f, $7a, $7b, $8f, $00, $07, $07, $76, $aa
    db $ff, $aa, $76, $57, $eb, $ab, $d5, $56, $aa, $df, $bc, $5c, $0b, $78, $78, $3f
    db $3f, $0f, $fb, $09, $1f, $1c, $7e, $79, $8f, $00, $72, $73, $d5, $05, $06, $7d
    db $5e, $80, $00, $5e, $9f, $ba, $bf, $56, $14, $00, $bf, $4f, $fd, $fd, $0c, $0c
    db $ff, $fb, $df, $73, $ff, $43, $bf, $83, $ff, $f3, $7b, $a7, $ff, $47, $d5, $de
    db $00, $df, $f6, $6f, $54, $df, $f8, $db, $00, $d0, $ff, $f7, $ef, $ee, $fc, $ff
    db $df, $bc, $7f, $ae, $7d, $e7, $00, $ff, $bd, $ff, $1f, $f8, $cf, $b1, $7f, $c2
    db $f7, $ff, $3c, $7b, $ef, $44, $fb, $1f, $f3, $7e, $bb, $00, $0b, $ff, $e7, $ff
    db $3f, $ff, $44, $ff, $db, $ef, $d9, $e7, $dc, $d3, $fe, $c9, $df, $ff, $e4, $bc
    db $00, $ff, $7f, $7f, $ff, $81, $3b, $bb, $01, $10, $7e, $ff, $00, $bb, $0f, $f0
    db $7f, $01, $11, $d3, $ff, $93, $ff, $23, $ff, $4b, $49, $11, $27, $fc, $00, $bd
    db $7e, $06, $00, $bb, $af, $61, $bb, $00, $3f, $cf, $c8, $27, $00, $1f, $1f, $30
    db $db, $78, $bb, $f3, $cf, $fd, $bf, $37, $08, $2d, $c9, $00, $04, $af, $c9, $05
    db $2d, $cd, $01, $52, $ef, $54, $1a, $4d, $1e, $54, $25, $2d, $24, $10, $bf, $df
    db $7f, $ef, $77, $00, $1f, $00, $df, $00, $ff, $ef, $71, $fe, $01, $fd, $03, $fa
    db $ff, $10, $d3, $3c, $ac, $27, $a3, $21, $a0, $ff, $21, $21, $e1, $c1, $87, $07
    db $01, $01, $ff, $0c, $cd, $3e, $b2, $63, $41, $c0, $80, $ff, $15, $15, $08, $08
    db $e4, $c4, $24, $24, $ff, $20, $af, $70, $54, $db, $8b, $0e, $04, $bf, $41, $27
    db $81, $81, $c1, $c1, $30, $33, $f7, $fc, $cc, $87, $03, $19, $00, $0a, $0a, $7c
    db $ef, $7c, $0e, $0a, $19, $41, $59, $e7, $a6, $df, $bc, $18, $ee, $00, $a0, $a0
    db $2c, $2c, $f2, $ff, $f2, $64, $64, $80, $9e, $e1, $61, $3f, $ab, $1e, $ee, $6c
    db $57, $11, $48, $59, $00, $1f, $ff, $e0, $ef, $60, $2f, $40, $5f, $c0, $5f, $c7
    db $80, $bf, $69, $00, $67, $ef, $14, $fc, $03, $fb, $f5, $02, $fa, $00, $fd, $ef
    db $01, $fa, $04, $fe, $ff, $00, $7f, $00, $fb, $04, $e5, $1c, $dd, $ff, $0c, $ed
    db $00, $f3, $b0, $0f, $b8, $07, $ff, $ce, $01, $37, $c0, $1a, $e0, $0f, $f0, $cf
    db $03, $fc, $7d, $7f, $00, $c1, $3e, $f0, $0f, $ff, $38, $07, $d8, $07, $c8, $07
    db $60, $1f, $ff, $61, $1e, $31, $0e, $9e, $00, $c1, $00, $ff, $66, $81, $6c, $83
    db $cc, $03, $52, $8c, $fc, $a3, $1c, $43, $3c, $81, $7e, $c5, $7f, $36, $e0, $ff
    db $40, $3f, $cf, $af, $00, $a7, $8f, $07, $f1, $70, $7a, $30, $80, $7f, $01, $78
    db $cc, $10, $f1, $ef, $00, $ff, $03, $fa, $07, $f5, $06, $f6, $e2, $c2, $ff, $22
    db $22, $62, $42, $cc, $88, $b6, $34, $ff, $43, $4a, $81, $bd, $00, $7e, $25, $25
    db $df, $21, $21, $27, $3c, $18, $66, $24, $c3, $fe, $5a, $81, $9d, $1f, $7f, $a5
    db $a5, $0f, $00, $ff, $18, $18, $07, $02, $0d, $05, $18, $08, $ff, $be, $1e, $ff
    db $bf, $3c, $3c, $4a, $4a, $df, $b0, $b0, $55, $8e, $04, $df, $8e, $77, $f8, $57
    db $27, $77, $a4, $a4, $1f, $00, $01, $35, $00, $fe, $38, $10, $7a, $39, $fe, $7a
    db $fe, $cc, $ee, $00, $48, $6c, $35, $00, $fe, $ee, $bb, $56, $ff, $ab, $fe, $aa
    db $ba, $ee, $60, $2f, $c0, $f9, $5e, $80, $be, $80, $bf, $65, $00, $35, $7f, $cf
    db $7f, $70, $84, $00, $9b, $fd, $dc, $fd, $48, $ff, $5b, $58, $7b, $30, $30, $ff
    db $ff, $7f, $bf, $f7, $df, $81, $01, $06, $f8, $f8, $fc, $fc, $7f, $e5, $ef, $10
    db $d7, $28, $bb, $58, $6b, $ff, $a8, $cb, $88, $0b, $08, $0b, $6f, $80, $ff, $24
    db $c0, $61, $80, $4f, $80, $58, $87, $dd, $50, $8f, $a9, $10, $8e, $30, $0f, $d9
    db $c0, $df, $3f, $80, $c8, $05, $f9, $07, $c7, $17, $17, $d7, $f3, $f3, $e5, $7f
    db $65, $00, $c0, $df, $40, $ff, $df, $a0, $6f, $d8, $07, $6e, $81, $18, $f3, $e1
    db $0e, $f1, $01, $f6, $f6, $02, $c6, $3a, $ff, $b8, $9f, $60, $a0, $40, $9f, $40
    db $b0, $ef, $4f, $40, $3f, $e7, $20, $1f, $00, $f9, $ff, $00, $fc, $03, $e3, $1e
    db $df, $1c, $de, $ff, $0e, $ef, $0f, $ef, $07, $f7, $01, $c1, $ff, $3f, $3f, $c0
    db $ff, $21, $c0, $00, $0f, $df, $0f, $ff, $4d, $03, $e0, $e1, $df, $ff, $8f, $f5
    db $df, $af, $df, $5f, $0a, $00, $ee, $00, $fe, $3f, $7b, $1f, $40, $1f, $1f, $3f
    db $bf, $7e, $7e, $6f, $71, $8f, $af, $2f, $00, $9b, $9f, $91, $9b, $ff, $3b, $7f
    db $37, $3f, $62, $76, $47, $6e, $3f, $0b, $0b, $01, $82, $82, $83, $bb, $03, $7b
    db $7d, $47, $fb, $87, $f7, $fe, $ee, $4f, $20, $00, $ef, $01, $f0, $f6, $57, $f1
    db $f5, $f2, $f3, $f7, $68, $70, $70, $7f, $62, $00, $40, $40, $a0, $ff, $ef, $e0
    db $af, $10, $b4, $b3, $13, $b7, $eb, $63, $7f, $f7, $25, $00, $55, $00, $f1, $0f
    db $83, $8f, $62, $25, $01, $3f, $1f, $10, $62, $fc, $fe, $ff, $f0, $f8, $e0, $f0
    db $80, $c0, $04, $0d, $ee, $0c, $05, $04, $92, $10, $02, $06, $00, $97, $ff, $06
    db $05, $0f, $49, $85, $68, $86, $28, $ef, $c6, $28, $c7, $a5, $00, $68, $87, $e8
    db $07, $ff, $88, $01, $da, $fb, $ab, $db, $c9, $d9, $fd, $45, $6d, $6c, $7c, $3e
    db $be, $b9, $1f, $ff, $df, $20, $6f, $10, $b7, $b0, $f7, $f8, $9f, $fb, $c5, $00
    db $2d, $78, $7b, $60, $67, $3a, $fb, $b8, $34, $b8, $18, $a0, $d1, $00, $3a, $bc
    db $6f, $d7, $7d, $7c, $db, $00, $20, $1f, $10, $0f, $c6, $0c, $03, $e1, $df, $00
    db $df, $40, $3f, $eb, $00, $6c, $4b, $00, $fc, $1d, $00, $01, $fd, $f5, $1d, $01
    db $7f, $f9, $ff, $80, $9f, $00, $7e, $01, $7d, $ff, $83, $8b, $77, $f7, $d3, $8f
    db $8f, $c1, $ff, $60, $40, $01, $3d, $c3, $db, $e7, $e7, $ff, $bf, $ff, $1f, $bf
    db $5f, $3f, $1e, $be, $f7, $8f, $df, $f8, $fa, $5b, $00, $e0, $ee, $c0, $f9, $df
    db $80, $bf, $00, $7f, $29, $ff, $02, $c5, $ff, $ec, $8c, $dc, $d8, $f8, $78, $78
    db $30, $ff, $b0, $20, $a0, $01, $c1, $63, $c3, $87, $fe, $f7, $4f, $ef, $9f, $5f
    db $7f, $3f, $7b, $7f, $15, $00, $3e, $9e, $f5, $f6, $f6, $f4, $e9, $ff, $ed, $f5
    db $f9, $d8, $d1, $a0, $b0, $50, $ff, $60, $a0, $c0, $0f, $1f, $38, $7c, $e1, $ef
    db $f3, $c7, $ef, $7e, $7b, $f9, $61, $60, $87, $00, $f3, $00, $84, $49, $01, $72
    db $73, $73, $f1, $cf, $71, $f8, $7b, $10, $6d, $00, $80, $c0, $e0, $bf, $f0, $7b
    db $11, $f0, $f0, $e2, $e0, $46, $40, $ff, $18, $35, $6d, $77, $47, $6b, $2f, $7b
    db $f7, $1e, $3c, $19, $1c, $7f, $01, $7e, $1e, $d7, $5e, $9e, $a2, $00, $be, $ba
    db $3e, $2c, $fd, $ff, $44, $ed, $88, $db, $1e, $de, $08, $e9, $c0, $00, $f7, $fd
    db $05, $b5, $b4, $00, $00, $b6, $01, $f4, $7f, $ef, $00, $07, $f6, $0f, $ef, $1f
    db $d9, $7d, $b7, $7c, $cf, $fc, $fd, $d3, $00, $f8, $7b, $70, $fe, $37, $e0, $6f
    db $e0, $ef, $40, $3f, $df, $8f, $80, $2c, $05, $e4, $b5, $60, $e0, $1f, $30, $0f
    db $ff, $98, $07, $cc, $03, $66, $81, $40, $60, $7f, $39, $30, $a0, $20, $b0, $18
    db $d0, $10, $fb, $d8, $0c, $e8, $08, $ec, $47, $00, $3f, $3f, $ff, $1f, $1f, $0f
    db $0f, $07, $07, $03, $03, $6f, $6d, $20, $00, $dd, $00, $f0, $f7, $e6, $f7, $f3
    db $c5, $e3, $83, $c0, $81, $7f, $10, $00, $46, $ff, $c7, $4c, $ce, $99, $dc, $f2
    db $b9, $e5, $ff, $73, $33, $3f, $1e, $1f, $0c, $0e, $dc, $f8, $bd, $73, $ff, $67
    db $f0, $83, $82, $00, $81, $df, $40, $00, $6c, $00, $c0, $80, $01, $80, $83, $ff
    db $00, $07, $00, $0f, $00, $1f, $00, $3f, $9f, $00, $ec, $9b, $20, $81, $01, $c1
    db $01, $e1, $ed, $01, $f0, $00, $c8, $df, $3f, $86, $14, $fc, $3c, $72, $2d, $04
    db $f4, $f8, $fe, $ff, $55, $59, $42, $47, $ec, $01, $19, $00, $17, $92, $10, $83
    db $03, $81, $9e, $03, $2a, $48, $00, $10, $b7, $a0, $ef, $1f, $ff, $c0, $de, $a1
    db $d9, $66, $a7, $0a, $2c, $ff, $b4, $18, $08, $eb, $18, $9b, $68, $7a, $ff, $b9
    db $c9, $4b, $8b, $85, $0d, $0c, $04, $ff, $04, $05, $3b, $b1, $77, $63, $ef, $c7
    db $ff, $de, $8e, $fe, $9e, $fc, $fd, $f8, $fb, $fc, $70, $77, $c0, $df, $80, $bf
    db $8a, $3f, $d6, $7f, $dd, $30, $cf, $13, $e0, $08, $f0, $04, $f8, $f7, $06, $f8
    db $02, $fc, $f3, $3d, $c0, $43, $ff, $80, $04, $f4, $86, $74, $c4, $36, $73, $ff
    db $0a, $3a, $03, $99, $05, $e9, $05, $29, $f0, $c5, $18, $00, $1e, $56, $10, $57
    db $55, $00, $55, $0f, $53, $01, $9a, $5f, $10, $9b, $e0, $00, $f8, $00, $25, $78
    db $00, $dc, $ef, $5e, $23, $2e, $01, $36, $31, $c1, $5f, $26, $fd, $dd, $d0, $fe
    db $01, $fd, $03, $fa, $ff, $07, $f5, $0e, $fa, $0c, $e8, $1c, $da, $ff, $3c, $7f
    db $f8, $de, $ed, $4e, $87, $8b, $ff, $07, $1a, $07, $30, $0f, $71, $0f, $60, $ff
    db $1f, $1f, $e3, $0f, $f6, $0e, $fc, $1a, $fe, $fc, $0b, $fc, $e1, $fe, $11, $fe
    db $dd, $ff, $bf, $c0, $6f, $f0, $57, $38, $2b, $1c, $ff, $15, $0e, $8b, $06, $82
    db $07, $cb, $07, $4e, $3d, $01, $e7, $2c, $dc, $61, $7f, $80, $90, $22, $5d, $3d
    db $07, $c3, $90, $04, $05, $84, $b0, $31, $82, $ff, $06, $86, $02, $82, $02, $83
    db $03, $20, $ef, $af, $00, $df, $dd, $fc, $03, $e3, $1d, $f3, $1e, $e8, $f0, $40
    db $1e, $00, $51, $f1, $0e, $fb, $8f, $74, $78, $a0, $c0, $2e, $40, $30, $37, $ff
    db $d0, $f7, $e0, $2f, $20, $2f, $61, $2e, $f7, $23, $6c, $42, $5c, $eb, $de, $01
    db $b0, $6d, $6c, $16, $c0, $3f, $42, $2c, $c2, $ff, $00, $36, $ff, $c1, $12, $e1
    db $1b, $e0, $1d, $e0, $0c, $ff, $f0, $06, $f8, $c1, $80, $81, $c0, $60, $ff, $40
    db $40, $60, $20, $a0, $b0, $60, $e0, $ff, $30, $18, $30, $c7, $10, $b7, $30, $d7
    db $a2, $10, $93, $7f, $26, $10, $f6, $f6, $07, $f3, $4e, $db, $f4, $0e, $5b, $00
    db $f0, $18, $53, $df, $3f, $df, $fa, $fc, $cd, $01, $03, $00, $07, $00, $0f, $5b
    db $4a, $ff, $7e, $10, $7e, $01, $c6, $f8, $07, $d8, $f0, $0f, $59, $00, $e0, $1f
    db $4f, $94, $73, $95, $7d, $5f, $f0, $ff, $3d, $c3, $1f, $e0, $5a, $07, $df, $f8
    db $03, $c6, $00, $fc, $01, $fe, $ef, $f0, $fe, $fe, $ff, $ef, $1f, $e5, $03, $f9
    db $c5, $4f, $98, $13, $fe, $f7, $51, $00, $df, $e0, $6f, $f0, $fc, $37, $78, $1b
    db $3c, $0f, $1c, $ce, $af, $81, $81, $83, $30, $be, $60, $47, $f6, $20, $f6, $c1
    db $41, $30, $fd, $00, $e1, $00, $e0, $01, $c1, $da, $c6, $fe, $58, $46, $d8, $86
    db $b8, $8d, $b0, $e5, $04, $ff, $9b, $a0, $17, $60, $26, $41, $80, $7e, $ff, $c1
    db $3d, $e0, $1e, $70, $0f, $90, $0f, $ff, $58, $07, $28, $07, $24, $03, $03, $0c
    db $ff, $f1, $f0, $af, $df, $62, $41, $50, $60, $ff, $28, $b0, $14, $d8, $0a, $ec
    db $10, $18, $ff, $8c, $18, $48, $0c, $f4, $fc, $2c, $1c, $47, $c1, $1f, $1e, $12
    db $4b, $49, $00, $17, $10, $0b, $bf, $18, $47, $f8, $10, $d0, $30, $e0, $30, $ff
    db $f0, $20, $a0, $60, $c0, $60, $e0, $40, $c5, $40, $c0, $1f, $20, $c9, $c9, $03
    db $7f, $46, $ff, $dd, $07, $e0, $83, $00, $1f, $c0, $3f, $53, $80, $a7, $7f, $57
    db $2d, $f8, $70, $6b, $f0, $ff, $01, $fe, $0f, $7f, $6d, $a8, $6e, $58, $30, $80
    db $05, $0e, $02, $ff, $07, $87, $03, $81, $03, $83, $01, $81, $d2, $01, $80, $da
    db $00, $82, $60, $58, $ff, $b8, $11, $ff, $bf, $c0, $df, $c0, $6f, $60, $af, $20
    db $93, $df, $ae, $82, $01, $fc, $ca, $a7, $10, $03, $02, $3f, $fe, $a1, $00, $02
    db $02, $06, $05, $06, $04, $ef, $05, $68, $07, $f9, $50, $8f, $d0, $0f, $ff, $90
    db $0f, $1c, $03, $e7, $00, $38, $c0, $ff, $44, $03, $ba, $01, $75, $08, $c6, $38
    db $7f, $81, $60, $04, $f6, $03, $fa, $82, $7b, $41, $ff, $3d, $b0, $0e, $d9, $05
    db $6a, $83, $2c, $ff, $de, $00, $00, $01, $00, $8f, $00, $47, $f3, $80, $87, $c0
    db $03, $ab, $0f, $03, $00, $07, $0b, $6d, $80, $00, $7e, $27, $20, $fd, $19, $c0
    db $c1, $cc, $80, $81, $32, $00, $a9, $81, $83, $d4, $01, $3a, $f3, $ff, $1f, $ff
    db $7f, $8e, $00, $8e, $fe, $f1, $f0, $fe, $e1, $fe, $c1, $4b, $10, $46, $43, $21
    db $3f, $e2, $0f, $ff, $07, $5a, $14, $90, $b8, $23, $c0, $68, $0d, $83, $af, $79
    db $b1, $10, $b7, $3f, $c0, $91, $24, $1f, $b4, $e0, $97, $c0, $00, $9f, $63, $e0
    db $a8, $68, $40, $ff, $7f, $c0, $df, $60, $7f, $60, $3f, $60, $f5, $6f, $30, $f8
    db $00, $bf, $f0, $c2, $14, $fc, $7f, $20, $00, $0c, $05, $04, $0d, $08, $08, $d7
    db $0f, $0f, $0f, $01, $80, $10, $02, $01, $0f, $9f, $f0, $f7, $10, $df, $f7, $20
    db $6f, $c0, $5f, $c7, $80, $bf, $eb, $05, $7d, $25, $00, $fd, $02, $f3, $f7, $0c
    db $ee, $14, $d8, $fd, $20, $b0, $40, $8e, $60, $2f, $01, $d8, $09, $f0, $07, $00
    db $3f, $f5, $f7, $03, $7f, $02, $3e, $22, $10, $1a, $06, $fe, $da, $06, $fc, $28
    db $04, $03, $2f, $08, $00, $31, $6d, $1b, $00, $fe, $c1, $f6, $fc, $03, $43, $44
    db $fd, $ff, $03, $ff, $03, $07, $ff, $0f, $ff, $1f, $ff, $ff, $3f, $ff, $7e, $ff
    db $fc, $ff, $f8, $da, $ff, $e0, $af, $ff, $80, $7e, $75, $38, $6e, $97, $3e, $54
    db $10, $55, $3b, $66, $70, $01, $ff, $81, $f4, $ff, $f1, $ff, $f0, $52, $e0, $8f
    db $20, $e4, $9e, $ef, $8d, $00, $5b, $f8, $1f, $f8, $e0, $c2, $35, $5f, $a1, $e0
    db $ab, $00, $3e, $30, $3d, $31, $1b, $ff, $33, $33, $1b, $1d, $19, $1e, $18, $0f
    db $ff, $18, $1f, $08, $7e, $00, $bc, $80, $d8, $f9, $c0, $b0, $80, $60, $00, $9f
    db $06, $06, $81, $ff, $00, $05, $03, $0a, $06, $14, $0d, $08, $ff, $1b, $30, $17
    db $50, $37, $a0, $6f, $40, $ef, $df, $00, $7f, $67, $00, $df, $20, $af, $ff, $30
    db $b7, $28, $b0, $50, $60, $20, $b0, $ff, $18, $d0, $14, $d8, $0a, $ec, $05, $f6
    db $e0, $02, $fb, $01, $3c, $10, $31, $ff, $02, $05, $0a, $03, $bf, $80, $69, $f9
    db $00, $e6, $06, $dd, $1c, $ed, $eb, $08, $f7, $6b, $12, $fc, $04, $1f, $f4, $f7
    db $0c, $fc, $0c, $f8, $26, $00, $08, $f8, $08, $2f, $01, $2f, $72, $01, $39, $ff
    db $07, $ff, $0f, $5a, $8e, $00, $fe, $79, $7f, $ff, $49, $13, $fc, $62, $94, $03
    db $49, $21, $49, $e0, $80, $31, $1c, $4c, $63, $20, $24, $4f, $83, $27, $38, $6e
    db $e1, $46, $70, $e2, $e2, $53, $d7, $0f, $f1, $8f, $f3, $54, $40, $0f, $f0, $f0
    db $b7, $e0, $9f, $f8, $c0, $a3, $20, $fe, $8e, $fe, $be, $0e, $ab, $0f, $08, $0b
    db $0c, $0f, $b2, $50, $f5, $07, $0c, $0d, $06, $0d, $c0, $c0, $10, $e8, $b7, $08
    db $c5, $f0, $00, $c9, $02, $e0, $00, $a0, $ff, $6f, $50, $37, $28, $19, $16, $0e
    db $05, $ed, $03, $02, $01, $09, $00, $cf, $81, $50, $7f, $f6, $80, $bf, $40, $df
    db $cf, $01, $fd, $ef, $05, $dd, $00, $fe, $81, $e7, $18, $db, $bf, $00, $40, $ff
    db $80, $a0, $c0, $50, $60, $28, $b0, $14, $fc, $d8, $0c, $e8, $0a, $ec, $7f, $e7
    db $10, $11, $af, $3f, $14, $1f, $18, $30, $e8, $18, $f8, $18, $b7, $f0, $20, $10
    db $f0, $26, $5b, $07, $00, $0f, $69, $30, $f8, $07, $3f, $a0, $f0, $31, $88, $60
    db $ff, $f9, $10, $f8, $20, $f0, $60, $cd, $78, $57, $f0, $fd, $ff, $28, $1f, $1c
    db $0f, $06, $4e, $03, $dd, $ff, $05, $ab, $06, $fc, $18, $fc, $6f, $fc, $fa, $ff
    db $0a, $07, $01, $03, $da, $00, $0f, $4d, $33, $90, $52, $40, $87, $f8, $7e, $0c
    db $9f, $07, $06, $51, $af, $20, $03, $b0, $02, $d8, $00, $d8, $b8, $06, $c0, $0f
    db $6f, $53, $10, $f4, $f4, $01, $01, $00, $82, $01, $ff, $85, $03, $0a, $06, $0c
    db $05, $14, $0d, $ff, $28, $1b, $50, $37, $40, $df, $80, $bf, $3f, $10, $c1, $75
    db $18, $db, $1c, $dd, $00, $e3, $3f, $6f, $4d, $03, $ef, $05, $f6, $02, $fb, $01
    db $bd, $fd, $ca, $e0, $1f, $1f, $e8, $4d, $10, $8f, $7f, $3c, $80, $c7, $80, $87
    db $c0, $63, $40, $ef, $c3, $e0, $03, $fb, $03, $10, $f0, $30, $e0, $f6, $30, $f0
    db $20, $e0, $26, $a0, $60, $0f, $06, $47, $2f, $1f, $38, $37, $90, $40, $52, $c0
    db $e0, $f1, $ef, $cf, $c1, $c0, $53, $e1, $c0, $41, $e0, $7e, $5b, $08, $0e, $07
    db $e6, $ff, $a6, $47, $63, $f8, $1c, $f8, $19, $ff, $19, $70, $07, $74, $ce, $02
    db $f5, $e3, $fc, $60, $80, $83, $61, $84, $00, $81, $6a, $8b, $c7, $f8, $8f, $81
    db $87, $9a, $fc, $ca, $38, $70, $a1, $03, $03, $01, $af, $16, $b4, $7f, $00, $06
    db $1d, $04, $00, $9f, $9f, $03, $78, $80, $ff, $c8, $a0, $ff, $63, $7c, $fd, $04
    db $0d, $18, $0b, $08, $fc, $1b, $b0, $10, $5f, $3f, $00, $dd, $04, $f6, $7f, $e2
    db $01, $03, $fc, $fd, $68, $9b, $50, $37, $f2, $05, $f6, $03, $fb, $c2, $e0, $50
    db $07, $7e, $df, $00, $40, $ce, $00, $c0, $50, $60, $28, $b0, $fc, $1a, $dc, $05
    db $e6, $ea, $07, $bc, $37, $00, $4f, $e2, $7f, $38, $10, $37, $07, $00, $81, $00
    db $ff, $e0, $60, $c0, $60, $e0, $40, $c0, $40, $06, $24, $04, $28, $17, $0a, $2f
    db $dc, $0c, $f0, $0f, $3f, $f7, $79, $e7, $66, $e1, $51, $21, $32, $e1, $23, $de
    db $f0, $33, $5a, $e6, $ff, $1e, $e7, $61, $00, $ff, $1f, $e7, $0f, $f5, $0c, $f6
    db $0f, $f2, $eb, $0f, $f1, $19, $60, $f9, $71, $02, $3e, $f9, $ff, $fc, $eb, $cc
    db $db, $3c, $13, $fc, $23, $f7, $e7, $f9, $19, $e1, $81, $1b, $e1, $11, $ef, $e3
    db $33, $c3, $8b, $04, $87, $f8, $83, $fc, $00, $91, $e8, $02, $99, $bf, $08, $9f
    db $e2, $20, $0f, $b0, $c0, $df, $fe, $80, $bf, $fc, $80, $bf, $c0, $ff, $fe, $c0
    db $fe, $c0, $fc, $c0, $f8, $c0, $bd, $00, $7f, $0f, $c2, $01, $85, $03, $0a, $06
    db $14, $ff, $0d, $28, $1b, $50, $3b, $a0, $6f, $40, $86, $df, $c4, $01, $14, $ab
    db $21, $ab, $78, $80, $ce, $00, $b3, $fc, $3e, $00, $08, $a0, $10, $aa, $1f, $e0
    db $dc, $01, $03, $d0, $03, $80, $00, $10, $b0, $f3, $03, $ff, $e0, $00, $40, $80
    db $d0, $e0, $a0, $70, $ff, $5a, $31, $15, $0b, $0b, $07, $eb, $07, $eb, $05, $03
    db $c0, $1f, $e0, $23, $1a, $e0, $f0, $fc, $f4, $f8, $fe, $ff, $3f, $00, $2f, $e4
    db $0a, $df, $f0, $0f, $3f, $e0, $1f, $19, $f0, $11, $ff, $f8, $09, $f8, $0c, $f8
    db $08, $fc, $06, $ff, $fc, $05, $fe, $02, $ff, $17, $f8, $8b, $ff, $7d, $86, $7f
    db $85, $7e, $c4, $3f, $c0, $7f, $68, $10, $e3, $1f, $fa, $c7, $f4, $2f, $d8, $f7
    db $3f, $e8, $1f, $c8, $2f, $ff, $10, $ff, $ff, $e8, $ef, $33, $c3, $26, $c3, $62
    db $87, $ff, $4c, $87, $44, $8f, $d8, $0f, $c8, $1f, $f1, $f0, $1f, $03, $fc, $8f
    db $c5, $e8, $e7, $50, $fd, $07, $00, $08, $10, $d1, $d0, $00, $ff, $03, $07, $2f
    db $ff, $1f, $ff, $ff, $f0, $c0, $e1, $c0, $d0, $fb, $e1, $eb, $f1, $f5, $fa, $2b
    db $00, $e8, $f0, $ff, $d1, $e0, $a3, $70, $40, $e0, $88, $c0, $b5, $03, $03, $00
    db $07, $08, $20, $03, $4d, $1c, $df, $03, $43, $b2, $10, $1f, $00, $80, $7f, $38
    db $2e, $d9, $9f, $10, $1c, $0d, $ff, $3c, $c0, $79, $00, $c7, $01, $fe, $79, $8f
    db $01, $f9, $00, $0e, $f0, $44, $b0, $10, $ff, $f6, $40, $00, $f2, $fa, $b3, $10
    db $d7, $97, $7f, $06, $10, $d7, $83, $05, $21, $ff, $5f, $3f, $f9, $17, $0f, $02
    db $01, $fc, $b0, $04, $20, $f7, $96, $f8, $bd, $31, $23, $1d, $ae, $70, $00, $6b
    db $04, $3a, $31, $bd, $01, $77, $0f, $18, $d9, $01, $9f, $16, $3f, $41, $fb, $15
    db $00, $71, $8f, $b8, $c7, $dc, $ef, $e3, $f6, $f9, $41, $1f, $11, $1e, $e3, $fb
    db $fc, $07, $f8, $0d, $f3, $41, $65, $d0, $3f, $ea, $a3, $7f, $7f, $41, $f0, $be
    db $00, $80, $f9, $64, $41, $60, $fd, $fe, $fd, $d7, $03, $bf, $83, $90, $01, $cc
    db $b0, $c0, $d6, $1c, $30, $fa, $fc, $cb, $f6, $00, $4a, $d7, $0c, $11, $10, $10
    db $40, $d6, $13, $0f, $aa, $b6, $7e, $10, $10, $f8, $00, $f2, $1e, $01, $5d, $01
    db $ce, $0e, $01, $10, $5c, $10, $70, $0f, $38, $4c, $37, $8c, $00, $c3, $ff, $fc
    db $5d, $00, $ff, $e0, $1f, $00, $5b

End: