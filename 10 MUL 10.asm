.MODEL SMALL
.STACK 100H
.DATA
    A DB 10
    B DB 12
    
    X DB 0
    Y DB 0
    Z DB 0 
    
    
.CODE
    MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AL,A
    MOV DL,B
    
    MUL DL          ;AL = AL * DL = 12 * 10 = 120
    
    MOV ANS,DL
    
    
    MOV AH,0
    MOV BL,10 
    
    DIV BL        ;AL = 12 & AH = 0
    
    MOV Z,AH      ;AH = 0 (ASCII)
    ADD Z,48
    
    MOV AH,0
    MOV BL,10
    
    DIV BL         ;AL = 1 & AH = 2
    
    MOV Y,AH       ;AH = 2 (ASCII)
    ADD Y,48
    
    ADD AL,48
    MOV X,AL
    
    ;PRINT
    
    MOV DL,X
    MOV AH,2
    INT 21H
    
    MOV DL,Y
    MOV AH,2
    INT 21H
    
    MOV DL,Z
    MOV AH,2
    INT 21H       
        
    MOV AX,4C00H
    INT 21H    
        
    MAIN ENDP
    
END MAIN    