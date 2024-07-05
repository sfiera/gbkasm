; Disassembly of "blackjack.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_2BPP | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $43           ; owner code
.title
    dk "BLACK JACK"
.icon
.end

History:
.points
    dw 20
.author
    db "TARKUN    ", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    ld hl, $c600
    ld de, $c400
    ld bc, $0100
    trap MemCopy
    jx jx_0bb8


    xor a
    trap AudioPlayMusic
    trap ExitToMenu
    ld a, $20
    trap DrawInit
    trap AudioStop
    callx @+$0035
    callx @+$0023
    callx @+$003a
    ld a, $0a
    ld [$c8ce], a
    ld a, $01
    ld [$c882], a
    ld a, $03
    trap LCDEnable
    ld a, [$0014]
    cp $01
    ret nz

    ld a, $05
    trap AudioPlayMusic
    ret


    ld e, $00
    ld bc, $00d1
    ld hl, $c800
    trap MemSet
    ret


call_0091:
    ldx de, data_093e
    ld hl, $c700
    ld b, h
    trap ExtractInit
    ld bc, $0270
    ld de, $8b10
    trap ExtractData
    ret

call_00a4:
    ldx hl, data_0a80
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
    trap MemSet
    ld a, [$c883]
    ld h, a
    ld l, a
    trap RandInit
    ld c, $00

jr_000_00cb::
    push bc
    trap RandNext
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
    trap $8a
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

    callx @+$0027
    xor a
    ld [$c881], a
    ld a, [$c885]
    cp $00
    ret z

    ld hl, $0508
    trap DrawAt
    ld a, [$c886]
    cp $01
    jr nz, jr_000_0137

    ldx hl, data_0b82
    trap DrawString
    ret


jr_000_0137:
    ldx hl, data_0b8b
    trap DrawString
    ret


    ld a, [$c881]
    cp $00

HeaderCGBFlag::
    ret z

    cp $01
    jr nz, jr_000_0150

    callx @+$0065
    ret


jr_000_0150::
    cp $08
    jr nz, jr_000_015c

    callx @+$0059
    ret


jr_000_015c::
    cp $40
    jr nz, jr_000_0168

    callx @+$0043
    ret


jr_000_0168::
    cp $80
    jr nz, jr_000_0174

    callx @+$0037
    ret


jr_000_0174::
    cp $10
    jr nz, jr_000_0180

    callx @+$002b
    ret


jr_000_0180::
    cp $20
    jr nz, jr_000_018c

    callx @+$001f
    ret


jr_000_018c::
    cp $02
    ret nz

    xor a
    ld [$c885], a
    ld [$c886], a
    ld a, $01
    ld [$c887], a
    ld hl, $0008
    trap DrawAt
    ldx hl, data_0b4c
    trap DrawString
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
    trap DrawAt
    ldx hl, data_0b4c
    trap DrawString
    ld a, [$0014]
    cp $01
    ret nz

    ld a, $01
    trap AudioPlaySound
    ret


    ld l, c
    ld h, b
    trap DrawAt
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

jr_000_01fe::
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

jr_000_022d::
    ld hl, $c8ba
    trap DrawString
    ret


    ld hl, $0001
    trap DrawAt
    ldx hl, data_0ac9
    trap DrawString
    ld hl, $000d
    trap DrawAt
    ldx hl, data_0ac9
    trap DrawString
    ret


    callx @+$0012
    callx @+$000b
    callx @+$ff74
    ret


    push af
    push bc
    push de
    push hl
    callx @+$ff68
    ld a, $05
    trap $dc
    pop hl
    pop de
    pop bc
    pop af
    ld hl, $0000
    ld l, c
    trap DrawAt
    ldx hl, data_0b4c
    push af
    push bc
    push de
    push hl
    trap DrawString
    pop hl
    pop de
    pop bc
    pop af
    inc c
    ret


    ld a, [$c884]
    cp $00
    ret z

    callx @+$007f
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

jr_000_02ae::
    ld hl, $0d09

jr_000_02b1::
    trap DrawAt
    ld a, [$c8ce]
    ld e, a
    ld d, $00
    ld hl, $c8c7
    trap StrConvInt
    trap DrawString
    ldx hl, data_0a83
    trap DrawString
    ld hl, $0309
    trap DrawAt
    ldx hl, data_0a92
    trap DrawString
    ld hl, $030a
    trap DrawAt
    ldx hl, data_0a77
    trap DrawString
    ld a, [$c8cf]
    ld e, a
    ld a, [$c8d0]
    ld d, a
    ld hl, $c8c7
    trap StrConvInt
    trap DrawString
    ldx hl, data_0a83
    trap DrawString
    ld hl, $0507
    trap DrawAt
    callx @+$02f4
    cp $00
    jr nz, jr_000_0308

    ldx hl, data_0a87
    trap DrawString
    ret


jr_000_0308::
    cp $0f
    ret nz

    ldx hl, data_0b4c
    trap DrawString
    ret


    ld a, [$c881]
    cp $00
    ret z

    cp $01
    jr nz, jr_000_0324

    callx @+$003f
    ret


jr_000_0324::
    cp $08
    jr nz, jr_000_0330

    callx @+$0033
    ret


jr_000_0330::
    cp $40
    jr nz, jr_000_033c

    callx @+$006d
    ret


jr_000_033c::
    cp $80
    jr nz, jr_000_0348

    callx @+$004a
    ret


jr_000_0348::
    cp $10
    jr nz, jr_000_0354

    callx @+$003e
    ret


jr_000_0354::
    cp $20
    ret nz

    callx @+$004a
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
    trap AudioPlaySound

jr_000_0376::
    ld a, [$c8cf]
    ld l, a
    ld a, [$c8d0]
    ld h, a
    ld a, [$c8ce]
    ld e, a
    ld d, $00
    push hl
    trap $88
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
    trap AudioPlaySound
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
    trap AudioPlaySound

jr_000_03bb::
    ld a, [$c8cf]
    ld l, a
    ld a, [$c8d0]
    ld h, a
    ld a, [$c8ce]
    ld e, a
    ld d, $00
    push hl
    trap $88
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
    callx @+$013e
    callx @+$00d2
    callx @+$0130

jr_000_03f7::
    callx @+$00c4
    callx @+$0235
    cp $15
    jr z, jr_000_0420

    callx @+$028f
    cp $01
    ret nz

    xor a
    ld [$c88a], a
    ld a, $01
    ld [$c886], a
    ld [$c88c], a
    ret


jr_000_0420::
    ld hl, $0501
    trap DrawAt
    ldx hl, data_0a5f
    trap DrawString
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
    trap DrawAt
    callx @+$01a2
    cp $00
    jr nz, jr_000_045d

    ldx hl, data_0ab3
    trap DrawString
    jx @+$000d


jr_000_045d::
    cp $0f
    jr nz, jr_000_0467

    ldx hl, data_0b4c
    trap DrawString

jr_000_0467::
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


jr_000_0485::
    callx @+$009b
    callx @+$01b8
    cp $16
    jr c, jr_000_0499

    jr nc, jr_000_049f

jr_000_0499:
    cp $15
    jr nz, jr_000_04ba

    jr jr_000_04aa

jr_000_049f::
    ld hl, $0610
    trap DrawAt
    ldx hl, data_0b94
    trap DrawString

jr_000_04aa::
    xor a
    ld [$c88a], a
    ld [$c885], a
    ld a, $01
    ld [$c88c], a
    ld [$c886], a
    ret


jr_000_04ba::
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
    callx @+$fd63
    ld a, [$c86c]
    inc a
    ld [$c86c], a
    ret


jr_000_04f2::
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
    callx @+$fd31
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
    jx @+$ffd5


jr_000_0552::
    ld a, l
    ld [$c891], a
    ld a, h
    pop hl
    ld [hl], a
    or $80
    ld e, a
    ld c, $0b
    callx @+$fce8
    ld a, [$c86b]
    inc a
    ld [$c86b], a
    callx @+$00d8
    ld e, a
    ld d, $00
    ld hl, $c8c7
    trap StrConvInt
    trap DrawString
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
    trap DrawAt
    ldx hl, data_0a87
    trap DrawString
    callx @+$fc8a
    ld a, [$0014]
    cp $01
    ret nz

    ld a, $01
    trap AudioPlaySound
    ret


jr_000_05b7::
    ld hl, $0507
    trap DrawAt
    ldx hl, data_0a5f
    trap DrawString
    ld hl, $000d
    trap DrawAt
    ldx hl, data_0b1b
    trap DrawString
    ld hl, $0409
    trap DrawAt
    callx @+$0018
    cp $00
    jr nz, jr_000_05e4

    ldx hl, data_0a6a
    trap DrawString
    ret


jr_000_05e4::
    cp $0f
    ret nz

    ldx hl, data_0b4c
    trap DrawString
    ret


    ld a, [$c883]
    ld d, $00
    ld e, a
    ld hl, $0019
    trap $8a
    ld a, [$c3b0]
    ret


    ld a, [$c882]
    cp $00
    jr z, jr_000_0608

    jx @+$fa48


jr_000_0608:
    ld a, [$c884]
    cp $00
    ret z

    jx @+$05a9


    ret


jr_000_0613::
    callx @+$0020
    cp $11
    ret nc

    callx @+$fe9e
    callx @+$000f
    ld e, a
    ld d, $00
    ld hl, $c8c7
    trap StrConvInt
    trap DrawString
    jr jr_000_0613

    ld a, [$c86c]
    ld hl, $c877
    callx @+$0018
    ld [$c86a], a
    ret


    ld a, [$c86b]
    ld hl, $c86d
    callx @+$0007
    ld [$c869], a
    ret


    ld c, a
    xor a
    ld d, a

jr_000_065c::
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

jr_000_066c::
    cp $0a
    jr c, jr_000_0672

    ld a, $0a

jr_000_0672::
    ld b, a
    pop af
    add b
    dec c
    jr nz, jr_000_065c

jr_000_0678::
    callx @+$0004
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


jr_000_068d::
    ld a, b
    ret


jr_000_068f::
    add $0a
    cp $16
    jr nc, jr_000_0699

    dec d
    jr nz, jr_000_068f

    ret


jr_000_0699::
    sub $0a
    ret


    callx @+$ffa8
    cp $15
    jr nz, jr_000_06be

    ld a, $01
    ld [$c88f], a
    xor a
    ld [$c886], a
    ld hl, $0510
    trap DrawAt
    ldx hl, data_0a5f
    trap DrawString
    ld a, $01
    ret


jr_000_06be::
    xor a
    ret


    ld a, [$c88c]
    cp $00
    ret z

    ld a, $01
    ld [$c88e], a
    xor a
    ld [$c88c], a
    callx @+$ff75
    ld a, [$c877]
    or $80
    ld e, a
    ld bc, $0502
    callx @+$faed
    ld hl, $0904
    trap DrawAt
    callx @+$ff48
    ld e, a
    ld d, $00
    ld hl, $c8c7
    trap StrConvInt
    trap DrawString
    callx @+$ff13
    callx @+$ff41
    cp $16
    jr nc, jr_000_071f

    ld b, a
    ld a, [$c86a]
    cp $16
    jr nc, jr_000_0723

    sub b
    jr c, jr_000_0723

    jr nz, jr_000_079a

    jx @+$011a


jr_000_071f:
    jx @+$007a


jr_000_0723::
    ld a, [$0014]
    cp $01
    jr nz, jr_000_072e

    ld a, $37
    trap AudioPlaySound

jr_000_072e::
    ld a, $01
    ld [$c88d], a
    ld hl, $0506
    trap DrawAt
    ldx hl, data_0b61
    trap DrawString
    ld a, [$c88f]
    cp $01
    jr nz, jr_000_074e

    ld a, [$c8ce]
    ld b, a
    sra a
    add b
    jr jr_000_0751

jr_000_074e::
    ld a, [$c8ce]

jr_000_0751::
    ld h, $00
    ld l, a
    push hl
    push af
    cp $63
    jr c, jr_000_075f

    ld hl, $0c09
    jr jr_000_0762

jr_000_075f::
    ld hl, $0d09

jr_000_0762::
    trap DrawAt
    pop af
    ld e, a
    ld d, $00
    ld hl, $c8c7
    trap StrConvInt
    trap DrawString
    ldx hl, data_0a83
    trap DrawString
    ld hl, $0309
    trap DrawAt
    ldx hl, data_0a9d
    trap DrawString
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
    callx @+$00d2
    ret


jr_000_079a::
    ld a, [$0014]
    cp $01
    jr nz, jr_000_07a5

    ld a, $2f
    trap AudioPlaySound

jr_000_07a5::
    xor a
    ld [$c88d], a
    ld hl, $0009
    trap DrawAt
    ldx hl, data_0b4c
    trap DrawString
    ld hl, $0506
    trap DrawAt
    ldx hl, data_0b6c
    trap DrawString
    ld a, [$c8ce]
    ld h, $00
    ld l, a
    ld a, [$c8cf]
    ld e, a
    ld a, [$c8d0]
    ld d, a
    trap $88
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

jr_000_07e2::
    ld a, l
    ld [$c8cf], a
    callx @+$007e
    ret


jr_000_07ee::
    callx @+$0076
    ld a, $78
    trap $dc
    ld a, $78
    trap $dc
    ld a, [$0014]
    cp $01
    jr nz, jr_000_0808

    ld a, $19
    trap AudioPlayMusic

jr_000_0808::
    xor a
    trap DrawInit
    ld hl, $0409
    trap DrawAt
    ldx hl, data_0b9d
    trap DrawString
    ld hl, $040b
    trap DrawAt
    ldx hl, data_0baa
    trap DrawString
    ld hl, $c600
    trap $ef
    ld a, $78
    trap $dc
    ld a, $78
    trap $dc
    ld a, $78
    trap $dc
    jx @+$f81a


    ld a, [$c88f]
    cp $01
    jr nz, jr_000_0841

    jx @+$fee5


jr_000_0841::
    ld a, [$0014]
    cp $01
    jr nz, jr_000_084c

    ld a, $2f
    trap AudioPlaySound

jr_000_084c::
    ld a, $02
    ld [$c88d], a
    ld hl, $0009
    trap DrawAt
    ldx hl, data_0b4c
    trap DrawString
    ld hl, $0506
    trap DrawAt
    ldx hl, data_0b77
    trap DrawString
    ret


    ld a, $0a
    ld [$0000], a
    ld bc, $0002
    ld de, $c8cf
    ldx hl, data_0a80
    trap MemCopy
    xor a
    ld [$0000], a
    ld hl, $030a
    trap DrawAt
    ldx hl, data_0a77
    trap DrawString
    ld a, [$c8cf]
    ld e, a
    ld a, [$c8d0]
    ld d, a
    ld hl, $c8c7
    trap StrConvInt
    trap DrawString
    ldx hl, data_0a83
    trap DrawString
    ret


    ld a, [$c88e]
    cp $00
    ret z

    ld hl, $0506
    trap DrawAt
    callx @+$fd41
    cp $00
    jr nz, jr_000_08d5

    ld a, [$c88d]
    cp $00
    jr z, jr_000_08c7

    cp $02
    jr z, jr_000_08cf

    ldx hl, data_0b61
    trap DrawString
    jr jr_000_08df

jr_000_08c7::
    ldx hl, data_0b6c
    trap DrawString
    jr jr_000_08df

jr_000_08cf::
    ldx hl, data_0b77
    trap DrawString

jr_000_08d5::
    cp $0f
    jr nz, jr_000_08df

    ldx hl, data_0b4c
    trap DrawString

jr_000_08df::
    ld hl, $0507
    trap DrawAt
    ldx hl, data_0abe
    trap DrawString
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

jr_000_0912::
    ld e, $00
    ld bc, $0018
    ld hl, $c869
    trap MemSet
    ld hl, $0506
    trap DrawAt
    ldx hl, data_0b4c
    trap DrawString
    ld hl, $0507
    trap DrawAt
    ldx hl, data_0a87
    trap DrawString
    callx @+$f8fd
    ret


jr_000_093a::
    jx @+$027d


data_093e:
    INCBIN "gfx/bj/tiles.2bpp.hz"

data_0a5f:
    dh "BLACK JACK\0"
data_0a6a:
    dh "PUSH A START\0"
data_0a77:
    dh "PLAYER  \0"
data_0a80:
    db $b8, $0b, $00
data_0a83:
    dh "P  \0"
data_0a87:
    dh "PLEASE BET\0"
data_0a92:
    dh "BET POINT \0"
data_0a9d:
    dh "GET POINT \0"
data_0aa8:
    dh "   OK ?   \0"
data_0ab3:
    dh "HIT CARD ?\0"
data_0abe:
    dh "  RETRY?  \0"
data_0ac9:
    ds 81, " "
    dh "\0"
data_0b1b:
    dh "    + -> UP DOWN", $0d
    dh "    A -> OK HIT", $0d
    dh "    B -> CANCEL\0"
data_0b4c:
    dh "                    \0"
data_0b61:
    dh " YOU WIN! \0"
data_0b6c:
    dh " YOU LOST \0"
data_0b77:
    dh "DRAW GAME!\0"
data_0b82:
    dh ">YES  NO\0"
data_0b8b:
    dh " YES >NO\0"
data_0b94:
    dh " BURST! \0"
data_0b9d:
    dh "　あなた　の　まけです\0"
data_0baa:
    dh "このげーむ　は　きえます\0"


jx_0bb8:
    ld sp, $e000
    pushx @+$0006

jr_000_0bbe::
    jx @+$f493


    ld hl, $0409
    trap DrawAt

jr_000_0bc7::
    ldx hl, data_0a6a
    trap DrawString

jr_000_0bcd::
    trap AwaitFrame

jr_000_0bcf::
    trap InputButtons
    ld [$c881], a
    cp $04
    jr z, jr_000_0c28

jr_000_0bd8::
    cp $02
    jr nz, jr_000_0be3

    callx @+$fa1d

jr_000_0be3:
    ld a, [$c883]

jr_000_0be6::
    inc a
    ld [$c883], a
    xor a
    ld [$c887], a
    callx @+$f51b
    callx @+$f690
    callx @+$fc9e
    callx @+$fab9
    callx @+$f82a
    callx @+$f7be
    callx @+$f962
    callx @+$f48f
    jr jr_000_0bcd

jr_000_0c28::
    callx @+$f421
