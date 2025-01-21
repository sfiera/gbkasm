SECTION "Fragment", ROM0[$0]

    INCBIN "sw_timer/lcd.2bpp"

ASSERT SIZEOF("Fragment") <= 2048
