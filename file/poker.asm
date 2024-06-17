; Disassembly of "poker.gbf"

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
    dk "POKER       "

Points::
    dw $0001
Author::
    db "S.KIMURA\n\n", 2
History::
    ds 11
    ds 11
    ds 11

Main::
    rst $10
    ld a, e
    ld c, $c9
    xor a
    rst $08
    inc de
    rst $08
    ld bc, $203e
    rst $08
    or e
    rst $08
    ld de, $001e
    ld bc, $040a
    ld hl, $c700
    rst $08
    and [hl]
    rst $10
    cp a
    inc c
    pop de
    ld b, $c7
    rst $08
    ld h, d
    ld de, $c800
    ld bc, $01f9
    rst $08
    ld h, e
    ld hl, $c600
    ld de, $c400
    ld bc, $0100
    rst $08
    ld [bc], a
    ld hl, $9200
    ld bc, $03b0

jr_000_007a:
    ld a, [hl]
    sla a
    or [hl]
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_000_007a

    ld hl, $8802
    ld de, $8800
    ld c, $00

jr_000_008c:
    ld b, $07

jr_000_008e:
    push bc
    ld a, [de]
    ld b, a
    ld a, [hl+]
    srl a
    or b
    ld [de], a
    inc de
    inc de
    inc hl
    pop bc
    dec b
    jr nz, jr_000_008e

    inc hl
    inc hl
    inc de
    inc de
    dec c
    jr nz, jr_000_008c

    ld bc, $0010
    ld de, $9210
    ld hl, $95b0
    rst $08
    ld [bc], a
    ld bc, $0010
    ld de, $9240
    ld hl, $95c0
    rst $08
    ld [bc], a
    ld bc, $0010
    ld de, $92b0
    ld hl, $95d0
    rst $08
    ld [bc], a
    ld bc, $0010
    ld de, $92d0
    ld hl, $95e0
    rst $08
    ld [bc], a
    ld bc, $0010
    ld de, $92e0
    ld hl, $95f0
    rst $08
    ld [bc], a
    ld bc, $01f0
    ld de, $8b10
    ld hl, $9010
    rst $08
    ld [bc], a
    ld bc, $00e0
    ld de, $8d00
    ld hl, $9210
    rst $08
    ld [bc], a
    rst $10
    or c
    ld a, [bc]
    pop de
    ld b, $c7
    rst $08
    ld h, d
    ld de, $8b10
    ld bc, $0330
    rst $08
    ld h, e
    ld bc, $0020
    rst $10
    rst $20
    dec bc
    pop de
    ld hl, $8000
    rst $08
    ld [bc], a
    ld a, $e4
    ldh [$9c], a
    ld a, $e4
    ldh [$9d], a
    ld a, $e4
    ldh [$9e], a
    ld hl, $ca28
    ld a, $01
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ret


    ld a, [hl+]
    sub e
    ld e, a
    push af
    ld a, [hl+]
    sbc d
    ld d, a
    push af
    ld a, [hl+]
    sbc c
    ld c, a
    push af
    ld a, [hl+]
    sbc b
    ld b, a
    push af

    db $3e, $80, $e1, $a5, $cb, $bd, $b5, $e1, $cb, $e5, $a5

HeaderManufacturerCode::
    db $e1, $cb, $e5, $a5

HeaderCGBFlag::
    db $e1

    set 4, l
    and l
    ld l, a
    push hl
    pop af
    ret


    push hl
    ld hl, $ca8f
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld bc, $0000
    ld de, $0000
    ld hl, $ca93
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld hl, $ca8f
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    pop hl
    ld l, $08

jr_000_0176:
    sla h
    jr nc, jr_000_01b4

    push hl
    push hl
    ld hl, $ca8f
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    pop hl

jr_000_0188:
    dec l
    jr z, jr_000_0199

    push hl
    sla e
    rl d
    rl c
    rl b
    jr c, jr_000_01cc

    pop hl
    jr jr_000_0188

jr_000_0199:
    ld hl, $ca93
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl+]
    adc d
    ld d, a
    ld a, [hl+]
    adc c
    ld c, a
    ld a, [hl]
    adc b
    ld b, a
    ld hl, $ca93
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    pop hl

jr_000_01b4:
    dec l
    jr nz, jr_000_0176

    ld hl, $ca93
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    bit 7, b
    ret z

    ld bc, $7fff
    ld de, $ffff
    ret


jr_000_01cc:
    pop hl
    pop hl
    ret


    ld a, $02
    ld [$ca78], a
    ld a, [$ca77]
    ld b, a
    ldh a, [$8b]
    cp h
    jr nz, jr_000_01e2

    xor a
    ld [$ca78], a
    ret


jr_000_01e2:
    cp l
    jr nz, jr_000_01eb

    ld a, $01
    ld [$ca78], a
    ret


jr_000_01eb:
    cp d
    jr nz, jr_000_01f1

    dec b
    jr jr_000_01f5

jr_000_01f1:
    cp e
    jr nz, jr_000_01f5

    inc b

jr_000_01f5:
    ld a, b
    cp $ff
    jr nz, jr_000_01fe

    ld a, c
    dec a
    jr jr_000_0202

jr_000_01fe:
    cp c
    jr nz, jr_000_0202

    xor a

jr_000_0202:
    ld [$ca77], a
    ret


    ld hl, $ca79
    ld a, [$ca77]
    sla a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ld e, a
    ld hl, $c300
    ld a, c
    sla a
    sla a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld [hl], d
    inc hl
    ld [hl], e
    inc hl
    ld [hl], b
    ret


    ld hl, $c9f9
    ld a, [hl+]
    xor $09
    ret nz

    ld a, [hl]
    or $00
    ret nz

    ld a, $03
    rst $10
    ld b, $00
    rst $10
    adc $11
    ret


    ld a, $0c
    rst $08
    cp c
    ld hl, $0703
    rst $08
    cp b
    ld hl, $c800
    rst $08
    ld l, c
    ld hl, $0707
    rst $08
    cp b
    ld hl, $c806
    rst $08
    ld l, c
    ld hl, $0709
    rst $08
    cp b
    ld hl, $c80b
    rst $08
    ld l, c
    ld hl, $020f
    rst $08
    cp b
    ld hl, $c813
    rst $08
    ld l, c
    rst $10
    ld b, $00
    rst $10
    call z, $c90e
    ld hl, $ca1c
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld hl, $ca83
    rst $08
    and b
    ld hl, $080f
    rst $08
    cp b
    ld hl, $ca84
    rst $08
    ld l, c
    rst $10
    jr @+$0e

    pop de
    ld hl, $ca79
    ld bc, $0004
    rst $08
    ld [bc], a
    xor a
    ld [$ca77], a
    rst $10
    ld b, $00
    rst $10
    ld [c], a
    ld c, $c9
    ld a, $08
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    ret


    rst $08
    adc [hl]
    ld a, [$c9f9]
    xor $08
    ret nz

    ld a, [$c9fa]
    or $00
    ret nz

    ld bc, $0100
    rst $10
    ld b, $00
    rst $10
    ld b, d
    rst $38
    ret


    ld c, $02
    ld hl, $01ff
    ld de, $4080
    rst $10
    ld b, $00
    rst $10
    db $fc
    cp $c9
    ld a, [$ca78]
    cp $02
    ret z

    ld a, [$ca77]
    cp $00
    jr nz, jr_000_02f4

    ld hl, $c300
    xor a
    ld [hl+], a
    ld [hl], a
    ld a, $11
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    ret


jr_000_02f4:
    ld a, $02
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    ret


    ld a, [$c9f9]
    xor $11
    ret nz

    ld a, [$c9fa]
    xor $00
    ret nz

    ld a, $04
    rst $10
    ld b, $00
    rst $10
    ld a, [$c910]
    rst $10
    ld b, $00
    rst $10
    cp l
    dec c
    ret


    rst $10
    ld b, $00
    rst $10
    jp nc, $c90d

    rst $10
    ld b, $00
    rst $10
    ccf
    db $10
    ret


    rst $10
    ld e, [hl]
    dec bc
    pop de
    ld hl, $c9fb
    ld bc, $0014
    rst $08
    ld [bc], a
    rst $10
    ld b, $00
    rst $10
    ld e, h
    inc c
    ret


    rst $10
    ld b, $00
    rst $10
    ld b, e
    ld c, $c9
    xor a
    ld hl, $c300
    ld [hl+], a
    ld [hl], a
    ld a, $0c
    rst $08
    cp c
    ld hl, $0201
    rst $08
    cp b
    ld hl, $c813
    rst $08
    ld l, c
    ld hl, $0202
    rst $08
    cp b
    ld hl, $c81c
    rst $08
    ld l, c
    ld bc, $0103
    ld de, $1001
    rst $10
    ld b, $00
    rst $10
    inc c
    dec c
    ret


    ld bc, $010e
    ld de, $1001
    rst $10
    ld b, $00
    rst $10
    rst $38
    inc c
    ret


    ld a, $11
    ld [$c9f9], a
    ld a, $01
    ld [$c9fa], a
    ret


    ld a, [$c9f9]
    xor $11
    ret nz

    ld a, [$c9fa]
    xor $01
    ret nz

    rst $10
    ld b, $00
    rst $10
    and [hl]
    dec c
    ret


    ld hl, $ca28
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    push de
    push bc
    ld hl, $ca1c
    rst $10
    ld b, $00
    rst $10
    ld [hl], a
    db $fd
    ret


    jr c, jr_000_03cc

    ld hl, $ca1c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    pop bc
    pop de
    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    jr jr_000_03f5

jr_000_03cc:
    pop bc
    pop de
    ld hl, $ca1c
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld de, $0000
    ld bc, $0000
    ld hl, $ca1c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a

jr_000_03f5:
    rst $10
    ld b, $00
    rst $10
    call c, $c90f
    rst $10
    ld b, $00
    rst $10
    ldh a, [rIF]
    ret


    ld a, $03
    rst $10
    ld b, $00
    rst $10
    adc l
    dec c
    ret


    ld a, $04
    rst $10
    ld b, $00
    rst $10
    sbc l
    dec c
    ret


    ld a, $10
    ld [$c9f9], a
    ld a, $01
    ld [$c9fa], a
    ret


    ld a, [$c9f9]
    xor $10
    ret nz

    ld a, [$c9fa]
    xor $01
    ret nz

    ld a, [$ca9a]
    bit 0, a
    jr z, jr_000_045b

    ld hl, $ca20
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld hl, $ca28
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    rst $10
    ld b, $00
    rst $10
    db $d3
    inc c
    ret


    ld a, $11
    ld [$c9f9], a
    ld a, $02
    ld [$c9fa], a
    ret


jr_000_045b:
    bit 5, a
    jr z, jr_000_046e

    ld bc, $0000
    ld de, $0001
    rst $10
    ld b, $00
    rst $10
    ld c, d
    nop
    ret


    jr jr_000_04a4

jr_000_046e:
    bit 4, a
    jr z, jr_000_0481

    ld bc, $0000
    ld de, $0001
    rst $10
    ld b, $00
    rst $10
    call z, $c900
    jr jr_000_04a4

jr_000_0481:
    bit 7, a
    jr z, jr_000_0494

    ld bc, $0000
    ld de, $000a
    rst $10
    ld b, $00
    rst $10
    inc h
    nop
    ret


    jr jr_000_04a4

jr_000_0494:
    bit 6, a
    ret z

    ld bc, $0000
    ld de, $000a
    rst $10
    ld b, $00
    rst $10
    and a
    nop
    ret


jr_000_04a4:
    rst $10
    ld b, $00
    rst $10
    dec l
    rrca
    ret


    rst $10
    ld b, $00
    rst $10
    ld b, c
    rrca
    ret


    ret


    push bc
    push de
    ld hl, $ca20
    rst $10
    ld b, $00
    rst $10
    ld l, b
    db $fc
    ret


    jr z, jr_000_04f4

    jr c, jr_000_04f4

    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    pop de
    pop bc
    ld hl, $ca1c
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl+]
    adc d
    ld d, a
    ld a, [hl+]
    adc c
    ld c, a
    ld a, [hl]
    adc b
    ld b, a
    ld hl, $ca1c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld a, $2b
    rst $10
    ld b, $00
    rst $10
    dec h
    rrca
    ret


    ret


jr_000_04f4:
    ld hl, $ca1c
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld hl, $ca20
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl+]
    adc d
    ld d, a
    ld a, [hl+]
    adc c
    ld c, a
    ld a, [hl]
    adc b
    ld b, a
    ld hl, $ca1c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld de, $0001
    ld bc, $0000
    ld hl, $ca1c
    rst $10
    ld b, $00
    rst $10
    cp $fb
    ret


    ld hl, $ca1c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld de, $0001
    ld bc, $0000
    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    pop de
    pop bc
    ret


    push bc
    push de
    ld hl, $ca1c
    rst $10
    ld b, $00
    rst $10
    db $d3
    ei
    ret


    jr z, jr_000_0589

    jr c, jr_000_0589

    ld hl, $ca1c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    pop de
    pop bc
    ld hl, $ca20
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl+]
    adc d
    ld d, a
    ld a, [hl+]
    adc c
    ld c, a
    ld a, [hl]
    adc b
    ld b, a
    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld a, $2b
    rst $10
    ld b, $00
    rst $10
    sub b
    ld c, $c9
    ret


jr_000_0589:
    ld hl, $ca1c
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld hl, $ca20
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl+]
    adc d
    ld d, a
    ld a, [hl+]
    adc c
    ld c, a
    ld a, [hl]
    adc b
    ld b, a
    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld de, $0000
    ld bc, $0000
    ld hl, $ca1c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    pop de
    pop bc
    ret


    ld a, [$c9f9]
    xor $11
    ret nz

    ld a, [$c9fa]
    xor $02
    ret nz

    ld a, $01
    rst $10
    ld b, $00
    rst $10
    jp nz, $c90b

    ld a, $02
    rst $10
    ld b, $00
    rst $10
    jp nc, $c90b

    ld hl, $080c
    rst $08
    cp b
    ld hl, $c84e
    rst $08
    ld l, c
    xor a
    ld [$ca77], a
    rst $10
    xor l
    ld [$21d1], sp
    ld a, c
    jp z, Jump_000_0a01

    nop
    rst $08
    ld [bc], a
    rst $10
    ld b, $00
    rst $10
    jp $c909


    ld a, $10
    ld [$c9f9], a
    ld a, $02
    ld [$c9fa], a
    ret


    ld a, [$c9f9]
    xor $10
    ret nz

    ld a, [$c9fa]
    xor $02
    ret nz

    ld bc, $0000
    rst $10
    ld b, $00
    rst $10
    rst $20
    ei
    ret


    ld c, $05
    ld h, $01
    ld l, $80
    ld d, $20
    ld e, $10
    rst $10
    ld b, $00
    rst $10
    sbc a
    ei
    ret


    ld a, [$ca78]
    cp $02
    ret z

    cp $01
    jr nz, jr_000_0648

    ld a, $10
    ld [$c9f9], a
    ld a, $04
    ld [$c9fa], a
    ret


jr_000_0648:
    ld a, $01
    rst $10
    ld b, $00
    rst $10
    rst $00
    dec c
    ret


    ld hl, $ca41
    ld a, [$ca77]
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    xor $40
    ld [hl], a
    rst $10
    ld b, $00
    rst $10
    jr nc, @+$0b

    ret


    ld hl, $c9fb
    ld a, [$ca77]
    ld e, a
    sla a
    sla a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl+]
    ld b, a
    inc hl
    ld a, [hl]
    bit 6, a
    jr z, jr_000_0685

    ld c, $06
    jr jr_000_0687

jr_000_0685:
    ld c, $07

jr_000_0687:
    rst $10
    ld b, $00
    rst $10
    call nz, $c909
    ret


    ld a, [$c9f9]
    xor $10
    ret nz

    ld a, [$c9fa]
    xor $04
    ret nz

    ld hl, $c300
    ld a, $70
    ld [hl+], a
    ld a, $3c
    ld [hl+], a
    ld a, $01
    ld [hl], a
    ldh a, [$8b]
    bit 6, a
    jr z, jr_000_06b8

    ld a, $10
    ld [$c9f9], a
    ld a, $02
    ld [$c9fa], a
    ret


jr_000_06b8:
    bit 0, a
    ret z

    ld a, $10
    ld [$c9f9], a
    ld a, $08
    ld [$c9fa], a
    ld hl, $c300
    xor a
    ld [hl+], a
    ld [hl+], a
    ret


    ld a, [$c9f9]
    xor $10
    ret nz

    ld a, [$c9fa]
    xor $08
    ret nz

    ld hl, $010c
    rst $08
    cp b
    ld hl, $c8b8
    rst $08
    ld l, c
    ld a, $00
    rst $10
    ld b, $00
    rst $10
    rst $00
    ld a, [bc]
    ret


    rst $10
    ld b, $00
    rst $10
    cp h
    ld [$0ec9], sp
    nop
    ld de, $ca46
    ld hl, $ca41
    ld b, $05

jr_000_06fc:
    bit 6, [hl]
    jr z, jr_000_0706

    ld a, [de]
    set 6, a
    ld [hl], a
    inc de
    inc c

jr_000_0706:
    inc hl
    dec b
    jr nz, jr_000_06fc

    ld a, c
    and a
    jr z, @+$35

    rst $10
    ld b, $00
    rst $10
    add e
    ld [$d7c9], sp
    ld b, $00
    rst $10
    xor b
    ld [$f0c9], sp
    adc e
    and a
    jr z, @-$03

    ld hl, $ca41
    ld b, $05

jr_000_0726:
    res 6, [hl]
    inc hl
    dec b
    jr nz, jr_000_0726

    rst $10
    ld b, $00
    rst $10
    dec [hl]
    inc c
    ret


    rst $10
    ld b, $00
    rst $10
    ld e, [hl]
    ld [$d7c9], sp
    ld b, $00
    rst $10
    add e
    ld [$d7c9], sp
    ld b, $00
    rst $10
    xor h
    nop
    ret


    push af
    add $08
    rst $10
    ld b, $00
    rst $10
    ld b, a
    ld a, [bc]
    ret


    pop af
    push af
    and a
    jr z, jr_000_076b

    ld a, $04
    rst $10
    ld b, $00
    rst $10
    cp b
    inc c
    ret


    ld d, $0a
    rst $10
    ld b, $00
    rst $10
    and [hl]
    ld a, [bc]
    ret


    jr jr_000_0774

jr_000_076b:
    ld a, $12
    rst $10
    ld b, $00
    rst $10
    and h
    inc c
    ret


jr_000_0774:
    rst $08
    rla
    and a
    jr nz, jr_000_0774

    pop af
    push af
    ld hl, $ca20
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    pop af
    push af
    rst $10
    add hl, hl
    rlca
    pop hl
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld h, a
    rst $10
    ld b, $00
    rst $10
    or e
    ld sp, hl
    ret


    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    rst $10
    ld b, $00
    rst $10
    ld b, [hl]
    inc c
    ret


    rst $10
    ld b, $00
    rst $10
    ld l, a
    add hl, bc
    ret


    ld a, $15
    rst $10
    ld b, $00
    rst $10
    push af
    add hl, bc
    ret


jr_000_07bd:
    ldh a, [$8b]
    and a
    jr z, jr_000_07bd

    pop af
    cp $00
    jr nz, jr_000_07e6

    xor a
    rst $08
    inc de
    ld bc, $3650
    rst $10
    ld b, $00
    rst $10
    ld [hl], e
    ld a, [bc]
    ret


    rst $10
    ld b, $00
    rst $10
    and $0b
    ret


    ld a, $11
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    ret


jr_000_07e6:
    ld a, $11
    ld [$c9f9], a
    ld a, $20
    ld [$c9fa], a
    ret


    ld hl, $ca9b
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld hl, $ca41
    ld b, $05

jr_000_0802:
    ld a, [hl+]
    push hl
    push af
    and $30
    srl a
    srl a
    srl a
    ld hl, $ca9b
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    push af
    and $08
    srl a
    srl a
    srl a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    and $07
    ld c, a
    ld a, $80
    inc c

jr_000_082d:
    dec c
    jr z, jr_000_0834

    srl a
    jr jr_000_082d

jr_000_0834:
    ld c, [hl]
    or c
    ld [hl], a
    pop hl
    dec b
    jr nz, jr_000_0802

    ld b, $05
    ld hl, $ca9b

jr_000_0840:
    ld a, [hl+]
    and $40
    rlc a
    rlc a
    rlc a
    ld c, [hl]
    or c
    ld [hl+], a
    dec b
    jr nz, jr_000_0840

    ld hl, $ca9b
    ld a, [hl+]
    inc hl
    or [hl]
    inc hl
    inc hl
    or [hl]
    inc hl
    inc hl
    or [hl]
    ld [$caa3], a
    ld hl, $ca9c
    ld a, [hl+]
    inc hl
    or [hl]
    inc hl
    inc hl
    or [hl]
    inc hl
    inc hl
    or [hl]
    ld [$caa4], a
    rst $10
    ld b, $00
    rst $10
    pop bc
    nop
    ret


    jr nz, jr_000_0899

    rst $10
    ld b, $00
    rst $10
    sub $00
    ret


    jr c, jr_000_0896

    ld hl, $caa3
    ld b, [hl]
    inc hl
    ld c, [hl]
    ld de, $403e
    ld a, b
    xor d
    ld b, a
    ld a, c
    xor e
    or b
    jr nz, jr_000_0893

    ld a, $09
    ret


jr_000_0893:
    ld a, $08
    ret


jr_000_0896:
    ld a, $04
    ret


jr_000_0899:
    rst $10
    ld b, $00
    rst $10
    or e
    nop
    ret


    jr c, jr_000_08a5

    ld a, $05
    ret


jr_000_08a5:
    ld hl, $caa3
    ld d, [hl]
    inc hl
    ld e, [hl]
    sla e
    rl d
    ld a, $00
    ld b, $0d

jr_000_08b3:
    sla e
    rl d
    adc $00
    dec b
    jr nz, jr_000_08b3

    cp $05
    jr nz, jr_000_08c3

    ld a, $00
    ret


jr_000_08c3:
    cp $04
    jr nz, jr_000_08ca

    ld a, $01
    ret


jr_000_08ca:
    cp $02
    jr nz, jr_000_08f0

    ld hl, $ca9b
    ld a, [hl+]
    inc hl
    and [hl]
    inc hl
    inc hl
    and [hl]
    inc hl
    inc hl
    and [hl]
    ld b, a
    ld hl, $ca9c
    ld a, [hl+]
    inc hl
    and [hl]
    inc hl
    inc hl
    and [hl]
    inc hl
    inc hl
    and [hl]
    or b
    jr z, jr_000_08ed

    ld a, $07
    ret


jr_000_08ed:
    ld a, $06
    ret


jr_000_08f0:
    ld hl, $ca9b
    ld b, [hl]
    inc hl
    inc hl
    ld c, [hl]
    inc hl
    inc hl
    ld d, [hl]
    inc hl
    inc hl
    ld e, [hl]
    ld a, d
    xor e
    and c
    and b
    push af
    ld a, b
    xor c
    and e
    and d
    ld b, a
    pop af
    or b
    ld [$caa5], a
    ld hl, $ca9c
    ld b, [hl]
    inc hl
    inc hl
    ld c, [hl]
    inc hl
    inc hl
    ld d, [hl]
    inc hl
    inc hl
    ld e, [hl]
    ld a, d
    xor e
    and c
    and b
    push af
    ld a, b
    xor c
    and e
    and d
    ld b, a
    pop af
    or b
    ld b, a
    ld a, [$caa5]
    or b
    jr z, jr_000_092f

    ld a, $03
    ret


jr_000_092f:
    ld a, $02
    ret


    ld hl, $caa3
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ld e, a
    ld bc, $7c00
    ld h, $0a

jr_000_093e:
    ld a, d
    and b
    sub b
    ld l, a
    ld a, e
    and c
    sub c
    or l
    ret z

    srl b
    rr c
    dec h
    jr nz, jr_000_093e

    rla
    ret


    ld hl, $ca9b
    ld c, $04

jr_000_0955:
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld e, a
    sla e
    rl d
    ld a, $00
    ld b, $0d

jr_000_0961:
    sla e
    rl d
    adc $00
    dec b
    jr nz, jr_000_0961

    cp $05
    ret nc

    dec c
    jr nz, jr_000_0955

    scf
    ret


    ld a, [$c9f9]
    xor $11
    ret nz

    ld a, [$c9fa]
    xor $20
    ret nz

    ld a, $0f
    rst $10
    ld b, $00
    rst $10
    add a
    ld a, [bc]
    ret


    ld a, $05
    rst $10
    ld b, $00
    rst $10
    add hl, bc
    ld [$d7c9], sp
    ld b, $00
    rst $10
    inc [hl]
    ld [$3ec9], sp
    db $10
    ld [$c9f9], a
    ld a, $20
    ld [$c9fa], a
    ret


    ld a, [$c9f9]
    xor $10
    ret nz

    ld a, [$c9fa]
    xor $20
    ret nz

    rst $10
    ld b, $00
    rst $10
    jr nc, jr_000_09bc

    ret


    cp $02
    ret z

    cp $00
    jr nz, jr_000_09c7

jr_000_09bc:
    ld a, $21
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    ret


jr_000_09c7:
    ld hl, $ca20
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld hl, $ca1c
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl+]
    adc d
    ld d, a
    ld a, [hl+]
    adc c
    ld c, a
    ld a, [hl]
    adc b
    ld b, a
    ld hl, $ca1c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    rst $10
    ld b, $00
    rst $10
    jr nc, @+$09

    ret


    ld a, $11
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    ret


    ld a, [$c9f9]

Jump_000_0a01:
    xor $21
    ret nz

    ld a, [$c9fa]
    xor $00
    ret nz

    ld a, $07
    rst $10
    ld b, $00
    rst $10
    ei
    add hl, bc
    ret


    rst $10
    ld b, $00
    rst $10
    cp [hl]
    ld b, $c9
    rst $10
    ld b, $00
    rst $10
    db $d3
    ld b, $c9
    ld a, $0c
    rst $08
    cp c
    ld a, [$ca41]
    set 7, a
    ld e, a
    ld bc, $0707
    rst $10
    ld b, $00
    rst $10
    or [hl]
    dec b
    ret


    ld a, [$ca42]
    res 7, a
    ld e, a
    ld bc, $0b07
    rst $10
    ld b, $00
    rst $10
    and [hl]
    dec b
    ret


    ld bc, $0103
    ld de, $1001
    rst $10
    ld b, $00
    rst $10
    jr z, @+$08

    ret


    ld bc, $010e
    ld de, $1001
    rst $10
    ld b, $00
    rst $10
    dec de
    ld b, $c9
    ld hl, $0201
    rst $08
    cp b
    ld hl, $c813
    rst $08
    ld l, c
    ld hl, $0202
    rst $08
    cp b
    ld hl, $c81c
    rst $08
    ld l, c
    rst $10
    ld b, $00
    rst $10
    ld e, [hl]
    add hl, bc
    ret


    rst $10
    ld b, $00
    rst $10
    ld [hl], d
    add hl, bc
    ret


    ld a, $12
    rst $10
    ld b, $00
    rst $10
    rrca
    rlca
    ret


    rst $10
    ld b, $00
    rst $10
    ld a, [hl-]
    rlca
    ret


    ld a, $20
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    ret


    ld a, [$c9f9]
    xor $20
    ret nz

    ld a, [$c9fa]
    xor $00
    ret nz

    rst $10
    ld b, $00
    rst $10
    ld [hl], $07
    ret


    cp $02
    ret z

    push af
    ld a, [$ca42]
    set 7, a
    ld e, a
    ld bc, $0b07
    rst $10
    ld b, $00
    rst $10
    jr z, @+$07

    ret


    ld a, $00
    rst $10
    ld b, $00
    rst $10
    and $06
    ret


    xor a
    ld [$c300], a
    ld a, [$ca41]
    and $0f
    ld b, a
    ld a, [$ca42]
    and $0f
    ld c, a
    pop af
    and a
    jr nz, jr_000_0ae4

    ld a, c
    sub b
    jr jr_000_0ae6

jr_000_0ae4:
    ld a, b
    sub c

jr_000_0ae6:
    jr z, jr_000_0aee

    jr nc, jr_000_0b45

    cp $f4
    jr z, jr_000_0b45

jr_000_0aee:
    ld a, $12
    rst $10
    ld b, $00
    rst $10
    ld hl, $c909
    ld a, $13
    rst $10
    ld b, $00
    rst $10
    sbc c
    ld b, $c9
    ld de, $0000
    ld bc, $0000
    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    rst $10
    ld b, $00
    rst $10
    db $db
    ld [$3ec9], sp
    dec d
    rst $10
    ld b, $00
    rst $10
    sub c
    ld b, $c9

jr_000_0b21:
    ldh a, [$8b]
    and a
    jr z, jr_000_0b21

    xor a
    rst $08
    inc de
    ld bc, $3650
    rst $10
    ld b, $00
    rst $10
    inc d
    rlca
    ret


    rst $10
    ld b, $00
    rst $10
    add a
    ld [$3ec9], sp
    ld de, $f9ea
    ret


    ld a, $00
    ld [$c9fa], a
    ret


jr_000_0b45:
    cp $0c
    jr z, jr_000_0aee

    ld a, $04
    rst $10
    ld b, $00
    rst $10
    add $08
    ret


    ld a, $14
    rst $10
    ld b, $00
    rst $10
    ld a, $06
    ret


    ld hl, $ca20
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld h, $02
    rst $10
    ld b, $00
    rst $10
    rst $18
    push af
    ret


    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    rst $10
    ld b, $00
    rst $10
    ld [hl], d
    ld [$16c9], sp
    ld a, [bc]
    rst $10
    ld b, $00
    rst $10
    add l
    ld b, $c9
    ld a, $15
    rst $10
    ld b, $00
    rst $10
    rra
    ld b, $c9

jr_000_0b93:
    ldh a, [$8b]
    and a
    jr z, jr_000_0b93

    ld a, $11
    ld [$c9f9], a
    ld a, $20
    ld [$c9fa], a
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
    jr nz, jr_000_0c1d

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
    jr nz, jr_000_0c3b

    ld a, a
    ld h, b
    daa
    ld a, a
    inc h

jr_000_0c01:
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
    jr nz, jr_000_0c3e

jr_000_0c1d:
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

jr_000_0c3b:
    adc c
    nop
    rla

jr_000_0c3e:
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
    jr nz, jr_000_0c01

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
    jr nz, jr_000_0cb6

    ld [bc], a
    db $fc

jr_000_0cb6:
    jr jr_000_0cb8

jr_000_0cb8:
    nop
    add hl, hl
    inc sp
    nop
    add b
    ccf
    sub d
    inc e
    inc sp
    sub e
    daa
    dec hl
    ld e, a
    jr nc, @+$01

    ld h, l
    ld e, a
    ld c, h
    nop
    jr jr_000_0cdd

    ld a, $6f
    ld e, a
    ld c, c
    rlca
    rlca
    rrca
    ld [$7a1c], sp
    ei
    ret nz

    ret nz

    ldh [rNR41], a
    db $10

jr_000_0cdd:
    ld [hl], b
    ld [hl], b
    ld [$5c08], sp
    add l
    inc bc
    ld l, b
    sub b
    jr c, @+$22

    ldh a, [$96]
    ld l, b
    ld d, b
    nop
    jr jr_000_0d07

    inc a
    inc a
    ld a, [hl]
    ld a, [hl]
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
    ldh [$60], a
    ld hl, sp+$78
    cp $7e
    rst $38
    ld a, [hl]
    rst $38
    ld a, b

jr_000_0d07:
    cp $60
    ld hl, sp+$00
    ldh [rNR41], a
    jr nz, @+$05

    ld [bc], a
    ld [bc], a
    jr nz, @+$22

    inc bc
    ld [bc], a
    ld [bc], a
    jr nz, jr_000_0d38

    nop
    rst $38
    ld d, b
    ld c, a
    ld c, e
    ld b, l
    ld d, d
    nop
    ld l, l
    ld [hl], b
    rst $38
    ld e, [hl]
    ld [hl], h
    nop
    rrca
    cp h
    xor l
    or e
    ret c

    rst $18
    xor [hl]
    or e
    ld sp, hl
    db $10
    xor [hl]
    cp h
    sbc $b7
    db $dd
    or l
    ld e, h
    ld sp, hl

jr_000_0d38:
    or [hl]
    cp c
    rlca
    nop
    jr nz, jr_000_0d47

    ld c, $ff
    jr nz, jr_000_0da8

    ld e, [hl]
    call nz, Call_000_0fde
    and [hl]

jr_000_0d47:
    cp d
    rst $38
    or e
    or [hl]
    db $dd
    cp h
    jp $c0b8


    sbc $e7
    cp e
    or d
    jr nz, jr_000_0d68

    db $10
    add hl, hl
    ld b, c
    adc $de
    rst $38
    ld [hl], b
    ld l, $0f
    jp $bede


    db $dd
    ret nz

    sbc a
    cp b

jr_000_0d66:
    add hl, hl
    db $10

jr_000_0d68:
    ld h, $0f
    cp c
    xor a
    jp $1cb2


    ld sp, hl
    nop
    add hl, hl
    inc c
    dec h
    and [hl]
    or a
    jp nc, $3b20

    db $10
    ld e, a
    add hl, hl
    sla d
    nop
    ret c

    jr nz, jr_000_0de0

    ld sp, $f820
    ret nc

    or a
    sbc $20
    ld e, l
    ld e, a
    ld h, $20
    ld [hl+], a
    rst $38
    call z, $2ade
    ld h, c
    xor a
    call z, Call_000_0fdf
    rst $38
    add $bd
    cp l
    ret nc

    rst $08
    cp l
    or [hl]
    ccf
    ld [hl], e
    ld h, $30
    adc $df
    ld e, [hl]
    dec d
    add hl, de

jr_000_0da8:
    inc bc
    jp nz, $c4c2

    sbc $b9
    ld a, d
    ld d, h
    jr nc, jr_000_0ddb

    jp z, Jump_000_1052

    add hl, hl
    ldh [$b2], a
    or d
    or h
    add hl, sp
    ld [hl-], a
    jr c, jr_000_0d66

    and e
    daa
    jr c, jr_000_0de2

    ld e, a
    ld l, [hl]
    ld [hl], b
    or c
    call c, $2e2d
    call $61df
    ld l, h
    or d
    ld [hl], d
    ld e, [hl]
    push de

jr_000_0dd1:
    pop hl
    ld l, l
    add hl, hl
    add l
    rla
    dec bc
    ld a, e
    db $ec
    ld [hl], h
    dec hl

jr_000_0ddb:
    ld e, [hl]
    ld [hl], h
    or d
    cp h
    ld a, h

jr_000_0de0:
    jr z, jr_000_0dd1

jr_000_0de2:
    xor a
    ld l, h
    xor l
    db $10
    ld a, [hl+]
    ld a, d
    ld h, e
    ld l, l
    ld b, e
    db $10
    call $faab
    dec bc
    ld [hl], $1d
    ld a, a
    add hl, de
    and h
    ld h, d
    rst $08
    dec h
    ld a, [hl+]
    ld d, d
    sub h
    ld b, $d0
    or a
    sbc $c9
    rst $38
    adc $b3
    or [hl]

jr_000_0e04:
    sbc $b5
    or l
    or a
    or d
    ei
    call nz, $d3b5
    or e
    ccf
    and [hl]
    jp z, $e7bd

    sbc $da
    ld e, e
    or d
    ld d, l
    add l
    or c
    ret nz

    ret c

    scf
    sub b
    ld h, c
    ld c, [hl]
    ld b, c
    adc $c2
    ld [bc], a
    ld l, $0f
    and [hl]
    rst $38
    or l
    cp h
    jp $c0b8


    sbc $bb
    or d
    ld a, [hl]
    sub l
    cp h
    xor [hl]
    cp h
    sbc $b7
    db $dd
    ld a, c
    nop
    rst $38
    ld e, h
    jr nc, jr_000_0e04

    push bc
    ret c

    rst $08

jr_000_0e41:
    cp h
    ret nz

    ld a, [hl]
    ld [hl], c
    cp e
    sub $b3
    push bc
    rst $10
    ld e, a
    rst $10
    nop
    ei
    nop
    ld d, b
    ld d, l
    ld d, e
    ld c, b
    xor h
    ld c, [hl]
    ld e, c
    ld hl, sp+$20
    ld c, e
    ld b, l
    ld e, c
    nop
    cp b
    ret z

    inc h
    ret z

    add hl, sp
    ret z

    ld d, h
    ret z

    ld h, a
    ret z

    ld a, e
    ret z

    sub c
    ret z

    and [hl]
    ret z

    jp z, $ddc8

    ret z

    ldh a, [$c8]
    inc bc
    ret


    ld d, $c9
    jr z, jr_000_0e41

    ld a, [hl-]
    ret


    ld c, h
    ret


    ld e, a
    ret


    ld [hl], c
    ret


    add e
    ret


    sub [hl]
    ret


    xor c
    ret


    cp e
    ret


    dec b
    rlca
    add c
    nop
    rlca
    rlca
    add c
    nop
    add hl, bc
    rlca
    add c
    nop
    dec bc
    rlca
    add c
    nop
    dec c
    rlca
    add c
    nop
    ld h, h
    inc [hl]
    ld h, h
    ld b, h
    ld h, h
    ld d, h
    ld h, h
    ld h, h
    ld h, h
    ld [hl], h
    ld c, b
    inc [hl]
    ld e, b
    inc [hl]
    adc b
    inc l
    adc b
    ld e, h
    adc b
    inc de
    nop
    nop
    nop
    ld bc, $0502
    ld a, [bc]
    ld [hl-], a
    ld d, b
    ld h, h
    sub [hl]
    rst $38
    ld sp, $e000
    rst $10
    ld b, $00
    rst $10
    add [hl]
    pop af
    ret


    ld a, $03
    rst $08
    or h
    ld a, $01
    ld [$cb09], a
    ld a, [$0014]
    cp $01
    jr z, jr_000_0ede

    cp $fe
    jr z, jr_000_0ede

    xor a
    ld [$cb09], a

jr_000_0ede:
    ld hl, $1f0f
    rst $08
    or [hl]
    rst $10
    jp z, $e1ff

    ld a, [hl+]
    or [hl]
    inc hl
    or [hl]
    inc hl
    or [hl]
    and a
    jr nz, jr_000_0ef4

    rst $10
    inc d
    inc b
    ret


jr_000_0ef4:
    ld a, $09
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    rst $10
    ld b, $00
    rst $10
    ld b, a
    ld [bc], a
    ret


    rst $10
    ld b, $00
    rst $10
    inc hl
    di
    ret


    rst $10
    ld b, $00
    rst $10
    sbc a
    di
    ret


    rst $10
    ld b, $00
    rst $10
    add sp, -$0d
    ret


    rst $10
    ld b, $00
    rst $10
    ld l, b
    db $f4
    ret


    rst $10
    ld b, $00
    rst $10
    ei
    db $f4
    ret


    rst $10
    ld b, $00
    rst $10
    sub [hl]
    or $c9
    rst $10
    ld b, $00
    rst $10
    reti


    or $c9
    rst $10
    ld b, $00
    rst $10
    ld d, l
    rst $30
    ret


    rst $10
    ld b, $00
    rst $10
    adc e
    rst $30
    ret


    rst $10
    ld b, $00
    rst $10
    ld a, [hl+]
    ld a, [$d7c9]
    ld b, $00
    rst $10
    ld d, e
    ld a, [$d7c9]
    ld b, $00
    rst $10
    xor b
    ld a, [$d7c9]
    ld b, $00
    rst $10
    ccf
    ei
    ret


    ld a, [$c9f9]
    and $02
    jr z, jr_000_0f6b

    rst $10
    call c, $c9f0

jr_000_0f6b:
    ldh a, [$8a]
    bit 2, a
    jr z, jr_000_0f75

    rst $10
    jp nc, $c9f0

jr_000_0f75:
    rst $08
    or c
    rst $10
    add [hl]
    rst $38
    ret


    ld hl, $ca41
    ld b, $05

jr_000_0f80:
    ld a, [hl]
    and $7f
    ld [hl+], a
    dec b
    jr nz, jr_000_0f80

    ret


    ld hl, $ca41
    ld b, $05

jr_000_0f8d:
    ld a, [hl]
    or $80
    ld [hl+], a
    dec b
    jr nz, jr_000_0f8d

    ret


    ld de, $c9fd
    ld hl, $ca41
    ld b, $05

jr_000_0f9d:
    ld a, [hl+]
    ld [de], a
    ld a, $04
    add e
    ld e, a
    ld a, d
    adc $00
    ld d, a
    dec b
    jr nz, jr_000_0f9d

    ret


    ld de, $c9fd
    ld hl, $ca41
    ld b, $05

jr_000_0fb3:
    ld a, [de]
    ld [hl+], a
    ld a, $04
    add e
    ld e, a
    ld a, d
    adc $00
    ld d, a
    dec b
    jr nz, jr_000_0fb3

    ret


    ld hl, $ca41
    ld de, $0500
    ld b, $05

jr_000_0fc9:
    ld a, [hl+]
    bit 6, a
    jr z, jr_000_0fd2

    ld c, $06
    jr jr_000_0fd4

jr_000_0fd2:
    ld c, $07

jr_000_0fd4:
    push hl
    push de
    rst $10
    ld b, $00
    rst $10
    ld [hl], l
    nop
    ret


    pop de

Call_000_0fde:
    pop hl

Call_000_0fdf:
    ld a, $02
    add b
    ld b, a
    inc e
    dec d
    jr nz, jr_000_0fc9

    ret


    ld a, $0e
    rst $08
    cp c
    ld l, c
    ld h, b
    rst $08
    cp b
    ld hl, $ca0f
    ld a, e
    bit 7, a
    jr nz, jr_000_101a

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
    jr jr_000_1049

jr_000_101a:
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

jr_000_1049:
    ld hl, $ca0f
    rst $08
    ld l, c
    ret


    ld hl, $c9fb

Jump_000_1052:
    ld d, $00
    sla e
    sla e
    add hl, de
    push hl
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ld e, a
    ld l, e
    ld h, d
    rst $08
    cp b
    rst $10
    xor c
    db $fc
    pop hl
    rst $08
    ld l, c
    pop hl
    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, [hl]
    ld e, a
    rst $10
    ld b, $00
    rst $10
    ld [hl], l
    rst $38
    ret


    ret


    ld a, $0e
    rst $08
    cp c
    push de
    ld hl, $ca2c
    ld a, $da
    ld [hl+], a
    ld a, $d8

jr_000_1084:
    ld [hl+], a
    dec d
    jr nz, jr_000_1084

    ld a, $db
    ld [hl+], a
    xor a
    ld [hl], a
    ld l, c
    ld h, b
    rst $08
    cp b
    ld hl, $ca2c
    rst $08
    ld l, c
    inc c
    pop de
    push de
    ld hl, $ca2c
    ld a, $d9
    ld [hl+], a
    ld a, $01

jr_000_10a1:
    ld [hl+], a
    dec d
    jr nz, jr_000_10a1

    ld a, $d9
    ld [hl+], a
    xor a
    ld [hl], a
    pop de

jr_000_10ab:
    push de
    ld l, c
    ld h, b
    rst $08
    cp b
    ld hl, $ca2c
    rst $08
    ld l, c
    inc c
    pop de
    dec e
    jr nz, jr_000_10ab

    ld hl, $ca2c
    ld a, $dc
    ld [hl+], a
    ld a, $d8

jr_000_10c2:
    ld [hl+], a
    dec d
    jr nz, jr_000_10c2

    ld a, $dd
    ld [hl+], a
    xor a
    ld [hl], a
    ld l, c
    ld h, b
    rst $08
    cp b
    ld hl, $ca2c
    rst $08
    ld l, c
    ret


    ld hl, $ca41
    ld c, $01
    ld b, $0d

jr_000_10dc:
    ld a, $80
    or c
    ld [hl+], a
    ld a, $90
    or c
    ld [hl+], a
    ld a, $a0
    or c
    ld [hl+], a
    ld a, $b0
    or c
    ld [hl+], a
    inc c
    dec b
    jr nz, jr_000_10dc

    ret


    ld b, $00

jr_000_10f3:
    push bc
    rst $08
    adc [hl]
    ld d, $00
    ld e, a
    ld h, $00
    ld l, $34
    rst $08
    adc d
    ld a, [$c3b0]
    ld b, a
    push bc
    rst $08
    adc [hl]
    ld d, $00
    ld e, a
    ld h, $00
    ld l, $34
    rst $08
    adc d
    ld a, [$c3b0]
    pop bc
    ld c, a
    rst $10
    ld b, $00
    rst $10
    ld h, a
    ld [bc], a
    ret


    pop bc
    dec b
    jr nz, jr_000_10f3

    ret


    rst $10
    adc l
    db $fd
    pop de
    ld hl, $ca1c
    ld a, $0a
    ld [$0000], a
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    xor a
    ld [$0000], a
    ret


    rst $10
    ld [hl], c
    db $fd
    pop de
    ld hl, $ca1c
    ld bc, $0004
    rst $08
    ld [bc], a
    ret


    ldh a, [$8a]
    ld b, a
    ld a, [$ca97]
    cp b
    jr z, jr_000_1165

    ld hl, $0028
    ld a, l
    ld [$ca98], a
    ld a, h
    ld [$ca99], a
    ld a, b
    ld [$ca97], a
    ld [$ca9a], a
    ret


jr_000_1165:
    ld a, [$ca98]
    ld l, a
    ld a, [$ca99]
    ld h, a
    or l
    jr z, jr_000_117e

    dec hl
    ld a, l
    ld [$ca98], a
    ld a, h
    ld [$ca99], a
    xor a
    ld [$ca9a], a
    ret


jr_000_117e:
    ld a, b
    ld [$ca9a], a
    ret


    xor a
    ld [$ca97], a
    ld [$ca9a], a
    ld hl, $0028
    ld a, l
    ld [$ca98], a
    ld a, h
    ld [$ca99], a
    ret


    rst $10
    push bc
    db $fc
    pop hl
    sla a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0204
    rst $08
    cp b
    ld l, c
    ld h, b
    rst $08
    ld l, c
    ret


    rst $10
    xor h
    db $fc
    pop hl
    sla a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $020f
    rst $08
    cp b
    ld l, c
    ld h, b
    rst $08
    ld l, c
    ret


    ld a, $07
    rst $10
    ld b, $00
    rst $10
    pop hl
    rst $38
    ret


    xor a
    ld [$ca77], a
    rst $10
    call nc, $d1fc
    ld hl, $ca79
    ld bc, $000a
    rst $08
    ld [bc], a
    ret


    ld bc, $0100
    rst $10
    ld b, $00
    rst $10
    dec e
    ldh a, [$c9]
    ld c, $02
    ld hl, $0102
    ld de, $2010
    rst $10
    ld b, $00
    rst $10
    rst $10
    rst $28
    ret


    ld a, [$ca78]
    cp $02
    ret z

    cp $01
    jr nz, jr_000_1208

    ld a, $01
    ret


jr_000_1208:
    ld a, [$ca77]
    ret


    push de
    ld de, $98e0
    ld hl, $caa6
    ld bc, $0060
    rst $08
    ld [bc], a

jr_000_1218:
    ld hl, $98e0
    ld bc, $0060
    ld e, $20
    rst $08
    and [hl]
    rst $08
    or c
    rst $08
    or c
    rst $08
    or c
    rst $08
    or c
    ld hl, $98e0
    ld de, $caa6
    ld bc, $0060
    rst $08
    ld [bc], a
    rst $08
    or c
    rst $08
    or c
    rst $08
    or c
    rst $08
    or c
    pop de
    dec d
    push de
    jr nz, jr_000_1218

    pop de
    ret


    rst $08
    or c
    ld hl, $1f00
    rst $08
    or [hl]
    xor a
    ld [$cb06], a
    ld [$cb07], a

jr_000_1252:
    ld h, $04

jr_000_1254:
    ldh a, [rLY]
    and a
    jr nz, jr_000_1254

jr_000_1259:
    ldh a, [rLY]
    cp b
    jr nz, jr_000_1259

    ld a, [$cb07]
    add b
    ld d, a
    rst $10
    ld b, $00
    rst $10
    adc l
    nop
    ret


    ld a, b
    add $0b
    ld d, a

jr_000_126e:
    rst $10
    ld b, $00
    rst $10
    ld a, e
    nop
    ret


    ldh a, [rLY]
    cp d
    jr nc, jr_000_1281

    ld a, [$cb06]
    ldh [rSCY], a
    jr jr_000_126e

jr_000_1281:
    ld a, [$cb06]
    add c
    ld d, a

jr_000_1286:
    rst $10
    ld b, $00
    rst $10
    ld h, e
    nop
    ret


    ldh a, [rLY]
    cp d
    jr nc, jr_000_1299

    ld a, [$cb07]
    ldh [rSCY], a
    jr jr_000_1286

jr_000_1299:
    ld d, c
    rst $10
    ld b, $00
    rst $10
    ld d, [hl]
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    ld c, b
    nop
    ret


    xor a
    ldh [rSCY], a
    dec h
    jr nz, jr_000_1254

    ld a, [$cb06]
    dec a
    ld [$cb06], a
    ld a, [$cb07]
    inc a
    ld [$cb07], a
    cp $0d
    jr nz, jr_000_1252

    ld hl, $98e0
    ld bc, $0060
    ld e, $20
    rst $08
    and [hl]
    ld e, $04

jr_000_12cc:
    ldh a, [rLY]
    cp $37
    jr nz, jr_000_12cc

    ld d, $50
    rst $10
    ld b, $00
    rst $10
    inc e
    nop
    ret


jr_000_12db:
    ldh a, [rSTAT]
    and $03
    jr nz, jr_000_12db

    xor a
    ldh [rSCY], a
    dec e
    jr nz, jr_000_12cc

    ld hl, $1f0f
    rst $08
    or [hl]
    ret


jr_000_12ed:
    ldh a, [rSTAT]
    and $03
    ret z

    jr jr_000_12ed

jr_000_12f4:
    ldh a, [rSTAT]
    and $03
    jr nz, jr_000_12f4

    ldh a, [rLY]
    cp d
    ret nc

    ret z

    cpl
    inc a
    ldh [rSCY], a
    jr jr_000_12f4

    ld hl, $c600
    rst $08
    rst $28
    xor a
    rst $08
    inc de
    ld a, $0c
    rst $08
    cp c
    rst $08
    or c
    rst $08
    or l
    ld hl, $0305
    rst $08
    cp b
    ld hl, $c9d0
    rst $08
    ld l, c
    ld hl, $0607
    rst $08
    cp b
    ld hl, $c9e2
    rst $08
    ld l, c
    ld hl, $040a
    rst $08
    cp b
    ld hl, $c9ec
    rst $08
    ld l, c
    ld a, $01
    rst $08
    or h
    ld hl, $1f02
    rst $08
    or [hl]
    ld l, $1f
    ld d, $8f

jr_000_1340:
    ld h, $06

jr_000_1342:
    ldh a, [rLY]
    and a
    jr nz, jr_000_1342

jr_000_1347:
    ldh a, [rLY]
    cp l
    jr c, jr_000_1347

    rst $10
    ld b, $00
    rst $10
    and h
    rst $38
    ret


    dec h
    jr nz, jr_000_1342

    inc l
    ld a, l
    cp $58
    jr nz, jr_000_1340

jr_000_135c:
    ldh a, [$8a]
    and a
    jr z, jr_000_135c

    rst $10
    ld [c], a
    db $ec
    ret


    ld b, $05

jr_000_1367:
    push bc
    rst $10
    ld b, $00
    rst $10
    cpl
    nop
    ret


    pop bc
    push bc
    dec b
    ld c, a
    rst $10
    ld b, $00
    rst $10
    ld [$c900], sp
    pop bc
    dec b
    jr nz, jr_000_1367

    ret


    ld a, b
    ld hl, $ca41
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld b, a
    ld e, l
    ld d, h
    ld a, c
    ld hl, $ca41
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld [de], a
    ld [hl], b
    ret


    xor a
    ld [$cb08], a
    ld hl, $ca41
    ld d, $00
    ld a, [hl+]
    and $0f
    ld e, a
    dec b

jr_000_13a9:
    jr z, jr_000_13ba

    inc d
    ld a, [hl+]
    and $0f
    cp e
    jr c, jr_000_13b7

    ld e, a
    ld a, d
    ld [$cb08], a

jr_000_13b7:
    dec b
    jr jr_000_13a9

jr_000_13ba:
    ld a, [$cb08]
    ret


    ld hl, $ca1c
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld a, b
    or c
    or d
    or e
    and a
    jr nz, jr_000_13d4

    rst $10
    inc [hl]
    rst $38
    ret


jr_000_13d4:
    ret


    ld hl, $ca1c
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld hl, $ca83
    rst $08
    and b
    ld hl, $0801
    rst $08
    cp b
    ld hl, $ca84
    rst $08
    ld l, c
    ret


    ld hl, $ca20
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld hl, $ca83
    rst $08
    and b
    ld hl, $0802
    rst $08
    cp b
    ld hl, $ca84
    rst $08
    ld l, c
    ret


    ld l, a
    ld a, [$cb09]
    and a
    ret z

    ld a, l
    rst $08
    inc de
    ret


    ld l, a
    ld a, [$cb09]
    and a
    ret z

    ld a, l
    rst $08
    inc d
    ret

End:
