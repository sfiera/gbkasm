IMAGE_DEPS = gfx/image_02_6f8e.1bpp gfx/image_02_778e.2bpp gfx/image_02_7f8e.2bpp

all: gbkiss.gb

%.2bpp: %.png
	rgbgfx -o $@ $<

%.1bpp: %.png
	rgbgfx -d 1 -o $@ $<

gbkiss.o: gbkiss.asm bank_*.asm hram.asm charmap.asm $(IMAGE_DEPS)
	rgbasm --preserve-ld --nop-after-halt -o gbkiss.o gbkiss.asm

gbkiss.gb: gbkiss.o
	rgblink -n gbkiss.sym -m gbkiss.map -o $@ $<
	rgbfix -v -p 255 $@

	@if which md5sum &>/dev/null; then md5sum $@; else md5 $@; fi

.PHONY: clean
clean:
	rm -f gbkiss.o gbkiss.gb gbkiss.sym gbkiss.map
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' \) -exec rm {} +

.PHONY: check
check: gbkiss.gb
	shasum -c roms.sha1
