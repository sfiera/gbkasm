; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $006", ROMX[$4000], BANK[$6]

FileRandomSelection::
    db $03
    dw FileMogutteNanbo
    dw FileDrive
    dw FileSameGame

FileMogutteNanbo::
    INCBIN "gbk/mogutte-nanbo.gbk"

FileDrive::
    INCBIN "gbk/drive.gbk"

FileSameGame::
    INCBIN "gbk/samegame.gbk"
