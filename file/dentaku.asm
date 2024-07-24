; Disassembly of "calculator.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_ICON | FILE_2BPP | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $04           ; owner code
.title
    dk "DEN TAKU"
.icon
    INCBIN "gfx/iconsend/dentaku.2bpp"
.end

History:
.points
    dw 1980
.author
    dp "Y.MOTOSAKO", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    ldx de, Compressed
    ld bc, $c400
    trap ExtractInit
    ld de, $c800
    ld bc, $1000
    trap ExtractData
    jp $c800

Compressed:
    db $ff, $31, $00, $e0, $cd, $6d, $c8, $cd, $6e, $ff, $ca, $11
    db $1d, $01, $01, $0c, $53, $2e, $ff, $1e, $3e, $00, $26, $03, $cf, $bf, $cb, $ff
    db $4c, $20, $0d, $f5, $c5, $d5, $e5, $cd, $ff, $2a, $c8, $e1, $d1, $c1, $f1, $18
    db $eb, $ff, $cf, $01, $6f, $26, $00, $23, $cf, $03, $ff, $1e, $1e, $02, $24, $02
    db $29, $02, $37, $ff, $02, $a3, $02, $aa, $02, $22, $03, $2c, $ff, $03, $36, $03
    db $40, $03, $43, $03, $a1, $ff, $03, $a4, $03, $a7, $03, $b1, $03, $b4, $ff, $03
    db $b7, $03, $ba, $03, $bd, $03, $c7, $ff, $03, $ca, $03, $cd, $03, $d0, $03, $d3
    db $ff, $03, $dd, $03, $e0, $03, $e3, $03, $ed, $fe, $03, $f7, $03, $02, $04, $3e
    db $c4, $fa, $00, $ff, $02, $11, $11, $0d, $21, $91, $17, $cf, $ff, $b3, $21, $05
    db $0f, $11, $16, $78, $01, $ff, $1e, $4f, $cf, $c2, $af, $ea, $15, $c6, $fb, $21
    db $1f, $0a, $11, $26, $f9, $e4, $5f, $2a, $72, $00, $78, $22, $7b, $05, $35, $7e
    db $3a, $7b, $05, $aa, $4d, $7e, $52, $7b, $05, $65, $7e, $6a, $7b, $04, $aa, $7d
    db $7e, $2b, $7a, $05, $32, $7d, $2b, $85, $05, $aa, $32, $88, $2b, $90, $05, $32
    db $93, $2b, $9b, $05, $aa, $32, $9e, $2b, $a6, $05, $32, $a9, $37, $7a, $05, $aa
    db $3e, $7d, $37, $85, $05, $3e, $88, $37, $c7, $05, $aa, $3e, $93, $37, $d2, $05
    db $3e, $9e, $37, $dd, $05, $aa, $3e, $a9, $43, $e8, $05, $4a, $eb, $43, $f3, $05
    db $aa, $4a, $f6, $43, $c7, $05, $4a, $93, $43, $d2, $05, $aa, $4a, $9e, $43, $dd
    db $05, $4a, $a9, $4f, $e8, $05, $aa, $56, $eb, $4f, $f3, $05, $56, $f6, $4f, $c7
    db $05, $aa, $56, $93, $4f, $d2, $05, $56, $9e, $4f, $dd, $05, $aa, $56, $4e, $5b
    db $56, $05, $63, $eb, $5b, $f3, $05, $aa, $63, $f6, $5b, $c7, $05, $63, $ca, $5b
    db $d2, $05, $ab, $63, $d5, $5b, $dd, $05, $63, $4e, $e4, $c9, $ff, $2a, $b7, $c8
    db $e5, $6f, $26, $01, $cf, $ff, $bd, $e1, $cf, $69, $18, $f2, $1f, $15, $ff, $31
    db $36, $01, $31, $30, $01, $01, $43, $df, $01, $41, $dc, $00, $01, $46, $00, $2b
    db $01, $a6, $5e, $da, $7e, $da, $00, $ca, $01, $3c, $da, $00, $f6, $45, $00, $37
    db $01, $f4, $01, $38, $da, $00, $ad, $39, $da, $3e, $da, $00, $44, $00, $dc, $34
    db $2d, $da, $00, $2d, $01, $d6, $01, $01, $2a, $da, $00, $95, $4f, $d7, $00, $da
    db $32, $da, $00, $33, $da, $2f, $79, $da, $01, $42, $00, $5b, $01, $d9, $e4, $00
    db $01, $af, $2d, $da, $3d, $da, $00, $41, $14, $00, $00, $ff, $44, $65, $63, $00
    db $48, $65, $78, $00, $7f, $ff, $ea, $14, $c6, $c3, $a2, $ca, $af, $7a, $40, $60
    db $16, $c6, $ea, $00, $50, $01, $42, $20, $ff, $cf, $87, $c9, $fa, $6b, $ca, $ea
    db $17, $ed, $c6, $fa, $6d, $5f, $19, $c6, $4d, $30, $18, $1b, $50, $41, $04, $51
    db $ea, $0a, $50, $00, $0b, $c6, $ef, $21, $0e, $02, $cc, $21, $68, $cc, $7d, $fe
    db $ea, $1a, $c6, $7c, $ea, $1b, $c6, $cf, $02, $dd, $21, $05, $81, $47, $ca, $fa
    db $41, $00, $b7, $f1, $28, $03, $21, $4b, $59, $90, $00, $7a, $01, $fe, $05, $09
    db $cd, $72, $cc, $fa, $15, $9b, $10, $a1, $0e, $7f, $06, $82, $30, $cf, $46, $00
    db $ae, $21, $6f, $52, $02, $01, $0e, $a9, $c9, $0e, $0f, $c3, $fb, $be, $cb, $58
    db $4f, $52, $3d, $06, $80, $21, $f4, $e1, $ca, $e5, $f5, $87, $fa, $4f, $00, $b0
    db $bb, $52, $a4, $11, $5e, $23, $56, $c1, $2a, $66, $d8, $6f, $fa, $6e, $00, $b7
    db $c4, $61, $87, $00, $7a, $03, $8b, $00, $7d, $46, $04, $74, $4f, $01, $f5, $fe
    db $8a, $d8, $20, $23, $b3, $40, $59, $cb, $8f, $3e, $11, $bf, $cf, $b0, $c3, $c4
    db $47, $a4, $18, $03, $cd, $b5, $b3, $ca, $7f, $31, $f1, $e1, $6d, $8f, $00, $c9
    db $0f, $f7, $b1, $cf, $d8, $0e, $d3, $81, $21, $67, $f5, $cb, $c3, $ea, $ca, $d1
    db $00, $20, $d3, $82, $dd, $21, $73, $52, $20, $41, $4e, $44, $d3, $86, $df, $21
    db $7f, $52, $21, $53, $4c, $41, $00, $0e, $b4, $0e, $cd, $0e, $07, $e3, $12, $3c
    db $0b, $9a, $11, $cf, $20, $33, $ef, $ec, $12, $cb, $23, $cb, $12, $9f, $d5, $8c
    db $8c, $21, $79, $83, $5f, $3e, $00, $eb, $8a, $57, $c1, $99, $78, $9e, $00, $72
    db $2b, $a8, $73, $cd, $ca, $80, $25, $c8, $79, $86, $8a, $bf, $77, $a7, $01, $7b
    db $b1, $77, $aa, $0e, $08, $c3, $af, $8a, $76, $01, $09, $d9, $3e, $85, $21, $fa
    db $6a, $6a, $30, $52, $4c, $71, $0d, $74, $22, $04, $d9, $af, $05, $d9, $22, $06
    db $de, $89, $21, $1a, $cc, $6d, $53, $10, $2a, $20, $58, $0e, $0c, $74, $22, $01
    db $57, $d9, $02, $d9, $22, $03, $de, $8a, $21, $3a, $55, $05, $22, $2f, $0a, $0b
    db $74, $22, $00, $de, $87, $d7, $21, $50, $25, $21, $2b, $0a, $3e, $88, $21, $ae
    db $5c, $25, $22, $2d, $40, $00, $21, $68, $25, $20, $39, $0a, $0b, $01, $c9, $0e
    db $0a, $74, $89, $12, $23, $df, $e5, $c5, $80, $28, $11, $cf, $a4, $e1, $fc, $cf
    db $bd, $3e, $20, $cf, $bb, $72, $20, $6f, $f0, $69, $c9, $cf, $a3, $6f, $12, $7a
