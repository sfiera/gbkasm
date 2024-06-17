; Disassembly of "kiss-mon.gbf"

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
    db $6e                     ; owner code

Title::
    dk "KISS-MON"
Icon::
    INCBIN "gfx/icon/kiss-mon.2bpp"

Points::
    dw $0001
Author::
    db "TOBI      ", 2
History::
    ds 11
    ds 11
    ds 11

Main::
    rst $08
    ld de, $bc21
    inc b
    rst $08
    set 2, a
    ld b, $00
    rst $10
    jr nz, jr_000_0113

    ret


    rst $10
    ld b, $00
    rst $10
    ld b, b
    rlca
    ret


    ld a, $20

jr_000_0113:
    rst $08
    or e
    ld a, $e4
    ldh [$9d], a
    rst $10
    adc a
    nop
    pop hl
    rst $08
    ld e, h
    rst $10
    ld b, $00
    rst $10
    ld d, h
    nop
    ret


    ld a, [$cca3]
    ld hl, $8000
    rst $10
    ld b, $00
    rst $10
    ret z

    dec bc
    ret


    db $3e

    db $03, $cf, $b4, $af, $21, $00, $00, $11, $40, $18, $01

HeaderManufacturerCode::
    db $03, $03, $cf, $c5

HeaderCGBFlag::
    db $cf

    or c
    rst $08
    jp Jump_000_11cf


    rst $10
    ld b, $00
    rst $10
    ld a, a
    ld b, $c9
    jr c, jr_000_0161

    rst $10
    ld b, $00
    rst $10
    sbc a
    ld bc, $cfc9
    or c
    rst $08
    ret c

    and $0f
    jr z, @-$06

jr_000_0161:
    rst $10
    ld b, $00
    rst $10
    ldh [rP1], a
    ret


    jr c, @-$65

    jr nz, jr_000_0173

    ld a, $01
    ld [$ccbf], a
    jr @-$6e

jr_000_0173:
    rst $08
    ld de, $01cf
    ld a, $00
    ld de, $0b04
    ld hl, $0100
    ld bc, $0501
    rst $08
    ld e, c
    ld hl, $cc9e
    ld de, $0001
    ld c, $05
    rst $08
    ld e, l
    ld bc, $0b05
    ld hl, $cca4

jr_000_0194:
    ld a, [hl+]
    rst $10
    ld b, $00
    rst $10
    ld b, d
    ld bc, $0cc9
    ld a, c
    cp $0a
    jr nz, jr_000_01a4

    inc c
    ld a, c

jr_000_01a4:
    cp $0e
    jr c, jr_000_0194

    ret


    inc b
    nop
    ld c, e
    ld c, c
    ld d, e
    ld d, e
    jr nz, @+$4f

    ld c, a
    ld c, [hl]
    ld d, e
    ld d, h
    ld b, l
    ld d, d
    nop
    add hl, bc
    ld [bc], a
    ld c, b
    ld d, l
    ld b, h
    ld d, e
    ld c, a
    ld c, [hl]
    jr nz, jr_000_0215

    ld c, a
    ld b, [hl]
    ld d, h
    nop
    ld b, $04
    rrca
    push bc
    rst $08
    or h
    nop
    ld b, $05
    cp d
    or e
    cp c
    sbc $b7
    nop
    ld b, $06
    adc $de
    or e
    or a
    sbc $ae
    nop
    ld b, $07
    cp l
    jp z, $d4de

jr_000_01e4:
    cp e
    nop
    ld b, $08
    or e
    db $dd
    ret


    sub $bb
    nop
    ld b, $09
    ld c, b
    ld d, b
    nop
    ld b, $0b
    or [hl]
    pop bc
    nop
    ld b, $0c
    rst $08
    cp c
    nop
    ld b, $0d
    res 6, a
    call c, $00b9
    ld [bc], a
    rrca
    ld c, $b9
    sbc $b0
    pop de
    adc $de
    or b
    or d
    rrca
    and [hl]
    jr nz, jr_000_01e4

    or [hl]
    or d

jr_000_0215:
    or c
    call c, $c3be
    nop
    ld [bc], a
    db $10
    set 0, h
    ret c

    ret nz

    sbc $b9
    jr nz, @+$10

    ld b, d
    adc $de
    ret nz

    db $dd
    rrca
    and [hl]
    jr nz, @-$49

    cp l
    call nz, $0200
    ld de, $ca0e
    sbc $c4
    reti


    rrca
    or [hl]
    sbc $0e
    cp l
    ret nz

    or b
    call nz, $bc0f
    rst $08
    cp l
    nop
    rst $38
    ld a, $20
    rst $08
    or e
    ld a, $e4
    ldh [$9d], a
    ld a, [$cca3]
    ld hl, $8000
    rst $10
    ld b, $00
    rst $10
    and c
    ld a, [bc]
    ret


    ld hl, $cc9e
    ld de, $c007
    rst $10
    ld b, $00
    rst $10
    push de
    inc b
    ret


    rst $10
    ld b, b
    nop
    pop hl
    rst $08
    ld e, h
    rst $10
    dec e
    add hl, bc
    pop hl
    ld bc, $0b0b
    ld e, $03

jr_000_0276:
    ld a, [hl+]
    rst $10
    ld b, $00
    rst $10
    ld h, b
    nop
    ret


    inc c
    dec e
    jr nz, jr_000_0276

    ld a, $03
    rst $08
    or h
    xor a
    ld hl, $0000
    ld de, $4840
    ld bc, $0303
    rst $08
    push bc

jr_000_0292:
    rst $08
    or c
    rst $08
    ret c

    bit 2, a
    jr nz, jr_000_02a4

    bit 0, a
    jr nz, jr_000_02a6

    bit 1, a
    jr z, jr_000_0292

    or a
    ret


jr_000_02a4:
    xor a
    ret


jr_000_02a6:
    scf
    ret


    ld b, $0b
    rrca
    or [hl]
    pop bc
    nop
    ld b, $0c
    rst $08
    cp c
    nop
    ld b, $0d
    res 6, a
    call c, $00b9
    inc bc
    db $10
    ld b, c
    ld a, [hl-]
    jp nz, $dec2

    cp c
    reti


    jr nz, jr_000_02e5

    ld b, d
    ld a, [hl-]
    or l
    call c, $00d9
    inc b
    ld de, $4553
    ld c, h
    ld b, l
    ld b, e
    ld d, h
    ld a, [hl-]
    cp h
    xor l
    or e
    cp [hl]
    or d
    nop
    rst $38
    push hl
    push de
    push bc
    push af
    ld l, c
    ld h, b
    rst $08
    cp b
    pop af
    ld e, a

jr_000_02e5:
    ld d, $00
    ld hl, $cc40
    rst $08
    and e
    ld hl, $cc43
    rst $08
    ld l, c
    pop bc
    pop de
    pop hl
    ret


    ld a, $1d
    rst $10
    ld b, $00
    rst $10
    db $e4
    add hl, bc
    ret


    rst $10
    ld b, $00
    rst $10
    daa
    add hl, bc
    ret


    ld de, $000d
    ld bc, $1405
    rst $08
    ld e, b
    rst $10
    ld b, $00
    rst $10
    sbc b
    inc b
    ret


    ld hl, $8800
    ld e, $00
    ld bc, $0800
    rst $08
    and [hl]
    rst $10
    ld b, $00
    rst $10
    ld d, $09
    ret


    ld hl, $cca8
    ld a, [hl+]
    ld [hl], a
    ld hl, $ccb6
    ld a, [hl+]
    ld [hl], a
    ld a, $03
    rst $08
    or h
    ld hl, $cc60
    ld [hl], $05
    inc hl
    ld [hl], $0f
    rst $10
    add $00
    pop hl
    rst $10
    ld b, $00
    rst $10
    ld b, d
    inc b
    ret


    ld c, $78

jr_000_0348:
    rst $08
    or c
    dec c
    jr nz, jr_000_0348

    rst $10
    ld b, $00
    rst $10
    ld e, b
    inc b
    ret


    ld a, $07
    rst $10
    ld b, $00
    rst $10
    ld a, e
    add hl, bc
    ret


    xor a
    ld [$ccbb], a
    rst $10
    ld b, $00
    rst $10
    or d
    nop
    ret


    jr nc, jr_000_0393

    rst $10
    ld b, $00
    rst $10
    ld a, a
    inc bc
    ret


    rst $10
    ld b, $00
    rst $10
    db $db
    inc bc
    ret


    rst $10
    db $76
    ld [bc], a
    pop hl
    rst $10
    ld b, $00
    rst $10
    dec b
    inc b
    ret


    rst $10
    ld b, $00
    rst $10
    dec a
    inc b
    ret


    rst $10
    ld b, $00
    rst $10
    jr jr_000_0391

    ret


jr_000_0391:
    jr c, jr_000_03da

jr_000_0393:
    rst $10
    ld b, $00
    rst $10
    or b
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    add sp, $00
    ret


    jr c, jr_000_03da

    ld hl, $ccbc
    ld a, [hl]
    xor $01
    ld [hl], a
    rst $10
    ld b, $00
    rst $10
    ret c

    nop
    ret


    jr c, jr_000_03da

    ld hl, $ccbb
    inc [hl]
    ld a, [hl]
    cp $0a
    jr c, jr_000_0393

    ld a, $0a
    ld [$0000], a
    rst $10
    adc [hl]
    ld [bc], a
    pop hl
    rst $10

jr_000_03c6:
    ld b, $00
    rst $10
    cp h
    inc bc
    ret


    rst $10
    ret nz

    rlca
    pop hl
    inc [hl]
    jr nz, jr_000_03d5

    ld [hl], $ff

jr_000_03d5:
    xor a
    ld [$0000], a
    ret


jr_000_03da:
    ld a, $0a
    ld [$0000], a
    ld c, $1b
    rst $10
    xor c
    rlca
    pop hl
    ld a, [$cca8]
    or a
    jr nz, jr_000_03ee

    ld c, $19
    inc hl

jr_000_03ee:
    push hl
    ld a, c
    rst $10
    ld b, $00
    rst $10
    pop hl
    ld [$e1c9], sp
    inc [hl]
    jr nz, jr_000_03fd

    ld [hl], $ff

jr_000_03fd:
    xor a
    ld [$0000], a
    ret


    ld c, $ca
    sbc $c4
    reti


    jr nz, jr_000_03c6

    ret nz

    or b
    call nz, $2121
    nop
    ld d, e
    ld d, h
    ld b, c
    ld d, d
    ld d, h
    ld hl, $0021
    ld a, [$ccbd]
    ld hl, $ccbc
    ld [hl], a
    ld a, $09
    rst $10
    ld b, $00
    rst $10
    or e
    ld [bc], a
    ret


    rst $10
    ld b, $00
    rst $10
    rst $00
    rlca
    ret


    jr c, jr_000_0445

    ld a, $09
    rst $10
    ld b, $00
    rst $10
    sbc b
    ld [bc], a
    ret


    rst $10
    ld b, $00
    rst $10
    or l
    rlca
    ret


    ret nc

    ld a, [hl]
    xor $01
    ld [hl], a

jr_000_0445:
    scf
    ret


    ld a, [$ccbd]
    ld [$ccbc], a
    ld a, $08
    rst $10
    ld b, $00
    rst $10
    ld a, e
    ld [bc], a
    ret


    rst $10
    ld b, $00
    rst $10
    or h
    rlca
    ret


    ld d, a
    ld a, $08
    rst $10
    ld b, $00
    rst $10
    ld [hl], e
    ld [bc], a
    ret


    rst $10
    ld b, $00
    rst $10
    and e
    rlca
    ret


    ld e, a
    add d
    jr nc, jr_000_0474

    ld a, $ff

jr_000_0474:
    rst $10
    ld b, $00
    rst $10
    add h
    rlca
    ret


    cp d
    jr nc, jr_000_0485

    ld hl, $ccbc
    ld a, [hl]
    xor $01
    ld [hl], a

jr_000_0485:
    ret


    rst $10
    ld b, $00
    rst $10
    ld h, e
    ld [bc], a
    ret


    rst $10
    ld b, $00
    rst $10
    cp a
    ld [bc], a
    ret


    rst $10
    add l
    ld bc, $d7e1
    ld b, $00
    rst $10
    jp hl


    ld [bc], a
    ret


    rst $10
    ld b, $00
    rst $10
    ld hl, $c903
    xor a
    ld [$ccbe], a
    rst $10
    ld b, $00
    rst $10
    ldh [rTMA], a
    ret


    jr c, jr_000_04dc

    rst $10
    ld b, $00
    rst $10
    ld b, d
    ld [bc], a
    ret


    rst $10
    ld b, $00
    rst $10
    sub d
    ld [bc], a
    ret


    rst $10
    dec sp
    ld bc, $d7e1
    ld b, $00
    rst $10
    cp h
    ld [bc], a
    ret


    rst $10
    ld b, $00
    rst $10
    sbc h
    ld bc, $d7c9
    ld b, $00
    rst $10
    jp nc, $c902

    or a
    ret


jr_000_04dc:
    ld a, $09
    rst $10
    ld b, $00
    rst $10
    db $ec
    ld bc, $cbc9
    ccf
    rst $10
    ld b, $00
    rst $10
    ld de, $c907
    ld d, a
    ld a, $08
    rst $10
    ld b, $00
    rst $10
    reti


    ld bc, $cbc9
    ccf
    add d
    ld d, a
    ld a, $07
    rst $10
    ld b, $00
    rst $10
    call z, $c901
    add d
    ld d, a
    ld a, $09
    rst $10
    ld b, $00
    rst $10
    jp z, $c901

    srl a
    rst $10
    ld b, $00
    rst $10
    and $06
    ret


    ld e, a
    ld a, $08
    rst $10
    ld b, $00
    rst $10
    or a
    ld bc, $cbc9
    ccf
    add e
    ld e, a
    ld a, $06
    rst $10
    ld b, $00
    rst $10
    xor d
    ld bc, $83c9
    ld e, a
    srl e
    srl e
    srl e
    sub e
    rst $10
    ld b, $00
    rst $10
    pop de
    ld b, $c9
    ld e, a
    xor a
    ld [$ccc0], a
    ld a, $09
    rst $10
    ld b, $00
    rst $10
    adc h
    ld bc, $d7c9
    ld b, $00
    rst $10
    and b
    ld b, $c9
    jr nc, jr_000_057a

    srl d
    push de
    ld a, e
    sub d
    jr c, jr_000_0579

    cp $05
    jr c, jr_000_0579

    rst $10
    xor d
    nop
    pop hl
    rst $10
    ld b, $00
    rst $10
    dec de
    ld [bc], a
    ret


    rst $10
    ld b, $00
    rst $10
    ld d, e
    ld [bc], a
    ret


    ld a, $01
    ld [$ccc0], a

jr_000_0579:
    pop de

jr_000_057a:
    ld a, e
    sub d
    jr z, jr_000_0580

    jr nc, jr_000_0584

jr_000_0580:
    rst $08
    adc [hl]
    and $03

jr_000_0584:
    ld [$ccbe], a
    push af
    or a
    jr nz, jr_000_0591

    rst $10
    xor b
    nop
    pop hl
    jr jr_000_059c

jr_000_0591:
    rst $10
    ld b, $00
    rst $10
    push hl
    ld bc, $d7c9
    adc e
    nop
    pop hl

jr_000_059c:
    rst $10
    ld b, $00
    rst $10
    push hl
    ld bc, $d7c9
    ld b, $00
    rst $10
    dec e
    ld [bc], a
    ret


    pop af
    rst $10
    ld b, $00
    rst $10
    ld d, [hl]
    ld bc, $f5c9
    rst $10
    ld b, $00
    rst $10
    ld l, c
    ld bc, $d7c9
    ld b, $00
    rst $10
    xor [hl]
    nop
    ret


    pop af
    jr z, jr_000_05cd

    rst $10
    ld b, $00
    rst $10
    pop hl
    ld bc, $b7c9
    ret


jr_000_05cd:
    rst $10
    ld b, $00
    rst $10
    ret c

    ld bc, $d7c9
    ld b, $00

jr_000_05d7:
    rst $10

jr_000_05d8:
    ld hl, $c901
    rst $10
    ld b, $00
    rst $10
    ld [hl], c
    ld bc, $d7c9
    ld h, e
    nop
    pop hl
    rst $10
    ld b, $00
    rst $10
    sbc e
    ld bc, $37c9
    ret


    rrca

jr_000_05f0:
    ret


    jr nz, @-$40

    db $dd
    cp [hl]
    or d
    cp d
    or e
    cp c
    sbc $b7
    ld hl, $0f00
    jp z, $bd20

    jp z, $d4de

    cp b
    jr nz, jr_000_05d7

    and [hl]
    or [hl]
    call c, $c0bc
    nop
    rrca
    or [hl]
    or d
    cp h
    db $dd
    ret


    or d
    pop bc
    cp c
    sbc $b7
    ld hl, $0f00
    ret


    jr nz, jr_000_05d8

    or e
    cp c
    sbc $b7
    ld hl, $0e00

jr_000_0625:
    adc $df
    or d
    db $dd
    call nz, $c90f
    ld c, $c0
    sbc $d2
    or b
    cp h
    sbc $00
    ld c, $c0
    sbc $d2
    or b
    cp h
    sbc $0f
    and [hl]
    jr nz, jr_000_05f0

    ret nz

    or h
    rst $10
    jp c, $b2c5

    nop
    rrca
    jp z, $c120

    or [hl]
    rst $10
    jp nz, $c0b7

    nop
    rrca
    cp h
    sbc $b6
    db $dd
    or a
    sbc $da
    jr nz, jr_000_0625

    or a
    call c, $c3b9
    sbc $bd
    nop
    ld bc, $480b
    ld d, b
    nop
    dec bc
    dec bc
    ld c, b
    ld d, b
    nop
    rst $38
    ld a, [$ccbe]
    or a
    jr z, jr_000_068d

    ld bc, $0510
    ld a, [$ccbc]
    or a
    jr z, jr_000_067e

    ld bc, $0331

jr_000_067e:
    ld a, [$ccc0]
    or a
    jr z, jr_000_0685

    ld b, c

jr_000_0685:
    ld a, b
    rst $10
    ld b, $00
    rst $10
    ld d, l
    ld b, $c9

jr_000_068d:
    ld c, $5a

jr_000_068f:
    push bc
    rst $08
    or c
    rst $08
    ret c

    rst $10
    ld b, $00
    rst $10
    ld [$c900], sp
    pop bc
    dec c
    jr nz, jr_000_068f

    ret


    ld a, [$ccbe]
    or a
    ret z

    ld a, c
    cp $32
    jr nc, jr_000_06b3

    xor a
    ldh [$9b], a
    ldh [$9a], a
    rst $10
    sbc $05
    ret


jr_000_06b3:
    and $07
    ret nz

    rst $10
    ld b, $00
    rst $10
    rst $20
    dec b
    ret


    ld a, [$ccbc]
    or a
    jr nz, jr_000_06c7

    rst $10
    call $c905

jr_000_06c7:
    ld a, d
    ldh [$9b], a
    ld a, e
    ldh [$9a], a
    ret


    push bc
    ld c, a
    ld a, [$ccbc]
    xor $01
    jr jr_000_06dc

    push bc
    ld c, a
    ld a, [$ccbc]

jr_000_06dc:
    ld b, $00
    push hl
    ld hl, $cc9e
    or a
    jr z, jr_000_06e8

    ld hl, $ccac

jr_000_06e8:
    add hl, bc
    ld a, [hl]
    pop hl
    pop bc
    ret


    ld hl, $cc9e
    ld a, [$ccbc]
    or a
    ret z

    ld hl, $ccac
    ret


    ld hl, $ccac
    ld a, [$ccbc]
    or a
    ret z

    ld hl, $cc9e
    ret


    push hl
    push af
    ld hl, $cca8
    ld a, [$ccbc]
    or a
    jr nz, jr_000_0713

    ld hl, $ccb6

jr_000_0713:
    pop af
    cpl
    inc a
    add [hl]
    bit 7, a
    jr z, jr_000_071c

    xor a

jr_000_071c:
    ld [hl], a
    pop hl
    or a
    ret


    ld hl, $cca8
    ld d, $04
    rst $10
    ld b, $00
    rst $10
    ld [$c900], sp
    ld hl, $ccb6
    ld d, $0e
    ld a, [hl]
    ld b, d
    ld c, $0b
    rst $10
    and l
    ei
    ret


    push hl
    push de
    ld a, d
    ld d, e
    ld e, $02
    ld bc, $0501
    ld hl, $0100
    rst $08
    ld e, c
    pop de
    pop hl
    ld e, $01
    ld c, $05
    rst $08
    ld e, l
    ret


    push hl
    ld hl, $cc60
    ld d, [hl]
    inc hl
    ld e, [hl]
    ld bc, $0501
    ld hl, $0100
    ld a, [$ccba]
    push af
    rst $08
    ld e, c
    pop af
    pop hl
    ld d, a
    ld e, $01
    ld c, $05
    rst $08
    ld e, l
    ld a, d
    add $05
    ld [$ccba], a
    ld hl, $cc60
    ld a, $05
    add [hl]
    ld [hl], a
    ret


    ld e, a
    ld d, $00
    ld hl, $cc40
    rst $08
    and e
    ld hl, $cc43
    push hl
    ld hl, $cc60
    ld d, [hl]
    inc hl
    ld e, [hl]
    rst $08
    ld d, a
    ld c, l
    ld b, h
    pop hl
    ld a, [$ccba]
    ld d, a
    ld e, $01
    rst $08
    ld e, e
    ld a, [$ccba]
    sub d
    cpl
    inc a
    ld hl, $cc60
    add [hl]
    ld [hl], a
    ld a, d
    ld [$ccba], a
    ret


    ld a, $7f
    ld de, $010e
    ld bc, $1203
    ld hl, $0000
    rst $08
    ld e, c
    ld a, $ca
    ld [$ccba], a
    ld hl, $cc60
    ld [hl], $01
    inc hl
    ld [hl], $0e
    ret


    ld hl, $cc60
    ld [hl], $01
    inc hl
    inc [hl]
    ret


    ld de, $c3b2
    ld hl, $cca9
    ld bc, $0003
    rst $08
    ld [bc], a
    xor a
    ld [$ccbd], a
    ld hl, $cc9c
    ld [hl], $4d
    inc hl
    ld [hl], $54
    xor a
    ld [$cc96], a

jr_000_07e7:
    ld hl, $cc96
    inc [hl]
    ld a, [hl]
    cp $03
    jr nc, jr_000_0844

    rst $08
    ld [hl], d
    jr nc, jr_000_0831

jr_000_07f4:
    rst $08
    or c
    ldh a, [$8a]
    and $02
    jr nz, jr_000_07f4

    ld hl, $cc9c
    ld de, $c600
    push de
    ld c, $02
    rst $08
    ld a, h
    pop hl
    jr c, jr_000_07e7

    ld a, [hl+]
    cp $4d
    jr nz, jr_000_0844

    ld a, [hl]
    cp $54
    jr nz, jr_000_0844

    ld hl, $cc9e
    ld de, $ccac
    ld c, $0e
    push hl
    push de
    rst $08
    ld a, h
    pop de
    pop hl
    jr c, jr_000_07e7

    ld c, $0e
    rst $08
    ld a, a
    jr c, jr_000_07e7

    rst $08
    ld [hl], e
    jr c, jr_000_07e7

    or a
    jr jr_000_0845

jr_000_0831:
    ld de, $ccb7
    ld hl, $c3b2
    ld bc, $0003
    rst $08
    ld [bc], a
    ld a, $01
    ld [$ccbd], a
    or a
    jr jr_000_0845

jr_000_0844:
    scf

jr_000_0845:
    push af
    ld hl, $cc9c
    xor a
    ld [hl+], a
    ld [hl], a
    pop af
    ret


jr_000_084e:
    rst $10
    jr nc, jr_000_0854

    pop hl
    ld a, [hl+]
    or a

jr_000_0854:
    jr z, jr_000_0877

    ld de, $cc9e
    ld c, $0e

jr_000_085b:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_000_085b

    ld a, [$ccbf]
    or a
    jr nz, jr_000_086e

    ldh a, [$8a]
    and $04
    cp $04
    ret nz

jr_000_086e:
    xor a
    ld [$ccbf], a
    ld [$cca9], a
    jr jr_000_088e

jr_000_0877:
    ld a, $64
    ld [$cca9], a
    rst $10
    ld b, $00
    rst $10
    ld c, b
    nop
    ret


    ld hl, $cc9e
    ld c, $05
    ld a, $20

jr_000_088a:
    ld [hl+], a
    dec c
    jr nz, jr_000_088a

jr_000_088e:
    ld a, $06
    rst $10
    ld b, $00
    rst $10
    ld b, c
    inc b
    ret


jr_000_0897:
    rst $10
    ld b, $00
    rst $10
    ld c, [hl]
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    cp e
    nop
    ret


    jr c, jr_000_0897

    ld a, $0a
    ld [$0000], a
    rst $10
    jp nc, $e102

    ld de, $cc9e
    ld [hl], $01
    inc hl
    ld c, $0b

jr_000_08b8:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_000_08b8

    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    xor a
    ld [$0000], a
    jr jr_000_084e

jr_000_08c8:
    ld hl, $cca4
    ld c, $04
    ld b, $00

jr_000_08cf:
    ld a, $14
    rst $10
    ld b, $00
    rst $10
    add hl, sp
    inc bc
    ret


    ld [hl+], a
    add b
    ld b, a
    dec c
    jr nz, jr_000_08cf

    ld a, $64
    sub b
    jr z, jr_000_08c8

    jr c, jr_000_08c8

    ld [hl+], a
    ld [hl], $00
    ret


    rst $10
    ld b, $00
    rst $10
    inc a
    inc bc
    ret


    ld de, $c600
    rst $08
    ld d, c
    ld de, $420d
    ld hl, $c600
    rst $08
    ld d, h
    rst $10
    jr nc, jr_000_0900

jr_000_0900:
    pop hl
    ld de, $8001
    rst $08
    ld e, d
    ld de, $0706
    ld bc, $0703
    rst $08
    ld e, b
    ld a, $3d
    ld de, $0807
    ld bc, $0501
    ld hl, $0100
    rst $08
    ld e, c
    ld a, $03
    rst $08
    or h
    ld de, $3d01
    ld b, $05
    ld hl, $cc9e
    ld a, b
    rst $08
    ld c, l
    ld c, a
    rst $08
    ld d, l
    ret


    inc b
    ld [bc], a
    ld c, $d3
    db $dd
    cp l
    ret nz

    or b
    rrca
    ret


    jr nz, @-$39

    rst $08
    or h
    and [hl]
    nop
    inc b
    inc bc
    rrca
    add $ad
    or e
    ret c

    xor [hl]
    cp b
    cp h
    jp $c0b8


    sbc $bb
    or d
    nop
    dec b
    dec bc
    ld d, e
    ld d, h
    ld b, c
    ld d, d
    ld d, h
    ld a, [hl-]
    cp c
    xor a
    jp $00b2


    rst $38
    ld a, $20
    rst $08
    or e
    xor a
    ld de, $0401
    ld bc, $0501
    ld hl, $0100
    rst $08
    ld e, c
    ld hl, $cc9e
    ld de, $0001
    ld c, $05
    rst $08
    ld e, l
    rst $10
    inc bc
    ld bc, $cfe1
    ld e, h
    ld a, $03
    rst $08
    or h
    xor a
    ld [$cc61], a
    rst $10
    ld b, $00
    rst $10
    pop hl
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    ld b, [hl]
    nop
    ret


jr_000_0993:
    rst $08
    or c
    rst $08
    ret c

    rst $10
    ld b, $00
    rst $10
    ld d, b
    nop
    ret


    ldh a, [$8b]
    and $08
    jr z, jr_000_0993

    ld a, [$cca9]
    or a
    jr nz, jr_000_0993

    ld a, [$cca8]
    or a
    jr z, jr_000_0993

    rst $10
    ld e, c
    ld bc, $cfe1
    ld e, h

jr_000_09b6:
    rst $08
    or c
    rst $08
    ret c

    bit 0, a
    jr nz, jr_000_09c4

    bit 1, a
    jr z, jr_000_09b6

    scf
    ret


jr_000_09c4:
    ld hl, $cc9e
    xor a
    ld b, $05

jr_000_09ca:
    add [hl]
    inc hl
    dec b
    jr nz, jr_000_09ca

    and $0f
    ld [$cca3], a
    or a
    ret


    ld bc, $0c04
    ld hl, $cca4

jr_000_09dc:
    ld a, [hl+]
    rst $10
    ld b, $00
    rst $10
    ld a, [$c9f8]
    inc c
    ld a, c
    cp $0a
    jr c, jr_000_09dc

    ret


    ldh a, [$b6]
    ld b, a
    and $c0
    jr z, jr_000_0a19

    rst $10
    ld b, $00
    rst $10
    ld [hl], b
    nop
    ret


    ld hl, $cc61
    ld a, [hl]
    bit 6, b
    jr z, jr_000_0a0a

    dec a
    bit 7, a
    jr z, jr_000_0a14

    ld a, $04
    jr jr_000_0a14

jr_000_0a0a:
    bit 7, b
    jr z, jr_000_0a19

    inc a
    cp $05
    jr c, jr_000_0a14

    xor a

jr_000_0a14:
    ld [hl], a
    xor a
    ld [$cc62], a

jr_000_0a19:
    ldh a, [$b6]
    ld b, a
    and $33
    jr z, jr_000_0a5a

    ld a, $01
    rst $10
    ld b, $00
    rst $10
    cp c
    ld [bc], a
    ret


    ld hl, $cca4
    ld a, [$cc61]
    ld e, a
    ld d, $00
    add hl, de
    ld e, [hl]
    ld a, [$cca9]
    ld d, a
    ld a, b
    and $11
    jr z, jr_000_0a43

    inc d
    dec d
    jr z, jr_000_0a43

    dec d
    inc e

jr_000_0a43:
    ld a, b
    and $22
    jr z, jr_000_0a4e

    inc e
    dec e
    jr z, jr_000_0a4e

    inc d
    dec e

jr_000_0a4e:
    ld [hl], e
    ld a, d
    ld [$cca9], a
    rst $10
    ld b, $00
    rst $10
    ld a, a
    rst $38
    ret


jr_000_0a5a:
    ld hl, $cc62
    ld a, [hl]
    inc [hl]
    and $0f
    ret nz

    bit 4, [hl]
    jr z, jr_000_0a6a

    ld a, $20
    jr jr_000_0a6c

jr_000_0a6a:
    ld a, $3e

jr_000_0a6c:
    push af
    ld a, [$cc61]
    add $04
    ld l, a
    ld h, $04
    rst $08
    cp b
    pop af
    rst $08
    cp e
    ret


    add hl, bc
    ld bc, $c90f
    jr nz, @-$3a

    cp b
    pop bc
    xor [hl]
    or e
    and [hl]
    nop
    inc b
    ld [bc], a
    cp [hl]
    xor a
    jp $bcb2


    jp $c0b8


    sbc $bb
    or d
    nop
    ld b, $04
    cp d
    or e
    cp c
    sbc $b7
    nop
    ld b, $05
    adc $de
    or e
    or a

jr_000_0aa3:
    sbc $ae
    nop
    ld b, $06
    cp l
    jp z, $d4de

    cp e
    nop
    ld b, $07
    or e
    db $dd
    ret


    sub $bb
    nop
    ld b, $08
    ld c, b
    ld d, b
    nop
    ld b, $09
    or c
    rst $08
    ret c

    nop
    nop
    ld c, $0f
    or c
    rst $08
    ret c

    or [hl]
    sbc $30
    add $c5
    reti


    sub $b3
    add $20
    cp h
    sbc $ad
    or e
    cp h
    sbc $0e
    or a
    or b
    rrca
    and [hl]
    nop
    nop
    rrca
    jp nz, $afb6

    jp $bd20


    or e
    pop bc
    and [hl]
    jr nz, jr_000_0aa3

    xor a
    jp $bcb2


    jp $c0b8


    sbc $bb
    or d
    nop
    ld [bc], a
    ld de, $5453
    ld b, c
    ld d, d
    ld d, h
    ld a, [hl-]
    cp [hl]
    xor a
    jp $20b2


    cp h
    xor l
    or e
    ret c

    xor [hl]
    or e
    nop
    rst $38
    inc b
    dec bc
    rrca
    cp d
    jp c, $dec3

    or d
    or d
    jp $bdde


    or [hl]
    ccf
    nop
    inc b
    inc c
    ld b, c
    ld a, [hl-]
    jp z, $20b2

    ld b, d
    ld a, [hl-]
    or d
    or d
    or h
    nop
    rst $38
    ld hl, $cc40
    push hl
    ld de, $ff46
    ld bc, $000a
    rst $08
    db $e4
    pop hl
    rst $10
    ld b, b
    nop
    pop de
    ld b, $0a

jr_000_0b3a:
    ld a, [de]
    inc de
    cp [hl]
    inc hl
    jr nz, jr_000_0b45

    dec b
    jr nz, jr_000_0b3a

    or a
    ret


jr_000_0b45:
    ld a, $0a
    ld [$0000], a
    ld hl, $cc40
    rst $10
    daa
    nop
    pop de
    ld b, $0a

jr_000_0b53:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_0b53

    rst $10
    dec h
    nop
    pop hl
    ld [hl], $00
    inc hl
    ld a, $20
    ld b, $05

jr_000_0b64:
    ld [hl+], a
    dec b
    jr nz, jr_000_0b64

    ld b, $09
    xor a

jr_000_0b6b:
    ld [hl+], a
    dec b
    jr nz, jr_000_0b6b

    xor a
    ld [$0000], a
    scf
    ret


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, @+$22

    jr nz, jr_000_0ba4

    jr nz, jr_000_0b86

jr_000_0b86:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, $09
    rst $10
    ld b, $00
    rst $10
    ld a, [hl-]
    ei
    ret


    rst $10
    ld b, $00
    rst $10
    ld d, a
    nop
    ret


    jr c, jr_000_0bbb

    rst $10
    ld b, $00
    rst $10

jr_000_0ba4:
    add hl, de
    nop
    ret


    ld d, a
    rst $10
    ld b, $00
    rst $10
    ld de, $c900
    ld e, a
    sub d
    jr c, jr_000_0bb9

    ld e, a
    rst $08
    adc [hl]
    cp e
    jr c, jr_000_0bbb

jr_000_0bb9:
    scf
    ret


jr_000_0bbb:
    or a
    ret


    push hl
    ld a, $0b
    rst $10
    ld b, $00
    rst $10
    inc de
    ei
    ret


    ld h, a
    ld a, $08
    rst $10
    ld b, $00
    rst $10
    add hl, bc
    ei
    ret


    ld l, a
    ld a, $09
    rst $10
    ld b, $00
    rst $10
    rst $38
    ld a, [$85c9]
    rst $10
    ld b, $00
    rst $10
    ld l, $00
    ret


    sub h
    jr nc, jr_000_0be7

    xor a

jr_000_0be7:
    push af
    ld hl, $ccbc
    ld a, [hl]
    xor $01
    ld [hl], a
    pop af
    pop hl
    ret


    push hl
    push de
    add a
    ld e, a
    rst $08
    adc [hl]
    cp e
    pop de
    pop hl
    ret


    push hl
    push de
    push bc
    ld e, a
    ld d, $00
    rst $08
    adc [hl]
    ld l, a
    ld h, $00
    rst $08
    adc c
    ld a, h
    pop bc
    pop de
    pop hl
    ret


    push hl
    push de
    push bc
    ld e, a
    ld d, $00
    rst $08
    adc [hl]
    ld l, a
    rst $08
    adc [hl]
    add l
    rra
    ld l, a
    ld h, $00
    ld bc, $0080
    add hl, bc
    rst $08
    adc c
    ld a, h
    pop bc
    pop de
    pop hl
    ret


    ld a, $20
    rst $08
    or e
    ld h, $04
    rst $08
    jp z, $e43e

    ldh [$9c], a
    ldh [$9d], a
    ret


    ld hl, $cc9e
    ld de, $c004
    rst $10
    ld b, $00
    rst $10
    rst $30
    ld a, [$11c9]
    ld c, $c5
    ld hl, $ccac
    rst $10
    ld b, $00
    rst $10
    ld [$c9fa], a
    rst $10
    ld c, $fa
    pop hl
    rst $08
    ld e, h
    rst $10
    ld b, $00
    rst $10
    call nz, $c9fa
    ld a, [$cca3]
    ld hl, $8800
    rst $10
    ld b, $00
    rst $10
    adc a
    nop
    ret


    ld a, [$ccb1]
    ld hl, $8890
    rst $10
    ld b, $00
    rst $10
    add d
    nop
    ret


    ld a, $80
    ld hl, $0301
    ld bc, $0303
    ld de, $0406
    rst $08
    ld e, c
    rst $10
    ld b, $00
    rst $10
    inc b
    nop
    ret


    ret


    ld de, $0000
    ld a, $78
    add d
    ld d, a
    ld a, $40
    add e
    ld e, a
    xor a
    rst $10
    dec d
    nop
    pop hl
    rst $08
    ld h, b
    ret


    rst $08
    adc [hl]
    and $02
    sub $01
    ld d, a
    rst $08
    adc [hl]
    and $02
    sub $01
    ld e, a
    ret


    add hl, bc
    nop
    nop
    adc a
    jr nz, jr_000_0cbe

    nop
    sub b
    jr nz, jr_000_0cca

    nop
    sub c
    jr nz, jr_000_0cbe

jr_000_0cbe:
    ld [$208c], sp
    ld [$8d08], sp
    jr nz, jr_000_0cd6

    ld [$208e], sp
    nop

jr_000_0cca:
    db $10
    adc c
    jr nz, jr_000_0cd6

    db $10
    adc d
    jr nz, jr_000_0ce2

    db $10
    adc e
    jr nz, @-$27

jr_000_0cd6:
    ld b, $00
    rst $10
    stop
    ret


    rst $08
    inc de
    ret


    rst $10
    ld b, $00

jr_000_0ce2:
    rst $10
    ld b, $00
    ret


    rst $08
    inc d
    ret


    push af
    ld a, [$0014]
    cp $01
    jr z, jr_000_0cf6

    cp $fe
    jr z, jr_000_0cf6

    pop af

jr_000_0cf6:
    pop af
    ret


    push hl
    ld e, a
    ld d, $00
    ld hl, $0090
    rst $08
    adc c
    rst $10
    dec c
    nop
    pop de
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld bc, $0090
    rst $08
    ld [bc], a
    ret


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0201
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld hl, $6021
    ld h, b
    ld h, b
    ld h, b
    and b
    ldh [$a0], a
    ldh [$90], a
    ldh a, [$89]
    ld sp, hl
    ld b, [hl]
    ld a, a
    ld h, d
    ld e, a
    ld a, [hl-]
    daa
    rra
    add hl, de
    rlca
    rlca
    ld bc, $0101
    ld bc, $0000
    rrca
    rrca
    inc a
    ccf
    ld a, [hl]
    ld b, e
    rst $18
    cp c
    rst $38
    push hl
    cp a
    db $eb
    rst $18
    ccf
    ldh [$5f], a
    db $fc
    ccf
    ld a, a
    add e
    sub a
    db $ec
    ld l, a
    ld [hl], e
    ld c, a
    ld [hl], b
    sbc a
    ldh [$9f], a
    ld hl, sp-$79
    db $fc
    ld [hl], e
    cp $3b
    xor $1f
    db $f4
    rra
    ldh a, [rIE]
    ld sp, hl
    rst $38
    ld d, a
    db $fd
    db $fd

jr_000_0d6d:
    nop
    nop
    nop
    nop
    ret nz

    ret nz

jr_000_0d73:
    jr c, jr_000_0d6d

    inc a
    db $e4
    inc a
    db $ec
    jr c, jr_000_0d73

    db $10
    ldh a, [$ce]
    cp $e7
    cp l
    ld bc, $feff
    cp $f8
    ld [$f0f0], sp
    ret nz

    ld b, b
    ldh [rNR41], a
    ld hl, sp+$38
    db $e4
    inc a
    db $f4
    inc a
    ret c

    ld a, b
    sub b
    ldh a, [$f8]
    ld hl, sp-$04
    ld d, h
    db $fc
    db $fc
    nop
    nop
    ld hl, sp-$08
    add a
    rst $38
    ld [hl], c
    ld a, a
    ld c, b
    ld a, a
    inc [hl]
    cpl
    jr nz, jr_000_0dea

    ld d, a
    ld a, a
    ld b, a
    ld a, h
    add l
    cp $83
    rst $38
    add b
    rst $38
    ld b, b
    ld a, a
    inc a
    ccf
    ld b, e
    ld a, a
    add b
    rst $38
    sbc e
    rst $38
    adc h
    rst $38
    ld b, b
    ld a, a
    jr nc, jr_000_0e04

    rra
    rra
    ld [hl], e
    ld a, a
    add b
    rst $38
    sub d
    rst $38
    ld a, a
    ld a, a
    nop
    nop
    rst $38
    rst $38
    add b
    rst $38
    add b
    rst $38
    inc c
    rst $38
    inc b
    rst $38
    ld hl, sp-$01
    ld hl, sp-$31
    pop af
    rra
    db $e3
    db $fc
    ld e, $f1
    cpl
    pop af
    ld l, $f1
    sub a

jr_000_0dea:
    ld hl, sp+$6f
    rst $38
    db $db
    db $fc
    and a
    rst $38
    inc a
    db $e3
    ld a, $e1
    cp $ff
    add h
    add a
    ld c, b
    rst $08
    ld b, a
    rst $00
    add b
    add b
    db $fc
    db $fc
    inc b
    db $fc
    ret z

jr_000_0e04:
    ld hl, sp+$28
    ld hl, sp+$10
    ldh a, [$88]
    ld hl, sp-$08
    ld hl, sp+$78
    ret z

    db $fc
    db $fc
    ld a, [$fd06]
    rst $38
    xor a
    rst $18
    db $fd
    rst $38
    or d
    ld a, [hl]
    call z, $eafc
    ld e, $f1
    rst $38
    ld hl, $31ff
    rst $38
    ld c, [hl]
    adc $fe
    cp $01
    rst $38
    dec d
    rst $38
    cp $fe
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    inc bc
    inc b
    rlca
    inc bc
    inc bc
    inc b
    rlca
    ld [$100f], sp
    rra
    ld [de], a
    rra
    inc h
    ccf
    inc h
    ccf
    ld b, h
    ld a, a
    ld b, d
    ld a, a
    ld b, c
    ld a, a
    ld b, b
    ld a, a
    ld c, c
    ld a, [hl]
    ld c, a
    ld a, h
    daa
    ccf

jr_000_0e55:
    ldh [rIE], a
    db $10
    rra
    ld c, h
    ld c, a
    ccf
    inc sp
    rra
    rra
    ld [$1c08], sp
    inc d
    rst $38
    rst $20
    jr @+$01

    nop
    rst $38
    jp $03fc


    db $fc
    nop
    rst $38
    ld [hl], e
    rst $38
    rlca
    db $fc
    rst $08
    jr c, jr_000_0e55

    ld [hl-], a
    rra
    ld a, [c]
    rrca
    ld hl, sp-$09
    rst $38
    nop
    rst $38
    add e
    db $fc
    add c
    rst $38
    nop
    rst $38
    ld bc, $00ff
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    nop
    nop
    ld b, b
    ld b, b
    ldh [$a0], a
    ld hl, sp-$68
    ld h, [hl]
    cp $01
    rst $38
    sbc [hl]
    ld a, [hl]
    adc b
    ld a, b
    inc b
    db $fc
    call c, $e4fc
    inc a
    or $1a
    cp $4a
    ld a, [$f44e]
    inc e
    add sp, -$08
    inc b
    db $fc
    ld [c], a
    ld e, $f2
    ld c, [hl]
    sub d
    xor $42
    cp $04
    db $fc
    add hl, de
    ld sp, hl
    cp $e6
    db $fc
    db $fc
    ld bc, $0201
    inc bc
    inc b
    rlca
    ld [$100f], sp
    rra
    ld hl, $213f
    ccf
    ld [hl+], a
    ccf
    inc e
    rra
    ld [$180f], sp
    rra
    db $10
    rra
    db $10
    rra
    db $10
    rra
    db $10
    rra
    ld [hl-], a
    ccf
    ld d, d
    ld a, a
    adc c
    rst $38
    adc b
    rst $38
    add h
    rst $38
    ld b, a
    ld a, a
    dec sp
    dec sp
    dec b
    ld b, $07
    rlca
    ret nz

    ret nz

    cpl
    rst $28
    db $10
    rst $38
    ld [$9cff], sp
    rst $30
    adc b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    inc b
    rst $38
    inc bc
    rst $38
    ld c, l
    di
    ld e, a
    pop hl
    ld a, a
    pop bc
    ld a, $e1
    ccf
    ldh [$3f], a
    ldh [$df], a
    ldh [rIF], a
    ldh a, [$03]
    db $fc
    ld hl, sp-$01
    cp $07
    xor h
    ld d, a
    rst $38
    rst $38
    nop
    nop
    sbc b
    sbc b
    ld a, h
    db $fc
    ld c, $fe
    ld d, $fe
    ccf
    rst $28
    rla
    rst $38
    rlca
    rst $38
    inc bc
    rst $38
    ld b, d
    cp $ba
    cp $d4
    inc a
    db $fc
    ld d, h
    ld a, [$7d56]
    db $d3
    cpl
    pop af
    rst $38
    ld bc, $03fd
    cp $02
    db $f4
    inc c
    ld a, $fe
    ld a, a
    pop hl
    ei
    dec b
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    ld [bc], a
    ld [bc], a
    ld bc, $0301
    inc bc
    inc bc
    inc bc
    ld bc, $0e01
    rrca
    inc de
    ld e, $35
    ld l, $15
    ld e, $0d
    ld c, $06
    rlca
    inc bc
    inc bc
    ld c, $0f
    rra
    inc de
    dec a
    ld h, $33
    inc l
    ccf
    ld hl, $3f3f
    inc hl
    ccf
    ld b, e
    ld a, a
    sbc a
    rst $38
    and $e6
    ld bc, $0001
    nop
    ld b, c
    ld b, c
    adc a
    adc a
    ldh a, [$7f]
    rst $18
    ldh [rIE], a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $01
    ld a, a
    add b
    pop bc
    rst $38
    ld a, [hl]
    rst $38
    ldh [rIE], a
    sbc a
    rst $38
    sub $b5
    rst $38
    inc a

jr_000_0fa7:
    rst $38
    ld a, $73
    sbc a
    add d
    cp $7c
    ld a, h
    jr nz, jr_000_0fd1

    ret nz

    ret nz

    ldh [$a0], a
    ldh [$e0], a
    ret nz

    ret nz

    cp h
    ld a, h
    or $1a
    ld [$fa1e], a
    ld c, $f4
    inc c
    db $f4
    inc c
    or h
    ld c, h
    ld [$bb1e], a
    ld a, l
    rst $10
    db $fd
    daa
    ld sp, hl
    sbc $de

jr_000_0fd1:
    ld h, b
    and b
    or b
    ret nc

    jr nc, jr_000_0fa7

    ldh a, [rNR10]
    ldh [$e0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add hl, sp
    add hl, sp
    ld b, [hl]
    ld a, a
    ld a, [$eee7]
    or e
    rst $38
    ld [c], a
    cp e
    add $45
    ld a, [hl]
    ld a, h
    ld a, a
    ld a, h
    ld c, a
    ld a, d
    ld a, e
    ld a, a
    ld h, a
    sbc a
    di
    adc [hl]
    rst $38
    ld b, l
    ld a, [hl]
    ld b, a
    ld a, h
    scf
    inc a
    dec a
    ld a, $3f
    inc sp
    ld a, a
    ld a, a
    sbc a
    ldh a, [$90]
    rst $38
    ld a, a
    ld a, a
    ccf
    ccf
    and $f9
    ccf
    rst $38
    ccf
    ld a, [c]
    ld a, a
    cp a
    and $39
    and $39
    rst $38
    rra
    ld a, [$ff07]
    ld [bc], a
    ccf
    jp nz, $ff07

    rrca
    ld sp, hl
    rst $38
    rst $38
    ld c, c
    rst $38
    cp a
    ld l, c
    rst $38
    add hl, sp
    rst $28
    add hl, hl
    xor a
    ld l, a
    db $e3
    ld [c], a
    di
    di
    db $f4
    rla
    inc d
    rst $30
    di
    di
    add b
    add b
    ret nz

    ret nz

    db $fc
    db $fc
    or d
    ld a, [hl]
    sbc l
    di
    rst $18
    or c
    rst $28
    sbc c
    ld l, l
    sbc e
    ld [$fe1e], a
    ld e, $de
    ld [hl-], a
    ld a, $fe
    ld a, c
    rst $28
    ld sp, hl
    rst $38
    dec h
    rst $38
    db $db
    ld h, a
    rst $38
    jp $c27e


    jp c, $fc66

    inc a
    cp $fe
    rst $38
    add c
    add c
    rst $38
    rst $38
    rst $38
    db $10
    db $10
    jr z, jr_000_10ab

    add hl, hl
    add hl, sp
    ccf
    cpl
    jr c, jr_000_10a0

    rra
    rra
    ld bc, $7c01
    ld a, h
    sbc a
    db $e3
    add a
    ld a, [$fe83]
    ld a, l
    ld a, [hl]
    ld l, $3f
    ld a, e
    ld a, e
    sbc $e7
    cp a
    jp $c6bb


    ld a, a
    ld a, h
    ld e, a
    ld h, h
    ld e, a
    ld h, a
    dec a
    ccf
    rra
    rra
    ccf
    jr nz, jr_000_10dd

    ccf
    ld a, [hl]

jr_000_10a0:
    ld a, [hl]
    sbc e
    rst $38
    ld a, $cb
    rst $38
    adc [hl]
    ld [hl], l
    ei
    rst $18
    cp a

jr_000_10ab:
    ld [hl], l
    adc [hl]
    sbc [hl]
    push hl
    rst $38
    rst $38
    cp a
    jp nz, $c2bf

    cp a
    jp nz, $ff8f

    rst $30
    ld sp, hl
    sub a
    ld sp, hl
    rst $30
    ld sp, hl
    rst $30
    ld e, c
    rst $38
    ld a, a
    ret z

    ld c, a
    add a
    add a
    inc bc
    inc bc
    add d
    add e
    rst $00
    ld b, h
    rst $00
    rst $00
    ld [$1408], sp
    inc e
    sub h
    sbc h
    db $fc
    db $f4
    adc h
    db $f4
    ld hl, sp-$08
    add b
    add b

jr_000_10dd:
    cp $fe
    rst $30
    ld sp, hl
    jp nc, $d13d

    ccf
    sbc $3e
    inc d
    db $fc
    db $fc
    db $fc
    ld e, d
    and $ed
    di
    db $fd
    inc de
    cp $1e
    cp $12
    xor $f2
    db $fc
    sbc h
    ld [hl], b
    ldh a, [$fc]
    inc c
    db $fc
    db $fc
    nop
    nop
    nop
    nop
    inc bc
    inc bc
    inc b
    rlca
    ld [$100f], sp
    rra
    db $10
    rra
    ld hl, $203f
    ccf
    ld b, b
    ld a, a
    ld b, b
    ld a, a
    ld b, b
    ld a, a
    ld b, b
    ld a, a
    ld b, b
    ld a, a
    jr nz, @+$41

    jr nz, jr_000_115e

    db $10
    rra
    rrca
    rrca
    inc de
    inc e
    inc de
    inc e
    dec bc
    ld c, $0b
    ld c, $06
    rlca
    ld bc, $3f01
    ccf
    ret nz

    rst $38
    ld c, $f1
    rlca
    ld hl, sp+$03
    db $fc
    inc bc
    db $fc
    ld bc, $60fe
    rst $38
    ldh a, [$df]
    ldh a, [$df]
    pop af
    rst $38
    ld h, e
    cp $07
    db $fc
    dec bc
    db $fd
    rrca
    cp $3b
    db $fc
    db $dd
    and $7f
    add e
    rst $38
    nop
    rst $38
    ld hl, $52de
    sbc $52
    sub $5a
    adc h

jr_000_115e:
    adc h
    add b
    add b
    ld h, b
    ldh [rNR10], a
    ldh a, [$88]
    ld a, b
    call nz, $c43c
    inc a
    add d
    ld a, [hl]
    ld e, d
    cp $3e
    or $3d
    rst $30
    cp l
    rst $38
    reti


    ld a, a
    pop hl
    ccf
    pop hl
    cp a
    pop hl
    ld a, a
    ld [c], a
    ld a, $f6
    ld e, [hl]
    db $fc
    adc h
    ld hl, sp+$08
    ld hl, sp+$08
    ld hl, sp-$78
    ldh a, [$90]
    ldh a, [$90]
    ld h, b
    ld h, b
    ld b, $06
    add hl, bc
    rrca
    rla
    add hl, de
    dec hl
    dec [hl]
    ld d, d

jr_000_1198:
    ld l, l
    and c
    sbc $41
    cp [hl]
    add l
    ld a, d

jr_000_119f:
    jr jr_000_1198

    jr nc, @+$71

    ld h, $1d
    inc c
    dec sp
    sub e
    rlca
    call c, $6e93
    ld c, a
    inc a
    inc hl
    rra
    rra
    ld b, $01
    rra
    rlca
    ld a, c
    jr jr_000_119f

    ld h, c
    adc [hl]
    add [hl]
    jr jr_000_11c5

    db $10
    db $10
    db $10
    db $10
    ld de, $5b11
    ld d, d

jr_000_11c5:
    cpl
    ld a, [hl+]
    sbc d
    sbc a
    cp e
    cp h
    ld a, l
    and $7e
    db $db

Jump_000_11cf:
    cp $5b
    ld a, a
    rst $20
    dec e
    cp $03
    rst $38
    add b
    rst $38
    inc bc
    db $fc
    ld bc, $00fe
    rst $38
    nop
    rst $38
    nop
    rst $38
    add b
    rst $38
    ld h, b
    rst $38
    sbc a
    sbc a
    jr c, jr_000_1223

    inc d
    inc d
    nop
    nop
    jr jr_000_1209

    inc l
    inc [hl]
    inc [hl]
    inc l
    ld d, d
    ld l, [hl]
    jp nz, $f9fe

    ld a, a
    db $dd
    scf
    rrca
    ei
    rrca
    ei
    cp $fe
    or $0e
    ld a, [$0cfe]
    db $fc

jr_000_1209:
    db $f4
    inc c
    db $e4
    inc e
    inc b
    db $fc
    inc b
    db $fc
    ld [$10f8], sp
    ldh a, [$60]
    ldh [$c0], a
    ret nz

    ldh [$e0], a
    ld d, b
    ld d, b
    nop
    nop
    nop
    inc e
    inc e
    ld [hl+], a

jr_000_1223:
    ld a, $41
    ld a, $41
    ccf
    ld b, b
    rra
    jr nz, jr_000_123b

    db $10
    ld [bc], a
    dec c
    ld bc, $0002
    ld bc, $0000
    nop
    nop
    ld bc, $0707
    add hl, sp

jr_000_123b:
    dec a
    ld b, e
    ccf
    ld b, b
    jr c, @+$49

    nop
    jr c, jr_000_1244

jr_000_1244:
    nop
    nop
    nop
    daa
    daa
    dec e
    ld a, [de]
    rlca
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add c
    add b
    ld b, c
    add c
    ld b, d
    rst $08
    cpl
    db $76
    cp c
    ld d, a
    rst $28
    adc d
    db $fd
    rst $30
    sbc b
    ld a, a
    sbc a
    ccf
    jp nc, $b84f

    rst $38
    add a
    ld a, h
    ld d, e
    ld d, e
    ld a, h
    ld a, a
    ld e, b
    and h
    rst $38
    ld c, [hl]
    di
    rst $00

jr_000_127a:
    ld a, e
    db $e4
    db $fc
    jr jr_000_1297

    nop
    jr nc, @+$32

    ld c, b

jr_000_1283:
    ld a, b
    add h
    ld a, b
    add h
    ld hl, sp+$04
    ldh a, [$08]
    and b
    ld d, b
    ld b, b
    and b
    ret nz

    ret nz

    ld [hl], b
    ldh a, [$88]
    ld hl, sp+$54
    db $ec

jr_000_1297:
    db $fc
    db $fc
    db $fc
    ld d, h
    ld hl, sp-$38
    ldh a, [$b0]
    ldh [$e0], a
    jr nz, jr_000_1283

    and b
    ld h, b
    ld d, b
    ldh a, [$d8]
    add sp, -$38
    ld hl, sp-$50
    ldh a, [$60]
    ld h, b
    nop
    nop
    ld bc, $0301
    inc bc
    inc bc
    ld [bc], a
    ld bc, $0001
    nop
    inc b
    inc b
    ld a, [bc]
    ld c, $15
    dec de
    ld e, $11
    ld a, [de]
    dec e
    ld [hl], $2f
    dec a
    inc hl
    cpl
    jr nc, @+$75

    ld e, h
    ld a, h
    ld c, a
    cp e
    rst $00
    cp [hl]
    pop bc
    sbc h
    db $e3
    add c
    rst $38
    ld b, [hl]
    ld a, a
    jr c, @+$41

    ld e, a
    ld h, b
    ccf
    ccf
    ldh [$e0], a
    ldh a, [rNR10]
    ldh a, [$d0]
    ldh a, [rNR10]
    ret nc

    jr nc, jr_000_127a

    ldh a, [rOBP0]
    ld a, b
    ld b, h
    ld a, h
    inc hl
    ccf
    and b
    cp a
    and b
    cp a
    ld h, [hl]
    ld sp, hl
    rst $28
    or $3f
    db $eb
    ld e, a
    ld [$ef5b], a
    sbc a
    rst $28
    sbc e
    db $ec
    sbc e
    db $ec
    dec c
    or $06
    ei
    ld bc, $feff
    ld bc, $ffff
    inc c
    inc c
    ld e, $12
    cpl
    ld sp, $273f
    cpl
    ld sp, $3e26
    ld c, b
    ld a, b
    ld d, b
    ld [hl], b
    sub b
    ldh a, [$08]
    ld hl, sp+$04
    db $fc
    inc [hl]
    call z, $36fa
    cp $ea
    cp $aa
    db $ed
    ei
    ld sp, hl
    rst $30
    ld sp, hl
    or a
    pop af
    ld e, a
    ld a, [c]
    ld e, [hl]
    ld a, [c]
    ld e, $54
    cp h
    ld [$fef6], a
    cp $00
    nop
    ld a, c
    ld a, c
    add l
    db $fd
    ld h, a
    ld a, a
    ld [hl+], a
    ccf
    db $10
    rra
    inc a
    ccf
    ld a, h
    ld b, a
    db $e4
    sbc a
    call c, $b2a7
    rst $08
    ld l, l
    ld [hl], e
    ld d, $19
    dec e
    ld e, $1f
    rra
    rra
    rra
    rra
    rra
    ld a, $3f
    ccf
    ccf
    ccf
    ccf
    ld a, [hl]
    ld a, a
    ld a, e
    ld a, h
    db $dd
    db $e3
    rst $38
    rst $38
    ccf

jr_000_1370:
    ccf
    ret nz

    rst $38
    ldh a, [$3f]
    ret c

    ccf
    xor h
    rst $30
    ld a, h
    rst $38
    add b
    rst $38
    jr nc, @+$01

    jr c, jr_000_1370

    scf
    rst $28
    ld l, $f3
    sbc h
    rst $38
    ld [hl], b
    rst $38
    sbc $3f
    cp $f5
    db $fd
    or $fe
    push af
    db $fd
    xor $3a
    db $fd
    call $fafa
    ld a, l
    call nz, $87ff
    rst $38
    ld hl, sp-$08
    ld c, $0e
    jp nc, $2cde

    db $fc
    ld e, b
    add sp, $78
    ld hl, sp+$0c
    db $fc
    add [hl]
    cp $ed
    rst $38
    ld bc, $82ff
    cp $7e
    cp $0e
    ld a, [$faf6]
    ld e, h
    db $e4
    cp a
    ld a, a
    ld a, a
    cp l
    cp a
    ld a, l
    ld e, a
    cp e
    cp d
    ld e, [hl]
    ld c, [hl]
    cp [hl]
    and c
    ld a, a
    pop bc
    rst $38
    ld a, $3e
    nop
    nop
    ld hl, sp-$08
    push af
    adc l
    ld [hl], a
    ld c, [hl]
    ld l, e
    ld e, h
    ld sp, $203e
    ccf
    ld [hl+], a
    dec a
    ld b, e
    ld a, h
    ld [hl], c
    ld c, [hl]
    cp c
    add $f8
    add a
    db $fd
    add e
    db $fd
    add e
    cp a
    pop bc
    ld a, a
    ld b, b
    ld e, a
    ld h, b
    cpl
    jr nc, jr_000_1409

    jr jr_000_1403

    inc c
    rrca
    ld [$3837], sp
    ld e, a
    ld h, b
    cp a
    ret nz

    rst $38
    rst $38
    ld bc, $fe01
    rst $38

jr_000_1403:
    dec de
    rst $20
    adc h
    ld [hl], e
    add d
    ld a, l

jr_000_1409:
    ld b, b
    cp a
    rrca
    rst $38
    inc sp
    db $fc
    rst $18
    ld h, b
    or [hl]
    rst $08
    rst $28
    sbc c
    ld a, e
    sbc l
    rst $38
    rra

jr_000_1419:
    rst $28
    rla
    or $0f
    rst $38
    nop
    cp a
    ld h, b
    rst $38
    ld b, b
    rst $18
    ld h, b
    xor a
    ld [hl], b
    cp e
    ld a, h
    rst $00
    ld c, a
    ld b, c
    pop bc
    add c
    add c
    ldh a, [$f0]
    ldh a, [rNR10]
    ld h, b
    and b
    ret nz

    ret nz

    jr nz, jr_000_1419

    ld h, b
    and b
    ldh a, [$f0]
    inc c
    db $fc
    sbc [hl]
    ld h, d
    sub $2e
    ld l, a
    sbc c
    ei
    sbc l
    rst $38
    sbc a
    ld l, a
    sub a
    rst $30
    rrca
    rst $38
    ld bc, $fb77
    rst $38
    reti


    ld [hl], a
    ld sp, hl
    xor [hl]
    ld [hl], d
    db $fc
    inc h
    jp c, $7dfe

    add e
    rst $38
    rst $38
    inc bc
    inc bc
    rlca
    inc b
    inc c
    dec bc
    ld [de], a
    dec e
    rra
    db $10
    cpl
    jr nc, jr_000_14a7

    inc h
    ld e, e
    ld h, h
    ld a, a
    ld b, h
    db $76
    ld c, l
    dec sp
    ccf
    ld e, a
    ld [hl], b
    ld e, l
    ld [hl], d
    sbc l
    di
    xor a
    reti


    xor l
    rst $18
    ld d, a
    ld l, a
    ld b, a
    ld a, a
    ld [hl+], a
    ld a, $12
    ld e, $12
    ld e, $24
    inc a
    jr jr_000_14a5

    nop
    nop
    add b
    add b
    ret nz

    ld b, b
    ldh [rNR41], a
    ld [hl], d
    sub d
    ld [hl-], a
    jp nc, $cf3d

    ld e, h
    xor a
    ld e, l
    and [hl]
    call $deb6
    cp a
    ld [hl], b
    rst $38

jr_000_14a5:
    ret


    ccf

jr_000_14a7:
    db $eb
    ld e, $e5
    ld e, $f3
    inc e
    ei
    adc h
    ld l, a
    sbc h
    dec a
    cp $c4
    rst $00
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld bc, $0001
    nop
    nop
    nop
    jr nc, jr_000_14f1

    ld a, b
    ld c, b
    xor h
    call nc, $b4cc
    sub $aa
    ld a, [hl]
    add d
    rst $38
    and c
    cp a
    pop hl
    ld e, a
    push af
    db $76
    sbc $1c
    db $fc
    inc [hl]
    db $ec
    adc b
    ld hl, sp-$61
    rst $38
    adc [hl]
    ld [hl], d
    db $fc
    inc b
    db $fc
    sub h
    db $f4
    inc c
    ld hl, sp+$08
    ld hl, sp+$08
    ld l, b
    sbc b
    db $10
    ldh a, [$e0]
    ldh [rP1], a
    nop
    nop
    nop

jr_000_14f1:
    ld bc, $0201
    inc bc
    inc bc
    inc bc
    rlca
    inc b
    ld [$080f], sp
    rrca
    ccf
    ccf
    ld e, [hl]
    ld h, e
    ld e, [hl]
    ld h, e
    ld e, [hl]
    ld h, e
    ld a, $3f
    scf
    ccf
    cpl
    dec a
    cpl
    jr c, jr_000_158d

    ld a, b
    rst $38
    ret z

    rst $38
    and a
    cp a
    ret nc

    rst $18
    add sp, -$41
    rst $38
    add a
    db $fc
    add h
    rst $38
    ld a, a
    ld a, a
    ld [hl], a
    ld [hl], a
    sbc [hl]
    rst $38
    ld a, a
    adc c
    rst $30
    adc a
    rst $38
    ld b, h
    rst $38
    daa
    ld a, a
    and b
    rst $38
    rst $38
    nop
    rst $38
    ld bc, $01ff
    rst $38
    nop
    rst $38
    ld h, e
    rst $38
    rst $38
    rst $38
    add [hl]
    rst $38
    sbc a
    and $9f
    ldh [$ef], a
    ld [hl], b
    rst $38
    ccf
    push hl
    ld a, $e3
    rst $38
    ldh a, [$1f]
    db $10
    rst $38
    rst $28
    rst $28
    nop
    nop
    ret nz

    ret nz

    and b
    ld h, b
    ldh [$a0], a
    ret nc

    or b
    ret nc

jr_000_155a:
    or b
    ret nc

    jr nc, jr_000_155a

    db $fc
    ld a, [de]
    or $da
    db $76
    jp c, $1cf6

    db $fc
    jr c, @-$06

    db $fc
    db $f4
    ld a, $e2
    cp [hl]
    ld h, d
    cp [hl]
    ld h, d
    ld a, h
    db $fc
    cp $c2
    cp $82
    rst $38
    rst $38
    ld a, a
    pop bc
    ld b, c
    rst $38
    cp $fe
    ld bc, $3201
    inc sp
    inc h
    daa
    ld e, b
    ld a, a
    ld b, c
    ld a, a
    inc hl
    ccf
    ld e, $1f

jr_000_158d:
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld b, d
    ld b, e
    and d
    db $e3
    and l
    rst $20
    sbc c
    rst $38
    ld c, d
    ld a, [hl]
    ld b, d
    ld a, [hl]
    inc h
    inc a
    inc d
    inc e
    ld [de], a
    ld e, $11
    rra
    dec bc
    ld c, $09
    rrca
    inc b
    rlca
    inc bc
    inc bc
    nop
    nop
    rst $08
    rst $08
    jr nc, @+$01

    ld c, h
    rst $38
    cp [hl]
    jp $b97f


    rst $10
    ld l, h
    rst $10
    ld l, h
    rst $38
    cp $ff
    ld [hl], h
    or a
    ld a, e
    db $fd
    ld b, $7b
    adc h
    ld l, a
    sbc a

jr_000_15c9:
    cp e
    call z, $665d
    cpl
    inc sp
    ld a, a
    ld b, b
    di
    adc h

jr_000_15d3:
    ei
    ld a, $d5
    ld a, e
    rst $30
    jr c, jr_000_15c9

    sbc [hl]
    ld a, a
    pop bc

jr_000_15dd:
    rst $38
    rst $38
    ret nz

    ret nz

    jr nc, jr_000_15d3

    jr z, jr_000_15dd

    inc [hl]
    db $ec
    ld a, $ee
    or $da
    rst $30
    dec de
    rst $38
    rra
    rst $38
    dec de
    ld sp, hl
    rst $38
    jp hl


    rra
    db $76
    xor $fe
    cp $14
    db $ec
    ld [$f71e], a
    ld sp, hl
    rst $38
    ld bc, $0efe
    db $f4
    inc l
    ld hl, sp-$38
    rst $28
    rra
    rst $18
    ld sp, $ee6e
    add b
    add b

End: