; Disassembly of "binary.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]
LOAD "CRAM Code", SRAM[$a008]

Header::
    dw End
    db kFileHasIcon2bpp + kFileMarkerDiamond + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db Points - @ - 1          ; length of variable parts of header
    db $71                     ; owner code

Title::
    dk "BINARY"
Icon::
    INCBIN "gfx/bland/icon.2bpp"

Points::
    dw $0001
Author::
    db "T.OHNISHI ", 2
History::
    ds 11
    ds 11
    ds 11

Main::
    jp jp_bfbc


call_a105:
    xor a
    trap PlayMusic
    xor a
    trap PlaySound
    trap ExitToMenu

call_a10d:
    ld a, $20
    trap DrawInit
    ld a, $e4
    ldh [$9d], a
    ldh [$9c], a
    call call_a189
    ld a, [$0014]
    cp $01
    jr z, jr_000_a129

    cp $fe
    jr z, jr_000_a129

    ld hl, $c802
    inc [hl]

jr_000_a129:
    ld hl, $92b0
    xor a
    ld c, $10

jr_000_a12f:
    ld [hl+], a
    dec c
    jr nz, jr_000_a12f

    ld bc, $0800
    ld hl, $8800
    ld e, $aa

jr_000_a13b:
    ld [hl], e
    inc hl
    ld a, [hl]
    srl a
    or a, [hl]
    ld [hli], a
    rrc e
    dec c
    jr nz, jr_000_a13b

    ld a, b
    dec b
    and a
    jr nz, jr_000_a13b

    call call_b553
    ld de, data_b896
    ld b, $c6
    trap InitDecompress
    ld bc, $03b0
    ld de, $8000
    trap RunDecompress
    ld bc, $0090
    ld de, $9220
    trap RunDecompress
    trap StopAudio
    ld a, $07
    trap SetVolume
    ld hl, $1f0f
    trap $b6
    ld a, [data_b594]
    ld l, a
    ld a, [data_b594 + 1]
    ld h, a
    trap RandInit
    call call_b500
    ld a, $57
    ld [$c800], a
    ld a, $3f
    ld [$cbf1], a
    ret


call_a189:
    ld e, $00
    ld bc, $0400
    ld hl, $c800
    trap $a6
    ld a, $02
    ld [$c8f4], a
    ld hl, data_b594
    ld a, [hl+]
    ld [$c8e9], a
    ld a, [hl+]
    ld [$c8ea], a
    ld a, [hl]
    ld [$c8eb], a
    ret


call_a1a8:
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
    call call_a189
    pop bc
    pop af
    ld [$c802], a
    ld a, b
    ld [$c800], a
    ld a, c
    ld [$c8e3], a
    trap $b5
    call call_b553
    xor a
    ldh [$9b], a
    ldh [$9a], a
    ld hl, $0505
    trap MoveCursor
    ld hl, data_b597
    trap DrawString
    ld hl, $0409
    trap MoveCursor
    ld hl, data_b5a3
    trap DrawString
    ld hl, $040b
    trap MoveCursor
    ld hl, data_b5b1
    trap DrawString
    call call_b500
    call call_a23a
    ld a, $02
    call call_b580
    ld hl, $060e
    trap MoveCursor
    ld hl, data_b609
    trap DrawString
    ld hl, $090e
    call call_a591

jr_000_a20e:
    trap AwaitFrame
    trap RandNext
    ldh a, [$8b]
    bit 2, a
    jp nz, call_a105

    bit 3, a
    jr z, jr_000_a20e

    ldh a, [$8a]
    bit 0, a
    jr nz, jr_000_a227

    xor a
    ld [$c8e3], a

jr_000_a227:
    xor a
    trap PlayMusic
    trap $b5
    ld a, $f4
    ldh [$9b], a
    ld a, $04
    ldh [$9a], a
    ld hl, $c800
    res 1, [hl]
    ret


call_a23a:
    ld hl, $1f0a
    trap $b6
    ld de, $ff44
    ld hl, $cbfe
    ld a, $80
    ld [hl], a
    xor a
    ld [$cbff], a

jr_000_a24c:
    ld a, [de]
    and a
    jr nz, jr_000_a24c

jr_000_a250:
    ldh a, [rSTAT]
    and $03
    jr nz, jr_000_a250

    ld a, [de]
    cp $8f
    jr z, jr_000_a267

    rrca
    jr c, jr_000_a261

    ld a, [hl]
    jr jr_000_a263

jr_000_a261:
    xor a
    sub [hl]

jr_000_a263:
    ldh [rSCY], a
    jr jr_000_a250

jr_000_a267:
    ldh a, [$8b]
    and $0f
    jr nz, jr_000_a280

    ld a, [hl]
    and a
    jr z, jr_000_a280

    ld a, [$cbff]
    inc a
    ld [$cbff], a
    and $07
    jr nz, jr_000_a24c

    srl [hl]
    jr jr_000_a24c

jr_000_a280:
    ld hl, $1f0f
    trap $b6
    ret


call_a286:
    ld a, [$c800]
    bit 6, a
    ret z

    trap $b5
    xor a
    ldh [$83], a
    call call_b553
    ld hl, $c8ed
    ld a, $63
    ld [hl+], a
    ld a, $0c
    ld [hl], a
    call call_a63f
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

jr_000_a2bd:
    inc c
    sub $05
    jr nc, jr_000_a2bd

    add $05
    cp $02
    jr nz, jr_000_a2ce

    ld a, c
    or $80
    ld [$c8e5], a

jr_000_a2ce:
    ld hl, $0508
    trap MoveCursor
    ld hl, data_b5bf
    trap DrawString
    ld a, [$c8e3]
    inc a
    ld de, $2710
    add e
    ld e, a
    ld hl, $cbf2
    trap IntToString
    ld hl, $cbf6
    trap DrawString
    call call_b500
    ld a, $17
    call call_b580
    ld de, data_bb0b
    ld b, $c6
    trap InitDecompress
    ld a, [$c8e3]
    inc a
    ld l, a

jr_000_a2ff:
    ld de, $c803
    ld bc, $0014
    trap RunDecompress
    dec l
    jr nz, jr_000_a2ff

    call call_b55e
    ld a, [$c8e5]
    and a
    jr z, jr_000_a325

    ld a, $1a
    call call_b580
    ld hl, $030b
    trap MoveCursor
    ld hl, data_b5c6
    trap DrawString
    call call_b55e

jr_000_a325:
    ld hl, $ff83
    xor a
    ld [hl], a
    ld c, $0a
    call call_b505
    trap $b5
    ld bc, $4850
    ld de, $0001
    ld hl, $c8f5
    call call_a61e
    ld hl, $c8fb
    inc [hl]
    ld bc, $3850
    ld de, $0002
    ld hl, $c905
    call call_a61e
    ld hl, $c90b
    inc [hl]
    ld bc, $3f08
    ld de, $0003
    ld hl, $c915
    call call_a61e
    ld a, $3f
    ld [$cbf1], a
    call call_a480
    call call_a657
    call call_b500
    ld a, [$c8e5]
    and a
    jr nz, jr_000_a388

    ld e, $06
    ld a, [$c8e3]
    cp $0a
    jr c, jr_000_a382

    ld e, $08
    cp $14
    jr c, jr_000_a382

    ld e, $09

jr_000_a382:
    ld a, e
    call call_b580
    jr jr_000_a38d

jr_000_a388:
    ld a, $0f
    call call_b580

jr_000_a38d:
    ld hl, $c800
    res 6, [hl]
    ret


call_a393:
    trap AwaitFrame
    ldh a, [$8a]
    and a
    jr nz, call_a393

    ret


call_a39b:
    call call_a393

jr_000_a39e:
    trap AwaitFrame
    ldh a, [$8b]
    and a
    jr z, jr_000_a39e

    call call_a393
    ret


call_a3a9:
    ld bc, $00cc
    ld e, $22
    ld hl, $c817
    trap $a6
    ld bc, $0011
    ld e, $23
    ld hl, $c817
    trap $a6
    ld bc, $0011
    ld hl, $c8d2
    trap $a6
    ld bc, $230a
    ld de, $0008
    ld hl, $c828

jr_000_a3ce:
    ld [hl], b
    add hl, de
    ld [hl], b
    add hl, de
    ld [hl], b
    inc hl
    dec c
    jr nz, jr_000_a3ce

    ld a, $22
    ld [$c830], a
    ret


call_a3dd:
    ld hl, $c803
    ld e, l
    ld d, h
    ld hl, $c829
    ld c, $0a

jr_000_a3e7:
    push bc
    ld a, [de]
    inc de
    sla a
    ld bc, $2307

jr_000_a3ef:
    sla a
    jr nc, jr_000_a3f4

    ld [hl], b

jr_000_a3f4:
    inc hl
    dec c
    jr nz, jr_000_a3ef

    inc hl
    ld a, [de]
    inc de
    sla a
    ld c, $07

jr_000_a3ff:
    sla a
    jr nc, jr_000_a404

    ld [hl], b

jr_000_a404:
    inc hl
    dec c
    jr nz, jr_000_a3ff

    inc hl
    inc hl
    pop bc
    dec c
    jr nz, jr_000_a3e7

    ret


call_a40f:
    ld a, $24
    ld [$c8e4], a
    ld a, [$c8e3]
    ld hl, data_bdd2
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

jr_000_a427:
    ld a, [hl+]

jr_000_a428:
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
    jr jr_000_a428


call_a449:
    ld a, $2a
    ld [$c8e4], a
    ld hl, data_bf60
    ld b, $00
    sla c
    rl b
    add hl, bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, e
    ld h, d
    jr jr_000_a427


call_a45f:
    ld c, $0c
    ld de, $c817
    ld hl, $98a0

jr_000_a467:
    push bc
    ld bc, $0011
    push hl
    push de
    trap $02
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
    jr nz, jr_000_a467

    ret


call_a480:
    call call_a3a9
    call call_a3dd
    call call_a40f
    ld a, [$c8e5]
    and a
    jr z, jr_000_a497

    and $7f
    ld c, a
    call call_a449
    jr jr_000_a4b3

jr_000_a497:
    ld hl, $cbd9
    ld c, $03
    ld e, $46

jr_000_a49e:
    push hl
    trap RandNext
    and $03
    add $03
    ld b, a
    trap RandNext
    pop hl
    call call_a4c5
    ld a, e
    sub $19
    ld e, a
    dec c
    jr nz, jr_000_a49e

jr_000_a4b3:
    ld hl, $cbeb
    push hl
    trap RandNext
    pop hl
    ld e, $28
    ld b, $07
    call call_a4c5
    call call_a45f
    ret


call_a4c5:
    ld d, $00
    ld [hl], d
    inc hl
    and $07
    add e
    ld [hl+], a
    push bc

jr_000_a4ce:
    push hl
    trap RandNext
    ld b, a
    trap RandNext
    pop hl
    and $0f
    jr z, jr_000_a4ce

    ld [hl], a
    ld a, b
    and $0f
    cp $0b
    jr nc, jr_000_a4ce

    inc hl
    ld [hl-], a
    push hl
    ld b, [hl]
    inc hl
    ld c, [hl]
    call call_add7
    ld a, [hl]
    pop hl
    cp $22
    jr nz, jr_000_a4ce

    inc hl
    inc hl
    pop bc
    ld a, b
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    ret


call_a4f9:
    ld hl, $0002
    trap MoveCursor
    ld hl, data_b5f8
    trap DrawString
    ld hl, $0a02
    trap MoveCursor
    ld hl, data_b5ff
    trap DrawString
    ld hl, $0003
    trap MoveCursor
    ld hl, data_b605
    trap DrawString
    ld hl, $0903
    trap MoveCursor
    ld hl, data_b609
    trap DrawString
    ld hl, $0a11
    trap MoveCursor
    ld hl, data_b60d
    trap DrawString
    ret


call_a52c:
    ld hl, $cbf2
    trap $a0
    ld hl, $cbf2
    ld c, $0c

jr_000_a536:
    ld a, [hl]
    cp $20
    jr nz, jr_000_a53d

    ld a, $30

jr_000_a53d:
    ld [hl+], a
    dec c
    jr nz, jr_000_a536

    ret


call_a542:
    ld hl, $cbf2
    ld bc, $0000
    ld d, c
    ld a, [$c8e3]
    inc a
    ld e, a
    call call_a52c
    ld hl, $0602
    trap MoveCursor
    ld hl, $cbfb
    trap DrawString
    ret


call_a55c:
    ld hl, $cbf2
    ld bc, $0000
    ld d, c
    ld a, [$c8f4]
    ld e, a
    call call_a52c
    ld hl, $0f02
    trap MoveCursor
    ld hl, $cbfb
    trap DrawString
    ret


call_a575:
    ld b, $00
    ld hl, $c8e6
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ld c, a
    ld hl, $cbf2
    call call_a52c
    ld hl, $0303
    trap MoveCursor
    ld hl, $cbf8
    trap DrawString
    ret


call_a591:
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
    call call_a52c
    pop hl
    trap MoveCursor
    ld hl, $cbf8
    trap DrawString
    ret


call_a5ac:
    ld bc, $0000
    ld a, [$c8ed]
    ld e, a
    ld d, c
    ld hl, $cbf2
    call call_a52c
    ld hl, $0f11
    trap MoveCursor
    ld hl, $cbfb
    trap DrawString
    ret


call_a5c5:
    ld a, [$c800]
    bit 1, a
    ret nz

    ld a, [$cbf1]
    bit 0, a
    push af
    call nz, call_a4f9
    pop af
    bit 1, a
    push af
    call nz, call_a542
    pop af
    bit 2, a
    push af
    call nz, call_a55c
    pop af
    bit 3, a
    push af
    call nz, call_a575
    pop af
    bit 4, a
    push af
    ld hl, $0c03
    call nz, call_a591
    pop af
    bit 5, a
    call nz, call_a5ac
    xor a
    ld [$cbf1], a
    ret


call_a5fe:
    ld e, $0f
    ld bc, $0010
    ld hl, $c947

jr_000_a606:
    ld a, [hl]
    and a
    jr z, jr_000_a610

    add hl, bc
    dec e
    jr nz, jr_000_a606

    scf
    ret


jr_000_a610:
    ld bc, $fffe
    add hl, bc
    and a
    ret


call_a616:
    push bc
    push de
    call call_a5fe
    pop de
    pop bc
    ret c

call_a61e:
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


call_a63f:
    ld a, $06
    ld [$cbd8], a
    ld bc, $0140
    ld e, $00
    ld hl, $c8f5
    trap $a6
    ld bc, $0190
    ld hl, $ca48
    trap $a6
    ret


call_a657:
    ld a, [$c8e3]
    push af
    cp $08
    jr c, jr_000_a676

    ld bc, $4820
    ld de, $0006
    call call_a616
    ld c, $05
    ld a, $01
    call call_aa0b
    ld c, $0a
    ld a, $10
    call call_aa0b

jr_000_a676:
    pop af
    ld c, a
    ld b, $00
    sla c
    rl b
    ld hl, data_bc82
    add hl, bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, e
    ld h, d
    ld a, [hl+]

jr_000_a688:
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
    call call_a616
    pop hl
    pop af
    dec a
    jr jr_000_a688


call_a6ad:
    ld hl, $0100
    trap $b6
    ld bc, $2800
    trap $c4
    ld a, [$c800]
    bit 2, a
    jr z, jr_000_a6e5

    xor a

jr_000_a6bf:
    push af
    call call_a6eb
    pop af
    inc a
    cp $06
    jr nz, jr_000_a6bf

    ld c, $0e
    ld a, [$cbd8]

jr_000_a6ce:
    cp $14
    jr c, jr_000_a6d4

    ld a, $06

jr_000_a6d4:
    ld [$cbd8], a
    push bc
    call call_a6eb
    pop bc
    jr c, jr_000_a6e5

    ld a, [$cbd8]
    inc a
    dec c
    jr nz, jr_000_a6ce

jr_000_a6e5:
    ld hl, $0101
    trap $b6
    ret


call_a6eb:
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
    call call_a71d
    pop de
    ld a, $ff
    trap $60
    cp $29
    ccf
    ret


call_a71d:
    ld hl, call_a766
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
    call call_aa00
    ld c, a
    push bc
    ld c, $05
    call call_aa00
    pop bc
    ld b, a
    push bc
    ld c, $02
    call call_aa00
    pop bc
    dec a
    jr z, jr_000_a773

    dec a
    jr z, jr_000_a7b3

    dec a
    jp z, jp_a7da

    dec a
    jp z, jp_a7e9

    dec a
    jp z, jp_a7fc

    dec a
    jp z, jp_a800

    jp jp_a81a


call_a766:
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


jr_000_a773:
    ld a, [$c800]
    bit 3, a
    jr z, jr_000_a784

    ld a, [$c8fc]
    and $01
    ld c, a
    ld hl, data_b633
    ret


jr_000_a784:
    ld a, [$c8f9]
    bit 1, a
    jr z, jr_000_a795

    ld a, [$c8fc]
    and $01
    ld c, a
    ld hl, data_b637
    ret


jr_000_a795:
    ld hl, data_b613

jr_000_a798:
    ld a, [$c8f0]
    rra
    jr nc, jr_000_a7a5

    push hl
    ld hl, sp+$06
    ld a, $a8
    ld [hl], a
    pop hl

jr_000_a7a5:
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


jr_000_a7b3:
    ld a, [$c800]
    bit 3, a
    jr z, jr_000_a7c4

    ld a, [$c90c]
    and $01
    ld c, a
    ld hl, data_b65b
    ret


jr_000_a7c4:
    ld a, [$c909]
    bit 1, a
    jr z, jr_000_a7d5

    ld a, [$c90c]
    and $01
    ld c, a
    ld hl, data_b65f
    ret


jr_000_a7d5:
    ld hl, data_b63b
    jr jr_000_a798


jp_a7da:
    ld a, [$c919]
    bit 7, a
    jr nz, jr_000_a7e5

    ld hl, data_b665
    ret


jr_000_a7e5:
    ld hl, data_b663
    ret


jp_a7e9:
    push bc
    ld c, $04
    call call_aa00
    pop bc
    bit 1, a
    jr nz, jr_000_a7f8

    ld hl, data_b667
    ret


jr_000_a7f8:
    ld hl, data_b66f
    ret


jp_a7fc:
    ld hl, data_b677
    ret


jp_a800:
    ld hl, data_b67f
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


jp_a81a:
    ld hl, data_b687
    ld e, b
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    add hl, de
    ret


call_a82a:
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


call_a843:
    and a
    ld a, [$c8f9]
    bit 4, a
    ret z

    ld a, [$c909]
    bit 4, a
    ret z

    scf
    ret


call_a852:
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
    jr z, jr_000_a8a8

    ld a, h
    sla a
    inc a

jr_000_a8a8:
    ld [$ca3c], a
    trap $8c
    ld a, l
    ld [$ca3a], a
    ld a, h
    ld [$ca3b], a
    push hl
    ld l, e
    ld h, d
    ld a, l
    or h
    jr z, jr_000_a8c0

    ld a, h
    sla a
    inc a

jr_000_a8c0:
    ld [$ca46], a
    trap $8c
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
    trap $84
    ld a, l
    and a
    jr nz, jr_000_a8e0

    pop hl
    pop de
    ld a, $01
    jr jr_000_a8e4

jr_000_a8e0:
    pop de
    pop hl
    ld a, $02

jr_000_a8e4:
    ld [$ca47], a
    trap $8b
    ld a, l
    ld [$ca42], a
    ld a, h
    ld [$ca43], a
    pop af
    call call_a82a
    ld de, $ca35
    ld bc, $0014
    trap $02
    ret


call_a8fe:
    push af
    call call_a82a
    ld e, l
    ld d, h
    ld hl, $ca35
    ld bc, $0014
    trap $02
    ld a, [$ca47]
    and a
    jr z, jr_000_a91c

    ld hl, jr_000_a91c
    push hl
    cp $01
    jr nz, jr_000_a95c

    jr jr_000_a929

jr_000_a91c:
    pop af
    call call_a82a
    ld de, $ca35
    ld bc, $0014
    trap $02
    ret


jr_000_a929:
    ld a, [$ca3e]
    ld b, a
    ld a, [$ca3f]
    cp b
    jr nz, jr_000_a938

    xor a
    ld [$ca47], a
    ret


jr_000_a938:
    ld a, [$ca46]
    add b
    ld [$ca3e], a
    ld hl, $ca3a
    call call_a98f
    bit 7, h
    ret nz

    ld e, l
    ld d, h
    ld bc, $ca44
    call call_a9a9
    ld a, [$ca3c]
    ld b, a
    ld a, [$ca36]
    add b
    ld [$ca36], a
    ret


jr_000_a95c:
    ld a, [$ca36]
    ld b, a
    ld a, [$ca37]
    cp b
    jr nz, jr_000_a96b

    xor a
    ld [$ca47], a
    ret


jr_000_a96b:
    ld a, [$ca3c]
    add b
    ld [$ca36], a
    ld hl, $ca44
    call call_a98f
    bit 7, h
    ret nz

    ld e, l
    ld d, h
    ld bc, $ca3a
    call call_a9a9
    ld a, [$ca46]
    ld b, a
    ld a, [$ca3e]
    add b
    ld [$ca3e], a
    ret


call_a98f:
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


call_a9a9:
    ld a, [bc]
    ld l, a
    inc bc
    ld a, [bc]
    ld h, a
    sla l
    rl h
    trap $88
    ld a, l
    ld [$ca42], a
    ld a, h
    ld [$ca43], a
    ret


call_a9bd:
    ld a, [$c800]
    bit 0, a
    ret z

    ld c, $14
    ld hl, $c8f7

jr_000_a9c8:
    push bc
    push hl
    ld e, l
    ld d, h
    ld bc, call_a9e6
    push bc
    ld c, [hl]
    ld b, $00
    sla c
    rl b
    ld hl, call_a9f0
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


call_a9e6:
    pop hl
    ld bc, $0010
    add hl, bc
    pop bc
    dec c
    jr nz, jr_000_a9c8

    ret


call_a9f0:
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

call_aa00:
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


call_aa0b:
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


call_aa17:
    ld c, $06
    call call_aa00
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
    call call_adf8
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
    call call_adf8
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
    call call_adf8
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
    call call_adf8
    pop hl
    pop de
    pop bc
    rl d
    ld c, $05
    call call_aa00
    xor $02
    ld c, $01
    and a
    jr z, jr_000_aa6c

jr_000_aa67:
    sla c
    dec a
    jr nz, jr_000_aa67

jr_000_aa6c:
    ld a, d
    or c
    ret


call_aa6f:
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
    call call_adf8
    pop hl
    ret c

    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ret


call_aa9a:
    push de
    push bc
    ld b, $02
    call call_aa6f
    pop bc
    pop de
    ret nc

    ld b, $fe
    call call_aa6f
    ret


call_aaaa:
    push de
    push bc
    ld c, $02
    call call_aa6f
    pop bc
    pop de
    ret nc

    ld c, $fe
    call call_aa6f
    ret


call_aaba:
    ldh a, [$8a]
    bit 6, a
    push af
    call nz, call_ab8e
    pop af
    bit 7, a
    call nz, call_abc5
    ret


call_aac9:
    ldh a, [$8a]
    bit 5, a
    push af
    call nz, call_abfb
    pop af
    bit 4, a
    call nz, call_ac32
    ret


call_aad8:
    ldh a, [$8a]
    bit 6, a
    push af
    call nz, call_aba9
    pop af
    bit 7, a
    call nz, call_abe0
    ret


call_aae7:
    ldh a, [$8a]
    bit 5, a
    push af
    call nz, call_ac17
    pop af
    bit 4, a
    call nz, call_ac4c
    ret


call_aaf6:
    call call_a843
    jr c, jr_000_ab45

    ldh a, [$8a]
    bit 0, a
    jr nz, jr_000_ab41

    ld a, [$c8f9]
    bit 1, a
    jr nz, jr_000_ab1d

    ld a, [$c8fa]
    bit 0, a
    jr nz, jr_000_ab17

    call call_aaba
    call call_aac9
    jr jr_000_ab1d

jr_000_ab17:
    call call_aac9
    call call_aaba

jr_000_ab1d:
    ld a, [$c909]
    bit 1, a
    jr nz, jr_000_ab39

    ld a, [$c90a]
    bit 0, a
    jr nz, jr_000_ab33

    call call_aad8
    call call_aae7
    jr jr_000_ab39

jr_000_ab33:
    call call_aae7
    call call_aad8

jr_000_ab39:
    xor a
    ld [$c927], a
    ld [$c937], a
    ret


jr_000_ab41:
    call call_ac69
    ret


jr_000_ab45:
    xor a
    ld [$c927], a
    ld [$c937], a
    ld c, $03

jr_000_ab4e:
    push bc
    xor a
    call call_a8fe
    ld a, $01
    call call_a8fe
    pop bc
    dec c
    jr nz, jr_000_ab4e

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
    jr nz, jr_000_ab81

    ld hl, $c8f9
    ld a, [hl]
    res 4, a
    ld [hl], a

jr_000_ab81:
    ld a, [$ca6e]
    and a
    ret nz

    ld hl, $c909
    ld a, [hl]
    res 4, a
    ld [hl], a
    ret


call_ab8e:
    ld a, [$c8fb]
    cpl
    inc a
    ld c, a
    ld b, $00
    ld e, b
    push bc
    call call_aa6f
    pop bc
    jr nc, jr_000_aba4

    ld e, $00
    call call_aa9a
    ret c

jr_000_aba4:
    xor a
    ld [$c8fa], a
    ret


call_aba9:
    ld a, [$c90b]
    cpl
    inc a
    ld c, a
    ld b, $00
    ld e, $01
    push bc
    call call_aa6f
    pop bc
    jr nc, jr_000_abc0

    ld e, $01
    call call_aa9a
    ret c

jr_000_abc0:
    xor a
    ld [$c90a], a
    ret


call_abc5:
    ld a, [$c8fb]
    ld c, a
    ld b, $00
    ld e, $00
    push bc
    call call_aa6f
    pop bc
    jr nc, jr_000_abda

    ld e, $00
    call call_aa9a
    ret c

jr_000_abda:
    ld a, $02
    ld [$c8fa], a
    ret


call_abe0:
    ld a, [$c90b]
    ld c, a
    ld b, $00
    ld e, $01
    push bc
    call call_aa6f
    pop bc
    jr nc, jr_000_abf5

    ld e, $01
    call call_aa9a
    ret c

jr_000_abf5:
    ld a, $02
    ld [$c90a], a
    ret


call_abfb:
    ld a, [$c8fb]
    cpl
    inc a
    ld b, a
    ld c, $00
    ld e, c
    push bc
    call call_aa6f
    pop bc
    jr nc, jr_000_ac11

    ld e, $00
    call call_aaaa
    ret c

jr_000_ac11:
    ld a, $03
    ld [$c8fa], a
    ret


call_ac17:
    ld a, [$c90b]
    ld b, a
    ld c, $00
    ld e, $01
    push bc
    call call_aa6f
    pop bc
    jr nc, jr_000_ac2c

    ld e, $01
    call call_aaaa
    ret c

jr_000_ac2c:
    ld a, $01
    ld [$c90a], a
    ret


call_ac32:
    ld a, [$c8fb]
    ld b, a
    ld c, $00
    ld e, c
    push bc
    call call_aa6f
    pop bc
    jr nc, jr_000_ac46

    ld e, $00
    call call_aaaa
    ret c

jr_000_ac46:
    ld a, $01
    ld [$c8fa], a
    ret


call_ac4c:
    ld a, [$c90b]
    cpl
    inc a
    ld b, a
    ld c, $00
    ld e, $01
    push bc
    call call_aa6f
    pop bc
    jr nc, jr_000_ac63

    ld e, $01
    call call_aaaa
    ret c

jr_000_ac63:
    ld a, $03
    ld [$c90a], a
    ret


call_ac69:
    ld a, [$c8f9]
    bit 1, a
    jr nz, jr_000_ac8c

    ld a, [$c927]
    and a
    jr nz, jr_000_ac90

    ld hl, $c8f5
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld e, $07
    ld hl, $c925
    call call_a61e
    ld a, [$c8fa]
    ld [$c92a], a
    jr jr_000_ac90

jr_000_ac8c:
    xor a
    ld [$c927], a

jr_000_ac90:
    ld a, [$c909]
    bit 1, a
    jr nz, jr_000_acb1

    ld a, [$c937]
    and a
    ret nz

    ld hl, $c905
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld e, $07
    ld hl, $c935
    call call_a61e
    ld a, [$c90a]
    ld [$c93a], a
    ret


jr_000_acb1:
    xor a
    ld [$c937], a
    ret


call_acb6:
    ld c, $0b
    call call_aa00
    and a
    jr z, jr_000_acc3

    dec a
    call call_aa0b
    ret


jr_000_acc3:
    ld a, $04
    call call_aa0b
    ld c, $01
    call call_aa00
    xor $01
    call call_aa0b
    ret


call_acd3:
    call call_a843
    ret c

    ld c, $04
    call call_aa00
    bit 1, a
    ret nz

    call call_aa17
    cp $0f
    jr nz, jr_000_acf2

    ld c, $05
    call call_aa00
    xor $02
    call call_aa0b
    jr jr_000_ad10

jr_000_acf2:
    ld d, a

jr_000_acf3:
    push hl
    trap RandNext
    pop hl
    ld b, a
    and $03
    ld c, $01

jr_000_acfc:
    and a
    jr z, jr_000_ad04

    sla c
    dec a
    jr jr_000_acfc

jr_000_ad04:
    ld a, d
    and c
    jr nz, jr_000_acf3

    ld a, b
    and $03
    ld c, $05
    call call_aa0b

jr_000_ad10:
    ld c, $05
    call call_aa00
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    ld b, a
    ld a, d
    and a
    jr z, jr_000_ad2c

    dec a
    jr z, jr_000_ad34

    dec a
    jr z, jr_000_ad3c

    ld a, b
    sub e
    ld c, $01
    call call_aa0b
    ret


jr_000_ad2c:
    ld a, c
    sub e
    ld c, $00
    call call_aa0b
    ret


jr_000_ad34:
    ld a, b
    add e
    ld c, $01
    call call_aa0b
    ret


jr_000_ad3c:
    ld a, c
    add e
    ld c, $00
    call call_aa0b
    ret


call_ad44:
    call call_a843
    ret c

    ld a, [$cabe]
    and a
    jr z, jr_000_ad7e

    push hl
    ld a, $05
    call call_a8fe
    pop hl
    ld c, $07
    call call_aa00
    ld a, [$caad]
    ld [hl+], a
    ld a, [hl]
    ld c, a
    ld a, [$cab5]
    ld [hl-], a
    cp c
    ret z

    jr c, jr_000_ad73

    ld c, $05
    call call_aa00
    res 1, a
    call call_aa0b
    ret


jr_000_ad73:
    ld c, $05
    call call_aa00
    set 1, a
    call call_aa0b
    ret


jr_000_ad7e:
    ld c, $0a
    call call_aa00
    ld b, a
    push hl
    trap RandNext
    pop hl
    and $0f
    inc a
    add b

jr_000_ad8c:
    sub $11
    jr nc, jr_000_ad8c

    add $11
    ld e, a
    call call_aa0b
    ld hl, data_ada9
    ld d, $00
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld d, a
    ld e, [hl]
    ld a, $05
    call call_a852
    ret


data_ada9:
    db $04, $04, $10, $18, $08, $2c, $10, $48, $04, $54, $44, $08, $3c, $20, $40, $38
    db $38, $50, $7c, $04, $70, $18, $78, $2c, $70, $48, $7c, $54, $24, $2c, $5c, $2c
    db $48, $20

call_adcb:
    srl b
    srl b
    srl b
    srl c
    srl c
    srl c

call_add7:
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
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ret


call_adf8:
    push bc
    call call_adcb
    pop bc
    ld a, [hl]
    cp $23
    jr nz, jr_000_ae04

    scf
    ret


jr_000_ae04:
    push bc
    ld a, b
    add $07
    ld b, a
    call call_adcb
    pop bc
    ld a, [hl]
    cp $23
    jr nz, jr_000_ae14

    scf
    ret


jr_000_ae14:
    push bc
    ld a, c
    add $07
    ld c, a
    call call_adcb
    pop bc
    ld a, [hl]
    cp $23
    jr nz, jr_000_ae24

    scf
    ret


jr_000_ae24:
    push bc
    ld a, b
    add $07
    ld b, a
    ld a, c
    add $07
    ld c, a
    call call_adcb
    pop bc
    ld a, [hl]
    cp $23
    jr nz, jr_000_ae38

    scf
    ret


jr_000_ae38:
    and a
    ret


call_ae3a:
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


call_ae52:
    ld bc, $c8f5
    ld hl, $c905
    ld e, [hl]
    ld a, [bc]
    cp e
    jr nz, jr_000_ae76

    cp $08
    jr nz, jr_000_ae76

    inc bc
    inc hl
    ld a, [bc]
    ld e, [hl]
    cp e
    jr c, jr_000_ae6b

    ld d, a
    ld a, e
    ld e, d

jr_000_ae6b:
    cp $38
    jr nz, jr_000_ae76

    ld a, e
    cp $48
    jr nz, jr_000_ae76

    scf
    ret


jr_000_ae76:
    and a
    ret


call_ae78:
    ld a, [$c800]
    bit 4, a
    ret z

    call call_ae52
    jr nc, jr_000_ae98

    ld a, [$c800]
    and $ef
    or $08
    ld [$c800], a
    ld a, $22
    ld [$c8f1], a
    ld a, $15
    call call_b580
    ret


jr_000_ae98:
    call call_a843
    jr c, jr_000_af12

    ld a, [$c8f9]
    bit 1, a
    jr nz, jr_000_aed5

    ld hl, $c925
    call call_af31
    ld hl, $c8f5
    call call_b009
    ld a, [$c8f0]
    and a
    jr nz, jr_000_aed5

    ld a, [$c8f9]
    bit 3, a
    jr nz, jr_000_aed5

    ld hl, $c8f5
    call call_b088
    ld a, [$c8f9]
    bit 1, a
    jr z, jr_000_aed5

    ld a, $24
    ld [$c8e4], a
    ld hl, $c8f5
    call call_b11b

jr_000_aed5:
    call call_a843
    jr c, jr_000_af12

    ld a, [$c909]
    bit 1, a
    jr nz, jr_000_af12

    ld hl, $c935
    call call_af31
    ld hl, $c905
    call call_b009
    ld a, [$c8f0]
    and a
    jr nz, jr_000_af12

    ld a, [$c909]
    bit 3, a
    jr nz, jr_000_af12

    ld hl, $c905
    call call_b088
    ld a, [$c909]
    bit 1, a
    jr z, jr_000_af12

    ld a, $24
    ld [$c8e4], a
    ld hl, $c905
    call call_b11b

jr_000_af12:
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
    call call_b580
    ret


call_af31:
    ld c, $02
    call call_aa00
    and a
    ret z

    push hl
    ld bc, $ffd0
    add hl, bc
    call call_afe3
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

jr_000_af51:
    push bc
    call call_ae3a
    jr nc, jr_000_af82

    ld c, $02
    call call_aa00
    cp $04
    jr nz, jr_000_af82

    ld c, $04
    call call_aa00
    bit 1, a
    jr nz, jr_000_af82

    set 1, a
    call call_aa0b
    ld a, $08
    ld c, $0c
    call call_aa0b
    push hl
    ld a, $03
    call call_b58a
    pop hl
    ld bc, $00c8
    call call_b286

jr_000_af82:
    ld bc, $0010
    add hl, bc
    pop bc
    dec c
    jr nz, jr_000_af51

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
    call call_adcb
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
    trap MoveCursor
    ld a, $22
    trap DrawChar
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
    call call_b009
    ld hl, $c905
    call call_b009
    pop af
    ld [$c8f0], a
    ret


call_afe3:
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    ld c, $05
    call call_aa00
    and a
    jr z, jr_000_affa

    dec a
    jr z, jr_000_afff

    dec a
    jr z, jr_000_b004

    ld a, d
    sub $08
    ld d, a
    ret


jr_000_affa:
    ld a, e
    sub $08
    ld e, a
    ret


jr_000_afff:
    ld a, d
    add $0a
    ld d, a
    ret


jr_000_b004:
    ld a, e
    add $0a
    ld e, a
    ret


call_b009:
    ld e, $00
    ld c, $05
    call call_aa00
    and a
    jr z, jr_000_b019

    cp $03
    jr z, jr_000_b019

    ld e, $02

jr_000_b019:
    ld a, [hl+]
    add $03
    add e
    ld c, a
    ld a, [hl-]
    add $03
    add e
    ld b, a
    push hl
    call call_adcb
    ld a, [hl]
    pop hl
    cp $24
    jr z, jr_000_b06c

    sub $25
    ret c

    ld c, a
    ld b, $00
    cp $04
    jr nz, jr_000_b04c

    ld a, [$c8f9]
    or $20
    ld [$c8f9], a
    ld a, [$c909]
    or $20
    ld [$c909], a
    ld a, $c8
    ld [$c8f0], a

jr_000_b04c:
    push hl
    ld a, $20
    call call_b58a
    pop hl
    push hl
    ld hl, data_b07c
    sla c
    rl b
    add hl, bc
    ld c, [hl]
    inc hl
    ld b, [hl]
    call call_b286
    pop hl
    ld a, $22
    ld [$c8e4], a
    call call_b11b
    ret


jr_000_b06c:
    ld a, [$c8f0]
    and a
    ret nz

    ld c, $04
    call call_aa00
    or $0a
    call call_aa0b
    ret


data_b07c:
    db $2c, $01
    db $58, $02
    db $e8, $03
    db $dc, $05
    db $c8, $00
    db $f4, $01


call_b088:
    ld e, l
    ld d, h
    ld c, $0f
    ld hl, $c945
jp_b08f:
    push bc
    push de
    push hl
    ld c, $02
    call call_aa00
    and a
    jr z, jr_000_b10f

    ld c, $04
    call call_aa00
    bit 1, a
    jr nz, jr_000_b10f

    call call_ae3a
    jr nc, jr_000_b10f

    ld c, $02
    call call_aa00
    inc de
    inc de
    inc de
    inc de
    cp $06
    jr nc, jr_000_b0c7

    ld a, [$c8f9]
    set 1, a
    ld [$c8f9], a
    ld a, [$c909]
    set 1, a
    ld [$c909], a
    jr jr_000_b10f

jr_000_b0c7:
    ld hl, $c8ef
    ld a, [hl]
    and a
    jr nz, jr_000_b10f

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
    call call_b58a
    ld hl, $c905
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    ld d, a
    xor a
    call call_a852
    ld hl, $c8f5
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    ld d, a
    ld a, $01
    call call_a852

jr_000_b10f:
    pop hl
    ld bc, $0010
    add hl, bc
    pop de
    pop bc
    dec c
    jp nz, jp_b08f

    ret


call_b11b:
    ld e, $00
    ld c, $05
    call call_aa00
    and a
    jr z, jr_000_b12b

    cp $03
    jr z, jr_000_b12b

    ld e, $02

jr_000_b12b:
    ld a, [hl+]
    add $03
    add e
    ld c, a
    ld a, [hl-]
    add $03
    add e
    ld b, a
    push bc
    call call_adcb
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
    trap MoveCursor
    ld a, [$c8e4]
    trap DrawChar
    ret


call_b158:
    ld a, [$c800]
    bit 2, a
    ret z

    ld hl, $c8f5
    ld c, $14

jr_000_b163:
    push bc
    ld c, $02
    call call_aa00
    ld d, a
    and a
    jr z, jr_000_b1a9

    ld c, $08
    call call_aa00
    dec a
    ld e, a
    call call_aa0b
    ld a, e
    and a
    jr nz, jr_000_b184

    push hl
    ld bc, $0009
    add hl, bc
    ld a, [hl-]
    ld [hl-], a
    inc [hl]
    pop hl

jr_000_b184:
    ld c, $05
    call call_aa00
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
    call call_aa00
    cp e
    jr c, jr_000_b1a9

    xor a
    call call_aa0b

jr_000_b1a9:
    ld c, $02
    call call_aa00
    cp $04
    jr nz, jr_000_b1ce

    ld c, $04
    call call_aa00
    bit 1, a
    jr z, jr_000_b1ce

    ld c, $0c
    call call_aa00
    dec a
    ld e, a
    call call_aa0b
    ld a, e
    and a
    jr nz, jr_000_b1ce

    ld c, $02
    call call_aa0b

jr_000_b1ce:
    ld bc, $0010
    add hl, bc
    pop bc
    dec c
    jr nz, jr_000_b163

    ret


data_b1d7:
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


call_b1f3:
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
    jr nz, jr_000_b231

    ld hl, $c8f9
    set 1, [hl]
    ld hl, $c909
    set 1, [hl]
    ld hl, $c800
    set 5, [hl]
    ld a, $28
    ld [$c8f2], a
    ld a, $19
    call call_b580
    ret


jr_000_b231:
    ld e, [hl]
    ld d, $04
    ld hl, $cbd9

jr_000_b237:
    push de
    push hl
    ld bc, call_b245
    push bc
    ld a, [hl+]
    and a
    jr z, jr_000_b24f

    dec a
    jr z, jr_000_b256

    ret


call_b245:
    pop hl
    pop de
    ld bc, $0006
    add hl, bc
    dec d
    jr nz, jr_000_b237

    ret


jr_000_b24f:
    ld a, [hl-]
    cp e
    ret nz

    call call_b26a
    ret


jr_000_b256:
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    and a
    jr z, jr_000_b260

    dec [hl]
    ret


jr_000_b260:
    xor a
    dec hl
    ld [hl-], a
    dec hl
    dec hl
    dec hl
    call call_b26a
    ret


call_b26a:
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
    call call_add7
    ld [hl], e
    pop hl
    ld h, b
    ld a, c
    add $05
    ld l, a
    trap MoveCursor
    ld a, e
    trap DrawChar
    ret


call_b286:
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
    jr z, jr_000_b2d1

    dec a
    jr nz, jr_000_b2c5

    ld a, [$c8e7]
    cp $86
    jr c, jr_000_b2d1

    jr nz, jr_000_b2c5

    ld a, [$c8e6]
    cp $9f
    jr c, jr_000_b2d1

jr_000_b2c5:
    ld hl, $c8e8
    ld a, $01
    ld [hl-], a
    ld a, $86
    ld [hl-], a
    ld a, $9f
    ld [hl], a

jr_000_b2d1:
    ld hl, $cbf1
    ld a, [hl]
    set 3, a
    ld [hl], a
    ld de, $c8e8
    ld hl, $c8eb
    ld a, [de]
    cp [hl]
    jr c, jr_000_b318

    jr nz, jr_000_b2f2

    dec hl
    dec de
    ld a, [de]
    cp [hl]
    jr c, jr_000_b318

    jr nz, jr_000_b2f2

    dec hl
    dec de
    ld a, [de]
    cp [hl]
    jr c, jr_000_b318

jr_000_b2f2:
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
    jr nz, jr_000_b318

    ld a, $37
    call call_b58a

jr_000_b318:
    pop hl
    ret


call_b31a:
    ld hl, $c8f0
    ld a, [hl]
    and a
    jr z, jr_000_b322

    dec [hl]

jr_000_b322:
    ld hl, $c8ef
    ld a, [hl]
    and a
    jr z, jr_000_b32a

    dec [hl]

jr_000_b32a:
    ld hl, $c8f1
    ld a, [hl]
    and a
    jr z, jr_000_b332

    dec [hl]

jr_000_b332:
    ld hl, $c8f2
    ld a, [hl]
    and a
    ret z

    dec [hl]
    ret


call_b33a:
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
    call call_a63f
    ret


call_b34d:
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
    call call_b33a
    call call_b55e
    ld hl, $c8e3
    ld a, [hl]
    cp $1d
    jr z, jr_000_b390

    inc [hl]
    ret


jr_000_b390:
    trap $b5
    xor a
    ld [$c8f0], a
    call call_b553
    ld hl, $98c0
    ld bc, $0040
    ld e, $22
    trap $a6
    call call_a63f
    ld bc, $9810
    ld de, $0001
    ld hl, $c8f5
    call call_a61e
    ld bc, $e810
    ld de, $0002
    ld hl, $c905
    call call_a61e
    ld bc, $ac08
    ld de, $0003
    ld hl, $c915
    call call_a61e
    ld hl, $c919
    set 7, [hl]
    xor a
    ldh [$9b], a
    ldh [$9a], a
    ld hl, $0204
    trap MoveCursor
    ld hl, data_b5de
    trap DrawString
    call call_b500
    ld a, $01
    ld [$c801], a
    ld a, $51
    ld [$c8f3], a
    ld a, $0e
    call call_b580
    ld a, $04
    ld [$c800], a
    ret


call_b3f6:
    ld a, $0a
    ld [$0000], a
    ld hl, data_b594
    ld a, [$c8e9]
    ld [hl+], a
    ld a, [$c8ea]
    ld [hl+], a
    ld a, [$c8eb]
    ld [hl], a
    xor a
    ld [$0000], a
    ret


call_b40f:
    ld a, [$c800]
    bit 5, a
    ret z

    ld hl, $c8f2
    call call_b33a
    ld hl, $c8f4
    ld a, [hl]
    and a
    jr z, jr_000_b424

    dec [hl]
    ret


jr_000_b424:
    ld hl, $c800
    set 7, [hl]
    ret


call_b42a:
    ld a, [$c800]
    bit 7, a
    ret z

    xor a
    trap PlayMusic
    trap $b5
    call call_b553
    xor a
    ldh [$9b], a
    ldh [$9a], a
    ld hl, $0807
    trap MoveCursor
    ld hl, data_b5ac
    trap DrawString
    ld hl, $0809
    trap MoveCursor
    ld hl, data_b5d3
    trap DrawString
    call call_b500
    call call_b469
    trap $b5
    call call_b553
    call call_b3f6
    call call_b500
    ld hl, $c800
    ld a, $57
    ld [hl], a
    ret


call_b469:
    ld hl, $1f0a
    trap $b6
    ld de, $ff44
    ld hl, $cbfe
    xor a
    ld [hl], a
    ld [$cbff], a

jr_000_b479:
    ld a, [de]
    and a
    jr nz, jr_000_b479

jr_000_b47d:
    ldh a, [rSTAT]
    and $03
    jr nz, jr_000_b47d

    ld a, [de]
    cp $8f
    jr z, jr_000_b4a0

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
    jr jr_000_b47d

jr_000_b4a0:
    ldh a, [$8b]
    and $0f
    jr nz, jr_000_b4b4

    ld a, [$cbff]
    inc a
    ld [$cbff], a
    and $03
    jr nz, jr_000_b479

    inc [hl]
    jr jr_000_b479

jr_000_b4b4:
    ld hl, $1f0f
    trap $b6
    ret


call_b4ba:
    ld a, [$c801]
    and a
    ret z

    dec a
    jr nz, jr_000_b4d4

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


jr_000_b4d4:
    dec a
    jr nz, jr_000_b4eb

    ld a, $3f
    ld [$c916], a
    ld hl, $0609
    trap MoveCursor
    ld hl, data_b5ef
    trap DrawString
    ld hl, $c801
    inc [hl]
    ret


jr_000_b4eb:
    ld [$c801], a
    call call_a39b
    call call_a63f
    call call_b3f6
    xor a
    trap PlayMusic
    ld a, $57
    ld [$c800], a
    ret


call_b500:
    ld a, $03
    trap $b4
    ret


call_b505:
    ld hl, $ff83

jr_000_b508:
    trap AwaitFrame
    ld a, [hl]
    cp c
    jr nc, jr_000_b510

    jr jr_000_b508

jr_000_b510:
    xor a
    ld [hl], a
    ret


call_b513:
    ld a, [$c800]
    bit 0, a
    ret z

    ldh a, [$8a]
    bit 3, a
    ret z

    ld hl, $0011
    trap MoveCursor
    ld hl, data_b5d8
    trap DrawString
    ld a, $2c
    call call_b58a
    call call_b572
    ld a, $02
    trap SetVolume
    call call_a393

jr_000_b537:
    trap AwaitFrame
    ldh a, [$8b]
    bit 3, a
    jr z, jr_000_b537

    call call_a393
    ld hl, $9a20
    ld e, $2b
    ld bc, $0005
    trap $a6
    trap AwaitFrame
    ld a, $07
    trap SetVolume
    ret


call_b553:
    ld bc, $0400
    ld e, $2b
    ld hl, $9800
    trap $a6
    ret


call_b55e:
    trap AwaitFrame
    ld a, [$c802]
    and a
    jr nz, jr_000_b56c

    trap GetMusicState
    and a
    jr nz, call_b55e

    ret


jr_000_b56c:
    ld c, $32
    call call_b505
    ret


call_b572:
    trap AwaitFrame
    ld a, [$c802]
    and a
    jr nz, jr_000_b56c

    trap GetSoundState
    and a
    jr nz, call_b572

    ret


call_b580:
    ld l, a
    ld a, [$c802]
    and a
    ret nz

    ld a, l
    trap PlayMusic
    ret


call_b58a:
    ld l, a
    ld a, [$c802]
    and a
    ret nz

    ld a, l
    trap PlaySound
    ret


data_b594:
    db $88, $13
    db $00

data_b597:
    dp "BINARY+LAND\n"
data_b5a3:
    dp "START++>+"
data_b5ac:
    dp "GAME\n"
data_b5b1:
    dp "SELECT+>+EXIT\n"
data_b5bf:
    dp "STAGE+\n"
data_b5c6:
    dp "BONUS+STAGE!\n"
data_b5d3:
    dp "OVER\n"
data_b5d8:
    dp "PAUSE\n"
data_b5de:
    dp "CONGRATULATIONS!\n"
data_b5ef:
    dp "THE++END\n"
data_b5f8:
    dp "ROUND:\n"
data_b5ff:
    dp "LEFT:\n"
data_b605:
    dp "SC:\n"
data_b609:
    dp "HI:\n"
data_b60d:
    dp "TIME:\n"

data_b613:
    dw data_b61b
    dw data_b623
    dw data_b627
    dw data_b62f

data_b61b:
    dw data_b751
    dw data_b762
    dw data_b751
    dw data_b76f

data_b623:
    dw data_b6cf
    dw data_b6e9

data_b627:
    dw data_b697
    dw data_b6a8
    dw data_b697
    dw data_b6b5

data_b62f:
    dw data_b6c2
    dw data_b6dc

data_b633:
    dw data_b697
    dw data_b7a3

data_b637:
    dw data_b697
    dw data_b7c1

data_b63b:
    dw data_b643
    dw data_b64b
    dw data_b64f
    dw data_b657

data_b643:
    dw data_b77c
    dw data_b789
    dw data_b77c
    dw data_b796

data_b64b:
    dw data_b72a
    dw data_b744

data_b64f:
    dw data_b6f6
    dw data_b703
    dw data_b6f6
    dw data_b710

data_b657:
    dw data_b71d
    dw data_b737

data_b65b:
    dw data_b6f6
    dw data_b7b4

data_b65f:
    dw data_b6f6
    dw data_b7d2

data_b663:
    dw data_b858

data_b665:
    dw data_b865

data_b667:
    dw data_b844
    dw data_b83f
    dw data_b844
    dw data_b849

data_b66f:
    dw data_b84e
    dw data_b853
    dw data_b84e
    dw data_b853

data_b677:
    dw data_b80b
    dw data_b825
    dw data_b818
    dw data_b832

data_b67f:
    dw data_b7ec
    dw data_b802
    dw data_b7df
    dw data_b7f9

data_b687:
    dw data_b88c
    dw data_b891
    dw data_b882
    dw data_b887
    dw data_b878
    dw data_b87d
    dw data_b86e
    dw data_b873 

data_b697:
    db $04
    db $f9, $ff, $00, $80
    db $f9, $07, $01, $80
    db $01, $ff, $02, $80
    db $01, $07, $03, $80

data_b6a8:
    db $03
    db $f9, $00, $04, $80
    db $01, $ff, $05, $80
    db $01, $07, $06, $80

data_b6b5:
    db $03
    db $f9, $00, $04, $80
    db $01, $ff, $07, $80
    db $01, $07, $08, $80

data_b6c2:
    db $03
    db $f9, $00, $09, $80
    db $01, $ff, $0a, $80
    db $01, $07, $0b, $80

data_b6cf:
    db $03
    db $f9, $00, $09, $a0
    db $01, $01, $0a, $a0
    db $01, $f9, $0b, $a0

data_b6dc:
    db $03
    db $f9, $ff, $0c, $80
    db $01, $ff, $0d, $80
    db $01, $07, $0e, $80

data_b6e9:
    db $03
    db $f9, $01, $0c, $a0
    db $01, $01, $0d, $a0
    db $01, $f9, $0e, $a0

data_b6f6:
    db $03
    db $f9, $ff, $0f, $80
    db $01, $ff, $10, $80
    db $01, $07, $11, $80

data_b703:
    db $03
    db $f9, $ff, $12, $80
    db $01, $ff, $13, $80
    db $01, $07, $14, $80

data_b710:
    db $03
    db $f9, $ff, $12, $80
    db $01, $ff, $15, $80
    db $01, $07, $14, $80

data_b71d:
    db $03
    db $f9, $ff, $16, $80
    db $01, $ff, $17, $80
    db $01, $07, $18, $80

data_b72a:
    db $03
    db $f9, $01, $16, $a0
    db $01, $01, $17, $a0
    db $01, $f9, $18, $a0

data_b737:
    db $03
    db $f9, $ff, $19, $80
    db $01, $ff, $1a, $80
    db $01, $07, $1b, $80

data_b744:
    db $03
    db $f9, $01, $19, $a0
    db $01, $01, $1a, $a0
    db $01, $f9, $1b, $a0

data_b751:
    db $04
    db $f9, $ff, $00, $80
    db $f9, $07, $01, $80
    db $01, $ff, $1c, $80
    db $01, $07, $03, $80

data_b762:
    db $03
    db $f9, $00, $04, $80
    db $01, $ff, $1d, $80
    db $01, $07, $06, $80

data_b76f:
    db $03
    db $f9, $00, $04, $80
    db $01, $ff, $1e, $80
    db $01, $07, $08, $80

data_b77c:
    db $03
    db $f9, $ff, $0f, $80
    db $01, $ff, $1f, $80
    db $01, $07, $11, $80

data_b789:
    db $03
    db $f9, $ff, $12, $80
    db $01, $ff, $20, $80
    db $01, $07, $14, $80

data_b796:
    db $03
    db $f9, $ff, $12, $80
    db $01, $ff, $21, $80
    db $01, $07, $14, $80

data_b7a3:
    db $04
    db $f9, $ff, $00, $00
    db $f9, $07, $01, $00
    db $01, $ff, $22, $00
    db $01, $07, $03, $00

data_b7b4:
    db $03
    db $f9, $ff, $0f, $00
    db $01, $ff, $23, $00
    db $01, $07, $11, $00

data_b7c1:
    db $04
    db $f9, $ff, $00, $00
    db $f9, $07, $01, $00
    db $01, $ff, $24, $00
    db $01, $07, $03, $00

data_b7d2:
    db $03
    db $f9, $ff, $0f, $00
    db $01, $ff, $25, $00
    db $01, $07, $11, $00

data_b7df:
    db $03
    db $f9, $ff, $0c, $00
    db $01, $ff, $26, $00
    db $01, $07, $27, $00

data_b7ec:
    db $03
    db $f9, $ff, $0c, $20
    db $01, $f9, $27, $20
    db $01, $01, $26, $20

data_b7f9:
    db $02
    db $01, $ff, $28, $00
    db $01, $07, $29, $00

data_b802:
    db $02
    db $01, $f9, $29, $20
    db $01, $01, $28, $20

data_b80b:
    db $03
    db $f8, $00, $2a, $00
    db $00, $ff, $2b, $00
    db $00, $07, $2c, $00

data_b818:
    db $03
    db $f8, $00, $2a, $20
    db $00, $f9, $2c, $20
    db $00, $01, $2b, $20

data_b825:
    db $03
    db $f8, $00, $2d, $00
    db $00, $ff, $2e, $00
    db $00, $07, $2f, $00

data_b832:
    db $03
    db $f8, $00, $2d, $20
    db $00, $f9, $2f, $20
    db $00, $01, $2e, $20

data_b83f:
    db $01
    db $00, $00, $30, $00

data_b844:
    db $01
    db $00, $00, $31, $00

data_b849:
    db $01
    db $00, $00, $30, $20

data_b84e:
    db $01
    db $00, $00, $32, $00

data_b853:
    db $01
    db $00, $00, $33, $00

data_b858:
    db $03
    db $f9, $00, $34, $00
    db $01, $00, $35, $00
    db $01, $08, $36, $00

data_b865:
    db $02
    db $00, $fc, $37, $00
    db $00, $05, $38, $00

data_b86e:
    db $01
    db $00, $f7, $39, $00

data_b873:
    db $01
    db $00, $f7, $39, $10

data_b878:
    db $01
    db $09, $00, $3a, $00

data_b87d:
    db $01
    db $09, $00, $3a, $10

data_b882:
    db $01
    db $00, $09, $39, $20

data_b887:
    db $01
    db $00, $09, $39, $30

data_b88c:
    db $01
    db $f7, $00, $3a, $40

data_b891:
    db $01
    db $f7, $00, $3a, $50

data_b896:
    INCBIN "gfx/bland/sprites.2bpp.hz"

data_bb0b:
    ; 30 compressed blocks of 20 bytes each. Level data?
    db $7b, $ee, $00, $3b, $3b, $6a, $6a, $ee, $3e, $3e, $6d, $ee, $00, $6a, $2b, $ee
    db $3f, $7e, $ed, $20, $2b, $fe, $6a, $2a, $3e, $08, $08, $3b, $6b, $ee, $bd, $6e
    db $08, $01, $00, $2a, $6b, $02, $ee, $2a, $0b, $19, $12, $17, $1d, $81, $11, $2b
    db $19, $01, $22, $08, $dc, $3f, $3b, $11, $6e, $2a, $08, $2f, $10, $15, $9f, $02
    db $f2, $10, $1c, $08, $3e, $6e, $00, $20, $d4, $2b, $3b, $2a, $00, $7e, $1c, $20
    db $15, $00, $06, $39, $37, $00, $11, $6e, $3b, $20, $f0, $01, $58, $2a, $23, $5c
    db $11, $fd, $2a, $33, $51, $62, $71, $1f, $6e, $22, $1d, $16, $1b, $21, $f9, $3f
    db $3e, $3f, $09, $01, $6b, $40, $71, $3e, $71, $11, $97, $79, $10, $63, $70, $11
    db $5e, $00, $6e, $31, $f0, $49, $01, $ef, $7d, $00, $4c, $0e, $02, $7d, $37, $48
    db $01, $b8, $20, $3a, $2a, $01, $3a, $2a, $2f, $66, $a0, $7a, $3f, $2a, $01, $cf
    db $2a, $7a, $a0, $4f, $3a, $7e, $a3, $11, $3a, $3b, $2f, $0d, $7a, $b1, $15, $08
    db $f8, $f3, $30, $d4, $d9, $00, $7b, $39, $70, $20, $e1, $96, $3a, $79, $11, $0a
    db $6a, $7a, $01, $7b, $3e, $61, $af, $2b, $d8, $12, $7e, $79, $3b, $6a, $6a, $3e
    db $60, $cb, $01, $3e, $6b, $8f, $34, $00, $68, $38, $1f, $df, $6d, $f0, $40, $2b
    db $7e, $48, $08, $3f, $bc, $10, $7e, $1f, $c4, $5e, $00, $48, $02, $08, $02, $2a
    db $6a, $5c, $45, $00, $22, $5e, $6e, $08, $20, $a5, $00, $11, $2a, $6f, $13, $b6
    db $6a, $c4, $11, $3e, $bc, $2b, $c4, $11, $a3, $7e, $bc, $02, $3a, $01, $ba, $25
    db $00, $6e, $6e, $01, $b6, $b3, $01, $25, $9c, $1f, $43, $48, $10, $93, $2a, $f4
    db $3f, $3a, $3f, $08, $12, $10, $04, $bd, $29, $20, $3b, $48, $1a, $10, $6a, $3b
    db $3e, $11, $00, $6b, $48, $64, $00, $2a, $d3, $a6, $00, $6b, $60, $a5, $10, $a9
    db $82, $6e, $60, $10, $78, $a2, $11, $84, $eb, $10, $3a, $5d, $30, $81, $01, $47
    db $22, $6e, $67, $01, $7a, $a2, $00, $81, $8e, $20, $2d, $1f, $a9, $a6, $21, $3a
    db $3e, $2f, $d5, $a3, $7a, $85, $11, $2f, $dd, $28, $12, $1f, $3b, $3f, $60, $a6
    db $02, $6e, $7b, $f7, $a2, $11, $fc

data_bc82:
    dw .bcbe, .bcc1, .bcc4, .bcc5, .bcce
    dw .bcd9, .bce4, .bcf3, .bcf4, .bcff
    dw .bd0c, .bd19, .bd22, .bd23, .bd2e
    dw .bd3d, .bd46, .bd51, .bd52, .bd61
    dw .bd68, .bd73, .bd80, .bd83, .bd8e
    dw .bd9b, .bdaa, .bdb7, .bdb8, .bdc3

.bcbe
    db 1, $33, $04
.bcc1
    db 1, $0d, $04
.bcc4
    db 0
.bcc5
    db 4, $0b, $04, $14, $04, $2e, $04, $32, $04
.bcce
    db 5, $04, $04, $0c, $04, $22, $04, $2a, $04, $3a, $04
.bcd9
    db 5, $04, $04, $0d, $04, $1c, $04, $2a, $04, $3b, $04
.bce4
    db 7, $06, $04, $0a, $04, $0d, $04, $2c, $04, $30, $04, $35, $04, $3e, $04
.bcf3
    db 0
.bcf4
    db 5, $01, $04, $05, $04, $28, $04, $31, $04, $34, $04
.bcff
    db 6, $00, $04, $04, $04, $08, $04, $26, $04, $2e, $04, $33, $04
.bd0c
    db 6, $0c, $04, $0d, $04, $10, $04, $26, $04, $33, $04, $3d, $04
.bd19
    db 4, $06, $04, $0e, $04, $16, $04, $34, $04
.bd22
    db 0
.bd23
    db 5, $02, $04, $04, $04, $10, $04, $18, $05, $3a, $04
.bd2e
    db 7, $00, $04, $08, $04, $0b, $04, $12, $05, $24, $04, $32, $04, $3c, $05
.bd3d
    db 4, $0e, $04, $20, $04, $34, $04, $3b, $05
.bd46
    db 5, $06, $04, $0c, $04, $1e, $05, $35, $05, $39, $04
.bd51
    db 0
.bd52
    db 7, $05, $05, $08, $05, $10, $04, $1a, $04, $26, $04, $35, $04, $39, $04
.bd61
    db 3, $12, $05, $16, $04, $34, $04
.bd68
    db 5, $02, $04, $0e, $05, $2a, $04, $34, $05, $3c, $04
.bd73
    db 6, $00, $05, $02, $04, $03, $04, $0a, $04, $1a, $04, $22, $04
.bd80
    db 1, $48, $05
.bd83
    db 5, $00, $04, $0c, $05, $14, $04, $28, $04, $46, $04
.bd8e
    db 6, $01, $05, $02, $04, $14, $04, $3c, $04, $3d, $05, $58, $04
.bd9b
    db 7, $00, $04, $0d, $04, $0e, $04, $26, $04, $35, $04, $39, $05, $48, $04
.bdaa
    db 6, $02, $05, $09, $04, $1a, $04, $24, $04, $3c, $05, $48, $04
.bdb7
    db 0
.bdb8
    db 5, $09, $05, $26, $05, $34, $04, $38, $04, $3d, $04
.bdc3
    db 7, $02, $04, $05, $04, $08, $04, $10, $05, $12, $04, $18, $04, $46, $04

data_bdd2:
    dw .be0e, .be11, .be1a, .be1c, .be2d
    dw .be34, .be41, .be50, .be52, .be5d
    dw .be6c, .be7d, .be93, .be95, .bea8
    dw .beba, .bec4, .bec9, .becb, .bed5
    dw .bee6, .beef, .befc, .befe, .bf11
    dw .bf1c, .bf2d, .bf40, .bf42, .bf50

.be0e
    db 2
    db $32, $5c
.be11
    db 8
    db $30, $36, $3e, $52, $58, $70, $75, $7c
.be1a
    db 1
    db $96
.be1c
    db 16
    db $04, $10, $20, $22, $26, $30, $38, $3e, $51, $54, $5a, $70, $76, $78, $7d, $82
.be2d
    db 6
    db $38, $3e, $54, $5c, $79, $7e
.be34
    db 12
    db $30, $36, $3e, $54, $58, $5a, $5c, $71, $76, $78, $7e, $9a
.be41
    db 14
    db $03, $31, $38, $40, $44, $46, $5a, $5c, $5e, $78, $7e, $82, $93, $9c
.be50
    db 1
    db $96
.be52
    db 10
    db $0b, $36, $39, $48, $4c, $4e, $50, $74, $8a, $9b
.be5d
    db 14
    db $0c, $28, $36, $3a, $3e, $50, $52, $54, $70, $76, $78, $7c, $92, $9c
.be6c
    db 16
    db $04, $09, $1e, $20, $32, $36, $38, $3b, $4e, $6a, $70, $74, $78, $7c, $7e, $94
.be7d
    db 21
    db $00, $04, $0c, $18, $28, $2a, $2e, $33, $36, $38, $44, $50, $59, $5c, $62, $71
    db $78, $7e, $86, $8a, $94
.be93
    db 1
    db $96
.be95
    db 18
    db $08, $0c, $30, $36, $3b, $3e, $4c, $52, $54, $56, $58, $6a, $70, $76, $79, $8e
    db $94, $9c
.bea8
    db 17
    db $01, $09, $0d, $16, $30, $33, $3a, $3e, $46, $58, $5c, $62, $70, $74, $76, $8a
    db $8c
.beba
    db 9
    db $01, $05, $32, $36, $50, $54, $5c, $82, $84
.bec4
    db 4
    db $32, $3e, $58, $7c
.bec9
    db 1
    db $96
.becb
    db 9
    db $16, $30, $38, $3e, $56, $5a, $70, $78, $7d
.bed5
    db 16
    db $04, $10, $20, $22, $26, $30, $38, $3e, $51, $54, $5c, $70, $76, $79, $7e, $82
.bee6
    db 8
    db $3e, $54, $58, $5a, $5c, $78, $7e, $9a
.beef
    db 12
    db $30, $36, $38, $54, $5a, $5c, $5e, $71, $76, $78, $7e, $9c
.befc
    db 1
    db $96
.befe
    db 18
    db $03, $0b, $16, $20, $24, $36, $39, $42, $48, $4c, $4e, $60, $72, $75, $8a, $91
    db $93, $9b
.bf11
    db 10
    db $0c, $28, $36, $3a, $3e, $50, $74, $78, $7c, $9c
.bf1c
    db 16
    db $09, $1e, $36, $38, $3b, $4e, $50, $52, $54, $6a, $70, $76, $78, $7c, $7e, $92
.bf2d
    db 18
    db $04, $0c, $18, $20, $28, $2a, $2e, $32, $36, $38, $59, $5c, $70, $74, $78, $7e
    db $8a, $94
.bf40
    db 1
    db $96
.bf42
    db 13
    db $08, $0c, $30, $3b, $3e, $4c, $56, $58, $6a, $72, $79, $8e, $9c
.bf50
    db 15
    db $09, $0d, $30, $3a, $3e, $52, $54, $56, $58, $5c, $70, $76, $8a, $8c, $94

data_bf60:
    dw .bf6c
    dw .bf74
    dw .bf84
    dw .bf93
    dw .bf9c
    dw .bfa8

.bf6c
    db 7
    db $16, $30, $38, $56, $5e, $70, $7a
.bf74
    db 15
    db $03, $16, $1e, $20, $24, $36, $38, $42, $5e, $60, $72, $76, $78, $91, $93
.bf84
    db 14
    db $0b, $1e, $28, $2c, $30, $3e, $4a, $56, $68, $72, $7a, $7e, $99, $9b
.bf93
    db 8
    db $30, $36, $38, $52, $5e, $70, $75, $7a
.bf9c
    db 11
    db $03, $1e, $31, $38, $40, $44, $46, $5e, $78, $82, $93
.bfa8
    db 19
    db $00, $04, $0b, $1e, $28, $2c, $33, $36, $3e, $44, $4a, $50, $62, $68, $71, $7a
    db $7e, $99, $9b

jp_bfbc:
    ld sp, $e000
    call call_a10d

jp_bfc2:
    ldh a, [$8a]
    bit 2, a
    jp nz, call_a105

jr_000_bfc9:
    call call_a5c5
    ld c, $04
    call call_b505
    call call_a1a8
    call call_a286
    call call_b4ba
    call call_a9bd
    call call_ae78
    call call_b34d
    call call_b40f
    call call_b158
    call call_a6ad
    call call_b513
    call call_b42a
    call call_b1f3
    call call_b31a
    jp jp_bfc2

ENDL

End:
