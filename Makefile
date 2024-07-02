GBF_ASM = $(wildcard file/*.asm)
GB_ASM = $(wildcard *.asm)
PNG = $(wildcard gfx/*.png gfx/*/*.png)
GFX = $(PNG:%.png=%)

ASM = $(GB_ASM) $(GBF_ASM)
OBJ = $(ASM:%.asm=%.o)
DEP = $(ASM:%.asm=%.d)
SYM = $(ASM:%.asm=%.sym)
MAP = $(ASM:%.asm=%.map)
GBF = $(GBF_ASM:%.asm=%.gbf)
GB = $(GB_ASM:%.asm=%.gb)

RGBASM=rgbasm -Wall -Werror
RGBLINK=rgblink
RGBFIX=rgbfix
RGBGFX=rgbgfx

.SECONDARY:

.PHONY: all
all: $(GB) $(GBF)

%.o: %.asm | $(GFX)
	$(RGBASM) -M $*.d -o $@ $<

%.gb: %.o
	$(RGBLINK) -n $*.sym -m $*.map -o $@ $<
	$(RGBFIX) -v -p 255 $@

%.gbf: %.o
	$(RGBLINK) -n $*.sym -x -o $@ $<

%.2bpp: %.2bpp.png %.2bpp.flags
	$(RGBGFX) -d2 -o $@ $< @$*.2bpp.flags

%.1bpp: %.1bpp.png %.1bpp.flags
	$(RGBGFX) -d1 -o $@ $< @$*.1bpp.flags

.PHONY: clean
clean:
	rm -f *.gb file/*.gbf
	rm -f gfx/*.?bpp gfx/*/*.?bpp
	rm -f {.,file}/*.o {.,file}/*.d {.,file}/*.sym {.,file}/*.map

.PHONY: check
check: $(GB) $(GBF)
	shasum -c roms.sha1

-include $(DEP)
gbkiss.o: | $(GBF)
