IMAGE_DEPS_2BPP = gfx/image_02_778e.2bpp gfx/image_02_7f8e.2bpp
IMAGE_DEPS_1BPP = gfx/image_02_6f8e.1bpp
IMAGE_DEPS_VERT = gfx/shot-icon.2bpp
IMAGE_DEPS = $(IMAGE_DEPS_2BPP) $(IMAGE_DEPS_1BPP) $(IMAGE_DEPS_VERT)

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

$(IMAGE_DEPS_2BPP): %.2bpp: %.png
	rgbgfx -o $@ $<

$(IMAGE_DEPS_1BPP): %.1bpp: %.png
	rgbgfx -d 1 -o $@ $<

$(IMAGE_DEPS_VERT): %.2bpp: %.png
	rgbgfx -Z -o $@ $<

.PHONY: clean
clean:
	rm -f gbkiss.gb gbkiss.sym gbkiss.map $(GBK) $(OBJ) $(DEP) $(IMAGE_DEPS)

.PHONY: check
check: gbkiss.gb
	shasum -c roms.sha1

-include $(DEP)
gbkiss.o: $(GBK) $(IMAGE_DEPS)
gbk/shot.o: gfx/shot-icon.2bpp
