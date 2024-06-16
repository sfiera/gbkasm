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
    TableEntry FileMogutteNanbo, "モグってナンボ\n"
.sameGame
    TableEntry FileSameGame, "SAMEGAME KISS\n"
.drive
    TableEntry FileDrive, "ジャカジャカジャンプでポン\n"
.magnets
    TableEntry FileMagnets, "がんばれマグネッツMAIN\n"
.magnetsData
    TableEntry FileMagnetsData, "がんばれマグネッツDATA\n"
.shot
    TableEntry FileShot, "SHOOTING MASTER\n"

FileMagnets::
    INCBIN "file/magnets.gbf"

FileMagnetsData::
    INCBIN "file/magnets-data.gbf"

FileShot::
    INCBIN "file/shot.gbf"


SECTION "ROM Bank $006", ROMX[$4000], BANK[$6]

FileRandomSelection::
    db $03
    dw FileMogutteNanbo
    dw FileDrive
    dw FileSameGame

FileMogutteNanbo::
    INCBIN "file/mogutte-nanbo.gbf"

FileDrive::
    INCBIN "file/drive.gbf"

FileSameGame::
    INCBIN "file/samegame.gbf"
