SECTION "Fragment", ROM0[$0]

    INCBIN "sw_timer/pop.2bpp"

ASSERT SIZEOF("Fragment") <= 2048
