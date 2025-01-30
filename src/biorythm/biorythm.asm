; Disassembly of "biorhythm.gbf"

INCLUDE "src/charmap.inc"
INCLUDE "src/common.inc"
INCLUDE "src/hardware.inc"
INCLUDE "src/macro.inc"
INCLUDE "src/trap.inc"

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

    callx call_008b

jr_000_0057::
    callx call_04f2
    and $06

jr_000_0060:
    jr nz, jr_000_0085

    callx call_053f
    bit 2, a
    jr nz, jr_000_0085

    callx call_06f4
    bit 2, a
    jr nz, jr_000_0085

    callx call_07f1
    bit 2, a
    jr nz, jr_000_0085

    jr jr_000_0057

jr_000_0085::
    xor a
    ld [$0000], a
    trap ExitToMenu


call_008b:
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
    dk "USER A \0"
    dk "USER B \0"
    dk "USER C \0"
    dk "USER D \0"
    dk "USER E \0"
    dk "USER F \0"
    dk "USER G \0"
    dk "USER H \0"


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
    trap MathAnd16
    ld a, l
    ret


call_012d:
    push de
    ld hl, 400
    trap MathDiv16
    ld a, [$c3b0]
    pop de
    cp $00
    ld a, $00
    ret z

    push de
    ld hl, 100
    trap MathDiv16
    ld a, [$c3b0]
    pop de
    cp $00
    ld a, $00
    ret z

    ld hl, 4
    trap MathDiv16
    ld a, [$c3b0]
    cp $00
    ld a, $00
    ret z

    ld a, $01
    ret


call_015b:
    push de
    push bc
    ld hl, 1940
    trap MathSub16
    push hl
    ld de, 365
    trap MathMul16
    pop de
    push hl
    ld hl, 4
    trap MathDiv16
    ld de, 1
    trap MathAdd16
    pop de
    trap MathAdd16
    pop bc
    push bc
    ld a, b
    dec a
    sla a
    ld c, a
    ld b, $00
    push hl
    ldx hl, Months
    add hl, bc
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    pop hl
    trap MathAdd16
    pop bc
    ld e, c
    ld d, $00
    trap MathAdd16
    pop de
    ld a, b
    cp $03
    jr nc, jr_000_01ad

    push hl
    callx call_0126
    pop hl
    cp $00
    jr nz, jr_000_01ad

    ld d, h
    ld e, l
    ld hl, $0001
    trap MathSub16

jr_000_01ad::
    ld d, h
    ld e, l
    ret


Months:
    dw 0    ; Jan 01
    dw 31   ; Feb 01
    dw 59   ; Mar 01
    dw 90   ; Apr 01
    dw 120  ; May 01
    dw 151  ; Jun 01
    dw 181  ; Jul 01
    dw 212  ; Aug 01
    dw 243  ; Sep 01
    dw 273  ; Oct 01
    dw 304  ; Nov 01
    dw 334  ; Dec 01

call_01c8:
    callx call_015b
    ld hl, $0001
    trap MathSub16
    ld d, h
    ld e, l
    ld hl, 7
    trap MathDiv16
    ld a, [$c3b0]
    ret


call_01df:
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
    callx call_0126
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
    ldx hl, ZodiacEndDates

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
    trap MathCmp16
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


ZodiacEndDates:
    db 1, 19   ; Capricorn
    db 2, 18   ; Aquarius
    db 3, 20   ; Pisces
    db 4, 19   ; Aries
    db 5, 20   ; Taurus
    db 6, 21   ; Gemini
    db 7, 22   ; Cancer
    db 8, 22   ; Leo
    db 9, 22   ; Virgo
    db 10, 23  ; Libra
    db 11, 23  ; Scorpius
    db 12, 21  ; Sagittarius


call_0246:
    push bc
    callx call_01df
    ld e, c
    pop bc
    ld a, e
    cp c
    ld a, $00
    ret nc

    ld c, e
    ld a, $01
    ret


call_0259:
    ld a, $0c
    trap DrawCtrlChar
    ret


call_025e:
    ld a, $0f
    trap DrawCtrlChar
    ret


call_0263:
    ld a, $0e
    trap DrawCtrlChar
    ret


call_0268:
    ld a, $02
    trap DrawCtrlChar
    ret


call_026d:
    ld a, $01
    trap DrawCtrlChar
    ret


call_0272:
    push hl
    push de
    callx call_02fd
    pop de
    ld l, e
    ld a, d
    add b
    ld h, a
    trap DrawAt
    pop hl
    push bc
    ld c, b
    ld b, $00
    add hl, bc
    pop bc
    dec c

jr_000_028a::
    trap AwaitFrame
    ldh a, [$ffb6]
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
    ldh a, [$ffb6]
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
    callx call_0268
    ldh a, [$ffb6]
    bit 5, a
    jr z, jr_000_02d3

    ld a, b
    cp $00
    ret z

    dec b
    dec hl
    callx call_0268

jr_000_02d3::
    ldh a, [$ffb6]
    bit 4, a
    jr z, jr_000_02e5

    ld a, b
    cp c
    ret z

    inc b
    inc hl
    callx call_026d

jr_000_02e5::
    ldh a, [$ff8b]
    and $07
    ret nz

    ldh a, [$ff83]
    and $08
    jr nz, jr_000_028a

    ld a, $00
    trap DrawChar
    callx call_0268
    jr jr_000_028a


call_02fd::
    push hl
    ld h, d
    ld l, e
    trap DrawAt
    pop hl
    trap DrawString
    ret


call_0306::
    push hl
    push de
    push bc
    callx call_0395
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

    callx call_03de

jr_000_032a::
    ld a, [$c620]
    cp $01
    jr nz, jr_000_0338

    callx call_044b

jr_000_0338::
    ld a, [$c620]
    cp $02
    jr nz, jr_000_0346

    callx call_0499

jr_000_0346:
    pop hl
    ldh a, [$ffb6]
    bit 5, a
    jr z, jr_000_0359

    ld a, [$c620]
    cp $00
    ret z

    dec a
    ld [$c620], a
    jr call_0306

jr_000_0359::
    ldh a, [$ffb6]
    bit 4, a
    jr z, jr_000_036b

    ld a, [$c620]
    cp $02
    ret z

    inc a
    ld [$c620], a
    jr call_0306

jr_000_036b::
    ldh a, [$ff8b]
    and $07
    ret nz

    ldh a, [$ff83]
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


data_038d:
    dh "　　  \0"
    dh "  \0"


call_0395:
    trap DrawAt
    ld hl, $c600
    push bc
    trap StrConvInt
    pop bc
    ld hl, $c602
    trap DrawString
    callx call_026d
    callx call_026d
    ld hl, $c600
    ld d, $00
    ld e, b
    push bc
    trap StrConvInt
    pop bc
    ld hl, $c604
    trap DrawString
    callx call_026d
    callx call_026d
    ld hl, $c600
    ld d, $00
    ld e, c
    push bc
    trap StrConvInt
    pop bc
    ld hl, $c604
    trap DrawString
    ret


call_03de:
    push bc
    callx call_03e8
    pop bc
    ret


call_03e8:
    trap DrawAt
    ldh a, [$ffb6]
    bit 6, a
    jr z, jr_000_0406

    ld hl, 2025
    ld c, $08
    trap MathCmp16
    ld a, l
    cp $00
    jr z, jr_000_03ff

    ld de, 1939

jr_000_03ff::
    ld hl, 1
    trap MathAdd16
    ld d, h
    ld e, l

jr_000_0406::
    ldh a, [$ffb6]
    bit 7, a
    jr z, jr_000_0422

    ld hl, 1940
    ld c, $08
    trap MathCmp16
    ld a, l
    cp $00
    jr z, jr_000_041b

    ld de, 2026

jr_000_041b::
    ld hl, 1
    trap MathSub16
    ld d, h
    ld e, l

jr_000_0422::
    ld hl, $c600
    push de
    trap StrConvInt
    ld hl, $c602
    trap DrawString
    pop de
    callx call_0268
    callx call_0268
    callx call_0268
    callx call_0268
    ret


call_044b:
    ld a, h
    add $06
    ld h, a
    push de
    push bc
    callx call_045d
    ld a, b
    pop bc
    ld b, a
    pop de
    ret


call_045d:
    trap DrawAt
    ldh a, [$ffb6]
    bit 6, a
    jr z, jr_000_046d

    ld a, b
    cp $0c
    jr nz, jr_000_046c

    ld b, $00

jr_000_046c::
    inc b

jr_000_046d::
    ldh a, [$ffb6]
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
    trap StrConvInt
    ld hl, $c604
    trap DrawString
    pop bc
    callx call_0268
    callx call_0268
    ret


call_0499:
    ld a, h
    add $0a
    ld h, a
    push de
    push bc
    callx call_04ab
    ld a, c
    pop bc
    ld c, a
    pop de
    ret


call_04ab:
    trap DrawAt
    push bc
    callx call_01df
    ld a, c
    pop bc
    ld b, a
    ldh a, [$ffb6]
    bit 6, a
    jr z, jr_000_04c5

    ld a, c
    cp b
    jr nz, jr_000_04c4

    ld c, $00

jr_000_04c4::
    inc c

jr_000_04c5::
    ldh a, [$ffb6]
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
    trap StrConvInt
    ld hl, $c604
    trap DrawString
    pop bc
    callx call_0268
    callx call_0268
    ret


call_04f2:
    callx call_0259
    callx call_0507

jr_000_0500::
    ldh a, [$ff8b]
    and $07
    jr z, jr_000_0500

    ret


call_0507:
    ldx hl, data_0511
    ld de, $0307
    trap DrawStringList
    ret


data_0511:
    dk "B I O --------\0"
    dk "              \0"
    dk "---- R Y T H M\0"
    db $00


call_053f:
    callx call_0259
    callx call_025e
    callx call_060a

jx_0554:
    trap AwaitFrame
    callx call_0672

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
    callx call_05c0
    ld a, b
    cp $00
    ld a, $02
    jr z, jr_000_057f

    ld a, $00

jr_000_057f::
    ld [$c620], a
    ldh a, [$ff8a]
    and $07
    jr nz, jr_000_05a3

jr_000_0588::
    callx call_05d0
    ld a, [$c620]
    cp $00
    ld a, $02
    jr z, jr_000_059a

    ld a, $00

jr_000_059a::
    ld [$c620], a
    ldh a, [$ff8a]
    and $07
    jr z, jr_000_0564

jr_000_05a3::
    callx call_06ad
    ldh a, [$ff8b]
    and $05
    ret nz

    ldh a, [$ff8b]
    bit 1, a
    jr z, jr_000_0564

    callx call_06e6
    jx jx_0554


call_05c0:
    ld hl, $c610
    ld de, $0806
    ld c, $07
    callx call_0272
    ret


call_05d0::
    ld a, [$c618]
    ld e, a
    ld a, [$c619]
    ld d, a
    ld a, [$c61a]
    ld b, a
    ld a, [$c61b]
    ld c, a
    ld hl, $030a
    callx call_0306
    ld a, e
    ld [$c618], a
    ld a, d
    ld [$c619], a
    ld a, b
    ld [$c61a], a
    ld a, c
    ld [$c61b], a
    callx call_0246
    cp $00
    ret z

    ld a, c
    ld [$c61b], a
    jr call_05d0


call_060a:
    ldx hl, data_0614
    ld de, $0306
    trap DrawStringList
    ret


data_0614:
    dh "なまえ　：　　　　　　　さん\0"
    dh "－－－－－－－－－－－－－－\0"
    dh "　　　　　　　　　　　　　　\0"
    dh "たんじょうび：　　　　　　　\0"
    dh "　　　　ねん　　がつ　　にち\0"
    dh "－－－－－－－－－－－－－－\0"
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


call_06ad:
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


call_06e6:
    ld a, [$b2bf]
    inc a
    cp $08
    jr nz, jr_000_06f0

    ld a, $00

jr_000_06f0::
    ld [$b2bf], a
    ret


call_06f4::
    callx call_0259
    callx call_025e
    callx call_0774
    ld a, $ff
    ld [$c620], a

jr_000_070e::
    callx call_0739
    ld a, [$c620]
    cp $00
    ld a, $02
    jr z, jr_000_0720

    ld a, $00

jr_000_0720::
    ld [$c620], a
    ldh a, [$ff8b]
    and $07
    jr z, jr_000_070e

    ld b, a
    push bc
    callx call_07af
    pop bc
    cp $00
    jr nz, call_06f4

    ld a, b
    ret


call_0739::
    ld a, [$b2bb]
    ld e, a
    ld a, [$b2bc]
    ld d, a
    ld a, [$b2bd]
    ld b, a
    ld a, [$b2be]
    ld c, a
    ld hl, $0308
    callx call_0306
    ld a, e
    ld [$b2bb], a
    ld a, d
    ld [$b2bc], a
    ld a, b
    ld [$b2bd], a
    ld a, c
    ld [$b2be], a
    callx call_0246
    cp $00
    ret z

    ld a, c
    ld [$b2be], a
    jr call_0739

    ret


call_0774:
    ldx hl, data_077e
    ld de, $0307
    trap DrawStringList
    ret


data_077e:
    dh "しんだんするひづけ：　　　　\0"
    dh "　　　　ねん　　がつ　　にち\0"
    dh "－－－－－－－－－－－－－－\0"
    db $00


call_07af:
    ld a, [$b2bb]
    ld e, a
    ld a, [$b2bc]
    ld d, a
    ld a, [$c618]
    ld l, a
    ld a, [$c619]
    ld h, a
    ld c, $06
    trap MathCmp16
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
    trap MathCmp16
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


call_07f1:
    callx call_0886
    callx call_1095
    callx call_10b5

jr_000_0806:
    callx call_1075
    callx call_0bcf
    callx call_0bb4
    callx call_0259
    callx call_08a7
    callx call_0a2e
    callx call_0aab
    callx call_0b2d
    callx call_09ef

jr_000_0845:
    trap AwaitFrame
    callx call_10d5
    cp $00
    jr nz, jr_000_0806

    ldh a, [$ff8b]
    bit 6, a
    jr z, jr_000_0861

    callx call_0d40
    jr jr_000_0806

jr_000_0861::
    ldh a, [$ff8b]
    bit 7, a
    jr z, jr_000_0870

    callx call_1191
    jr jr_000_0806

jr_000_0870::
    ldh a, [$ff8b]
    bit 1, a
    jr z, jr_000_087f

    callx call_0bef
    jr jr_000_0806

jr_000_087f::
    ldh a, [$ff8b]
    and $05
    jr z, jr_000_0845

    ret


call_0886:
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
    trap DrawAt
    callx call_025e
    ldx hl, data_097e
    trap DrawString
    callx call_0263
    ldx hl, data_098c
    trap DrawString
    ld hl, $0201
    trap DrawAt
    ld a, [$c61c]
    ld e, a
    ld a, [$c61d]
    ld d, a
    ld hl, $c600
    trap StrConvInt
    ld hl, $c602
    trap DrawString
    ld hl, $0801
    trap DrawAt
    ld a, [$c61e]
    ld e, a
    ld d, $00
    ld hl, $c600
    trap StrConvInt
    ld hl, $c604
    trap DrawString
    ld hl, $0110
    trap DrawAt
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
    trap DrawAt
    ld a, [$c61c]
    ld e, a
    ld a, [$c61d]
    ld d, a
    ld a, [$c61e]
    ld b, a
    ld a, [$c61f]
    ld c, a
    callx call_01c8
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
    dh "＋\0"
    dh "｜\0"
    dh "｜\0"
    dh "｜\0"
    dh "｜\0"
    dh "｜\0"
    dh "０－－－－－－－－－－－－－－－－－－－\0"
    dh "｜\0"
    dh "｜\0"
    dh "｜\0"
    dh "｜\0"
    dh "｜\0"
    dh "－\0"
    db $00

data_097e:
    dh "＊　　　　　ねん　　がつ\0"

data_098c:
    dk "バイオリズム　＊\0"

data_0997:
    dh "１．．．５．．．．１０．．．１５．．．\0"

data_09ab:
    dh "１５．．．２０．．．２５．．．３０．．\0"

data_09bf:
    dh "１５．．．２０．．．２５．２８．．．．\0"

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
    trap MathSub16
    push hl
    ld de, $0000
    ld c, $04
    trap MathCmp16
    ld a, l
    pop hl
    cp $00
    ret z
    push hl
    ld de, $0012
    ld c, $02
    trap MathCmp16
    ld a, l
    pop hl
    cp $00
    ret z

    ld h, l
    inc h
    ld l, $03
    trap DrawAt
    ld a, ":"
    trap DrawChar
    ld l, $0f
    trap DrawAt
    ld a, ":"
    trap DrawChar
    ret


call_0a2e:
    ld hl, 23
    ld a, [$c621]
    ld e, a
    ld a, [$c622]
    ld d, a
    trap MathDiv16
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
    trap DrawAt
    ld a, "P"
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
    ld hl, 28
    ld a, [$c621]
    ld e, a
    ld a, [$c622]
    ld d, a
    trap MathDiv16
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
    trap DrawAt
    ld a, "S"
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
    db $00, $ff, $fe, $fd, $fc, $fb, $fb, $fb, $fb, $fb, $fc, $fd, $fe, $00
    db $00, $02, $03, $04, $05, $05, $05, $05, $05, $04, $03, $02, $01, $00

call_0b2d:
    ld hl, 33
    ld a, [$c621]
    ld e, a
    ld a, [$c622]
    ld d, a
    trap MathDiv16
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
    trap DrawAt
    ld a, "I"
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
    trap MathSub16
    ld a, l
    ld [$c621], a
    ld a, h
    ld [$c622], a
    ret


call_0bcf:
    ld a, [$c629]
    ld e, a
    ld a, [$c62a]
    ld d, a
    ld a, [$c627]
    ld l, a
    ld a, [$c628]
    ld h, a
    trap MathSub16
    ld de, $0001
    trap MathAdd16
    ld a, l
    ld [$c623], a
    ld a, h
    ld [$c624], a
    ret


call_0bef:
    callx call_025e
    ldx hl, data_0c06
    ld de, $0101
    trap DrawStringList

jr_000_0bff::
    ldh a, [$ff8b]
    and $ff
    jr z, jr_000_0bff

    ret


data_0c06:
    dh "＋－－－－－－－－－－－－－－－－＋\0"
    dh "｜（Ｐ）しんたいりずむ　　　　　　｜\0"
    dh "｜　　　＋　たいりょくこうちょう　｜\0"
    dh "｜　　　０　たいちょうふあんてい　｜\0"
    dh "｜　　　－　たいりょくていちょう　｜\0"
    dh "｜　　　　　　　　　　　　　　　　｜\0"
    dh "｜（Ｓ）かんじょうりずむ　　　　　｜\0"
    dh "｜　　　＋　きりょくじゅうじつ　　｜\0"
    dh "｜　　　０　じょうちょふあんてい　｜\0"
    dh "｜　　　－　きりょくちんたい　　　｜\0"
    dh "｜　　　　　　　　　　　　　　　　｜\0"
    dh "｜（Ｉ）ちせいりずむ　　　　　　　｜\0"
    dh "｜　　　＋　ちりょくかつどう　　　｜\0"
    dh "｜　　　０　ちりょくふあんてい　　｜\0"
    dh "｜　　　－　ちてきげんすい　　　　｜\0"
    dh "＋－－－－－－－－－－－－－－－－＋\0"
    db $00


call_0d40:
    callx call_025e
    ldx hl, data_0e5a
    ld de, $0105
    trap DrawStringList
    ld hl, $0306
    trap DrawAt
    ld hl, $c610
    trap DrawString
    ld hl, $0d06
    trap DrawAt
    ld a, [$b2bb]
    ld e, a
    ld a, [$b2bc]
    ld d, a
    ld a, [$c618]
    ld l, a
    ld a, [$c619]
    ld h, a
    trap MathSub16
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
    trap MathCmp16
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
    trap StrConvInt
    ld hl, $c604
    trap DrawString
    ldx hl, $6304
    trap DrawAt
    ld a, [$b2bb]
    ld e, a
    ld a, [$b2bc]
    ld d, a
    ld a, [$c618]
    ld l, a
    ld a, [$c619]
    ld h, a
    trap MathSub16
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
    trap MathMul16
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
    callx call_0395
    ld hl, $0309
    trap DrawAt
    ld a, [$c618]
    ld e, a
    ld a, [$c619]
    ld d, a
    ld a, [$c61a]
    ld b, a
    ld a, [$c61b]
    ld c, a
    callx call_01c8
    sla a
    sla a
    ld c, a
    ld b, $00
    ldx hl, data_0f69
    add hl, bc
    trap DrawString
    ld hl, $0a09
    trap DrawAt
    ld a, [$c61a]
    ld b, a
    ld a, [$c61b]
    ld c, a
    callx call_020a
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
    trap DrawAt
    ld a, [$c623]
    ld e, a
    ld a, [$c624]
    ld d, a
    ld hl, $c600
    trap StrConvInt
    ld hl, $c601
    trap DrawString

jr_000_0e53::
    ldh a, [$ff8b]
    and $ff
    jr z, jr_000_0e53

    ret


data_0e5a:
    dh "＋－－－－－－－－－－－－－－－－＋\0"
    dh "｜　　　　　　　　　　　　　さい　｜\0"
    dh "｜　　　　　　　　　　　　　　　　｜\0"
    dh "｜　　　　　ねん　　がつ　　にち　｜｜\0"
    dh "｜　　　　ようび　　　　　　　　　｜\0"
    dh "｜　　　　　　　　　　　　　　　　｜\0"
    dh "｜　うまれてから　　　　　にちめ　｜\0"
    dh "｜　　　　　　　　　　　　　　　　｜\0"
    db "＋－－－－－－－－－－－－－－－－＋\0"
    db $00

data_0f09:
    dh "やぎざ　　\0"    ; Capricorn
    dh "みずがめ　\0"    ; Aquarius
    dh "うおざ　　　\0"  ; Pisces
    dh "おひつじざ\0"    ; Aries
    dh "おうしざ　　\0"  ; Taurus
    dh "ふたござ　\0"    ; Gemini
    dh "かにざ　　　\0"  ; Cancer
    dh "ししざ　　　\0"  ; Leo
    dh "おとめざ　　\0"  ; Virgo
    dh "てんびんざ\0"    ; Libra
    dh "さそりざ　　\0"  ; Scorpius
    dh "いてざ　　　\0"  ; Sagittarius

data_0f69:
    dh "げつ\0"    ; Monday
    dh "か　　\0"  ; Tuesday
    dh "すい　\0"  ; Wednesday
    dh "もく　\0"  ; Thursday
    dh "きん　\0"  ; Friday
    dh "ど　\0"    ; Saturday
    dh "にち　\0"  ; Sunday

data_0f85:
    dh "　　　　　　　　　　　\0"
    dh "　　　　　　　　　　　\0"
    dh "　　　　　　　　　　　\0"
    dh "　　　　　　　　　　　\0"
    dh "ようちえん　ねんしょう\0"  ; Kindergarten (low)
    dh "ようちえん　ねんちゅう\0"  ; Kindergarten (mid)
    dh "ようちえん　ねんちょう\0"  ; Kindergarten (high)
    dh "しょうがく１ねんせい\0"    ; Elementary 1st year
    dh "しょうがく２ねんせい\0"    ; Elementary 2nd year
    dh "しょうがく３ねんせい\0"    ; Elementary 3rd year
    dh "しょうがく４ねんせい\0"    ; Elementary 4th year
    dh "しょうがく５ねんせい\0"    ; Elementary 5th year
    dh "しょうがく６ねんせい\0"    ; Elementary 6th year
    dh "ちゅうがく１ねんせい\0"    ; Middle 1st year
    dh "ちゅうがく２ねんせい\0"    ; Middle 2nd year
    dh "ちゅうがく３ねんせい\0"    ; Middle 3rd year
    dh "こうこう１ねんせい　　\0"  ; High 1st year
    dh "こうこう２ねんせい　　\0"  ; High 2nd year
    dh "こうこう３ねんせい　　\0"  ; High 3rd year
    dh "　　　　　　　　　　　\0"


call_1075::
    ld a, [$c61c]
    ld e, a
    ld a, [$c61d]

jr_000_107c::
    ld d, a
    ld a, [$c61e]
    ld b, a
    ld a, [$c61f]
    ld c, a
    callx call_015b
    ld a, e

jr_000_108d::
    ld [$c625], a
    ld a, d

jr_000_1091::
    ld [$c626], a
    ret


call_1095:
    ld a, [$c618]
    ld e, a
    ld a, [$c619]
    ld d, a
    ld a, [$c61a]
    ld b, a
    ld a, [$c61b]
    ld c, a
    callx call_015b
    ld a, e
    ld [$c627], a
    ld a, d
    ld [$c628], a
    ret


call_10b5:
    ld a, [$b2bb]
    ld e, a
    ld a, [$b2bc]
    ld d, a
    ld a, [$b2bd]
    ld b, a
    ld a, [$b2be]
    ld c, a
    callx call_015b
    ld a, e
    ld [$c629], a
    ld a, d
    ld [$c62a], a
    ret


call_10d5:
    ldh a, [$ff8b]
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
    trap MathSub16
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
    trap MathCmp16
    ld a, l
    cp $00
    jr nz, jr_000_1136

    ld a, [$c61e]
    jr jr_000_110e

jr_000_1136::
    ldh a, [$ff8b]
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
    trap MathCmp16
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
    trap MathAdd16
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
    callx call_025e
    ldx hl, data_122c
    ld de, $0106
    trap DrawStringList
    ld hl, $0709
    trap DrawAt
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
    trap StrConvInt
    ld hl, $c604
    trap DrawString
    pop bc
    pop hl
    callx call_026d
    inc b
    ld a, b
    cp c
    jr nz, jr_000_11af

    ld hl, $070a
    trap DrawAt
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
    trap StrConvInt
    ld hl, $c604
    trap DrawString
    pop bc
    pop hl
    callx call_026d
    inc b
    ld a, b
    cp c
    jr nz, jr_000_11db

    ld hl, $070b
    trap DrawAt
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
    trap StrConvInt
    ld hl, $c604
    trap DrawString
    pop bc
    pop hl
    callx call_026d
    inc b
    ld a, b
    cp c
    jr nz, jr_000_1207

jr_000_1225::
    ldh a, [$ff8b]
    and $ff
    jr z, jr_000_1225

    ret


data_122c:
    dk "＋－－－－－－－－－－－－－－－－＋\0"
    dh "｜　！　　ようちゅういのひ　　！　｜\0"
    dk "｜　　　　　　　　　　　　　　　　｜\0"
    dk "｜　Ｐ　：　　　　　　　　　　　　｜\0"
    dk "｜　Ｓ　：　　　　　　　　　　　　｜\0"
    dk "｜　Ｉ　：　　　　　　　　　　　　｜\0"
    dk "＋－－－－－－－－－－－－－－－－＋\0"
    db $00

    ds 6

data_12b8:
    ds 64
data_12f8:
    ds 32
