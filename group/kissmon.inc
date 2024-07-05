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
    TableEntry FileKissMon, "KISS MONSTER\0"
.watchAndTimer
    TableEntry FileWatchAndTimer, "ストップウォッチ&タイマー\0"
.calculator
    TableEntry FileCalculator, "かんい　でんたく»\0"
.biorhythm
    TableEntry FileBiorhythm, "バイオリズム\0"
.soundTest
    TableEntry FileSoundTest, "サウンド　ルーム\0"
.bakechuRelay
    TableEntry FileBakechuRelay, "バケちゅリレー\0"

FileSoundTest::
    INCBIN "file/soundtst.gbf"

FileBiorhythm::
    INCBIN "file/biorythm.gbf"

FileBakechuRelay::
    INCBIN "file/baketu.gbf"


SECTION "ROM Bank $008", ROMX[$4000], BANK[$8]

FileKissMon::
    INCBIN "file/kissmon.gbf"

FileWatchAndTimer::
    INCBIN "file/sw_timer.gbf"

FileCalculator::
    INCBIN "file/dentaku.gbf"
