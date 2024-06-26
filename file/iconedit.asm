; Disassembly of "icon-edit.gbf"

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
    db $03                     ; owner code
.title
    dk "ICON-EDIT"
.icon
    INCBIN "gfx/iconedit/icon.2bpp"
.end

History:
.points
    dw 1
.author
    db "TOBI      ", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    ld sp, $e000

Jump_000_0100::
    ld hl, $0301
    trap $b6
    callx call_0521
    callx call_0512
    jr nc, jr_000_0119

    jx jx_01e0


jr_000_0119::
    ldh a, [$9b]
    ld [$c766], a
    ldh a, [$9a]
    ld [$c767], a
    xor a
    ldh [$9b], a
    ldh [$9a], a

jr_000_0128::
    xor a
    trap DrawInit
    trap LCDDisable
    callx call_05c4
    ld a, $03
    trap LCDEnable
    xor a

jr_000_0139::
    ldx de, data_0151
    trap DoCursorMenu
    jr c, jr_000_0139

    ld l, a
    ld h, $00

    trap JumpViaTable
    db $06
    dw jx_01e0 - @  ; continue edit
    dw jx_0165 - @  ; save icon
    dw jx_015a - @  ; create new
    dw jx_0158 - @  ; quit
    dw jr_000_0128 - @

data_0151:
    db $04            ; item count
    db $04, $06       ; initial position
    db $04, $7f       ; cursor characters
    dw call_071d - @  ; update callback


jx_0158:
    trap ExitToMenu


jx_015a:
    callx @+$0447
    jx @+$007e


jx_0165:
    callx @+$02fc
    jr c, jr_000_0128

jr_000_016e::
    ld de, $c791
    ld hl, $c769
    ld c, $00

jr_000_0176::
    inc c
    ld a, [de]
    inc de
    ld [hl+], a
    or a
    jr nz, jr_000_0176

    ld a, $83
    ld de, $c768
    ld [de], a
    ld hl, $c500
    ld c, $00
    trap $6b
    jr c, jr_000_01a5

    ld a, $09
    callx @+$055c
    callx @+$0343
    jr c, jr_000_0128

    ld hl, $c500
    trap $ef
    jr jr_000_016e

jr_000_01a5::
    ld hl, $c50a
    xor a
    ld [hl+], a
    ld a, [hl]
    ld c, a
    ld b, $00
    add $c0
    ld [hl+], a
    add hl, bc
    ld de, $c600
    ld c, $c0

jr_000_01b7::
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_000_01b7

    ld hl, $c500
    ld de, $0000
    ld bc, $19ff
    trap $e9
    jr c, jr_000_01ce

    jx @+$ff5d


jr_000_01ce::
    ld a, $08
    callx @+$051a

jr_000_01d7::
    trap $d8
    or a
    jr z, jr_000_01d7

    jx @+$ff4b


jx_01e0:
    xor a
    trap DrawInit
    trap LCDDisable
    callx @+$0366
    callx @+$023e
    ld a, $63
    trap LCDEnable

jr_000_01f7::
    trap AwaitFrame
    ld bc, $2800
    trap $c4
    trap $d8
    callx @+$0041
    ldh a, [$8b]
    bit 3, a
    jr z, jr_000_0211

    jx @+$ff0b


jr_000_0211::
    or a
    jr z, jr_000_01f7

    callx @+$000c
    callx @+$016f
    jr jr_000_01f7

    ldh a, [$8b]
    bit 2, a
    ret z

    ld hl, $c7b9
    inc [hl]
    ld a, [$c7b9]
    ldx de, data_068e
    and $01
    jr z, jr_000_023c

    ldx de, data_06ce

jr_000_023c::
    ld hl, $9000
    ld bc, $0010
    trap MemCopy
    ret


    ldh a, [$b6]
    ld b, a
    and $f0
    jr z, jr_000_029c

    bit 6, b
    jr z, jr_000_0259

    callx @+$007b
    jr jr_000_027e

jr_000_0259::
    bit 7, b
    jr z, jr_000_0266

    callx @+$0092
    jr jr_000_027e

jr_000_0266::
    bit 5, b
    jr z, jr_000_0273

    callx @+$00ab
    jr jr_000_027e

jr_000_0273::
    bit 4, b
    jr z, jr_000_027e

    callx @+$00c2

jr_000_027e::
    callx @+$00e1
    ldh a, [$8a]
    and $03
    jr z, jr_000_029c

    callx @+$016b
    ld a, [$c764]
    callx @+$0115

jr_000_029c:
    ld hl, $c763
    ld a, [hl]
    ld c, a
    inc [hl]
    bit 4, c
    ret nz

    ldh a, [$9b]
    ld d, a
    ldh a, [$9a]
    ld e, a
    ld hl, $c300
    ld a, [$c762]
    inc a
    inc a
    add a
    add a
    add a
    sub e
    ld [hl+], a
    ld a, [$c761]
    inc a
    add a
    add a
    add a
    sub d
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl], a
    ret


    ld [hl], a
    add a
    add a
    add a
    ld e, a
    xor a
    ld [$c763], a
    ret


    ld hl, $c762
    ld a, [hl]
    dec a
    bit 7, a
    jr z, jr_000_02d9

    xor a

jr_000_02d9::
    callx @+$ffe8
    ldh a, [$9a]
    or a
    jr z, jr_000_02f2

    ld d, a
    sub e
    cpl
    inc a
    cp $20
    jr nc, jr_000_02f2

    ld a, d
    sub $08
    ldh [$9a], a

jr_000_02f2::
    ret


    ld hl, $c762
    ld a, [hl]
    inc a
    cp $18
    jr c, jr_000_02fe

    ld a, $17

jr_000_02fe::
    callx @+$ffc3
    ldh a, [$9a]
    cp $50
    jr nc, jr_000_0318

    ld d, a
    sub e
    cpl
    inc a
    cp $50
    jr c, jr_000_0318

    ld a, d
    add $08
    ldh [$9a], a

jr_000_0318::
    ret


    ld hl, $c761
    ld a, [hl]
    dec a
    bit 7, a
    jr z, jr_000_0323

    xor a

jr_000_0323::
    callx @+$ff9e
    ldh a, [$9b]
    or a
    jr z, jr_000_033c

    ld d, a
    sub e
    cpl
    inc a
    cp $20
    jr nc, jr_000_033c

    ld a, d
    sub $08
    ldh [$9b], a

jr_000_033c::
    ret


    ld hl, $c761
    ld a, [hl]
    inc a
    cp $20
    jr c, jr_000_0348

    ld a, $1f

jr_000_0348::
    callx @+$ff79
    ldh a, [$9b]
    cp $60
    jr nc, jr_000_0362

    ld d, a
    sub e
    cpl
    inc a
    cp $80
    jr c, jr_000_0362

    ld a, d
    add $08
    ldh [$9b], a

jr_000_0362::
    ret


    ld a, [$c761]
    ld e, a
    ld d, $00
    ld hl, $c758
    trap IntToString
    ld hl, $0a22
    trap MovePen
    ld hl, $c75c
    trap DrawString
    ld a, [$c762]
    ld e, a
    ld d, $00
    ld hl, $c758
    trap IntToString
    ld hl, $0a23
    trap MovePen
    ld hl, $c75c
    trap DrawString
    ret


    ldh a, [$8b]
    ld e, a
    and $03
    ret z

    push de
    callx @+$0061
    pop de
    bit 0, e
    jr z, jr_000_03a2

    inc a

jr_000_03a2::
    bit 1, e
    jr z, jr_000_03a9

    ld a, [$c764]

jr_000_03a9::
    and $03
    ld [$c764], a
    ld d, a
    ld e, c
    bit 0, d
    jr nz, jr_000_03b6

    ld e, $00

jr_000_03b6::
    ld a, [hl]
    and b
    or e
    ld [hl+], a
    ld e, c
    bit 1, d
    jr nz, jr_000_03c1

    ld e, $00

jr_000_03c1::
    ld a, [hl]
    and b
    or e
    ld [hl-], a
    ld e, l
    ld d, h
    ld h, $91
    ld bc, $0002
    trap MemCopy
    ld a, [$c762]
    ld h, a
    ld l, $00
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld a, [$c761]
    or l
    ld l, a
    ld de, $9800
    add hl, de
    ld de, $c764
    ld bc, $0001
    trap MemCopy
    ret


data_03f2:
    add b
    ld b, b
    jr nz, jr_000_0406

    ld [$0204], sp
    ld bc, $61fa
    rst $00
    and $07
    ld e, a
    ld d, $00
    ldx hl, data_03f2

jr_000_0406::
    add hl, de
    ld a, [hl]
    ld c, a
    cpl
    ld b, a
    ld a, [$c761]
    and $f8
    add a
    ld l, a
    add a
    add l
    ld l, a
    ld a, [$c762]
    add a
    add l
    ld l, a
    ld h, $c6
    inc hl
    ld d, $00
    ld a, [hl-]
    and c
    jr z, jr_000_0425

    inc d

jr_000_0425::
    sla d
    ld a, [hl]
    and c
    jr z, jr_000_042c

    inc d

jr_000_042c::
    ld a, d
    ret


    xor a
    ld hl, $c761
    ld d, [hl]
    ld [hl+], a
    ld e, [hl]
    ld [hl-], a
    push de
    ld hl, $9800
    ld bc, $0400

jr_000_043d::
    push hl
    callx @+$ffb8
    pop hl
    ld [hl+], a
    ld de, $c761
    ld a, [de]
    inc a
    ld [de], a
    cp $20
    jr c, jr_000_043d

    xor a
    ld [de], a
    ld de, $c762
    ld a, [de]
    inc a
    ld [de], a
    cp $20
    jr c, jr_000_043d

    pop de
    ld hl, $c761
    ld [hl], d
    inc hl
    ld [hl], e
    ret


    trap LCDDisable
    callx @+$019a
    callx @+$0127
    ld de, $420d
    ld hl, $c700
    trap $54
    ld a, $06
    callx @+$026b
    ld de, $0107
    ld bc, $0605
    trap DrawBox
    ld a, $10
    ld de, $0208
    ld bc, $0403
    ld hl, $0301
    trap $59
    ld de, $0808
    ld bc, $0c03
    trap DrawBox
    ld a, $38
    ld de, $0909
    ld bc, $0a01
    ld hl, $0100
    trap $59
    ld a, $03
    trap LCDEnable
    ld de, $c769
    ld hl, $c791
    ld bc, $0028
    trap MemCopy
    ld de, $3801
    ld hl, $c791
    ld b, $0a
    trap $56
    ld a, $07
    callx @+$021f
    callx @+$0006
    ret c

    or a
    ret


jr_000_04dc::
    trap AwaitFrame
    trap $d8
    and $03
    jr z, jr_000_04dc

    or a
    bit 0, a
    ret nz

    scf
    ret


    ld hl, $c509
    ld b, [hl]
    inc hl
    inc hl
    ld a, [hl+]
    bit 4, b
    jr z, jr_000_04fd

    sub $60
    bit 3, b
    jr z, jr_000_04fd

    sub $60

jr_000_04fd::
    ld c, a
    ld de, $c768

jr_000_0501::
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_000_0501

    xor a
    ld [de], a
    ld hl, $c500
    ld de, $c600
    trap $64
    ret


call_0512:
    ld hl, $c500
    ld a, [hl+]
    or [hl]
    ret z

    callx @+$ffce
    scf
    ret


call_0521:
    callx @+$0080
    xor a
    ld [$c7b9], a
    ld a, $03
    ld [$c764], a
    ld hl, $c700
    ld bc, $0058
    ld e, $20
    trap MemSet
    ld hl, $c791
    ld bc, $0028
    ld e, $20
    trap MemSet
    xor a
    ld [$c769], a
    ld de, $c700
    trap $51
    ret


    ld a, $e4
    ldh [$9d], a
    ld a, $07
    ldh [$a0], a
    ld a, $70
    ldh [$9f], a
    ld a, [$c766]
    ldh [$9b], a
    ld a, [$c767]
    ldh [$9a], a
    callx @+$0030
    callx @+$fcbd
    ldx de, data_068e + $10
    ld hl, $9010
    ld bc, $0030
    trap MemCopy
    ldx de, data_06de
    ld hl, $8000
    ld bc, $0010
    trap MemCopy
    ldx hl, layout_0615
    trap DrawLayout
    callx @+$fdce
    ret


    ld hl, $9100
    ld de, $c600
    ld bc, $0100
    trap MemCopy
    ret


    xor a
    ld [$c766], a
    ld [$c767], a
    ldh [$9b], a
    ldh [$9a], a
    ld [$c761], a
    ld [$c762], a
    ld [$c765], a
    ld hl, $c600
    ld bc, $0100
    ld e, $00
    trap MemSet
    ret


call_05c4:
    callx @+$003d
    ld h, $04
    trap $ca
    ldx de, data_05f5
    ld hl, $9040
    ld bc, $0010
    trap MemCopy
    ld de, $0205
    ld bc, $1006
    trap DrawBox
    ld de, $0200
    ld bc, $1003
    trap DrawBox
    ldx hl, layout_0656
    ld de, $8001
    trap $5a
    ret


data_05f5:
    add b
    add b
    ldh [$e0], a
    ld hl, sp-$08
    cp $fe
    ld hl, sp-$02
    ldh [$f8], a
    add b
    ldh [rP1], a
    add b
    ld bc, $2800
    trap $c4
    ld hl, $9800
    ld bc, $0400
    ld e, $7f
    trap MemSet
    ret


layout_0615:
    dk $00, $20, "--------------------\n"
    db $00, $21, " psvy ICON EDIT\n"
    db $00, $22, " qtwz X =\n"
    db $00, $23, " rux", $a2, " ", "Y =\n"

layout_0656:
    dk $06, $01, "ICON EDIT\n"
    dk $05, $06, "へんしゅうする\n"
    dh $05, $07, "アイコンのセーブ\n"
    dk $05, $08, "しんきさくせい\n"
    dh $05, $09, "おわる\n"
    db $ff

data_068e:
    INCBIN "gfx/iconedit/shades.2bpp"

data_06ce:
    INCBIN "gfx/iconedit/grid.2bpp"

data_06de:
    INCBIN "gfx/iconedit/cursor.2bpp"


call_06ee:
    push af
    ld de, $0001
    ld bc, $1405
    trap DrawBox
    pop af
    ld de, $8001
    jr jr_000_072a

    bit 6, c
    jr z, call_071d

    xor a
    callx call_071d
    xor a
    scf
    ret


call_070c:
    bit 7, c
    jr z, call_071d

    ld a, b
    push bc
    callx call_071d
    pop bc
    ld a, b
    scf
    ret


call_071d::
    push af
    ld de, $000d
    ld bc, $1405
    trap DrawBox
    pop af
    ld de, $2001

jr_000_072a::
    add a
    ld c, a
    ld b, $00
    ldx hl, data_073c
    add hl, bc
    ld c, [hl]
    inc hl
    ld b, [hl]
    dec hl
    add hl, bc
    trap $5a
    or a
    ret



data_073c:
    dw data_0750 - @
    dw data_0793 - @
    dw data_0768 - @
    dw data_07bc - @
    dw 0
    dw 0
    dw data_07d9 - @
    dw data_07f8 - @
    dw data_081e - @
    dw data_084b - @

data_0750:
    dh $01, $0e, "アイコンパターンをへんしゅうします\n"
    db $ff

data_0768:
    dk $01, $0e, "げんざいのアイコンパターンをけして\n"
    dh $01, $0f, "あたらしくへんしゅうします\n"
    db $ff

data_0793:
    dk $01, $0e, "げんざいのアイコンパターンを\n"
    dh $01, $0f, "ファイルにほぞんします\n"
    db $ff

data_07bc:
    dk $01, $0e, "「ＩＣＯＮ　ＥＤＩＴ」を\n"
    dh $01, $0f, "しゅうりょうします\n"
    db $ff

data_07d9:
    dk $01, $02, "ほぞんするなまえをにゅうりょくして\n"
    dh $01, $03, "ください\n"
    db $ff

data_07f8:
    dk $01, $02, "このなまえでほぞんしていいですか？\n"
    dh $01, $03, "はい：Ａ　いいえ：Ｂ\n"
    db $ff

data_081e:
    dk $01, $02, "あきようりょうがたりなくてセーブ\n"
    dk $01, $03, "できませんでした\n"
    dh $01, $04, "ＯＫ：Ａ\n"
    db $ff

data_084b:
    dk $01, $02, "おなじなまえのファイルがあります\n"
    dh $01, $03, "うわがきしてほぞんしてもいいですか？\n"
    dh $01, $04, "はい：Ａ　いいえ：Ｂ\n"
    db $ff

    db $ff
