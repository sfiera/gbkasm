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

SECTION "ROM Bank $009", ROMX[$4000], BANK[$9]

map_09_4000::
    db $20, $16
    db "ooooooMMMM     ooo  MMMMM  ooMMM" ;map
    db "o   ooMMMMF  M Moo    M  b    MM" ;map
    db "  d   MMMM MMMMMMM    o      MMM" ;map
    db "oo     ~MMMMMMMMMM  o  o   o MMM" ;map
    db "oooM   M~MMM  MMMMM  oo  M M  MM" ;map
    db "o oMMM  ~MMMoo  M     oMMMMMM   " ;map
    db " o  MMM  MM o o oo 8   MMMMMM   " ;map
    db "MMMMMM ~ MMMMMMMooo  o MMMMMM o " ;map
    db "MMMMMMMM MMMMMM Mo  oooo     o  " ;map
    db "MMMMMMM   MMMMM  M M  o      o  " ;map
    db "MMM  MM oo  MMMMMMMMMM      oo M" ;map
    db "MM P MMMoo MMMMMMMMMM    MMM    " ;map
    db "MM   MMMMM MMMMMMMM    MMMMM    " ;map
    db "MM    MMM  MM MMMM   MMMMMM  M  " ;map
    db "MMM   M  d      MMM MMMMMMM    M" ;map
    db "MMMM               oMMMMMMM  MMM" ;map
    db "MMMMMMMM   MMM M  ooMMMMM    MMM" ;map
    db "MMMMMMMMMM MMMMMMMo MMM    ooMMM" ;map
    db "MMMMMMMMM   MMMMMMMMMMM b  MoMMM" ;map
    db "MMMMMMMMM  MMMMMMMMMMMMM    M MM" ;map
    db "MMMMMMMMMM MMMMMMMMMMMMMM     MM" ;map
    db "MMM MMMMMM MMMM M~MMM MMMM   ~MM" ;map
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

map_09_4365::
    db $20, $16
    db "MMMMooo+~~MMMMMMMMM ~~~     ooo " ;map
    db "MMMMo  +~ MMM~ MMMM         ooo " ;map
    db "MMM    +~ MM ~~~M   ## +++ 8    " ;map
    db " MM   +     ~ ~      *+         " ;map
    db "     ++        b + ++# M        " ;map
    db "           o      +  # MMM      " ;map
    db "  F  M MMMoooo     ~~~#MMMM  MM " ;map
    db "     MM M ~~o MM MM~~~# MMMMMMM " ;map
    db "MM MMM ~ ~~~~ MMMMM~~   MMMMMMM " ;map
    db "MMMMMM ~~~~~~~MMMMM    ~ MMMMMM " ;map
    db "MMMMM   ~              ~~~MMM   " ;map
    db "MMMMM       F   ~~~M M  ~~      " ;map
    db "MMM  + MMM      ~~~MMMM ~~~~    " ;map
    db "M    + MMMMM M   ~~ MMM ~~~  M  " ;map
    db "     +  MMM MMMM    M  ~~~  MMM " ;map
    db "    + + MM    MMM   ~~~~~   MMM " ;map
    db " d ++ +        MMMMM  ~~  F  MM " ;map
    db "      ++ + P    MMMMM ~~     MM " ;map
    db "   M   ++      MMMMMM ~  M MMMM " ;map
    db "MMMMM  +      MMMMMo o  MMMMMMM " ;map
    db "MMMMM  +      MMM ooooooMMMMMMM " ;map
    db "M MM M M o M    M o o oMMMMMM~MM" ;map
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

map_09_46af::
    db $20, $16
    db "MMMMMMM oooooo  o  ~~~  MMMMMMM " ;map
    db "MMMMMM   ~  o     F~~~  MMMMMMM " ;map
    db "MMMMM    ~~         ~    MMMMMM " ;map
    db "MMMMM   F ~    MMM      ~ M M   " ;map
    db "MMMM  ~   o   MMMMMMMM          " ;map
    db "MMM         o MMMMMMMM          " ;map
    db "MMM~     M    MMMMMMMMM         " ;map
    db "MM   MMMMMMM MMMMMMMMM          " ;map
    db "M    MMMMMMMMMMMMMMMMM     d    " ;map
    db "M    MMMMMMMMMMMMMMMMMM         " ;map
    db "      MMMMMMMMMMMMMMMMMM        " ;map
    db "      MMMMMMMMMMMMMMMMMM        " ;map
    db "    b  MMMMMMMMMMMMMMMMMM       " ;map
    db "       MMMMMMMMMMMMMMMMM        " ;map
    db "   oooMMM   MMMMMMMMMMMM ~      " ;map
    db "    ooMMMM  MMMMMMMMMMMo ~~     " ;map
    db "  ~   MMMMMM MMMMMMMMMMoo~~     " ;map
    db "       MMMMM~ M M  MMMM      ~  " ;map
    db " 8      MMMMMM M M MMMM      ~~ " ;map
    db "        MMMMMMMMMMMMMM    P  ~~ " ;map
    db "     MMMMMMMMMMMMMMMM         ~ " ;map
    db "   M MM MMMMMMMMM MMM  ~ M + ~ M" ;map
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

map_09_4a1a::
    db $20, $16
    db " M Mooo  oo MMMMMMM + MMMM~~o~~ " ;map
    db " MMMMM   MMMMMMMMM +++M MMMMF~~ " ;map
    db "MoMMMMMMMMMMM MMM++ ~ +d MMM +~ " ;map
    db "  MMMMMMM M+ + + +~~ ~++ MMMM+  " ;map
    db "b MMMMM o +M+~+ +~~~~~  MMMM+o  " ;map
    db "++  M  ++++M   ~~~~~~~~~MMMM+oo " ;map
    db "MM++ ++~ooMM MMM~~~ ~~~~MMM +   " ;map
    db "MM M+ ++ooM MMMM  ~~~ ~~   +++  " ;map
    db "MMMMMM  ++~~~MMMMF~~ ~  ##+oo+  " ;map
    db "MMMMMMoo~~++     +~+ + + *+oo+  " ;map
    db "MMMMMMMMM +o+++++++ + +M+#M++MM " ;map
    db " MMMM MMM++oo  ~~~++~MMMMM#+ MM " ;map
    db " MMMM    +    F~~~~~+MMMM #+ MM " ;map
    db "  M ~~ ++~####~~~~~~+MMMM+* ++  " ;map
    db " 8   ++~~~~~~#~~~~~~+MMMM+##  + " ;map
    db "   ++  M   MMM##~~~++ Moo+ #    " ;map
    db " ++  MMMMMMMMM ~#++MMM oo+  #   " ;map
    db "+  MMMMMMMMMMMM+* MMMMMMo+  ### " ;map
    db "MMMMMMMMMMMMMM +##MMMMMM +P     " ;map
    db "MMMMMMMMMMMMMMM+ #M MMMMM+      " ;map
    db "M M M M M M M       M M         " ;map
    db "   M 8 M M 8 M M   M     M M # M" ;map
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

map_09_4d85::
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
    db "MMM MMoMMPMMM~M " ;map
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

map_09_4e56::
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
    db "MMMMM MMM   MMMMM~ M + # M M o M" ;map
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

map_09_5040::
    db $20, $16
    db "MMMMooo+~~MMMMMMMMM ~~~     ooo " ;map
    db "MMMMo  +~ MMM~ MMMM         ooo " ;map
    db "MMM    +~ MM ~~~M   ## +++ 8    " ;map
    db " MM   +     ~ ~      *+         " ;map
    db "     ++        b + ++# M        " ;map
    db "           o      +  # MMM      " ;map
    db "  F  M MMMoooo     ~~~#MMMM  MM " ;map
    db "     MM M ~~o MM MM~~~# MMMMMMM " ;map
    db "MM MMM ~ ~~~~ MMMMM~~   MMMMMMM " ;map
    db "MMMMMM ~~~~~~~MMMMM    ~ MMMMMM " ;map
    db "MMMMM   ~              ~~~MMM   " ;map
    db "MMMMM       F   ~~~M M  ~~      " ;map
    db "MMM  + MMM      ~~~MMMM ~~~~    " ;map
    db "M    + MMMMM M   ~~ MMM ~~~  M  " ;map
    db "     +  MMM MMMM    M  ~~~  MMM " ;map
    db "    + + MM    MMM   ~~~~~   MMM " ;map
    db " d ++ +        MMMMM  ~~  F  MM " ;map
    db "      ++ + P    MMMMM ~~     MM " ;map
    db "   M   ++      MMMMMM ~  M MMMM " ;map
    db "MMMMM  +      MMMMMo o  MMMMMMM " ;map
    db "MMMMM  +      MMM ooooooMMMMMMM " ;map
    db "MMM  M M M ~ M +MMoMo oMMMMMMMMM" ;map
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

map_09_53ab::
    db $20, $16
    db " M Mooo  oo MMMMMMM + MMMM~~o~~ " ;map
    db " MMMMM   MMMMMMMMM +++M MMMMF~~ " ;map
    db "MoMMMMMMMMMMM MMM++ ~ +d MMM +~ " ;map
    db "  MMMMMMM M+ + + +~~ ~++ MMMM+  " ;map
    db "b MMMMM o +M+~+ +~~~~~  MMMM+o  " ;map
    db "++  M  ++++M   ~~~~~~~~~MMMM+oo " ;map
    db "MM++ ++~ooMM MMM~~~ ~~~~MMM +   " ;map
    db "MM M+ ++ooM MMMM  ~~~ ~~   +++  " ;map
    db "MMMMMM  ++~~~MMMMF~~ ~  ##+oo+  " ;map
    db "MMMMMMoo~~++     +~+ + + *+oo+  " ;map
    db "MMMMMMMMM +o+++++++ + +M+#M++MM " ;map
    db " MMMM MMM++oo  ~~~++~MMMMM#+ MM " ;map
    db " MMMM    +    F~~~~~+MMMM #+ MM " ;map
    db "  M ~~ ++~####~~~~~~+MMMM+* ++  " ;map
    db " 8   ++~~~~~~#~~~~~~+MMMM+##  + " ;map
    db "   ++  M   MMM##~~~++ Moo+ #    " ;map
    db " ++  MMMMMMMMM ~#++MMM oo+  #   " ;map
    db "+  MMMMMMMMMMMM+* MMMMMMo+  ### " ;map
    db "MMMMMMMMMMMMMM +##MMMMMM +P     " ;map
    db "MMMMMMMMMMMMMMM+ #M MMMMM+      " ;map
    db "M M M M M M M       M M         " ;map
    db " M M o M M M M M # M M # M M   M" ;map
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
