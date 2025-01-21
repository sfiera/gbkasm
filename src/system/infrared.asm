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

SECTION "system/infrared: ROM Infrared", ROMX

SetSRAMBank:
    ldh [hRAMBank], a
    ld [rRAMBank], a
    ret


TestIR:
    dec c
    jr z, .jr_001_68b6

    or a
    bit 0, [hl]
    ret


.jr_001_68b6
    scf
    ret


SendIRSyncByte:
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


RecvIRSyncByte:
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


SendIRByte:
    push hl
    push de
    push bc
    ld hl, rIR
    ld d, a
    ld [hl], $01
    ld c, $00

.jr_001_6907
    call TestIR
    jr c, DisableIRAndReportFailure

    jr z, .jr_001_6907

    push bc
    pop bc
    push bc
    pop bc
    ld [hl], $00
    ld c, $00

.jr_001_6916
    call TestIR
    jr c, DisableIRAndReportFailure

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


RecvIRByte:
    push hl
    push de
    push bc
    ld hl, rIR
    ld c, $00
    ld [hl], $00

.jr_001_6946
    call TestIR
    jr c, DisableIRAndReportFailure

    jr z, .jr_001_6946

    ld [hl], $01
    ld c, $00

.jr_001_6951
    call TestIR
    jr c, DisableIRAndReportFailure

    jr nz, .jr_001_6951

    push bc
    pop bc
    push bc
    pop bc
    ld [hl], $00
    ld c, $08
    ld b, $00

.jr_001_6962
    inc b
    jr z, DisableIRAndReportFailure

    bit 0, [hl]
    jr z, .jr_001_6962

    ld c, $08

.jr_001_696b
    call TimeIR
    jr c, DisableIRAndReportFailure

    cp 15
    rl d
    dec c
    jr nz, .jr_001_696b

    ld c, $00

.jr_001_6979
    call TestIR
    jr c, DisableIRAndReportFailure

    jr nz, .jr_001_6979

    ld a, d
    cpl
    pop bc
    pop de
    pop hl
    or a
    ret


DisableIRAndReportFailure:
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
    call SendIRSyncByte
    call RecvIRSyncByte
    cp $55
    jr nz, .retry

    ldh a, [rP1]
    bit 1, a
    jr z, ReportIRFailure

    ld a, $c3
    call SendIRSyncByte
    call RecvIRSyncByte
    cp $3c
    jr nz, .retry

    xor a
    ret


; Read %10101010 and write %01010101
; Read %11000011 and write %00111100
ReceiveIRHandshake:
    ld hl, rIR

.retry
    ldh a, [rP1]
    bit 1, a
    jr z, ReportIRFailure

    call RecvIRSyncByte
    cp $aa
    jr nz, .retry

    ld a, $55
    call SendIRSyncByte
    ldh a, [rP1]
    bit 1, a
    jr z, ReportIRFailure

    call RecvIRSyncByte
    cp $c3
    jr nz, .retry

    ld a, $3c
    call SendIRSyncByte
    xor a
    ret


ReportIRFailureLong:
    jp ReportIRFailure


SendIRRegisters:
    call SendIRHandshake
    jr c, ReportIRFailureLong

    ld a, IR_ID0
    call SendIRByte
    ld a, IR_ID1
    call SendIRByte
    ld hl, $c0f8
    ld c, $08
    jp SendIRRange


RecvIRRegisters:
.retry
    call ReceiveIRHandshake
    jr c, ReportIRFailureLong

    call RecvIRByte
    cp IR_ID0
    jr nz, .retry

    call RecvIRByte
    cp IR_ID1
    jr nz, .retry

    ld hl, $c0f8
    ld c, $08
    jp RecvIRRange


SendIRRange:
    ld b, $00

.nextByte
    ld a, b
    add [hl]
    ld b, a
    ld a, [hl+]
    call SendIRByte
    jr c, .done

    dec c
    jr nz, .nextByte

    ld a, b
    cpl
    inc a
    call SendIRByte

.done
    ret


RecvIRRange:
    ld b, $00

.jr_001_6a5a
    call RecvIRByte
    jr c, ReportIRFailureLong

    ld [hl+], a
    add b
    ld b, a
    dec c
    jr nz, .jr_001_6a5a

    call RecvIRByte
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
.close       dw IRCmdClose       ;
.cmd01       dw IRCmd01          ; trap $e6
.fileSearch  dw IRCmdFileSearch  ;
.fileWrite   dw IRCmdFileWrite   ;
.cmd04       dw IRCmd04          ; trap $ea
.fileNext    dw IRCmdFileNext    ;
.fileDelete  dw IRCmdFileDelete  ;
.cmd07       dw IRCmd07          ; trap $eb
.read        dw IRCmdRead        ; WRAM; ROM?
.readSRAM    dw IRCmdReadSRAM    ; SRAM read
.cmd0A       dw IRCmd0A          ; trap $ec
.write       dw IRCmdWrite       ; WRAM; ROM?
.writeSRAM   dw IRCmdWriteSRAM   ; SRAM write
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


SendIRFileData:
    call EnableIRMode
    call IRRespondRegisters
    ret c

    ld hl, $c500
    ld c, $00
    jp SendIRRange


IRCmdFileWrite:
    call RecvIRFileData
    ret c

    trap FileWrite
    jr SendIRFileData


IRCmdFileNext:
    call RecvIRFileData
    ret c

    trap FileNext
    jr SendIRFileData


IRCmd04:
    call DisableIRMode
    call RestoreRegisters
    ld hl, $c500
    trap $ea
    call EnableIRMode
    jp IRRespondRegisters


IRCmd07:
    call PrepareFileRange
    push bc
    trap $eb
    call EnableIRMode
    call IRRespondRegisters
    pop bc
    ret c

    ld hl, $c400
    jp SendIRRange


; Sets up the following register values:
; af: from sent af
; hl: $c500
; de: $c400
; bc: from sent c (if c is 0, set bc to $100)
PrepareFileRange:
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

    call PrepareFileRange
    trap $ec
    call EnableIRMode
    jp IRRespondRegisters


IRCmdFileDelete:
    call RecvIRFileData
    ret c

    trap FileDelete
    call EnableIRMode
    jp IRRespondRegisters


RecvIRFileData:
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


IRCmdReadSRAM:
    ldh a, [hRAMBank]
    push af
    call RestoreRegisters
    call MapSRAMAddress
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
    jp SetSRAMBank


IRCmdWrite:
    call RestoreRegisters
    ld l, e
    ld h, d

    ; fall through


Call_001_6bd2:
    call RecvIRRange
    jr c, .done

    sub b
    call SendIRByte

.done
    ret


IRCmdWriteSRAM:
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

    call MapSRAMAddress
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
    jp SetSRAMBank


; Map a given SRAM address into memory.
; Set the bank to ((hl & $E000) >> 13).
; Then set hl to ((hl & $1FFF) | $A000).
MapSRAMAddress:
    push hl
    ld a, b
    rl h
    rla
    rl h
    rla
    rl h
    rla
    call SetSRAMBank
    pop hl
    ld a, h
    and $1f
    or $a0
    ld h, a
    ret


TrapIRClose::
    call BeginIR
    ld a, (IRCommands.close - IRCommands) >> 1
    ld [$c0f9], a
    call SendIRRegisters
    jr FinishIRaf


trap_74_6c28::
    call RecvResponse
    jr c, FinishIRaf

    jr FinishIRRestoreRegisters


TrapIRFileSearch::
    ld a, (IRCommands.fileSearch - IRCommands) >> 1
    call SendIRCommand
    ld l, e
    ld h, d
    jr TrapIRFileWrite.sendRange


TrapIRFileNext::
    ld a, (IRCommands.fileNext - IRCommands) >> 1
    jr TrapIRFileWrite.sendCmd


TrapIRFileWrite::
    ld a, (IRCommands.fileWrite - IRCommands) >> 1

.sendCmd
    call SendIRCommand
    ld c, $00

    ; fall through


.sendRange
    call SendIRRange
    jr c, FinishIRaf

    call RestoreRegisters
    push hl
    call RecvResponse
    pop hl
    jr c, FinishIRaf

    ld c, $00
    call RecvIRRange
    jr c, FinishIRaf

    jr FinishIRRestoreRegisters


TrapIR04::
    ld a, (IRCommands.cmd04 - IRCommands) >> 1
    call SendIRCommand
    call RecvResponse
    jr c, FinishIRaf

    jr FinishIRRestoreRegisters


TrapIRFileDelete::
    ld a, (IRCommands.fileDelete - IRCommands) >> 1
    call SendIRCommand
    ld c, $00
    call SendIRRange
    jr c, FinishIRaf

    call RecvResponse
    jr c, FinishIRaf

    ; fall through


FinishIRRestoreRegisters:
    call RestoreRegisters

    ; fall through


; Call FinishIR but preserve value of af registers.
FinishIRaf:
    push af
    call FinishIR
    pop af
    ret


RecvResponse:
    call ReceiveIRHandshake
    jr c, FinishIRaf

    ld hl, $c0f8
    ld c, $08
    jp RecvIRRange


TrapIRReadSRAM::
    ld a, (IRCommands.readSRAM - IRCommands) >> 1
    jr TrapIRRead.jr_001_6c94


TrapIRRead::
    ld a, (IRCommands.read - IRCommands) >> 1

.jr_001_6c94
    call SendIRCommand
    push de
    push bc
    call ReceiveIRHandshake
    pop bc
    pop hl
    jr c, FinishIRaf

    call RecvIRRange
    jr FinishIRaf


TrapIRWriteSRAM::
    ld a, (IRCommands.writeSRAM - IRCommands) >> 1
    jr TrapIRWrite.jr_001_6cab


TrapIRWrite::
    ld a, (IRCommands.write - IRCommands) >> 1

.jr_001_6cab
    call SendIRCommand
    call SendIRRange
    jr c, FinishIRaf

    call RecvIRByte
    jr c, FinishIRaf

    add b
    jr nz, .jr_001_6cbe

    xor a
    jr FinishIRaf


.jr_001_6cbe
    call ReportIRFailure

    ; fall though


FinishIRafLong:
    jr FinishIRaf


TrapIR07::
    ld a, (IRCommands.cmd07 - IRCommands) >> 1
    call SendIRCommand
    push de
    push bc
    call RecvResponse
    pop bc
    pop hl
    jr c, FinishIRaf

    call RecvIRRange
    jr c, FinishIRaf

    jr FinishIRRestoreRegisters


TrapIR0A::
    ld a, (IRCommands.cmd0A - IRCommands) >> 1
    call SendIRCommand
    ld l, e
    ld h, d
    call SendIRRange
    jr c, FinishIRaf

    call RecvResponse
    jr c, FinishIRaf

    jr FinishIRRestoreRegisters


SendIRCommand:
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
    jr FinishIRafLong


; Copy registers (falhedcb) into the 8 bytes at $c0f8.
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


; Copy the 8 bytes at $c0f8 into registers (falhedcb).
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
