.MODEL SMALL
.DATA

    A DW 7
    B DW 5
    SUM DW ?
    REM DB ?
    
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,A
    ADD AX,B
    MOV SUM,AX
    
    MOV AH,0         ;CLEAR AH    
    MOV BL,10
    DIV BL           ;RESULT IN AL (1) [ 1 IN DECIMAL ]
    
    MOV REM,AH       ;REMAINDER IN AH (2) [ 2 IN DECIMAL ]
    
    
    MOV DL,AL
    ADD DL,48         ;DL (1) + 48 = 49 >>  1 IN ASCII
    MOV AH,2
    INT 21H
    
    MOV DL,REM
    ADD DL,48         ;DL (2) + 48 = 50 >>  2 IN ASCII
    MOV AH,2
    INT 21H
    
    
    MOV AX,4C00H
    INT 21H           ;DOS
    
    MAIN ENDP
    
END MAIN    