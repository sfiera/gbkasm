SECTION "Fragment", ROM0[$0]

    INCBIN "sw_lcd/lcd.2bpp"

ASSERT SIZEOF("Fragment") <= 2048
