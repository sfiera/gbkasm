MINIGAME = minigame.gb
MINIGAME_LINK = $(MINIGAME:%.gb=src/%.link)
NECTARIS = nectaris.gb
NECTARIS_LINK = $(NECTARIS:%.gb=src/%.link)

SYSTEM_ASM = $(wildcard src/system/*.asm)
MINIGAME_ASM = $(wildcard src/minigame/*.asm)
NECTARIS_ASM = $(wildcard src/nectaris/*.asm)
GBF_ASM = $(wildcard src/file/*.asm)
FRAG_ASM = $(wildcard src/frag/*/*.asm)
PNGH = $(wildcard src/gfx/*/*.h.png)
PNGV = $(wildcard src/gfx/*/*.v.png)
PNGF = $(wildcard src/gfx/*/*.f.png)
GFX = $(PNGH:%.h.png=%) $(PNGV:%.v.png=%) $(PNGF:%.f.png=%)
HZ = $(FRAG_ASM:%.asm=%.hz)

SYSTEM_OBJ = $(SYSTEM_ASM:%.asm=%.o)
MINIGAME_OBJ = $(MINIGAME_ASM:%.asm=%.o)
NECTARIS_OBJ = $(NECTARIS_ASM:%.asm=%.o)
GBF_OBJ = $(GBF_ASM:%.asm=%.o)
FRAG_OBJ = $(FRAG_ASM:%.asm=%.o)
ASM = $(SYSTEM_ASM) $(MINIGAME_ASM) $(NECTARIS_ASM) $(GBF_ASM) $(FRAG_ASM)
OBJ = $(SYSTEM_OBJ) $(MINIGAME_OBJ) $(NECTARIS_OBJ) $(GBF_OBJ) $(FRAG_OBJ)
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

$(OBJ): %.o: %.asm
	$(RGBASM) $(RGBASMFLAGS) -M $*.d -o $@ $<

$(MINIGAME): %.gb: $(MINIGAME_LINK) $(MINIGAME_OBJ) $(SYSTEM_OBJ)
ifeq ($(DEBUG),1)
	$(RGBLINK) -n $*.sym -m $*.map -o $@ -l $(MINIGAME_LINK) $(MINIGAME_OBJ) $(SYSTEM_OBJ)
else
	$(RGBLINK) -o $@ -l $(MINIGAME_LINK) $(MINIGAME_OBJ) $(SYSTEM_OBJ)
endif
	$(RGBFIX) -v -p 255 $@

$(NECTARIS): %.gb: $(NECTARIS_LINK) $(NECTARIS_OBJ) $(SYSTEM_OBJ)
ifeq ($(DEBUG),1)
	$(RGBLINK) -n $*.sym -m $*.map -o $@ -l $(NECTARIS_LINK) $(NECTARIS_OBJ) $(SYSTEM_OBJ)
else
	$(RGBLINK) -o $@ -l $(NECTARIS_LINK) $(NECTARIS_OBJ) $(SYSTEM_OBJ)
endif
	$(RGBFIX) -v -p 255 $@

%.gbf: src/file/%.o
ifeq ($(DEBUG),1)
	$(RGBLINK) -n $*.sym -x -o $@ $<
else
	$(RGBLINK) -x -o $@ $<
endif

%.frag: %.o
ifeq ($(DEBUG),1)
	$(RGBLINK) -n $*.sym -x -o $@ $<
else
	$(RGBLINK) -x -o $@ $<
endif

%.2bpp: %.2bpp.h.png
	$(RGBGFX) -d2 -o $@ $<

%.2bpp: %.2bpp.v.png
	$(RGBGFX) --columns -d2 -o $@ $<

%.2bpp %.map: %.2bpp.f.png %.flags
	$(RGBGFX) @$*.flags -d2 -o $*.2bpp $<

%.1bpp: %.1bpp.h.png
	$(RGBGFX) -d1 -o $@ $<

%.hz: %.frag
	tools/compress.py $@ $<

.PHONY: clean
clean:
	find . -name '*.gb' -or \
	       -name '*.gbf' -or \
	       -name '*.frag' -or \
	       -name '*.?bpp' -or \
	       -name '*.hz' -or \
	       -name '*.o' -or \
	       -name '*.d' -or \
	       -name '*.sym' -or \
	       -name '*.map' | xargs rm -f

.PHONY: compare
compare: $(MINIGAME) $(NECTARIS) $(GBF)
	shasum -c roms.sha1

define NL


endef
$(eval $(subst #,$(NL),$(shell python3 tools/deps.py $(OBJ) | tr "\n" "#")))
