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

out/%.o: %.asm
	@ mkdir -p $(dir $@)
	$(RGBASM) $(RGBASMFLAGS) -o $@ $<

%.gb:
	$(RGBLINK) -n $*.sym -m $*.map -o $@ -l $+
	$(RGBFIX) -v -p 255 $@

%.gbf:
	$(RGBLINK) -n $*.sym -x -o $@ $<

out/%.frag: out/%.o
	@ mkdir -p $(dir $@)
	$(RGBLINK) -n $*.sym -x -o $@ $<

out/%.2bpp out/%.tilemap: %.png %.flags
	@ mkdir -p $(dir $@)
	$(RGBGFX) @$*.flags -d2 -o out/$*.2bpp -OT $<

out/%.1bpp out/%.tilemap: %.png %.flags
	@ mkdir -p $(dir $@)
	$(RGBGFX) @$*.flags -d1 -o out/$*.1bpp -OT $<

out/%.hz: out/%.frag
	@ mkdir -p $(dir $@)
	tools/compress.py $@ $< $*.hz.orig

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
baketu.gbf: out/src/baketu/baketu.o
biorythm.gbf: out/src/biorythm/biorythm.o
bj.gbf: out/src/bj/bj.o
bland.gbf: out/src/bland/bland.o
cannon.gbf: out/src/cannon/cannon.o
chardump.gbf: out/src/chardump/chardump.o
cksum.gbf: out/src/cksum/cksum.o
del_all.gbf: out/src/del_all/del_all.o
dentaku.gbf: out/src/dentaku/dentaku.o
drive.gbf: out/src/drive/drive.o
family_s.gbf: out/src/family_s/family_s.o
hello_w.gbf: out/src/hello_w/hello_w.o
huxplore.gbf: out/src/huxplore/huxplore.o
iconedit.gbf: out/src/iconedit/iconedit.o
iconsend.gbf: out/src/iconsend/iconsend.o
irtest.gbf: out/src/irtest/irtest.o
kissmon.gbf: out/src/kissmon/kissmon.o
kissmon2.gbf: out/src/kissmon2/kissmon2.o
koura1.gbf: out/src/koura1/koura1.o
koura2.gbf: out/src/koura2/koura2.o
koura3.gbf: out/src/koura3/koura3.o
mag_data.gbf: out/src/mag_data/mag_data.o
magnets.gbf: out/src/magnets/magnets.o
mogura.gbf: out/src/mogura/mogura.o
n5unlock.gbf: out/src/n5unlock/n5unlock.o
passwords.gbf: out/src/passwords/passwords.o
poker.gbf: out/src/poker/poker.o
puzzle.gbf: out/src/puzzle/puzzle.o
roulette.gbf: out/src/roulette/roulette.o
saita.gbf: out/src/saita/saita.o
samegame.gbf: out/src/samegame/samegame.o
sezaki.gbf: out/src/sezaki/sezaki.o
shot.gbf: out/src/shot/shot.o
simula1.gbf: out/src/simula1/simula1.o
slot.gbf: out/src/slot/slot.o
soundtst.gbf: out/src/soundtst/soundtst.o
sramtool.gbf: out/src/sramtool/sramtool.o
sw_data.gbf: out/src/sw_data/sw_data.o
sw_lcd.gbf: out/src/sw_lcd/sw_lcd.o
sw_pop.gbf: out/src/sw_pop/sw_pop.o
sw_timer.gbf: out/src/sw_timer/sw_timer.o
worm.gbf: out/src/worm/worm.o

define NL


endef
$(eval $(subst #,$(NL),$(shell python3 tools/deps.py | tr "\n" "#")))
