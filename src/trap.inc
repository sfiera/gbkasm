; Disassembly of "gbkiss.gb"

MACRO trap
    rst $08
    IF STRSUB("\1", 1, 1) == "$"
        db \1
    ELSE
        db Trap_\1
    ENDC
ENDM

DEF Trap_ExitToMenu        EQU $01
DEF Trap_MemCopy           EQU $02  ; [de, de+bc) → [hl, hl+bc)
DEF Trap_JumpViaTable      EQU $06

DEF Trap_AudioStop         EQU $11
DEF Trap_AudioPlayMusic    EQU $13
DEF Trap_AudioPlaySound    EQU $14
DEF Trap_AudioSilence      EQU $15
DEF Trap_AudioGetMusic     EQU $16
DEF Trap_AudioGetSound     EQU $17
DEF Trap_AudioPause        EQU $18
DEF Trap_AudioSetVolume    EQU $19
DEF Trap_AudioGetCount     EQU $1a

DEF Trap_TileLoad          EQU $4c
DEF Trap_StrTrim           EQU $4d

DEF Trap_KbdInit           EQU $54
DEF Trap_KbdEdit           EQU $55

DEF Trap_DrawBox           EQU $58  ; origin = (d, e), size = (b, c)
DEF Trap_DrawLayout        EQU $5c
DEF Trap_TileLoadText      EQU $5d
DEF Trap_InputCursorMenu   EQU $5f

DEF Trap_ExtractInit       EQU $62
DEF Trap_ExtractData       EQU $63

DEF Trap_MemCmp            EQU $67

DEF Trap_DrawString        EQU $69
DEF Trap_DrawStringList    EQU $6a
DEF Trap_FileSearch        EQU $6b

DEF Trap_FileGetHeader     EQU $71

DEF Trap_IRListen          EQU $72
DEF Trap_IRClose           EQU $73
DEF Trap_IRFileSearch      EQU $75
DEF Trap_IRFileWrite       EQU $76
DEF Trap_IR04              EQU $77
DEF Trap_IRFileNext        EQU $78
DEF Trap_IR06              EQU $79
DEF Trap_IR07              EQU $7a
DEF Trap_IRReadSRAM        EQU $7b
DEF Trap_IRRead            EQU $7c
DEF Trap_IR0A              EQU $7d
DEF Trap_IRWriteSRAM       EQU $7e
DEF Trap_IRWrite           EQU $7f

DEF Trap_MathXor16         EQU $80  ; hl ^= de
DEF Trap_MathOr16          EQU $81  ; hl |= de
DEF Trap_MathAnd16         EQU $82  ; hl &= de
DEF Trap_MathCpl16         EQU $83  ; hl = ~hl
DEF Trap_MathCmp16         EQU $84  ; cmp(hl, de)
DEF Trap_MathSrl16         EQU $85  ; hl >>= de
DEF Trap_MathSla16         EQU $86  ; hl <<= de
DEF Trap_MathAdd16         EQU $87  ; hl += de
DEF Trap_MathSub16         EQU $88  ; hl -= de
DEF Trap_MathMul16         EQU $89  ; hl *= de
DEF Trap_MathDiv16         EQU $8a  ; hl /= de
DEF Trap_MathNeg16         EQU $8b  ; hl = -hl
DEF Trap_MathAbs16         EQU $8c  ; hl = abs(hl)

DEF Trap_RandInit          EQU $8d
DEF Trap_RandNext          EQU $8e

DEF Trap_StrConvInt        EQU $a3
DEF Trap_StrConvHex        EQU $a4
DEF Trap_MemSet            EQU $a6  ; e → [hl, hl+bc)

DEF Trap_AwaitFrame        EQU $b1
DEF Trap_DrawInit          EQU $b3
DEF Trap_LCDEnable         EQU $b4  ; a|$80 → LCDC; $00 → BGP/OBP1/OBP2
DEF Trap_LCDDisable        EQU $b5  ; safe LCDC &= $7f
DEF Trap_DrawBaseAddr      EQU $b7
DEF Trap_DrawAt            EQU $b8
DEF Trap_DrawCtrlChar      EQU $b9
DEF Trap_DrawChar          EQU $bb
DEF Trap_DrawTile          EQU $cd
DEF Trap_InputHiliteMenu   EQU $bf

DEF Trap_AwaitBlit         EQU $c3
DEF Trap_TimerSet          EQU $cb  ; h → TAC; l → TMA; TACF_START? → IEF_TIMER?

DEF Trap_InputButtons      EQU $d8
DEF Trap_AwaitButton       EQU $dc

DEF Trap_KissClearAll      EQU $e0
DEF Trap_CRAMRead          EQU $e4
DEF Trap_CRAMWrite         EQU $e5  ; [de, de+bc) → [GBtoSRAM(hl), GBtoSRAM(hl+bc))
DEF Trap_FileNext          EQU $e8
DEF Trap_FileWrite         EQU $e9
DEF Trap_FileDelete        EQU $ef

DEF Trap_AddrGBToCRAM      EQU $fb
