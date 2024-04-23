GBK_ASM = $(wildcard file/*.asm)
GB_ASM = $(wildcard *.asm)
PNG = $(wildcard gfx/*.png gfx/*/*.png)
GFX = $(PNG:%.png=%)

ASM = $(GB_ASM) $(GBK_ASM)
OBJ = $(ASM:%.asm=%.o)
DEP = $(ASM:%.asm=%.d)
SYM = $(ASM:%.asm=%.sym)
MAP = $(ASM:%.asm=%.map)
GBK = $(GBK_ASM:%.asm=%.gbk)
GB = $(GB_ASM:%.asm=%.gb)


.PHONY: all
all: $(GB)

%.o: %.asm
	rgbasm -M $*.d -o $@ $<

%.gb: %.o
	rgblink -n $*.sym -m $*.map -o $@ $<
	rgbfix -v -p 255 $@

%.gbk: %.o
	rgblink -n $*.sym -x -o $@ $<

%.2bpp: %.2bpp.png
	rgbgfx -Z -d2 -o $@ $<

%.1bpp: %.1bpp.png
	rgbgfx -d1 -o $@ $<

.PHONY: clean
clean:
	rm -f $(GB) $(GBK) $(OBJ) $(SYM) $(MAP) $(GFX) $(DEP)

.PHONY: check
check: $(GB) $(GBK)
	shasum -c roms.sha1

-include $(DEP)
gbkiss.o: $(GBK) $(GFX) gfx/logo.2bpp.hz
file/koura-1.o: gfx/koura-1.2bpp.hz
file/koura-2.o: gfx/koura-2.2bpp.hz
file/koura-3.o: gfx/koura-3.2bpp.hz
file/sezaki.o: gfx/sezaki.2bpp.hz
file/shot.o: gfx/icon/shot.2bpp
file/simula1.o: gfx/icon/simula1.2bpp
