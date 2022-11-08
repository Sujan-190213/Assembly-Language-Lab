.MODEL SMALL
.STACK 100H
.DATA

    MSG1 DB "ENTER NUMBER 1 : $"
    MSG2 DB "ENTER NUMBER 2 : $" 
    MSG3 DB "DIVISION IS : $"  
    MSG4 DB "REMAINDER IS : $"
    
    A DB ?
    B DB ?
    QUO DB ?
    REM DB ?
    
.CODE
    MAIN PROC
     
     MOV AX,@DATA
     MOV DS,AX
       
     ;PRINT FIRST MESSEGE 

     MOV DX,OFFSET MSG1
     MOV AH,9
     INT 21H 
          
     ;INPUT 1
     
     MOV AH,1
     INT 21H
     SUB AL,48
     MOV A,AL 
     
     ;NEWLINE
     
     MOV DL,10
     MOV AH,2
     INT 21H
     
     ;CARRIAGE RETURN 
     
     MOV DL,13
     MOV AH,2
     INT 21H
     
     ;PRINT SECOND MESSEGE 

     MOV DX,OFFSET MSG2
     MOV AH,9
     INT 21H  
     
     ;INPUT 2
     
     MOV AH,1
     INT 21H
     SUB AL,48
     MOV B,AL
     
     ;NEWLINE
     
     MOV DL,10
     MOV AH,2
     INT 21H
     
     ;CARRIAGE RETURN 
     
     MOV DL,13
     MOV AH,2
     INT 21H
     
     ;PRINT THIRD MESSEGE
    
     MOV DX,OFFSET MSG3
     MOV AH,9
     INT 21H
     
     
     ;DIVISION
     
     MOV AL,A
     MOV AH,0
     
     MOV BL,B
     DIV BL      ;AL = RESULT & AH = REMAINDER
     
     MOV QUO,AL
     MOV REM,AH
     
     MOV DL,QUO
     ADD DL,48
     MOV AH,2
     INT 21H
     
     ;NEWLINE
     
     MOV DL,10
     MOV AH,2
     INT 21H
     
     ;CARRIAGE RETURN 
     
     MOV DL,13
     MOV AH,2
     INT 21H
     
     ;PRINT FOURTH MESSEGE 

     MOV DX,OFFSET MSG4
     MOV AH,9
     INT 21H  
     
     MOV DL,REM
     ADD DL,48
     MOV AH,2
     INT 21H
        
     MOV AX,4C00H
     INT 21H   
        
    MAIN ENDP
    
END MAIN    