; Disassembly of "gbkiss.gb"

MACRO rcall
    rpush @+6
    rpush \1
    ret
ENDM

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
    rcall call_015b
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
    rcall call_01ec
    rcall call_022b
    rcall call_0246
    rcall call_0261
    rcall call_027c
    rcall call_0297
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
    rcall call_0167
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
    trap ExitToMenu

call_015b:
    dw $14fa
    nop
    ld de, $1b38
    cp $01
    ret z
    trap $1a
    ret

call_0167:
    cp $04
    jr nz, jr_0178
    bit 0, h
    ret z

    trap $18
    rcall call_02c7
    ret

jr_0178:
    bit 0, h
    jr z, jr_01a4
    rcall call_0187
    rpush call_02c7
    jp hl

call_0187:
    rpush call_022b
    pop hl
    or a
    ret z

    rpush call_0246
    pop hl
    dec a
    ret z

    rpush call_0261
    pop hl
    dec a
    ret z

    rpush call_027c
    pop hl
    dec a
    ret z

    rpush call_0297
    pop hl
    ret

jr_01a4:
    ld c, h
    rpush code_023e
    pop hl
    ld de, $c600
    or a
    jr z, jr_01d4
    rpush code_0259
    pop hl
    ld de, $c602
    dec a
    jr z, jr_01d4
    rpush code_0274
    pop hl
    ld de, $c604
    dec a
    jr z, jr_01d4
    rpush code_028f
    pop hl
    ld de, $c606
    dec a
    jr z, jr_01d4
    rpush code_02af
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
    rpush call_02c7
    jp hl

jr_01e5:
    ld a, [de]
    cp b
    jr z, jr_01e0
    inc a
    jr jr_01e0

call_01ec:
    ld de, $0103
    rpush StrInterface
    pop hl
    trap $6a
    ld hl, $0101
    trap MoveCursor
    rpush StrTitle
    pop hl
    trap DrawString
    ld hl, $000a
    trap MoveCursor
    rpush StrStatus
    pop hl
    trap DrawString
    rcall call_0231
    rcall call_024c
    rcall call_0267
    rcall call_0282
    rpush call_02a2
    ret

call_022b:
    ld a, [$c601]
    trap $13
    ret

call_0231:
    ld hl, $0f03
    ld a, [$c600]
    rcall call_02b5

code_023e:
    ld hl, $0b03
    ld a, [$c601]
    jr call_02b5

call_0246:
    ld a, [$c603]
    trap PlaySound
    ret

call_024c:
    ld hl, $0f04
    ld a, [$c602]
    rcall call_02b5

code_0259:
    ld hl, $0b04
    ld a, [$c603]
    jr call_02b5

call_0261:
    ld a, [$c605]
    trap $15
    ret

call_0267:
    ld hl, $0f05
    ld a, [$c604]
    rcall call_02b5

code_0274:
    ld hl, $0b05
    ld a, [$c605]
    jr call_02b5

call_027c:
    ld a, [$c607]
    trap $19
    ret

call_0282:
    ld hl, $0f06
    ld a, [$c606]
    rcall call_02b5

code_028f:
    ld hl, $0b06
    ld a, [$c607]
    jr call_02b5

call_0297:
    ld a, [$c609]
    add a
    add a
    ld h, a
    ld l, $bc
    trap $cb
    ret

call_02a2:
    ld hl, $0f08
    ld a, [$c608]
    rcall call_02b5

code_02af:
    ld hl, $0b08
    ld a, [$c609]

call_02b5:
    push af
    trap MoveCursor
    pop af
    ld e, a
    ld d, $00
    ld hl, $c400
    trap IntToString
    ld hl, $c403
    trap DrawString
    ret

call_02c7:
    ld hl, $040a
    trap MoveCursor
    trap $16
    rcall call_02dc
    ld hl, $0e0a
    trap MoveCursor
    trap $17

call_02dc:
    rpush StrStop
    pop hl
    or a
    jr z, jr_02e7
    rpush StrPlay
    pop hl

jr_02e7:
    trap DrawString
    ret

StrTitle:
    db "SOUND TEST ROOM\n"
StrInterface:
    db "MUSIC No.    /\n"
    db "EFECT No.    /\n"
    db "OffChannel   /\n"
    db "VOLUME       /\n"
    db "M_PAUSE \n"
    db "VsyncTimer   /\n"
    db "\n"
StrStatus:
    db "Mst=STOP  Est=STOP\n"
StrStop:
    db "STOP\n"
StrPlay:
    db "PLAY\n"

End:
