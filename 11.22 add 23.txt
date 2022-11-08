.MODEL SMALL
.STACK 100H
.DATA
A DB 22
B DB 23 

SUM DB ?
REM DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DL,A
    ADD DL,B
    
    MOV SUM,DL
    
    
    MOV AL,SUM
    
    
    MOV AH,0
    
    MOV BL,10
    
    DIV BL
    
    MOV REM,AH
    
    
    ;DISPLAY
    
    MOV DL,AL
    ADD DL,48
    MOV AH,2
    INT 21H
    
    
    MOV DL,REM
    ADD DL,48
    MOV AH,2
    INT 21H
    
    MOV AX,4C00H
    INT 21H
    
    MAIN ENDP

END MAIN