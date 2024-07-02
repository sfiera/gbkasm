; Disassembly of "gbkiss.gb"

def FILE_ICON  equ %00010000  ; extra $C0 or $60 bytes after title
def FILE_2BPP  equ %00001000  ; icon is 2bpp ($C0 bytes)
def FILE_1BPP  equ %00000000  ; icon is 1bpp ($60 bytes)
def FILE_EXEC  equ %00000100  ; executable
def FILE_DATA  equ %00000000  ; non-executable
def FILE_A008  equ %00000010  ; must be installed to base addr $A008
def FILE_HIST  equ %00000001  ; extra $2E bytes after title/icon

DEF BTN_A EQU 0
DEF BTN_B EQU 1
DEF BTN_SEL EQU 2
DEF BTN_STA EQU 3
DEF BTN_RT EQU 4
DEF BTN_LT EQU 5
DEF BTN_UP EQU 6
DEF BTN_DN EQU 7

DEF CartridgeCodeAddr  EQU $0014
DEF CART_BDAMAN        EQU $01
DEF CART_POKEBOM       EQU $02
DEF CART_NECTARIS      EQU $03
DEF CART_DAIKAIJU      EQU $04
DEF CART_POKEFAM       EQU $06
DEF CART_ROBOPON       EQU $08
DEF CART_MINIGAME      EQU $fe
DEF CART_BUILTIN       EQU $ff  ; file can run without installation
DEF CART_ANY           EQU $00  ; file can run anywhere after installation
