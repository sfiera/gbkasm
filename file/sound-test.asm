; Disassembly of "gbkiss.gb"

INCLUDE "charmap.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    ; Length of entirety of file
    dw End
    ; Flags for display in menu
    db kFileHasIcon2bpp + kFileMarkerCircle
    ; Must be $00 for normal files (other than Kiss Mail)
    db $00
    ; Length of variable parts of header
    db Main - @ - 1
    ; File owner code
    db $05

Title::
    db "ｻｳﾝﾄﾞ ﾃｽﾄ"
Icon::
    INCBIN "gfx/icon/sound-test.2bpp"

Main::
    db $3e, $c4, $01, $01, $02, $11, $12, $0d, $26, $04, $cf, $b3, $cf, $11, $21, $00
    db $c6, $d7, $06, $00, $d7, $77, $00, $c9, $7a, $22, $af, $22, $7b, $22, $af, $22
    db $3e, $0f, $22, $af, $22, $3e, $07, $22, $22, $3e, $01, $22, $22, $af, $22, $d7
    db $06, $00, $d7, $ea, $00, $c9, $d7, $06, $00, $d7, $22, $01, $c9, $d7, $06, $00
    db $d7, $36, $01, $c9, $d7, $06, $00, $d7, $4a, $01, $c9, $d7, $06, $00, $d7, $5e
    db $01, $c9, $d7, $06, $00, $d7, $72, $01, $c9, $cf, $b1, $11, $1b, $01, $01, $09
    db $1a, $2e, $06, $3e, $00, $26, $37, $cf, $bf, $cb, $4c, $20, $1d, $cb, $54, $20
    db $19, $c5, $d5, $e5, $f5, $d7, $06, $00, $d7, $1f, $00, $c9, $cf, $d8, $c1, $e6
    db $37, $e1, $67, $d1, $78, $c1, $28, $dd, $18, $df, $cf, $01, $fa, $14, $00, $11
    db $38, $1b, $fe, $01, $c8, $cf, $1a, $c9, $fe, $04, $20, $0d, $cb, $44, $c8, $cf
    db $18, $d7, $06, $00, $d7, $53, $01, $c9, $c9, $cb, $44, $28, $28, $d7, $06, $00
    db $d7, $07, $00, $c9, $d7, $43, $01, $e9, $d7, $a3, $00, $e1, $b7, $c8, $d7, $b8
    db $00, $e1, $3d, $c8, $d7, $cd, $00, $e1, $3d, $c8, $d7, $e2, $00, $e1, $3d, $c8
    db $d7, $f7, $00, $e1, $c9, $4c, $d7, $98, $00, $e1, $11, $00, $c6, $b7, $28, $25
    db $d7, $a9, $00, $e1, $11, $02, $c6, $3d, $28, $1b, $d7, $ba, $00, $e1, $11, $04
    db $c6, $3d, $28, $11, $d7, $cb, $00, $e1, $11, $06, $c6, $3d, $28, $07, $d7, $e1
    db $00, $e1, $11, $08, $c6, $1a, $13, $47, $cb, $61, $20, $0a, $1a, $b7, $28, $01
    db $3d, $12, $d7, $e5, $00, $e9, $1a, $b8, $28, $f7, $3c, $18, $f4, $11, $03, $01
    db $d7, $0a, $01, $e1, $cf, $6a, $21, $01, $01, $cf, $b8, $d7, $ef, $00, $e1, $cf
    db $69, $21, $0a, $00, $cf, $b8, $d7, $49, $01, $e1, $cf, $69, $d7, $06, $00, $d7
    db $22, $00, $c9, $d7, $06, $00, $d7, $36, $00, $c9, $d7, $06, $00, $d7, $4a, $00
    db $c9, $d7, $06, $00, $d7, $5e, $00, $c9, $d7, $7a, $00, $c9, $fa, $01, $c6, $cf
    db $13, $c9, $21, $03, $0f, $fa, $00, $c6, $d7, $06, $00, $d7, $7a, $00, $c9, $21
    db $03, $0b, $fa, $01, $c6, $18, $6f, $fa, $03, $c6, $cf, $14, $c9, $21, $04, $0f
    db $fa, $02, $c6, $d7, $06, $00, $d7, $5f, $00, $c9, $21, $04, $0b, $fa, $03, $c6
    db $18, $54, $fa, $05, $c6, $cf, $15, $c9, $21, $05, $0f, $fa, $04, $c6, $d7, $06
    db $00, $d7, $44, $00, $c9, $21, $05, $0b, $fa, $05, $c6, $18, $39, $fa, $07, $c6
    db $cf, $19, $c9, $21, $06, $0f, $fa, $06, $c6, $d7, $06, $00, $d7, $29, $00, $c9
    db $21, $06, $0b, $fa, $07, $c6, $18, $1e, $fa, $09, $c6, $87, $87, $67, $2e, $bc
    db $cf, $cb, $c9, $21, $08, $0f, $fa, $08, $c6, $d7, $06, $00, $d7, $09, $00, $c9
    db $21, $08, $0b, $fa, $09, $c6, $f5, $cf, $b8, $f1, $5f, $16, $00, $21, $00, $c4
    db $cf, $a3, $21, $03, $c4, $cf, $69, $c9, $21, $0a, $04, $cf, $b8, $cf, $16, $d7
    db $06, $00, $d7, $0a, $00, $c9, $21, $0a, $0e, $cf, $b8, $cf, $17, $d7, $85, $00
    db $e1, $b7, $28, $04, $d7, $83, $00, $e1, $cf, $69, $c9

Interface:
    db "SOUND TEST ROOM\n"
    db "MUSIC No.    /\n"
    db "EFECT No.    /\n"
    db "OffChannel   /\n"
    db "VOLUME       /\n"
    db "M_PAUSE \n"
    db "VsyncTimer   /\n"
    db "\n"
    db "Mst=STOP  Est=STOP\n"

StrStop:
    db "STOP\n"
StrPlay:
    db "PLAY\n"

End:
