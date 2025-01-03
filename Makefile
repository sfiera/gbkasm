GB_ASM = $(wildcard src/*.asm)
GBF_ASM = $(wildcard src/file/*.asm)
FRAG_ASM = $(wildcard src/frag/*/*.asm)
PNGH = $(wildcard src/gfx/*/*.h.png)
PNGV = $(wildcard src/gfx/*/*.v.png)
PNGF = $(wildcard src/gfx/*/*.f.png)
GFX = $(PNGH:%.h.png=%) $(PNGV:%.v.png=%) $(PNGF:%.f.png=%)
HZ = $(FRAG_ASM:%.asm=%.hz)

GB_OBJ = $(GB_ASM:%.asm=%.o)
GBF_OBJ = $(GBF_ASM:%.asm=%.o)
FRAG_OBJ = $(FRAG_ASM:%.asm=%.o)
ASM = $(GB_ASM) $(GBF_ASM) $(FRAG_ASM)
OBJ = $(GB_OBJ) $(GBF_OBJ) $(FRAG_OBJ)
DEP = $(ASM:%.asm=%.d)
SYM = $(ASM:%.asm=%.sym)
MAP = $(ASM:%.asm=%.map)
FRAG = $(FRAG_ASM:%.asm=%.frag)
GBF = $(GBF_ASM:src/file/%.asm=%.gbf)
GB = gbkiss.gb

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

$(GB): %.gb: $(GB_OBJ)
ifeq ($(DEBUG),1)
	$(RGBLINK) -n $*.sym -m $*.map -o $@ $+
else
	$(RGBLINK) -o $@ $+
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
compare: $(GB) $(GBF)
	shasum -c roms.sha1

define NL


endef
$(eval $(subst #,$(NL),$(shell python3 tools/deps.py $(OBJ) | tr "\n" "#")))
