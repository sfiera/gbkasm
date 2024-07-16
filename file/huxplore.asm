; HUXPLORE -- HUC-3 inspection tool
;
; Shows the state of the HuC-3 mapper (if applicable).

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

MACRO ld2
    ld \1, (\2 << 8) | \3
ENDM

SECTION "GBKiss File", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $00           ; owner code
.title
    dk "HUXPLORE"
.icon
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


Main::
    ld sp, $e000
    xor a
    trap DrawInit
    callx CheckMapper

    ; Load relocated code into WRAM and jump to it.
    ldx de, WRAMCodeFrom
    ld bc, SIZEOF("WRAM Code")
    ld hl, WRAMCodeTo
    trap MemCopy
    jp WRAMMain


CheckMapper::
    ld a, [$0147]
    cp $fe
    ret z

    ldx hl, NotHuCLayout
    trap DrawLayout

.loop
    trap AwaitFrame
    trap InputButtons
    or a
    jr z, .loop
    ; fall through

    trap ExitToMenu


NotHuCLayout::
    dk 3, 7, "INVALID MAPPER\0"
    dk 2, 10, "PRESS ANY BUTTON\0"
    dk 6, 11, "TO EXIT\0"
    db -1


WRAMCodeFrom:
LOAD "WRAM Code", WRAM0[$c600]
WRAMCodeTo:

WRAMMain:
    call InitVideo

    ld2 bc, $0b, $40  ; set low nibble
    call Write
    ld2 bc, $0b, $50  ; set high nibble
    call Write
    ld2 bc, $0b, $10  ; read and increment
    call Write

    ld2 bc, 16, 16
    ld2 hl, $01, $01
    trap DrawAt
.next
    call Read
    call ToHexDigit
    trap DrawChar
    call Commit
    dec b
    jr nz, .next
    ld b, 16
    ld a, $0d
    trap DrawCtrlChar
    ld a, $01
    trap DrawCtrlChar
    dec c
    jr nz, .next

.loop
    call MainLoop
    jr .loop


Write::
    ld a, b
    ld [$0000], a
    ld a, c
    ld [$a000], a
    ; fall through


Commit::
    ld a, $0d
    ld [$0000], a
    ld a, $fe
    ld [$a000], a
.wait
    ld a, [$a000]
    bit 0, a
    jr z, .wait
    ret


Read::
    ld a, $0c
    ld [$0000], a
    ld a, [$a000]
    ret


MainLoop::
    trap AwaitFrame

    trap InputButtons
    bit BTN_SEL_F, a
    jr nz, Exit

    ret


Exit::
    ; Return mapper to SRAM readonly mode
    ld a, $00
    ld [$0000], a
    trap ExitToMenu


InitVideo::
    ld b, 0
    ld c, 16

.header
    ld a, b
    call ToHexDigit
    push af
    push af
    inc b

    ld h, 0
    ld l, b
    trap DrawAt
    pop af
    trap DrawChar

    ld h, b
    ld l, 0
    trap DrawAt
    pop af
    trap DrawChar

    dec c
    jr nz, .header

    ret


ToHexDigit::
    and $0f
    add "0"
    cp "0" + 10
    ret c

    add "A" - ("0" + 10)
    ret


ENDL
