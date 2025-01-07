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

SECTION "ROM Bank $008", ROMX[$4000], BANK[$8]

map_08_4000::
    db $10, $0b
    db "+~~+++++++++++M " ;map
    db "+ +  #  ~  ~  +M" ;map
    db "+++  ~#F ~ ~ o+M" ;map
    db "+   o~## oo   +M" ;map
    db "+   Mo~~#o~ P ++" ;map
    db "+  8  oo##~M  +o" ;map
    db "++++ ~o ~ #   + " ;map
    db "+~M+ o  F #M  + " ;map
    db "+M~+ + +~+#+M+++" ;map
    db "+MM++M+ + + + MM" ;map
    db "+~MM ~M~   M~MM " ;map
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

map_08_40e0::
    db $10, $0b
    db "~~~~++++++++++++" ;map
    db "~~~ +~     F   o" ;map
    db "~~8 ++   ~   ~oo" ;map
    db "~~    ++oo    oo" ;map
    db "MM    M+     ooo" ;map
    db "MMMM   o++    o " ;map
    db "MMMMM oo  ++    " ;map
    db "MMMMMMoooo +++++" ;map
    db "MMMMMM M o +P   " ;map
    db "MMMMMMMMMMo+    " ;map
    db "MMMMMMM~MM M M M" ;map
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

map_08_41c9::
    db $10, $0b
    db "M o    o M  M d " ;map
    db "MMP ~M    M  o M" ;map
    db "MM   MM~  MM   M" ;map
    db "MM MMM M   M M  " ;map
    db "MM  Mo MMM    oo" ;map
    db "M o oo MM  ~~~oo" ;map
    db "  oo      ~~~~  " ;map
    db "MMo  MMMM ~o~ 8 " ;map
    db "MMb MMMM ~ oo  ~" ;map
    db "MM  MMM oo   MMM" ;map
    db "MMM MMM oM~~MMM " ;map
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

map_08_42a6::
    db $10, $0b
    db "MM+MMMM~~MMM +oo" ;map
    db "Mo++~~M~~MMM +o~" ;map
    db "    + ~  MMMM+ ~" ;map
    db "o 8 +     M  +~~" ;map
    db "oo ++M     oo+~~" ;map
    db "oo+ ~M     ++ ~ " ;map
    db "oo+~  M MM + P M" ;map
    db "  +~~~MMM  +   M" ;map
    db "  + ~~MMMMMM++~M" ;map
    db "   M o  MMMM +~M" ;map
    db "MMM M oMMoMMMMM " ;map
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

map_08_4377::
    db $10, $0b
    db "M        8M MM  " ;map
    db "             M M" ;map
    db "M  MMMMM M    M " ;map
    db "   MMMMMMMMM    " ;map
    db "   MMMMMMMMMMMMM" ;map
    db "F   MMMMMMMMMMMM" ;map
    db "      MMMMMMMMMM" ;map
    db "M     M MMM   MM" ;map
    db " M M M  M   P MM" ;map
    db "MMMMMMMM MMMMMMM" ;map
    db "M M M~MMMMMMM M " ;map
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

map_08_445d::
    db $10, $0b
    db "MMMMMM##~~~~~  M" ;map
    db "MMM   ~#~F~~~  M" ;map
    db "M    ~ *++++~~  " ;map
    db "  ~  ++#~   ++  " ;map
    db "   ++~~# ~  ~~+ " ;map
    db "~  +~~~~#~~~~ + " ;map
    db "8  + ~~~##~~  + " ;map
    db " +++ ~   M#+~+++" ;map
    db "+  +~+ +~+*M+P ~" ;map
    db "MMMM+ + +##    ~" ;map
    db "MMMMMM ~ M   ~  " ;map
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

map_08_453d::
    db $10, $0b
    db " 8  MMMMMMMMMMMM" ;map
    db " M  MM  MMMMMMMM" ;map
    db "MMMM   o   MMMMM" ;map
    db "MMMM    o MMMMMM" ;map
    db "MMMMM  MM MMMMMM" ;map
    db "MMMM o MMM  MMMM" ;map
    db "MMMMMoo M o   MM" ;map
    db "MMMM M M      MM" ;map
    db "MMMMMMMMMMM P   " ;map
    db "MMMMMMMMMMMM    " ;map
    db "M MMMMMMMMMM ~ M" ;map
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

map_08_4623::
    db $10, $0b
    db "MMMMM o   ~~MMMM" ;map
    db "MMM     b ~~MMMM" ;map
    db "MMMM  8    o MMM" ;map
    db "MMMM   oo   MMMM" ;map
    db "MMM     o  ~MMMM" ;map
    db "M     ~~ ~~~  MM" ;map
    db " o    ~~~~~o o  " ;map
    db "M  d  ~~~~~     " ;map
    db " P   ~~~~~~   F " ;map
    db "   ~~~~~~~~     " ;map
    db " M M~M~M   ~ ~ M" ;map
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

map_08_470c::
    db $10, $0b
    db "ooo oooMoooo  MM" ;map
    db "oo 8   MMMo~~~MM" ;map
    db "o  + M MMM ~~~MM" ;map
    db "   + MMMMMM ~MMM" ;map
    db "MM +~MMMoo   MMM" ;map
    db "M  +~MMoo      M" ;map
    db " ++MM#   +++    " ;map
    db " + M~~#++   +P  " ;map
    db " + +~+*   MM   o" ;map
    db "o++ +~##  MMMMoo" ;map
    db "oMoM~ ~~ MM MMoM" ;map
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

map_08_47ef::
    db $10, $0b
    db "M MMMMMMoo oo~~ " ;map
    db "MM8~ MM~~oooF ~M" ;map
    db "MM    M ~~     M" ;map
    db "MM     ~~~~~    " ;map
    db "MMMM ~ ~~~~~~   " ;map
    db "MMMM   ~~~~~~~~ " ;map
    db "MMMM M  ~~~~~~  " ;map
    db "MMMMMMMM o~~~   " ;map
    db "MMMMMMMM  ~ P  ~" ;map
    db "MMMMMMMooo   MMM" ;map
    db "M~MMMMMMo ~MMMM " ;map
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

map_08_48d5::
    db $10, $16
    db "MMMMM  P ~~~MM ~" ;map
    db "MMM    + ~~~MMM " ;map
    db "M      +MM M    " ;map
    db "     d +MMMMMM M" ;map
    db " M M   +   MMM M" ;map
    db " MMMM M+MMMMMMM " ;map
    db "  MMMM +MMM M   " ;map
    db "  MMMMM+       o" ;map
    db "  M M  + + +F+ +" ;map
    db "M      ++ +M+ + " ;map
    db " M   M + MMM M  " ;map
    db " MMMMMM+MMMMMMMM" ;map
    db "  MMMM +MMMMMMMM" ;map
    db "~MMMMMM+MMMMMMMM" ;map
    db " MMMM  +  M  MMM" ;map
    db "  MM b +~M      " ;map
    db "MMMMM  + MMM    " ;map
    db "MMM    8  M    M" ;map
    db "M   M        MMM" ;map
    db "            MMMM" ;map
    db "            MMMM" ;map
    db "   M M M   oMMMo" ;map
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

map_08_4a71::
    db $10, $16
    db "~~~    ~~~~~MM~ " ;map
    db "   8   o~~~~ M o" ;map
    db "       ~~~~~ M  " ;map
    db "     ~~~o M   M " ;map
    db "      ~~~~    MM" ;map
    db "       ~~~~     " ;map
    db "     o  ~~~~    " ;map
    db "      M    F    " ;map
    db " ~~~   oo    ~  " ;map
    db "  ~    oo  o~~~ " ;map
    db "MM   o ~   oo~~ " ;map
    db "MMMM~~~~~       " ;map
    db "MMMM ~~~~    ~~~" ;map
    db "MMMMM~~~    ~~~~" ;map
    db "~ MMMM     ~~~~~" ;map
    db " F MMMMM    ~~  " ;map
    db "   MM MMM P     " ;map
    db "MMMMM  MMM      " ;map
    db "MMMMMM MM   oo  " ;map
    db "MMMMM ~MMM  o   " ;map
    db "M MMM MMMMM     " ;map
    db " MMMMMMMMMMM M M" ;map
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

map_08_4c37::
    db $10, $16
    db "~Moooo   ~~~~MMM" ;map
    db "~ Moo  P  ~~ MMM" ;map
    db "##M~   +   ~~MMM" ;map
    db "~~#~o  +   ~~~MM" ;map
    db "  ##  + M   F~~M" ;map
    db "  ~#  + M MM  ~M" ;map
    db "   ~  +F MMM  ~ " ;map
    db " ~~~  ++++MMM+ M" ;map
    db " d ~ ++  ++++ MM" ;map
    db "   ++oo  +~   MM" ;map
    db "   +o o  +~   MM" ;map
    db "   +oo b +      " ;map
    db " ++#o     ++    " ;map
    db "    #o    M+    " ;map
    db "M  ~##o## M+   M" ;map
    db "   ~~~#  M+  MMM" ;map
    db "MM M~~    + ~MMM" ;map
    db "MMMMM  8  +~~ MM" ;map
    db "MMMMMoo    ~~~ M" ;map
    db "M oooooooo ~~   " ;map
    db " ooooooooooo~o  " ;map
    db "oMo o o oMo~o oM" ;map
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

map_08_4de8::
    db $10, $16
    db " 8 MMMMMMMMMMMMM" ;map
    db " +    MMMMMMMMMM" ;map
    db " + + +  MMMMMMMM" ;map
    db "MM+~+M+ MMM   MM" ;map
    db "MMMMo+++++++++MM" ;map
    db "MMM  + MMM F +MM" ;map
    db "   ++MMMMMMM + M" ;map
    db " ++MMMMMMMM  +o " ;map
    db "+F MMMMMMMM~~M+ " ;map
    db "+o MMMMMMM~###+ " ;map
    db "++ooMMMMM~M~~*+~" ;map
    db " +ooMMMMM ~~+#~#" ;map
    db "* ++  MMMM  +~#~" ;map
    db "#M  ++ MMMMM+ ##" ;map
    db "MMMM M+ MMM +   " ;map
    db "MMMMM +  + +++ +" ;map
    db "MMMMMMd + +   + " ;map
    db "MMMMMM MMMMMP   " ;map
    db "MMMMMMMMMMMM M  " ;map
    db "MMMMM MMMMMMMMMM" ;map
    db "MMMMMMMMMMMMMMMM" ;map
    db "MMMMMMMMM M MMMM" ;map
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

map_08_4f96::
    db $10, $16
    db "    MMMMM    8  " ;map
    db "MM MMMMMM    ~  " ;map
    db "MMMMMMM o    ~~~" ;map
    db "MMMMMM      ~ ~~" ;map
    db "MMMMMM  oo  b ~ " ;map
    db "MMMMM   o       " ;map
    db "MMMMMM    ~   ~~" ;map
    db "MMMMM           " ;map
    db "MMMMM ~~        " ;map
    db "MMMMM~~~~       " ;map
    db "MMMM  ~~~~~  ~~~" ;map
    db "MMMMM  ~~~F  ~~~" ;map
    db "MMM       ~ ~~~ " ;map
    db "M           ~  M" ;map
    db "     d oo    MMM" ;map
    db "o       o   MMMM" ;map
    db " ~       ~  MMM " ;map
    db "   P      MMMMMM" ;map
    db "MM       oMMMMMM" ;map
    db "MMMM      MMMMMM" ;map
    db "MMMMM ~   MMMMMM" ;map
    db "M MMM~ M MM MMMM" ;map
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

map_08_5159::
    db $10, $16
    db "    MMMMM       " ;map
    db " d   MMM    b   " ;map
    db " +   MMMMM  +~~~" ;map
    db " +  MMMMMMM +~~~" ;map
    db "  + MMM MMM + ~M" ;map
    db "  +  MMMM   + MM" ;map
    db "  +  MMMM ~~+ MM" ;map
    db "  + MMMMMM~~+  M" ;map
    db "  ++MMMMMM ++  M" ;map
    db "    + MMMM+  MMM" ;map
    db "MM  + MMM +MMMMM" ;map
    db "MMM+++    +MMMMM" ;map
    db "M  + M++  + MMMM" ;map
    db " M + MMM++++  MM" ;map
    db "   + MMM    ++  " ;map
    db "M +   MMMM   +  " ;map
    db "  +  MMMMMMM +  " ;map
    db "  +  MMMMMMM P  " ;map
    db "  8  MMMMMMM    " ;map
    db "      MMMMM     " ;map
    db "      MMMMM     " ;map
    db " M M MM MMMM M  " ;map
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

map_08_5337::
    db $10, $16
    db "MMM  oo~~~~~ ~oo" ;map
    db "MMMM      ~   o " ;map
    db "MMM  M  P    ~~~" ;map
    db "             ~~~" ;map
    db " d          ~M~~" ;map
    db "         M   MM " ;map
    db "       MM  o MMM" ;map
    db "       MM oo  MM" ;map
    db "    MM        MM" ;map
    db "o   MMM         " ;map
    db "oooo    F       " ;map
    db "o ## ##~ ~~~  MM" ;map
    db "MM~~#M ~~MM ~~MM" ;map
    db "MM ~##M  MM ~~MM" ;map
    db "M ~~~#M       ~o" ;map
    db "M ~  MMM       o" ;map
    db "M 8   M     b oo" ;map
    db "M            ooo" ;map
    db "MM         MMMMM" ;map
    db "MMMMMM    MMMMMM" ;map
    db "MMMMMM o oMMMMMM" ;map
    db "MMMMMMMMo M~MMMM" ;map
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

map_08_54d6::
    db $10, $16
    db " b        MMMMMM" ;map
    db "       ~    MMMM" ;map
    db "      ~~    MMMM" ;map
    db "MMMM  ~    P  MM" ;map
    db "MMMMMMMM      MM" ;map
    db "MMMMMMMMMM MMMMM" ;map
    db "MMMMMMMMM  MMMMM" ;map
    db "MMMMMMM M  MMMMM" ;map
    db "MMMMM      MMMMM" ;map
    db "MMM   ~~    MMMM" ;map
    db "MM    ~       MM" ;map
    db "MM        F   MM" ;map
    db "MMM  MMM       M" ;map
    db "MM   MMMMM   M M" ;map
    db "M    MMMMMMMMMMM" ;map
    db "    M MMMMMMMMMM" ;map
    db "       MMMMMMMMM" ;map
    db "M       MMMMMMMM" ;map
    db " 8       MMMMMMM" ;map
    db "     M M MMMMMMM" ;map
    db "MMMMMMMMMMMMMMMM" ;map
    db "MMMMMMM M MMMMMM" ;map
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

map_08_5681::
    db $10, $16
    db "MMMMMM++    MMM " ;map
    db "MMMMMMMM++ P oM " ;map
    db "MMMMMMMM  ++ +  " ;map
    db "MMMMMMMMM  ++ + " ;map
    db "MMMMMMMM   +~oo " ;map
    db "MMMMMM M   + oo " ;map
    db "MMMMMM  ##o+  o " ;map
    db "  MMMo + # +F o " ;map
    db "++   ++ +# + ~o " ;map
    db " ++++M  ## + ~~ " ;map
    db "~+~~ MMM  ~+F~~ " ;map
    db " +~~~MMM   +~~~ " ;map
    db "o+~~~MMMMM +~~~ " ;map
    db " +~~MMMMMM +F~~ " ;map
    db "~+ ~MMMMMMM+ o~ " ;map
    db "o+  MMMMMM +    " ;map
    db "+ ++  M  +o+F   " ;map
    db "+8  +++++~++    " ;map
    db "+    M    + ++~ " ;map
    db "+MMMMMMM  +   + " ;map
    db "+MMMMMMMMM+     " ;map
    db "+MM MMM~M++o M M" ;map
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

map_08_5823::
    db $10, $16
    db "MMM M         MM" ;map
    db "MM     + + F  MM" ;map
    db "MM   ++M+ +  MMM" ;map
    db "M~~~+MMMMM ~ MMM" ;map
    db "M~~~+MMMMM ~~   " ;map
    db "M ~~+~MMMMM~~~~~" ;map
    db " d  +~~ MM    ~ " ;map
    db "    +   MMMM    " ;map
    db "o   + MM MMM    " ;map
    db "oo  + MM MMM P  " ;map
    db "oo  ++M  MMM    " ;map
    db "MooM  ++  MMMMMM" ;map
    db "MMMMMM~~+~MMMMMM" ;map
    db "MMMMMMMM+~MMMMMM" ;map
    db "MMMMMMM + MMM MM" ;map
    db "MM  M  +++    MM" ;map
    db "MM ++++M  +b  MM" ;map
    db "M  8  MMM     MM" ;map
    db " ~    MMMM   M M" ;map
    db "oo~  M MMMMMMMMM" ;map
    db "ooooMMMMMMMMMMMM" ;map
    db "oMooMMMMMMM~MMMM" ;map
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

map_08_59ec::
    db $20, $0b
    db "oooo   oo~~~~~oo +++++++++  M MM" ;map
    db " ~o~    o ~~~~ P    ~oo~  ++  MM" ;map
    db " ~~~ F    Mo~~~  MMM ~~~F   ++  " ;map
    db "  ~      M M~M MMMMMMMoM   ~  ++" ;map
    db "     o MMMMMMMMMMMMMMMMMMM~~~o  " ;map
    db "++   ooMMMMMMMMMM MMMMMMMM ~~~ ~" ;map
    db " o++  o  MMMMMM     MMM M ~o~~~ " ;map
    db "M   ++ M MM    8    M    ~~~~~o " ;map
    db "MMMM  ++ + + +       ~   o o~~oo" ;map
    db "MMMMMM  + + + +    ~~~~~ooo   oo" ;map
    db "MMMMM M  M   ~ M ~ M~+~~oMo o ~M" ;map
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

map_08_5ba9::
    db $20, $0b
    db "MMMMMMM~M~~~ooM    ~~MMMM F  ++M" ;map
    db "MMMMM    +++++o M ~  MMMMM ++   " ;map
    db "M M    ++ ~ooo++++    MMMM+ 8  M" ;map
    db "     ++ MM ooMMM  +  o M  +o MMM" ;map
    db "P oo+   MMMooMMMMMd  ooMM~+ MMMM" ;map
    db " ooo+MMMMM    MMMM M  o~  + MMMM" ;map
    db "  o~+MMMMMb  MMMMMMMMM ~~++~MMMM" ;map
    db "d o +MMMM  + MMMMMMMM  ++M MMMMM" ;map
    db "+++++MMMMM+ ++ + +M+ ++Mo MMMMMM" ;map
    db "MM MMMMMMMMM  +o+o+ + MMMMMMMMMM" ;map
    db "MMMMM M MMM~MMoMo~oM MMoMMM MMM~" ;map
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

map_08_5d69::
    db $20, $0b
    db "~~MMM   ~    M       MMMM MMMMM " ;map
    db "~ ~    +   ~MMMMF~   MMM  MMM   " ;map
    db "  8  M M+  ~MMMMM~~~MMM~ +      " ;map
    db "MM   MMM++    MM~~~ MMM +~   P  " ;map
    db "MMMM    M+++  M ~   M  +++      " ;map
    db "MMMMM    +  +#      ##+   +     " ;map
    db "MMMMMMb  +  +~#      *+  d      " ;map
    db "M MMMM M  + +~##    +#     M M M" ;map
    db " ~~MMMMMMMM ++~#   ++ # MM MMMMM" ;map
    db "~~~~M MMMMM     F     ##M   MMMM" ;map
    db "~M~M    MM M M M   M M   M MMMMM" ;map
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

map_08_5f2f::
    db $20, $0b
    db "~~~#~ ####    ~~ M ~~ MMM~o oooo" ;map
    db "M  ~## ~~#  F MMMMMM~~   ~~     " ;map
    db "MM~~ # ~~#oo  MMMMMM ~~~~  P MMM" ;map
    db "MM M~ ~~  #o  MMM MMMMM  +   MMM" ;map
    db "MMMM  ~   #oo    ~  MMM +    MMM" ;map
    db "MMM 8 ++++++o  o o o   ++  MMMMM" ;map
    db "M         M ++ +oood ++    MMMMM" ;map
    db "~~MMM  ob   ~~+~++   + M   MM oo" ;map
    db "~~MMM~ ooooM~o~~~~+++ ~    o ooo" ;map
    db "MM   ~~MMMMMMMoo ~~~~~  MMMM ooo" ;map
    db "MM M~MM~MMMMM~o oM~M~M M MM o oM" ;map
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

map_08_60ec::
    db $20, $0b
    db "MMooo MMM MMMMMM~~~~~ MMMoooMMMM" ;map
    db "ooooo~ MMM MMMMM +++d  ooooooMMM" ;map
    db "oo~ ~~~ M ~~  M  M  ++  ~ oMMMMM" ;map
    db "MMo  8 ~ ~~  ~ MMM M M+   oMM MM" ;map
    db "MMM ~+~~        M M+++++  ooo  M" ;map
    db "MM~~ + + + + + + ++  ~~~++oP   M" ;map
    db "M ~~~~+ +M+ + + +  ~~~~ ~+~~  MM" ;map
    db "MM~~~~~ MMMM  F M  ~MM M  +MMM  " ;map
    db "oM  ~ ~ MMMM      ~ ~MMM F MMM  " ;map
    db "ooMooo MMMMMM~~~ oooo M    oMMM " ;map
    db "oMoMoMoMM MM M~M~ oMoM  o~o M  M" ;map
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

map_08_62be::
    db $20, $0b
    db "               F                " ;map
    db "             ~                  " ;map
    db "     M        ~       MM        " ;map
    db "              ~~~               " ;map
    db " 8     ~ b    ~~~            P  " ;map
    db "       ~      ~~~   d           " ;map
    db "              ~~~               " ;map
    db "                ~               " ;map
    db "MM              ~               " ;map
    db "MMMMMM M  M   F ~  M            " ;map
    db "MMM+MPM Mo o M M   M M   M M M  " ;map
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

map_08_649c::
    db $20, $0b
    db "          MMMMMMMMM       oooo  " ;map
    db "   b ~      MMMMM           oo  " ;map
    db " +  ~M    ~~MMMM ~~   MM        " ;map
    db "+ ++       ~~MMMM~              " ;map
    db " 8 ++  ~ F  ~MMM ~~          P  " ;map
    db "    ++ ~      MM ~  F    +++++  " ;map
    db "      ++++++ MMM    +   +     + " ;map
    db "           ~~MMM +++++++++  oo  " ;map
    db "MM         ~~~MMM~~       d o   " ;map
    db "MMMMMM M  M ~MMM ~ M            " ;map
    db "MMMMMMMMMM ~MMMMM  M M   M M M M" ;map
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

map_08_668c::
    db $20, $0b
    db "o       MMM~o ooooMMM~o~~~~MM MM" ;map
    db "oob   ~ MMM~~        ~~  ~~   M " ;map
    db "         M~~~       ~  M ~  P  o" ;map
    db "MM           ~~~~M     MMM      " ;map
    db "MM   MM    ~ ~~MMM     MMM      " ;map
    db "MM   MM  M~~F~~MMM      MMM     " ;map
    db "M        MMM MM M    F  MMMM d  " ;map
    db "M 8      MMM ~M         MMM     " ;map
    db "       o oM ~~~    M    MMMM   o" ;map
    db "oo     ooooooo~~   MMM  M MMMMoo" ;map
    db "oMoM MoM MoMoMoM + MM M  MM+MMoM" ;map
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

map_08_6834::
    db $20, $0b
    db "MMMM ~~~~oooooooo  F  MMMMMMMMMM" ;map
    db "MMM         o          MMMM MMMM" ;map
    db "    M  8         M M MMMMM P  MM" ;map
    db "    MM +   MMM  MMMMMMMMMM +  MM" ;map
    db " b     +   MMM  MMMMMMMMM  +   o" ;map
    db "       +    M   MMMMM~MMM  +   o" ;map
    db " M     +         MM  ~~~   +  oo" ;map
    db "MMMo o  +++++++++++++++++++  ooo" ;map
    db "MMMMoooo     ~~~      d      MMM" ;map
    db "M MMM oooooo~ ~~~~       ooo MMM" ;map
    db " MMMM oMo oM M M~~ M M  o oooMM " ;map
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

map_08_69fd::
    db $20, $0b
    db "MMMMMM 8  MM oooooo   # ~~#  MM " ;map
    db "MMMMM  +  MMM  oo        ~#   M " ;map
    db "MMMMM  +  M  ~     M   M    d M " ;map
    db "MMMMM ~~++~~~M   MMMMM MMM  +   " ;map
    db "  MMMM~ ~ +~~MMMMMMMMM MM~~~+   " ;map
    db " b  MMMMM + ~ MMMMM MMMMM~~~+   " ;map
    db " +  MMM  ++   MMMM F~~M  ~~+P   " ;map
    db " +  M  ++    MMMMM +~~   ++M    " ;map
    db "+ ++ ++     MMMMM  +   ++MMMM   " ;map
    db "oo  +  o    MMMM    +++  MMMMM  " ;map
    db "oMoM MoM M MMMM MM M+M ~ MM M  M" ;map
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

map_08_6bab::
    db $20, $16
    db "~ o  MMMMMMM o  MMMMMMMMMMM+ MMM" ;map
    db "M  ~ MMMMMM  oo MMMMMMM MMM+   M" ;map
    db "Mb  MMMMM    ~o   MMM      +P MM" ;map
    db "    MMMMMMM ~F  M MMM d o  +  MM" ;map
    db " +++MMMMMM     +  MMMMMM MMM++  " ;map
    db "Moo+ MMMMM    ~ ++ MMMMMMMM~~+  " ;map
    db " oo+ MMMMM   M   +  MMMMMMM ~+  " ;map
    db "oo+MMMMMM    MMo +  ooMMM  ++~~ " ;map
    db "o~+ MMMMM  MMMM~ ~~~ooooM~~F~~MM" ;map
    db "  +~MMM    MMMMMo~~oooo oo+ ~~MM" ;map
    db " o+~~~ ~    M o ~~~~oo## ++MMMMM" ;map
    db " +++~+        F ~+~~~~ *+o MMMMM" ;map
    db "+  M+ ++   ~##  + ~~~++#   MMMMM" ;map
    db " ~MMMM  ++++ *+++++++  #~  MMMMM" ;map
    db "~~MMMMM ~  ++#       ~~~~MMMMMMM" ;map
    db "~8  M ~~   +oo   Mo  ~~  MMMMMMM" ;map
    db "   ~ ~~~~  + ooMMMMMo ~MMMMMMMMM" ;map
    db "++ ~~~~~~++ ++ MMMMM ~ MMMMMMMMM" ;map
    db "~ ++~+~++   ~ ++MMMoo MMMMMMMMMM" ;map
    db "    + +        +      MMMMMMMMMM" ;map
    db "               +      MMMMMMMMMM" ;map
    db " M o M M M M M M M ~ MM+MMMMM+MM" ;map
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

map_08_6f16::
    db $20, $16
    db "MMMMM~~MMMMMMoooooooooooo ~#~+~ " ;map
    db "MMMMM~~~ ~MM~oo o    MooMM~~#+~ " ;map
    db "MMMM ~~ ~~~M oo   F  MMMMMM~#+  " ;map
    db "MMM     ~~~~M oo        M    +  " ;map
    db "ooo       ~~MMM~ ~     + + + +  " ;map
    db "oo~~ ~ #      ~ ~ ~~~++ + + + + " ;map
    db "oo~F ~~~##      ooo++MMM        " ;map
    db "oo o~ ~###    d o +~~MMMM  ~P   " ;map
    db " ooo      #+++++++++~MM  ~~~~MM " ;map
    db "## oo    +*o~o MMM~ ++    ~ MMM " ;map
    db "##oo   ++ ##oooMMMM + ++    MMM " ;map
    db "o+ + + +   #~ oMMMMM+~##++  M M " ;map
    db "+ + + + ++      MMM + ~#  ++    " ;map
    db "ooo      +++  b  MM + ~~#   ++~ " ;map
    db "o        +  ++  MMM +   #~ ~ ~+ " ;map
    db "o      M +   ~++M MM+ ###~~F oo " ;map
    db "o 8  MMMM+ ~~M  ++M +  #   ~~oo " ;map
    db "++   MMM~+~~~MMM  +++ #MMM o~oo " ;map
    db "oo++  MM + MMMM  o oooMMMMMMooo " ;map
    db "ooo ++ ~M+ MMMM ooooooMMMMMMooo " ;map
    db "      ++~+ MMMMMoooooMMMMMMM oo " ;map
    db " ~ M   M+o MMMMMoMo oMM~MMMM ~oM" ;map
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

map_08_7281::
    db $20, $16
    db "oooo#+o+    ooo ~~~+ +ooooo~ooo " ;map
    db "oo +* +M++++ o ++++~+~+o#~~#ooo " ;map
    db "o++ ## MMM +   +   ~~~+ ### o   " ;map
    db "o+ ### MMMM+   +  ~~~~++ # M~   " ;map
    db "o+    #  ++ +++ oM  ~~~+ # MM~~ " ;map
    db " o++++#  + o M MMMMM~~M+      ~ " ;map
    db "o~+   +++  ooMMMMMM   + +   ~ M " ;map
    db " ~+ F +   oooMMMMM   ~+ +~P ~~M " ;map
    db "~++~  +    MMMMMM ~+ ~+~+~~~~MM " ;map
    db "~+~~~+++  MMMMMM F~~+ +~+~~MMoM " ;map
    db "  +~+oo + MMMMMM  ~~+++~+  Mooo " ;map
    db "  +++ooo+ MMMMMMMM  ~#  +     o " ;map
    db "M~M o~o ++MMMMMMMMMM  #++   F o " ;map
    db "MM M~MM~~~++  M MMMM  #+     Mo " ;map
    db "MMMMM  ~~ +o++  MMMMMM +   MMMM " ;map
    db "MMMM ++b ++MMMF MMMMMMM+  MMMMM " ;map
    db "MM   +  ~MMMMMMMMMMMM  +  M MMM " ;map
    db "M  ++   MMMMMMMMMMM~ ~+ ++ d MM " ;map
    db "   8  ##MMMMMMMMMM~+~++   +  MM " ;map
    db "       # MMMMMMMM   +        MM " ;map
    db "       # MMMMMMM       MMM MMMM " ;map
    db " M M  #~ MM M~MM   M MM MMMoM MM" ;map
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

map_08_75ec::
    db $20, $16
    db "MMMMMMM MMMMMMMMMMMMMMMMMMMMMMMM" ;map
    db "MMMMM  ~  MMMMMMMMMMMMMMMMMMMMMM" ;map
    db "MMM    ~~ MMMMM MMM   MMMMMMMMMM" ;map
    db "MM  oo  ~MMMM        ~  MMM MMMM" ;map
    db "MM  o b  MM  MMM   P ~~~     MMM" ;map
    db "MM b         MMMMM   ~~~  d  MMM" ;map
    db "MMM  oo o   M MMMM    ~      MMM" ;map
    db "MM    o MMMMMMMMMMMM M     MMMMM" ;map
    db "MMMM MM MMMMMMMMMMMMMMM MMMMMMMM" ;map
    db "MMM  MMMMMMMMMMMMMMMMMM  MMMMMMM" ;map
    db "MM oMMM   M  MMMMMMMMMM  MMMMMMM" ;map
    db "MMM MMM~~~   MMMMMM M     MMMMMM" ;map
    db "M      ~~~d   MMM  ~~~ o   oMMMM" ;map
    db "MM      ~    M   ~~~~ oo     MMM" ;map
    db "M    MMM o ~~MMM  ~~~~o oo8  MMM" ;map
    db "M d  MMMMM ~~~MMMM  ~~ Mo  o MMM" ;map
    db "MM M MMMMMM ~ MMMMMMMMMMMM   MMM" ;map
    db "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM" ;map
    db "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM" ;map
    db "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM" ;map
    db "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM" ;map
    db "MMM MMM MMMMMMMMM~MMMMM#MMMoMMMM" ;map
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

map_08_7954::
    db $20, $16
    db "MMMMMMMMM oMMMMMMMMMMMM MMMMMM  " ;map
    db "MMM   M oooMMMM M  MM    ~ MMMM " ;map
    db "MMM 8   o ooMMM ~F~~    ~~~  MM " ;map
    db "MMMM+  ~~~oMMMMM +~~~~  ~    MM " ;map
    db "MMM ++ ~~~ MMMMM+ +  M       MM " ;map
    db "M ~~  + ~~ MMMMMM +MM  M   ~MM~ " ;map
    db "MM~~  +     MMMMM +M   MM o MMM " ;map
    db "M ~   + ~  o MMMM + M    ~~  MM " ;map
    db "M     +M  oo MMMMM+~M    ~~MMMM " ;map
    db "MM    +MM   MMMMM~+~      ~MMMM " ;map
    db "MMo   +   F MMMMM ++oo  ~  MM M " ;map
    db "MMMM  +   + M MMM  +o ~~      M " ;map
    db "MMM   +  +++  MMM  +  ~~~~      " ;map
    db "MMM  ++++  M++  o o+~~  ~     M " ;map
    db "MM  +~~M~  MM ++   +~~    ~~P   " ;map
    db "M~~ +~~M        ++ +~+ + +~+ +  " ;map
    db "M ~++ M      M   ~+M+d+ +~+~+ + " ;map
    db "MM b         MMM~~      ~~~  ~~ " ;map
    db "M      ~~~~~ MMMMM ~~~       ~~ " ;map
    db "M ~   ~~~M~MMMMMMMM ~~~~   M~~~ " ;map
    db "MMMM  ~~MMMMMMMMMMM ~~~MMMMMMMM " ;map
    db "MMM M ~MMMM~MMMMM MM~MMMMMMMM MM" ;map
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

map_08_7c8f::
    db $20, $16
    db "MMM  b  MMMMMM~    M       M    " ;map
    db "M       M M M        d      MMMM" ;map
    db "     M          MM          MMMM" ;map
    db "  ~~MMMM        MM      MM  MMMM" ;map
    db "  ~~ MMM        MM   M  MM    M " ;map
    db "  ~M~~M M  M    MM           d  " ;map
    db "MMM ~      M             ~      " ;map
    db "MMM  M    MMMM    M     ~~  M   " ;map
    db "MM   MM    MMM         M    M   " ;map
    db "MM    M     M   M      MM    M  " ;map
    db "M     M       F   MM    M    MMM" ;map
    db "         M M      MM     ~   MMM" ;map
    db " MM MM   MMMMM    M     ~~    MM" ;map
    db "    MM   MMMM~~    M   M~       " ;map
    db "          MMM ~  M          P   " ;map
    db "  8    M      ~M                " ;map
    db "      MMM    F~~M     MM   M    " ;map
    db "     MMMM~~   ~ MM    MM  M  M  " ;map
    db "MMMMMMMM~~~MM   MM    MM   MMMMM" ;map
    db "MMMMMMMM  M       M MMMM   MMMMM" ;map
    db "MMMMMMMMMM         MMMMMMM MMMMM" ;map
    db "M M MbM M MM M M #MMMMMPMMM MPMM" ;map
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
