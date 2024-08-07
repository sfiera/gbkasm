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
    TableEntry FileMogutteNanbo, "モグってナンボ\0"
.sameGame
    TableEntry FileSameGame, "SAMEGAME KISS\0"
.drive
    TableEntry FileDrive, "ジャカジャカジャンプでポン\0"
.magnets
    TableEntry FileMagnets, "がんばれマグネッツMAIN\0"
.magnetsData
    TableEntry FileMagnetsData, "がんばれマグネッツDATA\0"
.shot
    TableEntry FileShot, "SHOOTING MASTER\0"

FileMagnets::
    INCBIN "../magnets.gbf"

FileMagnetsData::
    INCBIN "../mag_data.gbf"

FileShot::
    INCBIN "../shot.gbf"


SECTION "ROM Bank $006", ROMX[$4000], BANK[$6]

FileRandomSelection::
.count
    db $03
.files
    dw FileMogutteNanbo
    dw FileDrive
    dw FileSameGame

FileMogutteNanbo::
    INCBIN "../mogura.gbf"

FileDrive::
    INCBIN "../drive.gbf"

FileSameGame::
    INCBIN "../samegame.gbf"
