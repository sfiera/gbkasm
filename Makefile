GBK_ASM = $(wildcard gbk/*.asm)
GB_ASM = $(wildcard *.asm)
PNG = $(wildcard gfx/*.png)
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
	rgbasm --preserve-ld --nop-after-halt -M $*.d -o $@ $<

%.gb: %.o
	rgblink -n $*.sym -m $*.map -o $@ $<
	rgbfix -v -p 255 $@

%.gbk: %.o
	rgblink -n $*.sym -x -o $@ $<

%.2bpp: %.2bpp.png
	rgbgfx -d2 -o $@ $<

%.1bpp: %.1bpp.png
	rgbgfx -d1 -o $@ $<

%.icon: %.icon.png
	rgbgfx -Z -o $@ $<

.PHONY: clean
clean:
	rm -f $(GB) $(GBK) $(OBJ) $(SYM) $(MAP) $(GFX) $(DEP)

.PHONY: check
check: $(GB) $(GBK)
	shasum -c roms.sha1

-include $(DEP)
gbkiss.o: $(GBK) $(GFX)
gbk/shot.o: gfx/shot.icon
