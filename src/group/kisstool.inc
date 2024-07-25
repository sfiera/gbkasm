; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $00f", ROMX[$4000], BANK[$f]

FileCollection6::
    TableEntry .sramGetAndClear
    TableEntry .deleteAll
    TableEntry .charView
    TableBlank
    TableBlank
    TableBlank
    TableBlank

.sramGetAndClear
    TableEntry FileSRAMGetAndClear, "SRAM GET&CLR\0"
.deleteAll
    TableEntry FileDeleteAll, "FILE ALL DELETE\0"
.charView
    TableEntry FileCharDump, "CHAR DUMP\0"

FileSRAMGetAndClear::
    INCBIN "../sramtool.gbf"

FileDeleteAll::
    INCBIN "../del_all.gbf"

FileCharDump::
    INCBIN "../chardump.gbf"
