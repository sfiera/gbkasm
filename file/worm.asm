; Disassembly of "gbkiss.gb"

INCLUDE "charmap.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

MACRO rcall
    rpush @+6
    rpush \1
    ret
ENDM

Header::
    ; Length of entirety of file
    dw End
    ; Flags for display in menu
    db kFileByte4 + kFileMarkerDiamond + kFileHasTransfers
    ; Must be $00 for normal files (other than Kiss Mail)
    db $00
    ; Length of variable parts of header
    db Points - @ - 1
    ; File owner code
    db $00

Title::
    db "WORM"

Points::
    dw $0001
Author::
    db "KEI KONDOH", 2
History::
    ds 11, $00
    ds 11, $00
    ds 11, $00

Main::
    jr jr_000_003c

    nop
    nop

jr_000_003c:
    ld sp, $e000
    trap $db
    trap $11
    rcall call_006c

jr_000_004a:
    rcall call_0070
    ld a, c
    cp $00
    jr nz, jr_000_005f
    rcall call_0157
    jr jr_000_004a

jr_000_005f:
    cp $01
    jr nz, jr_000_004a

    trap $11
    trap $01

call_0067:
    ld a, $0c
    trap $b9
    ret


call_006c:
    xor a
    trap $b3
    ret


call_0070:
    rcall call_0067
    rcall call_008d
    rcall call_00dc
    rcall call_0103
    ret


call_008d:
    ld hl, $0303
    trap $b8
    rpush data1
    pop hl
    trap $69

    ld hl, $0305
    trap $b8
    rpush data2
    pop hl
    trap $69

    ld hl, $0307
    trap $b8
    rpush data3
    pop hl
    trap $69

    ret

data1:
    db "QOOOOOOOOOOOO+\n"
data2:
    db "  W  O  R  M  \n"
data3:
    db "+OOOOOOOOOOOOQ\n"

call_00dc:
    ld hl, $050c
    trap $b8
    rpush data4
    pop hl
    trap $69
    ld hl, $050e
    trap $b8
    rpush data5
    pop hl
    trap $69
    ret


data4:
    db "GAME START\n"
data5:
    db "EXIT\n"


call_0103:
    ld bc, $0000

jr3:
    trap $b1
    ld e, $20
    rcall call_0149
    ldh a, [$8b]
    bit 6, a
    jr z, jr1
    ld a, c
    and a
    jr z, jr1
    dec c

jr1:
    ldh a, [$8b]
    bit 7, a
    jr z, jr2
    ld a, c
    cp $01
    jr z, jr2
    inc c

jr2:
    ld e, $3e
    rcall call_0149
    ld a, [$c752]
    inc a
    ld [$c752], a
    ldh a, [$8b]

    bit 0, a
    jr z, jr3
    ld a, [$a043]
    ld h, a
    ld a, [$c752]
    ld l, a
    trap $8d
    ret


call_0149:
    ld h, $03
    ld a, c
    sla a
    add $0c
    ld l, a
    trap $b8
    ld a, e
    trap $bb
    ret


call_0157:
    ld a, $00
    ld [$c753], a
    ld [$c748], a
    ld [$c754], a
    ld a, $00
    ld [$c749], a
    ld [$c74a], a
    ld [$c745], a
    ld [$c752], a
    ld [$c744], a
    rcall call_03b7
    rcall call_01fc
    rcall call_025c
    rcall call_027e
    rcall call_02ce
    ld a, $05
    trap $13

jr_000_019a:
    trap $b1
    rcall jr_000_0688
    rcall call_06ec
    rcall call_047b
    rcall call_0403
    rcall call_02ce
    rcall call_05fe
    rcall call_0613
    rcall call_0628
    rcall call_0675
    ld a, [$c748]
    cp $01
    jr nz, jr_000_019a

    xor a
    trap $13
    ld a, [$c754]
    cp $00
    jr z, jr_000_01f4

    rcall call_0352
    ret

jr_000_01f4:
    rcall call_02ed
    ret


call_01fc:
    rcall call_0067
    ld bc, $0000

jr_000_0206:
    ld h, c
    ld l, $00
    trap $b8
    ld a, $2d
    trap $bb
    ld l, $10
    trap $b8
    ld a, $2d
    trap $bb
    inc c
    ld a, c
    cp $14
    jr nz, jr_000_0206

    ld bc, $0000

jr_000_0220:
    ld l, c
    ld h, $00
    trap $b8
    ld a, $1c
    trap $bb
    ld h, $13
    trap $b8
    ld a, $1c
    trap $bb
    inc c
    ld a, c
    cp $10
    jr nz, jr_000_0220

    ld hl, $0000
    trap $b8
    ld a, $2b
    trap $bb
    ld hl, $1300
    trap $b8
    ld a, $2b
    trap $bb
    ld hl, $0010
    trap $b8
    ld a, $2b
    trap $bb
    ld hl, $1310
    trap $b8
    ld a, $2b
    trap $bb
    ret


call_025c:
    ld hl, $0811
    trap $b8
    rpush data10
    pop hl
    trap $69
    ld a, [$c749]
    ld e, a
    ld a, [$c74a]
    ld d, a
    ld hl, $c74b
    trap $a3
    ld hl, $c74d
    trap $69
    ret


data10:
    db "SC:\n"

call_027e:
    ld hl, $0011
    trap $b8
    rpush data6

jr_000_0286:
    pop hl
    trap $69
    ld a, [$a042]
    ld e, a
    ld a, [$a043]
    ld d, a
    ld hl, $c74b
    trap $a3
    ld hl, $c74d
    trap $69
    ret

data6:
    db "HI:\n"

call_02a0:
    ld a, [$c749]
    ld e, a
    ld a, [$c74a]
    ld d, a
    ld a, [$a042]
    ld l, a
    ld a, [$a043]
    ld h, a
    ld c, $06
    trap $84
    ld a, l
    cp $00
    ret z

updateHiScore:
    ld a, $0a
    ld [$0000], a
    ld a, [$c749]
    ld [$a042], a
    ld a, [$c74a]
    ld [$a043], a
    xor a
    ld [$0000], a
    ret


call_02ce:
    ld hl, $1011
    trap $b8
    rpush data14
    pop hl
    trap $69
    ld a, [$c744]
    ld e, a
    ld d, $00
    ld hl, $c74b
    trap $a3
    ld hl, $c74f
    trap $69
    ret


data14:
    db "P:\n"

call_02ed:
    ld hl, $0406
    trap $b8
    rpush data7

jr_000_02f5:
    pop hl
    trap $69
    ld hl, $0407
    trap $b8
    rpush data8
    pop hl
    trap $69
    ld hl, $0408
    trap $b8
    rpush data9
    pop hl
    trap $69
    ld hl, $0409
    trap $b8
    rpush data8
    pop hl
    trap $69
    ld hl, $040a
    trap $b8
    rpush data7
    pop hl
    trap $69

jr_000_0324:
    ldh a, [$8a]
    bit 0, a
    jr z, jr_000_0324

    ret


data7:
    db "+----------+\n"
data8:
    db "|          |\n"
data9:
    db "| GAMEOVER |\n"

call_0352:
    ld hl, $0406
    trap $b8
    rpush data11
    pop hl
    trap $69
    ld hl, $0407
    trap $b8
    rpush data12
    pop hl
    trap $69
    ld hl, $0408
    trap $b8
    rpush data13
    pop hl
    trap $69
    ld hl, $0409
    trap $b8
    rpush data12
    pop hl
    trap $69
    ld hl, $040a
    trap $b8
    rpush data11
    pop hl
    trap $69

jr_000_0389:
    ldh a, [$8a]
    bit 0, a
    jr z, jr_000_0389

jr_000_038f:
    ret


data11:
    db "+----------+\n"
data12:
    db "|          |\n"
data13:
    db "| PERFECT! |\n"

call_03b7:
    trap $8e

jr_000_03b9:
    sub $10
    jr nc, jr_000_03b9

    add $10
    ld hl, $c600

jr_000_03c2:
    inc a
    inc a

jr_000_03c4:
    ld [hl], a
    ld d, a

jr_000_03c6:
    trap $8e

jr_000_03c8:
    sub $0d
    jr nc, jr_000_03c8

    add $0d
    ld hl, $c650
    inc a
    inc a
    ld [hl], a
    ld e, a
    ld b, $00
    ld c, $01

jr_000_03d9:
    ld hl, $c600
    add hl, bc
    ld [hl], d
    ld hl, $c6a0
    add hl, bc
    ld [hl], d
    ld hl, $c650
    add hl, bc
    ld [hl], e
    ld hl, $c6f0
    add hl, bc
    ld [hl], e
    inc c
    ld a, c
    cp $50
    jr nz, jr_000_03d9

    ld a, $04
    ld [$c740], a
    ld a, $00
    ld [$c742], a

jr_000_03fd:
    ld a, $0a
    ld [$c741], a
    ret


call_0403:
    ld b, $00
    ld a, [$c740]
    ld c, a
    ld hl, $c600
    add hl, bc
    ld a, [hl]
    push af
    ld hl, $c650
    add hl, bc
    ld a, [hl]
    ld l, a
    pop af
    ld h, a
    trap $b8
    ld a, $2b
    trap $bb
    ld b, $00
    ld c, $01
    ld hl, $c600
    add hl, bc
    ld a, [hl]
    push af
    ld hl, $c650
    add hl, bc
    ld a, [hl]
    ld l, a
    pop af
    ld h, a
    trap $b8
    ld a, $4f
    trap $bb
    ld hl, $c600
    ld a, [hl]
    push af
    ld hl, $c650
    ld a, [hl]
    ld l, a
    pop af
    ld h, a
    trap $b8
    ld a, $51
    trap $bb
    ld hl, $c600
    ld a, [hl]
    ld b, a
    ld hl, $c6a0
    ld a, [hl]
    cp b
    jr nz, jr_000_0460

    ld hl, $c650
    ld a, [hl]
    ld b, a
    ld hl, $c6f0
    ld a, [hl]
    cp b
    jr nz, jr_000_0460

    ret


jr_000_0460:
    ld b, $00
    ld a, [$c740]
    ld c, a
    ld hl, $c6a0
    add hl, bc
    ld a, [hl]
    push af
    ld hl, $c6f0
    add hl, bc
    ld a, [hl]
    ld l, a
    pop af
    ld h, a
    trap $b8
    ld a, $20
    trap $bb
    ret


call_047b:
    ld b, $00
    ld c, $00

jr_000_047f:
    ld hl, $c600
    add hl, bc
    ld a, [hl]
    ld hl, $c6a0
    add hl, bc
    ld [hl], a
    ld hl, $c650
    add hl, bc
    ld a, [hl]
    ld hl, $c6f0
    add hl, bc
    ld [hl], a
    inc c
    ld a, c
    cp $50
    jr nz, jr_000_047f

    ldh a, [$8a]
    bit 5, a
    jr z, jr_000_04ad

    ld a, [$c742]
    cp $02
    jr z, jr_000_04e7

    ld a, $01
    ld [$c742], a
    jr jr_000_04e7

jr_000_04ad:
    ldh a, [$8a]
    bit 4, a
    jr z, jr_000_04c1

    ld a, [$c742]
    cp $01
    jr z, jr_000_04e7

    ld a, $02
    ld [$c742], a
    jr jr_000_04e7

jr_000_04c1:
    ldh a, [$8a]
    bit 6, a
    jr z, jr_000_04d5

    ld a, [$c742]
    cp $04
    jr z, jr_000_04e7

    ld a, $03
    ld [$c742], a
    jr jr_000_04e7

jr_000_04d5:
    ldh a, [$8a]
    bit 7, a
    jr z, jr_000_04e7

    ld a, [$c742]
    cp $03
    jr z, jr_000_04e7

    ld a, $04
    ld [$c742], a

jr_000_04e7:
    ld a, [$c741]
    dec a
    ld [$c741], a
    cp $00
    ret nz

    ld a, $0a
    ld [$c741], a
    ld a, [$c742]
    cp $01
    jr nz, jr_000_0507

    ld hl, $c600
    ld a, [hl]
    cp $00
    jr z, jr_000_0507

    dec a
    ld [hl], a

jr_000_0507:
    ld a, [$c742]
    cp $02
    jr nz, jr_000_0518

    ld hl, $c600
    ld a, [hl]
    cp $13
    jr z, jr_000_0518

    inc a
    ld [hl], a

jr_000_0518:
    ld a, [$c742]
    cp $03
    jr nz, jr_000_0529

    ld hl, $c650
    ld a, [hl]
    cp $00
    jr z, jr_000_0529

    dec a
    ld [hl], a

jr_000_0529:
    ld a, [$c742]
    cp $04
    jr nz, jr_000_053a

    ld hl, $c650
    ld a, [hl]
    cp $10
    jr z, jr_000_053a

    inc a
    ld [hl], a

jr_000_053a:
    ld a, [$c742]
    cp $00
    ret z

    ld hl, $c600
    ld a, [hl]
    ld b, a
    ld hl, $c6a0
    ld a, [hl]
    cp b
    jr nz, jr_000_0559

    ld hl, $c650
    ld a, [hl]
    ld b, a
    ld hl, $c6f0
    ld a, [hl]
    cp b
    jr nz, jr_000_0559

    ret


jr_000_0559:
    ld bc, $0000

jr_000_055c:
    ld hl, $c6a0
    add hl, bc
    ld a, [hl]
    ld hl, $c600
    inc c
    add hl, bc
    dec c
    ld [hl], a
    ld hl, $c6f0
    add hl, bc
    ld a, [hl]
    ld hl, $c650
    inc c
    add hl, bc
    dec c
    ld [hl], a
    inc c
    ld a, c
    cp $4f
    jr nz, jr_000_055c

    ret


call_057b:
    ld c, $01
    ld hl, $c600
    ld a, [hl]
    cp $00
    ret z

    cp $13
    ret z

    ld hl, $c650
    ld a, [hl]
    cp $00
    ret z

    cp $10
    ret z

    ld c, $00
    ret


call_0594:
    ld hl, $c600
    ld a, [hl]
    ld b, a
    ld hl, $c6a0
    ld a, [hl]
    cp b
    jr nz, jr_000_05af

    ld hl, $c650
    ld a, [hl]
    ld b, a
    ld hl, $c6f0
    ld a, [hl]
    cp b
    jr nz, jr_000_05af

    ld c, $00
    ret


jr_000_05af:
    ld hl, $c600
    ld a, [hl]
    ld d, a
    ld hl, $c650
    ld a, [hl]
    ld e, a
    ld b, $00
    ld c, $01

jr_000_05bd:
    ld hl, $c600
    add hl, bc
    ld a, [hl]
    cp d
    jr nz, jr_000_05d0

    ld hl, $c650
    add hl, bc
    ld a, [hl]
    cp e
    jr nz, jr_000_05d0

    ld c, $01
    ret


jr_000_05d0:
    inc c
    push bc
    ld a, [$c740]
    inc a
    ld b, a
    ld a, c
    cp b
    pop bc
    jr nz, jr_000_05bd

    ld c, $00
    ret


call_05df:
    ld a, [$c753]
    cp $01
    ret nz

    ld c, $00
    ld hl, $c600
    ld a, [hl]
    ld b, a
    ld a, [$c746]
    cp b
    ret nz

    ld hl, $c650
    ld a, [hl]
    ld b, a
    ld a, [$c747]
    cp b
    ret nz

    ld c, $01
    ret


call_05fe:
    rcall call_057b
    ld a, c
    cp $00
    ret z

    ld a, $03
    trap $14
    ld a, $01
    ld [$c748], a
    ret


call_0613:
    rcall call_0594
    ld a, c
    cp $00
    ret z

    ld a, $04
    trap $14
    ld a, $01
    ld [$c748], a
    ret


call_0628:
    rcall call_05df
    ld a, c
    cp $00
    ret z

    ld a, $05
    trap $14
    ld a, $00
    ld [$c753], a
    ld a, [$c740]
    cp $50
    jr z, jr_000_0647

    inc a
    ld [$c740], a

jr_000_0647:
    ld a, [$c749]
    ld e, a
    ld a, [$c74a]
    ld d, a
    ld h, $00
    ld a, [$c744]
    ld l, a
    trap $87
    ld a, l
    ld [$c749], a
    ld a, h
    ld [$c74a], a
    rcall call_025c
    rcall call_02a0
    rcall call_027e
    ret


call_0675:
    ld a, [$c740]
    cp $50
    ret nz

    ld a, $06
    trap $14
    ld a, $01
    ld [$c748], a
    ld [$c754], a
    ret


jr_000_0688:
    ld a, [$c753]
    cp $01
    ret z

    trap $8e

jr_000_0690:
    sub $10
    jr nc, jr_000_0690

    add $10
    inc a
    inc a
    ld [$c746], a
    trap $8e

jr_000_069d:
    sub $0d
    jr nc, jr_000_069d

    add $0d
    inc a
    inc a
    ld [$c747], a
    ld a, $01
    ld [$c753], a
    ld b, $00
    ld c, $00

jr_000_06b1:
    ld a, [$c746]
    ld d, a
    ld hl, $c600
    add hl, bc
    ld a, [hl]
    cp d
    jr nz, jr_000_06d0

    ld a, [$c747]
    ld e, a
    ld hl, $c650
    add hl, bc
    ld a, [hl]
    cp e
    jr nz, jr_000_06d0

    ld a, $00
    ld [$c753], a
    jr jr_000_0688

jr_000_06d0:
    inc c
    push bc
    ld a, [$c740]
    ld b, a
    ld a, c
    cp b
    pop bc
    jr nz, jr_000_06b1

    ld a, [$c744]
    cp $05
    jr z, jr_000_06e6

    inc a
    ld [$c744], a

jr_000_06e6:
    ld a, $28
    ld [$c745], a
    ret


call_06ec:
    ld a, [$c753]
    cp $00
    ret z

    ld a, [$c746]
    ld h, a
    ld a, [$c747]
    ld l, a
    trap $b8
    ld a, $2a
    trap $bb
    ld a, [$c741]
    cp $01
    ret nz

    ld a, [$c745]
    cp $00
    jr z, jr_000_0712

    dec a
    ld [$c745], a
    ret


jr_000_0712:
    ld a, $00
    ld [$c744], a
    ret

End:
