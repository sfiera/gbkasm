; Disassembly of "mogutte-nanbo.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]
LOAD "CRAM Code", SRAM[$a008]

Header::
    dw SIZEOF(SECTION(Header))
    db kFileHasIcon2bpp + kFileMarkerDiamond + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db .end - @ - 1            ; length of variable parts of header
    db $65                     ; owner code
.title
    dh "モグってナンボ"
.icon
    INCBIN "gfx/mogura/icon.2bpp"
.end

History:
.points
    dw 1
.author
    db "TEAMMOGURA", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    ld sp, $dff0

jr_000_0103::
    call call_a2f5
    call call_a438
    ld a, [$c65d]
    ld [$c64a], a
    call call_a6db
    call call_aec4
    jr jr_000_0103

    trap LCDDisable
    ld a, $0c
    trap $b9
    xor a
    ld d, a
    ld h, a
    ld l, a
    call call_b2a6
    ld a, $03
    trap LCDEnable
    call $a328
    ld hl, $0902
    trap MoveCursor
    ld hl, data_b754
    trap DrawString
    ld hl, $0410
    trap MoveCursor
    ld hl, data_b876
    trap DrawString
    ld hl, $0301
    trap MoveCursor
    ld hl, data_b735
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
    call call_b246
    ld a, $04
    ld d, $10
    ld hl, $2450
    call call_b246
    ld a, $08
    ld d, $18
    ld hl, $2478
    call call_b246
    jr jr_000_01b6

jr_000_017a::
    cp $00
    jr nz, jr_000_0198

    ld a, $00
    ld hl, $0000
    call call_b246
    ld a, $04
    ld hl, $0000
    call call_b246
    ld a, $08
    ld hl, $0000
    call call_b246
    jr jr_000_01b6

jr_000_0198::
    ld a, $00
    ld d, $08
    ld hl, $2430
    call call_b27c
    ld a, $04
    ld d, $10
    ld hl, $2458
    call call_b27c
    ld a, $08
    ld d, $18
    ld hl, $2480
    call call_b27c

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


call_a1fe:
    ld a, $00
    ld d, $20
    ld l, $50
    call call_a212
    ret


call_a208:
    ld a, $00
    ld d, $2c
    ld l, $50
    call call_a212
    ret


call_a212:
    push af
    push de
    ld b, $3c
    ld c, $a0
    call call_a29b
    add $04
    push af
    ld a, d
    add $04
    ld d, a
    pop af
    ld b, $4c
    ld c, $a0
    call call_a29b
    add $04
    push af
    ld a, d
    add $04
    ld d, a
    pop af
    ld b, $5c
    ld c, $a0
    call call_a29b
    ld b, $14

jr_000_0233::
    trap AwaitFrame
    dec b
    jr nz, jr_000_0233

    pop de
    pop af
    ld b, $f0
    ld c, $3c
    call call_a29b
    add $04
    push af
    ld a, d
    add $04
    ld d, a
    pop af
    ld b, $f0
    ld c, $4c
    call call_a29b
    add $04
    push af
    ld a, d
    add $04
    ld d, a
    pop af
    ld b, $f0
    ld c, $5c
    call call_a29b
    ret


call_a268:
    pop af
    ld b, a

jr_000_0262::
    push bc
    trap AwaitFrame
    ld h, $40
    push af
    push de
    push hl
    call call_b246
    pop hl
    pop de
    pop af
    add $04
    ld h, $50
    push af
    push de
    push hl
    call call_b246
    pop hl
    pop de
    pop af
    add $04
    ld h, $60
    push de
    push hl
    call call_b246
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


call_a29b:
    ld h, c
    push af

jr_000_0295::
    trap AwaitFrame
    pop af
    push af
    push bc
    push de
    push hl
    call call_b246
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


call_a2b3:
    ld h, $a0

jr_000_02ad::
    ld l, $50
    ld a, $00
    ld d, $38
    push hl
    call call_a2cb
    trap AwaitFrame
    pop hl
    ld a, h
    dec a
    dec a
    cp $d0
    ld h, a
    jr nz, jr_000_02ad

    ret


call_a2cb:
    push af
    push de
    push hl
    call call_b246
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
    call call_b246
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
    call call_b246
    ret


call_a2f5:
    call call_a316
    call call_a328
    call call_a334
    call call_a340
    call call_a341
    call call_b2d2
    call call_a419
    trap StopAudio
    ld hl, $04bc
    trap $cb
    xor a
    ld [$c65c], a
    ret


call_a316:
    xor a
    set 7, a
    ld c, $01
    ld b, $05
    ld e, $11
    ld d, $0a
    trap DrawInit
    ld a, $03
    trap LCDEnable
    ret


call_a328:
    ld hl, $8000
    ld de, data_b2e9
    ld bc, $0440
    trap MemCopy
    ret


call_a334:
    ld hl, $03e8
    ld a, l
    ld [$c600], a
    ld a, h
    ld [$c601], a
    ret


call_a340:
    ret


call_a341:
    ld hl, $c602
    ld de, data_a34d
    ld bc, $0042
    trap MemCopy
    ret


data_a34d:
    db $00, $00, $81, $66, $81, $5e, $81, $56, $81, $46, $00
    db $00, $00, $69, $73, $69, $6b, $69, $63, $69, $53, $00, $00, $00, $4d, $69, $4d
    db $61, $4d, $59, $4d, $49, $00, $00, $00, $17, $6a, $17, $62, $17, $5c, $17, $4c
    db $00, $00, $00, $32, $60, $32, $58, $32, $50, $32, $40, $00, $00, $00, $32, $75
    db $32, $6d, $32, $65, $32, $55, $00


call_a38f:
    ld hl, $8800
    ld de, data_b729
    ld bc, $0b40
    trap MemCopy
    ret


call_a39b:
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


call_a3f6:
    ld a, $00
    ld [$c64b], a
    ld [$c64c], a
    ret


call_a3ff:
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


call_a413:
    ld a, $14
    ld [$c652], a
    ret


call_a419:
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
    ld de, data_b886
    ld bc, $09c4
    trap MemCopy
    ret


call_a438:
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
    trap LCDEnable
    ld hl, $8000
    ld bc, $0010
    ld de, $a6cb
    trap MemCopy
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
    jp nz, call_a571

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
    jp call_a438


call_a501:
    xor a
    trap DrawInit
    ld hl, $0001
    trap MoveCursor
    ld hl, data_a573
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
    jp nz, call_a438

    jr jr_000_0560

    ret


call_a571:
    trap ExitToMenu


data_a573:
    db $0e, $20, $20, $20, $20
    db $d3, $b8, $de, $d7, $0f, $c0, $c1, $a6, $c0, $c0, $b8, $c6, $ca, $00, $0f, $20
    db $20, $20, $b6, $de, $d2, $dd, $c9, $c5, $b6, $c9, $a4, $b1, $c5, $c4, $b5, $c5
    db $bc, $de, $20, $00, $0f, $20, $20, $ca, $de, $bc, $ae, $c9, $0e, $ce, $de, $c0
    db $dd, $0f, $a6, $b5, $bc, $c3, $b8, $c0, $de, $bb, $b2, $00, $0e, $20, $20, $20
    db $b5, $d4, $bc, $de, $0f, $a6, $c0, $c0, $b8, $c4, $a4, $0e, $ce, $de, $b0, $c5
    db $bd, $00, $0e, $20, $20, $cb, $d6, $ba, $0f, $a6, $c0, $c0, $b8, $c4, $a4, $0e
    db $cf, $b2, $c5, $bd, $0f, $c9, $b3, $b4, $00, $0f, $20, $20, $20, $20, $20, $b3
    db $ba, $de, $b9, $c5, $b8, $c5, $af, $c1, $ac, $b3, $d6, $00, $0e, $20, $d3, $b8
    db $de, $d7, $0f, $a6, $da, $dd, $bf, $de, $b8, $c3, $de, $c0, $c0, $b8, $c4, $a4
    db $ca, $de, $b2, $ca, $de, $b2, $00, $0e, $c1, $ac, $dd, $bd, $21, $21, $0f, $20
    db $b5, $c3, $c2, $b7, $ca, $a4, $0e, $cf, $b2, $c5, $bd, $0f, $c0, $de, $d6, $00
    db $0f, $20, $20, $20, $bb, $b1, $21, $be, $b2, $b9, $de, $dd, $bc, $de, $b6, $dd
    db $c5, $b2, $c6, $00, $0f, $20, $20, $20, $20, $ba, $b3, $c4, $b8, $c3, $dd, $a6
    db $d2, $bb, $de, $be, $21, $21, $00, $0e, $d3, $b8, $de, $0f, $af, $c3, $0e, $c5
    db $dd, $ce, $de, $00, $0e, $50, $75, $73, $68, $20, $41, $20, $74, $6f, $20, $70
    db $6c, $61, $79, $20, $47, $41, $4d, $45, $00, $0e, $20, $20, $20, $20, $20, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $00, $0f, $20
    db $20, $bb, $b1, $20, $20, $b6, $de, $dd, $ca, $de, $db, $b3, $be, $de, $0e, $20
    db $20, $cd, $de, $b2, $cd, $de, $b0, $00, $0e, $d3, $b0, $c4, $de, $20, $20, $be
    db $da, $b8, $c4, $00, $0f, $d4, $bb, $bc, $b2, $00, $0f, $cc, $c2, $b3, $00, $0f
    db $d1, $bd, $de, $d1, $bd, $de, $00, $0e, $b7, $ac, $d7, $0f, $bc, $ae, $b3, $b6
    db $b2, $00, $00, $00, $00, $08, $08, $7c, $7c, $fe, $82, $fe, $aa, $fe, $aa, $fe
    db $82, $7c, $7c

call_a6db:
    call $a71f

jr_000_06d6::
    call call_b2da
    ld [$d024], a
    xor a

jr_000_06dd::
    push af
    call call_a9a2
    pop af
    inc a
    cp $06
    jr nz, jr_000_06dd

    call call_ab86
    call $a8ab
    call call_a813
    call call_a84c
    call call_a7d4
    ld a, [$c600]
    ld l, a
    ld a, [$c601]
    ld h, a
    ld a, h
    or l
    jp z, jp_a76c

    ld de, $fed4
    add hl, de
    ld a, h
    or l
    jr nz, jr_000_070f

    ld a, $0c
    trap PlayMusic

jr_000_070f::
    call call_a87d
    call $a8a1
    jr jr_000_06d6

    call call_a316
    ld de, $c660
    ld bc, $0aa0
    call call_b2bc
    call call_a328
    ld a, $0c
    ld h, $50
    ld l, $50
    ld d, $00
    call call_b246
    ld a, $06
    ld [$c649], a
    call call_a39b
    call call_a3f6
    call call_a413
    xor a
    ld [$c65c], a
    ld [$c654], a
    ld [$c653], a
    ld [$c651], a
    ld [$c650], a
    ld [$c65f], a
    ld a, $1d
    trap PlaySound
    call call_a1fe

jr_000_0759::
    trap GetSoundState
    cp $01
    jr z, jr_000_0759

    ld a, $09
    trap PlayMusic
    ret


jp_a76c:
    xor a
    trap PlayMusic
    ld a, $1e
    trap PlaySound
    call call_a208

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

    ld a, [data_b240]
    ld l, a
    ld a, [data_b240 + 1]
    ld h, a
    jr jr_000_079f

jr_000_078d::
    ld a, [data_b242]
    ld l, a
    ld a, [data_b242 + 1]
    ld h, a
    jr jr_000_079f

jr_000_0797::
    ld a, [data_b244]
    ld l, a
    ld a, [data_b244 + 1]
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
    call call_a2b3

jr_000_07c4::
    call call_b2da
    bit 0, a
    jr z, jr_000_07c4

    ret


call_a7d4:
    ld a, $06
    trap $b9
    ld hl, $0802
    trap MoveCursor
    ld hl, data_a80d
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


data_a80d:
    dh " TIME\n"


call_a813:
    ld a, $06
    trap $b9
    ld hl, $0800
    trap MoveCursor
    ld hl, data_a842
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
    ld hl, data_a849
    trap DrawString
    ld a, $07
    trap $b9
    ret


data_a842:
    dh "SCORE \n"
data_a849:
    dh "00\n"


call_a84c:
    ld a, $06
    trap $b9
    ld hl, $0000
    trap MoveCursor
    ld hl, data_a878
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


data_a878:
    dh "HIT \n"


call_a87d:
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

    call call_b2da
    ld [$d024], a
    ldh a, [$8a]
    bit 2, a
    jr z, call_a87d

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
    ld hl, data_b729
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


call_a9a2:
    ld [$c64f], a
    ld a, a
    sla a
    ld e, a
    ld d, $00
    ld hl, data_b729
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
    jp z, call_a9e8

    cp $02
    jp z, call_aa85

    cp $03
    jp z, call_ab0f

    ld hl, $0000
    ld a, [$c64f]
    sla a
    sla a
    add $10
    call call_b246
    pop hl
    ret


call_a9e8:
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
    jp nz, call_aa39

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


call_aa39:
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
    call call_b27c
    pop hl
    ret


call_aa85:
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
    jp nz, call_aac5

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


call_aac5:
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
    call call_b246
    pop hl
    ret


call_ab0f:
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
    jp nz, call_ab3c

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


call_ab3c:
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
    call call_b246
    pop hl
    ret


call_ab86:
    ld a, [$c653]
    cp $00
    jp nz, call_ae70

    ld a, [$d024]
    bit 0, a
    jp nz, call_abfe

    bit 1, a
    jp nz, call_ac06

    bit 4, a
    jp nz, call_ac0e

    bit 5, a
    jp nz, call_ac16

    bit 6, a
    jp nz, call_ac1e

    bit 7, a
    jp nz, call_ac26

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
    ld hl, data_b729
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
    call call_b246
    ret


call_abfe:
    ld a, $00
    ld [$c649], a
    jp call_ac2e


call_ac06:
    ld a, $01
    ld [$c649], a
    jp call_ac2e


call_ac0e:
    ld a, $02
    ld [$c649], a
    jp call_ac2e


call_ac16:
    ld a, $03
    ld [$c649], a
    jp call_ac2e


call_ac1e:
    ld a, $04
    ld [$c649], a
    jp call_ac2e


call_ac26:
    ld a, $05
    ld [$c649], a
    jp call_ac2e


call_ac2e:
    ld a, a
    sla a
    ld e, a
    ld d, $00
    ld hl, data_b729
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
    call call_b246
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
    jp z, call_ac87

    cp $01
    ld b, a
    ld a, $01
    ld [$d025], a
    ld a, b
    jp z, call_ac87

    jp call_ae3e


call_ac87:
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
    jp z, call_ad0c

    cp $02
    jp z, call_ad8b

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
    ld hl, data_b729
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


call_ad0c:
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
    ld hl, data_b729
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


call_ad8b:
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
    ld hl, data_b729
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
    ld hl, data_b729
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


call_ae3e:
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


call_ae70:
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
    ld hl, data_b729
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
    call call_b246
    ret


jr_000_0eab::
    ld h, $50
    ld l, $50
    ld d, $00
    ld a, $0c
    call call_b246
    ld a, $06
    ld [$c649], a
    ret


call_aec4:
    ld c, $01

jr_000_0ebe::
    trap AwaitFrame
    dec c
    jr nz, jr_000_0ebe

    xor a
    trap DrawInit
    ld hl, $0506
    trap MoveCursor
    ld hl, data_b1f0
    trap DrawString
    ld hl, $020a
    trap MoveCursor
    ld hl, data_b1ff
    trap DrawString
    ld hl, $020c
    trap MoveCursor
    ld hl, data_b211
    trap DrawString
    ld hl, $000e
    trap MoveCursor
    ld hl, data_b222
    trap DrawString
    ld a, [$c65d]
    cp $01
    jr z, jr_000_0f62

    cp $02
    jp z, $afd1

    ld hl, $0208
    trap MoveCursor
    ld hl, data_b237
    trap DrawString
    ld a, [data_b240]
    ld l, a
    ld a, [data_b240 + 1]
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
    ld [data_b240], a
    ld a, b
    ld d, a
    ld [data_b240 + 1], a
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
    ld [data_b240], a
    ld a, h
    ld d, a
    ld [data_b240 + 1], a
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
    ld hl, data_a849
    trap DrawString
    jp $b036


jr_000_0f62::
    ld hl, $0208
    trap MoveCursor
    ld hl, data_b237
    trap DrawString
    ld a, [data_b242]
    ld l, a
    ld a, [data_b242 + 1]
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
    ld [data_b242], a
    ld a, b
    ld d, a
    ld [data_b242 + 1], a
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
    ld [data_b242], a
    ld a, h
    ld d, a
    ld [data_b242 + 1], a
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
    ld hl, data_a849
    trap DrawString
    jr jr_000_102e

    ld hl, $0208
    trap MoveCursor
    ld hl, data_b237
    trap DrawString
    ld a, [data_b244]
    ld l, a
    ld a, [data_b244 + 1]
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
    ld [data_b244], a
    ld a, b
    ld d, a
    ld [data_b244 + 1], a
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
    ld [data_b244], a
    ld a, h
    ld d, a
    ld [data_b244 + 1], a
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
    ld hl, data_a849
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
    ld [data_b240], a
    ld [data_b240 + 1], a
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
    ld [data_b242], a
    ld [data_b242 + 1], a
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
    ld [data_b244], a
    ld [data_b244 + 1], a
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
    ld hl, data_b129
    trap DrawString
    ld hl, $0002
    trap MoveCursor
    ld hl, data_b136
    trap DrawString
    ld hl, $0004
    trap MoveCursor
    ld hl, data_b151
    trap DrawString
    ld hl, $0005
    trap MoveCursor
    ld hl, data_b169
    trap DrawString
    ld hl, $0007
    trap MoveCursor
    ld hl, data_b17e
    trap DrawString
    ld hl, $0008
    trap MoveCursor
    ld hl, data_b197
    trap DrawString
    ld hl, $000a
    trap MoveCursor
    ld hl, data_b1ad
    trap DrawString
    ld hl, $000c
    trap MoveCursor
    ld hl, data_b1c5
    trap DrawString
    ld hl, $000f
    trap MoveCursor
    ld hl, data_b1de
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
    jp nz, call_aec4

    jr jr_000_1118

    ret


data_b129:
    dh $0e, $20, $20, $20, $20, $20, $20, $20, $bd, $c0, $af, $cc, $00

data_b136:
    dh $0e, $20, $b9, $de, $b0, $d1, $c3, $de, $bb, $de, $b2, $dd, $0f, $20, $20, $20, $c5, $b6
    dh $bb, $de, $b7, $20, $b1, $b7, $d7, $20, $00

data_b151:
    dh $0e, $20, $b8, $de, $d7, $cc, $a8, $b8, $20, $20, $20, $20, $20
    dh $0f, $ba, $b3, $d7, $20, $bc, $de, $ad, $dd, $ba, $00

data_b169:
    dh $0f, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $be, $bb, $de
    dh $b7, $20, $da, $b5, $c5, $00

data_b17e:
    dh $0e, $20, $cc, $df, $db, $b8, $de, $d7, $d1, $20
    dh $20, $20, $20, $20, $0f, $b7, $d1, $d7, $20, $bc, $ad, $b3, $bb, $b8, $00

data_b197:
    dh $0f, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $bc, $ca, $de
    dh $c0, $20, $d6, $bc, $c0, $b6, $00

data_b1ad:
    dh $0e, $20, $c3, $de, $a8, $da, $b8, $bc, $ae, $dd, $20
    dh $20, $20, $0f, $c0, $b9, $bc, $c0, $20, $ba, $b3, $b2, $c1, $00

data_b1c5:
    dh $0e, $20, $cc
    dh $df, $db, $c3, $de, $ad, $b0, $bd, $20, $20, $20, $20, $0f, $d3, $c4, $bb, $ba
    dh $20, $d6, $bc, $b5, $20, $00

data_b1de:
    dh $0e, $20, $20, $53, $50, $45, $43, $49, $41, $4c
    dh $20, $54, $48, $41, $4e, $4b, $53, $00

data_b1f0:
    dh $0e, $b9, $de, $b0, $d1, $20, $20, $0f
    dh $bc, $ad, $b3, $d8, $ae, $b3, $00

data_b1ff:
    dh "PUSH START  RETRY\n"
data_b211:
    dh "PUSH SELECT EXIT\n"
data_b222:
    dh "CLR HI SCORE  A+LEFT\n"
data_b237:
    dh "HI SCORE\n"

data_b240:
    dw 10
data_b242:
    dw 10
data_b244:
    dw 10

call_b246:
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


call_b27c:
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


call_b2a6:
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


call_b2bc:
    push bc
    push de
    trap LCDDisable
    pop de
    ld hl, $c400
    ld b, h
    trap InitDecompress
    pop bc
    ld de, $8800
    trap RunDecompress
    ld a, $03
    trap LCDEnable
    ret


call_b2d2:
    xor $00
    ldh [$8a], a
    ld [$c64e], a
    ret


call_b2da:
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


data_b2e9:
    db $00, $00, $00, $00, $0d, $0d, $1f, $1e, $17, $1c, $0f, $08, $1f, $10, $3f, $20
    db $00, $00, $e0, $e0, $90, $70, $c8, $38, $e8, $18, $c8, $38, $90, $70, $20, $e0
    db $7e, $41, $7c, $43, $79, $47, $32, $2e, $1c, $1c, $00, $00, $00, $00, $00, $00
    db $60, $e0, $f0, $f0, $b8, $f8, $5c, $7c, $2e, $3e, $16, $1e, $0c, $0c, $00, $00
    db $00, $00, $1f, $1f, $3c, $23, $3e, $21, $3e, $21, $3e, $21, $fe, $e1, $fe, $e1
    db $00, $00, $00, $00, $80, $80, $80, $80, $80, $80, $80, $80, $fe, $fe, $fe, $fe
    db $be, $e1, $fe, $e1, $3e, $21, $3e, $21, $3e, $21, $20, $3f, $1f, $1f, $00, $00
    db $82, $fe, $fe, $fe, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $00, $00
    db $05, $05, $0f, $0a, $07, $05, $0f, $08, $1f, $10, $3f, $20, $3f, $2c, $7f, $57
    db $00, $00, $80, $80, $e0, $60, $d0, $30, $e8, $18, $f4, $0c, $f4, $3c, $fa, $de
    db $7f, $5e, $7d, $4f, $7b, $45, $7f, $44, $7f, $43, $ff, $80, $ff, $8c, $ff, $d2
    db $fa, $7e, $b2, $fe, $d2, $ae, $fa, $26, $fa, $c6, $f9, $07, $f9, $37, $fb, $4f
    db $00, $00, $00, $00, $01, $01, $10, $10, $38, $28, $10, $10, $05, $05, $0f, $0a
    db $00, $00, $80, $80, $c0, $40, $84, $84, $0e, $0a, $04, $04, $00, $00, $80, $80
    db $0f, $0d, $1f, $10, $3f, $2c, $7f, $57, $7f, $5e, $7f, $4d, $ff, $98, $ff, $a7
    db $f0, $70, $e8, $18, $f4, $3c, $fa, $de, $fa, $7e, $fa, $b6, $fd, $1b, $fd, $e7
    db $05, $05, $0f, $0a, $07, $05, $0f, $08, $1f, $10, $3f, $2c, $3f, $24, $7f, $4c
    db $00, $00, $80, $80, $e0, $60, $d0, $30, $e8, $18, $f4, $3c, $f4, $1c, $fa, $36
    db $47, $79, $fe, $87, $f8, $8f, $7f, $47, $7f, $40, $e3, $bc, $f0, $af, $ff, $e0
    db $e2, $9e, $79, $e7, $19, $f7, $fa, $e6, $fa, $06, $c5, $3f, $05, $ff, $e7, $1f
    db $00, $00, $00, $00, $01, $01, $10, $10, $38, $28, $10, $10, $05, $05, $0f, $0a
    db $00, $00, $80, $80, $c0, $40, $84, $84, $0e, $0a, $04, $04, $00, $00, $80, $80
    db $0f, $0d, $1f, $10, $3f, $28, $7f, $44, $7f, $48, $47, $79, $fe, $87, $f8, $cf
    db $f0, $70, $e8, $18, $f4, $1c, $f2, $2e, $fa, $16, $e2, $9e, $79, $e7, $1f, $f3
    db $03, $03, $01, $01, $07, $07, $0f, $08, $1f, $10, $3f, $20, $47, $7c, $7f, $46
    db $00, $00, $80, $80, $e0, $e0, $b0, $70, $d8, $38, $ec, $1c, $ce, $3e, $9a, $66
    db $7a, $5f, $bb, $de, $e7, $be, $fd, $9f, $bf, $c1, $76, $49, $5f, $6b, $fe, $f1
    db $3a, $de, $bb, $5f, $e7, $7f, $bf, $ff, $83, $ff, $42, $be, $f6, $de, $0f, $ff
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $1c, $1c, $3f, $3f
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $80, $b8, $b8, $fc, $fc
    db $2b, $3f, $3f, $22, $2b, $36, $7f, $7f, $77, $4f, $74, $4f, $ad, $de, $cf, $ff
    db $94, $fc, $bc, $44, $d4, $6c, $fe, $fe, $f2, $ee, $22, $fe, $f3, $3f, $f3, $ff
    db $30, $30, $78, $48, $79, $49, $f7, $96, $ff, $98, $ff, $99, $f6, $96, $f0, $90
    db $38, $38, $78, $48, $f8, $c8, $fe, $06, $ff, $01, $ff, $c1, $7f, $4f, $78, $48
    db $f1, $91, $f3, $92, $ff, $ac, $ff, $85, $ff, $84, $ff, $84, $7b, $4a, $31, $31
    db $f8, $c8, $fc, $04, $fe, $c2, $3e, $22, $3f, $21, $ff, $c9, $ff, $19, $e6, $e6
    db $00, $00, $1c, $1c, $3e, $22, $3e, $22, $3f, $23, $fd, $c5, $fc, $c4, $fc, $c4
    db $00, $00, $1c, $1c, $3e, $22, $ff, $e1, $ff, $19, $ff, $05, $ff, $c7, $3e, $22
    db $f8, $88, $f8, $88, $7c, $44, $7c, $44, $3f, $23, $3f, $20, $1f, $10, $0f, $0f
    db $30, $30, $0e, $0e, $1f, $11, $1f, $11, $ff, $e1, $fe, $02, $fc, $04, $f8, $f8
    db $00, $00, $33, $33, $7f, $4c, $7f, $40, $7f, $43, $7c, $44, $fe, $82, $ff, $81
    db $0c, $0c, $de, $d2, $fe, $32, $fe, $12, $fe, $c2, $3e, $22, $7f, $41, $ff, $81
    db $ff, $90, $ff, $98, $f7, $94, $ff, $88, $ff, $81, $7e, $42, $3c, $24, $18, $18
    db $ff, $11, $ff, $31, $ff, $31, $ff, $41, $fe, $82, $fe, $82, $fc, $8c, $70, $70
    db $03, $03, $1f, $1c, $7f, $60, $ff, $80, $ff, $9c, $67, $64, $0f, $0c, $3f, $30
    db $1c, $1c, $fe, $e2, $ff, $31, $ff, $09, $ff, $f9, $86, $86, $f0, $f0, $fc, $0c
    db $7f, $40, $7f, $48, $f7, $94, $f7, $94, $f7, $94, $ff, $89, $7f, $41, $3e, $3e
    db $fe, $02, $fe, $e2, $9f, $91, $9f, $91, $ff, $f1, $ff, $01, $fe, $02, $fe, $fe
    db $18, $18, $3c, $24, $7f, $67, $ff, $84, $ff, $80, $7f, $60, $3f, $21, $3e, $22
    db $00, $00, $e0, $e0, $f8, $18, $fc, $04, $fe, $02, $ff, $e1, $1f, $11, $0f, $09
    db $3e, $22, $7e, $42, $7c, $44, $fc, $84, $fc, $84, $fc, $84, $7c, $64, $18, $18
    db $0f, $09, $0f, $09, $0f, $09, $7f, $71, $ff, $81, $fe, $82, $fc, $8c, $70, $70
    db $38, $38, $7c, $44, $7c, $44, $fc, $84, $f8, $88, $f0, $90, $fc, $9c, $fe, $92
    db $1c, $1c, $3e, $22, $3e, $22, $3f, $21, $3f, $21, $1f, $11, $1f, $11, $1f, $11
    db $7e, $42, $7e, $42, $3c, $3c, $0e, $0e, $1f, $11, $3f, $20, $3f, $20, $1f, $1f
    db $1f, $11, $1f, $11, $1f, $11, $7f, $61, $fe, $82, $fe, $02, $fc, $0c, $f0, $f0
    db $66, $66, $ee, $aa, $ee, $aa, $ee, $aa, $ee, $aa, $ee, $aa, $ee, $aa, $ee, $aa
    db $07, $07, $0f, $09, $0f, $09, $0f, $09, $1e, $12, $1e, $12, $3e, $22, $7e, $4a
    db $ee, $aa, $ee, $aa, $ee, $aa, $ee, $aa, $ee, $aa, $ee, $aa, $ee, $aa, $c6, $c6
    db $fe, $9a, $ee, $8a, $ee, $ea, $0e, $0a, $0e, $0a, $0e, $0a, $0e, $0a, $0c, $0c
    db $7f, $7f, $7f, $40, $7f, $7f, $01, $01, $01, $01, $03, $02, $07, $04, $07, $05
    db $df, $df, $df, $50, $df, $5f, $c0, $40, $c0, $40, $c0, $40, $80, $80, $00, $00
    db $0f, $09, $1f, $11, $3f, $24, $3b, $2a, $7b, $4a, $71, $51, $71, $51, $61, $61
    db $00, $00, $00, $00, $80, $80, $c0, $40, $c0, $40, $df, $5f, $df, $50, $9f, $9f
    db $fb, $fb, $fb, $0a, $fb, $eb, $38, $28, $38, $28, $38, $28, $38, $28, $38, $28
    db $ff, $ff, $ff, $01, $ff, $fd, $07, $05, $77, $75, $7f, $5d, $7f, $41, $7e, $5e
    db $38, $28, $38, $28, $38, $28, $38, $28, $38, $28, $f9, $c9, $f9, $09, $f1, $f1
    db $70, $50, $70, $50, $70, $50, $70, $50, $70, $50, $f0, $d0, $f0, $10, $e0, $e0

data_b729:
    db $02, $c6, $0d, $c6, $18, $c6, $23, $c6, $2e, $c6, $39, $c6

data_b735:
    db $0e, $d3, $b8, $de, $d7, $02, $02, $02, $03, $03, $03, $03, $03, $0e, $cb, $d6
    db $ba, $02, $02, $02, $03, $03, $03, $03, $03, $0e, $b5, $d4, $bc, $de, $00

data_b754:
    db $0f, $c4, $c6, $b6, $b8, $c0, $c0, $b9, $21, $20, $20, $20, $20, $20, $20, $20
    db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $03
    db $0f, $da, $dd, $bf, $de, $b8, $0e, $cb, $af, $c4, $0f, $c3, $de, $20, $20, $20
    db $20, $20, $20, $20, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
    db $02, $02, $02, $03, $0f, $ba, $b3, $c4, $b8, $c3, $dd, $c0, $de, $21, $20, $20
    db $20, $20, $20, $20, $20, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
    db $02, $02, $02, $02, $03, $03, $03, $0f, $c0, $c0, $b8, $c5, $21, $20, $20, $20
    db $20, $20, $20, $20, $20, $20, $20, $02, $02, $02, $02, $02, $02, $02, $02, $02
    db $02, $02, $02, $02, $02, $02, $03, $0f, $b9, $de, $dd, $c3, $dd, $c9, $b3, $b4
    db $20, $20, $20, $20, $20, $20, $20, $20, $02, $02, $02, $02, $02, $02, $02, $02
    db $02, $02, $02, $02, $02, $02, $02, $03, $0e, $cc, $d8, $b0, $bd, $de, $21, $20
    db $20, $20, $20, $20, $20, $20, $20, $20, $20, $02, $02, $02, $02, $02, $02, $02
    db $02, $02, $02, $02, $02, $02, $02, $02, $03, $03, $03, $0e, $ce, $de, $b0, $c5
    db $bd, $b7, $ac, $d7, $20, $20, $20, $20, $20, $20, $20, $20, $02, $02, $02, $02
    db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $03, $0f, $c3, $de, $c3
    db $b7, $c0, $0e, $d3, $b8, $de, $d7, $0f, $ca, $20, $20, $20, $20, $20, $20, $20
    db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $03
    db $0f, $c0, $c0, $b7, $ce, $b3, $c0, $de, $b2, $21, $20, $20, $20, $20, $20, $20
    db $20, $00

data_b876:
    db $0f, $b5, $c3, $c2, $b7, $ca, $b9, $de, $dd, $c3, $dd, $c0, $de, $d6, $21, $00

data_b886:
    db $ff, $ff
    db $ff, $c9, $f3, $a1, $c3, $41, $8d, $ff, $c1, $11, $c1, $21, $a1, $41, $f3, $03
    db $ff, $fe, $03, $f8, $8f, $f6, $f9, $f8, $01, $ff, $f0, $01, $e0, $81, $e0, $f9
    db $40, $81, $ff, $c0, $f1, $c0, $c1, $e0, $7d, $c0, $01, $3f, $15, $10, $0e, $71
    db $c0, $03, $c0, $02, $c1, $77, $20, $12, $80, $02, $81, $24, $c6, $80, $3a, $3e
    db $25, $01, $2f, $82, $80, $7a, $80, $01, $37, $01, $1d, $15, $10, $02, $16, $05
    db $c0, $f9, $15, $30, $09, $ff, $c0, $f0, $c0, $00, $e0, $02, $e0, $04, $ff, $e0
    db $f8, $e7, $07, $f8, $18, $e7, $e7, $df, $ef, $2f, $5d, $ff, $27, $ff, $38, $f7
    db $ef, $27, $f4, $20, $67, $15, $e0, $f4, $10, $fc, $fe, $0c, $ff, $8b, $fc, $f8
    db $fc, $08, $75, $fe, $88, $fc, $c8, $7c, $78, $0c, $08, $83, $81, $fa, $e0, $ff
    db $e8, $ff, $f8, $92, $fa, $96, $36, $ba, $fe, $9c, $bf, $ff, $3f, $a7, $00, $2f
    db $60, $53, $60, $03, $4f, $af, $17, $b6, $00, $b5, $ff, $07, $cd, $ff, $0b, $be
    db $00, $bd, $ff, $03, $c4, $00, $ff, $b6, $05, $c8, $ff, $01, $cc, $00, $02, $03
    db $cf, $2e, $d0, $14, $d4, $03, $cc, $10, $01, $00, $00, $c4, $ef, $07, $06, $00
    db $c3, $03, $00, $30, $00, $0f, $df, $80, $00, $ee, $3f, $bf, $c0, $c0, $3f, $16
    db $a8, $06, $fb, $fa, $00, $c0, $a7, $fa, $05, $09, $50, $b3, $c5, $a7, $fd, $02
    db $15, $f5, $1e, $38, $ff, $ea, $3e, $ff, $1e, $32, $19, $1f, $36, $9f, $42, $01
    db $bf, $f7, $45, $f3, $92, $f2, $9f, $f2, $bf, $7d, $4e, $00, $f0, $bf, $f1, $bf
    db $e1, $56, $ff, $ff, $e6, $fe, $f8, $c8, $f0, $d8, $e0, $d0, $7f, $60, $10, $f0
    db $c0, $f0, $a0, $9c, $90, $f4, $f8, $f8, $8a, $f0, $70, $80, $ee, $72, $80, $ee
    db $b5, $f8, $70, $02, $e0, $c0, $71, $ff, $ee, $01, $7e, $4f, $72, $67, $72, $10
    db $e0, $f0, $f0, $3f, $0f, $cb, $ff, $f0, $fb, $70, $9a, $0f, $9a, $04, $20, $df
    db $6c, $a9, $2f, $df, $9a, $0f, $10, $ef, $b5, $be, $51, $db, $03, $fe, $cf, $ff
    db $81, $88, $03, $ff, $a1, $15, $d8, $58, $00, $58, $e9, $e2, $11, $f9, $e6, $fb
    db $4f, $ea, $00, $bf, $ed, $9c, $00, $ef, $ef, $af, $ef, $f4, $d7, $97, $d3, $13
    db $fa, $02, $fd, $39, $72, $1f, $0d, $f6, $72, $d3, $01, $f4, $04, $05, $05, $1d
    db $ff, $05, $07, $04, $3f, $07, $f6, $04, $06, $ff, $04, $86, $84, $e6, $64, $f2
    db $92, $f1, $bb, $d1, $3d, $91, $f1, $71, $42, $01, $11, $f1, $bf, $17, $46, $21
    db $e1, $c1, $c1, $7f, $c3, $ff, $44, $c4, $45, $c5, $75, $c5, $47, $c4, $f7, $7f
    db $c7, $46, $c4, $5d, $44, $42, $c2, $41, $a7, $c1, $67, $ff, $87, $00, $87, $03
    db $fd, $0e, $ff, $f6, $98, $e8, $b0, $e0, $b0, $c0, $f0, $ff, $90, $e0, $f0, $80
    db $98, $80, $88, $80, $c3, $84, $80, $88, $f5, $90, $16, $ff, $b1, $07, $07, $c3
    db $f8, $f8, $c3, $00, $f1, $c9, $50, $c8, $f8, $9f, $ee, $07, $9f, $00, $d7, $37
    db $80, $ff, $78, $d5, $0f, $d8, $2f, $c4, $d5, $e3, $6f, $f0, $ef, $1c, $0b, $f9
    db $06, $05, $03, $03, $01, $1b, $50, $c2, $00, $87, $04, $b2, $ff, $38, $49, $f6
    db $b7, $fe, $fe, $07, $e5, $01, $ff, $fe, $f3, $70, $68, $01, $68, $04, $44, $b6
    db $bb, $77, $45, $bb, $68, $06, $a2, $5d, $83, $03, $68, $0f, $65, $76, $d3, $0f
    db $b0, $70, $60, $ff, $38, $f3, $f7, $ce, $cd, $03, $8f, $02, $1b, $00, $03, $c3
    db $02, $01, $27, $ff, $df, $f0, $f1, $60, $f0, $f0, $fe, $fe, $0f, $fe, $f2, $ff
    db $fa, $fe, $0c, $01, $ff, $f2, $fe, $0e, $f3, $fe, $02, $fe, $03, $7f, $14, $07
    db $fc, $18, $f8, $e8, $f8, $0f, $f1, $f8, $08, $f8, $09, $22, $12, $21, $23, $00
    db $fc, $52, $2e, $0c, $0f, $11, $fa, $0b, $0a, $00, $0e, $10, $21, $15, $02, $3f
    db $04, $1c, $32, $2b, $af, $f3, $b0, $fe, $7f, $b0, $14, $f8, $f8, $f7, $0c, $1b
    db $06, $07, $9e, $02, $c5, $c7, $17, $06, $0d, $03, $19, $f8, $0e, $ca, $1f, $f4
    db $f8, $b1, $bb, $e3, $00, $18, $86, $13, $3f, $a6, $50, $01, $1f, $60, $60, $9f
    db $9f, $bf, $7f, $bd, $ff, $9f, $ff, $e0, $df, $9f, $d3, $bf, $80, $c7, $20, $53
    db $40, $33, $30, $3f, $2f, $d0, $33, $20, $d3, $f3, $d4, $5e, $dd, $4f, $f1, $f0
    db $e7, $5f, $00, $af, $5a, $92, $ef, $0f, $0f, $ff, $ff, $30, $f0, $c0, $c0, $00
    db $c0, $80, $c0, $bf, $40, $1f, $24, $78, $f8, $7c, $84, $0c, $04, $cf, $06, $02
    db $2c, $2b, $00, $03, $07, $0b, $04, $3e, $ad, $9b, $e1, $c7, $00, $78, $00, $81
    db $84, $83, $f0, $f0, $01, $fb, $55, $09, $59, $54, $16, $e8, $17, $31, $69, $55
    db $0f, $f4, $0b, $75, $7e, $54, $ef, $ce, $f3, $00, $35, $00, $fb, $06, $da, $09
    db $80, $80, $ff, $ff, $60, $ff, $10, $7f, $08, $38, $08, $bf, $3f, $be, $05, $0e
    db $31, $1f, $7e, $01, $41, $47, $3a, $01, $ce, $10, $44, $1a, $00, $e0, $20, $70
    db $e8, $10, $30, $10, $bd, $18, $de, $30, $bd, $aa, $01, $e9, $03, $00, $60, $ce
    db $f8, $14, $03, $d2, $fe, $f9, $3e, $ff, $c1, $ff, $fe, $59, $30, $fc, $c1, $fd
    db $fe, $3f, $c0, $ff, $80, $7f, $09, $20, $83, $ec, $7f, $bd, $7f, $fa, $41, $bf
    db $15, $f5, $1e, $df, $fe, $01, $2f, $0f, $ff, $01, $7f, $01, $9f, $0f, $a4, $3d
    db $f7, $a6, $b5, $00, $7f, $c0, $40, $c0, $7f, $65, $7c, $fc, $a3, $7e, $cd, $03
    db $02, $86, $01, $71, $03, $ce, $cf, $10, $71, $06, $01, $d1, $22, $4a, $48, $8f
    db $48, $30, $cb, $f3, $cb, $11, $3f, $cb, $4b, $b5, $00, $e0, $67, $9c, $33, $df
    db $9d, $43, $c0, $bd, $41, $04, $01, $86, $09, $09, $0b, $b1, $1f, $ff, $09, $0f
    db $0e, $0d, $09, $0d, $f8, $0d, $ba, $08, $bd, $00, $05, $04, $03, $c3, $02, $c5
    db $60, $5f, $4a, $b5, $fc, $00, $d2, $ff, $db, $fe, $eb, $ff, $fc, $27, $fc, $07
    db $08, $0f, $f0, $1f, $6f, $df, $e0, $3f, $e3, $14, $7f, $42, $7f, $c2, $fe, $7f
    db $cb, $ff, $cf, $ff, $ef, $ff, $f2, $7f, $d2, $00, $fe, $7f, $7e, $7e, $fd, $7d
    db $fd, $bf, $3d, $02, $ff, $18, $08, $18, $ff, $08, $0f, $8b, $40, $99, $11, $c0
    db $67, $20, $60, $50, $30, $54, $46, $23, $7b, $83, $fe, $8a, $54, $1e, $83, $83
    db $11, $a7, $fc, $83, $07, $5e, $00, $de, $f0, $0f, $0f, $1f, $f2, $50, $f2, $4e
    db $04, $f0, $3f, $0f, $3e, $01, $61, $5d, $fe, $f1, $5b, $00, $95, $69, $20, $27
    db $e0, $ce, $ff, $80, $28, $05, $74, $02, $ff, $0b, $7e, $11, $fb, $2f, $ff, $3f
    db $ff, $bf, $f8, $fa, $fe, $ff, $fb, $fd, $ef, $f9, $ef, $f5, $bf, $e4, $fd, $94
    db $d4, $ff, $94, $ff, $50, $99, $00, $40, $c1, $40, $ff, $9e, $3c, $56, $a1, $b0
    db $f4, $b7, $ff, $ae, $0e, $30, $31, $0f, $3a, $01, $00, $f0, $3a, $13, $a7, $7f
    db $3a, $e3, $c1, $60, $42, $fc, $0f, $03, $cb, $ff, $fc, $4f, $70, $ee, $03, $ee
    db $04, $88, $77, $6d, $fd, $8b, $77, $ee, $02, $44, $bb, $09, $03, $ff, $fe, $0a
    db $fe, $0e, $fe, $2e, $ff, $3c, $ff, $fc, $bb, $fb, $f7, $f7, $ef, $ef, $ee, $7f
    db $1f, $41, $de, $78, $c8, $fe, $46, $41, $41, $38, $9f, $4e, $02, $09, $ff, $0d
    db $ab, $74, $24, $35, $17, $a3, $ff, $53, $4a, $25, $71, $e2, $01, $01, $fe, $ff
    db $06, $09, $09, $3b, $0b, $8b, $0b, $7f, $fe, $09, $0f, $0e, $fd, $09, $0d, $08
    db $81, $20, $ef, $fd, $04, $03, $ec, $e2, $fb, $1a, $ff, $e7, $e6, $ff, $f6, $91
    db $10, $90, $1e, $e7, $fe, $bf, $07, $9a, $35, $0b, $fa, $33, $f2, $d3, $f2, $b7
    db $13, $a6, $11, $09, $af, $00, $38, $18, $38, $ff, $f8, $0c, $1c, $e4, $e4, $fb
    db $fb, $49, $fe, $4b, $14, $15, $9a, $9a, $c1, $c1, $75, $f5, $4a, $4a, $37, $37
    db $f2, $11, $3f, $cd, $1f, $fc, $ff, $9f, $ff, $cf, $ff, $7f, $d1, $1f, $3c, $3b
    db $4d, $f9, $5e, $e0, $00, $1f, $65, $20, $0f, $f0, $c7, $f0, $0f, $30, $15, $60
    db $30, $f0, $3f, $0f, $db, $3e, $01, $23, $40, $fe, $f1, $21, $3f, $00, $3f, $2f
    db $fb, $3e, $0e, $07, $0f, $07, $8f, $83, $ff, $4f, $43, $3f, $23, $1f, $13, $ff
    db $0b, $f7, $ff, $e7, $7f, $3f, $21, $00, $1f, $06, $6f, $ef, $62, $ef, $e3, $53
    db $07, $01, $b7, $b1, $ff, $f7, $f1, $e3, $e1, $c3, $c3, $cf, $dc, $ff, $83, $80
    db $03, $80, $01, $81, $0f, $9e, $ff, $81, $00, $01, $80, $00, $40, $81, $41, $fc
    db $03, $47, $80, $40, $03, $57, $89, $00, $83, $fd, $00, $50, $03, $4f, $00, $20
    db $95, $35, $30, $dc, $03, $27, $95, $28, $03, $c7, $83, $01, $8d, $fe, $80, $7d
    db $fc, $0f, $03, $ff, $fc, $15, $70, $5b, $b4, $03, $b4, $04, $88, $77, $c3, $8b
    db $77, $60, $b4, $0f, $44, $bb, $cf, $de, $b0, $0e, $2a, $00, $2a, $fb, $81, $fe
    db $c1, $fe, $d1, $2b, $00, $fe, $f5, $df, $fe, $fd, $fe, $ff, $fd, $7f, $ff, $5f
    db $77, $05, $00, $1f, $1f, $ff, $0a, $17, $ff, $87, $74, $0f, $00, $83, $83, $ff
    db $14, $c0, $17, $20, $1c, $d5, $ff, $60, $1f, $00, $e0, $20, $e0, $23, $10, $b0
    db $d7, $f0, $30, $2b, $70, $2e, $03, $50, $f8, $98, $d6, $78, $18, $35, $78, $33
    db $03, $7c, $0c, $3f, $ff, $34, $ff, $c4, $7c, $04, $fc, $04, $ff, $df, $0c, $fc
    db $4e, $00, $ec, $fc, $1c, $fe, $e4, $ff, $fc, $f4, $ff, $f4, $fc, $e4, $ff, $1c
    db $97, $e6, $4b, $60, $10, $06, $b0, $fc, $3c, $f4, $fd, $dc, $f4, $1c, $fc, $10
    db $f0, $6f, $cd, $00, $00, $7f

ENDL
