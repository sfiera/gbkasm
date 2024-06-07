; Disassembly of "gbkiss.gb"

INCLUDE "charmap.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    ; Length of entirety of file
    dw End
    ; Flags for display in menu
    db kFileHasIcon2bpp + kFileMarkerCircle
    ; Must be $00 for normal files (other than Kiss Mail)
    db $00
    ; Length of variable parts of header
    db Main - @ - 1
    ; File owner code
    db $05

Title::
    db "ｻｳﾝﾄﾞ ﾃｽﾄ"
Icon::
    INCBIN "gfx/icon/sound-test.2bpp"

Main::
    ld a, $c4
    ld bc, $0201
    ld de, $0d12
    ld h, $04
    rst $08
    or e
    rst $08
    ld de, $0021
    add $d7
    ld b, $00
    rst $10
    ld [hl], a
    nop
    ret

    ld a, d
    ld [hli], a
    xor a
    ld [hli], a
    ld a, e
    ld [hli], a
    xor a
    ld [hli], a
    ld a, $0f
    ld [hli], a
    xor a
    ld [hli], a
    ld a, $07
    ld [hli], a
    ld [hli], a
    ld a, $01
    ld [hli], a
    ld [hli], a
    xor a
    ld [hli], a
    rst $10
    ld b, $00
    rst $10
    ld [$c900], a
    rst $10
    ld b, $00
    rst $10
    ld [hli], a
    ld bc, $d7c9
    ld b, $00
    rst $10
    ld [hl], $01
    ret

    rst $10
    ld b, $00
    rst $10
    ld c, d
    ld bc, $d7c9
    ld b, $00
    rst $10
    ld e, [hl]
    ld bc, $d7c9
    ld b, $00
    rst $10
    ld [hl], d
    ld bc, $cfc9
    or c
    ld de, $011b
    ld bc, $1a09
    ld l, $06
    ld a, $00

jr_0134:
    ld h, $37
    rst $08
    cp a

jr_0138:
    bit 1, h
    jr nz, jr_0159
    bit 2, h
    jr nz, jr_0159
    push bc
    push de
    push hl
    push af
    rst $10
    ld b, $00
    rst $10

jr_0148:
    rra
    nop
    ret

    rst $08
    ret c

    pop bc
    and $37
    pop hl
    ld h, a
    pop de
    ld a, b
    pop bc
    jr z, jr_0134
    jr jr_0138

jr_0159:
    rst $08
    ld bc, $14fa
    nop
    ld de, $1b38
    cp $01
    ret z

    rst $08
    ld a, [de]
    ret

    cp $04
    jr nz, jr_0178
    bit 0, h
    ret z

    rst $08
    jr jr_0148
    ld b, $00
    rst $10
    ld d, e
    ld bc, $c9c9

jr_0178:
    bit 0, h
    jr z, jr_01a4
    rst $10
    ld b, $00
    rst $10
    rlca
    nop
    ret

    rst $10
    ld b, e
    ld bc, $d7e9
    and e
    nop
    pop hl
    or a
    ret z

    rst $10
    cp b
    nop
    pop hl
    dec a
    ret z

    rst $10
    call $e100
    dec a
    ret z

    rst $10
    ldh [c], a
    nop
    pop hl
    dec a
    ret z

    rst $10
    rst $30
    nop
    pop hl
    ret

jr_01a4:
    ld c, h
    rst $10
    sbc b
    nop
    pop hl
    ld de, $c600
    or a
    jr z, jr_01d4
    rst $10
    xor c
    nop
    pop hl
    ld de, $c602
    dec a
    jr z, jr_01d4
    rst $10
    cp d
    nop
    pop hl
    ld de, $c604
    dec a
    jr z, jr_01d4
    rst $10
    rlc b
    pop hl
    ld de, $c606
    dec a
    jr z, jr_01d4
    rst $10
    pop hl
    nop
    pop hl
    ld de, $c608

jr_01d4:
    ld a, [de]
    inc de
    ld b, a
    bit 4, c
    jr nz, jr_01e5
    ld a, [de]
    or a
    jr z, jr_01e0
    dec a

jr_01e0:
    ld [de], a
    rst $10
    push hl
    nop
    jp hl

jr_01e5:
    ld a, [de]
    cp b
    jr z, jr_01e0
    inc a
    jr jr_01e0
    ld de, $0103
    rst $10
    ld a, [bc]
    ld bc, $cfe1
    ld l, d
    ld hl, $0101
    rst $08
    cp b
    rst $10
    rst $28
    nop
    pop hl
    rst $08
    ld l, c
    ld hl, $000a
    rst $08
    cp b
    rst $10
    ld c, c
    ld bc, $cfe1
    ld l, c
    rst $10
    ld b, $00
    rst $10
    ld [hli], a
    nop
    ret

    rst $10
    ld b, $00
    rst $10
    ld [hl], $00
    ret

    rst $10
    ld b, $00
    rst $10
    ld c, d
    nop
    ret

    rst $10
    ld b, $00
    rst $10
    ld e, [hl]
    nop
    ret

    rst $10
    ld a, d
    nop
    ret

    ld a, [$c601]
    rst $08
    inc de
    ret

    ld hl, $0f03
    ld a, [$c600]
    rst $10
    ld b, $00
    rst $10
    ld a, d
    nop
    ret

    ld hl, $0b03
    ld a, [$c601]
    jr jr_02b5
    ld a, [$c603]
    rst $08
    inc d
    ret

    ld hl, $0f04
    ld a, [$c602]
    rst $10
    ld b, $00
    rst $10
    ld e, a
    nop
    ret

    ld hl, $0b04
    ld a, [$c603]
    jr jr_02b5
    ld a, [$c605]
    rst $08
    dec d
    ret

    ld hl, $0f05
    ld a, [$c604]
    rst $10
    ld b, $00
    rst $10
    ld b, h
    nop
    ret

    ld hl, $0b05
    ld a, [$c605]
    jr jr_02b5
    ld a, [$c607]
    rst $08
    add hl, de
    ret

    ld hl, $0f06
    ld a, [$c606]
    rst $10
    ld b, $00
    rst $10
    add hl, hl
    nop
    ret

    ld hl, $0b06
    ld a, [$c607]
    jr jr_02b5
    ld a, [$c609]
    add a
    add a
    ld h, a
    ld l, $bc
    rst $08
    set 1, c
    ld hl, $0f08
    ld a, [$c608]
    rst $10
    ld b, $00
    rst $10
    add hl, bc
    nop
    ret

    ld hl, $0b08
    ld a, [$c609]

jr_02b5:
    push af
    rst $08
    cp b
    pop af
    ld e, a
    ld d, $00
    ld hl, $c400
    rst $08
    and e
    ld hl, $c403
    rst $08
    ld l, c
    ret

    ld hl, $040a
    rst $08
    cp b
    rst $08
    ld d, $d7
    ld b, $00
    rst $10
    ld a, [bc]
    nop
    ret

    ld hl, $0e0a
    rst $08
    cp b
    rst $08
    rla
    rst $10
    add l
    nop
    pop hl
    or a
    jr z, jr_02e7
    rst $10
    add e
    nop
    pop hl

jr_02e7:
    rst $08
    ld l, c
    ret

Interface:
    db "SOUND TEST ROOM\n"
    db "MUSIC No.    /\n"
    db "EFECT No.    /\n"
    db "OffChannel   /\n"
    db "VOLUME       /\n"
    db "M_PAUSE \n"
    db "VsyncTimer   /\n"
    db "\n"
    db "Mst=STOP  Est=STOP\n"

StrStop:
    db "STOP\n"
StrPlay:
    db "PLAY\n"

End:
