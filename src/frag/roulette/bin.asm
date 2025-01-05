SECTION "Fragment", ROM0[$0]

Sprites:
    INCBIN "gfx/roulette/sprites.2bpp"

Tiles:
    INCBIN "gfx/roulette/wheel.2bpp",0,$790
    INCBIN "gfx/roulette/diamonds.2bpp"

Tilemap:
    db $80, $80, $80, $8e, $94, $9a, $a1, $a8, $af, $b6, $bd, $c4, $cb, $d2, $d8, $df, $e6, $80, $80, $80
    db $80, $84, $89, $8f, $95, $9b, $a2, $a9, $b0, $b7, $be, $c5, $cc, $d3, $d9, $e0, $e7, $ec, $f1, $80
    db $81, $85, $8a, $90, $96, $9c, $a3, $aa, $b1, $b8, $bf, $c6, $cd, $d4, $da, $e1, $e8, $ed, $f2, $f6
    db $82, $86, $8b, $b7, $b7, $9d, $a4, $ab, $b2, $b9, $c0, $c7, $ce, $a4, $db, $e2, $e2, $ee, $f3, $f7
    db $83, $87, $8c, $91, $97, $9e, $a5, $ac, $b3, $ba, $c1, $c8, $cf, $d5, $dc, $e3, $e9, $ef, $f4, $f8
    db $80, $88, $8d, $92, $98, $9f, $a6, $ad, $b4, $bb, $c2, $c9, $d0, $d6, $dd, $e4, $ea, $f0, $f5, $80
    db $80, $80, $80, $93, $99, $a0, $a7, $ae, $b5, $bc, $c3, $ca, $d1, $d7, $de, $e5, $eb, $80, $80, $80
    db $00

Data:
    db $80, $00, $80, $00, $80, $07, $00, $07, $00, $3f, $00, $38, $00, $38, $00, $f8
    db $01, $c0, $01, $c0, $01, $c0, $0f, $00, $0e, $00, $0e, $00, $80, $00, $80, $00
    db $00, $49, $02, $01, $00, $01, $00, $09, $00, $08, $00, $08, $00, $48, $00, $40
    db $00, $40, $00, $40, $02, $00, $02, $00, $02, $49, $02, $00, $80, $00, $00, $00
    db $80, $03, $00, $03, $00, $1b, $00, $18, $00, $18, $00, $d8, $00, $c0, $00, $c0
    db $00, $c0, $06, $00, $06, $00, $06, $00, $80, $00, $80, $00, $00, $92, $04, $02
    db $00, $02, $00, $12, $00, $10, $00, $10, $00, $90, $00, $80, $00, $80, $00, $80
    db $04, $00, $04, $00, $04, $92, $04, $00, $80, $00, $00, $00, $80, $06, $00, $06
    db $00, $36, $00, $30, $00, $30, $00, $b0, $01, $80, $01, $80, $01, $80, $0d, $00
    db $0c, $00, $0c, $00, $80, $00, $80, $00, $00, $24, $09, $04, $00, $04, $00, $24
    db $00, $20, $00, $20, $00, $20, $01, $00, $01, $00, $01, $00, $09, $00, $08, $00
    db $08, $24, $09, $00, $80, $00, $80, $00, $80, $07, $00, $07, $00, $3f, $00, $38
    db $00, $38, $00, $f8, $01, $c0, $01, $c0, $01, $c0, $0f, $00, $0e, $00, $0e, $00
    db $80, $00, $80, $00, $80, $00, $80, $95, $0a, $95, $0a, $95, $0a, $95, $0a, $95
    db $0a, $00, $80, $6a, $05, $6a, $05, $6a, $05, $6a, $05, $6a, $05, $00, $80, $00
    db $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00
    db $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80