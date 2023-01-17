
;PUBLIC drawCol,drawRow
;EXTRN drawSingleCell2:FAR
.MODEL Medium
.286


.STACK 64
.DATA
MULBYC DW 0

checkmate1bool db 0
checkmate2bool db 0
P1Status Db 21,30
gotenter db 0
gotenter3 db 0
value2 db 'a'
gotenter4 db 0
P2Status Db 21,0
chatbool db 0
playbool db 0
gotdatabool db 0
p1 db 1
P1validateBool db 0
P2validateBool db 0

OverlapBool DB 0

drawbool db 0
curr_draw dw 0
SecondCellColor dw 0 
CoolDownColor  db 0ch
MULBYR DW 0
drawOnePieceVar DB '*'
timecol db 0
timerow db 0
timebrush dw 0

GraveP1 DB '*'
GraveP2 DB '*'

Player1WinsBool db 0
Player2WinsBool db 0


SystemTime Dw 0

brushRow DB 0
brushCol DB 0
brush DW 0  

offsetTime dw 0

value db 'a'

x db 0
y db 13

sendingx db 0
sendingy db 0

sending_bool db 1


boolStartP2 db 0


inlinex db 21
inliney db 20

inlineValue db "a"
gotenter2 db 0
INsendingx db 10
INsendingy db 20



WROOK DB '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*','$'  
  db '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, '*', 0fh, 0fh, '*', 0fh, 0fh, '*', 0fh, 0fh, '*', 0fh, 0fh,'$' 
  db '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, '*', 0fh, 0fh, '*', 0fh, 0fh, '*', 0fh, 0fh, '*', 0fh, 0fh,'$'
  db '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  db '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  db '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  db '*', '*', '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  db '*', '*', '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$' 
  db '*', '*', '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  db '*', '*', '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  db '*', '*', '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  db '*', '*', '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  db '*', '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  db '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  db '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  db '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  db '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  db '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,0fh,0fh,'&'


BROOK DB '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*','$' 
  db '*', '*', '*', '*', '*', '*', '*', 00h, 00h, '*', 00h, 00h, '*', 00h, 00h, '*', 00h, 00h, '*', 00h, 00h,'$' 
  db '*', '*', '*', '*', '*', '*', '*', 00h, 00h, '*', 00h, 00h, '*', 00h, 00h, '*', 00h, 00h, '*', 00h, 00h,'$'
  db '*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$'
  db '*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$'
  db '*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$'
  db '*', '*', '*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$'
  db '*', '*', '*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$' 
  db '*', '*', '*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$'
  db '*', '*', '*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$'
  db '*', '*', '*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$'
  db '*', '*', '*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$'
  db '*', '*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$'
  db '*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$'
  db '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$'
  db '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$'
  db '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$'
  db '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,00h,00h,'&'

WKNIGHT DB '*', '*', '*', '*','*', '*', '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh,'$'
  DB '*', '*','*', '*', '*', '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh,'$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 0fh, 0fh, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', 0fh, 0fh, 0fh, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
  DB '*', '*','*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$'
  DB '*', '*', '*', '*', '*', '*',0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*', '*',0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$'
  DB  '*', '*', '*', '*', '*', '*','*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '&' 


BKNIGHT DB '*', '*', '*', '*','*', '*', '*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h,'$'
  DB '*', '*','*', '*', '*', '*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h,'$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$'
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 00h, 00h, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', 00h, 00h, 00h, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
  DB '*', '*','*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$'
  DB '*', '*', '*', '*', '*', '*',00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*',00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$'
  DB  '*', '*', '*', '*', '*', '*','*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$'
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '&' 



BKING DB '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*','$' 
  DB'*', '*', '*', '*', '*','*', '*', '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, '$' 
  DB'*', '*', '*', '*', '*','*', '*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, '$' 
  DB'*', '*', '*', '*', '*', '*', '*', '*', '*', '*','*', '*', '*', 0fh, 0fh, 0fh, 0fh, '$' 
  DB'*', '*', '*','*', '*', '*', '*', '*', '*', 0fh, '*', '*', '*', 0fh, 0fh, 0fh, 0fh, '*', '*', '*', 0fh, '$' 
  DB '*','*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
  DB '*','*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
  DB '*','*', '*', '*', '*', '*', 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*', '*',0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, '$'  
  DB'*','*', '*', '*', '*', '*', 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, '$' 
  DB '*','*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, '$' 
  DB'*', '*', '*', '*', '*', '*','*', 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, '$'  
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, '$'  
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '&' 


WKING DB '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*','$' 
  DB'*', '*', '*', '*', '*','*', '*', '*', '*', '*', '*', '*', '*', '*', 00h, 00h, '$' 
  DB'*', '*', '*', '*', '*','*', '*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, '$' 
  DB'*', '*', '*', '*', '*', '*', '*', '*', '*', '*','*', '*', '*', 00h, 00h, 00h, 00h, '$' 
  DB'*', '*', '*','*', '*', '*', '*', '*', '*', 00h, '*', '*', '*', 00h, 00h, 00h, 00h, '*', '*', '*', 00h, '$' 
  DB '*','*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
  DB '*','*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
  DB '*','*', '*', '*', '*', '*', 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*',00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, '$'  
  DB'*','*', '*', '*', '*', '*', 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, '$' 
  DB '*','*', '*', '*', '*', '*', 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, '$' 
  DB'*', '*', '*', '*', '*', '*','*', 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, '$'  
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '&' 


WQUEEN DB '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*','$'  
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*','$' 
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*','$' 
  DB'*', '*', '*', '*', '*','*', '*', '*', '*', '*', 0fh, '*', '*', 0fh, 0fh, '*', '*', 0fh,'$' 
  DB '*', '*', '*', '*', '*', '*', '*', '*','*', 0fh, 0fh, 0fh, '*', 0fh, 0fh, '*', 0fh, 0fh, 0fh, '$'  
  DB '*','*', '*', '*', '*', '*', 0fh, 0fh, '*', 0fh, 0fh, '*', '*', 0fh, 0fh, '*', '*', 0fh, 0fh, '*', 0fh, 0fh, '$'  
  DB  '*', '*', '*', '*', '*',0fh, 0fh, 0fh, '*', '*', 0fh, '*', '*', 0fh, 0fh, '*', '*', 0fh, '*', '*', 0fh, 0fh, 0fh,'$'
  DB '*','*', '*', '*', '*', '*', 0fh, 0fh, '*', '*', 0fh, '*', '*', 0fh, 0fh, '*', '*', 0fh, '*', '*', 0fh, 0fh, '$'  
  DB '*', '*', '*', '*', '*', '*','*', 0fh, '*', '*', 0fh, 0fh, '*', 0fh, 0fh, '*', 0fh, 0fh, '*', '*', 0fh, '$'  
  DB '*', '*', '*', '*', '*', '*','*', 0fh, 0fh, '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '*', 0fh, 0fh, '$' 
  DB  '*', '*', '*', '*', '*', '*','*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$'  
  DB '*', '*', '*', '*', '*', '*','*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$'  
  DB '*', '*', '*', '*', '*', '*','*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$'  
  DB '*', '*', '*', '*', '*', '*','*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 0fh, 0fh,0fh,0fh,0fh, 0fh, 0fh, 0fh, 0fh,0fh,0fh, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,  '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '&' 


BQUEEN DB '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*','$' 
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*','$' 
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*','$' 
  DB'*', '*', '*', '*', '*','*', '*', '*', '*', '*', 00h, '*', '*', 00h, 00h, '*', '*', 00h,'$' 
  DB '*', '*', '*', '*', '*', '*', '*', '*','*', 00h, 00h, 00h, '*', 00h, 00h, '*', 00h, 00h, 00h, '$'  
  DB '*','*', '*', '*', '*', '*', 00h, 00h, '*', 00h, 00h, '*', '*', 00h, 00h, '*', '*', 00h, 00h, '*', 00h, 00h, '$'  
  DB  '*', '*', '*', '*', '*',00h, 00h, 00h, '*', '*', 00h, '*', '*', 00h, 00h, '*', '*', 00h, '*', '*', 00h, 00h, 00h,'$'
  DB '*','*', '*', '*', '*', '*', 00h, 00h, '*', '*', 00h, '*', '*', 00h, 00h, '*', '*', 00h, '*', '*', 00h, 00h, '$'  
  DB '*', '*', '*', '*', '*', '*','*', 00h, '*', '*', 00h, 00h, '*', 00h, 00h, '*', 00h, 00h, '*', '*', 00h, '$'  
  DB '*', '*', '*', '*', '*', '*','*', 00h, 00h, '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '*', 00h, 00h, '$' 
  DB  '*', '*', '*', '*', '*', '*','*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$'  
  DB '*', '*', '*', '*', '*', '*','*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$'  
  DB '*', '*', '*', '*', '*', '*','*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$'  
  DB '*', '*', '*', '*', '*', '*','*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 00h, 00h,00h,00h,00h, 00h, 00h, 00h, 00h,00h,00h, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,  '$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '&' 


WPAWN DB'*', '*', '*', '*', '*', '*','*', '*','*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$'
 DB '*', '*', '*','*', '*', '*', '*', '*', '*', '*', '*',0fh, 0fh, 00h, 00h, 0fh, 0fh, '$'
 DB '*', '*', '*','*', '*', '*', '*','*', '*', '*', 0fh, 0fh, 00h, 00h, 00h, 00h, 0fh, 0fh, '$'
 DB '*', '*', '*','*', '*', '*', '*','*', '*', '*', 0fh, 0fh, 00h, 00h, 00h, 00h, 0fh, 0fh, '$'
 DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*',0fh, 0fh, 00h, 00h, 00h, 00h, 0fh, 0fh, '$'
 DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*',0fh, 0fh, 00h, 00h, 00h, 00h, 0fh, 0fh, '$' 
 DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*',0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
 DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*','*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
 DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*','*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$'
 DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*','*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
 DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*','*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
 DB '*', '*', '*','*', '*', '*','*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$'
 DB '*', '*', '*','*', '*', '*','*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
 DB '*', '*', '*','*', '*', '*','*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
 DB '*', '*','*', '*', '*', '*','*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$'
 DB '*','*', '*', '*', '*', '*','*', '*', 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, '$' 
 DB '*', '*', '*', '*', '*', '*','*',0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$'
 DB '*', '*', '*', '*', '*', '*','*',0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '&'

BPAWN DB'*', '*', '*','*', '*', '*', '*', '*','*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, '$'
 DB '*', '*', '*', '*', '*', '*', '*','*', '*','*', '*', 00h, 00h, 0fh, 0fh, 00h, 00h, '$'
 DB '*', '*','*', '*', '*', '*', '*','*', '*', '*', 00h, 00h, 0fh, 0fh, 0fh, 0fh, 00h, 00h, '$'
 DB '*', '*', '*', '*', '*', '*', '*','*', '*','*', 00h, 00h, 0fh, 0fh, 0fh, 0fh, 00h, 00h, '$'
 DB '*', '*', '*', '*', '*', '*', '*','*', '*','*', 00h, 00h, 0fh, 0fh, 0fh, 0fh, 00h, 00h, '$'
 DB '*', '*', '*', '*', '*', '*', '*','*', '*','*', 00h, 00h, 0fh, 0fh, 0fh, 0fh, 00h, 00h, '$' 
 DB '*', '*', '*', '*', '*', '*', '*','*', '*','*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
 DB '*', '*', '*', '*', '*', '*', '*','*', '*','*', '*', 00h, 00h, 00h, 00h, 00h, 00h, '$' 
 DB '*', '*', '*', '*', '*', '*', '*','*', '*','*', '*', 00h, 00h, 00h, 00h, 00h, 00h, '$'
 DB '*', '*', '*', '*', '*', '*', '*','*', '*','*', '*', 00h, 00h, 00h, 00h, 00h, 00h, '$' 
 DB '*', '*', '*', '*','*', '*', '*', '*', '*','*', '*', 00h, 00h, 00h, 00h, 00h, 00h, '$' 
 DB '*', '*', '*', '*', '*', '*', '*','*', '*','*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$'
 DB '*', '*', '*', '*', '*', '*', '*','*', '*','*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
 DB '*', '*', '*', '*', '*', '*', '*','*', '*','*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$' 
 DB '*', '*', '*', '*', '*', '*', '*','*', '*',00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$'
 DB '*', '*', '*', '*', '*', '*', '*','*',00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, '$' 
 DB '*', '*', '*', '*', '*', '*','*',00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$'
 DB '*', '*', '*', '*', '*', '*','*',00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '&'

BBISHOP DB '*', '*', '*', '*', '*', '*', '*', '*','*', '*', '*', '*', '*', 00h, 0fh, 00h, '$'
  DB '*', '*', '*', '*', '*','*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h,'$' 
  DB '*', '*', '*', '*', '*','*', '*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h,  '$'
  DB '*', '*', '*', '*', '*','*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, '$'
  DB '*', '*', '*', '*','*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 0fh, 00h, 00h, 00h, 00h, '$' 
  DB '*', '*', '*', '*','*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 0fh, 00h, 00h, 00h, 00h, '$'
  DB '*', '*', '*', '*','*', '*', '*', '*', '*', 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h,'$'
  DB '*', '*', '*', '*','*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 0fh, 00h, 00h, 00h, 00h, 00h,'$'
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*',00h, 00h, 00h, 00h, 00h, 0fh, 00h, 00h, 00h, 00h, 00h,'$'
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*','*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$'
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*','*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$'
  DB '*', '*', '*', '*','*', '*', '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$'
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*','*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$'
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*','*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$'
  DB '*', '*', '*', '*', '*', '*','*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, '$'
  DB '*','*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$' 
  DB '*','*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$' 
  DB '*', '*', '*', '*', '*', '*','*', 00h, 00h, 00h, 00h, 00h, '*', '*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, '&'

WBISHOP DB '*', '*', '*', '*', '*','*', '*', '*', '*', '*', '*', '*', '*', 0fh, 00h, 0fh, '$'
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh,'$' 
  DB '*', '*', '*', '*', '*', '*','*', '*', '*', '*', '*', '*', '*', 0fh, 0fh, 0fh,  '$'
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*','*', 0fh, 0fh, 0fh, 0fh, 0fh, '$'
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*', '*',0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, '$' 
  DB '*', '*', '*', '*', '*','*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, '$'
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*',0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh,'$'
  DB '*', '*', '*', '*','*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  DB '*', '*', '*', '*','*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh,'$'
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*','*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$'
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*','*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$'
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*','*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$'
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*','*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$'
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*','*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$'
  DB '*', '*', '*', '*', '*', '*','*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$'
  DB '*','*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$' 
  DB '*','*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh,'$' 
  DB '*', '*', '*', '*', '*', '*','*', 0fh, 0fh, 0fh, 0fh, 0fh, '*', '*', '*', '*', '*', 0fh, 0fh, 0fh, 0fh, 0fh, '&'






msg3 db "To Start Chatting Press F1 $"
msg1 db "To Start Game Press F2 $"
msg2 db "To End The Program Press ESC $"
msg4 db "Please enter your name:$"
msg5 db "Press Enter key to continue$"

msg6 db " IS CONNECTED$"
msgclr db "                                  $"

msg7 db "a game invitation has been sent $"

msg8 db "a chat invitation has been sent $"


; Color Matrix

recINline db 'a'


RecievedNumber db 0

P2initR  db 0,0,0,0


ReciviedStatus db '|'

SendingStatus db '|'


p1SendInitS db 0,0,0,0

currentbyte dw 0

RecivivingByte dw 0


SendingNumber db 0

boolInline db 0






OldPieces   DB 'R','H','B','Q','K','B','H','R'
            DB 'P','P','P','P','P','P','P','P'
            DB '*','*','*','*','*','*','*','*'
            DB '*','*','*','*','*','*','*','*'
            DB '*','*','*','*','*','*','*','*'
            DB '*','*','*','*','*','*','*','*'
            DB 'p','p','p','p','p','p','p','p'
            DB 'r','h','b','q','k','b','h','r'





Board DB 7,8,7,8,7,8,7,8
      DB 8,7,8,7,8,7,8,7
      DB 7,8,7,8,7,8,7,8
      DB 8,7,8,7,8,7,8,7
      DB 7,8,7,8,7,8,7,8
      DB 8,7,8,7,8,7,8,7
      DB 7,8,7,8,7,8,7,8
      DB 8,7,8,7,8,7,8,7



currColor db 00h

currPiece db '*'


clipBoardP1 db '*',0,0

clipBoardP2 db '*',0,0

getrow db 1
getcol db 4 

Highlighted1bool db 0
Highlighted2bool db 0


temprow db 0
tempcol db 0

Clearbool db 0

currTime DW 0


f4bool db 0


playtime dw 0


dispMins db 0,0
Secs db 0
Mins db 0
dispsecs db 0,0



MyName db 30,?,30 dup('$')


OpName db 30 dup('$')


Pieces      DB 'R','H','B','K','Q','B','H','R'
            DB 'P','P','P','P','P','P','P','P'
            DB '*','*','*','*','*','*','*','*'
            DB '*','*','*','*','*','*','*','*'
            DB '*','*','*','*','*','*','*','*'
            DB '*','*','*','*','*','*','*','*'
            DB 'p','p','p','p','p','*','p','p'
            DB 'r','h','b','k','q','p','R','*'


q2 db 0,3

q1 db 7,4


            
Time        DW  0,  0,  0,  0,  0,  0,  0,  0
            DW  0,  0,  0,  0,  0,  0,  0,  0        
            DW  0,  0,  0,  0,  0,  0,  0,  0
            DW  0,  0,  0,  0,  0,  0,  0,  0       
            DW  0,  0,  0,  0,  0,  0,  0,  0
            DW  0,  0,  0,  0,  0,  0,  0,  0
            DW  0,  0,  0,  0,  0,  0,  0,  0
            DW  0,  0,  0,  0,  0,  0,  0,  0

CurrentMovesColumn DB 32 dup("|")
CurrentMovesRow DB 32 dup("|")
CurrentMovesColors DB 32 dup(0eh)
ColorOffset DW 0

CurrentMovesColumn2 DB 32 dup("|")
CurrentMovesRow2 DB 32 dup("|")
CurrentMovesColors2 DB 32 dup(0dh)
ColorOffset2 DW 0

delmoves db "|"

wide     equ 40
height   equ 20
nextline equ 320
drawRow db 0
drawCol db 6
;cell row and column
Player1square db 6,4
;cell row and column
; Player2square db 1,4
.286
.stack 64
.code


main proc FAR
                MOV AX,@DATA
                mov ds, ax

                        mov dx,3fbh
              mov al,10000000b
              out dx,al


              mov dx,3f8h  
              mov al,0ch  
              out dx,al 


              mov dx,3f9h
              mov al,00h
              out dx,al

              ; setting the port configuration 
              mov dx,3fbh
              mov al,00011011b
              out dx,al
                     ; changing to text mode
              mov ah,3
              mov al,13h
              int 10h
                  mov ah,0
              mov al,3
              int 10h
          
              
              
              
              CALL FAR PTR GetUserName
            
              MainScreen:
            

              mov x,0
              mov y,13

              mov sendingx , 0
              mov sendingy, 0

              ; changing to text mode
              mov ah,3
              mov al,13h
              int 10h

              ; clearing the screen
           
              ; setting the cursor postion
              mov ah,0
              mov al,3
              int 10h

              mov ah,2  
              mov dl,25
              mov dh,8
              int 10h

              mov ah, 9
              mov dx, offset msg3
              int 21h

              mov ah,2  
              mov dl,25
              mov dh,10
              int 10h

              mov ah, 9
              mov dx, offset msg1
              int 21h

              
              mov ah,2  
              mov dl,25
              mov dh,12
              int 10h


              mov ah, 9
              mov dx, offset msg2
              int 21h
              
              CALL FAR PTR MainNotBar
              cmp gotdatabool,0
              jne skipdata
                sendnamecjk:
              mov dx , 3FDH 
              In  al , dx  
     
              test al , 00100000b
              jz sendnamecjk
               mov dx , 3F8H 
               mov al,'a'
               out dx ,al 

              waituser:
               mov ah,1
               int 16h
               jnz flshh
               jmp notflshhh
               flshh:
               cmp ah,1
               je terminatehelpp
                jmp nottemhelp
                terminatehelpp:
               jmp terminatehelp
               nottemhelp:
                push ax
               mov ah,0ch
               mov al,0
               int 21h
               notflshhh:
               pop ax
                mov dx , 3FDH 
               in al , dx  
             test al , 1 
             jz waituser
             mov dx , 03F8H 
             in al , dx
             cmp al,'a'
             jne waituser
               
             mov cl,20
             lea si,MyName
             lea di,OpName
             inc si
             inc si
             sendrecnames:
             sendnameddd:
              mov dx , 3FDH 
               In  al , dx  
              test al , 00100000b
              jz sendnameddd
              mov dx , 03F8H
              mov al,[si] 
               out dx ,al
               inc si
              notrecnow:
              mov dx , 3FDH 
             in al , dx  
             test al , 1 
             jz notrecnow
             mov dx , 03F8H 
             in al , dx
             mov [di],al
             inc di
             dec cl
             jnz sendrecnames
              skipdata:
              call far ptr playersconnected
              getkey:
              mov dx , 3FDH 
             in al , dx  
             test al , 1 
             jz notrecnow22
             mov dx , 03F8H 
               in al , dx
              cmp al,'c'
              je chattt
              jmp nochatttt
              chattt:
              mov chatbool,1
              CALL FAR PTR startchatnotif
              nochatttt:
              cmp al,'e'
              je terminatehelp
              cmp al,'g'
              je gameee
              jmp notgameee
              gameee:
              mov p1,0
              mov playbool,1
               CALL FAR PTR startgamenotif
              notgameee:
              notrecnow22:
              mov ah,1
              int 16h
              jz getkey
               push ax
               mov ah,0ch
               mov al,0
               int 21h
               pop ax
              cmp ah,1
              je term
              jmp notterminate
              term:
              sendchatt22:
              mov dx , 3FDH 
              In  al , dx  
              test al , 00100000b
              jz sendchatt22
              mov dx , 03F8H
              mov al,'e'
              out dx ,al
              jmp terminatehelp
              jmp notterminate
              terminatehelp:
              jmp terminate
              notterminate:
              cmp ah,65
              jne nxtnxtnxt
              mov p1,1
               mov dx , 3FDH 
              In  al , dx  
              test al , 00100000b
              jz sendchatt
              mov dx , 03F8H
              mov al,'r'
              out dx ,al
              mov chatbool,0
              mov playbool,0
                  mov ah,2  
              mov dl,25
              mov dh,20
              int 10h
              mov ah, 9
              mov dx, offset msgclr
              int 21h
              mov ah,2
              mov dl,9
              mov dh,36
              int 10h
              jmp getkey
              nxtnxtnxt:
              cmp ah,59
              je yeschat
              jmp nonochat
              yeschat:
              CALL FAR PTR startchatnotif
              sendchatt:
              mov dx , 3FDH 
              In  al , dx  
              test al , 00100000b
              jz sendchatt
              mov dx , 03F8H
              mov al,'c'
              out dx ,al
              cmp chatbool,1
              je chathelp
             notrecchat:
              mov dx , 3FDH 
             in al , dx  
             test al , 1 
             jz notrecchat
             mov dx , 03F8H 
             in al , dx
             cmp al,'c'
             je chathelp
              cmp al,'e'
             je terminatehelper

              cmp al,'r' 
             jne notrecchat
                 mov ah,2  
              mov dl,25
              mov dh,20
              int 10h
              mov ah, 9
              mov dx, offset msgclr
              int 21h
              mov ah,2 
             mov dl,9
             mov dh,36
              int 10h
              nonochat:
              ; je chathelp 
              jmp nochat
              chathelp:
              jmp chat 



              nochat: 
              cmp ah,60
              je lesgo
              jmp nonochat2
              lesgo:
              CALL FAR PTR startgamenotif
              sendchatt232:
              mov dx , 3FDH 
              In  al , dx  
              test al , 00100000b
              jz sendchatt232
              mov dx , 03F8H
              mov al,'g'
              out dx ,al
              cmp playbool,1
              je ppl
             notrecchat2:
              mov dx , 3FDH 
             in al , dx  
             test al , 1 
             jz notrecchat2
             mov dx , 03F8H 
             in al , dx
             cmp al,'g'
             je ppl
            cmp al,'e'
             je terminatehelper
             jmp ntermm
             terminatehelper:
             jmp terminate
             ntermm:
             cmp al,'r' 
             jne notrecchat2
             mov ah,2  
              mov dl,25
              mov dh,20
              int 10h
              mov ah, 9
              mov dx, offset msgclr
              int 21h
              mov ah,2 
             mov dl,9
             mov dh,36
              int 10h
              nonochat2:    
              jmp getkey

              ; jne getkeyhelp
              ; jmp notgetkey
              ; getkeyhelp:
              ; jmp getkey
              ; notgetkey:
              ;jmp MainScreen


ppl:

                mov  ax,0A000h
                mov  es,ax
                mov  ah,0
                mov  al,13h
                int  10h
                
                CAll FAR PTR InitialiseStatusBar
                ;mov al,2
                ;mov getrow,al
                ;mov ah,5
                ;mov getcol,ah
                pusha
                CALL FAR PTR InitialisePieces
                popa
                Call Far Ptr getCellData
                pusha
                
                call FAR PTR ChessBoard
                popa

                Call Far PTR drawPlayer1
                  

hlt
play:


                call far ptr sendingData
                cmp f4bool , 1
                je rg
                CALL FAR PTR CheckP1Moves
              

                CALL FAR PTR GetAvaliableMoves
                ; CALL FAR PTR GetAvaliableMoves2
              ;  popa 
                call far ptr sendingInline
                call far ptr recivingInline
                CALL FAR PTR HighlighCells
                CALl FAR PTR freeClipboard1
                call far ptr releaseClipBoard1
                Call FAR PTR FreeCell
                CALL FAR PTR CheckGameOver
                CALL FAR PTR UpdateStatusBar
                
                CALL FAR PTR displaytime
                call far ptr recivingdata
                call far ptr release2


              
                mov cl,Player2WinsBool
                add Player1WinsBool,cl
                cmp Player1WinsBool,1
                jb  play
                cmp SendingStatus,'|'
                jne play
                ; delay after  one player wins
                ; xor ax,ax
                ; xor bx,bx
                ; xor cx,cx
                ; xor dx,dx
                ; MOV     CX, 12H
                ; MOV     DX, 0FFFFH
                ; MOV     AH, 86H
                ; INT     15H
               
                mov cx,1300
                delay:
                mov ax,65000
                delay2:
                dec ax
                jnz delay2
                dec cx
                jnz delay
                rg:

                pusha
                  CALL FAR PTR RESETGAME
                popa
                jmp MainScreen
                
                ; pusha
                ;popa 

;jmp play
                terminate:
                  mov ah,0
                  mov al,3
                  int 10h
                  mov ah,4ch
                  int 21h


            chat:
        

              ; mov ah,0
              ; mov al,13h
              ; int 10h


              mov ah,0
              mov al,3
              int 10h


              xor ax,ax

              mov ah,02
              mov dl,0
              mov dh,12
              int 10h

              ; moving dashed line
              repeating:
              pusha
                  mov ah,2
                  mov dl ,'-'
                  int 21h
              popa
              inc dl
              cmp dl,80
              jne repeating


              ; you text
              mov ah,02
              mov dl,0
              mov dh,13
              int 10h



              lea dx,OpName
              mov ah, 9
              int 21h

              ; pusha
              ;     mov ah,2
              ;     mov dl ,'Y'
              ;     int 21h
              ; popa
              ; add x,1
              ; pusha
              ;     mov ah,2
              ;     mov dl ,'o'
              ;     int 21h
              ; popa
              ; add x,1
              ; pusha
              ;     mov ah,2
              ;     mov dl ,'u'
              ;     int 21h
              ; popa
              ; add x,1
              ; pusha
              ;     mov ah,2
              ;     mov dl ,':'
              ;     int 21h
              ; popa
              ; add x,1

              ;Me text
              xor dl,dl

              mov ah,02
              mov dl,0
              mov dh,0000h
              int 10h




              lea dx,MyName
              add dx,2
              mov ah, 9
              int 21h

              ; pusha
              ;     mov ah,2
              ;     mov dl ,'M'
              ;     int 21h
              ; popa

              ; inc dl
              ; pusha
              ;     mov ah,2
              ;     mov dl ,'E'
              ;     int 21h
              ; popa

              ; inc dl
              ; pusha
              ;     mov ah,2
              ;     mov dl ,':'
              ;     int 21h
              ; popa
              ; inc dl

              ; mov sendingx,dl

                mov sendingx,0
                mov sendingy,1

                mov bh,0
                mov ah,02
                mov dl,sendingx
                mov dh,sendingy
                int 10h


                mov x,0
                mov y,14

              


              MainChatting: 

              mov gotdatabool,1
              call far ptr reciving
              cmp Value2,'^'
              je jjjjj  
    mov ah,1
    int 16h
    jz noooaxzhelp


    


    jmp nop23
    noooaxzhelp: jmp noValue
    nop23:

    cmp ah,61
    jne nxtghgh
    mov ah,00
    int 16h
        sendchatt322:
              mov dx , 3FDH 
              In  al , dx  
              test al , 00100000b
              jz sendchatt322
              mov dx , 03F8H
              mov al,'^'
      out dx ,al
      jjjjj:
      mov bl,'*'
      mov VALUE2,bl
      mov chatbool,0
      mov gotdatabool,1
      jmp MainScreen

    nxtghgh:
    cmp ah,59
    jg noooaxzhelp2
    jmp nop33
    noooaxzhelp2 : jmp noooaxz

    nop33:

 
    
    printRegx:
    mov ah,00
    int 16h

    mov value,al
    cmp sendingx,79
    jne checkentrx
    add sendingy,1
    cmp sendingy,12
    je printNotRegx
    mov sendingx,0
    mov bh,0
    mov ah,02
    mov dl,sendingx
    mov dh,sendingy
    int 10h

    checkentrx:
    cmp al,13
    jne printitx
    mov gotenter3,1
    mov sendingx,0
    dec sendingx
    add sendingy,1
    cmp sendingy,12
    je PrintNotRegx
    mov bh,0
    mov ah,02
    mov dl,sendingx
    mov dh,sendingy
    int 10h


    printitx:

    mov ah,02
    mov dl,sendingx
    mov dh,sendingy
    int 10h

    mov ah,2
    mov dl,Value
    int 21h

    inc sendingx
    
    jmp noooaxz

    


    PrintNotRegx:
    mov sendingy,11
    cmp gotenter3,1
    je extradecx
    mov sendingx,0
    jmp noextradecx
    extradecx:
    mov gotenter3,0
    mov sendingx,-1
    noextradecx:

    mov ax,0600h
    mov bh,07h
    mov al,1
    mov cl,0
    mov ch,1
    mov dl,79
    mov dh,11
    int 10h

   
    mov bh,0
    mov ah,02
    mov dl,0
    mov dh,11
    int 10h
    
    mov bh,0
    mov ah,2
    mov dl,Value
    int 21h




    inc sendingx
    jmp noooaxz

noooaxz:

            
              call far ptr sending
          
              noValue:
              jmp MainChatting


main endp







ChessBoard proc FAR

pusha 



mov ch,8
xor dx,dx
mov bx,0
lea di ,Board
mov dx,[di]
mov si,0
mov ax,0


;0dh -> light magenta
;0ch -> red
;oeh-> yellow
singleRow:
;! you have to remove the procedure and put the call here
;! I have tried but there is a error in th calling 

;! start of proc call
pusha
CALL FAR PTR drawSingleCell
popa
;! end of the calling

inc di
inc AX
dec ch
mov dx,[di]
cmp ch,0
jne singleRow
je  incRow 



incRow:
  inc bx
  cmp bx,8
  mov ch,8
  mov ax,0
  jne singleRow
popa

ret
ChessBoard ENDP


; gets cell row and col then draws it
drawPlayer1 proc far
mov al,Player1square
mov ah,Player1square[1]
mov getrow,al
mov getcol,ah
pusha
Call Far PTR getCellData
popa
;pusha
;CALl FAR PTR GetTimeFromInterrupt
;popa
;mov cx,SystemTime
;cmp cx,currTime
;jb notp1draw 
mov drawRow,al
mov si,0
MOV drawCol,ah
mov bh,0
mov bl,drawCol
mov  ax,bx
mov bh,0
mov  bl,drawRow
mov dx,0ah ;color 
CALL FAR PTR drawSingleCell
pusha
mov al,Player1square
mov ah,Player1square[1]
mov getrow,al
mov getCol,ah
MOV drawRow,al
mov drawCol,ah
Call Far PTR getCellData
mov al,currPiece
mov drawOnePieceVar,al
Call Far PTR DrawOnePiece
popa
;notp1draw:
ret
drawPlayer1 ENDP


getCellData proc far

mov offsetTime,0
mov cx,Time
mov currTime,cx
mov cl,getrow
lea si,Board
lea di,Pieces

cmp getrow,0
je nextget
outer_getter1:
mov ch,8
inner_getter1:
push si
inc offsetTime
inc offsetTime
lea si,Time
add si,offsetTime
mov bx,[si]
mov currTime,bx
pop si
inc si
inc di
dec ch
jnz inner_getter1
dec cl
jnz outer_getter1
nextget:
mov cl,getcol
cmp cl,0
je getfinished

getter2:
inc si
inc di
push si
inc offsetTime
inc offsetTime
mov si,offset Time
add si,offsetTime
mov bx,[si]
mov currTime,bx
pop si
dec cl
jnz getter2

getfinished:
mov al,[si]
mov currColor,al
mov al,[di]
mov currPiece,al
ret
getCellData endp

CheckP1Moves proc far

mov ah,01h
int 16h
jnz clr1
jmp notclr1
clr1:
mov Clearbool,1
notclr1:


cmp ah,62
je f4condition
jmp notjmp

f4condition:
mov f4bool,1
mov SendingStatus,'#'
jmp moved 

notjmp:

cmp ah,48h
jnz not_up_help
jmp yesup
not_up_help:
jmp not_up
yesup:
; delete what is inside the buffer without reading
;push ax
 ; mov ah,0ch
 ; mov al,0
  ;int 21h
;pop ax   

; draw in its place



mov al,Player1square
mov ah,Player1square[1]
mov getrow,al
mov getcol,ah

Call Far PTR getCellData
mov al,Player1square
mov ah,Player1square[1]
mov getrow,al
mov getcol,ah
mov si,0
mov bh,0
mov bl,getcol
mov ax,bx
mov bh,0
mov  bl,getrow

pusha
mov ax,currTime 


pusha
CALl FAR PTR GetTimeFromInterrupt
popa
cmp ax,SystemTime
ja redcooldown1
jmp nocooldown1
redcooldown1:
mov currColor,04h
nocooldown1:

popa



mov dl,currColor
mov dh,0
CALL FAR PTR drawSingleCell



cmp Player1square,0
je not_normal_up
dec Player1square
jmp normal_up
not_normal_up:
mov Player1square,7
normal_up:
CALL FAR PTR drawPlayer1


jmp moved
not_up:
cmp ah,50h
jnz not_down_help
jmp yesdown
not_down_help:
jmp not_down
yesdown:
;push ax
;mov ah,0ch
;mov al,0
;int 21h
;pop ax   

mov al,Player1square
mov ah,Player1square[1]
mov getrow,al
mov getcol,ah
Call Far PTR getCellData
mov si,0
mov bh,0
mov bl,getcol
mov  ax,bx
mov bh,0
mov  bl,getrow
pusha
mov ax,currTime 
pusha
CALl FAR PTR GetTimeFromInterrupt
popa
cmp ax,SystemTime
ja redcooldown2
jmp nocooldown2
redcooldown2:
mov currColor,04h
nocooldown2:
popa
mov dl,currColor
mov dh,0
CALL FAR PTR drawSingleCell



cmp Player1square,7
je not_normal_down
inc Player1square
jmp normal_down
not_normal_down:
mov Player1square,0
normal_down:
CALL FAR PTR drawPlayer1



jmp moved
not_down:

cmp ah,4Bh
jnz not_left_help
jmp yesleft
not_left_help:
jmp not_left
yesleft:
;push ax
 ; mov ah,0ch
  ;mov al,0
 ;; int 21h
;pop ax   

mov al,Player1square
mov ah,Player1square[1]
mov getrow,al
mov getcol,ah
Call Far PTR getCellData
mov si,0
mov bh,0
mov bl,getcol
mov  ax,bx
mov bh,0
mov  bl,getrow
pusha
mov ax,currTime 
pusha
CALl FAR PTR GetTimeFromInterrupt
popa
cmp ax,SystemTime
ja redcooldown3
jmp nocooldown3
redcooldown3:
mov currColor,04h
nocooldown3:
popa
mov dl,currColor
mov dh,0
CALL FAR PTR drawSingleCell




mov cl,Player1square[1]
cmp cl,0
je not_normal_left
dec cl
mov Player1square[1],cl
jmp normal_left
not_normal_left:
mov cl,7
mov Player1square[1],cl
normal_left:
CALL FAR PTR drawPlayer1




jmp moved
not_left:

cmp ah,4Dh
jnz not_right_help
jmp yesright
not_right_help:
jmp not_right
yesright:
;flushing buffer
;push ax
;mov ah,0ch
;mov al,0
;int 21h
;pop ax   

mov al,Player1square
mov ah,Player1square[1]
mov getrow,al
mov getcol,ah
Call Far PTR getCellData
mov si,0
mov bh,0
mov bl,getcol
mov  ax,bx
mov bh,0
mov  bl,getrow
pusha
mov ax,currTime 
pusha
CALl FAR PTR GetTimeFromInterrupt
popa
cmp ax,SystemTime
ja redcooldown4
jmp nocooldown4
redcooldown4:
mov currColor,04h
nocooldown4:
popa
mov dl,currColor
mov dh,0
CALL FAR PTR drawSingleCell



mov cl,Player1square[1]
cmp cl,7
je not_normal_right
inc cl
mov Player1square[1],cl
jmp normal_right
not_normal_right:
mov cl,0
mov Player1square[1],cl
normal_right:
CALL FAR PTR drawPlayer1



jmp moved
not_right:


moved:
; flush buffer
; push ax
;   mov ah,0ch
;   mov al,0
;   int 21h
; pop ax   

ret
CheckP1Moves ENDP







drawSingleCell proc FAR
                    ; For Drawing Piece
                    mov getrow,bl
                    mov getCol,al
                    MOV drawRow,bl
                    mov drawCol,al


                  ; mov  ah,0
                  ; mov  al,13h
                  ; int  10h
    ; bx contain row number
    ; ax contain Column number
    ; dx contains first color
    ; si contains second color height

    ; width * column + height * 320 * row
                  
    ;               mov bh,0
    ;               mov bl,drawCol
    ;               mov  ax,bx
    ;               mov bh,0
    ;               mov  bl,drawRow
    ;               mov  dx,3
                   ;mov si,10
        ; ;oushing dx to save color
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
                    mov al,CoolDownColor
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
    ; ;return to the begining of the line
                    sub  di,wide
     ;moving to the next line
                    add  di,nextline
     ;assign the width again
                    mov  cx,wide
     ;repeat till the height become 0
                    cmp  bx,0
                    jne  looping1

                     pusha
                    
                    Call Far PTR getCellData
                   mov al,currPiece
                    mov drawOnePieceVar,al
                    Call Far PTR DrawOnePiece
                     popa
                    ret
drawSingleCell endp




drawBorder proc FAR
                  ; mov  ah,0
                  ; mov  al,13h
                  ; int  10h
    ; bx contain row number
    ; ax contain Column number
    ; dx contains first color
    ; si contains second color height

    ; width * column + height * 320 * row
                  
    ;               mov bh,0
    ;               mov bl,drawCol
    ;               mov  ax,bx
    ;               mov bh,0
    ;               mov  bl,drawRow
    ;               mov  dx,3
                   ;mov si,10
        ; ;oushing dx to save color
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

                    mov cx,40
                  ; draw one line of the box

                  mov  al,dl
                  looping1235:       
                  rep  stosb
                  dec  bx

                  ; have drawn the first line


                  ; sub di,39

                  pusha
                    mov dx , 19
                    drawlineVertical:
                    mov cx,1
                    add  di,319
                    rep  stosb
                    dec dx
                    cmp dx,0
                    jne drawlineVertical
                  popa



                  ;?3rd line
                  add di,6399
                  sub di,320
                  STD
                  mov cx,40
                  mov  al,dl   
                  rep  stosb
                  dec  bx



                  add di,320

                  pusha
                    ; add di,39
                    mov bp , 20
                    drawlineVertical2nd:
                    mov cx,1
                    sub  di,319
                    rep  stosb
                    dec bp
                    cmp bp,0
                    jne drawlineVertical2nd
                  popa
                  CLD

                  ; CLD                  
                  ; ; add di,6400
                  

                  
ret
drawBorder endp



DrawPiece    PROC FAR
;swich to graphics mode
;mov ah,0
;mov al,13h
;int 10h  ;
; bx contain row number
; ax contain Column number
; dx contains cell first color
; si contains second color height
;MOV AX,@DATA
;MOV DS,AX  
;MOV drawCol,4
;MOV drawRow,5
MOV MULBYC,0
MOV MULBYR,0
MOV BL,drawRow

;CALL FAR PTR drawSingleCell

;n:
;jmp n
; di column number of cell
; bx row number of cell 
;MOV AX,@DATA
;MOV DS,AX  
mov bh,0
mov bl,drawCol
mov di,bx
mov bh,0
mov Bl,drawRow
CALL FAR PTR BY40
CALL FAR PTR BY20

mov   SI,curr_draw
loop_:
mov cl,[si]    
cmp cl,'*'
je curr_pix
mov cx,di ;Column
mov dx,bx ;Row
mov al,[si] ;Pixel color
mov ah,0ch ;Draw Pixel Command
int 10h    
jmp not_pix
curr_pix:  
mov cx,di ;Column
mov dx,bx ;Row
mov bh,0 
mov ah,0dh ;Draw Pixel Command
int 10h    

mov cx,di ;Column
mov dx,bx ;Row
mov ah,0ch ;Draw Pixel Command
int 10h    
not_pix:
inc si   
mov cl,[si]    
cmp cl,'&'
je exit
mov cl,[si]  
cmp cl,'$'
je inc_row

jmp not_row
inc_row: 
inc bx
mov di,MULBYC
dec di
inc si    
not_row:
inc di
jmp loop_
exit:

DrawPiece ENDP
BY40 PROC FAR
MOV CL,39
MOV MULBYC,DI
LBY40:
ADD MULBYC,DI
DEC CL
JNZ LBY40
ADD MULBYC,5
MOV DI,MULBYC
ret
BY40 ENDP

BY20 PROC FAR
MOV CL,19
MOV MULBYR,BX
LBY20:
ADD MULBYR,BX
DEC CL
JNZ LBY20
INC MULBYR
MOV BX,MULBYR
ret
BY20 ENDP
;TODO MOVES1
  GetAvaliableMoves proc far

  
  Mov ColorOffset,0
  xor SI,SI
  lea SI , CurrentMovesRow
  xor di,di
  lea di,CurrentMovesColumn
  xor ax,ax
  cmp P1validateBool,1
  je extravalhelp
  
  cmp clipBoardP1,'*'
  jne flagNoPieceHelp
  
  jmp extc
  extravalhelp:
  jmp extraval
  extc:
  
  mov ah,01h
  int 16h
  ;mov dl,ah
  ;mov ah,07         ;Read one char and put in al
  ;int 21h  


  cmp ah,62
  je f4conditionMov1
  jmp ContinueMov

  f4conditionMov1:
  mov f4bool,1
  mov SendingStatus,'#'
  jmp flagNoPiece 

  ContinueMov:


  cmp ah,68
  jne flagNoPieceHelp
  jmp notjump
  flagNoPieceHelp:
  jmp flagNoPiece
  notjump:
  Mov al,Player1square
  Mov getrow,al
  mov al,Player1square[1]
  mov getcol,al
  pusha
    CAll far ptr getCellData
  popa

  pusha
    mov cl,getrow
    mov temprow,cl

    mov cl,getcol
    mov tempcol,cl
  popa

  mov bl,currPiece
  cmp bl,"*"
  je flagNoPieceHelpr
  cmp bl,'Z'
  jb flagNoPieceHelpr
  mov bp,currTime
  cmp bp,SystemTime
  ja flagNoPieceHelpr
  jmp NotflagnoPiece
  flagNoPieceHelpr:
  jmp flagNoPiece
  NotflagnoPiece:
  mov clipBoardP1,bl

  pusha
    mov cl,getrow
    mov clipBoardP1[1],cl
    mov cl,getcol
    mov clipBoardP1[2],cl
  popa
  jmp notextraval
  extraval:
  PUSHA
  call far ptr ClearHighlighted1
  POPA
  PUSHA
  Call Far ptr resetcurrentmoves1
  POPA
  mov bl,clipBoardP1
  mov cl,clipBoardP1[1]
  mov temprow,cl
  mov getrow,cl
  mov cl,clipBoardP1[2]
  mov tempcol,cl
  mov getcol,cl
  Mov ColorOffset,0
  xor SI,SI
  lea SI , CurrentMovesRow
  xor di,di
  lea di,CurrentMovesColumn
  xor ax,ax
  notextraval:
  ; pawn movements
  ;!pawn
    cmp bl,"p"
    jne notphelp
    mov cl,temprow
    cmp cl,0
    je notphelp
    jmp isp
    notphelp:
    jmp notp
    isp:
    dec getrow
    pusha
      CAll far ptr getCellData
    popa
    cmp currPiece,"*"
    jne notEmpty1
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    inc si
    mov [di],ch
    inc di
    push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
    dec getrow
    ;pusha
    cmp getrow,4
    jne noextramove1
    pusha
    CALL FAR PTR getCellData
    popa
    cmp currPiece,'*'
    jne noextramove1
    mov cl,getrow
    mov ch,getCol
    mov [si],cl
    inc si
    mov [di],ch
    inc di
    push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
    noextramove1:
    ;popa
    inc getrow
    notEmpty1:
    dec getcol
    ; overflow
    cmp getcol,-1
    je alliep1
    pusha
    CAll far ptr getCellData
    popa
    cmp currPiece,"*"
    je alliep1
    cmp currPiece,"R"
    JA alliep1 
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    inc si
    mov [di],ch
    inc di
    push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
    alliep1:
    inc getcol
    inc getcol
    ; overflow
    cmp getcol,8
    je notp

    pusha
    CAll far ptr getCellData
    popa
    cmp currPiece,"*"
    je alliep2
    cmp currPiece,"R"
    JA alliep2
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
    alliep2:
    jmp flagNoPiece 
    
    notp:
    

  ;!rock
    cmp bl,"r"
    jne notrhelp
    jmp yesr
    notrhelp:
    jmp notr
    yesr:


    ;? Checked 
    dec getrow
    checkupr:
    mov cl,getrow
    cmp cl,-1
    je noUphelpr
    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'a'
    jg noUphelpr
    cmp currPiece,'*'
    jne enemyr
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
    dec getrow
    jmp notenemyr
    enemyr:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
    jmp notupr
    ; change color ya ali
    notenemyr:
    jmp checkupr
    ;jmp notupr 
    noUphelpr:

    notupr:





    ;?Checked 

      mov cl , temprow
      mov getrow , cl
      inc getrow

      checkdownr:
      mov cl,getrow
      cmp cl,8
      je nodownhelpr
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg nodownhelpr
      cmp currPiece,'*'
      jne enemyrd
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      inc getrow
      jmp notenemyrd
      enemyrd:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notdownr
      ; change color ya ali
      notenemyrd:
      jmp checkdownr
      ;jmp notupr 
      nodownhelpr:

      notdownr:


      ;?Checked
      mov cl , temprow
      mov getrow , cl


      dec getcol


      checkleftr:
      mov cl,getCol
      cmp cl,-1
      je nolefthelpr
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg nolefthelpr
      cmp currPiece,'*'
      jne enemyrl
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      inc si
      inc di
      dec getCol
      jmp notenemyrl
      enemyrl:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notleftr
      ; change color ya ali
      notenemyrl:
      jmp checkleftr
      ;jmp notupr 
      nolefthelpr:

      notleftr:




      mov cl , temprow
      mov getrow , cl

      mov cl,tempcol
      mov getcol , cl


      inc getcol


      checkrightr:
      mov cl,getCol
      cmp cl,8
      je norighthelpr
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg norighthelpr
      cmp currPiece,'*'
      jne enemyrr
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      inc getCol
      jmp notenemyrr
      enemyrr:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notrightr
      ; change color ya ali
      notenemyrr:
      jmp checkrightr
      ;jmp notupr 
      norighthelpr:

      notrightr:
      jmp flagNoPiece


    notr:

  ;!bishop
    cmp bl,"b"
    jne notbishophelp
    jmp bishopb
    notbishophelp:
    jmp notb
    bishopb:
    dec getrow
    inc getcol

    diagonalUp:
    mov cl,getrow
      cmp cl,-1
      je nodiagonalUp
    mov cl,getCol
      cmp cl,8
      je nodiagonalUp 


      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg nodiagonalUp
      cmp currPiece,'*'
      jne enemybu
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      dec getrow
      inc getCol
      jmp notenemybu
      enemybu:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notdiagonalupb
      ; change color ya ali
      notenemybu:
      jmp diagonalUp
      ;jmp notupr 
      nodiagonalUp:

      notdiagonalupb:








    mov cl,tempcol
    mov getCol,cl

    mov cl,temprow
    mov getrow,cl


    dec getrow
    dec getcol

    diagonalUpl:
    mov cl,getrow
      cmp cl,-1
      je nodiagonalUpl
    mov cl,getCol
      cmp cl,-1
      je nodiagonalUpl 


      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg nodiagonalUpl
      cmp currPiece,'*'
      jne enemybul
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      dec getrow
      dec getCol
      jmp notenemybul
      enemybul:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notdiagonalupbl
      ; change color ya ali
      notenemybul:
      jmp diagonalUpl
      ;jmp notupr 
      nodiagonalUpl:

      notdiagonalupbl:













    mov cl,tempcol
    mov getCol,cl

    mov cl,temprow
    mov getrow,cl


    inc getrow
    inc getcol

    diagonalDown:
    mov cl,getrow
      cmp cl,8
      je nodiagonalDown
    mov cl,getCol
      cmp cl,8
      je nodiagonalDown 


      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg nodiagonalDown
      cmp currPiece,'*'
      jne enemybd
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      inc getrow
      inc getCol
      jmp notenemybd
      enemybd:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notdiagonalDownb
      ; change color ya ali
      notenemybd:
      jmp diagonalDown
      ;jmp notupr 
      nodiagonalDown:

      notdiagonalDownb:





    mov cl,tempcol
    mov getCol,cl

    mov cl,temprow
    mov getrow,cl


    inc getrow
    dec getcol

    diagonalDownl:
    mov cl,getrow
      cmp cl,8
      je nodiagonalDownl
    mov cl,getCol
      cmp cl,-1
      je nodiagonalDownl


      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg nodiagonalDownl
      cmp currPiece,'*'
      jne enemybdl
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      inc getrow
      dec getCol
      jmp notenemybdl
      enemybdl:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notdiagonalDownbl
      ; change color ya ali
      notenemybdl:
      jmp diagonalDownl
      ;jmp notupr 
      nodiagonalDownl:

      notdiagonalDownbl:
      jmp flagNoPiece

    notb:


  ;!queen
    cmp bl,'q'
    jne notqhelp
    jmp yesq
    notqhelp:
    jmp notq
    yesq:



    dec getrow
    checkupq:
    mov cl,getrow
    cmp cl,-1
    je noUphelpq
    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'a'
    jg noUphelpq
    cmp currPiece,'*'
    jne enemyq
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
    dec getrow
    jmp notenemyq
    enemyq:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
    jmp notupq
    ; change color ya ali
    notenemyq:
    jmp checkupq
    ;jmp notupr 
    noUphelpq:

    notupq:








    ;?Checked 

      mov cl , temprow
      mov getrow , cl
      inc getrow

      checkdownq:
      mov cl,getrow
      cmp cl,8
      je nodownhelpq
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg nodownhelpq
      cmp currPiece,'*'
      jne enemyqd
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      inc getrow
      jmp notenemyqd
      enemyqd:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notdownq
      ; change color ya ali
      notenemyqd:
      jmp checkdownq
      ;jmp notupr 
      nodownhelpq:

      notdownq:


      ;?Checked
      mov cl , temprow
      mov getrow , cl


      dec getcol


      checkleftq:
      mov cl,getCol
      cmp cl,-1
      je nolefthelpq
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg nolefthelpq
      cmp currPiece,'*'
      jne enemyql
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      dec getCol
      jmp notenemyql
      enemyql:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notleftq
      ; change color ya ali
      notenemyql:
      jmp checkleftq
      ;jmp notupr 
      nolefthelpq:

      notleftq:




      mov cl , temprow
      mov getrow , cl

      mov cl,tempcol
      mov getcol , cl


      inc getcol


      checkrightq:
      mov cl,getCol
      cmp cl,8
      je norighthelpq
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg norighthelpq
      cmp currPiece,'*'
      jne enemyqr
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      inc getCol
      jmp notenemyqr
      enemyqr:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notrightq
      ; change color ya ali
      notenemyqr:
      jmp checkrightq
      ;jmp notupr 
      norighthelpq:

      notrightq:











    mov cl,tempcol
    mov getCol,cl
    mov cl,getrow
    mov getrow,cl
    dec getrow
    inc getcol

    diagonalUpq:
    mov cl,getrow
      cmp cl,-1
      je nodiagonalUpq
    mov cl,getCol
      cmp cl,8
      je nodiagonalUpq 


      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg nodiagonalUpq
      cmp currPiece,'*'
      jne enemyqu
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      dec getrow
      inc getCol
      jmp notenemyqu
      enemyqu:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notdiagonalupq
      ; change color ya ali
      notenemyqu:
      jmp diagonalUpq
      ;jmp notupr 
      nodiagonalUpq:

      notdiagonalupq:








    mov cl,tempcol
    mov getCol,cl

    mov cl,temprow
    mov getrow,cl


    dec getrow
    dec getcol

    diagonalUplq:
    mov cl,getrow
      cmp cl,-1
      je nodiagonalUplq
    mov cl,getCol
      cmp cl,-1
      je nodiagonalUplq 


      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg nodiagonalUplq
      cmp currPiece,'*'
      jne enemyqul
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      dec getrow
      dec getCol
      jmp notenemyqul
      enemyqul:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notdiagonalupql
      ; change color ya ali
      notenemyqul:
      jmp diagonalUplq
      ;jmp notupr 
      nodiagonalUplq:

      notdiagonalupql:













    mov cl,tempcol
    mov getCol,cl

    mov cl,temprow
    mov getrow,cl


    inc getrow
    inc getcol

    diagonalDownq:
    mov cl,getrow
      cmp cl,8
      je nodiagonalDownq
    mov cl,getCol
      cmp cl,8
      je nodiagonalDownq 


      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg nodiagonalDownq
      cmp currPiece,'*'
      jne enemyqdd
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      inc getrow
      inc getCol
      jmp notenemyqdd
      enemyqdd:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notdiagonalDownq
      ; change color ya ali
      notenemyqdd:
      jmp diagonalDownq
      ;jmp notupr 
      nodiagonalDownq:

      notdiagonalDownq:






    mov cl,tempcol
    mov getCol,cl

    mov cl,temprow
    mov getrow,cl


    inc getrow
    dec getcol

    diagonalDownlq:
    mov cl,getrow
      cmp cl,8
      je nodiagonalDownlq
    mov cl,getCol
      cmp cl,-1
      je nodiagonalDownlq


      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg nodiagonalDownlq
      cmp currPiece,'*'
      jne enemyqdl
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      inc getrow
      dec getCol
      jmp notenemyqdl
      enemyqdl:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notdiagonalDownlq
      ; change color ya ali
      notenemyqdl:
      jmp diagonalDownlq
      ;jmp notupr 
      nodiagonalDownlq:

    notdiagonalDownlq:
    jmp  flagNoPiece


  notq:


  ;!King

    cmp bl,'k'
    jne notkhelp
    jmp yesk
    notkhelp:
    jmp notk
    yesk:

    dec getrow
    
    mov cl,getrow
    cmp cl,-1
    je noUphelpk
    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'a'
    jg noUphelpk
    cmp currPiece,'*'
    jne enemyk
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
    dec getrow
    jmp notenemyk
    enemyk:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      ; change color ya ali
    notenemyk:
      ;jmp notupr 
    noUphelpk:

    notupk:


    mov cl,temprow
    mov getrow,cl
    mov cl,tempcol
    mov getcol,cl

    dec getrow
    inc getCol

    mov cl,getrow
    cmp cl,-1
    je nodiagonalRhelpk
    mov ch,getCol
    cmp ch,8
    je nodiagonalRhelpk
    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'a'
    jg nodiagonalRhelpk
    cmp currPiece,'*'
    jne enemyDRk
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
    dec getrow
    inc getCol
    jmp notenemyDRk
    enemyDRk:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      ; change color ya ali
    notenemyDRK:
      ;jmp notupr 
    nodiagonalRhelpk:

    notdiagonalRk:
    ; moving by the diagonal


    mov cl,temprow
    mov getrow,cl
    mov cl,tempcol
    mov getcol,cl

    dec getrow
    dec getCol

    mov cl,getrow
    cmp cl,-1
    je nodiagonalLhelpk
    mov ch,getCol
    cmp ch,-1
    je nodiagonalLhelpk
    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'a'
    jg nodiagonalLhelpk
    cmp currPiece,'*'
    jne enemyDLk
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
    dec getrow
    dec getCol
    jmp notenemyDLk
    enemyDLk:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      ; change color ya ali
    notenemyDLK:
      ;jmp notupr 
    nodiagonalLhelpk:

    notdiagonalLk:
    ; moving by the diagonal



    mov cl,temprow
    mov getrow,cl
    mov cl,tempcol
    mov getcol,cl

    inc getrow
    inc getCol

    mov cl,getrow
    cmp cl,8
    je nodiagonalDLhelpk
    mov ch,getCol
    cmp ch,8
    je nodiagonalDLhelpk
    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'a'
    jg nodiagonalDLhelpk
    cmp currPiece,'*'
    jne enemyDDLk
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
    inc getrow
    inc getCol
    jmp notenemyDDLk
    enemyDDLk:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      ; change color ya ali
    notenemyDDLK:
      ;jmp notupr 
    nodiagonalDLhelpk:

    notdiagonalDLk:
    ; moving by the diagonal

    mov cl,temprow
    mov getrow,cl
    mov cl,tempcol
    mov getcol,cl

    inc getrow
    dec getCol

    mov cl,getrow
    cmp cl,8
    je nodiagonalDLhelpkd
    mov ch,getCol
    cmp ch,-1
    je nodiagonalDLhelpkd
    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'a'
    jg nodiagonalDLhelpkd
    cmp currPiece,'*'
    jne enemyDDLkd
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
    inc getrow
    dec getCol
    jmp notenemyDDLkd
    enemyDDLkd:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      ; change color ya ali
    notenemyDDLKd:
      ;jmp notupr 
    nodiagonalDLhelpkd:

    notdiagonalDLkd:
    

    mov cl,temprow
    mov getrow,cl
    mov cl,tempcol
    mov getcol,cl
    inc getrow
    
    mov cl,getrow
    cmp cl,8
    je noDownhelpk
    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'a'
    jg noDownhelpk
    cmp currPiece,'*'
    jne enemykd
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
    inc getrow
    jmp notenemykd
    enemykd:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      ; change color ya ali
    notenemykd:
      ;jmp notupr 
    noDownhelpk:

    notDownk:




    mov cl,temprow
    mov getrow,cl
    mov cl,tempcol
    mov getcol,cl


    inc getCol
    
    mov cl,getCol
    cmp cl,8
    je noRighthelpk
    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'a'
    jg noRighthelpk
    cmp currPiece,'*'
    jne enemykr
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
    inc getCol
    jmp notenemykr
    enemykr:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      ; change color ya ali
    notenemykr:
      ;jmp notupr 
    noRighthelpk:

    notRightk:




    mov cl,temprow
    mov getrow,cl
    mov cl,tempcol
    mov getcol,cl


    dec getCol
    
    mov cl,getCol
    cmp cl,-1
    je noLefthelpk
    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'a'
    jg noLefthelpk
    cmp currPiece,'*'
    jne enemykl
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
    dec getCol
    jmp notenemykl
    enemykl:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
      ; change color ya ali
    notenemykl:
      ;jmp notupr 
    noLefthelpk:

    notLeftk:
      jmp flagNoPiece




    notk:

  ;! Horse
      cmp bl,"h"
      jne nothhelp
      jmp yesh
      nothhelp:
      jmp noth
      yesh:
      
      ; mov cl,temprow
      ; mov getrow,cl
      ; mov cl,tempcol
      ; mov getcol,cl

      dec getrow
      dec getrow
      inc getCol


      mov cl,getrow
      cmp cl,-1
      je nodiagonalRhelph

      mov cl,getrow
      cmp cl,-2
      je nodiagonalRhelph

    
      mov ch,getCol
      cmp ch,8
      je nodiagonalRhelph
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg nodiagonalRhelph
      cmp currPiece,'*'
      jne enemyDRh
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notenemyDRh
      enemyDRh:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
        ; change color ya ali
      notenemyDRh:
        ;jmp notupr 
      nodiagonalRhelph:

      notdiagonalRh:
      


      ;2nd part
      mov cl,temprow
      mov getrow,cl
      mov cl,tempcol
      mov getcol,cl

      dec getrow
      dec getrow
      dec getCol

      mov cl,getrow
      cmp cl,-1
      je nodiagonalRhelph1
      mov cl,getrow
      cmp cl,-2
      je nodiagonalRhelph1
      mov ch,getCol
      cmp ch,-1
      je nodiagonalRhelph1
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg nodiagonalRhelph1
      cmp currPiece,'*'
      jne enemyDRh1
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si

      inc getrow
      inc getrow
      inc getCol
      jmp notenemyDRh1
      enemyDRh1:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
        ; change color ya ali
      notenemyDRh1:
        ;jmp notupr 
      nodiagonalRhelph1:

      notdiagonalRh1:
      
        
      mov cl,temprow
      mov getrow,cl
      mov cl,tempcol
      mov getcol,cl

      inc getrow
      inc getrow
      dec getCol

      mov cl,getrow
      cmp cl,8
      je nodiagonalRhelph2
      mov cl,getrow
      cmp cl,9
      je nodiagonalRhelph2
      mov ch,getCol
      cmp ch,-1
      je nodiagonalRhelph2
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      ja nodiagonalRhelph2
      cmp currPiece,'*'
      jne enemyDRh2
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notenemyDRh2
      enemyDRh2:
      ;mov ch,getcol
      ;mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
        ; change color ya ali
      notenemyDRh2:
        ;jmp notupr 
      nodiagonalRhelph2:

      notdiagonalRh2:



      mov cl,temprow
      mov getrow,cl
      mov cl,tempcol
      mov getcol,cl

      inc getrow
      inc getrow
      inc getCol

      mov cl,getrow
      cmp cl,8
      je nodiagonalRhelph3
      mov cl,getrow
      cmp cl,9
      je nodiagonalRhelph3
      mov ch,getCol
      cmp ch,8
      je nodiagonalRhelph3
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      ja nodiagonalRhelph3
      cmp currPiece,'*'
      jne enemyDRh3
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
      push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
    
      jmp notenemyDRh3
      enemyDRh3:
      ;mov ch,getcol
      ;mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
      push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
        ; change color ya ali
      notenemyDRh3:
        ;jmp notupr 
      nodiagonalRhelph3:

      notdiagonalRh3:

      
      mov cl,temprow
      mov getrow,cl
      mov cl,tempcol
      mov getcol,cl

      inc getrow
      dec getCol
      dec getCol
      mov cl,getCol
      cmp cl,-1
      je nodiagonalRhelph4
      mov ch,getCol
      cmp ch,-2
      je nodiagonalRhelph4
      mov cl,getrow
      cmp cl,8
      je nodiagonalRhelph4
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      ja nodiagonalRhelph4
      cmp currPiece,'*'
      jne enemyDRh4
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
    
      jmp notenemyDRh4
      enemyDRh4:
      ;mov ch,getcol
      ;mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
        ; change color ya ali
      notenemyDRh4:
        ;jmp notupr 
      nodiagonalRhelph4:

      notdiagonalRh4:



      mov cl,temprow
      mov getrow,cl
      mov cl,tempcol
      mov getcol,cl

      dec getrow
      inc getCol
      inc getCol
      mov cl,getCol
      cmp cl,9
      je nodiagonalRhelph5
      mov ch,getCol
      cmp ch,8
      je nodiagonalRhelph5
      mov cl,getrow
      cmp cl,-1
      je nodiagonalRhelph5
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'a'
      jg nodiagonalRhelph5
      cmp currPiece,'*'
      jne enemyDRh5
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
      push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
    
      jmp notenemyDRh5
      enemyDRh5:
      ;mov ch,getcol
      ;mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
        ; change color ya ali
      notenemyDRh5:
        ;jmp notupr 
      nodiagonalRhelph5:

      notdiagonalRh5:

      mov cl,temprow
      mov getrow,cl



      mov ch,tempcol
      mov getcol,ch

      dec getrow
      dec getCol
      dec getCol


      mov cl,getCol
      cmp cl,-1
      je nodiagonalRhelph7

      mov cl,getrow
      cmp cl,-1
      je nodiagonalRhelph7

      mov ch,getCol
      cmp ch,-2
      je nodiagonalRhelph7


      pusha
        Call FAR PTR getCellData
      popa


      
        cmp currPiece,'a'
        jg nodiagonalRhelph7
        cmp currPiece,'*'
        jne enemyDRh7
        mov ch,getcol
        mov cl,getrow
        mov [si],cl
        mov [di],ch
        inc si
        inc di
         push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      
      jmp notenemyDRh7
      enemyDRh7:
      ;mov ch,getcol
      ;mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
        ; change color ya ali
      notenemyDRh7:
        ;jmp notupr 
      nodiagonalRhelph7:

      notdiagonalRh7:

      pusha
        mov cl,temprow
        mov getrow,cl
        mov ch,tempcol
        mov getcol,ch
      popa

      add getcol,2
      inc getrow


      mov cl,getCol
      cmp cl,8
      je nodiagonalRhelph8
      mov cl,getCol
      cmp cl,9
      je nodiagonalRhelph8
      mov cl,getrow
      cmp cl,8
      je nodiagonalRhelph8
      ;? error here ch and cl 
      mov ch,getCol
      cmp ch,9
      je nodiagonalRhelph8
      pusha
        Call FAR PTR getCellData
      popa
        cmp currPiece,'a'
        ja nodiagonalRhelph8
        cmp currPiece,'*'
        jne enemyDRh8
        mov ch,getcol
        mov cl,getrow
        mov [si],cl
        mov [di],ch
        inc si
        inc di
          push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0eh
    mov [si],cx
    inc ColorOffset
    pop si
      jmp notenemyDRh8
      enemyDRh8:
      ;mov ch,getcol
      ;mov cl,getrow
        mov [si],cl
        mov [di],ch
        inc si
        inc di
         push si
    lea si,CurrentMovesColors
    add si,ColorOffset
    mov cx,0ch
    mov [si],cx
    inc ColorOffset
    pop si
        ; change color ya ali
      notenemyDRh8:
        ;jmp notupr 
      nodiagonalRhelph8:

      notdiagonalRh8:

      



    
    noth:
  
  flagNoPiece:
  mov P1validateBool,0
  
  ret
GetAvaliableMoves ENDP











HighlighCells PROC FAR

;cmp Highlighted1bool,1
;je exitHighlighCells
xor SI,SI
lea SI, CurrentMovesRow
lea di,CurrentMovesColumn

mov ColorOffset,0

LoopHighlight:

mov cl,[di]
cmp cl,"|"
je exitHighlighCells

mov ax,0
mov bx,0

mov bl,[si]
mov al,[di]
push si
lea si,CurrentMovesColors
  add si,ColorOffset
  mov dx,[si]
  inc ColorOffset  
pop si
;mov dx,0eh
pusha
CALL FAR PTR drawBorder
popa
xor ax,ax
xor bx,bx
inc si
inc di 
;mov Highlighted1bool,1
jmp LoopHighlight

exitHighlighCells:

ret
HighlighCells ENDP


freeClipboard1 Proc far
  cmp clipBoardP1,'*'
  je notFCP1
  cmp CurrentMovesColumn,'|'
  je FCP1
  jmp notFCP1
  FCP1:
  Mov clipBoardP1,'*'
  notFCP1:
  ret
  freeClipboard1 EndP



releaseClipBoard1 proc far


  ;* check the input of the user if enter 
  ;* contiue for the checking phase
  ;* checking phase:
  ;* get the p1 current row and col and check if this move is valid 
  ;* if it is not valid remove the highlighting 

  cmp clipBoardP1 ,"*"
  je exitRelease1help
  jmp notexitrelease
  exitRelease1help:
  jmp exitRelease1
  notexitrelease:

  

  mov cl,Player1square
  mov ch,Player1square[1]

  cmp cl,clipBoardP1[1]
  je compare2ndr

  jmp normalRealase 
  compare2ndr:
  cmp ch, clipBoardP1[2]
  je exitRelease1helpp2
  
  jmp notexitRelease1helpp2
  exitRelease1helpp2:
  jmp exitRelease1
  notexitRelease1helpp2:


  normalRealase:
  mov ah,01h
  int 16h


  cmp ah,62
  je f4conditionRel
  jmp ContinueRel

  f4conditionRel:
  mov f4bool,1
  mov SendingStatus,'#'
  jmp exitRelease1 

  ContinueRel:

  cmp ah,68
  jne exitRelease1help11
  jmp notexitrelease11
  exitRelease1help11:
  jmp exitRelease1
  notexitrelease11:


  pusha
  
    mov cl,7
    mov al,clipBoardP1[1]
    ; row to be sent
    sub cl,al
    mov p1SendInitS,cl
    mov cl,7
    mov al,clipBoardP1[2]
    ; column to be sent
    sub cl,al
    mov p1SendInitS[1],cl



    mov al,Player1square
    mov cl,7
    sub cl,al
    mov p1SendInitS[2],cl

  
    mov cl,7
    mov al,Player1square[1]
    sub cl,al
    mov p1SendInitS[3],cl


  popa   

  mov cl,Player1square
  mov getrow,cl
  mov cl,Player1square[1]
  mov getCol,cl

  

  lea di,CurrentMovesRow
  lea si,CurrentMovesColumn
  mov cl,getrow
  mov ch,getcol
  rc1:
  cmp cl,[di]
  je cmpr2
  jmp notcmpr2
  
  cmpr2:
  cmp ch,[si]
  je mov1
  notcmpr2:
  inc si
  inc di
  mov al,[si]
  cmp al,'|'
  je exitandreset1help
  mov al,[di]
  cmp al,'|'
  je exitandreset1help
  jmp rc1
  jmp notexitandreset1
  exitandreset1help:
  jmp exitandreset1
  notexitandreset1:
  mov1:

  mov SendingStatus,'&'
  mov SendingNumber, 4
  ; cmp clipBoardP2,'*'
  ;je contttr2
  mov P2validateBool,1

  contttr2:

  pusha
  call far ptr GetTimeFromInterrupt
  popa
  

  pusha
  mov cl,getrow
  mov timerow,cl
  mov ch,getcol
  mov timecol,ch
  CALL FAR PTR SetCellTime
  mov cx,SystemTime
  add cx,3
  mov bx,timebrush
  mov [bx],cx
  popa
  

  mov cl,getrow
  mov brushRow,cl

  mov ch,getCol
  mov brushCol,ch

  cmp clipBoardP2,'*'
  je ppp
  mov cl,getrow
  mov ch,getcol
  cmp cl,clipBoardP2[1] 
  jne ppp
  cmp ch,clipBoardP2[2]
  jne ppp
  pusha
    CALL FAR PTR ClearHighlighted2
  popa

  pusha
    Call Far ptr resetcurrentmoves2
  popa

  mov clipBoardP2,'*'
  mov P2validateBool,0
  ppp:

  cmp clipBoardP1,'k'
  jne proceed
  pusha
  mov q1,cl
  mov q1[1],ch
  popa
  proceed:
  pusha
  call far ptr SetBrush
  popa

  pusha
  CALL FAR PTR getCellData
  mov cl,currPiece
  mov GraveP2,cl
  popa

  mov bx,brush
  mov cl,clipBoardP1
  mov[bx],cl
  
  mov cl,clipBoardP1[1]
  mov brushRow,cl
  mov getrow,cl
  mov cl,clipBoardP1[2]
  mov brushCol,cl
  mov getcol,cl
  call far ptr SetBrush
  
  pusha
  CALL FAR PTR getCellData
  popa 

  pusha
   
  mov dl,currColor
  mov dh,00h
  mov bl,getrow
  mov bh,00h
  mov al,getCol
  mov ah,0
  mov si,0
  CALL FAR PTR drawSingleCell
  popa 
  mov bx,brush
  mov cl,'*'
  mov [bx],cl
    pusha
  mov dl,currColor
  mov dh,00h
  mov bl,brushRow
  mov bh,00h
  mov al,brushCol
  mov ah,0
  mov si,0
  CALL FAR PTR drawSingleCell
  popa   

   pusha
   call far ptr checkmateP1
  popa

  ; pusha
  ;  call far ptr checkmateP2
  ; popa


  exitandreset1:
  pusha
  CALL FAR PTR ClearHighlighted1
  popa
  Call Far ptr resetcurrentmoves1

  exitRelease1:
    ; push ax
    ;   cmp Clearbool,1
    ;   je clrf2
    ;   jmp notclrf2
    ;   clrf2:
    ;   mov ah,0ch
    ;   mov al,0
    ;   int 21h
    ;   mov Clearbool,0
    ;   notclrf2: 
    ; pop ax  


    push ax
                mov ah,0ch
                mov al,0
                int 21h
                pop ax 

  ret
  releaseClipBoard1 ENDP










;? true
resetcurrentmoves1 proc far
xor si,si
lea si,CurrentMovesColumn
lea di,CurrentMovesRow
mov cl,delmoves
mov al,31


deleting: 
mov [si],cl
mov [di],cl
inc si
inc di
dec al
jnz deleting


exitReset1:
CMP P1validateBool,1
JE NNN
mov clipBoardP1,'*'
NNN:
ret
resetcurrentmoves1 endp



resetcurrentmoves2 proc far
xor si,si
lea si,CurrentMovesColumn2
lea di,CurrentMovesRow2
mov cl,delmoves
mov al,31


deleting2: 
mov [si],cl
mov [di],cl
inc si
inc di
dec al
jnz deleting2


exitReset2:
CMP P2validateBool,1
JE NNN2
mov clipBoardP2,'*'
NNN2:
ret

resetcurrentmoves2 endp



;? true
SetBrush Proc far
  lea si,Pieces
  mov brush,si
  cmp brushRow,0
  je getcolbrush
  mov cl,brushRow
  loopbrusho:
  mov ch,8
  loopbrushi:
  inc brush
  dec ch
  jnz loopbrushi
  dec cl
  jnz loopbrusho
  getcolbrush:
  mov cl,brushCol
  cmp brushCol,0
  je exitbrush
  loopbrushc:
  inc brush
  dec cl
  jnz loopbrushc
  exitbrush: 
  ret 
  SetBrush ENDP




ClearHighlighted1 PROC far
lea si,CurrentMovesColumn
lea di,CurrentMovesRow

loopclearhighlight:
mov cl,[si]
mov ch,[di]
mov getcol,cl
mov getrow,ch
pusha
CALL FAR PTR getCellData
popa
pusha
mov dl,currColor 
mov dh,0
mov bl,getrow
mov bh,0
mov al,getcol
mov ah,0
mov si,0
CALL FAR PTR drawSingleCell
popa
inc si
inc di
mov al,[si]
  cmp al,'|'
  je clearhighlight
  mov al,[di]
  cmp al,'|'
  je clearhighlight
  jmp loopclearhighlight
  clearhighlight:
  Call Far PTR drawPlayer1
ret
ClearHighlighted1 ENDP


ClearHighlighted2 PROC far
lea si,CurrentMovesColumn2
lea di,CurrentMovesRow2

loopclearhighlight2:
mov cl,[si]
mov ch,[di]
mov getcol,cl
mov getrow,ch
pusha
CALL FAR PTR getCellData
popa
pusha
mov dl,currColor 
mov dh,0
mov bl,getrow
mov bh,0
mov al,getcol
mov ah,0
mov si,0
CALL FAR PTR drawSingleCell
popa
inc si
inc di
mov al,[si]
  cmp al,'|'
  je clearhighlight2
  mov al,[di]
  cmp al,'|'
  je clearhighlight2
  jmp loopclearhighlight2
  clearhighlight2:
  ; Call Far PTR drawPlayer2
ret
ClearHighlighted2 ENDP


GetTimeFromInterrupt Proc Far
  mov ah,2Ch
  int 21h

  mov SystemTime,0
  cmp cl,0
  je cornerCase
  jne CalculateNormal


  cornerCase:
  mov ax,3600
  jmp addSecondsOnly

  CalculateNormal:
  xor ax,ax
  mov al,cl
  mov cl,60
  mul cl

  addSecondsOnly:
  mov cl,8

  
  shr dx,cl
  add ax,dx
  add SystemTime,ax
  ret
  GetTimeFromInterrupt ENDP



SetCellTime Proc far
  lea si,Time
  mov timebrush,si
  cmp timerow,0
  je getcolbrusht
  mov cl,timerow
  loopbrushot:
  mov ch,8
  loopbrushit:
  inc timebrush
  inc timebrush
  dec ch
  jnz loopbrushit
  dec cl
  jnz loopbrushot
  getcolbrusht:
  mov cl,timecol
  cmp timecol,0
  je exitbrusht
  loopbrushct:
  inc timebrush
  inc timebrush
  dec cl
  jnz loopbrushct
  exitbrusht: 
  ret 
  SetCellTime ENDP

  FreeCell PROC FAR
  CALl FAR PTR GetTimeFromInterrupt
  mov cl,0 ;row
  freeo:
  mov ch,0 ;col
  freei:
  pusha
  mov getcol,ch
  mov getrow,cl
  call FAR PTR getCellData
  popa
  mov ax,currTime
  cmp ax,0
  je notfreecell1


  pusha
  sub ax,SystemTime
  cmp ax,3600
  ja SystemTimeAddition
  jmp notAddition
  SystemTimeAddition:
  add SystemTime,3600
  notAddition:
  popa
; handling time interferance
  cmp ax,SystemTime
  jbe freecell1
  jmp notfreecell1
  freecell1:
  mov timerow,cl
  mov timecol,ch
  pusha
    CAll FAR PTR SetCellTime
  popa
  mov bx,timebrush
  mov si,0000h
  mov [bx],si
  pusha
  mov dl,currColor
  mov dh,00h
  mov bl,timerow
  mov bh,00h
  mov al,timecol
  mov ah,0
  mov si,0
  CALL FAR PTR drawSingleCell
  popa
  pusha
  mov al,cl
  mov ah,ch
  mov getrow,al
  mov getCol,ah
  MOV drawRow,al
  mov drawCol,ah
  Call Far PTR getCellData
  mov al,currPiece
  mov drawOnePieceVar,al
  Call Far PTR DrawOnePiece
  popa
  notfreecell1:
  inc ch
  cmp ch,8
  jne freeihelp
  jmp notfreei
  freeihelp:
  jmp freei
  notfreei:
  inc cl
  cmp cl,8
  jne freeohelp
  jmp notfreeo
  freeohelp:
  jmp freeo
  notfreeo:
  ret 
  FreeCell ENDP

CheckGameOver Proc FAR
  ; checks if the last player killed is a king the game is over
  cmp GraveP2,'*'
  je p1gravecheck
  cmp GraveP2,'K'
  je p1wins
  p1gravecheck:
  cmp GraveP1,'*'
  je notgameoverhelp
  jmp yesgameover
  notgameoverhelp:
  jmp notgameover
  yesgameover:
  cmp GraveP1,'k'
  je p2winshelp
  jmp nop2wins
  p2winshelp:
  jmp p2wins
  nop2wins:
  jmp notgameover
  p1wins:
  mov GraveP2,'*'
  mov Player1WinsBool,1
  CALL FAR PTR InitialiseStatusBar
  mov  dl, 30   ;Column
  mov  dh, 21   ;Row
  mov  bh, 0    ;Display page
  mov  ah, 02h  ;SetCursorPosition
  int  10h


mov  al, 'W'
mov  bl, 0ah  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'I'
mov  bl, 0ah  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'N'
mov  bl, 0ah  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'S'
mov  bl, 0ah  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

  mov  dl, 0   ;Column
  mov  dh, 21   ;Row
  mov  bh, 0    ;Display page
  mov  ah, 02h  ;SetCursorPosition
  int  10h


mov  al, 'L'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'O'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'S'
mov  bl, 03h  
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'E'
mov  bl, 03h  
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'S'
mov  bl, 03h  
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

  jmp notgameover
  p2wins:
    mov GraveP1,'*'
  mov Player2WinsBool,1

  CALL FAR PTR InitialiseStatusBar
 mov  dl, 30   ;Column
  mov  dh, 21   ;Row
  mov  bh, 0    ;Display page
  mov  ah, 02h  ;SetCursorPosition
  int  10h




mov  al, 'L'
mov  bl, 0ah  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'O'
mov  bl, 0ah  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'S'
mov  bl, 0ah  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'E'
mov  bl, 0ah  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'S'
mov  bl, 0ah  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

   mov  dl, 0   ;Column
  mov  dh, 21   ;Row
  mov  bh, 0    ;Display page
  mov  ah, 02h  ;SetCursorPosition
  int  10h




mov  al, 'W'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'I'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'N'
mov  bl, 03h  
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'S'
mov  bl, 03h  
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h


  notgameover:
  ret
  CheckGameOver ENDP
  DrawOnePiece PROC FAR
mov al,drawOnePieceVar
cmp al , 'R'
jnz not_white_rook1
mov curr_draw,offset WROOK
CALL FAR PTR DrawPiece
not_white_rook1:
cmp al , 'r'
jnz not_black_rook1
mov curr_draw,offset BROOK
CALL FAR PTR DrawPiece
not_black_rook1:
cmp al , 'h'
jnz not_black_knight1
mov curr_draw,offset BKNIGHT
CALL FAR PTR DrawPiece
not_black_knight1:
cmp al , 'H'
jnz not_white_knight1
mov curr_draw,offset WKNIGHT
CALL FAR PTR DrawPiece
not_white_knight1:
cmp al , 'p'
jnz not_black_pawn1
mov curr_draw,offset BPAWN
CALL FAR PTR DrawPiece
not_black_pawn1:
cmp al , 'P'
jnz not_white_pawn1
mov curr_draw,offset WPAWN
CALL FAR PTR DrawPiece
not_white_pawn1:
cmp al , 'k'
jnz not_black_king1
mov curr_draw,offset BKING
CALL FAR PTR DrawPiece
not_black_king1:
cmp al , 'K'
jnz not_white_king1
mov curr_draw,offset WKING
CALL FAR PTR DrawPiece
not_white_king1:
cmp al , 'q'
jnz not_black_queen1
mov curr_draw,offset BQUEEN
CALL FAR PTR DrawPiece
not_black_queen1:
cmp al , 'Q'
jnz not_white_queen1
mov curr_draw,offset WQUEEN
CALL FAR PTR DrawPiece
not_white_queen1:
cmp al , 'b'
jnz not_black_bishop1
mov curr_draw,offset BBISHOP
CALL FAR PTR DrawPiece
not_black_bishop1:
cmp al , 'B'
jnz not_white_bishop1
mov curr_draw,offset WBISHOP
CALL FAR PTR DrawPiece
not_white_bishop1:
ret
DrawOnePiece ENDP
InitialiseStatusBar PROC FAR
  mov f4bool,0
  CALL FAR PTR GetTimeFromInterrupt
  mov ax,SystemTime
  mov playtime,ax



  mov dl,0fh
  mov dh,00h
  mov bl,8
  mov bh,00h
  mov al,6
  mov ah,0
  mov si,0
  CALL FAR PTR drawSingleCell

  mov dl,0fh
  mov dh,00h
  mov bl,9
  mov bh,00h
  mov al,6
  mov ah,0
  mov si,0
  CALL FAR PTR drawSingleCell

  mov dl,0fh
  mov dh,00h
  mov bl,8
  mov bh,00h
  mov al,7
  mov ah,0
  mov si,0
  CALL FAR PTR drawSingleCell

  mov dl,0fh
  mov dh,00h
  mov bl,9
  mov bh,00h
  mov al,7
  mov ah,0
  mov si,0
  CALL FAR PTR drawSingleCell

  mov dl,0fh
  mov dh,00h
  mov bl,8
  mov bh,00h
  mov al,0
  mov ah,0
  mov si,0
  CALL FAR PTR drawSingleCell

  mov dl,0fh
  mov dh,00h
  mov bl,9
  mov bh,00h
  mov al,0
  mov ah,0
  mov si,0
  CALL FAR PTR drawSingleCell

  mov dl,0fh
  mov dh,00h
  mov bl,8
  mov bh,00h
  mov al,1
  mov ah,0
  mov si,0
  CALL FAR PTR drawSingleCell

  mov dl,0fh
  mov dh,00h
  mov bl,9
  mov bh,00h
  mov al,1
  mov ah,0
  mov si,0
  CALL FAR PTR drawSingleCell



mov  dl, 30   ;Column
mov  dh, 20   ;Row
mov  bh, 0    ;Display page
mov  ah, 02h  ;SetCursorPosition
int  10h
 mov bp,8
 MOV SI, offset MyName
 inc si
 inc si
  mov DI, 30      ; Initial column position 
lop:
  ; Set cursor position
  MOV AH, 02h
  MOV BH, 00h    ; Set page number
  MOV DX, DI     ; COLUMN number in low BYTE
  MOV DH, 20      ; ROW number in high BYTE
  INT 10h
  LODSB          ; load current character from DS:SI to AL and increment SI
  CMP AL, 13    ; Is string-end reached?
  JE  fin        ; If yes, continue
  ; Print current char
  MOV AH,09H
  MOV BH, 0      ; Set page number
  MOV BL, 0ah     ; Color (RED)
  MOV CX, 1      ; Character count
  INT 10h
  INC DI 
  dec bp
  jz fin        ; Increase column position
  jmp lop
fin:



mov  al, ':'
mov  bl, 0ah  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  dl, 0   ;Column
mov  dh, 20   ;Row
mov  bh, 0    ;Display page
mov  ah, 02h  ;SetCursorPosition
int  10h

 mov bp,8
 MOV SI, offset OpName
  mov DI, 0      ; Initial column position 
lop2:
  ; Set cursor position
  MOV AH, 02h
  MOV BH, 00h    ; Set page number
  MOV DX, DI     ; COLUMN number in low BYTE
  MOV DH, 20      ; ROW number in high BYTE
  INT 10h
  LODSB          ; load current character from DS:SI to AL and increment SI
  CMP AL, 13    ; Is string-end reached?
  JE  fin2        ; If yes, continue
  ; Print current char
  MOV AH,09H
  MOV BH, 0      ; Set page number
  MOV BL, 0bh     ; Color (RED)
  MOV CX, 1      ; Character count
  INT 10h
  INC DI
  dec bp
  jz fin2         ; Increase column position
  jmp lop2
fin2:



mov  al, ':'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  dl, 17   ;Column
mov  dh, 24   ;Row
mov  bh, 0    ;Display page
mov  ah, 02h  ;SetCursorPosition
int  10h

mov  al, 'T'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h


mov  al, ':'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h
mov  al, '0'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, '0'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h


mov  al, ':'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, '0'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, '0'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h



              mov  dl, 20  ;Column
              mov  dh, 20   ;Row
              mov  bh, 0    ;Display page
              mov  ah, 02h  ;SetCursorPosition
              int  10h

              mov  al, '|'
              mov  bl, 03h  ;Color is red
              mov  bh, 0    ;Display page
              mov  ah, 0eh  ;Teletype
              int  10h

              inc dh

              mov  dl, 20  ;Column
              mov  bh, 0    ;Display page
              mov  ah, 02h  ;SetCursorPosition
              int  10h 

              mov  al, '|'
              mov  bl, 03h  ;Color is red
              mov  bh, 0    ;Display page
              mov  ah, 0eh  ;Teletype
              int  10h

              inc dh

              mov  dl, 20  ;Column
              mov  bh, 0    ;Display page
              mov  ah, 02h  ;SetCursorPosition
              int  10h 
              
              mov  al, '|'
              mov  bl, 03h  ;Color is red
              mov  bh, 0    ;Display page
              mov  ah, 0eh  ;Teletype
              int  10h

              inc dh

              mov  dl, 20  ;Column
              mov  bh, 0    ;Display page
              mov  ah, 02h  ;SetCursorPosition
              int  10h 
              
              mov  al, '|'
              mov  bl, 03h  ;Color is red
              mov  bh, 0    ;Display page
              mov  ah, 0eh  ;Teletype
              int  10h
              



 ret
InitialiseStatusBar ENDP

UpdateStatusBar PROC FAR
cmp GraveP1,'*'
je upP2
cmp GraveP1,'k'
je upP2
mov  dl, P1Status[1]   ;Column
mov  dh, P1Status   ;Row
mov  bh, 0    ;Display page
mov  ah, 02h  ;SetCursorPosition
int  10h


mov  al, GraveP1
mov  bl, 0ah  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov GraveP1,'*'
inc P1Status[1]
cmp P1Status[1],40
jne upP2
mov P1Status[1],30
inc P1Status
upP2:
cmp GraveP2,'*'
je noupdates
cmp GraveP2,'K'
je noupdates
mov  dl, P2Status[1]   ;Column
mov  dh, P2Status   ;Row
mov  bh, 0    ;Display page
mov  ah, 02h  ;SetCursorPosition
int  10h


mov  al, GraveP2
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h
mov GraveP2,'*'
inc P2Status[1]
cmp P2Status[1],10
jne noupdates
mov P2Status[1],0
inc P2Status
noupdates:
ret
UpdateStatusBar ENDP

InitialisePieces proc far
lea si,Pieces
lea di,OldPieces


cmp p1,0
jne normpiec

mov OldPieces[3],'K'
mov OldPieces[4],'Q'
mov OldPieces[59],'k'
mov OldPieces[60],'q'
mov q1[1],3
mov q2[1],3
normpiec:
mov ch,8

outerinit:
mov cl,8



innerinit:
mov al,[di]
mov [si],al
inc si
inc di
dec cl
jnz innerinit
dec ch
jnz outerinit



ret
InitialisePieces endp
RESETGAME PROC FAR
mov chatbool,0
mov playbool,0
mov gotdatabool,1
mov OldPieces[4],'K'
mov OldPieces[3],'Q'
mov OldPieces[60],'k'
mov OldPieces[59],'q'
mov q1[1],4
mov q2[1],4
mov p1,1
mov SendingStatus,'|'
mov ReciviedStatus,'|'
  mov f4bool , 0
  mov Player1WinsBool,0
  mov Player2WinsBool,0
  mov Player1square,6
  mov Player1square[1],4
  ; mov Player2square,1
  ; mov Player2square[1],4
  mov P1validateBool,0
  mov P2validateBool,0
  mov P1Status,21
  mov q2 , 0
  mov q2[1],3
  cmp p1,0
  jne normq
  mov q1[1],3
  jmp notnormq
  normq:
  mov q1[1],4
  notnormq:
  mov q1,7
  mov P2Status,21

mov P1Status[1],30

mov P2Status[1],0

mov Secs,0
mov Mins,0


PUSHA
  CALL FAR PTR resetcurrentmoves1
POPA
; PUSHA
;   CALL FAR PTR resetcurrentmoves2
; POPA
pusha
  call far ptr clearhighlight
popa
; pusha
;   call far ptr clearhighlight2
; popa

mov clipBoardP1,"*"
; mov clipBoardP2,"*"



mov gotenter, 0
mov sending_bool, 1
mov inlinex ,21
mov inliney ,20
mov INsendingx ,10
mov INsendingy ,20






ret
RESETGAME ENDP




displaytime proc far


call far ptr GetTimeFromInterrupt
mov ax,SystemTime
cmp playtime,ax
je noDisplayhelp
jmp display
noDisplayhelp:
jmp noDisplay
display:
cmp Secs,59
je IncreaseMinutes
inc Secs
jmp notIncreaseMin



IncreaseMinutes:
mov Secs,0
inc Mins




notIncreaseMin:

pusha
mov al,Secs
mov ah,0
mov cl,10
div cl

add al,30h
add ah,30h

mov dispsecs,al
mov dispsecs[1],ah
popa


pusha
mov al,Mins
mov ah,0
mov cl,10
div cl

add al,30h
add ah,30h

mov dispMins,al
mov dispMins[1],ah
popa


mov playtime,ax
mov  dl, 17   ;Column
mov  dh, 24   ;Row
mov  bh, 0    ;Display page
mov  ah, 02h  ;SetCursorPosition
int  10h

mov  al, 'T'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h


mov  al, ':'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, dispMins
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, dispMins[1]
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, ':'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, dispsecs
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, dispsecs[1]
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h
noDisplay:
ret
displaytime endp










checkmateP1 proc far


;! checking for right and left

mov cl,q1[1]
mov ch,q1

;!left
  
  chckleft:
  cmp cl,0
  je nextchck 
  dec cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextchck
  cmp currPiece,'R'
  je checkmate1help
  cmp currPiece,'Q'
  je checkmate1help
  cmp currPiece,'*'
  je chckleft 
  nextchck:
jmp notcheckmate11
checkmate1help:
jmp checkmate1
notcheckmate11:
mov cl,q1[1]
mov ch,q1

;!right

  chckright:
  cmp cl,7
  je nextchck1 
  inc cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextchck1
  cmp currPiece,'R'
  je checkmate1h
  cmp currPiece,'Q'
  je checkmate1h 
  cmp currPiece,'*'
  je chckright 
  nextchck1:
  jmp cont1
  checkmate1h:
  jmp checkmate1
  cont1:
mov cl,q1[1]
mov ch,q1
;!Up
  chckup:
  cmp ch,0
  je nextchck2 
  dec ch
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextchck2
  cmp currPiece,'R'
  je checkmate1hh
  cmp currPiece,'Q'
  je checkmate1hh
  cmp currPiece,'*'
  je chckup 
  nextchck2:

  jmp cont2
  checkmate1hh:
  jmp checkmate1
  cont2:
mov cl,q1[1]
mov ch,q1
;!Down
  chckdown:
  cmp ch,7
  je nextchck3
  inc ch
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextchck3
  cmp currPiece,'R'
  je checkmate1hhh
  cmp currPiece,'Q'
  je checkmate1hhh
  cmp currPiece,'*'
  je chckdown 
  nextchck3:
  jmp cont4
  checkmate1hhh:
  jmp checkmate1
  cont4:
  mov cl,q1[1]
  mov ch,q1
  ;!DiagonalUp
  chckdup:
  cmp ch,0
  je nextchck4
  cmp cl,7
  je nextchck4
  dec ch
  inc cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextchck4
  cmp currPiece,'B'
  je checkmate1h3
  cmp currPiece,'Q'
  je checkmate1h3
  cmp currPiece,'*'
  je chckdup 
  nextchck4:
  
  jmp cont5
  checkmate1h3:
  jmp checkmate1
  cont5:
  mov cl,q1[1]
  mov ch,q1
  ;!DiagonalDown
  chckddown:
  cmp ch,0
  je nextchck5
  cmp cl,0
  je nextchck5
  dec ch
  dec cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextchck5
  cmp currPiece,'B'
  je checkmate1h4
  cmp currPiece,'Q'
  je checkmate1h4
  cmp currPiece,'*'
  je chckddown 
  nextchck5:

  jmp cont6
  checkmate1h4:
  jmp checkmate1
  cont6:
  mov cl,q1[1]
  mov ch,q1
  ;!DiagonalDownR
  chckddownr:
  cmp ch,7
  je nextchck6
  cmp cl,7
  je nextchck6
  inc ch
  inc cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextchck6
  cmp currPiece,'B'
  je checkmate1h7

  cmp currPiece,'Q'
  je checkmate1h7
  cmp currPiece,'*'
  je chckddownr 
  nextchck6:
  jmp cont9
  checkmate1h7:
  jmp checkmate1
  cont9:

  mov cl,q1[1]
  mov ch,q1
  ;!DiagonalDownL
  chckddownl:
  cmp ch,7
  je nextchck7
  cmp cl,0
  je nextchck7
  inc ch
  dec cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextchck7
  cmp currPiece,'B'
  je checkmate1h10
  cmp currPiece,'Q'
  je checkmate1h10
  cmp currPiece,'*'
  je chckddownl 
  nextchck7:
jmp cont10
  checkmate1h10:
  jmp checkmate1
  cont10:


;!pawnCheck
  mov cl,q1[1]
  mov ch,q1
  cmp ch,0
  je nextnext
  cmp cl,7
  je nextnext
  dec ch
  inc cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextnext
  cmp currPiece,'P'
  je checkmate1h11

  jmp cont13
  checkmate1h11:
  jmp checkmate1
  cont13:

  mov cl,q1[1]
  mov ch,q1

  nextnext:
  mov cl,q1[1]
mov ch,q1
  cmp ch,0
  je nextnext2
  cmp cl,0
  je nextnext2
  dec ch
  dec cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextnext2
  cmp currPiece,'P'
  je checkmate1h15
  jmp cont19
  checkmate1h15:
  jmp checkmate1
  cont19:
  nextnext2:


  ;!Horse

  mov cl,q1[1]
  mov ch,q1
  cmp ch,1
  jbe nextnext3
  cmp cl,0
  je nextnext3
  dec ch
  dec ch
  dec cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextnext3
  cmp currPiece,'H'
  je checkmate1h21

  jmp cont29
  checkmate1h21:
  jmp checkmate1
  cont29:

  nextnext3:
  
  mov cl,q1[1]
  mov ch,q1
  cmp ch,1
  jbe nextnext4
  cmp cl,7
  je nextnext4
  dec ch
  dec ch
  inc cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextnext4
  cmp currPiece,'H'
  je checkmate1h30
  

  jmp cont50
  checkmate1h30:
  jmp checkmate1
  cont50:

  nextnext4:


  mov cl,q1[1]
  mov ch,q1
  cmp ch,0
  je nextnext5
  cmp cl,6
  jae nextnext5
  dec ch
  inc cl
  inc cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextnext5
  cmp currPiece,'H'
  je checkmate1h31

  jmp cont51
  checkmate1h31:
  jmp checkmate1
  cont51:

  nextnext5:


  
  mov cl,q1[1]
  mov ch,q1
  
  cmp ch,7
  je nextnext6
  cmp cl,6
  jae nextnext6
  inc ch
  inc cl
  inc cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextnext6
  cmp currPiece,'H'
  je checkmate1h60


  jmp cont60
  checkmate1h60:
  jmp checkmate1
  cont60:
  nextnext6:

  mov cl,q1[1]
  mov ch,q1
  cmp ch,6
  jae nextnext7
  cmp cl,7
  jae nextnext7
  inc ch
  inc ch
  inc cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextnext7
  cmp currPiece,'H'
  je checkmate1h70

  jmp cont70
  checkmate1h70:
  jmp checkmate1
  cont70:

  nextnext7:

  mov cl,q1[1]
  mov ch,q1
  cmp ch,6
  jae nextnext8
  cmp cl,0
  je nextnext8
  inc ch
  inc ch
  dec cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextnext8
  cmp currPiece,'H'
  je checkmate1



  nextnext8:
   

  mov cl,q1[1]
  mov ch,q1
  cmp ch,7
  jae nextnext9
  cmp cl,1
  jbe nextnext9
  inc ch
  dec cl
  dec cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextnext9
  cmp currPiece,'H'
  je checkmate1



  nextnext9:

  mov cl,q1[1]
  mov ch,q1
  cmp ch,0
  jbe nextnext10
  cmp cl,1
  jbe nextnext10
  dec ch
  dec cl
  dec cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'Z'
  ja nextnext10
  cmp currPiece,'H'
  je checkmate1



  nextnext10:
jmp notcheckmate1
checkmate1:
mov  dl, 30   ;Column
mov  dh, 24   ;Row
mov  bh, 0    ;Display page
mov  ah, 02h  ;SetCursorPosition
int  10h

mov  al, 'C'
mov  bl, 0ch  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'H'
mov  bl, 0ch  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'E'
mov  bl, 0ch  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'C'
mov  bl, 0ch  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'K'
mov  bl, 0ch  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, ' '
mov  bl, 0ch  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, ' '
mov  bl, 0ch  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, ' '
mov  bl, 0ch  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, ' '
mov  bl, 0ch  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h
mov checkmate1bool,0
jmp exitcheckmate
notcheckmate1:
cmp checkmate1bool,1
je exitcheckmate
mov checkmate1bool,1
mov  dl, 30   ;Column
mov  dh, 24   ;Row
mov  bh, 0    ;Display page
mov  ah, 02h  ;SetCursorPosition
int  10h

mov  al, 'I'
mov  bl, 0fh  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'N'
mov  bl, 0fh  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, ' '
mov  bl, 0fh  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'G'
mov  bl, 0fh  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'A'
mov  bl, 0fh  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'M'
mov  bl, 0fh  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'E'
mov  bl, 0fh  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, ' '
mov  bl, 0fh  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, ' '
mov  bl, 0fh  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h
exitcheckmate:

mov  dl, INsendingx   ;Column
mov  dh, INsendingy   ;Row
mov  bh, 0    ;Display page
mov  ah, 02h  ;SetCursorPosition
int  10h
ret
checkmateP1 endp









sending proc far

    ;Check that Transmitter Holding Register is Empty
    mov dx , 3FDH 
    ; Line Status Register 
    AGAIN: In al , dx  
    ;Read Line Status 
    test al , 00100000b 
    jz SendEnd


    ;If empty put the VALUE in Transmit data register
    mov dx , 3F8H 
    ; Transmit data register 
    mov  al,VALUE 
    out dx , al 

    SendEnd:
ret
sending endp 







sendingInline proc far


    mov ah,1
    int 16h
    jz nochattinghelp
    jmp nop2
    nochattinghelp: jmp nochatting
    nop2:

    cmp ah,62
    je f4Exithelp
    jmp noj
    f4Exithelp : jmp f4Exit
    noj:

    cmp ah,59
    jg nochattinghelp2
    jmp nop3
    nochattinghelp2 : jmp nochatting

    nop3:

    mov inlineValue,al
    mov SendingStatus,'%'

   
    ;x: 10 , y:20

   

    ;mov INsendingx,10


    mov  dl, INsendingx   ;Column
    mov  dh, INsendingy   ;Row
    mov  bh, 0    ;Display page
    mov  ah, 02h  ;SetCursorPosition
    int  10h
    printReg:
    cmp INsendingx,20
    jne checkentr
    add INsendingy,1
    cmp INsendingy,24
    je printNotReg
    mov INsendingx,10
    mov bh,0
    mov ah,02
    mov dl,INsendingx
    mov dh,INsendingy
    int 10h

    checkentr:
    cmp al,13
    jne printit
    mov gotenter,1
    mov INsendingx,10
    dec INsendingx
    add INsendingy,1
    cmp INsendingy,24
    je PrintNotReg
    mov bh,0
    mov ah,02
    mov dl,INsendingx
    mov dh,INsendingy
    int 10h


    printit:
    mov ah,02
    mov dl,INsendingx
    mov dh,INsendingy
    int 10h

    mov ah,2
    mov dl,inlineValue
    int 21h

    inc INsendingx
    jmp nochatting

    


    PrintNotReg:
    mov INsendingy,23
    cmp gotenter,1
    je extradec
    mov INsendingx,10
    jmp noextradec
    extradec:
    mov gotenter,0
    mov INsendingx,9
    noextradec:
    mov ax,0600h
    mov bh,00h
    mov al,1
    mov cl,10
    mov ch,20
    mov dl,19
    mov dh,23
    int 10h

   
    mov al,0
    mov bh,0
    xor cx,cx
    xor dx,dx
    mov ah,02
    mov dl,INsendingx
    mov dh,INsendingy
    int 10h

    mov ah,2
    mov dl,inlineValue
    int 21h

    inc INsendingx
    jmp nochatting



    

    f4Exit:
    mov SendingStatus,'#'




    nochatting:

ret
sendingInline endp 



recivingInline proc far


    cmp boolInline,1
    jne noprintinghh
    mov boolInline,0
    jmp nonoprinting
    noprintinghh:
    jmp noprinting
    nonoprinting:


    

    printReg2:
    cmp inlinex,29
    jne checkentr2
    add inliney,1
    cmp inliney,24
    je printNotReg2
    mov inlinex,21
    mov bh,0
    mov ah,02
    mov dl,inlinex
    mov dh,inliney
    int 10h

    checkentr2:
    cmp recINline,13
    jne printit2
    mov gotenter2,1
    mov inlinex,21
    dec inlinex
    add inliney,1
    cmp inliney,24
    je PrintNotReg2
    mov bh,0
    mov ah,02
    mov dl,inlinex
    mov dh,inliney
    int 10h


    printit2:
    mov ah,02
    mov dl,inlinex
    mov dh,inliney
    int 10h

    mov ah,2
    mov dl,recINline
    int 21h

    inc inlinex
    jmp noprinting

    


    PrintNotReg2:
    mov inliney,23
    cmp gotenter2,1
    je extradec2
    mov inlinex,21
    jmp noextradec2
    extradec2:
    mov gotenter2,0
    mov inlinex,20
    noextradec2:
    mov ax,0600h
    mov bh,00h
    mov al,1
    mov cl,21
    mov ch,20
    mov dl,29
    mov dh,23
    int 10h

   
    mov al,0
    mov bh,0
    xor cx,cx
    xor dx,dx
    mov ah,02
    mov dl,inlinex
    mov dh,inliney
    int 10h

    mov ah,2
    mov dl,recINline
    int 21h

    inc inlinex
    jmp ext



    

    noprinting:
    ext:
    ret
recivingInline endp















sendingData proc far
    cmp SendingStatus,'|'
    je SendEndDatahelp
    jmp cij
    SendEndDatahelp: jmp SendEndData
    cij:

    ;Check that Transmitter Holding Register is Empty
    mov dx , 3FDH 
    ; Line Status Register 
    In al , dx  
    ;Read Line Status 
    test al , 00100000b
    jz SendEndDatahelp2
    jmp cons
    SendEndDatahelp2: jmp SendEndData
    cons:
  cmp SendingStatus,'&'
  jne nextsendcheck

  cmp sending_bool,1
  jne sendpiece
  mov al,'&'
  mov sending_bool,0
  
  jmp SendStar
  sendpiece:
  cmp SendingNumber,0
  je nosending
  lea si,p1SendInitS

  add si,currentbyte
  mov al,[si]
  inc currentbyte
  dec SendingNumber
  jmp SendStar

  nextsendcheck:
  cmp SendingStatus,'%'
  jne nextCheck2
  cmp sending_bool,1
  jne sendschar
  mov al,'%'
  mov sending_bool,0
  jmp SendStar
  sendschar:
  mov al,inlineValue
  mov sending_bool,1
  mov SendingStatus,'|'
  jmp SendStar
  nextCheck2:
  cmp SendingStatus,'#'
  jne nextcheck3
  mov al,'#'
  mov SendingStatus,'|'
  jmp SendStar




  nextcheck3:

  nosending:
  mov currentbyte,0
  mov SendingStatus,'|'
  mov sending_bool,1
  jmp SendEndData

  
  SendStar:
    ;If empty put the VALUE in Transmit data register
    mov dx , 3F8H 
    ; Transmit data register 
    
    out dx , al 
   

    SendEndData:
    
ret
sendingData endp 



recivingdata proc far


    mov dx , 3FDH 
    ; Line Status Register 
    in al , dx  
    test al , 1 
    jz ext1helppp
    mov dx , 03F8H 
    in al , dx

   jmp noooooext1   
   ext1helppp:
   jmp ext1
   noooooext1:
    cmp ReciviedStatus,'|'
    je recivingCode

    cmp ReciviedStatus,'&'
    je recivingPiece

    cmp ReciviedStatus,"%"
    je recivingChar

    
    
    ;If Ready read the VALUE in Receive data register
  
    
     

    recivingCode:
    cmp al,'&'
    jne nextCode
    mov ReciviedStatus,al
    mov RecievedNumber,4
    jmp nos
    nextCode:
    cmp al,'%'
    jne nextCode2
   
    mov ReciviedStatus,'%'

    jmp nos
   
    nextCode2:
    cmp al,'#'
    jne nextCode3
    mov f4bool,1
    


    nextCode3:

    exthelp:
    jmp ext
    nos:
    
    jmp ext1




    recivingPiece:

  

    lea si,P2initR

   ; mov dx , 03F8H 
   ; in al , dx  

    add si,RecivivingByte
    mov [si],al
    inc RecivivingByte
    dec RecievedNumber
    cmp RecievedNumber,0
    je preexit
    jmp ext1
    
    preexit:

    mov ReciviedStatus,'|'
    mov RecivivingByte,0
    mov boolStartP2,1
    jmp ext1
    nextRecievecheck:

    recivingChar: 
    mov boolInline,1
    mov recINline,al
    mov ReciviedStatus,'|'
;           pusha
;     mov dl,0ch
;     mov dh,00h
;      mov bl,8
; mov bh,00h
; mov al,2
; mov ah,0
; mov si,0
; CALL FAR PTR drawSingleCell
; popa 
    jmp ext1


    ext1:
    ret
recivingdata endp





reciving proc far

    mov dx , 3FDH 
    ; Line Status Register 
    in al , dx  
    test al , 1 
    jz ext9help
    jmp nop55
    ext9help: jmp ext9

    nop55:
    ;If Ready read the VALUE in Receive data register
    mov dx , 03F8H 
    in al , dx  
    mov VALUE2 , al
    cmp Value2,'^'
    je ext9help
    mov bh,0
    mov ah,02
    mov dl,x
    mov dh,y
    int 10h


    cmp x,79
    jne cona

    inc y
    mov x,0

    cona:

    cmp y,24
    jne noscrol
    ;;to be put
    mov y,23
    cmp gotenter4,1
    je extradecx1
    mov x,0
    jmp noextradecx1
    extradecx1:
    mov gotenter4,0
    mov x,-1
    noextradecx1:
    mov ax,0600h
    mov bh,07h
    mov al,1
    mov cl,0
    mov ch,14
    mov dl,79
    mov dh,24
    int 10h

   
    mov bh,0
    mov ah,02
    mov dl,0
    mov dh,23
    int 10h
    
    mov bh,0
    mov ah,2
    mov dl,Value2
    int 21h

    inc x
    jmp ext9

   ;;;

    noscrol:
    cmp al,13
    jne printit3
    mov gotenter4,1 
    mov x,0
    inc y
    dec x
    mov bh,0
    mov ah,02
    mov dl,x
    mov dh,y
    int 10h
    

    printit3:
    

    mov ah,02
    mov dl,x
    mov dh,y
    int 10h

    mov ah,2
    mov dl,value2
    int 21h

    inc x

    ext9:   

    


    ret
reciving endp





release2 proc far
cmp boolStartP2,1
jne noMove2help
jmp move2
noMove2help:
jmp noMove2


move2:
cmp clipBoardP1,'*'
  je contttr
  mov P1validateBool,1
  contttr:

mov al,P2initR
mov brushRow,al

mov al,P2initR[1]
mov brushCol,al
mov al,P2initR
mov getrow,al

mov al,P2initR[1]
mov getcol,al

pusha
CALL FAR PTR getCellData
popa 

pusha
call far ptr SetBrush
popa
mov bx,brush
mov al,'*'
mov [bx],al


mov cl,currPiece
pusha
mov dl,currColor
mov dh,00h
mov bl,getrow
mov bh,00h
mov al,getCol
mov ah,0
mov si,0
CALL FAR PTR drawSingleCell
popa 



mov al,P2initR[2]
mov brushRow,al

mov al,P2initR[3]
mov brushCol,al
mov al,P2initR[2]
mov getrow,al

mov al,P2initR[3]
mov getcol,al
pusha
CALL FAR PTR getCellData
popa 
pusha
mov cl,currPiece
mov GraveP1,cl
popa
pusha
call far ptr SetBrush
popa
mov al, cl
mov bx,brush
mov [bx],al



  cmp clipBoardP1,'*'
  je ppp2
  mov cl,getrow
  mov ch,getcol
  cmp cl,clipBoardP1[1] 
  jne ppp2
  cmp ch,clipBoardP1[2]
  jne ppp2
  pusha
  CALL FAR PTR ClearHighlighted1
  popa
  Call Far ptr resetcurrentmoves1
  mov clipBoardP1,'*'
  mov P1validateBool,0
  ppp2:



pusha
mov dl,currColor
mov dh,00h
mov bl,getrow
mov bh,00h
mov al,getCol
mov ah,0
mov si,0
CALL FAR PTR drawSingleCell
popa 

pusha
   call far ptr checkmateP1
popa
mov boolStartP2,0

noMove2:
  ret
release2 endp

MainNotBar PROC FAR
mov ah,2
mov dl,9
mov dh,16
int 10h


mov ah,9 ;Display
mov bh,0 ;Page 0
mov al,' ' ;Letter D
mov cx,60 ;5 times
mov bl,70h ;Green (A) on white(F) background
int 10h
mov ah,2
mov dl,32
mov dh,16
int 10h
mov ah,2
mov dl,'N'
int 21h

mov ah,2
mov dl,'O'
int 21h
mov ah,2
mov dl,'T'
int 21h
mov ah,2
mov dl,'I'
int 21h
mov ah,2
mov dl,'F'
int 21h
mov ah,2
mov dl,'I'
int 21h
mov ah,2
mov dl,'C'
int 21h
mov ah,2
mov dl,'A'
int 21h
mov ah,2
mov dl,'T'
int 21h
mov ah,2
mov dl,'I'
int 21h
mov ah,2
mov dl,'O'
int 21h
mov ah,2
mov dl,'N'
int 21h
mov ah,2
mov dl,'S'
int 21h

mov ah,2
mov dl,30
mov dh,18
int 10h

mov dl,'P'
int 21h
mov ah,2
mov dl,'2'
int 21h

mov dl,' '
int 21h

mov ah,2
mov dl,'U'
int 21h
mov ah,2
mov dl,'N'
int 21h
mov ah,2
mov dl,'A'
int 21h
mov ah,2
mov dl,'V'
int 21h
mov ah,2
mov dl,'A'
int 21h
mov ah,2
mov dl,'I'
int 21h
mov ah,2
mov dl,'L'
int 21h
mov ah,2
mov dl,'A'
int 21h
mov ah,2
mov dl,'B'

int 21h
mov ah,2
mov dl,'L'
int 21h
mov ah,2
mov dl,'E'
int 21h
mov ah,2
mov dl,9
mov dh,36
int 10h
ret 
MainNotBar ENDP

GetUserName PROC FAR


mov ah,2  
mov dl,20
mov dh,4
int 10h

mov ah, 9
mov dx, offset msg4
int 21h
mov ah,2  
mov dl,24
mov dh,5
int 10h


mov ah,0AH
mov dx,offset MyName
int 21h


mov ah,2  
mov dl,20
mov dh,12
int 10h

mov ah, 9
mov dx, offset msg5
int 21h
presenter:
mov ah,0
int 16h


cmp ah,28
jne presenter



ret
GetUserName ENDP

Sendnameletter PROC FAR


ret
Sendnameletter ENDP

playersconnected proc far
              mov ah,2  
              mov dl,25
              mov dh,18
              int 10h
              mov ah, 9
              mov dx, offset msgclr
              int 21h
              mov ah, 9
              mov dx, offset OpName
              int 21h
                 mov ah,2  
              mov dl,28
              mov dh,18
              int 10h
              mov ah, 9
              mov dx, offset msg6
              int 21h




mov ah,2
mov dl,9
mov dh,36
int 10h

ret
playersconnected ENDP

startgamenotif PROC FAR

              mov ah,2  
              mov dl,25
              mov dh,20
              int 10h
              mov ah, 9
              mov dx, offset msgclr
              int 21h

              mov ah,2  
              mov dl,25
              mov dh,20
              int 10h
              mov ah, 9
              mov dx, offset msg7
              int 21h

              mov ah,2
mov dl,9
mov dh,36
int 10h
ret
startgamenotif ENDP

startchatnotif PROC FAR
              mov ah,2  
              mov dl,25
              mov dh,20
              int 10h
              mov ah, 9
              mov dx, offset msgclr
              int 21h

              mov ah,2  
              mov dl,25
              mov dh,20
              int 10h
              mov ah, 9
              mov dx, offset msg8
              int 21h
mov ah,2
mov dl,9
mov dh,36
int 10h
ret
startchatnotif ENDP
end main