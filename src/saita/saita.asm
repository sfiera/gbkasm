; Disassembly of "saita.gbf"

INCLUDE "src/charmap.inc"
INCLUDE "src/common.inc"
INCLUDE "src/hardware.inc"
INCLUDE "src/macro.inc"
INCLUDE "src/trap.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_DATA
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $76           ; owner code
.title
    dk "MUSIC.さいたさいた"
.icon
.end

History:
.end

Body::
    db AlarmTitle.end - AlarmTitle
AlarmTitle:
PUSHC
SETCHARMAP PlainText
    dp "さいたさいた"            ; alarm title: さいたさいた
POPC
.end

    db Pattern.end - Pattern
Pattern:
    db $40, $f7, $a7                           ; pattern start, tempo, 1=C4
    db $31, $33, $35, $83, $31, $33, $35, $83  ; c d e - c d e -
    db $38, $35, $33, $31, $33, $35, $33, $83  ; g e d c d e d -
    db $31, $33, $35, $83, $31, $33, $35, $83  ; c d e - c d e -
    db $38, $35, $33, $31, $33, $35, $31, $83  ; g e d c d e c -
    db $38, $38, $35, $38, $3a, $3a, $38, $83  ; g g e g a a g -
    db $35, $35, $33, $33, $51, $83            ; e e d d c2 -
    db $b0                                     ; pattern end
.end
