; Disassembly of "sram-get-and-clear.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db kFileMarkerCircle + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db Points - @ - 1          ; length of variable parts of header
    db $00                     ; owner code

Title::
    dk "SRAM GET&CLR"

Points::
    dw $0001
Author::
    dp "Y.MOTOSAKO", $02
    ds 11
    ds 11
    ds 11

Main::
    db $af, $cf, $b3, $d7, $06, $00, $d7, $3b, $02, $c9, $38, $0a, $b7, $28, $09, $3d
    db $20, $04, $d7, $1e, $01, $c9, $cf, $01, $d7, $37, $00, $e1, $cf, $69, $21, $0e
    db $00, $cf, $b8, $d7, $db, $00, $e1, $cf, $69, $21, $0f, $01, $16, $20, $1e, $3e
    db $01, $01, $02, $cf, $5e, $38, $17, $b7, $20, $14, $21, $10, $00, $cf, $b8, $d7
    db $06, $00, $d7, $8a, $02, $c9, $cf, $69, $cf, $db, $3e, $78, $cf, $dc, $cf, $01
    db $0c, $20, $20, $0e, $ca, $de, $af, $b8, $b1, $af, $cc, $df, $c3, $de, $b0, $c0
    db $0f, $c9, $20, $0e, $ba, $cb, $df, $b0, $0d, $0d, $0d, $0f, $b1, $b2, $c3, $c9
    db $0e, $b9, $de, $b0, $d1, $ce, $de, $b0, $b2, $0f, $ca, $20, $47, $42, $20, $4b
    db $49, $53, $53, $20, $0d, $0e, $d2, $c6, $ad, $b0, $0f, $c3, $de, $20, $53, $54
    db $41, $52, $54, $0e, $ce, $de, $c0, $dd, $0f, $a6, $20, $b5, $bc, $c3, $20, $0d
    db $c2, $b3, $bc, $dd, $bc, $de, $ad, $dd, $cb, $de, $c1, $ad, $b3, $20, $c6, $bc
    db $c3, $b8, $c0, $de, $bb, $b2, $a1, $0d, $0d, $bc, $de, $cc, $de, $dd, $c9, $20
    db $0e, $ca, $de, $af, $b8, $b1, $af, $cc, $df, $c3, $de, $b0, $c0, $0f, $ca, $20
    db $b3, $dc, $b6, $de, $b7, $0d, $bb, $da, $c3, $20, $b7, $b4, $c3, $bc, $cf, $b2
    db $cf, $bd, $0e, $00, $00, $0e, $ca, $de, $af, $b8, $b1, $af, $cc, $df, $c3, $de
    db $b0, $c0, $0f, $a6, $20, $bd, $cd, $de, $c3, $20, $b9, $bc, $cf, $bd, $20, $0f
    db $20, $20, $20, $20, $20, $20, $d6, $db, $bc, $b2, $c3, $de, $bd, $b6, $3f, $20
    db $20, $20, $20, $20, $20, $20, $20, $ca, $b2, $0d, $20, $20, $b2, $b2, $b4, $0e
    db $00, $0f, $20, $20, $bd, $cd, $de, $c3, $20, $b9, $bc, $cf, $bc, $c0, $21, $0e
    db $00, $21, $0e, $00, $cf, $b8, $d7, $ae, $ff, $e1, $cf, $69, $21, $10, $01, $16
    db $20, $1e, $3e, $01, $01, $02, $cf, $5e, $38, $19, $b7, $20, $16, $d7, $06, $00
    db $d7, $13, $02, $c9, $21, $11, $00, $cf, $b8, $d7, $c7, $ff, $e1, $cf, $69, $3e
    db $78, $cf, $dc, $cf, $01, $20, $20, $20, $20, $53, $52, $41, $4d, $20, $47, $45
    db $54, $26, $43, $4c, $52, $0d, $0d, $0f, $ba, $c9, $0e, $cc, $df, $db, $b8, $de
    db $d7, $d1, $0f, $ca, $20, $b1, $b2, $c3, $c9, $0e, $b9, $de, $b0, $d1, $ce, $de
    db $b0, $b2, $0f, $c9, $0d, $0e, $ca, $de, $af, $b8, $b1, $af, $cc, $df, $c3, $de
    db $b0, $c0, $0f, $a6, $bc, $de, $cc, $de, $dd, $c9, $0e, $b9, $de, $b0, $d1, $ce
    db $de, $b0, $b2, $0d, $0f, $c6, $0e, $ba, $cb, $df, $b0, $0f, $bc, $c0, $d8, $a4
    db $bc, $de, $cc, $de, $dd, $c9, $0e, $b9, $de, $b0, $d1, $ce, $de, $b0, $b2, $0f
    db $c9, $20, $0d, $0e, $ca, $de, $af, $b8, $b1, $af, $cc, $df, $c3, $de, $b0, $c0
    db $0f, $a6, $20, $bd, $cd, $de, $c3, $20, $b9, $bd, $c0, $d2, $c9, $0d, $d3, $c9
    db $c3, $de, $bd, $a1, $b1, $c2, $b6, $b2, $c6, $ca, $20, $bc, $de, $ad, $b3, $cc
    db $de, $dd, $20, $b7, $a6, $0d, $c2, $b9, $c3, $b8, $c0, $de, $bb, $b2, $a1, $0d
    db $0d, $20, $20, $0e, $ca, $de, $af, $b8, $b1, $af, $cc, $df, $c3, $de, $b0, $c0
    db $0f, $c9, $20, $0e, $ba, $cb, $df, $b0, $0d, $20, $20, $0e, $ca, $de, $af, $b8
    db $b1, $af, $cc, $df, $c3, $de, $b0, $c0, $0f, $c9, $20, $bc, $ae, $b3, $b7, $ae
    db $0e, $00, $d7, $22, $ff, $e1, $cf, $69, $21, $0e, $01, $16, $20, $1e, $3e, $01
    db $00, $02, $cf, $5e, $c9, $47, $42, $20, $4b, $49, $53, $53, $20, $4d, $45, $4e
    db $55, $20, $0f, $20, $20, $bd, $cd, $de, $c3, $20, $bc, $de, $ad, $bc, $dd, $bc
    db $cf, $bc, $c0, $21, $0e, $00, $0f, $bc, $de, $ad, $bc, $dd, $0e, $b4, $d7, $b0
    db $0f, $b6, $de, $ca, $af, $be, $b2, $bc, $cf, $bc, $c0, $21, $0e, $00, $0f, $b1
    db $b2, $c3, $c9, $20, $bc, $de, $ae, $b3, $c0, $b2, $b6, $de, $20, $b2, $bc, $de
    db $ae, $b3, $c3, $de, $bd, $0e, $00, $0f, $b5, $c5, $bc, $de, $0e, $b6, $b0, $c4
    db $d8, $af, $bc, $de, $0f, $c3, $de, $ca, $b1, $d8, $cf, $be, $dd, $0e, $00, $cf
    db $73, $d7, $cc, $ff, $e1, $c9, $cf, $73, $d7, $de, $ff, $e1, $c9, $21, $00, $ce
    db $11, $00, $c7, $0e, $10, $cf, $7c, $38, $61, $d7, $7b, $ff, $e1, $11, $02, $c7
    db $01, $0d, $00, $cf, $67, $7c, $b5, $20, $d6, $21, $14, $00, $11, $00, $c7, $0e
    db $04, $cf, $7c, $38, $45, $21, $14, $00, $11, $00, $c7, $01, $04, $00, $cf, $67
    db $7c, $b5, $20, $c2, $3e, $01, $ea, $00, $c7, $11, $00, $ce, $21, $00, $c7, $0e
    db $01, $cf, $7f, $38, $25, $cf, $73, $d7, $06, $00, $d7, $b2, $00, $c9, $79, $b8
    db $38, $1d, $3e, $02, $ea, $00, $c7, $11, $00, $ce, $21, $00, $c7, $0e, $01, $cf
    db $7f, $38, $07, $cf, $73, $d7, $2c, $ff, $e1, $c9, $d7, $3b, $ff, $e1, $c9, $c5
    db $e5, $d7, $06, $00, $d7, $71, $00, $c9, $e1, $c1, $38, $ee, $c5, $e5, $d7, $06
    db $00, $d7, $45, $00, $c9, $e1, $c1, $2e, $00, $24, $7c, $fe, $20, $38, $e0, $26
    db $00, $0c, $18, $ba, $21, $00, $c6, $11, $93, $41, $06, $80, $72, $23, $73, $23
    db $05, $20, $f9, $d7, $06, $00, $d7, $56, $00, $c9, $79, $b8, $38, $01, $c9, $c5
    db $e5, $d7, $06, $00, $d7, $12, $00, $c9, $e1, $c1, $2e, $00, $24, $7c, $fe, $20
    db $38, $ed, $26, $00, $0c, $18, $e3, $79, $e6, $fc, $e0, $97, $79, $0f, $0f, $0f
    db $e6, $60, $b4, $57, $5d, $21, $00, $c6, $6b, $01, $00, $01, $79, $93, $4f, $78
    db $de, $00, $47, $cf, $e5, $c9, $79, $0f, $0f, $0f, $47, $e6, $e0, $b4, $67, $11
    db $00, $c6, $5d, $78, $e6, $1f, $47, $af, $95, $4f, $cf, $7b, $c9, $21, $15, $00
    db $4e, $23, $5e, $23, $56, $7a, $e6, $1f, $57, $21, $80, $00, $19, $7c, $fe, $20
    db $38, $03, $0c, $26, $00, $06, $04, $fa, $49, $01, $fe, $03, $c8, $06, $10, $d0
    db $06, $00, $c9

End:
