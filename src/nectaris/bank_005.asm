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
    screen FactoryTaken

Maps::
    laddr map_06_64dd
    laddr map_06_65ab
    laddr map_06_6688
    laddr map_06_675f
    laddr map_06_684b
    laddr map_06_69ed
    laddr map_06_6bb3
    laddr map_06_6d8e
    laddr map_06_6f4b
    laddr map_06_7153
    dbw $0b, $4000
    dbw $0b, $41c6
    dbw $0b, $4392
    dbw $0b, $46e8
    dbw $0b, $4a44
    dbw $0b, $4d82
    laddr map_06_4000
    laddr map_06_40ce
    laddr map_06_41ab
    laddr map_06_4282
    laddr map_06_440e
    laddr map_06_459a
    laddr map_06_4735
    laddr map_06_48ec
    laddr map_06_4ad9
    laddr map_06_4e1e
    laddr map_06_5169
    laddr map_06_54ae
    laddr map_06_57f6
    laddr map_06_5b20
    laddr map_06_5e4d
    laddr map_06_6192

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

Passwords::
    db "STEVEN", -1, -1
    db "ASTRAL", -1, -1
    db "HECKLE", -1, -1
    db "REMING", -1, -1
    db "STEYER", -1, -1
    db "WALTHE", -1, -1
    db "NUMBUT", -1, -1
    db "GUSTAF", -1, -1
    db "DARDIC", -1, -1
    db "KESLLE", -1, -1
    db "BROWNY", -1, -1
    db "BERETO", -1, -1
    db "GRENER", -1, -1
    db "REGERT", -1, -1
    db "SALAMA", -1, -1
    db "ZONECT", -1, -1
    db "REVOLT", -1, -1
    db "ICARUS", -1, -1
    db "CYRANO", -1, -1
    db "RAMSEY", -1, -1
    db "NEWTON", -1, -1
    db "SENECA", -1, -1
    db "SABINE", -1, -1
    db "ARATUS", -1, -1
    db "GALOIS", -1, -1
    db "DARWIN", -1, -1
    db "PASCAL", -1, -1
    db "HALLEY", -1, -1
    db "BORMAN", -1, -1
    db "APPOLO", -1, -1
    db "KAISER", -1, -1
    db "NECTOR", -1, -1

    db "EMAP01", -1, -1
    db "EMAP02", -1, -1
    db "EMAP03", -1, -1
    db "EMAP04", -1, -1
    db "EMAP05", -1, -1
    db "EMAP06", -1, -1
    db "EMAP07", -1, -1
    db "EMAP08", -1, -1
    db "EMAP09", -1, -1
    db "EMAP10", -1, -1
    db "EMAP11", -1, -1
    db "EMAP12", -1, -1
    db "EMAP13", -1, -1
    db "EMAP14", -1, -1
    db "EMAP15", -1, -1
    db "EMAP16", -1, -1
    db "EMAP17", -1, -1
    db "EMAP18", -1, -1
    db "EMAP19", -1, -1
    db "EMAP20", -1, -1
    db "EMAP21", -1, -1
    db "EMAP22", -1, -1
    db "EMAP23", -1, -1
    db "EMAP24", -1, -1
    db "EMAP25", -1, -1
    db "EMAP26", -1, -1
    db "EMAP27", -1, -1
    db "EMAP28", -1, -1
    db "EMAP29", -1, -1
    db "EMAP30", -1, -1
    db "EMAP31", -1, -1
    db "EMAP32", -1, -1
    db "EMAP33", -1, -1
    db "EMAP34", -1, -1
    db "EMAP35", -1, -1
    db "EMAP36", -1, -1
    db "EMAP37", -1, -1
    db "EMAP38", -1, -1
    db "EMAP39", -1, -1
    db "EMAP40", -1, -1
    db "EMAP41", -1, -1
    db "EMAP42", -1, -1
    db "EMAP43", -1, -1
    db "EMAP44", -1, -1

    db "NEVETS", -1, -1
    db "LARTSA", -1, -1
    db "ELKCEH", -1, -1
    db "GNIMER", -1, -1
    db "REYETS", -1, -1
    db "EHTLAW", -1, -1
    db "TUBMUN", -1, -1
    db "FATSUG", -1, -1
    db "CIDRAD", -1, -1
    db "ELLSEK", -1, -1
    db "YNWORB", -1, -1
    db "OTEREB", -1, -1
    db "RENERG", -1, -1
    db "TREGER", -1, -1
    db "AMALAS", -1, -1
    db "TCENOZ", -1, -1
    db "TLOVER", -1, -1
    db "SURACI", -1, -1
    db "ONARYC", -1, -1
    db "YESMAR", -1, -1
    db "NOTWEN", -1, -1
    db "ACENES", -1, -1
    db "ENIBAS", -1, -1
    db "SUTARA", -1, -1
    db "SIOLAG", -1, -1
    db "NIWRAD", -1, -1
    db "LACSAP", -1, -1
    db "YELLAH", -1, -1
    db "NAMROB", -1, -1
    db "OLOPPA", -1, -1
    db "RESIAK", -1, -1
    db "ROTCEN", -1, -1
