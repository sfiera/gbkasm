; Disassembly of "bakechu-relay.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db kFileHasIcon2bpp + kFileMarkerCircle + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db .end - @ - 1            ; length of variable parts of header
    db $70                     ; owner code
.title
    dk "バケちゅリレー"
.icon
    INCBIN "gfx/baketu/icon.2bpp"
.end

History:
.points
    dw 1
.author
    dp "TOBI      ", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    trap StopAudio
    ld hl, $04bc
    trap $cb

jr_0108:
    ld sp, $e000
    xor a
    trap DrawInit
    trap $b5
    ldx hl, layout_037a
    trap DrawLayout
    ld a, $03
    trap $b4
    xor a
    ld [$ccc6], a
    ldx de, data_0131
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
    callx call_040c
    callx call_01f0
    jr nc, jr_000_014f

jr_000_0163:
    trap AwaitFrame
    trap $d8

    or a
    jr z, jr_000_0163

    jr jr_000_014f

jr_000_016c:
    ld a, $20
    trap DrawInit
    callx call_08d8
    ld a, $50
    ld [$ccc8], a
    callx call_052d
    ld a, $08
    ldh [$a0], a
    ld a, $18
    ldh [$9f], a
    ld a, $63
    trap $b4
    ld a, $14
    ld [$cc96], a
jr_0194:
    ldx hl, layout_0262
    trap DrawLayout
    trap $c3
jr_019c:
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
    jr nz, jr_019c

    jx jr_0108


jr_000_01b9:
    ld hl, $ccd3
    inc [hl]
    ld a, $01
    ld [$ccc5], a
    callx call_0702

jr_000_01c9:
    callx call_040c
    ld a, [$ccc4]
    cp $01
    jr z, jr_000_01e3

    ldx hl, layout_02da
    trap DrawLayout
    ld a, $b4
    trap $dc
    jr jr_0194

jr_000_01e3:
    callx call_01f0
    xor a
    ld [$ccc5], a
    jr jr_000_01c9

call_01f0:
    ldx hl, layout_023c
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
    trap DrawInit
    trap $b5
    callx call_08d8
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
    callx call_070c
    xor a
    ldh [$83], a

jr_000_0450:
    xor a
    ld [$ccc4], a
    ld [$cccc], a

jr_000_0457:
    trap AwaitFrame
    callx call_0845
    trap $d8
    and $04
    jr nz, jr_000_04c9

    ld bc, $2800
    trap $c4
    callx call_076b
    callx call_071d
    callx call_0762
    callx call_0689
    callx call_053c
    callx call_04f4
    callx call_052d
    callx call_0861
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
    jx jr_0108


jr_000_04cd:
    ldx hl, layout_0298
    trap DrawLayout
    ld hl, $0724
    trap MoveCursor
    ld hl, $cc4c
    trap DrawString
    ld a, $1e
    callx call_0916

jr_000_04e6:
    trap AwaitFrame
    trap $d8
    ldh a, [$8a]
    and $06
    cp $06
    jr nz, jr_000_04e6

    jr jr_000_04c9

call_04f4:
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


call_053c:
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
    ldx bc, data_055e
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
    jx call_0702


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
    callx call_0916
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
    jx call_0916


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
    jx call_0916


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

    callx call_070c
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
    jr z, jr_079e

    ld d, a
    ld a, [hl]
    cp $21
    jr nc, jr_079e

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
    callx call_0916

jr_079e:
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
    callx call_0702
    ld a, $04
    callx call_0916
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
    callx call_0702
    xor a
    ld [$ccc5], a
    ld a, $20
    callx call_0916
    ld a, [$ccc6]
    or a
    jr nz, jr_000_081d
    callx call_052d
    ldx hl, layout_032a
    trap DrawLayout
    ld a, $78
    trap $dc
    trap $b5
    callx call_08d8
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
    ldx hl, layout_083d
    trap DrawLayout
    ld a, [$cc65]
    ld e, a
    ld d, $00
    ld hl, $cc40
    trap IntToString
    ld hl, $cc43
    trap DrawString
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
    ldx de, data_08b4
    callx call_08d1
    ld a, [$ccd3]
    callx call_08c0
    ldx de, data_08b9
    callx call_08d1
    ld a, [$ccd6]
    callx call_08c0
    ld [hl], $3a
    inc hl
    ld a, [$ccd5]
    callx call_08c0
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
    trap MemCopy
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


call_08d1:
    ld a, [de]
    inc de
    or a
    ret z

    ld [hl+], a
    jr call_08d1


call_08d8:
    ld b, $c6
    ldx de, data_0928
    trap InitDecompress
    ld de, $8b00
    ld bc, $0190
    trap RunDecompress
    ld de, $8000
    ld bc, $02b0
    trap RunDecompress
    ld de, $9800
    ld c, $03
    callx call_0901
    ld c, $0f
    ld de, $9c00

call_0901:
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
    jr nz, call_0901

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
    INCBIN "gfx/baketu/tiles.2bpp.hz"
