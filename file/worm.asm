; Disassembly of "gbkiss.gb"

INCLUDE "charmap.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

DEF SND_WALL_HIT  EQU 3
DEF SND_SELF_HIT  EQU 4
DEF SND_EAT_FOOD  EQU 5
DEF SND_PERFECT  EQU 6
DEF MUSIC_TRACK  EQU 5

DEF FACE_LT    EQU 1
DEF FACE_RT    EQU 2
DEF FACE_UP    EQU 3
DEF FACE_DN    EQU 4
DEF FACE_NONE  EQU 0

DEF MAX_SNAKE_LEN  EQU $50
DEF MAX_POINT      EQU $05
DEF EAT_DEADLINE   EQU $28

SECTION "ROM Bank $000", ROM0[$0]
LOAD "CRAM Code", SRAM[$a008]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_A008 | FILE_2BPP | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $00           ; owner code
.title
    dk "WORM"
.icon
.end

History:
.points
    dw 1
.author
    dp "KEI KONDOH", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    jr Run

SavedHiScore:
    nop
    nop

Run:
    ld sp, $e000
    trap $db
    trap AudioStop
    callx call_006c

.next
    callx MenuMain
    ld a, c
    cp $00
    jr nz, :+
    callx GameMain
    jr .next

:   cp $01
    jr nz, .next

    trap AudioStop
    trap ExitToMenu


call_0067:
    ld a, $0c
    trap $b9
    ret


call_006c:
    xor a
    trap DrawInit
    ret


MenuMain:
    callx call_0067
    callx DrawTitle
    callx DrawMenu
    callx HandleMenu
    ret


DrawTitle:
    ; Draw line above title at (x=3, y=3)
    ld hl, $0303
    trap DrawAt
    ldx hl, strTitleTop
    trap DrawString

    ; Draw title at (x=3, y=5)
    ld hl, $0305
    trap DrawAt
    ldx hl, strTitleMid
    trap DrawString

    ; Draw line below title at (x=3, y=7)
    ld hl, $0307
    trap DrawAt
    ldx hl, strTitleBot
    trap DrawString

    ret

strTitleTop:
    dk "QOOOOOOOOOOOO+\0"
strTitleMid:
    dk "  W  O  R  M  \0"
strTitleBot:
    dk "+OOOOOOOOOOOOQ\0"

DrawMenu:
    ; Draw “GAME START” at (x=5, y=12)
    ld hl, $050c
    trap DrawAt
    ldx hl, strGameStart
    trap DrawString

    ; Draw “EXIT” at (x=5, y=14)
    ld hl, $050e
    trap DrawAt
    ldx hl, strExit
    trap DrawString

    ret


strGameStart:
    dk "GAME START\0"
strExit:
    dk "EXIT\0"


HandleMenu:
    ld bc, $0000

.next
    trap AwaitFrame
    ld e, " "
    callx DrawSelection
    ldh a, [$8b]
    bit BTN_UP_F, a
    jr z, :+
    ld a, c
    and a
    jr z, :+
    dec c

:   ldh a, [$8b]
    bit BTN_DN_F, a
    jr z, :+
    ld a, c
    cp $01
    jr z, :+
    inc c

:   ld e, ">"
    callx DrawSelection
    ld a, [varTicker]
    inc a
    ld [varTicker], a
    ldh a, [$8b]

    bit BTN_A_F, a
    jr z, .next
    ld a, [SavedHiScore + 1]
    ld h, a
    ld a, [varTicker]
    ld l, a
    trap RandInit
    ret


DrawSelection:
    ld h, $03
    ld a, c
    sla a
    add $0c
    ld l, a
    trap DrawAt
    ld a, e
    trap DrawChar
    ret


GameMain:
    ld a, $00
    ld [varHaveFood], a
    ld [varGameOver], a
    ld [varPerfect], a
    ld a, $00
    ld [varScore], a
    ld [varScore+1], a
    ld [varDeadline], a
    ld [varTicker], a
    ld [varPoint], a
    callx InitField
    callx InitBorder
    callx DrawScore
    callx DrawHighScore
    callx DrawPoints

    ld a, MUSIC_TRACK
    trap AudioPlayMusic

.next
    trap AwaitFrame
    callx AddFood
    callx DrawFood
    callx HandleInput
    callx DrawSnake
    callx DrawPoints
    callx HandleWallHit
    callx HandleSelfHit
    callx HandleFoodHit
    callx HandlePerfect

    ld a, [varGameOver]
    cp $01
    jr nz, .next

    xor a
    trap AudioPlayMusic
    ld a, [varPerfect]
    cp $00
    jr z, :+

    callx DrawPerfect
    ret

:   callx DrawGameOver
    ret


PUSHC
SETCHARMAP PlainText

InitBorder:
    callx call_0067
    ld bc, $0000

.nextCol
    ; Draw “-” across rows 0 and 16
    ld h, c
    ld l, $00
    trap DrawAt
    ld a, "-"
    trap DrawChar
    ld l, $10
    trap DrawAt
    ld a, "-"
    trap DrawChar
    inc c
    ld a, c
    cp $14
    jr nz, .nextCol

    ld bc, $0000

.nextRow
    ; Draw “|” down columns 0 and 19
    ld l, c
    ld h, $00
    trap DrawAt
    ld a, "|"
    trap DrawChar
    ld h, $13
    trap DrawAt
    ld a, "|"
    trap DrawChar
    inc c
    ld a, c
    cp $10
    jr nz, .nextRow

    ; Draw “+” at (x={0,19}, y={0,16})
    ld hl, $0000
    trap DrawAt
    ld a, "+"
    trap DrawChar
    ld hl, $1300
    trap DrawAt
    ld a, "+"
    trap DrawChar
    ld hl, $0010
    trap DrawAt
    ld a, "+"
    trap DrawChar
    ld hl, $1310
    trap DrawAt
    ld a, "+"
    trap DrawChar
    ret

POPC


DrawScore:
    ; Draw “SC:” at (x=8, y=17)
    ld hl, $0811
    trap DrawAt
    ldx hl, strScorePrefix
    trap DrawString

    ; Convert score to string and draw
    ld a, [varScore]
    ld e, a
    ld a, [varScore+1]
    ld d, a
    ld hl, varNumBuffer
    trap StrConvInt
    ld hl, varNumBuffer+2
    trap DrawString
    ret


strScorePrefix:
    dk "SC:\0"

DrawHighScore:
    ; Draw “HI:” at (x=0, y=17)
    ld hl, $0011
    trap DrawAt
    ldx hl, strHiScorePrefix
    trap DrawString

    ; Convert high score to string and draw
    ld a, [SavedHiScore]
    ld e, a
    ld a, [SavedHiScore + 1]
    ld d, a
    ld hl, varNumBuffer
    trap StrConvInt
    ld hl, varNumBuffer+2
    trap DrawString
    ret

strHiScorePrefix:
    dk "HI:\0"

UpdateHighScore:
    ld a, [varScore]
    ld e, a
    ld a, [varScore+1]
    ld d, a
    ld a, [SavedHiScore]
    ld l, a
    ld a, [SavedHiScore + 1]
    ld h, a
    ld c, $06
    trap $84
    ld a, l
    cp $00
    ret z

    ld a, $0a
    ld [$0000], a
    ld a, [varScore]
    ld [SavedHiScore], a
    ld a, [varScore+1]
    ld [SavedHiScore + 1], a
    xor a
    ld [$0000], a
    ret


DrawPoints:
    ; Draw “P:” at (x=16, y=17)
    ld hl, $1011
    trap DrawAt
    ldx hl, strPointPrefix
    trap DrawString

    ld a, [varPoint]
    ld e, a
    ld d, $00
    ld hl, varNumBuffer
    trap StrConvInt
    ld hl, varNumBuffer+4
    trap DrawString
    ret


strPointPrefix:
    dk "P:\0"

DrawGameOver:
    ; Draw outer top of GAMEOVER box at (x=4, y=6)
    ld hl, $0406
    trap DrawAt
    ldx hl, strGameOverOuter
    trap DrawString

    ; Draw inner top of GAMEOVER box at (x=4, y=7)
    ld hl, $0407
    trap DrawAt
    ldx hl, strGameOverInner
    trap DrawString

    ; Draw GAMEOVER at (x=4, y=8)
    ld hl, $0408
    trap DrawAt
    ldx hl, strGameOver
    trap DrawString

    ; Draw inner bottom of GAMEOVER box at (x=4, y=9)
    ld hl, $0409
    trap DrawAt
    ldx hl, strGameOverInner
    trap DrawString

    ; Draw outer bottom of GAMEOVER box at (x=4, y=10)
    ld hl, $040a
    trap DrawAt
    ldx hl, strGameOverOuter
    trap DrawString

.awaitA
    ldh a, [$8a]
    bit BTN_A_F, a
    jr z, .awaitA

    ret


strGameOverOuter:
    dk "+----------+\0"
strGameOverInner:
    dk "|          |\0"
strGameOver:
    dk "| GAMEOVER |\0"

DrawPerfect:
    ; Draw outer top of PERFECT box at (x=4, y=6)
    ld hl, $0406
    trap DrawAt
    ldx hl, strPerfectOuter
    trap DrawString

    ; Draw inner top of PERFECT box at (x=4, y=7)
    ld hl, $0407
    trap DrawAt
    ldx hl, strPerfectInner
    trap DrawString

    ; Draw PERFECT at (x=4, y=8)
    ld hl, $0408
    trap DrawAt
    ldx hl, strPerfect
    trap DrawString

    ; Draw inner bottom of PERFECT box at (x=4, y=9)
    ld hl, $0409
    trap DrawAt
    ldx hl, strPerfectInner
    trap DrawString

    ; Draw outer bottom of PERFECT box at (x=4, y=9)
    ld hl, $040a
    trap DrawAt
    ldx hl, strPerfectOuter
    trap DrawString

.awaitA
    ldh a, [$8a]
    bit BTN_A_F, a
    jr z, .awaitA

    ret


strPerfectOuter:
    dk "+----------+\0"
strPerfectInner:
    dk "|          |\0"
strPerfect:
    dk "| PERFECT! |\0"

InitField:
    trap RandNext

:   sub $10
    jr nc, :-

    add $10
    ld hl, varSnakeX
    inc a
    inc a
    ld [hl], a
    ld d, a
    trap RandNext

:   sub $0d
    jr nc, :-

    add $0d
    ld hl, varSnakeY
    inc a
    inc a
    ld [hl], a
    ld e, a
    ld b, $00
    ld c, $01

.next
    ld hl, varSnakeX
    add hl, bc
    ld [hl], d
    ld hl, varLastX
    add hl, bc
    ld [hl], d
    ld hl, varSnakeY
    add hl, bc
    ld [hl], e
    ld hl, varLastY
    add hl, bc
    ld [hl], e
    inc c
    ld a, c
    cp MAX_SNAKE_LEN
    jr nz, .next

    ld a, $04
    ld [varSnakeLen], a
    ld a, $00
    ld [varHeadDir], a
    ld a, $0a
    ld [varCountdown], a
    ret


DrawSnake:
    ; Draw “+” at tail segment of snake
    ld b, $00
    ld a, [varSnakeLen]
    ld c, a
    ld hl, varSnakeX
    add hl, bc
    ld a, [hl]
    push af
    ld hl, varSnakeY
    add hl, bc
    ld a, [hl]
    ld l, a
    pop af
    ld h, a
    trap DrawAt
    ld a, "+"
    trap DrawChar

    ; Draw “O” at second segment of snake
    ld b, $00
    ld c, $01
    ld hl, varSnakeX
    add hl, bc
    ld a, [hl]
    push af
    ld hl, varSnakeY
    add hl, bc
    ld a, [hl]
    ld l, a
    pop af
    ld h, a
    trap DrawAt
    ld a, "O"
    trap DrawChar

    ; Draw “Q” at head segment of snake
    ld hl, varSnakeX
    ld a, [hl]
    push af
    ld hl, varSnakeY
    ld a, [hl]
    ld l, a
    pop af
    ld h, a
    trap DrawAt
    ld a, "Q"
    trap DrawChar

    ld hl, varSnakeX
    ld a, [hl]
    ld b, a
    ld hl, varLastX
    ld a, [hl]
    cp b
    jr nz, .moved

    ld hl, varSnakeY
    ld a, [hl]
    ld b, a
    ld hl, varLastY
    ld a, [hl]
    cp b
    jr nz, .moved

    ret

.moved
    ; Snake moved, so erase previous tail segment of snake
    ld b, $00
    ld a, [varSnakeLen]
    ld c, a
    ld hl, varLastX
    add hl, bc
    ld a, [hl]
    push af
    ld hl, varLastY
    add hl, bc
    ld a, [hl]
    ld l, a
    pop af
    ld h, a
    trap DrawAt
    ld a, " "
    trap DrawChar
    ret


HandleInput:
    ld b, $00
    ld c, $00

    ; Copy all snake segments from current to last
.copyNext
    ld hl, varSnakeX
    add hl, bc
    ld a, [hl]
    ld hl, varLastX
    add hl, bc
    ld [hl], a
    ld hl, varSnakeY
    add hl, bc
    ld a, [hl]
    ld hl, varLastY
    add hl, bc
    ld [hl], a
    inc c
    ld a, c
    cp MAX_SNAKE_LEN
    jr nz, .copyNext

    ; Check if left button pressed
    ldh a, [$8a]
    bit BTN_LT_F, a
    jr z, :+

    ; Do nothing if facing right
    ld a, [varHeadDir]
    cp FACE_RT
    jr z, .inputDone

    ; Set facing to left
    ld a, FACE_LT
    ld [varHeadDir], a
    jr .inputDone

    ; Check if right button pressed
:   ldh a, [$8a]
    bit BTN_RT_F, a
    jr z, :+

    ; Do nothing if facing left
    ld a, [varHeadDir]
    cp FACE_LT
    jr z, .inputDone

    ; Set facing to right
    ld a, FACE_RT
    ld [varHeadDir], a
    jr .inputDone

    ; Check if up button pressed
:   ldh a, [$8a]
    bit BTN_UP_F, a
    jr z, :+

    ; Do nothing if facing down
    ld a, [varHeadDir]
    cp FACE_DN
    jr z, .inputDone

    ; Set facing to up
    ld a, FACE_UP
    ld [varHeadDir], a
    jr .inputDone

    ; Check if down button pressed
:   ldh a, [$8a]
    bit BTN_DN_F, a
    jr z, .inputDone

    ; Do nothing if facing up
    ld a, [varHeadDir]
    cp FACE_UP
    jr z, .inputDone

    ; Set facing to down
    ld a, FACE_DN
    ld [varHeadDir], a

.inputDone
    ; Count down from 10 to 0
    ; If countdown hasn’t yet reached 0, return
    ld a, [varCountdown]
    dec a
    ld [varCountdown], a
    cp $00
    ret nz

    ; Reset countdown to 10
    ld a, $0a
    ld [varCountdown], a

    ; Check if facing left
    ld a, [varHeadDir]
    cp FACE_LT
    jr nz, :+

    ; Move snake left
    ld hl, varSnakeX
    ld a, [hl]
    cp $00
    jr z, :+
    dec a
    ld [hl], a

    ; Check if facing right
:   ld a, [varHeadDir]
    cp FACE_RT
    jr nz, :+

    ; Move snake right
    ld hl, varSnakeX
    ld a, [hl]
    cp $13
    jr z, :+
    inc a
    ld [hl], a

    ; Check if facing up
:   ld a, [varHeadDir]
    cp FACE_UP
    jr nz, :+

    ; Move snake up
    ld hl, varSnakeY
    ld a, [hl]
    cp $00
    jr z, :+
    dec a
    ld [hl], a

    ; Check if facing down
:   ld a, [varHeadDir]
    cp FACE_DN
    jr nz, :+

    ; Move snake down
    ld hl, varSnakeY
    ld a, [hl]
    cp $10
    jr z, :+
    inc a
    ld [hl], a

    ; If not moving, return
:   ld a, [varHeadDir]
    cp FACE_NONE
    ret z

    ld hl, varSnakeX
    ld a, [hl]
    ld b, a
    ld hl, varLastX
    ld a, [hl]
    cp b
    jr nz, :+

    ld hl, varSnakeY
    ld a, [hl]
    ld b, a
    ld hl, varLastY
    ld a, [hl]
    cp b
    jr nz, :+

    ret


:   ld bc, $0000

.next2
    ld hl, varLastX
    add hl, bc
    ld a, [hl]
    ld hl, varSnakeX
    inc c
    add hl, bc
    dec c
    ld [hl], a
    ld hl, varLastY
    add hl, bc
    ld a, [hl]
    ld hl, varSnakeY
    inc c
    add hl, bc
    dec c
    ld [hl], a
    inc c
    ld a, c
    cp "O"
    jr nz, .next2

    ret


CheckWallHit:
    ; Set c to $01 to indicate collision
    ld c, $01

    ; Check if snake head X is left or right edge of screen
    ld hl, varSnakeX
    ld a, [hl]
    cp $00
    ret z
    cp $13
    ret z

    ; Check if snake head Y is top or bottom edge of screen
    ld hl, varSnakeY
    ld a, [hl]
    cp $00
    ret z
    cp $10
    ret z

    ; Set c to $00 to indicate no collision
    ld c, $00
    ret


CheckSelfHit:
    ; Check if snake head X position changed
    ld hl, varSnakeX
    ld a, [hl]
    ld b, a
    ld hl, varLastX
    ld a, [hl]
    cp b
    jr nz, .moved

    ; Check if snake head Y position changed
    ld hl, varSnakeY
    ld a, [hl]
    ld b, a
    ld hl, varLastY
    ld a, [hl]
    cp b
    jr nz, .moved

    ; If neither, no need to check collision
    ld c, $00
    ret


.moved
    ; Load snake head position to de
    ld hl, varSnakeX
    ld a, [hl]
    ld d, a
    ld hl, varSnakeY
    ld a, [hl]
    ld e, a

    ; Start checking snake segments from index 1
    ld b, $00
    ld c, $01

.nextSegment
    ; Check if head X equals current segment X
    ld hl, varSnakeX
    add hl, bc
    ld a, [hl]
    cp d
    jr nz, .noHit

    ; Check if head Y equals current segment Y
    ld hl, varSnakeY
    add hl, bc
    ld a, [hl]
    cp e
    jr nz, .noHit

    ; If both X and Y match then return true
    ld c, $01
    ret


.noHit
    ; Loop until bc increases to the end of the snake
    inc c
    push bc
    ld a, [varSnakeLen]
    inc a
    ld b, a
    ld a, c
    cp b
    pop bc
    jr nz, .nextSegment

    ; Reached end of snake without detecting collision
    ld c, $00
    ret


CheckFoodHit:
    ; If food hasn’t been placed, nothing to do
    ld a, [varHaveFood]
    cp $01
    ret nz

    ld c, $00

    ; Check if food X equals snake head X
    ld hl, varSnakeX
    ld a, [hl]
    ld b, a
    ld a, [varFoodCol]
    cp b
    ret nz

    ; Check if food Y equals snake head Y
    ld hl, varSnakeY
    ld a, [hl]
    ld b, a
    ld a, [varFoodRow]
    cp b
    ret nz

    ; If X and Y match, snake ate the food
    ld c, $01
    ret


HandleWallHit:
    callx CheckWallHit
    ld a, c
    cp $00
    ret z

    ld a, SND_WALL_HIT
    trap AudioPlaySound

    ld a, $01
    ld [varGameOver], a
    ret


HandleSelfHit:
    callx CheckSelfHit
    ld a, c
    cp $00
    ret z

    ld a, SND_SELF_HIT
    trap AudioPlaySound

    ld a, $01
    ld [varGameOver], a
    ret


HandleFoodHit:
    callx CheckFoodHit
    ld a, c
    cp $00
    ret z

    ld a, SND_EAT_FOOD
    trap AudioPlaySound

    ld a, $00
    ld [varHaveFood], a

    ; Grow snake if less than maximum length
    ld a, [varSnakeLen]
    cp MAX_SNAKE_LEN
    jr z, :+
    inc a
    ld [varSnakeLen], a

    ; Add current food value to score
:   ld a, [varScore]
    ld e, a
    ld a, [varScore+1]
    ld d, a
    ld h, $00
    ld a, [varPoint]
    ld l, a
    trap $87
    ld a, l
    ld [varScore], a
    ld a, h
    ld [varScore+1], a

    ; Check for new high score and redraw scores
    callx DrawScore
    callx UpdateHighScore
    callx DrawHighScore
    ret


HandlePerfect:
    ; Do nothing if snake hasn’t reached max length
    ld a, [varSnakeLen]
    cp MAX_SNAKE_LEN
    ret nz

    ld a, SND_PERFECT
    trap AudioPlaySound

    ld a, $01
    ld [varGameOver], a
    ld [varPerfect], a
    ret


AddFood:
    ld a, [varHaveFood]
    cp $01
    ret z

    ; Generate random X value in 2..17
    trap RandNext
:   sub $10
    jr nc, :-
    add $10
    inc a
    inc a
    ld [varFoodCol], a

    ; Generate random Y value in 2..15
    trap RandNext
:   sub $0d
    jr nc, :-
    add $0d
    inc a
    inc a
    ld [varFoodRow], a

    ; Mark food as having been created
    ld a, $01
    ld [varHaveFood], a

    ; Consider each segment in snake at index bc
    ld b, $00
    ld c, $00

.nextSegment
    ; Check if food X equals current segment X
    ld a, [varFoodCol]
    ld d, a
    ld hl, varSnakeX
    add hl, bc
    ld a, [hl]
    cp d
    jr nz, .noHit

    ; Check if food Y equals current segment Y
    ld a, [varFoodRow]
    ld e, a
    ld hl, varSnakeY
    add hl, bc
    ld a, [hl]
    cp e
    jr nz, .noHit

    ; If both X and Y match, then food is on a snake segment
    ; Mark food as missing and restart AddFood
    ld a, $00
    ld [varHaveFood], a
    jr AddFood

.noHit
    ; Loop until bc increases to the end of the snake
    inc c
    push bc
    ld a, [varSnakeLen]
    ld b, a
    ld a, c
    cp b
    pop bc
    jr nz, .nextSegment

    ; Increase food value if less than maximum points
    ld a, [varPoint]
    cp MAX_POINT
    jr z, :+
    inc a
    ld [varPoint], a

    ; Reset eat deadline to initial value
:   ld a, EAT_DEADLINE
    ld [varDeadline], a
    ret


DrawFood:
    ; If food hasn’t been created yet, return
    ld a, [varHaveFood]
    cp $00
    ret z

    ; Draw “*” at current food position
    ld a, [varFoodCol]
    ld h, a
    ld a, [varFoodRow]
    ld l, a
    trap DrawAt
    ld a, "*"
    trap DrawChar

    ld a, [varCountdown]
    cp $01
    ret nz

    ; Decrease deadline until it reaches zero
    ld a, [varDeadline]
    cp $00
    jr z, .timeUp
    dec a
    ld [varDeadline], a
    ret

    ; If food deadline reached zero, set food value to zero
.timeUp
    ld a, $00
    ld [varPoint], a
    ret
ENDL


SECTION "Variables", WRAM0[$c600]

varSnakeX: ds MAX_SNAKE_LEN  ; X positions of snake segments
varSnakeY: ds MAX_SNAKE_LEN  ; Y positions of snake segments
varLastX: ds MAX_SNAKE_LEN   ; Previous X positions of snake segments
varLastY: ds MAX_SNAKE_LEN   ; Previous Y positions of snake segments

varSnakeLen: ds 1   ; Current snake length
varCountdown: ds 1  ; Countdown until next movement (10 → 0)
varHeadDir: ds 2    ; Current facing of snake head
varPoint: ds 1      ; Current food value (0 → 5)
varDeadline: ds 1   ; Time left before food value becomes 0
varFoodCol: ds 1    ; Horizontal position of current food
varFoodRow: ds 1    ; VerticalPosition of current food
varGameOver: ds 1   ; If true, game is over and play should stop
varScore: ds 2      ; Current total score
varNumBuffer: ds 7  ; Buffer space for converting number to string
varTicker: ds 1     ; Feeds into random seed for game
varHaveFood: ds 1   ; If true, uneaten food currently exists
varPerfect: ds 1    ; If true, player completed game perfectly
