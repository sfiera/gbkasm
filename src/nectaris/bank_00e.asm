; Disassembly of "Nectaris GB (Japan) (SGB Enhanced).gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "consts.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

SECTION "ROM Bank $00e", ROMX[$4000], BANK[$e]

    ld a, $00
    ld [$d7b3], a
    call Call_00e_4130
    ret nc

    ld a, $01
    ld [$d7b3], a
    ld a, $e4
    ldh [rBGP], a
    ld hl, $8000
    xor a
    ld b, $20

jr_00e_4018:
    ld c, $00

jr_00e_401a:
    ld [hl+], a
    dec c
    jr nz, jr_00e_401a

    dec b
    jr nz, jr_00e_4018

    call Call_00e_41b1
    call Call_00e_4113
    ld hl, $4207
    call Call_00e_40dd
    call Call_00e_4113
    ld hl, $4217
    call Call_00e_40dd
    call Call_00e_4113
    ld hl, $4227
    call Call_00e_40dd
    call Call_00e_4113
    ld hl, $4237
    call Call_00e_40dd
    call Call_00e_4113
    ld hl, $4247
    call Call_00e_40dd
    call Call_00e_4113
    ld hl, $4257
    call Call_00e_40dd
    call Call_00e_4113
    ld hl, $4267
    call Call_00e_40dd
    call Call_00e_4113
    ld hl, $4277
    call Call_00e_40dd
    call Call_00e_4113
    ld hl, $4307
    call Call_00e_40dd
    call Call_00e_4113
    ld hl, $4337
    ld de, $42b7
    call Call_00e_41c6
    call Call_00e_4113
    ld hl, $5337
    ld de, $42c7
    call Call_00e_41c6
    call Call_00e_4113
    ld hl, $5efb
    ld de, $42d7
    call Call_00e_41c6
    call Call_00e_4113
    ld hl, $4287
    ld de, $42a7
    call Call_00e_41c6
    call Call_00e_4113
    call Call_00e_40c4
    call Call_00e_4113
    call Call_00e_41b6
    ld hl, $4327
    call Call_00e_40dd
    call Call_00e_4113
    ld hl, $4317
    call Call_00e_40dd
    call Call_00e_4113
    ret


Call_00e_40c4:
    ld hl, $42e7
    push hl
    call Call_00e_41b6
    ld hl, $8800
    xor a
    ld b, $10

jr_00e_40d1:
    ld c, $00

jr_00e_40d3:
    ld [hl+], a
    dec c
    jr nz, jr_00e_40d3

    dec b
    jr nz, jr_00e_40d1

    jp Jump_00e_41da


Call_00e_40dd:
    ld a, [hl]
    and $07
    ret z

    ld b, a
    ld c, $00

jr_00e_40e4:
    push bc
    ld a, $00
    ld [c], a
    ld a, $30
    ld [c], a
    ld b, $10

jr_00e_40ed:
    ld e, $08
    ld a, [hl+]
    ld d, a

jr_00e_40f1:
    bit 0, d
    ld a, $10
    jr nz, jr_00e_40f9

    ld a, $20

jr_00e_40f9:
    ld [c], a
    ld a, $30
    ld [c], a
    rr d
    dec e
    jr nz, jr_00e_40f1

    dec b
    jr nz, jr_00e_40ed

    ld a, $20
    ld [c], a
    ld a, $30
    ld [c], a
    pop bc
    dec b
    ret z

    call Call_00e_4113
    jr jr_00e_40e4

Call_00e_4113:
    ld de, $1b58

jr_00e_4116:
    nop
    nop
    nop
    dec de
    ld a, d
    or e
    jr nz, jr_00e_4116

    ret


Call_00e_411f:
jr_00e_411f:
    ld de, $06d6

jr_00e_4122:
    nop
    nop
    nop
    dec de
    ld a, d
    or e
    jr nz, jr_00e_4122

    dec bc
    ld a, b
    or c
    jr nz, jr_00e_411f

    ret


Call_00e_4130:
    ld hl, $41a1
    call Call_00e_40dd
    call Call_00e_4113
    ldh a, [rP1]
    and $03
    cp $03
    jr nz, jr_00e_4186

    ld a, $20
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    call Call_00e_4113
    ld a, $30
    ldh [rP1], a
    call Call_00e_4113
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    call Call_00e_4113
    ld a, $30
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    call Call_00e_4113
    ldh a, [rP1]
    and $03
    cp $03
    jr nz, jr_00e_4186

    ld hl, $4191
    call Call_00e_40dd
    call Call_00e_4113
    sub a
    ret


jr_00e_4186:
    ld hl, $4191
    call Call_00e_40dd
    call Call_00e_4113
    scf
    ret


    adc c
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
    nop
    nop
    nop
    nop
    adc c
    ld bc, $0000
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
    nop

Call_00e_41b1:
    ld a, $81
    ldh [rLCDC], a
    ret


Call_00e_41b6:
    ldh a, [rLCDC]
    and $80
    ret z

jr_00e_41bb:
    ldh a, [rLY]
    cp $91
    jr nz, jr_00e_41bb

    ld a, $01
    ldh [rLCDC], a
    ret


Call_00e_41c6:
    push de
    call Call_00e_41b6
    ld de, $8800
    ld b, $10

jr_00e_41cf:
    ld c, $00

jr_00e_41d1:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_00e_41d1

    dec b
    jr nz, jr_00e_41cf

Jump_00e_41da:
    ld hl, $9800
    ld de, $000c
    ld a, $80
    ld c, $0d

jr_00e_41e4:
    ld b, $14

jr_00e_41e6:
    ld [hl+], a
    inc a
    dec b
    jr nz, jr_00e_41e6

    add hl, de
    dec c
    jr nz, jr_00e_41e4

    ld a, $e4
    ldh [rBGP], a
    call Call_00e_41b1
    ld bc, $0005
    call Call_00e_411f
    pop hl
    call Call_00e_40dd
    ld bc, $0006
    call Call_00e_411f
    ret


    ld a, c
    ld e, l
    ld [$0b00], sp
    adc h
    ret nc

    db $f4
    ld h, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, c
    ld d, d
    ld [$0b00], sp
    xor c
    rst $20
    sbc a
    ld bc, $7ec0
    add sp, -$18
    add sp, -$18
    ldh [$79], a
    ld b, a
    ld [$0b00], sp
    call nz, Call_000_16d0
    and l
    set 1, c
    dec b
    ret nc

    db $10
    and d
    jr z, jr_00e_42b1

    inc a
    ld [$0b00], sp
    ldh a, [rNR12]
    and l
    ret


    ret


    ret z

    ret nc

    inc e
    and l
    jp z, $79c9

    ld sp, $0008
    dec bc
    inc c
    and l
    jp z, $7ec9

    ret nc

    ld b, $a5
    set 1, c
    ld a, [hl]
    ld a, c
    ld h, $08
    nop
    dec bc
    add hl, sp
    call Call_000_0c48
    ret nc

    inc [hl]
    and l
    ret


    ret


    add b
    ret nc

    ld a, c
    dec de
    ld [$0b00], sp
    ld [$eaea], a
    ld [$a9ea], a
    ld bc, $4fcd
    inc c
    ret nc

    ld a, c
    db $10
    ld [$0b00], sp
    ld c, h
    jr nz, @+$0a

    ld [$eaea], a
    ld [$60ea], a
    ld [$fcea], a
    ld b, [hl]
    ld a, l
    ld e, a
    or h
    dec d
    and a
    ld [$46fc], sp
    ld a, l
    ld e, a
    or h
    dec d
    and a
    ld [$46fc], sp
    ld a, l
    ld e, a
    or h
    dec d
    and a
    ld [$46fc], sp
    ld a, l
    ld e, a
    or h
    dec d
    and a
    ld [$0059], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00e_42b1:
    nop
    nop
    nop
    nop
    nop
    nop
    sbc c
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
    nop
    nop
    nop
    nop
    sbc c
    ld bc, $0000
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
    nop
    and c
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
    nop
    nop
    nop
    nop
    xor c
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
    nop
    nop
    nop
    nop
    or c
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
    nop
    nop
    nop
    nop
    cp c
    ld bc, $0000
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
    nop
    cp c
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
    nop
    nop
    nop
    nop
    ld d, c
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
    nop
    nop
    nop
    dec h
    cp $a3
    ld a, h
    ld l, d
    inc b
    ld l, e
    inc b
    sub d
    ld l, h
    ld a, h
    ld hl, sp-$78
    ld [hl], b
    ld [hl], b
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add b
    nop
    nop
    nop
    ld h, b
    nop
    ldh a, [rP1]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    dec b
    inc bc
    ld bc, $0000
    nop
    ld bc, $0100
    nop
    ld bc, $0000
    nop
    inc hl
    inc e
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add b
    add b
    add b
    ret nz

    and a
    add b
    ld de, $f080
    ld h, b
    cp b
    ld h, b
    call z, $0248
    add b
    rst $38
    nop
    rst $38
    nop
    cp a
    ld b, b
    sbc a
    ld h, b
    rst $38
    nop
    rst $38
    nop
    trap $30
    add e
    ld a, h
    nop
    nop
    nop
    nop
    ret nz

    nop
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
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
    nop
    nop
    ld c, b
    jr nc, jr_00e_444e

    jr nc, @+$01

    nop
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
    rst $38
    nop
    rst $38
    nop
    jr nc, jr_00e_4419

jr_00e_4419:
    stop
    stop
    nop
    nop
    jr nc, jr_00e_4421

jr_00e_4421:
    jr nc, jr_00e_4423

jr_00e_4423:
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
    nop
    ldh [rP1], a
    ld [hl], b
    nop
    jr z, jr_00e_4455

    inc c
    jr @+$01

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_00e_444e:
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop

jr_00e_4455:
    rst $38
    nop
    ld [hl], e
    and d
    di
    ld [hl+], a
    inc sp
    ld [hl+], a
    inc sp
    ld [hl+], a
    inc sp
    ld [hl+], a
    di
    ld [hl+], a
    or e
    and d
    inc sp
    and d
    call nz, $c408
    ld [$08c4], sp
    call nz, $c408
    ld [$08c4], sp
    call nz, $c408
    ld [$00a8], sp
    and b
    ld [$00a8], sp
    xor [hl]
    nop
    and d
    nop
    and b
    nop
    and c
    nop
    xor d
    inc b
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld [$3810], sp
    db $10
    jr nz, jr_00e_44ad

    sub b
    nop
    jr nc, jr_00e_44a1

jr_00e_44a1:
    ld [hl], b
    nop
    nop
    ld h, b
    ret nz

    ld h, b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop

jr_00e_44ad:
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
    ld [bc], a
    ld a, [bc]
    ld [de], a
    ld [bc], a
    ldh a, [rNR12]
    and d
    inc a
    sbc b
    jr nz, jr_00e_4532

    nop
    nop
    nop
    nop
    nop
    ei
    inc b
    di
    inc c
    di
    inc c
    cp a
    ld b, b
    cp a
    ld b, b
    rst $38
    nop
    rst $38
    nop
    rst $38
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    inc bc
    nop
    ld a, [de]
    rlca
    ld c, [hl]
    ccf
    db $db
    inc a
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add a
    inc bc
    adc a
    rlca
    sbc a
    ld c, $ee
    inc e
    db $f4
    ld [$00e7], sp
    add $00
    ld b, $00
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
    rst $38

jr_00e_4532:
    nop
    rst $38
    nop
    rst $38
    nop
    jr c, jr_00e_4539

jr_00e_4539:
    stop
    stop
    nop
    nop
    nop
    nop
    ld h, b
    nop
    ld b, b
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    ret nz

    nop
    jp nz, $c000

    nop
    ret nz

    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    ld bc, $0200
    nop
    rlca
    ld [bc], a
    rlca
    ld bc, $0207
    rlca
    dec b
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
    cp $00
    db $fc
    nop
    ld hl, sp+$00
    add hl, bc
    ld b, $08
    ld b, $0a
    inc b
    nop
    ld [de], a
    cp $60
    rst $38
    sbc [hl]
    rst $38
    ld h, c
    rst $28
    adc [hl]
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    di
    inc c
    add b
    ld bc, $0000
    nop
    nop
    db $10
    ld e, $00
    nop
    ld a, $01

jr_00e_45bb:
    ld b, a
    jr c, jr_00e_45de

    ld e, h
    dec e
    ld c, $8f
    cpl
    rst $20
    adc a
    rst $30
    ld h, a
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    add b
    ccf
    ld b, b
    rrca
    db $10
    rlca
    ld [$ccdc], sp
    ret z

    sbc b
    db $10
    adc b
    ld b, b

jr_00e_45de:
    add b
    call nz, $c680
    cp c
    ld a, l
    rst $38
    rra
    rlca
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    or b
    ld b, b
    jr nz, jr_00e_45bb

    ld b, b
    nop
    ld b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$ff00], sp
    nop
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
    rst $38
    nop
    rst $38
    nop
    ld b, $00
    inc e
    inc b
    jr z, jr_00e_4635

    ld l, d
    dec e
    ld d, $79
    adc d
    ld [hl], c
    ldh a, [rP1]
    ld h, b
    add b
    rst $38
    nop
    db $fc
    inc bc
    ld hl, sp+$07
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop

jr_00e_4635:
    rst $38
    nop
    ld d, l
    ld [hl], $6e
    sbc [hl]
    ld h, c
    ld h, b
    ld [$2c08], sp
    inc [hl]
    jr c, @-$3a

    inc a
    ld [bc], a
    ld b, $01
    rst $30
    ld [$00ff], sp
    ld h, c
    sbc [hl]
    ld [$3cf7], sp
    jp $03fc


    cp $01
    rst $38
    nop
    and [hl]
    ld h, [hl]
    rra
    ld [bc], a
    rra
    inc bc
    ld h, h
    sbc e
    ld a, c
    ld a, [hl]
    dec de
    ld e, $6f
    ld l, e
    dec h
    db $e3
    rst $20
    jr @+$01

    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    add b
    rra
    ldh [$6f], a
    sub b
    rst $20
    jr jr_00e_4678

jr_00e_4678:
    nop
    nop
    nop
    add b
    nop
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
    nop
    ld h, b
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld b, $00
    stop
    jr nc, jr_00e_46bd

jr_00e_46bd:
    jr nc, jr_00e_46bf

jr_00e_46bf:
    jr nc, jr_00e_46c1

jr_00e_46c1:
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    inc sp
    ld [hl+], a

jr_00e_46d9:
    inc sp
    ld [hl+], a
    ld [hl], e
    ld [hl+], a
    inc sp
    ld h, d
    or e
    ld [hl+], a
    inc sp
    ld [hl+], a
    inc sp
    ld [hl+], a
    inc sp
    ld [hl+], a
    call nz, $c408
    ld [$08c4], sp
    call nz, $c408
    ld [$08c4], sp
    call nz, $c408
    ld [$0cac], sp
    xor b
    ld [$08a0], sp
    and b
    nop
    and h
    nop
    and [hl]
    add hl, bc
    xor l
    rrca
    xor a
    rlca
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    jr nz, jr_00e_46d9

    ld b, b
    add b
    add e
    nop
    ld b, $03
    adc b
    dec b
    ld b, l
    adc [hl]
    add [hl]
    inc l
    db $10
    inc c
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    db $fd
    ld [bc], a
    rst $38
    nop
    cp a
    ld b, b
    sbc a
    ld h, b
    rlca
    rrca
    rrca
    ld [$1018], sp
    inc sp
    jr nz, jr_00e_4774

jr_00e_4740:
    jr nz, jr_00e_4776

    jr nz, jr_00e_4778

    jr nz, jr_00e_477a

    jr nz, jr_00e_4740

    nop
    ldh a, [rP1]
    rst $20
    rlca
    trap $0f
    trap $0f
    trap $0f
    trap $0f
    trap $0f
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    stop
    jr nc, jr_00e_4773

    ld d, b
    db $10
    sub b
    stop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $28
    rst $38

jr_00e_4773:
    rst $28

jr_00e_4774:
    rst $38
    rst $28

jr_00e_4776:
    rst $38
    rst $38

jr_00e_4778:
    rst $38
    rst $38

jr_00e_477a:
    nop
    nop
    nop
    rst $38
    nop
    ld [$0c00], sp
    nop
    ld a, [bc]
    nop
    add hl, bc
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $00
    and $e7
    rra
    rla
    rrca
    bit 0, a
    dec hl
    ld [hl+], a
    ld a, [hl+]
    jr nz, jr_00e_47cc

    jr nz, jr_00e_47ce

    jr nz, jr_00e_47e7

    nop
    rra
    nop
    rst $28
    ldh [$b7], a
    ldh a, [$d3]
    db $f4
    db $d3
    db $f4
    db $d3
    db $f4
    db $d3
    db $f4
    inc b
    inc bc
    inc b
    rlca
    inc bc
    inc b
    inc bc
    nop
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_00e_47cc:
    nop
    rst $38

jr_00e_47ce:
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add [hl]
    nop
    adc l
    ld b, $06
    inc c
    inc e
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_00e_47e5

jr_00e_47e5:
    ld h, b
    nop

jr_00e_47e7:
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld [$0f00], sp
    nop
    inc b
    inc bc
    ld [bc], a
    inc bc
    nop
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ccf
    ccf
    ld a, a
    ld b, b
    ldh [$a0], a
    rst $18
    add b
    pushx @ + $d780
    add a
    rst $18
    add b
    pushx @ + $c080
    nop
    add b
    nop
    rra
    nop
    jr nz, jr_00e_482f

jr_00e_482f:
    daa
    ld [$0028], sp
    jr nz, jr_00e_4835

jr_00e_4835:
    daa
    ld [$fcfc], sp
    db $fc
    ld [bc], a
    ld b, $05
    ld a, [$da00]
    db $10
    ld a, [$faf0]
    nop
    jp c, $0310

    nop
    inc bc
    nop
    ld sp, hl
    nop
    inc b
    ld bc, $01e4
    inc b
    ld bc, HeaderLogo
    db $e4
    ld bc, $aa0f
    rra
    inc d
    ld a, [hl]
    xor b
    cp l
    add hl, hl
    ld a, l
    ld d, c
    ld a, h
    ld d, b
    rst $38
    and b
    rst $38
    and b
    or b
    ld b, b
    ld hl, $c3c1
    inc bc
    jp nz, $8603

    rlca
    add a
    rlca
    rrca
    rrca
    rrca
    rrca
    xor a
    ld sp, $714f
    and e
    rst $18
    adc h
    db $fc
    di
    ldh a, [$1f]
    nop
    rst $38
    nop
    rst $38
    nop
    ld b, b
    ld a, a
    add b
    rst $38
    nop
    rst $38
    inc bc
    rst $38
    rrca
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ld a, [$bc93]
    adc c
    ld a, [hl]
    inc b
    cp $04
    rst $38
    ld [bc], a
    rst $38
    ld [bc], a

jr_00e_48a3:
    rst $38
    ld bc, $01ff
    inc bc
    add h
    ld h, c
    ld [c], a
    ldh a, [$f1]
    ldh a, [$f1]
    ld hl, sp-$08
    ld hl, sp-$08
    db $fc
    db $fc
    db $fc
    db $fc
    inc bc
    nop
    add b
    nop
    nop
    add b
    ldh [rP1], a
    ld a, b
    inc a
    ld l, $10
    add b
    nop
    add b
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    add b
    ld a, a
    add b
    ccf
    ld b, b
    ccf
    ld b, b
    add hl, de
    nop
    ld sp, $b518
    ld a, b
    ld hl, sp-$10
    ldh a, [$e0]
    jr nz, jr_00e_48a3

    ret nz

    nop
    ret nz

    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    sbc a
    rst $18
    ccf
    jr nz, jr_00e_495c

    ld d, b
    ret nz

    and b
    trap $a0
    call nz, $c2a0
    and b
    pop bc
    and b
    ldh [rP1], a
    ret nz

    nop
    adc a
    rra
    rra
    ccf
    rra
    ccf
    rra
    ccf
    rra
    ccf
    rra
    ccf
    ld a, [$f9fc]
    ld [bc], a
    inc c
    ld [$0006], sp
    and $10
    ld b, $20
    ld b, $40
    ld b, $80
    rlca
    nop
    inc bc
    inc b
    pop af
    ld a, [c]

jr_00e_492d:
    db $fc
    db $fd

jr_00e_492f:
    db $ec
    db $fd
    call c, $bcfd
    db $fd
    ld a, h
    db $fd
    push hl
    jr nz, jr_00e_493a

jr_00e_493a:
    jr nz, jr_00e_495e

    db $10
    dec e
    ld b, $00
    nop
    nop
    nop
    ld [hl], b
    nop
    ld [hl], b
    jr nc, jr_00e_492f

    jr jr_00e_492d

    inc e
    di
    inc c
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
    ld b, b
    add b
    ldh [rLCDC], a
    and b

jr_00e_495c:
    ld b, b
    ld b, b

jr_00e_495e:
    ret nz

    ld b, b
    ret nz

    and b
    ld b, b
    db $10
    jr nz, jr_00e_4985

    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld bc, $0102
    ld [bc], a
    ld b, $00
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00e_4985:
    inc b
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld [$0c00], sp
    nop
    inc a
    nop
    inc h
    jr jr_00e_49db

    inc e
    inc d
    dec c
    inc c
    dec b
    inc bc
    ld a, [bc]
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
    db $fd
    ld [bc], a
    db $fd
    ld [bc], a
    ei
    inc b
    nop
    nop
    nop
    nop
    inc b
    nop
    nop
    nop
    add b
    nop
    add b
    nop
    ret nz

    nop
    ret nz

    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    inc sp
    ld [hl+], a
    inc sp

jr_00e_49da:
    ld [hl+], a

jr_00e_49db:
    inc sp
    ld [hl+], a
    inc sp
    ld [hl+], a
    or e
    ld [hl+], a
    ld [hl], e
    and d
    di
    and d
    or e
    ld [c], a
    call nz, $c408
    ld [$08c4], sp
    call nz, $c408
    ld [$08c4], sp
    call nz, $c408
    ld [$00a3], sp
    and b
    nop
    and b
    nop
    and b
    nop
    xor b
    inc c
    xor [hl]
    nop
    and b
    nop
    and b
    nop
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    inc c
    db $10
    jr nz, jr_00e_4a8b

    ld [hl-], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_00e_4a25

jr_00e_4a25:
    nop
    nop
    sbc a
    ld h, b
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
    rst $38
    nop
    rst $38
    nop
    or h
    jr nz, jr_00e_4aae

    and b
    or h
    and b
    inc [hl]
    and b
    or e
    jr nz, jr_00e_49da

    db $10
    adc a
    ld [$0600], sp
    trap $0f
    trap $0f
    trap $0f
    trap $0f
    trap $0f
    rst $20
    rlca
    ldh a, [rP1]
    cp $01
    sub b
    db $10
    ld d, b
    db $10
    jr nc, jr_00e_4a6d

    stop
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    ld l, a
    rst $38
    xor a
    rst $38
    trap $ff

jr_00e_4a6d:
    rst $28
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    add hl, bc
    nop
    ld a, [bc]
    nop
    inc c
    nop
    ld [$ff00], sp
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    cp $ff
    db $fd
    rst $38

jr_00e_4a8b:
    ei
    rst $38
    rst $30
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    jr z, jr_00e_4ab9

    jr z, jr_00e_4abb

    jr z, jr_00e_4abd

    jr z, jr_00e_4abf

    ret z

    ld b, b
    inc d
    nop
    add sp, $00
    nop
    nop
    db $d3
    db $f4
    db $d3
    db $f4
    db $d3
    db $f4
    db $d3

jr_00e_4aae:
    db $f4
    or e
    db $f4
    rst $20
    add sp, $0f
    db $10
    rra
    ldh [rP1], a
    nop

jr_00e_4ab9:
    nop
    nop

jr_00e_4abb:
    nop
    nop

jr_00e_4abd:
    add b
    nop

jr_00e_4abf:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld [hl], b
    nop
    jr nz, jr_00e_4b4b

    ld [$4150], sp
    jr c, jr_00e_4b02

    ld a, [de]
    ld b, b
    inc h
    add l
    ld b, l
    ld b, e
    ld b, h
    rst $38
    nop
    rst $38
    nop
    rst $18
    jr nz, @+$01

    nop
    cp $01
    db $e4
    dec de
    push bc
    ld a, [hl-]
    rst $00
    jr c, jr_00e_4af8

jr_00e_4af8:
    nop
    ld c, c
    ld [hl], $51
    ld a, $e5
    ld e, $8f
    ld b, $8c

jr_00e_4b02:
    ld b, $0c
    nop
    ld [hl], b
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    add b
    nop
    add c
    nop
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld [bc], a
    nop
    add b
    inc bc
    inc hl
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    ret nc

    jr nz, jr_00e_4b96

    jr nz, @+$01

    nop
    rst $38
    nop

jr_00e_4b4b:
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
    rst $38
    nop
    pushx @ + $df87
    add b
    pushx @ + $d780
    add a
    rst $18
    add b
    ldh [$a0], a
    ld a, a
    ld b, b
    nop
    jr nz, jr_00e_4b90

    nop
    jr nz, jr_00e_4b6b

jr_00e_4b6b:
    daa
    ld [$0028], sp
    jr nz, jr_00e_4b71

jr_00e_4b71:
    rra
    nop
    add b
    nop
    ldh [$1f], a
    ld a, [$faf0]
    nop
    jp c, $fa10

    ldh a, [$fa]
    nop
    ld b, $05
    db $fc
    ld [bc], a
    nop
    inc b
    inc b
    ld bc, HeaderLogo
    db $e4
    ld bc, HeaderLogo
    inc b

jr_00e_4b90:
    ld bc, $00f9
    inc bc
    nop
    rlca

jr_00e_4b96:
    ld hl, sp-$80
    ret nz

    ret nz

    add b
    add c
    nop
    ld bc, $2000
    nop
    db $10
    jr nz, jr_00e_4bb4

    jr nz, @+$32

    nop
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
    rst $38
    nop
    rst $38

jr_00e_4bb4:
    nop
    rst $38
    nop
    rst $38
    and b
    rst $38
    and b
    ld a, a
    ld d, b
    ld a, a
    ld d, b
    ccf
    jr z, jr_00e_4c01

    jr z, jr_00e_4be3

    inc d
    rrca
    ld a, [bc]
    rrca
    rrca
    rrca
    rrca
    add a
    rlca
    add a
    rlca
    jp $c303


    inc bc
    pop hl
    ld bc, $00f0
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld hl, sp+$00
    jp Jump_000_0f03


    rrca

jr_00e_4be3:
    adc a
    rrca
    ret nz

    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    db $fc
    rst $38
    ldh a, [rIE]
    ldh a, [rIE]
    ld a, a
    ld a, a
    rst $38
    ld bc, $01c7
    rlca
    ld [bc], a
    ld l, a
    ld h, d
    xor $e4

jr_00e_4c01:
    sbc $c4
    inc a

jr_00e_4c04:
    ld [$10f8], sp
    db $fc
    db $fc
    db $fc
    db $fc
    ld hl, sp-$08
    sbc b
    ld hl, sp+$10
    pop af
    jr nc, jr_00e_4c04

    pop hl
    ld [c], a
    add e
    add h
    add b
    nop
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0103
    inc bc
    nop
    ccf
    ld b, b
    ccf
    ld b, b
    ld a, a
    add b
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    ret nz

    ret nz

    ret nz

    adc h
    ld b, b
    add hl, sp
    ld b, b
    push bc
    ld a, e
    ldh a, [$fc]
    ccf
    ccf
    ld a, $3d
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

jr_00e_4c51:
    db $fc
    inc bc
    ccf
    ret nz

    ccf
    ret nz

    ret nz

    and b
    ret nz

    and b
    rst $38
    add b
    db $10
    jr c, @+$01

    add b
    ret nz

    and b
    ret nz

    and b
    pop bc
    and b
    rra
    ccf
    rra
    ccf
    nop
    nop
    rst $38
    nop
    nop
    nop
    rra
    ccf
    rra
    ccf
    rra
    ccf
    ld b, $00
    ld b, $00
    cp $00
    ld e, $00
    cp $00
    ld b, $00
    ld b, $00
    ld b, $80
    db $fc
    db $fd
    db $fc
    db $fd
    nop
    ld bc, $00ff
    nop
    ld bc, $fdfc
    db $fc
    db $fd

jr_00e_4c95:
    ld a, h
    db $fd
    jr z, jr_00e_4cb9

    jr nz, jr_00e_4cc3

    and b
    jr nz, @-$1a

    jr nz, @-$10

    jr z, jr_00e_4c51

    ld [hl], b
    ccf
    ld h, b
    ld h, a
    ld a, b
    rst $28
    db $10
    rst $28
    db $10
    rst $20
    jr jr_00e_4c95

    jr @-$0f

    db $10
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    adc [hl]
    dec e

jr_00e_4cb9:
    db $ed
    ld e, $e1
    ld e, $12
    ldh [$90], a
    ldh [rSB], a

jr_00e_4cc2:
    add b

jr_00e_4cc3:
    inc bc
    ld bc, $030d
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
    rst $38
    nop
    rst $38
    nop
    cp $00
    ld b, b
    add b
    ldh [rNR10], a
    jr jr_00e_4d0d

    rra
    ccf
    ccf
    jr nz, jr_00e_4cc2

    ld b, b
    rst $18
    sub b
    cp a
    jr nz, @+$01

    nop
    rst $38
    nop
    rst $38
    nop
    ldh [rP1], a
    ret nz

    nop
    sbc a
    nop
    jr nz, jr_00e_4cf5

jr_00e_4cf5:
    ld b, b
    nop
    or $0c
    jr c, @-$3a

    ld [bc], a
    db $e4
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
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

jr_00e_4d0d:
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    ld b, b
    ret nz

    add b
    ld b, b
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    di
    ld [c], a
    or e
    ld [c], a
    ld [hl], e
    xor d
    db $e3
    jp nc, Jump_000_22c3

    rlca
    inc b
    rst $38
    nop
    rst $38
    nop
    call nz, $c408
    ld [$00cc], sp
    inc e
    nop
    inc a
    nop
    ld hl, sp+$00
    nop
    nop
    nop
    nop
    and b
    nop
    and b
    nop
    and b
    nop
    xor a
    rra
    rst $18
    ld b, b
    ldh [rNR41], a
    rst $38
    nop
    rst $38
    nop
    ld c, a
    db $10
    ld c, a
    db $10
    ld c, a
    db $10
    ld d, b
    nop
    jr nz, jr_00e_4d71

jr_00e_4d71:
    rra
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
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    inc e
    jr nz, @+$6a

    jr nc, @+$6a

    jr nc, @+$01

    rst $38
    rst $38
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    ld l, $0e
    ld b, $0e
    ld e, $02
    ld sp, hl
    ld a, [$04f8]
    ld b, $00
    ld sp, hl
    ld [$02fe], sp
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rlca
    nop
    dec b
    ld [bc], a
    ld hl, sp+$01
    ld b, $00
    ld bc, $2000
    nop
    jr nz, jr_00e_4ddb

jr_00e_4ddb:
    nop
    nop
    nop
    nop
    add b
    nop
    ld b, b
    nop
    nop
    ld b, b
    and d
    inc b
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
    rst $38
    nop
    ld a, a
    add b
    ccf
    ld b, b
    rlca
    dec b
    inc bc
    ld [bc], a
    ld bc, $0201
    ld bc, $0708
    ld c, $07
    ld d, $0f
    inc b
    ld [$00f8], sp
    db $fc
    nop
    cp $00
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
    di
    add b
    rst $38
    ld h, c
    rst $38
    sbc [hl]
    cp $60
    ld h, b
    ld a, [c]
    db $fc
    ld [hl], b
    ldh a, [$60]
    add b
    ld h, b
    ld e, $1e
    nop
    nop
    nop
    nop
    add b
    ld bc, $0cf3
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ldh a, [$60]
    ldh [$80], a
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
    nop
    ld b, b
    nop
    rlca
    ld [$100f], sp
    rra
    ld h, b
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld h, a
    sbc c
    sbc e
    ld bc, $8300
    nop
    add e
    add b
    inc bc
    add e
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    jp nz, $c4a0

    and b
    trap $a0
    ret nz

    and b
    ldh [$50], a
    ccf
    jr nz, jr_00e_4ea4

jr_00e_4ea4:
    nop
    rlca
    rlca
    rra
    ccf
    rra
    ccf
    rra
    ccf
    rra
    ccf
    adc a
    rra
    ret nz

    nop
    ldh [$1f], a
    rst $38
    nop
    ld b, $40
    ld b, $20
    and $10
    ld b, $00
    inc c
    ld [$01fa], sp
    dec b
    rlca
    rra
    rlca
    cp h
    db $fd
    call c, $ecfd
    db $fd
    db $fc
    db $fd
    pop af
    ld a, [c]
    inc bc
    inc b
    rlca
    ld hl, sp-$01
    nop
    rra
    ld a, b
    ld a, [hl]
    add hl, de
    ld a, b
    rra
    ld [hl], c
    ld [de], a
    ld [hl], c
    ld [de], a
    ld h, b
    inc bc
    ld [bc], a
    ld h, $04
    ld [hl+], a
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    di
    inc c
    di
    inc c
    db $e3
    inc e
    and $19
    and $19
    dec bc
    ld b, $0e
    inc b
    dec c
    add hl, bc
    dec c
    ld [$12db], sp
    ld e, e
    ret nc

    db $db
    ld [hl], b
    dec sp
    ld [hl], b
    db $fc
    nop
    ld sp, hl
    nop
    ld a, [c]
    nop
    ld a, [c]
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    ld a, a
    ld b, b
    rst $38
    add a
    ldh a, [rNR10]
    ldh [rNR41], a
    ret nz

    nop
    pop bc
    ld b, c
    jp $c743


    ld b, [hl]
    add b
    nop
    nop
    nop
    rrca
    nop
    inc e
    inc bc
    dec sp
    inc b
    ld [hl], $08
    inc l
    db $10
    jr z, jr_00e_4f47

    rst $38
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop

jr_00e_4f47:
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $db
    nop
    rst $28
    ret


    inc h
    ld bc, $2424
    inc l
    nop
    rst $38
    ret


    db $ed
    reti


    rst $38
    nop
    inc h
    nop
    ld [de], a
    nop
    ret


    ld [de], a
    nop
    db $db
    ret


    ld [de], a
    ld [de], a
    nop
    ld [de], a
    nop
    nop
    nop
    rst $38
    inc b
    db $ed
    ret


    inc h
    nop
    inc h
    inc h
    inc h
    nop

jr_00e_4f81:
    db $ed
    ret


    db $ed
    ret


    rst $38
    nop
    inc h
    nop
    ld [de], a
    nop
    ret


    ld [de], a
    nop
    db $db

jr_00e_4f8f:
    ret


    ld [de], a
    ld [de], a
    nop
    ld [de], a
    nop
    nop
    nop
    rst $38
    inc b
    db $ed
    db $db
    inc h
    ret z

    inc h
    inc h
    inc h
    ld bc, $c9ef
    rst $28
    ret


    rst $38
    nop
    inc h
    nop
    ld [de], a
    nop
    ret z

    inc de
    nop
    db $db
    ret


    ld [de], a
    ld [de], a
    nop
    ld [de], a
    nop
    nop
    nop
    rst $38
    ld bc, $e0ff
    ccf
    jr c, jr_00e_4fcd

    inc c
    rlca
    inc b
    add a
    add [hl]
    rst $00
    add $c7
    ld b, [hl]
    nop
    nop
    nop
    nop
    ret nz

    nop

jr_00e_4fcd:
    jr nc, jr_00e_4f8f

    ret c

    jr nz, @+$6a

    db $10
    jr z, jr_00e_4fe5

    jr z, jr_00e_4fe7

    ld b, [hl]
    nop
    and b
    add b
    and d
    ld de, $41d3
    ret nc

    ld bc, $00d0
    ret nc

    nop

jr_00e_4fe5:
    ret nc

    nop

jr_00e_4fe7:
    sbc a
    jr nz, jr_00e_5039

    db $10
    ld e, a
    nop
    daa
    ld [$0827], sp
    daa
    ld [$0827], sp
    daa
    ld [$6080], sp
    nop
    and b
    jr nz, jr_00e_4ffd

jr_00e_4ffd:
    jr nz, jr_00e_4fff

jr_00e_4fff:
    jr nz, jr_00e_4f81

    and h
    ld b, b
    ld [hl], h
    add b
    sbc d
    add h
    rst $38
    nop
    cp a
    ld b, b
    ccf
    ret nz

    ccf
    ret nz

    cp a
    ld b, b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    inc bc
    nop
    inc bc
    nop
    dec e
    ld [bc], a
    dec a
    ld e, $28
    db $10
    stop
    ld bc, $0100
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop

jr_00e_5039:
    ld bc, $0300
    nop
    ld [bc], a
    nop
    ld [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
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
    nop
    nop
    nop
    nop
    inc c
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    ld bc, $0100
    ld bc, $0307
    dec bc
    ld [bc], a
    ld a, [bc]
    ld [$183c], sp
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
    ei
    inc b
    ei
    inc b
    rst $38
    nop
    ld [hl], b
    ld a, [de]
    ld sp, hl
    inc de
    ld h, e
    sub b
    db $10
    add b
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $01
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
    rst $38
    nop
    rst $38
    nop
    dec de
    db $10
    dec de
    db $10
    dec de
    db $10
    dec de
    db $10
    dec de
    db $10
    dec de
    db $10
    dec de
    db $10
    dec de
    db $10
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    rst $00
    ld b, [hl]
    rst $00
    ld b, [hl]
    rst $00
    ld b, [hl]
    rst $00
    ld b, [hl]
    rst $00
    ld b, [hl]
    rst $00
    ld b, [hl]
    rst $00
    ld b, [hl]
    rst $00
    ld b, [hl]
    jr z, jr_00e_50f9

    jr z, jr_00e_50fb

    jr z, jr_00e_50fd

    jr z, jr_00e_50ff

    jr z, @+$12

    jr z, jr_00e_5103

    jr z, @+$12

    jr z, jr_00e_5107

    ret nc

    nop

jr_00e_50f9:
    ret nc

    nop

jr_00e_50fb:
    pop de
    nop

jr_00e_50fd:
    pop de
    nop

jr_00e_50ff:
    jp nc, $d400

    nop

jr_00e_5103:
    call nc, $d000
    nop

jr_00e_5107:
    daa
    ld [$0827], sp
    daa
    ld [$0827], sp
    daa
    ld [$0827], sp
    daa
    ld [$0827], sp
    add hl, de
    add [hl]
    sbc h
    inc bc
    ld e, $02
    ld c, $02
    inc c
    inc bc
    dec b
    ld [bc], a
    inc b
    nop
    ld b, $02
    rst $38
    nop
    rst $38
    nop
    cp $01
    cp $01
    rst $38
    nop
    rst $38
    nop
    db $fc
    inc bc
    cp $01
    ld bc, $0000
    nop
    add h
    nop
    ld a, h
    add b
    ldh a, [rNR32]

jr_00e_5141:
    cpl
    ld c, $9f
    ld e, $56
    ld c, $ff
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $28
    db $10
    rst $38
    nop
    ld a, a
    add b
    nop
    nop
    ld bc, $0100
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, [bc]
    inc b
    ld [hl+], a
    rst $00
    jr c, jr_00e_5141

    inc a
    inc bc
    ld [de], a
    inc c
    ld [de], a
    inc c
    ld [bc], a
    nop
    ld [bc], a
    nop
    rst $38
    nop
    rst $38
    nop
    db $fc
    inc bc
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
    ld e, b
    jr nc, jr_00e_51fa

    sub b
    ld b, b
    add b
    add b
    nop

jr_00e_519f:
    nop
    nop
    jr nc, jr_00e_51a3

jr_00e_51a3:
    jr nc, jr_00e_51a5

jr_00e_51a5:
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    trap $46
    trap $66
    rst $38
    nop
    pop bc
    nop
    rst $00
    ld b, [hl]
    rst $00
    ld b, [hl]
    rst $38
    nop
    add c
    nop
    jr z, jr_00e_51d9

    jr z, jr_00e_51db

    nop
    nop
    ld b, [hl]
    jr c, jr_00e_51f8

    db $10
    jr z, jr_00e_51e3

    nop
    nop
    ld b, [hl]
    jr c, jr_00e_519f

    ld b, [hl]

jr_00e_51d9:
    rst $00
    ld b, [hl]

jr_00e_51db:
    rst $38
    nop
    add c
    nop
    rst $00
    ld b, [hl]
    rst $00
    ld b, [hl]

jr_00e_51e3:
    rst $38
    nop
    add c
    nop
    jr z, jr_00e_51f9

    jr z, jr_00e_51fb

    nop
    nop
    ld b, [hl]
    jr c, @+$2a

    db $10
    jr z, jr_00e_5203

    nop
    nop
    ld b, [hl]
    jr c, @-$1f

jr_00e_51f8:
    rrca

jr_00e_51f9:
    rst $18

jr_00e_51fa:
    nop

jr_00e_51fb:
    ret nz

    nop
    rst $18
    nop
    ret nz

    nop
    rst $18
    nop

jr_00e_5203:
    ret nc

    nop
    ret nc

    nop
    jr nz, jr_00e_5209

jr_00e_5209:
    jr nz, jr_00e_520b

jr_00e_520b:
    ccf
    nop
    jr nz, jr_00e_520f

jr_00e_520f:
    ccf
    nop
    jr nz, jr_00e_5213

jr_00e_5213:
    jr z, jr_00e_521c

    daa
    ld [$ffff], sp
    rst $38
    nop
    nop

jr_00e_521c:
    nop
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    ld bc, $3300
    ld sp, $4e7b
    rst $28
    sub h
    rst $28
    sub h
    rst $38
    sub h
    rst $28
    add h
    rst $38
    nop
    rst $38
    nop
    adc $00
    add h
    nop
    nop
    ld sp, $3100
    nop
    ld sp, $3110
    sbc h
    ld h, b
    add b
    nop
    adc h
    adc h
    sbc $52
    ld a, d
    and h
    ld a, d
    and h
    cp $a4
    ld a, d
    jr nz, @+$01

    nop
    rst $38
    nop
    ld [hl], e
    nop
    ld hl, $0000
    adc l
    nop
    adc l
    nop
    adc l
    add h
    adc l
    ret nc

    nop
    ret nc

    nop
    ret nc

    nop
    ret nc

    nop
    ret nc

    nop
    ret nc

    nop
    ret nc

    nop
    ret nc

    nop
    daa
    ld [$0827], sp
    daa
    ld [$0827], sp
    daa
    ld [$0827], sp

jr_00e_5293:
    daa
    ld [$0827], sp
    ld [hl], $18
    ld b, e
    inc h
    ld b, e
    inc h
    daa
    jr @+$3b

    ld b, $39
    ld b, $19
    ld b, $0f
    nop
    rst $38
    nop
    rst $20
    jr jr_00e_5293

    jr @+$01

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    adc $a5
    sbc $00
    ld a, a
    ld c, d
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    db $10
    ld sp, $3131
    add h
    nop
    nop
    nop
    rst $38
    nop

jr_00e_52d1:
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    ld [hl], d
    jr z, jr_00e_52d1

    nop
    cp $52
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    add l
    adc h
    adc h
    adc h
    ld hl, $0000
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    ei
    ldh a, [$fb]
    nop
    rlca
    ld [bc], a
    rst $38
    ld b, $07
    ld [bc], a
    di
    nop
    dec bc
    nop
    dec de
    db $10
    inc b
    nop
    inc b
    nop
    ld hl, sp+$00
    nop
    nop
    ld hl, sp+$00
    inc c
    nop
    inc d
    ldh [$e4], a
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
    ld b, b
    add b
    ret nz

    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rlca
    nop
    ld [bc], a
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
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rlca
    rlca
    rrca
    ld [$1218], sp
    jr jr_00e_5373

    jr c, jr_00e_5371

    ld e, b
    or b
    ld hl, sp-$30
    jp c, $f8f0

    nop
    ldh a, [rP1]
    and $01
    rst $20
    nop
    db $e3
    inc b

jr_00e_5371:
    db $e3
    inc b

jr_00e_5373:
    db $e3
    inc b
    db $e3
    inc b
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    dec c
    ld b, $08
    rlca
    rlca
    inc bc
    rla
    inc bc
    rlca
    ld c, $00
    nop
    nop
    nop
    nop
    rst $38
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
    ei
    ldh a, [$fb]
    nop
    dec bc
    jr nz, @+$1d

    db $10
    dec de
    db $10
    sbc e
    db $10
    dec de
    sub b
    sbc e
    db $10
    inc b
    nop
    inc b
    nop
    inc [hl]
    ret nz

    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    ld a, [$1810]
    db $10
    jr c, jr_00e_53cd

    ld a, b
    jr nc, jr_00e_5439

    jr nc, jr_00e_53da

    db $10
    jr jr_00e_53d5

    dec de
    db $10
    db $e3
    inc b
    db $e3
    inc b
    db $e3
    inc b

jr_00e_53cd:
    db $e3
    inc b
    db $e3
    inc b
    db $e3
    inc b
    db $e3
    inc b

jr_00e_53d5:
    db $e3
    inc b
    rlca
    ld c, $07

jr_00e_53da:
    ld c, $1d
    ld c, $1f
    inc c
    dec b
    ld c, $0f
    inc bc
    dec hl
    inc de
    dec sp
    inc de
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    db $db
    db $10
    dec de
    db $10
    dec de
    db $10
    dec de
    db $10
    sbc e
    db $10
    cp e
    db $10
    ei
    db $10
    ld e, e
    or b
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
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
    dec b
    inc bc
    rlca
    rlca
    dec b
    ld b, $ff
    nop
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
    rst $38
    nop
    rst $38
    nop
    nop
    nop

jr_00e_5439:
    ld [bc], a
    inc c
    db $10
    rrca
    dec b
    ld [bc], a
    add $00
    cp h
    ret nz

    ret nz

    add b
    add b
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, [de]
    inc de
    dec de
    inc de
    dec de
    inc de
    dec de
    inc de
    dec de
    rla
    dec de
    rla
    rrca
    ld [$0418], sp
    db $e3
    inc b
    db $e3
    inc b
    db $e3
    inc b
    db $e3
    inc b
    rst $20
    nop
    db $e4
    nop
    ldh a, [rP1]
    db $fc
    inc bc
    or l
    dec de
    ld e, c
    cp c
    sub c
    sbc c
    nop
    sbc c
    adc l
    ld a, [de]
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_00e_548c:
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    ei
    sub b
    ei
    sub b
    db $db
    sub b
    ld e, e
    sub b
    db $db
    db $10
    ei
    ldh a, [$fb]
    nop
    dec de
    jr nc, jr_00e_548c

    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    inc b
    nop
    inc b
    nop
    inc h
    ret nz

    inc bc
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
    add b
    nop
    ldh [rP1], a
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rlca

jr_00e_54d8:
    nop
    ld [bc], a
    ld bc, $0110

jr_00e_54dd:
    add hl, de
    nop
    inc d
    ld [$0d12], sp
    rrca
    ld bc, $0102
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add hl, de
    ld a, [bc]
    inc bc
    ld [de], a
    add b
    ld de, $0898
    or b
    ld [$3888], sp
    and c
    daa
    add $01
    ei
    inc b
    di
    inc c
    pop af
    ld c, $f8
    rlca
    ld hl, sp+$07
    ld hl, sp+$07
    rst $20
    jr jr_00e_54dd

    jr c, jr_00e_54d8

    nop
    add b
    nop
    add b
    nop
    add b
    nop
    nop
    add b
    nop
    add b
    ld b, b
    add b
    ld b, d
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    inc bc
    inc b
    rlca
    nop
    ld e, [hl]
    nop
    cp $00
    sub b
    nop

jr_00e_5541:
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld b, e
    nop
    rlca
    nop
    rlca
    nop
    nop
    rlca

jr_00e_555f:
    nop
    inc b
    inc e
    inc c
    ld de, $7c31
    ld a, [hl]
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    db $fc
    inc bc
    db $fc
    inc bc
    pop af
    ld c, $ff
    nop
    rst $20
    ld b, [hl]
    rst $20
    ld h, [hl]
    rst $38
    nop
    add l
    nop
    rst $00
    ld c, [hl]
    rst $28
    ld b, [hl]
    rst $38
    nop
    add c
    nop
    jr z, jr_00e_5599

    jr z, jr_00e_559b

    nop
    nop
    ld b, [hl]
    jr c, jr_00e_55b8

    db $10
    jr z, jr_00e_55a3

    nop
    nop
    ld b, [hl]
    jr c, jr_00e_555f

    ld h, [hl]

jr_00e_5599:
    rst $00
    ld h, [hl]

jr_00e_559b:
    rst $38
    nop
    add c
    nop
    rst $00
    ld b, [hl]
    rst $00
    ld b, [hl]

jr_00e_55a3:
    rst $38
    nop
    add c
    nop
    jr z, jr_00e_55b9

    jr z, jr_00e_55bb

    nop
    nop
    ld b, [hl]
    jr c, @+$2a

    db $10
    jr z, jr_00e_55c3

    nop
    nop
    ld b, [hl]
    jr c, jr_00e_5541

jr_00e_55b8:
    ld c, b

jr_00e_55b9:
    add b
    ld c, b

jr_00e_55bb:
    ret z

    ld d, b
    inc e
    ld h, b
    ld a, h
    nop
    jr c, jr_00e_55c3

jr_00e_55c3:
    jr c, jr_00e_55c5

jr_00e_55c5:
    jr z, jr_00e_55d7

    trap $30
    trap $30
    rst $18
    jr nz, @+$01

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop

jr_00e_55d7:
    jp nz, $e000

    nop
    jr nc, jr_00e_55dd

jr_00e_55dd:
    stop
    stop
    nop
    nop
    jr nz, jr_00e_5625

    ld h, b
    ld b, b
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
    rst $38
    nop
    rst $38

jr_00e_55f4:
    nop
    rst $38
    nop
    inc c
    nop
    db $ec
    jr jr_00e_55f4

    ld hl, sp+$68
    ld [hl], b
    jr nz, @+$42

    add b
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    add b
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    jr jr_00e_561b

jr_00e_561b:
    add hl, bc
    ld b, $09
    ld b, $01
    nop
    nop
    nop
    nop
    nop

jr_00e_5625:
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    sub b
    ld h, b
    and b
    ld [hl], b
    dec a
    jr jr_00e_5653

    ld [bc], a
    db $10
    add hl, bc
    inc b
    inc bc
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
    di
    inc c

jr_00e_5653:
    ld sp, hl
    ld b, $ff
    nop
    ld a, [hl-]
    ld a, h
    inc [hl]
    ld a, b
    ret z

    ld b, b
    adc b
    add b
    or c
    ldh a, [$83]
    ld sp, $033c
    cp [hl]
    inc c
    rst $38
    nop
    rst $38
    nop
    trap $30
    adc a
    ld [hl], b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld [$0010], sp
    nop
    nop
    nop
    inc bc
    nop
    nop
    inc bc
    inc bc
    ld bc, $0001
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld h, b
    ld b, b
    jr nz, jr_00e_56db

    ld h, b
    nop
    nop
    nop
    jr jr_00e_56a1

jr_00e_56a1:
    ld e, h
    adc b
    adc b
    ld a, [bc]
    dec bc
    ld [bc], a
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
    rst $38
    nop
    ei
    inc b
    ei
    inc b
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
    nop
    nop
    nop
    ld [$ff00], sp
    nop
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
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop

jr_00e_56db:
    db $10
    db $10
    jr c, jr_00e_56ff

    ld a, l
    ld d, b
    sub $90
    cp $80
    rst $38
    ld a, [hl]
    rst $38
    nop
    rst $38
    nop
    rst $20
    ld [$04c3], sp
    adc c
    ld a, [de]
    inc l
    dec a
    nop
    ld bc, $0081
    nop
    nop
    nop
    nop
    nop
    nop
    ld [bc], a
    nop

jr_00e_56ff:
    ld [bc], a
    nop
    ld [bc], a
    nop
    ld e, $00
    sbc [hl]
    ld h, b
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ldh a, [$0c]
    xor h
    ld b, b
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
    jr c, jr_00e_5727

jr_00e_5727:
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
    rst $38
    nop
    rst $38
    nop
    rst $38
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
    jr nc, jr_00e_5743

jr_00e_5743:
    jr nz, jr_00e_5745

jr_00e_5745:
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $80
    sub $90
    ld l, h
    ld b, b
    jr c, jr_00e_577f

    db $10
    stop
    nop
    nop
    nop
    nop
    nop

jr_00e_5767:
    nop
    ld bc, $3d2c
    sbc c
    ld a, [de]
    jp $e704


    ld [$00ff], sp
    rst $38
    nop
    rst $38
    nop
    sbc h
    ld h, b
    add b
    nop
    nop
    nop
    nop
    nop

jr_00e_577f:
    rrca
    jr nc, @+$44

    inc hl
    ld b, c
    jr nz, jr_00e_5767

    db $10
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
    db $e3
    inc e
    pop hl
    ld e, $f1
    ld c, $70
    nop
    ldh [rP1], a
    ret nz

    nop
    nop
    nop
    nop
    nop
    sbc a
    nop
    ld [de], a
    ld bc, $0100
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    inc bc
    inc bc
    rrca
    inc c
    rra
    inc de
    ccf
    inc l
    ld a, [hl]
    ld e, c
    ld a, l
    ld d, d
    ld a, [$f8a3]
    and b
    db $fc
    nop
    ldh a, [rP1]
    ldh [rP1], a
    ret nz

    nop
    add d
    inc bc
    add h
    rlca
    inc c
    rrca
    rrca
    rrca
    ret nz

    ret nz

    ldh a, [$30]
    ld hl, sp-$38
    db $fc
    jr nc, jr_00e_585e

    jr jr_00e_581e

    adc d
    cp [hl]
    add l
    cp $04
    ccf
    nop
    rrca
    nop
    rlca
    nop
    rlca
    nop
    jp Jump_00e_63c0


    ldh [$71], a
    ldh a, [$f0]
    pop af

jr_00e_57f7:
    nop
    ld [bc], a
    dec b
    ld [bc], a
    inc b
    ld [bc], a
    inc b
    ld [bc], a
    ld [bc], a
    nop
    nop

jr_00e_5802:
    nop
    nop
    nop
    jr nz, jr_00e_5807

jr_00e_5807:
    cp $01
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
    rst $38
    nop
    rst $38
    nop
    ld b, $00
    ld c, $00
    ld b, $00
    add c

jr_00e_581e:
    ld b, $c0
    dec b
    ld a, c
    add l
    jp nc, $43bf

    inc h
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    db $fd
    ld [bc], a
    db $fd
    ld [bc], a
    rst $38
    nop
    ld h, a
    sbc b
    ld bc, $2f00
    db $10
    ld [hl], a
    jr c, jr_00e_57f7

    ld [hl], b
    pop de
    jr nz, jr_00e_5802

    nop
    add b
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, [$d01c]
    jr nc, jr_00e_588c

    ret nz

    nop

jr_00e_585e:
    ret nz

    add b
    nop
    inc bc
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    inc e
    nop
    inc e
    nop
    nop
    nop
    add b
    nop
    add b
    nop
    ld bc, $0100
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_00e_588c:
    nop
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
    ei
    and b
    rst $38
    and b
    ld a, a
    ld d, b
    ld a, a
    ld e, b
    ccf
    inc l
    rra
    inc bc
    dec bc
    inc b
    nop
    ld [bc], a
    rrca
    rrca
    rrca
    rrca
    add a
    rlca
    add e
    inc bc
    ret nz

    nop
    ldh a, [rP1]
    db $fc
    nop
    cp $01
    xor $04
    xor [hl]
    dec h
    ld e, h
    ld c, b
    inc a
    ld a, [de]
    ld hl, sp+$30
    ldh a, [$c0]
    ret nz

    stop
    nop
    ldh a, [$f1]
    pop de
    ldh a, [$a1]
    ld [c], a
    jp $03c0


    inc b
    rlca
    ld [$201f], sp
    ccf
    ret nz

    nop
    nop
    sub b
    nop
    stop
    nop
    nop
    nop
    nop
    stop
    ld b, c
    jr nc, jr_00e_5906

    ld [hl], b
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    add b
    nop
    nop
    nop

jr_00e_58fd:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00e_5906:
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld b, h
    jr nz, jr_00e_598a

    jr nz, jr_00e_5945

    jr nc, jr_00e_5924

    add hl, sp
    jr nc, jr_00e_5938

    ld hl, $0706

jr_00e_5924:
    jr nz, jr_00e_5966

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $30
    ld [$18e7], sp
    rst $20
    jr jr_00e_58fd

    jr c, jr_00e_5939

jr_00e_5938:
    nop

jr_00e_5939:
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
    nop

jr_00e_5945:
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    inc b
    nop
    ld [bc], a
    inc b
    ld c, $04
    ld [hl+], a
    nop
    ld e, d
    inc a
    ld [hl], b

jr_00e_5966:
    nop
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
    db $e3
    inc e
    rst $38
    nop
    rst $38
    nop
    adc b
    adc b
    ld a, [bc]
    inc c
    inc b
    inc b
    inc c
    ld [$1008], sp
    ldh a, [$e0]
    and e
    ret nz

    rrca
    nop
    adc a
    ld [hl], b
    rrca

jr_00e_598a:
    ldh a, [rTAC]
    ld hl, sp+$0f
    ldh a, [$1f]
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    nop
    stop
    jr nc, jr_00e_599b

jr_00e_599b:
    nop
    nop
    nop
    nop
    jr nc, jr_00e_59a1

jr_00e_59a1:
    inc b
    ld c, b
    inc a
    ld [hl], b
    ld [hl], b
    nop
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
    trap $30
    rst $38
    nop
    rst $38
    nop
    cp e
    db $10
    sbc e
    db $10
    dec de
    sub b
    sbc e
    sub b
    db $db
    sub d
    dec e
    add sp, -$03
    ld l, c
    sbc $64
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    db $e4
    nop
    ld a, [c]
    nop
    ld a, [c]
    nop
    ld sp, hl
    nop
    rst $00
    ld b, [hl]
    jp $e043


    ld h, b
    ldh a, [$30]
    ld hl, sp+$38
    rst $38
    rra
    rst $38
    rlca
    rst $38
    add b
    jr z, jr_00e_59f9

    inc l
    db $10
    rla
    ld [$0708], sp
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $db
    nop

jr_00e_59f9:
    db $ed
    ret


    inc h
    nop
    inc h
    inc h
    inc h
    nop
    db $ed
    ret


    db $ed
    ret


    rst $38
    nop
    inc h
    nop
    ld [de], a
    nop
    ret


    ld [de], a
    nop
    db $db
    ret


    ld [de], a
    ld [de], a
    nop
    ld [de], a
    nop
    nop
    nop
    rst $00
    ld b, [hl]
    rst $00
    add $07
    ld b, $0f
    inc c
    rra
    inc e
    rst $38
    ld hl, sp-$01
    pop hl
    cp $02
    jr z, @+$12

    jr z, jr_00e_5a3b

    ret c

    jr nz, jr_00e_5a5e

    ret nz

    ldh [rP1], a
    nop
    nop
    nop
    nop
    ld bc, $d200
    ld bc, $01d2

jr_00e_5a3b:
    db $d3
    nop
    pushx @ + $ad40
    ld c, $ae
    adc [hl]
    ld c, a
    ld e, $8c
    ld e, $27
    ld [$0827], sp
    daa
    ld [$0827], sp
    ld c, a
    db $10
    ld c, a
    db $10
    sbc a
    jr nz, jr_00e_5a95

    ld b, b
    db $10
    jr c, jr_00e_5a9e

    ld c, b
    sbc h
    db $10
    sub b

jr_00e_5a5e:
    add b
    ldh [$c0], a
    ret nz

    add b
    add b
    nop
    nop
    nop
    rst $38
    nop
    trap $30
    sbc a
    ld h, b
    sbc a
    ld h, b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
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
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop

jr_00e_5a95:
    rst $38
    nop
    pop af
    nop
    jp nz, $0001

    nop
    inc b

jr_00e_5a9e:
    nop
    dec bc
    ld b, $19
    add hl, bc
    ld hl, $2410
    inc d
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
    ld sp, hl
    ld b, $f1
    ld c, $f7
    ld [$02ef], sp
    adc l
    ld bc, $010e
    ld e, $01
    ld l, $19
    ld a, $19
    db $fd
    dec sp
    inc sp
    ld a, a
    db $fc
    nop
    cp $00
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
    rst $38
    nop
    ld a, a
    ld b, b
    sbc a
    db $10
    ld h, b
    nop
    rra
    add b
    ldh [$60], a
    db $f4
    ld hl, sp-$10
    ldh a, [$f0]
    ldh a, [$80]
    nop
    ld h, b
    nop
    rra
    add b
    add b
    ld h, b
    ldh [$1f], a
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
    nop
    nop
    rst $38
    nop
    nop
    nop
    ld c, h
    nop
    ld [de], a
    inc c
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
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
    nop
    nop
    rst $38
    nop
    nop
    nop
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
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
    nop
    nop
    rst $38
    nop
    nop
    nop
    ld b, b
    add b
    add b
    ld b, b
    ld [c], a
    inc b
    nop
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
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
    nop
    nop
    rst $38
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
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
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
    rlca
    inc b
    ei
    ld [bc], a
    dec b
    ld [$0065], sp
    ld h, l
    nop
    ld [hl], l
    nop
    nop
    nop
    nop
    nop
    ld hl, sp+$00
    inc b
    nop
    ld a, [bc]
    ldh a, [$f2]
    ld [$08f2], sp
    ld a, [c]
    ld [$00ff], sp
    rst $38
    nop
    ret nz

    db $10
    add a
    inc b
    adc h
    ld [$139a], sp
    sbc d
    inc de
    sbc d
    inc de
    nop
    nop
    nop
    nop
    rra
    jr nz, jr_00e_5be6

    ld b, b
    jr nc, jr_00e_5bf4

    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    rst $38
    nop
    rst $38
    nop
    ret nz

    db $10
    add a
    inc b
    adc h
    ld [$139a], sp
    sbc d
    inc de
    sbc b
    inc de
    nop
    nop
    nop
    nop
    rra
    jr nz, jr_00e_5c06

    ld b, b
    jr nc, jr_00e_5c14

    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    db $fd
    inc b
    ld a, [$0508]
    ld bc, $01f8
    dec b
    ld [bc], a
    sbc [hl]
    rlca
    adc a
    rlca
    rlca

jr_00e_5be6:
    rlca
    ld [bc], a
    nop
    inc b
    ld bc, $02f9
    inc bc
    inc b
    rlca
    ld hl, sp-$01
    nop
    rst $38

jr_00e_5bf4:
    nop
    rst $38
    nop
    ld a, [hl]
    jr @-$1e

    sbc b
    sbc $80
    ld b, l
    add d
    pop bc
    ld b, $8f
    ld b, $8c
    rlca
    ld a, d

jr_00e_5c06:
    add h
    ld a, a
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
    rst $38

jr_00e_5c14:
    nop
    rst $38
    nop
    ld a, [$f9fc]
    ld [bc], a
    inc c
    nop
    ld b, $00
    and $10
    ld b, $20
    ld b, $40
    ld b, $80
    rlca
    nop
    inc bc
    inc b
    ld sp, hl
    ld a, [$fdfc]
    db $ec
    db $fd
    call c, $bcfd
    db $fd
    ld a, h
    db $fd
    jr c, jr_00e_5c39

jr_00e_5c39:
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], b
    nop
    stop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop

jr_00e_5c4f:
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$0200], sp
    inc b
    ld b, $00
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    ld h, b
    db $10
    jr nz, @+$23

    db $10
    ld a, [bc]
    ld de, $1a3c
    add h
    ld b, h
    push bc
    push bc
    pop bc
    cp $ff
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $01
    call nz, $c53b
    ld a, [hl-]
    rst $38
    nop
    ld d, l
    jr nc, jr_00e_5c4f

    ld [hl], b
    ld [hl], l
    ldh a, [$f5]
    ldh a, [$e5]
    ldh a, [$f5]
    add b
    sub l
    nop
    dec d
    nop
    ld a, [c]
    ld [$08f2], sp
    ld a, [c]
    ld [$08f2], sp
    ld a, [c]
    ld [$08f2], sp
    ld a, [c]
    ld [$08f2], sp
    sbc b
    inc de
    sbc c
    inc de
    sbc d
    ld de, $1398
    sbc e
    inc de
    sbc e
    inc de
    sbc e
    inc de
    sbc e
    inc de
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    nop
    nop
    ld bc, $0100
    nop
    nop
    nop
    cp b
    nop
    ld b, b
    add b
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add b
    nop
    ret nz

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
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    sbc b
    ld [de], a
    sbc b
    db $10
    sbc b
    db $10
    sbc b
    db $10
    sbc b
    db $10
    sbc b
    ld [de], a
    sbc b
    ld [de], a
    sbc d
    ld [de], a
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    nop
    nop
    ld bc, $0300
    nop
    ld bc, $0e06
    inc b
    inc d
    ld [$0018], sp
    ld bc, $ff00
    nop
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
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    nop
    inc b
    inc bc
    dec [hl]
    inc bc
    db $10
    jr nz, jr_00e_5d96

    jr nz, @+$01

    nop
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
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    inc hl
    inc e
    ld h, d
    inc e
    inc e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_00e_5d96:
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
    inc bc
    nop
    dec b
    ld b, $1e
    inc c
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
    rst $38
    nop
    rst $38
    nop
    rst $38
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
    ld bc, $0300
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    ld bc, $0100
    nop
    ld bc, $0200
    nop
    ld [bc], a

jr_00e_5de2:
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld sp, $310e
    ld c, $3a

jr_00e_5dfc:
    inc b
    ld a, [hl-]
    inc b
    inc h
    jr jr_00e_5de2

    jr jr_00e_5dfc

    nop
    add b
    nop
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    dec d
    nop
    dec d

jr_00e_5e1a:
    nop
    dec d
    nop
    dec h
    db $10
    dec [hl]
    db $10
    ld d, l
    jr nc, @+$77

    jr nc, jr_00e_5e7b

    jr nz, jr_00e_5e1a

    ld [$08f2], sp
    ld a, [c]
    ld [$08f2], sp
    ld a, [c]
    ld [$08f2], sp
    ld a, [c]
    ld [$08f2], sp
    sbc e
    inc de
    sbc e
    ld [de], a
    sbc d
    db $10
    sbc d
    db $10
    sbc b
    db $10
    sbc c
    db $10
    sbc c
    db $10
    sbc b
    db $10
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    sbc d
    inc de
    sbc e
    inc de
    sbc e
    ld [de], a
    sbc d
    db $10
    sbc d
    db $10
    sbc c
    db $10
    sbc c
    db $10
    sbc b
    db $10
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    ld b, $40
    ld b, $20

jr_00e_5e7b:
    and $10
    ld b, $00
    inc c
    nop
    ld a, [$0501]
    rlca
    rra
    rlca
    cp h
    db $fd
    call c, $ecfd
    db $fd
    db $fc
    db $fd
    ld sp, hl
    ld a, [$0403]
    rlca
    ld hl, sp-$01
    nop
    nop
    jr nz, @+$32

    nop
    jr nc, jr_00e_5e9d

jr_00e_5e9d:
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld h, l
    nop
    ld b, l
    nop
    dec b
    nop
    dec b
    nop
    dec b
    nop
    dec b
    nop
    dec b
    nop
    dec b
    nop
    ld a, [c]
    ld [$08f2], sp
    ld a, [c]
    ld [$08f2], sp
    ld a, [c]
    ld [$08f2], sp
    ld a, [c]
    ld [$08f2], sp
    sbc b
    db $10
    sbc b
    db $10
    sbc e
    db $10
    sbc b
    db $10
    sbc b
    db $10
    sbc b
    db $10
    sbc b
    db $10
    sbc b
    db $10
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    inc hl
    ld b, h
    nop
    jr nz, jr_00e_5efa

jr_00e_5efa:
    inc e
    ld bc, $0210
    db $10
    inc bc
    db $10
    inc b
    db $10
    dec b
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0910], sp
    db $10
    ld a, [bc]
    db $10
    dec bc
    db $10
    inc c
    db $10
    dec c
    db $10
    dec c
    db $10
    dec c
    db $10
    ld c, $10
    rrca
    db $10
    db $10
    db $10
    ld de, $0910
    db $10
    ld a, [bc]
    db $10
    dec c
    db $10
    dec c
    db $10
    dec c
    db $10
    ld c, $10
    rrca
    db $10
    ld bc, $0210
    db $10
    ld [de], a
    inc d
    inc de
    inc d
    inc d
    inc d
    dec d
    inc d
    ld d, $10
    rla
    db $10
    jr jr_00e_5f51

    add hl, de
    db $10
    ld a, [de]
    db $10
    dec c
    db $10
    dec de
    db $10
    inc e
    db $10
    dec e
    db $10
    ld e, $10
    rra
    db $10

jr_00e_5f51:
    jr nz, jr_00e_5f67

    ld hl, $2214
    inc d
    inc hl
    inc d
    inc h
    db $10
    dec h
    db $10
    dec c
    db $10
    ld h, $10
    dec e
    db $10
    ld e, $10
    dec c
    db $10

jr_00e_5f67:
    daa
    db $10
    jr z, jr_00e_5f7b

    inc h
    db $10
    dec h
    db $10
    ld d, $10
    rla
    db $10
    add hl, hl
    inc d
    ld a, [hl+]
    inc d
    dec hl
    inc d
    inc l
    inc d

jr_00e_5f7b:
    dec l
    db $10
    ld l, $10
    cpl
    db $10
    jr nc, jr_00e_5f93

    ld sp, $3210
    db $10
    inc sp
    db $10
    inc [hl]
    db $10
    dec [hl]
    db $10
    ld [hl], $10
    scf
    db $10
    jr c, jr_00e_5fa7

jr_00e_5f93:
    add hl, sp
    inc d
    ld a, [hl-]
    inc d
    dec sp
    inc d
    inc a
    db $10
    dec a
    db $10
    ld a, $10
    ccf
    db $10
    dec [hl]
    db $10
    ld [hl], $10
    ld b, b
    db $10

jr_00e_5fa7:
    ld b, c
    db $10
    ld b, d
    db $10
    inc a
    db $10
    dec a
    db $10
    dec l
    db $10
    ld b, e
    db $10
    ld b, h
    inc d
    ld b, l
    inc d
    ld b, [hl]
    inc d
    ld b, a
    inc d
    ld c, b
    db $10
    ld c, c
    db $10
    ld c, d
    db $10
    ld c, e
    db $10
    ld c, h
    db $10
    ld c, l
    db $10
    ld c, [hl]
    db $10
    ld c, a
    db $10
    ld d, b
    db $10
    ld d, c
    db $10
    ld c, [hl]
    db $10
    ld c, a
    db $10
    ld d, d
    db $10
    ld d, e
    db $10
    ld c, [hl]
    db $10
    ld c, a
    db $10
    ld d, d
    db $10
    ld d, e
    db $10
    ld c, [hl]
    db $10
    ld d, b
    db $10
    ld d, c
    db $10
    ld c, [hl]
    db $10
    ld c, a
    db $10
    ld d, d
    db $10
    ld d, e
    db $10
    ld c, [hl]
    db $10
    ld d, h
    db $10
    ld d, l
    db $10
    ld d, [hl]
    inc d
    ld d, a
    inc d
    ld e, b
    inc d
    ld e, c
    inc d
    ld e, d
    db $10
    ld e, e
    db $10
    ld e, h
    db $10
    ld e, l
    db $10
    ld e, [hl]
    db $10
    ld e, a
    db $10
    ld h, b
    db $10
    ld h, c
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, d
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, e
    db $10
    ld h, h
    db $10
    ld h, l
    db $10
    dec c
    db $10
    ld e, l
    db $10
    ld h, [hl]
    db $10
    ld h, a
    db $10
    ld l, b
    db $10
    ld l, c
    db $10
    ld l, d
    db $10
    ld l, e
    db $10
    ld l, h
    db $10
    ld l, l
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, l
    db $10
    ld l, [hl]
    db $10
    ld l, d
    db $10
    ld l, e
    db $10
    ld l, a
    db $10
    ld [hl], b
    db $10
    ld [hl], c
    db $10
    ld [hl], d
    db $10
    ld [hl], e
    db $10
    dec c
    db $10
    ld l, h
    db $10
    ld [hl], h
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld [hl], l
    db $10
    halt
    db $10
    ld [hl], a
    db $10
    ld [hl], a
    db $10
    ld [hl], a
    db $10
    ld [hl], a
    db $10
    dec c
    db $10
    ld a, b
    db $10
    ld a, c
    db $10
    dec c
    db $10
    ld l, h
    db $10
    ld l, l
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, l
    db $10
    ld a, d
    db $10
    dec c
    db $10
    dec c
    db $10
    dec c
    db $10
    ld a, e
    db $10
    ld [hl], a
    db $10
    ld a, h
    db $10
    ld a, l
    db $10
    ld [hl], a
    db $10
    ld a, [hl]
    db $10
    ld l, l
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, l
    db $10
    ld a, d
    db $10
    daa
    db $10
    jr z, @+$12

    ld a, a
    db $10
    add b
    db $10
    db $10
    db $10
    ld de, $0b10
    db $10
    inc c
    db $10
    ld l, h
    db $10
    ld l, l
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, l
    db $10
    ld a, d
    db $10
    ld b, c
    db $10
    ld b, d
    db $10
    rlca
    db $10
    ld [$0d10], sp
    db $10
    ld h, $10
    add c
    db $10
    add d
    db $10
    add e
    db $10
    ld l, l
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, l
    db $10
    ld a, d
    db $10
    ld a, [de]
    db $10
    dec c
    db $10
    dec de
    db $10
    inc e
    db $10
    ld a, $10
    ccf
    db $10
    add h
    db $10
    add l
    db $10
    add [hl]
    db $10
    ld l, l
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, l
    db $10
    ld a, d
    db $10
    ld sp, $3210
    db $10
    inc sp
    db $10
    inc [hl]
    db $10
    add a
    db $10
    adc b
    db $10
    adc c
    db $10
    adc d
    db $10
    adc e
    db $10
    ld l, l
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, l
    db $10
    ld a, d
    db $10
    adc h
    db $10
    adc l
    db $10
    adc [hl]
    db $10
    adc a
    db $10
    sub b
    db $10
    dec c
    db $10
    dec c
    db $10
    sub c
    db $10
    ld l, h
    db $10
    sub d
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    sub e
    db $10
    ld a, d
    db $10
    ld h, [hl]
    db $10
    ld h, a
    db $10
    sub h
    db $10
    sub l
    db $10
    sub [hl]
    db $10
    sub a
    db $10
    sbc b
    db $10
    sbc c
    db $10
    ld l, h
    db $10
    ld l, l
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, l
    db $10
    ld a, d
    db $10
    ld l, a
    db $10
    ld [hl], b
    db $10
    sbc d
    db $10
    sbc e
    db $10
    sbc h
    db $10
    sbc l
    inc d
    sbc [hl]
    db $10
    sbc a
    db $10
    ld l, h
    db $10
    ld l, l
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, l
    db $10
    halt
    db $10
    ld [hl], a
    db $10
    ld [hl], a
    db $10
    ld [hl], a
    db $10
    ld [hl], a
    db $10
    and b
    db $10
    and c
    inc d
    and d
    db $10
    and e
    db $10
    ld l, h
    db $10
    ld l, l
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, l
    db $10
    ld a, d
    db $10
    dec c
    db $10
    and h
    inc d
    and l
    inc d
    and [hl]
    db $10
    and a
    db $10
    xor b
    db $10
    xor c
    db $10
    xor d
    db $10
    ld l, h
    db $10
    ld l, l
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, l
    db $10
    ld a, d
    db $10
    ld a, a
    db $10
    xor e
    inc d
    xor h
    inc d
    xor l
    db $10
    ld [hl], a
    db $10
    ld [hl], a
    db $10
    ld [hl], a
    db $10
    ld [hl], a
    db $10
    ld a, [hl]
    db $10
    ld l, l
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, l
    db $10
    ld a, d
    db $10
    inc c
    db $10
    ld a, b
    db $10
    ld a, c
    db $10
    dec c
    db $10
    ld bc, $0210
    db $10
    inc bc

Jump_00e_63c0:
    db $10
    inc b
    db $10
    ld l, h
    db $10
    ld l, l
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, l
    db $10
    halt
    db $10
    ld [hl], a
    db $10
    ld a, h
    db $10
    ld a, l
    db $10
    ld [hl], a
    db $10
    ld d, $10
    rla
    db $10
    jr @+$12

    add hl, de
    db $10
    ld l, h
    db $10
    ld l, l
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, l
    db $10
    ld a, d
    db $10
    dec c
    db $10
    ld b, b
    db $10
    xor [hl]
    db $10
    xor a
    db $10
    dec l
    db $10
    ld b, e
    db $10
    or b
    db $10
    jr nc, @+$12

    ld l, h
    db $10
    ld [hl], l
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld [hl], l
    db $10
    ld a, d
    db $10
    or c
    db $10
    daa
    db $10
    jr z, @+$12

    or d
    db $10
    ld [de], a
    inc d
    inc de
    inc d
    inc d
    inc d
    dec d
    inc d
    ld l, h
    db $10
    ld l, l
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, l
    db $10
    ld a, d
    db $10
    sub c
    db $10
    ld b, c
    db $10
    ld b, d
    db $10
    or e
    db $10
    add hl, hl
    inc d
    ld a, [hl+]
    inc d
    dec hl
    inc d
    inc l
    inc d
    or h
    db $10
    or l
    db $10
    ld h, b
    db $10
    or [hl]
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    or [hl]
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    ld h, b
    db $10
    or [hl]
    db $10
    ld h, b
    db $10
    or a
    db $10
    cp b
    db $10
    sbc c
    db $10
    cp c
    db $10
    cp d
    db $10
    cp e
    db $10
    ld b, h
    inc d
    ld b, l
    inc d
    ld b, [hl]
    inc d
    ld b, a
    inc d
    cp h
    db $10
    cp l
    db $10
    cp [hl]
    db $10
    cp a
    db $10
    cp [hl]
    db $10
    cp a
    db $10
    ret nz

    db $10
    pop bc
    db $10
    cp [hl]
    db $10
    jp nz, $c310

    db $10
    cp [hl]
    db $10
    cp a
    db $10
    ret nz

    db $10
    pop bc
    db $10
    cp [hl]
    db $10
    jp nz, $c410

    db $10
    cp [hl]
    db $10
    cp a
    db $10
    ret nz

    db $10
    pop bc
    db $10
    push bc
    db $10
    add $10
    sbc a
    db $10
    ld l, $10
    rst $00
    db $10
    ret z

    db $10
    ld d, [hl]
    inc d
    ld d, a
    inc d
    ld e, b
    inc d
    ld e, c
    inc d
    dec c
    db $10
    ld a, e
    db $10
    ret


    db $10
    and [hl]
    db $10
    ld l, $10
    cpl
    db $10
    and d
    db $10
    and e
    db $10
    jp z, $cb10

    db $10
    call z, $cd10
    db $10
    adc $10
    daa
    db $10
    jr z, jr_00e_6571

    dec c
    db $10
    rl b
    trap $10
    ld a, e
    db $10
    ret


    db $10
    and [hl]
    db $10
    and b
    db $10
    ret nc

    db $10

jr_00e_6571:
    and d
    db $10
    and e
    db $10
    ld c, c
    db $10
    ld c, d
    db $10
    pop de
    db $10
    jp nc, Jump_000_0d10

    db $10
    db $d3
    db $10
    call nc, $7f10
    db $10
    add b
    db $10
    push de
    db $10
    xor l
    db $10
    ld c, c
    db $10
    ld c, d
    db $10
    xor c
    db $10
    xor d
    db $10
    sub $10
    pushx @ + $d810
    db $10
    dec c
    db $10
    dec c
    db $10
    ld b, c
    db $10
    ld b, d
    db $10
    db $d3
    db $10
    pushx @ + $d910
    db $10
    add b
    db $10
    push de
    db $10
    xor l
    db $10
    and a
    db $10
    xor b
    db $10
    xor c
    db $10
    xor d
    db $10
    ld e, e
    db $10
    jp c, $db10

    db $10
    db $10
    db $10
    ld de, $0b10
    db $10
    inc c
    db $10
    dec c
    db $10
    dec c
    db $10
    dec c
    db $10
    ld c, $10
    ld e, e
    db $10
    ld e, h
    db $10
    ld [bc], a
    db $10
    inc bc
    db $10
    inc b
    db $10
    call c, $dd10
    db $10
    rlca
    db $10
    ld [$1010], sp
    db $10
    ld de, $0b10
    db $10
    call c, $dd10
    db $10
    dec c
    db $10
    dec c
    db $10
    ld c, $10
    rrca
    db $10
    ld bc, $0210
    db $10
    inc bc
    db $10
    inc b
    db $10
    dec b
    db $10
    ld b, $10
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
    nop
    nop
    nop
    nop
    nop
    ld hl, $4114
    inc h
    ld h, d
    inc l
    and d
    inc a
    ld b, $4d
    adc c
    ld d, c
    db $ed
    ld d, l
    ld d, c
    ld e, d
    cp $6b
    rst $38
    ld d, e
    rst $38
    ld b, e
    ld a, e
    inc de
    ld sp, $000e
    nop
    nop
    nop
    nop
    nop
    ld hl, $4114
    inc h
    ld h, d
    inc l
    and d
    inc a
    ld b, $4d
    adc c
    ld d, c
    db $ed
    ld d, l
    ld d, c
    ld e, d
    inc e
    ld e, e
    sbc h
    ld c, [hl]
    dec de
    ld b, [hl]
    db $f4
    jr z, $6786

    inc d
