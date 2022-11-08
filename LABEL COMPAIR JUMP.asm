.MODEL SMALL
.STACK 100H
.DATA
    
    RES DB ?
    REM DB 0

.CODE
    MAIN PROC
         
         MOV AX,@DATA
         MOV DS,AX
         
         MOV DL,10
         MOV BL,0
         
         
         scanNum:
                
                MOV AH,1
                INT 21H          ;INPUT IN AL (ASCII)
                
                CMP AL,13        ;CHACK IF IT IS ENTER KEY
                JE EXIT          ;CALL NEXT JUMP EXIT
                
                MOV AH,0         ;CLEAR
                SUB AL,48        ;ASCII TO DECIMAL
                
                MOV CL,AL        ;STORE AL IN CL FOR NEXT USE
                MOV AL,BL
                
                MUL DL           ;AL = AL * DL
        
                ADD AL,CL      ; PREVIOUS VALUE + NEW VALUE(PV IS MULT BY 10)
                MOV BL,AL
                MOV RES,BL
                
                
                JMP scanNum
                
                
           EXIT:
                
                ;PRINT NEWLINE
                
                MOV DL,10
                MOV AH,2
                INT 21H
                
                MOV AH,0       ;CLEAR
                MOV DL,0
                MOV BL,0
                     
                
                MOV AL,RES
                
                ;BL = 10
                
                MOV BL,10
                
                DIV BL          ;AL = AL / BL
                
                MOV REM,AH  
                
                
                ;PRINT RESULT (AL)
                
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