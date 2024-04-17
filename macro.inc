; Disassembly of "gbkiss.gb"

MACRO vcall
    rst $08
    db \1
ENDM

MACRO rpush
    rst $10
    dw \1 - @
ENDM

MACRO TableEntry
    db $46, BANK(\1)
    dw \1
SHIFT
REPT _NARG
    db \1
    SHIFT
ENDR
ENDM

MACRO TableBlank
    ds 4, $00
ENDM
