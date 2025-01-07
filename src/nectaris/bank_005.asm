; Disassembly of "Nectaris GB (Japan) (SGB Enhanced).gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "consts.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

MACRO dbw
    db \1
    dw \2
ENDM

MACRO laddr
    dbw BANK(\1), \1
ENDM

MACRO screen
    laddr \1.map
    laddr \1.tiles
ENDM

SECTION "ROM Bank $005", ROMX[$4000], BANK[$5]

    screen TitleScreen
    screen WinScreen

WinScreen:
.map
    INCBIN "gfx/nectaris/win.map", 20
.tiles
    INCBIN "gfx/nectaris/win.2bpp"

    screen GameOver
    screen WorldMap
    dbw $0c, $4000
    dbw $0c, $4168
    dbw $0c, $4d28
    dbw $0c, $4e90
    dbw $0c, $5eb0
    dbw $0c, $6018
    dbw $0c, $6e68
    dbw $0c, $6fd0
    screen Splash1
    screen Splash2
    screen Splash3
    screen Splash4
    screen Splash5
    dbw $10, $4000
    dbw $10, $4168
    dbw $10, $4b58
    dbw $10, $4cc0
    dbw $10, $5490
    dbw $10, $55f8
    dbw $10, $5b68
    dbw $10, $5cd0
    dbw $10, $6230
    dbw $10, $6398
    dbw $0a, $4000
    dbw $0a, $4168

    dbw $06, $64dd
    dbw $06, $65ab
    dbw $06, $6688
    dbw $06, $675f
    dbw $06, $684b
    dbw $06, $69ed
    dbw $06, $6bb3
    dbw $06, $6d8e
    dbw $06, $6f4b
    dbw $06, $7153
    dbw $0b, $4000
    dbw $0b, $41c6
    dbw $0b, $4392
    dbw $0b, $46e8
    dbw $0b, $4a44
    dbw $0b, $4d82
    dbw $06, $4000
    dbw $06, $40ce
    dbw $06, $41ab
    dbw $06, $4282
    dbw $06, $440e
    dbw $06, $459a
    dbw $06, $4735
    dbw $06, $48ec
    dbw $06, $4ad9
    dbw $06, $4e1e
    dbw $06, $5169
    dbw $06, $54ae
    dbw $06, $57f6
    dbw $06, $5b20
    dbw $06, $5e4d
    dbw $06, $6192
    dbw $08, $4000
    dbw $08, $40e0
    dbw $08, $41c9
    dbw $08, $42a6
    dbw $08, $4377
    dbw $08, $445d
    dbw $08, $453d
    dbw $08, $4623
    dbw $08, $470c
    dbw $08, $47ef
    dbw $08, $48d5
    dbw $08, $4a71
    dbw $08, $4c37
    dbw $08, $4de8
    dbw $08, $4f96
    dbw $08, $5159
    dbw $08, $5337
    dbw $08, $54d6
    dbw $08, $5681
    dbw $08, $5823
    dbw $08, $59ec
    dbw $08, $5ba9
    dbw $08, $5d69
    dbw $08, $5f2f
    dbw $08, $60ec
    dbw $08, $62be
    dbw $08, $649c
    dbw $08, $668c
    dbw $08, $6834
    dbw $08, $69fd
    dbw $08, $6bab
    dbw $08, $6f16
    dbw $08, $7281
    dbw $08, $75ec
    dbw $08, $7954
    dbw $08, $7c8f
    dbw $09, $4000
    dbw $09, $4365
    dbw $09, $46af
    dbw $09, $4a1a
    dbw $09, $4e56
    dbw $09, $4d85
    dbw $09, $53ab
    dbw $09, $5040
    dbw $0b, $50ea
    dbw $0b, $51d0
    dbw $0b, $52bc
    dbw $0b, $53c0
    dbw $0b, $549a
    dbw $0b, $565d
    dbw $0b, $5844
    dbw $0b, $59f8
    dbw $0b, $5bd0
    dbw $0b, $5da5
    dbw $0b, $5f92
    dbw $0b, $6146
    dbw $0b, $62f4
    dbw $0b, $665f
    dbw $0b, $69b5
    dbw $0b, $6d05
    dbw $11, $4000
    dbw $11, $40e6
    dbw $11, $41d5
    dbw $11, $42dc
    dbw $11, $4474
    dbw $11, $464e
    dbw $11, $4801
    dbw $11, $49fa
    dbw $11, $4bd2
    dbw $11, $4f14
    dbw $11, $525f
    dbw $11, $559b
    dbw $11, $58e6
    dbw $11, $5c31
    dbw $11, $5f7c
    dbw $11, $62c1

    db $53, $54, $45, $56, $45, $4e, $ff, $ff
    db $41, $53, $54, $52, $41, $4c, $ff, $ff
    db $48, $45, $43, $4b, $4c, $45, $ff, $ff
    db $52, $45, $4d, $49, $4e, $47, $ff, $ff
    db $53, $54, $45, $59, $45, $52, $ff, $ff
    db $57, $41, $4c, $54, $48, $45, $ff, $ff
    db $4e, $55, $4d, $42, $55, $54, $ff, $ff
    db $47, $55, $53, $54, $41, $46, $ff, $ff
    db $44, $41, $52, $44, $49, $43, $ff, $ff
    db $4b, $45, $53, $4c, $4c, $45, $ff, $ff
    db $42, $52, $4f, $57, $4e, $59, $ff, $ff
    db $42, $45, $52, $45, $54, $4f, $ff, $ff
    db $47, $52, $45, $4e, $45, $52, $ff, $ff
    db $52, $45, $47, $45, $52, $54, $ff, $ff
    db $53, $41, $4c, $41, $4d, $41, $ff, $ff
    db $5a, $4f, $4e, $45, $43, $54, $ff, $ff
    db $52, $45, $56, $4f, $4c, $54, $ff, $ff
    db $49, $43, $41, $52, $55, $53, $ff, $ff
    db $43, $59, $52, $41, $4e, $4f, $ff, $ff
    db $52, $41, $4d, $53, $45, $59, $ff, $ff
    db $4e, $45, $57, $54, $4f, $4e, $ff, $ff
    db $53, $45, $4e, $45, $43, $41, $ff, $ff
    db $53, $41, $42, $49, $4e, $45, $ff, $ff
    db $41, $52, $41, $54, $55, $53, $ff, $ff
    db $47, $41, $4c, $4f, $49, $53, $ff, $ff
    db $44, $41, $52, $57, $49, $4e, $ff, $ff
    db $50, $41, $53, $43, $41, $4c, $ff, $ff
    db $48, $41, $4c, $4c, $45, $59, $ff, $ff
    db $42, $4f, $52, $4d, $41, $4e, $ff, $ff
    db $41, $50, $50, $4f, $4c, $4f, $ff, $ff
    db $4b, $41, $49, $53, $45, $52, $ff, $ff
    db $4e, $45, $43, $54, $4f, $52, $ff, $ff
    db $45, $4d, $41, $50, $30, $31, $ff, $ff
    db $45, $4d, $41, $50, $30, $32, $ff, $ff
    db $45, $4d, $41, $50, $30, $33, $ff, $ff
    db $45, $4d, $41, $50, $30, $34, $ff, $ff
    db $45, $4d, $41, $50, $30, $35, $ff, $ff
    db $45, $4d, $41, $50, $30, $36, $ff, $ff
    db $45, $4d, $41, $50, $30, $37, $ff, $ff
    db $45, $4d, $41, $50, $30, $38, $ff, $ff
    db $45, $4d, $41, $50, $30, $39, $ff, $ff
    db $45, $4d, $41, $50, $31, $30, $ff, $ff
    db $45, $4d, $41, $50, $31, $31, $ff, $ff
    db $45, $4d, $41, $50, $31, $32, $ff, $ff
    db $45, $4d, $41, $50, $31, $33, $ff, $ff
    db $45, $4d, $41, $50, $31, $34, $ff, $ff
    db $45, $4d, $41, $50, $31, $35, $ff, $ff
    db $45, $4d, $41, $50, $31, $36, $ff, $ff
    db $45, $4d, $41, $50, $31, $37, $ff, $ff
    db $45, $4d, $41, $50, $31, $38, $ff, $ff
    db $45, $4d, $41, $50, $31, $39, $ff, $ff
    db $45, $4d, $41, $50, $32, $30, $ff, $ff
    db $45, $4d, $41, $50, $32, $31, $ff, $ff
    db $45, $4d, $41, $50, $32, $32, $ff, $ff
    db $45, $4d, $41, $50, $32, $33, $ff, $ff
    db $45, $4d, $41, $50, $32, $34, $ff, $ff
    db $45, $4d, $41, $50, $32, $35, $ff, $ff
    db $45, $4d, $41, $50, $32, $36, $ff, $ff
    db $45, $4d, $41, $50, $32, $37, $ff, $ff
    db $45, $4d, $41, $50, $32, $38, $ff, $ff
    db $45, $4d, $41, $50, $32, $39, $ff, $ff
    db $45, $4d, $41, $50, $33, $30, $ff, $ff
    db $45, $4d, $41, $50, $33, $31, $ff, $ff
    db $45, $4d, $41, $50, $33, $32, $ff, $ff
    db $45, $4d, $41, $50, $33, $33, $ff, $ff
    db $45, $4d, $41, $50, $33, $34, $ff, $ff
    db $45, $4d, $41, $50, $33, $35, $ff, $ff
    db $45, $4d, $41, $50, $33, $36, $ff, $ff
    db $45, $4d, $41, $50, $33, $37, $ff, $ff
    db $45, $4d, $41, $50, $33, $38, $ff, $ff
    db $45, $4d, $41, $50, $33, $39, $ff, $ff
    db $45, $4d, $41, $50, $34, $30, $ff, $ff
    db $45, $4d, $41, $50, $34, $31, $ff, $ff
    db $45, $4d, $41, $50, $34, $32, $ff, $ff
    db $45, $4d, $41, $50, $34, $33, $ff, $ff
    db $45, $4d, $41, $50, $34, $34, $ff, $ff
    db $4e, $45, $56, $45, $54, $53, $ff, $ff
    db $4c, $41, $52, $54, $53, $41, $ff, $ff
    db $45, $4c, $4b, $43, $45, $48, $ff, $ff
    db $47, $4e, $49, $4d, $45, $52, $ff, $ff
    db $52, $45, $59, $45, $54, $53, $ff, $ff
    db $45, $48, $54, $4c, $41, $57, $ff, $ff
    db $54, $55, $42, $4d, $55, $4e, $ff, $ff
    db $46, $41, $54, $53, $55, $47, $ff, $ff
    db $43, $49, $44, $52, $41, $44, $ff, $ff
    db $45, $4c, $4c, $53, $45, $4b, $ff, $ff
    db $59, $4e, $57, $4f, $52, $42, $ff, $ff
    db $4f, $54, $45, $52, $45, $42, $ff, $ff
    db $52, $45, $4e, $45, $52, $47, $ff, $ff
    db $54, $52, $45, $47, $45, $52, $ff, $ff
    db $41, $4d, $41, $4c, $41, $53, $ff, $ff
    db $54, $43, $45, $4e, $4f, $5a, $ff, $ff
    db $54, $4c, $4f, $56, $45, $52, $ff, $ff
    db $53, $55, $52, $41, $43, $49, $ff, $ff
    db $4f, $4e, $41, $52, $59, $43, $ff, $ff
    db $59, $45, $53, $4d, $41, $52, $ff, $ff
    db $4e, $4f, $54, $57, $45, $4e, $ff, $ff
    db $41, $43, $45, $4e, $45, $53, $ff, $ff
    db $45, $4e, $49, $42, $41, $53, $ff, $ff
    db $53, $55, $54, $41, $52, $41, $ff, $ff
    db $53, $49, $4f, $4c, $41, $47, $ff, $ff
    db $4e, $49, $57, $52, $41, $44, $ff, $ff
    db $4c, $41, $43, $53, $41, $50, $ff, $ff
    db $59, $45, $4c, $4c, $41, $48, $ff, $ff
    db $4e, $41, $4d, $52, $4f, $42, $ff, $ff
    db $4f, $4c, $4f, $50, $50, $41, $ff, $ff
    db $52, $45, $53, $49, $41, $4b, $ff, $ff
    db $52, $4f, $54, $43, $45, $4e, $ff, $ff
