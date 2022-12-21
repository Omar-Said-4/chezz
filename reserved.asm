drawAllPieces proc FAR

mov cl,8

MOV drawRow,0
mov si,offset Pieces

outer_pieces_draw:

mov ch,8
mov drawCol,0

inner_pieces_draw:
push cx
push si
mov al,[si]
cmp al , 'R'
jnz not_white_rook
mov curr_draw,offset WROOK
CALL FAR PTR DrawPiece
jmp  nextPiece
not_white_rook:
cmp al , 'r'
jnz not_black_rook
mov curr_draw,offset BROOK
CALL FAR PTR DrawPiece
not_black_rook:
cmp al , 'h'
jnz not_black_knight
mov curr_draw,offset BKNIGHT
CALL FAR PTR DrawPiece
jmp  nextPiece
not_black_knight:
cmp al , 'H'
jnz not_white_knight
mov curr_draw,offset WKNIGHT
CALL FAR PTR DrawPiece
not_white_knight:
cmp al , 'p'
jnz not_black_pawn
mov curr_draw,offset BPAWN
CALL FAR PTR DrawPiece
jmp  nextPiece
not_black_pawn:
cmp al , 'P'
jnz not_white_pawn
mov curr_draw,offset WPAWN
CALL FAR PTR DrawPiece
jmp  nextPiece
not_white_pawn:
cmp al , 'k'
jnz not_black_king
mov curr_draw,offset BKING
CALL FAR PTR DrawPiece
jmp  nextPiece
not_black_king:
cmp al , 'K'
jnz not_white_king
mov curr_draw,offset WKING
CALL FAR PTR DrawPiece
jmp  nextPiece
not_white_king:
cmp al , 'q'
jnz not_black_queen
mov curr_draw,offset BQUEEN
CALL FAR PTR DrawPiece
jmp  nextPiece
not_black_queen:
cmp al , 'Q'
jnz not_white_queen
mov curr_draw,offset WQUEEN
CALL FAR PTR DrawPiece
jmp  nextPiece
not_white_queen:
cmp al , 'b'
jnz not_black_bishop
mov curr_draw,offset BBISHOP
CALL FAR PTR DrawPiece
jmp  nextPiece
not_black_bishop:
cmp al , 'B'
jnz not_white_bishop
mov curr_draw,offset WBISHOP
CALL FAR PTR DrawPiece
jmp  nextPiece
not_white_bishop:
nextPiece:
pop si
pop cx
inc si

inc drawCol
dec ch
cmp ch,0
je exiti
jmp  inner_pieces_draw
exiti:
inc drawRow
dec cl
cmp cl,00h
je done
jmp  outer_pieces_draw
done:



ret
drawAllPieces ENDP
