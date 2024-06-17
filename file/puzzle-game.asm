; Disassembly of "puzzle-game.gbf"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

include "hardware.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    db $c5, $13, $1d, $00, $cc, $64

Title::
    db "Puzzle Game"

Icon::
    INCBIN "gfx/icon/puzzle-game.2bpp"

Points::
    db $01, $00

Author::
    db "TARKUN    "

    db $02

History::
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00

Main::
    ld sp, $e000
    ld a, $02
    ld [$d5df], a
    rst $10
    ld b, $00
    rst $10
    rlca
    nop
    ret


    rst $10
    ld e, [hl]
    inc c
    ret


    xor a
    rst $08
    or e
    rst $10
    ld de, $e10d
    ld de, $0005
    rst $10
    ld b, $00
    rst $10
    ei
    dec bc
    ret


    rst $10
    jr jr_000_0133

    pop hl
    ld de, $0007
    rst $10
    ld b, $00
    rst $10
    db $ed
    dec bc
    ret


    rst $10
    rra

jr_000_0133:
    dec c
    pop hl
    ld de, $000a
    rst $10
    ld b, $00
    rst $10
    rst $18
    dec bc
    ret


    rst $10
    ld h, $0d
    pop hl
    ld de, $000b
    rst $10
    ld b, $00
    rst $10
    pop de
    dec bc
    ret


    rst $10
    dec l
    dec c
    pop hl
    ld de, $000c
    rst $10
    ld b, $00
    rst $10
    jp $c90b


    ld a, $20
    rst $10
    ld b, $00
    rst $10
    inc l
    dec bc
    ret


    ld hl, $d5de
    ld [hl], $00
    ld de, $0000
    rst $10
    ld b, $00
    rst $10
    ld h, c
    nop
    ret


    ld a, [hl]
    cp $01
    jr nz, jr_000_017f

    rst $10
    ld b, $00
    rst $10
    inc b
    nop
    ret


jr_000_017f:
    ret


    rst $10
    rrca
    dec c
    pop hl
    ld de, $0007
    rst $10
    ld b, $00
    rst $10
    sub b
    dec bc
    ret


    rst $10
    ld d, $0d
    pop hl
    ld de, $000a
    rst $10
    ld b, $00
    rst $10
    add d
    dec bc
    ret


    rst $10
    dec e
    dec c
    pop hl
    ld de, $000b
    rst $10
    ld b, $00
    rst $10
    ld [hl], h
    dec bc
    ret


    rst $10
    inc h
    dec c
    pop hl
    ld de, $000c
    rst $10
    ld b, $00
    rst $10
    ld h, [hl]
    dec bc
    ret


    ld a, $40
    rst $10
    ld b, $00
    rst $10
    rst $08
    ld a, [bc]
    ret


    ld hl, $d5df
    ld [hl], $00
    ld de, $0000
    rst $10
    ld b, $00
    rst $10
    inc b
    nop
    ret


    ret


jr_000_01d1:
    push hl
    rst $08
    ret c

    pop hl
    inc de
    cp $01
    jr nz, jr_000_01de

    rst $10
    ld hl, $c900

jr_000_01de:
    cp $40
    jr nz, jr_000_01ed

    rst $10
    ld b, $00
    rst $10
    daa
    nop
    ret


    rst $10
    rst $20
    rst $38
    ret


jr_000_01ed:
    cp $80
    jr nz, jr_000_01d1

    rst $10
    ld b, $00
    rst $10
    ld l, $00
    ret


    rst $10
    ret c

    rst $38
    ret


    ld a, [$d5de]
    cp $02
    jr z, jr_000_020b

    ld a, [hl]
    cp $02
    ret nz

    rst $10
    rst $30
    cp $c9

jr_000_020b:
    rst $08
    ld bc, $fe7e
    nop
    ret z

    dec a
    ld [hl], a
    ld a, [$d5a1]
    sub $08
    ld [$d5a1], a
    rst $10
    ld b, $00
    rst $10
    adc b
    ld a, [bc]
    ret


    ret


    ld a, [hl]
    cp $02
    ret z

    inc a
    ld [hl], a
    ld a, [$d5a1]
    add $08
    ld [$d5a1], a
    rst $10
    ld b, $00
    rst $10
    ld [hl], d
    ld a, [bc]
    ret


    ret


    ld a, $c0
    ld bc, $0404
    ld de, $0c0c
    ld hl, $0791
    rst $08
    or e
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_0265

    rst $08
    or l
    rst $10
    ld b, $00
    rst $10
    ld d, [hl]
    dec b
    ret


    rst $10
    ld b, $00
    rst $10
    ld hl, $c900
    rst $10
    ld b, $00
    rst $10
    jp hl


    add hl, bc
    ret


    ret


jr_000_0265:
    rst $10
    ld b, $00
    rst $10
    ld b, b
    dec b
    ret


    rst $10
    ld b, $00
    rst $10
    ld a, e
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    db $d3
    add hl, bc
    ret


    ret


    rst $08
    adc l
    ld hl, $d5b9
    ld bc, $0024
    ld e, $00
    rst $08
    and [hl]
    ld a, $01
    ld [$d5e5], a
    ld hl, $d5b9
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_029c

    ld c, $24
    rst $10
    dec b
    nop
    ret


jr_000_029c:
    ld c, $10

jr_000_029e:
    rst $10
    ld b, $00
    rst $10
    adc b
    inc bc
    ret


    ld a, [hl]
    xor $01
    ld [hl], a
    inc hl
    dec c
    jr nz, jr_000_029e

    ld c, $14

jr_000_02af:
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_02bf

    rst $08
    adc [hl]
    ld a, l
    and $1f
    rst $10
    ld [$c900], sp

jr_000_02bf:
    rst $08
    adc [hl]
    ld a, l
    and $0f
    ld hl, $d5b9
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    xor $01
    ld [hl], a
    push bc
    rst $10
    ld b, $00
    rst $10
    ld d, [hl]
    inc bc
    ret


    rst $10
    ld b, $00
    rst $10
    ret c

    dec b
    ret


    pop bc
    dec c
    jr nz, jr_000_02af

    ld a, $07
    rst $08
    or h
    xor a
    ld [$d5e5], a
    ret


    push hl
    ld de, $0000
    ld hl, $d5aa
    ld bc, $0010
    ld e, $00
    rst $08
    and [hl]
    pop hl
    rst $08
    adc l
    ld hl, $d5b9
    xor a

jr_000_0300:
    push af
    push hl

jr_000_0302:
    rst $08
    adc [hl]
    ld a, l
    and $0f
    cp $0f
    jr z, jr_000_0302

    push af
    ld hl, $d5aa
    ld d, $00
    ld e, a
    rst $08
    add a
    ld a, [hl]
    cp $01
    jr nz, jr_000_031e

    pop af
    rst $10
    rst $20
    rst $38
    ret


jr_000_031e:
    ld [hl], $01
    pop af
    pop hl
    ld [hl], a
    ld [$d5a6], a
    rst $10
    ld b, $00
    rst $10
    adc b
    nop
    ret


    pop af
    push af
    ld [$d5a6], a
    rst $10
    ld b, $00
    rst $10
    inc h
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    and d
    ld [bc], a
    ret


    pop af
    inc l
    inc a
    cp $0f
    jr nz, jr_000_0300

    ld [hl], a
    ld a, $09
    ld [$d5a2], a
    ld a, $48
    ld [$d5a3], a
    rst $10
    ld b, $00
    rst $10
    add hl, de
    inc bc
    ret


    ret


    push hl
    push de
    push bc
    push af
    ld a, [$d5a6]
    ld d, $00
    ld e, a
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0372

    ld hl, $0006
    rst $10
    ld b, $00
    ret


jr_000_0372:
    ld hl, $0004
    rst $08
    adc d
    ld a, [$c3b0]
    push hl
    ld d, $00
    ld e, a
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_038c

    ld hl, $0002
    rst $10
    ld b, $00
    ret


jr_000_038c:
    ld hl, $0003
    rst $08
    adc c
    ld a, l
    ld [$d5a2], a
    pop hl
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_03a4

    ld de, $0010
    rst $10
    ld b, $00
    ret


jr_000_03a4:
    ld de, $0018
    rst $08
    adc c
    ld a, l
    ld [$d5a3], a
    pop af
    pop bc
    pop de
    pop hl
    ret


    push hl
    push de
    push bc
    push af
    ld a, [$d5a6]
    ld d, $00
    ld e, a
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_03ca

    ld hl, $0006
    rst $10
    ld b, $00
    ret


jr_000_03ca:
    ld hl, $0004
    rst $08
    adc d
    push hl
    ld a, [$c3b0]
    cp $01
    jr nz, jr_000_03db

    rst $10
    ld b, c
    nop
    ret


jr_000_03db:
    cp $02
    jr nz, jr_000_03e3

    rst $10
    ld e, h
    nop
    ret


jr_000_03e3:
    cp $03
    jr nz, jr_000_03eb

    rst $10
    ld [hl], a
    nop
    ret


jr_000_03eb:
    cp $04
    jr nz, jr_000_03f3

    rst $10
    sub d
    nop
    ret


jr_000_03f3:
    cp $05
    jr nz, jr_000_03fb

    rst $10
    sbc d
    nop
    ret


jr_000_03fb:
    pop hl
    ld d, $00
    ld e, l
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_040d

    ld hl, $0020
    rst $10
    ld b, $00
    ret


jr_000_040d:
    ld hl, $0030
    rst $08
    adc c
    ld de, $0000
    rst $10
    adc b
    nop
    ret


    pop hl
    ld d, $00
    ld e, l
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0430

    ld hl, $0020
    rst $08
    adc c
    ld de, $0180
    rst $10
    ld [hl], c
    nop
    ret


jr_000_0430:
    ld hl, $0030
    rst $08
    adc c
    ld de, $0240
    rst $10
    ld h, l
    nop
    ret


    pop hl
    ld d, $00
    ld e, l
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0453

    ld hl, $0020
    rst $08
    adc c
    ld de, $0300
    rst $10
    ld c, [hl]
    nop
    ret


jr_000_0453:
    ld hl, $0030
    rst $08
    adc c
    ld de, $0480
    rst $10
    ld b, d
    nop
    ret


    pop hl
    ld d, $00
    ld e, l
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0476

    ld hl, $0020
    rst $08
    adc c
    ld de, $0480
    rst $10
    dec hl
    nop
    ret


jr_000_0476:
    ld hl, $0030
    rst $08
    adc c
    ld de, $06c0
    rst $10
    rra
    nop
    ret


    pop hl
    ld d, $00
    ld e, l
    ld hl, $0020
    rst $08
    adc c
    ld de, $0600
    rst $10
    rrca
    nop
    ret


    pop hl
    ld d, $00
    ld e, l
    ld hl, $0020
    rst $08
    adc c
    ld de, $0780
    add hl, de
    ld a, h
    ld [$d5a5], a
    ld a, l
    ld [$d5a4], a
    pop af
    pop bc
    pop de
    pop hl
    ret


    ld a, [$d5a4]
    ld e, a
    ld a, [$d5a5]
    ld d, a
    ld hl, $cca0
    add hl, de
    ld de, $0000
    ld bc, $0000
    ld a, [hl+]
    push hl
    push bc
    ld b, a
    ld hl, $c8b0
    add hl, de
    ld a, [hl]
    and b
    ld b, a
    ld hl, $c820
    add hl, de
    ld a, [hl]
    or b
    pop bc
    ld hl, $cc10
    add hl, bc
    ld [hl], a
    inc c
    ld a, c
    pop hl
    cp $40
    ret z

    inc e
    ld a, e
    cp $10
    jr nz, jr_000_04e8

    add $10
    ld e, a
    rst $10
    reti


    rst $38
    ret


jr_000_04e8:
    cp $30
    jr nz, jr_000_04f9

    add $30
    ld e, a
    push de
    ld de, $00a0
    add hl, de
    pop de
    rst $10
    ret z

    rst $38
    ret


jr_000_04f9:
    cp $70
    jr nz, jr_000_0504

    add $10
    ld e, a
    rst $10
    cp l
    rst $38
    ret


jr_000_0504:
    rst $10
    cp c
    rst $38
    ret


    push hl
    push de
    push bc
    push af
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_051b

    pop af
    pop bc
    pop de
    pop hl
    rst $10
    sub h
    rst $38
    ret


jr_000_051b:
    xor a
    ld [$d5a8], a
    ld [$d5a9], a

jr_000_0522:
    ld [$d5a7], a
    ld hl, $cc10
    ld a, [$d5a8]
    ld e, a
    ld a, [$d5a9]
    ld d, a
    add hl, de
    push hl
    ld a, [$d5a4]
    ld e, a
    ld a, [$d5a5]
    ld d, a
    ld hl, $cca0
    add hl, de
    push hl
    pop de
    pop hl
    ld bc, $0030
    rst $08
    ld [bc], a
    ld a, [$d5a8]
    add $30
    ld [$d5a8], a
    ld a, [$d5a4]
    ld l, a
    ld a, [$d5a5]
    ld h, a
    ld de, $00c0
    add hl, de
    ld a, l
    ld [$d5a4], a
    ld a, h
    ld [$d5a5], a
    ld a, [$d5a7]
    inc a
    cp $03
    jr nz, jr_000_0522

    xor a
    ld [$d5a8], a
    ld [$d5a9], a

jr_000_0571:
    ld [$d5a7], a
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_0582

    ld hl, $c8b0
    rst $10
    ld b, $00
    ret


jr_000_0582:
    ld hl, $c790
    ld a, [$d5a8]
    ld e, a
    ld a, [$d5a9]
    ld d, a
    add hl, de
    ld b, [hl]
    ld hl, $cc10
    ld a, [$d5a8]
    ld e, a
    ld a, [$d5a9]
    ld d, a
    add hl, de
    ld a, [hl]
    and b
    push hl
    push af
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_05ad

    ld hl, $c820
    rst $10
    ld b, $00
    ret


jr_000_05ad:
    ld hl, $c700
    ld a, [$d5a8]
    ld e, a
    ld a, [$d5a9]
    ld d, a
    add hl, de
    ld b, [hl]
    pop af
    or b
    pop hl
    ld [hl], a
    ld hl, $0001
    ld a, [$d5a8]
    ld e, a
    ld a, [$d5a9]
    ld d, a
    add hl, de
    ld a, h
    ld [$d5a9], a
    ld a, l
    ld [$d5a8], a
    ld a, [$d5a7]
    inc a
    cp $90
    jr nz, jr_000_0571

    pop af
    pop bc
    pop de
    pop hl
    ret


    push hl
    push de
    push bc
    push af
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_05fd

    ld a, [$d5dd]
    cp $00
    jr nz, jr_000_05fd

    rst $10
    ld b, $00
    rst $10
    ld a, d
    nop
    ret


    pop af
    pop bc
    pop de
    pop hl
    ret


jr_000_05fd:
    rst $10
    ld b, $00
    rst $10
    rlca
    rst $38
    ret


    ld hl, $cc10
    ld a, [$d5a2]
    ld d, a
    ld a, [$d5a3]
    ld e, a
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0620

    ld bc, $0210
    rst $08
    ret nz

    pop af
    pop bc
    pop de
    pop hl
    ret


jr_000_0620:
    ld bc, $0318
    rst $08
    ret nz

    pop af
    pop bc
    pop de
    pop hl
    ret


    push hl
    push de
    push bc
    push af
    ld [$d5dd], a
    ld d, h
    ld e, l
    ld hl, $d5b9
    rst $08
    adc b
    ld a, l
    ld [$d5a6], a
    rst $10
    ld b, $00
    rst $10
    ld [hl], d
    db $fd
    ret


    ld [$d5a6], a
    rst $10
    ld b, $00
    rst $10
    db $10
    db $fd
    ret


    push hl
    push de
    push bc
    push af
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0658

jr_000_0658:
    pop af
    pop bc
    pop de
    pop hl
    rst $10
    ld b, $00
    rst $10
    ld a, a
    rst $38
    ret


    ld a, [$d5df]
    cp $01
    jr nz, jr_000_066a

jr_000_066a:
    pop af
    pop bc
    pop de
    pop hl
    ret


    push hl
    push de
    push bc
    push af
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_0688

    ld hl, $c820
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_068b

    rst $10
    jr jr_000_0687

jr_000_0687:
    ret


jr_000_0688:
    ld hl, $c940

jr_000_068b:
    ld a, [$d5a2]
    ld d, a
    ld a, [$d5a3]
    ld e, a
    ld bc, $0318
    rst $08
    ret nz

    pop af
    pop bc
    pop de
    pop hl
    ret


    rst $10
    jp z, $e108

    ld a, [$d5a2]
    ld d, a
    ld a, [$d5a3]
    ld e, a
    ld bc, $0210
    rst $08
    ret nz

    pop af
    pop bc
    pop de
    pop hl
    ret


jr_000_06b3:
    ldh a, [$8a]
    cp $01
    jr nz, jr_000_06bd

    rst $10
    inc sp
    nop
    ret


jr_000_06bd:
    cp $06
    jr nz, jr_000_06c5

    rst $10
    inc sp
    nop
    ret


jr_000_06c5:
    cp $08
    jr nz, jr_000_06cd

    rst $10
    jr nc, jr_000_06cc

jr_000_06cc:
    ret


jr_000_06cd:
    cp $10
    jr nz, jr_000_06d5

    rst $10
    add hl, hl
    nop
    ret


jr_000_06d5:
    cp $20
    jr nz, jr_000_06dd

    rst $10
    ld c, [hl]
    nop
    ret


jr_000_06dd:
    cp $40
    jr nz, jr_000_06e5

    rst $10
    ld [hl], b
    nop
    ret


jr_000_06e5:
    cp $80
    jr nz, jr_000_06b3

    rst $10
    sub d
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    rrca
    ld bc, $c9c9
    rst $10
    add hl, bc
    ld a, [$c9c9]
    ret


    ld a, [$d5df]
    cp $01
    jr z, jr_000_0715

    ld a, [$d5a0]
    cp $78
    ret z

    add $18
    ld [$d5a0], a
    rst $10
    ld b, $00
    rst $10
    ld b, e
    dec b
    ret


    ret


jr_000_0715:
    ld a, [$d5a0]
    cp $80
    ret z

    add $10
    ld [$d5a0], a
    rst $10
    ld b, $00
    rst $10
    jr nc, jr_000_072b

    ret


    ret


    ld a, [$d5a0]

jr_000_072b:
    cp $30
    ret z

    push af
    ld a, [$d5df]
    cp $01
    jr z, jr_000_0744

    pop af
    sub $18
    ld [$d5a0], a
    rst $10
    ld b, $00
    rst $10
    inc d
    dec b
    ret


    ret


jr_000_0744:
    pop af
    sub $10
    ld [$d5a0], a
    rst $10
    ld b, $00
    rst $10
    ld b, $05
    ret


    ret


    ld a, [$d5a1]
    cp $38
    ret z

    push af
    ld a, [$d5df]
    cp $01
    jr z, jr_000_076e

    pop af
    sub $18
    ld [$d5a1], a
    rst $10
    ld b, $00
    rst $10
    ld [$c904], a
    ret


jr_000_076e:
    pop af
    sub $10
    ld [$d5a1], a
    rst $10
    ld b, $00
    rst $10
    call c, $c904
    ret


    ld a, [$d5df]
    cp $01
    jr z, jr_000_0796

    ld a, [$d5a1]
    cp $80
    ret z

    add $18
    ld [$d5a1], a
    rst $10
    ld b, $00
    rst $10
    jp nz, $c904

    ret


jr_000_0796:
    ld a, [$d5a1]
    cp $88
    ret z

    add $10
    ld [$d5a1], a
    rst $10
    ld b, $00
    rst $10
    xor a
    inc b
    ret


    ret


    ld a, [$d5de]
    cp $01
    jr z, jr_000_07e1

    ld hl, $cca0
    ld de, $0000
    ld bc, $0c60
    rst $08
    ret nz

    ld de, $0000
    rst $10
    inc d
    ld b, $e1
    rst $10
    ld b, $00
    rst $10
    ld d, l
    dec b
    ret


    ld de, $0001
    rst $10
    dec de
    ld b, $e1
    rst $10
    ld b, $00
    rst $10
    ld b, a
    dec b
    ret


    ld hl, $0000

jr_000_07da:
    rst $08
    ret c

    inc hl
    bit 0, a
    jr z, jr_000_07da

jr_000_07e1:
    push hl
    ld de, $0000
    rst $10
    ret c

    dec b
    pop hl
    rst $10
    ld b, $00
    rst $10
    ld l, $05
    ret


    ld de, $0001
    rst $10
    add hl, bc
    ld b, $e1
    rst $10
    ld b, $00
    rst $10
    jr nz, jr_000_0802

    ret


    pop hl
    ret


    push hl
    push de

jr_000_0802:
    push bc
    push af
    ld a, [$d5a1]
    sub $38
    ld d, $00
    ld e, a
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0821

    ld hl, $0010
    rst $08
    adc d
    ld de, $0006
    rst $08
    adc c
    rst $10
    dec c
    nop
    ret


jr_000_0821:
    ld hl, $0018
    rst $08
    adc d
    ld de, $0004
    rst $08
    adc c
    push hl
    ld a, [$d5a0]
    sub $30
    ld d, $00
    ld e, a
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0842

    ld hl, $0010
    rst $10
    ld b, $00
    ret


jr_000_0842:
    ld hl, $0018
    rst $08
    adc d
    pop de
    add hl, de
    push hl
    ld hl, $d5b9
    pop de
    add hl, de
    ld a, [hl]
    push af
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_0867

    pop af
    xor $01
    ld [hl], a
    rst $10
    ld b, $00
    rst $10
    jp z, $c9fd

    rst $10
    ld c, a
    nop
    ret


jr_000_0867:
    pop af
    cp $0f
    jr nz, jr_000_08b3

    pop af
    pop bc
    pop de
    pop hl
    ret


    push af
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_08de

    pop af
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_089c

    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, [hl]
    xor $01
    ld [hl], a
    rst $10
    ld b, $00
    rst $10
    sbc e
    db $fd
    ret


    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    rst $10
    and l
    nop
    ret


jr_000_089c:
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, [hl]
    xor $01
    ld [hl], a
    rst $10
    ld b, $00
    rst $10
    add d
    db $fd
    ret


    inc hl
    inc hl
    inc hl
    inc hl
    rst $10
    adc [hl]
    nop
    ret


jr_000_08b3:
    ld a, [$d5e5]
    cp $01
    jr nz, jr_000_08be

    push hl
    push de
    push bc
    push af

jr_000_08be:
    push hl
    push de
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_08ce

    ld hl, $0006
    rst $10
    ld b, $00
    ret


jr_000_08ce:
    ld hl, $0004
    rst $08
    adc d
    ld a, l
    pop de
    pop hl
    cp $00
    jr z, jr_000_093e

    rst $10
    sub [hl]
    rst $38
    ret


jr_000_08de:
    pop af
    cp $01
    jr z, jr_000_0927

    cp $02
    jr z, jr_000_090b

    push hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, [hl]
    pop hl
    cp $0f
    jr nz, jr_000_090b

    push hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    rst $10
    ld b, $00
    rst $10
    ldh a, [rSC]
    ret


    pop hl

jr_000_090b:
    push hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, [hl]
    pop hl
    cp $0f
    jr nz, jr_000_0927

    push hl
    dec hl
    dec hl
    dec hl
    dec hl
    rst $10
    ld b, $00
    rst $10
    call nc, $c902
    pop hl

jr_000_0927:
    push hl
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, [hl]
    pop hl
    cp $0f
    jr nz, jr_000_093e

    rst $10
    ld b, $00
    rst $10
    pop bc
    ld [bc], a
    ret


    pop af
    pop bc
    pop de
    pop hl
    ret


jr_000_093e:
    push hl
    push de
    push bc
    push af
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0950

    ld hl, $0006
    rst $10
    ld b, $00
    ret


jr_000_0950:
    ld hl, $0004
    rst $08
    adc d
    pop af
    pop bc
    pop de
    pop hl
    ld a, [$c3b0]
    cp $00
    jr z, jr_000_09be

    push af
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_097a

    pop af
    dec hl
    ld a, [hl]
    xor $01
    ld [hl], a
    rst $10
    ld b, $00
    rst $10
    cp b
    db $fc
    ret


    inc hl
    rst $10
    ld b, a
    nop
    ret


jr_000_097a:
    pop af
    cp $01
    jr z, jr_000_09ab

    cp $02
    jr z, jr_000_0999

    dec hl
    dec hl
    dec hl
    ld a, [hl]
    inc hl
    inc hl
    inc hl
    cp $0f
    jr nz, jr_000_0999

    dec hl
    dec hl
    rst $10
    ld b, $00
    rst $10
    add $01
    ret


    inc hl
    inc hl

jr_000_0999:
    dec hl
    dec hl
    ld a, [hl]
    inc hl
    inc hl
    cp $0f
    jr nz, jr_000_09ab

    dec hl
    rst $10
    ld b, $00
    rst $10
    or e
    ld bc, $23c9

jr_000_09ab:
    dec hl
    ld a, [hl]
    inc hl
    cp $0f
    jr nz, jr_000_09be

    rst $10
    ld b, $00
    rst $10
    and h
    ld bc, $f1c9
    pop bc
    pop de
    pop hl
    ret


jr_000_09be:
    push hl
    push de
    push bc
    push af
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_09dd

    ld hl, $0006
    rst $08
    adc d
    pop af
    pop bc
    pop de
    pop hl
    ld a, [$c3b0]
    cp $05
    jr z, jr_000_0a4b

    rst $10
    inc de
    nop
    ret


jr_000_09dd:
    ld hl, $0004
    rst $08
    adc d
    pop af
    pop bc
    pop de
    pop hl
    ld a, [$c3b0]
    cp $03
    jr z, jr_000_0a4b

    push af
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_0a07

    pop af
    inc hl
    ld a, [hl]
    xor $01
    ld [hl], a
    rst $10
    ld b, $00
    rst $10
    dec hl
    db $fc
    ret


    dec hl
    rst $10
    ld b, a
    nop
    ret


jr_000_0a07:
    pop af
    cp $02
    jr z, jr_000_0a38

    cp $01
    jr z, jr_000_0a26

    inc hl
    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    dec hl
    cp $0f
    jr nz, jr_000_0a26

    inc hl
    inc hl
    rst $10
    ld b, $00
    rst $10
    rst $28
    nop
    ret


    dec hl
    dec hl

jr_000_0a26:
    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    cp $0f
    jr nz, jr_000_0a38

    inc hl
    rst $10
    ld b, $00
    rst $10
    call c, $c900
    dec hl

jr_000_0a38:
    inc hl
    ld a, [hl]
    dec hl
    cp $0f
    jr nz, jr_000_0a4b

    rst $10
    ld b, $00
    rst $10
    call $c900

jr_000_0a46:
    pop af
    pop bc
    pop de
    pop hl
    ret


jr_000_0a4b:
    push hl
    push de
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0a64

    ld hl, $0006
    rst $08
    adc d
    ld a, l
    pop de
    pop hl
    cp $05
    jr z, jr_000_0a46

    rst $10
    rrca
    nop
    ret


jr_000_0a64:
    ld hl, $0004
    rst $08
    adc d
    ld a, l
    pop de
    pop hl
    cp $03
    jr z, jr_000_0a46

    push af
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_0ab0

    pop af
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0a99

    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    xor $01
    ld [hl], a
    rst $10
    ld b, $00
    rst $10
    sbc h
    ei
    ret


    dec hl
    dec hl
    dec hl
    dec hl
    rst $10
    or b
    rst $38
    ret


jr_000_0a99:
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    xor $01
    ld [hl], a
    rst $10
    ld b, $00
    rst $10
    add l
    ei
    ret


    dec hl
    dec hl
    dec hl
    dec hl
    rst $10
    sbc c
    rst $38
    ret


jr_000_0ab0:
    pop af
    cp $02
    jr z, jr_000_0af9

    cp $01
    jr z, jr_000_0add

    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    pop hl
    cp $0f
    jr nz, jr_000_0add

    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    rst $10
    ld b, $00
    rst $10
    rlc b
    ret


    pop hl

jr_000_0add:
    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    pop hl
    cp $0f
    jr nz, jr_000_0af9

    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    rst $10
    ld b, $00
    rst $10
    xor a
    nop
    ret


    pop hl

jr_000_0af9:
    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    pop hl
    cp $0f
    jr nz, jr_000_0b0b

    rst $10
    ld b, $00
    rst $10
    sbc h
    nop
    ret


jr_000_0b0b:
    pop af
    pop bc
    pop de
    pop hl
    ret


    push hl
    push de
    push bc
    push af
    ld a, [hl]
    push af
    inc hl
    ld [hl], a
    dec hl
    ld a, $0f
    ld [hl], a
    push hl
    ld hl, $d5b9
    pop de
    rst $08
    adc b
    ld a, l
    ld [$d5a6], a
    push hl
    rst $10
    ld b, $00
    rst $10
    ld l, $f8
    ret


    rst $10
    ld b, $00
    rst $10
    inc a
    ei
    ret


    pop hl
    ld a, l
    inc a
    ld [$d5a6], a
    rst $10
    ld b, $00
    rst $10
    ld a, [de]
    ld hl, sp-$37
    pop af
    ld [$d5a6], a
    rst $10
    ld b, $00
    rst $10
    ld h, a
    ld hl, sp-$37
    rst $10
    ld b, $00
    rst $10
    adc l
    ld a, [$f1c9]
    pop bc
    pop de
    pop hl
    ret


    push hl
    push de
    push bc
    push af
    ld a, [hl]
    push af
    dec l
    ld [hl], a
    inc l
    ld a, $0f
    ld [hl], a
    push hl
    ld hl, $d5b9
    pop de
    rst $08
    adc b
    ld a, l
    ld [$d5a6], a
    push hl
    rst $10
    ld b, $00
    rst $10
    db $e4
    rst $30
    ret


    rst $10
    ld b, $00
    rst $10
    ld a, [c]
    ld a, [$e1c9]
    ld a, l
    dec a
    ld [$d5a6], a
    rst $10
    ld b, $00
    rst $10
    ret nc

    rst $30
    ret


    pop af
    ld [$d5a6], a
    rst $10
    ld b, $00
    rst $10
    dec e
    ld hl, sp-$37
    rst $10
    ld b, $00
    rst $10
    ld b, e
    ld a, [$f1c9]
    pop bc
    pop de
    pop hl
    ret


    push hl
    push de
    push bc
    push af
    ld a, [hl]
    push af
    inc hl
    inc hl
    inc hl
    inc hl
    ld [hl], a
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, $0f
    ld [hl], a
    push hl
    ld hl, $d5b9
    pop de
    rst $08
    adc b
    ld a, l
    ld [$d5a6], a
    push hl
    rst $10
    ld b, $00
    rst $10
    sub h
    rst $30
    ret


    rst $10
    ld b, $00
    rst $10
    and d
    ld a, [$e1c9]
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, l
    ld [$d5a6], a
    rst $10
    ld b, $00
    rst $10
    ld a, l
    rst $30
    ret


    pop af
    ld [$d5a6], a
    rst $10
    ld b, $00
    rst $10
    jp z, $c9f7

    rst $10
    ld b, $00
    rst $10
    ldh a, [$f9]
    ret


    pop af
    pop bc
    pop de
    pop hl
    ret


    push hl
    push de
    push bc
    push af
    ld a, [hl]
    push af
    dec hl
    dec hl
    dec hl
    dec hl
    ld [hl], a
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, $0f
    ld [hl], a
    push hl
    ld hl, $d5b9
    pop de
    rst $08
    adc b
    ld a, l
    ld [$d5a6], a
    push hl
    rst $10
    ld b, $00
    rst $10
    ld b, c
    rst $30
    ret


    rst $10
    ld b, $00
    rst $10
    ld c, a
    ld a, [$e1c9]
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, l
    ld [$d5a6], a
    rst $10
    ld b, $00
    rst $10
    ld a, [hl+]
    rst $30
    ret


    pop af
    ld [$d5a6], a
    rst $10
    ld b, $00
    rst $10
    ld [hl], a
    rst $30
    ret


    rst $10
    ld b, $00
    rst $10
    sbc l
    ld sp, hl
    ret


    pop af
    pop bc
    pop de
    pop hl
    ret


    ld a, $30
    ld [$d5a0], a
    ld a, $38
    ld [$d5a1], a
    ld hl, $8000
    ld bc, $0040
    rst $10
    call $d102
    rst $08
    ld [bc], a
    ld hl, $c300
    ld a, [$d5a1]
    ld [hl+], a
    ld a, [$d5a0]
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    inc hl
    ld a, [$d5a1]
    ld [hl+], a
    ld a, [$d5a0]
    add $08
    ld [hl+], a
    ld a, $02
    ld [hl+], a
    ret


    ld a, $00
    ld [$d5a0], a
    ld [$d5a1], a
    rst $10
    ld b, $00
    rst $10
    set 7, a
    ret


    ret


    push af
    ld hl, $8000
    ld bc, $0010
    rst $10
    add e
    ld [bc], a
    pop de
    rst $08
    ld [bc], a
    ld a, $03
    rst $08
    or h
    pop af
    ld [$d5a0], a
    ld a, $60
    ld [$d5a1], a
    push hl
    ld hl, $c300
    ld a, [$d5a1]
    ld [hl+], a
    ld a, [$d5a0]
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    pop hl
    ret


    ld hl, $d5b9
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_0cca

    rst $10
    ld sp, $d102
    rst $10
    rlca
    nop
    ret


jr_000_0cca:
    rst $10
    add hl, de
    ld [bc], a
    pop de
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0cdc

    ld bc, $0024
    rst $10
    ld b, $00
    ret


jr_000_0cdc:
    ld bc, $0010
    rst $08
    ld h, a
    ld a, l
    or $00
    jr nz, jr_000_0ce9

    ld a, $01
    ret


jr_000_0ce9:
    ld a, $00
    ret


    rst $10
    ld b, $00
    rst $10
    adc l
    rst $38
    ret


    rst $08
    or c
    ld hl, $cca0
    ld de, $0000
    ld bc, $0c60
    rst $08
    ret nz

    ld de, $0001
    rst $10
    ld c, $01
    pop hl
    rst $10
    ld b, $00
    rst $10
    stop
    ret


    xor a
    ldh [$8a], a

jr_000_0d11:
    ldh a, [$8a]
    bit 0, a
    jr z, jr_000_0d11

    rst $10
    rst $20
    di
    ret


    push hl
    push de
    push bc
    push af
    push hl
    push de
    ld a, $06
    rst $08
    cp c
    pop hl
    rst $08
    cp b
    pop hl
    rst $08
    ld l, c
    ld a, $07
    rst $08
    cp c
    pop af
    pop bc
    pop de
    pop hl
    ret


    ld de, $cca0
    ld bc, $0900
    rst $08
    ld h, e
    ret


    ld hl, $c500
    ld de, $d5e6
    push de
    ld bc, $0900
    rst $08
    db $eb
    pop de
    ld hl, $c600
    ld b, h
    rst $08
    ld h, d
    rst $10
    ld b, $00
    rst $10
    ldh [rIE], a
    ret


    ret


jr_000_0d58:
    rst $10
    sub c
    inc bc
    pop de
    ld hl, $c600
    ld b, h
    rst $08
    ld h, d
    rst $10
    ld b, $00
    rst $10
    adc $ff
    ret


    rst $10
    rla
    nop
    ret


    rst $08
    or l
    ld hl, $c500
    ld a, [hl+]
    or [hl]
    rst $10
    ld [hl], l
    inc bc
    pop de
    jr z, jr_000_0d58

    rst $10
    ld b, $00
    rst $10
    cp a
    rst $38
    ret


    rst $10
    ld h, $02
    pop de
    ld hl, $c600
    ld b, h
    rst $08
    ld h, d
    ld de, $c700
    ld bc, $0510
    rst $08
    ld h, e
    rst $10
    ld b, $00
    rst $10
    and d
    db $f4
    ret


jr_000_0d9a:
    rst $10
    ld b, $00
    rst $10
    or [hl]
    cp $c9

jr_000_0da1:
    ldh a, [$8a]
    and a
    jr nz, jr_000_0da1

    rst $10
    ld b, $00
    rst $10
    add hl, bc
    ld sp, hl
    ret


    ld a, $00
    rst $10
    ld b, $00
    rst $10
    dec b
    rst $38
    ret


    cp $01
    jr nz, jr_000_0d9a

    rst $10
    ld sp, $c9ff
    jr nz, jr_000_0de0

    jr nz, jr_000_0de2

    jr nz, @+$22

    jr nz, jr_000_0de6

    jr nz, jr_000_0de8

    jr nz, jr_000_0dea

    jr nz, jr_000_0dec

    jr nz, jr_000_0dee

    jr nz, jr_000_0df0

    jr nz, jr_000_0df2

    nop
    jr nz, @+$22

    jr nz, jr_000_0e27

    ld d, l
    ld d, e
    ld c, b
    jr nz, jr_000_0e1d

    jr nz, jr_000_0e20

    ld d, l
    ld d, h

jr_000_0de0:
    ld d, h
    ld c, a

jr_000_0de2:
    ld c, [hl]
    ld hl, $2020

jr_000_0de6:
    jr nz, jr_000_0de8

jr_000_0de8:
    jr nz, jr_000_0e0a

jr_000_0dea:
    jr nz, jr_000_0e0c

jr_000_0dec:
    jr nz, jr_000_0e0e

jr_000_0dee:
    jr nz, jr_000_0e43

jr_000_0df0:
    ld d, h
    ld b, c

jr_000_0df2:
    ld d, d
    ld d, h
    ld hl, $2020
    jr nz, jr_000_0e19

    jr nz, jr_000_0e1b

    jr nz, jr_000_0dfd

jr_000_0dfd:
    jr nz, jr_000_0e1f

    ld d, d
    ld b, l
    ld d, h
    ld c, c
    ld d, d
    ld b, l
    jr nz, jr_000_0e27

    ld d, e
    ld b, l
    ld c, h

jr_000_0e0a:
    ld b, l
    ld b, e

jr_000_0e0c:
    ld d, h
    dec hl

jr_000_0e0e:
    ld b, d
    jr nz, jr_000_0e31

    nop
    jr nz, jr_000_0e34

    ld b, e
    ld c, a
    ld c, [hl]
    ld b, a
    ld d, d

jr_000_0e19:
    ld b, c
    ld d, h

jr_000_0e1b:
    ld d, l
    ld c, h

jr_000_0e1d:
    ld b, c
    ld d, h

jr_000_0e1f:
    ld c, c

jr_000_0e20:
    ld c, a
    ld c, [hl]
    ld hl, $2021
    jr nz, jr_000_0e27

jr_000_0e27:
    jr nz, jr_000_0e49

    jr nz, jr_000_0e4b

    ld d, b
    ld d, l
    ld e, d
    ld e, d
    ld c, h
    ld b, l

jr_000_0e31:
    jr nz, jr_000_0e53

    ld b, a

jr_000_0e34:
    ld b, c
    ld c, l
    ld b, l
    jr nz, jr_000_0e59

    jr nz, jr_000_0e5b

    nop
    jr nz, jr_000_0e5e

    jr nz, jr_000_0e60

    ld b, a
    ld b, c
    ld c, l

jr_000_0e43:
    ld b, l
    jr nz, jr_000_0e66

    ld d, e
    ld b, l
    ld c, h

jr_000_0e49:
    ld b, l
    ld b, e

jr_000_0e4b:
    ld d, h
    jr nz, jr_000_0e6e

    jr nz, @+$22

    nop
    jr nz, @+$22

jr_000_0e53:
    jr nz, jr_000_0e75

    ld sp, $2035
    ld d, b

jr_000_0e59:
    ld d, l
    ld e, d

jr_000_0e5b:
    ld e, d
    ld c, h
    ld b, l

jr_000_0e5e:
    jr nz, jr_000_0e80

jr_000_0e60:
    jr nz, jr_000_0e82

    jr nz, @+$22

    jr nz, jr_000_0e66

jr_000_0e66:
    jr nz, @+$22

    jr nz, @+$22

    ld d, b
    ld b, c
    ld c, [hl]
    ld b, l

jr_000_0e6e:
    ld c, h
    jr nz, jr_000_0eb5

    ld b, l
    jr nz, jr_000_0ec4

    ld c, a

jr_000_0e75:
    ld c, [hl]
    ld hl, $2020
    jr nz, jr_000_0e7b

jr_000_0e7b:
    jr nz, jr_000_0e9d

    jr nz, jr_000_0e9f

    ld b, l

jr_000_0e80:
    ld e, b
    ld c, c

jr_000_0e82:
    ld d, h
    jr nz, jr_000_0ea5

    jr nz, jr_000_0ea7

    jr nz, jr_000_0ea9

    jr nz, jr_000_0eab

    jr nz, jr_000_0ead

    jr nz, jr_000_0eaf

    nop
    jr nz, @+$22

    jr nz, @+$22

    ld c, l
    ld c, a
    ld b, h
    ld b, l
    jr nz, jr_000_0eba

    ld d, e
    ld b, l
    ld c, h

jr_000_0e9d:
    ld b, l
    ld b, e

jr_000_0e9f:
    ld d, h
    jr nz, jr_000_0ec2

    jr nz, jr_000_0ec4

    nop

jr_000_0ea5:
    jr nz, @+$22

jr_000_0ea7:
    jr nz, @+$22

jr_000_0ea9:
    jr nz, @+$22

jr_000_0eab:
    jr nz, @+$22

jr_000_0ead:
    ld b, l
    ld b, c

jr_000_0eaf:
    ld d, e
    ld e, c
    jr nz, jr_000_0ed3

    jr nz, jr_000_0ed5

jr_000_0eb5:
    jr nz, jr_000_0ed7

    jr nz, jr_000_0ed9

    nop

jr_000_0eba:
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

jr_000_0ec2:
    ld c, b
    ld b, c

jr_000_0ec4:
    ld d, d
    ld b, h
    jr nz, jr_000_0ee8

    jr nz, jr_000_0eea

    jr nz, jr_000_0eec

    jr nz, @+$22

    nop
    jr nz, jr_000_0ef1

    jr nz, @+$22

jr_000_0ed3:
    jr nz, @+$22

jr_000_0ed5:
    jr nz, jr_000_0ef7

jr_000_0ed7:
    ld b, l
    ld e, b

jr_000_0ed9:
    ld c, c
    ld d, h
    jr nz, jr_000_0efd

    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_000_0f03

    nop
    nop
    ld bc, $0302

jr_000_0ee8:
    inc b
    dec b

jr_000_0eea:
    ld b, $07

jr_000_0eec:
    ld [$0a09], sp
    dec bc
    inc c

jr_000_0ef1:
    dec c
    ld c, $0f
    ld bc, $0101

jr_000_0ef7:
    ld bc, $0101
    ld bc, $0101

jr_000_0efd:
    ld bc, $0101
    ld bc, $0101

jr_000_0f03:
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    nop
    nop
    inc b
    nop
    ld b, $00
    rst $38
    nop
    ld b, $f9
    db $fd
    ei
    ld [bc], a
    ld b, $04
    inc b
    ld h, b
    ld h, b
    sub b
    ldh a, [$88]
    ld hl, sp+$44
    ld a, h
    inc h
    inc a
    inc hl
    ccf
    ld [de], a
    rra
    db $10
    rra
    jr nc, jr_000_0f79

    ld c, b
    ld a, a
    ld c, b
    ld a, a
    sbc h
    rst $38
    add b
    rst $38
    ld b, b
    ld a, a
    jr nz, jr_000_0f85

    nop
    nop
    nop
    nop
    nop
    nop

jr_000_0f4c:
    nop
    nop
    nop
    nop
    ldh [$e0], a
    jr jr_000_0f4c

    inc h
    call c, $6e92
    ld d, d
    xor [hl]
    ld b, b
    cp [hl]
    nop
    cp $00
    cp $00
    cp $00
    cp $00
    cp $00
    nop
    rst $38
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b

jr_000_0f79:
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    nop

jr_000_0f85:
    rst $38
    ld a, a
    ld a, a
    cp $00
    ld bc, $0103
    inc bc
    ld bc, $0103
    inc bc
    ld bc, $0103
    inc bc
    ld bc, $0103
    inc bc
    ld bc, $0103
    inc bc
    ld bc, $0103
    inc bc
    ld bc, $0103
    rst $38
    rst $38
    rst $38
    cp $ff
    nop
    add b
    nop
    cp a
    nop
    and b
    db $f4
    rst $38
    nop
    dec b
    ld a, [c]
    db $10
    xor $1c
    inc de
    db $ec
    inc h
    rst $38
    dec [hl]
    ld hl, $7a31
    inc e
    db $fd
    inc bc
    ld bc, $4f03
    rrca
    dec b
    ld d, h
    inc h
    ld h, l
    pop af
    ld d, d
    ld bc, $411d
    db $ec
    rra
    add l
    rst $38
    sub [hl]
    add h
    rra
    db $e3
    cp a
    or l
    add $fb
    inc hl
    ld hl, sp-$1b
    rst $38
    or $a1
    ld hl, sp+$43
    ld l, a
    add b
    db $10
    ld hl, $2af5
    ld c, $0b
    ld a, a
    add a
    ld a, a
    ret c

    ld c, e
    db $fd
    ld e, e
    push de
    rra
    cp $00
    ld bc, $0380
    ld [hl], c
    add d
    push af
    adc e
    sub $30
    dec a
    and d
    rst $38
    or e
    ld [bc], a
    cp d
    ld b, a
    ld h, [hl]
    db $d3
    rst $38
    db $e4
    ld [$cb34], a
    db $fc
    ld bc, $00ff
    ld [de], a
    ld a, [de]
    ld e, a
    ld e, e
    dec sp
    rst $38
    ld c, h
    ld e, l
    rst $38
    ld l, [hl]
    ld a, a
    rst $38
    inc bc
    sub b
    and c
    rst $38
    or d
    cp [hl]
    sub b
    ld a, [$2fcf]
    cp $01
    rst $38
    db $fd
    ld [bc], a
    ld a, [$f405]
    dec bc
    add sp, $17
    db $fc
    ret nc

    cpl
    and b
    ld e, a
    ld b, b
    cp a
    db $e3
    xor $75
    ld a, a
    ret z

    ld bc, $0201
    ld [bc], a
    dec b
    inc b
    dec bc
    or c
    ld [$55de], sp
    add b
    ld a, a
    adc $1c
    ldh a, [$ce]
    ld bc, $feff
    ld [bc], a
    db $fd
    dec b
    ei
    dec bc
    rst $30
    rla
    rst $38
    xor $2f
    call c, $b85f
    db $10
    jr nc, jr_000_1073

    ld sp, hl
    ld [hl], b
    ld d, b
    or b
    ret nc

    jr nc, @+$45

    inc b
    ld b, a
    ld e, a
    ccf
    ld c, [hl]
    db $fc
    ld e, l
    cp a
    ld [hl], b

jr_000_1073:
    ld a, a
    ldh [rIE], a
    ret nz

    pop bc
    rst $38
    add b
    jr nz, jr_000_10eb

    cp a
    adc [hl]
    rst $38
    sbc a
    xor [hl]
    or b
    jr jr_000_10d4

    cp a
    inc a
    pop bc
    xor a
    db $db
    adc $df
    ei
    xor $7f
    rst $38
    rra
    ld c, $1f
    ei
    ld l, $08
    inc c
    ld [$0a0e], sp
    db $e4
    dec c
    dec bc
    inc c
    ld b, e
    inc b
    ld b, a
    ld a, [$fc4e]
    ld e, l
    rst $38
    db $fd
    ld c, $fe
    rlca
    rst $38
    inc bc
    rst $38
    ld bc, $2d3f
    ld h, l
    ld [$8080], sp
    ld b, b
    ld b, b
    and b
    jr nz, @+$01

    ret nc

    db $10
    add sp, $0b
    db $f4
    dec b
    ld a, [$e702]
    db $fd
    ld bc, $2efe
    rst $30
    and b
    add b
    ld a, a
    ld b, b
    rst $38
    cp a
    and b
    rst $18
    ret nc

    rst $28
    add sp, $77
    db $f4
    rst $20

jr_000_10d4:
    dec sp
    ld a, [$ff1d]
    di
    jr c, @+$81

    add b
    cp a
    db $fc
    ld b, b
    ld e, a
    and b
    cpl
    ret nc

    rla
    adc [hl]
    ld e, a
    db $e3
    nop
    db $f4
    ld [hl], b
    ei

jr_000_10eb:
    rst $38
    nop
    add b
    nop
    cp a
    ld a, [c]
    rrca
    rra
    cp a
    add [hl]
    db $10
    rst $30
    ld b, $c0
    or $f0
    nop
    ld a, a
    rst $38
    dec e
    ld bc, $fff0
    cpl
    ld [de], a
    rst $38
    inc hl
    ld h, d
    rst $38
    ld b, l
    ld d, [hl]
    ld hl, $c011
    cp a
    inc de
    ld d, l
    adc h
    rrca
    sub b
    adc e
    add hl, de
    db $76
    db $ed
    ld [hl+], a
    ld a, [hl]
    ld c, l
    rst $38
    inc c
    rst $38
    inc e
    rst $38
    ld a, h
    cp e
    rra
    ld [bc], a
    ret nz

    cp e
    inc de
    or h
    or h
    add hl, hl
    xor a
    ld c, l
    inc bc
    ldh [$eb], a
    cp b
    cp $4d
    ld de, $ffe3
    inc bc
    rst $30
    or $02
    db $fc
    ldh [rPCM34], a
    rst $38
    ld a, $d5
    ld a, [c]
    or [hl]
    inc b
    nop
    ld [bc], a
    db $fc
    ld b, h
    ld e, h
    cp $3f
    rst $30
    ld sp, $ffe7
    or $bd
    ld b, $f1
    ld a, l
    or e
    adc a
    rst $38
    sbc l
    rst $38
    cp b
    ld c, l
    ld de, $f080
    rst $38
    add c
    rst $38
    add a
    ld d, e
    ld d, d
    ld [bc], a
    ld c, [hl]
    ld c, [hl]
    nop
    ld e, $4c
    ld c, d
    ld [$0136], sp
    ld bc, $fd03
    ld [hl], d
    rrca
    db $e3
    ei
    db $fd
    dec bc
    ld [hl], a
    add [hl]
    ret nz

    db $76
    inc bc
    ld bc, $6c40
    ret


    adc e
    add a
    xor d
    ld [$92b6], sp
    ei
    ld [hl], e
    or [hl]
    xor d
    inc e
    xor d
    ret z

    pop af
    xor c
    set 7, l
    db $eb
    dec c
    jr nc, jr_000_119e

    rlca
    or $06
    inc c
    ld [de], a
    ld [hl+], a
    xor d
    ld hl, sp+$60
    nop
    add b
    nop

jr_000_119e:
    cp b
    cp a
    ld [hl-], a
    rra
    cp a
    db $10
    scf
    db $fc
    ld b, [hl]
    ld [hl], $00
    ld b, e
    jr nc, jr_000_122b

    dec l
    rst $38
    ld l, h
    ld c, a
    ld hl, sp+$60
    ld de, $80bf
    inc de
    ld h, l
    db $10
    sbc h
    and b
    pop af
    sbc e
    add [hl]
    rst $38
    sub a
    xor b
    or $0f
    cp c
    ldh a, [rP1]
    cp a
    cp l
    inc hl
    rst $38
    ld a, $ff
    ld [hl], a
    rst $18
    rst $38
    db $e3
    db $fd
    inc bc
    rst $38
    rlca
    rst $38
    ld c, $ff
    rst $38
    inc e
    rst $38
    jr c, @+$01

    ld [hl], b
    rst $38
    ldh [rTIMA], a
    rrca
    ld [de], a
    or $ee
    ld hl, $efbd
    sub c
    rra
    ei
    ld [hl], e

jr_000_11ea:
    ld [hl], b
    rrca
    dec [hl]
    cp $ff
    rst $30
    db $fd
    cp $20
    db $fc
    ld a, [$3e0f]
    ld d, $f3
    rra
    add a
    rst $38
    sbc h
    rst $38
    cp b
    ld e, l
    rlca
    ld h, b
    nop
    ld e, h
    ld e, d
    rrca
    ld b, [hl]
    di
    ld de, $ff81
    add e
    rra
    adc e
    ld e, d
    nop
    ld e, d
    adc l
    rst $38
    sbc l
    rst $38
    sbc c
    pop af
    rst $38
    or c
    rst $38
    cp a
    adc c
    inc d
    sbc [hl]
    db $76
    add b
    ld bc, $01ee
    inc bc
    db $fd
    or d
    ei
    db $fd
    dec bc
    or a
    dec [hl]

jr_000_122b:
    add e
    adc e
    cp l
    cp b
    ld b, [hl]
    add $c4
    jr nz, jr_000_11ea

    inc bc
    ld bc, $ac03
    ld [$bec2], a
    ld h, [hl]
    call nz, $f1d8
    cp l
    db $eb
    db $fd
    add d
    ld a, e
    dec e
    ldh a, [rNR41]
    inc e
    rrca
    call nc, $3f15
    bit 1, c
    ld e, $b6
    ld b, $4a
    ld [hl], $80
    nop
    add b
    nop
    cp a
    ld [hl], d
    pop hl
    rra
    cp a
    db $10
    ld [hl], a
    db $fc
    add [hl]
    db $76, $00
    ld [hl], b
    ld a, a
    ld c, $6d
    rst $38
    xor h
    adc a
    ld hl, sp-$60
    ld de, $13bf
    and l
    stop
    call c, $f1e0
    db $db
    add $ff
    rst $10
    add sp, -$0a
    ld sp, hl
    jr nc, jr_000_127d

jr_000_127d:
    ccf
    rst $38
    sbc l
    ld hl, $3eff
    rst $38
    ld [hl], a
    rst $38
    db $e3
    ld a, h
    dec a
    inc bc
    rst $38
    rlca
    rst $38
    inc e
    ld b, e
    db $10
    ld b, d
    nop
    ld a, $20
    ld a, $3c
    nop
    ld a, [hl-]
    inc [hl]
    ld [hl-], a
    inc [hl]
    cpl
    sub b
    cp $8a
    ld bc, $106b
    ld b, d
    ld [hl], b
    inc hl
    ld b, $75
    inc c
    ld a, e
    ld sp, $188a
    add c
    ld d, [hl]
    pop af
    inc sp
    add b
    sbc c
    inc de
    add e
    sbc c
    inc e
    and d
    rst $38
    add l
    ld [hl], $23
    cp a
    rst $38
    cp b
    set 1, d
    ld [bc], a
    dec e
    jp z, $249a

    call z, $ff9d
    adc a
    or l
    sub b
    ld bc, $01ee
    inc bc
    db $fd
    ld a, [c]
    ei
    db $fd
    dec bc
    rst $30
    inc sp
    add h
    adc e
    db $fd
    ld hl, sp-$5a
    ld [bc], a
    or $00
    inc bc
    ld l, h
    db $ed
    cp d
    ld c, $fe
    inc [hl]
    rst $38
    rla
    ld hl, sp+$0f
    ld l, e
    db $fd
    db $eb
    ld e, e
    inc b
    ld h, h
    ld l, a
    ld b, [hl]
    rst $30
    ld [de], a
    ld [hl], h
    ld a, [$cb4b]
    ld h, l
    sub h
    ld [bc], a
    dec a
    ld [bc], a
    ld a, b
    ld h, b
    nop
    add b
    nop
    cp a
    or d

jr_000_1303:
    rra
    ret nc

    cp a
    db $10
    or a
    pop af
    ld de, $b8c9
    add b
    or [hl]
    or b
    rrca
    add d

jr_000_1311:
    ld a, a
    xor l
    db $ec
    rst $38
    rst $08
    ldh [$80], a
    jp z, $e513

    db $10
    inc b
    inc e
    jr nz, jr_000_1311

    dec de
    ld b, $fb
    db $fd
    ld d, $cb
    ld [hl-], a
    jp z, $12a0

    dec de
    ld de, $5317
    ld [hl], $90
    ld [hl], b
    rrca
    ld [bc], a
    dec c
    push af
    rst $38
    ld c, $ff
    ld e, $7b
    ld de, $7f3e
    ld l, [hl]
    db $fc
    rst $38
    xor $ff
    adc $ff
    adc [hl]
    dec c
    db $10
    ld a, d
    rlca
    adc [hl]
    ld b, e
    ld [hl], h
    ld [hl], h
    add hl, hl
    ld l, a
    add b
    inc bc
    ld [hl], a
    rst $38
    db $e3
    jr nz, jr_000_1303

    xor h
    rlca
    inc e
    xor e
    or d
    jr nz, @-$7e

    sub [hl]
    pop af
    ld [hl], e
    ei
    adc a
    rst $38
    sbc l
    rst $38
    cp b
    db $dd
    ld sp, $ff80
    ld a, [$ff81]
    add e
    rst $38
    add a
    adc c
    sbc h
    db $dd
    ccf
    sub a
    cp a
    push bc
    db $76
    ld hl, $0918
    inc a
    rst $38
    inc h
    ld e, h
    dec a
    ld de, $e542
    jp $66ff


    add hl, bc
    db $10
    ld a, [de]
    ld e, $e6
    ld [bc], a
    ld [hl], d
    or $80
    ld bc, $0301
    db $fd
    ld [hl-], a
    db $e4
    ei
    db $fd
    dec bc
    scf
    ldh a, [$3a]
    adc e
    dec sp
    sub b
    ld [hl], $c0
    inc bc
    ld bc, $f12c
    ld c, e
    ld l, [hl]
    ld a, [hl+]
    ld l, b
    ld c, h
    ld l, a
    ld e, b
    ld [hl], b
    ld c, e
    dec d
    set 7, l
    db $eb
    sbc l
    sbc h
    ld a, [bc]
    ld c, h
    sbc [hl]
    rrca
    inc h
    add [hl]
    ld c, l
    or e
    ld l, e
    ld c, e
    ld l, [hl]
    inc hl
    ld c, e
    sbc e
    call nc, $0007
    or [hl]
