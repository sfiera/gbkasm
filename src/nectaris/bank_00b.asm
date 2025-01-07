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

SECTION "ROM Bank $00b", ROMX[$4000], BANK[$b]

map_0b_4000::
    db $20, $0b
    db "MMM   +~#~ooo  F  ~~+ MMMMM~oooo" ;map
    db "MMM   + ~ oo##     ++~MMM~M~o   " ;map
    db "MM F  ++    ##   ++~~ MM~ ~~    " ;map
    db "MM     ~+     #+++++++          " ;map
    db "MMMM M ~++++++*  M   +++ d   ~~~" ;map
    db "~MMMMMM++o # ##  MMM +MM+   MMMM" ;map
    db "~~M~~++ oo  #~~~ MMM +M~     MM " ;map
    db "~~~ +      MMMMMMMMM  ++~+ P    " ;map
    db " M  8  ~   MMoMMMMM  # #+ ++    " ;map
    db " MMM   ~~~M~Mooooo~  ~#MM~ +  ~~" ;map
    db " MM   ~M~M~ oMoMo ~M~M#MM~~M ~~M" ;map
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

map_0b_41c6::
    db $20, $0b
    db "~~    ooo ~~~    F  MMMMMMM###oo" ;map
    db "~ 8                 MMM MMM~~#~~" ;map
    db "           MMoMM M ~ ~~M~   ~~# " ;map
    db "oo   M~M~   ooMMMM~oMM     P  # " ;map
    db "o  MM~~~   M~~M~MMo~M           " ;map
    db "~  MMM~M~   ~   ~MMo~o       MMM" ;map
    db "~   Mo##      F  MMM  M       M~" ;map
    db "~   ~ o#~#        ~           ~~" ;map
    db "##~     #  ~~~       # ~~   F  o" ;map
    db "#o#       ~ ~oo~ ~~~ ~#~~~   ~oo" ;map
    db "oM#M M M +  oMoM~ ~M~ # ~M~M~ oM" ;map
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

map_0b_4392::
    db $20, $16
    db "~ ~ ~~o~oMMMMMMMMMMMooo~o   ~~oM" ;map
    db "~~      o oooMMoooMo~ ~      ~~M" ;map
    db "   8     ~ ~ooooo~o     ~ b  ooo" ;map
    db "        ~~~~~~~~~   ~      ~~ooM" ;map
    db "     ~ ~             ~ ~ ~ ooMMM" ;map
    db "~~       ~       ~~ooooo   oM~~~" ;map
    db "oo ~ ~  ~    ~    oMMMM    ~o~MM" ;map
    db "Mo  oo    F       M~o~o~oo ~~~MM" ;map
    db "MM   M o     ~   ~~   ~ ~ ~ Mooo" ;map
    db "o~  oM M~~ ~~~~~    F    ~ o~ooM" ;map
    db "    ~~o~M  ~~ooo M      ~~M~o  M" ;map
    db "       ~   MMMMoooo   ~      ~~M" ;map
    db "oo~       ~ ~ M~M~~    ~   ~~ oM" ;map
    db "~ ~~                   ~~     ~ " ;map
    db "      d ~~~~  ~    ~     P      " ;map
    db "            ~  ~~ooM~          M" ;map
    db "~~~~  ~      ~  M~     ~     ~~M" ;map
    db "o~~~~                 ~ ~~~~~ooM" ;map
    db "oo~o~~~~~~ ~~~~          ~~o~ooM" ;map
    db "oooooooo~~ ~oo~~ ~~~ ~~~~ooooMMM" ;map
    db "oMoMoMoMoooMoMoMMMoM~MoM~MoMMMMM" ;map
    db "MMMMMMM M M MMM M MMM M M MMMoM " ;map
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

map_0b_46e8::
    db $20, $16
    db "  +~  ooMMM~MMMMMMMMMMMoo~ +~+ M" ;map
    db "o~+ 8 ~oooooooMMMMMMM~Moo++ + +M" ;map
    db "o~+   o ~~oMoo~MMoooooo~ +P  ~ M" ;map
    db "oo++      MM~Mo~~ o~ooo~ +  ~~ M" ;map
    db "Mooo++~oo ~oM     ~MM  o +  ~~ M" ;map
    db "MMMoo~+~o    MM     M  oo~+    ~" ;map
    db "MM  o~+  ~oMMM~  ~MM MoMoo+~   ~" ;map
    db "MM    + ~ ooo Mo MMM   Moo+  ~ M" ;map
    db "MM    +~  ~o~   MooMM  Mo~+  o M" ;map
    db "ooo~ ++ ~~ ~o~o o~o M M  ~+ ~o M" ;map
    db "~ ~ +~F  ~ ~     ~o  M~o  + ~ooM" ;map
    db "++++++++  ~~ ~      oooo  +~oooM" ;map
    db "    ~  ~++~ ~  ~     ~o ~~+~oMMM" ;map
    db "  ~  ~    ++~ ~     ~MM  ~+ooMMM" ;map
    db "oo     o ~ ~++   F  ~o   ++~ooMM" ;map
    db "o      ooooo~ ++    ~~M++~~oooMM" ;map
    db "~     ~oMMoo  ~ +++++++ ~~ooooMM" ;map
    db " ~d  ~oMMMMoo~~~    ~      ~oMMM" ;map
    db "  ~~ ooMMMMMooo~ o~     ~~~ooMMM" ;map
    db "~o~ooMMMMMMMMMoMooo~ ~~ooooooMMM" ;map
    db "oMoooMMMMMMMMMMMMMoooooMMMoMMMMM" ;map
    db "MMMMMMMMMMMMMMMoMPMMMMMPMMMMMPMM" ;map
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

map_0b_4a44::
    db $20, $16
    db "MMMMo~o~o~~~~MooMoMoMMMMM~~++M~M" ;map
    db "MMM~o     M~M ~~o~o ooo ~++  ~oM" ;map
    db "MMM~ ~ ~ M     ~       ++P   ooM" ;map
    db "o~~  ~M~oM          ~~ +   ~ooMM" ;map
    db "oo  F o M       ~ ~MM  +  o oMMM" ;map
    db "oo~       ~       o~MM~+~   ~MMM" ;map
    db "Mo~~   ~Mo~M~~F   M~M~o+~~  ~~MM" ;map
    db "MMo~   M~~oMMo~M   M~Mo+~     ~M" ;map
    db "M~oo  ~ Mo ~  o  o~MM ~+~ o   ~M" ;map
    db "M~oo~   ~ooM~~~  o~~ ~ +  Mo~ ~M" ;map
    db "M  ~~     ~~      ~ ~  + ~ oM ~M" ;map
    db "M~  ~  ~     ~M  ~     +  ~ o MM" ;map
    db "o~~          ~M~oM     ~++  ~ MM" ;map
    db "~  ~      ~  ~o~M     ~MoM++  oM" ;map
    db "++++++++~     MM~ o ~~  M~ +~~oM" ;map
    db "       + ~ ~ ~      o~     +  M~" ;map
    db "~~   8 +        oo~ o    d + + +" ;map
    db "oo~o~  +        M~M   Mo    + +~" ;map
    db "MMoMo   ++  ~ F   ~ o~~~MMo~MM~M" ;map
    db "MMMMoo~o  ++    ~   oMM~~~o~MM~M" ;map
    db "MMMMoMoM~M M++ M M M MMMoM~oMMMM" ;map
    db "M M MMMMMMM MM++M MMMMM MMM M MM" ;map
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

map_0b_4d82::
    db $20, $16
    db "  Mo+~oM          ~~oo      o ~M" ;map
    db " MM~+~~oM    ~ + +  ~~       ~~M" ;map
    db "o+++++ ~  ~~~~+d+ ++ + +P+  ~ oo" ;map
    db "+  F  ++ o ~~ ~~    + + +~++++++" ;map
    db "       +~~        ~~~M ~+o~~~   " ;map
    db "  ~~   +  o~M~     ~MM~ ++o    M" ;map
    db "   ~~++   ~~ M~     ~ MM~ ++   M" ;map
    db "    ~+~~~    o  ~~    ~~M~~+   M" ;map
    db "o~  ~+~~    ~  oM  ~      M+~~ M" ;map
    db "oo   +oo~      +~F ~      ~+   M" ;map
    db "~o~  +~o~~ ~~++~+ ~o~~    ~+~~ M" ;map
    db " ~oo  ++o   +o     ~M    ++ ~o~o" ;map
    db "  ~oo~o+  M +~      o   +~~ MMoM" ;map
    db "    ~~~+++Mo+~      ~~o+++~ oMMM" ;map
    db " b    M+~+  +~o      ++  +~   MM" ;map
    db "     ++  + o++~oo~ ++ ~~ M++F MM" ;map
    db " + ++    + ~  ++~++~    ~~MM++++" ;map
    db "+ +    8 +  ~~  + ++~   ~~~~ooMM" ;map
    db "    oo   +  ~M~~~~~~++~~  ~ ~~oM" ;map
    db " MMM ooo + ooo Moooo~~++      ~M" ;map
    db "MMMMMMMMo+oMMMMMMMMMMMM~+~MMMMMM" ;map
    db "MMMMM~MMoMoMM MMMMMMMMM~+MMMM~MM" ;map
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

map_0b_50ea::
    db $10, $0b
    db "MoMMM~# ~ ~~~MMM" ;map
    db "ooo~M ##    ~~~~" ;map
    db "oo~    *++++++++" ;map
    db "o    ++#     P  " ;map
    db "o  ++  M#      ~" ;map
    db " 8 + ~ M#o~    M" ;map
    db " + + o~M oo~~ ~o" ;map
    db "+ + ~oMMMMoo~~oM" ;map
    db "   ~~~ooMMMMo~MM" ;map
    db "oo~~~oooMMMMMMMM" ;map
    db "oMoMoMMMMoM MMMo" ;map
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

map_0b_51d0::
    db $10, $0b
    db "M Moo ~   oMM   " ;map
    db "M8           ~ o" ;map
    db "       o o  o oo" ;map
    db "    ~~ MMMoo  oo" ;map
    db "  ~~    MMo   o " ;map
    db "     o  M       " ;map
    db "    ooo        ~" ;map
    db "oooM~MMM ~~M P ~" ;map
    db "o  o  oooo~~   ~" ;map
    db " ~~ o ~ MM~~   ~" ;map
    db " M M M M MoMMMMo" ;map
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

map_0b_52bc::
    db $10, $0b
    db "MMMMM  # ~     ~" ;map
    db "MMMMM ##  M ~P  " ;map
    db "M MMM #+ + + + +" ;map
    db "     +*#+ +~+ +M" ;map
    db "M ~++ MM   ~d   " ;map
    db " ++ o MM  ~   ~ " ;map
    db "+     oMMM  o~  " ;map
    db "  8   ooMo    oM" ;map
    db "    ~  MooMoMMMM" ;map
    db "oo Mo  MoMoMMMMM" ;map
    db "MM ~ MMMM MMMMM " ;map
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

map_0b_53c0::
    db $10, $0b
    db "Mooo           ~" ;map
    db "M     F         " ;map
    db "M        oo o  o" ;map
    db "  o o     o     " ;map
    db "    ~oo~o       " ;map
    db "      o ~o  P  o" ;map
    db "o      ~ o      " ;map
    db " 8     o        " ;map
    db "        o ~   MM" ;map
    db "    o      Mo  M" ;map
    db " M M M  MMMM M M" ;map
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

map_0b_549a::
    db $10, $16
    db "MMMoo   ~   ooMM" ;map
    db "Mo~    ~ o   ~MM" ;map
    db "Mo    oMMM~   oM" ;map
    db "o     oMMo     ~" ;map
    db "o~  8 MMM~F    ~" ;map
    db "~    ooMMMo   ~M" ;map
    db "M~   MMMMM~   ~M" ;map
    db "Mo  ~MMMMMM  ~oM" ;map
    db "MM~ oMMMMMM  ooM" ;map
    db "Mo~ MMMMM~M  oMM" ;map
    db "Mo  ~MMMM~    MM" ;map
    db "MM  oMMMMM o ~MM" ;map
    db "M   ~ooMMMMo MoM" ;map
    db "M~   ooMMMM~ oMM" ;map
    db "~F   oMMMMo   MM" ;map
    db "    ~MMMMMM   MM" ;map
    db "    MMMMMoP  ~MM" ;map
    db "o   o~M~M     ~M" ;map
    db "Mo            oM" ;map
    db "MMo  ~~      ooM" ;map
    db "MM~M~M~M~M~M~MMM" ;map
    db "MMMoMMMMMMM MMMM" ;map
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

map_0b_565d::
    db $10, $16
    db "~  ~          ~M" ;map
    db " 8        F  ~ M" ;map
    db "     ~  ~      M" ;map
    db "          ~    M" ;map
    db "   ~ ~ ~    ~  M" ;map
    db "~  o~MoMoo~~   M" ;map
    db "M~~MMoMoMoo   ~M" ;map
    db "MMM~o ~ ~  ~~oMM" ;map
    db "MMoo      ooooMM" ;map
    db "MM~~   F   ~oM~M" ;map
    db "oMM        MMMMM" ;map
    db "~ ~ o~    ~MMMMM" ;map
    db "~   oMoo~ooMo~oM" ;map
    db "    ~oMMoMM~o ~M" ;map
    db " ~    ~~~~~   ~M" ;map
    db "    ~          M" ;map
    db " F        ~    M" ;map
    db "    ~ ~     P  M" ;map
    db "~       ~      M" ;map
    db "~~ ~ ~~      ~~M" ;map
    db "MM~M~M~M~M~M~M~M" ;map
    db "MMM M M MMM MMMM" ;map
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

map_0b_5844::
    db $10, $16
    db "o~ ~oMMMo ~~o ~M" ;map
    db "~8 MoMo~~     oM" ;map
    db "   MoMo~   o  ~M" ;map
    db "   oMMo   MM   M" ;map
    db "~  ~Mo~  oMM~ ~M" ;map
    db "  MMMo~  MMMo oM" ;map
    db "  oMMM  ~MoMo oM" ;map
    db "   ooM  MoMo  oM" ;map
    db "  ooM~  MMM    M" ;map
    db "~  oMMF ~Mo~ o~M" ;map
    db "~~ MM   oMo  oMM" ;map
    db "~  Mo    MM   ~M" ;map
    db "~ MMM  ~oMM  ~oM" ;map
    db "  MMo  MMoo~  ~M" ;map
    db " oMM   MMoo   ~M" ;map
    db " oMM   MM~    oM" ;map
    db "  M   ~MM~ P  ~M" ;map
    db "     ~oMoM ~ ~~M" ;map
    db "oo~o~MMooMooo~oM" ;map
    db "ooo~oMMMMMMMMMMM" ;map
    db "MMMMMMMMMMMMMMMM" ;map
    db "MMMM M MM M~MMMM" ;map
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

map_0b_59f8::
    db $10, $16
    db "MMo Moo~MMMMMMoM" ;map
    db "MoM~  ~ ~o~o~MoM" ;map
    db "M~   ~    ~   MM" ;map
    db "MM P  o~ ~o  o~M" ;map
    db "Mo   ~o     ~~~M" ;map
    db "M~o     oM~    M" ;map
    db "o   ~M~    F  ~M" ;map
    db " ~~~ o ~oo~~ ~oM" ;map
    db "  Mo         ~~M" ;map
    db "~    ~ ~Mo~o ooM" ;map
    db "oo~ oM o  M~ ~~M" ;map
    db "o~ ~~   ~     oM" ;map
    db "o  F  ~o Mo ~ ~M" ;map
    db "~~   M~ M~ o ~~M" ;map
    db "o~~    ~   M  oM" ;map
    db "o  ~ ~ oM ~ ~o~M" ;map
    db "~ ~ oM       ~MM" ;map
    db "o M~   M  8  M~M" ;map
    db "oM  ~~ ~~   ~MoM" ;map
    db "MM o M o ~ ~M~oM" ;map
    db "MMMMMM~M M~MoMMM" ;map
    db "MMMMMMM MMMMM MM" ;map
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

map_0b_5bd0::
    db $20, $0b
    db "#oo    MM~~ ~MM~MM~   ~~    ~#~~" ;map
    db "## 8  MMM~~     M    ~~    F  ##" ;map
    db " #    MMMM F                 ##M" ;map
    db "       MMM    ~~       M MooooMM" ;map
    db "        MMMo oMMMM    MMMMMMoooo" ;map
    db " ~MM     ~ooooooM~     MM ooo oo" ;map
    db "~~M       ~~~   ~~~  # ##       " ;map
    db "~     ## #~      MM~~~#+++++P   " ;map
    db "~ F    # ##M  F   M ~+*oo       " ;map
    db "     ~#~~###M      ++~##o    ooo" ;map
    db " M M~ ~M#   #M~M P+M~M o~M M  oM" ;map
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

map_0b_5da5::
    db $20, $0b
    db "MMMM+   ooooMMMMMMMMM#~##~ +~~~~" ;map
    db "~~M++ P  MMMMMMMM MMoo#~~  b  ~o" ;map
    db "~ +      MMMMMM~~   o## ~++   oo" ;map
    db "  d    #MMM MMM~ #     ++  M    " ;map
    db "  + ### MM F    ~##++++  MMMM   " ;map
    db "  ++~*++++       +*~~~   MMM    " ;map
    db "oo  +# ~~++++++++ ##oo  MMM  8  " ;map
    db "oM~MMM# ~+~~~      #o~ MMMMM    " ;map
    db "MMMMM##  +~oo  F  ~M~~~MM~M    o" ;map
    db "MMMMM~~  +  o     MMMMMMM~~~  oo" ;map
    db "MMMMM ~M M + M M +MMM M ~M~M ~oM" ;map
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

map_0b_5f92::
    db $20, $0b
    db "MMM   +~#~ooo  F  ~~+ MMMMM~oooo" ;map
    db "MMM   + ~ oo##     ++~MMM~M~o   " ;map
    db "MM F  ++    ##   ++~~ MM~ ~~    " ;map
    db "MM     ~+     #+++++++          " ;map
    db "MMMM M ~++++++*  M   +++ d   ~~~" ;map
    db "~MMMMMM++o # ##  MMM +MM+   MMMM" ;map
    db "~~M~~++ oo  #~~~ MMM +M~     MM " ;map
    db "~~~ +      MMMMMMMMM  ++~+ P    " ;map
    db " M  8  ~   MMoMMMMM  # #+ ++    " ;map
    db " MMM   ~~~M~Mooooo~  ~#MM~ +  ~~" ;map
    db " MMM  ~M~M~ o o~o ~M~M#~MM~M M~ " ;map
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

map_0b_6146::
    db $20, $0b
    db "~~    ooo ~~~    F  MMMMMMM###oo" ;map
    db "~ 8                 MMM MMM~~#~~" ;map
    db "           MMoMM M ~ ~~M~   ~~# " ;map
    db "oo   M~M~   ooMMMM~oMM     P  # " ;map
    db "o  MM~~~   M~~M~MMo~M           " ;map
    db "~  MMM~M~   ~   ~MMo~o       MMM" ;map
    db "~   Mo##      F  MMM  M       M~" ;map
    db "~   ~ o#~#        ~           ~~" ;map
    db "##~     #  ~~~       # ~~   F  o" ;map
    db "#o#       ~ ~oo~ ~~~ ~#~~~   ~oo" ;map
    db "oM#M   M M  o oM~M~M~M#M~M~M~~o " ;map
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

map_0b_62f4::
    db $20, $16
    db "~ ~ ~~o~oMMMMMMMMMMMooo~o   ~~oM" ;map
    db "~~      o oooMMoooMo~ ~      ~~M" ;map
    db "   8     ~ ~ooooo~o     ~ b  ooo" ;map
    db "        ~~~~~~~~~   ~      ~~ooM" ;map
    db "     ~ ~             ~ ~ ~ ooMMM" ;map
    db "~~       ~       ~~ooooo   oM~~~" ;map
    db "oo ~ ~  ~    ~    oMMMM    ~o~MM" ;map
    db "Mo  oo    F       M~o~o~oo ~~~MM" ;map
    db "MM   M o     ~   ~~   ~ ~ ~ Mooo" ;map
    db "o~  oM M~~ ~~~~~    F    ~ o~ooM" ;map
    db "    ~~o~M  ~~ooo M      ~~M~o  M" ;map
    db "       ~   MMMMoooo   ~      ~~M" ;map
    db "oo~       ~ ~ M~M~~    ~   ~~ oM" ;map
    db "~ ~~                   ~~     ~ " ;map
    db "      d ~~~~  ~    ~     P      " ;map
    db "            ~  ~~ooM~          M" ;map
    db "~~~~  ~      ~  M~     ~     ~~M" ;map
    db "o~~~~                 ~ ~~~~~ooM" ;map
    db "oo~o~~~~~~ ~~~~          ~~o~ooM" ;map
    db "oooooooo~~ ~oo~~ ~~~ ~~~~ooooMMM" ;map
    db "oMoMoMoMoooMoMoMMMoM~MoM~MoMMMMM" ;map
    db "MMMMM MMMMM M M M M MoM M M MMMM" ;map
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

map_0b_665f::
    db $20, $16
    db "  +~  ooMMM~MMMMMMMMMMMoo~ +~+ M" ;map
    db "o~+ 8 ~oooooooMMMMMMM~Moo++ + +M" ;map
    db "o~+   o ~~oMoo~MMoooooo~ +P  ~ M" ;map
    db "oo++      MM~Mo~~ o~ooo~ +  ~~ M" ;map
    db "Mooo++~oo ~oM     ~MM  o +  ~~ M" ;map
    db "MMMoo~+~o    MM     M  oo~+    ~" ;map
    db "MM  o~+  ~oMMM~  ~MM MoMoo+~   ~" ;map
    db "MM    + ~ ooo Mo MMM   Moo+  ~ M" ;map
    db "MM    +~  ~o~   MooMM  Mo~+  o M" ;map
    db "ooo~ ++ ~~ ~o~o o~o M M  ~+ ~o M" ;map
    db "~ ~ +~F  ~ ~     ~o  M~o  + ~ooM" ;map
    db "++++++++  ~~ ~      oooo  +~oooM" ;map
    db "    ~  ~++~ ~  ~     ~o ~~+~oMMM" ;map
    db "  ~  ~    ++~ ~     ~MM  ~+ooMMM" ;map
    db "oo     o ~ ~++   F  ~o   ++~ooMM" ;map
    db "o      ooooo~ ++    ~~M++~~oooMM" ;map
    db "~     ~oMMoo  ~ +++++++ ~~ooooMM" ;map
    db " ~d  ~oMMMMoo~~~    ~      ~oMMM" ;map
    db "  ~~ ooMMMMMooo~ o~     ~~~ooMMM" ;map
    db "~o~ooMMMMMMMMMoMooo~ ~~ooooooMMM" ;map
    db "oMoooMMMMMMMMMMMMMoooooMMMoMMMMM" ;map
    db "MMMoM MMMMMMMMMMMMMMMMMMMMMoMMMM" ;map
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

map_0b_69b5::
    db $20, $16
    db "MMMMo~o~o~~~~MooMoMoMMMMM~~++M~M" ;map
    db "MMM~o     M~M ~~o~o ooo ~++  ~oM" ;map
    db "MMM~ ~ ~ M     ~       ++P   ooM" ;map
    db "o~~  ~M~oM          ~~ +   ~ooMM" ;map
    db "oo  F o M       ~ ~MM  +  o oMMM" ;map
    db "oo~       ~       o~MM~+~   ~MMM" ;map
    db "Mo~~   ~Mo~M~~F   M~M~o+~~  ~~MM" ;map
    db "MMo~   M~~oMMo~M   M~Mo+~     ~M" ;map
    db "M~oo  ~ Mo ~  o  o~MM ~+~ o   ~M" ;map
    db "M~oo~   ~ooM~~~  o~~ ~ +  Mo~ ~M" ;map
    db "M  ~~     ~~      ~ ~  + ~ oM ~M" ;map
    db "M~  ~  ~     ~M  ~     +  ~ o MM" ;map
    db "o~~          ~M~oM     ~++  ~ MM" ;map
    db "~  ~      ~  ~o~M     ~MoM++  oM" ;map
    db "++++++++~     MM~ o ~~  M~ +~~oM" ;map
    db "       + ~ ~ ~      o~     +  M~" ;map
    db "~~   8 +        oo~ o    d + + +" ;map
    db "oo~o~  +        M~M   Mo    + +~" ;map
    db "MMoMo   ++  ~ F   ~ o~~~MMo~MM~M" ;map
    db "MMMMoo~o  ++    ~   oMM~~~o~MM~M" ;map
    db "MMMMoMoM~M M++ M M M MMMoM~oMMMM" ;map
    db "M M+M MMMMM MM+MM MMMMM MMMMMMM " ;map
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

map_0b_6d05::
    db $20, $16
    db "  Mo+~oM          ~~oo      o ~M" ;map
    db " MM~+~~oM    ~ + +  ~~       ~~M" ;map
    db "o+++++ ~  ~~~~+d+ ++ + +P+  ~ oo" ;map
    db "+  F  ++ o ~~ ~~    + + +~++++++" ;map
    db "       +~~        ~~~M ~+o~~~   " ;map
    db "  ~~   +  o~M~     ~MM~ ++o    M" ;map
    db "   ~~++   ~~ M~     ~ MM~ ++   M" ;map
    db "    ~+~~~    o  ~~    ~~M~~+   M" ;map
    db "o~  ~+~~    ~  oM  ~      M+~~ M" ;map
    db "oo   +oo~      +~F ~      ~+   M" ;map
    db "~o~  +~o~~ ~~++~+ ~o~~    ~+~~ M" ;map
    db " ~oo  ++o   +o     ~M    ++ ~o~o" ;map
    db "  ~oo~o+  M +~      o   +~~ MMoM" ;map
    db "    ~~~+++Mo+~      ~~o+++~ oMMM" ;map
    db " b    M+~+  +~o      ++  +~   MM" ;map
    db "     ++  + o++~oo~ ++ ~~ M++F MM" ;map
    db " + ++    + ~  ++~++~    ~~MM++++" ;map
    db "+ +    8 +  ~~  + ++~   ~~~~ooMM" ;map
    db "    oo   +  ~M~~~~~~++~~  ~ ~~oM" ;map
    db " MMM ooo + ooo Moooo~~++      ~M" ;map
    db "MMMMMMMMo+oMMMMMMMMMMMM~+~MMMMMM" ;map
    db "MMMMMMM oMoMM MMMMMMMMM + MoMMMM" ;map
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
