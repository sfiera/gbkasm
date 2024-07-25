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
    TableEntry FileIconSend, "アイコンデータしゅう»\0"
.iconEdit
    TableEntry FileIconEdit, "アイコン　エディター\0"
.puzzleGame
    TableEntry FilePuzzleGame, "15パズル&パネルでポン\0"
.slot
    TableEntry FileSlot, "スロット　マシン\0"
.cannonBall
    TableEntry FileCannonBall, "キャノンボール\0"
.poker
    TableEntry FilePoker, "ポーカー\0"

FileCannonBall::
    INCBIN "../cannon.gbf"

FilePoker::
    INCBIN "../poker.gbf"


SECTION "ROM Bank $00a", ROMX[$4000], BANK[$a]

FileIconSend::
    INCBIN "../iconsend.gbf"

FileIconEdit::
    INCBIN "../iconedit.gbf"

FilePuzzleGame::
    INCBIN "../puzzle.gbf"

FileSlot::
    INCBIN "../slot.gbf"
