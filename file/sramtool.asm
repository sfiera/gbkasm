; Disassembly of "sram-get-and-clear.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $00           ; owner code
.title
    dk "SRAM GET&CLR"
.icon
.end

History:
.points
    dw 1
.author
    dp "Y.MOTOSAKO", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    xor a
    trap DrawInit
    callx call_0282
    jr c, .jr_0056

    or a
    jr z, .jr_0058

    dec a
    jr nz, .jr_0056

    jx call_0171


.jr_0056
    trap ExitToMenu

.jr_0058
    ldx hl, data_0090
    trap DrawString
    ld hl, $000e
    trap DrawAt
    ldx hl, data_013f
    trap DrawString
    ld hl, $010f
    ld d, $20
    ld e, $3e
    ld bc, $0201
    trap $5e
    jr c, .jr_008e

    or a
    jr nz, .jr_008e

    ld hl, $0010
    trap DrawAt
    callx call_030d
    trap DrawString
    trap $db
    ld a, $78
    trap $dc

.jr_008e
    trap ExitToMenu


data_0090:
    dh $0c, "　　バックアップデータの　コピー\r"
    dk "\r"
    dk "\r"
    dk "あいてのゲームボーイは　ＧＢ　ＫＩＳＳ　\r"
    dh "メニューで　ＳＴＡＲＴボタンを　おして　\r"
    dh "つうしんじゅんびちゅう　にしてください。\r"
    dh "\r"
    dh "じぶんの　バックアップデータは　うわがき\r"
    dh "されて　きえてしまいます»\0"
    dk "\0"

data_0125:
    dh "バックアップデータを　すべて　けします　"

data_013f:
    dk "«　　　　　　よろしいですか？　　　　　　"
    dh "　　はい\r"
    dh "　　いいえ»\0"

data_0161:
    dk "«　　すべて　けしました！»\0"

call_0171:
    ld hl, $000e
    trap DrawAt
    ldx hl, data_0125
    trap DrawString
    ld hl, $0110
    ld d, $20
    ld e, $3e
    ld bc, $0201
    trap $5e
    jr c, .jr_01a3

    or a
    jr nz, .jr_01a3

    callx call_03a4
    ld hl, $0011
    trap DrawAt
    ldx hl, data_0161
    trap DrawString
    ld a, $78
    trap $dc

.jr_01a3
    trap ExitToMenu


data_01a5:
    dk "　　　　ＳＲＡＭ　ＧＥＴ＆ＣＬＲ\r"
    dk "\r"
    dk "このプログラムは　あいてのゲームボーイの\r"
    dh "バックアップデータをじぶんのゲームボーイ\r"
    dk "にコピーしたり、じぶんのゲームボーイの　\r"
    dh "バックアップデータを　すべて　けすための\r"
    dh "ものです。あつかいには　じゅうぶん　きを\r"
    dh "つけてください。\r"
    dh "\r"
    dh "　　バックアップデータの　コピー\r"
    dh "　　バックアップデータの　しょうきょ»", $00

call_0282:
    ldx hl, data_01a5
    trap DrawString
    ld hl, $010e
    ld d, $20
    ld e, $3e
    ld bc, $0200
    trap $5e
    ret

data_0295:
    dk "GB KISS MENU "

data_02a2:
    dk "«　　すべて　じゅしんしました！»\0"

data_02b6:
    dk "じゅしんエラーがはっせいしました！»\0"

data_02ce:
    dk "あいての　じょうたいが　いじょうです»\0"

data_02e7:
    dk "おなじカートリッジではありません»\0"

jr_02ff:
    trap IRClose
    ldx hl, data_02ce
    ret


jr_0306:
    trap IRClose
    ldx hl, data_02e7
    ret


call_030d:
    ld hl, $ce00
    ld de, $c700
    ld c, $10
    trap IROpen
    jr c, .jr_037a

    ldx hl, data_0295
    ld de, $c702
    ld bc, $000d
    trap $67
    ld a, h
    or l
    jr nz, jr_02ff

    ld hl, $0014
    ld de, $c700
    ld c, $04
    trap IROpen
    jr c, .jr_037a

    ld hl, $0014
    ld de, $c700
    ld bc, $0004
    trap $67
    ld a, h
    or l
    jr nz, jr_0306

    ld a, $01
    ld [$c700], a
    ld de, $ce00
    ld hl, $c700
    ld c, $01
    trap IRSend
    jr c, .jr_037a

    trap IRClose
    callx call_040d

.jr_035e
    ld a, c
    cp b
    jr c, .jr_037f

    ld a, $02
    ld [$c700], a
    ld de, $ce00
    ld hl, $c700
    ld c, $01
    trap IRSend
    jr c, .jr_037a

    trap IRClose
    ldx hl, data_02a2
    ret


.jr_037a
    ldx hl, data_02b6
    ret


.jr_037f
    push bc
    push hl
    callx call_03f6
    pop hl
    pop bc
    jr c, .jr_037a

    push bc
    push hl
    callx call_03d7
    pop hl
    pop bc
    ld l, $00
    inc h
    ld a, h
    cp $20
    jr c, .jr_037f

    ld h, $00
    inc c
    jr .jr_035e


call_03a4:
    ld hl, $c600
    ld de, $4193
    ld b, $80

.jr_03ac
    ld [hl], d
    inc hl
    ld [hl], e
    inc hl
    dec b
    jr nz, .jr_03ac

    callx call_040d

.jr_03ba
    ld a, c
    cp b
    jr c, .jr_03bf

    ret


.jr_03bf
    push bc
    push hl
    callx call_03d7
    pop hl
    pop bc
    ld l, $00
    inc h
    ld a, h
    cp $20
    jr c, .jr_03bf

    ld h, $00
    inc c
    jr .jr_03ba


call_03d7:
    ld a, c
    and $fc
    ldh [$97], a
    ld a, c
    rrca
    rrca
    rrca
    and $60
    or h
    ld d, a
    ld e, l
    ld hl, $c600
    ld l, e
    ld bc, $0100
    ld a, c
    sub e
    ld c, a
    ld a, b
    sbc $00
    ld b, a
    trap $e5
    ret


call_03f6:
    ld a, c
    rrca
    rrca
    rrca
    ld b, a
    and $e0
    or h
    ld h, a
    ld de, $c600
    ld e, l
    ld a, b
    and $1f
    ld b, a
    xor a
    sub l
    ld c, a
    trap $7b
    ret


call_040d:
    ld hl, $0015
    ld c, [hl]
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, d
    and $1f
    ld d, a
    ld hl, $0080
    add hl, de
    ld a, h
    cp $20
    jr c, .jr_0425

    inc c
    ld h, $00

.jr_0425
    ld b, $04
    ld a, [$0149]
    cp $03
    ret z

    ld b, $10
    ret nc

    ld b, $00
    ret
