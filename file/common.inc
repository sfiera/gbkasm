; Disassembly of "gbkiss.gb"

def kFileHasIcon2bpp     equ %00011000  ; extra $c0 bytes after title
def kFileHasIcon1bpp     equ %00010000  ; extra $60 bytes after title
def kFileBit4            equ %00001000
def kFileMarkerDiamond   equ %00000110  ; executable
def kFileMarkerCircle    equ %00000100  ; executable
def kFileMarkerTriangle  equ %00000000  ; non-executable
def kFileHasTransfers    equ %00000001  ; extra $2e bytes after title/icon

DEF BtnA EQU 0
DEF BtnB EQU 1
DEF BtnSel EQU 2
DEF BtnSta EQU 3
DEF BtnRt EQU 4
DEF BtnLt EQU 5
DEF BtnUp EQU 6
DEF BtnDn EQU 7

DEF CartridgeCodeAddress             EQU $0014
DEF CartridgeCodeSuperBDaman         EQU $01
DEF CartridgeCodePocketBomberman     EQU $02
DEF CartridgeCodeNectaris            EQU $03
DEF CartridgeCodeDaikaijuMonogatari  EQU $04
DEF CartridgeCodePocketFamily        EQU $06
DEF CartridgeCodeRobotPoncots        EQU $08
DEF CartridgeCodeGBKissMiniGames     EQU $fe
DEF CartridgeCodeBuiltIn             EQU $ff  ; file can run without installation
DEF CartridgeCodeUniversal           EQU $00  ; file can run anywhere after installation
