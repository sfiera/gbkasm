; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $00e", ROMX[$4000], BANK[$e]

    db $46, $0e, $1c, $40, $46, $0e, $2e, $40, $46, $0e, $40, $40, $46, $0e, $52, $40
    db $46, $0e, $67, $40, $00, $00, $00, $00, $00, $00, $00, $00, $46, $0e, $7f, $40
    db $31, $35, $ca, $df, $bd, $de, $d9, $20, $c3, $de, $b0, $c0, $31, $00, $46, $0e
    db $dc, $45, $31, $35, $ca, $df, $bd, $de, $d9, $20, $c3, $de, $b0, $c0, $32, $00
    db $46, $0e, $eb, $4b, $31, $35, $ca, $df, $bd, $de, $d9, $20, $c3, $de, $b0, $c0
    db $33, $00, $46, $0e, $a8, $51, $d3, $b8, $de, $0f, $af, $c3, $0e, $c5, $dd, $ce
    db $de, $20, $c3, $de, $b0, $c0, $00, $46, $0e, $11, $58, $bd, $c4, $af, $cc, $df
    db $b3, $ab, $af, $c1, $0f, $bd, $b3, $bc, $de, $0e, $c3, $de, $b0, $c0, $00

FileKoura1::
    INCBIN "gbk/koura-1.gbk"

FileKoura2::
    INCBIN "gbk/koura-2.gbk"

FileKoura3::
    INCBIN "gbk/koura-3.gbk"

FileSezaki::
    INCBIN "gbk/sezaki.gbk"

FileNum0Data::
    INCBIN "gbk/num0-data.gbk"
