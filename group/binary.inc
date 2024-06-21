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
    TableEntry FileWorm, "WORM\n"
.binary
    TableEntry FileBinary, "バイナリーランド\n"
.roulette
    TableEntry FileRoulette, "ルーレット\n"
.blackjack
    TableEntry FileBlackjack, "ブラックジャック\n"

FileRoulette::
    INCBIN "file/roulette.gbf"

FileBlackjack::
    INCBIN "file/bj.gbf"


SECTION "ROM Bank $00c", ROMX[$4000], BANK[$c]

FileWorm::
    INCBIN "file/worm.gbf"

FileBinary::
    INCBIN "file/bland.gbf"
