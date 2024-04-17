IMAGE_DEPS_2BPP = gfx/tiles_0.2bpp gfx/tiles_1.2bpp
IMAGE_DEPS_1BPP = gfx/font.1bpp
IMAGE_DEPS_ICON = gfx/shot.icon
IMAGE_DEPS = $(IMAGE_DEPS_2BPP) $(IMAGE_DEPS_1BPP) $(IMAGE_DEPS_ICON)

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

$(IMAGE_DEPS_2BPP): %.2bpp: %.2bpp.png
	rgbgfx -d2 -o $@ $<

$(IMAGE_DEPS_1BPP): %.1bpp: %.1bpp.png
	rgbgfx -d1 -o $@ $<

$(IMAGE_DEPS_ICON): %.icon: %.icon.png
	rgbgfx -Z -o $@ $<

.PHONY: clean
clean:
	rm -f gbkiss.gb gbkiss.sym gbkiss.map $(GBK) $(OBJ) $(DEP) $(IMAGE_DEPS)

.PHONY: check
check: gbkiss.gb
	shasum -c roms.sha1

-include $(DEP)
gbkiss.o: $(GBK) $(IMAGE_DEPS)
gbk/shot.o: gfx/shot.icon
