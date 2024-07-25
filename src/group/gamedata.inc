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
    TableEntry FileKoura1, "15パズル　データ1\0"
.koura2
    TableEntry FileKoura2, "15パズル　データ2\0"
.koura3
    TableEntry FileKoura3, "15パズル　データ3\0"
.sezaki
    TableEntry FileSezaki, "モグってナンボ　データ\0"
.num0Data
    TableEntry FileNum0Data, "ストップウォッチすうじデータ\0"

FileKoura1::
    INCBIN "../koura1.gbf"

FileKoura2::
    INCBIN "../koura2.gbf"

FileKoura3::
    INCBIN "../koura3.gbf"

FileSezaki::
    INCBIN "../sezaki.gbf"

FileNum0Data::
    INCBIN "../sw_data.gbf"
