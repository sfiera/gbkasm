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
file/baketu.o: gfx/icon/bakechu-relay.2bpp
file/bland.o: gfx/icon/binary.2bpp
file/bland.o: gfx/binary.2bpp.hz
file/cannon.o: gfx/icon/cannon-ball.2bpp
file/dentaku.o: gfx/icon/calculator.2bpp
file/drive.o: gfx/icon/drive.2bpp
file/iconedit.o: gfx/icon/icon-edit.2bpp
file/iconsend.o: gfx/icons.2bpp.hz
file/kissmon.o: gfx/icon/kiss-mon.2bpp
file/koura1.o: gfx/koura-1.2bpp.hz
file/koura2.o: gfx/koura-2.2bpp.hz
file/koura3.o: gfx/koura-3.2bpp.hz
file/magnets.o: gfx/icon/magnets.2bpp
file/mogura.o: gfx/icon/mogutte-nanbo.2bpp
file/puzzle.o: gfx/icon/puzzle-game.2bpp
file/puzzle.o: gfx/puzzle/arrow.2bpp
file/puzzle.o: gfx/puzzle/hand.2bpp
file/puzzle.o: gfx/puzzle/tile.2bpp
file/puzzle.o: gfx/puzzle/boxes.2bpp.hz
file/puzzle.o: gfx/puzzle/numbers.2bpp.hz
file/roulette.o: gfx/icon/roulette.2bpp
file/samegame.o: gfx/icon/samegame.2bpp
file/samegame.o: gfx/sametiles.2bpp.hz
file/sezaki.o: gfx/sezaki.2bpp.hz
file/shot.o: gfx/icon/shot.2bpp
file/simula1.o: gfx/icon/simula1.2bpp
file/slot.o: gfx/icon/slot.2bpp
file/soundtst.o: gfx/icon/sound-test.2bpp
file/sw_timer.o: gfx/icon/tokei.2bpp
