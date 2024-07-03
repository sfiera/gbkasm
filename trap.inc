; Disassembly of "gbkiss.gb"

MACRO trap
    rst $08
    db \1
ENDM

DEF ExitToMenu        EQU $01
DEF MemCopy           EQU $02  ; [de, de+bc) → [hl, hl+bc)
DEF JumpViaTable      EQU $06

DEF AudioStop         EQU $11
DEF AudioPlayMusic    EQU $13
DEF AudioPlaySound    EQU $14
DEF AudioSilence      EQU $15
DEF AudioGetMusic     EQU $16
DEF AudioGetSound     EQU $17
DEF AudioPause        EQU $18
DEF AudioSetVolume    EQU $19
DEF AudioGetCount     EQU $1a

DEF TileLoad          EQU $4c

DEF DrawBox           EQU $58  ; origin = (d, e), size = (b, c)
DEF DrawLayout        EQU $5c
DEF TileLoadText      EQU $5d
DEF InputCursorMenu   EQU $5f

DEF ExtractInit       EQU $62
DEF ExtractData       EQU $63

DEF DrawString        EQU $69
DEF DrawStringList    EQU $6a

DEF IRListen          EQU $72
DEF IRClose           EQU $73
DEF IROpen            EQU $7c
DEF IRSend            EQU $7f

DEF RandInit          EQU $8d
DEF RandNext          EQU $8e

DEF StrConvInt        EQU $a3
DEF StrConvHex        EQU $a4
DEF MemSet            EQU $a6  ; e → [hl, hl+bc)

DEF AwaitFrame        EQU $b1
DEF DrawInit          EQU $b3
DEF LCDEnable         EQU $b4  ; a|$80 → LCDC; $00 → BGP/OBP1/OBP2
DEF LCDDisable        EQU $b5  ; safe LCDC &= $7f
DEF DrawAt            EQU $b8
DEF DrawChar          EQU $bb
DEF InputHiliteMenu   EQU $bf

DEF TimerSet          EQU $cb  ; h → TAC; l → TMA; TACF_START? → IEF_TIMER?

DEF InputButtons      EQU $d8
