; Disassembly of "gbkiss.gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "charmap.inc"
INCLUDE "common.inc"
INCLUDE "hardware.inc"
INCLUDE "huc.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"

SECTION "minigame/bank_000: RST $08", ROM0

RST_08::
    jp InvokeTrap


SECTION "minigame/bank_000: RST $10", ROM0

RST_10::
    jp PushRelAddr


SECTION "minigame/bank_000: RST $20", ROM0

RST_20::
    ldh [hROMBank], a
    ld [rROMBank], a
    ret


SECTION "minigame/bank_000: VBlank interrupt", ROM0

VBlankInterrupt::
    jp $c006


SECTION "minigame/bank_000: Timer Overflow interrupt", ROM0

TimerOverflowInterrupt::
    jp $c000


SECTION "minigame/bank_000: ROM Bank $000 A", ROM0

Call_000_0053::
Jump_000_0053::
    jp Jump_000_021c


SECTION "minigame/bank_000: Serial Transfer interrupt", ROM0

SerialTransferCompleteInterrupt::
    jp $c003


SECTION "minigame/bank_000: ROM Bank $000 B", ROM0

InvokeTrap:
    add sp, -$05
    push af
    push de
    push hl
    ld hl, sp+$0b
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    inc de
    ld [hl], d
    dec hl
    ld [hl], e
    ld e, a
    ld a, [Config2]
    cp e
    jr c, .jr_000_0093

    ld d, $00
    ld hl, traps0
    add hl, de
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$09
    ld [hl], e
    inc hl
    ld [hl], d
    pop hl
    pop de
    pop af
    add sp, $03
    ret


.jr_000_0093
    ld d, e
    dec hl
    ldh a, [hROMBank]
    ld [hl-], a
    ld [hl], HIGH(code_00_00bd)
    dec hl
    ld [hl], LOW(code_00_00bd)
    sla e
    ld a, d
    rlca
    and $01
    add $0e
    ld l, a
    ld h, $00
    ld a, [hl]
    call Call_000_00f7
    ld hl, $4000
    ld d, l
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$06
    ld [hl], e
    inc hl
    ld [hl], d

trap_0e_00b9::
    pop hl
    pop de
    pop af
    ret


code_00_00bd::
    push af
    push hl
    ld hl, sp+$04
    ld a, [hl]
    call Call_000_00f7
    pop hl
    pop af
    inc sp
    ret


PushRelAddr::
    push af
    push af
    push de
    push hl
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld e, [hl]
    inc hl
    ld d, [hl]
    push hl
    dec hl
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$0b
    ld [hl], d
    dec hl
    ld [hl], e
    pop de
    inc de
    dec hl
    ld [hl], d
    dec hl
    ld [hl], e
    pop hl
    pop de
    pop af
    ret


trap_00_00e9::
    xor a
    ldh [hRAMBank], a
    inc a
    ld [rIgnored], a
    xor a
    ld [rIRMode], a
    ld a, [Config1]

Call_000_00f7:
    ldh [hROMBank], a
    ld [rROMBank], a
    ret


SECTION "minigame/bank_000: Boot", ROM0

Boot::
    di
    jp Jump_000_02e5


SECTION "minigame/bank_000: ROM Bank $000 C", ROM0

TrapExitToMenu::
    ld a, [Config0]
    ldh [hROMBank], a
    ld [rROMBank], a
    jp KissMenu


TrapMemCopy::
    ld a, b
    or c
    ret z

    ldh a, [$86]
    or a
    jr z, .copyNonVRAM

    ld a, h
    and $e0
    cp HIGH(_VRAM)
    jr z, .copyVRAM

    ld a, d
    and $e0
    cp HIGH(_VRAM)
    jr nz, .copyNonVRAM

    trap $fe
    ret

.copyNonVRAM
    ld a, [de]
    inc de
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, .copyNonVRAM

    ret


.copyVRAM
    ld a, b
    or a

.jr_000_017f
    push af
    trap $fd
    pop af
    push af
    jr nz, .jr_000_018a

    ld a, b
    cp c
    jr nc, .jr_000_01a5

.jr_000_018a
    push bc
    push hl
    ld c, b
    ld b, $00
    push bc
    call Call_000_01a6
    pop bc
    pop hl
    add hl, bc
    pop bc
    pop af
    push hl
    ld l, b
    ld b, a
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc $00
    ld b, a
    pop hl
    jr .jr_000_017f

.jr_000_01a5
    pop af

Call_000_01a6:
    trap $ff

jr_000_01a8:
    ld a, [de]
    inc de
    ld [hl], a
    inc l
    dec c
    jr nz, jr_000_01a8

    di
    ld a, l
    ldh [$87], a
    ldh a, [$89]
    add b
    ldh [$89], a
    ei

trap_none_0::
    ret


SECTION "minigame/bank_000: ROM Bank $000 D", ROM0

traps0::
    dw trap_00_00e9            ; trap $00
    dw TrapExitToMenu          ; trap $01
    dw TrapMemCopy             ; trap $02
    dw trap_03_6f05            ; trap $03 (bank 1)
    dw trap_04_6f35            ; trap $04 (bank 1)
    dw trap_05_6f3e            ; trap $05 (bank 1)
    dw TrapJumpViaTable        ; trap $06 (bank 1)
    dw trap_07_76f1            ; trap $07 (bank 1)
    dw trap_08_7712            ; trap $08 (bank 1)
    dw trap_08_02fd            ; trap $09
    dw trap_none_0             ; trap $0a
    dw trap_none_0             ; trap $0b
    dw trap_none_0             ; trap $0c
    dw trap_none_0             ; trap $0d
    dw trap_0e_00b9            ; trap $0e
    dw 0                       ; trap $0f
    dw trap_10_02ed            ; trap $10
    dw TrapAudioStopJump       ; trap $11 (bank 4)
    dw TrapAudioUnknownJump    ; trap $12 (bank 4)
    dw TrapAudioPlayMusicJump  ; trap $13 (bank 4)
    dw TrapAudioPlaySoundJump  ; trap $14 (bank 4)
    dw TrapAudioSilenceJump    ; trap $15 (bank 4)
    dw TrapAudioGetMusicJump   ; trap $16 (bank 4)
    dw TrapAudioGetSoundJump   ; trap $17 (bank 4)
    dw TrapAudioPauseJump      ; trap $18 (bank 4)
    dw TrapAudioSetVolumeJump  ; trap $19 (bank 4)
    dw TrapAudioGetCount       ; trap $1a
    dw trap_1b_0268            ; trap $1b

TrapAudioGetCount::
    ld de, $0038
    ret

Jump_000_021c:
    push af
    push bc
    push de
    push hl
    ldh a, [$99]
    bit 2, a
    call nz, TrapAudioUnknownJump
    pop hl
    pop de
    pop bc
    pop af
    reti


TrapAudioStopJump::
    ld l, LOW(AudioTraps.stop)
    jr JumpToAudioBank

TrapAudioUnknownJump::
    ld l, LOW(AudioTraps.unknown)
    jr JumpToAudioBank

TrapAudioPlayMusicJump::
    xor a
    ld l, LOW(AudioTraps.playMusic)
    jr JumpToAudioBank

TrapAudioPlaySoundJump::
    ld l, LOW(AudioTraps.playSound)
    jr JumpToAudioBank

TrapAudioSilenceJump::
    ld l, LOW(AudioTraps.silence)
    jr JumpToAudioBank

TrapAudioGetMusicJump::
    ld l, LOW(AudioTraps.getMusic)
    jr JumpToAudioBank

TrapAudioGetSoundJump::
    ld l, LOW(AudioTraps.getSound)
    jr JumpToAudioBank

TrapAudioPauseJump::
    ld l, LOW(AudioTraps.pause)
    jr JumpToAudioBank

TrapAudioSetVolumeJump::
    ld l, LOW(AudioTraps.setVolume)

JumpToAudioBank:
    ld h, HIGH(AudioTraps)
    push af
    call Call_000_025a
    pop hl
    push af
    ld a, h
    jr jr_000_0263

Call_000_025a:
    push hl
    push af
    ldh a, [hROMBank]
    ld hl, sp+$07
    ld [hl], a
    ld a, BANK(AudioTraps)

jr_000_0263:
    call RST_20
    pop af
    ret


trap_1b_0268::
    ld a, d
    cp $80
    jr c, jr_000_0290

    cp $a0
    jp c, Jump_000_0407

    cp $c0
    jr c, jr_000_0283

    cp $e0
    jp nc, Jump_000_0407

    sub $c0
    trap $50
    jp c, Jump_000_0407

    ret


jr_000_0283:
    sub $a0

    db $cf

    cp h
    jp c, Jump_000_0407

    ret


jr_000_028b:
    pop de
    pop bc
    pop hl
    scf
    ret


jr_000_0290:
    push hl
    push bc
    push de
    call Call_000_0306
    jr c, jr_000_028b

    ld a, b
    pop bc
    ld b, a
    push bc
    ld a, l
    sub c
    ld c, a
    ld a, h
    sbc $00
    ld b, a
    jr c, jr_000_028b

    or c
    jr z, jr_000_028b

    pop hl
    ldh a, [hROMBank]
    ld b, a
    ld a, h
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, de
    ld e, l
    ld d, h
    call RST_20
    pop af
    pop hl
    push bc
    dec a
    dec c
    cp c
    jr c, jr_000_02c2

    ld a, c

jr_000_02c2:
    inc a
    ld c, a
    ld b, $00
    jr nz, jr_000_02c9

    inc b

jr_000_02c9:
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    push hl
    push bc
    trap MemCopy
    pop bc
    pop hl
    add hl, bc
    pop af
    or a
    jp RST_20


Jump_000_02e5:
    di

Jump_000_02e6:
    ld sp, $e000
    trap $00
    trap $6e

trap_10_02ed::
    ld hl, trap_10_02ed
    trap $6f
    jp Jump_000_0300


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

trap_08_02fd::
    jp Jump_000_0309


Jump_000_0300:
    jp Jump_000_03f8


ExitKissMenu::
    jp Jump_000_0402


Call_000_0306:
    jp Jump_000_0405


Jump_000_0309:
    ld hl, $ff83
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    trap RandInit
    trap RandNext
    ld d, h
    ld e, l
    ldh a, [hROMBank]
    push af
    ld a, BANK(FileRandomSelection.count)
    ldh [hROMBank], a
    ld [rROMBank], a
    ld hl, rRAMBank
    ld l, [hl]
    ld h, d
    push hl
    trap MathDiv16
    pop hl
    ld a, [$c3b0]
    ld h, a
    push hl
    call AddFileFromRandomSelection
    pop hl
    ld a, h
    inc a
    cp l
    jr c, jr_000_0337

    xor a

jr_000_0337:
    pop af
    ldh [hROMBank], a
    ld [rROMBank], a
    ret


AddFileFromRandomSelection:
    add a
    ld e, a
    ld d, $00
    ld hl, FileRandomSelection.files
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call AddFile
    pop hl
    ret c

    ld b, $00
    add hl, bc
    ld c, e
    ld b, d
    ld e, l
    ld d, h

jr_000_0356:
    push bc
    ld a, b
    or a
    jr z, jr_000_035e

    ld bc, $0100

jr_000_035e:
    push de
    push bc
    ld hl, $c400
    trap MemCopy
    pop bc
    push bc
    ld de, $c400
    ld hl, $c500
    trap $ec
    pop bc
    pop hl
    add hl, bc
    ld d, h
    ld e, l
    pop hl
    ld a, l
    sub c
    ld c, a
    ld a, h
    sbc b
    ld b, a
    or c
    jr nz, jr_000_0356

    ret


AddFile:
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push de      ; de = file length
    ld b, [hl]   ; b = flags
    inc hl       ;
    ld a, [hl+]  ; a = cartridge code
    ld c, [hl]   ; c = header length
    inc hl
    push bc
    push af
    ld e, l
    ld d, h
    push bc
    ld hl, $c400
    ld b, $00
    push hl
    trap MemCopy
    pop de
    pop bc
    ld hl, $c500
    push bc
    push de
    trap FileSearch
    pop de
    pop bc
    jr c, .jr_000_03ae

    push bc
    push de
    trap FileDelete
    pop de
    pop bc
    ld hl, $c500
    trap FileSearch

.jr_000_03ae
    pop hl
    pop bc
    pop de
    ccf
    ret c

    ld a, FILE_HIST_SIZE
    bit FILE_HIST_F, b
    jr nz, .jr_000_03ba

    xor a

.jr_000_03ba
    add FILE_TYPE_OFFSET
    add c
    ld c, a
    push bc
    push bc
    ld a, $00
    adc a
    ld b, a
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld d, a
    pop bc
    ld c, $00
    ld a, h
    ld hl, $c50a
    ld [hl], a
    ld hl, $c500
    push de
    trap FileWrite
    pop de
    pop bc
    ret c

    bit FILE_HIST_F, b
    ret z

    push bc
    push de
    ld b, $00
    ld de, $ffd2
    ld hl, $c500
    trap $ea
    pop de
    ld hl, FILE_HIST_SIZE
    add hl, de
    ld e, l
    ld d, h
    pop bc
    ld a, c
    sub FILE_HIST_SIZE
    ld c, a
    xor a
    ret


Jump_000_03f8:
    di
    ld sp, $e000
    trap $00
    trap AudioStop
    trap $61

Jump_000_0402:
    jp Jump_000_0500


Jump_000_0405:
    scf
    ret


Jump_000_0407:
    scf
    ret


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_000_0500:
    ld sp, $e000
    di
    trap $00
    ld de, $0000
    ld hl, $c654
    ld bc, $0002
    trap CRAMRead
    ld a, [$c654]
    cp $02
    jr c, jr_000_0525

    cp $08
    jr nc, jr_000_0525

    ld a, [$c655]
    and $03
    cp $03
    jr z, jr_000_053a

jr_000_0525:
    ld a, $02
    ld [$c654], a
    ld a, $03
    ld [$c655], a
    ld de, $0000
    ld hl, $c654
    ld bc, $0002
    trap CRAMWrite

jr_000_053a:
    ld a, $20
    trap DrawInit
    ld hl, $0400
    trap $ca

Jump_000_0543:
    call Call_000_07e6
    ld de, $0204
    trap $57
    ld c, $80
    ld de, strPasswordMenu
    ld a, [$c654]
    ld b, a
    ld a, [$c655]

jr_000_0557:
    push bc
    push hl
    push af
    ld a, c
    ld c, l
    ld b, h
    ld l, e
    ld h, d
    ld d, a
    ld e, $07
    pop af
    rrca
    push af
    call Call_000_05b4
    pop af
    ld e, l
    ld d, h
    pop hl
    ld bc, $0020
    add hl, bc
    pop bc
    inc c
    dec b
    jr nz, jr_000_0557

    ld hl, strPasswordMenuMessage
    call Call_000_087f
    ld a, $01
    trap LCDEnable
    ld c, $00

jr_000_0581:
    ld a, [$c654]
    ld b, a
    ld hl, HeaderLogo
    ld d, $20
    ld e, $3e
    trap $5e
    jr c, Jump_000_05b2

    ld c, a
    inc a
    call Call_000_076e
    ld h, a
    ld a, [$c655]
    and h
    jr z, jr_000_0581

    ld l, c
    ld h, $00
    trap JumpViaTable
    db $08
    dw Jump_000_06b9 - @
    dw Jump_000_07a4 - @
    dw Jump_000_07af - @
    dw Jump_000_07ba - @
    dw Jump_000_07c5 - @
    dw Jump_000_07d0 - @
    dw Jump_000_07db - @
    dw Jump_000_05b2 - @


Jump_000_05b2:
    trap $01

Call_000_05b4:
    jr nc, jr_000_05b9

    trap $5b
    ret


jr_000_05b9:
    ld a, [hl+]
    or a
    jr nz, jr_000_05b9

    ld a, $0d
    trap DrawCtrlChar
    ld a, $01
    trap DrawCtrlChar
    ret


strPasswordMenu::
    dk "　PASSWORD INPUT»\r", $01, "\0"
    dk "　キャラバンバージョン　5ゲーム\r", $01, "\0"
    dk "　キスモン&バケちゅリレーほか4»\r", $01, "\0"
    dk "　15パズル&キャノン«　ほか4こ»\r", $01, "\0"
    dk "　バイナリーランド«&BJほか2こ»\r", $01, "\0"
    dk "　ミニゲームがぞういれかえデータ\r", $01, "\0"
    dk "　GB KISS TOOLS\r", $01, "\0"

strPasswords::
    dp "KISSMON "
    dp "CANNON  "
    dp "BINARY  "
    dp "GAMEDATA"
    dp "KISSTOOL"

strPasswordMenuMessage::
    dk "　　メニューを　せんたくして»\0"
    dk "　\0"
    dk "«START/Aを　おしてください»\0"
    dk "\0"

strPasswordDashes::
    dp "--------\0"


Jump_000_06b9::
    call Call_000_07e6
    ld a, $20
    ld de, $0204
    ld bc, $1004
    ld hl, $0000
    trap $59
    ld a, $f0
    ld de, $0208
    ld bc, $1003
    ld hl, $0301
    trap $59
    ld hl, $0204
    trap DrawAt
    ld hl, strPasswordMenu
    trap DrawString
    ld hl, $0607
    trap DrawAt
    ld hl, strPasswordDashes
    trap DrawString
    ld hl, strEnterPassword
    ld bc, $9902
    call Call_000_0882
    ld a, $03
    ldh [$ae], a
    ld de, $900d
    ld hl, $0000
    trap KbdInit
    ld a, $80
    ld de, $0606
    ld bc, $0801
    ld hl, $0100
    trap $59
    ld a, $03
    trap LCDEnable
    ld hl, $c656
    ld e, $20
    ld bc, $0008
    trap MemSet
    ld de, $8001
    ld b, $08
    ld hl, $c656
    ld c, $00
    trap KbdEdit
    jp c, Jump_000_0543

    ld hl, strPasswords
    ld bc, $0502

jr_000_072f:
    push bc
    push hl
    ld de, $c656
    ld bc, $0008
    push bc
    trap MemCmp
    pop bc
    ld a, h
    or l
    pop hl
    add hl, bc
    pop bc
    inc c
    or a
    jr z, jr_000_074a

    dec b
    jr nz, jr_000_072f

    jp Jump_000_0543


jr_000_074a:
    ld a, [$c654]
    cp c
    ld a, c
    jp nc, Jump_000_0755

    ld [$c654], a

Jump_000_0755:
    call Call_000_076e
    ld d, a
    ld a, [$c655]
    or d
    ld [$c655], a
    ld de, $0000
    ld hl, $c654
    ld bc, $0002
    trap CRAMWrite
    jp Jump_000_0543


Call_000_076e:
    push bc
    ld c, a
    ld a, $80

jr_000_0772:
    rlca
    dec c
    jr nz, jr_000_0772

    pop bc
    ret


strEnterPassword::
    dk "　\0"
    dk "パスワードを　にゅうりょくして　»\0"
    dk "«STARTを　おしてください　　»\0"
    dk "\0"


Jump_000_07a4::
    ld de, FileCollection1
    ld a, BANK(FileCollection1)
    call Call_000_089a
    jp Jump_000_0543


Jump_000_07af::
    ld de, FileCollection2
    ld a, BANK(FileCollection2)
    call Call_000_089a
    jp Jump_000_0543


Jump_000_07ba::
    ld de, FileCollection3
    ld a, BANK(FileCollection3)
    call Call_000_089a
    jp Jump_000_0543


Jump_000_07c5::
    ld de, FileCollection4
    ld a, BANK(FileCollection4)
    call Call_000_089a
    jp Jump_000_0543


Jump_000_07d0::
    ld de, FileCollection5
    ld a, BANK(FileCollection5)
    call Call_000_089a
    jp Jump_000_0543


Jump_000_07db::
    ld de, FileCollection6
    ld a, BANK(FileCollection6)
    call Call_000_089a
    jp Jump_000_0543


Call_000_07e6:
    trap LCDDisable
    ld a, $0c
    trap DrawCtrlChar
    ld hl, $8800
    ld e, $00
    ld bc, $0a00
    trap MemSet
    ld de, $0003
    ld bc, $1409
    trap DrawBox
    ld a, $80
    ld de, $0204
    ld bc, $1007
    ld hl, $0701
    trap $59
    ld de, $000d
    ld bc, $1405
    trap DrawBox
    ld a, $f0
    ld de, $020e
    ld bc, $1003
    ld hl, $0301
    trap $59
    ld hl, $0101
    trap DrawAt
    ld hl, strPasswordMenuTitle
    trap DrawString
    ret


strPasswordMenuTitle::
    dk "GB KISS  MINI GAME\0"

strLoadMenuMessage::
    dk "していのデータを　てんそうします»\0"
    dk "«　　AでGBKISSてんそう　　»\0"
    dk "«STARTで　じぶんのSRAMへ»\0"
    dk "\0"

Call_000_087f:
    ld bc, $99c2

Call_000_0882:
    ld d, $f0
    ld e, $03

jr_000_0886:
    ld a, [hl]
    or a
    ret z

    push de
    push bc
    trap $5b
    pop bc
    ld a, $20
    add c
    ld c, a
    ld a, $00
    adc b
    ld b, a
    pop de
    inc d
    jr jr_000_0886

Call_000_089a:
    ld hl, $c600
    ld [hl+], a
    ld [hl], e
    inc hl
    ld [hl], d

Jump_000_08a1:
    call Call_000_07e6
    ld hl, strLoadMenuMessage
    call Call_000_087f
    ldh a, [hROMBank]
    push af
    ld hl, $c600
    ld a, [hl+]
    ld e, [hl]
    inc hl
    ld d, [hl]
    ldh [hROMBank], a
    ld [rROMBank], a
    ld hl, $c604
    ld bc, $0028
    trap MemCopy
    pop af
    ldh [hROMBank], a
    ld [rROMBank], a
    ld de, $0304
    trap $57
    ld b, $07
    ld c, $87
    ld de, $c604

Jump_000_08d3:
    push bc
    push hl
    ld l, e
    ld h, d
    ld a, [hl+]
    ld b, [hl]
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push hl
    or a
    jr z, jr_000_091e

    ldh a, [hROMBank]
    push af
    ld a, b
    ldh [hROMBank], a
    ld [rROMBank], a
    ld a, d
    cp $80
    jr c, jr_000_08f3

    sub $40
    ld d, a

jr_000_08f3:
    push bc
    ld hl, $c634
    ld bc, $0020
    trap MemCopy
    pop bc
    pop af
    ldh [hROMBank], a
    ld [rROMBank], a
    ld d, c
    ld e, $07
    pop hl
    pop bc
    push bc
    push hl
    ld hl, $c638
    trap $5b
    pop de
    pop hl
    ld bc, $0020
    add hl, bc
    pop bc
    inc c
    dec b
    jp nz, Jump_000_08d3

    push bc
    push hl
    push de

jr_000_091e:
    ld a, $01
    trap LCDEnable
    pop de
    pop hl
    pop bc
    ld a, $07
    sub b
    ld b, a
    ld c, $00

jr_000_092b:
    ld hl, HeaderLogo
    ld d, $20
    ld e, $3e
    push bc
    trap $5e
    pop bc
    jr c, jr_000_0943

    ld c, a
    push bc
    call $094a
    pop bc
    jr nc, jr_000_092b

    jp Jump_000_08a1


jr_000_0943:
    ldh a, [$8a]
    and $04
    ret z

    trap $01
    ld hl, $c604
    add a
    add a
    ld e, a
    ld d, $00
    add hl, de
    ld a, [hl+]
    or a
    scf
    ret z

    ldh a, [$8a]
    ld [$c660], a
    ldh a, [hROMBank]
    ld [$c65f], a
    push af
    ld a, [hl+]
    ldh [hROMBank], a
    ld [rROMBank], a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, h
    cp $80
    jr c, jr_000_0973

    sub $40
    ld h, a

jr_000_0973:
    ld a, [hl+]
    ld b, [hl]
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    cp $44
    jr z, jr_000_09e6

    pop af
    ldh [hROMBank], a
    ld [rROMBank], a
    push bc
    push de
    ld a, $04
    add c
    ld l, a
    ld h, $01
    trap DrawAt
    ld a, "*"
    trap DrawChar
    ld a, [$c660]
    and $01
    call nz, Call_000_0c95
    pop de
    pop bc
    ret c

    ldh a, [hROMBank]
    push af
    ld a, b
    ld [$c65e], a
    ldh [hROMBank], a
    ld [rROMBank], a
    ld l, e
    ld h, d
    push bc
    call Call_000_0a06
    pop bc
    jr c, jr_000_09b6

    ld de, strLoadSuccess
    jr jr_000_09c2

jr_000_09b6:
    ld de, strLoadFailure
    ld a, [$c664]
    or a
    jr z, jr_000_09c2

    ld de, strLoadOverwrite

jr_000_09c2:
    pop af
    ldh [hROMBank], a
    ld [rROMBank], a
    ld a, $04
    add c
    push de
    push bc
    ld e, a
    ld d, $02
    trap $57
    ld c, l
    ld b, h
    pop de
    ld a, $80
    add e
    ld d, a
    ld e, $07
    pop hl
    trap $5b
    ld hl, strLoadMenuMessage
    call Call_000_087f
    xor a
    ret


jr_000_09e6:
    pop af
    ldh [hROMBank], a
    ld [rROMBank], a
    ld c, b
    ld hl, $c600
    ld b, [hl]
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push bc
    push hl
    ld a, c
    call Call_000_089a
    pop de
    pop af
    ld hl, $c600
    ld [hl+], a
    ld [hl], e
    inc hl
    ld [hl], d
    scf
    ret


Call_000_0a06:
    xor a
    ld [$c664], a
    ld a, [$c660]
    bit 0, a
    jp nz, Jump_000_0ad5

    bit 7, h
    jr nz, jr_000_0a4b

    push hl
    call Call_000_0a5c
    pop hl
    ret c

    ld b, $00
    add hl, bc
    ld c, e
    ld b, d

jr_000_0a21:
    push bc
    ld a, b
    cp $08
    jr c, jr_000_0a2a

    ld bc, $0800

jr_000_0a2a:
    ld e, l
    ld d, h
    push de
    push bc
    ld hl, $c900
    trap MemCopy
    pop bc
    push bc
    ld de, $c900
    ld hl, $c500
    trap $ec
    pop de
    pop hl
    add hl, de
    pop bc
    ld a, c
    sub e
    ld c, a
    ld a, b
    sbc d
    ld b, a
    or c
    jr nz, jr_000_0a21

    ret


jr_000_0a4b:
    ld de, $c000
    add hl, de
    push hl
    call Call_000_0a5c
    pop hl
    ret c

    ld b, $00
    add hl, bc
    ld c, e
    ld b, d
    jr jr_000_0a21


Call_000_0a5c:
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push de
    ld b, [hl]
    inc hl
    ld a, [hl+]
    ld c, [hl]
    inc hl
    push bc
    push af
    ld e, l
    ld d, h
    push bc
    ld hl, $c400
    ld b, $00
    push hl
    trap MemCopy
    pop de
    pop bc
    ld hl, $c500
    push bc
    push de
    trap FileSearch
    pop de
    pop bc
    jr nc, jr_000_0ac9

    pop hl
    pop bc
    pop de
    ld a, FILE_HIST_SIZE
    bit FILE_HIST_F, b
    jr nz, .jr_000_0a8a

    xor a

.jr_000_0a8a
    add FILE_TYPE_OFFSET
    add c
    ld c, a
    push bc
    push bc
    ld a, $00
    adc a
    ld b, a
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld d, a
    pop bc
    ld c, $00
    ld a, h
    ld hl, $c50a
    ld [hl], a
    ld hl, $c500
    push de
    trap FileWrite
    pop de
    pop bc
    jr c, jr_000_0ad1

    bit FILE_HIST_F, b
    ret z

    push bc
    push de
    ld b, $00
    ld de, $ffd2
    ld hl, $c500
    trap $ea
    pop de
    ld hl, FILE_HIST_SIZE
    add hl, de
    ld e, l
    ld d, h
    pop bc
    ld a, c
    sub FILE_HIST_SIZE
    ld c, a
    xor a
    ret


jr_000_0ac9:
    ld a, $01
    ld [$c664], a
    pop hl
    pop bc
    pop de

jr_000_0ad1:
    or $01
    scf
    ret


Jump_000_0ad5:
    bit 7, h
    jr nz, jr_000_0b21

    push hl
    call Call_000_0b32
    pop hl
    ret c

    ld b, $00
    add hl, bc
    ld c, e
    ld b, d

jr_000_0ae4:
    push bc
    ld a, b
    or a
    jr z, jr_000_0aec

    ld bc, $0100

jr_000_0aec:
    ld e, l
    ld d, h
    push de
    push bc
    ld hl, $c900
    trap MemCopy
    pop bc
    push bc
    ld de, $c900
    call Call_000_0d25
    pop de
    pop hl
    push af
    add hl, de
    pop af
    pop bc
    jr c, jr_000_0b1f

    ld a, c
    sub e
    ld c, a
    ld a, b
    sbc d
    ld b, a
    or c
    jr nz, jr_000_0ae4

    call Call_000_0bf2
    jr c, jr_000_0b1f

    ld a, $02
    call Call_000_0d05
    jr c, jr_000_0b1f

    call Call_000_0d16
    xor a
    ret


jr_000_0b1f:
    scf
    ret


jr_000_0b21:
    ld de, $c000
    add hl, de
    push hl
    call Call_000_0b32
    pop hl
    ret c

    ld b, $00
    add hl, bc
    ld c, e
    ld b, d
    jr jr_000_0ae4

Call_000_0b32:
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push de
    ld b, [hl]
    inc hl
    ld a, [hl+]
    ld c, [hl]
    inc hl
    push bc
    ld [$c661], a
    ld e, l
    ld d, h
    push bc
    ld hl, $c400
    ld b, $00
    push hl
    trap MemCopy
    pop de
    pop bc
    ld hl, $c700
    push bc
    push de
    call Call_000_0d37
    pop de
    pop bc
    jp nc, Jump_000_0bdb

    pop bc
    pop de
    cp $ff
    jp z, Jump_000_0bee

    ld a, FILE_HIST_SIZE
    bit FILE_HIST_F, b
    jr nz, .jr_000_0b68

    xor a

.jr_000_0b68
    add FILE_TYPE_OFFSET
    add c
    ld c, a
    push bc
    push bc
    ld a, $00
    adc a
    ld b, a
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld d, a
    pop bc
    ld a, [$c662]
    ld c, a
    ld a, $ff
    ld hl, $c70a
    ld [hl], a
    push de
    push bc
    ld a, $05
    call Call_000_0d05
    pop bc
    pop de
    push de
    ld hl, $c700
    call Call_000_0d31
    pop de
    pop bc
    jr nc, jr_000_0b9f

    cp $ff
    jr z, jr_000_0bee

    ld a, $04
    jr jr_000_0be8

jr_000_0b9f:
    push bc
    push de
    push hl
    ld hl, sp+$00
    ld d, h
    ld e, l
    ld hl, $ce00
    ld c, $02
    call Call_000_0cff
    pop hl
    pop de
    pop bc
    ld a, [$c663]
    cp h
    jr nz, jr_000_0be6

    ld a, $05
    cp l
    jr nz, jr_000_0be6

    xor a
    bit FILE_HIST_F, b
    ret z

    push bc
    push de
    ld b, $00
    ld de, $ffd2
    ld hl, $c700
    call Call_000_0d2b
    pop de
    ld hl, FILE_HIST_SIZE
    add hl, de
    ld e, l
    ld d, h
    pop bc
    ld a, c
    sub FILE_HIST_SIZE
    ld c, a
    xor a
    ret


Jump_000_0bdb:
    ld a, $01
    ld [$c664], a
    pop bc
    pop de
    ld a, $07
    jr jr_000_0be8

jr_000_0be6:
    ld a, $05

jr_000_0be8:
    call Call_000_0d05
    call Call_000_0d16

Jump_000_0bee:
jr_000_0bee:
    or $01
    scf
    ret


Call_000_0bf2:
    ld hl, $c709
    ld a, [hl+]
    push hl
    inc hl
    ld b, $00
    bit FILE_HIST_F, a
    ld a, $fe
    jr z, .jr_000_0c02

    sub FILE_HIST_SIZE

.jr_000_0c02
    sub [hl]
    ld e, a
    ld a, $ff
    sbc b
    ld d, a
    call Call_000_0d2b
    pop de
    ret c

    ld a, [$c661]
    ld [de], a
    ld bc, $0001
    jp Jump_000_0d25


strBeamFilePrep::
    dk "つうしんじゅんびちゅう　にして　　»\0"
    dk "ゲームボーイどうしを　くっつけ　»\0"
    dk "Aボタンを　おしてください　　　»\0"
    dk "\0"

strBeamFileStarted::
    dk "つうしんを　ちゅうしするばあいは　»\0"
    dk "                \0"
    dk "Bボタンを　おしてください　　　»\0"
    dk "\0"

Call_000_0c95:
    ld hl, strBeamFilePrep
    call Call_000_087f

jr_000_0c9b:
    trap InputButtons
    bit 1, a
    jr nz, jr_000_0ce8

    and $01
    jr z, jr_000_0c9b

    ld hl, strBeamFileStarted
    call Call_000_087f
    ld hl, $ce00
    ld de, $c800
    ld c, $10
    call Call_000_0cff
    jr c, jr_000_0ce8

    pushx strGBKissMenu
    pop hl
    ld de, $c802
    ld bc, $000d
    trap MemCmp
    ld a, h
    or l
    ld a, $06
    jr nz, jr_000_0cea

    ld a, [$c800]
    or a
    jr nz, jr_000_0cea

    ld a, [$c801]
    ld [$c663], a
    ld a, [$c80f]
    ld [$c662], a
    ld a, $01
    call Call_000_0d05
    jr c, jr_000_0ce8

    call Call_000_0d16
    xor a
    ret


jr_000_0ce8:
    scf
    ret


jr_000_0cea:
    call Call_000_0d05
    call Call_000_0d16
    scf
    ret


strGBKissMenu:
    dp "GB KISS MENU "

Call_000_0cff:
    trap AwaitBlit
    trap IRRead
    jr jr_000_0d3b

Call_000_0d05:
    ld [$c800], a
    ld de, $ce00
    ld hl, $c800
    ld c, $01
    trap AwaitBlit
    trap IRWrite
    jr jr_000_0d3b

Call_000_0d16:
    trap AwaitBlit
    trap IRClose
    jr jr_000_0d3b

    ld hl, $c700
    trap AwaitBlit
    trap IR06
    jr jr_000_0d3b

Call_000_0d25:
Jump_000_0d25:
    trap AwaitBlit
    trap IR0A
    jr jr_000_0d3b

Call_000_0d2b:
    trap AwaitBlit
    trap IR04
    jr jr_000_0d3b

Call_000_0d31:
    trap AwaitBlit
    trap IRFileWrite
    jr jr_000_0d3b

Call_000_0d37:
    trap AwaitBlit
    trap IRFileSearch

jr_000_0d3b:
    push af
    trap $db
    pop af
    ret


strLoadSuccess::
    dk "«- <てんそう　されました> -»\0"

strLoadFailure::
    dk "«- てんそうできませんでした -»\0"

strLoadOverwrite::
    dk "«- おなじファイルがあります -»\0"

SECTION "minigame/bank_000: ROM Bank $3fe0", ROM0

Call_000_3fe0::
    push af
    ld a, BANK(Jump_003_4006_Origin)
    rst $20
    pop af
    ld bc, code_00_3fea
    push bc
    jp hl


code_00_3fea::
    ld a, $04
    rst $20
    ret
