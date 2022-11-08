.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "ENTER NUMBER 1 : $"
    MSG2 DB "ENTER NUMBER 2 : $"
    MSG3 DB "ENTER NUMBER 3 : $"
    
    NO1 DB 0
    NO2 DB 0
    NO3 DB 0
    
    SUM DB 0
    
    REM1 DB 0
    REM2 DB 0
    
    
.CODE
    MAIN PROC
    
    
    MOV AX,@DATA
    MOV DS,AX             ;INITIALIZE DATA SEGMENT
    
    
    
    
    
    
    ;PRINT FIRST MESSEGE
    
    MOV DX,OFFSET MSG1
    MOV AH,9              ;FOR PRINTING STRING AH = 9
    INT 21H
    
    
    ;TAKE FIRST INPUT
    
    MOV AH,1
    INT 21H                ;INPUT IN AL (ASCII) NOT AH
    
    SUB AL,48              ;ASCII TO DECIMAL
    MOV NO1,AL
    
     
    ;PRINT NEWLINE
    
    MOV DL,10              
    MOV AH,2
    INT 21H
    
    ;CARRIAGE RETURN 
    
    MOV DL,13
    MOV AH,2
    INT 21H
      
      
     
     
     
    ;PRINT SECOND MESSEGE
    
    MOV DX,OFFSET MSG2
    MOV AH,9              ;FOR PRINTING STRING AH = 9
    INT 21H
         
     
    ;TAKE SECOND INPUT
    
    MOV AH,1
    INT 21H                ;INPUT IN AL (ASCII) NOT AH
    
    SUB AL,48              ;ASCII TO DECIMAL
    MOV NO2,AL
    
     
    ;PRINT NEWLINE
    
    MOV DL,10              
    MOV AH,2
    INT 21H
    
    ;CARRIAGE RETURN 
    
    MOV DL,13
    MOV AH,2
    INT 21H    
    
    
       
       
       
    
    ;PRINT THIRD MESSEGE
    
    MOV DX,OFFSET MSG3
    MOV AH,9              ;FOR PRINTING STRING AH = 9
    INT 21H
         
     
    ;TAKE THIRD INPUT
    
    MOV AH,1
    INT 21H                ;INPUT IN AL (ASCII) NOT AH
    
    SUB AL,48              ;ASCII TO DECIMAL
    MOV NO3,AL
    
    
    ;PRINT NEWLINE
    
    MOV DL,10              
    MOV AH,2
    INT 21H
    
    ;CARRIAGE RETURN 
    
    MOV DL,13
    MOV AH,2
    INT 21H    
       
    
    
    
    
    ;ADDITION  (PART 1)
    
    MOV DL,NO1
    ADD DL,NO2 
    
    
    ;FIRST SUM
    
    MOV SUM,DL  
    
    
    ;MOVE SUM TO AL
    
    MOV AL,SUM
    
     
    ;CLEAR AH
    
    MOV AH,0
    
    ;TAKE BL = 10
    
    MOV BL,10
    
    ;DIV BL = AL / BL  >> AL = RESULT & AH = REMAINDER
    
    DIV BL
    
    ;MOVE AH TO REMAINDER
    
    MOV REM1,AH
                 
     
     
    ;ADDITION  (PART 2)
    
    MOV AH,REM1
    
    ADD AH,NO3    
    
    ;SECOND SUM
    
    MOV REM2,AH
    
                     
    ;DISPLAY RESULT

    MOV DL,AL
    ADD DL,48     ;CONVERTED INTO ASCII
    
    MOV AH,2
    INT 21H  
     
                 
                 
                 
    ;DISPLAY REMAINDER

    MOV DL,REM2
    ADD DL,48     ;CONVERTED INTO ASCII
    
    MOV AH,2
    INT 21H 
        
    MOV AX,4C00H
    INT 21H            ;DOS
        
    MAIN ENDP
    
END MAIN    