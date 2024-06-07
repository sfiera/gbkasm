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
    trap $b3
    trap $11
    ld hl, $c600
    rpush @+6
    rpush @+$77
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
    rpush @+6
    rpush @+$ea
    ret
    rpush @+6
    rpush @+$122
    ret
    rpush @+6
    rpush @+$136
    ret

    rpush @+6
    rpush @+$14a
    ret
    rpush @+6
    rpush @+$15e
    ret
    rpush @+6
    rpush @+$172
    ret
    trap $b1
    ld de, $011b
    ld bc, $1a09
    ld l, $06
    ld a, $00

jr_0134:
    ld h, $37
    trap $bf

jr_0138:
    bit 1, h
    jr nz, jr_0159
    bit 2, h
    jr nz, jr_0159
    push bc
    push de
    push hl
    push af
    rpush @+6
    rpush @+$1f
    ret

    trap $d8

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
    trap $01
    dw $14fa
    nop
    ld de, $1b38
    cp $01
    ret z

    trap $1a
    ret

    cp $04
    jr nz, jr_0178
    bit 0, h
    ret z

    trap $18
    rpush @+6
    rpush @+$153
    ret
    ret

jr_0178:
    bit 0, h
    jr z, jr_01a4
    rpush @+6
    rpush @+7
    ret

    rpush @+$143
    jp hl
    rpush @+$a3
    pop hl
    or a
    ret z

    rpush @+$b8
    pop hl
    dec a
    ret z

    rpush @+$cd
    pop hl
    dec a
    ret z

    rpush @+$e2
    pop hl
    dec a
    ret z

    rpush @+$f7
    pop hl
    ret

jr_01a4:
    ld c, h
    rpush @+$98
    pop hl
    ld de, $c600
    or a
    jr z, jr_01d4
    rpush @+$a9
    pop hl
    ld de, $c602
    dec a
    jr z, jr_01d4
    rpush @+$ba
    pop hl
    ld de, $c604
    dec a
    jr z, jr_01d4
    rpush @+$cb
    pop hl
    ld de, $c606
    dec a
    jr z, jr_01d4
    rpush @+$e1
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
    rpush @+$e5
    jp hl

jr_01e5:
    ld a, [de]
    cp b
    jr z, jr_01e0
    inc a
    jr jr_01e0
    ld de, $0103
    rpush @+$10a
    pop hl
    trap $6a
    ld hl, $0101
    trap $b8
    rpush @+$ef
    pop hl
    trap $69
    ld hl, $000a
    trap $b8
    rpush @+$149
    pop hl
    trap $69
    rpush @+6
    rpush @+$22
    ret

    rpush @+6
    rpush @+$36
    ret

    rpush @+6
    rpush @+$4a
    ret

    rpush @+6
    rpush @+$5e
    ret

    rpush @+$7a
    ret

    ld a, [$c601]
    trap $13
    ret

    ld hl, $0f03
    ld a, [$c600]
    rpush @+6
    rpush @+$7a
    ret

    ld hl, $0b03
    ld a, [$c601]
    jr jr_02b5
    ld a, [$c603]
    trap $14
    ret

    ld hl, $0f04
    ld a, [$c602]
    rpush @+6
    rpush @+$5f
    ret

    ld hl, $0b04
    ld a, [$c603]
    jr jr_02b5
    ld a, [$c605]
    trap $15
    ret

    ld hl, $0f05
    ld a, [$c604]
    rpush @+6
    rpush @+$44
    ret

    ld hl, $0b05
    ld a, [$c605]
    jr jr_02b5
    ld a, [$c607]
    trap $19
    ret

    ld hl, $0f06
    ld a, [$c606]
    rpush @+6
    rpush @+$29
    ret

    ld hl, $0b06
    ld a, [$c607]
    jr jr_02b5
    ld a, [$c609]
    add a
    add a
    ld h, a
    ld l, $bc
    trap $cb
    ret

    ld hl, $0f08
    ld a, [$c608]
    rpush @+6
    rpush @+$9
    ret

    ld hl, $0b08
    ld a, [$c609]

jr_02b5:
    push af
    trap $b8
    pop af
    ld e, a
    ld d, $00
    ld hl, $c400
    trap $a3
    ld hl, $c403
    trap $69
    ret

    ld hl, $040a
    trap $b8
    trap $16
    rpush @+6
    rpush @+$0a
    ret

    ld hl, $0e0a
    trap $b8
    trap $17
    rpush @+$85
    pop hl
    or a
    jr z, jr_02e7
    rpush @+$83
    pop hl

jr_02e7:
    trap $69
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
