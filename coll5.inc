; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $00e", ROMX[$4000], BANK[$e]

FileCollection5::
    TableEntry .koura1
    TableEntry .koura2
    TableEntry .koura3
    TableEntry .sezaki
    TableEntry .num0Data
    TableBlank
    TableBlank

.koura1
    TableEntry FileKoura1, "15ﾊﾟｽﾞﾙ ﾃﾞｰﾀ1\n"
.koura2
    TableEntry FileKoura2, "15ﾊﾟｽﾞﾙ ﾃﾞｰﾀ2\n"
.koura3
    TableEntry FileKoura3, "15ﾊﾟｽﾞﾙ ﾃﾞｰﾀ3\n"
.sezaki
    TableEntry FileSezaki, "ﾓｸﾞ«ｯﾃ»ﾅﾝﾎﾞ ﾃﾞｰﾀ\n"
.num0Data
    TableEntry FileNum0Data, "ｽﾄｯﾌﾟｳｫｯﾁ«ｽｳｼﾞ»ﾃﾞｰﾀ\n"

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