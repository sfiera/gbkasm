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
file/baketu.o: gfx/baketu/icon.2bpp
file/baketu.o: gfx/baketu/tiles.2bpp.hz
file/bland.o: gfx/bland/icon.2bpp
file/bland.o: gfx/bland/sprites.2bpp.hz
file/cannon.o: gfx/cannon/icon.2bpp
file/cannon.o: gfx/cannon/tiles.2bpp.hz
file/dentaku.o: gfx/dentaku/icon.2bpp
file/drive.o: gfx/drive/icon.2bpp
file/iconedit.o: gfx/iconedit/icon.2bpp
file/iconsend.o: gfx/iconsend/icons.2bpp.hz
file/kissmon.o: gfx/kissmon/icon.2bpp
file/kissmon.o: gfx/kissmon/moncroc.2bpp
file/kissmon.o: gfx/kissmon/monwolf1.2bpp
file/kissmon.o: gfx/kissmon/monpig.2bpp
file/kissmon.o: gfx/kissmon/monrodent.2bpp
file/kissmon.o: gfx/kissmon/monplant.2bpp
file/kissmon.o: gfx/kissmon/monrobo1.2bpp
file/kissmon.o: gfx/kissmon/monknight.2bpp
file/kissmon.o: gfx/kissmon/monocto.2bpp
file/kissmon.o: gfx/kissmon/monbird1.2bpp
file/kissmon.o: gfx/kissmon/monfly.2bpp
file/kissmon.o: gfx/kissmon/monslug.2bpp
file/kissmon.o: gfx/kissmon/mondevil.2bpp
file/kissmon.o: gfx/kissmon/monseal.2bpp
file/kissmon.o: gfx/kissmon/mondora.2bpp
file/kissmon.o: gfx/kissmon/monrobo2.2bpp
file/kissmon.o: gfx/kissmon/monfish1.2bpp
file/kissmon2.o: gfx/kissmon/icon2.2bpp
file/kissmon2.o: gfx/kissmon/shades.2bpp
file/kissmon2.o: gfx/kissmon/grid.2bpp
file/kissmon2.o: gfx/kissmon/cursor.2bpp
file/kissmon2.o: gfx/kissmon/moncroc.2bpp
file/kissmon2.o: gfx/kissmon/monocto.2bpp
file/kissmon2.o: gfx/kissmon/monmouse.2bpp
file/kissmon2.o: gfx/kissmon/monrobo3.2bpp
file/kissmon2.o: gfx/kissmon/monrobo2.2bpp
file/kissmon2.o: gfx/kissmon/mondora.2bpp
file/kissmon2.o: gfx/kissmon/monbird1.2bpp
file/kissmon2.o: gfx/kissmon/monfly.2bpp
file/kissmon2.o: gfx/kissmon/monpoop.2bpp
file/kissmon2.o: gfx/kissmon/monfish2.2bpp
file/kissmon2.o: gfx/kissmon/monghost.2bpp
file/kissmon2.o: gfx/kissmon/monwolf2.2bpp
file/kissmon2.o: gfx/kissmon/monbird2.2bpp
file/kissmon2.o: gfx/kissmon/monbird3.2bpp
file/kissmon2.o: gfx/kissmon/monwhale.2bpp
file/kissmon2.o: gfx/kissmon/monpig.2bpp
file/koura1.o: gfx/puzzle/koura-1.2bpp.hz
file/koura2.o: gfx/puzzle/koura-2.2bpp.hz
file/koura3.o: gfx/puzzle/koura-3.2bpp.hz
file/magnets.o: gfx/magnets/icon.2bpp
file/mogura.o: gfx/mogura/icon.2bpp
file/puzzle.o: gfx/puzzle/icon.2bpp
file/puzzle.o: gfx/puzzle/arrow.2bpp
file/puzzle.o: gfx/puzzle/hand.2bpp
file/puzzle.o: gfx/puzzle/tile.2bpp
file/puzzle.o: gfx/puzzle/boxes.2bpp.hz
file/puzzle.o: gfx/puzzle/numbers.2bpp.hz
file/roulette.o: gfx/roulette/icon.2bpp
file/samegame.o: gfx/samegame/icon.2bpp
file/samegame.o: gfx/samegame/tiles.2bpp.hz
file/sezaki.o: gfx/mogura/sezaki.2bpp.hz
file/shot.o: gfx/shot/icon.2bpp
file/simula1.o: gfx/icon/simula1.2bpp
file/slot.o: gfx/slot/icon.2bpp
file/soundtst.o: gfx/soundtst/icon.2bpp
file/sw_data.o: gfx/sw_timer/digits.2bpp.hz
file/sw_timer.o: gfx/sw_timer/icon.2bpp
