
.MODEL SMALL
.STACK 100H
.DATA
    NO1 DW 120
    NO2 DW 110
    
    SUM DW ?  
    REM1 DB ?
    REM2 DB ?
    
    
.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AX, NO1 
    ;SUB AX,NO2
    ;ADD AX, NO2
    ;MUL NO2
    MOV SUM, AX
    
    MOV AH, 0  
    MOV BL, 10
    DIV BL     
    MOV REM1, AH
    
    MOV AH, 0   
    MOV BL, 10
    DIV BL   
    MOV REM2, AH
    
    MOV DL, AL
    ADD DL, 48
    MOV AH, 2
    INT 21H
    
    MOV DL, REM2
    ADD DL, 48
    MOV AH, 2
    INT 21H
    
    MOV DL, REM1
    ADD DL, 48
    MOV AH, 2
    INT 21H
    
    MOV AX, 4C00H
    INT 21H
    
MAIN ENDP
END MAIN