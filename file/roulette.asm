; Disassembly of "roulette.gbf"

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
    db $72                     ; owner code

Title::
    dk "ルーレット"
Icon::
    INCBIN "gfx/roulette/icon.2bpp"

Points::
    dw $0064
Author::
    dp "つもり\n\n\n\n\n\n\n", 2
History::
    ds 11
    ds 11
    ds 11

Main::
    ldx de, @+$000f
    ld hl, $c600
    ld bc, $0036
    trap $02
    jx @+$06a1


    ld [$c612], a
    ld hl, $0000
    push hl
    pop af
    ld hl, $0000
    ld de, $0000
    ld bc, $0000
    trap $00
    push hl
    push de
    push hl
    push af
    ld hl, $c604
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    inc hl
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    inc hl
    ld [hl], c
    inc hl
    ld [hl], b
    pop hl
    ret


    ld h, h
    nop
    rst $38
    inc a

HeaderManufacturerCode::
    inc a
    ld e, d
    ld h, [hl]
    cp l

HeaderCGBFlag::
    jp $83fd


    db $fc
    ld sp, hl
    add a
    or c
    trap $42
    ld a, [hl]
    rst $28
    inc b
    db $ed
    rst $38
    rst $38
    sbc c
    db $db
    rst $20
    cp l
    rst $38
    ld d, d
    ld l, [hl]
    ccf
    db $fd
    inc l
    pop hl
    ld bc, $0301
    inc bc
    rlca
    ld b, $ff
    rrca
    ld [$101f], sp
    ccf
    jr nc, jr_000_01ea

    ld a, a
    or a
    ld b, b
    inc l
    db $10
    add b
    rst $38
    ld sp, $ff81
    add d
    ccf
    ld [hl-], a
    db $10
    ld sp, $7f42
    ld b, c
    ld a, a
    ld h, b
    ld a, a
    rst $38
    jr nc, jr_000_01c2

    db $10
    rra
    ld [$060f], sp
    rlca
    ld e, $21
    nop
    rra
    rst $20
    ld h, c
    rlca
    rlca
    rra
    inc e
    add hl, hl
    and a
    ld h, b
    ld [hl-], a
    add hl, de
    nop
    ld h, c
    ld h, c
    ld d, e
    ret nz

    rst $38
    jr nz, jr_000_01b2

    ld [hl], h
    ld [hl], a
    ld h, $62
    ccf
    ld l, l
    nop
    ld [hl], l
    add b
    ld b, b
    nop
    rrca
    add hl, hl
    ld e, c
    nop
    ld d, a
    rla

jr_000_01b1::
    add e

jr_000_01b2::
    rrca
    ld c, $3f
    jr c, jr_000_0229

    ld a, [hl]
    ld b, h
    rst $38
    call z, $12a9
    xor [hl]
    xor $61
    jr nc, jr_000_01b1

jr_000_01c2::
    inc bc
    cp $07
    ld l, l
    ld [$18ff], sp
    rst $38
    adc [hl]
    db $10
    jp nz, $c150

    cp a
    nop
    inc c
    rst $38
    ld b, $b9
    ld c, b
    ld h, c
    db $10
    ld a, a
    ld l, l
    ld h, b
    ld h, c
    ld bc, $73e1
    db $10
    and e
    dec c
    and c
    ld [$534d], sp
    jr nz, @+$23

    inc a
    ccf

jr_000_01ea::
    adc h
    inc bc
    ldh [$e3], a
    rst $38
    db $fc
    rra
    jp nc, $4062

    cp d
    rrca
    ld hl, sp-$3b
    ccf
    ldh [$30], a
    jr jr_000_025f

    db $d3
    nop
    db $fc
    nop
    ld a, a
    dec b
    inc de
    nop
    ld de, $10d2
    ld bc, $21c3
    ldh a, [rPCM12]
    ld b, b
    ld b, c
    push hl
    jr nc, jr_000_024e

    ei
    rst $28
    xor h
    di
    add hl, de
    ld h, b
    jp c, $21f0

    pushx @+$2c00
    rrca
    ld h, a
    ld a, [bc]
    rla
    add hl, de
    ld b, b
    cp h
    ld hl, sp+$06
    ld e, h
    or c

jr_000_0229::
    dec hl
    db $e4
    ld hl, $bbe0
    nop
    ld hl, sp+$1f
    ld bc, $5b16
    nop
    db $fd
    ld b, c
    ldh [rIF], a
    ld l, h
    rst $38
    inc b
    adc $10
    add hl, hl
    cp c
    cp l
    ld hl, $e10e
    ld e, $00
    db $10
    ld e, e
    jr c, @+$04

    add b
    jr @+$1b

    sub h

jr_000_024e::
    nop
    inc hl
    cp e
    nop
    add e
    jr jr_000_0286

    ld de, $18fe
    rst $30
    inc e
    ei
    ld c, $f9
    rrca
    inc bc

jr_000_025f::
    cp [hl]
    pop hl
    ld [hl], b
    ei
    db $e3
    rst $38
    cp $1f
    pop hl
    ld l, [hl]
    ld e, $36
    nop
    or l
    ld c, l
    add h
    rra
    rra
    db $e3
    cp $94
    inc b
    pop de
    ld b, b
    sub d
    dec d
    ld [$9fd1], sp
    ld bc, $dc1c
    rst $00
    ld bc, $708f
    ld h, h
    ld [hl], c
    pop hl

jr_000_0286::
    adc e
    ld a, a
    ldh a, [$8f]
    ld a, [hl]
    ret


    pop af
    rra
    ld h, $32
    db $dd
    jr nc, @-$5e

    dec d
    ld de, $faff
    ld a, h
    rst $38
    ld b, b
    rst $38
    ld a, b
    cp b
    ld de, $cc44
    rlca
    sbc a
    nop
    inc hl
    xor a
    ld h, l
    inc [hl]
    ld e, a
    nop
    ret nz

    ccf
    ldh [$dc], a
    rra
    ldh a, [$ef]
    db $e4
    rst $38
    ld [bc], a
    call nz, $d118
    ld d, $ef
    nop
    ret


    pushx @+$0641
    add h
    ld h, c
    cp $71
    ld [bc], a
    rst $38
    add [hl]
    rst $38
    add a
    ld a, b
    ret nz

    ld a, a
    ld h, b
    rst $18
    ldh a, [$38]
    pushx @+$fd06
    daa
    sbc [hl]
    ld bc, $4e86
    pop de
    dec hl
    add a
    call c, $f1b3
    ld d, $01
    daa
    dec b
    cp $ff
    ldh [rTAC], a
    rst $38
    ld [$0405], sp
    nop
    ld e, l
    call c, $7150
    db $e3
    jr nz, @+$01

    db $10
    dec b
    ld d, $d9
    sub $20
    ld b, $fb
    ld a, c
    ld [hl], c
    add e
    ld a, l
    inc c
    ei
    dec e
    nop
    dec [hl]
    db $ec
    ei
    rst $18
    jp Jump_000_033f


    cp $cf
    ld [bc], a
    ldh a, [$2f]
    ret nz

    ccf
    db $e4
    db $dd
    rrca
    ld b, b
    ld h, a
    and l
    nop
    and l
    add c
    nop
    nop
    add c
    rra
    jr nz, @-$5f

    sbc l
    nop
    sbc l
    sbc e
    nop
    sbc c
    ld h, l
    db $10
    ld b, c
    sbc b
    cp $ff
    inc d
    reti


    ld h, [hl]
    inc h
    ld h, [hl]
    jp c, $3fd1

    inc [hl]
    jr @+$27

    ld h, c
    inc c
    rst $30
    daa
    db $e4
    ld b, c
    ld b, $dd
    adc a
    ldh a, [$fa]
    nop

Jump_000_033f::
    ld c, [hl]
    ld l, h
    ld bc, $c0fe
    cp a
    ld a, a
    sub b
    sub d
    rla
    adc a
    dec e
    cp a
    jp c, $3020

    sub a
    ld c, a
    ld [hl+], a
    nop
    ld d, l
    ld d, a
    ld [bc], a
    call z, $2035
    scf
    dec de
    inc b
    add sp, -$19
    scf
    cp e

jr_000_0360::
    ld b, b
    db $f4
    db $fc
    rst $38
    inc bc
    add d
    jr nc, jr_000_0360

    rst $38
    xor [hl]
    rlca
    sbc d
    ei
    dec b
    ld d, $97
    rrca
    ld a, [c]
    add e
    ld l, a
    xor l
    ld [bc], a
    pop af
    cp $66
    inc bc
    db $fd
    cp $49
    ld b, b
    ret nc

    ld bc, $ff03
    rst $38
    inc b
    ret c

    ld d, c
    jr nz, jr_000_03f6

    ld l, [hl]
    ld l, $50
    cp [hl]
    add b
    db $76
    ld bc, $827f
    ld bc, $dc00

jr_000_0394::
    xor l
    ld bc, $0884
    ld e, e
    add hl, bc
    add hl, bc
    add d
    call nc, $0607
    dec a
    rlca
    jr nz, @-$20

    jr nc, jr_000_0394

    ret nc

    jp $317f


    sbc $5c
    inc hl
    rst $38
    jr nc, @+$01

    adc $f7
    add [hl]
    ld sp, hl
    ret nz

    ld a, a
    ldh a, [rIF]
    db $f4
    db $fc
    daa
    ret


    sub a
    inc a
    pop bc
    rra
    jr nz, jr_000_03d9

    rra
    adc a
    nop
    adc a
    ldh [$3f], a
    or a
    nop
    ld d, c
    ld c, a
    ld bc, $00f0
    nop
    ldh a, [$f0]
    ld a, [de]
    sbc l
    ld b, d
    rra
    add hl, de
    nop
    sbc h
    ld sp, hl

jr_000_03d9::
    add hl, bc
    ld e, h
    inc bc
    db $10
    rst $38
    ld h, b
    call $6403
    dec l
    ret z

    reti


    ld bc, $6e1c
    add e
    ld a, a
    add hl, sp
    ld [bc], a
    pop bc
    rst $38
    cp $e3
    ld e, $06
    ei
    inc e
    db $eb
    ld h, b

jr_000_03f6::
    and c
    cp a
    adc $07
    db $e3
    db $10
    db $e3
    reti


    nop
    pushx @+$0e0c

jr_000_0402:
    ld d, l
    inc d
    sbc l
    db $d3
    nop
    db $e3
    add hl, bc
    rst $38
    ld a, [de]
    add [hl]
    db $10
    ld [hl], b
    dec e
    ld a, [bc]
    rst $38
    dec bc
    ld e, c
    db $10
    pop bc

jr_000_0415::
    cp a
    ld [bc], a
    dec l
    xor a
    ld hl, sp-$1d
    db $10
    cp $05
    rrca
    ldh a, [$1f]
    ldh [rIF], a
    cp h
    ld bc, $c29c
    add [hl]
    sbc l
    adc a
    rst $38
    ld a, b
    rst $38
    sbc a
    ld c, $6c
    db $10
    inc bc
    ld bc, $0ffe
    pop af
    ld a, a
    ret


    adc a
    ld hl, sp+$3e
    ld [hl], $9d
    ret nz

    adc b
    db $10
    call nz, $92f7
    cp $f5
    nop
    call z, $7e40
    ld [de], a
    adc $c7
    ld [c], a
    inc b
    add d
    ld hl, sp+$2d
    dec l
    jr nz, jr_000_0415

    call nz, $f520
    ld [bc], a
    sbc d
    jr nc, jr_000_04a2

    sbc l
    add c
    ld d, [hl]

jr_000_045e::
    inc d
    push hl
    push af
    rlca
    ld e, $ff
    ldh [rNR22], a
    push bc
    ld [hl], e
    jr nz, @-$27

    add hl, de
    ld e, b
    db $10
    jr jr_000_045e

    jr c, @-$06

    rst $18
    ld [hl], b
    sbc a
    ldh a, [$3f]
    ld [hl], e
    db $eb
    ld c, $43
    ld c, a
    xor c
    nop
    ld a, a
    inc [hl]
    ccf
    jr nz, jr_000_0402

    ld a, a
    ldh [$1f], a
    add a
    ld hl, sp+$36
    ld a, e
    ld [$8b29], sp
    ld h, c
    ret nz

    ret nz

jr_000_048f::
    inc a
    ldh a, [$fc]
    jp $20ff


    cp h
    dec c
    ld [bc], a
    dec c
    cp c
    dec l
    ld hl, sp+$71
    rst $38
    rra
    cp $e1
    ld b, [hl]

jr_000_04a2::
    ld b, a
    jr nz, jr_000_04d7

    dec sp
    ld hl, $7de0
    ld a, h
    rst $38
    inc bc
    xor h
    jr nc, jr_000_04be

    cp $b8
    ld a, a
    db $d3
    add e
    rst $38
    inc b
    inc [hl]
    db $10
    ld c, c
    ld d, [hl]
    ld [bc], a
    ld [hl], b
    xor c
    inc bc

jr_000_04be::
    db $fc
    inc a
    rlca
    inc c
    ld sp, hl
    ld bc, $4982
    dec [hl]
    inc hl
    jr nz, jr_000_0513

    ccf
    db $fc
    inc d
    jr nc, jr_000_048f

    ld d, c
    rra
    adc l
    db $fc
    pop af
    ld a, [hl+]
    inc hl
    di

jr_000_04d7::
    nop
    ld b, $ff
    adc d
    ld a, [hl]
    ld d, d
    ld [hl-], a
    dec b
    pop bc
    ld b, b
    ld b, b
    or l
    ld [de], a
    add sp, -$3d
    ld h, e
    ldh [$fe], a
    add b
    add b
    ld [hl], b
    ldh a, [rNR32]
    db $fc
    ccf
    ld [hl-], a
    inc c
    dec d
    ld a, [hl+]
    sbc e
    ld c, l
    nop
    sub b
    ldh [$3f], a
    sub d
    nop
    sub d
    xor a
    ld hl, sp+$32
    inc bc
    ld [$18f4], sp
    rst $38
    db $10
    rst $38
    pop hl
    jr nc, @+$01

    ld h, b
    pushx @+$5290
    ld c, [hl]
    ld b, $80
    db $fc
    rst $20

jr_000_0513::
    inc e
    ldh a, [rSVBK]
    trap $06
    ld [hl], c
    ldh [$e0], a

jr_000_051b::
    ld hl, sp-$09
    jr c, jr_000_051b

    inc c
    cp $a7
    ld bc, $ff61
    and b
    ld b, e
    ld sp, $0c20
    db $10
    ld [hl], $99
    ld h, l
    sbc b
    ld h, $ff
    db $eb
    ld l, c
    rst $38
    add hl, hl
    ld c, [hl]
    scf
    db $76
    sbc [hl]
    add [hl]
    cp $c3
    db $fc
    ld a, h
    add hl, hl
    nop
    daa
    rst $00
    add b
    pop bc
    ldh [$60], a
    or $f0
    db $10
    ld hl, sp+$08
    dec hl

jr_000_054c::
    jr nz, jr_000_054c

    ld [bc], a
    ld a, l
    rlca
    and h
    inc de
    push hl
    and $21
    ld a, [hl]
    ld a, e
    db $10
    inc c
    db $fc
    ld [$f8f9], sp
    db $10
    ldh a, [$60]
    ldh [$c1], a
    dec e
    ld h, b
    rlca
    rst $20
    rlca
    rra
    jr @-$59

    ret


    ld b, l
    inc e
    inc e
    rst $38
    and b
    db $e3
    reti


    db $e3
    or c
    inc b
    ld l, e
    dec de
    nop
    dec hl
    dec de
    and b
    ld h, l
    and l
    jr jr_000_059f

    xor c
    add a
    or h
    rst $38
    cp l
    ld h, b
    ld [hl], b
    add a
    ldh a, [$93]
    push af
    ld [bc], a
    sbc l
    sbc l
    ld bc, $8e80
    sub h
    rst $38
    sbc d
    and c
    xor b
    xor a
    or [hl]
    cp l
    call nz, $f7cb
    jp nc, $dfd8

jr_000_059f::
    and $ff
    add b
    add h
    adc c
    rst $38
    adc a
    sub l
    sbc e
    and d
    xor c
    or b
    or a
    cp [hl]
    rst $38
    push bc
    call z, $d9d3
    ldh [$e7], a
    db $ec
    pop af
    rst $38
    add b
    add c
    add l
    adc d
    sub b
    sub [hl]
    sbc h
    and e
    rst $38
    xor d
    or c
    cp b
    cp a

jr_000_05c4::
    add $cd
    call nc, $ffda
    pop hl
    add sp, -$13
    ld a, [c]
    or $82
    add [hl]
    adc e
    rst $38
    or a
    or a
    sbc l
    and h
    xor e
    or d
    cp c
    ret nz

    rst $38
    rst $00
    adc $a4
    db $db
    ld [c], a
    ld [c], a
    xor $f3
    rst $38
    rst $30
    add e
    add a
    adc h
    sub c
    sub a
    sbc [hl]
    and l
    rst $38
    xor h
    or e
    cp d
    pop bc
    ret z

    trap $d5
    call c, $e3ff
    jp hl


    rst $28
    db $f4
    ld hl, sp-$80
    adc b
    adc l
    rst $38
    sub d
    sbc b
    sbc a
    and [hl]
    xor l
    or h
    cp e
    jp nz, $c9ff

    ret nc

    sub $dd
    db $e4
    ld [$f5f0], a
    ld a, a
    db $10
    ld hl, $9993
    and b
    and a
    xor [hl]
    or l
    cp h
    cp $c3
    jp z, $d7d1

    sbc $e5
    db $eb
    rst $38
    ld c, $c2
    ld [bc], a
    adc e
    xor d
    nop
    xor d
    ccf
    nop
    jr c, jr_000_05c4

    ld [de], a

jr_000_062f::
    xor $f8
    ld bc, $9cc0
    rrca
    nop
    ld c, $a3
    ld [de], a
    ld a, l
    adc d
    nop
    ld c, c
    ld [bc], a
    ld bc, $af00
    ld bc, $dd09
    nop
    ld [$48b4], sp
    nop
    ld b, b
    cp d
    ld hl, $8602
    nop
    ret nz

    xor l
    ld [bc], a
    xor c
    cp $00
    inc bc
    nop
    call $1bee
    nop
    jr jr_000_062f

    ld [de], a
    ret c

    nop
    ret nz

    ret c

    call Title
    sbc $23
    xor b
    sub d
    inc b
    ret nz

    ld hl, $d612
    nop
    db $10
    ldh a, [$90]
    adc e
    ld b, c
    inc b
    nop
    db $fc
    dec e
    jp hl


    inc b
    rst $00
    sbc $21
    ld [hl], $00
    jr nc, @+$10

    or b
    call c, $8001
    inc d
    ld hl, $000d
    inc c
    dec de
    xor b
    ld [hl-], a
    call c, Call_000_0924
    db $fc
    inc h
    nop
    jr nz, jr_000_06c1

    ld [hl+], a
    xor a
    ld b, $b1
    ld d, b
    dec h
    adc e
    cp $9c
    adc d
    ld d, $95
    ld a, [bc]
    ld h, e
    ld h, b
    ld b, e
    ld b, $6a
    dec b
    ld l, a
    ld e, e
    ld l, a
    ld a, a
    ld e, h
    ld d, b
    nop
    ld b, $08
    inc b
    ld a, [bc]
    ld [bc], a
    inc c
    rlca
    dec b
    add hl, bc
    inc bc
    dec bc
    ld bc, $5d4e
    ld l, [hl]
    ld a, a
    add c
    ld [hl], l

jr_000_06c1::
    ld h, e
    ld d, d
    ld b, c
    jr nc, jr_000_06ec

    add hl, hl
    inc a
    rla
    rla
    add hl, de
    jr nz, @+$2d

    ld sp, $3635
    inc [hl]
    jr nc, jr_000_06fa

    ld e, $19
    inc c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    jr nz, @+$22

    dec hl
    dec l
    dec hl
    dec l
    dec l
    dec hl
    dec l
    dec l
    dec hl
    dec l
    dec l
    dec hl
    dec l

jr_000_06ec::
    dec l
    dec hl
    dec c
    jr nz, jr_000_0711

    ld a, h
    jr nz, @+$7e

    jr nz, jr_000_0727

    ld a, h
    jr nz, jr_000_072d

    ld a, h

jr_000_06fa::
    jr nz, jr_000_0733

    ld a, h
    ld sp, $7c30
    dec c
    jr nz, @+$22

    ld a, h
    jr nz, jr_000_0731

    dec l
    dec l
    dec hl
    dec l
    dec l
    dec hl
    dec l
    dec l
    dec hl
    dec l
    dec l

jr_000_0711::
    dec hl
    dec c
    jr nz, jr_000_0735

    ld a, h
    jr nc, jr_000_0794

    jr nz, jr_000_074c

    ld a, h
    jr nz, jr_000_0752

    ld a, h
    jr nz, jr_000_0758

    ld a, h
    ld sp, $7c31
    dec c
    jr nz, @+$22

jr_000_0727::
    ld a, h
    jr nz, jr_000_0755

    dec l
    dec l
    dec hl

jr_000_072d::
    dec l
    dec l
    dec hl
    dec l

jr_000_0731::
    dec l
    dec hl

jr_000_0733::
    dec l
    dec l

jr_000_0735::
    dec hl
    dec c
    jr nz, jr_000_0759

    ld a, h
    jr nz, jr_000_07b8

    jr nz, jr_000_0771

    ld a, h
    jr nz, jr_000_0777

    ld a, h
    jr nz, jr_000_077d

    ld a, h
    ld sp, $7c32
    dec c
    jr nz, jr_000_076b

    dec hl

jr_000_074c::
    dec l
    dec hl
    dec l
    dec l
    dec hl
    dec l

jr_000_0752::
    dec l
    dec hl
    dec l

jr_000_0755::
    dec l
    dec hl
    dec l

jr_000_0758::
    dec l

jr_000_0759::
    dec hl
    dec c
    jr nz, jr_000_077d

    jr nz, jr_000_077f

    ld a, h
    jr nz, @-$02

    db $fd
    cp $20
    ld a, h
    jr nz, @-$05

    ld a, [$20fb]

jr_000_076b::
    ld a, h
    dec c
    jr nz, jr_000_078f

    jr nz, jr_000_0791

jr_000_0771::
    dec hl
    dec l
    dec l
    dec l
    dec l
    dec l

jr_000_0777::
    dec hl
    dec l
    dec l
    dec l
    dec l
    dec l

jr_000_077d::
    dec hl
    dec c

jr_000_077f::
    jr nz, jr_000_07a1

    jr nz, @+$4f

    ld c, a
    ld c, [hl]
    ld b, l
    ld e, c
    ld a, [hl-]
    dec c
    jr nz, @+$22

    jr nz, @+$44

    ld b, l
    ld d, h

jr_000_078f::
    jr nz, jr_000_07b1

jr_000_0791::
    ld a, [hl-]
    jr nz, @+$22

jr_000_0794::
    jr nz, jr_000_07b6

    jr nz, jr_000_07b8

    jr nz, jr_000_07ba

    jr nz, jr_000_07bc

    nop
    ld bc, $0000
    nop

jr_000_07a1::
    nop
    ld bc, $0000
    ld bc, $d700
    ld b, $00
    jx @+$0359


    ld hl, $0000

jr_000_07b1::
    push hl
    ld hl, $c64c
    pop de

jr_000_07b6::
    ld [hl], e
    inc hl

jr_000_07b8::
    ld [hl], d
    ld l, e

jr_000_07ba::
    ld h, d
    push hl

jr_000_07bc::
    ld hl, $c64a
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0000
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0000
    push hl
    ld hl, $c655
    pop de
    ld [hl], e
    ld hl, $0000
    push hl
    ld hl, $c65a
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0000
    push hl
    ld hl, $c65d
    pop de
    ld [hl], e
    jx @+$030e


    ld a, $b1
    call $c600
    ld hl, $c65a
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    inc de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $d8
    call $c600
    ld hl, $c605
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0004
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_081d

    jx @+$0007


jr_000_081d::
    jx @+$02e0


    ld hl, $c655
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0000
    pop de
    ld c, $06
    trap $84
    ld a, l
    or h
    jr nz, jr_000_0838

    jx @+$0119


jr_000_0838:
    ld hl, $c64c
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0014
    push hl
    ld hl, $c655
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0001
    pop de
    trap $85
    pop de
    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    pop de
    ld c, $06
    trap $84
    ld a, l
    or h
    jr nz, jr_000_0864

    jx @+$00de


jr_000_0864::
    ldx hl, @+$ff38
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, @+$fe57
    push hl
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    ldx hl, @+$fe34
    push hl
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c60d
    pop de
    ld [hl], e
    ld hl, $0000
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    ld a, $60
    call $c600
    ld hl, $002b
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    ld a, $14
    call $c600
    ld hl, $0000
    push hl
    ld hl, $c64c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c655
    ld e, [hl]
    ld d, $00
    dec de
    ld [hl], e
    ld hl, $c655
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_08d9

    inc hl

jr_000_08d9::
    ld a, l
    or h
    jr nz, jr_000_08e1

    jx @+$002c


jr_000_08e1::
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c646
    pop de
    ld [hl], e
    callx @+$063f
    ld hl, $0000
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    callx @+$0450
    jx @+$01f3


    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $000b
    pop de
    ld c, $06
    trap $84
    ld a, l
    or h
    jr nz, jr_000_0921

    jx @+$0012


jr_000_0921::
    ld hl, $0000

Call_000_0924::
    push hl
    ld hl, $c64a
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    jx @+$000e


    ld hl, $c64a
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    inc de
    ld [hl], e
    inc hl
    ld [hl], d
    jx @+$000e


    ld hl, $c64c
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    inc de
    ld [hl], e
    inc hl
    ld [hl], d
    jx @+$01af


    ld hl, $c605
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0001
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_0967

    jx @+$00a6


jr_000_0967::
    ld hl, $c7f2
    push hl
    ld hl, $c645
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    trap $89
    push hl
    ld hl, $c644
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    push hl
    ld hl, $0002
    pop de
    trap $89
    push hl
    ld hl, $0001
    pop de
    add hl, de
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0080
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_09a6

    inc hl

jr_000_09a6::
    ld a, l
    or h
    jr nz, jr_000_09ae

    jx @+$005b


jr_000_09ae::
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ldx hl, @+$f785
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    ld c, $07
    trap $84
    ld a, l
    or h
    jr nz, jr_000_09c9

    jx @+$0040


jr_000_09c9::
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_09d7

    inc hl

jr_000_09d7::
    ld a, l
    or h
    jr nz, jr_000_09df

    jx @+$000a


jr_000_09df::
    callx @+$0805
    ld hl, $c652
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    inc de
    ld [hl], e
    inc hl
    ld [hl], d
    callx @+$035e
    ld hl, $0002
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    ld a, $14
    call $c600
    jx @+$00f3


    ld hl, $c605
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0002
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_0a23

    jx @+$0027


jr_000_0a23::
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    jr nz, jr_000_0a31

    jx @+$0015


jr_000_0a31::
    ld hl, $0000
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    callx @+$0313
    jx @+$00b6


    ld hl, $c605
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0008
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_0a60

    jx @+$008a


jr_000_0a60::
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    jr nz, jr_000_0a6e

    jx @+$0078


jr_000_0a6e::
    ld hl, $000a
    push hl
    ld hl, $0000
    pop de
    ld [hl], e
    ldx hl, @+$f6c3
    push hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    ld e, l
    ld d, h
    pop hl
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0000
    push hl
    ld hl, $0000
    pop de
    ld [hl], e
    callx @+$02b3
    ld hl, $c65a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $8d
    call $c600
    ld a, $8e
    call $c600
    ld hl, $c609
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    push hl
    ld hl, $c655
    pop de
    ld [hl], e
    ld hl, $c655
    push hl
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $003c
    pop de
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld [hl], e
    jx @+$0016


    ld hl, $c605
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c649
    pop de
    ld [hl], e
    callx @+$07e5
    jx @+$fcf4


    ld a, $01
    call $c600
    ret


    ld hl, $0100
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c400
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c666
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $02
    call $c600
    ld hl, $c400
    push hl
    ld hl, $0000
    add hl, hl
    pop de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $1fff
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    push hl
    ld hl, $a000
    pop de
    add hl, de
    push hl
    ld hl, $c64a
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0002
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c64c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c64c
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0001
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_0b80

    jx @+$002d


jr_000_0b80::
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0004
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    push hl
    ld hl, $0005
    pop de
    add hl, de
    push hl
    ld hl, $f59b
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    jx @+$0008


    ld a, $01
    call $c600
    ld hl, $0020
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    ld a, $b3
    call $c600
    ld hl, $c400
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, @+$f574
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $62
    call $c600
    ld hl, $0020
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $8000
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $63
    call $c600
    ld hl, $07f0
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $8800
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $63
    call $c600
    ld hl, $008c
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c766
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $63
    call $c600
    ld hl, $010e
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c7f2
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $63
    call $c600
    ld hl, $0003
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    ld a, $b4
    call $c600
    ld hl, $0001
    push hl
    ld hl, $c645
    pop de
    ld [hl], e
    ld l, e
    ld h, $00
    push hl
    ld hl, $c644
    pop de
    ld [hl], e
    ldx hl, @+$fa6f
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $69
    call $c600
    ld hl, $0000
    push hl
    ld hl, $c658
    pop de
    ld [hl], e
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0007
    pop de
    ld c, $07
    trap $84
    ld a, l
    or h
    jr nz, jr_000_0c96

    jx @+$0071


jr_000_0c96::
    ld hl, $9800
    push hl
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0020
    pop de
    trap $89
    pop de
    add hl, de
    push hl
    ld hl, $c65e
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c766
    push hl
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0014
    pop de
    trap $89
    pop de
    add hl, de
    push hl
    ld hl, $c660
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0014
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c660
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c65e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $02
    call $c600
    ld hl, $c658
    ld e, [hl]
    ld d, $00
    inc de
    ld [hl], e
    jx @+$ff7e


    ldx hl, @+$fa98
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, @+$f9b7
    push hl
    ld hl, $0000
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    ldx hl, @+$f997
    push hl
    ld hl, $0000
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c60d
    pop de
    ld [hl], e
    ld hl, $0000
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    ld a, $60
    call $c600
    callx @+$017b
    callx @+$0004
    ret


    ld hl, $0010
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0009
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    ld a, $b8
    call $c600
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, @+$f3c5
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $a3
    call $c600
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $69
    call $c600
    ld hl, $c65c
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    jr nz, jr_000_0da7

    pushx @+$0018

jr_000_0da6::
    ret


jr_000_0da7::
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    jr nz, jr_000_0db5

    jx @+$000a


jr_000_0db5::
    ld hl, $0001
    jx @+$0006


    ld hl, $0000
    ld a, l
    or h
    jr nz, jr_000_0dc7

    jx @+$007a


jr_000_0dc7::
    ld hl, $0011
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $000d
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    ld a, $b8
    call $c600
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c65c
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $a3
    call $c600
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $69
    call $c600
    ld hl, $0011
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0010
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    ld a, $b8
    call $c600
    ld hl, $0058
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    ld a, $bb
    call $c600
    ld hl, $0001
    push hl
    ld hl, $c65d
    pop de
    ld [hl], e
    jx @+$0042


    ld hl, $c65d
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    jr nz, jr_000_0e4c

    jx @+$0034


jr_000_0e4c::
    ld hl, $0011
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0000
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    ld a, $b8
    call $c600
    ldx hl, @+$f925
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $69
    call $c600
    ld hl, $0000
    push hl
    ld hl, $c65d
    pop de
    ld [hl], e
    ld hl, $0011
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0009
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    ld a, $b8
    call $c600
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $a3
    call $c600
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $69
    call $c600
    ret


    ldx hl, @+$f8de
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c645
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0003
    pop de
    trap $86
    push hl
    ld hl, $0048
    pop de
    add hl, de
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    ld hl, $c644
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0003
    pop de
    trap $86
    push hl
    ld hl, $0018
    pop de
    add hl, de
    push hl
    ld hl, $c60d
    pop de
    ld [hl], e
    ld hl, $0001
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    ld a, $60
    call $c600
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    jr nz, jr_000_0f1d

    jx @+$0015


jr_000_0f1d::
    ld hl, $0000
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    callx @+$fe27
    ret


    ld hl, $0000
    push hl
    ld hl, $c657
    pop de
    ld [hl], e
    ld hl, $c662
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_0f47

    inc hl

jr_000_0f47::
    ld a, l
    or h
    jr nz, jr_000_0f4f

    jx @+$001f


jr_000_0f4f::
    ld hl, $0000
    push hl
    ld hl, $c647
    pop de
    ld [hl], e
    ld hl, $c646
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c646
    pop de
    ld [hl], e
    callx @+$0252
    ld hl, $0001
    push hl
    ld hl, $c658
    pop de
    ld [hl], e
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000d
    pop de
    ld c, $07
    trap $84
    ld a, l
    or h
    jr nz, jr_000_0f8b

    jx @+$005c


jr_000_0f8b::
    ld hl, $c662
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0001
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_0fa4

    jx @+$0022


jr_000_0fa4::
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c647
    pop de
    ld [hl], e
    ld hl, $c646
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c646
    pop de
    ld [hl], e
    callx @+$01fa
    ld hl, $c662
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0001
    pop de
    trap $85
    push hl
    ld hl, $c662
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c658
    ld e, [hl]
    ld d, $00
    inc de
    ld [hl], e
    jx @+$ff93


    ld hl, $c657
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    jr nz, jr_000_0ff2

    jx @+$00c2


jr_000_0ff2::
    ld hl, $000a
    push hl
    ld hl, $0000
    pop de
    ld [hl], e
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c65c
    ld l, [hl]
    ld h, $00
    pop de
    trap $89
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0000
    push hl
    ld hl, $c65c
    pop de
    ld [hl], e
    callx @+$fd33
    ld hl, $003c
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx @+$028c
    jx @+$0062


    ldx hl, @+$f103
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $752f
    pop de
    ld c, $02
    trap $84
    ld a, l
    or h
    jr nz, jr_000_104f

    jx @+$000e


jr_000_104f::
    ld hl, $0001
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c652
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    dec de
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, @+$f0d5
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    inc de
    ld [hl], e
    inc hl
    ld [hl], d
    callx @+$fcde
    ld hl, $0020
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    ld a, $14
    call $c600
    ld hl, $0005
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx @+$0229
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    jr z, jr_000_10a4

    jx @+$ff96


jr_000_10a4::
    ld hl, $0000
    push hl
    ld hl, $0000
    pop de
    ld [hl], e
    jx @+$010b


    ldx hl, @+$f089
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_10c0

    inc hl

jr_000_10c0::
    ld a, l
    or h
    jr nz, jr_000_10c8

    jx @+$00f4


jr_000_10c8::
    ld hl, $0000
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    callx @+$fc7c
    ld hl, $00f0
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx @+$01d5
    ld hl, $c666
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $ef
    call $c600
    ld hl, $0000
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    ld a, $b3
    call $c600
    ld hl, $0007
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0003
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    ld a, $b8
    call $c600
    ldx hl, @+$0330
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $69
    call $c600
    ld hl, $0009
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0001
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    ld a, $b8
    call $c600
    ldx hl, @+$02f0
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, $69
    call $c600
    jx @+$0022


    ld a, $b1
    call $c600
    ld hl, $ff90
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_116f

    inc hl

jr_000_116f::
    ld a, l
    or h
    jr nz, jr_000_1177

    jx @+$0007


jr_000_1177::
    jx @+$0007


    jx @+$ffe0


    ld a, $db
    call $c600
    ld hl, $00f0
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx @+$012b
    ld hl, $00f0
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx @+$011b
    ld hl, $00f0
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx @+$010b
    ld a, $01
    call $c600
    ret


    ldx hl, @+$f4f3
    push hl
    ld hl, $c646
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c647
    ld l, [hl]
    ld h, $00
    pop de
    ld c, $08
    trap $84
    ld a, l
    or h
    jr nz, jr_000_11de

    jx @+$000c


jr_000_11de::
    ld hl, $0001
    push hl
    ld hl, $c657
    pop de
    ld [hl], e
    ret


    ld hl, $0000
    push hl
    ld hl, $c656
    pop de
    ld [hl], e
    ld hl, $c7f2
    push hl
    ld hl, $c645
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    trap $89
    push hl
    ld hl, $c644
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    add hl, hl
    pop de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c662
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c662
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c664
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c664
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_1235

    inc hl

jr_000_1235::
    ld a, l
    or h
    jr nz, jr_000_123d

    jx @+$000c


jr_000_123d::
    ld hl, $0001
    push hl
    ld hl, $c656
    pop de
    ld [hl], e
    ld hl, $0001
    push hl
    ld hl, $c658
    pop de
    ld [hl], e
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000d
    pop de
    ld c, $07
    trap $84
    ld a, l
    or h
    jr nz, jr_000_1266

    jx @+$0045


jr_000_1266::
    ld hl, $c664
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0001
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_127f

    jx @+$000b


jr_000_127f::
    ld hl, $c656
    ld e, [hl]
    ld d, $00
    inc de
    ld [hl], e
    ld hl, $c664
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0001
    pop de
    trap $85
    push hl
    ld hl, $c664
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c658
    ld e, [hl]
    ld d, $00
    inc de
    ld [hl], e
    jx @+$ffaa


    ld hl, $000c
    push hl
    ld hl, $c656
    ld l, [hl]
    ld h, $00
    pop de
    trap $8a
    push hl
    ld hl, $c65c
    pop de
    ld [hl], e
    ret


    jx @+$0010


    ld hl, $c648
    ld e, [hl]
    ld d, $00
    dec de
    ld [hl], e
    ld a, $b1
    call $c600
    ld hl, $c648
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    jr z, jr_000_12db

    jx @+$ffe8


jr_000_12db::
    ret


    ld hl, $0000
    push hl
    ld hl, $c659
    pop de
    ld [hl], e
    ld l, e
    ld h, $00
    push hl
    ld hl, $c658
    pop de
    ld [hl], e
    ld hl, $c649
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0040
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_1307

    jx @+$000c


jr_000_1307::
    ld hl, $ffff
    push hl
    ld hl, $c659
    pop de
    ld [hl], e
    ld hl, $c649
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0080
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_1329

    jx @+$000c


jr_000_1329::
    ld hl, $0001
    push hl
    ld hl, $c659
    pop de
    ld [hl], e
    ld hl, $c649
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0010
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_134b

    jx @+$000c


jr_000_134b::
    ld hl, $0001
    push hl
    ld hl, $c658
    pop de
    ld [hl], e
    ld hl, $c649
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0020
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_136d

    jx @+$000c


jr_000_136d::
    ld hl, $ffff
    push hl
    ld hl, $c658
    pop de
    ld [hl], e
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c659
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    ld a, l
    or h
    jr nz, jr_000_138d

    jx @+$00ad


jr_000_138d::
    ld hl, $c644
    push hl
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    add hl, de
    pop de
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld [hl], e
    ld hl, $c645
    push hl
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c659
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0009
    pop de
    add hl, de
    pop de
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld [hl], e
    ld hl, $c644
    push hl
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    trap $8a
    ld hl, $c3b0
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld e, l
    ld d, h
    pop hl
    ld [hl], e
    ld hl, $c645
    push hl
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0009
    pop de
    trap $8a
    ld hl, $c3b0
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld e, l
    ld d, h
    pop hl
    ld [hl], e
    ld hl, $c7f2
    push hl
    ld hl, $c645
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    trap $89
    push hl
    ld hl, $c644
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    push hl
    ld hl, $0002
    pop de
    trap $89
    push hl
    ld hl, $0001
    pop de
    add hl, de
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0080
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr z, jr_000_1430

    jx @+$ff60


jr_000_1430::
    callx @+$fa8f
    ret


    rrca
    cp d
    ret


    ld c, $cc
    rst $18
    db $db
    cp b
    sbc $d7
    pop de
    rrca
    jp z, $b8bb

    cp h
    sbc $ae
    cp e
    jp c, $bccf

    ret nz

    nop
    rrca
    or l
    or [hl]
    ret z

    or [hl]
    sbc $c5
    cp b
    push bc
    ret c

    trap $bc
    ret nz

    ret


    jp $00de

End:
