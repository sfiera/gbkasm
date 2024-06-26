; Disassembly of "slot.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db kFileHasIcon2bpp + kFileMarkerCircle + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db .end - @ - 1            ; length of variable parts of header
    db $6c                     ; owner code
.title
    dk "SLOT"
.icon
    INCBIN "gfx/slot/icon.2bpp"
.end

History:
.points
    dw 100
.author
    db "Y.MOTOSAKO", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    callx @+$03c7
    callx @+$0645
    callx @+$0440
    trap AwaitFrame
    ldh a, [$c6]
    ld l, a
    ld h, $00
    trap $06
    inc b
    ld a, [bc]
    nop
    dec [hl]
    nop
    ld h, [hl]
    nop
    xor [hl]
    nop
    adc $00
    ld de, $0000
    ld c, $00
    callx @+$02fa
    ldh a, [$c9]
    or a
    jr z, jr_000_014e

    dec a
    ldh [$c9], a
    jr nz, jr_000_014e

    xor a
    ldh [$c3], a
    ld de, $0000
    ld c, $00

HeaderManufacturerCode::
    callx @+$02f9
    ld hl, $ffc6
    inc [hl]
    ld a, $5a
    ldh [$cb], a

jr_000_014e::
    ld de, $0001
    ld c, $10
    callx @+$02cd
    ldh a, [$c6]
    cp $01
    jr nz, jr_000_0181

    ldh a, [$c9]
    or a
    jr z, jr_000_0181

    dec a
    ldh [$c9], a
    jr nz, jr_000_0181

    xor a
    ldh [$c4], a
    ld de, $0001
    ld c, $10
    callx @+$02c6
    ld hl, $ffc6
    inc [hl]
    ld a, $b4
    ldh [$cb], a

jr_000_0181::
    ldh a, [$c6]
    cp $02
    jr nz, jr_000_01bb

    ldh a, [$c9]
    or a
    jr z, jr_000_01bb

    dec a
    ldh [$c9], a
    jr z, jr_000_01a6

    ld de, $0002
    ld c, $20
    callx @+$028a
    ldh a, [$ca]
    inc a
    ldh [$ca], a
    trap $dc
    jr jr_000_01ed

jr_000_01a6::
    xor a
    ldh [$c5], a
    ld de, $0002
    ld c, $20
    callx @+$028a
    ld hl, $ffc6
    inc [hl]
    jr jr_000_01ed

jr_000_01bb::
    ld de, $0002
    ld c, $20
    callx @+$0260
    trap RandNext
    jr jr_000_01ed

    callx @+$03d5
    ld hl, $c760
    xor a
    ld [hl+], a
    ld [hl], a
    callx @+$016d
    ld a, $ff
    ldh [$c6], a
    xor a
    ldh [$cb], a
    callx @+$0121

jr_000_01ed::
    ld c, $00
    ldh a, [$c9]
    or a
    jr nz, jr_000_01f7

    trap $d8
    ld c, a

jr_000_01f7::
    ld a, $06
    and c
    jr z, jr_000_01fe

    trap ExitToMenu

jr_000_01fe:
    ldh a, [$c6]
    cp $ff
    jr nz, Jump_000_023e

    ld a, $c0
    and c
    jr z, Jump_000_023e

    ld hl, $c760
    ld a, [hl]
    cp $03
    jr nc, Jump_000_023e

    inc a
    ld b, a
    ldh a, [$c7]

jr_000_0215::
    rrca
    jr c, jr_000_021c

    rl b
    jr jr_000_0215

jr_000_021c::
    ldx hl, data_07c1
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, h
    or a
    jr nz, jr_000_022b

    ld a, l
    cp b
    jr c, Jump_000_023e

jr_000_022b::
    ld a, $20
    trap PlaySound
    ld hl, $c760
    inc [hl]
    callx @+$0112
    jx @+$fed2


Jump_000_023e::
    ldh a, [$c6]
    cp $ff
    jr nz, jr_000_027d

    ld a, $10
    and c
    jr z, jr_000_027d

    ldh a, [$c7]
    cp $40
    jr nc, jr_000_027d

    add a
    ld b, a
    ld a, [$c760]

jr_000_0254::
    rr b
    jr c, jr_000_025c

    rl a
    jr jr_000_0254

jr_000_025c::
    ld b, a
    ldx hl, data_07c1
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, h
    or a
    jr nz, jr_000_026c

    ld a, l
    cp b
    jr c, jr_000_027d

jr_000_026c::
    ld hl, $ffc7
    ld a, [hl]
    add a
    ld [hl], a
    callx @+$00d3
    jx @+$fe93


jr_000_027d::
    ldh a, [$c6]
    cp $ff
    jr nz, jr_000_029d

    ld a, $20
    and c
    jr z, jr_000_029d

    ldh a, [$c7]
    cp $02
    jr c, jr_000_029d

    rr a
    ldh [$c7], a
    callx @+$00b3
    jx @+$fe73


jr_000_029d::
    ldh a, [$cb]
    or a
    jr z, jr_000_02a9

    dec a
    ldh [$cb], a
    jr nz, jr_000_02a9

    ld c, $01

jr_000_02a9::
    ld a, $01
    and c
    jr z, jr_000_0301

    ldh a, [$c6]
    ld bc, $0305
    cp $02
    jr z, jr_000_02f0

    ld bc, $0302
    cp $03
    jr c, jr_000_02f0

    jr z, jr_000_0301

    xor a
    ldh [$c9], a
    ld a, [$c760]
    or a
    jr z, jr_000_0301

    xor a
    ldh [$c6], a
    ld a, $3c
    ldh [$cb], a
    ld a, [$c760]
    ld e, a
    cpl
    inc a
    ld c, a
    ld b, $ff
    ldh a, [$c7]

jr_000_02db::
    rrca
    jr c, jr_000_02e2

    rl e
    jr jr_000_02db

jr_000_02e2::
    ld a, e
    cpl
    inc a
    ld e, a
    ld d, b
    callx @+$00ed
    jr jr_000_0301

jr_000_02f0::
    trap RandNext
    and b
    add c
    ldh [$c9], a
    ld a, $01
    ldh [$ca], a
    callx @+$000d

jr_000_0301::
    jx @+$fe0b


data_0305:
    dk "  \n"
data_0308:
    dk "<>\n"


call_030b:
    ldh a, [$c6]
    cp $03
    jr c, jr_000_0332

    ld h, $05
    callx @+$000e
    ld h, $09
    callx @+$0005
    ld h, $0d
    ldx de, data_0305

jr_000_0329::
    ld l, $0d
    trap MoveCursor
    ld l, e
    ld h, d
    trap DrawString
    ret


jr_000_0332::
    push af
    ld a, $07
    trap PlaySound
    pop af
    add a
    add a
    add $05
    ld h, a
    ldx de, data_0308
    jr jr_000_0329


data_0343:
    dk "   \n"
data_0347:
    dk "x\n"


call_0349:
    ld a, [$c760]
    or a
    jr z, jr_000_035b

    cpl
    inc a
    ld c, a
    ld b, $ff
    callx @+$00a8

jr_000_035b::
    ld hl, $1110
    trap MoveCursor
    ldx hl, data_0343
    ldh a, [$c7]
    cp $01
    jr z, jr_000_037b

    ld e, a
    ld d, $00
    ld hl, $c400
    trap IntToString
    ldx hl, data_0347
    trap DrawString
    ld hl, $c404

jr_000_037b::
    trap DrawString
    ld a, [$c760]
    ld h, $4f
    ld de, $4f4f
    ld bc, $4f4f
    cp $03
    jr z, jr_000_039c

    ld bc, $2020
    cp $02
    jr z, jr_000_039c

    ld de, $2020
    cp $01
    jr z, jr_000_039c

    ld h, $20

jr_000_039c::
    ld l, $07
    callx @+$0024
    ld h, d
    ld l, $04
    callx @+$001a
    ld h, e
    ld l, $0a
    callx @+$0010
    ld h, b
    ld l, $01
    callx @+$0006
    ld h, c
    ld l, $0d
    push hl
    ld h, $02
    trap MoveCursor
    pop hl
    ld a, h
    push hl
    trap DrawChar
    ld h, $11
    trap MoveCursor
    pop af
    trap DrawChar
    ret


    push bc
    ldx hl, data_07c1
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, c
    add e
    ld e, a
    ld a, b
    adc d
    ld d, a
    push hl
    ld hl, $8ad0
    add hl, de
    pop hl
    jr nc, jr_000_03f1

    ld de, $7530

jr_000_03f1::
    ld a, $0a
    ld [$0000], a
    ld [hl], d
    dec hl
    ld [hl], e
    xor a
    ld [$0000], a
    pop bc
    jr jr_000_0407

    ldx hl, data_07c1
    ld e, [hl]
    inc hl
    ld d, [hl]

jr_000_0407::
    push bc
    push de
    ld hl, data_0b0f
    pop de
    callx @+$0007
    ld hl, $0b10
    pop de
    trap MoveCursor
    ld hl, $c400
    push hl
    trap IntToString
    pop hl
    trap DrawString
    ret


    ld hl, $ffc3
    add hl, de
    ld a, [hl]
    dec [hl]
    or a
    jr nz, jr_000_043c

    ld [hl], $02
    ld hl, $ffc0
    add hl, de
    ld a, [hl]
    dec [hl]
    cp c
    jr nz, jr_000_043c

    ld a, $0f
    add c
    ld [hl], a

jr_000_043c::
    ld hl, $ffc0
    add hl, de
    ld b, [hl]
    push bc
    ld hl, $ffc3
    add hl, de
    ld c, [hl]
    ld b, $00
    ld a, e
    add a
    add a
    ld e, a
    ld hl, $9864
    add hl, de
    pop de
    callx @+$002d
    ld a, $03

jr_000_045b::
    push af
    ld a, d
    inc a
    and $0f
    add e
    ld d, a
    ld c, $00
    callx @+$001b
    pop af
    dec a
    jr nz, jr_000_045b

    ret


    ld l, c
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, b
    ld b, $00
    add hl, bc
    ld bc, $9800
    add hl, bc
    ld bc, $0000
    push de
    push hl
    ld e, d
    ld d, $00
    ldx hl, data_0b0d
    add hl, de
    ld e, [hl]
    ld h, d
    ld l, e
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    ld a, c
    add a
    add a
    ld e, a
    add hl, de
    ld de, $c700
    add hl, de
    ld d, h
    ld e, l
    pop hl

jr_000_04a0::
    ld a, c
    cp $03
    jr nc, jr_000_04c1

    ld a, b
    cp $09
    jr nc, jr_000_04c1

    push bc
    push hl
    push de
    ld bc, $0004
    trap MemCopy
    pop de
    inc de
    inc de
    inc de
    inc de
    pop hl
    ld bc, $0020
    add hl, bc
    pop bc
    inc b
    inc c
    jr jr_000_04a0

jr_000_04c1::
    pop de
    ret


    ld hl, $c600
    ld de, $c400
    ld bc, $0100
    trap MemCopy
    ld a, $20
    trap DrawInit
    ldx de, data_07c3
    ld bc, $c400
    trap InitDecompress
    ld de, $8800
    ld bc, $0480
    trap RunDecompress
    ld hl, $8c80
    ld de, $c300
    ld b, $06
    trap $1b
    ld hl, $0400
    trap $ca
    ld a, $01
    trap LCDEnable
    ld de, $0000
    ld b, $00

jr_000_04fb::
    trap RandNext
    and $0f
    add b
    ld hl, $ffc0
    add hl, de
    ld [hl], a
    ld hl, $ffc3
    add hl, de
    ld [hl], $00
    inc e
    ld a, b
    add $10
    ld b, a
    ld a, e
    cp $03
    jr c, jr_000_04fb

    ld d, $00

jr_000_0517::
    ld e, $00

jr_000_0519::
    ld c, $00

jr_000_051b::
    ld a, d
    add a
    add d
    add a
    add a
    ld b, a
    ld a, c
    add a
    add a
    add e
    add b
    ld hl, $c700
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ld a, e
    add a
    add e
    add c
    add $80
    add b
    ld [hl], a
    inc c
    ld a, c
    cp $03
    jr c, jr_000_051b

    inc e
    ld a, e
    cp $04
    jr c, jr_000_0519

    inc d
    ld a, d
    cp $08
    jr c, jr_000_0517

    ret


    ld hl, $c760
    xor a
    ld [hl+], a
    ld [hl], a
    ld a, $01
    ldh [$c7], a
    ld a, $ff
    ldh [$c6], a
    xor a
    ldh [$c9], a
    ldh [$cb], a
    ldx hl, data_0bc3
    trap DrawString
    ld de, $0302
    ld bc, $0e0b
    trap $58
    ld de, $0000
    ld c, $00
    callx @+$fec8
    ld de, $0001
    ld c, $10
    callx @+$febc
    ld de, $0002
    ld c, $20
    callx @+$feb0
    callx @+$fd78
    ld bc, $0000
    callx @+$fe63
    jx @+$fda8


    ld hl, $c762
    xor a
    ld [hl+], a
    ld [hl], a
    ld a, [$c760]
    ld l, a
    ld h, $00
    trap $06
    inc b
    ld d, l
    nop
    ld b, h
    nop
    inc h
    nop
    inc b
    nop
    ld c, l
    nop
    ld a, $02
    ld bc, $0100
    ld de, $0d01
    callx @+$0108
    ld a, $00
    ld bc, $0102
    ld de, $010d
    callx @+$00f9
    ld a, $00
    ld bc, $0000
    ld de, $0404
    callx @+$00ea
    ld a, $02
    ld bc, $0202
    ld de, $0a0a
    callx @+$00db
    ld a, $01
    ld bc, $0101
    ld de, $0707
    callx @+$00cc
    ld hl, $c762
    ld a, [hl+]
    or [hl]
    jr nz, jr_000_065d

    ld a, $2f
    trap PlaySound
    ld bc, $0000
    callx @+$fde6
    ldx hl, data_07c1
    ld a, [hl+]
    or [hl]
    ret nz

    ld hl, $c600
    trap $ef
    ld a, $78
    trap $dc
    xor a
    trap DrawInit
    ld hl, $0307
    trap MoveCursor
    ldx hl, data_06a6
    trap DrawString
    ld hl, $0109
    trap MoveCursor
    ldx hl, data_06b8
    trap DrawString

jr_000_0646::
    trap AwaitFrame
    ldh a, [$8a]
    or a
    jr nz, jr_000_0646

    trap $db
    ld a, $f0
    trap $dc
    ld a, $f0
    trap $dc
    ld a, $f0
    trap $dc
    trap ExitToMenu

jr_000_065d::
    ld hl, $c762
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld bc, $0000

jr_000_0666::
    inc bc
    dec de
    push bc
    push de
    ld a, $24
    trap PlaySound
    ldx hl, data_07c1
    ld e, [hl]
    inc hl
    ld d, [hl]
    callx @+$fd8e
    ld a, $05
    trap $dc
    pop de
    pop bc
    ld a, d
    or e
    jr nz, jr_000_0666

    xor a
    trap PlaySound
    ld a, $3c
    trap $dc
    ld hl, $c762
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ldh a, [$c7]
    ld l, a
    ld h, $00
    trap $89
    ld e, l
    ld d, h
    pop bc
    callx @+$fd36
    ret


data_06a6:
    dk "おかねがなくなりましたので»\n"
data_06b8:
    dk "このプログラムはさくじょされました»\n"


call_06d1:
    push de
    ldx de, data_0b0d
    ld hl, $ffc0
    add [hl]
    and $0f
    add $00
    ld l, a
    ld h, $00
    add hl, de
    ld a, [hl]
    push af
    ld a, b
    ld hl, $ffc1
    add [hl]
    and $0f
    add $10
    ld l, a
    ld h, $00
    add hl, de
    ld b, [hl]
    ld a, c
    ld hl, $ffc2
    add [hl]
    and $0f
    add $20
    ld l, a
    ld h, $00
    add hl, de
    ld c, [hl]
    pop af
    pop de
    cp b
    jr nz, jr_000_0708

    cp c
    jr z, jr_000_0713

jr_000_0708::
    cp $05
    ret nz

    ld c, $07
    ld a, b
    cp $05
    jr nz, jr_000_0713

    dec c

jr_000_0713::
    push de
    ld b, $00
    ldx hl, data_0b05
    add hl, bc
    ld a, [hl]
    ldh [$c8], a
    ld hl, $c762
    ld c, [hl]
    inc hl
    ld b, [hl]
    add c
    ld c, a
    ld a, $00
    adc b
    ld b, a
    ld [hl], b
    dec hl
    ld [hl], c
    callx @+$fccf
    pop de
    ld h, $02
    ld l, d
    trap MoveCursor
    ld a, $cc
    trap DrawChar
    ld h, $11
    ld l, e
    trap MoveCursor
    ld a, $cc
    trap DrawChar
    ret


    trap LCDDisable
    ldx hl, data_0b43
    trap DrawString
    ld bc, $0302
    ld d, $30
    callx @+$fd17
    ld bc, $0d02
    ld d, $31
    callx @+$fd0b
    ld bc, $0305
    ld d, $32
    callx @+$fcff
    ld bc, $0d05
    ld d, $33
    callx @+$fcf3
    ld bc, $0308
    ld d, $34
    callx @+$fce7
    ld bc, $0d08
    ld d, $35
    callx @+$fcdb
    ld bc, $030b
    ld d, $35
    callx @+$fccf
    ld bc, $0d0b
    ld d, $35
    callx @+$fcc3
    ld a, $01
    trap LCDEnable

jr_000_07b4::
    trap AwaitFrame
    trap $d8
    bit 0, a
    ret nz

    and $06
    jr z, jr_000_07b4

    trap ExitToMenu


data_07c1:
    dw 100


data_07c3:
    db $7f, $ee, $04, $7f, $7f, $40, $40, $5f, $40, $50, $b4, $4f, $f7
    db $51, $4e, $f5, $00, $5f, $f5, $05, $90, $f5, $47, $40, $44, $43, $11, $47, $11
    db $00, $40, $31, $f1, $ed, $21, $ff, $ff, $1f, $23, $21, $28, $fc, $ff, $03, $fc
    db $7b, $cc, $c3, $98, $87, $30, $ff, $0f, $20, $1f, $60, $1f, $40, $3f, $c0, $e0
    db $3f, $80, $7f, $3f, $02, $20, $21, $31, $22, $1f, $c4, $66, $27, $01, $fe, $63
    db $00, $2e, $03, $fd, $69, $5c, $bf, $fc, $43, $fe, $fe, $02, $02, $fa, $0a, $df
    db $1a, $ea, $87, $21, $3a, $ca, $7a, $9a, $f2, $fc, $32, $e2, $62, $c2, $c2, $82
    db $97, $83, $02, $7b, $9b, $e2, $22, $62, $a2, $a1, $00, $e2, $e2, $07, $83, $81
    db $06, $ed, $1a, $11, $19, $5f, $60, $50, $f7, $60, $4b, $73, $4a, $c0, $12, $4b
    db $70, $48, $ba, $70, $bf, $5a, $63, $53, $bc, $13, $4f, $b6, $3f, $19, $a4, $20
    db $83, $7c, $06, $38, $8d, $11, $fd, $5a, $93, $da, $13, $aa, $33, $c5, $01, $88
    db $df, $30, $4b, $f2, $9a, $13, $2a, $33, $c6, $1f, $21, $67, $4c, $50, $40, $8f
    db $70, $08, $30, $8b, $9f, $13, $f1, $f1, $01, $5b, $90, $d8, $10, $1a, $c8, $13
    db $da, $22, $21, $2b, $36, $04, $81, $21, $aa, $7f, $a9, $10, $c2, $3e, $02, $1e
    db $e2, $ce, $2a, $ff, $ce, $6a, $8e, $d2, $1e, $22, $3e, $82, $ef, $1e, $52, $9e
    db $5b, $42, $8e, $4a, $8e, $9f, $3a, $46, $3a, $a9, $48, $47, $44, $53, $52, $ff
    db $49, $59, $44, $5c, $42, $5f, $41, $5e, $2a, $7e, $00, $7e, $43, $85, $11, $41
    db $7f, $41, $7d, $00, $07, $7b, $79, $00, $77, $75, $0c, $d9, $03, $ff, $0c, $ff
    db $fc, $30, $f0, $cc, $cc, $73, $03, $fc, $ff, $70, $9e, $fc, $3f, $e3, $7e, $c1
    db $ef, $ff, $80, $cf, $80, $fe, $81, $dc, $63, $40, $f3, $ff, $33, $ff, $0f, $12
    db $0b, $08, $fb, $ff, $e7, $06, $06, $01, $d9, $02, $0d, $00, $c0, $80, $ff, $60
    db $40, $b0, $20, $dd, $90, $6f, $c8, $ff, $77, $e4, $5b, $f2, $5b, $f1, $8f, $f9
    db $fb, $0e, $fb, $3e, $f3, $fc, $38, $b0, $d2, $e2, $ff, $62, $2a, $ea, $32, $da
    db $e2, $fa, $42, $69, $0d, $7a, $22, $11, $00, $fa, $14, $0e, $10, $fa, $bf, $82
    db $1b, $3a, $42, $9a, $22, $4a, $92, $f3, $22, $ca, $12, $e2, $69, $80, $72, $61
    db $5e, $ff, $67, $58, $6f, $50, $6e, $50, $7c, $40, $fc, $7d, $41, $79, $41, $7b
    db $42, $43, $60, $41, $41, $3f, $01, $6c, $3a, $37, $00, $35, $72, $06, $9b, $fc
    db $ff, $00, $f9, $01, $c3, $03, $1e, $1d, $7f, $ff, $60, $e3, $80, $c3, $00, $87
    db $00, $8f, $cf, $00, $9f, $c7, $14, $77, $f7, $08, $be, $c1, $fe, $67, $78, $18
    db $1f, $c7, $07, $f0, $ca, $70, $bf, $03, $64, $f8, $1c, $e4, $ee, $92, $73, $d9
    db $cd, $fd, $c3, $12, $fe, $01, $c6, $a1, $00, $ef, $ef, $10, $7a, $85, $a1, $d8
    db $27, $f1, $0f, $fe, $86, $7e, $18, $f8, $e3, $e0, $0f, $fa, $70, $7e, $02, $86
    db $7a, $e6, $1a, $76, $0a, $c9, $06, $ff, $3e, $02, $be, $82, $9e, $82, $5e, $c2
    db $10, $d3, $d1, $00, $cf, $36, $ca, $10, $c7, $c5, $00, $02, $65, $2b, $60, $40
    db $4c, $f3, $59, $10, $40, $f3, $41, $ff, $4d, $42, $42, $44, $44, $48, $48, $58
    db $ff, $50, $5c, $50, $4f, $48, $47, $4c, $42, $f0, $4f, $73, $4d, $73, $f4, $11
    db $f3, $17, $16, $5b, $7e, $ed, $22, $07, $07, $3f, $38, $c0, $c0, $ed, $75, $2d
    db $43, $01, $00, $1f, $76, $3f, $2b, $00, $ff, $d9, $38, $3f, $27, $3c, $c0, $47
    db $06, $8b, $00, $7f, $2c, $00, $c0, $f0, $e0, $fc, $1c, $7f, $03, $35, $39, $b9
    db $00, $05, $02, $b9, $3f, $a6, $10, $fb, $bf, $04, $8c, $74, $8b, $e0, $1f, $03
    db $ff, $e6, $1c, $fc, $e0, $b8, $18, $b9, $02, $0e, $83, $00, $1f, $cd, $cd, $00
    db $83, $82, $8e, $c2, $42, $e2, $ff, $22, $52, $b2, $ea, $1a, $ca, $3a, $92, $ff
    db $72, $22, $ee, $42, $ce, $b2, $8e, $32, $26, $84, $11, $83, $c2, $a7, $06, $eb
    db $7c, $40, $b3, $41, $fb, $43, $43, $47, $44, $4c, $04, $79, $50, $bf, $7f, $c4
    db $30, $57, $58, $4b, $4c, $44, $47, $19, $bb, $b3, $66, $1b, $3c, $00, $e3, $00
    db $44, $38, $ff, $1f, $f3, $ff, $cf, $3c, $f7, $0c, $fb, $fb, $07, $fa, $07, $f2
    db $0f, $f5, $00, $e2, $1f, $de, $c2, $3f, $6a, $08, $ff, $f9, $fe, $fc, $00, $f1
    db $3e, $03, $3d, $01, $e3, $4b, $60, $e3, $fc, $f7, $f0, $0f, $ff, $f0, $ec, $00
    db $0f, $db, $1e, $ef, $e7, $3f, $fb, $f3, $fe, $c3, $3f, $71, $e7, $8f, $79, $87
    db $29, $00, $27, $f1, $0f, $e1, $fe, $1f, $82, $7e, $04, $fc, $fc, $f8, $09, $60
    db $1f, $81, $87, $20, $87, $fe, $c2, $e2, $a2, $f2, $ff, $d2, $fa, $6a, $fa, $5a
    db $fe, $aa, $fe, $df, $2a, $fe, $52, $00, $da, $f2, $92, $f2, $52, $00, $91, $a8
    db $04, $43, $47, $11, $ac

data_0b05:
    db $fa, $7d, $1e, $08, $05, $04, $02, $01

data_0b0d:
    db $00, $02

data_0b0f:
    db $03, $05, $04, $03, $05, $04, $01, $04, $02, $03, $05, $04, $03
    db $04, $00, $03, $02, $04, $05, $03, $04, $05, $01, $02, $04, $03
    db $01, $05, $04, $05, $02, $04, $03, $05, $03, $05, $04, $01, $05
    db $02, $03, $05, $04, $05, $00, $05, $00, $01, $02, $03, $04, $05

data_0b43:
    db $0c, "    SLOT MACHINE", $0d
    db $0d
    db $0d
    db "250    XX 125    XX", $0d
    db $0d
    db $0d
    db " 30    XX   8    XX", $0d
    db $0d
    db $0d
    db "  5    XX   4    XX", $0d
    db $0d
    db $0d
    db "  2    X*   1    **", $0d
    db $0d
    db $0d
    db $0d
    db "  PUSH A TO START", $0d
    db $00

data_0bc3:
    db $0c, "    SLOT MACHINE", $0d
    db $0d
    db $0d
    db $0d
    db $0d
    db $0d
    db $0d
    db $0d
    db $0d
    db $0d
    db $0d
    db $0d
    db $0d
    db $0d
    db $0d
    db "    CREDIT:     ", $0d
    db "   PAY OUT:     "
    db $00
