; Disassembly of "bakechu-relay.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

DEF id0 EQU "B"
DEF id1 EQU "K"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db kFileHasIcon2bpp + kFileMarkerCircle + kFileHasTransfers
    db CartridgeCodeUniversal  ; where file can run
    db .end - @ - 1            ; length of variable parts of header
    db $70                     ; owner code
.title
    dk "バケちゅリレー"
.icon
    INCBIN "gfx/baketu/icon.2bpp"
.end

History:
.points
    dw 1
.author
    dp "TOBI      ", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    trap StopAudio
    ld hl, $04bc
    trap TimerSet

MainMenu:
    ld sp, $e000
    xor a
    trap DrawInit
    trap LCDDisable
    ldx hl, LayoutMenu
    trap DrawLayout
    ld a, LCDCF_OBJON + LCDCF_BGON
    trap LCDEnable
    xor a
    ld [var_practice], a
    ldx de, .menuConfig
    trap DoCursorMenu
    jr c, MainMenu

    cp $00
    jr z, .practice

    cp $01
    jr z, .receive

    cp $0f
    jr c, .play

    trap ExitToMenu

.menuConfig
    db $10       ; item count
    db $05, $02  ; initial position
    db ">", " "  ; cursor characters
    dw 0         ; update callback

.practice
    ld a, $01
    ld [var_practice], a
    ld a, $02

.play
    inc a
    ld [var_target], a
    xor a
    ld hl, var_time.sec
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld a, $01
    ld [var_current], a

.jr_000_014f
    xor a
    ld [var_receiving], a
    callx call_040c
    callx call_01f0
    jr nc, .jr_000_014f

.jr_000_0163
    trap AwaitFrame
    trap $d8

    or a
    jr z, .jr_000_0163

    jr .jr_000_014f

.receive
    ld a, $20
    trap DrawInit
    callx call_08d8
    ld a, $50
    ld [var_mouse_pos], a
    callx call_052d
    ld a, $08
    ldh [$a0], a
    ld a, $18
    ldh [$9f], a
    ld a, LCDCF_OBJON + LCDCF_BGON + LCDCF_WINON + LCDCF_WIN9C00
    trap LCDEnable
    ld a, $14
    ld [var_cc96], a
.jr_0194
    ldx hl, LayoutWaitToReceive
    trap DrawLayout
    trap $c3
.jr_019c
    ld hl, var_ccc1
    ld [hl], id0
    inc hl
    ld [hl], id1
    trap IRListen
    ld a, $00
    ld hl, var_ccc1
    ld [hl+], a
    ld [hl+], a
    jr nc, .jr_000_01b9

    ld hl, var_cc96
    dec [hl]
    jr nz, .jr_019c

    jx MainMenu


.jr_000_01b9
    ld hl, var_current
    inc [hl]
    ld a, $01
    ld [var_receiving], a
    callx call_0702

.jr_000_01c9
    callx call_040c
    ld a, [var_sent]
    cp $01
    jr z, .jr_000_01e3

    ldx hl, LayoutCommError
    trap DrawLayout
    ld a, $b4
    trap $dc
    jr .jr_0194

.jr_000_01e3
    callx call_01f0
    xor a
    ld [var_receiving], a
    jr .jr_000_01c9

call_01f0:
    ldx hl, LayoutSending
    trap DrawLayout
    trap $c3
    ld a, $78
    trap $dc
    ld a, $03
    ld [var_cc96], a

.jr_000_0201
    ld hl, var_ccc1
    ld de, $c600
    ld c, $02
    trap IROpen
    jr c, .jr_000_022c

    ld hl, $c600
    ld a, [hl+]
    cp id0
    jr nz, .jr_000_022c

    ld a, [hl+]
    cp id1
    jr nz, .jr_000_022c

    ld hl, transmit_start
    ld de, transmit_start
    ld c, transmit_end - transmit_start
    trap IRSend
    jr c, .jr_000_022c

    trap IRClose
    jr c, .jr_000_022c

    or a
    ret


.jr_000_022c
    trap AwaitFrame
    ldh a, [$8a]
    and $02
    jr nz, .jr_000_022c

    ld hl, var_cc96
    dec [hl]
    jr nz, .jr_000_0201

    scf
    ret


LayoutSending:
    dk $05, $25, "«　　　　　　　　　\n"
    dh $05, $26, "　そうしんちゅう　\n"
    dh $05, $27, "　　　　　　　　　\n"
    db $ff

LayoutWaitToReceive:
    dk $03, $25, "«　　　　　　　　　　　　　　\n"
    dh $03, $26, "　じゅしん　たいきちゅう　　\n"
    dh $03, $27, "　　　　　　　　　　　　　　\n"
    db $ff

LayoutFinish:
    dk $05, $22, "          \n"
    dk $05, $23, " FINISH!! \n"
    dk $05, $24, "          \n"
    dk $05, $25, "          \n"
    dk $05, $27, "MENU:SEL+B\n"
    db $ff

LayoutCommError:
    dk $02, $25, "«　　　　　　　　　　　　　　　　\n"
    dh $02, $26, "　しっぱいしました，あらためて　\n"
    dh $02, $27, "　おくってもらって　ください　　\n"
    dh $02, $28, "　　　　　　　　　　　　　　　　\n"
    db $ff

LayoutReceived:
    dk $02, $25, "«　　　　　　　　　　　　　　　　\n"
    dh $02, $26, "　うけとりました　　　　　　　　\n"
    dh $02, $27, "　つぎのひとにわたしてください　\n"
    dh $02, $28, "　　　　　　　　　　　　　　　　\n"
    db $ff

LayoutMenu:
    dh $05, $00, "バケちゅリレー\n"
    dk $06, $02, "れんしゅう\n"
    dh $06, $03, "もらう\n"
    dh $06, $04, "わたす-3\n"
    dh $06, $05, "わたす-4\n"
    dh $06, $06, "わたす-5\n"
    dh $06, $07, "わたす-6\n"
    dh $06, $08, "わたす-7\n"
    dh $06, $09, "わたす-8\n"
    dh $06, $0a, "わたす-9\n"
    dh $06, $0b, "わたす-10\n"
    dh $06, $0c, "わたす-11\n"
    dh $06, $0d, "わたす-12\n"
    dh $06, $0e, "わたす-13\n"
    dh $06, $0f, "わたす-14\n"
    dh $06, $10, "わたす-15\n"
    dh $06, $11, "END\n"
    db $ff

call_040c:
    xor a
    trap DrawInit
    trap LCDDisable
    callx call_08d8
    xor a
    ldh [$9b], a
    ldh [$9a], a
    ld a, $08
    ldh [$a0], a
    ld a, $18
    ldh [$9f], a
    ld a, LCDCF_OBJON + LCDCF_BGON + LCDCF_WINON + LCDCF_WIN9C00
    trap LCDEnable
    xor a
    ld [var_cc65], a
    ld a, $50
    ld [var_mouse_pos], a
    xor a
    ld [var_motion], a
    ld [var_ccc9], a
    ld a, $ff
    ld [var_ball_pos.x], a
    ld hl, var_hole_pos
    ld [hl], $08
    inc hl
    ld [hl], $00
    callx call_070c
    xor a
    ldh [$83], a

.jr_000_0450
    xor a
    ld [var_sent], a
    ld [var_cccc], a

.jr_000_0457
    trap AwaitFrame
    callx call_0845
    trap $d8
    and $04
    jr nz, .jr_000_04c9

    ld bc, $2800
    trap $c4
    callx call_076b
    callx call_071d
    callx call_0762
    callx call_0689
    callx call_053c
    callx call_04f4
    callx call_052d
    callx call_0861
    ld a, [var_sent]
    or a
    jr z, .jr_000_0457

    cp $02
    jr z, .jr_000_04b7

    ld a, [var_target]
    ld b, a
    ld a, [var_current]
    cp b
    jr nc, .jr_000_04cd

.jr_000_04b7
    ld a, [var_practice]
    or a
    ret z

    ld a, [var_sent]
    cp $02
    jr z, .jr_000_0450

    ld hl, var_current
    inc [hl]
    jr .jr_000_0450

.jr_000_04c9
    jx MainMenu


.jr_000_04cd
    ldx hl, LayoutFinish
    trap DrawLayout
    ld hl, $0724
    trap MoveCursor
    ld hl, var_status + 12
    trap DrawString
    ld a, $1e
    callx call_0916

.jr_000_04e6
    trap AwaitFrame
    trap $d8
    ldh a, [$8a]
    and $06
    cp $06
    jr nz, .jr_000_04e6

    jr .jr_000_04c9


call_04f4:
    ld hl, var_motion
    ldh a, [$8a]
    ld b, a
    ld hl, var_mouse_pos
    ld a, [hl]
    bit BtnA, b
    jr z, .jr_000_0506

    ld c, $00
    jr .jr_000_0521

.jr_000_0506
    bit BtnLt, b
    jr z, .jr_000_0514

    ld c, $20
    dec a
    cp $08
    jr nc, .jr_000_0520

    inc a
    jr .jr_000_0520

.jr_000_0514
    bit BtnRt, b
    jr z, .jr_000_0529

    ld c, $10
    inc a
    cp $90
    jr c, .jr_000_0520

    dec a

.jr_000_0520
    ld [hl], a

.jr_000_0521
    dec hl
    ld a, [hl]
    inc a
    and $0f
    or c
    ld [hl], a
    ret


.jr_000_0529
    dec hl
    ld [hl], $00
    ret


call_052d:
    ld hl, var_motion
    ld a, [hl+]
    srl a
    srl a
    add $04
    ld d, [hl]
    ld e, $78
    jr call_053c.jr_000_054b


call_053c:
    ld a, [var_ccc9]
    srl a
    srl a
    srl a
    ld hl, var_ball_pos.x
    ld d, [hl]
    inc hl
    ld e, [hl]

.jr_000_054b
    ld l, a
    ld h, $00
    add hl, hl
    ldx bc, Sprites
    add hl, bc
    ld c, [hl]
    inc hl
    ld b, [hl]
    dec hl
    add hl, bc
    ld a, $ff
    trap $60
    ret


Sprites:
    dw .ball - @
    dw .splat1 - @
    dw .splat2 - @
    dw .splat3 - @
    dw .mouseWait1 - @
    dw .mouseWait1 - @
    dw .mouseWait1 - @
    dw .mouseWait1 - @
    dw .mouseRight1 - @
    dw .mouseRight2 - @
    dw .mouseRight1 - @
    dw .mouseRight3 - @
    dw .mouseLeft1 - @
    dw .mouseLeft2 - @
    dw .mouseLeft1 - @
    dw .mouseLeft3 - @

.ball
    db $01
    db $00, $00, $1e, 0

.splat1
    db $04
    db $fc, $fc, $1f, 0
    db $04, $fc, $20, 0
    db $fc, $04, $21, 0
    db $04, $04, $22, 0

.splat2
    db $04
    db $fc, $fc, $23, 0
    db $04, $fc, $24, 0
    db $fc, $04, $25, 0
    db $04, $04, $26, 0

.splat3
    db $04
    db $fc, $fc, $27, 0
    db $04, $fc, $28, 0
    db $fc, $04, $29, 0
    db $04, $04, $2a, 0

.mouseWait1
    db $09
    db $00, $00, $00, 0
    db $08, $00, $01, 0
    db $10, $00, $02, 0
    db $00, $08, $03, 0
    db $08, $08, $04, 0
    db $10, $08, $05, 0
    db $00, $10, $06, 0
    db $08, $10, $07, 0
    db $10, $10, $08, 0

.mouseRight1
    db $07
    db $00, $00, $09, 0
    db $08, $00, $0a, 0
    db $10, $00, $0b, 0
    db $08, $08, $0c, 0
    db $10, $08, $0d, 0
    db $08, $10, $0e, 0
    db $10, $10, $0f, 0

.mouseRight2
    db $07
    db $00, $00, $10, 0
    db $08, $00, $11, 0
    db $10, $00, $12, 0
    db $08, $08, $13, 0
    db $10, $08, $14, 0
    db $08, $10, $15, 0
    db $10, $10, $16, 0

.mouseRight3
    db $07
    db $00, $00, $17, 0
    db $08, $00, $18, 0
    db $10, $00, $19, 0
    db $08, $08, $1a, 0
    db $10, $08, $1b, 0
    db $08, $10, $1c, 0
    db $10, $10, $1d, 0

.mouseLeft1
    db $07
    db $08, $00, $0e, OAMF_XFLIP
    db $10, $00, $0f, OAMF_XFLIP
    db $08, $08, $0c, OAMF_XFLIP
    db $10, $08, $0d, OAMF_XFLIP
    db $00, $10, $09, OAMF_XFLIP
    db $08, $10, $0a, OAMF_XFLIP
    db $10, $10, $0b, OAMF_XFLIP

.mouseLeft2
    db $07
    db $08, $00, $15, OAMF_XFLIP
    db $10, $00, $16, OAMF_XFLIP
    db $08, $08, $13, OAMF_XFLIP
    db $10, $08, $14, OAMF_XFLIP
    db $00, $10, $10, OAMF_XFLIP
    db $08, $10, $11, OAMF_XFLIP
    db $10, $10, $12, OAMF_XFLIP

.mouseLeft3
    db $07
    db $08, $00, $1c, OAMF_XFLIP
    db $10, $00, $1d, OAMF_XFLIP
    db $08, $08, $1a, OAMF_XFLIP
    db $10, $08, $1b, OAMF_XFLIP
    db $00, $10, $17, OAMF_XFLIP
    db $08, $10, $18, OAMF_XFLIP
    db $10, $10, $19, OAMF_XFLIP

call_0689:
    ld hl, var_ccc9
    ld a, [hl]
    or a
    jr z, .jr_000_06a9

    inc [hl]
    ld a, [hl]
    cp $17
    ret c

    ld [hl], $00
    inc hl
    ld [hl], $ff
    ld a, [var_receiving]
    or a
    ret z

    ld a, [var_ccc3]
    ld [var_sent], a
    jx call_0702


.jr_000_06a9
    ld a, [var_receiving]
    or a
    jr nz, .jr_000_06d3

    ld hl, var_ball_pos.x
    ld a, [hl+]
    cp $ff
    jr z, .jr_000_06b9

    dec [hl]
    ret


.jr_000_06b9
    ldh a, [$8b]
    and $01
    ret z

    ld a, $25
    callx call_0916
    ld a, [var_mouse_pos]
    add $08
    ld hl, var_ball_pos.x
    ld [hl+], a
    ld [hl], $74
    ret


.jr_000_06d3
    ld hl, var_ball_pos.x
    ld a, [hl+]
    cp $ff
    jr z, .jr_000_06eb

    inc [hl]
    ld a, [hl]
    cp $88
    ret c

    ld a, $01
    ld [var_ccc9], a
    ld a, $0f
    jx call_0916


.jr_000_06eb
    ld a, [var_hole_pos]
    add $08
    ld b, a
    ld a, [var_ccd1]
    cp b
    ret nz

    ld hl, var_ball_pos.x
    ld [hl+], a
    ld [hl], $18
    ld a, $07
    jx call_0916


call_0702:
    trap RandNext
    and $7f
    add $10
    ld [var_ccd1], a
    ret


call_070c:
    trap RandNext
    and $3f
    ld [var_ccd0], a
    trap RandNext
    and $07
    add $0a
    ld [var_hole_speed], a
    ret


call_071d:
    ld hl, var_cccc
    ld a, [hl]
    or a
    jr z, .jr_000_072b

    ld a, [var_ccc3]
    ld [var_sent], a
    ret


.jr_000_072b
    ld hl, var_ccd0
    ld a, [var_hole_speed]
    add [hl]
    ld [hl], a
    jr nc, .jr_000_0735

.jr_000_0735
    ld hl, var_hole_pos
    ld d, [hl]
    inc hl
    ld e, [hl]
    ld a, [var_hole_speed]
    ld l, a
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, de
    ld e, l
    ld d, h
    ld a, d
    cp $f0
    jr nc, .jr_000_075b

    cp $a8
    jr c, .jr_000_075b

    callx call_070c
    ld de, $f000

.jr_000_075b
    ld hl, var_hole_pos
    ld [hl], d
    inc hl
    ld [hl], e
    ret


call_0762:
    ld hl, var_hole_pos
    ld a, $b0
    sub [hl]
    ldh [$9b], a
    ret


call_076b:
    ld a, [var_ccc9]
    or a
    ret nz

    ld a, [var_receiving]
    or a
    jr nz, .jr_000_07c6

    ld hl, var_ball_pos.x
    ld a, [hl+]
    cp $ff
    jr z, .jr_079e

    ld d, a
    ld a, [hl]
    cp $21
    jr nc, .jr_079e

    ld a, [var_hole_pos]
    sub $02
    ld e, a
    ld a, d
    sub e
    cp $15
    jr c, .jr_000_07a0

    ld a, $01
    ld [var_ccc9], a
    ld a, $0f
    callx call_0916

.jr_079e
    or a
    ret


.jr_000_07a0
    ld a, $ff
    ld [var_ball_pos.x], a
    ld hl, var_cc65
    inc [hl]
    ld a, $01
    ld [var_receiving], a
    ld [var_ccc3], a
    ld [var_cccc], a
    callx call_0702
    ld a, $04
    callx call_0916
    scf
    ret


.jr_000_07c6
    ld hl, var_ball_pos.x
    ld a, [hl+]
    cp $ff
    jr z, .jr_000_0824

    ld a, [hl-]
    cp $74
    jr nz, .jr_000_0824

    ld a, [var_mouse_pos]
    sub $02
    ld b, a
    ld a, [hl]
    sub b
    cp $15
    jr nc, .jr_000_081f

    ld [hl], $ff
    ld hl, var_cc65
    inc [hl]
    callx call_0702
    xor a
    ld [var_receiving], a
    ld a, $20
    callx call_0916
    ld a, [var_practice]
    or a
    jr nz, .jr_000_081d
    callx call_052d
    ldx hl, LayoutReceived
    trap DrawLayout
    ld a, $78
    trap $dc
    trap LCDDisable
    callx call_08d8
    ld a, LCDCF_OBJON + LCDCF_BGON + LCDCF_WINON + LCDCF_WIN9C00
    trap LCDEnable

.jr_000_081d
    scf
    ret


.jr_000_081f
    ld a, $02
    ld [var_ccc3], a

.jr_000_0824
    or a
    ret


call_0826:
    ldx hl, layout_083d
    trap DrawLayout
    ld a, [var_cc65]
    ld e, a
    ld d, $00
    ld hl, var_status
    trap IntToString
    ld hl, var_status + 3
    trap DrawString
    ret


layout_083d:
    dk $03, $0a, "HIT=\n"
    db $ff


call_0845:
    ldh a, [$83]
    sub $06
    ret c

    ldh [$83], a
    ld hl, var_time.sub
    inc [hl]
    ld a, [hl]
    cp $0a
    ret c

    ld [hl], $00
    inc hl
    inc [hl]
    ld a, [hl]
    cp $3c
    ret c

    ld [hl], $00
    inc hl
    inc [hl]
    ret


call_0861:
    ld hl, var_status
    ldx de, data_08b4
    callx call_08d1
    ld a, [var_current]
    callx call_08c0
    ldx de, data_08b9
    callx call_08d1
    ld a, [var_time.min]
    callx call_08c0
    ld [hl], ":"
    inc hl
    ld a, [var_time.sec]
    callx call_08c0
    ld [hl], "."
    inc hl
    ld a, [var_time.sub]
    add "0"
    ld [hl+], a
    ld [hl], "\n"
    ld de, $012e
    trap $57
    ld de, var_status
    ld bc, var_status.end - var_status
    trap MemCopy
    ret


data_08b4:
    dk "MAN:\n"
data_08b9:
    dk " TIME \n"


call_08c0:
    ld c, "0" - 1

.jr_000_08c2
    inc c
    sub 10
    jr nc, .jr_000_08c2

    add 10
    ld b, a
    ld [hl], c
    inc hl
    ld a, b
    add "0"
    ld [hl+], a
    ret


call_08d1:
    ld a, [de]
    inc de
    or a
    ret z

    ld [hl+], a
    jr call_08d1


call_08d8:
    ld b, $c6
    ldx de, data_0928
    trap InitDecompress
    ld de, $8b00
    ld bc, $0190
    trap RunDecompress
    ld de, $8000
    ld bc, $02b0
    trap RunDecompress
    ld de, $9800
    ld c, $03
    callx call_0901
    ld c, $0f
    ld de, $9c00

call_0901:
    push bc
    ld bc, $0020
    trap RunDecompress
    ld b, $20

.jr_000_0909
    ld a, [de]
    add $b0
    ld [de], a
    inc de
    dec b
    jr nz, .jr_000_0909

    pop bc
    dec c
    jr nz, call_0901

    ret


call_0916:
    push af
    ld a, [CartridgeCodeAddress]
    cp CartridgeCodeSuperBDaman
    jr z, .jr_000_0924

    cp CartridgeCodeGBKissMiniGames
    jr z, .jr_000_0924

    pop af
    ret


.jr_000_0924
    pop af
    trap PlaySound
    ret


data_0928:
    INCBIN "gfx/baketu/tiles.2bpp.hz"

SECTION "Status Bar", WRAM0[$cc40]

var_status:
    ds 19
.end

SECTION "Variables", WRAM0[$ccc1]

var_ccc1:
    dw
var_ccc3:
    db
var_sent:
    db  ; 0 → playing; 1 → ready to send, or finished
var_receiving:
    db  ; 0 → passing; 1 → receiving
var_practice:
    db  ; 0 → real play; 1 → practice mode
var_motion:
    db
var_mouse_pos:
    db
var_ccc9:
    db
var_ball_pos:
.x  db  ; $ff → no current ball
.y  db
var_cccc:
    db
var_hole_pos:
    db
    db
var_hole_speed:
    db
var_ccd0:
    db
var_ccd1:
    db

transmit_start:
var_target:
    db  ; 3-15; set from menu
var_current:
    db  ; initially 1; victory when = var_target
var_time:
.sub  db
.sec  db
.min  db
transmit_end:

SECTION "Variables 2", WRAM0[$cc65]

var_cc65:
    db

SECTION "Variables 3", WRAM0[$cc96]

var_cc96:
    db
