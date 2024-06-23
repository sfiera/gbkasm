; Disassembly of "gbkiss.gb"

MACRO trap
    rst $08
    db \1
ENDM

DEF ExitToMenu       EQU $01

DEF StopAudio        EQU $11
DEF PlayMusic        EQU $13
DEF PlaySound        EQU $14
DEF SilenceChannels  EQU $15
DEF GetMusicState    EQU $16
DEF GetSoundState    EQU $17
DEF PauseMusic       EQU $18
DEF SetVolume        EQU $19
DEF GetAudioCount    EQU $1a

DEF AwaitFrame       EQU $b1
DEF DoMenu           EQU $bf

DEF MoveCursor       EQU $b8
DEF DrawInit         EQU $b3
DEF DrawChar         EQU $bb
DEF DrawString       EQU $69
DEF DrawStringList   EQU $6a
DEF DrawLayout       EQU $5c

DEF IntToString      EQU $a3
DEF IntToStringHex   EQU $a4

DEF LoadTiles        EQU $4c

DEF RandInit         EQU $8d
DEF RandNext         EQU $8e

DEF InitDecompress   EQU $62
DEF RunDecompress    EQU $63
