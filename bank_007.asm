; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $007", ROMX[$4000], BANK[$7]

    db $46, $07, $1c, $40, $46, $07, $2c, $40, $46, $07, $3e, $40, $46, $07, $58, $40
    db $46, $07, $6f, $40, $46, $07, $86, $40, $00, $00, $00, $00, $46, $06, $07, $40
    db $d3, $b8, $de, $0f, $af, $c3, $0e, $c5, $dd, $ce, $de, $00, $46, $06, $ad, $72
    db $53, $41, $4d, $45, $47, $41, $4d, $45, $20, $4b, $49, $53, $53, $00, $46, $06
    db $dd, $5e, $bc, $de, $ac, $b6, $bc, $de, $ac, $b6, $bc, $de, $ac, $dd, $cc, $df
    db $0f, $c3, $de, $0e, $ce, $df, $dd, $00, $46, $07, $9a, $40, $0f, $b6, $de, $dd
    db $ca, $de, $da, $0e, $cf, $b8, $de, $c8, $af, $c2, $4d, $41, $49, $4e, $00, $46
    db $07, $25, $5e, $0f, $b6, $de, $dd, $ca, $de, $da, $0e, $cf, $b8, $de, $c8, $af
    db $c2, $44, $41, $54, $41, $00, $46, $07, $6c, $76, $53, $48, $4f, $4f, $54, $49
    db $4e, $47, $20, $4d, $41, $53, $54, $45, $52, $00

FileMagnets::
    INCBIN "gbk/magnets.gbk"

FileMagnetsData::
    INCBIN "gbk/magnets-data.gbk"

FileShot::
    INCBIN "gbk/shot.gbk"
