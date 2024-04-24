; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $007", ROMX[$4000], BANK[$7]

FileCollection1::
    TableEntry .mogutteNanbo
    TableEntry .sameGame
    TableEntry .drive
    TableEntry .magnets
    TableEntry .magnetsData
    TableEntry .shot
    TableBlank

.mogutteNanbo
    TableEntry FileMogutteNanbo, "ﾓｸﾞ«ｯﾃ»ﾅﾝﾎﾞ\n"
.sameGame
    TableEntry FileSameGame, "SAMEGAME KISS\n"
.drive
    TableEntry FileDrive, "ｼﾞｬｶｼﾞｬｶｼﾞｬﾝﾌﾟ«ﾃﾞ»ﾎﾟﾝ\n"
.magnets
    TableEntry FileMagnets, "«ｶﾞﾝﾊﾞﾚ»ﾏｸﾞﾈｯﾂMAIN\n"
.magnetsData
    TableEntry FileMagnetsData, "«ｶﾞﾝﾊﾞﾚ»ﾏｸﾞﾈｯﾂDATA\n"
.shot
    TableEntry FileShot, "SHOOTING MASTER\n"

FileMagnets::
    INCBIN "file/magnets.gbk"

FileMagnetsData::
    INCBIN "file/magnets-data.gbk"

FileShot::
    INCBIN "file/shot.gbk"


SECTION "ROM Bank $006", ROMX[$4000], BANK[$6]

FileRandomSelection::
    db $03
    dw FileMogutteNanbo
    dw FileDrive
    dw FileSameGame

FileMogutteNanbo::
    INCBIN "file/mogutte-nanbo.gbk"

FileDrive::
    INCBIN "file/drive.gbk"

FileSameGame::
    INCBIN "file/samegame.gbk"