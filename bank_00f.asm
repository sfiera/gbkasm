; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $00f", ROMX[$4000], BANK[$f]

    db $46, $0f, $1c, $40, $46, $0f, $2d, $40, $46, $0f, $41, $40, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $46, $0f, $4f, $40
    db $53, $52, $41, $4d, $20, $47, $45, $54, $26, $43, $4c, $52, $00, $46, $0f, $82
    db $44, $46, $49, $4c, $45, $20, $41, $4c, $4c, $20, $44, $45, $4c, $45, $54, $45
    db $00, $46, $0f, $a1, $44, $43, $48, $41, $52, $20, $44, $55, $4d, $50, $00

FileSRAMGetAndClear::
    INCBIN "gbk/sram-get-and-clear.gbk"

FileDeleteAll::
    INCBIN "gbk/delete-all.gbk"

FileCharView::
    INCBIN "gbk/char-view.gbk"
