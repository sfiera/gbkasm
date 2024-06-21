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
    TableEntry FileIconSend, "アイコンデータしゅう»\n"
.iconEdit
    TableEntry FileIconEdit, "アイコン　エディター\n"
.puzzleGame
    TableEntry FilePuzzleGame, "15パズル&パネルでポン\n"
.slot
    TableEntry FileSlot, "スロット　マシン\n"
.cannonBall
    TableEntry FileCannonBall, "キャノンボール\n"
.poker
    TableEntry FilePoker, "ポーカー\n"

FileCannonBall::
    INCBIN "file/cannon.gbf"

FilePoker::
    INCBIN "file/poker.gbf"


SECTION "ROM Bank $00a", ROMX[$4000], BANK[$a]

FileIconSend::
    INCBIN "file/iconsend.gbf"

FileIconEdit::
    INCBIN "file/iconedit.gbf"

FilePuzzleGame::
    INCBIN "file/puzzle.gbf"

FileSlot::
    INCBIN "file/slot.gbf"
