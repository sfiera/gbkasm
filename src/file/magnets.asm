; Disassembly of "magnets.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]
LOAD "CRAM Code", SRAM[$a008]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_A008 | FILE_ICON | FILE_2BPP | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $66           ; owner code
.title
    dk "MAGNETS"
.icon
    INCBIN "gfx/magnets/icon.2bpp"
.end

History:
.points
    dw 1
.author
    db "<TEAM MAG>", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    jp jp_b093


data_a106:
    ds 10, $00

call_a110:
    push af
    push bc
    push de
    push hl
    ld d, $00
    ld e, a
    ld hl, data_a106
    trap StrConvHex
    trap DrawString
    ld a, $01
    trap DrawCtrlChar
    pop hl
    pop de
    pop bc
    pop af
    ret


jp_a127:
    push af
    push bc
    push de
    push hl

jr_a12b:
    ld d, $00
    ld e, a
    ld hl, data_a106
    trap StrConvInt
    trap DrawString
    ld a, $01
    trap DrawCtrlChar
    pop hl
    pop de
    pop bc
    pop af
    ret


jp_a13e:
    push af
    push bc
    push de
    push hl
    ld a, b
    call call_a110
    pop hl
    pop de
    pop bc
    pop af
    ret


jp_a14b:
    push af
    push bc
    push de
    push hl
    ld a, c
    call call_a110
    pop hl
    pop de
    pop bc
    pop af
    ret


jp_a158:
    push af
    push bc
    push de
    push hl
    ld a, d
    call call_a110
    pop hl
    pop de
    pop bc
    pop af
    ret


jp_a165:
    push af
    push bc
    push de
    push hl
    ld a, e
    call call_a110
    pop hl
    pop de
    pop bc
    pop af
    ret


jp_a172:
    push af
    push bc
    push de
    push hl
    ld a, h
    call call_a110
    pop hl
    pop de
    pop bc
    pop af
    ret


jp_a17f:
    push af
    push bc
    push de
    push hl
    ld a, l
    call call_a110
    pop hl
    pop de
    pop bc
    pop af
    ret


jp_a18c:
    push af
    push bc
    push de
    push hl
    ld e, c
    ld d, b
    ld hl, data_a106
    trap StrConvHex
    dec hl
    dec hl
    trap DrawString
    ld a, $01
    trap DrawCtrlChar
    pop hl
    pop de
    pop bc
    pop af
    ret


jp_a1a4:
    push af
    push bc
    push de
    push hl
    ld hl, data_a106
    trap StrConvHex
    dec hl
    dec hl
    trap DrawString
    ld a, $01
    trap DrawCtrlChar
    pop hl
    pop de
    pop bc
    pop af
    ret


jp_a1ba:
    push af
    push bc
    push de
    push hl
    ld e, l
    ld d, h
    ld hl, data_a106
    trap StrConvHex
    dec hl
    dec hl
    trap DrawString
    ld a, $01
    trap DrawCtrlChar
    pop hl
    pop de
    pop bc
    pop af
    ret


jp_a1d2:
    push af
    ld a, [bc]
    call call_a110
    pop af
    ret


jp_a1d9:
    push af
    ld a, [de]
    call call_a110
    pop af
    ret


jp_a1e0:
    push af
    ld a, [hl]
    call call_a110
    pop af
    ret


jp_a1e7:
    push af
    push bc
    push de
    push hl

jr_a1eb::
    ld a, [hl+]
    call call_a110
    dec c
    jr nz, jr_a1eb

    pop hl
    pop de
    pop bc
    pop af
    ret


call_a1f7:
    push af

jr_a1f8::
    ldh a, [$8a]
    and a
    jr nz, jr_a1f8

    pop af
    ret


jp_a1ff:
    push af
    call call_a1f7

jr_a203::
    ldh a, [$8a]
    and a
    jr z, jr_a203

    pop af
    ret


jp_a20a:
    push af

jr_a20b::
    ldh a, [$8a]
    bit 0, a
    jr z, jr_a20b

    pop af
    ret


data_a213:
    db $66, "MAGNETS DATA\0"


call_a221:
    ld hl, $c500
    ld de, data_a213
    ld c, $0d
    trap FileSearch
    ret nc

jr_a22c::
    trap ExitToMenu


call_a22e:
    push bc
    ld hl, $c500
    ld b, $00
    trap $ea
    pop bc
    jr c, jr_a22c

    ld de, $c700
    ld hl, $c500
    trap $eb
    ret nc

    jr jr_a22c


call_a244:
    push de
    ld de, $c700
    ld b, $c6
    trap ExtractInit
    pop de
    ld b, $01
    ld a, c
    and a
    jr z, jr_a254

    dec b

jr_a254::
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    trap ExtractData
    ret


call_a267:
    xor a
    trap DrawInit
    ld a, $e4
    ldh [$9d], a
    ld a, $d8
    ldh [$9c], a
    ldh [$9e], a
    call call_a278
    ret


call_a278:
    ld e, $00
    ld bc, $0520
    ld hl, $cf00
    trap MemSet
    ld bc, $0014
    ld de, data_b85f
    ld hl, $cf07
    trap MemCopy
    ld a, $05
    ld [$cf05], a
    ld [$cf06], a
    ld a, $02
    ld [$d085], a
    xor a
    ld [$cf00], a
    ld [$cf01], a
    ld [$cf02], a
    ret


call_a2a5:
    xor a
    ld d, a
    ld e, a
    ld bc, $0110
    call call_a22e
    ld bc, $0110
    ld de, $c700
    ld hl, $9000
    trap MemCopy
    call call_a2df
    ld de, $0110
    ld bc, $0566
    call call_a22e
    ld de, $8000
    ld c, $80
    call call_a244
    ld de, $0676
    ld bc, $04f0
    call call_a22e
    ld de, $8800
    ld c, $80
    call call_a244
    ret


call_a2df:
    xor a
    ld hl, data_b7be

jr_a2e3::
    push af
    ld b, $00
    ld c, a
    ld a, [hl+]
    xor $80
    ld d, $00
    ld e, a
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    push hl
    ld hl, $8800
    add hl, de
    ld e, l
    ld d, h
    ld hl, $cf00
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld bc, $0010
    trap MemCopy
    pop hl
    pop af
    inc a
    cp $52
    jr c, jr_a2e3

    ld bc, $0520
    ld de, $cf00
    ld hl, $9200
    trap MemCopy
    ret


call_a330:
    xor a
    trap DrawInit
    trap LCDDisable
    ld e, $f8
    ld bc, $0400
    ld hl, $9800
    trap MemSet
    ld de, $0b66
    ld bc, $367b
    call call_a22e
    ld de, $8800
    ld c, $00
    call call_a244
    ld hl, $9822
    ld a, $80
    ld b, $10

jr_a357::
    push bc
    ld e, l
    ld d, h
    ld c, $10

jr_a35c::
    ld [hl+], a
    inc a
    dec c
    jr nz, jr_a35c

    ld l, e
    ld h, d
    ld bc, $0020
    add hl, bc
    pop bc
    dec b
    jr nz, jr_a357

    ld a, $03
    trap LCDEnable
    ld a, $02
    trap AudioPlayMusic
    call call_afd6
    ld a, $01
    call call_a382
    xor a
    trap AudioPlayMusic
    ret


data_a37f:
    db $00, $08, $30


call_a382:
    trap AwaitFrame
    ld b, $00
    ld c, a
    ld hl, $a37f
    add hl, bc
    ld a, [hl]
    ld [$d421], a
    ld a, $cb
    ld [$d420], a
    ld a, $c9
    ld [$d422], a
    ld d, $80
    ld hl, $8000
    call call_a3ba
    ld d, $80
    ld hl, $8001
    call call_a3ba
    ld d, $00
    ld hl, $8800
    call call_a3ba
    ld d, $00
    ld hl, $8801
    call call_a3ba
    ret


call_a3ba:
    ld b, $fe

jr_a3bc::
    ld c, d
    push hl

jr_a3be::
    ld e, $08

jr_a3c0::
    ld a, [hl]
    and b
    ld [hl+], a
    inc hl
    call $d420
    dec e
    jr nz, jr_a3c0

    dec c
    jr nz, jr_a3be

    pop hl
    trap AwaitFrame
    trap AwaitFrame
    trap AwaitFrame
    trap AwaitFrame
    sla b
    jr c, jr_a3bc

    ret


call_a3db:
    ld d, $00
    ld e, $ff

jr_a3df::
    push de
    call call_a434
    pop de
    ld a, [$d024]
    and a
    jr z, jr_a415

    inc e
    push de
    call call_a473
    pop de
    ld e, b
    dec e
    ld hl, $cf1c
    ld b, $00
    ld c, d
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld bc, $0002
    add hl, bc
    ld a, [$d022]
    ld [hl+], a
    ld a, [$d023]
    ld [hl+], a

jr_a415::
    inc d
    ld a, d
    cp $08
    jr nz, jr_a3df

    ld hl, $c300
    ld a, e
    inc a
    sla a
    sla a
    ld b, $00
    ld c, a
    add hl, bc
    ld a, $28
    sub e
    ld e, b
    sla a
    sla a
    ld c, a
    trap MemSet
    ret


call_a434:
    ld hl, $cf1c
    ld b, $00
    ld c, d
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld [$d020], a
    ld [$d040], a
    ld a, [hl+]
    ld [$d021], a
    ld [$d041], a
    inc hl
    inc hl
    ld a, [hl+]
    ld [$d024], a
    inc hl
    ld a, [hl+]
    ld [$d026], a
    inc hl
    ld a, [hl+]
    ld [$d028], a
    ld a, [hl+]
    ld [$d029], a
    inc hl
    ld a, [hl]
    ld [$d02b], a
    ret


call_a473:
    call call_a4c8
    call call_a4f4
    push hl
    ld hl, $c300
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld a, [hl+]
    ld c, a
    ld [$d022], a
    ld a, [hl+]
    ld b, a
    ld [$d023], a

jr_a495::
    push bc

jr_a496::
    ld a, [$d041]
    ld [de], a
    inc de
    ld a, [$d040]
    ld [de], a
    add $08
    ld [$d040], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [$d029]
    ld [de], a
    inc de
    dec c
    jr nz, jr_a496

    pop bc
    ld a, [$d020]
    ld [$d040], a
    ld a, [$d041]
    add $08
    ld [$d041], a
    dec b
    jr nz, jr_a495

    ld b, e
    srl b
    srl b
    ret


call_a4c8:
    ld hl, data_b54c
    ld b, $00
    ld a, [$d02b]
    ld c, a
    add hl, bc
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld l, c
    ld h, b
    ld a, [$d028]
    ld c, a

jr_a4dd::
    ld a, c
    and a
    jr z, jr_a4ed

    dec c
    inc hl
    inc hl
    ld a, [hl+]
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    jr jr_a4dd

jr_a4ed::
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld l, c
    ld h, b
    ret


call_a4f4:
    ld a, [$d026]
    ld c, a

jr_a4f8::
    ld a, c
    and a
    ret z

    dec c
    push bc
    ld b, $00
    ld a, [hl+]
    ld c, a
    ld a, [hl+]

jr_a502::
    add hl, bc
    dec a
    jr nz, jr_a502

    pop bc
    jr jr_a4f8


call_a509:
    call call_a583
    ld e, $00
    ld bc, $0080
    ld hl, $cf1c
    trap MemSet
    call call_a52a
    ld a, $00
    ld [$cf40], a
    ld hl, $03e8
    ld a, l
    ld [$cf03], a
    ld a, h
    ld [$cf04], a
    ret


call_a52a:
    ld hl, data_b451
    ld a, [$cf00]
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    ld d, a
    ld a, [de]
    inc de
    sub $03
    ld [$cf1b], a
    add $03
    ld hl, $cf1c
    ld c, $00

jr_a54a::
    cp c
    ret z

    push af
    ld a, [de]
    inc de
    sla a
    sla a
    sla a
    add $08
    ld [hl+], a
    ld a, [de]
    inc de
    sla a
    sla a
    sla a
    add $10
    ld [hl+], a
    ld a, [de]
    inc de
    push af
    inc hl
    inc hl
    ld a, $01
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    inc hl
    ld a, $01
    ld [hl+], a
    ld a, $02
    ld [hl+], a
    pop af
    inc hl
    inc hl
    ld [hl+], a
    inc hl
    inc hl
    ld a, [de]
    inc de
    ld [hl+], a
    inc hl
    inc c
    pop af
    jr jr_a54a


call_a583:
    call call_a590

call_a586:
    call call_a5cd
    call call_a660
    call call_a601
    ret


call_a590:
    ld bc, $0010
    ld de, $b873
    ld hl, $9160
    trap MemCopy
    ld bc, $0010
    ld de, $b873
    ld hl, $d020
    trap MemCopy
    ld a, [$d020]
    or $ff
    ld [$d020], a
    ld a, [$d021]
    or $ff
    ld [$d021], a
    ld bc, $0010
    ld de, $d020
    ld hl, $9150
    trap MemCopy
    ld bc, $0040
    ld de, $b883
    ld hl, $9110
    trap MemCopy
    ret


call_a5cd:
    ld e, $15
    ld bc, $0014
    ld hl, $9820
    trap MemSet
    ld c, $10

jr_a5d9::
    push bc
    ld h, $00
    ld l, c
    sla l
    rl h
    sla l
    rl h
    sla l
    rl h
    sla l
    rl h
    sla l
    rl h
    ld de, $9820
    add hl, de
    ld e, $16
    ld bc, $0014
    trap MemSet
    pop bc
    dec c
    jr nz, jr_a5d9

    ret


call_a601:
    ld e, $00
    ld bc, $0022
    ld hl, $d063
    trap MemSet
    ld hl, data_b810
    ld b, $00
    ld a, [$cf00]
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    ld d, a
    ld a, [de]
    inc de
    ld [$d062], a
    ld c, a
    ld hl, $d063

jr_a626::
    push bc
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    pop bc
    dec c
    jr nz, jr_a626

    ld a, [$d062]
    ld c, a
    ld de, $d063

jr_a638::
    ld a, [de]
    inc de
    ld h, a
    ld a, [de]
    inc de
    ld l, a
    trap DrawAt
    ld a, $11
    trap DrawChar
    ld a, $12
    trap DrawChar
    ld a, $03
    trap DrawCtrlChar
    ld a, $02
    trap DrawCtrlChar
    ld a, $02
    trap DrawCtrlChar
    ld a, $13
    trap DrawChar
    ld a, $14
    trap DrawChar
    dec c
    jr nz, jr_a638

    ret


call_a660:
    ld bc, $0014
    ld de, $cf07
    ld hl, $9800
    trap MemCopy
    ret


call_a66c:
    ld hl, data_b28a
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    ld d, a
    ld a, [de]
    inc de
    ld h, a
    ld a, [de]
    inc de
    ld l, a
    trap DrawAt

jr_a683::
    ld a, [de]
    inc de
    cp $ff
    ret z

    add $20
    trap DrawChar
    ld c, $05

jr_a68e::
    trap AwaitFrame
    ldh a, [$8a]
    bit 1, a
    jr nz, jr_a683

    dec c
    jr nz, jr_a68e

    jr jr_a683


call_a69b:
    ld a, b
    ld [$d020], a
    ld a, c
    ld [$d021], a
    ld a, [$d04d]
    ld e, c
    ld d, b
    ld hl, $cf1c
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld bc, $0002
    add hl, bc
    ld c, e
    ld b, d
    ld a, [hl+]
    ld [$d022], a
    ld a, [hl+]
    ld [$d023], a
    ld a, b
    cp $08
    ret c

    ld a, [$d022]
    sla a
    sla a
    sla a
    add b
    cp $a9
    ccf
    ret c

    dec a
    ld [$d087], a
    ld a, c
    cp $18
    ret c

    ld a, [$d023]
    sla a
    sla a
    sla a
    add c
    cp $a1
    ccf
    ret c

    dec a
    ld [$d088], a
    ld a, [$d062]
    ld c, a
    ld hl, $d063

jr_a700::
    ld a, [hl]
    sla a
    sla a
    sla a
    add $08
    ld b, a
    ld a, [$d087]
    sub $04
    cp b
    jr c, jr_a73e

    ld a, b
    add $0f
    ld b, a
    ld a, [$d020]
    dec a
    add $04
    cp b
    jr nc, jr_a73e

    inc hl
    ld a, [hl-]
    sla a
    sla a
    sla a
    add $10
    ld b, a
    ld a, [$d088]
    sub $04
    cp b
    jr c, jr_a73e

    ld a, b
    add $0f
    ld b, a
    ld a, [$d021]
    dec a
    add $04
    cp b
    ret c

jr_a73e::
    inc hl
    inc hl
    dec c
    jr nz, jr_a700

    and a
    ret


call_a745:
    ld a, [$cf20]
    and $02
    jr z, jr_a75d

    ld a, [$cf2b]
    cp $45
    ret z

    xor a
    ld [$d04d], a
    ld hl, $d050
    call call_aa55
    ret


jr_a75d::
    xor a
    ld [$d04d], a
    ld a, [$cf21]
    ld c, a
    ldh a, [$8a]
    rrca
    jr c, jr_a7a4

    ld b, a
    ld a, [$cf30]
    and $7f
    ld [$cf30], a
    ld a, b
    ld e, $01
    rrca
    jr nc, jr_a77a

    inc e

jr_a77a::
    rrca
    rrca

jr_a77c::
    push af
    push de
    rrca
    push af
    push bc
    call c, $a7d5
    pop bc
    pop af
    rrca
    push af
    push bc
    call c, $a7f2
    pop bc
    pop af
    rrca
    push af
    push bc
    call c, $a80f
    pop bc
    pop af
    rrca
    push af
    push bc
    call c, $a82c
    pop bc
    pop af
    pop de
    pop af
    dec e
    jr nz, jr_a77c

    ret


jr_a7a4::
    ld a, [$cf30]
    and $80
    ret nz

    ld a, [$d061]
    and a
    jr nz, jr_a7b4

    ld a, $0c
    trap AudioPlaySound

jr_a7b4::
    ld a, [$cf30]
    or $c0
    ld [$cf30], a
    ld a, [$cf1c]
    ld [$d049], a
    ld a, [$cf1d]
    ld [$d04a], a
    ld a, [$cf2c]
    ld [$d04b], a
    ld a, [$cf2d]
    ld [$d04c], a
    ret


jp_a7d5:
    ld a, $01
    ld [$cf24], a
    ld a, [$cf1c]
    add c
    ld b, a
    ld a, [$cf1d]
    ld c, a
    push bc
    call call_a69b
    pop bc
    ret c

    ld a, b
    ld [$cf1c], a
    ld a, c
    ld [$cf1d], a
    ret


jp_a7f2:
    ld a, $03
    ld [$cf24], a
    ld a, [$cf1c]
    sub c
    ld b, a
    ld a, [$cf1d]
    ld c, a
    push bc
    call call_a69b
    pop bc
    ret c

    ld a, b
    ld [$cf1c], a
    ld a, c
    ld [$cf1d], a
    ret


jp_a80f:
    ld a, $00
    ld [$cf24], a
    ld a, [$cf1c]
    ld b, a
    ld a, [$cf1d]
    sub c
    ld c, a
    push bc
    call call_a69b
    pop bc
    ret c

    ld a, b
    ld [$cf1c], a
    ld a, c
    ld [$cf1d], a
    ret


jp_a82c:
    ld a, $02
    ld [$cf24], a
    ld a, [$cf1c]
    ld b, a
    ld a, [$cf1d]
    add c
    ld c, a
    push bc
    call call_a69b
    pop bc
    ret c

    ld a, b
    ld [$cf1c], a
    ld a, c
    ld [$cf1d], a
    ret


call_a849:
    ld a, [$cf20]
    and $02
    ret z

    ld a, [$cf2b]
    cp $45
    ret nz

    ld a, [$d085]
    ld b, a
    ld a, [$d086]
    add b
    ld [$cf1c], a
    ld a, b
    xor $ff
    inc a
    ld [$d085], a
    ret


call_a868:
    ld a, $03
    ld hl, $cf4c

jr_a86d::
    cp $08
    ret z

    ld [$d04d], a
    push hl
    ld bc, $0004
    add hl, bc
    ld a, [hl]
    and $01
    jr z, jr_a89d

    ld a, [hl]
    and $02
    jr nz, jr_a89a

    ld bc, $0007
    add hl, bc
    ld a, [hl]
    sub $05
    sla a
    ld hl, data_a8a8
    ld c, a
    add hl, bc
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    ld d, a
    ld bc, $a89d
    push bc
    push de
    ret


jr_a89a::
    call call_aa49

jr_a89d::
    pop hl
    ld bc, $0010
    add hl, bc
    ld a, [$d04d]
    inc a
    jr jr_a86d


data_a8a8:
    dw jp_a8b2
    dw jp_a939
    dw jp_a9e4
    dw jp_aa3f
    dw jp_aa42


jp_a8b2:
    ld a, [$d04d]
    ld hl, $cf1c
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld e, l
    ld d, h
    ld bc, $0008
    add hl, bc
    ld a, [hl]
    cp $02
    jr c, jr_a900

    ld a, $03
    ld [hl+], a
    inc hl
    ld a, [hl]
    dec a
    ld [hl], a
    ld l, e
    ld h, d
    cp $e7
    jr z, jr_a92e

    ld bc, $0005
    add hl, bc
    ld a, [hl]
    ld l, e
    ld h, d
    ld c, a
    ld a, [hl+]
    sub c
    ld b, a
    ld a, [hl]
    dec hl
    ld c, a
    push bc
    push hl
    call call_a69b
    pop hl
    pop bc
    jr c, jr_a92e

    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl], a
    ret


jr_a900::
    ld a, $01
    ld [hl], a
    ld l, e
    ld h, d
    ld bc, $000a
    add hl, bc
    ld a, [hl]
    inc a
    ld [hl], a
    ld l, e
    ld h, d
    cp $19
    jr z, jr_a92e

    ld bc, $0005
    add hl, bc
    ld a, [hl]
    ld l, e
    ld h, d
    ld c, a
    ld a, [hl+]
    add c
    ld b, a
    ld a, [hl]
    dec hl
    ld c, a
    push bc
    push hl
    call call_a69b
    pop hl
    pop bc
    jr c, jr_a92e

    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl], a
    ret


jr_a92e::
    ld bc, $0008
    add hl, bc
    ld a, [hl]
    add $02
    and $03
    ld [hl], a
    ret


jp_a939:
    ld a, [$d04d]
    ld hl, $cf1c
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld e, l
    ld d, h
    ld bc, $000a
    add hl, bc
    ld a, [hl]
    and $07
    jr nz, jr_a977

    ld [hl], a
    ld l, e
    ld h, d
    ld bc, $000c
    add hl, bc
    ld a, [hl]
    inc a
    and $07
    ld [hl], a
    ld hl, data_a99e
    ld c, a
    add hl, bc
    ld a, [hl]
    ld l, e
    ld h, d
    ld bc, $0008
    add hl, bc
    ld [hl], a

jr_a977::
    ld l, e
    ld h, d
    ld bc, $000a
    add hl, bc
    ld a, [hl]
    inc a
    ld [hl], a
    ld l, e
    ld h, d
    ld bc, $000c
    add hl, bc
    ld a, [hl]
    ld hl, data_a9a6
    sla a
    ld c, a
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    push bc
    ld l, e
    ld h, d
    ld bc, $0005
    add hl, bc
    ld a, [hl]
    ld c, a
    ld l, e
    ld h, d
    ret


data_a99e:
    db $02, $03, $03, $00, $00, $01, $01, $02

data_a9a6:
    dw jp_a9b6
    dw jp_a9bb
    dw jp_a9c2
    dw jp_a9c6
    dw jp_a9cd
    dw jp_a9d2
    dw jp_a9d9
    dw jp_a9dd


jp_a9b6:
    inc hl
    ld a, [hl]
    add c
    ld [hl], a
    ret


jp_a9bb:
    ld a, [hl]
    sub c
    ld [hl+], a
    ld a, [hl]
    add c
    ld [hl], a
    ret


jp_a9c2:
    ld a, [hl]
    sub c
    ld [hl], a
    ret


jp_a9c6:
    ld a, [hl]
    sub c
    ld [hl+], a
    ld a, [hl]
    sub c
    ld [hl], a
    ret


jp_a9cd:
    inc hl
    ld a, [hl]
    sub c
    ld [hl], a
    ret


jp_a9d2:
    ld a, [hl]
    add c
    ld [hl+], a
    ld a, [hl]
    sub c
    ld [hl], a
    ret


jp_a9d9:
    ld a, [hl]
    add c
    ld [hl], a
    ret


jp_a9dd:
    ld a, [hl]
    add c
    ld [hl+], a
    ld a, [hl]
    add c
    ld [hl], a
    ret


jp_a9e4:
    ld a, [$d04d]
    ld hl, $cf1c
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld e, l
    ld d, h
    ld bc, $0000
    add hl, bc
    ld a, [hl+]
    ld [$d08d], a
    ld bc, $0001
    ld a, [hl+]
    ld [$d08e], a
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    ld [$d091], a
    ld a, [$cf1c]
    ld [$d08f], a
    ld a, [$cf1d]
    ld [$d090], a
    push de
    call call_bbeb
    call call_bcb2
    ld a, [$d092]
    ld b, a
    ld a, [$d093]
    ld c, a
    call call_a69b
    pop hl
    ret c

    ld a, [$d092]
    ld [hl+], a
    ld a, [$d093]
    ld [hl], a
    ret


jp_aa3f:
    jp jp_a9e4


jp_aa42:
    call call_aac6
    ret nc

    jp jp_a9e4


call_aa49:
    ld a, [$d04d]
    sla a
    ld b, $00
    ld c, a
    ld hl, $d050
    add hl, bc

call_aa55:
    ld e, l
    ld d, h
    ld a, [$d04d]
    ld hl, $cf1c
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld a, [de]
    inc de
    ld c, a
    ld a, [hl+]
    add c
    cp $a9
    jr nc, jr_aaa5

    inc hl
    ld c, a
    ld a, [hl-]
    sla a
    sla a
    sla a
    add c
    cp $08
    jr c, jr_aaa5

    dec hl
    ld a, c
    ld [hl+], a
    ld a, [de]
    ld c, a
    ld a, [hl+]
    add c
    cp $a1
    jr nc, jr_aaa5

    inc hl
    ld c, a
    ld a, [hl-]
    sla a
    sla a
    sla a
    add c
    cp $18
    jr c, jr_aaa5

    dec hl
    ld a, c
    ld [hl], a
    ret


jr_aaa5::
    ld a, [$d04d]
    ld hl, $cf1c
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    xor a
    ld bc, $0004
    add hl, bc
    ld [hl], a
    ret


call_aac6:
    ld a, [$d04d]
    ld hl, $cf1c
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld b, a
    sub $28
    jr c, jr_aaea

    cp $08
    jr nc, jr_aaec

jr_aaea::
    ld a, $08

jr_aaec::
    ld [$cf9c], a
    ld a, [hl+]
    ld c, a
    sub $28
    jr c, jr_aaf9

    cp $18
    jr nc, jr_aafb

jr_aaf9::
    ld a, $18

jr_aafb::
    ld [$cf9e], a
    ld a, [hl+]
    sla a
    sla a
    sla a
    add b
    add $28
    cp $a9
    jr c, jr_ab0e

    ld a, $a9

jr_ab0e::
    ld [$cf9d], a
    ld a, [hl+]
    sla a
    sla a
    sla a
    add c
    add $28
    cp $a1
    jr c, jr_ab21

    ld a, $a1

jr_ab21::
    ld [$cf9f], a
    ld a, [$cf9c]
    ld b, a
    ld a, [$cf9e]
    ld c, a
    ld a, [$cf9d]
    ld d, a
    ld a, [$cf9f]
    ld e, a
    ld a, [$cf1c]
    add $0f
    cp b
    ccf
    ret nc

    sub $0f
    cp d
    ret nc

    ld a, [$cf1d]
    add $0f
    cp c
    ccf
    ret nc

    sub $0f
    cp e
    ret


call_ab4c:
    xor a
    ld hl, $cf1c

jr_ab50::
    cp $08
    ret z

    ld [$d060], a
    push hl
    ld bc, $0004
    add hl, bc
    ld a, [hl+]
    and a
    jr z, jr_ab6b

    call call_ab76
    call call_ab96
    call call_abe2
    call call_abb6

jr_ab6b::
    pop hl
    ld bc, $0010
    add hl, bc
    ld a, [$d060]
    inc a
    jr jr_ab50


call_ab76:
    inc hl
    ld a, [hl+]
    ld [$d026], a
    ld a, [hl+]
    ld [$d027], a
    ld a, [hl+]
    ld [$d028], a
    ld a, [hl+]
    ld [$d029], a
    inc hl
    ld a, [hl+]
    ld [$d02b], a
    inc hl
    ld a, [hl+]
    ld [$d02d], a
    ld a, [hl+]
    ld [$d02e], a
    ret


call_ab96:
    ld a, [$d027]
    dec a
    ld [$d027], a
    ret nz

    ld a, [$d02e]
    ld [$d027], a
    ld a, [$d02d]
    ld b, a
    ld a, [$d026]
    inc a
    ld [$d026], a
    cp b
    ret c

    xor a
    ld [$d026], a
    ret


call_abb6:
    ld a, [$d060]
    ld hl, $cf1c
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld bc, $0006
    add hl, bc
    ld a, [$d026]
    ld [hl+], a
    ld a, [$d027]
    ld [hl+], a
    inc hl
    ld a, [$d029]
    ld [hl], a
    ret


call_abe2:
    ld a, [$d02b]
    cp $05
    ret c

    ld a, [$d028]
    cp $01
    ld a, [$d029]
    jr z, jr_abf8

    and $df
    ld [$d029], a
    ret


jr_abf8::
    or $20
    ld [$d029], a
    ret


call_abfe:
    xor a

jr_abff::
    cp $08
    ret z

    ld hl, $cf1c
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    push af
    ld e, l
    ld d, h
    ld bc, $000b
    add hl, bc
    ld a, [hl]
    ld hl, data_b54c
    ld b, $00
    sla a
    ld c, a
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld l, e
    ld h, d
    push bc
    ld bc, $0008
    add hl, bc
    ld a, [hl]
    pop bc

jr_ac37::
    and a
    jr z, jr_ac49

    inc bc
    inc bc
    ld l, a
    ld a, [bc]
    inc a
    add c
    ld c, a
    ld a, b
    adc $00
    ld b, a
    ld a, l
    dec a
    jr jr_ac37

jr_ac49::
    inc bc
    inc bc
    ld a, [bc]
    ld l, e
    ld h, d
    ld bc, $000d
    add hl, bc
    ld [hl], a
    pop af
    inc a
    jr jr_abff


call_ac57:
    ld a, $00
    ld [$cf40], a
    ld a, [$cf30]
    rlca
    ret nc

    ld a, [$cf46]
    xor $01
    ld [$cf46], a
    ld [$cf40], a
    ld a, [$cf1c]
    sub $04
    ld [$cf3c], a
    ld a, [$cf1d]
    sub $07
    ld [$cf3d], a
    ret


call_ac7d:
    ld a, [$cf20]
    and $02
    ret nz

    ld c, $03

jr_ac85::
    ld a, c
    cp $08
    ret z

    push bc
    ld hl, $cf1c
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld bc, $0004
    add hl, bc
    pop bc
    ld a, [hl]
    and $02
    jr nz, jr_acba

    push bc
    xor a
    ld [$d089], a
    ld a, c
    ld [$d08b], a
    call call_bb35
    pop bc
    jr c, jr_acbd

jr_acba::
    inc c
    jr jr_ac85

jr_acbd::
    ld a, [$cf20]
    or $02
    ld [$cf20], a
    ld a, [$cf1c]
    ld [$d086], a
    ld a, $1e
    ld [$cf26], a
    ld a, $45
    ld [$cf2b], a
    ret


call_acd6:
    ld a, [$cf30]
    and $40
    ret z

    ld a, [$cf20]
    and $02
    ret nz

    ld a, [$cf1b]
    and a
    ret z

    xor a
    ld [$d089], a
    ld a, $01
    ld [$d08b], a
    call call_bb35
    ret nc

    ld a, [$d043]
    ld [$d050], a
    ld a, [$d044]
    ld [$d051], a
    ld a, [$cf20]
    or $02
    ld [$cf20], a
    ld a, $4e
    ld [$cf2b], a
    ret


call_ad0e:
    ld a, [$cf30]
    and $40
    ret z

    ld a, [$cf20]
    and $02
    ret nz

    ld b, $00
    ld c, $03
    ld hl, $cf4c

jr_ad21::
    ld a, c
    cp $08
    ret z

    push bc
    ld e, l
    ld d, h
    ld bc, $0004
    add hl, bc
    ld a, [hl]
    bit 0, a
    jr z, jr_ad82

    bit 1, a
    jr nz, jr_ad82

    pop bc
    push bc
    ld hl, $d050
    sla c
    rl b
    add hl, bc
    ld a, [$d043]
    ld [hl+], a
    ld a, [$d044]
    ld [hl], a
    pop bc
    push bc
    ld a, c
    ld [$d089], a
    ld a, $01
    ld [$d08b], a
    push de
    call call_bb35
    pop de
    jr nc, jr_ad82

    xor a
    trap AudioPlaySound
    ld a, $25
    trap AudioPlaySound
    ld a, $01
    ld [$d061], a
    ld a, [$cf1b]
    dec a
    ld [$cf1b], a
    ld l, e
    ld h, d
    ld bc, $0004
    add hl, bc
    ld a, [hl]
    or $06
    ld [hl], a
    ld l, e
    ld h, d
    ld bc, $000b
    add hl, bc
    ld a, [hl]
    ld bc, $0004
    add hl, bc
    ld [hl], a

jr_ad82::
    pop bc
    ld l, e
    ld h, d
    ld de, $0010
    add hl, de
    inc c
    jr jr_ad21


call_ad8c:
    xor a
    trap DrawInit
    call call_adbe
    ld a, $12
    ld [$d0a7], a
    ld a, $0b
    trap AudioPlayMusic
    ld hl, data_ae92

jr_ad9e::
    ld a, [hl]
    cp $ff
    jr z, jr_adb7

    call call_ae21
    push hl
    call call_ae80
    pop hl
    ret nz

    ld a, [$d0a7]
    inc a
    and $1f
    ld [$d0a7], a
    jr jr_ad9e

jr_adb7::
    call call_afd6
    xor a
    trap AudioPlayMusic
    ret


call_adbe:
    trap LCDDisable
    ld hl, $9002
    ld de, $9000
    ld c, $80

jr_adc8::
    ld b, $07

jr_adca::
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
    jr nz, jr_adca

    inc hl
    inc hl
    inc de
    inc de
    dec c
    jr nz, jr_adc8

    ld c, $80
    ld hl, $9000

jr_ade5::
    ld a, [hl]
    srl a
    ld [hl+], a
    ld a, [hl]
    srl a
    ld [hl+], a
    ld a, [hl]
    srl a
    ld [hl+], a
    ld a, [hl]
    srl a
    ld [hl+], a
    ld a, [hl]
    srl a
    ld [hl+], a
    ld a, [hl]
    srl a
    ld [hl+], a
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    sla a
    ld [hl+], a
    ld a, [hl]
    sla a
    ld [hl+], a
    ld a, [hl]
    sla a
    ld [hl+], a
    ld a, [hl]
    sla a
    ld [hl+], a
    ld a, [hl]
    sla a
    ld [hl+], a
    ld a, [hl]
    sla a
    ld [hl+], a
    dec c
    jr nz, jr_ade5

    ld a, $03
    trap LCDEnable
    ret


call_ae21:
    cp $fe
    jr z, jr_ae4d

    push hl
    call call_ae6e
    ld a, [$d0a7]
    ld h, a
    ld l, $00
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld bc, $9800
    add hl, bc
    ld bc, $0014
    ld de, $d0a8
    trap MemCopy
    pop hl
    ld bc, $0014
    add hl, bc
    ret


jr_ae4d::
    push hl
    ld a, [$d0a7]
    ld h, a
    ld l, $00
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld bc, $9800
    add hl, bc
    ld e, $20
    ld bc, $0014
    trap MemSet
    pop hl
    inc hl
    ret


call_ae6e:
    ld c, $14
    ld de, $d0a8

jr_ae73::
    ld a, [hl+]
    cp $60
    jr c, jr_ae7a

    sub $60

jr_ae7a::
    ld [de], a
    inc de
    dec c
    jr nz, jr_ae73

    ret


call_ae80:
    ld c, $08

jr_ae82::
    ld b, $07
    ldh a, [$9a]
    inc a
    ldh [$9a], a

jr_ae89::
    trap AwaitFrame
    dec b
    jr nz, jr_ae89

    dec c
    jr nz, jr_ae82

    ret


data_ae92:
    db " ** MAGNETS 1997 ** "
    db "     - STAFF -      "
    db $fe
    db $fe
    db " Directer           "
    db "  Fumihisa Sato     "
    db $fe
    db " Programmer         "
    db "  Takahiro Ohnishi  "
    db "  Kei Kondo         "
    db "  Yoko Miyabayashi  "
    db $fe
    db " Graphic Designer   "
    db "  Satoshi Fukuda    "
    db "  Megumi Okazaki    "
    db $fe
    db " Planner            "
    db "  Takeo Monma       "
    db "  Rie Fujita        "
    db $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe
    db $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe
    db " 1997  SATO PROJECT "
    db $ff

call_afd6::
    ldh a, [$8a]
    and a
    jr nz, call_afd6

jr_afdb::
    ldh a, [$8a]

jr_afdd::
    bit 2, a
    jp nz, $b285

    and a
    jr z, jr_afdb

    ret


call_afe6:
    ld a, [$d043]
    ld b, a
    ld a, [$d044]
    or b
    jr z, jr_aff7

jr_aff0::
    ld a, [$cf30]
    and $40
    jr nz, jr_affc

jr_aff7::
    xor a
    ld [$cf35], a
    ret


jr_affc::
    ld a, [$d042]
    xor $10
    ld [$d042], a
    ld [$cf35], a
    ret


call_b008:
    ld a, [$cf20]
    and a
    jr nz, jr_b010

    scf
    ret


jr_b010::
    and $02
    ret z

    ld a, [$cf2b]
    cp $45
    ret nz

    ld a, [$cf26]
    dec a
    ld [$cf26], a
    ret nz

    scf
    ret


call_b023:
    ld a, [$cf03]
    ld b, a
    ld a, [$cf04]
    or b
    ret nz

    scf
    ret


call_b02e:
    ld a, [$d0a4]
    and a
    ret nz

    ld c, $05
    ld b, $00
    ld de, $0010
    ld hl, $cf50

jr_b03d::
    ld a, [hl]
    or b
    ld b, a
    add hl, de
    dec c
    jr nz, jr_b03d

    ld a, b
    and a
    ret nz

    scf
    ret


call_b049:
    ld a, [$cf31]
    and a
    jr z, jr_b05b

    dec a
    jr z, jr_b061

    dec a
    jr z, jr_b061

    ld a, $0b
    ld [$cf37], a
    ret


jr_b05b::
    ld a, $01
    ld [$cf37], a
    ret


jr_b061::
    ld a, $0a
    ld [$cf37], a
    ret


call_b067:
    ld a, [$d061]
    and a
    ret z

    trap AudioGetSound
    and a
    ret nz

    xor a
    ld [$d061], a
    ret


call_b075:
    ld hl, $d045
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl-], a
    dec hl
    dec hl
    ld a, [$cf2c]
    ld [hl+], a
    sub b
    ld [$d043], a
    ld a, [$cf2d]
    ld [hl+], a
    sub c
    ld [$d044], a
    ret


jp_b093:
    ld sp, $e000
    call call_a221
    call call_a330
    call call_b27d
    call call_a267
    trap LCDDisable
    call call_a2a5
    ld a, $03
    trap LCDEnable
    call call_a278

jp_b0ae:
    trap LCDDisable
    ld a, $03
    trap LCDEnable
    trap LCDDisable
    call call_a509
    ld a, $03
    trap LCDEnable
    ld a, $09
    trap AudioPlayMusic
    ld a, $01
    ld [$d0a6], a
    call call_b8c3
    call call_a660
    call call_abfe
    call call_ab4c
    call call_a3db
    ld a, [$cf00]
    ld b, a
    ld a, $16
    add b
    call call_a66c
    call call_afd6
    call call_a586
    xor a
    ld [$d0a4], a
    ld a, [$cf05]
    ld b, a
    ld a, [$cf06]
    cp b
    jr nz, call_b0fe

    xor a
    call call_a66c
    ld a, $01
    call call_a66c
    jr jr_b103

call_b0fe::
    ld a, $0e
    call call_a66c

jr_b103::
    call call_afd6
    call call_a586
    ld a, $1d
    trap AudioPlaySound

jr_b10d::
    ldh a, [$8a]
    and $01
    jr nz, jr_b10d

jr_b113::
    call call_b8c3
    call call_b963
    call call_a660
    call call_a745
    call call_ba44
    ld a, [$cf31]
    call call_b075
    call call_a868
    call call_b049
    call call_afe6
    call call_acd6
    call call_ac7d
    call call_ad0e
    call call_a849
    call call_abfe
    call call_ab4c
    call call_ac57
    trap $c3
    call call_b067
    call call_b27d
    call call_a3db
    call call_b008
    jr c, jr_b169

    call call_b023
    jr c, jr_b17d

    call call_b02e
    jr c, jr_b1ab

    ldh a, [$8a]
    bit 2, a
    jr z, jr_b113

    jp jp_b285


jr_b169::
    ld a, $19
    trap AudioPlayMusic
    ld a, [$cf2b]
    cp $4e
    jr nz, jr_b181

    ld a, $03
    call call_a66c
    ld a, $0d
    jr jr_b183

jr_b17d::
    ld a, $05
    jr jr_b183

jr_b181::
    ld a, $02

jr_b183::
    call call_a66c
    call call_afd6
    call call_a586
    ld a, [$cf05]
    dec a
    ld [$cf05], a
    jr z, jr_b198

    jp jp_b0ae


jr_b198::
    ld a, $04
    call call_a66c
    call call_afd6
    call call_a586
    ld a, $02
    call call_a382
    jp jp_b093


jr_b1ab::
    ld a, $18
    trap AudioPlayMusic
    ld a, $0f
    call call_a66c
    call call_afd6
    ld a, [$cf03]
    ld c, a
    ld a, [$cf04]
    ld b, a
    push bc
    call call_b25a
    call call_a586
    pop bc
    ld a, [$cf00]
    cp $06
    jr z, jr_b20f

    ld a, c
    ld [$cf03], a
    ld a, b
    ld [$cf04], a
    ld a, $06
    call call_a66c
    ld a, [$cf03]
    ld e, a
    ld a, [$cf04]
    ld d, a
    ld c, $08
    ld hl, $0309
    trap $84
    and l
    jr z, jr_b1f1

    ld a, $0c
    jr jr_b1f9

jr_b1f1::
    ld hl, $00c8
    trap $8a
    ld a, $07
    add l

jr_b1f9::
    call call_a66c
    call call_afd6
    ld a, [$cf05]
    ld [$cf06], a
    ld a, [$cf00]
    inc a
    ld [$cf00], a
    jp jp_b0ae


jr_b20f::
    ld a, $10
    call call_a66c
    call call_afd6
    call call_a586
    ld a, $11
    call call_a66c
    call call_afd6
    call call_a586
    ld a, $12
    call call_a66c
    call call_afd6
    call call_a586
    ld a, $13
    call call_a66c
    call call_afd6
    call call_a586
    ld a, $14
    call call_a66c
    call call_afd6
    call call_a586
    ld a, $15
    call call_a66c
    call call_afd6
    call call_a586
    call call_ad8c
    call call_b27d
    jp jp_b093


call_b25a::
    call call_b92c
    ld a, [$cf03]
    ld b, a
    ld a, [$cf04]
    or b
    ret z

    xor a
    trap AudioPlaySound
    ld a, $02
    trap AudioPlaySound
    call call_b963
    call call_a660
    ldh a, [$8a]
    and $02
    jr nz, call_b25a

    trap AwaitFrame
    jr call_b25a


call_b27d:
    ld c, $01

jr_b27f::
    trap AwaitFrame
    dec c
    jr nz, jr_b27f

    ret


jp_b285:
    xor a
    trap AudioPlayMusic
    trap ExitToMenu


data_b28a:
    dw data_b2c4
    dw data_b2d2
    dw data_b2e7
    dw data_b2f3
    dw data_b2ff
    dw data_b30c
    dw data_b314
    dw data_b32b
    dw data_b33d
    dw data_b34f
    dw data_b35e
    dw data_b36d
    dw data_b37f
    dw data_b392
    dw data_b3a4
    dw data_b3b5
    dw data_b3bd
    dw data_b3ce
    dw data_b3e0
    dw data_b3f3
    dw data_b404
    dw data_b412
    dw data_b419
    dw data_b421
    dw data_b429
    dw data_b431
    dw data_b439
    dw data_b441
    dw data_b449

data_b2c4:
    db $03, $06, $3a, $3e, $00, $20, $12, $03, $0c, $10, $2a, $02, $01, $ff
data_b2d2:
    db $02, $0b, $37, $41, $36, $00, $26, $2f, $16, $25, $12, $30, $0d, $15, $2c, $28, $25, $13, $02, $01, $ff
data_b2e7:
    db $03, $06, $3a, $3e, $00, $1f, $21, $23, $14, $04, $01, $ff
data_b2f3:
    db $03, $06, $3a, $3e, $00, $42, $04, $23, $04, $02, $01, $ff
data_b2ff:
    db $06, $0b, $11, $23, $47, $2c, $2c, $28, $25, $13, $4b, $04, $ff
data_b30c:
    db $08, $08, $29, $0f, $25, $27, $23, $ff
data_b314:
    db $00, $06, $3a, $3e, $00, $1d, $14, $0f, $06, $32, $3d, $41, $15, $1a, $14, $14, $0f, $0c, $2d, $22, $02, $01, $ff
data_b32b:
    db $02, $0b, $37, $41, $36, $00, $38, $3b, $38, $3b, $1e, $25, $2c, $28, $25, $13, $01, $ff
data_b33d:
    db $02, $0b, $37, $41, $36, $00, $16, $28, $24, $0f, $2f, $14, $2c, $28, $25, $13, $01, $ff
data_b34f:
    db $02, $0b, $37, $41, $36, $00, $13, $28, $0c, $2c, $28, $25, $13, $01, $ff
data_b35e:
    db $02, $0b, $37, $41, $36, $00, $31, $33, $13, $2c, $28, $25, $13, $01, $ff
data_b36d:
    db $02, $0b, $37, $41, $36, $00, $17, $22, $1b, $2b, $1e, $25, $2c, $28, $25, $13, $01, $ff
data_b37f:
    db $02, $0b, $37, $41, $36, $00, $1c, $23, $18, $0e, $12, $14, $2c, $28, $25, $13, $02, $01, $ff
data_b392:
    db $02, $0b, $37, $41, $36, $00, $43, $25, $44, $10, $18, $0c, $2c, $28, $25, $13, $01, $ff
data_b3a4:
    db $04, $0b, $11, $25, $45, $11, $46, $47, $48, $18, $0c, $2c, $28, $25, $13, $02, $ff
data_b3b5:
    db $08, $08, $1f, $2f, $14, $19, $02, $ff
data_b3bd:
    db $02, $06, $3a, $3e, $00, $17, $0d, $17, $0d, $1f, $2f, $14, $2a, $02, $02, $01, $ff
data_b3ce:
    db $02, $0b, $37, $41, $36, $00, $21, $10, $12, $30, $0d, $2c, $28, $25, $13, $19, $01, $ff
data_b3e0:
    db $02, $06, $3a, $3e, $00, $15, $30, $0d, $12, $4c, $1a, $4d, $18, $03, $40, $33, $02, $01, $ff
data_b3f3:
    db $02, $0b, $37, $41, $36, $00, $13, $47, $18, $0c, $2c, $28, $25, $13, $4b, $01, $ff
data_b404:
    db $04, $08, $51, $14, $22, $00, $4e, $4e, $4e, $4e, $4e, $02, $01, $ff
data_b412:
    db $08, $09, $0e, $12, $47, $0c, $ff
data_b419:
    db $08, $08, $34, $35, $04, $3f, $07, $ff
data_b421:
    db $08, $08, $34, $35, $04, $3f, $08, $ff
data_b429:
    db $08, $08, $34, $35, $04, $3f, $09, $ff
data_b431:
    db $08, $08, $34, $35, $04, $3f, $0a, $ff
data_b439:
    db $08, $08, $34, $35, $04, $3f, $0b, $ff
data_b441:
    db $08, $08, $34, $35, $04, $3f, $4f, $ff
data_b449:
    db $08, $08, $34, $35, $04, $3f, $50, $ff

data_b451:
    dw data_b45f
    dw data_b47e
    dw data_b49d
    dw data_b4bc
    dw data_b4e0
    dw data_b504
    dw data_b528

data_b45f:
    db $06, $0d, $03, $00, $02, $0a, $10, $02, $01, $00, $0a, $0d, $03, $02, $00, $01
    db $02, $03, $05, $01, $05, $02, $0e, $05, $01, $05, $10, $0e, $05, $01, $05
data_b47e:
    db $06, $0d, $03, $00, $02, $0a, $10, $02, $01, $00, $0a, $0d, $03, $02, $00, $01
    db $02, $03, $05, $01, $05, $09, $09, $06, $01, $05, $10, $0e, $05, $01, $05
data_b49d:
    db $06, $0d, $03, $00, $02, $0a, $10, $02, $01, $00, $0a, $0d, $03, $02, $00, $01
    db $02, $03, $06, $01, $05, $02, $0e, $07, $01, $05, $10, $0e, $06, $01, $05
data_b4bc:
    db $07, $0d, $03, $00, $02, $0a, $10, $02, $01, $00, $0a, $0d, $03, $02, $00, $01
    db $02, $03, $07, $01, $05, $02, $07, $07, $01, $05, $02, $0a, $07, $01, $05, $02
    db $0e, $07, $01, $05
data_b4e0:
    db $07, $0d, $03, $00, $02, $0a, $10, $02, $01, $00, $0a, $0d, $03, $02, $00, $01
    db $06, $06, $05, $01, $05, $0b, $08, $05, $01, $05, $06, $0b, $05, $01, $05, $0b
    db $0d, $05, $01, $05
data_b504:
    db $07, $0d, $03, $00, $02, $0a, $10, $02, $01, $00, $0a, $0d, $03, $02, $00, $01
    db $01, $03, $07, $01, $05, $11, $0f, $07, $01, $05, $07, $04, $06, $01, $05, $0f
    db $0a, $05, $01, $05
data_b528:
    db $06, $0d, $03, $00, $02, $0a, $10, $02, $01, $00, $0a, $0d, $03, $02, $00, $01
    db $01, $0e, $08, $01, $05, $06, $0f, $09, $02, $05, $03, $10, $08, $02, $05, $02
    db $04, $08, $14, $0c

data_b54c:
    dw data_b564
    dw data_b584
    dw data_b5c0
    dw data_b5db
    dw data_b5fb
    dw data_b61b
    dw data_b65f
    dw data_b6a3
    dw data_b6e7
    dw data_b70d
    dw data_b746
    dw data_b782

data_b564:
    dw data_b578
    db $02, $00, $01
    dw data_b578
    db $02, $00, $01
    dw data_b578
    db $02, $00, $01
    dw data_b578
    db $02, $00, $01
data_b578:
    db $02, $02, $0f, $2f, $1f, $3f, $02, $02, $4f, $6f, $5f, $7a

data_b584:
    dw data_b594
    db $01, $00
    dw data_b59f
    db $01, $00
    dw data_b5aa
    db $01, $00
    dw data_b5b5
    db $01, $00
data_b594:
    db $03, $03, $33, $34, $35, $43, $44, $45, $53, $54, $55
data_b59f:
    db $03, $03, $3c, $3d, $3e, $3c, $4d, $4e, $5c, $5d, $5e
data_b5aa:
    db $03, $03, $03, $04, $05, $13, $14, $15, $23, $24, $25
data_b5b5:
    db $03, $03, $0c, $0d, $0e, $1c, $1d, $1e, $2c, $2d, $2e

data_b5c0:
    dw data_b5d0
    db $01, $00
    dw data_b5d0
    db $01, $00
    dw data_b5d0
    db $01, $00
    dw data_b5d0
    db $01, $00
data_b5d0:
    db $03, $03, $69, $6a, $6b, $79, $ff, $7b, $6c, $6d, $6e

data_b5db:
    dw data_b5ef
    db $02, $00, $01
    dw data_b5ef
    db $02, $00, $01
    dw data_b5ef
    db $02, $00, $01
    dw data_b5ef
    db $02, $00, $01
data_b5ef:
    db $02, $02, $2c, $2d, $3c, $3d, $02, $02, $2e, $2f, $3e, $3f

data_b5fb:
    dw data_b60f
    db $02, $00, $01
    dw data_b60f
    db $02, $00, $01
    dw data_b60f
    db $02, $00, $01
    dw data_b60f
    db $02, $00, $01
data_b60f:
    db $02, $02, $5d, $7c, $7d, $7e, $02, $02, $4f, $6f, $5f, $7f

data_b61b:
    dw data_b62f
    db $02, $00, $01
    dw data_b63b
    db $02, $00, $01
    dw data_b647
    db $02, $00, $01
    dw data_b653
    db $02, $00, $01
data_b62f:
    db $02, $02, $84, $85, $94, $95, $02, $02, $86, $87, $96, $97
data_b63b:
    db $02, $02, $89, $88, $99, $98, $02, $02, $8b, $8a, $9b, $9a
data_b647:
    db $02, $02, $80, $81, $90, $91, $02, $02, $82, $83, $92, $93
data_b653:
    db $02, $02, $88, $89, $98, $99, $02, $02, $8a, $8b, $9a, $9b

data_b65f:
    dw data_b673
    db $02, $00, $01
    dw data_b67f
    db $02, $00, $01
    dw data_b68b
    db $02, $00, $01
    dw data_b697
    db $02, $00, $01
data_b673:
    db $02, $02, $a4, $a5, $b4, $b5, $02, $02, $a6, $a7, $b6, $b7
data_b67f:
    db $02, $02, $a9, $a8, $b9, $b8, $02, $02, $ab, $aa, $bb, $ba
data_b68b:
    db $02, $02, $a0, $a1, $b0, $b1, $02, $02, $a2, $a3, $b2, $b3
data_b697:
    db $02, $02, $a8, $a9, $b8, $b9, $02, $02, $aa, $ab, $ba, $bb

data_b6a3:
    dw data_b6b7
    db $02, $00, $01
    dw data_b6c3
    db $02, $00, $01
    dw data_b6cf
    db $02, $00, $01
    dw data_b6db
    db $02, $00, $01
data_b6b7:
    db $02, $02, $c4, $c5, $d4, $d5, $02, $02, $c6, $c7, $d6, $d7
data_b6c3:
    db $02, $02, $c9, $c8, $d9, $d8, $02, $02, $cb, $ca, $db, $da
data_b6cf:
    db $02, $02, $c0, $c1, $d0, $d1, $02, $02, $c2, $c3, $d2, $d3
data_b6db:
    db $02, $02, $c8, $c9, $d8, $d9, $02, $02, $ca, $cb, $da, $db

data_b6e7:
    dw data_b6fb
    db $02, $00, $01
    dw data_b707
    db $02, $00, $01
    dw data_b701
    db $02, $00, $01
    dw data_b707
    db $02, $00, $01
data_b6fb:
    db $01, $01, $e6, $01, $01, $e7
data_b701:
    db $01, $01, $e4, $01, $01, $e5
data_b707:
    db $01, $01, $e3, $01, $01, $e8

data_b70d:
    dw data_b725
    db $03, $00, $01, $02
    dw data_b725
    db $03, $00, $01, $02
    dw data_b725
    db $03, $00, $01, $02
    dw data_b725
    db $03, $00, $01, $02
data_b725:
    db $03, $03, $8c, $8d, $8e, $9c, $9d, $9e, $8f, $ac, $ad
data_b730:
    db $03, $03, $9f, $bc, $bd, $ae, $af, $cc, $be, $bf, $dc
data_b73b:
    db $03, $03, $cd, $ce, $cf, $dd, $de, $df, $e0, $e1, $e2

data_b746:
    dw data_b756
    db $01, $00
    dw data_b761
    db $01, $00
    dw data_b76c
    db $01, $00
    dw data_b777
    db $01, $00
data_b756:
    db $03, $03, $30, $31, $32, $40, $41, $42, $50, $51, $52
data_b761:
    db $03, $03, $39, $3a, $3b, $49, $4a, $4b, $59, $5a, $5b
data_b76c:
    db $03, $03, $00, $01, $02, $10, $11, $12, $20, $21, $22
data_b777:
    db $03, $03, $09, $0a, $0b, $19, $1a, $1b, $29, $2a, $2b

data_b782:
    dw data_b792
    db $01, $00
    dw data_b79d
    db $01, $00
    dw data_b7a8
    db $01, $00
    dw data_b7b3
    db $01, $00
data_b792:
    db $03, $03, $36, $37, $38, $46, $47, $48, $56, $57, $58
data_b79d:
    db $03, $03, $73, $74, $75, $66, $67, $68, $76, $77, $78
data_b7a8:
    db $03, $03, $06, $07, $08, $16, $17, $18, $26, $27, $28
data_b7b3:
    db $03, $03, $60, $61, $62, $70, $71, $72, $63, $64, $65

data_b7be:
    db $1b, $1d
    db $21, $2c, $2d, $2e, $3f, $31, $32, $33, $34, $35, $62, $63, $65, $66, $68, $6a
    db $6c, $6d, $70, $71, $73, $74, $75, $78, $79, $7a, $7e, $80, $83, $84, $86, $87
    db $88, $8a, $8c, $8d, $8e, $8f, $92, $94, $96, $98, $9b, $9f, $aa, $af, $ae, $b2
    db $b5, $b6, $bd, $c3, $c4, $c8, $cb, $cd, $cf, $d4, $d7, $da, $e0, $e4, $ed, $ff
    db $61, $82, $a1, $9c, $6f, $7f, $69, $e8, $d2, $a9, $76, $89, $ca, $36, $37, $7c

data_b810:
    dw data_b81e
    dw data_b821
    dw data_b826
    dw data_b82d
    dw data_b836
    dw data_b84f
    dw data_b856

data_b81e:
    db $01
    db $09, $08
data_b821:
    db $02
    db $09, $04
    db $09, $0d
data_b826:
    db $03
    db $0b, $06
    db $09, $08
    db $07, $0a
data_b82d:
    db $04
    db $05, $05
    db $0d, $05
    db $05, $0c
    db $0d, $0c
data_b836:
    db $0c
    db $04, $06
    db $0e, $06
    db $04, $08
    db $0d, $08
    db $04, $0b
    db $0d, $0b
    db $04, $0d
    db $0d, $0d
    db $04, $10
    db $0d, $10
    db $11, $06
    db $01, $04
data_b84f:
    db $03
    db $07, $08
    db $09, $0a
    db $0b, $08
data_b856:
    db $04
    db $09, $04
    db $03, $08
    db $09, $0d
    db $0f, $09

data_b85f:
    db $10, $05, $06, $06, $06, $10, $00, $01, $02, $06, $06, $06, $06, $06, $10, $10
    db $03, $04, $06, $10

data_b863:
    db $00, $00, $00, $00, $00, $40, $00, $04, $00, $00, $00, $00, $00
    db $10, $00, $00, $03, $03, $04, $45, $19, $19, $20, $21, $51, $6f, $4f, $7a, $42
    db $7d, $78, $5f, $80, $80, $58, $d8, $24, $64, $74, $d4, $fe, $92, $f5, $1d, $df
    db $31, $fd, $8b, $66, $65, $4f, $4a, $7a, $57, $df, $a8, $af, $fa, $cf, $71, $7f
    db $be, $1f, $60, $e7, $85, $5f, $d5, $ff, $15, $7f, $c6, $ff, $18, $fe, $e1, $f8
    db $06, $80, $78

call_b8c3:
    ld a, [$cf1b]
    and a
    ret z

call_b8c8:
    ld a, [$cf03]
    ld l, a
    ld a, [$cf04]
    ld h, a
    ld a, [$d0a6]
    call call_b94d
    push hl
    ld c, $64
    call call_b905
    ld d, $02
    call call_b91b
    ld c, $0a
    call call_b905
    ld d, $03
    call call_b91b
    ld b, l
    ld d, $04
    call call_b91b
    pop hl
    ld a, l
    ld [$cf03], a
    ld a, h
    ld [$cf04], a
    ld a, [$cf05]
    dec a
    ld b, a
    ld d, $12
    call call_b91b
    ret


call_b905:
    ld b, $00
    ld a, l
    sub c
    ld l, a
    ld a, h
    sbc $00
    ld h, a
    inc b
    jp nc, $b907

    ld a, l
    add c
    ld l, a
    ld a, h
    adc $00
    ld h, a
    dec b
    ret


call_b91b:
    push hl
    ld a, d
    ld hl, $cf07
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, b
    add $06
    ld [hl], a
    pop hl
    ret


call_b92c:
    ld a, [$cf03]
    ld e, a
    ld a, [$cf04]
    or e
    ret z

    ld a, [$cf04]
    ld d, a
    ld hl, $0064
    trap $8a
    ld a, [$c3b0]
    ld e, a
    ld a, [$c3b1]
    or e
    call z, $b956
    call call_b8c8
    ret


call_b94d:
    ld e, a
    ld a, l
    sub e
    ld l, a
    ld a, h
    sbc $00
    ld h, a
    ret


jp_b956:
    ld a, [$d0a4]
    inc a
    ld [$d0a4], a
    ld a, $0a
    ld [$d0a6], a
    ret


call_b963:
    ld e, $03
    ld hl, $cf1c
    ld b, $00
    ld c, e
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    push hl
    ld bc, $000f
    add hl, bc
    ld a, [hl]
    sub $05
    pop hl
    ld d, a
    call call_b9a3
    inc e
    ld a, e
    cp $08
    jp nz, $b965

    ld a, [$d0a5]
    cpl
    bit 0, a
    ld [$d0a5], a
    ret z

    ld a, [$d0a4]
    cp $00
    call nz, $b9c4
    ret


call_b9a3:
    ld a, l
    add $04
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [hl]
    bit 2, a
    ret z

    res 2, a
    ld [hl], a
    ld hl, $b547
    ld a, l
    add d
    ld l, a
    ld a, h
    adc $00
    ld h, a
    ld a, [$d0a4]
    add [hl]
    ld [$d0a4], a
    ret


jp_b9c4:
    ld a, [$cf01]
    add $01
    ld [$cf01], a
    ld a, [$cf02]
    adc $00
    ld [$cf02], a
    ld a, [$d0a4]
    dec a
    ld [$d0a4], a
    call call_b9df
    ret


call_b9df:
    ld a, [$cf02]
    ld h, a
    ld a, [$cf01]
    ld l, a
    ld d, $09
    ld c, $64
    call call_b905
    call call_b91b
    ld d, $0a
    ld c, $0a
    call call_b905
    call call_b91b
    ld d, $0b
    ld b, l
    call call_b91b
    ret


call_ba02:
    ld hl, $cfa0
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld bc, $0010
    ld e, l
    ld d, h
    ld hl, $d092
    trap MemCopy
    ret


call_ba24:
    ld hl, $cfa0
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld bc, $0010
    ld de, $d092
    trap MemCopy
    ret


call_ba44:
    ld a, [$cf30]
    and $80
    jr z, jr_ba92

    ld a, $03
    ld [$cf31], a
    ld a, $0f
    ld [$cf36], a
    ld a, [$cf2c]
    ld [$d08d], a
    ld a, [$cf2d]
    ld [$d08e], a
    ld a, [$cf1c]
    sub $04
    ld [$d08f], a
    ld a, [$cf1d]
    sub $04
    ld [$d090], a
    ld a, [$cf31]
    ld [$d091], a
    call call_bbeb
    ld a, $01
    call call_ba24
    ld a, [$d094]
    ld b, a
    ld a, [$d096]
    cp $00
    jr nz, jr_ba92

    ld a, $01
    ld [$cf36], a
    ld [$cf31], a

jr_ba92::
    ld a, [$cf30]
    and $40
    ret z

    ld a, [$cf36]
    dec a
    ld [$cf36], a
    cp $00
    jr nz, jr_babc

    ld a, $0e
    ld [$cf36], a
    ld a, [$cf31]
    dec a
    ld [$cf31], a
    cp $00
    jr nz, jr_babc

    ld a, [$cf30]
    and $bf
    ld [$cf30], a
    ret


jr_babc::
    ld a, [$cf31]
    ld [$d091], a
    ld a, $01
    call call_ba02
    call call_bcb2
    ld a, $01
    ld [$d04d], a
    ld a, [$d092]
    ld b, a
    ld a, [$d093]
    ld c, a
    call call_a69b
    jr c, jr_baea

    ld a, [$d092]
    ld [$cf2c], a
    ld a, [$d093]
    ld [$cf2d], a
    jr jr_bafb

jr_baea::
    xor a
    ld [$cf31], a
    ld [$cf36], a
    ld a, [$cf30]
    and $bf
    and $7f
    ld [$cf30], a

jr_bafb::
    ld a, $01
    call call_ba24
    ld hl, $cf1c
    ld b, $00
    ld c, $01
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld bc, $0008
    add hl, bc
    ld a, [$d09d]
    and a
    jr z, jr_bafb

    cpl
    and $80
    rlca
    rlca
    ld [hl], a
    ret


jp_bb29:
    ld a, [$d09c]
    and a
    ret z

    and $80
    rlca
    rlca
    inc a
    ld [hl], a
    ret


call_bb35:
    ld a, [$d08b]
    ld hl, $cf1c
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld [$d020], a
    ld a, [hl+]
    ld [$d021], a
    ld a, [hl+]
    ld [$d022], a
    ld a, [hl+]
    ld [$d023], a
    ld a, [$d089]
    ld hl, $cf1c
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld [$d030], a
    ld a, [hl+]
    ld [$d031], a
    ld a, [hl+]
    ld [$d032], a
    ld a, [hl+]
    ld [$d033], a
    ld a, [$d032]
    sla a
    sla a
    sla a
    ld b, a
    ld a, [$d020]
    sub b
    add $04
    push af
    ld a, [$d030]
    ld b, a
    pop af
    cp b
    ret nc

    ld a, [$d033]
    sla a
    sla a
    sla a
    ld b, a
    ld a, [$d021]
    sub b
    add $04
    push af
    ld a, [$d031]
    ld b, a
    pop af
    cp b
    ret nc

    ld a, [$d022]
    sla a
    sla a
    sla a
    ld b, a
    ld a, [$d020]
    add b
    sub $04
    push af
    ld a, [$d030]
    ld b, a
    pop af
    cp b
    ccf
    ret nc

    ld a, [$d023]
    sla a
    sla a
    sla a
    ld b, a
    ld a, [$d021]
    add b
    sub $04
    push af
    ld a, [$d031]
    ld b, a
    pop af
    cp b
    ccf
    ret


call_bbeb:
    ld a, [$d08f]
    ld e, a
    ld d, $00
    ld a, [$d08d]
    ld [$d092], a
    ld l, a
    ld h, $00
    trap MathSub16
    ld a, l
    ld [$d094], a
    ld a, h
    ld [$d095], a
    ld a, l
    or h
    jr z, jr_bc0c

    ld a, h
    sla a
    inc a

jr_bc0c::
    ld [$d09c], a
    rlc h
    jr c, jr_bc17

    rrc h
    jr jr_bc22

jr_bc17::
    rrc h
    ld a, $ff
    xor h
    ld h, a
    ld a, $ff
    xor l
    ld l, a
    inc hl

jr_bc22::
    ld a, l
    ld [$d098], a
    ld a, h
    ld [$d099], a
    ld a, [$d090]
    ld e, a
    ld d, $00
    ld a, [$d08e]
    ld [$d093], a
    ld l, a
    ld h, $00
    trap MathSub16
    ld a, l
    ld [$d096], a
    ld a, h
    ld [$d097], a
    ld a, l
    or h
    jr z, jr_bc4b

    ld a, h
    sla a
    inc a

jr_bc4b::
    ld [$d09d], a
    rlc h
    jr c, jr_bc56

    rrc h
    jr jr_bc61

jr_bc56::
    rrc h
    ld a, $ff
    xor h
    ld h, a
    ld a, $ff
    xor l
    ld l, a
    inc hl

jr_bc61::
    ld a, l
    ld [$d09a], a
    ld a, h
    ld [$d09b], a
    ld a, [$d098]
    ld e, a
    ld a, [$d099]
    ld d, a
    ld a, [$d09a]
    ld l, a
    ld a, [$d09b]
    ld h, a
    ld c, $07
    trap $84
    ld a, l
    cp $00
    jr nz, jr_bc9a

    ld a, $00
    ld [$d0a0], a
    ld a, [$d098]
    ld l, a
    ld a, [$d099]
    ld h, a
    trap MathNeg16
    ld a, l
    ld [$d09e], a
    ld a, h
    ld [$d09f], a
    ret


jr_bc9a::
    ld a, $01
    ld [$d0a0], a
    ld a, [$d09a]
    ld l, a
    ld a, [$d09b]
    ld h, a
    trap MathNeg16
    ld a, l
    ld [$d09e], a
    ld a, h
    ld [$d09f], a
    ret


call_bcb2:
    ld a, [$d091]
    ld c, a
    ld b, $00
    ld a, [$d0a0]
    cp $00
    jr nz, jr_bd29

jr_bcbf::
    ld a, c
    cp $00
    ret z

    push bc
    ld a, [$d09c]
    ld b, a
    ld a, [$d092]
    add b
    ld [$d092], a
    ld a, [$d09a]
    ld e, a
    ld a, [$d09b]
    ld d, a
    ld l, $02
    ld h, $00
    trap $89
    ld a, [$d09e]
    ld e, a
    ld a, [$d09f]
    ld d, a
    trap MathAdd16
    ld a, l
    ld [$d09e], a
    ld a, h
    ld [$d09f], a
    ld d, $00
    ld e, $00
    ld c, $06
    trap $84
    ld a, l
    jr nz, jr_bd25

    ld a, [$d09d]
    ld b, a
    ld a, [$d093]
    add b
    ld [$d093], a
    ld a, [$d098]
    ld e, a
    ld a, [$d099]
    ld d, a
    ld l, $02
    ld h, $00
    trap $89
    ld a, [$d09e]
    ld e, a
    ld a, [$d09f]
    ld d, a
    trap MathSub16
    ld a, l
    ld [$d09e], a
    ld a, h
    ld [$d09f], a

jr_bd25::
    pop bc
    dec c
    jr jr_bcbf

jr_bd29::
    ld a, c
    cp $00
    ret z

    push bc
    ld a, [$d09d]
    ld b, a
    ld a, [$d093]
    add b
    ld [$d093], a
    ld a, [$d098]
    ld e, a
    ld a, [$d099]
    ld d, a
    ld l, $02
    ld h, $00
    trap $89
    ld a, [$d09e]
    ld e, a
    ld a, [$d09f]
    ld d, a
    trap MathAdd16
    ld a, l
    ld [$d09e], a
    ld a, h
    ld [$d09f], a
    ld d, $00
    ld e, $00
    ld c, $06
    trap $84
    ld a, l
    jr nz, jr_bd8f

    ld a, [$d09c]
    ld b, a
    ld a, [$d092]
    add b
    ld [$d092], a
    ld a, [$d09a]
    ld e, a
    ld a, [$d09b]
    ld d, a
    ld l, $02
    ld h, $00
    trap $89
    ld a, [$d09e]
    ld e, a
    ld a, [$d09f]
    ld d, a
    trap MathSub16
    ld a, l
    ld [$d09e], a
    ld a, h
    ld [$d09f], a

jr_bd8f::
    pop bc
    dec c
    jr jr_bd29

ENDL
