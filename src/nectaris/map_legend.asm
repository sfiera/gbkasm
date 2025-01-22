; Disassembly of "Nectaris GB (Japan) (SGB Enhanced).gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "nectaris/map.inc"
INCLUDE "nectaris/units.inc"

SECTION "nectaris/map_legend: Map B01 Revolt", ROMX

MapB01Revolt::
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
    db OWN | MUNKS, $00 | $06, $07
    db OWN | MUNKS, $00 | $02, $09
    db OWN | BISON, $00 | $04, $08
    db OWN | BISON, $00 | $05, $08
    db OWN | BISON, $00 | $07, $04
    db FOE | MUNKS, $00 | $0a, $02
    db FOE | MUNKS, $00 | $0a, $05
    db FOE | BISON, $00 | $0b, $05
    db FOE | BISON, $00 | $0c, $04
    db $ff

SECTION "nectaris/map_legend: Map B02 Icarus", ROMX

MapB02Icarus::
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
    db OWN | MUNKS, $00 | $02, $08
    db OWN | MUNKS, $00 | $02, $05
    db OWN | MUNKS, $00 | $03, $06
    db OWN | BISON, $00 | $02, $03
    db OWN | BISON, $00 | $05, $06
    db OWN | BISON, $00 | $06, $05
    db OWN | BISON, $00 | $08, $05
    db OWN | BISON, $00 | $07, $08
    db FOE | MUNKS, $00 | $0a, $02
    db FOE | MUNKS, $00 | $0c, $04
    db FOE | MUNKS, $00 | $0e, $03
    db FOE | BISON, $00 | $0b, $04
    db FOE | BISON, $00 | $0c, $03
    db FOE | BISON, $00 | $0d, $06
    db $ff

SECTION "nectaris/map_legend: Map B03 Cyrano", ROMX

MapB03Cyrano::
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
    db OWN | MUNKS, $00 | $01, $05
    db OWN | MUNKS, $00 | $02, $04
    db OWN | BISON, $00 | $06, $04
    db OWN | BISON, $00 | $04, $08
    db OWN | BISON, $00 | $06, $09
    db OWN | BISON, $00 | $09, $08
    db FOE | BISON, $00 | $09, $05
    db FOE | BISON, $00 | $0b, $07
    db FOE | BISON, $00 | $0e, $05
    db FOE | MUNKS, $00 | $09, $01
    db OWN | DARBEK, $20 | $0e, $04
    db OWN | NASHORN, $20 | $0e, $04
    db $ff

SECTION "nectaris/map_legend: Map B04 Ramsey", ROMX

MapB04Ramsey::
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
    db OWN | GRIZZLY, $00 | $07, $0b
    db OWN | DILLO, $00 | $0a, $0f
    db OWN | BISON, $00 | $05, $0c
    db OWN | NASHORN, $00 | $07, $0f
    db OWN | SEEKER, $00 | $04, $0e
    db OWN | MUNKS, $00 | $03, $0b
    db OWN | DARBEK, $00 | $05, $0b
    db OWN | DARBEK, $00 | $08, $0e
    db FOE | JAVI, $00 | $0a, $06
    db FOE | BISON, $00 | $07, $01
    db FOE | BISON, $00 | $0d, $08
    db FOE | SLAGGER, $00 | $0e, $07
    db FOE | MUNKS, $00 | $0a, $05
    db FOE | DARBEK, $00 | $09, $02
    db OWN | BISON, $20 | $0b, $03
    db OWN | NASHORN, $20 | $0b, $03
    db OWN | SEEKER, $40 | $05, $06
    db OWN | BISON, $60 | $02, $09
    db OWN | GRIZZLY, $80 | $02, $0d
    db $ff

SECTION "nectaris/map_legend: Map B05 Newton", ROMX

MapB05Newton::
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
    db OWN | GRIZZLY, $00 | $0a, $08
    db OWN | BISON, $00 | $04, $05
    db OWN | RABBIT, $00 | $06, $09
    db OWN | RABBIT, $00 | $0b, $04
    db OWN | MUNKS, $00 | $02, $06
    db OWN | MUNKS, $00 | $07, $01
    db FOE | BISON, $00 | $04, $10
    db FOE | LENET, $00 | $0a, $0d
    db FOE | RABBIT, $00 | $08, $0f
    db FOE | MUNKS, $00 | $06, $11
    db FOE | DARBEK, $00 | $0c, $0e
    db OWN | LENET, $20 | $0c, $03
    db OWN | HAWKEYE, $20 | $0c, $03
    db OWN | DILLO, $40 | $04, $0a
    db OWN | SEEKER, $40 | $04, $0a
    db OWN | HUNTER, $60 | $0c, $0c
    db OWN | SLAGGER, $60 | $0c, $0c
    db OWN | LYNX, $60 | $0c, $0c
    db OWN | MONSTER, $80 | $01, $10
    db $ff

SECTION "nectaris/map_legend: Map B06 Seneca", ROMX

MapB06Seneca::
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
    db OWN | FALCO, $00 | $04, $0b
    db OWN | JAVI, $00 | $02, $11
    db OWN | DILLO, $00 | $04, $03
    db OWN | BISON, $00 | $01, $0e
    db OWN | NASHORN, $00 | $00, $08
    db OWN | RABBIT, $00 | $01, $02
    db OWN | MUNKS, $00 | $02, $08
    db OWN | MUNKS, $00 | $00, $0b
    db OWN | MULE, $00 | $01, $05
    db OWN | MULE, $00 | $01, $09
    db FOE | HUNTER, $00 | $0c, $12
    db FOE | MONSTER, $00 | $0d, $0b
    db FOE | RABBIT, $00 | $0e, $07
    db FOE | HAWKEYE, $00 | $0c, $0f
    db FOE | MUNKS, $00 | $0d, $11
    db FOE | DARBEK, $00 | $0e, $0b
    db FOE | MULE, $00 | $0e, $0f
    db OWN | JAVI, $20 | $08, $02
    db OWN | GRIZZLY, $20 | $08, $02
    db OWN | SEEKER, $20 | $08, $02
    db OWN | ESTOL, $40 | $0a, $05
    db OWN | SEEKER, $40 | $0a, $05
    db OWN | GIANT, $40 | $0a, $05
    db OWN | LYNX, $60 | $0c, $02
    db $ff

SECTION "nectaris/map_legend: Map B07 Sabine", ROMX

MapB07Sabine::
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
    db OWN | GRIZZLY, $00 | $05, $02
    db OWN | BISON, $00 | $0a, $05
    db OWN | NASHORN, $00 | $09, $03
    db OWN | MUNKS, $00 | $04, $05
    db OWN | MUNKS, $00 | $07, $02
    db OWN | MULE, $00 | $01, $02
    db OWN | MULE, $00 | $03, $03
    db FOE | DILLO, $00 | $19, $08
    db FOE | BISON, $00 | $15, $07
    db FOE | BISON, $00 | $19, $05
    db FOE | ESTOL, $00 | $17, $03
    db FOE | DARBEK, $00 | $1b, $07
    db OWN | YAMA, $20 | $02, $03
    db OWN | YAMA, $20 | $02, $03
    db OWN | JAVI, $40 | $0f, $04
    db OWN | BISON, $40 | $0f, $04
    db OWN | GIANT, $20 | $02, $03
    db OWN | ESTOL, $40 | $0f, $04
    db OWN | LYNX, $40 | $0f, $04
    db OWN | BISON, $60 | $10, $09
    db OWN | SLAGGER, $60 | $10, $09
    db OWN | SEEKER, $60 | $10, $09
    db OWN | MULE, $80 | $1c, $06
    db OWN | MUNKS, $80 | $1c, $06
    db OWN | MULE, $80 | $1c, $06
    db OWN | YAMA, $80 | $1c, $06
    db OWN | RABBIT, $80 | $1c, $06
    db OWN | HAWKEYE, $80 | $1c, $06
    db $ff

SECTION "nectaris/map_legend: Map B08 Aratus", ROMX

MapB08Aratus::
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
    db OWN | FALCO, $00 | $06, $03
    db OWN | JAVI, $00 | $03, $04
    db OWN | BISON, $00 | $0a, $05
    db OWN | NASHORN, $00 | $05, $08
    db OWN | SEEKER, $00 | $06, $05
    db OWN | SEEKER, $00 | $09, $03
    db OWN | HAWKEYE, $00 | $08, $06
    db OWN | MUNKS, $00 | $04, $06
    db OWN | DRAPER, $00 | $02, $03
    db OWN | PELICAN, $00 | $02, $07
    db FOE | FALCO, $00 | $13, $06
    db FOE | HUNTER, $00 | $10, $03
    db FOE | HUNTER, $00 | $16, $01
    db FOE | BISON, $00 | $11, $05
    db FOE | MONSTER, $00 | $13, $04
    db FOE | NASHORN, $00 | $15, $07
    db FOE | SEEKER, $00 | $14, $03
    db FOE | HAWKEYE, $00 | $12, $03
    db FOE | MUNKS, $00 | $1b, $04
    db FOE | DRAPER, $00 | $1c, $02
    db FOE | PELICAN, $00 | $1a, $03
    db OWN | FALCO, $20 | $01, $07
    db OWN | PELICAN, $20 | $01, $07
    db OWN | RHINO, $20 | $01, $07
    db OWN | GRIZZLY, $20 | $01, $07
    db OWN | BISON, $20 | $01, $07
    db OWN | MULE, $20 | $01, $07
    db OWN | YAMA, $20 | $01, $07
    db OWN | JAVI, $20 | $01, $07
    db OWN | MUNKS, $20 | $01, $07
    db OWN | GRIZZLY, $40 | $0c, $01
    db OWN | DILLO, $40 | $0c, $01
    db OWN | RABBIT, $40 | $0c, $01
    db OWN | HAWKEYE, $40 | $0c, $01
    db OWN | JAVI, $40 | $0c, $01
    db OWN | SLAGGER, $40 | $0c, $01
    db OWN | MONSTER, $40 | $0c, $01
    db OWN | PELICAN, $40 | $0c, $01
    db OWN | PELICAN, $60 | $17, $02
    db OWN | RHINO, $60 | $17, $02
    db OWN | BISON, $60 | $17, $02
    db OWN | JAVI, $60 | $17, $02
    db OWN | MULE, $60 | $17, $02
    db OWN | YAMA, $60 | $17, $02
    db OWN | SEEKER, $60 | $17, $02
    db OWN | MUNKS, $60 | $17, $02
    db $ff

SECTION "nectaris/map_legend: Map B09 Galois", ROMX

MapB09Galois::
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
        "~ ~MMM+~~  MMM    M  ~~ MMM+   y", \
        "~~ MM +  M  MMMf      ~~~ ~+   +", \
        "~~   ~+ M MM     MM     ~~~+   +", \
        "MM f~~+ M~MM MMMMMMM     + +   s", \
        "M     + ~  MMMMMMMM     + + +  x", \
        "MM   ++ ~~ MM M#MM #       ++  x", \
        "M  ++   ~~ MM~o#MM  #    + g   x", \
        "M  +   ~~~MM~#~MMMM~## ++ +    x", \
        "MM + ~ ~~~MM~~#MMM ~~#+ G    M x", \
        " # G    M # G    M+ MMzv#MM #  x"
    db OWN | GRIZZLY, $00 | $09, $09
    db OWN | DILLO, $00 | $06, $0a
    db OWN | BISON, $00 | $05, $07
    db OWN | NASHORN, $00 | $06, $07
    db OWN | RABBIT, $00 | $03, $08
    db OWN | SEEKER, $00 | $09, $07
    db OWN | HAWKEYE, $00 | $07, $08
    db OWN | MUNKS, $00 | $06, $06
    db FOE | HUNTER, $00 | $1c, $13
    db FOE | SLAGGER, $00 | $18, $12
    db FOE | MONSTER, $00 | $13, $0b
    db FOE | LENET, $00 | $17, $0e
    db FOE | ESTOL, $00 | $17, $10
    db FOE | RABBIT, $00 | $19, $0e
    db FOE | SEEKER, $00 | $14, $0f
    db FOE | HAWKEYE, $00 | $15, $10
    db FOE | DRAPER, $00 | $1b, $0d
    db FOE | MUNKS, $00 | $15, $0d
    db OWN | MULE, $20 | $03, $03
    db OWN | DARBEK, $20 | $03, $03
    db OWN | FALCO, $20 | $03, $03
    db OWN | JAVI, $20 | $03, $03
    db OWN | DILLO, $20 | $03, $03
    db OWN | FALCO, $40 | $03, $0e
    db OWN | JAVI, $40 | $03, $0e
    db OWN | DILLO, $40 | $03, $0e
    db OWN | RABBIT, $40 | $03, $0e
    db OWN | LYNX, $40 | $03, $0e
    db OWN | HAWKEYE, $40 | $03, $0e
    db OWN | PELICAN, $40 | $03, $0e
    db OWN | RHINO, $40 | $03, $0e
    db OWN | FALCO, $60 | $0e, $08
    db OWN | BISON, $60 | $0e, $08
    db OWN | BISON, $60 | $0e, $08
    db OWN | LENET, $60 | $0e, $08
    db OWN | MULE, $60 | $0e, $08
    db OWN | YAMA, $60 | $0e, $08
    db OWN | PELICAN, $60 | $0e, $08
    db OWN | SLAGGER, $80 | $0f, $0c
    db OWN | MONSTER, $80 | $0f, $0c
    db OWN | NASHORN, $80 | $0f, $0c
    db OWN | RABBIT, $80 | $0f, $0c
    db OWN | HAWKEYE, $80 | $0f, $0c
    db OWN | MULE, $80 | $0f, $0c
    db OWN | YAMA, $80 | $0f, $0c
    db OWN | HUNTER, $a0 | $15, $02
    db OWN | PELICAN, $a0 | $15, $02
    db OWN | MUNKS, $a0 | $15, $02
    db OWN | LYNX, $c0 | $1b, $11
    db OWN | MULE, $c0 | $1b, $11
    db OWN | RHINO, $c0 | $1b, $11
    db OWN | ESTOL, $c0 | $1b, $11
    db OWN | SLAGGER, $c0 | $1b, $11
    db OWN | FALCO, $c0 | $1b, $11
    db $ff

SECTION "nectaris/map_legend: Map B10 Darwin", ROMX

MapB10Darwin::
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
        " +   M   ++M~ ~~~f~   +  MM  + y", \
        "o+ ~MMMM + MMMMM   MMM+g MM  + +", \
        "o+~~~oM  + MMMMMMMMMM +  MM++o +", \
        "o+~~~o ~~+  MMMMMMMMM +M   + o s", \
        "o~+ooof~~+ ~~MMMM    ++MMM +   x", \
        "  + oM  +o++~~M ~~ +++ MM  +G  x", \
        " ++++++++ oo~o ooo  ~~+o  M+   x", \
        " +M+ + +o+o+o+o+o+ +~+++o++  M x", \
        "~ + + + + + + + + + + + +    M x", \
        " ~ ~ ~ ~ ~~+o+o+o+o+ +~+++ot~+ x"
    db OWN | FALCO, $00 | $05, $06
    db OWN | FALCO, $00 | $08, $02
    db OWN | JAVI, $00 | $0a, $07
    db OWN | BISON, $00 | $03, $04
    db OWN | NASHORN, $00 | $08, $06
    db OWN | RABBIT, $00 | $0a, $05
    db OWN | SEEKER, $00 | $06, $05
    db OWN | HAWKEYE, $00 | $03, $07
    db OWN | HAWKEYE, $00 | $06, $01
    db OWN | MUNKS, $00 | $04, $03
    db OWN | DRAPER, $00 | $0a, $03
    db FOE | HUNTER, $00 | $13, $0f
    db FOE | HUNTER, $00 | $18, $0e
    db FOE | SLAGGER, $00 | $16, $10
    db FOE | LENET, $00 | $1b, $0c
    db FOE | ESTOL, $00 | $1a, $10
    db FOE | SEEKER, $00 | $16, $0c
    db FOE | MUNKS, $00 | $1d, $11
    db FOE | DRAPER, $00 | $1b, $0e
    db OWN | FALCO, $20 | $02, $01
    db OWN | JAVI, $20 | $02, $01
    db OWN | GRIZZLY, $20 | $02, $01
    db OWN | DRAPER, $20 | $02, $01
    db OWN | MULE, $20 | $02, $01
    db OWN | JAVI, $40 | $06, $0f
    db OWN | NASHORN, $40 | $06, $0f
    db OWN | RABBIT, $40 | $06, $0f
    db OWN | LYNX, $40 | $06, $0f
    db OWN | HAWKEYE, $40 | $06, $0f
    db OWN | PELICAN, $40 | $06, $0f
    db OWN | RHINO, $40 | $06, $0f
    db OWN | MUNKS, $40 | $06, $0f
    db OWN | YAMA, $60 | $0d, $0a
    db OWN | JAVI, $60 | $0d, $0a
    db OWN | PELICAN, $60 | $0d, $0a
    db OWN | ESTOL, $60 | $0d, $0a
    db OWN | HUNTER, $80 | $11, $0b
    db OWN | HAWKEYE, $80 | $11, $0b
    db OWN | PELICAN, $80 | $11, $0b
    db OWN | MUNKS, $80 | $11, $0b
    db OWN | ESTOL, $a0 | $14, $04
    db OWN | PELICAN, $a0 | $14, $04
    db OWN | RHINO, $a0 | $14, $04
    db OWN | MULE, $a0 | $14, $04
    db OWN | DARBEK, $a0 | $14, $04
    db OWN | HUNTER, $c0 | $17, $0c
    db OWN | HAWKEYE, $c0 | $17, $0c
    db OWN | DRAPER, $c0 | $17, $0c
    db OWN | MULE, $c0 | $17, $0c
    db OWN | HUNTER, $e0 | $1c, $02
    db OWN | NASHORN, $e0 | $1c, $02
    db OWN | ESTOL, $e0 | $1c, $02
    db OWN | PELICAN, $e0 | $1c, $02
    db OWN | YAMA, $e0 | $1c, $02
    db OWN | RABBIT, $e0 | $1c, $02
    db OWN | HAWKEYE, $e0 | $1c, $02
    db $ff

SECTION "nectaris/map_legend: Map B11 Pascal", ROMX

MapB11Pascal::
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
        "M    o          ~   ~    +##~# y", \
        "MMM~~~oo     o o         + # # +", \
        "M ~~~o~ooo   ooo     MMM +  #o +", \
        "M ~~ooo o   oooo oo MMM~~+  #  s", \
        "   +        oMooooooMMM +   f  x", \
        "MM+ ++    ooMMMMooooM  +++ ++M x", \
        "M u   ++oooo MMM ooo   +  +f M x", \
        "M  M U  ++o  MM~MMoo ++      M x", \
        "M         ++ MM M  ++~ o     M x", \
        "o o o                    U     x"
    db OWN | FALCO, $00 | $0c, $10
    db OWN | BISON, $00 | $0a, $0e
    db OWN | BISON, $00 | $02, $0b
    db OWN | SEEKER, $00 | $04, $0c
    db OWN | HAWKEYE, $00 | $07, $0d
    db OWN | MUNKS, $00 | $05, $11
    db OWN | PELICAN, $00 | $08, $13
    db OWN | RABBIT, $00 | $0c, $0d
    db FOE | HUNTER, $00 | $10, $05
    db FOE | BISON, $00 | $0c, $0a
    db FOE | SLAGGER, $00 | $0d, $05
    db FOE | RABBIT, $00 | $1a, $08
    db FOE | SEEKER, $00 | $0d, $08
    db FOE | SEEKER, $00 | $19, $0b
    db FOE | HAWKEYE, $00 | $10, $09
    db FOE | MUNKS, $00 | $0e, $02
    db OWN | FALCO, $20 | $02, $11
    db OWN | PELICAN, $20 | $02, $11
    db OWN | MUNKS, $20 | $02, $11
    db OWN | JAVI, $20 | $02, $11
    db OWN | BISON, $20 | $02, $11
    db OWN | RABBIT, $20 | $02, $11
    db OWN | DILLO, $40 | $03, $04
    db OWN | LENET, $40 | $03, $04
    db OWN | ESTOL, $40 | $03, $04
    db OWN | SLAGGER, $40 | $03, $04
    db OWN | NASHORN, $40 | $03, $04
    db OWN | HAWKEYE, $40 | $03, $04
    db OWN | MONSTER, $60 | $10, $02
    db OWN | PELICAN, $60 | $10, $02
    db OWN | MUNKS, $60 | $10, $02
    db OWN | GIANT, $60 | $10, $02
    db OWN | HUNTER, $60 | $10, $02
    db OWN | PELICAN, $60 | $10, $02
    db OWN | MUNKS, $60 | $10, $02
    db OWN | RABBIT, $60 | $10, $02
    db OWN | MONSTER, $80 | $1b, $07
    db OWN | HUNTER, $80 | $1b, $07
    db OWN | BISON, $80 | $1b, $07
    db OWN | SLAGGER, $80 | $1b, $07
    db OWN | MULE, $80 | $1b, $07
    db OWN | RHINO, $80 | $1b, $07
    db OWN | DRAPER, $80 | $1b, $07
    db OWN | YAMA, $80 | $1b, $07
    db OWN | JAVI, $a0 | $1b, $11
    db OWN | RABBIT, $a0 | $1b, $11
    db OWN | RABBIT, $a0 | $1b, $11
    db OWN | MULE, $a0 | $1b, $11
    db OWN | DARBEK, $a0 | $1b, $11
    db OWN | SEEKER, $c0 | $1c, $0f
    db OWN | BISON, $c0 | $1c, $0f
    db OWN | LYNX, $c0 | $1c, $0f
    db OWN | MULE, $c0 | $1c, $0f
    db OWN | RHINO, $c0 | $1c, $0f
    db $ff

SECTION "nectaris/map_legend: Map B12 Halley", ROMX

MapB12Halley::
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
        "MM  MMMMMMM+ +  +  f  + MMMMM+ y", \
        "MMMM MMMM + + +++  +  + M    + +", \
        "MMM   M   +   ++   +++++ +++   +", \
        "M        ++     +  + Mo +~~+G  s", \
        " ++++++++       +++ooooooo~+ ~ x", \
        " +              + Moooooo+o +~ x", \
        "oof  ~     ooo  ++o+o+o++ ++++ x", \
        "oo  ~~~ oo ooo   o+ +~+ g ++ + x", \
        "ooo ~~~ ooooooo  ooo~~~     +  x", \
        "+o+     +  + Mo +~~+z~+ g o+   x"
    db OWN | FALCO, $00 | $04, $02
    db OWN | FALCO, $00 | $06, $04
    db OWN | JAVI, $00 | $09, $02
    db OWN | BISON, $00 | $05, $00
    db OWN | RABBIT, $00 | $0e, $04
    db OWN | LYNX, $00 | $0e, $02
    db OWN | SEEKER, $00 | $0b, $01
    db OWN | HAWKEYE, $00 | $07, $00
    db OWN | HAWKEYE, $00 | $0a, $00
    db OWN | DRAPER, $00 | $08, $04
    db FOE | HUNTER, $00 | $16, $12
    db FOE | HUNTER, $00 | $1a, $0e
    db FOE | SLAGGER, $00 | $12, $0a
    db FOE | MONSTER, $00 | $1b, $10
    db FOE | RABBIT, $00 | $14, $0b
    db FOE | RABBIT, $00 | $1c, $0a
    db FOE | LYNX, $00 | $17, $0d
    db FOE | SEEKER, $00 | $12, $0e
    db FOE | SEEKER, $00 | $19, $0c
    db FOE | HAWKEYE, $00 | $15, $0c
    db FOE | HAWKEYE, $00 | $1d, $0c
    db OWN | FALCO, $20 | $02, $03
    db OWN | JAVI, $20 | $02, $03
    db OWN | BISON, $20 | $02, $03
    db OWN | HAWKEYE, $20 | $02, $03
    db OWN | PELICAN, $20 | $02, $03
    db OWN | MUNKS, $20 | $02, $03
    db OWN | DRAPER, $20 | $02, $03
    db OWN | FALCO, $40 | $02, $11
    db OWN | JAVI, $40 | $02, $11
    db OWN | BISON, $40 | $02, $11
    db OWN | RABBIT, $40 | $02, $11
    db OWN | SEEKER, $40 | $02, $11
    db OWN | HAWKEYE, $40 | $02, $11
    db OWN | PELICAN, $40 | $02, $11
    db OWN | MUNKS, $40 | $02, $11
    db OWN | HUNTER, $60 | $13, $0b
    db OWN | HUNTER, $60 | $13, $0b
    db OWN | HUNTER, $60 | $13, $0b
    db OWN | MONSTER, $60 | $13, $0b
    db OWN | RABBIT, $60 | $13, $0b
    db OWN | SEEKER, $60 | $13, $0b
    db OWN | HAWKEYE, $60 | $13, $0b
    db OWN | PELICAN, $60 | $13, $0b
    db OWN | MUNKS, $60 | $13, $0b
    db OWN | DRAPER, $60 | $13, $0b
    db OWN | HUNTER, $80 | $18, $12
    db OWN | PELICAN, $80 | $18, $12
    db OWN | MUNKS, $80 | $18, $12
    db OWN | DRAPER, $80 | $18, $12
    db OWN | JAVI, $a0 | $1b, $02
    db OWN | GRIZZLY, $a0 | $1b, $02
    db OWN | SEEKER, $a0 | $1b, $02
    db OWN | HUNTER, $a0 | $1b, $02
    db OWN | HAWKEYE, $a0 | $1b, $02
    db $ff

SECTION "nectaris/map_legend: Map B13 Borman", ROMX

MapB13Borman::
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
        "MMMMMMMMMMMM  ## f~~o ~~       y", \
        "MMMMMMM MMM    #  ~~  ~~~~     +", \
        "MMM    ~M  MMM  ooo~~~ M~      +", \
        "MM  ~~  ~ MMMM  o  ~~~MMMM~~   s", \
        "M~~ ~~o   MMM~      ~~MMM ~~G  x", \
        "M ~ ~ M   M  ~~  ~ M     ~~~   x", \
        "MM        MMMM~~~~      ~~~  ~ x", \
        "M  f   ~~~~~M  ~~o ~~~    g  ~ x", \
        "M ~   ~~~M~~~~ ~~oo~~~~~   M~~ x", \
        "             ~~~      kji~M ~M x"
    db OWN | DILLO, $20 | $03, $12
    db OWN | BISON, $20 | $03, $12
    db OWN | GIANT, $20 | $03, $12
    db OWN | NASHORN, $20 | $03, $12
    db OWN | ESTOL, $20 | $03, $12
    db OWN | LYNX, $20 | $03, $12
    db OWN | MULE, $20 | $03, $12
    db OWN | RHINO, $20 | $03, $12
    db OWN | MUNKS, $20 | $03, $12
    db OWN | ESTOL, $40 | $05, $04
    db OWN | MULE, $40 | $05, $04
    db OWN | RHINO, $40 | $05, $04
    db OWN | DRAPER, $40 | $05, $04
    db OWN | GRIZZLY, $40 | $05, $04
    db OWN | LYNX, $40 | $05, $04
    db OWN | BISON, $40 | $05, $04
    db OWN | MULE, $40 | $05, $04
    db OWN | YAMA, $40 | $05, $04
    db OWN | MUNKS, $40 | $05, $04
    db OWN | MUNKS, $40 | $05, $04
    db OWN | BISON, $60 | $11, $0b
    db OWN | ESTOL, $60 | $11, $0b
    db OWN | BISON, $60 | $11, $0b
    db OWN | MUNKS, $60 | $11, $0b
    db OWN | LENET, $60 | $11, $0b
    db OWN | RHINO, $60 | $11, $0b
    db OWN | MUNKS, $60 | $11, $0b
    db OWN | SLAGGER, $80 | $18, $04
    db OWN | MONSTER, $80 | $18, $04
    db OWN | NASHORN, $80 | $18, $04
    db OWN | ESTOL, $80 | $18, $04
    db OWN | MULE, $80 | $18, $04
    db OWN | RHINO, $80 | $18, $04
    db OWN | MUNKS, $80 | $18, $04
    db OWN | DRAPER, $a0 | $1a, $12
    db OWN | MUNKS, $a0 | $1a, $12
    db OWN | SLAGGER, $a0 | $1a, $12
    db OWN | RABBIT, $a0 | $1a, $12
    db OWN | GIANT, $a0 | $1a, $12
    db OWN | MULE, $a0 | $1a, $12
    db OWN | RHINO, $a0 | $1a, $12
    db OWN | DARBEK, $a0 | $1a, $12
    db OWN | ESTOL, $a0 | $1a, $12
    db OWN | MULE, $a0 | $1a, $12
    db OWN | YAMA, $a0 | $1a, $12
    db $ff

SECTION "nectaris/map_legend: Map B14 Appolo", ROMX

MapB14Appolo::
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
        "MMMMMMMM ~~MMM MMMM        MMM y", \
        "MMMMMMMMM~~ MMMMMMM  MMM ~MMM  +", \
        "MM MMMM  f    M M   MMM   MM   +", \
        "M   M            o  MMM   MMMo s", \
        "         M MMMMM    MMMM     o x", \
        "   MMM MMMMMMMMMM MMMMM   ooo  x", \
        "   MMMMMMMMMM M   MMM     oo ~ x", \
        "++ MMMMMM         M   G     ~~ x", \
        "  ++MMM  ~oof  o   ~ ~   ~~~~~ x", \
        "MMMM     oo MMMMj  M M   MMM   x"
    db OWN | GRIZZLY, $00 | $08, $05
    db OWN | BISON, $00 | $0a, $04
    db OWN | GIANT, $00 | $07, $04
    db OWN | NASHORN, $00 | $06, $04
    db OWN | RABBIT, $00 | $02, $01
    db OWN | LYNX, $00 | $09, $00
    db OWN | MUNKS, $00 | $07, $02
    db OWN | DRAPER, $00 | $04, $03
    db FOE | SLAGGER, $00 | $13, $12
    db FOE | MONSTER, $00 | $1a, $12
    db FOE | LENET, $00 | $1c, $11
    db FOE | RABBIT, $00 | $10, $13
    db FOE | LYNX, $00 | $18, $10
    db FOE | MUNKS, $00 | $15, $11
    db FOE | DARBEK, $00 | $18, $13
    db FOE | SEEKER, $00 | $0e, $12
    db OWN | MONSTER, $20 | $09, $0d
    db OWN | LYNX, $20 | $09, $0d
    db OWN | HAWKEYE, $20 | $09, $0d
    db OWN | MULE, $20 | $09, $0d
    db OWN | YAMA, $20 | $09, $0d
    db OWN | MUNKS, $40 | $0c, $09
    db OWN | RABBIT, $40 | $0c, $09
    db OWN | RHINO, $40 | $0c, $09
    db OWN | RHINO, $40 | $0c, $09
    db OWN | SLAGGER, $40 | $0c, $09
    db OWN | SLAGGER, $40 | $0c, $09
    db OWN | HUNTER, $60 | $0c, $13
    db OWN | MONSTER, $60 | $0c, $13
    db OWN | GIANT, $60 | $0c, $13
    db OWN | NASHORN, $60 | $0c, $13
    db OWN | ESTOL, $60 | $0c, $13
    db OWN | RABBIT, $60 | $0c, $13
    db OWN | MULE, $60 | $0c, $13
    db OWN | RHINO, $60 | $0c, $13
    db OWN | DRAPER, $60 | $0c, $13
    db OWN | JAVI, $80 | $0e, $01
    db OWN | RHINO, $a0 | $19, $0a
    db OWN | BISON, $a0 | $19, $0a
    db OWN | BISON, $a0 | $19, $0a
    db OWN | MULE, $a0 | $19, $0a
    db OWN | MUNKS, $c0 | $1b, $06
    db OWN | NASHORN, $c0 | $1b, $06
    db OWN | BISON, $c0 | $1b, $06
    db OWN | HAWKEYE, $c0 | $1b, $06
    db OWN | GRIZZLY, $c0 | $1b, $06
    db $ff

SECTION "nectaris/map_legend: Map B15 Kaiser", ROMX

MapB15Kaiser::
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
        "~~+   M  MMM + g ++   oooooooo y", \
        "~+++   + MM + ++  MMooooo o oo +", \
        "~+  u~+ ++ ++   ++M oooooof oo +", \
        "~+       M+ o MM  ++++  oo ooo s", \
        " +     MMMMM  MMM +   ++oooooo x", \
        "MM++  M MMMMMMM   +  M  ++o o  x", \
        "MM  ++M MMM  MM  ++MMMMM +  o  x", \
        "MMMU +    M M  o + MMMMMM ++ + x", \
        "MM   + ~~ MMM oo + MM M     +  x", \
        "MMMMM  ++M MMM  MM  ++ MMM  #+ x"
    db OWN | GRIZZLY, $00 | $04, $10
    db OWN | BISON, $00 | $06, $0e
    db OWN | RABBIT, $00 | $08, $0e
    db OWN | SEEKER, $00 | $06, $0c
    db OWN | HAWKEYE, $00 | $04, $0c
    db OWN | MUNKS, $00 | $02, $0e
    db OWN | MUNKS, $00 | $05, $11
    db FOE | MONSTER, $00 | $0c, $0e
    db FOE | BISON, $00 | $0b, $0c
    db FOE | RABBIT, $00 | $0a, $0d
    db FOE | HAWKEYE, $00 | $0d, $0a
    db FOE | BISON, $00 | $0f, $0c
    db FOE | DARBEK, $00 | $14, $02
    db FOE | MUNKS, $00 | $1c, $05
    db FOE | MULE, $00 | $12, $02
    db FOE | SEEKER, $00 | $18, $03
    db OWN | FALCO, $20 | $03, $01
    db OWN | JAVI, $20 | $03, $01
    db OWN | GRIZZLY, $20 | $03, $01
    db OWN | DILLO, $20 | $03, $01
    db OWN | BISON, $20 | $03, $01
    db OWN | NASHORN, $20 | $03, $01
    db OWN | RABBIT, $20 | $03, $01
    db OWN | LYNX, $20 | $03, $01
    db OWN | HAWKEYE, $20 | $03, $01
    db OWN | ESTOL, $20 | $03, $01
    db OWN | MULE, $20 | $03, $01
    db OWN | GRIZZLY, $40 | $04, $0d
    db OWN | PELICAN, $40 | $04, $0d
    db OWN | LYNX, $40 | $04, $0d
    db OWN | NASHORN, $40 | $04, $0d
    db OWN | DILLO, $40 | $04, $0d
    db OWN | GRIZZLY, $60 | $09, $02
    db OWN | ESTOL, $60 | $09, $02
    db OWN | MULE, $60 | $09, $02
    db OWN | RHINO, $60 | $09, $02
    db OWN | RABBIT, $60 | $09, $02
    db OWN | MONSTER, $80 | $0f, $0b
    db OWN | HUNTER, $80 | $0f, $0b
    db OWN | RABBIT, $80 | $0f, $0b
    db OWN | SEEKER, $80 | $0f, $0b
    db OWN | ESTOL, $80 | $0f, $0b
    db OWN | MUNKS, $80 | $0f, $0b
    db OWN | HUNTER, $a0 | $1a, $0d
    db OWN | PELICAN, $a0 | $1a, $0d
    db OWN | MUNKS, $a0 | $1a, $0d
    db OWN | PELICAN, $a0 | $1a, $0d
    db OWN | MUNKS, $a0 | $1a, $0d
    db OWN | FALCO, $a0 | $1a, $0d
    db OWN | HUNTER, $a0 | $1a, $0d
    db OWN | BISON, $a0 | $1a, $0d
    db OWN | SLAGGER, $a0 | $1a, $0d
    db OWN | MONSTER, $a0 | $1a, $0d
    db OWN | NASHORN, $a0 | $1a, $0d
    db $ff

SECTION "nectaris/map_legend: Map B16 Nector", ROMX

MapB16Nector::
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
        " oMMMMMMMM ~~++ ++MMMMM+ MM    y", \
        "o   MMMMMMM++  MMMMMMMM+    oo +", \
        "  ooM MMM  + MMMMMMMM  + oooo  +", \
        "  ooo M   o+ MMMM  o ++  ooo   s", \
        "    o   oo +        +  ooo  o  x", \
        "      o ooo+ o ooo o+  o       x", \
        "           +   oo o +          x", \
        "       U   +        +    u     x", \
        "           +   f    +          x", \
        " + +    u  oo   o              x"
    db OWN | BISON, $00 | $0a, $12
    db OWN | BISON, $00 | $10, $12
    db OWN | GIANT, $00 | $04, $10
    db OWN | NASHORN, $00 | $07, $10
    db OWN | RABBIT, $00 | $0a, $0f
    db OWN | RABBIT, $00 | $0c, $11
    db OWN | SEEKER, $00 | $09, $0d
    db OWN | DARBEK, $00 | $0d, $0f
    db FOE | HUNTER, $00 | $11, $05
    db FOE | SLAGGER, $00 | $0c, $0b
    db FOE | MONSTER, $00 | $0d, $08
    db FOE | MONSTER, $00 | $10, $0a
    db FOE | GIANT, $00 | $0f, $07
    db FOE | NASHORN, $00 | $08, $08
    db FOE | ESTOL, $00 | $0e, $06
    db FOE | SEEKER, $00 | $0a, $0a
    db FOE | SEEKER, $00 | $13, $04
    db FOE | RHINO, $00 | $11, $0b
    db FOE | RHINO, $00 | $0d, $05
    db FOE | RHINO, $00 | $0e, $01
    db FOE | RHINO, $00 | $13, $05
    db FOE | MUNKS, $00 | $0a, $02
    db OWN | SLAGGER, $20 | $03, $05
    db OWN | HUNTER, $20 | $03, $05
    db OWN | HUNTER, $20 | $03, $05
    db OWN | SEEKER, $20 | $03, $05
    db OWN | PELICAN, $20 | $03, $05
    db OWN | GIANT, $20 | $03, $05
    db OWN | FALCO, $20 | $03, $05
    db OWN | SEEKER, $20 | $03, $05
    db OWN | SLAGGER, $20 | $03, $05
    db OWN | HUNTER, $20 | $03, $05
    db OWN | JAVI, $40 | $0f, $13
    db OWN | GRIZZLY, $40 | $0f, $13
    db OWN | SEEKER, $40 | $0f, $13
    db OWN | DILLO, $40 | $0f, $13
    db OWN | BISON, $40 | $0f, $13
    db OWN | HAWKEYE, $40 | $0f, $13
    db OWN | DRAPER, $40 | $0f, $13
    db OWN | RABBIT, $60 | $15, $05
    db OWN | MONSTER, $60 | $15, $05
    db OWN | NASHORN, $60 | $15, $05
    db OWN | MUNKS, $60 | $15, $05
    db OWN | JAVI, $80 | $15, $09
    db OWN | HUNTER, $80 | $15, $09
    db OWN | LENET, $80 | $15, $09
    db OWN | RABBIT, $80 | $15, $09
    db OWN | LYNX, $80 | $15, $09
    db OWN | YAMA, $80 | $15, $09
    db OWN | FALCO, $a0 | $19, $12
    db OWN | DRAPER, $a0 | $19, $12
    db OWN | MULE, $a0 | $19, $12
    db OWN | RHINO, $a0 | $19, $12
    db OWN | LYNX, $a0 | $19, $12
    db OWN | HAWKEYE, $a0 | $19, $12
    db OWN | FALCO, $a0 | $19, $12
    db $ff
