; Disassembly of "gbkiss.gb"

INCLUDE "charmap.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    ; Length of entirety of file
    dw End
    ; Flags for display in menu
    db kFileHasIcon2bpp + kFileMarkerCircle + kFileHasTransfers
    ; Must be $00 for normal files (other than Kiss Mail)
    db $00
    ; Length of variable parts of header
    db Points - @ - 1
    ; File owner code
    db $70

Title::
    db "ﾊﾞｹ«ﾁｭ»ﾘﾚｰ"
Icon::
    INCBIN "gfx/icon/bakechu-relay.2bpp"

Points::
    dw 1
Author::
    db "TOBI      ", 2
History::
    ds 11
    ds 11
    ds 11

Main::
    db $cf, $11, $21, $bc, $04, $cf, $cb, $31, $00, $e0, $af, $cf, $b3, $cf, $b5, $d7
    db $6c, $02, $e1, $cf, $5c, $3e, $03, $cf, $b4, $af, $ea, $c6, $cc, $d7, $15, $00
    db $d1, $cf, $5f, $38, $e2, $fe, $00, $28, $11, $fe, $01, $28, $41, $fe, $0f, $38
    db $10, $cf, $01, $10, $05, $02, $3e, $20, $00, $00, $3e, $01, $ea, $c6, $cc, $3e
    db $02, $3c, $ea, $d2, $cc, $af, $21, $d5, $cc, $22, $22, $22, $3e, $01, $ea, $d3
    db $cc, $af, $ea, $c5, $cc, $d7, $06, $00, $d7, $b5, $02, $c9, $d7, $06, $00, $d7
    db $92, $00, $c9, $30, $ec, $cf, $b1, $cf, $d8, $b7, $28, $f9, $18, $e3, $3e, $20
    db $cf, $b3, $d7, $06, $00, $d7, $64, $07, $c9, $3e, $50, $ea, $c8, $cc, $d7, $06
    db $00, $d7, $ad, $03, $c9, $3e, $08, $e0, $a0, $3e, $18, $e0, $9f, $3e, $63, $cf
    db $b4, $3e, $14, $ea, $96, $cc, $d7, $cd, $00, $e1, $cf, $5c, $cf, $c3, $21, $c1
    db $cc, $36, $42, $23, $36, $4b, $cf, $72, $3e, $00, $21, $c1, $cc, $22, $22, $30
    db $0a, $21, $96, $cc, $35, $20, $e7, $d7, $4f, $ff, $c9, $21, $d3, $cc, $34, $3e
    db $01, $ea, $c5, $cc, $d7, $06, $00, $d7, $3c, $05, $c9, $d7, $06, $00, $d7, $3f
    db $02, $c9, $fa, $c4, $cc, $fe, $01, $28, $0c, $d7, $02, $01, $e1, $cf, $5c, $3e
    db $b4, $cf, $dc, $18, $b1, $d7, $06, $00, $d7, $09, $00, $c9, $af, $ea, $c5, $cc
    db $18, $d9, $d7, $4b, $00, $e1, $cf, $5c, $cf, $c3, $3e, $78, $cf, $dc, $3e, $03
    db $ea, $96, $cc, $21, $c1, $cc, $11, $00, $c6, $0e, $02, $cf, $7c, $38, $1f, $21
    db $00, $c6, $2a, $fe, $42, $20, $17, $2a, $fe, $4b, $20, $12, $21, $d2, $cc, $11
    db $d2, $cc, $0e, $05, $cf, $7f, $38, $06, $cf, $73, $38, $02, $b7, $c9, $cf, $b1
    db $f0, $8a, $e6, $02, $20, $f8, $21, $96, $cc, $35, $20, $c7, $37, $c9, $05, $25
    db $0f, $20, $20, $20, $20, $20, $20, $20, $20, $20, $00, $05, $26, $20, $bf, $b3
    db $bc, $dd, $c1, $ad, $b3, $20, $00, $05, $27, $20, $20, $20, $20, $20, $20, $20
    db $20, $20, $00, $ff, $03, $25, $0f, $20, $20, $20, $20, $20, $20, $20, $20, $20
    db $20, $20, $20, $20, $20, $00, $03, $26, $20, $bc, $de, $ad, $bc, $dd, $20, $c0
    db $b2, $b7, $c1, $ad, $b3, $20, $20, $00, $03, $27, $20, $20, $20, $20, $20, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $00, $ff, $05, $22, $20, $20, $20, $20
    db $20, $20, $20, $20, $20, $20, $00, $05, $23, $20, $46, $49, $4e, $49, $53, $48
    db $21, $21, $20, $00, $05, $24, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
    db $00, $05, $25, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $00, $05, $27
    db $4d, $45, $4e, $55, $3a, $53, $45, $4c, $2b, $42, $00, $ff, $02, $25, $0f, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $00
    db $02, $26, $20, $bc, $af, $ca, $df, $b2, $bc, $cf, $bc, $c0, $2c, $b1, $d7, $c0
    db $d2, $c3, $20, $00, $02, $27, $20, $b5, $b8, $af, $c3, $d3, $d7, $af, $c3, $20
    db $b8, $c0, $de, $bb, $b2, $20, $20, $00, $02, $28, $20, $20, $20, $20, $20, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $00, $ff, $02, $25, $0f, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $00
    db $02, $26, $20, $b3, $b9, $c4, $d8, $cf, $bc, $c0, $20, $20, $20, $20, $20, $20
    db $20, $20, $00, $02, $27, $20, $c2, $b7, $de, $c9, $cb, $c4, $c6, $dc, $c0, $bc
    db $c3, $b8, $c0, $de, $bb, $b2, $20, $00, $02, $28, $20, $20, $20, $20, $20, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $00, $ff, $05, $00, $0e, $ca
    db $de, $b9, $0f, $c1, $ad, $0e, $d8, $da, $b0, $00, $06, $02, $0f, $da, $dd, $bc
    db $ad, $b3, $00, $06, $03, $d3, $d7, $b3, $00, $06, $04, $dc, $c0, $bd, $2d, $33
    db $00, $06, $05, $dc, $c0, $bd, $2d, $34, $00, $06, $06, $dc, $c0, $bd, $2d, $35
    db $00, $06, $07, $dc, $c0, $bd, $2d, $36, $00, $06, $08, $dc, $c0, $bd, $2d, $37
    db $00, $06, $09, $dc, $c0, $bd, $2d, $38, $00, $06, $0a, $dc, $c0, $bd, $2d, $39
    db $00, $06, $0b, $dc, $c0, $bd, $2d, $31, $30, $00, $06, $0c, $dc, $c0, $bd, $2d
    db $31, $31, $00, $06, $0d, $dc, $c0, $bd, $2d, $31, $32, $00, $06, $0e, $dc, $c0
    db $bd, $2d, $31, $33, $00, $06, $0f, $dc, $c0, $bd, $2d, $31, $34, $00, $06, $10
    db $dc, $c0, $bd, $2d, $31, $35, $00, $06, $11, $45, $4e, $44, $00, $ff, $af, $cf
    db $b3, $cf, $b5, $d7, $06, $00, $d7, $c3, $04, $c9, $af, $e0, $9b, $e0, $9a, $3e
    db $08, $e0, $a0, $3e, $18, $e0, $9f, $3e, $63, $cf, $b4, $af, $ea, $65, $cc, $3e
    db $50, $ea, $c8, $cc, $af, $ea, $c7, $cc, $ea, $c9, $cc, $3e, $ff, $ea, $ca, $cc
    db $21, $cd, $cc, $36, $08, $23, $36, $00, $d7, $06, $00, $d7, $c2, $02, $c9, $af
    db $e0, $83, $af, $ea, $c4, $cc, $ea, $cc, $cc, $cf, $b1, $d7, $06, $00, $d7, $e8
    db $03, $c9, $cf, $d8, $e6, $04, $20, $63, $01, $00, $28, $cf, $c4, $d7, $06, $00
    db $d7, $fc, $02, $c9, $d7, $06, $00, $d7, $a7, $02, $c9, $d7, $06, $00, $d7, $e5
    db $02, $c9, $d7, $06, $00, $d7, $05, $02, $c9, $d7, $06, $00, $d7, $b1, $00, $c9
    db $d7, $06, $00, $d7, $62, $00, $c9, $d7, $06, $00, $d7, $94, $00, $c9, $d7, $06
    db $00, $d7, $c1, $03, $c9, $fa, $c4, $cc, $b7, $28, $ae, $fe, $02, $28, $0a, $fa
    db $d2, $cc, $47, $fa, $d3, $cc, $b8, $30, $16, $fa, $c6, $cc, $b7, $c8, $fa, $c4
    db $cc, $fe, $02, $28, $8d, $21, $d3, $cc, $34, $18, $87, $d7, $3b, $fc, $c9, $d7
    db $ca, $fd, $e1, $cf, $5c, $21, $24, $07, $cf, $b8, $21, $4c, $cc, $cf, $69, $3e
    db $1e, $d7, $06, $00, $d7, $33, $04, $c9, $cf, $b1, $cf, $d8, $f0, $8a, $e6, $06
    db $fe, $06, $20, $f4, $18, $d5, $21, $c7, $cc, $f0, $8a, $47, $21, $c8, $cc, $7e
    db $cb, $40, $28, $04, $0e, $00, $18, $1b, $cb, $68, $28, $0a, $0e, $20, $3d, $fe
    db $08, $30, $0f, $3c, $18, $0c, $cb, $60, $28, $11, $0e, $10, $3c, $fe, $90, $38
    db $01, $3d, $77, $2b, $7e, $3c, $e6, $0f, $b1, $77, $c9, $2b, $36, $00, $c9, $21
    db $c7, $cc, $2a, $cb, $3f, $cb, $3f, $c6, $04, $56, $1e, $78, $18, $0f, $fa, $c9
    db $cc, $cb, $3f, $cb, $3f, $cb, $3f, $21, $ca, $cc, $56, $23, $5e, $6f, $26, $00
    db $29, $d7, $0e, $00, $c1, $09, $4e, $23, $46, $2b, $09, $3e, $ff, $cf, $60, $c9
    db $20, $00, $23, $00, $32, $00, $41, $00, $50, $00, $4e, $00, $4c, $00, $4a, $00
    db $6d, $00, $88, $00, $69, $00, $a1, $00, $bc, $00, $d7, $00, $b8, $00, $f0, $00
    db $01, $00, $00, $1e, $00, $04, $fc, $fc, $1f, $00, $04, $fc, $20, $00, $fc, $04
    db $21, $00, $04, $04, $22, $00, $04, $fc, $fc, $23, $00, $04, $fc, $24, $00, $fc
    db $04, $25, $00, $04, $04, $26, $00, $04, $fc, $fc, $27, $00, $04, $fc, $28, $00
    db $fc, $04, $29, $00, $04, $04, $2a, $00, $09, $00, $00, $00, $00, $08, $00, $01
    db $00, $10, $00, $02, $00, $00, $08, $03, $00, $08, $08, $04, $00, $10, $08, $05
    db $00, $00, $10, $06, $00, $08, $10, $07, $00, $10, $10, $08, $00, $07, $00, $00
    db $09, $00, $08, $00, $0a, $00, $10, $00, $0b, $00, $08, $08, $0c, $00, $10, $08
    db $0d, $00, $08, $10, $0e, $00, $10, $10, $0f, $00, $07, $00, $00, $10, $00, $08
    db $00, $11, $00, $10, $00, $12, $00, $08, $08, $13, $00, $10, $08, $14, $00, $08
    db $10, $15, $00, $10, $10, $16, $00, $07, $00, $00, $17, $00, $08, $00, $18, $00
    db $10, $00, $19, $00, $08, $08, $1a, $00, $10, $08, $1b, $00, $08, $10, $1c, $00
    db $10, $10, $1d, $00, $07, $08, $00, $0e, $20, $10, $00, $0f, $20, $08, $08, $0c
    db $20, $10, $08, $0d, $20, $00, $10, $09, $20, $08, $10, $0a, $20, $10, $10, $0b
    db $20, $07, $08, $00, $15, $20, $10, $00, $16, $20, $08, $08, $13, $20, $10, $08
    db $14, $20, $00, $10, $10, $20, $08, $10, $11, $20, $10, $10, $12, $20, $07, $08
    db $00, $1c, $20, $10, $00, $1d, $20, $08, $08, $1a, $20, $10, $08, $1b, $20, $00
    db $10, $17, $20, $08, $10, $18, $20, $10, $10, $19, $20, $21, $c9, $cc, $7e, $b7
    db $28, $19, $34, $7e, $fe, $17, $d8, $36, $00, $23, $36, $ff, $fa, $c5, $cc, $b7
    db $c8, $fa, $c3, $cc, $ea, $c4, $cc, $d7, $5c, $00, $c9, $fa, $c5, $cc, $b7, $20
    db $24, $21, $ca, $cc, $2a, $fe, $ff, $28, $02, $35, $c9, $f0, $8b, $e6, $01, $c8
    db $3e, $25, $d7, $06, $00, $d7, $52, $02, $c9, $fa, $c8, $cc, $c6, $08, $21, $ca
    db $cc, $22, $36, $74, $c9, $21, $ca, $cc, $2a, $fe, $ff, $28, $10, $34, $7e, $fe
    db $88, $d8, $3e, $01, $ea, $c9, $cc, $3e, $0f, $d7, $2e, $02, $c9, $fa, $cd, $cc
    db $c6, $08, $47, $fa, $d1, $cc, $b8, $c0, $21, $ca, $cc, $22, $36, $18, $3e, $07
    db $d7, $17, $02, $c9, $cf, $8e, $e6, $7f, $c6, $10, $ea, $d1, $cc, $c9, $cf, $8e
    db $e6, $3f, $ea, $d0, $cc, $cf, $8e, $e6, $07, $c6, $0a, $ea, $cf, $cc, $c9, $21
    db $cc, $cc, $7e, $b7, $28, $07, $fa, $c3, $cc, $ea, $c4, $cc, $c9, $21, $d0, $cc
    db $fa, $cf, $cc, $86, $77, $30, $00, $21, $cd, $cc, $56, $23, $5e, $fa, $cf, $cc
    db $6f, $26, $00, $29, $29, $29, $29, $19, $5d, $54, $7a, $fe, $f0, $30, $0e, $fe
    db $a8, $38, $0a, $d7, $06, $00, $d7, $b7, $ff, $c9, $11, $00, $f0, $21, $cd, $cc
    db $72, $23, $73, $c9, $21, $cd, $cc, $3e, $b0, $96, $e0, $9b, $c9, $fa, $c9, $cc
    db $b7, $c0, $fa, $c5, $cc, $b7, $20, $50, $21, $ca, $cc, $2a, $fe, $ff, $28, $20
    db $57, $7e, $fe, $21, $30, $1a, $fa, $cd, $cc, $d6, $02, $5f, $7a, $93, $fe, $15
    db $38, $10, $3e, $01, $ea, $c9, $cc, $3e, $0f, $d7, $06, $00, $d7, $7b, $01, $c9
    db $b7, $c9, $3e, $ff, $ea, $ca, $cc, $21, $65, $cc, $34, $3e, $01, $ea, $c5, $cc
    db $ea, $c3, $cc, $ea, $cc, $cc, $d7, $06, $00, $d7, $4a, $ff, $c9, $3e, $04, $d7
    db $06, $00, $d7, $55, $01, $c9, $37, $c9, $21, $ca, $cc, $2a, $fe, $ff, $28, $56
    db $3a, $fe, $74, $20, $51, $fa, $c8, $cc, $d6, $02, $47, $7e, $90, $fe, $15, $30
    db $40, $36, $ff, $21, $65, $cc, $34, $d7, $06, $00, $d7, $19, $ff, $c9, $af, $ea
    db $c5, $cc, $3e, $20, $d7, $06, $00, $d7, $20, $01, $c9, $fa, $c6, $cc, $b7, $20
    db $1e, $d7, $06, $00, $d7, $2a, $fd, $c9, $d7, $23, $fb, $e1, $cf, $5c, $3e, $78
    db $cf, $dc, $cf, $b5, $d7, $06, $00, $d7, $c2, $00, $c9, $3e, $63, $cf, $b4, $37
    db $c9, $3e, $02, $ea, $c3, $cc, $b7, $c9, $d7, $16, $00, $e1, $cf, $5c, $fa, $65
    db $cc, $5f, $16, $00, $21, $40, $cc, $cf, $a3, $21, $43, $cc, $cf, $69, $c9, $03
    db $0a, $48, $49, $54, $3d, $00, $ff, $f0, $83, $d6, $06, $d8, $e0, $83, $21, $d4
    db $cc, $34, $7e, $fe, $0a, $d8, $36, $00, $23, $34, $7e, $fe, $3c, $d8, $36, $00
    db $23, $34, $c9, $21, $40, $cc, $d7, $4f, $00, $d1, $d7, $06, $00, $d7, $65, $00
    db $c9, $fa, $d3, $cc, $d7, $06, $00, $d7, $4a, $00, $c9, $d7, $3f, $00, $d1, $d7
    db $06, $00, $d7, $50, $00, $c9, $fa, $d6, $cc, $d7, $06, $00, $d7, $35, $00, $c9
    db $36, $3a, $23, $fa, $d5, $cc, $d7, $06, $00, $d7, $28, $00, $c9, $36, $2e, $23
    db $fa, $d4, $cc, $c6, $30, $22, $36, $00, $11, $2e, $01, $cf, $57, $11, $40, $cc
    db $01, $13, $00, $cf, $02, $c9, $4d, $41, $4e, $3a, $00, $20, $54, $49, $4d, $45
    db $20, $00, $0e, $2f, $0c, $d6, $0a, $30, $fb, $c6, $0a, $47, $71, $23, $78, $c6
    db $30, $22, $c9, $1a, $13, $b7, $c8, $22, $18, $f9, $06, $c6, $d7, $4d, $00, $d1
    db $cf, $62, $11, $00, $8b, $01, $90, $01, $cf, $63, $11, $00, $80, $01, $b0, $02
    db $cf, $63, $11, $00, $98, $0e, $03, $d7, $06, $00, $d7, $08, $00, $c9, $0e, $0f
    db $11, $00, $9c, $c5, $01, $20, $00, $cf, $63, $06, $20, $1a, $c6, $b0, $12, $13
    db $05, $20, $f8, $c1, $0d, $20, $ec, $c9, $f5, $fa, $14, $00, $fe, $01, $28, $06
    db $fe, $fe, $28, $02, $f1, $c9, $f1, $cf, $14, $c9, $7f, $de, $e0, $18, $81, $00
    db $42, $00, $24, $81, $43, $ff, $18, $03, $00, $01, $06, $13, $00, $00, $ff, $39
    db $de, $10, $16, $ff, $55, $ff, $1e, $02, $19, $aa, $f3, $ff, $2a, $80, $00, $28
    db $23, $1f, $ae, $00, $be, $55, $de, $2f, $ff, $2f, $80, $55, $80, $27, $3b, $38
    db $e5, $20, $aa, $00, $05, $4e, $32, $ea, $15, $73, $20, $5f, $00, $25, $18, $10
    db $16, $5d, $00, $3f, $67, $fd, $78, $5e, $87, $23, $41, $77, $63, $fe, $9f, $3f
    db $9f, $0f, $1f, $1f, $7f, $aa, $00, $74, $1e, $bf, $3f, $7f, $b2, $11, $ff, $ad
    db $b8, $54, $06, $21, $4b, $ff, $44, $d1, $f3, $82, $58, $81, $b8, $7f, $03, $09
    db $bb, $af, $8b, $84, $ff, $31, $42, $31, $3a, $a3, $ff, $9c, $5e, $f0, $d4, $f1
    db $e9, $fb, $f2, $ff, $fe, $fc, $fc, $fa, $f8, $fd, $fe, $fd, $f1, $fc, $fe, $ff
    db $fe, $72, $ba, $63, $7f, $01, $e0, $01, $03, $02, $87, $00, $88, $85, $06, $7f
    db $8d, $40, $3b, $85, $88, $10, $03, $04, $07, $a3, $1c, $1f, $f7, $12, $1f, $0f
    db $0f, $7f, $40, $1c, $1c, $eb, $ff, $f7, $f6, $3f, $2a, $f7, $08, $f7, $dd, $fb
    db $e3, $5d, $63, $79, $47, $bd, $7f, $80, $ff, $7f, $b0, $bc, $eb, $be, $d5, $7f
    db $94, $ff, $7b, $ac, $bf, $68, $ff, $50, $eb, $b4, $fb, $e0, $bf, $d0, $ff, $ad
    db $7c, $70, $c0, $c0, $fc, $e0, $20, $60, $a0, $20, $e0, $ec, $4e, $20, $f1, $80
    db $80, $40, $c0, $f5, $f3, $02, $f3, $a0, $bf, $60, $eb, $00, $90, $70, $10, $f0
    db $1c, $fc, $f3, $a4, $fc, $f8, $f8, $f3, $4e, $00, $06, $06, $ee, $0a, $0e, $0e
    db $13, $0a, $1c, $14, $19, $00, $ff, $38, $28, $70, $50, $b0, $d0, $e7, $a7, $ff
    db $b9, $fe, $57, $78, $6e, $71, $6f, $70, $ff, $41, $7e, $43, $7c, $2f, $38, $18
    db $17, $f1, $2f, $3f, $27, $3f, $b3, $7f, $42, $e3, $b1, $ff, $71, $ef, $1f, $b9
    db $c7, $8e, $71, $df, $ff, $20, $8f, $70, $2f, $f0, $46, $f9, $80, $e3, $ff, $03
    db $ff, $6a, $06, $3b, $ec, $06, $70, $90, $ff, $30, $d0, $98, $f8, $54, $bc, $7b
    db $8f, $ff, $bd, $43, $86, $7e, $68, $b8, $b8, $d8, $d9, $e4, $fc, $39, $18, $18
    db $1a, $00, $15, $07, $9b, $05, $87, $02, $17, $34, $2c, $1d, $00, $6f, $5f, $3d
    db $27, $2b, $00, $5e, $61, $5f, $60, $2f, $2b, $ef, $3c, $36, $39, $c1, $00, $df
    db $bf, $a3, $e3, $1b, $e5, $3b, $60, $f3, $71, $f1, $47, $0a, $fd, $03, $ff, $3f
    db $c0, $1f, $e0, $5f, $e0, $4d, $f2, $cf, $98, $e7, $57, $3f, $00, $f0, $f0, $e8
    db $98, $bf, $98, $d5, $f8, $2c, $dc, $36, $ce, $82, $ff, $7e, $e4, $3c, $78, $98
    db $c6, $fe, $39, $ef, $3f, $07, $07, $5c, $42, $02, $02, $01, $03, $7f, $87, $1e
    db $1a, $3c, $24, $78, $58, $e0, $bd, $a0, $ff, $00, $73, $53, $5d, $6e, $9f, $76
    db $fe, $79, $5f, $70, $6f, $50, $4b, $74, $2d, $00, $fc, $e4, $ff, $f9, $ff, $08
    db $0f, $18, $3b, $66, $ff, $e3, $e3, $db, $3a, $76, $8f, $fb, $c7, $ff, $9c, $63
    db $cf, $30, $de, $21, $1f, $e1, $ff, $c9, $f6, $92, $ff, $6f, $ff, $fe, $fe, $37
    db $ab, $a9, $00, $b0, $70, $73, $18, $f8, $bc, $ff, $74, $d6, $3e, $fe, $02, $24
    db $dc, $be, $f8, $fe, $ff, $ff, $20, $e0, $58, $02, $af, $79, $00, $f6, $3e, $22
    db $7f, $41, $a3, $71, $4f, $67, $00, $cd, $22, $3e, $5f, $af, $20, $06, $06, $89
    db $06, $ff, $05, $66, $65, $f9, $9e, $bf, $c0, $7b, $ff, $7c, $0b, $0c, $1d, $13
    db $1a, $16, $34, $fb, $2c, $24, $3c, $18, $18, $3c, $40, $10, $10, $bf, $78, $47
    db $c8, $70, $90, $e0, $20, $a0, $ff, $60, $90, $70, $e8, $18, $3c, $c4, $cc, $e9
    db $f4, $38, $38, $3c, $45, $01, $af, $5b, $24, $60, $f8, $60, $f8, $98, $7c, $64
    db $6d, $8b, $00, $95, $af, $f0, $9a, $00, $e0, $43, $c0, $40, $c6, $46, $f3, $ce
    db $48, $9e, $96, $8b, $60, $5b, $08, $08, $fc, $1c, $14, $1e, $12, $0c, $0c, $a9
    db $64, $8f, $d8, $80, $80, $5b, $02, $40, $40, $5b, $f9, $20, $5b, $cc, $20, $20
    db $93, $02, $fd, $02, $02, $91, $26, $3b, $60, $3b, $64, $04, $04, $b5, $af, $6f
    db $36, $47, $f9, $53, $e1, $0b, $11, $17, $af, $60, $11, $70, $f0, $11, $0c, $de
    db $12, $18, $73, $6f, $03, $07, $0d, $13, $8f, $79, $9c, $9f, $04, $08, $0e, $14
    db $af, $bc, $9f, $05, $e7, $09, $0f, $15, $cf, $dc, $9f, $06, $0a, $10, $80, $16
    db $ef, $fc, $9f, $bb, $c0, $ff, $dd, $e2, $ff, $4f, $01, $04, $ff, $71, $26, $ff
    db $93, $48, $ff, $b5, $be, $3f, $00, $00, $cf, $e0, $ff, $f1, $02, $ff, $13, $24
    db $ff, $35, $46, $ff, $00, $57, $68, $40

End: