; Disassembly of "char-view.gbf"

INCLUDE "src/charmap.inc"
INCLUDE "src/common.inc"
INCLUDE "src/hardware.inc"
INCLUDE "src/macro.inc"
INCLUDE "src/trap.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $43           ; owner code
.title
    dk "CHAR-DUMP"
.icon
.end

History:
.end

Main::
    ld sp, $e000
    xor a
    trap DrawInit
    xor a
    ld hl, varAddr
    ld [hli], a
    ld [hl], a
    ld [varUnknown], a
    ld a, $80
    ld hl, $0110
    ld de, $0205
    ld bc, $1008
    trap $59
    callx DrawAddress
    callx DrawGrid

.loop
    trap AwaitFrame
    trap InputButtons
    ld hl, varAddr
    ld c, a
    bit BTN_STA_F, c
    jr nz, Main2.start
    bit BTN_UP_F, c
    jr nz, .up
    bit BTN_DN_F, c
    jr nz, .dn
    bit BTN_LT_F, c
    jr nz, .lt
    bit BTN_RT_F, c
    jr nz, .rt
    bit BTN_A_F, c
    jr nz, Main2.a
    bit BTN_B_F, c
    jr nz, Main2.b
    bit BTN_SEL_F, c
    jr z, .loop
    trap ExitToMenu

.rt
    ld a, [hl]
    xor $80
    ld [hl], a
    jr nz, .newAddr
.up
    inc hl
    inc [hl]
    jr .newAddr

.lt
    ld a, [hl]
    xor $80
    ld [hl], a
    jr z, .newAddr
.dn
    inc hl
    dec [hl]

.newAddr
    callx DrawAddress
    jr .loop


DrawAddress:
    ld hl, $0402
    trap DrawAt
    ld hl, varAddr
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, varAddrStr
    trap StrConvHex
    dec hl
    dec hl
    trap DrawString
    ret

Main2:
.a
    ld a, $80
    add [hl]
    ld [hli], a
    ld a, $00
    adc [hl]
    ld [hl], a
    jr .start
.b
    ld a, [hl]
    sub $80
    ld [hli], a
    ld a, [hl]
    sbc $00
    ld [hl], a
.start
    callx DrawAddress
    callx DrawGrid
    jr Main.loop

DrawGrid:
    ld hl, varAddr
    ld a, [varAddr]
    swap a
    ld c, a
    ld b, $08
    ld de, $0005
    push bc

.nextRow
    callx DrawDigit
    inc e
    inc c
    dec b
    jr nz, .nextRow

    pop bc
    ld de, $0204
    swap c
    ld b, $10

.nextCol
    callx DrawDigit
    inc d
    inc c
    dec b
    jr nz, .nextCol

    trap LCDDisable
    ld e, $00
    ld hl, $8800
    ld bc, $0800
    trap MemSet
    ld hl, varAddr
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld bc, $8003
    ld hl, $8800
    trap $1b
    ld a, $03
    trap LCDEnable
    ret

DrawDigit:
    push de
    push bc
    ld l, e
    ld h, d
    trap DrawAt
    ld a, c
    and $F
    cp $A
    jr c, .decimal
    add "A" - $A - "0"
.decimal
    add "0"
    trap DrawChar
    pop bc
    pop de
    ret

SECTION "WRAM Variables", WRAM0[$cb04]

varUnknown:
    db
varAddr:
    dw

SECTION "WRAM Scratch", WRAM0[$cac4]

varAddrStr:
    ds 4
