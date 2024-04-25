; Disassembly of "gbkiss.gb"

def kFileHasIcon2bpp     equ %00011000  ; extra $c0 bytes after title
def kFileHasIcon1bpp     equ %00010000  ; extra $60 bytes after title
def kFileByte4           equ %00001000
def kFileMarkerDiamond   equ %00000110  ; executable
def kFileMarkerCircle    equ %00000100  ; executable
def kFileMarkerTriangle  equ %00000000  ; non-executable
def kFileHasTransfers    equ %00000001  ; extra $2e bytes after title/icon

DEF ExitToMenu   EQU $01
DEF PlaySound    EQU $14

DEF MoveCursor   EQU $b8
DEF DrawChar     EQU $bb
DEF DrawString   EQU $69
DEF IntToString  EQU $a3

DEF RandInit     EQU $8d
DEF RandNext     EQU $8e
