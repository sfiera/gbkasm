; Disassembly of "blackjack.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db kFileBit4 + kFileMarkerCircle + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db Points - @ - 1          ; length of variable parts of header
    db $43                     ; owner code

Title::
    dk "BLACK JACK"

Points::
    dw $0014
Author::
    db "TARKUN    ", 2
History::
    ds 11
    ds 11
    ds 11

Main::
    ld hl, $c600
    ld de, $c400
    ld bc, $0100
    rst $08
    ld [bc], a
    rst $10
    ld l, [hl]
    dec bc
    ret


    xor a
    rst $08
    inc de
    rst $08
    ld bc, $203e
    rst $08
    or e
    rst $08
    ld de, $06d7
    nop
    rst $10
    dec [hl]
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    inc hl
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    ld a, [hl-]
    nop
    ret


    ld a, $0a
    ld [$c8ce], a
    ld a, $01
    ld [$c882], a
    ld a, $03
    rst $08
    or h
    ld a, [$0014]
    cp $01
    ret nz

    ld a, $05
    rst $08
    inc de
    ret


    ld e, $00
    ld bc, $00d1
    ld hl, $c800
    rst $08
    and [hl]
    ret


    rst $10
    xor h
    ld [$21d1], sp
    nop
    rst $00
    ld b, h
    rst $08
    ld h, d
    ld bc, $0270
    ld de, $8b10
    rst $08
    ld h, e
    ret


    rst $10
    db $db
    add hl, bc
    pop hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $c8cf
    ld [hl], e
    inc hl
    ld [hl], d
    ret


    ld a, [$c88b]
    cp $00
    ret z

    ld hl, $c800
    ld bc, $0081
    ld e, $00
    rst $08
    and [hl]
    ld a, [$c883]
    ld h, a
    ld l, a
    rst $08
    adc l
    ld c, $00

jr_000_00cb:
    push bc
    rst $08
    adc [hl]
    pop bc
    and $3f
    sub $34
    jr nc, jr_000_00cb

    add $34
    ld hl, $c834
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $01
    jr z, jr_000_00cb

    ld a, $01
    ld [hl], a
    ld a, e
    ld hl, $c800
    ld d, $00
    ld e, c
    add hl, de
    push hl
    push bc
    ld d, $00
    ld e, a
    ld hl, $000d
    rst $08
    adc d
    ld a, [$c3b0]
    swap l
    or l
    pop bc
    pop hl
    inc a
    ld [hl], a
    inc c
    ld a, c
    cp $34
    jr nz, jr_000_00cb

    xor a
    ld [$c88b], a
    ret


    ld a, [$c885]
    cp $00
    ret z

    rst $10
    ld b, $00
    rst $10
    daa
    nop
    ret


    xor a
    ld [$c881], a
    ld a, [$c885]
    cp $00
    ret z

    ld hl, $0508
    rst $08
    cp b
    ld a, [$c886]
    cp $01
    jr nz, @+$09

    rst $10
    ld d, c
    ld a, [bc]
    pop hl

    db $cf, "i", $c9, $d7, "S", $0a, $e1, $cf, "i", $c9, $fa

HeaderManufacturerCode::
    db $81, $c8, $fe, $00

HeaderCGBFlag::
    db $c8

    cp $01
    jr nz, jr_000_0150

    rst $10
    ld b, $00
    rst $10
    ld h, l
    nop
    ret


    ret


jr_000_0150:
    cp $08
    jr nz, jr_000_015c

    rst $10
    ld b, $00
    rst $10
    ld e, c
    nop
    ret


    ret


jr_000_015c:
    cp $40
    jr nz, jr_000_0168

    rst $10
    ld b, $00
    rst $10
    ld b, e
    nop
    ret


    ret


jr_000_0168:
    cp $80
    jr nz, jr_000_0174

    rst $10
    ld b, $00
    rst $10
    scf
    nop
    ret


    ret


jr_000_0174:
    cp $10
    jr nz, jr_000_0180

    rst $10
    ld b, $00
    rst $10
    dec hl
    nop
    ret


    ret


jr_000_0180:
    cp $20
    jr nz, jr_000_018c

    rst $10
    ld b, $00
    rst $10
    rra
    nop
    ret


    ret


jr_000_018c:
    cp $02
    ret nz

    xor a
    ld [$c885], a
    ld [$c886], a
    ld a, $01
    ld [$c887], a
    ld hl, $0008
    rst $08
    cp b
    rst $10
    xor e
    add hl, bc
    pop hl
    rst $08
    ld l, c
    ret


    ld a, [$c886]
    dec a
    and $01
    ld [$c886], a
    ret


    xor a
    ld [$c885], a
    ld a, $01
    ld [$c887], a
    ld hl, $0008
    rst $08
    cp b
    rst $10
    adc h
    add hl, bc
    pop hl
    rst $08
    ld l, c
    ld a, [$0014]
    cp $01
    ret nz

    ld a, $01
    rst $08
    inc d
    ret


    ld l, c
    ld h, b
    rst $08
    cp b
    ld hl, $c8ba
    ld a, e
    bit 7, a
    jr nz, jr_000_01fe

    ld a, $d1
    ld [hl+], a
    inc a
    ld [hl+], a
    ld a, $03
    ld [hl+], a
    ld a, $02
    ld [hl+], a
    ld [hl+], a
    ld a, $b1
    ld [hl+], a
    ld a, $b2
    ld [hl+], a
    ld a, $03
    ld [hl+], a
    ld a, $02
    ld [hl+], a
    ld [hl+], a
    ld a, $d3
    ld [hl+], a
    inc a
    ld [hl+], a
    xor a
    ld [hl], a
    jr jr_000_022d

jr_000_01fe:
    srl a
    srl a
    srl a
    srl a
    and $03
    add $cd
    ld [hl+], a
    ld a, $d5
    ld [hl+], a
    ld a, $03
    ld [hl+], a
    ld a, $02
    ld [hl+], a
    ld [hl+], a
    ld a, e
    and $0f
    sla a
    add $b1
    ld [hl+], a
    inc a
    ld [hl+], a
    ld a, $03
    ld [hl+], a
    ld a, $02
    ld [hl+], a
    ld [hl+], a
    ld a, $d6
    ld [hl+], a
    inc a
    ld [hl+], a
    xor a
    ld [hl], a

jr_000_022d:
    ld hl, $c8ba
    rst $08
    ld l, c
    ret


    ld hl, $0001
    rst $08
    cp b
    rst $10
    sub b
    ld [$cfe1], sp
    ld l, c
    ld hl, $000d
    rst $08
    cp b
    rst $10
    add l
    ld [$cfe1], sp
    ld l, c
    ret


    rst $10
    ld b, $00
    rst $10
    ld [de], a
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    dec bc
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    ld [hl], h
    rst $38
    ret


    ret


    push af
    push bc
    push de
    push hl
    rst $10
    ld b, $00
    rst $10
    ld l, b
    rst $38
    ret


    ld a, $05
    rst $08
    call c, $d1e1
    pop bc
    pop af
    ld hl, $0000
    ld l, c
    rst $08
    cp b
    rst $10
    jp nc, $e108

    push af
    push bc
    push de
    push hl
    rst $08
    ld l, c
    pop hl
    pop de
    pop bc
    pop af
    inc c
    ret


    ld a, [$c884]
    cp $00
    ret z

    rst $10
    ld b, $00
    rst $10
    ld a, a
    nop
    ret


    xor a
    ld [$c887], a
    ld [$c881], a
    ld a, $01
    ld [$c886], a
    ld a, [$c8ce]
    cp $63
    jr c, jr_000_02ae

    ld hl, $0c09
    jr jr_000_02b1

jr_000_02ae:
    ld hl, $0d09

jr_000_02b1:
    rst $08
    cp b
    ld a, [$c8ce]
    ld e, a
    ld d, $00
    ld hl, $c8c7
    rst $08
    and e
    rst $08
    ld l, c
    rst $10
    jp nz, $e107

    rst $08
    ld l, c
    ld hl, $0309
    rst $08
    cp b
    rst $10
    add $07
    pop hl
    rst $08
    ld l, c
    ld hl, $030a
    rst $08
    cp b
    rst $10
    and b
    rlca
    pop hl
    rst $08
    ld l, c
    ld a, [$c8cf]
    ld e, a
    ld a, [$c8d0]
    ld d, a
    ld hl, $c8c7
    rst $08
    and e
    rst $08
    ld l, c
    rst $10
    sub a
    rlca
    pop hl
    rst $08
    ld l, c
    ld hl, $0507
    rst $08
    cp b
    rst $10
    ld b, $00
    rst $10
    db $f4
    ld [bc], a
    ret


    cp $00
    jr nz, jr_000_0308

    rst $10
    add l
    rlca
    pop hl
    rst $08
    ld l, c
    ret


jr_000_0308:
    cp $0f
    ret nz

    rst $10
    ld b, b
    ld [$cfe1], sp
    ld l, c
    ret


    ld a, [$c881]
    cp $00
    ret z

    cp $01
    jr nz, jr_000_0324

    rst $10
    ld b, $00
    rst $10
    ccf
    nop
    ret


    ret


jr_000_0324:
    cp $08
    jr nz, jr_000_0330

    rst $10
    ld b, $00
    rst $10
    inc sp
    nop
    ret


    ret


jr_000_0330:
    cp $40
    jr nz, jr_000_033c

    rst $10
    ld b, $00
    rst $10
    ld l, l
    nop
    ret


    ret


jr_000_033c:
    cp $80
    jr nz, jr_000_0348

    rst $10
    ld b, $00
    rst $10
    ld c, d
    nop
    ret


    ret


jr_000_0348:
    cp $10
    jr nz, jr_000_0354

    rst $10
    ld b, $00
    rst $10
    ld a, $00
    ret


    ret


jr_000_0354:
    cp $20
    ret nz

    rst $10
    ld b, $00
    rst $10
    ld c, d
    nop
    ret


    ret


    xor a
    ld [$c88f], a
    ld [$c884], a
    ld a, $01
    ld [$c889], a
    ld a, [$0014]
    cp $01
    jr nz, jr_000_0376

    ld a, $01
    rst $08
    inc d

jr_000_0376:
    ld a, [$c8cf]
    ld l, a
    ld a, [$c8d0]
    ld h, a
    ld a, [$c8ce]
    ld e, a
    ld d, $00
    push hl
    rst $08
    adc b
    pop hl
    ret c

    ld a, l
    ld [$c8ce], a
    ret


    ld a, [$c8ce]
    sub $0a
    ret c

    ret z

    ld [$c8ce], a
    ld a, [$0014]
    cp $01
    jr nz, jr_000_03bb

    ld a, $02
    rst $08
    inc d
    jr jr_000_03bb

    ld a, [$c8ce]
    add $0a
    cp $65
    ret nc

    ld [$c8ce], a
    ld a, [$0014]
    cp $01
    jr nz, jr_000_03bb

    ld a, $02
    rst $08
    inc d

jr_000_03bb:
    ld a, [$c8cf]
    ld l, a
    ld a, [$c8d0]
    ld h, a
    ld a, [$c8ce]
    ld e, a
    ld d, $00
    push hl
    rst $08
    adc b
    pop hl
    ret c

    ld a, l
    ld [$c8ce], a
    ret


    ld a, [$c889]
    cp $00
    ret z

    xor a
    ld [$c889], a
    ld a, $01
    ld [$c88a], a
    rst $10
    ld b, $00
    rst $10
    ld a, $01
    ret


    rst $10
    ld b, $00
    rst $10
    jp nc, $c900

    rst $10
    ld b, $00
    rst $10
    jr nc, jr_000_03f7

    ret


jr_000_03f7:
    rst $10
    ld b, $00
    rst $10
    call nz, $c900
    rst $10
    ld b, $00
    rst $10
    dec [hl]
    ld [bc], a
    ret


    cp $15
    jr z, jr_000_0420

    rst $10
    ld b, $00
    rst $10
    adc a
    ld [bc], a
    ret


    cp $01
    ret nz

    xor a
    ld [$c88a], a
    ld a, $01
    ld [$c886], a
    ld [$c88c], a
    ret


jr_000_0420:
    ld hl, $0501
    rst $08
    cp b
    rst $10
    add hl, sp
    ld b, $e1
    rst $08
    ld l, c
    xor a
    ld [$c88a], a
    ld a, $01
    ld [$c886], a
    ld [$c88c], a
    ret


    ld a, [$c88a]
    cp $00
    ret z

    ld a, $01
    ld [$c885], a
    ld hl, $0507
    rst $08
    cp b
    rst $10
    ld b, $00
    rst $10
    and d
    ld bc, $fec9
    nop
    jr nz, jr_000_045d

    rst $10
    ld e, a
    ld b, $e1
    rst $08
    ld l, c
    rst $10
    dec c
    nop
    ret


jr_000_045d:
    cp $0f
    jr nz, jr_000_0467

    rst $10
    ld [$e106], a
    rst $08
    ld l, c

jr_000_0467:
    ld a, [$c887]
    cp $00
    jr z, jr_000_04ba

    ld a, [$c886]
    cp $00
    jr nz, jr_000_0485

    xor a
    ld [$c885], a
    ld [$c88a], a
    ld a, $01
    ld [$c88c], a
    ld [$c886], a
    ret


jr_000_0485:
    rst $10
    ld b, $00
    rst $10
    sbc e
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    cp b
    ld bc, $fec9
    ld d, $38
    ld [bc], a
    jr nc, jr_000_049f

    cp $15
    jr nz, jr_000_04ba

    jr jr_000_04aa

jr_000_049f:
    ld hl, $0610
    rst $08
    cp b
    rst $10
    rst $28
    ld b, $e1
    rst $08
    ld l, c

jr_000_04aa:
    xor a
    ld [$c88a], a
    ld [$c885], a
    ld a, $01
    ld [$c88c], a
    ld [$c886], a
    ret


jr_000_04ba:
    xor a
    ld [$c887], a
    ret


    ld a, [$c86c]
    cp $00
    jr nz, jr_000_04f2

    ld hl, $c877
    push hl
    ld a, [$c868]
    ld d, $00
    ld e, a
    inc a
    ld [$c868], a
    ld hl, $c800
    add hl, de
    ld a, [hl]
    pop hl
    ld [hl], a
    ld e, a
    ld bc, $0100
    inc b
    inc b
    inc b
    inc b
    rst $10
    ld b, $00
    rst $10
    ld h, e
    db $fd
    ret


    ld a, [$c86c]
    inc a
    ld [$c86c], a
    ret


jr_000_04f2:
    ld d, $00
    ld e, a
    sla a
    add $05
    ld b, a
    ld hl, $c877
    add hl, de
    push hl
    ld a, [$c868]
    ld d, $00
    ld e, a
    inc a
    ld [$c868], a
    ld hl, $c800
    add hl, de
    ld a, [hl]
    pop hl
    ld [hl], a
    or $80
    ld e, a
    ld c, $00
    rst $10
    ld b, $00
    rst $10
    ld sp, $c9fd
    ld a, [$c86c]
    inc a
    ld [$c86c], a
    ret


    ld a, [$c86b]
    ld d, $00
    ld e, a
    sla a
    add $05
    ld b, a
    ld hl, $c86d
    add hl, de
    push hl
    ld a, [$c868]
    ld d, $00
    ld e, a
    inc a
    ld [$c868], a
    ld hl, $c800
    add hl, de
    ld a, [hl]
    ld h, a
    and $0f
    ld l, a
    ld a, [$c891]
    sub l
    jr nz, jr_000_0552

    pop hl
    rst $10
    push de
    rst $38
    ret


jr_000_0552:
    ld a, l
    ld [$c891], a
    ld a, h
    pop hl
    ld [hl], a
    or $80
    ld e, a
    ld c, $0b
    rst $10
    ld b, $00
    rst $10
    add sp, -$04
    ret


    ld a, [$c86b]
    inc a
    ld [$c86b], a
    rst $10
    ld b, $00
    rst $10
    ret c

    nop
    ret


    ld e, a
    ld d, $00
    ld hl, $c8c7
    rst $08
    and e
    rst $08
    ld l, c
    ret


    ld a, [$c882]
    cp $00
    ret z

    ld a, [$c881]
    cp $01
    jr nz, jr_000_05b7

    xor a
    ld [$c882], a
    ld [$c881], a
    ld a, $01
    ld [$c884], a
    ld [$c88b], a
    ld hl, $0507
    rst $08
    cp b
    rst $10
    rst $20
    inc b
    pop hl
    rst $08
    ld l, c
    rst $10
    ld b, $00
    rst $10
    adc d
    db $fc
    ret


    ld a, [$0014]
    cp $01
    ret nz

    ld a, $01
    rst $08
    inc d
    ret


jr_000_05b7:
    ld hl, $0507
    rst $08
    cp b
    rst $10
    and d
    inc b
    pop hl
    rst $08
    ld l, c
    ld hl, $000d
    rst $08
    cp b
    rst $10
    ld d, e
    dec b
    pop hl
    rst $08
    ld l, c
    ld hl, $0409
    rst $08
    cp b
    rst $10
    ld b, $00
    rst $10
    jr jr_000_05d8

jr_000_05d8:
    ret


    cp $00
    jr nz, jr_000_05e4

    rst $10
    adc h
    inc b
    pop hl
    rst $08
    ld l, c
    ret


jr_000_05e4:
    cp $0f
    ret nz

    rst $10
    ld h, h
    dec b
    pop hl
    rst $08
    ld l, c
    ret


    ld a, [$c883]
    ld d, $00
    ld e, a
    ld hl, $0019
    rst $08
    adc d
    ld a, [$c3b0]
    ret


    ld a, [$c882]
    cp $00
    jr z, @+$06

    rst $10
    ld c, b
    ld a, [$fac9]
    add h
    ret z

    cp $00
    ret z

    rst $10
    xor c
    dec b
    ret


    ret


jr_000_0613:
    rst $10
    ld b, $00
    rst $10
    jr nz, jr_000_0619

jr_000_0619:
    ret


    cp $11
    ret nc

    rst $10
    ld b, $00
    rst $10
    sbc [hl]
    cp $c9
    rst $10
    ld b, $00
    rst $10
    rrca
    nop
    ret


    ld e, a
    ld d, $00
    ld hl, $c8c7
    rst $08
    and e
    rst $08
    ld l, c
    jr jr_000_0613

    ld a, [$c86c]
    ld hl, $c877
    rst $10
    ld b, $00
    rst $10
    jr jr_000_0643

jr_000_0643:
    ret


    ld [$c86a], a
    ret


    ld a, [$c86b]
    ld hl, $c86d
    rst $10
    ld b, $00
    rst $10
    rlca
    nop
    ret


    ld [$c869], a
    ret


    ld c, a
    xor a
    ld d, a

jr_000_065c:
    push af
    ld b, a
    ld a, [hl+]
    and $0f
    cp $01
    jr nz, jr_000_066c

    pop af
    inc d
    dec c
    jr z, jr_000_0678

    jr jr_000_065c

jr_000_066c:
    cp $0a
    jr c, jr_000_0672

    ld a, $0a

jr_000_0672:
    ld b, a
    pop af
    add b
    dec c
    jr nz, jr_000_065c

jr_000_0678:
    rst $10
    ld b, $00
    rst $10
    inc b
    nop
    ret


    ret


    ld b, a
    ld a, d
    cp $00
    jr z, jr_000_068d

    ld a, b
    add d
    cp $16
    jr c, jr_000_068f

    ret


jr_000_068d:
    ld a, b
    ret


jr_000_068f:
    add $0a
    cp $16
    jr nc, jr_000_0699

    dec d
    jr nz, jr_000_068f

    ret


jr_000_0699:
    sub $0a
    ret


    rst $10
    ld b, $00
    rst $10
    xor b
    rst $38
    ret


    cp $15
    jr nz, jr_000_06be

    ld a, $01
    ld [$c88f], a
    xor a
    ld [$c886], a
    ld hl, $0510
    rst $08
    cp b
    rst $10
    xor c
    inc bc
    pop hl
    rst $08
    ld l, c
    ld a, $01
    ret


jr_000_06be:
    xor a
    ret


    ld a, [$c88c]
    cp $00
    ret z

    ld a, $01
    ld [$c88e], a
    xor a
    ld [$c88c], a
    rst $10
    ld b, $00
    rst $10
    ld [hl], l
    rst $38
    ret


    ld a, [$c877]
    or $80
    ld e, a
    ld bc, $0502
    rst $10
    ld b, $00
    rst $10
    db $ed
    ld a, [$21c9]
    inc b
    add hl, bc
    rst $08
    cp b
    rst $10
    ld b, $00
    rst $10
    ld c, b
    rst $38
    ret


    ld e, a
    ld d, $00
    ld hl, $c8c7
    rst $08
    and e
    rst $08
    ld l, c
    rst $10
    ld b, $00
    rst $10
    inc de
    rst $38
    ret


    rst $10
    ld b, $00
    rst $10
    ld b, c
    rst $38
    ret


    cp $16
    jr nc, @+$13

    ld b, a
    ld a, [$c86a]
    cp $16
    jr nc, jr_000_0723

    sub b
    jr c, jr_000_0723

    jr nz, jr_000_079a

    rst $10
    ld a, [de]
    ld bc, $d7c9
    ld a, d
    nop
    ret


jr_000_0723:
    ld a, [$0014]
    cp $01
    jr nz, jr_000_072e

    ld a, $37
    rst $08
    inc d

jr_000_072e:
    ld a, $01
    ld [$c88d], a
    ld hl, $0506
    rst $08
    cp b
    rst $10
    jr z, @+$06

    pop hl
    rst $08
    ld l, c
    ld a, [$c88f]
    cp $01
    jr nz, jr_000_074e

    ld a, [$c8ce]
    ld b, a
    sra a
    add b
    jr jr_000_0751

jr_000_074e:
    ld a, [$c8ce]

jr_000_0751:
    ld h, $00
    ld l, a
    push hl
    push af
    cp $63
    jr c, jr_000_075f

    ld hl, $0c09
    jr jr_000_0762

jr_000_075f:
    ld hl, $0d09

jr_000_0762:
    rst $08
    cp b
    pop af
    ld e, a
    ld d, $00
    ld hl, $c8c7
    rst $08
    and e
    rst $08
    ld l, c
    rst $10
    inc de
    inc bc
    pop hl
    rst $08
    ld l, c
    ld hl, $0309
    rst $08
    cp b
    rst $10
    ld [hl+], a
    inc bc
    pop hl
    rst $08
    ld l, c
    pop hl
    ld a, [$c8cf]
    ld e, a
    ld a, [$c8d0]
    ld d, a
    add hl, de
    ld a, h
    ld [$c8d0], a
    ld a, l
    ld [$c8cf], a
    rst $10
    ld b, $00
    rst $10
    jp nc, $c900

    ret


jr_000_079a:
    ld a, [$0014]
    cp $01
    jr nz, jr_000_07a5

    ld a, $2f
    rst $08
    inc d

jr_000_07a5:
    xor a
    ld [$c88d], a
    ld hl, $0009
    rst $08
    cp b
    rst $10
    sbc l
    inc bc
    pop hl
    rst $08
    ld l, c
    ld hl, $0506
    rst $08
    cp b
    rst $10
    or d
    inc bc
    pop hl
    rst $08
    ld l, c
    ld a, [$c8ce]
    ld h, $00
    ld l, a
    ld a, [$c8cf]
    ld e, a
    ld a, [$c8d0]
    ld d, a
    rst $08
    adc b
    ld a, h
    cp $ff
    jr nc, jr_000_07ee

    ld [$c8d0], a
    and $80
    jr nz, jr_000_07e2

    ld a, l
    ld [$c8cf], a
    or h
    jr z, jr_000_07ee

jr_000_07e2:
    ld a, l
    ld [$c8cf], a
    rst $10
    ld b, $00
    rst $10
    ld a, [hl]
    nop
    ret


    ret


jr_000_07ee:
    rst $10
    ld b, $00
    rst $10
    db $76, $00
    ret


    ld a, $78
    rst $08
    call c, $783e
    rst $08
    call c, $14fa
    nop
    cp $01
    jr nz, jr_000_0808

    ld a, $19
    rst $08
    inc de

jr_000_0808:
    xor a
    rst $08
    or e
    ld hl, $0409
    rst $08
    cp b
    rst $10
    adc h
    inc bc
    pop hl
    rst $08
    ld l, c
    ld hl, $040b
    rst $08
    cp b
    rst $10
    adc [hl]
    inc bc
    pop hl
    rst $08
    ld l, c
    ld hl, $c600
    rst $08
    rst $28
    ld a, $78
    rst $08
    call c, $783e
    rst $08
    call c, $783e
    rst $08
    call c, $1ad7
    ld hl, sp-$37
    ld a, [$c88f]
    cp $01
    jr nz, jr_000_0841

    rst $10
    push hl
    cp $c9

jr_000_0841:
    ld a, [$0014]
    cp $01
    jr nz, jr_000_084c

    ld a, $2f
    rst $08
    inc d

jr_000_084c:
    ld a, $02
    ld [$c88d], a
    ld hl, $0009
    rst $08
    cp b
    rst $10
    push af
    ld [bc], a
    pop hl
    rst $08
    ld l, c
    ld hl, $0506
    rst $08
    cp b
    rst $10
    dec d
    inc bc
    pop hl
    rst $08
    ld l, c
    ret


    ld a, $0a
    ld [$0000], a
    ld bc, $0002
    ld de, $c8cf
    rst $10
    inc c
    ld [bc], a
    pop hl
    rst $08
    ld [bc], a
    xor a
    ld [$0000], a
    ld hl, $030a
    rst $08
    cp b
    rst $10
    db $f4
    ld bc, $cfe1
    ld l, c
    ld a, [$c8cf]
    ld e, a
    ld a, [$c8d0]
    ld d, a
    ld hl, $c8c7
    rst $08
    and e
    rst $08
    ld l, c
    rst $10
    db $eb
    ld bc, $cfe1
    ld l, c
    ret


    ld a, [$c88e]
    cp $00
    ret z

    ld hl, $0506
    rst $08
    cp b
    rst $10
    ld b, $00
    rst $10
    ld b, c
    db $fd
    ret


    cp $00
    jr nz, jr_000_08d5

    ld a, [$c88d]
    cp $00
    jr z, jr_000_08c7

    cp $02
    jr z, jr_000_08cf

    rst $10
    and c
    ld [bc], a
    pop hl
    rst $08
    ld l, c
    jr jr_000_08df

jr_000_08c7:
    rst $10
    and h
    ld [bc], a
    pop hl
    rst $08
    ld l, c
    jr jr_000_08df

jr_000_08cf:
    rst $10
    and a
    ld [bc], a
    pop hl
    rst $08
    ld l, c

jr_000_08d5:
    cp $0f
    jr nz, jr_000_08df

    rst $10
    ld [hl], d
    ld [bc], a
    pop hl
    rst $08
    ld l, c

jr_000_08df:
    ld hl, $0507
    rst $08
    cp b
    rst $10
    reti


    ld bc, $cfe1
    ld l, c
    ld a, $01
    ld [$c885], a
    ld a, [$c887]
    cp $00
    ret z

    ld a, [$c886]
    cp $00
    jr z, jr_000_093a

    ld [$c884], a
    xor a
    ld [$c885], a
    ld [$c88e], a
    ld a, [$c868]
    cp $0d
    jr c, jr_000_0912

    ld a, $01
    ld [$c88b], a

jr_000_0912:
    ld e, $00
    ld bc, $0018
    ld hl, $c869
    rst $08
    and [hl]
    ld hl, $0506
    rst $08
    cp b
    rst $10
    ld a, [hl+]
    ld [bc], a
    pop hl
    rst $08
    ld l, c
    ld hl, $0507
    rst $08
    cp b
    rst $10
    ld e, d
    ld bc, $cfe1
    ld l, c
    rst $10
    ld b, $00
    rst $10
    db $fd
    ld hl, sp-$37
    ret


jr_000_093a:
    rst $10
    ld a, l
    ld [bc], a
    ret


    rst $30
    nop
    sub l
    nop
    xor d
    rst $28
    xor e
    ld bc, $0155
    cp a
    xor c
    rst $38
    add c
    inc bc
    add e
    ld b, $86
    ld c, $e7
    adc [hl]
    rrca
    adc a
    dec d
    nop
    dec d
    ld e, $9e
    add c
    rst $38
    add c
    pop bc
    pop bc
    ld h, c
    ld h, c
    ld [hl], c
    ld [hl], c
    pop af
    sbc [hl]
    pop af
    dec h
    nop
    dec h
    ld a, c
    ld a, c
    rlca
    add a
    add hl, de
    inc h
    call z, $8000
    cpl
    rla
    ld [bc], a
    pop hl
    pop hl
    add hl, hl
    ccf
    nop
    ld b, b
    rra
    ld sp, $1049
    daa
    cpl
    jr nz, jr_000_09b8

    rrca
    nop
    dec [hl]
    nop
    dec [hl]
    nop
    dec d
    cpl
    ld b, $3f
    add hl, hl
    ld [hl+], a
    ld b, e
    rrca
    ld h, d
    dec d
    nop
    ld d, a
    jr nz, jr_000_09d6

    ld a, a
    ld h, b
    daa
    ld a, a
    inc h

jr_000_099c:
    rla
    ld a, c
    ld [hl+], a
    add hl, de
    ld b, b
    ld e, l
    ld hl, $a101
    ld h, l
    add [hl]
    scf
    add hl, de
    ld h, $5b
    and e
    and d
    nop
    rla
    ld d, a
    ld [hl+], a
    ld d, e
    reti


    inc h
    daa
    ld a, a
    jr nz, jr_000_09d9

jr_000_09b8:
    jp hl


    inc h
    nop
    cpl
    cpl
    ld c, a
    ld e, e
    xor h
    ld [hl], d
    ei
    ld e, c
    and b
    db $e3
    rst $18
    ld h, [hl]
    db $fd
    inc c
    adc h
    dec e
    sbc l
    dec c
    adc l
    inc sp
    ld e, $a0
    sbc [hl]
    adc c
    add hl, bc
    sbc c
    ld b, c

jr_000_09d6:
    adc c
    nop
    rla

jr_000_09d9:
    reti


    ld b, b
    db $dd
    ld b, $33
    nop
    adc a
    db $fd
    inc h
    jp hl


    jp hl


    ld b, [hl]
    add c
    add c
    push af
    ld sp, $c6f7
    dec h
    jp hl


    jp hl


    ld e, e
    jr z, @-$6d

    or l
    ld [bc], a
    or c
    add e
    or c
    db $e3
    db $ed
    nop
    push hl
    rst $18
    jr nz, jr_000_099c

    nop
    ccf
    rst $38
    nop
    ld c, b
    nop
    sbc h
    nop
    cp [hl]
    nop
    rst $38
    cpl
    or l
    db $10
    or h
    adc b
    xor a
    nop
    inc e
    ld e, h
    ld a, $be
    rst $18
    ld a, a
    rst $38
    push bc
    ld l, e
    db $eb
    ld [$1c88], sp
    inc hl
    or h
    nop
    or b
    ld d, h
    or l
    inc d
    call nc, $30bc
    ld [$6348], sp
    call $aa2a
    push bc
    nop
    push hl
    bit 2, a
    ld b, b
    nop
    rst $28
    sub l
    nop
    xor d
    di
    db $fc
    nop
    ld [bc], a
    ld bc, $51f9
    ld bc, $01a9
    ld d, l
    dec b
    ld c, c
    di
    adc d
    ld h, a
    pop af
    ld b, $3f
    ccf
    rlca
    rlca
    jr nz, jr_000_0a51

    ld [bc], a
    db $fc

jr_000_0a51:
    jr jr_000_0a53

jr_000_0a53:
    nop
    add hl, hl
    inc sp
    nop
    add b
    ccf
    sub d
    inc e
    inc sp
    sub d
    nop
    dec hl
    ld b, d
    ld c, h
    ld b, c
    ld b, e
    ld c, e
    jr nz, @+$4c

    ld b, c
    ld b, e
    ld c, e
    nop
    ld d, b
    ld d, l
    ld d, e
    ld c, b
    jr nz, jr_000_0ab1

    jr nz, jr_000_0ac5

    ld d, h
    ld b, c
    ld d, d
    ld d, h
    nop
    ld d, b
    ld c, h
    ld b, c
    ld e, c
    ld b, l
    ld d, d
    jr nz, jr_000_0a9f

    nop
    cp b
    dec bc
    nop
    ld d, b
    jr nz, jr_000_0aa6

    nop
    ld d, b
    ld c, h
    ld b, l
    ld b, c
    ld d, e
    ld b, l
    jr nz, jr_000_0ad1

    ld b, l
    ld d, h
    nop
    ld b, d
    ld b, l
    ld d, h
    jr nz, jr_000_0ae7

    ld c, a
    ld c, c
    ld c, [hl]
    ld d, h
    jr nz, jr_000_0a9d

jr_000_0a9d:
    ld b, a
    ld b, l

jr_000_0a9f:
    ld d, h
    jr nz, @+$52

    ld c, a
    ld c, c
    ld c, [hl]
    ld d, h

jr_000_0aa6:
    jr nz, jr_000_0aa8

jr_000_0aa8:
    jr nz, @+$22

    jr nz, jr_000_0afb

    ld c, e
    jr nz, @+$41

    jr nz, jr_000_0ad1

jr_000_0ab1:
    jr nz, jr_000_0ab3

jr_000_0ab3:
    ld c, b
    ld c, c
    ld d, h
    jr nz, jr_000_0afb

    ld b, c
    ld d, d
    ld b, h
    jr nz, @+$41

    nop
    jr nz, @+$22

    ld d, d
    ld b, l
    ld d, h
    ld d, d
    ld e, c

jr_000_0ac5:
    ccf
    jr nz, @+$22

    nop
    jr nz, jr_000_0aeb

    jr nz, jr_000_0aed

    jr nz, jr_000_0aef

    jr nz, jr_000_0af1

jr_000_0ad1:
    jr nz, jr_000_0af3

    jr nz, jr_000_0af5

    jr nz, jr_000_0af7

    jr nz, jr_000_0af9

    jr nz, jr_000_0afb

    jr nz, jr_000_0afd

    jr nz, jr_000_0aff

    jr nz, jr_000_0b01

    jr nz, jr_000_0b03

    jr nz, jr_000_0b05

    jr nz, jr_000_0b07

jr_000_0ae7:
    jr nz, jr_000_0b09

    jr nz, jr_000_0b0b

jr_000_0aeb:
    jr nz, jr_000_0b0d

jr_000_0aed:
    jr nz, jr_000_0b0f

jr_000_0aef:
    jr nz, jr_000_0b11

jr_000_0af1:
    jr nz, jr_000_0b13

jr_000_0af3:
    jr nz, jr_000_0b15

jr_000_0af5:
    jr nz, jr_000_0b17

jr_000_0af7:
    jr nz, jr_000_0b19

jr_000_0af9:
    jr nz, jr_000_0b1b

jr_000_0afb:
    jr nz, jr_000_0b1d

jr_000_0afd:
    jr nz, jr_000_0b1f

jr_000_0aff:
    jr nz, @+$22

jr_000_0b01:
    jr nz, @+$22

jr_000_0b03:
    jr nz, jr_000_0b25

jr_000_0b05:
    jr nz, @+$22

jr_000_0b07:
    jr nz, jr_000_0b29

jr_000_0b09:
    jr nz, jr_000_0b2b

jr_000_0b0b:
    jr nz, @+$22

jr_000_0b0d:
    jr nz, @+$22

jr_000_0b0f:
    jr nz, jr_000_0b31

jr_000_0b11:
    jr nz, jr_000_0b33

jr_000_0b13:
    jr nz, jr_000_0b35

jr_000_0b15:
    jr nz, jr_000_0b37

jr_000_0b17:
    jr nz, jr_000_0b39

jr_000_0b19:
    jr nz, jr_000_0b1b

jr_000_0b1b:
    jr nz, @+$22

jr_000_0b1d:
    jr nz, @+$22

jr_000_0b1f:
    dec hl
    jr nz, @+$2f

    ld a, $20
    ld d, l

jr_000_0b25:
    ld d, b
    jr nz, jr_000_0b6c

    ld c, a

jr_000_0b29:
    ld d, a
    ld c, [hl]

jr_000_0b2b:
    dec c
    jr nz, jr_000_0b4e

    jr nz, jr_000_0b50

    ld b, c

jr_000_0b31:
    jr nz, jr_000_0b60

jr_000_0b33:
    ld a, $20

jr_000_0b35:
    ld c, a
    ld c, e

jr_000_0b37:
    jr nz, @+$4a

jr_000_0b39:
    ld c, c
    ld d, h
    dec c
    jr nz, jr_000_0b5e

    jr nz, jr_000_0b60

    ld b, d
    jr nz, jr_000_0b70

    ld a, $20
    ld b, e
    ld b, c
    ld c, [hl]
    ld b, e
    ld b, l
    ld c, h
    nop
    jr nz, jr_000_0b6e

jr_000_0b4e:
    jr nz, jr_000_0b70

jr_000_0b50:
    jr nz, jr_000_0b72

    jr nz, jr_000_0b74

    jr nz, @+$22

    jr nz, jr_000_0b78

    jr nz, jr_000_0b7a

    jr nz, @+$22

    jr nz, jr_000_0b7e

jr_000_0b5e:
    jr nz, jr_000_0b80

jr_000_0b60:
    nop
    jr nz, jr_000_0bbc

    ld c, a
    ld d, l
    jr nz, jr_000_0bbe

    ld c, c
    ld c, [hl]
    ld hl, $0020

jr_000_0b6c:
    jr nz, jr_000_0bc7

jr_000_0b6e:
    ld c, a
    ld d, l

jr_000_0b70:
    jr nz, jr_000_0bbe

jr_000_0b72:
    ld c, a
    ld d, e

jr_000_0b74:
    ld d, h
    jr nz, jr_000_0b77

jr_000_0b77:
    ld b, h

jr_000_0b78:
    ld d, d
    ld b, c

jr_000_0b7a:
    ld d, a
    jr nz, @+$49

    ld b, c

jr_000_0b7e:
    ld c, l
    ld b, l

jr_000_0b80:
    ld hl, $3e00
    ld e, c
    ld b, l
    ld d, e
    jr nz, @+$22

    ld c, [hl]
    ld c, a
    nop
    jr nz, jr_000_0be6

    ld b, l
    ld d, e
    jr nz, jr_000_0bcf

    ld c, [hl]
    ld c, a
    nop
    jr nz, jr_000_0bd8

    ld d, l
    ld d, d
    ld d, e
    ld d, h
    ld hl, $0020
    jr nz, jr_000_0b50

    push bc
    ret nz

    jr nz, jr_000_0b6c

    jr nz, jr_000_0b74

    cp c
    jp $bdde


    nop
    cp d
    ret


    cp c
    sbc $b0
    pop de
    jr nz, @-$34

    jr nz, @-$47

    or h
    rst $08
    cp l
    nop
    ld sp, $e000
    rst $10

jr_000_0bbc:
    ld b, $00

jr_000_0bbe:
    rst $10
    sub e
    db $f4
    ret


    ld hl, $0409
    rst $08
    cp b

jr_000_0bc7:
    rst $10
    and d
    cp $e1
    rst $08
    ld l, c

jr_000_0bcd:
    rst $08
    or c

jr_000_0bcf:
    rst $08
    ret c

    ld [$c881], a
    cp $04
    jr z, jr_000_0c28

jr_000_0bd8:
    cp $02
    jr nz, @+$09

    rst $10
    ld b, $00
    rst $10
    dec e
    ld a, [$fac9]
    add e
    ret z

jr_000_0be6:
    inc a
    ld [$c883], a
    xor a
    ld [$c887], a
    rst $10
    ld b, $00
    rst $10
    dec de
    push af
    ret


    rst $10
    ld b, $00
    rst $10
    sub b
    or $c9
    rst $10
    ld b, $00
    rst $10
    sbc [hl]
    db $fc
    ret


    rst $10
    ld b, $00
    rst $10
    cp c
    ld a, [$d7c9]
    ld b, $00
    rst $10
    ld a, [hl+]
    ld hl, sp-$37
    rst $10
    ld b, $00
    rst $10
    cp [hl]
    rst $30
    ret


    rst $10
    ld b, $00
    rst $10
    ld h, d
    ld sp, hl
    ret


    rst $10
    ld b, $00
    rst $10
    adc a
    db $f4
    ret


    jr jr_000_0bcd

jr_000_0c28:
    rst $10
    ld b, $00
    rst $10
    ld hl, $c9f4

End:
