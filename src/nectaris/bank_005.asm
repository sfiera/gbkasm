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

ScreenTitleScreen::
    screen TitleScreen
ScreenWinScreen::
    screen WinScreen

WinScreen:
.map
    INCBIN "gfx/nectaris/win.map", 20
.tiles
    INCBIN "gfx/nectaris/win.2bpp"

ScreenGameOver::
    screen GameOver
ScreenWorldMap::
    screen WorldMap
Screen5::
    screen screen_0c_4000
Screen6::
    screen screen_0c_4d28
Screen7::
    screen screen_0c_5eb0
Screen8::
    screen screen_0c_6e68
Screen9::
    screen Splash1
Screen10::
    screen Splash2
Screen11::
    screen Splash3
Screen12::
    screen Splash4
Screen13::
    screen Splash5
Screen14::
    screen screen_10_4000
Screen15::
    screen screen_10_4b58
Screen16::
    screen screen_10_5490
Screen17::
    screen screen_10_5b68
Screen18::
    screen screen_10_6230
ScreenFactoryTaken::
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
    laddr map_0b_4000
    laddr map_0b_41c6
    laddr map_0b_4392
    laddr map_0b_46e8
    laddr map_0b_4a44
    laddr map_0b_4d82
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

    laddr map_08_4000
    laddr map_08_40e0
    laddr map_08_41c9
    laddr map_08_42a6
    laddr map_08_4377
    laddr map_08_445d
    laddr map_08_453d
    laddr map_08_4623
    laddr map_08_470c
    laddr map_08_47ef
    laddr map_08_48d5
    laddr map_08_4a71
    laddr map_08_4c37
    laddr map_08_4de8
    laddr map_08_4f96
    laddr map_08_5159
    laddr map_08_5337
    laddr map_08_54d6
    laddr map_08_5681
    laddr map_08_5823
    laddr map_08_59ec
    laddr map_08_5ba9
    laddr map_08_5d69
    laddr map_08_5f2f
    laddr map_08_60ec
    laddr map_08_62be
    laddr map_08_649c
    laddr map_08_668c
    laddr map_08_6834
    laddr map_08_69fd
    laddr map_08_6bab
    laddr map_08_6f16
    laddr map_08_7281
    laddr map_08_75ec
    laddr map_08_7954
    laddr map_08_7c8f
    laddr map_09_4000
    laddr map_09_4365
    laddr map_09_46af
    laddr map_09_4a1a
    laddr map_09_4e56
    laddr map_09_4d85
    laddr map_09_53ab
    laddr map_09_5040

    laddr map_0b_50ea
    laddr map_0b_51d0
    laddr map_0b_52bc
    laddr map_0b_53c0
    laddr map_0b_549a
    laddr map_0b_565d
    laddr map_0b_5844
    laddr map_0b_59f8
    laddr map_0b_5bd0
    laddr map_0b_5da5
    laddr map_0b_5f92
    laddr map_0b_6146
    laddr map_0b_62f4
    laddr map_0b_665f
    laddr map_0b_69b5
    laddr map_0b_6d05
    laddr map_11_4000
    laddr map_11_40e6
    laddr map_11_41d5
    laddr map_11_42dc
    laddr map_11_4474
    laddr map_11_464e
    laddr map_11_4801
    laddr map_11_49fa
    laddr map_11_4bd2
    laddr map_11_4f14
    laddr map_11_525f
    laddr map_11_559b
    laddr map_11_58e6
    laddr map_11_5c31
    laddr map_11_5f7c
    laddr map_11_62c1

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
