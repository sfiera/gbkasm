; N5UNLOCK -- unlocks Quick Play mode in Nectaris GB

INCLUDE "src/charmap.inc"
INCLUDE "src/common.inc"
INCLUDE "src/hardware.inc"
INCLUDE "src/macro.inc"
INCLUDE "src/trap.inc"

DEF SetROMBank           EQU $05bf
DEF PlayMusic            EQU $0cbf
DEF PlaySound            EQU $0d07
DEF IsQuickStartEnabled  EQU $11a2

SECTION "Fragment", ROM0[$0]

LOAD "WRAM Code", WRAM0[$c600]
Main:
    ld a, $20
    trap DrawInit
    ld a, %00011011
    ldh [$ff9c], a

    ; Nectaris font, capital letters
    ld a, $02
    call SetROMBank
    ld hl, $6e00
    ld de, $9410
    ld bc, $10 * 26
    call Copy

    ; Earthrise tile data
    ld a, $0c
    call SetROMBank
    ld hl, $4000 + 360
    ld de, $8800
    ld bc, $570
    call Copy

    ; Earthrise tile map
    ld hl, $4000
    ld de, $9800
    ld c, 10
.row
    push bc
    ld bc, 32
    call Copy
    ld bc, -12
    add hl, bc
    pop bc
    dec c
    jr nz, .row

    ld a, LCDCF_BGON
    trap LCDEnable

.check
    ld hl, VarCode
    ld de, $5e00
    ld bc, 2
    push hl
    push bc
    trap CRAMRead
    pop bc
    pop hl

    ld de, MagicWord
    trap MemCmp
    or a
    ld hl, LayoutLocked
    jr nz, .draw

    ld hl, LayoutUnlocked

.draw
    trap DrawLayout

.loop
    trap AwaitFrame
    trap InputButtons
    rrca
    jr c, .unlock

    rrca
    jr c, .lock

    rrca
    jr nc, .loop

    trap ExitToMenu

.unlock
    ld hl, MagicWord
    jr .write

.lock
    ld a, $ff
    ld hl, VarCode
    ld [hl+], a
    ld [hl-], a

.write
    ld de, $5e00
    ld bc, 2
    trap CRAMWrite
    jr .check


; Same as MemCopy trap, but the trap can’t be used
; because the trap is in a different bank
; from the source data that it is called with.
Copy:
    ld a, b
    or c
    ret z

    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    jr Copy


MagicWord:
    dk "AT"

LayoutLocked:
    dk $05, $0b, "QUICK PLAY\0"
    dk $06, $0c, " LOCKED \0"
    dk $04, $0f, "A TO UNLOCK\0"
    dk $03, $10, "SELECT TO EXIT\0"
    db $ff

LayoutUnlocked:
    dk $05, $0b, "QUICK PLAY\0"
    dk $06, $0c, "UNLOCKED\0"
    dk $04, $0f, " B TO LOCK \0"
    dk $03, $10, "SELECT TO EXIT\0"
    db $ff

ENDL


SECTION "Variables", WRAM0[$cc00]

VarCode:
    ds 2
