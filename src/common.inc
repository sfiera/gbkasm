; Disassembly of "gbkiss.gb"

def FILE_ICON_F  equ 4  ; extra $C0 or $60 bytes after title
def FILE_2BPP_F  equ 3  ; icon is 2bpp ($C0 bytes)
def FILE_EXEC_F  equ 2  ; executable
def FILE_A008_F  equ 1  ; must be installed to base addr $A008
def FILE_HIST_F  equ 0  ; extra $2E bytes after title/icon

def FILE_ICON  equ %00010000  ; extra $C0 or $60 bytes after title
def FILE_2BPP  equ %00001000  ; icon is 2bpp ($C0 bytes)
def FILE_1BPP  equ %00000000  ; icon is 1bpp ($60 bytes)
def FILE_EXEC  equ %00000100  ; executable
def FILE_DATA  equ %00000000  ; non-executable
def FILE_A008  equ %00000010  ; must be installed to base addr $A008
def FILE_HIST  equ %00000001  ; extra $2E bytes after title/icon

DEF FILE_TYPE_OFFSET EQU 5
DEF FILE_HIST_SIZE EQU 2 + 11 + 11 + 11 + 11

DEF BTN_A_F    EQU 0
DEF BTN_B_F    EQU 1
DEF BTN_SEL_F  EQU 2
DEF BTN_STA_F  EQU 3
DEF BTN_RT_F   EQU 4
DEF BTN_LT_F   EQU 5
DEF BTN_UP_F   EQU 6
DEF BTN_DN_F   EQU 7

DEF BTN_A    EQU 1 << BTN_A_F                       ; $01
DEF BTN_B    EQU 1 << BTN_B_F                       ; $02
DEF BTN_SEL  EQU 1 << BTN_SEL_F                     ; $04
DEF BTN_STA  EQU 1 << BTN_STA_F                     ; $08
DEF BTN_RT   EQU 1 << BTN_RT_F                      ; $10
DEF BTN_LT   EQU 1 << BTN_LT_F                      ; $20
DEF BTN_UP   EQU 1 << BTN_UP_F                      ; $40
DEF BTN_DN   EQU 1 << BTN_DN_F                      ; $80
DEF BTN_AB   EQU BTN_A | BTN_B                      ; $03
DEF BTN_DIR  EQU BTN_RT | BTN_LT | BTN_UP | BTN_DN  ; $f0

DEF CartridgeCodeAddr  EQU $0014
DEF CART_BDAMAN        EQU $01
DEF CART_POKEBOM       EQU $02
DEF CART_NECTARIS      EQU $03
DEF CART_DAIKAIJU      EQU $04
DEF CART_POKEFAM       EQU $06
DEF CART_ROBOPON       EQU $08
DEF CART_MINIGAME      EQU $fe
DEF CART_NOTINST       EQU $ff  ; file not installed; install failed or unnecessary
DEF CART_ANY           EQU $00  ; file can run anywhere after installation

DEF FG0  EQU $10  ; fg=#fff
DEF FG1  EQU $11  ; fg=#aaa
DEF FG2  EQU $12  ; fg=#555
DEF FG3  EQU $13  ; fg=#000
DEF BG0  EQU $14  ; bg=#fff
DEF BG1  EQU $15  ; bg=#aaa
DEF BG2  EQU $16  ; bg=#555
DEF BG3  EQU $17  ; bg=#000
