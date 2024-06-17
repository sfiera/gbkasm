; Disassembly of "drive.gbf"

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
    db $69                     ; owner code

Title::
    dk "DRIVE"
Icon::
    INCBIN "gfx/icon/drive.2bpp"

Points::
    dw $0001
Author::
    db " T.OHNISHI", 2
History::
    ds 11
    ds 11
    ds 11

Main::
    rst $10
    ld de, $c912
    rst $08
    ld de, $0a3e
    ld [$0000], a
    rst $10
    rst $10
    db $10
    pop de
    ld hl, $cb60
    ld a, [hl+]
    ld [de], a
    ld a, [hl]
    ld [de], a
    xor a
    ld [$0000], a
    rst $08
    ld bc, $203e
    rst $08
    or e
    rst $08
    ld de, $c806
    rst $10
    ld h, d
    inc c
    pop de
    rst $08
    ld h, d
    rst $10
    cp b
    db $10
    pop de
    ld a, [de]
    inc de
    ld l, a
    ld a, [de]
    ld h, a
    rst $08
    adc l
    rst $10
    ld b, $00
    rst $10
    dec [hl]
    nop

    db $c9, $d7, $06, $00, $d7, $5c, $01, $c9, $c9, $cf, $b5

HeaderManufacturerCode::
    db $d7, $06, $00, $d7

HeaderCGBFlag::
    db $a8

    nop
    ret


    rst $10
    ld b, $00
    rst $10
    add hl, sp
    ld bc, $d7c9
    ld b, $00
    rst $10
    dec sp
    ld bc, $d7c9
    ld b, $00
    rst $10
    db $d3
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    cpl
    ld [$3ec9], sp
    inc bc
    rst $08
    or h
    ret


    ld e, $00
    ld bc, $0262
    ld hl, $c900
    rst $08
    and [hl]
    ld a, $1f
    ld [$c904], a
    ld a, $0a
    ld [$c905], a
    ld a, $0a
    ld [$c907], a
    ld a, $02
    ld [$c92f], a
    ld a, $01
    ld [$c902], a
    ld a, $13
    ld [$c901], a
    ld a, $2e
    ld [$c90a], a
    ld a, $0f
    ld [$cb30], a
    ld a, $a0
    ld [$cb3e], a
    ld bc, $0003
    rst $10
    ld l, $10
    pop de
    ld hl, $cb50
    rst $08
    ld [bc], a
    ld bc, $0008
    rst $10
    dec h
    db $10
    pop de
    ld hl, $cb53
    rst $08
    ld [bc], a
    rst $10
    inc h
    db $10
    pop hl
    ld a, [hl]
    ld [$cb5b], a
    rst $10
    ld b, $00
    rst $10
    stop
    ret


    rst $10
    ld d, $10
    pop hl
    ld a, [hl+]
    ld [$cb60], a
    ld a, [hl]
    ld [$cb61], a
    ret


    rst $08
    ld a, [de]
    ld hl, $cb53
    ld c, $08

jr_000_01d9:
    ld a, [hl]
    cp e
    jr c, jr_000_01e0

    jr z, jr_000_01e0

    xor a

jr_000_01e0:
    ld [hl+], a
    dec c
    jr nz, jr_000_01d9

    ld a, [hl]
    cp d
    ret c

    ret z

    xor a
    ld [hl], a
    ret


    ld bc, $2800
    rst $08
    call nz, $280e
    rst $10
    inc sp
    rrca
    pop de
    ld hl, $c302

jr_000_01f9:
    ld a, [de]
    inc de
    ld [hl+], a
    inc hl
    inc hl
    inc hl
    dec c
    jr nz, jr_000_01f9

    ld bc, $0000
    rst $10
    ld b, $00
    rst $10
    or a
    dec b
    ret


    xor a
    rst $10
    ld b, $00
    rst $10
    ld a, [$c90f]
    ld a, $04
    ld [$cb33], a
    ld a, $50
    ld [$c380], a
    ld [$c384], a
    ld [$c388], a
    ld [$c38c], a
    ld [$c390], a
    ret


    ld de, $cb52
    ld hl, $c352
    rst $10
    ld b, $00
    rst $10
    rlc a
    ret


    ld a, $78
    ld b, $30
    ld c, $06
    ld hl, $c368

jr_000_0241:
    ld [hl], b
    inc hl
    ld [hl+], a
    inc hl
    inc hl
    add $08
    dec c
    jr nz, jr_000_0241

    ld a, $78
    ld b, $18
    ld c, $06
    ld hl, $c350

jr_000_0254:
    ld [hl], b
    inc hl
    ld [hl+], a
    inc hl
    inc hl
    add $08
    dec c
    jr nz, jr_000_0254

    ld a, $78
    ld [$c341], a
    add $08
    ld [$c345], a
    ld a, $10
    ld [$c340], a
    ld [$c344], a
    ld a, $78
    ld [$c349], a
    add $08
    ld [$c34d], a
    ld a, $28
    ld [$c348], a
    ld [$c34c], a
    ret


    ld bc, $00b0
    ld de, $9410
    rst $08
    ld h, e
    ret


    ld bc, $00c0
    ld de, $9610
    rst $08
    ld h, e
    ret


    ld bc, $03c0
    ld de, $8000
    rst $08
    ld h, e
    ret


jr_000_029e:
    rst $08
    or c
    ldh a, [$8a]
    and a
    jr nz, jr_000_029e

    ret


jr_000_02a6:
    rst $08
    or c
    ldh a, [$8a]
    and a
    jr z, jr_000_02a6

    ret


    rst $10
    ld b, $00
    rst $10
    db $ec
    rst $38
    ret


    rst $10
    ld b, $00
    rst $10
    db $ed
    rst $38
    ret


    rst $10
    ld b, $00
    rst $10
    sbc $ff
    ret


    ret


    ld a, [$c92d]
    and a
    ret z

jr_000_02c9:
    push af
    rst $10
    ld b, $00
    rst $10
    ld [$c900], sp
    pop af
    dec a
    jr nz, jr_000_02c9

    ret


    ldh a, [$9a]
    and $07
    jr nz, jr_000_02f6

    rst $10
    ld b, $00
    rst $10
    db $d3
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    and l
    nop
    ret


    ld a, [$c904]
    sub $01
    jr nc, jr_000_02f3

    ld a, $1f

jr_000_02f3:
    ld [$c904], a

jr_000_02f6:
    ldh a, [$9a]
    dec a
    ldh [$9a], a
    ret


    ld a, [$c92d]
    and a
    ret z

jr_000_0301:
    push af
    rst $10
    ld b, $00
    rst $10
    inc e
    nop
    ret


    pop af
    dec a
    jr nz, jr_000_0301

    ld a, [$cb31]
    and a
    ret nz

    ldh a, [$8a]
    bit 0, a
    ret z

    ld a, $01
    ld [$cb31], a
    ld a, [$cb56]
    rst $08
    inc d
    ret


    ld a, [$c90c]
    and a
    ret nz

    ldh a, [$8a]
    bit 5, a
    jr z, jr_000_0334

    rst $10
    ld b, $00
    rst $10
    ld de, $c900

jr_000_0334:
    ldh a, [$8a]
    bit 4, a
    jr z, jr_000_0341

    rst $10
    ld b, $00
    rst $10
    ld a, [bc]
    nop
    ret


jr_000_0341:
    ret


    ldh a, [$9b]
    dec a
    ldh [$9b], a
    ret


    ldh a, [$9b]
    inc a
    ldh [$9b], a
    ret


    rst $08
    or l
    ld a, $01
    ld [$c90c], a
    xor a
    ld [$c90b], a
    ld a, [$c904]
    push af
    inc a
    and $1f
    ld [$c904], a
    ld c, $12

jr_000_0365:
    push bc
    rst $10
    ld b, $00
    rst $10
    ld c, c
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    dec de
    nop
    ret


    ld a, [$c904]
    inc a
    ld [$c904], a
    pop bc
    dec c
    jr nz, jr_000_0365

    pop af
    ld [$c904], a
    xor a
    ld [$c90c], a
    ld a, $03
    rst $08
    or h
    ret


    ld a, [$c904]
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
    sla c
    rl b
    ld hl, $9800
    add hl, bc
    ld bc, $0020
    ld de, $c90d
    rst $08
    ld [bc], a
    ret


    rst $10
    ld b, $00
    rst $10
    ld [$c901], a
    ld e, $41
    ld bc, $0020
    ld hl, $c90d
    rst $08
    and [hl]
    rst $10
    ld b, $00
    rst $10
    reti


    nop
    ret


    ld a, [$c907]
    inc a
    srl a
    ld c, a
    ld a, [$c905]
    sub c
    and $1f
    ld [$c908], a
    ld c, a
    ld a, [$c907]
    add c
    dec a
    and $1f
    ld [$c909], a
    rst $10
    ld b, $00
    rst $10
    dec sp
    inc bc
    ret


    rst $10
    ld b, $00
    rst $10
    ld c, h
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    ld h, b
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    ld e, h
    inc bc
    ret


    rst $10
    ld b, $00
    rst $10
    stop
    ret


    ld a, [$cb30]
    ld b, $00
    ld c, a
    dec a
    and $0f
    ld [$cb30], a
    ret


    ld a, [$cb30]
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
    sla c
    rl b
    ld hl, $c930
    add hl, bc
    ld bc, $0020
    ld de, $c90d
    rst $08
    ld [bc], a
    ret


    ld a, [$c907]
    ld e, a
    ld b, $00
    ld a, [$c908]
    ld c, a

jr_000_0447:
    ld hl, $c90d
    ld a, c
    and $1f
    ld c, a
    add hl, bc
    ld a, [$c90a]
    ld [hl], a
    inc c
    dec e
    jr nz, jr_000_0447

    ret


    ld a, [$c90b]
    ld b, $00
    ld c, a
    sla c
    rl b
    rst $10
    jr z, jr_000_0465

jr_000_0465:
    pop hl
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    dec hl
    add hl, bc
    push hl
    ld a, [$c908]
    dec a
    and $1f
    ld b, $00
    ld c, a
    ld hl, $c90d
    add hl, bc
    ld e, l
    ld d, h
    ld a, [$c909]
    inc a
    and $1f
    ld b, $00
    ld c, a
    ld hl, $c90d
    add hl, bc
    ret


    adc h
    nop
    sub c
    nop
    and h
    nop
    or a
    nop
    cp h
    nop
    pop bc
    nop
    adc $00
    db $d3
    nop
    ld [c], a
    nop
    ld a, [$fd00]
    nop
    ld a, [$c90b]
    ld b, $00
    ld c, a
    sla c
    rl b
    rst $10
    rrca
    nop
    pop hl
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    dec hl
    add hl, bc
    push hl
    ld hl, $c907
    ret


    ld d, $00
    dec d
    nop
    inc d
    nop
    inc de
    nop
    ld a, [de]
    nop
    ld hl, $2000
    nop
    ld hl, $2900
    nop
    inc b
    nop
    ld [bc], a
    nop
    ret


    ret


    ret


    dec [hl]
    rst $10
    ld b, $00
    rst $10
    inc l
    nop
    ret


    ret


    dec [hl]
    rst $10
    ld b, $00
    rst $10
    inc de
    nop
    ret


    ret


    ret


    dec [hl]
    dec [hl]
    ret


    ld a, [$c905]
    inc a
    and $1f
    ld [$c905], a
    ret


    ret


    ld a, [$c907]
    and $01
    ld c, a
    ld a, [$c905]
    add c
    and $1f
    ld [$c905], a
    ret


    ld a, [$c907]
    and $01
    xor $01
    ld c, a
    ld a, [$c905]
    sub c
    and $1f
    ld [$c905], a
    ret


    ld a, $42
    ld [de], a
    ld a, $43
    ld [hl], a
    ret


    ld a, $42
    ld [de], a
    ld a, $48
    ld [hl], a
    ld a, [$c907]
    inc a
    ld [$c907], a
    rst $10
    ld b, $00
    rst $10
    add $ff
    ret


    ret


    ld a, $47
    ld [de], a
    ld a, $43
    ld [hl], a
    ld a, [$c907]
    inc a
    ld [$c907], a
    rst $10
    ld b, $00
    rst $10
    pop bc
    rst $38
    ret


    ret


    ld a, $42
    ld [de], a
    ld a, $46
    ld [hl], a
    ret


    ld a, $45
    ld [de], a
    ld a, $43
    ld [hl], a
    ret


    ld a, $47
    ld [de], a
    ld a, $48
    ld [hl], a
    ld a, [$c907]
    inc a
    inc a
    ld [$c907], a
    ret


    ld a, $45
    ld [de], a
    ld a, $46
    ld [hl], a
    ret


    ld a, $45
    ld [de], a
    ld a, [$c909]
    ld b, $00
    ld c, a
    ld hl, $c90d
    add hl, bc
    ld a, $48
    ld [hl], a
    ret


    ld a, $47
    ld [de], a
    ld a, [$c909]
    ld b, $00
    ld c, a
    ld hl, $c90d
    add hl, bc
    ld a, $46
    ld [hl], a
    ld a, [$c905]
    dec a
    and $1f
    ld [$c905], a
    ret


    ld a, $49
    ld [de], a
    ld [hl], a
    ret


    ld a, $4a
    ld [de], a
    ld [hl], a
    ret


    ld a, $20
    ld [$c90a], a
    ld a, [$c902]
    and a
    jr nz, @+$09

    rst $10
    ld b, $00
    rst $10
    ld [de], a
    ld bc, $fac9
    nop
    ret


    ld b, $00
    ld c, a
    sla c
    rl b
    rst $10
    inc c
    nop
    pop hl
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    dec hl
    add hl, bc
    push hl
    ret


    stop
    ld [hl+], a
    nop
    inc [hl]
    nop
    ld b, [hl]
    nop
    add h
    nop
    sbc l
    nop
    or [hl]
    nop
    rst $08
    nop
    ld hl, $c901
    dec [hl]
    jr z, jr_000_05e6

    ld a, $00
    ld [$c90b], a
    ret


jr_000_05e6:
    xor a
    ld [$c902], a
    rst $10
    or [hl]
    rst $38
    ret


    ld hl, $c901
    dec [hl]
    jr z, jr_000_05fa

    ld a, $07
    ld [$c90b], a
    ret


jr_000_05fa:
    xor a
    ld [$c902], a
    rst $10
    and d
    rst $38
    ret


    ld hl, $c901
    dec [hl]
    jr z, jr_000_060e

    ld a, $08
    ld [$c90b], a
    ret


jr_000_060e:
    xor a
    ld [$c902], a
    rst $10
    adc [hl]
    rst $38
    ret


    ld a, [$c903]
    and a
    jr z, jr_000_0627

    dec a
    jr z, jr_000_0647

    xor a
    ld [$c902], a
    rst $10
    ld a, l
    rst $38
    ret


jr_000_0627:
    ld hl, $c901
    dec [hl]
    jr z, jr_000_0633

    ld a, $00
    ld [$c90b], a
    ret


jr_000_0633:
    ld hl, $c903
    inc [hl]
    ld a, $09
    ld [$c90b], a
    ld a, $49
    ld [$c90a], a
    ld a, $01
    ld [$cb35], a
    ret


jr_000_0647:
    ld hl, $c903
    inc [hl]
    ld a, $0a
    ld [$c90b], a
    ld a, $4a
    ld [$c90a], a
    ret


    ld a, [$c907]
    cp $10
    jr c, jr_000_0665

jr_000_065d:
    xor a
    ld [$c902], a
    rst $10
    ccf
    rst $38
    ret


jr_000_0665:
    ld hl, $c901
    dec [hl]
    jr z, jr_000_065d

    ld a, $01
    ld [$c90b], a
    ret


    ld a, [$c907]
    cp $10
    jr c, jr_000_0680

jr_000_0678:
    xor a
    ld [$c902], a
    rst $10
    inc h
    rst $38
    ret


jr_000_0680:
    ld hl, $c901
    dec [hl]
    jr z, jr_000_0678

    ld a, $02
    ld [$c90b], a
    ret


    ld a, [$c907]
    cp $07
    jr nc, jr_000_069b

jr_000_0693:
    xor a
    ld [$c902], a
    rst $10
    add hl, bc
    rst $38
    ret


jr_000_069b:
    ld hl, $c901
    dec [hl]
    jr z, jr_000_0693

    ld a, $03
    ld [$c90b], a
    ret


    ld a, [$c907]
    cp $07
    jr nc, jr_000_06b6

jr_000_06ae:
    xor a
    ld [$c902], a
    rst $10
    xor $fe
    ret


jr_000_06b6:
    ld hl, $c901
    dec [hl]
    jr z, jr_000_06ae

    ld a, $04
    ld [$c90b], a
    ret


jr_000_06c2:
    ld a, [$cb3d]
    and a
    jr nz, jr_000_06cf

    ld a, [$c900]
    cp $04
    jr c, jr_000_06d5

jr_000_06cf:
    xor a
    ld [$c900], a
    jr jr_000_06dc

jr_000_06d5:
    rst $10
    ld b, $00
    rst $10
    ld [hl-], a
    nop
    ret


jr_000_06dc:
    rst $10
    ld b, $00
    rst $10
    inc sp
    nop
    ret


    ld a, [$c901]
    and a
    jr z, jr_000_06c2

    ld a, $01
    ld [$c902], a
    xor a
    ld [$c903], a
    ld a, [$c900]
    cp $03
    ret nz

    ld a, $20
    ld [$cb35], a
    ld a, [$cb58]
    rst $08
    inc d
    xor a
    rst $10
    ld b, $00
    rst $10
    ld l, $01
    ret


    ret


    rst $08
    adc [hl]
    and $07
    ld [$c900], a
    ret


    rst $08
    adc [hl]

jr_000_0715:
    sub $13
    jr nc, jr_000_0715

    add $13
    cp $03
    jr nc, jr_000_0721

    ld a, $03

jr_000_0721:
    ld [$c901], a
    ret


    ld a, [$cb36]
    and a
    ret nz

    ld a, [$c90c]
    and a
    ret nz

    rst $08
    adc [hl]
    and $1f
    cp $07
    ret nz

    rst $08
    adc [hl]
    and $03
    ret z

    ld [$cb36], a
    rst $08
    adc [hl]
    and $07
    add $05
    ld [$cb38], a
    ld a, $20
    ld [$cb35], a
    ld a, [$cb58]
    rst $08
    inc d
    ld a, $01
    rst $10
    ld b, $00
    rst $10
    sbc $00
    ret


    ret


    ld a, [$cb36]
    and a
    ret z

    ld a, [$cb38]
    and a
    jr z, jr_000_0772

    dec a
    ld [$cb38], a
    ret nz

    ld a, [$c905]
    ld [$cb37], a
    ret


jr_000_0772:
    rst $10
    ld b, $00
    rst $10
    inc b
    nop
    ret


    ret


    ld a, [$cb36]
    and $7f
    sla a
    sla a
    add $5d
    ld c, a
    ld a, [$cb36]
    and $80
    rlca
    xor $01
    sla a
    add c
    ld e, a
    ld a, [$cb37]
    ld b, $00
    ld c, a
    ld hl, $c90d
    add hl, bc
    ld a, e
    ld [hl], a
    inc e
    ld a, [$cb37]
    inc a
    and $1f
    ld b, $00
    ld c, a
    ld hl, $c90d
    add hl, bc
    ld a, e
    ld [hl], a
    ld a, [$cb36]
    bit 7, a
    jr nz, jr_000_07bb

    or $80
    ld [$cb36], a
    ret


jr_000_07bb:
    xor a
    ld [$cb36], a
    ret


    ld a, $78
    add c
    ld [$c300], a
    ld [$c304], a
    add $08
    ld [$c308], a
    ld [$c30c], a
    ld a, $52
    add b
    ld [$c301], a
    ld [$c309], a
    add $08
    ld [$c305], a
    ld [$c30d], a
    ret


    ld a, [$cb32]
    and a
    jr nz, jr_000_07f7

    xor a
    ld [$c310], a
    ld [$c314], a
    ld [$c318], a
    ld [$c31c], a
    ret


jr_000_07f7:
    srl a
    srl a
    srl a
    srl a
    sla a
    sla a
    add $15
    ld [$c312], a
    inc a
    ld [$c316], a
    inc a
    ld [$c31a], a
    inc a
    ld [$c31e], a
    ld a, $52
    ld [$c311], a
    ld [$c319], a
    add $08
    ld [$c315], a
    ld [$c31d], a
    ld a, $78
    ld [$c310], a
    ld [$c314], a
    add $08
    ld [$c318], a
    ld [$c31c], a
    ret


    sla a
    sla a
    add $1d
    ld [$c322], a
    inc a
    ld [$c326], a
    inc a
    ld [$c32a], a
    inc a
    ld [$c32e], a
    ret


    ld a, [$cb3d]
    and a
    ret z

    ld a, [$cb3e]
    rst $10
    ld b, $00
    rst $10
    inc h
    nop
    ret


    ld a, [$cb3e]
    dec a
    ld [$cb3e], a
    cp $d8
    ret nz

    xor a
    ld [$cb3d], a
    ld [$c90c], a
    ld [$c380], a
    ld [$c384], a
    ld [$c388], a
    ld [$c38c], a
    ld [$c390], a
    ret


    ld b, a
    ld c, $05
    ld de, $0004
    ld hl, $c381

jr_000_0884:
    ld a, b
    cp $a8
    jr c, jr_000_088a

    xor a

jr_000_088a:
    ld [hl], a
    add hl, de
    ld a, b
    add $08
    ld b, a
    dec c
    jr nz, jr_000_0884

    ret


    rst $10
    ld b, $00
    rst $10
    jp nz, $c909

    rst $10
    ld b, $00
    rst $10
    ld b, a
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    ld h, [hl]
    nop
    ret


    ld a, $08
    ld [$cb3f], a

jr_000_08ae:
    rst $10
    ld b, $00
    rst $10
    jr jr_000_08b4

jr_000_08b4:
    ret


    ld a, $02
    rst $10
    ld b, $00
    rst $10
    inc hl
    add hl, bc
    ret


    ld a, [$cb3f]
    inc a
    ld [$cb3f], a
    cp $62
    jr c, jr_000_08ae

    ret


    ld b, a
    ld c, $08
    ld de, $fffc
    ld hl, $c39c

jr_000_08d3:
    ld a, b
    sub $02
    jr nc, jr_000_08d9

    xor a

jr_000_08d9:
    ld b, a
    cp $50
    jr c, jr_000_08e0

    ld a, $50

jr_000_08e0:
    ld [hl], a
    add hl, de
    dec c
    jr nz, jr_000_08d3

    ret


    ld de, $0004
    ld hl, $c382
    ld a, $37
    ld [hl], a
    add hl, de
    ld a, $35
    ld [hl], a
    add hl, de
    ld a, $38
    ld [hl], a
    add hl, de
    ld a, $39
    ld [hl], a
    add hl, de
    ld a, $3a
    ld [hl], a
    add hl, de
    ld a, $3b
    ld [hl], a
    add hl, de
    ld a, $39
    ld [hl], a
    add hl, de
    ld a, $36
    ld [hl], a
    ret


    ld c, $08
    ld e, $68
    ld hl, $c39d

jr_000_0913:
    ld a, e
    ld [hl-], a
    sub $08
    ld e, a
    ld a, $08
    ld [hl-], a
    dec hl
    dec hl
    dec c
    jr nz, jr_000_0913

    ret


    ld a, [$cb31]
    and a
    ret z

    dec a
    jr z, jr_000_094d

    dec a
    jr z, jr_000_0977

jr_000_092c:
    ld a, [$cb32]
    dec a
    jr nz, jr_000_0935

    ld [$cb31], a

jr_000_0935:
    ld [$cb32], a
    srl a
    ld b, a
    cpl
    inc a
    ld c, a
    rst $10
    ld b, $00
    rst $10
    ld a, [hl]
    cp $c9
    rst $10
    ld b, $00
    rst $10
    sbc d
    cp $c9
    ret


jr_000_094d:
    ld a, [$cb32]
    inc a
    cp $20
    jr c, jr_000_095f

    xor a
    ld [$cb32], a
    ld hl, $cb31
    inc [hl]
    jr jr_000_0977

jr_000_095f:
    ld [$cb32], a
    srl a
    ld b, a
    cpl
    inc a
    ld c, a
    rst $10
    ld b, $00
    rst $10
    ld d, h
    cp $c9
    rst $10
    ld b, $00
    rst $10
    ld [hl], b
    cp $c9
    ret


jr_000_0977:
    ld a, [$cb32]
    inc a
    cp $08
    jr c, jr_000_098a

    ld a, $1f
    ld [$cb32], a
    ld hl, $cb31

Jump_000_0987:
    inc [hl]
    jr jr_000_092c

jr_000_098a:
    ld [$cb32], a
    ret


    rst $10
    ld b, $00
    rst $10
    ld sp, $c900
    ld de, $cb3b
    ld hl, $c36a
    rst $10
    ld b, $00
    rst $10
    ld h, c
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    add hl, sp
    nop
    ret


    ret nc

    ld bc, $0003
    ld de, $cb39
    ld hl, $cb50
    rst $08
    ld [bc], a
    ld de, $cb52
    ld hl, $c352
    rst $10
    ld b, $00
    rst $10
    ld b, c
    nop
    ret


    ret


    xor a
    ld c, a
    ld hl, $cb39

jr_000_09c8:
    inc c
    ld a, c
    cp $04
    jr nc, jr_000_09d6

    ld a, [hl]
    add $01
    daa
    ld [hl+], a
    jr z, jr_000_09c8

    ret


jr_000_09d6:
    ld a, $99
    ld hl, $cb39
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ret


    ld c, $03
    ld de, $cb3b
    ld hl, $cb52

jr_000_09e7:
    ld a, [de]
    dec de
    ld b, a
    ld a, [hl-]
    sub b
    ret nz

    dec c
    jr nz, jr_000_09e7

    ld a, [$cb3c]
    and a
    ret nz

    ld a, $01
    ld [$cb3c], a
    ld a, [$cb5a]
    rst $08
    inc d
    ret


    ld c, $03

jr_000_0a02:
    ld a, [de]
    srl a
    srl a
    srl a
    srl a
    add $25
    ld [hl+], a
    inc hl
    inc hl
    inc hl
    ld a, [de]
    dec de
    and $0f
    add $25
    ld [hl+], a
    inc hl
    inc hl
    inc hl
    dec c
    jr nz, jr_000_0a02

    ret


    ld a, $0c
    rst $08
    cp c
    ld a, $03
    rst $08
    or h
    rst $10
    ld b, $00
    rst $10
    ld [hl], d
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    adc h
    nop
    ret


    rst $10
    ld b, $00
    rst $10
    pop hl
    nop
    ret


    ld bc, $4010
    ld e, $04

jr_000_0a41:
    rst $10
    ld b, $00
    rst $10
    ld b, c
    ld bc, $cbc9
    ld b, a
    jr nz, jr_000_0a52

    bit 3, a
    jr nz, jr_000_0a52

    jr jr_000_0a41

jr_000_0a52:
    rst $10
    ld b, $00
    rst $10
    ld c, b
    ld hl, sp-$37
    ld a, [$cb54]
    rst $08
    inc d
    ld a, [$cb40]
    and a
    jr nz, jr_000_0a65

    ret


jr_000_0a65:
    dec a
    jr nz, @+$06

    rst $10
    ld h, a
    ld bc, $3dc9
    jr nz, jr_000_0a73

    rst $10
    rlca
    nop
    ret


jr_000_0a73:
    rst $10
    adc c
    or $c9
    ld hl, $cb50
    xor a
    ld [hl+], a
    ld a, $30
    ld [hl+], a
    xor a
    ld [hl], a
    ld a, $0a
    ld [$0000], a
    rst $10
    ld c, c
    rlca
    pop hl
    xor a
    ld [hl+], a
    ld a, $30
    ld [hl+], a
    xor a
    ld [hl], a
    xor a
    ld [$0000], a
    xor a
    ld [$cb40], a
    rst $10
    add l
    rst $38
    ret


    ld hl, $c300
    ld a, $40
    ld [hl+], a
    ld a, $a8
    ld [hl+], a
    ld a, $10
    ld [hl+], a
    inc hl
    ld a, $40
    ld [hl+], a
    ld a, $b0
    ld [hl+], a
    ld a, $11
    ld [hl+], a
    inc hl
    ld a, $40
    ld [hl+], a
    ld a, $b8
    ld [hl+], a
    ld a, $12
    ld [hl], a
    ret


    ld c, $80

jr_000_0ac0:
    push bc
    ld a, $02
    rst $10
    ld b, $00
    rst $10
    rla
    rlca
    ret


    rst $10
    ld b, $00
    rst $10
    ld bc, $c908
    pop bc
    ldh a, [$8a]
    and a
    jr nz, jr_000_0afd

    ld hl, $c300
    ld a, c
    and $01
    ld b, a
    ld a, $3f
    sub b
    ld [hl+], a
    ld a, [hl]
    dec a
    ld [hl+], a
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    dec a
    ld [hl+], a
    sla b
    ld a, $13
    sub b
    ld [hl+], a
    inc hl
    inc hl
    ld a, [hl]
    dec a
    ld [hl+], a
    ld a, $14
    sub b
    ld [hl], a
    dec c
    jr nz, jr_000_0ac0

jr_000_0afd:
    rst $10
    ld b, $00
    rst $10
    sbc l
    rst $30
    ret


    ld hl, $c300
    ld a, $40
    ld [hl+], a
    ld a, $28
    ld [hl+], a
    inc hl
    ld a, [hl]
    or $20
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl+], a
    inc hl
    inc hl
    ld [hl+], a
    ld [hl], a
    ret


    ld hl, $0403
    rst $08
    cp b
    rst $10
    ld l, $06
    pop hl
    rst $08
    ld l, c
    ld hl, $0706
    rst $08
    cp b
    rst $10
    add hl, sp
    ld b, $e1
    rst $08
    ld l, c
    ld hl, $0708
    rst $08
    cp b
    rst $10
    inc [hl]
    ld b, $e1
    rst $08
    ld l, c
    ld hl, $070a
    rst $08
    cp b
    rst $10
    inc [hl]
    ld b, $e1
    rst $08
    ld l, c
    ld hl, $070c
    rst $08
    cp b
    rst $10
    inc sp
    ld b, $e1
    rst $08
    ld l, c
    ld hl, $cb46
    ld a, $48
    ld [hl+], a
    ld a, $49
    ld [hl+], a
    ld a, $3a
    ld [hl+], a
    ld c, $03
    ld de, $cb52

jr_000_0b62:
    ld a, [de]
    dec de
    ld b, a
    srl a
    srl a
    srl a
    srl a
    add $30
    ld [hl+], a
    ld a, b
    and $0f
    add $30
    ld [hl+], a
    dec c
    jr nz, jr_000_0b62

    xor a
    ld [hl], a
    ld hl, $050f
    rst $08
    cp b
    ld hl, $cb46
    rst $08
    ld l, c
    ret


jr_000_0b86:
    ldh a, [$8a]
    and a
    jr z, jr_000_0b86

    bit 6, a
    jr nz, jr_000_0bbf

    bit 2, a
    jr nz, jr_000_0bae

    bit 7, a
    jr nz, jr_000_0bae

    ret


jr_000_0b98:
    ld a, [$cb40]
    ld d, a
    xor a

jr_000_0b9d:
    add c
    dec d
    jr nz, jr_000_0b9d

    add b
    ld [$c300], a
    rst $10
    ld b, $00
    rst $10
    push af
    or $c9
    jr jr_000_0b86

jr_000_0bae:
    ld hl, $cb40
    ld a, [hl]
    inc a
    cp e
    jr c, jr_000_0bb7

    xor a

jr_000_0bb7:
    ld [hl], a
    ld a, [$cb53]
    rst $08
    inc d
    jr jr_000_0b98

jr_000_0bbf:
    ld hl, $cb40
    ld a, [hl]
    and a
    jr nz, jr_000_0bc7

    ld a, e

jr_000_0bc7:
    dec a
    ld [hl], a
    ld a, [$cb53]
    rst $08
    inc d
    jr jr_000_0b98

    ld a, $0c
    rst $08
    cp c
    rst $08
    ld a, [de]
    ld a, d
    ld [$cb5c], a
    ld a, e
    ld [$cb5d], a
    rst $10
    ld b, $00
    rst $10
    add $00
    ret


    ld a, $30
    ld [$c300], a
    ld a, $20
    ld [$c301], a
    xor a
    ld [$cb40], a

jr_000_0bf3:
    ld a, $02
    rst $10
    ld b, $00
    rst $10
    push hl
    dec b
    ret


    rst $10
    ld b, $00
    rst $10
    dec de
    ld bc, $01c9
    ld [$1e30], sp
    add hl, bc
    rst $10
    ld b, $00
    rst $10
    ld a, d
    rst $38
    ret


    bit 1, a
    jr nz, jr_000_0c21

    bit 4, a
    jr nz, jr_000_0c40

    bit 5, a
    jr nz, jr_000_0c66

    bit 0, a
    jr nz, jr_000_0c7e

    jr jr_000_0bf3

jr_000_0c21:
    xor a
    ld [$cb40], a
    ld a, $0a
    ld [$0000], a
    ld bc, $0009
    ld de, $cb53
    rst $10
    and d
    dec b
    pop hl
    rst $08
    ld [bc], a
    xor a
    ld [$0000], a
    rst $08
    ld de, $e2d7
    db $fd
    ret


jr_000_0c40:
    ld a, [$cb40]
    ld hl, $cb53
    ld c, a
    ld b, $00
    add hl, bc
    cp $08
    jr nc, jr_000_0c5a

    ld a, [$cb5d]
    ld c, a
    ld a, [hl]
    cp c
    jr nc, jr_000_0bf3

    inc a
    ld [hl], a
    jr jr_000_0bf3

jr_000_0c5a:
    ld a, [$cb5c]
    ld c, a
    ld a, [hl]
    cp c
    jr nc, jr_000_0bf3

    inc a
    ld [hl], a
    jr jr_000_0bf3

jr_000_0c66:
    ld a, [$cb40]
    ld hl, $cb53
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    and a
    jr nz, jr_000_0c78

    rst $10
    ld a, [hl]
    rst $38
    ret


jr_000_0c78:
    dec a
    ld [hl], a
    rst $10
    ld a, b
    rst $38
    ret


jr_000_0c7e:
    ld a, [$cb40]
    ld hl, $cb53
    ld c, a
    ld b, $00
    add hl, bc
    cp $08
    jr nc, jr_000_0c9a

    ld a, [hl]
    rst $08
    inc d
    rst $10
    ld b, $00
    rst $10
    dec bc
    or $c9
    rst $10
    ld e, h
    rst $38
    ret


jr_000_0c9a:
    ld a, [hl]
    rst $08
    inc de
    rst $10
    ld b, $00
    rst $10
    db $fd
    push af
    ret


    rst $10
    ld c, [hl]
    rst $38
    ret


    xor a
    ld [$cb40], a
    ld hl, $0602
    rst $08
    cp b
    rst $10
    push de
    inc b
    pop hl
    rst $08
    ld l, c
    ld hl, $0404
    rst $08
    cp b
    rst $10
    sub $04
    pop hl
    rst $08
    ld l, c
    ld hl, $0405
    rst $08
    cp b
    rst $10
    pop de
    inc b
    pop hl
    rst $08
    ld l, c
    ld hl, $0406
    rst $08
    cp b
    rst $10
    call z, $e104
    rst $08
    ld l, c
    ld hl, $0407
    rst $08
    cp b
    rst $10
    ret z

    inc b
    pop hl
    rst $08
    ld l, c
    ld hl, $0408
    rst $08
    cp b
    rst $10
    push bc
    inc b
    pop hl
    rst $08
    ld l, c
    ld hl, $0409
    rst $08
    cp b
    rst $10
    pop bc
    inc b
    pop hl
    rst $08
    ld l, c
    ld hl, $040a
    rst $08
    cp b
    rst $10
    cp h
    inc b
    pop hl
    rst $08
    ld l, c
    ld hl, $040b
    rst $08
    cp b
    rst $10
    cp e
    inc b
    pop hl
    rst $08
    ld l, c
    ld hl, $040c
    rst $08
    cp b
    rst $10
    or a
    inc b
    pop hl
    rst $08
    ld l, c
    ret


    ld c, $09

jr_000_0d1d:
    ld a, $09
    sub c
    ld b, a
    ld hl, $cb53
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    ld e, a
    ld d, $00
    ld hl, $cb41
    rst $08
    and h
    push hl
    ld h, $0e
    ld a, b
    add $04
    ld l, a
    rst $08
    cp b
    pop hl
    rst $08
    ld l, c
    dec c
    jr nz, jr_000_0d1d

    ret


    ld a, [$cb31]
    and a
    ret nz

    ld a, [$cb30]
    dec a
    and $0f
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
    sla c
    rl b
    ld hl, $c930
    add hl, bc
    ldh a, [$9b]
    srl a
    srl a
    srl a
    add $0a
    and $1f

jr_000_0d73:
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl]
    sub $20
    jr z, jr_000_0d7e

    scf
    ret


jr_000_0d7e:
    and a
    ret


jr_000_0d80:
    rst $38
    rrca
    rrca
    ld d, h
    ld a, e
    jr nc, @+$81

    ld d, b
    ld a, a
    ld a, a
    di
    nop
    inc bc
    inc c
    rlca
    ld [$0b04], sp
    ldh a, [$fe]
    ldh a, [$2a]
    sbc $0c
    cp $0a
    cp $03
    db $fc
    ret nz

    jr nc, jr_000_0d80

    db $10
    jr nz, jr_000_0d73

    xor $00
    db $fd
    ld a, a
    db $fd
    nop
    or e
    db $fc
    ld d, e
    db $fc
    or b
    rst $38
    ld d, b
    ld sp, hl
    rst $38
    dec b
    rrca
    nop
    ldh a, [$0d]
    dec c
    nop
    call $3fff
    jp z, $0d3f

    rst $38

jr_000_0dc0:
    ld a, [bc]
    rst $38
    and b
    or c
    ldh a, [$ef]
    inc [hl]
    ld a, e
    push af
    jr nz, jr_000_0dc0

    ld sp, hl
    ld h, d
    inc l
    add b
    sbc $05
    dec b
    ld a, [bc]
    add hl, bc
    rla
    nop
    dec d
    dec de
    nop
    add hl, de
    inc bc
    dec e
    ld h, b
    daa
    dec h
    nop
    dec hl
    add hl, hl
    nop
    dec l
    adc c
    adc c
    rst $38
    push bc
    pop bc
    inc [hl]
    ld [hl], e
    ld l, [hl]
    ld e, c
    ld a, [hl-]
    dec h
    rst $38
    ld e, $11
    dec h
    ld a, [hl-]
    ld e, b
    ld h, a
    ld [bc], a
    ld [bc], a
    rst $38
    jr nz, jr_000_0e1b

    adc b
    adc b
    add a
    add a
    ld e, c

Call_000_0e00:
    rst $18
    rst $38
    ld l, d
    or $34
    call z, $18e8
    push bc
    ld a, [$32ff]
    dec a
    ld c, $09
    ld d, l
    ld e, e
    ld a, [de]
    ld d, $ff
    ld [$2418], sp
    inc h
    ld bc, $5c01

jr_000_0e1b:
    cp h
    rst $38

jr_000_0e1d:
    or e
    ld c, a
    ld c, l
    or e
    ld e, [hl]
    cp [hl]
    or b
    ret nc

    db $fc
    or b
    call nc, $7050
    jr nz, jr_000_0e4e

    jp hl


    ld b, b
    add b
    cp $03
    ld [bc], a
    ld a, [bc]
    add hl, bc
    jr z, jr_000_0e55

    inc b
    ld e, $02
    ld a, e
    db $eb
    add b
    stop
    ld b, b
    add c
    ld bc, $c844
    rst $38
    ld b, b
    ld c, b
    ldh a, [rP1]
    inc hl
    nop
    rlca
    ld a, [bc]
    db $fc
    rlca

jr_000_0e4e:
    ld bc, $0049
    ld bc, $b328
    or e

jr_000_0e55:
    inc b
    rst $38
    jr nc, @-$3e

    add b
    ld a, b
    ld h, b
    add d
    ld l, b

jr_000_0e5e:
    or b
    and $10
    ret z

    add h
    xor a
    xor a
    ld b, b
    ld e, $3c
    call c, $ffd7
    ld h, [hl]
    ld a, [$6607]
    ld [$0204], a
    rra
    rst $18
    ld bc, $0277
    ld d, l
    ld [$3e00], sp
    jr @+$79

    db $fd
    ld d, d
    xor h
    ld b, $fb
    nop
    inc [hl]
    ld [$ff01], a
    nop
    dec bc
    add hl, bc
    ld a, $00
    ld h, a
    nop
    ld de, $af7f
    ld b, d
    sub b
    db $10
    jr jr_000_0e5e

    call nz, $9060
    xor $d0
    jr z, jr_000_0e1d

    or c
    rlca
    rlca
    rra
    ld b, l
    jr nc, jr_000_0ec0

    ld b, e
    ld b, e
    ld [bc], a
    or c
    ldh [$e0], a
    ld hl, sp+$55
    jr nc, @+$55

    inc h
    ld d, e
    nop
    ld b, e
    ccf
    ld h, c
    ld d, [hl]
    ld c, l
    db $fc
    ld [hl], c
    ld d, b
    ld d, e
    ld [hl], c
    ld [$03a1], a
    inc bc
    rrca

jr_000_0ec0:
    adc c
    add a
    ld b, $ea
    ret nz

    ret nz

jr_000_0ec6:
    ret nz

    ldh a, [$99]
    db $10
    sub a
    add a
    ld c, b
    adc e
    sub a
    ld b, d
    sbc e
    ld a, b
    add c
    ld h, h
    rlca
    inc b
    ld c, $09
    jp $00c1


    pop bc
    ld a, e
    sub a

Jump_000_0ede:
    inc b
    and b
    ld h, b
    db $10
    ldh a, [$d3]
    jr nz, jr_000_0ec6

    ld a, h
    db $db
    nop
    inc bc
    ld [bc], a
    ld [bc], a
    inc bc
    ld bc, $2526
    inc b
    or h
    ld bc, $40df
    ret nz

    rst $28
    ld bc, $3e80
    di
    inc b
    ccf
    rst $28
    ld b, e
    db $10
    jr jr_000_0f3a

    daa
    ld [hl], a
    ld c, a
    ld l, b
    ld sp, hl
    ld e, b
    ld c, b
    ld a, b
    jr nc, @+$32

    db $e3
    ld d, e

jr_000_0f0e:
    db $10
    jr jr_000_0f0e

    inc b
    db $fc
    ld a, [c]
    xor $1a
    ld d, $17
    ld [hl], d
    db $e3
    ld l, [hl]
    db $e4
    sbc h
    rst $18
    nop
    rst $18
    db $e3
    xor d
    sbc b
    ld a, b
    call c, $e060
    di
    ld a, h
    ld a, h
    add d
    ld b, c
    ld [hl], b
    ccf
    ld b, b
    ld l, h
    dec bc
    db $10
    ld c, a
    xor h
    nop
    ld [hl], c
    ldh [rP1], a
    ldh [$3f], a

jr_000_0f3a:
    nop
    ld sp, $f7f7
    ld b, $7e
    ld a, [hl]
    ld e, l
    ld l, a
    ld h, b
    xor h
    add h
    ld h, $7f
    ld d, b
    ld l, e
    inc b
    adc c
    db $10
    xor h
    cp $fe
    ld h, a
    jr z, jr_000_0fb3

    ld [hl], l
    ld [hl], b
    ld [hl], b
    sub c
    ld b, [hl]
    ld b, a
    ld e, a
    ld b, [hl]
    or c
    ld a, l
    inc b
    ld b, $3f
    cp a
    ld h, [hl]
    cp l
    ld l, e
    ld [bc], a
    ld h, c
    inc e
    inc e
    ld a, l
    inc b
    ld c, $41
    adc a
    inc b
    ld b, c
    ld a, l
    ld bc, $2020
    inc h
    pop af
    ld l, $ef
    ld h, d
    call $0181
    ld de, $7979
    dec b
    rlca
    ret c

    ld hl, sp-$08
    ld a, l
    inc b
    ldh a, [$f0]
    adc c
    adc c
    jr nz, jr_000_0f9a

    ld e, d
    adc l
    inc bc
    ld a, [hl]
    sub b
    ld a, h
    cp $b1
    ld b, e
    db $fc
    sub b
    inc sp
    ld h, a
    inc b
    adc a

jr_000_0f9a:
    add b
    ret nz

    rst $08
    nop
    rst $08
    ld [bc], a
    ld b, $34
    ld [hl], d
    nop
    add a
    add d
    jp nz, Jump_000_10e7

    add $cf
    add a
    nop
    dec b
    dec sp
    cpl
    ld b, h
    cpl
    ld c, a

jr_000_0fb3:
    ld b, l
    push hl
    jp nz, Jump_000_0987

    ld l, h
    ld a, [c]
    ld l, h
    sub d
    or [hl]
    sub d
    ld [hl], e
    rst $08
    ld de, $e7c6
    add c
    add [hl]
    xor a
    ld b, $39
    add c
    inc [hl]
    rst $20
    ld c, h
    ld d, $95
    ld b, h
    ld a, a
    and a
    jr nz, jr_000_103f

    jr c, jr_000_100d

    ld [hl+], a
    ld bc, $4804
    rst $38
    sub b
    ld bc, $2401
    ld c, b

Call_000_0fdf:
    nop
    ld [bc], a
    sub b
    rst $38
    db $10
    ld b, d
    add h
    nop
    dec h
    rlca
    rlca
    ld c, l
    or a
    sub l
    ret nz

    dec h
    ld c, l
    ret nz

    ld [$1595], sp
    ld b, a
    rst $38
    add a
    inc bc
    and d
    ldh [$e4], a
    xor b
    or b
    pop hl
    rst $38
    pop hl
    and h
    xor b
    ldh [$e2], a
    or b
    or b
    ld [c], a
    rst $18
    call nz, $afc0
    ld a, a
    ld a, a

jr_000_100d:
    xor d
    push de
    rst $38
    rst $38
    rst $38
    daa
    rlca
    ld a, [bc]
    ld c, [hl]
    cp h

jr_000_1017:
    inc d
    jr z, jr_000_1017

    jr c, jr_000_108c

    ld d, b
    and b
    ldh [$c0], a
    ld d, d
    db $10
    ld [c], a
    rst $38
    ldh [rHDMA4], a
    ld a, b
    jr c, @+$2b

    dec d
    inc e
    ld c, $f9
    ld a, [bc]
    dec b
    rlca
    inc bc
    inc bc
    or h
    ld a, [hl-]
    db $10
    ret nz

    ccf
    ld sp, hl
    rst $30
    nop
    ld l, b
    jr c, jr_000_1059

    sub h
    ld a, [de]

jr_000_103f:
    ld c, [hl]
    rst $00
    add a
    rlca
    or h
    dec bc
    nop
    add hl, bc
    rrca
    ld a, [bc]
    inc d
    cp $1c
    ld a, [hl-]
    jr z, jr_000_10a7

    ld [hl], d
    db $e4
    ldh [$df], a
    add b
    rst $38
    ld b, [hl]
    ret nc

    ld c, b
    add hl, hl

jr_000_1059:
    add h
    sub b
    ld [$c622], sp
    ld [hl], c
    ld d, l
    ld a, $b5
    add b
    db $ed
    ld d, l
    xor e
    ld h, l
    ld [$b51f], sp
    ld e, [hl]
    jr nz, jr_000_1078

    rrca
    inc c
    rra
    db $10
    ccf
    ei
    jr z, jr_000_10b4

    inc h
    ld a, a
    ld b, h

jr_000_1078:
    xor l
    nop
    cp $c6
    rst $30
    ld a, [$f906]
    rlca
    ld [hl], l
    di
    rrca
    sbc $ff
    ld a, $e6
    ld a, [hl]
    ld a, a
    ld b, d
    ld a, l

jr_000_108c:
    ld b, e
    db $fc
    rst $38
    add a
    ld hl, sp-$71
    add sp, -$61
    ld d, b
    ld a, a
    jr nz, @+$01

    ccf
    rra
    rra
    ld [bc], a
    cp $81
    rst $38
    ld b, c
    rst $38
    rst $38
    ld h, c
    rst $38
    ld a, [hl-]
    cp $0e

jr_000_10a7:
    cp $7c
    add l
    db $fc
    db $fd
    nop
    ld e, [hl]
    or h
    nop
    inc h
    dec e
    ld l, e
    ld [de], a

jr_000_10b4:
    ld e, e
    ld a, [$7767]
    rst $08
    or a
    rst $08
    sbc l
    ret nz

    inc d
    ld bc, $f8e7
    ld a, b
    db $fc
    cp b
    ld d, e
    nop
    cp $af
    rst $18
    or a
    rst $18
    db $ed
    rst $38
    ld a, a
    call nz, $7f00
    ccf
    ld a, a
    pop bc
    rra
    ccf
    and e
    cp h
    ld de, $bbbc
    nop
    cp b
    ld hl, sp-$19
    db $fc
    ldh a, [$f8]
    or e
    nop
    dec bc
    rlca
    inc b

Jump_000_10e7:
    ld e, $ff
    dec de
    ld a, [hl-]
    cpl
    inc a
    daa
    ccf
    inc sp
    ccf
    rst $28
    jr c, @+$7d

    ld h, a
    ld de, $2001
    ldh [$58], a
    ld hl, sp-$02
    ld d, h
    db $fc
    inc h
    db $fc
    call z, $1efc
    rst $08
    rst $38
    ld a, a
    ld l, e
    ld a, a
    ld a, d
    cp a
    or $bf
    ld [c], a
    sbc $5f
    ld a, a
    add sp, $01
    jr jr_000_1133

    rlca
    rlca
    rst $08
    rst $38
    sbc $fd
    ld [hl], a
    db $fd

jr_000_111c:
    rst $08
    ld a, [$e4fe]
    ld hl, sp-$04
    jr jr_000_111c

    ldh [$e0], a
    nop
    ld bc, $0302
    dec d
    ld d, $17
    jr jr_000_114c

    ld e, $1f
    jr nz, jr_000_113b

jr_000_1133:
    add hl, bc
    ld a, [bc]
    dec bc

jr_000_1136:
    cpl
    jr nc, @+$33

    ld [hl-], a
    dec h

jr_000_113b:
    dec h
    dec h
    dec h
    dec h
    dec h
    dec h
    dec h
    dec h
    dec h
    dec h
    dec h
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $34
    nop

jr_000_114c:
    nop
    nop
    cp h
    sbc $ac
    or [hl]
    cp h
    sbc $ac
    or [hl]
    cp h
    sbc $ac
    db $dd
    call z, Call_000_0fdf
    jp Jump_000_0ede


    adc $df
    db $dd
    nop
    ld c, $bd
    ret nz

    or b
    call nz, Call_000_0e00
    cp e
    or e
    db $dd
    call nz, $bede
    xor a
    jp $00b2


    ld c, $ca
    or d
    cp l
    cp d
    or c
    jr nz, jr_000_1136

    cp l
    nop
    ld c, $bc
    xor l
    or e
    ret c

    xor [hl]
    or e
    nop
    ld c, $bb
    or e
    db $dd
    call nz, $20de
    db $d3
    or b
    call nz, $00de
    rrca
    cp [hl]
    db $dd
    ret nz

    cp b
    nop
    rrca
    cp c
    xor a
    jp $00b2


    ld c, $ce
    rst $18
    or b
    cp l
    sbc $00
    ld c, $bc
    sbc $ac
    db $dd
    call z, $00df
    rrca
    jp z, $b8de

    jp z, $00c2

    rrca
    cp c
    or d
    cp d
    cp b
    nop
    ld c, $da
    call $d9de
    or c
    xor a
    call z, $00df
    ld c, $ca
    or d
    cp l
    cp d
    or c
    nop
    ld b, d
    ld b, a
    ld c, l
    nop
    nop
    jr nc, jr_000_11d3

jr_000_11d3:
    ld bc, $2e02
    rra
    rrca
    ld [hl], $37
    ld e, $05
    inc [hl]
    ld [de], a

jr_000_11de:
    push af
    rst $08
    or c
    pop af
    dec a
    jr nz, jr_000_11de

    ret


    ld a, [$cb31]
    and a
    ret nz

    ld hl, $cb33
    dec [hl]
    ret nz

    ld a, $04
    ld [hl], a
    ld a, [$cb34]
    xor $04
    ld [$cb34], a
    push af
    srl a
    srl a
    ld c, a
    ld b, $00
    rst $10
    ld b, $00
    rst $10
    cp c
    push af
    ret


    pop af
    ld [$c302], a
    inc a
    ld [$c306], a
    inc a
    ld [$c30a], a
    inc a
    ld [$c30e], a
    ret


    xor a
    ld [$cb34], a
    ld c, $0f

jr_000_1221:
    ld a, [$cb34]
    add $08
    ld [$c302], a
    inc a
    ld [$c306], a
    inc a
    ld [$c30a], a
    inc a
    ld [$c30e], a
    ld a, [$cb34]
    xor $04
    ld [$cb34], a
    ld a, $05
    rst $10
    ld b, $00
    rst $10
    sbc e
    rst $38
    ret


    dec c
    jr nz, jr_000_1221

    ret


    ld a, [$cb35]
    and a
    ret z

    ld a, [$cb35]
    dec a
    ld [$cb35], a
    srl a
    jr c, jr_000_1268

    xor a
    ld [$c320], a
    ld [$c324], a
    ld [$c328], a
    ld [$c32c], a
    ret


jr_000_1268:
    ld a, $52
    ld [$c321], a
    ld [$c329], a
    add $08
    ld [$c325], a
    ld [$c32d], a
    ld a, $18
    ld [$c320], a
    ld [$c324], a
    add $08
    ld [$c328], a
    ld [$c32c], a
    ret


    ld a, [$cb5e]
    ld l, a
    ld a, [$cb5f]
    ld h, a
    inc hl
    bit 1, h
    jr z, jr_000_12ab

    ld a, [$c92f]
    inc a
    cp $14
    jr c, jr_000_12a0

    ld a, $02

jr_000_12a0:
    ld [$c92f], a
    ld a, [$cb59]
    rst $08
    inc d
    ld hl, $0000

jr_000_12ab:
    ld a, l
    ld [$cb5e], a
    ld a, h
    ld [$cb5f], a
    ret


    ld a, [$c92f]
    ld b, a
    ld a, [$c92e]
    add b
    ld [$c92e], a
    srl a
    srl a
    ld [$c92d], a
    ld a, [$c92e]
    and $03
    ld [$c92e], a
    ret


    rst $08
    adc [hl]
    ld b, a
    xor c
    ld c, a
    ld a, [$cb60]
    ld l, a
    ld a, [$cb61]
    ld h, a
    inc hl
    add hl, bc
    ld a, l
    ld [$cb60], a
    ld a, h
    ld [$cb61], a
    ret


    ldh a, [$8a]
    bit 3, a
    ret z

    ld a, [$cb55]
    rst $08
    inc d
    rst $10
    ld b, $00
    rst $10
    xor c
    rst $28
    ret


jr_000_12f8:
    ldh a, [$8a]
    bit 3, a
    jr z, jr_000_12f8

    ld a, [$cb55]
    rst $08
    inc d
    rst $10
    ld b, $00
    rst $10
    sub a
    rst $28
    ret


    ret


    ld sp, $e000
    rst $10
    ld b, $00
    rst $10
    inc bc
    xor $c9
    rst $10
    ld b, $00
    rst $10
    ld b, $f7
    ret


    rst $10
    ld b, $00
    rst $10
    dec e
    xor $c9
    rst $10
    ld b, $00
    rst $10
    daa
    ldh a, [$c9]
    ld a, $01
    ld [$c90c], a
    ld [$cb3d], a
    ld a, [$cb5b]
    rst $08
    inc de
    ld a, $01
    rst $10
    ld b, $00
    rst $10
    and c
    cp $c9
    rst $10
    ld b, $00
    rst $10
    ld c, d
    or $c9
    rst $10
    ld b, $00
    rst $10
    or c
    rst $28
    ret


    rst $10
    ld b, $00
    rst $10
    rst $08
    push af
    ret


    rst $10
    ld b, $00
    rst $10
    adc l
    cp $c9
    rst $10
    ld b, $00
    rst $10
    ld [$c9fe], a
    rst $10
    ld b, $00
    rst $10
    db $e4
    db $f4
    ret


    rst $10
    ld b, $00
    rst $10
    ld b, [hl]
    rst $38
    ret


    rst $10
    ld b, $00
    rst $10
    ld c, a
    rst $28
    ret


    rst $10
    ld b, $00
    rst $10
    push bc
    ld sp, hl
    ret


    jr c, jr_000_139a

    rst $10
    ld b, $00
    rst $10
    inc b
    rst $38
    ret


    rst $10
    ld b, $00
    rst $10
    ld b, e
    rst $38
    ret


    rst $10
    ld b, $00
    rst $10
    ld d, h
    rst $38
    ret


    rst $10
    and b
    rst $38
    ret


jr_000_139a:
    xor a
    rst $08
    inc de
    ld a, [$cb57]
    rst $08
    inc d
    rst $10
    ld b, $00
    rst $10
    ld [hl], l
    cp $c9
    rst $10
    ld b, $00
    rst $10
    rst $20
    db $f4
    ret


    rst $10
    ld b, $00
    rst $10
    ld a, [$c9ee]
    ld a, $0a
    ld [$0000], a
    ld bc, $000c
    ld de, $cb50
    rst $10
    dec c
    cp $e1
    rst $08
    ld [bc], a
    xor a
    ld [$0000], a
    rst $10
    inc l
    db $ed
    ret

End:
