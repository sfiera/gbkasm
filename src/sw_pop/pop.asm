SECTION "Fragment", ROM0[$0]

    INCBIN "out/sw_pop/pop.2bpp"

ASSERT SIZEOF("Fragment") <= 2048
