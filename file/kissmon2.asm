; Disassembly of "kissmon2.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header:
    dw SIZEOF(SECTION(Header))
    db kFileHasIcon2bpp + kFileMarkerDiamond + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db .end - @ - 1            ; length of variable parts of header
    db $6e                     ; owner code
.title
    dk "KISS-MON2"
.icon
    INCBIN "gfx/kissmon/icon2.2bpp"
.end

History:
.points
    dw 1
.author
    db "TOBI      ", 3
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    db $cf, $11, $21
    db $bc, $04, $cf, $cb, $cf, $b5, $cd, $87, $b1, $cd, $9a, $ad, $cd, $3d, $a9, $3e
    db $20, $cf, $b3, $3e, $e4, $e0, $9d, $21, $9f, $a1, $cf, $5c, $cd, $6d, $a1, $fa
    db $67, $c8, $21, $00, $80, $cd, $a6, $b2, $3e, $03, $cf, $b4, $af, $21, $00, $00
    db $11, $48, $4c, $01, $03, $03, $cf, $c5, $cf, $b1, $cf, $c3, $cf, $11, $cd, $bb
    db $a8, $38, $10, $cd, $64, $a4, $cf, $b1, $cf, $d8, $e6, $0f, $28, $f8, $cd, $fa
    db $a6, $38, $b6, $cd, $1f, $a2, $38, $b1, $20, $07, $3e, $01, $ea, $ac, $c9, $18
    db $a8, $cf, $11, $cf, $01, $3e, $00, $11, $03, $0b, $21, $00, $01, $01, $01, $05
    db $cf, $59, $21, $62, $c8, $11, $01, $00, $0e, $05, $cf, $5d, $01, $04, $0b, $21
    db $68, $c8, $2a, $cd, $20, $a3, $0c, $79, $fe, $05, $20, $06, $3e, $0b, $4f, $21
    db $6f, $c8, $fe, $0e, $38, $ec, $c9, $03, $00, $4b, $49, $53, $53, $20, $4d, $4f
    db $4e, $53, $54, $45, $52, $32, $00, $09, $01, $48, $55, $44, $53, $4f, $4e, $20
    db $53, $4f, $46, $54, $00, $06, $03, $0f, $c5, $cf, $b4, $00, $06, $04, $0e, $da
    db $cd, $de, $d9, $00, $06, $0b, $0f, $b6, $c1, $00, $06, $0c, $cf, $b9, $00, $06
    db $0d, $cb, $b7, $dc, $b9, $00, $02, $0f, $0e, $b9, $de, $b0, $d1, $ce, $de, $b0
    db $b2, $0f, $a6, $20, $d1, $b6, $b2, $b1, $dc, $be, $c3, $00, $02, $10, $cb, $c4
    db $d8, $c0, $de, $b9, $20, $0e, $42, $ce, $de, $c0, $dd, $0f, $a6, $20, $b5, $bd
    db $c4, $00, $02, $11, $0e, $ca, $de, $c4, $d9, $0f, $b6, $de, $0e, $bd, $c0, $b0
    db $c4, $0f, $bc, $cf, $bd, $00, $ff, $3e, $20, $cf, $b3, $3e, $e4, $e0, $9d, $fa
    db $67, $c8, $21, $00, $81, $cd, $a6, $b2, $11, $12, $c9, $21, $00, $80, $01, $90
    db $00, $cf, $02, $3e, $00, $11, $03, $0b, $21, $00, $01, $01, $01, $05, $cf, $59
    db $21, $62, $c8, $11, $01, $00, $0e, $05, $cf, $5d, $21, $a4, $a2, $cf, $5c, $01
    db $04, $0b, $21, $ee, $ad, $2a, $cd, $20, $a3, $0c, $79, $fe, $0a, $20, $03, $23
    db $0c, $79, $fe, $0e, $38, $ef, $11, $48, $88, $cd, $e0, $ae, $3e, $09, $21, $10
    db $00, $11, $48, $10, $01, $03, $03, $cf, $c5, $3e, $03, $cf, $b4, $cf, $b1, $cf
    db $d8, $cb, $57, $20, $0e, $cb, $47, $20, $0c, $cb, $5f, $20, $0a, $cb, $4f, $28
    db $ec, $b7, $c9, $af, $c9, $37, $c9, $cd, $3a, $a3, $37, $c9, $06, $03, $0f, $c5
    db $cf, $b4, $00, $06, $04, $0e, $da, $cd, $de, $d9, $00, $06, $05, $0f, $ba, $b3
    db $b9, $de, $b7, $00, $06, $06, $ce, $de, $b3, $b7, $de, $ae, $00, $06, $07, $bd
    db $ca, $de, $d4, $bb, $00, $06, $08, $b3, $dd, $c9, $d6, $bb, $00, $06, $09, $48
    db $50, $00, $06, $0b, $b6, $c1, $00, $06, $0c, $cf, $b9, $00, $06, $0d, $cb, $b7
    db $dc, $b9, $00, $03, $0f, $41, $3a, $c2, $c2, $de, $b9, $d9, $20, $20, $42, $3a
    db $b5, $dc, $d9, $00, $04, $10, $53, $45, $4c, $45, $43, $54, $3a, $bc, $ad, $b3
    db $be, $b2, $00, $02, $11, $53, $54, $41, $52, $54, $3a, $0e, $d3, $dd, $bd, $c0
    db $b0, $0f, $ba, $b3, $b6, $dd, $00, $ff, $e5, $d5, $c5, $f5, $69, $60, $cf, $b8
    db $f1, $5f, $16, $00, $21, $3c, $c8, $cf, $a3, $21, $3f, $c8, $cf, $69, $c1, $d1
    db $e1, $c9, $3e, $04, $cd, $25, $af, $3e, $20, $cf, $b3, $21, $c6, $a3, $cf, $5c
    db $11, $12, $c9, $21, $00, $90, $01, $90, $00, $cf, $02, $fa, $67, $c8, $3d, $e6
    db $0f, $ea, $5f, $c8, $21, $00, $91, $cd, $a6, $b2, $11, $00, $0d, $cd, $ba, $a3
    db $11, $10, $03, $cd, $ba, $a3, $3e, $03, $cf, $b4, $cf, $b1, $cf, $d8, $b7, $28
    db $f9, $47, $cb, $48, $20, $36, $cb, $50, $20, $1b, $21, $5f, $c8, $7e, $cb, $60
    db $20, $07, $cb, $68, $28, $e4, $3d, $18, $01, $3c, $e6, $0f, $77, $21, $00, $91
    db $cd, $a6, $b2, $18, $d5, $fa, $5f, $c8, $cd, $b1, $b2, $3e, $0a, $ea, $00, $00
    db $11, $12, $c9, $01, $90, $00, $cf, $02, $af, $ea, $00, $00, $f0, $8a, $b7, $20
    db $fb, $c9, $7b, $1e, $05, $21, $01, $03, $01, $03, $03, $cf, $59, $c9, $06, $00
    db $0e, $d3, $dd, $bd, $c0, $b0, $0f, $ba, $b3, $b6, $dd, $00, $01, $02, $ba, $b3
    db $b6, $dd, $bd, $d9, $20, $20, $20, $20, $20, $20, $d3, $d7, $b3, $00, $02, $03
    db $0e, $d3, $dd, $bd, $c0, $b0, $20, $20, $20, $20, $20, $d3, $dd, $bd, $c0, $b0
    db $00, $00, $09, $0f, $bc, $de, $ad, $b3, $bc, $de, $0e, $b7, $b0, $0f, $c3, $de
    db $20, $ba, $b3, $b6, $dd, $bd, $d9, $0e, $d3, $dd, $bd, $c0, $b0, $0f, $a6, $00
    db $00, $0a, $b4, $d7, $dd, $c3, $de, $b8, $c0, $de, $bb, $b2, $00, $00, $0b, $b4
    db $d7, $ca, $de, $da, $c0, $20, $0e, $d3, $dd, $bd, $c0, $b0, $0f, $ca, $20, $b7
    db $b4, $c3, $bc, $cf, $b3, $c9, $00, $00, $0c, $c3, $de, $20, $c1, $ad, $b3, $b2
    db $bc, $cf, $bc, $ae, $b3, $00, $01, $0f, $53, $45, $4c, $45, $43, $54, $3a, $b9
    db $af, $c3, $b2, $20, $42, $3a, $c1, $ad, $b3, $bc, $00, $ff, $3e, $1d, $cd, $4c
    db $af, $cd, $89, $ae, $11, $0d, $00, $01, $05, $14, $cf, $58, $cd, $98, $a8, $21
    db $00, $88, $1e, $00, $01, $00, $08, $cf, $a6, $cd, $98, $ae, $21, $6d, $c8, $2a
    db $23, $77, $21, $0d, $c9, $2a, $23, $77, $3e, $03, $cf, $b4, $21, $5c, $c8, $36
    db $05, $23, $36, $0f, $21, $28, $a5, $cd, $74, $a8, $0e, $78, $cf, $b1, $0d, $20
    db $fb, $cd, $98, $a8, $3e, $00, $cd, $25, $af, $af, $ea, $a8, $c9, $cd, $3d, $a5
    db $30, $14, $cd, $e1, $a7, $cd, $3f, $a8, $21, $7d, $a6, $cd, $74, $a8, $cd, $b3
    db $a8, $cd, $97, $a5, $38, $35, $cd, $5d, $a5, $cd, $88, $a5, $38, $2d, $21, $a9
    db $c9, $7e, $ee, $01, $77, $cd, $88, $a5, $38, $21, $21, $a8, $c9, $34, $7e, $fe
    db $0a, $38, $e3, $3e, $0a, $ea, $00, $00, $21, $de, $a6, $cd, $74, $a8, $21, $f7
    db $ad, $34, $20, $02, $36, $ff, $af, $ea, $00, $00, $c9, $0e, $02, $21, $f5, $ad
    db $fa, $6d, $c8, $b7, $20, $03, $0e, $03, $23, $e5, $cf, $b1, $79, $cd, $25, $af
    db $e1, $3e, $0a, $ea, $00, $00, $34, $20, $02, $36, $ff, $af, $ea, $00, $00, $c9
    db $0e, $ca, $de, $c4, $d9, $20, $bd, $c0, $b0, $c4, $21, $21, $00, $53, $54, $41
    db $52, $54, $21, $21, $00, $fa, $aa, $c9, $21, $a9, $c9, $77, $3e, $0a, $cd, $cb
    db $a7, $cd, $53, $ae, $38, $0d, $3e, $0a, $cd, $c2, $a7, $cd, $53, $ae, $d0, $7e
    db $ee, $01, $77, $37, $c9, $fa, $aa, $c9, $ea, $a9, $c9, $3e, $09, $cd, $c2, $a7
    db $cd, $6e, $ae, $57, $3e, $09, $cd, $cb, $a7, $cd, $6e, $ae, $5f, $82, $30, $02
    db $3e, $ff, $cd, $5c, $ae, $ba, $30, $07, $21, $a9, $c9, $7e, $ee, $01, $77, $c9
    db $cd, $e1, $a7, $cd, $3f, $a8, $21, $a8, $a6, $cd, $74, $a8, $cd, $b3, $a8, $af
    db $ea, $ab, $c9, $cd, $fd, $ad, $38, $14, $cd, $ed, $a7, $cd, $3f, $a8, $21, $8b
    db $a6, $cd, $74, $a8, $cd, $6e, $a7, $cd, $98, $a8, $b7, $c9, $3e, $0a, $cd, $c2
    db $a7, $cb, $3f, $cb, $3f, $cd, $5c, $ae, $57, $3e, $09, $cd, $c2, $a7, $cb, $3f
    db $82, $57, $3e, $08, $cd, $c2, $a7, $82, $57, $3e, $0a, $cd, $cb, $a7, $cb, $3f
    db $cb, $3f, $cd, $5c, $ae, $5f, $3e, $09, $cd, $cb, $a7, $cb, $3f, $cb, $3f, $83
    db $5f, $3e, $07, $cd, $cb, $a7, $83, $30, $02, $3e, $ff, $5f, $cb, $3b, $cb, $3b
    db $cb, $3b, $93, $cd, $6e, $ae, $5f, $af, $ea, $ad, $c9, $3e, $0a, $cd, $cb, $a7
    db $cb, $3f, $cd, $5c, $ae, $4f, $3e, $09, $cd, $cb, $a7, $cb, $3f, $cb, $3f, $81
    db $cd, $53, $ae, $30, $1a, $cb, $3a, $d5, $7b, $92, $38, $12, $fe, $05, $38, $0e
    db $21, $9b, $a6, $cd, $74, $a8, $cd, $b3, $a8, $3e, $01, $ea, $ad, $c9, $d1, $7b
    db $92, $28, $02, $30, $04, $cf, $8e, $e6, $03, $ea, $ab, $c9, $f5, $b7, $20, $05
    db $21, $c2, $a6, $18, $06, $cd, $69, $a8, $21, $b2, $a6, $cd, $74, $a8, $cd, $b3
    db $a8, $f1, $cd, $f9, $a7, $f5, $cd, $14, $a8, $cd, $6e, $a7, $f1, $28, $05, $cd
    db $98, $a8, $b7, $c9, $cd, $98, $a8, $cd, $ed, $a7, $cd, $3f, $a8, $21, $d4, $a6
    db $cd, $74, $a8, $37, $c9, $0f, $c9, $20, $be, $dd, $be, $b2, $ba, $b3, $b9, $de
    db $b7, $21, $00, $0f, $ca, $20, $bd, $ca, $de, $d4, $b8, $20, $d0, $a6, $b6, $dc
    db $bc, $c0, $00, $0f, $b6, $b2, $bc, $dd, $c9, $b2, $c1, $b9, $de, $b7, $21, $00
    db $0f, $c9, $20, $ba, $b3, $b9, $de, $b7, $21, $00, $0e, $ce, $df, $b2, $dd, $c4
    db $0f, $c9, $0e, $c0, $de, $d2, $b0, $bc, $de, $00, $0e, $c0, $de, $d2, $b0, $bc
    db $de, $0f, $a6, $20, $b1, $c0, $b4, $d7, $da, $c5, $b2, $00, $0f, $ca, $20, $c1
    db $b6, $d7, $c2, $b7, $c0, $00, $0f, $bc, $de, $b6, $dd, $b7, $de, $da, $20, $cb
    db $b7, $dc, $b9, $c3, $de, $bd, $00, $01, $0b, $48, $50, $00, $0b, $0b, $48, $50
    db $00, $ff, $21, $ee, $ad, $4e, $21, $02, $00, $29, $0d, $20, $fc, $e5, $01, $f5
    db $ad, $0a, $03, $6f, $26, $00, $29, $0a, $03, $5f, $54, $19, $0a, $5f, $19, $d1
    db $7c, $ba, $20, $02, $7d, $bb, $30, $02, $b7, $c9, $cd, $98, $a8, $21, $62, $c8
    db $cd, $3f, $a8, $21, $5f, $a7, $cd, $74, $a8, $3e, $37, $cd, $4c, $af, $cf, $b1
    db $cf, $d8, $e6, $0f, $28, $f8, $cd, $3d, $a9, $21, $6e, $c8, $3e, $05, $86, $77
    db $3e, $01, $cd, $25, $af, $cd, $9c, $a9, $3e, $0a, $ea, $00, $00, $21, $ee, $ad
    db $34, $af, $ea, $00, $00, $37, $c9, $0f, $ca, $20, $0e, $da, $cd, $de, $d9, $b1
    db $af, $cc, $df, $21, $21, $00, $fa, $ab, $c9, $b7, $28, $17, $01, $10, $05, $fa
    db $a9, $c9, $b7, $28, $03, $01, $31, $03, $fa, $ad, $c9, $b7, $28, $01, $41, $78
    db $cd, $4c, $af, $0e, $5a, $c5, $cf, $b1, $cf, $d8, $cd, $9a, $a7, $c1, $0d, $20
    db $f4, $c9, $fa, $ab, $c9, $b7, $c8, $79, $fe, $32, $30, $08, $af, $e0, $9b, $e0
    db $9a, $c3, $d5, $ae, $e6, $07, $c0, $cd, $e7, $ae, $fa, $a9, $c9, $b7, $20, $03
    db $c3, $d8, $ae, $7a, $e0, $9b, $7b, $e0, $9a, $c9, $c5, $4f, $fa, $a9, $c9, $ee
    db $01, $18, $05, $c5, $4f, $fa, $a9, $c9, $06, $00, $e5, $21, $62, $c8, $b7, $28
    db $03, $21, $02, $c9, $09, $7e, $e1, $c1, $c9, $21, $62, $c8, $fa, $a9, $c9, $b7
    db $c8, $21, $02, $c9, $c9, $21, $02, $c9, $fa, $a9, $c9, $b7, $c8, $21, $62, $c8
    db $c9, $e5, $f5, $21, $6d, $c8, $fa, $a9, $c9, $b7, $20, $03, $21, $0d, $c9, $f1
    db $2f, $3c, $86, $cb, $7f, $28, $01, $af, $77, $e1, $b7, $c9, $21, $6d, $c8, $16
    db $04, $cd, $21, $a8, $21, $0d, $c9, $16, $0e, $7e, $42, $0e, $0b, $c3, $20, $a3
    db $e5, $d5, $7a, $53, $1e, $02, $01, $01, $05, $21, $00, $01, $cf, $59, $d1, $e1
    db $1e, $01, $0e, $05, $cf, $5d, $c9, $e5, $21, $5c, $c8, $56, $23, $5e, $01, $01
    db $05, $21, $00, $01, $fa, $a7, $c9, $f5, $cf, $59, $f1, $e1, $57, $1e, $01, $0e
    db $05, $cf, $5d, $7a, $c6, $05, $ea, $a7, $c9, $21, $5c, $c8, $3e, $05, $86, $77
    db $c9, $5f, $16, $00, $21, $3c, $c8, $cf, $a3, $21, $3f, $c8, $e5, $21, $5c, $c8
    db $56, $23, $5e, $cf, $57, $4d, $44, $e1, $fa, $a7, $c9, $57, $1e, $01, $cf, $5b
    db $fa, $a7, $c9, $92, $2f, $3c, $21, $5c, $c8, $86, $77, $7a, $ea, $a7, $c9, $c9
    db $3e, $7f, $11, $0e, $01, $01, $03, $12, $21, $00, $00, $cf, $59, $3e, $ca, $ea
    db $a7, $c9, $21, $5c, $c8, $36, $01, $23, $36, $0e, $c9, $21, $5c, $c8, $36, $01
    db $23, $34, $c9, $11, $b2, $c3, $21, $6f, $c8, $01, $03, $00, $cf, $02, $af, $ea
    db $aa, $c9, $21, $60, $c8, $36, $6b, $23, $36, $32, $af, $ea, $5f, $c8, $21, $5f
    db $c8, $34, $7e, $fe, $03, $30, $54, $cf, $72, $30, $3d, $cf, $b1, $f0, $8a, $e6
    db $02, $20, $f8, $21, $60, $c8, $11, $00, $c6, $d5, $0e, $02, $cf, $7c, $e1, $38
    db $dd, $2a, $fe, $6b, $20, $35, $7e, $fe, $32, $20, $30, $21, $62, $c8, $11, $02
    db $c9, $0e, $a0, $e5, $d5, $cf, $7c, $d1, $e1, $38, $c3, $0e, $a0, $cf, $7f, $38
    db $bd, $cf, $73, $38, $b9, $b7, $18, $14, $11, $0f, $c9, $21, $b2, $c3, $01, $03
    db $00, $cf, $02, $3e, $01, $ea, $aa, $c9, $b7, $18, $01, $37, $f5, $21, $60, $c8
    db $af, $22, $77, $f1, $c9, $21, $e7, $ad, $2a, $b7, $28, $42, $11, $62, $c8, $0e
    db $10, $2a, $12, $13, $0d, $20, $fa, $21, $f8, $ad, $11, $a2, $c9, $0e, $05, $2a
    db $12, $13, $0d, $20, $fa, $fa, $ac, $c9, $b7, $20, $18, $fa, $67, $c8, $cd, $b1
    db $b2, $21, $72, $c8, $0e, $90, $1a, $13, $22, $0d, $20, $fa, $f0, $8a, $e6, $04
    db $fe, $04, $c0, $af, $ea, $ac, $c9, $3e, $01, $cd, $25, $af, $18, $16, $21, $62
    db $c8, $0e, $05, $3e, $20, $22, $0d, $20, $fc, $3e, $01, $cd, $25, $af, $cd, $58
    db $aa, $cd, $cc, $a9, $cd, $98, $ab, $38, $f5, $3e, $0a, $ea, $00, $00, $21, $e7
    db $ad, $11, $62, $c8, $36, $01, $23, $0e, $0d, $1a, $13, $22, $0d, $20, $fa, $23
    db $23, $23, $11, $a2, $c9, $0e, $05, $1a, $13, $22, $0d, $20, $fa, $af, $ea, $00
    db $00, $c3, $3d, $a9, $21, $e8, $ad, $11, $62, $c8, $0e, $05, $1a, $13, $be, $23
    db $20, $04, $0d, $20, $f7, $c9, $3e, $0a, $ea, $00, $00, $21, $f5, $ad, $af, $22
    db $22, $22, $21, $e8, $ad, $11, $62, $c8, $0e, $05, $1a, $13, $22, $0d, $20, $fa
    db $af, $ea, $00, $00, $3e, $01, $ea, $68, $c8, $21, $62, $c8, $11, $b2, $c3, $2a
    db $86, $23, $12, $13, $2a, $86, $23, $12, $13, $7e, $12, $cf, $8e, $e6, $0f, $ea
    db $67, $c8, $21, $a2, $c9, $0e, $04, $06, $00, $3e, $0a, $cd, $6e, $ae, $22, $80
    db $47, $0d, $20, $f5, $3e, $32, $90, $28, $e9, $38, $e7, $77, $21, $a2, $c9, $11
    db $69, $c8, $0e, $04, $06, $00, $3e, $0a, $cd, $6e, $ae, $86, $23, $12, $13, $80
    db $47, $0d, $20, $f2, $3e, $64, $90, $28, $e3, $38, $e1, $12, $13, $af, $12, $c9
    db $cd, $89, $ae, $11, $00, $c8, $cf, $51, $11, $0d, $42, $21, $00, $c6, $cf, $54
    db $21, $9f, $aa, $11, $01, $80, $cf, $5a, $11, $05, $07, $01, $03, $07, $cf, $58
    db $3e, $3d, $11, $06, $08, $01, $01, $05, $21, $00, $01, $cf, $59, $3e, $03, $cf
    db $b4, $11, $01, $3d, $06, $05, $21, $62, $c8, $78, $cf, $4d, $4f, $cf, $55, $f0
    db $8a, $e6, $04, $c8, $c3, $69, $a1, $03, $00, $4b, $49, $53, $53, $20, $4d, $4f
    db $4e, $53, $54, $45, $52, $32, $00, $04, $02, $0e, $d3, $dd, $bd, $c0, $b0, $0f
    db $c9, $20, $c5, $cf, $b4, $a6, $00, $04, $03, $0f, $c6, $ad, $b3, $d8, $ae, $b8
    db $bc, $c3, $b8, $c0, $de, $bb, $b2, $00, $04, $09, $c5, $cf, $b4, $a6, $20, $cd
    db $dd, $ba, $b3, $bd, $d9, $c4, $00, $04, $0a, $b7, $db, $b8, $ca, $20, $0e, $b8
    db $d8, $b1, $0f, $bb, $da, $cf, $bd, $00, $03, $0b, $53, $54, $41, $52, $54, $3a
    db $c5, $cf, $b4, $c9, $b9, $af, $c3, $b2, $00, $02, $0c, $0e, $53, $45, $4c, $45
    db $43, $54, $3a, $d2, $c6, $ad, $b0, $0f, $cd, $d3, $c4, $de, $d9, $00, $ff, $cf
    db $b5, $fa, $67, $c8, $cd, $b1, $b2, $21, $00, $c7, $01, $90, $00, $e5, $d5, $cf
    db $02, $cd, $4f, $af, $d1, $e1, $e5, $d5, $0e, $90, $1a, $13, $be, $20, $09, $23
    db $0d, $20, $f7, $d1, $e1, $c3, $98, $ab, $e1, $d1, $3e, $0a, $ea, $00, $00, $01
    db $90, $00, $cf, $02, $af, $ea, $00, $00, $21, $00, $c7, $0e, $30, $e5, $c5, $e5
    db $11, $30, $00, $46, $19, $4e, $c5, $19, $46, $0e, $00, $d1, $3e, $04, $cb, $3a
    db $cb, $1b, $cb, $18, $cb, $19, $3d, $20, $f5, $e1, $c5, $01, $30, $00, $72, $09
    db $73, $d1, $09, $72, $09, $73, $c1, $e1, $23, $0d, $20, $d1, $3e, $0a, $ea, $00
    db $00, $11, $00, $c7, $21, $17, $a0, $01, $c0, $00, $cf, $02, $af, $ea, $00, $00
    db $3e, $20, $cf, $b3, $af, $11, $00, $04, $01, $01, $05, $21, $00, $01, $cf, $59
    db $21, $62, $c8, $11, $01, $00, $0e, $05, $cf, $5d, $21, $cf, $ac, $cf, $5c, $cd
    db $ef, $ab, $3e, $03, $cf, $b4, $af, $ea, $5d, $c8, $cd, $be, $ac, $cd, $06, $ac
    db $cf, $b1, $cf, $d8, $cd, $27, $ac, $f0, $8b, $cb, $57, $28, $03, $c3, $17, $ab
    db $cb, $4f, $20, $11, $e6, $09, $28, $e8, $fa, $6e, $c8, $b7, $20, $e2, $fa, $6d
    db $c8, $b7, $28, $dc, $c9, $37, $c9, $fa, $67, $c8, $21, $00, $91, $cd, $a6, $b2
    db $3e, $10, $21, $01, $03, $01, $03, $03, $11, $00, $00, $cf, $59, $c9, $01, $05
    db $0f, $21, $69, $c8, $11, $a2, $c9, $1a, $13, $06, $0a, $cd, $20, $a3, $06, $0f
    db $2a, $cd, $20, $a3, $0c, $79, $fe, $0a, $38, $ed, $2a, $cd, $20, $a3, $c9, $f0
    db $b6, $47, $e6, $c0, $28, $23, $cd, $ba, $ac, $21, $5d, $c8, $7e, $cb, $70, $28
    db $09, $3d, $cb, $7f, $28, $0e, $3e, $05, $18, $0a, $cb, $78, $28, $0b, $3c, $fe
    db $06, $38, $01, $af, $77, $af, $ea, $5e, $c8, $f0, $b6, $47, $e6, $30, $28, $56
    db $3e, $01, $cd, $4c, $af, $fa, $5d, $c8, $b7, $28, $32, $3d, $5f, $16, $00, $21
    db $a2, $c9, $19, $4e, $21, $69, $c8, $19, $5e, $fa, $6e, $c8, $57, $78, $e6, $10
    db $28, $06, $14, $15, $28, $02, $15, $1c, $78, $e6, $20, $28, $06, $7b, $b9, $28
    db $02, $14, $1d, $73, $7a, $ea, $6e, $c8, $cd, $06, $ac, $18, $19, $21, $67, $c8
    db $4e, $78, $e6, $11, $28, $03, $0c, $18, $06, $78, $e6, $22, $28, $08, $0d, $79
    db $e6, $0f, $77, $cd, $ef, $ab, $21, $5e, $c8, $7e, $34, $e6, $0f, $c0, $cb, $66
    db $28, $04, $3e, $20, $18, $02, $3e, $3e, $f5, $fa, $5d, $c8, $c6, $04, $6f, $26
    db $01, $cf, $b8, $f1, $cf, $bb, $c9, $09, $00, $0f, $c9, $20, $c4, $b8, $c1, $ae
    db $b3, $a6, $00, $04, $01, $be, $af, $c3, $b2, $bc, $c3, $b8, $c0, $de, $bb, $b2
    db $00, $0a, $03, $b7, $ce, $dd, $20, $ba, $de, $b3, $b9, $b2, $00, $03, $04, $bc
    db $ad, $d9, $b2, $00, $03, $05, $ba, $b3, $b9, $de, $b7, $00, $03, $06, $ce, $de
    db $b3, $b7, $de, $ae, $00, $03, $07, $bd, $ca, $de, $d4, $bb, $00, $03, $08, $b3
    db $dd, $c9, $d6, $bb, $00, $03, $09, $48, $50, $00, $03, $0a, $b1, $cf, $d8, $00
    db $0b, $0a, $2d, $2d, $00, $00, $0c, $0f, $b1, $cf, $d8, $b6, $de, $30, $c6, $c5
    db $d9, $d6, $b3, $c6, $20, $bc, $de, $ad, $b3, $bc, $de, $0e, $b7, $b0, $0f, $a6
    db $00, $00, $0d, $c2, $b6, $af, $c3, $20, $bd, $b3, $c1, $a6, $20, $b9, $af, $c3
    db $b2, $bc, $c3, $b8, $c0, $de, $bb, $b2, $00, $00, $0f, $53, $54, $41, $52, $54
    db $2c, $41, $3a, $be, $af, $c3, $b2, $20, $bc, $ad, $b3, $d8, $ae, $b3, $00, $06
    db $10, $42, $3a, $c5, $cf, $b4, $cd, $dd, $ba, $b3, $00, $01, $11, $53, $45, $4c
    db $45, $43, $54, $3a, $0e, $d3, $dd, $bd, $c0, $b0, $c3, $de, $bb, $de, $b2, $dd
    db $00, $ff, $21, $3c, $c8, $e5, $11, $46, $ff, $01, $0a, $00, $cf, $e4, $e1, $11
    db $dd, $ad, $06, $0a, $1a, $13, $be, $23, $20, $05, $05, $20, $f7, $b7, $c9, $3e
    db $0a, $ea, $00, $00, $21, $3c, $c8, $11, $dd, $ad, $06, $0a, $2a, $12, $13, $05
    db $20, $fa, $21, $e7, $ad, $36, $00, $23, $af, $06, $10, $22, $05, $20, $fc, $af
    db $ea, $00, $00, $37, $c9, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $3e, $0a, $cd, $cb, $a7, $87, $cd, $53, $ae, $38, $1c
    db $3e, $0a, $cd, $c2, $a7, $87, $cd, $53, $ae, $38, $13, $cd, $28, $ae, $57, $cd
    db $28, $ae, $5f, $92, $38, $06, $5f, $cf, $8e, $bb, $38, $02, $37, $c9, $b7, $c9
    db $e5, $3e, $0d, $cd, $cb, $a7, $67, $3e, $09, $cd, $cb, $a7, $6f, $3e, $0a, $cd
    db $cb, $a7, $cb, $3f, $85, $30, $02, $3e, $ff, $cd, $6e, $ae, $94, $30, $01, $af
    db $f5, $21, $a9, $c9, $7e, $ee, $01, $77, $f1, $e1, $c9, $e5, $d5, $5f, $cf, $8e
    db $bb, $d1, $e1, $c9, $e5, $d5, $c5, $5f, $16, $00, $cf, $8e, $6f, $26, $00, $cf
    db $89, $7c, $c1, $d1, $e1, $c9, $e5, $d5, $c5, $5f, $16, $00, $cf, $8e, $6f, $cf
    db $8e, $85, $1f, $6f, $26, $00, $01, $80, $00, $09, $cf, $89, $7c, $c1, $d1, $e1
    db $c9, $3e, $20, $cf, $b3, $26, $04, $cf, $ca, $3e, $e4, $e0, $9c, $e0, $9d, $c9
    db $21, $62, $c8, $11, $04, $c0, $cd, $28, $a8, $11, $0e, $c5, $21, $02, $c9, $cd
    db $28, $a8, $21, $ef, $a6, $cf, $5c, $cd, $14, $a8, $11, $72, $c8, $21, $00, $88
    db $01, $90, $00, $cf, $02, $11, $12, $c9, $21, $00, $80, $01, $90, $00, $cf, $02
    db $3e, $80, $21, $01, $03, $01, $03, $03, $11, $06, $04, $cf, $59, $11, $00, $00
    db $3e, $78, $82, $57, $3e, $40, $83, $5f, $af, $21, $f6, $ae, $cf, $60, $c9, $cf
    db $8e, $e6, $02, $d6, $01, $57, $cf, $8e, $e6, $02, $d6, $01, $5f, $c9, $09, $00
    db $00, $06, $20, $08, $00, $07, $20, $10, $00, $08, $20, $00, $08, $03, $20, $08
    db $08, $04, $20, $10, $08, $05, $20, $00, $10, $00, $20, $08, $10, $01, $20, $10
    db $10, $02, $20, $07, $06, $1b, $19, $03, $07, $02, $0f, $0e, $12, $e5, $d5, $c5
    db $5f, $16, $00, $fa, $14, $00, $21, $1b, $af, $fe, $01, $28, $0f, $fe, $fe, $28
    db $0b, $21, $20, $af, $fe, $02, $28, $04, $c1, $d1, $e1, $c9, $19, $7e, $cf, $13
    db $c1, $d1, $e1, $c9, $cf, $14, $c9, $3e, $20, $cf, $b3, $21, $01, $03, $cf, $b6
    db $cd, $a8, $b1, $cd, $54, $b1, $3e, $63, $cf, $b4, $cf, $b1, $01, $00, $28, $cf
    db $c4, $cf, $d8, $cd, $a6, $af, $f0, $8b, $cb, $57, $20, $08, $cd, $87, $af, $cd
    db $b9, $b0, $18, $e6, $f0, $9b, $ea, $ba, $c9, $f0, $9a, $ea, $bb, $c9, $c9, $f0
    db $8b, $cb, $5f, $c8, $21, $bc, $c9, $34, $fa, $bc, $c9, $11, $46, $b2, $e6, $01
    db $28, $03, $11, $86, $b2, $21, $00, $90, $01, $10, $00, $cf, $02, $c9, $f0, $b6
    db $47, $e6, $f0, $28, $34, $cb, $70, $28, $05, $cd, $14, $b0, $18, $19, $cb, $78
    db $28, $05, $cd, $34, $b0, $18, $10, $cb, $68, $28, $05, $cd, $56, $b0, $18, $07
    db $cb, $60, $28, $03, $cd, $76, $b0, $cd, $98, $b0, $f0, $8a, $e6, $03, $28, $09
    db $cd, $21, $b1, $fa, $b9, $c9, $cd, $d5, $b0, $21, $b8, $c9, $7e, $4f, $34, $cb
    db $61, $c0, $f0, $9b, $57, $f0, $9a, $5f, $21, $00, $c3, $fa, $b7, $c9, $3c, $3c
    db $87, $87, $87, $93, $22, $fa, $b6, $c9, $3c, $87, $87, $87, $92, $22, $af, $22
    db $77, $c9, $77, $87, $87, $87, $5f, $af, $ea, $b8, $c9, $c9, $21, $b7, $c9, $7e
    db $3d, $cb, $7f, $28, $01, $af, $cd, $0a, $b0, $f0, $9a, $b7, $28, $0d, $57, $93
    db $2f, $3c, $fe, $20, $30, $05, $7a, $d6, $08, $e0, $9a, $c9, $21, $b7, $c9, $7e
    db $3c, $fe, $18, $38, $02, $3e, $17, $cd, $0a, $b0, $f0, $9a, $fe, $50, $30, $0d
    db $57, $93, $2f, $3c, $fe, $50, $38, $05, $7a, $c6, $08, $e0, $9a, $c9, $21, $b6
    db $c9, $7e, $3d, $cb, $7f, $28, $01, $af, $cd, $0a, $b0, $f0, $9b, $b7, $28, $0d
    db $57, $93, $2f, $3c, $fe, $20, $30, $05, $7a, $d6, $08, $e0, $9b, $c9, $21, $b6
    db $c9, $7e, $3c, $fe, $18, $38, $02, $3e, $17, $cd, $0a, $b0, $f0, $9b, $fe, $20
    db $30, $0d, $57, $93, $2f, $3c, $fe, $80, $38, $05, $7a, $c6, $08, $e0, $9b, $c9
    db $fa, $b6, $c9, $2e, $22, $cd, $a5, $b0, $fa, $b7, $c9, $2e, $23, $e5, $5f, $16
    db $00, $21, $ae, $c9, $cf, $a3, $e1, $26, $08, $cf, $b8, $21, $b2, $c9, $cf, $69
    db $c9, $f0, $8b, $5f, $e6, $03, $c8, $d5, $cd, $21, $b1, $d1, $cb, $43, $28, $01
    db $3c, $cb, $4b, $28, $03, $fa, $b9, $c9, $e6, $03, $ea, $b9, $c9, $57, $59, $cb
    db $42, $20, $02, $1e, $00, $7e, $a0, $b3, $22, $59, $cb, $4a, $20, $02, $1e, $00
    db $7e, $a0, $b3, $32, $5d, $54, $26, $91, $01, $02, $00, $cf, $02, $fa, $b7, $c9
    db $67, $2e, $00, $cb, $3c, $cb, $1d, $cb, $3c, $cb, $1d, $cb, $3c, $cb, $1d, $fa
    db $b6, $c9, $b5, $6f, $11, $00, $98, $19, $11, $b9, $c9, $01, $01, $00, $cf, $02
    db $c9, $80, $40, $20, $10, $08, $04, $02, $01, $fa, $b6, $c9, $e6, $07, $5f, $16
    db $00, $21, $19, $b1, $19, $7e, $4f, $2f, $47, $fa, $b6, $c9, $e6, $f8, $87, $6f
    db $87, $85, $6f, $fa, $b7, $c9, $87, $85, $6f, $26, $c7, $23, $16, $00, $3a, $a1
    db $28, $01, $14, $cb, $22, $7e, $a1, $28, $01, $14, $7a, $c9, $af, $21, $b6, $c9
    db $56, $22, $5e, $32, $d5, $21, $00, $98, $01, $00, $04, $e5, $cd, $21, $b1, $e1
    db $22, $11, $b6, $c9, $1a, $3c, $12, $fe, $20, $38, $f0, $af, $12, $11, $b7, $c9
    db $1a, $3c, $12, $fe, $20, $38, $e4, $d1, $21, $b6, $c9, $72, $23, $73, $c9, $af
    db $ea, $ba, $c9, $ea, $bb, $c9, $ea, $b6, $c9, $ea, $b7, $c9, $21, $00, $c7, $01
    db $00, $01, $1e, $00, $cf, $a6, $af, $ea, $bc, $c9, $3e, $03, $ea, $b9, $c9, $c9
    db $3e, $e4, $e0, $9d, $3e, $07, $e0, $a0, $3e, $70, $e0, $9f, $fa, $ba, $c9, $e0
    db $9b, $fa, $bb, $c9, $e0, $9a, $cd, $e3, $b1, $cd, $90, $af, $11, $56, $b2, $21
    db $10, $90, $01, $30, $00, $cf, $02, $11, $96, $b2, $21, $00, $80, $01, $10, $00
    db $cf, $02, $21, $ef, $b1, $cf, $5c, $cd, $98, $b0, $c9, $21, $00, $91, $11, $00
    db $c7, $01, $00, $01, $cf, $02, $c9, $00, $20, $2d, $2d, $2d, $2d, $2d, $2d, $2d
    db $2d, $2d, $2d, $2d, $2d, $2d, $2d, $2d, $2d, $2d, $2d, $2d, $2d, $00, $00, $21
    db $20, $70, $73, $76, $20, $20, $4d, $4f, $4e, $53, $54, $45, $52, $20, $45, $44
    db $49, $54, $00, $00, $22, $20, $71, $74, $77, $20, $20, $58, $3d, $20, $20, $20
    db $41, $20, $20, $3a, $53, $45, $54, $00, $00, $23, $20, $72, $75, $78, $20, $20
    db $59, $3d, $20, $20, $20, $53, $45, $4c, $3a, $45, $58, $49, $54, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $00
    db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $ff
    db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $ff, $ff
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $01
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $ff, $ff, $ff
    db $ff, $81, $c3, $81, $c3, $81, $c3, $81, $c3, $81, $ff, $81, $ff, $ff, $e5, $cd
    db $b1, $b2, $e1, $01, $90, $00, $cf, $02, $c9, $5f, $16, $00, $21, $90, $00, $cf
    db $89, $11, $c0, $b2, $19, $5d, $54, $c9, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $01, $01, $02, $03, $02, $03, $02, $03, $21, $21, $60, $60, $60, $60
    db $a0, $e0, $a0, $e0, $90, $f0, $89, $f9, $46, $7f, $62, $5f, $3a, $27, $1f, $19
    db $07, $07, $01, $01, $01, $01, $00, $00, $0f, $0f, $3c, $3f, $7e, $43, $df, $b9
    db $ff, $e5, $bf, $eb, $df, $3f, $e0, $5f, $fc, $3f, $7f, $83, $97, $ec, $6f, $73
    db $4f, $70, $9f, $e0, $9f, $f8, $87, $fc, $73, $fe, $3b, $ee, $1f, $f4, $1f, $f0
    db $ff, $f9, $ff, $57, $fd, $fd, $00, $00, $00, $00, $c0, $c0, $38, $f8, $3c, $e4
    db $3c, $ec, $38, $f8, $10, $f0, $ce, $fe, $e7, $bd, $01, $ff, $fe, $fe, $f8, $08
    db $f0, $f0, $c0, $40, $e0, $20, $f8, $38, $e4, $3c, $f4, $3c, $d8, $78, $90, $f0
    db $f8, $f8, $fc, $54, $fc, $fc, $00, $00, $00, $00, $00, $00, $03, $03, $04, $07
    db $08, $0f, $10, $1f, $10, $1f, $21, $3f, $20, $3f, $40, $7f, $40, $7f, $40, $7f
    db $40, $7f, $40, $7f, $20, $3f, $20, $3f, $10, $1f, $0f, $0f, $13, $1c, $13, $1c
    db $0b, $0e, $0b, $0e, $06, $07, $01, $01, $3f, $3f, $c0, $ff, $0e, $f1, $07, $f8
    db $03, $fc, $03, $fc, $01, $fe, $60, $ff, $f0, $df, $f0, $df, $f1, $ff, $63, $fe
    db $07, $fc, $0b, $fd, $0f, $fe, $3b, $fc, $dd, $e6, $7f, $83, $ff, $00, $ff, $21
    db $de, $52, $de, $52, $d6, $5a, $8c, $8c, $80, $80, $60, $e0, $10, $f0, $88, $78
    db $c4, $3c, $c4, $3c, $82, $7e, $5a, $fe, $3e, $f6, $3d, $f7, $bd, $ff, $d9, $7f
    db $e1, $3f, $e1, $bf, $e1, $7f, $e2, $3e, $f6, $5e, $fc, $8c, $f8, $08, $f8, $08
    db $f8, $88, $f0, $90, $f0, $90, $60, $60, $60, $60, $fc, $9c, $bf, $e3, $6f, $5c
    db $9f, $f0, $bf, $e0, $7f, $41, $7d, $43, $fb, $87, $ff, $86, $bb, $cc, $be, $c9
    db $be, $c9, $9e, $e9, $87, $fc, $43, $7e, $41, $7f, $23, $3e, $1f, $1e, $02, $03
    db $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $e0, $e0, $f8, $18
    db $fc, $04, $fe, $72, $8a, $fe, $07, $ff, $c7, $fc, $ef, $3f, $7e, $91, $b7, $48
    db $ff, $00, $ff, $00, $7f, $86, $df, $24, $bf, $c6, $7f, $c6, $ff, $20, $ff, $10
    db $bf, $cc, $7f, $63, $1e, $12, $0c, $0c, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $80, $80, $c0, $40, $60, $a0, $e0, $e0, $a0, $60
    db $e0, $20, $f0, $10, $f0, $30, $f0, $30, $f8, $38, $f8, $08, $fc, $04, $fe, $06
    db $ff, $0f, $f6, $f6, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $3f, $3f, $7e, $41, $be, $c1, $80, $ff, $bf, $ff, $7b, $47, $5f, $7c
    db $7f, $64, $7f, $44, $ff, $83, $fa, $87, $fc, $8f, $78, $7f, $07, $07, $02, $03
    db $02, $03, $0f, $0f, $17, $1c, $1f, $1f, $ff, $ff, $8f, $f0, $ef, $f0, $ff, $ff
    db $ff, $f6, $9f, $ff, $8f, $f0, $ff, $ff, $9f, $e0, $1f, $e0, $ff, $e0, $ff, $50
    db $ff, $57, $ff, $79, $af, $f9, $3f, $f9, $4f, $cf, $48, $cf, $c7, $c7, $81, $81
    db $81, $81, $e3, $e3, $f5, $17, $f7, $f7, $c0, $c0, $40, $c0, $40, $c0, $c0, $c0
    db $80, $80, $f8, $f8, $7c, $c4, $ee, $f2, $b2, $7e, $bc, $6c, $be, $7e, $ff, $51
    db $ff, $51, $ff, $f1, $3e, $ee, $38, $f8, $20, $e0, $20, $e0, $e0, $e0, $40, $c0
    db $40, $c0, $f8, $f8, $fc, $04, $fc, $fc, $00, $00, $01, $01, $02, $03, $03, $03
    db $07, $04, $08, $0f, $08, $0f, $3f, $3f, $5e, $63, $5e, $63, $5e, $63, $3e, $3f
    db $37, $3f, $2f, $3d, $2f, $38, $7f, $78, $ff, $c8, $ff, $a7, $bf, $d0, $df, $e8
    db $bf, $ff, $87, $fc, $84, $ff, $7f, $7f, $77, $77, $9e, $ff, $7f, $89, $f7, $8f
    db $ff, $44, $ff, $27, $7f, $a0, $ff, $ff, $00, $ff, $01, $ff, $01, $ff, $00, $ff
    db $63, $ff, $ff, $ff, $86, $ff, $9f, $e6, $9f, $e0, $ef, $70, $ff, $3f, $e5, $3e
    db $e3, $ff, $f0, $1f, $10, $ff, $ef, $ef, $00, $00, $c0, $c0, $a0, $60, $e0, $a0
    db $d0, $b0, $d0, $b0, $d0, $30, $fc, $fc, $1a, $f6, $da, $76, $da, $f6, $1c, $fc
    db $38, $f8, $fc, $f4, $3e, $e2, $be, $62, $be, $62, $7c, $fc, $fe, $c2, $fe, $82
    db $ff, $ff, $7f, $c1, $41, $ff, $fe, $fe, $03, $03, $07, $04, $0c, $0b, $12, $1d
    db $1f, $10, $2f, $30, $3b, $24, $5b, $64, $7f, $44, $76, $4d, $3b, $3f, $5f, $70
    db $5d, $72, $9d, $f3, $af, $d9, $ad, $df, $57, $6f, $47, $7f, $22, $3e, $12, $1e
    db $12, $1e, $24, $3c, $18, $18, $00, $00, $80, $80, $c0, $40, $e0, $20, $72, $92
    db $32, $d2, $3d, $cf, $5c, $af, $5d, $a6, $cd, $b6, $de, $bf, $70, $ff, $c9, $3f
    db $eb, $1e, $e5, $1e, $f3, $1c, $fb, $8c, $6f, $9c, $3d, $fe, $c4, $c7, $02, $03
    db $02, $03, $01, $01, $00, $00, $00, $00, $30, $30, $78, $48, $ac, $d4, $cc, $b4
    db $d6, $aa, $7e, $82, $ff, $a1, $bf, $e1, $5f, $f5, $76, $de, $1c, $fc, $34, $ec
    db $88, $f8, $9f, $ff, $8e, $72, $fc, $04, $fc, $94, $f4, $0c, $f8, $08, $f8, $08
    db $68, $98, $10, $f0, $e0, $e0, $00, $00, $06, $06, $09, $0f, $17, $19, $2b, $35
    db $52, $6d, $a1, $de, $41, $be, $85, $7a, $18, $f7, $30, $6f, $26, $1d, $0c, $3b
    db $93, $07, $dc, $93, $6e, $4f, $3c, $23, $1f, $1f, $06, $01, $1f, $07, $79, $18
    db $e7, $61, $8e, $86, $18, $08, $10, $10, $10, $10, $11, $11, $5b, $52, $2f, $2a
    db $9a, $9f, $bb, $bc, $7d, $e6, $7e, $db, $fe, $5b, $7f, $e7, $1d, $fe, $03, $ff
    db $80, $ff, $03, $fc, $01, $fe, $00, $ff, $00, $ff, $00, $ff, $80, $ff, $60, $ff
    db $9f, $9f, $38, $38, $14, $14, $00, $00, $18, $18, $2c, $34, $34, $2c, $52, $6e
    db $c2, $fe, $f9, $7f, $dd, $37, $0f, $fb, $0f, $fb, $fe, $fe, $f6, $0e, $fa, $fe
    db $0c, $fc, $f4, $0c, $e4, $1c, $04, $fc, $04, $fc, $08, $f8, $10, $f0, $60, $e0
    db $c0, $c0, $e0, $e0, $50, $50, $00, $00, $00, $1c, $1c, $22, $3e, $41, $3e, $41
    db $3f, $40, $1f, $20, $0f, $10, $02, $0d, $01, $02, $00, $01, $00, $00, $00, $00
    db $01, $07, $07, $39, $3d, $43, $3f, $40, $38, $47, $00, $38, $00, $00, $00, $00
    db $27, $27, $1d, $1a, $07, $07, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $81, $80, $41, $81, $42, $cf, $2f, $76, $b9, $57, $ef, $8a, $fd, $f7, $98
    db $7f, $9f, $3f, $d2, $4f, $b8, $ff, $87, $7c, $53, $53, $7c, $7f, $58, $a4, $ff
    db $4e, $f3, $c7, $7b, $e4, $fc, $18, $18, $00, $30, $30, $48, $78, $84, $78, $84
    db $f8, $04, $f0, $08, $a0, $50, $40, $a0, $c0, $c0, $70, $f0, $88, $f8, $54, $ec
    db $fc, $fc, $fc, $54, $f8, $c8, $f0, $b0, $e0, $e0, $20, $e0, $a0, $60, $50, $f0
    db $d8, $e8, $c8, $f8, $b0, $f0, $60, $60, $00, $00, $03, $03, $04, $07, $08, $0f
    db $09, $0e, $08, $0f, $04, $07, $0b, $0f, $10, $1f, $20, $3f, $20, $3f, $40, $7f
    db $44, $7b, $43, $7c, $20, $3f, $5c, $7f, $83, $ff, $80, $ff, $81, $fe, $82, $fd
    db $8c, $f3, $81, $ff, $46, $7f, $39, $39, $fe, $fe, $01, $ff, $06, $f9, $03, $fc
    db $1f, $e0, $e0, $1f, $0f, $ff, $f0, $ff, $00, $ff, $30, $ff, $78, $ef, $7f, $f8
    db $70, $bf, $80, $7f, $0f, $ff, $70, $ff, $80, $ff, $00, $ff, $8c, $73, $63, $fc
    db $f1, $9e, $f0, $1f, $ff, $1f, $e0, $e0, $00, $00, $80, $80, $40, $c0, $20, $e0
    db $a0, $60, $10, $f0, $90, $f0, $70, $f0, $08, $f8, $74, $bc, $7c, $ec, $fa, $7e
    db $7a, $b6, $3a, $c6, $82, $fe, $66, $fe, $19, $ff, $01, $ff, $11, $ef, $e7, $1f
    db $cf, $39, $1f, $f1, $ee, $f2, $1c, $1c, $00, $00, $03, $03, $07, $07, $07, $07
    db $0f, $0f, $0f, $0f, $0f, $0f, $1f, $1f, $1f, $1f, $1d, $1f, $19, $1f, $19, $1f
    db $1b, $1f, $1f, $1e, $7d, $7e, $e9, $9e, $ec, $9f, $86, $ff, $7b, $47, $33, $3d
    db $0f, $09, $0e, $0f, $02, $03, $03, $03, $ff, $ff, $fe, $c7, $ff, $a3, $ff, $83
    db $f7, $cf, $f8, $ff, $80, $ff, $00, $ff, $0f, $ff, $80, $ff, $7f, $ff, $ff, $00
    db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $3f, $c0, $03, $fc, $7f, $ff
    db $40, $c0, $70, $f0, $e8, $18, $f8, $f8, $b8, $b8, $7c, $c4, $be, $ca, $be, $c2
    db $ee, $f6, $1c, $fc, $c4, $3c, $02, $fe, $fa, $fe, $06, $fe, $fe, $fe, $fa, $06
    db $fd, $03, $ff, $01, $ff, $01, $ff, $01, $fd, $03, $f2, $0e, $cc, $3c, $d8, $f8
    db $50, $70, $5c, $7c, $9a, $e6, $fe, $fe, $00, $00, $03, $03, $0d, $0e, $17, $18
    db $2f, $30, $3f, $20, $5f, $60, $7f, $40, $bf, $c0, $ff, $80, $ff, $80, $ff, $81
    db $fe, $81, $ff, $80, $ff, $80, $ff, $80, $bf, $c0, $7f, $40, $77, $48, $5d, $66
    db $5e, $63, $77, $4f, $e8, $98, $f0, $f0, $ff, $ff, $7f, $80, $ff, $00, $bd, $7e
    db $ff, $00, $ff, $33, $ff, $3f, $df, $3f, $ef, $1f, $bb, $47, $ff, $20, $ff, $10
    db $ff, $c8, $3f, $f8, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
    db $ff, $00, $9f, $e0, $7f, $7f, $00, $00, $80, $80, $60, $e0, $d0, $30, $78, $f8
    db $f4, $0c, $fc, $94, $fa, $f6, $fe, $f2, $ee, $f2, $dd, $e3, $ff, $05, $ff, $09
    db $ff, $13, $fd, $1f, $ff, $01, $ff, $01, $fd, $03, $fe, $02, $7a, $86, $f4, $0c
    db $ea, $1e, $de, $32, $f7, $f9, $0f, $0f, $f8, $f8, $bf, $c7, $7f, $71, $4f, $78
    db $27, $3c, $2f, $30, $5f, $77, $7f, $44, $bd, $c6, $ff, $83, $bf, $c0, $5f, $60
    db $3d, $3e, $3b, $27, $78, $47, $fb, $9f, $af, $dc, $5f, $60, $37, $38, $1f, $1f
    db $73, $7f, $bf, $c0, $bf, $d2, $7f, $7f, $00, $00, $ff, $ff, $be, $c1, $ff, $80
    db $f3, $0c, $ff, $04, $fb, $fc, $ff, $c8, $ff, $11, $ff, $e0, $ef, $10, $ef, $31
    db $ff, $20, $97, $f8, $6f, $ff, $db, $fc, $a7, $ff, $ff, $20, $bf, $60, $ff, $fe
    db $85, $86, $4b, $cc, $47, $c7, $80, $80, $fc, $fc, $fc, $04, $e8, $d8, $a8, $78
    db $d0, $30, $e8, $98, $f8, $f8, $78, $c8, $fc, $fc, $fa, $06, $fd, $ff, $af, $df
    db $fd, $ff, $f2, $3e, $cc, $fc, $ea, $1e, $f5, $fb, $af, $71, $b5, $7b, $4e, $ce
    db $fe, $fe, $fd, $03, $7d, $97, $fe, $fe, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $03, $03, $3c, $3f, $75, $4e, $7f, $42, $7f, $41, $5f, $61, $6f, $70
    db $5f, $78, $4f, $70, $27, $38, $23, $3c, $10, $1f, $0c, $0f, $57, $5f, $a9, $f9
    db $91, $f1, $89, $f9, $7b, $7a, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00
    db $7e, $7e, $bd, $c3, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $10, $ff, $00
    db $ff, $00, $ff, $01, $ff, $01, $ff, $00, $ff, $00, $1f, $e0, $81, $ff, $7e, $ff
    db $42, $c3, $a3, $62, $f7, $14, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $c0, $c0, $b0, $70, $e8, $18, $f4, $0c, $fc, $04, $fa, $0e, $ea, $76
    db $fa, $9e, $f6, $0e, $7d, $83, $ff, $ff, $c8, $38, $30, $f0, $c0, $c0, $80, $80
    db $80, $80, $40, $c0, $e0, $20, $f0, $f0, $04, $04, $0e, $0a, $0f, $0b, $1b, $16
    db $3f, $34, $7f, $54, $7f, $54, $75, $5e, $5a, $6f, $db, $ef, $fa, $af, $ed, $b7
    db $e7, $ba, $b7, $dc, $4f, $78, $2f, $38, $1f, $13, $1f, $10, $1f, $10, $3f, $20
    db $17, $18, $0d, $0e, $03, $03, $00, $00, $3e, $3e, $ff, $c1, $ff, $30, $ff, $21
    db $fe, $33, $fc, $37, $98, $6f, $f8, $0f, $ff, $07, $fe, $82, $7f, $c1, $ff, $e0
    db $9b, $7c, $e7, $1c, $f7, $0c, $f7, $0c, $7f, $88, $bf, $c0, $ff, $40, $df, $60
    db $cf, $70, $e0, $bf, $7f, $df, $f0, $f0, $00, $00, $80, $80, $e0, $60, $90, $f0
    db $68, $98, $f4, $cc, $1c, $e4, $0a, $f6, $c6, $fa, $36, $3a, $8a, $8e, $c4, $44
    db $e0, $20, $f0, $10, $f0, $10, $f8, $08, $f8, $08, $fc, $0c, $ee, $1a, $f6, $1a
    db $d5, $3f, $6e, $ee, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01
    db $00, $00, $02, $02, $86, $86, $ce, $ce, $fc, $fc, $d5, $fd, $6f, $7f, $37, $3e
    db $3f, $30, $38, $3f, $3f, $3f, $3f, $3f, $1f, $1f, $1f, $1f, $0f, $0f, $07, $07
    db $03, $03, $00, $00, $00, $00, $00, $00, $1c, $1c, $62, $62, $01, $01, $00, $00
    db $00, $00, $38, $38, $5c, $64, $be, $ca, $bf, $c3, $db, $e7, $67, $ff, $bf, $7f
    db $7f, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $ff, $fd, $ff, $fd, $ff, $f9, $ff, $f2
    db $9f, $e2, $cd, $ff, $3f, $3f, $00, $00, $98, $98, $a6, $a6, $41, $41, $80, $80
    db $80, $80, $86, $86, $8f, $89, $9f, $95, $ff, $f1, $7b, $9d, $be, $ce, $e6, $fe
    db $ff, $ff, $ff, $ff, $ff, $03, $ff, $25, $ff, $25, $ff, $25, $fe, $4a, $fe, $4a
    db $fc, $54, $98, $f8, $e0, $e0, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03
    db $04, $07, $03, $03, $04, $07, $08, $0f, $10, $1f, $12, $1f, $24, $3f, $24, $3f
    db $44, $7f, $42, $7f, $41, $7f, $40, $7f, $49, $7e, $4f, $7c, $27, $3f, $e0, $ff
    db $10, $1f, $4c, $4f, $3f, $33, $1f, $1f, $08, $08, $1c, $14, $ff, $e7, $18, $ff
    db $00, $ff, $c3, $fc, $03, $fc, $00, $ff, $73, $ff, $07, $fc, $cf, $38, $df, $32
    db $1f, $f2, $0f, $f8, $f7, $ff, $00, $ff, $83, $fc, $81, $ff, $00, $ff, $01, $ff
    db $00, $ff, $00, $ff, $ff, $ff, $00, $00, $40, $40, $e0, $a0, $f8, $98, $66, $fe
    db $01, $ff, $9e, $7e, $88, $78, $04, $fc, $dc, $fc, $e4, $3c, $f6, $1a, $fe, $4a
    db $fa, $4e, $f4, $1c, $e8, $f8, $04, $fc, $e2, $1e, $f2, $4e, $92, $ee, $42, $fe
    db $04, $fc, $19, $f9, $fe, $e6, $fc, $fc
