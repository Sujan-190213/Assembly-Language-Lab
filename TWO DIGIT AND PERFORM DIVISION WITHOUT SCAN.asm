.MODEL SMALL
.STACK 100H
.DATA
    QUO DW ?
    REM DW ?
    
.CODE
    MAIN PROC
     
     MOV AX,@DATA
     MOV DS,AX  
     
     MOV AX,26
     MOV DX,0
     
     MOV BX,5
     DIV BX
     
     MOV QUO,AX
     MOV REM,DX
     
     MOV DX,QUO
     ADD DX,48
     MOV AH,2
     INT 21H
     
     ;NEWLINE
     
     MOV DX,10
     MOV AH,2
     INT 21H
     
     ;CARRIAGE RETURN 
     
     MOV DX,13
     MOV AH,2
     INT 21H
     
     MOV DX,REM
     ADD DX,48
     MOV AH,2
     INT 21H
        
     MOV AX,4C00H
     INT 21H   
        
    MAIN ENDP
    
END MAIN    