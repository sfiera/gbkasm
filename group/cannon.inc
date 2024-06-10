; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $00b", ROMX[$4000], BANK[$b]

FileCollection3::
    TableEntry .iconSend
    TableEntry .iconEdit
    TableEntry .puzzleGame
    TableEntry .slot
    TableEntry .cannonBall
    TableEntry .poker
    TableBlank

.iconSend
    TableEntry FileIconSend, "ｱｲｺﾝﾃﾞｰﾀ«ｼｭｳ»\n"
.iconEdit
    TableEntry FileIconEdit, "ｱｲｺﾝ ｴﾃﾞｨﾀｰ\n"
.puzzleGame
    TableEntry FilePuzzleGame, "15ﾊﾟｽﾞﾙ&ﾊﾟﾈﾙ«ﾃﾞ»ﾎﾟﾝ\n"
.slot
    TableEntry FileSlot, "ｽﾛｯﾄ ﾏｼﾝ\n"
.cannonBall
    TableEntry FileCannonBall, "ｷｬﾉﾝﾎﾞｰﾙ\n"
.poker
    TableEntry FilePoker, "ﾎﾟｰｶｰ\n"

FileCannonBall::
    INCBIN "file/cannon-ball.gbf"

FilePoker::
    INCBIN "file/poker.gbf"


SECTION "ROM Bank $00a", ROMX[$4000], BANK[$a]

FileIconSend::
    INCBIN "file/icon-send.gbf"

FileIconEdit::
    INCBIN "file/icon-edit.gbf"

FilePuzzleGame::
    INCBIN "file/puzzle-game.gbf"

FileSlot::
    INCBIN "file/slot.gbf"
