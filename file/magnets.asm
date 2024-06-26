; Disassembly of "magnets.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db kFileHasIcon2bpp + kFileMarkerDiamond + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db .end - @ - 1            ; length of variable parts of header
    db $66                     ; owner code
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
    jp $b093


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
    push af
    push bc
    push de
    push hl
    ld d, $00
    ld e, a
    ld hl, $a106
    trap IntToStringHex
    trap DrawString
    ld a, $01
    trap $b9
    pop hl
    pop de
    pop bc
    pop af
    ret


    push af
    push bc
    push de
    push hl

jr_000_0123:
    ld d, $00
    ld e, a
    ld hl, $a106
    trap IntToString
    trap DrawString
    ld a, $01
    trap $b9
    pop hl
    pop de
    pop bc
    pop af
    ret


    push af
    push bc
    push de
    push hl
    ld a, b
    call $a110
    pop hl

HeaderManufacturerCode::
    pop de
    pop bc
    pop af
    ret


HeaderCGBFlag::
    push af
    push bc
    push de
    push hl
    ld a, c
    call $a110
    pop hl
    pop de
    pop bc
    pop af
    ret


    push af
    push bc
    push de
    push hl
    ld a, d
    call $a110
    pop hl
    pop de
    pop bc
    pop af
    ret


    push af
    push bc
    push de
    push hl
    ld a, e
    call $a110
    pop hl
    pop de
    pop bc
    pop af
    ret


    push af
    push bc
    push de
    push hl
    ld a, h
    call $a110
    pop hl
    pop de
    pop bc
    pop af
    ret


    push af
    push bc
    push de
    push hl
    ld a, l
    call $a110
    pop hl
    pop de
    pop bc
    pop af
    ret


    push af
    push bc
    push de
    push hl
    ld e, c
    ld d, b
    ld hl, $a106
    trap IntToStringHex
    dec hl
    dec hl
    trap DrawString
    ld a, $01
    trap $b9
    pop hl
    pop de
    pop bc
    pop af
    ret


    push af
    push bc
    push de
    push hl
    ld hl, $a106
    trap IntToStringHex
    dec hl
    dec hl
    trap DrawString
    ld a, $01
    trap $b9
    pop hl
    pop de
    pop bc
    pop af
    ret


    push af
    push bc
    push de
    push hl
    ld e, l
    ld d, h
    ld hl, $a106
    trap IntToStringHex
    dec hl
    dec hl
    trap DrawString
    ld a, $01
    trap $b9
    pop hl
    pop de
    pop bc
    pop af
    ret


    push af
    ld a, [bc]
    call $a110
    pop af
    ret


    push af
    ld a, [de]
    call $a110
    pop af
    ret


    push af
    ld a, [hl]
    call $a110
    pop af
    ret


    push af
    push bc
    push de
    push hl

jr_000_01e3::
    ld a, [hl+]
    call $a110
    dec c
    jr nz, jr_000_01e3

    pop hl
    pop de
    pop bc
    pop af
    ret


    push af

jr_000_01f0::
    ldh a, [$8a]
    and a
    jr nz, jr_000_01f0

    pop af
    ret


    push af
    call $a1f7

jr_000_01fb::
    ldh a, [$8a]
    and a
    jr z, jr_000_01fb

    pop af
    ret


Jump_000_0202::
    push af

jr_000_0203::
    ldh a, [$8a]
    bit 0, a
    jr z, jr_000_0203

    pop af
    ret


    ld h, [hl]
    ld c, l
    ld b, c
    ld b, a
    ld c, [hl]
    ld b, l
    ld d, h
    ld d, e
    jr nz, @+$46

    ld b, c
    ld d, h
    ld b, c
    nop
    ld hl, $c500
    ld de, $a213
    ld c, $0d
    trap $6b
    ret nc

jr_000_0224::
    trap ExitToMenu
    push bc
    ld hl, $c500
    ld b, $00
    trap $ea
    pop bc
    jr c, jr_000_0224

    ld de, $c700
    ld hl, $c500
    trap $eb
    ret nc

    jr jr_000_0224

    push de
    ld de, $c700
    ld b, $c6
    trap InitDecompress
    pop de
    ld b, $01
    ld a, c
    and a
    jr z, jr_000_024c

    dec b

jr_000_024c::
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    trap RunDecompress
    ret


    xor a
    trap DrawInit
    ld a, $e4
    ldh [$9d], a
    ld a, $d8
    ldh [$9c], a
    ldh [$9e], a
    call $a278
    ret


    ld e, $00
    ld bc, $0520
    ld hl, $cf00
    trap MemSet
    ld bc, $0014
    ld de, $b85f
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


    xor a
    ld d, a
    ld e, a
    ld bc, $0110
    call $a22e
    ld bc, $0110
    ld de, $c700
    ld hl, $9000
    trap MemCopy
    call $a2df
    ld de, $0110
    ld bc, $0566
    call $a22e
    ld de, $8000
    ld c, $80
    call $a244
    ld de, $0676
    ld bc, jr_000_04f0
    call $a22e
    ld de, $8800
    ld c, $80
    call $a244
    ret


    xor a
    ld hl, $b7be

jr_000_02db::
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

Call_000_0303::
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
    jr c, jr_000_02db

    ld bc, $0520
    ld de, $cf00
    ld hl, $9200
    trap MemCopy
    ret


    xor a
    trap DrawInit
    trap LCDDisable
    ld e, $f8
    ld bc, $0400
    ld hl, $9800
    trap MemSet
    ld de, $0b66
    ld bc, $367b
    call $a22e
    ld de, $8800
    ld c, $00
    call $a244
    ld hl, $9822
    ld a, $80
    ld b, $10

jr_000_034f::
    push bc
    ld e, l
    ld d, h
    ld c, $10

jr_000_0354::
    ld [hl+], a
    inc a
    dec c
    jr nz, jr_000_0354

    ld l, e
    ld h, d
    ld bc, $0020
    add hl, bc
    pop bc
    dec b
    jr nz, jr_000_034f

    ld a, $03
    trap LCDEnable
    ld a, $02
    trap PlayMusic
    call $afd6
    ld a, $01
    call $a382
    xor a
    trap PlayMusic
    ret


    nop
    ld [$cf30], sp
    or c
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
    call $a3ba
    ld d, $80
    ld hl, $8001
    call $a3ba
    ld d, $00
    ld hl, $8800
    call $a3ba
    ld d, $00
    ld hl, $8801
    call $a3ba
    ret


    ld b, $fe

jr_000_03b4::
    ld c, d
    push hl

jr_000_03b6::
    ld e, $08

jr_000_03b8::
    ld a, [hl]
    and b
    ld [hl+], a
    inc hl
    call $d420
    dec e
    jr nz, jr_000_03b8

    dec c
    jr nz, jr_000_03b6

    pop hl
    trap AwaitFrame
    trap AwaitFrame
    trap AwaitFrame
    trap AwaitFrame
    sla b
    jr c, jr_000_03b4

    ret


    ld d, $00
    ld e, $ff

jr_000_03d7::
    push de
    call $a434
    pop de
    ld a, [$d024]
    and a
    jr z, jr_000_040d

    inc e
    push de
    call $a473
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

jr_000_040d::
    inc d
    ld a, d
    cp $08
    jr nz, jr_000_03d7

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


    call $a4c8
    call $a4f4
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

jr_000_048d::
    push bc

jr_000_048e::
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
    jr nz, jr_000_048e

    pop bc
    ld a, [$d020]
    ld [$d040], a
    ld a, [$d041]
    add $08
    ld [$d041], a
    dec b
    jr nz, jr_000_048d

    ld b, e
    srl b
    srl b
    ret


    ld hl, $b54c
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

jr_000_04d5::
    ld a, c
    and a
    jr z, jr_000_04e5

    dec c
    inc hl
    inc hl
    ld a, [hl+]
    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    jr jr_000_04d5

jr_000_04e5::
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld l, c
    ld h, b
    ret


    ld a, [$d026]
    ld c, a

jr_000_04f0::
    ld a, c
    and a
    ret z

    dec c
    push bc
    ld b, $00
    ld a, [hl+]
    ld c, a
    ld a, [hl+]

jr_000_04fa::
    add hl, bc
    dec a
    jr nz, jr_000_04fa

    pop bc
    jr jr_000_04f0

    call $a583
    ld e, $00
    ld bc, $0080
    ld hl, $cf1c
    trap MemSet
    call $a52a
    ld a, $00
    ld [$cf40], a
    ld hl, $03e8
    ld a, l
    ld [$cf03], a
    ld a, h
    ld [$cf04], a
    ret


    ld hl, $b451
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

jr_000_0542::
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
    jr jr_000_0542

    call $a590
    call $a5cd
    call $a660
    call $a601
    ret


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


    ld e, $15
    ld bc, $0014
    ld hl, $9820
    trap MemSet
    ld c, $10

jr_000_05d1::
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
    jr nz, jr_000_05d1

    ret


    ld e, $00
    ld bc, $0022
    ld hl, $d063
    trap MemSet
    ld hl, $b810
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

jr_000_061e::
    push bc
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    pop bc
    dec c
    jr nz, jr_000_061e

    ld a, [$d062]
    ld c, a
    ld de, $d063

jr_000_0630::
    ld a, [de]
    inc de
    ld h, a
    ld a, [de]
    inc de
    ld l, a
    trap MoveCursor
    ld a, $11
    trap DrawChar
    ld a, $12
    trap DrawChar
    ld a, $03
    trap $b9
    ld a, $02
    trap $b9
    ld a, $02
    trap $b9
    ld a, $13
    trap DrawChar
    ld a, $14
    trap DrawChar
    dec c
    jr nz, jr_000_0630

    ret


    ld bc, $0014
    ld de, $cf07
    ld hl, $9800
    trap MemCopy
    ret


    ld hl, $b28a
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
    trap MoveCursor

jr_000_067b::
    ld a, [de]
    inc de
    cp $ff
    ret z

    add $20
    trap DrawChar
    ld c, $05

jr_000_0686::
    trap AwaitFrame
    ldh a, [$8a]
    bit 1, a
    jr nz, jr_000_067b

    dec c
    jr nz, jr_000_0686

    jr jr_000_067b

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

jr_000_06f8::
    ld a, [hl]
    sla a
    sla a
    sla a
    add $08
    ld b, a
    ld a, [$d087]
    sub $04
    cp b
    jr c, jr_000_0736

    ld a, b
    add $0f
    ld b, a
    ld a, [$d020]
    dec a
    add $04
    cp b
    jr nc, jr_000_0736

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
    jr c, jr_000_0736

    ld a, b
    add $0f
    ld b, a
    ld a, [$d021]
    dec a
    add $04
    cp b
    ret c

jr_000_0736::
    inc hl
    inc hl
    dec c
    jr nz, jr_000_06f8

    and a
    ret


    ld a, [$cf20]
    and $02
    jr z, jr_000_0755

    ld a, [$cf2b]
    cp $45
    ret z

    xor a
    ld [$d04d], a
    ld hl, $d050
    call $aa55
    ret


jr_000_0755::
    xor a
    ld [$d04d], a
    ld a, [$cf21]
    ld c, a
    ldh a, [$8a]
    rrca
    jr c, jr_000_079c

    ld b, a
    ld a, [$cf30]
    and $7f
    ld [$cf30], a
    ld a, b
    ld e, $01
    rrca
    jr nc, jr_000_0772

    inc e

jr_000_0772::
    rrca
    rrca

jr_000_0774::
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
    jr nz, jr_000_0774

    ret


jr_000_079c::
    ld a, [$cf30]
    and $80
    ret nz

    ld a, [$d061]
    and a
    jr nz, jr_000_07ac

    ld a, $0c
    trap PlaySound

jr_000_07ac::
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


    ld a, $01
    ld [$cf24], a
    ld a, [$cf1c]
    add c
    ld b, a
    ld a, [$cf1d]
    ld c, a
    push bc
    call $a69b
    pop bc
    ret c

    ld a, b
    ld [$cf1c], a
    ld a, c
    ld [$cf1d], a
    ret


    ld a, $03
    ld [$cf24], a
    ld a, [$cf1c]
    sub c
    ld b, a
    ld a, [$cf1d]
    ld c, a
    push bc
    call $a69b
    pop bc
    ret c

    ld a, b
    ld [$cf1c], a
    ld a, c
    ld [$cf1d], a
    ret


    ld a, $00
    ld [$cf24], a
    ld a, [$cf1c]
    ld b, a
    ld a, [$cf1d]
    sub c
    ld c, a
    push bc
    call $a69b
    pop bc
    ret c

    ld a, b
    ld [$cf1c], a
    ld a, c
    ld [$cf1d], a
    ret


    ld a, $02
    ld [$cf24], a
    ld a, [$cf1c]
    ld b, a
    ld a, [$cf1d]
    add c
    ld c, a
    push bc
    call $a69b
    pop bc
    ret c

    ld a, b
    ld [$cf1c], a
    ld a, c
    ld [$cf1d], a
    ret


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


    ld a, $03
    ld hl, $cf4c

jr_000_0865::
    cp $08
    ret z

    ld [$d04d], a
    push hl
    ld bc, $0004
    add hl, bc
    ld a, [hl]
    and $01
    jr z, jr_000_0895

    ld a, [hl]
    and $02
    jr nz, jr_000_0892

    ld bc, $0007
    add hl, bc
    ld a, [hl]
    sub $05
    sla a
    ld hl, $a8a8
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


jr_000_0892::
    call $aa49

jr_000_0895::
    pop hl
    ld bc, $0010
    add hl, bc
    ld a, [$d04d]
    inc a
    jr jr_000_0865

    or d
    xor b
    add hl, sp
    xor c
    db $e4
    xor c
    ccf
    xor d
    ld b, d
    xor d
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
    jr c, jr_000_08f8

    ld a, $03
    ld [hl+], a
    inc hl
    ld a, [hl]
    dec a
    ld [hl], a
    ld l, e
    ld h, d
    cp $e7
    jr z, jr_000_0926

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
    call $a69b
    pop hl
    pop bc
    jr c, jr_000_0926

    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl], a
    ret


jr_000_08f8::
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
    jr z, jr_000_0926

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
    call $a69b
    pop hl
    pop bc
    jr c, jr_000_0926

    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl], a
    ret


jr_000_0926::
    ld bc, $0008
    add hl, bc
    ld a, [hl]
    add $02
    and $03
    ld [hl], a
    ret


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
    jr nz, jr_000_096f

    ld [hl], a
    ld l, e
    ld h, d
    ld bc, $000c
    add hl, bc
    ld a, [hl]
    inc a
    and $07
    ld [hl], a
    ld hl, $a99e
    ld c, a
    add hl, bc
    ld a, [hl]
    ld l, e
    ld h, d
    ld bc, $0008
    add hl, bc
    ld [hl], a

jr_000_096f::
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
    ld hl, $a9a6
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


    ld [bc], a
    inc bc
    inc bc
    nop
    nop
    ld bc, $0201
    or [hl]
    xor c
    cp e
    xor c
    jp nz, $c6a9

    xor c
    call $d2a9
    xor c
    reti


    xor c
    db $dd
    xor c
    inc hl
    ld a, [hl]
    add c
    ld [hl], a
    ret


    ld a, [hl]
    sub c
    ld [hl+], a
    ld a, [hl]
    add c
    ld [hl], a
    ret


    ld a, [hl]
    sub c
    ld [hl], a
    ret


    ld a, [hl]
    sub c
    ld [hl+], a
    ld a, [hl]
    sub c
    ld [hl], a
    ret


    inc hl
    ld a, [hl]
    sub c
    ld [hl], a
    ret


    ld a, [hl]
    add c
    ld [hl+], a
    ld a, [hl]
    sub c
    ld [hl], a
    ret


    ld a, [hl]
    add c
    ld [hl], a
    ret


    ld a, [hl]
    add c
    ld [hl+], a
    ld a, [hl]
    add c
    ld [hl], a
    ret


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
    call $bbeb
    call $bcb2
    ld a, [$d092]
    ld b, a
    ld a, [$d093]
    ld c, a
    call $a69b
    pop hl
    ret c

    ld a, [$d092]
    ld [hl+], a
    ld a, [$d093]
    ld [hl], a
    ret


    jp $a9e4


    call $aac6
    ret nc

    jp $a9e4


    ld a, [$d04d]
    sla a
    ld b, $00
    ld c, a
    ld hl, $d050
    add hl, bc
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
    jr nc, jr_000_0a9d

    inc hl
    ld c, a
    ld a, [hl-]
    sla a
    sla a
    sla a
    add c
    cp $08
    jr c, jr_000_0a9d

    dec hl
    ld a, c
    ld [hl+], a
    ld a, [de]
    ld c, a
    ld a, [hl+]
    add c
    cp $a1
    jr nc, jr_000_0a9d

    inc hl
    ld c, a
    ld a, [hl-]
    sla a
    sla a
    sla a
    add c
    cp $18
    jr c, jr_000_0a9d

    dec hl
    ld a, c
    ld [hl], a
    ret


jr_000_0a9d::
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
    jr c, jr_000_0ae2

    cp $08
    jr nc, jr_000_0ae4

jr_000_0ae2::
    ld a, $08

jr_000_0ae4::
    ld [$cf9c], a
    ld a, [hl+]
    ld c, a
    sub $28
    jr c, jr_000_0af1

    cp $18
    jr nc, jr_000_0af3

jr_000_0af1::
    ld a, $18

jr_000_0af3::
    ld [$cf9e], a
    ld a, [hl+]
    sla a
    sla a
    sla a
    add b
    add $28
    cp $a9
    jr c, jr_000_0b06

    ld a, $a9

jr_000_0b06::
    ld [$cf9d], a
    ld a, [hl+]
    sla a
    sla a
    sla a
    add c
    add $28
    cp $a1
    jr c, jr_000_0b19

    ld a, $a1

jr_000_0b19::
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


    xor a
    ld hl, $cf1c

jr_000_0b48::
    cp $08
    ret z

    ld [$d060], a
    push hl
    ld bc, $0004
    add hl, bc
    ld a, [hl+]
    and a
    jr z, jr_000_0b63

    call $ab76
    call $ab96
    call $abe2
    call $abb6

jr_000_0b63::
    pop hl
    ld bc, $0010
    add hl, bc
    ld a, [$d060]
    inc a
    jr jr_000_0b48

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


    ld a, [$d02b]
    cp $05
    ret c

    ld a, [$d028]
    cp $01
    ld a, [$d029]
    jr z, jr_000_0bf0

    and $df
    ld [$d029], a
    ret


jr_000_0bf0::
    or $20
    ld [$d029], a
    ret


    xor a

jr_000_0bf7::
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
    ld hl, $b54c
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

jr_000_0c2f::
    and a
    jr z, jr_000_0c41

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
    jr jr_000_0c2f

jr_000_0c41::
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
    jr jr_000_0bf7

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


    ld a, [$cf20]
    and $02
    ret nz

    ld c, $03

jr_000_0c7d::
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
    jr nz, jr_000_0cb2

    push bc
    xor a
    ld [$d089], a
    ld a, c
    ld [$d08b], a
    call $bb35
    pop bc
    jr c, jr_000_0cb5

jr_000_0cb2::
    inc c
    jr jr_000_0c7d

jr_000_0cb5::
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
    call $bb35
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


    ld a, [$cf30]
    and $40
    ret z

    ld a, [$cf20]
    and $02
    ret nz

    ld b, $00
    ld c, $03
    ld hl, $cf4c

jr_000_0d19::
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
    jr z, jr_000_0d7a

    bit 1, a
    jr nz, jr_000_0d7a

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
    call $bb35
    pop de
    jr nc, jr_000_0d7a

    xor a
    trap PlaySound
    ld a, $25
    trap PlaySound
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

jr_000_0d7a::
    pop bc
    ld l, e
    ld h, d
    ld de, $0010
    add hl, de
    inc c
    jr jr_000_0d19

    xor a
    trap DrawInit
    call $adbe
    ld a, $12
    ld [$d0a7], a
    ld a, $0b
    trap PlayMusic
    ld hl, $ae92

jr_000_0d96::
    ld a, [hl]
    cp $ff
    jr z, jr_000_0daf

    call $ae21
    push hl
    call $ae80
    pop hl
    ret nz

    ld a, [$d0a7]
    inc a
    and $1f
    ld [$d0a7], a
    jr jr_000_0d96

jr_000_0daf::
    call $afd6
    xor a
    trap PlayMusic
    ret


    trap LCDDisable
    ld hl, $9002
    ld de, $9000
    ld c, $80

jr_000_0dc0::
    ld b, $07

jr_000_0dc2::
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
    jr nz, jr_000_0dc2

    inc hl
    inc hl
    inc de
    inc de
    dec c
    jr nz, jr_000_0dc0

    ld c, $80
    ld hl, $9000

jr_000_0ddd::
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
    jr nz, jr_000_0ddd

    ld a, $03
    trap LCDEnable
    ret


    cp $fe
    jr z, jr_000_0e45

    push hl
    call $ae6e
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


jr_000_0e45::
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


    ld c, $14
    ld de, $d0a8

jr_000_0e6b::
    ld a, [hl+]
    cp $60
    jr c, jr_000_0e72

    sub $60

jr_000_0e72::
    ld [de], a
    inc de
    dec c
    jr nz, jr_000_0e6b

    ret


    ld c, $08

jr_000_0e7a::
    ld b, $07
    ldh a, [$9a]
    inc a
    ldh [$9a], a

jr_000_0e81::
    trap AwaitFrame
    dec b
    jr nz, jr_000_0e81

    dec c
    jr nz, jr_000_0e7a

    ret


    jr nz, jr_000_0eb6

    ld a, [hl+]
    jr nz, @+$4f

    ld b, c
    ld b, a
    ld c, [hl]
    ld b, l
    ld d, h
    ld d, e
    jr nz, @+$33

    add hl, sp
    add hl, sp
    scf
    jr nz, @+$2c

    ld a, [hl+]
    jr nz, jr_000_0ebf

    jr nz, jr_000_0ec1

    jr nz, jr_000_0ec3

    dec l
    jr nz, jr_000_0ef9

    ld d, h
    ld b, c
    ld b, [hl]
    ld b, [hl]
    jr nz, jr_000_0ed9

    jr nz, jr_000_0ece

    jr nz, jr_000_0ed0

    jr nz, jr_000_0ed2

    cp $fe
    jr nz, jr_000_0efa

jr_000_0eb6::
    ld l, c
    ld [hl], d
    ld h, l
    ld h, e
    ld [hl], h
    ld h, l
    ld [hl], d
    jr nz, jr_000_0edf

jr_000_0ebf::
    jr nz, jr_000_0ee1

jr_000_0ec1::
    jr nz, jr_000_0ee3

jr_000_0ec3::
    jr nz, jr_000_0ee5

    jr nz, jr_000_0ee7

    jr nz, @+$22

    jr nz, @+$48

    ld [hl], l
    ld l, l
    ld l, c

jr_000_0ece::
    ld l, b
    ld l, c

jr_000_0ed0::
    ld [hl], e
    ld h, c

jr_000_0ed2::
    jr nz, jr_000_0f27

    ld h, c
    ld [hl], h
    ld l, a
    jr nz, jr_000_0ef9

jr_000_0ed9::
    jr nz, jr_000_0efb

jr_000_0edb::
    jr nz, jr_000_0edb

    jr nz, jr_000_0f2f

jr_000_0edf::
    ld [hl], d
    ld l, a

jr_000_0ee1::
    ld h, a
    ld [hl], d

jr_000_0ee3::
    ld h, c
    ld l, l

jr_000_0ee5::
    ld l, l
    ld h, l

jr_000_0ee7::
    ld [hl], d
    jr nz, jr_000_0f0a

    jr nz, jr_000_0f0c

    jr nz, jr_000_0f0e

    jr nz, jr_000_0f10

    jr nz, jr_000_0f12

    jr nz, jr_000_0f48

    ld h, c
    ld l, e
    ld h, c
    ld l, b
    ld l, c

jr_000_0ef9::
    ld [hl], d

jr_000_0efa::
    ld l, a

jr_000_0efb::
    jr nz, @+$51

    ld l, b
    ld l, [hl]
    ld l, c
    ld [hl], e
    ld l, b
    ld l, c
    jr nz, jr_000_0f25

    jr nz, jr_000_0f27

    ld c, e
    ld h, l
    ld l, c

jr_000_0f0a::
    jr nz, @+$4d

jr_000_0f0c::
    ld l, a
    ld l, [hl]

jr_000_0f0e::
    ld h, h
    ld l, a

jr_000_0f10::
    jr nz, jr_000_0f32

jr_000_0f12::
    jr nz, jr_000_0f34

    jr nz, jr_000_0f36

    jr nz, jr_000_0f38

    jr nz, jr_000_0f3a

    jr nz, jr_000_0f75

    ld l, a
    ld l, e
    ld l, a
    jr nz, jr_000_0f6e

    ld l, c
    ld a, c
    ld h, c
    ld h, d

jr_000_0f25::
    ld h, c
    ld a, c

jr_000_0f27::
    ld h, c
    ld [hl], e
    ld l, b
    ld l, c
    jr nz, jr_000_0f4d

    cp $20

jr_000_0f2f::
    ld b, a
    ld [hl], d
    ld h, c

jr_000_0f32::
    ld [hl], b
    ld l, b

jr_000_0f34::
    ld l, c
    ld h, e

jr_000_0f36::
    jr nz, @+$46

jr_000_0f38::
    ld h, l
    ld [hl], e

jr_000_0f3a::
    ld l, c
    ld h, a
    ld l, [hl]
    ld h, l
    ld [hl], d
    jr nz, jr_000_0f61

    jr nz, jr_000_0f63

    jr nz, jr_000_0f98

    ld h, c
    ld [hl], h
    ld l, a

jr_000_0f48::
    ld [hl], e
    ld l, b
    ld l, c
    jr nz, @+$48

jr_000_0f4d::
    ld [hl], l
    ld l, e
    ld [hl], l
    ld h, h
    ld h, c
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    ld c, l
    ld h, l
    ld h, a
    ld [hl], l
    ld l, l
    ld l, c
    jr nz, jr_000_0faf

    ld l, e

jr_000_0f61::
    ld h, c
    ld a, d

jr_000_0f63::
    ld h, c
    ld l, e
    ld l, c
    jr nz, jr_000_0f88

    jr nz, jr_000_0f8a

    cp $20
    ld d, b
    ld l, h

jr_000_0f6e::
    ld h, c
    ld l, [hl]
    ld l, [hl]
    ld h, l
    ld [hl], d
    jr nz, @+$22

jr_000_0f75::
    jr nz, jr_000_0f97

    jr nz, @+$22

    jr nz, jr_000_0f9b

    jr nz, jr_000_0f9d

    jr nz, jr_000_0f9f

    jr nz, jr_000_0fa1

    ld d, h
    ld h, c
    ld l, e
    ld h, l
    ld l, a
    jr nz, jr_000_0fd5

jr_000_0f88::
    ld l, a
    ld l, [hl]

jr_000_0f8a::
    ld l, l
    ld h, c
    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, @+$22

    jr nz, jr_000_0fe8

    ld l, c

jr_000_0f97::
    ld h, l

jr_000_0f98::
    jr nz, @+$48

    ld [hl], l

jr_000_0f9b::
    ld l, d
    ld l, c

jr_000_0f9d::
    ld [hl], h
    ld h, c

jr_000_0f9f::
    jr nz, jr_000_0fc1

jr_000_0fa1::
    jr nz, jr_000_0fc3

    jr nz, @+$22

    jr nz, jr_000_0fc7

    cp $fe
    cp $fe
    cp $fe
    cp $fe

jr_000_0faf::
    cp $fe
    cp $fe
    cp $fe
    cp $fe
    cp $fe
    jr nz, @+$33

    add hl, sp
    add hl, sp
    scf
    jr nz, @+$22

    ld d, e

jr_000_0fc1::
    ld b, c
    ld d, h

jr_000_0fc3::
    ld c, a
    jr nz, @+$52

    ld d, d

jr_000_0fc7::
    ld c, a
    ld c, d
    ld b, l
    ld b, e
    ld d, h
    jr nz, @+$01

jr_000_0fce::
    ldh a, [$8a]
    and a
    jr nz, jr_000_0fce

jr_000_0fd3::
    ldh a, [$8a]

jr_000_0fd5::
    bit 2, a
    jp nz, $b285

    and a
    jr z, jr_000_0fd3

    ret


    ld a, [$d043]
    ld b, a
    ld a, [$d044]
    or b
    jr z, jr_000_0fef

jr_000_0fe8::
    ld a, [$cf30]
    and $40
    jr nz, jr_000_0ff4

jr_000_0fef::
    xor a
    ld [$cf35], a
    ret


jr_000_0ff4::
    ld a, [$d042]
    xor $10
    ld [$d042], a
    ld [$cf35], a
    ret


    ld a, [$cf20]
    and a
    jr nz, jr_000_1008

    scf
    ret


jr_000_1008::
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


    ld a, [$cf03]
    ld b, a
    ld a, [$cf04]
    or b
    ret nz

    scf
    ret


    ld a, [$d0a4]
    and a
    ret nz

    ld c, $05
    ld b, $00
    ld de, $0010
    ld hl, $cf50

jr_000_1035::
    ld a, [hl]
    or b
    ld b, a
    add hl, de
    dec c
    jr nz, jr_000_1035

    ld a, b
    and a
    ret nz

    scf
    ret


    ld a, [$cf31]
    and a
    jr z, jr_000_1053

    dec a
    jr z, jr_000_1059

    dec a
    jr z, jr_000_1059

    ld a, $0b
    ld [$cf37], a
    ret


jr_000_1053::
    ld a, $01
    ld [$cf37], a
    ret


jr_000_1059::
    ld a, $0a
    ld [$cf37], a
    ret


    ld a, [$d061]
    and a
    ret z

    trap GetSoundState
    and a
    ret nz

    xor a
    ld [$d061], a
    ret


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


    ld sp, $e000
    call $a221
    call $a330
    call $b27d
    call $a267
    trap LCDDisable
    call $a2a5
    ld a, $03
    trap LCDEnable
    call $a278
    trap LCDDisable
    ld a, $03
    trap LCDEnable
    trap LCDDisable
    call $a509
    ld a, $03
    trap LCDEnable
    ld a, $09
    trap PlayMusic
    ld a, $01
    ld [$d0a6], a
    call $b8c3
    call $a660
    call $abfe
    call $ab4c
    call $a3db
    ld a, [$cf00]
    ld b, a
    ld a, $16
    add b
    call $a66c
    call $afd6
    call $a586
    xor a
    ld [$d0a4], a
    ld a, [$cf05]
    ld b, a
    ld a, [$cf06]
    cp b
    jr nz, jr_000_10f6

    xor a
    call $a66c
    ld a, $01
    call $a66c
    jr jr_000_10fb

jr_000_10f6::
    ld a, $0e
    call $a66c

jr_000_10fb::
    call $afd6
    call $a586
    ld a, $1d
    trap PlaySound

jr_000_1105::
    ldh a, [$8a]
    and $01
    jr nz, jr_000_1105

jr_000_110b::
    call $b8c3
    call $b963
    call $a660
    call $a745
    call $ba44
    ld a, [$cf31]
    call $b075
    call $a868
    call $b049
    call $afe6
    call $acd6
    call $ac7d
    call $ad0e
    call $a849
    call $abfe
    call $ab4c
    call $ac57
    trap $c3
    call $b067
    call $b27d
    call $a3db
    call $b008
    jr c, jr_000_1161

    call $b023
    jr c, jr_000_1175

    call $b02e
    jr c, jr_000_11a3

    ldh a, [$8a]
    bit 2, a
    jr z, jr_000_110b

    jp $b285


jr_000_1161::
    ld a, $19
    trap PlayMusic
    ld a, [$cf2b]
    cp $4e
    jr nz, jr_000_1179

    ld a, $03
    call $a66c
    ld a, $0d
    jr jr_000_117b

jr_000_1175::
    ld a, $05
    jr jr_000_117b

jr_000_1179::
    ld a, $02

jr_000_117b::
    call $a66c
    call $afd6
    call $a586
    ld a, [$cf05]
    dec a
    ld [$cf05], a
    jr z, jr_000_1190

    jp $b0ae


jr_000_1190::
    ld a, $04
    call $a66c
    call $afd6
    call $a586
    ld a, $02
    call $a382
    jp $b093


jr_000_11a3::
    ld a, $18
    trap PlayMusic
    ld a, $0f
    call $a66c
    call $afd6
    ld a, [$cf03]
    ld c, a
    ld a, [$cf04]
    ld b, a
    push bc
    call $b25a
    call $a586
    pop bc
    ld a, [$cf00]
    cp $06
    jr z, jr_000_1207

    ld a, c
    ld [$cf03], a
    ld a, b
    ld [$cf04], a
    ld a, $06
    call $a66c
    ld a, [$cf03]
    ld e, a
    ld a, [$cf04]
    ld d, a
    ld c, $08
    ld hl, $0309
    trap $84
    and l
    jr z, jr_000_11e9

    ld a, $0c
    jr jr_000_11f1

jr_000_11e9::
    ld hl, $00c8
    trap $8a
    ld a, $07
    add l

jr_000_11f1::
    call $a66c
    call $afd6
    ld a, [$cf05]
    ld [$cf06], a
    ld a, [$cf00]
    inc a
    ld [$cf00], a
    jp $b0ae


jr_000_1207::
    ld a, $10
    call $a66c
    call $afd6
    call $a586
    ld a, $11
    call $a66c
    call $afd6
    call $a586
    ld a, $12
    call $a66c
    call $afd6
    call $a586
    ld a, $13
    call $a66c
    call $afd6
    call $a586
    ld a, $14
    call $a66c
    call $afd6
    call $a586
    ld a, $15
    call $a66c
    call $afd6
    call $a586
    call $ad8c
    call $b27d
    jp $b093


jr_000_1252::
    call $b92c
    ld a, [$cf03]
    ld b, a
    ld a, [$cf04]
    or b
    ret z

    xor a
    trap PlaySound
    ld a, $02
    trap PlaySound
    call $b963
    call $a660
    ldh a, [$8a]
    and $02
    jr nz, jr_000_1252

    trap AwaitFrame
    jr jr_000_1252

    ld c, $01

jr_000_1277::
    trap AwaitFrame
    dec c
    jr nz, jr_000_1277

    ret


    xor a
    trap PlayMusic
    trap ExitToMenu
    call nz, $d2b2
    or d
    rst $20
    or d
    di
    or d
    rst $38
    or d
    inc c
    or e
    inc d
    or e
    dec hl
    or e
    dec a
    or e
    ld c, a
    or e
    ld e, [hl]
    or e
    ld l, l
    or e
    ld a, a
    or e
    sub d
    or e
    and h
    or e
    or l
    or e
    cp l
    or e
    adc $b3
    ldh [$b3], a
    di
    or e
    inc b
    or h
    ld [de], a
    or h
    add hl, de
    or h
    ld hl, $29b4
    or h
    ld sp, $39b4
    or h
    ld b, c
    or h
    ld c, c
    or h
    inc bc
    ld b, $3a
    ld a, $00
    jr nz, jr_000_12d5

    inc bc
    inc c
    db $10
    ld a, [hl+]
    ld [bc], a
    ld bc, $02ff
    dec bc
    scf
    ld b, c
    ld [hl], $00
    ld h, $2f
    ld d, $25
    ld [de], a

jr_000_12d5::
    jr nc, jr_000_12e4

    dec d
    inc l
    jr z, jr_000_1300

    inc de
    ld [bc], a
    ld bc, $03ff
    ld b, $3a
    ld a, $00

jr_000_12e4::
    rra
    ld hl, $1423
    inc b
    ld bc, $03ff
    ld b, $3a
    ld a, $00
    ld b, d
    inc b
    inc hl
    inc b
    ld [bc], a
    ld bc, $06ff
    dec bc
    ld de, $4723
    inc l
    inc l
    jr z, jr_000_1325

jr_000_1300::
    inc de
    ld c, e
    inc b
    rst $38
    ld [$2908], sp
    rrca
    dec h
    daa
    inc hl
    rst $38
    nop
    ld b, $3a
    ld a, $00
    dec e
    inc d
    rrca
    ld b, $32
    dec a
    ld b, c
    dec d
    ld a, [de]
    inc d
    inc d
    rrca
    inc c
    dec l
    ld [hl+], a
    ld [bc], a
    ld bc, $02ff
    dec bc

jr_000_1325::
    scf
    ld b, c
    ld [hl], $00
    jr c, jr_000_1366

    jr c, jr_000_1368

    ld e, $25
    inc l
    jr z, jr_000_1357

    inc de
    ld bc, $02ff
    dec bc
    scf
    ld b, c
    ld [hl], $00
    ld d, $28
    inc h
    rrca
    cpl
    inc d
    inc l
    jr z, jr_000_1369

    inc de
    ld bc, $02ff
    dec bc
    scf
    ld b, c
    ld [hl], $00
    inc de
    jr z, jr_000_135c

    inc l
    jr z, jr_000_1378

    inc de
    ld bc, $02ff

jr_000_1357::
    dec bc
    scf
    ld b, c
    ld [hl], $00

jr_000_135c::
    ld sp, $1333
    inc l
    jr z, jr_000_1387

    inc de
    ld bc, $02ff

jr_000_1366::
    dec bc
    scf

jr_000_1368::
    ld b, c

jr_000_1369::
    ld [hl], $00
    rla
    ld [hl+], a
    dec de
    dec hl
    ld e, $25
    inc l
    jr z, jr_000_1399

    inc de
    ld bc, $02ff

jr_000_1378::
    dec bc
    scf
    ld b, c
    ld [hl], $00
    inc e
    inc hl
    jr @+$10

    ld [de], a
    inc d
    inc l
    jr z, jr_000_13ab

    inc de

jr_000_1387::
    ld [bc], a
    ld bc, $02ff
    dec bc
    scf
    ld b, c
    ld [hl], $00
    ld b, e
    dec h
    ld b, h
    db $10
    jr @+$0e

    inc l
    jr z, jr_000_13be

jr_000_1399::
    inc de
    ld bc, $04ff
    dec bc
    ld de, $4525
    ld de, $4746
    ld c, b
    jr jr_000_13b3

    inc l
    jr z, jr_000_13cf

    inc de

jr_000_13ab::
    ld [bc], a
    rst $38
    ld [$1f08], sp
    cpl
    inc d
    add hl, de

jr_000_13b3::
    ld [bc], a
    rst $38
    ld [bc], a
    ld b, $3a
    ld a, $00
    rla
    dec c
    rla
    dec c

jr_000_13be::
    rra
    cpl
    inc d
    ld a, [hl+]
    ld [bc], a
    ld [bc], a
    ld bc, $02ff
    dec bc
    scf
    ld b, c
    ld [hl], $00
    ld hl, $1210

jr_000_13cf::
    jr nc, jr_000_13de

    inc l
    jr z, jr_000_13f9

    inc de
    add hl, de
    ld bc, $02ff
    ld b, $3a
    ld a, $00
    dec d

jr_000_13de::
    jr nc, jr_000_13ed

    ld [de], a
    ld c, h
    ld a, [de]
    ld c, l
    jr jr_000_13e9

    ld b, b
    inc sp
    ld [bc], a

jr_000_13e9::
    ld bc, $02ff
    dec bc

jr_000_13ed::
    scf
    ld b, c
    ld [hl], $00
    inc de
    ld b, a
    jr jr_000_1401

    inc l
    jr z, jr_000_141d

    inc de

jr_000_13f9::
    ld c, e
    ld bc, $04ff
    ld [$1451], sp
    ld [hl+], a

jr_000_1401::
    nop
    ld c, [hl]
    ld c, [hl]
    ld c, [hl]
    ld c, [hl]
    ld c, [hl]
    ld [bc], a
    ld bc, $08ff
    add hl, bc

jr_000_140c::
    ld c, $12
    ld b, a
    inc c
    rst $38
    ld [$3408], sp
    dec [hl]
    inc b
    ccf
    rlca
    rst $38
    ld [$3408], sp
    dec [hl]

jr_000_141d::
    inc b
    ccf
    ld [$08ff], sp
    ld [$3534], sp
    inc b
    ccf
    add hl, bc
    rst $38
    ld [$3408], sp
    dec [hl]
    inc b
    ccf
    ld a, [bc]
    rst $38
    ld [$3408], sp
    dec [hl]
    inc b
    ccf
    dec bc
    rst $38
    ld [$3408], sp
    dec [hl]
    inc b
    ccf
    ld c, a
    rst $38
    ld [$3408], sp
    dec [hl]
    inc b
    ccf
    ld d, b
    rst $38
    ld e, a
    or h
    ld a, [hl]
    or h
    sbc l
    or h
    cp h
    or h
    ldh [$b4], a
    inc b
    or l
    jr z, jr_000_140c

    ld b, $0d
    inc bc
    nop
    ld [bc], a
    ld a, [bc]
    db $10
    ld [bc], a
    ld bc, $0a00
    dec c
    inc bc
    ld [bc], a
    nop
    ld bc, $0302
    dec b
    ld bc, $0205
    ld c, $05
    ld bc, $1005
    ld c, $05
    ld bc, $0605
    dec c
    inc bc
    nop
    ld [bc], a
    ld a, [bc]
    db $10
    ld [bc], a
    ld bc, $0a00
    dec c
    inc bc
    ld [bc], a
    nop
    ld bc, $0302
    dec b
    ld bc, $0905
    add hl, bc
    ld b, $01
    dec b
    db $10
    ld c, $05
    ld bc, $0605
    dec c
    inc bc
    nop
    ld [bc], a
    ld a, [bc]
    db $10
    ld [bc], a
    ld bc, $0a00
    dec c
    inc bc
    ld [bc], a
    nop
    ld bc, $0302
    ld b, $01
    dec b
    ld [bc], a
    ld c, $07
    ld bc, $1005
    ld c, $06
    ld bc, $0705
    dec c
    inc bc
    nop
    ld [bc], a
    ld a, [bc]
    db $10
    ld [bc], a
    ld bc, $0a00
    dec c
    inc bc
    ld [bc], a
    nop
    ld bc, $0302
    rlca
    ld bc, $0205
    rlca
    rlca
    ld bc, $0205
    ld a, [bc]
    rlca
    ld bc, $0205
    ld c, $07
    ld bc, $0705
    dec c
    inc bc
    nop
    ld [bc], a
    ld a, [bc]
    db $10
    ld [bc], a
    ld bc, $0a00
    dec c
    inc bc
    ld [bc], a
    nop
    ld bc, $0606
    dec b
    ld bc, $0b05
    ld [$0105], sp
    dec b
    ld b, $0b
    dec b
    ld bc, $0b05
    dec c
    dec b
    ld bc, $0705
    dec c
    inc bc
    nop
    ld [bc], a
    ld a, [bc]
    db $10
    ld [bc], a
    ld bc, $0a00
    dec c
    inc bc
    ld [bc], a
    nop
    ld bc, $0301
    rlca
    ld bc, jr_000_1105
    rrca
    rlca
    ld bc, $0705
    inc b
    ld b, $01
    dec b
    rrca
    ld a, [bc]
    dec b
    ld bc, $0605
    dec c
    inc bc
    nop
    ld [bc], a
    ld a, [bc]
    db $10
    ld [bc], a
    ld bc, $0a00
    dec c
    inc bc
    ld [bc], a
    nop
    ld bc, $0e01
    ld [$0501], sp
    ld b, $0f
    add hl, bc
    ld [bc], a
    dec b
    inc bc
    db $10
    ld [$0502], sp
    ld [bc], a
    inc b
    ld [$0c14], sp
    ld h, h
    or l
    add h
    or l
    ret nz

    or l
    db $db
    or l
    ei
    or l
    dec de
    or [hl]
    ld e, a
    or [hl]
    and e
    or [hl]
    rst $20
    or [hl]
    dec c
    or a
    ld b, [hl]
    or a
    add d
    or a
    ld a, b
    or l
    ld [bc], a
    nop
    ld bc, $b578
    ld [bc], a
    nop
    ld bc, $b578
    ld [bc], a
    nop
    ld bc, $b578
    ld [bc], a
    nop
    ld bc, Jump_000_0202
    rrca
    cpl
    rra
    ccf
    ld [bc], a
    ld [bc], a
    ld c, a
    ld l, a
    ld e, a
    ld a, d
    sub h
    or l
    ld bc, $9f00
    or l
    ld bc, $aa00
    or l
    ld bc, $b500
    or l
    ld bc, $0300
    inc bc
    inc sp
    inc [hl]
    dec [hl]
    ld b, e
    ld b, h
    ld b, l
    ld d, e
    ld d, h
    ld d, l
    inc bc
    inc bc
    inc a
    dec a
    ld a, $3c
    ld c, l
    ld c, [hl]
    ld e, h
    ld e, l
    ld e, [hl]
    inc bc
    inc bc
    inc bc
    inc b
    dec b
    inc de
    inc d
    dec d
    inc hl
    inc h
    dec h
    inc bc
    inc bc
    inc c
    dec c
    ld c, $1c
    dec e
    ld e, $2c
    dec l
    ld l, $d0
    or l
    ld bc, $d000
    or l
    ld bc, $d000
    or l
    ld bc, $d000
    or l
    ld bc, $0300
    inc bc
    ld l, c
    ld l, d
    ld l, e
    ld a, c
    rst $38
    ld a, e
    ld l, h
    ld l, l
    ld l, [hl]
    rst $28
    or l
    ld [bc], a
    nop
    ld bc, $b5ef
    ld [bc], a
    nop
    ld bc, $b5ef
    ld [bc], a
    nop
    ld bc, $b5ef
    ld [bc], a
    nop
    ld bc, Jump_000_0202
    inc l
    dec l
    inc a
    dec a
    ld [bc], a
    ld [bc], a
    ld l, $2f
    ld a, $3f
    rrca
    or [hl]
    ld [bc], a
    nop
    ld bc, $b60f
    ld [bc], a
    nop
    ld bc, $b60f
    ld [bc], a
    nop
    ld bc, $b60f
    ld [bc], a
    nop
    ld bc, Jump_000_0202
    ld e, l
    ld a, h
    ld a, l
    ld a, [hl]
    ld [bc], a
    ld [bc], a
    ld c, a
    ld l, a
    ld e, a
    ld a, a
    cpl
    or [hl]
    ld [bc], a
    nop
    ld bc, $b63b
    ld [bc], a
    nop
    ld bc, $b647
    ld [bc], a
    nop
    ld bc, $b653
    ld [bc], a
    nop
    ld bc, Jump_000_0202
    add h
    add l
    sub h
    sub l
    ld [bc], a
    ld [bc], a
    add [hl]
    add a
    sub [hl]
    sub a
    ld [bc], a
    ld [bc], a
    adc c
    adc b
    sbc c
    sbc b
    ld [bc], a
    ld [bc], a
    adc e
    adc d
    sbc e
    sbc d
    ld [bc], a
    ld [bc], a
    add b
    add c
    sub b
    sub c
    ld [bc], a
    ld [bc], a
    add d
    add e
    sub d
    sub e
    ld [bc], a
    ld [bc], a
    adc b
    adc c
    sbc b
    sbc c
    ld [bc], a
    ld [bc], a
    adc d
    adc e
    sbc d
    sbc e
    ld [hl], e
    or [hl]
    ld [bc], a
    nop
    ld bc, $b67f
    ld [bc], a
    nop
    ld bc, $b68b
    ld [bc], a
    nop
    ld bc, $b697
    ld [bc], a
    nop
    ld bc, Jump_000_0202
    and h
    and l
    or h
    or l
    ld [bc], a
    ld [bc], a
    and [hl]
    and a
    or [hl]
    or a
    ld [bc], a
    ld [bc], a
    xor c
    xor b
    cp c
    cp b
    ld [bc], a
    ld [bc], a
    xor e
    xor d
    cp e
    cp d
    ld [bc], a
    ld [bc], a
    and b
    and c
    or b
    or c
    ld [bc], a
    ld [bc], a
    and d
    and e
    or d
    or e
    ld [bc], a
    ld [bc], a
    xor b
    xor c
    cp b
    cp c
    ld [bc], a
    ld [bc], a
    xor d
    xor e
    cp d
    cp e
    or a
    or [hl]
    ld [bc], a
    nop
    ld bc, $b6c3
    ld [bc], a
    nop
    ld bc, $b6cf
    ld [bc], a
    nop
    ld bc, $b6db
    ld [bc], a
    nop
    ld bc, Jump_000_0202
    call nz, $d4c5
    push de
    ld [bc], a
    ld [bc], a
    add $c7
    sub $d7
    ld [bc], a
    ld [bc], a
    ret


    ret z

    reti


    ret c

    ld [bc], a
    ld [bc], a
    set 1, d
    db $db
    jp c, Jump_000_0202

    ret nz

    pop bc
    ret nc

    pop de
    ld [bc], a
    ld [bc], a
    jp nz, $d2c3

    db $d3
    ld [bc], a
    ld [bc], a
    ret z

    ret


    ret c

    reti


    ld [bc], a
    ld [bc], a
    jp z, $dacb

    db $db
    ei
    or [hl]
    ld [bc], a
    nop
    ld bc, $b707
    ld [bc], a
    nop
    ld bc, $b701
    ld [bc], a
    nop
    ld bc, $b707
    ld [bc], a
    nop
    ld bc, $0101
    and $01
    ld bc, $01e7
    ld bc, $01e4
    ld bc, $01e5
    ld bc, jr_000_01e3
    ld bc, $25e8
    or a
    inc bc
    nop
    ld bc, $2502
    or a
    inc bc
    nop
    ld bc, $2502
    or a
    inc bc
    nop
    ld bc, $2502
    or a
    inc bc
    nop
    ld bc, $0302
    inc bc
    adc h
    adc l
    adc [hl]
    sbc h
    sbc l
    sbc [hl]
    adc a
    xor h
    xor l
    inc bc
    inc bc
    sbc a
    cp h
    cp l
    xor [hl]
    xor a
    call z, $bfbe
    call c, Call_000_0303
    call $cfce
    db $dd
    sbc $df
    ldh [$e1], a
    ld [c], a
    ld d, [hl]
    or a
    ld bc, $6100
    or a
    ld bc, $6c00
    or a
    ld bc, $7700
    or a
    ld bc, $0300
    inc bc
    jr nc, jr_000_1783

    ld [hl-], a
    ld b, b
    ld b, c
    ld b, d
    ld d, b
    ld d, c
    ld d, d
    inc bc
    inc bc
    add hl, sp
    ld a, [hl-]
    dec sp
    ld c, c
    ld c, d
    ld c, e
    ld e, c
    ld e, d
    ld e, e
    inc bc
    inc bc
    nop
    ld bc, $1002
    ld de, $2012
    ld hl, $0322
    inc bc
    add hl, bc
    ld a, [bc]
    dec bc
    add hl, de
    ld a, [de]
    dec de
    add hl, hl
    ld a, [hl+]
    dec hl
    sub d
    or a
    ld bc, $9d00
    or a
    ld bc, $a800

jr_000_1783::
    or a
    ld bc, $b300
    or a
    ld bc, $0300
    inc bc
    ld [hl], $37
    jr c, jr_000_17d6

    ld b, a
    ld c, b
    ld d, [hl]
    ld d, a
    ld e, b
    inc bc
    inc bc
    ld [hl], e
    ld [hl], h
    ld [hl], l
    ld h, [hl]
    ld h, a
    ld l, b
    db $76
    ld [hl], a
    ld a, b
    inc bc
    inc bc
    ld b, $07
    ld [$1716], sp
    jr jr_000_17cf

    daa
    jr z, jr_000_17af

    inc bc
    ld h, b
    ld h, c

jr_000_17af::
    ld h, d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld h, e
    ld h, h
    ld h, l
    dec de
    dec e
    ld hl, $2d2c
    ld l, $3f
    ld sp, $3332
    inc [hl]
    dec [hl]
    ld h, d
    ld h, e
    ld h, l
    ld h, [hl]
    ld l, b
    ld l, d
    ld l, h
    ld l, l
    ld [hl], b
    ld [hl], c
    ld [hl], e
    ld [hl], h
    ld [hl], l

jr_000_17cf::
    ld a, b
    ld a, c
    ld a, d
    ld a, [hl]
    add b
    add e
    add h

jr_000_17d6::
    add [hl]
    add a
    adc b
    adc d
    adc h
    adc l
    adc [hl]
    adc a
    sub d
    sub h
    sub [hl]
    sbc b
    sbc e
    sbc a
    xor d
    xor a
    xor [hl]
    or d
    or l
    or [hl]
    cp l
    jp $c8c4


    set 1, l
    trap $d4
    pushx @+$e0da
    db $e4
    db $ed
    rst $38
    ld h, c
    add d
    and c
    sbc h
    ld l, a
    ld a, a
    ld l, c
    add sp, -$2e
    xor c
    db $76
    adc c
    jp z, $3736

    ld a, h
    ld e, $b8
    ld hl, $26b8
    cp b
    dec l
    cp b
    ld [hl], $b8
    ld c, a
    cp b
    ld d, [hl]
    cp b
    ld bc, $0809
    ld [bc], a
    add hl, bc
    inc b
    add hl, bc
    dec c
    inc bc
    dec bc
    ld b, $09
    ld [$0a07], sp
    inc b
    dec b
    dec b
    dec c
    dec b
    dec b
    inc c
    dec c
    inc c
    inc c
    inc b
    ld b, $0e
    ld b, $04
    ld [$080d], sp
    inc b
    dec bc
    dec c
    dec bc
    inc b
    dec c
    dec c
    dec c
    inc b
    db $10
    dec c
    db $10
    ld de, $0106
    inc b
    inc bc
    rlca
    ld [$0a09], sp
    dec bc
    ld [$0904], sp
    inc b
    inc bc
    ld [$0d09], sp
    rrca
    add hl, bc
    db $10
    dec b
    ld b, $06
    ld b, $10
    nop
    ld bc, $0602
    ld b, $06
    ld b, $06
    db $10
    db $10
    inc bc
    inc b
    ld b, $10
    nop
    nop
    nop
    nop
    nop
    ld b, b
    nop
    inc b
    nop
    nop
    nop
    nop
    nop
    stop
    nop
    inc bc
    inc bc
    inc b
    ld b, l
    add hl, de
    add hl, de
    jr nz, jr_000_18a4

    ld d, c
    ld l, a
    ld c, a
    ld a, d
    ld b, d
    ld a, l
    ld a, b
    ld e, a
    add b
    add b
    ld e, b
    ret c

    inc h
    ld h, h
    ld [hl], h
    call nc, $92fe
    push af
    dec e
    rst $18
    ld sp, $8bfd
    ld h, [hl]
    ld h, l
    ld c, a
    ld c, d
    ld a, d
    ld d, a
    rst $18
    xor b
    xor a

jr_000_18a4::
    ld a, [$71cf]
    ld a, a
    cp [hl]
    rra
    ld h, b
    rst $20
    add l
    ld e, a
    push de
    rst $38
    dec d
    ld a, a
    add $ff

jr_000_18b4::
    jr jr_000_18b4

    pop hl
    ld hl, sp+$06
    add b
    ld a, b
    ld a, [$cf1b]
    and a
    ret z

    ld a, [$cf03]
    ld l, a
    ld a, [$cf04]
    ld h, a
    ld a, [$d0a6]
    call $b94d
    push hl
    ld c, $64
    call $b905
    ld d, $02
    call $b91b
    ld c, $0a
    call $b905
    ld d, $03
    call $b91b
    ld b, l
    ld d, $04
    call $b91b
    pop hl
    ld a, l
    ld [$cf03], a
    ld a, h
    ld [$cf04], a
    ld a, [$cf05]
    dec a
    ld b, a
    ld d, $12
    call $b91b
    ret


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
    call $b8c8
    ret


    ld e, a
    ld a, l
    sub e
    ld l, a
    ld a, h
    sbc $00
    ld h, a
    ret


    ld a, [$d0a4]
    inc a
    ld [$d0a4], a
    ld a, $0a
    ld [$d0a6], a
    ret


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
    call $b9a3
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


    ld a, [$cf01]
    add $01
    ld [$cf01], a
    ld a, [$cf02]
    adc $00
    ld [$cf02], a
    ld a, [$d0a4]
    dec a
    ld [$d0a4], a
    call $b9df
    ret


    ld a, [$cf02]
    ld h, a
    ld a, [$cf01]
    ld l, a
    ld d, $09
    ld c, $64
    call $b905
    call $b91b
    ld d, $0a
    ld c, $0a
    call $b905
    call $b91b
    ld d, $0b
    ld b, l
    call $b91b
    ret


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


    ld a, [$cf30]
    and $80
    jr z, jr_000_1a8a

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
    call $bbeb
    ld a, $01
    call $ba24
    ld a, [$d094]
    ld b, a
    ld a, [$d096]
    cp $00
    jr nz, jr_000_1a8a

    ld a, $01
    ld [$cf36], a
    ld [$cf31], a

jr_000_1a8a::
    ld a, [$cf30]
    and $40
    ret z

    ld a, [$cf36]
    dec a
    ld [$cf36], a
    cp $00
    jr nz, jr_000_1ab4

    ld a, $0e
    ld [$cf36], a
    ld a, [$cf31]
    dec a
    ld [$cf31], a
    cp $00
    jr nz, jr_000_1ab4

    ld a, [$cf30]
    and $bf
    ld [$cf30], a
    ret


jr_000_1ab4::
    ld a, [$cf31]
    ld [$d091], a
    ld a, $01
    call $ba02
    call $bcb2
    ld a, $01
    ld [$d04d], a
    ld a, [$d092]
    ld b, a
    ld a, [$d093]
    ld c, a
    call $a69b
    jr c, jr_000_1ae2

    ld a, [$d092]
    ld [$cf2c], a
    ld a, [$d093]
    ld [$cf2d], a
    jr jr_000_1af3

jr_000_1ae2::
    xor a
    ld [$cf31], a
    ld [$cf36], a
    ld a, [$cf30]
    and $bf
    and $7f
    ld [$cf30], a

jr_000_1af3::
    ld a, $01
    call $ba24
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
    jr z, jr_000_1af3

    cpl
    and $80
    rlca
    rlca
    ld [hl], a
    ret


    ld a, [$d09c]
    and a
    ret z

    and $80
    rlca
    rlca
    inc a
    ld [hl], a
    ret


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


    ld a, [$d08f]
    ld e, a
    ld d, $00
    ld a, [$d08d]
    ld [$d092], a
    ld l, a
    ld h, $00
    trap $88
    ld a, l
    ld [$d094], a
    ld a, h
    ld [$d095], a
    ld a, l
    or h
    jr z, jr_000_1c04

    ld a, h
    sla a
    inc a

jr_000_1c04::
    ld [$d09c], a
    rlc h
    jr c, jr_000_1c0f

    rrc h
    jr jr_000_1c1a

jr_000_1c0f::
    rrc h
    ld a, $ff
    xor h
    ld h, a
    ld a, $ff
    xor l
    ld l, a
    inc hl

jr_000_1c1a::
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
    trap $88
    ld a, l
    ld [$d096], a
    ld a, h
    ld [$d097], a
    ld a, l
    or h
    jr z, jr_000_1c43

    ld a, h
    sla a
    inc a

jr_000_1c43::
    ld [$d09d], a
    rlc h
    jr c, jr_000_1c4e

    rrc h
    jr jr_000_1c59

jr_000_1c4e::
    rrc h
    ld a, $ff
    xor h
    ld h, a
    ld a, $ff
    xor l
    ld l, a
    inc hl

jr_000_1c59::
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
    jr nz, jr_000_1c92

    ld a, $00
    ld [$d0a0], a
    ld a, [$d098]
    ld l, a
    ld a, [$d099]
    ld h, a
    trap $8b
    ld a, l
    ld [$d09e], a
    ld a, h
    ld [$d09f], a
    ret


jr_000_1c92::
    ld a, $01
    ld [$d0a0], a
    ld a, [$d09a]
    ld l, a
    ld a, [$d09b]
    ld h, a
    trap $8b
    ld a, l
    ld [$d09e], a
    ld a, h
    ld [$d09f], a
    ret


    ld a, [$d091]
    ld c, a
    ld b, $00
    ld a, [$d0a0]
    cp $00
    jr nz, jr_000_1d21

jr_000_1cb7::
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
    trap $87
    ld a, l
    ld [$d09e], a
    ld a, h
    ld [$d09f], a
    ld d, $00
    ld e, $00
    ld c, $06
    trap $84
    ld a, l
    jr nz, jr_000_1d1d

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
    trap $88
    ld a, l
    ld [$d09e], a
    ld a, h
    ld [$d09f], a

jr_000_1d1d::
    pop bc
    dec c
    jr jr_000_1cb7

jr_000_1d21::
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
    trap $87
    ld a, l
    ld [$d09e], a
    ld a, h
    ld [$d09f], a
    ld d, $00
    ld e, $00
    ld c, $06
    trap $84
    ld a, l
    jr nz, jr_000_1d87

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
    trap $88
    ld a, l
    ld [$d09e], a
    ld a, h
    ld [$d09f], a

jr_000_1d87::
    pop bc
    dec c
    jr jr_000_1d21
