; Disassembly of "gbkiss.gb"

MACRO trap
    rst $08
    db \1
ENDM

DEF ExitToMenu       EQU $01
DEF JumpViaTable     EQU $06

DEF MemCopy          EQU $02  ; [de, de+bc) → [hl, hl+bc)

DEF StopAudio        EQU $11
DEF PlayMusic        EQU $13
DEF PlaySound        EQU $14
DEF SilenceChannels  EQU $15
DEF GetMusicState    EQU $16
DEF GetSoundState    EQU $17
DEF PauseMusic       EQU $18
DEF SetVolume        EQU $19
DEF GetAudioCount    EQU $1a

DEF LoadTiles        EQU $4c

DEF DrawBox          EQU $58  ; origin = (d, e), size = (b, c)
DEF DrawLayout       EQU $5c
DEF DrawPlainText    EQU $5d
DEF DoCursorMenu     EQU $5f

DEF InitDecompress   EQU $62
DEF RunDecompress    EQU $63

DEF DrawString       EQU $69
DEF DrawStringList   EQU $6a

DEF IRListen         EQU $72
DEF IRClose          EQU $73
DEF IROpen           EQU $7c
DEF IRSend           EQU $7f

DEF RandInit         EQU $8d
DEF RandNext         EQU $8e

DEF IntToString      EQU $a3
DEF IntToStringHex   EQU $a4
DEF MemSet           EQU $a6  ; e → [hl, hl+bc)

DEF AwaitFrame       EQU $b1
DEF DrawInit         EQU $b3
DEF LCDEnable        EQU $b4  ; a|$80 → LCDC; $00 → BGP/OBP1/OBP2
DEF LCDDisable       EQU $b5  ; safe LCDC &= $7f
DEF MovePen          EQU $b8
DEF DrawChar         EQU $bb
DEF DoMenu           EQU $bf

DEF TimerSet         EQU $cb  ; h → TAC; l → TMA; TACF_START? → IEF_TIMER?
