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
    INCBIN "file/roulette.gbf"

FileBlackjack::
    INCBIN "file/bj.gbf"


SECTION "ROM Bank $00c", ROMX[$4000], BANK[$c]

FileWorm::
    INCBIN "file/worm.gbf"

FileBinary::
    INCBIN "file/bland.gbf"
