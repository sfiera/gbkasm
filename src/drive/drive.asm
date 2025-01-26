; Disassembly of "drive.gbf"

INCLUDE "src/charmap.inc"
INCLUDE "src/common.inc"
INCLUDE "src/hardware.inc"
INCLUDE "src/macro.inc"
INCLUDE "src/trap.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_ICON | FILE_2BPP | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $69           ; owner code
.title
    dk "DRIVE"
.icon
    INCBIN "out/src/drive/icon.2bpp"
.end

History:
.points
    dw 1
.author
    db " T.OHNISHI", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    jx jp_130b


jp_00fd::
    trap AudioStop
    ld a, $0a
    ld [$0000], a
    ldx de, data_11dc
    ld hl, $cb60
    ld a, [hl+]
    ld [de], a
    ld a, [hl]
    ld [de], a
    xor a
    ld [$0000], a
    trap ExitToMenu


call_0115::
    ld a, $20
    trap DrawInit
    trap AudioStop
    ld b, $c8
    ldx de, data_0d80
    trap ExtractInit
    ldx de, data_11dc
    ld a, [de]
    inc de
    ld l, a
    ld a, [de]
    ld h, a
    trap RandInit
    callx call_0167
    callx call_0295
    ret


call_013d:
    trap LCDDisable
    callx call_01eb
    callx call_0283
    callx call_028c
    callx call_022b
    callx call_098e
    ld a, $03
    trap LCDEnable
    ret


call_0167:
    ld e, $00
    ld bc, $0262
    ld hl, $c900
    trap MemSet
    ld a, $1f
    ld [$c904], a
    ld a, $0a
    ld [$c905], a
    ld a, $0a
    ld [$c907], a
    ld a, $02
    ld [$c92f], a
    ld a, $01
    ld [$c902], a
    ld a, $13
    ld [$c901], a
    ld a, $2e
    ld [$c90a], a
    ld a, $0f
    ld [$cb30], a
    ld a, $a0
    ld [$cb3e], a
    ld bc, VarCB52.end - VarCB50
    ldx de, data_11d0
    ld hl, VarCB50
    trap MemCopy
    ld bc, VarSounds.end - VarSounds
    ldx de, SavedSounds
    ld hl, VarSounds
    trap MemCopy
    ldx hl, SavedMusic
    ld a, [hl]
    ld [VarMusic], a
    callx call_01d2
    ldx hl, data_11dc
    ld a, [hl+]
    ld [$cb60], a
    ld a, [hl]
    ld [$cb61], a
    ret


call_01d2:
    trap AudioGetCount
    ld hl, VarSounds
    ld c, VarSounds.end - VarSounds

jr_000_01d9::
    ld a, [hl]
    cp e
    jr c, jr_000_01e0

    jr z, jr_000_01e0

    xor a

jr_000_01e0::
    ld [hl+], a
    dec c
    jr nz, jr_000_01d9

    ld a, [hl]
    cp d
    ret c

    ret z

    xor a
    ld [hl], a
    ret


call_01eb:
    ld bc, $2800
    trap $c4
    ld c, $28
    ldx de, data_1126
    ld hl, $c302

jr_000_01f9::
    ld a, [de]
    inc de
    ld [hl+], a
    inc hl
    inc hl
    inc hl
    dec c
    jr nz, jr_000_01f9

    ld bc, $0000
    callx call_07c0
    xor a
    callx call_120b
    ld a, $04
    ld [$cb33], a
    ld a, $50
    ld [$c380], a
    ld [$c384], a
    ld [$c388], a
    ld [$c38c], a
    ld [$c390], a
    ret


call_022b:
    ld de, VarCB52
    ld hl, $c352
    callx call_0a00
    ld a, $78
    ld b, $30
    ld c, $06
    ld hl, $c368

jr_000_0241::
    ld [hl], b
    inc hl
    ld [hl+], a
    inc hl
    inc hl
    add $08
    dec c
    jr nz, jr_000_0241

    ld a, $78
    ld b, $18
    ld c, $06
    ld hl, $c350

jr_000_0254::
    ld [hl], b
    inc hl
    ld [hl+], a
    inc hl
    inc hl
    add $08
    dec c
    jr nz, jr_000_0254

    ld a, $78
    ld [$c341], a
    add $08
    ld [$c345], a
    ld a, $10
    ld [$c340], a
    ld [$c344], a
    ld a, $78
    ld [$c349], a
    add $08
    ld [$c34d], a
    ld a, $28
    ld [$c348], a
    ld [$c34c], a
    ret


call_0283:
    ld bc, $00b0
    ld de, $9410
    trap ExtractData
    ret


call_028c:
    ld bc, $00c0
    ld de, $9610
    trap ExtractData
    ret


call_0295:
    ld bc, $03c0
    ld de, $8000
    trap ExtractData
    ret


call_029e::
    trap AwaitFrame
    ldh a, [$8a]
    and a
    jr nz, call_029e

    ret


call_02a6::
    trap AwaitFrame
    ldh a, [$8a]
    and a
    jr z, call_02a6

    ret


call_02ae:
    callx call_029e
    callx call_02a6
    callx call_029e
    ret


call_02c4:
    ld a, [$c92d]
    and a
    ret z

jr_000_02c9::
    push af
    callx call_02d6
    pop af
    dec a
    jr nz, jr_000_02c9

    ret


call_02d6:
    ldh a, [$9a]
    and $07
    jr nz, jr_000_02f6

    callx call_03b3
    callx call_038c
    ld a, [$c904]
    sub $01
    jr nc, jr_000_02f3

    ld a, $1f

jr_000_02f3::
    ld [$c904], a

jr_000_02f6::
    ldh a, [$9a]
    dec a
    ldh [$9a], a
    ret


call_02fc:
    ld a, [$c92d]
    and a
    ret z

jr_000_0301::
    push af
    callx call_0322
    pop af
    dec a
    jr nz, jr_000_0301

    ld a, [$cb31]
    and a
    ret nz

    ldh a, [$8a]
    bit 0, a
    ret z

    ld a, $01
    ld [$cb31], a
    ld a, [VarSounds.4]
    trap AudioPlaySound
    ret


call_0322:
    ld a, [$c90c]
    and a
    ret nz

    ldh a, [$8a]
    bit 5, a
    jr z, jr_000_0334

    callx call_0342

jr_000_0334::
    ldh a, [$8a]
    bit 4, a
    jr z, jr_000_0341

    callx call_0348

jr_000_0341::
    ret


call_0342:
    ldh a, [$9b]
    dec a
    ldh [$9b], a
    ret


call_0348:
    ldh a, [$9b]
    inc a
    ldh [$9b], a
    ret


call_034e:
    trap LCDDisable
    ld a, $01
    ld [$c90c], a
    xor a
    ld [$c90b], a
    ld a, [$c904]
    push af
    inc a
    and $1f
    ld [$c904], a
    ld c, $12

jr_000_0365::
    push bc
    callx call_03b3
    callx call_038c
    ld a, [$c904]
    inc a
    ld [$c904], a
    pop bc
    dec c
    jr nz, jr_000_0365

    pop af
    ld [$c904], a
    xor a
    ld [$c90c], a
    ld a, $03
    trap LCDEnable
    ret


call_038c:
    ld a, [$c904]
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
    sla c
    rl b
    ld hl, $9800
    add hl, bc
    ld bc, $0020
    ld de, $c90d
    trap MemCopy
    ret


call_03b3:
    callx call_05a1
    ld e, $41
    ld bc, $0020
    ld hl, $c90d
    trap MemSet
    callx call_04a1
    ld a, [$c907]
    inc a
    srl a
    ld c, a
    ld a, [$c905]
    sub c
    and $1f
    ld [$c908], a
    ld c, a
    ld a, [$c907]
    add c
    dec a
    and $1f
    ld [$c909], a
    callx call_0725
    callx call_043d
    callx call_0458
    callx call_075b
    callx call_0416
    ld a, [$cb30]
    ld b, $00
    ld c, a
    dec a
    and $0f
    ld [$cb30], a
    ret


call_0416:
    ld a, [$cb30]
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
    sla c
    rl b
    ld hl, $c930
    add hl, bc
    ld bc, $0020
    ld de, $c90d
    trap MemCopy
    ret


call_043d:
    ld a, [$c907]
    ld e, a
    ld b, $00
    ld a, [$c908]
    ld c, a

jr_000_0447::
    ld hl, $c90d
    ld a, c
    and $1f
    ld c, a
    add hl, bc
    ld a, [$c90a]
    ld [hl], a
    inc c
    dec e
    jr nz, jr_000_0447

    ret


call_0458:
    ld a, [$c90b]
    ld b, $00
    ld c, a
    sla c
    rl b
    ldx hl, data_048b
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    dec hl
    add hl, bc
    push hl
    ld a, [$c908]
    dec a
    and $1f
    ld b, $00
    ld c, a
    ld hl, $c90d
    add hl, bc
    ld e, l
    ld d, h
    ld a, [$c909]
    inc a
    and $1f
    ld b, $00
    ld c, a
    ld hl, $c90d
    add hl, bc
    ret


data_048b:
    dw code_0517 - @
    dw code_051e - @
    dw code_0533 - @
    dw code_0548 - @
    dw code_054f - @
    dw code_0556 - @
    dw code_0565 - @
    dw code_056c - @
    dw code_057d - @
    dw code_0597 - @
    dw code_059c - @


call_04a1:
    ld a, [$c90b]
    ld b, $00
    ld c, a
    sla c
    rl b
    ldx hl, data_04bb
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    dec hl
    add hl, bc
    push hl
    ld hl, $c907
    ret


data_04bb:
    dw code_04d1 - @
    dw code_04d2 - @
    dw code_04d3 - @
    dw code_04d4 - @
    dw code_04d9 - @
    dw code_04e6 - @
    dw code_04e7 - @
    dw code_04ea - @
    dw code_04f4 - @
    dw code_04d1 - @
    dw code_04d1 - @


code_04d1:
    ret


code_04d2:
    ret


code_04d3:
    ret


code_04d4:
    dec [hl]
    callx call_0505
    ret


code_04d9:
    dec [hl]
    callx call_04f5
    ret


code_04e6:
    ret


code_04e7:
    dec [hl]
    dec [hl]
    ret


code_04ea:
    ld a, [$c905]
    inc a
    and $1f
    ld [$c905], a
    ret


code_04f4:
    ret


call_04f5:
    ld a, [$c907]
    and $01
    ld c, a
    ld a, [$c905]
    add c
    and $1f
    ld [$c905], a
    ret


call_0505:
    ld a, [$c907]
    and $01
    xor $01
    ld c, a
    ld a, [$c905]
    sub c
    and $1f
    ld [$c905], a
    ret


code_0517:
    ld a, $42
    ld [de], a
    ld a, $43
    ld [hl], a
    ret


code_051e:
    ld a, $42
    ld [de], a
    ld a, $48
    ld [hl], a
    ld a, [$c907]
    inc a
    ld [$c907], a
    callx call_04f5
    ret


code_0533:
    ld a, $47
    ld [de], a
    ld a, $43
    ld [hl], a
    ld a, [$c907]
    inc a
    ld [$c907], a
    callx call_0505
    ret


code_0548:
    ld a, $42
    ld [de], a
    ld a, $46
    ld [hl], a
    ret


code_054f:
    ld a, $45
    ld [de], a
    ld a, $43
    ld [hl], a
    ret


code_0556:
    ld a, $47
    ld [de], a
    ld a, $48
    ld [hl], a
    ld a, [$c907]
    inc a
    inc a
    ld [$c907], a
    ret


code_0565:
    ld a, $45
    ld [de], a
    ld a, $46
    ld [hl], a
    ret


code_056c:
    ld a, $45
    ld [de], a
    ld a, [$c909]
    ld b, $00
    ld c, a
    ld hl, $c90d
    add hl, bc
    ld a, $48
    ld [hl], a
    ret


code_057d:
    ld a, $47
    ld [de], a
    ld a, [$c909]
    ld b, $00
    ld c, a
    ld hl, $c90d
    add hl, bc
    ld a, $46
    ld [hl], a
    ld a, [$c905]
    dec a
    and $1f
    ld [$c905], a
    ret


code_0597:
    ld a, $49
    ld [de], a
    ld [hl], a
    ret


code_059c:
    ld a, $4a
    ld [de], a
    ld [hl], a
    ret


call_05a1:
    ld a, $20
    ld [$c90a], a
    ld a, [$c902]
    and a
    jr nz, jr_000_05b3

    callx call_06c2

jr_000_05b3:
    ld a, [$c900]
    ld b, $00
    ld c, a
    sla c
    rl b
    ldx hl, data_05ca
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    dec hl
    add hl, bc
    push hl
    ret


data_05ca:
    dw code_05da - @
    dw code_05ee - @
    dw code_0602 - @
    dw code_0616 - @
    dw code_0656 - @
    dw code_0671 - @
    dw code_068c - @
    dw code_06a7 - @


code_05da:
    ld hl, $c901
    dec [hl]
    jr z, jr_000_05e6

    ld a, $00
    ld [$c90b], a
    ret


jr_000_05e6::
    xor a
    ld [$c902], a
    jx call_05a1


code_05ee:
    ld hl, $c901
    dec [hl]
    jr z, jr_000_05fa

    ld a, $07
    ld [$c90b], a
    ret


jr_000_05fa::
    xor a
    ld [$c902], a
    jx call_05a1


code_0602:
    ld hl, $c901
    dec [hl]
    jr z, jr_000_060e

    ld a, $08
    ld [$c90b], a
    ret


jr_000_060e::
    xor a
    ld [$c902], a
    jx call_05a1


code_0616:
    ld a, [$c903]
    and a
    jr z, jr_000_0627

    dec a
    jr z, jr_000_0647

    xor a
    ld [$c902], a
    jx call_05a1


jr_000_0627::
    ld hl, $c901
    dec [hl]
    jr z, jr_000_0633

    ld a, $00
    ld [$c90b], a
    ret


jr_000_0633::
    ld hl, $c903
    inc [hl]
    ld a, $09
    ld [$c90b], a
    ld a, $49
    ld [$c90a], a
    ld a, $01
    ld [$cb35], a
    ret


jr_000_0647::
    ld hl, $c903
    inc [hl]
    ld a, $0a
    ld [$c90b], a
    ld a, $4a
    ld [$c90a], a
    ret


code_0656:
    ld a, [$c907]
    cp $10
    jr c, jr_000_0665

jr_000_065d::
    xor a
    ld [$c902], a
    jx call_05a1


jr_000_0665::
    ld hl, $c901
    dec [hl]
    jr z, jr_000_065d

    ld a, $01
    ld [$c90b], a
    ret


code_0671:
    ld a, [$c907]
    cp $10
    jr c, jr_000_0680

jr_000_0678::
    xor a
    ld [$c902], a
    jx call_05a1


jr_000_0680::
    ld hl, $c901
    dec [hl]
    jr z, jr_000_0678

    ld a, $02
    ld [$c90b], a
    ret


code_068c:
    ld a, [$c907]
    cp $07
    jr nc, jr_000_069b

jr_000_0693::
    xor a
    ld [$c902], a
    jx call_05a1


jr_000_069b::
    ld hl, $c901
    dec [hl]
    jr z, jr_000_0693

    ld a, $03
    ld [$c90b], a
    ret


code_06a7:
    ld a, [$c907]
    cp $07
    jr nc, jr_000_06b6

jr_000_06ae::
    xor a
    ld [$c902], a
    jx call_05a1


jr_000_06b6::
    ld hl, $c901
    dec [hl]
    jr z, jr_000_06ae

    ld a, $04
    ld [$c90b], a
    ret


call_06c2::
    ld a, [$cb3d]
    and a
    jr nz, jr_000_06cf

    ld a, [$c900]
    cp $04
    jr c, jr_000_06d5

jr_000_06cf::
    xor a
    ld [$c900], a
    jr jr_000_06dc

jr_000_06d5::
    callx call_070b

jr_000_06dc::
    callx call_0713
    ld a, [$c901]
    and a
    jr z, call_06c2

    ld a, $01
    ld [$c902], a
    xor a
    ld [$c903], a
    ld a, [$c900]
    cp $03
    ret nz

    ld a, $20
    ld [$cb35], a
    ld a, [VarSounds.6]
    trap AudioPlaySound
    xor a
    callx call_0835
    ret


call_070b:
    trap RandNext
    and $07
    ld [$c900], a
    ret


call_0713:
    trap RandNext

jr_000_0715::
    sub $13
    jr nc, jr_000_0715

    add $13
    cp $03
    jr nc, jr_000_0721

    ld a, $03

jr_000_0721::
    ld [$c901], a
    ret


call_0725:
    ld a, [$cb36]
    and a
    ret nz

    ld a, [$c90c]
    and a
    ret nz

    trap RandNext
    and $1f
    cp $07
    ret nz

    trap RandNext
    and $03
    ret z

    ld [$cb36], a
    trap RandNext
    and $07
    add $05
    ld [$cb38], a
    ld a, $20
    ld [$cb35], a
    ld a, [VarSounds.6]
    trap AudioPlaySound
    ld a, $01
    callx call_0835
    ret


call_075b:
    ld a, [$cb36]
    and a
    ret z

    ld a, [$cb38]
    and a
    jr z, jr_000_0772

    dec a
    ld [$cb38], a
    ret nz

    ld a, [$c905]
    ld [$cb37], a
    ret


jr_000_0772::
    callx call_077a
    ret


call_077a:
    ld a, [$cb36]
    and $7f
    sla a
    sla a
    add $5d
    ld c, a
    ld a, [$cb36]
    and $80
    rlca
    xor $01
    sla a
    add c
    ld e, a
    ld a, [$cb37]
    ld b, $00
    ld c, a
    ld hl, $c90d
    add hl, bc
    ld a, e
    ld [hl], a
    inc e
    ld a, [$cb37]
    inc a
    and $1f
    ld b, $00
    ld c, a
    ld hl, $c90d
    add hl, bc
    ld a, e
    ld [hl], a
    ld a, [$cb36]
    bit 7, a
    jr nz, jr_000_07bb

    or $80
    ld [$cb36], a
    ret


jr_000_07bb::
    xor a
    ld [$cb36], a
    ret


call_07c0:
    ld a, $78
    add c
    ld [$c300], a
    ld [$c304], a
    add $08
    ld [$c308], a
    ld [$c30c], a
    ld a, $52
    add b
    ld [$c301], a
    ld [$c309], a
    add $08
    ld [$c305], a
    ld [$c30d], a
    ret


call_07e3:
    ld a, [$cb32]
    and a
    jr nz, jr_000_07f7

    xor a
    ld [$c310], a
    ld [$c314], a
    ld [$c318], a
    ld [$c31c], a
    ret


jr_000_07f7::
    srl a
    srl a
    srl a
    srl a
    sla a
    sla a
    add $15
    ld [$c312], a
    inc a
    ld [$c316], a
    inc a
    ld [$c31a], a
    inc a
    ld [$c31e], a
    ld a, $52
    ld [$c311], a
    ld [$c319], a
    add $08
    ld [$c315], a
    ld [$c31d], a
    ld a, $78
    ld [$c310], a
    ld [$c314], a
    add $08
    ld [$c318], a
    ld [$c31c], a
    ret


call_0835:
    sla a
    sla a
    add $1d
    ld [$c322], a
    inc a
    ld [$c326], a
    inc a
    ld [$c32a], a
    inc a
    ld [$c32e], a
    ret


call_084b:
    ld a, [$cb3d]
    and a
    ret z

    ld a, [$cb3e]
    callx call_087b
    ld a, [$cb3e]
    dec a
    ld [$cb3e], a
    cp $d8
    ret nz

    xor a
    ld [$cb3d], a
    ld [$c90c], a
    ld [$c380], a
    ld [$c384], a
    ld [$c388], a
    ld [$c38c], a
    ld [$c390], a
    ret


call_087b:
    ld b, a
    ld c, $05
    ld de, $0004
    ld hl, $c381

jr_000_0884::
    ld a, b
    cp $a8
    jr c, jr_000_088a

    xor a

jr_000_088a::
    ld [hl], a
    add hl, de
    ld a, b
    add $08
    ld b, a
    dec c
    jr nz, jr_000_0884

    ret


call_0894:
    callx call_125a
    callx call_08e6
    callx call_090c
    ld a, $08
    ld [$cb3f], a

jr_000_08ae::
    callx call_08ca
    ld a, $02
    callx call_11de
    ld a, [$cb3f]
    inc a
    ld [$cb3f], a
    cp $62
    jr c, jr_000_08ae

    ret


call_08ca:
    ld b, a
    ld c, $08
    ld de, $fffc
    ld hl, $c39c

jr_000_08d3::
    ld a, b
    sub $02
    jr nc, jr_000_08d9

    xor a

jr_000_08d9::
    ld b, a
    cp $50
    jr c, jr_000_08e0

    ld a, $50

jr_000_08e0::
    ld [hl], a
    add hl, de
    dec c
    jr nz, jr_000_08d3

    ret


call_08e6:
    ld de, $0004
    ld hl, $c382
    ld a, $37
    ld [hl], a
    add hl, de
    ld a, $35
    ld [hl], a
    add hl, de
    ld a, $38
    ld [hl], a
    add hl, de
    ld a, $39
    ld [hl], a
    add hl, de
    ld a, $3a
    ld [hl], a
    add hl, de
    ld a, $3b
    ld [hl], a
    add hl, de
    ld a, $39
    ld [hl], a
    add hl, de
    ld a, $36
    ld [hl], a
    ret


call_090c:
    ld c, $08
    ld e, $68
    ld hl, $c39d

jr_000_0913::
    ld a, e
    ld [hl-], a
    sub $08
    ld e, a
    ld a, $08
    ld [hl-], a
    dec hl
    dec hl
    dec c
    jr nz, jr_000_0913

    ret


call_0921:
    ld a, [$cb31]
    and a
    ret z

    dec a
    jr z, jr_000_094d

    dec a
    jr z, jr_000_0977

jr_000_092c::
    ld a, [$cb32]
    dec a
    jr nz, jr_000_0935

    ld [$cb31], a

jr_000_0935::
    ld [$cb32], a
    srl a
    ld b, a
    cpl
    inc a
    ld c, a
    callx call_07c0
    callx call_07e3
    ret


jr_000_094d::
    ld a, [$cb32]
    inc a
    cp $20
    jr c, jr_000_095f

    xor a
    ld [$cb32], a
    ld hl, $cb31
    inc [hl]
    jr jr_000_0977

jr_000_095f::
    ld [$cb32], a
    srl a
    ld b, a
    cpl
    inc a
    ld c, a
    callx call_07c0
    callx call_07e3
    ret


jr_000_0977::
    ld a, [$cb32]
    inc a
    cp $08
    jr c, jr_000_098a

    ld a, $1f
    ld [$cb32], a
    ld hl, $cb31

Jump_000_0987::
    inc [hl]
    jr jr_000_092c

jr_000_098a::
    ld [$cb32], a
    ret


call_098e:
    callx call_09c3
    ld de, $cb3b
    ld hl, $c36a
    callx call_0a00
    callx call_09df
    ret nc

    ld bc, VarCB52.end - VarCB50
    ld de, $cb39
    ld hl, VarCB50
    trap MemCopy
    ld de, VarCB52
    ld hl, $c352
    callx call_0a00
    ret


call_09c3:
    xor a
    ld c, a
    ld hl, $cb39

jr_000_09c8::
    inc c
    ld a, c
    cp $04
    jr nc, jr_000_09d6

    ld a, [hl]
    add $01
    daa
    ld [hl+], a
    jr z, jr_000_09c8

    ret


jr_000_09d6::
    ld a, $99
    ld hl, $cb39
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ret


call_09df:
    ld c, $03
    ld de, $cb3b
    ld hl, VarCB52

jr_000_09e7::
    ld a, [de]
    dec de
    ld b, a
    ld a, [hl-]
    sub b
    ret nz

    dec c
    jr nz, jr_000_09e7

    ld a, [$cb3c]
    and a
    ret nz

    ld a, $01
    ld [$cb3c], a
    ld a, [VarSounds.8]
    trap AudioPlaySound
    ret


call_0a00:
    ld c, $03

jr_000_0a02::
    ld a, [de]
    srl a
    srl a
    srl a
    srl a
    add $25
    ld [hl+], a
    inc hl
    inc hl
    inc hl
    ld a, [de]
    dec de
    and $0f
    add $25
    ld [hl+], a
    inc hl
    inc hl
    inc hl
    dec c
    jr nz, jr_000_0a02

    ret


call_0a1f:
    ld a, $0c
    trap DrawCtrlChar
    ld a, $03
    trap LCDEnable
    callx call_0a9d
    callx call_0abe
    callx call_0b1a
    ld bc, $4010
    ld e, $04

jr_000_0a41::
    callx call_0b86
    bit 0, a
    jr nz, jr_000_0a52

    bit 3, a
    jr nz, jr_000_0a52

    jr jr_000_0a41

jr_000_0a52::
    callx call_029e
    ld a, [VarSounds.2]
    trap AudioPlaySound
    ld a, [$cb40]
    and a
    jr nz, jr_000_0a65

    ret


jr_000_0a65::
    dec a
    jr nz, jr_000_0a6c

    jx jp_0bd0


jr_000_0a6c:
    dec a
    jr nz, jr_000_0a73

    jx jp_0a77


jr_000_0a73::
    jx jp_00fd


jp_0a77::
    ld hl, VarCB50
    xor a
    ld [hl+], a
    ld a, $30
    ld [hl+], a
    xor a
    ld [hl], a
    ld a, $0a
    ld [$0000], a
    ldx hl, data_11d0
    xor a
    ld [hl+], a
    ld a, $30
    ld [hl+], a
    xor a
    ld [hl], a
    xor a
    ld [$0000], a
    xor a
    ld [$cb40], a
    jx call_0a1f


call_0a9d:
    ld hl, $c300
    ld a, $40
    ld [hl+], a
    ld a, $a8
    ld [hl+], a
    ld a, $10
    ld [hl+], a
    inc hl
    ld a, $40
    ld [hl+], a
    ld a, $b0
    ld [hl+], a
    ld a, $11
    ld [hl+], a
    inc hl
    ld a, $40
    ld [hl+], a
    ld a, $b8
    ld [hl+], a
    ld a, $12
    ld [hl], a
    ret


call_0abe:
    ld c, $80

jr_000_0ac0::
    push bc
    ld a, $02
    callx call_11de
    callx call_12cf
    pop bc
    ldh a, [$8a]
    and a
    jr nz, jr_000_0afd

    ld hl, $c300
    ld a, c
    and $01
    ld b, a
    ld a, $3f
    sub b
    ld [hl+], a
    ld a, [hl]
    dec a
    ld [hl+], a
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    dec a
    ld [hl+], a
    sla b
    ld a, $13
    sub b
    ld [hl+], a
    inc hl
    inc hl
    ld a, [hl]
    dec a
    ld [hl+], a
    ld a, $14
    sub b
    ld [hl], a
    dec c
    jr nz, jr_000_0ac0

jr_000_0afd::
    callx call_029e
    ld hl, $c300
    ld a, $40
    ld [hl+], a
    ld a, $28
    ld [hl+], a
    inc hl
    ld a, [hl]
    or $20
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl+], a
    inc hl
    inc hl
    ld [hl+], a
    ld [hl], a
    ret


call_0b1a:
    ld hl, $0403
    trap DrawAt
    ldx hl, data_114e
    trap DrawString
    ld hl, $0706
    trap DrawAt
    ldx hl, data_1164
    trap DrawString
    ld hl, $0708
    trap DrawAt
    ldx hl, data_116a
    trap DrawString
    ld hl, $070a
    trap DrawAt
    ldx hl, data_1175
    trap DrawString
    ld hl, $070c
    trap DrawAt
    ldx hl, data_117f
    trap DrawString
    ld hl, $cb46
    ld a, $48
    ld [hl+], a
    ld a, $49
    ld [hl+], a
    ld a, $3a
    ld [hl+], a
    ld c, $03
    ld de, VarCB52

jr_000_0b62::
    ld a, [de]
    dec de
    ld b, a
    srl a
    srl a
    srl a
    srl a
    add $30
    ld [hl+], a
    ld a, b
    and $0f
    add $30
    ld [hl+], a
    dec c
    jr nz, jr_000_0b62

    xor a
    ld [hl], a
    ld hl, $050f
    trap DrawAt
    ld hl, $cb46
    trap DrawString
    ret


call_0b86::
    ldh a, [$8a]
    and a
    jr z, call_0b86

    bit 6, a
    jr nz, jr_000_0bbf

    bit 2, a
    jr nz, jr_000_0bae

    bit 7, a
    jr nz, jr_000_0bae

    ret


jr_000_0b98::
    ld a, [$cb40]
    ld d, a
    xor a

jr_000_0b9d::
    add c
    dec d
    jr nz, jr_000_0b9d

    add b
    ld [$c300], a
    callx call_029e
    jr call_0b86

jr_000_0bae::
    ld hl, $cb40
    ld a, [hl]
    inc a
    cp e
    jr c, jr_000_0bb7

    xor a

jr_000_0bb7::
    ld [hl], a
    ld a, [VarSounds.1]
    trap AudioPlaySound
    jr jr_000_0b98

jr_000_0bbf::
    ld hl, $cb40
    ld a, [hl]
    and a
    jr nz, jr_000_0bc7

    ld a, e

jr_000_0bc7::
    dec a
    ld [hl], a
    ld a, [VarSounds.1]
    trap AudioPlaySound
    jr jr_000_0b98


jp_0bd0::
    ld a, $0c
    trap DrawCtrlChar
    trap AudioGetCount
    ld a, d
    ld [$cb5c], a
    ld a, e
    ld [$cb5d], a
    callx call_0ca8
    ld a, $30
    ld [$c300], a
    ld a, $20
    ld [$c301], a
    xor a
    ld [$cb40], a

jp_0bf3::
    ld a, $02
    callx call_11de
    callx call_0d1b
    ld bc, $3008
    ld e, $09
    callx call_0b86
    bit 1, a
    jr nz, jr_000_0c21

    bit 4, a
    jr nz, jr_000_0c40

    bit 5, a
    jr nz, jr_000_0c66

    bit 0, a
    jr nz, jr_000_0c7e

    jr jp_0bf3

jr_000_0c21::
    xor a
    ld [$cb40], a
    ld a, $0a
    ld [$0000], a
    ld bc, VarMusic.end - VarSounds
    ld de, VarSounds
    ldx hl, SavedSounds
    trap MemCopy
    xor a
    ld [$0000], a
    trap AudioStop
    jx call_0a1f


jr_000_0c40::
    ld a, [$cb40]
    ld hl, VarSounds
    ld c, a
    ld b, $00
    add hl, bc
    cp $08
    jr nc, jr_000_0c5a

    ld a, [$cb5d]
    ld c, a
    ld a, [hl]
    cp c
    jr nc, jp_0bf3

    inc a
    ld [hl], a
    jr jp_0bf3

jr_000_0c5a::
    ld a, [$cb5c]
    ld c, a
    ld a, [hl]
    cp c
    jr nc, jp_0bf3

    inc a
    ld [hl], a
    jr jp_0bf3

jr_000_0c66::
    ld a, [$cb40]
    ld hl, VarSounds
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    and a
    jr nz, jr_000_0c78

    jx jp_0bf3


jr_000_0c78::
    dec a
    ld [hl], a
    jx jp_0bf3


jr_000_0c7e::
    ld a, [$cb40]
    ld hl, VarSounds
    ld c, a
    ld b, $00
    add hl, bc
    cp $08
    jr nc, jr_000_0c9a

    ld a, [hl]
    trap AudioPlaySound
    callx call_029e
    jx jp_0bf3


jr_000_0c9a::
    ld a, [hl]
    trap AudioPlayMusic
    callx call_029e
    jx jp_0bf3


call_0ca8::
    xor a
    ld [$cb40], a
    ld hl, $0602
    trap DrawAt
    ldx hl, data_1187
    trap DrawString
    ld hl, $0404
    trap DrawAt
    ldx hl, data_1193
    trap DrawString
    ld hl, $0405
    trap DrawAt
    ldx hl, data_1199
    trap DrawString
    ld hl, $0406
    trap DrawAt
    ldx hl, data_119f
    trap DrawString
    ld hl, $0407
    trap DrawAt
    ldx hl, data_11a6
    trap DrawString
    ld hl, $0408
    trap DrawAt
    ldx hl, data_11ae
    trap DrawString
    ld hl, $0409
    trap DrawAt
    ldx hl, data_11b5
    trap DrawString
    ld hl, $040a
    trap DrawAt
    ldx hl, data_11bb
    trap DrawString
    ld hl, $040b
    trap DrawAt
    ldx hl, data_11c5
    trap DrawString
    ld hl, $040c
    trap DrawAt
    ldx hl, data_11cc
    trap DrawString
    ret


call_0d1b:
    ld c, $09

jr_000_0d1d::
    ld a, $09
    sub c
    ld b, a
    ld hl, VarSounds
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    ld e, a
    ld d, $00
    ld hl, $cb41
    trap StrConvHex
    push hl
    ld h, $0e
    ld a, b
    add $04
    ld l, a
    trap DrawAt
    pop hl
    trap DrawString
    dec c
    jr nz, jr_000_0d1d

    ret


call_0d41:
    ld a, [$cb31]
    and a
    ret nz

    ld a, [$cb30]
    dec a
    and $0f
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
    sla c
    rl b
    ld hl, $c930
    add hl, bc
    ldh a, [$9b]
    srl a
    srl a
    srl a
    add $0a
    and $1f

jr_000_0d73::
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl]
    sub $20
    jr z, jr_000_0d7e

    scf
    ret


jr_000_0d7e::
    and a
    ret


data_0d80:
    INCBIN "out/src/drive/tiles.hz"

data_1126:
    db $00, $01, $02, $03
    db $15, $16, $17, $18
    db $1d, $1e, $1f, $20
    db $08, $09, $0a, $0b
    db $2f, $30, $31, $32
    db $25, $25, $25, $25
    db $25, $25, $25, $25
    db $25, $25, $25, $25
    db $33, $34, $35, $36
    db $34, $00, $00, $00

data_114e:
    dk "ジャカジャカジャンプでポン\0"
data_1164:
    dh "スタート\0"
data_116a:
    dh "サウンドセッテイ\0"
data_1175:
    dh "ハイスコア　ケス\0"
data_117f:
    dh "シュウリョウ\0"
data_1187:
    dh "サウンド　モード\0"
data_1193:
    dk "せんたく\0"
data_1199:
    dk "けってい\0"
data_119f:
    dh "ポーズ\0"
data_11a6:
    dh "ジャンプ\0"
data_11ae:
    dk "ばくはつ\0"
data_11b5:
    dk "けいこく\0"
data_11bb:
    dh "レベルアップ\0"
data_11c5:
    dh "ハイスコア\0"
data_11cc:
    dk "BGM\0"

data_11d0:
    db $00, $30
    db $00
SavedSounds:
.1  db $01
.2  db $02
.3  db $2e
.4  db $1f
.5  db $0f
.6  db $36
.7  db $37
.8  db $1e
SavedMusic:
    db $05

data_11dc:
    db $34, $12


call_11de::
    push af
    trap AwaitFrame
    pop af
    dec a
    jr nz, call_11de

    ret


call_11e6:
    ld a, [$cb31]
    and a
    ret nz

    ld hl, $cb33
    dec [hl]
    ret nz

    ld a, $04
    ld [hl], a
    ld a, [$cb34]
    xor $04
    ld [$cb34], a
    push af
    srl a
    srl a
    ld c, a
    ld b, $00
    callx call_07c0
    pop af

call_120b:
    ld [$c302], a
    inc a
    ld [$c306], a
    inc a
    ld [$c30a], a
    inc a
    ld [$c30e], a
    ret


call_121b:
    xor a
    ld [$cb34], a
    ld c, $0f

jr_000_1221::
    ld a, [$cb34]
    add $08
    ld [$c302], a
    inc a
    ld [$c306], a
    inc a
    ld [$c30a], a
    inc a
    ld [$c30e], a
    ld a, [$cb34]
    xor $04
    ld [$cb34], a
    ld a, $05
    callx call_11de
    dec c
    jr nz, jr_000_1221

    ret


call_124a:
    ld a, [$cb35]
    and a
    ret z

    ld a, [$cb35]
    dec a
    ld [$cb35], a
    srl a
    jr c, jr_000_1268

call_125a:
    xor a
    ld [$c320], a
    ld [$c324], a
    ld [$c328], a
    ld [$c32c], a
    ret


jr_000_1268::
    ld a, $52
    ld [$c321], a
    ld [$c329], a
    add $08
    ld [$c325], a
    ld [$c32d], a
    ld a, $18
    ld [$c320], a
    ld [$c324], a
    add $08
    ld [$c328], a
    ld [$c32c], a
    ret


call_1289:
    ld a, [$cb5e]
    ld l, a
    ld a, [$cb5f]
    ld h, a
    inc hl
    bit 1, h
    jr z, jr_000_12ab

    ld a, [$c92f]
    inc a
    cp $14
    jr c, jr_000_12a0

    ld a, $02

jr_000_12a0::
    ld [$c92f], a
    ld a, [VarSounds.7]
    trap AudioPlaySound
    ld hl, $0000

jr_000_12ab::
    ld a, l
    ld [$cb5e], a
    ld a, h
    ld [$cb5f], a
    ret


call_12b4:
    ld a, [$c92f]
    ld b, a
    ld a, [$c92e]
    add b
    ld [$c92e], a
    srl a
    srl a
    ld [$c92d], a
    ld a, [$c92e]
    and $03
    ld [$c92e], a
    ret


call_12cf:
    trap RandNext
    ld b, a
    xor c
    ld c, a
    ld a, [$cb60]
    ld l, a
    ld a, [$cb61]
    ld h, a
    inc hl
    add hl, bc
    ld a, l
    ld [$cb60], a
    ld a, h
    ld [$cb61], a
    ret


call_12e7:
    ldh a, [$8a]
    bit 3, a
    ret z

    ld a, [VarSounds.3]
    trap AudioPlaySound
    callx call_029e

jr_000_12f8::
    ldh a, [$8a]
    bit 3, a
    jr z, jr_000_12f8

    ld a, [VarSounds.3]
    trap AudioPlaySound
    callx call_029e
    ret


jp_130b:
    ld sp, $e000
    callx call_0115
    callx call_0a1f
    callx call_013d
    callx call_034e
    ld a, $01
    ld [$c90c], a
    ld [$cb3d], a
    ld a, [VarMusic]
    trap AudioPlayMusic

jp_1337::
    ld a, $01
    callx call_11de
    callx call_098e
    callx call_02fc
    callx call_0921
    callx call_11e6
    callx call_124a
    callx call_084b
    callx call_12b4
    callx call_02c4
    callx call_0d41
    jr c, jr_000_139a

    callx call_1289
    callx call_12cf
    callx call_12e7
    jx jp_1337


jr_000_139a::
    xor a
    trap AudioPlayMusic
    ld a, [VarSounds.5]
    trap AudioPlaySound
    callx call_121b
    callx call_0894
    callx call_02ae
    ld a, $0a
    ld [$0000], a
    ld bc, VarMusic.end - VarCB50
    ld de, VarCB50
    ldx hl, data_11d0
    trap MemCopy
    xor a
    ld [$0000], a
    jx Main


SECTION "Variables", WRAM0[$cb50]

VarCB50:
    ds 2
VarCB52:
    db
.end
VarSounds:
.1  db
.2  db
.3  db
.4  db
.5  db
.6  db
.7  db
.8  db
.end
VarMusic:
    db
.end
