; Disassembly of "biorhythm.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db kFileBit4 + kFileMarkerDiamond + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db .end - @ - 1            ; length of variable parts of header
    db $00                     ; owner code
.title
    dk "BIORYTHM"
.icon
.end

History:
.points
    dw 1
.author
    db "KEI KONDOH", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    ld sp, $e000
    xor a
    trap DrawInit
    trap $db
    ld a, $0a
    ld [$0000], a
    ld a, [$b2ba]
    cp $ff
    jr z, jr_000_0057

    callx @+$0037

jr_000_0057::
    callx @+$0497
    and $06

jr_000_0060:
    jr nz, jr_000_0085

    callx @+$04d9
    bit 2, a
    jr nz, jr_000_0085

    callx @+$0683
    bit 2, a
    jr nz, jr_000_0085

    callx @+$0775
    bit 2, a
    jr nz, jr_000_0085

    jr jr_000_0057

jr_000_0085::
    xor a
    ld [$0000], a
    trap ExitToMenu
    ld a, $ff
    ld [$b2ba], a
    xor a
    ld [$b2bf], a
    ld de, $07cd
    ld b, $09
    ld c, $01
    ld a, e
    ld [$b2bb], a
    ld a, d
    ld [$b2bc], a
    ld a, b
    ld [$b2bd], a
    ld a, c
    ld [$b2be], a
    ldx de, @+$001a
    ldx hl, @+$1208
    ld bc, $0040
    trap MemCopy
    ldx de, @+$004d
    ldx hl, @+$123b
    ld bc, $0020
    trap MemCopy
    ret


    ld d, l
    ld d, e
    ld b, l
    ld d, d
    jr nz, jr_000_010d

    jr nz, jr_000_00ce

jr_000_00ce::
    ld d, l
    ld d, e
    ld b, l
    ld d, d
    jr nz, @+$44

    jr nz, jr_000_00d6

jr_000_00d6::
    ld d, l
    ld d, e
    ld b, l
    ld d, d
    jr nz, @+$45

    jr nz, jr_000_00de

jr_000_00de::
    ld d, l
    ld d, e
    ld b, l
    ld d, d
    jr nz, jr_000_0128

    jr nz, jr_000_00e6

jr_000_00e6::
    ld d, l
    ld d, e
    ld b, l
    ld d, d
    jr nz, jr_000_0131

    jr nz, jr_000_00ee

jr_000_00ee::
    ld d, l
    ld d, e
    ld b, l
    ld d, d
    jr nz, @+$48

    jr nz, jr_000_00f6

jr_000_00f6::
    ld d, l
    ld d, e
    ld b, l
    ld d, d
    jr nz, @+$49

    jr nz, jr_000_00fe

jr_000_00fe::
    ld d, l
    ld d, e
    ld b, l
    ld d, d
    jr nz, @+$4a

    jr nz, jr_000_0106

jr_000_0106::
    add $07
    inc b
    ld bc, $07b6
    inc b

jr_000_010d::
    ld bc, $07b6
    inc b
    ld bc, $07b6
    inc b
    ld bc, $07b6
    inc b
    ld bc, $07b6
    inc b
    ld bc, $07b6
    inc b
    ld bc, $07b6
    inc b
    ld bc, $0321

jr_000_0128::
    nop
    trap $82
    ld a, l
    ret


    push de
    ld hl, $0190

jr_000_0131::
    trap $8a
    ld a, [$c3b0]
    pop de
    cp $00
    ld a, $00
    ret z

    push de
    ld hl, $0064
    trap $8a
    ld a, [$c3b0]
    pop de
    cp $00
    ld a, $00
    ret z

    ld hl, $0004
    trap $8a
    ld a, [$c3b0]
    cp $00
    ld a, $00
    ret z

    ld a, $01
    ret


    push de
    push bc
    ld hl, $0794
    trap $88
    push hl
    ld de, $016d
    trap $89
    pop de
    push hl
    ld hl, $0004
    trap $8a
    ld de, $0001
    trap $87
    pop de
    trap $87
    pop bc
    push bc
    ld a, b
    dec a
    sla a
    ld c, a
    ld b, $00
    push hl
    ldx hl, @+$002e
    add hl, bc
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    pop hl
    trap $87
    pop bc
    ld e, c
    ld d, $00
    trap $87
    pop de
    ld a, b
    cp $03
    jr nc, jr_000_01ad

    push hl
    callx @+$ff88
    pop hl
    cp $00
    jr nz, jr_000_01ad

    ld d, h
    ld e, l
    ld hl, $0001
    trap $88

jr_000_01ad::
    ld d, h
    ld e, l
    ret


    nop
    nop
    rra
    nop
    dec sp
    nop
    ld e, d
    nop
    ld a, b
    nop
    sub a
    nop
    or l
    nop
    call nc, $f300
    nop
    ld de, $3001
    ld bc, $014e
    callx @+$ff8f
    ld hl, $0001
    trap $88
    ld d, h
    ld e, l
    ld hl, $0007
    trap $8a
    ld a, [$c3b0]
    ret


    push bc
    ld c, b
    ld b, $00
    ldx hl, @+$0019
    add hl, bc
    ld a, [hl]
    pop bc
    ld c, a
    ld a, b
    cp $02
    ret nz

    push bc
    callx @+$ff32
    pop bc
    cp $00
    ret nz

    inc c
    ret


    nop
    rra
    inc e
    rra
    ld e, $1f
    ld e, $1f
    rra
    ld e, $1f
    ld e, $1f
    ld d, b
    ld e, c
    ld bc, $0000
    ldx hl, @+$001e

jr_000_0213::
    push bc
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    push hl
    ld h, b
    ld l, c
    ld c, $04
    trap $84
    ld a, l
    pop hl
    pop bc
    cp $00
    ret nz

    inc c
    ld a, c
    cp $0c
    jr nz, jr_000_0213

    ld c, $00
    ret


    ld bc, jr_000_0213
    ld [de], a
    inc bc
    inc d
    inc b
    inc de
    dec b
    inc d
    ld b, $15
    rlca
    ld d, $08
    ld d, $09
    ld d, $0a
    rla
    dec bc
    rla
    inc c
    dec d
    push bc
    callx @+$ff94
    ld e, c
    pop bc
    ld a, e
    cp c
    ld a, $00
    ret nc

    ld c, e
    ld a, $01
    ret


    ld a, $0c
    trap $b9
    ret


    ld a, $0f
    trap $b9
    ret


    ld a, $0e
    trap $b9
    ret


    ld a, $02
    trap $b9
    ret


    ld a, $01
    trap $b9
    ret


    push hl
    push de
    callx @+$0085
    pop de
    ld l, e
    ld a, d
    add b
    ld h, a
    trap MoveCursor
    pop hl
    push bc
    ld c, b
    ld b, $00
    add hl, bc
    pop bc
    dec c

jr_000_028a::
    trap AwaitFrame
    ldh a, [$b6]
    bit 6, a
    jr z, jr_000_02a1

    ld a, [hl]
    cp $5a
    jr nz, jr_000_0299

    ld a, $1f

jr_000_0299::
    inc a
    cp $21
    jr nz, jr_000_02a0

    ld a, $41

jr_000_02a0::
    ld [hl], a

jr_000_02a1::
    ldh a, [$b6]
    bit 7, a
    jr z, jr_000_02b6

    ld a, [hl]
    cp $20
    jr nz, jr_000_02ae

    ld a, $5b

jr_000_02ae::
    dec a
    cp $40
    jr nz, jr_000_02b5

    ld a, $20

jr_000_02b5::
    ld [hl], a

jr_000_02b6::
    ld a, [hl]
    trap DrawChar
    callx @+$ffab
    ldh a, [$b6]
    bit 5, a
    jr z, jr_000_02d3

    ld a, b
    cp $00
    ret z

    dec b
    dec hl
    callx @+$ff98

jr_000_02d3::
    ldh a, [$b6]
    bit 4, a
    jr z, jr_000_02e5

    ld a, b
    cp c
    ret z

    inc b
    inc hl
    callx @+$ff8b

jr_000_02e5::
    ldh a, [$8b]
    and $07
    ret nz

    ldh a, [$83]
    and $08
    jr nz, jr_000_028a

    ld a, $00
    trap DrawChar
    callx @+$ff70
    jr jr_000_028a

    push hl
    ld h, d
    ld l, e
    trap MoveCursor
    pop hl
    trap DrawString
    ret


jr_000_0306::
    push hl
    push de
    push bc
    callx @+$0088
    pop bc
    pop de
    pop hl
    ld a, [$c620]
    cp $ff
    ret z

jr_000_0319::
    trap AwaitFrame
    push hl
    ld a, [$c620]
    cp $00
    jr nz, jr_000_032a

    callx @+$00b7

jr_000_032a::
    ld a, [$c620]
    cp $01
    jr nz, jr_000_0338

    callx @+$0116

jr_000_0338::
    ld a, [$c620]
    cp $02
    jr nz, jr_000_0346

    callx @+$0156

jr_000_0346:
    pop hl
    ldh a, [$b6]
    bit 5, a
    jr z, jr_000_0359

    ld a, [$c620]
    cp $00
    ret z

    dec a
    ld [$c620], a
    jr jr_000_0306

jr_000_0359::
    ldh a, [$b6]
    bit 4, a
    jr z, jr_000_036b

    ld a, [$c620]
    cp $02
    ret z

    inc a
    ld [$c620], a
    jr jr_000_0306

jr_000_036b::
    ldh a, [$8b]
    and $07
    ret nz

    ldh a, [$83]
    and $08
    jr nz, jr_000_0319

    push hl
    ld hl, $a395
    ld a, [$c620]
    cp $00
    jr z, jr_000_0384

    ld hl, $a39a

jr_000_0384::
    push de
    push bc
    trap DrawString
    pop bc
    pop de
    pop hl
    jr jr_000_0319

    jr nz, @+$22

    jr nz, jr_000_03b1

    nop
    jr nz, jr_000_03b4

    nop
    trap MoveCursor
    ld hl, $c600
    push bc
    trap IntToString
    pop bc
    ld hl, $c602
    trap DrawString
    callx @+$fec6
    callx @+$febf

jr_000_03b1::
    ld hl, $c600

jr_000_03b4::
    ld d, $00
    ld e, b
    push bc
    trap IntToString
    pop bc
    ld hl, $c604
    trap DrawString
    callx @+$fea9
    callx @+$fea2
    ld hl, $c600
    ld d, $00
    ld e, c
    push bc
    trap IntToString
    pop bc
    ld hl, $c604
    trap DrawString
    ret


    push bc
    callx @+$0005
    pop bc
    ret


    trap MoveCursor
    ldh a, [$b6]
    bit 6, a
    jr z, jr_000_0406

    ld hl, $07e9
    ld c, $08
    trap $84
    ld a, l
    cp $00
    jr z, jr_000_03ff

    ld de, $0793

jr_000_03ff::
    ld hl, $0001
    trap $87
    ld d, h
    ld e, l

jr_000_0406::
    ldh a, [$b6]
    bit 7, a
    jr z, jr_000_0422

    ld hl, $0794
    ld c, $08
    trap $84
    ld a, l
    cp $00
    jr z, jr_000_041b

    ld de, $07ea

jr_000_041b::
    ld hl, $0001
    trap $88
    ld d, h
    ld e, l

jr_000_0422::
    ld hl, $c600
    push de
    trap IntToString
    ld hl, $c602
    trap DrawString
    pop de
    callx @+$fe36
    callx @+$fe2f
    callx @+$fe28
    callx @+$fe21
    ret


    ld a, h
    add $06
    ld h, a
    push de
    push bc
    callx @+$0008
    ld a, b
    pop bc
    ld b, a
    pop de
    ret


    trap MoveCursor
    ldh a, [$b6]
    bit 6, a
    jr z, jr_000_046d

    ld a, b
    cp $0c
    jr nz, jr_000_046c

    ld b, $00

jr_000_046c::
    inc b

jr_000_046d::
    ldh a, [$b6]
    bit 7, a
    jr z, jr_000_047b

    ld a, b
    cp $01
    jr nz, jr_000_047a

    ld b, $0d

jr_000_047a::
    dec b

jr_000_047b::
    push bc
    ld hl, $c600
    ld d, $00
    ld e, b
    trap IntToString
    ld hl, $c604
    trap DrawString
    pop bc
    callx @+$fdda
    callx @+$fdd3
    ret


    ld a, h
    add $0a
    ld h, a
    push de
    push bc
    callx @+$0008
    ld a, c
    pop bc
    ld c, a
    pop de
    ret


    trap MoveCursor
    push bc
    callx @+$fd2d
    ld a, c
    pop bc
    ld b, a
    ldh a, [$b6]
    bit 6, a
    jr z, jr_000_04c5

    ld a, c
    cp b
    jr nz, jr_000_04c4

    ld c, $00

jr_000_04c4::
    inc c

jr_000_04c5::
    ldh a, [$b6]
    bit 7, a
    jr z, jr_000_04d4

    ld a, c
    cp $01
    jr nz, jr_000_04d3

    inc b
    ld c, b
    dec b

jr_000_04d3::
    dec c

jr_000_04d4::
    push bc
    ld hl, $c600
    ld d, $00
    ld e, c
    trap IntToString
    ld hl, $c604
    trap DrawString
    pop bc
    callx @+$fd81
    callx @+$fd7a
    ret


    callx @+$fd63
    callx @+$000a

jr_000_0500::
    ldh a, [$8b]
    and $07
    jr z, jr_000_0500

    ret


    ldx hl, @+$0009
    ld de, $0307
    trap DrawStringList
    ret


    ld b, d
    jr nz, jr_000_055d

    jr nz, @+$51

    jr nz, jr_000_0545

    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    nop
    jr nz, jr_000_0542

    jr nz, @+$22

    jr nz, jr_000_0546

    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_000_054c

    jr nz, @+$22

    nop
    dec l
    dec l
    dec l
    dec l
    jr nz, @+$54

    jr nz, @+$5b

    jr nz, @+$56

    jr nz, @+$4a

    jr nz, @+$4f

    nop
    nop
    pushx @+$0006

jr_000_0542::
    pushx @+$fd16

jr_000_0545::
    ret


jr_000_0546::
    pushx @+$0006
    pushx @+$fd14

jr_000_054c::
    ret


    callx @+$00b9
    trap AwaitFrame
    callx @+$0118

jr_000_055d::
    ld a, $ff
    ld [$c620], a
    jr jr_000_0588

jr_000_0564::
    ld a, [$c620]
    cp $02
    ld b, $06
    jr z, jr_000_056f

    ld b, $00

jr_000_056f::
    callx @+$004d
    ld a, b
    cp $00
    ld a, $02
    jr z, jr_000_057f

    ld a, $00

jr_000_057f::
    ld [$c620], a
    ldh a, [$8a]
    and $07
    jr nz, jr_000_05a3

jr_000_0588::
    callx @+$0044
    ld a, [$c620]
    cp $00
    ld a, $02
    jr z, jr_000_059a

    ld a, $00

jr_000_059a::
    ld [$c620], a
    ldh a, [$8a]
    and $07
    jr z, jr_000_0564

jr_000_05a3::
    callx @+$0106
    ldh a, [$8b]
    and $05
    ret nz

    ldh a, [$8b]
    bit 1, a
    jr z, jr_000_0564

    callx @+$012d
    jx @+$ff97


    ld hl, $c610
    ld de, $0806
    ld c, $07
    callx @+$fca6
    ret


jr_000_05d0::
    ld a, [$c618]
    ld e, a
    ld a, [$c619]
    ld d, a
    ld a, [$c61a]
    ld b, a

jr_000_05dc::
    ld a, [$c61b]
    ld c, a
    ld hl, $030a
    callx @+$fd1f
    ld a, e
    ld [$c618], a
    ld a, d
    ld [$c619], a
    ld a, b
    ld [$c61a], a
    ld a, c
    ld [$c61b], a
    callx @+$fc48
    cp $00
    ret z

    ld a, c
    ld [$c61b], a
    jr jr_000_05d0

    ldx hl, @+$0009
    ld de, jr_000_0306
    trap DrawStringList
    ret


    push bc
    trap HideScreen
    jr nz, @+$3c

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_000_05dc

    db $dd
    nop
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
    jr nz, jr_000_0654

    jr nz, jr_000_0656

    jr nz, jr_000_0658

    jr nz, jr_000_065a

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    nop
    ret nz

    db $dd
    cp h
    sbc $ae
    or e
    set 3, [hl]
    ld a, [hl-]
    jr nz, jr_000_066c

    jr nz, jr_000_066e

    jr nz, jr_000_0670

    jr nz, jr_000_0652

jr_000_0652::
    jr nz, @+$22

jr_000_0654::
    jr nz, @+$22

jr_000_0656::
    ret z

    db $dd

jr_000_0658::
    jr nz, @+$22

jr_000_065a::
    or [hl]
    sbc $c2
    jr nz, @+$22

    add $c1
    nop
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

jr_000_066c::
    dec l
    dec l

jr_000_066e::
    dec l
    dec l

jr_000_0670::
    nop
    nop
    ld a, [$b2bf]
    sla a
    sla a
    sla a
    ld b, $00
    ld c, a
    ldx hl, @+$0c39
    add hl, bc
    ld d, h
    ld e, l
    ld hl, $c610
    ld bc, $0008
    trap MemCopy
    ld a, [$b2bf]
    sla a
    sla a
    ld b, $00
    ld c, a
    ldx hl, @+$0c60
    add hl, bc
    ld a, [hl+]
    ld [$c618], a
    ld a, [hl+]
    ld [$c619], a
    ld a, [hl+]
    ld [$c61a], a
    ld a, [hl+]
    ld [$c61b], a
    ret


    ld a, [$b2bf]
    sla a
    sla a
    sla a
    ld b, $00
    ld c, a
    ldx hl, @+$0bfe
    add hl, bc
    ld de, $c610
    ld bc, $0008
    trap MemCopy
    ld a, [$b2bf]
    sla a
    sla a
    ld b, $00
    ld c, a
    ldx hl, @+$0c27
    add hl, bc
    ld a, [$c618]
    ld [hl+], a
    ld a, [$c619]
    ld [hl+], a
    ld a, [$c61a]
    ld [hl+], a
    ld a, [$c61b]
    ld [hl], a
    ret


    ld a, [$b2bf]
    inc a
    cp $08
    jr nz, jr_000_06f0

    ld a, $00

jr_000_06f0::
    ld [$b2bf], a
    ret


jr_000_06f4::
    callx @+$fb61
    callx @+$fb5f
    callx @+$006e
    ld a, $ff
    ld [$c620], a

jr_000_070e::
    callx @+$0027
    ld a, [$c620]
    cp $00
    ld a, $02
    jr z, jr_000_0720

    ld a, $00

jr_000_0720::
    ld [$c620], a
    ldh a, [$8b]
    and $07
    jr z, jr_000_070e

    ld b, a
    push bc
    callx @+$0080
    pop bc
    cp $00
    jr nz, jr_000_06f4

    ld a, b
    ret


jr_000_0739::
    ld a, [$b2bb]
    ld e, a
    ld a, [$b2bc]
    ld d, a
    ld a, [$b2bd]
    ld b, a
    ld a, [$b2be]
    ld c, a
    ld hl, $0308
    callx @+$fbb6
    ld a, e
    ld [$b2bb], a
    ld a, d
    ld [$b2bc], a
    ld a, b
    ld [$b2bd], a
    ld a, c
    ld [$b2be], a
    callx @+$fadf
    cp $00
    ret z

    ld a, c
    ld [$b2be], a
    jr jr_000_0739

    ret


    ldx hl, @+$0009
    ld de, $0307
    trap DrawStringList
    ret


    cp h
    db $dd
    ret nz

    sbc $dd
    cp l
    reti


    set 0, d
    sbc $b9
    ld a, [hl-]
    jr nz, jr_000_07ac

    jr nz, jr_000_07ae

    nop
    jr nz, @+$22

    jr nz, jr_000_07b3

    ret z

    db $dd
    jr nz, jr_000_07b7

    or [hl]
    sbc $c2
    jr nz, @+$22

    add $c1
    nop
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

jr_000_07ac::
    dec l
    nop

jr_000_07ae::
    nop
    ld a, [$b2bb]
    ld e, a

jr_000_07b3::
    ld a, [$b2bc]
    ld d, a

jr_000_07b7::
    ld a, [$c618]
    ld l, a
    ld a, [$c619]
    ld h, a
    ld c, $06
    trap $84
    ld a, l
    cp $00
    ld a, $00
    ret nz

    ld a, [$b2bb]
    ld e, a
    ld a, [$b2bc]
    ld d, a
    ld a, [$c618]
    ld l, a
    ld a, [$c619]
    ld h, a
    ld c, $08
    trap $84
    ld a, l
    cp $00
    ld a, $01
    ret z

    ld a, [$b2bd]
    ld b, a
    ld a, [$c61a]
    cp b
    ld a, $01
    ret nc

    ld a, $00
    ret


    callx @+$0091
    callx @+$0899
    callx @+$08b2

jr_000_0806:
    callx @+$086b
    callx @+$03be
    callx @+$039c
    callx @+$fa3a
    callx @+$0081
    callx @+$0201
    callx @+$0277
    callx @+$02f2
    callx @+$01ad


jr_000_0845:
    trap AwaitFrame
    callx @+$088a
    cp $00
    jr nz, jr_000_0806

    ldh a, [$8b]
    bit 6, a
    jr z, jr_000_0861

    callx @+$04e4
    jr jr_000_0806

jr_000_0861::
    ldh a, [$8b]
    bit 7, a
    jr z, jr_000_0870

    callx @+$0926
    jr jr_000_0806

jr_000_0870::
    ldh a, [$8b]
    bit 1, a
    jr z, jr_000_087f

    callx @+$0375
    jr jr_000_0806

jr_000_087f::
    ldh a, [$8b]
    and $05
    jr z, jr_000_0845

    ret


    ld a, [$b2bb]
    ld [$c61c], a
    ld a, [$b2bc]
    ld [$c61d], a
    ld a, [$b2bd]
    ld [$c61e], a
    ld a, [$b2be]
    cp $0f
    ld a, $01
    jr c, jr_000_08a3

    ld a, $0f

jr_000_08a3::
    ld [$c61f], a
    ret


    ldx hl, @+$00a8
    ld de, $0003
    trap DrawStringList
    ld hl, $0001
    trap MoveCursor
    callx @+$f9a5
    ldx hl, @+$00c1
    trap DrawString
    callx @+$f99d
    ldx hl, @+$00c2
    trap DrawString
    ld hl, $0201
    trap MoveCursor
    ld a, [$c61c]
    ld e, a
    ld a, [$c61d]
    ld d, a
    ld hl, $c600
    trap IntToString
    ld hl, $c602
    trap DrawString
    ld hl, $0801
    trap MoveCursor
    ld a, [$c61e]
    ld e, a
    ld d, $00
    ld hl, $c600
    trap IntToString
    ld hl, $c604
    trap DrawString
    ld hl, $0110
    trap MoveCursor
    ld a, [$c61f]
    cp $0f
    jr z, jr_000_090f

    ldx hl, @+$008f
    trap DrawString
    jr jr_000_0920

jr_000_090f::
    ld a, [$c61e]
    cp $02
    ldx hl, @+$0096
    jr nz, jr_000_091e

    ldx hl, @+$00a4

jr_000_091e::
    trap DrawString

jr_000_0920::
    ld hl, $0111
    trap MoveCursor
    ld a, [$c61c]
    ld e, a
    ld a, [$c61d]
    ld d, a
    ld a, [$c61e]
    ld b, a
    ld a, [$c61f]
    ld c, a
    callx @+$f88f
    ld b, $00
    ld c, a
    ldx hl, @+$0093
    add hl, bc
    ld c, $00

jr_000_0946::
    ld a, [hl+]
    trap DrawChar
    inc c
    ld a, c
    cp $13

jr_000_094d::
    jr nz, jr_000_0946

    ret


    dec hl
    nop
    ld a, h
    nop
    ld a, h
    nop
    ld a, h
    nop
    ld a, h
    nop
    ld a, h
    nop
    jr nc, jr_000_098b

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
    ld a, h
    nop
    ld a, h
    nop
    ld a, h
    nop
    ld a, h
    nop
    ld a, h
    nop
    dec l
    nop
    nop
    ld a, [hl+]
    jr nz, @+$22

    jr nz, jr_000_09a3

    jr nz, jr_000_094d

    db $dd
    jr nz, jr_000_09a8

    or [hl]
    sbc $c2

jr_000_098b::
    nop
    jp z, $b2de

    or l
    ret c

    cp l
    sbc $d1
    jr nz, @+$2c

    nop
    ld sp, $2e2e
    ld l, $35
    ld l, $2e
    ld l, $2e
    ld sp, $2e30

jr_000_09a3::
    ld l, $2e
    ld sp, $2e35

jr_000_09a8::
    ld l, $2e
    nop
    ld sp, $2e35
    ld l, $2e
    ld [hl-], a
    jr nc, jr_000_09e1

    ld l, $2e
    ld [hl-], a
    dec [hl]
    ld l, $2e
    ld l, $33
    jr nc, @+$30

    ld l, $00
    ld sp, $2e35
    ld l, $2e
    ld [hl-], a
    jr nc, @+$30

    ld l, $2e
    ld [hl-], a
    dec [hl]
    ld l, $32
    jr c, @+$30

    ld l, $2e
    ld l, $00
    jr nz, @+$22

    jr nz, jr_000_09f7

    jr nz, @+$22

    ld e, [hl]
    jr nz, @+$22

    jr nz, jr_000_09fe

    jr nz, @+$22

    ld e, [hl]

jr_000_09e1::
    jr nz, @+$22

    jr nz, jr_000_0a05

    jr nz, jr_000_0a07

    ld e, [hl]
    jr nz, jr_000_0a0a

    jr nz, @+$22

    jr nz, jr_000_0a0e

    ld e, [hl]
    ld a, [$c625]
    ld l, a
    ld a, [$c626]
    ld h, a

jr_000_09f7::
    ld a, [$c629]
    ld e, a
    ld a, [$c62a]

jr_000_09fe::
    ld d, a
    trap $88
    push hl
    ld de, $0000

jr_000_0a05::
    ld c, $04

jr_000_0a07::
    trap $84
    ld a, l

jr_000_0a0a::
    pop hl
    cp $00
    ret z

jr_000_0a0e::
    push hl
    ld de, $0012
    ld c, $02
    trap $84
    ld a, l
    pop hl
    cp $00
    ret z

    ld h, l
    inc h
    ld l, $03
    trap MoveCursor
    ld a, $3a
    trap DrawChar
    ld l, $0f
    trap MoveCursor
    ld a, $3a
    trap DrawChar
    ret


    ld hl, $0017
    ld a, [$c621]
    ld e, a
    ld a, [$c622]
    ld d, a
    trap $8a
    ld b, $00
    ld a, [$c3b0]
    ld c, a
    ld a, [$c61f]
    ld e, a
    xor a
    ld [$c62b], a
    ld hl, $0109

jr_000_0a4c::
    push hl
    ldx hl, @+$0046
    add hl, bc
    ld a, [hl]
    pop hl
    add $09
    ld l, a
    trap MoveCursor
    ld a, $50
    trap DrawChar
    ld a, l
    cp $09
    jr nz, jr_000_0a84

    ld d, $20
    ld a, [$c61e]
    cp $02
    jr nz, jr_000_0a6d

    ld d, $1d

jr_000_0a6d::
    ld a, e
    cp d
    jr nc, jr_000_0a84

    push hl
    push bc
    ld a, [$c62b]
    ld b, $00
    ld c, a
    inc a
    ld [$c62b], a
    ld hl, $c62c
    add hl, bc
    ld [hl], e
    pop bc
    pop hl

jr_000_0a84::
    inc e
    inc c
    ld a, c
    cp $17
    jr nz, jr_000_0a8d

    ld c, $00

jr_000_0a8d::
    inc h
    ld a, h
    cp $14
    jr nz, jr_000_0a4c

    ret


    nop
    rst $38
    db $fd
    db $fc
    ei
    ei
    ei
    ei
    db $fc
    db $fd
    rst $38
    nop
    ld bc, $0403
    dec b
    dec b
    dec b
    dec b
    inc b
    inc bc
    ld bc, $2100
    inc e
    nop
    ld a, [$c621]
    ld e, a
    ld a, [$c622]
    ld d, a
    trap $8a
    ld b, $00
    ld a, [$c3b0]
    ld c, a
    ld a, [$c61f]
    ld e, a
    xor a
    ld [$c630], a
    ld hl, $0109

jr_000_0ac9::
    push hl
    ldx hl, @+$0046
    add hl, bc
    ld a, [hl]
    pop hl
    add $09
    ld l, a
    trap MoveCursor
    ld a, $53
    trap DrawChar
    ld a, l
    cp $09
    jr nz, jr_000_0b01

    ld d, $20
    ld a, [$c61e]
    cp $02
    jr nz, jr_000_0aea

    ld d, $1d

jr_000_0aea::
    ld a, e
    cp d
    jr nc, jr_000_0b01

    push hl
    push bc
    ld a, [$c630]
    ld b, $00
    ld c, a
    inc a
    ld [$c630], a
    ld hl, $c631
    add hl, bc
    ld [hl], e
    pop bc
    pop hl

jr_000_0b01::
    inc e
    inc c
    ld a, c
    cp $1c
    jr nz, jr_000_0b0a

    ld c, $00

jr_000_0b0a::
    inc h
    ld a, h
    cp $14
    jr nz, jr_000_0ac9

    ret


    nop
    rst $38
    cp $fd
    db $fc
    ei
    ei
    ei
    ei
    ei
    db $fc
    db $fd
    cp $00
    nop
    ld [bc], a
    inc bc
    inc b
    dec b
    dec b
    dec b
    dec b
    dec b
    inc b
    inc bc
    ld [bc], a
    ld bc, $2100
    ld hl, $fa00
    ld hl, $5fc6
    ld a, [$c622]
    ld d, a
    trap $8a
    ld b, $00
    ld a, [$c3b0]
    ld c, a
    ld a, [$c61f]
    ld e, a
    xor a
    ld [$c635], a
    ld hl, $0109

jr_000_0b4b::
    push hl
    ldx hl, @+$0046
    add hl, bc
    ld a, [hl]
    pop hl
    add $09
    ld l, a
    trap MoveCursor
    ld a, $49
    trap DrawChar
    ld a, l
    cp $09
    jr nz, jr_000_0b83

    ld d, $20
    ld a, [$c61e]
    cp $02
    jr nz, jr_000_0b6c

    ld d, $1d

jr_000_0b6c::
    ld a, e
    cp d
    jr nc, jr_000_0b83

    push hl
    push bc
    ld a, [$c635]
    ld b, $00
    ld c, a
    inc a
    ld [$c635], a
    ld hl, $c636
    add hl, bc
    ld [hl], e
    pop bc
    pop hl

jr_000_0b83::
    inc e
    inc c
    ld a, c
    cp $21
    jr nz, jr_000_0b8c

    ld c, $00

jr_000_0b8c::
    inc h
    ld a, h
    cp $14
    jr nz, jr_000_0b4b

    ret


    nop
    rst $38
    cp $fd
    db $fc
    db $fc
    ei
    ei
    ei
    ei
    ei
    db $fc
    db $fc
    db $fd
    cp $ff
    nop
    ld bc, $0302
    inc b
    inc b
    dec b
    dec b
    dec b
    dec b
    dec b
    inc b
    inc b
    inc bc
    ld [bc], a
    ld bc, $fa00
    dec h
    add $5f
    ld a, [$c626]
    ld d, a
    ld a, [$c627]
    ld l, a
    ld a, [$c628]
    ld h, a
    trap $88
    ld a, l
    ld [$c621], a
    ld a, h
    ld [$c622], a
    ret


    ld a, [$c629]
    ld e, a
    ld a, [$c62a]
    ld d, a
    ld a, [$c627]
    ld l, a
    ld a, [$c628]
    ld h, a
    trap $88
    ld de, $0001
    trap $87
    ld a, l
    ld [$c623], a
    ld a, h
    ld [$c624], a
    ret


    callx @+$f66b
    ldx hl, @+$000f
    ld de, $0101
    trap DrawStringList

jr_000_0bff::
    ldh a, [$8b]
    and $ff
    jr z, jr_000_0bff

    ret


    dec hl

jr_000_0c07::
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
    dec hl
    nop
    ld a, h

jr_000_0c1a::
    jr z, @+$52

    add hl, hl
    cp h
    db $dd
    ret nz

    or d
    ret c

    cp l
    sbc $d1
    jr nz, jr_000_0c47

    jr nz, jr_000_0c49

    jr nz, jr_000_0c4b

    ld a, h
    nop
    ld a, h
    jr nz, @+$22

    jr nz, jr_000_0c5d

    jr nz, @-$3e

    or d
    ret c

    xor [hl]
    cp b
    cp d
    or e
    pop bc
    xor [hl]
    or e
    jr nz, @+$7e

    nop
    ld a, h
    jr nz, jr_000_0c63

    jr nz, jr_000_0c75

    jr nz, jr_000_0c07

jr_000_0c47::
    or d
    pop bc

jr_000_0c49::
    xor [hl]
    or e

jr_000_0c4b::
    call z, $ddb1
    jp $20b2


    ld a, h
    nop
    ld a, h
    jr nz, @+$22

    jr nz, jr_000_0c85

    jr nz, jr_000_0c1a

    or d
    ret c

    xor [hl]

jr_000_0c5d::
    cp b
    jp $c1b2


    xor [hl]
    or e

jr_000_0c63::
    jr nz, jr_000_0ce1

    nop

jr_000_0c66::
    ld a, h
    jr nz, jr_000_0c89

    jr nz, jr_000_0c8b

    jr nz, jr_000_0c8d

    jr nz, jr_000_0c8f

    jr nz, jr_000_0c91

    jr nz, jr_000_0c93

    jr nz, jr_000_0c95

jr_000_0c75::
    jr nz, jr_000_0c97

    ld a, h
    nop
    ld a, h
    jr z, jr_000_0ccf

    add hl, hl
    or [hl]
    db $dd
    cp h
    sbc $ae
    or e
    ret c

    cp l

jr_000_0c85::
    sbc $d1
    jr nz, @+$22

jr_000_0c89::
    jr nz, @+$22

jr_000_0c8b::
    jr nz, @+$7e

jr_000_0c8d::
    nop
    ld a, h

jr_000_0c8f::
    jr nz, @+$22

jr_000_0c91::
    jr nz, jr_000_0cbe

jr_000_0c93::
    jr nz, @-$47

jr_000_0c95::
    ret c

    xor [hl]

jr_000_0c97::
    cp b
    cp h
    sbc $ad
    or e
    cp h
    sbc $c2
    jr nz, jr_000_0cc1

    ld a, h
    nop
    ld a, h
    jr nz, @+$22

    jr nz, @+$32

    jr nz, jr_000_0c66

    sbc $ae
    or e
    pop bc
    xor [hl]
    call z, $ddb1
    jp $20b2


    ld a, h
    nop
    ld a, h
    jr nz, @+$22

    jr nz, @+$2f

    jr nz, jr_000_0c75

jr_000_0cbe::
    ret c

    xor [hl]
    cp b

jr_000_0cc1::
    pop bc
    db $dd
    ret nz

    or d
    jr nz, @+$22

    jr nz, @+$7e

    nop
    ld a, h
    jr nz, @+$22

jr_000_0ccd::
    jr nz, @+$22

jr_000_0ccf::
    jr nz, jr_000_0cf1

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_000_0cf9

    jr nz, jr_000_0cfb

    ld a, h
    nop
    ld a, h
    jr z, @+$4b

jr_000_0ce0::
    add hl, hl

jr_000_0ce1::
    pop bc
    cp [hl]
    or d
    ret c

    cp l
    sbc $d1
    jr nz, jr_000_0d0a

    jr nz, jr_000_0d0c

    jr nz, jr_000_0d0e

    jr nz, @+$7e

    nop

jr_000_0cf1::
    ld a, h
    jr nz, @+$22

    jr nz, @+$2d

    jr nz, @-$3d

    ret c

jr_000_0cf9::
    xor [hl]
    cp b

jr_000_0cfb::
    or [hl]
    jp nz, $dec4

    or e
    jr nz, jr_000_0d22

    jr nz, @+$7e

    nop
    ld a, h
    jr nz, jr_000_0d28

    jr nz, jr_000_0d3a

jr_000_0d0a::
    jr nz, jr_000_0ccd

jr_000_0d0c::
    ret c

    xor [hl]

jr_000_0d0e::
    cp b
    call z, $ddb1
    jp $20b2


    jr nz, jr_000_0d93

    nop
    ld a, h
    jr nz, jr_000_0d3b

    jr nz, jr_000_0d4a

    jr nz, jr_000_0ce0

    jp $b9b7


jr_000_0d22::
    sbc $dd
    cp l
    or d
    jr nz, @+$22

jr_000_0d28::
    jr nz, jr_000_0d4a

    ld a, h
    nop
    dec hl
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

jr_000_0d3a::
    dec l

jr_000_0d3b::
    dec l
    dec l
    dec hl
    nop
    nop
    callx @+$f51a
    pushx @+$0112

jr_000_0d4a:
    pop hl
    ld de, $0105
    trap DrawStringList
    ld hl, jr_000_0306
    trap MoveCursor
    ld hl, $c610
    trap DrawString
    ld hl, $0d06
    trap MoveCursor
    ld a, [$b2bb]
    ld e, a
    ld a, [$b2bc]
    ld d, a
    ld a, [$c618]
    ld l, a
    ld a, [$c619]
    ld h, a
    trap $88
    push hl
    ld a, [$b2bd]
    ld d, a
    ld a, [$b2be]
    ld e, a
    ld a, [$c61a]
    ld h, a
    ld a, [$c61b]
    ld l, a
    ld c, $07
    trap $84
    ld a, l
    cp $00
    pop hl
    jr z, jr_000_0d8d

    dec l

jr_000_0d8d::
    ld d, $00
    ld e, l
    ld hl, $c600

jr_000_0d93::
    trap IntToString
    ld hl, $c604
    trap DrawString
    ldx hl, @+$5569
    trap MoveCursor
    ld a, [$b2bb]
    ld e, a
    ld a, [$b2bc]
    ld d, a
    ld a, [$c618]
    ld l, a
    ld a, [$c619]
    ld h, a
    trap $88
    inc l
    ld a, [$b2bd]
    cp $04
    jr nz, jr_000_0dbb

    dec l

jr_000_0dbb::
    ld a, l
    cp $13
    jr c, jr_000_0dc2

    ld a, $13

jr_000_0dc2::
    ld l, a
    ld h, $00
    ld de, $000c
    trap $89
    ld b, h
    ld c, l
    ldx hl, @+$01b8
    add hl, bc
    trap DrawString
    ld a, [$c618]
    ld e, a
    ld a, [$c619]
    ld d, a
    ld a, [$c61a]
    ld b, a
    ld a, [$c61b]
    ld c, a
    ld hl, $0308
    callx @+$f5ab
    ld hl, $0309
    trap MoveCursor
    ld a, [$c618]
    ld e, a
    ld a, [$c619]
    ld d, a
    ld a, [$c61a]
    ld b, a
    ld a, [$c61b]
    ld c, a
    callx @+$f3c2
    sla a
    sla a
    ld c, a
    ld b, $00
    ldx hl, @+$0158
    add hl, bc
    trap DrawString
    ld hl, $0a09
    trap MoveCursor
    ld a, [$c61a]
    ld b, a
    ld a, [$c61b]
    ld c, a
    callx @+$f3e2
    ld a, c
    sla a
    sla a
    sla a
    ld c, a
    ld b, $00
    ldx hl, @+$00d3
    add hl, bc
    trap DrawString
    ld hl, $090b
    trap MoveCursor
    ld a, [$c623]
    ld e, a
    ld a, [$c624]
    ld d, a
    ld hl, $c600
    trap IntToString
    ld hl, $c601
    trap DrawString

jr_000_0e53::
    ldh a, [$8b]
    and $ff
    jr z, jr_000_0e53

    ret


    dec hl
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l

jr_000_0e62::
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec hl
    nop
    ld a, h
    jr nz, @+$22

    jr nz, jr_000_0e92

    jr nz, jr_000_0e94

    jr nz, jr_000_0e96

    jr nz, jr_000_0e98

    jr nz, jr_000_0e9a

    jr nz, @-$43

    or d
    jr nz, jr_000_0efb

    nop
    ld a, h
    jr nz, @+$22

    jr nz, @+$22

jr_000_0e85::
    jr nz, jr_000_0ea7

    jr nz, jr_000_0ea9

    jr nz, jr_000_0eab

    jr nz, jr_000_0ead

    jr nz, jr_000_0eaf

    jr nz, jr_000_0eb1

    ld a, h

jr_000_0e92::
    nop
    ld a, h

jr_000_0e94::
    jr nz, @+$22

jr_000_0e96::
    jr nz, @+$22

jr_000_0e98::
    jr nz, jr_000_0e62

jr_000_0e9a::
    db $dd
    jr nz, jr_000_0ebd

    or [hl]
    sbc $c2
    jr nz, @+$22

    add $c1
    jr nz, jr_000_0f22

    ld a, h

jr_000_0ea7::
    nop
    ld a, h

jr_000_0ea9::
    jr nz, jr_000_0ecb

jr_000_0eab::
    jr nz, jr_000_0ecd

jr_000_0ead::
    sub $b3

jr_000_0eaf::
    set 3, [hl]

jr_000_0eb1::
    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_000_0ed7

    jr nz, jr_000_0ed9

    jr nz, @+$7e

    nop
    ld a, h

jr_000_0ebd::
    jr nz, @+$22

    jr nz, jr_000_0ee1

    jr nz, jr_000_0ee3

    jr nz, jr_000_0ee5

    jr nz, jr_000_0ee7

    jr nz, jr_000_0ee9

    jr nz, jr_000_0eeb

jr_000_0ecb::
    jr nz, jr_000_0eed

jr_000_0ecd::
    ld a, h
    nop
    ld a, h
    jr nz, jr_000_0e85

    trap $da
    jp $d7b6


jr_000_0ed7::
    jr nz, jr_000_0ef9

jr_000_0ed9::
    jr nz, jr_000_0efb

    jr nz, @-$38

    pop bc
    jp nc, $7c20

jr_000_0ee1::
    nop
    ld a, h

jr_000_0ee3::
    jr nz, jr_000_0f05

jr_000_0ee5::
    jr nz, jr_000_0f07

jr_000_0ee7::
    jr nz, jr_000_0f09

jr_000_0ee9::
    jr nz, @+$22

jr_000_0eeb::
    jr nz, jr_000_0f0d

jr_000_0eed::
    jr nz, jr_000_0f0f

    jr nz, jr_000_0f11

    jr nz, jr_000_0f13

    ld a, h
    nop
    dec hl
    dec l
    dec l
    dec l

jr_000_0ef9::
    dec l
    dec l

jr_000_0efb::
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

jr_000_0f05::
    dec l
    dec hl

jr_000_0f07::
    nop
    nop

jr_000_0f09::
    call nc, $deb7
    cp e

jr_000_0f0d::
    sbc $20

jr_000_0f0f::
    jr nz, jr_000_0f11

jr_000_0f11::
    ret nc

    cp l

jr_000_0f13::
    sbc $b6
    sbc $d2
    jr nz, jr_000_0f19

jr_000_0f19::
    or e
    or l
    cp e
    sbc $20
    jr nz, jr_000_0f40

    nop
    or l

jr_000_0f22::
    set 0, d
    cp h
    sbc $bb
    sbc $00
    or l
    or e
    cp h
    cp e
    sbc $20
    jr nz, jr_000_0f31

jr_000_0f31::
    call z, $bac0
    sbc $bb
    sbc $20
    nop
    or [hl]
    add $bb
    sbc $20
    jr nz, @+$22

jr_000_0f40::
    nop
    cp h
    cp h
    cp e
    sbc $20
    jr nz, @+$22

    nop
    or l
    call nz, $bbd2
    sbc $20
    jr nz, jr_000_0f51

jr_000_0f51::
    jp $cbdd


    sbc $dd
    cp e
    sbc $00
    cp e
    cp a
    ret c

    cp e
    sbc $20
    jr nz, jr_000_0f61

jr_000_0f61::
    or d
    jp $debb


    jr nz, jr_000_0f87

    jr nz, jr_000_0f69

jr_000_0f69::
    cp c
    sbc $c2
    nop
    or [hl]
    jr nz, @+$22

    nop
    cp l
    or d
    jr nz, jr_000_0f75

jr_000_0f75::
    db $d3
    cp b
    jr nz, jr_000_0f79

jr_000_0f79::
    or a
    db $dd
    jr nz, jr_000_0f7d

jr_000_0f7d::
    call nz, $20de
    nop
    add $c1
    jr nz, jr_000_0f85

jr_000_0f85::
    jr nz, jr_000_0fa7

jr_000_0f87::
    jr nz, jr_000_0fa9

    jr nz, jr_000_0fab

    jr nz, jr_000_0fad

    jr nz, jr_000_0faf

    jr nz, jr_000_0f91

jr_000_0f91::
    jr nz, jr_000_0fb3

    jr nz, jr_000_0fb5

    jr nz, jr_000_0fb7

    jr nz, jr_000_0fb9

    jr nz, @+$22

    jr nz, jr_000_0f9d

jr_000_0f9d::
    jr nz, jr_000_0fbf

    jr nz, jr_000_0fc1

    jr nz, jr_000_0fc3

    jr nz, jr_000_0fc5

    jr nz, @+$22

jr_000_0fa7::
    jr nz, jr_000_0fa9

jr_000_0fa9::
    jr nz, jr_000_0fcb

jr_000_0fab::
    jr nz, jr_000_0fcd

jr_000_0fad::
    jr nz, jr_000_0fcf

jr_000_0faf::
    jr nz, jr_000_0fd1

    jr nz, @+$22

jr_000_0fb3::
    jr nz, jr_000_0fb5

jr_000_0fb5::
    sub $b3

jr_000_0fb7::
    pop bc
    or h

jr_000_0fb9::
    db $dd
    jr nz, @-$36

    db $dd
    cp h
    xor [hl]

jr_000_0fbf::
    or e
    nop

jr_000_0fc1::
    sub $b3

jr_000_0fc3::
    pop bc
    or h

jr_000_0fc5::
    db $dd
    jr nz, @-$36

    db $dd
    pop bc
    xor l

jr_000_0fcb::
    or e
    nop

jr_000_0fcd::
    sub $b3

jr_000_0fcf::
    pop bc
    or h

jr_000_0fd1::
    db $dd
    jr nz, @-$36

    db $dd
    pop bc
    xor [hl]
    or e
    nop
    cp h
    xor [hl]
    or e
    or [hl]
    sbc $b8
    ld sp, $ddc8
    cp [hl]
    or d
    nop
    cp h
    xor [hl]
    or e
    or [hl]
    sbc $b8
    ld [hl-], a
    ret z

    db $dd
    cp [hl]
    or d
    nop
    cp h
    xor [hl]
    or e
    or [hl]
    sbc $b8
    inc sp
    ret z

    db $dd
    cp [hl]
    or d
    nop
    cp h
    xor [hl]
    or e
    or [hl]
    sbc $b8
    inc [hl]
    ret z

    db $dd
    cp [hl]
    or d
    nop
    cp h
    xor [hl]
    or e
    or [hl]
    sbc $b8
    dec [hl]
    ret z

    db $dd
    cp [hl]
    or d
    nop
    cp h
    xor [hl]
    or e
    or [hl]
    sbc $b8
    ld [hl], $c8
    db $dd
    cp [hl]
    or d
    nop
    pop bc
    xor l
    or e
    or [hl]
    sbc $b8
    ld sp, $ddc8
    cp [hl]
    or d
    nop
    pop bc
    xor l
    or e
    or [hl]
    sbc $b8
    ld [hl-], a
    ret z

    db $dd
    cp [hl]
    or d
    nop
    pop bc
    xor l
    or e
    or [hl]
    sbc $b8
    inc sp
    ret z

    db $dd
    cp [hl]
    or d
    nop
    cp d
    or e
    cp d
    or e
    ld sp, $ddc8
    cp [hl]
    or d
    jr nz, @+$22

    nop
    cp d
    or e
    cp d
    or e
    ld [hl-], a
    ret z

    db $dd
    cp [hl]
    or d
    jr nz, jr_000_107c

    nop
    cp d
    or e
    cp d
    or e
    inc sp
    ret z

    db $dd
    cp [hl]
    or d
    jr nz, jr_000_1088

    nop
    jr nz, jr_000_108b

    jr nz, jr_000_108d

    jr nz, @+$22

    jr nz, jr_000_1091

    jr nz, @+$22

    jr nz, jr_000_1075

jr_000_1075::
    ld a, [$c61c]
    ld e, a
    ld a, [$c61d]

jr_000_107c::
    ld d, a
    ld a, [$c61e]
    ld b, a
    ld a, [$c61f]
    ld c, a
    pushx @+$0006

jr_000_1088::
    pushx @+$f0d2

jr_000_108b:
    ret


    ld a, e

jr_000_108d::
    ld [$c625], a
    ld a, d

jr_000_1091::
    ld [$c626], a
    ret


    ld a, [$c618]
    ld e, a
    ld a, [$c619]
    ld d, a
    ld a, [$c61a]
    ld b, a
    ld a, [$c61b]
    ld c, a
    callx @+$f0b2
    ld a, e
    ld [$c627], a
    ld a, d
    ld [$c628], a
    ret


    ld a, [$b2bb]
    ld e, a
    ld a, [$b2bc]
    ld d, a
    ld a, [$b2bd]
    ld b, a
    ld a, [$b2be]
    ld c, a
    callx @+$f092
    ld a, e
    ld [$c629], a
    ld a, d
    ld [$c62a], a
    ret


    ldh a, [$8b]
    bit 5, a
    jr z, jr_000_1136

    ld a, [$c61f]
    cp $01
    jr z, jr_000_10e8

    ld a, $01
    ld [$c61f], a
    ret


jr_000_10e8::
    ld a, [$c61a]
    ld b, a
    inc b
    ld a, [$c61e]
    cp b
    jr z, jr_000_1118

    cp $01
    jr nz, jr_000_110e

    ld a, [$c61c]
    ld e, a
    ld a, [$c61d]
    ld d, a
    ld hl, $0001
    trap $88
    ld a, l
    ld [$c61c], a
    ld a, h
    ld [$c61d], a
    ld a, $0d

jr_000_110e::
    dec a
    ld [$c61e], a
    ld a, $0f
    ld [$c61f], a
    ret


jr_000_1118::
    ld a, [$c618]
    ld e, a
    ld a, [$c619]
    ld d, a
    ld a, [$c61c]
    ld l, a
    ld a, [$c61d]
    ld h, a
    ld c, $08
    trap $84
    ld a, l
    cp $00
    jr nz, jr_000_1136

    ld a, [$c61e]
    jr jr_000_110e

jr_000_1136::
    ldh a, [$8b]
    bit 4, a
    jr z, jr_000_118e

    ld a, [$c61f]
    cp $0f
    jr z, jr_000_1149

    ld a, $0f
    ld [$c61f], a
    ret


jr_000_1149::
    ld a, [$c61a]
    ld b, a
    dec b
    ld a, [$c61e]
    cp b
    ld de, $07ea
    ld a, [$c61c]
    ld l, a
    ld a, [$c61d]
    ld h, a
    ld c, $08
    trap $84
    ld a, l
    cp $00
    jr nz, jr_000_118e

    ld a, [$c61e]
    cp $0c
    jr nz, jr_000_1184

    ld a, [$c61c]
    ld e, a
    ld a, [$c61d]
    ld d, a
    ld hl, $0001
    trap $87
    ld a, l
    ld [$c61c], a
    ld a, h
    ld [$c61d], a
    ld a, $00

jr_000_1184::
    inc a
    ld [$c61e], a
    ld a, $01
    ld [$c61f], a
    ret


jr_000_118e::
    ld a, $00
    ret


    callx @+$f0c9
    ldx hl, @+$0093
    ld de, jr_000_0106
    trap DrawStringList
    ld hl, $0709
    trap MoveCursor
    ld a, [$c62b]
    ld c, a
    ld b, $00
    ld hl, $c62c

jr_000_11af::
    ld a, [hl+]
    push hl
    push bc
    ld hl, $c600
    ld d, $00
    ld e, a
    trap IntToString
    ld hl, $c604
    trap DrawString
    pop bc
    pop hl
    callx @+$f0a8
    inc b
    ld a, b
    cp c
    jr nz, jr_000_11af

    ld hl, $070a
    trap MoveCursor
    ld a, [$c630]
    ld c, a
    ld b, $00
    ld hl, $c631

jr_000_11db::
    ld a, [hl+]
    push hl
    push bc
    ld hl, $c600
    ld d, $00
    ld e, a
    trap IntToString
    ld hl, $c604
    trap DrawString
    pop bc
    pop hl
    callx @+$f07c
    inc b
    ld a, b
    cp c
    jr nz, jr_000_11db

    ld hl, $070b
    trap MoveCursor
    ld a, [$c635]
    ld c, a
    ld b, $00
    ld hl, $c636

jr_000_1207::
    ld a, [hl+]
    push hl
    push bc
    ld hl, $c600
    ld d, $00
    ld e, a
    trap IntToString
    ld hl, $c604
    trap DrawString
    pop bc
    pop hl
    callx @+$f050
    inc b
    ld a, b
    cp c
    jr nz, jr_000_1207

jr_000_1225::
    ldh a, [$8b]
    and $ff
    jr z, jr_000_1225

    ret


    dec hl
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
    dec hl
    nop
    ld a, h
    jr nz, jr_000_1263

    jr nz, jr_000_1264

    sub $b3
    pop bc
    xor l
    or e
    or d
    ret


    sla b
    jr nz, jr_000_1270

    jr nz, jr_000_12cd

    nop
    ld a, h
    jr nz, @+$22

    jr nz, jr_000_1277

    jr nz, jr_000_1279

    jr nz, jr_000_127b

    jr nz, jr_000_127d

    jr nz, jr_000_127f

    jr nz, jr_000_1281

    jr nz, jr_000_1283

jr_000_1263::
    ld a, h

jr_000_1264::
    nop
    ld a, h
    jr nz, jr_000_12b8

    jr nz, jr_000_12a4

    jr nz, jr_000_128c

    jr nz, jr_000_128e

    jr nz, jr_000_1290

jr_000_1270::
    jr nz, jr_000_1292

    jr nz, jr_000_1294

    jr nz, jr_000_1296

    ld a, h

jr_000_1277::
    nop
    ld a, h

jr_000_1279::
    jr nz, jr_000_12ce

jr_000_127b::
    jr nz, jr_000_12b7

jr_000_127d::
    jr nz, jr_000_129f

jr_000_127f::
    jr nz, jr_000_12a1

jr_000_1281::
    jr nz, jr_000_12a3

jr_000_1283::
    jr nz, jr_000_12a5

    jr nz, jr_000_12a7

    jr nz, jr_000_12a9

    ld a, h
    nop
    ld a, h

jr_000_128c::
    jr nz, jr_000_12d7

jr_000_128e::
    jr nz, jr_000_12ca

jr_000_1290::
    jr nz, jr_000_12b2

jr_000_1292::
    jr nz, jr_000_12b4

jr_000_1294::
    jr nz, jr_000_12b6

jr_000_1296::
    jr nz, jr_000_12b8

    jr nz, jr_000_12ba

    jr nz, jr_000_12bc

    ld a, h
    nop
    dec hl

jr_000_129f::
    dec l
    dec l

jr_000_12a1::
    dec l
    dec l

jr_000_12a3::
    dec l

jr_000_12a4::
    dec l

jr_000_12a5::
    dec l
    dec l

jr_000_12a7::
    dec l
    dec l

jr_000_12a9::
    dec l
    dec l
    dec l
    dec l
    dec l
    dec l
    dec hl
    nop
    nop

jr_000_12b2::
    nop
    nop

jr_000_12b4::
    nop
    nop

jr_000_12b6::
    nop

jr_000_12b7::
    nop

jr_000_12b8::
    nop
    nop

jr_000_12ba::
    nop
    nop

jr_000_12bc::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_12ca::
    nop
    nop
    nop

jr_000_12cd::
    nop

jr_000_12ce::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_12d7::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
