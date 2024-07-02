; Disassembly of "biorhythm.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_A008 | FILE_2BPP | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $00           ; owner code
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
    ldx de, data_00c6
    ldx hl, data_12b8
    ld bc, $0040
    trap MemCopy
    ldx de, data_0106
    ldx hl, data_12f8
    ld bc, $0020
    trap MemCopy
    ret


data_00c6:
    dk "USER A \n"
    dk "USER B \n"
    dk "USER C \n"
    dk "USER D \n"
    dk "USER E \n"
    dk "USER F \n"
    dk "USER G \n"
    dk "USER H \n"


data_0106:
    db $c6, $07, $04, $01
    db $b6, $07, $04, $01
    db $b6, $07, $04, $01
    db $b6, $07, $04, $01
    db $b6, $07, $04, $01
    db $b6, $07, $04, $01
    db $b6, $07, $04, $01
    db $b6, $07, $04, $01


call_0126:
    ld hl, $0003
    trap $82
    ld a, l
    ret


call_012d:
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
    ldx hl, data_01b0
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


data_01b0:
    db $00, $00
    db $1f, $00
    db $3b, $00
    db $5a, $00
    db $78, $00
    db $97, $00
    db $b5, $00
    db $d4, $00
    db $f3, $00


call_01c2:
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
    ldx hl, data_01fd
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


data_01fd:
    db $00
    db $1f, $1c
    db $1f, $1e
    db $1f, $1e
    db $1f, $1f
    db $1e, $1f
    db $1e, $1f


call_020a:
    ld d, b
    ld e, c
    ld bc, $0000
    ldx hl, data_022e

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


data_022e:
    db $01, $13
    db $02, $12
    db $03, $14
    db $04, $13
    db $05, $14
    db $06, $15
    db $07, $16
    db $08, $16
    db $09, $16
    db $0a, $17
    db $0b, $17
    db $0c, $15


call_0246:
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
    trap MovePen
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
    trap MovePen
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

    dh "　　"

    jr nz, jr_000_03b1

    nop
    jr nz, jr_000_03b4

    nop
    trap MovePen
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


    trap MovePen
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


    trap MovePen
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


    trap MovePen
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


call_0507:
    ldx hl, data_0511
    ld de, $0307
    trap DrawStringList
    ret


data_0511:
    dk "B I O --------\n"
    dk "              \n"
    dk "---- R Y T H M\n"
    db $00


call_053f:
    callx @+$fd16
    callx @+$fd14
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

    ldx hl, data_0614
    ld de, jr_000_0306
    trap DrawStringList
    ret


data_0614:
    dh "なまえ　：　　　　　　　さん\n"
    dh "－－－－－－－－－－－－－－\n"
    dh "　　　　　　　　　　　　　　\n"
    dh "たんじょうび：　　　　　　　\n"
    dh "　　　　ねん　　がつ　　にち\n"
    dh "－－－－－－－－－－－－－－\n"
    db $00


call_0672:
    ld a, [$b2bf]
    sla a
    sla a
    sla a
    ld b, $00
    ld c, a
    ldx hl, data_12b8
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
    ldx hl, data_12f8
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
    ldx hl, data_12b8
    add hl, bc
    ld de, $c610
    ld bc, $0008
    trap MemCopy
    ld a, [$b2bf]
    sla a
    sla a
    ld b, $00
    ld c, a
    ldx hl, data_12f8
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


    ldx hl, data_077e
    ld de, $0307
    trap DrawStringList
    ret


data_077e:
    dh "しんだんするひづけ：　　　　\n"
    dh "　　　　ねん　　がつ　　にち\n"
    dh "－－－－－－－－－－－－－－\n"
    db $00


code_07af:
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


call_08a7:
    ldx hl, data_0950
    ld de, $0003
    trap DrawStringList
    ld hl, $0001
    trap MovePen
    callx @+$f9a5
    ldx hl, data_097e
    trap DrawString
    callx @+$f99d
    ldx hl, data_098c
    trap DrawString
    ld hl, $0201
    trap MovePen
    ld a, [$c61c]
    ld e, a
    ld a, [$c61d]
    ld d, a
    ld hl, $c600
    trap IntToString
    ld hl, $c602
    trap DrawString
    ld hl, $0801
    trap MovePen
    ld a, [$c61e]
    ld e, a
    ld d, $00
    ld hl, $c600
    trap IntToString
    ld hl, $c604
    trap DrawString
    ld hl, $0110
    trap MovePen
    ld a, [$c61f]
    cp $0f
    jr z, jr_000_090f

    ldx hl, data_0997
    trap DrawString
    jr jr_000_0920

jr_000_090f::
    ld a, [$c61e]
    cp $02
    ldx hl, data_09ab
    jr nz, jr_000_091e

    ldx hl, data_09bf

jr_000_091e::
    trap DrawString

jr_000_0920::
    ld hl, $0111
    trap MovePen
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
    ldx hl, data_09d3
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


data_0950:
    dh "＋\n"
    dh "｜\n"
    dh "｜\n"
    dh "｜\n"
    dh "｜\n"
    dh "｜\n"
    dh "０－－－－－－－－－－－－－－－－－－－\n"
    dh "｜\n"
    dh "｜\n"
    dh "｜\n"
    dh "｜\n"
    dh "｜\n"
    dh "－\n"
    db $00

data_097e:
    dh "＊　　　　　ねん　　がつ\n"

data_098c:
    dk "バイオリズム　＊\n"

data_0997:
    dh "１．．．５．．．．１０．．．１５．．．\n"

data_09ab:
    dh "１５．．．２０．．．２５．．．３０．．\n"

data_09bf:
    dh "１５．．．２０．．．２５．２８．．．．\n"

data_09d3:
    dh "　　　　　　＾　　　　　　＾　　　　　　＾　　　　　　＾"


call_09ef:
    ld a, [$c625]
    ld l, a
    ld a, [$c626]
    ld h, a
    ld a, [$c629]
    ld e, a
    ld a, [$c62a]
    ld d, a
    trap $88
    push hl
    ld de, $0000
    ld c, $04
    trap $84
    ld a, l
    pop hl
    cp $00
    ret z
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
    trap MovePen
    ld a, $3a
    trap DrawChar
    ld l, $0f
    trap MovePen
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
    ldx hl, data_0a94
    add hl, bc
    ld a, [hl]
    pop hl
    add $09
    ld l, a
    trap MovePen
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


data_0a94:
    db $00, $ff, $fd, $fc, $fb, $fb, $fb, $fb, $fc, $fd, $ff
    db $00, $01, $03, $04, $05, $05, $05, $05, $04, $03, $01
    db $00


call_0aab:
    ld hl, $001c
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
    ldx hl, data_0b11
    add hl, bc
    ld a, [hl]
    pop hl
    add $09
    ld l, a
    trap MovePen
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


data_0b11:
    db $00, $ff, $fe, $fd, $fc, $fb, $fb, $fb, $fb, $fb, $fc, $fd, $fe
    db $00, $00, $02, $03, $04, $05, $05, $05, $05, $05, $04, $03, $02


call_0b2b:
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
    ldx hl, data_0b93
    add hl, bc
    ld a, [hl]
    pop hl
    add $09
    ld l, a
    trap MovePen
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


data_0b93:
    db $00, $ff, $fe, $fd, $fc, $fc, $fb, $fb, $fb, $fb, $fb, $fc, $fc, $fd, $fe, $ff
    db $00, $01, $02, $03, $04, $04, $05, $05, $05, $05, $05, $04, $04, $03, $02, $01
    db $00


call_0bb4:
    ld a, [$c625]
    ld e, a
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


call_0bef:
    callx @+$f66b
    ldx hl, data_0c06
    ld de, $0101
    trap DrawStringList

jr_000_0bff::
    ldh a, [$8b]
    and $ff
    jr z, jr_000_0bff

    ret


data_0c06:
    dh "＋－－－－－－－－－－－－－－－－＋\n"
    dh "｜（Ｐ）しんたいりずむ　　　　　　｜\n"
    dh "｜　　　＋　たいりょくこうちょう　｜\n"
    dh "｜　　　０　たいちょうふあんてい　｜\n"
    dh "｜　　　－　たいりょくていちょう　｜\n"
    dh "｜　　　　　　　　　　　　　　　　｜\n"
    dh "｜（Ｓ）かんじょうりずむ　　　　　｜\n"
    dh "｜　　　＋　きりょくじゅうじつ　　｜\n"
    dh "｜　　　０　じょうちょふあんてい　｜\n"
    dh "｜　　　－　きりょくちんたい　　　｜\n"
    dh "｜　　　　　　　　　　　　　　　　｜\n"
    dh "｜（Ｉ）ちせいりずむ　　　　　　　｜\n"
    dh "｜　　　＋　ちりょくかつどう　　　｜\n"
    dh "｜　　　０　ちりょくふあんてい　　｜\n"
    dh "｜　　　－　ちてきげんすい　　　　｜\n"
    dh "＋－－－－－－－－－－－－－－－－＋\n"
    db $00


call_0d40:
    callx @+$f51a
    pushx @+$0112

jr_000_0d4a:
    pop hl
    ld de, $0105
    trap DrawStringList
    ld hl, jr_000_0306
    trap MovePen
    ld hl, $c610
    trap DrawString
    ld hl, $0d06
    trap MovePen
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
    ldx hl, $6304
    trap MovePen
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
    ldx hl, data_0f85
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
    trap MovePen
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
    ldx hl, data_0f69
    add hl, bc
    trap DrawString
    ld hl, $0a09
    trap MovePen
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
    ldx hl, data_0f09
    add hl, bc
    trap DrawString
    ld hl, $090b
    trap MovePen
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


data_0e5a:
    dh "＋－－－－－－－－－－－－－－－－＋\n"
    dh "｜　　　　　　　　　　　　　さい　｜\n"
    dh "｜　　　　　　　　　　　　　　　　｜\n"
    dh "｜　　　　　ねん　　がつ　　にち　｜｜\n"
    dh "｜　　　　ようび　　　　　　　　　｜\n"
    dh "｜　　　　　　　　　　　　　　　　｜\n"
    dh "｜　うまれてから　　　　　にちめ　｜\n"
    dh "｜　　　　　　　　　　　　　　　　｜\n"
    db "＋－－－－－－－－－－－－－－－－＋\n"
    db $00

data_0f09:
    dh "やぎざ　　\n"
    dh "みずがめ　\n"
    dh "うおざ　　　\n"
    dh "おひつじざ\n"
    dh "おうしざ　　\n"
    dh "ふたござ　\n"
    dh "かにざ　　　\n"
    dh "ししざ　　　\n"
    dh "おとめざ　　\n"
    dh "てんびんざ\n"
    dh "さそりざ　　\n"
    dh "いてざ　　　\n"

data_0f69:
    dh "げつ\n"
    dh "か　　\n"
    dh "すい　\n"
    dh "もく　\n"
    dh "きん　\n"
    dh "ど　\n"
    dh "にち　\n"

data_0f85:
    dh "　　　　　　　　　　　\n"
    dh "　　　　　　　　　　　\n"
    dh "　　　　　　　　　　　\n"
    dh "　　　　　　　　　　　\n"
    dh "ようちえん　ねんしょう\n"
    dh "ようちえん　ねんちゅう\n"
    dh "ようちえん　ねんちょう\n"
    dh "しょうがく１ねんせい\n"
    dh "しょうがく２ねんせい\n"
    dh "しょうがく３ねんせい\n"
    dh "しょうがく４ねんせい\n"
    dh "しょうがく５ねんせい\n"
    dh "しょうがく６ねんせい\n"
    dh "ちゅうがく１ねんせい\n"
    dh "ちゅうがく２ねんせい\n"
    dh "ちゅうがく３ねんせい\n"
    dh "こうこう１ねんせい　　\n"
    dh "こうこう２ねんせい　　\n"
    dh "こうこう３ねんせい　　\n"
    dh "　　　　　　　　　　　\n"

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


call_1191:
    callx @+$f0c9
    ldx hl, data_122c
    ld de, $0106
    trap DrawStringList
    ld hl, $0709
    trap MovePen
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
    trap MovePen
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
    trap MovePen
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


data_122c:
    dk "＋－－－－－－－－－－－－－－－－＋\n"
    dh "｜　！　　ようちゅういのひ　　！　｜\n"
    dk "｜　　　　　　　　　　　　　　　　｜\n"
    dk "｜　Ｐ　：　　　　　　　　　　　　｜\n"
    dk "｜　Ｓ　：　　　　　　　　　　　　｜\n"
    dk "｜　Ｉ　：　　　　　　　　　　　　｜\n"
    dk "＋－－－－－－－－－－－－－－－－＋\n"
    db $00

    ds 6

data_12b8:
    ds 64
data_12f8:
    ds 32
