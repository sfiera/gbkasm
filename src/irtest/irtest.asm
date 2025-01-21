; Disassembly of "irtest.gbf"

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

DEF IR_ID0 EQU "i"
DEF IR_ID1 EQU "R"
DEF NAME_LEN EQU 10

SECTION "ROM Bank $000", ROM0[$0]

Header:
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $00           ; owner code
.title
    dk "IRTEST"
.end

History:
.points
    dw 1
.author
    dp "sfiera    ", 1
.history
    ds 11
    ds 11
    ds 11
.end

Main:
    ; Load the player name from the profile region.
    ld hl, VarLocalName
    ld de, $ff46  ; $ff → profile; $46 → player name
    ld bc, NAME_LEN
    trap CRAMRead

    xor a
    trap DrawInit
    ldx hl, LayoutMenu
    trap DrawLayout

Menu:
    ldx de, .menuConfig
    xor a
    trap InputCursorMenu
    jr c, .exit

    or a
    jr z, Receive
    dec a
    jr z, Send

.exit
    trap ExitToMenu


.menuConfig
    db 3         ; item count
    db 7, 3      ; initial position
    db ">", " "  ; cursor characters
    dw 0         ; update callback


Receive:
    ldx hl, LayoutReceiving
    trap DrawLayout
    trap AwaitBlit

    ; Set up the identifying code where the remote device expects it.
    ld hl, VarIRCode
    ld [hl], IR_ID0
    inc hl
    ld [hl], IR_ID1

    trap IRListen
    jr c, Error

    ; fall through


Success:
    ldx hl, LayoutSuccess
    trap DrawLayout

    ; Display the name of the remote player (plain text encoding).
    ld hl, $050a
    trap DrawAt
    ld hl, VarRemoteName
    ld c, NAME_LEN

.loop
    ld a, [hl+]
    trap DrawChar
    dec c
    jr nz, .loop

    jr Menu


Mismatch:
    ldx hl, LayoutMismatch
    trap DrawLayout
    jr Menu


Error:
    ldx hl, LayoutFailure
    trap DrawLayout

.releaseB
    ; Wait until the player releases the B button.
    ; If the player canceled send or receive with B,
    ; then this prevents cancellation of the menu too.
    trap AwaitFrame
    trap InputButtons
    ldh a, [$8a]
    and BTN_B
    jr nz, .releaseB

    jr Menu


Send:
    ldx hl, LayoutSending
    trap DrawLayout
    trap AwaitBlit

    ; Read the identifying code from the remote device.
    ld hl, VarIRCode
    ld d, h
    ld e, l
    ld c, 2
    trap IRRead
    jr c, Error

    ; Check that the identifying code equals the expected value (“iR”).
    ; If not, the remote device is not running IRTEST but some other software.
    ld hl, VarIRCode
    ld a, [hl+]
    cp IR_ID0
    jr nz, Mismatch
    ld a, [hl]
    cp IR_ID1
    jr nz, Mismatch

    ; Read remote device’s local player name to local device’s remote player name.
    ld hl, VarLocalName
    ld de, VarRemoteName
    ld c, NAME_LEN
    trap IRRead
    jr c, Error

    ; Write local device’s local player name to remote device’s remote player name.
    ld hl, VarLocalName
    ld de, VarRemoteName
    ld c, NAME_LEN
    trap IRWrite
    jr c, Error

    ; Tell remote device to stop listening.
    trap IRClose
    jr c, Error

    jr Success


LayoutSending:
    dh $05, $08, " SENDING \0"
    dh $05, $0a, "          \0"
    db $ff

LayoutReceiving:
    dh $05, $08, "RECEIVING\0"
    dh $05, $0a, "          \0"
    db $ff

LayoutSuccess:
    dh $05, $08, " SUCCESS \0"
    db $ff

LayoutFailure:
    dh $05, $08, " FAILURE \0"
    db $ff

LayoutMismatch:
    dh $05, $08, " MISMATCH\0"
    db $ff

LayoutMenu:
    dh $07, $01, "IRTEST\0"
    dh $08, $03, "RECV\0"
    dh $08, $04, "SEND\0"
    dh $08, $05, "END\0"
    db $ff


SECTION "Variables", WRAM0[$cc00]

VarIRCode:
    ds 2

VarLocalName:
    ds NAME_LEN

VarRemoteName:
    ds NAME_LEN
