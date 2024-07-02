; Disassembly of "poker.gbf"

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
    dk "POKER       "
.icon
.end

History:
.points
    dw 1
.author
    db "S.KIMURA\n\n", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    jx jx_0ebc


call_0044:
    xor a
    trap PlayMusic
    trap ExitToMenu


call_0049:
    ld a, $20
    trap DrawInit
    trap StopAudio
    ld e, $00
    ld bc, $040a
    ld hl, $c700
    trap MemSet
    ldx de, data_0d19
    ld b, $c7
    trap InitDecompress
    ld de, $c800
    ld bc, $01f9
    trap RunDecompress
    ld hl, $c600
    ld de, $c400
    ld bc, $0100
    trap MemCopy
    ld hl, $9200
    ld bc, $03b0

jr_000_007a::
    ld a, [hl]
    sla a
    or [hl]
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_000_007a

    ld hl, $8802
    ld de, $8800
    ld c, $00

jr_000_008c::
    ld b, $07

jr_000_008e::
    push bc
    ld a, [de]
    ld b, a
    ld a, [hl+]
    srl a
    or b
    ld [de], a
    inc de
    inc de
    inc hl
    pop bc
    dec b
    jr nz, jr_000_008e

    inc hl
    inc hl
    inc de
    inc de
    dec c
    jr nz, jr_000_008c

    ld bc, $0010
    ld de, $9210
    ld hl, $95b0
    trap MemCopy
    ld bc, $0010
    ld de, $9240
    ld hl, $95c0
    trap MemCopy
    ld bc, $0010
    ld de, $92b0
    ld hl, $95d0
    trap MemCopy
    ld bc, $0010
    ld de, $92d0
    ld hl, $95e0
    trap MemCopy
    ld bc, $0010
    ld de, $92e0
    ld hl, $95f0
    trap MemCopy
    ld bc, $01f0
    ld de, $8b10
    ld hl, $9010
    trap MemCopy
    ld bc, $00e0
    ld de, $8d00
    ld hl, $9210
    trap MemCopy
    ldx de, data_0ba3
    ld b, $c7
    trap InitDecompress
    ld de, $8b10
    ld bc, $0330
    trap RunDecompress
    ld bc, $0020
    ldx de, data_0cec
    ld hl, $8000
    trap MemCopy
    ld a, $e4
    ldh [$9c], a
    ld a, $e4
    ldh [$9d], a
    ld a, $e4
    ldh [$9e], a
    ld hl, $ca28
    ld a, $01
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ret


    ld a, [hl+]
    sub e
    ld e, a
    push af
    ld a, [hl+]
    sbc d
    ld d, a
    push af
    ld a, [hl+]
    sbc c
    ld c, a
    push af
    ld a, [hl+]
    sbc b
    ld b, a
    push af
    ld a, $80
    pop hl
    and l
    res 7, l
    or l
    pop hl
    set 4, l
    and l
    pop hl
    set 4, l
    and l
    pop hl
    set 4, l
    and l
    ld l, a
    push hl
    pop af
    ret


    push hl
    ld hl, $ca8f
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld bc, $0000
    ld de, $0000
    ld hl, $ca93
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld hl, $ca8f
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    pop hl
    ld l, $08

jr_000_0176::
    sla h
    jr nc, jr_000_01b4

    push hl
    push hl
    ld hl, $ca8f
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    pop hl

jr_000_0188::
    dec l
    jr z, jr_000_0199

    push hl
    sla e
    rl d
    rl c
    rl b
    jr c, jr_000_01cc

    pop hl
    jr jr_000_0188

jr_000_0199::
    ld hl, $ca93
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl+]
    adc d
    ld d, a
    ld a, [hl+]
    adc c
    ld c, a
    ld a, [hl]
    adc b
    ld b, a
    ld hl, $ca93
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    pop hl

jr_000_01b4::
    dec l
    jr nz, jr_000_0176

    ld hl, $ca93
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    bit 7, b
    ret z

    ld bc, $7fff
    ld de, $ffff
    ret


jr_000_01cc::
    pop hl
    pop hl
    ret


    ld a, $02
    ld [$ca78], a
    ld a, [$ca77]
    ld b, a
    ldh a, [$8b]
    cp h
    jr nz, jr_000_01e2

    xor a
    ld [$ca78], a
    ret


jr_000_01e2::
    cp l
    jr nz, jr_000_01eb

    ld a, $01
    ld [$ca78], a
    ret


jr_000_01eb::
    cp d
    jr nz, jr_000_01f1

    dec b
    jr jr_000_01f5

jr_000_01f1::
    cp e
    jr nz, jr_000_01f5

    inc b

jr_000_01f5::
    ld a, b
    cp $ff
    jr nz, jr_000_01fe

    ld a, c
    dec a
    jr jr_000_0202

jr_000_01fe::
    cp c
    jr nz, jr_000_0202

    xor a

jr_000_0202::
    ld [$ca77], a
    ret


    ld hl, $ca79
    ld a, [$ca77]
    sla a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ld e, a
    ld hl, $c300
    ld a, c
    sla a
    sla a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld [hl], d
    inc hl
    ld [hl], e
    inc hl
    ld [hl], b
    ret


    ld hl, $c9f9
    ld a, [hl+]
    xor $09
    ret nz

    ld a, [hl]
    or $00
    ret nz

    ld a, $03
    callx @+$11ce
    ld a, $0c
    trap $b9
    ld hl, $0703
    trap MovePen
    ld hl, $c800
    trap DrawString
    ld hl, $0707
    trap MovePen
    ld hl, $c806
    trap DrawString
    ld hl, $0709
    trap MovePen
    ld hl, $c80b
    trap DrawString
    ld hl, $020f
    trap MovePen
    ld hl, $c813
    trap DrawString
    callx @+$0ecc
    ld hl, $ca1c
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld hl, $ca83
    trap $a0
    ld hl, $080f
    trap MovePen
    ld hl, $ca84
    trap DrawString
    ldx de, data_0ea6
    ld hl, $ca79
    ld bc, $0004
    trap MemCopy
    xor a
    ld [$ca77], a
    callx @+$0ee2
    ld a, $08
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    ret


    trap RandNext
    ld a, [$c9f9]
    xor $08
    ret nz

    ld a, [$c9fa]
    or $00
    ret nz

    ld bc, $0100
    callx @+$ff42
    ld c, $02
    ld hl, $01ff
    ld de, $4080
    callx @+$fefc
    ld a, [$ca78]
    cp $02
    ret z

    ld a, [$ca77]
    cp $00
    jr nz, jr_000_02f4

    ld hl, $c300
    xor a
    ld [hl+], a
    ld [hl], a
    ld a, $11
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    ret


jr_000_02f4::
    ld a, $02
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    ret


    ld a, [$c9f9]
    xor $11
    ret nz

    ld a, [$c9fa]
    xor $00
    ret nz

    ld a, $04
    callx @+$10fa
    callx @+$0dbd
    callx @+$0dd2
    callx @+$103f
    ldx de, data_0e88
    ld hl, $c9fb
    ld bc, $0014
    trap MemCopy
    callx @+$0c5c
    callx @+$0e43
    xor a
    ld hl, $c300
    ld [hl+], a
    ld [hl], a
    ld a, $0c
    trap $b9
    ld hl, $0201
    trap MovePen
    ld hl, $c813
    trap DrawString
    ld hl, jr_000_0202
    trap MovePen
    ld hl, $c81c
    trap DrawString
    ld bc, $0103
    ld de, $1001
    callx @+$0d0c
    ld bc, $010e
    ld de, $1001
    callx @+$0cff
    ld a, $11
    ld [$c9f9], a
    ld a, $01
    ld [$c9fa], a
    ret


    ld a, [$c9f9]
    xor $11
    ret nz

    ld a, [$c9fa]
    xor $01
    ret nz

    callx @+$0da6
    ld hl, $ca28
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    push de
    push bc
    ld hl, $ca1c
    callx @+$fd77
    jr c, jr_000_03cc

    ld hl, $ca1c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    pop bc
    pop de
    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    jr jr_000_03f5

jr_000_03cc::
    pop bc
    pop de
    ld hl, $ca1c
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld de, $0000
    ld bc, $0000
    ld hl, $ca1c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a

jr_000_03f5::
    callx @+$0fdc
    callx @+$0ff0
    ld a, $03
    callx @+$0d8d
    ld a, $04
    callx @+$0d9d
    ld a, $10
    ld [$c9f9], a
    ld a, $01
    ld [$c9fa], a
    ret


    ld a, [$c9f9]
    xor $10
    ret nz

    ld a, [$c9fa]
    xor $01
    ret nz

    ld a, [$ca9a]
    bit 0, a
    jr z, jr_000_045b

    ld hl, $ca20
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld hl, $ca28
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    callx @+$0cd3
    ld a, $11
    ld [$c9f9], a
    ld a, $02
    ld [$c9fa], a
    ret


jr_000_045b::
    bit 5, a
    jr z, jr_000_046e

    ld bc, $0000
    ld de, $0001
    callx @+$004a
    jr jr_000_04a4

jr_000_046e::
    bit 4, a
    jr z, jr_000_0481

    ld bc, $0000
    ld de, $0001
    callx @+$00cc
    jr jr_000_04a4

jr_000_0481::
    bit 7, a
    jr z, jr_000_0494

    ld bc, $0000
    ld de, $000a
    callx @+$0024
    jr jr_000_04a4

jr_000_0494::
    bit 6, a
    ret z

    ld bc, $0000
    ld de, $000a
    callx @+$00a7

jr_000_04a4::
    callx @+$0f2d
    callx @+$0f41
    ret


    push bc
    push de
    ld hl, $ca20
    callx @+$fc68
    jr z, jr_000_04f4

    jr c, jr_000_04f4

    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    pop de
    pop bc
    ld hl, $ca1c
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl+]
    adc d
    ld d, a
    ld a, [hl+]
    adc c
    ld c, a
    ld a, [hl]
    adc b
    ld b, a
    ld hl, $ca1c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld a, $2b
    callx @+$0f25
    ret


jr_000_04f4::
    ld hl, $ca1c
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld hl, $ca20
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl+]
    adc d
    ld d, a
    ld a, [hl+]
    adc c
    ld c, a
    ld a, [hl]
    adc b
    ld b, a
    ld hl, $ca1c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld de, $0001
    ld bc, $0000
    ld hl, $ca1c
    callx @+$fbfe
    ld hl, $ca1c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld de, $0001
    ld bc, $0000
    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    pop de
    pop bc
    ret


    push bc
    push de
    ld hl, $ca1c
    callx @+$fbd3
    jr z, jr_000_0589

    jr c, jr_000_0589

    ld hl, $ca1c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    pop de
    pop bc
    ld hl, $ca20
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl+]
    adc d
    ld d, a
    ld a, [hl+]
    adc c
    ld c, a
    ld a, [hl]
    adc b
    ld b, a
    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld a, $2b
    callx @+$0e90
    ret


jr_000_0589::
    ld hl, $ca1c
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld hl, $ca20
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl+]
    adc d
    ld d, a
    ld a, [hl+]
    adc c
    ld c, a
    ld a, [hl]
    adc b
    ld b, a
    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    ld de, $0000
    ld bc, $0000
    ld hl, $ca1c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    pop de
    pop bc
    ret


    ld a, [$c9f9]
    xor $11
    ret nz

    ld a, [$c9fa]
    xor $02
    ret nz

    ld a, $01
    callx @+$0bc2
    ld a, $02
    callx @+$0bd2
    ld hl, $080c
    trap MovePen
    ld hl, $c84e
    trap DrawString
    xor a
    ld [$ca77], a
    ldx de, data_0e9c
    ld hl, $ca79
    ld bc, $000a
    trap MemCopy
    callx @+$09c3
    ld a, $10
    ld [$c9f9], a
    ld a, $02
    ld [$c9fa], a
    ret


    ld a, [$c9f9]
    xor $10
    ret nz

    ld a, [$c9fa]
    xor $02
    ret nz

    ld bc, $0000
    callx @+$fbe7
    ld c, $05
    ld h, $01
    ld l, $80
    ld d, $20
    ld e, $10
    callx @+$fb9f
    ld a, [$ca78]
    cp $02
    ret z

    cp $01
    jr nz, jr_000_0648

    ld a, $10
    ld [$c9f9], a
    ld a, $04
    ld [$c9fa], a
    ret


jr_000_0648::
    ld a, $01
    callx @+$0dc7
    ld hl, $ca41
    ld a, [$ca77]
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    xor $40
    ld [hl], a
    callx @+$0930
    ld hl, $c9fb
    ld a, [$ca77]
    ld e, a
    sla a
    sla a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl+]
    ld b, a
    inc hl
    ld a, [hl]
    bit 6, a
    jr z, jr_000_0685

    ld c, $06
    jr jr_000_0687

jr_000_0685::
    ld c, $07

jr_000_0687::
    callx @+$09c4
    ret


    ld a, [$c9f9]
    xor $10
    ret nz

    ld a, [$c9fa]
    xor $04
    ret nz

    ld hl, $c300
    ld a, $70
    ld [hl+], a
    ld a, $3c
    ld [hl+], a
    ld a, $01
    ld [hl], a
    ldh a, [$8b]
    bit 6, a
    jr z, jr_000_06b8

    ld a, $10
    ld [$c9f9], a
    ld a, $02
    ld [$c9fa], a
    ret


jr_000_06b8::
    bit 0, a
    ret z

    ld a, $10
    ld [$c9f9], a
    ld a, $08
    ld [$c9fa], a
    ld hl, $c300
    xor a
    ld [hl+], a
    ld [hl+], a
    ret


    ld a, [$c9f9]
    xor $10
    ret nz

    ld a, [$c9fa]
    xor $08
    ret nz

    ld hl, $010c
    trap MovePen
    ld hl, $c8b8
    trap DrawString
    ld a, $00
    callx @+$0ac7
    callx @+$08bc
    ld c, $00
    ld de, $ca46
    ld hl, $ca41
    ld b, $05

jr_000_06fc::
    bit 6, [hl]
    jr z, jr_000_0706

    ld a, [de]
    set 6, a
    ld [hl], a
    inc de
    inc c

jr_000_0706::
    inc hl
    dec b
    jr nz, jr_000_06fc

    ld a, c
    and a
    jr z, jr_000_0741

    callx @+$0883
    callx @+$08a8

jr_000_071c:
    ldh a, [$8b]
    and a
    jr z, jr_000_071c

    ld hl, $ca41
    ld b, $05

jr_000_0726::
    res 6, [hl]
    inc hl
    dec b
    jr nz, jr_000_0726

    callx @+$0c35
    callx @+$085e
    callx @+$0883

jr_000_0741:
    callx @+$00ac
    push af
    add $08
    callx @+$0a47
    pop af
    push af
    and a
    jr z, jr_000_076b

    ld a, $04
    callx @+$0cb8
    ld d, $0a
    callx @+$0aa6
    jr jr_000_0774

jr_000_076b::
    ld a, $12
    callx @+$0ca4

jr_000_0774::
    trap GetSoundState
    and a
    jr nz, jr_000_0774

    pop af
    push af
    ld hl, $ca20
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    pop af
    push af
    ldx hl, data_0eb2
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld h, a
    callx @+$f9b3
    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    callx @+$0c46
    callx @+$096f
    ld a, $15
    callx @+$09f5

jr_000_07bd::
    ldh a, [$8b]
    and a
    jr z, jr_000_07bd

    pop af
    cp $00
    jr nz, jr_000_07e6

    xor a
    trap PlayMusic
    ld bc, $3650
    callx @+$0a73
    callx @+$0be6
    ld a, $11
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    ret


jr_000_07e6::
    ld a, $11
    ld [$c9f9], a
    ld a, $20
    ld [$c9fa], a
    ret


    ld hl, $ca9b
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld hl, $ca41
    ld b, $05

jr_000_0802::
    ld a, [hl+]
    push hl
    push af
    and $30
    srl a
    srl a
    srl a
    ld hl, $ca9b
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    push af
    and $08
    srl a
    srl a
    srl a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    pop af
    and $07
    ld c, a
    ld a, $80
    inc c

jr_000_082d::
    dec c
    jr z, jr_000_0834

    srl a
    jr jr_000_082d

jr_000_0834::
    ld c, [hl]
    or c
    ld [hl], a
    pop hl
    dec b
    jr nz, jr_000_0802

    ld b, $05
    ld hl, $ca9b

jr_000_0840::
    ld a, [hl+]
    and $40
    rlc a
    rlc a
    rlc a
    ld c, [hl]
    or c
    ld [hl+], a
    dec b
    jr nz, jr_000_0840

    ld hl, $ca9b
    ld a, [hl+]
    inc hl
    or [hl]
    inc hl
    inc hl
    or [hl]
    inc hl
    inc hl
    or [hl]
    ld [$caa3], a
    ld hl, $ca9c
    ld a, [hl+]
    inc hl
    or [hl]
    inc hl
    inc hl
    or [hl]
    inc hl
    inc hl
    or [hl]
    ld [$caa4], a
    callx @+$00c1
    jr nz, jr_000_0899

    callx @+$00d6
    jr c, jr_000_0896

    ld hl, $caa3
    ld b, [hl]
    inc hl
    ld c, [hl]
    ld de, $403e
    ld a, b
    xor d
    ld b, a
    ld a, c
    xor e
    or b
    jr nz, jr_000_0893

    ld a, $09
    ret


jr_000_0893::
    ld a, $08
    ret


jr_000_0896::
    ld a, $04
    ret


jr_000_0899::
    callx @+$00b3
    jr c, jr_000_08a5

    ld a, $05
    ret


jr_000_08a5::
    ld hl, $caa3
    ld d, [hl]
    inc hl
    ld e, [hl]
    sla e
    rl d
    ld a, $00
    ld b, $0d

jr_000_08b3::
    sla e
    rl d
    adc $00
    dec b
    jr nz, jr_000_08b3

    cp $05
    jr nz, jr_000_08c3

    ld a, $00
    ret


jr_000_08c3::
    cp $04
    jr nz, jr_000_08ca

    ld a, $01
    ret


jr_000_08ca::
    cp $02
    jr nz, jr_000_08f0

    ld hl, $ca9b
    ld a, [hl+]
    inc hl
    and [hl]
    inc hl
    inc hl
    and [hl]
    inc hl
    inc hl
    and [hl]
    ld b, a
    ld hl, $ca9c
    ld a, [hl+]
    inc hl
    and [hl]
    inc hl
    inc hl
    and [hl]
    inc hl
    inc hl
    and [hl]
    or b
    jr z, jr_000_08ed

    ld a, $07
    ret


jr_000_08ed::
    ld a, $06
    ret


jr_000_08f0::
    ld hl, $ca9b
    ld b, [hl]
    inc hl
    inc hl
    ld c, [hl]
    inc hl
    inc hl
    ld d, [hl]
    inc hl
    inc hl
    ld e, [hl]
    ld a, d
    xor e
    and c
    and b
    push af
    ld a, b
    xor c
    and e
    and d
    ld b, a
    pop af
    or b
    ld [$caa5], a
    ld hl, $ca9c
    ld b, [hl]
    inc hl
    inc hl
    ld c, [hl]
    inc hl
    inc hl
    ld d, [hl]
    inc hl
    inc hl
    ld e, [hl]
    ld a, d
    xor e
    and c
    and b
    push af
    ld a, b
    xor c
    and e
    and d
    ld b, a
    pop af
    or b
    ld b, a
    ld a, [$caa5]
    or b
    jr z, jr_000_092f

    ld a, $03
    ret


jr_000_092f::
    ld a, $02
    ret


    ld hl, $caa3
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ld e, a
    ld bc, $7c00
    ld h, $0a

jr_000_093e::
    ld a, d
    and b
    sub b
    ld l, a
    ld a, e
    and c
    sub c
    or l
    ret z

    srl b
    rr c
    dec h
    jr nz, jr_000_093e

    rla
    ret


    ld hl, $ca9b
    ld c, $04

jr_000_0955::
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld e, a
    sla e
    rl d
    ld a, $00
    ld b, $0d

jr_000_0961::
    sla e
    rl d
    adc $00
    dec b
    jr nz, jr_000_0961

    cp $05
    ret nc

    dec c
    jr nz, jr_000_0955

    scf
    ret


    ld a, [$c9f9]
    xor $11
    ret nz

    ld a, [$c9fa]
    xor $20
    ret nz

    ld a, $0f
    callx @+$0a87
    ld a, $05
    callx @+$0809
    callx @+$0834
    ld a, $10
    ld [$c9f9], a
    ld a, $20
    ld [$c9fa], a
    ret


    ld a, [$c9f9]
    xor $10
    ret nz

    ld a, [$c9fa]
    xor $20
    ret nz

    callx @+$0830
    cp $02
    ret z

    cp $00
    jr nz, jr_000_09c7

jr_000_09bc::
    ld a, $21
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    ret


jr_000_09c7::
    ld hl, $ca20
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld hl, $ca1c
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl+]
    adc d
    ld d, a
    ld a, [hl+]
    adc c
    ld c, a
    ld a, [hl]
    adc b
    ld b, a
    ld hl, $ca1c
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    callx @+$0730
    ld a, $11
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    ret


    ld a, [$c9f9]

Jump_000_0a01::
    xor $21
    ret nz

    ld a, [$c9fa]
    xor $00
    ret nz

    ld a, $07
    callx @+$09fb
    callx @+$06be
    callx @+$06d3
    ld a, $0c
    trap $b9
    ld a, [$ca41]
    set 7, a
    ld e, a
    ld bc, $0707
    callx @+$05b6
    ld a, [$ca42]
    res 7, a
    ld e, a
    ld bc, $0b07
    callx @+$05a6
    ld bc, $0103
    ld de, $1001
    callx @+$0628
    ld bc, $010e
    ld de, $1001
    callx @+$061b
    ld hl, $0201
    trap MovePen
    ld hl, $c813
    trap DrawString
    ld hl, jr_000_0202
    trap MovePen
    ld hl, $c81c
    trap DrawString
    callx @+$095e
    callx @+$0972
    ld a, $12
    callx @+$070f
    callx @+$073a
    ld a, $20
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    ret


    ld a, [$c9f9]
    xor $20
    ret nz

    ld a, [$c9fa]
    xor $00
    ret nz

    callx @+$0736
    cp $02
    ret z

    push af
    ld a, [$ca42]
    set 7, a
    ld e, a
    ld bc, $0b07
    callx @+$0528
    ld a, $00
    callx @+$06e6
    xor a
    ld [$c300], a
    ld a, [$ca41]
    and $0f
    ld b, a
    ld a, [$ca42]
    and $0f
    ld c, a
    pop af
    and a
    jr nz, jr_000_0ae4

    ld a, c
    sub b
    jr jr_000_0ae6

jr_000_0ae4::
    ld a, b
    sub c

jr_000_0ae6::
    jr z, jr_000_0aee

    jr nc, jr_000_0b45

    cp $f4
    jr z, jr_000_0b45

jr_000_0aee::
    ld a, $12
    callx @+$0921
    ld a, $13
    callx @+$0699
    ld de, $0000
    ld bc, $0000
    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    callx @+$08db
    ld a, $15
    callx @+$0691

jr_000_0b21::
    ldh a, [$8b]
    and a
    jr z, jr_000_0b21

    xor a
    trap PlayMusic
    ld bc, $3650
    callx @+$0714
    callx @+$0887
    ld a, $11
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    ret


jr_000_0b45::
    cp $0c
    jr z, jr_000_0aee

    ld a, $04
    callx @+$08c6
    ld a, $14
    callx @+$063e
    ld hl, $ca20
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld h, $02
    callx @+$f5df
    ld hl, $ca20
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
    callx @+$0872
    ld d, $0a
    callx @+$0685
    ld a, $15
    callx @+$061f

jr_000_0b93::
    ldh a, [$8b]
    and a
    jr z, jr_000_0b93

    ld a, $11
    ld [$c9f9], a
    ld a, $20
    ld [$c9fa], a
    ret


data_0ba3:
    INCBIN "gfx/poker/tiles.2bpp.hz"

data_0cec:
    db $00, $18, $18, $3c, $3c, $7e, $7e, $ff, $00, $ff, $00, $00, $00, $00, $00, $00
    db $00, $e0, $60, $f8, $78, $fe, $7e, $ff, $7e, $ff, $78, $fe, $60, $f8, $00, $e0

data_0d0c:
    db $20, $20, $03, $02, $02, $20, $20, $03, $02, $02, $20, $20, $00

data_0d19:
    db $ff, $50, $4f, $4b, $45, $52, $00
    db $6d, $70, $ff, $5e, $74, $00, $0f, $bc, $ad, $b3, $d8, $df, $ae, $b3, $f9, $10
    db $ae, $bc, $de, $b7, $dd, $b5, $5c, $f9, $b6, $b9, $07, $00, $20, $09, $0e, $ff
    db $20, $66, $5e, $c4, $de, $0f, $a6, $ba, $ff, $b3, $b6, $dd, $bc, $c3, $b8, $c0
    db $de, $e7, $bb, $b2, $20, $12, $10, $29, $41, $ce, $de, $ff, $70, $2e, $0f, $c3
    db $de, $be, $dd, $c0, $9f, $b8, $29, $10, $26, $0f, $b9, $af, $c3, $b2, $1c, $f9
    db $00, $29, $0c, $25, $a6, $b7, $d2, $20, $3b, $10, $5f, $29, $cb, $22, $00, $d8
    db $20, $5e, $31, $20, $f8, $d0, $b7, $de, $20, $5d, $5f, $26, $20, $22, $ff, $cc
    db $de, $2a, $61, $af, $cc, $df, $0f, $ff, $c6, $bd, $bd, $d0, $cf, $bd, $b6, $3f
    db $73, $26, $30, $ce, $df, $5e, $15, $19, $03, $c2, $c2, $c4, $de, $b9, $7a, $54
    db $30, $29, $ca, $52, $10, $29, $e0, $b2, $b2, $b4, $39, $32, $38, $a8, $a3, $27
    db $38, $20, $5f, $6e, $70, $b1, $dc, $2d, $2e, $cd, $df, $61, $6c, $b2, $72, $5e
    db $d5, $e1, $6d, $29, $85, $17, $0b, $7b, $ec, $74, $2b, $5e, $74, $b2, $bc, $7c
    db $28, $ef, $af, $6c, $ad, $10, $2a, $7a, $63, $6d, $43, $10, $cd, $ab, $fa, $0b
    db $36, $1d, $7f, $19, $a4, $62, $cf, $25, $2a, $52, $94, $06, $d0, $b7, $de, $c9
    db $ff, $ce, $b3, $b6, $de, $b5, $b5, $b7, $b2, $fb, $c4, $b5, $d3, $b3, $3f, $a6
    db $ca, $bd, $e7, $de, $da, $5b, $b2, $55, $85, $b1, $c0, $d8, $37, $90, $61, $4e
    db $41, $ce, $c2, $02, $2e, $0f, $a6, $ff, $b5, $bc, $c3, $b8, $c0, $de, $bb, $b2
    db $7e, $95, $bc, $ae, $bc, $de, $b7, $dd, $79, $00, $ff, $5c, $30, $c6, $c5, $d8
    db $cf, $bc, $c0, $7e, $71, $bb, $d6, $b3, $c5, $d7, $5f, $d7, $00, $fb, $00, $50
    db $55, $53, $48, $ac, $4e, $59, $f8, $20, $4b, $45, $59, $00

data_0e5c:
    db $b8, $c8, $24, $c8
    db $39, $c8, $54, $c8
    db $67, $c8, $7b, $c8
    db $91, $c8, $a6, $c8
    db $ca, $c8, $dd, $c8
    db $f0, $c8, $03, $c9
    db $16, $c9, $28, $c9
    db $3a, $c9, $4c, $c9
    db $5f, $c9, $71, $c9
    db $83, $c9, $96, $c9
    db $a9, $c9, $bb, $c9

data_0e88:
    db $05, $07, $81, $00
    db $07, $07, $81, $00
    db $09, $07, $81, $00
    db $0b, $07, $81, $00
    db $0d, $07, $81, $00

data_0e9c:
    db $64, $34, $64, $44, $64, $54, $64, $64, $64, $74

data_0ea6:
    db $48, $34, $58, $34
data_0eaa:
    db $88, $2c, $88, $5c
data_0eae:
    db $88, $13, $00, $00
data_0eb2:
    db $00, $01, $02, $05, $0a, $32, $50, $64, $96, $ff


jx_0ebc:
    ld sp, $e000
    callx @+$f186
    ld a, $03
    trap LCDEnable
    ld a, $01
    ld [$cb09], a
    ld a, [$0014]
    cp $01
    jr z, jr_000_0ede

    cp $fe
    jr z, jr_000_0ede

    xor a
    ld [$cb09], a

jr_000_0ede::
    ld hl, $1f0f
    trap $b6
    ldx hl, data_0eae
    ld a, [hl+]
    or [hl]
    inc hl
    or [hl]
    inc hl
    or [hl]
    and a
    jr nz, jr_000_0ef4

    jx @+$0414


jr_000_0ef4::
    ld a, $09
    ld [$c9f9], a
    ld a, $00
    ld [$c9fa], a
    callx @+$0247
    callx @+$f323
    callx @+$f39f
    callx @+$f3e8
    callx @+$f468
    callx @+$f4fb
    callx @+$f696
    callx @+$f6d9
    callx @+$f755
    callx @+$f78b
    callx @+$fa2a
    callx @+$fa53
    callx @+$faa8
    callx @+$fb3f
    ld a, [$c9f9]
    and $02
    jr z, jr_000_0f6b

    jx @+$f0dc


jr_000_0f6b::
    ldh a, [$8a]
    bit 2, a
    jr z, jr_000_0f75

    jx @+$f0d2


jr_000_0f75::
    trap AwaitFrame
    jx @+$ff86


    ld hl, $ca41
    ld b, $05

jr_000_0f80::
    ld a, [hl]
    and $7f
    ld [hl+], a
    dec b
    jr nz, jr_000_0f80

    ret


    ld hl, $ca41
    ld b, $05

jr_000_0f8d::
    ld a, [hl]
    or $80
    ld [hl+], a
    dec b
    jr nz, jr_000_0f8d

    ret


    ld de, $c9fd
    ld hl, $ca41
    ld b, $05

jr_000_0f9d::
    ld a, [hl+]
    ld [de], a
    ld a, $04
    add e
    ld e, a
    ld a, d
    adc $00
    ld d, a
    dec b
    jr nz, jr_000_0f9d

    ret


    ld de, $c9fd
    ld hl, $ca41
    ld b, $05

jr_000_0fb3::
    ld a, [de]
    ld [hl+], a
    ld a, $04
    add e
    ld e, a
    ld a, d
    adc $00
    ld d, a
    dec b
    jr nz, jr_000_0fb3

    ret


    ld hl, $ca41
    ld de, $0500
    ld b, $05

jr_000_0fc9::
    ld a, [hl+]
    bit 6, a
    jr z, jr_000_0fd2

    ld c, $06
    jr jr_000_0fd4

jr_000_0fd2::
    ld c, $07

jr_000_0fd4::
    push hl
    push de
    callx @+$0075
    pop de

Call_000_0fde::
    pop hl

Call_000_0fdf::
    ld a, $02
    add b
    ld b, a
    inc e
    dec d
    jr nz, jr_000_0fc9

    ret


    ld a, $0e
    trap $b9
    ld l, c
    ld h, b
    trap MovePen
    ld hl, $ca0f
    ld a, e
    bit 7, a
    jr nz, jr_000_101a

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
    jr jr_000_1049

jr_000_101a::
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

jr_000_1049::
    ld hl, $ca0f
    trap DrawString
    ret


    ld hl, $c9fb

Jump_000_1052::
    ld d, $00
    sla e
    sla e
    add hl, de
    push hl
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ld e, a
    ld l, e
    ld h, d
    trap MovePen
    ldx hl, data_0d0c
    trap DrawString
    pop hl
    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, [hl]
    ld e, a
    callx @+$ff75
    ret


    ld a, $0e
    trap $b9
    push de
    ld hl, $ca2c
    ld a, $da
    ld [hl+], a
    ld a, $d8

jr_000_1084::
    ld [hl+], a
    dec d
    jr nz, jr_000_1084

    ld a, $db
    ld [hl+], a
    xor a
    ld [hl], a
    ld l, c
    ld h, b
    trap MovePen
    ld hl, $ca2c
    trap DrawString
    inc c
    pop de
    push de
    ld hl, $ca2c
    ld a, $d9
    ld [hl+], a
    ld a, $01

jr_000_10a1::
    ld [hl+], a
    dec d
    jr nz, jr_000_10a1

    ld a, $d9
    ld [hl+], a
    xor a
    ld [hl], a
    pop de

jr_000_10ab::
    push de
    ld l, c
    ld h, b
    trap MovePen
    ld hl, $ca2c
    trap DrawString
    inc c
    pop de
    dec e
    jr nz, jr_000_10ab

    ld hl, $ca2c
    ld a, $dc
    ld [hl+], a
    ld a, $d8

jr_000_10c2::
    ld [hl+], a
    dec d
    jr nz, jr_000_10c2

    ld a, $dd
    ld [hl+], a
    xor a
    ld [hl], a
    ld l, c
    ld h, b
    trap MovePen
    ld hl, $ca2c
    trap DrawString
    ret


    ld hl, $ca41
    ld c, $01
    ld b, $0d

jr_000_10dc::
    ld a, $80
    or c
    ld [hl+], a
    ld a, $90
    or c
    ld [hl+], a
    ld a, $a0
    or c
    ld [hl+], a
    ld a, $b0
    or c
    ld [hl+], a
    inc c
    dec b
    jr nz, jr_000_10dc

    ret


    ld b, $00

jr_000_10f3::
    push bc
    trap RandNext
    ld d, $00
    ld e, a
    ld h, $00
    ld l, $34
    trap $8a
    ld a, [$c3b0]
    ld b, a
    push bc
    trap RandNext
    ld d, $00
    ld e, a
    ld h, $00
    ld l, $34
    trap $8a
    ld a, [$c3b0]
    pop bc
    ld c, a
    callx @+$0267
    pop bc
    dec b
    jr nz, jr_000_10f3

    ret


call_1120:
    ldx de, data_0eae
    ld hl, $ca1c
    ld a, $0a
    ld [$0000], a
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    xor a
    ld [$0000], a
    ret


call_113c:
    ldx de, data_0eae
    ld hl, $ca1c
    ld bc, $0004
    trap MemCopy
    ret


    ldh a, [$8a]
    ld b, a
    ld a, [$ca97]
    cp b
    jr z, jr_000_1165

    ld hl, $0028
    ld a, l
    ld [$ca98], a
    ld a, h
    ld [$ca99], a
    ld a, b
    ld [$ca97], a
    ld [$ca9a], a
    ret


jr_000_1165::
    ld a, [$ca98]
    ld l, a
    ld a, [$ca99]
    ld h, a
    or l
    jr z, jr_000_117e

    dec hl
    ld a, l
    ld [$ca98], a
    ld a, h
    ld [$ca99], a
    xor a
    ld [$ca9a], a
    ret


jr_000_117e::
    ld a, b
    ld [$ca9a], a
    ret


    xor a
    ld [$ca97], a
    ld [$ca9a], a
    ld hl, $0028
    ld a, l
    ld [$ca98], a
    ld a, h
    ld [$ca99], a
    ret


call_1196:
    ldx hl, data_0e5c
    sla a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0204
    trap MovePen
    ld l, c
    ld h, b
    trap DrawString
    ret


call_11af:
    ldx hl, data_0e5c
    sla a
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $020f
    trap MovePen
    ld l, c
    ld h, b
    trap DrawString
    ret


    ld a, $07
    callx @+$ffe1
    xor a
    ld [$ca77], a
    ldx de, data_0eaa
    ld hl, $ca79
    ld bc, $000a
    trap MemCopy
    ret


    ld bc, $0100
    callx @+$f01d
    ld c, $02
    ld hl, $0102
    ld de, $2010
    callx @+$efd7
    ld a, [$ca78]
    cp $02
    ret z

    cp $01
    jr nz, jr_000_1208

    ld a, $01
    ret


jr_000_1208::
    ld a, [$ca77]
    ret


    push de
    ld de, $98e0
    ld hl, $caa6
    ld bc, $0060
    trap MemCopy

jr_000_1218::
    ld hl, $98e0
    ld bc, $0060
    ld e, $20
    trap MemSet
    trap AwaitFrame
    trap AwaitFrame
    trap AwaitFrame
    trap AwaitFrame
    ld hl, $98e0
    ld de, $caa6
    ld bc, $0060
    trap MemCopy
    trap AwaitFrame
    trap AwaitFrame
    trap AwaitFrame
    trap AwaitFrame
    pop de
    dec d
    push de
    jr nz, jr_000_1218

    pop de
    ret


    trap AwaitFrame
    ld hl, $1f00
    trap $b6
    xor a
    ld [$cb06], a
    ld [$cb07], a

jr_000_1252::
    ld h, $04

jr_000_1254::
    ldh a, [rLY]
    and a
    jr nz, jr_000_1254

jr_000_1259::
    ldh a, [rLY]
    cp b
    jr nz, jr_000_1259

    ld a, [$cb07]
    add b
    ld d, a
    callx @+$008d
    ld a, b
    add $0b
    ld d, a

jr_000_126e::
    callx @+$007b
    ldh a, [rLY]
    cp d
    jr nc, jr_000_1281

    ld a, [$cb06]
    ldh [rSCY], a
    jr jr_000_126e

jr_000_1281::
    ld a, [$cb06]
    add c
    ld d, a

jr_000_1286::
    callx @+$0063
    ldh a, [rLY]
    cp d
    jr nc, jr_000_1299

    ld a, [$cb07]
    ldh [rSCY], a
    jr jr_000_1286

jr_000_1299::
    ld d, c
    callx @+$0056
    callx @+$0048
    xor a
    ldh [rSCY], a
    dec h
    jr nz, jr_000_1254

    ld a, [$cb06]
    dec a
    ld [$cb06], a
    ld a, [$cb07]
    inc a
    ld [$cb07], a
    cp $0d
    jr nz, jr_000_1252

    ld hl, $98e0
    ld bc, $0060
    ld e, $20
    trap MemSet
    ld e, $04

jr_000_12cc::
    ldh a, [rLY]
    cp $37
    jr nz, jr_000_12cc

    ld d, $50
    callx @+$001c

jr_000_12db::
    ldh a, [rSTAT]
    and $03
    jr nz, jr_000_12db

    xor a
    ldh [rSCY], a
    dec e
    jr nz, jr_000_12cc

    ld hl, $1f0f
    trap $b6
    ret


jr_000_12ed::
    ldh a, [rSTAT]
    and $03
    ret z

    jr jr_000_12ed

jr_000_12f4::
    ldh a, [rSTAT]
    and $03
    jr nz, jr_000_12f4

    ldh a, [rLY]
    cp d
    ret nc

    ret z

    cpl
    inc a
    ldh [rSCY], a
    jr jr_000_12f4

    ld hl, $c600
    trap $ef
    xor a
    trap PlayMusic
    ld a, $0c
    trap $b9
    trap AwaitFrame
    trap LCDDisable
    ld hl, $0305
    trap MovePen
    ld hl, $c9d0
    trap DrawString
    ld hl, $0607
    trap MovePen
    ld hl, $c9e2
    trap DrawString
    ld hl, $040a
    trap MovePen
    ld hl, $c9ec
    trap DrawString
    ld a, $01
    trap LCDEnable
    ld hl, $1f02
    trap $b6
    ld l, $1f
    ld d, $8f

jr_000_1340::
    ld h, $06

jr_000_1342::
    ldh a, [rLY]
    and a
    jr nz, jr_000_1342

jr_000_1347::
    ldh a, [rLY]
    cp l
    jr c, jr_000_1347

    callx @+$ffa4
    dec h
    jr nz, jr_000_1342

    inc l
    ld a, l
    cp $58
    jr nz, jr_000_1340

jr_000_135c::
    ldh a, [$8a]
    and a
    jr z, jr_000_135c

    jx @+$ece2


    ld b, $05

jr_000_1367::
    push bc
    callx @+$002f
    pop bc
    push bc
    dec b
    ld c, a
    callx @+$0008
    pop bc
    dec b
    jr nz, jr_000_1367

    ret


    ld a, b
    ld hl, $ca41
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld b, a
    ld e, l
    ld d, h
    ld a, c
    ld hl, $ca41
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    ld [de], a
    ld [hl], b
    ret


    xor a
    ld [$cb08], a
    ld hl, $ca41
    ld d, $00
    ld a, [hl+]
    and $0f
    ld e, a
    dec b

jr_000_13a9::
    jr z, jr_000_13ba

    inc d
    ld a, [hl+]
    and $0f
    cp e
    jr c, jr_000_13b7

    ld e, a
    ld a, d
    ld [$cb08], a

jr_000_13b7::
    dec b
    jr jr_000_13a9

jr_000_13ba::
    ld a, [$cb08]
    ret


    ld hl, $ca1c
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld a, b
    or c
    or d
    or e
    and a
    jr nz, jr_000_13d4

    jx @+$ff34


jr_000_13d4::
    ret


    ld hl, $ca1c
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld hl, $ca83
    trap $a0
    ld hl, $0801
    trap MovePen
    ld hl, $ca84
    trap DrawString
    ret


    ld hl, $ca20
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld hl, $ca83
    trap $a0
    ld hl, jr_000_0802
    trap MovePen
    ld hl, $ca84
    trap DrawString
    ret


    ld l, a
    ld a, [$cb09]
    and a
    ret z

    ld a, l
    trap PlayMusic
    ret


    ld l, a
    ld a, [$cb09]
    and a
    ret z

    ld a, l
    trap PlaySound
    ret
