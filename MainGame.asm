
;PUBLIC drawCol,drawRow
;EXTRN drawSingleCell2:FAR
.MODEL Huge
.286


.STACK 64
.DATA
MULBYC DW 0

checkmate1bool db 0
checkmate2bool db 0
P1Status Db 20,33

P2Status Db 20,3

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






msg1 db "To Start Game Press F2 $"
msg2 db "To End The Program Press ESC $"




; Color Matrix

OldPieces   DB 'R','H','B','K','Q','B','H','R'
            DB 'P','P','P','*','p','P','P','P'
            DB '*','*','*','*','*','*','*','*'
            DB '*','*','*','*','*','*','*','*'
            DB '*','*','*','*','*','*','*','*'
            DB '*','*','*','*','*','*','*','*'
            DB 'p','p','p','p','p','H','p','p'
            DB 'r','h','b','k','q','b','h','r'




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


Secs db 0
Mins db 0
dispsecs db 0,0







Pieces      DB 'R','H','B','K','Q','B','H','R'
            DB 'P','P','P','P','P','P','P','P'
            DB '*','*','*','*','*','*','*','*'
            DB '*','*','*','*','*','*','*','*'
            DB '*','*','*','*','*','*','*','*'
            DB '*','*','*','*','*','*','*','*'
            DB 'p','p','p','p','p','*','p','p'
            DB 'r','h','b','k','q','p','R','*'


q2 db 0,3

q1 db 7,3


            
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
Player2square db 1,4
.286
.stack 64
.code


main proc FAR
                MOV AX,@DATA
                mov ds, ax


              MainScreen:
             

              ; changing to text mode
              mov ah,3
              mov al,13h
              int 10h

              ; clearing the screen
              mov ah,0
              mov al,3
              int 10h

              

              
           
              ; setting the cursor postion


              mov ah,2  
              mov dl,25
              mov dh,8
              int 10h

        

              mov ah, 9
              mov dx, offset msg1
              int 21h

              mov ah,2  
              mov dl,25
              mov dh,10
              int 10h



              mov ah, 9
              mov dx, offset msg2
              int 21h

              
              getkey:
              mov ah,0
              int 16h
        
              cmp ah,1
              je terminatehelp
              jmp notterminate
              terminatehelp:
              jmp terminate
              notterminate:

              cmp ah,60
              jne getkey

              ;jmp MainScreen




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
                Call Far PTR drawPlayer2
                  

hlt
play:
                cmp f4bool , 1
                je rg
                CALL FAR PTR CheckP1Moves
                CALL FAR PTR CheckP2Moves
                CALL FAR PTR CheckPlayerOverlap
              ; pusha

                CALL FAR PTR GetAvaliableMoves
                CALL FAR PTR GetAvaliableMoves2
              ;  popa 
                CALL FAR PTR HighlighCells
                CALL FAR PTR HighlighCells2
                CALl FAR PTR freeClipboard1
                CALl FAR PTR freeClipboard2
                call far ptr releaseClipBoard1
                call far ptr releaseClipBoard2
                Call FAR PTR FreeCell
                CALL FAR PTR CheckGameOver
                CALL FAR PTR UpdateStatusBar
                ; just to check to be removed
                CALL FAR PTR displaytime
              
                mov cl,Player2WinsBool
                add Player1WinsBool,cl
                cmp Player1WinsBool,1
                jb  play
                ; delay after  one player wins
                MOV     CX, 12H
                MOV     DX, 0FFFFH
                MOV     AH, 86H
                INT     15H
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


drawPlayer2 proc far

mov al,Player2square
mov ah,Player2square[1]
mov drawRow,al
mov si,0
MOV drawCol,ah
mov bh,0
mov bl,drawCol
mov  ax,bx
mov bh,0
mov  bl,drawRow
mov dx,0bh
CALL FAR PTR drawSingleCell
pusha
mov al,Player2square
mov ah,Player2square[1]
mov getrow,al
mov getCol,ah
MOV drawRow,al
mov drawCol,ah
Call Far PTR getCellData
mov al,currPiece
mov drawOnePieceVar,al
Call Far PTR DrawOnePiece
popa
ret
drawPlayer2 ENDP

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







CheckP2Moves proc far

mov ah,01h
int 16h

jnz clr2
jmp notclr2
clr2:
mov Clearbool,1
notclr2:
;mov dl,ah
;mov ah,07         ;Read one char and put in al
;int 21h  



cmp ah,62
je f4conditionp2
jmp notjmp2

f4conditionp2:
mov f4bool,1
jmp moved2 

notjmp2:



cmp ah,17
jnz not_w

; delete what is inside the buffer without reading
;push ax
  ;mov ah,0ch
  ;mov al,0
  ;int 21h
;pop ax   

; draw in its place
mov al,Player2square
mov ah,Player2square[1]
mov getrow,al
mov getcol,ah
Call Far PTR getCellData
mov al,Player2square
mov ah,Player2square[1]
mov getrow,al
mov getcol,ah
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
ja redcooldownw
jmp nocooldownw
redcooldownw:
mov currColor,04h
nocooldownw:
popa








mov dl,currColor
mov dh,0
CALL FAR PTR drawSingleCell

cmp Player2square,0
je not_normal_w
dec Player2square
jmp normal_w
not_normal_w:
mov Player2square,7
normal_w:
CALL FAR PTR drawPlayer2
jmp moved2

not_w:
cmp ah,31
jnz not_s

;push ax
;mov ah,0ch
;mov al,0
;int 21h
;pop ax   

mov al,Player2square
mov ah,Player2square[1]
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
ja redcooldowns
jmp nocooldowns
redcooldowns:
mov currColor,04h
nocooldowns:
popa


mov dl,currColor
mov dh,0
CALL FAR PTR drawSingleCell
cmp Player2square,7
je not_normal_s
inc Player2square
jmp normal_s
not_normal_s:
mov Player2square,0
normal_s:
CALL FAR PTR drawPlayer2
jmp moved2
not_s:

cmp ah,30
jnz not_a

;push ax
 ; mov ah,0ch
 ; mov al,0
 ; int 21h
;pop ax   rele

mov al,Player2square
mov ah,Player2square[1]
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
ja redcooldowna
jmp nocooldowna
redcooldowna:
mov currColor,04h
nocooldowna:

popa


mov dl,currColor
mov dh,0
CALL FAR PTR drawSingleCell
mov cl,Player2square[1]
cmp cl,0
je not_normal_a
dec cl
mov Player2square[1],cl
jmp normal_a
not_normal_a:
mov cl,7
mov Player2square[1],cl
normal_a:
CALL FAR PTR drawPlayer2
jmp moved2
not_a:

cmp ah,32
jnz not_d

;flushing buffer
;push ax
;mov ah,0ch
;mov al,0
;int 21h
;pop ax   

mov al,Player2square
mov ah,Player2square[1]
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
ja redcooldownd
jmp nocooldownd
redcooldownd:
mov currColor,04h
nocooldownd:

popa

mov dl,currColor
mov dh,0
CALL FAR PTR drawSingleCell
mov cl,Player2square[1]
cmp cl,7
je not_normal_d
inc cl
mov Player2square[1],cl
jmp normal_d
not_normal_d:
mov cl,0
mov Player2square[1],cl
normal_d:
CALL FAR PTR drawPlayer2
jmp moved2
not_d:


moved2:
; flush buffer
;push ax
 ; mov ah,0ch
  ;mov al,0
  ;int 21h
;pop ax   

ret

CheckP2Moves ENDP




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

CheckPlayerOverlap proc far
mov al,Player1square
cmp al,Player2square
jnz no_player_overlap
mov al,Player1square[1]
cmp al,Player2square[1]
jnz no_player_overlap
cmp OverlapBool,1
je doneoverlap 
mov si,0
mov bh,0
mov bl,Player1square[1]
mov  ax,bx
mov bh,0
mov si,10
mov  bl,Player1square
mov dx,0ah ;color 
mov drawbool,1
mov CoolDownColor,0bh
CALL FAR PTR drawSingleCell
mov OverlapBool,1
jmp doneoverlap
no_player_overlap:
mov OverlapBool,0
cmp drawbool,1
jnz doneoverlap
CALL FAR PTR drawPlayer1
CALL FAR PTR drawPlayer2
mov drawbool,0
doneoverlap:
ret
CheckPlayerOverlap ENDP

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
  jmp flagNoPiece 

  ContinueMov:


  cmp ah,28
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












GetAvaliableMoves2 proc far

;lea BX,CurrentMovesRow
Mov ColorOffset2,0
xor SI,SI
lea SI , CurrentMovesRow2
xor di,di
lea di,CurrentMovesColumn2
;mov SI,BX
cmp P2validateBool,1
je extravalhelp2
cmp clipBoardP2,'*'
jne flagNoPieceHelp2


  jmp extc2
  extravalhelp2:
  jmp extraval2
  extc2:

mov ah,01h
int 16h
;mov dl,ah
;mov ah,07         ;Read one char and put in al
;int 21h  

  cmp ah,62
  je f4conditionMov2
  jmp ContinueMov2

  f4conditionMov2:
  mov f4bool,1
  jmp flagNoPiece2 

  ContinueMov2:


cmp ah,16	
jne flagNoPieceHelp2
jmp notjump2
flagNoPieceHelp2:
jmp flagNoPiece2
notjump2:
Mov al,Player2square
Mov getrow,al
mov al,Player2square[1]
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
je flagNoPieceHelpr2
cmp bl,'Z'
ja flagNoPieceHelpr2
mov bp,currTime
cmp bp,SystemTime
ja flagNoPieceHelpr2
jmp NotflagnoPiece2
flagNoPieceHelpr2:
jmp flagNoPiece2
NotflagnoPiece2:
mov clipBoardP2,bl

pusha
mov cl,getrow
mov clipBoardP2[1],cl
mov cl,getcol
mov clipBoardP2[2],cl
popa
JMP notextraval2
extraval2:
  PUSHA
  call far ptr ClearHighlighted2
  POPA
  PUSHA
  Call Far ptr resetcurrentmoves2
  POPA
  mov bl,clipBoardP2
  mov cl,clipBoardP2[1]
  mov temprow,cl
  mov getrow,cl
  mov cl,clipBoardP2[2]
  mov tempcol,cl
  mov getcol,cl
  Mov ColorOffset2,0
  xor SI,SI
  lea SI , CurrentMovesRow2
  xor di,di
  lea di,CurrentMovesColumn2
  xor ax,ax
  notextraval2:
; pawn movements
;!pawn
  cmp bl,"P"
  jne notphelp2
  mov cl,temprow
  cmp cl,7
  je notphelp2
  jmp isp2
  notphelp2:
  jmp notp2
  isp2:
  inc getrow
  pusha
  CAll far ptr getCellData
  popa
  cmp currPiece,"*"
  jne notEmpty12

  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  inc si
  mov [di],ch
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
    inc getrow
    cmp getrow,3
    jne noextramove2
    pusha
    CALL FAR PTR getCellData
    popa
    cmp currPiece,'*'
    jne noextramove2
    mov cl,getrow
    mov ch,getCol
    mov [si],cl
    inc si
    mov [di],ch
    inc di
    push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0dh
    mov [si],cx
    inc ColorOffset2
    pop si
    noextramove2:
    dec getrow
  notEmpty12:
  dec getcol
  cmp getcol,-1
  je alliep12
  pusha
  CAll far ptr getCellData
  popa
  cmp currPiece,"*"
  je alliep12
  cmp currPiece,"Z"
  JB alliep12
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  inc si
  mov [di],ch
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
  alliep12:
  inc getcol
  inc getcol
  ; handling overflow
  cmp getcol,8
  je notp2
  
  pusha
  CAll far ptr getCellData
  popa
  cmp currPiece,"*"
  je alliep22
  cmp currPiece,"Z"
  JB alliep22
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
  alliep22:
  jmp flagNoPiece2 

  notp2:


;!rock
  cmp bl,"R"
  jne notrhelp2
  jmp yesr2
  notrhelp2:
  jmp notr2
  yesr2:


  ;? Checked 
  dec getrow
  checkupr2:
  mov cl,getrow
  cmp cl,-1
  je noUphelpr2
  pusha
    Call FAR PTR getCellData
  popa

  cmp currPiece,'Z'
  ja enemyr2
  cmp currPiece,'A'
  jae noUphelpr2
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
  dec getrow
  jmp notenemyr2
  enemyr2:
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
  jmp notupr2
  ; change color ya ali
  notenemyr2:
  jmp checkupr2
  ;jmp notupr 
  noUphelpr2:

  notupr2:





  ;?Checked 

    mov cl , temprow
    mov getrow , cl
    inc getrow

    checkdownr2:
    mov cl,getrow
    cmp cl,8
    je nodownhelpr2
    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'Z'
    ja enemyrd2
    cmp currPiece,'A'
    jae nodownhelpr2
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
    inc getrow
    jmp notenemyrd2
    enemyrd2:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    jmp notdownr2
    ; change color ya ali
    notenemyrd2:
    jmp checkdownr2
    ;jmp notupr 
    nodownhelpr2:

    notdownr2:


    ;?Checked
    mov cl , temprow
    mov getrow , cl


    dec getcol


    checkleftr2:
    mov cl,getCol
    cmp cl,-1
    je nolefthelpr2
    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'Z'
    ja enemyrl2
    cmp currPiece,'A'
    jae nolefthelpr2
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
    inc si
    inc di
    dec getCol
    jmp notenemyrl2
    enemyrl2:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    jmp notleftr2
    ; change color ya ali
    notenemyrl2:
    jmp checkleftr2
    ;jmp notupr 
    nolefthelpr2:

    notleftr2:




    mov cl , temprow
    mov getrow , cl

    mov cl,tempcol
    mov getcol , cl


    inc getcol


    checkrightr2:
    mov cl,getCol
    cmp cl,8
    je norighthelpr2
    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'Z'
    ja enemyrr2
    cmp currPiece,'A'
    jae norighthelpr2
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
    inc getCol
    jmp notenemyrr2
    enemyrr2:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    jmp notrightr2
    ; change color ya ali
    notenemyrr2:
    jmp checkrightr2
    ;jmp notupr 
    norighthelpr2:

    notrightr2:
    jmp flagNoPiece2


  notr2:

;!bishop

  cmp bl,"B"
  jne notbishophelp2
  jmp bishopb2
  notbishophelp2:
  jmp notb2
  bishopb2:

  dec getrow
  inc getcol

  diagonalUp2:
  mov cl,getrow
  cmp cl,-1
  je nodiagonalUp2
  mov cl,getCol
    cmp cl,8
    je nodiagonalUp2 


    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'Z'
    ja enemybu2
    cmp currPiece,'A'
    jae nodiagonalUp2
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
    dec getrow
    inc getCol
    jmp notenemybu2
    enemybu2:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    jmp notdiagonalupb2
    ; change color ya ali
    notenemybu2:
    jmp diagonalUp2
    ;jmp notupr 
    nodiagonalUp2:

    notdiagonalupb2:








  mov cl,tempcol
  mov getCol,cl

  mov cl,temprow
  mov getrow,cl


  dec getrow
  dec getcol

  diagonalUpl2:
  mov cl,getrow
    cmp cl,-1
    je nodiagonalUpl2
  mov cl,getCol
    cmp cl,-1
    je nodiagonalUpl2


    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'Z'
    ja enemybul2
    cmp currPiece,'A'
    jae nodiagonalUpl2
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
    dec getrow
    dec getCol
    jmp notenemybul2
    enemybul2:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    jmp notdiagonalupbl2
    ; change color ya ali
    notenemybul2:
    jmp diagonalUpl2
    ;jmp notupr 
    nodiagonalUpl2:

    notdiagonalupbl2:













  mov cl,tempcol
  mov getCol,cl

  mov cl,temprow
  mov getrow,cl


  inc getrow
  inc getcol

  diagonalDown2:
  mov cl,getrow
    cmp cl,8
    je nodiagonalDown2
  mov cl,getCol
    cmp cl,8
    je nodiagonalDown2 


    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'Z'
    ja enemybd2
    cmp currPiece,'A'
    jae nodiagonalDown2
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
    inc getrow
    inc getCol
    jmp notenemybd2
    enemybd2:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    jmp notdiagonalDownb2
    ; change color ya ali
    notenemybd2:
    jmp diagonalDown2
    ;jmp notupr 
    nodiagonalDown2:

    notdiagonalDownb2:





  mov cl,tempcol
  mov getCol,cl

  mov cl,temprow
  mov getrow,cl


  inc getrow
  dec getcol

  diagonalDownl2:
  mov cl,getrow
    cmp cl,8
    je nodiagonalDownl2
  mov cl,getCol
    cmp cl,-1
    je nodiagonalDownl2


    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'Z'
    ja enemybdl2
    cmp currPiece,'A'
    jae nodiagonalDownl2
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
    inc getrow
    dec getCol
    jmp notenemybdl2
    enemybdl2:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
     push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    jmp notdiagonalDownbl2
    ; change color ya ali
    notenemybdl2:
    jmp diagonalDownl2
    ;jmp notupr 
    nodiagonalDownl2:

    notdiagonalDownbl2:
    jmp flagNoPiece2

  notb2:


;!queen
  cmp bl,'Q'
  jne notqhelp2
  jmp yesq2
  notqhelp2:
  jmp notq2
  yesq2:



  dec getrow
  checkupq2:
  mov cl,getrow
  cmp cl,-1
  je noUphelpq2
  pusha
    Call FAR PTR getCellData
  popa

  cmp currPiece,'Z'
  ja enemyq2
  cmp currPiece,'A'
  jae noUphelpq2
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
  dec getrow
  jmp notenemyq2
  enemyq2:
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
  jmp notupq2
  ; change color ya ali
  notenemyq2:
  jmp checkupq2
  ;jmp notupr 
  noUphelpq2:

  notupq2:








  ;?Checked 

    mov cl , temprow
    mov getrow , cl
    inc getrow

    checkdownq2:
    mov cl,getrow
    cmp cl,8
    je nodownhelpq2
    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'Z'
    ja enemyqd2
    cmp currPiece,'A'
    jae nodownhelpq2
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
    inc getrow
    jmp notenemyqd2
    enemyqd2:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    jmp notdownq2
    ; change color ya ali
    notenemyqd2:
    jmp checkdownq2
    ;jmp notupr 
    nodownhelpq2:

    notdownq2:


    ;?Checked
    mov cl , temprow
    mov getrow , cl


    dec getcol


    checkleftq2:
    mov cl,getCol
    cmp cl,-1
    je nolefthelpq2
    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'Z'
    ja enemyql2
    cmp currPiece,'A'
    jae nolefthelpq2
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
    dec getCol
    jmp notenemyql2
    enemyql2:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    jmp notleftq2
    ; change color ya ali
    notenemyql2:
    jmp checkleftq2
    ;jmp notupr 
    nolefthelpq2:

    notleftq2:




    mov cl , temprow
    mov getrow , cl

    mov cl,tempcol
    mov getcol , cl


    inc getcol


    checkrightq2:
    mov cl,getCol
    cmp cl,8
    je norighthelpq2
    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'Z'
    ja enemyqr2
    cmp currPiece,'A'
    jae norighthelpq2
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
    inc getCol
    jmp notenemyqr2
    enemyqr2:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    jmp notrightq2
    ; change color ya ali
    notenemyqr2:
    jmp checkrightq2
    ;jmp notupr 
    norighthelpq2:

    notrightq2:











  mov cl,tempcol
  mov getCol,cl
  mov cl,getrow
  mov getrow,cl
  dec getrow
  inc getcol

  diagonalUpq2:
  mov cl,getrow
    cmp cl,-1
    je nodiagonalUpq2
  mov cl,getCol
    cmp cl,8
    je nodiagonalUpq2 


    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'Z'
    ja enemyqu2
    cmp currPiece,'A'
    jae nodiagonalUpq2
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
    dec getrow
    inc getCol
    jmp notenemyqu2
    enemyqu2:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    jmp notdiagonalupq2
    ; change color ya ali
    notenemyqu2:
    jmp diagonalUpq2
    ;jmp notupr 
    nodiagonalUpq2:

    notdiagonalupq2:








  mov cl,tempcol
  mov getCol,cl

  mov cl,temprow
  mov getrow,cl


  dec getrow
  dec getcol

  diagonalUplq2:
  mov cl,getrow
    cmp cl,-1
    je nodiagonalUplq2
  mov cl,getCol
    cmp cl,-1
    je nodiagonalUplq2


    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'Z'
    ja enemyqul2
    cmp currPiece,'A'
    jae nodiagonalUplq2
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
    dec getrow
    dec getCol
    jmp notenemyqul2
    enemyqul2:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    jmp notdiagonalupql2
    ; change color ya ali
    notenemyqul2:
    jmp diagonalUplq2
    ;jmp notupr 
    nodiagonalUplq2:

    notdiagonalupql2:













  mov cl,tempcol
  mov getCol,cl

  mov cl,temprow
  mov getrow,cl


  inc getrow
  inc getcol

  diagonalDownq2:
  mov cl,getrow
    cmp cl,8
    je nodiagonalDownq2
  mov cl,getCol
    cmp cl,8
    je nodiagonalDownq2 


    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'Z'
    ja enemyqdd2
    cmp currPiece,'A'
    jae nodiagonalDownq2
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
    inc getrow
    inc getCol
    jmp notenemyqdd2
    enemyqdd2:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    jmp notdiagonalDownq2
    ; change color ya ali
    notenemyqdd2:
    jmp diagonalDownq2
    ;jmp notupr 
    nodiagonalDownq2:

    notdiagonalDownq2:






  mov cl,tempcol
  mov getCol,cl

  mov cl,temprow
  mov getrow,cl


  inc getrow
  dec getcol

  diagonalDownlq2:
  mov cl,getrow
    cmp cl,8
    je nodiagonalDownlq2
  mov cl,getCol
    cmp cl,-1
    je nodiagonalDownlq2


    pusha
      Call FAR PTR getCellData
    popa

    cmp currPiece,'Z'
    ja enemyqdl2
    cmp currPiece,'A'
    jae nodiagonalDownlq2
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
    inc getrow
    dec getCol
    jmp notenemyqdl2
    enemyqdl2:
    mov ch,getcol
    mov cl,getrow
    mov [si],cl
    mov [di],ch
    inc si
    inc di
    push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    jmp notdiagonalDownlq2
    ; change color ya ali
    notenemyqdl2:
    jmp diagonalDownlq2
    ;jmp notupr 
    nodiagonalDownlq2:

  notdiagonalDownlq2:
  jmp  flagNoPiece2


notq2:


;!King

  cmp bl,'K'
  jne notkhelp2
  jmp yesk2
  notkhelp2:
  jmp notk2
  yesk2:

  dec getrow
  
  mov cl,getrow
  cmp cl,-1
  je noUphelpk2
  pusha
    Call FAR PTR getCellData
  popa

  cmp currPiece,'Z'
  ja enemyk2
  cmp currPiece,'A'
  jae noUphelpk2
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
  dec getrow
  jmp notenemyk2
  enemyk2:
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    ; change color ya ali
  notenemyk2:
    ;jmp notupr 
  noUphelpk2:

  notupk2:


  mov cl,temprow
  mov getrow,cl
  mov cl,tempcol
  mov getcol,cl

  dec getrow
  inc getCol

  mov cl,getrow
  cmp cl,-1
  je nodiagonalRhelpk2
  mov ch,getCol
  cmp ch,8
  je nodiagonalRhelpk2
  pusha
    Call FAR PTR getCellData
  popa

  cmp currPiece,'Z'
  ja enemyDRk2
  cmp currPiece,'A'
  jae nodiagonalRhelpk2
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
  dec getrow
  inc getCol
  jmp notenemyDRk2
  enemyDRk2:
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    ; change color ya ali
  notenemyDRK2:
    ;jmp notupr 
  nodiagonalRhelpk2:

  notdiagonalRk2:
  ; moving by the diagonal


  mov cl,temprow
  mov getrow,cl
  mov cl,tempcol
  mov getcol,cl

  dec getrow
  dec getCol

  mov cl,getrow
  cmp cl,-1
  je nodiagonalLhelpk2
  mov ch,getCol
  cmp ch,-1
  je nodiagonalLhelpk2
  pusha
    Call FAR PTR getCellData
  popa

  cmp currPiece,'Z'
  ja enemyDLk2
  cmp currPiece,'A'
  jae nodiagonalLhelpk2
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
  dec getrow
  dec getCol
  jmp notenemyDLk2
  enemyDLk2:
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    ; change color ya ali
  notenemyDLK2:
    ;jmp notupr 
  nodiagonalLhelpk2:

  notdiagonalLk2:
  ; moving by the diagonal



  mov cl,temprow
  mov getrow,cl
  mov cl,tempcol
  mov getcol,cl

  inc getrow
  inc getCol

  mov cl,getrow
  cmp cl,8
  je nodiagonalDLhelpk2
  mov ch,getCol
  cmp ch,8
  je nodiagonalDLhelpk2
  pusha
    Call FAR PTR getCellData
  popa

  cmp currPiece,'Z'
  ja enemyDDLk2
  cmp currPiece,'A'
  jae nodiagonalDLhelpk2
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
  inc getrow
  inc getCol
  jmp notenemyDDLk2
  enemyDDLk2:
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    ; change color ya ali
  notenemyDDLK2:
    ;jmp notupr 
  nodiagonalDLhelpk2:

  notdiagonalDLk2:
  ; moving by the diagonal

  mov cl,temprow
  mov getrow,cl
  mov cl,tempcol
  mov getcol,cl

  inc getrow
  dec getCol

  mov cl,getrow
  cmp cl,8
  je nodiagonalDLhelpkd2
  mov ch,getCol
  cmp ch,-1
  je nodiagonalDLhelpkd2
  pusha
    Call FAR PTR getCellData
  popa

  cmp currPiece,'Z'
  ja enemyDDLkd2
  cmp currPiece,'A'
  jae nodiagonalDLhelpkd2
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
  inc getrow
  dec getCol
  jmp notenemyDDLkd2
  enemyDDLkd2:
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    ; change color ya ali
  notenemyDDLKd2:
    ;jmp notupr 
  nodiagonalDLhelpkd2:

  notdiagonalDLkd2:
  

  mov cl,temprow
  mov getrow,cl
  mov cl,tempcol
  mov getcol,cl
  inc getrow
  
  mov cl,getrow
  cmp cl,8
  je noDownhelpk2
  pusha
    Call FAR PTR getCellData
  popa

  cmp currPiece,'Z'
  ja enemykd2
  cmp currPiece,'A'
  jae noDownhelpk2
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
  inc getrow
  jmp notenemykd2
  enemykd2:
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    ; change color ya ali
  notenemykd2:
    ;jmp notupr 
  noDownhelpk2:

  notDownk2:




  mov cl,temprow
  mov getrow,cl
  mov cl,tempcol
  mov getcol,cl


  inc getCol
  
  mov cl,getCol
  cmp cl,8
  je noRighthelpk2
  pusha
    Call FAR PTR getCellData
  popa

  cmp currPiece,'Z'
  ja enemykr2
  cmp currPiece,'A'
  jae noRighthelpk2
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
  inc getCol
  jmp notenemykr2
  enemykr2:
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    ; change color ya ali
  notenemykr2:
    ;jmp notupr 
  noRighthelpk2:

  notRightk2:




  mov cl,temprow
  mov getrow,cl
  mov cl,tempcol
  mov getcol,cl


  dec getCol
  
  mov cl,getCol
  cmp cl,-1
  je noLefthelpk2
  pusha
    Call FAR PTR getCellData
  popa

  cmp currPiece,'Z'
  ja enemykl2
  cmp currPiece,'A'
  jae noLefthelpk2
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0dh
  mov [si],cx
  inc ColorOffset2
  pop si
  dec getCol
  jmp notenemykl2
  enemykl2:
  mov ch,getcol
  mov cl,getrow
  mov [si],cl
  mov [di],ch
  inc si
  inc di
  push si
  lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov cx,0ch
  mov [si],cx
  inc ColorOffset2
  pop si
    ; change color ya ali
  notenemykl2:
    ;jmp notupr 
  noLefthelpk2:

  notLeftk2:
    jmp flagNoPiece2




  notk2:

; ;! Horse
      cmp bl,"H"
      jne nothhelp2
      jmp yesh2
      nothhelp2:
      jmp noth2
      yesh2:
      
      ; mov cl,temprow
      ; mov getrow,cl
      ; mov cl,tempcol
      ; mov getcol,cl

      dec getrow
      dec getrow
      inc getCol


      mov cl,getrow
      cmp cl,-1
      je nodiagonalRhelph22

      mov cl,getrow
      cmp cl,-2
      je nodiagonalRhelph22

    
      mov ch,getCol
      cmp ch,8
      je nodiagonalRhelph22
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'Z'
      ja enemyDRh22
      cmp currPiece,'*'
      jne nodiagonalRhelph22
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0dh
    mov [si],cx
    inc ColorOffset2
    pop si
      jmp notenemyDRh22
      enemyDRh22:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0ch
    mov [si],cx
    inc ColorOffset2
    pop si
        ; change color ya ali
      notenemyDRh22:
        ;jmp notupr 
      nodiagonalRhelph22:

      notdiagonalRh22:
      


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
      je nodiagonalRhelph12
      mov cl,getrow
      cmp cl,-2
      je nodiagonalRhelph12
      mov ch,getCol
      cmp ch,-1
      je nodiagonalRhelph12
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'Z'
      ja enemyDRh12
      cmp currPiece,'*'
      jne nodiagonalRhelph12
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0dh
    mov [si],cx
    inc ColorOffset2
    pop si

      inc getrow
      inc getrow
      inc getCol
      jmp notenemyDRh12
      enemyDRh12:
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0ch
    mov [si],cx
    inc ColorOffset2
    pop si
        ; change color ya ali
      notenemyDRh12:
        ;jmp notupr 
      nodiagonalRhelph12:

      notdiagonalRh12:
      
        
      mov cl,temprow
      mov getrow,cl
      mov cl,tempcol
      mov getcol,cl

      inc getrow
      inc getrow
      dec getCol

      mov cl,getrow
      cmp cl,8
      je nodiagonalRhelph225
      mov cl,getrow
      cmp cl,9
      je nodiagonalRhelph225
      mov ch,getCol
      cmp ch,-1
      je nodiagonalRhelph225
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'Z'
      ja enemyDRh225
      cmp currPiece,'*'
      jne nodiagonalRhelph225
            mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0dh
    mov [si],cx
    inc ColorOffset2
    pop si
      jmp notenemyDRh225
      enemyDRh225:
      ;mov ch,getcol
      ;mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0ch
    mov [si],cx
    inc ColorOffset2
    pop si
        ; change color ya ali
      notenemyDRh225:
        ;jmp notupr 
      nodiagonalRhelph225:

      notdiagonalRh225:



      mov cl,temprow
      mov getrow,cl
      mov cl,tempcol
      mov getcol,cl

      inc getrow
      inc getrow
      inc getCol

      mov cl,getrow
      cmp cl,8
      je nodiagonalRhelph32
      mov cl,getrow
      cmp cl,9
      je nodiagonalRhelph32
      mov ch,getCol
      cmp ch,8
      je nodiagonalRhelph32
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'Z'
      ja enemyDRh32
      cmp currPiece,'*'
      jne nodiagonalRhelph32
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
      push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0dh
    mov [si],cx
    inc ColorOffset2
    pop si
    
      jmp notenemyDRh32
      enemyDRh32:
      ;mov ch,getcol
      ;mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
      push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0ch
    mov [si],cx
    inc ColorOffset2
    pop si
        ; change color ya ali
      notenemyDRh32:
        ;jmp notupr 
      nodiagonalRhelph32:

      notdiagonalRh32:

      
      mov cl,temprow
      mov getrow,cl
      mov cl,tempcol
      mov getcol,cl

      inc getrow
      dec getCol
      dec getCol
      mov cl,getCol
      cmp cl,-1
      je nodiagonalRhelph42
      mov ch,getCol
      cmp ch,-2
      je nodiagonalRhelph42
      mov cl,getrow
      cmp cl,8
      je nodiagonalRhelph42
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'Z'
      ja enemyDRh42
      cmp currPiece,'*'
      jne nodiagonalRhelph42
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0dh
    mov [si],cx
    inc ColorOffset2
    pop si
    
      jmp notenemyDRh42
      enemyDRh42:
      ;mov ch,getcol
      ;mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0ch
    mov [si],cx
    inc ColorOffset2
    pop si
        ; change color ya ali
      notenemyDRh42:
        ;jmp notupr 
      nodiagonalRhelph42:

      notdiagonalRh42:



      mov cl,temprow
      mov getrow,cl
      mov cl,tempcol
      mov getcol,cl

      dec getrow
      inc getCol
      inc getCol
      mov cl,getCol
      cmp cl,9
      je nodiagonalRhelph52
      mov ch,getCol
      cmp ch,8
      je nodiagonalRhelph52
      mov cl,getrow
      cmp cl,-1
      je nodiagonalRhelph52
      pusha
        Call FAR PTR getCellData
      popa

      cmp currPiece,'Z'
      ja enemyDRh52
      cmp currPiece,'*'
      jne nodiagonalRhelph52
      mov ch,getcol
      mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
      push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0dh
    mov [si],cx
    inc ColorOffset2
    pop si
    
      jmp notenemyDRh52
      enemyDRh52:
      ;mov ch,getcol
      ;mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
      push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0ch
    mov [si],cx
    inc ColorOffset2
    pop si
        ; change color ya ali
      notenemyDRh52:
        ;jmp notupr 
      nodiagonalRhelph52:

      notdiagonalRh52:

      mov cl,temprow
      mov getrow,cl



      mov ch,tempcol
      mov getcol,ch

      dec getrow
      dec getCol
      dec getCol


      mov cl,getCol
      cmp cl,-1
      je nodiagonalRhelph72

      mov cl,getrow
      cmp cl,-1
      je nodiagonalRhelph72

      mov ch,getCol
      cmp ch,-2
      je nodiagonalRhelph72


      pusha
        Call FAR PTR getCellData
      popa


      
        cmp currPiece,'Z'
        ja enemyDRh72
        cmp currPiece,'*'
        jne nodiagonalRhelph72
        mov ch,getcol
        mov cl,getrow
        mov [si],cl
        mov [di],ch
        inc si
        inc di
         push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0dh
    mov [si],cx
    inc ColorOffset2
    pop si
      
      jmp notenemyDRh72
      enemyDRh72:
      ;mov ch,getcol
      ;mov cl,getrow
      mov [si],cl
      mov [di],ch
      inc si
      inc di
       push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0ch
    mov [si],cx
    inc ColorOffset2
    pop si
        ; change color ya ali
      notenemyDRh72:
        ;jmp notupr 
      nodiagonalRhelph72:

      notdiagonalRh72:

      pusha
        mov cl,temprow
        mov getrow,cl
        mov ch,tempcol
        mov getcol,ch
      popa

      inc getCol
      inc getCol
      inc getrow


      mov cl,getrow
      cmp cl,8
      je nodiagonalRhelph82
      mov cl,getCol
      cmp cl,8
      je nodiagonalRhelph82
      mov cl,getCol
      cmp cl,9
      je nodiagonalRhelph82
      pusha
        Call FAR PTR getCellData
      popa
        cmp currPiece,'Z'
        ja enemyDRh82
        cmp  currPiece,'*'
        jne nodiagonalRhelph82
        mov ch,getcol
        mov cl,getrow
        mov [si],cl
        mov [di],ch
        inc si
        inc di
          push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0dh
    mov [si],cx
    inc ColorOffset2
    pop si
      jmp notenemyDRh82
      enemyDRh82:
        mov ch,getcol
        mov cl,getrow
        mov [si],cl
        mov [di],ch
        inc si
        inc di
        push si
    lea si,CurrentMovesColors2
    add si,ColorOffset2
    mov cx,0ch
    mov [si],cx
    inc ColorOffset2
    pop si
        ; change color ya ali
      notenemyDRh82:
        ;jmp notupr 
      nodiagonalRhelph82:

      notdiagonalRh82:

      




    noth2:
flagNoPiece2:
MOV P2validateBool,0



ret
GetAvaliableMoves2 ENDP















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


HighlighCells2 PROC FAR
;cmp Highlighted2bool,1
;je exitHighlighCells2
xor SI,SI
lea SI, CurrentMovesRow2
lea di,CurrentMovesColumn2

mov ColorOffset2,0

LoopHighlight2:

mov cl,[di]
cmp cl,"|"
je exitHighlighCells2


mov ax,0
mov bx,0

mov bl,[si]
mov al,[di]
push si
lea si,CurrentMovesColors2
  add si,ColorOffset2
  mov dx,[si]
  inc ColorOffset2
pop si
;mov dx,0eh
pusha
CALL FAR PTR drawBorder
popa
xor ax,ax
xor bx,bx
inc si
inc di 
;mov Highlighted2bool,1
jmp LoopHighlight2
exitHighlighCells2:

ret
HighlighCells2 ENDP


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

freeClipboard2 Proc far
  cmp clipBoardP2,'*'
  je notFCP2
  cmp CurrentMovesColumn2,'|'
  je FCP2
  jmp notFCP2
  FCP2:
  Mov clipBoardP2,'*'
  notFCP2:
  ret
  freeClipboard2 EndP







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
  jmp exitRelease1 

  ContinueRel:

  cmp ah,28
  jne exitRelease1help11
  jmp notexitrelease11
  exitRelease1help11:
  jmp exitRelease1
  notexitrelease11:



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
  cmp clipBoardP2,'*'
  je contttr2
  mov P2validateBool,1
  contttr2:
  pusha
  call far ptr GetTimeFromInterrupt
  popa
  
 ; pusha
 ; mov bl,getrow
 ; mov bh,00h
  ;mov al,getCol
  ;dec al
  ;dec Player1square
 ; mov ah,0
  ;mov si,0
  ;mov dl,0ch
  ;mov dh,00h
 ; CALL FAR PTR drawSingleCell
 ; popa
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

  pusha
   call far ptr checkmateP2
  popa


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

  ret
  releaseClipBoard1 ENDP





releaseClipBoard2 proc far


  ;* check the input of the user if enter 
  ;* contiue for the checking phase
  ;* checking phase:
  ;* get the p1 current row and col and check if this move is valid 
  ;* if it is not valid remove the highlighting 

  cmp clipBoardP2 ,"*"
  je exitRelease1help2
  jmp notexitrelease2
  exitRelease1help2:
  jmp exitRelease12
  notexitrelease2:

  mov cl,Player2square
  mov ch,Player2square[1]

  cmp cl,clipBoardP2[1]
  je compare2ndr2

  jmp normalRealase2 
  compare2ndr2:
  cmp ch, clipBoardP2[2]
  je exitRelease1helpp22
  
  jmp notexitRelease1helpp22
  exitRelease1helpp22:
  jmp exitRelease12
  notexitRelease1helpp22:


  normalRealase2:
  mov ah,01h
  int 16h

  cmp ah,62
  je f4conditionRel2
  jmp ContinueRel2

  f4conditionRel2:
  mov f4bool,1
  jmp exitRelease12 

  ContinueRel2:


  cmp ah,16
  jne exitRelease1help112
  jmp notexitrelease112
  exitRelease1help112:
  jmp exitRelease12
  notexitrelease112:



  mov cl,Player2square
  mov getrow,cl
  mov cl,Player2square[1]
  mov getCol,cl

  

  lea di,CurrentMovesRow2
  lea si,CurrentMovesColumn2
  mov cl,getrow
  mov ch,getcol
  rc12:
  cmp cl,[di]
  je cmpr22
  jmp notcmpr22
  
  cmpr22:
  cmp ch,[si]
  je mov12
  notcmpr22:
  inc si
  inc di
  mov al,[si]
  cmp al,'|'
  je exitandreset1help2
  mov al,[di]
  cmp al,'|'
  je exitandreset1help2
  jmp rc12
  jmp notexitandreset12
  exitandreset1help2:
  jmp exitandreset12
  notexitandreset12:
  mov12:
  cmp clipBoardP1,'*'
  je contttr
  mov P1validateBool,1
  contttr:
  pusha
  call far ptr GetTimeFromInterrupt
  popa
  
 ; pusha
 ; mov bl,getrow
 ; mov bh,00h
  ;mov al,getCol
  ;dec al
  ;dec Player1square
 ; mov ah,0
  ;mov si,0
  ;mov dl,0ch
  ;mov dh,00h
 ; CALL FAR PTR drawSingleCell
 ; popa
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
 
  cmp clipBoardP2,'K'
  jne proceed2
  pusha
  mov q2,cl
  mov q2[1],ch
  popa
  proceed2:
  pusha
  call far ptr SetBrush
  popa
   pusha
  CALL FAR PTR getCellData
  mov cl,currPiece
  mov GraveP1,cl
  popa
  mov bx,brush
  mov cl,clipBoardP2
  mov[bx],cl
  
  mov cl,clipBoardP2[1]
  mov brushRow,cl
  mov getrow,cl
  mov cl,clipBoardP2[2]
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
  pusha
   call far ptr checkmateP2
  popa
  exitandreset12:
  pusha
  CALL FAR PTR ClearHighlighted2
  popa
  Call Far ptr resetcurrentmoves2

  exitRelease12:
    push ax
      cmp Clearbool,1
      je clrf2
      jmp notclrf2
      clrf2:
      mov ah,0ch
      mov al,0
      int 21h
      mov Clearbool,0
      notclrf2: 
    pop ax  

  ret
  releaseClipBoard2 ENDP




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
  Call Far PTR drawPlayer2
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
  mov  dl, 33   ;Column
  mov  dh, 20   ;Row
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

  mov  dl, 3   ;Column
  mov  dh, 20   ;Row
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
  mov  dl, 33   ;Column
  mov  dh, 20   ;Row
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

  mov  dl, 3   ;Column
  mov  dh, 20   ;Row
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

mov  al, 'P'
mov  bl, 0ah  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, '1'
mov  bl, 0ah  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

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
mov  al, 'P'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, '2'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

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
  mov f4bool , 0
  mov Player1WinsBool,0
  mov Player2WinsBool,0
  mov Player1square,6
  mov Player1square[1],4
  mov Player2square,1
  mov Player2square[1],4
  mov P1Status,20

  mov P2Status,20

mov P1Status[1],33

mov P2Status[1],3

mov Secs,0
mov Mins,0
CALL FAR PTR resetcurrentmoves1
CALL FAR PTR resetcurrentmoves2


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
mov  al, '0'
mov  bl, 03h  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h
mov  al, Mins
add al,30h
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
  jae nextnext8
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

mov  al, 'M'
mov  bl, 0ch  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'A'
mov  bl, 0ch  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'T'
mov  bl, 0ch  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'E'
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
ret
checkmateP1 endp








checkmateP2 proc far


;! checking for right and left

mov cl,q2[1]
mov ch,q2

;!left
  
  chcklefts:
  cmp cl,0
  je nextchcks 
  dec cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je chcklefts
  cmp currPiece,'Z'
  jb nextchcks
  cmp currPiece,'r'
  je checkmate1helps
  cmp currPiece,'q'
  je checkmate1helps
  nextchcks:
jmp notcheckmate11s
checkmate1helps:
jmp checkmate2
notcheckmate11s:
mov cl,q2[1]
mov ch,q2

;!right

  chckrights:
  cmp cl,7
  je nextchck1s 
  inc cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je chckrights 
  cmp currPiece,'Z'
  jb nextchck1s
  cmp currPiece,'r'
  je checkmate1hs
  cmp currPiece,'q'
  je checkmate1hs
  nextchck1s:
  jmp cont1s
  checkmate1hs:
  jmp checkmate2
  cont1s:
  mov cl,q2[1]
  mov ch,q2
;!Up
  chckups:
  cmp ch,0
  je nextchck2s 
  dec ch
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je chckups 
  cmp currPiece,'Z'
  jb nextchck2s
  cmp currPiece,'r'
  je checkmate1hhs
  cmp currPiece,'q'
  je checkmate1hhs
  nextchck2s:

  jmp cont2s
  checkmate1hhs:
  jmp checkmate2
  cont2s:
  mov cl,q2[1]
  mov ch,q2
;!Down
    chckdowns:
    cmp ch,7
    je nextchck3s
    inc ch
    pusha
    mov getrow,ch
    mov getCol,cl
    CALL FAR PTR getCellData
    popa
    cmp currPiece,'*'
    je chckdowns 
    cmp currPiece,'Z'
    jb nextchck3s
    cmp currPiece,'r'
    je checkmate1hhhs
    cmp currPiece,'q'
    je checkmate1hhhs
    nextchck3s:
    jmp cont4s
    checkmate1hhhs:
    jmp checkmate2
    cont4s:
    mov cl,q2[1]
    mov ch,q2
;!DiagonalUp
  chckdups:
  cmp ch,0
  je nextchck4s
  cmp cl,7
  je nextchck4s
  dec ch
  inc cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je chckdups 
  cmp currPiece,'Z'
  jb nextchck4s
  cmp currPiece,'b'
  je checkmate1h3s
  cmp currPiece,'q'
  je checkmate1h3s
  nextchck4s:
  
  jmp cont5s
  checkmate1h3s:
  jmp checkmate2
  cont5s:
  mov cl,q2[1]
  mov ch,q2
  ;!DiagonalDown
  chckddowns:
  cmp ch,0
  je nextchck5s
  cmp cl,0
  je nextchck5s
  dec ch
  dec cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je chckddowns 
  cmp currPiece,'Z'
  jb nextchck5s
  cmp currPiece,'b'
  je checkmate1h4s
  cmp currPiece,'q'
  je checkmate1h4s
  nextchck5s:

  jmp cont6s
  checkmate1h4s:
  jmp checkmate2
  cont6s:
  mov cl,q2[1]
  mov ch,q2
  ;!DiagonalDownR
  chckddownrs:
  cmp ch,7
  je nextchck6s
  cmp cl,7
  je nextchck6s
  inc ch
  inc cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je chckddownrs 
  cmp currPiece,'Z'
  jb nextchck6s
  cmp currPiece,'b'
  je checkmate1h7s

  cmp currPiece,'q'
  je checkmate1h7s
  nextchck6s:
  jmp cont9s
  checkmate1h7s:
  jmp checkmate2
  cont9s:

  mov cl,q2[1]
  mov ch,q2
  ;!DiagonalDownL
  chckddownls:
  cmp ch,7
  je nextchck7s
  cmp cl,0
  je nextchck7s
  inc ch
  dec cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je chckddownls 
  cmp currPiece,'Z'
  jb nextchck7s
  cmp currPiece,'b'
  je checkmate1h10s
  cmp currPiece,'q'
  je checkmate1h10s
  nextchck7s:
jmp cont10s
  checkmate1h10s:
  jmp checkmate2
  cont10s:


  ;!pawnCheck
  mov cl,q2[1]
  mov ch,q2
  cmp ch,7
  je nextnexts
  cmp cl,7
  je nextnexts
  inc ch
  inc cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je cont13s
  cmp currPiece,'Z'
  jb nextnexts
  cmp currPiece,'p'
  je checkmate1h11s

  jmp cont13s
  checkmate1h11s:
  jmp checkmate2
  cont13s:

  mov cl,q2[1]
  mov ch,q2

  nextnexts:

  cmp ch,7
  je nextnext2s
  cmp cl,0
  je nextnext2s
  inc ch
  dec cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je cont19s
  cmp currPiece,'Z'
  jb nextnext2s
  cmp currPiece,'p'
  je checkmate1h15s
  jmp cont19s
  checkmate1h15s:
  jmp checkmate2
  cont19s:
  nextnext2s:


  ;!Horse

  mov cl,q2[1]
  mov ch,q2
  cmp ch,1
  jbe nextnext3s
  cmp cl,0
  je nextnext3s
  dec ch
  dec ch
  dec cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je cont29s
  cmp currPiece,'Z'
  jb nextnext3s
  cmp currPiece,'h'
  je checkmate1h21s

  jmp cont29s
  checkmate1h21s:
  jmp checkmate2
  cont29s:

  nextnext3s:
  
  mov cl,q2[1]
  mov ch,q2
  cmp ch,1
  jbe nextnext4s
  cmp cl,7
  je nextnext4s
  dec ch
  dec ch
  inc cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je cont50s
  cmp currPiece,'Z'
  jb nextnext4s
  cmp currPiece,'h'
  je checkmate1h30s
  

  jmp cont50s
  checkmate1h30s:
  jmp checkmate2
  cont50s:

  nextnext4s:


  mov cl,q2[1]
  mov ch,q2
  cmp ch,0
  je nextnext5s
  cmp cl,6
  jae nextnext5s
  dec ch
  inc cl
  inc cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je cont51s
  cmp currPiece,'Z'
  jb nextnext5s
  cmp currPiece,'h'
  je checkmate1h31s

  jmp cont51s
  checkmate1h31s:
  jmp checkmate2
  cont51s:

  nextnext5s:


  
  mov cl,q2[1]
  mov ch,q2
  cmp ch,7
  je nextnext6s
  cmp cl,6
  jae nextnext6s
  inc ch
  inc cl
  inc cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je cont60s
  cmp currPiece,'Z'
  jb nextnext6s
  cmp currPiece,'h'
  je checkmate1h60s


  jmp cont60s
  checkmate1h60s:
  jmp checkmate2
  cont60s:
  nextnext6s:

  mov cl,q2[1]
  mov ch,q2
  cmp ch,6
  jae nextnext7s
  cmp cl,7
  jae nextnext7s
  inc ch
  inc ch
  inc cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je cont70s
  cmp currPiece,'Z'
  jb nextnext7s
  cmp currPiece,'h'
  je checkmate1h70s

  jmp cont70s
  checkmate1h70s:
  jmp checkmate2
  cont70s:

  nextnext7s:

  mov cl,q2[1]
  mov ch,q2
  cmp ch,6
  jae nextnext8s
  cmp cl,0
  jae nextnext8s
  inc ch
  inc ch
  dec cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je nextnext8s
  cmp currPiece,'Z'
  jb nextnext8s
  cmp currPiece,'h'
  je checkmate2



  nextnext8s:
   

  mov cl,q2[1]
  mov ch,q2
  cmp ch,7
  jae nextnext9s
  cmp cl,1
  jbe nextnext9s
  inc ch
  dec cl
  dec cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je nextnext9s
  cmp currPiece,'Z'
  jb nextnext9s
  cmp currPiece,'h'
  je checkmate2



  nextnext9s:

  mov cl,q2[1]
  mov ch,q2
  cmp ch,0
  jbe nextnext10s
  cmp cl,1
  jbe nextnext10s
  dec ch
  dec cl
  dec cl
  pusha
  mov getrow,ch
  mov getCol,cl
  CALL FAR PTR getCellData
  popa
  cmp currPiece,'*'
  je nextnext10s
  cmp currPiece,'Z'
  ja nextnext10s
  cmp currPiece,'h'
  je checkmate2



  nextnext10s:
  jmp notcheckmate2
checkmate2:
mov  dl, 0   ;Column
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

mov  al, 'M'
mov  bl, 0ch  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'A'
mov  bl, 0ch  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'T'
mov  bl, 0ch  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h

mov  al, 'E'
mov  bl, 0ch  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0eh  ;Teletype
int  10h
mov checkmate2bool,0
jmp exitcheckmate2
notcheckmate2:
cmp checkmate2bool,1
je exitcheckmate2
mov checkmate2bool,1
mov  dl, 0   ;Column
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
exitcheckmate2:
ret
checkmateP2 endp

















end main