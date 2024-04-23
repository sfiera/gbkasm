; Disassembly of "gbkiss.gb"

def kFileHasIcon2bpp     equ %00011000  ; extra $c0 bytes after title
def kFileHasIcon1bpp     equ %00010000  ; extra $60 bytes after title
def kFileMarkerDiamond   equ %00000110  ; executable
def kFileMarkerCircle    equ %00000100  ; executable
def kFileMarkerTriangle  equ %00000000  ; non-executable
def kFileHasTransfers    equ %00000001  ; extra $2e bytes after title/icon
