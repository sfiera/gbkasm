IMAGE_DEPS = gfx/image_02_6f8e.1bpp gfx/image_02_778e.2bpp gfx/image_02_7f8e.2bpp
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
		   gbk/shot.gbk \
		   gbk/slot.gbk \
		   gbk/sound-test.gbk \
		   gbk/sram-get-and-clear.gbk \
		   gbk/watch-and-timer.gbk \
		   gbk/worm.gbk

DEPS = $(IMAGE_DEPS) $(GBK_DEPS)

all: gbkiss.gb

%.2bpp: %.png
	rgbgfx -o $@ $<

%.1bpp: %.png
	rgbgfx -d 1 -o $@ $<

gbkiss.o: gbkiss.asm bank_*.asm hram.asm charmap.asm $(DEPS)
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
