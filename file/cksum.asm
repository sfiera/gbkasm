; CKSUM -- Calculate CRC-32 checksum
;
; Lists installed GBKiss files in a selectable menu.
; Shows info for selected files, including a CRC-32 sum.

INCLUDE "charmap.inc"
INCLUDE "hardware.inc"
INCLUDE "macro.inc"
INCLUDE "trap.inc"
INCLUDE "file/common.inc"

DEF CRC_POLY_0 EQU $04
DEF CRC_POLY_1 EQU $c1
DEF CRC_POLY_2 EQU $1d
DEF CRC_POLY_3 EQU $b7

DEF PAGE_SIZE   EQU 10
DEF PAGE_MAX    EQU 120
DEF PAGE_COUNT  EQU PAGE_MAX / PAGE_SIZE
DEF PAGE_PREV   EQU PAGE_SIZE
DEF PAGE_NEXT   EQU PAGE_PREV + 1

MACRO ld2
    ld \1, (\2 << 8) | \3
ENDM

SECTION "GBKiss File", ROM0[$0]

Header::
    dw SIZEOF(SECTION(Header))
    db FILE_EXEC | FILE_HIST | FILE_ICON | FILE_2BPP
    db CART_ANY      ; where file can run
    db .end - @ - 1  ; length of variable parts of header
    db $00           ; owner code
.title
    dk "CKSUM"
.icon
    INCBIN "gfx/cksum/icon.2bpp"
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
    ; Set up stack.
    ld sp, $e000

    ; Initialize bitmap drawing mode with boxed 14x16 screen.
    ld a, %11000100
    ld2 bc, 1, 3
    ld2 de, 16, 14
    ld h, $04
    trap DrawInit

    ; Initialize CRC calculation table.
    callx InitCRC

    ; Set up menu variables
    xor a
    ld hl, VarPageIndex
    ld [hl+], a  ; [VarPageIndex] = 0
    ld [hl+], a  ; [VarPageStart] = 0
    ld [hl], a   ; [VarMenuPos] = 0

    ; Loop until ExitToMenu is called.
.loop
    pushx .loop
    ; fall through


; Run file menu for current page of files.
Menu::
    ; Clear screen
    ld a, $0c
    trap DrawCtrlChar

    ; Loop over files in the page, drawing each title.
    ld a, 0
.nextFile
    push af
    ld h, 1
    ld l, a
    trap DrawAt
    pop af

    push af
    ld hl, VarPageStart
    add [hl]
    ld hl, VarFile
    ld e, a
    trap $71
    callx DrawTitle
    pop af

    inc a
    cp PAGE_SIZE
    jr nz, .nextFile

    ; Draw prev/next page strings at bottom of list.
    ld2 de, 1, PAGE_PREV
    ldx hl, PrevNextPageStrings
    trap DrawStringList

    ; Draw page number at bottom of page.
    ; Index is 0-based but page number is 1-based.
    ld2 hl, 5, 13
    trap DrawAt
    ld a, [VarPageIndex]
    inc a
    ld d, $00
    ld e, a
    callx DrawInt
    ldx hl, PageMaxString
    trap DrawString

    ; Run menu selection from the user and act on selection.
    ld a, [VarMenuPos]
    ldx de, MenuConfig
    trap InputCursorMenu
    jr c, Exit
    ld [VarMenuPos], a
    cp PAGE_SIZE
    jr z, PrevPage   ; if (a == 12) PrevPage()
    jr nc, NextPage  ; if (a > 12) NextPage()

    ld hl, VarPageStart
    add [hl]
    jr ShowInfo      ; else ShowInfo(a + [VarPageStart])


MenuConfig::
    db PAGE_SIZE + 2  ; item count
    db 0, 0           ; initial position
    db "> "           ; cursor characters
    dw 0              ; update callback

PrevNextPageStrings:
    dk "PREV PAGE\0"
    dk "NEXT PAGE\0"
    db 0

PageMaxString:
    dk "/{u:PAGE_COUNT}\0"


Exit::
    trap ExitToMenu


PrevPage::
    ld b, 1
    jr AdjustPageIndex

NextPage::
    ld b, PAGE_COUNT - 1
    ; fall through

AdjustPageIndex::
    ld hl, VarPageIndex
    ld a, [hl]
    sub b
    jr nc, .setPageStart

    add PAGE_COUNT

.setPageStart
    ld [hl], a

    ; Multiply page index by 10 (PAGE_SIZE)
    add a
    add a
    add [hl]
    add a
    inc hl
    ld [hl], a  ; [VarPageStart] = [VarPageIndex] * 10

    ret


; Show info for file at index a.
ShowInfo::
    ld hl, VarFile
    ld e, a
    trap $71

    ; Load base address from start of result.
    ; If there is no file, return now.
    ld hl, VarFile.addr
    ld a, [hl+]
    ld l, a
    ld h, [hl]
    or h
    ret z

    ; Clear window
    push af
    ld a, $0c
    trap DrawCtrlChar
    pop af

    ld2 hl, 1, 1
    trap DrawAt
    callx DrawTitle

    ldx hl, InfoLayout
    trap DrawLayout

    ld2 hl, 3, 3
    trap DrawAt
    ld hl, VarFile.size
    ld a, [hl+]
    ld d, [hl]
    ld e, a
    callx DrawInt

    ld2 hl, 3, 4
    trap DrawAt
    ld a, [VarFile.cart]
    callx DrawHexByte

    ld2 hl, 3, 5
    trap DrawAt
    ld a, [VarFile.owner]
    callx DrawHexByte

    ld2 hl, 3, 6
    trap DrawAt
    ld a, [VarFile.attrs]
    callx DrawAttrs

    ld2 hl, 3, 10
    trap DrawAt
    callx CalcFileCRC
    callx DrawHexLong

    ; Loop until user presses B
.loop
    trap InputButtons
    bit BTN_B_F, a
    jr z, .loop

    ret


InfoLayout:
    dk 1, 3, "S:\0"
    dk 1, 4, "C:\0"
    dk 1, 5, "O:\0"
    dk 1, 6, "A:\0"
    dk 1, 8, "CRC32:\0"
    dk 7, 13, "B:CLOSE\0"
    db -1


; Draw file title from VarFile at pen position.
DrawTitle::
    ldx hl, NoFileString
    ld a, [VarFile.addr]
    ld b, a
    ld a, [VarFile.addr + 1]
    or b
    jr z, .draw

    ld a, [VarFile.attrs]
    ld b, a
    ld a, [VarFile.hSize]

    bit FILE_ICON_F, b
    jr z, .haveIconSize
    sub $60
    bit FILE_2BPP_F, b
    jr z, .haveIconSize
    sub $60

.haveIconSize
    ld de, VarFile.title
    ld hl, VarTmp
    dec a
    ld b, $00
    ld c, a
    trap MemCopy
    ld [hl], "\0"
    ld hl, VarTmp

.draw
    trap DrawString
    ret


NoFileString:
    dk "- EMPTY -\0"


; Draw attributes from VarFile at pen position.
;
; If the attribute is clear, prints “-”.
; If the attribute is set, prints an identifier char:
;
;   x: file is executable (circle)
;   z: file must be installed to zero region (diamond)
;   h: file has embedded history
;
DrawAttrs::
    ld c, a
    ld b, FILE_EXEC
    ldx hl, AttrChars
.nextAttr
    ld a, c
    and b
    ld a, [hl+]
    jr nz, .attrSet
    ld a, "-"
.attrSet
    trap DrawChar
    rr b
    jr nc, .nextAttr
    ret


AttrChars:
    dp "XZH"


; Draw de as a uint16 at pen position.
DrawInt::
    ld hl, VarTmp
    trap StrConvInt

    ; Remove leading whitespace from string
    ld hl, VarTmp
.trimSpace
    ld a, [hl+]
    cp " "
    jr z, .trimSpace

    dec hl
    trap DrawString
    ret


; Draw a as a uint8 in hex at pen position.
DrawHexByte::
    ld d, $00
    ld e, a
    ld hl, VarTmp
    trap StrConvHex
    trap DrawString
    ret


; Draw bcde as a uint32 in hex at pen position.
DrawHexLong::
    push de            ; save de while bc is converted
    ld d, b            ;
    ld e, c            ; copy bc to de
    ld hl, VarTmp      ; ready the first 4 bytes of scratch
    trap StrConvHex    ; output de in hex to first 4 bytes
    pop de             ; return to original de
    ld hl, VarTmp + 4  ; ready the next 4 bytes of scratch
    trap StrConvHex    ; output de in hex to next 4 bytes
    ld hl, VarTmp      ; return to the start of the string
    trap DrawString    ; and draw the whole thing
    ret


; Initializes the CRC32 calculation table.
InitCRC::
    ld l, $00
.nextByte::
    ld b, l
    ld c, $00
    ld d, c
    ld e, c

    ld h, 8
.nextBit::
    rl e
    rl d
    rl c
    rl b
    jr nc, .clear

    ld a, b
    xor CRC_POLY_0
    ld b, a
    ld a, c
    xor CRC_POLY_1
    ld c, a
    ld a, d
    xor CRC_POLY_2
    ld d, a
    ld a, e
    xor CRC_POLY_3
    ld e, a

.clear::
    dec h
    jr nz, .nextBit

    ld h, HIGH(VarCRC32Table)
    ld [hl], b
    inc h
    ld [hl], c
    inc h
    ld [hl], d
    inc h
    ld [hl], e

    inc l
    jr nz, .nextByte

    ret


; Checksums an entire file that has been opened to VarFile.
;
;   bcde [inout]: CRC-32 checksum of file content
;
CalcFileCRC::
    ; Zero out the initial value of the checksum in bcde.
    xor a
    ld b, a
    ld c, a
    ld d, a
    ld e, a

    ; Load the file’s address in CRAM space to hl.
    ; This is the main input to the ReadFile trap.
    ld hl, VarFile.addr
    ld a, [hl+]
    ld h, [hl]
    ld l, a

    ; Read the upper byte of the file’s size.
    ; This is the number of 256-byte blocks to checksum.
    ; If zero, skip the loop over 256-byte blocks.
    ld a, [VarFile.size + 1]
    or a
    jr z, .remainder

    ; Read and sum the next 256 bytes in the file.
.next256
    push af
    push hl

    push bc
    push de
    ld bc, $0100
    ld d, h
    ld e, l
    ld hl, VarTmp
    trap FileRead
    pop de
    pop bc

    xor a
    ld hl, VarTmp
    callx AppendCRCBlock

    pop hl
    pop af
    inc h
    dec a
    jr nz, .next256

    ; Read and sum the remaining bytes in the file.
    ; If the size of the file is evenly divisible by 256,
    ; skip this section as there are no remaining bytes.
.remainder
    ld a, [VarFile.size]
    or a
    jr z, .appendLength

    push bc
    push de
    ld b, 0
    ld c, a
    ld d, h
    ld e, l
    ld hl, VarTmp
    trap FileRead
    pop de
    pop bc

    ld a, [VarFile.size]
    ld hl, VarTmp
    callx AppendCRCBlock

    ; Append the length of the file and calculate the sum.
    ; This is common practice for CRC32 file checksums.
    ; The sum uses little-endian order, with no trailing zeroes,
    ; so the value in memory can be used directly
    ; but it’s necessary to check if 1 or 2 bytes is needed.
.appendLength
    ld hl, VarFile.size + 1
    ld a, [hl-]
    or a
    ld a, 2
    jr nz, .largeFile

    dec a

.largeFile
    callx AppendCRCBlock

    ; fall through


; Finalizes CRC-32 calculation.
;
;   bcde [inout]: CRC-32 checksum in progress
;
FinishCRC::
    ld a, b
    cpl
    ld b, a
    ld a, c
    cpl
    ld c, a
    ld a, d
    cpl
    ld d, a
    ld a, e
    cpl
    ld e, a
    ret


; Appends a sequence of bytes to CRC-32 calculation.
;
;   a [in]: number of bytes to read ($00 for 256)
;   hl [inout]: start of address range. Advanced by a.
;   bcde [inout]: CRC-32 checksum in progress
;
AppendCRCBlock::
    push af
    ld a, [hl+]       ; read next character
    push hl

    ; hl = $c800 | (b ^ a)
    xor b
    ld h, HIGH(VarCRC32Table)
    ld l, a

    ; b = c ^ [hl]
    ; hl += $0100
    ld a, [hl]
    inc h
    xor c
    ld b, a

    ; c = d ^ [hl]
    ; hl += $0100
    ld a, [hl]
    inc h
    xor d
    ld c, a

    ; d = e ^ [hl]
    ; hl += $0100
    ld a, [hl]
    inc h
    xor e
    ld d, a

    ; e = [hl]
    ld e, [hl]

    pop hl
    pop af
    dec a
    jr nz, AppendCRCBlock
    ret


SECTION "Variables", WRAM0[$c800]

; After InitCRC, this table contains a table for CRC32,
; striped across 4 256-byte regions, most significant first.
VarCRC32Table::
    ds $400

VarTmp::
    ds $100

VarFile::
.addr    dw
.unused  ds 5
.size    dw
.attrs   db
.cart    db
.hSize   db
.owner   db
.title   ds $100

VarPageIndex:
    db
VarPageStart:
    db
VarMenuPos:
    db
