; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $002", ROMX[$4000], BANK[$2]

traps2::
    dw trap_80_5267  ; $80
    dw trap_81_526e  ; $81
    dw trap_82_5275  ; $82
    dw trap_83_527c  ; $83
    dw trap_84_5283  ; $84
    dw trap_85_52b3  ; $85
    dw trap_86_52c8  ; $86
    dw trap_87_52de  ; $87
    dw trap_88_52e0  ; $88
    dw trap_89_52e7  ; $89
    dw trap_8a_5322  ; $8a
    dw trap_8b_537a  ; $8b
    dw trap_8c_5384  ; $8c
    dw trap_8d_53b4  ; $8d
    dw trap_8e_5389  ; $8e
    dw trap_8f_496e  ; $8f
    dw trap_90_417e  ; $90
    dw trap_90_417e  ; $91
    dw trap_90_417e  ; $92
    dw trap_90_417e  ; $93
    dw trap_90_417e  ; $94
    dw trap_90_417e  ; $95
    dw trap_90_417e  ; $96
    dw trap_90_417e  ; $97
    dw trap_90_417e  ; $98
    dw trap_90_417e  ; $99
    dw trap_90_417e  ; $9a
    dw trap_90_417e  ; $9b
    dw trap_90_417e  ; $9c
    dw trap_90_417e  ; $9d
    dw trap_90_417e  ; $9e
    dw trap_90_417e  ; $9f
    dw trap_a0_54d8  ; $a0
    dw trap_a1_53c1  ; $a1
    dw trap_a2_53f1  ; $a2
    dw trap_a3_547e  ; $a3
    dw trap_a4_559e  ; $a4
    dw trap_a5_55d2  ; $a5
    dw trap_a6_55df  ; $a6
    dw trap_a7_5b8d  ; $a7
    dw trap_90_417e  ; $a8
    dw trap_90_417e  ; $a9
    dw trap_90_417e  ; $aa
    dw trap_90_417e  ; $ab
    dw trap_90_417e  ; $ac
    dw trap_90_417e  ; $ad
    dw trap_90_417e  ; $ae
    dw trap_90_417e  ; $af
    dw trap_b0_5ff2  ; $b0
    dw trap_b1_60c5  ; $b1
    dw trap_b2_61c0  ; $b2
    dw trap_b3_574b  ; $b3
    dw trap_b4_578a  ; $b4
    dw trap_b5_58d3  ; $b5
    dw trap_b6_605c  ; $b6
    dw trap_b7_58f8  ; $b7
    dw trap_b8_5901  ; $b8
    dw trap_b9_59f5  ; $b9
    dw trap_ba_5681  ; $ba
    dw trap_bb_593a  ; $bb
    dw trap_bc_4100  ; $bc
    dw trap_bd_5914  ; $bd
    dw trap_be_5988  ; $be
    dw trap_bf_5e2e  ; $bf
    dw trap_c0_5de2  ; $c0
    dw trap_c1_5e08  ; $c1
    dw trap_c2_69ee  ; $c2
    dw trap_c3_4eaf  ; $c3
    dw trap_c4_58c4  ; $c4
    dw trap_c5_56c4  ; $c5
    dw trap_c6_5730  ; $c6
    dw trap_c7_571c  ; $c7
    dw trap_c8_591b  ; $c8
    dw trap_c9_5c54  ; $c9
    dw trap_ca_5859  ; $ca
    dw trap_cb_417f  ; $cb
    dw trap_cc_419f  ; $cc
    dw trap_cd_59c1  ; $cd
    dw trap_90_417e  ; $ce
    dw trap_90_417e  ; $cf
    dw trap_90_417e  ; $d0
    dw trap_90_417e  ; $d1
    dw trap_90_417e  ; $d2
    dw trap_90_417e  ; $d3
    dw trap_90_417e  ; $d4
    dw trap_90_417e  ; $d5
    dw trap_90_417e  ; $d6
    dw trap_90_417e  ; $d7
    dw trap_d8_618c  ; $d8
    dw trap_d9_6209  ; $d9
    dw trap_da_6178  ; $da
    dw trap_db_60e2  ; $db
    dw trap_dc_60d2  ; $dc
    dw trap_90_417e  ; $dd
    dw trap_90_417e  ; $de
    dw trap_90_417e  ; $df
    dw trap_e0_4437  ; $e0
    dw trap_e1_4456  ; $e1
    dw trap_e2_454a  ; $e2
    dw trap_e3_4566  ; $e3
    dw trap_e4_4577  ; $e4
    dw trap_e5_45ca  ; $e5
    dw trap_e6_45da  ; $e6
    dw trap_e7_47b7  ; $e7
    dw trap_e8_49de  ; $e8
    dw trap_e9_4aa0  ; $e9
    dw trap_ea_4b98  ; $ea
    dw trap_eb_4c9a  ; $eb
    dw trap_ec_4ca9  ; $ec
    dw trap_ed_4cf1  ; $ed
    dw trap_90_417e  ; $ee
    dw trap_ef_48ec  ; $ef
    dw trap_f0_4bed  ; $f0
    dw trap_f1_4926  ; $f1
    dw trap_f2_4881  ; $f2
    dw trap_90_417e  ; $f3
    dw trap_90_417e  ; $f4
    dw trap_90_417e  ; $f5
    dw trap_90_417e  ; $f6
    dw trap_90_417e  ; $f7
    dw trap_f8_41b0  ; $f8
    dw trap_f9_4259  ; $f9
    dw trap_90_417e  ; $fa
    dw trap_fb_4586  ; $fb
    dw trap_fc_4a3c  ; $fc
    dw trap_fd_4df6  ; $fd
    dw trap_fe_4e7d  ; $fe
    dw trap_ff_4e36  ; $ff

trap_bc_4100::
    ld d, a
    push hl
    ld hl, data_02_4171

jr_002_4105:
    ld a, [hl]
    cp $ff
    jr z, jr_002_4115

    ld a, d
    or a
    jr z, jr_002_4118

    inc hl
    inc hl
    inc hl
    inc hl
    dec d
    jr jr_002_4105

jr_002_4115:
    pop hl
    scf
    ret


jr_002_4118:
    ld d, [hl]
    inc hl
    ld a, [hl+]
    dec a
    cp e
    jr c, jr_002_4115

    sub e
    dec b
    cp b
    jr nc, jr_002_4125

    ld b, a

jr_002_4125:
    inc b
    ld c, b
    ld b, $00
    jr nz, jr_002_412c

    inc b

jr_002_412c:
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, d
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    cp $08
    jr z, jr_002_4156

    sla e
    rl d
    sla c
    rl b

jr_002_4156:
    add hl, de
    ld e, l
    ld d, h
    pop hl
    cp $08
    jr z, jr_002_4167

    push bc

jr_002_415f:
    push hl
    trap $02
    pop hl
    pop bc
    add hl, bc
    or a
    ret


Call_002_4167:
jr_002_4167:
    ld a, [de]
    inc de
    ld [hl+], a
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_002_4167

    ret


data_02_4171::
    db $08, $00, $8e, $6f, $10, $0c, $8e, $77, $10, $78, $58, $78, $ff

trap_90_417e::
    ret


trap_cb_417f::
    ldh a, [rLCDC]
    bit 7, a
    ret z

jr_002_4184:
    ldh a, [rLY]
    cp $48
    jr nc, jr_002_4184

    ld a, $00
    ldh [rTAC], a
    ld a, l
    ldh [rTMA], a
    ld a, h
    ldh [rTAC], a
    and $04
    ld h, a
    ldh a, [rIE]
    and $fb
    or h
    ldh [rIE], a
    ret


trap_cc_419f::
    push bc
    push de
    push hl
    ld c, a
    trap $18
    cp c
    jr z, jr_002_41aa

    trap $18

jr_002_41aa:
    trap $12
    pop hl
    pop de
    pop bc
    ret


trap_f8_41b0::
    cp $2d
    scf
    ret z

    cp $2a
    jr nz, jr_002_41bc

    ld a, $0a
    jr jr_002_41cd

jr_002_41bc:
    cp $23
    jr nz, jr_002_41c4

    ld a, $0b
    jr jr_002_41cd

jr_002_41c4:
    cp $30
    ret c

    cp $3a
    ccf
    ret c

    sub $30

jr_002_41cd:
    push bc
    push hl
    push af
    push de
    ld a, $80
    ldh [rNR52], a
    ld a, $66
    ldh [rNR51], a
    ld a, $77
    ldh [rNR50], a
    ld a, $80
    ldh [rNR21], a
    ld a, $f0
    ldh [rNR22], a
    ld a, $80
    ldh [rNR30], a
    ld a, $20
    ldh [rNR32], a
    ld hl, $ff30
    ld de, data_02_4231
    ld b, $10

jr_002_41f5:
    ld a, [de]
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_002_41f5

    pop de
    pop af
    ld hl, data_02_4241
    add a
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl+]
    ldh [rNR33], a
    ld a, [hl]
    ldh [rNR23], a
    ld a, $87
    ldh [rNR24], a
    ldh [rNR34], a
    ld b, $06

jr_002_4213:
    call trap_b1_60c5
    dec b
    jr nz, jr_002_4213

    ldh a, [rNR30]
    and $7f
    ldh [rNR30], a
    ldh a, [rNR52]
    and $7f
    ldh [rNR52], a
    ld b, $06

jr_002_4227:
    call trap_b1_60c5
    dec b
    jr nz, jr_002_4227

    pop hl
    pop bc
    xor a
    ret


data_02_4231::
    db $8a, $df, $fe, $ca, $74, $20, $01, $35, $8a, $df, $fe, $ca, $74, $20, $01, $35

data_02_4241::
    db $74, $9e, $44, $94, $44, $9e, $44, $a8, $54, $94, $54, $9e, $54, $a8, $64, $94

data_02_4251::
    db $64, $9e, $64, $a8, $74, $94, $74, $a8

trap_f9_4259::
    push bc
    push hl
    call Call_002_426e
    or a
    jr z, jr_002_426a

    ld a, [hl+]
    call trap_f8_41b0
    ld a, [hl]
    call trap_f8_41b0
    scf

jr_002_426a:
    ccf
    pop hl
    pop bc
    ret


Call_002_426e:
    ld b, a
    ld hl, data_02_430a
    ld a, c
    cp $27
    jr nz, jr_002_427a

    ld hl, data_02_4283

jr_002_427a:
    ld a, [hl+]
    or a
    ret z

    cp b
    ret z

    inc hl
    inc hl
    jr jr_002_427a

data_02_4283::
    db $45, $32, $36, $46, $32, $37, $47, $32, $38, $48, $32, $39, $49, $33, $36, $4a
    db $33, $37, $4b, $33, $38, $4c, $33, $39, $4d, $34, $36, $4e, $34, $37, $4f, $34
    db $38, $50, $34, $39, $51, $35, $36, $52, $35, $37, $53, $35, $38, $54, $35, $39
    db $55, $36, $36, $56, $36, $37, $57, $36, $38, $58, $36, $39, $59, $37, $36, $5a
    db $37, $37, $3f, $37, $38, $21, $37, $39, $2d, $30, $37, $2f, $30, $36, $5c, $38
    db $39, $26, $30, $38, $77, $39, $38, $74, $39, $39, $68, $38, $38, $2a, $38, $37
    db $23, $38, $36, $20, $30, $39, $75, $39, $36, $64, $39, $37, $31, $31, $30, $32
    db $32, $30, $33, $33, $30, $34, $34, $30, $35, $35, $30, $36, $36, $30, $37, $37
    db $30, $38, $38, $30, $39, $39, $30

data_02_430a::
    db $b1, $31, $31, $b2, $31, $32, $b3, $31, $33, $b4, $31, $34, $b5, $31, $35, $b6
    db $32, $31, $b7, $32, $32, $b8, $32, $33, $b9, $32, $34, $ba, $32, $35, $bb, $33
    db $31, $bc, $33, $32, $bd, $33, $33, $be, $33, $34, $bf, $33, $35, $c0, $34, $31
    db $c1, $34, $32, $c2, $34, $33, $c3, $34, $34, $c4, $34, $35, $c5, $35, $31, $c6
    db $35, $32, $c7, $35, $33, $c8, $35, $34, $c9, $35, $35, $ca, $36, $31, $cb, $36
    db $32, $cc, $36, $33, $cd, $36, $34, $ce, $36, $35, $cf, $37, $31, $d0, $37, $32
    db $d1, $37, $33, $d2, $37, $34, $d3, $37, $35, $d4, $38, $31, $28, $38, $32, $d5
    db $38, $33, $29, $38, $34, $d6, $38, $35, $d7, $39, $31, $d8, $39, $32, $d9, $39
    db $33, $da, $39, $34, $db, $39, $35, $dc, $30, $31, $a6, $30, $32, $dd, $30, $33
    db $de, $30, $34, $df, $30, $35, $41, $31, $36, $42, $31, $37, $43, $31, $38, $44
    db $31, $39, $45, $31, $30, $46, $32, $36, $47, $32, $37, $48, $32, $38, $49, $32
    db $39, $4a, $32, $30, $4b, $33, $36, $4c, $33, $37, $4d, $33, $38, $4e, $33, $39
    db $4f, $33, $30, $50, $34, $36, $51, $34, $37, $52, $34, $38, $53, $34, $39, $54
    db $34, $30, $55, $35, $36, $56, $35, $37, $57, $35, $38, $58, $35, $39, $59, $35
    db $30, $5a, $36, $36, $3f, $36, $37, $21, $36, $38, $2d, $36, $39, $2f, $36, $30
    db $5c, $37, $36, $26, $37, $37, $77, $37, $38, $74, $37, $39, $63, $37, $30, $2a
    db $38, $36, $23, $38, $37, $20, $38, $38, $68, $38, $39, $20, $38, $30, $31, $39
    db $36, $32, $39, $37, $33, $39, $38, $34, $39, $39, $35, $39, $30, $36, $30, $36
    db $37, $30, $37, $38, $30, $38, $39, $30, $39, $30, $30, $30, $00

trap_e0_4437::
    ldh a, [hRAMBank]
    push af
    call Call_002_44e9

Jump_002_443d:
    pop af
    or a
    call Call_002_4475

Call_002_4442:
    xor a
    ld [rIRMode], a
    ret


Jump_002_4447:
    pop af
    call Call_002_4475
    call Call_002_4442
    scf
    ret


Call_002_4450:
    ld a, kIRModeOn
    ld [rIRMode], a
    ret


trap_e1_4456::
    ldh a, [hRAMBank]
    push af
    call Call_002_447b
    jr c, jr_002_4466

Jump_002_445e:
    pop af
    call Call_002_4475
    xor a
    ret


Jump_002_4464:
    add sp, $02

Jump_002_4466:
jr_002_4466:
    pop af
    call Call_002_4475
    scf
    ret


Call_002_446c:
    ld hl, $0016
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [$0015]

Call_002_4475:
Jump_002_4475:
    ldh [hRAMBank], a
    ld [rRAMBank], a
    ret


Call_002_447b:
    call Call_002_446c
    ld de, data_02_53ac
    ld a, [hl+]
    cp d
    jr nz, jr_002_44e5

    ld a, [hl+]
    cp e
    jr nz, jr_002_44e5

    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, [bc]
    cp d
    jr nz, jr_002_44e5

    inc bc
    ld a, [bc]
    cp e
    jr nz, jr_002_44e5

    ld de, $c000
    dec bc
    jr jr_002_44a4

jr_002_449b:
    inc hl
    cpl
    cp [hl]
    jr nz, jr_002_44e5

    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]

jr_002_44a4:
    inc hl
    ld a, [hl+]
    cp e
    jr nz, jr_002_44e5

    ld a, [hl]
    cp d
    jr nz, jr_002_44e5

    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    ld e, l
    ld d, h
    ld l, c
    ld h, b
    ld a, h
    cp $a0
    jr c, jr_002_44e7

    cp d
    jr c, jr_002_44d0

    jr nz, jr_002_44c4

    ld a, l
    cp e
    jr c, jr_002_44d0

jr_002_44c4:
    ldh a, [hRAMBank]
    or a
    jr z, jr_002_44e5

    dec a
    call Call_002_4475
    ld de, $c000

jr_002_44d0:
    ld a, [hl]
    cp $46
    jr z, jr_002_449b

    cp $5a
    jr z, jr_002_449b

    cp $52
    jr z, jr_002_449b

    cp $44
    jr z, jr_002_449b

    cp $53
    jr z, jr_002_449b

jr_002_44e5:
    scf
    ret


jr_002_44e7:
    xor a
    ret


Call_002_44e9:
    call Call_002_446c
    call Call_002_4450
    push hl
    ld bc, $fe1a
    add hl, bc
    push hl
    xor a
    ld b, $f6
    call Call_002_4545
    ld b, $f0
    call Call_002_4545
    ld b, $46
    call Call_002_4545
    ld a, $20
    ld b, $3a
    call Call_002_4545
    pop bc
    pop hl
    ld de, $c000
    call Call_002_4534
    ld bc, $a002
    call Call_002_4534

jr_002_451a:
    ldh a, [hRAMBank]
    or a
    jr nz, jr_002_4522

    ld bc, rRAMBank

jr_002_4522:
    ld a, $46
    call Call_002_4536
    ld de, $c000
    ldh a, [hRAMBank]
    or a
    ret z

    dec a
    call Call_002_4475
    jr jr_002_451a

Call_002_4534:
    ld a, $53

Call_002_4536:
    push hl
    ld [hl+], a
    cpl
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld [hl], d
    pop de
    ld l, c
    ld h, b
    ret


Call_002_4545:
jr_002_4545:
    ld [hl+], a
    dec b
    jr nz, jr_002_4545

    ret


trap_e2_454a::
    ldh a, [hRAMBank]
    push af
    call Call_002_4556
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp Jump_002_445e


Call_002_4556:
    call Call_002_446c
    ld a, e
    and $1f
    add a
    ld e, a
    ld d, $00
    add hl, de
    ld de, $0006
    add hl, de
    ret


trap_e3_4566::
    ldh a, [hRAMBank]
    push af
    push hl
    call Call_002_4556
    call Call_002_4450
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    jp Jump_002_443d


trap_e4_4577::
    ldh a, [hRAMBank]
    push af
    push hl
    call trap_fb_4586
    ld e, l
    ld d, h
    pop hl
    trap $02
    jp Jump_002_445e


trap_fb_4586::
    ld a, d
    cp $ff
    jr z, jr_002_45a8

    cp $fe
    jr z, jr_002_45af

    ld h, d
    ld l, e

Call_002_4591:
    ld a, h
    and $60
    rlca
    rlca
    rlca
    push af
    ld a, h
    and $1f
    or $a0
    ld h, a
    pop af
    push hl
    ld hl, $ff97
    or [hl]
    pop hl
    jp Jump_002_4475


Call_002_45a8:
jr_002_45a8:
    call Call_002_446c
    ld d, $00
    add hl, de
    ret


jr_002_45af:
    call Call_002_446c
    ld a, $77
    sub e
    jr nc, jr_002_45b9

    ld a, $77

jr_002_45b9:
    inc a
    push af
    ld e, l
    ld d, h
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    pop af
    ret


trap_e5_45ca::
    ldh a, [hRAMBank]
    push af
    push hl
    call trap_fb_4586
    call Call_002_4450
    pop de
    trap $02
    jp Jump_002_443d


trap_e6_45da::
    ld a, h
    or l
    jr nz, jr_002_45e1

    ld hl, $1fff

jr_002_45e1:
    ldh a, [hRAMBank]
    push af
    push hl
    call Call_002_446c
    pop bc
    ld de, $0000
    push de
    ld a, b
    ld e, a
    and $1f
    ld b, a
    ld a, e
    and $e0
    ld e, $44
    jr z, jr_002_4606

    ld e, $52
    cp $20
    jr z, jr_002_4606

    ld e, $5a
    cp $40
    jp nz, Jump_002_4464

jr_002_4606:
    push bc
    ld d, $46
    call Call_002_471e
    pop bc
    jp c, Jump_002_46ee

    ld a, e
    cp $5a
    jr nz, jr_002_461f

    ld a, h
    cp $a0
    jr nz, jr_002_4606

    ld a, l
    cp $02
    jr nz, jr_002_4606

jr_002_461f:
    push hl
    push de
    inc hl
    inc hl
    inc hl
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld d, a
    ld a, e
    sub c
    ld a, d
    sbc b
    jr nc, jr_002_4649

    push bc
    ld hl, sp+$06
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, c
    sub e
    ld a, b
    sbc d
    jr nc, jr_002_4644

    ld [hl], d
    dec hl
    ld [hl], e

jr_002_4644:
    pop bc
    pop de
    pop hl
    jr jr_002_4606

jr_002_4649:
    pop de
    pop hl
    push hl
    call Call_002_4450
    ld a, e
    cp $5a
    jr z, jr_002_467f

    push de
    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    ld a, l
    sub c
    ld e, a
    ld a, h
    sbc b
    ld d, a
    ld a, e
    sub $06
    ld e, a
    ld a, d
    sbc $00
    ld d, a
    jr c, jr_002_467d

    ld c, e
    ld b, d
    pop hl
    pop de
    ld a, e
    ld e, $46
    jr jr_002_4681

jr_002_467d:
    pop hl
    pop de

jr_002_467f:
    ld a, $46

jr_002_4681:
    push af
    ld a, e
    ld [hl+], a
    cpl
    ld [hl+], a
    inc hl
    inc hl
    push hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld a, c
    add l
    ld c, a
    ld a, b
    adc h
    ld b, a
    push bc
    ld a, e
    sub c
    ld c, a
    ld a, d
    sbc b
    ld b, a
    jr nz, jr_002_46a7

    ld a, c
    cp $07
    jr nc, jr_002_46a7

    pop bc
    pop hl
    pop af
    pop hl
    jr jr_002_46e2

jr_002_46a7:
    pop bc
    pop hl
    pop af
    ld [hl], c
    inc hl
    ld [hl], b
    ld l, c
    ld h, b
    pop bc
    push hl
    ld [hl+], a
    cpl
    ld [hl+], a
    ld [hl], c
    inc hl
    ld [hl], b
    inc hl
    ld [hl], e
    inc hl
    ld [hl], d
    ld l, c
    ld h, b
    pop bc
    cpl
    cp $46
    jr z, jr_002_46c5

    ld l, c
    ld h, b

jr_002_46c5:
    ld a, d
    sub $c0
    or e
    jr nz, jr_002_46df

    ld de, $a002
    ldh a, [hRAMBank]
    inc a
    call Call_002_4475
    call Call_002_4877
    ldh a, [hRAMBank]
    dec a
    call Call_002_4475
    jr jr_002_46e2

jr_002_46df:
    call Call_002_4877

jr_002_46e2:
    ld de, $0006
    add hl, de
    call Call_002_470a
    add sp, $02
    jp Jump_002_443d


Jump_002_46ee:
    pop hl
    set 7, h
    jp Jump_002_445e


Call_002_46f4:
Jump_002_46f4:
    ldh a, [hRAMBank]
    push af

jr_002_46f7:
    call Call_002_446c
    ld d, $44
    call Call_002_471e
    jp c, Jump_002_4466

    call Call_002_470a
    call Call_002_47c5
    jr jr_002_46f7

Call_002_470a:
    ld a, h
    and $1f
    ld h, a
    ldh a, [hRAMBank]
    and $fc
    ldh [$97], a
    ldh a, [hRAMBank]
    and $03
    rrca
    rrca
    rrca
    or h
    ld h, a
    ret


Call_002_471e:
jr_002_471e:
    ld a, [hl]
    inc hl
    cpl
    cp [hl]
    jr nz, jr_002_475b

    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    dec hl
    dec hl
    dec hl
    ld a, b
    cp $a0
    jr c, jr_002_475b

    cp h
    jr c, jr_002_4742

    jr nz, jr_002_4739

    ld a, c
    cp l
    jr c, jr_002_4742

jr_002_4739:
    ldh a, [hRAMBank]
    or a
    jr z, jr_002_475b

    dec a
    call Call_002_4475

jr_002_4742:
    ld l, c
    ld h, b
    ld a, [hl]
    cp d
    ret z

    cp $46
    jr z, jr_002_471e

    cp $5a
    jr z, jr_002_471e

    cp $52
    jr z, jr_002_471e

    cp $44
    jr z, jr_002_471e

    cp $53
    jr z, jr_002_471e

jr_002_475b:
    scf
    ret


Call_002_475d:
    ld a, b
    cp $a0
    jr c, jr_002_476d

    cp h
    jr c, jr_002_476b

    jr nz, jr_002_4770

    ld a, c
    cp l
    jr nc, jr_002_4770

jr_002_476b:
    xor a
    ret


jr_002_476d:
    xor a
    scf
    ret


jr_002_4770:
    xor a
    inc a
    ret


Call_002_4773:
    call Call_002_475d
    ret c

    jp z, Jump_002_483d

    ldh a, [hRAMBank]
    dec a
    call Call_002_4475
    push hl
    ld hl, $c000
    call Call_002_483d
    pop hl
    push af
    ldh a, [hRAMBank]
    inc a
    call Call_002_4475
    pop af
    ret


Call_002_4791:
    ld a, d
    sub $c0
    or e
    jp nz, Jump_002_4856

    ldh a, [hRAMBank]
    inc a
    call Call_002_4475
    push de
    ld de, $a002
    call Call_002_4856
    pop de
    push af
    ldh a, [hRAMBank]
    dec a
    call Call_002_4475
    pop af
    ret


Call_002_47af:
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ret


trap_e7_47b7::
    ld a, h
    or l
    jp z, Jump_002_46f4

    ld de, $fffa
    add hl, de
    ccf
    ret c

    ld a, h
    rlca
    ret c

Call_002_47c5:
    ld e, l
    ld d, h
    ldh a, [hRAMBank]
    push af
    call trap_fb_4586
    push hl
    ld a, [hl+]
    cp $53
    jp z, Jump_002_4838

    cpl
    cp [hl]
    jp nz, Jump_002_4838

    inc hl
    call Call_002_47af
    pop hl
    call Call_002_4773
    jp nz, Jump_002_4466

    call Call_002_4791
    jp nz, Jump_002_4466

    call Call_002_4450
    ld a, $46
    ld [hl+], a
    cpl
    ld [hl-], a
    call Call_002_475d
    jr c, jr_002_4808

    jp nz, Jump_002_4808

    ld a, [bc]
    cp $46
    jr nz, jr_002_4808

jr_002_47ff:
    ld hl, $0004
    add hl, bc
    ld [hl], e
    inc hl
    ld [hl], d
    ld l, c
    ld h, b

Jump_002_4808:
jr_002_4808:
    ld b, h
    ld c, l
    ld a, d
    sub $c0
    or e
    jr nz, jr_002_4824

    ldh a, [hRAMBank]
    inc a
    call Call_002_4475
    ld de, $a002
    call Call_002_4877
    ldh a, [hRAMBank]
    dec a
    call Call_002_4475
    jr jr_002_4835

jr_002_4824:
    ld a, [de]
    cp $46
    jr nz, jr_002_4832

    ld hl, $0004
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    jr jr_002_47ff

jr_002_4832:
    call Call_002_4877

jr_002_4835:
    jp Jump_002_443d


Jump_002_4838:
    add sp, $02
    jp Jump_002_4466


Call_002_483d:
Jump_002_483d:
    push bc
    push de
    push hl
    ld a, [bc]
    ld d, a
    inc bc
    ld a, [bc]
    cpl
    cp d
    jr nz, jr_002_4852

    inc bc
    inc bc
    inc bc
    ld a, [bc]
    cp l
    jr nz, jr_002_4852

    inc bc
    ld a, [bc]
    cp h

jr_002_4852:
    pop hl
    pop de
    pop bc
    ret


Call_002_4856:
Jump_002_4856:
    push bc
    push de
    push hl
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    cpl
    cp b
    jr nz, jr_002_4852

    inc de
    ld a, [de]
    cp l
    jr nz, jr_002_4852

    inc de
    ld a, [de]
    cp h
    jr jr_002_4852

    push bc
    inc bc
    inc bc
    inc bc
    inc bc
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    pop bc
    ret


Call_002_4877:
    push de
    inc de
    inc de
    ld a, c
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    pop de
    ret


trap_f2_4881::
    push hl
    call Call_002_4889
    ld e, l
    ld d, h
    pop hl
    ret


Call_002_4889:
    call Call_002_48dc
    ret c

    ld e, l
    ld d, h
    ldh a, [hRAMBank]
    push af
    call trap_fb_4586
    push hl
    ld a, [hl+]
    cpl
    cp [hl]
    jp nz, Jump_002_4838

    inc hl
    call Call_002_47af
    pop hl
    call Call_002_4773
    jp nz, Jump_002_4466

    call Call_002_4791
    jp nz, Jump_002_4466

    call Call_002_475d
    jr c, jr_002_48ba

    jp nz, Jump_002_48ba

    ld a, [bc]
    cp $46
    jr z, jr_002_48bc

Jump_002_48ba:
jr_002_48ba:
    ld c, l
    ld b, h

jr_002_48bc:
    ld a, d
    sub $c0
    or e
    jr z, jr_002_48ce

    ld a, [de]
    cp $46
    jr nz, jr_002_48ce

    ld hl, $0004
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]

jr_002_48ce:
    ld a, e
    sub c
    ld l, a
    ld a, d
    sbc b
    ld h, a
    ld de, $fffa
    add hl, de
    xor a
    jp Jump_002_445e


Call_002_48dc:
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ldh [$97], a
    ld hl, $fffa
    add hl, de
    ccf
    ret c

    ld a, h
    rlca
    ret


trap_ef_48ec::
    call Call_002_48dc
    ret c

    push de
    call Call_002_47c5
    pop de
    ldh a, [hRAMBank]
    push af
    push de
    ld de, $fe00
    call Call_002_4450
    call trap_fb_4586
    ld b, a
    pop de

jr_002_4904:
    ld a, [hl+]
    cp e
    jr nz, jr_002_491d

    ld a, [hl+]
    cp d
    jr nz, jr_002_491e

    ldh a, [$97]
    cp [hl]
    jr nz, jr_002_491e

    xor a
    ld [hl-], a
    ld [hl-], a
    ld [hl], a
    ld a, $78
    sub b
    ldh [$b7], a
    jp Jump_002_443d


jr_002_491d:
    inc hl

jr_002_491e:
    inc hl
    inc hl
    dec b
    jr nz, jr_002_4904

    jp Jump_002_443d


trap_f1_4926::
    or a
    ldh a, [hRAMBank]
    push af
    push af
    ld de, $fe00
    call trap_fb_4586
    ld b, a
    ld c, $00

jr_002_4934:
    ld a, [hl+]
    or [hl]
    jr z, jr_002_4939

    inc c

jr_002_4939:
    inc hl
    inc hl
    inc hl
    dec b
    jr nz, jr_002_4934

    ld a, $78
    sub c
    ld b, a
    pop af
    jp z, Jump_002_445e

    push bc
    ld hl, $0000

jr_002_494b:
    push hl
    ld hl, $1ff8
    call trap_e6_45da
    bit 7, h
    jr nz, jr_002_495d

    pop hl
    ld de, $001f
    add hl, de
    jr jr_002_494b

jr_002_495d:
    ld a, h
    and $1f
    ld e, a
    ld d, $00
    pop hl
    add hl, de
    push hl
    call Call_002_46f4
    pop de
    pop bc
    jp Jump_002_445e


trap_8f_496e::
    push hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    cp $ff
    jp z, Jump_002_49dc

    ldh [$97], a
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl+]
    bit 0, a
    jr z, jr_002_49dc

    ld hl, $fffa
    add hl, de
    jr nc, jr_002_49dc

    ld a, h
    rlca
    jr c, jr_002_49dc

    push bc
    ldh a, [hRAMBank]
    push af
    call Call_002_4591
    ld bc, $000a
    add hl, bc
    ld c, [hl]
    inc hl
    add hl, bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    pop af
    call Call_002_4475
    pop bc
    ld a, c
    ld bc, $0000
    dec a
    jr z, jr_002_49ba

    ld a, e
    or d
    jr z, jr_002_49ba

    dec b
    dec c
    ld a, e
    cpl
    ld e, a
    ld a, d
    cpl
    ld d, a
    inc de

jr_002_49ba:
    ldh a, [hRAMBank]
    push af
    push de
    push bc
    ld e, $40
    call Call_002_45a8
    call Call_002_4450
    pop bc
    pop de
    ld a, [hl]
    add e
    ld [hl+], a
    ld a, [hl]
    adc d
    ld [hl+], a
    ld a, [hl]
    adc c
    ld [hl+], a
    ld a, [hl]
    adc b
    ld [hl], a
    pop af
    call Call_002_4475
    call Call_002_4442

Jump_002_49dc:
jr_002_49dc:
    pop hl
    ret


trap_e8_49de::
    ld c, l
    ld b, h
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    or e
    jr z, jr_002_4a05

    ld a, [hl]
    ldh [$97], a
    ld hl, $fffa
    add hl, de
    jr nc, jr_002_49fc

    ld a, h
    rlca
    jr c, jr_002_49fc

    ldh a, [hRAMBank]
    push af
    call Call_002_4591
    jr jr_002_4a0b

jr_002_49fc:
    ld l, c
    ld h, b
    scf
    ret


jr_002_4a00:
    ld l, c
    ld h, b
    jp Jump_002_4466


jr_002_4a05:
    ldh a, [hRAMBank]
    push af
    call Call_002_446c

jr_002_4a0b:
    ld e, l
    ld d, h
    ld a, [hl+]
    cpl
    cp [hl]
    jr nz, jr_002_4a00

    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, h
    cp $a0
    jr c, jr_002_4a00

    cp d
    jr c, jr_002_4a2d

    jr nz, jr_002_4a24

    ld a, l
    cp e
    jr c, jr_002_4a2d

jr_002_4a24:
    ldh a, [hRAMBank]
    or a
    jr z, jr_002_4a00

    dec a
    call Call_002_4475

jr_002_4a2d:
    ld a, [hl]
    cp $52
    jr z, jr_002_4a36

    cp $5a
    jr nz, jr_002_4a0b

jr_002_4a36:
    call Call_002_4a4b
    jp Jump_002_445e


trap_fc_4a3c::
    ld a, e
    ldh [$97], a
    ldh a, [hRAMBank]
    push af
    call Call_002_4591
    call Call_002_4a4f
    jp Jump_002_445e


Call_002_4a4b:
    ld de, $0006
    add hl, de

Call_002_4a4f:
    ld e, l
    ld d, h
    call Call_002_470a
    push bc
    ld a, l
    ld [bc], a
    inc bc
    ld a, h
    ld [bc], a
    inc bc
    ldh a, [$97]
    ld [bc], a
    inc bc
    ld l, c
    ld h, b
    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld b, a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld c, a
    or a
    jr z, jr_002_4a82

    push bc

jr_002_4a7b:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_002_4a7b

    pop bc

jr_002_4a82:
    pop hl
    call Call_002_4a88
    pop hl
    ret


Call_002_4a88:
    ld de, $002e
    bit 0, b
    jr nz, jr_002_4a90

    ld e, d

jr_002_4a90:
    ld a, $05
    add c
    ld c, a
    add e
    ld e, a
    ld a, d
    adc a
    ld [hl], e
    inc hl
    ld [hl], a
    inc hl
    ld [hl], e
    inc hl
    ld [hl], a
    ret


trap_e9_4aa0::
    ld a, c
    cp $ff
    jr nz, jr_002_4aa8

    ldh a, [$b7]
    ld c, a

jr_002_4aa8:
    push bc
    push hl
    ld a, $0b
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ld c, [hl]
    ld hl, $002e
    bit 0, b
    jr nz, jr_002_4abb

    ld l, h

jr_002_4abb:
    ld a, $05
    add c
    add l
    ld l, a
    ld a, h
    adc a
    ld h, a
    add hl, de
    ld e, l
    ld d, h
    pop hl
    pop bc
    push bc
    push hl
    ld a, $07
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    ld [hl], b
    ld a, $20
    bit 1, b
    jr z, jr_002_4adf

    ld a, $40

jr_002_4adf:
    or d
    ld h, a
    ld l, e
    call trap_e6_45da
    ld d, h
    ld e, l
    pop hl
    pop bc
    ld a, d
    rlca
    ret c

    push bc
    push hl
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    ldh a, [$97]
    ld [hl], a
    inc hl
    push hl
    ld bc, $0006
    add hl, bc
    ld b, [hl]
    inc hl
    inc hl
    ld c, [hl]
    pop hl
    push de
    call Call_002_4a88
    pop de
    pop hl
    push hl
    push de
    push bc
    ld b, $00
    ld a, $07
    add l
    ld l, a
    ld a, b
    adc h
    ld h, a
    call trap_e5_45ca
    pop bc
    pop hl
    pop de
    push de
    bit 0, b
    jr z, jr_002_4b5c

    ld b, $00
    add hl, bc
    add sp, -$2e
    push hl
    ld hl, $0007
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $000a
    trap $8a
    ld de, $000a
    trap $89
    ld e, l
    ld d, h
    ld hl, sp+$02
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    push hl
    ld de, $ff46
    ld bc, $000a
    push bc
    call trap_e4_4577
    pop bc
    pop hl
    add hl, bc
    xor a
    ld b, $22

jr_002_4b4d:
    ld [hl+], a
    dec b
    jr nz, jr_002_4b4d

    ld hl, sp+$02
    pop de
    ld bc, $002e
    call trap_e5_45ca
    add sp, $2e

jr_002_4b5c:
    pop hl
    pop de
    ldh a, [hRAMBank]
    push af
    push hl
    push hl
    ld d, $fe
    call Call_002_4450
    call trap_fb_4586
    ld b, a

jr_002_4b6c:
    ld a, [hl+]
    or [hl]
    jr z, jr_002_4b7e

    inc hl
    inc hl
    inc hl
    dec b
    jr nz, jr_002_4b6c

    pop hl
    call trap_ef_48ec
    pop hl
    jp Jump_002_4447


jr_002_4b7e:
    dec hl
    pop de
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    inc de
    inc de
    inc de
    inc de
    inc de
    inc de
    inc de
    inc de
    inc de
    ld a, [de]
    ld [hl], a
    pop hl
    jp Jump_002_443d


trap_ea_4b98::
    push hl
    inc hl
    inc hl
    inc hl
    push hl
    ld a, b
    call Call_002_4bb9
    pop hl
    push af
    jr c, jr_002_4ba9

    ld [hl], e
    inc hl
    ld [hl], d
    dec hl

jr_002_4ba9:
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld d, a
    pop af
    pop hl
    ret


Call_002_4bb9:
    or a
    jr z, jr_002_4bc4

    dec a
    jr z, jr_002_4bdc

    dec a
    jr z, jr_002_4be3

    scf
    ret


jr_002_4bc4:
    inc hl
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]

jr_002_4bc9:
    inc hl

jr_002_4bca:
    ld a, e
    add c
    ld e, a
    ld a, d
    adc b
    ld d, a
    cp $20
    ccf
    ret c

    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, c
    sub e
    ld a, b
    sbc d
    ret


jr_002_4bdc:
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc hl
    inc hl
    jr jr_002_4bc9

jr_002_4be3:
    inc hl
    inc hl
    inc hl
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    dec hl
    jr jr_002_4bca

trap_f0_4bed::
    add sp, -$0a
    push hl
    push de
    ld de, $ffd2
    ld b, $00
    call trap_ea_4b98
    pop de
    push de
    ld bc, $002e
    call trap_eb_4c9a
    pop de
    push bc
    push de
    jr c, jr_002_4c7e

    ld a, c
    cp $2e
    jr c, jr_002_4c7e

    ld hl, sp+$06
    ld de, $ff46
    ld bc, $000a
    call trap_e4_4577
    pop hl
    push hl
    ld a, [hl+]
    ld d, [hl]
    ld e, a
    or d
    jr z, jr_002_4c29

    srl d
    rr e
    jr nc, jr_002_4c25

    inc de

jr_002_4c25:
    ld [hl], d
    dec hl
    ld [hl], e
    inc hl

jr_002_4c29:
    inc hl
    ld b, $04

jr_002_4c2c:
    ld e, l
    ld d, h
    ld a, [de]
    or a
    jr z, jr_002_4c5c

    ld hl, sp+$06
    push bc
    push de
    ld bc, $000a
    trap $67
    ld a, h
    or l
    pop de
    pop bc
    jr z, jr_002_4c6a

    ld hl, $000b
    add hl, de
    dec b
    jr nz, jr_002_4c2c

    pop de
    push de
    ld hl, $000d
    add hl, de
    ld e, l
    ld d, h
    ld hl, $000b
    add hl, de
    ld b, $16

jr_002_4c56:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_002_4c56

jr_002_4c5c:
    ld hl, sp+$06
    push de
    ld b, $0a

jr_002_4c61:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_002_4c61

    xor a
    ld [de], a
    pop de

jr_002_4c6a:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jr z, jr_002_4c74

    inc [hl]

jr_002_4c74:
    pop de
    pop bc
    pop hl
    push hl
    push bc
    push de
    call Call_002_4c8b
    xor a

jr_002_4c7e:
    pop de
    pop bc
    pop hl
    jr c, jr_002_4c87

    add sp, $0a
    xor a
    ret


jr_002_4c87:
    add sp, $0a
    scf
    ret


Call_002_4c8b:
    push de
    push bc
    ld de, $ffd2
    ld b, $00
    call trap_ea_4b98
    pop bc
    pop de
    jp trap_ec_4ca9


trap_eb_4c9a::
    push hl
    push de
    call Call_002_4cb8
    pop hl
    push bc
    ldh [$97], a
    call trap_e4_4577
    pop bc
    pop hl
    ret


trap_ec_4ca9::
    push hl
    push de
    call Call_002_4cb8
    pop hl
    push bc
    ldh [$97], a
    call trap_e5_45ca
    pop bc
    pop hl
    ret


Call_002_4cb8:
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld a, [hl]
    inc hl
    push af
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl]
    adc d
    ld d, a
    push de
    push hl
    push bc
    ld d, [hl]
    dec hl
    ld e, [hl]
    inc hl
    inc hl
    inc hl
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, c
    sub e
    ld e, a
    ld a, b
    sbc d
    ld d, a
    pop bc
    pop hl
    ld a, e
    sub c
    ld a, d
    sbc b
    jr nc, jr_002_4ce2

    ld c, e
    ld b, d

jr_002_4ce2:
    ld d, [hl]
    dec hl
    ld e, [hl]
    ld a, e
    add c
    ld e, a
    ld a, d
    adc b
    ld d, a
    ld [hl], e
    inc hl
    ld [hl], d
    pop de
    pop af
    ret


trap_ed_4cf1::
    push de
    push hl
    ld a, [hl+]
    or [hl]
    ld a, $ff
    jr z, jr_002_4d4c

    ld bc, $0008
    add hl, bc
    ld c, [hl]
    inc hl
    inc hl
    ld b, [hl]
    inc hl
    ld a, l
    ld l, e
    ld e, a
    ld a, h
    ld h, d
    ld d, a
    ld a, b
    bit 4, c
    jp z, Jump_002_4d44

    or a
    push af
    bit 3, c
    jp nz, Jump_002_4d26

    sub $61
    add e
    ld e, a
    ld a, $00
    adc d
    ld d, a
    inc de
    ld bc, $0060
    call Call_002_4167
    jr jr_002_4d37

Jump_002_4d26:
    sub $c1
    add e
    ld e, a
    ld a, $00
    adc d
    ld d, a
    inc de
    ld b, $04

jr_002_4d31:
    call Call_002_4d3b
    dec b
    jr nz, jr_002_4d31

Jump_002_4d37:
jr_002_4d37:
    pop af
    pop hl
    pop de
    ret


Call_002_4d3b:
    ld c, $30

jr_002_4d3d:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_002_4d3d

    ret


Jump_002_4d44:
    ld c, a
    ld a, [de]
    inc de
    or a
    jr z, jr_002_4d6f

    ld d, h
    ld e, l

jr_002_4d4c:
    ld b, a
    ld c, $00
    ld hl, $784e

jr_002_4d52:
    ld a, [hl+]
    cp b
    jr z, jr_002_4d5c

    inc c
    or a
    jr nz, jr_002_4d52

    dec c
    scf

jr_002_4d5c:
    push af
    ld l, e
    ld h, d
    ld a, c
    add a
    add a
    ld e, a
    add a
    add e
    ld e, a
    ld d, $a2
    ld b, $0c
    trap $1b
    jp Jump_002_4d37


jr_002_4d6f:
    ld a, c
    dec a
    ld bc, $2020
    push bc
    push bc
    push bc
    push bc
    push bc
    push bc
    push hl
    ld c, e
    ld b, d
    ld d, a
    ld e, $00
    ld h, $00

jr_002_4d82:
    ld a, [bc]
    inc bc
    cp $0e
    jr z, jr_002_4da7

    cp $0f
    jr z, jr_002_4da7

    push de
    ld e, a
    ld a, [bc]
    ld d, a
    call trap_a7_5b8d
    pop de
    jr nc, jr_002_4d9a

    inc bc
    dec d
    jr z, jr_002_4dc6

jr_002_4d9a:
    cp $60
    jr c, jr_002_4db3

    cp $b0
    jr nc, jr_002_4da4

    add $50

jr_002_4da4:
    sub h
    jr jr_002_4db3

jr_002_4da7:
    sub $0e
    jr z, jr_002_4dad

    ld a, $50

jr_002_4dad:
    ld h, a
    dec d
    jr z, jr_002_4dc6

    jr jr_002_4d82

jr_002_4db3:
    push de
    push hl
    ld d, $00
    ld hl, sp+$06
    add hl, de
    ld [hl], a
    pop hl
    pop de
    dec d
    jr z, jr_002_4dc6

    inc e
    ld a, e
    cp $0c
    jr nz, jr_002_4d82

jr_002_4dc6:
    ld hl, sp+$02
    ld e, l
    ld d, h
    pop hl
    ld b, $04

jr_002_4dcd:
    push bc
    push de
    call Call_002_4de4
    call Call_002_4de4
    call Call_002_4dee
    pop de
    pop bc
    inc de
    dec b
    jr nz, jr_002_4dcd

    add sp, $0c
    pop hl
    pop de
    xor a
    ret


Call_002_4de4:
    push de
    call Call_002_4dee
    pop de
    inc de
    inc de
    inc de
    inc de
    ret


Call_002_4dee:
    ld a, [de]
    ld e, a
    ld c, $03
    jp trap_ba_5681


jr_002_4df5:
    db $76

trap_fd_4df6::
    ldh a, [$89]
    ld b, a
    ld a, $c8
    sub b
    sub $12
    jr c, jr_002_4df5

    push hl
    push bc
    add $04
    ld l, a
    add hl, hl
    add hl, hl
    ld c, $05
    call Call_002_525a
    ld a, l
    pop bc
    pop hl
    ld b, $40
    cp b
    ret nc

    ld b, a
    ret


jr_002_4e15:
    db $76

Call_002_4e16:
    ldh a, [$89]
    ld b, a
    ld a, $c8
    sub b
    sub $15
    jr c, jr_002_4e15

    push hl
    push bc
    add $05
    ld l, a
    add hl, hl
    add hl, hl
    ld c, $06
    call Call_002_525a
    ld a, l
    pop bc
    pop hl
    ld b, $40
    cp b
    ret nc

    ld b, a
    ret


jr_002_4e35:
    db $76

trap_ff_4e36::
    ldh a, [$88]
    ld b, a
    ldh a, [$87]
    sub b
    add c
    jr c, jr_002_4e35

    cp $f0
    jr nc, jr_002_4e35

    ld a, c
    srl a
    srl a
    inc a
    add c
    add $12
    ld b, a
    jr jr_002_4e50

jr_002_4e4f:
    db $76

jr_002_4e50:
    ldh a, [$89]
    add b
    jr c, jr_002_4e4f

    cp $c8
    jr nc, jr_002_4e4f

    push bc
    push hl
    ldh a, [$87]
    ld l, a
    ld h, $c2
    ld [hl], $02
    inc l
    ld [hl], b
    inc l
    ld a, $40
    sub c
    ld b, a
    add a
    add b
    ld bc, data_02_511d
    add c
    ld [hl], a
    ld a, $00
    adc b
    inc l
    ld [hl], a
    inc l
    pop bc
    ld [hl], c
    inc l
    ld [hl], b
    inc l
    pop bc
    ret


trap_fe_4e7d::
    ld a, b
    or a

jr_002_4e7f:
    push af
    call Call_002_4e16
    pop af
    push af
    jr nz, jr_002_4e8b

    ld a, b
    cp c
    jr nc, jr_002_4eab

jr_002_4e8b:
    push bc
    push hl
    push de
    ld c, b
    ld b, $00
    push bc
    call Call_002_4eb8
    pop bc
    pop hl
    add hl, bc
    ld e, l
    ld d, h
    pop hl
    add hl, bc
    pop bc
    pop af
    push hl
    ld l, b
    ld b, a
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc $00
    ld b, a
    pop hl
    jr jr_002_4e7f

jr_002_4eab:
    pop af
    call Call_002_4eb8

trap_c3_4eaf::
    ei
    db $76
    ldh a, [$89]
    or a
    jr nz, trap_c3_4eaf

    ret


jr_002_4eb7:
    db $76

Call_002_4eb8:
    ldh a, [$88]
    ld b, a
    ldh a, [$87]
    sub b
    cp $f0
    jr nc, jr_002_4eb7

    ld a, c
    srl a
    inc a
    add c
    add $15
    ld b, a
    jr jr_002_4ecd

jr_002_4ecc:
    db $76

jr_002_4ecd:
    ldh a, [$89]
    add b
    jr c, jr_002_4ecc

    cp $c8
    jr nc, jr_002_4ecc

    push hl
    push de
    ldh a, [$87]
    ld l, a
    ld h, $c2
    ld [hl], $03
    inc l
    ld [hl], b
    inc l
    ld a, $40
    sub c
    ld e, a
    add a
    add e
    ld de, data_02_4fcf
    add e
    ld [hl], a
    ld a, $00
    adc d
    inc l
    ld [hl], a
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    di
    ld a, l
    ldh [$87], a
    ldh a, [$89]
    add b
    ldh [$89], a
    ei
    ret


    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, [hl]
    cpl
    ld [hl+], a
    ld a, b
    ldh [$89], a
    ld a, c
    ldh [$88], a
    ret


data_02_4fcf::
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, b
    ldh [$89], a
    ld a, c
    ldh [$88], a
    ret


data_02_5096::
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld a, b
    ldh [$89], a
    ld a, c
    ldh [$88], a
    ret


data_02_511d::
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, [de]
    inc e
    ld [hl+], a
    ld a, e
    ldh [$88], a
    ld a, b
    ldh [$89], a
    ret


data_02_51e4::
    ldh a, [$88]
    ld l, a
    ldh a, [$87]
    sub l
    ret z

    ldh a, [rLY]
    cp $90
    ret c

    ld e, a
    ld h, $c2
    ld c, [hl]
    inc l
    ld b, [hl]
    inc l
    ld a, $99
    sub e
    ret z

    ld e, a
    add a
    ld d, a
    add a
    add a
    ld h, a
    add a
    add h
    add d
    add e
    sub $07
    cp b
    ret c

    ld h, $c2
    ld de, data_02_51e4
    push de
    ldh a, [$89]
    sub b
    ld b, a
    ld e, [hl]
    inc l
    ld d, [hl]
    inc l
    push de
    ld a, c
    cp $02
    jr z, jr_002_523a

    cp $01
    jr z, jr_002_5243

    cp $03
    jr z, jr_002_524d

    cp $04
    jr z, jr_002_5233

    pop af
    pop af
    xor a
    ldh [$87], a
    ldh [$88], a
    ldh [$89], a
    ret


jr_002_5233:
    ld a, [hl]
    inc l
    ld h, [hl]
    inc l
    ld c, l
    ld l, a
    ret


jr_002_523a:
    ld c, [hl]
    inc l
    ld a, [hl]
    inc l
    ld e, l
    ld d, h
    ld l, c
    ld h, a
    ret


jr_002_5243:
    ld e, [hl]
    inc l
    ld d, [hl]
    inc l
    ld a, [hl]
    inc l
    ld c, l
    ld l, e
    ld h, d
    ret


jr_002_524d:
    ld c, [hl]
    inc l
    ld a, [hl]
    inc l
    ld e, [hl]
    inc l
    ld d, [hl]
    inc l
    ld h, a
    ld a, l
    ld l, c
    ld c, a
    ret


Call_002_525a:
    ld b, $08

jr_002_525c:
    add hl, hl
    ld a, h
    sub c
    jr c, jr_002_5263

    ld h, a
    inc l

jr_002_5263:
    dec b
    jr nz, jr_002_525c

    ret


trap_80_5267::
    ld a, h
    xor d
    ld h, a
    ld a, l
    xor e
    ld l, a
    ret


trap_81_526e::
    ld a, h
    or d
    ld h, a
    ld a, l
    or e
    ld l, a
    ret


trap_82_5275::
    ld a, h
    and d
    ld h, a
    ld a, l
    and e
    ld l, a
    ret


trap_83_527c::
    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    ld l, a
    ret


trap_84_5283::
    ld a, d
    xor h
    rlca
    ld a, d
    jr c, jr_002_5295

    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    ld b, $01
    or l
    jr z, jr_002_529c

    ld a, h

jr_002_5295:
    ld b, $02
    rlca
    jr c, jr_002_529c

    ld b, $04

jr_002_529c:
    ld a, b
    ld b, $00
    ld hl, data_02_52aa
    add hl, bc
    and [hl]
    jr z, jr_002_52da

    ld hl, $ffff
    ret


data_02_52aa::
    db $06, $06
    db $05, $05
    db $03, $03
    db $04, $02, $01

trap_85_52b3::
    ld a, h
    or a
    jr nz, jr_002_52da

    ld a, l
    cp $10
    jr nc, jr_002_52da

    ld l, e
    ld h, d
    or a
    ret z

jr_002_52c0:
    srl h
    rr l
    dec a
    jr nz, jr_002_52c0

    ret


trap_86_52c8::
    ld a, h
    or a
    jr nz, jr_002_52da

    ld a, l
    cp $10
    jr nc, jr_002_52da

    ld l, e
    ld h, d
    or a
    ret z

jr_002_52d5:
    add hl, hl
    dec a
    jr nz, jr_002_52d5

    ret


jr_002_52da:
    ld hl, $0000
    ret


trap_87_52de::
    add hl, de
    ret


trap_88_52e0::
    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    ret


trap_89_52e7::
    ld a, h
    or l
    ret z

    ld a, d
    or e
    jr z, jr_002_52da

    ld a, h
    xor d
    rlca
    push af
    ld a, d
    rlca
    jr nc, jr_002_52fd

    ld a, d
    cpl
    ld d, a
    ld a, e
    cpl
    ld e, a
    inc de

jr_002_52fd:
    ld a, h
    rlca
    jr nc, jr_002_5308

    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    ld l, a
    inc hl

jr_002_5308:
    ld b, h
    ld c, l
    ld hl, $0000
    ld a, $10

jr_002_530f:
    add hl, hl
    rl c
    rl b
    jr nc, jr_002_531d

    add hl, de
    jr nc, jr_002_531d

    inc c
    jr nz, jr_002_531d

    inc b

jr_002_531d:
    dec a
    jr nz, jr_002_530f

    jr jr_002_5378

trap_8a_5322::
    ld a, h
    or l
    jr nz, jr_002_532e

    xor a
    ld [$c3b0], a
    ld [$c3b1], a
    ret


jr_002_532e:
    ld a, d
    xor h
    rlca
    push af
    ld a, d
    rlca
    push af
    jr nc, jr_002_533e

    ld a, d
    cpl
    ld d, a
    ld a, e
    cpl
    ld e, a
    inc de

jr_002_533e:
    ld a, h
    rlca
    jr nc, jr_002_5349

    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    ld l, a
    inc hl

jr_002_5349:
    ld b, h
    ld c, l
    ld hl, $0000
    ld a, $10

jr_002_5350:
    push af
    sla e
    rl d
    rl l
    rl h
    ld a, l
    sub c
    ld a, h
    sbc b
    jr c, jr_002_5364

    ld h, a
    ld a, l
    sub c
    ld l, a
    inc e

jr_002_5364:
    pop af
    dec a
    jr nz, jr_002_5350

    pop af
    jr nc, jr_002_536e

    call trap_8b_537a

jr_002_536e:
    ld a, l
    ld [$c3b0], a
    ld a, h
    ld [$c3b1], a
    ld l, e
    ld h, d

jr_002_5378:
    pop af
    ret nc

trap_8b_537a::
    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    ld l, a
    inc l
    ret nz

    inc h
    ret


trap_8c_5384::
    bit 7, h
    ret z

    jr trap_8b_537a

trap_8e_5389::
    ld hl, $c3b2
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, h
    rlca
    rlca
    rlca
    xor l
    rrca
    push af
    ld a, h
    xor l
    ld h, a
    ld a, [$c3b4]
    inc a
    ld [$c3b4], a
    xor l
    ld l, a
    pop af
    rl l
    rl h
    ld a, l
    ld [$c3b2], a
    ld a, h

data_02_53ac::
    ld [$c3b3], a
    xor l
    ld l, a
    ld h, $00
    ret


trap_8d_53b4::
    ld a, l
    ld [$c3b2], a
    ld a, h
    ld [$c3b3], a
    xor a
    ld [$c3b4], a
    ret


trap_a1_53c1::
    call Call_002_53c8
    ret c

    ld [hl+], a
    jr trap_a1_53c1

Call_002_53c8:
    ld c, $00
    ld a, [de]
    call Call_002_53df
    ret c

    ld c, a
    inc de
    ld a, [de]
    call Call_002_53df
    ret c

    inc de
    ld b, a
    ld a, c
    rlca
    rlca
    rlca
    rlca
    or b
    ret


Call_002_53df:
    or $20
    sub $30
    ret c

    cp $0a
    ccf
    ret nc

    sub $27
    cp $0a
    ret c

    cp $10
    ccf
    ret


trap_a2_53f1::
    ld e, l
    ld d, h

jr_002_53f3:
    ld a, [de]
    inc de
    cp $20
    jr z, jr_002_53f3

    cp $27
    jr z, jr_002_5425

    cp $24
    jr z, jr_002_541d

    cp $2b
    jr z, jr_002_540a

    cp $2d
    jr z, jr_002_5412

    dec de

Call_002_540a:
jr_002_540a:
    call Call_002_5433
    ret nc

    ld hl, $0000
    ret


jr_002_5412:
    call Call_002_540a
    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    ld l, a
    inc hl
    ret


jr_002_541d:
    call Call_002_5456
    ret nc

    ld hl, $0000
    ret


jr_002_5425:
    ld hl, $0000

jr_002_5428:
    ld a, [de]
    or a
    ret z

    cp $27
    ret z

    ld h, l
    ld l, a
    inc de
    jr jr_002_5428

Call_002_5433:
    ld hl, $0000

jr_002_5436:
    ld a, [de]
    or a
    ret z

    cp $30
    ccf
    ret nc

    cp $3a
    ret nc

    inc de
    sub $30
    ld c, l
    ld b, h
    add hl, hl
    ret c

    add hl, hl
    ret c

    add hl, bc
    ret c

    add hl, hl
    ret c

    add l
    ld l, a
    ld a, h
    adc $00
    ld h, a
    jr nc, jr_002_5436

    ret


Call_002_5456:
    ld hl, $0000

jr_002_5459:
    ld a, [de]
    or a
    ret z

    sub $30
    ccf
    ret nc

    cp $0a
    jr c, jr_002_5471

    add $30
    and $df
    sub $37
    cp $0a
    ccf
    ret nc

    cp $10
    ret nc

jr_002_5471:
    add hl, hl
    ret c

    add hl, hl
    ret c

    add hl, hl
    ret c

    add hl, hl
    ret c

    add l
    ld l, a
    inc de
    jr jr_002_5459

trap_a3_547e::
    ld [hl], $20
    inc hl
    ld a, l
    ld l, e
    ld e, a
    ld a, h
    ld h, d
    ld d, a
    ld a, $20
    bit 7, h
    jr z, jr_002_5496

    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    ld l, a
    inc hl
    ld a, $2d

jr_002_5496:
    push af
    push de
    ld bc, $d8f0
    call Call_002_54c9
    ld bc, $fc18
    call Call_002_54c9
    ld bc, $ff9c
    call Call_002_54c9
    ld bc, $fff6
    call Call_002_54c9
    ld a, l
    add $30
    ld [de], a
    inc de
    xor a
    ld [de], a
    pop hl
    ld b, $04

jr_002_54ba:
    ld a, [hl]
    cp $30
    jr nz, jr_002_54c5

    ld [hl], $20
    inc hl
    dec b
    jr nz, jr_002_54ba

jr_002_54c5:
    dec hl
    pop af
    ld [hl], a
    ret


Call_002_54c9:
    ld a, $2f

jr_002_54cb:
    inc a
    add hl, bc
    jr c, jr_002_54cb

    ld [de], a
    inc de
    ld a, l
    sub c
    ld l, a
    ld a, h
    sbc b
    ld h, a
    ret


trap_a0_54d8::
    ld [hl], $20
    inc hl
    ld a, l
    ld l, e
    ld e, a
    ld a, h
    ld h, d
    ld d, a
    ld a, $20
    bit 7, b
    jr z, jr_002_5503

    ld a, b
    cpl
    ld b, a
    ld a, c
    cpl
    ld c, a
    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    add $01
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ld a, $00
    adc c
    ld c, a
    ld a, $00
    adc b
    ld b, a
    ld a, $2d

jr_002_5503:
    push af
    push de
    push bc
    push hl
    push de
    ld de, $c465
    ld bc, $3600
    call Call_002_556c
    ld de, $fa0a
    ld bc, $1f00
    call Call_002_556c
    ld de, $ff67
    ld bc, $6980
    call Call_002_556c
    ld de, $fff0
    ld bc, $bdc0
    call Call_002_556c
    ld de, $fffe
    ld bc, $7960
    call Call_002_556c
    ld de, $ffff
    ld bc, $d8f0
    call Call_002_556c
    pop de
    pop hl
    pop bc
    ld bc, $fc18
    call Call_002_54c9
    ld bc, $ff9c
    call Call_002_54c9
    ld bc, $fff6
    call Call_002_54c9
    ld a, l
    add $30
    ld [de], a
    inc de
    xor a
    ld [de], a
    pop hl
    ld b, $09

jr_002_555d:
    ld a, [hl]
    cp $30
    jr nz, jr_002_5568

    ld [hl], $20
    inc hl
    dec b
    jr nz, jr_002_555d

jr_002_5568:
    dec hl
    pop af
    ld [hl], a
    ret


Call_002_556c:
    ld a, $2f
    push af

jr_002_556f:
    ld hl, sp+$01
    inc [hl]
    ld hl, sp+$06
    ld a, [hl]
    add c
    ld [hl+], a
    ld a, [hl]
    adc b
    ld [hl+], a
    ld a, [hl]
    adc e
    ld [hl+], a
    ld a, [hl]
    adc d
    ld [hl], a
    jr c, jr_002_556f

    pop af
    ld hl, sp+$02
    push de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld [de], a
    inc de
    ld [hl], d
    dec hl
    ld [hl], e
    pop de
    ld hl, sp+$04
    ld a, [hl]
    sub c
    ld [hl+], a
    ld a, [hl]
    sbc b
    ld [hl+], a
    ld a, [hl]
    sbc e
    ld [hl+], a
    ld a, [hl]
    sbc d
    ld [hl], a
    ret


trap_a4_559e::
    ld a, l
    ld l, e
    ld e, a
    ld a, h
    ld h, d
    ld d, a
    push de
    ld a, h
    call Call_002_55b3
    ld a, l
    call Call_002_55b3
    xor a
    ld [de], a
    pop hl
    inc hl
    inc hl
    ret


Call_002_55b3:
    push af
    and $f0
    rrca
    rrca
    rrca
    rrca
    call Call_002_55c8
    ld [de], a
    inc de
    pop af
    and $0f
    call Call_002_55c8
    ld [de], a
    inc de
    ret


Call_002_55c8:
    cp $0a
    jr nc, jr_002_55cf

    add $30
    ret


jr_002_55cf:
    add $37
    ret


trap_a5_55d2::
    push hl
    ld a, d
    or a
    jr z, jr_002_55d9

    ld [hl], d
    inc hl

jr_002_55d9:
    ld [hl], e
    inc hl
    ld [hl], $00
    pop hl
    ret


trap_a6_55df::
    ld a, b
    or c
    ret z

    ldh a, [$86]
    or a
    jr z, jr_002_55ee

    ld a, h
    and $e0
    cp $80
    jr z, jr_002_55f6

jr_002_55ee:
    ld [hl], e
    inc hl
    dec bc
    ld a, b
    or c
    jr nz, jr_002_55ee

    ret


jr_002_55f6:
    ld a, b
    or a

jr_002_55f8:
    push af
    call Call_002_566e
    pop af
    push af
    jr nz, jr_002_5607

    ld a, b
    cp c
    jr c, jr_002_5607

    pop af
    jr jr_002_5623

jr_002_5607:
    push bc
    push hl
    ld c, b
    ld b, $00
    push bc
    call Call_002_5623
    pop bc
    pop hl
    add hl, bc
    pop bc
    pop af
    push hl
    ld l, b
    ld b, a
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc $00
    ld b, a
    pop hl
    jr jr_002_55f8

jr_002_5622:
    db $76

Call_002_5623:
jr_002_5623:
    ldh a, [$88]
    ld b, a
    ldh a, [$87]
    sub b
    cp $f0
    jr nc, jr_002_5622

    ld a, c
    srl a
    inc a
    add $13
    ld b, a
    jr jr_002_5637

jr_002_5636:
    db $76

jr_002_5637:
    ldh a, [$89]
    add b
    jr c, jr_002_5636

    cp $c8
    jr nc, jr_002_5636

    push de
    push hl
    ldh a, [$87]
    ld l, a
    ld h, $c2
    ld [hl], $01
    inc l
    ld [hl], b
    inc l
    ld a, $80
    sub c
    ld de, data_02_5096
    add e

data_02_5653::
    ld [hl], a
    ld a, $00
    adc d
    inc l
    ld [hl], a
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    di
    ld a, l
    ldh [$87], a
    ldh a, [$89]
    add b
    ldh [$89], a
    ei
    ret


jr_002_566d:
    db $76

Call_002_566e:
    ldh a, [$89]
    ld b, a
    ld a, $c8
    sub b
    sub $13
    jr c, jr_002_566d

    ld b, $80
    inc a
    add a
    ret c

    cp b
    ret nc

    ld b, a
    ret


trap_ba_5681::
    push bc
    push de
    push hl
    ld l, e
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld de, image_02_6f8e
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld b, $08

jr_002_5693:
    ld a, $ff
    bit 4, c
    jr nz, jr_002_56a1

    inc a
    bit 0, c
    jr z, jr_002_56a7

    ld a, [de]
    jr jr_002_56a7

jr_002_56a1:
    bit 0, c
    jr nz, jr_002_56a7

    ld a, [de]
    cpl

jr_002_56a7:
    ld [hl+], a
    ld a, $ff
    bit 5, c
    jr nz, jr_002_56b6

    inc a
    bit 1, c
    jr z, jr_002_56bc

    ld a, [de]
    jr jr_002_56bc

jr_002_56b6:
    bit 0, c
    jr nz, jr_002_56bc

    ld a, [de]
    cpl

jr_002_56bc:
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_002_5693

    pop de
    pop bc
    ret


trap_c5_56c4::
    push bc
    push hl
    push de
    ld d, c
    push de
    push af
    ld l, b
    ld h, $00
    ld d, h
    ld e, c
    trap $89
    ld b, l
    pop af
    call trap_c6_5730
    jp c, Jump_002_5715

    ldh [$a1], a
    ld e, l
    ld d, h
    ldh a, [rLCDC]
    and $04
    rrca
    rrca
    inc a
    ld c, a

jr_002_56e5:
    ld hl, sp+$02
    ld a, [hl]
    ld [de], a
    ld a, c
    add a
    add a
    add a
    add [hl]
    ld [hl+], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    inc de
    add c
    ld [hl+], a
    ld a, [hl+]
    ld [de], a
    inc de
    dec [hl]
    ld a, [hl]
    or a
    jr nz, jr_002_56e5

    push hl
    ld hl, sp+$02
    ld a, [hl+]
    ld b, [hl]
    ld hl, sp+$04
    ld [hl], a
    inc hl
    ld a, [hl]
    add $08
    ld [hl], a
    pop hl
    ld a, b
    ld [hl+], a
    dec [hl]
    ld a, [hl]
    or a
    jr nz, jr_002_56e5

Jump_002_5715:
    pop de
    pop de
    pop hl
    pop bc
    ldh a, [$a1]
    ret


trap_c7_571c::
    call trap_c6_5730
    jr c, jr_002_572d

jr_002_5721:
    ld a, [hl]
    add e
    ld [hl+], a
    ld a, [hl]
    add d
    ld [hl+], a
    inc hl
    inc hl
    dec b
    jr nz, jr_002_5721

    or a

jr_002_572d:
    ldh a, [$a1]
    ret


trap_c6_5730::
    cp $ff
    jr nz, jr_002_5736

    ldh a, [$a1]

jr_002_5736:
    ld l, a
    add b
    cp $41
    ccf
    ret c

    push af
    ld a, l
    add a
    add a
    ld hl, $c300
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    pop af
    ret


trap_b3_574b::
    push af
    push bc
    push de
    push hl
    di
    call trap_b0_5ff2
    ld hl, $9800
    call trap_b7_58f8
    xor a
    ldh [$8e], a
    ldh [$8f], a
    call Call_002_58e1
    call Call_002_5831
    call Call_002_5843
    call Call_002_58c1
    call trap_db_60e2
    ldh a, [rIE]
    or $01
    ldh [rIE], a
    ei
    pop hl
    pop de
    pop bc
    pop af
    push af
    and $cc
    or $03
    call Call_002_5798
    xor a
    call Call_002_66aa
    pop af
    and $20
    ret nz

    ld a, $07

trap_b4_578a::
    or $80
    ldh [$86], a
    ldh [rLCDC], a
    xor a
    ldh [rBGP], a
    ldh [rOBP0], a
    ldh [rOBP1], a
    ret


Call_002_5798:
    bit 7, a
    jr nz, jr_002_57cb

    ld a, $03
    ldh [$92], a
    ld e, $20
    call Call_002_5850
    ld hl, $8800
    ld e, $80
    ld bc, $0003

jr_002_57ad:
    push bc
    push de
    push hl
    ld hl, $c3e0
    push hl
    call trap_ba_5681
    pop de
    pop hl
    push hl
    ld bc, $0010
    trap $02
    pop hl
    ld bc, $0010
    add hl, bc
    pop de
    pop bc
    inc e
    dec b
    jr nz, jr_002_57ad

    ret


jr_002_57cb:
    bit 2, a
    jr nz, jr_002_57d1

    ld h, $04

jr_002_57d1:
    push af
    push bc
    push de
    push hl
    push bc
    push de
    and $83
    or $08
    ldh [$92], a
    ld e, $7f
    call Call_002_5850
    pop de
    pop bc
    ld a, $80
    call trap_c9_5c54
    pop bc
    push bc
    call Call_002_5d7b
    pop hl
    pop de
    pop bc
    pop af
    bit 6, a
    jr z, jr_002_5801

    push hl
    dec b
    dec c
    inc d
    inc d
    inc e
    inc e
    call Call_002_5cb6
    pop hl

jr_002_5801:
    call trap_ca_5859
    ld a, [$c3bb]
    add $80
    cp $b5
    ret nc

    ld hl, $9340
    ld e, $21
    ld bc, $3f03

jr_002_5814:
    push bc
    push de
    push hl
    ld hl, $c3e0
    push hl
    call trap_ba_5681
    pop de
    pop hl
    push hl
    ld bc, $0010
    push bc
    trap $02
    pop bc
    pop hl
    add hl, bc
    pop de
    pop bc
    inc e
    dec b
    jr nz, jr_002_5814

    ret


Call_002_5831:
    xor a
    ldh [rSCY], a
    ldh [rSCX], a
    ldh [rWY], a
    ldh [rWX], a
    ldh [$9a], a
    ldh [$9b], a
    ldh [$9f], a
    ldh [$a0], a
    ret


Call_002_5843:
    ld a, $e4
    ldh [$9c], a
    ld a, $d8
    ldh [$9d], a
    ld a, $9c
    ldh [$9e], a
    ret


Call_002_5850:
    ld hl, $9800
    ld bc, $0800
    jp trap_a6_55df


trap_ca_5859::
    ld a, h
    or a
    jr z, jr_002_589c

    cp $02
    jr z, jr_002_58a8

    cp $04
    jr z, jr_002_5891

    ld b, h
    ld c, l
    ld hl, $9730
    call Call_002_67aa
    call Call_002_67f8
    call Call_002_6846
    call Call_002_6857
    call Call_002_6868
    call Call_002_6890
    call Call_002_68b8
    call Call_002_68db
    call Call_002_6903
    call Call_002_692b
    call Call_002_694e
    call Call_002_697a
    jp Jump_002_69a6


jr_002_5891:
    ld hl, $9730
    ld de, image_02_778e
    ld bc, $00c0
    trap $02

jr_002_589c:
    ld hl, $97f0
    ld e, $00
    ld bc, $0010
    call trap_a6_55df
    ret


jr_002_58a8:
    ld hl, $97c0
    ld de, $781e
    ld bc, $0010
    trap $02
    ld hl, $97d0
    ld bc, $0000
    call Call_002_694e
    call Call_002_697a
    jr jr_002_589c

Call_002_58c1:
    ld bc, $2800

trap_c4_58c4::
    ld a, c
    ldh [$a1], a
    call trap_c6_5730
    xor a

jr_002_58cb:
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    dec b
    jr nz, jr_002_58cb

    ret


trap_b5_58d3::
    ldh a, [rLCDC]
    and $80
    ret z

    ei
    call trap_c3_4eaf
    call Call_002_58e1
    ei
    ret


Call_002_58e1:
    di
    ldh a, [rLCDC]
    and $80
    jr z, jr_002_58f4

jr_002_58e8:
    ldh a, [rLY]
    cp $91
    jr nz, jr_002_58e8

    ldh a, [rLCDC]
    and $7f
    ldh [rLCDC], a

jr_002_58f4:
    xor a
    ldh [$86], a
    ret


trap_b7_58f8::
    ld a, l
    ld [$c3c8], a
    ld a, h
    ld [$c3c9], a
    ret


trap_b8_5901::
    ldh a, [$92]
    bit 3, a
    jr nz, jr_002_590e

    ld a, h
    ldh [$8e], a
    ld a, l
    ldh [$8f], a
    ret


jr_002_590e:
    ld a, l
    add a
    add a
    add a
    add l
    ld l, a

trap_bd_5914::
    ld a, h
    ldh [$90], a
    ld a, l
    ldh [$91], a
    ret


trap_c8_591b::
    push bc
    ld c, a
    ldh a, [$92]
    bit 3, a
    ldh a, [$90]
    jr nz, jr_002_5927

    ldh a, [$8e]

jr_002_5927:
    ld b, a
    ld a, c
    sub b
    jr c, jr_002_5937

    jr z, jr_002_5937

    ld b, a

jr_002_592f:
    ld a, $20
    call trap_bb_593a
    dec b
    jr nz, jr_002_592f

jr_002_5937:
    xor a
    pop bc
    ret


trap_bb_593a::
    push bc
    push de
    push hl
    ld e, a
    ldh a, [$92]
    bit 3, a
    jr nz, jr_002_594e

    call Call_002_5970
    call Call_002_5b39
    pop hl
    pop de
    pop bc
    ret


jr_002_594e:
    call Call_002_597f
    call Call_002_5b6b
    pop hl
    pop de
    pop bc
    ret


Call_002_5958:
Jump_002_5958:
    push bc
    push de
    push hl
    ld e, a
    ldh a, [$92]
    bit 3, a
    jr nz, jr_002_5969

    call Call_002_5970
    pop hl
    pop de
    pop bc
    ret


jr_002_5969:
    call Call_002_597f
    pop hl
    pop de
    pop bc
    ret


Call_002_5970:
    ldh a, [$8e]
    ld h, a
    ldh a, [$8f]
    ld l, a
    call Call_002_59dc
    ld bc, $0001
    jp trap_a6_55df


Call_002_597f:
    ld c, a
    ld hl, $c3e0
    push hl
    call trap_ba_5681
    pop hl

trap_be_5988::
    push hl
    ldh a, [$90]
    ld h, a
    ldh a, [$91]
    ld l, a
    call Call_002_5999
    pop de
    ld bc, $0010
    trap $02
    ret


Call_002_5999:
    push de
    push bc
    ld a, l
    ld c, h
    push af
    ld b, $05
    ld hl, $c3bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl

jr_002_59a7:
    rr c
    jr nc, jr_002_59b3

    ld a, e
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    dec hl

jr_002_59b3:
    inc hl
    inc hl
    dec b
    jr nz, jr_002_59a7

    pop af
    pop bc
    ld l, a
    ld h, $00
    add hl, hl
    add hl, de
    pop de
    ret


trap_cd_59c1::
    push af
    push bc
    push de
    push hl
    ld h, d
    ld l, e
    ld e, a
    call Call_002_59dc
    ld bc, $0001
    call trap_a6_55df
    pop hl
    pop de
    pop bc
    ld a, d
    add b
    ld d, a
    ld a, e
    add c
    ld e, a
    pop af
    ret


Call_002_59dc:
    ld a, h
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ld a, [$c3c8]
    add l
    ld l, a
    ld a, [$c3c9]
    adc h
    ld h, a
    ret


trap_b9_59f5::
    push bc
    push de
    push hl
    call Call_002_59ff
    pop hl
    pop de
    pop bc
    ret


Call_002_59ff:
    ld hl, $ff92
    bit 7, [hl]
    jr z, jr_002_5a15

    bit 3, [hl]
    jr z, jr_002_5a19

    ld de, data_02_5a5c
    ld bc, $ff90
    cp $18
    jr c, jr_002_5a23

    ret


jr_002_5a15:
    cp $07
    jr z, jr_002_5a3d

jr_002_5a19:
    ld de, data_02_5a3e
    ld bc, $ff8e
    cp $10
    jr nc, jr_002_5a3d

jr_002_5a23:
    sub $01
    jr c, jr_002_5a3d

    cp $0d
    push af
    add a
    add e
    ld l, a
    ld a, $00
    adc d
    ld h, a
    ld a, [hl+]
    ld d, [hl]
    ld e, a
    pop af
    push de
    ld l, c
    ld h, b
    jr c, jr_002_5a3d

    ld hl, $ff92

jr_002_5a3d:
    ret


data_02_5a3e::
    inc a
    ld e, e
    ld c, h
    ld e, e
    ld b, e
    ld e, e
    ld e, l
    ld e, e
    ret nc

    ld e, d
    adc d
    ld e, d
    sub b
    ld e, d
    add hl, bc
    ld e, e
    and $5a
    dec a
    ld e, d
    dec [hl]
    ld e, e
    ld de, $415b
    ld e, e
    sub [hl]
    ld e, d
    sbc c
    ld e, d

data_02_5a5c::
    ld l, [hl]
    ld e, e
    ld a, l
    ld e, e
    ld [hl], a
    ld e, e
    add [hl]
    ld e, e
    dec a
    ld e, d
    adc d
    ld e, d
    sub b
    ld e, d
    ld h, e
    ld e, e
    dec a
    ld e, d
    dec a
    ld e, d
    dec [hl]
    ld e, e
    ld a, b
    ld e, l
    ld [hl], l
    ld e, e
    sub [hl]
    ld e, d
    sbc c
    ld e, d
    sbc h
    ld e, d
    and c
    ld e, d
    xor b
    ld e, d
    xor a
    ld e, d
    or [hl]
    ld e, d
    cp e
    ld e, d
    jp nz, $c95a

    ld e, d
    ld hl, $ff92
    res 3, [hl]
    ret


    ld hl, $ff92
    set 3, [hl]
    ret


    res 2, [hl]
    ret


    set 2, [hl]
    ret


    ld a, [hl]
    and $fc
    ld [hl], a
    ret


    ld a, [hl]
    and $fc
    or $01
    ld [hl], a
    ret


    ld a, [hl]
    and $fc
    or $02
    ld [hl], a
    ret


    ld a, [hl]
    and $fc
    or $03
    ld [hl], a
    ret


    ld a, [hl]
    and $cf
    ld [hl], a
    ret


    ld a, [hl]
    and $cf
    or $10
    ld [hl], a
    ret


    ld a, [hl]
    and $cf
    or $20
    ld [hl], a
    ret


    ld a, [hl]
    and $cf
    or $30
    ld [hl], a
    ret


    push bc
    push de
    ld e, $20
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld a, $14
    sub h
    ld c, a
    ld b, $00
    call Call_002_59dc
    call trap_a6_55df
    pop de
    pop bc
    ret


    push bc
    push de
    ld e, $20
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    and $03
    ld d, a
    ld a, $04
    sub d
    ld c, a
    ld b, $00
    push af
    call Call_002_59dc
    call trap_a6_55df
    pop af
    ld hl, $ff8e
    add [hl]
    ld [hl], a
    call Call_002_5b3e
    pop de
    pop bc
    ret


    call Call_002_5b4c
    ld a, $20
    jp Jump_002_5958


    push bc
    push de
    ld a, [$c3c8]
    ld l, a
    ld a, [$c3c9]
    ld h, a
    ld e, $20
    ld d, $12

jr_002_5b1f:
    push de
    push hl
    ld bc, $0014
    call trap_a6_55df
    pop hl
    pop de
    ld bc, $0020
    add hl, bc
    dec d
    jr nz, jr_002_5b1f

    pop de
    pop bc
    ld hl, $ff8e
    xor a
    ld [hl+], a
    ld [hl], a
    ret


Call_002_5b39:
    ld hl, $ff8e
    inc [hl]
    ld a, [hl]

Call_002_5b3e:
    cp $14
    ret c

    ld [hl], $00
    inc hl
    inc [hl]
    ld a, [hl]
    cp $12
    ret c

    ld [hl], $00
    ret


Call_002_5b4c:
    ld a, [hl]
    dec [hl]
    or a
    jr nz, jr_002_5b5c

    ld [hl], $13
    inc hl
    ld a, [hl]
    dec [hl]
    or a
    jr nz, jr_002_5b5b

    ld [hl], $11

jr_002_5b5b:
    dec hl

jr_002_5b5c:
    ret


    inc hl
    ld a, [hl]
    or a
    ret z

    dec [hl]
    ret


    call Call_002_5b7d
    ld a, $20
    jp Jump_002_5958


Call_002_5b6b:
    ld hl, $ff90
    inc [hl]
    ld a, [$c3b9]
    dec a
    cp [hl]
    ret nc

    ld [hl], $00
    inc hl
    ld a, [hl]
    add $09
    ld [hl], a
    ret


Call_002_5b7d:
    ld a, [hl]
    dec [hl]
    or a
    ret nz

    ld a, [$c3b9]
    dec a
    ld [hl], a
    inc hl
    ld a, [hl]
    sub $09
    ret c

    ld [hl], a
    ret


trap_a7_5b8d::
    ldh a, [$92]
    bit 6, a
    jr nz, jr_002_5bb4

    bit 7, a
    jr z, jr_002_5bca

    bit 3, a
    jr nz, jr_002_5bb7

    ld a, e
    cp $21
    jr c, jr_002_5bb0

    cp $7b
    jr nc, jr_002_5bb0

    cp $60
    jr z, jr_002_5bb0

    jr c, jr_002_5bac

    sub $20

jr_002_5bac:
    add $13
    or a
    ret


jr_002_5bb0:
    ld a, $7f
    or a
    ret


jr_002_5bb4:
    ld a, e
    or a
    ret


jr_002_5bb7:
    ld a, e
    cp $80
    jr c, jr_002_5bca

    cp $a0
    jr c, jr_002_5bc4

    cp $e0
    jr c, jr_002_5bca

jr_002_5bc4:
    ld a, d
    or a
    ret z

    xor a
    scf
    ret


jr_002_5bca:
    ld a, e
    cp $20
    jr c, jr_002_5c3d

    cp $60
    jr c, jr_002_5c4f

    cp $80
    jr c, jr_002_5c51

    cp $a1
    jr z, jr_002_5c41

    cp $a2
    jr z, jr_002_5c4a

    cp $a3
    jr z, jr_002_5c47

    cp $a4
    jr z, jr_002_5c44

    cp $a5
    jr z, jr_002_5c41

    cp $a6
    jr z, jr_002_5c2b

    cp $b0
    jr z, jr_002_5c4d

    jr c, jr_002_5c2f

    cp $b6
    jr c, jr_002_5c31

    cp $c5
    jr c, jr_002_5c23

    cp $ca
    jr c, jr_002_5c31

    cp $de
    jr z, jr_002_5c3d

    cp $df
    jr z, jr_002_5c3d

    cp $cf
    jr nc, jr_002_5c31

    ld a, d
    cp $de
    jr z, jr_002_5c1b

    cp $df
    jr nz, jr_002_5c28

jr_002_5c16:
    ld a, e
    add $28
    jr jr_002_5c1e

jr_002_5c1b:
    ld a, e
    add $23

jr_002_5c1e:
    call Call_002_5c31
    scf
    ret


jr_002_5c23:
    ld a, d
    cp $de
    jr z, jr_002_5c16

jr_002_5c28:
    ld a, e
    jr jr_002_5c31

jr_002_5c2b:
    ld a, $b0
    jr jr_002_5c31

jr_002_5c2f:
    add $50

Call_002_5c31:
jr_002_5c31:
    push hl
    ld hl, $ff92
    or a
    bit 2, [hl]
    pop hl
    ret z

    sub $50
    ret


jr_002_5c3d:
    ld a, $20
    or a
    ret


jr_002_5c41:
    ld a, $2e
    ret


jr_002_5c44:
    ld a, $2c
    ret


jr_002_5c47:
    ld a, $1d
    ret


jr_002_5c4a:
    ld a, $1b
    ret


jr_002_5c4d:
    ld a, $2d

jr_002_5c4f:
    or a
    ret


jr_002_5c51:
    and $1f
    ret


trap_c9_5c54::
    ld hl, $c3b5
    ld [hl+], a
    ld [hl], d
    inc hl
    ld [hl], c
    inc hl
    ld [hl], b
    inc hl
    ld [hl], e
    inc hl
    ld [hl], d
    ld h, c
    ld l, b
    call Call_002_59dc
    ld a, [$c3b5]
    ld c, a

jr_002_5c6a:
    push hl
    ld b, d

jr_002_5c6c:
    ld [hl], c
    inc c
    ld a, $20
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    dec b
    jr nz, jr_002_5c6c

    pop hl
    inc hl
    dec e
    jr nz, jr_002_5c6a

    ld a, c
    ld [$c3bb], a
    ld a, [$c3b5]
    call Call_002_5ca9
    ld [$c3bd], a
    ld a, l
    ld [$c3bc], a
    ld a, [$c3b6]
    add a
    add a
    add a
    ld e, a
    ld d, $00
    ld b, $05
    ld hl, $c3be

jr_002_5c9d:
    sla e
    rl d
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    dec b
    jr nz, jr_002_5c9d

    ret


Call_002_5ca9:
    sub $80
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld a, $88
    add h
    ret


Call_002_5cb6:
    ld a, e
    cp $03
    ret c

    ld a, d
    cp $03
    ret c

    push hl
    ld h, c
    ld l, b
    call Call_002_59dc
    pop bc
    push bc
    push de
    push hl
    ld hl, $c3e0
    ld d, b
    ld c, e
    ld b, e
    ld a, $77
    call Call_002_5d55
    ld [hl+], a
    dec b
    dec b
    ld a, $79
    call Call_002_5d55

jr_002_5cdb:
    ld [hl+], a
    dec b
    jr nz, jr_002_5cdb

    ld a, $78
    call Call_002_5d55
    ld [hl+], a
    pop hl
    push hl
    ld de, $c3e0
    trap $02
    pop hl
    pop de
    pop bc
    ld a, $20
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    push bc
    ld a, $75
    call Call_002_5d55
    ld b, a
    ld a, $76
    call Call_002_5d55
    ld c, a
    dec d
    dec d

jr_002_5d06:
    push bc
    push hl
    push de
    push hl
    ld e, b
    push bc
    ld bc, $0001
    call trap_a6_55df
    pop bc
    pop hl
    pop de
    push de
    dec e
    ld d, $00
    add hl, de
    ld e, c
    ld bc, $0001
    call trap_a6_55df
    pop de
    pop hl
    pop bc
    ld a, $20
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    dec d
    jr nz, jr_002_5d06

    pop bc
    push hl
    ld d, b
    ld hl, $c3e0
    ld c, e
    ld b, e
    ld a, $7a
    call Call_002_5d55
    ld [hl+], a
    dec b
    dec b
    ld a, $7c
    call Call_002_5d55

jr_002_5d44:
    ld [hl+], a
    dec b
    jr nz, jr_002_5d44

    ld a, $7b
    call Call_002_5d55
    ld [hl+], a
    pop hl
    ld de, $c3e0
    trap $02
    ret


Call_002_5d55:
    push hl
    ld l, a
    ld a, [$c3bb]
    cp $7c
    jr z, jr_002_5d67

    cp $7f
    jr nz, jr_002_5d64

jr_002_5d62:
    ld l, $7f

jr_002_5d64:
    ld a, l
    pop hl
    ret


jr_002_5d67:
    ld a, l
    cp $75
    jr c, jr_002_5d74

    cp $77
    jr c, jr_002_5d62

    cp $7c
    jr nc, jr_002_5d64

jr_002_5d74:
    ld l, $7c
    jr jr_002_5d64

    ldh a, [$92]
    ld b, a

Call_002_5d7b:
    ld a, b
    and $30
    ld e, a
    jr z, jr_002_5dc1

    dec e
    cp $30
    jr z, jr_002_5dc1

    add sp, -$10
    ld hl, sp+$00
    call Call_002_69df
    ld e, l
    ld d, h
    ld hl, sp+$00
    ld b, $0e
    call Call_002_69c9
    xor a
    ldh [$90], a
    ldh [$91], a
    ld a, [$c3bc]
    ld l, a
    ld a, [$c3bd]
    ld h, a
    ld a, [$c3bb]
    add $80
    ld b, a

jr_002_5da9:
    push bc
    push hl
    push hl
    ld hl, sp+$06
    ld e, l
    ld d, h
    pop hl
    ld bc, $0010
    push bc
    trap $02
    pop bc
    pop hl
    add hl, bc
    pop bc
    dec b
    jr nz, jr_002_5da9

    add sp, $10
    ret


jr_002_5dc1:
    push de
    xor a
    ldh [$90], a
    ldh [$91], a
    ld a, [$c3bc]
    ld e, a
    ld a, [$c3bd]
    ld d, a
    ld a, [$c3bb]
    call Call_002_5ca9
    ld h, a
    ld a, l
    sub e
    ld c, a
    ld a, h
    sbc d
    ld b, a
    ld l, e
    ld h, d
    pop de
    jp trap_a6_55df


trap_c0_5de2::
    push hl
    ld l, e
    ld h, d
    call Call_002_5999
    pop de
    sla c

jr_002_5deb:
    push bc
    push hl
    push de
    ld b, $00
    push bc
    trap $02
    pop bc
    pop hl
    add hl, bc
    ld e, l
    ld d, h
    pop hl
    ld a, [$c3be]
    add l
    ld l, a
    ld a, [$c3bf]
    adc h
    ld h, a
    pop bc
    dec b
    jr nz, jr_002_5deb

    ret


trap_c1_5e08::
    push hl
    ld l, e
    ld h, d
    call Call_002_5999
    ld e, l
    ld d, h
    pop hl
    sla c

jr_002_5e13:
    push bc
    push de
    push hl
    ld b, $00
    push bc
    trap $02
    pop bc
    pop hl
    add hl, bc
    pop de
    ld a, [$c3be]
    add e
    ld e, a
    ld a, [$c3bf]
    adc d
    ld d, a
    pop bc
    dec b
    jr nz, jr_002_5e13

    ret


trap_bf_5e2e::
    push hl
    push af
    push bc
    push de
    ld hl, sp+$00
    call Call_002_5f2e

jr_002_5e37:
    call trap_b1_60c5
    call trap_d8_618c
    or a
    jr z, jr_002_5e37

    ld c, a
    and $0f
    jr nz, jr_002_5e80

    ld a, c
    bit 4, a
    jr nz, jr_002_5e71

    bit 5, a
    jr nz, jr_002_5e68

    bit 6, a
    jr nz, jr_002_5e5f

    bit 7, a
    jr z, jr_002_5e37

    push bc
    call Call_002_5f2e
    call Call_002_5f0b
    jr jr_002_5e78

jr_002_5e5f:
    push bc
    call Call_002_5f2e
    call Call_002_5eea
    jr jr_002_5e78

jr_002_5e68:
    push bc
    call Call_002_5f2e
    call Call_002_5ec3
    jr jr_002_5e78

jr_002_5e71:
    push bc
    call Call_002_5f2e
    call Call_002_5e96

jr_002_5e78:
    push af
    call Call_002_5f2e
    pop af
    pop bc
    jr nc, jr_002_5e37

jr_002_5e80:
    ld hl, sp+$07
    ld b, [hl]
    ld a, b
    and c
    jr nz, jr_002_5e8b

    ld hl, sp+$00
    jr jr_002_5e37

jr_002_5e8b:
    ld [hl], c
    ld hl, sp+$00
    call Call_002_5f2e
    pop de
    pop bc
    pop af
    pop hl
    ret


Call_002_5e96:
    push hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    inc hl
    ld a, [hl+]
    ld b, a
    and $0f
    ld c, a
    srl b
    srl b
    srl b
    srl b
    inc hl
    ld a, [hl+]
    inc a
    cp [hl]
    jr nc, jr_002_5ec0

jr_002_5eaf:
    sub b
    jr z, jr_002_5ec0

    jr nc, jr_002_5eaf

    dec hl
    inc [hl]
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, d
    add c
    ld [hl], a

jr_002_5ebd:
    pop hl
    or a
    ret


jr_002_5ec0:
    pop hl
    scf
    ret


Call_002_5ec3:
    push hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    inc hl
    ld a, [hl+]
    ld b, a
    and $0f
    ld c, a
    srl b
    srl b
    srl b
    srl b
    inc hl
    ld a, [hl]
    or a
    jr z, jr_002_5ec0

jr_002_5edb:
    sub b
    jr z, jr_002_5ec0

    jr nc, jr_002_5edb

    dec [hl]
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, d
    sub c
    ld [hl], a
    jr jr_002_5ebd

Call_002_5eea:
    push hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    srl b
    srl b
    srl b
    srl b
    inc hl
    inc hl
    ld a, [hl]
    sub b
    jr c, jr_002_5ec0

    ld [hl], a
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, e
    sub c
    ld [hl], a
    jr jr_002_5ebd

Call_002_5f0b:
    push hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    srl b
    srl b
    srl b
    srl b
    inc hl
    inc hl
    ld a, [hl+]
    add b
    cp [hl]
    jr nc, jr_002_5ec0

    dec hl
    ld [hl], a
    dec hl
    dec hl
    dec hl
    dec hl
    dec hl
    ld a, e
    add c
    ld [hl], a
    jr jr_002_5ebd

Call_002_5f2e:
    push hl
    ld a, [hl+]
    ld d, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld l, a
    ld h, d
    ld a, b
    and $0f
    ld b, a
    call Call_002_5999
    sla c
    ld a, [$c3be]
    ld e, a
    ld a, [$c3bf]
    ld d, a

jr_002_5f48:
    push bc
    push de
    push hl
    ld b, $00
    call Call_002_5f79
    pop hl
    pop de
    pop bc
    add hl, de
    dec b
    jr nz, jr_002_5f48

    pop hl
    ret


jr_002_5f59:
    db $76

Call_002_5f5a:
    ldh a, [$89]
    ld b, a
    ld a, $c8
    sub b
    sub $14
    jr c, jr_002_5f59

    push hl
    push bc
    add $04
    ld l, a
    add hl, hl
    add hl, hl
    ld c, $05
    call Call_002_525a
    ld a, l
    pop bc
    pop hl
    ld b, $40
    cp b
    ret nc

    ld b, a
    ret


Call_002_5f79:
    ld a, b
    or a

jr_002_5f7b:
    push af
    call Call_002_5f5a
    pop af
    push af
    jr nz, jr_002_5f8a

    ld a, b
    cp c
    jr c, jr_002_5f8a

    pop af
    jr jr_002_5fa6

jr_002_5f8a:
    push bc
    push hl
    ld c, b
    ld b, $00
    push bc
    call Call_002_5fa6
    pop bc
    pop hl
    add hl, bc
    pop bc
    pop af
    push hl
    ld l, b
    ld b, a
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc $00
    ld b, a
    pop hl
    jr jr_002_5f7b

jr_002_5fa5:
    db $76

Call_002_5fa6:
jr_002_5fa6:
    ldh a, [$88]
    ld b, a
    ldh a, [$87]
    sub b
    cp $f0
    jr nc, jr_002_5fa5

    ld a, c
    srl a
    srl a
    inc a
    add c
    add $14
    ld b, a
    jr jr_002_5fbd

jr_002_5fbc:
    db $76

jr_002_5fbd:
    ldh a, [$89]
    add b
    jr c, jr_002_5fbc

    cp $c8
    jr nc, jr_002_5fbc

    push hl
    ldh a, [$87]
    ld l, a
    ld h, $c2
    ld [hl], $04
    inc l
    ld [hl], b
    inc l
    ld a, $40
    sub c
    ld d, a
    add a
    add d
    ld de, $4f08
    add e
    ld [hl], a
    ld a, $00
    adc d
    inc l
    ld [hl], a
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    di
    ld a, l
    ldh [$87], a
    ldh a, [$89]
    add b
    ldh [$89], a
    ei
    ret


trap_b0_5ff2::
    di
    ld de, code_02_6036
    ld hl, $c000
    ld bc, $001c
    trap $02
    ld a, [$000f]
    ld [$c00b], a
    ld de, $6052
    ld hl, $fff5
    ld bc, $000a
    trap $02
    xor a
    ldh [$82], a
    ldh [$83], a
    ldh [$84], a
    ldh [$85], a
    ldh [$86], a
    ldh [$87], a
    ldh [$88], a
    ldh [$89], a
    ldh [$8b], a
    ldh [$8c], a
    ldh [$8d], a
    ldh [$93], a
    ldh [$94], a
    ldh [$95], a
    ldh [$96], a
    cpl
    ldh [$8a], a
    ldh [$98], a
    ldh [$99], a
    ret


code_02_6036::
    jp Jump_000_0053


    reti


    nop
    nop

code_02_603c::
    push af
    ldh a, [hROMBank]
    push af
    ld a, $03
    ldh [hROMBank], a
    ld [rROMBank], a
    call Call_002_6068
    pop af
    ldh [hROMBank], a
    ld [rROMBank], a
    pop af
    reti


    ld a, $c3
    ldh [rDMA], a
    ld a, $28

jr_002_6058:
    dec a
    jr nz, jr_002_6058

    ret


trap_b6_605c::
    ld a, l
    and h
    ld l, a
    ldh a, [$99]
    cpl
    or h
    cpl
    or l
    ldh [$99], a
    ret


Call_002_6068:
    push bc
    push de
    push hl
    ldh a, [rLY]
    cp $90
    jr c, jr_002_608f

    ld hl, $ff9a
    ld a, [hl+]
    ldh [rSCY], a
    ld a, [hl+]
    ldh [rSCX], a
    ld de, $ff47
    ld b, $05

jr_002_607f:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_002_607f

    ldh a, [$99]
    bit 0, a
    call nz, $fff5
    call data_02_51e4

jr_002_608f:
    ldh a, [$99]
    bit 1, a
    call nz, Call_002_60fa
    ldh a, [rIE]
    bit 2, a
    call z, Call_000_0053
    ld hl, $ff83
    inc [hl]
    ld hl, $ff84
    inc [hl]
    ldh a, [$99]
    bit 3, a
    call z, Call_002_60b4
    ld a, $01
    ldh [$82], a
    pop hl
    pop de
    pop bc
    ret


Call_002_60b4:
    ld a, $3b
    cp [hl]
    ret nc

    ld [hl], $00
    inc hl
    inc [hl]
    ld a, $3b
    cp [hl]
    ret nc

    ld [hl], $00
    jp Jump_002_61cc


trap_b1_60c5::
    xor a
    ldh [$82], a
    ei

jr_002_60c9:
    db $76
    ldh a, [$82]
    dec a
    jr nz, jr_002_60c9

    ldh [$82], a
    ret


trap_dc_60d2::
    push bc
    ld b, a

jr_002_60d4:
    call trap_b1_60c5
    call trap_d8_618c
    or a
    jr nz, jr_002_60e0

    dec b
    jr nz, jr_002_60d4

jr_002_60e0:
    pop bc
    ret


trap_db_60e2::
    push bc
    push de
    push hl
    xor a
    ldh [$8c], a
    ldh [$8d], a
    ldh [$8b], a
    ldh [$b6], a
    cpl
    ldh [$8a], a
    ldh [$b5], a
    call Call_002_60fa
    pop hl
    pop de
    pop bc
    ret


Call_002_60fa:
    ld a, $20
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    swap a
    ld b, a
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    or b
    ld b, a
    ldh [$8a], a
    ld a, $30
    ldh [rP1], a
    ldh a, [$b5]
    xor b
    and b
    ld c, a
    ldh [$8b], a
    ldh [$b6], a
    ld a, b
    ldh [$b5], a
    jr nz, jr_002_614b

    and $f0
    ret z

    ldh a, [$98]
    ld b, a
    ldh a, [$84]
    cp b
    jr c, jr_002_6147

    ldh a, [$8a]
    and $f0
    ld c, a
    ldh [$b6], a
    ld a, $06
    jr jr_002_6152

jr_002_6147:
    xor a
    ldh [$b6], a
    ret


jr_002_614b:
    ld a, c
    and $f0
    jr z, jr_002_6157

    ld a, $18

jr_002_6152:
    ldh [$98], a
    xor a
    ldh [$84], a

jr_002_6157:
    ldh [$85], a
    ldh a, [$99]
    and $10
    ret z

    ldh a, [$8d]
    ld l, a
    ldh a, [$8c]
    ld e, a
    ld h, $0f
    sub l
    and h
    cp h
    ret z

    ld d, $00
    ld hl, $c3a0
    add hl, de
    ld [hl], c
    ld a, e
    inc a
    and $0f
    ldh [$8c], a
    ret


trap_da_6178::
    push bc
    push de
    ldh a, [$99]
    bit 1, a
    call z, Call_002_60fa
    ldh a, [$b6]
    ld h, a
    ldh a, [$8b]
    ld l, a
    ldh a, [$8a]
    pop de
    pop bc
    ret


trap_d8_618c::
    push hl
    call trap_da_6178
    bit 3, a
    jr z, jr_002_619d

    ld a, l
    bit 2, a
    jr z, jr_002_619d

    di
    jp Boot


jr_002_619d:
    pop hl
    ldh a, [$99]
    and $10
    ldh a, [$b6]
    ret z

    push de
    push hl
    ldh a, [$8d]
    ld e, a
    ldh a, [$8c]
    sub e
    jr z, jr_002_61bd

    ld a, e
    inc a
    and $0f
    ldh [$8d], a
    ld d, $00
    ld hl, $c3a0
    add hl, de
    ld a, [hl]
    or a

jr_002_61bd:
    pop hl
    pop de
    ret


trap_b2_61c0::
    di

jr_002_61c1:
    ldh a, [rLY]
    cp $91
    jr nz, jr_002_61c1

    call Call_002_61cc
    ei
    ret


Call_002_61cc:
Jump_002_61cc:
    ldh a, [rLCDC]
    and $7f
    ldh [rLCDC], a

jr_002_61d2:
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    jr nz, jr_002_61d2

    stop
    ldh a, [rLCDC]
    or $80
    ldh [rLCDC], a

jr_002_61ef:
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    jr nz, jr_002_61ef

    ld a, $30
    ldh [rP1], a
    ret


trap_d9_6209::
    call Call_002_62c8
    ld b, l
    ld c, l
    ld l, e
    ld h, d

jr_002_6210:
    ld a, c
    or a
    jr z, jr_002_6231

    ld a, [hl]
    or a
    jr z, jr_002_6231

    dec c
    inc hl
    cp $20
    jr c, jr_002_622c

    ld e, a
    ld d, [hl]
    call trap_a7_5b8d
    jr nc, jr_002_6227

    dec c
    inc hl

jr_002_6227:
    call trap_bb_593a
    jr jr_002_6210

jr_002_622c:
    call trap_b9_59f5
    jr jr_002_6210

jr_002_6231:
    ld e, l
    ld d, h
    ld h, b
    ld l, c
    ld a, l
    or a
    jr z, jr_002_624b

jr_002_6239:
    call Call_002_6350
    cp $0d
    jr z, jr_002_62a6

    cp $08
    jr z, jr_002_625d

    call Call_002_6303
    ld a, l
    or a
    jr nz, jr_002_6239

jr_002_624b:
    call Call_002_6350
    cp $0d
    jr z, jr_002_62ae

    cp $08
    jr nz, jr_002_624b

    xor a
    ldh [$94], a
    ldh [$95], a
    jr jr_002_6269

jr_002_625d:
    ldh a, [$95]
    or a
    jr z, jr_002_6269

    xor a
    ldh [$94], a
    ldh [$95], a
    jr jr_002_6239

jr_002_6269:
    ld a, h
    cp l
    jr z, jr_002_6239

    dec de
    inc l
    ld a, [de]
    cp $0e
    jr z, jr_002_6287

    cp $0f
    jr z, jr_002_628c

    cp $de
    jr z, jr_002_6291

    cp $df
    jr z, jr_002_6291

    ld a, $08
    call trap_b9_59f5
    jr jr_002_6239

jr_002_6287:
    call Call_002_62ee
    jr jr_002_6239

jr_002_628c:
    call Call_002_62d5
    jr jr_002_6239

jr_002_6291:
    ld a, $08
    call trap_b9_59f5
    dec de
    ld a, [de]
    inc de
    push de
    ld e, a
    ld d, $00
    call trap_a7_5b8d
    call trap_bb_593a
    pop de
    jr jr_002_6239

jr_002_62a6:
    ldh a, [$95]
    or a
    jr z, jr_002_62ae

    call Call_002_6303

jr_002_62ae:
    bit 2, c
    jr z, jr_002_62b6

    ld a, $0e
    ld [de], a
    inc de

jr_002_62b6:
    xor a
    ldh [$94], a
    ldh [$95], a
    ld [de], a
    ldh a, [$92]
    and $fb
    ldh [$92], a
    ld a, h
    sub l
    ld l, a
    ld h, $00
    ret


Call_002_62c8:
    ldh a, [$96]
    and $f8
    or h
    ldh [$96], a
    and $07
    cp $04
    jr z, jr_002_62ee

Call_002_62d5:
    ld bc, $0000
    ldh a, [$92]
    and $fb
    ldh [$92], a
    ldh a, [$96]
    and $07
    cp $04
    jr nz, jr_002_62eb

    ldh a, [$96]
    dec a
    ldh [$96], a

jr_002_62eb:
    jp Jump_002_66aa


Call_002_62ee:
jr_002_62ee:
    ld bc, $0404
    ldh a, [$92]
    and $fb
    or b
    ldh [$92], a
    ldh a, [$96]
    and $f8
    or $04
    ldh [$96], a
    jp Jump_002_66aa


Call_002_6303:
    ld [de], a
    cp $a0
    jr c, jr_002_6325

    cp $de
    jr z, jr_002_6335

    cp $df
    jr z, jr_002_6335

    ld a, b
    cp c
    ld a, [de]
    jr z, jr_002_6325

    ld c, a
    ld a, $0e
    bit 2, b
    jr z, jr_002_631d

    inc a

jr_002_631d:
    ld [de], a
    inc de
    dec l
    jr z, jr_002_6333

    ld a, c
    ld [de], a
    ld c, b

jr_002_6325:
    push de
    ld e, a
    ld d, $00
    call trap_a7_5b8d

jr_002_632c:
    call trap_bb_593a
    pop de
    inc de
    dec l
    ret


jr_002_6333:
    ld c, b
    ret


jr_002_6335:
    push de
    push af
    ld a, h
    sub l
    jr z, jr_002_633d

    dec de
    ld a, [de]

jr_002_633d:
    ld e, a
    pop af
    ld d, a
    call trap_a7_5b8d
    jr nc, jr_002_634e

    ld d, a
    ld a, $08
    call trap_b9_59f5
    ld a, d
    jr jr_002_632c

jr_002_634e:
    pop de
    ret


Call_002_6350:
jr_002_6350:
    push de
    ldh a, [$95]
    ld e, a
    ld d, $00
    or a
    jr nz, jr_002_635b

    ld e, $60

jr_002_635b:
    call trap_a7_5b8d
    call Call_002_5958

jr_002_6361:
    call Call_002_63cc
    jr nz, jr_002_636c

    or a
    jr z, jr_002_6361

    pop de
    jr jr_002_6350

jr_002_636c:
    push af
    ld a, $20
    call Call_002_5958
    pop af
    pop de
    cp $20
    ret nc

    cp $1b
    ret c

    push hl
    sub $1b
    ld l, a
    ldh a, [$96]
    and $f8
    or l
    ldh [$96], a
    ld a, l
    ld h, $04
    cp h
    jr z, jr_002_638d

    ld h, $00

jr_002_638d:
    ld b, h
    ld hl, $ff92
    ld a, [hl]
    and $fb
    or b
    ld [hl], a
    pop hl
    ldh a, [$96]
    call Call_002_66aa
    jr jr_002_6350

Call_002_639e:
    ld de, $1058
    ldh a, [$96]
    and $40
    jr z, jr_002_63a9

    ld d, $60

jr_002_63a9:
    ld bc, $2800
    ld hl, $c300

jr_002_63af:
    ld a, d
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    inc c
    inc c
    ld a, e
    add $08
    ld e, a
    cp $a8
    jr nz, jr_002_63c8

    ld e, $58
    ld a, d
    add $10
    ld d, a

jr_002_63c8:
    dec b
    jr nz, jr_002_63af

    ret


Call_002_63cc:
    call trap_d8_618c
    bit 1, a
    jr nz, jr_002_641b

    bit 0, a
    jr nz, jr_002_641f

    bit 3, a
    jr nz, jr_002_6417

    bit 2, a
    jp z, Jump_002_6483

    ldh a, [$96]
    xor $80
    ldh [$96], a
    rlca
    jr c, jr_002_63f2

    push bc
    push hl
    call Call_002_58c1
    pop hl
    pop bc
    jr jr_002_640d

jr_002_63f2:
    push bc
    push de
    push hl
    ldh a, [$96]
    xor $40
    ldh [$96], a
    call Call_002_639e
    xor a
    ldh [$95], a
    ldh [$94], a
    ldh a, [$93]
    ld c, $10
    call $662b
    pop hl
    pop de
    pop bc

Call_002_640d:
jr_002_640d:
    push hl
    ld hl, $ff95
    ld a, [hl]
    ld [hl], $00
    or a
    pop hl
    ret


jr_002_6417:
    ld a, $0d
    or a
    ret


jr_002_641b:
    ld a, $08
    or a
    ret


jr_002_641f:
    ldh a, [$96]
    bit 7, a
    jr z, jr_002_6417

    and $07
    jr nz, jr_002_643c

    push de
    push hl
    xor a
    ldh [$95], a
    ldh a, [$93]
    ld e, a
    ld d, $00
    ld hl, data_02_64d7
    add hl, de
    ld a, [hl]
    or a
    pop hl
    pop de
    ret


jr_002_643c:
    push de
    push hl
    ld e, a
    ld d, $03
    ldh a, [$93]
    ld l, a
    add a
    add l
    ld hl, $64eb
    dec e
    jr z, jr_002_6462

    ld hl, $6527
    dec e
    jr z, jr_002_6462

    ld l, a
    ldh a, [$93]
    add a
    add l
    ld hl, $6563
    ld d, $05
    dec e
    jr z, jr_002_6462

    ld hl, $65c7

jr_002_6462:
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ldh a, [$94]
    ld e, a
    inc a
    cp d
    jr c, jr_002_6470

    xor a

jr_002_6470:
    ldh [$94], a
    ld d, $00
    add hl, de
    ld a, [hl]
    cp $21
    jr c, jr_002_647c

    ld d, a
    cp a

jr_002_647c:
    ld hl, $ff95
    ld [hl], d
    pop hl
    pop de
    ret


Jump_002_6483:
    push bc
    push de
    push hl
    ld b, a
    ldh a, [$93]
    ld c, a
    bit 7, b
    call nz, Call_002_64bb
    bit 6, b
    call nz, Call_002_64c3
    bit 5, b
    call nz, Call_002_64c9
    bit 4, b
    call nz, Call_002_64cf
    ldh [$93], a
    ld b, a
    ld a, c
    sub b
    jr z, jr_002_64b7

    ld a, c
    ld c, $00
    call $662b
    ld a, b
    ld c, $10
    call $662b
    xor a
    ldh [$94], a
    call Call_002_640d

jr_002_64b7:
    pop hl
    pop de
    pop bc
    ret


Call_002_64bb:
    add $05
    cp $14
    ret c

    sub $14
    ret


Call_002_64c3:
    sub $05
    ret nc

    add $14
    ret


Call_002_64c9:
    sub $01
    ret nc

    add $14
    ret


Call_002_64cf:
    add $01
    cp $14
    ret c

    sub $14
    ret


data_02_64d7::
    db $37, $38, $39, $2f, $1c, $34, $35, $36, $2a, $1d, $31, $32, $33, $2d, $1e, $30
    db $23, $3d, $2b, $1f, $41, $42, $43, $44, $45, $46, $47, $48, $49, $28, $3c, $5b
    db $1d, $1d, $1d, $4a, $4b, $4c, $4d, $4e, $4f, $50, $51, $52, $29, $3e, $5d, $1e
    db $1e, $1e, $53, $54, $55, $56, $57, $58, $59, $5a, $40, $3a, $3b, $7e, $1f, $1f
    db $1f, $2e, $21, $3f, $20, $20, $20, $2c, $22, $27, $5f, $7e, $5e, $1b, $1b, $1b
    db $61, $62, $63, $64, $65, $66, $67, $68, $69, $23, $25, $26, $1e, $1e, $1e, $6a
    db $6b, $6c, $6d, $6e, $6f, $70, $71, $72, $24, $5c, $7c, $1f, $1f, $1f, $73, $74
    db $75, $76, $77, $78, $79, $7a, $60, $3a, $3b, $7e, $1b, $1b, $1b, $2e, $21, $3f
    db $20, $20, $20, $2c, $22, $27, $5f, $7e, $5e, $1c, $1c, $1c, $b1, $b2, $b3, $b4
    db $b5, $b6, $b7, $b8, $b9, $ba, $bb, $bc, $bd, $be, $bf, $a7, $a8, $a9, $aa, $ab
    db $1f, $1f, $1f, $1f, $1f, $c0, $c1, $c2, $c3, $c4, $c5, $c6, $c7, $c8, $c9, $ca
    db $cb, $cc, $cd, $ce, $ac, $ad, $ae, $af, $2d, $1b, $1b, $1b, $1b, $1b, $cf, $d0
    db $d1, $d2, $d3, $d4, $d5, $d6, $a2, $a3, $d7, $d8, $d9, $da, $db, $a4, $2c, $3b
    db $28, $29, $1c, $1c, $1c, $1c, $1c, $dc, $a6, $dd, $5b, $5d, $de, $22, $27, $24
    db $5c, $df, $21, $3f, $26, $7e, $a1, $2e, $3a, $3c, $3e, $1d, $1d, $1d, $1d, $1d
    db $b1, $b2, $b3, $b4, $b5, $b6, $b7, $b8, $b9, $ba, $bb, $bc, $bd, $be, $bf, $a7
    db $a8, $a9, $aa, $ab, $1b, $1b, $1b, $1b, $1b, $c0, $c1, $c2, $c3, $c4, $c5, $c6
    db $c7, $c8, $c9, $ca, $cb, $cc, $cd, $ce, $ac, $ad, $ae, $af, $2d, $1c, $1c, $1c
    db $1c, $1c, $cf, $d0, $d1, $d2, $d3, $d4, $d5, $d6, $a2, $a3, $d7, $d8, $d9, $da
    db $db, $a4, $2c, $3b, $28, $29, $1d, $1d, $1d, $1d, $1d, $dc, $a6, $dd, $5b, $5d
    db $de, $22, $27, $24, $5c, $df, $21, $3f, $26, $7e, $a1, $2e, $3a, $3c, $3e, $1e
    db $1e, $1e, $1e, $1e, $87, $87, $87, $6f, $26, $00, $11, $03, $c3, $19, $71, $23
    db $23, $23, $23, $71, $c9, $46, $66, $5a, $66, $6e, $66, $82, $66, $96, $66, $37
    db $38, $39, $2f, $41, $34, $35, $36, $2a, $61, $31, $32, $33, $2d, $01, $30, $23
    db $3d, $2b, $00, $41, $44, $47, $28, $61, $4a, $4d, $50, $29, $01, $53, $56, $59
    db $3a, $00, $2e, $20, $2c, $5f, $30, $61, $64, $67, $23, $01, $6a, $6d, $70, $24
    db $00, $73, $76, $79, $3a, $30, $2e, $20, $2c, $5f, $41, $b1, $b6, $bb, $a7, $00
    db $c0, $c5, $ca, $ac, $30, $cf, $d4, $d7, $a4, $41, $dc, $de, $df, $a1, $61, $b1
    db $b6, $bb, $a7, $30, $c0, $c5, $ca, $ac, $41, $cf, $d4, $d7, $a4, $61, $dc, $de
    db $df, $a1, $01

Call_002_66aa:
Jump_002_66aa:
    push bc
    push de
    push hl
    and $07
    add a
    ld l, a
    ld h, $00
    ld de, $663c
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $8000
    ld c, $14

jr_002_66bf:
    push bc
    push de
    push hl
    ld a, [de]
    or a
    jr z, jr_002_66e1

    cp $01
    jr z, jr_002_66dd

    ld d, a
    ld e, $ca
    cp $de
    jr z, jr_002_66d8

    cp $df
    jr z, jr_002_66d8

    ld e, a
    ld d, $00

jr_002_66d8:
    call trap_a7_5b8d
    jr jr_002_66e3

jr_002_66dd:
    ld a, $b1
    jr jr_002_66e3

jr_002_66e1:
    ld a, $61

jr_002_66e3:
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld de, image_02_6f8e
    add hl, de
    ld e, l
    ld d, h
    pop hl
    push de
    push hl
    call Call_002_6720
    ld de, $c3e0
    pop hl
    push hl
    ld bc, $0020
    push bc
    trap $02
    pop bc
    pop hl
    add hl, bc
    pop de
    push hl
    call Call_002_6765
    ld de, $c3e0
    pop hl
    push hl
    ld bc, $0020
    push bc
    trap $02
    pop bc
    pop hl
    add hl, bc
    pop de
    pop bc
    inc de
    dec c
    jr nz, jr_002_66bf

    pop hl
    pop de
    pop bc
    ret


Call_002_6720:
    ld hl, $c3e0
    ld [hl], $00
    inc hl
    ld [hl], $ff
    inc hl
    ld [hl], $00
    inc hl
    ld [hl], $ff
    inc hl
    ld b, $02

jr_002_6731:
    ld [hl], $3f
    inc hl
    ld [hl], $c0
    inc hl
    dec b
    jr nz, jr_002_6731

    ld b, $08

jr_002_673c:
    ld [hl], $3f
    inc hl
    ld a, [de]
    inc de
    rrca
    rrca
    rrca
    rrca
    and $0f
    or $c0
    ld [hl], a
    inc hl
    dec b
    jr nz, jr_002_673c

    ld b, $02

jr_002_6750:
    ld [hl], $3f
    inc hl
    ld [hl], $c0
    inc hl
    dec b
    jr nz, jr_002_6750

    ld [hl], $7f
    inc hl
    ld [hl], $ff
    inc hl
    ld [hl], $ff
    inc hl
    ld [hl], $ff
    ret


Call_002_6765:
    ld hl, $c3e0
    ld [hl], $00
    inc hl
    ld [hl], $ff
    inc hl
    ld [hl], $01
    inc hl
    ld [hl], $ff
    inc hl
    ld b, $02

jr_002_6776:
    ld [hl], $ff
    inc hl
    ld [hl], $03
    inc hl
    dec b
    jr nz, jr_002_6776

    ld b, $08

jr_002_6781:
    ld [hl], $ff
    inc hl
    ld a, [de]
    inc de
    rlca
    rlca
    rlca
    rlca
    and $f0
    or $03
    ld [hl], a
    inc hl
    dec b
    jr nz, jr_002_6781

    ld b, $02

jr_002_6795:
    ld [hl], $ff
    inc hl
    ld [hl], $03
    inc hl
    dec b
    jr nz, jr_002_6795

    ld [hl], $ff
    inc hl
    ld [hl], $ff
    inc hl
    ld [hl], $ff
    inc hl
    ld [hl], $ff
    ret


Call_002_67aa:
    push bc
    push hl
    ld hl, $c3e0
    call Call_002_69df
    call Call_002_69df
    call Call_002_69df
    call Call_002_69df
    call Call_002_69df
    ld hl, $c3ea
    call Call_002_6b8d
    ld hl, $c3ee
    call Call_002_69d0
    ld hl, $c3e0
    ld a, [hl]
    or $08
    ld [hl+], a
    ld a, [hl]
    or $08
    ld [hl+], a
    ld a, [hl]
    or $0c
    ld [hl+], a
    ld a, [hl]
    or $0c
    ld [hl+], a
    ld a, [hl]
    or $0e
    ld [hl+], a
    ld a, [hl]
    or $0e
    ld [hl+], a
    ld a, [hl]
    or $0c
    ld [hl+], a
    ld a, [hl]
    or $0c
    ld [hl+], a
    ld a, [hl]
    or $08
    ld [hl+], a
    ld a, [hl]
    or $08
    ld [hl+], a
    jp Jump_002_69b1


Call_002_67f8:
    push bc
    push hl
    ld hl, $c3e0
    call Call_002_69df
    call Call_002_69df
    call Call_002_69df
    call Call_002_69df
    call Call_002_69df
    ld hl, $c3ea
    call Call_002_6b8d
    ld hl, $c3ee
    call Call_002_69d0
    ld hl, $c3e0
    ld a, [hl]
    or $10
    ld [hl+], a
    ld a, [hl]
    or $10
    ld [hl+], a
    ld a, [hl]
    or $30
    ld [hl+], a
    ld a, [hl]
    or $30
    ld [hl+], a
    ld a, [hl]
    or $70
    ld [hl+], a
    ld a, [hl]
    or $70
    ld [hl+], a
    ld a, [hl]
    or $30
    ld [hl+], a
    ld a, [hl]
    or $30
    ld [hl+], a
    ld a, [hl]
    or $10
    ld [hl+], a
    ld a, [hl]
    or $10
    ld [hl+], a
    jp Jump_002_69b1


Call_002_6846:
    push bc
    push hl
    ld hl, $c3e0
    ld de, $f010
    call Call_002_6c61
    call Call_002_69c1
    jp Jump_002_69b1


Call_002_6857:
    push bc
    push hl
    ld hl, $c3e0
    ld de, $f808
    call Call_002_6e7c
    call Call_002_69c1
    jp Jump_002_69b1


Call_002_6868:
    push bc
    push hl
    ld hl, $c3e0
    call Call_002_69d0
    ld hl, $c3e2
    ld de, $f010
    call Call_002_6bc2
    ld hl, $c3e6
    ld de, $f010
    call Call_002_6c61
    ld hl, $c3e6
    ld de, $c3e8
    ld b, $08
    call Call_002_69c9
    jp Jump_002_69b1


Call_002_6890:
    push bc
    push hl
    ld hl, $c3e0
    call Call_002_69d0
    ld hl, $c3e2
    ld de, $f808
    call Call_002_6d9f
    ld hl, $c3e6
    ld de, $f808
    call Call_002_6e7c
    ld hl, $c3e6
    ld de, $c3e8
    ld b, $08
    call Call_002_69c9
    jp Jump_002_69b1


Call_002_68b8:
    push bc
    push hl
    ld hl, $c3e0
    call Call_002_69d0
    ld hl, $c3e2
    call Call_002_6b3a
    ld hl, $c3e6
    call Call_002_69df
    call Call_002_69df
    call Call_002_69df
    call Call_002_69df
    call Call_002_69df
    jp Jump_002_69b1


Call_002_68db:
    push bc
    push hl
    ld hl, $c3ee
    call Call_002_69d0
    ld de, $f010
    ld hl, $c3ea
    call Call_002_6cde
    ld hl, $c3e0
    ld de, $f010
    call Call_002_6c61
    ld hl, $c3e0
    ld de, $c3e2
    ld b, $08
    call Call_002_69c9
    jp Jump_002_69b1


Call_002_6903:
    push bc
    push hl
    ld hl, $c3ee
    call Call_002_69d0
    ld hl, $c3ea
    ld de, $f808
    call Call_002_6eef
    ld hl, $c3e0
    ld de, $f808
    call Call_002_6e7c
    ld hl, $c3e0
    ld de, $c3e2
    ld b, $08
    call Call_002_69c9
    jp Jump_002_69b1


Call_002_692b:
    push bc
    push hl
    ld hl, $c3e0
    call Call_002_69df
    call Call_002_69df
    call Call_002_69df
    call Call_002_69df
    call Call_002_69df
    ld hl, $c3ea
    call Call_002_6b8d
    ld hl, $c3ee
    call Call_002_69d0
    jp Jump_002_69b1


Call_002_694e:
    push bc
    push hl
    ld hl, $c3e0
    ld de, $f808
    call Call_002_6e7c
    call Call_002_69c1
    ld hl, $c3e4
    ld a, [hl]
    or $20
    ld [hl+], a
    ld a, [hl]
    or $20
    ld [hl+], a
    ld a, [hl]
    or $70
    ld [hl+], a
    ld a, [hl]
    or $70
    ld [hl+], a
    ld a, [hl]
    or $f8
    ld [hl+], a
    ld a, [hl]
    or $f8
    ld [hl+], a
    jp Jump_002_69b1


Call_002_697a:
    push bc
    push hl
    ld hl, $c3e0
    ld de, $f808
    call Call_002_6e7c
    call Call_002_69c1
    ld hl, $c3e6
    ld a, [hl]
    or $f8
    ld [hl+], a
    ld a, [hl]
    or $f8
    ld [hl+], a
    ld a, [hl]
    or $70
    ld [hl+], a
    ld a, [hl]
    or $70
    ld [hl+], a
    ld a, [hl]
    or $20
    ld [hl+], a
    ld a, [hl]
    or $20
    ld [hl+], a
    jp Jump_002_69b1


Jump_002_69a6:
    push bc
    push hl
    ld hl, $c3e0
    call Call_002_69d0
    call Call_002_69c1

Jump_002_69b1:
    pop hl
    ld de, $c3e0
    ld bc, $0010
    push bc
    push hl
    trap $02
    pop hl
    pop bc
    add hl, bc
    pop bc
    ret


Call_002_69c1:
    ld hl, $c3e0
    ld de, $c3e2
    ld b, $0e

Call_002_69c9:
jr_002_69c9:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_002_69c9

    ret


Call_002_69d0:
    xor a
    bit 6, b
    jr z, jr_002_69d6

    dec a

jr_002_69d6:
    ld [hl+], a
    xor a
    bit 7, b
    jr z, jr_002_69dd

    dec a

jr_002_69dd:
    ld [hl+], a
    ret


Call_002_69df:
    xor a
    bit 4, b
    jr z, jr_002_69e5

    dec a

jr_002_69e5:
    ld [hl+], a
    xor a
    bit 5, b
    jr z, jr_002_69ec

    dec a

jr_002_69ec:
    ld [hl+], a
    ret


trap_c2_69ee::
    ld a, h
    cp d
    jr c, jr_002_69f4

    ld h, d
    ld d, a

jr_002_69f4:
    ld a, l
    cp e
    jr c, jr_002_69fa

    ld l, e
    ld e, a

jr_002_69fa:
    push bc
    ld c, $02
    bit 2, b
    jr nz, jr_002_6a07

    dec c
    bit 1, b
    jr nz, jr_002_6a07

    dec c

jr_002_6a07:
    ld a, d
    sub h
    cp $08
    jr c, jr_002_6a43

    ld a, h
    and $07
    cp c
    jr c, jr_002_6a43

    ld a, l
    cp c
    jr c, jr_002_6a43

    ld a, [$c3b9]
    add a
    add a
    add a
    dec a
    ld c, a
    ld a, [$c3ba]
    add a
    add a
    add a
    dec a
    bit 1, b
    jr z, jr_002_6a32

    dec c
    dec a
    bit 2, b
    jr z, jr_002_6a32

    dec c
    dec a

jr_002_6a32:
    cp e
    jr c, jr_002_6a43

    ld a, c
    cp d
    jr c, jr_002_6a43

    and $07
    inc a
    ld c, a
    ld a, d
    and $07
    cp c
    jr c, jr_002_6a45

jr_002_6a43:
    pop bc
    ret


jr_002_6a45:
    pop bc
    push de
    push hl
    ld a, e
    inc a
    sub l
    ld e, a
    srl d
    srl d
    srl d
    srl h
    srl h
    srl h
    ld a, d
    inc a
    sub h
    bit 1, b
    jr z, jr_002_6a61

    sub $02

jr_002_6a61:
    ld d, a
    call Call_002_5999
    push hl
    push de
    push bc
    bit 1, b
    call nz, Call_002_6aa3
    pop bc
    pop de
    push de
    push bc
    ld a, d
    or a
    jr z, jr_002_6a96

    call Call_002_6b5f
    push bc
    ld de, $c400
    ld a, l
    sub e
    ld c, a
    ld a, h
    sbc d
    ld b, a
    ld hl, sp+$05
    ld h, [hl]
    pop af
    ld l, a

jr_002_6a87:
    push hl
    push bc
    push de
    ld a, l
    ld hl, sp+$0a
    call Call_002_6ae2
    pop de
    pop bc
    pop hl
    dec h
    jr nz, jr_002_6a87

jr_002_6a96:
    pop bc
    push bc
    bit 1, b
    call nz, Call_002_6b1d
    pop bc
    pop de
    pop hl
    pop hl
    pop de
    ret


Call_002_6aa3:
    ld hl, sp+$09
    call Call_002_6bb2
    ld hl, $c400
    call Call_002_6bc2
    push hl
    ld hl, sp+$06
    ld a, [hl]
    pop hl

jr_002_6ab3:
    push af
    call Call_002_6c61
    pop af
    dec a
    jr nz, jr_002_6ab3

    call Call_002_6cde

jr_002_6abe:
    push bc
    ld de, $c400
    ld a, l
    sub e
    ld c, a
    ld a, h
    sbc d
    ld b, a
    pop af
    ld hl, sp+$06

jr_002_6acb:
    push hl
    push af
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop af
    call Call_002_6b10

jr_002_6ad4:
    trap $02
    pop hl
    ld a, [$c3be]
    add [hl]
    ld [hl+], a
    ld a, [$c3bf]
    adc [hl]
    ld [hl], a
    ret


Call_002_6ae2:
    bit 0, a
    jr nz, jr_002_6acb

    push hl
    push af
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop af
    push hl
    call Call_002_6b10
    pop bc
    push bc
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    push bc
    push de
    trap $02
    pop hl
    pop bc
    add hl, bc
    pop de
    ld a, e
    add [hl]
    ld e, a
    inc hl
    ld a, d
    adc [hl]
    ld d, a
    inc hl
    ld a, d
    ld d, h
    ld h, a
    ld a, e
    ld e, l
    ld l, a
    jr jr_002_6ad4

Call_002_6b10:
    bit 1, a
    jr z, jr_002_6b16

    dec hl
    dec hl

jr_002_6b16:
    bit 2, a
    jr z, jr_002_6b1c

    dec hl
    dec hl

jr_002_6b1c:
    ret


Call_002_6b1d:
    ld hl, sp+$0b
    call Call_002_6bb2
    ld hl, $c400
    call Call_002_6d9f
    push hl
    ld hl, sp+$06
    ld a, [hl]
    pop hl

jr_002_6b2d:
    push af
    call Call_002_6e7c
    pop af
    dec a
    jr nz, jr_002_6b2d

    call Call_002_6eef
    jr jr_002_6abe

Call_002_6b3a:
    bit 2, b
    jr z, jr_002_6b4c

    xor a
    bit 2, c
    jr z, jr_002_6b44

    dec a

jr_002_6b44:
    ld [hl+], a
    xor a
    bit 3, c
    jr z, jr_002_6b4b

    dec a

jr_002_6b4b:
    ld [hl+], a

jr_002_6b4c:
    bit 1, b
    jr z, jr_002_6b5e

    xor a
    bit 0, c
    jr z, jr_002_6b56

    dec a

jr_002_6b56:
    ld [hl+], a
    xor a
    bit 1, c
    jr z, jr_002_6b5d

    dec a

jr_002_6b5d:
    ld [hl+], a

jr_002_6b5e:
    ret


Call_002_6b5f:
    ld hl, $c400
    call Call_002_6b3a
    bit 0, b
    jr z, jr_002_6b83

    ld d, b
    push bc
    ld c, $00
    bit 4, d
    jr z, jr_002_6b72

    dec c

jr_002_6b72:
    ld b, $00
    bit 5, d
    jr z, jr_002_6b79

    dec b

jr_002_6b79:
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    dec e
    jr nz, jr_002_6b79

    pop bc
    jr jr_002_6b8d

jr_002_6b83:
    ld d, $00
    sla e
    rl d
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a

Call_002_6b8d:
jr_002_6b8d:
    bit 1, b
    jr z, jr_002_6b9f

    xor a
    bit 4, c
    jr z, jr_002_6b97

    dec a

jr_002_6b97:
    ld [hl+], a
    xor a
    bit 5, c
    jr z, jr_002_6b9e

    dec a

jr_002_6b9e:
    ld [hl+], a

jr_002_6b9f:
    bit 2, b
    jr z, jr_002_6bb1

    xor a
    bit 6, c
    jr z, jr_002_6ba9

    dec a

jr_002_6ba9:
    ld [hl+], a
    xor a
    bit 7, c
    jr z, jr_002_6bb0

    dec a

jr_002_6bb0:
    ld [hl+], a

jr_002_6bb1:
    ret


Call_002_6bb2:
    ld a, [hl]
    ld de, $8080
    and $07
    ret z

jr_002_6bb9:
    scf
    rr d
    srl e
    dec a
    jr nz, jr_002_6bb9

    ret


Call_002_6bc2:
    bit 2, b
    jr z, jr_002_6bfe

    xor a
    bit 2, c
    jr z, jr_002_6bd3

    ld a, d
    sla a
    sla a
    sla a
    cpl

jr_002_6bd3:
    ld [hl], a
    xor a
    bit 6, b
    jr z, jr_002_6be0

    ld a, d
    sla a
    sla a
    sla a

jr_002_6be0:
    or [hl]
    ld [hl+], a
    xor a
    bit 3, c
    jr z, jr_002_6bef

    ld a, d
    sla a
    sla a
    sla a
    cpl

jr_002_6bef:
    ld [hl], a
    xor a
    bit 7, b
    jr z, jr_002_6bfc

    ld a, d
    sla a
    sla a
    sla a

jr_002_6bfc:
    or [hl]
    ld [hl+], a

jr_002_6bfe:
    bit 1, b
    jr z, jr_002_6c60

    ld a, $ff
    bit 0, c
    jr z, jr_002_6c0d

    ld a, d
    sla a
    sla a

jr_002_6c0d:
    cpl
    ld [hl], a
    bit 2, b
    jr z, jr_002_6c1d

    xor a
    bit 2, c
    jr z, jr_002_6c1d

    ld a, e
    sla a
    sla a

jr_002_6c1d:
    or [hl]
    ld [hl], a
    xor a
    bit 6, b
    jr z, jr_002_6c2f

    ld a, d
    sla a
    sla a
    bit 2, b
    jr z, jr_002_6c2f

    sla a

jr_002_6c2f:
    or [hl]
    ld [hl+], a
    ld a, $ff
    bit 1, c
    jr z, jr_002_6c3c

    ld a, d
    sla a
    sla a

jr_002_6c3c:
    cpl
    ld [hl], a
    bit 2, b
    jr z, jr_002_6c4c

    xor a
    bit 3, c
    jr z, jr_002_6c4c

    ld a, e
    sla a
    sla a

jr_002_6c4c:
    or [hl]
    ld [hl], a
    xor a
    bit 7, b
    jr z, jr_002_6c5e

    ld a, d
    sla a
    sla a
    bit 2, b
    jr z, jr_002_6c5e

    sla a

jr_002_6c5e:
    or [hl]
    ld [hl+], a

jr_002_6c60:
    ret


Call_002_6c61:
    xor a
    bit 4, b
    jr z, jr_002_6c6a

    ld a, d
    sla a
    cpl

jr_002_6c6a:
    ld [hl], a
    ld a, d
    sla a
    bit 1, b
    jr z, jr_002_6c98

    xor a
    bit 0, c
    jr z, jr_002_6c7a

    ld a, e
    sla a

jr_002_6c7a:
    or [hl]
    ld [hl], a
    ld a, d
    sla a
    sla a
    bit 2, b
    jr z, jr_002_6c98

    xor a
    bit 2, c
    jr z, jr_002_6c8f

    ld a, e
    sla a
    sla a

jr_002_6c8f:
    or [hl]
    ld [hl], a
    ld a, d
    sla a
    sla a
    sla a

jr_002_6c98:
    bit 6, b
    jr nz, jr_002_6c9d

    xor a

jr_002_6c9d:
    or [hl]
    ld [hl+], a
    xor a
    bit 5, b
    jr z, jr_002_6ca8

    ld a, d
    sla a
    cpl

jr_002_6ca8:
    ld [hl], a
    ld a, d
    srl a
    bit 1, b
    jr z, jr_002_6cd6

    xor a
    bit 1, c
    jr z, jr_002_6cb8

    ld a, e
    sla a

jr_002_6cb8:
    or [hl]
    ld [hl], a
    ld a, d
    sla a
    sla a
    bit 2, b
    jr z, jr_002_6cd6

    xor a
    bit 3, c
    jr z, jr_002_6ccd

    ld a, e
    sla a
    sla a

jr_002_6ccd:
    or [hl]
    ld [hl], a
    ld a, d
    sla a
    sla a
    sla a

jr_002_6cd6:
    bit 7, b
    jr nz, jr_002_6cdb

    xor a

jr_002_6cdb:
    or [hl]
    ld [hl+], a
    ret


Call_002_6cde:
    bit 1, b
    jr z, jr_002_6d3e

    xor a
    bit 4, c
    jr z, jr_002_6ced

    ld a, d
    sla a
    sla a
    cpl

jr_002_6ced:
    ld [hl], a
    bit 2, b
    jr z, jr_002_6cfe

    xor a
    bit 2, c
    jr z, jr_002_6cfc

    ld a, e
    sla a
    sla a

jr_002_6cfc:
    or [hl]
    ld [hl], a

jr_002_6cfe:
    xor a
    bit 6, b
    jr z, jr_002_6d0e

    ld a, d
    sla a
    sla a
    bit 2, b
    jr z, jr_002_6d0e

    sla a

jr_002_6d0e:
    or [hl]
    ld [hl+], a
    xor a
    bit 5, c
    jr z, jr_002_6d1b

    ld a, d
    sla a
    sla a
    cpl

jr_002_6d1b:
    ld [hl], a
    bit 2, b
    jr z, jr_002_6d2c

    xor a
    bit 3, c
    jr z, jr_002_6d2a

    ld a, e
    sla a
    sla a

jr_002_6d2a:
    or [hl]
    ld [hl], a

jr_002_6d2c:
    xor a
    bit 7, b
    jr z, jr_002_6d3c

    ld a, d
    sla a
    sla a
    bit 2, b
    jr z, jr_002_6d3c

    sla a

jr_002_6d3c:
    or [hl]
    ld [hl+], a

jr_002_6d3e:
    bit 2, b
    jr z, jr_002_6d9e

    ld a, $ff
    bit 6, c
    jr z, jr_002_6d4b

    ld a, d
    sla a

jr_002_6d4b:
    cpl
    ld [hl], a
    xor a
    bit 3, b
    jr z, jr_002_6d56

    bit 6, c
    jr jr_002_6d58

jr_002_6d56:
    bit 6, b

jr_002_6d58:
    jr z, jr_002_6d60

    ld a, e
    sla a
    or e
    sla a

jr_002_6d60:
    or [hl]
    ld [hl], a
    xor a
    bit 6, b
    jr z, jr_002_6d6e

    ld a, d
    sla a
    sla a
    sla a

jr_002_6d6e:
    or [hl]
    ld [hl+], a
    ld a, $ff
    bit 7, c
    jr z, jr_002_6d79

    ld a, d
    sla a

jr_002_6d79:
    cpl
    ld [hl], a
    xor a
    bit 3, b
    jr z, jr_002_6d84

    bit 7, c
    jr jr_002_6d86

jr_002_6d84:
    bit 7, b

jr_002_6d86:
    jr z, jr_002_6d8e

    ld a, e
    sla a
    or e
    sla a

jr_002_6d8e:
    or [hl]
    ld [hl], a
    xor a
    bit 7, b
    jr z, jr_002_6d9c

    ld a, d
    sla a
    sla a
    sla a

jr_002_6d9c:
    or [hl]
    ld [hl+], a

jr_002_6d9e:
    ret


Call_002_6d9f:
    bit 2, b
    jr z, jr_002_6dfd

    xor a
    bit 2, c
    jr z, jr_002_6dac

    ld a, d
    scf
    rr a

jr_002_6dac:
    ld [hl], a
    xor a
    bit 3, b
    jr nz, jr_002_6db6

    bit 6, b
    jr jr_002_6db8

jr_002_6db6:
    bit 6, c

jr_002_6db8:
    jr z, jr_002_6dbf

    ld a, e
    srl a
    srl a

jr_002_6dbf:
    or [hl]
    ld [hl], a
    xor a
    bit 6, b
    jr z, jr_002_6dce

    ld a, d
    srl a
    srl a
    or $c0
    cpl

jr_002_6dce:
    or [hl]
    ld [hl+], a
    xor a
    bit 3, c
    jr z, jr_002_6dd9

    ld a, d
    scf
    rr a

jr_002_6dd9:
    ld [hl], a
    xor a
    bit 3, b
    jr nz, jr_002_6de3

    bit 7, b
    jr jr_002_6de5

jr_002_6de3:
    bit 7, c

jr_002_6de5:
    jr z, jr_002_6dec

    ld a, e
    srl a
    srl a

jr_002_6dec:
    or [hl]
    ld [hl], a
    xor a
    bit 7, b
    jr z, jr_002_6dfb

    ld a, d
    srl a
    srl a
    or $c0
    cpl

jr_002_6dfb:
    or [hl]
    ld [hl+], a

jr_002_6dfd:
    bit 1, b
    jr z, jr_002_6e7b

    xor a
    bit 0, c
    jr z, jr_002_6e07

    ld a, d

jr_002_6e07:
    ld [hl], a
    xor a
    bit 4, c
    jr z, jr_002_6e10

    ld a, e
    srl a

jr_002_6e10:
    or [hl]
    ld [hl], a
    bit 2, b
    jr z, jr_002_6e28

    xor a
    bit 3, b
    jr nz, jr_002_6e1f

    bit 6, b
    jr jr_002_6e21

jr_002_6e1f:
    bit 6, c

jr_002_6e21:
    jr z, jr_002_6e28

    ld a, e
    srl a
    srl a

jr_002_6e28:
    or [hl]
    ld [hl], a
    ld a, $ff
    bit 6, b
    jr z, jr_002_6e3b

    ld a, d
    scf
    rr a
    bit 2, b
    jr z, jr_002_6e3b

    scf
    rr a

jr_002_6e3b:
    cpl
    or [hl]
    ld [hl+], a
    xor a
    bit 1, c
    jr z, jr_002_6e44

    ld a, d

jr_002_6e44:
    ld [hl], a
    xor a
    bit 5, c
    jr z, jr_002_6e4d

    ld a, e
    srl a

jr_002_6e4d:
    or [hl]
    ld [hl], a
    bit 2, b
    jr z, jr_002_6e65

    xor a
    bit 3, b
    jr nz, jr_002_6e5c

    bit 7, b
    jr jr_002_6e5e

jr_002_6e5c:
    bit 7, c

jr_002_6e5e:
    jr z, jr_002_6e65

    ld a, e
    srl a
    srl a

jr_002_6e65:
    or [hl]
    ld [hl], a
    ld a, $ff
    bit 7, b
    jr z, jr_002_6e78

    ld a, d
    scf
    rr a
    bit 2, b
    jr z, jr_002_6e78

    scf
    rr a

jr_002_6e78:
    cpl
    or [hl]
    ld [hl+], a

jr_002_6e7b:
    ret


Call_002_6e7c:
    xor a
    bit 4, b
    jr z, jr_002_6e82

    ld a, d

jr_002_6e82:
    ld [hl], a
    ld a, d
    bit 1, b
    jr z, jr_002_6ead

    xor a
    bit 4, c
    jr z, jr_002_6e90

    ld a, e
    srl a

jr_002_6e90:
    or [hl]
    ld [hl], a
    ld a, d
    scf
    rr a
    bit 2, b
    jr z, jr_002_6ead

    xor a
    bit 6, c
    jr z, jr_002_6ea4

    ld a, e
    srl a
    srl a

jr_002_6ea4:
    or [hl]
    ld [hl], a
    ld a, d
    srl a
    srl a
    or $c0

jr_002_6ead:
    cpl
    bit 6, b
    jr nz, jr_002_6eb3

    xor a

jr_002_6eb3:
    or [hl]
    ld [hl+], a
    xor a
    bit 5, b
    jr z, jr_002_6ebb

    ld a, d

jr_002_6ebb:
    ld [hl], a
    ld a, d
    bit 1, b
    jr z, jr_002_6ee6

    xor a
    bit 5, c
    jr z, jr_002_6ec9

    ld a, e
    srl a

jr_002_6ec9:
    or [hl]
    ld [hl], a
    ld a, d
    scf
    rr a
    bit 2, b
    jr z, jr_002_6ee6

    xor a
    bit 7, c
    jr z, jr_002_6edd

    ld a, e
    srl a
    srl a

jr_002_6edd:
    or [hl]
    ld [hl], a
    ld a, d
    srl a
    srl a
    or $c0

jr_002_6ee6:
    cpl
    bit 7, b
    jr nz, jr_002_6eec

    xor a

jr_002_6eec:
    or [hl]
    ld [hl+], a
    ret


Call_002_6eef:
    bit 1, b
    jr z, jr_002_6f51

    xor a
    bit 4, c
    jr z, jr_002_6efc

    ld a, d
    scf
    rr a

jr_002_6efc:
    ld [hl], a
    xor a
    bit 2, b
    jr z, jr_002_6f0e

    xor a
    bit 6, c
    jr z, jr_002_6f0c

    ld a, e
    srl a
    srl a

jr_002_6f0c:
    or [hl]
    ld [hl], a

jr_002_6f0e:
    ld a, $ff
    bit 6, b
    jr z, jr_002_6f1f

    ld a, d
    scf
    rr a
    bit 2, b
    jr z, jr_002_6f1f

    scf
    rr a

jr_002_6f1f:
    cpl
    or [hl]
    ld [hl+], a
    xor a
    bit 5, c
    jr z, jr_002_6f2b

    ld a, d
    scf
    rr a

jr_002_6f2b:
    ld [hl], a
    xor a
    bit 2, b
    jr z, jr_002_6f3d

    xor a
    bit 7, c
    jr z, jr_002_6f3b

    ld a, e
    srl a
    srl a

jr_002_6f3b:
    or [hl]
    ld [hl], a

jr_002_6f3d:
    ld a, $ff
    bit 7, b
    jr z, jr_002_6f4e

    ld a, d
    scf
    rr a
    bit 2, b
    jr z, jr_002_6f4e

    scf
    rr a

jr_002_6f4e:
    cpl
    or [hl]
    ld [hl+], a

jr_002_6f51:
    bit 2, b
    jr z, jr_002_6f8d

    xor a
    bit 6, c
    jr z, jr_002_6f61

    ld a, d
    srl a
    srl a
    or $c0

jr_002_6f61:
    ld [hl], a
    xor a
    bit 6, b
    jr z, jr_002_6f6f

    ld a, d
    srl a
    srl a
    or $c0
    cpl

jr_002_6f6f:
    or [hl]
    ld [hl+], a
    xor a
    bit 7, c
    jr z, jr_002_6f7d

    ld a, d
    srl a
    srl a
    or $c0

jr_002_6f7d:
    ld [hl], a
    xor a
    bit 7, b
    jr z, jr_002_6f8b

    ld a, d
    srl a
    srl a
    or $c0
    cpl

jr_002_6f8b:
    or [hl]
    ld [hl+], a

jr_002_6f8d:
    ret


image_02_6f8e::
    INCBIN "gfx/font.1bpp"

image_02_778e::
    INCBIN "gfx/borders.icon"

    db $01, $81, $40, $41, $42, $43, $44, $45, $ff, $00

gfxLetterIcon::
    INCBIN "gfx/letter.icon"
gfxMailIcon::
    INCBIN "gfx/mail.icon"
gfxFlyIcon::
    INCBIN "gfx/hikou0.icon"
gfxPuzzleIcon::
    INCBIN "gfx/puzzle0.icon"
gfxSwordIcon::
    INCBIN "gfx/ken0.icon"
gfxCardIcon::
    INCBIN "gfx/card0.icon"
gfxMapIcon::
    INCBIN "gfx/map.icon"
gfxHouseIcon::
    INCBIN "gfx/ie2.icon"
gfxEmptyIcon::
    INCBIN "gfx/empty.icon"
gfxHatchIcon::
    INCBIN "gfx/simula1.icon"
