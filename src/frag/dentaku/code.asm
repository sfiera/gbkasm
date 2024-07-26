; Disassembly of "dentaku.gbf"

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

SECTION "Fragment", ROM0[$0]
LOAD "WRAM Code", WRAM0[$c800]

call_c800:
    ld sp, $e000
    call call_c86d
    call call_ca6e
    ld de, $011d
    ld bc, $530c
    ld l, $1e
    ld a, $00

jr_c813:
    ld h, $03
    trap InputHiliteMenu
    bit 1, h
    jr nz, jr_c828

    push af
    push bc
    push de
    push hl
    call call_c82a
    pop hl
    pop de
    pop bc
    pop af
    jr jr_c813

jr_c828:
    trap ExitToMenu


call_c82a:
    ld l, a
    ld h, $00
    inc hl
    trap $03
    db 30
    dw jp_ca4f - @
    dw jp_ca57 - @
    dw jp_ca5e - @
    dw call_ca6e - @
    dw jp_cadc - @
    dw jp_cae5 - @
    dw jp_cb5f - @
    dw jp_cb6b - @
    dw jp_cb77 - @
    dw jp_cb83 - @
    dw jp_cb88 - @
    dw jp_cbe8 - @
    dw jp_cbed - @
    dw jp_cbf2 - @
    dw jp_cbfe - @
    dw jp_cc03 - @
    dw jp_cc08 - @
    dw jp_cc0d - @
    dw jp_cc12 - @
    dw jp_cc1e - @
    dw jp_cc23 - @
    dw jp_cc28 - @
    dw jp_cc2d - @
    dw jp_cc32 - @
    dw jp_cc3e - @
    dw jp_cc43 - @
    dw jp_cc48 - @
    dw jp_cc54 - @
    dw jp_cc60 - @
    dw jp_cc6d - @

call_c86d:
    ld a, $c4
    ld bc, $0201
    ld de, $0d11
    ld hl, $1791
    trap DrawInit
    ld hl, $0f05
    ld de, $7816
    ld bc, $4f1e
    trap $c2
    xor a
    ld [$c615], a
    ld hl, $0a1f
    ld de, $1d26
    ld bc, $5fe4
    trap $c2
    ld hl, $221f
    ld de, $3526
    ld bc, $5fe4
    trap $c2
    ld hl, $3a1f
    ld de, $4d26
    ld bc, $5fe4
    trap $c2
    ld hl, $521f
    ld de, $6526
    ld bc, $5fe4
    trap $c2
    ld hl, $6a1f
    ld de, $7d26
    ld bc, $5fe4
    trap $c2
    ld hl, $0a2b
    ld de, $1d32
    ld bc, $5fe4
    trap $c2
    ld hl, $222b
    ld de, $3532
    ld bc, $5fe4
    trap $c2
    ld hl, $3a2b
    ld de, $4d32
    ld bc, $5fe4
    trap $c2
    ld hl, $522b
    ld de, $6532
    ld bc, $5fe4
    trap $c2
    ld hl, $6a2b
    ld de, $7d32
    ld bc, $5fe4
    trap $c2
    ld hl, $0a37
    ld de, $1d3e
    ld bc, $5fe4
    trap $c2
    ld hl, $2237
    ld de, $353e
    ld bc, $5fe4
    trap $c2
    ld hl, $3a37
    ld de, $4d3e
    ld bc, $5fe4
    trap $c2
    ld hl, $5237
    ld de, $653e
    ld bc, $5fe4
    trap $c2
    ld hl, $6a37
    ld de, $7d3e
    ld bc, $5fe4
    trap $c2
    ld hl, $0a43
    ld de, $1d4a
    ld bc, $5fe4
    trap $c2
    ld hl, $2243
    ld de, $354a
    ld bc, $5fe4
    trap $c2
    ld hl, $3a43
    ld de, $4d4a
    ld bc, $5fe4
    trap $c2
    ld hl, $5243
    ld de, $654a
    ld bc, $5fe4
    trap $c2
    ld hl, $6a43
    ld de, $7d4a
    ld bc, $5fe4
    trap $c2
    ld hl, $0a4f
    ld de, $1d56
    ld bc, $5fe4
    trap $c2
    ld hl, $224f
    ld de, $3556
    ld bc, $5fe4
    trap $c2
    ld hl, $3a4f
    ld de, $4d56
    ld bc, $5fe4
    trap $c2
    ld hl, $524f
    ld de, $6556
    ld bc, $5fe4
    trap $c2
    ld hl, $6a4f
    ld de, $7d56
    ld bc, $5fe4
    trap $c2
    ld hl, $0a5b
    ld de, $1d63
    ld bc, $5fe4
    trap $c2
    ld hl, $225b
    ld de, $3563
    ld bc, $5fe4
    trap $c2
    ld hl, $3a5b
    ld de, $4d63
    ld bc, $5fe4
    trap $c2
    ld hl, $525b
    ld de, $6563
    ld bc, $5fe4
    trap $c2
    ld hl, $6a5b
    ld de, $7d63
    ld bc, $5fe4
    trap $c2
    ld hl, data_c9e4

jr_c9d6:
    ld a, [hl+]
    or a
    ret z

    push hl
    ld l, a
    ld h, $01
    trap $bd
    pop hl
    trap DrawString
    jr jr_c9d6


data_c9e4:
    db $1f, $15, $31, $36, $01, $31, $30, $01, $01, $43, $01, $41, $43, $01, $01, $46, $00
    db $2b, $01, $5e, $01, $01, $7e, $01, $01, $26, $01, $01, $3c, $01, $01, $45, $00
    db $37, $01, $37, $01, $01, $38, $01, $01, $39, $01, $01, $3e, $01, $01, $44, $00
    db $43, $01, $34, $01, $01, $35, $01, $01, $36, $01, $01, $2a, $01, $01, $43, $00
    db $4f, $01, $31, $01, $01, $32, $01, $01, $33, $01, $01, $2f, $01, $01, $42, $00
    db $5b, $01, $30, $01, $01, $2b, $01, $01, $2d, $01, $01, $3d, $01, $01, $41, $14, $00
    db $00


data_ca47:
    dk "Dec\0"


data_ca4b:
    dk "Hex\0"


jp_ca4f:
    ld a, $01
    ld [$c614], a
    jp jp_caa2


jp_ca57:
    xor a
    ld [$c614], a
    jp jp_caa2


jp_ca5e:
    xor a
    ld [$c616], a
    ld [$c600], a
    ld [$c601], a
    jp jp_caa2


data_ca6b:
    trap $87

data_ca6d:
    ret


call_ca6e:
    ld a, [data_ca6b]
    ld [$c617], a
    ld a, [data_ca6d]
    ld [$c619], a
    xor a
    ld [$c616], a
    ld [$c618], a
    ld [$c614], a
    ld [$c600], a
    ld [$c601], a
    ld [$c60a], a
    ld [$c60b], a
    ld hl, $020e
    trap $bd
    ld hl, data_cc68
    ld a, l
    ld [$c61a], a
    ld a, h
    ld [$c61b], a
    trap DrawString

jp_caa2:
    ld hl, $0205
    trap $bd
    ld hl, data_ca47
    ld a, [$c614]
    or a
    jr z, jr_cab3

    ld hl, data_ca4b

jr_cab3:
    trap DrawString

call_cab5:
    ld hl, $c60a
    ld bc, $0905
    call call_cc72

jp_cabe:
    ld a, [$c615]
    or a
    jr z, jr_cad2

    ld hl, $060e
    trap $bd
    ld hl, data_cc68
    trap DrawString
    xor a
    ld [$c615], a

jr_cad2:
    ld hl, $c600
    ld bc, $090e
    call call_cc72
    ret


jp_cadc:
    ld c, $0f
    jp jp_cbbe


data_cae1:
    dk "XOR\0"


jp_cae5:
    ld a, $80
    ld hl, data_cae1

jp_caea:
    push hl
    push af
    ld a, l
    ld [$c61a], a
    ld a, h
    ld [$c61b], a
    ld a, [$c616]
    or a
    jr z, jr_cb4c

    ld hl, $c60a
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $c600
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [$c618]
    or a
    call nz, $c617
    ld a, l
    ld [$c60a], a
    ld a, h
    ld [$c60b], a
    xor a
    ld [$c600], a
    ld [$c601], a
    ld [$c616], a
    ld a, [$c618]
    cp $8a
    jr nz, jr_cb49

    ld hl, $060e
    trap $bd
    ld hl, data_cb59
    trap DrawString
    ld a, $01
    ld [$c615], a
    ld hl, $c3b0
    ld bc, $090e
    call call_cc72
    ld hl, $c60a
    ld bc, $0905
    call call_cc72
    jr jr_cb4c

jr_cb49:
    call call_cab5

jr_cb4c:
    ld hl, $020e
    trap $bd
    pop af
    pop hl
    ld [$c618], a
    trap DrawString
    ret


data_cb59:
    dk "«あまり»\0"


jp_cb5f:
    ld a, $81
    ld hl, data_cb67
    jp jp_caea


data_cb67:
    dk "OR \0"


jp_cb6b:
    ld a, $82
    ld hl, data_cb73
    jp jp_caea


data_cb73:
    dk "AND\0"


jp_cb77:
    ld a, $86
    ld hl, data_cb7f
    jp jp_caea


data_cb7f:
    dk "SLA\0"


jp_cb83:
    ld c, $0e
    jp jp_cbbe


jp_cb88:
    ld c, $07

jp_cb8a:
    ld a, [$c616]
    inc a
    ld [$c616], a
    ld a, [$c614]
    or a
    jr nz, jr_cbca

    ld hl, $c600
    ld e, [hl]
    inc hl
    ld d, [hl]
    sla e
    rl d
    push de
    sla e
    rl d
    sla e
    rl d
    ld a, c
    add e
    ld e, a
    ld a, $00
    adc d
    ld d, a
    pop bc
    ld a, c
    add e
    ld e, a
    ld a, b
    adc d
    ld d, a
    ld [hl], d
    dec hl
    ld [hl], e
    jp jp_cabe


jp_cbbe:
    ld a, [$c614]
    or a
    ret z

    ld a, [$c616]
    inc a
    ld [$c616], a

jr_cbca:
    ld hl, $c600
    ld e, [hl]
    inc hl
    ld d, [hl]
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    ld [hl], d
    dec hl
    ld a, e
    or c
    ld [hl], a
    jp jp_cabe


jp_cbe8:
    ld c, $08
    jp jp_cb8a


jp_cbed:
    ld c, $09
    jp jp_cb8a


jp_cbf2:
    ld a, $85
    ld hl, data_cbfa
    jp jp_caea


data_cbfa:
    dk "SRL\0"


jp_cbfe:
    ld c, $0d
    jp jp_cbbe


jp_cc03:
    ld c, $04
    jp jp_cb8a


jp_cc08:
    ld c, $05
    jp jp_cb8a


jp_cc0d:
    ld c, $06
    jp jp_cb8a


jp_cc12:
    ld a, $89
    ld hl, data_cc1a
    jp jp_caea


data_cc1a:
    dk "*  \0"


jp_cc1e:
    ld c, $0c
    jp jp_cbbe


jp_cc23:
    ld c, $01
    jp jp_cb8a


jp_cc28:
    ld c, $02
    jp jp_cb8a


jp_cc2d:
    ld c, $03
    jp jp_cb8a


jp_cc32:
    ld a, $8a
    ld hl, data_cc3a
    jp jp_caea


data_cc3a:
    dk "/  \0"


jp_cc3e:
    ld c, $0b
    jp jp_cbbe


jp_cc43:
    ld c, $00
    jp jp_cb8a


jp_cc48:
    ld a, $87
    ld hl, data_cc50
    jp jp_caea


data_cc50:
    dk "+  \0"


jp_cc54:
    ld a, $88
    ld hl, data_cc5c
    jp jp_caea


data_cc5c:
    dk "-  \0"


jp_cc60:
    ld a, $00
    ld hl, data_cc68
    jp jp_caea


data_cc68:
    dk "   \0"


jp_cc6c:
    ret


jp_cc6d:
    ld c, $0a
    jp jp_cbbe


call_cc72:
    ld e, [hl]

jr_cc73:
    inc hl
    ld d, [hl]
    inc hl
    push hl
    push bc
    ld a, [$c614]
    or a
    jr z, jr_cc8f

    trap StrConvHex
    pop hl
    trap $bd
    ld a, " "
    trap DrawChar
    ld a, " "
    trap DrawChar
    pop hl
    trap DrawString
    ret


jr_cc8f:
    trap StrConvInt
    pop hl
    trap $bd
    pop hl
    trap DrawString
    ret

ENDL
