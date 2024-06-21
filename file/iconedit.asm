; Disassembly of "icon-edit.gbf"

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
    db $03                     ; owner code

Title::
    dk "ICON-EDIT"
Icon::
    INCBIN "gfx/icon/icon-edit.2bpp"

Points::
    dw $0001
Author::
    db "TOBI      ", 2
History::
    ds 11
    ds 11
    ds 11

Main::
    ld sp, $e000

Jump_000_0100:
    ld hl, $0301
    rst $08
    or [hl]
    rst $10
    ld b, $00
    rst $10
    jr jr_000_010f

    ret


    rst $10
    ld b, $00

jr_000_010f:
    rst $10
    ld [bc], a
    inc b
    ret


    jr nc, jr_000_0119

    rst $10
    jp z, $c900

jr_000_0119:
    ldh a, [$9b]
    ld [$c766], a
    ldh a, [$9a]
    ld [$c767], a
    xor a
    ldh [$9b], a
    ldh [$9a], a

jr_000_0128:
    xor a
    rst $08
    or e
    rst $08
    or l
    rst $10
    ld b, $00
    rst $10
    sub e
    inc b
    ret


    ld a, $03
    rst $08
    or h
    xor a

jr_000_0139:
    rst $10
    rla
    nop
    pop de
    rst $08
    ld e, a
    jr c, jr_000_0139

    ld l, a
    ld h, $00
    rst $08
    ld b, $06
    sbc c
    nop
    inc e
    nop
    rrca
    nop
    dec bc
    nop
    reti


    rst $38
    inc b
    inc b
    ld b, $04
    ld a, a
    rst $00
    dec b
    rst $08
    ld bc, $06d7
    nop
    rst $10
    ld b, a
    inc b
    ret


    rst $10
    ld a, [hl]
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    db $fc
    ld [bc], a
    ret


    jr c, jr_000_0128

jr_000_016e:
    ld de, $c791
    ld hl, $c769
    ld c, $00

jr_000_0176:
    inc c
    ld a, [de]
    inc de
    ld [hl+], a
    or a
    jr nz, jr_000_0176

    ld a, $83
    ld de, $c768
    ld [de], a
    ld hl, $c500
    ld c, $00
    rst $08
    ld l, e
    jr c, jr_000_01a5

    ld a, $09
    rst $10
    ld b, $00
    rst $10
    ld e, h
    dec b
    ret


    rst $10
    ld b, $00
    rst $10
    ld b, e
    inc bc
    ret


    jr c, jr_000_0128

    ld hl, $c500
    rst $08
    rst $28
    jr jr_000_016e

jr_000_01a5:
    ld hl, $c50a
    xor a
    ld [hl+], a
    ld a, [hl]
    ld c, a
    ld b, $00
    add $c0
    ld [hl+], a
    add hl, bc
    ld de, $c600
    ld c, $c0

jr_000_01b7:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_000_01b7

    ld hl, $c500
    ld de, $0000
    ld bc, $19ff
    rst $08
    jp hl


    jr c, jr_000_01ce

    rst $10
    ld e, l
    rst $38
    ret


jr_000_01ce:
    ld a, $08
    rst $10
    ld b, $00
    rst $10
    ld a, [de]
    dec b
    ret


jr_000_01d7:
    rst $08
    ret c

    or a
    jr z, jr_000_01d7

    rst $10
    ld c, e
    rst $38
    ret


    xor a
    rst $08
    or e
    rst $08
    or l
    rst $10
    ld b, $00
    rst $10
    ld h, [hl]
    inc bc
    ret


    rst $10
    ld b, $00
    rst $10
    ld a, $02
    ret


    ld a, $63
    rst $08
    or h

jr_000_01f7:
    rst $08
    or c
    ld bc, $2800
    rst $08
    call nz, $d8cf
    rst $10
    ld b, $00
    rst $10
    ld b, c
    nop
    ret


    ldh a, [$8b]
    bit 3, a
    jr z, jr_000_0211

    rst $10
    dec bc
    rst $38
    ret


jr_000_0211:
    or a
    jr z, jr_000_01f7

    rst $10
    ld b, $00
    rst $10
    inc c
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    ld l, a
    ld bc, $18c9
    db $d3
    ldh a, [$8b]
    bit 2, a
    ret z

    ld hl, $c7b9
    inc [hl]
    ld a, [$c7b9]
    rst $10
    ld e, l
    inc b
    pop de
    and $01
    jr z, jr_000_023c

    rst $10
    sub l
    inc b
    pop de

jr_000_023c:
    ld hl, $9000
    ld bc, $0010
    rst $08
    ld [bc], a
    ret


    ldh a, [$b6]
    ld b, a
    and $f0
    jr z, @+$52

    bit 6, b
    jr z, jr_000_0259

    rst $10
    ld b, $00
    rst $10
    ld a, e
    nop
    ret


    jr jr_000_027e

jr_000_0259:
    bit 7, b
    jr z, jr_000_0266

    rst $10
    ld b, $00
    rst $10
    sub d
    nop
    ret


    jr jr_000_027e

jr_000_0266:
    bit 5, b
    jr z, jr_000_0273

    rst $10
    ld b, $00
    rst $10
    xor e
    nop
    ret


    jr jr_000_027e

jr_000_0273:
    bit 4, b
    jr z, jr_000_027e

    rst $10
    ld b, $00
    rst $10
    jp nz, $c900

jr_000_027e:
    rst $10
    ld b, $00
    rst $10
    pop hl
    nop
    ret


    ldh a, [$8a]
    and $03
    jr z, @+$13

    rst $10
    ld b, $00
    rst $10
    ld l, e
    ld bc, $fac9
    ld h, h
    rst $00
    rst $10
    ld b, $00
    rst $10
    dec d
    ld bc, $21c9
    ld h, e
    rst $00
    ld a, [hl]
    ld c, a
    inc [hl]
    bit 4, c
    ret nz

    ldh a, [$9b]
    ld d, a
    ldh a, [$9a]
    ld e, a
    ld hl, $c300
    ld a, [$c762]
    inc a
    inc a
    add a
    add a
    add a
    sub e
    ld [hl+], a
    ld a, [$c761]
    inc a
    add a
    add a
    add a
    sub d
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl], a
    ret


    ld [hl], a
    add a
    add a
    add a
    ld e, a
    xor a
    ld [$c763], a
    ret


    ld hl, $c762
    ld a, [hl]
    dec a
    bit 7, a
    jr z, jr_000_02d9

    xor a

jr_000_02d9:
    rst $10
    ld b, $00
    rst $10
    add sp, -$01
    ret


    ldh a, [$9a]
    or a
    jr z, jr_000_02f2

    ld d, a
    sub e
    cpl
    inc a
    cp $20
    jr nc, jr_000_02f2

    ld a, d
    sub $08
    ldh [$9a], a

jr_000_02f2:
    ret


    ld hl, $c762
    ld a, [hl]
    inc a
    cp $18
    jr c, jr_000_02fe

    ld a, $17

jr_000_02fe:
    rst $10
    ld b, $00
    rst $10
    jp $c9ff


    ldh a, [$9a]
    cp $50
    jr nc, jr_000_0318

    ld d, a
    sub e
    cpl
    inc a
    cp $50
    jr c, jr_000_0318

    ld a, d
    add $08
    ldh [$9a], a

jr_000_0318:
    ret


    ld hl, $c761
    ld a, [hl]
    dec a
    bit 7, a
    jr z, jr_000_0323

    xor a

jr_000_0323:
    rst $10
    ld b, $00
    rst $10
    sbc [hl]
    rst $38
    ret


    ldh a, [$9b]
    or a
    jr z, jr_000_033c

    ld d, a
    sub e
    cpl
    inc a
    cp $20
    jr nc, jr_000_033c

    ld a, d
    sub $08
    ldh [$9b], a

jr_000_033c:
    ret


    ld hl, $c761
    ld a, [hl]
    inc a
    cp $20
    jr c, jr_000_0348

    ld a, $1f

jr_000_0348:
    rst $10
    ld b, $00
    rst $10
    ld a, c
    rst $38
    ret


    ldh a, [$9b]
    cp $60
    jr nc, jr_000_0362

    ld d, a
    sub e
    cpl
    inc a
    cp $80
    jr c, jr_000_0362

    ld a, d
    add $08
    ldh [$9b], a

jr_000_0362:
    ret


    ld a, [$c761]
    ld e, a
    ld d, $00
    ld hl, $c758
    rst $08
    and e
    ld hl, $0a22
    rst $08
    cp b
    ld hl, $c75c
    rst $08
    ld l, c
    ld a, [$c762]
    ld e, a
    ld d, $00
    ld hl, $c758
    rst $08
    and e
    ld hl, $0a23
    rst $08
    cp b
    ld hl, $c75c
    rst $08
    ld l, c
    ret


    ldh a, [$8b]
    ld e, a
    and $03
    ret z

    push de
    rst $10
    ld b, $00
    rst $10
    ld h, c
    nop
    ret


    pop de
    bit 0, e
    jr z, jr_000_03a2

    inc a

jr_000_03a2:
    bit 1, e
    jr z, jr_000_03a9

    ld a, [$c764]

jr_000_03a9:
    and $03
    ld [$c764], a
    ld d, a
    ld e, c
    bit 0, d
    jr nz, jr_000_03b6

    ld e, $00

jr_000_03b6:
    ld a, [hl]
    and b
    or e
    ld [hl+], a
    ld e, c
    bit 1, d
    jr nz, jr_000_03c1

    ld e, $00

jr_000_03c1:
    ld a, [hl]
    and b
    or e
    ld [hl-], a
    ld e, l
    ld d, h
    ld h, $91
    ld bc, $0002
    rst $08
    ld [bc], a
    ld a, [$c762]
    ld h, a
    ld l, $00
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld a, [$c761]
    or l
    ld l, a
    ld de, $9800
    add hl, de
    ld de, $c764
    ld bc, $0001
    rst $08
    ld [bc], a
    ret


    add b
    ld b, b
    jr nz, jr_000_0406

    ld [$0204], sp
    ld bc, $61fa
    rst $00
    and $07
    ld e, a
    ld d, $00
    rst $10
    rst $28
    rst $38
    pop hl

jr_000_0406:
    add hl, de
    ld a, [hl]
    ld c, a
    cpl
    ld b, a
    ld a, [$c761]
    and $f8
    add a
    ld l, a
    add a
    add l
    ld l, a
    ld a, [$c762]
    add a
    add l
    ld l, a
    ld h, $c6
    inc hl
    ld d, $00
    ld a, [hl-]
    and c
    jr z, jr_000_0425

    inc d

jr_000_0425:
    sla d
    ld a, [hl]
    and c
    jr z, jr_000_042c

    inc d

jr_000_042c:
    ld a, d
    ret


    xor a
    ld hl, $c761
    ld d, [hl]
    ld [hl+], a
    ld e, [hl]
    ld [hl-], a
    push de
    ld hl, $9800
    ld bc, $0400

jr_000_043d:
    push hl
    rst $10
    ld b, $00
    rst $10
    cp b
    rst $38
    ret


    pop hl
    ld [hl+], a
    ld de, $c761
    ld a, [de]
    inc a
    ld [de], a
    cp $20
    jr c, jr_000_043d

    xor a
    ld [de], a
    ld de, $c762
    ld a, [de]
    inc a
    ld [de], a
    cp $20
    jr c, jr_000_043d

    pop de
    ld hl, $c761
    ld [hl], d
    inc hl
    ld [hl], e
    ret


    rst $08
    or l
    rst $10
    ld b, $00
    rst $10
    sbc d
    ld bc, $d7c9
    ld b, $00
    rst $10
    daa
    ld bc, $11c9
    dec c
    ld b, d
    ld hl, $c700
    rst $08
    ld d, h
    ld a, $06
    rst $10
    ld b, $00
    rst $10
    ld l, e
    ld [bc], a
    ret


    ld de, $0107
    ld bc, $0605
    rst $08
    ld e, b
    ld a, $10
    ld de, $0208
    ld bc, $0403
    ld hl, $0301
    rst $08
    ld e, c
    ld de, $0808
    ld bc, $0c03
    rst $08
    ld e, b
    ld a, $38
    ld de, $0909
    ld bc, $0a01
    ld hl, $0100
    rst $08
    ld e, c
    ld a, $03
    rst $08
    or h
    ld de, $c769
    ld hl, $c791
    ld bc, $0028
    rst $08
    ld [bc], a
    ld de, $3801
    ld hl, $c791
    ld b, $0a
    rst $08
    ld d, [hl]
    ld a, $07
    rst $10
    ld b, $00
    rst $10
    rra
    ld [bc], a
    ret


    rst $10
    ld b, $00
    rst $10
    ld b, $00
    ret


    ret c

    or a
    ret


jr_000_04dc:
    rst $08
    or c
    rst $08
    ret c

    and $03
    jr z, jr_000_04dc

    or a
    bit 0, a
    ret nz

    scf
    ret


    ld hl, $c509
    ld b, [hl]
    inc hl
    inc hl
    ld a, [hl+]
    bit 4, b
    jr z, jr_000_04fd

    sub $60
    bit 3, b
    jr z, jr_000_04fd

    sub $60

jr_000_04fd:
    ld c, a
    ld de, $c768

jr_000_0501:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_000_0501

    xor a
    ld [de], a
    ld hl, $c500
    ld de, $c600
    rst $08
    ld h, h
    ret


    ld hl, $c500
    ld a, [hl+]
    or [hl]
    ret z

    rst $10
    ld b, $00
    rst $10
    adc $ff
    ret


    scf
    ret


    rst $10
    ld b, $00
    rst $10
    add b
    nop
    ret


    xor a
    ld [$c7b9], a
    ld a, $03
    ld [$c764], a
    ld hl, $c700
    ld bc, $0058
    ld e, $20
    rst $08
    and [hl]
    ld hl, $c791
    ld bc, $0028
    ld e, $20
    rst $08
    and [hl]
    xor a
    ld [$c769], a
    ld de, $c700
    rst $08
    ld d, c
    ret


    ld a, $e4
    ldh [$9d], a
    ld a, $07
    ldh [$a0], a
    ld a, $70
    ldh [$9f], a
    ld a, [$c766]
    ldh [$9b], a
    ld a, [$c767]
    ldh [$9a], a
    rst $10
    ld b, $00
    rst $10
    jr nc, jr_000_056b

jr_000_056b:
    ret


    rst $10
    ld b, $00
    rst $10
    cp l
    db $fc
    ret


    rst $10
    ld a, [hl+]
    ld bc, $21d1
    db $10
    sub b
    ld bc, $0030
    rst $08
    ld [bc], a
    rst $10
    ld e, [hl]
    ld bc, $21d1
    nop
    add b
    ld bc, $0010
    rst $08
    ld [bc], a
    rst $10
    adc c
    nop
    pop hl
    rst $08
    ld e, h
    rst $10
    ld b, $00
    rst $10
    adc $fd
    ret


    ret


    ld hl, $9100
    ld de, $c600
    ld bc, $0100
    rst $08
    ld [bc], a
    ret


    xor a
    ld [$c766], a
    ld [$c767], a
    ldh [$9b], a
    ldh [$9a], a
    ld [$c761], a
    ld [$c762], a
    ld [$c765], a
    ld hl, $c600
    ld bc, $0100
    ld e, $00
    rst $08
    and [hl]
    ret


    rst $10
    ld b, $00
    rst $10
    dec a
    nop
    ret


    ld h, $04
    rst $08
    jp z, $25d7

    nop
    pop de
    ld hl, $9040
    ld bc, $0010
    rst $08
    ld [bc], a
    ld de, $0205
    ld bc, $1006
    rst $08
    ld e, b
    ld de, $0200
    ld bc, $1003
    rst $08
    ld e, b
    rst $10
    ld l, d
    nop
    pop hl
    ld de, $8001
    rst $08
    ld e, d
    ret


    add b
    add b
    ldh [$e0], a
    ld hl, sp-$08
    cp $fe
    ld hl, sp-$02
    ldh [$f8], a
    add b
    ldh [rP1], a
    add b
    ld bc, $2800
    rst $08
    call nz, $0021
    sbc b
    ld bc, $0400
    ld e, $7f
    rst $08
    and [hl]
    ret


    nop
    jr nz, jr_000_0645

    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    nop
    nop
    ld hl, $7020
    ld [hl], e
    db $76
    ld a, c
    jr nz, @+$4b

    ld b, e
    ld c, a
    ld c, [hl]
    jr nz, @+$47

    ld b, h
    ld c, c
    ld d, h
    nop
    nop
    ld [hl+], a
    jr nz, jr_000_06b3

    ld [hl], h
    ld [hl], a
    ld a, d

jr_000_0645:
    jr nz, jr_000_069f

    jr nz, jr_000_0686

    nop
    nop
    inc hl
    jr nz, jr_000_06c0

    ld [hl], l
    ld a, b
    and d
    jr nz, jr_000_06ac

    jr nz, jr_000_0692

    nop
    ld b, $01
    ld c, c
    ld b, e
    ld c, a
    ld c, [hl]
    jr nz, jr_000_06a3

    ld b, h
    ld c, c
    ld d, h
    nop
    dec b
    ld b, $0f
    call $bcdd
    xor l
    or e
    cp l
    reti


    nop
    dec b
    rlca
    ld c, $b1
    or d
    cp d
    db $dd
    rrca
    ret


    ld c, $be
    or b
    call z, $00de
    dec b
    ld [$bc0f], sp
    db $dd
    or a
    cp e
    cp b
    cp [hl]
    or d

jr_000_0686:
    nop
    dec b
    add hl, bc
    or l
    call c, $00d9
    rst $38
    nop
    nop
    nop
    nop

jr_000_0692:
    nop
    nop
    nop
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

jr_000_069f:
    nop
    rst $38
    nop
    rst $38

jr_000_06a3:
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop

jr_000_06ac:
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop

jr_000_06b3:
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38

jr_000_06c0:
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
    rst $38
    rst $38
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $ff00
    rst $38
    rst $38
    rst $38
    add c
    jp $c381


    add c
    jp $c381


    add c
    rst $38
    add c
    rst $38
    rst $38
    push af
    ld de, $0001
    ld bc, $1405
    rst $08
    ld e, b
    pop af
    ld de, $8001
    jr jr_000_072a

    bit 6, c
    jr z, jr_000_071d

    xor a
    rst $10
    ld b, $00
    rst $10
    rla
    nop
    ret


    xor a
    scf
    ret


    bit 7, c
    jr z, jr_000_071d

    ld a, b
    push bc
    rst $10
    ld b, $00
    rst $10
    rlca
    nop
    ret


    pop bc
    ld a, b
    scf
    ret


jr_000_071d:
    push af
    ld de, $000d
    ld bc, $1405
    rst $08
    ld e, b
    pop af
    ld de, $2001

jr_000_072a:
    add a
    ld c, a
    ld b, $00
    rst $10
    dec c
    nop
    pop hl
    add hl, bc
    ld c, [hl]
    inc hl
    ld b, [hl]
    dec hl
    add hl, bc
    rst $08
    ld e, d
    or a
    ret


    inc d
    nop
    ld d, l
    nop
    jr z, jr_000_0742

jr_000_0742:
    ld a, d
    nop
    nop
    nop
    nop
    nop
    sub c
    nop
    xor [hl]
    nop
    jp nc, $fd00

    nop
    ld bc, $0e0e
    or c
    or d
    cp d
    db $dd
    jp z, $c0df

    or b
    db $dd
    rrca
    and [hl]
    call $bcdd
    xor l
    or e
    cp h
    rst $08
    cp l
    nop
    rst $38
    ld bc, $0f0e
    cp c
    sbc $dd
    cp e
    sbc $b2
    ret


    ld c, $b1
    or d
    cp d
    db $dd
    jp z, $c0df

    or b
    db $dd
    rrca
    and [hl]
    cp c
    cp h
    jp Jump_000_0100


    rrca
    or c
    ret nz

    rst $10
    cp h
    cp b
    call $bcdd
    xor l
    or e
    cp h
    rst $08
    cp l
    nop
    rst $38
    ld bc, $0f0e
    cp c
    sbc $dd
    cp e
    sbc $b2
    ret


    ld c, $b1
    or d
    cp d
    db $dd
    jp z, $c0df

    or b
    db $dd
    rrca
    and [hl]
    nop
    ld bc, $0e0f
    call z, $b2a7
    reti


    rrca
    add $ce
    cp a
    sbc $dd
    cp h
    rst $08
    cp l
    nop
    rst $38
    ld bc, $a20e
    ld c, c
    ld b, e
    ld c, a
    ld c, [hl]
    jr nz, jr_000_080a

    ld b, h
    ld c, c
    ld d, h
    and e
    rrca

jr_000_07ca:
    and [hl]
    nop
    ld bc, $bc0f
    xor l
    or e
    ret c

    xor [hl]
    or e
    cp h
    rst $08
    cp l
    nop
    rst $38
    ld bc, $0f02
    adc $bf
    sbc $dd
    cp l
    reti


    push bc
    rst $08
    or h
    and [hl]
    add $ad
    or e
    ret c

    xor [hl]
    cp b
    cp h
    jp Jump_000_0100


    inc bc
    cp b
    ret nz

    sbc $bb
    or d
    nop
    rst $38
    ld bc, $0f02
    cp d
    ret


    push bc
    rst $08
    or h
    jp $cede


    cp a
    sbc $dd
    cp h
    jp $b2b2


jr_000_080a:
    jp $bdde


    or [hl]
    ccf
    nop
    ld bc, $ca03
    or d
    ld a, [hl-]
    ld b, c
    jr nz, jr_000_07ca

    or d
    or h
    ld a, [hl-]
    ld b, d
    nop
    rst $38
    ld bc, $0f02
    or c
    or a
    sub $b3
    ret c

    xor [hl]
    or e
    or [hl]
    sbc $c0
    ret c

    push bc
    cp b
    jp $be0e


    or b
    call z, $00de

jr_000_0835:
    ld bc, $0f03
    jp $b7de


    rst $08
    cp [hl]
    db $dd
    jp $bcde


    ret nz

    nop
    ld bc, $4f04
    ld c, e
    ld a, [hl-]
    ld b, c
    nop
    rst $38
    ld bc, $0f02
    or l
    push bc
    cp h
    sbc $c5
    rst $08
    or h
    ret


    ld c, $cc
    and a
    or d
    reti


    rrca
    or [hl]
    sbc $b1
    ret c

    rst $08
    cp l
    nop
    ld bc, $b303
    call c, $deb6
    or a
    cp h
    jp $bfce


    sbc $dd
    cp h
    jp $b2d3


    or d
    jp $bdde


    or [hl]
    ccf
    nop
    ld bc, $ca04
    or d
    ld a, [hl-]
    ld b, c
    jr nz, jr_000_0835

    or d
    or h
    ld a, [hl-]
    ld b, d
    nop
    rst $38
    rst $38

End:
