.MODEL SMALL
.STACK 100H
.DATA
    
    MSG DB "PRESS 1(ADD 2 NUM) OR 2(SUB 2 NUM) OR 3(ADD 3 NUM) : $"
    
    NO1 DB 0  
    NO2 DB 0    
    SUM DB 0  
    REM1 DB 0
    
    
    
.CODE
    MAIN PROC
         
         MOV AX,@DATA
         MOV DS,AX
         
;PRINT MESSEGE

         MOV DX,OFFSET MSG
         MOV AH,9
         INT 21H
         
         ;NEWLINE
         
         MOV DL,10
         MOV AH,2
         INT 21H  
         
         ;CARRIAGE RETURN
         
         MOV DL,13
         MOV AH,2
         INT 21H
         
         SCANNUM:
                
                MOV AH,1
                INT 21H          ;INPUT IN AL (ASCII)
                    
                CMP AL,1        
                JE PERFORM1
                
                CMP AL,2        
                JE PERFORM2
                
                CMP AL,3        
                JE PERFORM3
                
          PERFORM1:
                
                MOV AH,1
                INT 21H         ;INPUT1
                SUB AL,48
                MOV NO1,AL
                
                MOV AH,1
                INT 21H         ;INPUT2
                SUB AL,48
                MOV NO2,AL
                
                ;ADD TWO NUMBER
                
                MOV DL,NO1
                ADD DL,NO2
                MOV SUM,DL
                
                
                ;CLEAR AH
                
                MOV AH,0 
                
                
                MOV AL,SUM
                MOV BL,10         ;BL = 10
                DIV BL
                
                ;AH = REMAINDER
                
                MOV REM1,AH 
                
                ;PRINT RESULT
                
                MOV DL,AL 
                ADD DL,48
                MOV AH,2
                INT 21H
                
                ;PRINT REMAINDER
                
                MOV DL,REM1
                ADD AL,48
                MOV AH,2
                INT 21H    
                
          PERFORM2:
          
          
          
          PERFORM3:
                
                
        
    MOV AX,4C00H
    INT 21H
        
    MAIN ENDP
    
END MAIN    