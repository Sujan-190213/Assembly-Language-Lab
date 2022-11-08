.MODEL SMALL
.STACK 100H
.DATA
RES DB 0
REM DB 0

.CODE

MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DL,0
    MOV BL,1
    
    ;CLEAR CX
    
    XOR CX,CX
    
    MOV CX,5
    
    scanNum:
           
            ADD DL,BL
            ADD BL,3
            
            LOOP scanNum
    
         MOV RES,DL
         
         ;PRINT NEWLINE
         
         MOV DL,10 
         MOV AH,2
         INT 21H
         
         ;CLEAR AH 
         
         MOV AH,0
         
         ;AL = RES
         
         MOV BL,10
         
         MOV AL,RES
         
         DIV DL
         
        MOV REM,AH
        
        
        ;PRINT RESULT 
        
        MOV DL,AL
        ADD DL,48
        MOV AH,2
        INT 21H
        
        ;PRINT REMAINDER
        
        MOV DL,REM
        
        ADD DL,48
        
        MOV AH,2
        INT 21H
        
        MOV AX,4C00H
        INT 21H
         
    
    MAIN ENDP

END MAIN