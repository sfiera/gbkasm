; Disassembly of "cannon-ball.gbf"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

include "hardware.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    db $4c, $1a, $1d, $00, $cc, $6d

Title::
    db "CANNON BALL"

Icon::
    INCBIN "gfx/icon/cannon-ball.2bpp"

Points::
    db $01, $00

Author::
    db "GBKISS LAB"

    db $02

History::
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00

Main::
    rst $08
    ld de, $203e
    rst $08
    or e
    rst $10
    add b
    ld a, [bc]
    pop de
    ld bc, $c600
    rst $08
    ld h, d
    ld de, $8800
    ld bc, $0450
    rst $08
    ld h, e
    xor a
    ld [$c650], a
    ld [$c651], a
    xor a
    ldh [$9b], a
    ldh [$9a], a
    ld a, $a0
    ldh [$a0], a
    ldh [$9f], a
    rst $10
    ld b, $00
    rst $10
    dec de
    ld a, [bc]
    ret


    rst $10
    ld b, $00
    rst $10
    sbc h
    nop
    ret


    ld a, $07
    rst $08
    or h
    ld a, $01
    ld [$c665], a
    xor a
    ld [$c656], a
    ld sp, $e000
    rst $10
    ld b, $00
    rst $10
    add h
    dec b
    ret


    rst $10
    ld b, $00
    rst $10
    ld l, $02
    ret


    rst $10
    ld b, $00
    rst $10
    cp d
    inc b
    ret


jr_000_015b:
    rst $08
    or c
    rst $08
    ret c

    rst $10
    ld b, $00
    rst $10
    ld [hl], l
    dec b
    ret


    rst $10
    ld b, $00
    rst $10
    call c, $c904
    rst $10
    ld b, $00
    rst $10
    and a
    ld [bc], a
    ret


    ld bc, $2800
    rst $08
    call nz, Call_000_06d7
    nop
    rst $10
    sub h
    dec b
    ret


    rst $10
    ld b, $00
    rst $10
    xor l
    inc bc
    ret


    rst $10
    ld b, $00
    rst $10
    ld c, l
    ld b, $c9
    rst $10
    ld b, $00
    rst $10
    pop hl
    ld b, $c9
    ld a, [$c665]
    cp $02
    jr nz, jr_000_015b

    ldh a, [$8b]
    and $02
    jr nz, jr_000_0202

    ldh a, [$8b]

jr_000_01a4:
    and $04
    jr nz, @+$5e

    ldh a, [$8b]
    and $01
    jr z, jr_000_015b

    ld a, $03
    ld [$c665], a
    ld hl, $c650
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [$c656], a
    ld [$c654], a
    rst $10
    add a
    jr jr_000_01a4

    ld a, [hl]
    rst $08
    inc de
    rst $10
    ld b, $00
    rst $10
    sbc e
    dec b
    ret


    jr jr_000_015b

    ld hl, $9800
    ld bc, $0200
    ld e, $20
    rst $08
    and [hl]
    ld hl, $9a00
    ld bc, $0014
    ld e, $c4
    rst $08
    and [hl]
    ld hl, $c66e
    ld bc, $0014
    ld e, $20
    rst $08
    and [hl]
    rst $10
    ld de, $e109
    rst $08
    ld e, h
    rst $10
    ld b, $00
    rst $10
    ld l, [hl]
    dec b
    ret


    rst $10
    ld b, $00
    rst $10
    xor l
    dec b
    ret


    ret


jr_000_0202:
    rst $08
    ld bc, $b5cf
    ld bc, $2800
    rst $08
    call nz, Call_000_06d7
    nop
    rst $10
    ret nz

    rst $38
    ret


    rst $10
    add hl, hl
    ld bc, $cfe1
    ld e, h
    xor a
    ld [$c656], a
    ld [$c66d], a
    rst $10
    ld b, $00
    rst $10
    jp hl


    nop
    ret


    ld a, $07
    rst $08
    or h
    rst $08
    or c
    rst $08
    ret c

    ld a, [$c656]
    sla a
    sla a
    sla a
    sla a
    add $40
    ld e, a
    ld d, $64
    ld bc, $0101
    ld hl, $0080
    xor a
    rst $08
    push bc
    ldh a, [$8b]
    and $40
    jr z, jr_000_0257

    ld a, [$c656]
    or a
    jr z, jr_000_0257

    dec a
    ld [$c656], a

jr_000_0257:
    ldh a, [$8b]
    and $80
    jr z, jr_000_0268

    ld a, [$c656]
    cp $04
    jr nc, jr_000_0268

    inc a
    ld [$c656], a

jr_000_0268:
    ldh a, [$8b]
    and $10
    jr z, jr_000_029b

    rst $10
    ret c

    rla
    pop hl
    ld d, $00
    ld a, [$c656]
    ld e, a
    add hl, de
    or a
    jr nz, jr_000_0281

    ld a, [$c653]
    jr jr_000_0284

jr_000_0281:
    ld a, [$c652]

jr_000_0284:
    cp [hl]
    jr z, jr_000_029b

    ld a, $0a
    ld [$0000], a
    inc [hl]
    xor a
    ld [$0000], a
    ld a, [$c656]
    rst $10
    ld b, $00
    rst $10
    add d
    nop
    ret


jr_000_029b:
    ldh a, [$8b]
    and $20
    jr z, jr_000_02c4

    rst $10
    and l
    rla
    pop hl
    ld d, $00
    ld a, [$c656]
    ld e, a
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_000_02c4

    ld a, $0a
    ld [$0000], a
    dec [hl]
    xor a
    ld [$0000], a
    ld a, [$c656]
    rst $10
    ld b, $00
    rst $10
    ld e, c
    nop
    ret


jr_000_02c4:
    ldh a, [$8b]
    and $01
    jr z, jr_000_02e2

    rst $10
    ld a, h
    rla
    pop hl
    ld d, $00
    ld a, [$c656]
    ld e, a
    add hl, de
    ld d, [hl]
    ld a, e
    or a
    jr z, jr_000_02df

    ld a, d
    rst $08
    inc d
    jr jr_000_02e2

jr_000_02df:
    ld a, d
    rst $08
    inc de

jr_000_02e2:
    ldh a, [$8b]
    and $02
    jr z, jr_000_0308

    rst $08
    or l
    ld a, $01
    ld [$c665], a
    rst $10
    ld b, $00
    rst $10
    call c, $c9fe
    xor a
    ld [$c656], a
    ld a, $07
    rst $08
    or h
    xor a
    rst $08
    inc de
    xor a
    rst $08
    inc d
    rst $10
    ld a, $fe
    ret


jr_000_0308:
    rst $10
    ld hl, $c9ff
    xor a

jr_000_030d:
    rst $10
    ld b, $00
    rst $10
    add hl, bc
    nop
    ret


    inc a
    cp $05
    jr c, jr_000_030d

    ret


    push af
    ld b, a
    add a
    add $06
    ld e, a
    ld d, $0d
    push de
    rst $10
    inc hl
    rla
    pop hl
    ld e, b
    ld d, $00
    add hl, de
    ld e, [hl]
    ld d, $00
    ld hl, $c668
    rst $08
    and h
    xor a
    ld [$c66d], a
    pop de
    rst $08
    ld l, d
    pop af
    ret


    dec b
    ld [bc], a
    ld b, e
    ld b, c
    ld c, [hl]
    ld c, [hl]
    ld c, a
    ld c, [hl]
    jr nz, @+$44

    ld b, c
    ld c, h
    ld c, h
    nop
    inc b
    inc bc
    ld d, e
    ld c, a
    ld d, l
    ld c, [hl]
    ld b, h
    jr nz, jr_000_0373

    ld b, e
    ld c, a
    ld c, [hl]
    ld b, [hl]
    ld c, c
    ld b, a
    nop
    dec b
    ld b, $42
    ld b, a
    ld c, l
    nop
    dec b
    ld [$4853], sp
    ld c, a
    ld d, h
    nop
    dec b
    ld a, [bc]
    ld c, b
    ld c, c
    ld d, h
    nop
    inc bc
    inc c
    ld c, b
    ld c, c
    ld d, e
    ld b, e

jr_000_0373:
    ld c, a
    ld d, d
    ld b, l
    nop
    dec b
    ld c, $44
    ld b, l
    ld b, c
    ld b, h
    nop
    rst $38
    ld hl, $c600
    xor a
    ld b, $50

jr_000_0385:
    ld [hl+], a
    dec b
    jr nz, jr_000_0385

    rst $10
    adc l
    rlca
    pop hl
    ld a, [$c656]
    and $03
    sla a
    sla a
    sla a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [$c656]
    srl a
    srl a
    and $03
    inc a
    ld [$c657], a
    ld e, a
    ld a, [hl+]
    ld b, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push hl
    rst $10
    ld b, $00
    rst $10
    ccf
    nop
    ret


    pop hl
    ld a, [hl+]
    ld b, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld d, [hl]
    rst $10
    ld b, $00
    rst $10
    ld sp, $c900
    rst $10
    ld l, a
    rlca
    pop hl
    ld a, [$c657]
    dec a
    sla a
    sla a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl+]
    ld [$c658], a
    ld a, [hl+]
    ld [$c659], a
    ld a, [hl+]
    ld [$c65a], a
    ld a, [hl+]
    ld [$c65b], a
    ld a, [$c656]
    and $03
    jr z, jr_000_03f0

    ld a, $01

jr_000_03f0:
    inc a
    ld [$c65d], a
    ret


    ld hl, $c600
    push af
    push bc
    push de
    ld b, $10

jr_000_03fd:
    ld a, [hl]
    or a
    jr z, jr_000_040c

    ld de, $0005
    add hl, de
    dec b
    jr nz, jr_000_03fd

    pop de
    pop bc
    pop af
    ret


jr_000_040c:
    pop de
    pop bc
    pop af
    ld [hl+], a
    ld [hl], b
    inc hl
    ld [hl], c
    inc hl
    ld [hl], d
    inc hl
    ld [hl], e
    ret


    ld hl, $c65c
    inc [hl]
    ld a, [hl]
    and $03
    ret nz

    ld a, [$c665]
    cp $03
    jr c, jr_000_042a

    and $80
    ret z

jr_000_042a:
    ld hl, $c600
    ld c, $10

jr_000_042f:
    ld a, [hl]
    cp $01
    jr c, jr_000_0440

    jr z, jr_000_0448

    cp $03
    jr c, jr_000_046f

    jr z, jr_000_049b

    rst $10
    add l
    nop
    ret


jr_000_0440:
    ld de, $0005
    add hl, de
    dec c
    jr nz, jr_000_042f

    ret


jr_000_0448:
    push bc
    push hl
    rst $10
    ld b, $00
    rst $10
    ret nc

    nop
    ret


    ld h, $04
    rst $10
    ld b, $00
    rst $10
    xor l
    nop
    ret


    ld a, [$c658]
    ld l, a
    rst $10
    ld b, $00
    rst $10
    add a
    nop
    ret


    pop hl
    rst $10
    ld b, $00
    rst $10
    cp l
    nop
    ret


    jr jr_000_0496

jr_000_046f:
    push bc
    push hl
    rst $10
    ld b, $00
    rst $10
    xor c
    nop
    ret


    ld h, $08
    rst $10
    ld b, $00
    rst $10
    add [hl]
    nop
    ret


    ld a, [$c659]
    ld l, a
    rst $10
    ld b, $00
    rst $10
    ld h, b
    nop
    ret


    pop hl
    rst $10
    ld b, $00
    rst $10
    sub [hl]
    nop
    ret


    jr jr_000_0496

jr_000_0496:
    pop bc
    rst $10
    xor h
    rst $38
    ret


jr_000_049b:
    push bc
    push hl
    rst $10
    ld b, $00
    rst $10
    ld a, l
    nop
    ret


    ld h, $10
    rst $10
    ld b, $00
    rst $10
    ld e, d
    nop
    ret


    ld a, [$c65a]
    ld l, a
    rst $10
    ld b, $00
    rst $10
    inc [hl]
    nop
    ret


    pop hl
    rst $10
    ld b, $00
    rst $10
    ld l, d
    nop
    ret


    jr jr_000_0496

    push bc
    push hl
    rst $10
    ld b, $00
    rst $10
    ld d, [hl]
    nop
    ret


    ld h, $17
    rst $10
    ld b, $00
    rst $10
    inc sp
    nop
    ret


    ld a, [$c65b]
    ld l, a
    rst $10
    ld b, $00
    rst $10
    dec c
    nop
    ret


    pop hl
    rst $10
    ld b, $00
    rst $10
    ld b, e
    nop
    ret


    jr jr_000_0496

    ld a, [$c657]
    ld h, a
    ld a, c
    add $04
    sra a
    sra a
    sra a
    add b
    ld b, a
    and $80
    jr z, jr_000_0500

    ld b, $80
    ld c, l
    ret


jr_000_0500:
    ld a, c
    add h
    ld c, a
    ret


    ld a, d
    add e
    ld d, a
    ld a, e
    sla a
    ld a, d
    jr nc, jr_000_0514

    sub h
    ret nc

    ld d, h

jr_000_0510:
    xor a
    sub e
    ld e, a
    ret


jr_000_0514:
    add h
    cp $a0
    ret c

    ld a, $9f
    sub h
    ld a, d
    jr jr_000_0510

    inc hl
    ld b, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld e, [hl]
    ret


    inc hl
    ld [hl], b
    inc hl
    ld [hl], c
    inc hl
    ld [hl], d
    inc hl
    ld [hl], e
    inc hl
    ret


    ld a, [$c65d]
    and $03
    jr z, jr_000_057a

    cp $02
    jr z, jr_000_0566

    jr c, jr_000_0552

    ld a, $0a
    ld [$c666], a
    ld hl, $c600
    rst $10
    ld b, $00
    rst $10
    ld b, h
    nop
    ret


    ld hl, $c605
    jr jr_000_058e

jr_000_0552:
    ld a, $0a
    ld [$c666], a
    ld hl, $c605
    rst $10
    ld b, $00
    rst $10
    jr nc, jr_000_0560

jr_000_0560:
    ret


    ld hl, $c600
    jr jr_000_058e

jr_000_0566:
    ld a, $f6
    ld [$c666], a
    ld hl, $c64b
    rst $10
    ld b, $00
    rst $10
    inc e
    nop
    ret


    ld hl, $c646
    jr jr_000_058e

jr_000_057a:
    ld a, $f6
    ld [$c666], a
    ld hl, $c646
    rst $10
    ld b, $00
    rst $10
    ld [$c900], sp
    ld hl, $c64b
    jr jr_000_058e

jr_000_058e:
    ld de, $c300
    ld a, [$c667]
    ld e, a
    ld c, $08

jr_000_0597:
    ld a, [hl]
    cp $01
    jr c, jr_000_05a6

    jr z, jr_000_05b1

    cp $03
    jr c, jr_000_05c0

    jr z, jr_000_05d3

    jr jr_000_05e2

jr_000_05a6:
    push de
    ld a, [$c666]
    add l
    ld l, a
    pop de
    dec c
    jr nz, jr_000_0597

    ret


jr_000_05b1:
    push hl
    push bc
    inc hl
    ld b, [hl]
    inc hl
    inc hl
    ld c, [hl]
    ld h, d
    ld l, e
    rst $10
    dec d
    inc b
    pop de
    jr jr_000_05ef

jr_000_05c0:
    push hl
    push bc
    inc hl
    ld b, [hl]
    inc hl
    inc hl
    ld c, [hl]
    ld h, d
    ld l, e
    rst $10
    dec bc
    inc b
    pop de
    jr jr_000_05ef

jr_000_05cf:
    pop bc
    pop hl
    jr jr_000_05a6

jr_000_05d3:
    push hl
    push bc
    inc hl
    ld b, [hl]
    inc hl
    inc hl
    ld c, [hl]
    ld h, d
    ld l, e
    rst $10
    ld bc, $d104
    jr jr_000_05ef

jr_000_05e2:
    push hl
    push bc
    inc hl
    ld b, [hl]
    inc hl
    inc hl
    ld c, [hl]
    ld h, d
    ld l, e
    rst $10
    inc de
    inc b
    pop de

jr_000_05ef:
    ld a, [de]
    cp $80
    jr z, jr_000_060a

    add b
    ld [hl+], a
    inc de
    ld a, [de]
    inc de
    add c
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, l
    cp $a0
    jr c, jr_000_05ef

    ld l, $10
    jr jr_000_05ef

jr_000_060a:
    ld a, l
    ld [$c667], a
    ld d, h
    ld e, l
    jr jr_000_05cf

    xor a
    ld [$c65e], a
    ld [$c65f], a
    ld [$c660], a
    ld [$c661], a
    ret


    ld a, [$c660]
    or a
    ret nz

    rst $10
    ld [hl+], a
    inc d
    pop hl
    ld a, [hl]
    rst $08
    inc d
    ld a, [$c662]
    srl a
    srl a
    srl a
    ld [$c65e], a
    ld a, $0e
    ld [$c65f], a
    ld a, $01
    ld [$c661], a
    ld [$c660], a
    ret


    ld a, [$c660]
    dec a
    jr z, jr_000_0650

    dec a
    jr z, jr_000_069e

    ret


jr_000_0650:
    ld a, [$c661]
    dec a
    ld [$c661], a
    ret nz

    ld a, $03
    ld [$c661], a
    ld a, [$c65f]
    dec a
    jr z, jr_000_0693

    ld h, $98
    ld [$c65f], a
    dec a
    sla a
    sla a
    sla a
    sla a
    sla a
    jr nc, jr_000_0676

    inc h

jr_000_0676:
    ld b, a
    ld a, [$c65e]
    or b
    ld l, a
    ld bc, $0001
    ld e, $ae
    push hl
    push bc
    rst $08
    and [hl]
    pop bc
    pop hl
    ld a, l
    add $20
    jr nc, jr_000_068d

    inc h

jr_000_068d:
    ld l, a
    ld e, $af
    rst $08
    and [hl]
    ret


jr_000_0693:
    ld a, $02
    ld [$c660], a
    ld a, $0e
    ld [$c65f], a
    ret


jr_000_069e:
    ld h, $98
    ld a, [$c65f]
    dec a
    ld [$c65f], a
    sla a
    sla a
    sla a
    sla a
    sla a
    jr nc, jr_000_06b4

    inc h

jr_000_06b4:
    ld b, a
    ld a, [$c65e]
    or b
    ld l, a
    ld a, [$c65e]
    ld bc, $0001
    ld e, $20
    rst $08
    and [hl]
    ld a, [$c65f]
    or a
    ret nz

    xor a
    ld [$c660], a
    ret


    ld a, $50
    ld [$c662], a
    xor a
    ld [$c664], a

Call_000_06d7:
    ret


    ld a, [$c665]
    or a
    ret nz

    ld a, [$c664]
    or a
    ret nz

    ld a, [$c662]
    ld b, a
    ldh a, [$8a]
    ld c, a
    and $20
    jr z, jr_000_06f4

    ld a, b
    cp $06
    jr c, jr_000_06f4

    dec b
    dec b

jr_000_06f4:
    ld a, c
    and $10
    jr z, jr_000_0700

    ld a, b
    cp $9b
    jr nc, jr_000_0700

    inc b
    inc b

jr_000_0700:
    ld a, b
    ld [$c662], a
    ld a, c
    and $01
    jr z, jr_000_0710

    rst $10
    ld b, $00
    rst $10
    inc de
    rst $38
    ret


jr_000_0710:
    ret


    ld a, [$c665]
    or a
    jr z, jr_000_071a

    cp $03
    ret c

jr_000_071a:
    ld hl, $c664
    ld a, [hl]
    or a
    jr nz, jr_000_0740

    ld a, [$c65c]
    ld l, $b0
    srl a
    srl a
    srl a
    and $04

jr_000_072e:
    add l
    ld l, a
    ld h, $00
    ld a, [$c662]
    ld d, a
    ld e, $80
    ld bc, $0201
    ld a, $00
    rst $08
    push bc
    ret


jr_000_0740:
    cp $04
    ret z

    ld hl, $c663
    dec [hl]
    jr nz, jr_000_0754

    ld [hl], $28
    ld hl, $c664
    inc [hl]
    ld a, [hl]
    cp $04
    jr z, jr_000_075f

jr_000_0754:
    ld a, [$c664]
    sla a
    sla a
    ld l, $b4
    jr jr_000_072e

jr_000_075f:
    ld a, $80
    ld [$c665], a
    ret


    ld hl, $0311
    rst $08
    cp b
    ld hl, $c650
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    rst $10
    ld b, $00
    rst $10
    dec a
    nop
    ret


    ld hl, $0d11
    rst $08
    cp b
    pop bc
    rst $10
    add $12
    pop hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, b
    cp d
    ret c

    jr nz, jr_000_078e

    ld a, c
    cp e
    ret c

    ret z

jr_000_078e:
    ld d, b
    ld e, c
    ld a, $0a
    ld [$0000], a
    ld [hl], d
    dec hl
    ld [hl], e
    xor a
    ld [$0000], a
    ld hl, $c654
    ld a, [hl]
    or a
    jr nz, jr_000_07ab

    inc [hl]
    rst $10
    and l
    ld [de], a
    pop hl
    ld a, [hl]
    rst $08
    inc d

jr_000_07ab:
    rst $10
    sbc c
    ld [de], a
    pop hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $c66e
    rst $08
    and e
    ld hl, $c66e
    rst $08
    ld l, c
    ret


    push hl
    ld a, [$c65d]
    add a
    ld b, a
    add a
    add a
    add b
    ld hl, $c650
    add [hl]
    ld [hl], a
    jr nc, jr_000_07cf

    inc hl
    inc [hl]

jr_000_07cf:
    rst $10
    ld b, $00
    rst $10
    sub d
    rst $38
    ret


    pop hl
    ret


    ld hl, $c665
    ld a, [hl]
    or a
    ret z

    cp $02
    ret z

    jr c, jr_000_0816

    cp $03
    jr nz, jr_000_0805

    inc [hl]
    rst $10
    adc c
    ld [bc], a
    pop hl
    rst $08
    ld e, h
    ld hl, $0b0c
    rst $08
    cp b
    ld a, [$c656]
    inc a
    ld e, a
    ld d, $00
    ld hl, $c66e
    rst $08
    and e
    rst $08
    ld l, c
    rst $10
    ld b, c
    ld sp, hl
    ret


jr_000_0805:
    cp $80
    jr nc, jr_000_081e

    inc [hl]
    cp $5a
    ret c

    xor a
    ld [hl], a
    rst $10
    and h
    ld [bc], a
    pop hl
    rst $08
    ld e, h
    ret


jr_000_0816:
    inc [hl]
    rst $10
    jr jr_000_081c

    pop hl
    rst $08

jr_000_081c:
    ld e, h
    ret


jr_000_081e:
    jr nz, jr_000_0833

    ld a, [$c660]
    or a
    ret nz

    inc [hl]
    rst $10
    sbc h
    ld [bc], a
    pop hl
    rst $08
    ld e, h
    xor a
    rst $08
    inc de
    xor a
    rst $08
    inc d
    ret


jr_000_0833:
    cp $c0
    jr c, jr_000_0846

    jr nz, jr_000_0861

    ld a, [$c660]
    or a
    ret nz

    inc [hl]
    rst $10
    sbc a
    ld [bc], a
    pop hl
    rst $08
    ld e, h
    ret


jr_000_0846:
    ld a, [$c65c]
    and $0f
    jr nz, jr_000_0853

    inc [hl]
    ld a, [hl]
    cp $c0
    jr z, jr_000_0858

jr_000_0853:
    ldh a, [$8a]
    and $03
    ret z

jr_000_0858:
    ld [hl], $01
    rst $10
    db $76
    ld [bc], a
    pop hl
    rst $08
    ld e, h
    ret


jr_000_0861:
    inc a
    ld [hl], a
    cp $ff
    ret nz

    ld [hl], $03
    ld hl, $c656
    inc [hl]
    rst $10
    add d
    ld [bc], a
    pop hl
    rst $08
    ld e, h
    ret


    ld a, [$c660]
    dec a
    jr nz, jr_000_08a1

    ld a, [$c65e]
    sla a
    sla a
    sla a
    ld b, a
    ld c, $08
    ld a, [$c65f]
    ld e, a
    sla a
    sla a
    sla a
    ld d, a
    ld a, $0f
    sub e
    sla a
    sla a
    sla a
    ld e, a
    rst $10
    ld b, $00
    rst $10
    dec de
    nop
    ret


jr_000_08a1:
    ld a, [$c664]
    or a
    ret nz

    ld a, [$c662]
    sub $04
    ld b, a
    ld c, $08
    ld de, $7410
    rst $10
    ld b, $00
    rst $10
    ld h, l
    nop
    ret


    ret


    ld hl, $c600
    ld a, $10

jr_000_08be:
    push af
    rst $10
    ld b, $00
    rst $10
    add a
    nop
    ret


    jr c, jr_000_0911

    pop af
    push hl
    rst $10
    ld a, [hl]
    ld de, $7ee1
    rst $08
    inc d
    pop hl
    rst $10
    ld b, $00
    rst $10
    rst $20
    cp $c9
    ld a, $02
    ld [$c660], a
    ld a, $0e
    ld [$c65f], a
    ld a, [hl]
    dec a
    jr z, jr_000_0902

    ld [hl+], a
    ld c, a
    ld b, [hl]
    inc hl
    ld [hl], $00
    inc hl
    ld d, [hl]
    inc hl
    xor a
    sub [hl]
    ld e, a
    ld a, c
    ld c, $00
    rst $10
    ld b, $00
    rst $10
    ei
    ld a, [$21c9]
    ld e, l
    add $34
    ret


jr_000_0902:
    ld [hl], $00
    ld hl, $c65d
    dec [hl]
    ld a, [hl]
    or a
    ret nz

    ld a, $c0
    ld [$c665], a
    ret


jr_000_0911:
    ld a, $05
    add l
    ld l, a
    pop af
    dec a
    jr nz, jr_000_08be

    ret


    ld a, [$c665]
    or a
    ret nz

    ld hl, $c600
    ld a, $10

jr_000_0924:
    push af
    rst $10
    ld b, $00
    rst $10
    ld hl, $c900
    jr c, jr_000_0941

    pop af
    rst $10
    dec de
    ld de, $7ee1
    rst $08
    inc d
    ld a, $01
    ld [$c664], a
    ld a, $3c
    ld [$c663], a
    ret


jr_000_0941:
    ld a, $05
    add l
    ld l, a
    pop af
    dec a
    jr nz, jr_000_0924

    ret


    push hl
    ld a, [hl+]
    cp $01
    jr c, jr_000_095a

    jr z, jr_000_095c

    cp $03
    jr c, jr_000_097c

    jr z, jr_000_0998

    jr jr_000_09b4

jr_000_095a:
    pop hl
    ret


jr_000_095c:
    ld a, [hl]
    sub d
    jr c, jr_000_0979

    sub e
    jr c, jr_000_0967

    sub $08
    jr nc, jr_000_0979

jr_000_0967:
    inc hl
    inc hl
    ld a, [hl]
    add $03
    sub b
    jr c, jr_000_0979

    sub c
    jr c, jr_000_0976

    sub $06
    jr nc, jr_000_0979

jr_000_0976:
    xor a
    jr jr_000_095a

jr_000_0979:
    scf
    jr jr_000_095a

jr_000_097c:
    ld a, [hl]
    sub d
    jr c, jr_000_0979

    sub e
    jr c, jr_000_0987

    sub $10
    jr nc, jr_000_0979

jr_000_0987:
    inc hl
    inc hl
    ld a, [hl]
    add $06
    sub b
    jr c, jr_000_0979

    sub c
    jr c, jr_000_0976

    sub $0c
    jr nc, jr_000_0979

    jr jr_000_0976

jr_000_0998:
    ld a, [hl]
    sub d
    jr c, jr_000_0979

    sub e
    jr c, jr_000_09a3

    sub $20
    jr nc, jr_000_0979

jr_000_09a3:
    inc hl
    inc hl
    ld a, [hl]
    add $0e
    sub b
    jr c, jr_000_0979

    sub c
    jr c, jr_000_0976

    sub $1c
    jr nc, jr_000_0979

jr_000_09b2:
    jr jr_000_0976

jr_000_09b4:
    ld a, [hl]
    sub d
    jr c, jr_000_0979

    sub e
    jr c, jr_000_09bf

    sub $2c
    jr nc, jr_000_0979

jr_000_09bf:
    inc hl
    inc hl
    ld a, [hl]
    add $14
    sub b
    jr c, jr_000_0979

    sub c
    jr c, jr_000_0976

    sub $28
    jr nc, jr_000_0979

    jr jr_000_0976

    ld [$8004], sp
    nop
    add b
    ld bc, $8200
    nop
    ld bc, $8408
    nop
    add b
    ldh a, [$f8]
    add [hl]
    nop
    nop
    ld hl, sp-$78
    nop
    ldh a, [rP1]
    adc d
    nop
    ldh a, [$08]
    adc h
    nop
    nop
    nop
    adc [hl]
    nop
    nop
    ld [$0090], sp
    ldh a, [rNR10]
    xor d
    nop
    nop
    db $10
    xor h
    nop
    add b
    pop hl
    ld hl, sp-$6c
    nop
    pop hl
    nop
    sub [hl]
    nop
    pop hl
    ld [$0098], sp
    pop hl
    db $10
    sbc d
    nop
    jp hl


    ldh a, [$92]
    nop
    jp hl


    jr jr_000_09b2

    nop
    ld sp, hl
    ldh a, [$9e]
    nop
    ld sp, hl
    jr @-$56

    nop
    add hl, bc
    ld hl, sp-$60
    nop
    add hl, bc
    nop
    and d
    nop
    add hl, bc
    ld [$00a4], sp
    add hl, bc
    db $10
    and [hl]
    nop
    add b
    inc b
    inc bc
    ld b, e
    ld b, c
    ld c, [hl]
    ld c, [hl]
    ld c, a
    ld c, [hl]
    jr nz, jr_000_0a7c

    ld b, c
    ld c, h
    ld c, h
    nop
    ld [bc], a
    rlca
    ld d, b
    ld d, l
    ld d, e
    ld c, b
    jr nz, @+$43

    jr nz, jr_000_0abc

    ld l, a
    jr nz, jr_000_0a9e

    ld d, h
    ld b, c
    ld d, d
    ld d, h
    nop
    ld [bc], a
    add hl, bc
    ld d, b
    ld d, l
    ld d, e
    ld c, b
    jr nz, jr_000_0a9a

    jr nz, jr_000_0ace

    ld l, a
    jr nz, @+$22

    ld b, l
    ld c, [hl]
    ld b, h
    nop
    inc bc
    inc c
    ld d, e
    ld b, l
    ld c, h
    ld b, l
    ld b, e
    ld d, h
    jr nz, @+$45

    ld c, a
    ld c, [hl]
    ld b, [hl]
    ld c, c
    ld b, a
    nop
    rst $38
    inc b
    inc bc
    jr nz, jr_000_0a96

    jr nz, jr_000_0a98

    jr nz, jr_000_0a9a

    jr nz, jr_000_0a9c

jr_000_0a7c:
    jr nz, jr_000_0a9e

    jr nz, jr_000_0a80

jr_000_0a80:
    ld [bc], a
    rlca
    jr nz, jr_000_0aa4

    jr nz, @+$22

    jr nz, jr_000_0aa8

    jr nz, jr_000_0aaa

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_000_0a92

jr_000_0a92:
    ld [bc], a
    add hl, bc
    jr nz, jr_000_0ab6

jr_000_0a96:
    jr nz, jr_000_0ab8

jr_000_0a98:
    jr nz, jr_000_0aba

jr_000_0a9a:
    jr nz, jr_000_0abc

jr_000_0a9c:
    jr nz, jr_000_0abe

jr_000_0a9e:
    jr nz, jr_000_0ac0

    jr nz, jr_000_0ac2

    nop
    inc bc

jr_000_0aa4:
    inc c
    jr nz, @+$55

    ld d, h

jr_000_0aa8:
    ld b, c
    ld b, a

jr_000_0aaa:
    ld b, l
    jr nz, jr_000_0acd

    jr nz, jr_000_0acf

    jr nz, jr_000_0ad1

    jr nz, jr_000_0ab3

jr_000_0ab3:
    rst $38
    inc b
    inc c

jr_000_0ab6:
    jr nz, @+$22

jr_000_0ab8:
    jr nz, @+$22

jr_000_0aba:
    jr nz, @+$22

jr_000_0abc:
    jr nz, jr_000_0ade

jr_000_0abe:
    jr nz, jr_000_0ae0

jr_000_0ac0:
    jr nz, jr_000_0ac2

jr_000_0ac2:
    rst $38
    dec b
    inc c
    ld b, a
    ld b, c
    ld c, l
    ld b, l
    jr nz, jr_000_0aeb

    ld c, a
    ld d, [hl]

jr_000_0acd:
    ld b, l

jr_000_0ace:
    ld d, d

jr_000_0acf:
    nop
    rst $38

jr_000_0ad1:
    dec b
    inc c
    jr nz, jr_000_0af5

    jr nz, jr_000_0af7

    jr nz, jr_000_0af9

    jr nz, jr_000_0afb

    jr nz, jr_000_0afd

    nop

jr_000_0ade:
    rst $38
    inc b

jr_000_0ae0:
    rlca
    ld d, e
    ld d, h
    ld b, c
    ld b, a
    ld b, l
    jr nz, @+$45

    ld c, h
    ld b, l
    ld b, c

jr_000_0aeb:
    ld d, d
    ld hl, $ff00
    inc b
    rlca
    jr nz, @+$22

    jr nz, @+$22

jr_000_0af5:
    jr nz, jr_000_0b17

jr_000_0af7:
    jr nz, jr_000_0b19

jr_000_0af9:
    jr nz, @+$22

jr_000_0afb:
    jr nz, jr_000_0b1d

jr_000_0afd:
    nop
    rst $38
    nop
    ld de, $5320
    ld b, e
    jr nz, jr_000_0b26

    jr nz, jr_000_0b28

    jr nz, jr_000_0b2a

    jr nz, jr_000_0b2c

    ld c, b
    ld c, c
    jr nz, jr_000_0b30

    jr nz, jr_000_0b32

    jr nz, jr_000_0b34

    jr nz, jr_000_0b16

jr_000_0b16:
    rst $38

jr_000_0b17:
    inc b
    ld [hl-], a

jr_000_0b19:
    nop
    ld e, $00
    ld [hl-], a

jr_000_0b1d:
    nop
    inc a
    inc bc
    ld [hl-], a
    nop
    ld e, $03
    ld [hl-], a
    nop

jr_000_0b26:
    ld b, [hl]
    inc b

jr_000_0b28:
    ld [hl-], a
    nop

jr_000_0b2a:
    ld e, $03

jr_000_0b2c:
    ld [hl-], a
    nop
    ld c, e
    inc b

jr_000_0b30:
    ld [hl-], a
    nop

jr_000_0b32:
    ld e, $04

jr_000_0b34:
    ld [hl-], a
    nop
    ld d, b
    xor $e8
    ld [c], a
    call c, $dfe8
    push de
    adc $e3
    rst $10
    call z, $dfc3
    pop de
    add $bb
    ld a, [$0014]
    ld de, $1b38
    cp $01
    jr z, jr_000_0b53

    rst $08
    ld a, [de]

jr_000_0b53:
    ld hl, $c652
    ld [hl], e
    inc hl
    ld [hl], d
    rst $10
    db $ed
    ld c, $e1
    ld b, $04
    ld a, [hl]
    cp d
    jr c, jr_000_0b70

    jr z, jr_000_0b70

    ld a, $0a
    ld [$0000], a
    ld [hl], $00
    xor a
    ld [$0000], a

jr_000_0b70:
    inc hl
    ld a, [hl]
    cp e
    jr c, jr_000_0b82

    jr z, jr_000_0b82

    ld a, $0a
    ld [$0000], a
    ld [hl], $00
    xor a
    ld [$0000], a

jr_000_0b82:
    dec b
    jr nz, jr_000_0b70

    ret


    rst $38
    inc a
    inc a
    ld b, d
    ld b, d
    or c
    sub c
    and c
    and c
    add a
    add c
    rst $30
    db $10
    pop af
    rst $28
    rrca
    sbc $00
    inc bc
    inc bc
    rst $38
    inc c
    inc c
    db $10
    db $10
    inc h
    inc h
    jr z, jr_000_0bcb

    and b
    ld b, b
    dec de
    ld d, c
    jr nz, jr_000_0bcc

    dec d
    nop
    inc de
    ld de, $eb02
    cp $c0
    ret nz

    jr nc, jr_000_0be4

    ld [$0408], sp
    scf
    dec d
    add c
    ld [bc], a
    dec sp
    scf
    jr nz, jr_000_0bf4

    inc sp
    nop
    ld sp, $42e9
    ld bc, $01bc
    ld b, c
    add hl, bc
    add hl, bc
    ld [de], a

jr_000_0bcb:
    ld [de], a

jr_000_0bcc:
    rla
    nop
    rla
    ret nc

    ld b, e
    ld b, e
    dec de
    dec l
    add b
    ld h, a
    dec e
    and d
    dec [hl]
    dec sp
    nop
    inc a
    ld d, e
    db $eb
    jr nz, jr_000_0bef

    rrca
    ld [hl], b
    ld [hl], b
    ld h, a

jr_000_0be4:
    cpl
    ld [hl+], a
    ld e, $23
    ld h, l
    inc l
    pop hl
    ldh a, [$f0]
    ld c, $0e

jr_000_0bef:
    adc c

jr_000_0bf0:
    ld c, a
    nop
    cp b
    ret


jr_000_0bf4:
    db $fc
    inc bc
    ld h, a
    nop
    sub c
    adc a
    rrca
    ret c

    and [hl]
    ld [hl], b
    nop
    ld d, e
    or c
    nop
    xor a
    ld d, e
    ld [hl+], a
    ld b, c
    dec [hl]
    nop
    dec [hl]
    add c
    nop
    ld h, c
    add c
    jr nz, @+$32

    ld a, l
    ld [hl+], a
    sbc e
    ld [hl], a
    ld b, h
    ld c, l
    inc bc
    rst $28
    inc bc
    inc c
    inc c
    add c
    nop
    ld h, b
    ld h, b
    adc [hl]
    adc [hl]
    rst $38
    ld de, $2119
    ld hl, $4141
    add d
    jp nz, $84f0

    add h
    adc b
    adc b
    sub c
    adc e
    ld b, b
    xor a
    add sp, $0f
    rlca
    ld hl, sp-$5a
    sub c
    db $ed
    or h
    db $fc
    and c
    ret nz

jr_000_0c3d:
    ret nz

    jr nc, jr_000_0bf0

    jr nc, @+$1b

    rrca
    ld b, $06
    or e
    add sp, $12
    daa
    inc hl
    ld [bc], a
    jr nc, jr_000_0c68

    rla
    jr nz, jr_000_0c54

    inc c
    dec d
    pop bc
    ld [hl+], a

jr_000_0c54:
    ld de, $2611
    nop
    daa
    ld hl, $1f40
    or a
    ld [hl], e
    add $0f
    nop
    xor a
    dec sp
    nop

jr_000_0c64:
    nop
    dec de
    scf
    nop

jr_000_0c68:
    dec [hl]
    add h
    db $fd
    and c
    ld [hl], c
    ccf
    dec e
    adc h
    ld [hl], e
    add b
    ld bc, $3d51
    ldh a, [$ed]
    sbc e
    nop
    cp e
    sub a
    nop
    sub l
    nop
    ld a, $f3
    sub b
    rst $00
    ld h, h
    pop bc
    cp a
    ld [bc], a
    cp e
    or a
    jr nz, jr_000_0c64

    nop
    ret nc

    jr nz, jr_000_0c3d

    xor e
    ld h, d
    or l
    push hl
    ld h, $c5
    db $ed
    inc c
    and a
    dec bc
    ld [hl], c
    add d
    add c
    add a
    inc h
    adc l
    ld [$00ce], sp
    ld [$7c1c], sp
    jp nc, $3e1c

    inc e
    ld a, a
    ld a, [hl+]
    db $d3
    ld [bc], a
    ld a, a
    ccf
    cp l
    add d
    sub a
    inc bc
    inc bc
    rrca
    inc c
    rra
    db $10
    rst $38
    ccf
    inc h
    ccf
    jr nz, @+$41

    ld hl, $223f
    ccf
    push af
    inc sp
    nop
    ld a, l
    ld b, e
    ld a, e
    ld [hl], a
    scf
    cpl
    rst $18

jr_000_0ccb:
    ccf
    ccf
    ld d, a
    ld bc, $30f0
    add sp, $18
    ld hl, sp-$01
    jr z, jr_000_0ccb

    inc c
    db $f4
    adc h
    db $f4
    ld c, h
    db $f4
    sbc a
    inc l
    rla
    jr nz, @+$34

    ld a, [$fe16]
    sbc [hl]
    db $ec
    and $dc
    ld hl, sp-$08
    adc a
    rst $28
    ld c, b
    rra
    inc d
    rst $30
    rst $38
    ld a, a
    ld b, b
    rst $38
    sub b
    db $fd
    db $e3
    rst $30
    rst $08
    call $7f7f
    adc a
    inc h
    rrca
    add sp, $38
    rla
    add e
    ld a, [$06ff]
    db $fd
    inc de
    rst $28
    rra
    or $ce
    db $fc
    ld a, [$07fc]
    rlca
    rrca
    ld [$2af3], sp
    ld [hl], a
    db $10
    rst $38
    dec h
    ccf
    inc hl
    rst $38
    rst $00
    rst $38
    add e
    ld e, a
    cp a
    ld h, c
    rst $30
    ld a, c
    ld b, a

jr_000_0d26:
    ld h, a
    ld e, a
    rst $18
    cp a
    ccf
    ld c, l
    nop
    rrca
    or b
    ld [hl], b
    add sp, $78
    ld hl, sp-$68
    rst $10
    db $f4
    sbc h
    sub a
    db $10
    ld l, h
    add hl, de
    rst $38
    jp $effd


    add e
    ld a, [c]
    ld c, $17
    ld [bc], a
    cp d
    add $fa
    and $f0
    db $fd
    ei
    rst $38

jr_000_0d4c:
    rst $38
    res 5, a
    ld b, h
    ld l, a
    add hl, sp
    db $10
    ld a, a
    ld a, b
    inc h
    ld a, a
    ld b, e
    rst $38
    adc a
    ld a, a
    ld h, e
    rst $00
    rst $30

jr_000_0d5e:
    adc a
    xor l
    and e
    rrca
    sub h
    ld b, b
    ld l, h
    ld a, [$3586]
    ld c, c
    ld l, e
    ld bc, $e7f9
    xor l
    ld bc, $24ef
    jr nz, jr_000_0d5e

    ld b, c
    db $10
    jr nz, jr_000_0d26

    add b
    cp $52
    ld [bc], a
    inc b
    push de
    inc b
    ld [$40b5], sp

jr_000_0d81:
    rst $38
    ld [bc], a
    ld b, b
    or l
    ld [bc], a
    ld l, a
    or a
    inc bc
    ldh [$e1], a
    xor a
    add h
    inc bc
    ld [bc], a
    inc c
    cpl
    db $fd
    jr nz, jr_000_0d4c

    ld b, a
    or [hl]
    inc d
    ld bc, $7dfe
    add e
    rst $10
    ld d, l
    xor e
    ld sp, $ad01
    ld bc, $3cff
    inc a
    cp $42
    ld b, d
    or c
    sub c
    and c
    and c
    add c
    ld b, a
    rrca
    ld b, c
    nop
    ccf
    xor a
    add [hl]
    xor a
    inc bc
    inc bc
    inc c
    inc c
    cp $10
    db $10
    inc h
    inc h
    jr z, jr_000_0de8

    ld b, b
    ld l, e
    ld d, c
    add e
    jr nz, jr_000_0e39

    ld h, l
    nop
    ld h, e
    ld h, c
    inc b
    push de
    jr nc, jr_000_0dfe

    ret z

    ld [$0808], sp
    nop
    ld [$8b02], sp
    ld d, d
    add a
    add l
    nop
    dec de
    add e
    reti


    inc b
    xor a
    ld bc, $9101
    jr nz, jr_000_0ded

    add hl, bc
    call Call_000_1212

jr_000_0de8:
    ld h, a
    ld h, a
    ld [bc], a
    ld b, e
    ld b, e

jr_000_0ded:
    ld l, e
    add b
    inc bc
    or a
    jp c, $856d

    jr nz, jr_000_0d81

    and e
    ld [bc], a
    ld e, l
    rrca
    rrca
    pop bc
    ld [hl], b
    ld [hl], b

jr_000_0dfe:
    or a
    ld [bc], a
    ld a, a
    ld [hl], e
    ld [hl+], a
    or l
    ld d, b
    call nz, $e0f0

Call_000_0e08:
    ldh a, [$0e]
    ld c, $d9
    ld [$19ff], sp

jr_000_0e0f:
    jr z, @-$3e

    or a
    nop
    pop hl
    nop
    rst $18
    jr z, jr_000_0e0f

    db $f4
    and e
    nop
    ld bc, $02ff
    and e
    ld b, $91
    jr nz, @-$67

    sub a
    nop
    pop de
    pop de
    ld [bc], a
    jr nz, jr_000_0e5a

    call $eb1e
    inc h
    rst $00
    db $f4
    ld b, b
    inc bc
    inc bc
    inc c
    inc c
    pop de
    rst $38
    ld h, b
    ld h, b

jr_000_0e39:
    adc [hl]
    adc [hl]
    ld de, $2119
    ld hl, $41ff
    ld b, c
    add d
    jp nz, $8484

    adc b
    adc b
    nop
    pop hl
    inc b
    db $db
    rst $38
    nop
    jr c, jr_000_0e98

    ld sp, hl
    or $3d
    rra
    inc b
    ld a, e
    call nc, $c0c0
    ret nz

jr_000_0e5a:
    jr nc, @+$32

    ld l, c
    ld b, $06
    inc bc
    inc bc
    pop af
    jr c, @+$79

    jr nz, jr_000_0ed9

    ld l, e
    ld [hl+], a
    ld h, a
    inc b
    inc c
    nop
    ld h, l
    ld [bc], a
    ld de, $2261
    ld h, c
    ld [hl], a
    ld h, h
    ld [hl], c
    ld l, a
    rlca
    rlca
    nop
    ld d, $30
    ld e, a
    rst $38
    nop
    adc e
    ld l, e
    nop
    add a
    add l
    rrca
    call nc, $f108
    db $d3
    pop bc
    ld l, l
    rst $30
    jp c, $a101

    ccf
    adc l
    dec a
    nop
    nop
    db $eb
    dec bc
    nop
    rst $20
    push hl

jr_000_0e98:
    rrca
    adc [hl]
    ldh [$36], a
    rla
    ld de, $0040
    rrca
    dec bc
    ld [hl+], a
    rlca
    ld a, [hl+]
    ld [bc], a
    jr nz, @+$01

    ld b, $fb
    dec b
    ld [hl+], a
    nop
    dec [hl]
    dec d
    ld h, b
    dec a
    rst $30
    ret z

    pop bc
    pop de
    ld [hl+], a
    rst $10
    db $dd
    ld b, b
    or a
    ld [$081e], sp
    inc e
    ld [hl+], a
    nop
    inc e
    ld a, $1c
    jp $2a7f


    inc hl
    rst $08
    jr z, @+$0f

    rst $20

jr_000_0ecb:
    inc hl
    inc bc
    inc bc
    rst $38
    rrca
    inc c
    rra
    db $10
    ccf
    inc h

jr_000_0ed5:
    ccf
    jr nz, jr_000_0ecb

    ccf

jr_000_0ed9:
    ld hl, $223f
    ld b, l
    ld d, b
    jr nc, @+$7f

    ld b, e
    db $fd
    ld a, e
    ld [hl], a
    scf

jr_000_0ee5:
    cpl
    ccf

jr_000_0ee7:
    ccf
    and a
    ldh a, [rIE]
    jr nc, jr_000_0ed5

    jr jr_000_0ee7

    jr z, jr_000_0ee5

    inc c
    db $f4
    ld sp, hl
    adc h
    db $f4
    ld c, h
    db $f4
    inc l
    ld h, a
    inc de
    ld [hl], b
    ld a, [$16fe]
    cp $9e
    db $ec
    call c, $f8f8
    rst $18
    inc h
    ld l, a
    ccf
    rra
    inc d
    ld b, a
    add d
    ld a, a
    ld b, b
    rst $38
    sub b
    db $fc
    db $fd
    db $e3
    rst $30
    rst $08
    ld a, a
    ld a, a
    rst $18
    ld e, a
    ld c, b
    rst $18
    add sp, $38
    ld h, a
    ld a, [$fd06]
    inc de
    rst $28
    rst $38
    rra
    or $ce
    db $fc
    db $fc
    rlca
    rlca
    rrca
    xor a
    ld [$3143], sp
    ld a, [hl+]
    rst $00
    dec h
    ccf
    inc hl
    rst $38
    ei
    rst $00
    rst $38
    add e
    ld e, a
    ld h, c
    ld b, a
    nop
    ld a, c
    ld b, a
    di
    ld h, a
    ld e, a
    rst $18
    cp a
    sbc l
    ld e, a
    ld bc, $70b0
    db $fd
    add sp, $78
    ld hl, sp-$68
    db $f4
    sbc h
    rst $20
    ld l, h
    ld a, [hl]
    ld l, c
    nop
    rst $38
    jp $83fd


    ld a, [c]
    ld c, $67
    rst $38
    cp d
    add $fa
    and $fd
    ei
    rst $38
    rst $38
    rlca
    dec de
    inc h
    rst $38
    cp a
    ld b, c
    adc c
    ret z

    ld a, [bc]
    inc h
    ld a, a
    ld b, e
    db $fc
    rst $38
    adc a
    ld a, a
    ld h, e
    rst $30
    adc a
    db $fd
    ld e, a
    inc [hl]
    ld [hl], e
    db $e4
    ld l, h
    ld a, [$9986]
    nop
    cp e
    ld sp, hl
    rst $20
    ld e, [hl]
    db $fd
    ld [de], a
    ld bc, $203f
    ld b, c
    db $10
    jr nz, @+$01

    ld b, l
    cp l
    add b
    ld c, [hl]
    ld [bc], a
    inc b
    inc b
    ld [$2005], sp
    ld b, b
    ld d, [hl]
    ld c, a
    ld b, b
    dec b
    jr nz, jr_000_0fa4

    ld b, $e0

jr_000_0fa4:
    pop hl
    rst $38
    ld [hl-], a
    ld a, [c]
    add h
    inc bc
    ld [bc], a
    inc c
    ld c, l
    ld [$4701], sp
    ld b, $fd
    ld bc, $7dfe
    add e
    ld d, l
    xor e
    add c
    ld b, b
    ld bc, $fd7f
    rst $38
    inc a
    inc a
    ld b, d
    ld b, d
    or c
    sub c
    ldh [$a1], a
    and c
    add c
    sub a
    db $10

jr_000_0fca:
    sub c
    adc a
    ld [$ffff], sp
    ld h, l
    rst $38
    inc bc
    inc bc
    inc c
    inc c
    db $10
    db $10
    inc h
    inc h
    add sp, $28
    jr z, @+$42

    cp e
    jr nz, @-$3b

    db $10
    or l
    or e
    nop
    inc a
    or c
    dec h
    ld b, b
    jr nc, jr_000_101a

    ld [$5808], sp
    ld e, b
    dec b
    add c
    ld [bc], a
    db $db
    rst $10
    jr nz, jr_000_0fca

    db $d3
    nop
    add hl, hl
    rst $38
    ld b, d
    ld bc, $01bc
    pop hl
    add hl, bc
    add hl, bc
    ld [de], a
    ld [de], a
    or a
    nop
    or a
    ret nc

    ld b, e
    ld b, e
    cp e
    dec l
    add b
    rlca
    cp l
    and d
    push de
    db $db
    nop
    inc a
    di
    xor l
    jr nz, jr_000_1025

    rrca
    ld [hl], b
    ld [hl], b
    rlca

jr_000_101a:
    rst $08
    ld [hl+], a
    ld e, $c3
    dec b
    inc l
    and b
    ldh a, [$f0]
    ld c, $0e

jr_000_1025:
    add hl, hl

jr_000_1026:
    ld c, a
    nop
    ld e, b
    ld l, c
    db $fc
    ld a, b
    rlca
    nop
    ld sp, $0f2f

jr_000_1031:
    ld a, b
    ld b, h
    ld [hl], b
    nop
    di
    ld d, c
    nop
    ld c, a
    di
    ld [hl+], a
    pop hl
    rst $20
    nop
    rst $20
    ld hl, $6100
    ld hl, $3020
    dec e
    ld [hl+], a
    dec sp
    rla
    ld b, h
    ld b, h
    inc bc
    rst $28
    inc bc
    inc c
    inc c
    ld hl, $6000
    ld h, b
    adc [hl]
    adc [hl]
    rst $38
    ld de, $2119
    ld hl, $4141
    add d
    jp nz, $84f0

    add h
    adc b
    adc b
    ld sp, $402b
    ld c, a
    adc b
    rrca
    rlca
    sbc b
    ld b, [hl]
    sub c
    adc l
    ld d, h
    db $fc
    inc h
    ret nz

    ret nz

    jr nc, jr_000_1026

    jr nc, jr_000_1031

    rrca
    ld b, $06
    ld d, e
    adc b
    ld [de], a
    rst $00
    jp $3002


    cp e
    or a
    jr nz, jr_000_108a

    inc c
    or l
    ld h, c
    ld [hl+], a

jr_000_108a:
    or c
    or c
    ld h, $00
    rst $00
    pop bc
    ld b, b
    cp a
    ld d, a
    ld [hl], e
    ld h, [hl]
    xor a
    nop
    ld c, a
    db $db
    nop
    nop
    cp e
    rst $10
    nop
    push de
    inc h
    db $fd
    ld b, c
    ld de, $bd3f
    ld a, [hl+]
    ld [hl], e
    add b
    ld bc, $ddf1
    ldh a, [$8d]
    dec sp
    nop
    ld e, e
    scf
    nop
    dec [hl]
    nop
    sbc $f3
    jr nc, jr_000_111f

    ld h, h
    ld h, c
    ld e, a
    ld [bc], a
    ld e, e
    ld d, a
    jr nz, jr_000_113a

    nop
    ld [hl], b
    jr nz, jr_000_1113

    ld c, e
    ld h, d
    ld d, l
    add l
    ld h, $65
    adc l
    inc c
    ld b, a
    dec bc
    ld de, $2182
    daa
    inc h
    dec l
    ld [$006e], sp
    ld [$7c1c], sp
    ld [hl], d
    inc e
    ld a, $1c
    ld a, a
    ld a, [hl+]
    ld [hl], e
    ld [bc], a
    rra
    ccf
    ld e, l
    add d
    scf
    inc bc
    inc bc
    rrca
    inc c
    rra
    db $10
    rst $38
    ccf
    inc h
    ccf
    jr nz, @+$41

    ld hl, $223f
    ccf
    sub l
    inc sp
    and b
    ld a, l
    ld b, e
    ld a, e
    ld [hl], a
    scf
    cpl
    rst $18

jr_000_1101:
    ccf
    ccf
    rst $30
    ld bc, $30f0
    add sp, $18
    ld hl, sp-$01
    jr z, jr_000_1101

    inc c
    db $f4
    adc h
    db $f4
    ld c, h
    db $f4

jr_000_1113:
    sbc a
    inc l
    or a
    ret nz

    ld [hl-], a
    ld a, [$fe16]
    sbc [hl]
    db $ec
    and $dc

jr_000_111f:
    ld hl, sp-$08
    cpl
    adc a
    ld c, b
    rra
    inc d
    sub a
    rst $38
    ld a, a
    ld b, b
    rst $38
    sub b
    db $fd
    db $e3
    rst $30
    rst $08
    call $7f7f
    cpl
    inc h
    xor a
    add sp, $38
    or a
    add e

jr_000_113a:
    ld a, [$06ff]
    db $fd
    inc de
    rst $28
    rra
    or $ce
    db $fc
    ld a, [$07fc]
    rlca
    rrca
    ld [$2a93], sp
    rla
    db $10
    rst $38
    dec h
    ccf
    inc hl
    rst $38
    rst $00
    rst $38
    add e
    ld e, a
    cp a
    ld h, c
    sub a
    ld a, c
    ld b, a
    ld h, a
    ld e, a
    rst $18
    cp a
    ccf
    db $ed
    nop
    xor a
    or b
    ld [hl], b
    add sp, $78
    ld hl, sp-$68
    rst $10
    db $f4
    sbc h
    scf
    db $10
    ld l, h
    cp c
    rst $38
    jp $effd


    add e
    ld a, [c]
    ld c, $b7
    ld [bc], a
    cp d
    add $fa
    and $f0
    db $fd
    ei
    rst $38
    rst $38
    ld l, e
    ld c, a
    ld b, h
    rrca
    reti


    db $10
    ld a, a
    jr jr_000_11b0

    ld a, a
    ld b, e
    rst $38
    adc a
    ld a, a
    ld h, e
    rst $00
    rst $30

jr_000_1194:
    adc a
    ld c, l
    and e
    xor a
    inc [hl]
    ld b, b
    ld l, h
    ld a, [$3586]
    jp hl


    dec bc
    ld bc, $e7f9
    ld c, l
    ld bc, $248f
    jr nz, jr_000_1194

    ld b, c
    db $10
    jr nz, jr_000_11fc

    add b
    sbc [hl]
    ld d, d

jr_000_11b0:
    ld [bc], a
    inc b
    push de
    inc b
    ld [$4055], sp
    sbc a
    ld [bc], a
    ld b, b
    ld d, l
    ld [bc], a
    ld l, a
    ld d, l
    inc bc
    ldh [$e1], a
    ld c, a
    add h
    inc bc
    ld [bc], a
    inc c
    cpl
    sbc l
    jr nz, jr_000_1222

    ld b, a
    ld d, l
    inc d
    ld bc, $7dfe
    add e
    rst $10
    ld d, l
    xor e
    pop de
    ld bc, $014d
    rst $38
    inc a
    inc a
    cp $42
    ld b, d
    or c
    sub c
    and c
    and c
    add c
    rst $20
    rrca
    pop hl
    nop
    rst $18
    ld c, a
    add [hl]
    ld c, a
    inc bc
    inc bc
    inc c
    inc c
    cp $10
    db $10
    inc h
    inc h
    jr z, jr_000_121e

    ld b, b
    dec bc
    ld d, c
    add e
    jr nz, jr_000_120f

jr_000_11fc:
    dec b
    nop
    inc bc
    ld bc, $7504
    jr nc, jr_000_1234

    ret z

    ld [$a808], sp
    nop
    xor b
    ld [bc], a
    dec hl
    ld d, d
    daa
    dec h

jr_000_120f:
    nop
    dec de
    inc hl

Call_000_1212:
    ld a, c
    inc b
    ld c, a
    ld bc, $3101
    jr nz, jr_000_1223

    add hl, bc
    call Call_000_1212

jr_000_121e:
    rlca
    rlca
    ld [bc], a
    ld b, e

jr_000_1222:
    ld b, e

jr_000_1223:
    dec bc
    add b
    inc bc
    ld d, a
    jp c, $250d

    jr nz, jr_000_1257

    ld b, e
    ld [bc], a
    db $fd
    rrca
    rrca
    pop bc
    ld [hl], b
    ld [hl], b

jr_000_1234:
    ld d, a
    ld [bc], a
    rra
    inc de
    ld [hl+], a
    ld d, l
    ldh a, [$c4]
    ldh a, [$e0]
    ldh a, [$0e]
    ld c, $79
    xor b
    rst $38
    cp c
    ret z

    ret nz

    ld d, a
    nop
    add c
    nop
    ld a, a
    ret z

    rst $30
    sub h
    ld b, e
    nop
    and c
    sbc a
    ld [bc], a
    ld b, e
    ld b, $31

jr_000_1257:
    jr nz, jr_000_1290

    scf
    nop
    ld [hl], c
    ld [hl], c
    ld [bc], a
    jr nz, jr_000_1290

    ld l, l
    ld e, $8b
    inc h
    ld h, a
    sub h
    ld b, b
    inc bc
    inc bc
    inc c
    inc c
    ld [hl], c
    rst $38
    ld h, b
    ld h, b
    adc [hl]
    adc [hl]
    ld de, $2119
    ld hl, $41ff
    ld b, c
    add d
    jp nz, $8484

    adc b
    adc b
    nop
    add c
    inc b
    ld a, e
    sbc a
    nop
    ret c

    add sp, -$07
    sub [hl]
    db $dd
    rra
    and h
    ld a, e
    ld [hl], h
    ret nz

    ret nz

    ret nz

jr_000_1290:
    jr nc, jr_000_12c2

    add hl, bc
    ld b, $06
    inc bc
    and e
    pop af
    ret c

    rla
    jr nz, jr_000_12af

    dec bc
    ld [hl+], a
    rlca
    inc b
    inc c
    nop
    dec b
    ld [bc], a
    or c
    ld bc, $0122
    rla
    ld h, h
    ld de, $070f
    and a
    nop

jr_000_12af:
    or [hl]
    jr nc, @+$01

    sbc a
    nop
    dec hl
    dec bc
    nop
    daa
    dec h
    rrca
    ld [hl], h
    ld [$d391], sp
    ld h, c
    dec c
    rst $30
    ld a, d

jr_000_12c2:
    ld bc, $3f41
    dec l
    db $dd
    nop
    nop
    adc e
    xor e
    nop
    add a
    add l
    rrca
    ld l, $80
    ld [hl], $b7
    or c
    ld b, b
    nop
    xor a
    xor e
    ld [hl+], a
    and a
    jp z, $c002

    sbc a
    ld b, $9b
    and l
    ld [hl+], a
    nop
    push de
    or l
    ld h, b
    db $dd
    sub a
    ret z

    ld h, c
    ld [hl], c
    ld [hl+], a
    ld [hl], a
    ld a, l
    ld b, b
    or a
    ld [$08be], sp
    inc e
    jp nz, $1c00

    ld a, $1c
    jp $2a7f


    jp $286f


    xor l
    add a

jr_000_1301:
    inc hl
    inc bc
    inc bc
    rst $38
    rrca
    inc c
    rra
    db $10
    ccf
    inc h

jr_000_130b:
    ccf
    jr nz, jr_000_1301

    ccf
    ld hl, $223f
    push hl
    ldh a, [$30]
    ld a, l
    ld b, e
    db $fd
    ld a, e
    ld [hl], a
    scf

jr_000_131b:
    cpl
    ccf

jr_000_131d:
    ccf
    ld b, a
    ldh a, [rIE]
    jr nc, jr_000_130b

    jr jr_000_131d

    jr z, jr_000_131b

    inc c
    db $f4
    ld sp, hl
    adc h
    db $f4
    ld c, h
    db $f4
    inc l
    rlca
    inc de
    db $10
    ld a, [$16fe]
    cp $9e
    db $ec
    call c, $f8f8
    ld e, d
    inc h
    ld l, a
    rst $18
    rra
    inc d
    rst $20
    add d
    ld a, a
    ld b, b
    rst $38
    sub b
    db $fc
    db $fd
    db $e3
    rst $30
    rst $08
    ld a, a
    ld a, a
    ld e, d
    rst $38
    ld c, b
    rst $18
    add sp, $38
    rlca
    ld a, [$fd06]
    inc de
    rst $28
    rst $38
    rra
    or $ce
    db $fc
    db $fc
    rlca
    rlca
    rrca
    xor a
    ld [$31e3], sp
    ld a, [hl+]
    ld h, a
    dec h
    ccf
    inc hl
    rst $38
    ei
    rst $00
    rst $38
    add e
    ld e, a
    ld h, c
    rst $20
    nop
    ld a, c
    ld b, a
    di
    ld h, a
    ld e, a
    rst $18
    cp a
    dec a
    rst $38
    ld bc, $70b0
    db $fd
    add sp, $78
    ld hl, sp-$68
    db $f4
    sbc h
    add a
    ld l, h
    ld a, [hl]
    add hl, bc
    nop
    rst $38
    jp $83fd


    ld a, [c]
    ld c, $07
    rst $38
    cp d
    add $fa
    and $fd
    ei
    rst $38
    rst $38
    rlca
    cp e
    inc h
    sbc a
    ld e, a
    ld b, c
    add hl, hl
    ld l, b
    ld a, [bc]
    inc h
    ld a, a
    ld b, e
    db $fc
    rst $38
    adc a
    ld a, a
    ld h, e
    rst $30
    adc a
    sbc l
    rst $38
    inc [hl]
    ld [hl], e
    add h
    ld l, h
    ld a, [$3986]
    nop
    ld e, e
    ld sp, hl
    rst $20
    ld e, [hl]
    sbc l
    ld [de], a
    ld bc, $20df
    ld b, c
    db $10
    jr nz, @-$5f

    ld b, l
    cp l
    add b
    xor $02
    inc b
    inc b
    ld [$20a5], sp
    ld b, b
    ld d, [hl]
    rst $28
    ld b, b
    and l
    jr nz, @+$04

    and l
    ldh [$e1], a
    sbc a
    ld [hl-], a
    ld a, [c]
    add h
    inc bc
    ld [bc], a
    inc c
    db $ed
    xor b
    ld bc, $a547
    db $fd
    ld bc, $7dfe
    add e
    ld d, l
    xor e
    ld hl, $0140
    ld a, a
    sbc l
    rst $38
    inc a
    inc a
    ld b, d
    ld b, d
    or c
    sub c
    ldh [$a1], a
    and c
    add c
    scf
    db $10
    ld sp, $082f
    sbc a
    sbc a
    ld h, l
    rst $38
    inc bc
    inc bc
    inc c

jr_000_140a:
    inc c
    db $10
    db $10
    inc h
    inc h
    add sp, $28
    jr z, @+$42

    ld e, e
    jr nz, jr_000_1479

    db $10
    ld d, l
    ld d, e
    nop
    inc a
    ld d, c
    push bc
    ld b, b
    jr nc, jr_000_1450

    ld [$f808], sp
    ld hl, sp+$05
    add c
    ld [bc], a
    ld a, e
    ld [hl], a
    jr nz, jr_000_14a0

    ld [hl], e
    nop
    ret


    sbc a
    ld b, d
    ld bc, $01bc
    add c
    add hl, bc
    add hl, bc
    ld [de], a
    ld [de], a
    ld d, a
    nop
    ld d, a
    ret nc

    ld b, e
    ld b, e
    ld e, e
    dec l
    add b
    and a
    ld e, l
    and d
    ld [hl], l
    ld a, e
    nop
    inc a
    sub e
    ld c, l
    jr nz, jr_000_145b

    rrca

jr_000_144d:
    ld [hl], b
    ld [hl], b
    and a

jr_000_1450:
    ld l, a
    ld [hl+], a
    ld e, $63
    and l
    inc l
    ld b, b
    ldh a, [$f0]
    ld c, $0e

jr_000_145b:
    ret


jr_000_145c:
    ld c, a
    nop
    ld hl, sp+$09
    db $fc
    jr jr_000_140a

    nop
    pop de
    rst $08
    rrca
    jr jr_000_144d

    ld [hl], b
    nop
    sub e
    pop af
    nop
    rst $28
    sub e
    ld [hl+], a
    add c
    add a
    nop
    add a
    pop bc
    nop
    ld h, c
    pop bc

jr_000_1479:
    jr nz, @+$32

    cp l
    ld [hl+], a
    db $db
    or a
    ld b, h
    db $e4
    inc bc
    rst $28
    inc bc
    inc c
    inc c
    pop bc
    nop
    ld h, b

jr_000_1489:
    ld h, b
    adc [hl]
    adc [hl]
    rst $38
    ld de, $2119
    ld hl, $4141
    add d
    jp nz, $84f0

    add h
    adc b
    adc b
    pop de
    bit 0, b
    rst $28
    jr z, jr_000_14af

jr_000_14a0:
    rlca
    jr c, jr_000_1489

    sub c
    dec l
    db $f4
    db $fc
    call nz, $c0c0
    jr nc, jr_000_145c

    jr nc, jr_000_1507

    rrca

jr_000_14af:
    ld b, $06
    di
    jr z, jr_000_14c6

    ld h, a
    ld h, e
    ld [bc], a
    jr nc, jr_000_1514

    ld d, a
    jr nz, @+$06

    inc c
    ld d, l
    ld bc, $5122
    ld d, c
    ld h, $00
    ld h, a
    ld h, c

jr_000_14c6:
    ld b, b
    ld e, a
    rst $30
    ld [hl], e
    ld b, $4f
    nop
    rst $28
    ld a, e
    nop
    nop
    ld e, e
    ld [hl], a
    nop
    ld [hl], l
    call nz, $e1fd
    or c
    ccf
    ld e, l
    jp z, $8073

    ld bc, $7d91
    ldh a, [$2d]
    db $db
    nop
    ei
    rst $10
    nop
    push de

jr_000_14e9:
    nop
    ld a, [hl]
    di
    ret nc

    rlca
    ld h, h
    ld bc, $02ff
    ei
    rst $30
    jr nz, jr_000_1510

    nop
    db $10
    jr nz, jr_000_14e9

    db $eb
    ld h, d
    push af
    dec h
    ld h, $05
    dec l
    inc c
    rst $20
    dec bc
    or c
    add d
    pop bc

jr_000_1507:
    rst $00
    inc h
    call Call_000_0e08
    nop
    ld [$7c1c], sp

jr_000_1510:
    ld [de], a
    inc e
    ld a, $1c

jr_000_1514:
    ld a, a
    ld a, [hl+]
    inc de
    ld [bc], a
    cp a
    ccf
    db $fd
    add d
    rst $10
    inc bc
    inc bc
    rrca
    inc c
    rra
    db $10
    rst $38
    ccf
    inc h
    ccf
    jr nz, @+$41

    ld hl, $223f
    ccf
    dec [hl]
    inc sp
    ld b, b
    ld a, l
    ld b, e
    ld a, e
    ld [hl], a
    scf
    cpl
    rst $18

jr_000_1537:
    ccf
    ccf
    sub a
    ld bc, $30f0
    add sp, $18
    ld hl, sp-$01
    jr z, jr_000_1537

    inc c
    db $f4
    adc h
    db $f4
    ld c, h
    db $f4
    sbc a
    inc l
    ld d, a
    ld h, b
    ld [hl-], a
    ld a, [$fe16]
    sbc [hl]
    db $ec
    and $dc
    ld hl, sp-$08
    xor d
    cpl
    ld c, b
    rra
    inc d
    scf
    rst $38
    ld a, a
    ld b, b
    rst $38
    sub b
    db $fd
    db $e3
    rst $30
    rst $08
    call $7f7f
    xor d
    inc h
    ld c, a
    add sp, $38
    ld d, a
    add e
    ld a, [$06ff]
    db $fd
    inc de
    rst $28
    rra
    or $ce
    db $fc
    ld a, [$07fc]
    rlca
    rrca
    ld [$2a33], sp
    or a
    db $10
    rst $38
    dec h
    ccf
    inc hl
    rst $38
    rst $00
    rst $38
    add e
    ld e, a
    cp a
    ld h, c
    scf
    ld a, c
    ld b, a
    ld h, a
    ld e, a
    rst $18
    cp a
    ccf
    adc l
    nop
    ld c, a
    or b
    ld [hl], b
    add sp, $78
    ld hl, sp-$68
    rst $10
    db $f4
    sbc h
    rst $10
    db $10
    ld l, h
    ld e, c
    rst $38
    jp $effd


    add e
    ld a, [c]
    ld c, $57
    ld [bc], a
    cp d
    add $fa
    and $f0
    db $fd
    ei
    rst $38
    rst $38
    dec bc
    rst $28
    ld b, h
    xor a
    ld a, c
    db $10
    ld a, a
    cp b
    inc h
    ld a, a
    ld b, e
    rst $38
    adc a
    ld a, a
    ld h, e
    rst $00
    rst $30

jr_000_15ca:
    adc a
    db $ed
    and e
    ld c, a
    call nc, $6c40
    ld a, [$3586]
    adc c
    xor e
    ld bc, $e7f9
    db $ed
    ld bc, $242f
    jr nz, jr_000_15ca

    ld b, c
    db $10
    jr nz, @-$0f

    add b
    ld a, $52
    ld [bc], a
    inc b
    push de
    inc b
    ld [$40f5], sp
    ccf
    ld [bc], a
    ld b, b
    push af
    ld [bc], a
    ld l, a
    or $03
    ldh [$e1], a
    rst $28

jr_000_15f8:
    add h
    inc bc
    ld [bc], a
    inc c
    cpl
    dec a
    jr nz, jr_000_15f8

    ld b, a
    or $14
    ld bc, $7dfe
    add e
    rst $10
    ld d, l
    xor e
    ld [hl], c
    ld bc, $01ed
    rst $38
    inc a
    inc a
    cp $42
    ld b, d
    or c
    sub c
    and c
    and c
    add c
    add a
    rrca
    add c
    nop
    ld a, a
    rst $28
    add [hl]
    rst $28
    inc bc
    inc bc
    inc c
    inc c
    cp $10
    db $10
    inc h
    inc h
    jr z, jr_000_1654

    ld b, b

jr_000_162d:
    xor e
    ld d, c
    add e
    jr nz, @-$4b

    and l
    nop
    and e
    and c
    inc b
    dec d
    jr nc, jr_000_166a

    ret z

    ld [$4808], sp
    nop
    ld c, b
    ld [bc], a
    bit 2, d
    rst $00
    push bc
    nop
    dec de
    jp $0419


    rst $28
    ld bc, $d101
    jr nz, jr_000_1659

    add hl, bc
    call Call_000_1212

jr_000_1654:
    and a
    and a
    ld [bc], a
    ld b, e
    ld b, e

jr_000_1659:
    xor e
    add b
    inc bc
    rst $30
    jp c, $c5ad

    jr nz, jr_000_162d

    db $e3
    ld [bc], a
    sbc l
    rrca

jr_000_1666:
    rrca
    pop bc
    ld [hl], b
    ld [hl], b

jr_000_166a:
    rst $30
    ld [bc], a
    cp a
    or e
    ld [hl+], a
    push af
    sub b
    call nz, $e0f0
    ldh a, [$0e]
    ld c, $19
    ld c, b
    rst $38
    ld e, c
    ld l, b
    ret nz

    rst $30
    nop
    ld hl, $1f00
    ld l, b
    rst $30
    inc [hl]

jr_000_1685:
    db $e3
    nop

jr_000_1687:
    ld b, c
    ccf
    ld [bc], a
    db $e3
    ld b, $d1
    jr nz, jr_000_1666

    rst $10
    nop
    ld de, $0211
    jr nz, jr_000_16c6

    dec c
    ld e, $2b
    inc h
    rlca
    inc [hl]
    ld b, b
    inc bc
    inc bc
    inc c
    inc c
    ld de, $60ff
    ld h, b
    adc [hl]
    adc [hl]
    ld de, $2119
    ld hl, $41ff
    ld b, c
    add d
    jp nz, $8484

    adc b
    adc b
    nop
    ld hl, $1b04
    ccf
    nop
    ld a, b
    adc b
    ld sp, hl
    ld [hl], $7d
    rra
    ld b, h
    ld a, e
    inc d
    ret nz

    ret nz

    ret nz

jr_000_16c6:
    jr nc, jr_000_16f8

    xor c
    ld b, $06
    inc bc
    ld b, e
    pop af
    ld a, b
    or a
    jr nz, jr_000_1685

    xor e
    ld [hl+], a
    and a
    inc b
    inc c
    nop
    and l
    ld [bc], a
    ld d, c
    and c
    ld [hl+], a
    and c
    or a
    ld h, h
    or c
    xor a
    rlca
    ld b, a
    nop
    ld d, [hl]
    jr nc, jr_000_1687

    ccf
    nop
    res 5, e
    nop
    rst $00
    push bc
    rrca
    inc d
    ld [$d331], sp
    ld bc, $f7ad
    ld a, [de]

jr_000_16f8:
    ld bc, $3fe1
    call $007d
    nop
    dec hl
    ld c, e
    nop
    daa
    dec h
    rrca
    adc $20
    ld [hl], $57
    ld d, c
    ld b, b
    nop
    ld c, a
    ld c, e
    ld [hl+], a
    ld b, a
    ld l, d
    ld [bc], a
    ld h, b
    ccf
    ld b, $3b
    ld b, l
    ld [hl+], a
    nop
    ld [hl], l
    ld d, l
    ld h, b
    ld a, l
    scf
    ret z

    ld bc, $2211
    rla
    dec e
    ld b, b
    or a
    ld [$085e], sp
    inc e
    ld h, d
    nop
    inc e
    ld a, $1c
    jp $2a7f


    ld h, e
    rrca
    jr z, jr_000_1783

    daa

jr_000_1737:
    inc hl
    inc bc
    inc bc
    rst $38
    rrca
    inc c
    rra
    db $10
    ccf
    inc h

jr_000_1741:
    ccf
    jr nz, jr_000_1737

    ccf
    ld hl, $223f
    add l
    sub b
    jr nc, @+$7f

    ld b, e
    db $fd
    ld a, e
    ld [hl], a
    scf

jr_000_1751:
    cpl
    ccf

jr_000_1753:
    ccf
    rst $20
    ldh a, [rIE]
    jr nc, jr_000_1741

    jr jr_000_1753

    jr z, jr_000_1751

    inc c
    db $f4
    ld sp, hl
    adc h
    db $f4
    ld c, h
    db $f4
    inc l
    and a
    inc de
    or b
    ld a, [$16fe]
    cp $9e
    db $ec
    call c, $f8f8
    rra
    inc h
    ld l, a
    ld a, a
    rra
    inc d
    add a
    add d
    ld a, a
    ld b, b
    rst $38
    sub b
    db $fc
    db $fd
    db $e3
    rst $30
    rst $08
    ld a, a

jr_000_1783:
    ld a, a
    rra
    sbc a
    ld c, b
    rst $18
    add sp, $38
    and a
    ld a, [$fd06]
    inc de
    rst $28
    rst $38
    rra
    or $ce
    db $fc
    db $fc
    rlca
    rlca
    rrca
    xor a
    ld [$3183], sp
    ld a, [hl+]
    rlca
    dec h
    ccf
    inc hl
    rst $38
    ei
    rst $00
    rst $38
    add e
    ld e, a
    ld h, c
    add a
    nop
    ld a, c
    ld b, a
    di
    ld h, a
    ld e, a
    rst $18
    cp a
    db $dd
    sbc a
    ld bc, $70b0
    db $fd
    add sp, $78
    ld hl, sp-$68
    db $f4
    sbc h
    daa
    ld l, h
    ld a, [hl]
    xor c
    nop
    rst $38
    jp $83fd


    ld a, [c]
    ld c, $a7
    rst $38
    cp d
    add $fa
    and $fd
    ei
    rst $38
    rst $38
    rlca
    ld e, e
    inc h
    ccf
    rst $38
    ld b, c
    ret


    ld [$240a], sp
    ld a, a
    ld b, e
    db $fc
    rst $38
    adc a
    ld a, a
    ld h, e
    rst $30
    adc a
    dec a
    sbc a
    inc [hl]
    ld [hl], e
    inc h
    ld l, h
    ld a, [$d986]
    nop
    ei
    ld sp, hl
    rst $20
    ld e, [hl]
    dec a
    ld [de], a
    ld bc, $207f
    ld b, c
    db $10
    jr nz, jr_000_183c

    ld b, l
    cp l
    add b
    adc [hl]
    ld [bc], a
    inc b
    inc b
    ld [$2045], sp
    ld b, b
    ld d, [hl]
    adc a
    ld b, b
    ld b, l
    jr nz, @+$04

    ld b, a
    ldh [$e1], a
    ccf
    ld [hl-], a
    ld a, [c]
    add h
    inc bc
    ld [bc], a
    inc c
    adc l
    ld c, b
    ld bc, $4547
    db $fd
    ld bc, $7dfe
    add e
    ld d, l
    xor e
    pop bc
    ld b, b
    ld bc, $3d7f
    rst $38
    inc a
    inc a
    ld b, d
    ld b, d
    or c
    sub c
    ldh [$a1], a
    and c
    add c
    rst $10
    db $10
    pop de
    rst $08
    ld [$3f3f], sp
    ld h, l

jr_000_183c:
    rst $38
    inc bc
    inc bc
    inc c
    inc c
    db $10
    db $10
    inc h
    inc h
    add sp, $28
    jr z, @+$42

    ei
    jr nz, jr_000_184f

    db $10
    push af
    di

jr_000_184f:
    nop
    inc a
    pop af
    ld h, l
    ld b, b
    jr nc, jr_000_1886

    ld [$9808], sp
    sbc b
    dec b
    add c
    ld [bc], a
    dec de
    rla
    jr nz, jr_000_1876

    inc de
    nop
    ld l, c
    ccf
    ld b, d
    ld bc, $01bc
    ld hl, $0909
    ld [de], a
    ld [de], a
    rst $30
    nop
    rst $30
    ret nc

    ld b, e
    ld b, e
    ei
    dec l

jr_000_1876:
    add b
    ld b, a
    db $fd
    and d
    dec d
    dec de
    nop
    inc a
    inc sp
    db $ed
    jr nz, @+$11

    rrca
    ld [hl], b
    ld [hl], b
    ld b, a

jr_000_1886:
    rrca
    ld [hl+], a
    ld e, $03
    ld b, l
    inc l
    ldh [$f0], a
    ldh a, [$0e]
    ld c, $69

jr_000_1892:
    ld c, a
    nop
    sbc b
    xor c
    db $fc
    cp b
    ld b, a
    nop
    ld [hl], c
    ld l, a
    rrca
    cp b
    add h
    ld [hl], b
    nop
    inc sp
    sub c
    nop
    adc a
    inc sp
    ld [hl+], a
    ld hl, $0027
    daa
    ld h, c
    nop
    ld h, c
    ld h, c
    jr nz, @+$32

    ld e, l
    ld [hl+], a
    ld a, e
    ld d, a
    ld b, h
    add h
    inc bc
    rst $28
    inc bc
    inc c
    inc c
    ld h, c
    nop
    ld h, b

jr_000_18bf:
    ld h, b
    adc [hl]
    adc [hl]
    rst $38
    ld de, $2119
    ld hl, $4141
    add d
    jp nz, $84f0

    add h
    adc b
    adc b
    ld [hl], c
    ld l, e
    ld b, b
    adc a
    ret z

    rrca
    rlca
    ret c

    add [hl]
    sub c
    call $fc94

jr_000_18dd:
    ld h, h
    ret nz

    ret nz

    jr nc, jr_000_1892

    jr nc, jr_000_18dd

    rrca
    ld b, $06
    sub e
    ret z

    ld [de], a

jr_000_18ea:
    rlca
    inc bc
    ld [bc], a
    jr nc, jr_000_18ea

    rst $30
    jr nz, jr_000_18f6

    inc c
    push af
    and c
    ld [hl+], a

jr_000_18f6:
    pop af
    pop af
    ld h, $00
    rlca
    ld bc, $ff40
    sub a
    ld [hl], e
    and [hl]
    rst $28
    nop
    adc a
    dec de
    nop
    nop
    ei
    rla
    nop
    dec d
    ld h, h
    db $fd
    add c
    ld d, c
    ccf
    db $fd
    ld l, d
    ld [hl], e
    add b
    ld bc, $1d31
    ldh a, [$cd]
    ld a, e
    nop
    sbc e
    ld [hl], a
    nop
    ld [hl], l
    nop
    ld e, $f3
    ld [hl], b
    and a
    ld h, h
    and c
    sbc a
    ld [bc], a
    sbc e
    sub a
    jr nz, @-$44

    nop
    or b
    jr nz, jr_000_18bf

    adc e
    ld h, d
    sub l
    push bc
    ld h, $a5
    call $870c
    dec bc
    ld d, c
    add d
    ld h, c
    ld h, a
    inc h
    ld l, l
    ld [$00ae], sp
    ld [$7c1c], sp
    or d
    inc e
    ld a, $1c
    ld a, a
    ld a, [hl+]
    or e
    ld [bc], a
    ld e, a
    ccf
    sbc l
    add d
    ld [hl], a
    inc bc
    inc bc
    rrca
    inc c
    rra
    db $10
    rst $38
    ccf
    inc h
    ccf
    jr nz, @+$41

    ld hl, $223f
    ccf
    push de
    inc sp
    ldh [$7d], a
    ld b, e
    ld a, e
    ld [hl], a
    scf
    cpl
    rst $18

jr_000_196d:
    ccf
    ccf
    scf
    ld bc, $30f0
    add sp, $18
    ld hl, sp-$01
    jr z, jr_000_196d

    inc c
    db $f4
    adc h
    db $f4
    ld c, h
    db $f4
    sbc a
    inc l
    rst $30
    nop
    ld [hl-], a
    ld a, [$fe16]
    sbc [hl]
    db $ec
    and $dc
    ld hl, sp-$08
    ld c, d
    rst $08
    ld c, b
    rra
    inc d
    rst $10
    rst $38
    ld a, a
    ld b, b
    rst $38
    sub b
    db $fd
    db $e3
    rst $30
    rst $08
    call $7f7f
    ld c, d
    inc h
    rst $28
    add sp, $38
    rst $30
    add e
    ld a, [$06ff]
    db $fd
    inc de
    rst $28
    rra
    or $ce
    db $fc
    ld a, [$07fc]
    rlca
    rrca
    ld [$2ad3], sp
    ld d, a
    db $10
    rst $38
    dec h
    ccf
    inc hl
    rst $38
    rst $00
    rst $38
    add e
    ld e, a
    cp a
    ld h, c
    rst $10
    ld a, c
    ld b, a
    ld h, a
    ld e, a
    rst $18
    cp a
    ccf
    dec l

jr_000_19ce:
    nop
    rst $28
    or b
    ld [hl], b
    add sp, $78
    ld hl, sp-$68
    rst $10
    db $f4
    sbc h
    ld [hl], a
    db $10
    ld l, h
    ld sp, hl
    rst $38
    jp $effd


    add e
    ld a, [c]
    ld c, $f7
    ld [bc], a
    cp d
    add $fa
    and $f0
    db $fd
    ei
    rst $38
    rst $38
    xor e
    adc a
    ld b, h
    ld c, a
    add hl, de
    db $10
    ld a, a
    ld e, b
    inc h
    ld a, a
    ld b, e
    rst $38
    adc a
    ld a, a
    ld h, e
    rst $00
    rst $30

jr_000_1a00:
    adc a
    adc l
    and e
    rst $28
    ld [hl], h
    ld b, b
    ld l, h
    ld a, [$3586]
    add hl, hl
    ld c, e
    ld bc, $e7f9
    adc l
    ld bc, $24cf
    jr nz, jr_000_1a00

    ld b, c
    db $10
    jr nz, @-$6f

    add b
    sbc $52
    ld [bc], a
    inc b
    push de
    inc b
    ld [$4095], sp
    rst $18
    ld [bc], a
    ld b, b
    sub l
    ld [bc], a
    ld l, a
    sub [hl]
    inc bc
    ldh [$e1], a
    adc a
    add h
    inc bc
    ld [bc], a
    inc c
    cpl
    db $dd
    jr nz, jr_000_19ce

    ld b, a
    sub [hl]
    inc d
    ld bc, $7dfe
    add e
    call nc, $ab55
    ld de, $8d01
    nop
    rst $38
    db $f4
    ld bc, $0c04
    ld c, $1b
    dec d
