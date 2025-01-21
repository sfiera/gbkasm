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
INCLUDE "nectaris/map.inc"
INCLUDE "nectaris/units.inc"

SECTION "nectaris/map_contest: Map E01", ROMX

MapE01::
    map "+~~+++++++++++M ", \
        "+ +  #  ~  ~  +M", \
        "+++  ~#f ~ ~ o+M", \
        "+   o~## oo   +M", \
        "+   Mo~~#o~ G ++", \
        "+  U  oo##~M  +o", \
        "++++ ~o ~ #   + ", \
        "+~M+ o  f #M  + ", \
        "+M~+ + +~+#+M+++", \
        "+MM++M+ + + + MM", \
        "+~MM ~M~   M~MM "
    db OWN | MUNKS, $00 | $04, $07
    db OWN | BISON, $00 | $02, $08
    db OWN | RABBIT, $00 | $02, $05
    db OWN | BISON, $40 | $08, $07
    db OWN | BISON, $40 | $08, $07
    db FOE | SLAGGER, $20 | $07, $02
    db FOE | SLAGGER, $20 | $07, $02
    db FOE | MONSTER, $20 | $07, $02
    db FOE | DARBEK, $20 | $07, $02
    db FOE | BISON, $00 | $0b, $01
    db FOE | SLAGGER, $00 | $0d, $02
    db FOE | BISON, $00 | $0d, $06
    db FOE | MUNKS, $00 | $0b, $03
    db OWN | RABBIT, $40 | $08, $07
    db OWN | LYNX, $40 | $08, $07
    db $ff

SECTION "nectaris/map_contest: Map E02", ROMX

MapE02::
    map "~~~~++++++++++++", \
        "~~~ +~     f   o", \
        "~~U ++   ~   ~oo", \
        "~~    ++oo    oo", \
        "MM    M+     ooo", \
        "MMMM   o++    o ", \
        "MMMMM oo  ++    ", \
        "MMMMMMoooo +++++", \
        "MMMMMM M o +G   ", \
        "MMMMMMMMMMo+    ", \
        "MMMMMMM~MM M M M"
    db OWN | DARBEK, $20 | $0b, $01
    db FOE | BISON, $00 | $0c, $01
    db FOE | ESTOL, $00 | $0e, $01
    db OWN | BISON, $00 | $02, $02
    db FOE | MUNKS, $00 | $0d, $07
    db FOE | LENET, $00 | $0c, $08
    db OWN | RABBIT, $00 | $04, $00
    db OWN | DARBEK, $00 | $04, $02
    db OWN | BISON, $00 | $05, $02
    db OWN | BISON, $00 | $03, $00
    db OWN | RABBIT, $00 | $03, $01
    db OWN | MUNKS, $00 | $04, $04
    db FOE | BISON, $00 | $0d, $00
    db FOE | DARBEK, $00 | $01, $06
    db FOE | DARBEK, $00 | $02, $08
    db FOE | BISON, $20 | $0b, $01
    db FOE | MUNKS, $00 | $0e, $02
    db FOE | BISON, $00 | $0b, $00
    db $ff

SECTION "nectaris/map_contest: Map E03", ROMX

MapE03::
    map "M o    o M  M g ", \
        "MMG ~M    M  o M", \
        "MM   MM~  MM   M", \
        "MM MMM M   M M  ", \
        "MM  Mo MMM    oo", \
        "M o oo MM  ~~~oo", \
        "  oo      ~~~~  ", \
        "MMo  MMMM ~o~ U ", \
        "MMu MMMM ~ oo  ~", \
        "MM  MMM oo   MMM", \
        "MMM MMM oM~~MMM "
    db OWN | DILLO, $40 | $02, $08
    db OWN | GRIZZLY, $40 | $02, $08
    db FOE | SLAGGER, $20 | $0e, $00
    db FOE | MONSTER, $20 | $0e, $00
    db FOE | LENET, $20 | $0e, $00
    db FOE | MONSTER, $00 | $02, $01
    db FOE | DARBEK, $00 | $04, $02
    db OWN | MUNKS, $40 | $02, $08
    db OWN | RABBIT, $00 | $0d, $06
    db OWN | LYNX, $00 | $0d, $07
    db FOE | RABBIT, $00 | $02, $03
    db FOE | SLAGGER, $00 | $04, $00
    db FOE | MUNKS, $20 | $0e, $00
    db OWN | DILLO, $00 | $0e, $07
    db $ff

SECTION "nectaris/map_contest: Map E04", ROMX

MapE04::
    map "MM+MMMM~~MMM +oo", \
        "Mo++~~M~~MMM +o~", \
        "    + ~  MMMM+ ~", \
        "o U +     M  +~~", \
        "oo ++M     oo+~~", \
        "oo+ ~M     ++ ~ ", \
        "oo+~  M MM + G M", \
        "  +~~~MMM  +   M", \
        "  + ~~MMMMMM++~M", \
        "   M o  MMMM +~M", \
        "MMM M oMMoMMMMM "
    db OWN | BISON, $00 | $03, $01
    db FOE | BISON, $00 | $0d, $04
    db FOE | BISON, $00 | $0b, $07
    db FOE | GRIZZLY, $00 | $0b, $05
    db OWN | BISON, $00 | $05, $03
    db FOE | MUNKS, $00 | $0e, $05
    db FOE | MUNKS, $00 | $0d, $07
    db OWN | MUNKS, $00 | $04, $05
    db OWN | MUNKS, $00 | $03, $02
    db OWN | LENET, $00 | $04, $06
    db $ff

SECTION "nectaris/map_contest: Map E05", ROMX

MapE05::
    map "M        UM MM  ", \
        "             M M", \
        "M  MMMMM M    M ", \
        "   MMMMMMMMM    ", \
        "   MMMMMMMMMMMMM", \
        "f   MMMMMMMMMMMM", \
        "      MMMMMMMMMM", \
        "M     M MMM   MM", \
        " M M M  M   G MM", \
        "MMMMMMMM MMMMMMM", \
        "M M M~MMMMMMM M "
    db OWN | BISON, $00 | $04, $00
    db FOE | SLAGGER, $00 | $0d, $08
    db FOE | BISON, $00 | $06, $08
    db FOE | RABBIT, $00 | $07, $07
    db OWN | LYNX, $00 | $08, $02
    db OWN | BISON, $00 | $0a, $01
    db OWN | LENET, $00 | $01, $00
    db FOE | MUNKS, $00 | $02, $08
    db OWN | DARBEK, $00 | $03, $00
    db FOE | BISON, $00 | $0d, $07
    db OWN | MUNKS, $00 | $0b, $02
    db FOE | MUNKS, $00 | $04, $07
    db FOE | MONSTER, $00 | $0c, $08
    db FOE | BISON, $00 | $0c, $07
    db OWN | BISON, $20 | $00, $05
    db OWN | NASHORN, $20 | $00, $05
    db OWN | RABBIT, $20 | $00, $05
    db $ff

SECTION "nectaris/map_contest: Map E06", ROMX

MapE06::
    map "MMMMMM##~~~~~  M", \
        "MMM   ~#~f~~~  M", \
        "M    ~ *++++~~  ", \
        "  ~  ++#~   ++  ", \
        "   ++~~# ~  ~~+ ", \
        "~  +~~~~#~~~~ + ", \
        "U  + ~~~##~~  + ", \
        " +++ ~   M#+~+++", \
        "+  +~+ +~+*M+G ~", \
        "MMMM+ + +##    ~", \
        "MMMMMM ~ M   ~  "
    db OWN | MUNKS, $00 | $04, $05
    db OWN | MUNKS, $00 | $02, $07
    db OWN | RABBIT, $00 | $01, $04
    db OWN | RABBIT, $00 | $03, $06
    db OWN | BISON, $00 | $07, $07
    db OWN | MUNKS, $00 | $04, $03
    db FOE | DARBEK, $00 | $0d, $08
    db FOE | DARBEK, $00 | $0b, $08
    db FOE | LENET, $00 | $0c, $07
    db FOE | LENET, $00 | $0e, $07
    db FOE | SLAGGER, $00 | $0d, $07
    db OWN | BISON, $20 | $09, $01
    db OWN | BISON, $20 | $09, $01
    db FOE | MONSTER, $00 | $0a, $08
    db FOE | ESTOL, $00 | $0e, $05
    db $ff

SECTION "nectaris/map_contest: Map E07", ROMX

MapE07::
    map " U  MMMMMMMMMMMM", \
        " M  MM  MMMMMMMM", \
        "MMMM   o   MMMMM", \
        "MMMM    o MMMMMM", \
        "MMMMM  MM MMMMMM", \
        "MMMM o MMM  MMMM", \
        "MMMMMoo M o   MM", \
        "MMMM M M      MM", \
        "MMMMMMMMMMM G   ", \
        "MMMMMMMMMMMM    ", \
        "M MMMMMMMMMM ~ M"
    db OWN | BISON, $00 | $03, $00
    db OWN | MUNKS, $00 | $01, $00
    db OWN | SEEKER, $00 | $05, $02
    db OWN | HAWKEYE, $00 | $04, $02
    db FOE | MUNKS, $00 | $0c, $08
    db OWN | FALCO, $00 | $02, $03
    db OWN | JAVI, $00 | $05, $00
    db FOE | SLAGGER, $00 | $0d, $07
    db FOE | SLAGGER, $00 | $0a, $07
    db FOE | HAWKEYE, $00 | $0b, $08
    db FOE | HUNTER, $00 | $09, $08
    db FOE | FALCO, $00 | $0d, $05
    db OWN | GRIZZLY, $00 | $03, $01
    db FOE | DARBEK, $00 | $0a, $02
    db FOE | SEEKER, $00 | $0b, $05
    db FOE | LYNX, $00 | $0d, $09
    db OWN | DILLO, $00 | $05, $04
    db $ff

SECTION "nectaris/map_contest: Map E08", ROMX

MapE08::
    map "MMMMM o   ~~MMMM", \
        "MMM     u ~~MMMM", \
        "MMMM  U    o MMM", \
        "MMMM   oo   MMMM", \
        "MMM     o  ~MMMM", \
        "M     ~~ ~~~  MM", \
        " o    ~~~~~o o  ", \
        "M  g  ~~~~~     ", \
        " G   ~~~~~~   f ", \
        "   ~~~~~~~~     ", \
        " M M~M~M   ~ ~ M"
    db OWN | MUNKS, $00 | $04, $03
    db OWN | BISON, $00 | $06, $02
    db OWN | BISON, $00 | $05, $03
    db FOE | MUNKS, $00 | $02, $06
    db FOE | MUNKS, $00 | $04, $06
    db FOE | BISON, $00 | $01, $06
    db FOE | BISON, $00 | $03, $08
    db FOE | BISON, $40 | $03, $07
    db FOE | BISON, $40 | $03, $07
    db FOE | BISON, $40 | $03, $07
    db OWN | BISON, $20 | $08, $01
    db OWN | BISON, $20 | $08, $01
    db OWN | BISON, $20 | $08, $01
    db OWN | BISON, $60 | $0e, $08
    db FOE | BISON, $00 | $01, $08
    db FOE | DRAPER, $40 | $03, $07
    db OWN | DARBEK, $00 | $09, $02
    db FOE | MUNKS, $00 | $08, $09
    db $ff

SECTION "nectaris/map_contest: Map E09", ROMX

MapE09::
    map "ooo oooMoooo  MM", \
        "oo U   MMMo~~~MM", \
        "o  + M MMM ~~~MM", \
        "   + MMMMMM ~MMM", \
        "MM +~MMMoo   MMM", \
        "M  +~MMoo      M", \
        " ++MM#   +++    ", \
        " + M~~#++   +G  ", \
        " + +~+*   MM   o", \
        "o++ +~##  MMMMoo", \
        "oMoM~ ~~ MM MMoM"
    db FOE | NASHORN, $00 | $0c, $08
    db OWN | ESTOL, $00 | $03, $03
    db FOE | MONSTER, $00 | $0e, $06
    db FOE | SLAGGER, $00 | $0b, $06
    db FOE | MONSTER, $00 | $09, $07
    db FOE | SLAGGER, $00 | $09, $05
    db OWN | SEEKER, $00 | $04, $02
    db OWN | FALCO, $00 | $00, $00
    db OWN | LYNX, $00 | $01, $02
    db OWN | GRIZZLY, $00 | $02, $05
    db FOE | DARBEK, $00 | $0a, $09
    db FOE | MUNKS, $00 | $0c, $05
    db OWN | DARBEK, $00 | $03, $01
    db OWN | MUNKS, $00 | $00, $04
    db OWN | BISON, $00 | $02, $01
    db FOE | HUNTER, $00 | $0e, $09
    db $ff

SECTION "nectaris/map_contest: Map E10", ROMX

MapE10::
    map "M MMMMMMoo oo~~ ", \
        "MMU~ MM~~ooof ~M", \
        "MM    M ~~     M", \
        "MM     ~~~~~    ", \
        "MMMM ~ ~~~~~~   ", \
        "MMMM   ~~~~~~~~ ", \
        "MMMM M  ~~~~~~  ", \
        "MMMMMMMM o~~~   ", \
        "MMMMMMMM  ~ G  ~", \
        "MMMMMMMooo   MMM", \
        "M~MMMMMMo ~MMMM "
    db FOE | DARBEK, $00 | $0e, $07
    db OWN | MUNKS, $00 | $05, $02
    db OWN | RABBIT, $00 | $04, $02
    db OWN | RABBIT, $00 | $02, $03
    db OWN | NASHORN, $00 | $05, $03
    db OWN | BISON, $00 | $04, $04
    db OWN | LYNX, $00 | $03, $02
    db OWN | MONSTER, $00 | $06, $03
    db FOE | DILLO, $20 | $0c, $01
    db FOE | BISON, $20 | $0c, $01
    db FOE | NASHORN, $00 | $0d, $07
    db FOE | SLAGGER, $00 | $0a, $08
    db FOE | MONSTER, $00 | $0e, $06
    db FOE | MONSTER, $00 | $0b, $08
    db FOE | DRAPER, $00 | $0c, $09
    db FOE | GRIZZLY, $00 | $09, $08
    db FOE | RABBIT, $00 | $0b, $07
    db $ff

SECTION "nectaris/map_contest: Map E11", ROMX

MapE11::
    map "MMMMM  G ~~~MM ~", \
        "MMM    + ~~~MMM ", \
        "M      +MM M    ", \
        "     g +MMMMMM M", \
        " M M   +   MMM M", \
        " MMMM M+MMMMMMM ", \
        "  MMMM +MMM M   ", \
        "  MMMMM+       o", \
        "  M M  + + +f+ +", \
        "M      ++ +M+ + ", \
        " M   M + MMM M  ", \
        " MMMMMM+MMMMMMMM", \
        "  MMMM +MMMMMMMM", \
        "~MMMMMM+MMMMMMMM", \
        " MMMM  +  M  MMM", \
        "  MM u +~M      ", \
        "MMMMM  + MMM    ", \
        "MMM    U  M    M", \
        "M   M        MMM", \
        "            MMMM", \
        "            MMMM", \
        "   M M M   oMMMo"
    db OWN | JAVI, $00 | $09, $0e
    db OWN | FALCO, $00 | $04, $0e
    db OWN | FALCO, $00 | $0a, $12
    db FOE | HUNTER, $00 | $04, $04
    db FOE | HUNTER, $00 | $09, $05
    db FOE | HUNTER, $00 | $0b, $03
    db OWN | MUNKS, $60 | $05, $0f
    db OWN | PELICAN, $60 | $05, $0f
    db OWN | SEEKER, $60 | $05, $0f
    db OWN | HAWKEYE, $00 | $05, $11
    db FOE | MUNKS, $20 | $05, $03
    db FOE | PELICAN, $20 | $05, $03
    db FOE | SEEKER, $20 | $05, $03
    db FOE | HAWKEYE, $00 | $09, $01
    db FOE | HUNTER, $40 | $0c, $08
    db FOE | FALCO, $40 | $0c, $08
    db FOE | JAVI, $40 | $0c, $08
    db FOE | SEEKER, $00 | $06, $02
    db OWN | SEEKER, $00 | $08, $0f
    db $ff

SECTION "nectaris/map_contest: Map E12", ROMX

MapE12::
    map "~~~    ~~~~~MM~ ", \
        "   U   o~~~~ M o", \
        "       ~~~~~ M  ", \
        "     ~~~o M   M ", \
        "      ~~~~    MM", \
        "       ~~~~     ", \
        "     o  ~~~~    ", \
        "      M    f    ", \
        " ~~~   oo    ~  ", \
        "  ~    oo  o~~~ ", \
        "MM   o ~   oo~~ ", \
        "MMMM~~~~~       ", \
        "MMMM ~~~~    ~~~", \
        "MMMMM~~~    ~~~~", \
        "~ MMMM     ~~~~~", \
        " f MMMMM    ~~  ", \
        "   MM MMM G     ", \
        "MMMMM  MMM      ", \
        "MMMMMM MM   oo  ", \
        "MMMMM ~MMM  o   ", \
        "M MMM MMMMM     ", \
        " MMMMMMMMMMM M M"
    db OWN | MUNKS, $00 | $04, $03
    db OWN | DARBEK, $00 | $03, $01
    db OWN | SEEKER, $00 | $02, $03
    db OWN | JAVI, $00 | $05, $04
    db OWN | FALCO, $00 | $07, $03
    db FOE | HUNTER, $00 | $0b, $0d
    db FOE | HUNTER, $00 | $01, $0d
    db FOE | HAWKEYE, $00 | $08, $0f
    db FOE | SEEKER, $00 | $09, $0d
    db FOE | SLAGGER, $00 | $0a, $0f
    db OWN | LENET, $00 | $04, $04
    db OWN | RABBIT, $00 | $01, $01
    db OWN | RABBIT, $00 | $03, $00
    db OWN | DILLO, $20 | $0b, $07
    db OWN | BISON, $20 | $0b, $07
    db OWN | LYNX, $20 | $0b, $07
    db OWN | SEEKER, $20 | $0b, $07
    db OWN | FALCO, $20 | $0b, $07
    db FOE | RABBIT, $00 | $06, $0e
    db FOE | LYNX, $00 | $09, $0f
    db FOE | HUNTER, $40 | $01, $0f
    db OWN | PELICAN, $00 | $05, $00
    db OWN | HAWKEYE, $00 | $05, $02
    db FOE | SLAGGER, $00 | $07, $0d
    db OWN | SEEKER, $00 | $01, $04
    db FOE | MUNKS, $00 | $0a, $0e
    db FOE | MONSTER, $00 | $0a, $10
    db FOE | HUNTER, $00 | $04, $0d
    db FOE | DARBEK, $00 | $04, $10
    db FOE | DILLO, $00 | $08, $0d
    db OWN | BISON, $00 | $06, $04
    db OWN | LENET, $00 | $03, $04
    db OWN | JAVI, $40 | $01, $0f
    db $ff

SECTION "nectaris/map_contest: Map E13", ROMX

MapE13::
    map "~Moooo   ~~~~MMM", \
        "~ Moo  G  ~~ MMM", \
        "##M~   +   ~~MMM", \
        "~~#~o  +   ~~~MM", \
        "  ##  + M   f~~M", \
        "  ~#  + M MM  ~M", \
        "   ~  +f MMM  ~ ", \
        " ~~~  ++++MMM+ M", \
        " g ~ ++  ++++ MM", \
        "   ++oo  +~   MM", \
        "   +o o  +~   MM", \
        "   +oo u +      ", \
        " ++#o     ++    ", \
        "    #o    M+    ", \
        "M  ~##o## M+   M", \
        "   ~~~#  M+  MMM", \
        "MM M~~    + ~MMM", \
        "MMMMM  U  +~~ MM", \
        "MMMMMoo    ~~~ M", \
        "M oooooooo ~~   ", \
        " ooooooooooo~o  ", \
        "oMo o o oMo~o oM"
    db FOE | HUNTER, $20 | $01, $08
    db FOE | LENET, $20 | $01, $08
    db FOE | SLAGGER, $20 | $01, $08
    db OWN | HAWKEYE, $40 | $07, $0b
    db OWN | HAWKEYE, $40 | $07, $0b
    db OWN | SEEKER, $40 | $07, $0b
    db OWN | RABBIT, $40 | $07, $0b
    db OWN | DILLO, $00 | $07, $11
    db OWN | RABBIT, $00 | $0b, $12
    db FOE | DRAPER, $00 | $07, $01
    db FOE | DRAPER, $00 | $0a, $02
    db OWN | FALCO, $00 | $0b, $0c
    db FOE | HAWKEYE, $00 | $06, $05
    db OWN | PELICAN, $40 | $07, $0b
    db OWN | MUNKS, $40 | $07, $0b
    db FOE | ESTOL, $20 | $01, $08
    db FOE | SEEKER, $60 | $07, $06
    db FOE | BISON, $60 | $07, $06
    db FOE | BISON, $60 | $07, $06
    db FOE | HUNTER, $60 | $07, $06
    db OWN | JAVI, $00 | $0a, $0d
    db FOE | JAVI, $80 | $0c, $04
    db FOE | LYNX, $80 | $0c, $04
    db FOE | HUNTER, $80 | $0c, $04
    db FOE | BISON, $80 | $0c, $04
    db FOE | HUNTER, $00 | $03, $00
    db $ff

SECTION "nectaris/map_contest: Map E14", ROMX

MapE14::
    map " U MMMMMMMMMMMMM", \
        " +    MMMMMMMMMM", \
        " + + +  MMMMMMMM", \
        "MM+~+M+ MMM   MM", \
        "MMMMo+++++++++MM", \
        "MMM  + MMM f +MM", \
        "   ++MMMMMMM + M", \
        " ++MMMMMMMM  +o ", \
        "+f MMMMMMMM~~M+ ", \
        "+o MMMMMMM~###+ ", \
        "++ooMMMMM~M~~*+~", \
        " +ooMMMMM ~~+#~#", \
        "* ++  MMMM  +~#~", \
        "#M  ++ MMMMM+ ##", \
        "MMMM M+ MMM +   ", \
        "MMMMM +  + +++ +", \
        "MMMMMMg + +   + ", \
        "MMMMMM MMMMMG   ", \
        "MMMMMMMMMMMM M  ", \
        "MMMMM MMMMMMMMMM", \
        "MMMMMMMMMMMMMMMM", \
        "MMMMMMMMM M MMMM"
    db FOE | SLAGGER, $00 | $0c, $10
    db FOE | MONSTER, $00 | $0c, $11
    db FOE | ESTOL, $00 | $0b, $10
    db FOE | LYNX, $00 | $0d, $0f
    db FOE | YAMA, $00 | $0d, $0a
    db OWN | LENET, $00 | $02, $02
    db FOE | SLAGGER, $60 | $06, $10
    db FOE | RABBIT, $60 | $06, $10
    db OWN | BISON, $20 | $0b, $05
    db OWN | BISON, $20 | $0b, $05
    db OWN | BISON, $40 | $01, $08
    db OWN | RABBIT, $40 | $01, $08
    db OWN | DILLO, $40 | $01, $08
    db FOE | MUNKS, $00 | $0e, $0a
    db OWN | BISON, $00 | $04, $01
    db OWN | BISON, $00 | $04, $06
    db FOE | DRAPER, $00 | $08, $10
    db OWN | SLAGGER, $00 | $07, $0f
    db OWN | MONSTER, $00 | $06, $0f
    db FOE | NASHORN, $00 | $0c, $0d
    db FOE | MONSTER, $00 | $0e, $09
    db FOE | BISON, $00 | $0e, $12
    db FOE | RHINO, $00 | $09, $0b
    db OWN | LYNX, $20 | $0b, $05
    db OWN | MUNKS, $00 | $04, $02
    db $ff

SECTION "nectaris/map_contest: Map E15", ROMX

MapE15::
    map "    MMMMM    U  ", \
        "MM MMMMMM    ~  ", \
        "MMMMMMM o    ~~~", \
        "MMMMMM      ~ ~~", \
        "MMMMMM  oo  u ~ ", \
        "MMMMM   o       ", \
        "MMMMMM    ~   ~~", \
        "MMMMM           ", \
        "MMMMM ~~        ", \
        "MMMMM~~~~       ", \
        "MMMM  ~~~~~  ~~~", \
        "MMMMM  ~~~f  ~~~", \
        "MMM       ~ ~~~ ", \
        "M           ~  M", \
        "     g oo    MMM", \
        "o       o   MMMM", \
        " ~       ~  MMM ", \
        "   G      MMMMMM", \
        "MM       oMMMMMM", \
        "MMMM      MMMMMM", \
        "MMMMM ~   MMMMMM", \
        "M MMM~ M MM MMMM"
    db FOE | HUNTER, $60 | $05, $0e
    db FOE | FALCO, $00 | $0d, $12
    db FOE | HUNTER, $40 | $0a, $0b
    db FOE | JAVI, $40 | $0a, $0b
    db OWN | HAWKEYE, $00 | $08, $06
    db OWN | SEEKER, $20 | $0c, $04
    db OWN | SEEKER, $00 | $0a, $05
    db OWN | JAVI, $00 | $0b, $01
    db OWN | MUNKS, $00 | $0b, $04
    db OWN | MUNKS, $20 | $0c, $04
    db OWN | GRIZZLY, $00 | $0d, $05
    db FOE | SLAGGER, $00 | $07, $11
    db FOE | SLAGGER, $00 | $03, $0e
    db FOE | SEEKER, $00 | $05, $11
    db FOE | HAWKEYE, $00 | $07, $13
    db FOE | JAVI, $60 | $05, $0e
    db FOE | FALCO, $60 | $05, $0e
    db FOE | MULE, $60 | $05, $0e
    db FOE | RHINO, $60 | $05, $0e
    db FOE | LENET, $00 | $0a, $10
    db FOE | FALCO, $00 | $01, $00
    db FOE | MUNKS, $00 | $05, $12
    db FOE | HUNTER, $00 | $00, $00
    db OWN | BISON, $00 | $06, $04
    db OWN | FALCO, $00 | $09, $00
    db OWN | JAVI, $20 | $0c, $04
    db OWN | SEEKER, $00 | $0b, $0a
    db FOE | FALCO, $00 | $0b, $13
    db FOE | JAVI, $00 | $0b, $11
    db OWN | FALCO, $40 | $0a, $0b
    db OWN | FALCO, $20 | $0c, $04
    db OWN | BISON, $00 | $0d, $07
    db $ff

SECTION "nectaris/map_contest: Map E16", ROMX

MapE16::
    map "    MMMMM       ", \
        " g   MMM    u   ", \
        " +   MMMMM  +~~~", \
        " +  MMMMMMM +~~~", \
        "  + MMM MMM + ~M", \
        "  +  MMMM   + MM", \
        "  +  MMMM ~~+ MM", \
        "  + MMMMMM~~+  M", \
        "  ++MMMMMM ++  M", \
        "    + MMMM+  MMM", \
        "MM  + MMM +MMMMM", \
        "MMM+++    +MMMMM", \
        "M  + M++  + MMMM", \
        " M + MMM++++  MM", \
        "   + MMM    ++  ", \
        "M +   MMMM   +  ", \
        "  +  MMMMMMM +  ", \
        "  +  MMMMMMM G  ", \
        "  U  MMMMMMM    ", \
        "      MMMMM     ", \
        "      MMMMM     ", \
        " M M MM MMMM M  "
    db FOE | SEEKER, $00 | $0c, $10
    db FOE | SEEKER, $00 | $0c, $12
    db OWN | HAWKEYE, $00 | $02, $12
    db OWN | SEEKER, $00 | $04, $11
    db OWN | RABBIT, $00 | $03, $0e
    db FOE | HUNTER, $00 | $03, $04
    db FOE | HUNTER, $00 | $04, $02
    db FOE | DILLO, $20 | $01, $01
    db FOE | MONSTER, $20 | $01, $01
    db FOE | MONSTER, $20 | $01, $01
    db FOE | SLAGGER, $20 | $01, $01
    db FOE | SLAGGER, $20 | $01, $01
    db FOE | SLAGGER, $20 | $01, $01
    db FOE | HUNTER, $20 | $01, $01
    db FOE | HUNTER, $20 | $01, $01
    db FOE | SEEKER, $20 | $01, $01
    db FOE | SEEKER, $20 | $01, $01
    db OWN | GRIZZLY, $40 | $0c, $01
    db OWN | GRIZZLY, $40 | $0c, $01
    db OWN | JAVI, $40 | $0c, $01
    db OWN | JAVI, $40 | $0c, $01
    db OWN | SEEKER, $40 | $0c, $01
    db OWN | SEEKER, $40 | $0c, $01
    db OWN | HAWKEYE, $40 | $0c, $01
    db OWN | BISON, $40 | $0c, $01
    db OWN | BISON, $40 | $0c, $01
    db OWN | JAVI, $00 | $07, $02
    db OWN | JAVI, $00 | $09, $03
    db OWN | RABBIT, $00 | $0c, $03
    db OWN | RABBIT, $00 | $0d, $04
    db OWN | NASHORN, $00 | $0b, $04
    db OWN | LYNX, $00 | $0c, $06
    db OWN | DRAPER, $40 | $0c, $01
    db OWN | MUNKS, $00 | $0a, $02
    db FOE | DRAPER, $20 | $01, $01
    db FOE | MUNKS, $00 | $02, $03
    db FOE | RABBIT, $00 | $01, $04
    db FOE | RABBIT, $00 | $02, $05
    db FOE | HAWKEYE, $00 | $0d, $11
    db FOE | SEEKER, $00 | $0e, $0f
    db FOE | RHINO, $00 | $0d, $12
    db $ff

SECTION "nectaris/map_contest: Map E17", ROMX

MapE17::
    map "MMM  oo~~~~~ ~oo", \
        "MMMM      ~   o ", \
        "MMM  M  G    ~~~", \
        "             ~~~", \
        " g          ~M~~", \
        "         M   MM ", \
        "       MM  o MMM", \
        "       MM oo  MM", \
        "    MM        MM", \
        "o   MMM         ", \
        "oooo    f       ", \
        "o ## ##~ ~~~  MM", \
        "MM~~#M ~~MM ~~MM", \
        "MM ~##M  MM ~~MM", \
        "M ~~~#M       ~o", \
        "M ~  MMM       o", \
        "M U   M     u oo", \
        "M            ooo", \
        "MM         MMMMM", \
        "MMMMMM    MMMMMM", \
        "MMMMMM o oMMMMMM", \
        "MMMMMMMMo M~MMMM"
    db OWN | BISON, $20 | $0c, $10
    db OWN | BISON, $20 | $0c, $10
    db OWN | BISON, $20 | $0c, $10
    db OWN | DILLO, $20 | $0c, $10
    db OWN | GRIZZLY, $20 | $0c, $10
    db OWN | LYNX, $20 | $0c, $10
    db OWN | MUNKS, $00 | $02, $10
    db FOE | SLAGGER, $40 | $01, $04
    db FOE | SLAGGER, $40 | $01, $04
    db FOE | SLAGGER, $40 | $01, $04
    db FOE | MONSTER, $40 | $01, $04
    db FOE | LENET, $40 | $01, $04
    db FOE | LENET, $40 | $01, $04
    db FOE | RABBIT, $40 | $01, $04
    db FOE | ESTOL, $40 | $01, $04
    db FOE | MUNKS, $40 | $01, $04
    db FOE | RABBIT, $60 | $08, $0a
    db FOE | RABBIT, $60 | $08, $0a
    db FOE | DARBEK, $60 | $08, $0a
    db FOE | SLAGGER, $00 | $08, $02
    db $ff

SECTION "nectaris/map_contest: Map E18", ROMX

MapE18::
    map " u        MMMMMM", \
        "       ~    MMMM", \
        "      ~~    MMMM", \
        "MMMM  ~    G  MM", \
        "MMMMMMMM      MM", \
        "MMMMMMMMMM MMMMM", \
        "MMMMMMMMM  MMMMM", \
        "MMMMMMM M  MMMMM", \
        "MMMMM      MMMMM", \
        "MMM   ~~    MMMM", \
        "MM    ~       MM", \
        "MM        f   MM", \
        "MMM  MMM       M", \
        "MM   MMMMM   M M", \
        "M    MMMMMMMMMMM", \
        "    M MMMMMMMMMM", \
        "       MMMMMMMMM", \
        "M       MMMMMMMM", \
        " U       MMMMMMM", \
        "     M M MMMMMMM", \
        "MMMMMMMMMMMMMMMM", \
        "MMMMMMM M MMMMMM"
    db FOE | BISON, $00 | $09, $02
    db FOE | RABBIT, $00 | $0c, $04
    db OWN | BISON, $40 | $0a, $0b
    db OWN | BISON, $20 | $01, $00
    db OWN | LENET, $20 | $01, $00
    db OWN | RABBIT, $20 | $01, $00
    db FOE | NASHORN, $00 | $0d, $0c
    db FOE | LENET, $00 | $06, $09
    db FOE | DARBEK, $00 | $04, $0c
    db OWN | GRIZZLY, $20 | $01, $00
    db OWN | DARBEK, $00 | $01, $12
    db OWN | BISON, $40 | $0a, $0b
    db OWN | MONSTER, $40 | $0a, $0b
    db OWN | LENET, $40 | $0a, $0b
    db FOE | DARBEK, $00 | $03, $0b
    db OWN | BISON, $00 | $02, $13
    db OWN | RABBIT, $20 | $01, $00
    db FOE | BISON, $00 | $03, $0c
    db FOE | BISON, $00 | $0a, $0d
    db OWN | BISON, $20 | $01, $00
    db OWN | LYNX, $20 | $01, $00
    db OWN | LENET, $20 | $01, $00
    db OWN | LENET, $40 | $0a, $0b
    db OWN | DARBEK, $00 | $04, $11
    db $ff

SECTION "nectaris/map_contest: Map E19", ROMX

MapE19::
    map "MMMMMM++    MMM ", \
        "MMMMMMMM++ G oM ", \
        "MMMMMMMM  ++ +  ", \
        "MMMMMMMMM  ++ + ", \
        "MMMMMMMM   +~oo ", \
        "MMMMMM M   + oo ", \
        "MMMMMM  ##o+  o ", \
        "  MMMo + # +f o ", \
        "++   ++ +# + ~o ", \
        " ++++M  ## + ~~ ", \
        "~+~~ MMM  ~+f~~ ", \
        " +~~~MMM   +~~~ ", \
        "o+~~~MMMMM +~~~ ", \
        " +~~MMMMMM +f~~ ", \
        "~+ ~MMMMMMM+ o~ ", \
        "o+  MMMMMM +    ", \
        "+ ++  M  +o+f   ", \
        "+U  +++++~++    ", \
        "+    M    + ++~ ", \
        "+MMMMMMM  +   + ", \
        "+MMMMMMMMM+     ", \
        "+MM MMM~M++o M M"
    db OWN | MUNKS, $00 | $03, $11
    db FOE | MUNKS, $00 | $0a, $03
    db FOE | LENET, $00 | $0c, $03
    db FOE | BISON, $20 | $0c, $07
    db FOE | RABBIT, $20 | $0c, $07
    db FOE | MONSTER, $20 | $0c, $07
    db FOE | SEEKER, $40 | $0c, $10
    db FOE | BISON, $40 | $0c, $10
    db FOE | RABBIT, $40 | $0c, $10
    db FOE | DILLO, $60 | $0c, $0d
    db FOE | GRIZZLY, $60 | $0c, $0d
    db FOE | ESTOL, $60 | $0c, $0d
    db FOE | MUNKS, $40 | $0c, $10
    db FOE | LYNX, $60 | $0c, $0d
    db FOE | GIANT, $80 | $0c, $0a
    db FOE | MONSTER, $80 | $0c, $0a
    db FOE | SLAGGER, $80 | $0c, $0a
    db FOE | BISON, $00 | $0b, $04
    db OWN | BISON, $00 | $06, $11
    db OWN | BISON, $00 | $02, $0f
    db OWN | NASHORN, $20 | $0c, $07
    db $ff

SECTION "nectaris/map_contest: Map E20", ROMX

MapE20::
    map "MMM M         MM", \
        "MM     + + f  MM", \
        "MM   ++M+ +  MMM", \
        "M~~~+MMMMM ~ MMM", \
        "M~~~+MMMMM ~~   ", \
        "M ~~+~MMMMM~~~~~", \
        " g  +~~ MM    ~ ", \
        "    +   MMMM    ", \
        "o   + MM MMM    ", \
        "oo  + MM MMM G  ", \
        "oo  ++M  MMM    ", \
        "MooM  ++  MMMMMM", \
        "MMMMMM~~+~MMMMMM", \
        "MMMMMMMM+~MMMMMM", \
        "MMMMMMM + MMM MM", \
        "MM  M  +++    MM", \
        "MM ++++M  +u  MM", \
        "M  U  MMM     MM", \
        " ~    MMMM   M M", \
        "oo~  M MMMMMMMMM", \
        "ooooMMMMMMMMMMMM", \
        "oMooMMMMMMM~MMMM"
    db OWN | DRAPER, $00 | $03, $10
    db FOE | MULE, $20 | $0b, $01
    db FOE | RHINO, $20 | $0b, $01
    db FOE | ESTOL, $20 | $0b, $01
    db FOE | HAWKEYE, $20 | $0b, $01
    db FOE | DRAPER, $40 | $01, $06
    db FOE | HUNTER, $40 | $01, $06
    db FOE | SEEKER, $40 | $01, $06
    db FOE | PELICAN, $40 | $01, $06
    db FOE | MUNKS, $40 | $01, $06
    db OWN | BISON, $00 | $05, $0f
    db OWN | GRIZZLY, $00 | $09, $0e
    db OWN | DILLO, $00 | $08, $10
    db OWN | NASHORN, $00 | $07, $0e
    db OWN | SEEKER, $00 | $06, $10
    db OWN | JAVI, $60 | $0b, $10
    db OWN | MULE, $60 | $0b, $10
    db OWN | RHINO, $60 | $0b, $10
    db OWN | DARBEK, $60 | $0b, $10
    db OWN | LYNX, $00 | $05, $11
    db OWN | RABBIT, $00 | $09, $11
    db FOE | RABBIT, $00 | $02, $07
    db FOE | MONSTER, $40 | $01, $06
    db FOE | LENET, $00 | $01, $07
    db FOE | JAVI, $20 | $0b, $01
    db OWN | SEEKER, $60 | $0b, $10
    db FOE | SLAGGER, $00 | $03, $07
    db FOE | DARBEK, $00 | $0d, $08
    db FOE | SEEKER, $00 | $0c, $0a
    db OWN | SEEKER, $00 | $0a, $10
    db FOE | SEEKER, $00 | $08, $02
    db OWN | PELICAN, $00 | $02, $11
    db OWN | MUNKS, $00 | $03, $12
    db FOE | LYNX, $00 | $0c, $05
    db $ff

SECTION "nectaris/map_contest: Map E21", ROMX

MapE21::
    map "oooo   oo~~~~~oo +++++++++  M MM", \
        " ~o~    o ~~~~ G    ~oo~  ++  MM", \
        " ~~~ f    Mo~~~  MMM ~~~f   ++  ", \
        "  ~      M M~M MMMMMMMoM   ~  ++", \
        "     o MMMMMMMMMMMMMMMMMMM~~~o  ", \
        "++   ooMMMMMMMMMM MMMMMMMM ~~~ ~", \
        " o++  o  MMMMMM     MMM M ~o~~~ ", \
        "M   ++ M MM    U    M    ~~~~~o ", \
        "MMMM  ++ + + +       ~   o o~~oo", \
        "MMMMMM  + + + +    ~~~~~ooo   oo", \
        "MMMMM M  M   ~ M ~ M~+~~oMo o ~M"
    db OWN | DRAPER, $00 | $0d, $08
    db FOE | DRAPER, $00 | $0f, $01
    db FOE | MONSTER, $00 | $0e, $01
    db FOE | MONSTER, $00 | $0e, $02
    db FOE | SLAGGER, $00 | $11, $00
    db FOE | SLAGGER, $00 | $12, $01
    db OWN | BISON, $00 | $11, $06
    db OWN | BISON, $00 | $12, $07
    db OWN | GRIZZLY, $00 | $0f, $07
    db FOE | HUNTER, $40 | $18, $02
    db FOE | HUNTER, $40 | $18, $02
    db FOE | HUNTER, $40 | $18, $02
    db OWN | HAWKEYE, $40 | $18, $02
    db FOE | SEEKER, $40 | $18, $02
    db FOE | SEEKER, $40 | $18, $02
    db FOE | RABBIT, $40 | $18, $02
    db FOE | RABBIT, $40 | $18, $02
    db FOE | LYNX, $40 | $18, $02
    db FOE | NASHORN, $40 | $18, $02
    db FOE | FALCO, $20 | $05, $02
    db FOE | JAVI, $20 | $05, $02
    db FOE | JAVI, $20 | $05, $02
    db OWN | HAWKEYE, $20 | $05, $02
    db OWN | SEEKER, $20 | $05, $02
    db OWN | SEEKER, $20 | $05, $02
    db OWN | RABBIT, $20 | $05, $02
    db OWN | RABBIT, $20 | $05, $02
    db OWN | LYNX, $20 | $05, $02
    db OWN | MUNKS, $20 | $05, $02
    db FOE | MUNKS, $40 | $18, $02
    db $ff

SECTION "nectaris/map_contest: Map E22", ROMX

MapE22::
    map "MMMMMMM~M~~~ooM    ~~MMMM f  ++M", \
        "MMMMM    +++++o M ~  MMMMM ++   ", \
        "M M    ++ ~ooo++++    MMMM+ U  M", \
        "     ++ MM ooMMM  +  o M  +o MMM", \
        "G oo+   MMMooMMMMMg  ooMM~+ MMMM", \
        " ooo+MMMMM    MMMM M  o~  + MMMM", \
        "  o~+MMMMMu  MMMMMMMMM ~~++~MMMM", \
        "g o +MMMM  + MMMMMMMM  ++M MMMMM", \
        "+++++MMMMM+ ++ + +M+ ++Mo MMMMMM", \
        "MM MMMMMMMMM  +o+o+ + MMMMMMMMMM", \
        "MMMMM M MMM~MMoMo~oM MMoMMM MMM~"
    db OWN | MUNKS, $00 | $1a, $02
    db OWN | BISON, $00 | $19, $03
    db OWN | SEEKER, $00 | $1b, $02
    db OWN | GIANT, $20 | $1a, $00
    db OWN | DILLO, $20 | $1a, $00
    db OWN | ESTOL, $20 | $1a, $00
    db FOE | MONSTER, $40 | $12, $04
    db FOE | SLAGGER, $40 | $12, $04
    db FOE | SLAGGER, $40 | $12, $04
    db FOE | NASHORN, $40 | $12, $04
    db FOE | DARBEK, $40 | $12, $04
    db FOE | MUNKS, $40 | $12, $04
    db FOE | MULE, $40 | $12, $04
    db OWN | GRIZZLY, $60 | $0a, $06
    db OWN | BISON, $60 | $0a, $06
    db OWN | BISON, $60 | $0a, $06
    db FOE | MUNKS, $00 | $02, $08
    db FOE | MUNKS, $00 | $01, $03
    db FOE | LENET, $00 | $04, $03
    db FOE | NASHORN, $00 | $02, $05
    db FOE | SLAGGER, $00 | $03, $07
    db OWN | BISON, $60 | $0a, $06
    db OWN | NASHORN, $60 | $0a, $06
    db OWN | MUNKS, $60 | $0a, $06
    db OWN | MUNKS, $60 | $0a, $06
    db OWN | MULE, $60 | $0a, $06
    db FOE | MONSTER, $80 | $00, $07
    db FOE | SLAGGER, $80 | $00, $07
    db FOE | SEEKER, $80 | $00, $07
    db FOE | SEEKER, $80 | $00, $07
    db FOE | MULE, $80 | $00, $07
    db $ff

SECTION "nectaris/map_contest: Map E23", ROMX

MapE23::
    map "~~MMM   ~    M       MMMM MMMMM ", \
        "~ ~    +   ~MMMMf~   MMM  MMM   ", \
        "  U  M M+  ~MMMMM~~~MMM~ +      ", \
        "MM   MMM++    MM~~~ MMM +~   G  ", \
        "MMMM    M+++  M ~   M  +++      ", \
        "MMMMM    +  +#      ##+   +     ", \
        "MMMMMMu  +  +~#      *+  g      ", \
        "M MMMM M  + +~##    +#     M M M", \
        " ~~MMMMMMMM ++~#   ++ # MM MMMMM", \
        "~~~~M MMMMM     f     ##M   MMMM", \
        "~M~M    MM M M M   M M   M MMMMM"
    db OWN | FALCO, $40 | $06, $06
    db OWN | JAVI, $40 | $06, $06
    db OWN | HUNTER, $60 | $19, $06
    db OWN | FALCO, $60 | $19, $06
    db OWN | HUNTER, $80 | $10, $09
    db OWN | HUNTER, $80 | $10, $09
    db FOE | HUNTER, $20 | $10, $01
    db FOE | HUNTER, $20 | $10, $01
    db FOE | HUNTER, $20 | $10, $01
    db OWN | HUNTER, $80 | $10, $09
    db FOE | JAVI, $20 | $10, $01
    db FOE | FALCO, $60 | $19, $06
    db OWN | HAWKEYE, $40 | $06, $06
    db OWN | HAWKEYE, $60 | $19, $06
    db FOE | FALCO, $80 | $10, $09
    db FOE | PELICAN, $40 | $06, $06
    db OWN | MUNKS, $40 | $06, $06
    db FOE | PELICAN, $60 | $19, $06
    db FOE | DARBEK, $60 | $19, $06
    db OWN | JAVI, $00 | $05, $00
    db OWN | FALCO, $00 | $06, $08
    db OWN | DARBEK, $00 | $0d, $09
    db FOE | DARBEK, $00 | $12, $01
    db FOE | HUNTER, $00 | $1b, $07
    db FOE | HUNTER, $00 | $18, $02
    db OWN | FALCO, $80 | $10, $09
    db OWN | JAVI, $20 | $10, $01
    db OWN | FALCO, $20 | $10, $01
    db OWN | JAVI, $80 | $10, $09
    db FOE | PELICAN, $20 | $10, $01
    db FOE | HAWKEYE, $20 | $10, $01
    db FOE | PELICAN, $80 | $10, $09
    db FOE | HAWKEYE, $80 | $10, $09
    db $ff

SECTION "nectaris/map_contest: Map E24", ROMX

MapE24::
    map "~~~#~ ####    ~~ M ~~ MMM~o oooo", \
        "M  ~## ~~#  f MMMMMM~~   ~~     ", \
        "MM~~ # ~~#oo  MMMMMM ~~~~  G MMM", \
        "MM M~ ~~  #o  MMM MMMMM  +   MMM", \
        "MMMM  ~   #oo    ~  MMM +    MMM", \
        "MMM U ++++++o  o o o   ++  MMMMM", \
        "M         M ++ +ooog ++    MMMMM", \
        "~~MMM  ou   ~~+~++   + M   MM oo", \
        "~~MMM~ ooooM~o~~~~+++ ~    o ooo", \
        "MM   ~~MMMMMMMoo ~~~~~  MMMM ooo", \
        "MM M~MM~MMMMM~o oM~M~M M MM o oM"
    db OWN | BISON, $00 | $08, $04
    db OWN | DILLO, $00 | $09, $05
    db OWN | DILLO, $00 | $04, $05
    db OWN | RABBIT, $20 | $08, $07
    db OWN | RABBIT, $20 | $08, $07
    db OWN | SEEKER, $20 | $08, $07
    db OWN | SEEKER, $20 | $08, $07
    db OWN | MUNKS, $20 | $08, $07
    db OWN | MULE, $20 | $08, $07
    db FOE | SLAGGER, $00 | $16, $05
    db FOE | SLAGGER, $00 | $17, $05
    db FOE | SLAGGER, $00 | $18, $06
    db FOE | MONSTER, $00 | $19, $06
    db FOE | NASHORN, $00 | $1b, $03
    db FOE | DARBEK, $00 | $1b, $02
    db FOE | MUNKS, $00 | $19, $03
    db FOE | MULE, $00 | $18, $05
    db FOE | SLAGGER, $40 | $13, $06
    db FOE | SLAGGER, $40 | $13, $06
    db FOE | SLAGGER, $40 | $13, $06
    db FOE | RABBIT, $40 | $13, $06
    db FOE | MUNKS, $40 | $13, $06
    db FOE | MUNKS, $40 | $13, $06
    db OWN | MUNKS, $00 | $06, $06
    db OWN | BISON, $00 | $09, $04
    db OWN | MULE, $00 | $07, $05
    db OWN | MULE, $60 | $0c, $01
    db OWN | RHINO, $60 | $0c, $01
    db OWN | BISON, $60 | $0c, $01
    db OWN | BISON, $60 | $0c, $01
    db $ff

SECTION "nectaris/map_contest: Map E25", ROMX

MapE25::
    map "MMooo MMM MMMMMM~~~~~ MMMoooMMMM", \
        "ooooo~ MMM MMMMM +++g  ooooooMMM", \
        "oo~ ~~~ M ~~  M  M  ++  ~ oMMMMM", \
        "MMo  U ~ ~~  ~ MMM M M+   oMM MM", \
        "MMM ~+~~        M M+++++  ooo  M", \
        "MM~~ + + + + + + ++  ~~~++oG   M", \
        "M ~~~~+ +M+ + + +  ~~~~ ~+~~  MM", \
        "MM~~~~~ MMMM  f M  ~MM M  +MMM  ", \
        "oM  ~ ~ MMMM      ~ ~MMM f MMM  ", \
        "ooMooo MMMMMM~~~ oooo M    oMMM ", \
        "oMoMoMoMM MM M~M~ oMoM  o~o M  M"
    db FOE | MUNKS, $00 | $12, $02
    db OWN | MUNKS, $00 | $07, $05
    db OWN | RABBIT, $00 | $05, $03
    db OWN | LENET, $00 | $05, $05
    db OWN | BISON, $00 | $06, $02
    db OWN | SEEKER, $00 | $07, $03
    db FOE | SLAGGER, $00 | $18, $02
    db FOE | SLAGGER, $00 | $18, $04
    db FOE | RABBIT, $20 | $14, $01
    db FOE | RABBIT, $20 | $14, $01
    db FOE | HUNTER, $20 | $14, $01
    db FOE | NASHORN, $20 | $14, $01
    db FOE | GIANT, $20 | $14, $01
    db OWN | FALCO, $40 | $0e, $07
    db OWN | JAVI, $40 | $0e, $07
    db OWN | JAVI, $40 | $0e, $07
    db OWN | HAWKEYE, $40 | $0e, $07
    db OWN | SEEKER, $40 | $0e, $07
    db OWN | NASHORN, $40 | $0e, $07
    db OWN | LYNX, $40 | $0e, $07
    db FOE | MONSTER, $60 | $19, $08
    db FOE | MONSTER, $60 | $19, $08
    db FOE | PELICAN, $60 | $19, $08
    db FOE | MUNKS, $60 | $19, $08
    db FOE | HUNTER, $60 | $19, $08
    db FOE | MUNKS, $00 | $14, $02
    db FOE | SLAGGER, $20 | $14, $01
    db OWN | RABBIT, $00 | $06, $07
    db OWN | DARBEK, $00 | $09, $04
    db FOE | SEEKER, $20 | $14, $01
    db FOE | HAWKEYE, $20 | $14, $01
    db OWN | DILLO, $40 | $0e, $07
    db OWN | PELICAN, $40 | $0e, $07
    db OWN | YAMA, $40 | $0e, $07
    db FOE | MONSTER, $20 | $14, $01
    db FOE | HUNTER, $20 | $14, $01
    db FOE | HUNTER, $20 | $14, $01
    db $ff

SECTION "nectaris/map_contest: Map E26", ROMX

MapE26::
    map "               f                ", \
        "             ~                  ", \
        "     M        ~       MM        ", \
        "              ~~~               ", \
        " U     ~ u    ~~~            G  ", \
        "       ~      ~~~   g           ", \
        "              ~~~               ", \
        "                ~               ", \
        "MM              ~               ", \
        "MMMMMM M  M   f ~  M            ", \
        "MMM+MGM Mo o M M   M M   M M M  "
    db OWN | MUNKS, $00 | $06, $03
    db OWN | FALCO, $40 | $09, $04
    db FOE | SEEKER, $80 | $0e, $09
    db FOE | HUNTER, $80 | $0e, $09
    db FOE | HUNTER, $80 | $0e, $09
    db FOE | MUNKS, $80 | $0e, $09
    db FOE | HAWKEYE, $80 | $0e, $09
    db FOE | SEEKER, $60 | $14, $05
    db FOE | MONSTER, $00 | $0f, $08
    db FOE | NASHORN, $00 | $1b, $03
    db OWN | SEEKER, $00 | $03, $03
    db FOE | GIANT, $00 | $1d, $04
    db FOE | HUNTER, $00 | $1c, $02
    db FOE | HUNTER, $00 | $1c, $08
    db FOE | HUNTER, $00 | $19, $05
    db FOE | HAWKEYE, $00 | $12, $05
    db OWN | RABBIT, $60 | $14, $05
    db OWN | LYNX, $60 | $14, $05
    db OWN | FALCO, $20 | $0f, $00
    db OWN | JAVI, $20 | $0f, $00
    db OWN | HAWKEYE, $20 | $0f, $00
    db FOE | SEEKER, $00 | $16, $07
    db FOE | JAVI, $00 | $18, $08
    db OWN | SEEKER, $80 | $0e, $09
    db FOE | HUNTER, $80 | $0e, $09
    db OWN | FALCO, $40 | $09, $04
    db OWN | JAVI, $40 | $09, $04
    db OWN | JAVI, $40 | $09, $04
    db OWN | SEEKER, $40 | $09, $04
    db OWN | NASHORN, $40 | $09, $04
    db OWN | RABBIT, $00 | $06, $06
    db OWN | LYNX, $00 | $04, $07
    db OWN | BISON, $00 | $05, $00
    db FOE | HUNTER, $80 | $0e, $09
    db FOE | DARBEK, $00 | $12, $08
    db FOE | MONSTER, $00 | $1d, $07
    db FOE | RABBIT, $00 | $1a, $01
    db OWN | LENET, $60 | $14, $05
    db OWN | LENET, $60 | $14, $05
    db FOE | HUNTER, $60 | $14, $05
    db FOE | HUNTER, $60 | $14, $05
    db $ff

SECTION "nectaris/map_contest: Map E27", ROMX

MapE27::
    map "          MMMMMMMMM       oooo  ", \
        "   u ~      MMMMM           oo  ", \
        " +  ~M    ~~MMMM ~~   MM        ", \
        "+ ++       ~~MMMM~              ", \
        " U ++  ~ f  ~MMM ~~          G  ", \
        "    ++ ~      MM ~  f    +++++  ", \
        "      ++++++ MMM    +   +     + ", \
        "           ~~MMM +++++++++  oo  ", \
        "MM         ~~~MMM~~       g o   ", \
        "MMMMMM M  M ~MMM ~ M            ", \
        "MMMMMMMMMM ~MMMMM  M M   M M M M"
    db FOE | MUNKS, $00 | $1d, $04
    db OWN | FALCO, $00 | $05, $07
    db OWN | FALCO, $00 | $08, $02
    db OWN | FALCO, $00 | $08, $03
    db OWN | HUNTER, $00 | $09, $02
    db OWN | JAVI, $00 | $04, $07
    db OWN | JAVI, $00 | $04, $08
    db OWN | PELICAN, $40 | $09, $04
    db OWN | PELICAN, $40 | $09, $04
    db OWN | PELICAN, $40 | $09, $04
    db OWN | BISON, $20 | $03, $01
    db OWN | RABBIT, $20 | $03, $01
    db OWN | GRIZZLY, $20 | $03, $01
    db OWN | LENET, $20 | $03, $01
    db OWN | HAWKEYE, $20 | $03, $01
    db OWN | SEEKER, $20 | $03, $01
    db OWN | SEEKER, $20 | $03, $01
    db OWN | MUNKS, $00 | $01, $04
    db FOE | HUNTER, $00 | $15, $04
    db FOE | HUNTER, $00 | $17, $03
    db FOE | HUNTER, $00 | $18, $05
    db FOE | FALCO, $00 | $1a, $04
    db FOE | JAVI, $00 | $15, $00
    db FOE | DARBEK, $00 | $1b, $06
    db FOE | HUNTER, $60 | $14, $05
    db FOE | HUNTER, $60 | $14, $05
    db FOE | HUNTER, $60 | $14, $05
    db FOE | HAWKEYE, $00 | $10, $06
    db FOE | HAWKEYE, $00 | $10, $04
    db FOE | SEEKER, $00 | $0d, $05
    db FOE | SEEKER, $00 | $14, $03
    db FOE | SEEKER, $00 | $0c, $09
    db FOE | PELICAN, $80 | $1a, $08
    db FOE | PELICAN, $80 | $1a, $08
    db FOE | PELICAN, $80 | $1a, $08
    db FOE | MONSTER, $80 | $1a, $08
    db FOE | MONSTER, $80 | $1a, $08
    db FOE | RABBIT, $80 | $1a, $08
    db FOE | GIANT, $80 | $1a, $08
    db FOE | SEEKER, $80 | $1a, $08
    db FOE | SEEKER, $80 | $1a, $08
    db FOE | HUNTER, $80 | $1a, $08
    db FOE | HUNTER, $80 | $1a, $08
    db FOE | HUNTER, $80 | $1a, $08
    db FOE | HUNTER, $40 | $09, $04
    db OWN | DARBEK, $00 | $05, $03
    db FOE | DARBEK, $00 | $1a, $02
    db $ff

SECTION "nectaris/map_contest: Map E28", ROMX

MapE28::
    map "o       MMM~o ooooMMM~o~~~~MM MM", \
        "oou   ~ MMM~~        ~~  ~~   M ", \
        "         M~~~       ~  M ~  G  o", \
        "MM           ~~~~M     MMM      ", \
        "MM   MM    ~ ~~MMM     MMM      ", \
        "MM   MM  M~~f~~MMM      MMM     ", \
        "M        MMM MM M    f  MMMM g  ", \
        "M U      MMM ~M         MMM     ", \
        "       o oM ~~~    M    MMMM   o", \
        "oo     ooooooo~~   MMM  M MMMMoo", \
        "oMoM MoM MoMoMoM + MM M  MM+MMoM"
    db OWN | MULE, $20 | $02, $01
    db OWN | JAVI, $40 | $0c, $05
    db OWN | HAWKEYE, $00 | $04, $04
    db OWN | BISON, $00 | $03, $05
    db OWN | BISON, $00 | $03, $06
    db OWN | MUNKS, $00 | $01, $07
    db OWN | FALCO, $00 | $04, $09
    db OWN | NASHORN, $00 | $05, $06
    db FOE | HUNTER, $00 | $1a, $02
    db FOE | ESTOL, $60 | $15, $06
    db FOE | GIANT, $60 | $15, $06
    db FOE | HUNTER, $80 | $1d, $06
    db FOE | MONSTER, $80 | $1d, $06
    db FOE | SLAGGER, $80 | $1d, $06
    db FOE | LENET, $80 | $1d, $06
    db FOE | LYNX, $00 | $1d, $03
    db FOE | MUNKS, $00 | $1b, $02
    db FOE | HAWKEYE, $00 | $1d, $05
    db FOE | SEEKER, $00 | $1b, $04
    db OWN | DARBEK, $20 | $02, $01
    db FOE | RABBIT, $60 | $15, $06
    db FOE | RHINO, $60 | $15, $06
    db OWN | DILLO, $40 | $0c, $05
    db $ff

SECTION "nectaris/map_contest: Map E29", ROMX

MapE29::
    map "MMMM ~~~~oooooooo  f  MMMMMMMMMM", \
        "MMM         o          MMMM MMMM", \
        "    M  U         M M MMMMM G  MM", \
        "    MM +   MMM  MMMMMMMMMM +  MM", \
        " u     +   MMM  MMMMMMMMM  +   o", \
        "       +    M   MMMMM~MMM  +   o", \
        " M     +         MM  ~~~   +  oo", \
        "MMMo o  +++++++++++++++++++  ooo", \
        "MMMMoooo     ~~~      g      MMM", \
        "M MMM oooooo~ ~~~~       ooo MMM", \
        " MMMM oMo oM M M~~ M M  o oooMM "
    db OWN | MUNKS, $00 | $06, $05
    db OWN | FALCO, $00 | $07, $00
    db FOE | ESTOL, $60 | $16, $08
    db FOE | SLAGGER, $60 | $16, $08
    db FOE | HAWKEYE, $60 | $16, $08
    db FOE | SLAGGER, $20 | $13, $00
    db FOE | SLAGGER, $00 | $11, $07
    db OWN | JAVI, $00 | $04, $07
    db OWN | MULE, $40 | $01, $04
    db OWN | DARBEK, $40 | $01, $04
    db OWN | HAWKEYE, $00 | $08, $06
    db OWN | NASHORN, $00 | $07, $07
    db OWN | RABBIT, $00 | $04, $05
    db OWN | DILLO, $00 | $09, $08
    db OWN | BISON, $00 | $05, $02
    db FOE | PELICAN, $60 | $16, $08
    db FOE | BISON, $00 | $14, $09
    db FOE | BISON, $00 | $15, $06
    db FOE | RHINO, $60 | $16, $08
    db FOE | MULE, $00 | $18, $06
    db FOE | MONSTER, $00 | $18, $09
    db OWN | LENET, $20 | $13, $00
    db FOE | JAVI, $00 | $1d, $06
    db FOE | PELICAN, $20 | $13, $00
    db OWN | JAVI, $20 | $13, $00
    db OWN | RHINO, $20 | $13, $00
    db OWN | SEEKER, $00 | $0a, $03
    db OWN | BISON, $40 | $01, $04
    db OWN | GRIZZLY, $00 | $09, $04
    db FOE | DRAPER, $00 | $1a, $08
    db FOE | LYNX, $00 | $1b, $04
    db FOE | HUNTER, $00 | $1d, $03
    db FOE | DARBEK, $00 | $1b, $06
    db FOE | MUNKS, $00 | $1c, $09
    db $ff

SECTION "nectaris/map_contest: Map E30", ROMX

MapE30::
    map "MMMMMM U  MM oooooo   # ~~#  MM ", \
        "MMMMM  +  MMM  oo        ~#   M ", \
        "MMMMM  +  M  ~     M   M    g M ", \
        "MMMMM ~~++~~~M   MMMMM MMM  +   ", \
        "  MMMM~ ~ +~~MMMMMMMMM MM~~~+   ", \
        " u  MMMMM + ~ MMMMM MMMMM~~~+   ", \
        " +  MMM  ++   MMMM f~~M  ~~+G   ", \
        " +  M  ++    MMMMM +~~   ++M    ", \
        "+ ++ ++     MMMMM  +   ++MMMM   ", \
        "oo  +  o    MMMM    +++  MMMMM  ", \
        "oMoM MoM M MMMM MM M+M ~ MM M  M"
    db OWN | HAWKEYE, $00 | $06, $02
    db OWN | SEEKER, $00 | $08, $03
    db OWN | BISON, $00 | $07, $00
    db OWN | BISON, $00 | $08, $01
    db OWN | RABBIT, $00 | $0a, $04
    db OWN | DILLO, $20 | $01, $05
    db OWN | BISON, $20 | $01, $05
    db OWN | BISON, $20 | $01, $05
    db OWN | SEEKER, $20 | $01, $05
    db OWN | FALCO, $20 | $01, $05
    db OWN | MUNKS, $20 | $01, $05
    db OWN | PELICAN, $20 | $01, $05
    db OWN | HUNTER, $40 | $13, $06
    db FOE | SLAGGER, $40 | $13, $06
    db OWN | BISON, $40 | $13, $06
    db FOE | MUNKS, $00 | $1c, $06
    db FOE | SLAGGER, $00 | $19, $02
    db FOE | HUNTER, $60 | $1c, $02
    db FOE | LENET, $60 | $1c, $02
    db FOE | RABBIT, $60 | $1c, $02
    db FOE | RABBIT, $60 | $1c, $02
    db FOE | SEEKER, $60 | $1c, $02
    db FOE | MONSTER, $00 | $1b, $03
    db FOE | LYNX, $00 | $1b, $00
    db FOE | SEEKER, $00 | $1d, $07
    db $ff

SECTION "nectaris/map_contest: Map E31", ROMX

MapE31::
    map "~ o  MMMMMMM o  MMMMMMMMMMM+ MMM", \
        "M  ~ MMMMMM  oo MMMMMMM MMM+   M", \
        "Mu  MMMMM    ~o   MMM      +G MM", \
        "    MMMMMMM ~f  M MMM g o  +  MM", \
        " +++MMMMMM     +  MMMMMM MMM++  ", \
        "Moo+ MMMMM    ~ ++ MMMMMMMM~~+  ", \
        " oo+ MMMMM   M   +  MMMMMMM ~+  ", \
        "oo+MMMMMM    MMo +  ooMMM  ++~~ ", \
        "o~+ MMMMM  MMMM~ ~~~ooooM~~f~~MM", \
        "  +~MMM    MMMMMo~~oooo oo+ ~~MM", \
        " o+~~~ ~    M o ~~~~oo## ++MMMMM", \
        " +++~+        f ~+~~~~ *+o MMMMM", \
        "+  M+ ++   ~##  + ~~~++#   MMMMM", \
        " ~MMMM  ++++ *+++++++  #~  MMMMM", \
        "~~MMMMM ~  ++#       ~~~~MMMMMMM", \
        "~U  M ~~   +oo   Mo  ~~  MMMMMMM", \
        "   ~ ~~~~  + ooMMMMMo ~MMMMMMMMM", \
        "++ ~~~~~~++ ++ MMMMM ~ MMMMMMMMM", \
        "~ ++~+~++   ~ ++MMMoo MMMMMMMMMM", \
        "    + +        +      MMMMMMMMMM", \
        "               +      MMMMMMMMMM", \
        " M o M M M M M M M ~ MM+MMMMM+MM"
    db FOE | RHINO, $00 | $15, $02
    db FOE | RHINO, $00 | $17, $01
    db FOE | RHINO, $00 | $1a, $0b
    db FOE | YAMA, $00 | $18, $0a
    db FOE | YAMA, $00 | $18, $04
    db FOE | MONSTER, $00 | $02, $0a
    db FOE | MONSTER, $00 | $02, $0b
    db FOE | MUNKS, $00 | $03, $09
    db FOE | DARBEK, $00 | $04, $0a
    db FOE | ESTOL, $00 | $04, $0c
    db FOE | MONSTER, $00 | $05, $0b
    db OWN | GRIZZLY, $00 | $01, $06
    db OWN | GRIZZLY, $00 | $02, $07
    db OWN | MUNKS, $00 | $07, $03
    db FOE | HUNTER, $80 | $1b, $08
    db FOE | HUNTER, $80 | $1b, $08
    db FOE | HAWKEYE, $80 | $1b, $08
    db FOE | SEEKER, $80 | $1b, $08
    db FOE | HUNTER, $80 | $1b, $08
    db FOE | HUNTER, $80 | $1b, $08
    db OWN | JAVI, $00 | $03, $05
    db OWN | JAVI, $00 | $04, $06
    db OWN | BISON, $40 | $0d, $03
    db OWN | BISON, $40 | $0d, $03
    db OWN | RABBIT, $40 | $0d, $03
    db OWN | HAWKEYE, $40 | $0d, $03
    db OWN | SEEKER, $40 | $0d, $03
    db OWN | HUNTER, $a0 | $0e, $0b
    db OWN | HAWKEYE, $a0 | $0e, $0b
    db OWN | SEEKER, $a0 | $0e, $0b
    db OWN | NASHORN, $a0 | $0e, $0b
    db FOE | MONSTER, $00 | $0c, $11
    db FOE | MONSTER, $00 | $0d, $11
    db FOE | MUNKS, $00 | $0e, $12
    db FOE | MULE, $00 | $0d, $10
    db OWN | DILLO, $00 | $02, $0f
    db OWN | NASHORN, $00 | $01, $0f
    db OWN | DILLO, $00 | $05, $10
    db OWN | DILLO, $00 | $01, $0e
    db FOE | SEEKER, $00 | $04, $0b
    db OWN | FALCO, $20 | $01, $02
    db OWN | FALCO, $20 | $01, $02
    db OWN | JAVI, $20 | $01, $02
    db FOE | YAMA, $00 | $16, $02
    db FOE | HUNTER, $60 | $16, $03
    db FOE | HUNTER, $60 | $16, $03
    db FOE | RABBIT, $60 | $16, $03
    db FOE | HUNTER, $60 | $16, $03
    db FOE | LYNX, $60 | $16, $03
    db FOE | MUNKS, $00 | $1b, $03
    db FOE | SLAGGER, $00 | $1d, $04
    db FOE | SLAGGER, $00 | $1d, $05
    db FOE | SLAGGER, $00 | $1c, $07
    db FOE | NASHORN, $00 | $1c, $02
    db OWN | FALCO, $40 | $0d, $03
    db OWN | FALCO, $00 | $06, $02
    db $ff

SECTION "nectaris/map_contest: Map E32", ROMX

MapE32::
    map "MMMMM~~MMMMMMoooooooooooo ~#~+~ ", \
        "MMMMM~~~ ~MM~oo o    MooMM~~#+~ ", \
        "MMMM ~~ ~~~M oo   f  MMMMMM~#+  ", \
        "MMM     ~~~~M oo        M    +  ", \
        "ooo       ~~MMM~ ~     + + + +  ", \
        "oo~~ ~ #      ~ ~ ~~~++ + + + + ", \
        "oo~f ~~~##      ooo++MMM        ", \
        "oo o~ ~###    g o +~~MMMM  ~G   ", \
        " ooo      #+++++++++~MM  ~~~~MM ", \
        "## oo    +*o~o MMM~ ++    ~ MMM ", \
        "##oo   ++ ##oooMMMM + ++    MMM ", \
        "o+ + + +   #~ oMMMMM+~##++  M M ", \
        "+ + + + ++      MMM + ~#  ++    ", \
        "ooo      +++  u  MM + ~~#   ++~ ", \
        "o        +  ++  MMM +   #~ ~ ~+ ", \
        "o      M +   ~++M MM+ ###~~f oo ", \
        "o U  MMMM+ ~~M  ++M +  #   ~~oo ", \
        "++   MMM~+~~~MMM  +++ #MMM o~oo ", \
        "oo++  MM + MMMM  o oooMMMMMMooo ", \
        "ooo ++ ~M+ MMMM ooooooMMMMMMooo ", \
        "      ++~+ MMMMMoooooMMMMMMM oo ", \
        " ~ M   M+o MMMMMoMo oMM~MMMM ~oM"
    db FOE | GIANT, $00 | $19, $07
    db FOE | LYNX, $00 | $1b, $09
    db FOE | HUNTER, $00 | $1b, $0d
    db FOE | HUNTER, $00 | $1b, $00
    db FOE | RABBIT, $00 | $13, $02
    db FOE | RABBIT, $00 | $1b, $06
    db FOE | HAWKEYE, $00 | $1b, $02
    db OWN | RHINO, $00 | $02, $11
    db OWN | GRIZZLY, $00 | $09, $08
    db OWN | GRIZZLY, $00 | $09, $0a
    db OWN | DILLO, $00 | $05, $0e
    db OWN | DILLO, $00 | $05, $05
    db OWN | BISON, $00 | $05, $09
    db OWN | JAVI, $00 | $05, $13
    db OWN | FALCO, $00 | $05, $01
    db OWN | HAWKEYE, $00 | $07, $08
    db OWN | HUNTER, $40 | $03, $06
    db OWN | JAVI, $40 | $03, $06
    db OWN | HAWKEYE, $40 | $03, $06
    db OWN | SEEKER, $40 | $03, $06
    db OWN | NASHORN, $40 | $03, $06
    db OWN | MUNKS, $40 | $03, $06
    db OWN | PELICAN, $40 | $03, $06
    db OWN | PELICAN, $60 | $0e, $07
    db FOE | MUNKS, $60 | $0e, $07
    db FOE | FALCO, $60 | $0e, $07
    db FOE | JAVI, $60 | $0e, $07
    db FOE | RABBIT, $60 | $0e, $07
    db FOE | NASHORN, $60 | $0e, $07
    db FOE | HAWKEYE, $60 | $0e, $07
    db FOE | HAWKEYE, $80 | $0e, $0d
    db OWN | JAVI, $80 | $0e, $0d
    db OWN | BISON, $80 | $0e, $0d
    db OWN | BISON, $80 | $0e, $0d
    db OWN | LYNX, $80 | $0e, $0d
    db OWN | SEEKER, $80 | $0e, $0d
    db FOE | MONSTER, $20 | $12, $02
    db FOE | SLAGGER, $20 | $12, $02
    db FOE | LYNX, $20 | $12, $02
    db OWN | SEEKER, $00 | $07, $0a
    db OWN | RABBIT, $a0 | $1b, $0f
    db FOE | PELICAN, $a0 | $1b, $0f
    db OWN | MUNKS, $00 | $04, $0c
    db OWN | RABBIT, $00 | $03, $09
    db OWN | GIANT, $40 | $03, $06
    db FOE | GIANT, $00 | $12, $08
    db FOE | DRAPER, $00 | $17, $08
    db FOE | JAVI, $20 | $12, $02
    db FOE | MONSTER, $00 | $14, $07
    db FOE | MONSTER, $00 | $14, $08
    db FOE | SLAGGER, $00 | $19, $04
    db FOE | SLAGGER, $00 | $19, $0b
    db FOE | FALCO, $a0 | $1b, $0f
    db FOE | DRAPER, $00 | $19, $09
    db FOE | RHINO, $a0 | $1b, $0f
    db FOE | JAVI, $a0 | $1b, $0f
    db $ff

SECTION "nectaris/map_contest: Map E33", ROMX

MapE33::
    map "oooo#+o+    ooo ~~~+ +ooooo~ooo ", \
        "oo +* +M++++ o ++++~+~+o#~~#ooo ", \
        "o++ ## MMM +   +   ~~~+ ### o   ", \
        "o+ ### MMMM+   +  ~~~~++ # M~   ", \
        "o+    #  ++ +++ oM  ~~~+ # MM~~ ", \
        " o++++#  + o M MMMMM~~M+      ~ ", \
        "o~+   +++  ooMMMMMM   + +   ~ M ", \
        " ~+ f +   oooMMMMM   ~+ +~G ~~M ", \
        "~++~  +    MMMMMM ~+ ~+~+~~~~MM ", \
        "~+~~~+++  MMMMMM f~~+ +~+~~MMoM ", \
        "  +~+oo + MMMMMM  ~~+++~+  Mooo ", \
        "  +++ooo+ MMMMMMMM  ~#  +     o ", \
        "M~M o~o ++MMMMMMMMMM  #++   f o ", \
        "MM M~MM~~~++  M MMMM  #+     Mo ", \
        "MMMMM  ~~ +o++  MMMMMM +   MMMM ", \
        "MMMM ++u ++MMMf MMMMMMM+  MMMMM ", \
        "MM   +  ~MMMMMMMMMMMM  +  M MMM ", \
        "M  ++   MMMMMMMMMMM~ ~+ ++ g MM ", \
        "   U  ##MMMMMMMMMM~+~++   +  MM ", \
        "       # MMMMMMMM   +        MM ", \
        "       # MMMMMMM       MMM MMMM ", \
        " M M  #~ MM M~MM   M MM MMMoM MM"
    db OWN | FALCO, $a0 | $0e, $0f
    db OWN | JAVI, $a0 | $0e, $0f
    db OWN | DILLO, $a0 | $0e, $0f
    db OWN | FALCO, $20 | $04, $07
    db OWN | JAVI, $20 | $04, $07
    db OWN | GRIZZLY, $20 | $04, $07
    db OWN | BISON, $20 | $04, $07
    db OWN | ESTOL, $20 | $04, $07
    db OWN | RABBIT, $20 | $04, $07
    db OWN | LYNX, $20 | $04, $07
    db OWN | DARBEK, $20 | $04, $07
    db FOE | HUNTER, $60 | $1c, $0c
    db FOE | HUNTER, $60 | $1c, $0c
    db FOE | MONSTER, $60 | $1c, $0c
    db FOE | MONSTER, $60 | $1c, $0c
    db FOE | SLAGGER, $60 | $1c, $0c
    db FOE | SLAGGER, $60 | $1c, $0c
    db FOE | HAWKEYE, $60 | $1c, $0c
    db FOE | MUNKS, $60 | $1c, $0c
    db FOE | MULE, $60 | $1c, $0c
    db FOE | RHINO, $60 | $1c, $0c
    db FOE | HUNTER, $40 | $11, $09
    db FOE | HUNTER, $40 | $11, $09
    db OWN | FALCO, $80 | $07, $0f
    db OWN | BISON, $80 | $07, $0f
    db OWN | RABBIT, $80 | $07, $0f
    db OWN | SEEKER, $80 | $07, $0f
    db OWN | DRAPER, $80 | $07, $0f
    db OWN | BISON, $a0 | $0e, $0f
    db OWN | LENET, $a0 | $0e, $0f
    db OWN | HAWKEYE, $a0 | $0e, $0f
    db OWN | FALCO, $20 | $04, $07
    db FOE | HUNTER, $60 | $1c, $0c
    db FOE | HUNTER, $00 | $1b, $09
    db FOE | SLAGGER, $00 | $19, $0e
    db FOE | GIANT, $00 | $19, $05
    db FOE | RHINO, $00 | $1a, $04
    db FOE | HUNTER, $00 | $1b, $06
    db FOE | RABBIT, $00 | $19, $08
    db OWN | MUNKS, $80 | $07, $0f
    db OWN | RABBIT, $40 | $11, $09
    db FOE | NASHORN, $40 | $11, $09
    db FOE | HUNTER, $40 | $11, $09
    db FOE | HUNTER, $40 | $11, $09
    db FOE | GIANT, $00 | $19, $0b
    db FOE | DRAPER, $c0 | $1b, $11
    db FOE | HUNTER, $c0 | $1b, $11
    db FOE | HUNTER, $c0 | $1b, $11
    db FOE | MONSTER, $c0 | $1b, $11
    db FOE | MONSTER, $c0 | $1b, $11
    db FOE | SLAGGER, $c0 | $1b, $11
    db FOE | LYNX, $c0 | $1b, $11
    db FOE | RABBIT, $c0 | $1b, $11
    db FOE | HAWKEYE, $c0 | $1b, $11
    db FOE | PELICAN, $c0 | $1b, $11
    db FOE | DARBEK, $c0 | $1b, $11
    db $ff

SECTION "nectaris/map_contest: Map E34", ROMX

MapE34::
    map "MMMMMMM MMMMMMMMMMMMMMMMMMMMMMMM", \
        "MMMMM  ~  MMMMMMMMMMMMMMMMMMMMMM", \
        "MMM    ~~ MMMMM MMM   MMMMMMMMMM", \
        "MM  oo  ~MMMM        ~  MMM MMMM", \
        "MM  o u  MM  MMM   G ~~~     MMM", \
        "MM u         MMMMM   ~~~  g  MMM", \
        "MMM  oo o   M MMMM    ~      MMM", \
        "MM    o MMMMMMMMMMMM M     MMMMM", \
        "MMMM MM MMMMMMMMMMMMMMM MMMMMMMM", \
        "MMM  MMMMMMMMMMMMMMMMMM  MMMMMMM", \
        "MM oMMM   M  MMMMMMMMMM  MMMMMMM", \
        "MMM MMM~~~   MMMMMM M     MMMMMM", \
        "M      ~~~g   MMM  ~~~ o   oMMMM", \
        "MM      ~    M   ~~~~ oo     MMM", \
        "M    MMM o ~~MMM  ~~~~o ooU  MMM", \
        "M g  MMMMM ~~~MMMM  ~~ Mo  o MMM", \
        "MM M MMMMMM ~ MMMMMMMMMMMM   MMM", \
        "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM", \
        "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM", \
        "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM", \
        "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM", \
        "MMM MMM MMMMMMMMM~MMMMM#MMMoMMMM"
    db OWN | YAMA, $00 | $0d, $0c
    db OWN | YAMA, $00 | $0f, $0d
    db OWN | YAMA, $00 | $17, $08
    db OWN | YAMA, $00 | $18, $0a
    db OWN | RHINO, $00 | $17, $0e
    db OWN | RHINO, $00 | $1a, $0d
    db OWN | HAWKEYE, $00 | $1a, $0e
    db OWN | SEEKER, $00 | $18, $0c
    db OWN | SEEKER, $00 | $15, $0d
    db OWN | FALCO, $40 | $03, $05
    db OWN | FALCO, $40 | $03, $05
    db OWN | FALCO, $40 | $03, $05
    db OWN | FALCO, $40 | $03, $05
    db OWN | JAVI, $20 | $06, $04
    db OWN | JAVI, $20 | $06, $04
    db FOE | HUNTER, $a0 | $02, $0f
    db FOE | HUNTER, $a0 | $02, $0f
    db FOE | HUNTER, $a0 | $02, $0f
    db FOE | MUNKS, $80 | $0a, $0c
    db FOE | SEEKER, $60 | $1a, $05
    db FOE | MULE, $60 | $1a, $05
    db FOE | RHINO, $00 | $01, $0f
    db FOE | RHINO, $00 | $1a, $04
    db FOE | YAMA, $00 | $02, $0e
    db FOE | YAMA, $00 | $0b, $0c
    db FOE | YAMA, $00 | $19, $05
    db FOE | MUNKS, $a0 | $02, $0f
    db FOE | MUNKS, $60 | $1a, $05
    db FOE | MONSTER, $60 | $1a, $05
    db FOE | HUNTER, $60 | $1a, $05
    db FOE | HUNTER, $60 | $1a, $05
    db FOE | ESTOL, $60 | $1a, $05
    db FOE | MONSTER, $60 | $1a, $05
    db FOE | HAWKEYE, $60 | $1a, $05
    db FOE | SEEKER, $a0 | $02, $0f
    db OWN | JAVI, $00 | $19, $0f
    db OWN | FALCO, $00 | $1a, $10
    db OWN | FALCO, $00 | $1b, $10
    db OWN | PELICAN, $20 | $06, $04
    db OWN | DARBEK, $20 | $06, $04
    db OWN | PELICAN, $40 | $03, $05
    db OWN | DARBEK, $40 | $03, $05
    db OWN | MUNKS, $00 | $19, $0d
    db OWN | MUNKS, $00 | $1b, $0f
    db FOE | DARBEK, $80 | $0a, $0c
    db FOE | HUNTER, $80 | $0a, $0c
    db FOE | HAWKEYE, $80 | $0a, $0c
    db FOE | SLAGGER, $80 | $0a, $0c
    db FOE | HUNTER, $80 | $0a, $0c
    db FOE | SLAGGER, $a0 | $02, $0f
    db FOE | MONSTER, $00 | $13, $04
    db FOE | MONSTER, $a0 | $02, $0f
    db OWN | RABBIT, $00 | $1a, $0f
    db FOE | MONSTER, $00 | $14, $05
    db OWN | DILLO, $20 | $06, $04
    db $ff

SECTION "nectaris/map_contest: Map E35", ROMX

MapE35::
    map "MMMMMMMMM oMMMMMMMMMMMM MMMMMM  ", \
        "MMM   M oooMMMM M  MM    ~ MMMM ", \
        "MMM U   o ooMMM ~f~~    ~~~  MM ", \
        "MMMM+  ~~~oMMMMM +~~~~  ~    MM ", \
        "MMM ++ ~~~ MMMMM+ +  M       MM ", \
        "M ~~  + ~~ MMMMMM +MM  M   ~MM~ ", \
        "MM~~  +     MMMMM +M   MM o MMM ", \
        "M ~   + ~  o MMMM + M    ~~  MM ", \
        "M     +M  oo MMMMM+~M    ~~MMMM ", \
        "MM    +MM   MMMMM~+~      ~MMMM ", \
        "MMo   +   f MMMMM ++oo  ~  MM M ", \
        "MMMM  +   + M MMM  +o ~~      M ", \
        "MMM   +  +++  MMM  +  ~~~~      ", \
        "MMM  ++++  M++  o o+~~  ~     M ", \
        "MM  +~~M~  MM ++   +~~    ~~G   ", \
        "M~~ +~~M        ++ +~+ + +~+ +  ", \
        "M ~++ M      M   ~+M+g+ +~+~+ + ", \
        "MM u         MMM~~      ~~~  ~~ ", \
        "M      ~~~~~ MMMMM ~~~       ~~ ", \
        "M ~   ~~~M~MMMMMMMM ~~~~   M~~~ ", \
        "MMMM  ~~MMMMMMMMMMM ~~~MMMMMMMM ", \
        "MMM M ~MMMM~MMMMM MM~MMMMMMMM MM"
    db OWN | RABBIT, $00 | $04, $0f
    db OWN | LYNX, $00 | $02, $11
    db FOE | BISON, $00 | $06, $0c
    db FOE | MONSTER, $00 | $09, $0e
    db OWN | SLAGGER, $60 | $15, $10
    db OWN | ESTOL, $60 | $15, $10
    db OWN | MONSTER, $60 | $15, $10
    db OWN | DILLO, $40 | $0a, $0a
    db OWN | GRIZZLY, $40 | $0a, $0a
    db OWN | RABBIT, $40 | $0a, $0a
    db FOE | GIANT, $00 | $1c, $0e
    db FOE | DILLO, $00 | $1b, $0f
    db FOE | SLAGGER, $20 | $11, $02
    db OWN | BISON, $80 | $03, $11
    db OWN | BISON, $80 | $03, $11
    db OWN | LENET, $80 | $03, $11
    db OWN | NASHORN, $80 | $03, $11
    db OWN | MUNKS, $40 | $0a, $0a
    db OWN | LENET, $40 | $0a, $0a
    db FOE | RABBIT, $00 | $14, $10
    db FOE | SLAGGER, $00 | $14, $11
    db FOE | LENET, $00 | $05, $09
    db FOE | MONSTER, $00 | $1a, $05
    db FOE | LYNX, $60 | $15, $10
    db OWN | MUNKS, $00 | $0a, $02
    db OWN | BISON, $00 | $06, $04
    db OWN | MONSTER, $20 | $11, $02
    db OWN | RABBIT, $20 | $11, $02
    db FOE | BISON, $00 | $17, $0a
    db FOE | MUNKS, $00 | $1a, $0d
    db OWN | BISON, $00 | $03, $0e
    db FOE | NASHORN, $20 | $11, $02
    db OWN | BISON, $20 | $11, $02
    db FOE | LYNX, $20 | $11, $02
    db FOE | RHINO, $00 | $11, $0b
    db FOE | RHINO, $00 | $0f, $10
    db FOE | LENET, $60 | $15, $10
    db FOE | MONSTER, $00 | $1b, $06
    db FOE | MUNKS, $00 | $13, $0c
    db FOE | DARBEK, $00 | $10, $0f
    db $ff

SECTION "nectaris/map_contest: Map E36", ROMX

MapE36::
    map "MMM  u  MMMMMM~    M       M    ", \
        "M       M M M        g      MMMM", \
        "     M          MM          MMMM", \
        "  ~~MMMM        MM      MM  MMMM", \
        "  ~~ MMM        MM   M  MM    M ", \
        "  ~M~~M M  M    MM           g  ", \
        "MMM ~      M             ~      ", \
        "MMM  M    MMMM    M     ~~  M   ", \
        "MM   MM    MMM         M    M   ", \
        "MM    M     M   M      MM    M  ", \
        "M     M       f   MM    M    MMM", \
        "         M M      MM     ~   MMM", \
        " MM MM   MMMMM    M     ~~    MM", \
        "    MM   MMMM~~    M   M~       ", \
        "          MMM ~  M          G   ", \
        "  U    M      ~M                ", \
        "      MMM    f~~M     MM   M    ", \
        "     MMMM~~   ~ MM    MM  M  M  ", \
        "MMMMMMMM~~~MM   MM    MM   MMMMM", \
        "MMMMMMMM  M       M MMMM   MMMMM", \
        "MMMMMMMMMM         MMMMMMM MMMMM", \
        "M M MuM M MM M M #MMMMMGMMM MGMM"
    db FOE | MONSTER, $00 | $08, $0b
    db FOE | MONSTER, $00 | $09, $09
    db OWN | MUNKS, $00 | $0e, $0d
    db FOE | DARBEK, $60 | $1d, $05
    db FOE | MONSTER, $00 | $14, $09
    db FOE | MONSTER, $00 | $15, $08
    db FOE | SLAGGER, $00 | $18, $06
    db FOE | SLAGGER, $00 | $17, $07
    db FOE | SLAGGER, $00 | $1c, $10
    db OWN | RABBIT, $a0 | $0d, $10
    db OWN | RABBIT, $a0 | $0d, $10
    db OWN | BISON, $a0 | $0d, $10
    db OWN | DILLO, $a0 | $0d, $10
    db OWN | NASHORN, $a0 | $0d, $10
    db OWN | ESTOL, $a0 | $0d, $10
    db OWN | NASHORN, $80 | $0e, $0a
    db OWN | ESTOL, $80 | $0e, $0a
    db OWN | LYNX, $80 | $0e, $0a
    db OWN | LYNX, $80 | $0e, $0a
    db OWN | MULE, $80 | $0e, $0a
    db OWN | RHINO, $80 | $0e, $0a
    db OWN | DARBEK, $80 | $0e, $0a
    db OWN | DRAPER, $80 | $0e, $0a
    db OWN | LENET, $80 | $0e, $0a
    db OWN | LENET, $80 | $0e, $0a
    db FOE | MONSTER, $00 | $15, $0b
    db FOE | MONSTER, $00 | $15, $0d
    db FOE | MONSTER, $00 | $13, $04
    db FOE | BISON, $00 | $09, $0a
    db OWN | DILLO, $20 | $05, $00
    db OWN | GRIZZLY, $20 | $05, $00
    db OWN | GRIZZLY, $20 | $05, $00
    db OWN | BISON, $20 | $05, $00
    db OWN | BISON, $20 | $05, $00
    db OWN | RABBIT, $20 | $05, $00
    db OWN | MUNKS, $20 | $05, $00
    db FOE | SLAGGER, $40 | $15, $01
    db FOE | SLAGGER, $40 | $15, $01
    db FOE | SLAGGER, $60 | $1d, $05
    db FOE | NASHORN, $00 | $16, $07
    db FOE | NASHORN, $00 | $17, $0c
    db FOE | PELICAN, $a0 | $0d, $10
    db FOE | HUNTER, $60 | $1d, $05
    db OWN | FALCO, $20 | $05, $00
    db OWN | DILLO, $00 | $09, $0f
    db OWN | BISON, $00 | $0a, $10
    db OWN | BISON, $00 | $09, $03
    db OWN | BISON, $00 | $0a, $04
    db OWN | BISON, $00 | $0f, $0b
    db FOE | SEEKER, $40 | $15, $01
    db FOE | SEEKER, $60 | $1d, $05
    db FOE | DARBEK, $40 | $15, $01
    db FOE | HAWKEYE, $00 | $1c, $0e
    db FOE | HAWKEYE, $a0 | $0d, $10
    db FOE | LYNX, $60 | $1d, $05
    db FOE | JAVI, $60 | $1d, $05
    db $ff

SECTION "nectaris/map_contest: Map E37", ROMX

MapE37::
    map "ooooooMMMM     ooo  MMMMM  ooMMM", \
        "o   ooMMMMf  M Moo    M  u    MM", \
        "  g   MMMM MMMMMMM    o      MMM", \
        "oo     ~MMMMMMMMMM  o  o   o MMM", \
        "oooM   M~MMM  MMMMM  oo  M M  MM", \
        "o oMMM  ~MMMoo  M     oMMMMMM   ", \
        " o  MMM  MM o o oo U   MMMMMM   ", \
        "MMMMMM ~ MMMMMMMooo  o MMMMMM o ", \
        "MMMMMMMM MMMMMM Mo  oooo     o  ", \
        "MMMMMMM   MMMMM  M M  o      o  ", \
        "MMM  MM oo  MMMMMMMMMM      oo M", \
        "MM G MMMoo MMMMMMMMMM    MMM    ", \
        "MM   MMMMM MMMMMMMM    MMMMM    ", \
        "MM    MMM  MM MMMM   MMMMMM  M  ", \
        "MMM   M  g      MMM MMMMMMM    M", \
        "MMMM               oMMMMMMM  MMM", \
        "MMMMMMMM   MMM M  ooMMMMM    MMM", \
        "MMMMMMMMMM MMMMMMMo MMM    ooMMM", \
        "MMMMMMMMM   MMMMMMMMMMM u  MoMMM", \
        "MMMMMMMMM  MMMMMMMMMMMMM    M MM", \
        "MMMMMMMMMM MMMMMMMMMMMMMM     MM", \
        "MMM MMMMMM MMMM M~MMM MMMM   ~MM"
    db OWN | DILLO, $20 | $02, $02
    db OWN | DILLO, $20 | $02, $02
    db OWN | MUNKS, $20 | $02, $02
    db OWN | DARBEK, $20 | $02, $02
    db OWN | DRAPER, $20 | $02, $02
    db OWN | RABBIT, $20 | $02, $02
    db OWN | RABBIT, $20 | $02, $02
    db OWN | BISON, $20 | $02, $02
    db OWN | LYNX, $20 | $02, $02
    db OWN | ESTOL, $20 | $02, $02
    db OWN | MULE, $40 | $19, $01
    db OWN | RHINO, $40 | $19, $01
    db FOE | MONSTER, $20 | $02, $02
    db FOE | MONSTER, $20 | $02, $02
    db FOE | SLAGGER, $20 | $02, $02
    db FOE | SLAGGER, $20 | $02, $02
    db FOE | LENET, $20 | $02, $02
    db FOE | LENET, $20 | $02, $02
    db OWN | DRAPER, $40 | $19, $01
    db OWN | MUNKS, $40 | $19, $01
    db OWN | RABBIT, $40 | $19, $01
    db OWN | RABBIT, $40 | $19, $01
    db OWN | GRIZZLY, $40 | $19, $01
    db OWN | BISON, $40 | $19, $01
    db OWN | BISON, $40 | $19, $01
    db OWN | BISON, $40 | $19, $01
    db OWN | DILLO, $40 | $19, $01
    db OWN | LYNX, $40 | $19, $01
    db OWN | SEEKER, $20 | $02, $02
    db OWN | SEEKER, $20 | $02, $02
    db OWN | PELICAN, $60 | $0a, $01
    db FOE | YAMA, $00 | $0b, $00
    db OWN | SEEKER, $40 | $19, $01
    db OWN | MUNKS, $80 | $18, $12
    db OWN | RABBIT, $80 | $18, $12
    db OWN | GRIZZLY, $80 | $18, $12
    db OWN | DRAPER, $80 | $18, $12
    db OWN | BISON, $80 | $18, $12
    db OWN | NASHORN, $80 | $18, $12
    db OWN | LYNX, $80 | $18, $12
    db OWN | MULE, $a0 | $09, $0e
    db OWN | SEEKER, $80 | $18, $12
    db FOE | RHINO, $00 | $07, $09
    db FOE | YAMA, $a0 | $09, $0e
    db FOE | ESTOL, $a0 | $09, $0e
    db OWN | BISON, $a0 | $09, $0e
    db FOE | RABBIT, $a0 | $09, $0e
    db FOE | MONSTER, $a0 | $09, $0e
    db FOE | LENET, $a0 | $09, $0e
    db FOE | SLAGGER, $a0 | $09, $0e
    db FOE | SLAGGER, $a0 | $09, $0e
    db FOE | MONSTER, $a0 | $09, $0e
    db FOE | RHINO, $00 | $05, $0e
    db OWN | BISON, $80 | $18, $12
    db $ff

SECTION "nectaris/map_contest: Map E38", ROMX

MapE38::
    map "MMMMooo+~~MMMMMMMMM ~~~     ooo ", \
        "MMMMo  +~ MMM~ MMMM         ooo ", \
        "MMM    +~ MM ~~~M   ## +++ U    ", \
        " MM   +     ~ ~      *+         ", \
        "     ++        u + ++# M        ", \
        "           o      +  # MMM      ", \
        "  f  M MMMoooo     ~~~#MMMM  MM ", \
        "     MM M ~~o MM MM~~~# MMMMMMM ", \
        "MM MMM ~ ~~~~ MMMMM~~   MMMMMMM ", \
        "MMMMMM ~~~~~~~MMMMM    ~ MMMMMM ", \
        "MMMMM   ~              ~~~MMM   ", \
        "MMMMM       f   ~~~M M  ~~      ", \
        "MMM  + MMM      ~~~MMMM ~~~~    ", \
        "M    + MMMMM M   ~~ MMM ~~~  M  ", \
        "     +  MMM MMMM    M  ~~~  MMM ", \
        "    + + MM    MMM   ~~~~~   MMM ", \
        " g ++ +        MMMMM  ~~  f  MM ", \
        "      ++ + G    MMMMM ~~     MM ", \
        "   M   ++      MMMMMM ~  M MMMM ", \
        "MMMMM  +      MMMMMo o  MMMMMMM ", \
        "MMMMM  +      MMM ooooooMMMMMMM ", \
        "M MM M M o M    M o o oMMMMMM~MM"
    db FOE | YAMA, $00 | $05, $0b
    db FOE | YAMA, $00 | $06, $0c
    db FOE | HUNTER, $80 | $01, $10
    db FOE | MONSTER, $80 | $01, $10
    db FOE | SLAGGER, $80 | $01, $10
    db FOE | HAWKEYE, $80 | $01, $10
    db FOE | MUNKS, $80 | $01, $10
    db FOE | HUNTER, $00 | $01, $0e
    db FOE | MONSTER, $60 | $0c, $0b
    db OWN | RABBIT, $60 | $0c, $0b
    db OWN | LYNX, $60 | $0c, $0b
    db OWN | HUNTER, $60 | $0c, $0b
    db FOE | RHINO, $00 | $0b, $0e
    db OWN | MUNKS, $00 | $1b, $05
    db FOE | SLAGGER, $80 | $01, $10
    db FOE | MONSTER, $80 | $01, $10
    db FOE | ESTOL, $80 | $01, $10
    db FOE | MONSTER, $00 | $04, $0f
    db FOE | GIANT, $00 | $0a, $11
    db FOE | SLAGGER, $00 | $07, $11
    db FOE | DARBEK, $00 | $0c, $0f
    db FOE | MUNKS, $00 | $02, $0c
    db OWN | BISON, $a0 | $1a, $10
    db OWN | LENET, $a0 | $1a, $10
    db OWN | RABBIT, $a0 | $1a, $10
    db OWN | LYNX, $a0 | $1a, $10
    db OWN | FALCO, $20 | $0f, $04
    db OWN | FALCO, $20 | $0f, $04
    db OWN | DILLO, $20 | $0f, $04
    db OWN | GRIZZLY, $20 | $0f, $04
    db OWN | RABBIT, $20 | $0f, $04
    db OWN | LYNX, $20 | $0f, $04
    db OWN | SEEKER, $20 | $0f, $04
    db OWN | ESTOL, $20 | $0f, $04
    db OWN | DARBEK, $20 | $0f, $04
    db OWN | PELICAN, $20 | $0f, $04
    db FOE | NASHORN, $60 | $0c, $0b
    db FOE | MONSTER, $80 | $01, $10
    db FOE | SLAGGER, $60 | $0c, $0b
    db OWN | BISON, $40 | $02, $06
    db OWN | LENET, $40 | $02, $06
    db OWN | SEEKER, $40 | $02, $06
    db OWN | DARBEK, $40 | $02, $06
    db FOE | PELICAN, $80 | $01, $10
    db FOE | DARBEK, $80 | $01, $10
    db $ff

SECTION "nectaris/map_contest: Map E39", ROMX

MapE39::
    map "MMMMMMM oooooo  o  ~~~  MMMMMMM ", \
        "MMMMMM   ~  o     f~~~  MMMMMMM ", \
        "MMMMM    ~~         ~    MMMMMM ", \
        "MMMMM   f ~    MMM      ~ M M   ", \
        "MMMM  ~   o   MMMMMMMM          ", \
        "MMM         o MMMMMMMM          ", \
        "MMM~     M    MMMMMMMMM         ", \
        "MM   MMMMMMM MMMMMMMMM          ", \
        "M    MMMMMMMMMMMMMMMMM     g    ", \
        "M    MMMMMMMMMMMMMMMMMM         ", \
        "      MMMMMMMMMMMMMMMMMM        ", \
        "      MMMMMMMMMMMMMMMMMM        ", \
        "    u  MMMMMMMMMMMMMMMMMM       ", \
        "       MMMMMMMMMMMMMMMMM        ", \
        "   oooMMM   MMMMMMMMMMMM ~      ", \
        "    ooMMMM  MMMMMMMMMMMo ~~     ", \
        "  ~   MMMMMM MMMMMMMMMMoo~~     ", \
        "       MMMMM~ M M  MMMM      ~  ", \
        " U      MMMMMM M M MMMM      ~~ ", \
        "        MMMMMMMMMMMMMM    G  ~~ ", \
        "     MMMMMMMMMMMMMMMM         ~ ", \
        "   M MM MMMMMMMMM MMM  ~ M + ~ M"
    db FOE | RHINO, $00 | $09, $0e
    db OWN | FALCO, $00 | $01, $10
    db OWN | FALCO, $00 | $00, $12
    db OWN | FALCO, $80 | $04, $0c
    db OWN | DRAPER, $00 | $01, $12
    db OWN | JAVI, $80 | $04, $0c
    db OWN | RABBIT, $80 | $04, $0c
    db OWN | LYNX, $80 | $04, $0c
    db OWN | HAWKEYE, $80 | $04, $0c
    db OWN | SEEKER, $80 | $04, $0c
    db OWN | JAVI, $00 | $02, $13
    db FOE | JAVI, $00 | $0b, $02
    db FOE | HUNTER, $40 | $08, $03
    db FOE | HUNTER, $40 | $08, $03
    db FOE | LENET, $40 | $08, $03
    db FOE | RABBIT, $40 | $08, $03
    db FOE | MONSTER, $40 | $08, $03
    db OWN | HAWKEYE, $20 | $12, $01
    db FOE | SEEKER, $20 | $12, $01
    db FOE | FALCO, $60 | $1b, $08
    db FOE | FALCO, $60 | $1b, $08
    db FOE | HUNTER, $60 | $1b, $08
    db OWN | BISON, $60 | $1b, $08
    db OWN | LENET, $60 | $1b, $08
    db OWN | RABBIT, $60 | $1b, $08
    db OWN | NASHORN, $60 | $1b, $08
    db OWN | SLAGGER, $60 | $1b, $08
    db FOE | NASHORN, $00 | $19, $12
    db OWN | PELICAN, $80 | $04, $0c
    db FOE | JAVI, $00 | $1b, $0f
    db OWN | BISON, $00 | $02, $11
    db OWN | BISON, $00 | $01, $0f
    db OWN | HAWKEYE, $00 | $03, $12
    db FOE | FALCO, $00 | $0a, $05
    db FOE | LENET, $00 | $05, $05
    db FOE | BISON, $00 | $05, $03
    db FOE | NASHORN, $00 | $08, $05
    db FOE | MONSTER, $00 | $10, $01
    db FOE | SLAGGER, $00 | $18, $04
    db FOE | DARBEK, $00 | $1a, $13
    db FOE | PELICAN, $00 | $1c, $0b
    db OWN | MUNKS, $00 | $03, $10
    db FOE | HAWKEYE, $00 | $0e, $12
    db FOE | HAWKEYE, $00 | $12, $11
    db FOE | DARBEK, $00 | $0a, $06
    db OWN | NASHORN, $80 | $04, $0c
    db OWN | JAVI, $00 | $05, $11
    db OWN | HUNTER, $20 | $12, $01
    db OWN | HUNTER, $20 | $12, $01
    db FOE | RABBIT, $00 | $1b, $11
    db FOE | FALCO, $20 | $12, $01
    db FOE | FALCO, $20 | $12, $01
    db FOE | MUNKS, $00 | $1a, $06
    db FOE | GIANT, $00 | $11, $01
    db FOE | FALCO, $00 | $11, $05
    db FOE | RHINO, $00 | $15, $02
    db $ff

SECTION "nectaris/map_contest: Map E40", ROMX

MapE40::
    map " M Mooo  oo MMMMMMM + MMMM~~o~~ ", \
        " MMMMM   MMMMMMMMM +++M MMMMf~~ ", \
        "MoMMMMMMMMMMM MMM++ ~ +g MMM +~ ", \
        "  MMMMMMM M+ + + +~~ ~++ MMMM+  ", \
        "u MMMMM o +M+~+ +~~~~~  MMMM+o  ", \
        "++  M  ++++M   ~~~~~~~~~MMMM+oo ", \
        "MM++ ++~ooMM MMM~~~ ~~~~MMM +   ", \
        "MM M+ ++ooM MMMM  ~~~ ~~   +++  ", \
        "MMMMMM  ++~~~MMMMf~~ ~  ##+oo+  ", \
        "MMMMMMoo~~++     +~+ + + *+oo+  ", \
        "MMMMMMMMM +o+++++++ + +M+#M++MM ", \
        " MMMM MMM++oo  ~~~++~MMMMM#+ MM ", \
        " MMMM    +    f~~~~~+MMMM #+ MM ", \
        "  M ~~ ++~####~~~~~~+MMMM+* ++  ", \
        " U   ++~~~~~~#~~~~~~+MMMM+##  + ", \
        "   ++  M   MMM##~~~++ Moo+ #    ", \
        " ++  MMMMMMMMM ~#++MMM oo+  #   ", \
        "+  MMMMMMMMMMMM+* MMMMMMo+  ### ", \
        "MMMMMMMMMMMMMM +##MMMMMM +G     ", \
        "MMMMMMMMMMMMMMM+ #M MMMMM+      ", \
        "M M M M M M M       M M         ", \
        "   M U M M U M M   M     M M # M"
    db FOE | GIANT, $00 | $1a, $12
    db FOE | HUNTER, $20 | $1c, $01
    db FOE | HUNTER, $20 | $1c, $01
    db OWN | HUNTER, $60 | $00, $04
    db OWN | FALCO, $60 | $00, $04
    db OWN | SEEKER, $60 | $00, $04
    db OWN | HAWKEYE, $60 | $00, $04
    db OWN | JAVI, $60 | $00, $04
    db OWN | BISON, $60 | $00, $04
    db OWN | LYNX, $60 | $00, $04
    db OWN | RABBIT, $60 | $00, $04
    db OWN | PELICAN, $40 | $17, $02
    db OWN | DARBEK, $40 | $17, $02
    db OWN | SLAGGER, $40 | $17, $02
    db FOE | SLAGGER, $40 | $17, $02
    db FOE | MONSTER, $40 | $17, $02
    db FOE | MONSTER, $40 | $17, $02
    db OWN | DILLO, $40 | $17, $02
    db OWN | GRIZZLY, $60 | $00, $04
    db OWN | GRIZZLY, $a0 | $0e, $0c
    db OWN | DILLO, $a0 | $0e, $0c
    db OWN | FALCO, $a0 | $0e, $0c
    db OWN | RABBIT, $00 | $0e, $0a
    db OWN | RABBIT, $00 | $0d, $0b
    db FOE | RHINO, $00 | $16, $09
    db FOE | HUNTER, $80 | $11, $08
    db FOE | JAVI, $80 | $11, $08
    db FOE | ESTOL, $80 | $11, $08
    db OWN | DILLO, $80 | $11, $08
    db OWN | BISON, $00 | $0b, $0a
    db OWN | GIANT, $00 | $01, $0e
    db OWN | MUNKS, $00 | $01, $0f
    db OWN | PELICAN, $00 | $05, $0e
    db FOE | RHINO, $00 | $19, $0c
    db OWN | MONSTER, $80 | $11, $08
    db OWN | RABBIT, $80 | $11, $08
    db OWN | DRAPER, $00 | $01, $03
    db FOE | SLAGGER, $00 | $1a, $09
    db FOE | MONSTER, $00 | $1c, $0b
    db OWN | DARBEK, $80 | $11, $08
    db FOE | SLAGGER, $20 | $1c, $01
    db FOE | HUNTER, $20 | $1c, $01
    db FOE | ESTOL, $20 | $1c, $01
    db FOE | HUNTER, $20 | $1c, $01
    db FOE | MONSTER, $20 | $1c, $01
    db FOE | HUNTER, $20 | $1c, $01
    db FOE | RABBIT, $20 | $1c, $01
    db FOE | HUNTER, $20 | $1c, $01
    db FOE | LENET, $00 | $15, $0a
    db FOE | BISON, $00 | $1c, $0f
    db FOE | DRAPER, $00 | $19, $09
    db FOE | DRAPER, $00 | $14, $0f
    db FOE | DARBEK, $00 | $1b, $01
    db OWN | NASHORN, $a0 | $0e, $0c
    db OWN | SEEKER, $a0 | $0e, $0c
    db OWN | RABBIT, $a0 | $0e, $0c
    db $ff

SECTION "nectaris/map_contest: Map E41", ROMX

MapE41::
    map "          MMMMMMMMM       oooo  ", \
        "   u ~      MMMMM           oo  ", \
        " +  ~M    ~~MMMM ~~   MM        ", \
        "+ ++       ~~MMMM~              ", \
        " U ++  ~ f  ~MMM ~~          G  ", \
        "    ++ ~      MM ~  f    +++++  ", \
        "      ++++++ MMM    +   +     + ", \
        "           ~~MMM +++++++++  oo  ", \
        "MM         ~~~MMM~~       g o   ", \
        "MMMMMM M  M ~MMM ~ M            ", \
        "MMMMM MMM   MMMMM~ M + # M M o M"
    db OWN | FALCO, $20 | $03, $01
    db OWN | FALCO, $20 | $03, $01
    db OWN | PELICAN, $20 | $03, $01
    db OWN | PELICAN, $20 | $03, $01
    db OWN | PELICAN, $20 | $03, $01
    db OWN | MUNKS, $20 | $03, $01
    db OWN | MUNKS, $20 | $03, $01
    db OWN | RHINO, $20 | $03, $01
    db OWN | HAWKEYE, $40 | $09, $04
    db OWN | SEEKER, $40 | $09, $04
    db OWN | JAVI, $40 | $09, $04
    db OWN | RABBIT, $40 | $09, $04
    db OWN | RABBIT, $40 | $09, $04
    db FOE | PELICAN, $80 | $1a, $08
    db FOE | PELICAN, $80 | $1a, $08
    db FOE | PELICAN, $80 | $1a, $08
    db FOE | DARBEK, $80 | $1a, $08
    db FOE | DARBEK, $80 | $1a, $08
    db OWN | FALCO, $60 | $14, $05
    db OWN | HUNTER, $60 | $14, $05
    db OWN | JAVI, $60 | $14, $05
    db OWN | HAWKEYE, $60 | $14, $05
    db OWN | HAWKEYE, $60 | $14, $05
    db OWN | RABBIT, $60 | $14, $05
    db OWN | FALCO, $40 | $09, $04
    db OWN | JAVI, $40 | $09, $04
    db FOE | FALCO, $00 | $1d, $08
    db FOE | PELICAN, $60 | $14, $05
    db FOE | PELICAN, $60 | $14, $05
    db FOE | PELICAN, $60 | $14, $05
    db FOE | MUNKS, $60 | $14, $05
    db OWN | DARBEK, $40 | $09, $04
    db FOE | MUNKS, $60 | $14, $05
    db FOE | DARBEK, $60 | $14, $05
    db OWN | DARBEK, $80 | $1a, $08
    db FOE | HUNTER, $80 | $1a, $08
    db FOE | JAVI, $80 | $1a, $08
    db FOE | JAVI, $80 | $1a, $08
    db FOE | HUNTER, $80 | $1a, $08
    db FOE | FALCO, $80 | $1a, $08
    db OWN | DARBEK, $60 | $14, $05
    db OWN | DARBEK, $60 | $14, $05
    db FOE | GIANT, $00 | $1d, $04
    db OWN | RABBIT, $40 | $09, $04
    db FOE | YAMA, $00 | $04, $05
    db $ff

SECTION "nectaris/map_contest: Map E42", ROMX

MapE42::
    map "MM+MMMM~~MMM +oo", \
        "Mo++~~M~~MMM +o~", \
        "    + ~  MMMM+ ~", \
        "o U +     M  +~~", \
        "oo ++M     oo+~~", \
        "oo+ ~M     ++ ~ ", \
        "oo+~  M MM + G M", \
        "  +~~~MMM  +   M", \
        "  + ~~MMMMMM++~M", \
        "   M o  MMMM +~M", \
        "MMM MMoMMGMMM~M "
    db OWN | MUNKS, $00 | $03, $03
    db FOE | DRAPER, $00 | $0d, $08
    db OWN | LYNX, $00 | $04, $02
    db OWN | RABBIT, $00 | $05, $02
    db FOE | NASHORN, $00 | $0b, $04
    db FOE | DARBEK, $00 | $0b, $06
    db FOE | LYNX, $00 | $0e, $05
    db FOE | MONSTER, $00 | $0a, $05
    db FOE | BISON, $00 | $0a, $07
    db OWN | BISON, $00 | $04, $06
    db $ff

SECTION "nectaris/map_contest: Map E43", ROMX

MapE43::
    map " M Mooo  oo MMMMMMM + MMMM~~o~~ ", \
        " MMMMM   MMMMMMMMM +++M MMMMf~~ ", \
        "MoMMMMMMMMMMM MMM++ ~ +g MMM +~ ", \
        "  MMMMMMM M+ + + +~~ ~++ MMMM+  ", \
        "u MMMMM o +M+~+ +~~~~~  MMMM+o  ", \
        "++  M  ++++M   ~~~~~~~~~MMMM+oo ", \
        "MM++ ++~ooMM MMM~~~ ~~~~MMM +   ", \
        "MM M+ ++ooM MMMM  ~~~ ~~   +++  ", \
        "MMMMMM  ++~~~MMMMf~~ ~  ##+oo+  ", \
        "MMMMMMoo~~++     +~+ + + *+oo+  ", \
        "MMMMMMMMM +o+++++++ + +M+#M++MM ", \
        " MMMM MMM++oo  ~~~++~MMMMM#+ MM ", \
        " MMMM    +    f~~~~~+MMMM #+ MM ", \
        "  M ~~ ++~####~~~~~~+MMMM+* ++  ", \
        " U   ++~~~~~~#~~~~~~+MMMM+##  + ", \
        "   ++  M   MMM##~~~++ Moo+ #    ", \
        " ++  MMMMMMMMM ~#++MMM oo+  #   ", \
        "+  MMMMMMMMMMMM+* MMMMMMo+  ### ", \
        "MMMMMMMMMMMMMM +##MMMMMM +G     ", \
        "MMMMMMMMMMMMMMM+ #M MMMMM+      ", \
        "M M M M M M M       M M         ", \
        " M M o M M M M M # M M # M M   M"
    db FOE | DARBEK, $00 | $00, $03
    db OWN | DRAPER, $60 | $00, $04
    db FOE | HUNTER, $80 | $11, $08
    db FOE | HUNTER, $80 | $11, $08
    db FOE | HUNTER, $80 | $11, $08
    db FOE | HUNTER, $80 | $11, $08
    db FOE | HUNTER, $80 | $11, $08
    db OWN | YAMA, $00 | $01, $03
    db OWN | YAMA, $00 | $01, $04
    db OWN | HUNTER, $60 | $00, $04
    db OWN | JAVI, $60 | $00, $04
    db FOE | SEEKER, $a0 | $0e, $0c
    db FOE | FALCO, $a0 | $0e, $0c
    db FOE | FALCO, $a0 | $0e, $0c
    db FOE | FALCO, $a0 | $0e, $0c
    db FOE | FALCO, $a0 | $0e, $0c
    db FOE | FALCO, $a0 | $0e, $0c
    db OWN | HAWKEYE, $20 | $1c, $01
    db OWN | JAVI, $20 | $1c, $01
    db FOE | HAWKEYE, $40 | $17, $02
    db OWN | DILLO, $40 | $17, $02
    db OWN | GRIZZLY, $40 | $17, $02
    db FOE | JAVI, $a0 | $0e, $0c
    db OWN | SEEKER, $20 | $1c, $01
    db FOE | SEEKER, $a0 | $0e, $0c
    db OWN | YAMA, $00 | $0f, $0c
    db OWN | YAMA, $00 | $11, $0b
    db FOE | MUNKS, $00 | $10, $0d
    db OWN | HUNTER, $80 | $11, $08
    db OWN | SLAGGER, $80 | $11, $08
    db OWN | SLAGGER, $80 | $11, $08
    db OWN | GIANT, $80 | $11, $08
    db $ff

SECTION "nectaris/map_contest: Map E44", ROMX

MapE44::
    map "MMMMooo+~~MMMMMMMMM ~~~     ooo ", \
        "MMMMo  +~ MMM~ MMMM         ooo ", \
        "MMM    +~ MM ~~~M   ## +++ U    ", \
        " MM   +     ~ ~      *+         ", \
        "     ++        u + ++# M        ", \
        "           o      +  # MMM      ", \
        "  f  M MMMoooo     ~~~#MMMM  MM ", \
        "     MM M ~~o MM MM~~~# MMMMMMM ", \
        "MM MMM ~ ~~~~ MMMMM~~   MMMMMMM ", \
        "MMMMMM ~~~~~~~MMMMM    ~ MMMMMM ", \
        "MMMMM   ~              ~~~MMM   ", \
        "MMMMM       f   ~~~M M  ~~      ", \
        "MMM  + MMM      ~~~MMMM ~~~~    ", \
        "M    + MMMMM M   ~~ MMM ~~~  M  ", \
        "     +  MMM MMMM    M  ~~~  MMM ", \
        "    + + MM    MMM   ~~~~~   MMM ", \
        " g ++ +        MMMMM  ~~  f  MM ", \
        "      ++ + G    MMMMM ~~     MM ", \
        "   M   ++      MMMMMM ~  M MMMM ", \
        "MMMMM  +      MMMMMo o  MMMMMMM ", \
        "MMMMM  +      MMM ooooooMMMMMMM ", \
        "MMM  M M M ~ M +MMoMo oMMMMMMMMM"
    db OWN | MUNKS, $00 | $02, $05
    db OWN | MUNKS, $00 | $01, $06
    db OWN | MUNKS, $00 | $03, $06
    db FOE | MUNKS, $00 | $01, $05
    db FOE | MUNKS, $00 | $03, $05
    db FOE | MUNKS, $00 | $02, $07
    db OWN | PELICAN, $40 | $02, $06
    db OWN | PELICAN, $40 | $02, $06
    db OWN | PELICAN, $40 | $02, $06
    db OWN | PELICAN, $40 | $02, $06
    db FOE | SEEKER, $80 | $01, $10
    db FOE | SEEKER, $80 | $01, $10
    db FOE | HAWKEYE, $80 | $01, $10
    db FOE | RABBIT, $80 | $01, $10
    db FOE | RABBIT, $80 | $01, $10
    db FOE | LYNX, $80 | $01, $10
    db FOE | HUNTER, $80 | $01, $10
    db FOE | HUNTER, $80 | $01, $10
    db FOE | HUNTER, $80 | $01, $10
    db FOE | SLAGGER, $00 | $0c, $10
    db FOE | SLAGGER, $00 | $09, $11
    db FOE | HUNTER, $a0 | $1a, $10
    db FOE | HUNTER, $a0 | $1a, $10
    db FOE | DRAPER, $80 | $01, $10
    db FOE | GIANT, $00 | $02, $0e
    db OWN | FALCO, $00 | $1b, $02
    db OWN | JAVI, $00 | $1c, $02
    db OWN | JAVI, $00 | $1c, $03
    db OWN | HAWKEYE, $00 | $10, $04
    db OWN | RABBIT, $00 | $13, $03
    db OWN | RABBIT, $00 | $14, $04
    db OWN | NASHORN, $20 | $0f, $04
    db OWN | ESTOL, $20 | $0f, $04
    db OWN | BISON, $20 | $0f, $04
    db OWN | BISON, $20 | $0f, $04
    db FOE | SLAGGER, $00 | $0a, $10
    db OWN | SEEKER, $60 | $0c, $0b
    db OWN | SEEKER, $60 | $0c, $0b
    db OWN | SEEKER, $60 | $0c, $0b
    db OWN | SEEKER, $60 | $0c, $0b
    db OWN | GRIZZLY, $00 | $0e, $06
    db OWN | DILLO, $00 | $0d, $04
    db OWN | DRAPER, $00 | $0b, $0a
    db OWN | DRAPER, $00 | $0d, $0a
    db OWN | DRAPER, $00 | $0c, $0c
    db FOE | DRAPER, $00 | $0c, $0a
    db FOE | DRAPER, $00 | $0b, $0b
    db FOE | DRAPER, $00 | $0d, $0b
    db FOE | PELICAN, $80 | $01, $10
    db FOE | MUNKS, $80 | $01, $10
    db FOE | RHINO, $00 | $0b, $11
    db FOE | NASHORN, $00 | $0b, $12
    db FOE | MONSTER, $00 | $03, $0d
    db FOE | MONSTER, $00 | $04, $0f
    db FOE | MONSTER, $00 | $04, $11
    db FOE | ESTOL, $00 | $07, $10
    db $ff
