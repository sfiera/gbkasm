; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $00d", ROMX[$4000], BANK[$d]

    db $46, $0d, $1c, $40, $46, $0d, $25, $40, $46, $0d, $34, $40, $46, $0d, $3e, $40
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $46, $0c, $00, $40
    db $57, $4f, $52, $4d, $00, $46, $0c, $18, $47, $ca, $de, $b2, $c5, $d8, $b0, $d7
    db $dd, $c4, $de, $00, $46, $0d, $4d, $40, $d9, $b0, $da, $af, $c4, $00, $46, $0d
    db $ae, $54, $cc, $de, $d7, $af, $b8, $bc, $de, $ac, $af, $b8, $00

FileRoulette::
    INCBIN "gbk/roulette.gbk"

FileBlackjack::
    INCBIN "gbk/blackjack.gbk"
