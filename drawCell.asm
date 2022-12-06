PUBLIC drawSingleCell2
EXTRN drawCol:Byte
EXTRN drawRow:byte
wide     equ 40
height   equ 20
nextline equ 320

.model small
.286
.code

    ; how to use proc
    ; pusha
    ; mov in the ax the number of column
    ; mov in the bx the number of rows
    ; mov in the dx the color
    ; calling the proc
    ; popa

drawSingleCell2 proc FAR

                   mov  ax,0A000h
                   mov  es,ax

                  ; mov  ah,0
                  ; mov  al,13h
                  ; int  10h


    ; bx contain row number
    ; ax contain Column number
    ; dx contains first color
    ; si contains second color height
   

    ; width * column + height * 320 * row
                   
                   mov bh,0
                   mov bl,drawCol
                   mov  ax,bx
                   mov bh,0
                   mov  bl,drawRow
                   mov  dx,3
                   ;mov si,10
    ;oushing dx to save color
                   push dx
    ; computing the equtation
                   mov  cx ,wide
                   mul  cx
                   xchg ax,bx
                   mov  cx, height
                   mul  cx
                   mov  cx,320
                   mul  cx
                   add  ax,bx
                   mov  di, ax
                   pop  dx

                   mov  bx,height
                   sub bx,si
                   mov  cx,wide
                   mov al,0ch
    ; put color on al
                   
                     ; draw one line of the box with cool down color 
                     cmp si,0
                     je nored
    looping2:       
                   rep  stosb
                   dec  si


    start1:         
    ;return to the begining of the line
                   sub  di,wide
    ;moving to the next line
                   add  di,nextline
    ;assign the width again
                   mov  cx,wide
    ; repeat till the height become 0
                   cmp  si,0
                   jne  looping2
    nored:
    ; draw one line of the box
    mov  al,dl
    looping1:       
                   rep  stosb
                   dec  bx


    start2:         
    ;return to the begining of the line
                   sub  di,wide
    ;moving to the next line
                   add  di,nextline
    ;assign the width again
                   mov  cx,wide
    ; repeat till the height become 0
                   cmp  bx,0
                   jne  looping1
                   ret
drawSingleCell2 endp
END drawSingleCell2
