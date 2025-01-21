; Disassembly of "roulette.gbf"

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

MACRO wtrap
    IF STRSUB("\1", 1, 1) == "$"
        ld a, \1
    ELSE
        ld a, Trap_\1
    ENDC
    call code_c600
ENDM

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_ICON | FILE_2BPP | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $72           ; owner code
.title
    dk "ルーレット"
.icon
    INCBIN "gfx/roulette/icon.2bpp"
.end

History:
.points
    dw 100
.author
    dp "つもり\0\0\0\0\0\0\0", 2
.history
    ds 11
    ds 11
    ds 11
.end

Main::
    ldx de, code_0109
    ld hl, code_c600
    ld bc, data_013b - code_0109 + 4
    trap MemCopy
    jx jp_07a7


code_0109:
LOAD "WRAM Code", WRAM0[$c600]
code_c600:
    ld [code_c611 + 1], a
code_c603:
    ld hl, $0000
    push hl
    pop af
code_c608:
    ld hl, $0000
    ld de, $0000
    ld bc, $0000
code_c611:
    trap $00

    push hl
    push de
    push hl
    push af
    ld hl, code_c603 + 1
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, code_c608 + 1
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    inc hl
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    inc hl
    ld [hl], c
    inc hl
    ld [hl], b
    pop hl
    ret
ENDL

data_013b:
    dw 100
data_013d:
    INCBIN "roulette/bin.hz"

data_06ae:
    db $00, $06, $08, $04, $0a, $02, $0c, $07, $05, $09, $03, $0b, $01

data_06bb:
    db $4e, $5d, $6e, $7f, $81, $75, $63, $52, $41, $30, $26, $29, $3c

data_06c8:
    db $17, $17, $19, $20, $2b, $31, $35, $36, $34, $30, $27, $1e, $19

data_06d5:
    db $0c, $0d, $0d, $0d, $0d, $0d, $0d, $0d
    db $20, $20, $2b, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $0d
    db $20, $20, $7c, $20, $7c, $20, $31, $7c, $20, $34, $7c, $20, $37, $7c, $31, $30, $7c, $0d
    db $20, $20, $7c, $20, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $0d
    db $20, $20, $7c, $30, $7c, $20, $32, $7c, $20, $35, $7c, $20, $38, $7c, $31, $31, $7c, $0d
    db $20, $20, $7c, $20, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $0d
    db $20, $20, $7c, $20, $7c, $20, $33, $7c, $20, $36, $7c, $20, $39, $7c, $31, $32, $7c, $0d
    db $20, $20, $2b, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $2d, $2d, $2b, $0d
    db $20, $20, $20, $20, $7c, $20, $fc, $fd, $fe, $20, $7c, $20, $f9, $fa, $fb, $20, $7c, $0d
    db $20, $20, $20, $20, $2b, $2d, $2d, $2d, $2d, $2d, $2b, $2d, $2d, $2d, $2d, $2d, $2b, $0d
    db $20, $20, $20, $4d, $4f, $4e, $45, $59, $3a, $0d

data_0789:
    db $20, $20, $20, $42, $45, $54, $20, $20, $3a, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $00

data_079d:
    db 1
    db 0, 0, $00, 0

data_07a2:
    db 1
    db 0, 0, $01, 0


jp_07a7:
    callx call_0b04
    ld hl, $0000
    push hl
    ld hl, $c64c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld l, e
    ld h, d
    push hl
    ld hl, $c64a
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0000
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0000
    push hl
    ld hl, $c655
    pop de
    ld [hl], e
    ld hl, $0000
    push hl
    ld hl, $c65a
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0000
    push hl
    ld hl, $c65d
    pop de
    ld [hl], e
    jx jp_0afa


jp_07ef:
    wtrap AwaitFrame
    ld hl, $c65a
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    inc de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap InputButtons
    ld hl, $c605
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0004
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_081d

    jx jp_0821


jr_000_081d::
    jx jp_0afe


jp_0821:
    ld hl, $c655
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0000
    pop de
    ld c, $06
    trap MathCmp16
    ld a, l
    or h
    jr nz, jr_000_0838

    jx jp_094e


jr_000_0838:
    ld hl, $c64c
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0014
    push hl
    ld hl, $c655
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0001
    pop de
    trap $85
    pop de
    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    pop de
    ld c, $06
    trap MathCmp16
    ld a, l
    or h
    jr nz, jr_000_0864

    jx jp_093f


jr_000_0864::
    ldx hl, data_079d
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, data_06c8
    push hl
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    ldx hl, data_06bb
    push hl
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c60d
    pop de
    ld [hl], e
    ld hl, $0000
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap $60
    ld hl, $002b
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap AudioPlaySound
    ld hl, $0000
    push hl
    ld hl, $c64c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c655
    ld e, [hl]
    ld d, $00
    dec de
    ld [hl], e
    ld hl, $c655
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_08d9

    inc hl

jr_000_08d9::
    ld a, l
    or h
    jr nz, jr_000_08e1

    jx jp_090a


jr_000_08e1::
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c646
    pop de
    ld [hl], e
    callx call_0f30
    ld hl, $0000
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    callx call_0d53
    jx jp_0afa


jp_090a:
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $000b
    pop de
    ld c, $06
    trap MathCmp16
    ld a, l
    or h
    jr nz, jr_000_0921

    jx jp_0930


jr_000_0921::
    ld hl, $0000

Call_000_0924::
    push hl
    ld hl, $c64a
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    jx jp_093b


jp_0930:
    ld hl, $c64a
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    inc de
    ld [hl], e
    inc hl
    ld [hl], d

jp_093b:
    jx jp_094a


jp_093f:
    ld hl, $c64c
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    inc de
    ld [hl], e
    inc hl
    ld [hl], d

jp_094a:
    jx jp_0afa


jp_094e:
    ld hl, $c605
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0001
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_0967

    jx jp_0a0a


jr_000_0967::
    ld hl, $c7f2
    push hl
    ld hl, $c645
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    trap MathMul16
    push hl
    ld hl, $c644
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    push hl
    ld hl, $0002
    pop de
    trap MathMul16
    push hl
    ld hl, $0001
    pop de
    add hl, de
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0080
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_09a6

    inc hl

jr_000_09a6::
    ld a, l
    or h
    jr nz, jr_000_09ae

    jx jp_0a06


jr_000_09ae::
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ldx hl, data_013b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    ld c, $07
    trap MathCmp16
    ld a, l
    or h
    jr nz, jr_000_09c9

    jx jp_0a06


jr_000_09c9::
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_09d7

    inc hl

jr_000_09d7::
    ld a, l
    or h
    jr nz, jr_000_09df

    jx jp_09e6


jr_000_09df::
    callx call_11e8

jp_09e6:
    ld hl, $c652
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    inc de
    ld [hl], e
    inc hl
    ld [hl], d
    callx call_0d53
    ld hl, $0002
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap AudioPlaySound

jp_0a06:
    jx jp_0afa


jp_0a0a:
    ld hl, $c605
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0002
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_0a23

    jx jp_0a47


jr_000_0a23::
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    jr nz, jr_000_0a31

    jx jp_0a43


jr_000_0a31::
    ld hl, $0000
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    callx call_0d53

jp_0a43:
    jx jp_0afa


jp_0a47:
    ld hl, $c605
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0008
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_0a60

    jx jp_0ae7


jr_000_0a60::
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    jr nz, jr_000_0a6e

    jx jp_0ae3


jr_000_0a6e::
    ld hl, $000a
    push hl
    ld hl, $0000
    pop de
    ld [hl], e
    ldx hl, data_013b
    push hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    ld e, l
    ld d, h
    pop hl
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0000
    push hl
    ld hl, $0000
    pop de
    ld [hl], e
    callx call_0d53
    ld hl, $c65a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap RandInit
    wtrap RandNext
    ld hl, $c609
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    push hl
    ld hl, $c655
    pop de
    ld [hl], e
    ld hl, $c655
    push hl
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $003c
    pop de
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld [hl], e

jp_0ae3:
    jx jp_0afa


jp_0ae7:
    ld hl, $c605
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c649
    pop de
    ld [hl], e
    callx call_12dc

jp_0afa:
    jx jp_07ef


jp_0afe:
    wtrap ExitToMenu
    ret


call_0b04:
    ld hl, $0100
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c400
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c666
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap MemCopy
    ld hl, $c400
    push hl
    ld hl, $0000
    add hl, hl
    pop de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $1fff
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    push hl
    ld hl, $a000
    pop de
    add hl, de
    push hl
    ld hl, $c64a
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0002
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c64c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c64c
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0001
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_0b80

    jx jp_0baa


jr_000_0b80::
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c64a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0004
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    push hl
    ld hl, $0005
    pop de
    add hl, de
    push hl
    ld hl, $f59b
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    jx jp_0baf


jp_0baa:
    wtrap ExitToMenu


jp_0baf:
    ld hl, $0020
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap DrawInit
    ld hl, $c400
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, data_013d
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap ExtractInit
    ld hl, $0020
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $8000
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap ExtractData
    ld hl, $07f0
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $8800
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap ExtractData
    ld hl, $008c
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c766
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap ExtractData
    ld hl, $010e
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c7f2
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap ExtractData
    ld hl, $0003
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap LCDEnable
    ld hl, $0001
    push hl
    ld hl, $c645
    pop de
    ld [hl], e
    ld l, e
    ld h, $00
    push hl
    ld hl, $c644
    pop de
    ld [hl], e
    ldx hl, data_06d5
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap DrawString
    ld hl, $0000
    push hl
    ld hl, $c658
    pop de
    ld [hl], e

jp_0c7f:
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0007
    pop de
    ld c, $07
    trap MathCmp16
    ld a, l
    or h
    jr nz, jr_000_0c96

    jx jp_0d04


jr_000_0c96::
    ld hl, $9800
    push hl
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0020
    pop de
    trap MathMul16
    pop de
    add hl, de
    push hl
    ld hl, $c65e
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c766
    push hl
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0014
    pop de
    trap MathMul16
    pop de
    add hl, de
    push hl
    ld hl, $c660
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0014
    push hl
    ld hl, $c60f
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c660
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c65e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap MemCopy
    ld hl, $c658
    ld e, [hl]
    ld d, $00
    inc de
    ld [hl], e
    jx jp_0c7f


jp_0d04:
    ldx hl, data_079d
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, data_06c8
    push hl
    ld hl, $0000
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    ldx hl, data_06bb
    push hl
    ld hl, $0000
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c60d
    pop de
    ld [hl], e
    ld hl, $0000
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap $60
    callx call_0ec3
    callx call_0d53
    ret


call_0d53:
    ld hl, $0010
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0009
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    wtrap DrawAt
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, data_013b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap StrConvInt
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap DrawString
    ld hl, $c65c
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    jr nz, jr_000_0da7

    jx jp_0dbc


jr_000_0da7::
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    jr nz, jr_000_0db5

    jx jp_0dbc


jr_000_0db5::
    ld hl, $0001
    jx jp_0dbf


jp_0dbc:
    ld hl, $0000
jp_0dbf:
    ld a, l
    or h
    jr nz, jr_000_0dc7

    jx jp_0e3e


jr_000_0dc7::
    ld hl, $0011
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $000d
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    wtrap DrawAt
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c65c
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap StrConvInt
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap DrawString
    ld hl, $0011
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0010
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    wtrap DrawAt
    ld hl, $0058
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap DrawChar
    ld hl, $0001
    push hl
    ld hl, $c65d
    pop de
    ld [hl], e
    jx jp_0e7d


jp_0e3e:
    ld hl, $c65d
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    jr nz, jr_000_0e4c

    jx jp_0e7d


jr_000_0e4c::
    ld hl, $0011
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0000
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    wtrap DrawAt
    ldx hl, data_0789
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap DrawString
    ld hl, $0000
    push hl
    ld hl, $c65d
    pop de
    ld [hl], e

jp_0e7d:
    ld hl, $0011
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0009
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    wtrap DrawAt
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap StrConvInt
    ld hl, $c400
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap DrawString
    ret


call_0ec3:
    ldx hl, data_07a2
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c645
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0003
    pop de
    trap $86
    push hl
    ld hl, $0048
    pop de
    add hl, de
    push hl
    ld hl, $c60c
    pop de
    ld [hl], e
    ld hl, $c644
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0003
    pop de
    trap $86
    push hl
    ld hl, $0018
    pop de
    add hl, de
    push hl
    ld hl, $c60d
    pop de
    ld [hl], e
    ld hl, $0001
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap $60
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    jr nz, jr_000_0f1d

    jx jp_0f2f


jr_000_0f1d::
    ld hl, $0000
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    callx call_0d53

jp_0f2f:
    ret


call_0f30:
    ld hl, $0000
    push hl
    ld hl, $c657
    pop de
    ld [hl], e
    ld hl, $c662
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_0f47

    inc hl

jr_000_0f47::
    ld a, l
    or h
    jr nz, jr_000_0f4f

    jx jp_0f6b


jr_000_0f4f::
    ld hl, $0000
    push hl
    ld hl, $c647
    pop de
    ld [hl], e
    ld hl, $c646
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c646
    pop de
    ld [hl], e
    callx call_11ba

jp_0f6b:
    ld hl, $0001
    push hl
    ld hl, $c658
    pop de
    ld [hl], e

jp_0f74:
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000d
    pop de
    ld c, $07
    trap MathCmp16
    ld a, l
    or h
    jr nz, jr_000_0f8b

    jx jp_0fe4


jr_000_0f8b::
    ld hl, $c662
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0001
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_0fa4

    jx jp_0fc3


jr_000_0fa4::
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c647
    pop de
    ld [hl], e
    ld hl, $c646
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c646
    pop de
    ld [hl], e
    callx call_11ba

jp_0fc3:
    ld hl, $c662
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0001
    pop de
    trap $85
    push hl
    ld hl, $c662
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c658
    ld e, [hl]
    ld d, $00
    inc de
    ld [hl], e
    jx jp_0f74


jp_0fe4:
    ld hl, $c657
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    jr nz, jr_000_0ff2

    jx jp_10b1


jr_000_0ff2::
    ld hl, $000a
    push hl
    ld hl, $0000
    pop de
    ld [hl], e
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c65c
    ld l, [hl]
    ld h, $00
    pop de
    trap MathMul16
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $0000
    push hl
    ld hl, $c65c
    pop de
    ld [hl], e
    callx call_0d53
    ld hl, $003c
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx call_12bc
    jx jp_1096


jp_1037:
    ldx hl, data_013b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $752f
    pop de
    ld c, $02
    trap MathCmp16
    ld a, l
    or h
    jr nz, jr_000_104f

    jx jp_105a


jr_000_104f::
    ld hl, $0001
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d

jp_105a:
    ld hl, $c652
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    dec de
    ld [hl], e
    inc hl
    ld [hl], d
    ldx hl, data_013b
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    inc de
    ld [hl], e
    inc hl
    ld [hl], d
    callx call_0d53
    ld hl, $0020
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap AudioPlaySound
    ld hl, $0005
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx call_12bc

jp_1096:
    ld hl, $c652
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    jr z, jr_000_10a4

    jx jp_1037


jr_000_10a4::
    ld hl, $0000
    push hl
    ld hl, $0000
    pop de
    ld [hl], e
    jx jp_11b9


jp_10b1:
    ldx hl, data_013b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_10c0

    inc hl

jr_000_10c0::
    ld a, l
    or h
    jr nz, jr_000_10c8

    jx jp_11b9


jr_000_10c8::
    ld hl, $0000
    push hl
    ld hl, $c652
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    callx call_0d53
    ld hl, $00f0
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx call_12bc
    ld hl, $c666
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap FileDelete
    ld hl, $0000
    push hl
    ld hl, $c605
    pop de
    ld [hl], e
    wtrap DrawInit
    ld hl, $0007
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0003
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    wtrap DrawAt
    ldx hl, data_1450
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap DrawString
    ld hl, $0009
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    ld hl, $0001
    push hl
    ld hl, $c60a
    pop de
    ld [hl], e
    wtrap DrawAt
    ldx hl, data_1438
    push hl
    ld hl, $c609
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    wtrap DrawString
    jx jp_117b


jp_115c:
    wtrap AwaitFrame
    ld hl, $ff90
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_116f

    inc hl

jr_000_116f::
    ld a, l
    or h
    jr nz, jr_000_1177

    jx jp_117b


jr_000_1177::
    jx jp_117f


jp_117b:
    jx jp_115c


jp_117f:
    wtrap $db
    ld hl, $00f0
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx call_12bc
    ld hl, $00f0
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx call_12bc
    ld hl, $00f0
    push hl
    ld hl, $c648
    pop de
    ld [hl], e
    callx call_12bc
    wtrap ExitToMenu

jp_11b9:
    ret


call_11ba:
    ldx hl, data_06ae
    push hl
    ld hl, $c646
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c647
    ld l, [hl]
    ld h, $00
    pop de
    ld c, $08
    trap MathCmp16
    ld a, l
    or h
    jr nz, jr_000_11de

    jx jp_11e7


jr_000_11de::
    ld hl, $0001
    push hl
    ld hl, $c657
    pop de
    ld [hl], e

jp_11e7:
    ret


call_11e8:
    ld hl, $0000
    push hl
    ld hl, $c656
    pop de
    ld [hl], e
    ld hl, $c7f2
    push hl
    ld hl, $c645
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    trap MathMul16
    push hl
    ld hl, $c644
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    add hl, hl
    pop de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c662
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c662
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $c664
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c664
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, l
    or h
    ld hl, $0000
    jr nz, jr_000_1235

    inc hl

jr_000_1235::
    ld a, l
    or h
    jr nz, jr_000_123d

    jx jp_1246


jr_000_123d::
    ld hl, $0001
    push hl
    ld hl, $c656
    pop de
    ld [hl], e

jp_1246:
    ld hl, $0001
    push hl
    ld hl, $c658
    pop de
    ld [hl], e

jp_124f:
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000d
    pop de
    ld c, $07
    trap MathCmp16
    ld a, l
    or h
    jr nz, jr_000_1266

    jx jp_12a8


jr_000_1266::
    ld hl, $c664
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0001
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_127f

    jx jp_1287


jr_000_127f::
    ld hl, $c656
    ld e, [hl]
    ld d, $00
    inc de
    ld [hl], e

jp_1287:
    ld hl, $c664
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $0001
    pop de
    trap $85
    push hl
    ld hl, $c664
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c658
    ld e, [hl]
    ld d, $00
    inc de
    ld [hl], e
    jx jp_124f


jp_12a8:
    ld hl, $000c
    push hl
    ld hl, $c656
    ld l, [hl]
    ld h, $00
    pop de
    trap MathDiv16
    push hl
    ld hl, $c65c
    pop de
    ld [hl], e
    ret


call_12bc:
    jx jp_12cd


jp_12c0:
    ld hl, $c648
    ld e, [hl]
    ld d, $00
    dec de
    ld [hl], e
    wtrap AwaitFrame

jp_12cd:
    ld hl, $c648
    ld l, [hl]
    ld h, $00
    ld a, l
    or h
    jr z, jr_000_12db

    jx jp_12c0


jr_000_12db::
    ret


call_12dc:
    ld hl, $0000
    push hl
    ld hl, $c659
    pop de
    ld [hl], e
    ld l, e
    ld h, $00
    push hl
    ld hl, $c658
    pop de
    ld [hl], e
    ld hl, $c649
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0040
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_1307

    jx jp_1310


jr_000_1307::
    ld hl, $ffff
    push hl
    ld hl, $c659
    pop de
    ld [hl], e

jp_1310:
    ld hl, $c649
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0080
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_1329

    jx jp_1332


jr_000_1329::
    ld hl, $0001
    push hl
    ld hl, $c659
    pop de
    ld [hl], e

jp_1332:
    ld hl, $c649
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0010
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_134b

    jx jp_1354


jr_000_134b::
    ld hl, $0001
    push hl
    ld hl, $c658
    pop de
    ld [hl], e

jp_1354:
    ld hl, $c649
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0020
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr nz, jr_000_136d

    jx jp_1376


jr_000_136d::
    ld hl, $ffff
    push hl
    ld hl, $c658
    pop de
    ld [hl], e

jp_1376:
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c659
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    ld a, l
    or h
    jr nz, jp_138d

    jx jp_1437


jp_138d::
    ld hl, $c644
    push hl
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c658
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    add hl, de
    pop de
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld [hl], e
    ld hl, $c645
    push hl
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $c659
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0009
    pop de
    add hl, de
    pop de
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld [hl], e
    ld hl, $c644
    push hl
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    trap MathDiv16
    ld hl, $c3b0
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld e, l
    ld d, h
    pop hl
    ld [hl], e
    ld hl, $c645
    push hl
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0009
    pop de
    trap MathDiv16
    ld hl, $c3b0
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld e, l
    ld d, h
    pop hl
    ld [hl], e
    ld hl, $c7f2
    push hl
    ld hl, $c645
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $000f
    pop de
    trap MathMul16
    push hl
    ld hl, $c644
    ld l, [hl]
    ld h, $00
    pop de
    add hl, de
    push hl
    ld hl, $0002
    pop de
    trap MathMul16
    push hl
    ld hl, $0001
    pop de
    add hl, de
    pop de
    add hl, de
    ld l, [hl]
    ld h, $00
    push hl
    ld hl, $0080
    pop de
    ld a, e
    and l
    ld l, a
    ld a, d
    and h
    ld h, a
    ld a, l
    or h
    jr z, jr_000_1430

    jx jp_138d


jr_000_1430::
    callx call_0ec3

jp_1437:
    ret


data_1438:
    db $0f, $ba, $c9, $0e, $cc, $df, $db, $b8
    db $de, $d7, $d1, $0f, $ca, $bb, $b8, $bc
    db $de, $ae, $bb, $da, $cf, $bc, $c0, $00


data_1450:
    db $0f, $b5, $b6, $c8, $b6, $de, $c5, $b8, $c5, $d8, $cf, $bc, $c0, $c9, $c3, $de, $00
