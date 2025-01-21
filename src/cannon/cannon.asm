; Disassembly of "cannon-ball.gbf"

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
    db $6d           ; owner code
.title
    dk "CANNON BALL"
.icon
    INCBIN "cannon/icon.2bpp"
.end

History:
.points
    dw 1
.author
    db "GBKISS LAB", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    trap AudioStop
    ld a, $20
    trap DrawInit
    ldx de, data_tileset
    ld bc, $c600
    trap ExtractInit
    ld de, $8800
    ld bc, $0450
    trap ExtractData
    xor a
    ld [$c650], a
    ld [$c651], a
    xor a
    ldh [$9b], a
    ldh [$9a], a
    ld a, $a0
    ldh [$a0], a
    ldh [$9f], a
    callx call_0b47
    callx call_01cf
    ld a, $07
    trap LCDEnable
    ld a, $01
    ld [$c665], a
    xor a
    ld [$c656], a

jp_0143:
    ld sp, $e000
    callx call_06ce
    callx call_037f
    callx call_0612

jr_015b::
    trap AwaitFrame
    trap InputButtons
    callx call_06d8
    callx call_0646
    callx call_0418
    ld bc, $2800
    trap $c4
    callx call_0711
    callx call_0531
    callx call_07d8
    callx call_0873
    ld a, [$c665]
    cp $02
    jr nz, jr_015b

    ldh a, [$8b]
    and $02
    jr nz, jr_0202

    ldh a, [$8b]

jr_01a4::
    and $04
    jr nz, jr_0204

    ldh a, [$8b]
    and $01
    jr z, jr_015b

    ld a, $03
    ld [$c665], a
    ld hl, $c650
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [$c656], a
    ld [$c654], a
    ldx hl, data_sounds.bgm
    ld a, [hl]
    trap AudioPlayMusic
    callx call_0765
    jr jr_015b


call_01cf:
    ld hl, $9800
    ld bc, $0200
    ld e, $20
    trap MemSet
    ld hl, $9a00
    ld bc, $0014
    ld e, $c4
    trap MemSet
    ld hl, $c66e
    ld bc, $0014
    ld e, $20
    trap MemSet
    ldx hl, layout_0aff
    trap DrawLayout
    callx call_0765
    callx call_07ab
    ret


jr_0202::
    trap ExitToMenu

jr_0204:
    trap LCDDisable
    ld bc, $2800
    trap $c4
    callx call_01cf
    ldx hl, layout_033c
    trap DrawLayout
    xor a
    ld [$c656], a
    ld [$c66d], a
    callx call_030c
    ld a, $07
    trap LCDEnable

jp_022a:
    trap AwaitFrame
    trap InputButtons
    ld a, [$c656]
    sla a
    sla a
    sla a
    sla a
    add $40
    ld e, a
    ld d, $64
    ld bc, $0101
    ld hl, $0080
    xor a
    trap $c5
    ldh a, [$8b]
    and $40
    jr z, jr_0257

    ld a, [$c656]
    or a
    jr z, jr_0257

    dec a
    ld [$c656], a

jr_0257::
    ldh a, [$8b]
    and $80
    jr z, jr_0268

    ld a, [$c656]
    cp $04
    jr nc, jr_0268

    inc a
    ld [$c656], a

jr_0268::
    ldh a, [$8b]
    and $10
    jr z, jr_029b

    ldx hl, data_sounds.bgm
    ld d, $00
    ld a, [$c656]
    ld e, a
    add hl, de
    or a
    jr nz, jr_0281

    ld a, [$c653]
    jr jr_0284

jr_0281::
    ld a, [$c652]

jr_0284::
    cp [hl]
    jr z, jr_029b

    ld a, $0a
    ld [$0000], a
    inc [hl]
    xor a
    ld [$0000], a
    ld a, [$c656]
    callx call_031a

jr_029b::
    ldh a, [$8b]
    and $20
    jr z, jr_02c4

    ldx hl, data_sounds.bgm
    ld d, $00
    ld a, [$c656]
    ld e, a
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_02c4

    ld a, $0a
    ld [$0000], a
    dec [hl]
    xor a
    ld [$0000], a
    ld a, [$c656]
    callx call_031a

jr_02c4::
    ldh a, [$8b]
    and $01
    jr z, jr_02e2

    ldx hl, data_sounds.bgm
    ld d, $00
    ld a, [$c656]
    ld e, a
    add hl, de
    ld d, [hl]
    ld a, e
    or a
    jr z, jr_02df

    ld a, d
    trap AudioPlaySound
    jr jr_02e2

jr_02df::
    ld a, d
    trap AudioPlayMusic

jr_02e2::
    ldh a, [$8b]
    and $02
    jr z, jr_0308

    trap LCDDisable
    ld a, $01
    ld [$c665], a
    callx call_01cf
    xor a
    ld [$c656], a
    ld a, $07
    trap LCDEnable
    xor a
    trap AudioPlayMusic
    xor a
    trap AudioPlaySound
    jx jp_0143


jr_0308::
    jx jp_022a


call_030c:
    xor a

jr_030d::
    callx call_031a
    inc a
    cp $05
    jr c, jr_030d

    ret


call_031a:
    push af
    ld b, a
    add a
    add $06
    ld e, a
    ld d, $0d
    push de
    ldx hl, data_sounds.bgm
    ld e, b
    ld d, $00
    add hl, de
    ld e, [hl]
    ld d, $00
    ld hl, $c668
    trap StrConvHex
    xor a
    ld [$c66d], a
    pop de
    trap DrawStringList
    pop af
    ret


layout_033c:
    dk $05, $02, "CANNON BALL\0"
    dk $04, $03, "SOUND  CONFIG\0"
    dk $05, $06, "BGM\0"
    dk $05, $08, "SHOT\0"
    dk $05, $0a, "HIT\0"
    dk $03, $0c, "HISCORE\0"
    dk $05, $0e, "DEAD\0"
    db $ff


call_037f:
    ld hl, $c600
    xor a
    ld b, $50

jr_0385::
    ld [hl+], a
    dec b
    jr nz, jr_0385

    ldx hl, data_0b17
    ld a, [$c656]
    and $03
    sla a
    sla a
    sla a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [$c656]
    srl a
    srl a
    and $03
    inc a
    ld [$c657], a
    ld e, a
    ld a, [hl+]
    ld b, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push hl
    callx call_03f5
    pop hl
    ld a, [hl+]
    ld b, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld d, [hl]
    callx call_03f5
    ldx hl, data_0b37
    ld a, [$c657]
    dec a
    sla a
    sla a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl+]
    ld [$c658], a
    ld a, [hl+]
    ld [$c659], a
    ld a, [hl+]
    ld [$c65a], a
    ld a, [hl+]
    ld [$c65b], a
    ld a, [$c656]
    and $03
    jr z, jr_03f0

    ld a, $01

jr_03f0::
    inc a
    ld [$c65d], a
    ret


call_03f5:
    ld hl, $c600
    push af
    push bc
    push de
    ld b, $10

jr_03fd::
    ld a, [hl]
    or a
    jr z, jr_040c

    ld de, $0005
    add hl, de
    dec b
    jr nz, jr_03fd

    pop de
    pop bc
    pop af
    ret


jr_040c::
    pop de
    pop bc
    pop af
    ld [hl+], a
    ld [hl], b
    inc hl
    ld [hl], c
    inc hl
    ld [hl], d
    inc hl
    ld [hl], e
    ret


call_0418:
    ld hl, $c65c
    inc [hl]
    ld a, [hl]
    and $03
    ret nz

    ld a, [$c665]
    cp $03
    jr c, jr_042a

    and $80
    ret z

jr_042a::
    ld hl, $c600
    ld c, $10

jr_042f::
    ld a, [hl]
    cp $01
    jr c, jr_0440

    jr z, jr_0448

    cp $03
    jr c, jr_046f

    jr z, jr_049b

    jx call_04c2


jr_0440::
    ld de, $0005
    add hl, de

jp_0444:
    dec c
    jr nz, jr_042f

    ret


jr_0448::
    push bc
    push hl
    callx call_051e
    ld h, $04
    callx call_0504
    ld a, [$c658]
    ld l, a
    callx call_04e9
    pop hl
    callx call_0527
    jr jr_0496

jr_046f::
    push bc
    push hl
    callx call_051e
    ld h, $08
    callx call_0504
    ld a, [$c659]
    ld l, a
    callx call_04e9
    pop hl
    callx call_0527
    jr jr_0496

jr_0496::
    pop bc
    jx jp_0444


jr_049b::
    push bc
    push hl
    callx call_051e
    ld h, $10
    callx call_0504
    ld a, [$c65a]
    ld l, a
    callx call_04e9
    pop hl
    callx call_0527
    jr jr_0496


call_04c2:
    push bc
    push hl
    callx call_051e
    ld h, $17
    callx call_0504
    ld a, [$c65b]
    ld l, a
    callx call_04e9
    pop hl
    callx call_0527
    jr jr_0496


call_04e9:
    ld a, [$c657]
    ld h, a
    ld a, c
    add $04
    sra a
    sra a
    sra a
    add b
    ld b, a
    and $80
    jr z, jr_0500

    ld b, $80
    ld c, l
    ret


jr_0500::
    ld a, c
    add h
    ld c, a
    ret


call_0504:
    ld a, d
    add e
    ld d, a
    ld a, e
    sla a
    ld a, d
    jr nc, jr_0514

    sub h
    ret nc

    ld d, h

jr_0510::
    xor a
    sub e
    ld e, a
    ret


jr_0514::
    add h
    cp $a0
    ret c

    ld a, $9f
    sub h
    ld a, d
    jr jr_0510


call_051e:
    inc hl
    ld b, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld e, [hl]
    ret


call_0527:
    inc hl
    ld [hl], b
    inc hl
    ld [hl], c
    inc hl
    ld [hl], d
    inc hl
    ld [hl], e
    inc hl
    ret


call_0531:
    ld a, [$c65d]
    and $03
    jr z, jr_057a

    cp $02
    jr z, jr_0566

    jr c, jr_0552

    ld a, $0a
    ld [$c666], a
    ld hl, $c600
    callx call_058e
    ld hl, $c605
    jr call_058e

jr_0552::
    ld a, $0a
    ld [$c666], a
    ld hl, $c605
    callx call_058e
    ld hl, $c600
    jr call_058e

jr_0566::
    ld a, $f6
    ld [$c666], a
    ld hl, $c64b
    callx call_058e
    ld hl, $c646
    jr call_058e

jr_057a::
    ld a, $f6
    ld [$c666], a
    ld hl, $c646
    callx call_058e
    ld hl, $c64b
    jr call_058e

call_058e:
    ld de, $c300
    ld a, [$c667]
    ld e, a
    ld c, $08

jr_0597::
    ld a, [hl]
    cp $01
    jr c, jr_05a6

    jr z, jr_05b1

    cp $03
    jr c, jr_05c0

    jr z, jr_05d3

    jr jr_05e2

jr_05a6::
    push de
    ld a, [$c666]
    add l
    ld l, a
    pop de
    dec c
    jr nz, jr_0597

    ret


jr_05b1::
    push hl
    push bc
    inc hl
    ld b, [hl]
    inc hl
    inc hl
    ld c, [hl]
    ld h, d
    ld l, e
    ldx de, sprite_bubble_s
    jr jr_05ef

jr_05c0::
    push hl
    push bc
    inc hl
    ld b, [hl]
    inc hl
    inc hl
    ld c, [hl]
    ld h, d
    ld l, e
    ldx de, sprite_bubble_m
    jr jr_05ef

jr_05cf::
    pop bc
    pop hl
    jr jr_05a6

jr_05d3::
    push hl
    push bc
    inc hl
    ld b, [hl]
    inc hl
    inc hl
    ld c, [hl]
    ld h, d
    ld l, e
    ldx de, sprite_bubble_l
    jr jr_05ef

jr_05e2::
    push hl
    push bc
    inc hl
    ld b, [hl]
    inc hl
    inc hl
    ld c, [hl]
    ld h, d
    ld l, e
    ldx de, sprite_bubble_xl

jr_05ef::
    ld a, [de]
    cp $80
    jr z, jr_060a

    add b
    ld [hl+], a
    inc de
    ld a, [de]
    inc de
    add c
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, l
    cp $a0
    jr c, jr_05ef

    ld l, $10
    jr jr_05ef

jr_060a::
    ld a, l
    ld [$c667], a
    ld d, h
    ld e, l
    jr jr_05cf


call_0612:
    xor a
    ld [$c65e], a
    ld [$c65f], a
    ld [$c660], a
    ld [$c661], a
    ret


call_0620:
    ld a, [$c660]
    or a
    ret nz

    ldx hl, data_sounds.shot
    ld a, [hl]
    trap AudioPlaySound
    ld a, [$c662]
    srl a
    srl a
    srl a
    ld [$c65e], a
    ld a, $0e
    ld [$c65f], a
    ld a, $01
    ld [$c661], a
    ld [$c660], a
    ret


call_0646:
    ld a, [$c660]
    dec a
    jr z, jr_0650

    dec a
    jr z, jr_069e

    ret


jr_0650::
    ld a, [$c661]
    dec a
    ld [$c661], a
    ret nz

    ld a, $03
    ld [$c661], a
    ld a, [$c65f]
    dec a
    jr z, jr_0693

    ld h, $98
    ld [$c65f], a
    dec a
    sla a
    sla a
    sla a
    sla a
    sla a
    jr nc, jr_0676

    inc h

jr_0676::
    ld b, a
    ld a, [$c65e]
    or b
    ld l, a
    ld bc, $0001
    ld e, $ae
    push hl
    push bc
    trap MemSet
    pop bc
    pop hl
    ld a, l
    add $20
    jr nc, jr_068d

    inc h

jr_068d::
    ld l, a
    ld e, $af
    trap MemSet
    ret


jr_0693::
    ld a, $02
    ld [$c660], a
    ld a, $0e
    ld [$c65f], a
    ret


jr_069e::
    ld h, $98
    ld a, [$c65f]
    dec a
    ld [$c65f], a
    sla a
    sla a
    sla a
    sla a
    sla a
    jr nc, jr_06b4

    inc h

jr_06b4::
    ld b, a
    ld a, [$c65e]
    or b
    ld l, a
    ld a, [$c65e]
    ld bc, $0001
    ld e, $20
    trap MemSet
    ld a, [$c65f]
    or a
    ret nz

    xor a
    ld [$c660], a
    ret


call_06ce:
    ld a, $50
    ld [$c662], a
    xor a
    ld [$c664], a

Call_000_06d7::
    ret


call_06d8:
    ld a, [$c665]
    or a
    ret nz

    ld a, [$c664]
    or a
    ret nz

    ld a, [$c662]
    ld b, a
    ldh a, [$8a]
    ld c, a
    and $20
    jr z, jr_06f4

    ld a, b
    cp $06
    jr c, jr_06f4

    dec b
    dec b

jr_06f4::
    ld a, c
    and $10
    jr z, jr_0700

    ld a, b
    cp $9b
    jr nc, jr_0700

    inc b
    inc b

jr_0700::
    ld a, b
    ld [$c662], a
    ld a, c
    and $01
    jr z, jr_0710

    callx call_0620

jr_0710::
    ret


call_0711:
    ld a, [$c665]
    or a
    jr z, jr_071a

    cp $03
    ret c

jr_071a::
    ld hl, $c664
    ld a, [hl]
    or a
    jr nz, jr_0740

    ld a, [$c65c]
    ld l, $b0
    srl a
    srl a
    srl a
    and $04

jr_072e::
    add l
    ld l, a
    ld h, $00
    ld a, [$c662]
    ld d, a
    ld e, $80
    ld bc, $0201
    ld a, $00
    trap $c5
    ret


jr_0740::
    cp $04
    ret z

    ld hl, $c663
    dec [hl]
    jr nz, jr_0754

    ld [hl], $28
    ld hl, $c664
    inc [hl]
    ld a, [hl]
    cp $04
    jr z, jr_075f

jr_0754::
    ld a, [$c664]
    sla a
    sla a
    ld l, $b4
    jr jr_072e

jr_075f::
    ld a, $80
    ld [$c665], a
    ret


call_0765:
    ld hl, $0311
    trap DrawAt
    ld hl, $c650
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    callx call_07b2
    ld hl, $0d11
    trap DrawAt
    pop bc
    ldx hl, data_high_score
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, b
    cp d
    ret c

    jr nz, jr_078e

    ld a, c
    cp e
    ret c

    ret z

jr_078e::
    ld d, b
    ld e, c
    ld a, $0a
    ld [$0000], a
    ld [hl], d
    dec hl
    ld [hl], e
    xor a
    ld [$0000], a
    ld hl, $c654
    ld a, [hl]
    or a
    jr nz, call_07ab

    inc [hl]
    ldx hl, data_sounds.high_score
    ld a, [hl]
    trap AudioPlaySound


call_07ab::
    ldx hl, data_high_score
    ld a, [hl+]
    ld e, a
    ld d, [hl]

call_07b2:
    ld hl, $c66e
    trap StrConvInt
    ld hl, $c66e
    trap DrawString
    ret


call_07bd:
    push hl
    ld a, [$c65d]
    add a
    ld b, a
    add a
    add a
    add b
    ld hl, $c650
    add [hl]
    ld [hl], a
    jr nc, jr_07cf

    inc hl
    inc [hl]

jr_07cf::
    callx call_0765
    pop hl
    ret


call_07d8:
    ld hl, $c665
    ld a, [hl]
    or a
    ret z

    cp $02
    ret z

    jr c, jr_0816

    cp $03
    jr nz, jr_0805

    inc [hl]
    ldx hl, layout_0a72
    trap DrawLayout
    ld hl, $0b0c
    trap DrawAt
    ld a, [$c656]
    inc a
    ld e, a
    ld d, $00
    ld hl, $c66e
    trap StrConvInt
    trap DrawString
    jx jp_0143


jr_0805::
    cp $80
    jr nc, jr_081e

    inc [hl]
    cp $5a
    ret c

    xor a
    ld [hl], a
    ldx hl, layout_0ab4
    trap DrawLayout
    ret


jr_0816::
    inc [hl]
    ldx hl, layout_0a30
    trap DrawLayout
    ret


jr_081e::
    jr nz, jr_0833

    ld a, [$c660]
    or a
    ret nz

    inc [hl]
    ldx hl, layout_0ac3
    trap DrawLayout
    xor a
    trap AudioPlayMusic
    xor a
    trap AudioPlaySound
    ret


jr_0833::
    cp $c0
    jr c, jr_0846

    jr nz, jr_0861

    ld a, [$c660]
    or a
    ret nz

    inc [hl]
    ldx hl, layout_0adf
    trap DrawLayout
    ret


jr_0846::
    ld a, [$c65c]
    and $0f
    jr nz, jr_0853

    inc [hl]
    ld a, [hl]
    cp $c0
    jr z, jr_0858

jr_0853::
    ldh a, [$8a]
    and $03
    ret z

jr_0858::
    ld [hl], $01
    ldx hl, layout_0ad1
    trap DrawLayout
    ret


jr_0861::
    inc a
    ld [hl], a
    cp $ff
    ret nz

    ld [hl], $03
    ld hl, $c656
    inc [hl]
    ldx hl, layout_0aef
    trap DrawLayout
    ret


call_0873:
    ld a, [$c660]
    dec a
    jr nz, jr_08a1

    ld a, [$c65e]
    sla a
    sla a
    sla a
    ld b, a
    ld c, $08
    ld a, [$c65f]
    ld e, a
    sla a
    sla a
    sla a
    ld d, a
    ld a, $0f
    sub e
    sla a
    sla a
    sla a
    ld e, a
    callx call_08b9

jr_08a1::
    ld a, [$c664]
    or a
    ret nz

    ld a, [$c662]
    sub $04
    ld b, a
    ld c, $08
    ld de, $7410
    callx call_091a
    ret


call_08b9:
    ld hl, $c600
    ld a, $10

jr_08be::
    push af
    callx call_094a
    jr c, jr_0911

    pop af
    push hl
    ldx hl, data_sounds.hit
    ld a, [hl]
    trap AudioPlaySound
    pop hl
    callx call_07bd
    ld a, $02
    ld [$c660], a
    ld a, $0e
    ld [$c65f], a
    ld a, [hl]
    dec a
    jr z, jr_0902

    ld [hl+], a
    ld c, a
    ld b, [hl]
    inc hl
    ld [hl], $00
    inc hl
    ld d, [hl]
    inc hl
    xor a
    sub [hl]
    ld e, a
    ld a, c
    ld c, $00
    callx call_03f5
    ld hl, $c65d
    inc [hl]
    ret


jr_0902::
    ld [hl], $00
    ld hl, $c65d
    dec [hl]
    ld a, [hl]
    or a
    ret nz

    ld a, $c0
    ld [$c665], a
    ret


jr_0911::
    ld a, $05
    add l
    ld l, a
    pop af
    dec a
    jr nz, jr_08be

    ret


call_091a:
    ld a, [$c665]
    or a
    ret nz

    ld hl, $c600
    ld a, $10

jr_0924::
    push af
    callx call_094a
    jr c, jr_0941

    pop af
    ldx hl, data_sounds.dead
    ld a, [hl]
    trap AudioPlaySound
    ld a, $01
    ld [$c664], a
    ld a, $3c
    ld [$c663], a
    ret


jr_0941::
    ld a, $05
    add l
    ld l, a
    pop af
    dec a
    jr nz, jr_0924

    ret


call_094a:
    push hl
    ld a, [hl+]
    cp $01
    jr c, jr_095a

    jr z, jr_095c

    cp $03
    jr c, jr_097c

    jr z, jr_0998

    jr jr_09b4

jr_095a::
    pop hl
    ret


jr_095c::
    ld a, [hl]
    sub d
    jr c, jr_0979

    sub e
    jr c, jr_0967

    sub $08
    jr nc, jr_0979

jr_0967::
    inc hl
    inc hl
    ld a, [hl]
    add $03
    sub b
    jr c, jr_0979

    sub c
    jr c, jr_0976

    sub $06
    jr nc, jr_0979

jr_0976::
    xor a
    jr jr_095a

jr_0979::
    scf
    jr jr_095a

jr_097c::
    ld a, [hl]
    sub d
    jr c, jr_0979


call_0980:
    sub e
    jr c, jr_0987

    sub $10
    jr nc, jr_0979

jr_0987::
    inc hl
    inc hl
    ld a, [hl]
    add $06
    sub b
    jr c, jr_0979

    sub c
    jr c, jr_0976

    sub $0c
    jr nc, jr_0979

    jr jr_0976

jr_0998::
    ld a, [hl]
    sub d
    jr c, jr_0979

    sub e
    jr c, jr_09a3

    sub $20
    jr nc, jr_0979

jr_09a3::
    inc hl
    inc hl
    ld a, [hl]
    add $0e
    sub b
    jr c, jr_0979


call_09ab:
    sub c
    jr c, jr_0976

    sub $1c
    jr nc, jr_0979

jr_09b2::
    jr jr_0976

jr_09b4::
    ld a, [hl]
    sub d
    jr c, jr_0979

    sub e
    jr c, jr_09bf

    sub $2c
    jr nc, jr_0979

jr_09bf::
    inc hl
    inc hl
    ld a, [hl]
    add $14
    sub b
    jr c, jr_0979


call_09c7:
    sub c
    jr c, jr_0976

    sub $28
    jr nc, jr_0979

    jr jr_0976


sprite_bubble_s:
    db $08, $04, $80, $00
    db $80

sprite_bubble_m:
    db $01, $00, $82, $00
    db $01, $08, $84, $00
    db $80

sprite_bubble_l:
    db $f0, $f8, $86, $00
    db $00, $f8, $88, $00
    db $f0, $00, $8a, $00
    db $f0, $08, $8c, $00
    db $00, $00, $8e, $00
    db $00, $08, $90, $00
    db $f0, $10, $aa, $00
    db $00, $10, $ac, $00
    db $80

sprite_bubble_xl:
    db $e1, $f8, $94, $00
    db $e1, $00, $96, $00
    db $e1, $08, $98, $00
    db $e1, $10, $9a, $00
    db $e9, $f0, $92, $00
    db $e9, $18, $9c, $00
    db $f9, $f0, $9e, $00
    db $f9, $18, $a8, $00
    db $09, $f8, $a0, $00
    db $09, $00, $a2, $00
    db $09, $08, $a4, $00
    db $09, $10, $a6, $00
    db $80

layout_0a30:
    dk $04, $03, "CANNON BALL\0"
    dk $02, $07, "PUSH A to START\0"
    dk $02, $09, "PUSH B to  END\0"
    dk $03, $0c, "SELECT CONFIG\0"
    db $ff

layout_0a72:
    db $04, $03, "           ", $00
    db $02, $07, "               ", $00
    db $02, $09, "              ", $00
    db $03, $0c, " STAGE       ", $00
    db $ff

layout_0ab4:
    db $04, $0c, "           \0"
    db $ff

layout_0ac3:
    db $05, $0c, "GAME  OVER\0"
    db $ff

layout_0ad1:
    db $05, $0c, "          \0"
    db $ff

layout_0adf:
    db $04, $07, "STAGE CLEAR!\0"
    db $ff

layout_0aef:
    db $04, $07, "            \0"
    db $ff

layout_0aff:
    db $00, $11, " SC        HI       ", $00
    db $ff

data_0b17:
    db $04, $32, $00, $1e
    db $00, $32, $00, $3c
    db $03, $32, $00, $1e
    db $03, $32, $00, $46
    db $04, $32, $00, $1e
    db $03, $32, $00, $4b
    db $04, $32, $00, $1e
    db $04, $32, $00, $50


data_0b37:
    db $ee, $e8, $e2, $dc
    db $e8, $df, $d5, $ce
    db $e3, $d7, $cc, $c3
    db $df, $d1, $c6, $bb


call_0b47:
    ld a, [CartridgeCodeAddr]
    ld de, $1b38
    cp CART_BDAMAN
    jr z, jr_0b53

    trap AudioGetCount

jr_0b53::
    ld hl, $c652
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, data_sounds.bgm
    ld b, data_sounds.end - data_sounds.shot
    ld a, [hl]
    cp d
    jr c, jr_0b70

    jr z, jr_0b70

    ld a, $0a
    ld [$0000], a
    ld [hl], $00
    xor a
    ld [$0000], a

jr_0b70::
    inc hl
    ld a, [hl]
    cp e
    jr c, jr_0b82

    jr z, jr_0b82

    ld a, $0a
    ld [$0000], a
    ld [hl], $00
    xor a
    ld [$0000], a

jr_0b82::
    dec b
    jr nz, jr_0b70

    ret


data_tileset:
    ; only the first 541 bytes of this data are necessary
    ; the rest contains another 6 copies of the same tile data
    INCBIN "cannon/tiles.hz"

data_high_score:
    dw 500

data_sounds:
.bgm
    db $04
.shot
    db $0c
.hit
    db $0e
.high_score
    db $1b
.dead
    db $15
.end
