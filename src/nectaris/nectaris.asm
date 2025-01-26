; Disassembly of "Nectaris GB (Japan) (SGB Enhanced).gb"
; This file was created with:
; mgbdis v2.0 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "src/common.inc"
INCLUDE "src/hardware.inc"

SECTION "nectaris/nectaris: Game Boy Metadata", ROM0

HeaderLogo::
    NINTENDO_LOGO
HeaderTitle::
    db "NECTARIS GB\0\0\0\0\0"
HeaderNewLicenseeCode::
    db $31, $38
HeaderSGBFlag::
    db CART_INDICATOR_SGB
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
    db $40
HeaderGlobalChecksum::
    db $d2, $51


SECTION "nectaris/nectaris: GBKiss Config", ROM0

Config0::
    db BANK(KissMenu)
Config1::
    db BANK(traps1)
Config2::
    db ((traps1 - $4000) / 2) - 1
Config3::
    db BANK(traps1)
Config4::
    db BANK(traps2)


SECTION "nectaris/nectaris: GBKiss Metadata", ROM0

    db $00
KissCartridgeCode::
    db CART_NECTARIS
KissIndexBank::
    db $01
KissIndexAddr::
    dw $bf80
