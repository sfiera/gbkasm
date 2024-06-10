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
    TableEntry FileSRAMGetAndClear, "SRAM GET&CLR\n"
.deleteAll
    TableEntry FileDeleteAll, "FILE ALL DELETE\n"
.charView
    TableEntry FileCharView, "CHAR DUMP\n"

FileSRAMGetAndClear::
    INCBIN "file/sram-get-and-clear.gbf"

FileDeleteAll::
    INCBIN "file/delete-all.gbf"

FileCharView::
    INCBIN "file/char-view.gbf"
