; Disassembly of "slot.gbf"

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_ICON | FILE_2BPP | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $6c           ; owner code
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
    trap JumpViaTable
    db $04
    dw jp_0121 - @
    dw jp_014e - @
    dw jp_0181 - @
    dw jp_01cb - @
    dw jp_01ed - @

jp_0121:
    ld de, $0000
    ld c, $00
    callx @+$02fa
    ldh a, [$c9]
    or a
    jr z, jp_014e

    dec a
    ldh [$c9], a
    jr nz, jp_014e

    xor a
    ldh [$c3], a
    ld de, $0000
    ld c, $00

    callx @+$02f9
    ld hl, $ffc6
    inc [hl]
    ld a, $5a
    ldh [$cb], a

jp_014e::
    ld de, $0001
    ld c, $10
    callx @+$02cd
    ldh a, [$c6]
    cp $01
    jr nz, jp_0181

    ldh a, [$c9]
    or a
    jr z, jp_0181

    dec a
    ldh [$c9], a
    jr nz, jp_0181

    xor a
    ldh [$c4], a
    ld de, $0001
    ld c, $10
    callx @+$02c6
    ld hl, $ffc6
    inc [hl]
    ld a, $b4
    ldh [$cb], a

jp_0181::
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
    trap AwaitButton
    jr jp_01ed

jr_000_01a6::
    xor a
    ldh [$c5], a
    ld de, $0002
    ld c, $20
    callx @+$028a
    ld hl, $ffc6
    inc [hl]
    jr jp_01ed

jr_000_01bb::
    ld de, $0002
    ld c, $20
    callx @+$0260
    trap RandNext
    jr jp_01ed


jp_01cb:
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

jp_01ed::
    ld c, $00
    ldh a, [$c9]
    or a
    jr nz, jr_000_01f7

    trap InputButtons
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
    trap AudioPlaySound
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
    dk "  \0"
data_0308:
    dk "<>\0"


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
    trap DrawAt
    ld l, e
    ld h, d
    trap DrawString
    ret


jr_000_0332::
    push af
    ld a, $07
    trap AudioPlaySound
    pop af
    add a
    add a
    add $05
    ld h, a
    ldx de, data_0308
    jr jr_000_0329


data_0343:
    dk "   \0"
data_0347:
    dk "x\0"


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
    trap DrawAt
    ldx hl, data_0343
    ldh a, [$c7]
    cp $01
    jr z, jr_000_037b

    ld e, a
    ld d, $00
    ld hl, $c400
    trap StrConvInt
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
    trap DrawAt
    pop hl
    ld a, h
    push hl
    trap DrawChar
    ld h, $11
    trap DrawAt
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
    trap DrawAt
    ld hl, $c400
    push hl
    trap StrConvInt
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
    trap ExtractInit
    ld de, $8800
    ld bc, $0480
    trap ExtractData
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
    trap DrawBox
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
    trap JumpViaTable
    db $04
    dw jp_0608 - @
    dw jp_05f9 - @
    dw jp_05db - @
    dw jp_05bd - @
    dw jp_0608 - @

jp_05bd:
    ld a, $02
    ld bc, $0100
    ld de, $0d01
    callx @+$0108
    ld a, $00
    ld bc, $0102
    ld de, $010d
    callx @+$00f9
jp_05db:
    ld a, $00
    ld bc, $0000
    ld de, $0404
    callx @+$00ea
    ld a, $02
    ld bc, $0202
    ld de, $0a0a
    callx @+$00db
jp_05f9:
    ld a, $01
    ld bc, $0101
    ld de, $0707
    callx @+$00cc
jp_0608:
    ld hl, $c762
    ld a, [hl+]
    or [hl]
    jr nz, jr_000_065d

    ld a, $2f
    trap AudioPlaySound
    ld bc, $0000
    callx @+$fde6
    ldx hl, data_07c1
    ld a, [hl+]
    or [hl]
    ret nz

    ld hl, $c600
    trap FileDelete
    ld a, $78
    trap AwaitButton
    xor a
    trap DrawInit
    ld hl, $0307
    trap DrawAt
    ldx hl, data_06a6
    trap DrawString
    ld hl, $0109
    trap DrawAt
    ldx hl, data_06b8
    trap DrawString

jr_000_0646::
    trap AwaitFrame
    ldh a, [$8a]
    or a
    jr nz, jr_000_0646

    trap $db
    ld a, $f0
    trap AwaitButton
    ld a, $f0
    trap AwaitButton
    ld a, $f0
    trap AwaitButton
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
    trap AudioPlaySound
    ldx hl, data_07c1
    ld e, [hl]
    inc hl
    ld d, [hl]
    callx @+$fd8e
    ld a, $05
    trap AwaitButton
    pop de
    pop bc
    ld a, d
    or e
    jr nz, jr_000_0666

    xor a
    trap AudioPlaySound
    ld a, $3c
    trap AwaitButton
    ld hl, $c762
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ldh a, [$c7]
    ld l, a
    ld h, $00
    trap MathMul16
    ld e, l
    ld d, h
    pop bc
    callx @+$fd36
    ret


data_06a6:
    dk "おかねがなくなりましたので»\0"
data_06b8:
    dk "このプログラムはさくじょされました»\0"


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
    trap DrawAt
    ld a, $cc
    trap DrawChar
    ld h, $11
    ld l, e
    trap DrawAt
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
    trap InputButtons
    bit 0, a
    ret nz

    and $06
    jr z, jr_000_07b4

    trap ExitToMenu


data_07c1:
    dw 100

data_07c3:
    INCBIN "frag/slot/tiles.hz"

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
    db $0c, "    SLOT MACHINE\r"
    db "\r"
    db "\r"
    db "250    XX 125    XX\r"
    db "\r"
    db "\r"
    db " 30    XX   8    XX\r"
    db "\r"
    db "\r"
    db "  5    XX   4    XX\r"
    db "\r"
    db "\r"
    db "  2    X*   1    **\r"
    db "\r"
    db "\r"
    db "\r"
    db "  PUSH A TO START\r\0"

data_0bc3:
    db $0c, "    SLOT MACHINE\r"
    db "\r"
    db "\r"
    db "\r"
    db "\r"
    db "\r"
    db "\r"
    db "\r"
    db "\r"
    db "\r"
    db "\r"
    db "\r"
    db "\r"
    db "\r"
    db "\r"
    db "    CREDIT:     \r"
    db "   PAY OUT:     \0"
