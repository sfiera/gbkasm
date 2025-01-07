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

SECTION "ROM Bank $011", ROMX[$4000], BANK[$11]

map_11_4000::
    db $10, $0b
    db "MMMMMM~#MMM~~MM " ;map
    db "M  M  ~~# oooo  " ;map
    db "M  M o  ##  o++ " ;map
    db "M ooM  M # ++ M " ;map
    db "MMo MMM  *+   M " ;map
    db "M    o  +#    M " ;map
    db "M    M ++MMM P  " ;map
    db "MMMMM++~M  M ~  " ;map
    db "M 8~+   M o MMM " ;map
    db "M          ~~MM " ;map
    db " M M M MM  M #  " ;map
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

map_11_40e6::
    db $10, $0b
    db "MMM++++++++++++ " ;map
    db "M++ooMoooMo~~   " ;map
    db "+oooMMMMMMMMP + " ;map
    db "+ o  MMMMMMoo++ " ;map
    db "+   ~oooo  ++oM " ;map
    db "++  ooo++++oo M " ;map
    db " +  o++~~MoMo   " ;map
    db " 8 ++  ~~MMMMM  " ;map
    db "    oMoo~oM M   " ;map
    db "~~~~~MMMoo   ~~ " ;map
    db "+o+o+ooovvvMM~o " ;map
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

map_11_41d5::
    db $10, $0b
    db "#+++~oM  +  +   " ;map
    db "##  ++ ++++~+P  " ;map
    db " # ~~~+~~~o~+   " ;map
    db " MMM~~~~oo~~+++ " ;map
    db "M8  M  Mo  +++d " ;map
    db "M  ~MMMMM++  +o " ;map
    db "oo~~MMMM +    + " ;map
    db "++~~M MMM+    + " ;map
    db " M++  M  + o  + " ;map
    db "MMMM++++++++ ++ " ;map
    db "    MM++  +wMMM " ;map
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

map_11_42dc::
    db $10, $15
    db "MMM   M ~P  oo# " ;map
    db "MMM ~~M       # " ;map
    db "MMM~~  M ~  ##  " ;map
    db "M  ~~ MMMM~d #~ " ;map
    db "M ~~  MMMMM~ #~ " ;map
    db "M ~~ MMMMM ~~~  " ;map
    db "MM ~MF ~MM M~~~ " ;map
    db "MMM~MM  MMMMM ~ " ;map
    db "MM ~ M  MMMMM   " ;map
    db "M F~~~   MM     " ;map
    db " ooo~~~ M       " ;map
    db "o oo~   MMM     " ;map
    db " ~o    M o      " ;map
    db " ~b  MMooo      " ;map
    db "M~~~ MMoooo~    " ;map
    db " ~~  o +~~~~ MM " ;map
    db "M  8 ++ ++~~~MM " ;map
    db "M   ~  ~  +~~ M " ;map
    db "M  ~ oo~~ + ~   " ;map
    db "MM   ooooo++++  " ;map
    db "~ ~ ~ ~  o   M~ " ;map
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

map_11_4474::
    db $10, $15
    db "    M M   ~~~## " ;map
    db "~M8       ### M " ;map
    db "~~oo       #  M " ;map
    db "~ooooooo    F M " ;map
    db "o   oooo     MM " ;map
    db "     ooo    MMM " ;map
    db " M    ooo   MMM " ;map
    db "MMMM    o   MMM " ;map
    db "MMM  M oo  o~~M " ;map
    db "M  ~~ o  oo~~~~ " ;map
    db "~~~~F  +oo~~~~~ " ;map
    db "~~~~  + ++ooo~~ " ;map
    db " M       +++F o " ;map
    db "MMMM    +    oo " ;map
    db "MMMM  ~++~ ~ ~~ " ;map
    db "M M    +  ~~~~M " ;map
    db " F   ++ +  ~~~M " ;map
    db "   ++   +   ~~M " ;map
    db "+++     ++  ~~~ " ;map
    db "     ~~   +P  ~ " ;map
    db "         +      " ;map
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

map_11_464e::
    db $10, $15
    db "~~~~~~~+ + MM ~ " ;map
    db "MM ++++ + +   ~ " ;map
    db "M + ~Mo F ++F ~ " ;map
    db "M +~~MMMMMo+  ~ " ;map
    db "M +~~ MMMMM + ~ " ;map
    db " ++~MMMM  F ++  " ;map
    db " +~~MMMM oooo+  " ;map
    db " + ~~MMMoooo +  " ;map
    db " + M~MMMoMooo+  " ;map
    db " + MMMMMMMMM +  " ;map
    db "~~+~MMMMMMMMM+  " ;map
    db "~~+~~   MMMM  + " ;map
    db "~~+~~M MMMMMM~+ " ;map
    db "MM+8 MMMMMMM ~+ " ;map
    db "M ++~MM  MM~~~+ " ;map
    db "~  +MM~#MMM~~ + " ;map
    db "~++oMM ~# M P + " ;map
    db "~+ oMMM~##MMM + " ;map
    db "+ oMMM ~~# #  + " ;map
    db " oMMMMM~~~# #   " ;map
    db "MMMMM~~+ oMMM M " ;map
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

map_11_4801::
    db $20, $0b
    db "~~~~~MM ~~MMMM  +  ++  ooooooo x" ;map
    db "~~~     ~~~~MMM + +  oooo ooo  x" ;map
    db "        ~~~~M+ ++++  ~o~~    P x" ;map
    db "  b     M ~~+~+ +#++ ~~~~~     x" ;map
    db " ++  M      +~ F  #+ ~~~~    + x" ;map
    db "+    MM~~o  +#~  M#+  ~     +  x" ;map
    db "  8  ~~M~ooo+ #MMM#+        d  x" ;map
    db "~~ ~~~~MMo~~+M#+M+ +    MM     x" ;map
    db "~M~~~~~~ Moo++*M+ ++++  M      x" ;map
    db "MMMMMM~M~ o + ##F +  +   MMM   x" ;map
    db "MMMM  +  + +M++  M    +        x" ;map
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

map_11_49fa::
    db $20, $0b
    db "~~~~MMMMMMMMM ~~ MMMM MMM~~    x" ;map
    db " 8 ~MMMMMMM F ~M MMMMM   ~~+P  x" ;map
    db " +  ~~MMMMMM M MMMM  ~~d ++    x" ;map
    db "oo++ ~~~~ MMMM     + +o  + o o x" ;map
    db "oo  ++~~~+  M  + ++ + +++o  o  x" ;map
    db "ooo  + ++ ++ ++ + MM    ##oo # x" ;map
    db "o o   +M MMM+M M MM ~~  o#oo~~ x" ;map
    db "~b o o MMMMMMMMMMM ~~   M# o## x" ;map
    db "~~ oo  MMMM MMM MMM~~M~~~~#oo  x" ;map
    db "~~oMMMMMM ~~~~ ~M~ ~~MMM~~#o + x" ;map
    db "MMMMMMMMMM ~~~~~~ ljkl++++ ++  x" ;map
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

map_11_4bd2::
    db $20, $15
    db "ooo   + ~~MMMMM##~~MMMMMM MMMM x" ;map
    db "ooo++++ ~~MMM #o MMMM    ~M MM x" ;map
    db "oo +   ~~~MMM##MMMM  F ~~~~~~  x" ;map
    db "o  b  ~~~~MM~~#MM      ~~~~~~  x" ;map
    db "o  +  ~~~~ MMM#MM   ooo ~~~    x" ;map
    db "o +   ~~M MMM~~MMM ooooo       x" ;map
    db "  ++   ~~ MMM~~MM   ooooo~     x" ;map
    db " 8  +  ~  MMMM~      ooo~~     x" ;map
    db "    ++    MMM F ##MM ~~~M~~  + x" ;map
    db " ~~~~+~~     M   #MMM~~~~   +  x" ;map
    db "~~~M~+~~   M    ~ MM ~~MMM ++  x" ;map
    db "~ ~MMM+~~  MMM    M  ~~ MMM+   f" ;map
    db "~~ MM +  M  MMMF      ~~~ ~+   k" ;map
    db "~~   ~+ M MM     MM     ~~~+   o" ;map
    db "MM F~~+ M~MM MMMMMMM     + +   q" ;map
    db "M     + ~  MMMMMMMM     + + +  x" ;map
    db "MM   ++ ~~ MM M#MM #       ++  x" ;map
    db "M  ++   ~~ MM~o#MM  #    + d   x" ;map
    db "M  +   ~~~MM~#~MMMM~## ++ +    x" ;map
    db "MM + ~ ~~~MM~~#MMM ~~#+ P    M x" ;map
    db " # P    M # P    M+ MMzv#MM #  x" ;map
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

map_11_4f14::
    db $20, $15
    db "ooo o  MM M MM~~o oo MMMM MMM  x" ;map
    db "o b~++++ +++M+++       +++M    x" ;map
    db "o~+~~8 M+  ~+~ ~++++ ++ ##+ F  x" ;map
    db "~~++   MMM ~~~~o~~~~+~~~~#++   x" ;map
    db "~ + ++ MM ~ ooo ooooF~~~~ #+++ x" ;map
    db "oo++MM++ +++ +++ +++ ooo~+#+ + x" ;map
    db "ooo+M~~~+ M++o M+MMM++M++ +M~+ x" ;map
    db "oo +MM~ ~~ +MMMMMMMMM++ ~~  +~ x" ;map
    db "o++~MMMM~~~+MMM MMMMMM++~~~ +~ x" ;map
    db " +~~MMM ~ ~+ ~~~M oMM  +~~~ ++ x" ;map
    db "M+~~M      +~F~~~~~~M  +~MMM + x" ;map
    db " +   M   ++M~ ~~~F~   +  MM  + f" ;map
    db "o+ ~MMMM + MMMMM   MMM+d MM  + k" ;map
    db "o+~~~oM  + MMMMMMMMMM +  MM++o o" ;map
    db "o+~~~o ~~+  MMMMMMMMM +M   + o q" ;map
    db "o~+oooF~~+ ~~MMMM    ++MMM +   x" ;map
    db "  + oM  +o++~~M ~~ +++ MM  +P  x" ;map
    db " ++++++++ oo~o ooo  ~~+o  M+   x" ;map
    db " +M+ + +o+o+o+o+o+ +~+++o++  M x" ;map
    db "~ + + + + + + + + + + + +    M x" ;map
    db " ~ ~ ~ ~ ~~+o+o+o+o+ +~+++ou~+ x" ;map
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

map_11_525f::
    db $20, $15
    db "MMMMMMMMMMMMMMMMMMMMMM  # #M#M x" ;map
    db "MM o MMMM MMMMM   MMMMM MM#  M x" ;map
    db "MM~~ooM~ ~MMM~  d ~MMM  MMMMMM x" ;map
    db "MM~~oo M~~MM~~   ~MMMMM MMMMMM x" ;map
    db " MMF   MMMMM ~P  ~MMMM MMMM  M x" ;map
    db "# MM   oMMMMM +  ~M MMMMM oo M x" ;map
    db "##MM   oMMMMMM++  ~MMMM  ooo~~ x" ;map
    db " # MM  ooo MMMMo+ ooMo ooo~F~~ x" ;map
    db "  # MM    ooM  o+oooooo~o# +   x" ;map
    db "MM## ##   oooooo+~o~o~~   #+~~ x" ;map
    db "M oo#         ~~~~~~~~~  +*~~~ x" ;map
    db "M    o          ~   ~    +##~# f" ;map
    db "MMM~~~oo     o o         + # # k" ;map
    db "M ~~~o~ooo   ooo     MMM +  #o o" ;map
    db "M ~~ooo o   oooo oo MMM~~+  #  q" ;map
    db "   +        oMooooooMMM +   F  x" ;map
    db "MM+ ++    ooMMMMooooM  +++ ++M x" ;map
    db "M b   ++oooo MMM ooo   +  +F M x" ;map
    db "M  M 8  ++o  MM~MMoo ++      M x" ;map
    db "M         ++ MM M  ++~ o     M x" ;map
    db "o o o                    8     x" ;map
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

map_11_559b::
    db $20, $15
    db "MM~+++++##    ~~~~~~~MM MMMMM  x" ;map
    db "M +    8 # +++ o o~+++    M  + x" ;map
    db "  +  MM+  #+o+ ooo+   ++o++F + x" ;map
    db "o b~~M~+ +*ooo++o +~ M ++ ~  + x" ;map
    db "oo o~~  +~oooo  +++MMMM+~~~~+  x" ;map
    db "M oooo~~~oo  M  + ~MMM + M~ +  x" ;map
    db "MM  ooooooo MMMM+o~ MM + MM ++ x" ;map
    db "M ooo~o~o ooMMM +  MMM + MMM + x" ;map
    db "MMo  M~~~ o MMM + MMMM + MM  + x" ;map
    db "MMM MMMM~MMMMMM + MMMMM+MMM o+ x" ;map
    db "MM ~MMMMMMMMM   +o  M  +MMMM + x" ;map
    db "MM  MMMMMMM+ +  +  F  + MMMMM+ f" ;map
    db "MMMM MMMM + + +++  +  + M    + k" ;map
    db "MMM   M   +   ++   +++++ +++   o" ;map
    db "M        ++     +  + Mo +~~+P  q" ;map
    db " ++++++++       +++ooooooo~+ ~ x" ;map
    db " +              + Moooooo+o +~ x" ;map
    db "ooF  ~     ooo  ++o+o+o++ ++++ x" ;map
    db "oo  ~~~ oo ooo   o+ +~+ d ++ + x" ;map
    db "ooo ~~~ ooooooo  ooo~~~     +  x" ;map
    db "+o+     +  + Mo +~~+z~+ d o+   x" ;map
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

map_11_58e6::
    db $20, $15
    db "MMMMMMMMM oMMMM MMMMMMM MMMMMM x" ;map
    db "MMM   M ooooM  ~M  MM    ~ MMM x" ;map
    db "MMM 8   o oo ~o ~ ~~    ~~~  M x" ;map
    db "MMMM   ~~~o   ~~   ~~~  ~    M x" ;map
    db "MMM  b ~~~    ~~     M  F    M x" ;map
    db "M ~~    ~~    ##   MM  M   ~MM x" ;map
    db "MM~~ M      ~  #   M   MM o MM x" ;map
    db "M ~ MMMM~  o o  #   M    ~~  M x" ;map
    db "M   MMMM  ooMoMM#M~~M    ~~MMM x" ;map
    db "MM  MM MM   ooMMMM~~      ~MMM x" ;map
    db "MMoMMMMM M  ooMMM ~~oo  ~  MM  x" ;map
    db "MMMMMMMMMMMM  ## F~~o ~~       f" ;map
    db "MMMMMMM MMM    #  ~~  ~~~~     k" ;map
    db "MMM    ~M  MMM  ooo~~~ M~      o" ;map
    db "MM  ~~  ~ MMMM  o  ~~~MMMM~~   q" ;map
    db "M~~ ~~o   MMM~      ~~MMM ~~P  x" ;map
    db "M ~ ~ M   M  ~~  ~ M     ~~~   x" ;map
    db "MM        MMMM~~~~      ~~~  ~ x" ;map
    db "M  F   ~~~~~M  ~~o ~~~    d  ~ x" ;map
    db "M ~   ~~~M~~~~ ~~oo~~~~~   M~~ x" ;map
    db "             ~~~      kji~M ~M x" ;map
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

map_11_5c31::
    db $20, $15
    db "~~o       ~       ~~~~~ ooo oo x" ;map
    db "~~ MMMMM MMM MF          M  oo x" ;map
    db "~~MMMMM MMMMMMMMMMMMMM MMMMM   x" ;map
    db "~       M M  MMMMMMMMMMMM MMM  x" ;map
    db "  8  ~        M   MMMM MMMMM   x" ;map
    db " M MMM M MMMMM    MMMMM MMM    x" ;map
    db "MMMMMMMMMMMMMMMM o  MM ~   b   x" ;map
    db "MMM MMMMMMMMMMMMMM  MMMM     o x" ;map
    db "M oo MMMMMM    MMM   MM        x" ;map
    db "M oo  MMM   d   MMMM MM oo MMM x" ;map
    db "MMMM MMM ~     MM  M    oF MMM x" ;map
    db "MMMMMMMM ~~MMM MMMM        MMM f" ;map
    db "MMMMMMMMM~~ MMMMMMM  MMM ~MMM  k" ;map
    db "MM MMMM  F    M M   MMM   MM   o" ;map
    db "M   M            o  MMM   MMMo q" ;map
    db "         M MMMMM    MMMM     o x" ;map
    db "   MMM MMMMMMMMMM MMMMM   ooo  x" ;map
    db "   MMMMMMMMMM M   MMM     oo ~ x" ;map
    db "++ MMMMMM         M   P     ~~ x" ;map
    db "  ++MMM  ~ooF  o   ~ ~   ~~~~~ x" ;map
    db "MMMM     oo MMMMj  M M   MMM   x" ;map
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

map_11_5f7c::
    db $20, $15
    db " MM+~#MMMM M   +~~~~~  # M##MM x" ;map
    db "MM~F~~#MM  MM++M    ~  P MMMMM x" ;map
    db "M  +~ #MMF oM+ MMM       #MMMM x" ;map
    db "MM  ++       +~~MM     ~  #MMM x" ;map
    db "MMM~ +  oo~  +~ MMM   ~~####MM x" ;map
    db "MM ~~ ++o  M + MMM  MM~~#o##   x" ;map
    db "M~~~~ ~~++ MMM+MMMMMMM~~~~o~ + x" ;map
    db "M ~ ~ ~M~+ MM +MMMMM M ~~~~++# x" ;map
    db "++o  MMMMM++  ++MMMMM  M~~~+   x" ;map
    db "  + MMMMMMMM++ + MM  +++   +oo x" ;map
    db " ~+ o MMMMMMM+ +   ++   +++ooo x" ;map
    db "~~+   M  MMM + d ++   oooooooo f" ;map
    db "~+++   + MM + ++  MMooooo o oo k" ;map
    db "~+  b~+ ++ ++   ++M ooooooF oo o" ;map
    db "~+       M+ o MM  ++++  oo ooo q" ;map
    db " +     MMMMM  MMM +   ++oooooo x" ;map
    db "MM++  M MMMMMMM   +  M  ++o o  x" ;map
    db "MM  ++M MMM  MM  ++MMMMM +  o  x" ;map
    db "MMM8 +    M M  o + MMMMMM ++ + x" ;map
    db "MM   + ~~ MMM oo + MM M     +  x" ;map
    db "MMMMM  ++M MMM  MM  ++ MMM  #+ x" ;map
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

map_11_62c1::
    db $20, $15
    db "MM ~~MMMMM  ooo ooo   MMM   M  x" ;map
    db "MMM~~MMMMMMooo P ooo MMMMM~~ + x" ;map
    db "MM ~~MMMMM oo+++++oo MMMM ~++  x" ;map
    db "MMM~~ MMMo ++oo+oo++ MM  ~~+ M x" ;map
    db "MM ~~~~~ ++ ooo+ooo ++ +~++MMM x" ;map
    db "MMMF~~~++  M  o+o    d+ + MMMM x" ;map
    db "M++++++~ MMMMM +MMMMMM ~~ MMMM x" ;map
    db "+ MM ~~~ MMMMMM+MMMMM ~~~ MMMM x" ;map
    db "+ MM ~~~~~MMM  + MM  ~~~MMMMM  x" ;map
    db "ooMMM ~~~~~~ ~ +~~   F~~MMMMM  x" ;map
    db "o MM MMM ~~~~~~+  MMMM  MMMMMo x" ;map
    db " oMMMMMMMM ~~++ ++MMMMM+ MM    f" ;map
    db "o   MMMMMMM++  MMMMMMMM+    oo k" ;map
    db "  ooM MMM  + MMMMMMMM  + oooo  o" ;map
    db "  ooo M   o+ MMMM  o ++  ooo   q" ;map
    db "    o   oo +        +  ooo  o  x" ;map
    db "      o ooo+ o ooo o+  o       x" ;map
    db "           +   oo o +          x" ;map
    db "       8   +        +    b     x" ;map
    db "           +   F    +          x" ;map
    db " + +    b  oo   o              x" ;map
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
