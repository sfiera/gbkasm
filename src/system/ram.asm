; Disassembly of "gbkiss.gb"

SECTION "HRAM Banking", HRAM

hROMBank:: ds 1
hRAMBank:: ds 1

SECTION "HRAM Text", HRAM

hPenX:: ds 1
hPenY:: ds 1
hDraw90:: ds 1
hDraw91:: ds 1
hDrawMode:: ds 1
hDrawMode2:: ds 1

SECTION "WRAM", WRAM0

VarDrawBaseAddr:: dw
VarExtractAddr:: dw
