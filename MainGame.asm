
;PUBLIC drawCol,drawRow
;EXTRN drawSingleCell2:FAR
.MODEL Huge
.286


.STACK 64
.DATA
MULBYC DW 0
curr_draw dw 0
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
  DB '*', '*', '*', '*', '*', '*', '*', '*', '*','*', 00h, 00h, 00h, , 00h, 00h, 00h, 00h, 00h, '$'
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

getrow db 1
getcol db 4 








Pieces      DB 'R','H','B','K','Q','B','H','R'
            DB 'P','P','P','P','P','P','P','P'
            DB '*','*','*','*','*','*','*','*'
            DB '*','*','*','*','*','*','*','*'
            DB '*','*','*','*','*','*','*','*'
            DB '*','*','*','*','*','*','*','*'
            DB 'p','p','p','p','p','p','p','p'
            DB 'r','h','b','k','q','b','h','r'
            



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
                    popa
                  Call Far PTR drawPlayer1
                  Call Far PTR drawPlayer2
                    pusha 
                



jmp play
hlt
JMP O
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
;mov dl,ah
;mov ah,07         ;Read one char and put in al
;int 21h  
cmp ah,48h
jnz not_up

; delete what is inside the buffer without reading
push ax
  mov ah,0ch
  mov al,0
  int 21h
pop ax   

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

push ax
mov ah,0ch
mov al,0
int 21h
pop ax   

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

push ax
  mov ah,0ch
  mov al,0
  int 21h
pop ax   

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
push ax
mov ah,0ch
mov al,0
int 21h
pop ax   

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
push ax
  mov ah,0ch
  mov al,0
  int 21h
pop ax   

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

push ax
mov ah,0ch
mov al,0
int 21h
pop ax   

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

push ax
  mov ah,0ch
  mov al,0
  int 21h
pop ax   

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
push ax
mov ah,0ch
mov al,0
int 21h
pop ax   

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
push ax
  mov ah,0ch
  mov al,0
  int 21h
pop ax   

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

O:
end main

