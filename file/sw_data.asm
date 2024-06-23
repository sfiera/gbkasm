; Disassembly of "num0-data.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db kFileMarkerTriangle
    db CartridgeCodeUniversal  ; where file can run
    db Body - @ - 1            ; length of variable parts of header
    db $6a                     ; owner code

Title::
    dk "NUM0_DATA"

Body::
    db $89, $89, $89, $80, $81, $82, $8c, $8d, $8e, $8f, $89, $92, $8f, $89, $92, $a2
    db $a3, $a4, $aa, $ab, $ac, $89, $89, $89, $83, $84, $85, $89, $8f, $85, $89, $8f
    db $85, $89, $8f, $85, $89, $8f, $85, $89, $ad, $ae, $89, $89, $89, $86, $87, $88
    db $90, $91, $92, $89, $95, $96, $9c, $9d, $9e, $a5, $a6, $a7, $af, $b0, $b1, $89
    db $89, $89, $86, $87, $88, $90, $91, $92, $97, $98, $99, $9f, $a0, $a1, $a8, $a9
    db $92, $b2, $b3, $b4, $89, $89, $89, $89, $8a, $8b, $93, $94, $8b, $9a, $9b, $8b
    db $84, $94, $92, $89, $83, $8b, $89, $b5, $b6, $89, $89, $89, $84, $b7, $92, $84
    db $a7, $89, $af, $c3, $c4, $89, $cd, $92, $a8, $a9, $92, $b2, $b3, $b4, $89, $89
    db $89, $b8, $b9, $ba, $84, $bd, $be, $84, $c5, $c6, $84, $ce, $a1, $84, $d5, $a4
    db $d9, $da, $db, $89, $89, $89, $bb, $b7, $92, $89, $bf, $c0, $89, $c7, $c8, $89
    db $cf, $d0, $89, $d6, $d7, $89, $dc, $dd, $89, $89, $89, $bc, $b7, $88, $8f, $c1
    db $92, $c9, $ca, $99, $d1, $d2, $a1, $8f, $d8, $92, $de, $b0, $b4, $89, $89, $89
    db $86, $87, $88, $c2, $91, $92, $cb, $cc, $92, $d3, $d4, $92, $a8, $a9, $92, $b2
    db $b3, $b4, $89, $89, $e0, $df, $e0, $df, $89, $7f, $ee, $01, $01, $01, $07, $07
    db $0f, $0f, $1f, $5c, $f7, $3f, $fb, $1b, $42, $42, $c3, $01, $ee, $01, $fe, $80
    db $80, $e0, $e0, $f0, $f0, $f8, $17, $88, $fc, $1b, $10, $f3, $1f, $cd, $ff, $2f
    db $11, $0c, $3f, $3d, $ef, $82, $fb, $7f, $7f, $43, $43, $01, $e2, $c0, $92, $c0
    db $15, $1b, $21, $fe, $7b, $e1, $e1, $03, $8f, $60, $1f, $82, $87, $87, $17, $9f
    db $a2, $5b, $b1, $a0, $01, $c0, $81, $81, $e5, $a4, $79, $d1, $8c, $b1, $b1, $28
    db $2f, $30, $cb, $20, $62, $83, $83, $c1, $00, $51, $05, $6c, $d1, $00, $7d, $20
    db $51, $8f, $40, $55, $55, $20, $9d, $2f, $c2, $05, $00, $8f, $62, $2b, $d1, $62
    db $77, $9f, $26, $c7, $05, $64, $8f, $10, $2d, $06, $f2, $51, $a1, $f0, $8b, $af
    db $02, $af, $f1, $84, $00, $2f, $47, $24, $a5, $61, $66, $25, $91, $82, $55, $89
    db $2c, $fc, $e0, $e0, $c0, $c0, $80, $80, $5f, $5f, $60, $00, $b1, $77, $40, $2d
    db $48, $02, $6f, $21, $00, $5b, $57, $27, $43, $16, $fe, $c1, $08, $0f, $8f, $28
    db $e5, $81, $81, $80, $c3, $2b, $18, $05, $55, $40, $f5, $8f, $44, $0f, $77, $06
    db $00, $cf, $d5, $40, $2b, $e5, $82, $b1, $33, $06, $ed, $97, $22, $0c, $0f, $df
    db $40, $df, $29, $02, $83, $83, $2b, $42, $00, $01, $f5, $f5, $00, $bb, $a8, $04
    db $e3, $2b, $26, $9f, $42, $80, $42, $db, $02, $cb, $cd, $44, $d5, $0f, $a0, $4b
    db $ea, $02, $00, $55, $cf, $8a, $6f, $73, $2c, $9d, $5d, $2a, $2f, $6d, $22, $18
    db $41, $93, $f5, $ef, $43, $43, $6b, $20, $af, $af, $20, $00, $4f, $53, $02, $68
    db $17, $0a, $3f, $68, $02, $b1, $4f, $8e, $00, $ed, $ef, $00, $19, $17, $00, $91
    db $0f, $02, $bf, $e5, $2b, $e0, $84, $84, $87, $81, $1b, $20, $39, $b7, $00, $b5
    db $06, $b1, $20, $af, $0f, $2a, $9f, $1b, $00, $03, $03, $15, $18, $73, $24, $75
    db $81, $00, $83, $83, $b1, $19, $02, $c5, $00, $1b, $20, $33, $03, $a0, $1b, $c5
    db $40, $b1, $e5, $64, $05, $10, $31, $24, $f5, $5f, $0b, $81, $01, $79, $4f, $14
    db $1c, $50, $60, $73, $80, $80, $95, $82, $cf, $8f, $20, $8f, $d3, $06, $04, $1c
    db $3f, $40, $8f, $2f, $60, $b1, $07, $61, $70, $b3, $00, $b3, $00, $fd, $99, $24
    db $71, $97, $00, $97, $bb, $20, $bb, $06, $ab, $20, $b5, $6b, $20, $ff, $ff, $0f
    db $e7, $e7, $1c, $80, $ff, $81, $62, $01, $ff, $08, $96, $61, $02, $e5, $df, $42
    db $30, $df, $96, $64, $87, $87, $c1, $6b, $20, $6d, $89, $06, $00, $e5, $7b, $20
    db $5b, $59, $06, $f5, $89, $02, $85, $7f, $42, $00, $7f, $96, $60, $93, $8f, $20
    db $b1, $89, $20, $5f, $4f, $60, $06, $53, $96, $68, $c5, $c8, $40, $5f, $83, $83
    db $d7, $00, $05, $d7, $ff, $44, $51, $7f, $20, $f5, $c0, $61, $71, $80, $00, $6b
    db $af, $26, $6f, $8f, $26, $a5, $1f, $00, $bf, $cd, $00, $1a, $2a, $4b, $26, $8f
    db $84, $84, $2a, $01, $f8, $9f, $00, $f3, $20, $61, $28, $4c, $07, $2a, $02, $6b
    db $6b, $26, $26, $0c, $83, $22, $85, $21, $64, $2f, $7e, $7e, $25, $84, $28, $00
    db $e5, $04, $2f

End: