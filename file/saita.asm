; Disassembly of "gbkiss.gb"

INCLUDE "charmap.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db kFileMarkerTriangle
    db CartridgeCodeUniversal  ; where file can run
    db Body - @ - 1          ; length of variable parts of header
    db $76                     ; owner code

Title::
    dk "MUSIC.さいたさいた"

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
    db $40, $f7, $a7                           ; unknown pattern start
    db $31, $33, $35, $83, $31, $33, $35, $83  ; c d e - c d e -
    db $38, $35, $33, $31, $33, $35, $33, $83  ; g e d c d e d -
    db $31, $33, $35, $83, $31, $33, $35, $83  ; c d e - c d e -
    db $38, $35, $33, $31, $33, $35, $31, $83  ; g e d c d e c -
    db $38, $38, $35, $38, $3a, $3a, $38, $83  ; g g e g a a g -
    db $35, $35, $33, $33, $51, $83            ; e e d d c2 -
    db $b0                                     ; unknown pattern end
.end

End:
