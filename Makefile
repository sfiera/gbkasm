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

.PHONY: all
all: $(GB)

%.o: %.asm
	$(RGBASM) -M $*.d -o $@ $<

%.gb: %.o
	$(RGBLINK) -n $*.sym -m $*.map -o $@ $<
	$(RGBFIX) -v -p 255 $@

%.gbf: %.o
	$(RGBLINK) -n $*.sym -x -o $@ $<

%.2bpp: %.2bpp.png
	$(RGBGFX) -Z -d2 -o $@ $<

%.1bpp: %.1bpp.png
	$(RGBGFX) -d1 -o $@ $<

.PHONY: clean
clean:
	rm -f $(GB) $(GBF) $(OBJ) $(SYM) $(MAP) $(GFX) $(DEP)

.PHONY: check
check: $(GB) $(GBF)
	shasum -c roms.sha1

-include $(DEP)
gbkiss.o: $(GBF) $(GFX) gfx/logo.2bpp.hz
file/bakechu-relay.o: gfx/icon/bakechu-relay.2bpp
file/calculator.o: gfx/icon/calculator.2bpp
file/koura-1.o: gfx/koura-1.2bpp.hz
file/koura-2.o: gfx/koura-2.2bpp.hz
file/koura-3.o: gfx/koura-3.2bpp.hz
file/samegame.o: gfx/icon/samegame.2bpp gfx/sametiles.2bpp.hz
file/sezaki.o: gfx/sezaki.2bpp.hz
file/shot.o: gfx/icon/shot.2bpp
file/simula1.o: gfx/icon/simula1.2bpp
file/sound-test.o: gfx/icon/sound-test.2bpp
file/watch-and-timer.o: gfx/icon/tokei.2bpp
