; Disassembly of "binary.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db kFileHasIcon2bpp + kFileMarkerDiamond + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db Points - @ - 1          ; length of variable parts of header
    db $71                     ; owner code

Title::
    dk "BINARY"
Icon::
    INCBIN "gfx/icon/binary.2bpp"

Points::
    dw $0001
Author::
    db "T.OHNISHI ", 2
History::
    ds 11
    ds 11
    ds 11

Main::
    jp $bfbc


    xor a
    rst $08
    inc de
    xor a
    rst $08
    inc d
    rst $08
    ld bc, $203e
    rst $08
    or e
    ld a, $e4
    ldh [$9d], a
    ldh [$9c], a
    call $a189
    ld a, [$0014]
    cp $01
    jr z, jr_000_0121

    cp $fe
    jr z, jr_000_0121

    ld hl, $c802
    inc [hl]

jr_000_0121:
    ld hl, $92b0
    xor a
    ld c, $10

jr_000_0127:
    ld [hl+], a
    dec c
    jr nz, jr_000_0127

    ld bc, $0800
    ld hl, $8800
    ld e, $aa
    ld [hl], e

    db "#", $7e, $cb, "?", $b6, "\"", $cb, $0b, $0d, " ", $f4

HeaderManufacturerCode::
    db "x", $05, $a7, " "

HeaderCGBFlag::
    db $ef

    call $b553
    ld de, $b896
    ld b, $c6
    rst $08
    ld h, d
    ld bc, $03b0
    ld de, $8000
    rst $08
    ld h, e
    ld bc, $0090
    ld de, $9220
    rst $08
    ld h, e
    rst $08
    ld de, $073e
    rst $08
    add hl, de
    ld hl, $1f0f
    rst $08
    or [hl]
    ld a, [$b594]
    ld l, a
    ld a, [$b595]
    ld h, a
    rst $08
    adc l
    call $b500
    ld a, $57
    ld [$c800], a
    ld a, $3f
    ld [$cbf1], a
    ret


    ld e, $00
    ld bc, $0400
    ld hl, $c800
    rst $08
    and [hl]
    ld a, $02
    ld [$c8f4], a
    ld hl, $b594
    ld a, [hl+]
    ld [$c8e9], a
    ld a, [hl+]
    ld [$c8ea], a
    ld a, [hl]
    ld [$c8eb], a
    ret


    ld a, [$c800]
    bit 1, a
    ret z

    ld a, [$c800]
    ld b, a
    ld a, [$c8e3]
    ld c, a
    ld a, [$c802]
    push af
    push bc
    call $a189
    pop bc
    pop af
    ld [$c802], a
    ld a, b
    ld [$c800], a
    ld a, c
    ld [$c8e3], a
    rst $08
    or l
    call $b553
    xor a
    ldh [$9b], a
    ldh [$9a], a
    ld hl, $0505
    rst $08
    cp b
    ld hl, $b597
    rst $08
    ld l, c
    ld hl, $0409
    rst $08
    cp b
    ld hl, $b5a3
    rst $08
    ld l, c
    ld hl, $040b
    rst $08
    cp b
    ld hl, $b5b1
    rst $08
    ld l, c
    call $b500
    call $a23a
    ld a, $02
    call $b580
    ld hl, $060e
    rst $08
    cp b
    ld hl, $b609
    rst $08
    ld l, c
    ld hl, $090e
    call $a591

jr_000_0206:
    rst $08
    or c
    rst $08
    adc [hl]
    ldh a, [$8b]
    bit 2, a
    jp nz, $a105

    bit 3, a
    jr z, jr_000_0206

    ldh a, [$8a]
    bit 0, a
    jr nz, jr_000_021f

    xor a
    ld [$c8e3], a

jr_000_021f:
    xor a
    rst $08
    inc de
    rst $08
    or l
    ld a, $f4
    ldh [$9b], a
    ld a, $04
    ldh [$9a], a
    ld hl, $c800
    res 1, [hl]
    ret


    ld hl, $1f0a
    rst $08
    or [hl]
    ld de, $ff44
    ld hl, $cbfe
    ld a, $80
    ld [hl], a
    xor a
    ld [$cbff], a

jr_000_0244:
    ld a, [de]
    and a
    jr nz, jr_000_0244

jr_000_0248:
    ldh a, [rSTAT]
    and $03
    jr nz, jr_000_0248

    ld a, [de]
    cp $8f
    jr z, jr_000_025f

    rrca
    jr c, jr_000_0259

    ld a, [hl]
    jr jr_000_025b

jr_000_0259:
    xor a
    sub [hl]

jr_000_025b:
    ldh [rSCY], a
    jr jr_000_0248

jr_000_025f:
    ldh a, [$8b]
    and $0f
    jr nz, jr_000_0278

    ld a, [hl]
    and a
    jr z, jr_000_0278

    ld a, [$cbff]
    inc a
    ld [$cbff], a
    and $07
    jr nz, jr_000_0244

    srl [hl]
    jr jr_000_0244

jr_000_0278:
    ld hl, $1f0f
    rst $08
    or [hl]
    ret


    ld a, [$c800]
    bit 6, a
    ret z

    rst $08
    or l
    xor a
    ldh [$83], a
    call $b553
    ld hl, $c8ed
    ld a, $63
    ld [hl+], a
    ld a, $0c
    ld [hl], a
    call $a63f
    ld hl, $cbd9
    ld bc, $0006
    ld a, $02
    ld [hl], a
    add hl, bc
    ld [hl], a
    add hl, bc
    ld [hl], a
    xor a
    ld [$c8f0], a
    ld [$c8ef], a
    xor a
    ld [$c8e5], a
    ld a, [$c8e3]
    ld c, $ff

jr_000_02b5:
    inc c
    sub $05
    jr nc, jr_000_02b5

    add $05
    cp $02
    jr nz, jr_000_02c6

    ld a, c
    or $80
    ld [$c8e5], a

jr_000_02c6:
    ld hl, $0508
    rst $08
    cp b
    ld hl, $b5bf
    rst $08
    ld l, c
    ld a, [$c8e3]
    inc a
    ld de, $2710
    add e
    ld e, a
    ld hl, $cbf2
    rst $08
    and e
    ld hl, $cbf6
    rst $08
    ld l, c
    call $b500
    ld a, $17
    call $b580
    ld de, $bb0b
    ld b, $c6
    rst $08
    ld h, d
    ld a, [$c8e3]
    inc a
    ld l, a

jr_000_02f7:
    ld de, $c803
    ld bc, $0014
    rst $08
    ld h, e
    dec l
    jr nz, jr_000_02f7

    call $b55e
    ld a, [$c8e5]
    and a
    jr z, jr_000_031d

    ld a, $1a
    call $b580
    ld hl, $030b
    rst $08
    cp b
    ld hl, $b5c6
    rst $08
    ld l, c
    call $b55e

jr_000_031d:
    ld hl, $ff83
    xor a
    ld [hl], a
    ld c, $0a
    call $b505
    rst $08
    or l
    ld bc, $4850
    ld de, $0001
    ld hl, $c8f5
    call $a61e
    ld hl, $c8fb
    inc [hl]
    ld bc, $3850
    ld de, $0002
    ld hl, $c905
    call $a61e
    ld hl, $c90b
    inc [hl]
    ld bc, $3f08
    ld de, $0003
    ld hl, $c915
    call $a61e
    ld a, $3f
    ld [$cbf1], a
    call $a480
    call $a657
    call $b500
    ld a, [$c8e5]
    and a
    jr nz, jr_000_0380

    ld e, $06
    ld a, [$c8e3]
    cp $0a
    jr c, jr_000_037a

    ld e, $08
    cp $14
    jr c, jr_000_037a

    ld e, $09

jr_000_037a:
    ld a, e
    call $b580
    jr jr_000_0385

jr_000_0380:
    ld a, $0f
    call $b580

jr_000_0385:
    ld hl, $c800
    res 6, [hl]
    ret


jr_000_038b:
    rst $08
    or c
    ldh a, [$8a]
    and a
    jr nz, jr_000_038b

    ret


    call $a393

jr_000_0396:
    rst $08
    or c
    ldh a, [$8b]
    and a
    jr z, jr_000_0396

    call $a393
    ret


    ld bc, $00cc
    ld e, $22
    ld hl, $c817
    rst $08
    and [hl]
    ld bc, $0011
    ld e, $23
    ld hl, $c817
    rst $08
    and [hl]
    ld bc, $0011
    ld hl, $c8d2
    rst $08
    and [hl]
    ld bc, $230a
    ld de, $0008
    ld hl, $c828

jr_000_03c6:
    ld [hl], b
    add hl, de
    ld [hl], b
    add hl, de
    ld [hl], b
    inc hl
    dec c
    jr nz, jr_000_03c6

    ld a, $22
    ld [$c830], a
    ret


    ld hl, $c803
    ld e, l
    ld d, h
    ld hl, $c829
    ld c, $0a

jr_000_03df:
    push bc
    ld a, [de]
    inc de
    sla a
    ld bc, $2307

jr_000_03e7:
    sla a
    jr nc, jr_000_03ec

    ld [hl], b

jr_000_03ec:
    inc hl
    dec c
    jr nz, jr_000_03e7

    inc hl
    ld a, [de]
    inc de
    sla a
    ld c, $07

jr_000_03f7:
    sla a
    jr nc, jr_000_03fc

    ld [hl], b

jr_000_03fc:
    inc hl
    dec c
    jr nz, jr_000_03f7

    inc hl
    inc hl
    pop bc
    dec c
    jr nz, jr_000_03df

    ret


    ld a, $24
    ld [$c8e4], a
    ld a, [$c8e3]
    ld hl, $bdd2
    ld c, a
    ld b, $00
    sla c
    rl b
    add hl, bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, e
    ld h, d

jr_000_041f:
    ld a, [hl+]

jr_000_0420:
    and a
    ret z

    push af
    ld a, [hl+]
    push hl
    ld hl, $c817
    add $11
    ld e, a
    srl a
    srl a
    srl a
    srl a
    add e
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [$c8e4]
    ld [hl], a
    pop hl
    pop af
    dec a
    jr jr_000_0420

    ld a, $2a
    ld [$c8e4], a
    ld hl, $bf60
    ld b, $00
    sla c
    rl b
    add hl, bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, e
    ld h, d
    jr jr_000_041f

    ld c, $0c
    ld de, $c817
    ld hl, $98a0

jr_000_045f:
    push bc
    ld bc, $0011
    push hl
    push de
    rst $08
    ld [bc], a
    pop de
    ld hl, $0011
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld bc, $0020
    add hl, bc
    pop bc
    dec c
    jr nz, jr_000_045f

    ret


    call $a3a9
    call $a3dd
    call $a40f
    ld a, [$c8e5]
    and a
    jr z, jr_000_048f

    and $7f
    ld c, a
    call $a449
    jr jr_000_04ab

jr_000_048f:
    ld hl, $cbd9
    ld c, $03
    ld e, $46

jr_000_0496:
    push hl
    rst $08
    adc [hl]
    and $03
    add $03
    ld b, a
    rst $08
    adc [hl]
    pop hl
    call $a4c5
    ld a, e
    sub $19
    ld e, a
    dec c
    jr nz, jr_000_0496

jr_000_04ab:
    ld hl, $cbeb
    push hl
    rst $08
    adc [hl]
    pop hl
    ld e, $28
    ld b, $07
    call $a4c5
    call $a45f
    ret


    ld d, $00
    ld [hl], d
    inc hl
    and $07
    add e
    ld [hl+], a
    push bc

jr_000_04c6:
    push hl
    rst $08
    adc [hl]
    ld b, a
    rst $08
    adc [hl]
    pop hl
    and $0f
    jr z, jr_000_04c6

    ld [hl], a
    ld a, b
    and $0f
    cp $0b
    jr nc, jr_000_04c6

    inc hl
    ld [hl-], a
    push hl
    ld b, [hl]
    inc hl
    ld c, [hl]
    call $add7
    ld a, [hl]
    pop hl
    cp $22
    jr nz, jr_000_04c6

    inc hl
    inc hl
    pop bc
    ld a, b
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    ret


    ld hl, $0002
    rst $08
    cp b
    ld hl, $b5f8
    rst $08
    ld l, c
    ld hl, $0a02
    rst $08
    cp b
    ld hl, $b5ff
    rst $08
    ld l, c
    ld hl, $0003
    rst $08
    cp b
    ld hl, $b605
    rst $08
    ld l, c
    ld hl, $0903
    rst $08
    cp b
    ld hl, $b609
    rst $08
    ld l, c
    ld hl, $0a11
    rst $08
    cp b
    ld hl, $b60d
    rst $08
    ld l, c
    ret


    ld hl, $cbf2
    rst $08
    and b
    ld hl, $cbf2
    ld c, $0c

jr_000_052e:
    ld a, [hl]
    cp $20
    jr nz, jr_000_0535

    ld a, $30

jr_000_0535:
    ld [hl+], a
    dec c
    jr nz, jr_000_052e

    ret


    ld hl, $cbf2
    ld bc, $0000
    ld d, c
    ld a, [$c8e3]
    inc a
    ld e, a
    call $a52c
    ld hl, $0602
    rst $08
    cp b
    ld hl, $cbfb
    rst $08
    ld l, c
    ret


    ld hl, $cbf2
    ld bc, $0000
    ld d, c
    ld a, [$c8f4]
    ld e, a
    call $a52c
    ld hl, $0f02
    rst $08
    cp b
    ld hl, $cbfb
    rst $08
    ld l, c
    ret


    ld b, $00
    ld hl, $c8e6
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ld c, a
    ld hl, $cbf2
    call $a52c
    ld hl, $0303
    rst $08
    cp b
    ld hl, $cbf8
    rst $08
    ld l, c
    ret


    push hl
    ld b, $00
    ld hl, $c8e9
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ld c, a
    ld hl, $cbf2
    call $a52c
    pop hl
    rst $08
    cp b
    ld hl, $cbf8
    rst $08
    ld l, c
    ret


    ld bc, $0000
    ld a, [$c8ed]
    ld e, a
    ld d, c
    ld hl, $cbf2
    call $a52c
    ld hl, $0f11
    rst $08
    cp b
    ld hl, $cbfb
    rst $08
    ld l, c
    ret


    ld a, [$c800]
    bit 1, a
    ret nz

    ld a, [$cbf1]
    bit 0, a
    push af
    call nz, $a4f9
    pop af
    bit 1, a
    push af
    call nz, $a542
    pop af
    bit 2, a
    push af
    call nz, $a55c
    pop af
    bit 3, a
    push af
    call nz, $a575
    pop af
    bit 4, a
    push af
    ld hl, $0c03
    call nz, $a591
    pop af
    bit 5, a
    call nz, $a5ac
    xor a
    ld [$cbf1], a
    ret


    ld e, $0f
    ld bc, $0010
    ld hl, $c947

jr_000_05fe:
    ld a, [hl]
    and a
    jr z, jr_000_0608

    add hl, bc
    dec e
    jr nz, jr_000_05fe

    scf
    ret


jr_000_0608:
    ld bc, $fffe
    add hl, bc
    and a
    ret


    push bc
    push de
    call $a5fe
    pop de
    pop bc
    ret c

    push hl
    ld [hl], c
    inc hl
    ld [hl], b
    inc hl
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    ld a, $01
    ld [hl+], a
    ld a, $02
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    ld a, $04
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    pop hl
    ret


    ld a, $06
    ld [$cbd8], a
    ld bc, $0140
    ld e, $00
    ld hl, $c8f5
    rst $08
    and [hl]
    ld bc, $0190
    ld hl, $ca48
    rst $08
    and [hl]
    ret


    ld a, [$c8e3]
    push af
    cp $08
    jr c, jr_000_066e

    ld bc, $4820
    ld de, $0006
    call $a616
    ld c, $05
    ld a, $01
    call $aa0b
    ld c, $0a
    ld a, $10
    call $aa0b

jr_000_066e:
    pop af
    ld c, a
    ld b, $00
    sla c
    rl b
    ld hl, $bc82
    add hl, bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, e
    ld h, d
    ld a, [hl+]

jr_000_0680:
    and a
    ret z

    push af
    ld a, [hl+]
    ld b, a
    and $f0
    srl a
    add $08
    ld c, a
    ld a, b
    and $0f
    sla a
    sla a
    sla a
    add $08
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, $00
    push hl
    call $a616
    pop hl
    pop af
    dec a
    jr jr_000_0680

    ld hl, $0100
    rst $08
    or [hl]
    ld bc, $2800
    rst $08
    call nz, Main
    ret z

    bit 2, a
    jr z, jr_000_06dd

    xor a

jr_000_06b7:
    push af
    call $a6eb
    pop af
    inc a
    cp $06
    jr nz, jr_000_06b7

    ld c, $0e
    ld a, [$cbd8]

jr_000_06c6:
    cp $14
    jr c, jr_000_06cc

    ld a, $06

jr_000_06cc:
    ld [$cbd8], a
    push bc
    call $a6eb
    pop bc
    jr c, jr_000_06dd

    ld a, [$cbd8]
    inc a
    dec c
    jr nz, jr_000_06c6

jr_000_06dd:
    ld hl, $0101
    rst $08
    or [hl]
    ret


    push af
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    ld hl, $c8f5
    add hl, bc
    ld a, [hl+]
    add $34
    ld e, a
    ld a, [hl+]
    add $14
    ld d, a
    ld a, [hl]
    pop bc
    and a
    ret z

    ld a, b
    push de
    call $a71d
    pop de
    ld a, $ff
    rst $08
    ld h, b
    cp $29
    ccf
    ret


    ld hl, $a766
    push hl
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    ld hl, $c8f5
    add hl, bc
    ld c, $07
    call $aa00
    ld c, a
    push bc
    ld c, $05
    call $aa00
    pop bc
    ld b, a
    push bc
    ld c, $02
    call $aa00
    pop bc
    dec a
    jr z, jr_000_076b

    dec a
    jr z, jr_000_07ab

    dec a
    jp z, $a7da

    dec a
    jp z, $a7e9

    dec a
    jp z, $a7fc

    dec a
    jp z, $a800

    jp $a81a


    ld b, $00
    sla c
    rl b
    add hl, bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, e
    ld h, d
    ret


jr_000_076b:
    ld a, [$c800]
    bit 3, a
    jr z, jr_000_077c

    ld a, [$c8fc]
    and $01
    ld c, a
    ld hl, $b633
    ret


jr_000_077c:
    ld a, [$c8f9]
    bit 1, a
    jr z, jr_000_078d

    ld a, [$c8fc]
    and $01
    ld c, a
    ld hl, $b637
    ret


jr_000_078d:
    ld hl, $b613

jr_000_0790:
    ld a, [$c8f0]
    rra
    jr nc, jr_000_079d

    push hl
    ld hl, sp+$06
    ld a, $a8
    ld [hl], a
    pop hl

jr_000_079d:
    ld d, $00
    ld e, b
    sla e
    rl d
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, e
    ld h, d
    ret


jr_000_07ab:
    ld a, [$c800]
    bit 3, a
    jr z, jr_000_07bc

    ld a, [$c90c]
    and $01
    ld c, a
    ld hl, $b65b
    ret


jr_000_07bc:
    ld a, [$c909]
    bit 1, a
    jr z, jr_000_07cd

    ld a, [$c90c]
    and $01
    ld c, a
    ld hl, $b65f
    ret


jr_000_07cd:
    ld hl, $b63b
    jr jr_000_0790

    ld a, [$c919]
    bit 7, a
    jr nz, jr_000_07dd

    ld hl, $b665
    ret


jr_000_07dd:
    ld hl, $b663
    ret


    push bc
    ld c, $04
    call $aa00
    pop bc
    bit 1, a
    jr nz, jr_000_07f0

    ld hl, $b667
    ret


jr_000_07f0:
    ld hl, $b66f
    ret


    ld hl, $b677
    ret


    ld hl, $b67f
    srl b
    sla b
    sla b
    ld e, b
    ld d, $00
    add hl, de
    ld a, [$c8ef]
    rra
    ret nc

    push hl
    ld hl, sp+$06
    ld a, $a0
    ld [hl], a
    pop hl
    ret


    ld hl, $b687
    ld e, b
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    add hl, de
    ret


    ld hl, $ca48
    ld e, a
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    add hl, de
    sla e
    rl d
    sla e
    rl d
    add hl, de
    ret


    and a
    ld a, [$c8f9]
    bit 4, a
    ret z

    ld a, [$c909]
    bit 4, a
    ret z

    scf
    ret


    push af
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    ld hl, $c8f5
    add hl, bc
    ld a, [hl+]
    ld [$ca35], a
    ld c, a
    ld a, [hl-]
    ld [$ca3d], a
    ld b, a
    ld a, [hl+]
    ld [$ca36], a
    ld a, [hl-]
    ld [$ca3e], a
    ld a, e
    ld [$ca37], a
    ld a, d
    ld [$ca3f], a
    ld a, e
    sub c
    ld [$ca38], a
    ld l, a
    ld a, $00
    sbc $00
    ld [$ca39], a
    ld h, a
    ld a, d
    sub b
    ld [$ca40], a
    ld e, a
    ld a, $00
    sbc $00
    ld [$ca41], a
    ld d, a
    ld a, l
    or h
    jr z, jr_000_08a0

    ld a, h
    sla a
    inc a

jr_000_08a0:
    ld [$ca3c], a
    rst $08
    adc h
    ld a, l
    ld [$ca3a], a
    ld a, h
    ld [$ca3b], a
    push hl
    ld l, e
    ld h, d
    ld a, l
    or h
    jr z, jr_000_08b8

    ld a, h
    sla a
    inc a

jr_000_08b8:
    ld [$ca46], a
    rst $08
    adc h
    ld a, l
    ld [$ca44], a
    ld a, h
    ld [$ca45], a
    ld e, l
    ld d, h
    pop hl
    push hl
    push de
    ld c, $07
    rst $08
    add h
    ld a, l
    and a
    jr nz, jr_000_08d8

    pop hl
    pop de
    ld a, $01
    jr jr_000_08dc

jr_000_08d8:
    pop de
    pop hl
    ld a, $02

jr_000_08dc:
    ld [$ca47], a
    rst $08
    adc e
    ld a, l
    ld [$ca42], a
    ld a, h
    ld [$ca43], a
    pop af
    call $a82a
    ld de, $ca35
    ld bc, $0014
    rst $08
    ld [bc], a
    ret


    push af
    call $a82a
    ld e, l
    ld d, h
    ld hl, $ca35
    ld bc, $0014
    rst $08
    ld [bc], a
    ld a, [$ca47]
    and a
    jr z, jr_000_0914

    ld hl, $a91c
    push hl
    cp $01
    jr nz, jr_000_0954

    jr jr_000_0921

jr_000_0914:
    pop af
    call $a82a
    ld de, $ca35
    ld bc, $0014
    rst $08
    ld [bc], a
    ret


jr_000_0921:
    ld a, [$ca3e]
    ld b, a
    ld a, [$ca3f]
    cp b
    jr nz, jr_000_0930

    xor a
    ld [$ca47], a
    ret


jr_000_0930:
    ld a, [$ca46]
    add b
    ld [$ca3e], a
    ld hl, $ca3a
    call $a98f
    bit 7, h
    ret nz

    ld e, l
    ld d, h
    ld bc, $ca44
    call $a9a9
    ld a, [$ca3c]
    ld b, a
    ld a, [$ca36]
    add b
    ld [$ca36], a
    ret


jr_000_0954:
    ld a, [$ca36]
    ld b, a
    ld a, [$ca37]
    cp b
    jr nz, jr_000_0963

    xor a
    ld [$ca47], a
    ret


jr_000_0963:
    ld a, [$ca3c]
    add b
    ld [$ca36], a
    ld hl, $ca44
    call $a98f
    bit 7, h
    ret nz

    ld e, l
    ld d, h
    ld bc, $ca3a
    call $a9a9
    ld a, [$ca46]
    ld b, a
    ld a, [$ca3e]
    add b
    ld [$ca3e], a
    ret


    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld a, [$ca42]
    ld l, a
    ld a, [$ca43]
    ld h, a
    sla c
    rl b
    add hl, bc
    ld a, l
    ld [$ca42], a
    ld a, h
    ld [$ca43], a
    ret


    ld a, [bc]
    ld l, a
    inc bc
    ld a, [bc]
    ld h, a
    sla l
    rl h
    rst $08
    adc b
    ld a, l
    ld [$ca42], a
    ld a, h
    ld [$ca43], a
    ret


    ld a, [$c800]
    bit 0, a
    ret z

    ld c, $14
    ld hl, $c8f7

jr_000_09c0:
    push bc
    push hl
    ld e, l
    ld d, h
    ld bc, $a9e6
    push bc
    ld c, [hl]
    ld b, $00
    sla c
    rl b
    ld hl, $a9f0
    add hl, bc
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld l, e
    ld h, d
    ld de, $fffe
    add hl, de
    push bc
    ret


    pop hl
    ld bc, $0010
    add hl, bc
    pop bc
    dec c
    jr nz, jr_000_09c0

    ret


    push hl
    xor c
    or $aa
    push hl
    xor c
    or [hl]
    xor h
    db $d3
    xor h
    db $d3
    xor h
    ld b, h
    xor l
    push hl
    xor c
    push hl
    ld a, c
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    pop hl
    ret


    push hl
    ld b, a
    ld a, c
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld [hl], b
    pop hl
    ret


    ld c, $06
    call $aa00
    ld e, a
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    ld b, a
    ld d, $00
    push bc
    push de
    push hl
    ld a, b
    sub e
    ld b, a
    call $adf8
    pop hl
    pop de
    pop bc
    rl d
    push bc
    push de
    push hl
    ld a, c
    add e
    ld c, a
    call $adf8
    pop hl
    pop de
    pop bc
    rl d
    push bc
    push de
    push hl
    ld a, b
    add e
    ld b, a
    call $adf8
    pop hl
    pop de
    pop bc
    rl d
    push bc
    push de
    push hl
    ld a, c
    sub e
    ld c, a
    call $adf8
    pop hl
    pop de
    pop bc
    rl d
    ld c, $05
    call $aa00
    xor $02
    ld c, $01
    and a
    jr z, jr_000_0a64

jr_000_0a5f:
    sla c
    dec a
    jr nz, jr_000_0a5f

jr_000_0a64:
    ld a, d
    or c
    ret


    ld a, e
    push bc
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    ld hl, $c8f5
    add hl, bc
    pop bc
    ld a, [hl+]
    add c
    ld c, a
    ld a, [hl-]
    add b
    ld b, a
    push hl
    call $adf8
    pop hl
    ret c

    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ret


    push de
    push bc
    ld b, $02
    call $aa6f
    pop bc
    pop de
    ret nc

    ld b, $fe
    call $aa6f
    ret


    push de
    push bc
    ld c, $02
    call $aa6f
    pop bc
    pop de
    ret nc

    ld c, $fe
    call $aa6f
    ret


    ldh a, [$8a]
    bit 6, a
    push af
    call nz, $ab8e
    pop af
    bit 7, a
    call nz, $abc5
    ret


    ldh a, [$8a]
    bit 5, a
    push af
    call nz, $abfb
    pop af
    bit 4, a
    call nz, $ac32
    ret


    ldh a, [$8a]
    bit 6, a
    push af
    call nz, $aba9
    pop af
    bit 7, a
    call nz, $abe0
    ret


    ldh a, [$8a]
    bit 5, a
    push af
    call nz, $ac17
    pop af
    bit 4, a
    call nz, $ac4c
    ret


    call $a843
    jr c, jr_000_0b3d

    ldh a, [$8a]
    bit 0, a
    jr nz, jr_000_0b39

    ld a, [$c8f9]
    bit 1, a
    jr nz, jr_000_0b15

    ld a, [$c8fa]
    bit 0, a
    jr nz, jr_000_0b0f

    call $aaba
    call $aac9
    jr jr_000_0b15

jr_000_0b0f:
    call $aac9
    call $aaba

jr_000_0b15:
    ld a, [$c909]
    bit 1, a
    jr nz, jr_000_0b31

    ld a, [$c90a]
    bit 0, a
    jr nz, jr_000_0b2b

    call $aad8
    call $aae7
    jr jr_000_0b31

jr_000_0b2b:
    call $aae7
    call $aad8

jr_000_0b31:
    xor a
    ld [$c927], a
    ld [$c937], a
    ret


jr_000_0b39:
    call $ac69
    ret


jr_000_0b3d:
    xor a
    ld [$c927], a
    ld [$c937], a
    ld c, $03

jr_000_0b46:
    push bc
    xor a
    call $a8fe
    ld a, $01
    call $a8fe
    pop bc
    dec c
    jr nz, jr_000_0b46

    ld a, [$ca49]
    ld [$c8f5], a
    ld a, [$ca51]
    ld [$c8f6], a
    ld a, [$ca5d]
    ld [$c905], a
    ld a, [$ca65]
    ld [$c906], a
    ld a, [$ca5a]
    and a
    jr nz, jr_000_0b79

    ld hl, $c8f9
    ld a, [hl]
    res 4, a
    ld [hl], a

jr_000_0b79:
    ld a, [$ca6e]
    and a
    ret nz

    ld hl, $c909
    ld a, [hl]
    res 4, a
    ld [hl], a
    ret


    ld a, [$c8fb]
    cpl
    inc a
    ld c, a
    ld b, $00
    ld e, b
    push bc
    call $aa6f
    pop bc
    jr nc, jr_000_0b9c

    ld e, $00
    call $aa9a
    ret c

jr_000_0b9c:
    xor a
    ld [$c8fa], a
    ret


    ld a, [$c90b]
    cpl
    inc a
    ld c, a
    ld b, $00
    ld e, $01
    push bc
    call $aa6f
    pop bc
    jr nc, jr_000_0bb8

    ld e, $01
    call $aa9a
    ret c

jr_000_0bb8:
    xor a
    ld [$c90a], a
    ret


    ld a, [$c8fb]
    ld c, a
    ld b, $00
    ld e, $00
    push bc
    call $aa6f
    pop bc
    jr nc, jr_000_0bd2

    ld e, $00
    call $aa9a
    ret c

jr_000_0bd2:
    ld a, $02
    ld [$c8fa], a
    ret


    ld a, [$c90b]
    ld c, a
    ld b, $00
    ld e, $01
    push bc
    call $aa6f
    pop bc
    jr nc, jr_000_0bed

    ld e, $01
    call $aa9a
    ret c

jr_000_0bed:
    ld a, $02
    ld [$c90a], a
    ret


    ld a, [$c8fb]
    cpl
    inc a
    ld b, a
    ld c, $00
    ld e, c
    push bc
    call $aa6f
    pop bc
    jr nc, jr_000_0c09

    ld e, $00
    call $aaaa
    ret c

jr_000_0c09:
    ld a, $03
    ld [$c8fa], a
    ret


    ld a, [$c90b]
    ld b, a
    ld c, $00
    ld e, $01
    push bc
    call $aa6f
    pop bc
    jr nc, jr_000_0c24

    ld e, $01
    call $aaaa
    ret c

jr_000_0c24:
    ld a, $01
    ld [$c90a], a
    ret


    ld a, [$c8fb]
    ld b, a
    ld c, $00
    ld e, c
    push bc
    call $aa6f
    pop bc
    jr nc, jr_000_0c3e

    ld e, $00
    call $aaaa
    ret c

jr_000_0c3e:
    ld a, $01
    ld [$c8fa], a
    ret


    ld a, [$c90b]
    cpl
    inc a
    ld b, a
    ld c, $00
    ld e, $01
    push bc
    call $aa6f
    pop bc
    jr nc, jr_000_0c5b

    ld e, $01
    call $aaaa
    ret c

jr_000_0c5b:
    ld a, $03
    ld [$c90a], a
    ret


    ld a, [$c8f9]
    bit 1, a
    jr nz, jr_000_0c84

    ld a, [$c927]
    and a
    jr nz, jr_000_0c88

    ld hl, $c8f5
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld e, $07
    ld hl, $c925
    call $a61e
    ld a, [$c8fa]
    ld [$c92a], a
    jr jr_000_0c88

jr_000_0c84:
    xor a
    ld [$c927], a

jr_000_0c88:
    ld a, [$c909]
    bit 1, a
    jr nz, jr_000_0ca9

    ld a, [$c937]
    and a
    ret nz

    ld hl, $c905
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld e, $07
    ld hl, $c935
    call $a61e
    ld a, [$c90a]
    ld [$c93a], a
    ret


jr_000_0ca9:
    xor a
    ld [$c937], a
    ret


    ld c, $0b
    call $aa00
    and a
    jr z, jr_000_0cbb

    dec a
    call $aa0b
    ret


jr_000_0cbb:
    ld a, $04
    call $aa0b
    ld c, $01
    call $aa00
    xor $01
    call $aa0b
    ret


    call $a843
    ret c

    ld c, $04
    call $aa00
    bit 1, a
    ret nz

    call $aa17
    cp $0f
    jr nz, jr_000_0cea

    ld c, $05
    call $aa00
    xor $02
    call $aa0b
    jr jr_000_0d08

jr_000_0cea:
    ld d, a

jr_000_0ceb:
    push hl
    rst $08
    adc [hl]
    pop hl
    ld b, a
    and $03
    ld c, $01

jr_000_0cf4:
    and a
    jr z, jr_000_0cfc

    sla c
    dec a
    jr jr_000_0cf4

jr_000_0cfc:
    ld a, d
    and c
    jr nz, jr_000_0ceb

    ld a, b
    and $03
    ld c, $05
    call $aa0b

jr_000_0d08:
    ld c, $05
    call $aa00
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    ld b, a
    ld a, d
    and a
    jr z, jr_000_0d24

    dec a
    jr z, jr_000_0d2c

    dec a
    jr z, jr_000_0d34

    ld a, b
    sub e
    ld c, $01
    call $aa0b
    ret


jr_000_0d24:
    ld a, c
    sub e
    ld c, $00
    call $aa0b
    ret


jr_000_0d2c:
    ld a, b
    add e
    ld c, $01
    call $aa0b
    ret


jr_000_0d34:
    ld a, c
    add e
    ld c, $00
    call $aa0b
    ret


    call $a843
    ret c

    ld a, [$cabe]
    and a
    jr z, jr_000_0d76

    push hl
    ld a, $05
    call $a8fe
    pop hl
    ld c, $07
    call $aa00
    ld a, [$caad]
    ld [hl+], a
    ld a, [hl]
    ld c, a
    ld a, [$cab5]
    ld [hl-], a
    cp c
    ret z

    jr c, jr_000_0d6b

    ld c, $05
    call $aa00
    res 1, a
    call $aa0b
    ret


jr_000_0d6b:
    ld c, $05
    call $aa00
    set 1, a
    call $aa0b
    ret


jr_000_0d76:
    ld c, $0a
    call $aa00
    ld b, a
    push hl
    rst $08
    adc [hl]
    pop hl
    and $0f
    inc a
    add b

jr_000_0d84:
    sub $11
    jr nc, jr_000_0d84

    add $11
    ld e, a
    call $aa0b
    ld hl, $ada9

jr_000_0d91:
    ld d, $00

jr_000_0d93:
    sla e

jr_000_0d95:
    rl d
    add hl, de
    ld a, [hl+]
    ld d, a
    ld e, [hl]
    ld a, $05
    call $a852
    ret


    inc b
    inc b
    db $10
    jr @+$0a

    inc l
    db $10
    ld c, b
    inc b
    ld d, h
    ld b, h
    ld [$203c], sp
    ld b, b
    jr c, jr_000_0dea

    ld d, b
    ld a, h
    inc b
    ld [hl], b
    jr jr_000_0e30

    inc l
    ld [hl], b
    ld c, b
    ld a, h
    ld d, h
    inc h
    inc l
    ld e, h
    inc l
    ld c, b
    jr nz, @-$33

    jr c, jr_000_0d91

    jr c, jr_000_0d93

    jr c, jr_000_0d95

    add hl, sp
    srl c
    srl c
    ld hl, $c817
    push bc
    ld b, $00
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    pop bc
    ld a, c
    add b
    add l

jr_000_0dea:
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ret


    push bc
    call $adcb
    pop bc
    ld a, [hl]
    cp $23
    jr nz, jr_000_0dfc

    scf
    ret


jr_000_0dfc:
    push bc
    ld a, b
    add $07
    ld b, a
    call $adcb
    pop bc
    ld a, [hl]
    cp $23
    jr nz, jr_000_0e0c

    scf
    ret


jr_000_0e0c:
    push bc
    ld a, c
    add $07
    ld c, a
    call $adcb
    pop bc
    ld a, [hl]
    cp $23
    jr nz, jr_000_0e1c

    scf
    ret


jr_000_0e1c:
    push bc
    ld a, b
    add $07
    ld b, a
    ld a, c
    add $07
    ld c, a
    call $adcb
    pop bc
    ld a, [hl]
    cp $23
    jr nz, jr_000_0e30

    scf
    ret


jr_000_0e30:
    and a
    ret


    ld c, [hl]
    ld a, [de]
    add $06
    sub c
    ccf
    ret nc

    cp $10
    ret nc

    inc hl
    ld c, [hl]
    dec hl
    inc de
    ld a, [de]
    dec de
    add $06
    sub c
    ccf
    ret nc

    cp $10
    ret


    ld bc, $c8f5
    ld hl, $c905
    ld e, [hl]
    ld a, [bc]
    cp e
    jr nz, jr_000_0e6e

    cp $08
    jr nz, jr_000_0e6e

    inc bc
    inc hl
    ld a, [bc]
    ld e, [hl]
    cp e
    jr c, jr_000_0e63

    ld d, a
    ld a, e
    ld e, d

jr_000_0e63:
    cp $38
    jr nz, jr_000_0e6e

    ld a, e
    cp $48
    jr nz, jr_000_0e6e

    scf
    ret


jr_000_0e6e:
    and a
    ret


    ld a, [$c800]
    bit 4, a
    ret z

    call $ae52
    jr nc, jr_000_0e90

    ld a, [$c800]
    and $ef
    or $08
    ld [$c800], a
    ld a, $22
    ld [$c8f1], a
    ld a, $15
    call $b580
    ret


jr_000_0e90:
    call $a843
    jr c, jr_000_0f0a

    ld a, [$c8f9]
    bit 1, a
    jr nz, jr_000_0ecd

    ld hl, $c925
    call $af31
    ld hl, $c8f5
    call $b009
    ld a, [$c8f0]
    and a
    jr nz, jr_000_0ecd

    ld a, [$c8f9]
    bit 3, a
    jr nz, jr_000_0ecd

    ld hl, $c8f5
    call $b088
    ld a, [$c8f9]
    bit 1, a
    jr z, jr_000_0ecd

    ld a, $24
    ld [$c8e4], a
    ld hl, $c8f5
    call $b11b

jr_000_0ecd:
    call $a843
    jr c, jr_000_0f0a

    ld a, [$c909]
    bit 1, a
    jr nz, jr_000_0f0a

    ld hl, $c935
    call $af31
    ld hl, $c905
    call $b009
    ld a, [$c8f0]
    and a
    jr nz, jr_000_0f0a

    ld a, [$c909]
    bit 3, a
    jr nz, jr_000_0f0a

    ld hl, $c905
    call $b088
    ld a, [$c909]
    bit 1, a
    jr z, jr_000_0f0a

    ld a, $24
    ld [$c8e4], a
    ld hl, $c905
    call $b11b

jr_000_0f0a:
    ld a, [$c8f9]
    bit 1, a
    ret z

    ld a, [$c909]
    bit 1, a
    ret z

    ld hl, $c800
    bit 5, [hl]
    ret nz

    set 5, [hl]
    ld a, $28
    ld [$c8f2], a
    ld a, $19
    call $b580
    ret


    ld c, $02
    call $aa00
    and a
    ret z

    push hl
    ld bc, $ffd0
    add hl, bc
    call $afe3
    pop hl
    ld c, [hl]
    ld [hl], e
    inc hl
    ld b, [hl]
    ld [hl], d
    dec hl
    push bc
    push de
    push hl
    ld c, $0f
    ld e, l
    ld d, h
    ld hl, $c945

jr_000_0f49:
    push bc
    call $ae3a
    jr nc, jr_000_0f7a

    ld c, $02
    call $aa00
    cp $04
    jr nz, jr_000_0f7a

    ld c, $04
    call $aa00
    bit 1, a
    jr nz, jr_000_0f7a

    set 1, a
    call $aa0b
    ld a, $08
    ld c, $0c
    call $aa0b
    push hl
    ld a, $03
    call $b58a
    pop hl
    ld bc, $00c8
    call $b286

jr_000_0f7a:
    ld bc, $0010
    add hl, bc
    pop bc
    dec c
    jr nz, jr_000_0f49

    pop hl
    pop de
    pop bc
    ld [hl], c
    inc hl
    ld [hl], b
    dec hl
    ld a, $03
    add d
    ld b, a
    ld a, $03
    add e
    ld c, a
    push bc
    call $adcb
    pop bc
    ld a, [hl]
    cp $24
    ret nz

    ld a, $22
    ld [hl], a
    ld a, b
    srl a
    srl a
    srl a
    ld h, a
    ld a, c
    srl a
    srl a
    srl a
    add $05
    ld l, a
    rst $08
    cp b
    ld a, $22
    rst $08
    cp e
    ld hl, $c8f0
    ld a, [hl]
    push af
    xor a
    ld [hl], a
    ld hl, $c8f9
    ld a, [hl]
    and $f5
    ld [hl], a
    ld hl, $c909
    ld a, [hl]
    and $f5
    ld [hl], a
    ld hl, $c8f5
    call $b009
    ld hl, $c905
    call $b009
    pop af
    ld [$c8f0], a
    ret


    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    ld c, $05
    call $aa00
    and a
    jr z, jr_000_0ff2

    dec a
    jr z, jr_000_0ff7

    dec a
    jr z, jr_000_0ffc

    ld a, d
    sub $08
    ld d, a
    ret


jr_000_0ff2:
    ld a, e
    sub $08
    ld e, a
    ret


jr_000_0ff7:
    ld a, d
    add $0a
    ld d, a
    ret


jr_000_0ffc:
    ld a, e
    add $0a
    ld e, a
    ret


    ld e, $00
    ld c, $05
    call $aa00
    and a
    jr z, jr_000_1011

    cp $03
    jr z, jr_000_1011

    ld e, $02

jr_000_1011:
    ld a, [hl+]
    add $03
    add e
    ld c, a
    ld a, [hl-]
    add $03
    add e
    ld b, a
    push hl
    call $adcb
    ld a, [hl]
    pop hl
    cp $24
    jr z, jr_000_1064

    sub $25
    ret c

    ld c, a
    ld b, $00
    cp $04
    jr nz, jr_000_1044

    ld a, [$c8f9]
    or $20
    ld [$c8f9], a
    ld a, [$c909]
    or $20
    ld [$c909], a
    ld a, $c8
    ld [$c8f0], a

jr_000_1044:
    push hl
    ld a, $20
    call $b58a
    pop hl
    push hl
    ld hl, $b07c
    sla c
    rl b
    add hl, bc
    ld c, [hl]
    inc hl
    ld b, [hl]
    call $b286
    pop hl
    ld a, $22
    ld [$c8e4], a
    call $b11b
    ret


jr_000_1064:
    ld a, [$c8f0]
    and a
    ret nz

    ld c, $04
    call $aa00
    or $0a
    call $aa0b
    ret


    inc l
    ld bc, $0258
    add sp, $03
    call c, $c805
    nop
    db $f4
    ld bc, $545d
    ld c, $0f
    ld hl, $c945
    push bc
    push de
    push hl
    ld c, $02
    call $aa00
    and a
    jr z, jr_000_1107

    ld c, $04
    call $aa00
    bit 1, a
    jr nz, jr_000_1107

    call $ae3a
    jr nc, jr_000_1107

    ld c, $02
    call $aa00
    inc de
    inc de
    inc de
    inc de
    cp $06
    jr nc, jr_000_10bf

    ld a, [$c8f9]
    set 1, a
    ld [$c8f9], a
    ld a, [$c909]
    set 1, a
    ld [$c909], a
    jr jr_000_1107

jr_000_10bf:
    ld hl, $c8ef
    ld a, [hl]
    and a
    jr nz, jr_000_1107

    ld a, $64
    ld [hl], a
    ld a, [$c8f9]
    set 4, a
    and $f5
    ld [$c8f9], a
    ld a, [$c909]
    set 4, a
    and $f5
    ld [$c909], a
    ld a, [$c8fa]
    ld e, a
    ld a, [$c90a]
    ld [$c8fa], a
    ld a, e
    ld [$c90a], a
    ld a, $27
    call $b58a
    ld hl, $c905
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    ld d, a
    xor a
    call $a852
    ld hl, $c8f5
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    ld d, a
    ld a, $01
    call $a852

jr_000_1107:
    pop hl
    ld bc, $0010
    add hl, bc
    pop de
    pop bc
    dec c
    jp nz, $b08f

    ret


    ld e, $00
    ld c, $05
    call $aa00
    and a
    jr z, jr_000_1123

    cp $03
    jr z, jr_000_1123

    ld e, $02

jr_000_1123:
    ld a, [hl+]
    add $03
    add e
    ld c, a
    ld a, [hl-]
    add $03
    add e
    ld b, a
    push bc
    call $adcb
    pop bc
    ld a, [$c8e4]
    ld [hl], a
    ld a, b
    srl a
    srl a
    srl a
    ld h, a
    ld a, c
    srl a
    srl a
    srl a
    add $05
    ld l, a
    rst $08
    cp b
    ld a, [$c8e4]
    rst $08
    cp e
    ret


    ld a, [$c800]
    bit 2, a
    ret z

    ld hl, $c8f5
    ld c, $14

jr_000_115b:
    push bc
    ld c, $02
    call $aa00
    ld d, a
    and a
    jr z, jr_000_11a1

    ld c, $08
    call $aa00
    dec a
    ld e, a
    call $aa0b
    ld a, e
    and a
    jr nz, jr_000_117c

    push hl
    ld bc, $0009
    add hl, bc
    ld a, [hl-]
    ld [hl-], a
    inc [hl]
    pop hl

jr_000_117c:
    ld c, $05
    call $aa00
    push hl
    ld hl, $b1d3
    ld c, a
    ld b, $00
    add hl, bc
    ld c, d
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld e, [hl]
    pop hl
    ld c, $07
    call $aa00
    cp e
    jr c, jr_000_11a1

    xor a
    call $aa0b

jr_000_11a1:
    ld c, $02
    call $aa00
    cp $04
    jr nz, jr_000_11c6

    ld c, $04
    call $aa00
    bit 1, a
    jr z, jr_000_11c6

    ld c, $0c
    call $aa00
    dec a
    ld e, a
    call $aa0b
    ld a, e
    and a
    jr nz, jr_000_11c6

    ld c, $02
    call $aa0b

jr_000_11c6:
    ld bc, $0010
    add hl, bc
    pop bc
    dec c
    jr nz, jr_000_115b

    ret


    inc b
    ld [bc], a
    inc b
    ld [bc], a
    inc b
    ld [bc], a
    inc b
    ld [bc], a
    nop
    nop
    nop
    nop
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld a, [$c801]
    and a
    ret nz

    ld a, [$c800]
    bit 3, a
    ret nz

    bit 1, a
    ret nz

    bit 5, a
    ret nz

    ld hl, $c8ee
    dec [hl]
    ret nz

    ld a, [$cbf1]
    set 5, a
    ld [$cbf1], a
    ld a, $0c
    ld [hl-], a
    dec [hl]
    jr nz, jr_000_1229

    ld hl, $c8f9
    set 1, [hl]
    ld hl, $c909
    set 1, [hl]
    ld hl, $c800
    set 5, [hl]
    ld a, $28
    ld [$c8f2], a
    ld a, $19
    call $b580
    ret


jr_000_1229:
    ld e, [hl]
    ld d, $04
    ld hl, $cbd9

jr_000_122f:
    push de
    push hl
    ld bc, $b245
    push bc
    ld a, [hl+]
    and a
    jr z, jr_000_1247

    dec a
    jr z, jr_000_124e

    ret


    pop hl
    pop de
    ld bc, $0006
    add hl, bc
    dec d
    jr nz, jr_000_122f

    ret


jr_000_1247:
    ld a, [hl-]
    cp e
    ret nz

    call $b26a
    ret


jr_000_124e:
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    and a
    jr z, jr_000_1258

    dec [hl]
    ret


jr_000_1258:
    xor a
    dec hl
    ld [hl-], a
    dec hl
    dec hl
    dec hl
    call $b26a
    ret


    inc [hl]
    inc hl
    inc hl
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    add $22
    ld e, a
    push hl
    call $add7
    ld [hl], e
    pop hl
    ld h, b
    ld a, c
    add $05
    ld l, a
    rst $08
    cp b
    ld a, e
    rst $08
    cp e
    ret


    ld a, [$c800]
    bit 1, a
    ret nz

    bit 5, a
    ret nz

    push hl
    ld a, [$c8e6]
    ld l, a
    ld a, [$c8e7]
    ld h, a
    add hl, bc
    ld a, l
    ld [$c8e6], a
    ld a, h
    ld [$c8e7], a
    ld e, $00
    rl e
    ld a, [$c8e8]
    add e
    ld [$c8e8], a
    ld a, [$c8e8]
    and a
    jr z, jr_000_12c9

    dec a
    jr nz, jr_000_12bd

    ld a, [$c8e7]
    cp $86
    jr c, jr_000_12c9

    jr nz, jr_000_12bd

    ld a, [$c8e6]
    cp $9f
    jr c, jr_000_12c9

jr_000_12bd:
    ld hl, $c8e8
    ld a, $01
    ld [hl-], a
    ld a, $86
    ld [hl-], a
    ld a, $9f
    ld [hl], a

jr_000_12c9:
    ld hl, $cbf1
    ld a, [hl]
    set 3, a
    ld [hl], a
    ld de, $c8e8
    ld hl, $c8eb
    ld a, [de]
    cp [hl]
    jr c, jr_000_1310

    jr nz, jr_000_12ea

    dec hl
    dec de
    ld a, [de]
    cp [hl]
    jr c, jr_000_1310

    jr nz, jr_000_12ea

    dec hl
    dec de
    ld a, [de]
    cp [hl]
    jr c, jr_000_1310

jr_000_12ea:
    ld de, $c8e6
    ld hl, $c8e9
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $cbf1
    ld a, [hl]
    set 4, a
    ld [hl], a
    ld hl, $c8ec
    sla [hl]
    ld a, [hl]
    or $01
    ld [hl], a
    dec a
    jr nz, jr_000_1310

    ld a, $37
    call $b58a

jr_000_1310:
    pop hl
    ret


    ld hl, $c8f0
    ld a, [hl]
    and a
    jr z, jr_000_131a

    dec [hl]

jr_000_131a:
    ld hl, $c8ef
    ld a, [hl]
    and a
    jr z, jr_000_1322

    dec [hl]

jr_000_1322:
    ld hl, $c8f1
    ld a, [hl]
    and a
    jr z, jr_000_132a

    dec [hl]

jr_000_132a:
    ld hl, $c8f2
    ld a, [hl]
    and a
    ret z

    dec [hl]
    ret


    ld de, $c800
    ld a, [de]
    res 0, a
    ld [de], a
    ld a, [hl]
    and a
    pop hl
    ret nz

    push hl
    ld a, $55
    ld [de], a
    call $a63f
    ret


    ld a, [$c800]
    bit 3, a
    ret z

    ld hl, $c919
    set 7, [hl]
    ld a, [$c8f1]
    srl a
    srl a
    sub $08
    ld [$c915], a
    ld a, [$c8f1]
    ld b, a
    and $08
    srl a
    ld c, a
    srl a
    or c
    srl a
    or c
    ld c, a
    ld a, b
    and $07
    xor c
    add $3c
    ld [$c916], a
    ld hl, $c8f1
    call $b33a
    call $b55e
    ld hl, $c8e3
    ld a, [hl]
    cp $1d
    jr z, jr_000_1388

    inc [hl]
    ret


jr_000_1388:
    rst $08
    or l
    xor a
    ld [$c8f0], a
    call $b553
    ld hl, $98c0
    ld bc, $0040
    ld e, $22
    rst $08
    and [hl]
    call $a63f
    ld bc, $9810
    ld de, $0001
    ld hl, $c8f5
    call $a61e
    ld bc, $e810
    ld de, $0002
    ld hl, $c905
    call $a61e
    ld bc, $ac08
    ld de, $0003
    ld hl, $c915
    call $a61e
    ld hl, $c919
    set 7, [hl]
    xor a
    ldh [$9b], a
    ldh [$9a], a
    ld hl, $0204
    rst $08
    cp b
    ld hl, $b5de
    rst $08
    ld l, c
    call $b500
    ld a, $01
    ld [$c801], a
    ld a, $51
    ld [$c8f3], a
    ld a, $0e
    call $b580
    ld a, $04
    ld [$c800], a
    ret


    ld a, $0a
    ld [$0000], a
    ld hl, $b594
    ld a, [$c8e9]
    ld [hl+], a
    ld a, [$c8ea]
    ld [hl+], a
    ld a, [$c8eb]
    ld [hl], a
    xor a
    ld [$0000], a
    ret


    ld a, [$c800]
    bit 5, a
    ret z

    ld hl, $c8f2
    call $b33a
    ld hl, $c8f4
    ld a, [hl]
    and a
    jr z, jr_000_141c

    dec [hl]
    ret


jr_000_141c:
    ld hl, $c800
    set 7, [hl]
    ret


    ld a, [$c800]
    bit 7, a
    ret z

    xor a
    rst $08
    inc de
    rst $08
    or l
    call $b553
    xor a
    ldh [$9b], a
    ldh [$9a], a
    ld hl, $0807
    rst $08
    cp b
    ld hl, $b5ac
    rst $08
    ld l, c
    ld hl, $0809
    rst $08
    cp b
    ld hl, $b5d3
    rst $08
    ld l, c
    call $b500
    call $b469
    rst $08
    or l
    call $b553
    call $b3f6
    call $b500
    ld hl, $c800
    ld a, $57
    ld [hl], a
    ret


    ld hl, $1f0a
    rst $08
    or [hl]
    ld de, $ff44
    ld hl, $cbfe
    xor a
    ld [hl], a
    ld [$cbff], a

jr_000_1471:
    ld a, [de]
    and a
    jr nz, jr_000_1471

jr_000_1475:
    ldh a, [rSTAT]
    and $03
    jr nz, jr_000_1475

    ld a, [de]
    cp $8f
    jr z, jr_000_1498

    add [hl]
    srl a
    ld b, a
    and $08
    srl a
    ld c, a
    srl a
    or c
    srl a
    or c
    ld c, a
    ld a, b
    and $07
    xor c
    ldh [rSCY], a
    jr jr_000_1475

jr_000_1498:
    ldh a, [$8b]
    and $0f
    jr nz, jr_000_14ac

    ld a, [$cbff]
    inc a
    ld [$cbff], a
    and $03
    jr nz, jr_000_1471

    inc [hl]
    jr jr_000_1471

jr_000_14ac:
    ld hl, $1f0f
    rst $08
    or [hl]
    ret


    ld a, [$c801]
    and a
    ret z

    dec a
    jr nz, jr_000_14cc

    ld hl, $c8f6
    dec [hl]
    ld hl, $c906
    inc [hl]
    ld hl, $c8f3
    dec [hl]
    ret nz

    ld hl, $c801
    inc [hl]
    ret


jr_000_14cc:
    dec a
    jr nz, jr_000_14e3

    ld a, $3f
    ld [$c916], a
    ld hl, $0609
    rst $08
    cp b
    ld hl, $b5ef
    rst $08
    ld l, c
    ld hl, $c801
    inc [hl]
    ret


jr_000_14e3:
    ld [$c801], a
    call $a39b
    call $a63f
    call $b3f6
    xor a
    rst $08
    inc de
    ld a, $57
    ld [$c800], a
    ret


    ld a, $03
    rst $08
    or h
    ret


    ld hl, $ff83

jr_000_1500:
    rst $08
    or c
    ld a, [hl]
    cp c
    jr nc, jr_000_1508

    jr jr_000_1500

jr_000_1508:
    xor a
    ld [hl], a
    ret


    ld a, [$c800]
    bit 0, a
    ret z

    ldh a, [$8a]
    bit 3, a
    ret z

    ld hl, $0011
    rst $08
    cp b
    ld hl, $b5d8
    rst $08
    ld l, c
    ld a, $2c
    call $b58a
    call $b572
    ld a, $02
    rst $08
    add hl, de
    call $a393

jr_000_152f:
    rst $08
    or c
    ldh a, [$8b]
    bit 3, a
    jr z, jr_000_152f

    call $a393
    ld hl, $9a20
    ld e, $2b
    ld bc, $0005
    rst $08
    and [hl]
    rst $08
    or c
    ld a, $07
    rst $08
    add hl, de
    ret


    ld bc, $0400
    ld e, $2b
    ld hl, $9800
    rst $08
    and [hl]
    ret


jr_000_1556:
    rst $08
    or c
    ld a, [$c802]
    and a
    jr nz, jr_000_1564

    rst $08
    ld d, $a7
    jr nz, jr_000_1556

    ret


jr_000_1564:
    ld c, $32
    call $b505
    ret


jr_000_156a:
    rst $08
    or c
    ld a, [$c802]
    and a
    jr nz, jr_000_1564

    rst $08
    rla
    and a
    jr nz, jr_000_156a

    ret


    ld l, a
    ld a, [$c802]
    and a
    ret nz

    ld a, l
    rst $08
    inc de
    ret


    ld l, a
    ld a, [$c802]
    and a
    ret nz

    ld a, l
    rst $08
    inc d
    ret


    adc b
    inc de
    nop
    ld b, d
    ld c, c
    ld c, [hl]
    ld b, c
    ld d, d
    ld e, c
    dec hl
    ld c, h
    ld b, c
    ld c, [hl]
    ld b, h
    nop
    ld d, e
    ld d, h
    ld b, c
    ld d, d
    ld d, h
    dec hl
    dec hl
    ld a, $2b
    ld b, a
    ld b, c
    ld c, l
    ld b, l
    nop
    ld d, e
    ld b, l
    ld c, h
    ld b, l
    ld b, e
    ld d, h
    dec hl
    ld a, $2b
    ld b, l
    ld e, b
    ld c, c
    ld d, h
    nop
    ld d, e
    ld d, h
    ld b, c
    ld b, a
    ld b, l
    dec hl
    nop
    ld b, d
    ld c, a
    ld c, [hl]
    ld d, l
    ld d, e
    dec hl
    ld d, e
    ld d, h
    ld b, c
    ld b, a
    ld b, l
    ld hl, $4f00
    ld d, [hl]
    ld b, l
    ld d, d
    nop
    ld d, b
    ld b, c
    ld d, l
    ld d, e
    ld b, l
    nop
    ld b, e
    ld c, a
    ld c, [hl]
    ld b, a
    ld d, d
    ld b, c
    ld d, h
    ld d, l
    ld c, h
    ld b, c
    ld d, h
    ld c, c
    ld c, a
    ld c, [hl]
    ld d, e
    ld hl, $5400
    ld c, b
    ld b, l
    dec hl
    dec hl
    ld b, l
    ld c, [hl]
    ld b, h
    nop
    ld d, d
    ld c, a
    ld d, l
    ld c, [hl]
    ld b, h
    ld a, [hl-]
    nop
    ld c, h
    ld b, l
    ld b, [hl]
    ld d, h
    ld a, [hl-]
    nop
    ld d, e
    ld b, e
    ld a, [hl-]
    nop
    ld c, b
    ld c, c
    ld a, [hl-]
    nop
    ld d, h
    ld c, c
    ld c, l
    ld b, l
    ld a, [hl-]
    nop
    dec de
    or [hl]
    inc hl
    or [hl]
    daa
    or [hl]
    cpl
    or [hl]
    ld d, c
    or a
    ld h, d
    or a
    ld d, c
    or a
    ld l, a
    or a
    rst $08
    or [hl]
    jp hl


    or [hl]
    sub a
    or [hl]
    xor b
    or [hl]
    sub a
    or [hl]
    or l
    or [hl]
    jp nz, $dcb6

    or [hl]
    sub a
    or [hl]

jr_000_162d:
    and e
    or a
    sub a
    or [hl]
    pop bc
    or a
    ld b, e
    or [hl]
    ld c, e
    or [hl]
    ld c, a
    or [hl]
    ld d, a
    or [hl]
    ld a, h
    or a
    adc c
    or a
    ld a, h
    or a
    sub [hl]
    or a
    ld a, [hl+]
    or a
    ld b, h
    or a
    or $b6
    inc bc
    or a
    or $b6
    db $10
    or a
    dec e
    or a
    scf
    or a
    or $b6
    or h
    or a
    or $b6
    jp nc, $58b7

    cp b
    ld h, l
    cp b
    ld b, h
    cp b
    ccf
    cp b
    ld b, h
    cp b
    ld c, c
    cp b
    ld c, [hl]
    cp b
    ld d, e
    cp b
    ld c, [hl]
    cp b
    ld d, e
    cp b
    dec bc
    cp b
    dec h
    cp b
    jr jr_000_162d

    ld [hl-], a
    cp b
    db $ec
    or a
    ld [bc], a
    cp b
    rst $18
    or a
    ld sp, hl
    or a
    adc h
    cp b
    sub c
    cp b
    add d
    cp b
    add a
    cp b
    ld a, b
    cp b
    ld a, l
    cp b
    ld l, [hl]
    cp b
    ld [hl], e
    cp b
    inc b
    ld sp, hl
    rst $38
    nop
    add b
    ld sp, hl
    rlca
    ld bc, $0180
    rst $38
    ld [bc], a
    add b
    ld bc, $0307
    add b
    inc bc
    ld sp, hl
    nop
    inc b
    add b
    ld bc, $05ff
    add b
    ld bc, $0607
    add b
    inc bc
    ld sp, hl
    nop
    inc b
    add b
    ld bc, $07ff
    add b
    ld bc, $0807
    add b
    inc bc
    ld sp, hl
    nop
    add hl, bc
    add b
    ld bc, $0aff
    add b
    ld bc, $0b07
    add b
    inc bc
    ld sp, hl
    nop
    add hl, bc
    and b
    ld bc, $0a01
    and b
    ld bc, $0bf9
    and b
    inc bc
    ld sp, hl
    rst $38
    inc c
    add b
    ld bc, $0dff
    add b
    ld bc, $0e07
    add b
    inc bc
    ld sp, hl
    ld bc, $a00c
    ld bc, $0d01
    and b
    ld bc, $0ef9
    and b
    inc bc
    ld sp, hl
    rst $38
    rrca
    add b
    ld bc, $10ff
    add b
    ld bc, $1107
    add b
    inc bc
    ld sp, hl
    rst $38
    ld [de], a
    add b
    ld bc, $13ff
    add b
    ld bc, $1407
    add b
    inc bc
    ld sp, hl
    rst $38
    ld [de], a
    add b
    ld bc, $15ff
    add b
    ld bc, $1407
    add b
    inc bc
    ld sp, hl
    rst $38
    ld d, $80
    ld bc, $17ff
    add b
    ld bc, $1807
    add b
    inc bc
    ld sp, hl
    ld bc, $a016
    ld bc, $1701
    and b
    ld bc, $18f9
    and b
    inc bc
    ld sp, hl
    rst $38
    add hl, de
    add b
    ld bc, $1aff
    add b
    ld bc, $1b07
    add b
    inc bc
    ld sp, hl
    ld bc, $a019
    ld bc, $1a01
    and b
    ld bc, $1bf9
    and b
    inc b
    ld sp, hl
    rst $38
    nop
    add b
    ld sp, hl
    rlca
    ld bc, $0180
    rst $38
    inc e
    add b
    ld bc, $0307
    add b
    inc bc
    ld sp, hl
    nop
    inc b
    add b
    ld bc, $1dff
    add b
    ld bc, $0607
    add b
    inc bc
    ld sp, hl
    nop
    inc b
    add b
    ld bc, $1eff
    add b
    ld bc, $0807
    add b
    inc bc
    ld sp, hl
    rst $38
    rrca
    add b
    ld bc, $1fff
    add b
    ld bc, $1107
    add b
    inc bc
    ld sp, hl
    rst $38
    ld [de], a
    add b
    ld bc, $20ff
    add b
    ld bc, $1407
    add b
    inc bc
    ld sp, hl
    rst $38
    ld [de], a
    add b
    ld bc, $21ff
    add b
    ld bc, $1407
    add b
    inc b
    ld sp, hl
    rst $38
    nop
    nop
    ld sp, hl
    rlca
    ld bc, $0100
    rst $38
    ld [hl+], a
    nop
    ld bc, $0307
    nop
    inc bc
    ld sp, hl
    rst $38
    rrca
    nop
    ld bc, $23ff
    nop
    ld bc, $1107
    nop
    inc b
    ld sp, hl
    rst $38
    nop
    nop
    ld sp, hl
    rlca
    ld bc, $0100
    rst $38
    inc h
    nop
    ld bc, $0307
    nop
    inc bc
    ld sp, hl
    rst $38
    rrca
    nop
    ld bc, $25ff
    nop
    ld bc, $1107
    nop
    inc bc
    ld sp, hl
    rst $38
    inc c
    nop
    ld bc, $26ff
    nop
    ld bc, $2707
    nop
    inc bc
    ld sp, hl
    rst $38
    inc c
    jr nz, jr_000_17eb

    ld sp, hl

jr_000_17eb:
    daa
    jr nz, @+$03

    ld bc, $2026
    ld [bc], a
    ld bc, $28ff
    nop
    ld bc, $2907
    nop
    ld [bc], a
    ld bc, $29f9
    jr nz, @+$03

    ld bc, $2028
    inc bc
    ld hl, sp+$00
    ld a, [hl+]
    nop
    nop
    rst $38
    dec hl
    nop
    nop
    rlca
    inc l
    nop
    inc bc
    ld hl, sp+$00
    ld a, [hl+]
    jr nz, jr_000_1816

jr_000_1816:
    ld sp, hl
    inc l
    jr nz, jr_000_181a

jr_000_181a:
    ld bc, $202b
    inc bc
    ld hl, sp+$00
    dec l
    nop
    nop
    rst $38
    ld l, $00
    nop
    rlca
    cpl
    nop
    inc bc
    ld hl, sp+$00
    dec l
    jr nz, jr_000_1830

jr_000_1830:
    ld sp, hl
    cpl
    jr nz, jr_000_1834

jr_000_1834:
    ld bc, $202e
    ld bc, $0000
    jr nc, jr_000_183c

jr_000_183c:
    ld bc, $0000
    ld sp, $0100
    nop
    nop
    jr nc, jr_000_1866

    ld bc, $0000
    ld [hl-], a
    nop
    ld bc, $0000
    inc sp
    nop
    inc bc
    ld sp, hl
    nop
    inc [hl]
    nop
    ld bc, $3500
    nop
    ld bc, $3608
    nop
    ld [bc], a
    nop
    db $fc
    scf
    nop
    nop
    dec b
    jr c, jr_000_1866

jr_000_1866:
    ld bc, $f700
    add hl, sp
    nop
    ld bc, $f700
    add hl, sp
    db $10
    ld bc, $0009
    ld a, [hl-]
    nop
    ld bc, $0009
    ld a, [hl-]
    db $10
    ld bc, $0900
    add hl, sp
    jr nz, jr_000_1881

    nop

jr_000_1881:
    add hl, bc
    add hl, sp
    jr nc, jr_000_1886

    rst $30

jr_000_1886:
    nop
    ld a, [hl-]
    ld b, b
    ld bc, $00f7
    ld a, [hl-]
    ld d, b
    ld a, e
    xor $aa
    ld [hl], e
    ld [hl], e
    sbc [hl]
    db $ed
    xor $80
    add b
    db $fd
    ld b, b
    ret nz

    cp a
    ret nz

    rst $38
    sub d
    ld de, $7f00
    rst $38
    ld c, h
    ccf
    ld hl, $1e1e
    ld [de], a
    ld [de], a
    ld hl, $33a8
    dec c
    ret nz

    dec c
    nop
    ld b, b
    dec bc
    sbc $f3
    xor $cf
    rst $20
    rst $20
    db $fd
    ld [$1f0f], sp
    ld e, $01
    ld de, $220f
    rla
    jr nz, jr_000_18ea

    ld a, [hl+]
    ccf
    ld a, [hl]
    ld e, [hl]
    jr nz, jr_000_18ed

    ccf
    ld c, a
    xor [hl]
    db $eb
    ld b, $06
    add hl, de
    rra
    ld a, $31
    db $fd
    ld a, e
    ld c, h
    ei
    adc h
    rst $38
    ldh [rIF], a
    ld [bc], a
    ld a, a
    ld hl, sp+$7f
    ld [bc], a
    ld [de], a
    inc b
    ld [hl], $0b
    ld [hl], e
    rst $30
    xor $f6

jr_000_18ea:
    inc bc
    inc bc
    inc c

jr_000_18ed:
    rrca
    adc a
    and b
    nop
    pop bc
    dec bc
    rrca
    sbc a
    xor h
    and a
    add hl, de
    nop
    rla
    ld a, a
    ld b, b
    ld a, a
    ld d, d
    ld a, b
    pop af
    nop
    sbc $ad
    rst $38
    add b
    sbc c
    dec de
    ld [hl+], a
    rst $08
    rrca
    ld e, e
    rrca
    and e
    db $e4
    pop af
    push af
    add c
    ld a, a
    ld a, [hl]
    ld bc, $218f
    ld e, c
    ld a, [hl+]
    ld bc, $91ed
    and b
    ld a, a
    ld e, a
    jr nz, jr_000_195f

    ld l, $7e
    add d
    inc e
    inc e
    ld a, $22
    ld a, a
    ld b, c
    db $fc
    ld a, a
    ld c, c
    rst $38
    adc b
    ei
    db $e4
    rst $30
    sbc e
    ld [hl+], a
    ld b, $b0
    inc bc
    cpl
    add hl, bc
    ld d, [hl]
    ld a, [c]
    rst $30
    ld bc, $b0c3
    ld c, b
    ld [$c973], sp
    nop
    rst $30
    rst $30
    db $10
    ld b, b
    db $ed
    db $eb
    ld [bc], a
    ei
    sbc $9e
    db $ed
    xor a
    adc d
    rra
    ld e, $01
    ld de, $e1bf
    ld a, [hl]
    ld e, [hl]
    jr nz, @+$60

    nop
    ld [hl+], a
    ldh [rNR13], a
    or c

jr_000_195f:
    ld a, a
    inc bc
    cp e
    inc hl
    rra
    ld [c], a
    ld b, e
    ld a, [hl+]
    rst $28
    sub e
    ld c, d
    cp a
    jp nc, $ffff

    sub d
    rst $38
    adc h
    ld a, a
    ld c, h
    ccf
    dec l
    ld hl, $43b9
    ld b, c
    ld b, b
    ld b, a
    db $10
    inc d
    ld [$af31], a
    or e
    ld c, d
    ld h, a
    ld d, $5e
    or a
    inc bc
    ld de, $e373
    sbc [hl]
    rst $20
    ld h, b
    rst $38
    rlca
    inc b
    inc a
    dec sp
    ld e, l
    ld l, e
    ld a, c
    ld d, a
    rst $38
    cp h
    jp $c7f9


    ld a, $3e
    inc b
    inc b
    dec de
    xor c
    xor c
    ld b, d
    ld e, a
    ld b, b
    ld b, b
    ld a, a
    nop
    jr c, jr_000_19e2

    or $5e
    ld h, [hl]
    ld a, a
    ld d, c
    xor a
    rst $28
    reti


    ld d, c
    nop
    ldh a, [$09]
    rrca
    ld b, $06
    sbc a
    ld l, e
    inc b
    ld e, a
    xor c
    ld c, e
    ld a, a
    adc [hl]
    ld a, [hl+]
    ld a, [hl+]
    ld d, l
    ld d, l
    ld a, [hl+]
    ld a, a
    ld d, h
    db $fd
    ld a, [hl]
    add c
    sbc $bf
    cp [hl]
    db $e3
    and a
    nop
    ld e, l
    add e
    ld a, a
    ld e, e
    ld h, [hl]
    dec [hl]
    or b
    adc e
    ldh a, [$8e]
    dec d
    ld a, [de]
    ei
    dec b
    rla
    jr z, jr_000_1a58

jr_000_19e2:
    ld c, c
    rrca
    nop
    cp $81
    jp c, $bfff

    ld b, b
    ccf
    ccf
    ld l, d
    ld d, $c0
    pop hl
    ld a, a
    ld h, c
    ld hl, $2525
    ld a, a
    ld e, e
    ld a, [hl]
    ld a, [hl]
    cp $ff
    and $bc
    cp h
    and h
    and h
    daa
    inc hl
    ld h, b
    ld a, l
    ld l, h
    inc h
    inc h
    ld a, [hl]
    ld e, d
    rst $38
    dec b
    ld [bc], a
    rst $20
    db $fd
    cp l
    cp l
    ld b, d
    ld b, d
    inc h
    ld h, [hl]
    adc [hl]
    inc h
    ld sp, hl
    nop
    inc a
    inc a
    jr jr_000_1a35

    ld [de], a
    rla
    adc [hl]
    db $10
    rst $20
    ld [$1008], sp
    cp l
    pop af
    adc [hl]
    ld d, l
    ld [hl+], a
    set 7, e
    ld [hl], a
    xor e
    rst $18
    pop hl
    sbc a
    ret c

    nop
    ld b, e
    ld a, a

jr_000_1a35:
    pop af
    ld h, $3e
    inc e
    inc e
    ld h, $62
    inc c
    or l
    ld [$04ff], sp
    jr jr_000_1a51

    dec d
    dec de
    dec e
    inc de
    ld [de], a
    cp a
    ld e, $7b
    jr nz, jr_000_1a4e

    inc bc

jr_000_1a4e:
    db $10
    jr nz, jr_000_1aa9

jr_000_1a51:
    ld [hl], b
    rst $30
    adc b
    ld hl, sp+$48
    ld a, b
    ld [hl], e

jr_000_1a58:
    ld d, b
    ld [hl], b
    ldh [$bf], a
    ldh [$e0], a
    nop
    ld h, b
    or b
    ld e, b
    jr nc, jr_000_1a92

    sbc h
    jp $2f52


    add l
    add e
    nop
    add c
    ld a, a
    nop
    nop
    jr jr_000_1af0

    ld d, $24
    inc a
    ld h, [hl]
    inc a
    ld e, d
    rst $20
    and l
    rst $10
    db $db
    db $db
    ret nz

    rrca
    and l
    inc l
    nop
    ld [bc], a
    ld a, h
    push af
    ld a, [hl-]
    ld l, [hl]
    ld a, [hl-]
    ld d, [hl]
    or e
    nop
    ld [bc], a
    di
    ld a, $24
    and e
    db $10
    dec bc
    rst $20

jr_000_1a92:
    ld [bc], a
    ld bc, $3c90
    ld [bc], a
    nop
    pop bc
    ld a, a
    cp a
    nop
    add c
    ld a, [hl]
    nop
    add c
    adc c
    rst $30
    add c
    ld sp, hl
    db $db
    ld b, d
    rst $38
    inc a
    cp l

jr_000_1aa9:
    pop de
    rst $08
    nop
    adc c
    rst $38
    ld a, [hl]
    inc c
    sbc l
    ld c, $bf
    ccf
    rst $38
    ld a, [hl+]
    rst $38
    xor e
    ld [$2889], sp
    xor c
    sub c
    ld a, [hl]
    adc l
    ei
    ld a, [hl]
    inc d
    sbc l
    inc h
    and l
    di
    ld l, h
    db $ed
    db $fd
    or [hl]
    sub e
    jp c, $edb7

jr_000_1ace:
    ld a, [hl]
    db $ed
    nop
    jr jr_000_1ace

    sbc c
    inc e
    sbc l
    ld [de], a
    sub e
    dec b
    ld [hl], h
    push af
    rst $38
    sub b
    or c
    pop hl
    ld a, [hl]
    ld d, [hl]
    db $fd
    xor e
    xor d
    ld a, a
    ld de, $d500
    cp $9f
    adc [hl]
    sub c
    sub c
    rst $08
    rst $38
    ld c, [hl]

jr_000_1af0:
    ld a, [hl]
    cp l
    ld a, [hl]
    add c
    and a
    ld h, [hl]
    rst $20
    db $fd
    rst $38
    rst $10
    rst $08
    rst $28
    ld e, [hl]
    xor l
    reti


    jr jr_000_1b01

jr_000_1b01:
    rra
    nop
    ld a, e
    xor $00
    dec sp
    dec sp
    ld l, d
    ld l, d
    xor $3e
    ld a, $6d
    xor $00
    ld l, d
    dec hl
    xor $3f
    ld a, [hl]
    db $ed
    jr nz, jr_000_1b43

    cp $6a
    ld a, [hl+]
    ld a, $08
    ld [$6b3b], sp

jr_000_1b20:
    xor $bd
    ld l, [hl]
    ld [$0001], sp
    ld a, [hl+]
    ld l, e
    ld [bc], a
    xor $2a
    dec bc
    add hl, de
    ld [de], a
    rla
    dec e
    add c
    ld de, $192b
    ld bc, $0822
    call c, $3b3f
    ld de, $2a6e
    ld [$102f], sp
    dec d
    sbc a
    ld [bc], a

jr_000_1b43:
    ld a, [c]
    db $10
    inc e
    ld [$6e3e], sp
    nop
    jr nz, jr_000_1b20

    dec hl
    dec sp

jr_000_1b4e:
    ld a, [hl+]
    nop
    ld a, [hl]
    inc e
    jr nz, jr_000_1b69

    nop
    ld b, $39
    scf
    nop
    ld de, $3b6e
    jr nz, jr_000_1b4e

    ld bc, $2a58
    inc hl
    ld e, h
    ld de, $2afd
    inc sp
    ld d, c
    ld h, d

jr_000_1b69:
    ld [hl], c
    rra
    ld l, [hl]
    ld [hl+], a
    dec e
    ld d, $1b
    ld hl, $3ff9
    ld a, $3f
    add hl, bc
    ld bc, $406b
    ld [hl], c
    ld a, $71
    ld de, $7997
    db $10
    ld h, e
    ld [hl], b
    ld de, $005e
    ld l, [hl]
    ld sp, $49f0
    ld bc, $7def
    nop
    ld c, h
    ld c, $02
    ld a, l
    scf
    ld c, b
    ld bc, $20b8
    ld a, [hl-]
    ld a, [hl+]
    ld bc, $2a3a
    cpl
    ld h, [hl]
    and b
    ld a, d

jr_000_1b9f:
    ccf
    ld a, [hl+]
    ld bc, $2acf
    ld a, d
    and b
    ld c, a
    ld a, [hl-]
    ld a, [hl]
    and e
    ld de, $3b3a
    cpl
    dec c
    ld a, d
    or c
    dec d
    ld [$f3f8], sp
    jr nc, @-$2a

    reti


    nop
    ld a, e
    add hl, sp
    ld [hl], b
    jr nz, jr_000_1b9f

    sub [hl]
    ld a, [hl-]
    ld a, c
    ld de, $6a0a
    ld a, d
    ld bc, $3e7b
    ld h, c
    xor a
    dec hl
    ret c

    ld [de], a
    ld a, [hl]
    ld a, c
    dec sp
    ld l, d
    ld l, d

jr_000_1bd2:
    ld a, $60
    rlc c
    ld a, $6b
    adc a
    inc [hl]
    nop
    ld l, b
    jr c, jr_000_1bfd

    rst $18
    ld l, l
    ldh a, [rLCDC]
    dec hl
    ld a, [hl]
    ld c, b
    ld [$bc3f], sp
    db $10
    ld a, [hl]
    rra
    call nz, $005e
    ld c, b
    ld [bc], a
    ld [$2a02], sp
    ld l, d
    ld e, h
    ld b, l
    nop
    ld [hl+], a
    ld e, [hl]
    ld l, [hl]
    ld [$a520], sp

jr_000_1bfd:
    nop
    ld de, $6f2a
    inc de
    or [hl]
    ld l, d
    call nz, $3e11
    cp h
    dec hl
    call nz, $a311
    ld a, [hl]
    cp h
    ld [bc], a
    ld a, [hl-]
    ld bc, $25ba
    nop
    ld l, [hl]
    ld l, [hl]
    ld bc, $b3b6
    ld bc, $9c25
    rra
    ld b, e
    ld c, b
    db $10
    sub e
    ld a, [hl+]
    db $f4
    ccf
    ld a, [hl-]
    ccf
    ld [$1012], sp
    inc b
    cp l
    add hl, hl
    jr nz, jr_000_1c69

    ld c, b
    ld a, [de]
    db $10
    ld l, d
    dec sp
    ld a, $11
    nop
    ld l, e
    ld c, b
    ld h, h
    nop
    ld a, [hl+]
    db $d3
    and [hl]
    nop
    ld l, e
    ld h, b
    and l
    db $10
    xor c
    add d
    ld l, [hl]
    ld h, b
    db $10
    ld a, b
    and d
    ld de, $eb84
    db $10
    ld a, [hl-]
    ld e, l
    jr nc, jr_000_1bd2

    ld bc, $2247
    ld l, [hl]
    ld h, a
    ld bc, $a27a
    nop
    add c
    adc [hl]
    jr nz, jr_000_1c8b

    rra
    xor c
    and [hl]
    ld hl, $3e3a
    cpl
    push de
    and e
    ld a, d
    add l

jr_000_1c69:
    ld de, $dd2f
    jr z, @+$14

    rra
    dec sp
    ccf
    ld h, b
    and [hl]
    ld [bc], a
    ld l, [hl]
    ld a, e
    rst $30
    and d
    ld de, $befc
    cp h
    pop bc
    cp h
    call nz, $c5bc
    cp h
    adc $bc
    reti


    cp h
    db $e4
    cp h
    di
    cp h
    db $f4

jr_000_1c8b:
    cp h
    rst $38
    cp h
    inc c
    cp l
    add hl, de
    cp l
    ld [hl+], a
    cp l
    inc hl
    cp l
    ld l, $bd
    dec a
    cp l
    ld b, [hl]
    cp l
    ld d, c
    cp l
    ld d, d
    cp l
    ld h, c
    cp l
    ld l, b
    cp l
    ld [hl], e
    cp l
    add b
    cp l
    add e
    cp l
    adc [hl]
    cp l
    sbc e
    cp l
    xor d
    cp l
    or a
    cp l
    cp b
    cp l
    jp $01bd


    inc sp
    inc b
    ld bc, $040d
    nop
    inc b
    dec bc
    inc b
    inc d
    inc b
    ld l, $04
    ld [hl-], a
    inc b
    dec b
    inc b
    inc b
    inc c
    inc b
    ld [hl+], a
    inc b
    ld a, [hl+]
    inc b
    ld a, [hl-]
    inc b
    dec b
    inc b
    inc b
    dec c
    inc b
    inc e
    inc b
    ld a, [hl+]
    inc b
    dec sp
    inc b
    rlca
    ld b, $04
    ld a, [bc]
    inc b
    dec c
    inc b
    inc l
    inc b
    jr nc, jr_000_1ceb

    dec [hl]
    inc b
    ld a, $04

jr_000_1ceb:
    nop
    dec b
    ld bc, $0504
    inc b
    jr z, jr_000_1cf7

    ld sp, $3404
    inc b

jr_000_1cf7:
    ld b, $00
    inc b
    inc b
    inc b
    ld [$2604], sp
    inc b
    ld l, $04
    inc sp
    inc b
    ld b, $0c
    inc b
    dec c
    inc b
    db $10
    inc b
    ld h, $04
    inc sp
    inc b
    dec a
    inc b
    inc b
    ld b, $04
    ld c, $04
    ld d, $04
    inc [hl]
    inc b
    nop
    dec b
    ld [bc], a
    inc b
    inc b
    inc b
    db $10
    inc b
    jr jr_000_1d29

    ld a, [hl-]
    inc b
    rlca
    nop
    inc b

jr_000_1d29:
    ld [$0b04], sp
    inc b
    ld [de], a
    dec b
    inc h
    inc b
    ld [hl-], a
    inc b
    inc a
    dec b
    inc b
    ld c, $04
    jr nz, jr_000_1d3e

    inc [hl]
    inc b
    dec sp
    dec b

jr_000_1d3e:
    dec b
    ld b, $04
    inc c
    inc b
    ld e, $05
    dec [hl]
    dec b
    add hl, sp
    inc b
    nop
    rlca
    dec b
    dec b
    ld [$1005], sp
    inc b
    ld a, [de]
    inc b
    ld h, $04
    dec [hl]
    inc b
    add hl, sp
    inc b
    inc bc
    ld [de], a
    dec b
    ld d, $04
    inc [hl]
    inc b
    dec b
    ld [bc], a
    inc b
    ld c, $05
    ld a, [hl+]
    inc b
    inc [hl]
    dec b
    inc a
    inc b
    ld b, $00
    dec b
    ld [bc], a
    inc b
    inc bc
    inc b
    ld a, [bc]
    inc b
    ld a, [de]
    inc b
    ld [hl+], a
    inc b
    ld bc, $0548
    dec b
    nop
    inc b
    inc c
    dec b
    inc d
    inc b
    jr z, jr_000_1d88

    ld b, [hl]
    inc b
    ld b, $01

jr_000_1d88:
    dec b
    ld [bc], a
    inc b
    inc d
    inc b
    inc a
    inc b
    dec a
    dec b
    ld e, b
    inc b
    rlca
    nop
    inc b
    dec c
    inc b
    ld c, $04
    ld h, $04
    dec [hl]
    inc b
    add hl, sp
    dec b
    ld c, b
    inc b
    ld b, $02
    dec b
    add hl, bc
    inc b
    ld a, [de]
    inc b
    inc h
    inc b
    inc a
    dec b
    ld c, b
    inc b
    nop
    dec b
    add hl, bc
    dec b
    ld h, $05
    inc [hl]
    inc b
    jr c, jr_000_1dbd

    dec a
    inc b
    rlca
    ld [bc], a

jr_000_1dbd:
    inc b
    dec b
    inc b
    ld [$1004], sp
    dec b
    ld [de], a
    inc b
    jr jr_000_1dcc

    ld b, [hl]
    inc b
    ld c, $be

jr_000_1dcc:
    ld de, $1abe
    cp [hl]
    inc e
    cp [hl]
    dec l
    cp [hl]
    inc [hl]
    cp [hl]
    ld b, c
    cp [hl]
    ld d, b
    cp [hl]
    ld d, d
    cp [hl]
    ld e, l
    cp [hl]
    ld l, h
    cp [hl]
    ld a, l
    cp [hl]
    sub e
    cp [hl]
    sub l
    cp [hl]
    xor b
    cp [hl]
    cp d
    cp [hl]
    call nz, $c9be
    cp [hl]
    res 7, [hl]
    push de
    cp [hl]
    and $be
    rst $28
    cp [hl]
    db $fc
    cp [hl]
    cp $be
    ld de, $1cbf
    cp a
    dec l
    cp a
    ld b, b
    cp a
    ld b, d
    cp a
    ld d, b
    cp a
    ld [bc], a
    ld [hl-], a
    ld e, h
    ld [$3630], sp
    ld a, $52
    ld e, b
    ld [hl], b
    ld [hl], l
    ld a, h
    ld bc, $1096
    inc b
    db $10
    jr nz, jr_000_1e3b

    ld h, $30
    jr c, @+$40

    ld d, c
    ld d, h
    ld e, d
    ld [hl], b
    db $76
    ld a, b
    ld a, l
    add d
    ld b, $38
    ld a, $54
    ld e, h
    ld a, c
    ld a, [hl]
    inc c
    jr nc, jr_000_1e65

    ld a, $54
    ld e, b
    ld e, d
    ld e, h
    ld [hl], c
    db $76
    ld a, b
    ld a, [hl]
    sbc d
    ld c, $03

jr_000_1e3b:
    ld sp, $4038
    ld b, h
    ld b, [hl]
    ld e, d
    ld e, h
    ld e, [hl]
    ld a, b
    ld a, [hl]
    add d
    sub e
    sbc h
    ld bc, $0a96
    dec bc
    ld [hl], $39
    ld c, b
    ld c, h
    ld c, [hl]
    ld d, b
    ld [hl], h
    adc d
    sbc e
    ld c, $0c
    jr z, @+$38

    ld a, [hl-]
    ld a, $50
    ld d, d
    ld d, h
    ld [hl], b
    db $76
    ld a, b
    ld a, h
    sub d
    sbc h
    db $10

jr_000_1e65:
    inc b
    add hl, bc
    ld e, $20
    ld [hl-], a
    ld [hl], $38
    dec sp
    ld c, [hl]
    ld l, d
    ld [hl], b
    ld [hl], h
    ld a, b
    ld a, h
    ld a, [hl]
    sub h
    dec d
    nop
    inc b
    inc c
    jr jr_000_1ea3

    ld a, [hl+]
    ld l, $33
    ld [hl], $38
    ld b, h
    ld d, b
    ld e, c
    ld e, h
    ld h, d
    ld [hl], c
    ld a, b
    ld a, [hl]
    add [hl]
    adc d
    sub h
    ld bc, $1296
    ld [$300c], sp
    ld [hl], $3b
    ld a, $4c
    ld d, d
    ld d, h
    ld d, [hl]
    ld e, b
    ld l, d
    ld [hl], b
    db $76
    ld a, c
    adc [hl]
    sub h
    sbc h
    ld de, $0901

jr_000_1ea3:
    dec c
    ld d, $30
    inc sp
    ld a, [hl-]
    ld a, $46
    ld e, b
    ld e, h
    ld h, d
    ld [hl], b
    ld [hl], h
    db $76
    adc d
    adc h
    add hl, bc
    ld bc, $3205
    ld [hl], $50
    ld d, h
    ld e, h
    add d
    add h
    inc b
    ld [hl-], a
    ld a, $58
    ld a, h
    ld bc, $0996
    ld d, $30
    jr c, jr_000_1f06

    ld d, [hl]
    ld e, d
    ld [hl], b
    ld a, b
    ld a, l
    db $10
    inc b
    db $10
    jr nz, jr_000_1ef4

    ld h, $30
    jr c, jr_000_1f14

    ld d, c
    ld d, h
    ld e, h
    ld [hl], b
    db $76
    ld a, c
    ld a, [hl]
    add d
    ld [$543e], sp
    ld e, b
    ld e, d
    ld e, h
    ld a, b
    ld a, [hl]
    sbc d
    inc c
    jr nc, jr_000_1f20

    jr c, @+$56

    ld e, d
    ld e, h
    ld e, [hl]
    ld [hl], c
    db $76
    ld a, b
    ld a, [hl]
    sbc h

jr_000_1ef4:
    ld bc, $1296
    inc bc
    dec bc
    ld d, $20
    inc h
    ld [hl], $39
    ld b, d
    ld c, b
    ld c, h
    ld c, [hl]
    ld h, b
    ld [hl], d
    ld [hl], l
    adc d

jr_000_1f06:
    sub c
    sub e
    sbc e
    ld a, [bc]
    inc c
    jr z, jr_000_1f43

    ld a, [hl-]
    ld a, $50
    ld [hl], h
    ld a, b
    ld a, h
    sbc h

jr_000_1f14:
    db $10
    add hl, bc
    ld e, $36
    jr c, jr_000_1f55

    ld c, [hl]
    ld d, b
    ld d, d
    ld d, h
    ld l, d
    ld [hl], b

jr_000_1f20:
    db $76
    ld a, b
    ld a, h
    ld a, [hl]
    sub d
    ld [de], a
    inc b
    inc c
    jr jr_000_1f4a

    jr z, jr_000_1f56

    ld l, $32
    ld [hl], $38
    ld e, c
    ld e, h
    ld [hl], b
    ld [hl], h
    ld a, b
    ld a, [hl]
    adc d
    sub h
    ld bc, $0d96
    ld [$300c], sp
    dec sp
    ld a, $4c
    ld d, [hl]
    ld e, b

jr_000_1f43:
    ld l, d
    ld [hl], d
    ld a, c
    adc [hl]
    sbc h
    rrca
    add hl, bc

jr_000_1f4a:
    dec c
    jr nc, jr_000_1f87

    ld a, $52
    ld d, h
    ld d, [hl]
    ld e, b
    ld e, h
    ld [hl], b
    db $76

jr_000_1f55:
    adc d

jr_000_1f56:
    adc h
    sub h
    ld l, h
    cp a
    ld [hl], h
    cp a
    add h
    cp a
    sub e
    cp a
    sbc h
    cp a
    xor b
    cp a
    rlca
    ld d, $30
    jr c, @+$58

    ld e, [hl]
    ld [hl], b
    ld a, d
    rrca
    inc bc
    ld d, $1e
    jr nz, jr_000_1f96

    ld [hl], $38
    ld b, d
    ld e, [hl]
    ld h, b
    ld [hl], d
    db $76
    ld a, b
    sub c
    sub e
    ld c, $0b
    ld e, $28
    inc l
    jr nc, jr_000_1fc1

    ld c, d
    ld d, [hl]
    ld l, b
    ld [hl], d

jr_000_1f87:
    ld a, d
    ld a, [hl]
    sbc c
    sbc e
    ld [$3630], sp
    jr c, @+$54

    ld e, [hl]
    ld [hl], b
    ld [hl], l
    ld a, d
    dec bc
    inc bc

jr_000_1f96:
    ld e, $31
    jr c, @+$42

    ld b, h
    ld b, [hl]
    ld e, [hl]
    ld a, b
    add d
    sub e
    inc de
    nop
    inc b
    dec bc
    ld e, $28
    inc l
    inc sp
    ld [hl], $3e
    ld b, h
    ld c, d
    ld d, b
    ld h, d
    ld l, b
    ld [hl], c
    ld a, d
    ld a, [hl]
    sbc c
    sbc e
    ld sp, $e000
    call $a10d
    ldh a, [$8a]
    bit 2, a
    jp nz, $a105

jr_000_1fc1:
    call $a5c5
    ld c, $04
    call $b505
    call $a1a8
    call $a286
    call $b4ba
    call $a9bd
    call $ae78
    call $b34d
    call $b40f
    call $b158
    call $a6ad
    call $b513
    call $b42a
    call $b1f3
    call $b31a
    jp $bfc2

End:
