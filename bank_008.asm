; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $008", ROMX[$4000], BANK[$8]

FileKissMon::
    INCBIN "gbk/kiss-mon.gbk"

FileWatchAndTimer::
    INCBIN "gbk/watch-and-timer.gbk"

FileCalculator::
    INCBIN "gbk/calculator.gbk"
