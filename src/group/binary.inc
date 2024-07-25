; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $00d", ROMX[$4000], BANK[$d]

FileCollection4::
    TableEntry .worm
    TableEntry .binary
    TableEntry .roulette
    TableEntry .blackjack
    TableBlank
    TableBlank
    TableBlank

.worm
    TableEntry FileWorm, "WORM\0"
.binary
    TableEntry FileBinary, "バイナリーランド\0"
.roulette
    TableEntry FileRoulette, "ルーレット\0"
.blackjack
    TableEntry FileBlackjack, "ブラックジャック\0"

FileRoulette::
    INCBIN "../roulette.gbf"

FileBlackjack::
    INCBIN "../bj.gbf"


SECTION "ROM Bank $00c", ROMX[$4000], BANK[$c]

FileWorm::
    INCBIN "../worm.gbf"

FileBinary::
    INCBIN "../bland.gbf"
