; Disassembly of "drive.gbf"

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
    db $69                     ; owner code
.title
    dk "DRIVE"
.icon
    INCBIN "gfx/drive/icon.2bpp"
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
    jx @+$1211


    trap StopAudio
    ld a, $0a
    ld [$0000], a
    ldx de, @+$10d7
    ld hl, $cb60
    ld a, [hl+]
    ld [de], a
    ld a, [hl]
    ld [de], a
    xor a
    ld [$0000], a
    trap ExitToMenu
    ld a, $20
    trap DrawInit
    trap StopAudio
    ld b, $c8
    ldx de, @+$0c62
    trap InitDecompress
    ldx de, @+$10b8
    ld a, [de]
    inc de
    ld l, a
    ld a, [de]
    ld h, a
    trap RandInit
    callx @+$0035
    callx @+$015c
    ret


    trap LCDDisable
    callx @+$00a8
    callx @+$0139
    callx @+$013b
    callx @+$00d3
    callx @+$082f
    ld a, $03
    trap LCDEnable
    ret


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
    ld bc, $0003
    ldx de, @+$102e
    ld hl, $cb50
    trap MemCopy
    ld bc, $0008
    ldx de, @+$1025
    ld hl, $cb53
    trap MemCopy
    ldx hl, @+$1024
    ld a, [hl]
    ld [$cb5b], a
    callx @+$0010
    ldx hl, @+$1016
    ld a, [hl+]
    ld [$cb60], a
    ld a, [hl]
    ld [$cb61], a
    ret


    trap GetAudioCount
    ld hl, $cb53
    ld c, $08

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


    ld bc, $2800
    trap $c4
    ld c, $28
    ldx de, @+$0f33
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
    callx @+$05b7
    xor a
    callx @+$0ffa
    ld a, $04
    ld [$cb33], a
    ld a, $50
    ld [$c380], a
    ld [$c384], a
    ld [$c388], a
    ld [$c38c], a
    ld [$c390], a
    ret


    ld de, $cb52
    ld hl, $c352
    callx @+$07cb
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


    ld bc, $00b0
    ld de, $9410
    trap RunDecompress
    ret


    ld bc, $00c0
    ld de, $9610
    trap RunDecompress
    ret


    ld bc, $03c0
    ld de, $8000
    trap RunDecompress
    ret


jr_000_029e::
    trap AwaitFrame
    ldh a, [$8a]
    and a
    jr nz, jr_000_029e

    ret


jr_000_02a6::
    trap AwaitFrame
    ldh a, [$8a]
    and a
    jr z, jr_000_02a6

    ret


    callx @+$ffec
    callx @+$ffed
    callx @+$ffde
    ret


    ld a, [$c92d]
    and a
    ret z

jr_000_02c9::
    push af
    callx @+$0008
    pop af
    dec a
    jr nz, jr_000_02c9

    ret


    ldh a, [$9a]
    and $07
    jr nz, jr_000_02f6

    callx @+$00d3
    callx @+$00a5
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


    ld a, [$c92d]
    and a
    ret z

jr_000_0301::
    push af
    callx @+$001c
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
    ld a, [$cb56]
    trap PlaySound
    ret


    ld a, [$c90c]
    and a
    ret nz

    ldh a, [$8a]
    bit 5, a
    jr z, jr_000_0334

    callx @+$0011

jr_000_0334::
    ldh a, [$8a]
    bit 4, a
    jr z, jr_000_0341

    callx @+$000a

jr_000_0341::
    ret


    ldh a, [$9b]
    dec a
    ldh [$9b], a
    ret


    ldh a, [$9b]
    inc a
    ldh [$9b], a
    ret


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
    callx @+$0049
    callx @+$001b
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


    callx @+$01ea
    ld e, $41
    ld bc, $0020
    ld hl, $c90d
    trap MemSet
    callx @+$00d9
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
    callx @+$033b
    callx @+$004c
    callx @+$0060
    callx @+$035c
    callx @+$0010
    ld a, [$cb30]
    ld b, $00
    ld c, a
    dec a
    and $0f
    ld [$cb30], a
    ret


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


    ld a, [$c90b]
    ld b, $00
    ld c, a
    sla c
    rl b
    ldx hl, @+$0028
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


    adc h
    nop
    sub c
    nop
    and h
    nop
    or a
    nop
    cp h
    nop
    pop bc
    nop
    adc $00
    db $d3
    nop
    ld [c], a
    nop
    ld a, [$fd00]
    nop
    ld a, [$c90b]
    ld b, $00
    ld c, a
    sla c
    rl b
    ldx hl, @+$000f
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


    ld d, $00
    dec d
    nop
    inc d
    nop
    inc de
    nop
    ld a, [de]
    nop
    ld hl, $2000
    nop
    ld hl, $2900
    nop
    inc b
    nop
    ld [bc], a
    nop
    ret


    ret


    ret


    dec [hl]
    callx @+$002c
    ret


    dec [hl]
    callx @+$0013
    ret


    ret


    dec [hl]
    dec [hl]
    ret


    ld a, [$c905]
    inc a
    and $1f
    ld [$c905], a
    ret


    ret


    ld a, [$c907]
    and $01
    ld c, a
    ld a, [$c905]
    add c
    and $1f
    ld [$c905], a
    ret


    ld a, [$c907]
    and $01
    xor $01
    ld c, a
    ld a, [$c905]
    sub c
    and $1f
    ld [$c905], a
    ret


    ld a, $42
    ld [de], a
    ld a, $43
    ld [hl], a
    ret


    ld a, $42
    ld [de], a
    ld a, $48
    ld [hl], a
    ld a, [$c907]
    inc a
    ld [$c907], a
    callx @+$ffc6
    ret


    ld a, $47
    ld [de], a
    ld a, $43
    ld [hl], a
    ld a, [$c907]
    inc a
    ld [$c907], a
    callx @+$ffc1
    ret


    ld a, $42
    ld [de], a
    ld a, $46
    ld [hl], a
    ret


    ld a, $45
    ld [de], a
    ld a, $43
    ld [hl], a
    ret


    ld a, $47
    ld [de], a
    ld a, $48
    ld [hl], a
    ld a, [$c907]
    inc a
    inc a
    ld [$c907], a
    ret


    ld a, $45
    ld [de], a
    ld a, $46
    ld [hl], a
    ret


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


    ld a, $49
    ld [de], a
    ld [hl], a
    ret


    ld a, $4a
    ld [de], a
    ld [hl], a
    ret


    ld a, $20
    ld [$c90a], a
    ld a, [$c902]
    and a
    jr nz, jr_000_05b3

    callx @+$0112

jr_000_05b3:
    ld a, [$c900]
    ld b, $00
    ld c, a
    sla c
    rl b
    ldx hl, @+$000c
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    dec hl
    add hl, bc
    push hl
    ret


    stop
    ld [hl+], a
    nop
    inc [hl]
    nop
    ld b, [hl]
    nop
    add h
    nop
    sbc l
    nop
    or [hl]
    nop
    trap $00
    ld hl, $c901
    dec [hl]
    jr z, jr_000_05e6

    ld a, $00
    ld [$c90b], a
    ret


jr_000_05e6::
    xor a
    ld [$c902], a
    jx @+$ffb6


    ld hl, $c901
    dec [hl]
    jr z, jr_000_05fa

    ld a, $07
    ld [$c90b], a
    ret


jr_000_05fa::
    xor a
    ld [$c902], a
    jx @+$ffa2


    ld hl, $c901
    dec [hl]
    jr z, jr_000_060e

    ld a, $08
    ld [$c90b], a
    ret


jr_000_060e::
    xor a
    ld [$c902], a
    jx @+$ff8e


    ld a, [$c903]
    and a
    jr z, jr_000_0627

    dec a
    jr z, jr_000_0647

    xor a
    ld [$c902], a
    jx @+$ff7d


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


    ld a, [$c907]
    cp $10
    jr c, jr_000_0665

jr_000_065d::
    xor a
    ld [$c902], a
    jx @+$ff3f


jr_000_0665::
    ld hl, $c901
    dec [hl]
    jr z, jr_000_065d

    ld a, $01
    ld [$c90b], a
    ret


    ld a, [$c907]
    cp $10
    jr c, jr_000_0680

jr_000_0678::
    xor a
    ld [$c902], a
    jx @+$ff24


jr_000_0680::
    ld hl, $c901
    dec [hl]
    jr z, jr_000_0678

    ld a, $02
    ld [$c90b], a
    ret


    ld a, [$c907]
    cp $07
    jr nc, jr_000_069b

jr_000_0693::
    xor a
    ld [$c902], a
    jx @+$ff09


jr_000_069b::
    ld hl, $c901
    dec [hl]
    jr z, jr_000_0693

    ld a, $03
    ld [$c90b], a
    ret


    ld a, [$c907]
    cp $07
    jr nc, jr_000_06b6

jr_000_06ae::
    xor a
    ld [$c902], a
    jx @+$feee


jr_000_06b6::
    ld hl, $c901
    dec [hl]
    jr z, jr_000_06ae

    ld a, $04
    ld [$c90b], a
    ret


jr_000_06c2::
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
    callx @+$0032

jr_000_06dc::
    callx @+$0033
    ld a, [$c901]
    and a
    jr z, jr_000_06c2

    ld a, $01
    ld [$c902], a
    xor a
    ld [$c903], a
    ld a, [$c900]
    cp $03
    ret nz

    ld a, $20
    ld [$cb35], a
    ld a, [$cb58]
    trap PlaySound
    xor a
    callx @+$012e
    ret


    trap RandNext
    and $07
    ld [$c900], a
    ret


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
    ld a, [$cb58]
    trap PlaySound
    ld a, $01
    callx @+$00de
    ret


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
    callx @+$0004
    ret


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


    ld a, [$cb3d]
    and a
    ret z

    ld a, [$cb3e]
    callx @+$0024
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


    callx @+$09c2
    callx @+$0047
    callx @+$0066
    ld a, $08
    ld [$cb3f], a

jr_000_08ae::
    callx @+$0018
    ld a, $02
    callx @+$0923
    ld a, [$cb3f]
    inc a
    ld [$cb3f], a
    cp $62
    jr c, jr_000_08ae

    ret


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
    callx @+$fe7e
    callx @+$fe9a
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
    callx @+$fe54
    callx @+$fe70
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


    callx @+$0031
    ld de, $cb3b
    ld hl, $c36a
    callx @+$0061
    callx @+$0039
    ret nc

    ld bc, $0003
    ld de, $cb39
    ld hl, $cb50
    trap MemCopy
    ld de, $cb52
    ld hl, $c352
    callx @+$0041
    ret


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


    ld c, $03
    ld de, $cb3b
    ld hl, $cb52

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
    ld a, [$cb5a]
    trap PlaySound
    ret


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


    ld a, $0c
    trap $b9
    ld a, $03
    trap LCDEnable
    callx @+$0072
    callx @+$008c
    callx @+$00e1
    ld bc, $4010
    ld e, $04

jr_000_0a41::
    callx @+$0141
    bit 0, a
    jr nz, jr_000_0a52

    bit 3, a
    jr nz, jr_000_0a52

    jr jr_000_0a41

jr_000_0a52::
    callx @+$f848
    ld a, [$cb54]
    trap PlaySound
    ld a, [$cb40]
    and a
    jr nz, jr_000_0a65

    ret


jr_000_0a65::
    dec a
    jr nz, jr_000_0a6c

    jx @+$0167


jr_000_0a6c:
    dec a
    jr nz, jr_000_0a73

    jx @+$0007


jr_000_0a73::
    jx @+$f689


    ld hl, $cb50
    xor a
    ld [hl+], a
    ld a, $30
    ld [hl+], a
    xor a
    ld [hl], a
    ld a, $0a
    ld [$0000], a
    ldx hl, @+$0749
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
    jx @+$ff85


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


    ld c, $80

jr_000_0ac0::
    push bc
    ld a, $02
    callx @+$0717
    callx @+$0801
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
    callx @+$f79d
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


    ld hl, $0403
    trap MoveCursor
    ldx hl, @+$062e
    trap DrawString
    ld hl, $0706
    trap MoveCursor
    ldx hl, @+$0639
    trap DrawString
    ld hl, $0708
    trap MoveCursor
    ldx hl, @+$0634
    trap DrawString
    ld hl, $070a
    trap MoveCursor
    ldx hl, @+$0634
    trap DrawString
    ld hl, $070c
    trap MoveCursor
    ldx hl, @+$0633
    trap DrawString
    ld hl, $cb46
    ld a, $48
    ld [hl+], a
    ld a, $49
    ld [hl+], a
    ld a, $3a
    ld [hl+], a
    ld c, $03
    ld de, $cb52

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
    trap MoveCursor
    ld hl, $cb46
    trap DrawString
    ret


jr_000_0b86::
    ldh a, [$8a]
    and a
    jr z, jr_000_0b86

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
    callx @+$f6f5
    jr jr_000_0b86

jr_000_0bae::
    ld hl, $cb40
    ld a, [hl]
    inc a
    cp e
    jr c, jr_000_0bb7

    xor a

jr_000_0bb7::
    ld [hl], a
    ld a, [$cb53]
    trap PlaySound
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
    ld a, [$cb53]
    trap PlaySound
    jr jr_000_0b98

    ld a, $0c
    trap $b9
    trap GetAudioCount
    ld a, d
    ld [$cb5c], a
    ld a, e
    ld [$cb5d], a
    callx @+$00c6
    ld a, $30
    ld [$c300], a
    ld a, $20
    ld [$c301], a
    xor a
    ld [$cb40], a

jr_000_0bf3::
    ld a, $02
    callx @+$05e5
    callx @+$011b
    ld bc, $3008
    ld e, $09
    callx @+$ff7a
    bit 1, a
    jr nz, jr_000_0c21

    bit 4, a
    jr nz, jr_000_0c40

    bit 5, a
    jr nz, jr_000_0c66

    bit 0, a
    jr nz, jr_000_0c7e

    jr jr_000_0bf3

jr_000_0c21::
    xor a
    ld [$cb40], a
    ld a, $0a
    ld [$0000], a
    ld bc, $0009
    ld de, $cb53
    ldx hl, @+$05a2
    trap MemCopy
    xor a
    ld [$0000], a
    trap StopAudio
    jx @+$fde2


jr_000_0c40::
    ld a, [$cb40]
    ld hl, $cb53
    ld c, a
    ld b, $00
    add hl, bc
    cp $08
    jr nc, jr_000_0c5a

    ld a, [$cb5d]
    ld c, a
    ld a, [hl]
    cp c
    jr nc, jr_000_0bf3

    inc a
    ld [hl], a
    jr jr_000_0bf3

jr_000_0c5a::
    ld a, [$cb5c]
    ld c, a
    ld a, [hl]
    cp c
    jr nc, jr_000_0bf3

    inc a
    ld [hl], a
    jr jr_000_0bf3

jr_000_0c66::
    ld a, [$cb40]
    ld hl, $cb53
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    and a
    jr nz, jr_000_0c78

    jx @+$ff7e


jr_000_0c78::
    dec a
    ld [hl], a
    jx @+$ff78


jr_000_0c7e::
    ld a, [$cb40]
    ld hl, $cb53
    ld c, a
    ld b, $00
    add hl, bc
    cp $08
    jr nc, jr_000_0c9a

    ld a, [hl]
    trap PlaySound
    callx @+$f60b
    jx @+$ff5c


jr_000_0c9a::
    ld a, [hl]
    trap PlayMusic
    callx @+$f5fd
    jx @+$ff4e


    xor a
    ld [$cb40], a
    ld hl, $0602
    trap MoveCursor
    ldx hl, @+$04d5
    trap DrawString
    ld hl, $0404
    trap MoveCursor
    ldx hl, @+$04d6
    trap DrawString
    ld hl, $0405
    trap MoveCursor
    ldx hl, @+$04d1
    trap DrawString
    ld hl, $0406
    trap MoveCursor
    ldx hl, @+$04cc
    trap DrawString
    ld hl, $0407
    trap MoveCursor
    ldx hl, @+$04c8
    trap DrawString
    ld hl, $0408
    trap MoveCursor
    ldx hl, @+$04c5
    trap DrawString
    ld hl, $0409
    trap MoveCursor
    ldx hl, @+$04c1
    trap DrawString
    ld hl, $040a
    trap MoveCursor
    ldx hl, @+$04bc
    trap DrawString
    ld hl, $040b
    trap MoveCursor
    ldx hl, @+$04bb
    trap DrawString
    ld hl, $040c
    trap MoveCursor
    ldx hl, @+$04b7
    trap DrawString
    ret


    ld c, $09

jr_000_0d1d::
    ld a, $09
    sub c
    ld b, a
    ld hl, $cb53
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl]
    ld e, a
    ld d, $00
    ld hl, $cb41
    trap IntToStringHex
    push hl
    ld h, $0e
    ld a, b
    add $04
    ld l, a
    trap MoveCursor
    pop hl
    trap DrawString
    dec c
    jr nz, jr_000_0d1d

    ret


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


jr_000_0d80::
    rst $38
    rrca
    rrca
    ld d, h
    ld a, e
    jr nc, @+$81

    ld d, b
    ld a, a
    ld a, a
    di
    nop
    inc bc
    inc c
    rlca
    ld [$0b04], sp
    ldh a, [$fe]
    ldh a, [$2a]
    sbc $0c
    cp $0a
    cp $03
    db $fc
    ret nz

    jr nc, jr_000_0d80

    db $10
    jr nz, jr_000_0d73

    xor $00
    db $fd
    ld a, a
    db $fd
    nop
    or e
    db $fc
    ld d, e
    db $fc
    or b
    rst $38
    ld d, b
    ld sp, hl
    rst $38
    dec b
    rrca
    nop
    ldh a, [$0d]
    dec c
    nop
    call $3fff
    jp z, $0d3f

    rst $38

jr_000_0dc0::
    ld a, [bc]
    rst $38
    and b
    or c
    ldh a, [$ef]
    inc [hl]
    ld a, e
    push af
    jr nz, jr_000_0dc0

    ld sp, hl
    ld h, d
    inc l
    add b
    sbc $05
    dec b
    ld a, [bc]
    add hl, bc
    rla
    nop
    dec d
    dec de
    nop
    add hl, de
    inc bc
    dec e
    ld h, b
    daa
    dec h
    nop
    dec hl
    add hl, hl
    nop
    dec l
    adc c
    adc c
    rst $38
    push bc
    pop bc
    inc [hl]
    ld [hl], e
    ld l, [hl]
    ld e, c
    ld a, [hl-]
    dec h
    rst $38
    ld e, $11
    dec h
    ld a, [hl-]
    ld e, b
    ld h, a
    ld [bc], a
    ld [bc], a
    rst $38
    jr nz, jr_000_0e1b

    adc b
    adc b
    add a
    add a
    ld e, c

Call_000_0e00::
    rst $18
    rst $38
    ld l, d
    or $34
    call z, $18e8
    push bc
    ld a, [$32ff]
    dec a
    ld c, $09
    ld d, l
    ld e, e
    ld a, [de]
    ld d, $ff
    ld [$2418], sp
    inc h
    ld bc, $5c01

jr_000_0e1b::
    cp h
    rst $38

jr_000_0e1d::
    or e
    ld c, a
    ld c, l
    or e
    ld e, [hl]
    cp [hl]
    or b
    ret nc

    db $fc
    or b
    call nc, $7050
    jr nz, jr_000_0e4e

    jp hl


    ld b, b
    add b
    cp $03
    ld [bc], a
    ld a, [bc]
    add hl, bc
    jr z, jr_000_0e55

    inc b
    ld e, $02
    ld a, e
    db $eb
    add b
    stop
    ld b, b
    add c
    ld bc, $c844
    rst $38
    ld b, b
    ld c, b
    ldh a, [rP1]
    inc hl
    nop
    rlca
    ld a, [bc]
    db $fc
    rlca

jr_000_0e4e::
    ld bc, $0049
    ld bc, $b328
    or e

jr_000_0e55::
    inc b
    rst $38
    jr nc, @-$3e

    add b
    ld a, b
    ld h, b
    add d
    ld l, b

jr_000_0e5e::
    or b
    and $10
    ret z

    add h
    xor a
    xor a
    ld b, b
    ld e, $3c
    call c, $ffd7
    ld h, [hl]
    ld a, [$6607]
    ld [$0204], a
    rra
    rst $18
    ld bc, $0277
    ld d, l
    ld [$3e00], sp
    jr @+$79

    db $fd
    ld d, d
    xor h
    ld b, $fb
    nop
    inc [hl]
    ld [$ff01], a
    nop
    dec bc
    add hl, bc
    ld a, $00
    ld h, a
    nop
    ld de, $af7f
    ld b, d
    sub b
    db $10
    jr jr_000_0e5e

    call nz, $9060
    xor $d0
    jr z, jr_000_0e1d

    or c
    rlca
    rlca
    rra
    ld b, l
    jr nc, jr_000_0ec0

    ld b, e
    ld b, e
    ld [bc], a
    or c
    ldh [$e0], a
    ld hl, sp+$55
    jr nc, @+$55

    inc h
    ld d, e
    nop
    ld b, e
    ccf
    ld h, c
    ld d, [hl]
    ld c, l
    db $fc
    ld [hl], c
    ld d, b
    ld d, e
    ld [hl], c
    ld [$03a1], a
    inc bc
    rrca

jr_000_0ec0::
    adc c
    add a
    ld b, $ea
    ret nz

    ret nz

jr_000_0ec6::
    ret nz

    ldh a, [$99]
    db $10
    sub a
    add a
    ld c, b
    adc e
    sub a
    ld b, d
    sbc e
    ld a, b
    add c
    ld h, h
    rlca
    inc b
    ld c, $09
    jp $00c1


    pop bc
    ld a, e
    sub a

Jump_000_0ede::
    inc b
    and b
    ld h, b
    db $10
    ldh a, [$d3]
    jr nz, jr_000_0ec6

    ld a, h
    db $db
    nop
    inc bc
    ld [bc], a
    ld [bc], a
    inc bc
    ld bc, $2526
    inc b
    or h
    ld bc, $40df
    ret nz

    rst $28
    ld bc, $3e80
    di
    inc b
    ccf
    rst $28
    ld b, e
    db $10
    jr jr_000_0f3a

    daa
    ld [hl], a
    ld c, a
    ld l, b
    ld sp, hl
    ld e, b
    ld c, b
    ld a, b
    jr nc, @+$32

    db $e3
    ld d, e

jr_000_0f0e::
    db $10
    jr jr_000_0f0e

    inc b
    db $fc
    ld a, [c]
    xor $1a
    ld d, $17
    ld [hl], d
    db $e3
    ld l, [hl]
    db $e4
    sbc h
    rst $18
    nop
    rst $18
    db $e3
    xor d
    sbc b
    ld a, b
    call c, $e060
    di
    ld a, h
    ld a, h
    add d
    ld b, c
    ld [hl], b
    ccf
    ld b, b
    ld l, h
    dec bc
    db $10
    ld c, a
    xor h
    nop
    ld [hl], c
    ldh [rP1], a
    ldh [$3f], a

jr_000_0f3a::
    nop
    ld sp, $f7f7
    ld b, $7e
    ld a, [hl]
    ld e, l
    ld l, a
    ld h, b
    xor h
    add h
    ld h, $7f
    ld d, b
    ld l, e
    inc b
    adc c
    db $10
    xor h
    cp $fe
    ld h, a
    jr z, jr_000_0fb3

    ld [hl], l
    ld [hl], b
    ld [hl], b
    sub c
    ld b, [hl]
    ld b, a
    ld e, a
    ld b, [hl]
    or c
    ld a, l
    inc b
    ld b, $3f
    cp a
    ld h, [hl]
    cp l
    ld l, e
    ld [bc], a
    ld h, c
    inc e
    inc e
    ld a, l
    inc b
    ld c, $41
    adc a
    inc b
    ld b, c
    ld a, l
    ld bc, $2020
    inc h
    pop af
    ld l, $ef
    ld h, d
    call $0181
    ld de, $7979
    dec b
    rlca
    ret c

    ld hl, sp-$08
    ld a, l
    inc b
    ldh a, [$f0]
    adc c
    adc c
    jr nz, jr_000_0f9a

    ld e, d
    adc l
    inc bc
    ld a, [hl]
    sub b
    ld a, h
    cp $b1
    ld b, e
    db $fc
    sub b
    inc sp
    ld h, a
    inc b
    adc a

jr_000_0f9a::
    add b
    ret nz

    trap $00
    trap MemCopy
    ld b, $34
    ld [hl], d
    nop
    add a
    add d
    jp nz, Jump_000_10e7

    add $cf
    add a
    nop
    dec b
    dec sp
    cpl
    ld b, h
    cpl
    ld c, a

jr_000_0fb3::
    ld b, l
    push hl
    jp nz, Jump_000_0987

    ld l, h
    ld a, [c]
    ld l, h
    sub d
    or [hl]
    sub d
    ld [hl], e
    trap StopAudio
    add $e7
    add c
    add [hl]
    xor a
    ld b, $39
    add c
    inc [hl]
    rst $20
    ld c, h
    ld d, $95
    ld b, h
    ld a, a
    and a
    jr nz, jr_000_103f

    jr c, jr_000_100d

    ld [hl+], a
    ld bc, $4804
    rst $38
    sub b
    ld bc, $2401
    ld c, b

Call_000_0fdf::
    nop
    ld [bc], a
    sub b
    rst $38
    db $10
    ld b, d
    add h
    nop
    dec h
    rlca
    rlca
    ld c, l
    or a
    sub l
    ret nz

    dec h
    ld c, l
    ret nz

    ld [$1595], sp
    ld b, a
    rst $38
    add a
    inc bc
    and d
    ldh [$e4], a
    xor b
    or b
    pop hl
    rst $38
    pop hl
    and h
    xor b
    ldh [$e2], a
    or b
    or b
    ld [c], a
    rst $18
    call nz, $afc0
    ld a, a
    ld a, a

jr_000_100d::
    xor d
    push de
    rst $38
    rst $38
    rst $38
    daa
    rlca
    ld a, [bc]
    ld c, [hl]
    cp h

jr_000_1017::
    inc d
    jr z, jr_000_1017

    jr c, jr_000_108c

    ld d, b
    and b
    ldh [$c0], a
    ld d, d
    db $10
    ld [c], a
    rst $38
    ldh [rHDMA4], a
    ld a, b
    jr c, @+$2b

    dec d
    inc e
    ld c, $f9
    ld a, [bc]
    dec b
    rlca
    inc bc
    inc bc
    or h
    ld a, [hl-]
    db $10
    ret nz

    ccf
    ld sp, hl
    rst $30
    nop
    ld l, b
    jr c, jr_000_1059

    sub h
    ld a, [de]

jr_000_103f::
    ld c, [hl]
    rst $00
    add a
    rlca
    or h
    dec bc
    nop
    add hl, bc
    rrca
    ld a, [bc]
    inc d
    cp $1c
    ld a, [hl-]
    jr z, jr_000_10a7

    ld [hl], d
    db $e4
    ldh [$df], a
    add b
    rst $38
    ld b, [hl]
    ret nc

    ld c, b
    add hl, hl

jr_000_1059::
    add h
    sub b
    ld [$c622], sp
    ld [hl], c
    ld d, l
    ld a, $b5
    add b
    db $ed
    ld d, l
    xor e
    ld h, l
    ld [$b51f], sp
    ld e, [hl]
    jr nz, jr_000_1078

    rrca
    inc c
    rra
    db $10
    ccf
    ei
    jr z, jr_000_10b4

    inc h
    ld a, a
    ld b, h

jr_000_1078::
    xor l
    nop
    cp $c6
    rst $30
    ld a, [$f906]
    rlca
    ld [hl], l
    di
    rrca
    sbc $ff
    ld a, $e6
    ld a, [hl]
    ld a, a
    ld b, d
    ld a, l

jr_000_108c::
    ld b, e
    db $fc
    rst $38
    add a
    ld hl, sp-$71
    add sp, -$61
    ld d, b
    ld a, a
    jr nz, @+$01

    ccf
    rra
    rra
    ld [bc], a
    cp $81
    rst $38
    ld b, c
    rst $38
    rst $38
    ld h, c
    rst $38
    ld a, [hl-]
    cp $0e

jr_000_10a7::
    cp $7c
    add l
    db $fc
    db $fd
    nop
    ld e, [hl]
    or h
    nop
    inc h
    dec e
    ld l, e
    ld [de], a

jr_000_10b4::
    ld e, e
    ld a, [$7767]
    trap $b7
    trap $9d
    ret nz

    inc d
    ld bc, $f8e7
    ld a, b
    db $fc
    cp b
    ld d, e
    nop
    cp $af
    rst $18
    or a
    rst $18
    db $ed
    rst $38
    ld a, a
    call nz, $7f00
    ccf
    ld a, a
    pop bc
    rra
    ccf
    and e
    cp h
    ld de, $bbbc
    nop
    cp b
    ld hl, sp-$19
    db $fc
    ldh a, [$f8]
    or e
    nop
    dec bc
    rlca
    inc b

Jump_000_10e7::
    ld e, $ff
    dec de
    ld a, [hl-]
    cpl
    inc a
    daa
    ccf
    inc sp
    ccf
    rst $28
    jr c, @+$7d

    ld h, a
    ld de, $2001
    ldh [$58], a
    ld hl, sp-$02
    ld d, h
    db $fc
    inc h
    db $fc
    call z, $1efc
    trap $ff
    ld a, a
    ld l, e
    ld a, a
    ld a, d
    cp a
    or $bf
    ld [c], a
    sbc $5f
    ld a, a
    add sp, $01
    jr jr_000_1133

    rlca
    rlca
    trap $ff
    sbc $fd
    ld [hl], a
    db $fd

jr_000_111c::
    trap $fa
    cp $e4
    ld hl, sp-$04
    jr jr_000_111c

    ldh [$e0], a
    nop
    ld bc, $0302
    dec d
    ld d, $17
    jr jr_000_114c

    ld e, $1f
    jr nz, jr_000_113b

jr_000_1133::
    add hl, bc
    ld a, [bc]
    dec bc

jr_000_1136::
    cpl
    jr nc, @+$33

    ld [hl-], a
    dec h

jr_000_113b::
    dec h
    dec h
    dec h
    dec h
    dec h
    dec h
    dec h
    dec h
    dec h
    dec h
    dec h
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $34
    nop

jr_000_114c::
    nop
    nop
    cp h
    sbc $ac
    or [hl]
    cp h
    sbc $ac
    or [hl]
    cp h
    sbc $ac
    db $dd
    call z, Call_000_0fdf
    jp Jump_000_0ede


    adc $df
    db $dd
    nop
    ld c, $bd
    ret nz

    or b
    call nz, Call_000_0e00
    cp e
    or e
    db $dd
    call nz, $bede
    xor a
    jp $00b2


    ld c, $ca
    or d
    cp l
    cp d
    or c
    jr nz, jr_000_1136

    cp l
    nop
    ld c, $bc
    xor l
    or e
    ret c

    xor [hl]
    or e
    nop
    ld c, $bb
    or e
    db $dd
    call nz, $20de
    db $d3
    or b
    call nz, $00de
    rrca
    cp [hl]
    db $dd
    ret nz

    cp b
    nop
    rrca
    cp c
    xor a
    jp $00b2


    ld c, $ce
    rst $18
    or b
    cp l
    sbc $00
    ld c, $bc
    sbc $ac
    db $dd
    call z, $00df
    rrca
    jp z, $b8de

    jp z, $00c2

    rrca
    cp c
    or d
    cp d
    cp b
    nop
    ld c, $da
    call $d9de
    or c
    xor a
    call z, $00df
    ld c, $ca
    or d
    cp l
    cp d
    or c
    nop
    ld b, d
    ld b, a
    ld c, l
    nop
    nop
    jr nc, jr_000_11d3

jr_000_11d3::
    ld bc, $2e02
    rra
    rrca
    ld [hl], $37
    ld e, $05
    inc [hl]
    ld [de], a

jr_000_11de::
    push af
    trap AwaitFrame
    pop af
    dec a
    jr nz, jr_000_11de

    ret


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
    callx @+$f5b9
    pop af
    ld [$c302], a
    inc a
    ld [$c306], a
    inc a
    ld [$c30a], a
    inc a
    ld [$c30e], a
    ret


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
    callx @+$ff9b
    dec c
    jr nz, jr_000_1221

    ret


    ld a, [$cb35]
    and a
    ret z

    ld a, [$cb35]
    dec a
    ld [$cb35], a
    srl a
    jr c, jr_000_1268

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
    ld a, [$cb59]
    trap PlaySound
    ld hl, $0000

jr_000_12ab::
    ld a, l
    ld [$cb5e], a
    ld a, h
    ld [$cb5f], a
    ret


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


    ldh a, [$8a]
    bit 3, a
    ret z

    ld a, [$cb55]
    trap PlaySound
    callx @+$efa9

jr_000_12f8::
    ldh a, [$8a]
    bit 3, a
    jr z, jr_000_12f8

    ld a, [$cb55]
    trap PlaySound
    callx @+$ef97
    ret


    ld sp, $e000
    callx @+$ee03
    callx @+$f706
    callx @+$ee1d
    callx @+$f027
    ld a, $01
    ld [$c90c], a
    ld [$cb3d], a
    ld a, [$cb5b]
    trap PlayMusic
    ld a, $01
    callx @+$fea1
    callx @+$f64a
    callx @+$efb1
    callx @+$f5cf
    callx @+$fe8d
    callx @+$feea
    callx @+$f4e4
    callx @+$ff46
    callx @+$ef4f
    callx @+$f9c5
    jr c, jr_000_139a

    callx @+$ff04
    callx @+$ff43
    callx @+$ff54
    jx @+$ffa0


jr_000_139a::
    xor a
    trap PlayMusic
    ld a, [$cb57]
    trap PlaySound
    callx @+$fe75
    callx @+$f4e7
    callx @+$eefa
    ld a, $0a
    ld [$0000], a
    ld bc, $000c
    ld de, $cb50
    ldx hl, @+$fe0d
    trap MemCopy
    xor a
    ld [$0000], a
    jx @+$ed2c
