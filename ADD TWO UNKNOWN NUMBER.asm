.MODEL SMALL
.STACK 100H 
.DATA

VAR1 DB ?          ;UNKNOWN NUMBER
VAR2 DB ?
 
.CODE

MAIN PROC
      MOV AX,@DATA
      MOV DS,AX
      
      MOV AH,1
      INT 21H         ;INPUT VAR1
      MOV VAR1,AL
      
      MOV AH,2
      MOV DL,10       ;PRINT NEWLINE
      INT 21H
      
      MOV AH,2
      MOV DL,13       ;CARRIAGE RETURN
      INT 21H
      
      MOV AH,1
      INT 21H        ;INPUT VAR2
      MOV VAR2,AL
      
      MOV AH,2
      MOV DL,10       ;PRINT NEWLINE
      INT 21H
      
      MOV AH,2
      MOV DL,13       ;CARRIAGE RETURN
      INT 21H
      
      MOV BL,VAR1
      ADD BL,VAR2      ;ADD VAR1,VAR2
      
      MOV AH,2
      MOV DL,BL
      SUB DL,48
      INT 21H 
   
   MOV AH,4CH
   INT 21H 
   MAIN ENDP
END MAIN
