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
    TableEntry FileBinary, "ﾊﾞｲﾅﾘｰﾗﾝﾄﾞ\n"
.roulette
    TableEntry FileRoulette, "ﾙｰﾚｯﾄ\n"
.blackjack
    TableEntry FileBlackjack, "ﾌﾞﾗｯｸｼﾞｬｯｸ\n"

FileRoulette::
    INCBIN "file/roulette.gbk"

FileBlackjack::
    INCBIN "file/blackjack.gbk"


SECTION "ROM Bank $00c", ROMX[$4000], BANK[$c]

FileWorm::
    INCBIN "file/worm.gbk"

FileBinary::
    INCBIN "file/binary.gbk"
