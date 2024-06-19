; Disassembly of "bakechu-relay.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db kFileHasIcon2bpp + kFileMarkerCircle + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db Points - @ - 1          ; length of variable parts of header
    db $70                     ; owner code

Title::
    dk "バケちゅリレー"
Icon::
    INCBIN "gfx/icon/bakechu-relay.2bpp"

Points::
    dw 1
Author::
    dp "TOBI      ", 2
History::
    ds 11
    ds 11
    ds 11

Main::
    trap StopAudio
    ld hl, $04bc
    trap $cb

jr_0108:
    ld sp, $e000
    xor a
    trap DrawBox
    trap $b5
    rpush layout_037a
    pop hl
    trap DrawLayout
    ld a, $03
    trap $b4
    xor a
    ld [$ccc6], a
    rpush data_0131
    pop de
    trap $5f
    jr c, jr_0108

    cp $00
    jr z, jr_0138

    cp $01
    jr z, jr_000_016c

    cp $0f
    jr c, jr_013f

    trap ExitToMenu

data_0131:
    db $10, $05, $02, $3e, $20, $00, $00

jr_0138:
    ld a, $01
    ld [$ccc6], a
    ld a, $02

jr_013f:
    inc a
    ld [$ccd2], a
    xor a
    ld hl, $ccd5
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld a, $01
    ld [$ccd3], a

jr_000_014f:
    xor a
    ld [$ccc5], a
    rcall call_040c
    rcall @+$0092
    jr nc, jr_000_014f

jr_000_0163:
    trap AwaitFrame
    trap $d8

    or a
    jr z, jr_000_0163

    jr jr_000_014f

jr_000_016c:
    ld a, $20
    trap DrawBox
    rcall @+$0764
    ld a, $50
    ld [$ccc8], a
    rcall @+$03ad
    ld a, $08
    ldh [$a0], a
    ld a, $18
    ldh [$9f], a
    ld a, $63
    trap $b4
    ld a, $14
    ld [$cc96], a
    rpush layout_0262
    pop hl
    trap DrawLayout
    trap $c3
    ld hl, $ccc1
    ld [hl], $42
    inc hl
    ld [hl], $4b
    trap $72
    ld a, $00
    ld hl, $ccc1
    ld [hl+], a
    ld [hl+], a
    jr nc, jr_000_01b9

    ld hl, $cc96
    dec [hl]
    jr nz, @-$17

    rpush @+$ff4f
    ret


jr_000_01b9:
    ld hl, $ccd3
    inc [hl]
    ld a, $01
    ld [$ccc5], a
    rcall @+$053c

jr_000_01c9:
    rcall @+$023f
    ld a, [$ccc4]
    cp $01
    jr z, jr_000_01e3

    rpush layout_02da
    pop hl
    trap DrawLayout
    ld a, $b4
    trap $dc
    jr @-$4d

jr_000_01e3:
    rcall @+$0009
    xor a
    ld [$ccc5], a
    jr jr_000_01c9

    rpush layout_023c
    pop hl
    trap DrawLayout
    trap $c3
    ld a, $78
    trap $dc
    ld a, $03
    ld [$cc96], a

jr_000_0201:
    ld hl, $ccc1
    ld de, $c600
    ld c, $02
    trap $7c
    jr c, jr_000_022c

    ld hl, $c600
    ld a, [hl+]
    cp $42
    jr nz, jr_000_022c

    ld a, [hl+]
    cp $4b
    jr nz, jr_000_022c

    ld hl, $ccd2
    ld de, $ccd2
    ld c, $05
    trap $7f
    jr c, jr_000_022c

    trap $73
    jr c, jr_000_022c

    or a
    ret


jr_000_022c:
    trap AwaitFrame
    ldh a, [$8a]
    and $02
    jr nz, jr_000_022c

    ld hl, $cc96
    dec [hl]
    jr nz, jr_000_0201

    scf
    ret


layout_023c:
    dk $05, $25, "«　　　　　　　　　\n"
    dh $05, $26, "　そうしんちゅう　\n"
    dh $05, $27, "　　　　　　　　　\n"
    db $ff

layout_0262:
    dk $03, $25, "«　　　　　　　　　　　　　　\n"
    dh $03, $26, "　じゅしん　たいきちゅう　　\n"
    dh $03, $27, "　　　　　　　　　　　　　　\n"
    db $ff

layout_0298:
    dk $05, $22, "          \n"
    dk $05, $23, " FINISH!! \n"
    dk $05, $24, "          \n"
    dk $05, $25, "          \n"
    dk $05, $27, "MENU:SEL+B\n"
    db $ff

layout_02da:
    dk $02, $25, "«　　　　　　　　　　　　　　　　\n"
    dh $02, $26, "　しっぱいしました，あらためて　\n"
    dh $02, $27, "　おくってもらって　ください　　\n"
    dh $02, $28, "　　　　　　　　　　　　　　　　\n"
    db $ff

layout_032a:
    dk $02, $25, "«　　　　　　　　　　　　　　　　\n"
    dh $02, $26, "　うけとりました　　　　　　　　\n"
    dh $02, $27, "　つぎのひとにわたしてください　\n"
    dh $02, $28, "　　　　　　　　　　　　　　　　\n"
    db $ff

layout_037a:
    dh $05, $00, "バケちゅリレー\n"
    dk $06, $02, "れんしゅう\n"
    dh $06, $03, "もらう\n"
    dh $06, $04, "わたす-3\n"
    dh $06, $05, "わたす-4\n"
    dh $06, $06, "わたす-5\n"
    dh $06, $07, "わたす-6\n"
    dh $06, $08, "わたす-7\n"
    dh $06, $09, "わたす-8\n"
    dh $06, $0a, "わたす-9\n"
    dh $06, $0b, "わたす-10\n"
    dh $06, $0c, "わたす-11\n"
    dh $06, $0d, "わたす-12\n"
    dh $06, $0e, "わたす-13\n"
    dh $06, $0f, "わたす-14\n"
    dh $06, $10, "わたす-15\n"
    dh $06, $11, "END\n"
    db $ff

call_040c:
    xor a
    trap DrawBox
    trap $b5
    rcall @+$04c3
    xor a
    ldh [$9b], a
    ldh [$9a], a
    ld a, $08
    ldh [$a0], a
    ld a, $18
    ldh [$9f], a
    ld a, $63
    trap $b4
    xor a
    ld [$cc65], a
    ld a, $50
    ld [$ccc8], a
    xor a
    ld [$ccc7], a
    ld [$ccc9], a
    ld a, $ff
    ld [$ccca], a
    ld hl, $cccd
    ld [hl], $08
    inc hl
    ld [hl], $00
    rcall @+$02c2
    xor a
    ldh [$83], a

jr_000_0450:
    xor a
    ld [$ccc4], a
    ld [$cccc], a

jr_000_0457:
    trap AwaitFrame
    rcall @+$03e8
    trap $d8
    and $04
    jr nz, jr_000_04c9

    ld bc, $2800
    trap $c4
    rcall @+$02fc
    rcall @+$02a7
    rcall @+$02e5
    rcall @+$0205
    rcall @+$00b1
    rcall @+$0062
    rcall @+$0094
    rcall @+$03c1
    ld a, [$ccc4]
    or a
    jr z, jr_000_0457

    cp $02
    jr z, jr_000_04b7

    ld a, [$ccd2]
    ld b, a
    ld a, [$ccd3]
    cp b
    jr nc, jr_000_04cd

jr_000_04b7:
    ld a, [$ccc6]
    or a
    ret z

    ld a, [$ccc4]
    cp $02
    jr z, jr_000_0450

    ld hl, $ccd3
    inc [hl]
    jr jr_000_0450

jr_000_04c9:
    rpush @+$fc3b
    ret


jr_000_04cd:
    rpush layout_0298
    pop hl
    trap DrawLayout
    ld hl, $0724
    trap MoveCursor
    ld hl, $cc4c
    trap DrawString
    ld a, $1e
    rcall @+$0433

jr_000_04e6:
    trap AwaitFrame
    trap $d8
    ldh a, [$8a]
    and $06
    cp $06
    jr nz, jr_000_04e6

    jr jr_000_04c9

    ld hl, $ccc7
    ldh a, [$8a]
    ld b, a
    ld hl, $ccc8
    ld a, [hl]
    bit 0, b
    jr z, jr_000_0506

    ld c, $00
    jr jr_000_0521

jr_000_0506:
    bit 5, b
    jr z, jr_000_0514

    ld c, $20
    dec a
    cp $08
    jr nc, jr_000_0520

    inc a
    jr jr_000_0520

jr_000_0514:
    bit 4, b
    jr z, jr_000_0529

    ld c, $10
    inc a
    cp $90
    jr c, jr_000_0520

    dec a

jr_000_0520:
    ld [hl], a

jr_000_0521:
    dec hl
    ld a, [hl]
    inc a
    and $0f
    or c
    ld [hl], a
    ret


jr_000_0529:
    dec hl
    ld [hl], $00
    ret


call_052d:
    ld hl, $ccc7
    ld a, [hl+]
    srl a
    srl a
    add $04
    ld d, [hl]
    ld e, $78
    jr jr_000_054b

    ld a, [$ccc9]
    srl a
    srl a
    srl a
    ld hl, $ccca
    ld d, [hl]
    inc hl
    ld e, [hl]

jr_000_054b:
    ld l, a
    ld h, $00
    add hl, hl
    rpush data_055e
    pop bc
    add hl, bc
    ld c, [hl]
    inc hl
    ld b, [hl]
    dec hl
    add hl, bc
    ld a, $ff
    trap $60
    ret


data_055e:
    dw data_057e - @
    dw data_0583 - @
    dw data_0594 - @
    dw data_05a5 - @
    dw data_05b6 - @
    dw data_05b6 - @
    dw data_05b6 - @
    dw data_05b6 - @
    dw data_05db - @
    dw data_05f8 - @
    dw data_05db - @
    dw data_0615 - @
    dw data_0632 - @
    dw data_064f - @
    dw data_0632 - @
    dw data_066c - @

data_057e:
    db $01
    db $00, $00, $1e, $00

data_0583:
    db $04
    db $fc, $fc, $1f, $00
    db $04, $fc, $20, $00
    db $fc, $04, $21, $00
    db $04, $04, $22, $00

data_0594:
    db $04
    db $fc, $fc, $23, $00
    db $04, $fc, $24, $00
    db $fc, $04, $25, $00
    db $04, $04, $26, $00

data_05a5:
    db $04
    db $fc, $fc, $27, $00
    db $04, $fc, $28, $00
    db $fc, $04, $29, $00
    db $04, $04, $2a, $00

data_05b6:
    db $09
    db $00, $00, $00, $00
    db $08, $00, $01, $00
    db $10, $00, $02, $00
    db $00, $08, $03, $00
    db $08, $08, $04, $00
    db $10, $08, $05, $00
    db $00, $10, $06, $00
    db $08, $10, $07, $00
    db $10, $10, $08, $00

data_05db:
    db $07
    db $00, $00, $09, $00
    db $08, $00, $0a, $00
    db $10, $00, $0b, $00
    db $08, $08, $0c, $00
    db $10, $08, $0d, $00
    db $08, $10, $0e, $00
    db $10, $10, $0f, $00

data_05f8:
    db $07
    db $00, $00, $10, $00
    db $08, $00, $11, $00
    db $10, $00, $12, $00
    db $08, $08, $13, $00
    db $10, $08, $14, $00
    db $08, $10, $15, $00
    db $10, $10, $16, $00

data_0615:
    db $07
    db $00, $00, $17, $00
    db $08, $00, $18, $00
    db $10, $00, $19, $00
    db $08, $08, $1a, $00
    db $10, $08, $1b, $00
    db $08, $10, $1c, $00
    db $10, $10, $1d, $00

data_0632:
    db $07
    db $08, $00, $0e, $20
    db $10, $00, $0f, $20
    db $08, $08, $0c, $20
    db $10, $08, $0d, $20
    db $00, $10, $09, $20
    db $08, $10, $0a, $20
    db $10, $10, $0b, $20

data_064f:
    db $07
    db $08, $00, $15, $20
    db $10, $00, $16, $20
    db $08, $08, $13, $20
    db $10, $08, $14, $20
    db $00, $10, $10, $20
    db $08, $10, $11, $20
    db $10, $10, $12, $20

data_066c:
    db $07
    db $08, $00, $1c, $20
    db $10, $00, $1d, $20
    db $08, $08, $1a, $20
    db $10, $08, $1b, $20
    db $00, $10, $17, $20
    db $08, $10, $18, $20
    db $10, $10, $19, $20

call_0689:
    ld hl, $ccc9
    ld a, [hl]
    or a
    jr z, jr_000_06a9

    inc [hl]
    ld a, [hl]
    cp $17
    ret c

    ld [hl], $00
    inc hl
    ld [hl], $ff
    ld a, [$ccc5]
    or a
    ret z

Call_000_069f:
    ld a, [$ccc3]
    ld [$ccc4], a

jr_000_06a5:
    rpush @+$005c
    ret


jr_000_06a9:
    ld a, [$ccc5]
    or a
    jr nz, jr_000_06d3

    ld hl, $ccca
    ld a, [hl+]
    cp $ff
    jr z, jr_000_06b9

    dec [hl]
    ret


jr_000_06b9:
    ldh a, [$8b]
    and $01
    ret z

    ld a, $25
    rcall @+$0252
    ld a, [$ccc8]
    add $08
    ld hl, $ccca
    ld [hl+], a
    ld [hl], $74
    ret


jr_000_06d3:
    ld hl, $ccca
    ld a, [hl+]

Call_000_06d7:
    cp $ff
    jr z, jr_000_06eb

    inc [hl]
    ld a, [hl]
    cp $88
    ret c

    ld a, $01
    ld [$ccc9], a
    ld a, $0f
    rpush @+$022e
    ret


jr_000_06eb:
    ld a, [$cccd]
    add $08
    ld b, a
    ld a, [$ccd1]
    cp b
    ret nz

    ld hl, $ccca
    ld [hl+], a
    ld [hl], $18
    ld a, $07
    rpush @+$0217
    ret


call_0702:
    trap RandNext
    and $7f
    add $10
    ld [$ccd1], a
    ret


call_070c:
    trap RandNext
    and $3f
    ld [$ccd0], a
    trap RandNext
    and $07
    add $0a
    ld [$cccf], a
    ret


call_071d:
    ld hl, $cccc
    ld a, [hl]
    or a
    jr z, jr_000_072b

    ld a, [$ccc3]
    ld [$ccc4], a
    ret


jr_000_072b:
    ld hl, $ccd0
    ld a, [$cccf]
    add [hl]
    ld [hl], a
    jr nc, jr_000_0735

jr_000_0735:
    ld hl, $cccd
    ld d, [hl]
    inc hl
    ld e, [hl]
    ld a, [$cccf]
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, de
    ld e, l
    ld d, h
    ld a, d
    cp $f0
    jr nc, jr_000_075b

    cp $a8
    jr c, jr_000_075b

    rcall @+$ffb7
    ld de, $f000

jr_000_075b:
    ld hl, $cccd
    ld [hl], d
    inc hl
    ld [hl], e
    ret


call_0762:
    ld hl, $cccd
    ld a, $b0
    sub [hl]
    ldh [$9b], a
    ret


call_076b:
    ld a, [$ccc9]
    or a
    ret nz

    ld a, [$ccc5]
    or a
    jr nz, jr_000_07c6

    ld hl, $ccca
    ld a, [hl+]
    cp $ff
    jr z, @+$22

    ld d, a
    ld a, [hl]
    cp $21
    jr nc, @+$1c

    ld a, [$cccd]
    sub $02
    ld e, a
    ld a, d
    sub e
    cp $15
    jr c, jr_000_07a0

    ld a, $01
    ld [$ccc9], a
    ld a, $0f
    rcall @+$017b
    or a
    ret


jr_000_07a0:
    ld a, $ff
    ld [$ccca], a
    ld hl, $cc65
    inc [hl]
    ld a, $01
    ld [$ccc5], a
    ld [$ccc3], a
    ld [$cccc], a
    rcall @+$ff4a
    ld a, $04
    rcall @+$0155
    scf
    ret


jr_000_07c6:
    ld hl, $ccca
    ld a, [hl+]
    cp $ff
    jr z, jr_000_0824

    ld a, [hl-]
    cp $74
    jr nz, jr_000_0824

    ld a, [$ccc8]
    sub $02
    ld b, a
    ld a, [hl]
    sub b
    cp $15
    jr nc, jr_000_081f

    ld [hl], $ff
    ld hl, $cc65
    inc [hl]
    rcall @+$ff19
    xor a
    ld [$ccc5], a
    ld a, $20
    rcall @+$0120
    ld a, [$ccc6]
    or a
    jr nz, jr_000_081d
    rcall @+$fd2a
    rpush layout_032a
    pop hl
    trap DrawLayout
    ld a, $78
    trap $dc
    trap $b5
    rcall @+$00c2
    ld a, $63
    trap $b4

jr_000_081d:
    scf
    ret


jr_000_081f:
    ld a, $02
    ld [$ccc3], a

jr_000_0824:
    or a
    ret


call_0826:
    rpush layout_083d
    pop hl
    trap DrawLayout
    ld a, [$cc65]
    ld e, a
    ld d, $00
    ld hl, $cc40
    trap IntToString
    ld hl, $cc43
    trap $69
    ret


layout_083d:
    dk $03, $0a, "HIT=\n"
    db $ff


call_0845:
    ldh a, [$83]
    sub $06
    ret c

    ldh [$83], a
    ld hl, $ccd4
    inc [hl]
    ld a, [hl]
    cp $0a
    ret c

    ld [hl], $00
    inc hl
    inc [hl]
    ld a, [hl]
    cp $3c
    ret c

    ld [hl], $00
    inc hl
    inc [hl]
    ret


call_0861:
    ld hl, $cc40
    rpush data_08b4
    pop de
    rcall @+$0065
    ld a, [$ccd3]
    rcall @+$004a
    rpush data_08b9
    pop de
    rcall @+$0050
    ld a, [$ccd6]
    rcall @+$0035
    ld [hl], $3a
    inc hl
    ld a, [$ccd5]
    rcall @+$0028
    ld [hl], $2e
    inc hl
    ld a, [$ccd4]
    add $30
    ld [hl+], a
    ld [hl], $00
    ld de, $012e
    trap $57
    ld de, $cc40

jr_000_08ae:
    ld bc, $0013
    trap $02
    ret


data_08b4:
    dk "MAN:\n"

data_08b9:
    dk " TIME \n"

call_08c0:
    ld c, $2f

jr_000_08c2:
    inc c
    sub $0a
    jr nc, jr_000_08c2

    add $0a
    ld b, a
    ld [hl], c
    inc hl
    ld a, b
    add $30
    ld [hl+], a
    ret


jr_000_08d1:
    ld a, [de]
    inc de
    or a
    ret z

    ld [hl+], a
    jr jr_000_08d1

    ld b, $c6
    rpush data_0928
    pop de
    trap InitDecompress
    ld de, $8b00
    ld bc, $0190
    trap RunDecompress
    ld de, $8000
    ld bc, $02b0
    trap RunDecompress
    ld de, $9800
    ld c, $03
    rcall @+$0008
    ld c, $0f
    ld de, $9c00

jr_000_0901:
    push bc
    ld bc, $0020
    trap RunDecompress
    ld b, $20

jr_000_0909:
    ld a, [de]
    add $b0
    ld [de], a
    inc de
    dec b

jr_000_090f:
    jr nz, jr_000_0909

    pop bc
    dec c
    jr nz, jr_000_0901

    ret


call_0916:
    push af
    ld a, [$0014]
    cp $01
    jr z, jr_000_0924

    cp $fe
    jr z, jr_000_0924

    pop af
    ret


jr_000_0924:
    pop af
    trap PlaySound
    ret


data_0928:
    db $7f, $de, $e0, $18, $81, $00, $42, $00, $24, $81, $43, $ff, $18, $03, $00, $01
    db $06, $13, $00, $00, $ff, $39, $de, $10, $16, $ff, $55, $ff, $1e, $02, $19, $aa
    db $f3, $ff, $2a, $80, $00, $28, $23, $1f, $ae, $00, $be, $55, $de, $2f, $ff, $2f
    db $80, $55, $80, $27, $3b, $38, $e5, $20, $aa, $00, $05, $4e, $32, $ea, $15, $73
    db $20, $5f, $00, $25, $18, $10, $16, $5d, $00, $3f, $67, $fd, $78, $5e, $87, $23
    db $41, $77, $63, $fe, $9f, $3f, $9f, $0f, $1f, $1f, $7f, $aa, $00, $74, $1e, $bf
    db $3f, $7f, $b2, $11, $ff, $ad, $b8, $54, $06, $21, $4b, $ff, $44, $d1, $f3, $82
    db $58, $81, $b8, $7f, $03, $09, $bb, $af, $8b, $84, $ff, $31, $42, $31, $3a, $a3
    db $ff, $9c, $5e, $f0, $d4, $f1, $e9, $fb, $f2, $ff, $fe, $fc, $fc, $fa, $f8, $fd
    db $fe, $fd, $f1, $fc, $fe, $ff, $fe, $72, $ba, $63, $7f, $01, $e0, $01, $03, $02
    db $87, $00, $88, $85, $06, $7f, $8d, $40, $3b, $85, $88, $10, $03, $04, $07, $a3
    db $1c, $1f, $f7, $12, $1f, $0f, $0f, $7f, $40, $1c, $1c, $eb, $ff, $f7, $f6, $3f
    db $2a, $f7, $08, $f7, $dd, $fb, $e3, $5d, $63, $79, $47, $bd, $7f, $80, $ff, $7f
    db $b0, $bc, $eb, $be, $d5, $7f, $94, $ff, $7b, $ac, $bf, $68, $ff, $50, $eb, $b4
    db $fb, $e0, $bf, $d0, $ff, $ad, $7c, $70, $c0, $c0, $fc, $e0, $20, $60, $a0, $20
    db $e0, $ec, $4e, $20, $f1, $80, $80, $40, $c0, $f5, $f3, $02, $f3, $a0, $bf, $60
    db $eb, $00, $90, $70, $10, $f0, $1c, $fc, $f3, $a4, $fc, $f8, $f8, $f3, $4e, $00
    db $06, $06, $ee, $0a, $0e, $0e, $13, $0a, $1c, $14, $19, $00, $ff, $38, $28, $70
    db $50, $b0, $d0, $e7, $a7, $ff, $b9, $fe, $57, $78, $6e, $71, $6f, $70, $ff, $41
    db $7e, $43, $7c, $2f, $38, $18, $17, $f1, $2f, $3f, $27, $3f, $b3, $7f, $42, $e3
    db $b1, $ff, $71, $ef, $1f, $b9, $c7, $8e, $71, $df, $ff, $20, $8f, $70, $2f, $f0
    db $46, $f9, $80, $e3, $ff, $03, $ff, $6a, $06, $3b, $ec, $06, $70, $90, $ff, $30
    db $d0, $98, $f8, $54, $bc, $7b, $8f, $ff, $bd, $43, $86, $7e, $68, $b8, $b8, $d8
    db $d9, $e4, $fc, $39, $18, $18, $1a, $00, $15, $07, $9b, $05, $87, $02, $17, $34
    db $2c, $1d, $00, $6f, $5f, $3d, $27, $2b, $00, $5e, $61, $5f, $60, $2f, $2b, $ef
    db $3c, $36, $39, $c1, $00, $df, $bf, $a3, $e3, $1b, $e5, $3b, $60, $f3, $71, $f1
    db $47, $0a, $fd, $03, $ff, $3f, $c0, $1f, $e0, $5f, $e0, $4d, $f2, $cf, $98, $e7
    db $57, $3f, $00, $f0, $f0, $e8, $98, $bf, $98, $d5, $f8, $2c, $dc, $36, $ce, $82
    db $ff, $7e, $e4, $3c, $78, $98, $c6, $fe, $39, $ef, $3f, $07, $07, $5c, $42, $02
    db $02, $01, $03, $7f, $87, $1e, $1a, $3c, $24, $78, $58, $e0, $bd, $a0, $ff, $00
    db $73, $53, $5d, $6e, $9f, $76, $fe, $79, $5f, $70, $6f, $50, $4b, $74, $2d, $00
    db $fc, $e4, $ff, $f9, $ff, $08, $0f, $18, $3b, $66, $ff, $e3, $e3, $db, $3a, $76
    db $8f, $fb, $c7, $ff, $9c, $63, $cf, $30, $de, $21, $1f, $e1, $ff, $c9, $f6, $92
    db $ff, $6f, $ff, $fe, $fe, $37, $ab, $a9, $00, $b0, $70, $73, $18, $f8, $bc, $ff
    db $74, $d6, $3e, $fe, $02, $24, $dc, $be, $f8, $fe, $ff, $ff, $20, $e0, $58, $02
    db $af, $79, $00, $f6, $3e, $22, $7f, $41, $a3, $71, $4f, $67, $00, $cd, $22, $3e
    db $5f, $af, $20, $06, $06, $89, $06, $ff, $05, $66, $65, $f9, $9e, $bf, $c0, $7b
    db $ff, $7c, $0b, $0c, $1d, $13, $1a, $16, $34, $fb, $2c, $24, $3c, $18, $18, $3c
    db $40, $10, $10, $bf, $78, $47, $c8, $70, $90, $e0, $20, $a0, $ff, $60, $90, $70
    db $e8, $18, $3c, $c4, $cc, $e9, $f4, $38, $38, $3c, $45, $01, $af, $5b, $24, $60
    db $f8, $60, $f8, $98, $7c, $64, $6d, $8b, $00, $95, $af, $f0, $9a, $00, $e0, $43
    db $c0, $40, $c6, $46, $f3, $ce, $48, $9e, $96, $8b, $60, $5b, $08, $08, $fc, $1c
    db $14, $1e, $12, $0c, $0c, $a9, $64, $8f, $d8, $80, $80, $5b, $02, $40, $40, $5b
    db $f9, $20, $5b, $cc, $20, $20, $93, $02, $fd, $02, $02, $91, $26, $3b, $60, $3b
    db $64, $04, $04, $b5, $af, $6f, $36, $47, $f9, $53, $e1, $0b, $11, $17, $af, $60
    db $11, $70, $f0, $11, $0c, $de, $12, $18, $73, $6f, $03, $07, $0d, $13, $8f, $79
    db $9c, $9f, $04, $08, $0e, $14, $af, $bc, $9f, $05, $e7, $09, $0f, $15, $cf, $dc
    db $9f, $06, $0a, $10, $80, $16, $ef, $fc, $9f, $bb, $c0, $ff, $dd, $e2, $ff, $4f
    db $01, $04, $ff, $71, $26, $ff, $93, $48, $ff, $b5, $be, $3f, $00, $00, $cf, $e0
    db $ff, $f1, $02, $ff, $13, $24, $ff, $35, $46, $ff, $00, $57, $68, $40

End:
