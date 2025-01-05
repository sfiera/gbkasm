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

SECTION "Game Boy Metadata", ROM0

HeaderLogo::
    db $ce, $ed, $66, $66, $cc, $0d, $00, $0b, $03, $73, $00, $83, $00, $0c, $00, $0d
    db $00, $08, $11, $1f, $88, $89, $00, $0e, $dc, $cc, $6e, $e6, $dd, $dd, $d9, $99
    db $bb, $bb, $67, $63, $6e, $0e, $ec, $cc, $dd, $dc, $99, $9f, $bb, $b9, $33, $3e

HeaderTitle::
    dp "GBKISS MINIGAME\0"

HeaderNewLicenseeCode::
    db $31, $38

HeaderSGBFlag::
    db $00

HeaderCartridgeType::
    db $ff

HeaderROMSize::
    db $03

HeaderRAMSize::
    db $03

HeaderDestinationCode::
    db $00

HeaderOldLicenseeCode::
    db $33

HeaderMaskROMVersion::
    db $00

HeaderComplementCheck::
    db $1c

HeaderGlobalChecksum::
    db $75, $09


SECTION "GBKiss Config", ROM0

Config0::
    db BANK(j01_4100)
Config1::
    db BANK(traps1)
Config2::
    db ((traps1 - $4000) / 2) - 1
Config3::
    db BANK(traps1)
Config4::
    db BANK(traps2)


SECTION "GBKiss Metadata", ROM0

    db $00
KissCartridgeCode::
    db $fe    ; CART_MINIGAME
KissIndexBank::
    db $03    ; CRAM block of GBKiss file index
KissIndexAddr::
    dw $bf00  ; CRAM address of GBKiss file index
