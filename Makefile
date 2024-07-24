GB_ASM = $(wildcard *.asm)
GBF_ASM = $(wildcard file/*.asm)
FRAG_ASM = $(wildcard frag/*/*.asm)
PNG = $(wildcard gfx/*.png gfx/*/*.png)
GFX = $(PNG:%.png=%)
HZ = $(FRAG_ASM:%.asm=%.hz)

ASM = $(GB_ASM) $(GBF_ASM) $(FRAG_ASM)
OBJ = $(ASM:%.asm=%.o)
DEP = $(ASM:%.asm=%.d)
SYM = $(ASM:%.asm=%.sym)
MAP = $(ASM:%.asm=%.map)
FRAG = $(FRAG_ASM:%.asm=%.frag)
GBF = $(GBF_ASM:%.asm=%.gbf)
GB = $(GB_ASM:%.asm=%.gb)

RGBASM=rgbasm -Wall -Werror
RGBLINK=rgblink
RGBFIX=rgbfix
RGBGFX=rgbgfx

.SECONDARY:

.PHONY: all
all: $(GB) $(GBF)

%.o: %.asm
	$(RGBASM) -M $*.d -o $@ $<

%.gb: %.o
	$(RGBLINK) -n $*.sym -m $*.map -o $@ $<
	$(RGBFIX) -v -p 255 $@

%.gbf: %.o
	$(RGBLINK) -n $*.sym -x -o $@ $<

%.frag: %.o
	$(RGBLINK) -n $*.sym -x -o $@ $<

%.2bpp: %.2bpp.png %.2bpp.flags
	$(RGBGFX) -d2 -o $@ $< @$*.2bpp.flags

%.1bpp: %.1bpp.png %.1bpp.flags
	$(RGBGFX) -d1 -o $@ $< @$*.1bpp.flags

%.hz: %.frag
	misc/compress.py $@ $<

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

.PHONY: check
check: $(GB) $(GBF)
	shasum -c roms.sha1

-include $(DEP)
gbkiss.o: | $(GBF) $(HZ)
$(FRAG_ASM:%.asm=%.o): %.o: | $(GFX)
$(GBF_ASM:%.asm=%.o): %.o: | $(GFX) $(HZ)
