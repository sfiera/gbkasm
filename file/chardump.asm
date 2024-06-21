; Disassembly of "char-view.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db kFileMarkerCircle
    db CartridgeCodeUniversal  ; where file can run
    db Main - @ - 1            ; length of variable parts of header
    db $43                     ; owner code

Title::
    dk "CHAR-DUMP"

Main::
    db $31, $00, $e0, $af, $cf, $b3, $af, $21, $05, $cb, $22, $77, $ea, $04, $cb, $3e
    db $80, $21, $10, $01, $11, $05, $02, $01, $08, $10, $cf, $59, $d7, $06, $00, $d7
    db $4f, $00, $c9, $d7, $06, $00, $d7, $7f, $00, $c9, $cf, $b1, $cf, $d8, $21, $05
    db $cb, $4f, $cb, $59, $20, $60, $cb, $71, $20, $20, $cb, $79, $20, $26, $cb, $69
    db $20, $1c, $cb, $61, $20, $0e, $cb, $41, $20, $3a, $cb, $49, $20, $40, $cb, $51
    db $28, $d8, $cf, $01, $7e, $ee, $80, $77, $20, $0c, $23, $34, $18, $08, $7e, $ee
    db $80, $77, $28, $02, $23, $35, $d7, $06, $00, $d7, $05, $00, $c9, $18, $bb, $21
    db $02, $04, $cf, $b8, $21, $05, $cb, $5e, $23, $56, $21, $c4, $ca, $cf, $a4, $2b
    db $2b, $cf, $69, $c9, $3e, $80, $86, $22, $3e, $00, $8e, $77, $18, $08, $7e, $d6
    db $80, $22, $7e, $de, $00, $77, $d7, $06, $00, $d7, $d5, $ff, $c9, $d7, $06, $00
    db $d7, $05, $00, $c9, $18, $84, $21, $05, $cb, $fa, $05, $cb, $cb, $37, $4f, $06
    db $08, $11, $05, $00, $c5, $d7, $06, $00, $d7, $3b, $00, $c9, $1c, $0c, $05, $20
    db $f4, $c1, $11, $04, $02, $cb, $31, $06, $10, $d7, $06, $00, $d7, $27, $00, $c9
    db $14, $0c, $05, $20, $f4, $cf, $b5, $1e, $00, $21, $00, $88, $01, $00, $08, $cf
    db $a6, $21, $05, $cb, $5e, $23, $56, $01, $03, $80, $21, $00, $88, $cf, $1b, $3e
    db $03, $cf, $b4, $c9, $d5, $c5, $6b, $62, $cf, $b8, $79, $e6, $0f, $fe, $0a, $38
    db $02, $c6, $07, $c6, $30, $cf, $bb, $c1, $d1, $c9,

End::
