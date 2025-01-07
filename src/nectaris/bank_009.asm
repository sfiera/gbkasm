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

SECTION "ROM Bank $009", ROMX[$4000], BANK[$9]

map_09_4000::
    db $20, $16, $02, $02, $02, $02, $02, $02, $05, $05, $05, $05, $00, $00, $00, $00
    db $00, $02, $02, $02, $00, $00, $05, $05, $05, $05, $05, $00, $00, $02, $02, $05
    db $05, $05, $02, $00, $00, $00, $02, $02, $05, $05, $05, $05, $0c, $00, $00, $05
    db $00, $05, $02, $02, $00, $00, $00, $00, $05, $00, $00, $0b, $00, $00, $00, $00
    db $05, $05, $00, $00, $0d, $00, $00, $00, $05, $05, $05, $05, $00, $05, $05, $05
    db $05, $05, $05, $05, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $05
    db $05, $05, $02, $02, $00, $00, $00, $00, $00, $03, $05, $05, $05, $05, $05, $05
    db $05, $05, $05, $05, $00, $00, $02, $00, $00, $02, $00, $00, $00, $02, $00, $05
    db $05, $05, $02, $02, $02, $05, $00, $00, $00, $05, $03, $05, $05, $05, $00, $00
    db $05, $05, $05, $05, $05, $00, $00, $02, $02, $00, $00, $05, $00, $05, $00, $00
    db $05, $05, $02, $00, $02, $05, $05, $05, $00, $00, $03, $05, $05, $05, $02, $02
    db $00, $00, $05, $00, $00, $00, $00, $00, $02, $05, $05, $05, $05, $05, $05, $00
    db $00, $00, $00, $02, $00, $00, $05, $05, $05, $00, $00, $05, $05, $00, $02, $00
    db $02, $00, $02, $02, $00, $08, $00, $00, $00, $05, $05, $05, $05, $05, $05, $00
    db $00, $00, $05, $05, $05, $05, $05, $05, $00, $03, $00, $05, $05, $05, $05, $05
    db $05, $05, $02, $02, $02, $00, $00, $02, $00, $05, $05, $05, $05, $05, $05, $00
    db $02, $00, $05, $05, $05, $05, $05, $05, $05, $05, $00, $05, $05, $05, $05, $05
    db $05, $00, $05, $02, $00, $00, $02, $02, $02, $02, $00, $00, $00, $00, $00, $02
    db $00, $00, $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $05, $05, $05, $05
    db $05, $00, $00, $05, $00, $05, $00, $00, $02, $00, $00, $00, $00, $00, $00, $02
    db $00, $00, $05, $05, $05, $00, $00, $05, $05, $00, $02, $02, $00, $00, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $02, $02
    db $00, $05, $05, $05, $00, $0a, $00, $05, $05, $05, $02, $02, $00, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $05, $05, $05, $00, $00
    db $00, $00, $05, $05, $00, $00, $00, $05, $05, $05, $05, $05, $00, $05, $05, $05
    db $05, $05, $05, $05, $05, $00, $00, $00, $00, $05, $05, $05, $05, $05, $00, $00
    db $00, $00, $05, $05, $00, $00, $00, $00, $05, $05, $05, $00, $00, $05, $05, $00
    db $05, $05, $05, $05, $00, $00, $00, $05, $05, $05, $05, $05, $05, $00, $00, $05
    db $00, $00, $05, $05, $05, $00, $00, $00, $05, $00, $00, $0d, $00, $00, $00, $00
    db $00, $00, $05, $05, $05, $00, $05, $05, $05, $05, $05, $05, $05, $00, $00, $00
    db $00, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $02, $05, $05, $05, $05, $05, $05, $05, $00, $00, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $05, $05, $05
    db $00, $05, $00, $00, $02, $02, $05, $05, $05, $05, $05, $00, $00, $00, $00, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $05, $05, $05
    db $05, $05, $05, $05, $02, $00, $05, $05, $05, $00, $00, $00, $00, $02, $02, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $0b, $00, $00, $05, $02, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $00, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $05, $00
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00
    db $05, $05, $05, $05, $05, $00, $05, $05, $05, $05, $05, $05, $00, $05, $05, $05
    db $05, $00, $05, $03, $05, $05, $05, $00, $05, $05, $05, $05, $00, $00, $00, $03
    db $05, $05, $05, $22, $02, $05, $22, $02, $12, $22, $02, $13, $22, $02, $14, $22
    db $02, $0d, $22, $02, $0d, $22, $02, $06, $22, $02, $0e, $22, $02, $0c, $22, $02
    db $15, $59, $01, $11, $59, $01, $88, $22, $02, $88, $22, $02, $87, $22, $02, $87
    db $22, $02, $8a, $22, $02, $8a, $22, $02, $14, $59, $01, $12, $59, $01, $0d, $59
    db $01, $0d, $59, $01, $04, $59, $01, $06, $59, $01, $06, $59, $01, $06, $59, $01
    db $05, $59, $01, $0e, $59, $01, $0f, $22, $02, $0f, $22, $02, $16, $6a, $01, $80
    db $0b, $00, $0f, $59, $01, $12, $98, $12, $0d, $98, $12, $04, $98, $12, $14, $98
    db $12, $06, $98, $12, $0b, $98, $12, $0e, $98, $12, $15, $a9, $0e, $0f, $98, $12
    db $91, $07, $09, $80, $a9, $0e, $8c, $a9, $0e, $06, $a9, $0e, $8d, $a9, $0e, $88
    db $a9, $0e, $8a, $a9, $0e, $87, $a9, $0e, $87, $a9, $0e, $88, $a9, $0e, $91, $05
    db $0e, $06, $98, $12, $ff

map_09_4365::
    db $20, $16, $05, $05, $05, $05, $02, $02, $02, $01, $03
    db $03, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $03, $03, $03, $00, $00
    db $00, $00, $00, $02, $02, $02, $00, $05, $05, $05, $05, $02, $00, $00, $01, $03
    db $00, $05, $05, $05, $03, $00, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $02, $02, $02, $00, $05, $05, $05, $00, $00, $00, $00, $01, $03
    db $00, $05, $05, $00, $03, $03, $03, $05, $00, $00, $00, $04, $04, $00, $01, $01
    db $01, $00, $08, $00, $00, $00, $00, $00, $05, $05, $00, $00, $00, $01, $00, $00
    db $00, $00, $00, $03, $00, $03, $00, $00, $00, $00, $00, $00, $06, $01, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00, $00
    db $00, $00, $00, $00, $00, $00, $0b, $00, $01, $00, $01, $01, $04, $00, $05, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $02, $00, $00, $00, $00, $00, $00, $01, $00, $00, $04, $00, $05, $05
    db $05, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $00, $00, $05, $00, $05, $05
    db $05, $02, $02, $02, $02, $00, $00, $00, $00, $00, $03, $03, $03, $04, $05, $05
    db $05, $05, $00, $00, $05, $05, $00, $00, $00, $00, $00, $00, $05, $05, $00, $05
    db $00, $03, $03, $02, $00, $05, $05, $00, $05, $05, $03, $03, $03, $04, $00, $05
    db $05, $05, $05, $05, $05, $05, $00, $05, $05, $00, $05, $05, $05, $00, $03, $00
    db $03, $03, $03, $03, $00, $05, $05, $05, $05, $05, $03, $03, $00, $00, $00, $05
    db $05, $05, $05, $05, $05, $05, $00, $05, $05, $05, $05, $05, $05, $00, $03, $03
    db $03, $03, $03, $03, $03, $05, $05, $05, $05, $05, $00, $00, $00, $00, $03, $00
    db $05, $05, $05, $05, $05, $05, $00, $05, $05, $05, $05, $05, $00, $00, $00, $03
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03
    db $03, $05, $05, $05, $00, $00, $00, $05, $05, $05, $05, $05, $00, $00, $00, $00
    db $00, $00, $00, $0c, $00, $00, $00, $03, $03, $03, $05, $00, $05, $00, $00, $03
    db $03, $00, $00, $00, $00, $00, $00, $05, $05, $05, $00, $00, $01, $00, $05, $05
    db $05, $00, $00, $00, $00, $00, $00, $03, $03, $03, $05, $05, $05, $05, $00, $03
    db $03, $03, $03, $00, $00, $00, $00, $05, $00, $00, $00, $00, $01, $00, $05, $05
    db $05, $05, $05, $00, $05, $00, $00, $00, $03, $03, $00, $05, $05, $05, $00, $03
    db $03, $03, $00, $00, $05, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $05
    db $05, $05, $00, $05, $05, $05, $05, $00, $00, $00, $00, $05, $00, $00, $03, $03
    db $03, $00, $00, $05, $05, $05, $00, $00, $00, $00, $00, $01, $00, $01, $00, $05
    db $05, $00, $00, $00, $00, $05, $05, $05, $00, $00, $00, $03, $03, $03, $03, $03
    db $00, $00, $00, $05, $05, $05, $00, $00, $0d, $00, $01, $01, $00, $01, $00, $00
    db $00, $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $00, $00, $03, $03, $00
    db $00, $0c, $00, $00, $05, $05, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00
    db $01, $00, $0a, $00, $00, $00, $00, $05, $05, $05, $05, $05, $00, $03, $03, $00
    db $00, $00, $00, $00, $05, $05, $00, $00, $00, $00, $05, $00, $00, $00, $01, $01
    db $00, $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $05, $00, $03, $00, $00
    db $05, $00, $05, $05, $05, $05, $00, $05, $05, $05, $05, $05, $00, $00, $01, $00
    db $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $02, $00, $02, $00, $00, $05
    db $05, $05, $05, $05, $05, $05, $00, $05, $05, $05, $05, $05, $00, $00, $01, $00
    db $00, $00, $00, $00, $00, $05, $05, $05, $00, $02, $02, $02, $02, $02, $02, $05
    db $05, $05, $05, $05, $05, $05, $00, $05, $00, $05, $05, $00, $05, $00, $05, $00
    db $02, $00, $05, $00, $00, $00, $00, $05, $00, $02, $00, $02, $00, $02, $05, $05
    db $05, $05, $05, $05, $03, $05, $05, $80, $05, $0b, $80, $06, $0c, $83, $81, $10
    db $88, $81, $10, $87, $81, $10, $90, $81, $10, $92, $81, $10, $83, $01, $0e, $88
    db $6c, $0b, $0d, $6c, $0b, $0e, $6c, $0b, $03, $6c, $0b, $91, $0b, $0e, $12, $1b
    db $05, $87, $81, $10, $88, $81, $10, $8c, $81, $10, $88, $04, $0f, $89, $0a, $11
    db $87, $07, $11, $93, $0c, $0f, $92, $02, $0c, $06, $ba, $10, $0a, $ba, $10, $0d
    db $ba, $10, $0e, $ba, $10, $01, $2f, $04, $01, $2f, $04, $05, $2f, $04, $04, $2f
    db $04, $0d, $2f, $04, $0e, $2f, $04, $0f, $2f, $04, $0c, $2f, $04, $13, $2f, $04
    db $16, $2f, $04, $8b, $6c, $0b, $88, $81, $10, $87, $6c, $0b, $06, $42, $06, $0a
    db $42, $06, $0f, $42, $06, $13, $42, $06, $96, $81, $10, $93, $81, $10, $ff

map_09_46af::
    db $20
    db $16, $05, $05, $05, $05, $05, $05, $05, $00, $02, $02, $02, $02, $02, $02, $00
    db $00, $02, $00, $00, $03, $03, $03, $00, $00, $05, $05, $05, $05, $05, $05, $05
    db $00, $05, $05, $05, $05, $05, $05, $00, $00, $00, $03, $00, $00, $02, $00, $00
    db $00, $00, $00, $0c, $03, $03, $03, $00, $00, $05, $05, $05, $05, $05, $05, $05
    db $00, $05, $05, $05, $05, $05, $00, $00, $00, $00, $03, $03, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $03, $00, $00, $00, $00, $05, $05, $05, $05, $05, $05
    db $00, $05, $05, $05, $05, $05, $00, $00, $00, $0c, $00, $03, $00, $00, $00, $00
    db $05, $05, $05, $00, $00, $00, $00, $00, $00, $03, $00, $05, $00, $05, $00, $00
    db $00, $05, $05, $05, $05, $00, $00, $03, $00, $00, $00, $02, $00, $00, $00, $05
    db $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $05, $05, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $05
    db $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $05, $05, $05, $03, $00, $00, $00, $00, $00, $05, $00, $00, $00, $00, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $05, $05, $00, $00, $00, $05, $05, $05, $05, $05, $05, $05, $00, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $05, $00, $00, $00, $00, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00, $0d, $00, $00, $00
    db $00, $05, $00, $00, $00, $00, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $05, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $05, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $0b, $00, $00, $05, $05, $05, $05, $05, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $02, $02, $02, $05, $05, $05, $00, $00, $00, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $03, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $02, $02, $05, $05, $05, $05, $00, $00, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $02, $00, $03, $03, $00, $00, $00, $00
    db $00, $00, $00, $03, $00, $00, $00, $05, $05, $05, $05, $05, $05, $00, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $02, $02, $03, $03, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $03, $00, $05
    db $00, $05, $00, $00, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $03, $00
    db $00, $00, $08, $00, $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $05, $00
    db $05, $00, $05, $00, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $03, $03
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $0a, $00, $00, $03, $03
    db $00, $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03
    db $00, $00, $00, $00, $05, $00, $05, $05, $00, $05, $05, $05, $05, $05, $05, $05
    db $05, $05, $00, $05, $05, $05, $00, $00, $03, $00, $05, $00, $01, $00, $03, $00
    db $05, $91, $09, $0e, $01, $01, $10, $01, $00, $12, $01, $84, $0c, $14, $01, $12
    db $02, $84, $0c, $0d, $84, $0c, $0e, $84, $0c, $10, $84, $0c, $0f, $84, $0c, $02
    db $02, $13, $82, $0b, $02, $83, $48, $03, $83, $48, $03, $8a, $48, $03, $8d, $48
    db $03, $88, $48, $03, $10, $32, $01, $8f, $32, $01, $81, $7b, $08, $81, $7b, $08
    db $83, $7b, $08, $06, $7b, $08, $0a, $7b, $08, $0d, $7b, $08, $0b, $7b, $08, $07
    db $7b, $08, $8b, $19, $12, $16, $84, $0c, $82, $1b, $0f, $06, $02, $11, $06, $01
    db $0f, $10, $03, $12, $81, $0a, $05, $8a, $05, $05, $86, $05, $03, $8b, $08, $05
    db $88, $10, $01, $87, $18, $04, $93, $1a, $13, $96, $1c, $0b, $12, $03, $10, $90
    db $0e, $12, $90, $12, $11, $93, $0a, $06, $0b, $84, $0c, $02, $05, $11, $03, $32
    db $01, $03, $32, $01, $8d, $1b, $11, $81, $32, $01, $81, $32, $01, $92, $1a, $06
    db $89, $11, $01, $81, $11, $05, $91, $15, $02, $ff

map_09_4a1a::
    db $20, $16, $00, $05, $00, $05
    db $02, $02, $02, $00, $00, $02, $02, $00, $05, $05, $05, $05, $05, $05, $05, $00
    db $01, $00, $05, $05, $05, $05, $03, $03, $02, $03, $03, $00, $00, $05, $05, $05
    db $05, $05, $00, $00, $00, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $01
    db $01, $01, $05, $00, $05, $05, $05, $05, $0c, $03, $03, $00, $05, $02, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $05, $05, $05, $01, $01, $00
    db $03, $00, $01, $0d, $00, $05, $05, $05, $00, $01, $03, $00, $00, $00, $05, $05
    db $05, $05, $05, $05, $05, $00, $05, $01, $00, $01, $00, $01, $00, $01, $03, $03
    db $00, $03, $01, $01, $00, $05, $05, $05, $05, $01, $00, $00, $0b, $00, $05, $05
    db $05, $05, $05, $00, $02, $00, $01, $05, $01, $03, $01, $00, $01, $03, $03, $03
    db $03, $03, $00, $00, $05, $05, $05, $05, $01, $02, $00, $00, $01, $01, $00, $00
    db $05, $00, $00, $01, $01, $01, $01, $05, $00, $00, $00, $03, $03, $03, $03, $03
    db $03, $03, $03, $03, $05, $05, $05, $05, $01, $02, $02, $00, $05, $05, $01, $01
    db $00, $01, $01, $03, $02, $02, $05, $05, $00, $05, $05, $05, $03, $03, $03, $00
    db $03, $03, $03, $03, $05, $05, $05, $00, $01, $00, $00, $00, $05, $05, $00, $05
    db $01, $00, $01, $01, $02, $02, $05, $00, $05, $05, $05, $05, $00, $00, $03, $03
    db $03, $00, $03, $03, $00, $00, $00, $01, $01, $01, $00, $00, $05, $05, $05, $05
    db $05, $05, $00, $00, $01, $01, $03, $03, $03, $05, $05, $05, $05, $0c, $03, $03
    db $00, $03, $00, $00, $04, $04, $01, $02, $02, $01, $00, $00, $05, $05, $05, $05
    db $05, $05, $02, $02, $03, $03, $01, $01, $00, $00, $00, $00, $00, $01, $03, $01
    db $00, $01, $00, $01, $00, $06, $01, $02, $02, $01, $00, $00, $05, $05, $05, $05
    db $05, $05, $05, $05, $05, $00, $01, $02, $01, $01, $01, $01, $01, $01, $01, $00
    db $01, $00, $01, $05, $01, $04, $05, $01, $01, $05, $05, $00, $00, $05, $05, $05
    db $05, $00, $05, $05, $05, $01, $01, $02, $02, $00, $00, $03, $03, $03, $01, $01
    db $03, $05, $05, $05, $05, $05, $04, $01, $00, $05, $05, $00, $00, $05, $05, $05
    db $05, $00, $00, $00, $00, $01, $00, $00, $00, $00, $0c, $03, $03, $03, $03, $03
    db $01, $05, $05, $05, $05, $00, $04, $01, $00, $05, $05, $00, $00, $00, $05, $00
    db $03, $03, $00, $01, $01, $03, $04, $04, $04, $04, $03, $03, $03, $03, $03, $03
    db $01, $05, $05, $05, $05, $01, $06, $00, $01, $01, $00, $00, $00, $08, $00, $00
    db $00, $01, $01, $03, $03, $03, $03, $03, $03, $04, $03, $03, $03, $03, $03, $03
    db $01, $05, $05, $05, $05, $01, $04, $04, $00, $00, $01, $00, $00, $00, $00, $01
    db $01, $00, $00, $05, $00, $00, $00, $05, $05, $05, $04, $04, $03, $03, $03, $01
    db $01, $00, $05, $02, $02, $01, $00, $04, $00, $00, $00, $00, $00, $01, $01, $00
    db $00, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $03, $04, $01, $01, $05
    db $05, $05, $00, $02, $02, $01, $00, $00, $04, $00, $00, $00, $01, $00, $00, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $01, $06, $00, $05, $05
    db $05, $05, $05, $05, $02, $01, $00, $00, $04, $04, $04, $00, $05, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $01, $04, $04, $05, $05
    db $05, $05, $05, $05, $00, $01, $0a, $00, $00, $00, $00, $00, $05, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $01, $00, $04, $05, $00
    db $05, $05, $05, $05, $05, $01, $00, $00, $00, $00, $00, $00, $05, $00, $05, $00
    db $05, $00, $05, $00, $05, $00, $05, $00, $05, $00, $00, $00, $00, $00, $00, $00
    db $05, $00, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05
    db $00, $08, $00, $05, $00, $05, $00, $08, $00, $05, $00, $05, $00, $00, $00, $05
    db $00, $00, $00, $00, $00, $05, $00, $05, $00, $04, $00, $05, $89, $1a, $12, $83
    db $3c, $01, $83, $3c, $01, $03, $60, $04, $01, $60, $04, $0f, $60, $04, $10, $60
    db $04, $02, $60, $04, $06, $60, $04, $0e, $60, $04, $0d, $60, $04, $16, $57, $02
    db $13, $57, $02, $07, $57, $02, $87, $57, $02, $88, $57, $02, $88, $57, $02, $05
    db $57, $02, $04, $60, $04, $04, $ae, $0c, $05, $ae, $0c, $01, $ae, $0c, $0d, $0e
    db $0a, $0d, $0d, $0b, $91, $16, $09, $83, $91, $08, $82, $91, $08, $8c, $91, $08
    db $05, $91, $08, $06, $0b, $0a, $09, $01, $0e, $12, $01, $0f, $16, $05, $0e, $91
    db $19, $0c, $08, $91, $08, $0d, $91, $08, $14, $01, $03, $87, $1a, $09, $88, $1c
    db $0b, $13, $91, $08, $87, $3c, $01, $83, $3c, $01, $8c, $3c, $01, $83, $3c, $01
    db $88, $3c, $01, $83, $3c, $01, $8d, $3c, $01, $83, $3c, $01, $8a, $15, $0a, $86
    db $1c, $0f, $94, $19, $09, $94, $14, $0f, $93, $1b, $01, $0b, $ae, $0c, $0f, $ae
    db $0c, $0d, $ae, $0c, $ff

map_09_4d85::
    db $10, $0b, $05, $05, $01, $05, $05, $05, $05, $03, $03
    db $05, $05, $05, $00, $01, $02, $02, $05, $02, $01, $01, $03, $03, $05, $03, $03
    db $05, $05, $05, $00, $01, $02, $03, $00, $00, $00, $00, $01, $00, $03, $00, $00
    db $05, $05, $05, $05, $01, $00, $03, $02, $00, $08, $00, $01, $00, $00, $00, $00
    db $00, $05, $00, $00, $01, $03, $03, $02, $02, $00, $01, $01, $05, $00, $00, $00
    db $00, $00, $02, $02, $01, $03, $03, $02, $02, $01, $00, $03, $05, $00, $00, $00
    db $00, $00, $01, $01, $00, $03, $00, $02, $02, $01, $03, $00, $00, $05, $00, $05
    db $05, $00, $01, $00, $0a, $00, $05, $00, $00, $01, $03, $03, $03, $05, $05, $05
    db $00, $00, $01, $00, $00, $00, $05, $00, $00, $01, $00, $03, $03, $05, $05, $05
    db $05, $05, $05, $01, $01, $03, $05, $00, $00, $00, $05, $00, $02, $00, $00, $05
    db $05, $05, $05, $00, $01, $03, $05, $05, $05, $05, $00, $05, $05, $02, $05, $05
    db $0a, $05, $05, $05, $03, $05, $00, $12, $03, $03, $94, $0d, $08, $0e, $04, $02
    db $0d, $05, $02, $8b, $0b, $04, $93, $0b, $06, $8e, $0e, $05, $88, $0a, $05, $86
    db $0a, $07, $06, $04, $06, $ff

map_09_4e56::
    db $20, $0b, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00
    db $00, $00, $02, $02, $02, $02, $00, $00, $00, $00, $00, $0b, $00, $03, $00, $00
    db $00, $00, $00, $00, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $02, $02, $00, $00, $00, $01, $00, $00, $03, $05, $00, $00
    db $00, $00, $03, $03, $05, $05, $05, $05, $00, $03, $03, $00, $00, $00, $05, $05
    db $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $01, $00, $00, $00, $00
    db $00, $00, $00, $03, $03, $05, $05, $05, $05, $03, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $08, $00, $01, $01, $00, $00, $03
    db $00, $0c, $00, $00, $03, $05, $05, $05, $00, $03, $03, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $0a, $00, $00, $00, $00, $00, $00, $01, $01, $00, $03
    db $00, $00, $00, $00, $00, $00, $05, $05, $00, $03, $00, $00, $0c, $00, $00, $00
    db $00, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01
    db $01, $01, $01, $01, $00, $05, $05, $05, $00, $00, $00, $00, $01, $00, $00, $00
    db $01, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $03, $03, $05, $05, $05, $00, $01, $01, $01, $01, $01, $01, $01
    db $01, $01, $00, $00, $02, $02, $00, $00, $05, $05, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $03, $03, $03, $05, $05, $05, $03, $03, $00, $00, $00, $00, $00
    db $00, $00, $0d, $00, $02, $00, $00, $00, $05, $05, $05, $05, $05, $05, $00, $05
    db $00, $00, $05, $00, $03, $05, $05, $05, $00, $03, $00, $05, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $00, $05, $05
    db $05, $00, $00, $00, $05, $05, $05, $05, $05, $03, $00, $05, $00, $01, $00, $04
    db $00, $05, $00, $05, $00, $02, $00, $05, $01, $23, $01, $01, $23, $01, $16, $23
    db $01, $16, $23, $01, $16, $23, $01, $12, $23, $01, $12, $23, $01, $11, $23, $01
    db $10, $49, $04, $0f, $49, $04, $02, $49, $04, $0d, $49, $04, $0d, $49, $04, $96
    db $9a, $08, $96, $9a, $08, $96, $9a, $08, $93, $9a, $08, $93, $9a, $08, $01, $74
    db $05, $03, $74, $05, $02, $74, $05, $10, $74, $05, $10, $74, $05, $0d, $74, $05
    db $01, $49, $04, $02, $49, $04, $81, $1d, $08, $96, $74, $05, $96, $74, $05, $96
    db $74, $05, $92, $74, $05, $13, $49, $04, $92, $74, $05, $93, $74, $05, $13, $9a
    db $08, $83, $9a, $08, $82, $9a, $08, $82, $9a, $08, $83, $9a, $08, $81, $9a, $08
    db $13, $74, $05, $13, $74, $05, $89, $1d, $04, $0d, $49, $04, $80, $04, $05, $ff

map_09_5040::
    db $20, $16, $05, $05, $05, $05, $02, $02, $02, $01, $03, $03, $05, $05, $05, $05
    db $05, $05, $05, $05, $05, $00, $03, $03, $03, $00, $00, $00, $00, $00, $02, $02
    db $02, $00, $05, $05, $05, $05, $02, $00, $00, $01, $03, $00, $05, $05, $05, $03
    db $00, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02
    db $02, $00, $05, $05, $05, $00, $00, $00, $00, $01, $03, $00, $05, $05, $00, $03
    db $03, $03, $05, $00, $00, $00, $04, $04, $00, $01, $01, $01, $00, $08, $00, $00
    db $00, $00, $00, $05, $05, $00, $00, $00, $01, $00, $00, $00, $00, $00, $03, $00
    db $03, $00, $00, $00, $00, $00, $00, $06, $01, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $01, $01, $00, $00, $00, $00, $00, $00, $00
    db $00, $0b, $00, $01, $00, $01, $01, $04, $00, $05, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00
    db $00, $00, $00, $00, $01, $00, $00, $04, $00, $05, $05, $05, $00, $00, $00, $00
    db $00, $00, $00, $00, $0c, $00, $00, $05, $00, $05, $05, $05, $02, $02, $02, $02
    db $00, $00, $00, $00, $00, $03, $03, $03, $04, $05, $05, $05, $05, $00, $00, $05
    db $05, $00, $00, $00, $00, $00, $00, $05, $05, $00, $05, $00, $03, $03, $02, $00
    db $05, $05, $00, $05, $05, $03, $03, $03, $04, $00, $05, $05, $05, $05, $05, $05
    db $05, $00, $05, $05, $00, $05, $05, $05, $00, $03, $00, $03, $03, $03, $03, $00
    db $05, $05, $05, $05, $05, $03, $03, $00, $00, $00, $05, $05, $05, $05, $05, $05
    db $05, $00, $05, $05, $05, $05, $05, $05, $00, $03, $03, $03, $03, $03, $03, $03
    db $05, $05, $05, $05, $05, $00, $00, $00, $00, $03, $00, $05, $05, $05, $05, $05
    db $05, $00, $05, $05, $05, $05, $05, $00, $00, $00, $03, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $03, $05, $05, $05, $00
    db $00, $00, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $00, $0c, $00
    db $00, $00, $03, $03, $03, $05, $00, $05, $00, $00, $03, $03, $00, $00, $00, $00
    db $00, $00, $05, $05, $05, $00, $00, $01, $00, $05, $05, $05, $00, $00, $00, $00
    db $00, $00, $03, $03, $03, $05, $05, $05, $05, $00, $03, $03, $03, $03, $00, $00
    db $00, $00, $05, $00, $00, $00, $00, $01, $00, $05, $05, $05, $05, $05, $00, $05
    db $00, $00, $00, $03, $03, $00, $05, $05, $05, $00, $03, $03, $03, $00, $00, $05
    db $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $05, $05, $05, $00, $05, $05
    db $05, $05, $00, $00, $00, $00, $05, $00, $00, $03, $03, $03, $00, $00, $05, $05
    db $05, $00, $00, $00, $00, $00, $01, $00, $01, $00, $05, $05, $00, $00, $00, $00
    db $05, $05, $05, $00, $00, $00, $03, $03, $03, $03, $03, $00, $00, $00, $05, $05
    db $05, $00, $00, $0d, $00, $01, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00
    db $00, $05, $05, $05, $05, $05, $00, $00, $03, $03, $00, $00, $0c, $00, $00, $05
    db $05, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00, $01, $00, $0a, $00, $00
    db $00, $00, $05, $05, $05, $05, $05, $00, $03, $03, $00, $00, $00, $00, $00, $05
    db $05, $00, $00, $00, $00, $05, $00, $00, $00, $01, $01, $00, $00, $00, $00, $00
    db $00, $05, $05, $05, $05, $05, $05, $00, $03, $00, $00, $05, $00, $05, $05, $05
    db $05, $00, $05, $05, $05, $05, $05, $00, $00, $01, $00, $00, $00, $00, $00, $00
    db $05, $05, $05, $05, $05, $02, $00, $02, $00, $00, $05, $05, $05, $05, $05, $05
    db $05, $00, $05, $05, $05, $05, $05, $00, $00, $01, $00, $00, $00, $00, $00, $00
    db $05, $05, $05, $00, $02, $02, $02, $02, $02, $02, $05, $05, $05, $05, $05, $05
    db $05, $00, $05, $05, $05, $00, $00, $05, $00, $05, $00, $05, $00, $03, $00, $05
    db $00, $01, $05, $05, $02, $05, $02, $00, $02, $05, $05, $05, $05, $05, $05, $05
    db $05, $05, $12, $02, $05, $12, $01, $06, $12, $03, $06, $92, $01, $05, $92, $03
    db $05, $92, $02, $07, $16, $42, $06, $16, $42, $06, $16, $42, $06, $16, $42, $06
    db $8f, $81, $10, $8f, $81, $10, $90, $81, $10, $8d, $81, $10, $8d, $81, $10, $8e
    db $81, $10, $83, $81, $10, $83, $81, $10, $83, $81, $10, $87, $0c, $10, $87, $09
    db $11, $83, $ba, $10, $83, $ba, $10, $94, $81, $10, $89, $02, $0e, $01, $1b, $02
    db $02, $1c, $02, $02, $1c, $03, $10, $10, $04, $0d, $13, $03, $0d, $14, $04, $0b
    db $2f, $04, $0c, $2f, $04, $06, $2f, $04, $06, $2f, $04, $87, $0a, $10, $0f, $6c
    db $0b, $0f, $6c, $0b, $0f, $6c, $0b, $0f, $6c, $0b, $04, $0e, $06, $05, $0d, $04
    db $14, $0b, $0a, $14, $0d, $0a, $14, $0c, $0c, $94, $0c, $0a, $94, $0b, $0b, $94
    db $0d, $0b, $96, $81, $10, $92, $81, $10, $91, $0b, $11, $8b, $0b, $12, $88, $03
    db $0d, $88, $04, $0f, $88, $04, $11, $8c, $07, $10, $ff

map_09_53ab::
    db $20, $16, $00, $05, $00
    db $05, $02, $02, $02, $00, $00, $02, $02, $00, $05, $05, $05, $05, $05, $05, $05
    db $00, $01, $00, $05, $05, $05, $05, $03, $03, $02, $03, $03, $00, $00, $05, $05
    db $05, $05, $05, $00, $00, $00, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00
    db $01, $01, $01, $05, $00, $05, $05, $05, $05, $0c, $03, $03, $00, $05, $02, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $05, $05, $05, $01, $01
    db $00, $03, $00, $01, $0d, $00, $05, $05, $05, $00, $01, $03, $00, $00, $00, $05
    db $05, $05, $05, $05, $05, $05, $00, $05, $01, $00, $01, $00, $01, $00, $01, $03
    db $03, $00, $03, $01, $01, $00, $05, $05, $05, $05, $01, $00, $00, $0b, $00, $05
    db $05, $05, $05, $05, $00, $02, $00, $01, $05, $01, $03, $01, $00, $01, $03, $03
    db $03, $03, $03, $00, $00, $05, $05, $05, $05, $01, $02, $00, $00, $01, $01, $00
    db $00, $05, $00, $00, $01, $01, $01, $01, $05, $00, $00, $00, $03, $03, $03, $03
    db $03, $03, $03, $03, $03, $05, $05, $05, $05, $01, $02, $02, $00, $05, $05, $01
    db $01, $00, $01, $01, $03, $02, $02, $05, $05, $00, $05, $05, $05, $03, $03, $03
    db $00, $03, $03, $03, $03, $05, $05, $05, $00, $01, $00, $00, $00, $05, $05, $00
    db $05, $01, $00, $01, $01, $02, $02, $05, $00, $05, $05, $05, $05, $00, $00, $03
    db $03, $03, $00, $03, $03, $00, $00, $00, $01, $01, $01, $00, $00, $05, $05, $05
    db $05, $05, $05, $00, $00, $01, $01, $03, $03, $03, $05, $05, $05, $05, $0c, $03
    db $03, $00, $03, $00, $00, $04, $04, $01, $02, $02, $01, $00, $00, $05, $05, $05
    db $05, $05, $05, $02, $02, $03, $03, $01, $01, $00, $00, $00, $00, $00, $01, $03
    db $01, $00, $01, $00, $01, $00, $06, $01, $02, $02, $01, $00, $00, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $00, $01, $02, $01, $01, $01, $01, $01, $01, $01
    db $00, $01, $00, $01, $05, $01, $04, $05, $01, $01, $05, $05, $00, $00, $05, $05
    db $05, $05, $00, $05, $05, $05, $01, $01, $02, $02, $00, $00, $03, $03, $03, $01
    db $01, $03, $05, $05, $05, $05, $05, $04, $01, $00, $05, $05, $00, $00, $05, $05
    db $05, $05, $00, $00, $00, $00, $01, $00, $00, $00, $00, $0c, $03, $03, $03, $03
    db $03, $01, $05, $05, $05, $05, $00, $04, $01, $00, $05, $05, $00, $00, $00, $05
    db $00, $03, $03, $00, $01, $01, $03, $04, $04, $04, $04, $03, $03, $03, $03, $03
    db $03, $01, $05, $05, $05, $05, $01, $06, $00, $01, $01, $00, $00, $00, $08, $00
    db $00, $00, $01, $01, $03, $03, $03, $03, $03, $03, $04, $03, $03, $03, $03, $03
    db $03, $01, $05, $05, $05, $05, $01, $04, $04, $00, $00, $01, $00, $00, $00, $00
    db $01, $01, $00, $00, $05, $00, $00, $00, $05, $05, $05, $04, $04, $03, $03, $03
    db $01, $01, $00, $05, $02, $02, $01, $00, $04, $00, $00, $00, $00, $00, $01, $01
    db $00, $00, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $03, $04, $01, $01
    db $05, $05, $05, $00, $02, $02, $01, $00, $00, $04, $00, $00, $00, $01, $00, $00
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $01, $06, $00, $05
    db $05, $05, $05, $05, $05, $02, $01, $00, $00, $04, $04, $04, $00, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $01, $04, $04, $05
    db $05, $05, $05, $05, $05, $00, $01, $0a, $00, $00, $00, $00, $00, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $01, $00, $04, $05
    db $00, $05, $05, $05, $05, $05, $01, $00, $00, $00, $00, $00, $00, $05, $00, $05
    db $00, $05, $00, $05, $00, $05, $00, $05, $00, $05, $00, $00, $00, $00, $00, $00
    db $00, $05, $00, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $00
    db $05, $00, $02, $00, $05, $00, $05, $00, $05, $00, $05, $00, $05, $00, $04, $00
    db $05, $00, $05, $00, $04, $00, $05, $00, $05, $00, $00, $00, $05, $93, $00, $03
    db $14, $60, $04, $83, $91, $08, $83, $91, $08, $83, $91, $08, $83, $91, $08, $83
    db $91, $08, $00, $01, $03, $00, $01, $04, $03, $60, $04, $02, $60, $04, $8f, $ae
    db $0c, $81, $ae, $0c, $81, $ae, $0c, $81, $ae, $0c, $81, $ae, $0c, $81, $ae, $0c
    db $10, $3c, $01, $02, $3c, $01, $90, $57, $02, $05, $57, $02, $04, $57, $02, $82
    db $ae, $0c, $0f, $3c, $01, $8f, $ae, $0c, $00, $0f, $0c, $00, $11, $0b, $92, $10
    db $0d, $03, $91, $08, $07, $91, $08, $07, $91, $08, $09, $91, $08, $ff
