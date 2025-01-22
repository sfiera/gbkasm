; Disassembly of "Nectaris GB (Japan) (SGB Enhanced).gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "trap.inc"
INCLUDE "nectaris/map.inc"
INCLUDE "nectaris/units.inc"

SECTION "nectaris/map_story_adv: Map C01 Nevets", ROMX

MapC01Nevets::
    map "MoMMM~# ~ ~~~MMM", \
        "ooo~M ##    ~~~~", \
        "oo~    *++++++++", \
        "o    ++#     G  ", \
        "o  ++  M#      ~", \
        " U + ~ M#o~    M", \
        " + + o~M oo~~ ~o", \
        "+ + ~oMMMMoo~~oM", \
        "   ~~~ooMMMMo~MM", \
        "oo~~~oooMMMMMMMM", \
        "oMoMoMMMMoM MMMo"
    db FOE | DARBEK, $00 | $0d, $03
    db OWN | RABBIT, $00 | $06, $03
    db FOE | DARBEK, $00 | $0b, $07
    db OWN | NASHORN, $00 | $05, $03
    db OWN | LYNX, $00 | $03, $04
    db FOE | MONSTER, $00 | $0c, $03
    db FOE | RHINO, $00 | $0e, $03
    db FOE | ESTOL, $00 | $0e, $04
    db FOE | SLAGGER, $00 | $0d, $04
    db OWN | DARBEK, $00 | $05, $01
    db FOE | RHINO, $00 | $09, $01
    db FOE | MONSTER, $00 | $0d, $01
    db FOE | SLAGGER, $00 | $0a, $04
    db OWN | GRIZZLY, $00 | $04, $04
    db OWN | RABBIT, $00 | $05, $05
    db OWN | MUNKS, $00 | $04, $06
    db FOE | RHINO, $00 | $09, $04
    db $ff

SECTION "nectaris/map_story_adv: Map C02 Lartsa", ROMX

MapC02Lartsa::
    map "M Moo ~   oMM   ", \
        "MU           ~ o", \
        "       o o  o oo", \
        "    ~~ MMMoo  oo", \
        "  ~~    MMo   o ", \
        "     o  M       ", \
        "    ooo        ~", \
        "oooM~MMM ~~M G ~", \
        "o  o  oooo~~   ~", \
        " ~~ o ~ MM~~   ~", \
        " M M M M MoMMMMo"
    db FOE | GIANT, $00 | $09, $05
    db FOE | GIANT, $00 | $08, $07
    db FOE | GIANT, $00 | $08, $06
    db FOE | RHINO, $00 | $0d, $07
    db OWN | NASHORN, $00 | $01, $01
    db OWN | RABBIT, $00 | $03, $00
    db OWN | RABBIT, $00 | $03, $01
    db OWN | RABBIT, $00 | $02, $03
    db OWN | RABBIT, $00 | $01, $03
    db FOE | DARBEK, $00 | $0e, $07
    db FOE | MUNKS, $00 | $0d, $08
    db OWN | DARBEK, $00 | $01, $02
    db FOE | GIANT, $00 | $08, $08
    db FOE | GIANT, $00 | $0a, $05
    db OWN | RABBIT, $00 | $03, $02
    db OWN | RABBIT, $00 | $05, $04
    db OWN | RABBIT, $00 | $06, $04
    db OWN | RABBIT, $00 | $06, $03
    db OWN | DARBEK, $00 | $02, $01
    db $ff

SECTION "nectaris/map_story_adv: Map C03 Elkceh", ROMX

MapC03Elkceh::
    map "MMMMM  # ~     ~", \
        "MMMMM ##  M ~G  ", \
        "M MMM #+ + + + +", \
        "     +*#+ +~+ +M", \
        "M ~++ MM   ~g   ", \
        " ++ o MM  ~   ~ ", \
        "+     oMMM  o~  ", \
        "  U   ooMo    oM", \
        "    ~  MooMoMMMM", \
        "oo Mo  MoMoMMMMM", \
        "MM ~ MMMM MMMMM "
    db OWN | RABBIT, $00 | $04, $04
    db FOE | MONSTER, $00 | $09, $03
    db OWN | SLAGGER, $00 | $02, $03
    db OWN | RABBIT, $00 | $05, $01
    db OWN | MUNKS, $00 | $06, $05
    db OWN | MUNKS, $00 | $04, $03
    db FOE | LENET, $00 | $0a, $02
    db FOE | GIANT, $00 | $0d, $01
    db OWN | BISON, $00 | $04, $06
    db FOE | YAMA, $00 | $0c, $03
    db FOE | SLAGGER, $00 | $0e, $05
    db FOE | MONSTER, $20 | $0c, $04
    db FOE | MONSTER, $20 | $0c, $04
    db FOE | RABBIT, $20 | $0c, $04
    db FOE | RABBIT, $20 | $0c, $04
    db FOE | BISON, $20 | $0c, $04
    db FOE | BISON, $20 | $0c, $04
    db FOE | LENET, $20 | $0c, $04
    db FOE | LENET, $20 | $0c, $04
    db FOE | RHINO, $00 | $0a, $04
    db OWN | DARBEK, $20 | $0c, $04
    db FOE | MUNKS, $00 | $0c, $07
    db OWN | DILLO, $00 | $05, $03
    db FOE | YAMA, $00 | $0d, $03
    db OWN | RABBIT, $00 | $06, $09
    db OWN | BISON, $00 | $07, $07
    db FOE | BISON, $00 | $09, $05
    db $ff

SECTION "nectaris/map_story_adv: Map C04 Gnimer", ROMX

MapC04Gnimer::
    map "Mooo           ~", \
        "M     f         ", \
        "M        oo o  o", \
        "  o o     o     ", \
        "    ~oo~o       ", \
        "      o ~o  G  o", \
        "o      ~ o      ", \
        " U     o        ", \
        "        o ~   MM", \
        "    o      Mo  M", \
        " M M M  MMMM M M"
    db FOE | BISON, $00 | $0b, $08
    db OWN | DRAPER, $00 | $01, $06
    db FOE | ESTOL, $00 | $03, $09
    db OWN | NASHORN, $20 | $06, $01
    db FOE | RABBIT, $00 | $0d, $09
    db FOE | BISON, $00 | $0c, $00
    db FOE | MONSTER, $00 | $0e, $01
    db FOE | MUNKS, $00 | $0d, $01
    db FOE | LYNX, $00 | $02, $02
    db FOE | MONSTER, $00 | $04, $02
    db OWN | RABBIT, $00 | $03, $06
    db OWN | BISON, $00 | $02, $05
    db OWN | LENET, $00 | $04, $05
    db $ff

SECTION "nectaris/map_story_adv: Map C05 Reyets", ROMX

MapC05Reyets::
    map "MMMoo   ~   ooMM", \
        "Mo~    ~ o   ~MM", \
        "Mo    oMMM~   oM", \
        "o     oMMo     ~", \
        "o~  U MMM~f    ~", \
        "~    ooMMMo   ~M", \
        "M~   MMMMM~   ~M", \
        "Mo  ~MMMMMM  ~oM", \
        "MM~ oMMMMMM  ooM", \
        "Mo~ MMMMM~M  oMM", \
        "Mo  ~MMMM~    MM", \
        "MM  oMMMMM o ~MM", \
        "M   ~ooMMMMo MoM", \
        "M~   ooMMMM~ oMM", \
        "~f   oMMMMo   MM", \
        "    ~MMMMMM   MM", \
        "    MMMMMoG  ~MM", \
        "o   o~M~M     ~M", \
        "Mo            oM", \
        "MMo  ~~      ooM", \
        "MM~M~M~M~M~M~MMM", \
        "MMMoMMMMMMM MMMM"
    db FOE | MUNKS, $00 | $09, $11
    db FOE | MUNKS, $00 | $0c, $0f
    db FOE | RHINO, $00 | $07, $11
    db OWN | MUNKS, $00 | $04, $04
    db OWN | MUNKS, $00 | $02, $05
    db OWN | RABBIT, $00 | $03, $03
    db OWN | RABBIT, $00 | $05, $04
    db FOE | RHINO, $00 | $09, $09
    db FOE | RHINO, $00 | $0b, $0d
    db OWN | BISON, $00 | $04, $05
    db OWN | BISON, $00 | $04, $07
    db OWN | BISON, $00 | $03, $05
    db FOE | DILLO, $00 | $0a, $10
    db FOE | DILLO, $00 | $0a, $12
    db FOE | MONSTER, $00 | $0c, $13
    db FOE | MONSTER, $00 | $0b, $0f
    db FOE | SLAGGER, $00 | $0c, $11
    db FOE | SLAGGER, $00 | $0d, $11
    db FOE | SLAGGER, $00 | $0d, $0f
    db OWN | HUNTER, $40 | $01, $0e
    db OWN | HUNTER, $40 | $01, $0e
    db FOE | JAVI, $20 | $0a, $04
    db FOE | FALCO, $20 | $0a, $04
    db OWN | NASHORN, $20 | $0a, $04
    db OWN | DILLO, $20 | $0a, $04
    db OWN | GRIZZLY, $20 | $0a, $04
    db OWN | GRIZZLY, $20 | $0a, $04
    db FOE | DRAPER, $40 | $01, $0e
    db OWN | SEEKER, $00 | $06, $05
    db OWN | SEEKER, $00 | $05, $05
    db FOE | SEEKER, $00 | $0b, $12
    db FOE | SEEKER, $00 | $0b, $10
    db $ff

SECTION "nectaris/map_story_adv: Map C06 Ehtlaw", ROMX

MapC06Ehtlaw::
    map "~  ~          ~M", \
        " U        f  ~ M", \
        "     ~  ~      M", \
        "          ~    M", \
        "   ~ ~ ~    ~  M", \
        "~  o~MoMoo~~   M", \
        "M~~MMoMoMoo   ~M", \
        "MMM~o ~ ~  ~~oMM", \
        "MMoo      ooooMM", \
        "MM~~   f   ~oM~M", \
        "oMM        MMMMM", \
        "~ ~ o~    ~MMMMM", \
        "~   oMoo~ooMo~oM", \
        "    ~oMMoMM~o ~M", \
        " ~    ~~~~~   ~M", \
        "    ~          M", \
        " f        ~    M", \
        "    ~ ~     G  M", \
        "~       ~      M", \
        "~~ ~ ~~      ~~M", \
        "MM~M~M~M~M~M~M~M", \
        "MMM M M MMM MMMM"
    db FOE | MUNKS, $00 | $0b, $01
    db FOE | MUNKS, $00 | $06, $0b
    db OWN | YAMA, $00 | $0b, $00
    db OWN | JAVI, $00 | $09, $0b
    db FOE | DARBEK, $00 | $04, $12
    db FOE | HAWKEYE, $00 | $0d, $03
    db OWN | FALCO, $20 | $0a, $01
    db OWN | JAVI, $20 | $0a, $01
    db OWN | MUNKS, $20 | $0a, $01
    db OWN | NASHORN, $20 | $0a, $01
    db OWN | HAWKEYE, $20 | $0a, $01
    db FOE | HUNTER, $20 | $0a, $01
    db FOE | HUNTER, $20 | $0a, $01
    db FOE | FALCO, $40 | $07, $09
    db FOE | FALCO, $40 | $07, $09
    db FOE | JAVI, $40 | $07, $09
    db OWN | HAWKEYE, $40 | $07, $09
    db OWN | SEEKER, $40 | $07, $09
    db OWN | SEEKER, $40 | $07, $09
    db OWN | HUNTER, $20 | $0a, $01
    db FOE | YAMA, $00 | $06, $09
    db FOE | YAMA, $00 | $07, $0a
    db OWN | DILLO, $00 | $03, $02
    db OWN | HAWKEYE, $00 | $02, $02
    db OWN | SEEKER, $00 | $01, $04
    db OWN | FALCO, $60 | $01, $10
    db OWN | FALCO, $60 | $01, $10
    db FOE | HAWKEYE, $60 | $01, $10
    db FOE | SEEKER, $60 | $01, $10
    db FOE | HAWKEYE, $00 | $0d, $12
    db FOE | SEEKER, $00 | $0c, $0f
    db FOE | RABBIT, $00 | $0a, $13
    db FOE | LYNX, $00 | $0b, $11
    db FOE | SLAGGER, $00 | $09, $10
    db FOE | SLAGGER, $00 | $06, $12
    db OWN | FALCO, $00 | $0a, $0a
    db OWN | LENET, $00 | $07, $03
    db OWN | DRAPER, $00 | $09, $06
    db FOE | SEEKER, $00 | $0c, $06
    db FOE | GIANT, $60 | $01, $10
    db FOE | HUNTER, $60 | $01, $10
    db FOE | HUNTER, $60 | $01, $10
    db FOE | HUNTER, $60 | $01, $10
    db OWN | PELICAN, $40 | $07, $09
    db $ff

SECTION "nectaris/map_story_adv: Map C07 Tubmun", ROMX

MapC07Tubmun::
    map "o~ ~oMMMo ~~o ~M", \
        "~U MoMo~~     oM", \
        "   MoMo~   o  ~M", \
        "   oMMo   MM   M", \
        "~  ~Mo~  oMM~ ~M", \
        "  MMMo~  MMMo oM", \
        "  oMMM  ~MoMo oM", \
        "   ooM  MoMo  oM", \
        "  ooM~  MMM    M", \
        "~  oMMf ~Mo~ o~M", \
        "~~ MM   oMo  oMM", \
        "~  Mo    MM   ~M", \
        "~ MMM  ~oMM  ~oM", \
        "  MMo  MMoo~  ~M", \
        " oMM   MMoo   ~M", \
        " oMM   MM~    oM", \
        "  M   ~MM~ G  ~M", \
        "     ~oMoM ~ ~~M", \
        "oo~o~MMooMooo~oM", \
        "ooo~oMMMMMMMMMMM", \
        "MMMMMMMMMMMMMMMM", \
        "MMMM M MM M~MMMM"
    db OWN | DRAPER, $00 | $01, $01
    db OWN | DARBEK, $00 | $02, $01
    db FOE | DRAPER, $00 | $0b, $10
    db FOE | DARBEK, $00 | $0c, $10
    db FOE | GIANT, $00 | $05, $0a
    db FOE | GIANT, $00 | $06, $0b
    db OWN | GIANT, $00 | $06, $07
    db OWN | GIANT, $00 | $07, $07
    db FOE | DILLO, $00 | $0d, $08
    db FOE | GRIZZLY, $00 | $0c, $09
    db FOE | GRIZZLY, $00 | $0b, $08
    db OWN | BISON, $00 | $01, $07
    db OWN | BISON, $00 | $02, $07
    db OWN | GRIZZLY, $00 | $02, $09
    db OWN | NASHORN, $00 | $01, $03
    db FOE | NASHORN, $00 | $0b, $0e
    db FOE | ESTOL, $00 | $0c, $0e
    db FOE | RABBIT, $00 | $09, $0f
    db FOE | RABBIT, $00 | $0d, $0e
    db FOE | LYNX, $00 | $0d, $10
    db OWN | RABBIT, $00 | $03, $03
    db OWN | LYNX, $00 | $02, $02
    db OWN | RABBIT, $20 | $06, $09
    db OWN | RABBIT, $20 | $06, $09
    db OWN | RABBIT, $20 | $06, $09
    db FOE | GIANT, $00 | $07, $0b
    db FOE | MUNKS, $00 | $0c, $12
    db $ff

SECTION "nectaris/map_story_adv: Map C08 Fatsug", ROMX

MapC08Fatsug::
    map "MMo Moo~MMMMMMoM", \
        "MoM~  ~ ~o~o~MoM", \
        "M~   ~    ~   MM", \
        "MM G  o~ ~o  o~M", \
        "Mo   ~o     ~~~M", \
        "M~o     oM~    M", \
        "o   ~M~    f  ~M", \
        " ~~~ o ~oo~~ ~oM", \
        "  Mo         ~~M", \
        "~    ~ ~Mo~o ooM", \
        "oo~ oM o  M~ ~~M", \
        "o~ ~~   ~     oM", \
        "o  f  ~o Mo ~ ~M", \
        "~~   M~ M~ o ~~M", \
        "o~~    ~   M  oM", \
        "o  ~ ~ oM ~ ~o~M", \
        "~ ~ oM       ~MM", \
        "o M~   M  U  M~M", \
        "oM  ~~ ~~   ~MoM", \
        "MM o M o ~ ~M~oM", \
        "MMMMMM~M M~MoMMM", \
        "MMMMMMM MMMMM MM"
    db OWN | LENET, $00 | $0b, $0f
    db FOE | MUNKS, $00 | $07, $05
    db FOE | DARBEK, $00 | $04, $0a
    db OWN | BISON, $00 | $08, $0b
    db OWN | GRIZZLY, $00 | $07, $09
    db OWN | GRIZZLY, $00 | $08, $0a
    db OWN | BISON, $00 | $07, $0c
    db FOE | MONSTER, $00 | $03, $10
    db FOE | MONSTER, $00 | $04, $12
    db OWN | BISON, $00 | $09, $0e
    db OWN | LENET, $00 | $09, $0f
    db OWN | NASHORN, $00 | $0b, $0b
    db FOE | RHINO, $00 | $02, $04
    db FOE | RHINO, $00 | $03, $02
    db FOE | BISON, $00 | $08, $05
    db FOE | BISON, $00 | $05, $04
    db FOE | BISON, $00 | $02, $10
    db FOE | BISON, $00 | $0b, $05
    db FOE | RABBIT, $20 | $0b, $06
    db FOE | MONSTER, $00 | $01, $0a
    db FOE | DARBEK, $00 | $02, $03
    db FOE | DARBEK, $00 | $03, $03
    db FOE | LENET, $00 | $03, $05
    db FOE | LENET, $00 | $04, $06
    db FOE | LENET, $00 | $01, $0e
    db FOE | LENET, $00 | $0d, $06
    db FOE | NASHORN, $40 | $03, $0c
    db FOE | BISON, $40 | $03, $0c
    db FOE | ESTOL, $20 | $0b, $06
    db FOE | LENET, $20 | $0b, $06
    db FOE | RABBIT, $40 | $03, $0c
    db FOE | RABBIT, $40 | $03, $0c
    db OWN | DILLO, $00 | $0b, $09
    db OWN | RABBIT, $00 | $0a, $0e
    db OWN | DILLO, $00 | $0a, $11
    db OWN | DILLO, $00 | $09, $08
    db OWN | MUNKS, $00 | $07, $0d
    db OWN | DARBEK, $00 | $09, $09
    db OWN | MUNKS, $00 | $0c, $0b
    db $ff

SECTION "nectaris/map_story_adv: Map C09 Cidrad", ROMX

MapC09Cidrad::
    map "#oo    MM~~ ~MM~MM~   ~~    ~#~~", \
        "## U  MMM~~     M    ~~    f  ##", \
        " #    MMMM f                 ##M", \
        "       MMM    ~~       M MooooMM", \
        "        MMMo oMMMM    MMMMMMoooo", \
        " ~MM     ~ooooooM~     MM ooo oo", \
        "~~M       ~~~   ~~~  # ##       ", \
        "~     ## #~      MM~~~#+++++G   ", \
        "~ f    # ##M  f   M ~+*oo       ", \
        "     ~#~~###M      ++~##o    ooo", \
        " M M~ ~M#   #M~M G+M~M o~M M  oM"
    db OWN | BISON, $00 | $04, $01
    db OWN | RABBIT, $00 | $03, $02
    db FOE | HUNTER, $20 | $1b, $01
    db FOE | HUNTER, $20 | $1b, $01
    db OWN | BISON, $20 | $1b, $01
    db OWN | RABBIT, $20 | $1b, $01
    db OWN | LYNX, $20 | $1b, $01
    db OWN | NASHORN, $20 | $1b, $01
    db OWN | JAVI, $20 | $1b, $01
    db FOE | FALCO, $60 | $02, $08
    db FOE | FALCO, $60 | $02, $08
    db FOE | JAVI, $60 | $02, $08
    db OWN | MUNKS, $00 | $05, $05
    db FOE | MONSTER, $00 | $1b, $07
    db FOE | ESTOL, $00 | $1c, $06
    db OWN | BISON, $40 | $0b, $02
    db OWN | DILLO, $40 | $0b, $02
    db OWN | LYNX, $40 | $0b, $02
    db OWN | RABBIT, $40 | $0b, $02
    db FOE | MUNKS, $00 | $12, $03
    db OWN | HUNTER, $20 | $1b, $01
    db OWN | HUNTER, $20 | $1b, $01
    db OWN | HUNTER, $20 | $1b, $01
    db FOE | SEEKER, $80 | $0e, $08
    db FOE | SEEKER, $60 | $02, $08
    db FOE | HAWKEYE, $60 | $02, $08
    db FOE | MUNKS, $00 | $13, $08
    db OWN | SEEKER, $80 | $0e, $08
    db OWN | SEEKER, $80 | $0e, $08
    db OWN | HAWKEYE, $80 | $0e, $08
    db OWN | NASHORN, $80 | $0e, $08
    db FOE | DARBEK, $00 | $16, $02
    db FOE | FALCO, $40 | $0b, $02
    db FOE | FALCO, $40 | $0b, $02
    db FOE | JAVI, $40 | $0b, $02
    db OWN | MUNKS, $40 | $0b, $02
    db OWN | PELICAN, $40 | $0b, $02
    db FOE | LENET, $00 | $15, $04
    db $ff

SECTION "nectaris/map_story_adv: Map C10 Ellsek", ROMX

MapC10Ellsek::
    map "MMMM+   ooooMMMMMMMMM#~##~ +~~~~", \
        "~~M++ G  MMMMMMMM MMoo#~~  u  ~o", \
        "~ +      MMMMMM~~   o## ~++   oo", \
        "  g    #MMM MMM~ #     ++  M    ", \
        "  + ### MM f    ~##++++  MMMM   ", \
        "  ++~*++++       +*~~~   MMM    ", \
        "oo  +# ~~++++++++ ##oo  MMM  U  ", \
        "oM~MMM# ~+~~~      #o~ MMMMM    ", \
        "MMMMM##  +~oo  f  ~M~~~MM~M    o", \
        "MMMMM~~  +  o     MMMMMMM~~~  oo", \
        "MMMMM ~M M + M M +MMM M ~M~M ~oM"
    db OWN | DRAPER, $00 | $0e, $06
    db OWN | BISON, $20 | $1b, $01
    db OWN | BISON, $20 | $1b, $01
    db OWN | DILLO, $20 | $1b, $01
    db OWN | SLAGGER, $20 | $1b, $01
    db OWN | NASHORN, $00 | $1d, $06
    db OWN | ESTOL, $00 | $1d, $03
    db OWN | GRIZZLY, $80 | $0f, $08
    db OWN | GRIZZLY, $80 | $0f, $08
    db OWN | DILLO, $80 | $0f, $08
    db FOE | DRAPER, $00 | $0d, $06
    db OWN | BISON, $80 | $0f, $08
    db OWN | BISON, $80 | $0f, $08
    db FOE | SLAGGER, $60 | $0b, $04
    db FOE | SLAGGER, $60 | $0b, $04
    db FOE | RABBIT, $60 | $0b, $04
    db FOE | RABBIT, $60 | $0b, $04
    db FOE | LYNX, $60 | $0b, $04
    db FOE | MONSTER, $40 | $02, $03
    db FOE | MONSTER, $40 | $02, $03
    db FOE | SLAGGER, $40 | $02, $03
    db FOE | NASHORN, $40 | $02, $03
    db FOE | ESTOL, $40 | $02, $03
    db FOE | MONSTER, $40 | $02, $03
    db FOE | MONSTER, $40 | $02, $03
    db FOE | SLAGGER, $40 | $02, $03
    db FOE | LYNX, $40 | $02, $03
    db FOE | NASHORN, $00 | $06, $01
    db FOE | MULE, $40 | $02, $03
    db FOE | RHINO, $40 | $02, $03
    db FOE | RHINO, $80 | $0f, $08
    db OWN | RABBIT, $00 | $1d, $04
    db OWN | RABBIT, $00 | $1c, $08
    db FOE | MUNKS, $20 | $1b, $01
    db FOE | MUNKS, $80 | $0f, $08
    db FOE | MUNKS, $60 | $0b, $04
    db FOE | MUNKS, $00 | $03, $02
    db FOE | MONSTER, $00 | $04, $01
    db FOE | MONSTER, $00 | $03, $01
    db FOE | LENET, $20 | $1b, $01
    db FOE | LENET, $20 | $1b, $01
    db FOE | MONSTER, $00 | $18, $04
    db FOE | MONSTER, $00 | $17, $05
    db FOE | GIANT, $00 | $17, $04
    db OWN | GRIZZLY, $00 | $15, $03
    db FOE | YAMA, $00 | $11, $05
    db $ff

SECTION "nectaris/map_story_adv: Map C11 Ynworb", ROMX

MapC11Ynworb::
    map "MMM   +~#~ooo  f  ~~+ MMMMM~oooo", \
        "MMM   + ~ oo##     ++~MMM~M~o   ", \
        "MM f  ++    ##   ++~~ MM~ ~~    ", \
        "MM     ~+     #+++++++          ", \
        "MMMM M ~++++++*  M   +++ g   ~~~", \
        "~MMMMMM++o # ##  MMM +MM+   MMMM", \
        "~~M~~++ oo  #~~~ MMM +M~     MM ", \
        "~~~ +      MMMMMMMMM  ++~+ G    ", \
        " M  U  ~   MMoMMMMM  # #+ ++    ", \
        " MMM   ~~~M~Mooooo~  ~#MM~ +  ~~", \
        " MMM  ~M~M~ o o~o ~M~M#~MM~M M~ "
    db OWN | MUNKS, $00 | $0f, $03
    db FOE | RHINO, $00 | $1b, $07
    db OWN | LENET, $60 | $19, $04
    db OWN | LENET, $60 | $19, $04
    db FOE | MONSTER, $60 | $19, $04
    db FOE | NASHORN, $60 | $19, $04
    db FOE | ESTOL, $60 | $19, $04
    db FOE | RABBIT, $60 | $19, $04
    db OWN | BISON, $20 | $0f, $00
    db OWN | BISON, $20 | $0f, $00
    db OWN | SLAGGER, $20 | $0f, $00
    db OWN | MONSTER, $60 | $19, $04
    db OWN | MONSTER, $60 | $19, $04
    db OWN | DRAPER, $60 | $19, $04
    db OWN | BISON, $40 | $03, $02
    db OWN | MONSTER, $40 | $03, $02
    db OWN | SLAGGER, $40 | $03, $02
    db FOE | NASHORN, $40 | $03, $02
    db OWN | GRIZZLY, $40 | $03, $02
    db OWN | SLAGGER, $20 | $0f, $00
    db OWN | RABBIT, $20 | $0f, $00
    db OWN | RABBIT, $20 | $0f, $00
    db OWN | LYNX, $20 | $0f, $00
    db OWN | DRAPER, $20 | $0f, $00
    db FOE | MUNKS, $00 | $06, $00
    db OWN | DILLO, $00 | $0e, $04
    db OWN | BISON, $40 | $03, $02
    db $ff

SECTION "nectaris/map_story_adv: Map C12 Otereb", ROMX

MapC12Otereb::
    map "~~    ooo ~~~    f  MMMMMMM###oo", \
        "~ U                 MMM MMM~~#~~", \
        "           MMoMM M ~ ~~M~   ~~# ", \
        "oo   M~M~   ooMMMM~oMM     G  # ", \
        "o  MM~~~   M~~M~MMo~M           ", \
        "~  MMM~M~   ~   ~MMo~o       MMM", \
        "~   Mo##      f  MMM  M       M~", \
        "~   ~ o#~#        ~           ~~", \
        "##~     #  ~~~       # ~~   f  o", \
        "#o#       ~ ~oo~ ~~~ ~#~~~   ~oo", \
        "oM#M   M M  o oM~M~M~M#M~M~M~~o "
    db FOE | MONSTER, $60 | $1c, $08
    db FOE | MONSTER, $60 | $1c, $08
    db FOE | DILLO, $60 | $1c, $08
    db FOE | GIANT, $60 | $1c, $08
    db OWN | BISON, $40 | $0e, $06
    db OWN | BISON, $40 | $0e, $06
    db OWN | LENET, $40 | $0e, $06
    db OWN | MONSTER, $40 | $0e, $06
    db OWN | SLAGGER, $20 | $11, $00
    db OWN | BISON, $60 | $1c, $08
    db OWN | BISON, $60 | $1c, $08
    db FOE | DARBEK, $00 | $10, $07
    db FOE | MUNKS, $00 | $15, $02
    db OWN | DILLO, $00 | $08, $09
    db OWN | BISON, $00 | $04, $02
    db OWN | MUNKS, $00 | $06, $08
    db OWN | RABBIT, $00 | $05, $08
    db OWN | LYNX, $00 | $06, $09
    db FOE | DARBEK, $00 | $1c, $02
    db OWN | BISON, $00 | $07, $04
    db OWN | MONSTER, $20 | $11, $00
    db OWN | GRIZZLY, $20 | $11, $00
    db FOE | RABBIT, $20 | $11, $00
    db FOE | LYNX, $20 | $11, $00
    db OWN | GRIZZLY, $00 | $02, $07
    db $ff

SECTION "nectaris/map_story_adv: Map C13 Renerg", ROMX

MapC13Renerg::
    map "~ ~ ~~o~oMMMMMMMMMMMooo~o   ~~oM", \
        "~~      o oooMMoooMo~ ~      ~~M", \
        "   U     ~ ~ooooo~o     ~ u  ooo", \
        "        ~~~~~~~~~   ~      ~~ooM", \
        "     ~ ~             ~ ~ ~ ooMMM", \
        "~~       ~       ~~ooooo   oM~~~", \
        "oo ~ ~  ~    ~    oMMMM    ~o~MM", \
        "Mo  oo    f       M~o~o~oo ~~~MM", \
        "MM   M o     ~   ~~   ~ ~ ~ Mooo", \
        "o~  oM M~~ ~~~~~    f    ~ o~ooM", \
        "    ~~o~M  ~~ooo M      ~~M~o  M", \
        "       ~   MMMMoooo   ~      ~~M", \
        "oo~       ~ ~ M~M~~    ~   ~~ oM", \
        "~ ~~                   ~~     ~ ", \
        "      g ~~~~  ~    ~     G      ", \
        "            ~  ~~ooM~          M", \
        "~~~~  ~      ~  M~     ~     ~~M", \
        "o~~~~                 ~ ~~~~~ooM", \
        "oo~o~~~~~~ ~~~~          ~~o~ooM", \
        "oooooooo~~ ~oo~~ ~~~ ~~~~ooooMMM", \
        "oMoMoMoMoooMoMoMMMoM~MoM~MoMMMMM", \
        "MMMMM MMMMM M M M M MoM M M MMMM"
    db OWN | BISON, $00 | $15, $0c
    db OWN | NASHORN, $20 | $1a, $02
    db OWN | ESTOL, $20 | $1a, $02
    db OWN | DILLO, $20 | $1a, $02
    db OWN | DILLO, $20 | $1a, $02
    db OWN | GRIZZLY, $20 | $1a, $02
    db OWN | JAVI, $20 | $1a, $02
    db FOE | MONSTER, $80 | $06, $0e
    db FOE | MONSTER, $80 | $06, $0e
    db FOE | SLAGGER, $80 | $06, $0e
    db FOE | NASHORN, $80 | $06, $0e
    db FOE | ESTOL, $80 | $06, $0e
    db FOE | HUNTER, $80 | $06, $0e
    db FOE | HUNTER, $80 | $06, $0e
    db FOE | HAWKEYE, $80 | $06, $0e
    db FOE | SEEKER, $80 | $06, $0e
    db FOE | RABBIT, $80 | $06, $0e
    db OWN | LENET, $00 | $05, $02
    db OWN | MUNKS, $20 | $1a, $02
    db FOE | SLAGGER, $00 | $04, $0c
    db FOE | SLAGGER, $00 | $05, $0c
    db FOE | PELICAN, $80 | $06, $0e
    db FOE | DARBEK, $80 | $06, $0e
    db FOE | MONSTER, $00 | $18, $0e
    db FOE | SLAGGER, $00 | $18, $0d
    db FOE | MUNKS, $00 | $19, $0e
    db FOE | RHINO, $00 | $1c, $0e
    db OWN | FALCO, $60 | $14, $09
    db OWN | FALCO, $60 | $14, $09
    db FOE | RHINO, $40 | $0a, $07
    db OWN | PELICAN, $40 | $0a, $07
    db OWN | LYNX, $40 | $0a, $07
    db OWN | HAWKEYE, $40 | $0a, $07
    db OWN | SEEKER, $20 | $1a, $02
    db OWN | SEEKER, $20 | $1a, $02
    db FOE | SEEKER, $00 | $19, $0f
    db OWN | FALCO, $20 | $1a, $02
    db FOE | GIANT, $00 | $09, $0f
    db FOE | MUNKS, $00 | $09, $0b
    db OWN | MUNKS, $00 | $16, $0b
    db OWN | RABBIT, $00 | $17, $0a
    db FOE | SLAGGER, $00 | $0a, $0b
    db FOE | SLAGGER, $00 | $0e, $09
    db OWN | MUNKS, $00 | $02, $02
    db OWN | SEEKER, $00 | $03, $02
    db OWN | BISON, $00 | $04, $03
    db OWN | BISON, $40 | $0a, $07
    db OWN | BISON, $40 | $0a, $07
    db FOE | MONSTER, $00 | $1a, $0c
    db FOE | RHINO, $00 | $1b, $0f
    db FOE | DARBEK, $00 | $11, $08
    db OWN | LENET, $00 | $15, $0f
    db OWN | RABBIT, $00 | $13, $10
    db OWN | RABBIT, $00 | $1a, $08
    db OWN | BISON, $00 | $16, $0a
    db OWN | DILLO, $00 | $15, $0b
    db $ff

SECTION "nectaris/map_story_adv: Map C14 Treger", ROMX

MapC14Treger::
    map "  +~  ooMMM~MMMMMMMMMMMoo~ +~+ M", \
        "o~+ U ~oooooooMMMMMMM~Moo++ + +M", \
        "o~+   o ~~oMoo~MMoooooo~ +G  ~ M", \
        "oo++      MM~Mo~~ o~ooo~ +  ~~ M", \
        "Mooo++~oo ~oM     ~MM  o +  ~~ M", \
        "MMMoo~+~o    MM     M  oo~+    ~", \
        "MM  o~+  ~oMMM~  ~MM MoMoo+~   ~", \
        "MM    + ~ ooo Mo MMM   Moo+  ~ M", \
        "MM    +~  ~o~   MooMM  Mo~+  o M", \
        "ooo~ ++ ~~ ~o~o o~o M M  ~+ ~o M", \
        "~ ~ +~f  ~ ~     ~o  M~o  + ~ooM", \
        "++++++++  ~~ ~      oooo  +~oooM", \
        "    ~  ~++~ ~  ~     ~o ~~+~oMMM", \
        "  ~  ~    ++~ ~     ~MM  ~+ooMMM", \
        "oo     o ~ ~++   f  ~o   ++~ooMM", \
        "o      ooooo~ ++    ~~M++~~oooMM", \
        "~     ~oMMoo  ~ +++++++ ~~ooooMM", \
        " ~g  ~oMMMMoo~~~    ~      ~oMMM", \
        "  ~~ ooMMMMMooo~ o~     ~~~ooMMM", \
        "~o~ooMMMMMMMMMoMooo~ ~~ooooooMMM", \
        "oMoooMMMMMMMMMMMMMoooooMMMoMMMMM", \
        "MMMoM MMMMMMMMMMMMMMMMMMMMMoMMMM"
    db OWN | DRAPER, $00 | $04, $01
    db OWN | DRAPER, $00 | $02, $03
    db FOE | RHINO, $00 | $04, $10
    db FOE | MUNKS, $00 | $1a, $0b
    db OWN | HUNTER, $20 | $02, $11
    db OWN | HUNTER, $20 | $02, $11
    db OWN | FALCO, $20 | $02, $11
    db OWN | JAVI, $20 | $02, $11
    db OWN | HUNTER, $20 | $02, $11
    db OWN | HUNTER, $20 | $02, $11
    db OWN | FALCO, $20 | $02, $11
    db OWN | JAVI, $20 | $02, $11
    db OWN | HUNTER, $20 | $02, $11
    db OWN | HUNTER, $20 | $02, $11
    db OWN | FALCO, $20 | $02, $11
    db OWN | JAVI, $20 | $02, $11
    db FOE | HAWKEYE, $00 | $02, $0f
    db FOE | RHINO, $00 | $17, $10
    db FOE | RHINO, $00 | $14, $07
    db OWN | FALCO, $00 | $0a, $05
    db OWN | FALCO, $00 | $08, $04
    db OWN | JAVI, $00 | $07, $06
    db FOE | HAWKEYE, $00 | $08, $0d
    db FOE | SEEKER, $00 | $09, $0c
    db FOE | SEEKER, $00 | $01, $0f
    db FOE | HAWKEYE, $00 | $02, $0a
    db FOE | SEEKER, $00 | $02, $09
    db FOE | MONSTER, $00 | $0d, $0f
    db FOE | MONSTER, $00 | $10, $0e
    db OWN | RABBIT, $00 | $04, $03
    db OWN | RABBIT, $00 | $07, $02
    db OWN | BISON, $00 | $05, $01
    db OWN | GRIZZLY, $00 | $08, $07
    db OWN | JAVI, $00 | $09, $06
    db OWN | HUNTER, $40 | $06, $0a
    db OWN | FALCO, $40 | $06, $0a
    db OWN | JAVI, $40 | $06, $0a
    db FOE | SLAGGER, $00 | $19, $01
    db FOE | SLAGGER, $00 | $19, $03
    db FOE | FALCO, $00 | $17, $02
    db FOE | FALCO, $00 | $1c, $05
    db OWN | HUNTER, $60 | $11, $0e
    db OWN | HUNTER, $60 | $11, $0e
    db OWN | FALCO, $60 | $11, $0e
    db OWN | FALCO, $60 | $11, $0e
    db OWN | JAVI, $60 | $11, $0e
    db OWN | HAWKEYE, $60 | $11, $0e
    db OWN | HAWKEYE, $60 | $11, $0e
    db OWN | SEEKER, $60 | $11, $0e
    db $ff

SECTION "nectaris/map_story_adv: Map C15 Amalas", ROMX

MapC15Amalas::
    map "MMMMo~o~o~~~~MooMoMoMMMMM~~++M~M", \
        "MMM~o     M~M ~~o~o ooo ~++  ~oM", \
        "MMM~ ~ ~ M     ~       ++G   ooM", \
        "o~~  ~M~oM          ~~ +   ~ooMM", \
        "oo  f o M       ~ ~MM  +  o oMMM", \
        "oo~       ~       o~MM~+~   ~MMM", \
        "Mo~~   ~Mo~M~~f   M~M~o+~~  ~~MM", \
        "MMo~   M~~oMMo~M   M~Mo+~     ~M", \
        "M~oo  ~ Mo ~  o  o~MM ~+~ o   ~M", \
        "M~oo~   ~ooM~~~  o~~ ~ +  Mo~ ~M", \
        "M  ~~     ~~      ~ ~  + ~ oM ~M", \
        "M~  ~  ~     ~M  ~     +  ~ o MM", \
        "o~~          ~M~oM     ~++  ~ MM", \
        "~  ~      ~  ~o~M     ~MoM++  oM", \
        "++++++++~     MM~ o ~~  M~ +~~oM", \
        "       + ~ ~ ~      o~     +  M~", \
        "~~   U +        oo~ o    g + + +", \
        "oo~o~  +        M~M   Mo    + +~", \
        "MMoMo   ++  ~ f   ~ o~~~MMo~MM~M", \
        "MMMMoo~o  ++    ~   oMM~~~o~MM~M", \
        "MMMMoMoM~M M++ M M M MMMoM~oMMMM", \
        "M M+M MMMMM MM+MM MMMMM MMMMMMM "
    db OWN | DRAPER, $00 | $05, $0e
    db FOE | HAWKEYE, $60 | $19, $10
    db FOE | SEEKER, $60 | $19, $10
    db FOE | SEEKER, $60 | $19, $10
    db FOE | NASHORN, $60 | $19, $10
    db FOE | DILLO, $60 | $19, $10
    db FOE | MONSTER, $60 | $19, $10
    db FOE | MONSTER, $60 | $19, $10
    db FOE | SLAGGER, $40 | $0e, $06
    db FOE | SLAGGER, $40 | $0e, $06
    db FOE | HUNTER, $40 | $0e, $06
    db FOE | HUNTER, $40 | $0e, $06
    db FOE | HUNTER, $40 | $0e, $06
    db OWN | FALCO, $20 | $04, $04
    db OWN | FALCO, $20 | $04, $04
    db OWN | JAVI, $20 | $04, $04
    db OWN | FALCO, $00 | $04, $10
    db OWN | JAVI, $00 | $05, $11
    db OWN | HAWKEYE, $20 | $04, $04
    db FOE | JAVI, $00 | $19, $04
    db FOE | FALCO, $00 | $1a, $09
    db OWN | SEEKER, $00 | $03, $0c
    db FOE | RABBIT, $00 | $1c, $0d
    db FOE | LYNX, $00 | $15, $10
    db FOE | YAMA, $00 | $0c, $08
    db FOE | YAMA, $00 | $0f, $08
    db FOE | YAMA, $00 | $0b, $05
    db OWN | JAVI, $20 | $04, $04
    db FOE | HUNTER, $20 | $04, $04
    db FOE | HUNTER, $60 | $19, $10
    db FOE | DARBEK, $00 | $17, $02
    db OWN | PELICAN, $20 | $04, $04
    db FOE | MUNKS, $00 | $1d, $07
    db FOE | YAMA, $00 | $18, $10
    db OWN | FALCO, $60 | $19, $10
    db OWN | JAVI, $60 | $19, $10
    db OWN | HUNTER, $60 | $19, $10
    db OWN | HUNTER, $60 | $19, $10
    db FOE | HUNTER, $00 | $1c, $0a
    db OWN | FALCO, $80 | $0e, $12
    db OWN | FALCO, $80 | $0e, $12
    db OWN | JAVI, $80 | $0e, $12
    db OWN | JAVI, $80 | $0e, $12
    db OWN | HAWKEYE, $80 | $0e, $12
    db OWN | SEEKER, $80 | $0e, $12
    db OWN | PELICAN, $80 | $0e, $12
    db OWN | HAWKEYE, $40 | $0e, $06
    db $ff

SECTION "nectaris/map_story_adv: Map C16 Tcenoz", ROMX

MapC16Tcenoz::
    map "  Mo+~oM          ~~oo      o ~M", \
        " MM~+~~oM    ~ + +  ~~       ~~M", \
        "o+++++ ~  ~~~~+g+ ++ + +G+  ~ oo", \
        "+  f  ++ o ~~ ~~    + + +~++++++", \
        "       +~~        ~~~M ~+o~~~   ", \
        "  ~~   +  o~M~     ~MM~ ++o    M", \
        "   ~~++   ~~ M~     ~ MM~ ++   M", \
        "    ~+~~~    o  ~~    ~~M~~+   M", \
        "o~  ~+~~    ~  oM  ~      M+~~ M", \
        "oo   +oo~      +~f ~      ~+   M", \
        "~o~  +~o~~ ~~++~+ ~o~~    ~+~~ M", \
        " ~oo  ++o   +o     ~M    ++ ~o~o", \
        "  ~oo~o+  M +~      o   +~~ MMoM", \
        "    ~~~+++Mo+~      ~~o+++~ oMMM", \
        " u    M+~+  +~o      ++  +~   MM", \
        "     ++  + o++~oo~ ++ ~~ M++f MM", \
        " + ++    + ~  ++~++~    ~~MM++++", \
        "+ +    U +  ~~  + ++~   ~~~~ooMM", \
        "    oo   +  ~M~~~~~~++~~  ~ ~~oM", \
        " MMM ooo + ooo Moooo~~++      ~M", \
        "MMMMMMMMo+oMMMMMMMMMMMM~+~MMMMMM", \
        "MMMMMMM oMoMM MMMMMMMMM + MoMMMM"
    db OWN | JAVI, $00 | $0e, $10
    db OWN | NASHORN, $00 | $04, $0d
    db OWN | FALCO, $80 | $01, $0e
    db OWN | FALCO, $80 | $01, $0e
    db OWN | DILLO, $80 | $01, $0e
    db OWN | GRIZZLY, $80 | $01, $0e
    db OWN | GRIZZLY, $80 | $01, $0e
    db OWN | HAWKEYE, $80 | $01, $0e
    db OWN | BISON, $00 | $06, $0e
    db FOE | MONSTER, $00 | $05, $0b
    db FOE | MONSTER, $00 | $05, $10
    db FOE | RHINO, $00 | $16, $02
    db FOE | RHINO, $00 | $1b, $01
    db OWN | FALCO, $60 | $11, $09
    db OWN | FALCO, $60 | $11, $09
    db OWN | SEEKER, $60 | $11, $09
    db OWN | SEEKER, $60 | $11, $09
    db FOE | HAWKEYE, $00 | $0f, $0a
    db FOE | HAWKEYE, $00 | $11, $0c
    db FOE | HUNTER, $20 | $0f, $02
    db FOE | HUNTER, $20 | $0f, $02
    db OWN | SEEKER, $80 | $01, $0e
    db OWN | RABBIT, $60 | $11, $09
    db OWN | RABBIT, $60 | $11, $09
    db OWN | LYNX, $60 | $11, $09
    db OWN | DRAPER, $80 | $01, $0e
    db OWN | MUNKS, $80 | $01, $0e
    db OWN | MUNKS, $80 | $01, $0e
    db FOE | MONSTER, $40 | $03, $03
    db FOE | MONSTER, $40 | $03, $03
    db FOE | ESTOL, $40 | $03, $03
    db FOE | SLAGGER, $a0 | $1c, $0f
    db FOE | GIANT, $20 | $0f, $02
    db FOE | HUNTER, $20 | $0f, $02
    db FOE | HUNTER, $20 | $0f, $02
    db FOE | GIANT, $20 | $0f, $02
    db FOE | YAMA, $00 | $0f, $01
    db FOE | DARBEK, $00 | $02, $0f
    db FOE | MONSTER, $a0 | $1c, $0f
    db FOE | MULE, $a0 | $1c, $0f
    db FOE | RHINO, $a0 | $1c, $0f
    db FOE | MONSTER, $00 | $05, $09
    db FOE | RABBIT, $40 | $03, $03
    db FOE | LYNX, $40 | $03, $03
    db FOE | DARBEK, $20 | $0f, $02
    db FOE | SLAGGER, $00 | $04, $01
    db FOE | SLAGGER, $00 | $05, $02
    db FOE | SLAGGER, $00 | $06, $03
    db OWN | JAVI, $00 | $0d, $0e
    db FOE | MUNKS, $00 | $1a, $01
    db FOE | MUNKS, $00 | $18, $0d
    db OWN | DILLO, $00 | $0b, $0d
    db FOE | HAWKEYE, $00 | $19, $0e
    db FOE | MUNKS, $20 | $0f, $02
    db FOE | JAVI, $60 | $11, $09
    db $ff
