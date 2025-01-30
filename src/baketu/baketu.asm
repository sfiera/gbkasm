; Disassembly of "bakechu-relay.gbf"

INCLUDE "src/charmap.inc"
INCLUDE "src/common.inc"
INCLUDE "src/hardware.inc"
INCLUDE "src/macro.inc"
INCLUDE "src/trap.inc"

DEF IR_ID0 EQU "B"
DEF IR_ID1 EQU "K"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_ICON | FILE_2BPP | FILE_EXEC | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $70           ; owner code
.title
    dk "バケちゅリレー"
.icon
    INCBIN "out/baketu/icon.2bpp"
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
    trap AudioStop
    ld hl, $04bc
    trap TimerSet

MainMenu:
    ld sp, $e000
    xor a
    trap DrawInit
    trap LCDDisable
    ldx hl, LayoutMenu
    trap DrawLayout
    ld a, LCDCF_OBJON | LCDCF_BGON
    trap LCDEnable
    xor a
    ld [var_practice], a
    ldx de, .menuConfig
    trap InputCursorMenu
    jr c, MainMenu

    cp $00
    jr z, Practice

    cp $01
    jr z, Receive

    cp $0f
    jr c, StartGame

    trap ExitToMenu

.menuConfig
    db $10       ; item count
    db $05, $02  ; initial position
    db ">", " "  ; cursor characters
    dw 0         ; update callback

Practice:
    ld a, $01
    ld [var_practice], a
    ld a, $02

StartGame:
    inc a
    ld [var_target], a
    xor a
    ld hl, var_time.sec
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld a, $01
    ld [var_current], a

.replay
    xor a
    ld [var_receiving], a
    callx PlayGame
    callx Transmit
    jr nc, .replay

.jr_000_0163
    trap AwaitFrame
    trap InputButtons

    or a
    jr z, .jr_000_0163

    jr .replay

Receive:
    ld a, $20
    trap DrawInit
    callx call_08d8
    ld a, $50
    ld [var_mouse_pos], a
    callx call_052d
    ld a, $08
    ldh [$ffa0], a
    ld a, $18
    ldh [$ff9f], a
    ld a, LCDCF_OBJON | LCDCF_BGON | LCDCF_WINON | LCDCF_WIN9C00
    trap LCDEnable
    ld a, $14
    ld [var_retries], a
.jr_0194
    ldx hl, LayoutWaitToReceive
    trap DrawLayout
    trap AwaitBlit
.retry
    ld hl, var_ccc1
    ld [hl], IR_ID0
    inc hl
    ld [hl], IR_ID1
    trap IRListen
    ld a, $00
    ld hl, var_ccc1
    ld [hl+], a
    ld [hl+], a
    jr nc, .accept

    ld hl, var_retries
    dec [hl]
    jr nz, .retry

    jx MainMenu


.accept
    ld hl, var_current
    inc [hl]
    ld a, $01
    ld [var_receiving], a
    callx SetExitPoint

.jr_000_01c9
    callx PlayGame
    ld a, [var_sent]
    cp $01
    jr z, .jr_000_01e3

    ldx hl, LayoutCommError
    trap DrawLayout
    ld a, $b4
    trap AwaitButton
    jr .jr_0194

.jr_000_01e3
    callx Transmit
    xor a
    ld [var_receiving], a
    jr .jr_000_01c9


Transmit:
    ldx hl, LayoutSending
    trap DrawLayout
    trap AwaitBlit
    ld a, $78
    trap AwaitButton
    ld a, $03
    ld [var_retries], a

.retry
    ld hl, var_ccc1
    ld de, $c600
    ld c, $02
    trap IRRead
    jr c, .cancel

    ld hl, $c600
    ld a, [hl+]
    cp IR_ID0
    jr nz, .cancel

    ld a, [hl+]
    cp IR_ID1
    jr nz, .cancel

    ld hl, transmit_start
    ld de, transmit_start
    ld c, transmit_end - transmit_start
    trap IRWrite
    jr c, .cancel

    trap IRClose
    jr c, .cancel

    or a
    ret


.cancel
    trap AwaitFrame
    ldh a, [$ff8a]
    and BTN_B
    jr nz, .cancel

    ld hl, var_retries
    dec [hl]
    jr nz, .retry

    scf
    ret


LayoutSending:
    dk $05, $25, "«　　　　　　　　　\0"
    dh $05, $26, "　そうしんちゅう　\0"
    dh $05, $27, "　　　　　　　　　\0"
    db $ff

LayoutWaitToReceive:
    dk $03, $25, "«　　　　　　　　　　　　　　\0"
    dh $03, $26, "　じゅしん　たいきちゅう　　\0"
    dh $03, $27, "　　　　　　　　　　　　　　\0"
    db $ff

LayoutFinish:
    dk $05, $22, "          \0"
    dk $05, $23, " FINISH!! \0"
    dk $05, $24, "          \0"
    dk $05, $25, "          \0"
    dk $05, $27, "MENU:SEL+B\0"
    db $ff

LayoutCommError:
    dk $02, $25, "«　　　　　　　　　　　　　　　　\0"
    dh $02, $26, "　しっぱいしました，あらためて　\0"
    dh $02, $27, "　おくってもらって　ください　　\0"
    dh $02, $28, "　　　　　　　　　　　　　　　　\0"
    db $ff

LayoutReceived:
    dk $02, $25, "«　　　　　　　　　　　　　　　　\0"
    dh $02, $26, "　うけとりました　　　　　　　　\0"
    dh $02, $27, "　つぎのひとにわたしてください　\0"
    dh $02, $28, "　　　　　　　　　　　　　　　　\0"
    db $ff

LayoutMenu:
    dh $05, $00, "バケちゅリレー\0"
    dk $06, $02, "れんしゅう\0"
    dh $06, $03, "もらう\0"
    dh $06, $04, "わたす-3\0"
    dh $06, $05, "わたす-4\0"
    dh $06, $06, "わたす-5\0"
    dh $06, $07, "わたす-6\0"
    dh $06, $08, "わたす-7\0"
    dh $06, $09, "わたす-8\0"
    dh $06, $0a, "わたす-9\0"
    dh $06, $0b, "わたす-10\0"
    dh $06, $0c, "わたす-11\0"
    dh $06, $0d, "わたす-12\0"
    dh $06, $0e, "わたす-13\0"
    dh $06, $0f, "わたす-14\0"
    dh $06, $10, "わたす-15\0"
    dh $06, $11, "END\0"
    db $ff

PlayGame:
    xor a
    trap DrawInit
    trap LCDDisable
    callx call_08d8
    xor a
    ldh [$ff9b], a
    ldh [$ff9a], a
    ld a, $08
    ldh [$ffa0], a
    ld a, $18
    ldh [$ff9f], a
    ld a, LCDCF_OBJON | LCDCF_BGON | LCDCF_WINON | LCDCF_WIN9C00
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
    ldh [$ff83], a

.start
    xor a
    ld [var_sent], a
    ld [var_cccc], a

.nextFrame
    trap AwaitFrame
    callx UpdateTimer
    trap InputButtons
    and BTN_SEL
    jr nz, .exit

    ld bc, $2800
    trap $c4
    callx UpdateBall
    callx call_071d
    callx call_0762
    callx call_0689
    callx call_053c
    callx UpdateMouse
    callx call_052d
    callx UpdateStatusBar
    ld a, [var_sent]
    or a
    jr z, .nextFrame

    cp $02
    jr z, .throwSucceeded

    ld a, [var_target]
    ld b, a
    ld a, [var_current]
    cp b
    jr nc, .finished

.throwSucceeded
    ld a, [var_practice]
    or a
    ret z

    ld a, [var_sent]
    cp $02
    jr z, .start

    ld hl, var_current
    inc [hl]
    jr .start

.exit
    jx MainMenu


.finished
    ldx hl, LayoutFinish
    trap DrawLayout
    ld hl, $0724
    trap DrawAt
    ld hl, var_status | 12
    trap DrawString
    ld a, $1e
    callx call_0916

.awaitExit
    trap AwaitFrame
    trap InputButtons
    ldh a, [$ff8a]
    and BTN_SEL | BTN_B
    cp BTN_SEL | BTN_B
    jr nz, .awaitExit

    jr .exit


UpdateMouse:
    ld hl, var_motion
    ldh a, [$ff8a]
    ld b, a
    ld hl, var_mouse_pos
    ld a, [hl]
    bit BTN_A_F, b
    jr z, .noA

    ld c, $00
    jr .jr_000_0521

.noA
    bit BTN_LT_F, b
    jr z, .noLeft

    ld c, $20
    dec a
    cp $08
    jr nc, .noRight

    inc a
    jr .noRight

.noLeft
    bit BTN_RT_F, b
    jr z, .jr_000_0529

    ld c, $10
    inc a
    cp $90
    jr c, .noRight

    dec a

.noRight
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
    db 1
    db 0, 0, $1e, 0

.splat1
    db 4
    db -4, -4, $1f, 0
    db +4, -4, $20, 0
    db -4, +4, $21, 0
    db +4, +4, $22, 0

.splat2
    db 4
    db -4, -4, $23, 0
    db +4, -4, $24, 0
    db -4, +4, $25, 0
    db +4, +4, $26, 0

.splat3
    db 4
    db -4, -4, $27, 0
    db +4, -4, $28, 0
    db -4, +4, $29, 0
    db +4, +4, $2a, 0

.mouseWait1
    db 9
    db  0,  0, $00, 0
    db  8,  0, $01, 0
    db 16,  0, $02, 0
    db  0,  8, $03, 0
    db  8,  8, $04, 0
    db 16,  8, $05, 0
    db  0, 16, $06, 0
    db  8, 16, $07, 0
    db 16, 16, $08, 0

.mouseRight1
    db 7
    db  0,  0, $09, 0
    db  8,  0, $0a, 0
    db 16,  0, $0b, 0
    db  8,  8, $0c, 0
    db 16,  8, $0d, 0
    db  8, 16, $0e, 0
    db 16, 16, $0f, 0

.mouseRight2
    db 7
    db  0,  0, $10, 0
    db  8,  0, $11, 0
    db 16,  0, $12, 0
    db  8,  8, $13, 0
    db 16,  8, $14, 0
    db  8, 16, $15, 0
    db 16, 16, $16, 0

.mouseRight3
    db 7
    db  0,  0, $17, 0
    db  8,  0, $18, 0
    db 16,  0, $19, 0
    db  8,  8, $1a, 0
    db 16,  8, $1b, 0
    db  8, 16, $1c, 0
    db 16, 16, $1d, 0

.mouseLeft1
    db 7
    db  8,  0, $0e, OAMF_XFLIP
    db 16,  0, $0f, OAMF_XFLIP
    db  8,  8, $0c, OAMF_XFLIP
    db 16,  8, $0d, OAMF_XFLIP
    db  0, 16, $09, OAMF_XFLIP
    db  8, 16, $0a, OAMF_XFLIP
    db 16, 16, $0b, OAMF_XFLIP

.mouseLeft2
    db 7
    db  8,  0, $15, OAMF_XFLIP
    db 16,  0, $16, OAMF_XFLIP
    db  8,  8, $13, OAMF_XFLIP
    db 16,  8, $14, OAMF_XFLIP
    db  0, 16, $10, OAMF_XFLIP
    db  8, 16, $11, OAMF_XFLIP
    db 16, 16, $12, OAMF_XFLIP

.mouseLeft3
    db 7
    db  8,  0, $1c, OAMF_XFLIP
    db 16,  0, $1d, OAMF_XFLIP
    db  8,  8, $1a, OAMF_XFLIP
    db 16,  8, $1b, OAMF_XFLIP
    db  0, 16, $17, OAMF_XFLIP
    db  8, 16, $18, OAMF_XFLIP
    db 16, 16, $19, OAMF_XFLIP

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
    jx SetExitPoint


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
    ldh a, [$ff8b]
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
    ld a, [var_exit_point]
    cp b
    ret nz

    ld hl, var_ball_pos.x
    ld [hl+], a
    ld [hl], $18
    ld a, $07
    jx call_0916


SetExitPoint:
    trap RandNext
    and $7f
    add $10
    ld [var_exit_point], a
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
    ldh [$ff9b], a
    ret


UpdateBall:
    ld a, [var_ccc9]
    or a
    ret nz

    ld a, [var_receiving]
    or a
    jr nz, .jr_000_07c6

    ld hl, var_ball_pos.x
    ld a, [hl+]
    cp $ff
    jr z, .noBall

    ld d, a
    ld a, [hl]
    cp $21
    jr nc, .noBall

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

.noBall
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
    callx SetExitPoint
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
    callx SetExitPoint
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
    trap AwaitButton
    trap LCDDisable
    callx call_08d8
    ld a, LCDCF_OBJON | LCDCF_BGON | LCDCF_WINON | LCDCF_WIN9C00
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


PrintDebugInfo:
    ldx hl, layout_083d
    trap DrawLayout
    ld a, [var_cc65]
    ld e, a
    ld d, $00
    ld hl, var_status
    trap StrConvInt
    ld hl, var_status | 3
    trap DrawString
    ret


layout_083d:
    dk $03, $0a, "HIT=\0"
    db $ff


UpdateTimer:
    ldh a, [$ff83]
    sub $06
    ret c

    ldh [$ff83], a
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


UpdateStatusBar:
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
    ld [hl], "\0"
    ld de, $012e
    trap $57
    ld de, var_status
    ld bc, var_status.end - var_status
    trap MemCopy
    ret


data_08b4:
    dk "MAN:\0"
data_08b9:
    dk " TIME \0"


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
    trap ExtractInit
    ld de, $8b00
    ld bc, $0190
    trap ExtractData
    ld de, $8000
    ld bc, $02b0
    trap ExtractData
    ld de, $9800
    ld c, $03
    callx call_0901
    ld c, $0f
    ld de, $9c00

call_0901:
    push bc
    ld bc, $0020
    trap ExtractData
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
    ld a, [CartridgeCodeAddr]
    cp CART_BDAMAN
    jr z, .jr_000_0924

    cp CART_MINIGAME
    jr z, .jr_000_0924

    pop af
    ret


.jr_000_0924
    pop af
    trap AudioPlaySound
    ret


data_0928:
    INCBIN "out/baketu/tiles.hz"

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
var_exit_point:
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

var_retries:
    db
