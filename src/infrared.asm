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

SECTION "ROM Infrared", ROMX[$68a9], BANK[$1]

Call_001_68a9:
Jump_001_68a9:
    ldh [hRAMBank], a
    ld [rRAMBank], a
    ret


Call_001_68af:
    dec c
    jr z, jr_001_68b6

    or a
    bit 0, [hl]
    ret


jr_001_68b6:
    scf
    ret


SendIRWord1:
    ld c, 8

.nextBit
    rla
    jr c, .bit1

    ld b, 10
    jr .pulse

.bit1
    ld b, [hl]
    ld b, 18

.pulse
    call PulseIR
    dec c
    jr nz, .nextBit

    push bc
    pop bc
    ld b, 35
    call PulseIR
    ld b, 10
    call PulseIR
    ret


RecvIRWord1:
    ld b, $00

.nextBit
    call TimeIR
    jr c, .cancel

    cp 26
    jr nc, .stop

    cp 15
    rl d
    jr .nextBit

.stop
    ldh a, [rP1]
    bit 1, a
    jr z, .cancel

    bit 0, [hl]
    jr nz, .stop

    ld a, 10

.wait
    dec a
    jr nz, .wait

    ld a, d
    cpl
    ret


.cancel
    xor a
    ret


SendIRWord2:
    push hl
    push de
    push bc
    ld hl, rIR
    ld d, a
    ld [hl], $01
    ld c, $00

.jr_001_6907
    call Call_001_68af
    jr c, jr_001_6987

    jr z, .jr_001_6907

    push bc
    pop bc
    push bc
    pop bc
    ld [hl], $00
    ld c, $00

.jr_001_6916
    call Call_001_68af
    jr c, jr_001_6987

    jr nz, .jr_001_6916

    ld a, d
    ld c, 8

.nextBit
    rla
    jr c, .bit1

    ld b, 10
    jr .pulse

.bit1
    ld b, [hl]
    ld b, 18

.pulse
    call PulseIR
    dec c
    jr nz, .nextBit

    push bc
    pop bc
    ld b, 10
    call PulseIR
    xor a
    pop bc
    pop de
    pop hl
    ret


RecvIRWord2:
    push hl
    push de
    push bc
    ld hl, rIR
    ld c, $00
    ld [hl], $00

.jr_001_6946
    call Call_001_68af
    jr c, jr_001_6987

    jr z, .jr_001_6946

    ld [hl], $01
    ld c, $00

.jr_001_6951
    call Call_001_68af
    jr c, jr_001_6987

    jr nz, .jr_001_6951

    push bc
    pop bc
    push bc
    pop bc
    ld [hl], $00
    ld c, $08
    ld b, $00

.jr_001_6962:
    inc b
    jr z, jr_001_6987

    bit 0, [hl]
    jr z, .jr_001_6962

    ld c, $08

.jr_001_696b
    call TimeIR
    jr c, jr_001_6987

    cp 15
    rl d
    dec c
    jr nz, .jr_001_696b

    ld c, $00

.jr_001_6979
    call Call_001_68af
    jr c, jr_001_6987

    jr nz, .jr_001_6979

    ld a, d
    cpl
    pop bc
    pop de
    pop hl
    or a
    ret


jr_001_6987:
    ld [hl], $00
    pop bc
    pop de
    pop hl

ReportIRFailure:
    ld a, $ff
    or a
    scf
    ret


PulseIR:
    push af
    ld a, b
    ld [hl], $01

.on
    dec a
    jr nz, .on

    ld a, b
    ld [hl], $00

.off
    dec a
    jr nz, .off

    pop af
    ret


TimeIR:
    ld b, $00

.notOnYet
    inc b
    jr z, ReportIRFailure

    bit 0, [hl]
    jr z, .notOnYet

    ld b, $00

.stillOn
    inc b
    jr z, ReportIRFailure

    bit 0, [hl]
    jr nz, .stillOn

.stillOff
    inc b
    jr z, ReportIRFailure

    bit 0, [hl]
    jr z, .stillOff

    or a
    ld a, b
    ret


; Write %10101010 and read %01010101
; Write %11000011 and read %00111100
SendIRHandshake:
    ld hl, rIR

.retry
    ldh a, [rP1]
    bit 1, a
    jr z, ReportIRFailure

    ld a, $aa
    call SendIRWord1
    call RecvIRWord1
    cp $55
    jr nz, .retry

    ldh a, [rP1]
    bit 1, a
    jr z, ReportIRFailure

    ld a, $c3
    call SendIRWord1
    call RecvIRWord1
    cp $3c
    jr nz, .retry

    xor a
    ret


; Read %10101010 and write %01010101
; Read %11001100 and write %00110011
ReceiveIRHandshake:
    ld hl, rIR

.retry
    ldh a, [rP1]
    bit 1, a
    jr z, ReportIRFailure

    call RecvIRWord1
    cp $aa
    jr nz, .retry

    ld a, $55
    call SendIRWord1
    ldh a, [rP1]
    bit 1, a
    jr z, ReportIRFailure

    call RecvIRWord1
    cp $c3
    jr nz, .retry

    ld a, $3c
    call SendIRWord1
    xor a
    ret


ReportIRFailureLong:
    jp ReportIRFailure


SendIRRegisters:
    call SendIRHandshake
    jr c, ReportIRFailureLong

    ld a, IR_ID0
    call SendIRWord2
    ld a, IR_ID1
    call SendIRWord2
    ld hl, $c0f8
    ld c, $08
    jp SendIRRange


RecvIRRegisters:
.retry
    call ReceiveIRHandshake
    jr c, ReportIRFailureLong

    call RecvIRWord2
    cp IR_ID0
    jr nz, .retry

    call RecvIRWord2
    cp IR_ID1
    jr nz, .retry

    ld hl, $c0f8
    ld c, $08
    jp RecvIRRange


SendIRRange:
    ld b, $00

.nextWord
    ld a, b
    add [hl]
    ld b, a
    ld a, [hl+]
    call SendIRWord2
    jr c, .jr_001_6a57

    dec c
    jr nz, .nextWord

    ld a, b
    cpl
    inc a
    call SendIRWord2

.jr_001_6a57
    ret


RecvIRRange:
    ld b, $00

.jr_001_6a5a
    call RecvIRWord2
    jr c, ReportIRFailureLong

    ld [hl+], a
    add b
    ld b, a
    dec c
    jr nz, .jr_001_6a5a

    call RecvIRWord2
    add b
    or a
    jr nz, ReportIRFailureLong

    ret


BeginIR:
    di
    ld a, P1F_GET_BTN
    ldh [rP1], a
    call EnableIRMode
    xor a
    ld [rIR], a
    ret


FinishIR:
    xor a
    ld [rIR], a
    call DisableIRMode
    ld a, P1F_GET_NONE
    ldh [rP1], a
    ei
    ret


DisableIRMode:
    push af
    xor a
    jr EnableIRMode.set

EnableIRMode:
    push af
    ld a, kIRModeOn

.set
    ld [rIRMode], a
    pop af
    ret


TrapIRListen::
    call BeginIR

.next
    call RecvIRRegisters
    jr c, .fail

    jr nz, .next

    ld hl, $c0f9
    ld a, [hl]
    ld hl, IRCommands
    cp (IRCommands.end - IRCommands) / 2
    jr nc, .next

    call RunIRCommand
    jr .next

.fail
    call FinishIR
    xor a
    scf
    ret


RunIRCommand:
    add a
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


IRCommands:
    dw IRCmdClose
    dw IRCmd01
    dw IRCmdFileSearch
    dw IRCmdFileWrite
    dw IRCmd04
    dw IRCmd05
    dw IRCmd06
    dw IRCmd07
    dw IRCmdRead
    dw IRCmd09
    dw IRCmd0A
    dw IRCmdWrite
    dw IRCmd0C
.end

IRRespondRegisters:
    call SaveRegisters
    call SendIRHandshake
    ret c

    ld hl, $c0f8
    ld c, $08
    jp SendIRRange


IRCmdClose:
    call FinishIR
    pop hl
    or a
    ret


IRCmd01:
    ld hl, $0000
    trap $e6
    ld a, [KissCartridgeCode]
    jp IRRespondRegisters


IRCmdFileSearch:
    call RestoreRegisters
    ld hl, $c400
    call RecvIRRange
    ret c

    call DisableIRMode
    call RestoreRegisters
    ld hl, $c500
    ld de, $c400
    trap FileSearch

    ; fall through


Call_001_6b10:
    call EnableIRMode
    call IRRespondRegisters
    ret c

    ld hl, $c500
    ld c, $00
    jp SendIRRange


IRCmdFileWrite:
    call Call_001_6b88
    ret c

    trap FileWrite
    jr Call_001_6b10


IRCmd05:
    call Call_001_6b88
    ret c

    trap $e8
    jr Call_001_6b10


IRCmd04:
    call DisableIRMode
    call RestoreRegisters
    ld hl, $c500
    trap $ea
    call EnableIRMode
    jp IRRespondRegisters


IRCmd07:
    call Call_001_6b54
    push bc
    trap $eb
    call EnableIRMode
    call IRRespondRegisters
    pop bc
    ret c

    ld hl, $c400
    jp SendIRRange


Call_001_6b54:
    call RestoreRegisters
    ld b, $00
    inc c
    dec c
    jr nz, .jr_001_6b5e

    inc b

.jr_001_6b5e
    ld hl, $c500
    ld de, $c400
    jp DisableIRMode


IRCmd0A:
    call RestoreRegisters
    ld hl, $c400
    call RecvIRRange
    ret c

    call Call_001_6b54
    trap $ec
    call EnableIRMode
    jp IRRespondRegisters


IRCmd06:
    call Call_001_6b88
    ret c

    trap $ef
    call EnableIRMode
    jp IRRespondRegisters


Call_001_6b88:
    ld hl, $c500
    ld c, $00
    call RecvIRRange
    ret c

    call DisableIRMode
    call RestoreRegisters
    ld hl, $c500
    or a
    ret


IRCmdRead:
    call SendIRHandshake
    ret c

    call RestoreRegisters
    jp SendIRRange


IRCmd09:
    ldh a, [hRAMBank]
    push af
    call RestoreRegisters
    call Call_001_6c05
    ld de, $c400
    call DisableIRMode
    push de
    push bc

.jr_001_6bb7
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, .jr_001_6bb7

    call EnableIRMode
    call SendIRHandshake
    ret c

    pop bc
    pop hl
    call SendIRRange
    pop af
    jp Jump_001_68a9


IRCmdWrite:
    call RestoreRegisters
    ld l, e
    ld h, d

    ; fall through


Call_001_6bd2:
    call RecvIRRange
    jr c, .done

    sub b
    call SendIRWord2

.done
    ret


IRCmd0C:
    ldh a, [hRAMBank]
    push af
    call RestoreRegisters
    ld hl, $c400
    push hl
    push de
    push bc
    call Call_001_6bd2
    pop bc
    pop hl
    pop de
    jr c, .jr_001_6c01

    call Call_001_6c05
    ld a, kIRReadWrite
    ld [rIRMode], a

.jr_001_6bf8
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, .jr_001_6bf8

    call EnableIRMode

.jr_001_6c01
    pop af
    jp Jump_001_68a9


Call_001_6c05:
    push hl
    ld a, b
    rl h
    rla
    rl h
    rla
    rl h
    rla
    call Call_001_68a9
    pop hl
    ld a, h
    and $1f
    or $a0
    ld h, a
    ret


TrapIRClose::
    call BeginIR
    ld a, $00
    ld [$c0f9], a
    call SendIRRegisters
    jr jr_001_6c7b


trap_74_6c28::
    call Call_001_6c81
    jr c, jr_001_6c7b

    jr jr_001_6c78


TrapIRFileSearch::
    ld a, $02
    call Call_001_6ceb
    ld l, e
    ld h, d
    jr jr_001_6c43


TrapIR05::
    ld a, $05
    jr jr_001_6c3e


TrapIRFileWrite::
    ld a, $03

jr_001_6c3e:
    call Call_001_6ceb
    ld c, $00

jr_001_6c43:
    call SendIRRange
    jr c, jr_001_6c7b

    call RestoreRegisters
    push hl
    call Call_001_6c81
    pop hl
    jr c, jr_001_6c7b

    ld c, $00
    call RecvIRRange
    jr c, jr_001_6c7b

    jr jr_001_6c78

TrapIR04::
    ld a, $04
    call Call_001_6ceb
    call Call_001_6c81
    jr c, jr_001_6c7b

    jr jr_001_6c78

TrapIR06::
    ld a, $06
    call Call_001_6ceb
    ld c, $00
    call SendIRRange
    jr c, jr_001_6c7b

    call Call_001_6c81
    jr c, jr_001_6c7b

jr_001_6c78:
    call RestoreRegisters

jr_001_6c7b:
    push af
    call FinishIR
    pop af
    ret


Call_001_6c81:
    call ReceiveIRHandshake
    jr c, jr_001_6c7b

    ld hl, $c0f8
    ld c, $08
    jp RecvIRRange


TrapIR09::
    ld a, $09
    jr jr_001_6c94

TrapIRRead::
    ld a, $08

jr_001_6c94:
    call Call_001_6ceb
    push de
    push bc
    call ReceiveIRHandshake
    pop bc
    pop hl
    jr c, jr_001_6c7b

    call RecvIRRange
    jr jr_001_6c7b

TrapIR0C::
    ld a, $0c
    jr jr_001_6cab

TrapIRWrite::
    ld a, $0b

jr_001_6cab:
    call Call_001_6ceb
    call SendIRRange
    jr c, jr_001_6c7b

    call RecvIRWord2
    jr c, jr_001_6c7b

    add b
    jr nz, jr_001_6cbe

    xor a
    jr jr_001_6c7b

jr_001_6cbe:
    call ReportIRFailure

jr_001_6cc1:
    jr jr_001_6c7b

TrapIR07::
    ld a, $07
    call Call_001_6ceb
    push de
    push bc
    call Call_001_6c81
    pop bc
    pop hl
    jr c, jr_001_6c7b

    call RecvIRRange
    jr c, jr_001_6c7b

    jr jr_001_6c78

TrapIR0A::
    ld a, $0a
    call Call_001_6ceb
    ld l, e
    ld h, d
    call SendIRRange
    jr c, jr_001_6c7b

    call Call_001_6c81
    jr c, jr_001_6c7b

    jr jr_001_6c78

Call_001_6ceb:
    push hl
    push de
    push bc
    call SaveRegisters
    call BeginIR
    call SendIRRegisters
    pop bc
    pop de
    pop hl
    ret nc

    inc sp
    inc sp
    jr jr_001_6cc1

SaveRegisters:
    push de
    push hl
    push af
    ld hl, $c0f8
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    ld [hl], c
    inc hl
    ld [hl], b
    ret


RestoreRegisters:
    ld hl, $c0f8
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push de
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push de
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    pop hl
    pop af
    ret
