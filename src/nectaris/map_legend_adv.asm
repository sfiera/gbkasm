; Disassembly of "Nectaris GB (Japan) (SGB Enhanced).gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "trap.inc"
INCLUDE "nectaris/map.inc"
INCLUDE "nectaris/units.inc"

SECTION "nectaris/map_legend_adv: Map D01 Tlover", ROMX

MapD01Tlover::
    map "MMMMMM~#MMM~~MM ", \
        "M  M  ~~# oooo  ", \
        "M  M o  ##  o++ ", \
        "M ooM  M # ++ M ", \
        "MMo MMM  *+   M ", \
        "M    o  +#    M ", \
        "M    M ++MMM G  ", \
        "MMMMM++~M  M ~  ", \
        "M U~+   M o MMM ", \
        "M          ~~MM ", \
        " M M M MM  M #  "
    db OWN | JAVI, $00 | $04, $09
    db OWN | BISON, $00 | $07, $04
    db OWN | BISON, $00 | $07, $08
    db OWN | NASHORN, $00 | $09, $09
    db OWN | RABBIT, $00 | $08, $06
    db OWN | SEEKER, $00 | $01, $09
    db OWN | MUNKS, $00 | $04, $05
    db OWN | MUNKS, $00 | $06, $06
    db OWN | PELICAN, $00 | $01, $06
    db FOE | SLAGGER, $00 | $0a, $04
    db FOE | SLAGGER, $00 | $0b, $05
    db FOE | MONSTER, $00 | $0c, $00
    db FOE | SEEKER, $00 | $0d, $05
    db FOE | HAWKEYE, $00 | $0e, $02
    db FOE | RHINO, $00 | $0d, $06
    db FOE | DARBEK, $00 | $0b, $01
    db FOE | PELICAN, $00 | $09, $01
    db $ff

SECTION "nectaris/map_legend_adv: Map D02 Suraci", ROMX

MapD02Suraci::
    map "MMM++++++++++++ ", \
        "M++ooMoooMo~~   ", \
        "+oooMMMMMMMMG + ", \
        "+ o  MMMMMMoo++ ", \
        "+   ~oooo  ++oM ", \
        "++  ooo++++oo M ", \
        " +  o++~~MoMo   ", \
        " U ++  ~~MMMMM  ", \
        "    oMoo~oM M   ", \
        "~~~~~MMMoo   ~~ ", \
        "+o+o+ooovvvMM~o "
    db OWN | JAVI, $00 | $01, $03
    db OWN | GRIZZLY, $00 | $00, $02
    db OWN | DILLO, $00 | $04, $00
    db OWN | DILLO, $00 | $05, $07
    db OWN | RABBIT, $00 | $06, $06
    db OWN | LYNX, $00 | $03, $06
    db OWN | MUNKS, $00 | $02, $08
    db OWN | MUNKS, $00 | $04, $04
    db OWN | PELICAN, $00 | $02, $05
    db FOE | SLAGGER, $00 | $08, $06
    db FOE | SLAGGER, $00 | $0a, $04
    db FOE | MONSTER, $00 | $07, $01
    db FOE | GIANT, $00 | $0e, $00
    db FOE | NASHORN, $00 | $09, $00
    db FOE | NASHORN, $00 | $0b, $05
    db FOE | HAWKEYE, $00 | $0e, $03
    db FOE | RHINO, $00 | $0d, $01
    db FOE | RHINO, $00 | $0d, $06
    db FOE | MUNKS, $00 | $0e, $08
    db FOE | MULE, $00 | $0e, $06
    db $ff

SECTION "nectaris/map_legend_adv: Map D03 Onaryc", ROMX

MapD03Onaryc::
    map "#+++~oM  +  +   ", \
        "##  ++ ++++~+G  ", \
        " # ~~~+~~~o~+   ", \
        " MMM~~~~oo~~+++ ", \
        "MU  M  Mo  +++g ", \
        "M  ~MMMMM++  +o ", \
        "oo~~MMMM +    + ", \
        "++~~M MMM+    + ", \
        " M++  M  + o  + ", \
        "MMMM++++++++ ++ ", \
        "    MM++  +wMMM "
    db OWN | GIANT, $00 | $01, $00
    db OWN | GIANT, $00 | $04, $01
    db OWN | GIANT, $00 | $07, $08
    db OWN | RABBIT, $00 | $05, $02
    db OWN | RABBIT, $00 | $06, $01
    db OWN | RABBIT, $00 | $08, $06
    db OWN | RABBIT, $00 | $0b, $07
    db OWN | LYNX, $00 | $05, $04
    db OWN | LYNX, $00 | $05, $08
    db OWN | LYNX, $00 | $09, $09
    db OWN | MUNKS, $00 | $02, $02
    db OWN | MUNKS, $00 | $02, $05
    db OWN | PELICAN, $00 | $01, $07
    db FOE | SEEKER, $00 | $0e, $00
    db FOE | RHINO, $00 | $0a, $00
    db FOE | RHINO, $00 | $0a, $03
    db FOE | RHINO, $00 | $0c, $04
    db FOE | RHINO, $00 | $0d, $01
    db FOE | RHINO, $00 | $0e, $05
    db FOE | MONSTER, $00 | $08, $00
    db FOE | DARBEK, $00 | $08, $02
    db FOE | MONSTER, $00 | $09, $04
    db FOE | DARBEK, $00 | $0a, $06
    db FOE | DARBEK, $00 | $0c, $00
    db FOE | MONSTER, $00 | $0d, $06
    db FOE | MULE, $00 | $0d, $02
    db OWN | PELICAN, $20 | $0e, $04
    db OWN | MUNKS, $20 | $0e, $04
    db $ff

SECTION "nectaris/map_legend_adv: Map D04 Yesmar", ROMX

MapD04Yesmar::
    map "MMM   M ~G  oo# ", \
        "MMM ~~M       # ", \
        "MMM~~  M ~  ##  ", \
        "M  ~~ MMMM~g #~ ", \
        "M ~~  MMMMM~ #~ ", \
        "M ~~ MMMMM ~~~  ", \
        "MM ~Mf ~MM M~~~ ", \
        "MMM~MM  MMMMM ~ ", \
        "MM ~ M  MMMMM   ", \
        "M f~~~   MM     ", \
        " ooo~~~ M       ", \
        "o oo~   MMM     ", \
        " ~o    M o      ", \
        " ~u  MMooo      ", \
        "M~~~ MMoooo~    ", \
        " ~~  o +~~~~ MM ", \
        "M  U ++ ++~~~MM ", \
        "M   ~  ~  +~~ M ", \
        "M  ~ oo~~ + ~   ", \
        "MM   ooooo++++  ", \
        "~ ~ ~ ~  o   M~ "
    db FOE | SLAGGER, $00 | $0d, $09
    db FOE | MONSTER, $00 | $0e, $08
    db FOE | NASHORN, $00 | $08, $01
    db FOE | MUNKS, $00 | $05, $03
    db OWN | LENET, $20 | $0b, $03
    db OWN | RABBIT, $20 | $0b, $03
    db OWN | LYNX, $20 | $0b, $03
    db OWN | SLAGGER, $40 | $05, $06
    db OWN | SLAGGER, $40 | $05, $06
    db OWN | ESTOL, $40 | $05, $06
    db OWN | RABBIT, $40 | $05, $06
    db OWN | DARBEK, $40 | $05, $06
    db OWN | GRIZZLY, $60 | $02, $09
    db OWN | DILLO, $60 | $02, $09
    db OWN | NASHORN, $60 | $02, $09
    db OWN | RABBIT, $60 | $02, $09
    db OWN | MUNKS, $60 | $02, $09
    db OWN | MUNKS, $60 | $02, $09
    db OWN | DILLO, $80 | $02, $0d
    db OWN | BISON, $80 | $02, $0d
    db OWN | BISON, $80 | $02, $0d
    db OWN | RABBIT, $80 | $02, $0d
    db OWN | MUNKS, $80 | $02, $0d
    db $ff

SECTION "nectaris/map_legend_adv: Map D05 Notwen", ROMX

MapD05Notwen::
    map "    M M   ~~~## ", \
        "~MU       ### M ", \
        "~~oo       #  M ", \
        "~ooooooo    f M ", \
        "o   oooo     MM ", \
        "     ooo    MMM ", \
        " M    ooo   MMM ", \
        "MMMM    o   MMM ", \
        "MMM  M oo  o~~M ", \
        "M  ~~ o  oo~~~~ ", \
        "~~~~f  +oo~~~~~ ", \
        "~~~~  + ++ooo~~ ", \
        " M       +++f o ", \
        "MMMM    +    oo ", \
        "MMMM  ~++~ ~ ~~ ", \
        "M M    +  ~~~~M ", \
        " f   ++ +  ~~~M ", \
        "   ++   +   ~~M ", \
        "+++     ++  ~~~ ", \
        "     ~~   +G  ~ ", \
        "         +      "
    db OWN | GRIZZLY, $00 | $08, $04
    db OWN | BISON, $00 | $07, $01
    db OWN | RABBIT, $00 | $09, $02
    db OWN | SEEKER, $00 | $05, $02
    db OWN | MUNKS, $00 | $02, $04
    db OWN | MUNKS, $00 | $07, $02
    db FOE | YAMA, $00 | $03, $12
    db FOE | YAMA, $00 | $04, $0d
    db FOE | YAMA, $00 | $04, $10
    db FOE | YAMA, $00 | $06, $0c
    db FOE | YAMA, $00 | $06, $11
    db FOE | YAMA, $00 | $08, $0c
    db FOE | YAMA, $00 | $08, $0f
    db FOE | YAMA, $00 | $09, $11
    db FOE | YAMA, $00 | $0a, $0d
    db FOE | SLAGGER, $00 | $07, $0d
    db FOE | MONSTER, $00 | $05, $0e
    db FOE | NASHORN, $00 | $03, $11
    db FOE | ESTOL, $00 | $08, $11
    db FOE | MUNKS, $00 | $05, $12
    db FOE | MUNKS, $00 | $0a, $10
    db OWN | DILLO, $20 | $0c, $03
    db OWN | NASHORN, $20 | $0c, $03
    db OWN | RABBIT, $20 | $0c, $03
    db OWN | SEEKER, $20 | $0c, $03
    db OWN | RHINO, $20 | $0c, $03
    db OWN | MULE, $20 | $0c, $03
    db OWN | BISON, $40 | $04, $0a
    db OWN | GIANT, $40 | $04, $0a
    db OWN | NASHORN, $40 | $04, $0a
    db OWN | ESTOL, $40 | $04, $0a
    db OWN | MUNKS, $40 | $04, $0a
    db OWN | MULE, $40 | $04, $0a
    db OWN | RABBIT, $60 | $0c, $0c
    db OWN | RHINO, $60 | $0c, $0c
    db OWN | RABBIT, $60 | $0c, $0c
    db OWN | PELICAN, $60 | $0c, $0c
    db OWN | MUNKS, $60 | $0c, $0c
    db OWN | SLAGGER, $80 | $01, $10
    db OWN | RHINO, $80 | $01, $10
    db OWN | MONSTER, $80 | $01, $10
    db OWN | NASHORN, $80 | $01, $10
    db OWN | ESTOL, $80 | $01, $10
    db OWN | MULE, $80 | $01, $10
    db OWN | MUNKS, $80 | $01, $10
    db $ff

SECTION "nectaris/map_legend_adv: Map D06 Acenes", ROMX

MapD06Acenes::
    map "~~~~~~~+ + MM ~ ", \
        "MM ++++ + +   ~ ", \
        "M + ~Mo f ++f ~ ", \
        "M +~~MMMMMo+  ~ ", \
        "M +~~ MMMMM + ~ ", \
        " ++~MMMM  f ++  ", \
        " +~~MMMM oooo+  ", \
        " + ~~MMMoooo +  ", \
        " + M~MMMoMooo+  ", \
        " + MMMMMMMMM +  ", \
        "~~+~MMMMMMMMM+  ", \
        "~~+~~   MMMM  + ", \
        "~~+~~M MMMMMM~+ ", \
        "MM+U MMMMMMM ~+ ", \
        "M ++~MM  MM~~~+ ", \
        "~  +MM~#MMM~~ + ", \
        "~++oMM ~# M G + ", \
        "~+ oMMM~##MMM + ", \
        "+ oMMM ~~# #  + ", \
        " oMMMMM~~~# #   ", \
        "MMMMM~~+ oMMM M "
    db OWN | BISON, $00 | $00, $05
    db OWN | BISON, $00 | $00, $06
    db OWN | BISON, $00 | $00, $07
    db OWN | BISON, $00 | $00, $09
    db OWN | NASHORN, $00 | $03, $05
    db OWN | DILLO, $00 | $04, $03
    db OWN | BISON, $00 | $01, $0e
    db OWN | NASHORN, $00 | $00, $08
    db OWN | LYNX, $00 | $03, $0d
    db OWN | MUNKS, $00 | $01, $05
    db OWN | DILLO, $20 | $08, $02
    db OWN | GRIZZLY, $20 | $08, $02
    db OWN | GRIZZLY, $20 | $08, $02
    db OWN | DILLO, $20 | $08, $02
    db FOE | YAMA, $00 | $07, $01
    db FOE | YAMA, $00 | $0a, $02
    db FOE | RHINO, $00 | $08, $05
    db FOE | RHINO, $00 | $08, $06
    db FOE | MONSTER, $00 | $0c, $0b
    db FOE | RABBIT, $00 | $0e, $07
    db FOE | MUNKS, $00 | $0d, $0f
    db FOE | RHINO, $00 | $0c, $10
    db FOE | DARBEK, $00 | $0d, $0b
    db FOE | MULE, $00 | $0e, $0f
    db FOE | GIANT, $00 | $0e, $10
    db FOE | RHINO, $40 | $0a, $05
    db FOE | BISON, $40 | $0c, $02
    db FOE | BISON, $40 | $0c, $02
    db FOE | BISON, $40 | $0c, $02
    db FOE | ESTOL, $40 | $0a, $05
    db FOE | ESTOL, $40 | $0a, $05
    db FOE | LYNX, $60 | $0c, $02
    db $ff

SECTION "nectaris/map_legend_adv: Map D07 Enibas", ROMX

MapD07Enibas::
    map "~~~~~MM ~~MMMM  +  ++  ooooooo x", \
        "~~~     ~~~~MMM + +  oooo ooo  x", \
        "        ~~~~M+ ++++  ~o~~    G x", \
        "  u     M ~~+~+ +#++ ~~~~~     x", \
        " ++  M      +~ f  #+ ~~~~    + x", \
        "+    MM~~o  +#~  M#+  ~     +  x", \
        "  U  ~~M~ooo+ #MMM#+        g  x", \
        "~~ ~~~~MMo~~+M#+M+ +    MM     x", \
        "~M~~~~~~ Moo++*M+ ++++  M      x", \
        "MMMMMM~M~ o + ##f +  +   MMM   x", \
        "MMMM  +  + +M++  M    +        x"
    db OWN | BISON, $00 | $05, $02
    db OWN | DARBEK, $00 | $08, $08
    db OWN | BISON, $00 | $0a, $05
    db OWN | NASHORN, $00 | $09, $03
    db OWN | DARBEK, $00 | $03, $03
    db OWN | DARBEK, $00 | $07, $02
    db OWN | MULE, $00 | $0c, $03
    db FOE | JAVI, $00 | $1d, $01
    db FOE | JAVI, $00 | $17, $08
    db FOE | BISON, $00 | $15, $07
    db FOE | BISON, $00 | $19, $05
    db FOE | MUNKS, $00 | $1b, $07
    db OWN | GIANT, $20 | $02, $03
    db OWN | RABBIT, $20 | $02, $03
    db OWN | SEEKER, $20 | $02, $03
    db OWN | RABBIT, $20 | $02, $03
    db OWN | RABBIT, $20 | $02, $03
    db OWN | ESTOL, $20 | $02, $03
    db OWN | DARBEK, $40 | $0f, $04
    db OWN | DARBEK, $40 | $0f, $04
    db OWN | DARBEK, $40 | $0f, $04
    db OWN | MUNKS, $40 | $0f, $04
    db OWN | MUNKS, $40 | $0f, $04
    db OWN | MUNKS, $40 | $0f, $04
    db OWN | LYNX, $40 | $0f, $04
    db OWN | LYNX, $40 | $0f, $04
    db OWN | LYNX, $40 | $0f, $04
    db OWN | MONSTER, $60 | $10, $09
    db OWN | MONSTER, $60 | $10, $09
    db OWN | ESTOL, $60 | $10, $09
    db OWN | ESTOL, $60 | $10, $09
    db OWN | MUNKS, $60 | $10, $09
    db OWN | MUNKS, $60 | $10, $09
    db OWN | MUNKS, $60 | $10, $09
    db OWN | PELICAN, $60 | $10, $09
    db OWN | MUNKS, $60 | $10, $09
    db OWN | MONSTER, $60 | $10, $09
    db OWN | DARBEK, $60 | $10, $09
    db OWN | DARBEK, $60 | $10, $09
    db OWN | MULE, $80 | $1c, $06
    db OWN | MUNKS, $80 | $1c, $06
    db OWN | RABBIT, $80 | $1c, $06
    db OWN | MUNKS, $80 | $1c, $06
    db OWN | DILLO, $80 | $1c, $06
    db OWN | DILLO, $80 | $1c, $06
    db OWN | DILLO, $80 | $1c, $06
    db OWN | DILLO, $80 | $1c, $06
    db OWN | DILLO, $80 | $1c, $06
    db OWN | RABBIT, $80 | $1c, $06
    db OWN | RHINO, $80 | $1c, $06
    db $ff

SECTION "nectaris/map_legend_adv: Map D08 Sutara", ROMX

MapD08Sutara::
    map "~~~~MMMMMMMMM ~~ MMMM MMM~~    x", \
        " U ~MMMMMMM f ~M MMMMM   ~~+G  x", \
        " +  ~~MMMMMM M MMMM  ~~g ++    x", \
        "oo++ ~~~~ MMMM     + +o  + o o x", \
        "oo  ++~~~+  M  + ++ + +++o  o  x", \
        "ooo  + ++ ++ ++ + MM    ##oo # x", \
        "o o   +M MMM+M M MM ~~  o#oo~~ x", \
        "~u o o MMMMMMMMMMM ~~   M# o## x", \
        "~~ oo  MMMM MMM MMM~~M~~~~#oo  x", \
        "~~oMMMMMM ~~~~ ~M~ ~~MMM~~#o + x", \
        "MMMMMMMMMM ~~~~~~ ljkl++++ ++  x"
    db OWN | FALCO, $00 | $01, $03
    db OWN | JAVI, $00 | $02, $06
    db OWN | HAWKEYE, $00 | $07, $04
    db OWN | HAWKEYE, $00 | $08, $06
    db OWN | DARBEK, $00 | $04, $07
    db OWN | MUNKS, $00 | $05, $02
    db OWN | NASHORN, $00 | $05, $08
    db OWN | BISON, $00 | $06, $05
    db OWN | RABBIT, $00 | $05, $03
    db OWN | GIANT, $00 | $0a, $05
    db OWN | YAMA, $00 | $0f, $03
    db FOE | HUNTER, $00 | $19, $08
    db FOE | HUNTER, $00 | $17, $05
    db FOE | SEEKER, $00 | $12, $03
    db FOE | HAWKEYE, $00 | $14, $04
    db FOE | MUNKS, $00 | $16, $05
    db FOE | DARBEK, $00 | $13, $02
    db FOE | NASHORN, $00 | $15, $07
    db FOE | BISON, $00 | $19, $02
    db FOE | RABBIT, $00 | $18, $04
    db FOE | GIANT, $00 | $12, $04
    db FOE | FALCO, $00 | $1a, $08
    db FOE | YAMA, $00 | $0e, $04
    db OWN | MULE, $20 | $01, $07
    db OWN | RHINO, $20 | $01, $07
    db OWN | HUNTER, $20 | $01, $07
    db OWN | PELICAN, $20 | $01, $07
    db OWN | YAMA, $40 | $0c, $01
    db OWN | JAVI, $40 | $0c, $01
    db OWN | PELICAN, $60 | $17, $02
    db OWN | MUNKS, $60 | $17, $02
    db OWN | BISON, $60 | $17, $02
    db OWN | MULE, $60 | $17, $02
    db OWN | RHINO, $60 | $17, $02
    db OWN | HUNTER, $60 | $17, $02
    db OWN | LYNX, $60 | $17, $02
    db OWN | DILLO, $60 | $17, $02
    db OWN | HUNTER, $60 | $17, $02
    db OWN | HUNTER, $60 | $17, $02
    db $ff

SECTION "nectaris/map_legend_adv: Map D09 Siolag", ROMX

MapD09Siolag::
    map "ooo   + ~~MMMMM##~~MMMMMM MMMM x", \
        "ooo++++ ~~MMM #o MMMM    ~M MM x", \
        "oo +   ~~~MMM##MMMM  f ~~~~~~  x", \
        "o  u  ~~~~MM~~#MM      ~~~~~~  x", \
        "o  +  ~~~~ MMM#MM   ooo ~~~    x", \
        "o +   ~~M MMM~~MMM ooooo       x", \
        "  ++   ~~ MMM~~MM   ooooo~     x", \
        " U  +  ~  MMMM~      ooo~~     x", \
        "    ++    MMM f ##MM ~~~M~~  + x", \
        " ~~~~+~~     M   #MMM~~~~   +  x", \
        "~~~M~+~~   M    ~ MM ~~MMM ++  x", \
        "~ ~MMM+~~  MMM    M  ~~ MMM+   r", \
        "~~ MM +  M  MMMf      ~~~ ~+   k", \
        "~~   ~+ M MM     MM     ~~~+   o", \
        "MM f~~+ M~MM MMMMMMM     + +   q", \
        "M     + ~  MMMMMMMM     + + +  x", \
        "MM   ++ ~~ MM M#MM #       ++  x", \
        "M  ++   ~~ MM~o#MM  #    + g   x", \
        "M  +   ~~~MM~#~MMMM~## ++ +    x", \
        "MM + ~ ~~~MM~~#MMM ~~#+ G    M x", \
        " # G    M # G    M+ MMzv#MM #  x"
    db FOE | RHINO, $00 | $1c, $13
    db FOE | DRAPER, $00 | $13, $0d
    db OWN | DILLO, $20 | $03, $03
    db OWN | RABBIT, $20 | $03, $03
    db OWN | RABBIT, $20 | $03, $03
    db OWN | SEEKER, $20 | $03, $03
    db OWN | SEEKER, $20 | $03, $03
    db OWN | MULE, $20 | $03, $03
    db OWN | MUNKS, $20 | $03, $03
    db OWN | MULE, $20 | $03, $03
    db OWN | MUNKS, $20 | $03, $03
    db OWN | JAVI, $40 | $03, $0e
    db OWN | JAVI, $40 | $03, $0e
    db OWN | GRIZZLY, $40 | $03, $0e
    db OWN | GRIZZLY, $40 | $03, $0e
    db OWN | BISON, $40 | $03, $0e
    db OWN | BISON, $40 | $03, $0e
    db OWN | RABBIT, $40 | $03, $0e
    db OWN | SEEKER, $40 | $03, $0e
    db OWN | HAWKEYE, $40 | $03, $0e
    db OWN | HAWKEYE, $40 | $03, $0e
    db OWN | PELICAN, $40 | $03, $0e
    db OWN | MUNKS, $40 | $03, $0e
    db OWN | HUNTER, $60 | $0e, $08
    db OWN | HUNTER, $60 | $0e, $08
    db OWN | SEEKER, $60 | $0e, $08
    db OWN | MULE, $60 | $0e, $08
    db OWN | YAMA, $60 | $0e, $08
    db OWN | MULE, $60 | $0e, $08
    db OWN | YAMA, $60 | $0e, $08
    db OWN | MUNKS, $80 | $0f, $0c
    db OWN | MUNKS, $80 | $0f, $0c
    db OWN | RABBIT, $80 | $0f, $0c
    db OWN | LYNX, $80 | $0f, $0c
    db OWN | SLAGGER, $80 | $0f, $0c
    db OWN | RABBIT, $80 | $0f, $0c
    db OWN | LYNX, $80 | $0f, $0c
    db OWN | PELICAN, $a0 | $15, $02
    db OWN | MUNKS, $a0 | $15, $02
    db OWN | PELICAN, $a0 | $15, $02
    db OWN | RHINO, $a0 | $15, $02
    db OWN | HUNTER, $a0 | $15, $02
    db OWN | SLAGGER, $a0 | $15, $02
    db OWN | MONSTER, $a0 | $15, $02
    db OWN | RABBIT, $a0 | $15, $02
    db OWN | RABBIT, $a0 | $15, $02
    db OWN | PELICAN, $c0 | $1b, $11
    db OWN | MUNKS, $c0 | $1b, $11
    db OWN | GIANT, $c0 | $1b, $11
    db OWN | GIANT, $c0 | $1b, $11
    db OWN | SEEKER, $c0 | $1b, $11
    db OWN | HAWKEYE, $c0 | $1b, $11
    db OWN | SEEKER, $c0 | $1b, $11
    db $ff

SECTION "nectaris/map_legend_adv: Map D10 Niwrad", ROMX

MapD10Niwrad::
    map "ooo o  MM M MM~~o oo MMMM MMM  x", \
        "o u~++++ +++M+++       +++M    x", \
        "o~+~~U M+  ~+~ ~++++ ++ ##+ f  x", \
        "~~++   MMM ~~~~o~~~~+~~~~#++   x", \
        "~ + ++ MM ~ ooo oooof~~~~ #+++ x", \
        "oo++MM++ +++ +++ +++ ooo~+#+ + x", \
        "ooo+M~~~+ M++o M+MMM++M++ +M~+ x", \
        "oo +MM~ ~~ +MMMMMMMMM++ ~~  +~ x", \
        "o++~MMMM~~~+MMM MMMMMM++~~~ +~ x", \
        " +~~MMM ~ ~+ ~~~M oMM  +~~~ ++ x", \
        "M+~~M      +~f~~~~~~M  +~MMM + x", \
        " +   M   ++M~ ~~~f~   +  MM  + r", \
        "o+ ~MMMM + MMMMM   MMM+g MM  + k", \
        "o+~~~oM  + MMMMMMMMMM +  MM++o o", \
        "o+~~~o ~~+  MMMMMMMMM +M   + o q", \
        "o~+ooof~~+ ~~MMMM    ++MMM +   x", \
        "  + oM  +o++~~M ~~ +++ MM  +G  x", \
        " ++++++++ oo~o ooo  ~~+o  M+   x", \
        " +M+ + +o+o+o+o+o+ +~+++o++  M x", \
        "~ + + + + + + + + + + + +    M x", \
        " ~ ~ ~ ~ ~~+o+o+o+o+ +~+++ot~+ x"
    db OWN | FALCO, $00 | $07, $03
    db OWN | FALCO, $00 | $07, $04
    db OWN | FALCO, $00 | $06, $04
    db OWN | FALCO, $00 | $03, $04
    db OWN | FALCO, $00 | $03, $05
    db OWN | FALCO, $00 | $02, $05
    db OWN | MUNKS, $00 | $09, $01
    db OWN | MULE, $00 | $06, $01
    db FOE | FALCO, $00 | $18, $0b
    db FOE | HUNTER, $00 | $19, $0a
    db FOE | HUNTER, $00 | $19, $0b
    db FOE | HUNTER, $00 | $1a, $0a
    db FOE | HUNTER, $00 | $1a, $0c
    db FOE | HUNTER, $00 | $1b, $09
    db FOE | HUNTER, $00 | $1b, $0c
    db FOE | MUNKS, $00 | $16, $0d
    db FOE | DARBEK, $00 | $1d, $0c
    db FOE | DRAPER, $00 | $14, $13
    db FOE | MULE, $00 | $1d, $0a
    db OWN | HAWKEYE, $20 | $02, $01
    db OWN | HAWKEYE, $20 | $02, $01
    db OWN | HAWKEYE, $20 | $02, $01
    db OWN | GIANT, $20 | $02, $01
    db OWN | SEEKER, $20 | $02, $01
    db OWN | GIANT, $20 | $02, $01
    db OWN | GRIZZLY, $20 | $02, $01
    db OWN | DILLO, $20 | $02, $01
    db OWN | NASHORN, $20 | $02, $01
    db OWN | ESTOL, $20 | $02, $01
    db OWN | MUNKS, $20 | $02, $01
    db OWN | SLAGGER, $40 | $06, $0f
    db OWN | GIANT, $40 | $06, $0f
    db OWN | HUNTER, $40 | $06, $0f
    db OWN | HUNTER, $40 | $06, $0f
    db OWN | PELICAN, $60 | $0d, $0a
    db OWN | DARBEK, $60 | $0d, $0a
    db OWN | RABBIT, $80 | $11, $0b
    db OWN | RABBIT, $80 | $11, $0b
    db OWN | LYNX, $80 | $11, $0b
    db OWN | ESTOL, $80 | $11, $0b
    db OWN | ESTOL, $80 | $11, $0b
    db OWN | SEEKER, $a0 | $14, $04
    db OWN | GIANT, $a0 | $14, $04
    db OWN | ESTOL, $a0 | $14, $04
    db OWN | BISON, $a0 | $14, $04
    db OWN | BISON, $a0 | $14, $04
    db OWN | SLAGGER, $a0 | $14, $04
    db OWN | NASHORN, $a0 | $14, $04
    db OWN | MONSTER, $a0 | $14, $04
    db OWN | SEEKER, $c0 | $17, $0c
    db OWN | HAWKEYE, $c0 | $17, $0c
    db OWN | BISON, $c0 | $17, $0c
    db OWN | SLAGGER, $e0 | $1c, $02
    db OWN | GIANT, $e0 | $1c, $02
    db OWN | SLAGGER, $e0 | $1c, $02
    db OWN | SLAGGER, $e0 | $1c, $02
    db $ff

SECTION "nectaris/map_legend_adv: Map D11 Lacsap", ROMX

MapD11Lacsap::
    map "MMMMMMMMMMMMMMMMMMMMMM  # #M#M x", \
        "MM o MMMM MMMMM   MMMMM MM#  M x", \
        "MM~~ooM~ ~MMM~  g ~MMM  MMMMMM x", \
        "MM~~oo M~~MM~~   ~MMMMM MMMMMM x", \
        " MMf   MMMMM ~G  ~MMMM MMMM  M x", \
        "# MM   oMMMMM +  ~M MMMMM oo M x", \
        "##MM   oMMMMMM++  ~MMMM  ooo~~ x", \
        " # MM  ooo MMMMo+ ooMo ooo~f~~ x", \
        "  # MM    ooM  o+oooooo~o# +   x", \
        "MM## ##   oooooo+~o~o~~   #+~~ x", \
        "M oo#         ~~~~~~~~~  +*~~~ x", \
        "M    o          ~   ~    +##~# r", \
        "MMM~~~oo     o o         + # # k", \
        "M ~~~o~ooo   ooo     MMM +  #o o", \
        "M ~~ooo o   oooo oo MMM~~+  #  q", \
        "   +        oMooooooMMM +   f  x", \
        "MM+ ++    ooMMMMooooM  +++ ++M x", \
        "M u   ++oooo MMM ooo   +  +f M x", \
        "M  M U  ++o  MM~MMoo ++      M x", \
        "M         ++ MM M  ++~ o     M x", \
        "o o o                    U     x"
    db OWN | BISON, $00 | $02, $0f
    db OWN | BISON, $00 | $04, $0f
    db OWN | DILLO, $00 | $06, $10
    db OWN | GRIZZLY, $00 | $07, $11
    db OWN | RABBIT, $00 | $08, $13
    db OWN | MUNKS, $00 | $05, $11
    db OWN | YAMA, $00 | $08, $0b
    db OWN | BISON, $00 | $03, $0f
    db OWN | BISON, $00 | $05, $0f
    db OWN | GRIZZLY, $20 | $02, $11
    db OWN | DILLO, $20 | $02, $11
    db OWN | BISON, $20 | $02, $11
    db OWN | RABBIT, $20 | $02, $11
    db OWN | MUNKS, $20 | $02, $11
    db FOE | YAMA, $00 | $0f, $06
    db FOE | YAMA, $00 | $11, $06
    db FOE | RHINO, $00 | $0f, $05
    db FOE | RHINO, $00 | $10, $05
    db FOE | SLAGGER, $00 | $0f, $07
    db FOE | BISON, $00 | $10, $07
    db FOE | BISON, $00 | $11, $07
    db FOE | SLAGGER, $00 | $10, $08
    db FOE | BISON, $00 | $10, $0a
    db FOE | SLAGGER, $00 | $0d, $05
    db FOE | RABBIT, $00 | $0e, $04
    db FOE | SLAGGER, $00 | $0f, $08
    db FOE | BISON, $00 | $11, $08
    db FOE | BISON, $00 | $10, $09
    db FOE | MUNKS, $00 | $0f, $02
    db FOE | MUNKS, $00 | $13, $07
    db OWN | MONSTER, $60 | $10, $02
    db OWN | GIANT, $60 | $10, $02
    db OWN | RABBIT, $60 | $10, $02
    db OWN | DILLO, $40 | $03, $04
    db OWN | LENET, $40 | $03, $04
    db OWN | ESTOL, $40 | $03, $04
    db OWN | SLAGGER, $40 | $03, $04
    db OWN | NASHORN, $40 | $03, $04
    db OWN | BISON, $40 | $03, $04
    db OWN | DILLO, $40 | $03, $04
    db OWN | MONSTER, $80 | $1b, $07
    db OWN | BISON, $80 | $1b, $07
    db OWN | SLAGGER, $80 | $1b, $07
    db OWN | SLAGGER, $80 | $1b, $07
    db OWN | RABBIT, $a0 | $1b, $11
    db OWN | RABBIT, $a0 | $1b, $11
    db OWN | BISON, $c0 | $1c, $0f
    db OWN | SLAGGER, $c0 | $1c, $0f
    db OWN | BISON, $c0 | $1c, $0f
    db OWN | BISON, $c0 | $1c, $0f
    db OWN | NASHORN, $80 | $1b, $07
    db $ff

SECTION "nectaris/map_legend_adv: Map D12 Yellah", ROMX

MapD12Yellah::
    map "MM~+++++##    ~~~~~~~MM MMMMM  x", \
        "M +    U # +++ o o~+++    M  + x", \
        "  +  MM+  #+o+ ooo+   ++o++f + x", \
        "o u~~M~+ +*ooo++o +~ M ++ ~  + x", \
        "oo o~~  +~oooo  +++MMMM+~~~~+  x", \
        "M oooo~~~oo  M  + ~MMM + M~ +  x", \
        "MM  ooooooo MMMM+o~ MM + MM ++ x", \
        "M ooo~o~o ooMMM +  MMM + MMM + x", \
        "MMo  M~~~ o MMM + MMMM + MM  + x", \
        "MMM MMMM~MMMMMM + MMMMM+MMM o+ x", \
        "MM ~MMMMMMMMM   +o  M  +MMMM + x", \
        "MM  MMMMMMM+ +  +  f  + MMMMM+ r", \
        "MMMM MMMM + + +++  +  + M    + k", \
        "MMM   M   +   ++   +++++ +++   o", \
        "M        ++     +  + Mo +~~+G  q", \
        " ++++++++       +++ooooooo~+ ~ x", \
        " +              + Moooooo+o +~ x", \
        "oof  ~     ooo  ++o+o+o++ ++++ x", \
        "oo  ~~~ oo ooo   o+ +~+ g ++ + x", \
        "ooo ~~~ ooooooo  ooo~~~     +  x", \
        "+o+     +  + Mo +~~+z~+ g o+   x"
    db OWN | SEEKER, $00 | $09, $04
    db OWN | JAVI, $00 | $0b, $01
    db OWN | BISON, $00 | $08, $03
    db OWN | DILLO, $00 | $07, $00
    db OWN | BISON, $00 | $02, $02
    db OWN | RABBIT, $00 | $06, $04
    db OWN | DARBEK, $00 | $03, $00
    db OWN | MULE, $00 | $05, $00
    db OWN | GIANT, $00 | $01, $02
    db OWN | DRAPER, $00 | $02, $06
    db FOE | HUNTER, $00 | $1a, $0e
    db FOE | SLAGGER, $00 | $13, $12
    db FOE | MONSTER, $00 | $1a, $12
    db FOE | RABBIT, $00 | $10, $13
    db FOE | LYNX, $00 | $18, $10
    db FOE | MUNKS, $00 | $15, $11
    db FOE | DARBEK, $00 | $18, $13
    db FOE | SEEKER, $00 | $0e, $12
    db OWN | MUNKS, $20 | $02, $03
    db OWN | FALCO, $20 | $02, $03
    db OWN | JAVI, $20 | $02, $03
    db OWN | BISON, $20 | $02, $03
    db OWN | HAWKEYE, $20 | $02, $03
    db OWN | HAWKEYE, $20 | $02, $03
    db OWN | PELICAN, $20 | $02, $03
    db OWN | RHINO, $20 | $02, $03
    db OWN | FALCO, $40 | $02, $11
    db OWN | JAVI, $40 | $02, $11
    db OWN | HUNTER, $40 | $02, $11
    db OWN | SEEKER, $40 | $02, $11
    db OWN | SEEKER, $40 | $02, $11
    db OWN | HAWKEYE, $40 | $02, $11
    db OWN | PELICAN, $40 | $02, $11
    db OWN | MUNKS, $40 | $02, $11
    db OWN | FALCO, $60 | $13, $0b
    db OWN | JAVI, $60 | $13, $0b
    db OWN | DILLO, $60 | $13, $0b
    db OWN | RABBIT, $60 | $13, $0b
    db OWN | LYNX, $60 | $13, $0b
    db OWN | HAWKEYE, $60 | $13, $0b
    db OWN | PELICAN, $60 | $13, $0b
    db OWN | RHINO, $60 | $13, $0b
    db OWN | PELICAN, $60 | $13, $0b
    db OWN | MUNKS, $60 | $13, $0b
    db OWN | DRAPER, $60 | $13, $0b
    db OWN | HUNTER, $80 | $18, $12
    db OWN | PELICAN, $80 | $18, $12
    db OWN | MUNKS, $80 | $18, $12
    db OWN | DRAPER, $80 | $18, $12
    db OWN | PELICAN, $80 | $18, $12
    db OWN | JAVI, $a0 | $1b, $02
    db OWN | SEEKER, $a0 | $1b, $02
    db OWN | HUNTER, $a0 | $1b, $02
    db OWN | HAWKEYE, $a0 | $1b, $02
    db OWN | RHINO, $a0 | $1b, $02
    db OWN | PELICAN, $a0 | $1b, $02
    db $ff

SECTION "nectaris/map_legend_adv: Map D13 Namrob", ROMX

MapD13Namrob::
    map "MMMMMMMMM oMMMM MMMMMMM MMMMMM x", \
        "MMM   M ooooM  ~M  MM    ~ MMM x", \
        "MMM U   o oo ~o ~ ~~    ~~~  M x", \
        "MMMM   ~~~o   ~~   ~~~  ~    M x", \
        "MMM  u ~~~    ~~     M  f    M x", \
        "M ~~    ~~    ##   MM  M   ~MM x", \
        "MM~~ M      ~  #   M   MM o MM x", \
        "M ~ MMMM~  o o  #   M    ~~  M x", \
        "M   MMMM  ooMoMM#M~~M    ~~MMM x", \
        "MM  MM MM   ooMMMM~~      ~MMM x", \
        "MMoMMMMM M  ooMMM ~~oo  ~  MM  x", \
        "MMMMMMMMMMMM  ## f~~o ~~       r", \
        "MMMMMMM MMM    #  ~~  ~~~~     k", \
        "MMM    ~M  MMM  ooo~~~ M~      o", \
        "MM  ~~  ~ MMMM  o  ~~~MMMM~~   q", \
        "M~~ ~~o   MMM~      ~~MMM ~~G  x", \
        "M ~ ~ M   M  ~~  ~ M     ~~~   x", \
        "MM        MMMM~~~~      ~~~  ~ x", \
        "M  f   ~~~~~M  ~~o ~~~    g  ~ x", \
        "M ~   ~~~M~~~~ ~~oo~~~~~   M~~ x", \
        "             ~~~      kji~M ~M x"
    db OWN | NASHORN, $00 | $04, $02
    db OWN | ESTOL, $00 | $03, $11
    db OWN | RABBIT, $00 | $08, $02
    db FOE | MONSTER, $00 | $15, $0a
    db FOE | YAMA, $00 | $15, $03
    db FOE | YAMA, $00 | $10, $0d
    db FOE | MONSTER, $00 | $1c, $02
    db FOE | MONSTER, $00 | $1c, $03
    db FOE | MONSTER, $00 | $1c, $04
    db FOE | RHINO, $00 | $14, $0b
    db OWN | SEEKER, $20 | $03, $12
    db OWN | MULE, $20 | $03, $12
    db OWN | RHINO, $20 | $03, $12
    db OWN | BISON, $20 | $03, $12
    db OWN | BISON, $20 | $03, $12
    db OWN | GIANT, $20 | $03, $12
    db OWN | LENET, $20 | $03, $12
    db OWN | PELICAN, $40 | $05, $04
    db OWN | MUNKS, $40 | $05, $04
    db OWN | NASHORN, $40 | $05, $04
    db OWN | GRIZZLY, $40 | $05, $04
    db OWN | GRIZZLY, $40 | $05, $04
    db OWN | SEEKER, $40 | $05, $04
    db OWN | MULE, $40 | $05, $04
    db OWN | RHINO, $40 | $05, $04
    db OWN | DRAPER, $40 | $05, $04
    db OWN | HAWKEYE, $40 | $05, $04
    db OWN | DILLO, $40 | $05, $04
    db OWN | ESTOL, $60 | $11, $0b
    db OWN | SEEKER, $60 | $11, $0b
    db OWN | SLAGGER, $60 | $11, $0b
    db OWN | RABBIT, $60 | $11, $0b
    db OWN | NASHORN, $60 | $11, $0b
    db OWN | RHINO, $60 | $11, $0b
    db OWN | HAWKEYE, $60 | $11, $0b
    db OWN | PELICAN, $80 | $18, $04
    db OWN | DARBEK, $80 | $18, $04
    db OWN | PELICAN, $80 | $18, $04
    db OWN | GIANT, $80 | $18, $04
    db OWN | LYNX, $80 | $18, $04
    db OWN | SEEKER, $80 | $18, $04
    db OWN | HAWKEYE, $80 | $18, $04
    db OWN | DARBEK, $80 | $18, $04
    db OWN | DARBEK, $80 | $18, $04
    db OWN | PELICAN, $a0 | $1a, $12
    db OWN | DARBEK, $a0 | $1a, $12
    db OWN | DRAPER, $a0 | $1a, $12
    db OWN | RABBIT, $a0 | $1a, $12
    db OWN | LYNX, $a0 | $1a, $12
    db OWN | GRIZZLY, $a0 | $1a, $12
    db OWN | DILLO, $a0 | $1a, $12
    db OWN | SLAGGER, $a0 | $1a, $12
    db OWN | MONSTER, $a0 | $1a, $12
    db OWN | GIANT, $a0 | $1a, $12
    db OWN | HAWKEYE, $a0 | $1a, $12
    db OWN | DRAPER, $a0 | $1a, $12
    db $ff

SECTION "nectaris/map_legend_adv: Map D14 Oloppa", ROMX

MapD14Oloppa::
    map "~~o       ~       ~~~~~ ooo oo x", \
        "~~ MMMMM MMM Mf          M  oo x", \
        "~~MMMMM MMMMMMMMMMMMMM MMMMM   x", \
        "~       M M  MMMMMMMMMMMM MMM  x", \
        "  U  ~        M   MMMM MMMMM   x", \
        " M MMM M MMMMM    MMMMM MMM    x", \
        "MMMMMMMMMMMMMMMM o  MM ~   u   x", \
        "MMM MMMMMMMMMMMMMM  MMMM     o x", \
        "M oo MMMMMM    MMM   MM        x", \
        "M oo  MMM   g   MMMM MM oo MMM x", \
        "MMMM MMM ~     MM  M    of MMM x", \
        "MMMMMMMM ~~MMM MMMM        MMM r", \
        "MMMMMMMMM~~ MMMMMMM  MMM ~MMM  k", \
        "MM MMMM  f    M M   MMM   MM   o", \
        "M   M            o  MMM   MMMo q", \
        "         M MMMMM    MMMM     o x", \
        "   MMM MMMMMMMMMM MMMMM   ooo  x", \
        "   MMMMMMMMMM M   MMM     oo ~ x", \
        "++ MMMMMM         M   G     ~~ x", \
        "  ++MMM  ~oof  o   ~ ~   ~~~~~ x", \
        "MMMM     oo MMMMj  M M   MMM   x"
    db OWN | MUNKS, $00 | $05, $09
    db OWN | MUNKS, $00 | $09, $00
    db OWN | MUNKS, $00 | $09, $09
    db OWN | LYNX, $00 | $05, $04
    db OWN | DILLO, $00 | $05, $03
    db OWN | BISON, $00 | $06, $04
    db OWN | GIANT, $00 | $06, $05
    db FOE | RABBIT, $00 | $15, $0a
    db FOE | MULE, $00 | $14, $08
    db FOE | YAMA, $00 | $14, $09
    db FOE | DRAPER, $00 | $15, $12
    db FOE | MUNKS, $00 | $18, $0e
    db FOE | RHINO, $00 | $16, $12
    db FOE | SLAGGER, $00 | $1a, $06
    db FOE | MUNKS, $00 | $1a, $07
    db FOE | HAWKEYE, $00 | $1b, $07
    db FOE | BISON, $00 | $1c, $07
    db FOE | FALCO, $00 | $17, $10
    db OWN | NASHORN, $20 | $09, $0d
    db OWN | SEEKER, $20 | $09, $0d
    db OWN | GRIZZLY, $20 | $09, $0d
    db OWN | DILLO, $20 | $09, $0d
    db OWN | BISON, $20 | $09, $0d
    db OWN | LENET, $20 | $09, $0d
    db OWN | SEEKER, $40 | $0c, $09
    db OWN | HAWKEYE, $40 | $0c, $09
    db OWN | RABBIT, $40 | $0c, $09
    db OWN | ESTOL, $40 | $0c, $09
    db OWN | LYNX, $40 | $0c, $09
    db OWN | GIANT, $60 | $0c, $13
    db OWN | RABBIT, $60 | $0c, $13
    db OWN | MONSTER, $60 | $0c, $13
    db OWN | SEEKER, $60 | $0c, $13
    db OWN | SLAGGER, $60 | $0c, $13
    db OWN | HAWKEYE, $60 | $0c, $13
    db OWN | BISON, $60 | $0c, $13
    db OWN | JAVI, $80 | $0e, $01
    db OWN | PELICAN, $80 | $0e, $01
    db OWN | RHINO, $80 | $0e, $01
    db OWN | GRIZZLY, $80 | $0e, $01
    db OWN | BISON, $80 | $0e, $01
    db OWN | NASHORN, $80 | $0e, $01
    db OWN | LYNX, $80 | $0e, $01
    db OWN | RHINO, $a0 | $19, $0a
    db OWN | GIANT, $a0 | $19, $0a
    db OWN | HUNTER, $a0 | $19, $0a
    db OWN | MONSTER, $a0 | $19, $0a
    db OWN | LENET, $a0 | $19, $0a
    db OWN | LYNX, $a0 | $19, $0a
    db OWN | BISON, $a0 | $19, $0a
    db OWN | GIANT, $c0 | $1b, $06
    db OWN | HUNTER, $c0 | $1b, $06
    db OWN | MONSTER, $c0 | $1b, $06
    db OWN | BISON, $c0 | $1b, $06
    db OWN | RABBIT, $c0 | $1b, $06
    db OWN | ESTOL, $c0 | $1b, $06
    db $ff

SECTION "nectaris/map_legend_adv: Map D15 Resiak", ROMX

MapD15Resiak::
    map " MM+~#MMMM M   +~~~~~  # M##MM x", \
        "MM~f~~#MM  MM++M    ~  G MMMMM x", \
        "M  +~ #MMf oM+ MMM       #MMMM x", \
        "MM  ++       +~~MM     ~  #MMM x", \
        "MMM~ +  oo~  +~ MMM   ~~####MM x", \
        "MM ~~ ++o  M + MMM  MM~~#o##   x", \
        "M~~~~ ~~++ MMM+MMMMMMM~~~~o~ + x", \
        "M ~ ~ ~M~+ MM +MMMMM M ~~~~++# x", \
        "++o  MMMMM++  ++MMMMM  M~~~+   x", \
        "  + MMMMMMMM++ + MM  +++   +oo x", \
        " ~+ o MMMMMMM+ +   ++   +++ooo x", \
        "~~+   M  MMM + g ++   oooooooo r", \
        "~+++   + MM + ++  MMooooo o oo k", \
        "~+  u~+ ++ ++   ++M oooooof oo o", \
        "~+       M+ o MM  ++++  oo ooo q", \
        " +     MMMMM  MMM +   ++oooooo x", \
        "MM++  M MMMMMMM   +  M  ++o o  x", \
        "MM  ++M MMM  MM  ++MMMMM +  o  x", \
        "MMMU +    M M  o + MMMMMM ++ + x", \
        "MM   + ~~ MMM oo + MM M     +  x", \
        "MMMMM  ++M MMM  MM  ++ MMM  #+ x"
    db OWN | GRIZZLY, $00 | $04, $0e
    db OWN | GIANT, $00 | $07, $0c
    db OWN | GIANT, $00 | $07, $0d
    db OWN | NASHORN, $00 | $04, $0c
    db OWN | RABBIT, $00 | $08, $0c
    db OWN | RABBIT, $00 | $08, $0d
    db OWN | SEEKER, $00 | $03, $0c
    db OWN | SEEKER, $00 | $03, $0d
    db OWN | DRAPER, $00 | $06, $0d
    db FOE | GIANT, $00 | $0b, $0c
    db FOE | GIANT, $00 | $0b, $0e
    db FOE | MONSTER, $00 | $0d, $0b
    db FOE | NASHORN, $00 | $0c, $0d
    db FOE | RABBIT, $00 | $0e, $0b
    db FOE | DRAPER, $00 | $16, $07
    db FOE | LYNX, $00 | $0e, $0c
    db FOE | SEEKER, $00 | $0e, $0a
    db FOE | SEEKER, $00 | $0e, $0d
    db FOE | HUNTER, $00 | $18, $03
    db FOE | GIANT, $00 | $18, $00
    db FOE | RABBIT, $00 | $15, $00
    db FOE | DRAPER, $00 | $14, $02
    db OWN | FALCO, $20 | $03, $01
    db OWN | FALCO, $20 | $03, $01
    db OWN | FALCO, $20 | $03, $01
    db OWN | JAVI, $20 | $03, $01
    db OWN | JAVI, $20 | $03, $01
    db OWN | SEEKER, $20 | $03, $01
    db OWN | PELICAN, $20 | $03, $01
    db OWN | FALCO, $40 | $04, $0d
    db OWN | JAVI, $40 | $04, $0d
    db OWN | DILLO, $40 | $04, $0d
    db OWN | BISON, $40 | $04, $0d
    db OWN | BISON, $40 | $04, $0d
    db OWN | ESTOL, $40 | $04, $0d
    db OWN | HAWKEYE, $40 | $04, $0d
    db OWN | MULE, $40 | $04, $0d
    db OWN | MUNKS, $40 | $04, $0d
    db OWN | FALCO, $60 | $09, $02
    db OWN | FALCO, $60 | $09, $02
    db OWN | SEEKER, $60 | $09, $02
    db OWN | SEEKER, $60 | $09, $02
    db OWN | SEEKER, $60 | $09, $02
    db OWN | ESTOL, $80 | $0f, $0b
    db OWN | MONSTER, $80 | $0f, $0b
    db OWN | SLAGGER, $80 | $0f, $0b
    db OWN | HAWKEYE, $80 | $0f, $0b
    db OWN | BISON, $80 | $0f, $0b
    db OWN | HUNTER, $a0 | $1a, $0d
    db OWN | HUNTER, $a0 | $1a, $0d
    db OWN | SEEKER, $a0 | $1a, $0d
    db OWN | SEEKER, $a0 | $1a, $0d
    db OWN | HUNTER, $a0 | $1a, $0d
    db OWN | HUNTER, $a0 | $1a, $0d
    db $ff

SECTION "nectaris/map_legend_adv: Map D16 Rotcen", ROMX

MapD16Rotcen::
    map "MM ~~MMMMM  ooo ooo   MMM   M  x", \
        "MMM~~MMMMMMooo G ooo MMMMM~~ + x", \
        "MM ~~MMMMM oo+++++oo MMMM ~++  x", \
        "MMM~~ MMMo ++oo+oo++ MM  ~~+ M x", \
        "MM ~~~~~ ++ ooo+ooo ++ +~++MMM x", \
        "MMMf~~~++  M  o+o    g+ + MMMM x", \
        "M++++++~ MMMMM +MMMMMM ~~ MMMM x", \
        "+ MM ~~~ MMMMMM+MMMMM ~~~ MMMM x", \
        "+ MM ~~~~~MMM  + MM  ~~~MMMMM  x", \
        "ooMMM ~~~~~~ ~ +~~   f~~MMMMM  x", \
        "o MM MMM ~~~~~~+  MMMM  MMMMMo x", \
        " oMMMMMMMM ~~++ ++MMMMM+ MM    r", \
        "o   MMMMMMM++  MMMMMMMM+    oo k", \
        "  ooM MMM  + MMMMMMMM  + oooo  o", \
        "  ooo M   o+ MMMM  o ++  ooo   q", \
        "    o   oo +        +  ooo  o  x", \
        "      o ooo+ o ooo o+  o       x", \
        "           +   oo o +          x", \
        "       U   +        +    u     x", \
        "           +   f    +          x", \
        " + +    u  oo   o              x"
    db OWN | LYNX, $00 | $05, $13
    db FOE | YAMA, $00 | $0f, $02
    db FOE | LYNX, $00 | $0f, $00
    db FOE | RHINO, $00 | $0e, $00
    db FOE | RHINO, $00 | $10, $01
    db FOE | MUNKS, $00 | $0a, $04
    db OWN | SLAGGER, $20 | $03, $05
    db OWN | RABBIT, $20 | $03, $05
    db OWN | PELICAN, $20 | $03, $05
    db OWN | MUNKS, $20 | $03, $05
    db OWN | RABBIT, $40 | $0f, $13
    db OWN | RABBIT, $40 | $0f, $13
    db OWN | MULE, $40 | $0f, $13
    db OWN | RABBIT, $60 | $15, $05
    db OWN | MUNKS, $60 | $15, $05
    db OWN | PELICAN, $80 | $15, $09
    db OWN | SEEKER, $a0 | $19, $12
    db OWN | MUNKS, $a0 | $19, $12
    db $ff
