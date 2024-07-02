; Disassembly of "sound-test.gbf"

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

DEF SuperBDamanAudioCount  EQU (27 << 8) + 56

SECTION "ROM Bank $000", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_ICON | FILE_2BPP
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $05           ; owner code
.title
    dk "サウンド　テスト"
.icon
    INCBIN "gfx/soundtst/icon.2bpp"
.end

History:
.end

Main::
    ld a, $c4
    ld bc, $0201
    ld de, $0d12
    ld h, $04
    trap DrawInit
    trap StopAudio

    ld hl, varMusicMax
    callx LoadAudioCount
    ld a, d
    ld [hli], a  ; [varMusicMax] = d
    xor a
    ld [hli], a  ; [varMusicCur] = 0
    ld a, e
    ld [hli], a  ; [varSoundMax] = e
    xor a
    ld [hli], a  ; [varSoundCur] = 0
    ld a, 15
    ld [hli], a  ; [varOffChMax] = 15
    xor a
    ld [hli], a  ; [varOffChCur] = 0
    ld a, 7
    ld [hli], a  ; [varVolMax] = 7
    ld [hli], a  ; [varVolCur] = 0
    ld a, $01
    ld [hli], a  ; [varTimerMax] = 1
    ld [hli], a  ; [varTimerCur] = 1
    xor a
    ld [hli], a  ; [varEnd] = 0

    callx DrawInterface
    callx ApplyMusic
    callx ApplySound
    callx ApplyOffCh
    callx ApplyVol
    callx ApplyTimer
    trap AwaitFrame
    ld de, $011b
    ld bc, $1a09
    ld l, $06
    ld a, $00

jr_0134:
    ld h, $37
    trap DoMenu

.loop
    bit BTN_B_F, h
    jr nz, .exit
    bit BTN_SEL_F, h
    jr nz, .exit

    push bc
    push de
    push hl
    push af
    callx HandleSetting
    trap GetButtons
    pop bc
    and $37
    pop hl
    ld h, a
    pop de
    ld a, b
    pop bc
    jr z, jr_0134
    jr .loop

.exit
    trap ExitToMenu

LoadAudioCount:
    ld a, [CartridgeCodeAddr]
    ld de, SuperBDamanAudioCount
    cp CART_BDAMAN
    ret z
    trap GetAudioCount
    ret

HandleSetting:
    cp $04
    jr nz, .notPause
    bit BTN_A_F, h
    ret z

    trap PauseMusic
    callx DrawState
    ret

.notPause
    bit BTN_A_F, h
    jr z, ChangeSetting
    callx GetApplyProcedure
    pushx DrawState
    jp hl

GetApplyProcedure:
    ldx hl, ApplyMusic
    or a
    ret z

    ldx hl, ApplySound
    dec a
    ret z

    ldx hl, ApplyOffCh
    dec a
    ret z

    ldx hl, ApplyVol
    dec a
    ret z

    ldx hl, ApplyTimer
    ret

ChangeSetting:
    ld c, h
    ldx hl, DrawMusicCur
    ld de, varMusicMax
    or a
    jr z, .apply

    ldx hl, DrawSoundCur
    ld de, varSoundMax
    dec a
    jr z, .apply

    ldx hl, DrawOffChCur
    ld de, varOffChMax
    dec a
    jr z, .apply

    ldx hl, DrawVolCur
    ld de, varVolMax
    dec a
    jr z, .apply

    ldx hl, DrawTimerCur
    ld de, varTimerMax

.apply
    ld a, [de]
    inc de
    ld b, a
    bit BTN_RT_F, c
    jr nz, .inc

    ld a, [de]
    or a
    jr z, .done
    dec a

.done
    ld [de], a
    pushx DrawState
    jp hl

.inc
    ld a, [de]
    cp b
    jr z, .done
    inc a
    jr .done

DrawInterface:
    ld de, $0103
    ldx hl, StrInterface
    trap DrawStringList
    ld hl, $0101
    trap MovePen
    ldx hl, StrTitle
    trap DrawString
    ld hl, $000a
    trap MovePen
    ldx hl, StrStatus
    trap DrawString
    callx DrawMusicMaxCur
    callx DrawSoundMaxCur
    callx DrawOffChMaxCur
    callx DrawVolMaxCur
    jx DrawTimerMaxCur

ApplyMusic:
    ld a, [varMusicCur]
    trap PlayMusic
    ret

DrawMusicMaxCur:
    ld hl, $0f03
    ld a, [varMusicMax]
    callx DrawInt

DrawMusicCur:
    ld hl, $0b03
    ld a, [varMusicCur]
    jr DrawInt

ApplySound:
    ld a, [varSoundCur]
    trap PlaySound
    ret

DrawSoundMaxCur:
    ld hl, $0f04
    ld a, [varSoundMax]
    callx DrawInt

DrawSoundCur:
    ld hl, $0b04
    ld a, [varSoundCur]
    jr DrawInt

ApplyOffCh:
    ld a, [varOffChCur]
    trap SilenceChannels
    ret

DrawOffChMaxCur:
    ld hl, $0f05
    ld a, [varOffChMax]
    callx DrawInt

DrawOffChCur:
    ld hl, $0b05
    ld a, [varOffChCur]
    jr DrawInt

ApplyVol:
    ld a, [varVolCur]
    trap SetVolume
    ret

DrawVolMaxCur:
    ld hl, $0f06
    ld a, [varVolMax]
    callx DrawInt

DrawVolCur:
    ld hl, $0b06
    ld a, [varVolCur]
    jr DrawInt

ApplyTimer:
    ld a, [varTimerCur]
    add a
    add a
    ld h, a
    ld l, $bc
    trap TimerSet
    ret

DrawTimerMaxCur:
    ld hl, $0f08
    ld a, [varTimerMax]
    callx DrawInt

DrawTimerCur:
    ld hl, $0b08
    ld a, [varTimerCur]

DrawInt:
    push af
    trap MovePen
    pop af
    ld e, a
    ld d, $00
    ld hl, $c400
    trap IntToString
    ld hl, $c403
    trap DrawString
    ret

DrawState:
    ld hl, $040a
    trap MovePen
    trap GetMusicState
    callx DrawStopPlay

    ld hl, $0e0a
    trap MovePen
    trap GetSoundState

DrawStopPlay:
    ldx hl, StrStop
    or a
    jr z, :+
    ldx hl, StrPlay
:   trap DrawString
    ret

StrTitle:
    dk "SOUND TEST ROOM\n"
StrInterface:
    dk "MUSIC No.    /\n"
    dk "EFECT No.    /\n"
    dk "OffChannel   /\n"
    dk "VOLUME       /\n"
    dk "M_PAUSE \n"
    dk "VsyncTimer   /\n"
    dk "\n"
StrStatus:
    dk "Mst=STOP  Est=STOP\n"
StrStop:
    dk "STOP\n"
StrPlay:
    dk "PLAY\n"


SECTION "Variables", WRAM0[$c600]

varMusicMax: ds 1
varMusicCur: ds 1
varSoundMax: ds 1
varSoundCur: ds 1
varOffChMax: ds 1
varOffChCur: ds 1
varVolMax: ds 1
varVolCur: ds 1
varTimerMax: ds 1
varTimerCur: ds 1
varEnd:
