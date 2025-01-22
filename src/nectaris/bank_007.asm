; Disassembly of "Nectaris GB (Japan) (SGB Enhanced).gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "nectaris/audio.inc"
INCLUDE "nectaris/map.inc"
INCLUDE "nectaris/text.inc"

SECTION "nectaris/bank_007: ROM Bank $007", ROMX

Chars::
    db " 0123456789=####################ABCDEFGHIJKLMNOPQRSTUVWXYZ[]    "
    db " ｧｨｩｪｫｬｭｮｯｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜｦﾝｰﾟﾞ_    "

WindowMainMenuKiss::
    db $01, $04, $12, $09
    db $05, $04, "MAIN MENU", $ff
    db $04, $06, " CONTINUE", $ff
    db $04, $08, " PLAY NEWGAME", $ff
    db $04, $0a, " CONSTRUCTION", $ff
    db $04, $0c, " GB KISS", $ff
    db $ff

WindowMainMenu::
    db $01, $05, $12, $07
    db $05, $05, "MAIN MENU", $ff
    db $04, $07, " CONTINUE", $ff
    db $04, $09, " PLAY NEWGAME", $ff
    db $04, $0b, " CONSTRUCTION", $ff
    db $ff

WindowMainMenuKissQuickStart::
    db $01, $03, $12, $0b
    db $05, $03, "MAIN MENU", $ff
    db $04, $05, " CONTINUE", $ff
    db $04, $07, " PLAY NEWGAME", $ff
    db $04, $09, " CONSTRUCTION", $ff
    db $04, $0b, " GB KISS", $ff
    db $04, $0d, " QUICK START", $ff
    db $ff

WindowMainMenuQuickStart::
    db $01, $04, $12, $09
    db $05, $04, "MAIN MENU", $ff
    db $04, $06, " CONTINUE", $ff
    db $04, $08, " PLAY NEWGAME", $ff
    db $04, $0a, " CONSTRUCTION", $ff
    db $04, $0c, " QUICK START", $ff
    db $ff

WindowContinue::
    db $01, $05, $12, $05
    db $06, $05, "CONTINUE", $ff
    db $04, $07, " LOAD DATA", $ff
    db $04, $09, " PASSWORD", $ff
    db $ff

WindowNewGame::
    db $01, $05, $12, $07
    db $04, $05, "PLAY NEWGAME", $ff
    db $04, $07, " STORY MAP", $ff
    db $04, $09, " LEGEND MAP", $ff
    db $04, $0b, " CAMPAIGN MAP", $ff
    db $ff

WindowKiss::
    db $01, $02, $12, $0b
    db $05, $02, " GB KISS ", $ff
    db $04, $04, " ﾃﾞｰﾀｦｵｸﾙ", $ff
    db $04, $06, " ﾃﾞｰﾀｦﾓﾗｳ", $ff
    db $04, $08, " ﾊﾟｿｺﾝﾆｵｸﾙ", $ff
    db $04, $0a, " ﾊﾟｿｺﾝｶﾗﾓﾗｳ", $ff
    db $04, $0c, " KISS MENU", $ff
    db $ff

WindowConstruction::
    db $01, $04, $12, $07
    db $04, $04, "CONSTRUCTION", $ff
    db $04, $06, " NEW EDIT MAP", $ff
    db $04, $08, " LOAD EDIT MAP", $ff
    db $04, $0a, " PLAY EDIT MAP", $ff
    db $ff

WindowQuickStart::
    db $01, $05, $12, $07
    db $04, $05, "QUICK START", $ff
    db $04, $07, " 1PLAY MODE", $ff
    db $04, $09, " 2PLAY MODE", $ff
    db $04, $0b, " GUICY MODE", $ff
    db $ff

WindowCampaign::
    db $01, $05, $12, $05
    db $06, $05, "CAMPAIGN", $ff
    db $04, $07, " WINNERS", $ff
    db $04, $09, " SPWINNERS", $ff
    db $ff

WindowInGame::
    db $01, $03, $12, $07
    db $04, $03, $ff
    db $04, $05, " DATA SAVE", $ff
    db $04, $07, " GIVE UP", $ff
    db $04, $09, " RETURN GAME", $ff
    db $ff

WindowInGameNoSave::
    db $01, $05, $12, $05
    db $04, $03, $ff
    db $04, $07, " GIVE UP", $ff
    db $04, $09, " RETURN GAME", $ff
    db $ff

WindowTransferToGB::
    db $01, $05, $12, $07
    db $02, $03, " ﾂｳｼﾝｼﾞｭﾝﾋﾞﾁｭｳ ", $ff
    db $02, $07, " ｹﾞｰﾑﾎﾞｰｲﾄﾞｳｼｦ", $ff
    db $02, $09, " ｸｯﾂｹﾃ Aﾎﾞﾀﾝｦ ", $ff
    db $02, $0b, " ｵｼﾃｸﾀﾞｻｲ", $ff
    db $ff

WindowTransferToPC::
    db $01, $05, $12, $07
    db $02, $03, " ﾂｳｼﾝｼﾞｭﾝﾋﾞﾁｭｳ ", $ff
    db $02, $07, " GB KISS LINKﾆ", $ff
    db $02, $09, " ｹﾞｰﾑﾎﾞｰｲｦｸｯﾂｹﾃ", $ff
    db $02, $0b, " Aﾎﾞﾀﾝｦｵｼﾃｸﾀﾞｻｲ", $ff
    db $ff

WindowSending::
    db $01, $06, $12, $05
    db $02, $04, " ﾃﾞｰﾀｦ ｵｸｯﾃｲﾏｽ ", $ff
    db $02, $08, "ﾁｭｳｼｽﾙﾊﾞｱｲﾊ", $ff
    db $02, $0a, "Bﾎﾞﾀﾝｦ ｵｼﾃｸﾀﾞｻｲ", $ff
    db $ff

WindowReceiving::
    db $01, $06, $12, $05
    db $02, $04, " ﾃﾞｰﾀｦ ｳｹﾄｯﾃｲﾏｽ ", $ff
    db $02, $08, "ﾁｭｳｼｽﾙﾊﾞｱｲﾊ", $ff
    db $02, $0a, "Bﾎﾞﾀﾝｦ ｵｼﾃｸﾀﾞｻｲ", $ff
    db $ff

WindowCommSuccess::
    db $01, $06, $12, $03
    db $02, $06, $ff
    db $03, $08, "ﾂｳｼﾝｶﾞ ｵﾜﾘﾏｼﾀ", $ff
    db $ff

WindowCommFailed::
    db $00, $05, $14, $05
    db $02, $05, $ff
    db $01, $07, "ﾂｳｼﾝｦ ｼｯﾊﾟｲ ｼﾏｼﾀ", $ff
    db $01, $09, "ﾓｳｲﾁﾄﾞ ﾔﾘﾅｵｼﾃｸﾀﾞｻｲ", $ff
    db $ff

Call_007_44a5::
    ld a, $00
    ld [$d878], a
    ld [$d879], a
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call ShowWindow
    call Call_007_4598

Jump_007_44bb:
jr_007_44bb:
    call Call_007_4598
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_44df

    bit BTN_B_F, a
    jp nz, Jump_007_44f4

    bit BTN_UP_F, a
    jp nz, Jump_007_4509

    bit BTN_DN_F, a
    jp nz, Jump_007_4528

    call Call_000_085d
    jr jr_007_44bb

Jump_007_44df:
    ld a, SND_MENU_ACCEPT
    call PlaySound

Jump_007_44e4:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_44e4

    ld a, $00
    ret


Jump_007_44f4:
    ld a, SND_MENU_CANCEL
    call PlaySound

Jump_007_44f9:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_B_F, a
    jp nz, Jump_007_44f9

    ld a, $ff
    ret


Jump_007_4509:
    ld a, [$d8df]
    cp $00
    jr z, jr_007_44bb

    dec a
    ld [$d8df], a
    ld a, SND_MENU_NAV
    call PlaySound

jr_007_4519:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_UP_F, a
    jr nz, jr_007_4519

    jp Jump_007_44bb


Jump_007_4528:
    ld a, [$d8be]
    dec a
    ld b, a
    ld a, [$d8df]
    cp b
    jr z, jr_007_44bb

    inc a
    ld [$d8df], a
    ld a, SND_MENU_NAV
    call PlaySound

jr_007_453c:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_DN_F, a
    jr nz, jr_007_453c

    jp Jump_007_44bb


Call_007_454b::
    call Call_000_0933
    ld a, [$d8e0]
    ld l, a
    ld a, [$d8e1]
    ld h, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld e, a
    ld a, b
    cp $ff
    jr z, jr_007_4566

    call Call_007_603a

jr_007_4566:
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    call Call_007_6109
    ld a, $00
    ld [$d8be], a
    ld de, $d8bf

jr_007_4575:
    ld a, [hl+]
    cp $ff
    jr z, jr_007_4594

    ld b, a
    dec a
    ld [de], a
    inc de
    ld a, [hl+]
    ld c, a
    ld [de], a
    inc de
    push af
    push bc
    push de
    call Call_007_6109
    pop de
    pop bc
    pop af
    ld a, [$d8be]
    inc a
    ld [$d8be], a
    jr jr_007_4575

jr_007_4594:
    call Call_000_0abb
    ret


Call_007_4598:
    ld a, [$d8df]
    sla a
    ld hl, $d8bf
    call AddAToHL
    ld a, [hl+]
    sla a
    sla a
    sla a
    add $08
    ld d, a
    ld a, [hl]
    sla a
    sla a
    sla a
    add $10
    ld e, a
    ld a, $00
    ld c, $7f
    call Call_000_08ff
    ret


Call_007_45bf::
    ld a, $00
    ld [$d8e9], a
    ld [$d8ea], a
    call Call_000_0eee

Jump_007_45ca:
jr_007_45ca:
    call Call_007_4909
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_45f3

    bit BTN_B_F, a
    jp nz, Jump_007_4643

    bit BTN_SEL_F, a
    jp nz, Jump_007_4658

    bit BTN_UP_F, a
    jp nz, Jump_007_46db

    bit BTN_DN_F, a
    jp nz, Jump_007_4716

    call Call_000_085d
    jr jr_007_45ca

Jump_007_45f3:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_45f3

    ld a, [$d8e8]
    cp $00
    jr z, jr_007_462a

    ld a, SND_MENU_ACCEPT
    call PlaySound
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    inc a
    call Call_007_6ac0
    cp $00
    jp nz, Jump_007_4640

    call Call_007_4952
    cp $00
    jr z, jr_007_4640

    call Call_000_0eee
    jp Jump_007_45ca


jr_007_462a:
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    inc a
    call Call_007_6ac0
    cp $00
    jp nz, Jump_007_45ca

    ld a, SND_MENU_ACCEPT
    call PlaySound

Jump_007_4640:
jr_007_4640:
    ld a, $00
    ret


Jump_007_4643:
    ld a, SND_MENU_CANCEL
    call PlaySound

Jump_007_4648:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_B_F, a
    jp nz, Jump_007_4648

    ld a, $ff
    ret


Jump_007_4658:
    ld a, [$d8e8]
    cp $01
    jp z, Jump_007_45ca

    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    inc a
    call Call_007_6ac0
    cp $00
    jp nz, Jump_007_46d3

    ld a, [$d7a8]
    push af
    ld a, SND_MENU_ACCEPT
    call PlaySound
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    inc a
    call Call_007_6a12
    call Call_000_1244
    ld a, [$d7a8]
    cp $04
    jr nc, jr_007_469c

    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    inc a
    call Call_007_6a12

jr_007_469c:
    pop af
    ld [$d7a8], a
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    ld a, $05
    ld [$d79f], a
    ld [$d7a0], a
    call Call_000_1224

Jump_007_46b3:
    ld a, $00
    ld [$d7a1], a
    call Call_000_1610
    cp $00
    jp z, Jump_007_45f3

    cp $01
    jp nz, Jump_007_46b3

    ld a, SND_MENU_CANCEL
    call PlaySound
    call Call_000_0de7
    call Call_000_0eee
    jp Jump_007_45ca


Jump_007_46d3:
    ld a, SND_PASS_MISMATCH
    call PlaySound
    jp Jump_007_45ca


Jump_007_46db:
    ld a, [$d8e9]
    cp $00
    jr nz, jr_007_46fe

    ld a, [$d8ea]
    cp $00
    jp z, Jump_007_45ca

    sub $03
    ld [$d8ea], a
    call Call_000_0eee
    ld a, $02
    ld [$d8e9], a
    ld a, SND_MENU_NAV
    call PlaySound
    jr jr_007_4707

jr_007_46fe:
    dec a
    ld [$d8e9], a
    ld a, SND_MENU_NAV
    call PlaySound

jr_007_4707:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_UP_F, a
    jr nz, jr_007_4707

    jp Jump_007_45ca


Jump_007_4716:
    ld a, [$d8e9]
    cp $02
    jr nz, jr_007_4739

    ld a, [$d8ea]
    cp $03
    jp z, Jump_007_45ca

    add $03
    ld [$d8ea], a
    call Call_000_0eee
    ld a, $00
    ld [$d8e9], a
    ld a, SND_MENU_NAV
    call PlaySound
    jr jr_007_4742

jr_007_4739:
    inc a
    ld [$d8e9], a
    ld a, SND_MENU_NAV
    call PlaySound

jr_007_4742:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_DN_F, a
    jr nz, jr_007_4742

    jp Jump_007_45ca

StrNoData:
    db "NO DATA", $ff
StrStoryMode:
    db "STORY MODE", $ff
StrLegendMode:
    db "LEGEND MODE", $ff
StrCampaignMode:
    db "CAMPAIGN MODE", $ff
StrConstructionMode:
    db "CONSTRUCTION MODE", $ff
StrConstructionData:
    db "CONSTRUCTION DATA", $ff
StrFumei:
    db "FUMEI", $ff
StrBrackets:
    db "[      ]", $ff
StrMapTurn:
    db "MAP[55] TURN[55]", $ff

Call_007_47c2::
    call Call_000_0933
    ld a, [$d8ea]
    ld c, a
    ld b, $00

Jump_007_47cb:
jr_007_47cb:
    push bc
    ld a, c

jr_007_47cd:
    inc a
    call Call_007_6ac0
    cp $00
    jr z, jr_007_47ee

    pop bc
    push bc
    call Call_007_48b5
    ld a, b
    sla a
    ld b, a
    sla a
    add b
    inc a

jr_007_47e2:
    ld c, a
    ld b, $02
    ld hl, StrNoData
    call Call_007_6109
    jp Jump_007_48a8


jr_007_47ee:
    pop bc
    push bc
    pop bc
    push bc
    call Call_007_48b5
    ld a, b
    sla a
    ld b, a
    sla a
    add b
    inc a
    ld c, a
    ld b, $02
    ld a, [$d8f2]
    ld hl, StrStoryMode
    cp $00
    jr z, jr_007_4829

    ld hl, StrLegendMode
    cp $01
    jr z, jr_007_4829

    ld hl, StrCampaignMode
    cp $02
    jr z, jr_007_4829

    ld hl, StrConstructionMode
    cp $03
    jr z, jr_007_4829

    ld hl, StrConstructionData
    cp $04
    jr z, jr_007_4829

    ld hl, StrFumei

jr_007_4829:
    push bc
    call Call_007_6109
    pop bc
    inc c
    ld hl, StrBrackets
    push bc
    call Call_007_6109
    pop bc
    ld hl, $d8f3
    ld a, $ff
    ld [$d8f9], a
    push bc
    inc b
    call Call_007_6109
    pop bc
    ld a, [$d8f2]
    cp $04
    jp z, Jump_007_48a8

    inc c
    ld hl, StrMapTurn
    push bc
    call Call_007_6109
    pop bc
    ld a, b
    add $04
    ld b, a
    ld a, [$d8f1]
    ld e, a
    ld a, [$d8f2]
    cp $00
    jr z, jr_007_487d

    push af
    ld a, e
    sub $10
    ld e, a
    pop af
    cp $01
    jr z, jr_007_487d

    push af
    ld a, e
    sub $10
    ld e, a
    pop af
    cp $02
    jr z, jr_007_4892

    cp $03
    jr z, jr_007_4892

jr_007_487d:
    ld a, [$d8f2]
    cp $00
    jr z, jr_007_488a

    cp $01
    jr z, jr_007_488a

    jr z, jr_007_4892

jr_007_488a:
    ld a, e
    cp $10
    jr c, jr_007_4892

    sub $4c
    ld e, a

jr_007_4892:
    inc e
    ld d, $02
    push bc
    call Call_007_614d
    pop bc
    ld a, b
    add $09
    ld b, a
    ld a, [$d8fc]
    inc a
    ld e, a
    ld d, $02
    call Call_007_614d

Jump_007_48a8:
    pop bc
    inc c
    inc b
    ld a, b
    cp $03
    jp nz, Jump_007_47cb

    call Call_000_0abb
    ret


Call_007_48b5:
    push bc
    ld a, b
    sla a
    ld b, a
    sla a
    add b
    ld c, a
    ld b, $01
    ld d, $13
    ld e, $04
    call Call_007_603a
    pop bc
    push bc
    ld d, $02
    ld e, c
    ld a, b
    sla a
    ld b, a
    sla a
    add b
    inc a
    inc a
    inc a
    inc a
    ld c, a
    ld b, $11
    call Call_007_614d
    pop bc
    ret


    push bc
    ld a, b
    sla a
    ld b, a
    sla a
    add b
    ld c, a
    ld b, $01
    ld d, $13
    ld e, $04
    call Call_007_607f
    pop bc
    push bc
    ld d, $02
    ld e, c
    ld a, b
    sla a
    ld b, a
    sla a
    add b
    inc a
    inc a

jr_007_48ff:
    inc a
    inc a
    ld c, a
    ld b, $11
    call Call_007_614d
    pop bc
    ret


Call_007_4909:
    ld a, [$d8e9]
    sla a
    ld e, a
    sla a
    add e
    sla a
    sla a
    sla a
    add $20
    ld e, a
    ld d, $0b
    ld a, $01
    ld c, $1e
    push de
    call Call_000_08ff
    pop de
    ld a, e
    add $08
    ld e, a
    ld a, $02
    ld c, $1f
    call Call_000_08ff
    ret


data_007_4932:
    db "ｵｰﾊﾞｰﾗｲﾄｼﾃｲｲﾃﾞｽｶ", $ff
data_007_4943:
    db "  ﾊｲ A   ｲｲｴ B", $ff

Call_007_4952:
    ld a, $00
    ld [$d8ff], a
    ld b, $01
    ld c, $05
    ld d, $12
    ld e, $05
    call Call_007_603a
    ld b, $02
    ld c, $07
    ld hl, data_007_4932
    call Call_007_6109
    ld b, $02
    ld c, $09
    ld hl, data_007_4943
    call Call_007_6109
    call Call_000_0abb

jr_007_4979:
    call Call_007_49bd
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_4993

    bit BTN_B_F, a
    jp nz, Jump_007_49a8

    call Call_000_085d
    jr jr_007_4979

Jump_007_4993:
jr_007_4993:
    ld a, SND_MENU_ACCEPT
    call PlaySound

Jump_007_4998:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_4998

    ld a, $00
    ret


Jump_007_49a8:
    ld a, SND_MENU_CANCEL
    call PlaySound

Jump_007_49ad:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_B_F, a
    jp nz, Jump_007_49ad

    ld a, $ff
    ret


Call_007_49bd:
    ld d, $00
    ld e, $00
    ld a, $00
    ld c, $7f
    call Call_000_08ff
    ret


Call_007_49c9::
    ld a, $00
    ld [$d8e9], a
    ld [$d8ea], a
    call Call_000_0f36

Jump_007_49d4:
jr_007_49d4:
    call Call_007_4d17
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_49fd

    bit BTN_B_F, a
    jp nz, Jump_007_4a79

    bit BTN_SEL_F, a
    jp nz, Jump_007_4a8e

    bit BTN_UP_F, a
    jp nz, Jump_007_4b42

    bit BTN_DN_F, a
    jp nz, Jump_007_4b7d

    call Call_000_085d
    jr jr_007_49d4

Jump_007_49fd:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_49fd

    ld a, [$d8e8]
    cp $00
    jr z, jr_007_4a36

    ld a, SND_MENU_ACCEPT
    call PlaySound
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    inc a
    add $06
    call Call_007_6ac0
    cp $00
    jp nz, Jump_007_4a76

    call Call_007_4952
    cp $00
    jr z, jr_007_4a76

    call Call_000_0f36
    jp Jump_007_49d4


jr_007_4a36:
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    inc a
    add $06
    call Call_007_6ac0
    cp $00
    jp nz, Jump_007_49d4

    ld a, [$d7a8]
    cp $02
    jr nc, jr_007_4a5f

    ld a, [$d8f2]
    cp $02
    jr c, jr_007_4a71

    ld a, SND_PASS_MISMATCH
    call PlaySound
    jp Jump_007_49d4


jr_007_4a5f:
    ld a, [$d7a8]
    ld b, a
    ld a, [$d8f2]
    cp b
    jr z, jr_007_4a71

    ld a, SND_PASS_MISMATCH
    call PlaySound
    jp Jump_007_49d4


jr_007_4a71:
    ld a, SND_MENU_ACCEPT
    call PlaySound

Jump_007_4a76:
jr_007_4a76:
    ld a, $00
    ret


Jump_007_4a79:
    ld a, SND_MENU_CANCEL
    call PlaySound

Jump_007_4a7e:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_B_F, a
    jp nz, Jump_007_4a7e

    ld a, $ff
    ret


Jump_007_4a8e:
    ld a, [$d8e8]
    cp $01
    jp z, Jump_007_49d4

    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    inc a
    add $06
    call Call_007_6ac0
    cp $00
    jp nz, Jump_007_4b2d

    ld a, [$d7a8]
    cp $02
    jr nc, jr_007_4aba

    ld a, [$d8f2]
    cp $02
    jr c, jr_007_4ac7

    jp Jump_007_4b2d


jr_007_4aba:
    ld a, [$d7a8]
    ld b, a
    ld a, [$d8f2]
    cp b
    jr z, jr_007_4ac7

    jp Jump_007_4b2d


jr_007_4ac7:
    ld a, [$d7a8]
    push af
    ld a, SND_MENU_ACCEPT
    call PlaySound
    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    inc a
    add $06
    call Call_007_6a12
    call Call_000_1244
    ld a, [$d7a8]
    cp $03
    jr c, jr_007_4af6

    ld a, [$d8e9]
    ld b, a
    ld a, [$d8ea]
    add b
    inc a
    add $06
    call Call_007_6a12

jr_007_4af6:
    pop af
    ld [$d7a8], a
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    ld a, $05
    ld [$d79f], a
    ld [$d7a0], a
    call Call_000_1224

Jump_007_4b0d:
    ld a, $00
    ld [$d7a1], a
    call Call_000_1610
    cp $00
    jp z, Jump_007_49fd

    cp $01
    jp nz, Jump_007_4b0d

    ld a, SND_MENU_CANCEL
    call PlaySound
    call Call_000_0de7
    call Call_000_0f36
    jp Jump_007_49d4


Jump_007_4b2d:
    ld a, SND_PASS_MISMATCH
    call PlaySound

Jump_007_4b32:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_SEL_F, a
    jp nz, Jump_007_4b32

    jp Jump_007_49d4


Jump_007_4b42:
    ld a, [$d8e9]
    cp $00
    jr nz, jr_007_4b65

    ld a, [$d8ea]
    cp $00
    jp z, Jump_007_49d4

    sub $03
    ld [$d8ea], a
    call Call_000_0f36
    ld a, $02
    ld [$d8e9], a
    ld a, SND_MENU_NAV
    call PlaySound
    jr jr_007_4b6e

jr_007_4b65:
    dec a
    ld [$d8e9], a
    ld a, SND_MENU_NAV
    call PlaySound

jr_007_4b6e:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_UP_F, a
    jr nz, jr_007_4b6e

    jp Jump_007_49d4


Jump_007_4b7d:
    ld a, [$d8e9]
    cp $02
    jr nz, jr_007_4ba0

    ld a, [$d8ea]
    cp $03
    jp z, Jump_007_49d4

    add $03
    ld [$d8ea], a
    call Call_000_0f36
    ld a, $00
    ld [$d8e9], a
    ld a, SND_MENU_NAV
    call PlaySound
    jr jr_007_4ba9

jr_007_4ba0:
    inc a
    ld [$d8e9], a
    ld a, SND_MENU_NAV
    call PlaySound

jr_007_4ba9:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_DN_F, a
    jr nz, jr_007_4ba9

    jp Jump_007_49d4


Call_007_4bb8::
    call Call_000_0933
    ld a, [$d8ea]
    add $06
    ld c, a
    ld b, $00

Jump_007_4bc3:
    push bc
    ld a, c
    inc a
    call Call_007_6ac0
    cp $00
    jr z, jr_007_4bf2

    pop bc
    push bc
    ld a, [$d8e8]
    cp $00
    jr nz, jr_007_4bdb

    call Call_007_4cbb
    jr jr_007_4bde

jr_007_4bdb:
    call Call_007_4ce9

jr_007_4bde:
    ld a, b
    sla a
    ld b, a
    sla a
    add b
    inc a
    ld c, a
    ld b, $02
    ld hl, StrNoData
    call Call_007_6109
    jp Jump_007_4cae


jr_007_4bf2:
    pop bc
    push bc
    ld a, [$d8f2]
    ld c, a
    ld a, [$d7a8]
    cp $01
    jr nz, jr_007_4c01

    ld a, $00

jr_007_4c01:
    cp c
    jr nz, jr_007_4c0b

    pop bc
    push bc
    call Call_007_4cbb
    jr jr_007_4c10

jr_007_4c0b:
    pop bc
    push bc
    call Call_007_4ce9

jr_007_4c10:
    ld a, b
    sla a
    ld b, a
    sla a
    add b
    inc a
    ld c, a
    ld b, $02
    ld a, [$d8f2]
    ld hl, StrStoryMode
    cp $00
    jr z, jr_007_4c44

    ld hl, StrLegendMode
    cp $01
    jr z, jr_007_4c44

    ld hl, StrCampaignMode
    cp $02
    jr z, jr_007_4c44

    ld hl, StrConstructionMode
    cp $03
    jr z, jr_007_4c44

    ld hl, StrConstructionData
    cp $04
    jr z, jr_007_4c44

    ld hl, StrFumei

jr_007_4c44:
    push bc
    call Call_007_6109
    pop bc
    inc c
    ld hl, StrBrackets
    push bc
    call Call_007_6109
    pop bc
    ld hl, $d8f3
    ld a, $ff
    ld [$d8f9], a
    push bc
    inc b
    call Call_007_6109
    pop bc
    ld a, [$d8f2]
    cp $04
    jp z, Jump_007_4cae

    inc c
    ld hl, StrMapTurn
    push bc
    call Call_007_6109
    pop bc
    ld a, b
    add $04
    ld b, a
    ld a, [$d8f1]
    ld e, a
    ld a, [$d8f2]
    cp $00
    jr z, jr_007_4c94

    push af
    ld a, e
    sub $10
    ld e, a
    pop af
    cp $01
    jr z, jr_007_4c94

    push af
    ld a, e
    sub $10
    ld e, a
    pop af
    cp $02
    jr z, jr_007_4c94

jr_007_4c94:
    inc e
    ld a, e
    ld e, a
    ld d, $02
    push bc
    call Call_007_614d
    pop bc
    ld a, b
    add $09
    ld b, a
    ld a, [$d8fc]
    srl a
    inc a
    ld e, a
    ld d, $02
    call Call_007_614d

Jump_007_4cae:
    pop bc
    inc c
    inc b
    ld a, b
    cp $03
    jp nz, Jump_007_4bc3

    call Call_000_0abb
    ret


Call_007_4cbb:
    push bc
    ld a, b
    sla a
    ld b, a
    sla a
    add b
    ld c, a
    ld b, $01
    ld d, $13
    ld e, $04
    call Call_007_603a
    pop bc
    push bc
    ld d, $02
    ld a, c
    sub $05
    dec a
    ld e, a
    ld a, b
    sla a
    ld b, a
    sla a
    add b
    inc a
    inc a
    inc a
    inc a
    ld c, a
    ld b, $11
    call Call_007_614d
    pop bc
    ret


Call_007_4ce9:
    push bc
    ld a, b
    sla a
    ld b, a
    sla a
    add b
    ld c, a
    ld b, $01
    ld d, $13
    ld e, $04
    call Call_007_607f
    pop bc
    push bc
    ld d, $02
    ld a, c
    sub $05
    dec a
    ld e, a
    ld a, b
    sla a
    ld b, a
    sla a
    add b
    inc a
    inc a
    inc a
    inc a
    ld c, a
    ld b, $11
    call Call_007_614d
    pop bc
    ret


Call_007_4d17:
    ld a, [$d8e9]
    sla a
    ld e, a
    sla a
    add e
    sla a
    sla a
    sla a
    add $20
    ld e, a
    ld d, $0b
    ld a, $01
    ld c, $1e
    push de
    call Call_000_08ff
    pop de
    ld a, e
    add $08
    ld e, a
    ld a, $02
    ld c, $1f
    call Call_000_08ff
    ret


WindowPassword::
    db $01, $05, $12, $05
    db $03, $05, "INPUT PASSWORD", $ff
    db $02, $08, "PASS_WORD ______", $ff
    db $ff

StrInputError::
    db "INPUT ERROR", $ff
StrBlankSpace::
    db "           ", $ff

Call_007_4d81::
    call Call_000_0d4b
    ld a, MUSIC_PASSWORD
    call PlayMusic
    ld hl, WindowPassword
    ld a, l
    ld [$d8e0], a
    ld a, h
    ld [$d8e1], a
    call ShowWindow

jr_007_4d97:
    call Call_000_0abb
    ld hl, $d901

jr_007_4d9d:
    ld b, $06

jr_007_4d9f:
    ld a, $20

jr_007_4da1:
    ld [hl+], a
    dec b
    jr nz, jr_007_4da1

    ld a, $00
    ld [hl], a
    ld a, $00
    ld [$d900], a

Jump_007_4dad:
jr_007_4dad:
    call Call_007_4f0e
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_4ddb

    bit BTN_B_F, a
    jp nz, Jump_007_4e2f

    bit BTN_RT_F, a
    jp nz, Jump_007_4e44

    bit BTN_LT_F, a
    jp nz, Jump_007_4e77

    bit BTN_UP_F, a
    jp nz, Jump_007_4e98

    bit BTN_DN_F, a
    jp nz, Jump_007_4ed3

    call Call_000_085d
    jr jr_007_4dad

Jump_007_4ddb:
    call Call_000_0f7e
    cp $00
    jr z, jr_007_4e16

    ld a, SND_PASS_MISMATCH
    call PlaySound
    ld b, $05
    ld c, $0d
    push bc
    ld hl, StrInputError
    call Call_007_6109
    call Call_000_0abb

Jump_007_4df5:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_4df5

    call Call_000_0c3c
    ld a, SND_PASS_LETTER
    call PlaySound
    pop bc
    ld hl, StrBlankSpace
    call Call_007_6109
    call Call_000_0abb
    jr jr_007_4dad

jr_007_4e16:
    ld a, b
    ld [$d79a], a
    ld a, SND_PASS_MATCH
    call PlaySound

Jump_007_4e1f:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_4e1f

    ld a, $00
    ret


Jump_007_4e2f:
    ld a, SND_MENU_CANCEL
    call PlaySound

Jump_007_4e34:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_B_F, a
    jp nz, Jump_007_4e34

    ld a, $ff
    ret


Jump_007_4e44:
    ld a, [$d900]
    cp $05
    jp z, Jump_007_4dad

    ld hl, $d901
    ld a, [$d900]
    call AddAToHL
    ld a, [hl]
    cp $20
    jp z, Jump_007_4dad

    ld a, [$d900]
    inc a
    ld [$d900], a
    ld a, SND_PASS_LETTER
    call PlaySound

Jump_007_4e67:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_RT_F, a
    jp nz, Jump_007_4e67

    jp Jump_007_4dad


Jump_007_4e77:
    ld a, [$d900]
    cp $00
    jp z, Jump_007_4dad

    dec a
    ld [$d900], a
    ld a, SND_PASS_LETTER
    call PlaySound

Jump_007_4e88:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_LT_F, a
    jp nz, Jump_007_4e88

    jp Jump_007_4dad


Jump_007_4e98:
    ld a, SND_PASS_LETTER
    call PlaySound
    ld a, [$d900]
    ld hl, $d901
    call AddAToHL
    ld a, [hl]
    cp $20
    jr nz, jr_007_4eb0

    ld a, $41
    ld [hl], a
    jr jr_007_4ec4

jr_007_4eb0:
    cp $5a
    jr nz, jr_007_4eb9

    ld a, $30
    ld [hl], a
    jr jr_007_4ec4

jr_007_4eb9:
    cp $39
    jr nz, jr_007_4ec2

    ld a, $41
    ld [hl], a
    jr jr_007_4ec4

jr_007_4ec2:
    inc a
    ld [hl], a

jr_007_4ec4:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_UP_F, a
    jr nz, jr_007_4ec4

    jp Jump_007_4dad


Jump_007_4ed3:
    ld a, SND_PASS_LETTER
    call PlaySound
    ld a, [$d900]
    ld hl, $d901
    call AddAToHL
    ld a, [hl]
    cp $20
    jr nz, jr_007_4eeb

    ld a, $39
    ld [hl], a
    jr jr_007_4eff

jr_007_4eeb:
    cp $30
    jr nz, jr_007_4ef4

    ld a, $5a
    ld [hl], a
    jr jr_007_4eff

jr_007_4ef4:
    cp $41
    jr nz, jr_007_4efd

    ld a, $39
    ld [hl], a
    jr jr_007_4eff

jr_007_4efd:
    dec a
    ld [hl], a

jr_007_4eff:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_DN_F, a
    jr nz, jr_007_4eff

    jp Jump_007_4dad


Call_007_4f0e:
    ld hl, $d901
    ld a, l
    ld [$d7c1], a
    ld a, h
    ld [$d7c2], a
    ld a, $01
    ld d, $68
    ld e, $4f
    ld b, $06
    call Call_000_14f0
    ld a, [$d900]
    sla a
    sla a
    sla a
    add $68
    ld d, a
    ld e, $47
    ld a, $00
    ld c, $1f
    call Call_000_08ff
    ret


Call_007_4f3a::
    ld a, $00
    ld [$d909], a
    ld [$d90a], a
    call Call_007_50c3

Jump_007_4f45:
jr_007_4f45:
    call Call_007_510f
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_4f78

    bit BTN_B_F, a
    jp nz, Jump_007_4f9a

    bit BTN_SEL_F, a
    jp nz, Jump_007_4faf

    bit BTN_RT_F, a
    jp nz, Jump_007_5003

    bit BTN_LT_F, a
    jp nz, Jump_007_5028

    bit BTN_UP_F, a
    jp nz, Jump_007_504d

    bit BTN_DN_F, a
    jp nz, Jump_007_5088

    call Call_000_085d
    jr jr_007_4f45

Jump_007_4f78:
    ld a, [$d909]
    ld b, a
    ld a, [$d90a]
    add b
    add $20
    ld [$d79a], a
    ld a, SND_MENU_ACCEPT
    call PlaySound

Jump_007_4f8a:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_4f8a

    ld a, $00
    ret


Jump_007_4f9a:
    ld a, SND_MENU_CANCEL
    call PlaySound

Jump_007_4f9f:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_B_F, a
    jp nz, Jump_007_4f9f

    ld a, $ff
    ret


Jump_007_4faf:
    ld a, SND_MENU_ACCEPT
    call PlaySound

jr_007_4fb4:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_SEL_F, a
    jr nz, jr_007_4fb4

    ld a, [$d909]
    ld b, a
    ld a, [$d90a]
    add b
    add $20
    ld [$d79a], a
    call Call_000_1244
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    ld a, $05
    ld [$d79f], a
    ld [$d7a0], a
    call Call_000_1224

Jump_007_4fe3:
    ld a, $00
    ld [$d7a1], a
    call Call_000_1610
    cp $00
    jp z, Jump_007_4f78

    cp $01
    jp nz, Jump_007_4fe3

    ld a, SND_MENU_CANCEL
    call PlaySound
    call Call_000_0de7
    call Call_007_50c3
    jp Jump_007_4f45


Jump_007_5003:
    ld a, [$d90a]
    cp $21
    jp nc, Jump_007_4f45

    add $0b
    ld [$d90a], a
    call Call_007_50c3
    ld a, SND_MENU_NAV
    call PlaySound

Jump_007_5018:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_RT_F, a
    jp nz, Jump_007_5018

    jp Jump_007_4f45


Jump_007_5028:
    ld a, [$d90a]
    cp $00
    jp z, Jump_007_4f45

    sub $0b
    ld [$d90a], a
    call Call_007_50c3
    ld a, SND_MENU_NAV
    call PlaySound

Jump_007_503d:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_LT_F, a
    jp nz, Jump_007_503d

    jp Jump_007_4f45


Jump_007_504d:
    ld a, [$d909]
    cp $00
    jr z, jr_007_505f

    dec a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound
    jr jr_007_5079

jr_007_505f:
    ld a, [$d90a]
    cp $00
    jp z, Jump_007_4f45

    sub $0b
    ld [$d90a], a
    call Call_007_50c3
    ld a, $0a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound

jr_007_5079:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_UP_F, a
    jr nz, jr_007_5079

    jp Jump_007_4f45


Jump_007_5088:
    ld a, [$d909]
    cp $0a
    jr z, jr_007_509a

    inc a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound
    jr jr_007_50b4

jr_007_509a:
    ld a, [$d90a]
    cp $21
    jp z, Jump_007_4f45

    add $0b
    ld [$d90a], a
    call Call_007_50c3
    ld a, $00
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound

jr_007_50b4:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_DN_F, a
    jr nz, jr_007_50b4

    jp Jump_007_4f45


Call_007_50c3:
    call Call_000_0933
    ld b, $01
    ld c, $01
    ld d, $12
    ld e, $0e
    call Call_007_603a
    ld hl, MapList
    ld b, $04
    ld c, $03
    call Call_007_6109
    ld b, $00

jr_007_50dd:
    push bc
    ld a, [$d90a]
    add b
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
    ld hl, MapList.campaign
    call AddDEToHL
    ld a, b
    add $05
    ld c, a
    ld b, $05
    call Call_007_6109
    pop bc
    inc b
    ld a, b
    cp $0b
    jr nz, jr_007_50dd

    call Call_000_0abb
    ret


Call_007_510f:
    ld a, [$d909]
    sla a
    sla a
    sla a
    add $38
    ld e, a
    ld d, $20
    ld a, $00
    ld c, $7f
    call Call_000_08ff
    ret


Call_007_5125::
    ld a, $00
    ld [$d909], a
    ld [$d90a], a
    call Call_007_52c9

Jump_007_5130:
jr_007_5130:
    call Call_007_5319
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_5163

    bit BTN_B_F, a
    jp nz, Jump_007_5183

    bit BTN_SEL_F, a
    jp nz, Jump_007_5198

    bit BTN_RT_F, a
    jp nz, Jump_007_51ea

    bit BTN_LT_F, a
    jp nz, Jump_007_5222

    bit BTN_UP_F, a
    jp nz, Jump_007_5247

    bit BTN_DN_F, a
    jp nz, Jump_007_5282

    call Call_000_085d
    jr jr_007_5130

Jump_007_5163:
    ld a, [$d909]
    ld b, a
    ld a, [$d90a]
    add b
    ld [$d79a], a
    ld a, SND_MENU_ACCEPT
    call PlaySound

Jump_007_5173:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_5173

    ld a, $00
    ret


Jump_007_5183:
    ld a, SND_MENU_CANCEL
    call PlaySound

Jump_007_5188:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_B_F, a
    jp nz, Jump_007_5188

    ld a, $ff
    ret


Jump_007_5198:
    ld a, SND_MENU_ACCEPT
    call PlaySound

jr_007_519d:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_SEL_F, a
    jr nz, jr_007_519d

    ld a, [$d909]
    ld b, a
    ld a, [$d90a]
    add b
    ld [$d79a], a
    call Call_000_1244
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    ld a, $05
    ld [$d79f], a
    ld [$d7a0], a
    call Call_000_1224

Jump_007_51ca:
    ld a, $00
    ld [$d7a1], a
    call Call_000_1610
    cp $00
    jp z, Jump_007_5163

    cp $01
    jp nz, Jump_007_51ca

    ld a, SND_MENU_CANCEL
    call PlaySound
    call Call_000_0de7
    call Call_007_52c9
    jp Jump_007_5130


Jump_007_51ea:
    ld a, [$d90a]
    cp $41
    jp nc, Jump_007_5130

    add $0b
    ld [$d90a], a
    call Call_007_52c9
    ld a, [$d90a]
    cp $41
    jp c, Jump_007_520d

    ld a, [$d909]
    cp $0a
    jr nz, jr_007_520d

    dec a
    ld [$d909], a

Jump_007_520d:
jr_007_520d:
    ld a, SND_MENU_NAV
    call PlaySound

Jump_007_5212:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_RT_F, a
    jp nz, Jump_007_5212

    jp Jump_007_5130


Jump_007_5222:
    ld a, [$d90a]
    cp $00
    jp z, Jump_007_5130

    sub $0b
    ld [$d90a], a
    call Call_007_52c9
    ld a, SND_MENU_NAV
    call PlaySound

Jump_007_5237:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_LT_F, a
    jp nz, Jump_007_5237

    jp Jump_007_5130


Jump_007_5247:
    ld a, [$d909]
    cp $00
    jr z, jr_007_5259

    dec a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound
    jr jr_007_5273

jr_007_5259:
    ld a, [$d90a]
    cp $00
    jp z, Jump_007_5130

    sub $0b
    ld [$d90a], a
    call Call_007_52c9
    ld a, $0a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound

jr_007_5273:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_UP_F, a
    jr nz, jr_007_5273

    jp Jump_007_5130


Jump_007_5282:
    ld a, [$d909]
    cp $0a
    jr z, jr_007_52a0

    ld b, a
    ld a, [$d90a]
    add b
    cp $4b
    jr nc, jr_007_52ba

    ld a, [$d909]
    inc a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound
    jr jr_007_52ba

jr_007_52a0:
    ld a, [$d90a]
    cp $41
    jp z, Jump_007_5130

    add $0b
    ld [$d90a], a
    call Call_007_52c9
    ld a, $00
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound

jr_007_52ba:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_DN_F, a
    jr nz, jr_007_52ba

    jp Jump_007_5130


Call_007_52c9:
    call Call_000_0933
    ld b, $01
    ld c, $01
    ld d, $12
    ld e, $0e
    call Call_007_603a
    ld hl, MapList.allMap
    ld b, $04
    ld c, $03
    call Call_007_6109
    ld b, $00

jr_007_52e3:
    ld a, [$d90a]
    add b
    cp $4c
    jr nc, jr_007_5315

    push bc
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
    ld hl, MapList.story
    call AddDEToHL
    ld a, b
    add $05
    ld c, a
    ld b, $05
    call Call_007_6109
    pop bc
    inc b
    ld a, b
    cp $0b
    jr nz, jr_007_52e3

jr_007_5315:
    call Call_000_0abb
    ret


Call_007_5319:
    ld a, [$d909]
    sla a
    sla a
    sla a
    add $38
    ld e, a
    ld d, $20
    ld a, $00
    ld c, $7f
    call Call_000_08ff
    ret


MapList::
.campaignMap
    db "CAMPAIGN MAP", $ff
.allMap
    db "   ALL MAP  ", $ff
.story
    db "STORY    01", $ff, $00, $00, $00, $00
    db "STORY    02", $ff, $00, $00, $00, $00
    db "STORY    03", $ff, $00, $00, $00, $00
    db "STORY    04", $ff, $00, $00, $00, $00
    db "STORY    05", $ff, $00, $00, $00, $00
    db "STORY    06", $ff, $00, $00, $00, $00
    db "STORY    07", $ff, $00, $00, $00, $00
    db "STORY    08", $ff, $00, $00, $00, $00
    db "STORY    09", $ff, $00, $00, $00, $00
    db "STORY    10", $ff, $00, $00, $00, $00
    db "STORY    11", $ff, $00, $00, $00, $00
    db "STORY    12", $ff, $00, $00, $00, $00
    db "STORY    13", $ff, $00, $00, $00, $00
    db "STORY    14", $ff, $00, $00, $00, $00
    db "STORY    15", $ff, $00, $00, $00, $00
    db "STORY    16", $ff, $00, $00, $00, $00
.legend
    db "LEGEND   01", $ff, $00, $00, $00, $00
    db "LEGEND   02", $ff, $00, $00, $00, $00
    db "LEGEND   03", $ff, $00, $00, $00, $00
    db "LEGEND   04", $ff, $00, $00, $00, $00
    db "LEGEND   05", $ff, $00, $00, $00, $00
    db "LEGEND   06", $ff, $00, $00, $00, $00
    db "LEGEND   07", $ff, $00, $00, $00, $00
    db "LEGEND   08", $ff, $00, $00, $00, $00
    db "LEGEND   09", $ff, $00, $00, $00, $00
    db "LEGEND   10", $ff, $00, $00, $00, $00
    db "LEGEND   11", $ff, $00, $00, $00, $00
    db "LEGEND   12", $ff, $00, $00, $00, $00
    db "LEGEND   13", $ff, $00, $00, $00, $00
    db "LEGEND   14", $ff, $00, $00, $00, $00
    db "LEGEND   15", $ff, $00, $00, $00, $00
    db "LEGEND   16", $ff, $00, $00, $00, $00
.campaign
    db "CAMPAIGN 01", $ff, $00, $00, $00, $00
    db "CAMPAIGN 02", $ff, $00, $00, $00, $00
    db "CAMPAIGN 03", $ff, $00, $00, $00, $00
    db "CAMPAIGN 04", $ff, $00, $00, $00, $00
    db "CAMPAIGN 05", $ff, $00, $00, $00, $00
    db "CAMPAIGN 06", $ff, $00, $00, $00, $00
    db "CAMPAIGN 07", $ff, $00, $00, $00, $00
    db "CAMPAIGN 08", $ff, $00, $00, $00, $00
    db "CAMPAIGN 09", $ff, $00, $00, $00, $00
    db "CAMPAIGN 10", $ff, $00, $00, $00, $00
    db "CAMPAIGN 11", $ff, $00, $00, $00, $00
    db "CAMPAIGN 12", $ff, $00, $00, $00, $00
    db "CAMPAIGN 13", $ff, $00, $00, $00, $00
    db "CAMPAIGN 14", $ff, $00, $00, $00, $00
    db "CAMPAIGN 15", $ff, $00, $00, $00, $00
    db "CAMPAIGN 16", $ff, $00, $00, $00, $00
    db "CAMPAIGN 17", $ff, $00, $00, $00, $00
    db "CAMPAIGN 18", $ff, $00, $00, $00, $00
    db "CAMPAIGN 19", $ff, $00, $00, $00, $00
    db "CAMPAIGN 20", $ff, $00, $00, $00, $00
    db "CAMPAIGN 21", $ff, $00, $00, $00, $00
    db "CAMPAIGN 22", $ff, $00, $00, $00, $00
    db "CAMPAIGN 23", $ff, $00, $00, $00, $00
    db "CAMPAIGN 24", $ff, $00, $00, $00, $00
    db "CAMPAIGN 25", $ff, $00, $00, $00, $00
    db "CAMPAIGN 26", $ff, $00, $00, $00, $00
    db "CAMPAIGN 27", $ff, $00, $00, $00, $00
    db "CAMPAIGN 28", $ff, $00, $00, $00, $00
    db "CAMPAIGN 29", $ff, $00, $00, $00, $00
    db "CAMPAIGN 30", $ff, $00, $00, $00, $00
    db "CAMPAIGN 31", $ff, $00, $00, $00, $00
    db "CAMPAIGN 32", $ff, $00, $00, $00, $00
    db "CAMPAIGN 33", $ff, $00, $00, $00, $00
    db "CAMPAIGN 34", $ff, $00, $00, $00, $00
    db "CAMPAIGN 35", $ff, $00, $00, $00, $00
    db "CAMPAIGN 36", $ff, $00, $00, $00, $00
    db "CAMPAIGN 37", $ff, $00, $00, $00, $00
    db "CAMPAIGN 38", $ff, $00, $00, $00, $00
    db "CAMPAIGN 39", $ff, $00, $00, $00, $00
    db "CAMPAIGN 40", $ff, $00, $00, $00, $00
    db "CAMPAIGN 41", $ff, $00, $00, $00, $00
    db "CAMPAIGN 42", $ff, $00, $00, $00, $00
    db "CAMPAIGN 43", $ff, $00, $00, $00, $00
    db "CAMPAIGN 44", $ff, $00, $00, $00, $00

EditMapList:
    db "  EDIT MAP  ", $ff
.maps
    db "EDITMAP  01", $ff, $00, $00, $00, $00
    db "EDITMAP  02", $ff, $00, $00, $00, $00
    db "EDITMAP  03", $ff, $00, $00, $00, $00
    db "EDITMAP  04", $ff, $00, $00, $00, $00
    db "EDITMAP  05", $ff, $00, $00, $00, $00
    db "EDITMAP  06", $ff, $00, $00, $00, $00
    db "EDITMAP  07", $ff, $00, $00, $00, $00
    db "EDITMAP  08", $ff, $00, $00, $00, $00
    db "EDITMAP  09", $ff, $00, $00, $00, $00
    db "EDITMAP  10", $ff, $00, $00, $00, $00
    db "EDITMAP  11", $ff, $00, $00, $00, $00
    db "EDITMAP  12", $ff, $00, $00, $00, $00
    db "EDITMAP  13", $ff, $00, $00, $00, $00
    db "EDITMAP  14", $ff, $00, $00, $00, $00
    db "EDITMAP  15", $ff, $00, $00, $00, $00
    db "EDITMAP  16", $ff, $00, $00, $00, $00
    db "EDITMAP  17", $ff, $00, $00, $00, $00
    db "EDITMAP  18", $ff, $00, $00, $00, $00
    db "EDITMAP  19", $ff, $00, $00, $00, $00
    db "EDITMAP  20", $ff, $00, $00, $00, $00
    db "EDITMAP  21", $ff, $00, $00, $00, $00
    db "EDITMAP  22", $ff, $00, $00, $00, $00
    db "EDITMAP  23", $ff, $00, $00, $00, $00
    db "EDITMAP  24", $ff, $00, $00, $00, $00
    db "EDITMAP  25", $ff, $00, $00, $00, $00
    db "EDITMAP  26", $ff, $00, $00, $00, $00
    db "EDITMAP  27", $ff, $00, $00, $00, $00
    db "EDITMAP  28", $ff, $00, $00, $00, $00
    db "EDITMAP  29", $ff, $00, $00, $00, $00
    db "EDITMAP  30", $ff, $00, $00, $00, $00
    db "EDITMAP  31", $ff, $00, $00, $00, $00
    db "EDITMAP  32", $ff, $00, $00, $00, $00
    db "EDITMAP  33", $ff, $00, $00, $00, $00
    db "EDITMAP  34", $ff, $00, $00, $00, $00
    db "EDITMAP  35", $ff, $00, $00, $00, $00
    db "EDITMAP  36", $ff, $00, $00, $00, $00
    db "EDITMAP  37", $ff, $00, $00, $00, $00
    db "EDITMAP  38", $ff, $00, $00, $00, $00
    db "EDITMAP  39", $ff, $00, $00, $00, $00
    db "EDITMAP  40", $ff, $00, $00, $00, $00
    db "EDITMAP  41", $ff, $00, $00, $00, $00
    db "EDITMAP  42", $ff, $00, $00, $00, $00
    db "EDITMAP  43", $ff, $00, $00, $00, $00
    db "EDITMAP  44", $ff, $00, $00, $00, $00

WinnersMapList:
    db "WINNERS MAP", $ff
.maps
    db "WINNERS  01", $ff, $00, $00, $00, $00
    db "WINNERS  02", $ff, $00, $00, $00, $00
    db "WINNERS  03", $ff, $00, $00, $00, $00
    db "WINNERS  04", $ff, $00, $00, $00, $00
    db "WINNERS  05", $ff, $00, $00, $00, $00
    db "WINNERS  06", $ff, $00, $00, $00, $00
    db "WINNERS  07", $ff, $00, $00, $00, $00
    db "WINNERS  08", $ff, $00, $00, $00, $00
    db "WINNERS  09", $ff, $00, $00, $00, $00
    db "WINNERS  10", $ff, $00, $00, $00, $00
    db "WINNERS  11", $ff, $00, $00, $00, $00
    db "WINNERS  12", $ff, $00, $00, $00, $00
    db "WINNERS  13", $ff, $00, $00, $00, $00
    db "WINNERS  14", $ff, $00, $00, $00, $00
    db "WINNERS  15", $ff, $00, $00, $00, $00
    db "WINNERS  16", $ff, $00, $00, $00, $00
    db "WINNERS  17", $ff, $00, $00, $00, $00
    db "WINNERS  18", $ff, $00, $00, $00, $00
    db "WINNERS  19", $ff, $00, $00, $00, $00
    db "WINNERS  20", $ff, $00, $00, $00, $00
    db "WINNERS  21", $ff, $00, $00, $00, $00
    db "WINNERS  22", $ff, $00, $00, $00, $00
    db "WINNERS  23", $ff, $00, $00, $00, $00
    db "WINNERS  24", $ff, $00, $00, $00, $00
    db "WINNERS  25", $ff, $00, $00, $00, $00
    db "WINNERS  26", $ff, $00, $00, $00, $00
    db "WINNERS  27", $ff, $00, $00, $00, $00
    db "WINNERS  28", $ff, $00, $00, $00, $00
    db "WINNERS  29", $ff, $00, $00, $00, $00
    db "WINNERS  30", $ff, $00, $00, $00, $00
    db "WINNERS  31", $ff, $00, $00, $00, $00
    db "WINNERS  32", $ff, $00, $00, $00, $00
    db "WINNERS  33", $ff, $00, $00, $00, $00
    db "WINNERS  34", $ff, $00, $00, $00, $00
    db "WINNERS  35", $ff, $00, $00, $00, $00
    db "WINNERS  36", $ff, $00, $00, $00, $00
    db "WINNERS  37", $ff, $00, $00, $00, $00
    db "WINNERS  38", $ff, $00, $00, $00, $00
    db "WINNERS  39", $ff, $00, $00, $00, $00
    db "WINNERS  40", $ff, $00, $00, $00, $00

SPWinnersMapList:
    db "SPWINNERS MAP", $ff
.maps
    db "SPWINNERS01", $ff, $00, $00, $00, $00
    db "SPWINNERS02", $ff, $00, $00, $00, $00
    db "SPWINNERS03", $ff, $00, $00, $00, $00
    db "SPWINNERS04", $ff, $00, $00, $00, $00

QuickStart:
    db " QUICK START ", $ff
.maps
    db "01 STEVEN", $ff, $00, $00, $00, $00, $00, $00
    db "02 ASTRAL", $ff, $00, $00, $00, $00, $00, $00
    db "03 HECKLE", $ff, $00, $00, $00, $00, $00, $00
    db "04 REMING", $ff, $00, $00, $00, $00, $00, $00
    db "05 STEYER", $ff, $00, $00, $00, $00, $00, $00
    db "06 WALTHE", $ff, $00, $00, $00, $00, $00, $00
    db "07 NUMBUT", $ff, $00, $00, $00, $00, $00, $00
    db "08 GUSTAF", $ff, $00, $00, $00, $00, $00, $00
    db "09 DARDIC", $ff, $00, $00, $00, $00, $00, $00
    db "10 KESLLE", $ff, $00, $00, $00, $00, $00, $00
    db "11 BROWNY", $ff, $00, $00, $00, $00, $00, $00
    db "12 BERETO", $ff, $00, $00, $00, $00, $00, $00
    db "13 GRENER", $ff, $00, $00, $00, $00, $00, $00
    db "14 REGERT", $ff, $00, $00, $00, $00, $00, $00
    db "15 SALAMA", $ff, $00, $00, $00, $00, $00, $00
    db "16 ZONECT", $ff, $00, $00, $00, $00, $00, $00
    db "01 REVOLT", $ff, $00, $00, $00, $00, $00, $00
    db "02 ICARUS", $ff, $00, $00, $00, $00, $00, $00
    db "03 CYRANO", $ff, $00, $00, $00, $00, $00, $00
    db "04 RAMSEY", $ff, $00, $00, $00, $00, $00, $00
    db "05 NEWTON", $ff, $00, $00, $00, $00, $00, $00
    db "06 SENECA", $ff, $00, $00, $00, $00, $00, $00
    db "07 SABINE", $ff, $00, $00, $00, $00, $00, $00
    db "08 ARATUS", $ff, $00, $00, $00, $00, $00, $00
    db "09 GALOIS", $ff, $00, $00, $00, $00, $00, $00
    db "10 DARWIN", $ff, $00, $00, $00, $00, $00, $00
    db "11 PASCAL", $ff, $00, $00, $00, $00, $00, $00
    db "12 HALLEY", $ff, $00, $00, $00, $00, $00, $00
    db "13 BORMAN", $ff, $00, $00, $00, $00, $00, $00
    db "14 APPOLO", $ff, $00, $00, $00, $00, $00, $00
    db "15 KAISER", $ff, $00, $00, $00, $00, $00, $00
    db "16 NECTOR", $ff, $00, $00, $00, $00, $00, $00

StrDataToSend:
    db " ｱｲﾃﾆｵｸﾙ ﾃﾞｰﾀｦ", $ff
StrPleaseSelect:
    db " ｴﾗﾝﾃﾞｸﾀﾞｻｲ", $ff
StrPlaceToReceive:
    db "ﾃﾞｰﾀｦ ｳｹﾙ ﾊﾞｼｮｦ", $ff
StrPleaseSelect2:
    db "ｴﾗﾝﾃﾞｸﾀﾞｻｲ", $ff

Call_007_5ff4::
    ld b, $01
    ld c, $05
    ld d, $12
    ld e, $05
    call Call_007_603a
    ld b, $02
    ld c, $07
    ld hl, StrDataToSend
    call Call_007_6109
    ld b, $02
    ld c, $09
    ld hl, StrPleaseSelect
    call Call_007_6109
    call Call_000_0abb
    ret


Call_007_6017::
    ld b, $01
    ld c, $05
    ld d, $12
    ld e, $05
    call Call_007_603a
    ld b, $02
    ld c, $07
    ld hl, StrPlaceToReceive
    call Call_007_6109
    ld b, $02
    ld c, $09
    ld hl, StrPleaseSelect2
    call Call_007_6109
    call Call_000_0abb
    ret


Call_007_603a:
    push hl
    call Call_000_093f
    push hl
    ld a, $98
    ld [hl+], a
    ld b, d
    dec b
    dec b
    ld a, $99

jr_007_6047:
    ld [hl+], a
    dec b
    jr nz, jr_007_6047

    ld a, $9a
    ld [hl+], a
    pop hl
    ld a, $40
    call AddAToHL
    ld c, e

jr_007_6055:
    push hl
    ld a, $9b
    ld [hl+], a
    ld b, d
    dec b
    dec b
    ld a, $80

jr_007_605e:
    ld [hl+], a
    dec b
    jr nz, jr_007_605e

    ld a, $9c
    ld [hl+], a
    pop hl
    ld a, $40
    call AddAToHL
    dec c
    jr nz, jr_007_6055

    ld a, $9d
    ld [hl+], a
    ld b, d
    dec b
    dec b
    ld a, $9e

jr_007_6076:
    ld [hl+], a
    dec b
    jr nz, jr_007_6076

    ld a, $9f
    ld [hl+], a
    pop hl
    ret


Call_007_607f:
    push hl
    call Call_000_093f
    push hl
    ld a, $18
    ld [hl+], a
    ld b, d
    dec b
    dec b
    ld a, $19

jr_007_608c:
    ld [hl+], a
    dec b
    jr nz, jr_007_608c

    ld a, $1a
    ld [hl+], a
    pop hl
    ld a, $40
    call AddAToHL
    ld c, e

jr_007_609a:
    push hl
    ld a, $1b
    ld [hl+], a
    ld b, d
    dec b
    dec b
    ld a, $80

jr_007_60a3:
    ld [hl+], a
    dec b
    jr nz, jr_007_60a3

    ld a, $1c
    ld [hl+], a
    pop hl
    ld a, $40
    call AddAToHL
    dec c
    jr nz, jr_007_609a

    ld a, $1d
    ld [hl+], a
    ld b, d
    dec b
    dec b
    ld a, $1e

jr_007_60bb:
    ld [hl+], a
    dec b
    jr nz, jr_007_60bb

    ld a, $1f
    ld [hl+], a
    pop hl
    ret


    push hl
    call Call_000_093f
    push hl
    ld a, $90
    ld [hl+], a
    ld b, d
    dec b
    dec b
    ld a, $91

jr_007_60d1:
    ld [hl+], a
    dec b
    jr nz, jr_007_60d1

    ld a, $92
    ld [hl+], a
    pop hl
    ld a, $40
    call AddAToHL
    ld c, e

jr_007_60df:
    push hl
    ld a, $93
    ld [hl+], a
    ld b, d
    dec b
    dec b
    ld a, $80

jr_007_60e8:
    ld [hl+], a
    dec b
    jr nz, jr_007_60e8

    ld a, $94
    ld [hl+], a
    pop hl
    ld a, $40
    call AddAToHL
    dec c
    jr nz, jr_007_60df

    ld a, $95
    ld [hl+], a
    ld b, d
    dec b
    dec b
    ld a, $96

jr_007_6100:
    ld [hl+], a
    dec b
    jr nz, jr_007_6100

    ld a, $97
    ld [hl+], a
    pop hl
    ret


Call_007_6109:
    ld a, l
    ld [$d7c1], a
    ld a, h
    ld [$d7c2], a
    call Call_000_093f

jr_007_6114:
    ld a, [$d7c1]
    ld e, a
    ld a, [$d7c2]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, e
    ld [$d7c1], a
    ld a, d
    ld [$d7c2], a
    ld a, c
    cp $ff
    jr z, jr_007_6144

    ld b, $00
    ld de, Chars

jr_007_6131:
    ld a, [de]
    inc de
    cp c
    jr z, jr_007_613e

    inc b
    ld a, b
    cp $80
    jr nz, jr_007_6131

    ld b, $00

jr_007_613e:
    ld a, b
    or $80
    ld [hl+], a
    jr jr_007_6114

jr_007_6144:
    ld a, [$d7c1]
    ld l, a
    ld a, [$d7c2]
    ld h, a
    ret


Call_007_614d:
    call Call_000_093f
    push de
    pop bc

jr_007_6152:
    push hl
    ld a, b
    ld h, $64
    cp $03
    jr z, jr_007_6162

    ld h, $0a
    cp $02
    jr z, jr_007_6162

    ld h, $01

jr_007_6162:
    ld l, $00

jr_007_6164:
    ld a, c
    cp h
    jr c, jr_007_616d

    sub h
    ld c, a
    inc l
    jr jr_007_6164

jr_007_616d:
    ld a, l
    pop hl
    inc a
    xor $80
    ld [hl+], a
    dec b
    jr nz, jr_007_6152

    ret


Call_007_6177::
    ld a, $00
    ld [$d909], a
    ld [$d90a], a
    call Call_007_632b

Jump_007_6182:
jr_007_6182:
    call Call_007_637b
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_61b5

    bit BTN_B_F, a
    jp nz, Jump_007_61d7

    bit BTN_SEL_F, a
    jp nz, Jump_007_61ec

    bit BTN_RT_F, a
    jp nz, Jump_007_624b

    bit BTN_LT_F, a
    jp nz, Jump_007_6284

    bit BTN_UP_F, a
    jp nz, Jump_007_62a9

    bit BTN_DN_F, a
    jp nz, Jump_007_62e4

    call Call_000_085d
    jr jr_007_6182

Jump_007_61b5:
    ld a, [$d909]
    ld b, a
    ld a, [$d90a]
    add b
    add $20
    ld [$d79a], a
    ld a, SND_MENU_ACCEPT
    call PlaySound

Jump_007_61c7:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_61c7

    ld a, $00
    ret


Jump_007_61d7:
    ld a, SND_MENU_CANCEL
    call PlaySound

Jump_007_61dc:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_B_F, a
    jp nz, Jump_007_61dc

    ld a, $ff
    ret


Jump_007_61ec:
    ld a, SND_MENU_ACCEPT
    call PlaySound

jr_007_61f1:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_SEL_F, a
    jr nz, jr_007_61f1

    ld a, [$d909]
    ld b, a
    ld a, [$d90a]
    add b
    add $20
    ld [$d79a], a
    call Call_000_1244
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    ld a, $05
    ld [$d79f], a
    ld [$d7a0], a
    ld hl, $d572
    ld bc, $0150
    ld a, $ff
    call Call_000_080f
    call Call_000_1224

Jump_007_622b:
    ld a, $00
    ld [$d7a1], a
    call Call_000_1610
    cp $00
    jp z, Jump_007_61b5

    cp $01
    jp nz, Jump_007_622b

    ld a, SND_MENU_CANCEL
    call PlaySound
    call Call_000_0de7
    call Call_007_632b
    jp Jump_007_6182


Jump_007_624b:
    ld a, [$d90a]
    cp $21
    jp nc, Jump_007_6182

    add $0b
    ld [$d90a], a
    call Call_007_632b
    ld a, [$d90a]
    cp $21
    jp c, Jump_007_626f

    ld a, [$d909]
    cp $06
    jr c, jr_007_626f

    ld a, $06
    ld [$d909], a

Jump_007_626f:
jr_007_626f:
    ld a, SND_MENU_NAV
    call PlaySound

Jump_007_6274:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_RT_F, a
    jp nz, Jump_007_6274

    jp Jump_007_6182


Jump_007_6284:
    ld a, [$d90a]
    cp $00
    jp z, Jump_007_6182

    sub $0b
    ld [$d90a], a
    call Call_007_632b
    ld a, SND_MENU_NAV
    call PlaySound

Jump_007_6299:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_LT_F, a
    jp nz, Jump_007_6299

    jp Jump_007_6182


Jump_007_62a9:
    ld a, [$d909]
    cp $00
    jr z, jr_007_62bb

    dec a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound
    jr jr_007_62d5

jr_007_62bb:
    ld a, [$d90a]
    cp $00
    jp z, Jump_007_6182

    sub $0b
    ld [$d90a], a
    call Call_007_632b
    ld a, $0a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound

jr_007_62d5:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_UP_F, a
    jr nz, jr_007_62d5

    jp Jump_007_6182


Jump_007_62e4:
    ld a, [$d909]
    cp $0a
    jr z, jr_007_6302

    ld b, a
    ld a, [$d90a]
    add b
    cp $27
    jr nc, jr_007_631c

    ld a, [$d909]
    inc a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound
    jr jr_007_631c

jr_007_6302:
    ld a, [$d90a]
    cp $21
    jp z, Jump_007_6182

    add $0b
    ld [$d90a], a
    call Call_007_632b
    ld a, $00
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound

jr_007_631c:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_DN_F, a
    jr nz, jr_007_631c

    jp Jump_007_6182


Call_007_632b:
    call Call_000_0933
    ld b, $01
    ld c, $01
    ld d, $12
    ld e, $0e
    call Call_007_603a
    ld hl, EditMapList
    ld b, $04
    ld c, $03
    call Call_007_6109
    ld b, $00

jr_007_6345:
    ld a, [$d90a]
    add b
    cp $28
    jr nc, jr_007_6377

    push bc
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
    ld hl, EditMapList.maps
    call AddDEToHL
    ld a, b
    add $05
    ld c, a
    ld b, $05
    call Call_007_6109
    pop bc
    inc b
    ld a, b
    cp $0b
    jr nz, jr_007_6345

jr_007_6377:
    call Call_000_0abb
    ret


Call_007_637b:
    ld a, [$d909]
    sla a
    sla a
    sla a
    add $38
    ld e, a
    ld d, $20
    ld a, $00
    ld c, $7f
    call Call_000_08ff
    ret


Call_007_6391::
    ld a, $00
    ld [$d909], a
    ld [$d90a], a
    call Call_007_653a

Jump_007_639c:
jr_007_639c:
    call Call_007_658a
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_63cf

    bit BTN_B_F, a
    jp nz, Jump_007_63f1

    bit BTN_SEL_F, a
    jp nz, Jump_007_6406

    bit BTN_RT_F, a
    jp nz, Jump_007_645a

    bit BTN_LT_F, a
    jp nz, Jump_007_6493

    bit BTN_UP_F, a
    jp nz, Jump_007_64b8

    bit BTN_DN_F, a
    jp nz, Jump_007_64f3

    call Call_000_085d
    jr jr_007_639c

Jump_007_63cf:
    ld a, [$d909]
    ld b, a
    ld a, [$d90a]
    add b
    add $20
    ld [$d79a], a
    ld a, SND_MENU_ACCEPT
    call PlaySound

Jump_007_63e1:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_63e1

    ld a, $00
    ret


Jump_007_63f1:
    ld a, SND_MENU_CANCEL
    call PlaySound

Jump_007_63f6:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_B_F, a
    jp nz, Jump_007_63f6

    ld a, $ff
    ret


Jump_007_6406:
    ld a, SND_MENU_ACCEPT
    call PlaySound

jr_007_640b:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_SEL_F, a
    jr nz, jr_007_640b

    ld a, [$d909]
    ld b, a
    ld a, [$d90a]
    add b
    add $20
    ld [$d79a], a
    call Call_000_1244
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    ld a, $05
    ld [$d79f], a
    ld [$d7a0], a
    call Call_000_1224

Jump_007_643a:
    ld a, $00
    ld [$d7a1], a
    call Call_000_1610
    cp $00
    jp z, Jump_007_63cf

    cp $01
    jp nz, Jump_007_643a

    ld a, SND_MENU_CANCEL
    call PlaySound
    call Call_000_0de7
    call Call_007_653a
    jp Jump_007_639c


Jump_007_645a:
    ld a, [$d90a]
    cp $21
    jp nc, Jump_007_639c

    add $0b
    ld [$d90a], a
    call Call_007_653a
    ld a, [$d90a]
    cp $21
    jp c, Jump_007_647e

    ld a, [$d909]
    cp $06
    jr c, jr_007_647e

    ld a, $06
    ld [$d909], a

Jump_007_647e:
jr_007_647e:
    ld a, SND_MENU_NAV
    call PlaySound

Jump_007_6483:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_RT_F, a
    jp nz, Jump_007_6483

    jp Jump_007_639c


Jump_007_6493:
    ld a, [$d90a]
    cp $00
    jp z, Jump_007_639c

    sub $0b
    ld [$d90a], a
    call Call_007_653a
    ld a, SND_MENU_NAV
    call PlaySound

Jump_007_64a8:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_LT_F, a
    jp nz, Jump_007_64a8

    jp Jump_007_639c


Jump_007_64b8:
    ld a, [$d909]
    cp $00
    jr z, jr_007_64ca

    dec a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound
    jr jr_007_64e4

jr_007_64ca:
    ld a, [$d90a]
    cp $00
    jp z, Jump_007_639c

    sub $0b
    ld [$d90a], a
    call Call_007_653a
    ld a, $0a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound

jr_007_64e4:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_UP_F, a
    jr nz, jr_007_64e4

    jp Jump_007_639c


Jump_007_64f3:
    ld a, [$d909]
    cp $0a
    jr z, jr_007_6511

    ld b, a
    ld a, [$d90a]
    add b
    cp $27
    jr nc, jr_007_652b

    ld a, [$d909]
    inc a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound
    jr jr_007_652b

jr_007_6511:
    ld a, [$d90a]
    cp $21
    jp z, Jump_007_639c

    add $0b
    ld [$d90a], a
    call Call_007_653a
    ld a, $00
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound

jr_007_652b:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_DN_F, a
    jr nz, jr_007_652b

    jp Jump_007_639c


Call_007_653a:
    call Call_000_0933
    ld b, $01
    ld c, $01
    ld d, $12
    ld e, $0e
    call Call_007_603a
    ld hl, WinnersMapList
    ld b, $04
    ld c, $03
    call Call_007_6109
    ld b, $00

jr_007_6554:
    ld a, [$d90a]
    add b
    cp $28
    jr nc, jr_007_6586

    push bc
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
    ld hl, WinnersMapList.maps
    call AddDEToHL
    ld a, b
    add $05
    ld c, a
    ld b, $05
    call Call_007_6109
    pop bc
    inc b
    ld a, b
    cp $0b
    jr nz, jr_007_6554

jr_007_6586:
    call Call_000_0abb
    ret


Call_007_658a:
    ld a, [$d909]
    sla a
    sla a
    sla a
    add $38
    ld e, a
    ld d, $20
    ld a, $00
    ld c, $7f
    call Call_000_08ff
    ret


Call_007_65a0::
    ld a, $00
    ld [$d909], a
    ld [$d90a], a
    call Call_007_66e1

Jump_007_65ab:
jr_007_65ab:
    call Call_007_6731
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_65d4

    bit BTN_B_F, a
    jp nz, Jump_007_65f6

    bit BTN_SEL_F, a
    jp nz, Jump_007_660b

    bit BTN_UP_F, a
    jp nz, Jump_007_665f

    bit BTN_DN_F, a
    jp nz, Jump_007_669a

    call Call_000_085d
    jr jr_007_65ab

Jump_007_65d4:
    ld a, [$d909]
    ld b, a
    ld a, [$d90a]
    add b
    add $48
    ld [$d79a], a
    ld a, SND_MENU_ACCEPT
    call PlaySound

Jump_007_65e6:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, Jump_007_65e6

    ld a, $00
    ret


Jump_007_65f6:
    ld a, SND_MENU_CANCEL
    call PlaySound

Jump_007_65fb:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_B_F, a
    jp nz, Jump_007_65fb

    ld a, $ff
    ret


Jump_007_660b:
    ld a, SND_MENU_ACCEPT
    call PlaySound

jr_007_6610:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_SEL_F, a
    jr nz, jr_007_6610

    ld a, [$d909]
    ld b, a
    ld a, [$d90a]
    add b
    add $48
    ld [$d79a], a
    call Call_000_1244
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    ld a, $05
    ld [$d79f], a
    ld [$d7a0], a
    call Call_000_1224

Jump_007_663f:
    ld a, $00
    ld [$d7a1], a
    call Call_000_1610
    cp $00
    jp z, Jump_007_65d4

    cp $01
    jp nz, Jump_007_663f

    ld a, SND_MENU_CANCEL
    call PlaySound
    call Call_000_0de7
    call Call_007_66e1
    jp Jump_007_65ab


Jump_007_665f:
    ld a, [$d909]
    cp $00
    jr z, jr_007_6671

    dec a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound
    jr jr_007_668b

jr_007_6671:
    ld a, [$d90a]
    cp $00
    jp z, Jump_007_65ab

    sub $0b
    ld [$d90a], a
    call Call_007_66e1
    ld a, $0a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound

jr_007_668b:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_UP_F, a
    jr nz, jr_007_668b

    jp Jump_007_65ab


Jump_007_669a:
    ld a, [$d909]
    cp $03
    jr z, jr_007_66b8

    ld b, a
    ld a, [$d90a]
    add b
    cp $27
    jr nc, jr_007_66d2

    ld a, [$d909]
    inc a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound
    jr jr_007_66d2

jr_007_66b8:
    ld a, [$d90a]
    cp $00
    jp z, Jump_007_65ab

    add $0b
    ld [$d90a], a
    call Call_007_66e1
    ld a, $00
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound

jr_007_66d2:
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_DN_F, a
    jr nz, jr_007_66d2

    jp Jump_007_65ab


Call_007_66e1:
    call Call_000_0933
    ld b, $01
    ld c, $01
    ld d, $12
    ld e, $0e
    call Call_007_603a
    ld hl, SPWinnersMapList
    ld b, $04
    ld c, $03
    call Call_007_6109
    ld b, $00

jr_007_66fb:
    ld a, [$d90a]
    add b
    cp $04
    jr nc, jr_007_672d

    push bc
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
    ld hl, SPWinnersMapList.maps
    call AddDEToHL
    ld a, b
    add $05
    ld c, a
    ld b, $05
    call Call_007_6109
    pop bc
    inc b
    ld a, b
    cp $0b
    jr nz, jr_007_66fb

jr_007_672d:
    call Call_000_0abb
    ret


Call_007_6731:
    ld a, [$d909]
    sla a
    sla a
    sla a
    add $38
    ld e, a
    ld d, $20
    ld a, $00
    ld c, $7f
    call Call_000_08ff
    ret


SelectLevel::
    ld a, $00
    ld [$d909], a
    ld [$d90a], a
    call Call_007_68ec

Jump_007_6752:
.jr_007_6752
    call Call_007_693c
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, .Jump_007_6785

    bit BTN_B_F, a
    jp nz, .Jump_007_67a5

    bit BTN_SEL_F, a
    jp nz, .Jump_007_67ba

    bit BTN_RT_F, a
    jp nz, .Jump_007_680c

    bit BTN_LT_F, a
    jp nz, .Jump_007_6845

    bit BTN_UP_F, a
    jp nz, .Jump_007_686a

    bit BTN_DN_F, a
    jp nz, .Jump_007_68a5

    call Call_000_085d
    jr .jr_007_6752

.Jump_007_6785
    ld a, [$d909]
    ld b, a
    ld a, [$d90a]
    add b
    ld [$d79a], a
    ld a, SND_MENU_ACCEPT
    call PlaySound

.Jump_007_6795
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_A_F, a
    jp nz, .Jump_007_6795

    ld a, $00
    ret


.Jump_007_67a5
    ld a, SND_MENU_CANCEL
    call PlaySound

.Jump_007_67aa
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_B_F, a
    jp nz, .Jump_007_67aa

    ld a, $ff
    ret


.Jump_007_67ba
    ld a, SND_MENU_ACCEPT
    call PlaySound

.jr_007_67bf
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_SEL_F, a
    jr nz, .jr_007_67bf

    ld a, [$d909]
    ld b, a
    ld a, [$d90a]
    add b
    ld [$d79a], a
    call Call_000_1244
    ld a, $00
    ld [$d79d], a
    ld [$d79e], a
    ld a, $05
    ld [$d79f], a
    ld [$d7a0], a
    call Call_000_1224

.Jump_007_67ec
    ld a, $00
    ld [$d7a1], a
    call Call_000_1610
    cp $00
    jp z, .Jump_007_6785

    cp $01
    jp nz, .Jump_007_67ec

    ld a, SND_MENU_CANCEL
    call PlaySound
    call Call_000_0de7
    call Call_007_68ec
    jp Jump_007_6752


.Jump_007_680c
    ld a, [$d90a]
    cp $16
    jp nc, Jump_007_6752

    add $0b
    ld [$d90a], a
    call Call_007_68ec
    ld a, [$d90a]
    cp $16
    jp c, .Jump_007_6830

    ld a, [$d909]
    cp $09
    jr c, .jr_007_6830

    ld a, $09
    ld [$d909], a

.Jump_007_6830
.jr_007_6830
    ld a, SND_MENU_NAV
    call PlaySound

.Jump_007_6835
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_RT_F, a
    jp nz, .Jump_007_6835

    jp Jump_007_6752


.Jump_007_6845
    ld a, [$d90a]
    cp $00
    jp z, Jump_007_6752

    sub $0b
    ld [$d90a], a
    call Call_007_68ec
    ld a, SND_MENU_NAV
    call PlaySound

.Jump_007_685a
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_LT_F, a
    jp nz, .Jump_007_685a

    jp Jump_007_6752


.Jump_007_686a
    ld a, [$d909]
    cp $00
    jr z, .jr_007_687c

    dec a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound
    jr .jr_007_6896

.jr_007_687c
    ld a, [$d90a]
    cp $00
    jp z, Jump_007_6752

    sub $0b
    ld [$d90a], a
    call Call_007_68ec
    ld a, $0a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound

.jr_007_6896
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_UP_F, a
    jr nz, .jr_007_6896

    jp Jump_007_6752


.Jump_007_68a5
    ld a, [$d909]
    cp $0a
    jr z, .jr_007_68c3

    ld b, a
    ld a, [$d90a]
    add b
    cp $1f
    jr nc, .jr_007_68dd

    ld a, [$d909]
    inc a
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound
    jr .jr_007_68dd

.jr_007_68c3
    ld a, [$d90a]
    cp $16
    jp z, Jump_007_6752

    add $0b
    ld [$d90a], a
    call Call_007_68ec
    ld a, $00
    ld [$d909], a
    ld a, SND_MENU_NAV
    call PlaySound

.jr_007_68dd
    call Call_000_085d
    call Call_000_079c
    ldh a, [$8c]
    bit BTN_DN_F, a
    jr nz, .jr_007_68dd

    jp Jump_007_6752


Call_007_68ec:
    call Call_000_0933
    ld b, $01
    ld c, $01
    ld d, $12
    ld e, $0e
    call Call_007_603a
    ld hl, QuickStart
    ld b, $04
    ld c, $03
    call Call_007_6109
    ld b, $00

jr_007_6906:
    ld a, [$d90a]
    add b
    cp $20
    jr nc, jr_007_6938

    push bc
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
    ld hl, QuickStart.maps
    call AddDEToHL
    ld a, b
    add $05
    ld c, a
    ld b, $05
    call Call_007_6109
    pop bc
    inc b
    ld a, b
    cp $0b
    jr nz, jr_007_6906

jr_007_6938:
    call Call_000_0abb
    ret


Call_007_693c:
    ld a, [$d909]
    sla a
    sla a
    sla a
    add $38
    ld e, a
    ld d, $20
    ld a, $00
    ld c, $7f
    call Call_000_08ff
    ret


data_007_6952:
    db "NECTAR"


Call_007_6958::
    push af
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    sla a
    ld d, a
    ld e, $00
    ld hl, $a000
    call AddDEToHL
    push hl
    pop de
    push de
    push de
    pop hl
    ld bc, $0200
    ld a, $00
    call Call_000_080f
    ld hl, data_007_6952
    ld bc, $0006
    call Call_000_081a
    ld a, [$d79a]
    ld [de], a
    inc de
    ld a, [$d7a8]
    ld [de], a
    inc de
    ld hl, $d7a9
    ld bc, $0008
    call Call_000_081a
    ld a, [$d7a4]
    ld [de], a
    inc de
    ld a, [$d7a5]
    ld [de], a
    inc de
    ld a, $00
    ld [de], a
    inc de
    ld [de], a
    inc de
    ld b, $08
    ld hl, $d918

jr_007_69ac:
    push bc
    push hl
    ld a, [hl+]
    cp $ff
    jr nz, jr_007_69bd

    ld a, $ff
    ld [de], a
    inc de
    ld [de], a
    inc de
    ld [de], a
    inc de
    jr jr_007_69cc

jr_007_69bd:
    ld b, a
    ld [de], a
    inc de
    ld a, [hl+]
    ld c, a
    ld [de], a
    inc de
    call Call_000_0969
    ld a, [hl]
    and $0f
    ld [de], a
    inc de

jr_007_69cc:
    pop hl
    pop bc
    inc hl
    inc hl
    dec b
    jr nz, jr_007_69ac

    jr jr_007_69d5

jr_007_69d5:
    ld hl, $d572
    ld bc, $0150
    call Call_000_081a
    ld a, [$db04]
    ld [de], a
    inc de
    ld a, [$db05]
    ld [de], a
    inc de
    ld a, [$db06]
    ld [de], a
    inc de
    ld a, [$db07]
    ld [de], a
    inc de
    ld hl, $d7c5
    ld bc, $0064
    call Call_000_081a
    pop de
    call Call_007_6b27
    push af
    ld hl, $01ff
    call AddDEToHL
    pop af
    ld [hl], a
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ret


Call_007_6a12::
    push af
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    sla a
    ld d, a
    ld e, $00
    ld hl, $a000
    call AddDEToHL
    push hl
    pop de
    call Call_007_6b27
    ld b, a
    ld hl, $01ff
    call AddDEToHL
    ld a, [hl]
    cp b
    jr z, jr_007_6a44

    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    ret


jr_007_6a44:
    ld hl, data_007_6952
    ld b, $06

jr_007_6a49:
    ld a, [hl]
    ld c, a
    ld a, [de]
    cp c
    inc hl
    inc de
    dec b
    jr nz, jr_007_6a49

    ld a, [de]
    ld [$d79a], a
    inc de
    ld a, [de]
    ld [$d7a8], a
    inc de
    ld hl, $d7a9
    ld bc, $0008
    call Call_000_0823
    ld a, [de]
    ld [$d7a4], a
    inc de
    ld a, [de]
    ld [$d7a5], a
    inc de
    inc de
    inc de
    ld b, $08

jr_007_6a73:
    push bc
    push de
    ld a, [de]
    cp $ff
    jr z, jr_007_6a86

    ld b, a
    inc de
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    push af
    call Call_000_0969
    pop af
    ld [hl], a

jr_007_6a86:
    pop de
    inc de
    inc de
    inc de
    pop bc
    dec b
    jr nz, jr_007_6a73

    ld hl, $d572
    ld bc, $0150
    call Call_000_0823
    ld a, [de]
    ld [$d79f], a
    inc de
    ld a, [de]
    ld [$d7a0], a
    inc de
    ld a, [de]
    ld [$d79d], a
    inc de
    ld a, [de]
    ld [$d79e], a
    inc de
    ld hl, $d7c5
    ld bc, $0064
    call Call_000_0823
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $00
    ret


Call_007_6ac0::
    push af
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    sla a
    ld d, a
    ld e, $00
    ld hl, $a000
    call AddDEToHL
    push hl
    pop de
    call Call_007_6b27
    ld b, a
    ld hl, $01ff
    call AddDEToHL
    ld a, [hl]
    cp b
    jr z, jr_007_6afe

    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $01
    ret


jr_007_6af2:
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $ff
    ret


jr_007_6afe:
    push de
    ld hl, $d8eb
    ld b, $14

jr_007_6b04:
    ld a, [de]
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_007_6b04

    pop de
    ld hl, data_007_6952
    ld b, $06

jr_007_6b10:
    ld a, [hl]
    ld c, a
    ld a, [de]
    cp c
    jr nz, jr_007_6af2

    inc hl
    inc de
    dec b
    jr nz, jr_007_6b10

    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ld a, $00
    ret


Call_007_6b27:
    push de
    push de
    pop hl
    ld bc, $01fe
    ld d, $00

jr_007_6b2f:
    ld a, [hl+]
    add d
    ld d, a
    dec bc
    ld a, b
    or c
    jr nz, jr_007_6b2f

    ld a, d
    pop de
    ret


Call_007_6b3a::
    push af
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    sla a
    ld d, a
    ld e, $00
    push hl
    ld hl, $a000
    call AddDEToHL
    ld e, l
    ld d, h
    pop hl
    ld bc, $0200

jr_007_6b57:
    ld a, [de]
    ld [hl+], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_007_6b57

    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ret


Call_007_6b69::
    push af
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    sla a
    ld d, a
    ld e, $00
    push hl
    ld hl, $a000
    call AddDEToHL
    ld e, l
    ld d, h
    pop hl
    ld bc, $0200

jr_007_6b86:
    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_007_6b86

    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ret


Call_007_6b98::
    ld a, $0d
    call Call_007_6958
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    ld hl, $a000
    ld a, $88
    ld [hl], a
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ret


    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    ld hl, $a000
    ld a, $00
    ld [hl], a
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    ret


Call_007_6bcf::
    ld a, $02
    call Call_000_05c8
    ld [$4000], a
    ei
    ld hl, $a000
    ld a, [hl]
    push af
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    ret


AreBothCampaignsComplete::
    ld a, BANK(CampaignStatus)
    call Call_000_05c8
    ld [$4000], a
    ei

    ld hl, CampaignStatus
    ld b, $00
    ld a, [hl+]
    cp "A"
    jr nz, .done

    ld a, [hl]
    cp "T"
    jr nz, .done

    ld b, $01

.done
    ld a, b
    push af
    ld a, $00
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    ret


SetCampaignComplete::
    push af
    ld a, BANK(CampaignStatus)
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    ld b, "A"
    cp MAP_STORY
    jr z, .write

    ld b, "T"

.write
    ld hl, CampaignStatus
    call AddAToHL
    ld a, b
    ld [hl], a
    push af
    ld a, MAP_STORY
    call Call_000_05c8
    ld [$4000], a
    ei
    pop af
    ret


SECTION "nectaris/bank_007: Save Data", SRAM

CampaignStatus::
    ds 2
