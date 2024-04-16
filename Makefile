IMAGE_DEPS_2BPP = gfx/image_02_778e.2bpp gfx/image_02_7f8e.2bpp
IMAGE_DEPS_1BPP = gfx/image_02_6f8e.1bpp
IMAGE_DEPS_VERT = gfx/shot-icon.2bpp
IMAGE_DEPS = $(IMAGE_DEPS_2BPP) $(IMAGE_DEPS_1BPP) $(IMAGE_DEPS_VERT)

BUILD_GBK = gbk/shot.gbk
GBK_DEPS = gbk/bakechu-relay.gbk \
		   gbk/binary.gbk \
		   gbk/biorhythm.gbk \
		   gbk/blackjack.gbk \
		   gbk/calculator.gbk \
		   gbk/cannon-ball.gbk \
		   gbk/char-view.gbk \
		   gbk/delete-all.gbk \
		   gbk/drive.gbk \
		   gbk/icon-edit.gbk \
		   gbk/icon-send.gbk \
		   gbk/kiss-mon.gbk \
		   gbk/koura-1.gbk \
		   gbk/koura-2.gbk \
		   gbk/koura-3.gbk \
		   gbk/magnets-data.gbk \
		   gbk/magnets.gbk \
		   gbk/mogutte-nanbo.gbk \
		   gbk/num0-data.gbk \
		   gbk/poker.gbk \
		   gbk/puzzle-game.gbk \
		   gbk/roulette.gbk \
		   gbk/samegame.gbk \
		   gbk/sezaki.gbk \
		   gbk/slot.gbk \
		   gbk/sound-test.gbk \
		   gbk/sram-get-and-clear.gbk \
		   gbk/watch-and-timer.gbk \
		   gbk/worm.gbk \
		   $(BUILD_GBK)
OBJ = gbkiss.o gbk/shot.o

DEPS = $(IMAGE_DEPS) $(GBK_DEPS)

all: gbkiss.gb

$(IMAGE_DEPS_2BPP): %.2bpp: %.png
	rgbgfx -o $@ $<

$(IMAGE_DEPS_1BPP): %.1bpp: %.png
	rgbgfx -d 1 -o $@ $<

$(IMAGE_DEPS_VERT): %.2bpp: %.png
	rgbgfx -Z -o $@ $<

gbkiss.o: gbkiss.asm bank_*.asm hram.asm charmap.asm $(DEPS)
	rgbasm --preserve-ld --nop-after-halt -o $@ $<

gbkiss.gb: gbkiss.o
	rgblink -n gbkiss.sym -m gbkiss.map -o $@ $<
	rgbfix -v -p 255 $@

	@if which md5sum &>/dev/null; then md5sum $@; else md5 $@; fi

gbk/shot.o: gbk/shot.asm gfx/shot-icon.2bpp
	rgbasm --preserve-ld --nop-after-halt -o $@ $<

gbk/shot.gbk: gbk/shot.o
	rgblink -n $@.sym -x -o $@ $<

.PHONY: clean
clean:
	rm -f gbkiss.gb gbkiss.sym gbkiss.map $(BUILD_GBK) $(OBJ) $(IMAGE_DEPS) $(VERT_IMAGE_DEPS)

.PHONY: check
check: gbkiss.gb
	shasum -c roms.sha1
