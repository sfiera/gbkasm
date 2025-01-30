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

RGBASMFLAGS ?= -Wall -Werror

ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

.SECONDARY:

.PHONY: all
all: compare

out/%.o: src/%.asm
	@ echo deps: $+
	@ mkdir -p $(dir $@)
	$(RGBASM) $(RGBASMFLAGS) -o $@ $<

%.gb:
	$(RGBLINK) -n $*.sym -m $*.map -o $@ -l $+
	$(RGBFIX) -v -p 255 $@

%.gbf:
	$(RGBLINK) -n $*.sym -x -o $@ $<

out/%.frag: out/%.o
	@ mkdir -p $(dir $@)
	$(RGBLINK) -n out/$*.sym -x -o $@ $<

out/%.2bpp out/%.tilemap: src/%.png src/%.flags
	@ mkdir -p $(dir $@)
	$(RGBGFX) @src/$*.flags -d2 -o out/$*.2bpp -OT $<

out/%.1bpp out/%.tilemap: src/%.png src/%.flags
	@ mkdir -p $(dir $@)
	$(RGBGFX) @src/$*.flags -d1 -o out/$*.1bpp -OT $<

out/%.hz: out/%.frag
	@ mkdir -p $(dir $@)
	tools/compress.py $@ $< src/$*.hz.orig

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
baketu.gbf: out/baketu/baketu.o
biorythm.gbf: out/biorythm/biorythm.o
bj.gbf: out/bj/bj.o
bland.gbf: out/bland/bland.o
cannon.gbf: out/cannon/cannon.o
chardump.gbf: out/chardump/chardump.o
cksum.gbf: out/cksum/cksum.o
del_all.gbf: out/del_all/del_all.o
dentaku.gbf: out/dentaku/dentaku.o
drive.gbf: out/drive/drive.o
family_s.gbf: out/family_s/family_s.o
hello_w.gbf: out/hello_w/hello_w.o
huxplore.gbf: out/huxplore/huxplore.o
iconedit.gbf: out/iconedit/iconedit.o
iconsend.gbf: out/iconsend/iconsend.o
irtest.gbf: out/irtest/irtest.o
kissmon.gbf: out/kissmon/kissmon.o
kissmon2.gbf: out/kissmon2/kissmon2.o
koura1.gbf: out/koura1/koura1.o
koura2.gbf: out/koura2/koura2.o
koura3.gbf: out/koura3/koura3.o
mag_data.gbf: out/mag_data/mag_data.o
magnets.gbf: out/magnets/magnets.o
mogura.gbf: out/mogura/mogura.o
n5unlock.gbf: out/n5unlock/n5unlock.o
passwords.gbf: out/passwords/passwords.o
poker.gbf: out/poker/poker.o
puzzle.gbf: out/puzzle/puzzle.o
roulette.gbf: out/roulette/roulette.o
saita.gbf: out/saita/saita.o
samegame.gbf: out/samegame/samegame.o
sezaki.gbf: out/sezaki/sezaki.o
shot.gbf: out/shot/shot.o
simula1.gbf: out/simula1/simula1.o
slot.gbf: out/slot/slot.o
soundtst.gbf: out/soundtst/soundtst.o
sramtool.gbf: out/sramtool/sramtool.o
sw_data.gbf: out/sw_data/sw_data.o
sw_lcd.gbf: out/sw_lcd/sw_lcd.o
sw_pop.gbf: out/sw_pop/sw_pop.o
sw_timer.gbf: out/sw_timer/sw_timer.o
worm.gbf: out/worm/worm.o

define NL


endef
$(eval $(subst #,$(NL),$(shell python3 tools/deps.py | tr "\n" "#")))
