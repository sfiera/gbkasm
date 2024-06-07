; Disassembly of "gbkiss.gb"

MACRO rcall
    rpush @+6
    rpush \1
    ret
ENDM

DEF GameIdentifier         EQU $0014
DEF SuperBDaman            EQU $01
DEF SuperBDamanAudioCount  EQU (27 << 8) + 56

INCLUDE "charmap.inc"
INCLUDE "macro.inc"
INCLUDE "file/common.inc"

SECTION "ROM Bank $000", ROM0[$0]

Header::
    ; Length of entirety of file
    dw End
    ; Flags for display in menu
    db kFileHasIcon2bpp + kFileMarkerCircle
    ; Must be $00 for normal files (other than Kiss Mail)
    db $00
    ; Length of variable parts of header
    db Main - @ - 1
    ; File owner code
    db $05

Title::
    db "ｻｳﾝﾄﾞ ﾃｽﾄ"
Icon::
    INCBIN "gfx/icon/sound-test.2bpp"

Main::
    ld a, $c4
    ld bc, $0201
    ld de, $0d12
    ld h, $04
    trap DrawBox
    trap $11

    ld hl, varMusicMax
    rcall LoadAudioCount
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

    rcall DrawInterface
    rcall SelectMusic
    rcall SelectSound
    rcall SelectOffCh
    rcall SelectVol
    rcall SelectTimer
    trap $b1
    ld de, $011b
    ld bc, $1a09
    ld l, $06
    ld a, $00

jr_0134:
    ld h, $37
    trap $bf

.loop
    bit 1, h      ; if B pressed
    jr nz, .exit  ;   exit
    bit 2, h      ; if Select pressed
    jr nz, .exit  ;   exit
    push bc
    push de
    push hl
    push af
    rcall SelectSetting
    trap $d8
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
    ld a, [GameIdentifier]
    ld de, SuperBDamanAudioCount
    cp SuperBDaman
    ret z
    trap GetAudioCount
    ret

SelectSetting:
    cp $04
    jr nz, .notPause
    bit 0, h
    ret z

    trap PauseMusic
    rcall DrawState
    ret

.notPause:
    bit 0, h
    jr z, jr_01a4
    rcall GetSelectProcedure
    rpush DrawState
    jp hl

GetSelectProcedure:
    rpush SelectMusic
    pop hl
    or a
    ret z

    rpush SelectSound
    pop hl
    dec a
    ret z

    rpush SelectOffCh
    pop hl
    dec a
    ret z

    rpush SelectVol
    pop hl
    dec a
    ret z

    rpush SelectTimer
    pop hl
    ret

jr_01a4:
    ld c, h
    rpush DrawMusicCur
    pop hl
    ld de, varMusicMax
    or a
    jr z, jr_01d4
    rpush DrawSoundCur
    pop hl
    ld de, varSoundMax
    dec a
    jr z, jr_01d4
    rpush DrawOffChCur
    pop hl
    ld de, varOffChMax
    dec a
    jr z, jr_01d4
    rpush DrawVolCur
    pop hl
    ld de, varVolMax
    dec a
    jr z, jr_01d4
    rpush DrawTimerCur
    pop hl
    ld de, varTimerMax

jr_01d4:
    ld a, [de]
    inc de
    ld b, a
    bit 4, c
    jr nz, jr_01e5
    ld a, [de]
    or a
    jr z, jr_01e0
    dec a

jr_01e0:
    ld [de], a
    rpush DrawState
    jp hl

jr_01e5:
    ld a, [de]
    cp b
    jr z, jr_01e0
    inc a
    jr jr_01e0

DrawInterface:
    ld de, $0103
    rpush StrInterface
    pop hl
    trap $6a
    ld hl, $0101
    trap MoveCursor
    rpush StrTitle
    pop hl
    trap DrawString
    ld hl, $000a
    trap MoveCursor
    rpush StrStatus
    pop hl
    trap DrawString
    rcall DrawMusicMaxCur
    rcall DrawSoundMaxCur
    rcall DrawOffChMaxCur
    rcall DrawVolMaxCur
    rpush DrawTimerMaxCur
    ret

SelectMusic:
    ld a, [varMusicCur]
    trap PlayMusic
    ret

DrawMusicMaxCur:
    ld hl, $0f03
    ld a, [varMusicMax]
    rcall DrawInt

DrawMusicCur:
    ld hl, $0b03
    ld a, [varMusicCur]
    jr DrawInt

SelectSound:
    ld a, [varSoundCur]
    trap PlaySound
    ret

DrawSoundMaxCur:
    ld hl, $0f04
    ld a, [varSoundMax]
    rcall DrawInt

DrawSoundCur:
    ld hl, $0b04
    ld a, [varSoundCur]
    jr DrawInt

SelectOffCh:
    ld a, [varOffChCur]
    trap $15
    ret

DrawOffChMaxCur:
    ld hl, $0f05
    ld a, [varOffChMax]
    rcall DrawInt

DrawOffChCur:
    ld hl, $0b05
    ld a, [varOffChCur]
    jr DrawInt

SelectVol:
    ld a, [varVolCur]
    trap $19
    ret

DrawVolMaxCur:
    ld hl, $0f06
    ld a, [varVolMax]
    rcall DrawInt

DrawVolCur:
    ld hl, $0b06
    ld a, [varVolCur]
    jr DrawInt

SelectTimer:
    ld a, [varTimerCur]
    add a
    add a
    ld h, a
    ld l, $bc
    trap $cb
    ret

DrawTimerMaxCur:
    ld hl, $0f08
    ld a, [varTimerMax]
    rcall DrawInt

DrawTimerCur:
    ld hl, $0b08
    ld a, [varTimerCur]

DrawInt:
    push af
    trap MoveCursor
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
    trap MoveCursor
    trap GetMusicState
    rcall DrawStopPlay

    ld hl, $0e0a
    trap MoveCursor
    trap GetSoundState

DrawStopPlay:
    rpush StrStop
    pop hl
    or a
    jr z, :+
    rpush StrPlay
    pop hl
:   trap DrawString
    ret

StrTitle:
    db "SOUND TEST ROOM\n"
StrInterface:
    db "MUSIC No.    /\n"
    db "EFECT No.    /\n"
    db "OffChannel   /\n"
    db "VOLUME       /\n"
    db "M_PAUSE \n"
    db "VsyncTimer   /\n"
    db "\n"
StrStatus:
    db "Mst=STOP  Est=STOP\n"
StrStop:
    db "STOP\n"
StrPlay:
    db "PLAY\n"

End:


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
