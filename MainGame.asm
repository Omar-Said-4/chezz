
;PUBLIC drawCol,drawRow
;EXTRN drawSingleCell2:FAR
.MODEL Huge
.286


.STACK 64
.DATA
MULBYC DW 0
drawbool db 0
curr_draw dw 0
SecondCellColor dw 0 
CoolDownColor  db 0ch
MULBYR DW 0
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
  DB '*', '*', '*', '*', '*', '*','*', '*', 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,'$'  
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
 DB  '*', '*', '*','*', '*', '*', '*', '*', '*', '*','*', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, '$' 
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
 DB  '*', '*','*', '*', '*', '*', '*','*', '*', '*', '*', 00h, 00h, 00h, 00h, 00h, 00h, '$' 
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


; Color Matrix
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


clipBoardP1 db '*'


getrow db 1
getcol db 4 


temprow db 0
tempcol db 0

Clearbool db 0






Pieces      DB 'R','H','B','K','Q','B','H','R'
            DB 'P','P','P','P','P','P','P','P'
            DB '*','h','*','h','*','h','*','H'
            DB '*','P','r','*','*','R','*','h'
            DB '*','*','B','k','B','*','*','*'
            DB '*','*','*','Q','Q','H','*','*'
            DB 'p','p','p','p','P','p','p','p'
            DB 'r','h','b','k','q','b','h','r'
            



CurrentMovesColumn DB 32 dup("|")
CurrentMovesRow DB 32 dup("|")
CurrentMovesColors DB 32 dup(0eh)

ColorOffset DW 0

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
                mov  ax,0A000h
                mov  es,ax
                mov  ah,0
                mov  al,13h
                int  10h

                pusha
                call FAR PTR ChessBoard
                popa

                  Call Far PTR drawPlayer1
                  Call Far PTR drawPlayer2
                  
                pusha 
                CALL FAR PTR drawAllPieces
                popa
play:
                CALL FAR PTR drawAllPieces
                CALL FAR PTR CheckP1Moves
                CALL FAR PTR CheckP2Moves
                CALL FAR PTR drawAllPieces
                CALL FAR PTR CheckPlayerOverlap
              ; pusha
                CALL FAR PTR GetAvaliableMoves
              ;  popa 


                CALL FAR PTR HighlighCells



jmp play
hlt

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

; gets cell row and col then draws it
drawPlayer1 proc far
mov al,Player1square
mov ah,Player1square[1]
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
ret
drawPlayer2 ENDP
getCellData proc far

mov cl,getrow
lea si,Board
lea di,Pieces

cmp getrow,0
je nextget
outer_getter1:
mov ch,8
inner_getter1:
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
inc Clearbool
notclr1:
;mov dl,ah
;mov ah,07         ;Read one char and put in al
;int 21h  
cmp ah,48h
jnz not_up

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
mov  ax,bx
mov bh,0
mov  bl,getrow
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
jnz not_down

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
jnz not_left

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
jnz not_right

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
;mov dl,ah
;mov ah,07         ;Read one char and put in al
;int 21h  
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

                  
                  sub di,39

                  pusha
                    mov bp , 20
                    drawlineVertical:
                    mov cx,1
                    add  di,319
                    rep  stosb
                    dec bp
                    cmp bp,0
                    jne drawlineVertical
                  popa
                  


                  pusha
                    add di,39
                    mov bp , 20
                    drawlineVertical2nd:
                    mov cx,1
                    add  di,319
                    rep  stosb
                    dec bp
                    cmp bp,0
                    jne drawlineVertical2nd
                  popa

                  
                  add di,6400
                  

                  mov cx,39
                  mov  al,dl
                  looping12357:       
                  rep  stosb
                  dec  bx
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
jmp doneoverlap
no_player_overlap:
cmp drawbool,1
jnz doneoverlap
CALL FAR PTR drawPlayer1
CALL FAR PTR drawPlayer2
mov drawbool,0
doneoverlap:
ret
CheckPlayerOverlap ENDP


GetAvaliableMoves proc far

;lea BX,CurrentMovesRow
Mov ColorOffset,0
xor SI,SI
lea SI , CurrentMovesRow
;mov SI,BX
cmp clipBoardP1,'*'
jne flagNoPieceHelp
xor di,di
lea di,CurrentMovesColumn
mov ah,01h
int 16h
;mov dl,ah
;mov ah,07         ;Read one char and put in al
;int 21h  

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
jmp NotflagnoPiece
flagNoPieceHelpr:
jmp flagNoPiece
NotflagnoPiece:
mov clipBoardP1,bl
; pawn movements
;!pawn
  cmp bl,"p"
  jne notphelp
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
  notEmpty1:
  dec getcol
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
    jg nodiagonalRhelph2
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
    jg nodiagonalRhelph3
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
    jg nodiagonalRhelph4
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


push ax
cmp Clearbool,1
je clrf
jmp notclrf
clrf:
  mov ah,0ch
  mov al,0
  int 21h
  dec Clearbool
  notclrf:
 ;mov  ah, 00h        ; BIOS.ReadKeyboardCharacter
 ; int  16h 
pop ax  

ret
GetAvaliableMoves ENDP





HighlighCells PROC FAR

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
jmp LoopHighlight

exitHighlighCells:

ret
HighlighCells ENDP
end main