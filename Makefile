GFX = gfx/tiles_0.2bpp \
	  gfx/tiles_1.2bpp \
	  gfx/font.1bpp \
	  gfx/shot.icon

GBK_ASM = gbk/shot.asm
ASM = gbkiss.asm $(GBK_ASM)

OBJ = $(ASM:%.asm=%.o)
DEP = $(ASM:%.asm=%.o.d)
GBK = $(GBK_ASM:%.asm=%.gbk)


.PHONY: all
all: gbkiss.gb

%.o: %.asm
	rgbasm --preserve-ld --nop-after-halt -M $@.d -o $@ $<

%.gb: %.o
	rgblink -n gbkiss.sym -m gbkiss.map -o $@ $<
	rgbfix -v -p 255 $@

%.gbk: %.o
	rgblink -n $@.sym -x -o $@ $<

%.2bpp: %.2bpp.png
	rgbgfx -d2 -o $@ $<

%.1bpp: %.1bpp.png
	rgbgfx -d1 -o $@ $<

%.icon: %.icon.png
	rgbgfx -Z -o $@ $<

.PHONY: clean
clean:
	rm -f gbkiss.gb gbkiss.sym gbkiss.map $(GBK) $(OBJ) $(DEP) $(GFX)

.PHONY: check
check: gbkiss.gb
	shasum -c roms.sha1

-include $(DEP)
gbkiss.o: $(GBK) $(GFX)
gbk/shot.o: gfx/shot.icon
