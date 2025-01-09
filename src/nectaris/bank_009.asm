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
