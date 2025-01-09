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

SECTION "Map A01 Steven", ROMX

MapA01Steven::
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
        "oMo oMMMMoM MMM "
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

SECTION "Map A02 Astral", ROMX

MapA02Astral::
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
        "   M M M  oMMMM "
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

SECTION "Map A03 Heckle", ROMX

MapA03Heckle::
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
        "MM   MMMMMMMMMM "
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

SECTION "Map A04 Reming", ROMX

MapA04Reming::
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
        " M M M MM MM ~  "
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

SECTION "Map A05 Steyer", ROMX

MapA05Steyer::
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
        "MMMMMMM M M~MMMM"
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

SECTION "Map A06 Walthe", ROMX

MapA06Walthe::
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
        "MMMMMMMMM MMMMMM"
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

SECTION "Map A07 Numbut", ROMX

MapA07Numbut::
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
        "M M  M MM MMM MM"
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

SECTION "Map A08 Gustaf", ROMX

MapA08Gustaf::
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
        "MMM MMMMMMM MMMM"
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

SECTION "Map A09 Dardic", ROMX

MapA09Dardic::
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
        " M  ~M~M#M M#M~M G+M~M G~M M ooM"
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

SECTION "Map A10 Keslle", ROMX

MapA10Keslle::
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
        "MMMMM~~M G   M M  MMMMM~~M~M  oM"
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

SECTION "Map A11 Browny", ROMX

MapA11Browny::
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
        " MM   ~M~M~ oMoMo ~M~M#MM~~M ~~M"
    db OWN | MUNKS, $00 | $04, $05
    db FOE | DRAPER, $00 | $1b, $07
    db FOE | SLAGGER, $00 | $1a, $06
    db FOE | SLAGGER, $00 | $1b, $04
    db FOE | NASHORN, $00 | $1b, $06
    db FOE | MONSTER, $60 | $19, $04
    db FOE | MONSTER, $60 | $19, $04
    db FOE | RABBIT, $60 | $19, $04
    db FOE | RABBIT, $60 | $19, $04
    db FOE | LYNX, $60 | $19, $04
    db FOE | ESTOL, $60 | $19, $04
    db FOE | MULE, $60 | $19, $04
    db FOE | MUNKS, $60 | $19, $04
    db FOE | MULE, $60 | $19, $04
    db FOE | YAMA, $60 | $19, $04
    db OWN | RABBIT, $00 | $06, $07
    db OWN | RABBIT, $00 | $07, $07
    db OWN | BISON, $00 | $05, $06
    db OWN | BISON, $00 | $07, $05
    db OWN | DILLO, $40 | $03, $02
    db OWN | GRIZZLY, $40 | $03, $02
    db OWN | GRIZZLY, $40 | $03, $02
    db OWN | NASHORN, $40 | $03, $02
    db OWN | MULE, $40 | $03, $02
    db OWN | RHINO, $40 | $03, $02
    db OWN | DRAPER, $40 | $03, $02
    db OWN | GIANT, $20 | $0f, $00
    db OWN | MULE, $20 | $0f, $00
    db OWN | RHINO, $20 | $0f, $00
    db OWN | MULE, $20 | $0f, $00
    db OWN | YAMA, $20 | $0f, $00
    db FOE | DILLO, $00 | $19, $07
    db FOE | GIANT, $00 | $18, $05
    db $ff

SECTION "Map A12 Bereto", ROMX

MapA12Bereto::
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
        "oM#M M M +  oMoM~ ~M~ # ~M~M~ oM"
    db OWN | DRAPER, $00 | $05, $01
    db FOE | MUNKS, $00 | $1b, $03
    db OWN | GRIZZLY, $00 | $04, $03
    db OWN | SEEKER, $00 | $02, $01
    db OWN | JAVI, $00 | $01, $02
    db FOE | HUNTER, $00 | $1c, $05
    db FOE | SEEKER, $00 | $1a, $02
    db FOE | MONSTER, $00 | $1b, $06
    db FOE | MONSTER, $00 | $1a, $05
    db FOE | GRIZZLY, $00 | $1a, $04
    db OWN | SEEKER, $00 | $04, $02
    db OWN | JAVI, $40 | $0e, $06
    db OWN | HAWKEYE, $40 | $0e, $06
    db FOE | DILLO, $20 | $11, $00
    db FOE | NASHORN, $20 | $11, $00
    db FOE | SLAGGER, $20 | $11, $00
    db OWN | BISON, $40 | $0e, $06
    db OWN | BISON, $40 | $0e, $06
    db OWN | RABBIT, $40 | $0e, $06
    db OWN | RABBIT, $40 | $0e, $06
    db FOE | DRAPER, $60 | $1c, $08
    db FOE | NASHORN, $60 | $1c, $08
    db FOE | HUNTER, $60 | $1c, $08
    db FOE | HUNTER, $60 | $1c, $08
    db FOE | HAWKEYE, $60 | $1c, $08
    db FOE | SEEKER, $60 | $1c, $08
    db FOE | SLAGGER, $60 | $1c, $08
    db FOE | SLAGGER, $60 | $1c, $08
    db OWN | MUNKS, $00 | $04, $01
    db OWN | DILLO, $00 | $03, $02
    db OWN | LYNX, $40 | $0e, $06
    db FOE | HUNTER, $00 | $1d, $03
    db OWN | FALCO, $40 | $0e, $06
    db OWN | FALCO, $40 | $0e, $06
    db FOE | DARBEK, $00 | $15, $00
    db $ff

SECTION "Map A13 Grener", ROMX

MapA13Grener::
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
        "MMMMMMM M M MMM M MMM M M MMMoM "
    db OWN | MUNKS, $00 | $05, $02
    db FOE | MUNKS, $00 | $17, $0e
    db FOE | MONSTER, $00 | $17, $08
    db FOE | SLAGGER, $00 | $18, $0b
    db FOE | NASHORN, $00 | $19, $0e
    db FOE | RABBIT, $00 | $1c, $0b
    db FOE | RABBIT, $00 | $1c, $0d
    db OWN | HAWKEYE, $20 | $1a, $02
    db OWN | SEEKER, $20 | $1a, $02
    db OWN | RABBIT, $20 | $1a, $02
    db OWN | LYNX, $20 | $1a, $02
    db OWN | GRIZZLY, $20 | $1a, $02
    db OWN | BISON, $20 | $1a, $02
    db OWN | BISON, $20 | $1a, $02
    db OWN | NASHORN, $20 | $1a, $02
    db OWN | MUNKS, $20 | $1a, $02
    db FOE | GIANT, $60 | $14, $09
    db FOE | HUNTER, $60 | $14, $09
    db FOE | HUNTER, $60 | $14, $09
    db FOE | DILLO, $60 | $14, $09
    db FOE | GRIZZLY, $60 | $14, $09
    db FOE | MONSTER, $60 | $14, $09
    db FOE | MULE, $60 | $14, $09
    db FOE | RHINO, $60 | $14, $09
    db FOE | DARBEK, $60 | $14, $09
    db FOE | HAWKEYE, $80 | $06, $0e
    db FOE | SEEKER, $80 | $06, $0e
    db FOE | SEEKER, $80 | $06, $0e
    db FOE | RABBIT, $80 | $06, $0e
    db FOE | LYNX, $80 | $06, $0e
    db FOE | DILLO, $80 | $06, $0e
    db FOE | GRIZZLY, $80 | $06, $0e
    db FOE | MONSTER, $80 | $06, $0e
    db FOE | SLAGGER, $80 | $06, $0e
    db OWN | ESTOL, $00 | $03, $02
    db OWN | RABBIT, $00 | $03, $01
    db OWN | LYNX, $00 | $02, $02
    db OWN | DILLO, $00 | $04, $04
    db OWN | LENET, $00 | $02, $04
    db OWN | LENET, $00 | $06, $03
    db OWN | FALCO, $40 | $0a, $07
    db OWN | JAVI, $40 | $0a, $07
    db OWN | RABBIT, $40 | $0a, $07
    db OWN | RABBIT, $40 | $0a, $07
    db OWN | GRIZZLY, $40 | $0a, $07
    db OWN | BISON, $40 | $0a, $07
    db OWN | BISON, $40 | $0a, $07
    db OWN | NASHORN, $40 | $0a, $07
    db OWN | GIANT, $40 | $0a, $07
    db $ff

SECTION "Map A14 Regert", ROMX

MapA14Regert::
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
        "MMMMMMMMMMMMMMMoMGMMMMMGMMMMMGMM"
    db OWN | MUNKS, $00 | $06, $04
    db FOE | DRAPER, $00 | $1a, $02
    db OWN | HAWKEYE, $00 | $04, $01
    db OWN | SEEKER, $00 | $05, $02
    db OWN | JAVI, $00 | $04, $04
    db OWN | JAVI, $00 | $06, $05
    db OWN | FALCO, $00 | $04, $05
    db FOE | HUNTER, $00 | $02, $0e
    db FOE | HUNTER, $00 | $03, $0d
    db FOE | HUNTER, $00 | $04, $0e
    db FOE | HAWKEYE, $60 | $02, $11
    db FOE | SEEKER, $60 | $02, $11
    db FOE | SEEKER, $60 | $02, $11
    db FOE | DILLO, $60 | $02, $11
    db FOE | GRIZZLY, $60 | $02, $11
    db FOE | GRIZZLY, $60 | $02, $11
    db FOE | NASHORN, $60 | $02, $11
    db FOE | SLAGGER, $60 | $02, $11
    db FOE | HUNTER, $60 | $02, $11
    db FOE | HUNTER, $60 | $02, $11
    db FOE | HUNTER, $60 | $02, $11
    db FOE | DRAPER, $60 | $02, $11
    db OWN | FALCO, $20 | $06, $0a
    db OWN | JAVI, $20 | $06, $0a
    db FOE | RABBIT, $00 | $19, $03
    db FOE | RABBIT, $00 | $1a, $04
    db FOE | LYNX, $00 | $19, $04
    db FOE | SLAGGER, $00 | $1b, $03
    db FOE | SLAGGER, $00 | $18, $03
    db FOE | BISON, $00 | $18, $01
    db FOE | BISON, $00 | $1a, $01
    db FOE | BISON, $00 | $1c, $01
    db OWN | ESTOL, $40 | $11, $0e
    db OWN | LENET, $40 | $11, $0e
    db OWN | LENET, $40 | $11, $0e
    db OWN | DILLO, $40 | $11, $0e
    db OWN | JAVI, $40 | $11, $0e
    db OWN | JAVI, $20 | $06, $0a
    db OWN | SEEKER, $20 | $06, $0a
    db OWN | RABBIT, $20 | $06, $0a
    db OWN | RABBIT, $20 | $06, $0a
    db OWN | NASHORN, $20 | $06, $0a
    db OWN | DILLO, $20 | $06, $0a
    db OWN | GRIZZLY, $20 | $06, $0a
    db OWN | GRIZZLY, $20 | $06, $0a
    db OWN | BISON, $20 | $06, $0a
    db OWN | BISON, $20 | $06, $0a
    db FOE | MUNKS, $00 | $19, $02
    db FOE | MUNKS, $00 | $06, $0e
    db OWN | DRAPER, $00 | $02, $01
    db OWN | PELICAN, $20 | $06, $0a
    db $ff

SECTION "Map A15 Salama", ROMX

MapA15Salama::
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
        "M M MMMMMMM MM++M MMMMM MMM M MM"
    db OWN | DRAPER, $00 | $05, $0e
    db OWN | DARBEK, $00 | $05, $10
    db OWN | MULE, $00 | $06, $0f
    db FOE | MUNKS, $00 | $19, $02
    db FOE | MULE, $00 | $17, $02
    db FOE | DRAPER, $00 | $18, $02
    db FOE | HUNTER, $60 | $19, $10
    db FOE | HUNTER, $60 | $19, $10
    db FOE | HAWKEYE, $60 | $19, $10
    db FOE | SEEKER, $60 | $19, $10
    db FOE | SEEKER, $60 | $19, $10
    db FOE | NASHORN, $60 | $19, $10
    db FOE | DILLO, $60 | $19, $10
    db FOE | MONSTER, $60 | $19, $10
    db FOE | MONSTER, $60 | $19, $10
    db FOE | GRIZZLY, $40 | $0e, $06
    db FOE | GRIZZLY, $40 | $0e, $06
    db FOE | SLAGGER, $40 | $0e, $06
    db FOE | SLAGGER, $40 | $0e, $06
    db FOE | ESTOL, $40 | $0e, $06
    db FOE | LYNX, $40 | $0e, $06
    db FOE | HUNTER, $40 | $0e, $06
    db FOE | HUNTER, $40 | $0e, $06
    db FOE | HUNTER, $40 | $0e, $06
    db OWN | JAVI, $80 | $0e, $12
    db OWN | JAVI, $80 | $0e, $12
    db OWN | HAWKEYE, $80 | $0e, $12
    db OWN | SEEKER, $80 | $0e, $12
    db OWN | SEEKER, $80 | $0e, $12
    db OWN | DILLO, $80 | $0e, $12
    db OWN | GRIZZLY, $80 | $0e, $12
    db OWN | GRIZZLY, $80 | $0e, $12
    db OWN | BISON, $80 | $0e, $12
    db OWN | BISON, $80 | $0e, $12
    db OWN | NASHORN, $80 | $0e, $12
    db OWN | FALCO, $20 | $04, $04
    db OWN | FALCO, $20 | $04, $04
    db OWN | JAVI, $20 | $04, $04
    db OWN | BISON, $20 | $04, $04
    db OWN | BISON, $20 | $04, $04
    db OWN | PELICAN, $20 | $04, $04
    db $ff

SECTION "Map A16 Zonect", ROMX

MapA16Zonect::
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
        "MMMMM~MMoMoMM MMMMMMMMM~+MMMM~MM"
    db FOE | HUNTER, $00 | $14, $03
    db FOE | HUNTER, $00 | $13, $03
    db FOE | HUNTER, $00 | $12, $03
    db OWN | RABBIT, $00 | $07, $10
    db OWN | RABBIT, $00 | $08, $11
    db OWN | BISON, $00 | $05, $0d
    db OWN | FALCO, $80 | $01, $0e
    db OWN | FALCO, $80 | $01, $0e
    db OWN | JAVI, $80 | $01, $0e
    db OWN | SEEKER, $80 | $01, $0e
    db OWN | RABBIT, $80 | $01, $0e
    db OWN | LYNX, $80 | $01, $0e
    db OWN | DILLO, $40 | $03, $03
    db OWN | GRIZZLY, $40 | $03, $03
    db OWN | JAVI, $40 | $03, $03
    db OWN | HAWKEYE, $40 | $03, $03
    db OWN | SEEKER, $40 | $03, $03
    db OWN | PELICAN, $40 | $03, $03
    db OWN | RHINO, $40 | $03, $03
    db OWN | MULE, $40 | $03, $03
    db OWN | YAMA, $40 | $03, $03
    db OWN | DARBEK, $40 | $03, $03
    db FOE | MONSTER, $00 | $17, $03
    db FOE | SLAGGER, $00 | $1a, $03
    db FOE | SLAGGER, $00 | $15, $02
    db FOE | MONSTER, $00 | $19, $03
    db FOE | HAWKEYE, $20 | $0f, $02
    db FOE | SEEKER, $20 | $0f, $02
    db FOE | SEEKER, $20 | $0f, $02
    db FOE | SEEKER, $20 | $0f, $02
    db FOE | RABBIT, $20 | $0f, $02
    db FOE | RABBIT, $20 | $0f, $02
    db FOE | HUNTER, $20 | $0f, $02
    db FOE | HUNTER, $20 | $0f, $02
    db FOE | HUNTER, $20 | $0f, $02
    db FOE | NASHORN, $20 | $0f, $02
    db FOE | MULE, $20 | $0f, $02
    db FOE | MUNKS, $20 | $0f, $02
    db FOE | DRAPER, $00 | $11, $01
    db FOE | LYNX, $00 | $10, $01
    db FOE | MONSTER, $60 | $11, $09
    db FOE | SLAGGER, $60 | $11, $09
    db FOE | MULE, $60 | $11, $09
    db FOE | RHINO, $60 | $11, $09
    db OWN | HUNTER, $a0 | $1c, $0f
    db OWN | HUNTER, $a0 | $1c, $0f
    db FOE | DARBEK, $00 | $1b, $02
    db FOE | RHINO, $00 | $0e, $01
    db FOE | RHINO, $00 | $1a, $01
    db FOE | RHINO, $00 | $16, $01
    db OWN | DRAPER, $00 | $08, $10
    db OWN | HAWKEYE, $00 | $06, $0f
    db OWN | NASHORN, $00 | $05, $0f
    db OWN | BISON, $00 | $06, $0d
    db OWN | SEEKER, $00 | $09, $0e
    db $ff
