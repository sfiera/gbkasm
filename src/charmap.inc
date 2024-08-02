; Disassembly of "gbkiss.gb"

NEWCHARMAP PlainText

NEWCHARMAP Diacritics
CHARMAP "«", $00
CHARMAP "»", $00

NEWCHARMAP RichKatakanaText
CHARMAP "»", $0e
CHARMAP "«", $0f

NEWCHARMAP RichHiraganaText, RichKatakanaText

MACRO HALFCHARMAP
    SETCHARMAP PlainText
    CHARMAP \1, \2
    SETCHARMAP RichKatakanaText
    CHARMAP \1, \3
    SETCHARMAP RichHiraganaText
    CHARMAP \1, \3
    SETCHARMAP Diacritics
    CHARMAP \1, $00
ENDM

MACRO FULLCHARMAP
    HALFCHARMAP \1, \3, \4
    HALFCHARMAP \2, \3, \4
ENDM

MACRO KANACHARMAP
    SETCHARMAP PlainText
    CHARMAP \1, \3
    CHARMAP \2, \3 + $50
    SETCHARMAP RichKatakanaText
    CHARMAP \1, $0f
    CHARMAP \2, \4
    SETCHARMAP RichHiraganaText
    CHARMAP \1, \4
    CHARMAP \2, $0e
    SETCHARMAP Diacritics
    CHARMAP \1, \5
    CHARMAP \2, \5
ENDM

    HALFCHARMAP "\0", $00, $00
    HALFCHARMAP "→", $01, $01
    HALFCHARMAP "←", $02, $02
    HALFCHARMAP "↓", $03, $03
    HALFCHARMAP "↑", $04, $04
    HALFCHARMAP "\r", $0d, $0d
    FULLCHARMAP " ", "　", $20, $20
    FULLCHARMAP "!", "！", $21, $21
    FULLCHARMAP "\"", "＂", $22, $22
    FULLCHARMAP "#", "＃", $23, $23
    FULLCHARMAP "$", "＄", $24, $24
    FULLCHARMAP "%", "％", $25, $25
    FULLCHARMAP "&", "＆", $26, $26
    FULLCHARMAP "'", "＇", $27, $27
    FULLCHARMAP "(", "（", $28, $28
    FULLCHARMAP ")", "）", $29, $29
    FULLCHARMAP "*", "＊", $2a, $2a
    FULLCHARMAP "+", "＋", $2b, $2b
    FULLCHARMAP ",", "，", $2c, $2c
    FULLCHARMAP "-", "－", $2d, $2d
    FULLCHARMAP ".", "．", $2e, $2e
    FULLCHARMAP "/", "／", $2f, $2f

    FULLCHARMAP "0", "０", $30, $30
    FULLCHARMAP "1", "１", $31, $31
    FULLCHARMAP "2", "２", $32, $32
    FULLCHARMAP "3", "３", $33, $33
    FULLCHARMAP "4", "４", $34, $34
    FULLCHARMAP "5", "５", $35, $35
    FULLCHARMAP "6", "６", $36, $36
    FULLCHARMAP "7", "７", $37, $37
    FULLCHARMAP "8", "８", $38, $38
    FULLCHARMAP "9", "９", $39, $39

    FULLCHARMAP ":", "：", $3a, $3a
    FULLCHARMAP ";", "；", $3b, $3b
    FULLCHARMAP "<", "＜", $3c, $3c
    FULLCHARMAP "=", "＝", $3d, $3d
    FULLCHARMAP ">", "＞", $3e, $3e
    FULLCHARMAP "?", "？", $3f, $3f
    FULLCHARMAP "@", "＠", $40, $40

    FULLCHARMAP "A", "Ａ", $41, $41
    FULLCHARMAP "B", "Ｂ", $42, $42
    FULLCHARMAP "C", "Ｃ", $43, $43
    FULLCHARMAP "D", "Ｄ", $44, $44
    FULLCHARMAP "E", "Ｅ", $45, $45
    FULLCHARMAP "F", "Ｆ", $46, $46
    FULLCHARMAP "G", "Ｇ", $47, $47
    FULLCHARMAP "H", "Ｈ", $48, $48
    FULLCHARMAP "I", "Ｉ", $49, $49
    FULLCHARMAP "J", "Ｊ", $4a, $4a
    FULLCHARMAP "K", "Ｋ", $4b, $4b
    FULLCHARMAP "L", "Ｌ", $4c, $4c
    FULLCHARMAP "M", "Ｍ", $4d, $4d
    FULLCHARMAP "N", "Ｎ", $4e, $4e
    FULLCHARMAP "O", "Ｏ", $4f, $4f
    FULLCHARMAP "P", "Ｐ", $50, $50
    FULLCHARMAP "Q", "Ｑ", $51, $51
    FULLCHARMAP "R", "Ｒ", $52, $52
    FULLCHARMAP "S", "Ｓ", $53, $53
    FULLCHARMAP "T", "Ｔ", $54, $54
    FULLCHARMAP "U", "Ｕ", $55, $55
    FULLCHARMAP "V", "Ｖ", $56, $56
    FULLCHARMAP "W", "Ｗ", $57, $57
    FULLCHARMAP "X", "Ｘ", $58, $58
    FULLCHARMAP "Y", "Ｙ", $59, $59
    FULLCHARMAP "Z", "Ｚ", $5a, $5a

    FULLCHARMAP "[", "［", $5b, $5b
    FULLCHARMAP "¥", "￥", $5c, $5c
    FULLCHARMAP "]", "］", $5d, $5d
    FULLCHARMAP "^", "＾", $5e, $5e
    FULLCHARMAP "_", "＿", $5f, $5f

    FULLCHARMAP "a", "ａ", $01, $61
    FULLCHARMAP "b", "ｂ", $02, $62
    FULLCHARMAP "c", "ｃ", $03, $63
    FULLCHARMAP "d", "ｄ", $04, $64
    FULLCHARMAP "e", "ｅ", $05, $65
    FULLCHARMAP "f", "ｆ", $06, $66
    FULLCHARMAP "g", "ｇ", $07, $67
    FULLCHARMAP "h", "ｈ", $08, $68
    FULLCHARMAP "i", "ｉ", $09, $69
    FULLCHARMAP "j", "ｊ", $0a, $6a
    FULLCHARMAP "k", "ｋ", $0b, $6b
    FULLCHARMAP "l", "ｌ", $0c, $6c
    FULLCHARMAP "m", "ｍ", $0d, $6d
    FULLCHARMAP "n", "ｎ", $0e, $6e
    FULLCHARMAP "o", "ｏ", $0f, $6f
    FULLCHARMAP "p", "ｐ", $10, $70
    FULLCHARMAP "q", "ｑ", $11, $71
    FULLCHARMAP "r", "ｒ", $12, $72
    FULLCHARMAP "s", "ｓ", $13, $73
    FULLCHARMAP "t", "ｔ", $14, $74
    FULLCHARMAP "u", "ｕ", $15, $75
    FULLCHARMAP "v", "ｖ", $16, $76
    FULLCHARMAP "w", "ｗ", $17, $77
    FULLCHARMAP "x", "ｘ", $18, $78
    FULLCHARMAP "y", "ｙ", $19, $79
    FULLCHARMAP "z", "ｚ", $1a, $7a

    FULLCHARMAP "｢", "「", $1b, $a2
    FULLCHARMAP "|", "｜", $1c, $7c
    FULLCHARMAP "｣", "」", $1d, $a3
    FULLCHARMAP "¯", "￣", $1e, $7e
    FULLCHARMAP "\\", "＼", $1f, $7f

    HALFCHARMAP "、", $2c, $a4
    HALFCHARMAP "ー", $2d, $b0
    HALFCHARMAP "。", $2e, $a1

    KANACHARMAP "を", "ヲ", $60, $a6, $00
    KANACHARMAP "あ", "ア", $61, $b1, $00
    KANACHARMAP "い", "イ", $62, $b2, $00
    KANACHARMAP "う", "ウ", $63, $b3, $00
    KANACHARMAP "え", "エ", $64, $b4, $00
    KANACHARMAP "お", "オ", $65, $b5, $00
    KANACHARMAP "か", "カ", $66, $b6, $00
    KANACHARMAP "き", "キ", $67, $b7, $00
    KANACHARMAP "く", "ク", $68, $b8, $00
    KANACHARMAP "け", "ケ", $69, $b9, $00
    KANACHARMAP "こ", "コ", $6a, $ba, $00
    KANACHARMAP "さ", "サ", $6b, $bb, $00
    KANACHARMAP "し", "シ", $6c, $bc, $00
    KANACHARMAP "す", "ス", $6d, $bd, $00
    KANACHARMAP "せ", "セ", $6e, $be, $00
    KANACHARMAP "そ", "ソ", $6f, $bf, $00
    KANACHARMAP "た", "タ", $70, $c0, $00
    KANACHARMAP "ち", "チ", $71, $c1, $00
    KANACHARMAP "つ", "ツ", $72, $c2, $00
    KANACHARMAP "て", "テ", $73, $c3, $00
    KANACHARMAP "と", "ト", $74, $c4, $00
    KANACHARMAP "な", "ナ", $75, $c5, $00
    KANACHARMAP "に", "ニ", $76, $c6, $00
    KANACHARMAP "ぬ", "ヌ", $77, $c7, $00
    KANACHARMAP "ね", "ネ", $78, $c8, $00
    KANACHARMAP "の", "ノ", $79, $c9, $00
    KANACHARMAP "は", "ハ", $7a, $ca, $00
    KANACHARMAP "ひ", "ヒ", $7b, $cb, $00
    KANACHARMAP "ふ", "フ", $7c, $cc, $00
    KANACHARMAP "へ", "ヘ", $7d, $cd, $00
    KANACHARMAP "ほ", "ホ", $7e, $ce, $00
    KANACHARMAP "ま", "マ", $7f, $cf, $00
    KANACHARMAP "み", "ミ", $80, $d0, $00
    KANACHARMAP "む", "ム", $81, $d1, $00
    KANACHARMAP "め", "メ", $82, $d2, $00
    KANACHARMAP "も", "モ", $83, $d3, $00
    KANACHARMAP "や", "ヤ", $84, $d4, $00
    KANACHARMAP "ゆ", "ユ", $85, $d5, $00
    KANACHARMAP "よ", "ヨ", $86, $d6, $00
    KANACHARMAP "ら", "ラ", $87, $d7, $00
    KANACHARMAP "り", "リ", $88, $d8, $00
    KANACHARMAP "る", "ル", $89, $d9, $00
    KANACHARMAP "れ", "レ", $8a, $da, $00
    KANACHARMAP "ろ", "ロ", $8b, $db, $00
    KANACHARMAP "わ", "ワ", $8c, $dc, $00
    KANACHARMAP "ん", "ン", $8d, $dd, $00
    KANACHARMAP "が", "ガ", $8e, $b6, $de
    KANACHARMAP "ぎ", "ギ", $8f, $b7, $de
    KANACHARMAP "ぐ", "グ", $90, $b8, $de
    KANACHARMAP "げ", "ゲ", $91, $b9, $de
    KANACHARMAP "ご", "ゴ", $92, $ba, $de
    KANACHARMAP "ざ", "ザ", $93, $bb, $de
    KANACHARMAP "じ", "ジ", $94, $bc, $de
    KANACHARMAP "ず", "ズ", $95, $bd, $de
    KANACHARMAP "ぜ", "ゼ", $96, $be, $de
    KANACHARMAP "ぞ", "ゾ", $97, $bf, $de
    KANACHARMAP "だ", "ダ", $98, $c0, $de
    KANACHARMAP "ぢ", "ヂ", $99, $c1, $de
    KANACHARMAP "づ", "ヅ", $9a, $c2, $de
    KANACHARMAP "で", "デ", $9b, $c3, $de
    KANACHARMAP "ど", "ド", $9c, $c4, $de
    KANACHARMAP "ば", "バ", $9d, $ca, $de
    KANACHARMAP "び", "ビ", $9e, $cb, $de
    KANACHARMAP "ぶ", "ブ", $9f, $cc, $de
    KANACHARMAP "べ", "ベ", $a0, $cd, $de
    KANACHARMAP "ぼ", "ボ", $a1, $ce, $de
    KANACHARMAP "ぱ", "パ", $a2, $ca, $df
    KANACHARMAP "ぴ", "ピ", $a3, $cb, $df
    KANACHARMAP "ぷ", "プ", $a4, $cc, $df
    KANACHARMAP "ぺ", "ペ", $a5, $cd, $df
    KANACHARMAP "ぽ", "ポ", $a6, $ce, $df
    KANACHARMAP "ぁ", "ァ", $a7, $a7, $00
    KANACHARMAP "ぃ", "ィ", $a8, $a8, $00
    KANACHARMAP "ぅ", "ゥ", $a9, $a9, $00
    KANACHARMAP "ぇ", "ェ", $aa, $aa, $00
    KANACHARMAP "ぉ", "ォ", $ab, $ab, $00
    KANACHARMAP "ゃ", "ャ", $ac, $ac, $00
    KANACHARMAP "ゅ", "ュ", $ad, $ad, $00
    KANACHARMAP "ょ", "ョ", $ae, $ae, $00
    KANACHARMAP "っ", "ッ", $af, $af, $00

SETCHARMAP RichKatakanaText

MACRO drich
    PUSHC
    SETCHARMAP \1
    SHIFT
    REPT _NARG
        PUSHC
        IF STRSUB("\1", 1, 1) == "\"" && STRSUB("\1", -1) == "\""
            FOR _DX_I, 1, CHARLEN(\1) + 1
                IF CHARSUB(\1, _DX_I) == $0f
                    db $0f
                    SETCHARMAP RichHiraganaText
                ELIF CHARSUB(\1, _DX_I) == $0e
                    db $0e
                    SETCHARMAP RichKatakanaText
                ENDC

                IF CHARSUB(\1, _DX_I) != $0f && CHARSUB(\1, _DX_I) != $0e
                    db CHARSUB(\1, _DX_I)
                ENDC

                PUSHC
                SETCHARMAP Diacritics
                IF CHARSUB(\1, _DX_I) != $00
                    db CHARSUB(\1, _DX_I)
                ENDC
                POPC
            ENDR
        ELSE
            db \1
        ENDC
        SHIFT
        POPC
    ENDR
    POPC
ENDM

MACRO dk
    drich RichKatakanaText, \#
ENDM

MACRO dh
    drich RichHiraganaText, \#
ENDM

MACRO dp
    PUSHC
    SETCHARMAP PlainText
    db \#
    POPC
ENDM
