; Disassembly of "gbkiss.gb"

MACRO pushx
    rst $10
    dw \1 - @
ENDM

MACRO callx
    pushx @+6
    pushx \1
    ret
ENDM

MACRO jx
    pushx \1
    ret
ENDM

MACRO ldx
    pushx \2
    pop \1
ENDM
