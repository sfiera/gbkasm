; Disassembly of "cannon-ball.gbf"

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
    db $6d                     ; owner code
.title
    dk "CANNON BALL"
.icon
    INCBIN "gfx/cannon/icon.2bpp"
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
    trap StopAudio
    ld a, $20
    trap DrawInit
    ldx de, data_tileset
    ld bc, $c600
    trap InitDecompress
    ld de, $8800
    ld bc, $0450
    trap RunDecompress
    xor a
    ld [$c650], a
    ld [$c651], a
    xor a
    ldh [$9b], a
    ldh [$9a], a
    ld a, $a0
    ldh [$a0], a
    ldh [$9f], a
    callx @+$0a1b
    callx @+$009c
    ld a, $07
    trap LCDEnable
    ld a, $01
    ld [$c665], a
    xor a
    ld [$c656], a
    ld sp, $e000
    callx @+$0584
    callx @+$022e
    callx @+$04ba

jr_000_015b::
    trap AwaitFrame
    trap $d8
    callx @+$0575
    callx @+$04dc
    callx @+$02a7
    ld bc, $2800
    trap $c4
    callx @+$0594
    callx @+$03ad
    callx @+$064d
    callx @+$06e1
    ld a, [$c665]
    cp $02
    jr nz, jr_000_015b

    ldh a, [$8b]
    and $02
    jr nz, jr_000_0202

    ldh a, [$8b]

jr_000_01a4::
    and $04
    jr nz, jr_000_0204

    ldh a, [$8b]
    and $01
    jr z, jr_000_015b

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
    trap PlayMusic
    callx @+$059b
    jr jr_000_015b

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
    callx @+$056e
    callx @+$05ad
    ret


jr_000_0202::
    trap ExitToMenu

jr_000_0204:
    trap LCDDisable
    ld bc, $2800
    trap $c4
    callx @+$ffc0
    ldx hl, layout_033c
    trap DrawLayout
    xor a
    ld [$c656], a
    ld [$c66d], a
    callx @+$00e9
    ld a, $07
    trap LCDEnable
    trap AwaitFrame
    trap $d8
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
    jr z, jr_000_0257

    ld a, [$c656]
    or a
    jr z, jr_000_0257

    dec a
    ld [$c656], a

jr_000_0257::
    ldh a, [$8b]
    and $80
    jr z, jr_000_0268

    ld a, [$c656]
    cp $04
    jr nc, jr_000_0268

    inc a
    ld [$c656], a

jr_000_0268::
    ldh a, [$8b]
    and $10
    jr z, jr_000_029b

    ldx hl, data_sounds.bgm
    ld d, $00
    ld a, [$c656]
    ld e, a
    add hl, de
    or a
    jr nz, jr_000_0281

    ld a, [$c653]
    jr jr_000_0284

jr_000_0281::
    ld a, [$c652]

jr_000_0284::
    cp [hl]
    jr z, jr_000_029b

    ld a, $0a
    ld [$0000], a
    inc [hl]
    xor a
    ld [$0000], a
    ld a, [$c656]
    callx @+$0082

jr_000_029b::
    ldh a, [$8b]
    and $20
    jr z, jr_000_02c4

    ldx hl, data_sounds.bgm
    ld d, $00
    ld a, [$c656]
    ld e, a
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_000_02c4

    ld a, $0a
    ld [$0000], a
    dec [hl]
    xor a
    ld [$0000], a
    ld a, [$c656]
    callx @+$0059

jr_000_02c4::
    ldh a, [$8b]
    and $01
    jr z, jr_000_02e2

    ldx hl, data_sounds.bgm
    ld d, $00
    ld a, [$c656]
    ld e, a
    add hl, de
    ld d, [hl]
    ld a, e
    or a
    jr z, jr_000_02df

    ld a, d
    trap PlaySound
    jr jr_000_02e2

jr_000_02df::
    ld a, d
    trap PlayMusic

jr_000_02e2::
    ldh a, [$8b]
    and $02
    jr z, jr_000_0308

    trap LCDDisable
    ld a, $01
    ld [$c665], a
    callx @+$fedc
    xor a
    ld [$c656], a
    ld a, $07
    trap LCDEnable
    xor a
    trap PlayMusic
    xor a
    trap PlaySound
    jx @+$fe3e


jr_000_0308::
    jx @+$ff21


    xor a

jr_000_030d::
    callx call_031a
    inc a
    cp $05
    jr c, jr_000_030d

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
    trap IntToStringHex
    xor a
    ld [$c66d], a
    pop de
    trap DrawStringList
    pop af
    ret


layout_033c:
    dk $05, $02, "CANNON BALL\n"
    dk $04, $03, "SOUND  CONFIG\n"
    dk $05, $06, "BGM\n"
    dk $05, $08, "SHOT\n"
    dk $05, $0a, "HIT\n"
    dk $03, $0c, "HISCORE\n"
    dk $05, $0e, "DEAD\n"
    db $ff


call_037f:
    ld hl, $c600
    xor a
    ld b, $50

jr_000_0385::
    ld [hl+], a
    dec b
    jr nz, jr_000_0385

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
    callx @+$003f
    pop hl
    ld a, [hl+]
    ld b, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld d, [hl]
    callx @+$0031
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
    jr z, jr_000_03f0

    ld a, $01

jr_000_03f0::
    inc a
    ld [$c65d], a
    ret


    ld hl, $c600
    push af
    push bc
    push de
    ld b, $10

jr_000_03fd::
    ld a, [hl]
    or a
    jr z, jr_000_040c

    ld de, $0005
    add hl, de
    dec b
    jr nz, jr_000_03fd

    pop de
    pop bc
    pop af
    ret


jr_000_040c::
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


    ld hl, $c65c
    inc [hl]
    ld a, [hl]
    and $03
    ret nz

    ld a, [$c665]
    cp $03
    jr c, jr_000_042a

    and $80
    ret z

jr_000_042a::
    ld hl, $c600
    ld c, $10

jr_000_042f::
    ld a, [hl]
    cp $01
    jr c, jr_000_0440

    jr z, jr_000_0448

    cp $03
    jr c, jr_000_046f

    jr z, jr_000_049b

    jx @+$0085


jr_000_0440::
    ld de, $0005
    add hl, de
    dec c
    jr nz, jr_000_042f

    ret


jr_000_0448::
    push bc
    push hl
    callx @+$00d0
    ld h, $04
    callx @+$00ad
    ld a, [$c658]
    ld l, a
    callx @+$0087
    pop hl
    callx @+$00bd
    jr jr_000_0496

jr_000_046f::
    push bc
    push hl
    callx @+$00a9
    ld h, $08
    callx @+$0086
    ld a, [$c659]
    ld l, a
    callx @+$0060
    pop hl
    callx @+$0096
    jr jr_000_0496

jr_000_0496::
    pop bc
    jx @+$ffac


jr_000_049b::
    push bc
    push hl
    callx @+$007d
    ld h, $10
    callx @+$005a
    ld a, [$c65a]
    ld l, a
    callx @+$0034
    pop hl
    callx @+$006a
    jr jr_000_0496

    push bc
    push hl
    callx @+$0056
    ld h, $17
    callx @+$0033
    ld a, [$c65b]
    ld l, a
    callx call_04e9
    pop hl
    callx @+$0043
    jr jr_000_0496


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
    jr z, jr_000_0500

    ld b, $80
    ld c, l
    ret


jr_000_0500::
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
    jr nc, jr_000_0514

    sub h
    ret nc

    ld d, h

jr_000_0510::
    xor a
    sub e
    ld e, a
    ret


jr_000_0514::
    add h
    cp $a0
    ret c

    ld a, $9f
    sub h
    ld a, d
    jr jr_000_0510

    inc hl
    ld b, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld e, [hl]
    ret


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


    ld a, [$c65d]
    and $03
    jr z, jr_000_057a

    cp $02
    jr z, jr_000_0566

    jr c, jr_000_0552

    ld a, $0a
    ld [$c666], a
    ld hl, $c600
    callx @+$0044
    ld hl, $c605
    jr call_058e

jr_000_0552::
    ld a, $0a
    ld [$c666], a
    ld hl, $c605
    pushx @+$0006
    pushx @+$0030

jr_000_0560::
    ret


    ld hl, $c600
    jr call_058e

jr_000_0566::
    ld a, $f6
    ld [$c666], a
    ld hl, $c64b
    callx @+$001c
    ld hl, $c646
    jr call_058e

jr_000_057a::
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

jr_000_0597::
    ld a, [hl]
    cp $01
    jr c, jr_000_05a6

    jr z, jr_000_05b1

    cp $03
    jr c, jr_000_05c0

    jr z, jr_000_05d3

    jr jr_000_05e2

jr_000_05a6::
    push de
    ld a, [$c666]
    add l
    ld l, a
    pop de
    dec c
    jr nz, jr_000_0597

    ret


jr_000_05b1::
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
    jr jr_000_05ef

jr_000_05c0::
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
    jr jr_000_05ef

jr_000_05cf::
    pop bc
    pop hl
    jr jr_000_05a6

jr_000_05d3::
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
    jr jr_000_05ef

jr_000_05e2::
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

jr_000_05ef::
    ld a, [de]
    cp $80
    jr z, jr_000_060a

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
    jr c, jr_000_05ef

    ld l, $10
    jr jr_000_05ef

jr_000_060a::
    ld a, l
    ld [$c667], a
    ld d, h
    ld e, l
    jr jr_000_05cf

    xor a
    ld [$c65e], a
    ld [$c65f], a
    ld [$c660], a
    ld [$c661], a
    ret


    ld a, [$c660]
    or a
    ret nz

    ldx hl, data_sounds.shot
    ld a, [hl]
    trap PlaySound
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


    ld a, [$c660]
    dec a
    jr z, jr_000_0650

    dec a
    jr z, jr_000_069e

    ret


jr_000_0650::
    ld a, [$c661]
    dec a
    ld [$c661], a
    ret nz

    ld a, $03
    ld [$c661], a
    ld a, [$c65f]
    dec a
    jr z, jr_000_0693

    ld h, $98
    ld [$c65f], a
    dec a
    sla a
    sla a
    sla a
    sla a
    sla a
    jr nc, jr_000_0676

    inc h

jr_000_0676::
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
    jr nc, jr_000_068d

    inc h

jr_000_068d::
    ld l, a
    ld e, $af
    trap MemSet
    ret


jr_000_0693::
    ld a, $02
    ld [$c660], a
    ld a, $0e
    ld [$c65f], a
    ret


jr_000_069e::
    ld h, $98
    ld a, [$c65f]
    dec a
    ld [$c65f], a
    sla a
    sla a
    sla a
    sla a
    sla a
    jr nc, jr_000_06b4

    inc h

jr_000_06b4::
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


    ld a, $50
    ld [$c662], a
    xor a
    ld [$c664], a

Call_000_06d7::
    ret


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
    jr z, jr_000_06f4

    ld a, b
    cp $06
    jr c, jr_000_06f4

    dec b
    dec b

jr_000_06f4::
    ld a, c
    and $10
    jr z, jr_000_0700

    ld a, b
    cp $9b
    jr nc, jr_000_0700

    inc b
    inc b

jr_000_0700::
    ld a, b
    ld [$c662], a
    ld a, c
    and $01
    jr z, jr_000_0710

    callx @+$ff13

jr_000_0710::
    ret


    ld a, [$c665]
    or a
    jr z, jr_000_071a

    cp $03
    ret c

jr_000_071a::
    ld hl, $c664
    ld a, [hl]
    or a
    jr nz, jr_000_0740

    ld a, [$c65c]
    ld l, $b0
    srl a
    srl a
    srl a
    and $04

jr_000_072e::
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


jr_000_0740::
    cp $04
    ret z

    ld hl, $c663
    dec [hl]
    jr nz, jr_000_0754

    ld [hl], $28
    ld hl, $c664
    inc [hl]
    ld a, [hl]
    cp $04
    jr z, jr_000_075f

jr_000_0754::
    ld a, [$c664]
    sla a
    sla a
    ld l, $b4
    jr jr_000_072e

jr_000_075f::
    ld a, $80
    ld [$c665], a
    ret


    ld hl, $0311
    trap MovePen
    ld hl, $c650
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    callx @+$003d
    ld hl, $0d11
    trap MovePen
    pop bc
    ldx hl, data_high_score
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, b
    cp d
    ret c

    jr nz, jr_000_078e

    ld a, c
    cp e
    ret c

    ret z

jr_000_078e::
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
    jr nz, jr_000_07ab

    inc [hl]
    ldx hl, data_sounds.high_score
    ld a, [hl]
    trap PlaySound

jr_000_07ab::
    ldx hl, data_high_score
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $c66e
    trap IntToString
    ld hl, $c66e
    trap DrawString
    ret


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
    jr nc, jr_000_07cf

    inc hl
    inc [hl]

jr_000_07cf::
    callx @+$ff92
    pop hl
    ret


    ld hl, $c665
    ld a, [hl]
    or a
    ret z

    cp $02
    ret z

    jr c, jr_000_0816

    cp $03
    jr nz, jr_000_0805

    inc [hl]
    ldx hl, layout_0a72
    trap DrawLayout
    ld hl, $0b0c
    trap MovePen
    ld a, [$c656]
    inc a
    ld e, a
    ld d, $00
    ld hl, $c66e
    trap IntToString
    trap DrawString
    jx @+$f941


jr_000_0805::
    cp $80
    jr nc, jr_000_081e

    inc [hl]
    cp $5a
    ret c

    xor a
    ld [hl], a
    ldx hl, layout_0ab4
    trap DrawLayout
    ret


jr_000_0816::
    inc [hl]
    ldx hl, layout_0a30
    trap DrawLayout
    ret


jr_000_081e::
    jr nz, jr_000_0833

    ld a, [$c660]
    or a
    ret nz

    inc [hl]
    ldx hl, layout_0ac3
    trap DrawLayout
    xor a
    trap PlayMusic
    xor a
    trap PlaySound
    ret


jr_000_0833::
    cp $c0
    jr c, jr_000_0846

    jr nz, jr_000_0861

    ld a, [$c660]
    or a
    ret nz

    inc [hl]
    ldx hl, layout_0adf
    trap DrawLayout
    ret


jr_000_0846::
    ld a, [$c65c]
    and $0f
    jr nz, jr_000_0853

    inc [hl]
    ld a, [hl]
    cp $c0
    jr z, jr_000_0858

jr_000_0853::
    ldh a, [$8a]
    and $03
    ret z

jr_000_0858::
    ld [hl], $01
    ldx hl, layout_0ad1
    trap DrawLayout
    ret


jr_000_0861::
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


    ld a, [$c660]
    dec a
    jr nz, jr_000_08a1

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
    callx @+$001b

jr_000_08a1::
    ld a, [$c664]
    or a
    ret nz

    ld a, [$c662]
    sub $04
    ld b, a
    ld c, $08
    ld de, $7410
    callx @+$0065
    ret


    ld hl, $c600
    ld a, $10

jr_000_08be::
    push af
    callx @+$0087
    jr c, jr_000_0911

    pop af
    push hl
    ldx hl, data_sounds.hit
    ld a, [hl]
    trap PlaySound
    pop hl
    callx @+$fee7
    ld a, $02
    ld [$c660], a
    ld a, $0e
    ld [$c65f], a
    ld a, [hl]
    dec a
    jr z, jr_000_0902

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
    callx @+$fafb
    ld hl, $c65d
    inc [hl]
    ret


jr_000_0902::
    ld [hl], $00
    ld hl, $c65d
    dec [hl]
    ld a, [hl]
    or a
    ret nz

    ld a, $c0
    ld [$c665], a
    ret


jr_000_0911::
    ld a, $05
    add l
    ld l, a
    pop af
    dec a
    jr nz, jr_000_08be

    ret


    ld a, [$c665]
    or a
    ret nz

    ld hl, $c600
    ld a, $10

jr_000_0924::
    push af
    callx @+$0021
    jr c, jr_000_0941

    pop af
    ldx hl, data_sounds.dead
    ld a, [hl]
    trap PlaySound
    ld a, $01
    ld [$c664], a
    ld a, $3c
    ld [$c663], a
    ret


jr_000_0941::
    ld a, $05
    add l
    ld l, a
    pop af
    dec a
    jr nz, jr_000_0924

    ret


    push hl
    ld a, [hl+]
    cp $01
    jr c, jr_000_095a

    jr z, jr_000_095c

    cp $03
    jr c, jr_000_097c

    jr z, jr_000_0998

    jr jr_000_09b4

jr_000_095a::
    pop hl
    ret


jr_000_095c::
    ld a, [hl]
    sub d
    jr c, jr_000_0979

    sub e
    jr c, jr_000_0967

    sub $08
    jr nc, jr_000_0979

jr_000_0967::
    inc hl
    inc hl
    ld a, [hl]
    add $03
    sub b
    jr c, jr_000_0979

    sub c
    jr c, jr_000_0976

    sub $06
    jr nc, jr_000_0979

jr_000_0976::
    xor a
    jr jr_000_095a

jr_000_0979::
    scf
    jr jr_000_095a

jr_000_097c::
    ld a, [hl]
    sub d
    jr c, jr_000_0979


call_0980:
    sub e
    jr c, jr_000_0987

    sub $10
    jr nc, jr_000_0979

jr_000_0987::
    inc hl
    inc hl
    ld a, [hl]
    add $06
    sub b
    jr c, jr_000_0979

    sub c
    jr c, jr_000_0976

    sub $0c
    jr nc, jr_000_0979

    jr jr_000_0976

jr_000_0998::
    ld a, [hl]
    sub d
    jr c, jr_000_0979

    sub e
    jr c, jr_000_09a3

    sub $20
    jr nc, jr_000_0979

jr_000_09a3::
    inc hl
    inc hl
    ld a, [hl]
    add $0e
    sub b
    jr c, jr_000_0979


call_09ab:
    sub c
    jr c, jr_000_0976

    sub $1c
    jr nc, jr_000_0979

jr_000_09b2::
    jr jr_000_0976

jr_000_09b4::
    ld a, [hl]
    sub d
    jr c, jr_000_0979

    sub e
    jr c, jr_000_09bf

    sub $2c
    jr nc, jr_000_0979

jr_000_09bf::
    inc hl
    inc hl
    ld a, [hl]
    add $14
    sub b
    jr c, jr_000_0979


call_09c7:
    sub c
    jr c, jr_000_0976

    sub $28
    jr nc, jr_000_0979

    jr jr_000_0976


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
    dk $04, $03, "CANNON BALL\n"
    dk $02, $07, "PUSH A to START\n"
    dk $02, $09, "PUSH B to  END\n"
    dk $03, $0c, "SELECT CONFIG\n"
    db $ff

layout_0a72:
    db $04, $03, "           ", $00
    db $02, $07, "               ", $00
    db $02, $09, "              ", $00
    db $03, $0c, " STAGE       ", $00
    db $ff

layout_0ab4:
    db $04, $0c, "           \n"
    db $ff

layout_0ac3:
    db $05, $0c, "GAME  OVER\n"
    db $ff

layout_0ad1:
    db $05, $0c, "          \n"
    db $ff

layout_0adf:
    db $04, $07, "STAGE CLEAR!\n"
    db $ff

layout_0aef:
    db $04, $07, "            \n"
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
    xor $e8
    ld [c], a
    call c, $dfe8
    push de
    adc $e3
    pushx @+$c3cc
    rst $18
    pop de
    add $bb
    ld a, [CartridgeCodeAddress]
    ld de, $1b38
    cp CartridgeCodeSuperBDaman
    jr z, jr_000_0b53

    trap GetAudioCount

jr_000_0b53::
    ld hl, $c652
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, data_sounds.bgm
    ld b, $04
    ld a, [hl]
    cp d
    jr c, jr_000_0b70

    jr z, jr_000_0b70

    ld a, $0a
    ld [$0000], a
    ld [hl], $00
    xor a
    ld [$0000], a

jr_000_0b70::
    inc hl
    ld a, [hl]
    cp e
    jr c, jr_000_0b82

    jr z, jr_000_0b82

    ld a, $0a
    ld [$0000], a
    ld [hl], $00
    xor a
    ld [$0000], a

jr_000_0b82::
    dec b
    jr nz, jr_000_0b70

    ret


data_tileset:
    ; only the first 541 bytes of this data are necessary
    ; the rest contains another 6 copies of the same tile data
    INCBIN "gfx/cannon/tiles.2bpp.hz"

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
