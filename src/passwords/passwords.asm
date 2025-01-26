; Disassembly of "passwords.gbf"

INCLUDE "src/charmap.inc"
INCLUDE "src/common.inc"
INCLUDE "src/hardware.inc"
INCLUDE "src/macro.inc"
INCLUDE "src/trap.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_DATA | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $81           ; owner code
.title
    dk "Passwords"
.icon
.end

History:
.points
    dw 190
.author
    dp "GBKiss.org", 0
.history
    ds 11
    ds 11
    ds 11
.end

Body::
    dp "1: KISSMON       "
    dp "2: CANNON        "
    dp "3: BINARY        "
    dp "4: GAMEDATA      "
    dp "5: KISSTOOL      "
    dp "                 "
    dp "                 "
    dp "                 "
