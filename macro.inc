; Disassembly of "gbkiss.gb"

MACRO trap
    rst $08
    db \1
ENDM

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

MACRO TableEntry
    db $46, BANK(\1)
    dw \1
SHIFT
REPT _NARG
    dk \1
    SHIFT
ENDR
ENDM

MACRO TableBlank
    ds 4, $00
ENDM
