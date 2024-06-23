; Disassembly of "blackjack.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
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
    dw 20
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
    trap $02
    jx @+$0b6e


    xor a
    trap PlayMusic
    trap ExitToMenu
    ld a, $20
    trap DrawInit
    trap StopAudio
    callx @+$0035
    callx @+$0023
    callx @+$003a
    ld a, $0a
    ld [$c8ce], a
    ld a, $01
    ld [$c882], a
    ld a, $03
    trap $b4
    ld a, [$0014]
    cp $01
    ret nz

    ld a, $05
    trap PlayMusic
    ret


    ld e, $00
    ld bc, $00d1
    ld hl, $c800
    trap $a6
    ret


    ldx de, @+$08ac
    ld hl, $c700
    ld b, h
    trap InitDecompress
    ld bc, $0270
    ld de, $8b10
    trap RunDecompress
    ret


    ldx hl, @+$09db
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
    trap $a6
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
    trap MoveCursor
    ld a, [$c886]
    cp $01
    jr nz, jr_000_0137

    ldx hl, @+$0a51
    trap DrawString
    ret


jr_000_0137:
    ldx hl, @+$0a53
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
    trap MoveCursor
    ldx hl, @+$09ab
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
    trap MoveCursor
    ldx hl, @+$098c
    trap DrawString
    ld a, [$0014]
    cp $01
    ret nz

    ld a, $01
    trap PlaySound
    ret


    ld l, c
    ld h, b
    trap MoveCursor
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
    trap MoveCursor
    ldx hl, @+$0890
    trap DrawString
    ld hl, $000d
    trap MoveCursor
    ldx hl, @+$0885
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
    trap MoveCursor
    ldx hl, @+$08d2
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
    trap MoveCursor
    ld a, [$c8ce]
    ld e, a
    ld d, $00
    ld hl, $c8c7
    trap IntToString
    trap DrawString
    ldx hl, @+$07c2
    trap DrawString
    ld hl, $0309
    trap MoveCursor
    ldx hl, @+$07c6
    trap DrawString
    ld hl, $030a
    trap MoveCursor
    ldx hl, @+$07a0
    trap DrawString
    ld a, [$c8cf]
    ld e, a
    ld a, [$c8d0]
    ld d, a
    ld hl, $c8c7
    trap IntToString
    trap DrawString
    ldx hl, @+$0797
    trap DrawString
    ld hl, $0507
    trap MoveCursor
    callx @+$02f4
    cp $00
    jr nz, jr_000_0308

    ldx hl, @+$0785
    trap DrawString
    ret


jr_000_0308::
    cp $0f
    ret nz

    ldx hl, @+$0840
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
    trap PlaySound

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
    trap PlaySound
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
    trap PlaySound

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
    trap MoveCursor
    ldx hl, @+$0639
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
    trap MoveCursor
    callx @+$01a2
    cp $00
    jr nz, jr_000_045d

    ldx hl, @+$065f
    trap DrawString
    jx @+$000d


jr_000_045d::
    cp $0f
    jr nz, jr_000_0467

    ldx hl, @+$06ea
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
    trap MoveCursor
    ldx hl, @+$06ef
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
    trap IntToString
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
    trap MoveCursor
    ldx hl, @+$04e7
    trap DrawString
    callx @+$fc8a
    ld a, [$0014]
    cp $01
    ret nz

    ld a, $01
    trap PlaySound
    ret


jr_000_05b7::
    ld hl, $0507
    trap MoveCursor
    ldx hl, @+$04a2
    trap DrawString
    ld hl, $000d
    trap MoveCursor
    ldx hl, @+$0553
    trap DrawString
    ld hl, $0409
    trap MoveCursor
    callx @+$0018
    cp $00
    jr nz, jr_000_05e4

    ldx hl, @+$048c
    trap DrawString
    ret


jr_000_05e4::
    cp $0f
    ret nz

    ldx hl, @+$0564
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
    trap IntToString
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
    trap MoveCursor
    ldx hl, @+$03a9
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
    trap MoveCursor
    callx @+$ff48
    ld e, a
    ld d, $00
    ld hl, $c8c7
    trap IntToString
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
    trap PlaySound

jr_000_072e::
    ld a, $01
    ld [$c88d], a
    ld hl, $0506
    trap MoveCursor
    ldx hl, @+$0428
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
    trap MoveCursor
    pop af
    ld e, a
    ld d, $00
    ld hl, $c8c7
    trap IntToString
    trap DrawString
    ldx hl, @+$0313
    trap DrawString
    ld hl, $0309
    trap MoveCursor
    ldx hl, @+$0322
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
    trap PlaySound

jr_000_07a5::
    xor a
    ld [$c88d], a
    ld hl, $0009
    trap MoveCursor
    ldx hl, @+$039d
    trap DrawString
    ld hl, $0506
    trap MoveCursor
    ldx hl, @+$03b2
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
    trap PlayMusic

jr_000_0808::
    xor a
    trap DrawInit
    ld hl, $0409
    trap MoveCursor
    ldx hl, @+$038c
    trap DrawString
    ld hl, $040b
    trap MoveCursor
    ldx hl, @+$038e
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
    trap PlaySound

jr_000_084c::
    ld a, $02
    ld [$c88d], a
    ld hl, $0009
    trap MoveCursor
    ldx hl, @+$02f5
    trap DrawString
    ld hl, $0506
    trap MoveCursor
    ldx hl, @+$0315
    trap DrawString
    ret


    ld a, $0a
    ld [$0000], a
    ld bc, $0002
    ld de, $c8cf
    ldx hl, @+$020c
    trap $02
    xor a
    ld [$0000], a
    ld hl, $030a
    trap MoveCursor
    ldx hl, @+$01f4
    trap DrawString
    ld a, [$c8cf]
    ld e, a
    ld a, [$c8d0]
    ld d, a
    ld hl, $c8c7
    trap IntToString
    trap DrawString
    ldx hl, @+$01eb
    trap DrawString
    ret


    ld a, [$c88e]
    cp $00
    ret z

    ld hl, $0506
    trap MoveCursor
    callx @+$fd41
    cp $00
    jr nz, jr_000_08d5

    ld a, [$c88d]
    cp $00
    jr z, jr_000_08c7

    cp $02
    jr z, jr_000_08cf

    ldx hl, @+$02a1
    trap DrawString
    jr jr_000_08df

jr_000_08c7::
    ldx hl, @+$02a4
    trap DrawString
    jr jr_000_08df

jr_000_08cf::
    ldx hl, @+$02a7
    trap DrawString

jr_000_08d5::
    cp $0f
    jr nz, jr_000_08df

    ldx hl, @+$0272
    trap DrawString

jr_000_08df::
    ld hl, $0507
    trap MoveCursor
    ldx hl, @+$01d9
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
    trap $a6
    ld hl, $0506
    trap MoveCursor
    ldx hl, @+$022a
    trap DrawString
    ld hl, $0507
    trap MoveCursor
    ldx hl, @+$015a
    trap DrawString
    callx @+$f8fd
    ret


jr_000_093a::
    jx @+$027d


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

jr_000_099c::
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

jr_000_09b8::
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

jr_000_09d6::
    adc c
    nop
    rla

jr_000_09d9::
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

jr_000_0a51::
    jr jr_000_0a53

jr_000_0a53::
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

jr_000_0a9d::
    ld b, a
    ld b, l

jr_000_0a9f::
    ld d, h
    jr nz, @+$52

    ld c, a
    ld c, c
    ld c, [hl]
    ld d, h

jr_000_0aa6::
    jr nz, jr_000_0aa8

jr_000_0aa8::
    jr nz, @+$22

    jr nz, jr_000_0afb

    ld c, e
    jr nz, @+$41

    jr nz, jr_000_0ad1

jr_000_0ab1::
    jr nz, jr_000_0ab3

jr_000_0ab3::
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

jr_000_0ac5::
    ccf
    jr nz, @+$22

    nop
    jr nz, jr_000_0aeb

    jr nz, jr_000_0aed

    jr nz, jr_000_0aef

    jr nz, jr_000_0af1

jr_000_0ad1::
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

jr_000_0ae7::
    jr nz, jr_000_0b09

    jr nz, jr_000_0b0b

jr_000_0aeb::
    jr nz, jr_000_0b0d

jr_000_0aed::
    jr nz, jr_000_0b0f

jr_000_0aef::
    jr nz, jr_000_0b11

jr_000_0af1::
    jr nz, jr_000_0b13

jr_000_0af3::
    jr nz, jr_000_0b15

jr_000_0af5::
    jr nz, jr_000_0b17

jr_000_0af7::
    jr nz, jr_000_0b19

jr_000_0af9::
    jr nz, jr_000_0b1b

jr_000_0afb::
    jr nz, jr_000_0b1d

jr_000_0afd::
    jr nz, jr_000_0b1f

jr_000_0aff::
    jr nz, @+$22

jr_000_0b01::
    jr nz, @+$22

jr_000_0b03::
    jr nz, jr_000_0b25

jr_000_0b05::
    jr nz, @+$22

jr_000_0b07::
    jr nz, jr_000_0b29

jr_000_0b09::
    jr nz, jr_000_0b2b

jr_000_0b0b::
    jr nz, @+$22

jr_000_0b0d::
    jr nz, @+$22

jr_000_0b0f::
    jr nz, jr_000_0b31

jr_000_0b11::
    jr nz, jr_000_0b33

jr_000_0b13::
    jr nz, jr_000_0b35

jr_000_0b15::
    jr nz, jr_000_0b37

jr_000_0b17::
    jr nz, jr_000_0b39

jr_000_0b19::
    jr nz, jr_000_0b1b

jr_000_0b1b::
    jr nz, @+$22

jr_000_0b1d::
    jr nz, @+$22

jr_000_0b1f::
    dec hl
    jr nz, @+$2f

    ld a, $20
    ld d, l

jr_000_0b25::
    ld d, b
    jr nz, jr_000_0b6c

    ld c, a

jr_000_0b29::
    ld d, a
    ld c, [hl]

jr_000_0b2b::
    dec c
    jr nz, jr_000_0b4e

    jr nz, jr_000_0b50

    ld b, c

jr_000_0b31::
    jr nz, jr_000_0b60

jr_000_0b33::
    ld a, $20

jr_000_0b35::
    ld c, a
    ld c, e

jr_000_0b37::
    jr nz, @+$4a

jr_000_0b39::
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

jr_000_0b4e::
    jr nz, jr_000_0b70

jr_000_0b50::
    jr nz, jr_000_0b72

    jr nz, jr_000_0b74

    jr nz, @+$22

    jr nz, jr_000_0b78

    jr nz, jr_000_0b7a

    jr nz, @+$22

    jr nz, jr_000_0b7e

jr_000_0b5e::
    jr nz, jr_000_0b80

jr_000_0b60::
    nop
    jr nz, @+$5b

    ld c, a
    ld d, l
    jr nz, jr_000_0bbe

    ld c, c
    ld c, [hl]
    ld hl, $0020

jr_000_0b6c::
    jr nz, jr_000_0bc7

jr_000_0b6e::
    ld c, a
    ld d, l

jr_000_0b70::
    jr nz, jr_000_0bbe

jr_000_0b72::
    ld c, a
    ld d, e

jr_000_0b74::
    ld d, h
    jr nz, jr_000_0b77

jr_000_0b77::
    ld b, h

jr_000_0b78::
    ld d, d
    ld b, c

jr_000_0b7a::
    ld d, a
    jr nz, @+$49

    ld b, c

jr_000_0b7e::
    ld c, l
    ld b, l

jr_000_0b80::
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
    trap $bd
    nop
    ld sp, $e000
    pushx @+$0006

jr_000_0bbe::
    jx @+$f493


    ld hl, $0409
    trap MoveCursor

jr_000_0bc7::
    ldx hl, @+$fea2
    trap DrawString

jr_000_0bcd::
    trap AwaitFrame

jr_000_0bcf::
    trap $d8
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

End:
