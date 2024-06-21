; Disassembly of "passwords.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db Points - @ - 1          ; length of variable parts of header
    db $81                     ; owner code

Title::
    dk "Passwords"

Points::
    dw 190
Author::
    dp "GBKiss.org", 00
History::
    ds 11, $00
    ds 11, $00
    ds 11, $00

Body::
    dp "1: KISSMON       "
    dp "2: CANNON        "
    dp "3: BINARY        "
    dp "4: GAMEDATA      "
    dp "5: KISSTOOL      "
    dp "                 "
    dp "                 "
    dp "                 "

End::
