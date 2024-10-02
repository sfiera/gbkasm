; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "consts.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

SECTION "ROM Math", ROMX[$5267], BANK[$2]

TrapMathXor16::
    ld a, h
    xor d
    ld h, a
    ld a, l
    xor e
    ld l, a
    ret


TrapMathOr16::
    ld a, h
    or d
    ld h, a
    ld a, l
    or e
    ld l, a
    ret


TrapMathAnd16::
    ld a, h
    and d
    ld h, a
    ld a, l
    and e
    ld l, a
    ret


TrapMathCpl16::
    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    ld l, a
    ret


TrapMathCmp16::
    ; Test: do hl and de have the same sign?
    ; If not, jump to .testNeg
    ; If it is,
    ld a, d
    xor h
    rlca
    ld a, d
    jr c, .testNeg

    ; hl = de - hl
    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a

    ; Test: is hl zero? If so, jump to .result
    ld b, %001
    or l
    jr z, .result

    ld a, h

.testNeg
    ; Test: is a negative? If so, jump to .result
    ; If the original signs matched, a is the high byte of (de - hl).
    ; If the original signs mismatched, a is the high byte of de.
    ld b, %010
    rlca
    jr c, .result

    ld b, %100

.result
    ld a, b
    ld b, $00
    ld hl, .cmpFields
    add hl, bc
    and [hl]
    jr z, ReturnZero

    ld hl, $ffff
    ret


.cmpFields
    db %110  ; 0: hl != de
    db %110  ; 1: hl != de
    db %101  ; 2: hl <= de
    db %101  ; 3: hl <= de
    db %011  ; 4: hl >= de
    db %011  ; 5: hl >= de
    db %100  ; 6: hl < de
    db %010  ; 7: hl > de
    db %001  ; 8: hl == de


trap_85_52b3::
    ld a, h
    or a
    jr nz, ReturnZero

    ld a, l
    cp $10
    jr nc, ReturnZero

    ld l, e
    ld h, d
    or a
    ret z

.jr_002_52c0
    srl h
    rr l
    dec a
    jr nz, .jr_002_52c0

    ret


trap_86_52c8::
    ld a, h
    or a
    jr nz, ReturnZero

    ld a, l
    cp $10
    jr nc, ReturnZero

    ld l, e
    ld h, d
    or a
    ret z

.jr_002_52d5
    add hl, hl
    dec a
    jr nz, .jr_002_52d5

    ret


ReturnZero:
    ld hl, $0000
    ret


TrapMathAdd16::
    add hl, de
    ret


TrapMathSub16::
    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    ret


TrapMathMul16::
    ld a, h
    or l
    ret z

    ld a, d
    or e
    jr z, ReturnZero

    ld a, h
    xor d
    rlca
    push af
    ld a, d
    rlca
    jr nc, .jr_002_52fd

    ld a, d
    cpl
    ld d, a
    ld a, e
    cpl
    ld e, a
    inc de

.jr_002_52fd
    ld a, h
    rlca
    jr nc, .jr_002_5308

    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    ld l, a
    inc hl

.jr_002_5308
    ld b, h
    ld c, l
    ld hl, $0000
    ld a, $10

.jr_002_530f
    add hl, hl
    rl c
    rl b
    jr nc, .jr_002_531d

    add hl, de
    jr nc, .jr_002_531d

    inc c
    jr nz, .jr_002_531d

    inc b

.jr_002_531d
    dec a
    jr nz, .jr_002_530f

    jr jr_002_5378

TrapMathDiv16::
    ld a, h
    or l
    jr nz, .jr_002_532e

    xor a
    ld [$c3b0], a
    ld [$c3b1], a
    ret


.jr_002_532e
    ld a, d
    xor h
    rlca
    push af
    ld a, d
    rlca
    push af
    jr nc, .jr_002_533e

    ld a, d
    cpl
    ld d, a
    ld a, e
    cpl
    ld e, a
    inc de

.jr_002_533e
    ld a, h
    rlca
    jr nc, .jr_002_5349

    ld a, h
    cpl
    ld h, a
    ld a, l
    cpl
    ld l, a
    inc hl

.jr_002_5349
    ld b, h
    ld c, l
    ld hl, $0000
    ld a, $10

.jr_002_5350
    push af
    sla e
    rl d
    rl l
    rl h
    ld a, l
    sub c
    ld a, h
    sbc b
    jr c, .jr_002_5364

    ld h, a
    ld a, l
    sub c
    ld l, a
    inc e

.jr_002_5364
    pop af
    dec a
    jr nz, .jr_002_5350

    pop af
    jr nc, .jr_002_536e

    call TrapMathNeg16

.jr_002_536e
    ld a, l
    ld [$c3b0], a
    ld a, h
    ld [$c3b1], a
    ld l, e
    ld h, d

    ; fall through


jr_002_5378:
    pop af
    ret nc

    ; fall through


TrapMathNeg16::
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


TrapMathAbs16::
    bit 7, h
    ret z

    jr TrapMathNeg16


TrapRandNext::
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
    ld [$c3b3], a
    xor l
    ld l, a
    ld h, $00
    ret


TrapRandInit::
    ld a, l
    ld [$c3b2], a
    ld a, h
    ld [$c3b3], a
    xor a
    ld [$c3b4], a
    ret
