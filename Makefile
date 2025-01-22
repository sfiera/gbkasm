OUT = minigame.gb \
	  nectaris.gb \
	  cksum.gbf \
	  family_s.gbf \
	  hello_w.gbf \
	  huxplore.gbf \
	  irtest.gbf \
	  kissmon2.gbf \
	  n5unlock.gbf \
	  passwords.gbf \
	  saita.gbf \
	  simula1.gbf \
	  sw_lcd.gbf \
	  sw_pop.gbf


RGBASM  ?= rgbasm
RGBLINK ?= rgblink
RGBFIX  ?= rgbfix
RGBGFX  ?= rgbgfx

RGBASMFLAGS ?= -Wall -Werror -Isrc

ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

.SECONDARY:

.PHONY: all
all: compare

%.o: %.asm
	$(RGBASM) $(RGBASMFLAGS) -o $@ $<

%.gb:
	$(RGBLINK) -n $*.sym -m $*.map -o $@ -l $+
	$(RGBFIX) -v -p 255 $@

%.gbf:
	$(RGBLINK) -n $*.sym -x -o $@ $<

%.frag: %.o
	$(RGBLINK) -n $*.sym -x -o $@ $<

%.2bpp %.tilemap: %.png %.flags
	$(RGBGFX) @$*.flags -d2 -o $*.2bpp $<

%.1bpp %.tilemap: %.png %.flags
	$(RGBGFX) @$*.flags -d1 -o $*.1bpp $<

%.hz: %.frag
	tools/compress.py $@ $<

.PHONY: clean
clean:
	find . -name '*.gb' -or \
	       -name '*.gbf' -or \
	       -name '*.frag' -or \
	       -name '*.?bpp' -or \
	       -name '*.tilemap' -or \
	       -name '*.hz' -or \
	       -name '*.o' -or \
	       -name '*.sym' -or \
	       -name '*.map' | xargs rm -f

.PHONY: compare
compare: $(OUT)
	shasum -c roms.sha1

minigame.gb: src/minigame/minigame.link
nectaris.gb: src/nectaris/nectaris.link
baketu.gbf: src/baketu/baketu.o
biorythm.gbf: src/biorythm/biorythm.o
bj.gbf: src/bj/bj.o
bland.gbf: src/bland/bland.o
cannon.gbf: src/cannon/cannon.o
chardump.gbf: src/chardump/chardump.o
cksum.gbf: src/cksum/cksum.o
del_all.gbf: src/del_all/del_all.o
dentaku.gbf: src/dentaku/dentaku.o
drive.gbf: src/drive/drive.o
family_s.gbf: src/family_s/family_s.o
hello_w.gbf: src/hello_w/hello_w.o
huxplore.gbf: src/huxplore/huxplore.o
iconedit.gbf: src/iconedit/iconedit.o
iconsend.gbf: src/iconsend/iconsend.o
irtest.gbf: src/irtest/irtest.o
kissmon.gbf: src/kissmon/kissmon.o
kissmon2.gbf: src/kissmon2/kissmon2.o
koura1.gbf: src/koura1/koura1.o
koura2.gbf: src/koura2/koura2.o
koura3.gbf: src/koura3/koura3.o
mag_data.gbf: src/mag_data/mag_data.o
magnets.gbf: src/magnets/magnets.o
mogura.gbf: src/mogura/mogura.o
n5unlock.gbf: src/n5unlock/n5unlock.o
passwords.gbf: src/passwords/passwords.o
poker.gbf: src/poker/poker.o
puzzle.gbf: src/puzzle/puzzle.o
roulette.gbf: src/roulette/roulette.o
saita.gbf: src/saita/saita.o
samegame.gbf: src/samegame/samegame.o
sezaki.gbf: src/sezaki/sezaki.o
shot.gbf: src/shot/shot.o
simula1.gbf: src/simula1/simula1.o
slot.gbf: src/slot/slot.o
soundtst.gbf: src/soundtst/soundtst.o
sramtool.gbf: src/sramtool/sramtool.o
sw_data.gbf: src/sw_data/sw_data.o
sw_lcd.gbf: src/sw_lcd/sw_lcd.o
sw_pop.gbf: src/sw_pop/sw_pop.o
sw_timer.gbf: src/sw_timer/sw_timer.o
worm.gbf: src/worm/worm.o

define NL


endef
$(eval $(subst #,$(NL),$(shell python3 tools/deps.py | tr "\n" "#")))
