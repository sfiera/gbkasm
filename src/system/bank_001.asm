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

DEF XFER_STARTED EQU $01
DEF XFER_SUCCESS EQU $02
DEF XFER_FAILURE EQU $03
DEF XFER_NOSPACE EQU $04
DEF XFER_IGNORE EQU $05

SECTION "Kiss System 1", ROMX

data_01_4018::
    db "\0\0"

data_01_401a::
    dp "GB KISS MENU \0"

AttrCross::
    INCBIN "gfx/system/attrs.2bpp", 0, 16
AttrTriangle::
    INCBIN "gfx/system/attrs.2bpp", 16, 16
AttrCircle::
    INCBIN "gfx/system/attrs.2bpp", 32, 16
AttrDiamond::
    INCBIN "gfx/system/attrs.2bpp", 48, 16
AttrBullseye::
    INCBIN "gfx/system/attrs.2bpp", 64, 16
ArrowIcon::
    INCBIN "gfx/system/attrs.2bpp", 80, 16

    ds 14

traps1::
    dw trap_4b_7dcc         ; $4b
    dw TrapTileLoad         ; $4c
    dw TrapStrTrim         ; $4d
    dw trap_4e_7f04         ; $4e
    dw trap_4f_7e90         ; $4f
    dw trap_50_7260         ; $50
    dw trap_51_665c         ; $51
    dw trap_52_7730         ; $52
    dw trap_53_784d         ; $53
    dw TrapKbdInit          ; $54
    dw TrapKbdEdit          ; $55
    dw trap_56_78f0         ; $56
    dw trap_57_7df1         ; $57
    dw TrapDrawBox          ; $58
    dw trap_59_7e43         ; $59
    dw trap_5a_7d47         ; $5a
    dw trap_5b_7d60         ; $5b
    dw TrapDrawLayout       ; $5c
    dw TrapTileLoadText     ; $5d
    dw trap_5e_77ae         ; $5e
    dw TrapInputCursorMenu  ; $5f
    dw trap_60_6d2f         ; $60
    dw trap_61_7222         ; $61
    dw TrapExtractInit      ; $62
    dw TrapExtractData      ; $63
    dw trap_64_6de4         ; $64
    dw trap_65_6e2e         ; $65
    dw trap_66_6f66         ; $66
    dw TrapMemCmp           ; $67
    dw trap_68_6f8f         ; $68
    dw TrapDrawString       ; $69
    dw TrapDrawStringList   ; $6a
    dw TrapFileSearch       ; $6b
    dw trap_6c_714d         ; $6c
    dw trap_6d_70ba         ; $6d
    dw trap_6e_71e6         ; $6e
    dw trap_6f_7138         ; $6f
    dw trap_70_6e8b         ; $70
    dw trap_71_6e63         ; $71
    dw TrapIRListen         ; $72
    dw TrapIRClose          ; $73
    dw trap_74_6c28         ; $74
    dw TrapIRFileSearch     ; $75
    dw TrapIRFileWrite      ; $76
    dw TrapIR04             ; $77
    dw TrapIRFileNext       ; $78
    dw TrapIRFileDelete     ; $79
    dw TrapIR07             ; $7a
    dw TrapIRReadSRAM       ; $7b
    dw TrapIRRead           ; $7c
    dw TrapIR0A             ; $7d
    dw TrapIRWriteSRAM      ; $7e
    dw TrapIRWrite          ; $7f


SECTION "Kiss System 1B", ROMX

Call_001_66dc::
    ld h, $04
    trap $ca
    ret

Call_001_66e1::
    ld de, $ff46
    ld bc, $003a
    push hl
    push bc
    trap CRAMRead
    pop bc
    pop hl
    ret


InitKissUser::
    ld a, $20
    trap DrawInit
    call KissClearScreen
    call InitMail
    call Call_001_66dc
    ld de, $0000
    ld bc, $140d
    trap DrawBox
    ld hl, data_01_67c2
    ld de, $8001
    trap $5a
    ld hl, data_01_67fe

jr_001_670e:
    call Call_001_67b5
    jr nz, jr_001_671f

    push hl
    ld a, c
    ld c, $01
    ld hl, $0100
    trap $59
    pop hl
    jr jr_001_670e

jr_001_671f:
    xor a
    ldh [$c3], a
    trap $e1
    jr nc, jr_001_6731

    ld a, $01
    ldh [$c3], a
    trap $65
    ld de, $c699
    trap $51

jr_001_6731:
    ld hl, $c600
    call Call_001_66e1
    ld de, $0001
    trap TileLoadText
    ld a, $03
    trap LCDEnable
    ldh a, [$c3]
    or a
    jr nz, jr_001_6757

    call DrawHelpBox
    ld hl, data_01_6824
    ld de, $b001
    trap $5a
    ld a, $10
    call Call_001_685d
    jr c, jr_001_67b3

jr_001_6757:
    ld de, $470d
    ld hl, $c699
    trap KbdInit

jr_001_675f:
    ld hl, data_01_67fe

jr_001_6762:
    call Call_001_67b5
    jr nz, jr_001_677b

    push hl
    ld hl, $c600
    ld e, c
    ld d, $00
    add hl, de
    ld d, c
    ld e, $01
    ld a, b
    trap StrTrim
    ld c, a
    trap KbdEdit
    pop hl
    jr jr_001_6762

jr_001_677b:
    ld hl, data_01_680e
    ld de, $b001
    trap $5a
    ld a, $0b
    call Call_001_685d
    jr nc, jr_001_6799

jr_001_678a:
    ld a, $7f
    ld de, $030a
    ld bc, $0e02
    ld hl, $0000
    trap $59
    jr jr_001_675f

jr_001_6799:
    ld hl, $c600
    ld c, $3b

jr_001_679e:
    dec c
    jr z, jr_001_678a

    ld a, [hl+]
    cp $20
    jr z, jr_001_679e

    trap $65
    ld hl, $c600
    ld de, $ff46
    ld bc, $003a
    trap CRAMWrite

jr_001_67b3:
    trap ExitToMenu

Call_001_67b5:
    ld d, $06
    ld e, [hl]
    bit 7, e
    ret nz

    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc hl
    xor a
    ret


data_01_67c2:
    dk $04, $01, "このカートリッジにあなたの\0"
    dh $04, $02, "じょうほうをとうろくします\0"
    dh $02, $04, "なまえ:\0"
    dh $02, $05, "でんわ:\0"
    dh $03, $06, "メモ:\0"
    db $ff

data_01_67fe:
    db $04, $00, $0a
    db $05, $0a, $0c
    db $06, $16, $0c
    db $07, $22, $0c
    db $08, $2e, $0c
    db $ff

data_01_680e:
    dk $03, $0a, "このじょうほうでいいですか？\0"
    db $ff

data_01_6824:
    dk $01, $0e, "このじょうほうをかえると,すべての\0"
    dh $01, $0f, "ファイルがきえますが、いいですか？\0"
    db $ff

data_01_6855:
    dh "はい　\0"
    dh "いいえ\0"

Call_001_685d:
    ldh [hDraw91], a
    ld a, $03

jr_001_6861:
    ldh [hDraw90], a
    ld a, $0f
    trap DrawCtrlChar
    ldh a, [hDraw91]
    ld e, a
    ld d, $07
    trap $57
    ld c, l
    ld b, h
    ld hl, data_01_6855
    ld de, $d301
    ldh a, [hDraw90]
    ldh [$b4], a
    trap $5b
    inc bc
    inc bc
    inc bc
    ldh a, [hDraw90]
    swap a
    ldh [$b4], a
    trap $5b
    ld a, $03
    ldh [$b4], a

jr_001_688b:
    trap AwaitFrame
    trap InputButtons
    ld b, a
    ld a, $03
    bit BTN_RT_F, b
    jr nz, jr_001_6861

    swap a
    bit BTN_LT_F, b
    jr nz, jr_001_6861

    scf
    bit BTN_B_F, b
    ret nz

    bit BTN_A_F, b
    jr z, jr_001_688b

    ldh a, [hDraw90]
    cp $30
    ret


SECTION "Kiss System 2", ROMX

trap_60_6d2f:
    ld b, [hl]
    inc hl
    push hl
    trap $c6
    jp c, Jump_001_6d4f
    ldh [$a1], a
    ld a, b
    pop bc

jr_001_6d3b:
    push af
    ld a, [bc]
    inc bc
    add e
    ld [hl+], a
    ld a, [bc]
    inc bc
    add d
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    pop af
    dec a
    jr nz, jr_001_6d3b

    push hl

Jump_001_6d4f:
    pop hl
    ldh a, [$a1]
    ret


TrapExtractInit:
    ld hl, VarExtractAddr
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, $c3cc
    ld [hl], $01
    inc hl
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], b
    inc hl
    ld [hl+], a
    ld [hl], $ef
    ld h, b
    ld l, $00
    xor a

jr_001_6d6d:
    ld [hl], a
    inc l
    jr nz, jr_001_6d6d

    ret


TrapExtractData:
    push hl
    push de

jr_001_6d74:
    push bc
    call Call_001_6d83
    ld [de], a
    inc de
    pop bc
    dec bc
    ld a, c
    or b
    jr nz, jr_001_6d74

    pop de
    pop hl
    ret


Call_001_6d83:
    ld hl, $c3d0
    ld a, [hl]
    or a
    jr z, jr_001_6d96

    dec [hl]
    inc hl

jr_001_6d8c:
    ld b, [hl]
    inc hl
    ld c, [hl]
    inc [hl]
    inc hl
    ld a, [bc]
    ld c, [hl]
    inc [hl]
    ld [bc], a
    ret


jr_001_6d96:
    ld hl, VarExtractAddr
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc hl
    dec [hl]
    inc hl
    jr nz, jr_001_6da8

    dec hl
    ld [hl], $08
    inc hl
    ld a, [bc]
    inc bc
    ld [hl], a

jr_001_6da8:
    rl [hl]
    ld a, [bc]
    inc bc
    jr nc, jr_001_6dbe

    ld hl, VarExtractAddr
    ld [hl], c
    inc hl
    ld [hl], b
    ld hl, $c3d1
    ld b, [hl]
    inc hl
    inc hl
    ld c, [hl]
    inc [hl]
    ld [bc], a
    ret


jr_001_6dbe:
    ld [$c3d2], a
    ld hl, $c3ce
    bit 0, [hl]
    jr nz, jr_001_6dde

    set 0, [hl]
    inc hl
    ld a, [bc]
    inc bc
    ld [hl+], a
    swap a

jr_001_6dd0:
    and $0f
    inc a
    ld [hl+], a
    push hl
    ld hl, VarExtractAddr
    ld [hl], c
    inc hl
    ld [hl], b
    pop hl
    jr jr_001_6d8c

jr_001_6dde:
    res 0, [hl]
    inc hl
    ld a, [hl+]
    jr jr_001_6dd0

trap_64_6de4:
    trap $ed
    ret nc

    push hl
    push de
    ld bc, $000c
    add hl, bc
    ld c, [hl]
    ld hl, $c400
    xor a
    ld [hl+], a
    ld [hl-], a

jr_001_6df4:
    push bc
    call trap_6c_714d
    pop bc
    jr c, jr_001_6e2b

    ld a, [$c409]
    ld b, a
    bit 4, b
    jr z, jr_001_6df4

    ld a, [$c40c]
    cp c
    jr nz, jr_001_6df4

    ld de, $000d
    add hl, de
    ld a, [$c40b]
    sub $61
    bit 3, b
    jr z, jr_001_6e18

    sub $60

jr_001_6e18:
    ld e, a
    add hl, de
    pop de
    push de
    ld c, $60

jr_001_6e1e:
    ld a, [hl+]
    ld [de], a
    inc de
    bit 3, b
    jr z, jr_001_6e26

    ld a, [hl+]

jr_001_6e26:
    ld [de], a
    inc de
    dec c
    jr nz, jr_001_6e1e

jr_001_6e2b:
    pop de
    pop hl
    ret


trap_65_6e2e:
    trap KissClearAll
    ld hl, $4000
    ld de, $fe00

jr_001_6e36:
    inc hl
    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push hl
    ld a, $08
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ld a, [hl]
    pop hl
    inc hl
    inc hl
    inc hl
    push bc
    push de
    ld b, a
    ld c, $ff
    push bc
    push hl
    ld hl, sp+$00
    ld bc, $0004
    trap CRAMWrite
    pop hl
    pop bc
    pop de
    pop hl
    inc e
    ld a, l
    or h
    jr nz, jr_001_6e36

    trap $09
    ret


trap_71_6e63:
    ; Create 4 bytes of scratch space on the stack.
    ; Save hl and set it to the scratch space addr.
    add sp, -$04
    push hl
    ld hl, sp+$02

    ; Read (e)th index entry to scratch space.
    ld d, $fe
    ld bc, $0004
    trap CRAMRead

    ; Pop saved hl and index entry. After this:
    ; * bc contains original value of hl.
    ; * hl contains CRAM address of file.
    ; * d contains owner code of file.
    ; * e contains cartridge code of file.
    pop bc
    pop hl
    pop de

    ; Check if there is a file at this index (hl != 0).
    ld a, l
    or h
    jr z, .noFile

    ; Check if this is Kiss Mail (not an installed file).
    ld a, e
    cp $ff
    jp z, KissMail

    trap $fc
    ret


.noFile:
    ld l, c
    ld h, b
    xor a
    ld [hl+], a
    ld [hl-], a
    scf
    ret


jr_001_6e86:
    cp c
    ld c, a
    ld b, a
    jr nz, jr_001_6e8e

trap_70_6e8b:
    ld c, $00
    ld b, c

jr_001_6e8e:
    ld a, [hl+]
    or a
    ret z

    cp $22
    jr z, jr_001_6e86

    cp $27
    jr z, jr_001_6e86

    inc b
    dec b
    jr nz, jr_001_6ea1

    trap $f8
    jr jr_001_6e8e

jr_001_6ea1:
    cp $40
    jr z, jr_001_6ec5

    cp $25
    jr z, jr_001_6ed2

    cp $3b
    jr z, jr_001_6eda

    cp $2b
    jr z, jr_001_6ee4

    cp $5b
    jr z, jr_001_6eea

    cp $5d
    jr z, jr_001_6ef0

    inc c
    dec c
    jr z, jr_001_6ec1

    trap $f9
    jr jr_001_6e8e

jr_001_6ec1:
    trap $f8
    jr jr_001_6e8e


jr_001_6ec5:
    ld a, $30
    call Call_001_6efc
    ld a, $35
    trap $f8
    ld c, $00
    jr jr_001_6e8e

jr_001_6ed2:
    ld a, $32
    call Call_001_6ef7
    ld c, b
    jr jr_001_6e8e

jr_001_6eda:
    ld a, $23
    trap $f8
    ld a, $23
    trap $f8
    jr jr_001_6e8e

jr_001_6ee4:
    ld c, $00
    ld a, $38
    jr jr_001_6ef2

jr_001_6eea:
    ld c, $00
    ld a, $34
    jr jr_001_6ef2

jr_001_6ef0:
    ld a, $36

jr_001_6ef2:
    call Call_001_6efc
    jr jr_001_6e8e

Call_001_6ef7:
    push af
    call Call_001_6efc
    pop af

Call_001_6efc:
    push af
    ld a, $2a
    trap $f8
    pop af
    trap $f8
    ret


trap_03_6f05::
    ld c, l
    ld b, h
    ld hl, sp+$00
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    inc de
    push af
    push de
    push bc
    and $7f
    ld c, a
    ld b, $00
    add a
    add e
    ld e, a
    ld a, b
    adc d
    ld d, a
    ld [hl], d
    dec hl
    ld [hl], e
    pop hl
    dec hl
    ld a, l
    sub c
    ld a, h
    sbc b
    pop de
    pop bc
    ret nc

    add hl, hl
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    add hl, de
    bit 7, b
    jr nz, jr_001_6f34

    pop af

jr_001_6f34:
    jp hl


trap_04_6f35::
    push bc
    push de
    push hl
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


trap_05_6f3e::
    ld hl, sp+$07
    ld b, [hl]
    dec hl
    ld c, [hl]
    dec hl
    ld d, [hl]
    dec hl
    ld e, [hl]
    dec hl
    ld a, [hl]
    dec hl
    ld l, [hl]
    ld h, a
    ld a, [hl+]
    sub e
    ld a, [hl]
    sbc d
    dec hl
    jr z, jr_001_6f62

    ld a, [hl]
    add c
    ld [hl], a
    inc hl
    ld a, [hl]
    adc b
    ld [hl], a
    ld hl, sp+$08
    add sp, $02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


jr_001_6f62:
    pop hl
    add sp, $08
    jp hl


trap_66_6f66:
    push bc

jr_001_6f67:
    dec bc
    ld a, [hl+]
    cp e
    jr z, jr_001_6f72

    ld a, b
    or c
    jr nz, jr_001_6f67

    pop bc
    push bc

jr_001_6f72:
    pop hl
    ld a, l
    sub c
    ld l, a
    ld a, h
    sbc b
    ld h, a
    ret


TrapMemCmp:
    ld a, [de]
    cp [hl]
    jr nz, jr_sys_6f89

    inc de
    inc hl
    dec bc
    ld a, b
    or c
    jr nz, TrapMemCmp

    ld hl, $0000
    ret


jr_sys_6f89:
    sbc a
    ld h, a
    add a
    inc a
    ld l, a
    ret


trap_68_6f8f:
    ld d, h
    ld e, l
    ld hl, $0000

jr_001_6f94:
    ld a, [de]
    or a
    ret z

    inc de
    inc hl
    jr jr_001_6f94

TrapDrawString:
.next
    ldh a, [hDrawMode]
    ld e, a
    ld a, [hl+]
    or a
    ret z

    bit DrawMode_Bit6, e
    jr nz, .jr_001_6fb3

    cp $20
    jr c, .ctrlChar

    ld e, a
    ld d, [hl]
    trap $a7
    jr nc, .jr_001_6fb3

    inc hl
    or a
    jr z, .jr_001_6fba

.jr_001_6fb3
    trap DrawChar
    jr .next

.jr_001_6fb7
    xor a
    jr .jr_001_6fb3

.jr_001_6fba
    ldh a, [hDrawMode]
    bit DrawMode_Bit3, a
    jr z, .jr_001_6fb7

    push bc
    push hl
    ld c, a
    ld a, d
    ld d, e
    ld e, a
    ld b, $01
    ld hl, $c3e0
    trap $1b
    ld hl, $c3e0
    trap $be
    pop hl
    pop bc
    ld a, $01

.ctrlChar
    trap DrawCtrlChar
    jr .next

TrapDrawStringList:
    ld a, [hl]
    or a
    ret z

    push hl
    ld l, e
    ld h, d
    trap DrawAt
    pop hl
    push de
    call TrapDrawString
    pop de
    inc e
    jr TrapDrawStringList

TrapFileSearch:
    xor a
    ld b, a
    ld [hl+], a
    ld [hl-], a
    ld a, c
    or a
    jr nz, jr_sys_6ffc

    inc b
    push de

jr_001_6ff5:
    inc de
    inc c
    ld a, [de]
    or a
    jr nz, jr_001_6ff5

    pop de

jr_sys_6ffc:
    push de
    push bc
    call trap_6c_714d
    pop bc
    pop de
    jr c, jr_001_700c

    call Call_001_7029
    jr nz, jr_sys_6ffc

    xor a
    ret


jr_001_700c:
    push hl
    xor a
    ld [hl+], a
    ld [hl+], a
    ld b, $00
    ld a, $08
    add l
    ld l, a
    ld a, b
    adc h
    ld h, a
    ld a, [KissCartridgeCode]
    ld [hl+], a
    ld [hl], c
    inc hl

jr_001_701f:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_001_701f

    pop hl
    xor a
    scf
    ret


Call_001_7029:
    push hl
    push de
    push bc
    ld a, $09
    add l
    ld l, a
    ld a, $00
    adc h
    ld h, a
    ld a, b
    or a
    jr z, jr_001_704a

    ld b, [hl]
    bit 4, b
    jr z, jr_001_704a

    inc hl
    inc hl
    ld a, [hl+]
    sub $60
    bit 3, b
    jr z, jr_001_704d

    sub $60
    jr jr_001_704d

jr_001_704a:
    inc hl
    inc hl
    ld a, [hl+]

jr_001_704d:
    cp c
    jr nz, jr_001_7057

    ld b, $00
    call TrapMemCmp
    ld a, h
    or l

jr_001_7057:
    pop bc
    pop de
    pop hl
    ret


Jump_001_705b:
    pop de
    push de
    ld hl, $c500
    ld bc, $00ff
    trap MemCopy
    ld hl, $c400
    xor a
    ld [hl+], a
    ld [hl-], a

jr_001_706b:
    call trap_6c_714d
    jr c, jr_001_70af

    ld a, [$c409]
    and $04
    jr z, jr_001_706b

    ld a, [$c40c]
    and $7f
    ld b, a
    ld a, [$c50c]
    and $7f
    cp b
    jr nz, jr_001_706b

    ld a, [$c40a]
    or a
    jr z, jr_001_7092

    ld b, a
    ld a, [KissCartridgeCode]
    cp b
    jr nz, jr_001_706b

jr_001_7092:
    ld a, [$c402]
    cp $ff
    jr z, jr_sys_70aa

    ld hl, $c400
    call Call_001_7118
    trap AddrGBToCRAM
    ld d, h
    ld e, l

jr_001_70a3:
    pop bc
    ld sp, $e000
    push de
    jr jr_001_70fc

jr_sys_70aa:
    call Call_001_7129
    jr jr_001_70a3

jr_001_70af:
    pop hl
    ld de, $c500
    ld bc, $00ff
    trap MemCopy
    scf
    ret


trap_6d_70ba:
    ld a, [hl+]
    or [hl]
    dec hl
    ret z

    xor a
    ldh [$b7], a
    push hl
    inc hl
    inc hl
    ld a, [hl]
    dec hl
    dec hl
    cp $ff
    jr z, jr_001_70eb

    call Call_001_7118
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    or a
    jr z, jr_001_70de

    ld a, [KissCartridgeCode]
    cp [hl]
    jr z, jr_001_70de

    pop hl
    scf
    ret


jr_001_70de:
    dec hl
    ld a, [hl]
    and $04
    jp z, Jump_001_705b

    trap AddrGBToCRAM
    ld d, h
    ld e, l
    jr jr_001_70ee

jr_001_70eb:
    call Call_001_7129

jr_001_70ee:
    pop bc
    ld sp, $e000
    push de
    call Call_001_710d
    ld hl, $c500
    xor a
    ld [hl+], a
    ld [hl], a

jr_001_70fc:
    ld hl, $c600
    ld e, $00
    ld bc, $df00
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    trap MemSet
    ret


Call_001_710d:
    ld hl, $c400
    ld d, b
    ld e, c
    ld bc, $00ff
    trap MemCopy
    ret


Call_001_7118:
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld a, [hl]
    inc hl
    ldh [$97], a
    inc hl
    inc hl
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl+]
    adc d
    ld d, a
    ret


Call_001_7129:
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld a, [hl]
    inc hl
    inc hl
    inc hl
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl+]
    adc d
    ld d, a
    ret


trap_6f_7138:
    ldh a, [hROMBank]
    ld e, a
    ldh a, [hRAMBank]
    ld d, a
    push de
    push hl
    ld hl, sp+$00
    ld de, $ff3c
    ld bc, $0004
    trap CRAMWrite
    pop hl
    pop de
    ret


trap_6c_714d:
    ld a, [hl+]
    or [hl]
    jr z, jr_001_7158

    inc hl
    ld a, [hl]
    dec hl
    cp $ff
    jr z, jr_sys_715f

jr_001_7158:
    dec hl
    trap FileNext
    ret nc
    xor a
    ld [hl+], a
    ld [hl], a

jr_sys_715f:
    dec hl
    ld c, l
    ld b, h
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, h
    or l
    jr z, jr_001_719a

    ld de, $fffa
    add hl, de
    jr nc, jr_001_7173

    ld a, h
    rlca
    jr nc, jr_001_7177

jr_001_7173:
    ld l, c
    ld h, b
    scf
    ret


jr_001_7177:
    ld e, l
    ld d, h
    ld a, [hl+]
    cpl
    cp [hl]
    jr nz, jr_001_7173

    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    or h
    jr z, jr_001_7173

    ld a, h
    cp d
    jr c, jr_001_718f

    jr nz, jr_001_7173

    ld a, l
    cp e
    jr nc, jr_001_7173

jr_001_718f:
    ld a, [hl]
    cp $52
    jr z, jr_001_719d

    cp $5a
    jr nz, jr_001_7177

    jr jr_001_719d

jr_001_719a:
    ld hl, $4000

jr_001_719d:
    ld de, $0006
    add hl, de

KissMail:
    ld e, l
    ld d, h
    push bc
    ld l, c
    ld h, b
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, $ff
    ld [hl+], a
    push hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld b, a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld c, a
    push bc

jr_001_71c4:
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, jr_001_71c4

    pop bc
    pop hl
    ld de, $002e
    bit 0, b
    jr nz, jr_001_71d4

    ld e, d

jr_001_71d4:
    ld a, $05
    add c
    ld c, a
    add e
    ld e, a
    ld a, d
    adc a
    ld [hl], e
    inc hl
    ld [hl], a
    inc hl
    ld [hl], e
    inc hl
    ld [hl], a
    pop hl
    xor a
    ret


trap_6e_71e6:
    trap $e1
    ret c

    push hl
    ld de, $ff45
    ld bc, $0001
    ld hl, sp+$00
    trap CRAMRead
    pop hl
    bit 0, l
    ret z

    call DoKissTitleScreen
    bit 0, a
    ret nz

    bit 1, a
    jr nz, jr_001_7225

    add sp, -$04
    ld hl, sp+$00
    ld de, $ff3c
    ld bc, $0004
    trap CRAMRead
    pop de
    pop bc
    ld a, d
    or e
    jr z, jr_001_7225

    ld a, c
    ldh [hROMBank], a
    ld [rROMBank], a
    ld a, b
    ldh [hRAMBank], a
    ld [rRAMBank], a
    push de
    ret


trap_61_7222:
    call DoKissTitleScreen

jr_001_7225:
    trap ExitToMenu


DoKissTitleScreen:
    trap AudioStop
    trap $53
    ld a, $a4
    ld bc, $0102
    ld de, $0f10
    ld h, $00
    trap DrawInit
    ld de, gfxGBKissLogo
    ld bc, $c400
    trap ExtractInit
    ld de, $c600
    ld bc, $08f0
    trap ExtractData
    ld de, $020c
    ld hl, $c600
    ld bc, $0b68
    trap $c0
    ld a, $01
    trap LCDEnable

    ld a, $f0
    trap AwaitButton
    bit BTN_SEL_F, a
    jp nz, InitKissUser

    ret


trap_50_7260:
    ld d, a
    push hl
    ld hl, data_01_72d2

jr_001_7265:
    ld a, [hl]
    cp $ff
    jr z, jr_001_7275

    ld a, d
    or a
    jr z, jr_001_7278

    inc hl
    inc hl
    inc hl
    inc hl
    dec d
    jr jr_001_7265

jr_001_7275:
    pop hl
    scf
    ret


jr_001_7278:
    ld d, [hl]
    inc hl
    ld a, [hl+]
    dec a
    cp e
    jr c, jr_001_7275

    sub e
    dec b
    cp b
    jr nc, jr_001_7285

    ld b, a

jr_001_7285:
    inc b
    ld c, b
    ld b, $00
    jr nz, jr_001_728c

    inc b

jr_001_728c:
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, d
    ld d, $00
    or a
    jr z, jr_001_72af

    ld a, $04

jr_001_7297:
    sla e
    rl d
    sla c
    rl b
    dec a
    jr nz, jr_001_7297

    add hl, de
    ld e, l
    ld d, h
    pop hl
    push bc
    push hl
    trap MemCopy
    pop hl
    pop bc
    add hl, bc
    or a
    ret


jr_001_72af:
    ld b, e
    push bc
    ld e, l
    ld d, h
    ld bc, $c400
    trap ExtractInit
    pop bc
    pop hl

jr_001_72ba:
    push hl
    push bc
    ld d, h
    ld e, l
    ld bc, $0010
    push bc
    trap ExtractData
    pop de
    pop bc
    pop hl
    ld a, b
    dec b
    or a
    jr nz, jr_001_72ba

    inc b
    add hl, de
    dec c

Call_001_72cf:
    jr nz, jr_001_72ba

    ret


data_01_72d2:
    db $00, $c7, $b2, $50, $00, $38, $33, $5d, $00, $8f, $e7, $72, $10, $06, $28, $40
    db $10, $09, $70, $7f, $ff

gfxGBKissLogo:
    INCBIN "frag/system/logo.hz"

TrapJumpViaTable::
    pop de
    ld a, [de]
    inc de
    inc h
    dec h
    jr nz, jr_001_76e2

    cp l
    jr nc, jr_001_76e3

jr_001_76e2:
    ld l, a

jr_001_76e3:
    ld a, l
    add a
    add e
    ld l, a
    ld a, $00
    adc d
    ld h, a

jr_001_76eb:
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    add hl, de
    jp hl


trap_07_76f1::
    ld e, l
    ld d, h
    pop hl
    inc d
    dec d
    jr nz, jr_001_7703

jr_001_76f8:
    ld a, [hl+]
    cp e
    jr z, jr_001_7709

    ld a, [hl+]
    or [hl]
    inc hl
    jr nz, jr_001_76f8

    jr jr_001_76eb

jr_001_7703:
    inc hl
    ld a, [hl+]
    or [hl]
    inc hl
    jr nz, jr_001_7703

jr_001_7709:
    ld a, [hl+]
    or [hl]
    inc hl
    jr z, jr_001_7709

    dec hl
    dec hl
    jr jr_001_76eb

trap_08_7712::
    ld e, l
    ld d, h
    pop hl

jr_001_7715:
    ld a, [hl+]
    cp e
    jr nz, jr_001_771e

    ld a, [hl+]
    cp d
    jr z, jr_001_7709

    dec hl

jr_001_771e:
    inc hl
    ld a, [hl+]
    or [hl]
    inc hl
    jr nz, jr_001_7715

    jr jr_001_76eb

jr_001_7726:
    ld b, $a0
    bit 7, d
    jr z, jr_001_7753

    ld b, $41
    jr jr_001_7753

trap_52_7730:
    ld a, d
    xor h
    rla
    jr c, jr_001_7726

    ld a, e
    sub l
    ld l, a
    ld a, d
    sbc h
    ld h, a
    rra
    and $c0
    ld b, a
    ld a, l
    or h
    jr nz, jr_001_7747

    set 4, b
    jr jr_001_7753

jr_001_7747:
    bit 7, h
    jr nz, jr_001_774d

    set 5, b

jr_001_774d:
    bit 7, b
    jr nz, jr_001_7753

    set 0, b

jr_001_7753:
    ld a, b
    ld b, $00
    ld hl, data_01_7762
    add hl, bc
    and [hl]
    ld hl, $0000
    ret z

    inc hl
    scf
    ret


data_01_7762:
    db $10, $60, $80, $90, $01, $11, $40, $50, $20, $30

TrapDrawLayout:
    ld a, [hl+]
    bit 7, a
    ret nz

    push hl
    ld l, [hl]
    ld h, a
    trap DrawAt
    pop hl
    inc hl
    trap DrawString
    jr TrapDrawLayout

TrapInputCursorMenu:
    add sp, -$0a
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], $00
    inc hl
    ld a, [de]
    inc de
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$05
    ld a, [de]
    inc de
    ld [hl-], a
    ld a, [de]
    inc de
    ld [hl], a
    ld hl, sp+$06
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, [de]
    inc de
    ld l, a
    ld a, [de]
    dec de
    ld h, a
    or l
    jr z, jr_001_77a2

    add hl, de

jr_001_77a2:
    ld e, l
    ld d, h
    ld hl, sp+$08
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, sp+$00
    ld e, [hl]
    jr jr_001_77f9

trap_5e_77ae:
    push hl
    push de
    push hl
    add sp, -$04
    ld hl, sp+$00
    ld [hl], c
    inc hl
    ld [hl], $00
    inc hl
    ld [hl], b
    ld hl, sp+$08
    xor a
    ld [hl+], a
    ld [hl], a

jr_001_77c0:
    trap AwaitFrame
    trap InputButtons
    ld hl, sp+$03
    ld [hl], a
    ld c, a
    and $09
    jr nz, jr_001_7818

    ld a, c
    and $06
    jr nz, jr_001_7822

    ld hl, sp+$02
    ld b, [hl]
    ld hl, sp+$00
    ld a, [hl]
    bit 6, c
    jr nz, jr_001_77e4

    bit 7, c
    jr nz, jr_001_77ed

    call Call_001_782c
    jr jr_001_77c0

jr_001_77e4:
    dec a
    bit 7, a
    jr z, jr_001_77f2

    ld a, b
    dec a
    jr jr_001_77f2

jr_001_77ed:
    inc a
    cp b
    jr c, jr_001_77f2

    xor a

jr_001_77f2:
    ld e, a
    call Call_001_7837
    ld hl, sp+$00
    ld [hl], e

jr_001_77f9:
    inc hl
    ld [hl], $00
    inc hl
    ld b, [hl]
    inc hl
    ld c, [hl]
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    or h
    jr z, jr_001_7813

    ld a, e
    ld de, code_01_780e
    push de
    jp hl


code_01_780e:
    jr nc, jr_001_7813

    ld hl, sp+$00
    ld [hl], a

jr_001_7813:
    call Call_001_782c
    jr jr_001_77c0

jr_001_7818:
    call Call_001_7837
    ld hl, sp+$00
    ld a, [hl]
    add sp, $0a
    or a
    ret


jr_001_7822:
    call Call_001_7837
    ld hl, sp+$00
    ld a, [hl]
    add sp, $0a
    scf
    ret


Call_001_782c:
    ld hl, sp+$03
    ld a, [hl]
    inc [hl]
    and $0f
    ret nz

    bit 4, [hl]
    jr z, jr_001_783b

Call_001_7837:
    ld hl, sp+$09
    jr jr_001_783d

jr_001_783b:
    ld hl, sp+$08

jr_001_783d:
    ld c, [hl]
    ld hl, sp+$02
    ld b, [hl]
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    add b
    ld l, a
    trap DrawAt
    ld a, c
    trap DrawChar
    ret


trap_53_784d:
    ld hl, $ffab
    xor a
    ld [hl+], a
    ld [hl], a
    ldh [$ae], a
    ld c, $05
    ld hl, $ffaf

jr_001_785a:
    ld [hl+], a
    dec c
    jr nz, jr_001_785a

    ld a, $03
    ldh [$b4], a
    ret


TrapKbdInit:
    ld a, d
    ldh [$aa], a
    push de
    ld e, l
    ld d, h
    ld hl, $ffa8
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, e
    or d
    jr nz, .jr_001_787d

    ld de, $ffae
    ld a, [de]
    cp $04
    jr nz, .jr_001_787d

    xor a
    ld [de], a

.jr_001_787d
    pop de

    push de
    ld d, $01
    ld bc, $1305
    trap DrawBox
    pop de

    push de
    ld a, d
    inc e
    ld d, $02
    ld hl, $010c
    ld bc, $0c03
    trap $59
    pop de

    push de
    inc e
    inc e
    ld bc, $0001
    ld d, $00
    ld a, $7f
    trap DrawTile
    trap DrawTile
    trap DrawTile
    pop de

    ; Draw divider line between keys and keyboard chooser.
    push de
    ld bc, $0001
    ld d, $0e
    ld a, $7e
    trap DrawTile
    ld a, $75
    trap DrawTile
    trap DrawTile
    trap DrawTile
    ld a, $7d
    trap DrawTile
    pop de

    ; Draw tiles for pencil icon.
    push de
    inc e
    inc e
    ld a, d
    add $24
    ld d, $0f
    ld hl, $0104
    ld bc, $0401
    trap $59
    pop de

    push de
    ld a, d
    add $28
    ld d, $00
    ld hl, $0102
    ld bc, $0202
    trap $59
    xor a
    call LoadPencilTiles
    pop de

    call Call_001_7b0e
    ld de, data_01_7ff0
    ld hl, $87f0
    ld bc, $0010
    trap MemCopy
    ret


trap_56_78f0:
    push hl
    push de
    push bc
    add sp, -$3c
    ld hl, sp+$00
    ld e, l
    ld d, h
    ld hl, sp+$40
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call trap_4e_7f04
    push af
    ld c, a
    jr jr_001_790a

jr_001_7905:
    ld a, $20
    ld [de], a
    inc de
    inc c

jr_001_790a:
    ld a, b
    cp c
    jr nz, jr_001_7905

    pop af
    ld c, a
    cp b
    jr nz, jr_001_7914

    dec c

jr_001_7914:
    ld hl, sp+$3d
    ld b, [hl]
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$00
    trap KbdEdit
    ld hl, sp+$3d
    ld a, [hl]
    ld hl, sp+$00
    call TrapStrTrim
    ld c, a
    ld b, $00
    add hl, bc
    ld [hl], $00
    ld hl, sp+$00
    ld e, l
    ld d, h
    ld hl, sp+$40
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call trap_4f_7e90
    add sp, $3c
    pop bc
    pop de
    pop hl
    ret


TrapKbdEdit:
    push hl
    ld hl, $ffa2
    ld [hl], d
    inc hl
    ld [hl], e
    inc hl
    ld [hl], b
    inc hl
    ld [hl], c
    inc hl
    pop bc
    push bc
    ld [hl], c
    inc hl
    ld [hl], b
    pop hl
    ldh a, [$a4]
    ld c, a
    call TrapTileLoadText
    ldh a, [$a5]
    ld c, a
    or a
    ld a, d
    jr z, jr_sys_795e

jr_sys_795e:
    add e
    dec c
    jr nz, jr_sys_795e

    ldh [$a2], a
    ld a, $01
    call LoadPencilTiles

jr_001_7969:
    trap AwaitFrame
    trap InputButtons
    ld b, a
    and BTN_SEL | BTN_STA
    jr nz, jr_001_7988

    ldh a, [$ab]
    cp $0c
    jr z, jr_001_7980

    bit BTN_A_F, b
    jr nz, jr_001_7993

    bit BTN_B_F, b
    jr nz, jr_001_79c5

Jump_001_7980:
jr_001_7980:
    call Call_001_79fe
    call Call_001_7a89
    jr jr_001_7969

jr_001_7988:
    call Call_001_7a85
    xor a
    call LoadPencilTiles
    ldh a, [$a5]
    or a
    ret


jr_001_7993:
    ldh a, [$ab]
    cp $0c
    jr z, jr_001_7980

    ld hl, $ffa5
    ld a, [hl-]
    cp [hl]
    jr nc, jr_001_79c3

    ldh a, [$ae]
    call Call_001_7ba9
    ld e, a
    ldh a, [$a2]
    ld d, a
    call Call_001_7dc0
    call Call_001_7b07
    ldh a, [$a5]
    ld c, a
    ld b, $00
    add hl, bc
    ld [hl], e
    ld hl, $ffa4
    cp [hl]
    jr nc, jr_001_79c3

    inc hl
    inc [hl]
    ldh a, [$a3]
    add d
    ldh [$a2], a

jr_001_79c3:
    jr jr_001_7980

jr_001_79c5:
    ldh a, [$a2]
    ld d, a
    ld hl, $ffa5
    ld a, [hl-]
    ld c, a
    or a
    jr z, jr_001_7980

    cp [hl]
    jr nc, jr_001_79d8

    ld e, $20
    call Call_001_7dc0

jr_001_79d8:
    dec hl
    ld a, d
    sub [hl]
    ldh [$a2], a
    ld d, a
    ld e, $20
    call Call_001_7dc0
    ld hl, $ffa5
    ld a, [hl]
    dec [hl]
    dec hl
    cp [hl]
    jr c, jr_001_79ed

    dec a

jr_001_79ed:
    push af
    ld c, a
    ld b, $00
    call Call_001_7b07
    add hl, bc
    ld [hl], e
    pop af
    jr nc, jr_001_79fb

    dec hl
    ld [hl], e

jr_001_79fb:
    jp Jump_001_7980


Call_001_79fe:
    ldh a, [$b6]
    ld b, a
    ld hl, $ffab
    ld a, [hl+]
    cp $0c
    jr z, jr_001_7a1f

    ld a, [hl]
    bit 6, b
    jr nz, jr_001_7a65

    bit 7, b
    jr nz, jr_001_7a73

jr_001_7a12:
    ld hl, $ffab
    ld a, [hl]
    bit 5, b
    jr nz, jr_001_7a53

    bit 4, b
    jr nz, jr_001_7a5c

    ret


jr_001_7a1f:
    ld c, $05
    ld hl, $ffa8
    ld a, [hl+]
    or [hl]
    jr nz, jr_001_7a2a

    ld c, $04

jr_001_7a2a:
    ld hl, $ffae
    ld a, [hl]
    bit 6, b
    jr nz, jr_001_7a41

    bit 7, b
    jr nz, jr_001_7a4a

    ld a, b
    and $30
    ret z

    push bc
    call Call_001_7a85
    pop bc
    jr jr_001_7a12

jr_001_7a41:
    dec a
    bit 7, a
    jr z, jr_001_7a4f

    ld a, c
    dec a
    jr jr_001_7a4f

jr_001_7a4a:
    inc a
    cp c
    jr c, jr_001_7a4f

    xor a

jr_001_7a4f:
    ld [hl], a
    jp Jump_001_7b0e


jr_001_7a53:
    dec a
    bit 7, a
    jr z, jr_001_7a62

    ld a, $0c
    jr jr_001_7a62

jr_001_7a5c:
    inc a
    cp $0d
    jr c, jr_001_7a62

    xor a

jr_001_7a62:
    ld [hl], a
    jr jr_001_7a81

jr_001_7a65:
    or a
    jr nz, jr_001_7a70

    call Call_001_7b5b
    call Call_001_7b0e
    jr jr_001_7a81

jr_001_7a70:
    dec a
    jr jr_001_7a80

jr_001_7a73:
    cp $02
    jr c, jr_001_7a7f

    call Call_001_7b6b
    call Call_001_7b0e
    jr jr_001_7a81

jr_001_7a7f:
    inc a

jr_001_7a80:
    ld [hl], a

jr_001_7a81:
    xor a
    ldh [$ad], a
    ret


Call_001_7a85:
    ld a, $10
    ldh [$ad], a

Call_001_7a89:
    ldh a, [$ad]
    and $0f
    jr nz, jr_001_7ac1

    ldh a, [$a2]
    ld d, a
    ld hl, $ffa5
    ld a, [hl-]
    ld c, a
    cp [hl]
    jr c, jr_001_7a9f

    dec hl
    ld a, d
    sub [hl]
    ld d, a
    dec c

jr_001_7a9f:
    ldh a, [$ad]
    bit 4, a
    jr z, jr_001_7ab1

    ld b, $00
    call Call_001_7b07
    add hl, bc
    ld e, [hl]
    call trap_4b_7dcc
    jr jr_001_7abf

jr_001_7ab1:
    ld e, $20
    call trap_4b_7dcc
    push hl
    ld hl, $c3ee
    ld a, $ff
    ld [hl+], a
    ld [hl], a
    pop hl

jr_001_7abf:
    trap MemCopy

jr_001_7ac1:
    ld hl, $c39c
    push hl
    xor a
    ld [hl+], a
    ld [hl-], a
    pop de
    ld hl, $ffad
    ldh a, [$ab]
    cp $0c
    jr z, jr_001_7af2

    ld a, [hl]
    inc [hl]
    and $10
    ret nz

    ld hl, $ffac
    ld a, [hl-]
    add a
    add a
    add a
    add $80
    ld [de], a
    inc de
    ld a, [hl]
    add a
    add a
    add a
    add $18
    ld [de], a
    inc de
    ld a, $7f
    ld [de], a
    inc de
    ld a, $00
    ld [de], a
    ret


jr_001_7af2:
    ld a, [hl]
    inc [hl]
    and $0f
    ret nz

    bit 4, [hl]
    jr nz, jr_001_7aff

    ld a, $30
    ldh [$b4], a

jr_001_7aff:
    call Call_001_7b2f
    ld a, $03
    ldh [$b4], a
    ret


Call_001_7b07:
    ld hl, $ffa6
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ret


Call_001_7b0e:
Jump_001_7b0e:
    ld c, $03
    call Call_001_7b77
    push af
    ldh a, [$aa]
    ld d, a

jr_001_7b17:
    ld b, $0c

jr_001_7b19:
    ld a, [hl+]
    ld e, a
    call Call_001_7dc0
    inc d
    dec b
    jr nz, jr_001_7b19

    push de
    call Call_001_7b6b
    pop de
    dec c
    jr nz, jr_001_7b17

    call Call_001_7b77
    pop af
    ld [de], a

Call_001_7b2f:
    ldh a, [$aa]
    add $24
    ld d, a
    ldh a, [$ae]
    add a
    add a
    ld c, a
    ld b, $00
    ld hl, KeyboardNames
    add hl, bc
    ld c, $04
    ld e, $01
    call TrapTileLoadText
    ret


KeyboardNames:
    dp "ひらがな"
    dp "カタカナ"
    dp "１２３４"
    dp "ＡＢＣＤ"
    dp "メモ　　"

Call_001_7b5b:
    push de
    call Call_001_7b90
    ld a, [de]
    dec a
    bit 7, a
    jr z, jr_001_7b67

    ld a, [hl]
    dec a

jr_001_7b67:
    ld [de], a
    pop de
    jr jr_001_7b77

Call_001_7b6b:
    push de
    call Call_001_7b90
    ld a, [de]
    inc a
    cp [hl]
    jr c, jr_001_7b75

    xor a

jr_001_7b75:
    ld [de], a
    pop de

Call_001_7b77:
jr_001_7b77:
    push bc
    call Call_001_7b90
    inc hl
    ld a, [de]
    call Call_001_7bd2
    ldh a, [$ae]
    cp $04
    jr nz, jr_001_7b8c

    ld hl, $ffa8
    ld a, [hl+]
    ld h, [hl]
    ld l, a

jr_001_7b8c:
    add hl, bc
    ld a, [de]
    pop bc
    ret


Call_001_7b90:
    push bc
    ldh a, [$ae]
    ld c, a
    ld b, $00
    ld hl, $ffaf
    add hl, bc
    push hl
    add a
    ld e, a
    ld d, $00
    ld hl, kbdTable
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    pop bc
    ret


Call_001_7ba9:
    push hl
    push de
    push bc
    call Call_001_7bc5
    ldh a, [$ae]
    cp $04
    jr nz, jr_001_7bbb

    ld hl, $ffa8
    ld a, [hl+]
    ld h, [hl]
    ld l, a

jr_001_7bbb:
    add hl, bc
    ldh a, [$ab]
    ld c, a
    add hl, bc
    ld a, [hl]
    pop bc
    pop de
    pop hl
    ret


Call_001_7bc5:
    call Call_001_7b90
    ldh a, [$ac]
    ld c, a
    ld a, [de]
    add c
    cp [hl]
    jr c, jr_001_7bd1

    sub [hl]

jr_001_7bd1:
    inc hl

Call_001_7bd2:
    ld c, a
    add a
    add a
    ld c, a
    add a
    add c
    ld c, a
    ld b, $00
    ret


kbdTable:
    dw kbdHiragana
    dw kbdKatakana
    dw kbdNumeric
    dw kbdAlpha
    dw kbdMemo

kbdMemo:
    dp $05

kbdNumeric:
    dp $05
    dp "01234 56789 "
    dp " ()<> ｢｣[]@ "
    dp "!?\"'# +-*/% "
    dp ",.¥$= :;^&| "
    dp "¯\\_ A BCDEF "

kbdAlpha:
    dp $06
    dp "ABCDE FGHIJ "
    dp "KLMNO PQRST "
    dp "UVWXY Z .!? "
    dp "abcde fghij "
    dp "klmno pqrst "
    dp "uvwxy z-'() "

kbdHiragana:
    dp $09
    dp "あいうえお　かきくけこ　"
    dp "さしすせそ　たちつてと　"
    dp "なにぬねの　はひふへほ　"
    dp "まみむめも　や　ゆ　よ　"
    dp "らりるれろ　わ　を　ん　"
    dp "がぎぐげご　ざじずぜぞ　"
    dp "だぢづでど　ばびぶべぼ　"
    dp "ぱぴぷぺぽ　ぁぃぅぇぉ　"
    dp "ゃゅょっ　　ー、。！？　"

kbdKatakana:
    dp $09
    dp "アイウエオ　カキクケコ　"
    dp "サシスセソ　タチツテト　"
    dp "ナニヌネノ　ハヒフヘホ　"
    dp "マミムメモ　ヤ　ユ　ヨ　"
    dp "ラリルレロ　ワ　ヲ　ン　"
    dp "ガギグゲゴ　ザジズゼゾ　"
    dp "ダヂヅデド　バビブベボ　"
    dp "パピプペポ　ァィゥェォ　"
    dp "ャュョッ　　ー、。！？　"

trap_5a_7d47:
    push bc

jr_001_7d48:
    ld a, [hl+]
    bit 7, a
    jr nz, jr_001_7d5e

    push de
    ld d, a
    ld e, [hl]
    inc hl
    push hl
    call trap_57_7df1
    ld c, l
    ld b, h
    pop hl
    pop de
    call trap_5b_7d60
    jr jr_001_7d48

jr_001_7d5e:
    pop bc
    ret


trap_5b_7d60:
    push hl

jr_001_7d61:
    push bc
    add sp, -$20
    ld hl, sp+$00
    ld c, l
    ld b, h
    ld hl, sp+$22
    ld a, [hl+]
    ld h, [hl]
    ld l, a

jr_001_7d6d:
    ld a, [hl+]
    or a
    jr z, jr_001_7d90

    cp $20
    jr nc, jr_001_7d79

    trap DrawCtrlChar
    jr jr_001_7d6d

jr_001_7d79:
    push de
    ld e, a
    ld d, [hl]
    trap $a7
    jr nc, jr_001_7d81

    inc hl

jr_001_7d81:
    pop de
    push de
    ld e, a
    call Call_001_7dc0
    pop de
    ld a, d
    ld [bc], a
    inc bc
    ld a, d
    add e
    ld d, a
    jr jr_001_7d6d

jr_001_7d90:
    push de
    ld e, l
    ld d, h
    ld hl, sp+$24
    ld [hl], e
    inc hl
    ld [hl], d
    ld hl, sp+$02
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    ld e, l
    ld d, h
    ld hl, sp+$22
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    trap MemCopy
    pop de
    add sp, $20
    pop bc
    pop hl
    ret


TrapTileLoadText:
    push de
    push bc
    ld b, e

jr_001_7db2:
    ld e, [hl]
    inc hl
    call Call_001_7dc0
    ld a, b
    add d
    ld d, a
    dec c
    jr nz, jr_001_7db2

    pop bc
    pop de
    ret


Call_001_7dc0:
    push hl
    push de
    push bc
    call trap_4b_7dcc
    trap MemCopy
    pop bc
    pop de
    pop hl
    ret


trap_4b_7dcc:
    ld b, d
    ld hl, $c3e0
    push hl
    ldh a, [$b4]
    ld c, a
    trap $ba
    ld a, b
    xor $80
    ld h, $00
    add a
    rl h
    add a
    rl h
    add a
    rl h
    add a
    rl h
    ld l, a
    ld bc, $8800
    add hl, bc
    pop de
    ld bc, $0010
    ret


trap_57_7df1:
    ld h, e
    xor a
    srl h
    rra
    srl h
    rra
    srl h
    rra
    add d
    ld l, a
    ld a, h
    adc $98
    ld h, a
    ret


TrapDrawBox:
    call trap_57_7df1
    ld a, $79
    ld de, $7778
    call DrawRow
    dec c
    dec c

.nextRow
    ld a, $7f
    ld de, $7576
    call DrawRow
    dec c
    jr nz, .nextRow

    ld a, $7c
    ld de, $7a7b

    ; fall through

DrawRow:
    add sp, -$20
    push hl
    push bc
    ld hl, sp+$04
    dec b
    dec b
    push hl
    ld [hl], d
    inc hl

.nextCol
    ld [hl+], a
    dec b
    jr nz, .nextCol

    ld [hl], e
    pop de
    pop bc
    pop hl
    push hl
    push bc
    ld c, b
    ld b, $00
    trap MemCopy
    pop bc
    pop de
    ld hl, $0020
    add hl, de
    add sp, $20
    ret


trap_59_7e43:
    push af
    push hl
    add sp, -$20
    call trap_57_7df1

jr_001_7e4a:
    push hl
    push bc
    ld hl, sp+$25
    ld d, [hl]
    ld hl, sp+$27
    ld a, [hl]
    ld hl, sp+$04
    push hl

jr_001_7e55:
    ld [hl+], a
    add d
    dec b
    jr nz, jr_001_7e55

    pop de
    pop bc
    pop hl
    push hl
    push bc
    ld c, b
    ld b, $00
    trap MemCopy
    ld hl, sp+$24
    ld a, [hl]
    ld hl, sp+$27
    add [hl]
    ld [hl], a
    pop bc
    pop de
    ld hl, $0020
    add hl, de
    dec c
    jr nz, jr_001_7e4a

    add sp, $24
    ret


TrapStrTrim:
    push hl
    push de
    push bc
    ld b, a
    ld c, b
    ld e, b
    ld d, $00
    add hl, de
    dec hl
    inc c

.jr_001_7e82
    scf
    dec c
    jr z, .jr_001_7e8b

    ld a, [hl-]
    cp $20
    jr z, .jr_001_7e82

.jr_001_7e8b
    ld a, c
    pop bc
    pop de
    pop hl
    ret


trap_4f_7e90:
    push hl
    push bc
    ld c, $00
    ld b, $80

jr_001_7e96:
    ld a, [de]
    inc de
    cp $20
    jr c, jr_001_7ea8

    cp $b0
    jr nc, jr_001_7ec6

    cp $60
    jr nc, jr_001_7eb4

jr_001_7ea4:
    ld [hl+], a
    inc c
    jr jr_001_7e96

jr_001_7ea8:
    add $60
    cp $60
    jr nz, jr_001_7ea4

    ld [hl], $00
    ld a, c
    pop bc
    pop hl
    ret


jr_001_7eb4:
    bit 7, b
    jr z, jr_001_7ebe

jr_001_7eb8:
    ld b, $01
    ld [hl], $0f
    inc hl
    inc c

jr_001_7ebe:
    bit 0, b
    jr z, jr_001_7eb8

    add $50
    jr jr_001_7ed4

jr_001_7ec6:
    bit 7, b
    jr z, jr_001_7ed0

jr_001_7eca:
    ld b, $00
    ld [hl], $0e
    inc hl
    inc c

jr_001_7ed0:
    bit 0, b
    jr nz, jr_001_7eca

jr_001_7ed4:
    cp $f7
    jr nc, jr_001_7ee4

    cp $de
    jr nc, jr_001_7ee8

    cp $b0
    jr nz, jr_001_7ea4

    ld a, $a6
    jr jr_001_7ea4

jr_001_7ee4:
    add $b0
    jr jr_001_7ea4

jr_001_7ee8:
    cp $ed
    jr nc, jr_001_7ef4

    add $d8

jr_001_7eee:
    ld [hl+], a
    inc c
    ld a, $de
    jr jr_001_7ea4

jr_001_7ef4:
    cp $f2
    jr nc, jr_001_7efc

    add $dd
    jr jr_001_7eee

jr_001_7efc:
    add $d8
    ld [hl+], a
    inc c
    ld a, $df
    jr jr_001_7ea4

trap_4e_7f04:
    push bc
    ld c, $00

jr_001_7f07:
    ld a, [hl+]
    or a
    jr z, jr_001_7f21

    cp $20
    jr nc, jr_001_7f13

    trap DrawCtrlChar
    jr jr_001_7f07

jr_001_7f13:
    push de
    ld e, a
    ld d, [hl]
    trap $a7
    jr nc, jr_001_7f1b

    inc hl

jr_001_7f1b:
    pop de
    ld [de], a
    inc de
    inc c
    jr jr_001_7f07

jr_001_7f21:
    ld a, c
    pop bc
    ret


LoadPencilTiles:
    ld e, a
    ldh a, [$aa]
    add $28
    ld d, a
    ld c, $04
    ld hl, PencilIcon
    ; fall through


TrapTileLoad:
    ld a, e
    push af
    push hl
    push bc
    ld e, d
    call trap_4b_7dcc
    pop bc
    pop de
    pop af
    or a
    jr nz, jr_001_7f4b

    push hl
    ld l, c
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    pop hl
    trap MemCopy
    ret


jr_001_7f4b:
    push bc
    push hl
    ld hl, $c3e0
    ld b, $10

jr_001_7f52:
    ld a, [de]
    inc de
    xor $ff
    ld [hl+], a
    dec b
    jr nz, jr_001_7f52

    pop hl
    push de
    push hl
    ld de, $c3e0
    ld bc, $0010
    trap MemCopy
    pop hl
    ld de, $0010
    add hl, de
    pop de
    pop bc
    dec c
    jr nz, jr_001_7f4b

    ret


PageIcon::
    INCBIN "gfx/system/page.2bpp"

PencilIcon:
    INCBIN "gfx/system/pencil.2bpp"

data_01_7ff0:
    INCBIN "gfx/system/reticle.2bpp"
