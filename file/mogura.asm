; Disassembly of "mogutte-nanbo.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw End
    db kFileHasIcon2bpp + kFileMarkerDiamond + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db Points - @ - 1          ; length of variable parts of header
    db $65                     ; owner code

Title::
    dh "モグってナンボ"
Icon::
    INCBIN "gfx/mogura/icon.2bpp"

Points::
    dw 1
Author::
    db "TEAMMOGURA", 2
History::
    ds 11
    ds 11
    ds 11

Main::
    ld sp, $dff0

jr_000_0103::
    call $a2f5
    call $a438
    ld a, [$c65d]
    ld [$c64a], a
    call $a6db
    call $aec4
    jr jr_000_0103

    trap $b5
    ld a, $0c
    trap $b9
    xor a
    ld d, a
    ld h, a
    ld l, a
    call $b2a6
    ld a, $03
    trap $b4
    call $a328
    ld hl, $0902
    trap MoveCursor
    ld hl, $b754
    trap DrawString
    ld hl, $0410
    trap MoveCursor
    ld hl, $b876
    trap DrawString

HeaderManufacturerCode::
    ld hl, $0301
    trap MoveCursor
    ld hl, $b735
    trap DrawString
    ld a, $02
    ld [$d026], a
    ld a, $1e
    ld [$d027], a
    ld a, [$d026]
    cp $02
    jr nz, jr_000_017a

    ld a, $00
    ld d, $08
    ld hl, $2428
    call $b246
    ld a, $04
    ld d, $10
    ld hl, $2450
    call $b246
    ld a, $08
    ld d, $18
    ld hl, $2478
    call $b246
    jr jr_000_01b6

jr_000_017a::
    cp $00
    jr nz, jr_000_0198

    ld a, $00
    ld hl, $0000
    call $b246
    ld a, $04
    ld hl, $0000
    call $b246
    ld a, $08
    ld hl, $0000
    call $b246
    jr jr_000_01b6

jr_000_0198::
    ld a, $00
    ld d, $08
    ld hl, $2430
    call $b27c
    ld a, $04
    ld d, $10
    ld hl, $2458
    call $b27c
    ld a, $08
    ld d, $18
    ld hl, $2480
    call $b27c

jr_000_01b6::
    ld a, [$d027]
    dec a
    ld [$d027], a
    jr nz, jr_000_01ed

    ld a, $1e
    ld [$d027], a
    ld a, [$d026]
    cp $00
    jr nz, jr_000_01d2

    ld a, $04
    ld [$d026], a
    jr jr_000_01ed

jr_000_01d2::
    cp $01
    jr nz, jr_000_01dd

    ld a, $00
    ld [$d026], a
    jr jr_000_01ed

jr_000_01dd::
    cp $04
    jr nz, jr_000_01e8

    ld a, $02
    ld [$d026], a
    jr jr_000_01ed

jr_000_01e8::
    ld a, $01
    ld [$d026], a

jr_000_01ed::
    trap AwaitFrame
    ldh a, [$8a]
    and a
    jp z, $a15b

    ret


    ld a, $00
    ld d, $20
    ld l, $50
    call $a212
    ret


    ld a, $00
    ld d, $2c
    ld l, $50
    call $a212
    ret


    push af
    push de
    ld b, $3c
    ld c, $a0
    call $a29b
    add $04
    push af
    ld a, d
    add $04
    ld d, a
    pop af
    ld b, $4c
    ld c, $a0
    call $a29b
    add $04
    push af
    ld a, d
    add $04
    ld d, a
    pop af
    ld b, $5c
    ld c, $a0
    call $a29b
    ld b, $14

jr_000_0233::
    trap AwaitFrame
    dec b
    jr nz, jr_000_0233

    pop de
    pop af
    ld b, $f0
    ld c, $3c
    call $a29b
    add $04
    push af
    ld a, d
    add $04
    ld d, a
    pop af
    ld b, $f0
    ld c, $4c
    call $a29b
    add $04
    push af
    ld a, d
    add $04
    ld d, a
    pop af
    ld b, $f0
    ld c, $5c
    call $a29b
    ret


    pop af
    ld b, a

jr_000_0262::
    push bc
    trap AwaitFrame
    ld h, $40
    push af
    push de
    push hl
    call $b246
    pop hl
    pop de
    pop af
    add $04
    ld h, $50
    push af
    push de
    push hl
    call $b246
    pop hl
    pop de
    pop af
    add $04
    ld h, $60
    push de
    push hl
    call $b246
    pop hl
    pop de
    ld a, l
    add $04
    ld l, a
    cp $a4
    pop bc
    ld a, b
    jr nz, jr_000_0262

    ret


    ld h, c
    push af

jr_000_0295::
    trap AwaitFrame
    pop af
    push af
    push bc
    push de
    push hl
    call $b246
    pop hl
    pop de
    pop bc
    ld a, h
    sub $04
    ld h, a
    cp b
    jr nz, jr_000_0295

    pop af
    ret


    ld h, $a0

jr_000_02ad::
    ld l, $50
    ld a, $00
    ld d, $38
    push hl
    call $a2cb
    trap AwaitFrame
    pop hl
    ld a, h
    dec a
    dec a
    cp $d0
    ld h, a
    jr nz, jr_000_02ad

    ret


    push af
    push de
    push hl
    call $b246
    pop hl
    ld a, h
    add $10
    ld h, a
    pop de
    ld a, d
    add $04
    ld d, a
    pop af
    add $04
    push af
    push de
    push hl
    call $b246
    pop hl
    ld a, h
    add $10
    ld h, a
    pop de
    ld a, d
    add $04
    ld d, a
    pop af
    add $04
    call $b246
    ret


    call $a316
    call $a328
    call $a334
    call $a340
    call $a341
    call $b2d2
    call $a419
    trap StopAudio
    ld hl, $04bc
    trap $cb
    xor a
    ld [$c65c], a
    ret


    xor a
    set 7, a
    ld c, $01
    ld b, $05
    ld e, $11
    ld d, $0a
    trap DrawInit
    ld a, $03
    trap $b4
    ret


    ld hl, $8000
    ld de, $b2e9
    ld bc, $0440
    trap $02
    ret


    ld hl, $03e8
    ld a, l
    ld [$c600], a
    ld a, h
    ld [$c601], a
    ret


    ret


    ld hl, $c602
    ld de, $a34d
    ld bc, $0042
    trap $02
    ret


    nop
    nop
    add c
    ld h, [hl]
    add c
    ld e, [hl]
    add c
    ld d, [hl]
    add c
    ld b, [hl]
    nop
    nop
    nop
    ld l, c
    ld [hl], e
    ld l, c
    ld l, e
    ld l, c
    ld h, e
    ld l, c
    ld d, e
    nop
    nop
    nop
    ld c, l
    ld l, c
    ld c, l
    ld h, c
    ld c, l
    ld e, c
    ld c, l
    ld c, c
    nop
    nop
    nop
    rla
    ld l, d
    rla
    ld h, d
    rla
    ld e, h
    rla
    ld c, h
    nop
    nop
    nop
    ld [hl-], a
    ld h, b
    ld [hl-], a
    ld e, b
    ld [hl-], a
    ld d, b
    ld [hl-], a
    ld b, b
    nop
    nop
    nop
    ld [hl-], a
    ld [hl], l
    ld [hl-], a
    ld l, l
    ld [hl-], a
    ld h, l
    ld [hl-], a
    ld d, l
    nop
    ld hl, $8800
    ld de, $b729
    ld bc, $0b40
    trap $02
    ret


    ld a, [$c64a]
    cp $00
    jr nz, jr_000_03b5

    ld a, $23
    ld [$c644], a
    ld a, $0a
    ld [$c645], a
    ld a, $01
    ld [$c646], a
    ld a, $0f
    ld [$c647], a
    ld a, $14
    ld [$c648], a
    jr jr_000_03ed

jr_000_03b5::
    cp $01
    jr nz, jr_000_03d4

    ld a, $14
    ld [$c644], a
    ld a, $0a
    ld [$c645], a
    ld a, $01
    ld [$c646], a
    ld a, $0c
    ld [$c647], a
    ld a, $0a
    ld [$c648], a
    jr jr_000_03ed

jr_000_03d4::
    ld a, $0a
    ld [$c644], a
    ld a, $0a
    ld [$c645], a
    ld a, $01
    ld [$c646], a
    ld a, $0c
    ld [$c647], a
    ld a, $08
    ld [$c648], a

jr_000_03ed::
    ret


    ld a, $00
    ld [$c64b], a
    ld [$c64c], a
    ret


    ld a, [$c64c]
    ld l, a
    ld a, [$c64d]
    ld h, a
    inc hl
    ld a, l
    ld [$c64c], a
    ld a, h
    ld [$c64d], a
    trap RandInit
    ret


    ld a, $14
    ld [$c652], a
    ret


    ld hl, $c500
    ld a, [hl+]
    or [hl]
    jr z, jr_000_0424

    ld de, $c660
    ld hl, $c500
    ld bc, $09c4
    trap $eb
    ret


jr_000_0424::
    ld hl, $c660
    ld de, $b886
    ld bc, $09c4
    trap $02
    ret


    xor a
    trap DrawInit
    ld hl, $0601
    trap MoveCursor
    ld hl, $a64f
    trap DrawString
    ld hl, $0003
    trap MoveCursor
    ld hl, $a65c
    trap DrawString
    ld hl, $0606
    trap MoveCursor
    ld hl, $a6a0
    trap DrawString
    ld hl, $0808
    trap MoveCursor
    ld hl, $a6ac
    trap DrawString
    ld hl, $080a
    trap MoveCursor
    ld hl, $a6b2
    trap DrawString
    ld hl, $080c
    trap MoveCursor
    ld hl, $a6b7
    trap DrawString
    ld hl, $080e
    trap MoveCursor
    ld hl, $a6bf
    trap DrawString
    ld a, $03
    trap $b4
    ld hl, $8000
    ld bc, $0010
    ld de, $a6cb
    trap $02
    ld hl, $c300
    ld a, [$c65d]
    sla a
    sla a
    sla a
    sla a
    add $50
    ld [hl+], a
    ld a, $40
    ld [hl+], a
    ld a, $00
    trap RandNext
    trap $d8
    bit 2, a
    jp nz, $a571

    bit 0, a
    jr nz, jr_000_04ce

    bit 6, a
    jr nz, jr_000_04b6

    bit 7, a
    jr nz, jr_000_04c2

    jp $a4a8


jr_000_04b6::
    ld a, [$c65d]
    dec a
    and $03
    ld [$c65d], a
    jp $a490


jr_000_04c2::
    ld a, [$c65d]
    inc a
    and $03
    ld [$c65d], a
    jp $a490


jr_000_04ce::
    ld a, [$c65d]
    cp $03
    jr z, jr_000_04f3

    ld c, $0a

jr_000_04d7::
    push bc
    ld hl, $0003
    trap MoveCursor
    ld hl, $a686
    trap DrawString
    trap AwaitFrame
    ld hl, $0003
    trap MoveCursor
    ld hl, $a671
    trap DrawString
    pop bc
    dec c
    jr nz, jr_000_04d7

    ret


jr_000_04f3::
    call $a11f
    jp $a438


    xor a
    trap DrawInit
    ld hl, $0001
    trap MoveCursor
    ld hl, $a573
    trap DrawString
    ld hl, $0002
    trap MoveCursor
    ld hl, $a586
    trap DrawString
    ld hl, $0003
    trap MoveCursor
    ld hl, $a59c
    trap DrawString
    ld hl, $0005
    trap MoveCursor
    ld hl, $a5b4
    trap DrawString
    ld hl, $0007
    trap MoveCursor
    ld hl, $a5ca
    trap DrawString
    ld hl, $0008
    trap MoveCursor
    ld hl, $a5e1
    trap DrawString
    ld hl, $000a
    trap MoveCursor
    ld hl, $a5f4
    trap DrawString
    ld hl, $000b
    trap MoveCursor
    ld hl, $a60f
    trap DrawString
    ld hl, $000d
    trap MoveCursor
    ld hl, $a628
    trap DrawString
    ld hl, $000e
    trap MoveCursor
    ld hl, $a63c
    trap DrawString

jr_000_0560::
    ldh a, [$8a]
    and a
    jp nz, $a438

    jr jr_000_0560

    ret


    trap ExitToMenu
    ld c, $20
    jr nz, @+$22

    jr nz, @-$2b

    cp b
    sbc $d7
    rrca
    ret nz

    pop bc
    and [hl]
    ret nz

    ret nz

    cp b
    add $ca
    nop
    rrca
    jr nz, jr_000_05a1

    jr nz, @-$48

    sbc $d2
    db $dd
    ret


    push bc
    or [hl]
    ret


    and h
    or c
    push bc
    call nz, $c5b5
    cp h

jr_000_0591::
    sbc $20

jr_000_0593::
    nop
    rrca
    jr nz, jr_000_05b7

    jp z, $bcde

    xor [hl]
    ret


    ld c, $ce
    sbc $c0
    db $dd

jr_000_05a1::
    rrca
    and [hl]
    or l
    cp h
    jp $c0b8


    sbc $bb
    or d
    nop
    ld c, $20
    jr nz, jr_000_05d0

    or l
    call nc, $debc
    rrca
    and [hl]
    ret nz

jr_000_05b7::
    ret nz

    cp b
    call nz, $0ea4
    adc $de
    or b
    push bc
    cp l
    nop
    ld c, $20
    jr nz, jr_000_0591

jr_000_05c6::
    sub $ba
    rrca
    and [hl]
    ret nz

    ret nz

    cp b
    call nz, $0ea4

jr_000_05d0::
    trap $b2
    push bc
    cp l
    rrca
    ret


    or e
    or h
    nop
    rrca
    jr nz, jr_000_05fc

    jr nz, jr_000_05fe

    jr nz, jr_000_0593

jr_000_05e0::
    cp d
    sbc $b9
    push bc
    cp b
    push bc
    xor a
    pop bc
    xor h
    or e
    sub $00
    ld c, $20
    db $d3
    cp b
    sbc $d7
    rrca
    and [hl]
    jp c, $bfdd

    sbc $b8
    jp $c0de


jr_000_05fc::
    ret nz

    cp b

jr_000_05fe::
    call nz, $caa4
    sbc $b2
    jp z, $b2de

    nop
    ld c, $c1
    xor h
    db $dd
    cp l
    ld hl, $0f21
    jr nz, jr_000_05c6

    jp $b7c2


    jp z, $0ea4

    trap $b2
    push bc
    cp l
    rrca
    ret nz

    sbc $d6
    nop
    rrca
    jr nz, jr_000_0643

    jr nz, jr_000_05e0

    or c
    ld hl, $b2be
    cp c
    sbc $dd
    cp h
    sbc $b6
    db $dd
    push bc
    or d
    add $00
    rrca
    jr nz, jr_000_0657

    jr nz, jr_000_0659

    cp d
    or e
    call nz, $c3b8
    db $dd
    and [hl]
    jp nc, $debb

jr_000_0643::
    cp [hl]
    ld hl, $0021
    ld c, $d3
    cp b
    sbc $0f
    xor a
    jp $c50e


    db $dd
    adc $de
    nop
    ld c, $50
    ld [hl], l

jr_000_0657::
    ld [hl], e
    ld l, b

jr_000_0659::
    jr nz, @+$43

    jr nz, jr_000_06d1

    ld l, a

jr_000_065e::
    jr nz, @+$72

    ld l, h
    ld h, c
    ld a, c
    jr nz, @+$49

    ld b, c
    ld c, l
    ld b, l
    nop
    ld c, $20
    jr nz, jr_000_068d

    jr nz, jr_000_068f

    jr nz, jr_000_0691

    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_000_0697

    jr nz, @+$22

    jr nz, jr_000_069b

    jr nz, @+$22

    nop
    rrca
    jr nz, @+$22

    cp e
    or c
    jr nz, jr_000_06a5

    or [hl]
    sbc $dd
    jp z, $dbde

    or e
    cp [hl]

jr_000_068d::
    sbc $0e

jr_000_068f::
    jr nz, jr_000_06b1

jr_000_0691::
    call $b2de
    call $b0de

jr_000_0697::
    nop
    ld c, $d3
    or b

jr_000_069b::
    call nz, $20de
    jr nz, jr_000_065e

    jp c, $c4b8

    nop
    rrca

jr_000_06a5::
    call nc, $bcbb
    or d
    nop
    rrca
    call z, $b3c2
    nop
    rrca
    pop de

jr_000_06b1::
    cp l
    sbc $d1
    cp l
    sbc $00
    ld c, $b7
    xor h
    pushx @+$bc0f
    xor [hl]
    or e
    or [hl]
    or d
    nop
    nop
    nop
    nop
    ld [$7c08], sp
    ld a, h
    cp $82
    cp $aa
    cp $aa
    cp $82

jr_000_06d1::
    ld a, h
    ld a, h
    call $a71f

jr_000_06d6::
    call $b2da
    ld [$d024], a
    xor a

jr_000_06dd::
    push af
    call $a9a2
    pop af
    inc a
    cp $06
    jr nz, jr_000_06dd

    call $ab86
    call $a8ab
    call $a813
    call $a84c
    call $a7d4
    ld a, [$c600]
    ld l, a
    ld a, [$c601]
    ld h, a
    ld a, h
    or l
    jp z, $a76c

    ld de, $fed4
    add hl, de
    ld a, h
    or l
    jr nz, jr_000_070f

    ld a, $0c
    trap PlayMusic

jr_000_070f::
    call $a87d
    call $a8a1
    jr jr_000_06d6

    call $a316
    ld de, $c660
    ld bc, $0aa0
    call $b2bc
    call $a328
    ld a, $0c
    ld h, $50
    ld l, $50
    ld d, $00
    call $b246
    ld a, $06
    ld [$c649], a
    call $a39b
    call $a3f6
    call $a413
    xor a
    ld [$c65c], a
    ld [$c654], a
    ld [$c653], a
    ld [$c651], a
    ld [$c650], a
    ld [$c65f], a
    ld a, $1d
    trap PlaySound
    call $a1fe

jr_000_0759::
    trap GetSoundState
    cp $01
    jr z, jr_000_0759

    ld a, $09
    trap PlayMusic
    ret


    xor a
    trap PlayMusic
    ld a, $1e
    trap PlaySound
    call $a208

jr_000_076e::
    trap GetSoundState
    cp $01
    jr z, jr_000_076e

    ld a, $00
    trap PlaySound
    ld a, [$c65d]
    cp $01
    jr z, jr_000_078d

    cp $02
    jr z, jr_000_0797

    ld a, [$b240]
    ld l, a
    ld a, [$b241]
    ld h, a
    jr jr_000_079f

jr_000_078d::
    ld a, [$b242]
    ld l, a
    ld a, [$b243]
    ld h, a
    jr jr_000_079f

jr_000_0797::
    ld a, [$b244]
    ld l, a
    ld a, [$b245]
    ld h, a

jr_000_079f::
    ld a, [$c64b]
    ld c, a
    ld a, [$c64c]
    ld b, a
    ld a, h
    sub $80
    ld h, a
    ld a, b
    sub $80
    ld b, a
    ld a, l
    sub c
    ld l, a
    ld a, h
    sbc b
    ld h, a
    jr nc, jr_000_07c4

jr_000_07b7::
    trap GetSoundState
    cp $01
    jr z, jr_000_07b7

    ld a, $1f
    trap PlaySound
    call $a2b3

jr_000_07c4::
    call $b2da
    bit 0, a
    jr z, jr_000_07c4

    ret


    ld a, $06
    trap $b9
    ld hl, $0802
    trap MoveCursor
    ld hl, $a80d
    trap DrawString
    ld a, [$c600]
    ld l, a
    ld a, [$c601]
    ld h, a
    dec hl
    ld a, l
    ld e, a
    ld [$c600], a
    ld a, h
    ld d, a
    ld [$c601], a
    ld hl, $c655
    trap IntToString
    push hl
    trap $68
    ld a, $14
    sub l
    ld h, a
    ld l, $02
    trap MoveCursor
    pop hl
    trap DrawString
    ld a, $07
    trap $b9
    ret


    jr nz, jr_000_085b

    ld c, c
    ld c, l
    ld b, l
    nop
    ld a, $06
    trap $b9
    ld hl, $0800
    trap MoveCursor
    ld hl, $a842
    trap DrawString
    ld a, [$c64b]
    ld e, a
    ld a, [$c64c]
    ld d, a
    ld hl, $c655
    trap IntToString
    ld hl, $0d00
    trap MoveCursor
    ld hl, $c656
    trap DrawString
    ld hl, $a849
    trap DrawString
    ld a, $07
    trap $b9
    ret


    ld d, e
    ld b, e
    ld c, a
    ld d, d
    ld b, l
    jr nz, jr_000_0841

jr_000_0841::
    jr nc, jr_000_0873

    nop
    ld a, $06
    trap $b9
    ld hl, $0000
    trap MoveCursor
    ld hl, $a878
    trap DrawString
    ld a, [$c65c]
    ld d, $00
    ld e, a
    ld hl, $c655

jr_000_085b::
    trap IntToString
    push hl
    trap $68
    ld a, $07
    sub l
    ld h, a
    ld l, $00
    trap MoveCursor
    pop hl
    trap DrawString
    ld a, $07
    trap $b9
    ret


    ld c, b
    ld c, c
    ld d, h

jr_000_0873::
    jr nz, jr_000_0875

jr_000_0875::
    ld a, [$d024]
    bit 3, a
    jr z, jr_000_0885

    ld a, [$c65f]
    inc a

jr_000_0880::
    ld [$c65f], a
    trap PauseMusic

jr_000_0885:
    ld a, [$c65f]
    bit 0, a
    ret z

    call $b2da
    ld [$d024], a
    ldh a, [$8a]
    bit 2, a
    jr z, jr_000_0875

    jr jr_000_089e

    ldh a, [$8a]
    bit 2, a
    ret z

jr_000_089e::
    xor a
    trap PlayMusic
    trap ExitToMenu
    ld a, [$c652]
    dec a
    ld [$c652], a
    ret nz

    ld a, [$c64a]
    cp $00
    jr nz, jr_000_08c5

    trap RandNext
    ld d, h
    ld e, l
    ld h, $00
    ld l, $1e
    push bc
    trap $8a
    pop bc
    ld a, [$c3b0]
    add $0a
    jr jr_000_08ed

jr_000_08c5::
    cp $01
    jr nz, jr_000_08dc

    trap RandNext
    ld d, h
    ld e, l
    ld h, $00
    ld l, $14
    push bc
    trap $8a
    pop bc
    ld a, [$c3b0]
    add $0a
    jr jr_000_08ed

jr_000_08dc::
    trap RandNext
    ld d, h
    ld e, l
    ld h, $00
    ld l, $0a
    push bc
    trap $8a
    pop bc
    ld a, [$c3b0]
    add $05

jr_000_08ed::
    ld [$c652], a
    trap RandNext
    ld d, h
    ld e, l
    ld h, $00
    ld l, $06
    push bc
    trap $8a
    pop bc
    ld a, [$c3b0]
    add $00
    ld [$c65e], a
    ld a, a
    sla a
    ld e, a
    ld d, $00
    ld hl, $b729
    add hl, de
    ld d, h
    ld e, l
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    inc de
    push hl
    ld a, $00
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    cp $00
    jr z, jr_000_092b

    ld a, $01
    ld [$c652], a
    pop hl
    ret


jr_000_092b::
    pop hl
    push hl
    ld a, $01
    push af
    ld a, $00
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    ld a, [$c64a]
    cp $00
    jr nz, jr_000_0947

    ld d, $05
    ld e, $0f
    jr jr_000_0955

jr_000_0947::
    cp $01
    jr nz, jr_000_0951

    ld d, $0a
    ld e, $1e
    jr jr_000_0955

jr_000_0951::
    ld d, $0c
    ld e, $25

jr_000_0955::
    trap RandNext
    cp e
    jr c, jr_000_095e

    ld a, $00
    jr jr_000_0967

jr_000_095e::
    cp d
    jr c, jr_000_0965

    ld a, $01
    jr jr_000_0967

jr_000_0965::
    ld a, $02

jr_000_0967::
    pop hl
    push hl
    push af
    ld a, $0a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    ld a, [$c646]
    ld b, a
    ld a, [$c647]
    ld c, a
    trap RandNext
    ld d, h
    ld e, l
    ld h, $00
    ld l, c
    push bc
    trap $8a
    pop bc
    ld a, [$c3b0]
    add b
    pop hl
    push hl
    push af
    ld a, $01
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    pop hl
    ret


    ld [$c64f], a
    ld a, a
    sla a
    ld e, a
    ld d, $00
    ld hl, $b729
    add hl, de
    ld d, h
    ld e, l
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    inc de
    push hl
    pop hl
    push hl
    ld a, $00
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    cp $00
    jp z, $a9d7

    cp $01
    jp z, $a9e8

    cp $02
    jp z, $aa85

    cp $03
    jp z, $ab0f

    ld hl, $0000
    ld a, [$c64f]
    sla a
    sla a
    add $10
    call $b246
    pop hl
    ret


    pop hl
    push hl
    ld a, $01
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    dec a
    pop hl
    push hl
    push af
    ld a, $01
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    jp nz, $aa39

    pop hl
    push hl
    ld a, $02
    push af
    ld a, $00
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    ld a, [$c644]
    ld b, a
    ld a, [$c645]
    ld c, a
    trap RandNext
    ld d, h
    ld e, l
    ld h, $00
    ld l, c
    push bc
    trap $8a
    pop bc
    ld a, [$c3b0]
    add b
    pop hl
    push hl
    push af
    ld a, $01
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    pop hl
    ret


    pop hl
    push hl
    ld a, $0a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    cp $00
    jr nz, jr_000_0a44

    ld d, $08
    jr jr_000_0a54

jr_000_0a44::
    cp $01
    jr nz, jr_000_0a4c

    ld d, $10
    jr jr_000_0a54

jr_000_0a4c::
    cp $02
    jr nz, jr_000_0a54

    ld d, $18
    jr jr_000_0a54

jr_000_0a54::
    pop hl
    push hl
    ld a, $04
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld b, a
    pop hl
    push hl
    ld a, $05
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    add $08
    ld l, a
    ld h, b
    ld a, [$c64f]
    sla a
    sla a
    add $10
    call $b27c
    pop hl
    ret


    pop hl
    push hl
    ld a, $01
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    dec a
    pop hl
    push hl
    push af
    ld a, $01
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    jp nz, $aac5

    pop hl
    push hl
    ld a, $00
    push af
    ld a, $00
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    pop hl
    push hl
    ld a, $0a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    cp $01
    jr z, jr_000_0abb

    xor a
    ld [$c650], a

jr_000_0abb::
    pop hl
    ret


    pop hl
    push hl
    ld a, $0a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    cp $00
    jr nz, jr_000_0ad0

    ld d, $08
    jr jr_000_0ae0

jr_000_0ad0::
    cp $01
    jr nz, jr_000_0ad8

    ld d, $10
    jr jr_000_0ae0

jr_000_0ad8::
    cp $02
    jr nz, jr_000_0ae0

    ld d, $18
    jr jr_000_0ae0

jr_000_0ae0::
    pop hl
    push hl
    ld a, $04
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld b, a
    pop hl
    push hl
    ld a, $05
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld l, a
    ld h, b
    ld a, [$c64f]
    sla a
    sla a
    add $10
    call $b246
    pop hl
    ret


    pop hl
    push hl
    ld a, $01
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    dec a
    pop hl
    push hl
    push af
    ld a, $01
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    jp nz, $ab3c

    pop hl
    push hl
    ld a, $00
    push af
    ld a, $00
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    pop hl
    ret


    pop hl
    push hl
    ld a, $0a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    cp $00
    jr nz, jr_000_0b47

    ld d, $0c
    jr jr_000_0b57

jr_000_0b47::
    cp $01
    jr nz, jr_000_0b4f

    ld d, $14
    jr jr_000_0b57

jr_000_0b4f::
    cp $02
    jr nz, jr_000_0b57

    ld d, $1c
    jr jr_000_0b57

jr_000_0b57::
    pop hl
    push hl
    ld a, $04
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld b, a
    pop hl
    push hl
    ld a, $05
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld l, a
    ld h, b
    ld a, [$c64f]
    sla a
    sla a
    add $10
    call $b246
    pop hl
    ret


    ld a, [$c653]
    cp $00
    jp nz, $ae70

    ld a, [$d024]
    bit 0, a
    jp nz, $abfe

    bit 1, a
    jp nz, $ac06

    bit 4, a
    jp nz, $ac0e

    bit 5, a
    jp nz, $ac16

    bit 6, a
    jp nz, $ac1e

    bit 7, a
    jp nz, $ac26

    ld a, [$c654]
    cp $00
    jr z, jr_000_0bb8

    dec a
    ld [$c654], a
    ld a, $06
    ld [$c649], a
    ret


jr_000_0bb8::
    ld a, [$c649]
    cp $06
    jr z, jr_000_0bea

    ld a, a
    sla a
    ld e, a
    ld d, $00
    ld hl, $b729
    add hl, de
    ld d, h
    ld e, l
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    inc de
    push hl
    ld a, $08
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld b, a
    pop hl
    ld a, $09
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld l, a
    ld h, b
    jr jr_000_0bee

jr_000_0bea::
    ld h, $50
    ld l, $50

jr_000_0bee::
    ld d, $00
    ld a, $0c
    call $b246
    ret


    ld a, $00
    ld [$c649], a
    jp $ac2e


    ld a, $01
    ld [$c649], a
    jp $ac2e


    ld a, $02
    ld [$c649], a
    jp $ac2e


    ld a, $03
    ld [$c649], a
    jp $ac2e


    ld a, $04
    ld [$c649], a
    jp $ac2e


    ld a, $05
    ld [$c649], a
    jp $ac2e


    ld a, a
    sla a
    ld e, a
    ld d, $00
    ld hl, $b729
    add hl, de
    ld d, h
    ld e, l
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    inc de
    push hl
    pop hl
    push hl
    ld a, $06
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld b, a
    pop hl
    push hl
    ld a, $07
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld l, a
    ld h, b
    ld d, $04
    ld a, $0c
    call $b246
    pop hl
    push hl
    ld a, $00
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    cp $02
    ld b, a
    ld a, $00
    ld [$d025], a
    ld a, b
    jp z, $ac87

    cp $01
    ld b, a
    ld a, $01
    ld [$d025], a
    ld a, b
    jp z, $ac87

    jp $ae3e


    pop hl
    push hl
    ld a, $0a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    cp $00
    jp z, $aca1

    cp $01
    jp z, $ad0c

    cp $02
    jp z, $ad8b

    ld a, $0a
    ld [$c654], a
    ld a, [$c65c]
    inc a
    ld [$c65c], a
    ld a, [$c650]
    inc a
    ld [$c650], a
    xor a
    ld [$c651], a
    ld a, [$c650]
    ld c, a
    ld a, [$d025]
    add c
    ld c, a
    ld b, $00
    ld a, [$c64b]
    ld l, a
    ld a, [$c64c]
    ld h, a
    add hl, bc
    ld a, l
    ld [$c64b], a
    ld a, h
    ld [$c64c], a
    ld a, $35
    trap PlaySound
    ld a, [$c649]
    ld a, a
    sla a
    ld e, a
    ld d, $00
    ld hl, $b729
    add hl, de
    ld d, h
    ld e, l
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    inc de
    push hl
    ld a, $03
    push af
    ld a, $00
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    pop hl
    ld a, [$c648]
    push af
    ld a, $01
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    pop hl
    ret


    ld a, [$c64a]
    cp $00
    jr nz, jr_000_0d0f

    ld a, $46
    jr jr_000_0d19

jr_000_0d0f::
    cp $01
    jr nz, jr_000_0d17

    ld a, $64
    jr jr_000_0d19

jr_000_0d17::
    ld a, $82

jr_000_0d19::
    ld [$c653], a
    ld a, [$c651]
    inc a
    ld [$c651], a
    xor a
    ld [$c650], a
    ld a, [$c651]
    ld c, a
    ld b, $00
    ld a, [$c64b]
    ld l, a
    ld a, [$c64c]
    ld h, a
    ld a, l
    sub c
    ld l, a
    ld a, h
    sbc b
    ld h, a
    ld a, l
    sub $05
    ld l, a
    ld a, h
    sbc $00
    ld h, a
    ld a, l
    ld [$c64b], a
    ld a, h
    ld [$c64c], a
    ld a, $27
    trap PlaySound
    ld a, [$c649]
    ld a, a
    sla a
    ld e, a
    ld d, $00
    ld hl, $b729
    add hl, de
    ld d, h
    ld e, l
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    inc de
    push hl
    ld a, $03
    push af
    ld a, $00
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    pop hl
    ld a, [$c648]
    push af
    ld a, $01
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    pop hl
    ret


    xor a
    ld [$c651], a
    ld a, [$c650]
    ld c, a
    ld a, $0a
    add c
    ld c, a
    ld b, $00
    ld a, [$c64b]
    ld l, a
    ld a, [$c64c]
    ld h, a
    add hl, bc
    ld a, l
    ld [$c64b], a
    ld a, h
    ld [$c64c], a
    ld a, [$c650]
    inc a
    ld [$c650], a
    xor a

jr_000_0daa::
    push af
    ld a, a
    sla a
    ld e, a
    ld d, $00
    ld hl, $b729
    add hl, de
    ld d, h
    ld e, l
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    inc de
    push hl
    ld a, $01
    push af
    ld a, $00
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    pop hl
    push hl
    ld a, [$c646]
    push af
    ld a, $01
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    pop hl
    ld a, $00
    push af
    ld a, $0a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    pop af
    inc a
    cp $06
    jr nz, jr_000_0daa

    ld a, $1b
    trap PlaySound
    ld a, [$c649]
    ld a, a
    sla a
    ld e, a
    ld d, $00
    ld hl, $b729
    add hl, de

Call_000_0e00::
    ld d, h
    ld e, l
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    inc de
    push hl
    ld a, $03
    push af
    ld a, $00
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    pop hl
    push hl
    ld a, $02
    push af
    ld a, $0a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    pop hl
    ld a, [$c648]
    push af
    ld a, $01
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    ld [hl], a
    pop hl
    ret


    ld a, $0a
    ld [$c654], a
    ld a, [$c651]
    inc a
    ld [$c651], a
    xor a
    ld [$c650], a
    ld a, [$c651]
    ld c, a
    ld b, $00
    ld a, [$c64b]
    ld l, a
    ld a, [$c64c]
    ld h, a
    ld a, l
    sub c
    ld l, a
    ld a, h
    sbc b
    ld h, a
    ld a, l
    ld [$c64b], a
    ld a, h
    ld [$c64c], a
    ld a, $05
    trap PlaySound
    pop hl
    ret


    dec a
    ld [$c653], a
    jr z, jr_000_0eab

    bit 0, a
    jr nz, jr_000_0ea0

    ld a, [$c649]
    ld a, a
    sla a
    ld e, a
    ld d, $00
    ld hl, $b729
    add hl, de
    ld d, h
    ld e, l
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    inc de
    push hl
    ld a, $06
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld b, a
    pop hl
    ld a, $07
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld l, a
    ld h, b
    jr jr_000_0ea3

jr_000_0ea0::
    ld hl, $0000

jr_000_0ea3::
    ld d, $04
    ld a, $0c
    call $b246
    ret


jr_000_0eab::
    ld h, $50
    ld l, $50
    ld d, $00
    ld a, $0c
    call $b246
    ld a, $06
    ld [$c649], a
    ret


    ld c, $01

jr_000_0ebe::
    trap AwaitFrame
    dec c
    jr nz, jr_000_0ebe

    xor a
    trap DrawInit
    ld hl, $0506
    trap MoveCursor
    ld hl, $b1f0
    trap DrawString
    ld hl, $020a
    trap MoveCursor
    ld hl, $b1ff
    trap DrawString
    ld hl, $020c
    trap MoveCursor
    ld hl, $b211
    trap DrawString
    ld hl, $000e
    trap MoveCursor
    ld hl, $b222
    trap DrawString
    ld a, [$c65d]
    cp $01
    jr z, jr_000_0f62

    cp $02
    jp z, $afd1

    ld hl, $0208
    trap MoveCursor
    ld hl, $b237
    trap DrawString
    ld a, [$b240]
    ld l, a
    ld a, [$b241]
    ld h, a
    ld a, [$c64b]
    ld c, a
    ld a, [$c64c]
    ld b, a
    cp h
    jr c, jr_000_0f38

    jr z, jr_000_0f34

    and $80
    cp $80
    jr z, jr_000_0f38

jr_000_0f1f::
    ld a, $0a
    ld [$0000], a
    ld a, c
    ld e, a
    ld [$b240], a
    ld a, b
    ld d, a
    ld [$b241], a
    xor a
    ld [$0000], a
    jr jr_000_0f4b

jr_000_0f34::
    ld a, l
    cp c
    jr c, jr_000_0f1f

jr_000_0f38::
    ld a, $0a
    ld [$0000], a
    ld a, l
    ld e, a
    ld [$b240], a
    ld a, h
    ld d, a
    ld [$b241], a
    xor a
    ld [$0000], a

jr_000_0f4b::
    ld hl, $c655
    push hl
    trap IntToString
    ld h, $0a
    ld l, $08
    trap MoveCursor
    pop hl
    trap DrawString
    ld hl, $a849
    trap DrawString
    jp $b036


jr_000_0f62::
    ld hl, $0208
    trap MoveCursor
    ld hl, $b237
    trap DrawString
    ld a, [$b242]
    ld l, a
    ld a, [$b243]
    ld h, a
    ld a, [$c64b]
    ld c, a
    ld a, [$c64c]
    ld b, a
    cp h
    jr c, jr_000_0fa0

    jr z, jr_000_0f9c

    and $80
    cp $80
    jr z, jr_000_0fa0

jr_000_0f87::
    ld a, $0a
    ld [$0000], a
    ld a, c
    ld e, a
    ld [$b242], a
    ld a, b
    ld d, a
    ld [$b243], a
    xor a
    ld [$0000], a
    jr jr_000_0fb3

jr_000_0f9c::
    ld a, l
    cp c
    jr c, jr_000_0f87

jr_000_0fa0::
    ld a, $0a
    ld [$0000], a
    ld a, l
    ld e, a
    ld [$b242], a
    ld a, h
    ld d, a
    ld [$b243], a
    xor a
    ld [$0000], a

jr_000_0fb3::
    ld hl, $c655
    push hl
    trap IntToString
    ld h, $0a
    ld l, $08
    trap MoveCursor
    pop hl
    trap DrawString
    ld hl, $a849
    trap DrawString
    jr jr_000_102e

    ld hl, $0208
    trap MoveCursor
    ld hl, $b237
    trap DrawString
    ld a, [$b244]
    ld l, a
    ld a, [$b245]
    ld h, a
    ld a, [$c64b]
    ld c, a
    ld a, [$c64c]
    ld b, a
    cp h
    jr c, jr_000_1007

    jr z, jr_000_1003

    and $80
    cp $80
    jr z, jr_000_1007

jr_000_0fee::
    ld a, $0a
    ld [$0000], a
    ld a, c
    ld e, a
    ld [$b244], a
    ld a, b
    ld d, a
    ld [$b245], a
    xor a
    ld [$0000], a
    jr jr_000_101a

jr_000_1003::
    ld a, l
    cp c
    jr c, jr_000_0fee

jr_000_1007::
    ld a, $0a
    ld [$0000], a
    ld a, l
    ld e, a
    ld [$b244], a
    ld a, h
    ld d, a
    ld [$b245], a
    xor a
    ld [$0000], a

jr_000_101a::
    ld hl, $c655
    push hl
    trap IntToString
    ld h, $0a
    ld l, $08
    trap MoveCursor
    pop hl
    trap DrawString
    ld hl, $a849
    trap DrawString

jr_000_102e::
    ldh a, [$8a]
    cp $21
    jr z, jr_000_1044

    cp $12
    jr z, jr_000_1096

    trap $d8
    bit 3, a
    ret nz

    bit 2, a
    jr z, jr_000_102e

    trap ExitToMenu
    ret


jr_000_1044:
    ld a, [$c65d]
    cp $01
    jr z, jr_000_1067

    cp $02
    jr z, jr_000_107f

    ld a, $0a
    ld [$0000], a
    xor a
    ld [$b240], a
    ld [$b241], a
    xor a
    ld [$0000], a
    xor a
    ld h, a
    ld l, a
    ld d, a
    ld e, a
    jp $af53


jr_000_1067:
    ld a, $0a
    ld [$0000], a
    xor a
    ld [$b242], a
    ld [$b243], a
    xor a
    ld [$0000], a
    xor a
    ld h, a
    ld l, a
    ld d, a
    ld e, a
    jp $afbb


jr_000_107f::
    ld a, $0a
    ld [$0000], a
    xor a
    ld [$b244], a
    ld [$b245], a
    xor a
    ld [$0000], a
    xor a
    ld h, a
    ld l, a
    ld d, a
    ld e, a
    jr jr_000_101a

jr_000_1096::
    xor a
    trap DrawInit
    ld hl, $0000
    trap MoveCursor
    ld hl, $b129
    trap DrawString
    ld hl, $0002
    trap MoveCursor
    ld hl, $b136
    trap DrawString
    ld hl, $0004
    trap MoveCursor
    ld hl, $b151
    trap DrawString
    ld hl, $0005
    trap MoveCursor
    ld hl, $b169
    trap DrawString
    ld hl, $0007
    trap MoveCursor
    ld hl, $b17e
    trap DrawString
    ld hl, $0008
    trap MoveCursor
    ld hl, $b197
    trap DrawString
    ld hl, $000a
    trap MoveCursor
    ld hl, $b1ad
    trap DrawString
    ld hl, $000c
    trap MoveCursor
    ld hl, $b1c5
    trap DrawString
    ld hl, $000f
    trap MoveCursor
    ld hl, $b1de
    trap DrawString
    ld hl, $c400

jr_000_10f6::
    ld de, $ff46
    ld bc, $000a
    trap $e4
    xor a
    ld [$c40a], a
    ld hl, $0510
    trap MoveCursor
    ld hl, $c400
    ldh a, [$92]
    push af
    or $40
    ldh [$92], a
    trap DrawString
    pop af
    and $fb
    ldh [$92], a

jr_000_1118::
    ldh a, [$8a]
    and a
    jp nz, $aec4

    jr jr_000_1118

    ret


    ld c, $20
    jr nz, jr_000_1145

    jr nz, @+$22

    jr nz, jr_000_1149

    cp l
    ret nz

    xor a

jr_000_112c::
    call z, Call_000_0e00
    jr nz, @-$45

    sbc $b0
    pop de
    jp $bbde


    sbc $b2
    db $dd
    rrca
    jr nz, @+$22

    jr nz, @-$39

    or [hl]
    cp e
    sbc $b7
    jr nz, jr_000_10f6

jr_000_1145::
    or a

jr_000_1146::
    pushx @+$0020

jr_000_1149::
    ld c, $20
    cp b
    sbc $d7
    call z, $b8a8
    jr nz, jr_000_1173

    jr nz, jr_000_1175

    jr nz, jr_000_1166

    cp d

jr_000_1158::
    or e
    pushx @+$bc20
    sbc $ad
    db $dd
    cp d
    nop
    rrca
    jr nz, @+$22

    jr nz, jr_000_1186

jr_000_1166::
    jr nz, @+$22

    jr nz, jr_000_118a

    jr nz, jr_000_118c

    jr nz, jr_000_112c

    cp e
    sbc $b7
    jr nz, @-$24

jr_000_1173::
    or l
    push bc

jr_000_1175::
    nop
    ld c, $20
    call z, $dbdf
    cp b
    sbc $d7
    pop de
    jr nz, jr_000_11a1

    jr nz, jr_000_11a3

    jr nz, jr_000_1194

    or a

jr_000_1186::
    pop de
    pushx @+$bc20

jr_000_118a::
    xor l
    or e

jr_000_118c::
    cp e
    cp b
    nop
    rrca
    jr nz, @+$22

    jr nz, jr_000_11b4

jr_000_1194::
    jr nz, jr_000_11b6

    jr nz, @+$22

    jr nz, jr_000_11ba

    jr nz, jr_000_1158

    jp z, $c0de

    jr nz, @-$28

jr_000_11a1::
    cp h
    ret nz

jr_000_11a3::
    or [hl]
    nop
    ld c, $20
    jp $a8de


    jp c, $bcb8

    xor [hl]
    db $dd
    jr nz, @+$22

    jr nz, jr_000_11c2

    ret nz

jr_000_11b4::
    cp c
    cp h

jr_000_11b6::
    ret nz

    jr nz, jr_000_1173

    or e

jr_000_11ba::
    or d
    pop bc
    nop
    ld c, $20
    call z, $dbdf

jr_000_11c2::
    jp $adde


    or b
    cp l
    jr nz, @+$22

    jr nz, @+$22

    rrca
    db $d3
    call nz, $babb
    jr nz, @-$28

    cp h
    or l
    jr nz, jr_000_11d6

jr_000_11d6::
    ld c, $20
    jr nz, jr_000_122d

    ld d, b
    ld b, l
    ld b, e
    ld c, c
    ld b, c
    ld c, h
    jr nz, jr_000_1236

    ld c, b
    ld b, c
    ld c, [hl]
    ld c, e
    ld d, e
    nop
    ld c, $b9
    sbc $b0
    pop de
    jr nz, jr_000_120f

    rrca
    cp h
    xor l
    or e
    ret c

    xor [hl]
    or e
    nop
    ld d, b
    ld d, l
    ld d, e
    ld c, b
    jr nz, jr_000_1250

    ld d, h
    ld b, c
    ld d, d
    ld d, h
    jr nz, jr_000_1223

    ld d, d
    ld b, l
    ld d, h
    ld d, d
    ld e, c
    nop
    ld d, b
    ld d, l
    ld d, e
    ld c, b
    jr nz, jr_000_1262

jr_000_120f::
    ld b, l
    ld c, h
    ld b, l
    ld b, e
    ld d, h
    jr nz, jr_000_125b

    ld e, b
    ld c, c
    ld d, h
    nop
    ld b, e
    ld c, h
    ld d, d
    jr nz, jr_000_1267

    ld c, c
    jr nz, jr_000_1275

    ld b, e

jr_000_1223::
    ld c, a
    ld d, d
    ld b, l
    jr nz, jr_000_1248

    ld b, c
    dec hl
    ld c, h
    ld b, l
    ld b, [hl]

jr_000_122d::
    ld d, h
    nop
    ld c, b
    ld c, c
    jr nz, jr_000_1286

    ld b, e
    ld c, a
    ld d, d

jr_000_1236::
    ld b, l
    nop
    ld a, [bc]
    nop
    ld a, [bc]
    nop
    ld a, [bc]
    nop
    ld b, h
    ld c, l
    ld hl, $c300
    sla a
    sla a
    add l

jr_000_1248::
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, c
    ld [hl+], a
    ld a, b

jr_000_1250::
    ld [hl+], a
    ld a, d
    ld [hl+], a
    inc hl
    inc d
    ld a, c
    ld [hl+], a
    ld a, b
    add $08
    ld [hl+], a

jr_000_125b::
    ld a, d
    ld [hl+], a
    inc hl
    inc d
    ld a, c
    add $08

jr_000_1262::
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld [hl+], a

jr_000_1267::
    inc hl
    inc d
    ld a, c
    add $08
    ld [hl+], a
    ld a, b
    add $08
    ld [hl+], a
    ld a, d
    ld [hl], a
    ret


    ld b, h

jr_000_1275::
    ld c, l
    ld hl, $c300
    sla a
    sla a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, c
    ld [hl+], a
    ld a, b

jr_000_1286::
    ld [hl+], a
    ld a, d
    ld [hl+], a
    inc hl
    inc d
    ld a, c
    ld [hl+], a
    ld a, b

jr_000_128e::
    add $08
    ld [hl+], a
    ld a, d
    ld [hl+], a
    inc hl
    inc d
    xor a
    ld [hl+], a
    ld [hl+], a
    inc hl
    inc hl
    xor a
    ld [hl+], a
    ld [hl+], a
    ret


    ld b, h
    ld c, l
    ld hl, $c300
    sla a
    sla a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ret


    push bc
    push de
    trap $b5
    pop de
    ld hl, $c400
    ld b, h
    trap InitDecompress
    pop bc
    ld de, $8800
    trap RunDecompress
    ld a, $03
    trap $b4
    ret


    xor $00
    ldh [$8a], a
    ld [$c64e], a
    ret


    ldh a, [$8a]
    ld b, a
    ld a, [$c64e]
    xor b
    and b
    ld c, a
    ld a, b
    ld [$c64e], a
    ld a, c
    ret


jr_000_12e1::
    nop

jr_000_12e2::
    nop
    nop
    nop
    dec c
    dec c
    rra
    ld e, $17
    inc e
    rrca
    ld [$101f], sp
    ccf
    jr nz, jr_000_12f2

jr_000_12f2::
    nop
    ldh [$e0], a
    sub b
    ld [hl], b
    ret z

    jr c, jr_000_12e2

    jr @-$36

    jr c, jr_000_128e

    ld [hl], b
    jr nz, jr_000_12e1

    ld a, [hl]
    ld b, c
    ld a, h
    ld b, e
    ld a, c
    ld b, a
    ld [hl-], a
    ld l, $1c
    inc e
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, b
    ldh [$f0], a
    ldh a, [$b8]
    ld hl, sp+$5c
    ld a, h
    ld l, $3e
    ld d, $1e
    inc c
    inc c
    nop
    nop
    nop
    nop
    rra
    rra
    inc a
    inc hl
    ld a, $21
    ld a, $21
    ld a, $21
    cp $e1
    cp $e1
    nop
    nop
    nop
    nop
    add b
    add b
    add b
    add b
    add b
    add b
    add b
    add b
    cp $fe
    cp $fe
    cp [hl]
    pop hl
    cp $e1
    ld a, $21
    ld a, $21
    ld a, $21
    jr nz, jr_000_138c

    rra
    rra
    nop
    nop
    add d
    cp $fe
    cp $80
    add b
    add b
    add b
    add b
    add b
    add b
    add b
    nop
    nop
    nop
    nop
    dec b

jr_000_1362::
    dec b
    rrca
    ld a, [bc]
    rlca
    dec b
    rrca
    ld [$101f], sp
    ccf
    jr nz, jr_000_13ad

    inc l
    ld a, a

jr_000_1370::
    ld d, a
    nop
    nop
    add b
    add b
    ldh [$60], a
    ret nc

    jr nc, jr_000_1362

    jr jr_000_1370

    inc c
    db $f4
    inc a
    ld a, [$7fde]
    ld e, [hl]
    ld a, l
    ld c, a
    ld a, e
    ld b, l
    ld a, a
    ld b, h
    ld a, a
    ld b, e
    rst $38

jr_000_138c::
    add b
    rst $38
    adc h
    rst $38
    jp nc, $7efa

    or d
    cp $d2
    xor [hl]
    ld a, [$fa26]
    add $f9
    rlca
    ld sp, hl
    scf
    ei
    ld c, a
    nop
    nop
    nop
    nop
    ld bc, $1001
    db $10
    jr c, jr_000_13d3

    db $10
    db $10

jr_000_13ad::
    dec b
    dec b
    rrca
    ld a, [bc]
    nop
    nop
    add b
    add b
    ret nz

    ld b, b
    add h
    add h
    ld c, $0a
    inc b
    inc b
    nop
    nop
    add b
    add b
    rrca
    dec c
    rra
    db $10
    ccf
    inc l
    ld a, a
    ld d, a
    ld a, a
    ld e, [hl]
    ld a, a
    ld c, l
    rst $38
    sbc b
    rst $38
    and a
    ldh a, [rSVBK]

jr_000_13d3::
    add sp, $18
    db $f4
    inc a
    ld a, [$fade]
    ld a, [hl]
    ld a, [$fdb6]
    dec de
    db $fd
    rst $20
    dec b

jr_000_13e2::
    dec b
    rrca
    ld a, [bc]
    rlca
    dec b
    rrca
    ld [$101f], sp
    ccf
    inc l
    ccf
    inc h
    ld a, a

jr_000_13f0::
    ld c, h
    nop
    nop
    add b
    add b
    ldh [$60], a
    ret nc

    jr nc, jr_000_13e2

    jr jr_000_13f0

    inc a
    db $f4
    inc e
    ld a, [$4736]
    ld a, c
    cp $87
    ld hl, sp-$71
    ld a, a
    ld b, a
    ld a, a
    ld b, b
    db $e3
    cp h
    ldh a, [$af]
    rst $38
    ldh [$e2], a
    sbc [hl]
    ld a, c
    rst $20
    add hl, de
    rst $30
    ld a, [$fae6]
    ld b, $c5
    ccf
    dec b
    rst $38
    rst $20
    rra
    nop
    nop
    nop
    nop
    ld bc, $1001
    db $10
    jr c, jr_000_1453

    db $10
    db $10
    dec b
    dec b
    rrca
    ld a, [bc]
    nop
    nop
    add b
    add b
    ret nz

    ld b, b
    add h
    add h
    ld c, $0a
    inc b
    inc b
    nop
    nop
    add b
    add b
    rrca
    dec c
    rra
    db $10
    ccf
    jr z, @+$81

    ld b, h
    ld a, a
    ld c, b
    ld b, a
    ld a, c
    cp $87
    ld hl, sp-$31
    ldh a, [rSVBK]

jr_000_1453::
    add sp, $18
    db $f4
    inc e
    ld a, [c]
    ld l, $fa
    ld d, $e2
    sbc [hl]
    ld a, c
    rst $20
    rra
    di
    inc bc
    inc bc
    ld bc, $0701
    rlca
    rrca

jr_000_1468::
    ld [$101f], sp
    ccf
    jr nz, jr_000_14b5

    ld a, h
    ld a, a
    ld b, [hl]
    nop
    nop
    add b
    add b
    ldh [$e0], a
    or b
    ld [hl], b
    ret c

    jr c, jr_000_1468

    inc e
    adc $3e
    sbc d
    ld h, [hl]
    ld a, d
    ld e, a
    cp e
    sbc $e7
    cp [hl]
    db $fd
    sbc a
    cp a
    pop bc
    db $76
    ld c, c
    ld e, a
    ld l, e
    cp $f1
    ld a, [hl-]
    sbc $bb
    ld e, a
    rst $20
    ld a, a
    cp a
    rst $38
    add e
    rst $38
    ld b, d
    cp [hl]
    or $de
    rrca
    rst $38
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
    ld bc, $1c01
    inc e
    ccf
    ccf
    nop
    nop
    nop
    nop

jr_000_14b5::
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    add b
    cp b
    cp b
    db $fc
    db $fc
    dec hl
    ccf
    ccf
    ld [hl+], a
    dec hl
    ld [hl], $7f
    ld a, a
    ld [hl], a
    ld c, a
    ld [hl], h
    ld c, a
    xor l
    sbc $cf
    rst $38
    sub h
    db $fc
    cp h
    ld b, h
    call nc, $fe6c
    cp $f2
    xor $22
    cp $f3
    ccf
    di
    rst $38
    jr nc, jr_000_1513

    ld a, b
    ld c, b
    ld a, c
    ld c, c
    rst $30
    sub [hl]
    rst $38
    sbc b
    rst $38
    sbc c
    or $96
    ldh a, [$90]
    jr c, jr_000_152b

    ld a, b
    ld c, b
    ld hl, sp-$38
    cp $06
    rst $38
    ld bc, $c1ff
    ld a, a
    ld c, a
    ld a, b
    ld c, b
    pop af
    sub c
    di
    sub d
    rst $38
    xor h
    rst $38
    add l
    rst $38
    add h
    rst $38
    add h
    ld a, e
    ld c, d
    ld sp, $f831
    ret z

jr_000_1513::
    db $fc
    inc b
    cp $c2
    ld a, $22
    ccf
    ld hl, $c9ff
    rst $38
    add hl, de
    and $e6
    nop
    nop
    inc e
    inc e
    ld a, $22
    ld a, $22
    ccf
    inc hl

jr_000_152b::
    db $fd
    push bc
    db $fc
    call nz, $c4fc
    nop
    nop
    inc e
    inc e
    ld a, $22
    rst $38
    pop hl
    rst $38
    add hl, de
    rst $38
    dec b
    rst $38
    rst $00
    ld a, $22
    ld hl, sp-$78
    ld hl, sp-$78
    ld a, h
    ld b, h
    ld a, h
    ld b, h
    ccf
    inc hl
    ccf
    jr nz, jr_000_156d

    db $10
    rrca
    rrca
    jr nc, jr_000_1583

    ld c, $0e
    rra
    ld de, $111f
    rst $38
    pop hl
    cp $02
    db $fc
    inc b
    ld hl, sp-$08
    nop
    nop
    inc sp
    inc sp
    ld a, a
    ld c, h
    ld a, a
    ld b, b
    ld a, a
    ld b, e
    ld a, h
    ld b, h

jr_000_156d::
    cp $82
    rst $38
    add c
    inc c
    inc c
    sbc $d2
    cp $32
    cp $12
    cp $c2
    ld a, $22
    ld a, a
    ld b, c
    rst $38
    add c
    rst $38
    sub b

jr_000_1583::
    rst $38
    sbc b
    rst $30
    sub h
    rst $38
    adc b
    rst $38
    add c
    ld a, [hl]
    ld b, d
    inc a
    inc h
    jr jr_000_15a9

    rst $38
    ld de, $31ff
    rst $38
    ld sp, $41ff
    cp $82
    cp $82
    db $fc
    adc h
    ld [hl], b
    ld [hl], b
    inc bc
    inc bc
    rra
    inc e
    ld a, a
    ld h, b
    rst $38
    add b

jr_000_15a9::
    rst $38
    sbc h
    ld h, a
    ld h, h
    rrca
    inc c
    ccf
    jr nc, jr_000_15ce

    inc e
    cp $e2
    rst $38
    ld sp, $09ff
    rst $38
    ld sp, hl
    add [hl]
    add [hl]
    ldh a, [$f0]
    db $fc
    inc c
    ld a, a
    ld b, b
    ld a, a
    ld c, b
    rst $30
    sub h
    rst $30
    sub h
    rst $30
    sub h
    rst $38
    adc c
    ld a, a

jr_000_15ce::
    ld b, c
    ld a, $3e
    cp $02
    cp $e2
    sbc a
    sub c
    sbc a
    sub c
    rst $38
    pop af
    rst $38
    ld bc, $02fe
    cp $fe
    jr jr_000_15fb

    inc a
    inc h
    ld a, a
    ld h, a
    rst $38
    add h
    rst $38
    add b
    ld a, a
    ld h, b
    ccf
    ld hl, $223e
    nop
    nop
    ldh [$e0], a
    ld hl, sp+$18
    db $fc
    inc b
    cp $02

jr_000_15fb::
    rst $38
    pop hl
    rra
    ld de, $090f
    ld a, $22
    ld a, [hl]
    ld b, d
    ld a, h
    ld b, h
    db $fc
    add h
    db $fc
    add h
    db $fc
    add h
    ld a, h
    ld h, h
    jr jr_000_1629

    rrca
    add hl, bc
    rrca
    add hl, bc
    rrca
    add hl, bc
    ld a, a
    ld [hl], c
    rst $38
    add c
    cp $82
    db $fc
    adc h
    ld [hl], b
    ld [hl], b
    jr c, jr_000_165b

    ld a, h
    ld b, h
    ld a, h
    ld b, h
    db $fc
    add h

jr_000_1629::
    ld hl, sp-$78
    ldh a, [$90]
    db $fc
    sbc h
    cp $92
    inc e
    inc e
    ld a, $22
    ld a, $22
    ccf
    ld hl, $213f
    rra
    ld de, $111f
    rra
    ld de, $427e
    ld a, [hl]
    ld b, d
    inc a
    inc a
    ld c, $0e
    rra
    ld de, $203f
    ccf
    jr nz, jr_000_166f

    rra
    rra
    ld de, $111f
    rra
    ld de, $617f
    cp $82

jr_000_165b::
    cp $02
    db $fc
    inc c
    ldh a, [$f0]
    ld h, [hl]
    ld h, [hl]
    xor $aa
    xor $aa
    xor $aa
    xor $aa
    xor $aa
    xor $aa

jr_000_166f::
    xor $aa
    rlca
    rlca
    rrca
    add hl, bc
    rrca
    add hl, bc
    rrca
    add hl, bc
    ld e, $12
    ld e, $12
    ld a, $22
    ld a, [hl]
    ld c, d
    xor $aa
    xor $aa
    xor $aa
    xor $aa
    xor $aa
    xor $aa
    xor $aa
    add $c6
    cp $9a
    xor $8a
    xor $ea
    ld c, $0a
    ld c, $0a
    ld c, $0a
    ld c, $0a
    inc c
    inc c
    ld a, a
    ld a, a
    ld a, a
    ld b, b
    ld a, a
    ld a, a
    ld bc, $0101
    ld bc, $0203
    rlca
    inc b
    rlca
    dec b
    rst $18
    rst $18
    rst $18
    ld d, b
    rst $18
    ld e, a
    ret nz

    ld b, b
    ret nz

    ld b, b
    ret nz

    ld b, b
    add b
    add b
    nop
    nop
    rrca
    add hl, bc
    rra
    ld de, $243f
    dec sp
    ld a, [hl+]
    ld a, e
    ld c, d
    ld [hl], c
    ld d, c
    ld [hl], c
    ld d, c
    ld h, c
    ld h, c
    nop
    nop
    nop
    nop
    add b
    add b
    ret nz

    ld b, b
    ret nz

    ld b, b
    rst $18
    ld e, a
    rst $18
    ld d, b
    sbc a
    sbc a
    ei
    ei
    ei
    ld a, [bc]
    ei
    db $eb
    jr c, jr_000_1711

    jr c, jr_000_1713

    jr c, jr_000_1715

    jr c, jr_000_1717

    jr c, jr_000_1719

    rst $38
    rst $38
    rst $38
    ld bc, $fdff
    rlca
    dec b
    ld [hl], a
    ld [hl], l
    ld a, a
    ld e, l
    ld a, a
    ld b, c
    ld a, [hl]
    ld e, [hl]
    jr c, @+$2a

    jr c, @+$2a

    jr c, jr_000_172f

    jr c, @+$2a

    jr c, jr_000_1733

    ld sp, hl
    ret


    ld sp, hl
    add hl, bc
    pop af
    pop af

jr_000_1711::
    ld [hl], b
    ld d, b

jr_000_1713::
    ld [hl], b
    ld d, b

jr_000_1715::
    ld [hl], b
    ld d, b

jr_000_1717::
    ld [hl], b
    ld d, b

jr_000_1719::
    ld [hl], b
    ld d, b
    ldh a, [$d0]
    ldh a, [rNR10]
    ldh [$e0], a
    ld [bc], a
    add $0d
    add $18
    add $23
    add $2e
    add $39
    add $0e
    db $d3

jr_000_172f::
    cp b
    sbc $d7
    ld [bc], a

jr_000_1733::
    ld [bc], a
    ld [bc], a
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    ld c, $cb
    sub $ba
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    ld c, $b5
    call nc, $debc
    nop
    rrca
    call nz, $b6c6
    cp b
    ret nz

    ret nz

    cp c
    ld hl, $2020
    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_000_175f

    ld [bc], a
    ld [bc], a

jr_000_175f::
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    rrca
    jp c, $bfdd

    sbc $b8
    ld c, $cb
    xor a
    call nz, $c30f
    sbc $20
    jr nz, jr_000_179c

    jr nz, jr_000_179e

    jr nz, jr_000_17a0

    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    rrca
    cp d
    or e
    call nz, $c3b8
    db $dd
    ret nz

    sbc $21
    jr nz, @+$22

jr_000_179c::
    jr nz, @+$22

jr_000_179e::
    jr nz, @+$22

jr_000_17a0::
    jr nz, jr_000_17a4

    ld [bc], a
    ld [bc], a

jr_000_17a4::
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    inc bc
    inc bc
    rrca
    ret nz

    ret nz

    cp b
    push bc
    ld hl, $2020
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    rrca
    cp c
    sbc $dd
    jp $c9dd


    or e
    or h
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    ld c, $cc
    ret c

    or b
    cp l
    sbc $21
    jr nz, jr_000_181d

    jr nz, jr_000_181f

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    inc bc
    inc bc
    ld c, $ce
    sbc $b0
    push bc
    cp l

jr_000_181d::
    or a
    xor h

jr_000_181f::
    pushx @+$2020
    jr nz, jr_000_1844

    jr nz, @+$22

    jr nz, @+$22

    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    rrca
    jp $c3de


    or a
    ret nz

    ld c, $d3
    cp b
    sbc $d7
    rrca

jr_000_1844::
    jp z, $2020

    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_000_184f

    ld [bc], a
    ld [bc], a

jr_000_184f::
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    rrca
    ret nz

    ret nz

    or a
    adc $b3
    ret nz

    sbc $b2
    ld hl, $2020
    jr nz, @+$22

    jr nz, jr_000_188c

    jr nz, jr_000_186e

jr_000_186e::
    rrca
    or l
    jp $b7c2


    jp z, $deb9

    db $dd
    jp $c0dd


    sbc $d6
    ld hl, $ff00
    rst $38
    rst $38
    ret


    di
    and c
    jp $8d41


    rst $38
    pop bc
    ld de, $21c1

jr_000_188c::
    and c
    ld b, c
    di
    inc bc
    rst $38
    cp $03
    ld hl, sp-$71
    or $f9
    ld hl, sp+$01
    rst $38
    ldh a, [rSB]
    ldh [$81], a
    ldh [$f9], a
    ld b, b
    add c
    rst $38
    ret nz

    pop af
    ret nz

    pop bc
    ldh [$7d], a
    ret nz

    ld bc, $153f
    db $10
    ld c, $71
    ret nz

    inc bc
    ret nz

    ld [bc], a
    pop bc
    ld [hl], a
    jr nz, jr_000_18ca

    add b
    ld [bc], a
    add c
    inc h
    add $80
    ld a, [hl-]
    ld a, $25
    ld bc, $822f
    add b
    ld a, d
    add b
    ld bc, $0137

jr_000_18ca::
    dec e
    dec d
    db $10
    ld [bc], a
    ld d, $05
    ret nz

    ld sp, hl
    dec d
    jr nc, jr_000_18de

    rst $38
    ret nz

    ldh a, [$c0]
    nop
    ldh [rSC], a
    ldh [rDIV], a

jr_000_18de::
    rst $38
    ldh [$f8], a
    rst $20
    rlca
    ld hl, sp+$18
    rst $20
    rst $20

jr_000_18e7::
    rst $18
    rst $28
    cpl
    ld e, l
    rst $38
    daa
    rst $38
    jr c, jr_000_18e7

    rst $28
    daa
    db $f4
    jr nz, jr_000_195c

    dec d
    ldh [$f4], a
    db $10
    db $fc
    cp $0c
    rst $38
    adc e
    db $fc
    ld hl, sp-$04
    ld [$fe75], sp
    adc b
    db $fc
    ret z

    ld a, h
    ld a, b
    inc c
    ld [$8183], sp
    ld a, [$ffe0]
    add sp, -$01
    ld hl, sp-$6e
    ld a, [$3696]
    cp d
    cp $9c
    cp a
    rst $38
    ccf
    and a
    nop
    cpl
    ld h, b
    ld d, e
    ld h, b
    inc bc
    ld c, a
    xor a
    rla
    or [hl]
    nop
    or l
    rst $38
    rlca
    call $0bff
    cp [hl]
    nop
    cp l
    rst $38
    inc bc
    call nz, $ff00
    or [hl]
    dec b
    ret z

    rst $38
    ld bc, $00cc
    ld [bc], a
    inc bc
    trap $2e
    ret nc

    inc d
    call nc, $cc03
    db $10
    ld bc, $0000
    call nz, $07ef
    ld b, $00
    jp $0003


    jr nc, jr_000_1955

jr_000_1955::
    rrca
    rst $18
    add b
    nop
    xor $3f
    cp a

jr_000_195c::
    ret nz

    ret nz

    ccf
    ld d, $a8
    ld b, $fb
    ld a, [$c000]
    and a
    ld a, [$0905]
    ld d, b
    or e
    push bc
    and a
    db $fd
    ld [bc], a
    dec d
    push af
    ld e, $38
    rst $38
    ld [$ff3e], a
    ld e, $32
    add hl, de
    rra
    ld [hl], $9f
    ld b, d
    ld bc, $f7bf
    ld b, l
    di
    sub d
    ld a, [c]
    sbc a
    ld a, [c]
    cp a
    ld a, l
    ld c, [hl]
    nop
    ldh a, [$bf]
    pop af
    cp a
    pop hl
    ld d, [hl]
    rst $38
    rst $38
    and $fe
    ld hl, sp-$38
    ldh a, [$d8]
    ldh [$d0], a
    ld a, a
    ld h, b
    db $10
    ldh a, [$c0]
    ldh a, [$a0]
    sbc h
    sub b
    db $f4
    ld hl, sp-$08
    adc d
    ldh a, [rSVBK]
    add b
    xor $72
    add b

jr_000_19af::
    xor $b5
    ld hl, sp+$70
    ld [bc], a
    ldh [$c0], a
    ld [hl], c
    rst $38
    xor $01
    ld a, [hl]
    ld c, a
    ld [hl], d
    ld h, a
    ld [hl], d
    db $10
    ldh [$f0], a
    ldh a, [$3f]
    rrca
    set 7, a
    ldh a, [$fb]
    ld [hl], b
    sbc d
    rrca
    sbc d
    inc b
    jr nz, jr_000_19af

    ld l, h
    xor c
    cpl
    rst $18
    sbc d
    rrca
    db $10
    rst $28
    or l
    cp [hl]
    ld d, c
    db $db
    inc bc
    cp $cf
    rst $38
    add c
    adc b
    inc bc
    rst $38
    and c
    dec d
    ret c

    ld e, b
    nop
    ld e, b
    jp hl


    ld [c], a
    ld de, $e6f9
    ei
    ld c, a
    ld [$bf00], a
    db $ed
    sbc h
    nop
    rst $28
    rst $28
    xor a
    rst $28
    db $f4
    pushx @+$d397
    inc de
    ld a, [$fd02]
    add hl, sp
    ld [hl], d
    rra
    dec c
    or $72
    db $d3
    ld bc, $04f4
    dec b
    dec b
    dec e
    rst $38
    dec b
    rlca
    inc b
    ccf
    rlca
    or $04
    ld b, $ff
    inc b
    add [hl]
    add h
    and $64
    ld a, [c]
    sub d
    pop af
    cp e
    pop de
    dec a
    sub c
    pop af
    ld [hl], c
    ld b, d
    ld bc, $f111
    cp a
    rla
    ld b, [hl]
    ld hl, $c1e1
    pop bc
    ld a, a
    jp $44ff


    call nz, $c545
    ld [hl], l
    push bc
    ld b, a
    call nz, $7ff7
    rst $00
    ld b, [hl]
    call nz, $445d
    ld b, d
    jp nz, $a741

    pop bc
    ld h, a
    rst $38
    add a
    nop
    add a
    inc bc
    db $fd
    ld c, $ff
    or $98
    add sp, -$50
    ldh [$b0], a
    ret nz

    ldh a, [rIE]
    sub b
    ldh [$f0], a
    add b
    sbc b
    add b
    adc b
    add b
    jp $8084


    adc b
    push af
    sub b
    ld d, $ff
    or c
    rlca
    rlca
    jp $f8f8


    jp $f100


    ret


    ld d, b
    ret z

    ld hl, sp-$61
    xor $07
    sbc a
    nop
    pushx @+$8037
    rst $38
    ld a, b
    push de
    rrca
    ret c

    cpl
    call nz, $e3d5
    ld l, a
    ldh a, [$ef]
    inc e
    dec bc
    ld sp, hl
    ld b, $05
    inc bc
    inc bc
    ld bc, $501b
    jp nz, $8700

    inc b
    or d
    rst $38
    jr c, jr_000_1ae8

    or $b7
    cp $fe
    rlca
    push hl
    ld bc, $feff
    di
    ld [hl], b
    ld l, b
    ld bc, $0468
    ld b, h
    or [hl]
    cp e
    ld [hl], a
    ld b, l
    cp e
    ld l, b
    ld b, $a2
    ld e, l
    add e

jr_000_1ab9::
    inc bc
    ld l, b
    rrca
    ld h, l

jr_000_1abd::
    db $76
    db $d3
    rrca
    or b
    ld [hl], b
    ld h, b
    rst $38
    jr c, jr_000_1ab9

    rst $30
    adc $cd
    inc bc
    adc a
    ld [bc], a
    dec de
    nop
    inc bc
    jp $0102


    daa
    rst $38
    rst $18
    ldh a, [$f1]
    ld h, b
    ldh a, [$f0]
    cp $fe
    rrca
    cp $f2
    rst $38
    ld a, [$0cfe]
    ld bc, $f2ff
    cp $0e

jr_000_1ae8::
    di
    cp $02

jr_000_1aeb::
    cp $03
    ld a, a
    inc d
    rlca
    db $fc
    jr jr_000_1aeb

    add sp, -$08
    rrca
    pop af
    ld hl, sp+$08
    ld hl, sp+$09
    ld [hl+], a
    ld [de], a
    ld hl, $0023
    db $fc
    ld d, d
    ld l, $0c
    rrca
    ld de, $0bfa
    ld a, [bc]
    nop
    ld c, $10
    ld hl, $0215
    ccf
    inc b
    inc e
    ld [hl-], a
    dec hl
    xor a
    di
    or b
    cp $7f
    or b
    inc d
    ld hl, sp-$08
    rst $30
    inc c
    dec de
    ld b, $07
    sbc [hl]
    ld [bc], a
    push bc
    rst $00
    rla
    ld b, $0d
    inc bc
    add hl, de
    ld hl, sp+$0e
    jp z, $f41f

    ld hl, sp-$4f
    cp e
    db $e3
    nop
    jr jr_000_1abd

    inc de
    ccf
    and [hl]
    ld d, b
    ld bc, $601f
    ld h, b
    sbc a
    sbc a
    cp a
    ld a, a
    cp l
    rst $38
    sbc a
    rst $38
    ldh [$df], a
    sbc a
    db $d3
    cp a
    add b
    rst $00
    jr nz, jr_000_1ba3

    ld b, b
    inc sp
    jr nc, @+$41

    cpl
    ret nc

    inc sp
    jr nz, @-$2b

    di
    call nc, $dd5e

jr_000_1b5d::
    ld c, a
    pop af
    ldh a, [$e7]
    ld e, a
    nop
    xor a
    ld e, d
    sub d
    rst $28
    rrca
    rrca
    rst $38
    rst $38
    jr nc, jr_000_1b5d

    ret nz

    ret nz

    nop
    ret nz

    add b
    ret nz

    cp a
    ld b, b
    rra
    inc h
    ld a, b
    ld hl, sp+$7c
    add h
    inc c

jr_000_1b7c::
    inc b
    trap $06
    ld [bc], a
    inc l
    dec hl
    nop
    inc bc
    rlca
    dec bc
    inc b
    ld a, $ad
    sbc e
    pop hl
    rst $00
    nop
    ld a, b
    nop
    add c
    add h
    add e
    ldh a, [$f0]
    ld bc, $55fb
    add hl, bc
    ld e, c
    ld d, h
    ld d, $e8
    rla
    ld sp, $5569
    rrca
    db $f4
    dec bc

jr_000_1ba3::
    ld [hl], l
    ld a, [hl]
    ld d, h
    rst $28
    adc $f3
    nop
    dec [hl]
    nop
    ei
    ld b, $da
    add hl, bc
    add b
    add b
    rst $38
    rst $38
    ld h, b

jr_000_1bb5::
    rst $38
    db $10
    ld a, a
    ld [$0838], sp
    cp a
    ccf
    cp [hl]
    dec b
    ld c, $31
    rra
    ld a, [hl]
    ld bc, $4741
    ld a, [hl-]
    ld bc, $10ce
    ld b, h
    ld a, [de]
    nop
    ldh [rNR41], a
    ld [hl], b
    add sp, $10
    jr nc, @+$12

    cp l
    jr jr_000_1bb5

    jr nc, @-$41

    xor d
    ld bc, $03e9
    nop
    ld h, b
    adc $f8
    inc d
    inc bc
    jp nc, $f9fe

    ld a, $ff
    pop bc
    rst $38

jr_000_1bea::
    cp $59
    jr nc, jr_000_1bea

    pop bc
    db $fd
    cp $3f
    ret nz

    rst $38
    add b
    ld a, a
    add hl, bc
    jr nz, jr_000_1b7c

    db $ec
    ld a, a
    cp l
    ld a, a
    ld a, [$bf41]
    dec d
    push af
    ld e, $df
    cp $01
    cpl
    rrca
    rst $38
    ld bc, $017f
    sbc a
    rrca
    and h
    dec a
    rst $30
    and [hl]
    or l
    nop
    ld a, a
    ret nz

    ld b, b
    ret nz

    ld a, a
    ld h, l
    ld a, h
    db $fc
    and e
    ld a, [hl]
    call $0203
    add [hl]
    ld bc, $0371
    adc $cf
    db $10
    ld [hl], c
    ld b, $01
    pop de
    ld [hl+], a
    ld c, d
    ld c, b
    adc a
    ld c, b
    jr nc, @-$33

    di
    rl c
    ccf
    bit 1, e
    or l
    nop
    ldh [$67], a
    sbc h
    inc sp
    rst $18
    sbc l
    ld b, e
    ret nz

    cp l
    ld b, c
    inc b
    ld bc, $0986
    add hl, bc
    dec bc
    or c
    rra
    rst $38
    add hl, bc
    rrca
    ld c, $0d
    add hl, bc
    dec c
    ld hl, sp+$0d
    cp d
    ld [$00bd], sp
    dec b
    inc b
    inc bc
    jp $c502


    ld h, b
    ld e, a
    ld c, d
    or l
    db $fc
    nop
    jp nc, $dbff

    cp $eb
    rst $38
    db $fc
    daa
    db $fc
    rlca
    ld [$f00f], sp
    rra
    ld l, a
    rst $18
    ldh [$3f], a
    db $e3
    inc d
    ld a, a
    ld b, d
    ld a, a
    jp nz, $7ffe

    set 7, a
    trap $ff
    rst $28
    rst $38
    ld a, [c]
    ld a, a
    jp nc, $fe00

    ld a, a
    ld a, [hl]
    ld a, [hl]
    db $fd
    ld a, l
    db $fd
    cp a
    dec a
    ld [bc], a
    rst $38
    jr @+$0a

    jr @+$01

    ld [$8b0f], sp
    ld b, b
    sbc c
    ld de, $67c0
    jr nz, jr_000_1d03

    ld d, b
    jr nc, jr_000_1cfa

    ld b, [hl]
    inc hl
    ld a, e
    add e
    cp $8a
    ld d, h
    ld e, $83
    add e
    ld de, $fca7
    add e
    rlca
    ld e, [hl]
    nop
    sbc $f0
    rrca
    rrca
    rra
    ld a, [c]
    ld d, b
    ld a, [c]
    ld c, [hl]
    inc b
    ldh a, [$3f]
    rrca
    ld a, $01
    ld h, c
    ld e, l
    cp $f1
    ld e, e
    nop
    sub l
    ld l, c
    jr nz, jr_000_1cf7

    ldh [$ce], a
    rst $38
    add b
    jr z, jr_000_1cdb

    ld [hl], h
    ld [bc], a
    rst $38
    dec bc
    ld a, [hl]

jr_000_1cdb::
    ld de, $2ffb
    rst $38
    ccf
    rst $38
    cp a
    ld hl, sp-$06
    cp $ff
    ei
    db $fd
    rst $28
    ld sp, hl

jr_000_1cea::
    rst $28
    push af
    cp a
    db $e4
    db $fd
    sub h
    call nc, $94ff
    rst $38

Call_000_1cf4::
    ld d, b
    sbc c
    nop

jr_000_1cf7::
    ld b, b
    pop bc
    ld b, b

jr_000_1cfa::
    rst $38
    sbc [hl]
    inc a
    ld d, [hl]
    and c
    or b
    db $f4
    or a
    rst $38

jr_000_1d03::
    xor [hl]
    ld c, $30
    ld sp, $3a0f
    ld bc, $f000
    ld a, [hl-]
    inc de
    and a
    ld a, a
    ld a, [hl-]
    db $e3
    pop bc
    ld h, b
    ld b, d
    db $fc
    rrca
    inc bc
    set 7, a
    db $fc
    ld c, a
    ld [hl], b
    xor $03
    xor $04
    adc b
    ld [hl], a
    ld l, l
    db $fd
    adc e
    ld [hl], a
    xor $02
    ld b, h
    cp e
    add hl, bc
    inc bc
    rst $38
    cp $0a
    cp $0e
    cp $2e
    rst $38
    inc a
    rst $38
    db $fc
    cp e
    ei
    rst $30
    rst $30
    rst $28
    rst $28
    xor $7f
    rra
    ld b, c
    sbc $78
    ret z

    cp $46
    ld b, c
    ld b, c
    jr c, jr_000_1cea

    ld c, [hl]
    ld [bc], a
    add hl, bc
    rst $38
    dec c
    xor e
    ld [hl], h
    inc h
    dec [hl]
    rla
    and e
    rst $38
    ld d, e
    ld c, d
    dec h
    ld [hl], c
    ld [c], a
    ld bc, $fe01
    rst $38
    ld b, $09
    add hl, bc
    dec sp
    dec bc
    adc e
    dec bc
    ld a, a
    cp $09
    rrca
    ld c, $fd
    add hl, bc
    dec c
    ld [$2081], sp
    rst $28
    db $fd
    inc b
    inc bc
    db $ec
    ld [c], a
    ei
    ld a, [de]
    rst $38
    rst $20
    and $ff
    or $91
    db $10
    sub b
    ld e, $e7
    cp $bf
    rlca
    sbc d
    dec [hl]
    dec bc
    ld a, [$f233]
    db $d3
    ld a, [c]
    or a
    inc de
    and [hl]
    ld de, $af09
    nop
    jr c, jr_000_1db0

    jr c, @+$01

    ld hl, sp+$0c
    inc e
    db $e4
    db $e4
    ei
    ei
    ld c, c
    cp $4b
    inc d
    dec d
    sbc d
    sbc d
    pop bc
    pop bc
    ld [hl], l
    push af
    ld c, d
    ld c, d
    scf
    scf

jr_000_1db0::
    ld a, [c]
    ld de, $cd3f
    rra
    db $fc
    rst $38
    sbc a
    rst $38
    trap $ff
    ld a, a
    pop de
    rra
    inc a
    dec sp
    ld c, l
    ld sp, hl

jr_000_1dc2::
    ld e, [hl]
    ldh [rP1], a
    rra

jr_000_1dc6::
    ld h, l
    jr nz, jr_000_1dd8

    ldh a, [$c7]
    ldh a, [rIF]
    jr nc, jr_000_1de4

    ld h, b
    jr nc, jr_000_1dc2

    ccf
    rrca
    db $db
    ld a, $01
    inc hl

jr_000_1dd8::
    ld b, b
    cp $f1
    ld hl, $003f
    ccf
    cpl
    ei
    ld a, $0e
    rlca

jr_000_1de4::
    rrca
    rlca
    adc a
    add e
    rst $38
    ld c, a
    ld b, e
    ccf
    inc hl
    rra
    inc de
    rst $38
    dec bc
    rst $30
    rst $38
    rst $20
    ld a, a
    ccf
    ld hl, $1f00
    ld b, $6f
    rst $28
    ld h, d
    rst $28
    db $e3
    ld d, e
    rlca
    ld bc, $b1b7
    rst $38
    rst $30
    pop af
    db $e3
    pop hl
    jp $cfc3


    call c, $83ff
    add b

jr_000_1e10::
    inc bc
    add b
    ld bc, $0f81
    sbc [hl]
    rst $38
    add c
    nop
    ld bc, $0080
    ld b, b
    add c
    ld b, c
    db $fc
    inc bc
    ld b, a
    add b
    ld b, b
    inc bc
    ld d, a
    adc c
    nop
    add e
    db $fd
    nop
    ld d, b
    inc bc
    ld c, a
    nop
    jr nz, jr_000_1dc6

    dec [hl]
    jr nc, jr_000_1e10

    inc bc
    daa
    sub l
    jr z, @+$05

    rst $00
    add e
    ld bc, $fe8d
    add b
    ld a, l
    db $fc
    rrca
    inc bc
    rst $38
    db $fc
    dec d
    ld [hl], b
    ld e, e
    or h
    inc bc
    or h
    inc b
    adc b
    ld [hl], a
    jp $778b


    ld h, b
    or h
    rrca
    ld b, h
    cp e
    trap $de
    or b
    ld c, $2a
    nop
    ld a, [hl+]
    ei
    add c
    cp $c1
    cp $d1
    dec hl
    nop
    cp $f5
    rst $18
    cp $fd
    cp $ff
    db $fd
    ld a, a
    rst $38
    ld e, a
    ld [hl], a
    dec b
    nop
    rra
    rra
    rst $38
    ld a, [bc]
    rla
    rst $38
    add a
    ld [hl], h
    rrca
    nop
    add e
    add e
    rst $38
    inc d
    ret nz

    rla
    jr nz, jr_000_1ea1

    push de
    rst $38
    ld h, b
    rra
    nop
    ldh [rNR41], a
    ldh [rNR44], a
    db $10
    or b
    pushx @+$30f0
    dec hl
    ld [hl], b
    ld l, $03
    ld d, b
    ld hl, sp-$68
    sub $78
    jr @+$37

    ld a, b
    inc sp
    inc bc

jr_000_1ea1::
    ld a, h
    inc c
    ccf
    rst $38
    inc [hl]
    rst $38
    call nz, $047c
    db $fc
    inc b
    rst $38
    rst $18
    inc c
    db $fc
    ld c, [hl]
    nop
    db $ec
    db $fc
    inc e
    cp $e4
    rst $38
    db $fc
    db $f4
    rst $38
    db $f4
    db $fc
    db $e4
    rst $38
    inc e
    sub a
    and $4b
    ld h, b
    db $10
    ld b, $b0
    db $fc
    inc a
    db $f4
    db $fd
    call c, Call_000_1cf4
    db $fc
    db $10
    ldh a, [$6f]
    call Header
    ld a, a

End:
