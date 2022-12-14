.MODEL SMALL

.STACK 100H

.DATA
    A DW 500
    B DW 245
    ID DW 13     ;HERE IS MY ID
    SUBT DW ?    ;SUBTRACTION RESULT
    AD DW ?      ;RESULT AFTER SUBTRACTION
    REM1 DW ?
    REM2 DW ?
    RES1 DB ?     ;HERE ALL REM IS USE FOR ACCESSING INDIVIDUAL ELEMENT
    REM3 DW ?
    REM4 DW ?
    RES2 DB ?
    MSG1 DB 'FIRST RESULT IS: $'
    MSG2 DB 'SECOND RESULT IS: $'      ;MSG1 AND MSG2 ARE ARE MESSEGE
.CODE
MAIN PROC 
    
    MOV AX,@DATA             ;INCLUDING DAATA SEGMENT IN CODE SEGMENT
    MOV DS,AX 
    
    
    ;CALCULATION FOR SUBTRACTION
    
    MOV AX,A
    SUB AX,B
    MOV SUBT,AX      ;RESULT PUT INTO SUBT VARIABLE
    
    ;PRINT SUBTRACTION RESULT
    
    MOV BX,10           ;ASSIGN BX = 10 FOR DIVIDING THE SUBTRACT RESULT
    DIV BX
    MOV REM1,DX         ;LAST DIGIT OF SUBT VARIABLE
    MOV DX,0
    DIV BX
    MOV REM2,DX         ;SECOND DIGIT OF SUBT VARIABLE
    MOV RES1,AL         ;FIRST DIGIT OF SUBT VARIABLE
    
    LEA DX,MSG1         ;SHOWING FIRST MESSEGE
    MOV AH,9
    INT 21H
    
    MOV DL,RES1         
    ADD DL,48           ;CONVERT DECIMAL TO ASCII
    MOV AH,2
    INT 21h             ;PRINT FIRST DIGIT OF SUBT VARIABLE ON SCREEN
    
    MOV AX,REM2
    MOV DL,AL           
    ADD DL,48           ;CONVERT DECIMAL TO ASCII
    MOV AH,2            ;PRINT SECOND DIGIT OF SUBT VARIABLE ON SCREEN
    INT 21H
    
    MOV AX,REM1
    MOV DL,AL
    ADD DL,48           ;CONVERT DECIMAL TO ASCII
    MOV AH,2            ;PRINT LAST DIGIT OF SUBT VARIABLE ON SCREEN
    INT 21H
    
    
    ;NEWLINE
    
    MOV DL,10
    MOV AH,2
    INT 21H
    
    ;CARRIAGE RETURN 
    
    MOV DL,13
    MOV AH,2
    INT 21H 
    
    ;CALCULATION FOR ADDITION (WITH MY ID)
    
    MOV AX,SUBT
    ADD AX,ID          ;ADD ID WITH SUBTRACT VALUE 
    MOV AD,AX
          
    MOV AX,AD
    MOV DX,0           ;CLEAR DX REGISTER
    ;PRINT ADDITION PART (WITH MY ID)
    
    
    MOV BX,10       ;ASSIGN BX = 10 FOR DIVIDING THE ADDITION RESULT
    DIV BX
    MOV REM3,DX     ;LAST DIGIT OF AD VARIABLE
    MOV DX,0
    DIV BX
    MOV REM4,DX     ;SECOND DIGIT OF AD VARIABLE
    MOV RES2,AL     ;FIRST DIGIT OF AD VARIABLE
    
    LEA DX,MSG2
    MOV AH,9         ;SHOWING SECOND MESSEGE
    INT 21H
    
    MOV DL,RES2
    ADD DL,48        ;CONVERT DECIMAL TO ASCII
    MOV AH,2         ;PRINT FIRST DIGIT OF AD VARIABLE ON SCREEN
    INT 21h
    
    MOV AX,REM4
    MOV DL,AL
    ADD DL,48        ;CONVERT DECIMAL TO ASCII
    MOV AH,2         ;PRINT SECOND DIGIT OF AD VARIABLE ON SCREEN
    INT 21H
    
    MOV AX,REM3
    MOV DL,AL
    ADD DL,48       ;CONVERT DECIMAL TO ASCII
    MOV AH,2        ;PRINT LAST DIGIT OF AD VARIABLE ON SCREEN
    INT 21H
    
    
    ;RETURN ACCESS TO DOS       
        
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN