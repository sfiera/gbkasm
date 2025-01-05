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
    NINTENDO_LOGO

HeaderTitle::
    dp "GBKISS MINIGAME\0"

HeaderNewLicenseeCode::
    db $31, $38

HeaderSGBFlag::
    db CART_INDICATOR_GB

HeaderCartridgeType::
    db CART_ROM_HUDSON_HUC1

HeaderROMSize::
    db CART_ROM_256KB

HeaderRAMSize::
    db CART_SRAM_32KB

HeaderDestinationCode::
    db CART_DEST_JAPANESE

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
    db CART_MINIGAME
KissIndexBank::
    db $03    ; CRAM block of GBKiss file index
KissIndexAddr::
    dw $bf00  ; CRAM address of GBKiss file index
