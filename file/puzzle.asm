; Disassembly of "puzzle-game.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_ICON | FILE_2BPP | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $64           ; owner code
.title
    dk "Puzzle Game"
.icon
    INCBIN "gfx/puzzle/icon.2bpp"
.end

History:
.points
    dw 1
.author
    db "TARKUN    ", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    ld sp, $e000
    ld a, $02
    ld [$d5df], a
    callx call_0112
    jx call_0d6d


call_0112:
    xor a
    trap DrawInit
    ldx hl, data_0e27
    ld de, $0005
    callx call_0d1b
    ldx hl, data_0e3c
    ld de, $0007
    callx call_0d1b
    ldx hl, data_0e51
    ld de, $000a
    callx call_0d1b
    ldx hl, data_0e66
    ld de, $000b
    callx call_0d1b
    ldx hl, data_0e7b
    ld de, $000c
    callx call_0d1b
    ld a, $20
    callx call_0c8d
    ld hl, $d5de
    ld [hl], $00
    ld de, $0000
    callx call_01d1
    ld a, [hl]
    cp $01
    jr nz, jr_000_017f

    callx call_0180

jr_000_017f:
    ret


call_0180:
    ldx hl, data_0e90
    ld de, $0007
    callx call_0d1b
    ldx hl, data_0ea5
    ld de, $000a
    callx call_0d1b
    ldx hl, data_0eba
    ld de, $000b
    callx call_0d1b
    ldx hl, data_0ecf
    ld de, $000c
    callx call_0d1b
    ld a, $40
    callx call_0c8d
    ld hl, $d5df
    ld [hl], $00
    ld de, $0000
    callx call_01d1
    ret


call_01d1:
    push hl
    trap InputButtons
    pop hl
    inc de
    cp $01
    jr nz, jr_000_01de

    jx jr_01fc


jr_000_01de:
    cp $40
    jr nz, jr_000_01ed

    callx call_020d
    jx call_01d1


jr_000_01ed:
    cp $80
    jr nz, call_01d1

    callx call_0223
    jx call_01d1


jr_01fc:
    ld a, [$d5de]
    cp $02
    jr z, jr_000_020b

    ld a, [hl]
    cp $02
    ret nz

    jx Main


jr_000_020b:
    trap ExitToMenu


call_020d:
    ld a, [hl]
    cp $00
    ret z

    dec a
    ld [hl], a
    ld a, [$d5a1]
    sub $08
    ld [$d5a1], a
    callx call_0ca7
    ret


call_0223:
    ld a, [hl]
    cp $02
    ret z

    inc a
    ld [hl], a
    ld a, [$d5a1]
    add $08
    ld [$d5a1], a
    callx call_0ca7
    ret


call_0239:
    ld a, $c0
    ld bc, $0404
    ld de, $0c0c
    ld hl, $0791
    trap DrawInit
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_0265

    trap LCDDisable
    callx call_07a9
    callx call_027b
    callx call_0c4a
    ret


jr_000_0265:
    callx call_07a9
    callx call_02eb
    callx call_0c4a
    ret


call_027b:
    trap RandInit
    ld hl, $d5b9
    ld bc, $0024
    ld e, $00
    trap MemSet
    ld a, $01
    ld [$d5e5], a
    ld hl, $d5b9
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_029c

    ld c, $24
    jx jr_000_029e


jr_000_029c:
    ld c, $10

jr_000_029e:
    callx call_062a
    ld a, [hl]
    xor $01
    ld [hl], a
    inc hl
    dec c
    jr nz, jr_000_029e

    ld c, $14

jr_000_02af:
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_02bf

    trap RandNext
    ld a, l
    and $1f
    jx jx_02c4


jr_000_02bf:
    trap RandNext
    ld a, l
    and $0f

jx_02c4:
    ld hl, $d5b9
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    xor $01
    ld [hl], a
    push bc
    callx call_062a
    callx call_08b3
    pop bc
    dec c
    jr nz, jr_000_02af

    ld a, $07
    trap LCDEnable
    xor a
    ld [$d5e5], a
    ret


call_02eb:
    push hl
    ld de, $0000
    ld hl, $d5aa
    ld bc, $0010
    ld e, $00
    trap MemSet
    pop hl
    trap RandInit
    ld hl, $d5b9
    xor a

jr_000_0300:
    push af
    push hl

jr_000_0302:
    trap RandNext
    ld a, l
    and $0f
    cp $0f
    jr z, jr_000_0302

    push af
    ld hl, $d5aa
    ld d, $00
    ld e, a
    trap $87
    ld a, [hl]
    cp $01
    jr nz, jr_000_031e

    pop af
    jx jr_000_0302


jr_000_031e:
    ld [hl], $01
    pop af
    pop hl
    ld [hl], a
    ld [$d5a6], a
    callx call_03b2
    pop af
    push af
    ld [$d5a6], a
    callx call_035a
    callx call_05df
    pop af
    inc l
    inc a
    cp $0f
    jr nz, jr_000_0300

    ld [hl], a
    ld a, $09
    ld [$d5a2], a
    ld a, $48
    ld [$d5a3], a
    callx call_066f
    ret


call_035a:
    push hl
    push de
    push bc
    push af
    ld a, [$d5a6]
    ld d, $00
    ld e, a
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0372

    ld hl, $0006
    jx jx_0374


jr_000_0372:
    ld hl, $0004

jx_0374:
    trap $8a
    ld a, [$c3b0]
    push hl
    ld d, $00
    ld e, a
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_038c

    ld hl, $0002
    jx jx_038e


jr_000_038c:
    ld hl, $0003

jx_038e:
    trap $89
    ld a, l
    ld [$d5a2], a
    pop hl
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_03a4

    ld de, $0010
    jx jx_03a6


jr_000_03a4:
    ld de, $0018

jx_03a6:
    trap $89
    ld a, l
    ld [$d5a3], a
    pop af
    pop bc
    pop de
    pop hl
    ret


call_03b2:
    push hl
    push de
    push bc
    push af
    ld a, [$d5a6]
    ld d, $00
    ld e, a
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_03ca

    ld hl, $0006
    jx jx_03cc


jr_000_03ca:
    ld hl, $0004

jx_03cc:
    trap $8a
    push hl
    ld a, [$c3b0]
    cp $01
    jr nz, jr_000_03db

    jx jx_0419


jr_000_03db:
    cp $02
    jr nz, jr_000_03e3

    jx jx_043c


jr_000_03e3:
    cp $03
    jr nz, jr_000_03eb

    jx jx_045f


jr_000_03eb:
    cp $04
    jr nz, jr_000_03f3

    jx jx_0481


jr_000_03f3:
    cp $05
    jr nz, jr_000_03fb

    jx jx_0491


jr_000_03fb:
    pop hl
    ld d, $00
    ld e, l
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_040d

    ld hl, $0020
    jx jx_0410


jr_000_040d:
    ld hl, $0030

jx_0410:
    trap $89
    ld de, $0000
    jx jx_049e


jx_0419:
    pop hl
    ld d, $00
    ld e, l
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0430

    ld hl, $0020
    trap $89
    ld de, $0180
    jx jx_049e


jr_000_0430:
    ld hl, $0030
    trap $89
    ld de, $0240
    jx jx_049e


jx_043c:
    pop hl
    ld d, $00
    ld e, l
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0453

    ld hl, $0020
    trap $89
    ld de, $0300
    jx jx_049e


jr_000_0453:
    ld hl, $0030
    trap $89
    ld de, $0480
    jx jx_049e


jx_045f:
    pop hl
    ld d, $00
    ld e, l
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0476

    ld hl, $0020
    trap $89
    ld de, $0480
    jx jx_049e


jr_000_0476:
    ld hl, $0030
    trap $89
    ld de, $06c0
    jx jx_049e


jx_0481:
    pop hl
    ld d, $00
    ld e, l
    ld hl, $0020
    trap $89
    ld de, $0600
    jx jx_049e


jx_0491:
    pop hl
    ld d, $00
    ld e, l
    ld hl, $0020
    trap $89
    ld de, $0780

jx_049e:
    add hl, de
    ld a, h
    ld [$d5a5], a
    ld a, l
    ld [$d5a4], a
    pop af
    pop bc
    pop de
    pop hl
    ret


jx_04ac:
    ld a, [$d5a4]
    ld e, a
    ld a, [$d5a5]
    ld d, a
    ld hl, $cca0
    add hl, de
    ld de, $0000
    ld bc, $0000

jx_04be:
    ld a, [hl+]
    push hl
    push bc
    ld b, a
    ld hl, $c8b0
    add hl, de
    ld a, [hl]
    and b
    ld b, a
    ld hl, $c820
    add hl, de
    ld a, [hl]
    or b
    pop bc
    ld hl, $cc10
    add hl, bc
    ld [hl], a
    inc c
    ld a, c
    pop hl
    cp $40
    ret z

    inc e
    ld a, e
    cp $10
    jr nz, jr_000_04e8

    add $10
    ld e, a
    jx jx_04be


jr_000_04e8:
    cp $30
    jr nz, jr_000_04f9

    add $30
    ld e, a
    push de
    ld de, $00a0
    add hl, de
    pop de
    jx jx_04be


jr_000_04f9:
    cp $70
    jr nz, jr_000_0504

    add $10
    ld e, a
    jx jx_04be


jr_000_0504:
    jx jx_04be


call_0508:
    push hl
    push de
    push bc
    push af
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_051b

    pop af
    pop bc
    pop de
    pop hl
    jx jx_04ac


jr_000_051b:
    xor a
    ld [$d5a8], a
    ld [$d5a9], a

jr_000_0522:
    ld [$d5a7], a
    ld hl, $cc10
    ld a, [$d5a8]
    ld e, a
    ld a, [$d5a9]
    ld d, a
    add hl, de
    push hl
    ld a, [$d5a4]
    ld e, a
    ld a, [$d5a5]
    ld d, a
    ld hl, $cca0
    add hl, de
    push hl
    pop de
    pop hl
    ld bc, $0030
    trap MemCopy
    ld a, [$d5a8]
    add $30
    ld [$d5a8], a
    ld a, [$d5a4]
    ld l, a
    ld a, [$d5a5]
    ld h, a
    ld de, $00c0
    add hl, de
    ld a, l
    ld [$d5a4], a
    ld a, h
    ld [$d5a5], a
    ld a, [$d5a7]
    inc a
    cp $03
    jr nz, jr_000_0522

    xor a
    ld [$d5a8], a
    ld [$d5a9], a

jr_000_0571:
    ld [$d5a7], a
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_0582

    ld hl, $c8b0
    jx jx_0585


jr_000_0582:
    ld hl, $c790

jx_0585:
    ld a, [$d5a8]
    ld e, a
    ld a, [$d5a9]
    ld d, a
    add hl, de
    ld b, [hl]
    ld hl, $cc10
    ld a, [$d5a8]
    ld e, a
    ld a, [$d5a9]
    ld d, a
    add hl, de
    ld a, [hl]
    and b
    push hl
    push af
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_05ad

    ld hl, $c820
    jx jx_05b0


jr_000_05ad:
    ld hl, $c700

jx_05b0:
    ld a, [$d5a8]
    ld e, a
    ld a, [$d5a9]
    ld d, a
    add hl, de
    ld b, [hl]
    pop af
    or b
    pop hl
    ld [hl], a
    ld hl, $0001
    ld a, [$d5a8]
    ld e, a
    ld a, [$d5a9]
    ld d, a
    add hl, de
    ld a, h
    ld [$d5a9], a
    ld a, l
    ld [$d5a8], a
    ld a, [$d5a7]
    inc a
    cp $90
    jr nz, jr_000_0571

    pop af
    pop bc
    pop de
    pop hl
    ret


call_05df:
    push hl
    push de
    push bc
    push af
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_05fd

    ld a, [$d5dd]
    cp $00
    jr nz, jr_000_05fd

    callx call_066f
    pop af
    pop bc
    pop de
    pop hl
    ret


jr_000_05fd:
    callx call_0508
    ld hl, $cc10
    ld a, [$d5a2]
    ld d, a
    ld a, [$d5a3]
    ld e, a
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0620

    ld bc, $0210
    trap $c0

    pop af
    pop bc
    pop de
    pop hl
    ret


jr_000_0620:
    ld bc, $0318
    trap $c0

    pop af
    pop bc
    pop de
    pop hl
    ret


call_062a:
    push hl
    push de
    push bc
    push af
    ld [$d5dd], a
    ld d, h
    ld e, l
    ld hl, $d5b9
    trap $88
    ld a, l
    ld [$d5a6], a
    callx call_03b2
    ld [$d5a6], a
    callx call_035a
    push hl
    push de
    push bc
    push af
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0658

jr_000_0658:
    pop af
    pop bc
    pop de
    pop hl
    callx call_05df
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_066a

jr_000_066a:
    pop af
    pop bc
    pop de
    pop hl
    ret


call_066f:
    push hl
    push de
    push bc
    push af
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_0688

    ld hl, $c820
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_068b

    jx call_069d


jr_000_0688:
    ld hl, $c940

jr_000_068b:
    ld a, [$d5a2]
    ld d, a
    ld a, [$d5a3]
    ld e, a
    ld bc, $0318
    trap $c0

    pop af
    pop bc
    pop de
    pop hl
    ret


call_069d:
    ldx hl, data_0f68
    ld a, [$d5a2]
    ld d, a
    ld a, [$d5a3]
    ld e, a
    ld bc, $0210
    trap $c0

    pop af
    pop bc
    pop de
    pop hl
    ret


call_06b3:
    ldh a, [$8a]
    cp $01
    jr nz, jr_000_06bd

    jx jx_06ed


jr_000_06bd:
    cp $06
    jr nz, jr_000_06c5

    jx jx_06f5


jr_000_06c5:
    cp $08
    jr nz, jr_000_06cd

    jx jx_06fa


jr_000_06cd:
    cp $10
    jr nz, jr_000_06d5

    jx jx_06fb


jr_000_06d5:
    cp $20
    jr nz, jr_000_06dd

    jx jx_0728


jr_000_06dd:
    cp $40
    jr nz, jr_000_06e5

    jx jx_0752


jr_000_06e5:
    cp $80
    jr nz, call_06b3

    jx jx_077c


jx_06ed:
    callx jx_0800
    ret


jx_06f5:
    jx Main


jx_06f9:
    ret


jx_06fa:
    ret


jx_06fb:
    ld a, [$d5df]
    cp $01
    jr z, jr_000_0715

    ld a, [$d5a0]
    cp $78
    ret z

    add $18
    ld [$d5a0], a
    callx call_0c54
    ret


jr_000_0715:
    ld a, [$d5a0]
    cp $80
    ret z

    add $10
    ld [$d5a0], a
    callx call_0c54
    ret


jx_0728:
    ld a, [$d5a0]

jr_000_072b:
    cp $30
    ret z

    push af
    ld a, [$d5df]
    cp $01
    jr z, jr_000_0744

    pop af
    sub $18
    ld [$d5a0], a
    callx call_0c54
    ret


jr_000_0744:
    pop af
    sub $10
    ld [$d5a0], a
    callx call_0c54
    ret


jx_0752:
    ld a, [$d5a1]
    cp $38
    ret z

    push af
    ld a, [$d5df]
    cp $01
    jr z, jr_000_076e

    pop af
    sub $18
    ld [$d5a1], a
    callx call_0c54
    ret


jr_000_076e:
    pop af
    sub $10
    ld [$d5a1], a
    callx call_0c54
    ret


jx_077c:
    ld a, [$d5df]
    cp $01
    jr z, jr_000_0796

    ld a, [$d5a1]
    cp $80
    ret z

    add $18
    ld [$d5a1], a
    callx call_0c54
    ret


jr_000_0796:
    ld a, [$d5a1]
    cp $88
    ret z

    add $10
    ld [$d5a1], a
    callx call_0c54
    ret


call_07a9:
    ld a, [$d5de]
    cp $01
    jr z, jr_000_07e1

    ld hl, $cca0
    ld de, $0000
    ld bc, $0c60
    trap $c0

    ld de, $0000
    ldx hl, data_0dd3
    callx call_0d1b
    ld de, $0001
    ldx hl, data_0de8
    callx call_0d1b
    ld hl, $0000

jr_000_07da:
    trap InputButtons

    inc hl
    bit 0, a
    jr z, jr_000_07da

jr_000_07e1:
    push hl
    ld de, $0000
    ldx hl, data_0dbe
    callx call_0d1b
    ld de, $0001
    ldx hl, data_0dfd
    callx call_0d1b
    pop hl
    ret


jx_0800:
    push hl
    push de

jr_000_0802:
    push bc
    push af
    ld a, [$d5a1]
    sub $38
    ld d, $00
    ld e, a
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0821

    ld hl, $0010
    trap $8a
    ld de, $0006
    trap $89
    jx jx_082b


jr_000_0821:
    ld hl, $0018
    trap $8a
    ld de, $0004
    trap $89

jx_082b:
    push hl
    ld a, [$d5a0]
    sub $30
    ld d, $00
    ld e, a
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0842

    ld hl, $0010
    jx jx_0845


jr_000_0842:
    ld hl, $0018

jx_0845:
    trap $8a
    pop de
    add hl, de
    push hl
    ld hl, $d5b9
    pop de
    add hl, de
    ld a, [hl]
    push af
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_0867

    pop af
    xor $01
    ld [hl], a
    callx call_062a
    jx call_08b3


jr_000_0867:
    pop af
    cp $0f
    jr nz, call_08b3

    pop af
    pop bc
    pop de
    pop hl
    ret


jx_0871:
    push af
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_08de

    pop af
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_089c

    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, [hl]
    xor $01
    ld [hl], a
    callx call_062a
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    jx jx_093e


jr_000_089c:
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, [hl]
    xor $01
    ld [hl], a
    callx call_062a
    inc hl
    inc hl
    inc hl
    inc hl
    jx jx_093e


call_08b3:
    ld a, [$d5e5]
    cp $01
    jr nz, jr_000_08be

    push hl
    push de
    push bc
    push af

jr_000_08be:
    push hl
    push de
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_08ce

    ld hl, $0006
    jx jx_08d1


jr_000_08ce:
    ld hl, $0004

jx_08d1:
    trap $8a
    ld a, l
    pop de
    pop hl
    cp $00
    jr z, jx_093e

    jx jx_0871


jr_000_08de:
    pop af
    cp $01
    jr z, jr_000_0927

    cp $02
    jr z, jr_000_090b

    push hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, [hl]
    pop hl
    cp $0f
    jr nz, jr_000_090b

    push hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    callx call_0bf7
    pop hl

jr_000_090b:
    push hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, [hl]
    pop hl
    cp $0f
    jr nz, jr_000_0927

    push hl
    dec hl
    dec hl
    dec hl
    dec hl
    callx call_0bf7
    pop hl

jr_000_0927:
    push hl
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, [hl]
    pop hl
    cp $0f
    jr nz, jx_093e

    callx call_0bf7
    pop af
    pop bc
    pop de
    pop hl
    ret


jx_093e:
    push hl
    push de
    push bc
    push af
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0950

    ld hl, $0006
    jx jx_0953


jr_000_0950:
    ld hl, $0004

jx_0953:
    trap $8a
    pop af
    pop bc
    pop de
    pop hl
    ld a, [$c3b0]
    cp $00
    jr z, jx_09be

    push af
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_097a

    pop af
    dec hl
    ld a, [hl]
    xor $01
    ld [hl], a
    callx call_062a
    inc hl
    jx jx_09be


jr_000_097a:
    pop af
    cp $01
    jr z, jr_000_09ab

    cp $02
    jr z, jr_000_0999

    dec hl
    dec hl
    dec hl
    ld a, [hl]
    inc hl
    inc hl
    inc hl
    cp $0f
    jr nz, jr_000_0999

    dec hl
    dec hl
    callx call_0b5a
    inc hl
    inc hl

jr_000_0999:
    dec hl
    dec hl
    ld a, [hl]
    inc hl
    inc hl
    cp $0f
    jr nz, jr_000_09ab

    dec hl
    callx call_0b5a
    inc hl

jr_000_09ab:
    dec hl
    ld a, [hl]
    inc hl
    cp $0f
    jr nz, jx_09be

    callx call_0b5a
    pop af
    pop bc
    pop de
    pop hl
    ret


jx_09be:
    push hl
    push de
    push bc
    push af
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_09dd

    ld hl, $0006
    trap $8a
    pop af
    pop bc
    pop de
    pop hl
    ld a, [$c3b0]
    cp $05
    jr z, jx_0a4b

    jx jx_09ed


jr_000_09dd:
    ld hl, $0004
    trap $8a
    pop af
    pop bc
    pop de
    pop hl
    ld a, [$c3b0]
    cp $03
    jr z, jx_0a4b

jx_09ed:
    push af
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_0a07

    pop af
    inc hl
    ld a, [hl]
    xor $01
    ld [hl], a
    callx call_062a
    dec hl
    jx jx_0a4b


jr_000_0a07:
    pop af
    cp $02
    jr z, jr_000_0a38

    cp $01
    jr z, jr_000_0a26

    inc hl
    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    dec hl
    cp $0f
    jr nz, jr_000_0a26

    inc hl
    inc hl
    callx call_0b10
    dec hl
    dec hl

jr_000_0a26:
    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    cp $0f
    jr nz, jr_000_0a38

    inc hl
    callx call_0b10
    dec hl

jr_000_0a38:
    inc hl
    ld a, [hl]
    dec hl
    cp $0f
    jr nz, jx_0a4b

    callx call_0b10

jx_0a46:
    pop af
    pop bc
    pop de
    pop hl
    ret


jx_0a4b:
    push hl
    push de
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0a64

    ld hl, $0006
    trap $8a
    ld a, l
    pop de
    pop hl
    cp $05
    jr z, jx_0a46

    jx jx_0a70


jr_000_0a64:
    ld hl, $0004
    trap $8a
    ld a, l
    pop de
    pop hl
    cp $03
    jr z, jx_0a46

jx_0a70:
    push af
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_0ab0

    pop af
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0a99

    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    xor $01
    ld [hl], a
    callx call_062a
    dec hl
    dec hl
    dec hl
    dec hl
    jx jx_0a46


jr_000_0a99:
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    xor $01
    ld [hl], a
    callx call_062a
    dec hl
    dec hl
    dec hl
    dec hl
    jx jx_0a46


jr_000_0ab0:
    pop af
    cp $02
    jr z, jr_000_0af9

    cp $01
    jr z, jr_000_0add

    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    pop hl
    cp $0f
    jr nz, jr_000_0add

    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    callx call_0ba4
    pop hl

jr_000_0add:
    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    pop hl
    cp $0f
    jr nz, jr_000_0af9

    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    callx call_0ba4
    pop hl

jr_000_0af9:
    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    pop hl
    cp $0f
    jr nz, jr_000_0b0b

    callx call_0ba4

jr_000_0b0b:
    pop af
    pop bc
    pop de
    pop hl
    ret


call_0b10:
    push hl
    push de
    push bc
    push af
    ld a, [hl]
    push af
    inc hl
    ld [hl], a
    dec hl
    ld a, $0f
    ld [hl], a
    push hl
    ld hl, $d5b9
    pop de
    trap $88
    ld a, l
    ld [$d5a6], a
    push hl
    callx call_035a
    callx call_066f
    pop hl
    ld a, l
    inc a
    ld [$d5a6], a
    callx call_035a
    pop af
    ld [$d5a6], a
    callx call_03b2
    callx call_05df
    pop af
    pop bc
    pop de
    pop hl
    ret


call_0b5a:
    push hl
    push de
    push bc
    push af
    ld a, [hl]
    push af
    dec l
    ld [hl], a
    inc l
    ld a, $0f
    ld [hl], a
    push hl
    ld hl, $d5b9
    pop de
    trap $88
    ld a, l
    ld [$d5a6], a
    push hl
    callx call_035a
    callx call_066f
    pop hl
    ld a, l
    dec a
    ld [$d5a6], a
    callx call_035a
    pop af
    ld [$d5a6], a
    callx call_03b2
    callx call_05df
    pop af
    pop bc
    pop de
    pop hl
    ret


call_0ba4:
    push hl
    push de
    push bc
    push af
    ld a, [hl]
    push af
    inc hl
    inc hl
    inc hl
    inc hl
    ld [hl], a
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, $0f
    ld [hl], a
    push hl
    ld hl, $d5b9
    pop de
    trap $88
    ld a, l
    ld [$d5a6], a
    push hl
    callx call_035a


call_0bc9:
    callx call_066f
    pop hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, l
    ld [$d5a6], a
    callx call_035a


call_0be0:
    pop af
    ld [$d5a6], a
    callx call_03b2
    callx call_05df
    pop af
    pop bc
    pop de
    pop hl
    ret


call_0bf7:
    push hl
    push de
    push bc
    push af
    ld a, [hl]
    push af
    dec hl
    dec hl
    dec hl
    dec hl
    ld [hl], a
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, $0f
    ld [hl], a
    push hl
    ld hl, $d5b9
    pop de
    trap $88
    ld a, l
    ld [$d5a6], a
    push hl
    callx call_035a
    callx call_066f
    pop hl
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, l
    ld [$d5a6], a
    callx call_035a
    pop af
    ld [$d5a6], a
    callx call_03b2
    callx call_05df
    pop af
    pop bc
    pop de
    pop hl
    ret


call_0c4a:
    ld a, $30
    ld [$d5a0], a
    ld a, $38
    ld [$d5a1], a

call_0c54:
    ld hl, $8000
    ld bc, $0040
    ldx de, data_0f28
    trap MemCopy
    ld hl, $c300
    ld a, [$d5a1]
    ld [hl+], a
    ld a, [$d5a0]
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    inc hl
    ld a, [$d5a1]
    ld [hl+], a
    ld a, [$d5a0]
    add $08
    ld [hl+], a
    ld a, $02
    ld [hl+], a
    ret


call_0c7d:
    ld a, $00
    ld [$d5a0], a
    ld [$d5a1], a
    callx call_0c54
    ret


call_0c8d:
    push af
    ld hl, $8000
    ld bc, $0010
    ldx de, data_0f18
    trap MemCopy
    ld a, $03
    trap LCDEnable
    pop af
    ld [$d5a0], a
    ld a, $60
    ld [$d5a1], a

call_0ca7:
    push hl
    ld hl, $c300
    ld a, [$d5a1]
    ld [hl+], a
    ld a, [$d5a0]
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    pop hl
    ret


call_0cb8:
    ld hl, $d5b9
    ld a, [$d5de]
    cp $01
    jr nz, jr_000_0cca

    ldx de, data_0ef4
    jx jx_0cce


jr_000_0cca:
    ldx de, data_0ee4

jx_0cce:
    ld a, [$d5df]
    cp $01
    jr nz, jr_000_0cdc

    ld bc, $0024
    jx jx_0cdf


jr_000_0cdc:
    ld bc, $0010

jx_0cdf:
    trap $67
    ld a, l
    or $00
    jr nz, jr_000_0ce9

    ld a, $01
    ret


jr_000_0ce9:
    ld a, $00
    ret


call_0cec:
    callx call_0c7d
    trap AwaitFrame
    ld hl, $cca0
    ld de, $0000
    ld bc, $0c60
    trap $c0

    ld de, $0001
    ldx hl, data_0e12
    callx call_0d1b
    xor a
    ldh [$8a], a

jr_000_0d11:
    ldh a, [$8a]
    bit 0, a
    jr z, jr_000_0d11

    jx Main


call_0d1b:
    push hl
    push de
    push bc
    push af
    push hl
    push de
    ld a, $06
    trap $b9
    pop hl
    trap DrawAt
    pop hl
    trap DrawString
    ld a, $07
    trap $b9
    pop af
    pop bc
    pop de
    pop hl
    ret


call_0d34:
    ld de, $cca0
    ld bc, $0900
    trap ExtractData
    ret


call_0d3d:
    ld hl, $c500
    ld de, $d5e6
    push de
    ld bc, $0900
    trap $eb
    pop de
    ld hl, $c600
    ld b, h
    trap ExtractInit
    callx call_0d34
    ret


jr_000_0d58:
    ldx de, data_10ea
    ld hl, $c600
    ld b, h
    trap ExtractInit
    callx call_0d34
    jx jx_0d81


call_0d6d:
    trap LCDDisable
    ld hl, $c500
    ld a, [hl+]
    or [hl]
    ldx de, data_10ea
    jr z, jr_000_0d58

    callx call_0d3d

jx_0d81:
    ldx de, data_0fa8
    ld hl, $c600
    ld b, h
    trap ExtractInit
    ld de, $c700
    ld bc, $0510
    trap ExtractData
    callx call_0239


jr_000_0d9a:
    callx call_0c54

jr_000_0da1:
    ldh a, [$8a]
    and a
    jr nz, jr_000_0da1

    callx call_06b3
    ld a, $00
    callx call_0cb8
    cp $01
    jr nz, jr_000_0d9a

    jx call_0cec


data_0dbe:
    db "                    \n"
data_0dd3:
    db "   PUSH A BUTTON!   \n"
data_0de8:
    db "       START!       \n"
data_0dfd:
    db "  RETIRE  SELECT+B  \n"
data_0e12:
    db "  CONGRATULATION!!  \n"
data_0e27:
    db "    PUZZLE  GAME    \n"
data_0e3c:
    db "    GAME  SELECT    \n"
data_0e51:
    db "    15 PUZZLE       \n"
data_0e66:
    db "    PANEL DE PON!   \n"
data_0e7b:
    db "    EXIT            \n"
data_0e90:
    db "    MODE  SELECT    \n"
data_0ea5:
    db "        EASY        \n"
data_0eba:
    db "        HARD        \n"
data_0ecf:
    db "        EXIT        \n"

data_0ee4:
    db $00, $01, $02, $03
    db $04, $05, $06, $07
    db $08, $09, $0a, $0b
    db $0c, $0d, $0e, $0f

data_0ef4:
    db $01, $01, $01, $01, $01, $01
    db $01, $01, $01, $01, $01, $01
    db $01, $01, $01, $01, $01, $01
    db $01, $01, $01, $01, $01, $01
    db $01, $01, $01, $01, $01, $01
    db $01, $01, $01, $01, $01, $01

data_0f18:
    INCBIN "gfx/puzzle/arrow.2bpp"

data_0f28:
    INCBIN "gfx/puzzle/hand.2bpp"

data_0f68:
    INCBIN "gfx/puzzle/tile.2bpp"

data_0fa8:
    INCBIN "gfx/puzzle/boxes.2bpp.hz"

data_10ea:
    INCBIN "gfx/puzzle/numbers.2bpp.hz"
