; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $00b", ROMX[$4000], BANK[$b]

    db $46, $0b, $1c, $40, $46, $0b, $2e, $40, $46, $0b, $3e, $40, $46, $0b, $56, $40
    db $46, $0b, $63, $40, $46, $0b, $70, $40, $00, $00, $00, $00, $46, $0a, $00, $40
    db $b1, $b2, $ba, $dd, $c3, $de, $b0, $c0, $0f, $bc, $ad, $b3, $0e, $00, $46, $0a
    db $90, $56, $b1, $b2, $ba, $dd, $20, $b4, $c3, $de, $a8, $c0, $b0, $00, $46, $0a
    db $1a, $5f, $31, $35, $ca, $df, $bd, $de, $d9, $26, $ca, $df, $c8, $d9, $0f, $c3
    db $de, $0e, $ce, $df, $dd, $00, $46, $0a, $df, $72, $bd, $db, $af, $c4, $20, $cf
    db $bc, $dd, $00, $46, $0b, $7a, $40, $b7, $ac, $c9, $dd, $ce, $de, $b0, $d9, $00
    db $46, $0b, $c6, $5a, $ce, $df, $b0, $b6, $b0, $00

FileCannonBall::
    INCBIN "gbk/cannon-ball.gbk"

FilePoker::
    INCBIN "gbk/poker.gbk"
