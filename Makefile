MINIGAME = minigame.gb
NECTARIS = nectaris.gb
GBF_ASM = $(wildcard src/file/*.asm)
GBF = $(GBF_ASM:src/file/%.asm=%.gbf)

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

%.gb: src/%.link
	$(RGBLINK) -n $*.sym -m $*.map -o $@ -l $+
	$(RGBFIX) -v -p 255 $@

%.gbf: src/file/%.o
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
compare: $(MINIGAME) $(NECTARIS) $(GBF)
	shasum -c roms.sha1

define NL


endef
$(eval $(subst #,$(NL),$(shell python3 tools/deps.py | tr "\n" "#")))
