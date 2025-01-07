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

SECTION "ROM Bank $006", ROMX[$4000], BANK[$6]

map_06_4000::
    db $10, $0b
    db "MMMMMM~#MMM~~MM "
    db "M  M  ~~# oooo  "
    db "M  M o  ##  o++ "
    db "M ooM  M # ++ M "
    db "MMo MMM  *+   M "
    db "M    o  +#    M "
    db "M    M ++MMM P  "
    db "MMMMM++~M  M ~  "
    db "M 8~+   M o MMM "
    db "M          ~~MM "
    db " M M M MM  M #  "
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

map_06_40ce::
    db $10, $0b
    db "MMM++++++++++++ "
    db "M++ooMoooMo~~   "
    db "+oooMMMMMMMMP + "
    db "+ o  MMMMMMoo++ "
    db "+   ~oooo  ++oM "
    db "++  ooo++++oo M "
    db " +  o++~~MoMo   "
    db " 8 ++  ~~MMMMM  "
    db "    oMoo~oM M   "
    db "~~~~~MMMoo   ~~ "
    db "+o+o+ooovvvMM~o "
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

map_06_41ab::
    db $10, $0b
    db "#+++~oM  +  +   "
    db "##  ++ ++++~+P  "
    db " # ~~~+~~~o~+   "
    db " MMM~~~~oo~~+++ "
    db "M8  M  Mo  +++d "
    db "M  ~MMMMM++  +o "
    db "oo~~MMMM +    + "
    db "++~~M MMM+    + "
    db " M++  M  + o  + "
    db "MMMM++++++++ ++ "
    db "    MM++  +wMMM "
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

map_06_4282::
    db $10, $15
    db "MMM   M ~P  oo# "
    db "MMM ~~M       # "
    db "MMM~~  M ~  ##  "
    db "M  ~~ MMMM~d #~ "
    db "M ~~  MMMMM~ #~ "
    db "M ~~ MMMMM ~~~  "
    db "MM ~MF ~MM M~~~ "
    db "MMM~MM  MMMMM ~ "
    db "MM ~ M  MMMMM   "
    db "M F~~~   MM     "
    db " ooo~~~ M       "
    db "o oo~   MMM     "
    db " ~o    M o      "
    db " ~b  MMooo      "
    db "M~~~ MMoooo~    "
    db " ~~  o +~~~~ MM "
    db "M  8 ++ ++~~~MM "
    db "M   ~  ~  +~~ M "
    db "M  ~ oo~~ + ~   "
    db "MM   ooooo++++  "
    db "~ ~ ~ ~  o   M~ "
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

map_06_440e::
    db $10, $15
    db "    M M   ~~~## "
    db "~M8       ### M "
    db "~~oo       #  M "
    db "~ooooooo    F M "
    db "o   oooo     MM "
    db "     ooo    MMM "
    db " M    ooo   MMM "
    db "MMMM    o   MMM "
    db "MMM  M oo  o~~M "
    db "M  ~~ o  oo~~~~ "
    db "~~~~F  +oo~~~~~ "
    db "~~~~  + ++ooo~~ "
    db " M       +++F o "
    db "MMMM    +    oo "
    db "MMMM  ~++~ ~ ~~ "
    db "M M    +  ~~~~M "
    db " F   ++ +  ~~~M "
    db "   ++   +   ~~M "
    db "+++     ++  ~~~ "
    db "     ~~   +P  ~ "
    db "         +      "
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

map_06_459a::
    db $10, $15
    db "~~~~~~~+ + MM ~ "
    db "MM ++++ + +   ~ "
    db "M + ~Mo F ++F ~ "
    db "M +~~MMMMMo+  ~ "
    db "M +~~ MMMMM + ~ "
    db " ++~MMMM  F ++  "
    db " +~~MMMM oooo+  "
    db " + ~~MMMoooo +  "
    db " + M~MMMoMooo+  "
    db " + MMMMMMMMM +  "
    db "~~+~MMMMMMMMM+  "
    db "~~+~~   MMMM  + "
    db "~~+~~M MMMMMM~+ "
    db "MM+8 MMMMMMM ~+ "
    db "M ++~MM  MM~~~+ "
    db "~  +MM~#MMM~~ + "
    db "~++oMM ~# M P + "
    db "~+ oMMM~##MMM + "
    db "+ oMMM ~~# #  + "
    db " oMMMMM~~~# #   "
    db "MMMMM~~+ oMMM M "
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

map_06_4735::
    db $20, $0b
    db "~~~~~MM ~~MMMM  +  ++  ooooooo x"
    db "~~~     ~~~~MMM + +  oooo ooo  x"
    db "        ~~~~M+ ++++  ~o~~    P x"
    db "  b     M ~~+~+ +#++ ~~~~~     x"
    db " ++  M      +~ F  #+ ~~~~    + x"
    db "+    MM~~o  +#~  M#+  ~     +  x"
    db "  8  ~~M~ooo+ #MMM#+        d  x"
    db "~~ ~~~~MMo~~+M#+M+ +    MM     x"
    db "~M~~~~~~ Moo++*M+ ++++  M      x"
    db "MMMMMM~M~ o + ##F +  +   MMM   x"
    db "MMMM  +  + +M++  M    +        x"
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

map_06_48ec::
    db $20, $0b
    db "~~~~MMMMMMMMM ~~ MMMM MMM~~    x"
    db " 8 ~MMMMMMM F ~M MMMMM   ~~+P  x"
    db " +  ~~MMMMMM M MMMM  ~~d ++    x"
    db "oo++ ~~~~ MMMM     + +o  + o o x"
    db "oo  ++~~~+  M  + ++ + +++o  o  x"
    db "ooo  + ++ ++ ++ + MM    ##oo # x"
    db "o o   +M MMM+M M MM ~~  o#oo~~ x"
    db "~b o o MMMMMMMMMMM ~~   M# o## x"
    db "~~ oo  MMMM MMM MMM~~M~~~~#oo  x"
    db "~~oMMMMMM ~~~~ ~M~ ~~MMM~~#o + x"
    db "MMMMMMMMMM ~~~~~~ ljkl++++ ++  x"
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

map_06_4ad9::
    db $20, $15
    db "ooo   + ~~MMMMM##~~MMMMMM MMMM x"
    db "ooo++++ ~~MMM #o MMMM    ~M MM x"
    db "oo +   ~~~MMM##MMMM  F ~~~~~~  x"
    db "o  b  ~~~~MM~~#MM      ~~~~~~  x"
    db "o  +  ~~~~ MMM#MM   ooo ~~~    x"
    db "o +   ~~M MMM~~MMM ooooo       x"
    db "  ++   ~~ MMM~~MM   ooooo~     x"
    db " 8  +  ~  MMMM~      ooo~~     x"
    db "    ++    MMM F ##MM ~~~M~~  + x"
    db " ~~~~+~~     M   #MMM~~~~   +  x"
    db "~~~M~+~~   M    ~ MM ~~MMM ++  x"
    db "~ ~MMM+~~  MMM    M  ~~ MMM+   y"
    db "~~ MM +  M  MMMF      ~~~ ~+   +"
    db "~~   ~+ M MM     MM     ~~~+   +"
    db "MM F~~+ M~MM MMMMMMM     + +   g"
    db "M     + ~  MMMMMMMM     + + +  x"
    db "MM   ++ ~~ MM M#MM #       ++  x"
    db "M  ++   ~~ MM~o#MM  #    + d   x"
    db "M  +   ~~~MM~#~MMMM~## ++ +    x"
    db "MM + ~ ~~~MM~~#MMM ~~#+ P    M x"
    db " # P    M # P    M+ MMzv#MM #  x"
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

map_06_4e1e::
    db $20, $15
    db "ooo o  MM M MM~~o oo MMMM MMM  x"
    db "o b~++++ +++M+++       +++M    x"
    db "o~+~~8 M+  ~+~ ~++++ ++ ##+ F  x"
    db "~~++   MMM ~~~~o~~~~+~~~~#++   x"
    db "~ + ++ MM ~ ooo ooooF~~~~ #+++ x"
    db "oo++MM++ +++ +++ +++ ooo~+#+ + x"
    db "ooo+M~~~+ M++o M+MMM++M++ +M~+ x"
    db "oo +MM~ ~~ +MMMMMMMMM++ ~~  +~ x"
    db "o++~MMMM~~~+MMM MMMMMM++~~~ +~ x"
    db " +~~MMM ~ ~+ ~~~M oMM  +~~~ ++ x"
    db "M+~~M      +~F~~~~~~M  +~MMM + x"
    db " +   M   ++M~ ~~~F~   +  MM  + y"
    db "o+ ~MMMM + MMMMM   MMM+d MM  + +"
    db "o+~~~oM  + MMMMMMMMMM +  MM++o +"
    db "o+~~~o ~~+  MMMMMMMMM +M   + o g"
    db "o~+oooF~~+ ~~MMMM    ++MMM +   x"
    db "  + oM  +o++~~M ~~ +++ MM  +P  x"
    db " ++++++++ oo~o ooo  ~~+o  M+   x"
    db " +M+ + +o+o+o+o+o+ +~+++o++  M x"
    db "~ + + + + + + + + + + + +    M x"
    db " ~ ~ ~ ~ ~~+o+o+o+o+ +~+++ou~+ x"
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

map_06_5169::
    db $20, $15
    db "MMMMMMMMMMMMMMMMMMMMMM  # #M#M x"
    db "MM o MMMM MMMMM   MMMMM MM#  M x"
    db "MM~~ooM~ ~MMM~  d ~MMM  MMMMMM x"
    db "MM~~oo M~~MM~~   ~MMMMM MMMMMM x"
    db " MMF   MMMMM ~P  ~MMMM MMMM  M x"
    db "# MM   oMMMMM +  ~M MMMMM oo M x"
    db "##MM   oMMMMMM++  ~MMMM  ooo~~ x"
    db " # MM  ooo MMMMo+ ooMo ooo~F~~ x"
    db "  # MM    ooM  o+oooooo~o# +   x"
    db "MM## ##   oooooo+~o~o~~   #+~~ x"
    db "M oo#         ~~~~~~~~~  +*~~~ x"
    db "M    o          ~   ~    +##~# y"
    db "MMM~~~oo     o o         + # # +"
    db "M ~~~o~ooo   ooo     MMM +  #o +"
    db "M ~~ooo o   oooo oo MMM~~+  #  g"
    db "   +        oMooooooMMM +   F  x"
    db "MM+ ++    ooMMMMooooM  +++ ++M x"
    db "M b   ++oooo MMM ooo   +  +F M x"
    db "M  M 8  ++o  MM~MMoo ++      M x"
    db "M         ++ MM M  ++~ o     M x"
    db "o o o                    8     x"
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

map_06_54ae::
    db $20, $15
    db "MM~+++++##    ~~~~~~~MM MMMMM  x"
    db "M +    8 # +++ o o~+++    M  + x"
    db "  +  MM+  #+o+ ooo+   ++o++F + x"
    db "o b~~M~+ +*ooo++o +~ M ++ ~  + x"
    db "oo o~~  +~oooo  +++MMMM+~~~~+  x"
    db "M oooo~~~oo  M  + ~MMM + M~ +  x"
    db "MM  ooooooo MMMM+o~ MM + MM ++ x"
    db "M ooo~o~o ooMMM +  MMM + MMM + x"
    db "MMo  M~~~ o MMM + MMMM + MM  + x"
    db "MMM MMMM~MMMMMM + MMMMM+MMM o+ x"
    db "MM ~MMMMMMMMM   +o  M  +MMMM + x"
    db "MM  MMMMMMM+ +  +  F  + MMMMM+ y"
    db "MMMM MMMM + + +++  +  + M    + +"
    db "MMM   M   +   ++   +++++ +++   +"
    db "M        ++     +  + Mo +~~+P  g"
    db " ++++++++       +++ooooooo~+ ~ x"
    db " +              + Moooooo+o +~ x"
    db "ooF  ~     ooo  ++o+o+o++ ++++ x"
    db "oo  ~~~ oo ooo   o+ +~+ d ++ + x"
    db "ooo ~~~ ooooooo  ooo~~~     +  x"
    db "+o+     +  + Mo +~~+z~+ d o+   x"
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

map_06_57f6::
    db $20, $15
    db "MMMMMMMMM oMMMM MMMMMMM MMMMMM x"
    db "MMM   M ooooM  ~M  MM    ~ MMM x"
    db "MMM 8   o oo ~o ~ ~~    ~~~  M x"
    db "MMMM   ~~~o   ~~   ~~~  ~    M x"
    db "MMM  b ~~~    ~~     M  F    M x"
    db "M ~~    ~~    ##   MM  M   ~MM x"
    db "MM~~ M      ~  #   M   MM o MM x"
    db "M ~ MMMM~  o o  #   M    ~~  M x"
    db "M   MMMM  ooMoMM#M~~M    ~~MMM x"
    db "MM  MM MM   ooMMMM~~      ~MMM x"
    db "MMoMMMMM M  ooMMM ~~oo  ~  MM  x"
    db "MMMMMMMMMMMM  ## F~~o ~~       y"
    db "MMMMMMM MMM    #  ~~  ~~~~     +"
    db "MMM    ~M  MMM  ooo~~~ M~      +"
    db "MM  ~~  ~ MMMM  o  ~~~MMMM~~   g"
    db "M~~ ~~o   MMM~      ~~MMM ~~P  x"
    db "M ~ ~ M   M  ~~  ~ M     ~~~   x"
    db "MM        MMMM~~~~      ~~~  ~ x"
    db "M  F   ~~~~~M  ~~o ~~~    d  ~ x"
    db "M ~   ~~~M~~~~ ~~oo~~~~~   M~~ x"
    db "             ~~~      kji~M ~M x"
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

map_06_5b20::
    db $20, $15
    db "~~o       ~       ~~~~~ ooo oo x"
    db "~~ MMMMM MMM MF          M  oo x"
    db "~~MMMMM MMMMMMMMMMMMMM MMMMM   x"
    db "~       M M  MMMMMMMMMMMM MMM  x"
    db "  8  ~        M   MMMM MMMMM   x"
    db " M MMM M MMMMM    MMMMM MMM    x"
    db "MMMMMMMMMMMMMMMM o  MM ~   b   x"
    db "MMM MMMMMMMMMMMMMM  MMMM     o x"
    db "M oo MMMMMM    MMM   MM        x"
    db "M oo  MMM   d   MMMM MM oo MMM x"
    db "MMMM MMM ~     MM  M    oF MMM x"
    db "MMMMMMMM ~~MMM MMMM        MMM y"
    db "MMMMMMMMM~~ MMMMMMM  MMM ~MMM  +"
    db "MM MMMM  F    M M   MMM   MM   +"
    db "M   M            o  MMM   MMMo g"
    db "         M MMMMM    MMMM     o x"
    db "   MMM MMMMMMMMMM MMMMM   ooo  x"
    db "   MMMMMMMMMM M   MMM     oo ~ x"
    db "++ MMMMMM         M   P     ~~ x"
    db "  ++MMM  ~ooF  o   ~ ~   ~~~~~ x"
    db "MMMM     oo MMMMj  M M   MMM   x"
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

map_06_5e4d::
    db $20, $15
    db " MM+~#MMMM M   +~~~~~  # M##MM x"
    db "MM~F~~#MM  MM++M    ~  P MMMMM x"
    db "M  +~ #MMF oM+ MMM       #MMMM x"
    db "MM  ++       +~~MM     ~  #MMM x"
    db "MMM~ +  oo~  +~ MMM   ~~####MM x"
    db "MM ~~ ++o  M + MMM  MM~~#o##   x"
    db "M~~~~ ~~++ MMM+MMMMMMM~~~~o~ + x"
    db "M ~ ~ ~M~+ MM +MMMMM M ~~~~++# x"
    db "++o  MMMMM++  ++MMMMM  M~~~+   x"
    db "  + MMMMMMMM++ + MM  +++   +oo x"
    db " ~+ o MMMMMMM+ +   ++   +++ooo x"
    db "~~+   M  MMM + d ++   oooooooo y"
    db "~+++   + MM + ++  MMooooo o oo +"
    db "~+  b~+ ++ ++   ++M ooooooF oo +"
    db "~+       M+ o MM  ++++  oo ooo g"
    db " +     MMMMM  MMM +   ++oooooo x"
    db "MM++  M MMMMMMM   +  M  ++o o  x"
    db "MM  ++M MMM  MM  ++MMMMM +  o  x"
    db "MMM8 +    M M  o + MMMMMM ++ + x"
    db "MM   + ~~ MMM oo + MM M     +  x"
    db "MMMMM  ++M MMM  MM  ++ MMM  #+ x"
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

map_06_6192::
    db $20, $15
    db "MM ~~MMMMM  ooo ooo   MMM   M  x"
    db "MMM~~MMMMMMooo P ooo MMMMM~~ + x"
    db "MM ~~MMMMM oo+++++oo MMMM ~++  x"
    db "MMM~~ MMMo ++oo+oo++ MM  ~~+ M x"
    db "MM ~~~~~ ++ ooo+ooo ++ +~++MMM x"
    db "MMMF~~~++  M  o+o    d+ + MMMM x"
    db "M++++++~ MMMMM +MMMMMM ~~ MMMM x"
    db "+ MM ~~~ MMMMMM+MMMMM ~~~ MMMM x"
    db "+ MM ~~~~~MMM  + MM  ~~~MMMMM  x"
    db "ooMMM ~~~~~~ ~ +~~   F~~MMMMM  x"
    db "o MM MMM ~~~~~~+  MMMM  MMMMMo x"
    db " oMMMMMMMM ~~++ ++MMMMM+ MM    y"
    db "o   MMMMMMM++  MMMMMMMM+    oo +"
    db "  ooM MMM  + MMMMMMMM  + oooo  +"
    db "  ooo M   o+ MMMM  o ++  ooo   g"
    db "    o   oo +        +  ooo  o  x"
    db "      o ooo+ o ooo o+  o       x"
    db "           +   oo o +          x"
    db "       8   +        +    b     x"
    db "           +   F    +          x"
    db " + +    b  oo   o              x"
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

map_06_64dd::
    db $10, $0b
    db "MoMMM~# ~ ~~~MMM"
    db "ooo~M ##    ~~~~"
    db "oo~    *++++++++"
    db "o    ++#     P  "
    db "o  ++  M#      ~"
    db " 8 + ~ M#o~    M"
    db " + + o~M oo~~ ~o"
    db "+ + ~oMMMMoo~~oM"
    db "   ~~~ooMMMMo~MM"
    db "oo~~~oooMMMMMMMM"
    db "oMo oMMMMoM MMM "
    db OWN | BISON, $00 | $01, $06
    db OWN | MUNKS, $00 | $01, $05
    db OWN | MUNKS, $00 | $03, $06
    db FOE | MUNKS, $00 | $0d, $03
    db OWN | BISON, $00 | $00, $03
    db OWN | BISON, $00 | $02, $07
    db FOE | MUNKS, $00 | $0a, $00
    db FOE | BISON, $00 | $09, $00
    db FOE | BISON, $00 | $0b, $02
    db $ff

map_06_65ab::
    db $10, $0b
    db "M Moo ~   oMM   "
    db "M8           ~ o"
    db "       o o  o oo"
    db "    ~~ MMMoo  oo"
    db "  ~~    MMo   o "
    db "     o  M       "
    db "    ooo        ~"
    db "oooM~MMM ~~M P ~"
    db "o  o  oooo~~   ~"
    db " ~~ o ~ MM~~   ~"
    db "   M M M  oMMMM "
    db OWN | BISON, $00 | $03, $00
    db OWN | BISON, $00 | $03, $03
    db OWN | BISON, $00 | $01, $03
    db OWN | BISON, $00 | $05, $00
    db OWN | BISON, $00 | $03, $06
    db OWN | MUNKS, $00 | $01, $01
    db OWN | MUNKS, $00 | $04, $02
    db OWN | MUNKS, $00 | $02, $03
    db FOE | BISON, $00 | $0c, $05
    db FOE | BISON, $00 | $0b, $05
    db FOE | BISON, $00 | $0c, $03
    db FOE | MUNKS, $00 | $0d, $07
    db FOE | MUNKS, $00 | $0d, $06
    db FOE | BISON, $00 | $0b, $03
    db $ff

map_06_6688::
    db $10, $0b
    db "MMMMM  # ~     ~"
    db "MMMMM ##  M ~P  "
    db "M MMM #+ + + + +"
    db "     +*#+ +~+ +M"
    db "M ~++ MM   ~d   "
    db " ++ o MM  ~   ~ "
    db "+     oMMM  o~  "
    db "  8   ooMo    oM"
    db "    ~  MooMoMMMM"
    db "oo Mo  MoMoMMMMM"
    db "MM   MMMMMMMMMM "
    db OWN | BISON, $00 | $05, $06
    db OWN | BISON, $00 | $05, $03
    db OWN | MUNKS, $00 | $05, $05
    db FOE | MUNKS, $00 | $0d, $01
    db FOE | DARBEK, $20 | $0c, $04
    db OWN | MUNKS, $00 | $05, $08
    db OWN | BISON, $00 | $02, $07
    db FOE | NASHORN, $20 | $0c, $04
    db FOE | BISON, $00 | $0c, $01
    db FOE | BISON, $00 | $0c, $02
    db FOE | BISON, $00 | $0d, $02
    db OWN | BISON, $00 | $0c, $06
    db $ff

map_06_675f::
    db $10, $0b
    db "Mooo           ~"
    db "M     F         "
    db "M        oo o  o"
    db "  o o     o     "
    db "    ~oo~o       "
    db "      o ~o  P  o"
    db "o      ~ o      "
    db " 8     o        "
    db "        o ~   MM"
    db "    o      Mo  M"
    db " M M M MM MM ~  "
    db OWN | RABBIT, $20 | $06, $01
    db OWN | RABBIT, $20 | $06, $01
    db OWN | LENET, $00 | $03, $03
    db OWN | LENET, $00 | $04, $05
    db OWN | BISON, $00 | $02, $06
    db OWN | BISON, $00 | $01, $04
    db OWN | NASHORN, $00 | $03, $07
    db OWN | MUNKS, $00 | $01, $05
    db OWN | DARBEK, $00 | $01, $07
    db OWN | DARBEK, $00 | $06, $06
    db FOE | NASHORN, $00 | $0c, $05
    db FOE | RABBIT, $00 | $0e, $04
    db FOE | SLAGGER, $00 | $0d, $06
    db FOE | BISON, $00 | $0b, $03
    db FOE | BISON, $00 | $0a, $05
    db FOE | BISON, $00 | $0a, $07
    db FOE | DARBEK, $00 | $0c, $03
    db FOE | DARBEK, $00 | $0a, $06
    db FOE | DARBEK, $00 | $0c, $07
    db $ff

map_06_684b::
    db $10, $16
    db "MMMoo   ~   ooMM"
    db "Mo~    ~ o   ~MM"
    db "Mo    oMMM~   oM"
    db "o     oMMo     ~"
    db "o~  8 MMM~F    ~"
    db "~    ooMMMo   ~M"
    db "M~   MMMMM~   ~M"
    db "Mo  ~MMMMMM  ~oM"
    db "MM~ oMMMMMM  ooM"
    db "Mo~ MMMMM~M  oMM"
    db "Mo  ~MMMM~    MM"
    db "MM  oMMMMM o ~MM"
    db "M   ~ooMMMMo MoM"
    db "M~   ooMMMM~ oMM"
    db "~F   oMMMMo   MM"
    db "    ~MMMMMM   MM"
    db "    MMMMMoP  ~MM"
    db "o   o~M~M     ~M"
    db "Mo            oM"
    db "MMo  ~~      ooM"
    db "MM~M~M~M~M~M~MMM"
    db "MMMMMMM M M~MMMM"
    db OWN | MUNKS, $00 | $05, $04
    db OWN | MUNKS, $00 | $05, $02
    db OWN | RABBIT, $00 | $02, $04
    db OWN | BISON, $00 | $04, $04
    db FOE | JAVI, $40 | $01, $0e
    db FOE | LYNX, $40 | $01, $0e
    db FOE | SLAGGER, $40 | $01, $0e
    db FOE | MONSTER, $40 | $01, $0e
    db OWN | LENET, $20 | $0a, $04
    db OWN | HAWKEYE, $20 | $0a, $04
    db OWN | DILLO, $20 | $0a, $04
    db OWN | SEEKER, $20 | $0a, $04
    db FOE | MUNKS, $00 | $0c, $0e
    db FOE | BISON, $00 | $0a, $10
    db FOE | DRAPER, $00 | $09, $12
    db FOE | RABBIT, $00 | $07, $11
    db FOE | RABBIT, $00 | $09, $11
    db FOE | GRIZZLY, $00 | $06, $13
    db OWN | BISON, $00 | $03, $05
    db FOE | BISON, $00 | $0c, $11
    db OWN | RABBIT, $00 | $03, $03
    db $ff

map_06_69ed::
    db $10, $16
    db "~  ~          ~M"
    db " 8        F  ~ M"
    db "     ~  ~      M"
    db "          ~    M"
    db "   ~ ~ ~    ~  M"
    db "~  o~MoMoo~~   M"
    db "M~~MMoMoMoo   ~M"
    db "MMM~o ~ ~  ~~oMM"
    db "MMoo      ooooMM"
    db "MM~~   F   ~oM~M"
    db "oMM        MMMMM"
    db "~ ~ o~    ~MMMMM"
    db "~   oMoo~ooMo~oM"
    db "    ~oMMoMM~o ~M"
    db " ~    ~~~~~   ~M"
    db "    ~          M"
    db " F        ~    M"
    db "    ~ ~     P  M"
    db "~       ~      M"
    db "~~ ~ ~~      ~~M"
    db "MM~M~M~M~M~M~M~M"
    db "MMMMMMMMM MMMMMM"
    db OWN | NASHORN, $00 | $04, $03
    db OWN | GRIZZLY, $00 | $04, $01
    db OWN | BISON, $00 | $03, $02
    db OWN | RABBIT, $00 | $01, $04
    db OWN | FALCO, $00 | $06, $04
    db OWN | JAVI, $00 | $04, $05
    db OWN | MUNKS, $00 | $01, $01
    db OWN | MUNKS, $00 | $01, $02
    db OWN | MULE, $00 | $04, $02
    db OWN | JAVI, $20 | $0a, $01
    db OWN | DILLO, $20 | $0a, $01
    db OWN | SEEKER, $20 | $0a, $01
    db FOE | ESTOL, $60 | $01, $10
    db FOE | SEEKER, $60 | $01, $10
    db FOE | GIANT, $60 | $01, $10
    db FOE | MONSTER, $60 | $01, $10
    db FOE | GIANT, $40 | $07, $09
    db FOE | LYNX, $40 | $07, $09
    db OWN | DILLO, $40 | $07, $09
    db FOE | MUNKS, $00 | $0c, $10
    db FOE | DARBEK, $00 | $0c, $11
    db FOE | MULE, $00 | $0a, $11
    db FOE | HAWKEYE, $00 | $09, $0f
    db FOE | MONSTER, $00 | $08, $11
    db FOE | RABBIT, $00 | $09, $12
    db FOE | HUNTER, $00 | $0b, $0f
    db FOE | HUNTER, $60 | $01, $10
    db FOE | SLAGGER, $60 | $01, $10
    db FOE | MULE, $60 | $01, $10
    db FOE | LYNX, $00 | $08, $10
    db FOE | BISON, $00 | $0b, $12
    db FOE | RHINO, $60 | $01, $10
    db FOE | YAMA, $60 | $01, $10
    db $ff

map_06_6bb3::
    db $10, $16
    db "o~ ~oMMMo ~~o ~M"
    db "~8 MoMo~~     oM"
    db "   MoMo~   o  ~M"
    db "   oMMo   MM   M"
    db "~  ~Mo~  oMM~ ~M"
    db "  MMMo~  MMMo oM"
    db "  oMMM  ~MoMo oM"
    db "   ooM  MoMo  oM"
    db "  ooM~  MMM    M"
    db "~  oMMF ~Mo~ o~M"
    db "~~ MM   oMo  oMM"
    db "~  Mo    MM   ~M"
    db "~ MMM  ~oMM  ~oM"
    db "  MMo  MMoo~  ~M"
    db " oMM   MMoo   ~M"
    db " oMM   MM~    oM"
    db "  M   ~MM~ P  ~M"
    db "     ~oMoM ~ ~~M"
    db "oo~o~MMooMooo~oM"
    db "ooo~oMMMMMMMMMMM"
    db "MMMMMMMMMMMMMMMM"
    db "M M  M MM MMM MM"
    db OWN | BISON, $00 | $02, $0b
    db OWN | BISON, $00 | $01, $0c
    db OWN | LYNX, $00 | $01, $0a
    db FOE | SLAGGER, $00 | $03, $10
    db FOE | SLAGGER, $00 | $05, $0f
    db FOE | SLAGGER, $00 | $0c, $0b
    db FOE | SLAGGER, $00 | $0d, $0c
    db FOE | LYNX, $00 | $0c, $0d
    db FOE | LYNX, $00 | $0d, $0e
    db FOE | ESTOL, $00 | $0c, $0f
    db OWN | JAVI, $00 | $01, $00
    db FOE | HUNTER, $00 | $0d, $10
    db OWN | SEEKER, $00 | $01, $09
    db FOE | SEEKER, $00 | $06, $0e
    db FOE | SEEKER, $00 | $0d, $0d
    db OWN | MULE, $20 | $06, $09
    db OWN | YAMA, $20 | $06, $09
    db FOE | RHINO, $00 | $0a, $0f
    db FOE | MONSTER, $00 | $0b, $0d
    db FOE | MUNKS, $00 | $04, $10
    db FOE | MUNKS, $00 | $0b, $10
    db FOE | DARBEK, $00 | $0b, $0c
    db OWN | FALCO, $00 | $02, $02
    db FOE | HUNTER, $00 | $0a, $12
    db FOE | MUNKS, $00 | $09, $0c
    db OWN | BISON, $00 | $06, $06
    db FOE | MONSTER, $00 | $08, $03
    db FOE | MONSTER, $00 | $07, $03
    db OWN | RABBIT, $00 | $0b, $00
    db OWN | MUNKS, $00 | $07, $06
    db OWN | GRIZZLY, $00 | $01, $0d
    db OWN | DARBEK, $00 | $02, $09
    db OWN | DARBEK, $20 | $06, $09
    db FOE | BISON, $00 | $04, $0f
    db FOE | SLAGGER, $00 | $0d, $0a
    db OWN | BISON, $00 | $0d, $02
    db OWN | LENET, $00 | $0c, $02
    db OWN | LENET, $00 | $07, $07
    db OWN | SEEKER, $00 | $01, $03
    db FOE | MUNKS, $00 | $06, $0c
    db $ff

map_06_6d8e::
    db $10, $16
    db "MMo Moo~MMMMMMoM"
    db "MoM~  ~ ~o~o~MoM"
    db "M~   ~    ~   MM"
    db "MM P  o~ ~o  o~M"
    db "Mo   ~o     ~~~M"
    db "M~o     oM~    M"
    db "o   ~M~    F  ~M"
    db " ~~~ o ~oo~~ ~oM"
    db "  Mo         ~~M"
    db "~    ~ ~Mo~o ooM"
    db "oo~ oM o  M~ ~~M"
    db "o~ ~~   ~     oM"
    db "o  F  ~o Mo ~ ~M"
    db "~~   M~ M~ o ~~M"
    db "o~~    ~   M  oM"
    db "o  ~ ~ oM ~ ~o~M"
    db "~ ~ oM       ~MM"
    db "o M~   M  8  M~M"
    db "oM  ~~ ~~   ~MoM"
    db "MM o M o ~ ~M~oM"
    db "MMMMMM~M M~MoMMM"
    db "MMM MMMMMMM MMMM"
    db OWN | RABBIT, $00 | $08, $10
    db OWN | BISON, $00 | $0d, $0f
    db OWN | DRAPER, $00 | $0a, $11
    db FOE | RABBIT, $00 | $04, $04
    db FOE | SLAGGER, $00 | $02, $05
    db FOE | SLAGGER, $00 | $03, $03
    db FOE | MONSTER, $00 | $03, $05
    db OWN | BISON, $00 | $0b, $0f
    db OWN | GRIZZLY, $40 | $03, $0c
    db OWN | BISON, $40 | $03, $0c
    db OWN | BISON, $40 | $03, $0c
    db FOE | NASHORN, $20 | $0b, $06
    db FOE | LYNX, $20 | $0b, $06
    db FOE | MONSTER, $20 | $0b, $06
    db FOE | MONSTER, $20 | $0b, $06
    db FOE | SLAGGER, $20 | $0b, $06
    db FOE | SLAGGER, $20 | $0b, $06
    db FOE | RABBIT, $00 | $01, $04
    db OWN | MUNKS, $00 | $08, $11
    db OWN | ESTOL, $40 | $03, $0c
    db OWN | RABBIT, $40 | $03, $0c
    db OWN | RABBIT, $40 | $03, $0c
    db FOE | DILLO, $20 | $0b, $06
    db FOE | DRAPER, $00 | $04, $05
    db FOE | MUNKS, $00 | $06, $04
    db FOE | NASHORN, $00 | $05, $03
    db FOE | MONSTER, $00 | $05, $05
    db FOE | SLAGGER, $00 | $04, $02
    db OWN | RABBIT, $00 | $07, $10
    db OWN | LYNX, $40 | $03, $0c
    db $ff

map_06_6f4b::
    db $20, $0b
    db "#oo    MM~~ ~MM~MM~   ~~    ~#~~"
    db "## 8  MMM~~     M    ~~    F  ##"
    db " #    MMMM F                 ##M"
    db "       MMM    ~~       M MooooMM"
    db "        MMMo oMMMM    MMMMMMoooo"
    db " ~MM     ~ooooooM~     MM ooo oo"
    db "~~M       ~~~   ~~~  # ##       "
    db "~     ## #~      MM~~~#+++++P   "
    db "~ F    # ##M  F   M ~+*oo       "
    db "     ~#~~###M      ++~##o    ooo"
    db " M  ~M~M#M M#M~M P+M~M P~M M ooM"
    db OWN | HAWKEYE, $00 | $03, $01
    db OWN | DARBEK, $00 | $05, $01
    db OWN | MUNKS, $00 | $04, $03
    db OWN | SEEKER, $00 | $02, $03
    db OWN | RABBIT, $00 | $06, $03
    db OWN | RABBIT, $00 | $05, $03
    db OWN | FALCO, $00 | $04, $05
    db OWN | FALCO, $00 | $04, $06
    db OWN | JAVI, $00 | $05, $05
    db OWN | FALCO, $60 | $02, $08
    db OWN | FALCO, $60 | $02, $08
    db OWN | JAVI, $60 | $02, $08
    db OWN | JAVI, $60 | $02, $08
    db OWN | HAWKEYE, $60 | $02, $08
    db OWN | SEEKER, $60 | $02, $08
    db OWN | PELICAN, $60 | $02, $08
    db OWN | DARBEK, $60 | $02, $08
    db OWN | NASHORN, $60 | $02, $08
    db OWN | FALCO, $40 | $0b, $02
    db OWN | FALCO, $40 | $0b, $02
    db OWN | HUNTER, $40 | $0b, $02
    db OWN | GRIZZLY, $40 | $0b, $02
    db OWN | BISON, $40 | $0b, $02
    db OWN | BISON, $40 | $0b, $02
    db FOE | HUNTER, $80 | $0e, $08
    db FOE | HUNTER, $80 | $0e, $08
    db FOE | MONSTER, $80 | $0e, $08
    db FOE | MONSTER, $80 | $0e, $08
    db FOE | RABBIT, $80 | $0e, $08
    db FOE | LYNX, $80 | $0e, $08
    db FOE | FALCO, $20 | $1b, $01
    db FOE | HUNTER, $20 | $1b, $01
    db FOE | HUNTER, $20 | $1b, $01
    db FOE | PELICAN, $20 | $1b, $01
    db FOE | MUNKS, $20 | $1b, $01
    db FOE | SEEKER, $20 | $1b, $01
    db FOE | NASHORN, $20 | $1b, $01
    db FOE | HUNTER, $20 | $1b, $01
    db FOE | HUNTER, $20 | $1b, $01
    db FOE | HUNTER, $20 | $1b, $01
    db FOE | PELICAN, $20 | $1b, $01
    db FOE | RHINO, $20 | $1b, $01
    db OWN | BISON, $00 | $07, $04
    db FOE | RABBIT, $00 | $1d, $08
    db FOE | RABBIT, $00 | $1c, $09
    db FOE | SEEKER, $00 | $1b, $08
    db FOE | SEEKER, $00 | $19, $08
    db FOE | MUNKS, $00 | $1c, $07
    db FOE | HUNTER, $00 | $19, $06
    db FOE | HUNTER, $00 | $1a, $06
    db FOE | HUNTER, $00 | $1a, $07
    db FOE | DRAPER, $00 | $1b, $05
    db FOE | HAWKEYE, $00 | $1d, $05
    db FOE | SLAGGER, $00 | $1d, $06
    db FOE | SLAGGER, $00 | $1d, $07
    db $ff

map_06_7153::
    db $20, $0b
    db "MMMM+   ooooMMMMMMMMM#~##~ +~~~~"
    db "~~M++ P  MMMMMMMM MMoo#~~  b  ~o"
    db "~ +      MMMMMM~~   o## ~++   oo"
    db "  d    #MMM MMM~ #     ++  M    "
    db "  + ### MM F    ~##++++  MMMM   "
    db "  ++~*++++       +*~~~   MMM    "
    db "oo  +# ~~++++++++ ##oo  MMM  8  "
    db "oM~MMM# ~+~~~      #o~ MMMMM    "
    db "MMMMM##  +~oo  F  ~M~~~MM~M    o"
    db "MMMMM~~  +  o     MMMMMMM~~~  oo"
    db "MMMMM~~M P   M M  MMMMM~~M~M  oM"
    db FOE | PELICAN, $40 | $02, $03
    db FOE | MUNKS, $40 | $02, $03
    db FOE | DILLO, $40 | $02, $03
    db FOE | MONSTER, $40 | $02, $03
    db FOE | MONSTER, $40 | $02, $03
    db FOE | NASHORN, $40 | $02, $03
    db FOE | LYNX, $40 | $02, $03
    db OWN | GRIZZLY, $20 | $1b, $01
    db OWN | BISON, $20 | $1b, $01
    db OWN | LENET, $20 | $1b, $01
    db OWN | LENET, $20 | $1b, $01
    db OWN | NASHORN, $20 | $1b, $01
    db OWN | PELICAN, $20 | $1b, $01
    db OWN | YAMA, $20 | $1b, $01
    db OWN | PELICAN, $00 | $19, $03
    db OWN | MUNKS, $00 | $1c, $03
    db OWN | DRAPER, $00 | $1d, $06
    db OWN | SEEKER, $00 | $1b, $02
    db OWN | SEEKER, $00 | $1a, $02
    db OWN | RABBIT, $00 | $1d, $02
    db OWN | LYNX, $00 | $1a, $01
    db OWN | FALCO, $00 | $18, $01
    db OWN | JAVI, $00 | $17, $03
    db FOE | HAWKEYE, $00 | $00, $04
    db FOE | SEEKER, $00 | $02, $04
    db FOE | HUNTER, $00 | $06, $03
    db FOE | HUNTER, $00 | $05, $03
    db FOE | SLAGGER, $00 | $02, $02
    db FOE | DRAPER, $00 | $03, $01
    db FOE | RABBIT, $60 | $0b, $04
    db FOE | RABBIT, $60 | $0b, $04
    db FOE | SLAGGER, $60 | $0b, $04
    db FOE | SLAGGER, $60 | $0b, $04
    db OWN | GRIZZLY, $80 | $0f, $08
    db OWN | BISON, $00 | $1a, $03
    db FOE | RABBIT, $00 | $05, $02
    db FOE | HUNTER, $40 | $02, $03
    db FOE | HUNTER, $40 | $02, $03
    db FOE | SEEKER, $00 | $03, $05
    db FOE | SLAGGER, $00 | $03, $03
    db FOE | MONSTER, $00 | $01, $03
    db OWN | BISON, $80 | $0f, $08
    db OWN | HAWKEYE, $80 | $0f, $08
    db OWN | SEEKER, $80 | $0f, $08
    db FOE | HUNTER, $40 | $02, $03
    db FOE | PELICAN, $40 | $02, $03
    db FOE | YAMA, $40 | $02, $03
    db FOE | DARBEK, $00 | $09, $00
    db OWN | JAVI, $80 | $0f, $08
    db OWN | FALCO, $80 | $0f, $08
    db FOE | BISON, $60 | $0b, $04
    db FOE | MULE, $60 | $0b, $04
    db FOE | RHINO, $60 | $0b, $04
    db FOE | HUNTER, $60 | $0b, $04
    db FOE | HUNTER, $60 | $0b, $04
    db $ff
