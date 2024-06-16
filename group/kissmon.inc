; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $009", ROMX[$4000], BANK[$9]

FileCollection2::
    TableEntry .kissMon
    TableEntry .watchAndTimer
    TableEntry .calculator
    TableEntry .biorhythm
    TableEntry .soundTest
    TableEntry .bakechuRelay
    TableBlank

.kissMon
    TableEntry FileKissMon, "KISS MONSTER\n"
.watchAndTimer
    TableEntry FileWatchAndTimer, "ストップウォッチ&タイマー\n"
.calculator
    TableEntry FileCalculator, "かんい　でんたく»\n"
.biorhythm
    TableEntry FileBiorhythm, "バイオリズム\n"
.soundTest
    TableEntry FileSoundTest, "サウンド　ルーム\n"
.bakechuRelay
    TableEntry FileBakechuRelay, "バケちゅリレー\n"

FileSoundTest::
    INCBIN "file/sound-test.gbf"

FileBiorhythm::
    INCBIN "file/biorhythm.gbf"

FileBakechuRelay::
    INCBIN "file/bakechu-relay.gbf"


SECTION "ROM Bank $008", ROMX[$4000], BANK[$8]

FileKissMon::
    INCBIN "file/kiss-mon.gbf"

FileWatchAndTimer::
    INCBIN "file/watch-and-timer.gbf"

FileCalculator::
    INCBIN "file/calculator.gbf"
