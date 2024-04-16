; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $00a", ROMX[$4000], BANK[$a]

FileIconSend::
    INCBIN "gbk/icon-send.gbk"

FileIconEdit::
    INCBIN "gbk/icon-edit.gbk"

FilePuzzleGame::
    INCBIN "gbk/puzzle-game.gbk"

FileSlot::
    INCBIN "gbk/slot.gbk"
