; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "charmap.inc"
INCLUDE "macro.inc"

MACRO TableEntry
    db $46, BANK(\1)
    dw \1
SHIFT
REPT _NARG
    dk \1
    SHIFT
ENDR
ENDM

MACRO TableBlank
    ds 4, $00
ENDM

SECTION "ROM Bank $007", ROMX

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

FileMagnets:
    INCBIN "../magnets.gbf"

FileMagnetsData:
    INCBIN "../mag_data.gbf"

FileShot:
    INCBIN "../shot.gbf"


SECTION "ROM Bank $006", ROMX

FileRandomSelection:
.count::
    db $03
.files::
    dw FileMogutteNanbo
    dw FileDrive
    dw FileSameGame

FileMogutteNanbo:
    INCBIN "../mogura.gbf"

FileDrive:
    INCBIN "../drive.gbf"

FileSameGame:
    INCBIN "../samegame.gbf"

SECTION "ROM Bank $009", ROMX

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

FileSoundTest:
    INCBIN "../soundtst.gbf"

FileBiorhythm:
    INCBIN "../biorythm.gbf"

FileBakechuRelay:
    INCBIN "../baketu.gbf"


SECTION "ROM Bank $008", ROMX

FileKissMon:
    INCBIN "../kissmon.gbf"

FileWatchAndTimer:
    INCBIN "../sw_timer.gbf"

FileCalculator:
    INCBIN "../dentaku.gbf"

SECTION "ROM Bank $00b", ROMX

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

FileCannonBall:
    INCBIN "../cannon.gbf"

FilePoker:
    INCBIN "../poker.gbf"


SECTION "ROM Bank $00a", ROMX

FileIconSend:
    INCBIN "../iconsend.gbf"

FileIconEdit:
    INCBIN "../iconedit.gbf"

FilePuzzleGame:
    INCBIN "../puzzle.gbf"

FileSlot:
    INCBIN "../slot.gbf"

SECTION "ROM Bank $00d", ROMX

FileCollection4::
    TableEntry .worm
    TableEntry .binary
    TableEntry .roulette
    TableEntry .blackjack
    TableBlank
    TableBlank
    TableBlank

.worm
    TableEntry FileWorm, "WORM\0"
.binary
    TableEntry FileBinary, "バイナリーランド\0"
.roulette
    TableEntry FileRoulette, "ルーレット\0"
.blackjack
    TableEntry FileBlackjack, "ブラックジャック\0"

FileRoulette:
    INCBIN "../roulette.gbf"

FileBlackjack:
    INCBIN "../bj.gbf"


SECTION "ROM Bank $00c", ROMX

FileWorm:
    INCBIN "../worm.gbf"

FileBinary:
    INCBIN "../bland.gbf"

SECTION "ROM Bank $00e", ROMX

FileCollection5::
    TableEntry .koura1
    TableEntry .koura2
    TableEntry .koura3
    TableEntry .sezaki
    TableEntry .num0Data
    TableBlank
    TableBlank

.koura1
    TableEntry FileKoura1, "15パズル　データ1\0"
.koura2
    TableEntry FileKoura2, "15パズル　データ2\0"
.koura3
    TableEntry FileKoura3, "15パズル　データ3\0"
.sezaki
    TableEntry FileSezaki, "モグってナンボ　データ\0"
.num0Data
    TableEntry FileNum0Data, "ストップウォッチすうじデータ\0"

FileKoura1:
    INCBIN "../koura1.gbf"

FileKoura2:
    INCBIN "../koura2.gbf"

FileKoura3:
    INCBIN "../koura3.gbf"

FileSezaki:
    INCBIN "../sezaki.gbf"

FileNum0Data:
    INCBIN "../sw_data.gbf"

SECTION "ROM Bank $00f", ROMX

FileCollection6::
    TableEntry .sramGetAndClear
    TableEntry .deleteAll
    TableEntry .charView
    TableBlank
    TableBlank
    TableBlank
    TableBlank

.sramGetAndClear
    TableEntry FileSRAMGetAndClear, "SRAM GET&CLR\0"
.deleteAll
    TableEntry FileDeleteAll, "FILE ALL DELETE\0"
.charView
    TableEntry FileCharDump, "CHAR DUMP\0"

FileSRAMGetAndClear:
    INCBIN "../sramtool.gbf"

FileDeleteAll:
    INCBIN "../del_all.gbf"

FileCharDump:
    INCBIN "../chardump.gbf"
