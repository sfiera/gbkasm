; HelloWorld -- basic executable example file
;
; Shows the string "Hello, World" in the center of the screen
; then waits for the player to exit by pressing Select

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

SECTION "GBKiss File", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_HIST
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $00           ; owner code
.title
    dk "HelloWorld"
.icon
.end

History:
.points
    dw 1
.author
    dp "sfiera    ", 1
.history
    ds 11
    ds 11
    ds 11
.end


Main::
    ld sp, $e000   ; set up stack
    xor a          ; set all drawing flags off
    trap DrawInit  ; initialize drawing with flags off

    ld hl, $0408            ;
    trap DrawAt             ; move pen to (4, 8)
    ldx hl, HelloWorldText  ; load with relative (ldx) addressing
    trap DrawString         ; draw "Hello, World!" at pen location

.loop
    trap AwaitFrame    ; wait one frame
    trap InputButtons  ; get buttons in register a
    bit BTN_SEL_F, a   ; check if Select pressed
    jr z, .loop        ; if not, loop
    trap ExitToMenu    ; else exit to menu


HelloWorldText:
    dk "Hello, World!\0"
