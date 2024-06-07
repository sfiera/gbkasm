; Disassembly of "gbkiss.gb"

def kFileHasIcon2bpp     equ %00011000  ; extra $c0 bytes after title
def kFileHasIcon1bpp     equ %00010000  ; extra $60 bytes after title
def kFileByte4           equ %00001000
def kFileMarkerDiamond   equ %00000110  ; executable
def kFileMarkerCircle    equ %00000100  ; executable
def kFileMarkerTriangle  equ %00000000  ; non-executable
def kFileHasTransfers    equ %00000001  ; extra $2e bytes after title/icon

DEF ExitToMenu      EQU $01
DEF PlayMusic       EQU $13
DEF PlaySound       EQU $14
DEF GetMusicState   EQU $16
DEF GetSoundState   EQU $17
DEF PauseMusic      EQU $18
DEF GetAudioCount   EQU $1a

DEF MoveCursor      EQU $b8
DEF DrawChar        EQU $bb
DEF DrawString      EQU $69
DEF DrawLayout      EQU $5c
DEF DrawBox         EQU $b3
DEF IntToString     EQU $a3

DEF RandInit        EQU $8d
DEF RandNext        EQU $8e
