; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $009", ROMX[$4000], BANK[$9]

    db $46, $09, $1c, $40, $46, $09, $2d, $40, $46, $09, $40, $40, $46, $09, $50, $40
    db $46, $09, $5d, $40, $46, $09, $6b, $40, $00, $00, $00, $00, $46, $08, $00, $40
    db $4b, $49, $53, $53, $20, $4d, $4f, $4e, $53, $54, $45, $52, $00, $46, $08, $0f
    db $56, $bd, $c4, $af, $cc, $df, $b3, $ab, $af, $c1, $26, $c0, $b2, $cf, $b0, $00
    db $46, $08, $16, $5e, $0f, $b6, $dd, $b2, $20, $c3, $de, $dd, $c0, $b8, $0e, $00
    db $46, $09, $e6, $43, $ca, $de, $b2, $b5, $d8, $bd, $de, $d1, $00, $46, $09, $7a
    db $40, $bb, $b3, $dd, $c4, $de, $20, $d9, $b0, $d1, $00, $46, $09, $fe, $56, $ca
    db $de, $b9, $0f, $c1, $ad, $0e, $d8, $da, $b0, $00

FileSoundTest::
    INCBIN "gbk/sound-test.gbk"

FileBiorhythm::
    INCBIN "gbk/biorhythm.gbk"

FileBakechuRelay::
    INCBIN "gbk/bakechu-relay.gbk"
