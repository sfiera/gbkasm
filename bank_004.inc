; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $004", ROMX[$4000], BANK[$4]

AudioTraps::
.stop
    jp TrapAudioStop       ; from trap $11
.unknown
    jp TrapAudioUnknown    ; from trap $12
.playMusic
    jp TrapAudioPlayMusic  ; from trap $13
.playSound
    jp TrapAudioPlaySound  ; from trap $14
.silence
    jp TrapAudioSilence    ; from trap $15
.getMusic
    jp TrapAudioGetMusic   ; from trap $16
.getSound
    jp TrapAudioGetSound   ; from trap $17
.setVolume
    jp TrapAudioSetVolume  ; from trap $18
.getCount
    jp TrapAudioGetCount   ; from trap $19


TrapAudioPlayMusic:
    ld [$c020], a
    xor a
    ld [$c02b], a
    ld [$c090], a
    dec a
    ld [$c024], a
    ret


TrapAudioPlaySound:
    push bc
    push hl
    ld b, $00
    ld c, a
    or a
    jr z, jr_004_4040

    ld hl, data_04_4a56
    add hl, bc
    ld b, [hl]
    ld a, [$c023]
    or a
    jr z, jr_004_4040

    cp b
    jr c, jr_004_4048

jr_004_4040:
    ld a, c
    ld [$c022], a
    ld a, b
    ld [$c023], a

jr_004_4048:
    pop hl
    pop bc
    ret


TrapAudioSilence:
    ld [$c091], a
    ret


TrapAudioGetMusic:
    ld a, [$c020]
    cp $80
    ld a, $01
    ret nz

    xor a
    ret


TrapAudioGetSound:
    ld a, [$c022]
    cp $80
    ld a, $01
    ret nz

    xor a
    ret


TrapAudioSetVolume:
    ld a, [$c093]
    xor $01
    ld [$c093], a
    ret


TrapAudioGetCount:
    push bc
    push af
    and $07
    ld b, a
    swap b
    or b
    ld [$c092], a
    pop af
    pop bc
    ret


TrapAudioStop:
    xor a
    ldh [rNR52], a
    ld a, $80
    ldh [rNR52], a
    ld a, $77
    ldh [rNR50], a
    ld a, $ff
    ldh [rNR51], a
    ld a, $04
    ld [$c021], a
    ld a, $80
    ld [$c020], a
    ld [$c022], a
    ld a, $77
    ld [$c092], a
    xor a
    ld [$c02d], a
    ld [$c02c], a
    ld [$c0f4], a
    ld [$c02b], a
    ld [$c090], a
    ld [$c091], a
    ld [$c093], a
    dec a
    ld [$c024], a
    ld de, $0001
    ld bc, $0000

jr_004_40bb:
    ld hl, $c02e
    add hl, bc
    ld [hl], d
    ld hl, $c032
    add hl, bc
    ld [hl], d
    ld hl, $c054
    add hl, bc
    ld [hl], d
    ld hl, $c070
    add hl, bc
    ld [hl], d
    ld hl, $c064
    add hl, bc
    ld [hl], d
    inc c
    ld a, c
    cp $04
    jr nz, jr_004_40bb

    ld hl, data_04_4946
    ld bc, $c094
    ld d, $08

jr_004_40e2:
    ld a, [hl+]
    ld [bc], a
    inc bc
    dec d
    jr nz, jr_004_40e2

    ret


TrapAudioUnknown:
    call Call_004_429c
    call Call_004_4118
    ld hl, Jump_003_4053_Origin
    call Call_000_3fe0
    ld a, [$c021]
    rst $20
    ld a, [$c093]
    cp $00
    jr z, jr_004_4105

    call Call_004_4902
    jr jr_004_4111

jr_004_4105:
    call Call_004_429d
    call Call_004_42d9
    call Call_004_4315
    call Call_004_436d

jr_004_4111:
    call Call_004_47fb
    call Call_004_4933
    ret


Call_004_4118:
    ld a, [$c020]
    rla
    jr c, jr_004_412f

    call Call_004_4147
    ld a, [$c020]
    call Call_004_4188
    ld a, [$c020]
    or $80
    ld [$c020], a

jr_004_412f:
    ld a, [$c022]
    rla
    jr c, jr_004_4146

    ld a, [$c022]
    ld hl, Jump_003_4006_Origin
    call Call_000_3fe0
    ld a, [$c022]
    or $80
    ld [$c022], a

jr_004_4146:
    ret


Call_004_4147:
    ld a, [$c02d]
    ld d, a
    xor a
    ld [$c02e], a
    bit 0, d
    jr nz, jr_004_415b

    ld a, $08
    ldh [rNR12], a
    swap a
    ldh [rNR14], a

jr_004_415b:
    xor a
    ld [$c02f], a
    bit 1, d
    jr nz, jr_004_416b

    ld a, $08
    ldh [rNR22], a
    swap a
    ldh [rNR24], a

jr_004_416b:
    xor a
    ld [$c031], a
    bit 3, d
    jr nz, jr_004_417b

    ld a, $08
    ldh [rNR42], a
    swap a
    ldh [rNR44], a

jr_004_417b:
    xor a
    ld [$c030], a
    bit 2, d
    jr nz, jr_004_4187

    ld a, $00
    ldh [rNR32], a

jr_004_4187:
    ret


Call_004_4188:
    push af
    ld c, a
    ld b, $00
    ld hl, data_04_4a00
    add hl, bc
    ld a, [hl]
    ld [$c021], a
    rst $20
    pop af
    add a
    ld c, a
    ld b, $00
    ld hl, data_04_4a1c
    add hl, bc
    ld e, [hl]
    inc hl
    ld h, [hl]
    ld l, e
    ld e, [hl]
    inc hl
    ld b, h
    ld c, l
    rr e
    jr nc, jr_004_41e3

    ld a, [bc]
    inc bc
    ld [$c036], a
    ld [$c03e], a
    ld a, [bc]
    inc bc
    ld [$c037], a
    ld [$c03f], a
    ld a, $01
    ld [$c05c], a
    ld [$c02e], a
    xor a
    ld [$c032], a
    ld [$c08b], a
    ld [$c064], a
    ld [$c080], a
    ld [$c070], a
    ld a, [data_04_4946]
    ld [$c094], a
    ld a, [$4947]
    ld [$c095], a
    ld a, $40
    ld [$c06c], a

jr_004_41e3:
    rr e
    jr nc, jr_004_4220

    ld a, [bc]
    inc bc
    ld [$c038], a
    ld [$c040], a
    ld a, [bc]
    inc bc
    ld [$c039], a
    ld [$c041], a
    ld a, $01
    ld [$c05d], a
    ld [$c02f], a
    xor a
    ld [$c033], a
    ld [$c08c], a
    ld [$c065], a
    ld [$c081], a
    ld [$c071], a
    ld a, [$4948]
    ld [$c096], a
    ld a, [$4949]
    ld [$c097], a
    ld a, $40
    ld [$c06d], a

jr_004_4220:
    rr e
    jr nc, jr_004_425d

    ld a, [bc]
    inc bc
    ld [$c03a], a
    ld [$c042], a
    ld a, [bc]
    inc bc
    ld [$c03b], a
    ld [$c043], a
    ld a, $01
    ld [$c05e], a
    ld [$c030], a
    xor a
    ld [$c034], a
    ld [$c08d], a
    ld [$c066], a
    ld [$c082], a
    ld [$c072], a
    ld a, [$494a]
    ld [$c098], a
    ld a, [$494b]
    ld [$c099], a
    ld a, $40
    ld [$c06e], a

jr_004_425d:
    rr e
    jr nc, jr_004_4297

    ld a, [bc]
    inc bc
    ld [$c03c], a
    ld [$c044], a
    ld a, [bc]
    inc bc
    ld [$c03d], a
    ld [$c045], a
    ld a, $01
    ld [$c05f], a
    ld [$c031], a
    xor a
    ld [$c035], a
    ld [$c067], a
    ld [$c083], a
    ld [$c073], a
    ld a, [$494c]
    ld [$c09a], a
    ld a, [$494d]
    ld [$c09b], a
    ld a, $40
    ld [$c06f], a

jr_004_4297:
    xor a
    ld [$c093], a
    ret


Call_004_429c:
    ret


Call_004_429d:
    ld a, [$c02e]
    or a
    jr z, jr_004_42c9

    ld a, [$c05c]
    dec a
    ld [$c05c], a
    jr nz, jr_004_42c3

    ld a, [$c037]
    ld h, a
    ld a, [$c036]
    ld l, a
    ld bc, $0000
    call Call_004_43b3
    ld a, [$c02e]
    or a
    jr z, jr_004_42c9

    call Call_004_46a8

jr_004_42c3:
    ld a, $00
    call Call_004_47ef
    ret


jr_004_42c9:
    ld a, [$c02d]
    bit 0, a
    jr nz, jr_004_42d8

    ld a, $08
    ldh [rNR12], a
    swap a
    ldh [rNR14], a

jr_004_42d8:
    ret


Call_004_42d9:
    ld a, [$c02f]
    or a
    jr z, jr_004_4305

    ld a, [$c05d]
    dec a
    ld [$c05d], a
    jr nz, jr_004_42ff

    ld a, [$c039]
    ld h, a
    ld a, [$c038]
    ld l, a
    ld bc, $0001
    call Call_004_43b3
    ld a, [$c02f]
    or a
    jr z, jr_004_4305

    call Call_004_46ee

jr_004_42ff:
    ld a, $01
    call Call_004_47ef
    ret


jr_004_4305:
    ld a, [$c02d]
    bit 1, a
    jr nz, jr_004_4314

    ld a, $08
    ldh [rNR22], a
    swap a
    ldh [rNR24], a

jr_004_4314:
    ret


Call_004_4315:
    ld a, [$c030]
    or a
    jr z, jr_004_435d

    ld a, [$c05a]
    cp $00
    jr z, jr_004_4337

    ld a, [$c06a]
    dec a
    ld [$c06a], a
    jr nz, jr_004_4337

    ld a, [$c05e]
    cp $01
    jr z, jr_004_4337

    ld a, [$c06e]
    ldh [rNR32], a

jr_004_4337:
    ld a, [$c05e]
    dec a
    ld [$c05e], a
    jr nz, jr_004_4357

    ld a, [$c03b]
    ld h, a
    ld a, [$c03a]
    ld l, a
    ld bc, $0002
    call Call_004_43b3
    ld a, [$c030]
    or a
    jr z, jr_004_435d

    call Call_004_4730

jr_004_4357:
    ld a, $02
    call Call_004_47ef
    ret


jr_004_435d:
    ld a, [$c02d]
    bit 2, a
    jr nz, jr_004_436c

    ld a, $00
    ldh [rNR32], a
    ld a, $80
    ldh [rNR34], a

jr_004_436c:
    ret


Call_004_436d:
    ld a, [$c031]
    or a
    jr z, jr_004_439f

    ld a, [$c05f]
    dec a
    ld [$c05f], a
    jr nz, jr_004_4395

    ld a, [$c03d]
    ld h, a
    ld a, [$c03c]
    ld l, a
    ld bc, $0003
    call Call_004_43b3
    ld a, [$c031]
    or a
    jr z, jr_004_439f

    call Call_004_479f
    jr jr_004_43b2

jr_004_4395:
    ld a, [$c090]
    or a
    jr z, jr_004_43b2

    call Call_004_47ce
    ret


jr_004_439f:
    ld a, [$c02d]
    bit 3, a
    jr nz, jr_004_43b2

    xor a
    ld [$c090], a
    ld a, $08
    ldh [rNR42], a
    swap a
    ldh [rNR44], a

jr_004_43b2:
    ret


Call_004_43b3:
Jump_004_43b3:
    ld a, [hl+]
    push hl
    push af
    cp $d0
    jr c, jr_004_442b

    sub $d0
    add a
    ld e, a
    ld d, $00
    ld hl, $43cb
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld h, d
    ld l, e
    pop af
    jp hl


    dec c
    ld b, l
    jr jr_004_4414

    jr jr_004_4416

    jr jr_004_4418

    jr jr_004_441a

    jr jr_004_441c

    jr jr_004_441e

    jr nc, jr_004_4420

    jr c, jr_004_4422

    ld b, b
    ld b, l
    ld c, c
    ld b, l
    ld d, h
    ld b, l
    ld l, a
    ld b, l
    adc d
    ld b, l
    sbc b
    ld b, l
    and h
    ld b, l
    cp c
    ld b, l
    db $d3
    ld b, l
    jp c, $f145

    ld b, l
    ld [bc], a
    ld b, [hl]
    rrca
    ld b, [hl]
    inc e
    ld b, [hl]
    add hl, hl
    ld b, [hl]
    add hl, sp
    ld b, [hl]
    ld b, [hl]
    ld b, [hl]
    ld d, e
    ld b, [hl]
    ld h, b
    ld b, [hl]
    ld l, l
    ld b, [hl]
    ld a, d
    ld b, [hl]
    adc b
    ld b, [hl]
    adc b
    ld b, [hl]
    adc b
    ld b, [hl]
    adc b
    ld b, [hl]
    adc b
    ld b, [hl]
    adc b
    ld b, [hl]
    adc b

jr_004_4414:
    ld b, [hl]
    adc b

jr_004_4416:
    ld b, [hl]
    adc b

jr_004_4418:
    ld b, [hl]
    adc b

jr_004_441a:
    ld b, [hl]
    adc b

jr_004_441c:
    ld b, [hl]
    adc b

jr_004_441e:
    ld b, [hl]
    adc b

jr_004_4420:
    ld b, [hl]
    adc b

jr_004_4422:
    ld b, [hl]
    adc b
    ld b, [hl]
    adc b
    ld b, [hl]
    adc b
    ld b, [hl]
    adc b
    ld b, [hl]

jr_004_442b:
    push af
    ld a, [hl]
    ld e, a
    ld hl, $c032
    add hl, bc
    ld a, [hl]
    cp $80
    jr z, jr_004_4444

    ld [hl], $01
    xor a
    ld hl, $c07c
    add hl, bc
    ld [hl], a
    ld hl, $c084
    add hl, bc
    ld [hl], a

jr_004_4444:
    pop af
    push de
    ld hl, $c074
    add hl, bc
    ld d, [hl]
    and $0f
    inc a
    cp d
    jr nc, jr_004_4454

    ld e, a
    ld a, d
    ld d, e

jr_004_4454:
    ld e, a

jr_004_4455:
    dec d
    jr z, jr_004_445b

    add e
    jr jr_004_4455

jr_004_445b:
    ld hl, $c05c
    add hl, bc
    ld [hl], a
    pop de
    ld d, a
    ld a, e
    cp $d9
    ld a, d
    jr z, jr_004_4485

    cp $08
    jr c, jr_004_4485

    ld a, d
    ld e, a
    ld hl, $c064
    add hl, bc
    ld a, [hl]
    ld d, a
    cp $00
    ld a, e
    jr z, jr_004_4485

    srl e
    srl e
    srl e
    ld a, $00

jr_004_4481:
    add e
    dec d
    jr nz, jr_004_4481

jr_004_4485:
    ld hl, $c068
    add hl, bc
    ld [hl], a
    pop af
    and $f0
    ld hl, $c058
    add hl, bc
    ld [hl], a
    or a
    jr nz, jr_004_4497

    jr jr_004_4503

jr_004_4497:
    swap a
    dec a
    ld h, a
    ld a, $03
    cp c
    ld a, h
    jr z, jr_004_44a3

    jr jr_004_44d9

jr_004_44a3:
    ld hl, data_04_4c86
    add a
    ld d, c
    ld c, a
    add hl, bc
    ld c, d
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]
    ld d, a
    ld a, [$c024]
    and $77
    or d
    ld [$c024], a
    ld de, $c04c
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld b, [hl]
    inc hl
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    ld b, $00
    ld a, l
    ld d, h
    ld hl, $c08e
    ld [hl+], a
    ld [hl], d
    ld a, $01
    ld [$c090], a
    jr jr_004_4503

jr_004_44d9:
    ld hl, $c046
    add hl, bc
    add hl, bc
    push hl
    ld hl, $c050
    add hl, bc
    ld e, [hl]
    ld d, $00
    ld hl, $494e
    add hl, de
    add a
    ld e, [hl]
    add e
    ld hl, $c070
    add hl, bc
    ld e, [hl]
    add e
    add e
    ld e, a
    ld hl, $4956
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    call Call_004_48e9
    pop hl
    ld a, e
    ld [hl+], a
    ld [hl], d

jr_004_4503:
    pop de
    ld hl, $c036
    add hl, bc
    add hl, bc
    ld [hl], e
    inc hl
    ld [hl], d
    ret


    pop hl
    ld a, [hl+]
    push hl
    ld hl, $c074
    add hl, bc
    ld [hl], a
    jp Jump_004_46a4


    and $07
    dec a
    ld hl, $c050
    add hl, bc
    push af
    ld a, c
    cp $02
    jr nz, jr_004_452b

    pop af
    inc a
    ld [hl], a
    jp Jump_004_46a4


jr_004_452b:
    pop af
    ld [hl], a
    jp Jump_004_46a4


    ld hl, $c050
    add hl, bc
    inc [hl]
    jp Jump_004_46a4


    ld hl, $c050
    add hl, bc
    dec [hl]
    jp Jump_004_46a4


    ld hl, $c032
    add hl, bc
    ld [hl], $80
    jp Jump_004_46a4


    pop hl
    ld a, [hl+]
    push hl
    ld hl, $c060
    add hl, bc
    ld [hl], a
    jp Jump_004_46a4


    pop hl
    ld a, [hl+]
    ld d, a
    push hl
    ld hl, $c060
    add hl, bc
    ld a, [hl]
    add d
    bit 7, a
    jr z, jr_004_4565

    xor a
    jr jr_004_456b

jr_004_4565:
    cp $15
    jr c, jr_004_456b

    ld a, $15

jr_004_456b:
    ld [hl], a
    jp Jump_004_46a4


    pop hl
    ld a, [hl+]
    push hl
    push bc
    inc c
    ld e, $ee

jr_004_4576:
    dec c
    jr z, jr_004_457e

    rlca
    rlc e
    jr jr_004_4576

jr_004_457e:
    ld d, a
    ld hl, $c024
    ld a, [hl]
    and e
    or d
    ld [hl], a
    pop bc
    jp Jump_004_46a4


    pop de
    push de
    dec de
    ld hl, $c03e
    add hl, bc
    add hl, bc
    ld [hl], e
    inc hl
    ld [hl], d
    jp Jump_004_46a4


    pop hl
    ld hl, $c03e
    add hl, bc
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp Jump_004_43b3


    pop de
    ld a, [de]
    inc de
    push af
    call Call_004_4690
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    pop af
    ld [hl], a
    inc hl
    push de
    call Call_004_4699
    jp Jump_004_46a4


    call Call_004_4690
    dec hl
    ld a, [hl]
    dec a
    jr z, jr_004_45cb

    ld [hl-], a
    ld d, [hl]
    dec hl
    ld e, [hl]
    pop hl
    ld h, d
    ld l, e
    jp Jump_004_43b3


jr_004_45cb:
    dec hl
    dec hl
    call Call_004_4699
    jp Jump_004_46a4


    pop hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp Jump_004_43b3


    call Call_004_4690
    pop de
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld d, a
    ld e, b
    ld b, $00
    push de
    call Call_004_4699
    jp Jump_004_46a4


    pop de
    call Call_004_4690
    dec hl
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    inc de
    inc de
    push de
    call Call_004_4699
    jp Jump_004_46a4


    pop de
    ld a, [de]
    inc de
    ld hl, $c08b
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_004_43b3


    pop de
    ld a, [de]
    inc de
    ld hl, $c026
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_004_43b3


    pop de
    ld a, [de]
    inc de
    ld hl, $c088
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_004_43b3


    pop de
    ld a, [de]
    inc de
    ld [$c02a], a
    ld a, $01
    ld [$c02b], a
    ld h, d
    ld l, e
    jp Jump_004_43b3


    pop de
    ld a, [de]
    inc de
    ld hl, $c064
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_004_43b3


    pop de
    ld a, [de]
    inc de
    ld hl, $c06c
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_004_43b3


    pop de
    ld a, [de]
    inc de
    ld hl, $c078
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_004_43b3


    pop de
    ld a, [de]
    inc de
    ld hl, $c080
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_004_43b3


    pop de
    ld a, [de]
    inc de
    ld hl, $c070
    add hl, bc
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_004_43b3


    pop de
    ld a, [de]
    inc de
    ld hl, $c070
    add hl, bc
    add [hl]
    ld [hl], a
    ld h, d
    ld l, e
    jp Jump_004_43b3


    ld hl, $c02e
    add hl, bc
    ld [hl], $00
    pop hl
    ret


Call_004_4690:
    ld hl, $c094
    add hl, bc
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ret


Call_004_4699:
    ld d, h
    ld e, l
    ld hl, $c094
    add hl, bc
    add hl, bc
    ld [hl], e
    inc hl
    ld [hl], d
    ret


Jump_004_46a4:
    pop hl
    jp Jump_004_43b3


Call_004_46a8:
    ld a, [$c02d]
    bit 0, a
    jr nz, jr_004_46dd

    ld a, [$c058]
    cp $00
    jr z, jr_004_46de

    ld d, $00
    ld hl, $c032
    ld a, [hl]
    cp $80
    jr z, jr_004_46c7

    ld a, [$c088]
    ldh [rNR12], a
    ld d, $80

jr_004_46c7:
    ld [hl], $02
    ld a, $08
    ldh [rNR10], a
    ld a, [$c026]
    ldh [rNR11], a
    ld a, [$c046]
    ldh [rNR13], a
    ld a, [$c047]
    or d
    ldh [rNR14], a

jr_004_46dd:
    ret


jr_004_46de:
    ld hl, $c032
    ld [hl], $00
    ld hl, $ff12
    ld a, $08
    ld [hl+], a
    inc hl
    swap a
    ld [hl], a
    ret


Call_004_46ee:
    ld a, [$c02d]
    bit 1, a
    jr nz, jr_004_471f

    ld a, [$c059]
    cp $00
    jr z, jr_004_4720

    ld d, $00
    ld hl, $c033
    ld a, [hl]
    cp $80
    jr z, jr_004_470d

    ld a, [$c089]
    ldh [rNR22], a
    ld d, $80

jr_004_470d:
    ld [hl], $02
    ld a, [$c027]
    ldh [rNR21], a
    ld a, [$c048]
    ldh [rNR23], a
    ld a, [$c049]
    or d
    ldh [rNR24], a

jr_004_471f:
    ret


jr_004_4720:
    ld hl, $c033
    ld [hl], $00
    ld hl, $ff17
    ld a, $08
    ld [hl+], a
    inc hl
    swap a
    ld [hl], a
    ret


Call_004_4730:
    ld a, [$c02d]
    bit 2, a
    jr nz, jr_004_4775

    ld d, $00
    ld a, [$c02b]
    or a
    jr z, jr_004_4747

    xor a
    ldh [rNR30], a
    ld d, $80
    call Call_004_477f

jr_004_4747:
    ld a, [$c05a]
    cp $00
    jr z, jr_004_4776

    ld hl, $c034
    ld a, [hl]
    cp $80
    jr z, jr_004_4760

    ld a, [$c08a]
    ldh [rNR32], a
    xor a
    ldh [rNR30], a
    ld d, $80

jr_004_4760:
    ld [hl], $02
    xor a
    ldh [rNR31], a
    ld a, [$c04a]
    ldh [rNR33], a
    ld a, $80
    ldh [rNR30], a
    ld a, [$c04b]
    or $80
    ldh [rNR34], a

jr_004_4775:
    ret


jr_004_4776:
    ld hl, $c032
    ld [hl], $00
    xor a
    ldh [rNR30], a
    ret


Call_004_477f:
    ld a, [$c02a]
    add a
    ld d, $00
    ld e, a
    ld hl, data_04_4a8e
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld b, d
    ld de, $ff30

jr_004_4791:
    ld a, [hl+]
    ld [de], a
    inc de
    inc b
    ld a, b
    cp $10
    jr nz, jr_004_4791

    xor a
    ld [$c02b], a
    ret


Call_004_479f:
    ld a, [$c02d]
    bit 3, a
    jr nz, jr_004_47be

    ld a, [$c05b]
    cp $00
    jr z, jr_004_47bf

    ld de, $ff20
    ld hl, $c04c
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, [hl+]
    ld [de], a

jr_004_47be:
    ret


jr_004_47bf:
    xor a
    ld [$c090], a
    ld hl, $ff21
    ld a, $08
    ld [hl+], a
    inc hl
    swap a
    ld [hl], a
    ret


Call_004_47ce:
    ld a, [$c02d]
    bit 3, a
    jr z, jr_004_47db

    xor a
    ld [$c090], a
    jr jr_004_47ee

jr_004_47db:
    ld hl, $c08e
    ld a, [hl+]
    ld d, [hl]
    ld e, a
    ld a, [de]
    cp $ff
    jr nz, jr_004_47e8

    jr jr_004_47bf

jr_004_47e8:
    ldh [rNR43], a
    inc de
    ld a, d
    ld [hl-], a
    ld [hl], e

jr_004_47ee:
    ret


Call_004_47ef:
    push af
    ld b, $00
    ld c, a
    call Call_004_482d
    pop af
    call Call_004_48a0
    ret


Call_004_47fb:
    ld a, [$c092]
    ldh [rNR50], a
    ld a, [$c02d]
    or a
    ld hl, $c024
    ld a, [hl+]
    jr z, jr_004_481d

    ld a, [$c02d]
    and $0f
    ld d, a
    swap d
    or d
    ld d, a
    xor $ff
    ld e, a
    ld a, [hl-]
    and d
    ld d, a
    ld a, [hl]
    and e
    or d

jr_004_481d:
    ld d, a
    ld a, [$c091]
    xor $ff
    and $0f
    ld e, a
    swap e
    or e
    and d
    ldh [rNR51], a
    ret


Call_004_482d:
    ld hl, $c080
    add hl, bc
    ld a, [hl]
    cp $00
    jr z, jr_004_4897

    ld hl, $c084
    add hl, bc
    cp [hl]
    jr z, jr_004_4840

    inc [hl]
    jr jr_004_4897

jr_004_4840:
    ld hl, $c078
    add hl, bc
    ld e, [hl]
    ld d, $00
    ld hl, data_04_4d3e
    add hl, de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c07c
    add hl, bc
    ld d, $00
    ld e, [hl]
    inc [hl]
    pop hl
    add hl, de
    ld a, [hl+]
    cp $80
    jr z, jr_004_4883

    ld hl, $c046
    add hl, bc
    add hl, bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    bit 7, a
    jr nz, jr_004_4874

    add e
    ld e, a
    ld a, $00
    adc d
    and $07
    ld d, a
    ret


jr_004_4874:
    xor $ff
    inc a
    push bc
    ld c, a
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    and $07
    ld d, a
    pop bc
    ret


jr_004_4883:
    push hl
    ld hl, $c07c
    add hl, bc
    ld [hl], $00
    pop hl
    ld a, [hl]
    cp $80
    jr z, jr_004_4840

    ld hl, $c078
    add hl, bc
    ld [hl], a
    jr jr_004_4840

jr_004_4897:
    ld hl, $c046
    add hl, bc
    add hl, bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    ret


Call_004_48a0:
    cp $00
    jr nz, jr_004_48b8

    ld a, [$c080]
    cp $00
    jr z, jr_004_48b8

    ld a, [$c02d]
    bit 0, a
    jr nz, jr_004_48e8

    ld a, e
    ldh [rNR13], a
    ld a, d
    ldh [rNR14], a

jr_004_48b8:
    cp $01
    jr nz, jr_004_48d0

    ld a, [$c081]
    cp $00
    jr z, jr_004_48d0

    ld a, [$c02d]
    bit 1, a
    jr nz, jr_004_48e8

    ld a, e
    ldh [rNR23], a
    ld a, d
    ldh [rNR24], a

jr_004_48d0:
    cp $02
    jr nz, jr_004_48e8

    ld a, [$c082]
    cp $00
    jr z, jr_004_48e8

    ld a, [$c02d]
    bit 2, a
    jr nz, jr_004_48e8

    ld a, e
    ldh [rNR33], a
    ld a, d
    ldh [rNR34], a

jr_004_48e8:
    ret


Call_004_48e9:
    ld hl, $c08b
    add hl, bc
    ld a, [hl]
    bit 7, a
    jr nz, jr_004_48f8

    add e
    ld e, a
    ld a, d
    adc b
    ld d, a
    ret


jr_004_48f8:
    xor $ff
    ld h, a
    ld a, e
    sub h
    ld e, a
    ld a, d
    sbc b
    ld d, a
    ret


Call_004_4902:
    ld a, [$c02d]
    ld d, a
    bit 0, d
    jr nz, jr_004_4912

    ld a, $08
    ldh [rNR12], a
    swap a
    ldh [rNR14], a

jr_004_4912:
    bit 1, d
    jr nz, jr_004_491e

    swap a
    ldh [rNR22], a
    swap a
    ldh [rNR24], a

jr_004_491e:
    bit 3, d
    jr nz, jr_004_492a

    swap a
    ldh [rNR42], a
    swap a
    ldh [rNR44], a

jr_004_492a:
    bit 2, d
    jr nz, jr_004_4932

    ld a, $00
    ldh [rNR32], a

jr_004_4932:
    ret


Call_004_4933:
    ld hl, $c02e
    xor a
    add [hl]
    inc hl
    add [hl]
    inc hl
    add [hl]
    inc hl
    add [hl]
    or a
    ret nz

    ld a, $80
    ld [$c020], a
    ret


data_04_4946::
    db $9c, $c0, $a8, $c0, $b4, $c0, $c0, $c0, $00, $18, $30, $48, $60, $78, $90, $a8
    db $2c, $00, $9c, $00, $06, $01, $6b, $01, $c9, $01, $22, $02, $78, $02, $c6, $02
    db $12, $03, $58, $03, $9b, $03, $da, $03, $16, $04, $4e, $04, $83, $04, $b5, $04
    db $e5, $04, $11, $05, $3c, $05, $63, $05, $89, $05, $ac, $05, $cd, $05, $ed, $05
    db $0b, $06, $28, $06, $42, $06, $5b, $06, $72, $06, $89, $06, $9e, $06, $b2, $06
    db $c4, $06, $d6, $06, $e7, $06, $f6, $06, $05, $07, $14, $07, $21, $07, $2d, $07
    db $39, $07, $44, $07, $4f, $07, $59, $07, $62, $07, $6b, $07, $73, $07, $7b, $07
    db $83, $07, $8a, $07, $90, $07, $97, $07, $9d, $07, $a2, $07, $a7, $07, $ac, $07
    db $b1, $07, $b6, $07, $ba, $07, $be, $07, $c1, $07, $c5, $07, $c8, $07, $cb, $07
    db $ce, $07, $d1, $07, $d4, $07, $d6, $07, $d9, $07, $db, $07, $dd, $07, $df, $07
    db $e1, $07, $e3, $07, $e4, $07, $e5, $07, $e7, $07, $e8, $07, $ea, $07, $eb, $07
    db $ec, $07, $ed, $07, $ee, $07, $ef, $07, $f0, $07

data_04_4a00::
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $05, $05, $05
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05

data_04_4a1c::
    dw data_04_4a54
    dw data_04_4a55
    dw data_04_4a55
    dw data_04_4a55
    dw data_04_4a55
    dw data_04_4a55
    dw data_04_4a55
    dw data_04_4a55
    dw data_04_4a55
    dw data_04_4a55
    dw data_04_4a55
    dw data_04_4a55
    dw data_04_4a55
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0
    dw 0

data_04_4a54::
    db $00

data_04_4a55::
    db $00

data_04_4a56::
    db $00, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32
    db $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32
    db $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32
    db $32, $32, $32, $32, $32, $32, $32, $32

data_04_4a8e::
    dw data_04_4ac6
    dw data_04_4ad6
    dw data_04_4ae6
    dw data_04_4af6
    dw data_04_4b06
    dw data_04_4b16
    dw data_04_4b26
    dw data_04_4b36
    dw data_04_4c46
    dw data_04_4c56
    dw data_04_4c66
    dw data_04_4c76
    dw data_04_4c06
    dw data_04_4c16
    dw data_04_4c26
    dw data_04_4c36
    dw data_04_4bc6
    dw data_04_4bd6
    dw data_04_4be6
    dw data_04_4bf6
    dw data_04_4b86
    dw data_04_4b96
    dw data_04_4ba6
    dw data_04_4bb6
    dw data_04_4b46
    dw data_04_4b56
    dw data_04_4b66
    dw data_04_4b76

data_04_4ac6::
    db $79, $bd, $ff, $ff, $ff, $ff, $fd, $b9, $75, $31, $00, $00, $00, $00, $01, $35

data_04_4ad6::
    db $01, $12, $23, $34, $45, $56, $67, $77, $88, $99, $aa, $bb, $cc, $dd, $ee, $ff

data_04_4ae6::
    db $12, $23, $33, $44, $55, $66, $77, $77, $78, $89, $9a, $ab, $bb, $cc, $dd, $ee

data_04_4af6::
    db $22, $33, $34, $45, $55, $66, $77, $77, $78, $89, $99, $aa, $bb, $bc, $cd, $dd

data_04_4b06::
    db $33, $34, $44, $55, $56, $66, $77, $77, $78, $88, $99, $9a, $aa, $bb, $bc, $cc

data_04_4b16::
    db $7b, $ff, $ff, $fb, $73, $00, $00, $03, $7b, $ff, $ff, $fb, $73, $00, $00, $03

data_04_4b26::
    db $7b, $ef, $ff, $eb, $73, $00, $00, $03, $7b, $ef, $ff, $eb, $73, $00, $00, $03

data_04_4b36::
    db $7a, $df, $ff, $da, $74, $10, $00, $14, $7a, $df, $ff, $da, $74, $10, $00, $14

data_04_4b46::
    db $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $00, $00

data_04_4b56::
    db $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $11, $11

data_04_4b66::
    db $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $22, $22

data_04_4b76::
    db $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $33, $33

data_04_4b86::
    db $ee, $ee, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

data_04_4b96::
    db $dd, $dd, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11

data_04_4ba6::
    db $cc, $cc, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22

data_04_4bb6::
    db $bb, $bb, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33

data_04_4bc6::
    db $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $00, $00, $00, $00

data_04_4bd6::
    db $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $11, $11, $11, $11

data_04_4be6::
    db $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $22, $22, $22, $22

data_04_4bf6::
    db $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $33, $33, $33, $33

data_04_4c06::
    db $ee, $ee, $ee, $ee, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

data_04_4c16::
    db $dd, $dd, $dd, $dd, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11

data_04_4c26::
    db $cc, $cc, $cc, $cc, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22, $22

data_04_4c36::
    db $bb, $bb, $bb, $bb, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33, $33

data_04_4c46::
    db $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $00, $00, $00, $00, $00, $00, $00, $00

data_04_4c56::
    db $dd, $dd, $dd, $dd, $dd, $dd, $dd, $dd, $11, $11, $11, $11, $11, $11, $11, $11

data_04_4c66::
    db $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $22, $22, $22, $22, $22, $22, $22, $22

data_04_4c76::
    db $bb, $bb, $bb, $bb, $bb, $bb, $bb, $bb, $33, $33, $33, $33, $33, $33, $33, $33

data_04_4c86::
    dw data_04_4c9e
    dw data_04_4cdc
    dw data_04_4ca5
    dw data_04_4ce5
    dw data_04_4caf
    dw data_04_4cc1
    dw data_04_4cb7
    dw data_04_4cc9
    dw data_04_4cee
    dw data_04_4d23
    dw data_04_4d2c
    dw data_04_4d35

data_04_4c9e::
    db $88, $ed, $f2, $c0, $46, $63, $ff

data_04_4ca5::
    db $88, $00, $c2, $80, $06, $04, $06, $04, $04, $ff

data_04_4caf::
    db $88, $f7, $a1, $c0, $02, $01, $01, $ff

data_04_4cb7::
    db $88, $f7, $d1, $c0, $02, $01, $01, $01, $01, $ff

data_04_4cc1::
    db $80, $f7, $a1, $c0, $02, $01, $01, $ff

data_04_4cc9::
    db $08, $f7, $a1, $c0, $02, $01, $01, $ff, $88, $00, $b1, $80, $06, $06, $06, $06
    db $06, $06, $ff

data_04_4cdc::
    db $88, $00, $62, $80, $06, $04, $06, $04, $ff

data_04_4ce5::
    db $88, $00, $82, $80, $06, $04, $06, $04, $ff

data_04_4cee::
    db $88, $00, $b3, $80, $02, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
    db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
    db $01, $ff, $88, $ed, $b1, $c0, $50, $60, $46, $46, $46, $ff, $88, $ed, $b1, $c0
    db $60, $70, $56, $66, $ff

data_04_4d23::
    db $88, $00, $a2, $80, $06, $04, $06, $04, $ff

data_04_4d2c::
    db $88, $00, $42, $80, $06, $04, $06, $04, $ff

data_04_4d35::
    db $88, $00, $e2, $80, $06, $04, $06, $04, $ff

data_04_4d3e::
    dw data_04_4d5e
    dw data_04_4d61
    dw data_04_4d73
    dw data_04_4d8d
    dw data_04_4d94
    dw data_04_4e4a
    dw data_04_4e61
    dw data_04_4e6e
    dw data_04_4ed4
    dw data_04_4edc
    dw data_04_4ee4
    dw data_04_4ef0
    dw data_04_4efc
    dw data_04_4f02
    dw data_04_4f08
    dw data_04_4f29

data_04_4d5e::
    db $00, $80, $80

data_04_4d61::
    db $01, $01, $02, $02, $01, $01, $00, $00, $ff, $ff, $fe, $fe, $ff, $ff, $00, $00
    db $80, $80

data_04_4d73::
    db $01, $01, $01, $02, $02, $02, $01, $01, $01, $00, $00, $00, $ff, $ff, $ff, $fe
    db $fe, $fe, $ff, $ff, $ff, $00, $00, $00, $80, $80

data_04_4d8d::
    db $04, $03, $02, $01, $00, $80, $00

data_04_4d94::
    db $01, $02, $03, $02, $01, $ff, $fe, $fd, $fe, $ff, $fd, $fe, $ff, $fe, $fd, $fb
    db $fa, $f9, $fa, $fb, $f9, $fa, $fb, $fa, $f9, $f7, $f6, $f5, $f6, $f7, $f5, $f6
    db $f7, $f6, $f5, $f3, $f2, $f1, $f2, $f3, $f1, $f2, $f3, $f2, $f1, $ef, $ee, $ed
    db $ee, $ef, $ed, $ee, $ef, $ee, $ed, $eb, $ea, $e9, $ea, $eb, $e9, $ea, $eb, $ea
    db $e9, $e7, $e6, $e5, $e6, $e7, $e5, $e6, $e7, $e6, $e5, $e3, $e2, $e1, $e2, $e3
    db $e1, $e2, $e3, $e2, $e1, $df, $de, $dd, $de, $df, $dd, $de, $df, $de, $dd, $db
    db $da, $d9, $da, $db, $d9, $da, $db, $da, $d9, $d7, $d6, $d5, $d6, $d7, $d5, $d6
    db $d7, $d6, $d5, $d3, $d2, $d1, $d2, $d3, $d1, $d2, $d3, $d2, $d1, $cf, $ce, $cd
    db $ce, $cf, $cd, $ce, $cf, $ce, $cd, $cb, $ca, $c9, $ca, $cb, $c9, $ca, $cb, $ca
    db $c9, $c7, $c6, $c5, $c6, $c7, $c5, $c6, $c7, $c6, $c5, $c3, $c2, $c1, $c2, $c3
    db $c1, $c2, $c3, $c2, $c1, $bf, $be, $bd, $be, $bf, $bd, $be, $bf, $be, $bd, $bb
    db $ba, $b9, $ba, $bb, $80, $80

data_04_4e4a::
    db $01, $03, $05, $07, $09, $0b, $0d, $0f, $11, $13, $15, $13, $11, $0f, $0d, $0b
    db $09, $07, $05, $03, $01, $80, $80

data_04_4e61::
    db $ec, $ee, $f0, $f2, $f4, $f6, $f8, $fa, $fc, $fe, $00, $80, $00

data_04_4e6e::
    db $ff, $fe, $fd, $fc, $fb, $fa, $f9, $f8, $f7, $f6, $f5, $f4, $f3, $f2, $f1, $f0
    db $ef, $ee, $ed, $ec, $eb, $ea, $e9, $e8, $e7, $e6, $e5, $e4, $e3, $e2, $e1, $e0
    db $df, $de, $dd, $dc, $db, $da, $d9, $d8, $d7, $d6, $d5, $d4, $d3, $d2, $d1, $d0
    db $cf, $ce, $cd, $cc, $cb, $ca, $c9, $c8, $c7, $c6, $c5, $c4, $c3, $c2, $c1, $c0
    db $bf, $be, $bd, $bc, $bb, $ba, $b9, $b8, $b7, $b6, $b5, $b4, $b3, $b2, $b1, $b0
    db $af, $ae, $ad, $ac, $ab, $aa, $a9, $a8, $a7, $a6, $a5, $a4, $a3, $a2, $a1, $a0
    db $9f, $9e, $9d, $9c, $80, $80

data_04_4ed4::
    db $ec, $f0, $f4, $f8, $fc, $00, $80, $00

data_04_4edc::
    db $14, $10, $0c, $08, $04, $00, $80, $00

data_04_4ee4::
    db $02, $03, $03, $02, $00, $fe, $fd, $fd, $fe, $00, $80, $80

data_04_4ef0::
    db $ee, $f0, $f2, $f4, $f6, $f8, $fa, $fc, $fe, $00, $80, $00

data_04_4efc::
    db $f4, $f8, $fc, $00, $80, $00

data_04_4f02::
    db $0c, $08, $04, $00, $80, $00

data_04_4f08::
    db $00, $00, $00, $00, $00, $00, $f6, $ec, $e2, $d8, $ce, $c4, $ba, $b0, $a6, $9c
    db $92, $88, $7e, $74, $6a, $60, $56, $4c, $42, $38, $2e, $24, $1f, $1a, $15, $80
    db $00

data_04_4f29::
    db $fb, $f6, $f1, $ec, $e7, $e2, $dd, $d8, $d3, $ce, $c9, $c4, $bf, $ba, $b5, $b0
    db $ab, $a6, $a1, $9c, $97, $92, $8d, $88, $83, $7e, $79, $74, $6f, $6a, $65, $60
    db $5b, $56, $51, $4c, $47, $42, $3d, $38, $33, $2e, $29, $24, $1f, $80, $80
