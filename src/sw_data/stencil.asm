SECTION "Fragment", ROM0[$0]

    INCBIN "sw_data/stencil.2bpp"

ASSERT SIZEOF("Fragment") <= 2048
