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

SECTION "nectaris/map_list: Map List", ROMX

Maps::
    laddr MapA01Steven
    laddr MapA02Astral
    laddr MapA03Heckle
    laddr MapA04Reming
    laddr MapA05Steyer
    laddr MapA06Walthe
    laddr MapA07Numbut
    laddr MapA08Gustaf
    laddr MapA09Dardic
    laddr MapA10Keslle
    laddr MapA11Browny
    laddr MapA12Bereto
    laddr MapA13Grener
    laddr MapA14Regert
    laddr MapA15Salama
    laddr MapA16Zonect

    laddr MapB01Revolt
    laddr MapB02Icarus
    laddr MapB03Cyrano
    laddr MapB04Ramsey
    laddr MapB05Newton
    laddr MapB06Seneca
    laddr MapB07Sabine
    laddr MapB08Aratus
    laddr MapB09Galois
    laddr MapB10Darwin
    laddr MapB11Pascal
    laddr MapB12Halley
    laddr MapB13Borman
    laddr MapB14Appolo
    laddr MapB15Kaiser
    laddr MapB16Nector

    laddr MapE01
    laddr MapE02
    laddr MapE03
    laddr MapE04
    laddr MapE05
    laddr MapE06
    laddr MapE07
    laddr MapE08
    laddr MapE09
    laddr MapE10
    laddr MapE11
    laddr MapE12
    laddr MapE13
    laddr MapE14
    laddr MapE15
    laddr MapE16
    laddr MapE17
    laddr MapE18
    laddr MapE19
    laddr MapE20
    laddr MapE21
    laddr MapE22
    laddr MapE23
    laddr MapE24
    laddr MapE25
    laddr MapE26
    laddr MapE27
    laddr MapE28
    laddr MapE29
    laddr MapE30
    laddr MapE31
    laddr MapE32
    laddr MapE33
    laddr MapE34
    laddr MapE35
    laddr MapE36
    laddr MapE37
    laddr MapE38
    laddr MapE39
    laddr MapE40
    laddr MapE41
    laddr MapE42
    laddr MapE43
    laddr MapE44

    laddr MapC01Nevets
    laddr MapC02Lartsa
    laddr MapC03Elkceh
    laddr MapC04Gnimer
    laddr MapC05Reyets
    laddr MapC06Ehtlaw
    laddr MapC07Tubmun
    laddr MapC08Fatsug
    laddr MapC09Cidrad
    laddr MapC10Ellsek
    laddr MapC11Ynworb
    laddr MapC12Otereb
    laddr MapC13Renerg
    laddr MapC14Treger
    laddr MapC15Amalas
    laddr MapC16Tcenoz

    laddr MapD01Tlover
    laddr MapD02Suraci
    laddr MapD03Onaryc
    laddr MapD04Yesmar
    laddr MapD05Notwen
    laddr MapD06Acenes
    laddr MapD07Enibas
    laddr MapD08Sutara
    laddr MapD09Siolag
    laddr MapD10Niwrad
    laddr MapD11Lacsap
    laddr MapD12Yellah
    laddr MapD13Namrob
    laddr MapD14Oloppa
    laddr MapD15Resiak
    laddr MapD16Rotcen

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
