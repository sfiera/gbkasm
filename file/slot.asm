; Disassembly of "slot.gbf"

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
    db $6c                     ; owner code

Title::
    dk "SLOT"
Icon::
    INCBIN "gfx/slot/icon.2bpp"

Points::
    dw 100
Author::
    db "Y.MOTOSAKO", 2
History::
    ds 11
    ds 11
    ds 11

Main::
    callx @+$03c7
    callx @+$0645
    callx @+$0440
    trap AwaitFrame
    ldh a, [$c6]
    ld l, a
    ld h, $00
    trap $06
    inc b
    ld a, [bc]
    nop
    dec [hl]
    nop
    ld h, [hl]
    nop
    xor [hl]
    nop
    adc $00
    ld de, $0000
    ld c, $00
    callx @+$02fa
    ldh a, [$c9]
    or a
    jr z, jr_000_014e

    dec a
    ldh [$c9], a
    jr nz, jr_000_014e

    xor a
    ldh [$c3], a
    ld de, $0000
    ld c, $00

HeaderManufacturerCode::
    callx @+$02f9
    ld hl, $ffc6
    inc [hl]
    ld a, $5a
    ldh [$cb], a

jr_000_014e::
    ld de, $0001
    ld c, $10
    callx @+$02cd
    ldh a, [$c6]
    cp $01
    jr nz, jr_000_0181

    ldh a, [$c9]
    or a
    jr z, jr_000_0181

    dec a
    ldh [$c9], a
    jr nz, jr_000_0181

    xor a
    ldh [$c4], a
    ld de, $0001
    ld c, $10
    callx @+$02c6
    ld hl, $ffc6
    inc [hl]
    ld a, $b4
    ldh [$cb], a

jr_000_0181::
    ldh a, [$c6]
    cp $02
    jr nz, jr_000_01bb

    ldh a, [$c9]
    or a
    jr z, jr_000_01bb

    dec a
    ldh [$c9], a
    jr z, jr_000_01a6

    ld de, $0002
    ld c, $20
    callx @+$028a
    ldh a, [$ca]
    inc a
    ldh [$ca], a
    trap $dc
    jr jr_000_01ed

jr_000_01a6::
    xor a
    ldh [$c5], a
    ld de, $0002
    ld c, $20
    callx @+$028a
    ld hl, $ffc6
    inc [hl]
    jr jr_000_01ed

jr_000_01bb::
    ld de, $0002
    ld c, $20
    callx @+$0260
    trap RandNext
    jr jr_000_01ed

    callx @+$03d5
    ld hl, $c760
    xor a
    ld [hl+], a
    ld [hl], a
    callx @+$016d
    ld a, $ff
    ldh [$c6], a
    xor a
    ldh [$cb], a
    callx @+$0121

jr_000_01ed::
    ld c, $00
    ldh a, [$c9]
    or a
    jr nz, jr_000_01f7

    trap $d8
    ld c, a

jr_000_01f7::
    ld a, $06
    and c
    jr z, jr_000_01fe

    trap ExitToMenu

jr_000_01fe:
    ldh a, [$c6]
    cp $ff
    jr nz, Jump_000_023e

    ld a, $c0
    and c
    jr z, Jump_000_023e

    ld hl, $c760
    ld a, [hl]
    cp $03
    jr nc, Jump_000_023e

    inc a
    ld b, a
    ldh a, [$c7]

jr_000_0215::
    rrca
    jr c, jr_000_021c

    rl b
    jr jr_000_0215

jr_000_021c::
    ldx hl, @+$05a4
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, h
    or a
    jr nz, jr_000_022b

    ld a, l
    cp b
    jr c, Jump_000_023e

jr_000_022b::
    ld a, $20
    trap PlaySound
    ld hl, $c760
    inc [hl]
    callx @+$0112
    jx @+$fed2


Jump_000_023e::
    ldh a, [$c6]
    cp $ff
    jr nz, jr_000_027d

    ld a, $10
    and c
    jr z, jr_000_027d

    ldh a, [$c7]
    cp $40
    jr nc, jr_000_027d

    add a
    ld b, a
    ld a, [$c760]

jr_000_0254::
    rr b
    jr c, jr_000_025c

    rl a
    jr jr_000_0254

jr_000_025c::
    ld b, a
    ldx hl, @+$0563
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, h
    or a
    jr nz, jr_000_026c

    ld a, l
    cp b
    jr c, jr_000_027d

jr_000_026c::
    ld hl, $ffc7
    ld a, [hl]
    add a
    ld [hl], a
    callx @+$00d3
    jx @+$fe93


jr_000_027d::
    ldh a, [$c6]
    cp $ff
    jr nz, jr_000_029d

    ld a, $20
    and c
    jr z, jr_000_029d

    ldh a, [$c7]
    cp $02
    jr c, jr_000_029d

    rr a
    ldh [$c7], a
    callx @+$00b3
    jx @+$fe73


jr_000_029d::
    ldh a, [$cb]
    or a
    jr z, jr_000_02a9

    dec a
    ldh [$cb], a
    jr nz, jr_000_02a9

    ld c, $01

jr_000_02a9::
    ld a, $01
    and c
    jr z, jr_000_0301

    ldh a, [$c6]
    ld bc, $0305
    cp $02
    jr z, jr_000_02f0

    ld bc, $0302
    cp $03
    jr c, jr_000_02f0

    jr z, jr_000_0301

    xor a
    ldh [$c9], a
    ld a, [$c760]
    or a
    jr z, jr_000_0301

    xor a
    ldh [$c6], a
    ld a, $3c
    ldh [$cb], a
    ld a, [$c760]
    ld e, a
    cpl
    inc a
    ld c, a
    ld b, $ff
    ldh a, [$c7]

jr_000_02db::
    rrca
    jr c, jr_000_02e2

    rl e
    jr jr_000_02db

jr_000_02e2::
    ld a, e
    cpl
    inc a
    ld e, a
    ld d, b
    callx @+$00ed
    jr jr_000_0301

jr_000_02f0::
    trap RandNext
    and b
    add c
    ldh [$c9], a
    ld a, $01
    ldh [$ca], a
    callx @+$000d

jr_000_0301::
    jx @+$fe0b


    jr nz, @+$22

    nop
    inc a
    ld a, $00
    ldh a, [$c6]
    cp $03
    jr c, jr_000_0332

    ld h, $05
    callx @+$000e
    ld h, $09
    callx @+$0005
    ld h, $0d
    ldx de, @+$ffdf

jr_000_0329::
    ld l, $0d
    trap MoveCursor
    ld l, e
    ld h, d
    trap DrawString
    ret


jr_000_0332::
    push af
    ld a, $07
    trap PlaySound
    pop af
    add a
    add a
    add $05
    ld h, a
    ldx de, @+$ffca
    jr jr_000_0329

    jr nz, @+$22

    jr nz, jr_000_0347

jr_000_0347::
    ld a, b
    nop
    ld a, [$c760]
    or a
    jr z, jr_000_035b

    cpl
    inc a
    ld c, a
    ld b, $ff
    callx @+$00a8

jr_000_035b::
    ld hl, $1110
    trap MoveCursor
    ldx hl, @+$ffe2
    ldh a, [$c7]
    cp $01
    jr z, jr_000_037b

    ld e, a
    ld d, $00
    ld hl, $c400
    trap IntToString
    ldx hl, @+$ffd4
    trap DrawString
    ld hl, $c404

jr_000_037b::
    trap DrawString
    ld a, [$c760]
    ld h, $4f
    ld de, $4f4f
    ld bc, $4f4f
    cp $03
    jr z, jr_000_039c

    ld bc, $2020
    cp $02
    jr z, jr_000_039c

    ld de, $2020
    cp $01
    jr z, jr_000_039c

    ld h, $20

jr_000_039c::
    ld l, $07
    callx @+$0024
    ld h, d
    ld l, $04
    callx @+$001a
    ld h, e
    ld l, $0a
    callx @+$0010
    ld h, b
    ld l, $01
    callx @+$0006
    ld h, c
    ld l, $0d
    push hl
    ld h, $02
    trap MoveCursor
    pop hl
    ld a, h
    push hl
    trap DrawChar
    ld h, $11
    trap MoveCursor
    pop af
    trap DrawChar
    ret


    push bc
    ldx hl, @+$03e7
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, c
    add e
    ld e, a
    ld a, b
    adc d
    ld d, a
    push hl
    ld hl, $8ad0
    add hl, de
    pop hl
    jr nc, jr_000_03f1

    ld de, $7530

jr_000_03f1::
    ld a, $0a
    ld [$0000], a
    ld [hl], d
    dec hl
    ld [hl], e
    xor a
    ld [$0000], a
    pop bc
    jr jr_000_0407

    ldx hl, @+$03c0
    ld e, [hl]
    inc hl
    ld d, [hl]

jr_000_0407::
    push bc
    push de
    ld hl, $0b0f
    pop de
    callx @+$0007
    ld hl, $0b10
    pop de
    trap MoveCursor
    ld hl, $c400
    push hl
    trap IntToString
    pop hl
    trap DrawString
    ret


    ld hl, $ffc3
    add hl, de
    ld a, [hl]
    dec [hl]
    or a
    jr nz, jr_000_043c

    ld [hl], $02
    ld hl, $ffc0
    add hl, de
    ld a, [hl]
    dec [hl]
    cp c
    jr nz, jr_000_043c

    ld a, $0f
    add c
    ld [hl], a

jr_000_043c::
    ld hl, $ffc0
    add hl, de
    ld b, [hl]
    push bc
    ld hl, $ffc3
    add hl, de
    ld c, [hl]
    ld b, $00
    ld a, e
    add a
    add a
    ld e, a
    ld hl, $9864
    add hl, de
    pop de
    callx @+$002d
    ld a, $03

jr_000_045b::
    push af
    ld a, d
    inc a
    and $0f
    add e
    ld d, a
    ld c, $00
    callx @+$001b
    pop af
    dec a
    jr nz, jr_000_045b

    ret


    ld l, c
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, b
    ld b, $00
    add hl, bc
    ld bc, $9800
    add hl, bc
    ld bc, $0000
    push de
    push hl
    ld e, d
    ld d, $00
    ldx hl, @+$0684
    add hl, de
    ld e, [hl]
    ld h, d
    ld l, e
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    ld a, c
    add a
    add a
    ld e, a
    add hl, de
    ld de, $c700
    add hl, de
    ld d, h
    ld e, l
    pop hl

jr_000_04a0::
    ld a, c
    cp $03
    jr nc, jr_000_04c1

    ld a, b
    cp $09
    jr nc, jr_000_04c1

    push bc
    push hl
    push de
    ld bc, $0004
    trap $02
    pop de
    inc de
    inc de
    inc de
    inc de
    pop hl
    ld bc, $0020
    add hl, bc
    pop bc
    inc b
    inc c
    jr jr_000_04a0

jr_000_04c1::
    pop de
    ret


    ld hl, $c600
    ld de, $c400
    ld bc, $0100
    trap $02
    ld a, $20
    trap DrawInit
    ldx de, @+$02f0
    ld bc, $c400
    trap InitDecompress
    ld de, $8800
    ld bc, $0480
    trap RunDecompress
    ld hl, $8c80
    ld de, $c300
    ld b, $06
    trap $1b
    ld hl, $0400
    trap $ca
    ld a, $01
    trap $b4
    ld de, $0000
    ld b, $00

jr_000_04fb::
    trap RandNext
    and $0f
    add b
    ld hl, $ffc0
    add hl, de
    ld [hl], a
    ld hl, $ffc3
    add hl, de
    ld [hl], $00
    inc e
    ld a, b
    add $10
    ld b, a
    ld a, e
    cp $03
    jr c, jr_000_04fb

    ld d, $00

jr_000_0517::
    ld e, $00

jr_000_0519::
    ld c, $00

jr_000_051b::
    ld a, d
    add a
    add d
    add a
    add a
    ld b, a
    ld a, c
    add a
    add a
    add e
    add b
    ld hl, $c700
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ld a, e
    add a
    add e
    add c
    add $80
    add b
    ld [hl], a
    inc c
    ld a, c
    cp $03
    jr c, jr_000_051b

    inc e
    ld a, e
    cp $04
    jr c, jr_000_0519

    inc d
    ld a, d
    cp $08
    jr c, jr_000_0517

    ret


    ld hl, $c760
    xor a
    ld [hl+], a
    ld [hl], a
    ld a, $01
    ldh [$c7], a
    ld a, $ff
    ldh [$c6], a
    xor a
    ldh [$c9], a
    ldh [$cb], a
    ldx hl, @+$0665
    trap DrawString
    ld de, $0302
    ld bc, $0e0b
    trap $58
    ld de, $0000
    ld c, $00
    callx @+$fec8
    ld de, $0001
    ld c, $10
    callx @+$febc
    ld de, $0002
    ld c, $20
    callx @+$feb0
    callx @+$fd78
    ld bc, $0000
    callx @+$fe63
    jx @+$fda8


    ld hl, $c762
    xor a
    ld [hl+], a
    ld [hl], a
    ld a, [$c760]
    ld l, a
    ld h, $00
    trap $06
    inc b
    ld d, l
    nop
    ld b, h
    nop
    inc h
    nop
    inc b
    nop
    ld c, l
    nop
    ld a, $02
    ld bc, $0100
    ld de, $0d01
    callx @+$0108
    ld a, $00
    ld bc, $0102
    ld de, $010d
    callx @+$00f9
    ld a, $00
    ld bc, $0000
    ld de, $0404
    callx @+$00ea
    ld a, $02
    ld bc, $0202
    ld de, $0a0a
    callx @+$00db
    ld a, $01
    ld bc, $0101
    ld de, $0707
    callx @+$00cc
    ld hl, $c762
    ld a, [hl+]
    or [hl]
    jr nz, jr_000_065d

    ld a, $2f
    trap PlaySound
    ld bc, $0000
    callx @+$fde6
    ldx hl, @+$01a3
    ld a, [hl+]
    or [hl]
    ret nz

    ld hl, $c600
    trap $ef
    ld a, $78
    trap $dc
    xor a
    trap DrawInit
    ld hl, $0307
    trap MoveCursor
    ldx hl, @+$0070
    trap DrawString
    ld hl, $0109
    trap MoveCursor
    ldx hl, @+$0077
    trap DrawString

jr_000_0646::
    trap AwaitFrame
    ldh a, [$8a]
    or a
    jr nz, jr_000_0646

    trap $db
    ld a, $f0
    trap $dc
    ld a, $f0
    trap $dc
    ld a, $f0
    trap $dc
    trap ExitToMenu

jr_000_065d::
    ld hl, $c762
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld bc, $0000

jr_000_0666::
    inc bc
    dec de
    push bc
    push de
    ld a, $24
    trap PlaySound
    ldx hl, @+$0152
    ld e, [hl]
    inc hl
    ld d, [hl]
    callx @+$fd8e
    ld a, $05
    trap $dc
    pop de
    pop bc
    ld a, d
    or e
    jr nz, jr_000_0666

    xor a
    trap PlaySound
    ld a, $3c
    trap $dc
    ld hl, $c762
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ldh a, [$c7]
    ld l, a
    ld h, $00
    trap $89
    ld e, l
    ld d, h
    pop bc
    callx @+$fd36
    ret


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


    jp $0ede


    nop
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

    ld c, $00
    push de
    ldx de, @+$043a
    ld hl, $ffc0
    add [hl]
    and $0f
    add $00
    ld l, a
    ld h, $00
    add hl, de
    ld a, [hl]
    push af
    ld a, b
    ld hl, $ffc1
    add [hl]
    and $0f
    add $10
    ld l, a
    ld h, $00
    add hl, de
    ld b, [hl]
    ld a, c
    ld hl, $ffc2
    add [hl]
    and $0f
    add $20
    ld l, a
    ld h, $00
    add hl, de
    ld c, [hl]
    pop af
    pop de
    cp b
    jr nz, jr_000_0708

    cp c
    jr z, jr_000_0713

jr_000_0708::
    cp $05
    ret nz

    ld c, $07
    ld a, b
    cp $05
    jr nz, jr_000_0713

    dec c

jr_000_0713::
    push de
    ld b, $00
    ldx hl, @+$03ee
    add hl, bc
    ld a, [hl]
    ldh [$c8], a
    ld hl, $c762
    ld c, [hl]
    inc hl
    ld b, [hl]
    add c
    ld c, a
    ld a, $00
    adc b
    ld b, a
    ld [hl], b
    dec hl
    ld [hl], c
    callx @+$fccf
    pop de
    ld h, $02
    ld l, d
    trap MoveCursor
    ld a, $cc
    trap DrawChar
    ld h, $11
    ld l, e
    trap MoveCursor
    ld a, $cc
    trap DrawChar
    ret


    trap $b5
    ldx hl, @+$03f8
    trap DrawString
    ld bc, $0302
    ld d, $30
    callx @+$fd17
    ld bc, $0d02
    ld d, $31
    callx @+$fd0b
    ld bc, $0305
    ld d, $32
    callx @+$fcff
    ld bc, $0d05
    ld d, $33
    callx @+$fcf3
    ld bc, $0308
    ld d, $34
    callx @+$fce7
    ld bc, $0d08
    ld d, $35
    callx @+$fcdb
    ld bc, $030b
    ld d, $35
    callx @+$fccf
    ld bc, $0d0b
    ld d, $35
    callx @+$fcc3
    ld a, $01
    trap $b4

jr_000_07b4::
    trap AwaitFrame
    trap $d8
    bit 0, a
    ret nz

    and $06
    jr z, jr_000_07b4

    trap ExitToMenu
    ld h, h
    nop
    ld a, a
    xor $04
    ld a, a
    ld a, a
    ld b, b
    ld b, b
    ld e, a
    ld b, b
    ld d, b
    or h
    ld c, a
    rst $30
    ld d, c
    ld c, [hl]
    push af
    nop
    ld e, a
    push af
    dec b
    sub b
    push af
    ld b, a
    ld b, b
    ld b, h
    ld b, e
    ld de, $1147
    nop
    ld b, b
    ld sp, $edf1
    ld hl, $ffff
    rra
    inc hl
    ld hl, $fc28
    rst $38
    inc bc
    db $fc
    ld a, e
    call z, $98c3
    add a
    jr nc, @+$01

    rrca
    jr nz, jr_000_0819

    ld h, b
    rra
    ld b, b
    ccf
    ret nz

    ldh [$3f], a
    add b
    ld a, a
    ccf
    ld [bc], a
    jr nz, jr_000_0828

    ld sp, $1f22
    call nz, $2766
    ld bc, $63fe
    nop
    ld l, $03
    db $fd
    ld l, c
    ld e, h
    cp a
    db $fc
    ld b, e

jr_000_0819::
    cp $fe
    ld [bc], a
    ld [bc], a
    ld a, [$df0a]
    ld a, [de]
    ld [$2187], a
    ld a, [hl-]
    jp z, $9a7a

jr_000_0828::
    ld a, [c]
    db $fc
    ld [hl-], a
    ld [c], a
    ld h, d
    jp nz, $82c2

    sub a
    add e
    ld [bc], a
    ld a, e
    sbc e
    ld [c], a
    ld [hl+], a
    ld h, d
    and d
    and c
    nop
    ld [c], a
    ld [c], a
    rlca
    add e
    add c
    ld b, $ed
    ld a, [de]
    ld de, $5f19
    ld h, b
    ld d, b
    rst $30
    ld h, b
    ld c, e
    ld [hl], e
    ld c, d
    ret nz

    ld [de], a
    ld c, e
    ld [hl], b
    ld c, b
    cp d
    ld [hl], b
    cp a
    ld e, d
    ld h, e
    ld d, e
    cp h
    inc de
    ld c, a
    or [hl]
    ccf
    add hl, de
    and h
    jr nz, @-$7b

    ld a, h
    ld b, $38
    adc l
    ld de, $5afd
    sub e
    jp c, $aa13

    inc sp
    push bc
    ld bc, $df88
    jr nc, jr_000_08be

    ld a, [c]
    sbc d
    inc de
    ld a, [hl+]
    inc sp
    add $1f
    ld hl, $4c67
    ld d, b
    ld b, b
    adc a
    ld [hl], b
    ld [$8b30], sp
    sbc a
    inc de
    pop af
    pop af
    ld bc, $905b
    ret c

    db $10
    ld a, [de]
    ret z

    inc de
    jp c, $2122

    dec hl
    ld [hl], $04
    add c
    ld hl, $7faa
    xor c
    db $10
    jp nz, Jump_000_023e

    ld e, $e2
    adc $2a
    rst $38
    adc $6a
    adc [hl]
    jp nc, $221e

    ld a, $82
    rst $28
    ld e, $52
    sbc [hl]
    ld e, e
    ld b, d
    adc [hl]
    ld c, d
    adc [hl]
    sbc a
    ld a, [hl-]
    ld b, [hl]
    ld a, [hl-]
    xor c
    ld c, b
    ld b, a
    ld b, h
    ld d, e

jr_000_08be::
    ld d, d
    rst $38
    ld c, c
    ld e, c
    ld b, h
    ld e, h
    ld b, d
    ld e, a
    ld b, c
    ld e, [hl]
    ld a, [hl+]
    ld a, [hl]
    nop
    ld a, [hl]
    ld b, e
    add l
    ld de, $7f41
    ld b, c
    ld a, l

jr_000_08d3::
    nop
    rlca
    ld a, e
    ld a, c
    nop

jr_000_08d8::
    ld [hl], a
    ld [hl], l
    inc c
    reti


    inc bc
    rst $38
    inc c
    rst $38
    db $fc
    jr nc, jr_000_08d3

    call z, $73cc
    inc bc
    db $fc
    rst $38
    ld [hl], b
    sbc [hl]
    db $fc
    ccf
    db $e3
    ld a, [hl]
    pop bc
    rst $28

jr_000_08f1::
    rst $38
    add b
    trap $80
    cp $81
    call c, $4063
    di
    rst $38
    inc sp
    rst $38
    rrca
    ld [de], a
    dec bc
    ld [$fffb], sp
    rst $20
    ld b, $06
    ld bc, $02d9
    dec c
    nop
    ret nz

    add b
    rst $38
    ld h, b
    ld b, b
    or b
    jr nz, jr_000_08f1

    sub b
    ld l, a
    ret z

    rst $38
    ld [hl], a
    db $e4
    ld e, e
    ld a, [c]
    ld e, e
    pop af
    adc a
    ld sp, hl
    ei
    ld c, $fb
    ld a, $f3
    db $fc
    jr c, jr_000_08d8

    jp nc, $ffe2

    ld h, d
    ld a, [hl+]
    ld [$da32], a
    ld [c], a
    ld a, [$6942]
    dec c
    ld a, d
    ld [hl+], a
    ld de, $fa00
    inc d
    ld c, $10
    ld a, [$82bf]
    dec de
    ld a, [hl-]
    ld b, d
    sbc d
    ld [hl+], a
    ld c, d
    sub d
    di
    ld [hl+], a
    jp z, $e212

    ld l, c
    add b
    ld [hl], d
    ld h, c
    ld e, [hl]
    rst $38
    ld h, a
    ld e, b
    ld l, a
    ld d, b
    ld l, [hl]
    ld d, b
    ld a, h
    ld b, b
    db $fc
    ld a, l
    ld b, c
    ld a, c
    ld b, c
    ld a, e
    ld b, d
    ld b, e
    ld h, b
    ld b, c
    ld b, c
    ccf
    ld bc, $3a6c
    scf
    nop
    dec [hl]
    ld [hl], d
    ld b, $9b
    db $fc
    rst $38
    nop
    ld sp, hl
    ld bc, $03c3
    ld e, $1d
    ld a, a
    rst $38
    ld h, b
    db $e3
    add b
    jp $8700


    nop
    adc a
    trap $00
    sbc a
    rst $00
    inc d
    ld [hl], a
    rst $30
    ld [$c1be], sp
    cp $67
    ld a, b
    jr jr_000_09b0

    rst $00
    rlca
    ldh a, [$ca]
    ld [hl], b
    cp a
    inc bc
    ld h, h
    ld hl, sp+$1c
    db $e4
    xor $92
    ld [hl], e
    reti


    call $c3fd
    ld [de], a
    cp $01
    add $a1
    nop
    rst $28
    rst $28
    db $10
    ld a, d
    add l
    and c
    ret c

jr_000_09b0::
    daa
    pop af
    rrca
    cp $86
    ld a, [hl]
    jr jr_000_09b0

    db $e3
    ldh [rIF], a
    ld a, [$7e70]
    ld [bc], a
    add [hl]
    ld a, d
    and $1a
    db $76
    ld a, [bc]
    ret


    ld b, $ff
    ld a, $02
    cp [hl]
    add d

jr_000_09cc::
    sbc [hl]
    add d
    ld e, [hl]
    jp nz, $d310

    pop de
    nop
    trap $36
    jp z, $c710

    push bc
    nop
    ld [bc], a
    ld h, l
    dec hl
    ld h, b
    ld b, b
    ld c, h
    di
    ld e, c
    db $10
    ld b, b
    di
    ld b, c
    rst $38
    ld c, l
    ld b, d
    ld b, d
    ld b, h
    ld b, h
    ld c, b
    ld c, b
    ld e, b
    rst $38
    ld d, b
    ld e, h
    ld d, b
    ld c, a
    ld c, b
    ld b, a
    ld c, h
    ld b, d
    ldh a, [rVBK]
    ld [hl], e
    ld c, l
    ld [hl], e
    db $f4
    ld de, $17f3
    ld d, $5b
    ld a, [hl]
    db $ed
    ld [hl+], a
    rlca
    rlca
    ccf
    jr c, jr_000_09cc

    ret nz

    db $ed
    ld [hl], l
    dec l
    ld b, e
    ld bc, $1f00
    db $76
    ccf
    dec hl
    nop
    rst $38
    reti


    jr c, @+$41

    daa
    inc a
    ret nz

    ld b, a
    ld b, $8b
    nop
    ld a, a
    inc l
    nop
    ret nz

    ldh a, [$e0]
    db $fc
    inc e
    ld a, a
    inc bc
    dec [hl]
    add hl, sp
    cp c
    nop
    dec b
    ld [bc], a
    cp c
    ccf
    and [hl]
    db $10
    ei
    cp a
    inc b
    adc h
    ld [hl], h
    adc e
    ldh [$1f], a
    inc bc
    rst $38
    and $1c
    db $fc
    ldh [$b8], a
    jr @-$45

    ld [bc], a
    ld c, $83
    nop
    rra
    call $00cd
    add e
    add d
    adc [hl]
    jp nz, $e242

    rst $38
    ld [hl+], a
    ld d, d
    or d
    ld [$ca1a], a
    ld a, [hl-]
    sub d
    rst $38
    ld [hl], d
    ld [hl+], a
    xor $42
    adc $b2
    adc [hl]
    ld [hl-], a
    ld h, $84
    ld de, $c283
    and a
    ld b, $eb
    ld a, h
    ld b, b
    or e
    ld b, c
    ei
    ld b, e
    ld b, e
    ld b, a
    ld b, h
    ld c, h
    inc b
    ld a, c
    ld d, b
    cp a
    ld a, a
    call nz, $5730
    ld e, b
    ld c, e
    ld c, h
    ld b, h
    ld b, a
    add hl, de
    cp e
    or e
    ld h, [hl]
    dec de
    inc a
    nop
    db $e3
    nop
    ld b, h
    jr c, @+$01

    rra
    di
    rst $38
    trap $3c
    rst $30
    inc c
    ei
    ei
    rlca
    ld a, [$f207]
    rrca
    push af
    nop
    ld [c], a
    rra
    sbc $c2
    ccf
    ld l, d
    ld [$f9ff], sp
    cp $fc
    nop
    pop af
    ld a, $03
    dec a
    ld bc, $4be3
    ld h, b
    db $e3
    db $fc
    rst $30
    ldh a, [rIF]
    rst $38
    ldh a, [$ec]
    nop
    rrca
    db $db
    ld e, $ef
    rst $20
    ccf
    ei
    di
    cp $c3
    ccf
    ld [hl], c
    rst $20
    adc a
    ld a, c
    add a
    add hl, hl
    nop
    daa
    pop af
    rrca
    pop hl
    cp $1f
    add d
    ld a, [hl]
    inc b
    db $fc
    db $fc
    ld hl, sp+$09
    ld h, b
    rra
    add c
    add a
    jr nz, @-$77

    cp $c2
    ld [c], a
    and d
    ld a, [c]
    rst $38
    jp nc, $6afa

    ld a, [$fe5a]
    xor d
    cp $df
    ld a, [hl+]
    cp $52
    nop
    jp c, $92f2

    ld a, [c]
    ld d, d
    nop
    sub c
    xor b
    inc b
    ld b, e
    ld b, a
    ld de, $faac
    ld a, l
    ld e, $08
    dec b
    inc b
    ld [bc], a
    ld bc, $0200
    inc bc
    dec b
    inc b
    inc bc
    dec b
    inc b
    ld bc, $0204
    inc bc
    dec b
    inc b
    inc bc
    inc b
    nop
    inc bc
    ld [bc], a
    inc b
    dec b
    inc bc
    inc b
    dec b
    ld bc, $0402
    inc bc
    ld bc, $0405
    dec b
    ld [bc], a
    inc b
    inc bc
    dec b
    inc bc
    dec b
    inc b
    ld bc, $0205
    inc bc
    dec b
    inc b
    dec b
    nop
    dec b
    nop
    ld bc, $0302
    inc b
    dec b
    inc c
    jr nz, jr_000_0b66

    jr nz, jr_000_0b68

    ld d, e
    ld c, h
    ld c, a
    ld d, h
    jr nz, jr_000_0b9b

    ld b, c
    ld b, e
    ld c, b
    ld c, c
    ld c, [hl]
    ld b, l
    dec c
    dec c
    dec c
    ld [hl-], a
    dec [hl]
    jr nc, @+$22

    jr nz, @+$22

    jr nz, @+$5a

    ld e, b
    jr nz, @+$33

    ld [hl-], a
    dec [hl]
    jr nz, jr_000_0b86

jr_000_0b66::
    jr nz, jr_000_0b88

jr_000_0b68::
    ld e, b
    ld e, b
    dec c
    dec c
    dec c
    jr nz, jr_000_0ba2

    jr nc, @+$22

    jr nz, @+$22

    jr nz, @+$5a

    ld e, b
    jr nz, jr_000_0b98

    jr nz, jr_000_0bb2

    jr nz, jr_000_0b9c

    jr nz, jr_000_0b9e

    ld e, b
    ld e, b
    dec c
    dec c
    dec c
    jr nz, @+$22

    dec [hl]

jr_000_0b86::
    jr nz, jr_000_0ba8

jr_000_0b88::
    jr nz, jr_000_0baa

    ld e, b
    ld e, b
    jr nz, jr_000_0bae

    jr nz, jr_000_0bc4

    jr nz, jr_000_0bb2

    jr nz, jr_000_0bb4

    ld e, b
    ld e, b
    dec c
    dec c

jr_000_0b98::
    dec c
    jr nz, jr_000_0bbb

jr_000_0b9b::
    ld [hl-], a

jr_000_0b9c::
    jr nz, jr_000_0bbe

jr_000_0b9e::
    jr nz, jr_000_0bc0

    ld e, b
    ld a, [hl+]

jr_000_0ba2::
    jr nz, jr_000_0bc4

    jr nz, jr_000_0bd7

    jr nz, jr_000_0bc8

jr_000_0ba8::
    jr nz, jr_000_0bca

jr_000_0baa::
    ld a, [hl+]
    ld a, [hl+]
    dec c
    dec c

jr_000_0bae::
    dec c
    dec c
    jr nz, jr_000_0bd2

jr_000_0bb2::
    ld d, b
    ld d, l

jr_000_0bb4::
    ld d, e
    ld c, b
    jr nz, jr_000_0bf9

    jr nz, @+$56

    ld c, a

jr_000_0bbb::
    jr nz, @+$55

    ld d, h

jr_000_0bbe::
    ld b, c
    ld d, d

jr_000_0bc0::
    ld d, h
    dec c
    nop
    inc c

jr_000_0bc4::
    jr nz, @+$22

    jr nz, jr_000_0be8

jr_000_0bc8::
    ld d, e
    ld c, h

jr_000_0bca::
    ld c, a
    ld d, h
    jr nz, @+$4f

    ld b, c
    ld b, e
    ld c, b
    ld c, c

jr_000_0bd2::
    ld c, [hl]
    ld b, l
    dec c
    dec c
    dec c

jr_000_0bd7::
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    dec c
    jr nz, @+$22

    jr nz, @+$22

    ld b, e

jr_000_0be8::
    ld d, d
    ld b, l
    ld b, h
    ld c, c
    ld d, h
    ld a, [hl-]
    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_000_0c01

    jr nz, @+$22

    jr nz, @+$52

    ld b, c

jr_000_0bf9::
    ld e, c
    jr nz, @+$51

    ld d, l
    ld d, h
    ld a, [hl-]
    jr nz, @+$22

jr_000_0c01::
    jr nz, @+$22

    jr nz, @+$02

End:
