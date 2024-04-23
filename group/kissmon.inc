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
    TableEntry FileWatchAndTimer, "ｽﾄｯﾌﾟｳｫｯﾁ&ﾀｲﾏｰ\n"
.calculator
    TableEntry FileCalculator, "«ｶﾝｲ ﾃﾞﾝﾀｸ»\n"
.biorhythm
    TableEntry FileBiorhythm, "ﾊﾞｲｵﾘｽﾞﾑ\n"
.soundTest
    TableEntry FileSoundTest, "ｻｳﾝﾄﾞ ﾙｰﾑ\n"
.bakechuRelay
    TableEntry FileBakechuRelay, "ﾊﾞｹ«ﾁｭ»ﾘﾚｰ\n"

FileSoundTest::
    INCBIN "gbk/sound-test.gbk"

FileBiorhythm::
    INCBIN "gbk/biorhythm.gbk"

FileBakechuRelay::
    INCBIN "gbk/bakechu-relay.gbk"


SECTION "ROM Bank $008", ROMX[$4000], BANK[$8]

FileKissMon::
    INCBIN "gbk/kiss-mon.gbk"

FileWatchAndTimer::
    INCBIN "gbk/watch-and-timer.gbk"

FileCalculator::
    INCBIN "gbk/calculator.gbk"
